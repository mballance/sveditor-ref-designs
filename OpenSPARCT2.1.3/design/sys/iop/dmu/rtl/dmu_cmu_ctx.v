// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu_ctx.v
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
module dmu_cmu_ctx (
		clk, 	
		rst_l,

     // Debug
		dbg2ctx_dbg_sel_a,	
		dbg2ctx_dbg_sel_b,	
		ctx2dbg_dbg_a, 
		ctx2dbg_dbg_b, 

     // RCM
		rcm2ctx_ctx_req,
		ctx2rcm_ctx_gnt,
		ctx2rcm_nxctx_addr,
		rcm2ctx_ctx_addr,
		rcm2ctx_ctx_rw,
		ctx2rcm_cur_ctx,
		rcm2ctx_ctx,
		rcm2ctx_seq_req,
		ctx2rcm_seq_gnt,
		ctx2rcm_nxseq_addr,
		rcm2ctx_pkseq_addr,
		rcm2ctx_pkseq_rw,
		rcm2ctx_pkseq,

     // TCM
		tcm2ctx_ctx_addr,
		tcm2ctx_ctx_rw,
		ctx2tcm_cur_ctx,
		tcm2ctx_ctx,
		tcm2ctx_pkseq_addr,
		tcm2ctx_pkseq_rw,
		ctx2tcm_cur_pkseq,
		tcm2ctx_pkseq,
		tcm2ctx_lst_req,
		ctx2tcm_lst_gnt,
		ctx2tcm_nxlst_addr,
		tcm2ctx_ctxlst_addr,
		tcm2ctx_clst_rw,
		tcm2ctx_lst,
		ctx2tcm_cur_lst,
		tcm2ctx_ret_req,
		tcm2ctx_ret_addr
		);

     
//************************************************
//				PARAMETERS
//************************************************

// parameter MM2CM_WDTH    = `FIRE_DLC_ISR_REC_WDTH,       //79
//           CM2PM_WDTH    = `FIRE_DLC_IPR_REC_WDTH,       //93
//           CL2CM_WDTH    = `FIRE_DLC_EPR_REC_WDTH,       //80
//			 CM2RM_WDTH    = `FIRE_DLC_ERR_REC_WDTH;       //70   

// parameter SRMSB       = `FIRE_DLC_ISR_MSB,              // MM2CM_SRWDTH -1
//           RRMSB       = `FIRE_DLC_ERR_MSB;              // CM2RM_RRWDTH -1
   
//   parameter IPRMSB      = `FIRE_DLC_IPR_MSB,            // CM2PM_PRWDTH -1
//			   EPRMSB      = `FIRE_DLC_EPR_MSB;            // CL2CM_PRWDTH -1


// CTX
//   parameter CTXARRAY_WDTH      = 43,           // Context CTX entry width
   parameter CTXARRAY_WDTH      = 44,           // Context CTX entry width
			 CTXARRAYMSB        = CTXARRAY_WDTH -1,
			 CTXARRAY_DEPTH     = 32,
   			 CTXARRAY_ADDR_WDTH = 5,
             CTXARRAYADDRMSB    = CTXARRAY_ADDR_WDTH -1,
             CTXADDRLSB         = 0,
			 CTXADDR_WDTH       = 5,
             CTXADDRMSB         = CTXADDRLSB + CTXADDR_WDTH -1;			 

   parameter CTXALOC_WDTH   = 5,
			 CTXALOC_DEPTH  = 32;

// PKSEQ   
   parameter PSEQARRAY_WDTH      = 5,            // Context PKSEQ entry width
			 PSEQARRAYMSB        = PSEQARRAY_WDTH -1,
			 PSEQARRAY_DEPTH     = 32,
			 PSEQARRAY_ADDR_WDTH = 5,
             PSEQARRAYADDRMSB    = PSEQARRAY_ADDR_WDTH -1,
             PSEQADDRLSB         = 0,
			 PSEQADDR_WDTH       = 5,
			 PSEQADDRMSB         = PSEQADDRLSB + PSEQADDR_WDTH -1;			 
   
   parameter PSEQALOC_WDTH  = 5,
			 PSEQALOC_DEPTH = 32;   
   
