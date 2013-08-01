// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_ctm_cmdctlfsm.v
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
module dmu_clu_ctm_cmdctlfsm 
  (
   // clock/reset
   clk,
   rst_l,
   
   // fsm inputs
   mm2cl_tcr_req,
   icr_fifo_empty,
   nxt_tag_avail,
   mrd_vld,
   mwr_vld,
   eqwr_vld,
   mdo_vld,
   pio16_vld,
   pio64_vld,
   uns_vld,
   null_vld,
   mwr_err,
   eqwr_err,
   pio_err,
   diu_dma_bufmgmt_bsy,
   diu_eqw_bufmgmt_bsy,
   diu_dma_empty,
   diu_pio_empty,
   icr_clsts,
   dou_space_avail,
   uns_req_crdt_avail,
   ds2cl_stall,
   
   // fsm outputs
   d2j_cmd_vld,
   d2j_data_vld,
   cl2mm_tcr_ack,
   ctm2crm_rcd_enq,
   cmd_req_sel,
   icr_fifo_rd,
   nxt_tag_req,
   dma_dptr_req,
   proc_uns,
   icr_grnt,
   proc_pio_err,		// BP n2 4-28-05
   cl2di_rd_en,			// BP n2 5-12-05
   
   // debug port
   cmdctlfsm_state,
   
   // idle checker port
   cmdctlfsm_idle
   );
  
  // synopsys sync_set_reset "rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // State Number
  // --------------------------------------------------------
//BP n2 6-09-04  
//  parameter STATE_NUM = 10;
  parameter STATE_NUM = 13;
  
  // --------------------------------------------------------
  // State Declarations
  // --------------------------------------------------------
  
  parameter // summit enum cur_enum
	    IDLE          = 0,
	    REQ_4DB_WAIT1 = 1,
	    REQ_4DB_WAIT2 = 2,
	    REQ_4DB_ENQ   = 3,
	    CPL_4DB_WAIT1 = 4,
	    CPL_4DB_WAIT2 = 5,
	    CPL_4DB_ENQ   = 6,
	    CPL_1DB_WAIT1 = 7,
	    CPL_1DB_WAIT2 = 8,
	    CPL_1DB_ENQ   = 9,
	    REQ_1DB_WAIT1   = 10,
	    REQ_1DB_WAIT2   = 11,
	    REQ_1DB_ENQ   = 12;
//BP n2 6-09-04
  
  // --------------------------------------------------------
  // ICR-TCR ARBITER PARAMETERS
  // --------------------------------------------------------
  
  parameter N = 2;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input     clk;
  input     rst_l;
  
  // --------------------------------------------------------
  // FSM Inputs
  // --------------------------------------------------------
  
  input     mm2cl_tcr_req;
  input     icr_fifo_empty;
  input     nxt_tag_avail;
  input     mrd_vld;
  input     mwr_vld;
  input     eqwr_vld;
  input     mdo_vld;
  input     pio16_vld;
  input     pio64_vld;
  input     uns_vld;
  input     null_vld;
  input     mwr_err;
  input     eqwr_err;
  input     pio_err;
  input     diu_dma_bufmgmt_bsy;
  input     diu_eqw_bufmgmt_bsy;
  input     diu_dma_empty;
  input     diu_pio_empty;
  input     icr_clsts;
  input     dou_space_avail;
  input     uns_req_crdt_avail;
  input     ds2cl_stall;			// for N2 dmu quiescing
  
  // --------------------------------------------------------
  // FSM Outputs
  // --------------------------------------------------------
  
  // external
  output    d2j_cmd_vld;
  output    d2j_data_vld;
  output    cl2mm_tcr_ack;
  output    ctm2crm_rcd_enq;
  
  // internal
  output    cmd_req_sel;
  output    icr_fifo_rd;
  output    nxt_tag_req;
  output    dma_dptr_req;
  output    proc_uns;
  output    icr_grnt;
  output    proc_pio_err;	// BP n2 4-28-05, force 0 data on pio err cpl
  output    cl2di_rd_en;	// BP n2 5-12-05, rd enable to diu ram for power savings
  
  // debug port
  output [3:0] cmdctlfsm_state;
  
  // idle checker port
  output       cmdctlfsm_idle;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  reg [(STATE_NUM - 1):0] cur_state;
  reg 			  d2j_dvld_s0;
  reg 			  d2j_dvld_s1;
  reg 			  d2j_dvld_s2;
  reg 			  d2j_dvld_s3;
  reg 			  d2j_cmd_vld;
  reg 			  ctm2crm_rcd_enq;
  reg 			  cl2mm_tcr_ack;
  
  // ********** Non-Flops ******
  
  reg [(STATE_NUM - 1):0] nxt_state;
  reg [3:0] 		  enc_state;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  wire [(N-1):0] 	  higher_pri_reqs;
  wire [(N-1):0] 	  req;
  wire [(N-1):0] 	  grant;
  wire 			  icr_req;
  wire 			  tcr_req;
  wire 			  tcr_grnt;
  wire 			  proc_mwr;
  wire 			  proc_p16;
  wire 			  proc_p64;
  wire 			  proc_4db_req;
  wire 			  drop_rcd;
  wire 			  proc_pio_err;
  wire 			  proc_tcr;
  wire 			  proc_dma_rd;
  wire 			  proc_dma_rd_1stcl;
  wire 			  proc_dma_rd_clrmdr;
 
