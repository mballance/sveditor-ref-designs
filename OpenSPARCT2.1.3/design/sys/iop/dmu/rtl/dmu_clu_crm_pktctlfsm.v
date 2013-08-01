// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_crm_pktctlfsm.v
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
module dmu_clu_crm_pktctlfsm 
  (
   // clock/reset
   clk,
   rst_l,
   
   // fsm inputs
   dcr_fifo_empty,
   pcr_fifo_empty,
   urr_fifo_empty,
   dcr_grnt,
   pcr_grnt,
   urr_grnt,
   cm2cl_rcd_full,
   done_psb_op,
   pcr_typ,
   mdo_vld,
   drd_vld,
   tdr_vld,
   dcr_clsts,
   
   // fsm outputs
   dcr_req,
   pcr_req,
   urr_req,
   dcr_deq,
   pcr_deq,
   urr_deq,
   grnt_lck,
   pkt_sel,
   epr_ld,
   cl2cm_rcd_enq,
   crm2ctm_tag_enq,
   crm2ctm_rcd_deq,
   start_psb_op,
   psb_op_typ,
   psb_ld,
   trn_sel,
   
   // debug port
   pktctlfsm_state,
   
   // idle checker port
   pktctlfsm_idle
   );
  
  // synopsys sync_set_reset "rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // State Number
  // --------------------------------------------------------
  
  parameter STATE_NUM = 12;
  
  // --------------------------------------------------------
  // State Declarations
  // --------------------------------------------------------
  
  parameter // summit enum cur_enum
	    IDLE          = 0,
	    DMA_RD        = 1,
	    DMA_RD_WAIT1  = 2,
	    MDO_CPL       = 3,
	    PIO_RD        = 4,
	    PIO_RD_WAIT1  = 5,
	    PIO_WR        = 6,
	    UNS_REQ       = 7,
	    UNS_REQ_WAIT1 = 8,
	    EPR_STALL     = 9,
	    MDO_ENQ_STALL = 10,
	    PWR_ENQ_STALL = 11;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // FSM Inputs
  // --------------------------------------------------------
  
  input dcr_fifo_empty;
  input pcr_fifo_empty;
  input urr_fifo_empty;
  input dcr_grnt;
  input pcr_grnt;
  input urr_grnt;
  input cm2cl_rcd_full;
  input done_psb_op;
  input pcr_typ;
  input mdo_vld;
  input drd_vld;
  input tdr_vld;
  input dcr_clsts;
  
  // --------------------------------------------------------
  // FSM Outputs
  // --------------------------------------------------------
  
  output dcr_req;
  output pcr_req;
  output urr_req;
  output dcr_deq;
  output pcr_deq;
  output urr_deq;
  output grnt_lck;
  output [1:0] pkt_sel;
  output epr_ld;
  output cl2cm_rcd_enq;
  output crm2ctm_tag_enq;
  output crm2ctm_rcd_deq;
  output start_psb_op;
  output [1:0] psb_op_typ;
  output psb_ld;
  output [1:0] trn_sel;
  
  // debug port
  output [3:0] pktctlfsm_state;
  
  // idle checker port
  output       pktctlfsm_idle;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  reg [(STATE_NUM - 1):0] cur_state;
  reg 			  cl2cm_rcd_enq;
  reg 			  crm2ctm_tag_enq;
  reg 			  crm2ctm_rcd_deq;
  
  // ********** Non-Flops ******
  
  reg [(STATE_NUM - 1):0] nxt_state;
  reg [3:0]               enc_state;
  reg [1:0] 		  pkt_sel;
  reg [1:0] 		  trn_sel;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  wire 			  drd_1stcl_vld;
  wire 			  proc_tdr;
  wire 			  proc_mdo;
  wire 			  proc_dma_1stcl;
  wire 			  proc_dma_clrmdr;
  wire 			  ld_dma;
  wire 			  proc_pwr;
  wire 			  proc_prd;
  wire 			  ld_prd;
  wire 			  proc_uns;
  wire 			  ld_urr;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // 0in one_hot -var cur_state
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << IDLE)
     -next (12'b1 << IDLE)
           (12'b1 << DMA_RD)
           (12'b1 << MDO_CPL)
           (12'b1 << PIO_RD)
           (12'b1 << PIO_WR)
           (12'b1 << UNS_REQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << DMA_RD)
     -next (12'b1 << DMA_RD_WAIT1)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << DMA_RD_WAIT1)
     -next (12'b1 << DMA_RD_WAIT1)
           (12'b1 << EPR_STALL)
           (12'b1 << MDO_ENQ_STALL)
           (12'b1 << PWR_ENQ_STALL)
           (12'b1 << IDLE)
           (12'b1 << DMA_RD)
           (12'b1 << PIO_RD)
           (12'b1 << UNS_REQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << MDO_CPL)
     -next (12'b1 << IDLE)
           (12'b1 << DMA_RD)
           (12'b1 << MDO_CPL)
           (12'b1 << PIO_RD)
           (12'b1 << PIO_WR)
           (12'b1 << UNS_REQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << PIO_RD)
     -next (12'b1 << PIO_RD_WAIT1)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << PIO_RD_WAIT1)
     -next (12'b1 << PIO_RD_WAIT1)
           (12'b1 << EPR_STALL)
           (12'b1 << MDO_ENQ_STALL)
           (12'b1 << PWR_ENQ_STALL)
           (12'b1 << IDLE)
           (12'b1 << DMA_RD)
           (12'b1 << PIO_RD)
           (12'b1 << UNS_REQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << PIO_WR)
     -next (12'b1 << IDLE)
           (12'b1 << DMA_RD)
           (12'b1 << MDO_CPL)
           (12'b1 << PIO_RD)
           (12'b1 << PIO_WR)
           (12'b1 << UNS_REQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << UNS_REQ)
     -next (12'b1 << UNS_REQ_WAIT1)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << UNS_REQ_WAIT1)
     -next (12'b1 << UNS_REQ_WAIT1)
           (12'b1 << EPR_STALL)
           (12'b1 << MDO_ENQ_STALL)
           (12'b1 << PWR_ENQ_STALL)
           (12'b1 << IDLE)
           (12'b1 << DMA_RD)
           (12'b1 << PIO_RD)
           (12'b1 << UNS_REQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << EPR_STALL)
     -next (12'b1 << EPR_STALL)
           (12'b1 << MDO_ENQ_STALL)
           (12'b1 << PWR_ENQ_STALL)
           (12'b1 << IDLE)
           (12'b1 << DMA_RD)
           (12'b1 << PIO_RD)
           (12'b1 << UNS_REQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << MDO_ENQ_STALL)
     -next (12'b1 << MDO_ENQ_STALL)
           (12'b1 << MDO_CPL)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (12'b1 << PWR_ENQ_STALL)
     -next (12'b1 << PWR_ENQ_STALL)
           (12'b1 << PIO_WR)
     -match_by_cycle
  */
  
  // 0in kndr -var cm2cl_rcd_full
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // IDLE Checker
  // --------------------------------------------------------
  
  assign pktctlfsm_idle = cur_state[IDLE];
  
  // --------------------------------------------------------
  // Debug Port Logic
  // --------------------------------------------------------
  
  // encode one-hot current_state vector for debug port
  always @(cur_state[(STATE_NUM - 1):1])
    begin
      enc_state[0] = (cur_state[1]  | cur_state[3]  | cur_state[5]  |
                      cur_state[7]  | cur_state[9]  | cur_state[11]);
      
      enc_state[1] = (cur_state[2]  | cur_state[3]  | cur_state[6]  |
                      cur_state[7]  | cur_state[10] | cur_state[11]);
      
      enc_state[2] = (cur_state[4]  | cur_state[5]  | cur_state[6]  |
                      cur_state[7]);
      
      enc_state[3] = (cur_state[8]  | cur_state[9]  | cur_state[10] |
                      cur_state[11]);
    end
  
  // output pktctlfsm debug bus
  assign pktctlfsm_state = enc_state;
  
  // --------------------------------------------------------
  // Control Decode
  // --------------------------------------------------------
  
  // dma rd cpl for 1st_cl
  assign drd_1stcl_vld = drd_vld & dcr_clsts;
  
  // --------------------------------------------------------
  // Arbiter Requests
  // --------------------------------------------------------
  
  // tdr and non-1stcl dma_cpl do not require arb (they are dropped)
  assign dcr_req = ~dcr_fifo_empty & (mdo_vld | drd_1stcl_vld);
  assign pcr_req = ~pcr_fifo_empty;
  assign urr_req = ~urr_fifo_empty;
  
  // --------------------------------------------------------
  // FSM Next State
  // --------------------------------------------------------
  
  // next state assignment
  always @(cur_state or cm2cl_rcd_full or dcr_grnt or pcr_grnt or urr_grnt or
	   drd_1stcl_vld or mdo_vld or pcr_typ or done_psb_op)
    begin
      
      // initialization
      nxt_state = {STATE_NUM{1'b0}};
      
      case (1'b1) // synopsys parallel_case
	
	// 0in < case -full
	
	///////////////////////////////////////////////////////////////////////
        
	// ---------- IDLE ------------------------------------------
	
	// IDLE State
	cur_state[IDLE] :
	  casez ({cm2cl_rcd_full, dcr_grnt, pcr_grnt, urr_grnt, drd_1stcl_vld,
		  mdo_vld, pcr_typ})
	    
	    // 0in < case -parallel -full
	    
	    7'b1_zzz_zzz,
	    7'b0_000_zzz,
	    7'b0_100_00z : nxt_state[IDLE]    = 1'b1;
	    7'b0_100_10z : nxt_state[DMA_RD]  = 1'b1;
	    7'b0_100_01z : nxt_state[MDO_CPL] = 1'b1;
	    7'b0_010_zz1 : nxt_state[PIO_RD]  = 1'b1;
	    7'b0_010_zz0 : nxt_state[PIO_WR]  = 1'b1;
	    7'b0_001_zzz : nxt_state[UNS_REQ] = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- DMA READ CPL ----------------------------------
	
	// DMA READ State
	cur_state[DMA_RD] :
	  nxt_state[DMA_RD_WAIT1] = 1'b1;
	
	// DMA READ WAIT1 State
	cur_state[DMA_RD_WAIT1] :
	  casez ({done_psb_op, cm2cl_rcd_full, dcr_grnt, pcr_grnt, urr_grnt,
		  drd_1stcl_vld, mdo_vld, pcr_typ})
	    
	    // 0in < case -parallel -full
	    
	    // MDO_CPL/PIO_WR must wait until DMA_RD enq cycle finishes
	    
	    8'b0_z_zzz_zzz : nxt_state[DMA_RD_WAIT1]  = 1'b1;
	    8'b1_1_zzz_zzz : nxt_state[EPR_STALL]     = 1'b1;
	    8'b1_0_100_01z : nxt_state[MDO_ENQ_STALL] = 1'b1;
	    8'b1_0_010_zz0 : nxt_state[PWR_ENQ_STALL] = 1'b1;
	    8'b1_0_000_zzz,
	    8'b1_0_100_00z : nxt_state[IDLE]          = 1'b1;
	    8'b1_0_100_10z : nxt_state[DMA_RD]        = 1'b1;
	    8'b1_0_010_zz1 : nxt_state[PIO_RD]        = 1'b1;
	    8'b1_0_001_zzz : nxt_state[UNS_REQ]       = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- MONDO CPL  ------------------------------------
	
	// MDO COMPLETION State
	cur_state[MDO_CPL] :
	  casez ({cm2cl_rcd_full, dcr_grnt, pcr_grnt, urr_grnt, drd_1stcl_vld,
		  mdo_vld, pcr_typ})
	    
	    // 0in < case -parallel -full
	    
	    7'b1_zzz_zzz,
	    7'b0_000_zzz,
	    7'b0_100_00z : nxt_state[IDLE]    = 1'b1;
	    7'b0_100_10z : nxt_state[DMA_RD]  = 1'b1;
	    7'b0_100_01z : nxt_state[MDO_CPL] = 1'b1;
	    7'b0_010_zz1 : nxt_state[PIO_RD]  = 1'b1;
	    7'b0_010_zz0 : nxt_state[PIO_WR]  = 1'b1;
	    7'b0_001_zzz : nxt_state[UNS_REQ] = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- PIO READ REQ ----------------------------------
	
	// PIO READ State
	cur_state[PIO_RD] :
	  nxt_state[PIO_RD_WAIT1] = 1'b1;
	
	// PIO READ WAIT1 State
	cur_state[PIO_RD_WAIT1] :
	  casez ({done_psb_op, cm2cl_rcd_full, dcr_grnt, pcr_grnt, urr_grnt,
		  drd_1stcl_vld, mdo_vld, pcr_typ})
	    
	    // 0in < case -parallel -full
	    
	    // MDO_CPL/PIO_WR must wait until PIO_RD enq cycle finishes
	    
	    8'b0_z_zzz_zzz : nxt_state[PIO_RD_WAIT1]  = 1'b1;
	    8'b1_1_zzz_zzz : nxt_state[EPR_STALL]     = 1'b1;
	    8'b1_0_100_01z : nxt_state[MDO_ENQ_STALL] = 1'b1;
	    8'b1_0_010_zz0 : nxt_state[PWR_ENQ_STALL] = 1'b1;
	    8'b1_0_000_zzz,
	    8'b1_0_100_00z : nxt_state[IDLE]          = 1'b1;
	    8'b1_0_100_10z : nxt_state[DMA_RD]        = 1'b1;
	    8'b1_0_010_zz1 : nxt_state[PIO_RD]        = 1'b1;
	    8'b1_0_001_zzz : nxt_state[UNS_REQ]       = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- PIO WR REQ ------------------------------------
	
	// PIO WRITE State
	cur_state[PIO_WR] :
	  casez ({cm2cl_rcd_full, dcr_grnt, pcr_grnt, urr_grnt, drd_1stcl_vld,
		  mdo_vld, pcr_typ})
	    
	    // 0in < case -parallel -full
	    
	    7'b1_zzz_zzz,
	    7'b0_000_zzz,
	    7'b0_100_00z : nxt_state[IDLE]    = 1'b1;
	    7'b0_100_10z : nxt_state[DMA_RD]  = 1'b1;
	    7'b0_100_01z : nxt_state[MDO_CPL] = 1'b1;
	    7'b0_010_zz1 : nxt_state[PIO_RD]  = 1'b1;
	    7'b0_010_zz0 : nxt_state[PIO_WR]  = 1'b1;
	    7'b0_001_zzz : nxt_state[UNS_REQ] = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- UNSUPPORTED REQ -------------------------------
	
	// UNS REQUEST State
	cur_state[UNS_REQ] :
	  nxt_state[UNS_REQ_WAIT1] = 1'b1;
	
	// UNS REQUEST WAIT1 State
	cur_state[UNS_REQ_WAIT1] :
	  casez ({done_psb_op, cm2cl_rcd_full, dcr_grnt, pcr_grnt, urr_grnt,
		  drd_1stcl_vld, mdo_vld, pcr_typ})
	    
	    // 0in < case -parallel -full
	    
	    // MDO_CPL/PIO_WR must wait until UNS_REQ enq cycle finishes
	    
	    8'b0_z_zzz_zzz : nxt_state[UNS_REQ_WAIT1] = 1'b1;
	    8'b1_1_zzz_zzz : nxt_state[EPR_STALL]     = 1'b1;
	    8'b1_0_100_01z : nxt_state[MDO_ENQ_STALL] = 1'b1;
	    8'b1_0_010_zz0 : nxt_state[PWR_ENQ_STALL] = 1'b1;
	    8'b1_0_000_zzz,
	    8'b1_0_100_00z : nxt_state[IDLE]          = 1'b1;
	    8'b1_0_100_10z : nxt_state[DMA_RD]        = 1'b1;
	    8'b1_0_010_zz1 : nxt_state[PIO_RD]        = 1'b1;
	    8'b1_0_001_zzz : nxt_state[UNS_REQ]       = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- EPR PIPE STALL --------------------------------
	
	// EPR_STALL State
	cur_state[EPR_STALL] :
	  casez ({cm2cl_rcd_full, dcr_grnt, pcr_grnt, urr_grnt, drd_1stcl_vld,
		  mdo_vld, pcr_typ})
	    
	    // 0in < case -parallel -full
	    
	    // MDO_CPL/PIO_WR must wait until dma/piord/uns enq cycle finishes
	    
	    7'b1_zzz_zzz : nxt_state[EPR_STALL]     = 1'b1;
	    7'b0_100_01z : nxt_state[MDO_ENQ_STALL] = 1'b1;
	    7'b0_010_zz0 : nxt_state[PWR_ENQ_STALL] = 1'b1;
	    7'b0_000_zzz,
	    7'b0_100_00z : nxt_state[IDLE]          = 1'b1;
	    7'b0_100_10z : nxt_state[DMA_RD]        = 1'b1;
	    7'b0_010_zz1 : nxt_state[PIO_RD]        = 1'b1;
	    7'b0_001_zzz : nxt_state[UNS_REQ]       = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- ENQ STALL -------------------------------------
	
	// MDO_ENQ_STALL State
	cur_state[MDO_ENQ_STALL] :
	  if (cm2cl_rcd_full)
	    nxt_state[MDO_ENQ_STALL] = 1'b1;
	  else
	    nxt_state[MDO_CPL]       = 1'b1;
	
	// PWR_ENQ_STALL State
	cur_state[PWR_ENQ_STALL] :
	  if (cm2cl_rcd_full)
	    nxt_state[PWR_ENQ_STALL] = 1'b1;
	  else
	    nxt_state[PIO_WR]        = 1'b1;
	
	///////////////////////////////////////////////////////////////////////
	
      endcase
    end
  
  // --------------------------------------------------------
  // FSM Current State
  // --------------------------------------------------------
  
  // summit state_vector cur_state enum cur_enum
  
  // current state assignment
  always @(posedge clk)
    if (~rst_l)
      begin
	cur_state <= {STATE_NUM{1'b0}};
	cur_state[IDLE] <= 1'b1;
      end
    else
      cur_state <= nxt_state;
  
  // --------------------------------------------------------
  // FSM Output Gen
  // --------------------------------------------------------
  
  // ##########################################################################
  
  // **************************************************************************
  // ***** DCR FIFO TRANSACTION PROCESSING ************************************
  // **************************************************************************
  
  // ----- process tablewalk data response -------------------
  
  // no common resource requirement for tdr; no arbiter dependency
  
  // deq dcr_fifo, drop cpl, return credit to CTM
  assign proc_tdr = ~dcr_fifo_empty & tdr_vld;
  
  // ----- process mondo completion --------------------------
  
  // deq dcr_fifo, ld epr_reg, enq epr_pkt to TCM, return credit to CTM
  assign proc_mdo = nxt_state[MDO_CPL]; // single-cyc type; deq for next
  
  // ----- process dma read completion -----------------------
  
  // enq epr_pkt to TCM
  assign proc_dma_1stcl = (cur_state[DMA_RD_WAIT1] &
			   ~(nxt_state[DMA_RD_WAIT1] | nxt_state[EPR_STALL]));
  
  // deq dcr_fifo, drop cpl, return credit to CTM
  assign proc_dma_clrmdr = ~dcr_fifo_empty & drd_vld & ~dcr_clsts;
  
  // deq dcr_fifo, ld epr_reg, return credit to CTM
  assign ld_dma = cur_state[DMA_RD];
  
  // **************************************************************************
  // ***** PCR FIFO TRANSACTION PROCESSING ************************************
  // **************************************************************************
  
  // ----- process pio write request -------------------------
  
  // deq pcr_fifo, ld epr_reg, enq epr_pkt to TCM
  assign proc_pwr = nxt_state[PIO_WR]; // single-cyc type; deq for next
  
  // ----- process pio read request --------------------------
  
  // enq epr_pkt to TCM
  assign proc_prd = (cur_state[PIO_RD_WAIT1] &
		     ~(nxt_state[PIO_RD_WAIT1] | nxt_state[EPR_STALL]));
  
  // deq dcr_fifo, ld epr_reg
  assign ld_prd = cur_state[PIO_RD]; // multi-cyc type; deq in pio_rd state
  
  // **************************************************************************
  // ***** URR FIFO TRANSACTION PROCESSING ************************************
  // **************************************************************************
  
  // ----- process unsupported request -----------------------
  
  // enq epr_pkt to TCM
  assign proc_uns = (cur_state[UNS_REQ_WAIT1] &
		     ~(nxt_state[UNS_REQ_WAIT1] | nxt_state[EPR_STALL]));
  
  // deq urr_fifo, ld epr_reg
  assign ld_urr = cur_state[UNS_REQ]; // multi-cyc type; deq in uns_req state
  
  // ##########################################################################
  
  // ----- generate fifo deqs --------------------------------
  
  // dcr fifo deq - tdr, mdo, dma
  assign dcr_deq = proc_tdr | proc_dma_clrmdr | proc_mdo | ld_dma;
  
  // pcr fifo deq - pio_wr, pio_rd
  assign pcr_deq = proc_pwr | ld_prd;
  
  // urr fifo deq - unsupp req
  assign urr_deq = ld_urr;
  
  // ----- epr_reg load --------------------------------------
  
  // generate epr_reg ld
  assign epr_ld = proc_mdo | ld_dma | pcr_deq | urr_deq;
  
  // generate epr_pkt select
  always @(proc_pwr or ld_prd or ld_urr)
    begin
      if (proc_pwr | ld_prd)
	pkt_sel = 2'b01; // pcr (pio_wr/pio_rd)
      else if (ld_urr)
	pkt_sel = 2'b10; // urr (unsupported)
      else
	pkt_sel = 2'b00; // dcr (dma/mdo)
    end
  
  // ----- psb_reg load --------------------------------------
  
  // psb trn select
  always @(nxt_state[PIO_RD] or nxt_state[UNS_REQ])
    if (nxt_state[PIO_RD])
      trn_sel = 2'b01;
    else if (nxt_state[UNS_REQ])
      trn_sel = 2'b10;
    else
      trn_sel = 2'b00;
  
  // psb wr_data/trn load enable
  assign psb_ld = nxt_state[DMA_RD] | nxt_state[PIO_RD] | nxt_state[UNS_REQ];
  
  // ----- crm control ---------------------------------------
  
  // init psb access operation (psbctlfsm init)
  assign start_psb_op = (nxt_state[DMA_RD] | nxt_state[PIO_RD] |
			 nxt_state[UNS_REQ]);
  
  // psb access type (01-piowr, 10-dmardclr)
  assign psb_op_typ = {(nxt_state[DMA_RD] | nxt_state[UNS_REQ]),
		       nxt_state[PIO_RD]};
  
  // arbiter lock to maintain state during psb ops and pipe stall
  assign grnt_lck = (nxt_state[DMA_RD_WAIT1]  | nxt_state[PIO_RD_WAIT1]  |
		     nxt_state[UNS_REQ_WAIT1] | nxt_state[EPR_STALL]     |
		     nxt_state[MDO_ENQ_STALL] | nxt_state[PWR_ENQ_STALL] |
		     cm2cl_rcd_full);
  
  // ----- interface control ---------------------------------
  
  // registered control outputs
  always @(posedge clk)
    if (~rst_l)
      begin
	cl2cm_rcd_enq   <= 1'b0;
	crm2ctm_tag_enq <= 1'b0;
	crm2ctm_rcd_deq <= 1'b0;
      end
    else
      begin
	
	// ----- gen epr pkt enq -----------
	if (proc_mdo | proc_dma_1stcl | proc_pwr | proc_prd | proc_uns |
	    (cur_state[EPR_STALL] & ~nxt_state[EPR_STALL]))
	  cl2cm_rcd_enq   <= 1'b1;
	else
	  cl2cm_rcd_enq   <= 1'b0;
	
	// ----- tag/credit return enq -----
	if (dcr_deq)
	  crm2ctm_tag_enq <= 1'b1;
	else
	  crm2ctm_tag_enq <= 1'b0;
	
	// ----- urr fifo deq --------------
	if (urr_deq)
	  crm2ctm_rcd_deq <= 1'b1;
	else
	  crm2ctm_rcd_deq <= 1'b0;
	
      end
  
endmodule // dmu_clu_crm_pktctlfsm