// CLST
   parameter CLSTARRAY_WDTH      = 54,            // Context CLST entry width
			 CLSTARRAYMSB        = CLSTARRAY_WDTH -1,
			 CLSTARRAY_DEPTH     = 16,
			 CLSTARRAY_ADDR_WDTH = 4,
             CLSTARRAYADDRMSB    = CLSTARRAY_ADDR_WDTH -1,
             CLSTADDRLSB         = 0,
			 CLSTADDR_WDTH       = 4,
			 CLSTADDRMSB         = CLSTADDRLSB + CLSTADDR_WDTH -1;
   
   parameter CLSTALOC_WDTH   = 4,
             CLSTALOC_DEPTH = 16;   

// RET address
   parameter RETADDRARRAY_WDTH  = 17,
			 RETADDRMSB         = RETADDRARRAY_WDTH -1;   
   
   parameter RETCLSTADDRLSB      = 0,
			 RETCLSTADDR_WDTH    = 4,
			 RETCLSTADDRMSB      = RETCLSTADDRLSB + RETCLSTADDR_WDTH -1,
			 RETCLSTLSB          = RETCLSTADDRLSB + RETCLSTADDR_WDTH,
			 RETCLST_WDTH        = 1,
			 RETCLSTMSB          = RETCLSTLSB + RETCLST_WDTH -1,
			 RETPSEQADDRLSB      = RETCLSTLSB + RETCLST_WDTH,
			 RETPSEQADDR_WDTH    = 5,
			 RETPSEQADDRMSB      = RETPSEQADDRLSB + RETPSEQADDR_WDTH -1,
			 RETPSEQLSB          = RETPSEQADDRLSB + RETPSEQADDR_WDTH,
			 RETPSEQ_WDTH        = 1,
			 RETPSEQMSB          = RETPSEQLSB + RETPSEQ_WDTH -1,
			 RETCTXADDRLSB       = RETPSEQLSB + RETPSEQ_WDTH,
			 RETCTXADDR_WDTH     = 5,
             RETCTXADDRMSB       = RETCTXADDRLSB + RETCTXADDR_WDTH -1,
			 RETCTXLSB           = RETCTXADDRLSB + RETCTXADDR_WDTH,
			 RETCTX_WDTH         = 1,
			 RETCTXMSB           = RETCTXLSB + RETCTX_WDTH -1;

   
//************************************************
//				PORTS
//************************************************

   input clk;                                      // The input clock
   input rst_l;                                    // synopsys sync_set_reset "rst_l"

// RCM
   input  rcm2ctx_ctx_req;   
   output ctx2rcm_ctx_gnt; 
   output [CTXADDRMSB :0] ctx2rcm_nxctx_addr;
   
   input  [CTXADDRMSB :0] rcm2ctx_ctx_addr;
   input  rcm2ctx_ctx_rw;
   output [CTXARRAYMSB : 0] ctx2rcm_cur_ctx;
   input  [CTXARRAYMSB : 0] rcm2ctx_ctx;
   
   input  rcm2ctx_seq_req;
   output ctx2rcm_seq_gnt;
   output [PSEQADDRMSB :0] ctx2rcm_nxseq_addr;
   input  [PSEQADDRMSB :0] rcm2ctx_pkseq_addr;
   input  rcm2ctx_pkseq_rw;
   input  [PSEQARRAYMSB :0] rcm2ctx_pkseq;

// TCM
   input  [CTXADDRMSB :0] tcm2ctx_ctx_addr;
   input  tcm2ctx_ctx_rw;
   output [CTXARRAYMSB : 0] ctx2tcm_cur_ctx;
   input  [CTXARRAYMSB : 0] tcm2ctx_ctx;

   input  [PSEQADDRMSB :0] tcm2ctx_pkseq_addr;
   input  tcm2ctx_pkseq_rw;
   output [PSEQARRAYMSB : 0] ctx2tcm_cur_pkseq;
   input  [PSEQARRAYMSB : 0] tcm2ctx_pkseq;

   input  tcm2ctx_lst_req;
   output ctx2tcm_lst_gnt;
   output [CLSTADDRMSB :0] ctx2tcm_nxlst_addr;

   input  [CLSTADDRMSB :0] tcm2ctx_ctxlst_addr;
   input  tcm2ctx_clst_rw;
   input  [CLSTARRAYMSB : 0] tcm2ctx_lst;
   output [CLSTARRAYMSB : 0] ctx2tcm_cur_lst;   

   input  tcm2ctx_ret_req;
   input  [RETADDRMSB :0] tcm2ctx_ret_addr;

