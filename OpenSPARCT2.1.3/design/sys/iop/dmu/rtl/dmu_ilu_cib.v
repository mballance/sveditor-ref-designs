// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_cib.v
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
module dmu_ilu_cib (
			 clk,
			 rst_wmr_,
			 rst_dmu_async_por_,
			 por_l,
		         rst_l,
			 
			 j2d_instance_id, 
			 
			 // ilu <-> tlu misc
			 p2d_mps,
			 p2d_ue_int,
			 p2d_ce_int,
			 p2d_oe_int,

			 // D-P drain interface
//			 d2p_drain,
			 p2d_drain,
			 
			 // ilu <-> dmu misc
			 y2k_mps,
			 y2k_int_l,
		     	 
			 // CSR ring
			 k2y_csr_ring_out,
			 y2k_csr_ring_in,
			 d2p_csr_req,
			 p2d_csr_ack,
			 d2p_csr_rcd,
			 p2d_csr_req,
			 d2p_csr_ack,
			 p2d_csr_rcd,
			 
			 // internal interface
			 iil2cib_ihb_pe,
                         cib2iil_ihb_pe_drain, // caused by iil2cib_ihb_pe
                         cib2iil_pec_drain,    // caused by p2d_drain
                         cib2eil_ihb_pe_drain,
                         cib2eil_pec_drain,

                         // CSR <-> EDB i/f
                         ilu_diagnos_edi_par_hw_read,
			 ilu_diagnos_ehi_par_hw_read,
			 ilu_diagnos_edi_trig_hw_clr,
			 ilu_diagnos_edi_trig_hw_read,
			 ilu_diagnos_ehi_trig_hw_clr,
			 ilu_diagnos_ehi_trig_hw_read,

                         // CSR <-> PEU/PSR i/f
                         ilu_diagnos_rate_scale_hw_read,

			 // debug
                         low_dbg_sel_a,
                         low_dbg_sel_b,
                         cib_dbg_a,
                         cib_dbg_b,
			 // enables to rx tx pll BP n2 5-24-05
//BP n2 5-24-05
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
                         tcu_test_protect
			 );
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  				clk;		   // input clock
  input		  				rst_wmr_;	   // raw warm reset
  input		  				por_l;   	   // hard reset
  input 	  				rst_l;             // soft reset
  input		  				rst_dmu_async_por_;   	   // asyc assertion for serdes enables
    
    
  input [`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;
  
  //------------------------------------------------------------------------
  // ilu <-> tlu misc. interface
  //------------------------------------------------------------------------
  input [`FIRE_P2D_MPS_WDTH-1:0] 		p2d_mps;           // max. payld size
  input 			 		p2d_ue_int;        // uncorrectable error
  input 			 		p2d_ce_int;        // correctable error
  input 			 		p2d_oe_int;        // other error
 
  //------------------------------------------------------------------------
  //  
  //  DMC - PEC drain interface
  //------------------------------------------------------------------------
  input 	  				p2d_drain;
