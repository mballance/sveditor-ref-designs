// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu_lrm.v
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
module dmu_rmu_lrm (
			clk,
			rst_l,

			// Inputs from TMU - DIM Record - Ingress Pipeline	
			tm2rm_rcd,
			tm2rm_rcd_enq,

			// Output to TMU - DIM Record Queue Full
			rm2tm_rcd_full,

  			// Outputs to IMU - Interrupt In Record for IMU Servicing 
  			rm2im_rcd, 	
			rm2im_rcd_enq, 
  
			// Inputs from IMU - Interrupt Out Record for Ingress Pipeline
  			im2rm_rcd,
			im2rm_rcd_enq, 
  
  			// Inputs from IMU (cont) - Mondo ReQuest Record
  			im2rm_mdo,
  			im2rm_mdo_enq, 

			// TSB Interface  - Ingress Pipeline
			rm2ts_i_cmd_type,
			rm2ts_i_wr_data,
			rm2ts_i_req,

			ts2rm_i_gnt,
			ts2rm_i_full,
			ts2rm_i_n_trn,

			// MMU Interface
			rm2mm_rcd,
			rm2mm_rcd_enq,
			mm2rm_rcd_full,

  			// Output to RRM - PIO WR Release 
  			lrm2rrm_cpl, 
			lrm2rrm_cpl_enq,

			// LRM Debug Ports - Inputs (Selects)
			dbg2lrm_dbg_sel_a,
			dbg2lrm_dbg_sel_b,

			// LRM Debug Ports - Onputs
			lrm2dbg_dbg_a,
			lrm2dbg_dbg_b

		
		);
		
// synopsys sync_set_reset "rst_l"
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 		clk;
  input			rst_l; 


  //------------------------------------------------------------------------
  //  TMU Interface
  //------------------------------------------------------------------------

  // Ingress pipeline interface - DIM RECORD (DIM to LRM)
  input  [`FIRE_DLC_DIM_REC_WDTH-1:0]		tm2rm_rcd;
  input						tm2rm_rcd_enq;
  output					rm2tm_rcd_full;

 
  //------------------------------------------------------------------------
  //  IMU Interface
  //------------------------------------------------------------------------

  // INTERRUPT IN Record for IMU servicing (LRM to IMU)  
  output [`FIRE_DLC_IIN_REC_WDTH-1:0]		rm2im_rcd; 	
  output           				rm2im_rcd_enq; 
  
  // INTERRUPT OUT Record - record processed by IMU (IMU to LRM)
  input  [`FIRE_DLC_IOT_REC_WDTH-1:0] 		im2rm_rcd;
  input						im2rm_rcd_enq; 
  
  // Mondo ReQuest Record (IMU to LRM) 
  input	 [`FIRE_DLC_MQR_REC_WDTH-1:0]		im2rm_mdo;
  input						im2rm_mdo_enq; 


  //------------------------------------------------------------------------
  //  TSB Interface
  //------------------------------------------------------------------------

  // TSB interface (Ingress Pipeline)
  output [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0]	rm2ts_i_cmd_type;	// 4 bit TSB Command
  output [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]	rm2ts_i_wr_data;	// 48 bit Write Data
  output 					rm2ts_i_req;

  input						ts2rm_i_gnt;
  input						ts2rm_i_full;
  input  [`FIRE_DLC_TSR_TRN_WDTH-1:0]		ts2rm_i_n_trn;		// 5 bit TRN - Trans Scoreboard Tag


  //------------------------------------------------------------------------
  //  MMU Interface
  //------------------------------------------------------------------------

  // Ingress pipeline interface - 116 bit SRM RECORD (LRM to MMU)
  output [`FIRE_DLC_SRM_WDTH-1:0]		rm2mm_rcd;
  output					rm2mm_rcd_enq;
  input						mm2rm_rcd_full;


  //------------------------------------------------------------------------
  //  Sub-Block Interface to RRM
  //------------------------------------------------------------------------

  // PIO Transaction Credit Recorda - 4 bits
  output  [`FIRE_DLC_RMU_LRM_REL_WDTH-1:0]	lrm2rrm_cpl;
  output					lrm2rrm_cpl_enq;


  //------------------------------------------------------------------------
  //  Sub Block Level Selects and Output Ports
  //------------------------------------------------------------------------

  input  [2:0] 					dbg2lrm_dbg_sel_a;
  input  [2:0] 					dbg2lrm_dbg_sel_b;
  
  output [`FIRE_DEBUG_WDTH-1:0]			lrm2dbg_dbg_a;
  output [`FIRE_DEBUG_WDTH-1:0]			lrm2dbg_dbg_b;


//############################################################################
//				PARAMETERS
//############################################################################


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Internal Sub-Block Wires 
//**************************************************

  wire [`FIRE_DLC_RMU_LRM_WDTH-1:0]	std_rcd;	// 131 bit Standard Rcd - from ictl to itsb_fsm
  wire					std_rcd_enq;	// STD rcd Enqueue signal 
  wire					std_rcd_deq;	// STD Rcd Dequeue - credit manager signal

  wire [`FIRE_DLC_RMU_LRM_WDTH-1:0]	lrm_rcd;	// 131 bit LRM Rcd - from itsb_fsm to octl
  wire					lrm_rcd_enq;	// Enqueue signal from ictl to octl modules
  wire					lrm_rcd_deq;	// STD Rcd FIFO Dequeue - credit manager signal

  wire					iot_rcd_deq;	// LRM credit manager signal - balances IIN, IOT fifo's


  //------------------------------------------------------------------------
  //  Debug Port Wires
  //------------------------------------------------------------------------

  // From ictl module
  wire	[1:0]				fork_type;	// Ingress Trans Type Decoder
  wire					sr_dim_deq;	// Dequeue DIM record from SR FIFO	
  wire					sr_dim_empty;	// Output from DIM SR FIFO
  wire					iot_credit_ok;	// LRM has credit for IOT Rcds
  wire					ld_iin_mdo_reg;	// Load IIN rcd from Mondo FIFO
  wire					mdo_fifo_empty;	// Output from Mondo ReQuest FIFO
  wire					std_credit_ok;	// Std Rcd FIFO has room
	
  // From itsb_fsm module
  wire	[1:0]				trans_type;	// SR STD rcd trans type decoder 
  wire					sr_std_empty;	// STD SR fifo is empty 
  wire	[4:0]				itsb_state;	// Ingress TSB 1-hot FSM
  wire					lrm_credit_ok;	// LRM Rcd FIFO has room
  wire	[`FIRE_DLC_TSR_BYTECNT_WDTH:0]	dma_rd_bcnt;	// 13 bit bcnt calc [12:0] for dma_rd

  // From octl module
  wire					sr_lrm_empty;	// LRM Rcd FIFO empty signal
  wire					sr_iot_empty;	// LRM Rcd FIFO empty signal
  wire					ttag_match_iot;	// OK to forward IOT record to MMU
  wire					ttag_match_lrm; // OK to forward LRM record to MMU

  // Internal LRM Idle check
  wire					rmu_lrm_idle;	// LRM sub-block is idle
		

