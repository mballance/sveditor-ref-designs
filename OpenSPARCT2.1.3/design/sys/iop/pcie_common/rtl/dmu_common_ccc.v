// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_common_ccc.v
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
module dmu_common_ccc 
  (
   csr_host_0_done,
   csr_host_0_done_status,
   csr_host_0_read_data,
   csr_host_1_done,
   csr_host_1_done_status,
   csr_host_1_read_data,
   csr_host_2_done,
   csr_host_2_done_status,
   csr_host_2_read_data,
   csr_host_3_done,
   csr_host_3_done_status,
   csr_host_3_read_data,
   csr_ring_out,
   clk,
   rst_l,
   csr_ring_in,
   csr_host_0_req,
   csr_host_0_addr,
   csr_host_0_data,
   csr_host_0_wr,
   csr_host_0_src_bus_id,
   csr_host_1_req,
   csr_host_1_addr,
   csr_host_1_data,
   csr_host_1_wr,
   csr_host_1_src_bus_id,
   csr_host_2_req,
   csr_host_2_addr,
   csr_host_2_data,
   csr_host_2_wr,
   csr_host_2_src_bus_id,
   csr_host_3_req,
   csr_host_3_addr,
   csr_host_3_data,
   csr_host_3_wr,
   csr_host_3_src_bus_id,
   csr_host_bit_check_mask,
   done_timeout_value,
   ccc_idle
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  output				csr_host_0_done;
  output [`FIRE_CSR_STTS_BITS]		csr_host_0_done_status;
  output [`FIRE_CSR_DATA_BITS]		csr_host_0_read_data;
  output 				csr_host_1_done;
  output [`FIRE_CSR_STTS_BITS]		csr_host_1_done_status;
  output [`FIRE_CSR_DATA_BITS]		csr_host_1_read_data;
  output 				csr_host_2_done;
  output [`FIRE_CSR_STTS_BITS]		csr_host_2_done_status;
  output [`FIRE_CSR_DATA_BITS]		csr_host_2_read_data;
  output 				csr_host_3_done;
  output [`FIRE_CSR_STTS_BITS]		csr_host_3_done_status;
  output [`FIRE_CSR_DATA_BITS]		csr_host_3_read_data;
  output [`FIRE_CSR_RING_BITS]		csr_ring_out;
  output 				ccc_idle;

  input 				clk;
  input 				rst_l; 
  input  [`FIRE_CSR_RING_BITS]		csr_ring_in;

  input 				csr_host_0_req;
  input  [`FIRE_CSR_ADDR_BITS]		csr_host_0_addr;
  input  [`FIRE_CSR_DATA_BITS]		csr_host_0_data;
  input 				csr_host_0_wr;
  input  [`FIRE_CSR_SRCB_BITS]		csr_host_0_src_bus_id;

  input 				csr_host_1_req;
  input  [`FIRE_CSR_ADDR_BITS]		csr_host_1_addr;
  input  [`FIRE_CSR_DATA_BITS]		csr_host_1_data;
  input 				csr_host_1_wr;
  input  [`FIRE_CSR_SRCB_BITS]		csr_host_1_src_bus_id;

  input 				csr_host_2_req;
  input  [`FIRE_CSR_ADDR_BITS]		csr_host_2_addr;
  input  [`FIRE_CSR_DATA_BITS]		csr_host_2_data;
  input 				csr_host_2_wr;
  input  [`FIRE_CSR_SRCB_BITS]		csr_host_2_src_bus_id;

  input 				csr_host_3_req;
  input  [`FIRE_CSR_ADDR_BITS]		csr_host_3_addr;
  input  [`FIRE_CSR_DATA_BITS]		csr_host_3_data;
  input 				csr_host_3_wr;
  input  [`FIRE_CSR_SRCB_BITS]		csr_host_3_src_bus_id;

  input  [`FIRE_CSR_ADDR_BITS]		csr_host_bit_check_mask;

  input  [`FIRE_CSR_TOUT_BITS]		done_timeout_value;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire					csr_host_0_done;
  wire [`FIRE_CSR_STTS_BITS]		csr_host_0_done_status;
  wire [`FIRE_CSR_DATA_BITS]		csr_host_0_read_data;
  wire 					csr_host_1_done;
  wire [`FIRE_CSR_STTS_BITS]		csr_host_1_done_status;
  wire [`FIRE_CSR_DATA_BITS]		csr_host_1_read_data;
  wire 					csr_host_2_done;
  wire [`FIRE_CSR_STTS_BITS]		csr_host_2_done_status;
  wire [`FIRE_CSR_DATA_BITS]		csr_host_2_read_data;
  wire 					csr_host_3_done;
  wire [`FIRE_CSR_STTS_BITS]		csr_host_3_done_status;
  wire [`FIRE_CSR_DATA_BITS]		csr_host_3_read_data;
  wire [`FIRE_CSR_RING_BITS]		csr_ring_out;
  wire 					ccc_idle;

  wire [`FIRE_CSR_SRCB_BITS]		arb2cdp_sel;
  wire 					arb2fsm_valid;

  wire					cdp2fsm_error;
  wire [`FIRE_CSR_ADDR_BITS] 		cdp2pkt_addr;
  wire [`FIRE_CSR_DATA_BITS] 		cdp2pkt_data;
  wire [`FIRE_CSR_SRCB_BITS] 		cdp2pkt_src_bus;
  wire 					cdp2pkt_wr;

  wire [`FIRE_CSR_DATA_BITS] 		dep2cdp_data;
  wire					dep2fsm_acc_vio;
  wire					dep2fsm_done;
  wire					dep2fsm_mapped;
  wire					dep2fsm_valid;

  wire 					fsm2arb_done;
  wire [`FIRE_CSR_STTS_BITS] 		fsm2cdp_stts;
  wire					fsm2pkt_valid;

// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------
  dmu_common_ccc_arb arb
    (
     .clk			(clk), 
     .rst_l			(rst_l), 			      
     .csr_host_0_req		(csr_host_0_req),
     .csr_host_1_req		(csr_host_1_req),
     .csr_host_2_req		(csr_host_2_req),
     .csr_host_3_req		(csr_host_3_req),
     .fsm2arb_done		(fsm2arb_done),
     .csr_host_0_done		(csr_host_0_done),
     .csr_host_1_done		(csr_host_1_done),
     .csr_host_2_done		(csr_host_2_done),
     .csr_host_3_done		(csr_host_3_done),
     .arb2cdp_sel		(arb2cdp_sel),
     .arb2fsm_valid		(arb2fsm_valid)
     );			      

  dmu_common_ccc_cdp cdp
    (
     .clk			(clk), 
     .rst_l			(rst_l), 			      
     .csr_host_0_addr		(csr_host_0_addr),
     .csr_host_0_data		(csr_host_0_data),
     .csr_host_0_src_bus_id	(csr_host_0_src_bus_id),
     .csr_host_0_wr		(csr_host_0_wr),
     .csr_host_1_addr		(csr_host_1_addr),
     .csr_host_1_data		(csr_host_1_data),
     .csr_host_1_src_bus_id	(csr_host_1_src_bus_id),
     .csr_host_1_wr		(csr_host_1_wr),
     .csr_host_2_addr		(csr_host_2_addr),
     .csr_host_2_data		(csr_host_2_data),
     .csr_host_2_src_bus_id	(csr_host_2_src_bus_id),
     .csr_host_2_wr		(csr_host_2_wr),
     .csr_host_3_addr		(csr_host_3_addr),
     .csr_host_3_data		(csr_host_3_data),
     .csr_host_3_src_bus_id	(csr_host_3_src_bus_id),
     .csr_host_3_wr		(csr_host_3_wr),
     .csr_host_bit_check_mask	(csr_host_bit_check_mask),
     .arb2cdp_sel		(arb2cdp_sel),
     .dep2cdp_data		(dep2cdp_data),
     .fsm2cdp_stts		(fsm2cdp_stts),
     .csr_host_0_done_status	(csr_host_0_done_status),
     .csr_host_0_read_data	(csr_host_0_read_data),
     .csr_host_1_done_status	(csr_host_1_done_status),
     .csr_host_1_read_data	(csr_host_1_read_data),
     .csr_host_2_done_status	(csr_host_2_done_status),
     .csr_host_2_read_data	(csr_host_2_read_data),
     .csr_host_3_done_status	(csr_host_3_done_status),
     .csr_host_3_read_data	(csr_host_3_read_data),
     .cdp2fsm_error		(cdp2fsm_error),
     .cdp2pkt_addr		(cdp2pkt_addr),
     .cdp2pkt_data		(cdp2pkt_data),
     .cdp2pkt_src_bus		(cdp2pkt_src_bus),
     .cdp2pkt_wr		(cdp2pkt_wr)
     );

  dmu_common_ccc_dep dep
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .csr_ring_in		(csr_ring_in),
     .dep2cdp_data		(dep2cdp_data),
     .dep2fsm_acc_vio		(dep2fsm_acc_vio),
     .dep2fsm_done		(dep2fsm_done),
     .dep2fsm_mapped		(dep2fsm_mapped),
     .dep2fsm_valid		(dep2fsm_valid)
     );

  dmu_common_ccc_fsm fsm
    (
     .clk			(clk), 
     .rst_l			(rst_l),
     .done_timeout_value	(done_timeout_value),
     .arb2fsm_valid		(arb2fsm_valid),
     .cdp2fsm_error		(cdp2fsm_error),
     .dep2fsm_acc_vio		(dep2fsm_acc_vio),
     .dep2fsm_done		(dep2fsm_done),
     .dep2fsm_mapped		(dep2fsm_mapped),
     .dep2fsm_valid		(dep2fsm_valid),
     .ccc_idle			(ccc_idle),
     .fsm2arb_done		(fsm2arb_done),
     .fsm2cdp_stts		(fsm2cdp_stts),
     .fsm2pkt_valid		(fsm2pkt_valid)
     );

  dmu_common_ccc_pkt pkt
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .cdp2pkt_addr		(cdp2pkt_addr),
     .cdp2pkt_data		(cdp2pkt_data),
     .cdp2pkt_src_bus		(cdp2pkt_src_bus),
     .cdp2pkt_wr		(cdp2pkt_wr),
     .fsm2pkt_valid		(fsm2pkt_valid),
     .csr_ring_out		(csr_ring_out)
     );

endmodule // dmu_common_ccc
