// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu.v
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
module dmu_imu (
		clk,
		rst_l,
		por_l,

		// Outputs to LRM (INT OUT RECORD QUEUE)  
		
		im2rm_rcd,
		im2rm_rcd_enq,
		
		
		// Inputs from Record Header Queue (INT IN RECORD QUEUE)
		
		rm2im_rcd,
		rm2im_rcd_enq, 
		


		// Inputs from Record Header Queue ( MSI DATA RECORD QUEUE) 
		
		tm2im_data,
		tm2im_data_enq, 
		
		
		// Static Jbus ID Sel 

		j2d_jid,	
		j2d_instance_id, 
		
		// Mondo Reply status interface 

		rm2im_rply,
		rm2im_rply_enq,
				
		// Block Level Int Signals

		mm2im_int,
				
		// Core Level Int Signals

		y2k_int_l,
		    
//		j2d_ext_int_l, 
		
//		j2d_i2c0_int_l, 
//		j2d_i2c1_int_l,
//		j2d_jbc_int_l, 
				
		// MONDO REC QUEUE INTERAFCE

		im2rm_mdo_enq,
		im2rm_mdo,
		
		
		// DIU INTERFACE
		im2di_wr,
		im2di_addr,
		im2di_data,
		im2di_dpar,
		im2di_bmask,		

		// TMU Static CSR Signals
		
		im2tm_msi32_addr_reg,
		im2tm_msi64_addr_reg,
		im2rm_mem64_offset_reg,

						
			
		// CSRBUS Interface

		cr2im_csrbus_valid,
                im2cr_csrbus_done,
                im2cr_csrbus_mapped,
                cr2im_csrbus_wr_data,
                cr2im_csrbus_wr,
                im2cr_csrbus_read_data,
                cr2im_csrbus_addr,
		cr2im_csrbus_src_bus,
		im2cr_csrbus_acc_vio, 
		
		cr2im_dbg_sel_a,
   		cr2im_dbg_sel_b,
		
   		im2cr_dbg_a,
   		im2cr_dbg_b,
		
   		dmu_dbg_err_event,

		csr_sun4v_en,
		im2tm_eqs_adr_63,

		im2crm_bc_stall_en,
		im2crm_ilu_stall_en
		);
		
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 				clk;
  input					rst_l; 
  input					por_l; 

  //------------------------------------------------------------------------
  //  Outputs to LRM    
  //------------------------------------------------------------------------
 
  output [`FIRE_DLC_IOT_REC_WDTH-1:0]	im2rm_rcd;
  output				im2rm_rcd_enq;
 
  //------------------------------------------------------------------------
  //  Inputs from LRM for Command Headers   
  //------------------------------------------------------------------------

  input	[`FIRE_DLC_IIN_REC_WDTH-1:0] 	rm2im_rcd; 
  input           			rm2im_rcd_enq; 
  
  
  //------------------------------------------------------------------------
  //  Inputs from DIM for Data Headers   
  //------------------------------------------------------------------------

  input [`FIRE_DLC_MDF_REC_WDTH-1:0] 	tm2im_data; 
  input          			tm2im_data_enq; 
  
  
  //------------------------------------------------------------------------
  //  Static JBUS signal Select     
  //------------------------------------------------------------------------
  input	[`FIRE_J2D_JID_WDTH-1:0]		j2d_jid; 
  input	[`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;

 
  //------------------------------------------------------------------------
  //  Input Signals from RRM Block  Signals      
  //------------------------------------------------------------------------
  
  input 				rm2im_rply_enq; 
  input	[`FIRE_DLC_MRR_REC_WDTH-1:0]	rm2im_rply; 		
    
 
  //------------------------------------------------------------------------
  // DMC Block Interrupt Signals 
  //------------------------------------------------------------------------
  
  input					mm2im_int;
  
  
  //------------------------------------------------------------------------
  // PEC Core Interrupt Signals 
  //------------------------------------------------------------------------
  input					y2k_int_l;
  
   //------------------------------------------------------------------------
  // External Interrupt Signals 
  //------------------------------------------------------------------------
//  input	[19:0]				j2d_ext_int_l;
  

  //------------------------------------------------------------------------
  // Onboard Interrupt Signals 
  //------------------------------------------------------------------------
//  input					j2d_i2c0_int_l;  
//  input					j2d_i2c1_int_l;
  
  //------------------------------------------------------------------------
  // Internal Interrupt Signals 
  //------------------------------------------------------------------------
