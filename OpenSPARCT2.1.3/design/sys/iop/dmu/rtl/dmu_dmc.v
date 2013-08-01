// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dmc.v
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
module dmu_dmc 
  (
   l2clk,		// clock for rams, since they have their own headers
   l1clk,		// clock for all flops

   j2d_rst_l,		// DMC soft reset
   j2d_por_l,		// DMC hard reset

// scan
   scan_in,		// scan in
   tcu_scan_en,		// scan enable
   tcu_array_bypass,	// scan bypass for ram arrays
   tcu_se_scancollar_in,	// 
   tcu_se_scancollar_out,	// 
   tcu_array_wr_inhibit,// scan write inhibit for ram arrays
   tcu_pce_ov,		// 
   tcu_aclk,		// scan siclk in
   tcu_bclk,		// scan siclk out
   scan_out,		// scan out


   j2d_spare,		// Spare jbus to DMCA connections
   d2j_spare,

   cr2ds_dbg_sel_a,
   cr2ds_dbg_sel_b,
   ds2cr_dbg_a,
   ds2cr_dbg_b,

   dmu_mio_debug_bus_a,
   dmu_mio_debug_bus_b,

//   j2d_ext_int_l,	// External interrupt lines passed through JBC on to DMC
//   j2d_i2c0_int_l,	// Interrupt line used to signal DMC that I2C bus 0 needs to do an interrupt
//   j2d_i2c1_int_l,	// Interrupt line used to signal DMC that I2C bus 1 needs to do an interrupt
//   j2d_jbc_int_l,	// Interrupt line used to signal DMC that JBC needs to do an interrupt

   j2d_jid,		// Lower bit of JID, used to select which JID 
   j2d_instance_id,

   y2k_int_l,		// Interrupt req for PEC core (level based)

   j2d_csr_ring_out,
   d2j_csr_ring_in,

   k2y_csr_ring_out,
   y2k_csr_ring_in,

   d2j_cmd,		// req/resp cmd
   d2j_addr,		// addr of dma/int req
   d2j_ctag,		// transaction tag
   d2j_cmd_vld,		// valid signal

   d2j_data,		// 16 byte data bus
   d2j_bmsk,		// bmask for partial wr
   d2j_data_par,	// parity for data/bmask
   d2j_data_vld,	// valid signal

   d2j_p_wrack_tag,
   d2j_p_wrack_vld,

   y2k_rel_enq,
   y2k_rel_rcd,

   y2k_mps,

   y2k_buf_addr_vld_monitor,
   y2k_buf_addr,	// Address width, to address 128 entries DMA / 64 entries PIO 
   k2y_buf_data,	// Data width, 16 bytes
   k2y_buf_dpar,	// Parity width 32 bit parity on data 

   j2d_d_data,		// dma rd data
   j2d_d_data_err,	// data status
   j2d_d_data_par,	// data parity
   j2d_d_data_vld,	// valid signal
   j2d_d_wrack_tag,	// dma wrack tag
   j2d_d_wrack_vld,	// valid signal
   j2d_di_cmd,		// dma/int cmd
   j2d_di_cmd_vld,	// valid signal
   j2d_di_ctag, 	// dma/int tag

   j2d_p_addr,		// addr of pio
   j2d_p_bmsk,		// bmask for pio
   j2d_p_cmd,		// pio cmd
   j2d_p_cmd_vld,	// valid signal
   j2d_p_ctag,		// pio tag
   j2d_p_data,		// pio wr data
   j2d_p_data_par,	// data parity
   j2d_p_data_vld,	// valid signal

   k2y_dou_dptr,	// CRM: DOU-DMA Status Port
   k2y_dou_err,
   k2y_dou_vld,

//   d2j_tsb_base,
//   d2j_tsb_enable,
//   d2j_tsb_size,

   j2d_mmu_addr,
   j2d_mmu_addr_vld,

   k2y_buf_addr_vld_monitor,
   k2y_buf_addr,	// read pointer to IDB
   y2k_buf_data,	// 16-byte data
   y2k_buf_dpar,	// data parity

   k2y_rcd,		// egress PEC rcd
   k2y_rcd_enq,		// egress enqueue for PEC rcd
   k2y_rcd_deq,	  	// ingress record fifo full

   k2y_rel_enq,		// ingress enqueue 
   k2y_rel_rcd,		// ingress release rcd

   y2k_rcd,		// ingress PEC record
   y2k_rcd_enq,		// ingress PEC record enqueue
   y2k_rcd_deq,		// egress rcd fifo full  

   k2y_dbg_sel_a,
   k2y_dbg_sel_b,
   y2k_dbg_a,
   y2k_dbg_b,

   dsn_dmc_iei,
   dmu_dbg_err_event,
   ds2cl_stall,

   dmu_cb0_run,
   dmu_cb0_addr,
   dmu_cb0_wdata_key,
   dmu_cb0_mmu_ptb_wr_en,
   dmu_cb0_mmu_ptb_rd_en,
   dmu_cb0_mmu_ptb_lkup_en,
   mmu_ptb_hit,
   dmu_cb0_mmu_vtb_wr_en,
   dmu_cb0_mmu_vtb_rd_en,
   dmu_cb0_mmu_vtb_lkup_en,
   dmu_cb0_hld,
   mmu_vtb_hit,
   vtb_dout_4msb,
   mmu_ptb_read_data,
   vtb2csr_rd,
   dev_tsb_read_data,
   dmu_mb0_run,
   dmu_mb0_addr,
   dmu_mb0_wdata,
   dmu_mb0_dev_wr_en,
   dmu_mb0_dev_rd_en,
   dmu_mb0_tsb_wr_en,
   dmu_mb0_tsb_rd_en,
   dmu_mb0_tdb_wr_en,
   dmu_mb0_tdb_rd_en,
   tdb_dout_8msb,
   tdb2csr_rd,
   dmu_diu_read_data,
   dmu_mb0_diu_wr_en,
   dmu_mb0_diu_rd_en,
   dmu_mb0_dou_dma_data_wr_en,
   dmu_mb0_dou_dma_data_rd_en,
   dmu_mb0_dou_pio_data_wr_en,
   dmu_mb0_dou_pio_data_rd_en,
   dmu_dou_pio_read_data,
   dmu_dou_dma_read_data,
// efu wires
   efu_dmu_data,        // input efu to devtsb
   efu_dmu_xfer_en,     // input efu to devtsb
   efu_dmu_clr    ,     // input efu to devtsb
   dmu_efu_data,        // output of devtsb to efu
   dmu_efu_xfer_en,      // output of devtsb to efu

   d2p_idb_rd,      	// rd en to peu idb ram
   d2p_req_id,      	// BP 8-18-05 req_id to peu for messages
   p2d_npwr_stall_en,	// BP 12-02-05 force 1 non-posted write outstanding
   il2cl_gr_16		// BP 12-02-05 force 1 non-posted write outstanding from ilu



   );

