// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cru.v
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
module dmu_cru 
  (
   // Clock and Reset 
   clk,
   rst_l,

   // Instance ID
   j2d_instance_id,

   // CSR Ring Interface to from JBC
   j2d_csr_ring_out,
   d2j_csr_ring_in,

   // CSR Ring Interface to from PEC
   k2y_csr_ring_out,
   y2k_csr_ring_in,

   // CSR Bus Signals to IMU
   cr2im_csrbus_valid,
   im2cr_csrbus_done,
   im2cr_csrbus_mapped,
   cr2im_csrbus_wr_data,
   cr2im_csrbus_wr,
   im2cr_csrbus_read_data,
   cr2im_csrbus_addr,
   cr2im_csrbus_src_bus,
   im2cr_csrbus_acc_vio,

   // CSR Bus Signals to MMU
   cr2mm_csrbus_valid,
   mm2cr_csrbus_done,
   mm2cr_csrbus_mapped,
   cr2mm_csrbus_wr_data,
   cr2mm_csrbus_wr,
   mm2cr_csrbus_read_data,
   cr2mm_csrbus_addr,
   cr2mm_csrbus_src_bus,
   mm2cr_csrbus_acc_vio,
				
   // CSR Bus Signals to PSB
   cr2ps_csrbus_valid,
   ps2cr_csrbus_done,
   ps2cr_csrbus_mapped,
   cr2ps_csrbus_wr_data,
   cr2ps_csrbus_wr,
   ps2cr_csrbus_read_data,
   cr2ps_csrbus_addr,
   cr2ps_csrbus_src_bus,
   ps2cr_csrbus_acc_vio,

   // CSR Bus Signals to TSB
   cr2ts_csrbus_valid,
   ts2cr_csrbus_done,
   ts2cr_csrbus_mapped,
   cr2ts_csrbus_wr_data,
   cr2ts_csrbus_wr,
   ts2cr_csrbus_read_data,
   cr2ts_csrbus_addr,
   cr2ts_csrbus_src_bus,
   ts2cr_csrbus_acc_vio, 

   // Bus Number to CLU
   cr2cl_bus_num,

   // Requester ID to RMU
   cr2rm_req_id,
   // Requester ID to PEU
   d2p_req_id,

   cr2im_dbg_sel_a,
   cr2im_dbg_sel_b,
   im2cr_dbg_a,
   im2cr_dbg_b,

   cr2cm_dbg_sel_a,
   cr2cm_dbg_sel_b,
   cm2cr_dbg_a,
   cm2cr_dbg_b,

   cr2cl_dbg_sel_a,
   cr2cl_dbg_sel_b,
   cl2cr_dbg_a,
   cl2cr_dbg_b,

   cr2ts_dbg_sel_a,
   cr2ts_dbg_sel_b,
   ts2cr_dbg_a,
   ts2cr_dbg_b,

   cr2tm_dbg_sel_a,
   cr2tm_dbg_sel_b,
   tm2cr_dbg_a,
   tm2cr_dbg_b,

   cr2rm_dbg_sel_a,
   cr2rm_dbg_sel_b,
   rm2cr_dbg_a,
   rm2cr_dbg_b,

   cr2ps_dbg_sel_a,
   cr2ps_dbg_sel_b,
   ps2cr_dbg_a,
   ps2cr_dbg_b,

   cr2pm_dbg_sel_a,
   cr2pm_dbg_sel_b,
   pm2cr_dbg_a,
   pm2cr_dbg_b,

   cr2mm_dbg_sel_a,
   cr2mm_dbg_sel_b,
   mm2cr_dbg_a,
   mm2cr_dbg_b,

   k2y_dbg_sel_a,
   k2y_dbg_sel_b,
   y2k_dbg_a,
   y2k_dbg_b,

   cr2ds_dbg_sel_a,
   cr2ds_dbg_sel_b,
   ds2cr_dbg_a,
   ds2cr_dbg_b,

   dmu_mio_debug_bus_a,
   dmu_mio_debug_bus_b
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input			 	clk;
  input			 	rst_l;

  //------------------------------------------------------------------------
  //  Instance ID   
  //------------------------------------------------------------------------
  input	[`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;

  //------------------------------------------------------------------------
  // Ring Interface to JBC  
  //------------------------------------------------------------------------
  input  [`FIRE_CSR_RING_BITS]	j2d_csr_ring_out;
  output [`FIRE_CSR_RING_BITS]	d2j_csr_ring_in;

  //------------------------------------------------------------------------
  // Ring Interface to JBC  
  //------------------------------------------------------------------------
  output [`FIRE_CSR_RING_BITS]	k2y_csr_ring_out;
  input  [`FIRE_CSR_RING_BITS]	y2k_csr_ring_in;

  //------------------------------------------------------------------------
  // CSR Bus Signals to IMU  
  //------------------------------------------------------------------------
  output 			cr2im_csrbus_valid; 
  input 			im2cr_csrbus_done;
  input 			im2cr_csrbus_mapped; 

  output [`FIRE_CSR_DATA_BITS]	cr2im_csrbus_wr_data; 
  output 			cr2im_csrbus_wr; 

  input  [`FIRE_CSR_DATA_BITS]	im2cr_csrbus_read_data;

  output [`FIRE_CSR_ADDR_BITS]	cr2im_csrbus_addr;

  output [`FIRE_CSR_SRCB_BITS]	cr2im_csrbus_src_bus; 
  input 			im2cr_csrbus_acc_vio; 

  //------------------------------------------------------------------------
  // CSR Bus Signals to MMU  
  //------------------------------------------------------------------------
  output 			cr2mm_csrbus_valid; 
  input 			mm2cr_csrbus_done;
  input 			mm2cr_csrbus_mapped; 

  output [`FIRE_CSR_DATA_BITS]	cr2mm_csrbus_wr_data; 
  output 			cr2mm_csrbus_wr; 

  input  [`FIRE_CSR_DATA_BITS]	mm2cr_csrbus_read_data;

  output [`FIRE_CSR_ADDR_BITS]	cr2mm_csrbus_addr;

  output [`FIRE_CSR_SRCB_BITS]	cr2mm_csrbus_src_bus; 
  input 			mm2cr_csrbus_acc_vio; 

  //------------------------------------------------------------------------
  // CSR Bus Signals to PSB  
  //------------------------------------------------------------------------
  output 			cr2ps_csrbus_valid; 
  input 			ps2cr_csrbus_done;
  input 			ps2cr_csrbus_mapped; 

  output [`FIRE_CSR_DATA_BITS]	cr2ps_csrbus_wr_data; 
  output 			cr2ps_csrbus_wr; 

  input  [`FIRE_CSR_DATA_BITS]	ps2cr_csrbus_read_data;

  output [`FIRE_CSR_ADDR_BITS]	cr2ps_csrbus_addr;

  output [`FIRE_CSR_SRCB_BITS]	cr2ps_csrbus_src_bus; 
  input 			ps2cr_csrbus_acc_vio; 

  //------------------------------------------------------------------------
  // CSR Bus Signals to TSB 
  //------------------------------------------------------------------------
  output 			cr2ts_csrbus_valid; 
  input 			ts2cr_csrbus_done;
  input 			ts2cr_csrbus_mapped; 

  output [`FIRE_CSR_DATA_BITS]	cr2ts_csrbus_wr_data; 
  output 			cr2ts_csrbus_wr; 

  input  [`FIRE_CSR_DATA_BITS]	ts2cr_csrbus_read_data;

  output [`FIRE_CSR_ADDR_BITS]	cr2ts_csrbus_addr;

  output [`FIRE_CSR_SRCB_BITS]	cr2ts_csrbus_src_bus; 
  input 			ts2cr_csrbus_acc_vio; 

  //------------------------------------------------------------------------
  // Bus Number and Requester ID
  //------------------------------------------------------------------------
  output [`FIRE_PCIE_BUS_NUM_BITS]	cr2cl_bus_num;
  output [`FIRE_PCIE_REQ_ID_BITS]	cr2rm_req_id;
  output [`FIRE_PCIE_REQ_ID_BITS]	d2p_req_id;

  //------------------------------------------------------------------------
  // Debug Ports  
  //------------------------------------------------------------------------
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]		cr2im_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2im_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		im2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		im2cr_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2cm_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2cm_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		cm2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		cm2cr_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2cl_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2cl_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		cl2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		cl2cr_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2ts_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2ts_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		ts2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		ts2cr_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2tm_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2tm_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		tm2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		tm2cr_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2rm_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2rm_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		rm2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		rm2cr_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2ps_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2ps_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		ps2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		ps2cr_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2pm_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2pm_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		pm2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		pm2cr_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2mm_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2mm_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		mm2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		mm2cr_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	k2y_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	k2y_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0] 		y2k_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0] 		y2k_dbg_b;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2ds_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 	cr2ds_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0]		        ds2cr_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0]		        ds2cr_dbg_b;
  
  output [`FIRE_DEBUG_WDTH-1:0] 		dmu_mio_debug_bus_a;
  output [`FIRE_DEBUG_WDTH-1:0] 		dmu_mio_debug_bus_b;