//  input					j2d_jbc_int_l;
  
  //-----------------------------------------------------
  // Interface for to LRM for Mondo Records
  //-----------------------------------------------------
  
  output        			im2rm_mdo_enq;    	
  output [`FIRE_DLC_MQR_REC_WDTH-1:0] 	im2rm_mdo;         	
 
 
 
  //------------------------------------------------------------------------
  //  Outputs to DIU Block Signals     
  //------------------------------------------------------------------------
  
  output 				im2di_wr;
  output [`FIRE_DLC_IRD_ADDR_WDTH-1:0]	im2di_addr; 
  output [`FIRE_DLC_IRD_DATA_WDTH-1:0]	im2di_data;
  output [`FIRE_DLC_IRD_DPAR_WDTH-1:0]	im2di_dpar;
  output [`FIRE_DLC_IRD_BMASK_WDTH-1:0]	im2di_bmask; 		

  //------------------------------------------------------------------------
  // TMU Static CSR Signals
  //------------------------------------------------------------------------
  		
  output [15:0]	im2tm_msi32_addr_reg;
  output [47:0]	im2tm_msi64_addr_reg;
  output [39:0]	im2rm_mem64_offset_reg;
  
  //------------------------------------------------------------------------
  // PIO INTERFACE   
  //------------------------------------------------------------------------
  input         			cr2im_csrbus_valid; 
  output        			im2cr_csrbus_done;
  output        			im2cr_csrbus_mapped; 
  
  input [`FIRE_CSR_DATA_WIDTH-1:0]      cr2im_csrbus_wr_data; 
  input                                 cr2im_csrbus_wr; 
  
  output [`FIRE_CSR_DATA_WIDTH-1:0]      im2cr_csrbus_read_data;
  
  input [`FIRE_CSR_ADDR_MAX_WIDTH-1:0]  cr2im_csrbus_addr;
       
  input [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0]cr2im_csrbus_src_bus; 
  output                                im2cr_csrbus_acc_vio; 

  //------------------------------------------------------------------------
  //  Block Debug Level Selects and Output Ports     
  //------------------------------------------------------------------------

  input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	      	cr2im_dbg_sel_a;
  input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	      	cr2im_dbg_sel_b;
  
  output  [`FIRE_DEBUG_WDTH-1:0]	      	im2cr_dbg_a;
  output  [`FIRE_DEBUG_WDTH-1:0]		im2cr_dbg_b;
 
//############################################################################
//				for N2 debug
//############################################################################
  output  					dmu_dbg_err_event;

//############################################################################
//				for msi addr compare in sun4v, don't use bit 63
//############################################################################
  input  					csr_sun4v_en;
  output  					im2tm_eqs_adr_63;

//############################################################################
//				enables for bug fix 107207, lockup
//############################################################################
  output  					im2crm_bc_stall_en;
  output  					im2crm_ilu_stall_en;

//############################################################################
//				PARAMETERS
//############################################################################


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Wire 
//**************************************************

  //------------------------------------------------------------------------
  //   Outputs for Command Headers to RDS    
  //------------------------------------------------------------------------

  wire  [`FIRE_DLC_IIN_REC_WDTH-1:0]	irs2rds_rcd; 
  wire          			rds2irs_rcd_deq; 
  wire    				irs2rds_rcd_empty; 

 
  //------------------------------------------------------------------------
  //   wires for Data Headers to RDS    
  //------------------------------------------------------------------------

  wire  [`FIRE_DLC_MDF_REC_WDTH-1:0]  	irs2rds_data; 
  wire          			rds2irs_data_deq; 
  wire    				irs2rds_data_empty; 

 //------------------------------------------------------------------------
  //  Output Interrupt Signals     
  //------------------------------------------------------------------------
  wire [3:0]				rds2iss_intx_int_l; 
  
  
  //------------------------------------------------------------------------
  //  Output to State Check Sub-block Signals     
  //------------------------------------------------------------------------
		
  wire [`FIRE_DLC_IOT_REC_WDTH-1:0]	rds2scs_rcd;
  wire					rds2scs_rcd_sel;
  wire [5:0]				rds2scs_eq;
		
		
 //------------------------------------------------------------------------
  //  Output to EQ State Sub-block Signals     
  //------------------------------------------------------------------------
  wire [5:0]				rds2eqs_eq;
  wire					rds2eqs_eq_sel;


 //------------------------------------------------------------------------
  //  Input from Decoder sub-block    
  //------------------------------------------------------------------------
  wire					eqs2scs_eq_ok;
  wire					eqs2scs_eq_not_en;
  
  //------------------------------------------------------------------------
  //  Output to Out Record Sub-block     
  //------------------------------------------------------------------------
		
  wire [`FIRE_DLC_IOT_REC_WDTH-1:0]	scs2ors_rcd;
  wire					scs2ors_rcd_sel;
		
  //------------------------------------------------------------------------
  //  Output to EQS   
  //------------------------------------------------------------------------
		
  wire  [61:0]				eqs2ors_eq_addr;   	
  wire        				eqs2ors_sel;   	
  
  //------------------------------------------------------------------------
  // EQ Interrupt Signals 
  //------------------------------------------------------------------------
  wire [35:0]				eqs2iss_eq_int_l;
  
  //------------------------------------------------------------------------
  // Error Signals 
  //------------------------------------------------------------------------
  wire					eqs2ics_eq_over_error; 
  wire					scs2ics_eq_not_en_error;
  wire					rds2ics_msi_mal_error;
  wire					rds2ics_msi_par_error;
  wire					rds2ics_pmeack_mes_not_en_error;
  wire					rds2ics_pmpme_mes_not_en_error;
  wire					rds2ics_fatal_mes_not_en_error;
  wire					rds2ics_nonfatal_mes_not_en_error;
  wire					rds2ics_cor_mes_not_en_error;
  wire					rds2ics_msi_not_en_error;
  wire [63:0]				rds2ics_error_data;
  wire [63:0]				scs2ics_error_data;
  wire [63:0]				eqs2ics_error_data;

  	

  //-----------------------------------------------------
  // Interface for Group Controller Arbiter
  //-----------------------------------------------------
  
  wire		rss2gcs_rply; 		// Reply type from RSS ack =1 nack =0
  wire [1:0]	rss2gcs_id; 		// Group controller ID for response
  wire 		rss2gcs_valid; 		// Valid signal to validate respose
  
  //------------------------------------------------------------------------
  // Mondo Requests Going to each of the 4 group controllers      
  //------------------------------------------------------------------------

  wire 	ics2iss_mondo_62_int_l;  //Requests to issue and interrupt from GC 0   
  wire 	ics2iss_mondo_63_int_l;  //Requests to issue and interrupt from GC 0   

 //------------------------------------------------------------------------
  // Mondo Requests Going to each of the 4 group controllers      
  //------------------------------------------------------------------------

  wire [63:0]  	iss2gcs_gc_0_mdo_needed;  //Requests to issue and interrupt from GC 0   
  wire [63:0]	iss2gcs_gc_1_mdo_needed;  //Requests to issue and interrupt from GC 1 
  wire [63:0]  	iss2gcs_gc_2_mdo_needed;  //Requests to issue and interrupt from GC 2  
  wire [63:0]  	iss2gcs_gc_3_mdo_needed;  //Requests to issue and interrupt from GC 3 
  
  //------------------------------------------------------------------------
  // Requests to INT state for TID and to move winner to PENDING   
  //------------------------------------------------------------------------
  
  wire         	gcs2iss_tid_req;        // Request to ISS for TID for accepted mondo
  wire [5:0]  	gcs2iss_tid_sel;	// Select for the TID wire mux
  wire [63:0] 	gcs2iss_mdo_pending;    // ID of mondo that was accecpted

  wire        	iss2gcs_tid_ack;  	// ACK Qualifier for tid of mondo	
  wire [5:0]  	iss2gcs_tid;           	// TID of mondo 
  wire        	iss2gcs_mondo_mode;     // Mondo Mode of the Mondo

  //-----------------------------------------------------
  // Interface for Interrupt Retry Timer
  //-----------------------------------------------------
    
  wire [24:0]  iss2gcs_counter_limit; 		// COunter Limit fo rthe retry counter 

  //------------------------------------------------------------------------
  //  Inputs from RDS Sub-block Signals     
  //------------------------------------------------------------------------
  wire					rds2dms_data_sel;
  wire [127:0]				rds2dms_data;
  wire	[3:0]				rds2dms_d_ptr; 
   	