//  output 	  				d2p_drain;

  //------------------------------------------------------------------------
  //  ilu <-> dmu misc. interface
  //------------------------------------------------------------------------
  output [`FIRE_DLC_MPS-1:0] 			y2k_mps;         // max. payld size to CMU
  output 		     			y2k_int_l;       // interrupt req to IMU
    	  
  //------------------------------------------------------------------------
  //  CSR ring to DMU
  //------------------------------------------------------------------------
  input  [`FIRE_CSR_RING_WIDTH-1:0] 		k2y_csr_ring_out;
  output [`FIRE_CSR_RING_WIDTH-1:0] 		y2k_csr_ring_in;
  
  //------------------------------------------------------------------------
  //  CSR ring to TLU
  //------------------------------------------------------------------------
  output 			    		d2p_csr_req;
  input 			    		p2d_csr_ack;
  output [`FIRE_D2P_CSR_RING_WDTH-1:0] 		d2p_csr_rcd;
  input 			       		p2d_csr_req;
  output 			       		d2p_csr_ack;
  input [`FIRE_P2D_CSR_RING_WDTH-1:0]  		p2d_csr_rcd;

  //------------------------------------------------------------------------
  //  Internal module interface
  //------------------------------------------------------------------------
  input 			       		iil2cib_ihb_pe;  // ingress header parity error
  output                                        cib2iil_ihb_pe_drain; // caused by iil2cib_ihb_pe
  output                                        cib2iil_pec_drain;    // caused by p2d_drain
  output                                        cib2eil_ihb_pe_drain;
  output                                        cib2eil_pec_drain;
  
  //------------------------------------------------------------------------
  //   debug
  //------------------------------------------------------------------------
  input [2:0]                         low_dbg_sel_a;
  input [2:0]                         low_dbg_sel_b;
  output [`FIRE_DBG_DATA_BITS]        cib_dbg_a;
  output [`FIRE_DBG_DATA_BITS]        cib_dbg_b;

  //  CSR to EDB signals for diagnostic register
  output [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EDI_PAR_INT_SLC] ilu_diagnos_edi_par_hw_read;
    // This signal provides the current value of ilu_diagnos_edi_par.
  output [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EHI_PAR_INT_SLC] ilu_diagnos_ehi_par_hw_read;
    // This signal provides the current value of ilu_diagnos_ehi_par.
  input  ilu_diagnos_edi_trig_hw_clr;  // Hardware clear signal for
                                     // ilu_diagnos_edi_trig. When set
                                     // ilu_diagnos will be set to zero.
  output ilu_diagnos_edi_trig_hw_read;  // This signal provides the current value
                                      // of ilu_diagnos_edi_trig.
  input  ilu_diagnos_ehi_trig_hw_clr;  // Hardware clear signal for
                                     // ilu_diagnos_ehi_trig. When set
                                     // ilu_diagnos will be set to zero.
  output ilu_diagnos_ehi_trig_hw_read;  // This signal provides the current value
                                      // of ilu_diagnos_ehi_trig.


  //------------------------------------------------------------------------
  //  BP n2 5-24-05
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

//SV - 05/31/05
  output    [1:0]			ilu_diagnos_rate_scale_hw_read;



  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [`FIRE_DBG_DATA_BITS]           dbg_bus [0:1];

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~

  reg [`FIRE_DBG_DATA_BITS]           nxt_dbg_bus [0:1];
  reg [2:0]                           dbg_sel [0:1];

  integer                             i;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  //------------------------------------------------------------------------
 
  wire [`FIRE_CSR_RING_BITS] 	byp2dcs_csr_ring;
  wire [`FIRE_CSR_RING_BITS] 	dcd2byp_csr_ring;
  wire [`FIRE_CSR_RING_BITS]	byp2dcc_csr_ring;


  //------------------------------------------------------------------------
  //  DCC - DCM  interface
  //------------------------------------------------------------------------
  wire [`FIRE_CSR_DATA_WIDTH-1:0]              csrbus_wr_data;      // to csr block
  wire [`FIRE_CSR_ADDR_MAX_WIDTH-1:0] 	       csrbus_addr;         // to csr block
  wire 					       csrbus_wr;           // to csr block
  wire 					       csrbus_valid;        // to csr block
  wire [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0]        csrbus_src_bus;      // to csr block
  
  wire [`FIRE_CSR_DATA_WIDTH-1:0] 	       csrbus_read_data;    // from csr block
  wire 					       csrbus_done;         // from csr block
  wire 					       csrbus_mapped;       // from csr block
  wire 					       csrbus_acc_vio;      // from csr block

  //------------------------------------------------------------------------
  //  DCM(CSR) - CIM interface
  //------------------------------------------------------------------------

  wire pec_int_en_pec_hw_read;  		// This signal provides the current value of
                          			// pec_int_en_pec.
  wire pec_int_en_pec_ilu_hw_read;  		// This signal provides the current value of
                             			// pec_int_en_pec_ilu.
  wire pec_int_en_pec_ue_hw_read; 		// This signal provides the current value of
                             			// pec_int_en_pec_ue.
  wire pec_int_en_pec_ce_hw_read; 		// This signal provides the current value of
                            			// pec_int_en_pec_ce.
  wire pec_int_en_pec_oe_hw_read;  		// This signal provides the current value of
                                   		// pec_int_en_pec_oe.  
  wire pec_en_err_ilu_ext_read_data; 		// Ext read data (decode)
  wire pec_en_err_ue_ext_read_data;  		// Ext read data (decode)
  wire pec_en_err_ce_ext_read_data;  		// Ext read data (decode)
  wire pec_en_err_oe_ext_read_data;  		// Ext read data (decode)
  
  
  wire ilu_int_en_spare3_s_hw_read;  		// This signal provides the current value
                               			// of ilu_int_en_spare3_s.
  wire ilu_int_en_spare2_s_hw_read;  		// This signal provides the current value
                               			// of ilu_int_en_spare2_s.
  wire ilu_int_en_spare1_s_hw_read; 		// This signal provides the current value
                              			// of ilu_int_en_spare1_s.
  wire ilu_int_en_ihb_pe_s_hw_read;  		// This signal provides the current value
                               			// of ilu_int_en_ihb_pe_s.
  wire ilu_int_en_spare3_p_hw_read;  		// This signal provides the current value
                               			// of ilu_int_en_spare3_p.
  wire ilu_int_en_spare2_p_hw_read;  		// This signal provides the current value
                               			// of ilu_int_en_spare2_p.
  wire ilu_int_en_spare1_p_hw_read;  		// This signal provides the current value
                               			// of ilu_int_en_spare1_p.
  wire ilu_int_en_ihb_pe_p_hw_read;  		// This signal provides the current value
                               			// of ilu_int_en_ihb_pe_p.
  wire ilu_log_en_spare3_hw_read;  		// This signal provides the current value of
                             			// ilu_log_en_spare3.
  wire ilu_log_en_spare2_hw_read; 		// This signal provides the current value of
                             			// ilu_log_en_spare2.
  wire ilu_log_en_spare1_hw_read;  		// This signal provides the current value of
                             			// ilu_log_en_spare1.
  wire ilu_log_en_ihb_pe_hw_read;  		// This signal provides the current value of
                             			// ilu_log_en_ihb_pe.
  wire ilu_en_err_spare3_s_ext_read_data;  	// Ext read data (decode)
  wire ilu_en_err_spare2_s_ext_read_data;  	// Ext read data (decode)
  wire ilu_en_err_spare1_s_ext_read_data;  	// Ext read data (decode)
  wire ilu_en_err_ihb_pe_s_ext_read_data;  	// Ext read data (decode)
  wire ilu_en_err_spare3_p_ext_read_data;  	// Ext read data (decode)
  wire ilu_en_err_spare2_p_ext_read_data;  	// Ext read data (decode)
  wire ilu_en_err_spare1_p_ext_read_data; 	// Ext read data (decode)
  wire ilu_en_err_ihb_pe_p_ext_read_data;  	// Ext read data (decode)
  wire ilu_log_err_spare3_s_hw_set;  		// Hardware set signal for
                               			// ilu_log_err_spare3_s. When set
                               			// ilu_log_err will be set to one.
  wire ilu_log_err_spare3_s_hw_read;  		// This signal provides the current value
                                		// of ilu_log_err_spare3_s.
  wire ilu_log_err_spare2_s_hw_set;  		// Hardware set signal for
                               			// ilu_log_err_spare2_s. When set
                               			// ilu_log_err will be set to one.
  wire ilu_log_err_spare2_s_hw_read;  		// This signal provides the current value
                                		// of ilu_log_err_spare2_s.
  wire ilu_log_err_spare1_s_hw_set;  		// Hardware set signal for
                               			// ilu_log_err_spare1_s. When set
                               			// ilu_log_err will be set to one.
  wire ilu_log_err_spare1_s_hw_read;  		// This signal provides the current value
                                		// of ilu_log_err_spare1_s.
  wire ilu_log_err_ihb_pe_s_hw_set;  		// Hardware set signal for
                               			// ilu_log_err_ihb_pe_s. When set
                               			// ilu_log_err will be set to one.
  wire ilu_log_err_ihb_pe_s_hw_read;  		// This signal provides the current value
                                		// of ilu_log_err_ihb_pe_s.
  wire ilu_log_err_spare3_p_hw_set;  		// Hardware set signal for
                               			// ilu_log_err_spare3_p. When set
                               			// ilu_log_err will be set to one.
  wire ilu_log_err_spare3_p_hw_read;  		// This signal provides the current value
                                		// of ilu_log_err_spare3_p.
  wire ilu_log_err_spare2_p_hw_set;  		// Hardware set signal for
                               			// ilu_log_err_spare2_p. When set
                               			// ilu_log_err will be set to one.
  wire ilu_log_err_spare2_p_hw_read;  		// This signal provides the current value
                                		// of ilu_log_err_spare2_p.
  wire ilu_log_err_spare1_p_hw_set; 		// Hardware set signal for
                               			// ilu_log_err_spare1_p. When set
                              			// ilu_log_err will be set to one.
  wire ilu_log_err_spare1_p_hw_read;  		// This signal provides the current value
                                		// of ilu_log_err_spare1_p.
  wire ilu_log_err_ihb_pe_p_hw_set;  		// Hardware set signal for
                               			// ilu_log_err_ihb_pe_p. When set
                               			// ilu_log_err will be set to one.
  wire ilu_log_err_ihb_pe_p_hw_read;  		// This signal provides the current value
                                      		// of ilu_log_err_ihb_pe_p.
  wire	dbg_ue_int,dbg_ce_int,dbg_oe_int;
wire	ilu_diagnos_enpll1_hw_read;		// enable SERDES PLL1
wire	ilu_diagnos_enpll0_hw_read;		// enable SERDES PLL0
wire	ilu_diagnos_entx7_hw_read;		// enable SERDES tx7
wire	ilu_diagnos_entx6_hw_read;		// enable SERDES tx6
wire	ilu_diagnos_entx5_hw_read;		// enable SERDES tx5
wire	ilu_diagnos_entx4_hw_read;		// enable SERDES tx4
wire	ilu_diagnos_entx3_hw_read;		// enable SERDES tx3
wire	ilu_diagnos_entx2_hw_read;		// enable SERDES tx2
wire	ilu_diagnos_entx1_hw_read;		// enable SERDES tx1
wire	ilu_diagnos_entx0_hw_read;		// enable SERDES tx0
wire	ilu_diagnos_enrx7_hw_read;		// enable SERDES rx7
wire	ilu_diagnos_enrx6_hw_read;		// enable SERDES rx6
wire	ilu_diagnos_enrx5_hw_read;		// enable SERDES rx5
wire	ilu_diagnos_enrx4_hw_read;		// enable SERDES rx4
wire	ilu_diagnos_enrx3_hw_read;		// enable SERDES rx3
wire	ilu_diagnos_enrx2_hw_read;		// enable SERDES rx2
wire	ilu_diagnos_enrx1_hw_read;		// enable SERDES rx1
wire	ilu_diagnos_enrx0_hw_read;		// enable SERDES rx0

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<


  //---------------------------------------------------------------------
  // debug
  //---------------------------------------------------------------------

  always @ (low_dbg_sel_a or low_dbg_sel_b) begin
    dbg_sel[0] = low_dbg_sel_a;
    dbg_sel[1] = low_dbg_sel_b;
  end

  always @ (dbg_sel[0] or dbg_sel[1] or
	    y2k_mps or
	    dbg_ue_int or
            dbg_ce_int or
            dbg_oe_int or
	    cib2eil_pec_drain or
	    y2k_int_l ) begin
    for (i = 0; i < 2; i = i + 1) begin
      case (dbg_sel[i]) // synopsys infer_mux
//        3'b000: nxt_dbg_bus[i] = {p2d_mps, p2d_ue_int, p2d_ce_int,
//				  p2d_oe_int, p2d_drain, y2k_int_l};
        3'b000: nxt_dbg_bus[i] = {y2k_mps, dbg_ue_int, dbg_ce_int,
				  dbg_oe_int, cib2eil_pec_drain, y2k_int_l};
        3'b001: nxt_dbg_bus[i] = 8'b0;                                 
        3'b010: nxt_dbg_bus[i] = 8'b0;
        3'b011: nxt_dbg_bus[i] = 8'b0;
        3'b100: nxt_dbg_bus[i] = 8'b0;                                 
        3'b101: nxt_dbg_bus[i] = 8'b0;
        3'b110: nxt_dbg_bus[i] = 8'b0;
        3'b111: nxt_dbg_bus[i] = 8'b0;
      endcase
    end
  end

  assign cib_dbg_a = dbg_bus[0];
  assign cib_dbg_b = dbg_bus[1];

  always @ (posedge clk) 
	if(~rst_l) begin : dbg_rst
	  integer j;
    for (j = 0; j < 2; j = j + 1) begin
      dbg_bus[j] <= {8{1'b0}};
	end
      end
	else begin : dbg_out
	  integer j;
    for (j = 0; j < 2; j = j + 1) begin
      dbg_bus[j] <= nxt_dbg_bus[j];
    end
  end

  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

 // The current hook up of the 6 DCC's is as follows 
  //
  //		to		from
  //		DMC		DMC
  //		 |		 |
  //		DCC		 |
  //		 |		 |
  //		 -------BYP-------
  //		 |		 |
  //		DCD		DCS
  //		 |		 |
  //		 |		 |
  //		 |		 |
  //		PEC		PEC
  //		from		to



  //------------------------------------------------------------------------
  // SERDES enables forced to 0 during pwron
  //------------------------------------------------------------------------
wire	serdes_por_;
wire	[17:0]	x;
assign	dmu_psr_pll_en_sds1	= serdes_por_	?	ilu_diagnos_enpll1_hw_read	: 1'b1 ;	
assign	dmu_psr_pll_en_sds0	=serdes_por_	?	ilu_diagnos_enpll0_hw_read	: 1'b1 ;	

assign	dmu_psr_tx_en_b3_sds1	=serdes_por_	?	ilu_diagnos_entx7_hw_read	: 1'b1 ;	
assign	dmu_psr_tx_en_b2_sds1	=serdes_por_	?	ilu_diagnos_entx6_hw_read	: 1'b1 ;	
assign	dmu_psr_tx_en_b1_sds1	=serdes_por_	?	ilu_diagnos_entx5_hw_read	: 1'b1 ;	
assign	dmu_psr_tx_en_b0_sds1	=serdes_por_	?	ilu_diagnos_entx4_hw_read	: 1'b1 ;	
assign	dmu_psr_tx_en_b3_sds0	=serdes_por_	?	ilu_diagnos_entx3_hw_read	: 1'b1 ;	
assign	dmu_psr_tx_en_b2_sds0	=serdes_por_	?	ilu_diagnos_entx2_hw_read	: 1'b1 ;	
assign	dmu_psr_tx_en_b1_sds0	=serdes_por_	?	ilu_diagnos_entx1_hw_read	: 1'b1 ;	
assign	dmu_psr_tx_en_b0_sds0	=serdes_por_	?	ilu_diagnos_entx0_hw_read	: 1'b1 ;	

assign	dmu_psr_rx_en_b3_sds1	=serdes_por_	?	ilu_diagnos_enrx7_hw_read	: 1'b1 ;	
assign	dmu_psr_rx_en_b2_sds1	=serdes_por_	?	ilu_diagnos_enrx6_hw_read	: 1'b1 ;	
assign	dmu_psr_rx_en_b1_sds1	=serdes_por_	?	ilu_diagnos_enrx5_hw_read	: 1'b1 ;	
assign	dmu_psr_rx_en_b0_sds1	=serdes_por_	?	ilu_diagnos_enrx4_hw_read	: 1'b1 ;	
assign	dmu_psr_rx_en_b3_sds0	=serdes_por_	?	ilu_diagnos_enrx3_hw_read	: 1'b1 ;	
assign	dmu_psr_rx_en_b2_sds0	=serdes_por_	?	ilu_diagnos_enrx2_hw_read	: 1'b1 ;	
assign	dmu_psr_rx_en_b1_sds0	=serdes_por_	?	ilu_diagnos_enrx1_hw_read	: 1'b1 ;	
assign	dmu_psr_rx_en_b0_sds0	=serdes_por_	?	ilu_diagnos_enrx0_hw_read	: 1'b1 ;	

wire	rst_dmu_async_por_q_;
wire	[1:0]	csr_peu_rate_scale,csr_peu_rate_scale_mux_out;
reg	tcu_test_protect_d;
reg	[1:0]	csr_peu_rate_scale_d;

cl_a1_clksyncff_4x por_sync_flop ( .d(rst_dmu_async_por_), .si(1'b0), .q( rst_dmu_async_por_q_), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );

assign	serdes_por_	= rst_dmu_async_por_ & rst_dmu_async_por_q_ & ~tcu_test_protect_d;

  always @ (posedge clk)  begin
	if(~por_l) begin 
      tcu_test_protect_d <= {1'b0};
	end
	else begin 
      tcu_test_protect_d <= tcu_test_protect;
    end
  end

  always @ (posedge clk)  begin
	if(~rst_l | ~por_l) begin 
      csr_peu_rate_scale_d <= csr_peu_rate_scale;
	end
	else begin 
      csr_peu_rate_scale_d <= csr_peu_rate_scale_d;
    end
  end

// BP N2 11-10-05, only change rate_scale to peu during wmr_l

assign	csr_peu_rate_scale_mux_out = ~rst_wmr_ ? csr_peu_rate_scale : csr_peu_rate_scale_d ;
assign	ilu_diagnos_rate_scale_hw_read = ~serdes_por_ ? 2'b00 : csr_peu_rate_scale_mux_out ;

// -0in constant -var ilu_diagnos_rate_scale_hw_read -active rst_wmr_

  //------------------------------------------------------------------------
  // DCB (bypass)
  //------------------------------------------------------------------------

  pcie_common_dcb byp (
  
     .csr_byp_ring_out	(byp2dcc_csr_ring),
     .csr_ext_ring_out	(byp2dcs_csr_ring),
     .clk		(clk),
     .rst_l		(rst_l),
     .byp_src		(`FIRE_CSR_SRCB_MEDM),
     .csr_byp_ring_in	(k2y_csr_ring_out),
     .csr_ext_ring_in	(dcd2byp_csr_ring)
   );
   
   
  //------------------------------------------------------------------------
  // DCB (bypass)
  //------------------------------------------------------------------------