// ----------------------------------------------------------------------------
// Wire
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_RING_BITS] 			byp2imu_csr_ring;
  wire [`FIRE_CSR_RING_BITS] 			byp2psb_csr_ring;
  wire [`FIRE_CSR_RING_BITS]			psb2tsb_csr_ring;
  wire [`FIRE_CSR_RING_BITS] 			mmu2byp_csr_ring;
  wire [`FIRE_CSR_RING_BITS] 			cru2mmu_csr_ring;

  wire 						csrbus_valid; 
  wire        					csrbus_done;
  wire						csrbus_mapped; 
  wire [`FIRE_CSR_DATA_WIDTH-1:0]      		csrbus_wr_data; 
  wire                                 		csrbus_wr; 
  wire [`FIRE_CSR_DATA_WIDTH-1:0]      		csrbus_read_data;
  wire [`FIRE_CSR_ADDR_MAX_WIDTH-1:0]  		csrbus_addr;       
  wire [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0]		csrbus_src_bus; 
  wire						csrbus_acc_vio; 
  
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	        cru_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	        cru_dbg_sel_b;

  wire [`FIRE_PCIE_BUS_NUM_BITS] 		cr2cl_bus_num;
  wire [`FIRE_PCIE_REQ_ID_BITS]			cr2rm_req_id;

  wire [3:0]	        			dmc_dbg_sel_a;
  wire [3:0]	        			dmc_dbg_sel_b;
  
  wire [2:0] 					sub_dbg_sel_a;
  wire [2:0]					signal_dbg_sel_a;
  
  wire [2:0] 					sub_dbg_sel_b;
  wire [2:0]					signal_dbg_sel_b;
 
  
// ----------------------------------------------------------------------------
// Wire
// ----------------------------------------------------------------------------
 reg  [`FIRE_DEBUG_WDTH-1:0]		      n_d2j_dbg_a;
 reg  [`FIRE_DEBUG_WDTH-1:0]		      n_d2j_dbg_b;
 reg  [`FIRE_DEBUG_WDTH-1:0]		      dmu_mio_debug_bus_a;
 reg  [`FIRE_DEBUG_WDTH-1:0]		      dmu_mio_debug_bus_b;

 reg  [`FIRE_DEBUG_WDTH-1:0]		      n_cru_dbg_a;
 reg  [`FIRE_DEBUG_WDTH-1:0]		      n_cru_dbg_b;
 reg  [`FIRE_DEBUG_WDTH-1:0]		      cru_dbg_a;
 reg  [`FIRE_DEBUG_WDTH-1:0]		      cru_dbg_b;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------

  // The current hook up of the 6 DCC's is as follows 
  //
  //		to		from
  //		JBC		JBC
  //		 |		 |
  //		IMU		 |
  //		 |		 |
  //		 -------BYP-------
  //		 |		 |
  //		MMU		PSB
  //		 |		 |
  //		CRU		TSB
  //		 |		 |
  //		ILU		ILU
  //		from		to

  //------------------------------------------------------------------------
  // DCB (bypass)
  //------------------------------------------------------------------------

  pcie_common_dcb byp
    (
     .csr_byp_ring_out	(byp2imu_csr_ring),
     .csr_ext_ring_out	(byp2psb_csr_ring),
     .clk		(clk),
     .rst_l		(rst_l),
     .byp_src		(`FIRE_CSR_SRCB_FAST),
     .csr_byp_ring_in	(j2d_csr_ring_out),
     .csr_ext_ring_in	(mmu2byp_csr_ring)
   );

  //------------------------------------------------------------------------
  // DCC to IMU  
  //------------------------------------------------------------------------

  pcie_common_dcc imu
    (
     .csr_ring_out	(d2j_csr_ring_in),
     .csrbus_wr_data	(cr2im_csrbus_wr_data),
     .csrbus_addr	(cr2im_csrbus_addr),	
     .csrbus_wr		(cr2im_csrbus_wr),
     .csrbus_valid	(cr2im_csrbus_valid),
     .csrbus_src_bus	(cr2im_csrbus_src_bus),
     .clk		(clk),
     .rst_l		(rst_l),
     .csr_ring_in	(byp2imu_csr_ring),
     .csrbus_read_data	(im2cr_csrbus_read_data),
     .csrbus_done	(im2cr_csrbus_done),
     .csrbus_mapped	(im2cr_csrbus_mapped),
     .csrbus_acc_vio	(im2cr_csrbus_acc_vio)
     );

  //------------------------------------------------------------------------
  // DCC to MMU  
  //------------------------------------------------------------------------
 
  pcie_common_dcc mmu
    (
     .csr_ring_out	(mmu2byp_csr_ring),
     .csrbus_wr_data	(cr2mm_csrbus_wr_data),
     .csrbus_addr	(cr2mm_csrbus_addr),	
     .csrbus_wr		(cr2mm_csrbus_wr),
     .csrbus_valid	(cr2mm_csrbus_valid),
     .csrbus_src_bus	(cr2mm_csrbus_src_bus),
     .clk		(clk),
     .rst_l		(rst_l),
     .csr_ring_in	(cru2mmu_csr_ring),
     .csrbus_read_data	(mm2cr_csrbus_read_data),
     .csrbus_done	(mm2cr_csrbus_done),
     .csrbus_mapped	(mm2cr_csrbus_mapped),
     .csrbus_acc_vio	(mm2cr_csrbus_acc_vio)
     );

  //------------------------------------------------------------------------
  // DCC to CRU  
  //------------------------------------------------------------------------
 
  pcie_common_dcc cru
    (
     .csr_ring_out	(cru2mmu_csr_ring),
     .csrbus_wr_data	(csrbus_wr_data),
     .csrbus_addr	(csrbus_addr),	
     .csrbus_wr		(csrbus_wr),
     .csrbus_valid	(csrbus_valid),
     .csrbus_src_bus	(csrbus_src_bus),
     .clk		(clk),
     .rst_l		(rst_l),
     .csr_ring_in	(y2k_csr_ring_in),
     .csrbus_read_data	(csrbus_read_data),
     .csrbus_done	(csrbus_done),
     .csrbus_mapped	(csrbus_mapped),
     .csrbus_acc_vio	(csrbus_acc_vio)
     );

  //------------------------------------------------------------------------
  // DCC to PSB 
  //------------------------------------------------------------------------

  pcie_common_dcc psb
    (
     .csr_ring_out	(psb2tsb_csr_ring),
     .csrbus_wr_data	(cr2ps_csrbus_wr_data),
     .csrbus_addr	(cr2ps_csrbus_addr),	
     .csrbus_wr		(cr2ps_csrbus_wr),
     .csrbus_valid	(cr2ps_csrbus_valid),
     .csrbus_src_bus	(cr2ps_csrbus_src_bus),
     .clk		(clk),
     .rst_l		(rst_l),
     .csr_ring_in	(byp2psb_csr_ring),
     .csrbus_read_data	(ps2cr_csrbus_read_data),
     .csrbus_done	(ps2cr_csrbus_done),
     .csrbus_mapped	(ps2cr_csrbus_mapped),
     .csrbus_acc_vio	(ps2cr_csrbus_acc_vio)
     );
     
  //------------------------------------------------------------------------
  // DCC to TSB 
  //------------------------------------------------------------------------
 
  pcie_common_dcc tsb
    (
     .csr_ring_out	(k2y_csr_ring_out),
     .csrbus_wr_data	(cr2ts_csrbus_wr_data),
     .csrbus_addr	(cr2ts_csrbus_addr),	
     .csrbus_wr		(cr2ts_csrbus_wr),
     .csrbus_valid	(cr2ts_csrbus_valid),
     .csrbus_src_bus	(cr2ts_csrbus_src_bus),
     .clk		(clk),
     .rst_l		(rst_l),
     .csr_ring_in	(psb2tsb_csr_ring),
     .csrbus_read_data	(ts2cr_csrbus_read_data),
     .csrbus_done	(ts2cr_csrbus_done),
     .csrbus_mapped	(ts2cr_csrbus_mapped),
     .csrbus_acc_vio	(ts2cr_csrbus_acc_vio)
     );								

  //------------------------------------------------------------------------
  // CSRtool
  //------------------------------------------------------------------------

  dmu_cru_csr csr
    (
     .clk					(clk),
     .csrbus_addr				(csrbus_addr),
     .csrbus_wr_data				(csrbus_wr_data),
     .csrbus_wr					(csrbus_wr),
     .csrbus_valid				(csrbus_valid),
     .csrbus_mapped				(csrbus_mapped),
     .csrbus_done				(csrbus_done),
     .csrbus_read_data				(csrbus_read_data),
     .rst_l					(rst_l),
     .csrbus_src_bus				(csrbus_src_bus),
     .csrbus_acc_vio				(csrbus_acc_vio),
     .instance_id				(j2d_instance_id),

     .dmc_dbg_sel_a_reg_block_sel_hw_read	(dmc_dbg_sel_a),
     .dmc_dbg_sel_a_reg_sub_sel_hw_read		(sub_dbg_sel_a),
     .dmc_dbg_sel_a_reg_signal_sel_hw_read	(signal_dbg_sel_a),

     .dmc_dbg_sel_b_reg_block_sel_hw_read	(dmc_dbg_sel_b),
     .dmc_dbg_sel_b_reg_sub_sel_hw_read		(sub_dbg_sel_b),
     .dmc_dbg_sel_b_reg_signal_sel_hw_read	(signal_dbg_sel_b),

     .dmc_pcie_cfg_bus_num_hw_read		(cr2cl_bus_num),
     .dmc_pcie_cfg_req_id_hw_read		(cr2rm_req_id)
     );