//--------------------------------------------------------
// Wires FOr Muxing PIO Output Paths
//--------------------------------------------------------

  wire 					rds_done; 
  wire					eqs_done; 
  wire					ics_done;
  wire					iss_done;

  wire 					rds_mapped; 
  wire					eqs_mapped; 
  wire					ics_mapped;
  wire					iss_mapped;
  
  wire 					rds_acc_vio; 
  wire					eqs_acc_vio; 
  wire					ics_acc_vio;
  wire					iss_acc_vio;
  
  wire 	[`FIRE_CSR_DATA_WIDTH-1:0]	rds_read_data; 
  wire	[`FIRE_CSR_DATA_WIDTH-1:0]	eqs_read_data; 
  wire	[`FIRE_CSR_DATA_WIDTH-1:0]	ics_read_data;
  wire	[`FIRE_CSR_DATA_WIDTH-1:0]	iss_read_data;
  
  wire         				csrbus_valid; 
  wire [`FIRE_CSR_DATA_WIDTH-1:0]      	csrbus_wr_data; 
  wire                                 	csrbus_wr; 
  wire [`FIRE_CSR_ADDR_MAX_WIDTH-1:0]  	csrbus_addr;
  wire [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0]	csrbus_src_bus; 

//--------------------------------------------------------
// Wires For Debugging
//--------------------------------------------------------
		
  wire [2:0] 				dbg2eqs_dbg_sel_a;
  wire [2:0] 				dbg2eqs_dbg_sel_b;
  
  wire   [`FIRE_DEBUG_WDTH-1:0]		eqs2dbg_dbg_a;
  wire   [`FIRE_DEBUG_WDTH-1:0]		eqs2dbg_dbg_b;

  wire [2:0] 				dbg2gcs_dbg_sel_a;
  wire [2:0] 				dbg2gcs_dbg_sel_b;
  wire   [`FIRE_DEBUG_WDTH-1:0]		gcs2dbg_dbg_a;
  wire   [`FIRE_DEBUG_WDTH-1:0]		gcs2dbg_dbg_b;
		
  wire [2:0] 				dbg2irs_dbg_sel_a;
  wire [2:0] 				dbg2irs_dbg_sel_b;
  wire   [`FIRE_DEBUG_WDTH-1:0]		irs2dbg_dbg_a;
  wire   [`FIRE_DEBUG_WDTH-1:0]		irs2dbg_dbg_b;
		
  wire [2:0] 				dbg2iss_dbg_sel_a;
  wire [2:0] 				dbg2iss_dbg_sel_b;
  wire   [`FIRE_DEBUG_WDTH-1:0]		iss2dbg_dbg_a;
  wire   [`FIRE_DEBUG_WDTH-1:0]		iss2dbg_dbg_b;
		
  wire [2:0] 				dbg2ors_dbg_sel_a;
  wire [2:0] 				dbg2ors_dbg_sel_b;
  wire   [`FIRE_DEBUG_WDTH-1:0]		ors2dbg_dbg_a;
  wire   [`FIRE_DEBUG_WDTH-1:0]		ors2dbg_dbg_b;
		
  wire [2:0] 				dbg2rds_dbg_sel_a;
  wire [2:0] 				dbg2rds_dbg_sel_b;
  wire   [`FIRE_DEBUG_WDTH-1:0]		rds2dbg_dbg_a;
  wire   [`FIRE_DEBUG_WDTH-1:0]		rds2dbg_dbg_b;
		

  wire   [`FIRE_DEBUG_WDTH-1:0]		rss2dbg_dbg_a;
  wire   [`FIRE_DEBUG_WDTH-1:0]		rss2dbg_dbg_b;
		
  wire [2:0] 				dbg2scs_dbg_sel_a;
  wire [2:0] 				dbg2scs_dbg_sel_b;
  wire   [`FIRE_DEBUG_WDTH-1:0]		scs2dbg_dbg_a;
  wire   [`FIRE_DEBUG_WDTH-1:0]		scs2dbg_dbg_b;		
		
  wire					ors2ics_perf_eq_mondos;
  wire					ors2ics_perf_mondos;
  wire					ors2ics_perf_msi;
  wire					ors2ics_perf_eq_wr;
 
  wire					rss2ics_perf_mondo_nacks; 

