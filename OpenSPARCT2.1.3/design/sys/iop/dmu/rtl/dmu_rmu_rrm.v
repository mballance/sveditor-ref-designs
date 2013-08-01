// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu_rrm.v
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
module dmu_rmu_rrm (
			clk,
			rst_l,
		
			// Outputs to JBC Block - PIO credit release 
			d2j_p_wrack_tag,
			d2j_p_wrack_vld,

			// Inputs from ILU (EIL) Block - Release Record for PIO Cpl/DMA Rd
			y2k_rel_rcd,
			y2k_rel_enq,

			// Outputs to ILU - EPE Record (Egress PEC Record) 
			k2y_rcd,
			k2y_rcd_enq,

			// Input from ILU
			y2k_rcd_deq,

  			// Outputs to IMU - Mondo Reply Record (RRM to IMU)
  			rm2im_rply,
  			rm2im_rply_enq,

			// Input from IMU - Static CSR MEM64 Address Offset
  			im2rm_mem64_offset_reg,

			// Outputs to TSB - Egress Pipeline
			rm2ts_e_cmd_type,
			rm2ts_e_wr_data,
			rm2ts_e_trn,
			rm2ts_e_req,

			// Inputs from TSB
			ts2rm_e_gnt,
			ts2rm_e_rd_data,

			// Inputs from CMU - Retire Record (TCM to RRM) 
			cm2rm_rcd,
			cm2rm_rcd_enq,

			// Output to CMU
			rm2cm_rcd_full,

			// Outputs to CLU
  			rm2cl_bufrel,
  			rm2cl_bufrel_enq,

			// Input from CRU - static REQID (PIO)/ Completion ID (DMA) for EPE rcd 
			cr2rm_req_id,

  			// Internal sub-block Inputs - PIO Transaction Credit Record
  			lrm2rrm_cpl,
			lrm2rrm_cpl_enq,

			// RRM Debug Ports - Inputs (Selects)
			dbg2rrm_dbg_sel_a,
			dbg2rrm_dbg_sel_b,

			// RRM Debug Ports - Onputs
			rrm2dbg_dbg_a,
			rrm2dbg_dbg_b,

			// BP npwr wrack to crm
			rm2crm_npwr_wrack
		
			);
		