assign	d2p_req_id	= cr2rm_req_id;	// BP 8-18-05
//------------------------------------------------------------------------
// Debug Ports 
//------------------------------------------------------------------------

assign cr2im_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};
assign k2y_dbg_sel_a   = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cru_dbg_sel_a   = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cr2cm_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cr2cl_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cr2ts_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cr2tm_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cr2rm_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cr2ps_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cr2pm_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cr2mm_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};

assign cr2im_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};
assign k2y_dbg_sel_b   = {sub_dbg_sel_b, signal_dbg_sel_b};
assign cru_dbg_sel_b   = {sub_dbg_sel_b, signal_dbg_sel_b};
assign cr2cm_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};
assign cr2cl_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};
assign cr2ts_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};
assign cr2tm_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};
assign cr2rm_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};
assign cr2ps_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};
assign cr2pm_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};
assign cr2mm_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};

assign cr2ds_dbg_sel_a = {sub_dbg_sel_a, signal_dbg_sel_a};
assign cr2ds_dbg_sel_b = {sub_dbg_sel_b, signal_dbg_sel_b};
//-----------------------
// create a waveform of 3 1's followed by 1 0 for dbg calibraion
//-----------------------

reg	[1:0]	dbg_train;
reg	[1:0]	nxt_dbg_train;
wire		train_seq;
// 3 flops in a row, all reset to 0
  always @ (posedge clk)
        if(~rst_l) begin
    dbg_train[1:0] <= {2{1'b0}};
        end
  else begin
    dbg_train[1:0] <= nxt_dbg_train[1:0];
        end

  always @ (dbg_train ) begin
    case (dbg_train) 
      2'b00 : nxt_dbg_train[1:0] = {2'b01};
      2'b01 : nxt_dbg_train[1:0] = {2'b10};
      2'b10 : nxt_dbg_train[1:0] = {2'b11};
      2'b11 : nxt_dbg_train[1:0] = {2'b00};
	endcase
	end

