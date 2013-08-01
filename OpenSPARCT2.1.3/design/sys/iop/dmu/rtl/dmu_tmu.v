// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tmu.v
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
module dmu_tmu (
		     clk,
		     rst_l,
		     // tmu -> peu rams
		     d2p_idb_rd,
		     
		     // ilu <-> dmu-tmu
		     y2k_rcd,
		     y2k_rcd_enq,
		     k2y_rcd_deq,
		     k2y_rel_rcd,
		     k2y_rel_enq,			 
		     
		     // data path
		     y2k_buf_addr_vld_monitor,
		     k2y_buf_addr_vld_monitor,
		     k2y_buf_addr,
		     y2k_buf_data,
		     y2k_buf_dpar,

		     // DIU interface
		     tm2di_wr,
		     tm2di_addr,
		     tm2di_data,
		     tm2di_bmask,
		     tm2di_dpar,

		     // CLU buf rel interface
		     cl2tm_dma_rptr,
		     cl2tm_int_rptr,
		     tm2cl_dma_wptr,
		     tm2cl_pio_wptr,

		     // RMU interface
		     tm2rm_rcd,
		     tm2rm_rcd_enq,
		     rm2tm_rcd_full,

		     // IMU interface
		     tm2im_data_enq,
		     tm2im_data,
		     im2tm_msi32_addr_reg,
		     im2tm_msi64_addr_reg,

		     // CRU (debug) interface
		     cr2tm_dbg_sel_a,
		     cr2tm_dbg_sel_b,
		     tm2cr_dbg_a,
		     tm2cr_dbg_b,
		     csr_sun4v_en,
		     im2tm_eqs_adr_63,

	 );
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  clk;		    
  input		  rst_l;
  
  //------------------------------------------------------------------------
  //   rd enable to idb ram for circuit issues
  //------------------------------------------------------------------------
  output 	                       d2p_idb_rd;
  //------------------------------------------------------------------------
  //   data path to ILU
  //------------------------------------------------------------------------
  input 	                       y2k_buf_addr_vld_monitor;
  output 	                       k2y_buf_addr_vld_monitor;
  output [`FIRE_DLC_ITI_ADDR_WDTH-1:0] k2y_buf_addr;        // read pointer to IDB
  input [`FIRE_DLC_ITI_DATA_WDTH-1:0]  y2k_buf_data;        // 16-byte data    
  input [`FIRE_DLC_ITI_DPAR_WDTH-1:0]  y2k_buf_dpar;        // data parity
    
  //------------------------------------------------------------------------
  //   record interface to ILU
  //------------------------------------------------------------------------
  output 			       k2y_rcd_deq;        // ingress record fifo full
  input [`FIRE_DLC_IPE_REC_WDTH-1:0]   y2k_rcd;             // ingress PEC record
  input 			       y2k_rcd_enq;         // ingress PEC record enqueue
  
  //------------------------------------------------------------------------
  //   release interface with ILU
  //------------------------------------------------------------------------
  output [`FIRE_DLC_URR_REC_WDTH-1:0]  k2y_rel_rcd;         // ingress release rcd
  output 			       k2y_rel_enq;         // ingress enqueue 

  //------------------------------------------------------------------------
  //   DIU interface
  //------------------------------------------------------------------------
  output 			       tm2di_wr;            // write
  output [`FIRE_DLC_TRD_ADDR_WDTH-1:0] tm2di_addr;          // DIU address
  output [`FIRE_DLC_TRD_DATA_WDTH-1:0] tm2di_data;          // data to DIU
  output [`FIRE_DLC_TRD_BMASK_WDTH-1:0] tm2di_bmask;         // byte mask
  output [`FIRE_DLC_TRD_DPAR_WDTH-1:0] 	tm2di_dpar;          // data parity

  //------------------------------------------------------------------------
  //   CLU buf rel interface
  //------------------------------------------------------------------------
  input [`FIRE_DLC_DMA_RPTR_WDTH-1:0]  cl2tm_dma_rptr;
  input [`FIRE_DLC_INT_RPTR_WDTH-1:0]  cl2tm_int_rptr;    
  output [`FIRE_DLC_DMA_WPTR_WDTH-1:0] tm2cl_dma_wptr;
  output [`FIRE_DLC_PIO_WPTR_WDTH-1:0] tm2cl_pio_wptr;

  //------------------------------------------------------------------------
  //   RMU interface
  //------------------------------------------------------------------------
  output [`FIRE_DLC_DIM_REC_WDTH-1:0]  tm2rm_rcd;           // ingress
  output 			       tm2rm_rcd_enq;       // ingress
  input 			       rm2tm_rcd_full;      // ingress

  //------------------------------------------------------------------------
  //   IMU interface
  //------------------------------------------------------------------------
  output 			       tm2im_data_enq;      // ingress
  output [`FIRE_DLC_MDF_REC_WDTH-1:0]  tm2im_data;          // ingress
  input [`FIRE_DLC_SCW_MSI32_WDTH-1:0] im2tm_msi32_addr_reg;
  input [`FIRE_DLC_SCW_MSI64_WDTH-1:0] im2tm_msi64_addr_reg;

  //------------------------------------------------------------------------
  //    CRU (debug) interface
  //------------------------------------------------------------------------
  input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] cr2tm_dbg_sel_a;
  input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] cr2tm_dbg_sel_b;
  output [`FIRE_DBG_DATA_BITS] 	       tm2cr_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 	       tm2cr_dbg_b;

  //  use these 2 signals to disable bit addr 63 compare if sun4v and eq bit 63 is 1 
  //------------------------------------------------------------------------
  input 			       csr_sun4v_en;      // for msi64 compare
  input 			       im2tm_eqs_adr_63;      // for msi64 compare
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg 				       tmu_is_idle;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire 				       dim_is_idle;
 
  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // 0in known_driven -var y2k_rcd_enq
  // 0in known_driven -var k2y_rcd_deq
  // 0in known_driven -var k2y_rel_enq
  // 0in known_driven -var tm2rm_rcd_enq
  // 0in known_driven -var rm2tm_rcd_full
  // 0in known -var k2y_buf_addr
  // 0in known_driven -var tm2di_wr
  // 0in known_driven -var tm2im_data_enq
  // 0in known -var im2tm_msi32_addr_reg
  // 0in known -var im2tm_msi64_addr_reg
  

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  idle check
  //---------------------------------------------------------------------