pcie_common_dcc dcc (

        .csr_ring_out 	  (y2k_csr_ring_in),
        .csrbus_wr_data   (csrbus_wr_data),
        .csrbus_addr 	  (csrbus_addr),
        .csrbus_wr 	  (csrbus_wr),
        .csrbus_valid 	  (csrbus_valid),
        .csrbus_src_bus   (csrbus_src_bus),
        .clk 		  (clk),
	.rst_l		  (rst_l),
        .csr_ring_in 	  (byp2dcc_csr_ring),
        .csrbus_read_data (csrbus_read_data),
        .csrbus_done 	  (csrbus_done),
        .csrbus_mapped 	  (csrbus_mapped),
        .csrbus_acc_vio   (csrbus_acc_vio));


  //------------------------------------------------------------------------
  // DCS (To PEC) 
  //------------------------------------------------------------------------


pcie_common_dcs dcs  (

        .clk 	         (clk),
        .rst_l 	         (rst_l),
        .csr_rng_data    (byp2dcs_csr_ring),
        .csr_pkt_ack     (p2d_csr_ack),
        .csr_pkt_data    (d2p_csr_rcd),
        .csr_pkt_req      (d2p_csr_req));

  //------------------------------------------------------------------------
  // DCD (From PEC) 
  //------------------------------------------------------------------------



