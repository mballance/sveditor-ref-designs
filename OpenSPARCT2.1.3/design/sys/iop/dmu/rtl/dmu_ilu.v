// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu.v
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
module dmu_ilu (

		     // ilu <-> dmu-tmu
		     // ilu <-> dmu misc		     
		     // data path		     
		     // CSR ring		     
		     // clocks to IHB, IDB, EHB, EDB
		     // spares
		     // ilu <-> tlu
		     d2p_csr_ack,
		     d2p_csr_req,
		     d2p_csr_rcd,
		     d2p_cto_ack,
//		     d2p_drain,
                     d2p_ech_wptr,
                     d2p_edb_data,
                     d2p_edb_dpar,
                     d2p_edb_we,
                     d2p_edb_addr,
                     d2p_ehb_data,
                     d2p_ehb_dpar,
                     d2p_ehb_we,
                     d2p_ehb_addr,
                     d2p_erh_wptr,
		     d2p_ibc_nhc,
		     d2p_ibc_pdc,
		     d2p_ibc_phc,
		     d2p_ibc_req,
		     d2p_idb_addr,
		     d2p_ihb_addr,
		     d2p_spare,

		     l1clk,
		     rst_wmr_,
		     j2d_rst_l,
		     j2d_por_l,
		     rst_dmu_async_por_,
		     
		     j2d_instance_id,

		     k2y_buf_addr,
		     k2y_buf_addr_vld_monitor,
                     k2y_buf_data,
                     k2y_buf_dpar,
		     k2y_csr_ring_out,
		     k2y_dbg_sel_a,
		     k2y_dbg_sel_b,
		     k2y_dou_dptr,
		     k2y_dou_err,
		     k2y_dou_vld,
                     k2y_rcd,
		     k2y_rcd_deq,
                     k2y_rcd_enq,
		     k2y_rel_enq,			 
		     k2y_rel_rcd,
 
		     p2d_ce_int,
		     p2d_csr_ack,
		     p2d_csr_req,
		     p2d_csr_rcd,
		     p2d_cto_req,
		     p2d_cto_tag,
                     p2d_drain,
                     p2d_ecd_rptr,
                     p2d_ech_rptr,
		     p2d_erd_rptr,
                     p2d_erh_rptr,
		     p2d_ibc_ack,
		     p2d_idb_data,
		     p2d_idb_dpar,
		     p2d_ihb_data,
		     p2d_ihb_dpar,
		     d2p_ihb_rd,
		     p2d_ihb_wptr,		     
		     p2d_mps,
		     p2d_oe_int,
		     p2d_spare,
		     p2d_ue_int,
		     
                     y2k_buf_addr,
                     y2k_buf_addr_vld_monitor,
		     y2k_buf_data,
		     y2k_buf_dpar,
		     y2k_csr_ring_in,
		     y2k_dbg_a,
		     y2k_dbg_b,
		     y2k_int_l,
		     y2k_mps,

		     y2k_rcd,
                     y2k_rcd_deq,
		     y2k_rcd_enq,
                     y2k_rel_enq,
                     y2k_rel_rcd,
		     dmu_psr_rate_scale,
                     dmu_psr_pll_en_sds0,
                     dmu_psr_pll_en_sds1,
                     dmu_psr_rx_en_b0_sds0,
                     dmu_psr_rx_en_b1_sds0,
                     dmu_psr_rx_en_b2_sds0,
                     dmu_psr_rx_en_b3_sds0,
                     dmu_psr_rx_en_b0_sds1,
                     dmu_psr_rx_en_b1_sds1,
                     dmu_psr_rx_en_b2_sds1,
                     dmu_psr_rx_en_b3_sds1,
                     dmu_psr_tx_en_b0_sds0,
                     dmu_psr_tx_en_b1_sds0,
                     dmu_psr_tx_en_b2_sds0,
                     dmu_psr_tx_en_b3_sds0,
                     dmu_psr_tx_en_b0_sds1,
                     dmu_psr_tx_en_b1_sds1,
                     dmu_psr_tx_en_b2_sds1,
                     dmu_psr_tx_en_b3_sds1,
                     tcu_test_protect,
		     il2cl_gr_16

		     );
		     

  
  //synopsys sync_set_reset "j2d_por_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  l1clk;		    // input clock
  input		  rst_wmr_;		    // raw warm reset for serdes rate logic 11/10/05
  input		  j2d_por_l;   	            // input soft reset
  input		  j2d_rst_l;   	            // input hard reset
  input		  rst_dmu_async_por_;       // non_clocked async assertion, cmp clk deassertion
  
  input [`FIRE_J2D_INSTANCE_ID_WDTH-1:0] j2d_instance_id;

    
  //------------------------------------------------------------------------
  //   IHB and IHB management interface
  //------------------------------------------------------------------------ 
  input [`FIRE_P2D_IHB_WPTR_WDTH-1:0] p2d_ihb_wptr;     // gray-coded IHB write pointer
  input [`FIRE_IHB_REC_WDTH-1:0]      p2d_ihb_data;     // TLP header record
  output [`FIRE_D2P_IHB_ADDR_WDTH-1:0] d2p_ihb_addr;     // binary read pointer to IHB
  input [`FIRE_P2D_IHB_DPAR_WDTH-1:0]  p2d_ihb_dpar;     // TLP header record parity
  output 				d2p_ihb_rd;     // rd ihb header ram in peu,	
							// requested by circuits 
  
  //------------------------------------------------------------------------
  //   IDB interface
  //------------------------------------------------------------------------
  output [`FIRE_D2P_IDB_ADDR_WDTH-1:0] d2p_idb_addr;     // binary read pointer to IDB
  input [`FIRE_P2D_IDB_DATA_WDTH-1:0]  p2d_idb_data;     // 16-byte data    
  input [`FIRE_P2D_IDB_DPAR_WDTH-1:0]  p2d_idb_dpar;     // data parity
  
  //------------------------------------------------------------------------
  //   PCIE FC credits interface to TLU
  //------------------------------------------------------------------------
  output 			       d2p_ibc_req;       // request for ingress buffer credits
  input 			       p2d_ibc_ack;       // ack for ingress buffer credits
  output [`FIRE_D2P_IBC_NHC_WDTH-1:0]  d2p_ibc_nhc;       // PCIE FC NPH credits
  output [`FIRE_D2P_IBC_PHC_WDTH-1:0]  d2p_ibc_phc;       // PCIE FC PH credits
  output [`FIRE_D2P_IBC_PDC_WDTH-1:0]  d2p_ibc_pdc;       // PCIE FC PD credits
  
  //------------------------------------------------------------------------
  //   cto interface - PIO completion time out
  //------------------------------------------------------------------------
  input 			      p2d_cto_req;      // cto request from TLU 
  input [`FIRE_P2D_CTO_TAG_WDTH-1:0]  p2d_cto_tag;      // cto tag
  output 			      d2p_cto_ack;      // cto ack back
  
  //------------------------------------------------------------------------
  // buffer management interface
  //------------------------------------------------------------------------ 
  output [`FIRE_D2P_ECH_WPTR_WDTH-1:0] d2p_ech_wptr;      // gray-coded cpl-buffer in EHB write pointer
  input [`FIRE_P2D_ECH_RPTR_WDTH-1:0]  p2d_ech_rptr;      // gray-coded cpl-buffer in EHB read pointer
  output [`FIRE_D2P_ERH_WPTR_WDTH-1:0] d2p_erh_wptr;      // gray-coded req-buffer in EHB write pointer
  input [`FIRE_P2D_ERH_RPTR_WDTH-1:0]  p2d_erh_rptr;      // gray-coded req-buffer in EHB read pointer
  input [`FIRE_P2D_ECD_RPTR_WDTH-1:0]  p2d_ecd_rptr;      // gray-coded EDB DMA Cpl buffer read pointer
  input [`FIRE_P2D_ERD_RPTR_WDTH-1:0]  p2d_erd_rptr;      // gray-coded EDB PIO Wr buffer read pointer

  //------------------------------------------------------------------------
  // EHB interface
  //------------------------------------------------------------------------ 

  output 			       d2p_ehb_we;        // EHB write stroke
  output [`FIRE_D2P_EHB_ADDR_WDTH-1:0] d2p_ehb_addr;      // EHB write pointer
  output [`FIRE_EHB_REC_WDTH-1:0]      d2p_ehb_data;      // EHB record
  output [`FIRE_D2P_EHB_DPAR_WDTH-1:0] d2p_ehb_dpar;      // EHB word parity for header rcd

  //------------------------------------------------------------------------
  // EDB interface
  //------------------------------------------------------------------------ 
  output 			       d2p_edb_we;        // EDB write stroke
  output [`FIRE_D2P_EDB_ADDR_WDTH-1:0] d2p_edb_addr;      // EDB write pointer
  output [`FIRE_D2P_EDB_DATA_WDTH-1:0] d2p_edb_data;      // EDB payload
  output [`FIRE_D2P_EDB_DPAR_WDTH-1:0] d2p_edb_dpar;      // EDB word parity for payload
  
  //------------------------------------------------------------------------
  // drain and misc. interface
  //------------------------------------------------------------------------