wire			proc_1db_req; 
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ----- ARBITER CHECKER ------------------------------------------
  
  /* 0in arb
     -req tcr_req icr_req
     -gnt tcr_grnt icr_grnt
     -priority
     -known_grant
  */
  
  // ----- STATE-MACHINE CHECKERS -----------------------------------
  
  // 0in one_hot -var cur_state
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << IDLE)
     -next (13'b1 << IDLE)
           (13'b1 << REQ_4DB_WAIT1)
           (13'b1 << CPL_4DB_WAIT1)
           (13'b1 << CPL_1DB_WAIT1)
           (13'b1 << REQ_1DB_WAIT1)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << REQ_4DB_WAIT1)
     -next (13'b1 << REQ_4DB_WAIT2)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << REQ_4DB_WAIT2)
     -next (13'b1 << REQ_4DB_WAIT2)
           (13'b1 << REQ_4DB_ENQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << REQ_4DB_ENQ)
     -next (13'b1 << IDLE)
     -match_by_cycle
  */
//BP n2 6-09-04  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << REQ_1DB_WAIT1)
     -next (13'b1 << REQ_1DB_WAIT2)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << REQ_1DB_WAIT2)
     -next (13'b1 << REQ_1DB_WAIT2)
           (13'b1 << REQ_1DB_ENQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << REQ_1DB_ENQ)
     -next (13'b1 << IDLE)
     -match_by_cycle
  */
//end BP n2 6-09-04
  /* 0in state
     -var  cur_state
     -val  (13'b1 << CPL_4DB_WAIT1)
     -next (13'b1 << CPL_4DB_WAIT2)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << CPL_4DB_WAIT2)
     -next (13'b1 << CPL_4DB_WAIT2)
           (13'b1 << CPL_4DB_ENQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << CPL_4DB_ENQ)
     -next (13'b1 << IDLE)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << CPL_1DB_WAIT1)
     -next (13'b1 << CPL_1DB_WAIT2)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << CPL_1DB_WAIT2)
     -next (13'b1 << CPL_1DB_WAIT2)
           (13'b1 << CPL_1DB_ENQ)
     -match_by_cycle
  */
  
  /* 0in state
     -var  cur_state
     -val  (13'b1 << CPL_1DB_ENQ)
     -next (13'b1 << IDLE)
     -match_by_cycle
  */
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // IDLE Checker
  // --------------------------------------------------------
  
  assign cmdctlfsm_idle = (cur_state[IDLE] & ~d2j_data_vld &
			   (mm2cl_tcr_req ~^ cl2mm_tcr_ack));
  
  // --------------------------------------------------------
  // Debug Port Logic
  // --------------------------------------------------------
  
  // encode one-hot current_state vector for debug port
  always @(cur_state[(STATE_NUM - 1):1])
    begin
      enc_state[0] = (cur_state[1]  | cur_state[3]  | cur_state[5]  |
                      cur_state[7]  | cur_state[9]);
      
      enc_state[1] = (cur_state[2]  | cur_state[3]  | cur_state[6]  |
                      cur_state[7]);
      
      enc_state[2] = (cur_state[4]  | cur_state[5]  | cur_state[6]  |
                      cur_state[7]);
      
      enc_state[3] = (cur_state[8]  | cur_state[9]  | cur_state[10] |
		cur_state[11] | cur_state[12]);
    end
  
  // output cmdctlfsm debug bus
  assign cmdctlfsm_state = enc_state;
  
  // --------------------------------------------------------
  // ICR-TCR Priority Arbiter
  // --------------------------------------------------------
 //BP n2 10-06-04
wire cur_state_no_grnt;
reg	proc_pio_err_d;
//        assign cur_state_no_grnt = ( d2j_dvld_s3 & ~d2j_dvld_s2); 
//BP n2 4-27-05 added in pio err because sio expects data for all pio cpl's
        assign cur_state_no_grnt = ( d2j_dvld_s3 & ~d2j_dvld_s2) | (proc_pio_err_d); 
  // arb req generation
// BP 2-14-05 for N2 dbg quiescing, added ds2cl_stall
  assign icr_req = (~icr_fifo_empty && ~ds2cl_stall) && ~cur_state_no_grnt;
  assign tcr_req = (mm2cl_tcr_req ^ cl2mm_tcr_ack) & nxt_tag_avail & ~ds2cl_stall;
//  assign icr_req = ~icr_fifo_empty && ~cur_state_no_grnt;
//  assign tcr_req = (mm2cl_tcr_req ^ cl2mm_tcr_ack) & nxt_tag_avail;
  
  // arb req assignment
  assign req = {icr_req, tcr_req};
  
  // simple priority arbiter
  assign higher_pri_reqs[N-1:1] = higher_pri_reqs[N-2:0] | req[N-2:0];
  assign higher_pri_reqs[0] = 1'b0;
  assign grant[N-1:0] = req[N-1:0] & ~higher_pri_reqs[N-1:0];
  
  // arb grant assignment
  assign {icr_grnt, tcr_grnt} = grant;
  
  // --------------------------------------------------------
  // FSM Control Decode
  // --------------------------------------------------------
  
  assign proc_mwr = mwr_vld & ~diu_dma_empty;
  assign proc_p16 = pio16_vld & ~diu_pio_empty;
  assign proc_p64 = pio64_vld & ~diu_pio_empty;
//BP n2 6-08-04
//  assign proc_4db_req = proc_mwr | eqwr_vld | mdo_vld;
  assign proc_4db_req = proc_mwr | eqwr_vld ;
  assign proc_1db_req = mdo_vld ;
  
  // --------------------------------------------------------
  // FSM Next State
  // --------------------------------------------------------
  
  // next state assignment
  always @(cur_state or icr_grnt or icr_fifo_empty or proc_p16 or proc_p64 or
	   proc_4db_req or nxt_tag_avail or proc_1db_req)
    begin
      
      // initialization
      nxt_state = {STATE_NUM{1'b0}};
      
      case (1'b1) // synopsys parallel_case
	
	// 0in < case -full
	
	///////////////////////////////////////////////////////////////////////
	
	// IDLE State
	cur_state[IDLE] :
	  casez ({icr_fifo_empty, proc_p16, proc_p64, proc_4db_req,proc_1db_req})
	    
	    // 0in < case -parallel -full
	    
	    5'b1_zzzz,
	    5'b0_0000 : nxt_state[IDLE]          = 1'b1;
	    5'b0_0010 : nxt_state[REQ_4DB_WAIT1] = 1'b1;
	    5'b0_0100 : nxt_state[CPL_4DB_WAIT1] = 1'b1;
	    5'b0_1000 : nxt_state[CPL_1DB_WAIT1] = 1'b1;
	    5'b0_0001 : nxt_state[REQ_1DB_WAIT1] = 1'b1;
	  endcase
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- 4 Data-Beat Request ---------------------------
	
	// REQ_4DB Wait-1 State
	cur_state[REQ_4DB_WAIT1] :
	  nxt_state[REQ_4DB_WAIT2] = 1'b1;
	
	// REQ_4DB Wait-2 State
	cur_state[REQ_4DB_WAIT2] :
	  casez ({icr_grnt, nxt_tag_avail})
	    
	    // 0in < case -parallel -full
	    
	    2'b0z,
	    2'b10 : nxt_state[REQ_4DB_WAIT2] = 1'b1;
	    2'b11 : nxt_state[REQ_4DB_ENQ]   = 1'b1;
	  endcase
	
	// REQ_4DB Enq State
	cur_state[REQ_4DB_ENQ]   :
	  nxt_state[IDLE] = 1'b1;
	
	///////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////
	
	// ---------- 1 Data-Beat Request ---------------------------
	
	// REQ_1DB Wait-1 State
	cur_state[REQ_1DB_WAIT1] :
	  nxt_state[REQ_1DB_WAIT2] = 1'b1;
	
	// REQ_1DB Wait-2 State
	cur_state[REQ_1DB_WAIT2] :
	  casez ({icr_grnt, nxt_tag_avail})
	    
	    // 0in < case -parallel -full
	    
	    2'b0z,
	    2'b10 : nxt_state[REQ_1DB_WAIT2] = 1'b1;
	    2'b11 : nxt_state[REQ_1DB_ENQ]   = 1'b1;
	  endcase
	    
	// REQ_4DB Enq State
	cur_state[REQ_1DB_ENQ]   :
	  nxt_state[IDLE] = 1'b1;
	
	///////////////////////////////////////////////////////////////////////
	// ---------- 4 Data-Beat Completion ------------------------
	
	// CPL_4DB Wait-1 State
	cur_state[CPL_4DB_WAIT1] :
	  nxt_state[CPL_4DB_WAIT2] = 1'b1;
	
	// CPL_4DB Wait-2 State
	cur_state[CPL_4DB_WAIT2] :
	  if (icr_grnt)
	    nxt_state[CPL_4DB_ENQ] = 1'b1;
	  else
	    nxt_state[CPL_4DB_WAIT2] = 1'b1;
	
	// CPL_4DB Enq State
	cur_state[CPL_4DB_ENQ]   :
	  nxt_state[IDLE] = 1'b1;
	
	///////////////////////////////////////////////////////////////////////
	
	// ---------- 1 Data-Beat Completion ------------------------
	
	// CPL_1DB Wait-1 State
	cur_state[CPL_1DB_WAIT1] :
	  nxt_state[CPL_1DB_WAIT2] = 1'b1;
	
	// CPL_1DB Wait-2 State
	cur_state[CPL_1DB_WAIT2] :
	  if (icr_grnt)
	    nxt_state[CPL_1DB_ENQ]   = 1'b1;
	  else
	    nxt_state[CPL_1DB_WAIT2] = 1'b1;
	
	// CPL_1DB Enq State
	cur_state[CPL_1DB_ENQ]   :
	  nxt_state[IDLE] = 1'b1;
	
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
  
  // ----- process tablewalk request -------------------------
  
//  assign proc_tcr = (tcr_grnt & ~d2j_dvld_s2);
 //BP n2 10-06-04
  assign proc_tcr = (tcr_grnt & ~d2j_dvld_s3);
  
  // ----- process unsupported request -----------------------
  
  assign proc_uns = ~icr_fifo_empty & uns_vld & uns_req_crdt_avail;
  
  // ----- process dma mem read request ----------------------
  
  // process a valid dma read command record
//  assign proc_dma_rd = (icr_grnt & mrd_vld & nxt_tag_avail & ~d2j_dvld_s2);
 //BP n2 10-06-04
  assign proc_dma_rd = (icr_grnt & mrd_vld & nxt_tag_avail & ~d2j_dvld_s3);
  
  // current dma read is for the first CL of a packet
  assign proc_dma_rd_1stcl = (icr_clsts & proc_dma_rd & dou_space_avail);
  
  // current dma read is for a remaining CL of a packet
  assign proc_dma_rd_clrmdr = (~icr_clsts & proc_dma_rd);
  
  // process the dma read
  assign dma_dptr_req = (proc_dma_rd_1stcl | proc_dma_rd_clrmdr);
  
  // ----- process termination records -----------------------
  
  assign drop_rcd = (~icr_fifo_empty &
		     ((~diu_dma_bufmgmt_bsy & mwr_err) |
		      (~diu_eqw_bufmgmt_bsy & (eqwr_err | null_vld))));
  
  // ----- process pio cpl errors ----------------------------
  
//  assign proc_pio_err = icr_grnt & pio_err & ~d2j_dvld_s2;
 //BP n2 10-06-04
  assign proc_pio_err = icr_grnt & pio_err & ~d2j_dvld_s3;
//BP 4-27-05 add an extra cycle after pio err cpl's because sii expects this
  always @(posedge clk)
    if (~rst_l)
      proc_pio_err_d <= 1'b0;
    else
      proc_pio_err_d <= proc_pio_err;
  
  // ----- generate icr fifo dequeue -------------------------
  
  assign icr_fifo_rd = (nxt_state[REQ_4DB_ENQ] | nxt_state[CPL_4DB_ENQ] |
			nxt_state[CPL_1DB_ENQ] | proc_uns | dma_dptr_req |
//BP 4-27-05			nxt_state[REQ_1DB_ENQ] | drop_rcd | proc_pio_err);
			nxt_state[REQ_1DB_ENQ] | drop_rcd | proc_pio_err_d);
  
  // ----- ctm control ---------------------------------------
  
  // fetch next tag - update request credits
  assign nxt_tag_req = nxt_state[REQ_4DB_ENQ] | nxt_state[REQ_1DB_ENQ] | proc_tcr | dma_dptr_req;
  
  // select for cmd/addr/ctag gen; icr = 1'b0, tcr = 1'b1
  assign cmd_req_sel = proc_tcr;
  
  // unsupported request enq
  always @(posedge clk)
    if (~rst_l)
      ctm2crm_rcd_enq <= 1'b0;
    else
      ctm2crm_rcd_enq <= proc_uns;
  
  // ----- dmc-2-jbc interface control -----------------------
  
  // d2j_cmd_vld : 1 cycle
  always @(posedge clk)
    if (~rst_l)
      d2j_cmd_vld <= 1'b0;
    else
      d2j_cmd_vld <= (nxt_state[REQ_4DB_ENQ] | nxt_state[CPL_4DB_ENQ] |
		      nxt_state[CPL_1DB_ENQ] | proc_tcr | dma_dptr_req |
		      nxt_state[REQ_1DB_ENQ] | proc_pio_err);
  
  // shift reg to generate d2j_data_vld : 1 or 4 cycles
  always @(posedge clk)
    if (~rst_l)
      begin
	d2j_dvld_s0 <= 1'b0;
	d2j_dvld_s1 <= 1'b0;
	d2j_dvld_s2 <= 1'b0;
	d2j_dvld_s3 <= 1'b0;
      end
    else if (nxt_state[REQ_4DB_ENQ] | nxt_state[CPL_4DB_ENQ])
      begin // dmawr(full/part), eqwr, mdo, pio64_cpl - 4 cycles
	d2j_dvld_s0 <= 1'b1;
	d2j_dvld_s1 <= 1'b1;
	d2j_dvld_s2 <= 1'b1;
	d2j_dvld_s3 <= 1'b1;
      end
    else if (nxt_state[CPL_1DB_ENQ] | nxt_state[REQ_1DB_ENQ])
      begin // pio16_cpl - 1 cycle, and new mondo int's
	d2j_dvld_s0 <= 1'b0;
	d2j_dvld_s1 <= 1'b0;
	d2j_dvld_s2 <= 1'b0;
	d2j_dvld_s3 <= 1'b1;
      end
    else
      begin
	d2j_dvld_s0 <= 1'b0;
	d2j_dvld_s1 <= d2j_dvld_s0;
	d2j_dvld_s2 <= d2j_dvld_s1;
	d2j_dvld_s3 <= d2j_dvld_s2;
      end
 
// BP n2 5-13-05 create a rd enable for the diu ram for power savings
assign	cl2di_rd_en	=   ~cmdctlfsm_idle; // 0in  assert_leader -leader cl2di_rd_en -follower d2j_data_vld -min 2 -max 2
	
  // output d2j_vld to jbc
  assign d2j_data_vld = d2j_dvld_s3;
  
  // ----- clu-2-mmu interface control -----------------------
  
  // generate tcr acknowledge
  always @(posedge clk)
    if (~rst_l)
      cl2mm_tcr_ack <= 1'b0;
    else if (proc_tcr)
      cl2mm_tcr_ack <= ~cl2mm_tcr_ack;
  
endmodule // dmu_clu_ctm_cmdctlfsm
