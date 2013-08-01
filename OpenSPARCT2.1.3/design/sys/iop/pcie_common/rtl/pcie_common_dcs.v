// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_common_dcs.v
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
module pcie_common_dcs 
  (
   clk,				// source clock
   rst_l,			// reset
   csr_rng_data,		// ring data
   csr_pkt_ack,			// packet acknowledge
   csr_pkt_data,		// packet data
   csr_pkt_req			// packet request
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter     QD = 3,	 		  	// queue depth
		QW = `FIRE_CSR_RING_WDTH;	// queue width

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input 				clk;
  input 				rst_l;
  input  [`FIRE_CSR_RING_BITS]		csr_rng_data;
  input 				csr_pkt_ack;

  output [`FIRE_CSR_PCKT_BITS]		csr_pkt_data;
  output 				csr_pkt_req;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_PCKT_BITS]		csr_pkt_data;
  wire					csr_pkt_req;
  wire					ism2osm_vld;
  wire [QD-2:0] 			ism2sdp_ds;
  wire [QD-1:0]				ism2sdp_ld;
  wire					osm2ism_deq;
  wire [2:0]				osm2sdp_ld;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------
  pcie_common_dcs_ism #(QD) ism
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .csr_rng_cmd	(csr_rng_data[`FIRE_CSR_RING_CMND_BITS]),
     .osm2ism_deq	(osm2ism_deq),
     .ism2osm_vld	(ism2osm_vld),
     .ism2sdp_ds	(ism2sdp_ds),
     .ism2sdp_ld	(ism2sdp_ld)
     );

  pcie_common_dcs_osm osm
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .csr_pkt_ack	(csr_pkt_ack),
     .ism2osm_vld	(ism2osm_vld),
     .csr_pkt_req	(csr_pkt_req),
     .osm2ism_deq	(osm2ism_deq),
     .osm2sdp_ld	(osm2sdp_ld)
     ); 
  
  pcie_common_dcs_sdp #(QD, QW) sdp
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .csr_rng_data	(csr_rng_data),
     .ism2sdp_ld	(ism2sdp_ld),
     .ism2sdp_ds	(ism2sdp_ds),
     .osm2sdp_ld	(osm2sdp_ld),
     .csr_pkt_data	(csr_pkt_data)
     );

endmodule // pcie_common_dcs