//  output 			       d2p_drain;         // drain signal to TLU
  input 			       p2d_drain;         // drain signal from TLU
  input [`FIRE_P2D_MPS_WDTH-1:0]       p2d_mps;           // max. payld size
  input 			       p2d_ue_int;        // uncorrectable error
  input 			       p2d_ce_int;        // correctable error
  input 			       p2d_oe_int;        // other error

  //------------------------------------------------------------------------
  //   data path -
  //     note: k2y_buf_addr_vld_monitor & y2k_buf_addr_vld_monitor are added 
  //           for the use in DMU-ILU monitor only
  //------------------------------------------------------------------------
  input 			       k2y_buf_addr_vld_monitor;
  input [`FIRE_DLC_ITI_ADDR_WDTH-1:0]  k2y_buf_addr;        // read pointer to IDB
  output [`FIRE_DLC_ITI_DATA_WDTH-1:0] y2k_buf_data;        // 16-byte data    
  output [`FIRE_DLC_ITI_DPAR_WDTH-1:0] y2k_buf_dpar;        // data parity
  output 			       y2k_buf_addr_vld_monitor;
  output [`FIRE_DLC_ERD_ADDR_WDTH-1:0] y2k_buf_addr;        // read address to DOU
  input [`FIRE_DLC_ERD_DATA_WDTH-1:0]  k2y_buf_data;        // payload
  input [`FIRE_DLC_ERD_DPAR_WDTH-1:0]  k2y_buf_dpar;        // word parity for the payload
  //     
  //------------------------------------------------------------------------
  //   record interface to TMU
  //------------------------------------------------------------------------
  input                               k2y_rcd_deq;     // ingress record fifo dequeue
  output [`FIRE_DLC_IPE_REC_WDTH-1:0] y2k_rcd;         // ingress PEC record
  output 			      y2k_rcd_enq;     // ingress PEC record enqueue
  input [`FIRE_DLC_EPE_REC_WDTH-1:0]  k2y_rcd;         // egress PEC rcd
  input 			      k2y_rcd_enq;     // egress enqueue for PEC rcd
  output 			      y2k_rcd_deq;     // egress rcd fifo dequeue 
  
  //------------------------------------------------------------------------
  //   release interface with TMU
  //------------------------------------------------------------------------
  input [`FIRE_DLC_URR_REC_WDTH-1:0]  k2y_rel_rcd;     // ingress 1 PCIE FC data credit (16-byte data) w/ d_ptr
  input 			      k2y_rel_enq;     // ingress enqueue for release record
  output [`FIRE_DLC_DRR_REC_WDTH-1:0] y2k_rel_rcd;     // egress release rcd
  output 			      y2k_rel_enq;     // egress enqueue for release rcd
  
  //------------------------------------------------------------------------
  //   DOU DMA Rd Cpl Buffer status rcd interface with CLU
  //------------------------------------------------------------------------
  input [`FIRE_DLC_DOU_DPTR_WDTH-1:0] k2y_dou_dptr;
  input 			      k2y_dou_err;
  input 			      k2y_dou_vld;

  //------------------------------------------------------------------------
  //   DMU misc. interface
  //------------------------------------------------------------------------
  output [`FIRE_DLC_MPS-1:0] 	      y2k_mps;         // max. payld size to CMU
  output 			      y2k_int_l;       // interrupt req to IMU
    	  
  //------------------------------------------------------------------------
  //  CSR ring to DMU
  //------------------------------------------------------------------------
  input [`FIRE_CSR_RING_WIDTH-1:0]    k2y_csr_ring_out;
  output [`FIRE_CSR_RING_WIDTH-1:0]   y2k_csr_ring_in;
  
  //------------------------------------------------------------------------
  //  CSR ring to TLU
  //------------------------------------------------------------------------
  output 			      d2p_csr_req;
  input 			      p2d_csr_ack;
  output [`FIRE_D2P_CSR_RING_WDTH-1:0] d2p_csr_rcd;
  input 			       p2d_csr_req;
  output 			       d2p_csr_ack;
  input [`FIRE_P2D_CSR_RING_WDTH-1:0]  p2d_csr_rcd;

  //------------------------------------------------------------------------
  // clocks to IHB, IDB, EHB, EDB
  //------------------------------------------------------------------------

  //------------------------------------------------------------------------
  //  debug ports
  //------------------------------------------------------------------------
  input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] k2y_dbg_sel_a;
  input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0] k2y_dbg_sel_b;
  output [`FIRE_DEBUG_WDTH-1:0]        y2k_dbg_a;
  output [`FIRE_DEBUG_WDTH-1:0]        y2k_dbg_b;

  //------------------------------------------------------------------------
  //  spares
  //------------------------------------------------------------------------
  input [`FIRE_P2D_SPARE_WDTH-1:0]     p2d_spare;
  output [`FIRE_D2P_SPARE_WDTH-1:0]    d2p_spare;

  //------------------------------------------------------------------------
  //  to PEU for pll-enable, tx-lane-enable and rx-lane-enables
  //------------------------------------------------------------------------
  output                                dmu_psr_pll_en_sds0;
  output                                dmu_psr_pll_en_sds1;
  output                                dmu_psr_rx_en_b0_sds0;
  output                                dmu_psr_rx_en_b1_sds0;
  output                                dmu_psr_rx_en_b2_sds0;
  output                                dmu_psr_rx_en_b3_sds0;
  output                                dmu_psr_rx_en_b0_sds1;
  output                                dmu_psr_rx_en_b1_sds1;
  output                                dmu_psr_rx_en_b2_sds1;
  output                                dmu_psr_rx_en_b3_sds1;
  output                                dmu_psr_tx_en_b0_sds0;
  output                                dmu_psr_tx_en_b1_sds0;
  output                                dmu_psr_tx_en_b2_sds0;
  output                                dmu_psr_tx_en_b3_sds0;
  output                                dmu_psr_tx_en_b0_sds1;
  output                                dmu_psr_tx_en_b1_sds1;
  output                                dmu_psr_tx_en_b2_sds1;
  output                                dmu_psr_tx_en_b3_sds1;
  input                                 tcu_test_protect;

  output   [1:0]			dmu_psr_rate_scale;
  output   			 	il2cl_gr_16;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  debug
  //---------------------------------------------------------------------
  reg [`FIRE_DBG_DATA_BITS]           dbg_bus_a;
  reg [`FIRE_DBG_DATA_BITS]           dbg_bus_b;
  reg [`FIRE_DBG_DATA_BITS]           nxt_dbg_bus_a;
  reg [`FIRE_DBG_DATA_BITS]           nxt_dbg_bus_b;

  //------------------------------------------------------------------------
  //  ISB sub-block interface
  //------------------------------------------------------------------------
  wire 		 eil2isb_log;      // log eil2isb_tag on ISB
  wire [4:0] 	 eil2isb_tag;      // tlp_tag[4:0] to ISB
  wire 		 iil2isb_clr;      // clear ISB with iil2isb_tag
  wire [4:0] 	 iil2isb_tag;      // tlp_tag[4:0] to ISB to clear
  wire 		 isb2iil_vld;      // valid entry status with iil2isb_tag
  wire [3:2] 	 eil2isb_low_addr;
  wire [3:2] 	 isb2iil_low_addr;
  wire [`FIRE_DBG_DATA_BITS] isb_dbg_a; 
  wire [`FIRE_DBG_DATA_BITS] isb_dbg_b; 

  //------------------------------------------------------------------------
  //  CIB sub-block interface
  //------------------------------------------------------------------------
  wire 		 iil2cib_ihb_pe;  // ingress header parity error
  wire           cib2iil_ihb_pe_drain;
  wire           cib2iil_pec_drain;
  wire           cib2eil_ihb_pe_drain;
  wire           cib2eil_pec_drain;
  wire [`FIRE_DBG_DATA_BITS] cib_dbg_a; 
  wire [`FIRE_DBG_DATA_BITS] cib_dbg_b; 

  //------------------------------------------------------------------------
  //  IIL sub-block interface
  //------------------------------------------------------------------------
  wire [`FIRE_DBG_DATA_BITS] iil_dbg_a; 
  wire [`FIRE_DBG_DATA_BITS] iil_dbg_b; 
  
  //------------------------------------------------------------------------
  //  EIL sub-block interface
  //------------------------------------------------------------------------
  wire [`FIRE_DBG_DATA_BITS] eil_dbg_0_a; 
  wire [`FIRE_DBG_DATA_BITS] eil_dbg_0_b; 
  wire [`FIRE_DBG_DATA_BITS] eil_dbg_1_a; 
  wire [`FIRE_DBG_DATA_BITS] eil_dbg_1_b; 
  
  //------------------------------------------------------------------------
  //  CIB sub-block interface
  //------------------------------------------------------------------------
  wire		rst_l;
  wire		por_l;
 
  //------------------------------------------------------------------------
  //  idle check
  //------------------------------------------------------------------------
  wire 		iil_is_idle;
  wire 		eil_is_idle;
  wire 		isb_is_idle;

  wire [3:0] ilu_diagnos_edi_par_hw_read;
    // This signal provides the current value of ilu_diagnos_edi_par.
  wire [3:0] ilu_diagnos_ehi_par_hw_read;
    // This signal provides the current value of ilu_diagnos_ehi_par.
  wire  ilu_diagnos_edi_trig_hw_clr;  // Hardware clear signal for
                                     // ilu_diagnos_edi_trig. When set
                                     // ilu_diagnos will be set to zero.
  wire ilu_diagnos_edi_trig_hw_read;  // This signal provides the current value
                                      // of ilu_diagnos_edi_trig.
  wire  ilu_diagnos_ehi_trig_hw_clr;  // Hardware clear signal for
                                     // ilu_diagnos_ehi_trig. When set
                                     // ilu_diagnos will be set to zero.
  wire ilu_diagnos_ehi_trig_hw_read;  // This signal provides the current value
                                      // of ilu_diagnos_ehi_trig.

  reg 		ilu_is_idle;  // flop
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  /* 0in scoreboard -rx_id eil2isb_tag -rx eil2isb_log 
                    -tx_id iil2isb_tag -tx iil2isb_clr
                    -max_ids 16 -max_count_per_id 1  */

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  tie spare to zero 
  //---------------------------------------------------------------------
  assign d2p_spare = {`FIRE_D2P_SPARE_WDTH{1'b0}};

  //---------------------------------------------------------------------
  //  debug
  //---------------------------------------------------------------------
  always @ (k2y_dbg_sel_a[5:3]
            or iil_dbg_a or eil_dbg_0_a or eil_dbg_1_a or
	    cib_dbg_a or isb_dbg_a) begin
    case (k2y_dbg_sel_a[5:3]) // synopsys infer_mux
      3'b000: nxt_dbg_bus_a = iil_dbg_a;
      3'b001: nxt_dbg_bus_a = eil_dbg_0_a;
      3'b010: nxt_dbg_bus_a = eil_dbg_1_a;
      3'b011: nxt_dbg_bus_a = cib_dbg_a;
      3'b100: nxt_dbg_bus_a = isb_dbg_a;
      3'b101: nxt_dbg_bus_a = 8'b0;
      3'b110: nxt_dbg_bus_a = 8'b0;
      3'b111: nxt_dbg_bus_a = 8'b0;
    endcase
  end

  always @ (k2y_dbg_sel_b[5:3]
            or iil_dbg_b or eil_dbg_0_b or eil_dbg_1_b or
	    cib_dbg_b or isb_dbg_b) begin
    case (k2y_dbg_sel_b[5:3]) // synopsys infer_mux
      3'b000: nxt_dbg_bus_b = iil_dbg_b;
      3'b001: nxt_dbg_bus_b = eil_dbg_0_b;
      3'b010: nxt_dbg_bus_b = eil_dbg_1_b;
      3'b011: nxt_dbg_bus_b = cib_dbg_b;
      3'b100: nxt_dbg_bus_b = isb_dbg_b;
      3'b101: nxt_dbg_bus_b = 8'b0;
      3'b110: nxt_dbg_bus_b = 8'b0;
      3'b111: nxt_dbg_bus_b = 8'b0;
    endcase
  end

  assign y2k_dbg_a = dbg_bus_a;
  assign y2k_dbg_b = dbg_bus_b;

  always @ (posedge l1clk) 
	if(~rst_l) begin
    dbg_bus_a <= {8{1'b0}};
    dbg_bus_b <= {8{1'b0}};
    end
	else begin
    dbg_bus_a <= nxt_dbg_bus_a;
    dbg_bus_b <= nxt_dbg_bus_b;
  end

  //---------------------------------------------------------------------
  //  idle check
  //---------------------------------------------------------------------
//BP N2 set to 1, because the other idles are 1
  always @ (posedge l1clk) 
	if(~rst_l) begin
    ilu_is_idle <= 1'b1;
    end
	else begin
    ilu_is_idle <= iil_is_idle & eil_is_idle & isb_is_idle;
  end
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // LBIST Rest Circuits 
// n2 controls reset in rst block, so removed these synchronizers
assign	rst_l = j2d_rst_l; 
//   lbist_rst_cct rst_cct (
//  
//        .rst_l_in               (j2d_rst_l),
//        .clk                    (l1clk),
//        .bist_en                (1'b0),
//        .rst_l_out              (rst_l)  
//       );
   
assign	por_l = j2d_por_l; 
//   lbist_rst_cct por_cct (
//   
//        .rst_l_in               (j2d_por_l),
//        .clk                    (l1clk),
//        .bist_en                (1'b0),
//        .rst_l_out              (por_l)
//       );

  // IIL sub-block
  dmu_ilu_iil iil (
			.clk             (l1clk),
			.rst_l           (rst_l),
			.p2d_ihb_wptr    (p2d_ihb_wptr),
			.d2p_ihb_addr    (d2p_ihb_addr),
			.p2d_ihb_data    (p2d_ihb_data),
			.p2d_ihb_dpar    (p2d_ihb_dpar),
			.d2p_ihb_rd      (d2p_ihb_rd),
			.d2p_ibc_req     (d2p_ibc_req),
			.d2p_ibc_nhc     (d2p_ibc_nhc),
			.d2p_ibc_phc     (d2p_ibc_phc),
			.d2p_ibc_pdc     (d2p_ibc_pdc),
			.p2d_ibc_ack     (p2d_ibc_ack),
			.d2p_idb_addr    (d2p_idb_addr),
			.p2d_idb_data    (p2d_idb_data),
			.p2d_idb_dpar    (p2d_idb_dpar),
			.p2d_cto_req     (p2d_cto_req),
			.p2d_cto_tag     (p2d_cto_tag),
			.d2p_cto_ack     (d2p_cto_ack),
			.y2k_rcd         (y2k_rcd),
			.y2k_rcd_enq     (y2k_rcd_enq),
			.k2y_rcd_deq     (k2y_rcd_deq),
			.k2y_rel_rcd     (k2y_rel_rcd),
			.k2y_rel_enq     (k2y_rel_enq),
			.k2y_buf_addr    (k2y_buf_addr),
			.y2k_buf_data    (y2k_buf_data),
			.y2k_buf_dpar    (y2k_buf_dpar),
		        .cib2iil_ihb_pe_drain (cib2iil_ihb_pe_drain),
		        .cib2iil_pec_drain    (cib2iil_pec_drain),
			.iil2cib_ihb_pe (iil2cib_ihb_pe),
			.iil2isb_clr     (iil2isb_clr),
			.iil2isb_tag     (iil2isb_tag),
			.isb2iil_vld     (isb2iil_vld),
			.isb2iil_low_addr (isb2iil_low_addr),
			.low_dbg_sel_a   (k2y_dbg_sel_a[2:0]),
			.low_dbg_sel_b   (k2y_dbg_sel_b[2:0]),
			.iil_dbg_a       (iil_dbg_a),
			.iil_dbg_b       (iil_dbg_b),
			.iil_is_idle     (iil_is_idle),
			.ilu_is_idle     (ilu_is_idle) );

  // EIL sub-block
  dmu_ilu_eil eil (
                        .clk             (l1clk),
                        .rst_l           (rst_l),
                        .d2p_edb_we      (d2p_edb_we),
                        .d2p_edb_data    (d2p_edb_data),
                        .d2p_edb_dpar    (d2p_edb_dpar),
                        .d2p_edb_addr    (d2p_edb_addr),
                        .d2p_ehb_we      (d2p_ehb_we),
                        .d2p_ehb_data    (d2p_ehb_data),
                        .d2p_ehb_dpar    (d2p_ehb_dpar),
                        .d2p_ehb_addr    (d2p_ehb_addr),
                        .d2p_ech_wptr    (d2p_ech_wptr),
                        .d2p_erh_wptr    (d2p_erh_wptr),
                        .p2d_ech_rptr    (p2d_ech_rptr),
                        .p2d_erh_rptr    (p2d_erh_rptr),
			.p2d_ecd_rptr    (p2d_ecd_rptr),
			.p2d_erd_rptr    (p2d_erd_rptr),
                        .k2y_rcd         (k2y_rcd),
                        .k2y_rcd_enq     (k2y_rcd_enq),
                        .y2k_rcd_deq     (y2k_rcd_deq),
                        .y2k_rel_rcd     (y2k_rel_rcd),
                        .y2k_rel_enq     (y2k_rel_enq),
			.k2y_dou_dptr    (k2y_dou_dptr),
			.k2y_dou_err     (k2y_dou_err),
			.k2y_dou_vld     (k2y_dou_vld),
                        .k2y_buf_addr_vld_monitor (k2y_buf_addr_vld_monitor),
                        .y2k_buf_addr_vld_monitor (y2k_buf_addr_vld_monitor),
                        .y2k_buf_addr    (y2k_buf_addr),
                        .k2y_buf_data    (k2y_buf_data),
                        .k2y_buf_dpar    (k2y_buf_dpar),
                        .ilu_diagnos_ehi_par_hw_read       (ilu_diagnos_ehi_par_hw_read),
                        .ilu_diagnos_ehi_trig_hw_clr       (ilu_diagnos_ehi_trig_hw_clr),
                        .ilu_diagnos_ehi_trig_hw_read      (ilu_diagnos_ehi_trig_hw_read),
                        .ilu_diagnos_edi_par_hw_read       (ilu_diagnos_edi_par_hw_read),
                        .ilu_diagnos_edi_trig_hw_clr       (ilu_diagnos_edi_trig_hw_clr),
                        .ilu_diagnos_edi_trig_hw_read      (ilu_diagnos_edi_trig_hw_read),
		        .cib2eil_ihb_pe_drain     (cib2eil_ihb_pe_drain),
		        .cib2eil_pec_drain        (cib2eil_pec_drain),
                        .eil2isb_log     (eil2isb_log),
                        .eil2isb_tag     (eil2isb_tag),
			.eil2isb_low_addr (eil2isb_low_addr),
			.low_dbg_sel_a   (k2y_dbg_sel_a[2:0]),
			.low_dbg_sel_b   (k2y_dbg_sel_b[2:0]),
			.eil_dbg_0_a     (eil_dbg_0_a),
			.eil_dbg_0_b     (eil_dbg_0_b),
			.eil_dbg_1_a     (eil_dbg_1_a),
			.eil_dbg_1_b     (eil_dbg_1_b),
			.eil_is_idle     (eil_is_idle),
			.il2cl_gr_16     (il2cl_gr_16)
	 );

  // CIB sub-block
  dmu_ilu_cib cib (
			.clk             (l1clk),
			.rst_dmu_async_por_  (rst_dmu_async_por_),	// drives async reset ff for serdes enables
			.rst_wmr_  (rst_wmr_),		// raw warm reset for serdes rate
			.por_l       	 (por_l),
			.rst_l           (rst_l),
			.j2d_instance_id (j2d_instance_id),
			.p2d_mps         (p2d_mps),
			.p2d_ue_int      (p2d_ue_int),
			.p2d_ce_int      (p2d_ce_int),
			.p2d_oe_int      (p2d_oe_int),
//			.d2p_drain       (d2p_drain),
			.p2d_drain       (p2d_drain),
			.y2k_mps         (y2k_mps),
			.y2k_int_l       (y2k_int_l),
			.k2y_csr_ring_out  (k2y_csr_ring_out),
			.y2k_csr_ring_in   (y2k_csr_ring_in),
			.d2p_csr_req       (d2p_csr_req),
			.p2d_csr_ack       (p2d_csr_ack),
			.d2p_csr_rcd (d2p_csr_rcd),
			.p2d_csr_req (p2d_csr_req),
			.d2p_csr_ack (d2p_csr_ack),
			.p2d_csr_rcd (p2d_csr_rcd),
                 // SV 05/31/05
			.ilu_diagnos_rate_scale_hw_read    (dmu_psr_rate_scale),
                 // SV 04/06/05
        		.ilu_diagnos_edi_par_hw_read       (ilu_diagnos_edi_par_hw_read),
        		.ilu_diagnos_ehi_par_hw_read       (ilu_diagnos_ehi_par_hw_read),
        		.ilu_diagnos_edi_trig_hw_clr       (ilu_diagnos_edi_trig_hw_clr),
        		.ilu_diagnos_edi_trig_hw_read      (ilu_diagnos_edi_trig_hw_read),
        		.ilu_diagnos_ehi_trig_hw_clr       (ilu_diagnos_ehi_trig_hw_clr),
        		.ilu_diagnos_ehi_trig_hw_read      (ilu_diagnos_ehi_trig_hw_read),
			.iil2cib_ihb_pe (iil2cib_ihb_pe),
		        .cib2iil_ihb_pe_drain    (cib2iil_ihb_pe_drain),
		        .cib2iil_pec_drain       (cib2iil_pec_drain),
		        .cib2eil_ihb_pe_drain    (cib2eil_ihb_pe_drain),
		        .cib2eil_pec_drain       (cib2eil_pec_drain),
			.low_dbg_sel_a   (k2y_dbg_sel_a[2:0]),
			.low_dbg_sel_b   (k2y_dbg_sel_b[2:0]),
			.cib_dbg_a     (cib_dbg_a),
			.cib_dbg_b     (cib_dbg_b),
                        .dmu_psr_pll_en_sds0		(dmu_psr_pll_en_sds0),
                        .dmu_psr_pll_en_sds1		(dmu_psr_pll_en_sds1),
                        .dmu_psr_rx_en_b0_sds0		(dmu_psr_rx_en_b0_sds0),
                        .dmu_psr_rx_en_b1_sds0		(dmu_psr_rx_en_b1_sds0),
                        .dmu_psr_rx_en_b2_sds0		(dmu_psr_rx_en_b2_sds0),
                        .dmu_psr_rx_en_b3_sds0		(dmu_psr_rx_en_b3_sds0),
                        .dmu_psr_rx_en_b0_sds1		(dmu_psr_rx_en_b0_sds1),
                        .dmu_psr_rx_en_b1_sds1		(dmu_psr_rx_en_b1_sds1),
                        .dmu_psr_rx_en_b2_sds1		(dmu_psr_rx_en_b2_sds1),
                        .dmu_psr_rx_en_b3_sds1		(dmu_psr_rx_en_b3_sds1),
                        .dmu_psr_tx_en_b0_sds0		(dmu_psr_tx_en_b0_sds0),
                        .dmu_psr_tx_en_b1_sds0		(dmu_psr_tx_en_b1_sds0),
                        .dmu_psr_tx_en_b2_sds0		(dmu_psr_tx_en_b2_sds0),
                        .dmu_psr_tx_en_b3_sds0		(dmu_psr_tx_en_b3_sds0),
                        .dmu_psr_tx_en_b0_sds1		(dmu_psr_tx_en_b0_sds1),
                        .dmu_psr_tx_en_b1_sds1		(dmu_psr_tx_en_b1_sds1),
                        .dmu_psr_tx_en_b2_sds1		(dmu_psr_tx_en_b2_sds1),
                        .dmu_psr_tx_en_b3_sds1		(dmu_psr_tx_en_b3_sds1),
                        .tcu_test_protect		(tcu_test_protect)

			 );

  // ISB sub-block
  dmu_ilu_isb isb (
			.clk (l1clk),
                        .rst_l (rst_l),
                        .eil2isb_log (eil2isb_log),
                        .eil2isb_tag (eil2isb_tag),
			.eil2isb_low_addr (eil2isb_low_addr),
                        .iil2isb_clr (iil2isb_clr),
                        .iil2isb_tag (iil2isb_tag),
                        .isb2iil_vld (isb2iil_vld),
			.isb2iil_low_addr (isb2iil_low_addr),
			.low_dbg_sel_a   (k2y_dbg_sel_a[2:0]),
			.low_dbg_sel_b   (k2y_dbg_sel_b[2:0]),
			.isb_dbg_a     (isb_dbg_a),
			.isb_dbg_b     (isb_dbg_b), 
			.isb_is_idle      (isb_is_idle) );

endmodule // dmu_ilu



