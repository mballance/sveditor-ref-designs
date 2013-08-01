// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_common_dcs_sdp.v
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
module pcie_common_dcs_sdp 
  (
   clk,				// source clock
   rst_l,			// reset
   csr_rng_data,		// ring data
   ism2sdp_ld,			// ism load
   ism2sdp_ds,			// ism data select
   osm2sdp_ld,			// ism load
   csr_pkt_data			// packet data
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter     QD = 3,	     	 		// queue depth
		QW = `FIRE_CSR_RING_WDTH;	// queue width

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input 				clk;
  input 				rst_l;
  input  [`FIRE_CSR_RING_BITS]		csr_rng_data;
  input  [QD-1:0]			ism2sdp_ld;
  input  [QD-2:0]			ism2sdp_ds;
  input	 [2:0]				osm2sdp_ld;

  output [`FIRE_CSR_PCKT_BITS]		csr_pkt_data;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_PCKT_BITS]		csr_pkt_data;
  wire [QW-1:0]				qdi, qdo;

  reg  [`FIRE_CSR_RING_BITS]		data [0:2];
  reg  [QW-1:0] 			que [0:QD-1];

  integer i;

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
  assign qdi = csr_rng_data;
  assign qdo = que[0];

  assign csr_pkt_data = {data[2], data[1], data[0]};

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) 
    if (!rst_l) begin : que_rst
	integer j;
    for (j = 0; j < QD; j = j + 1) begin
       que[j] <= {QW{1'b0}};
	end
     end
	else begin
    for (i = 0; i < QD-1; i = i + 1) begin
      if (ism2sdp_ld[i]) que[i] <= ism2sdp_ds[i] ? que[i+1] : qdi;
    end
    if (ism2sdp_ld[QD-1]) que[QD-1] <= qdi;
  end

  always @ (posedge clk) begin
    if (!rst_l) begin
      data[2] <= 0;
      data[1] <= 0;
      data[0] <= 0;
    end
    else begin
      if (osm2sdp_ld[2]) data[2] <= qdo;
      if (osm2sdp_ld[1]) data[1] <= qdo;
      if (osm2sdp_ld[0]) data[0] <= qdo;
    end
  end
  
endmodule // pcie_common_dcs_sdp