//BP N2 no reset, should be 1 at rst_l, ie idle
   always @ (posedge clk) begin
     tmu_is_idle <= dim_is_idle;
   end
//BP temp 4-1-05
//assign d2p_idb_rd	= 1'b1;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // DIM sub-block
  dmu_tmu_dim dim (
                        .clk                  (clk),
                        .rst_l                (rst_l),

                        // ilu -> peu-idb BP n2 5-06-05 rd enable to peu idb ram
                        .d2p_idb_rd           (d2p_idb_rd),
                        // ilu <-> dmu-tmu
                        .y2k_rcd              (y2k_rcd),
                        .y2k_rcd_enq          (y2k_rcd_enq),
                        .k2y_rcd_deq          (k2y_rcd_deq),
                        .k2y_rel_rcd          (k2y_rel_rcd),
                        .k2y_rel_enq          (k2y_rel_enq),
			
                        // data path
			.y2k_buf_addr_vld_monitor     (y2k_buf_addr_vld_monitor),
			.k2y_buf_addr_vld_monitor     (k2y_buf_addr_vld_monitor),
                        .k2y_buf_addr         (k2y_buf_addr),
                        .y2k_buf_data         (y2k_buf_data),
                        .y2k_buf_dpar         (y2k_buf_dpar),
			
                        // DIU interface
                        .tm2di_wr             (tm2di_wr),
                        .tm2di_addr           (tm2di_addr),
                        .tm2di_data           (tm2di_data),
                        .tm2di_bmask          (tm2di_bmask),
                        .tm2di_dpar           (tm2di_dpar),
			
                        // CLU buf rel interface
			.cl2tm_dma_rptr       (cl2tm_dma_rptr),
			.cl2tm_int_rptr       (cl2tm_int_rptr),
			.tm2cl_dma_wptr       (tm2cl_dma_wptr),
			.tm2cl_pio_wptr       (tm2cl_pio_wptr),
			
                        // RMU interface
                        .tm2rm_rcd            (tm2rm_rcd),
                        .tm2rm_rcd_enq        (tm2rm_rcd_enq),
                        .rm2tm_rcd_full       (rm2tm_rcd_full),
			
                        // IMU interface
                        .tm2im_data_enq       (tm2im_data_enq),
                        .tm2im_data           (tm2im_data),
			
                        // static CSR interface from IMU
                        .im2tm_msi32_addr_reg (im2tm_msi32_addr_reg),
			.im2tm_msi64_addr_reg (im2tm_msi64_addr_reg),

			.cr2tm_dbg_sel_a      (cr2tm_dbg_sel_a),
			.cr2tm_dbg_sel_b      (cr2tm_dbg_sel_b),
			.tm2cr_dbg_a          (tm2cr_dbg_a),
			.tm2cr_dbg_b          (tm2cr_dbg_b),
			.dim_is_idle          (dim_is_idle),
			.tmu_is_idle          (tmu_is_idle),
			.csr_sun4v_en         (csr_sun4v_en),
			.im2tm_eqs_adr_63     (im2tm_eqs_adr_63)
	 );


endmodule // dmu_tmu