//############################################################################
//				PORT DECLARATIONS
//############################################################################

  input 					l2clk;
  input 					l1clk;

  input 					j2d_rst_l;
  input 					j2d_por_l;

  input 					scan_in;
  input 					tcu_scan_en;
  input 					tcu_array_bypass;
  input 					tcu_se_scancollar_in;
  input 					tcu_se_scancollar_out;
  input 					tcu_array_wr_inhibit;
  input 					tcu_pce_ov;
  input 					tcu_aclk;
  input 					tcu_bclk;
  output 					scan_out;


  input  [`FIRE_J2D_SPARE_WDTH-1:0]		j2d_spare;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]         cr2ds_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]         cr2ds_dbg_sel_b;
  input [`FIRE_DEBUG_WDTH-1:0]			ds2cr_dbg_a;
  input [`FIRE_DEBUG_WDTH-1:0]			ds2cr_dbg_b;

  output [`FIRE_DEBUG_WDTH-1:0]			dmu_mio_debug_bus_a;
  output [`FIRE_DEBUG_WDTH-1:0]			dmu_mio_debug_bus_b;

  input 					y2k_int_l;
//  input  [`FIRE_J2D_EXT_INT_WDTH-1:0]		j2d_ext_int_l;
//  input 					j2d_i2c0_int_l;
//  input 					j2d_i2c1_int_l;
//  input 					j2d_jbc_int_l;

  input  [`FIRE_J2D_JID_WDTH-1:0]		j2d_jid;
  input  [`FIRE_J2D_INSTANCE_ID_WDTH-1:0]	j2d_instance_id;

  input  [`FIRE_CSR_RING_WIDTH-1:0]		j2d_csr_ring_out;	
  output [`FIRE_CSR_RING_WIDTH-1:0]		d2j_csr_ring_in;	
  output [`FIRE_CSR_RING_WIDTH-1:0]		k2y_csr_ring_out;
  input  [`FIRE_CSR_RING_WIDTH-1:0]		y2k_csr_ring_in;	
	
  output [`FIRE_D2J_CMD_WDTH-1:0]		d2j_cmd;
  output [`FIRE_D2J_ADDR_WDTH-1:0]		d2j_addr;
  output [`FIRE_D2J_CTAG_WDTH-1:0]		d2j_ctag;
  output 					d2j_cmd_vld;
  
  output [`FIRE_D2J_DATA_WDTH-1:0]		d2j_data;
  output [`FIRE_D2J_BMSK_WDTH-1:0]		d2j_bmsk;
  output [`FIRE_D2J_DPAR_WDTH-1:0]		d2j_data_par;
  output 					d2j_data_vld;
	
  output [`FIRE_D2J_P_WRACK_WDTH-1:0]		d2j_p_wrack_tag; 
  output 					d2j_p_wrack_vld; 

  input  [`FIRE_DLC_DRR_REC_WDTH-1:0]		y2k_rel_rcd;
  input 					y2k_rel_enq;
 
  output [`FIRE_D2J_SPARE_WDTH-1:0]		d2j_spare; 	
	
  input  [`FIRE_DLC_MPS-1:0]			y2k_mps; 

  input 					y2k_buf_addr_vld_monitor;
  input  [`FIRE_DLC_ERD_ADDR_WDTH-1:0]		y2k_buf_addr;
  output [`FIRE_DLC_ERD_DATA_WDTH-1:0]		k2y_buf_data;
  output [`FIRE_DLC_ERD_DPAR_WDTH-1:0]		k2y_buf_dpar;
	
  input  [`FIRE_J2D_D_WRACK_WDTH-1:0]		j2d_d_wrack_tag;
  input 					j2d_d_wrack_vld;
  
  input  [`FIRE_J2D_DI_CMD_WDTH-1:0]		j2d_di_cmd;
  input  [`FIRE_J2D_DI_CTAG_WDTH-1:0]		j2d_di_ctag;
  input 					j2d_di_cmd_vld;
  
  input  [`FIRE_J2D_P_CMD_WDTH-1:0]		j2d_p_cmd;
  input  [`FIRE_J2D_P_ADDR_WDTH-1:0]		j2d_p_addr;
  input  [`FIRE_J2D_P_BMSK_WDTH-1:0]		j2d_p_bmsk;
  input  [`FIRE_J2D_P_CTAG_WDTH-1:0]		j2d_p_ctag;
  input 					j2d_p_cmd_vld;
  
  input  [`FIRE_J2D_D_DATA_WDTH-1:0]		j2d_d_data;
  input  [`FIRE_J2D_D_DPAR_WDTH-1:0]		j2d_d_data_par;
  input 					j2d_d_data_err;
  input 					j2d_d_data_vld;
  
  input  [`FIRE_J2D_P_DATA_WDTH-1:0]		j2d_p_data;
  input  [`FIRE_J2D_P_DPAR_WDTH-1:0]		j2d_p_data_par;
  input 					j2d_p_data_vld;

  output [`FIRE_DLC_DOU_REL_WDTH-1:0]		k2y_dou_dptr;
  output 					k2y_dou_err;
  output 					k2y_dou_vld;

  input  [`FIRE_J2D_MMU_ADDR_BITS]		j2d_mmu_addr; 	
  input 					j2d_mmu_addr_vld; 

//  output [`FIRE_D2J_TSB_BASE_BITS]		d2j_tsb_base; 	
//  output 					d2j_tsb_enable; 		 
//  output [`FIRE_D2J_TSB_SIZE_BITS]		d2j_tsb_size; 
	
	
  output 					k2y_buf_addr_vld_monitor;
  output [`FIRE_DLC_ITI_ADDR_WDTH-1:0]		k2y_buf_addr;
  input  [`FIRE_DLC_ITI_DATA_WDTH-1:0]		y2k_buf_data;
  input  [`FIRE_DLC_ITI_DPAR_WDTH-1:0]		y2k_buf_dpar;
    
  output 					k2y_rcd_deq;
  input  [`FIRE_DLC_IPE_REC_WDTH-1:0]		y2k_rcd;
  input 					y2k_rcd_enq;

  output [`FIRE_DLC_EPE_REC_WDTH-1:0]		k2y_rcd;
  output 					k2y_rcd_enq;
  input 					y2k_rcd_deq;
  
  output [`FIRE_DLC_URR_REC_WDTH-1:0]		k2y_rel_rcd;
  output 					k2y_rel_enq;

  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]		k2y_dbg_sel_a;
  output [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]		k2y_dbg_sel_b;
  input  [`FIRE_DEBUG_WDTH-1:0]			y2k_dbg_a;
  input  [`FIRE_DEBUG_WDTH-1:0]			y2k_dbg_b;

  input  					dsn_dmc_iei;

  output  					dmu_dbg_err_event;
  input  					ds2cl_stall;		//for N2 dbg quiescing

  input         dmu_cb0_run;
  input [5:0]   dmu_cb0_addr;
  input [32:0]  dmu_cb0_wdata_key;
  input         dmu_cb0_mmu_ptb_wr_en;
  input         dmu_cb0_mmu_ptb_rd_en;
  input         dmu_cb0_mmu_ptb_lkup_en;
  output [63:0] mmu_ptb_hit;
  input         dmu_cb0_mmu_vtb_wr_en;
  input         dmu_cb0_mmu_vtb_rd_en;
  input         dmu_cb0_mmu_vtb_lkup_en;
  input         dmu_cb0_hld;
  output [63:0] mmu_vtb_hit;
  output [3:0]  vtb_dout_4msb;
  output [32:0] mmu_ptb_read_data;
  output [29:0]       vtb2csr_rd;

  output [63:0] dev_tsb_read_data;
  input         dmu_mb0_run;
  input [8:0]   dmu_mb0_addr;
  input [7:0]   dmu_mb0_wdata;
  input         dmu_mb0_dev_wr_en;
  input         dmu_mb0_dev_rd_en;
  input         dmu_mb0_tsb_wr_en;
  input         dmu_mb0_tsb_rd_en;
  input         dmu_mb0_tdb_wr_en;
  input         dmu_mb0_tdb_rd_en;
  output [7:0]  tdb_dout_8msb;
  output [51:0]       tdb2csr_rd;

  output [148:0] dmu_diu_read_data;
  input         dmu_mb0_diu_wr_en;
  input         dmu_mb0_diu_rd_en;
  output [131:0] dmu_dou_pio_read_data;
  output [131:0] dmu_dou_dma_read_data;
  input          dmu_mb0_dou_pio_data_wr_en;
  input          dmu_mb0_dou_pio_data_rd_en;
  input          dmu_mb0_dou_dma_data_wr_en;
  input          dmu_mb0_dou_dma_data_rd_en;
// efu wires
  input		efu_dmu_data ;        // input efu to devtsb
  input		efu_dmu_xfer_en;      // input efu to devtsb
  input		efu_dmu_clr;          // input efu to devtsb
  output	dmu_efu_data;         // output of devtsb to efu
  output	dmu_efu_xfer_en ;     // output of devtsb to efu