pcie_common_dcd dcd(
        .clk 	          (clk),
        .rst_l 	          (rst_l),
        .csr_pkt_data     (p2d_csr_rcd),
        .csr_pkt_req      (p2d_csr_req),
        .csr_pkt_ack      (d2p_csr_ack),
        .csr_rng_data     (dcd2byp_csr_ring));					      
					      


  //------------------------------------------------------------------------
  // DCM 
  //------------------------------------------------------------------------
					      					      
dmu_ilu_cib_csr csr (
        .clk 				   (clk),
        .csrbus_valid 			   (csrbus_valid),
        .csrbus_done 			   (csrbus_done),
        .csrbus_mapped 			   (csrbus_mapped),
        .csrbus_wr_data 		   (csrbus_wr_data),
        .csrbus_wr 			   (csrbus_wr),
        .csrbus_read_data 		   (csrbus_read_data),
        .csrbus_addr 			   (csrbus_addr),
        .rst_l 				   (rst_l),
        .por_l 				   (por_l),
        .csrbus_src_bus 		   (csrbus_src_bus),
        .csrbus_acc_vio 		   (csrbus_acc_vio),
        .instance_id 			   (j2d_instance_id),
        .pec_int_en_pec_hw_read 	   (pec_int_en_pec_hw_read),
        .pec_int_en_pec_ilu_hw_read 	   (pec_int_en_pec_ilu_hw_read),
        .pec_int_en_pec_ue_hw_read 	   (pec_int_en_pec_ue_hw_read),
        .pec_int_en_pec_ce_hw_read 	   (pec_int_en_pec_ce_hw_read),
        .pec_int_en_pec_oe_hw_read 	   (pec_int_en_pec_oe_hw_read),
        .pec_en_err_ilu_ext_read_data 	   (pec_en_err_ilu_ext_read_data),
        .pec_en_err_ue_ext_read_data 	   (pec_en_err_ue_ext_read_data),
        .pec_en_err_ce_ext_read_data 	   (pec_en_err_ce_ext_read_data),
        .pec_en_err_oe_ext_read_data 	   (pec_en_err_oe_ext_read_data),
        .ilu_int_en_spare3_s_hw_read 	   (ilu_int_en_spare3_s_hw_read),
        .ilu_int_en_spare2_s_hw_read 	   (ilu_int_en_spare2_s_hw_read),
        .ilu_int_en_spare1_s_hw_read 	   (ilu_int_en_spare1_s_hw_read),
        .ilu_int_en_ihb_pe_s_hw_read 	   (ilu_int_en_ihb_pe_s_hw_read),
        .ilu_int_en_spare3_p_hw_read 	   (ilu_int_en_spare3_p_hw_read),
        .ilu_int_en_spare2_p_hw_read 	   (ilu_int_en_spare2_p_hw_read),
        .ilu_int_en_spare1_p_hw_read 	   (ilu_int_en_spare1_p_hw_read),
        .ilu_int_en_ihb_pe_p_hw_read 	   (ilu_int_en_ihb_pe_p_hw_read),
        .ilu_log_en_spare3_hw_read 	   (ilu_log_en_spare3_hw_read),
        .ilu_log_en_spare2_hw_read 	   (ilu_log_en_spare2_hw_read),
        .ilu_log_en_spare1_hw_read 	   (ilu_log_en_spare1_hw_read),
        .ilu_log_en_ihb_pe_hw_read 	   (ilu_log_en_ihb_pe_hw_read),
        .ilu_en_err_spare3_s_ext_read_data (ilu_en_err_spare3_s_ext_read_data),
        .ilu_en_err_spare2_s_ext_read_data (ilu_en_err_spare2_s_ext_read_data),
        .ilu_en_err_spare1_s_ext_read_data (ilu_en_err_spare1_s_ext_read_data),
        .ilu_en_err_ihb_pe_s_ext_read_data (ilu_en_err_ihb_pe_s_ext_read_data),
        .ilu_en_err_spare3_p_ext_read_data (ilu_en_err_spare3_p_ext_read_data),
        .ilu_en_err_spare2_p_ext_read_data (ilu_en_err_spare2_p_ext_read_data),
        .ilu_en_err_spare1_p_ext_read_data (ilu_en_err_spare1_p_ext_read_data),
        .ilu_en_err_ihb_pe_p_ext_read_data (ilu_en_err_ihb_pe_p_ext_read_data),
        .ilu_log_err_spare3_s_hw_set 	   (ilu_log_err_spare3_s_hw_set),
        .ilu_log_err_spare3_s_hw_read 	   (ilu_log_err_spare3_s_hw_read),
        .ilu_log_err_spare2_s_hw_set 	   (ilu_log_err_spare2_s_hw_set),
        .ilu_log_err_spare2_s_hw_read 	   (ilu_log_err_spare2_s_hw_read),
        .ilu_log_err_spare1_s_hw_set 	   (ilu_log_err_spare1_s_hw_set),
        .ilu_log_err_spare1_s_hw_read 	   (ilu_log_err_spare1_s_hw_read),
        .ilu_log_err_ihb_pe_s_hw_set 	   (ilu_log_err_ihb_pe_s_hw_set),
        .ilu_log_err_ihb_pe_s_hw_read 	   (ilu_log_err_ihb_pe_s_hw_read),
        .ilu_log_err_spare3_p_hw_set 	   (ilu_log_err_spare3_p_hw_set),
        .ilu_log_err_spare3_p_hw_read 	   (ilu_log_err_spare3_p_hw_read),
        .ilu_log_err_spare2_p_hw_set 	   (ilu_log_err_spare2_p_hw_set),
        .ilu_log_err_spare2_p_hw_read 	   (ilu_log_err_spare2_p_hw_read),
        .ilu_log_err_spare1_p_hw_set 	   (ilu_log_err_spare1_p_hw_set),
        .ilu_log_err_spare1_p_hw_read 	   (ilu_log_err_spare1_p_hw_read),
        .ilu_log_err_ihb_pe_p_hw_set 	   (ilu_log_err_ihb_pe_p_hw_set),
        .ilu_log_err_ihb_pe_p_hw_read 	   (ilu_log_err_ihb_pe_p_hw_read),
        .ilu_diagnos_edi_par_hw_read	   (ilu_diagnos_edi_par_hw_read),
        .ilu_diagnos_ehi_par_hw_read	   (ilu_diagnos_ehi_par_hw_read),
        .ilu_diagnos_edi_trig_hw_clr	   (ilu_diagnos_edi_trig_hw_clr),
        .ilu_diagnos_edi_trig_hw_read	   (ilu_diagnos_edi_trig_hw_read),
        .ilu_diagnos_ehi_trig_hw_clr       (ilu_diagnos_ehi_trig_hw_clr),
        .ilu_diagnos_ehi_trig_hw_read      (ilu_diagnos_ehi_trig_hw_read),
        .ilu_diagnos_enpll1_hw_read	   (ilu_diagnos_enpll1_hw_read ),
        .ilu_diagnos_enpll0_hw_read	   (ilu_diagnos_enpll0_hw_read ),
        .ilu_diagnos_entx7_hw_read	   (ilu_diagnos_entx7_hw_read ),
        .ilu_diagnos_entx6_hw_read	   (ilu_diagnos_entx6_hw_read ),
        .ilu_diagnos_entx5_hw_read	   (ilu_diagnos_entx5_hw_read ),
        .ilu_diagnos_entx4_hw_read	   (ilu_diagnos_entx4_hw_read ),
        .ilu_diagnos_entx3_hw_read	   (ilu_diagnos_entx3_hw_read ),
        .ilu_diagnos_entx2_hw_read	   (ilu_diagnos_entx2_hw_read ),
        .ilu_diagnos_entx1_hw_read	   (ilu_diagnos_entx1_hw_read ),
        .ilu_diagnos_entx0_hw_read	   (ilu_diagnos_entx0_hw_read ),
        .ilu_diagnos_enrx7_hw_read	   (ilu_diagnos_enrx7_hw_read ),
        .ilu_diagnos_enrx6_hw_read	   (ilu_diagnos_enrx6_hw_read ),
        .ilu_diagnos_enrx5_hw_read	   (ilu_diagnos_enrx5_hw_read ),
        .ilu_diagnos_enrx4_hw_read	   (ilu_diagnos_enrx4_hw_read ),
        .ilu_diagnos_enrx3_hw_read	   (ilu_diagnos_enrx3_hw_read ),
        .ilu_diagnos_enrx2_hw_read	   (ilu_diagnos_enrx2_hw_read ),
        .ilu_diagnos_enrx1_hw_read	   (ilu_diagnos_enrx1_hw_read ),
        .ilu_diagnos_enrx0_hw_read	   (ilu_diagnos_enrx0_hw_read ),
        .ilu_diagnos_rate_scale_hw_read    (csr_peu_rate_scale)

);		      
					      