assign	train_seq = dbg_train[1] & dbg_train[0];

//-----------------------
// DMC BLOCK Mux Port A
//-----------------------

  always @ (dmc_dbg_sel_a or cl2cr_dbg_a or cm2cr_dbg_a or y2k_dbg_a or
	    im2cr_dbg_a or mm2cr_dbg_a or pm2cr_dbg_a or ps2cr_dbg_a or ds2cr_dbg_a or
	    rm2cr_dbg_a or tm2cr_dbg_a or ts2cr_dbg_a or cru_dbg_a or train_seq) begin
    case (dmc_dbg_sel_a) // synopsys infer_mux
      4'b0000 : n_d2j_dbg_a = {`FIRE_DEBUG_WDTH{1'b0}};
//      4'b0000 : n_d2j_dbg_a = {`FIRE_DEBUG_WDTH{~train_seq}};
      4'b0001 : n_d2j_dbg_a = cl2cr_dbg_a; 
      4'b0010 : n_d2j_dbg_a = cm2cr_dbg_a;
      4'b0011 : n_d2j_dbg_a = cru_dbg_a;		 
      4'b0100 : n_d2j_dbg_a = ds2cr_dbg_a;
      4'b0101 : n_d2j_dbg_a = {`FIRE_DEBUG_WDTH{~train_seq}};
      4'b0110 : n_d2j_dbg_a = y2k_dbg_a;
      4'b0111 : n_d2j_dbg_a = {`FIRE_DEBUG_WDTH{1'b0}};	
      4'b1000 : n_d2j_dbg_a = {`FIRE_DEBUG_WDTH{1'b0}};
      4'b1001 : n_d2j_dbg_a = im2cr_dbg_a; 
      4'b1010 : n_d2j_dbg_a = mm2cr_dbg_a;
      4'b1011 : n_d2j_dbg_a = pm2cr_dbg_a;
      4'b1100 : n_d2j_dbg_a = ps2cr_dbg_a;
      4'b1101 : n_d2j_dbg_a = rm2cr_dbg_a;
      4'b1110 : n_d2j_dbg_a = tm2cr_dbg_a;
      4'b1111 : n_d2j_dbg_a = ts2cr_dbg_a;
    endcase
  end