//**************************************************
// Registers that Are Not Flops 
//**************************************************
  
  reg   [`FIRE_DEBUG_WDTH-1:0] 		next_dbg_a;	// 8 bit debug ports
  reg   [`FIRE_DEBUG_WDTH-1:0] 		next_dbg_b;	// 8 bit debup port

  
//**************************************************
// Registers that Are Flops 
//**************************************************
   
  reg   [`FIRE_DEBUG_WDTH-1:0] 		dbg_a;		// 8 bit debug reg 
  reg   [`FIRE_DEBUG_WDTH-1:0] 		dbg_b;		// 8 bit debug reg


//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
   

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   
		
 //-----------------------------------------------------
 //  Debug Ports  
 //-----------------------------------------------------  

  always @ (dbg2lrm_dbg_sel_a or fork_type or rm2tm_rcd_full or tm2rm_rcd_enq or sr_dim_deq or 
	    sr_dim_empty or iot_credit_ok or rm2im_rcd_enq or ld_iin_mdo_reg or im2rm_mdo_enq or 
	    lrm2rrm_cpl_enq or mdo_fifo_empty or std_credit_ok or std_rcd_enq or std_rcd_deq or 
	    trans_type or sr_std_empty or itsb_state or lrm_rcd_enq or lrm_credit_ok or rm2ts_i_req or 
	    ts2rm_i_gnt or ts2rm_i_full or ts2rm_i_n_trn or dma_rd_bcnt or im2rm_rcd_enq or sr_lrm_empty or 
	    ttag_match_lrm or sr_iot_empty or ttag_match_iot or rm2mm_rcd_enq or mm2rm_rcd_full or
	    rmu_lrm_idle)

    begin
      case (dbg2lrm_dbg_sel_a) // synopsys infer_mux
        3'b000: next_dbg_a = {1'b0, fork_type[1:0], rm2tm_rcd_full, tm2rm_rcd_enq, sr_dim_deq, sr_dim_empty, rmu_lrm_idle};
        3'b001: next_dbg_a = {2'b0, iot_credit_ok, rm2im_rcd_enq, ld_iin_mdo_reg, im2rm_mdo_enq, lrm2rrm_cpl_enq, mdo_fifo_empty};
        3'b010: next_dbg_a = {2'b0, std_credit_ok, std_rcd_enq, std_rcd_deq, trans_type[1:0], sr_std_empty} ;
        3'b011: next_dbg_a = {1'b0, itsb_state[4:0], lrm_rcd_enq, lrm_credit_ok};
        3'b100: next_dbg_a = {rm2ts_i_req, ts2rm_i_gnt, ts2rm_i_full, ts2rm_i_n_trn[4:0]};
        3'b101: next_dbg_a = {rm2ts_i_req, dma_rd_bcnt[12:6]};
        3'b110: next_dbg_a = {rm2ts_i_req, ts2rm_i_gnt, dma_rd_bcnt[5:0]};
        3'b111: next_dbg_a = {lrm_rcd_enq, im2rm_rcd_enq, sr_lrm_empty, ttag_match_lrm, sr_iot_empty, ttag_match_iot, rm2mm_rcd_enq, mm2rm_rcd_full};
      endcase
    end

  always @ (dbg2lrm_dbg_sel_b or fork_type or rm2tm_rcd_full or tm2rm_rcd_enq or sr_dim_deq or 
	    sr_dim_empty or iot_credit_ok or rm2im_rcd_enq or ld_iin_mdo_reg or im2rm_mdo_enq or 
	    lrm2rrm_cpl_enq or mdo_fifo_empty or std_credit_ok or std_rcd_enq or std_rcd_deq or 
	    trans_type or sr_std_empty or itsb_state or lrm_rcd_enq or lrm_credit_ok or rm2ts_i_req or 
	    ts2rm_i_gnt or ts2rm_i_full or ts2rm_i_n_trn or dma_rd_bcnt or im2rm_rcd_enq or sr_lrm_empty or 
	    ttag_match_lrm or sr_iot_empty or ttag_match_iot or rm2mm_rcd_enq or mm2rm_rcd_full or
	    rmu_lrm_idle)
    begin
      case (dbg2lrm_dbg_sel_b) // synopsys infer_mux
        3'b000: next_dbg_b = {1'b0, fork_type[1:0], rm2tm_rcd_full, tm2rm_rcd_enq, sr_dim_deq, sr_dim_empty, rmu_lrm_idle};
        3'b001: next_dbg_b = {2'b0, iot_credit_ok, rm2im_rcd_enq, ld_iin_mdo_reg, im2rm_mdo_enq, lrm2rrm_cpl_enq, mdo_fifo_empty};
        3'b010: next_dbg_b = {2'b0, std_credit_ok, std_rcd_enq, std_rcd_deq, trans_type[1:0], sr_std_empty} ;
        3'b011: next_dbg_b = {1'b0, itsb_state[4:0], lrm_rcd_enq, lrm_credit_ok};
        3'b100: next_dbg_b = {rm2ts_i_req, ts2rm_i_gnt, ts2rm_i_full, ts2rm_i_n_trn[4:0]};
        3'b101: next_dbg_b = {rm2ts_i_req, dma_rd_bcnt[12:6]};
        3'b110: next_dbg_b = {rm2ts_i_req, ts2rm_i_gnt, dma_rd_bcnt[5:0]};
        3'b111: next_dbg_b = {lrm_rcd_enq, im2rm_rcd_enq, sr_lrm_empty, ttag_match_lrm, sr_iot_empty, ttag_match_iot, rm2mm_rcd_enq, mm2rm_rcd_full};
      endcase
    end

  
  // LRM Debug Outputs
  assign lrm2dbg_dbg_a = dbg_a; 
  assign lrm2dbg_dbg_b = dbg_b; 

	
 //-----------------------------------------------------
 //  IDLE Check  Logic
 //-----------------------------------------------------  

  assign rmu_lrm_idle = (sr_dim_empty & mdo_fifo_empty & sr_std_empty & sr_lrm_empty & sr_iot_empty) &
  			 (~|itsb_state[4:1] & itsb_state[0]);
  			