//------------------------------------------------------------------------
//  Idle Checkers 
//------------------------------------------------------------------------
		
  wire					rds2dbg_idle; 
  wire					ors2dbg_idle;
  wire					gcs2dbg_idle;	
		
//**************************************************
// Registers that Are Not Flops 
//**************************************************
 reg	[`FIRE_CSR_DATA_WIDTH-1:0]	im2cr_csrbus_read_data;
 
 
//**************************************************
// Registers that Are Flops 
//**************************************************
 

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
 
  //---------------------------------------------------------------------
  //  One Hot / Bits On Checkers  
  //---------------------------------------------------------------------

     //0in bits_on -var {eqs_done,rds_done,ics_done,iss_done} -max 1 
     //0in bits_on -var {eqs_mapped,rds_mapped,ics_mapped,iss_mapped} -max 1

  
   
//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   
		
//-----------------------------------------------------------------------------
//  Muxing Logic for PIO Path 
// 
//-----------------------------------------------------------------------------

assign im2cr_csrbus_done    = eqs_done | rds_done | ics_done | iss_done; 
assign im2cr_csrbus_mapped  = eqs_mapped | rds_mapped | ics_mapped | iss_mapped; 
assign im2cr_csrbus_acc_vio = eqs_acc_vio | rds_acc_vio | ics_acc_vio | iss_acc_vio; 

always @ (eqs_done or rds_done or ics_done or iss_done or
	  eqs_read_data or rds_read_data or ics_read_data or iss_read_data)
	   
      case ({eqs_done, rds_done, ics_done, iss_done}) 
    	4'b1000 :  im2cr_csrbus_read_data = eqs_read_data;
    	4'b0100 :  im2cr_csrbus_read_data = rds_read_data; 
    	4'b0010 :  im2cr_csrbus_read_data = ics_read_data;
    	4'b0001 :  im2cr_csrbus_read_data = iss_read_data; 
    	 default:  im2cr_csrbus_read_data = 64'h0;
      endcase  
      
 assign csrbus_valid   = cr2im_csrbus_valid; 
 assign csrbus_wr_data = cr2im_csrbus_wr_data; 
 assign csrbus_wr      = cr2im_csrbus_wr; 
 assign	csrbus_addr    = cr2im_csrbus_addr;
 assign	csrbus_src_bus = cr2im_csrbus_src_bus;       

wire	eq_base_address_63;
 assign im2tm_eqs_adr_63 = eq_base_address_63;	//BP 12-12-05 to tm for msi_64 compare
//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   	
		
      
//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    		
		
		
 dmu_imu_irs  irs(
		.clk			(clk),
		.rst_l			(rst_l),
		
		// Inputs to Record Header Queue
		
		.rm2im_rcd		(rm2im_rcd),
		.rm2im_rcd_enq		(rm2im_rcd_enq), 
		
		
		//Outputs from Record Header Queue 
		
		.irs2rds_rcd		(irs2rds_rcd), 
		.rds2irs_rcd_deq	(rds2irs_rcd_deq),
		.irs2rds_rcd_empty	(irs2rds_rcd_empty), 
		
		
		
		// Inputs to Record Header Queue
		
		.tm2im_data		(tm2im_data),
		.tm2im_data_enq		(tm2im_data_enq), 
		
		
		//Outputs from Record Header Queue 
		
		.irs2rds_data		(irs2rds_data), 
		.rds2irs_data_deq	(rds2irs_data_deq),
		.irs2rds_data_empty	(irs2rds_data_empty),
		
		.dbg2irs_dbg_sel_a 	(dbg2irs_dbg_sel_a),
        	.dbg2irs_dbg_sel_b 	(dbg2irs_dbg_sel_b),
        	.irs2dbg_dbg_a 	   	(irs2dbg_dbg_a),
        	.irs2dbg_dbg_b 	   	(irs2dbg_dbg_b) 
	
		);
		
	
	
 dmu_imu_rds rds(
		.clk			(clk),
		.rst_l			(rst_l),
		
		// Inputs from the Header Queue
		
		.irs2rds_rcd		(irs2rds_rcd), 
		.rds2irs_rcd_deq	(rds2irs_rcd_deq),
		.irs2rds_rcd_empty	(irs2rds_rcd_empty), 
		
		
		// Inputs and Outputs from the MSI Data Queue
		
		
		.irs2rds_data		(irs2rds_data), 
		.rds2irs_data_deq	(rds2irs_data_deq),
		.irs2rds_data_empty	(irs2rds_data_empty), 
		
		// Static Jbus ID Sel 

		.j2d_jid		(j2d_jid),		
		.j2d_instance_id	(j2d_instance_id),

		// INTX Interrupt Notifcation Mechanism 

		.rds2iss_intx_int_l	(rds2iss_intx_int_l),
		
		// Outputs to State Check Sub-block 
		
		.rds2scs_rcd		(rds2scs_rcd),
		.rds2scs_rcd_sel	(rds2scs_rcd_sel),
		.rds2scs_eq		(rds2scs_eq),
		
		// Outputs to EQ state Sub-block 

		.rds2eqs_eq		(rds2eqs_eq),
		.rds2eqs_eq_sel		(rds2eqs_eq_sel),
		
		// Outputs to Data Move Sub-block
		
		.rds2dms_data_sel	(rds2dms_data_sel),
		.rds2dms_data		(rds2dms_data),
		.rds2dms_d_ptr		(rds2dms_d_ptr),
		
		.rds2ics_msi_mal_error		(rds2ics_msi_mal_error),
		.rds2ics_msi_par_error		(rds2ics_msi_par_error),
		.rds2ics_pmeack_mes_not_en_error	(rds2ics_pmeack_mes_not_en_error),
		.rds2ics_pmpme_mes_not_en_error		(rds2ics_pmpme_mes_not_en_error),
		.rds2ics_fatal_mes_not_en_error		(rds2ics_fatal_mes_not_en_error),
		.rds2ics_nonfatal_mes_not_en_error	(rds2ics_nonfatal_mes_not_en_error),
		.rds2ics_cor_mes_not_en_error		(rds2ics_cor_mes_not_en_error),
		.rds2ics_msi_not_en_error	(rds2ics_msi_not_en_error),
		.rds2ics_error_data		(rds2ics_error_data),

		// CSRBUS Interface

		.csrbus_valid           (csrbus_valid),
        	.csrbus_done            (rds_done),
        	.csrbus_mapped          (rds_mapped),
        	.csrbus_wr_data         (csrbus_wr_data),
        	.csrbus_wr              (csrbus_wr),
        	.csrbus_read_data       (rds_read_data),
        	.csrbus_addr            (csrbus_addr),
		.csrbus_src_bus		(csrbus_src_bus),
		.csrbus_acc_vio		(rds_acc_vio),
		
		.dbg2rds_dbg_sel_a 	(dbg2rds_dbg_sel_a),
        	.dbg2rds_dbg_sel_b 	(dbg2rds_dbg_sel_b),
        	.rds2dbg_dbg_a 	   	(rds2dbg_dbg_a),
        	.rds2dbg_dbg_b 	   	(rds2dbg_dbg_b),
		
		.rds2dbg_idle		(rds2dbg_idle)

		);
	
	
 dmu_imu_scs scs(
		.clk			(clk),
		.rst_l			(rst_l),
		
		// Inputs to State Check Sub-block 
		
		.rds2scs_rcd		(rds2scs_rcd),
		.rds2scs_rcd_sel	(rds2scs_rcd_sel),
		.rds2scs_eq		(rds2scs_eq),
		
		// Inputs from the EQS Block 
		
		.eqs2scs_eq_ok		(eqs2scs_eq_ok),
		.eqs2scs_eq_not_en	(eqs2scs_eq_not_en),

		
		// Outputs to ORS state Sub-block 

		.scs2ors_rcd		(scs2ors_rcd),
		.scs2ors_rcd_sel	(scs2ors_rcd_sel),
		
		.scs2ics_eq_not_en_error (scs2ics_eq_not_en_error),
		.scs2ics_error_data	 (scs2ics_error_data),
		
		.dbg2scs_dbg_sel_a 	(dbg2scs_dbg_sel_a),
        	.dbg2scs_dbg_sel_b 	(dbg2scs_dbg_sel_b),
        	.scs2dbg_dbg_a 	   	(scs2dbg_dbg_a),
        	.scs2dbg_dbg_b 	   	(scs2dbg_dbg_b)

		
		);	
	
		

 dmu_imu_ors ors(
		.clk			(clk),
		.rst_l			(rst_l),
		
				
		.scs2ors_rcd		(scs2ors_rcd),
		.scs2ors_rcd_sel	(scs2ors_rcd_sel),

		
		.eqs2ors_eq_addr	(eqs2ors_eq_addr),
                .eqs2ors_sel		(eqs2ors_sel),

		.im2rm_rcd		(im2rm_rcd),
		.im2rm_rcd_enq		(im2rm_rcd_enq),
		
		.dbg2ors_dbg_sel_a 	(dbg2ors_dbg_sel_a),
        	.dbg2ors_dbg_sel_b 	(dbg2ors_dbg_sel_b),
        	.ors2dbg_dbg_a 	   	(ors2dbg_dbg_a),
        	.ors2dbg_dbg_b 	   	(ors2dbg_dbg_b),
		
		.ors2ics_perf_eq_mondos	(ors2ics_perf_eq_mondos),
		.ors2ics_perf_mondos	(ors2ics_perf_mondos),
		.ors2ics_perf_msi	(ors2ics_perf_msi),
		.ors2ics_perf_eq_wr	(ors2ics_perf_eq_wr),
		
		.ors2dbg_idle		(ors2dbg_idle),
		.csr_sun4v_en		(csr_sun4v_en)

		
		);
		
		
  dmu_imu_eqs  eqs(
		.clk			(clk),
		.rst_l			(rst_l),	
		
		.eqs2iss_eq_int_l	(eqs2iss_eq_int_l),
		
		.rds2eqs_eq_sel		(rds2eqs_eq_sel),
		.rds2eqs_eq		(rds2eqs_eq),
		
		.eqs2scs_eq_ok		(eqs2scs_eq_ok),
		.eqs2scs_eq_not_en	(eqs2scs_eq_not_en),
				
		.eqs2ors_eq_addr	(eqs2ors_eq_addr),
                .eqs2ors_sel		(eqs2ors_sel),
		
                .eq_base_address_63	(eq_base_address_63),

		.eqs2ics_eq_over_error	(eqs2ics_eq_over_error),
		.eqs2ics_error_data	(eqs2ics_error_data),
		
		.csrbus_valid           (csrbus_valid),
        	.csrbus_done            (eqs_done),
        	.csrbus_mapped          (eqs_mapped),
        	.csrbus_wr_data         (csrbus_wr_data),
        	.csrbus_wr              (csrbus_wr),
        	.csrbus_read_data       (eqs_read_data),
        	.csrbus_addr            (csrbus_addr),
		.csrbus_src_bus		(csrbus_src_bus),
		.csrbus_acc_vio		(eqs_acc_vio),
		
		.j2d_instance_id	(j2d_instance_id),
		
		.dbg2eqs_dbg_sel_a 	(dbg2eqs_dbg_sel_a),
        	.dbg2eqs_dbg_sel_b 	(dbg2eqs_dbg_sel_b),
        	.eqs2dbg_dbg_a 	   	(eqs2dbg_dbg_a),
        	.eqs2dbg_dbg_b 	   	(eqs2dbg_dbg_b)
		
		
		);		
		

 dmu_imu_rss  rss(
		.clk			(clk),
		.rst_l			(rst_l),	
		
		
		.rm2im_rply		(rm2im_rply),
		.rm2im_rply_enq		(rm2im_rply_enq),
		
		
		.rss2gcs_rply		(rss2gcs_rply),
		.rss2gcs_id		(rss2gcs_id), 
		.rss2gcs_valid		(rss2gcs_valid),
		
		.rss2dbg_dbg_a 	   	(rss2dbg_dbg_a),
        	.rss2dbg_dbg_b 	   	(rss2dbg_dbg_b), 
		
		.rss2ics_perf_mondo_nacks (rss2ics_perf_mondo_nacks)  
 
                 
		
		);
		
 dmu_imu_ics ics(
		.clk			(clk),
		.rst_l			(rst_l),	
		.por_l			(por_l),	

		.mm2im_int		(mm2im_int),
		
		.y2k_int_l		(y2k_int_l),    	 // pec interrupt
		
		
		.rds2ics_msi_mal_error		(rds2ics_msi_mal_error),
		.rds2ics_msi_par_error		(rds2ics_msi_par_error),
		.rds2ics_pmeack_mes_not_en_error	(rds2ics_pmeack_mes_not_en_error),
		.rds2ics_pmpme_mes_not_en_error		(rds2ics_pmpme_mes_not_en_error),
		.rds2ics_fatal_mes_not_en_error		(rds2ics_fatal_mes_not_en_error),
		.rds2ics_nonfatal_mes_not_en_error	(rds2ics_nonfatal_mes_not_en_error),
		.rds2ics_cor_mes_not_en_error		(rds2ics_cor_mes_not_en_error),			
		.rds2ics_msi_not_en_error	(rds2ics_msi_not_en_error),
		.rds2ics_error_data		(rds2ics_error_data),

		.eqs2ics_eq_over_error		(eqs2ics_eq_over_error),
		.eqs2ics_error_data		(eqs2ics_error_data),
		
		.scs2ics_eq_not_en_error 	(scs2ics_eq_not_en_error),
		.scs2ics_error_data		(scs2ics_error_data),


		.ics2iss_mondo_62_int_l	(ics2iss_mondo_62_int_l),
		.ics2iss_mondo_63_int_l	(ics2iss_mondo_63_int_l),
		
		.im2tm_msi32_addr_reg	(im2tm_msi32_addr_reg),
		.im2tm_msi64_addr_reg	(im2tm_msi64_addr_reg),
		.im2rm_mem64_offset_reg	(im2rm_mem64_offset_reg),

				
		.csrbus_valid           (csrbus_valid),
        	.csrbus_done            (ics_done),
        	.csrbus_mapped          (ics_mapped),
        	.csrbus_wr_data         (csrbus_wr_data),
        	.csrbus_wr              (csrbus_wr),
        	.csrbus_read_data       (ics_read_data),
        	.csrbus_addr            (csrbus_addr),
		.csrbus_src_bus		(csrbus_src_bus),
		.csrbus_acc_vio		(ics_acc_vio),
		
		.j2d_instance_id	(j2d_instance_id),
		
		.ors2ics_perf_eq_mondos	(ors2ics_perf_eq_mondos),
		.ors2ics_perf_mondos	(ors2ics_perf_mondos),
		.ors2ics_perf_msi	(ors2ics_perf_msi),
		.ors2ics_perf_eq_wr	(ors2ics_perf_eq_wr),
		
		.rss2ics_perf_mondo_nacks (rss2ics_perf_mondo_nacks),  
		
		.dmu_dbg_err_event 	(dmu_dbg_err_event),
		.im2crm_bc_stall_en 	(im2crm_bc_stall_en),
		.im2crm_ilu_stall_en 	(im2crm_ilu_stall_en) 
		);

	
 dmu_imu_iss  iss(
		.clk			(clk),
		.rst_l			(rst_l),	
		
//		.j2d_ext_int_l		(j2d_ext_int_l), 
		
		.rds2iss_intx_int_l	(rds2iss_intx_int_l),
		
		.eqs2iss_eq_int_l	(eqs2iss_eq_int_l),
		
//		.j2d_i2c0_int_l		(j2d_i2c0_int_l), 
//		.j2d_i2c1_int_l		(j2d_i2c1_int_l),
		
		.ics2iss_mondo_62_int_l	(ics2iss_mondo_62_int_l),
		.ics2iss_mondo_63_int_l	(ics2iss_mondo_63_int_l),
		
//		.j2d_jbc_int_l		(j2d_jbc_int_l), 

		.iss2gcs_gc_0_mdo_needed(iss2gcs_gc_0_mdo_needed), 
		.iss2gcs_gc_1_mdo_needed(iss2gcs_gc_1_mdo_needed),
		.iss2gcs_gc_2_mdo_needed(iss2gcs_gc_2_mdo_needed),
		.iss2gcs_gc_3_mdo_needed(iss2gcs_gc_3_mdo_needed),		
		
		.gcs2iss_tid_req	(gcs2iss_tid_req),
		.gcs2iss_tid_sel	(gcs2iss_tid_sel),
		.gcs2iss_mdo_pending	(gcs2iss_mdo_pending), 
		.iss2gcs_tid_ack	(iss2gcs_tid_ack), 
		.iss2gcs_tid		(iss2gcs_tid), 	
		.iss2gcs_mondo_mode	(iss2gcs_mondo_mode),
		
		.iss2gcs_counter_limit 	(iss2gcs_counter_limit),
		
		.csrbus_valid           (csrbus_valid),
        	.csrbus_done            (iss_done),
        	.csrbus_mapped          (iss_mapped),
        	.csrbus_wr_data         (csrbus_wr_data),
        	.csrbus_wr              (csrbus_wr),
        	.csrbus_read_data       (iss_read_data),
        	.csrbus_addr            (csrbus_addr),
		.csrbus_src_bus		(csrbus_src_bus),
		.csrbus_acc_vio		(iss_acc_vio),
		
		.j2d_instance_id	(j2d_instance_id),
		
		.dbg2iss_dbg_sel_a 	(dbg2iss_dbg_sel_a),
        	.dbg2iss_dbg_sel_b 	(dbg2iss_dbg_sel_b),
        	.iss2dbg_dbg_a 	   	(iss2dbg_dbg_a),
        	.iss2dbg_dbg_b 	   	(iss2dbg_dbg_b)
		
		);	
	
 dmu_imu_gcs gcs(

		.clk			(clk),
		.rst_l			(rst_l),	
		
		.iss2gcs_gc_0_mdo_needed(iss2gcs_gc_0_mdo_needed), 
		.iss2gcs_gc_1_mdo_needed(iss2gcs_gc_1_mdo_needed),
		.iss2gcs_gc_2_mdo_needed(iss2gcs_gc_2_mdo_needed),
		.iss2gcs_gc_3_mdo_needed(iss2gcs_gc_3_mdo_needed),	

		.gcs2iss_tid_req	(gcs2iss_tid_req),
		.gcs2iss_tid_sel	(gcs2iss_tid_sel),
		.gcs2iss_mdo_pending	(gcs2iss_mdo_pending), 
		.iss2gcs_tid_ack	(iss2gcs_tid_ack), 
		.iss2gcs_tid		(iss2gcs_tid), 	
		.iss2gcs_mondo_mode	(iss2gcs_mondo_mode),
		
		.iss2gcs_counter_limit	(iss2gcs_counter_limit),

		.rss2gcs_rply		(rss2gcs_rply),
		.rss2gcs_id		(rss2gcs_id), 
		.rss2gcs_valid		(rss2gcs_valid), 

		.im2rm_mdo_enq		(im2rm_mdo_enq),
		.im2rm_mdo		(im2rm_mdo),
		
		
        	.dbg2gcs_dbg_sel_a 	(dbg2gcs_dbg_sel_a),
        	.dbg2gcs_dbg_sel_b 	(dbg2gcs_dbg_sel_b),
        	.gcs2dbg_dbg_a 	   	(gcs2dbg_dbg_a),
        	.gcs2dbg_dbg_b 	   	(gcs2dbg_dbg_b),
		
		.gcs2dbg_idle		(gcs2dbg_idle)
		
		);
		
		
dmu_imu_dms dms(

		.clk			(clk),
		.rst_l			(rst_l),
		
		// Inputs from RDS
		
		.rds2dms_data_sel	(rds2dms_data_sel),
		.rds2dms_data		(rds2dms_data),
		.rds2dms_d_ptr		(rds2dms_d_ptr),

		// Outputs to the DIU
		
		
		.im2di_wr		(im2di_wr),
		.im2di_addr		(im2di_addr),
		.im2di_data		(im2di_data),
		.im2di_dpar		(im2di_dpar),
		.im2di_bmask		(im2di_bmask)		

		
		);




dmu_imu_dbg dbg (

        	.clk 		   	(clk),
		.rst_l			(rst_l),
        	.cr2im_dbg_sel_a   	(cr2im_dbg_sel_a),
        	.cr2im_dbg_sel_b   	(cr2im_dbg_sel_b),
        	.im2cr_dbg_a 	   	(im2cr_dbg_a),
        	.im2cr_dbg_b 	   	(im2cr_dbg_b),
		
        	.dbg2eqs_dbg_sel_a 	(dbg2eqs_dbg_sel_a),
        	.dbg2eqs_dbg_sel_b 	(dbg2eqs_dbg_sel_b),
        	.eqs2dbg_dbg_a 	   	(eqs2dbg_dbg_a),
        	.eqs2dbg_dbg_b 	   	(eqs2dbg_dbg_b),
		
        	.dbg2gcs_dbg_sel_a 	(dbg2gcs_dbg_sel_a),
        	.dbg2gcs_dbg_sel_b 	(dbg2gcs_dbg_sel_b),
        	.gcs2dbg_dbg_a 	   	(gcs2dbg_dbg_a),
        	.gcs2dbg_dbg_b 	   	(gcs2dbg_dbg_b),
		
        	.dbg2irs_dbg_sel_a 	(dbg2irs_dbg_sel_a),
        	.dbg2irs_dbg_sel_b 	(dbg2irs_dbg_sel_b),
        	.irs2dbg_dbg_a 	   	(irs2dbg_dbg_a),
        	.irs2dbg_dbg_b 	   	(irs2dbg_dbg_b),
	
        	.dbg2iss_dbg_sel_a 	(dbg2iss_dbg_sel_a),
        	.dbg2iss_dbg_sel_b 	(dbg2iss_dbg_sel_b),
        	.iss2dbg_dbg_a 	   	(iss2dbg_dbg_a),
        	.iss2dbg_dbg_b 	   	(iss2dbg_dbg_b),
		
        	.dbg2ors_dbg_sel_a 	(dbg2ors_dbg_sel_a),
        	.dbg2ors_dbg_sel_b 	(dbg2ors_dbg_sel_b),
        	.ors2dbg_dbg_a 	   	(ors2dbg_dbg_a),
        	.ors2dbg_dbg_b 	   	(ors2dbg_dbg_b),
		
        	.dbg2rds_dbg_sel_a 	(dbg2rds_dbg_sel_a),
        	.dbg2rds_dbg_sel_b 	(dbg2rds_dbg_sel_b),
        	.rds2dbg_dbg_a 	   	(rds2dbg_dbg_a),
        	.rds2dbg_dbg_b 	   	(rds2dbg_dbg_b),
		
        	.rss2dbg_dbg_a 	   	(rss2dbg_dbg_a),
        	.rss2dbg_dbg_b 	   	(rss2dbg_dbg_b),
		
        	.dbg2scs_dbg_sel_a 	(dbg2scs_dbg_sel_a),
        	.dbg2scs_dbg_sel_b 	(dbg2scs_dbg_sel_b),
        	.scs2dbg_dbg_a 	   	(scs2dbg_dbg_a),
        	.scs2dbg_dbg_b 	   	(scs2dbg_dbg_b), 
		
		
		//Idle Checkers 
		
		.rds2dbg_idle		(rds2dbg_idle), 
		.ors2dbg_idle		(ors2dbg_idle), 
		.gcs2dbg_idle		(gcs2dbg_idle)
		
		);
				
endmodule 