//-----------------------
// DMC BLOCK Mux Port B
//-----------------------

  always @ (dmc_dbg_sel_b or cl2cr_dbg_b or cm2cr_dbg_b  or y2k_dbg_b or
	    im2cr_dbg_b or mm2cr_dbg_b or pm2cr_dbg_b or ps2cr_dbg_b or ds2cr_dbg_b or
	    rm2cr_dbg_b or tm2cr_dbg_b or ts2cr_dbg_b or cru_dbg_b or train_seq) begin
    case (dmc_dbg_sel_b) // synopsys infer_mux
      4'b0000 : n_d2j_dbg_b = {`FIRE_DEBUG_WDTH{1'b0}};
      4'b0001 : n_d2j_dbg_b = cl2cr_dbg_b; 
      4'b0010 : n_d2j_dbg_b = cm2cr_dbg_b;
      4'b0011 : n_d2j_dbg_b = cru_dbg_b;		 
      4'b0100 : n_d2j_dbg_b = ds2cr_dbg_b;
      4'b0101 : n_d2j_dbg_b = {`FIRE_DEBUG_WDTH{~train_seq}};
      4'b0110 : n_d2j_dbg_b = y2k_dbg_b;
      4'b0111 : n_d2j_dbg_b = {`FIRE_DEBUG_WDTH{1'b0}};	
      4'b1000 : n_d2j_dbg_b = {`FIRE_DEBUG_WDTH{1'b0}};
      4'b1001 : n_d2j_dbg_b = im2cr_dbg_b; 
      4'b1010 : n_d2j_dbg_b = mm2cr_dbg_b;
      4'b1011 : n_d2j_dbg_b = pm2cr_dbg_b;
      4'b1100 : n_d2j_dbg_b = ps2cr_dbg_b;
      4'b1101 : n_d2j_dbg_b = rm2cr_dbg_b;
      4'b1110 : n_d2j_dbg_b = tm2cr_dbg_b;
      4'b1111 : n_d2j_dbg_b = ts2cr_dbg_b;
    endcase
  end

