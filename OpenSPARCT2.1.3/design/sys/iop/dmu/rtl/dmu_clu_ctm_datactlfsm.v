// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_ctm_datactlfsm.v
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
module dmu_clu_ctm_datactlfsm 
  (
   // clock/reset
   clk,
   rst_l,
   
   // fsm inputs
   icr_fifo_empty,
   icr_grnt,
   nxt_tag_avail,
   mwr_vld,
   eqwr_vld,
   mdo_vld,
   pio16_vld,
   pio64_vld,
   null_vld,
   mwr_err,
   eqwr_err,
   diu_dma_empty,
   diu_pio_empty,
   
   // fsm outputs
   diu_dma_bufmgmt_bsy,
   diu_eqw_bufmgmt_bsy,
   diu_typ_sel,
   inc_dma_blk_addr,
   inc_pio_blk_addr,
   inc_eqw_blk_addr,
   inc_mdo_blk_addr,
   ld_diu_addr,
   inc_diu_row_ptr,
   dpath_sel,
   ld_diu_data,
   
   // debug port
   datactlfsm_state,
   
   // idle checker port
   datactlfsm_idle
   );
  
  // synopsys sync_set_reset "rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // State Number
  // --------------------------------------------------------
  
  parameter STATE_NUM = 21;
  
  // --------------------------------------------------------
  // State Declarations
  // --------------------------------------------------------
  
  parameter // summit enum cur_enum
	    IDLE      = 0,
	    DMA_DATA1 = 1,
	    DMA_DATA2 = 2,
	    DMA_DATA3 = 3,
	    DMA_STALL = 4,
	    EQW_DATA1 = 5,
	    EQW_DATA2 = 6,
	    EQW_DATA3 = 7,
	    EQW_STALL = 8,
	    MDO_DATA1 = 9,
	    MDO_DATA2 = 10,
	    MDO_DATA3 = 11,
	    MDO_STALL = 12,
	    P16_DATA1 = 13,
	    P16_WAIT1 = 14,
	    P16_WAIT2 = 15,
	    P16_STALL = 16,
	    P64_DATA1 = 17,
	    P64_DATA2 = 18,
	    P64_DATA3 = 19,
	    P64_STALL = 20;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // FSM Inputs
  // --------------------------------------------------------
  
  input icr_fifo_empty;
  input icr_grnt;
  input nxt_tag_avail;
  input mwr_vld;
  input eqwr_vld;
  input mdo_vld;
  input pio16_vld;
  input pio64_vld;
  input null_vld;
  input mwr_err;
  input eqwr_err;
  input diu_dma_empty;
  input diu_pio_empty;
  
  // --------------------------------------------------------
  // FSM Outputs
  // --------------------------------------------------------
  
  output       diu_dma_bufmgmt_bsy;
  output       diu_eqw_bufmgmt_bsy;
  output [1:0] diu_typ_sel;
  output       inc_dma_blk_addr;
  output       inc_pio_blk_addr;
  output       inc_eqw_blk_addr;
  output       inc_mdo_blk_addr;
  output       ld_diu_addr;
  output       inc_diu_row_ptr;
  output       dpath_sel;
  output       ld_diu_data;
  
  // debug port
  output [4:0] datactlfsm_state;
  
  // idle checker port
  output       datactlfsm_idle;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  reg [(STATE_NUM - 1):0] cur_state;
  reg dpath_sel_s0;
  reg dpath_sel_s1;
  reg dpath_sel_s2;
  
  // ********** Non-Flops ******
  
  reg [(STATE_NUM - 1):0] nxt_state;
  reg [4:0] 		  enc_state;
  reg [1:0] 		  diu_typ_sel;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  wire 			  proc_mwr;
  wire 			  proc_p16;
  wire 			  proc_p64;
  wire 			  eqw_bufrel;
  wire 			  dmaw_bufrel;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // 0in one_hot -var cur_state
  
  ///// STATE TRANSITION CHECKER //////////////////////////////////////////////
  
  // ----- IDLE ---------------------------------------------------------------
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << IDLE)
     -next (21'b1 << IDLE)
           (21'b1 << DMA_DATA1)
           (21'b1 << EQW_DATA1)
           (21'b1 << MDO_DATA1)
           (21'b1 << P16_DATA1)
           (21'b1 << P64_DATA1)
     -match_by_cycle
  */
  
  // ----- DMA ----------------------------------------------------------------
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << DMA_DATA1)
     -next (21'b1 << DMA_DATA2)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << DMA_DATA2)
     -next (21'b1 << DMA_DATA3)
           (21'b1 << DMA_STALL)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << DMA_DATA3)
     -next (21'b1 << IDLE)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << DMA_STALL)
     -next (21'b1 << DMA_DATA3)
           (21'b1 << DMA_STALL)
     -match_by_cycle
  */
  
  // ----- EQW ----------------------------------------------------------------
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << EQW_DATA1)
     -next (21'b1 << EQW_DATA2)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << EQW_DATA2)
     -next (21'b1 << EQW_DATA3)
           (21'b1 << EQW_STALL)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << EQW_DATA3)
     -next (21'b1 << IDLE)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << EQW_STALL)
     -next (21'b1 << EQW_DATA3)
           (21'b1 << EQW_STALL)
     -match_by_cycle
  */
  
  // ----- MDO ----------------------------------------------------------------
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << MDO_DATA1)
     -next (21'b1 << MDO_DATA2)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << MDO_DATA2)
     -next (21'b1 << MDO_DATA3)
           (21'b1 << MDO_STALL)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << MDO_DATA3)
     -next (21'b1 << IDLE)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << MDO_STALL)
     -next (21'b1 << MDO_DATA3)
           (21'b1 << MDO_STALL)
     -match_by_cycle
  */
  
  // ----- P16 ----------------------------------------------------------------
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << P16_DATA1)
     -next (21'b1 << P16_WAIT1)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << P16_WAIT1)
     -next (21'b1 << P16_WAIT2)
           (21'b1 << P16_STALL)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << P16_WAIT2)
     -next (21'b1 << IDLE)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << P16_STALL)
     -next (21'b1 << P16_WAIT2)
           (21'b1 << P16_STALL)
     -match_by_cycle
  */
  
  // ----- P64 ----------------------------------------------------------------
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << P64_DATA1)
     -next (21'b1 << P64_DATA2)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << P64_DATA2)
     -next (21'b1 << P64_DATA3)
           (21'b1 << P64_STALL)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << P64_DATA3)
     -next (21'b1 << IDLE)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (21'b1 << P64_STALL)
     -next (21'b1 << P64_DATA3)
           (21'b1 << P64_STALL)
     -match_by_cycle
  */
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // IDLE Checker
  // --------------------------------------------------------
  
  assign datactlfsm_idle = cur_state[IDLE];
  
  // --------------------------------------------------------
  // Debug Port Logic
  // --------------------------------------------------------
  
  // encode one-hot current_state vector for debug port
  always @(cur_state[(STATE_NUM - 1):1])
    begin
      enc_state[0] = (cur_state[1]  | cur_state[3]  | cur_state[5]  |
                      cur_state[7]  | cur_state[9]  | cur_state[11] |
                      cur_state[13] | cur_state[15] | cur_state[17] |
		      cur_state[19]);
      
      enc_state[1] = (cur_state[2]  | cur_state[3]  | cur_state[6]  |
                      cur_state[7]  | cur_state[10] | cur_state[11] |
                      cur_state[14] | cur_state[15] | cur_state[18] |
		      cur_state[19]);
      
      enc_state[2] = (cur_state[4]  | cur_state[5]  | cur_state[6]  |
                      cur_state[7]  | cur_state[12] | cur_state[13] |
                      cur_state[14] | cur_state[15] | cur_state[20]);
      
      enc_state[3] = (cur_state[8]  | cur_state[9]  | cur_state[10] |
                      cur_state[11] | cur_state[12] | cur_state[13] |
                      cur_state[14] | cur_state[15]);
      
      enc_state[4] = (cur_state[16] | cur_state[17] | cur_state[18] |
                      cur_state[19] | cur_state[20]);
      
    end
  
  // output datactlfsm debug bus
  assign datactlfsm_state = enc_state;
  
  // --------------------------------------------------------
  // FSM Control Decode
  // --------------------------------------------------------
  
  assign proc_mwr = mwr_vld & ~diu_dma_empty;
  assign proc_p16 = pio16_vld & ~diu_pio_empty;
  assign proc_p64 = pio64_vld & ~diu_pio_empty;
  
  // --------------------------------------------------------
  // FSM Next State
  // --------------------------------------------------------
  
  // next state assignment
  always @(cur_state or icr_grnt or icr_fifo_empty or proc_p16 or proc_p64 or
	   proc_mwr or eqwr_vld or mdo_vld or nxt_tag_avail)
    begin
      
      // initialization
      nxt_state = {STATE_NUM{1'b0}};
      
      case (1'b1) // synopsys parallel_case
	
	// 0in < case -full
	
	///////////////////////////////////////////////////////////////////////
	
	// IDLE State
	cur_state[IDLE] :
	  casez ({icr_fifo_empty, proc_mwr, eqwr_vld, mdo_vld, proc_p16,
		  proc_p64})
	    
	    // 0in < case -parallel -full
	    
	    6'b1_zzzzz,
	    6'b0_00000 : nxt_state[IDLE]      = 1'b1;
	    6'b0_10000 : nxt_state[DMA_DATA1] = 1'b1;
	    6'b0_01000 : nxt_state[EQW_DATA1] = 1'b1;
	    6'b0_00100 : nxt_state[MDO_DATA1] = 1'b1;
	    6'b0_00010 : nxt_state[P16_DATA1] = 1'b1;
	    6'b0_00001 : nxt_state[P64_DATA1] = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- DMA WR ----------------------------------------
	
	// DMA_DATA1 State
	cur_state[DMA_DATA1] :
	  nxt_state[DMA_DATA2] = 1'b1;
	
	// DMA_DATA2 State
	cur_state[DMA_DATA2] :
	  casez ({icr_grnt, nxt_tag_avail})
	    
	    // 0in < case -parallel -full
	    
	    2'b0z,
	    2'b10 : nxt_state[DMA_STALL] = 1'b1;
	    2'b11 : nxt_state[DMA_DATA3] = 1'b1;
	  endcase
	
	// DMA_DATA3 State
	cur_state[DMA_DATA3] :
	  nxt_state[IDLE] = 1'b1;
	
	// DMA_STALL State
	cur_state[DMA_STALL] :
	  casez ({icr_grnt, nxt_tag_avail})
	    
	    // 0in < case -parallel -full
	    
	    2'b0z,
	    2'b10 : nxt_state[DMA_STALL] = 1'b1;
	    2'b11 : nxt_state[DMA_DATA3] = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- EQ WR -----------------------------------------
	
	// EQW_DATA1 State
	cur_state[EQW_DATA1] :
	  nxt_state[EQW_DATA2] = 1'b1;
	
	// EQW_DATA2 State
	cur_state[EQW_DATA2] :
	  casez ({icr_grnt, nxt_tag_avail})
	    
	    // 0in < case -parallel -full
	    
	    2'b0z,
	    2'b10 : nxt_state[EQW_STALL] = 1'b1;
	    2'b11 : nxt_state[EQW_DATA3] = 1'b1;
	  endcase
	
	// EQW_DATA3 State
	cur_state[EQW_DATA3] :
	  nxt_state[IDLE] = 1'b1;
	
	// EQW_STALL State
	cur_state[EQW_STALL] :
	  casez ({icr_grnt, nxt_tag_avail})
	    
	    // 0in < case -parallel -full
	    
	    2'b0z,
	    2'b10 : nxt_state[EQW_STALL] = 1'b1;
	    2'b11 : nxt_state[EQW_DATA3] = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- MDO -------------------------------------------
	
	// MDO_DATA1 State
	cur_state[MDO_DATA1] :
	  nxt_state[MDO_DATA2] = 1'b1;
	
	// MDO_DATA2 State
	cur_state[MDO_DATA2] :
	  casez ({icr_grnt, nxt_tag_avail})
	    
	    // 0in < case -parallel -full
	    
	    2'b0z,
	    2'b10 : nxt_state[MDO_STALL] = 1'b1;
	    2'b11 : nxt_state[MDO_DATA3] = 1'b1;
	  endcase
	
	// MDO_DATA3 State
	cur_state[MDO_DATA3] :
	  nxt_state[IDLE] = 1'b1;
	
	// MDO_STALL State
	cur_state[MDO_STALL] :
	  casez ({icr_grnt, nxt_tag_avail})
	    
	    // 0in < case -parallel -full
	    
	    2'b0z,
	    2'b10 : nxt_state[MDO_STALL] = 1'b1;
	    2'b11 : nxt_state[MDO_DATA3] = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- PIO 16 CPL ------------------------------------
	
	// P16_DATA1 State
	cur_state[P16_DATA1] :
	  nxt_state[P16_WAIT1] = 1'b1;
	
	// P16_WAIT1 State
	cur_state[P16_WAIT1] :
	  if (icr_grnt)
	    nxt_state[P16_WAIT2] = 1'b1;
	  else
	    nxt_state[P16_STALL] = 1'b1;
	
	// P16_WAIT2 State
	cur_state[P16_WAIT2] :
	  nxt_state[IDLE] = 1'b1;
	
	// P16_STALL State
	cur_state[P16_STALL] :
	  if (icr_grnt)
	    nxt_state[P16_WAIT2] = 1'b1;
	  else
	    nxt_state[P16_STALL] = 1'b1;
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- PIO 64 CPL ------------------------------------
	
	// P64_DATA1 State
	cur_state[P64_DATA1] :
	  nxt_state[P64_DATA2] = 1'b1;
	
	// P64_DATA2 State
	cur_state[P64_DATA2] :
	  if (icr_grnt)
	    nxt_state[P64_DATA3] = 1'b1;
	  else
	    nxt_state[P64_STALL] = 1'b1;
	
	// P64_DATA3 State
	cur_state[P64_DATA3] :
	  nxt_state[IDLE] = 1'b1;
	
	// P64_STALL State
	cur_state[P64_STALL] :
	  if (icr_grnt)
	    nxt_state[P64_DATA3] = 1'b1;
	  else
	    nxt_state[P64_STALL] = 1'b1;
	
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
	cur_state       <= {STATE_NUM{1'b0}};
	cur_state[IDLE] <= 1'b1;
      end
    else
      cur_state         <= nxt_state;
  
  // --------------------------------------------------------
  // FSM Output Generation
  // --------------------------------------------------------
  
  // ----- data path control --------------------------------------------------
  
  // generate data path select
  always @(posedge clk)
    if (~rst_l)
      begin
	dpath_sel_s0 <= 1'b0;
	dpath_sel_s1 <= 1'b0;
	dpath_sel_s2 <= 1'b0;
      end
//    else if (nxt_state[EQW_DATA3] | nxt_state[MDO_DATA3])	// BP n2 10-25-04, MDO is now 1 data beat
    else if (nxt_state[EQW_DATA3] )
      begin
	dpath_sel_s0 <= 1'b1;
	dpath_sel_s1 <= 1'b1;
	dpath_sel_s2 <= 1'b1;
      end
    else
      begin
	dpath_sel_s0 <= 1'b0;
	dpath_sel_s1 <= dpath_sel_s0;
	dpath_sel_s2 <= dpath_sel_s1;
      end
  
  // output data path select
  assign dpath_sel = dpath_sel_s2;
  
  // generate data pipe load
  assign ld_diu_data = ~(cur_state[MDO_STALL] | cur_state[EQW_STALL] |
			 cur_state[DMA_STALL] | cur_state[P64_STALL] |
			 cur_state[P16_STALL]);
  
  // ----- diu buffer management control --------------------------------------
  
  // block address segment select
  always @(nxt_state)
    begin
      if (nxt_state[DMA_DATA1])
	diu_typ_sel = 2'b00;
      else if (nxt_state[P16_DATA1] | nxt_state[P64_DATA1])
	diu_typ_sel = 2'b01;
      else if (nxt_state[EQW_DATA1])
	diu_typ_sel = 2'b10;
      else if (nxt_state[MDO_DATA1])
	diu_typ_sel = 2'b11;
      else
	diu_typ_sel = 2'b00;
    end
  
  // dma buffer busy
  assign diu_dma_bufmgmt_bsy = (nxt_state[DMA_DATA1] | cur_state[DMA_DATA1] |
				cur_state[DMA_DATA2] | cur_state[DMA_DATA3]);
  
  // eqw buffer busy
  assign diu_eqw_bufmgmt_bsy = nxt_state[EQW_DATA1];
  
  // buffer release for dmaw_err, eqw_err & null
  assign dmaw_bufrel = ~icr_fifo_empty & ~diu_dma_bufmgmt_bsy & mwr_err;
  assign eqw_bufrel  = (~icr_fifo_empty & ~diu_eqw_bufmgmt_bsy &
			(eqwr_err | null_vld));
  
  // buffer block address increment
  assign inc_dma_blk_addr = nxt_state[DMA_DATA3] | dmaw_bufrel;
  assign inc_eqw_blk_addr = nxt_state[EQW_DATA3] | eqw_bufrel;
  assign inc_mdo_blk_addr = nxt_state[MDO_DATA3];
  assign inc_pio_blk_addr = nxt_state[P16_WAIT2] | nxt_state[P64_DATA3];
  
  // buffer read address load
  assign ld_diu_addr = (nxt_state[DMA_DATA1] | nxt_state[EQW_DATA1] |
			nxt_state[MDO_DATA1] | nxt_state[P16_DATA1] |
			nxt_state[P64_DATA1]);
  
  // buffer row address increment
  assign inc_diu_row_ptr = (cur_state[DMA_DATA1] | cur_state[DMA_DATA3] |
			    cur_state[P64_DATA1] | cur_state[P64_DATA3] |
			    ((cur_state[DMA_DATA2] | cur_state[DMA_STALL]) &
			     nxt_state[DMA_DATA3]) |
			    ((cur_state[P64_DATA2] | cur_state[P64_STALL]) &
			     nxt_state[P64_DATA3]));
  
endmodule // dmu_clu_ctm_datactlfsm
