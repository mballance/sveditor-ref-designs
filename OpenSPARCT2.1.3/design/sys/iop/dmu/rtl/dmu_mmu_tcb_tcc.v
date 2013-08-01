// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_tcb_tcc.v
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
module dmu_mmu_tcb_tcc 
  (
   clk,				// clock
   rst_l,			// reset
   crb2tcb_tag,			// crb replacement tag
   csr2tcb_cm,			// csr cache mode
   ptb2tcb_hit,			// ptb physical tag hit
   rcb2tcb_ack, 		// rcb acknowledge
   tdc2tcc_ack,			// tmc request
   tdc2tcc_err,			// tdc acknowledge
   tmc2tcc_req,			// tdc errors
   tcb2crb_req,			// crb request
   tcb2csr_tcm,			// csr tablewalk cache mode
   tcb2csr_tip,			// csr tablewalk in progress
   tcb2ptb_sel,			// ptb select
   tcb2ptb_vld,			// ptb valid
   tcb2ptb_wa,			// ptb write address
   tcb2ptb_we,			// ptb write enable
   tcb2rcb_req, 		// rcb request
   tcb2rcb_tag,			// rcb tag
   tcb2tdb_sel,			// tdb select
   tcb2tlb_tld,			// tlb tag load
   tcb2vtb_sel,			// vtb select
   tcb2vtb_vld,			// vtb valid
   tcb2vtb_wa,			// vtb write address
   tcb2vtb_we,			// vtb write enable
   tcc2tdc_cld,			// tdc cache load
   tcc2tdc_req,			// tdc request
   tcc2tdc_tag,			// tdc replacement tag
   tcc2tmc_ack,			// tmc acknowledge
   tcc2tmc_dbg,			// tmc debug
   tcc2tmc_vld			// tmc valid
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	IDLE = 3'b000,		// state machine states
		LOAD = 3'b001,
		RQST = 3'b010,
		WAIT = 3'b011,
		NVLD = 3'b100,
		RTRY = 3'b101,
		DONE = 3'b110,
		DERR = 3'b111;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input 				clk;
  input 				rst_l;

  input [`FIRE_DLC_MMU_TAG_PTR_BITS]	crb2tcb_tag;
  input [`FIRE_DLC_MMU_CSR_CM_BITS]	csr2tcb_cm;
  input 				ptb2tcb_hit;
  input 				rcb2tcb_ack;
  input 				tmc2tcc_req;
  input 				tdc2tcc_ack;
  input 				tdc2tcc_err;

  output				tcb2crb_req;
  output [`FIRE_DLC_MMU_CSR_CM_BITS]	tcb2csr_tcm;
  output				tcb2csr_tip;
  output				tcb2ptb_sel;
  output				tcb2ptb_vld;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2ptb_wa;
  output				tcb2ptb_we;
  output				tcb2rcb_req;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2rcb_tag;
  output				tcb2tdb_sel;
  output				tcb2tlb_tld;
  output				tcb2vtb_sel;
  output				tcb2vtb_vld;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2vtb_wa;
  output				tcb2vtb_we;
  output				tcc2tdc_cld;
  output				tcc2tdc_req;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcc2tdc_tag;
  output				tcc2tmc_ack;
  output [`FIRE_DBG_DATA_BITS]		tcc2tmc_dbg;
  output				tcc2tmc_vld;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DLC_MMU_CSR_CM_BITS]	tcb2csr_tcm;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2ptb_wa, tcb2vtb_wa;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2rcb_tag, tcc2tdc_tag;
  wire [`FIRE_DBG_DATA_BITS]		tcc2tmc_dbg;

  reg					tcb2crb_req;
  reg					tcc2tdc_req;
  reg					tcc2tmc_ack;
  reg					hit;
  reg					req, nxt_req;
  reg  [2:0]				state, nxt_state;
  reg  [`FIRE_DLC_MMU_TAG_PTR_BITS]	tag;
  reg					tag_ld,	tag_we;
  reg  [1:0]				tcm, nxt_tcm;
  reg					tip, vld, set_vld, clr_vld;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in state_transition -var state -val IDLE -next LOAD
  // 0in state_transition -var state -val LOAD -next RQST
  // 0in state_transition -var state -val RQST -next WAIT
  // 0in state_transition -var state -val WAIT -next NVLD RTRY DONE DERR
  // 0in state_transition -var state -val NVLD -next RTRY DERR
  // 0in state_transition -var state -val RTRY -next RQST
  // 0in state_transition -var state -val DONE -next IDLE
  // 0in state_transition -var state -val DERR -next IDLE

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
// valid hit
  wire 	 vld_hit = vld & ptb2tcb_hit;

