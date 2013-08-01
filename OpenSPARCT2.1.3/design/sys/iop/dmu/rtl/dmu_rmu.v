// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu.v
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
module dmu_rmu (
		clk,
		rst_l,

		// Core Level Signals - RMU <-> JBC interface
		
		d2j_p_wrack_tag,
		d2j_p_wrack_vld,

		// Core Level Signals - RMU <-> ILU interface

		y2k_rel_rcd,
		y2k_rel_enq,
		
		// 	EPE Record
		k2y_rcd,
		k2y_rcd_enq,
		y2k_rcd_deq,


		// TMU Interface

		// 	DIM Record 
		tm2rm_rcd,
		tm2rm_rcd_enq,
		rm2tm_rcd_full,

		
		// IMU Interface	
		
		// 	Interrupt In Record
		rm2im_rcd,
		rm2im_rcd_enq, 
		
		// 	Interrupt Out Record
		im2rm_rcd,
		im2rm_rcd_enq, 
		
		// 	Mondo ReQuest Record
		im2rm_mdo,
		im2rm_mdo_enq,

		// 	Mondo Reply record
		rm2im_rply,
		rm2im_rply_enq,

		// 	PIO mem64 offset Reg
		im2rm_mem64_offset_reg,


		// TSB Interface

		rm2ts_i_cmd_type,
		rm2ts_i_wr_data,
		rm2ts_i_req,
		ts2rm_i_gnt,
		ts2rm_i_full,
		ts2rm_i_n_trn,
		
		rm2ts_e_cmd_type,
		rm2ts_e_wr_data,
		rm2ts_e_trn,
		rm2ts_e_req,
		ts2rm_e_gnt,
		ts2rm_e_rd_data,

		
		// MMU Interface

		//	SRM Record
		rm2mm_rcd,
		rm2mm_rcd_enq,
		mm2rm_rcd_full,


		// CMU Interface

		//	Retire Record
		cm2rm_rcd,
		cm2rm_rcd_enq,
		rm2cm_rcd_full,

		
		// CLU Interface	
		
		// 	DMA Rd Buffer Release Record	
		rm2cl_bufrel,
		rm2cl_bufrel_enq,


		// CRU Interface 

		//	Fire's Programmable Reqid (PIO), CompletionID (DMA)
		cr2rm_req_id,

		//	Debug Ports
		cr2rm_dbg_sel_a,
   		cr2rm_dbg_sel_b,
		
   		rm2cr_dbg_a,
   		rm2cr_dbg_b,

		rm2crm_npwr_wrack
		
		);
		
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 		clk;
  input			rst_l; 


  //------------------------------------------------------------------------
  //  JBC Interface 
  //------------------------------------------------------------------------

  // Copy of original JBC PIO request 4 bit tag - and corresponding valid signal 
  output  [`FIRE_D2J_P_WRACK_WDTH-1:0]	d2j_p_wrack_tag; 
  output				d2j_p_wrack_vld; 
 
  
  //------------------------------------------------------------------------
  //  ILU Interface
  //------------------------------------------------------------------------
 
  // 9 bit Downbound Release Rcd from EIL - (PIO Cpl and DMA Rd buffer release)
  input [`FIRE_DLC_DRR_REC_WDTH-1:0]	y2k_rel_rcd;
  input					y2k_rel_enq;
 
   // Egress pipeline interface - EPE (Egress PEC record) (RRM to ILU)
  output [`FIRE_DLC_EPE_REC_WDTH-1:0]	k2y_rcd;
  output 				k2y_rcd_enq;
  input					y2k_rcd_deq;


  //------------------------------------------------------------------------
  //  TMU Interface
  //------------------------------------------------------------------------

  // Ingress pipeline interface - DIM RECORD (DIM to LRM)
  input  [`FIRE_DLC_DIM_REC_WDTH-1:0]	tm2rm_rcd;
  input					tm2rm_rcd_enq;
  output				rm2tm_rcd_full;


  //------------------------------------------------------------------------
  //  CMU Interface
  //------------------------------------------------------------------------

  // Egress pipeline interface - RETIRE RECORD (TCM to RRM)
  input  [`FIRE_DLC_ERR_REC_WDTH-1:0]	cm2rm_rcd;
  input					cm2rm_rcd_enq;
  output				rm2cm_rcd_full;


  //------------------------------------------------------------------------
  //  IMU Interface
  //------------------------------------------------------------------------

  // INTERRUPT IN Record for IMU servicing (LRM to IMU)  
  output [`FIRE_DLC_IIN_REC_WDTH-1:0]	rm2im_rcd; 	
  output           			rm2im_rcd_enq; 
  
  // INTERRUPT OUT Record - record processed by IMU (IMU to LRM)
  input  [`FIRE_DLC_IOT_REC_WDTH-1:0] 	im2rm_rcd;
  input					im2rm_rcd_enq; 
  
  // Mondo ReQuest Record (IMU to LRM) 
  input	 [`FIRE_DLC_MQR_REC_WDTH-1:0]	im2rm_mdo;
  input					im2rm_mdo_enq; 

  // Mondo Reply Record (RRM to IMU)
  output [`FIRE_DLC_MRR_REC_WDTH-1:0]	rm2im_rply;
  output				rm2im_rply_enq;

  input	 [`FIRE_DLC_SCW_MEM64_WDTH-1:0] im2rm_mem64_offset_reg;	// 40 bit field

  
  //------------------------------------------------------------------------
  //  TSB Interfacs
  //------------------------------------------------------------------------

  // SRM <->  TSB interface (Ingress Pipeline)
  output [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0]	rm2ts_i_cmd_type;
  output [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]	rm2ts_i_wr_data;
  output 					rm2ts_i_req;

  input						ts2rm_i_gnt;
  input						ts2rm_i_full;
  input  [`FIRE_DLC_TSR_TRN_WDTH-1:0]		ts2rm_i_n_trn;

		
  // RRM <-> TSB interface (Egress Pipeline)
  
  output [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0]  	rm2ts_e_cmd_type;
  output [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]	rm2ts_e_wr_data;
  output [`FIRE_DLC_TSR_TRN_WDTH-1:0]		rm2ts_e_trn;
  output					rm2ts_e_req;

  input						ts2rm_e_gnt;
  input  [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0]	ts2rm_e_rd_data;


  //------------------------------------------------------------------------
  //  MMU Interface
  //------------------------------------------------------------------------

  // Ingress pipeline interface - SRM RECORD (SRM to MMU)

  output [`FIRE_DLC_SRM_WDTH-1:0]		rm2mm_rcd;
  output					rm2mm_rcd_enq;
  input						mm2rm_rcd_full;


  //------------------------------------------------------------------------
  //  CLU Interface
  //------------------------------------------------------------------------

  // DMA Rd Buffer Release Record - 5 bit DOU Buffer Release
  
  output [`FIRE_DLC_DOU_REL_WDTH-1:0]		rm2cl_bufrel;
  output					rm2cl_bufrel_enq;

  output					rm2crm_npwr_wrack;
		
  
  //------------------------------------------------------------------------
  //  CRU Interface - Block Debug Level Selects and Output Ports     
  //------------------------------------------------------------------------

  // FIRE's 16 bit Prog. ReqID (PIO)-CplID (DMA) - was 16'b0 prior to P1731
  input  [`FIRE_PCIE_REQ_ID_WDTH-1:0]		cr2rm_req_id;

  input  [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	      	cr2rm_dbg_sel_a;	// 6 bit select
  input  [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	      	cr2rm_dbg_sel_b;	// 6 bit select
  
  output [`FIRE_DEBUG_WDTH-1:0]	      		rm2cr_dbg_a;		// 8 bit debug port
  output [`FIRE_DEBUG_WDTH-1:0]			rm2cr_dbg_b;		// 8 bit debug port

 
//############################################################################
//				PARAMETERS
//############################################################################


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Internal Sub-Block Wires 
//**************************************************

  // 4 bit (non-posted) PIO Transaction Credit Record Release

  wire  [`FIRE_DLC_RMU_LRM_REL_WDTH-1:0]	lrm2rrm_cpl;
  wire						lrm2rrm_cpl_enq;

  // RRM Debug port wires
  wire  [2:0] 					dbg2rrm_dbg_sel_a;	// 3 bit select
  wire  [2:0] 					dbg2rrm_dbg_sel_b;	// 3 bit select
  wire  [`FIRE_DEBUG_WDTH-1:0]			rrm2dbg_dbg_a;		// 8 bit debug port
  wire  [`FIRE_DEBUG_WDTH-1:0]			rrm2dbg_dbg_b;		// 8 bit debug port


  // LRM Debug port wires
  wire  [2:0] 					dbg2lrm_dbg_sel_a;	// 3 bit select
  wire  [2:0] 					dbg2lrm_dbg_sel_b;	// 3 bit select
  wire  [`FIRE_DEBUG_WDTH-1:0]			lrm2dbg_dbg_a;		// 8 bit debug port
  wire  [`FIRE_DEBUG_WDTH-1:0]			lrm2dbg_dbg_b;		// 8 bit debug port

		
