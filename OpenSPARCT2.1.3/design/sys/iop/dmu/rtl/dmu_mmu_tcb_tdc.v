// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_tcb_tdc.v
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
module dmu_mmu_tcb_tdc 
  (
   clk,				// clock
    rst_l,			// reset
    rcb2tcb_err, 		// rcb error
    rcb2tcb_tag,		// rcb tag
    rcb2tcb_vld, 		// rcb valid
    tcc2tdc_cld,		// tdc cache load
    tcc2tdc_req,		// tdc request
    tcc2tdc_tag,		// tdc replacement tag
    tcb2tdb_wa,			// tdb write address
    tcb2tdb_we,			// tdb write enable
    tcb2tlb_dld,		// tlb data load
    tcb2tlb_ra,			// tlb read address
    tcb2tlb_ras,		// tlb read address select
    tdc2tcc_ack,		// tcc acknowledge
    tdc2tcc_err,		// tcc error
    tdc2tmc_dbg,		// tmc debug
    tdc2tmc_err			// tmc errors
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	CNT_TST0 = 3'b011,
		CNT_TST1 = 3'b110;


  parameter	IDLE = 2'b00,			// state machine states
		WAIT = 2'b01,
		DATA = 2'b10,
		DONE = 2'b11;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------

  input 				clk;
  input 				rst_l;

  input [`FIRE_DLC_MMU_RCB_ERR_BITS]	rcb2tcb_err;
  input [`FIRE_DLC_MMU_TAG_PTR_BITS]	rcb2tcb_tag;
  input 				rcb2tcb_vld;
  input 				tcc2tdc_cld;
  input 				tcc2tdc_req;
  input [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcc2tdc_tag;
  
  output [`FIRE_DLC_MMU_TDB_PTR_BITS]	tcb2tdb_wa;
  output				tcb2tdb_we;
  output				tcb2tlb_dld;
  output [`FILE_DLC_MMU_TTE_CNT_BITS]	tcb2tlb_ra;
  output				tcb2tlb_ras;
  output				tdc2tcc_ack;
  output				tdc2tcc_err;
  output [`FIRE_DBG_DATA_BITS]		tdc2tmc_dbg;
  output [`FIRE_DLC_MMU_TDC_ERR_BITS]	tdc2tmc_err;
  
// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	tcb2tdb_wa;
  wire [`FIRE_DBG_DATA_BITS]		tdc2tmc_dbg;
  wire [`FIRE_DLC_MMU_RCB_ERR_BITS]	tdr_err;

  reg					tcb2tdb_we;
  reg  [`FILE_DLC_MMU_TTE_CNT_BITS]	tcb2tlb_ra;
  reg					tcb2tlb_ras;
  reg					tdc2tcc_ack;
  reg  [`FIRE_DLC_MMU_TDC_ERR_BITS]	tdc2tmc_err;
  reg  [1:0]				state, nxt_state;
  reg  [`FILE_DLC_MMU_TTE_CNT_BITS]	cnt, nxt_cnt;
  reg  [`FIRE_DLC_MMU_TDC_ERR_BITS]	err, nxt_err;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in state_transition -var state -val IDLE -next WAIT
  // 0in state_transition -var state -val WAIT -next DATA DONE
  // 0in state_transition -var state -val DATA -next DONE IDLE
  // 0in state_transition -var state -val DONE -next IDLE

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// tlb data load
  wire	 tcb2tlb_dld = rcb2tcb_vld;

// tdb write address
  assign tcb2tdb_wa = { tcc2tdc_tag, cnt };

// tcc error
  wire	 tdc2tcc_err = |(err | tdr_err) & tdc2tcc_ack; 

// tag and tdr errors
  wire	 tag_err = rcb2tcb_vld & (tcc2tdc_tag != rcb2tcb_tag);
  assign tdr_err = rcb2tcb_vld ? rcb2tcb_err : 0;

// next state
  always @ (state or rcb2tcb_vld or tdr_err or tcc2tdc_cld or tcc2tdc_req or
	    cnt) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	case (tcc2tdc_req) // synopsys parallel_case
	  1'b0 : nxt_state = IDLE;	// idle
	  1'b1 : nxt_state = WAIT;	// request
	endcase
      end
      WAIT : begin
	case ({rcb2tcb_vld, tdr_err[0]}) // synopsys parallel_case
	  2'b00  : nxt_state = WAIT;	// wait for rcb vld
	  2'b01  : nxt_state = IDLE;	// cannot happen
	  2'b10  : nxt_state = DATA;	// rcb vld
	  2'b11  : nxt_state = DONE;	// error
	endcase
      end
      DATA : begin
	case (cnt) // synopsys parallel_case
	  3'b000  : nxt_state = rcb2tcb_vld ? DATA : DONE;
	  3'b001  : nxt_state = rcb2tcb_vld ? DATA : DONE;
	  3'b010  : nxt_state = rcb2tcb_vld ? DATA : DONE;
	  3'b011  : nxt_state = tcc2tdc_cld ? DATA : DONE;
	  3'b100  : nxt_state = DATA;
	  3'b101  : nxt_state = DATA;
	  3'b110  : nxt_state = DATA;
	  3'b111  : nxt_state = IDLE;
	endcase
      end
      DONE : begin
	nxt_state = IDLE;
      end
    endcase
  end

// state machine outputs
  always @ (state or tdr_err or tcc2tdc_cld or cnt or err or tag_err) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	tcb2tlb_ras = 0;
	tcb2tdb_we  = 0;
	tdc2tcc_ack = 0;
	tdc2tmc_err = err;
	nxt_cnt     = 0;
	nxt_err     = 0;
      end
      WAIT : begin
	tcb2tlb_ras = 0;
	tcb2tdb_we  = 0;
	tdc2tcc_ack = tdr_err[0];
	tdc2tmc_err = 0;
	nxt_cnt     = 0;
	nxt_err[0]  = err[0] | tag_err;
	nxt_err[1]  = err[1] | (|tdr_err[1:0]);
	nxt_err[2]  = err[2] | tdr_err[2];
      end
      DATA : begin
	tcb2tlb_ras = tcc2tdc_cld;
	tcb2tdb_we  = tcc2tdc_cld;
	tdc2tcc_ack = tcc2tdc_cld ? (cnt == CNT_TST1) : (cnt == CNT_TST0);
	tdc2tmc_err = 0;
	nxt_cnt     = cnt + 1;
	nxt_err     = err | tdr_err;
      end
      DONE : begin
	tcb2tlb_ras = 0;
	tcb2tdb_we  = 0;
	tdc2tcc_ack = 0;
	tdc2tmc_err = 0;
	nxt_cnt     = 0;
	nxt_err     = err;
      end
    endcase
  end
  
// tlb read address
  always @ (cnt) begin
    case (cnt) // synopsys parallel_case
      3'b000 : tcb2tlb_ra = 3'b110;
      3'b001 : tcb2tlb_ra = 3'b101;
      3'b010 : tcb2tlb_ra = 3'b100;
      3'b011 : tcb2tlb_ra = 3'b011;
      3'b100 : tcb2tlb_ra = 3'b100;
      3'b101 : tcb2tlb_ra = 3'b101;
      3'b110 : tcb2tlb_ra = 3'b110;
      3'b111 : tcb2tlb_ra = 3'b111;
    endcase
  end

// ----------------------------------------------------------------------------
// Debug
// ----------------------------------------------------------------------------
  assign tdc2tmc_dbg = {state, cnt, err};

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin
      cnt   <= 0;
      err   <= 0;
      state <= IDLE;
    end
    else begin
      cnt   <= nxt_cnt;
      err   <= nxt_err;
      state <= nxt_state;
    end
  end

endmodule // dmu_mmu_tcb_tdc