// BP n2 34-01-05 requested by circuit designers
  output	d2p_idb_rd ;     	// peu idb read enable
  output [`FIRE_PCIE_REQ_ID_BITS]       d2p_req_id;
  input         p2d_npwr_stall_en;	// forces 1 non-posted write outstanding
  input         il2cl_gr_16;		// forces 1 non-posted write outstanding from ilu



//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################

//**************************************************
// Wires 
//**************************************************

  //------------------------------------------------------------------------
  //  IMU Wires     
  //------------------------------------------------------------------------

  wire [`FIRE_DLC_IOT_REC_WDTH-1:0] 		im2rm_rcd;
  wire 						im2rm_rcd_enq;

  wire [`FIRE_DLC_IIN_REC_WDTH-1:0] 		rm2im_rcd; 
  wire 						rm2im_rcd_enq; 

  wire [`FIRE_DLC_MDF_REC_WDTH-1:0] 		tm2im_data; 
  wire 						tm2im_data_enq; 

  wire 						rm2im_rply_enq; 
  wire [`FIRE_DLC_MRR_REC_WDTH-1:0] 		rm2im_rply; 		

  wire 						mm2im_int;

  wire 						im2rm_mdo_enq;    	
  wire [`FIRE_DLC_MQR_REC_WDTH-1:0] 		im2rm_mdo;         	

  wire 						im2di_wr;
  wire [`FIRE_DLC_IRD_ADDR_WDTH-1:0] 		im2di_addr; 
  wire [`FIRE_DLC_IRD_DATA_WDTH-1:0] 		im2di_data;
  wire [`FIRE_DLC_IRD_DPAR_WDTH-1:0] 		im2di_dpar;
  wire [`FIRE_DLC_IRD_BMASK_WDTH-1:0] 		im2di_bmask; 

  wire [`FIRE_DLC_SCW_MSI32_WDTH-1:0] 		im2tm_msi32_addr_reg;
  wire [`FIRE_DLC_SCW_MSI64_WDTH-1:0] 		im2tm_msi64_addr_reg;
  wire [`FIRE_DLC_SCW_MEM64_WDTH-1:0] 		im2rm_mem64_offset_reg;

  wire 						cr2im_csrbus_valid; 
  wire 						im2cr_csrbus_done;
  wire 						im2cr_csrbus_mapped;   
  wire [`FIRE_CSR_DATA_WIDTH-1:0] 		cr2im_csrbus_wr_data; 
  wire 						cr2im_csrbus_wr; 
  wire [`FIRE_CSR_DATA_WIDTH-1:0] 		im2cr_csrbus_read_data;  
  wire [`FIRE_CSR_ADDR_MAX_WIDTH-1:0] 		cr2im_csrbus_addr;       
  wire [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0] 	cr2im_csrbus_src_bus; 
  wire 						im2cr_csrbus_acc_vio; 

  //------------------------------------------------------------------------
  //  CRU Wires     
  //------------------------------------------------------------------------

  wire						cr2mm_csrbus_valid; 
  wire						mm2cr_csrbus_done;
  wire						mm2cr_csrbus_mapped; 
  wire [`FIRE_CSR_DATA_WIDTH-1:0] 		cr2mm_csrbus_wr_data; 
  wire						cr2mm_csrbus_wr;   
  wire [`FIRE_CSR_DATA_WIDTH-1:0] 		mm2cr_csrbus_read_data;  
  wire [`FIRE_CSR_ADDR_MAX_WIDTH-1:0] 		cr2mm_csrbus_addr;       
  wire [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0] 	cr2mm_csrbus_src_bus; 
  wire						mm2cr_csrbus_acc_vio;

  wire						cr2ps_csrbus_valid; 
  wire						ps2cr_csrbus_done;
  wire						ps2cr_csrbus_mapped; 
  wire [`FIRE_CSR_DATA_WIDTH-1:0] 		cr2ps_csrbus_wr_data; 
  wire						cr2ps_csrbus_wr;   
  wire [`FIRE_CSR_DATA_WIDTH-1:0] 		ps2cr_csrbus_read_data;  
  wire [`FIRE_CSR_ADDR_MAX_WIDTH-1:0] 		cr2ps_csrbus_addr;       
  wire [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0] 	cr2ps_csrbus_src_bus; 
  wire 						ps2cr_csrbus_acc_vio; 

  wire						cr2ts_csrbus_valid; 
  wire						ts2cr_csrbus_done;
  wire						ts2cr_csrbus_mapped; 
  wire [`FIRE_CSR_DATA_WIDTH-1:0] 		cr2ts_csrbus_wr_data; 
  wire						cr2ts_csrbus_wr;   
  wire [`FIRE_CSR_DATA_WIDTH-1:0] 		ts2cr_csrbus_read_data;  
  wire [`FIRE_CSR_ADDR_MAX_WIDTH-1:0] 		cr2ts_csrbus_addr;       
  wire [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0] 	cr2ts_csrbus_src_bus; 
  wire						ts2cr_csrbus_acc_vio;

  wire [`FIRE_PCIE_BUS_NUM_BITS] 		cr2cl_bus_num;
  wire [`FIRE_PCIE_REQ_ID_BITS]			cr2rm_req_id;

  //------------------------------------------------------------------------
  //  CLU Wires     
  //------------------------------------------------------------------------

  wire [`FIRE_DLC_PSR_CMD_TYPE_WDTH-1:0] 	cl2ps_e_cmd_type;
  wire [`FIRE_DLC_PSR_TRN_WDTH-1:0] 		cl2ps_e_trn;
  wire [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0] 	cl2ps_e_wr_data;
  wire                                       	cl2ps_e_req;
  wire [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0] 	ps2cl_e_rd_data;
  wire                                        	ps2cl_e_gnt;

  wire                                		cl2pm_rcd_full; // icr fifo full
  wire [`FIRE_DLC_ICR_REC_WDTH-1:0] 		pm2cl_rcd;      // ingress cmd rcd
  wire                                  	pm2cl_rcd_enq;  // enqueue for icr
 
  wire [`FIRE_DLC_EPR_REC_WDTH-1:0] 		cl2cm_rcd;      // egress pkt rcd
  wire                                  	cl2cm_rcd_enq;  // enqueue for epr
  wire                                  	cm2cl_rcd_full; // epr fifo full

  wire                            		cl2mm_tcr_ack; // ack for tcr
  wire [`FIRE_DLC_TCR_WDTH-1:0] 		mm2cl_tcr_rcd; // tablewalk cmd rcd
  wire                             		mm2cl_tcr_req; // req for tcr

  wire [`FIRE_DLC_TDR_WDTH-1:0] 		cl2mm_tdr_rcd; // tablewalk data rcd
  wire                             		cl2mm_tdr_vld; // valid signal

  wire [`FIRE_DLC_DOU_REL_WDTH-1:0] 		rm2cl_bufrel;
  wire                                  	rm2cl_bufrel_enq;

  wire [`FIRE_DLC_DMA_RPTR_WDTH-1:0] 		cl2tm_dma_rptr;
  wire [`FIRE_DLC_INT_RPTR_WDTH-1:0] 		cl2tm_int_rptr;    
  wire [`FIRE_DLC_DMA_WPTR_WDTH-1:0] 		tm2cl_dma_wptr;
  wire [`FIRE_DLC_PIO_WPTR_WDTH-1:0] 		tm2cl_pio_wptr;

  wire [`FIRE_DLC_CRD_ADDR_WDTH-1:0] 		cl2di_addr;  // buffer address
  wire [`FIRE_DLC_CRD_DATA_WDTH-1:0] 		di2cl_data;  // data for trans
  wire [`FIRE_DLC_CRD_BMASK_WDTH-1:0] 		di2cl_bmask; // bytemask for data
  wire [`FIRE_DLC_CRD_DPAR_WDTH-1:0] 		di2cl_dpar;  // parity for data

  wire [`FIRE_DLC_CDD_DATA_WDTH-1:0] 		cl2do_dma_data; // dma rd data
  wire [`FIRE_DLC_CDD_DPAR_WDTH-1:0] 		cl2do_dma_dpar; // dma data par
  wire [`FIRE_DLC_CDD_ADDR_WDTH-1:0] 		cl2do_dma_addr; // dma buf addr
  wire                                  	cl2do_dma_wr;   // dma buf wr en

  wire [`FIRE_DLC_CPD_DATA_WDTH-1:0] 		cl2do_pio_data; // pio wr data
  wire [`FIRE_DLC_CPD_DPAR_WDTH-1:0] 		cl2do_pio_dpar; // pio data par
  wire [`FIRE_DLC_CPD_ADDR_WDTH-1:0] 		cl2do_pio_addr; // pio buf addr
  wire                                  	cl2do_pio_wr;
  
  //------------------------------------------------------------------------
  //  RMU Wires     
  //------------------------------------------------------------------------

  wire [`FIRE_DLC_DIM_REC_WDTH-1:0] 		tm2rm_rcd;
  wire						tm2rm_rcd_enq;
  wire						rm2tm_rcd_full;

  wire [`FIRE_DLC_ERR_REC_WDTH-1:0] 		cm2rm_rcd;
  wire						cm2rm_rcd_enq;
  wire						rm2cm_rcd_full;

  wire						rm2ts_i_req;        	// SRM request for access 
  wire [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0] 	rm2ts_i_cmd_type;   	// type of access requested (trn req w/write) 
  wire [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 	rm2ts_i_wr_data;    	// wr data to be put on scbd

  wire						ts2rm_i_full;       	// flow control, no request for trtag can be made
  wire [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		ts2rm_i_n_trn;      	// next trtag returned on trn request
  wire						ts2rm_i_gnt;        	// grant signal for request

  wire						rm2ts_e_req;        	// RRM request for access 
  wire [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0] 	rm2ts_e_cmd_type;   	// type of access requested (read, write, read w/clear)
  wire [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		rm2ts_e_trn;        	// trtag to be cleared, read from or written to
  wire [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 	rm2ts_e_wr_data;    	// wr data to be put on scbd

  wire						ts2rm_e_gnt;        	// grant signal for request
  wire [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0] 	ts2rm_e_rd_data;    	// data read from scbd (trtag is address read from)

  wire [`FIRE_DLC_SRM_WDTH-1:0] 		rm2mm_rcd;
  wire						rm2mm_rcd_enq;
  wire						mm2rm_rcd_full;

  //------------------------------------------------------------------------
  //  CMU Wires     
  //-----------------------------------------------------------------------

  wire						mm2cm_rcd_enq;
  wire [`FIRE_DLC_ISR_REC_WDTH-1:0] 		mm2cm_rcd;
  wire						cm2mm_rcd_full;

  wire						cm2pm_rcd_enq;
  wire [`FIRE_DLC_IPR_REC_WDTH-1:0] 		cm2pm_rcd;
  wire						pm2cm_rcd_full;

  //------------------------------------------------------------------------
  //  PMU Wires     
  //----------------------------------------------------------------------- 

  wire						pm2ps_i_req;        	// PRM request for access 
  wire [`FIRE_DLC_PSR_CMD_TYPE_WDTH-1:0] 	pm2ps_i_cmd_type;   	// type of access requested (TRN req w/ Write)
  wire [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0] 	pm2ps_i_wr_data;    	// wr data to be put on scbd

  wire						ps2pm_i_full;       	// flow control, no request for pktag can be made
  wire [`FIRE_DLC_PSR_TRN_WDTH-1:0] 		ps2pm_i_n_trn;      	// next pktag returned on trn request
  wire						ps2pm_i_gnt;        	// grant signal for request
  wire [`FIRE_DLC_PSR_TRN_WDTH-1:0] 		pm2ps_i_trn;           // pktag to be read from
  wire [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0] 	ps2pm_i_rd_data;    // data read from scbd (pktag is address read from)

  //------------------------------------------------------------------------
  //  DIU Wires     
  //----------------------------------------------------------------------- 

  wire						tm2di_wr;
  wire [`FIRE_DLC_TRD_ADDR_WDTH-1:0] 		tm2di_addr;	// Address width, to address 128 entries DMA / 64 entries PIO 1 bit select
  wire [`FIRE_DLC_TRD_DATA_WDTH-1:0] 		tm2di_data;	// Data width, 16 bytes
  wire [`FIRE_DLC_TRD_BMASK_WDTH-1:0] 		tm2di_bmask;	// 16 bit bmask
  wire [`FIRE_DLC_TRD_DPAR_WDTH-1:0] 		tm2di_dpar;	// Parity width 32 bit parity on data 1 bit for 16 bit bmask

  //------------------------------------------------------------------------
  //  Reset Wires    
  //----------------------------------------------------------------------- 

  wire						rst_l;
  wire						por_l;
 
  //------------------------------------------------------------------------
  //  Debug Wires    
  //----------------------------------------------------------------------- 

  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2im_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2im_dbg_sel_b;
  wire [`FIRE_DEBUG_WDTH-1:0] 			im2cr_dbg_a;
  wire [`FIRE_DEBUG_WDTH-1:0] 			im2cr_dbg_b;

  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2cm_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2cm_dbg_sel_b;
  wire [`FIRE_DEBUG_WDTH-1:0] 			cm2cr_dbg_a;
  wire [`FIRE_DEBUG_WDTH-1:0] 			cm2cr_dbg_b;

  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2cl_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2cl_dbg_sel_b;
  wire [`FIRE_DEBUG_WDTH-1:0] 			cl2cr_dbg_a;
  wire [`FIRE_DEBUG_WDTH-1:0] 			cl2cr_dbg_b;

  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2ts_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2ts_dbg_sel_b;
  wire [`FIRE_DEBUG_WDTH-1:0] 			ts2cr_dbg_a;
  wire [`FIRE_DEBUG_WDTH-1:0] 			ts2cr_dbg_b;

  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2tm_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2tm_dbg_sel_b;
  wire [`FIRE_DEBUG_WDTH-1:0] 			tm2cr_dbg_a;
  wire [`FIRE_DEBUG_WDTH-1:0] 			tm2cr_dbg_b;

  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2rm_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2rm_dbg_sel_b;
  wire [`FIRE_DEBUG_WDTH-1:0] 			rm2cr_dbg_a;
  wire [`FIRE_DEBUG_WDTH-1:0] 			rm2cr_dbg_b;

  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2ps_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2ps_dbg_sel_b;
  wire [`FIRE_DEBUG_WDTH-1:0] 			ps2cr_dbg_a;
  wire [`FIRE_DEBUG_WDTH-1:0] 			ps2cr_dbg_b;

  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2pm_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2pm_dbg_sel_b;
  wire [`FIRE_DEBUG_WDTH-1:0] 			pm2cr_dbg_a;
  wire [`FIRE_DEBUG_WDTH-1:0] 			pm2cr_dbg_b;

  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2mm_dbg_sel_a;
  wire [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] 		cr2mm_dbg_sel_b;
  wire [`FIRE_DEBUG_WDTH-1:0] 			mm2cr_dbg_a;
  wire [`FIRE_DEBUG_WDTH-1:0] 			mm2cr_dbg_b;
  wire						cl2di_rd_en;
  wire						rm2crm_npwr_wrack,csr_sun4v_en,im2tm_eqs_adr_63;
  wire						im2crm_bc_stall_en, im2crm_ilu_stall_en;
//############################################################################
//		    		EFU wires
//############################################################################   
  wire         					efu_dmu_data ;        // input efu to devtsb
  wire         					efu_dmu_xfer_en;      // input efu to devtsb
  wire         					efu_dmu_clr;          // input efu to devtsb
  wire         					dmu_efu_data;         // output of devtsb to efu
  wire         					dmu_efu_xfer_en ;     // output of devtsb to efu
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################   


//############################################################################
//		    		TIE OFFS
//############################################################################ 

  assign d2j_spare = j2d_spare;		
 
//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################ 
`ifdef IOMMU_SAT
`else

  dmu_rmu rmu
    (
     .clk			(l1clk),
     .rst_l			(rst_l),

     .d2j_p_wrack_tag		(d2j_p_wrack_tag),
     .d2j_p_wrack_vld		(d2j_p_wrack_vld),

     .y2k_rel_rcd		(y2k_rel_rcd),
     .y2k_rel_enq		(y2k_rel_enq),

     .k2y_rcd			(k2y_rcd),
     .k2y_rcd_enq		(k2y_rcd_enq),
     .y2k_rcd_deq		(y2k_rcd_deq),

     .tm2rm_rcd			(tm2rm_rcd),
     .tm2rm_rcd_enq		(tm2rm_rcd_enq),
     .rm2tm_rcd_full		(rm2tm_rcd_full),

     .rm2im_rcd			(rm2im_rcd),
     .rm2im_rcd_enq		(rm2im_rcd_enq),

     .im2rm_rcd			(im2rm_rcd),
     .im2rm_rcd_enq		(im2rm_rcd_enq),

     .im2rm_mdo			(im2rm_mdo),
     .im2rm_mdo_enq		(im2rm_mdo_enq),

     .rm2im_rply		(rm2im_rply),
     .rm2im_rply_enq		(rm2im_rply_enq),

     .im2rm_mem64_offset_reg	(im2rm_mem64_offset_reg),

     .rm2ts_i_cmd_type		(rm2ts_i_cmd_type),
     .rm2ts_i_wr_data		(rm2ts_i_wr_data),	
     .rm2ts_i_req		(rm2ts_i_req),
     .ts2rm_i_gnt		(ts2rm_i_gnt),
     .ts2rm_i_full		(ts2rm_i_full),
     .ts2rm_i_n_trn		(ts2rm_i_n_trn),

     .rm2ts_e_cmd_type		(rm2ts_e_cmd_type),
     .rm2ts_e_wr_data		(rm2ts_e_wr_data),
     .rm2ts_e_trn		(rm2ts_e_trn),
     .rm2ts_e_req		(rm2ts_e_req),
     .ts2rm_e_gnt		(ts2rm_e_gnt),
     .ts2rm_e_rd_data		(ts2rm_e_rd_data),

     .rm2mm_rcd			(rm2mm_rcd),
     .rm2mm_rcd_enq		(rm2mm_rcd_enq),
     .mm2rm_rcd_full		(mm2rm_rcd_full),

     .cm2rm_rcd			(cm2rm_rcd),
     .cm2rm_rcd_enq		(cm2rm_rcd_enq),
     .rm2cm_rcd_full		(rm2cm_rcd_full),

     .rm2cl_bufrel		(rm2cl_bufrel),
     .rm2cl_bufrel_enq		(rm2cl_bufrel_enq),

     .cr2rm_req_id		(cr2rm_req_id),
     .cr2rm_dbg_sel_a		(cr2rm_dbg_sel_a),
     .cr2rm_dbg_sel_b		(cr2rm_dbg_sel_b),
     .rm2cr_dbg_a		(rm2cr_dbg_a),
     .rm2cr_dbg_b		(rm2cr_dbg_b),

     .rm2crm_npwr_wrack		(rm2crm_npwr_wrack)
     );

  dmu_imu imu
    (
     .clk			(l1clk),
     .rst_l			(rst_l),
     .por_l			(por_l),

     .im2rm_rcd			(im2rm_rcd),
     .im2rm_rcd_enq		(im2rm_rcd_enq),

     .rm2im_rcd			(rm2im_rcd),
     .rm2im_rcd_enq		(rm2im_rcd_enq),

     .tm2im_data		(tm2im_data),
     .tm2im_data_enq		(tm2im_data_enq),

     .j2d_jid			(j2d_jid),
     .j2d_instance_id		(j2d_instance_id),

     .rm2im_rply		(rm2im_rply),
     .rm2im_rply_enq		(rm2im_rply_enq),

     .mm2im_int			(mm2im_int),
     .y2k_int_l			(y2k_int_l),
//     .j2d_ext_int_l		(j2d_ext_int_l),
//     .j2d_i2c0_int_l		(j2d_i2c0_int_l),
//     .j2d_i2c1_int_l		(j2d_i2c1_int_l),
//     .j2d_jbc_int_l		(j2d_jbc_int_l),

     .im2rm_mdo_enq		(im2rm_mdo_enq),
     .im2rm_mdo			(im2rm_mdo),

     .im2di_wr			(im2di_wr),
     .im2di_addr		(im2di_addr),
     .im2di_data		(im2di_data),
     .im2di_dpar		(im2di_dpar),
     .im2di_bmask		(im2di_bmask),

     .im2tm_msi32_addr_reg	(im2tm_msi32_addr_reg),
     .im2tm_msi64_addr_reg	(im2tm_msi64_addr_reg),
     .im2rm_mem64_offset_reg	(im2rm_mem64_offset_reg),

     .cr2im_csrbus_valid	(cr2im_csrbus_valid),
     .im2cr_csrbus_done		(im2cr_csrbus_done),
     .im2cr_csrbus_mapped	(im2cr_csrbus_mapped),
     .cr2im_csrbus_wr_data	(cr2im_csrbus_wr_data),
     .cr2im_csrbus_wr		(cr2im_csrbus_wr),
     .im2cr_csrbus_read_data	(im2cr_csrbus_read_data),
     .cr2im_csrbus_addr		(cr2im_csrbus_addr),
     .cr2im_csrbus_src_bus	(cr2im_csrbus_src_bus),
     .im2cr_csrbus_acc_vio	(im2cr_csrbus_acc_vio),

     .cr2im_dbg_sel_a		(cr2im_dbg_sel_a),
     .cr2im_dbg_sel_b		(cr2im_dbg_sel_b),
     .im2cr_dbg_a		(im2cr_dbg_a),
     .im2cr_dbg_b		(im2cr_dbg_b),
     .dmu_dbg_err_event		(dmu_dbg_err_event),
     .csr_sun4v_en		(csr_sun4v_en),
     .im2tm_eqs_adr_63		(im2tm_eqs_adr_63),
     .im2crm_bc_stall_en	(im2crm_bc_stall_en),
     .im2crm_ilu_stall_en	(im2crm_ilu_stall_en)
     );

  dmu_cru cru
    (
     .clk			(l1clk),
     .rst_l			(rst_l),

     .j2d_instance_id		(j2d_instance_id),

     .j2d_csr_ring_out		(j2d_csr_ring_out),
     .d2j_csr_ring_in		(d2j_csr_ring_in),

     .k2y_csr_ring_out		(k2y_csr_ring_out),
     .y2k_csr_ring_in		(y2k_csr_ring_in),

     .cr2im_csrbus_valid	(cr2im_csrbus_valid),
     .im2cr_csrbus_done		(im2cr_csrbus_done),
     .im2cr_csrbus_mapped	(im2cr_csrbus_mapped),
     .cr2im_csrbus_wr_data	(cr2im_csrbus_wr_data),
     .cr2im_csrbus_wr		(cr2im_csrbus_wr),
     .im2cr_csrbus_read_data	(im2cr_csrbus_read_data),
     .cr2im_csrbus_addr		(cr2im_csrbus_addr),
     .cr2im_csrbus_src_bus	(cr2im_csrbus_src_bus),
     .im2cr_csrbus_acc_vio	(im2cr_csrbus_acc_vio),

     .cr2mm_csrbus_valid	(cr2mm_csrbus_valid),
     .mm2cr_csrbus_done		(mm2cr_csrbus_done),
     .mm2cr_csrbus_mapped	(mm2cr_csrbus_mapped),
     .cr2mm_csrbus_wr_data	(cr2mm_csrbus_wr_data),
     .cr2mm_csrbus_wr		(cr2mm_csrbus_wr),
     .mm2cr_csrbus_read_data	(mm2cr_csrbus_read_data),
     .cr2mm_csrbus_addr		(cr2mm_csrbus_addr),
     .cr2mm_csrbus_src_bus	(cr2mm_csrbus_src_bus),
     .mm2cr_csrbus_acc_vio	(mm2cr_csrbus_acc_vio),

     .cr2ps_csrbus_valid	(cr2ps_csrbus_valid),
     .ps2cr_csrbus_done		(ps2cr_csrbus_done),
     .ps2cr_csrbus_mapped	(ps2cr_csrbus_mapped),
     .cr2ps_csrbus_wr_data	(cr2ps_csrbus_wr_data),
     .cr2ps_csrbus_wr		(cr2ps_csrbus_wr),
     .ps2cr_csrbus_read_data	(ps2cr_csrbus_read_data),
     .cr2ps_csrbus_addr		(cr2ps_csrbus_addr),
     .cr2ps_csrbus_src_bus	(cr2ps_csrbus_src_bus),
     .ps2cr_csrbus_acc_vio	(ps2cr_csrbus_acc_vio),

     .cr2ts_csrbus_valid	(cr2ts_csrbus_valid),
     .ts2cr_csrbus_done		(ts2cr_csrbus_done),
     .ts2cr_csrbus_mapped	(ts2cr_csrbus_mapped),
     .cr2ts_csrbus_wr_data	(cr2ts_csrbus_wr_data),
     .cr2ts_csrbus_wr		(cr2ts_csrbus_wr),
     .ts2cr_csrbus_read_data	(ts2cr_csrbus_read_data),
     .cr2ts_csrbus_addr		(cr2ts_csrbus_addr),
     .cr2ts_csrbus_src_bus	(cr2ts_csrbus_src_bus),
     .ts2cr_csrbus_acc_vio	(ts2cr_csrbus_acc_vio),

     .cr2cl_bus_num		(cr2cl_bus_num),
     .cr2rm_req_id		(cr2rm_req_id),
     .d2p_req_id		(d2p_req_id),

     .cr2im_dbg_sel_a		(cr2im_dbg_sel_a),
     .cr2im_dbg_sel_b		(cr2im_dbg_sel_b),
     .im2cr_dbg_a		(im2cr_dbg_a),
     .im2cr_dbg_b		(im2cr_dbg_b),

     .cr2cm_dbg_sel_a		(cr2cm_dbg_sel_a),
     .cr2cm_dbg_sel_b		(cr2cm_dbg_sel_b),
     .cm2cr_dbg_a		(cm2cr_dbg_a),
     .cm2cr_dbg_b		(cm2cr_dbg_b),

     .cr2cl_dbg_sel_a		(cr2cl_dbg_sel_a),
     .cr2cl_dbg_sel_b		(cr2cl_dbg_sel_b),
     .cl2cr_dbg_a		(cl2cr_dbg_a),
     .cl2cr_dbg_b		(cl2cr_dbg_b),

     .cr2ts_dbg_sel_a		(cr2ts_dbg_sel_a),
     .cr2ts_dbg_sel_b		(cr2ts_dbg_sel_b),
     .ts2cr_dbg_a		(ts2cr_dbg_a),
     .ts2cr_dbg_b		(ts2cr_dbg_b),

     .cr2tm_dbg_sel_a		(cr2tm_dbg_sel_a),
     .cr2tm_dbg_sel_b		(cr2tm_dbg_sel_b),
     .tm2cr_dbg_a		(tm2cr_dbg_a),
     .tm2cr_dbg_b		(tm2cr_dbg_b),

     .cr2rm_dbg_sel_a		(cr2rm_dbg_sel_a),
     .cr2rm_dbg_sel_b		(cr2rm_dbg_sel_b),
     .rm2cr_dbg_a		(rm2cr_dbg_a),
     .rm2cr_dbg_b		(rm2cr_dbg_b),
   
     .cr2ps_dbg_sel_a		(cr2ps_dbg_sel_a),
     .cr2ps_dbg_sel_b		(cr2ps_dbg_sel_b),
     .ps2cr_dbg_a		(ps2cr_dbg_a),
     .ps2cr_dbg_b		(ps2cr_dbg_b),
   
     .cr2pm_dbg_sel_a		(cr2pm_dbg_sel_a),
     .cr2pm_dbg_sel_b		(cr2pm_dbg_sel_b),
     .pm2cr_dbg_a		(pm2cr_dbg_a),
     .pm2cr_dbg_b		(pm2cr_dbg_b),
     
     .cr2mm_dbg_sel_a		(cr2mm_dbg_sel_a),
     .cr2mm_dbg_sel_b		(cr2mm_dbg_sel_b),
     .mm2cr_dbg_a		(mm2cr_dbg_a),
     .mm2cr_dbg_b		(mm2cr_dbg_b),

     .k2y_dbg_sel_a		(k2y_dbg_sel_a),
     .k2y_dbg_sel_b		(k2y_dbg_sel_b),
     .y2k_dbg_a			(y2k_dbg_a),
     .y2k_dbg_b			(y2k_dbg_b),

     .cr2ds_dbg_sel_a		(cr2ds_dbg_sel_a[5:0]),
     .cr2ds_dbg_sel_b		(cr2ds_dbg_sel_b[5:0]),
     .ds2cr_dbg_a		(ds2cr_dbg_a[7:0]),
     .ds2cr_dbg_b		(ds2cr_dbg_b[7:0]),

     .dmu_mio_debug_bus_a	(dmu_mio_debug_bus_a[7:0]),
     .dmu_mio_debug_bus_b	(dmu_mio_debug_bus_b[7:0])
     );

  dmu_clu clu
    (
     .clk			(l1clk),
     .rst_l			(rst_l),
     .d2j_cmd			(d2j_cmd),
     .d2j_addr			(d2j_addr),
     .d2j_ctag			(d2j_ctag),
     .d2j_cmd_vld		(d2j_cmd_vld),
     .d2j_data			(d2j_data),
     .d2j_bmsk			(d2j_bmsk),
     .d2j_data_par		(d2j_data_par),
     .d2j_data_vld		(d2j_data_vld),
     .j2d_d_wrack_tag		(j2d_d_wrack_tag),
     .j2d_d_wrack_vld		(j2d_d_wrack_vld),
     .j2d_di_cmd		(j2d_di_cmd),
     .j2d_di_ctag		(j2d_di_ctag),
     .j2d_di_cmd_vld		(j2d_di_cmd_vld),
     .j2d_p_cmd			(j2d_p_cmd),
     .j2d_p_addr		(j2d_p_addr),
     .j2d_p_bmsk		(j2d_p_bmsk),
     .j2d_p_ctag		(j2d_p_ctag),
     .j2d_p_cmd_vld		(j2d_p_cmd_vld),
     .j2d_d_data		(j2d_d_data),
     .j2d_d_data_par		(j2d_d_data_par),
     .j2d_d_data_err		(j2d_d_data_err),
     .j2d_d_data_vld		(j2d_d_data_vld),
     .j2d_p_data		(j2d_p_data),
     .j2d_p_data_par		(j2d_p_data_par),
     .j2d_p_data_vld		(j2d_p_data_vld),
     .k2y_dou_dptr		(k2y_dou_dptr),
     .k2y_dou_err		(k2y_dou_err),
     .k2y_dou_vld		(k2y_dou_vld),
     .cl2ps_e_cmd_type		(cl2ps_e_cmd_type),
     .cl2ps_e_trn		(cl2ps_e_trn),
     .cl2ps_e_wr_data		(cl2ps_e_wr_data),
     .cl2ps_e_req		(cl2ps_e_req),
     .ps2cl_e_rd_data		(ps2cl_e_rd_data),
     .ps2cl_e_gnt		(ps2cl_e_gnt),
     .cl2pm_rcd_full		(cl2pm_rcd_full),
     .pm2cl_rcd			(pm2cl_rcd),
     .pm2cl_rcd_enq		(pm2cl_rcd_enq),
     .cl2cm_rcd			(cl2cm_rcd),
     .cl2cm_rcd_enq		(cl2cm_rcd_enq),
     .cm2cl_rcd_full		(cm2cl_rcd_full),
     .cl2mm_tcr_ack		(cl2mm_tcr_ack),
     .mm2cl_tcr_rcd		(mm2cl_tcr_rcd),
     .mm2cl_tcr_req		(mm2cl_tcr_req),
     .cl2mm_tdr_rcd		(cl2mm_tdr_rcd),
     .cl2mm_tdr_vld		(cl2mm_tdr_vld),
     .rm2cl_bufrel		(rm2cl_bufrel),
     .rm2cl_bufrel_enq		(rm2cl_bufrel_enq),
     .cl2tm_dma_rptr		(cl2tm_dma_rptr),
     .cl2tm_int_rptr		(cl2tm_int_rptr),
     .tm2cl_dma_wptr		(tm2cl_dma_wptr),
     .tm2cl_pio_wptr		(tm2cl_pio_wptr),
     .cl2di_addr		(cl2di_addr),
     .cl2di_rd_en		(cl2di_rd_en),
     .di2cl_data		(di2cl_data),
     .di2cl_bmask		(di2cl_bmask),
     .di2cl_dpar		(di2cl_dpar),
     .cl2do_dma_data		(cl2do_dma_data),
     .cl2do_dma_dpar		(cl2do_dma_dpar),
     .cl2do_dma_addr		(cl2do_dma_addr),
     .cl2do_dma_wr		(cl2do_dma_wr),
     .cl2do_pio_data		(cl2do_pio_data),
     .cl2do_pio_dpar		(cl2do_pio_dpar),
     .cl2do_pio_addr		(cl2do_pio_addr),
     .cl2do_pio_wr		(cl2do_pio_wr),
     .cl2cr_dbg_a		(cl2cr_dbg_a),
     .cl2cr_dbg_b		(cl2cr_dbg_b),
     .cr2cl_dbg_sel_a		(cr2cl_dbg_sel_a),
     .cr2cl_dbg_sel_b		(cr2cl_dbg_sel_b),
     .cr2cl_bus_num        	(cr2cl_bus_num),
     .ds2cl_stall        	(ds2cl_stall),
     .p2d_npwr_stall_en        	(p2d_npwr_stall_en),
     .rm2crm_npwr_wrack        	(rm2crm_npwr_wrack),
     .im2crm_bc_stall_en        (im2crm_bc_stall_en),
     .im2crm_ilu_stall_en       (im2crm_ilu_stall_en),
     .il2cl_gr_16       	(il2cl_gr_16)
     );

  dmu_cmu cmu
    (
     .clk			(l1clk),
     .rst_l			(rst_l),

     .cr2cm_dbg_sel_a		(cr2cm_dbg_sel_a),
     .cm2cr_dbg_a		(cm2cr_dbg_a),        
     .cr2cm_dbg_sel_b		(cr2cm_dbg_sel_b),
     .cm2cr_dbg_b		(cm2cr_dbg_b),        

     .mm2cm_rcd_enq		(mm2cm_rcd_enq),
     .mm2cm_rcd			(mm2cm_rcd),
     .cm2mm_rcd_full		(cm2mm_rcd_full),
     .cm2pm_rcd_enq		(cm2pm_rcd_enq),
     .cm2pm_rcd			(cm2pm_rcd),

     .pm2cm_rcd_full		(pm2cm_rcd_full),

     .cl2cm_rcd_enq		(cl2cm_rcd_enq),
     .cl2cm_rcd			(cl2cm_rcd),
     .cm2cl_rcd_full		(cm2cl_rcd_full),
     .cm2rm_rcd_enq		(cm2rm_rcd_enq),
     .cm2rm_rcd			(cm2rm_rcd),
     .rm2cm_rcd_full		(rm2cm_rcd_full),

     .y2k_mps			(y2k_mps)
     );

  dmu_pmu pmu
    (
     .clk			(l1clk),
     .rst_l			(rst_l),

     .cr2pm_dbg_sel_a		(cr2pm_dbg_sel_a),
     .pm2cr_dbg_a		(pm2cr_dbg_a),  
     .cr2pm_dbg_sel_b		(cr2pm_dbg_sel_b),
     .pm2cr_dbg_b		(pm2cr_dbg_b), 

     .cm2pm_rcd_enq		(cm2pm_rcd_enq),
     .cm2pm_rcd			(cm2pm_rcd),
     .pm2cm_rcd_full		(pm2cm_rcd_full),

     .pm2cl_rcd_enq		(pm2cl_rcd_enq),
     .pm2cl_rcd			(pm2cl_rcd),
     .cl2pm_rcd_full		(cl2pm_rcd_full),

     .pm2ps_i_req		(pm2ps_i_req),
     .ps2pm_i_gnt		(ps2pm_i_gnt),
     .pm2ps_i_trn		(pm2ps_i_trn),
     .ps2pm_i_n_trn		(ps2pm_i_n_trn),
     .pm2ps_i_cmd_type		(pm2ps_i_cmd_type),
     .ps2pm_i_full		(ps2pm_i_full),
     .pm2ps_i_wr_data		(pm2ps_i_wr_data),
     .ps2pm_i_rd_data		(ps2pm_i_rd_data)
     );

  dmu_dou dou
    (
     .l2clk			(l2clk),
     .clk			(l1clk),
     .rst_l			(rst_l),
     .scan_in                   (scan_in),
     .tcu_array_bypass          (tcu_array_bypass),
     .tcu_scan_en      		(tcu_scan_en),
     .tcu_se_scancollar_in      (tcu_se_scancollar_in),
     .tcu_se_scancollar_out     (tcu_se_scancollar_out),
     .tcu_array_wr_inhibit      (tcu_array_wr_inhibit),
     .tcu_pce_ov                (tcu_pce_ov),
     .tcu_aclk                  (tcu_aclk),
     .tcu_bclk                  (tcu_bclk),
     .scan_out                  (),

     .cl2do_dma_wr		(cl2do_dma_wr),
     .cl2do_dma_addr		(cl2do_dma_addr),
     .cl2do_dma_data		(cl2do_dma_data),
     .cl2do_dma_dpar		(cl2do_dma_dpar),

     .cl2do_pio_wr		(cl2do_pio_wr),
     .cl2do_pio_addr		(cl2do_pio_addr),
     .cl2do_pio_data		(cl2do_pio_data),
     .cl2do_pio_dpar		(cl2do_pio_dpar),

     .y2k_buf_addr		(y2k_buf_addr),
     .k2y_buf_data		(k2y_buf_data),
     .k2y_buf_dpar		(k2y_buf_dpar),

     .dmu_mb0_run                   (dmu_mb0_run),
     .dmu_mb0_addr                  (dmu_mb0_addr[7:0]),
     .dmu_mb0_wdata                 (dmu_mb0_wdata),
     .dmu_mb0_dou_dma_data_wr_en    (dmu_mb0_dou_dma_data_wr_en),
     .dmu_mb0_dou_dma_data_rd_en    (dmu_mb0_dou_dma_data_rd_en),
     .dmu_mb0_dou_pio_data_wr_en    (dmu_mb0_dou_pio_data_wr_en),
     .dmu_mb0_dou_pio_data_rd_en    (dmu_mb0_dou_pio_data_rd_en),
     .dmu_dou_pio_read_data         (dmu_dou_pio_read_data),
     .dmu_dou_dma_read_data	    (dmu_dou_dma_read_data)
     );  

  dmu_diu diu
    (
     .l2clk			(l2clk),
     .clk			(l1clk),
     .rst_l			(rst_l),
     .scan_in			(scan_in),
     .tcu_array_bypass		(tcu_array_bypass),
     .tcu_scan_en		(tcu_scan_en),
     .tcu_se_scancollar_in	(tcu_se_scancollar_in),
     .tcu_array_wr_inhibit	(tcu_array_wr_inhibit),
     .tcu_pce_ov		(tcu_pce_ov),
     .tcu_aclk			(tcu_aclk),
     .tcu_bclk			(tcu_bclk),
     .scan_out			(),

     .tm2di_wr			(tm2di_wr),
     .tm2di_addr		(tm2di_addr),
     .tm2di_data		(tm2di_data),
     .tm2di_bmask		(tm2di_bmask),
     .tm2di_dpar		(tm2di_dpar),

     .im2di_wr			(im2di_wr),
     .im2di_addr		(im2di_addr),
     .im2di_data		(im2di_data),
     .im2di_bmask		(im2di_bmask),
     .im2di_dpar		(im2di_dpar),

     .cl2di_addr		(cl2di_addr),
     .cl2di_rd_en		(cl2di_rd_en),
     .di2cl_data		(di2cl_data),
     .di2cl_dpar		(di2cl_dpar),
     .di2cl_bmask		(di2cl_bmask),

     .dmu_diu_read_data		(dmu_diu_read_data),
     .dmu_mb0_run		(dmu_mb0_run),
     .dmu_mb0_addr		(dmu_mb0_addr[7:0]),
     .dmu_mb0_wdata		(dmu_mb0_wdata),
     .dmu_mb0_diu_wr_en		(dmu_mb0_diu_wr_en),
     .dmu_mb0_diu_rd_en		(dmu_mb0_diu_rd_en)
     );

`endif


  dmu_mmu mmu
    (
     .l2clk			(l2clk),
     .clk			(l1clk),
     .por_l			(por_l),
     .rst_l			(rst_l),
     .scan_in                     (scan_in),
     .tcu_array_bypass            (tcu_array_bypass),
     .tcu_scan_en        	  (tcu_scan_en),
     .tcu_se_scancollar_in        (tcu_se_scancollar_in),
     .tcu_array_wr_inhibit        (tcu_array_wr_inhibit),
     .tcu_pce_ov                  (tcu_pce_ov),
     .tcu_aclk                    (tcu_aclk),
     .tcu_bclk                    (tcu_bclk),
     .scan_out                    (scan_out),

     .j2d_instance_id		(j2d_instance_id),
     .j2d_mmu_addr		(j2d_mmu_addr),
     .j2d_mmu_addr_vld		(j2d_mmu_addr_vld),

     .cl2mm_tcr_ack		(cl2mm_tcr_ack),

     .cm2mm_rcd_full		(cm2mm_rcd_full),

     .cr2mm_csrbus_addr		(cr2mm_csrbus_addr),
     .cr2mm_csrbus_src_bus	(cr2mm_csrbus_src_bus),
     .cr2mm_csrbus_valid	(cr2mm_csrbus_valid),
     .cr2mm_csrbus_wr		(cr2mm_csrbus_wr),
     .cr2mm_csrbus_wr_data	(cr2mm_csrbus_wr_data),
     .cr2mm_dbg_sel_a		(cr2mm_dbg_sel_a),
     .cr2mm_dbg_sel_b		(cr2mm_dbg_sel_b),

     .cl2mm_tdr_rcd		(cl2mm_tdr_rcd),
     .cl2mm_tdr_vld		(cl2mm_tdr_vld),

     .rm2mm_rcd			(rm2mm_rcd),
     .rm2mm_rcd_enq		(rm2mm_rcd_enq),

//     .d2j_tsb_base		(d2j_tsb_base),
//     .d2j_tsb_enable		(d2j_tsb_enable),
//     .d2j_tsb_size		(d2j_tsb_size),

     .mm2cl_tcr_rcd		(mm2cl_tcr_rcd),
     .mm2cl_tcr_req		(mm2cl_tcr_req),
     .mm2cm_rcd			(mm2cm_rcd),
     .mm2cm_rcd_enq		(mm2cm_rcd_enq),

     .mm2cr_csrbus_acc_vio	(mm2cr_csrbus_acc_vio),
     .mm2cr_csrbus_done		(mm2cr_csrbus_done),
     .mm2cr_csrbus_mapped	(mm2cr_csrbus_mapped),
     .mm2cr_csrbus_read_data	(mm2cr_csrbus_read_data),
     .mm2cr_dbg_a		(mm2cr_dbg_a),
     .mm2cr_dbg_b		(mm2cr_dbg_b),

     .mm2im_int			(mm2im_int),

     .mm2rm_rcd_full		(mm2rm_rcd_full),

     .dsn_dmc_iei		(dsn_dmc_iei),

     .ptb2csr_rd2               (mmu_ptb_read_data),
     .vtb2csr_rd                (vtb2csr_rd),
     .dmu_cb0_run               (dmu_cb0_run),
     .dmu_cb0_addr              (dmu_cb0_addr),
     .dmu_cb0_wdata_key         (dmu_cb0_wdata_key),
     .dmu_cb0_mmu_ptb_wr_en     (dmu_cb0_mmu_ptb_wr_en),
     .dmu_cb0_mmu_ptb_rd_en     (dmu_cb0_mmu_ptb_rd_en),
     .dmu_cb0_mmu_ptb_lkup_en   (dmu_cb0_mmu_ptb_lkup_en),
     .mmu_ptb_hit               (mmu_ptb_hit),
     .dmu_cb0_mmu_vtb_wr_en     (dmu_cb0_mmu_vtb_wr_en),
     .dmu_cb0_mmu_vtb_rd_en     (dmu_cb0_mmu_vtb_rd_en),
     .dmu_cb0_mmu_vtb_lkup_en   (dmu_cb0_mmu_vtb_lkup_en),
     .dmu_cb0_hld   		(dmu_cb0_hld),
     .mmu_vtb_hit               (mmu_vtb_hit),
     .vtb_dout_4msb             (vtb_dout_4msb),
     .tdb_dout_8msb             (tdb_dout_8msb),
     .dmu_mb0_run               (dmu_mb0_run),
     .dmu_mb0_addr              (dmu_mb0_addr),
     .dmu_mb0_wdata             (dmu_mb0_wdata),
     .dmu_mb0_tdb_wr_en         (dmu_mb0_tdb_wr_en),
     .dmu_mb0_tdb_rd_en         (dmu_mb0_tdb_rd_en),
     .tdb2csr_rd                (tdb2csr_rd),
     .dmu_mb0_dev_wr_en         (dmu_mb0_dev_wr_en),
     .dmu_mb0_dev_rd_en         (dmu_mb0_dev_rd_en),
     .dmu_mb0_tsb_wr_en         (dmu_mb0_tsb_wr_en),
     .dmu_mb0_tsb_rd_en         (dmu_mb0_tsb_rd_en),
     .dev_iotsb2csr_rd          (dev_tsb_read_data),
     .efu_dmu_data              (efu_dmu_data),        // input efu to devtsb
     .efu_dmu_xfer_en           (efu_dmu_xfer_en),     // input efu to devtsb
     .efu_dmu_clr               (efu_dmu_clr),     	// input efu to devtsb
     .dmu_efu_data              (dmu_efu_data),        // output of devtsb to efu
     .dmu_efu_xfer_en           (dmu_efu_xfer_en),     // output of devtsb to efu
     .csr_sun4v_en              (csr_sun4v_en)         // sun4v csr enable bit to imu


     );

`ifdef IOMMU_SAT
`else

  dmu_psb psb
    (
     .clk			(l1clk),
     .rst_l			(rst_l),
     .pm2ps_i_req		(pm2ps_i_req),
     .pm2ps_i_cmd_type		(pm2ps_i_cmd_type),
     .pm2ps_i_trn		(pm2ps_i_trn),
     .pm2ps_i_wr_data		(pm2ps_i_wr_data),
     .ps2pm_i_full		(ps2pm_i_full),
     .ps2pm_i_gnt		(ps2pm_i_gnt),
     .ps2pm_i_n_trn		(ps2pm_i_n_trn),
     .ps2pm_i_rd_data		(ps2pm_i_rd_data),
     .cl2ps_e_req		(cl2ps_e_req),
     .cl2ps_e_cmd_type		(cl2ps_e_cmd_type),
     .cl2ps_e_trn		(cl2ps_e_trn),
     .cl2ps_e_wr_data		(cl2ps_e_wr_data),
     .ps2cl_e_gnt		(ps2cl_e_gnt),
     .ps2cl_e_rd_data		(ps2cl_e_rd_data),
     .cr2ps_csrbus_valid	(cr2ps_csrbus_valid),
     .cr2ps_csrbus_src_bus	(cr2ps_csrbus_src_bus),
     .cr2ps_csrbus_addr		(cr2ps_csrbus_addr),
     .cr2ps_csrbus_wr		(cr2ps_csrbus_wr),
     .cr2ps_csrbus_wr_data	(cr2ps_csrbus_wr_data),
     .ps2cr_csrbus_mapped	(ps2cr_csrbus_mapped),
     .ps2cr_csrbus_read_data	(ps2cr_csrbus_read_data),
     .ps2cr_csrbus_done		(ps2cr_csrbus_done),
     .ps2cr_csrbus_acc_vio	(ps2cr_csrbus_acc_vio),
     .j2d_instance_id		(j2d_instance_id),

     .cr2ps_dbg_sel_a		(cr2ps_dbg_sel_a),
     .cr2ps_dbg_sel_b		(cr2ps_dbg_sel_b),
     .ps2cr_dbg_a		(ps2cr_dbg_a),
     .ps2cr_dbg_b		(ps2cr_dbg_b)
     );

  dmu_tsb tsb
    (
     .clk			(l1clk),
     .rst_l			(rst_l),

     .rm2ts_i_req		(rm2ts_i_req),
     .rm2ts_i_cmd_type		(rm2ts_i_cmd_type),
     .rm2ts_i_wr_data		(rm2ts_i_wr_data),
     .ts2rm_i_full		(ts2rm_i_full),
     .ts2rm_i_gnt		(ts2rm_i_gnt),
     .ts2rm_i_n_trn		(ts2rm_i_n_trn),

     .rm2ts_e_req		(rm2ts_e_req),
     .rm2ts_e_cmd_type		(rm2ts_e_cmd_type),
     .rm2ts_e_trn		(rm2ts_e_trn),
     .rm2ts_e_wr_data		(rm2ts_e_wr_data),
     .ts2rm_e_gnt		(ts2rm_e_gnt),
     .ts2rm_e_rd_data		(ts2rm_e_rd_data),

     .cr2ts_csrbus_valid	(cr2ts_csrbus_valid),
     .cr2ts_csrbus_src_bus	(cr2ts_csrbus_src_bus),
     .cr2ts_csrbus_addr		(cr2ts_csrbus_addr),
     .cr2ts_csrbus_wr		(cr2ts_csrbus_wr),
     .cr2ts_csrbus_wr_data	(cr2ts_csrbus_wr_data),
     .ts2cr_csrbus_mapped	(ts2cr_csrbus_mapped),
     .ts2cr_csrbus_read_data	(ts2cr_csrbus_read_data),
     .ts2cr_csrbus_done		(ts2cr_csrbus_done),
     .ts2cr_csrbus_acc_vio	(ts2cr_csrbus_acc_vio),
     .j2d_instance_id		(j2d_instance_id),

     .cr2ts_dbg_sel_a		(cr2ts_dbg_sel_a),
     .cr2ts_dbg_sel_b		(cr2ts_dbg_sel_b),
     .ts2cr_dbg_a		(ts2cr_dbg_a),
     .ts2cr_dbg_b		(ts2cr_dbg_b)
     );

  dmu_tmu tmu
    ( 
      .clk			(l1clk),
      .rst_l			(rst_l),

      .d2p_idb_rd		(d2p_idb_rd),

      .y2k_rcd			(y2k_rcd),
      .y2k_rcd_enq		(y2k_rcd_enq),
      .k2y_rcd_deq		(k2y_rcd_deq),

      .k2y_rel_rcd		(k2y_rel_rcd),
      .k2y_rel_enq		(k2y_rel_enq),
	
      .y2k_buf_addr_vld_monitor         (y2k_buf_addr_vld_monitor),
      .k2y_buf_addr_vld_monitor         (k2y_buf_addr_vld_monitor),
      .k2y_buf_addr		(k2y_buf_addr),
      .y2k_buf_data		(y2k_buf_data),
      .y2k_buf_dpar		(y2k_buf_dpar),

      .tm2di_wr			(tm2di_wr),
      .tm2di_addr		(tm2di_addr),
      .tm2di_data		(tm2di_data),
      .tm2di_bmask		(tm2di_bmask),
      .tm2di_dpar		(tm2di_dpar),

      .cl2tm_dma_rptr		(cl2tm_dma_rptr),
      .cl2tm_int_rptr		(cl2tm_int_rptr),
      .tm2cl_dma_wptr		(tm2cl_dma_wptr),
      .tm2cl_pio_wptr		(tm2cl_pio_wptr),

      .tm2rm_rcd		(tm2rm_rcd),
      .tm2rm_rcd_enq		(tm2rm_rcd_enq),
      .rm2tm_rcd_full		(rm2tm_rcd_full),

      .tm2im_data_enq		(tm2im_data_enq),
      .tm2im_data		(tm2im_data),

      .im2tm_msi32_addr_reg	(im2tm_msi32_addr_reg),
      .im2tm_msi64_addr_reg	(im2tm_msi64_addr_reg),

      .cr2tm_dbg_sel_a		(cr2tm_dbg_sel_a),
      .cr2tm_dbg_sel_b		(cr2tm_dbg_sel_b),
      .tm2cr_dbg_a		(tm2cr_dbg_a),
      .tm2cr_dbg_b		(tm2cr_dbg_b),	   
      .im2tm_eqs_adr_63		(im2tm_eqs_adr_63),	   
      .csr_sun4v_en		(csr_sun4v_en)	   
      );

assign	rst_l = j2d_rst_l;
assign	por_l = j2d_por_l;

//  lbist_rst_cct rst_cct
//    (
//     .rst_l_in			(j2d_rst_l),
//     .clk			(l1clk),
//     .bist_en			(1'b0),
//     .rst_l_out			(rst_l)  
//     );
   
//  lbist_rst_cct por_cct
//    (
//     .rst_l_in			(j2d_por_l),
//     .clk			(l1clk),
//     .bist_en			(1'b0),
//     .rst_l_out			(por_l)
//     );

`endif


endmodule // dmu_dmc