//**************************************************
// Registers that Are Not Flops 
//**************************************************

  
//**************************************************
// Registers that Are Flops 
//**************************************************
 

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
   

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   
		
	
//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   	
      
//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    		
		
		

 dmu_rmu_rrm  rrm(
		.clk			(clk),
		.rst_l			(rst_l),
		
		// Outputs to JBC Block - PIO credit release 
		.d2j_p_wrack_tag	(d2j_p_wrack_tag),
		.d2j_p_wrack_vld	(d2j_p_wrack_vld),

		// Inputs from ILU (EIL) Block - Release Record for PIO Cpl/DMA Rd
		.y2k_rel_rcd		(y2k_rel_rcd),
		.y2k_rel_enq		(y2k_rel_enq),

		// Outputs to ILU - EPE Record (Egress PEC Record) 
		.k2y_rcd		(k2y_rcd),
		.k2y_rcd_enq		(k2y_rcd_enq),

		// Input from ILU
		.y2k_rcd_deq		(y2k_rcd_deq),

  		// Outputs to IMU - Mondo Reply Record (RRM to IMU)
  		.rm2im_rply		(rm2im_rply),
  		.rm2im_rply_enq		(rm2im_rply_enq),

		// Input from IMU - Static CSR MEM64 Address Offset
		.im2rm_mem64_offset_reg	(im2rm_mem64_offset_reg),

		// Outputs to TSB - Egress Pipeline
		.rm2ts_e_cmd_type	(rm2ts_e_cmd_type),
		.rm2ts_e_wr_data	(rm2ts_e_wr_data),
		.rm2ts_e_trn		(rm2ts_e_trn),
		.rm2ts_e_req		(rm2ts_e_req),

		// Inputs from TSB
		.ts2rm_e_gnt		(ts2rm_e_gnt),
		.ts2rm_e_rd_data	(ts2rm_e_rd_data),

		// Inputs from CMU - Retire Record (TCM to RRM) 
		.cm2rm_rcd		(cm2rm_rcd),
		.cm2rm_rcd_enq		(cm2rm_rcd_enq),

		// Output to CMU
		.rm2cm_rcd_full		(rm2cm_rcd_full),

		// Outputs to CLU
  		.rm2cl_bufrel		(rm2cl_bufrel),
  		.rm2cl_bufrel_enq	(rm2cl_bufrel_enq),

		// Input from CRU - static REQID (PIO)/ Completion ID (DMA) for EPE rcd 
		.cr2rm_req_id		(cr2rm_req_id),

  		// Internal sub-block Inputs - PIO Transaction Credit Record
  		.lrm2rrm_cpl		(lrm2rrm_cpl),
		.lrm2rrm_cpl_enq	(lrm2rrm_cpl_enq),

		// RRM Debug Ports - Inputs (Selects)
		.dbg2rrm_dbg_sel_a	(dbg2rrm_dbg_sel_a),
		.dbg2rrm_dbg_sel_b	(dbg2rrm_dbg_sel_b),

		// RRM Debug Ports - Onputs
		.rrm2dbg_dbg_a		(rrm2dbg_dbg_a),
		.rrm2dbg_dbg_b		(rrm2dbg_dbg_b),

		// 
		.rm2crm_npwr_wrack	(rm2crm_npwr_wrack)
		);
		
	
 dmu_rmu_lrm lrm(
		.clk			(clk),
		.rst_l			(rst_l),
		
		// Inputs from TMU - DIM Record - Ingress Pipeline	
		.tm2rm_rcd		(tm2rm_rcd),
		.tm2rm_rcd_enq		(tm2rm_rcd_enq),

		// Output to TMU - DIM Record Queue Full
		.rm2tm_rcd_full		(rm2tm_rcd_full),

  		// Outputs to IMU - Interrupt In Record for IMU Servicing 
  		.rm2im_rcd		(rm2im_rcd), 	
		.rm2im_rcd_enq		(rm2im_rcd_enq), 
  
		// Inputs from IMU - Interrupt Out Record for Ingress Pipeline
  		.im2rm_rcd		(im2rm_rcd),
		.im2rm_rcd_enq		(im2rm_rcd_enq), 
  
  		// Inputs from IMU (cont) - Mondo ReQuest Record
  		.im2rm_mdo		(im2rm_mdo),
  		.im2rm_mdo_enq		(im2rm_mdo_enq), 

		// TSB Interface - Ingress Pipeline
		.rm2ts_i_cmd_type	(rm2ts_i_cmd_type),
		.rm2ts_i_wr_data	(rm2ts_i_wr_data),
		.rm2ts_i_req		(rm2ts_i_req),

		// Inputs from TSB
		.ts2rm_i_gnt		(ts2rm_i_gnt),
		.ts2rm_i_full		(ts2rm_i_full),
		.ts2rm_i_n_trn		(ts2rm_i_n_trn),

		// Outputs to MMU
		.rm2mm_rcd		(rm2mm_rcd),
		.rm2mm_rcd_enq		(rm2mm_rcd_enq),

		// Input from MMU
		.mm2rm_rcd_full		(mm2rm_rcd_full),

		// Internal sub-block Outputs to RMU - PIO WR Release
  		.lrm2rrm_cpl		(lrm2rrm_cpl),
		.lrm2rrm_cpl_enq	(lrm2rrm_cpl_enq),

		// LRM Debug Ports - Inputs (Selects)
		.dbg2lrm_dbg_sel_a	(dbg2lrm_dbg_sel_a),
		.dbg2lrm_dbg_sel_b	(dbg2lrm_dbg_sel_b),

		// LRM Debug Ports - Onputs
		.lrm2dbg_dbg_a		(lrm2dbg_dbg_a),
		.lrm2dbg_dbg_b		(lrm2dbg_dbg_b)

		);	


 dmu_rmu_dbg dbg(
	 	.clk			(clk),
	 	.rst_l			(rst_l),
		  
		// Block Level Selects and Output Ports     
		.cr2rm_dbg_sel_a	(cr2rm_dbg_sel_a),
   		.cr2rm_dbg_sel_b	(cr2rm_dbg_sel_b),
		
   		.rm2cr_dbg_a		(rm2cr_dbg_a),
   		.rm2cr_dbg_b		(rm2cr_dbg_b),
		
		// Sub Block Selects and Output Ports
	    	//    RRM sub block
		.dbg2rrm_dbg_sel_a	(dbg2rrm_dbg_sel_a),
		.dbg2rrm_dbg_sel_b	(dbg2rrm_dbg_sel_b),
		.rrm2dbg_dbg_a		(rrm2dbg_dbg_a),
		.rrm2dbg_dbg_b		(rrm2dbg_dbg_b),

		//    LRM sub block
		.dbg2lrm_dbg_sel_a	(dbg2lrm_dbg_sel_a),
		.dbg2lrm_dbg_sel_b	(dbg2lrm_dbg_sel_b),
		.lrm2dbg_dbg_a		(lrm2dbg_dbg_a),
		.lrm2dbg_dbg_b		(lrm2dbg_dbg_b)
		
		);


endmodule 
