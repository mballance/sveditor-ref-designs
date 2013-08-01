// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_crm_psbctlfsm.v
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
module dmu_clu_crm_psbctlfsm 
  (
   // clock/reset
   clk,
   rst_l,
   
   // fsm inputs
   start_psb_op,
   psb_op_typ,
   ps2cl_e_gnt,
   
   // fsm outputs
   done_psb_op,
   done_psb_rd,
   cl2ps_e_req,
   cl2ps_e_cmd_type,
   
   // debug port
   psbctlfsm_state,
   
   // idle checker port
   psbctlfsm_idle
   );
  
  // synopsys sync_set_reset "rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // State Number
  // --------------------------------------------------------
  
  parameter STATE_NUM = 5;
  
  // --------------------------------------------------------
  // State Declarations
  // --------------------------------------------------------
  
  parameter // summit enum cur_enum
	    IDLE              = 0,
	    DMA_PSBRDCLR      = 1,
	    DMA_PSBRDCLR_WAIT = 2,
	    PIO_PSBWR         = 3,
	    PIO_PSBWR_WAIT    = 4;
  
  // --------------------------------------------------------
  // PSB Interface
  // --------------------------------------------------------
  
  parameter PSB_PIO_WR    = 4'b1100,
	    PSB_DMA_RDCLR = 4'b0011;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // FSM Inputs
  // --------------------------------------------------------
  
  input start_psb_op;
  input [1:0] psb_op_typ;
  input ps2cl_e_gnt;
  
  // --------------------------------------------------------
  // FSM Outputs
  // --------------------------------------------------------
  
  output done_psb_op;
  output done_psb_rd;
  output cl2ps_e_req;
  output [(`FIRE_DLC_PSR_CMD_TYPE_WDTH - 1):0] cl2ps_e_cmd_type;
  
  // debug port
  output [4:0] 				       psbctlfsm_state;
  
  // idle checker port
  output 				       psbctlfsm_idle;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  reg [(STATE_NUM - 1):0] 		       cur_state;
  reg 					       cl2ps_e_req;
  reg [(`FIRE_DLC_PSR_CMD_TYPE_WDTH - 1):0]    cl2ps_e_cmd_type;
  
  // ********** Non-Flops ******
  
  reg [(STATE_NUM - 1):0] 		       nxt_state;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  /* 0in rack
     -req cl2ps_e_req
     -ack ps2cl_e_gnt
     -min 1
     -req_until_ack
     -new_req_after_ack
     -no_simultaneous_req_ack
  */
  
  // 0in one_hot -var cur_state
  
  /* 0in state
     -var  cur_state
     -val  (5'b1 << IDLE)
     -next (5'b1 << IDLE)
           (5'b1 << DMA_PSBRDCLR)
           (5'b1 << PIO_PSBWR)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (5'b1 << DMA_PSBRDCLR)
     -next (5'b1 << DMA_PSBRDCLR_WAIT)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (5'b1 << DMA_PSBRDCLR_WAIT)
     -next (5'b1 << DMA_PSBRDCLR_WAIT)
           (5'b1 << IDLE)
           (5'b1 << DMA_PSBRDCLR)
           (5'b1 << PIO_PSBWR)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (5'b1 << PIO_PSBWR)
     -next (5'b1 << PIO_PSBWR_WAIT)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (5'b1 << PIO_PSBWR_WAIT)
     -next (5'b1 << PIO_PSBWR_WAIT)
           (5'b1 << IDLE)
           (5'b1 << DMA_PSBRDCLR)
           (5'b1 << PIO_PSBWR)
     -match_by_cycle
  */
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // IDLE Checker
  // --------------------------------------------------------
  
  assign psbctlfsm_idle = cur_state[IDLE];
  
  // --------------------------------------------------------
  // Debug Port Logic
  // --------------------------------------------------------
  
  assign psbctlfsm_state = cur_state;
  
  // --------------------------------------------------------
  // FSM Next State
  // --------------------------------------------------------
  
  // next state assignment
  always @(cur_state or start_psb_op or psb_op_typ or ps2cl_e_gnt)
    begin
      
      // initialization
      nxt_state = {STATE_NUM{1'b0}};
      
      case (1'b1) // synopsys parallel_case
	
	// 0in < case -full
	
	///////////////////////////////////////////////////////////////////////
	
	// IDLE State
	cur_state[IDLE] :
	  casez ({start_psb_op, psb_op_typ})
	    
	    // 0in < case -parallel -full
	    
	    3'b0_zz : nxt_state[IDLE]         = 1'b1;
	    3'b1_10 : nxt_state[DMA_PSBRDCLR] = 1'b1;
	    3'b1_01 : nxt_state[PIO_PSBWR]    = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- DMA READ/CLEAR --------------------------------
	
	// PSB READ/CLEAR State
	cur_state[DMA_PSBRDCLR] :
	  nxt_state[DMA_PSBRDCLR_WAIT] = 1'b1;
	
	// PSB READ/CLEAR WAIT State
	cur_state[DMA_PSBRDCLR_WAIT] :
	  casez ({ps2cl_e_gnt, start_psb_op, psb_op_typ})
	    
	    // 0in < case -parallel -full
	    
	    4'b0_z_zz : nxt_state[DMA_PSBRDCLR_WAIT] = 1'b1;
	    4'b1_0_zz : nxt_state[IDLE]              = 1'b1;
	    4'b1_1_10 : nxt_state[DMA_PSBRDCLR]      = 1'b1;
	    4'b1_1_01 : nxt_state[PIO_PSBWR]         = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- PIO READ --------------------------------------
	
	// PSB WRITE State
	cur_state[PIO_PSBWR] :
	  nxt_state[PIO_PSBWR_WAIT] = 1'b1;
	
	// PSB WRITE WAIT State
	cur_state[PIO_PSBWR_WAIT] :
	  casez ({ps2cl_e_gnt, start_psb_op, psb_op_typ})
	    
	    // 0in < case -parallel -full
	    
	    4'b0_z_zz : nxt_state[PIO_PSBWR_WAIT] = 1'b1;
	    4'b1_0_zz : nxt_state[IDLE]           = 1'b1;
	    4'b1_1_10 : nxt_state[DMA_PSBRDCLR]   = 1'b1;
	    4'b1_1_01 : nxt_state[PIO_PSBWR]      = 1'b1;
	  endcase
	
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
  
  // ----- psb access status ---------------------------------
  
  // psb access op (rd/wr) done
  assign done_psb_op = (ps2cl_e_gnt & (cur_state[DMA_PSBRDCLR_WAIT] |
				       cur_state[PIO_PSBWR_WAIT]));
  
  // psb rd done
  assign done_psb_rd = ps2cl_e_gnt & cur_state[DMA_PSBRDCLR_WAIT];
  
  // ----- psb interface control -----------------------------
  
  // psb request
  always @(posedge clk)
    if (~rst_l)
      cl2ps_e_req <= 1'b0;
    else
      if (~nxt_state[IDLE])
	cl2ps_e_req <= 1'b1;
      else
	cl2ps_e_req <= 1'b0;
  
  // psb access command type
  always @(posedge clk)
    if (~rst_l) begin
      cl2ps_e_cmd_type <= `FIRE_DLC_PSR_CMD_TYPE_WDTH'b0;    	// reset
	end
    else if (nxt_state[PIO_PSBWR])
      cl2ps_e_cmd_type <= PSB_PIO_WR;    // pio : psb wr operation
    else if (nxt_state[DMA_PSBRDCLR])
      cl2ps_e_cmd_type <= PSB_DMA_RDCLR; // dma : psb rd/clr operation
  
endmodule // dmu_clu_crm_psbctlfsm