// synopsys sync_set_reset "rst_l"
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 				clk;
  input					rst_l; 


  //------------------------------------------------------------------------
  //  JBC Interface 
  //------------------------------------------------------------------------

  // Copy of original 4 bit JBC PIO request tag - and corresponding valid
  // signal PIO credit release mechanism
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
  //  IMU Interface
  //------------------------------------------------------------------------

  // Mondo Reply Record (RRM to IMU)
  output [`FIRE_DLC_MRR_REC_WDTH-1:0]	rm2im_rply;
  output				rm2im_rply_enq;

  input	 [`FIRE_DLC_SCW_MEM64_WDTH-1:0] im2rm_mem64_offset_reg;	// 40 bit field
  

  //------------------------------------------------------------------------
  //  TSB Interfacs
  //------------------------------------------------------------------------
		
  // RRM <-> TSB interface (Egress Pipeline)
  
  output [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0]  	rm2ts_e_cmd_type;	// 4 bits
  output [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]	rm2ts_e_wr_data;	// 48 bit
  output [`FIRE_DLC_TSR_TRN_WDTH-1:0]		rm2ts_e_trn;		// 5 bits
  output					rm2ts_e_req;

  input						ts2rm_e_gnt;
  input  [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0]	ts2rm_e_rd_data;	// 48 bits


  //------------------------------------------------------------------------
  //  CMU Interface
  //------------------------------------------------------------------------

  // Egress pipeline interface - Egress RETIRE RECORD (TCM to RRM)
  input  [`FIRE_DLC_ERR_REC_WDTH-1:0]		cm2rm_rcd;
  input						cm2rm_rcd_enq;
  output					rm2cm_rcd_full;


  //------------------------------------------------------------------------
  //  CLU Interface
  //------------------------------------------------------------------------

  // DMA Rd Buffer Release Record - 5 bit DOU Buffer Release
  
  output [`FIRE_DLC_DOU_REL_WDTH-1:0]		rm2cl_bufrel;
  output					rm2cl_bufrel_enq;
  
  //------------------------------------------------------------------------
  //  CRU Interface
  //------------------------------------------------------------------------

  // FIRE's 16 bit Prog. ReqID (PIO) CplID (DMA) - was 16'b0 prior to P1731
  input  [`FIRE_PCIE_REQ_ID_WDTH-1:0]		cr2rm_req_id;	


  //------------------------------------------------------------------------
  //  Sub-block Interface to LRM
  //------------------------------------------------------------------------
 
  //  4 bit (non-posted) PIO Transaction Credit Record
  input  [`FIRE_DLC_RMU_LRM_REL_WDTH-1:0]	lrm2rrm_cpl;
  input						lrm2rrm_cpl_enq;

  //------------------------------------------------------------------------
  //  Sub Block Level Selects and Output Ports
  //------------------------------------------------------------------------

  input  [2:0] 					dbg2rrm_dbg_sel_a;
  input  [2:0] 					dbg2rrm_dbg_sel_b;
  
  output [`FIRE_DEBUG_WDTH-1:0]			rrm2dbg_dbg_a;
  output [`FIRE_DEBUG_WDTH-1:0]			rrm2dbg_dbg_b;

  
  //------------------------------------------------------------------------
  //  npwr wrack to crm
  //------------------------------------------------------------------------
  output 					rm2crm_npwr_wrack;
  
//############################################################################
//				PARAMETERS
//############################################################################


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Internal Sub-Block Wires 
//**************************************************

  // single bit wires connecting EFSM and ETSBFSM modules
  wire						tsb_fsm_idle;	 // ETSB FSM is idle
  wire						ld_epe_rcd_tsb;	 // RRM record soriced from TSB
  wire						gen_tsb_access;	 // Generate TSB cycle
  wire						sr_err_last_pkt; // ERR Rcd last packet bit set
  
  // Internal wires pulled out for debug visibility or idle checks
  wire	[2:0]					ilu_credit_cnt;	// EPE credit - starts at 4
  wire	[2:0]					e_state;	// 3 bit Egress 1-hot FSM
  wire  [1:0]					type_decode;	// Egress transaction type decode
  wire	[12:0] 					wrb_bcnt;	// 13 bit DMA Rd remaining bcnt
  wire  [3:0]					e_tsb_state;	// 4 bit Egress TSB 1 hot FSM
  wire	[1:0]					rel_state;	// 2 bit REL rcd 1 hot FSM
  wire						sr_err_empty;	// ERR SR FIFO empty
  wire						i_pio_rel_empty;// non posted pio rel queue empty
  wire						e_pio_rel_empty;// posted (egress) pio rel queue empty
  wire						rmu_rrm_idle;	// RRM sub-block idle

		
//**************************************************
// Registers that Are Not Flops 
//**************************************************

  reg   [`FIRE_DEBUG_WDTH-1:0] 			next_dbg_a;	// 8 bit debug ports
  reg   [`FIRE_DEBUG_WDTH-1:0] 			next_dbg_b;	// 8 bit debup port

  
//**************************************************
// Registers that Are Flops 
//**************************************************
 
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_a;		// 8 bit debug reg 
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_b;		// 8 bit debug reg


//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
   

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   

 //-----------------------------------------------------
 //  Debug Ports  
 //-----------------------------------------------------  

  always @ (dbg2rrm_dbg_sel_a or sr_err_empty or cm2rm_rcd_enq or rm2cm_rcd_full or k2y_rcd_enq or 
	    y2k_rcd_deq or ilu_credit_cnt or e_state or rm2ts_e_trn or wrb_bcnt or
	    ts2rm_e_gnt or rm2ts_e_req or e_tsb_state or gen_tsb_access or ld_epe_rcd_tsb or
	    sr_err_last_pkt or tsb_fsm_idle or type_decode or d2j_p_wrack_tag or 
	    d2j_p_wrack_vld or rm2cl_bufrel_enq or y2k_rel_rcd or y2k_rel_enq or 
	    rel_state or lrm2rrm_cpl or lrm2rrm_cpl_enq or rmu_rrm_idle)
    begin
      case (dbg2rrm_dbg_sel_a) // synopsys infer_mux
        3'b000: next_dbg_a = {sr_err_empty, cm2rm_rcd_enq, rm2cm_rcd_full, k2y_rcd_enq, y2k_rcd_deq, ilu_credit_cnt[2:0]};
        3'b001: next_dbg_a = {e_state[2:0], rm2ts_e_trn[4:0]};
        3'b010: next_dbg_a = {rm2ts_e_req, wrb_bcnt[12:6]};
        3'b011: next_dbg_a = {rm2ts_e_req, ts2rm_e_gnt, wrb_bcnt[5:0]};
        3'b100: next_dbg_a = {e_tsb_state[3:0], gen_tsb_access, ld_epe_rcd_tsb, sr_err_last_pkt, tsb_fsm_idle};
        3'b101: next_dbg_a = {sr_err_empty, type_decode[1:0], d2j_p_wrack_tag[3:0], d2j_p_wrack_vld};
        3'b110: next_dbg_a = {rm2cl_bufrel_enq, y2k_rel_rcd[8], y2k_rel_rcd[4:0], y2k_rel_enq};
        3'b111: next_dbg_a = {rmu_rrm_idle, rel_state[1:0], lrm2rrm_cpl[3:0], lrm2rrm_cpl_enq};
      endcase
    end
  
    
  always @ (dbg2rrm_dbg_sel_b or sr_err_empty or cm2rm_rcd_enq or rm2cm_rcd_full or k2y_rcd_enq or 
	    y2k_rcd_deq or ilu_credit_cnt or e_state or rm2ts_e_trn or wrb_bcnt or
	    ts2rm_e_gnt or rm2ts_e_req or e_tsb_state or gen_tsb_access or ld_epe_rcd_tsb or
	    sr_err_last_pkt or tsb_fsm_idle or type_decode or d2j_p_wrack_tag or 
	    d2j_p_wrack_vld or rm2cl_bufrel_enq or y2k_rel_rcd or y2k_rel_enq or 
	    rel_state or lrm2rrm_cpl or lrm2rrm_cpl_enq or rmu_rrm_idle)
    begin
      case (dbg2rrm_dbg_sel_b) // synopsys infer_mux
        3'b000: next_dbg_b = {sr_err_empty, cm2rm_rcd_enq, rm2cm_rcd_full, k2y_rcd_enq, y2k_rcd_deq, ilu_credit_cnt[2:0]};
        3'b001: next_dbg_b = {e_state[2:0], rm2ts_e_trn[4:0]};
        3'b010: next_dbg_b = {rm2ts_e_req, wrb_bcnt[12:6]};
        3'b011: next_dbg_b = {rm2ts_e_req, ts2rm_e_gnt, wrb_bcnt[5:0]};
        3'b100: next_dbg_b = {e_tsb_state[3:0], gen_tsb_access, ld_epe_rcd_tsb, sr_err_last_pkt, tsb_fsm_idle};
        3'b101: next_dbg_b = {sr_err_empty, type_decode[1:0], d2j_p_wrack_tag[3:0], d2j_p_wrack_vld};
        3'b110: next_dbg_b = {rm2cl_bufrel_enq, y2k_rel_rcd[8], y2k_rel_rcd[4:0], y2k_rel_enq};
        3'b111: next_dbg_b = {rmu_rrm_idle, rel_state[1:0], lrm2rrm_cpl[3:0], lrm2rrm_cpl_enq};
      endcase
    end

  // RRM Debug Outputs
  assign rrm2dbg_dbg_a = dbg_a; 
  assign rrm2dbg_dbg_b = dbg_b; 

 
 //-----------------------------------------------------
 //  Idle Checker Logic
 //-----------------------------------------------------  

  assign rmu_rrm_idle = (sr_err_empty & i_pio_rel_empty & e_pio_rel_empty);
	

//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   	
// RRM debug registered outputs
  always @ (posedge clk)
	if(~rst_l) begin
	dbg_a <= {`FIRE_DEBUG_WDTH{1'b0}};
	dbg_b <= {`FIRE_DEBUG_WDTH{1'b0}};
	end
    else begin 
	dbg_a <= next_dbg_a;
	dbg_b <= next_dbg_b;
    end   

      
//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    		

dmu_rmu_rrm_efsm efsm(
				
			.clk				(clk),
			.rst_l				(rst_l),
		
			// Inputs from CMU - Retire Record (TCM to RRM) 
			.cm2rm_rcd			(cm2rm_rcd),
			.cm2rm_rcd_enq			(cm2rm_rcd_enq),

			// Output to CMU
			.rm2cm_rcd_full			(rm2cm_rcd_full),

			// Outputs to ILU - EPE Record
			.k2y_rcd			(k2y_rcd),
			.k2y_rcd_enq			(k2y_rcd_enq),

			// Input from ILU - EPE Revord Dequeue
			.y2k_rcd_deq			(y2k_rcd_deq),

			// Outputs to IMU - Mondo Reply Record (RRM to IMU)
  			.rm2im_rply			(rm2im_rply),
  			.rm2im_rply_enq			(rm2im_rply_enq),

			// Input from IMU - PIO mem64 offset register
			.im2rm_mem64_offset_reg		(im2rm_mem64_offset_reg),

			// Outputs to TSB
			.rm2ts_e_trn			(rm2ts_e_trn),
			.rm2ts_e_wr_data		(rm2ts_e_wr_data),
			
			// Inputs from TSB
			.ts2rm_e_rd_data		(ts2rm_e_rd_data),

			// Input from CRU
			.cr2rm_req_id			(cr2rm_req_id),

			// Outputs to Local ETSB module
			.gen_tsb_access			(gen_tsb_access),
			.sr_err_last_pkt		(sr_err_last_pkt),

			// Inputs from Local ETSB module
			.tsb_fsm_idle			(tsb_fsm_idle),
			.ld_epe_rcd_tsb 		(ld_epe_rcd_tsb),

			// Outputs for debug port visibility
    			.wrb_bcnt			(wrb_bcnt),
			.ilu_credit_cnt			(ilu_credit_cnt),
			.type_decode			(type_decode),
			.sr_err_empty			(sr_err_empty),
			.e_state			(e_state)
			);
					

dmu_rmu_rrm_etsbfsm etsbfsm(
				
			.clk				(clk),
			.rst_l				(rst_l),
		
			// Outputs to TSB - Egress Pipeline
			.rm2ts_e_cmd_type		(rm2ts_e_cmd_type),
			.rm2ts_e_req			(rm2ts_e_req),

			// Inputs from TSB
			.ts2rm_e_gnt			(ts2rm_e_gnt),
			
			// Outputs to EFSM module
			.tsb_fsm_idle			(tsb_fsm_idle),
			.ld_epe_rcd_tsb			(ld_epe_rcd_tsb),

			// Inputs from EFSM module
			.gen_tsb_access			(gen_tsb_access),
			.sr_err_last_pkt		(sr_err_last_pkt),

			// Outputs for debug port visibility
			.e_tsb_state			(e_tsb_state)
			);
			


dmu_rmu_rrm_erel erel(
			.clk				(clk),
			.rst_l				(rst_l),
		
			// Outputs to JBC Block - PIO credit release 
			.d2j_p_wrack_tag		(d2j_p_wrack_tag),
			.d2j_p_wrack_vld		(d2j_p_wrack_vld),

			// Inputs from ILU (EIL) Block - Release Record for PIO Cpl/DMA Rd
			.y2k_rel_rcd			(y2k_rel_rcd),
			.y2k_rel_enq			(y2k_rel_enq),

			// Outputs to CLU
  			.rm2cl_bufrel			(rm2cl_bufrel),
  			.rm2cl_bufrel_enq		(rm2cl_bufrel_enq),

  			// Internal sub-block Inputs - PIO Transaction Credit Record
  			.lrm2rrm_cpl			(lrm2rrm_cpl),
			.lrm2rrm_cpl_enq		(lrm2rrm_cpl_enq),

			// Output for IDLE checkers
			.i_pio_rel_empty		(i_pio_rel_empty),
			.e_pio_rel_empty		(e_pio_rel_empty),
		
			// Outputs for debug port visibility
			.rel_state			(rel_state),

			// 
			.rm2crm_npwr_wrack			(rm2crm_npwr_wrack)
			);
		
					
endmodule 