// Debug
   input [`FIRE_DLC_CMU_CTX_DS_BITS] dbg2ctx_dbg_sel_a;
   input [`FIRE_DLC_CMU_CTX_DS_BITS] dbg2ctx_dbg_sel_b;
   output [`FIRE_DBG_DATA_BITS] 	ctx2dbg_dbg_a;
   output [`FIRE_DBG_DATA_BITS] 	ctx2dbg_dbg_b;   
   
//************************************************
//				Functions
//************************************************

   
//************************************************
//				SIGNALS
//************************************************


   wire ctx_valid;
   wire seq_valid;

   wire clst_mpty;

//   for use when debug gets wired up
//   wire ctx_full;
//   wire clst_full;
//   wire clst_overflow;
//   wire clst_underflow;

// to-from RCM
   wire [CTXADDRMSB :0] ctx2rcm_nxctx_addr;
   
   wire [CTXADDRMSB :0] rcm2ctx_ctx_addr;
   wire rcm2ctx_ctx_rw;
   wire [CTXARRAYMSB : 0] ctx2rcm_cur_ctx;
   wire [CTXARRAYMSB : 0] rcm2ctx_ctx;
   
   wire rcm2ctx_seq_req;
   wire ctx2rcm_seq_gnt;
   wire [PSEQADDRMSB :0] ctx2rcm_nxseq_addr;
   wire [PSEQADDRMSB :0] rcm2ctx_pkseq_addr;
   wire rcm2ctx_pkseq_rw;
   wire [PSEQARRAYMSB : 0] rcm2ctx_pkseq;

// to-from TCM
   wire [CTXADDRMSB :0] tcm2ctx_ctx_addr;
   wire tcm2ctx_ctx_rw;
   wire [CTXARRAYMSB : 0] tcm2ctx_ctx;

   wire [PSEQADDRMSB :0] tcm2ctx_pkseq_addr;
   wire tcm2ctx_pkseq_rw;
   wire [PSEQARRAYMSB : 0] ctx2tcm_cur_pkseq;
   wire [PSEQARRAYMSB : 0] tcm2ctx_pkseq;

   wire tcm2ctx_lst_req;
   wire ctx2tcm_lst_gnt;
   wire [CLSTADDRMSB :0] ctx2tcm_nxlst_addr;

   wire [CLSTADDRMSB :0] tcm2ctx_ctxlst_addr;
   wire tcm2ctx_clst_rw;
   wire [CLSTARRAYMSB : 0] tcm2ctx_lst;
   wire [CLSTARRAYMSB : 0] ctx2tcm_cur_lst;   

   wire tcm2ctx_ret_req;
   wire [RETADDRMSB :0] tcm2ctx_ret_addr;   

   wire [CTXARRAYADDRMSB :0] ctx_ret_addr;
   wire [PSEQARRAYADDRMSB :0] seq_ret_addr;
   wire [CLSTARRAYADDRMSB :0] clst_ret_addr;

   wire ctx_rel, 
        seq_rel, 
        clst_rel;

// Registers
   reg ctx_enq,
       seq_enq,
       clst_enq;

   reg next_ctx_deq, ctx_deq;
   reg next_seq_deq, seq_deq; 
   reg next_clst_deq, clst_deq;
   
   reg [1 :0] ctx_state;
   reg [1 :0] ctx_next;  

   reg [1 :0] seq_state;
   reg [1 :0] seq_next;  

   reg [1 :0] clst_state;
   reg [1 :0] clst_next;

   reg ctx_is_idle; 