//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   

  // LRM debug registered outputs
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
		
dmu_rmu_lrm_ictl 	lrm_ictl(
				
				.clk			(clk),
				.rst_l			(rst_l),
		
				// TMU Interface (DIM) - DIM Record
				.tm2rm_rcd		(tm2rm_rcd),
				.tm2rm_rcd_enq		(tm2rm_rcd_enq),
				.rm2tm_rcd_full		(rm2tm_rcd_full),

				// Inputs from IMU - Mondo Request Record
  				.im2rm_mdo		(im2rm_mdo),
  				.im2rm_mdo_enq		(im2rm_mdo_enq),

				// Outputs to IMU - Interrupt In Record (RRM to IMU)
  				.rm2im_rcd		(rm2im_rcd),
  				.rm2im_rcd_enq		(rm2im_rcd_enq),

				// LRM Sub-block Interface to Ingress TSB FSM - STD rcd
  				.std_rcd		(std_rcd),	
  				.std_rcd_enq		(std_rcd_enq),
  				.std_rcd_deq		(std_rcd_deq),

				// Input from IMU - used to flow control IIN rcds
				.iot_rcd_deq		(iot_rcd_deq),

				// Output to RMU - PIO WR Release
				.lrm2rrm_cpl		(lrm2rrm_cpl),
				.lrm2rrm_cpl_enq	(lrm2rrm_cpl_enq),

				// Outputs (local) for Debug Visibility
				.fork_type		(fork_type),
				.sr_dim_deq		(sr_dim_deq),
				.sr_dim_empty		(sr_dim_empty),
				.iot_credit_ok		(iot_credit_ok),
				.ld_iin_mdo_reg		(ld_iin_mdo_reg),
    				.mdo_fifo_empty		(mdo_fifo_empty),
				.std_credit_ok		(std_credit_ok)


				);