//-----------------------
// Flop The Core Outputs
//-----------------------     			     
  always @ (posedge clk)  
	if(~rst_l) begin
    dmu_mio_debug_bus_a <= {`FIRE_DEBUG_WDTH{1'b0}};
    dmu_mio_debug_bus_b <= {`FIRE_DEBUG_WDTH{1'b0}};
	end
  else begin
    dmu_mio_debug_bus_a <= n_d2j_dbg_a;
    dmu_mio_debug_bus_b <= n_d2j_dbg_b;
  end

//-----------------------
// CRU Mux Port A
//-----------------------

  always @ (cru_dbg_sel_a) begin
    case (cru_dbg_sel_a) // synopsys parallel_case  infer_mux
      6'h0    : n_cru_dbg_a = {`FIRE_DEBUG_WDTH{1'b0}};
      6'h1    : n_cru_dbg_a = {`FIRE_DEBUG_WDTH{1'b0}}; 
      6'h2    : n_cru_dbg_a = {`FIRE_DEBUG_WDTH{1'b0}}; 
      default : n_cru_dbg_a = {`FIRE_DEBUG_WDTH{1'b0}}; 
    endcase
  end

//-----------------------
// CRU Mux Port B
//-----------------------

  always @ (cru_dbg_sel_b) begin
    case (cru_dbg_sel_b) // synopsys parallel_case  infer_mux
      6'h0  : n_cru_dbg_b = {`FIRE_DEBUG_WDTH{1'b0}};
      6'h1  : n_cru_dbg_b = {`FIRE_DEBUG_WDTH{1'b0}}; 
      6'h2  : n_cru_dbg_b = {`FIRE_DEBUG_WDTH{1'b0}}; 
      default: n_cru_dbg_b = {`FIRE_DEBUG_WDTH{1'b0}}; 
    endcase
  end

//----------------------------
// Flop The CRU Block Signals
//-----------------------------     			     
  always @ (posedge clk) 
	if(~rst_l) begin
    cru_dbg_a <= {`FIRE_DEBUG_WDTH{1'b0}};
    cru_dbg_b <= {`FIRE_DEBUG_WDTH{1'b0}};
	end
  else begin 
    cru_dbg_a <= n_cru_dbg_a;
    cru_dbg_b <= n_cru_dbg_b;
  end

endmodule 
