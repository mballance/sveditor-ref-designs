// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tmu_dim.v
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
module dmu_tmu_dim (
			 clk,
			 rst_l,

                         // ilu -> peu-idb BP n2 5-06-05 rd enable to peu idb ram
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
			 
			 // CLU buf rel, DIU pointer interface
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
			 
			 // idle check
			 dim_is_idle,
			 tmu_is_idle,
			 // for sun4v msi_64 compare
			 csr_sun4v_en,
			 im2tm_eqs_adr_63
);
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  clk;		    
  input		  rst_l;
  
  //------------------------------------------------------------------------
  //   BP n2 5-06-05 rd enable to peu idb ram
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
  output 			       k2y_rcd_deq;         // ingress rcd dequeue
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
  //   CLU buf rel, DIU wr pointer interface
  //------------------------------------------------------------------------
  input [`FIRE_DLC_DMA_RPTR_WDTH-1:0]  cl2tm_dma_rptr;
  input [`FIRE_DLC_INT_RPTR_WDTH-1:0]  cl2tm_int_rptr;    
  output [`FIRE_DLC_DMA_WPTR_WDTH-1:0] tm2cl_dma_wptr;
  output [`FIRE_DLC_PIO_WPTR_WDTH-1:0] tm2cl_pio_wptr;
				      
  //------------------------------------------------------------------------
  //   RMU interface
  //------------------------------------------------------------------------
  output [`FIRE_DLC_DIM_REC_WDTH-1:0]  tm2rm_rcd;
  output 			       tm2rm_rcd_enq;
  input 			       rm2tm_rcd_full;

  //------------------------------------------------------------------------
  //   IMU interface
  //------------------------------------------------------------------------
  output 			       tm2im_data_enq;
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
  
  //---------------------------------------------------------------------
  // idle check
  //---------------------------------------------------------------------
  output 			       dim_is_idle;
  input 			       tmu_is_idle;
  //---------------------------------------------------------------------
  // for sun4v msi_64 compare
  //---------------------------------------------------------------------
  input 			       csr_sun4v_en;
  input 			       im2tm_eqs_adr_63;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  //---------------------------------------------------------------------
  // outputs from bufmgr.v
  // --------------------------------------------------------------------
  wire 				       diu_dma_full;          //   to xfrfsm.v, datafsm.v
  wire 				       diu_int_full;          //   to xfrfsm.v
  wire [`FIRE_DLC_DMA_WPTR_WDTH-2:0]   diu_dma_cl_wptr;       //   to datafsm.v
  wire [`FIRE_DLC_PIO_WPTR_WDTH-2:0]   diu_pio_cl_wptr;       //   to datafsm.v
  wire [`FIRE_DLC_DIM_DPTR_WDTH-1:0]   d_ptr_out;             //   to rcdbldr.v
  
  //---------------------------------------------------------------------
  // outputs from datafsm.v
  // --------------------------------------------------------------------
  wire 				       data_done;      //   to xfrfsm.v
  wire 				       dma_cl_req;     //   to bufmgr.v
  wire 				       dma_cl_inc;     //   to bufmgr.v
  wire 				       pio_cl_inc;     //   to bufmgr.v
  wire 				       idb_rptr_inc;
  wire [4:0] 			       data_mux_select;    // to datapath.v
  wire [3:0] 			       first_dwbe_dp;     // to datapath.v
  wire [3:0] 			       last_dwbe_dp;      // to datapath.v
  wire [3:2] 			       align_addr_dp; // to datapath.v
  wire [3:2] 			       end_addr_dp;       // to datapth.v
  wire 				       rcd_is_cpld_reg;    // to relgen.v
  wire 				       payld_len_is_one_dp;
  wire 				       ld_saved_data_dp;
  wire [`FIRE_DBG_DATA_BITS] 	       datafsm_dbg_a;
  wire [`FIRE_DBG_DATA_BITS] 	       datafsm_dbg_b;
  wire 				       datafsm_is_idle;
  
  //---------------------------------------------------------------------
  // outputs from rcdbldr.v
  // --------------------------------------------------------------------
  wire 				       rcd_empty;             //   to xfrfsm.v
  wire 				       rcd_is_msg;            //   to xfrfsm.v, bufmgr.v
  wire 				       rcd_is_msi;            //   to xfrfsm.v, bufmgr.v, datafsm.v
  wire 				       rcd_is_cpld;           //   to xfrfsm.v, bufmgr.v, datafsm.v
  wire 				       rcd_is_dmawr;          //   to xfrfsm.v, bufmgr.v, datafsm.v
  wire [5:2] 			       align_addr;            //   to diufsm.v
  wire [7:0] 			       payld_len;             //   to datafsm.v
  wire [3:0] 			       first_dwbe;   // to diufsm.v
  wire [3:0] 			       last_dwbe;    // to diufsm.v
  
  //---------------------------------------------------------------------
  // outputs from xfrfsm.v
  // --------------------------------------------------------------------
  wire 				       int_cl_req;            //   to bufmgr.v
  wire 				       data_start;            //   to datafsm.v
  wire 				       rcd_deq;               //   to rcdbldr.v
  wire [`FIRE_DBG_DATA_BITS] 	       xfrfsm_dbg_a;
  wire [`FIRE_DBG_DATA_BITS] 	       xfrfsm_dbg_b;
  wire 				       xfrfsm_is_idle;

  //---------------------------------------------------------------------
  //  debug
  //---------------------------------------------------------------------
  reg [`FIRE_DBG_DATA_BITS] 	      dbg_bus_a;
  reg [`FIRE_DBG_DATA_BITS] 	      dbg_bus_b;
  reg [`FIRE_DBG_DATA_BITS] 	      nxt_dbg_bus_a;
  reg [`FIRE_DBG_DATA_BITS] 	      nxt_dbg_bus_b;