dmu_rmu_lrm_itsb_fsm lrm_itsb_fsm(
				
				.clk			(clk),
				.rst_l			(rst_l),
				
				// TSB Interface  - Ingress Pipeline
				.rm2ts_i_cmd_type	(rm2ts_i_cmd_type),
				.rm2ts_i_wr_data	(rm2ts_i_wr_data),
				.rm2ts_i_req		(rm2ts_i_req),

				.ts2rm_i_gnt		(ts2rm_i_gnt),
				.ts2rm_i_n_trn		(ts2rm_i_n_trn),

				// Internal LRM Output Control Interface - lrm_octl - Outgoing LRM rcd
				.lrm_rcd		(lrm_rcd),
				.lrm_rcd_enq		(lrm_rcd_enq),
				.lrm_rcd_deq		(lrm_rcd_deq),	

  				// Internal LRM Input Control Interface - lrm_ictl - Incoming STD rcd
  				.std_rcd		(std_rcd), 
				.std_rcd_enq		(std_rcd_enq), 
				.std_rcd_deq		(std_rcd_deq),

				// Outputs (local) for Debug Visibility
				.trans_type		(trans_type),
				.sr_std_empty		(sr_std_empty),
				.itsb_state		(itsb_state),
				.lrm_credit_ok		(lrm_credit_ok),
				.dma_rd_bcnt		(dma_rd_bcnt)

    				);


dmu_rmu_lrm_octl 	lrm_octl(
				
				.clk			(clk),
				.rst_l			(rst_l),
	
				// MMU Interface
				.rm2mm_rcd		(rm2mm_rcd),
				.rm2mm_rcd_enq		(rm2mm_rcd_enq),
				.mm2rm_rcd_full		(mm2rm_rcd_full),

				// IMU interface - Interrupt Out Record (IOT)
  				.im2rm_rcd		(im2rm_rcd),
  				.im2rm_rcd_enq		(im2rm_rcd_enq),

				// Internal LRM Interface with lrm_itsb_fsm module
				.lrm_rcd		(lrm_rcd),
				.lrm_rcd_enq		(lrm_rcd_enq),
				.lrm_rcd_deq		(lrm_rcd_deq),	

				// Internal LRM Interface with lrm_ictl module
				.iot_rcd_deq		(iot_rcd_deq),

				// Outputs (local) for Debug Visibility
				.sr_lrm_empty		(sr_lrm_empty),
  				.sr_iot_empty		(sr_iot_empty),
  				.ttag_match_iot		(ttag_match_iot),
  				.ttag_match_lrm		(ttag_match_lrm)
				
				);
	

endmodule 