dmu_ilu_cib_cim cim  (

        .clk 				   (clk),
        .rst_l 				   (rst_l),
        .p2d_mps 			   (p2d_mps),
        .p2d_ue_int 			   (p2d_ue_int),
        .p2d_ce_int 			   (p2d_ce_int),
        .p2d_oe_int 			   (p2d_oe_int),
        .dbg_ue_int 			   (dbg_ue_int),
        .dbg_ce_int 			   (dbg_ce_int),
        .dbg_oe_int 			   (dbg_oe_int),
        .p2d_drain 			   (p2d_drain),
        .y2k_mps 			   (y2k_mps),
        .y2k_int_l 			   (y2k_int_l),
        .iil2cib_ihb_pe 		   (iil2cib_ihb_pe),
        .cib2iil_ihb_pe_drain              (cib2iil_ihb_pe_drain),
        .cib2iil_pec_drain                 (cib2iil_pec_drain),
        .cib2eil_ihb_pe_drain              (cib2eil_ihb_pe_drain),
        .cib2eil_pec_drain                 (cib2eil_pec_drain),
        .pec_int_en_pec_hw_read 	   (pec_int_en_pec_hw_read),
        .pec_int_en_pec_ilu_hw_read 	   (pec_int_en_pec_ilu_hw_read),
        .pec_int_en_pec_ue_hw_read 	   (pec_int_en_pec_ue_hw_read),
        .pec_int_en_pec_ce_hw_read 	   (pec_int_en_pec_ce_hw_read),
        .pec_int_en_pec_oe_hw_read 	   (pec_int_en_pec_oe_hw_read),
        .pec_en_err_ilu_ext_read_data 	   (pec_en_err_ilu_ext_read_data),
        .pec_en_err_ue_ext_read_data 	   (pec_en_err_ue_ext_read_data),
        .pec_en_err_ce_ext_read_data 	   (pec_en_err_ce_ext_read_data),
        .pec_en_err_oe_ext_read_data 	   (pec_en_err_oe_ext_read_data),
        .ilu_int_en_spare3_s_hw_read 	   (ilu_int_en_spare3_s_hw_read),
        .ilu_int_en_spare2_s_hw_read 	   (ilu_int_en_spare2_s_hw_read),
        .ilu_int_en_spare1_s_hw_read 	   (ilu_int_en_spare1_s_hw_read),
        .ilu_int_en_ihb_pe_s_hw_read 	   (ilu_int_en_ihb_pe_s_hw_read),
        .ilu_int_en_spare3_p_hw_read 	   (ilu_int_en_spare3_p_hw_read),
        .ilu_int_en_spare2_p_hw_read 	   (ilu_int_en_spare2_p_hw_read),
        .ilu_int_en_spare1_p_hw_read 	   (ilu_int_en_spare1_p_hw_read),
        .ilu_int_en_ihb_pe_p_hw_read 	   (ilu_int_en_ihb_pe_p_hw_read),
        .ilu_log_en_spare3_hw_read 	   (ilu_log_en_spare3_hw_read),
        .ilu_log_en_spare2_hw_read 	   (ilu_log_en_spare2_hw_read),
        .ilu_log_en_spare1_hw_read 	   (ilu_log_en_spare1_hw_read),
        .ilu_log_en_ihb_pe_hw_read 	   (ilu_log_en_ihb_pe_hw_read),
        .ilu_en_err_spare3_s_ext_read_data (ilu_en_err_spare3_s_ext_read_data),
        .ilu_en_err_spare2_s_ext_read_data (ilu_en_err_spare2_s_ext_read_data),
        .ilu_en_err_spare1_s_ext_read_data (ilu_en_err_spare1_s_ext_read_data),
        .ilu_en_err_ihb_pe_s_ext_read_data (ilu_en_err_ihb_pe_s_ext_read_data),
        .ilu_en_err_spare3_p_ext_read_data (ilu_en_err_spare3_p_ext_read_data),
        .ilu_en_err_spare2_p_ext_read_data (ilu_en_err_spare2_p_ext_read_data),
        .ilu_en_err_spare1_p_ext_read_data (ilu_en_err_spare1_p_ext_read_data),
        .ilu_en_err_ihb_pe_p_ext_read_data (ilu_en_err_ihb_pe_p_ext_read_data),
        .ilu_log_err_spare3_s_hw_set 	   (ilu_log_err_spare3_s_hw_set),
        .ilu_log_err_spare3_s_hw_read 	   (ilu_log_err_spare3_s_hw_read),
        .ilu_log_err_spare2_s_hw_set 	   (ilu_log_err_spare2_s_hw_set),
        .ilu_log_err_spare2_s_hw_read 	   (ilu_log_err_spare2_s_hw_read),
        .ilu_log_err_spare1_s_hw_set 	   (ilu_log_err_spare1_s_hw_set),
        .ilu_log_err_spare1_s_hw_read 	   (ilu_log_err_spare1_s_hw_read),
        .ilu_log_err_ihb_pe_s_hw_set 	   (ilu_log_err_ihb_pe_s_hw_set),
        .ilu_log_err_ihb_pe_s_hw_read 	   (ilu_log_err_ihb_pe_s_hw_read),
        .ilu_log_err_spare3_p_hw_set 	   (ilu_log_err_spare3_p_hw_set),
        .ilu_log_err_spare3_p_hw_read 	   (ilu_log_err_spare3_p_hw_read),
        .ilu_log_err_spare2_p_hw_set 	   (ilu_log_err_spare2_p_hw_set),
        .ilu_log_err_spare2_p_hw_read 	   (ilu_log_err_spare2_p_hw_read),
        .ilu_log_err_spare1_p_hw_set 	   (ilu_log_err_spare1_p_hw_set),
        .ilu_log_err_spare1_p_hw_read 	   (ilu_log_err_spare1_p_hw_read),
        .ilu_log_err_ihb_pe_p_hw_set 	   (ilu_log_err_ihb_pe_p_hw_set),
        .ilu_log_err_ihb_pe_p_hw_read 	   (ilu_log_err_ihb_pe_p_hw_read));


endmodule // dmu_ilu_cib