// next state
  always @ (state or rcb2tcb_ack or tmc2tcc_req or
	    tdc2tcc_ack or tdc2tcc_err or req or vld_hit) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	case (tmc2tcc_req) // synopsys parallel_case
	  1'b0 : nxt_state = IDLE;	// idle
	  1'b1 : nxt_state = LOAD;	// request
	endcase
      end
      LOAD : begin			// load tags
	nxt_state = RQST;
      end
      RQST : begin
	case (req ^ rcb2tcb_ack) // synopsys parallel_case
	  1'b0 : nxt_state = WAIT;	// acked
	  1'b1 : nxt_state = RQST;	// wait for tcr ack
	endcase
      end
      WAIT : begin
	case ({tdc2tcc_ack, tdc2tcc_err, vld_hit}) // synopsys parallel_case
	  3'b000  : nxt_state = WAIT;	// wait for tdc ack
	  3'b001  : nxt_state = NVLD;	// tag hit, wait for tdc ack
	  3'b100  : nxt_state = DONE;	// done
	  3'b101  : nxt_state = RTRY;	// tag hit, retry
	  3'b110  : nxt_state = DERR;	// data error
	  3'b111  : nxt_state = DERR;	// data error
	  default : nxt_state = DERR;	// data error
	endcase
      end
      NVLD : begin
	case ({tdc2tcc_ack, tdc2tcc_err, vld_hit}) // synopsys parallel_case
	  3'b000  : nxt_state = NVLD;	// wait for tdc ack
	  3'b001  : nxt_state = NVLD;	// tag hit, wait for tdc ack
	  3'b100  : nxt_state = RTRY;	// done
	  3'b101  : nxt_state = RTRY;	// tag hit, retry
	  3'b110  : nxt_state = DERR;	// data error
	  3'b111  : nxt_state = DERR;	// data error
	  default : nxt_state = DERR;	// data error
	endcase
      end
      RTRY : begin			// retry request
	nxt_state = RQST;
      end
      DONE : begin
	nxt_state = IDLE;
      end
      DERR : begin
	nxt_state = IDLE;
      end
    endcase
  end

// state machine outputs
  always @ (state or csr2tcb_cm or rcb2tcb_ack or
	    hit or tcm or req or vld_hit) begin
    tcb2crb_req = 0;
    tcc2tdc_req = 0;
    tcc2tmc_ack = 0;
    nxt_req     = req;
    nxt_tcm     = tcm;
    clr_vld     = 0;
    set_vld     = 0;
    tag_ld      = 0;
    tag_we      = 0;
    tip         = 0;
    case (state) // synopsys parallel_case
      IDLE : begin
	nxt_tcm     = csr2tcb_cm;	// cache mode
	clr_vld     = vld_hit;		// clear valid on valid hit
      end
      LOAD : begin
	tcb2crb_req = &tcm;		// request replacement tag
	nxt_req     = ~req;		// tcr request
	clr_vld     = 1'b1;		// clear valid
	tag_ld      = 1'b1;		// load tags
	tip         = 1'b1;		// tablewalk in progress
      end
      RQST : begin
	tcb2crb_req = hit;		// reset replacement tag
	tcc2tdc_req = rcb2tcb_ack;	// tdc request
	set_vld     = 1'b1;		// set valid for crb reset
	tag_we      = &tcm;		// write tags to set valid
	tip         = 1'b1;		// tablewalk in progress
      end
      WAIT : begin
	tcb2crb_req = hit;		// reset replacement tag
	tag_we      = &tcm;		// write tags to set valid
	tip         = 1'b1;		// tablewalk in progress
      end
      NVLD : begin
	tcb2crb_req = hit;		// reset replacement tag
	tag_we      = &tcm;		// write tags to set valid
	tip         = 1'b1;		// tablewalk in progress
      end
      RTRY : begin
	tcb2crb_req = hit;		// reset replacement tag
	nxt_req     = ~req;		// retry tcr request
	tag_we      = &tcm;		// write tags to set valid
	tip         = 1'b1;		// tablewalk in progress
      end
      DONE : begin
	tcc2tmc_ack = 1'b1;		// tmc ack
	clr_vld     = vld_hit;		// clear valid on valid hit
	tag_we      = &tcm;		// write tags for real
	tip         = 1'b1;		// tablewalk in progress
      end
      DERR : begin
	tcc2tmc_ack = 1'b1;		// tmc ack
	clr_vld     = 1'b1;		// clear valid
	tag_we      = &tcm;		// write tags for real
	tip         = 1'b1;		// tablewalk in progress
      end

    endcase
  end

// next hit
  wire   nxt_hit = &tcm & vld_hit & ~tag_ld;

// next valid
  wire	 nxt_vld = (vld | set_vld) & ~clr_vld;

// tablewalk cache mode and in progress
  assign tcb2csr_tcm = tcm;
  wire   tcb2csr_tip = tip;

// ptb tag select, valid, write address and enable
  wire	 tcb2ptb_sel = |tcm;
  wire	 tcb2ptb_vld = nxt_vld;
  assign tcb2ptb_wa  = tag;
  wire	 tcb2ptb_we  = tag_we;

// rcb request and tag
  wire	 tcb2rcb_req = req;
  assign tcb2rcb_tag = tag;

// tdb tag select
  wire	 tcb2tdb_sel = |tcm;

// tlb tag load
  wire	 tcb2tlb_tld = tag_ld | ~rst_l;

// vtb tag select, valid, write address and enable
  wire	 tcb2vtb_sel = |tcm;
  wire	 tcb2vtb_vld = nxt_vld;
  assign tcb2vtb_wa  = tag;
  wire	 tcb2vtb_we  = tag_we;

// tdc cache load and tag
  wire	 tcc2tdc_cld = &tcm;
  assign tcc2tdc_tag = tag;

// tmc error and valid
  wire	 tcc2tmc_vld = vld;

// ----------------------------------------------------------------------------
// Debug
// ----------------------------------------------------------------------------
  assign tcc2tmc_dbg = {state, vld, tcm, req, hit};

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin
      hit   <= 0;
      req   <= 0;
      tcm   <= 0;
      vld   <= 0;
      state <= IDLE;
    end
    else begin
      hit   <= nxt_hit;
      req   <= nxt_req;
      tcm   <= nxt_tcm;
      vld   <= nxt_vld;
      state <= nxt_state;
    end
  end

  always @ (posedge clk) begin
    if (!rst_l) begin
      tag <= 0;
    end
    else if (tag_ld) begin
      tag <= crb2tcb_tag;
    end
  end

endmodule // dmu_mmu_tcb_tcc