// Debug
  reg  [`FIRE_DLC_CMU_RCM_DS_BITS]	dbg_sel [0:1];
  reg  [`FIRE_DBG_DATA_BITS]	dbg_bus [0:1];
  reg  [`FIRE_DBG_DATA_BITS]	nxt_dbg_bus [0:1];
  integer i, j;   
   
// *************** Local Declarations ******************************/

   parameter 
	   CTXIDLE  = 2'b00,  // NO requests
       CTXDEQ   = 2'b01;  // number available

   parameter 
	   SEQIDLE  = 2'b00,  // NO requests
       SEQDEQ   = 2'b01;  // number available

   parameter 
	   CLSTIDLE  = 2'b00,  // NO requests
       CLSTDEQ   = 2'b01;  // number available
   
   
//************************************************
// Zero In checkers
//************************************************ 
// ctx_fsm
  //0in state_transition  -var ctx_state  -val CTXIDLE  -next CTXIDLE CTXDEQ 
  //0in state_transition  -var ctx_state  -val CTXDEQ   -next CTXIDLE

// seq_fsm
  //0in state_transition  -var seq_state  -val SEQIDLE  -next SEQIDLE SEQDEQ
  //0in state_transition  -var seq_state  -val SEQDEQ   -next SEQIDLE

// clst_fsm
  //0in state_transition  -var clst_state  -val CLSTIDLE  -next CLSTIDLE CLSTDEQ
  //0in state_transition  -var clst_state  -val CLSTDEQ   -next CLSTIDLE


// *************** Procedures *************************************/

always @( ctx_rel or seq_rel or clst_rel)
  begin
	 ctx_enq = 1'b0;
     seq_enq = 1'b0;
     clst_enq = 1'b0;
	 if(ctx_rel) ctx_enq = 1'b1;
	 if(seq_rel) seq_enq = 1'b1;
	 if(clst_rel) clst_enq = 1'b1;
  end   
		  
// Context Number aloc fsm
// if ctx_valid = 1 current address can be used   
// if next sequential address is in use valid = 0 - wait
   
 always @(ctx_state or ctx_valid or rcm2ctx_ctx_req)
   begin
	  next_ctx_deq = 1'b0;
      ctx_next = ctx_state;

	   case  (ctx_state)
		 CTXIDLE :  begin        // Waiting for requests
           if (rcm2ctx_ctx_req) begin
			  if(~ctx_valid) begin
				 next_ctx_deq = 1'b0;
				 ctx_next = CTXIDLE;
			  end
			  else begin
				 next_ctx_deq = 1'b1;
				 ctx_next = CTXDEQ;
			  end
		   end			
		   else begin
			  next_ctx_deq = 1'b0;
			  ctx_next = CTXIDLE;
		   end
		 end		 
         CTXDEQ : begin          // Load winner issue gnt to requester
			   next_ctx_deq = 1'b0;
               ctx_next = CTXIDLE;
          end         
         default : begin
			  next_ctx_deq = 1'b0;
			  ctx_next = CTXIDLE;
		   end
	   endcase // case(ctx_state)
   end // always @ (ctx_state or pre_win or ctx_valid or rcm2ctx_ctx_req)   

// CTX aloc state transitions
always @(posedge clk)
  begin
	 if (rst_l == 1'b0)
	   ctx_state <= CTXIDLE;	// Synchronous Reset
	 else begin
		ctx_state <= ctx_next;
	 end
  end  

// PKSEQ Address aloc fsm
// if seq_valid = 1 current address can be used
// if next sequential address is in use valid = 0 - wait

 always @(seq_state or rcm2ctx_seq_req or seq_valid)
   begin
	  next_seq_deq = 1'b0;
      seq_next = seq_state;

	   case  (seq_state)
		 SEQIDLE :  begin        // Waiting for requests
           if (rcm2ctx_seq_req) begin
			  if(seq_valid == 1'b1 ) begin
				 next_seq_deq = 1'b1;
				 seq_next = SEQDEQ;
			  end
			  else begin
				 next_seq_deq = 1'b0;
				 seq_next = SEQIDLE;
			  end
		   end			
		   else begin
			  next_seq_deq = 1'b0;
			  seq_next = SEQIDLE;
		   end
		 end		 
         SEQDEQ : begin          // Load winner issue gnt to requester
			   next_seq_deq = 1'b0;
               seq_next = SEQIDLE;
          end         
         default : begin
			  next_seq_deq = 1'b0;
			  seq_next = SEQIDLE;
		   end
	   endcase // case(seq_state)	  
   end // always @ (seq_state or rcm2ctx_seq_req or seq_valid)   

// PSEQ aloc state transitions
always @(posedge clk)
  begin
	 if (rst_l == 1'b0)
	   seq_state <= SEQIDLE;	// Synchronous Reset
	 else begin
		seq_state <= seq_next;
	 end
  end  

// CLIST Address aloc fsm
 always @(clst_state or clst_mpty or tcm2ctx_lst_req)
   begin
	  next_clst_deq = 1'b0;
      clst_next = clst_state;

	   case  (clst_state)
		 CLSTIDLE :  begin        // Waiting for requests
           if (tcm2ctx_lst_req) begin
			  if(clst_mpty) begin
				 next_clst_deq = 1'b0;
				 clst_next = CLSTIDLE;
			  end
			  else begin
				 next_clst_deq = 1'b1;
				 clst_next = CLSTDEQ;
			  end
		   end			
		   else begin
			  next_clst_deq = 1'b0;
			  clst_next = CLSTIDLE;
		   end
		 end		 
         CLSTDEQ : begin          // Load winner issue gnt to requester
			   next_clst_deq = 1'b0;
               clst_next = CLSTIDLE;
          end         
         default : begin
			  next_clst_deq = 1'b0;
			  clst_next = CLSTIDLE;
		   end
	   endcase // case(clst_state)
   end // always @ (clst_state or clst_mpty or rcm2ctx_seq_req)   

// CLIST aloc state transitions
always @(posedge clk)
  begin
	 if (rst_l == 1'b0)
	   clst_state <= CLSTIDLE;	// Synchronous Reset
	 else begin
		clst_state <= clst_next;
	 end
  end  
    
   
//************************************************
//				MODULES
//************************************************

// Context Number Address Allocater
dmu_cmu_ctx_aloc #(CTXALOC_WDTH, CTXALOC_DEPTH) 
   cnum_aloc (
			  .clk (clk),
			  .rst_l (rst_l),
			  .enq (ctx_enq),
			  .data_in (ctx_ret_addr),
			  .deq (ctx_deq),
			  .data_out (ctx2rcm_nxctx_addr),
			  .valid (ctx_valid)
			  );

// Context Array
// both ports same size   
dmu_cmu_ctx_reg_array #(CTXARRAY_WDTH,CTXARRAY_DEPTH,CTXARRAY_ADDR_WDTH)
   ctx_array (
			  .clk(clk),
			  .rst_l(rst_l),
			  .addr0(rcm2ctx_ctx_addr),
			  .data0_in(rcm2ctx_ctx),
			  .rw0(rcm2ctx_ctx_rw),
			  .data0_out(ctx2rcm_cur_ctx),           //may not need
			  .addr1(tcm2ctx_ctx_addr),
			  .data1_in(tcm2ctx_ctx),
			  .rw1(tcm2ctx_ctx_rw),
			  .data1_out(ctx2tcm_cur_ctx)
			   );

// Context Packet Sequence Address Allocater
dmu_cmu_ctx_pkseqaloc #(PSEQALOC_WDTH,PSEQALOC_DEPTH)
   pkseq_aloc (
			   .clk (clk),
			   .rst_l (rst_l),
			   .enq (seq_enq),
			   .data_in (seq_ret_addr),
			   .deq (seq_deq),
			   .data_out (ctx2rcm_nxseq_addr),
			   .valid(seq_valid)
			    );

// Packet Sequence Array   
// both ports same size
dmu_cmu_ctx_reg_array #(PSEQARRAY_WDTH,PSEQARRAY_DEPTH,PSEQARRAY_ADDR_WDTH)
         pkseq_array (
					  .clk(clk),
					  .rst_l(rst_l),
					  .addr0(rcm2ctx_pkseq_addr),
					  .data0_in(rcm2ctx_pkseq),
					  .rw0(rcm2ctx_pkseq_rw),
					  .data0_out(),  
					  .addr1(tcm2ctx_pkseq_addr),
					  .data1_in(tcm2ctx_pkseq),
					  .rw1(tcm2ctx_pkseq_rw),
					  .data1_out(ctx2tcm_cur_pkseq)
					   );

// Context List Address Allocater
dmu_cmu_clst_aloc #(CLSTALOC_WDTH, CLSTALOC_DEPTH)
   lst_aloc (
			 .clk (clk),
			 .rst_l (rst_l),
			 .enq (clst_enq),
			 .data_in (clst_ret_addr),
			 .deq (clst_deq),
			 .data_out (ctx2tcm_nxlst_addr),
			 .full (),              //.full (clst_full),
			 .empty (clst_mpty),
             .overflow(),           //.overflow(clst_overflow),
             .underflow()           //.underflow(clst_underflow)
			 );

// Context List Array
// both ports same size      
dmu_cmu_ctx_clstreg_array #(CLSTARRAY_WDTH,
                                 CLSTARRAY_DEPTH,
                                 CLSTARRAY_ADDR_WDTH
                                 ) 
   clist_array (
				.clk(clk),
				.rst_l(rst_l),
				.addr(tcm2ctx_ctxlst_addr),
				.data_in(tcm2ctx_lst),
				.rw(tcm2ctx_clst_rw),
				.data_out(ctx2tcm_cur_lst)
				 );
   
// ********************** signal registers ************************/
always @(posedge clk)
  begin	 
    if (rst_l == 1'b0) begin
	   ctx_deq   <= 0;	   
	   seq_deq   <= 0;	   
	   clst_deq  <= 0;	   
	end
	else begin
	   ctx_deq  <= next_ctx_deq;	   
	   seq_deq  <= next_seq_deq;	   
	   clst_deq <= next_clst_deq;	   
	end
  end // always @ (posedge clk) 
   
always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin
	   ctx_is_idle <= 1'b1;	   
     end
    else begin
	   ctx_is_idle <= ((rcm2ctx_ctx_req == 1'b0) && (ctx_state == CTXIDLE) && 
                       (rcm2ctx_seq_req == 1'b0) && (seq_state == SEQIDLE) &&
                       (tcm2ctx_lst_req == 1'b0)  && (clst_state == CLSTIDLE))
                      ? 1'b1 : 1'b0;
	end
  end 

// ----------------------------------------------------------------------------
// Debug
// ----------------------------------------------------------------------------
always @ (dbg2ctx_dbg_sel_a or dbg2ctx_dbg_sel_b) 
  begin
	 dbg_sel[0] = dbg2ctx_dbg_sel_a;
	 dbg_sel[1] = dbg2ctx_dbg_sel_b;
  end

always @ (dbg_sel[0] or dbg_sel[1] or 
          rcm2ctx_ctx_req or ctx_deq or ctx2rcm_nxctx_addr or
          rcm2ctx_seq_req or seq_deq or ctx2rcm_nxseq_addr or
          tcm2ctx_lst_req or clst_deq or ctx2tcm_nxlst_addr or
          ctx_rel or ctx_ret_addr or seq_rel or seq_ret_addr or
		  clst_rel or clst_ret_addr or ctx_is_idle
		  )
  begin
	 for (i = 0; i < 2; i = i + 1) begin
		case (dbg_sel[i]) // synopsys infer_mux
		  3'b000: nxt_dbg_bus[i] = {ctx_is_idle,rcm2ctx_ctx_req,ctx_deq,ctx2rcm_nxctx_addr};
		  3'b001: nxt_dbg_bus[i] = {1'b0,rcm2ctx_seq_req,seq_deq,ctx2rcm_nxseq_addr};
		  3'b010: nxt_dbg_bus[i] = {2'b00,tcm2ctx_lst_req,clst_deq,ctx2tcm_nxlst_addr};
		  3'b011: nxt_dbg_bus[i] = {2'b00,ctx_rel,ctx_ret_addr};
		  3'b100: nxt_dbg_bus[i] = {2'b00,seq_rel,seq_ret_addr};
		  3'b101: nxt_dbg_bus[i] = {3'b000,clst_rel,clst_ret_addr};
		  3'b110: nxt_dbg_bus[i] = 8'h00;
		  3'b111: nxt_dbg_bus[i] = 8'h00;
		endcase // case(dbg_sel[i])
	 end // for (i = 0; i < 2; i = i + 1)
  end // always @ (dbg_sel[0] or dbg_sel[1] or...  
   
always @ (posedge clk) begin
   if(rst_l == 1'b0) begin
    for (j = 0; j < 2; j = j + 1) begin
      dbg_bus[j] <= 8'h00;
    end
   end
   else begin
	  for (j = 0; j < 2; j = j + 1) begin
		 dbg_bus[j] <= nxt_dbg_bus[j];
	  end
   end
end // always @ (posedge clk)

	   
// ********************** Output Procedures ***********************/

   
   
   
// ***********************Assignments *****************************/
   assign ctx_rel = tcm2ctx_ret_req & tcm2ctx_ret_addr[RETCTXMSB];   
   assign ctx_ret_addr = tcm2ctx_ret_addr[RETCTXADDRMSB :RETCTXADDRLSB];

   assign seq_rel = tcm2ctx_ret_req & tcm2ctx_ret_addr[RETPSEQMSB];   
   assign seq_ret_addr = tcm2ctx_ret_addr[RETPSEQADDRMSB :RETPSEQADDRLSB];

   assign clst_rel = tcm2ctx_ret_req & tcm2ctx_ret_addr[RETCLSTMSB];   
   assign clst_ret_addr = tcm2ctx_ret_addr[RETCLSTADDRMSB :RETCLSTADDRLSB];

   assign ctx2rcm_ctx_gnt = ctx_deq;
   assign ctx2rcm_seq_gnt = seq_deq;
   assign ctx2tcm_lst_gnt = clst_deq;

// Output assignments
   
// Debug
  assign ctx2dbg_dbg_a = dbg_bus[0];
  assign ctx2dbg_dbg_b = dbg_bus[1];   

endmodule 