assign	d2p_idb_rd	= idb_rptr_inc; 

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  //---------------------------------------------------------------------
  //  debug
  //---------------------------------------------------------------------
  always @ (cr2tm_dbg_sel_a[5:3]
	    or datafsm_dbg_a or xfrfsm_dbg_a) begin
    case (cr2tm_dbg_sel_a[5:3]) // synopsys infer_mux
      3'b000: nxt_dbg_bus_a = datafsm_dbg_a;
      3'b001: nxt_dbg_bus_a = xfrfsm_dbg_a;
      3'b010: nxt_dbg_bus_a = 8'b0;
      3'b011: nxt_dbg_bus_a = 8'b0;
      3'b100: nxt_dbg_bus_a = 8'b0;
      3'b101: nxt_dbg_bus_a = 8'b0;
      3'b110: nxt_dbg_bus_a = 8'b0;
      3'b111: nxt_dbg_bus_a = 8'b0;
    endcase
  end

  always @ (cr2tm_dbg_sel_b[5:3]
	    or datafsm_dbg_b or xfrfsm_dbg_b ) begin
    case (cr2tm_dbg_sel_b[5:3]) // synopsys infer_mux
      3'b000: nxt_dbg_bus_b = datafsm_dbg_b;
      3'b001: nxt_dbg_bus_b = xfrfsm_dbg_b;
      3'b010: nxt_dbg_bus_b = 8'b0;
      3'b011: nxt_dbg_bus_b = 8'b0;
      3'b100: nxt_dbg_bus_b = 8'b0;
      3'b101: nxt_dbg_bus_b = 8'b0;
      3'b110: nxt_dbg_bus_b = 8'b0;
      3'b111: nxt_dbg_bus_b = 8'b0;
    endcase
  end

  assign tm2cr_dbg_a = dbg_bus_a;
  assign tm2cr_dbg_b = dbg_bus_b;
    
  always @ (posedge clk) 
	if(~rst_l) begin
    dbg_bus_a <= {8{1'b0}};
    dbg_bus_b <= {8{1'b0}};
	end
  else begin
    dbg_bus_a <= nxt_dbg_bus_a;
    dbg_bus_b <= nxt_dbg_bus_b;
  end

  //---------------------------------------------------------------------
  // idle check
  //---------------------------------------------------------------------
  assign dim_is_idle = rcd_empty & xfrfsm_is_idle & datafsm_is_idle;
  
  //---------------------------------------------------------------------
  // output k2y_buf_addr_vld_monitor
  //---------------------------------------------------------------------
  assign k2y_buf_addr_vld_monitor = idb_rptr_inc;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
dmu_tmu_dim_bufmgr bufmgr
  (     .clk 		 (clk),
        .rst_l 		 (rst_l),
        .cl2tm_dma_rptr  (cl2tm_dma_rptr),
        .cl2tm_int_rptr  (cl2tm_int_rptr),
        .tm2cl_dma_wptr  (tm2cl_dma_wptr),
        .tm2cl_pio_wptr  (tm2cl_pio_wptr),
        .diu_dma_full 	 (diu_dma_full),
        .diu_int_full 	 (diu_int_full),
        .int_cl_req 	 (int_cl_req),
	.rcd_deq         (rcd_deq),
        .dma_cl_req 	 (dma_cl_req),
        .dma_cl_inc 	 (dma_cl_inc),
        .pio_cl_inc 	 (pio_cl_inc),
        .diu_pio_cl_wptr (diu_pio_cl_wptr),
        .diu_dma_cl_wptr (diu_dma_cl_wptr),
        .d_ptr_out 	 (d_ptr_out));

dmu_tmu_dim_datafsm datafsm
  (     .clk 		    (clk),
        .rst_l 		    (rst_l),
        .tm2di_wr 	    (tm2di_wr),
        .tm2di_addr 	    (tm2di_addr),
        .tm2im_data_enq     (tm2im_data_enq),
        .data_start 	    (data_start),
        .data_done 	    (data_done),
        .diu_dma_full 	    (diu_dma_full),
        .dma_cl_req 	    (dma_cl_req),
        .dma_cl_inc 	    (dma_cl_inc),
        .pio_cl_inc 	    (pio_cl_inc),
        .diu_dma_cl_wptr    (diu_dma_cl_wptr),
        .diu_pio_cl_wptr    (diu_pio_cl_wptr),
        .rcd_is_cpld 	    (rcd_is_cpld),
        .rcd_is_msi 	    (rcd_is_msi),
        .align_addr 	    (align_addr),
        .payld_len 	    (payld_len),
        .first_dwbe 	    (first_dwbe),
        .last_dwbe 	    (last_dwbe),
        .idb_rptr_inc 	    (idb_rptr_inc),
        .data_mux_select    (data_mux_select),
        .first_dwbe_dp      (first_dwbe_dp),
        .last_dwbe_dp 	    (last_dwbe_dp),
        .align_addr_dp      (align_addr_dp),
        .end_addr_dp 	    (end_addr_dp),
	.payld_len_is_one_dp (payld_len_is_one_dp),
        .ld_saved_data_dp   (ld_saved_data_dp),
        .rcd_is_cpld_reg    (rcd_is_cpld_reg),
	.y2k_buf_addr_vld_monitor   (y2k_buf_addr_vld_monitor),
	.rel_type           (k2y_rel_rcd[8]),
	.k2y_rel_enq        (k2y_rel_enq),
	.low_dbg_sel_a      (cr2tm_dbg_sel_a[2:0]),
	.low_dbg_sel_b      (cr2tm_dbg_sel_b[2:0]),
	.datafsm_dbg_a      (datafsm_dbg_a),
	.datafsm_dbg_b      (datafsm_dbg_b),
	.datafsm_is_idle    (datafsm_is_idle) );
 
dmu_tmu_dim_datapath  datapath
  (     .clk 		    (clk),
        .rst_l 		    (rst_l),
        .k2y_buf_addr 	    (k2y_buf_addr),
        .y2k_buf_data 	    (y2k_buf_data),
        .y2k_buf_dpar 	    (y2k_buf_dpar),
        .tm2di_data 	    (tm2di_data),
        .tm2di_bmask 	    (tm2di_bmask),
        .tm2di_dpar 	    (tm2di_dpar),
        .tm2im_data 	    (tm2im_data),
        .idb_rptr_inc 	    (idb_rptr_inc),
        .data_mux_select    (data_mux_select),
        .first_dwbe_dp      (first_dwbe_dp),
        .last_dwbe_dp 	    (last_dwbe_dp),
        .align_addr_dp      (align_addr_dp),
        .end_addr_dp 	    (end_addr_dp),
	.payld_len_is_one_dp (payld_len_is_one_dp),
        .ld_saved_data_dp   (ld_saved_data_dp) );
  
dmu_tmu_dim_rcdbldr rcdbldr
  (    .clk 		      (clk),
        .rst_l 		      (rst_l),
        .y2k_rcd 	      (y2k_rcd),
        .y2k_rcd_enq 	      (y2k_rcd_enq),
        .tm2rm_rcd 	      (tm2rm_rcd),
        .im2tm_msi32_addr_reg (im2tm_msi32_addr_reg),
        .im2tm_msi64_addr_reg (im2tm_msi64_addr_reg),
        .rcd_deq 	      (rcd_deq),
        .rcd_empty 	      (rcd_empty),
        .rcd_is_msg 	      (rcd_is_msg),
        .rcd_is_msi 	      (rcd_is_msi),
        .rcd_is_cpld 	      (rcd_is_cpld),
        .rcd_is_dmawr 	      (rcd_is_dmawr),
        .align_addr 	      (align_addr),
        .payld_len 	      (payld_len),
        .d_ptr_out 	      (d_ptr_out),
        .first_dwbe 	      (first_dwbe),
        .last_dwbe 	      (last_dwbe),
        .csr_sun4v_en 	      (csr_sun4v_en),
        .im2tm_eqs_adr_63     (im2tm_eqs_adr_63)
	);

dmu_tmu_dim_relgen relgen 
  (    .clk 		 (clk),
        .rst_l 		 (rst_l),
        .k2y_rel_rcd 	 (k2y_rel_rcd),
        .k2y_rel_enq 	 (k2y_rel_enq),
        .rcd_is_cpld_reg (rcd_is_cpld_reg),
        .k2y_buf_addr 	 (k2y_buf_addr));

dmu_tmu_dim_xfrfsm xfrfsm 
  (    .clk 		(clk),
        .rst_l 		(rst_l),
        .k2y_rcd_deq 	(k2y_rcd_deq),
        .tm2rm_rcd_enq 	(tm2rm_rcd_enq),
        .rm2tm_rcd_full (rm2tm_rcd_full),
        .diu_dma_full 	(diu_dma_full),
        .diu_int_full 	(diu_int_full),
        .int_cl_req 	(int_cl_req),
        .rcd_is_msg 	(rcd_is_msg),
        .rcd_is_msi 	(rcd_is_msi),
        .rcd_is_cpld 	(rcd_is_cpld),
        .rcd_is_dmawr 	(rcd_is_dmawr),
        .data_start 	(data_start),
        .data_done 	(data_done),
        .rcd_empty 	(rcd_empty),
        .rcd_deq 	(rcd_deq),
	.low_dbg_sel_a  (cr2tm_dbg_sel_a[2:0]),
	.low_dbg_sel_b  (cr2tm_dbg_sel_b[2:0]),
	.xfrfsm_dbg_a   (xfrfsm_dbg_a),
	.xfrfsm_dbg_b   (xfrfsm_dbg_b),
        .xfrfsm_is_idle (xfrfsm_is_idle),
        .tmu_is_idle    (tmu_is_idle) );
  
endmodule // dmu_tmu_dim




