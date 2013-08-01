// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_common_ccc_cdp.v
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
module dmu_common_ccc_cdp 
  (
   clk,
   rst_l,

   csr_host_0_addr,
   csr_host_0_data,
   csr_host_0_src_bus_id,
   csr_host_0_wr,

   csr_host_1_addr,
   csr_host_1_data,
   csr_host_1_src_bus_id,
   csr_host_1_wr,

   csr_host_2_addr,
   csr_host_2_data,
   csr_host_2_src_bus_id,
   csr_host_2_wr,

   csr_host_3_addr,
   csr_host_3_data,
   csr_host_3_src_bus_id,
   csr_host_3_wr,

   csr_host_bit_check_mask,

   arb2cdp_sel,
   dep2cdp_data,
   fsm2cdp_stts,

   csr_host_0_done_status,
   csr_host_0_read_data,

   csr_host_1_done_status,
   csr_host_1_read_data,

   csr_host_2_done_status,
   csr_host_2_read_data,

   csr_host_3_done_status,
   csr_host_3_read_data,

   cdp2fsm_error,

   cdp2pkt_addr,
   cdp2pkt_data,
   cdp2pkt_src_bus,
   cdp2pkt_wr
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input  [`FIRE_CSR_ADDR_BITS]		csr_host_0_addr;
  input  [`FIRE_CSR_DATA_BITS]		csr_host_0_data;
  input  [`FIRE_CSR_SRCB_BITS]		csr_host_0_src_bus_id;
  input 				csr_host_0_wr;

  input  [`FIRE_CSR_ADDR_BITS]		csr_host_1_addr;
  input  [`FIRE_CSR_DATA_BITS]		csr_host_1_data;
  input  [`FIRE_CSR_SRCB_BITS]		csr_host_1_src_bus_id;
  input 				csr_host_1_wr;

  input  [`FIRE_CSR_ADDR_BITS]		csr_host_2_addr;
  input  [`FIRE_CSR_DATA_BITS]		csr_host_2_data;
  input  [`FIRE_CSR_SRCB_BITS]		csr_host_2_src_bus_id;
  input 				csr_host_2_wr;

  input  [`FIRE_CSR_ADDR_BITS]		csr_host_3_addr;
  input  [`FIRE_CSR_DATA_BITS]		csr_host_3_data;
  input  [`FIRE_CSR_SRCB_BITS]		csr_host_3_src_bus_id;
  input 				csr_host_3_wr;

  input  [`FIRE_CSR_ADDR_BITS]		csr_host_bit_check_mask;

  input  [`FIRE_CSR_SRCB_BITS]		arb2cdp_sel;
  input  [`FIRE_CSR_DATA_BITS]		dep2cdp_data;
  input  [`FIRE_CSR_STTS_BITS]		fsm2cdp_stts;

  output [`FIRE_CSR_STTS_BITS]		csr_host_0_done_status;
  output [`FIRE_CSR_DATA_BITS]		csr_host_0_read_data;

  output [`FIRE_CSR_STTS_BITS]		csr_host_1_done_status;
  output [`FIRE_CSR_DATA_BITS]		csr_host_1_read_data;

  output [`FIRE_CSR_STTS_BITS]		csr_host_2_done_status;
  output [`FIRE_CSR_DATA_BITS]		csr_host_2_read_data;

  output [`FIRE_CSR_STTS_BITS]		csr_host_3_done_status;
  output [`FIRE_CSR_DATA_BITS]		csr_host_3_read_data;

  output				cdp2fsm_error;

  output [`FIRE_CSR_ADDR_BITS]		cdp2pkt_addr;
  output [`FIRE_CSR_DATA_BITS]		cdp2pkt_data;
  output [`FIRE_CSR_SRCB_BITS]		cdp2pkt_src_bus;
  output				cdp2pkt_wr;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_STTS_BITS]		csr_host_0_done_status;
  wire [`FIRE_CSR_DATA_BITS]		csr_host_0_read_data;

  wire [`FIRE_CSR_STTS_BITS]		csr_host_1_done_status;
  wire [`FIRE_CSR_DATA_BITS]		csr_host_1_read_data;

  wire [`FIRE_CSR_STTS_BITS]		csr_host_2_done_status;
  wire [`FIRE_CSR_DATA_BITS]		csr_host_2_read_data;

  wire [`FIRE_CSR_STTS_BITS]		csr_host_3_done_status;
  wire [`FIRE_CSR_DATA_BITS]		csr_host_3_read_data;

  wire 					cdp2fsm_error;

  wire [`FIRE_CSR_ADDR_BITS]		cdp2pkt_addr;
  wire [`FIRE_CSR_DATA_BITS]		cdp2pkt_data;
  wire [`FIRE_CSR_SRCB_BITS]		cdp2pkt_src_bus;
  wire 					cdp2pkt_wr;

  reg  [`FIRE_CSR_ADDR_BITS]		addr, nxt_addr;
  reg  [`FIRE_CSR_DATA_BITS]		data, nxt_data;
  reg  [`FIRE_CSR_SRCB_BITS]		srcb, nxt_srcb;
  reg 					wr, nxt_wr;

  reg  [`FIRE_CSR_STTS_BITS]		host_stts;
  reg  [`FIRE_CSR_DATA_BITS]		host_data;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
// csr host done status and read data
  assign csr_host_0_done_status = host_stts;
  assign csr_host_0_read_data   = host_data;

  assign csr_host_1_done_status = host_stts;
  assign csr_host_1_read_data   = host_data;

  assign csr_host_2_done_status = host_stts;
  assign csr_host_2_read_data   = host_data;

  assign csr_host_3_done_status = host_stts;
  assign csr_host_3_read_data   = host_data;

// finite state machine error
  assign cdp2fsm_error   = |(nxt_addr & csr_host_bit_check_mask);

// packetizer address, data, source bus id, and write
  assign cdp2pkt_addr    = addr;
  assign cdp2pkt_data    = data;
  assign cdp2pkt_src_bus = srcb;
  assign cdp2pkt_wr      = wr;
  
// csr host address select
  always @ (arb2cdp_sel or csr_host_0_addr or csr_host_1_addr or
	    csr_host_2_addr or csr_host_3_addr) begin
    case (arb2cdp_sel) // synopsys infer_mux
      2'b00 : nxt_addr = csr_host_0_addr;
      2'b01 : nxt_addr = csr_host_1_addr;
      2'b10 : nxt_addr = csr_host_2_addr;
      2'b11 : nxt_addr = csr_host_3_addr;
    endcase
  end

// csr host data select
  always @ (arb2cdp_sel or csr_host_0_data or csr_host_1_data or
	    csr_host_2_data or csr_host_3_data) begin
    case (arb2cdp_sel) // synopsys infer_mux
      2'b00 : nxt_data = csr_host_0_data;
      2'b01 : nxt_data = csr_host_1_data;
      2'b10 : nxt_data = csr_host_2_data;
      2'b11 : nxt_data = csr_host_3_data;
    endcase
  end

// csr host source bus id select
  always @ (arb2cdp_sel or csr_host_0_src_bus_id or csr_host_1_src_bus_id or
	    csr_host_2_src_bus_id or csr_host_3_src_bus_id) begin
    case (arb2cdp_sel) // synopsys infer_mux
      2'b00 : nxt_srcb = csr_host_0_src_bus_id;
      2'b01 : nxt_srcb = csr_host_1_src_bus_id;
      2'b10 : nxt_srcb = csr_host_2_src_bus_id;
      2'b11 : nxt_srcb = csr_host_3_src_bus_id;
    endcase
  end

// csr host write select
  always @ (arb2cdp_sel or csr_host_0_wr or csr_host_1_wr or
	    csr_host_2_wr or csr_host_3_wr) begin
    case (arb2cdp_sel) // synopsys infer_mux
      2'b00 : nxt_wr = csr_host_0_wr;
      2'b01 : nxt_wr = csr_host_1_wr;
      2'b10 : nxt_wr = csr_host_2_wr;
      2'b11 : nxt_wr = csr_host_3_wr;
    endcase
  end

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    addr <= nxt_addr;
    data <= nxt_data;
    srcb <= nxt_srcb;
    wr   <= nxt_wr;
  end

  always @ (posedge clk) begin
    if (!rst_l) begin
      host_data <= 0;
      host_stts <= 0;
    end
    else begin
      host_data <= dep2cdp_data;
      host_stts <= fsm2cdp_stts;
    end
  end

endmodule // dmu_common_ccc_cdp
