// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu_tcm.v
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
module dmu_cmu_tcm (
		 clk, 	
		 rst_l,

      // Debug
		 dbg2tcm_dbg_sel_a,	
		 dbg2tcm_dbg_sel_b,	
		 tcm2dbg_dbg_a, 
		 tcm2dbg_dbg_b, 						 

      // CLU
         cl2cm_rcd_enq,
         cl2cm_rcd,
		 cm2cl_rcd_full,

      // RMU
         cm2rm_rcd_enq,
		 cm2rm_rcd,
		 rm2cm_rcd_full,

      // CTX
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

// Egress Packet Record Field Widths   
// parameter CL2CM_WDTH      = `FIRE_DLC_EPR_REC_WDTH;       //80

   parameter EPRMSB          = `FIRE_DLC_EPR_MSB;            // CL2CM_WDTH -1

   parameter PRTYP_WDTH      = `FIRE_DLC_EPR_TYP_WDTH,       // 6
			 PRLEN_WDTH      = `FIRE_DLC_EPR_LEN_WDTH,       //10
			 PRDWBE_WDTH     = `FIRE_DLC_EPR_DWBE_WDTH,      // 8
			 PRADDR_WDTH     = `FIRE_DLC_EPR_ADDR_WDTH,      //34
			 PRSBDTAG_WDTH   = `FIRE_DLC_EPR_SBDTAG_WDTH,    // 5   
			 PRDPTR_WDTH     = `FIRE_DLC_EPR_DPTR_WDTH,      // 6 
			 PRPKSEQNUM_WDTH = `FIRE_DLC_EPR_PKSEQNUM_WDTH,  // 5
             PRCNTXTNUM_WDTH = `FIRE_DLC_EPR_CNTXTNUM_WDTH;  // 5
			   
   parameter PRTYPMSB        = PRTYP_WDTH -1,
			 PRLENMSB        = PRLEN_WDTH -1,
			 PRDWBEMSB       = PRDWBE_WDTH -1,
			 PRADDRMSB       = PRADDR_WDTH -1,
			 PRSBDTAGMSB     = PRSBDTAG_WDTH -1,
			 PRDPTRMSB       = PRDPTR_WDTH -1,
			 PRPKSEQNUMMSB   = PRPKSEQNUM_WDTH -1,
			 PRCNTXTNUMMSB   = PRCNTXTNUM_WDTH -1;   


// Egress Retire Record Field Widths
// parameter CM2RM_WDTH      = `FIRE_DLC_ERR_REC_WDTH;      //70

   parameter RRMSB           = `FIRE_DLC_ERR_MSB;           // CM2RM_WDTH -1

   parameter RRTYP_WDTH      = `FIRE_DLC_ERR_TYP_WDTH,       // 7
			 RRLEN_WDTH      = `FIRE_DLC_ERR_LEN_WDTH,       //10
             RRFDWBE_WDTH    = `FIRE_DLC_ERR_FDWBE_WDTH,     // 4
             RRLDWBE_WDTH    = `FIRE_DLC_ERR_LDWBE_WDTH,     // 4			 
			 RRADDR_WDTH     = `FIRE_DLC_ERR_ADDR_WDTH,      //34
			 RRSBDTAG_WDTH   = `FIRE_DLC_ERR_SBDTAG_WDTH,    // 5   
             RRDPTR_WDTH     = `FIRE_DLC_ERR_DPTR_WDTH;      // 6

   parameter RRTYPMSB        = RRTYP_WDTH -1,
			 RRLENMSB        = RRLEN_WDTH -1,
			 RRDWBEMSB       = RRFDWBE_WDTH + RRLDWBE_WDTH -1,
			 RRADDRMSB       = RRADDR_WDTH -1,
			 RRSBDTAGMSB     = RRSBDTAG_WDTH -1,
             RRDPTRMSB       = RRDPTR_WDTH -1;
			   
// CTX
//   parameter CTXARRAY_WDTH      = 43,           // Context CTX entry width
   parameter CTXARRAY_WDTH      = 44,           // Context CTX entry width
			 CTXARRAYMSB        = CTXARRAY_WDTH -1,
             CTXADDRLSB         = 0,
			 CTXADDR_WDTH       = 5,
             CTXADDRMSB         = CTXADDRLSB + CTXADDR_WDTH -1;

   parameter ORDERBITLSB        = 0,                                //0
			 ORDERBIT_WDTH      = 32,
			 ORDERBITMSB        = ORDERBITLSB + ORDERBIT_WDTH -1,   //31
			 ERRLSB             = ORDERBITLSB + ORDERBIT_WDTH,
			 ERR_WDTH           = 1,                                //32
			 PSEQLSB            = ERRLSB + ERR_WDTH,
			 PSEQ_WDTH          = 5,
			 PSEQMSB            = PSEQLSB + PSEQ_WDTH -1,           //37
			 PKTOTLSB           = PSEQLSB + PSEQ_WDTH,
			 PKTOT_WDTH         = 6,
			 PKTOTMSB           = PKTOTLSB + PKTOT_WDTH -1;         //42

// PKSEQ   
   parameter PSEQARRAY_WDTH     = 5,            // Context PKSEQ entry width
			 PSEQARRAYMSB       = PSEQARRAY_WDTH -1,
             PSEQADDRLSB        = 0,
			 PSEQADDR_WDTH      = 5,
			 PSEQADDRMSB        = PSEQADDRLSB + PSEQADDR_WDTH -1;

   parameter PTRCLSTLSB         = 0,                              //0
			 PTRCLST_WDTH       = 4,
			 PTRCLSTMSB         = PTRCLSTLSB + PTRCLST_WDTH -1,   //3
			 CBITLSB            = PTRCLSTLSB + PTRCLST_WDTH,
			 CBIT_WDTH          = 1,
			 CBITMSB            = CBITLSB + CBIT_WDTH -1;         //4

// CLST
   parameter CLSTARRAY_WDTH     = 54,            // Context CLST entry width
			 CLSTARRAYMSB       = CLSTARRAY_WDTH -1,
             CLSTADDRLSB        = 0,
			 CLSTADDR_WDTH      = 4,
			 CLSTADDRMSB        = CLSTADDRLSB + CLSTADDR_WDTH -1;

   parameter CPKSEQLSB          = 0,
             CPKSEQ_WDTH        = 5,
			 CPKSEQMSB          = CPKSEQLSB + CPKSEQ_WDTH -1,
			 CDPTRLSB           = CPKSEQLSB + CPKSEQ_WDTH,
			 CDPTR_WDTH         = 6,
			 CDPTRMSB           = CDPTRLSB + CDPTR_WDTH -1,
			 CSBDTAGLSB         = CDPTRLSB + CDPTR_WDTH,
			 CSBDTAG_WDTH       = 5,
			 CSBDTAGMSB         = CSBDTAGLSB + CSBDTAG_WDTH -1,
			 CADDRLSB           = CSBDTAGLSB + CSBDTAG_WDTH,
			 CADDR_WDTH         = 12,
			 CADDRMSB           = CADDRLSB + CADDR_WDTH -1,
			 CDWBELSB           = CADDRLSB + CADDR_WDTH,
			 CDWBE_WDTH         = 8,
			 CDWBEMSB           = CDWBELSB + CDWBE_WDTH -1,
             CLSTPKTLSB         = CDWBELSB + CDWBE_WDTH,
             CLSTPKT_WDTH       = 1,
			 CLSTPKTMSB         = CLSTPKTLSB + CLSTPKT_WDTH -1,
			 CLENLSB            = CLSTPKTLSB + CLSTPKT_WDTH,
			 CLEN_WDTH          = 10,
			 CLENMSB            = CLENLSB + CLEN_WDTH -1,
			 CTYPLSB            = CLENLSB + CLEN_WDTH,
			 CTYP_WDTH          = 7,
             CTYPMSB            = CTYPLSB + CTYP_WDTH -1;
   
   parameter RETADDRARRAY_WDTH  = 17,
			 RETADDRMSB         = RETADDRARRAY_WDTH -1;   
   
//************************************************
//				PORTS
//************************************************

   input clk;                                      // The input clock
   input rst_l;                                    // synopsys sync_set_reset "rst_l"

// TCM
   input  cl2cm_rcd_enq;
   input  [EPRMSB : 0] cl2cm_rcd;
   output cm2cl_rcd_full;

   output cm2rm_rcd_enq;
   output [RRMSB : 0] cm2rm_rcd;
   input  rm2cm_rcd_full;

   output [CTXADDRMSB :0] tcm2ctx_ctx_addr;
   output tcm2ctx_ctx_rw;
   input  [CTXARRAYMSB : 0] ctx2tcm_cur_ctx;
   output [CTXARRAYMSB : 0] tcm2ctx_ctx;

   output [PSEQADDRMSB :0] tcm2ctx_pkseq_addr;
   output tcm2ctx_pkseq_rw;
   input  [PSEQARRAYMSB : 0] ctx2tcm_cur_pkseq;
   output [PSEQARRAYMSB : 0] tcm2ctx_pkseq;

   output tcm2ctx_lst_req;
   input  ctx2tcm_lst_gnt;
   input  [CLSTADDRMSB :0] ctx2tcm_nxlst_addr;

   output [CLSTADDRMSB :0] tcm2ctx_ctxlst_addr;
   output tcm2ctx_clst_rw;
   output [CLSTARRAYMSB : 0] tcm2ctx_lst;
   input [CLSTARRAYMSB : 0] ctx2tcm_cur_lst;

   output tcm2ctx_ret_req;
   output [RETADDRMSB :0] tcm2ctx_ret_addr;

// Debug
   input [`FIRE_DLC_CMU_TCM_DS_BITS] dbg2tcm_dbg_sel_a;
   input [`FIRE_DLC_CMU_TCM_DS_BITS] dbg2tcm_dbg_sel_b;
   output [`FIRE_DBG_DATA_BITS] 	tcm2dbg_dbg_a;
   output [`FIRE_DBG_DATA_BITS] 	tcm2dbg_dbg_b;
   

//************************************************
//				SIGNALS
//************************************************
 
   wire clk;
   wire rst_l;

// Packet Record queue signals 
   wire pkmpty;

// for use with debuig ports
//   wire overflow;
//   wire underflow;
   
// Packet Record field assignments to TCM signals
   wire [PRTYPMSB :0] pkttyp;
   wire [PRLENMSB :0] pktlen;
   wire [PRDWBEMSB :0] pktdwbe;
   wire [PRADDRMSB :0] pktaddr;
   wire [PRSBDTAGMSB :0] pkttr_tag;
   wire [PRDPTRMSB :0] pktdptr;
   wire [PRPKSEQNUMMSB :0] pktseq_num;
   wire [PRCNTXTNUMMSB :0] pktcntxt_num;
   wire [2 :0]  pkt_clsts;
   
//TCM - CTX
   reg  [CTXADDRMSB :0] tcm2ctx_ctx_addr_hld;
   reg  tcm2ctx_ctx_rw;
   wire [CTXARRAYMSB : 0] ctx2tcm_cur_ctx;

   reg [CTXARRAYMSB : 0] tcm_cur_ctx;
   reg  [CTXARRAYMSB : 0] tcm2ctx_ctx;

   reg  [PSEQADDRMSB :0] tcm2ctx_pkseq_addr;
   reg  tcm2ctx_pkseq_rw;
   wire [PSEQARRAYMSB : 0] ctx2tcm_cur_pkseq;
   reg  [PSEQARRAYMSB : 0] tcm2ctx_pkseq;
   reg  tcm2ctx_lst_req;
   wire ctx2tcm_lst_gnt;
   wire [CLSTADDRMSB :0] ctx2tcm_nxlst_addr;

   reg  [CLSTADDRMSB :0] tcm2ctx_ctxlst_addr;
   reg  tcm2ctx_clst_rw;
   reg  [CLSTARRAYMSB : 0] tcm2ctx_lst;
   wire [CLSTARRAYMSB : 0] ctx2tcm_cur_lst;
   wire [CPKSEQMSB :0] 	   scan_pkseq_num;

   reg  tcm2ctx_ret_req;
   reg  [RETADDRMSB :0] tcm2ctx_ret_addr;

   wire [ORDERBITMSB :0] ctx_order_bits;
   wire [ORDERBITMSB :0] new_order_bits;   

   reg  cpl;
   wire last_pkt;
   wire pipe_mpty;
   
   reg last_in_pkt;
   reg last_scan_pkt;      
   
// Registers
// Retire Record field assignments   
   reg [RRTYPMSB :0] rrtyp;
   reg [RRLENMSB :0]  rrlen;   
   reg [RRDWBEMSB :0] rrdwbe;   
   reg [RRADDRMSB :0] rraddr;   
   reg [RRSBDTAGMSB :0] rrsbdtag;   
   reg [RRDPTRMSB :0] rrdptr;

   reg [RRTYPMSB :0] next_rrtyp;
   reg [RRLENMSB :0]  next_rrlen;   
   reg [RRDWBEMSB :0] next_rrdwbe;   
   reg [RRADDRMSB :0] next_rraddr;   
   reg [RRSBDTAGMSB :0] next_rrsbdtag;   
   reg [RRDPTRMSB :0] next_rrdptr;
   reg [PRPKSEQNUMMSB :0] next_pktseq_num;
   reg [PRCNTXTNUMMSB :0] next_pktcntxt_num;

   reg [RRTYPMSB :0] pipe_rrtyp;
   reg [RRLENMSB :0]  pipe_rrlen;   
   reg [RRDWBEMSB :0] pipe_rrdwbe;   
   reg [RRADDRMSB :0] pipe_rraddr;   
   reg [RRSBDTAGMSB :0] pipe_rrsbdtag;   
   reg [RRDPTRMSB :0] pipe_rrdptr;
   reg [PRPKSEQNUMMSB :0] pipe_pktseq_num;
   reg [PRCNTXTNUMMSB :0] pipe_pktcntxt_num;   
   reg [2 :0] pipe_clastyp;

   reg 		  ctx_sel;
   reg 		  pkseq_sel;
   reg 		  clst_sel;
   
   reg [CTXADDRMSB :0] ctx_relrcd;      
   reg [PSEQADDRMSB :0] pkseq_relrcd;      
   reg [CLSTADDRMSB :0] clst_relrcd;      
   
   reg [1:0] deq_state;
   reg [1:0] deq_next;   

   reg [2:0] ctx_state;
   reg [2:0] ctx_next;

   reg [1:0] lst_state;
   reg [1:0] lst_next;   

   reg [2:0] bld_state;
   reg [2:0] bld_next;

   reg next_rcd_enq;
   reg [2 :0] next_clastyp;

   reg xfr_strt;   
   reg frwd_pkt;
   reg store_pkt;   
   reg next_lst_req;
   reg do_lst;   
   reg do_pkseq;   
   reg do_ctx;
   reg do_next_pkt;
   reg do_next_lst;   
   reg next_ctx_addr;   
   reg stop_scan;
   reg look_up;   
   reg scan_mode;
   reg ld_pipe;
   reg pipe_full;   
   
   reg cm2rm_rcd_enq;
   reg next_deq_pipe;
   reg next_deq_pkr;
   reg next_gen_pkt;
   reg next_pkvld;  
   reg hld_pkvld;   
   wire pkvld;   
   reg clear_pkvld;

   reg next_clist_put;
   reg next_ctx_ck;
   reg ctx_ck;
   
   reg  [ORDERBITMSB :0] upd_order_bits;
   reg  [ORDERBITMSB :0] scan_order_bits;

   reg tcm_is_idle;  

// Debug
  reg  [`FIRE_DLC_CMU_TCM_DS_BITS]	dbg_sel [0:1];
  reg  [`FIRE_DBG_DATA_BITS]	dbg_bus [0:1];
  reg  [`FIRE_DBG_DATA_BITS]	nxt_dbg_bus [0:1];
  integer i, k;
	   
// *************** Local Declarations *************************************

  parameter 	 DEQIDLE = 2'b00,   // Idle
				 DEQ     = 2'b01;   // dequeue next packets

  parameter      CTXIDLE = 3'b000,  // Context Scanner is IDLE
				 CTXSEQ  = 3'b001,  // look up packet sequence
				 CTXCHK  = 3'b010,  // check packet against context
				 CTXDIS  = 3'b011,  // dispatch (store,send)
			     CTXNXT  = 3'b100;  // look up next packet sequence

  parameter 	 LSTIDLE = 2'b00,   // Packet Sequence Put Idle
				 LSTGNT  = 2'b01,   // Packet Sequence Put has CLIST address
				 LSTUPD  = 2'b10;   // write PSEQ at CLIST entry address, 
                                    // write PSEQ entry   
  parameter 	 BLDIDLE = 3'b000,  // Build Context Idle
				 BLDCNTX = 3'b010,  // Context ops in progress
				 BLDBPAS = 3'b011;  // NO context ops needed
   
  parameter 	 CLASCP  = 3'b001,
				 CLASCPD = 3'b010,
				 CLASPIO = 3'b011,
				 CLASMDO = 3'b100,
                 CLASUSP = 3'b101;

//************************************************
// Zero In checkers
//************************************************ 
// deq_fsm
  //0in state_transition  -var deq_state  -val DEQIDLE  -next DEQIDLE DEQ
  //0in state_transition  -var deq_state  -val DEQ      -next DEQIDLE

// ctx_fsm
  //0in state_transition  -var ctx_state  -val CTXIDLE  -next CTXIDLE CTXSEQ
  //0in state_transition  -var ctx_state  -val CTXSEQ   -next CTXCHK CTXIDLE
  //0in state_transition  -var ctx_state  -val CTXCHK   -next CTXIDLE CTXDIS 
  //0in state_transition  -var ctx_state  -val CTXDIS   -next CTXNXT CTXIDLE CTXDIS CTXSEQ
  //0in state_transition  -var ctx_state  -val CTXNXT   -next CTXSEQ 

// lst_fsm
  //0in state_transition  -var lst_state  -val LSTIDLE  -next LSTIDLE LSTGNT   
  //0in state_transition  -var lst_state  -val LSTGNT   -next LSTGNT LSTUPD
  //0in state_transition  -var lst_state  -val LSTUPD   -next LSTIDLE
   
// build_crcd (pipeline staging and command record build)
  //0in state_transition  -var bld_state  -val BLDIDLE   -next BLDIDLE BLDBPAS BLDCNTX
  //0in state_transition  -var bld_state  -val BLDCNTX   -next BLDCNTX BLDIDLE 
  //0in state_transition  -var bld_state  -val BLDBPAS   -next BLDBPAS BLDIDLE

// ********** Parse Packet Record Procedures (parse_rcd)*********/

// Transaction Type Decode - Context Function Encoding(typ_dcd)
always @(pkttyp or pkt_clsts)   
  begin
     next_clastyp = 0;
	 
     case(pkttyp)         // synopsys parallel_case
	   7'b0000000,                                     // PIO MRd
	   7'b0100000,                                     // PIO MRd
	   7'b0000010,                                     // PIO IO Rd
	   7'b0000100,                                     // PIO Cfg Rd 0
	   7'b0000101,                                     // PIO Cfg RD 1
	   7'b1000000,                                     // PIO MWr
	   7'b1100000,                                     // PIO MWr
	   7'b1000010,                                     // PIO IO Wr
	   7'b1000100,                                     // PIO Cfg Wr 0
	   7'b1000101 : next_clastyp = CLASPIO;            // PIO Cfg Wr 1

	   7'b1111010 : next_clastyp = CLASMDO;            // Mondo Rpy

	   7'b0001010,                                     // DMA Cpl
	   7'b0001011 : begin                              
		  case (pkt_clsts)        // synopsys parallel_case
			3'b001 : next_clastyp = CLASUSP;           // DMA CPLk,Unsup Cpl
			default : next_clastyp = CLASCP;             
		  endcase // case(pkt_clsts)
	   end	   

	   7'b1001010 : next_clastyp = CLASCPD;            // DMA CP D
       default : 	next_clastyp = 3'b111;             // to satisfy vlint
	 endcase // case(pkttyp)
  end // always @ (pkttyp) 
   

// Context Check
always @( rst_l or ctx_order_bits or pipe_pktseq_num or pipe_clastyp 
          or ctx_ck)
  if(rst_l == 1'b0) begin
	 store_pkt = 1'b0;
	 frwd_pkt = 1'b0;
  end
  else begin
	 case({pipe_clastyp,ctx_ck})  // synopsys parallel_case
	   {CLASCP , 1'b1},
       {CLASCPD, 1'b1} : begin
		  if(pipe_pktseq_num == 0) begin
			 store_pkt = 1'b0;			 
			 frwd_pkt = 1'b1;
		  end
		  else begin
			 if ((ctx_order_bits[pipe_pktseq_num] == 1'b1) 
                  && (ctx_order_bits[pipe_pktseq_num - 1'b1] == 1'b0)) begin
				store_pkt = 1'b0;				
				frwd_pkt = 1'b1;
			 end
			 else begin
				store_pkt = 1'b1;				
				frwd_pkt = 1'b0;
			 end
		  end // else: !if(pipe_pktseq_num == 0)
	   end // case: 1'b1	   
	   default : begin
		  store_pkt = 1'b0;		  
		  frwd_pkt = 1'b0;		  
	   end
	 endcase // case(ctx_ck)
  end // else: !if(rst_l == 1'b0)   

   
// Order Bit updates
always @(pipe_pktseq_num)
  begin
	 upd_order_bits = {32{1'b1}};	 
	 upd_order_bits[pipe_pktseq_num] = 1'b0;
  end   

always @(scan_pkseq_num)
  begin
	 scan_order_bits = {32{1'b1}};	 
	 scan_order_bits[scan_pkseq_num] = 1'b0;
  end   
   

// Parse Packet Record to issue  Retire Records or Context ops
// pipelined next retire record staging
   
always @(next_clastyp or pkttyp or pktlen or pktdwbe or pktaddr or 
         pkttr_tag or pktdptr or pktseq_num or pktcntxt_num)
  begin
	 next_rrtyp  = 0;
	 next_rrlen  = 0;
	 next_rrdwbe = 0;
	 next_rraddr = 0;
	 next_rrsbdtag = 0;
	 next_rrdptr = 0;
	 next_pktseq_num = 0;
	 next_pktcntxt_num = 0;

	 case(next_clastyp)       // synopsys full_case parallel_case

	   CLASPIO: begin     // All PIO's
		  next_rrtyp = pkttyp[PRTYPMSB :0];
		  next_rrlen =  pktlen[PRLENMSB :0];
		  next_rrdwbe = pktdwbe[PRDWBEMSB :0];
		  next_rraddr = pktaddr[PRADDRMSB :0];
		  next_rrsbdtag = pkttr_tag[PRSBDTAGMSB :0];
		  next_rrdptr = pktdptr[PRDPTRMSB :0];
		  next_pktseq_num = 0;
	      next_pktcntxt_num = 0;
	   end	   

	   CLASMDO : begin     // Mondo Rpy
		  next_rrtyp = pkttyp[PRTYPMSB :0];
		  next_rrlen =  pktlen[PRLENMSB :0];
		  next_rrdwbe = pktdwbe[PRDWBEMSB :0];
		  next_rraddr = pktaddr[PRADDRMSB :0];
		  next_rrsbdtag = pkttr_tag[PRSBDTAGMSB :0];
		  next_rrdptr = pktdptr[PRDPTRMSB :0];
		  next_pktseq_num = 0;
	      next_pktcntxt_num = 0;
	   end	   
	   
	   CLASCP,             // DMA CP
       CLASCPD   : begin   // DMA CP D
		  next_rrtyp  = pkttyp[PRTYPMSB :0];
		  next_rrlen =  pktlen[PRLENMSB :0];
		  next_rrdwbe = pktdwbe[PRDWBEMSB :0];
		  next_rraddr = pktaddr[PRADDRMSB :0];
		  next_rrsbdtag = pkttr_tag[PRSBDTAGMSB :0];
		  next_rrdptr = pktdptr[PRDPTRMSB :0];
		  next_pktseq_num = pktseq_num[PRPKSEQNUMMSB :0];
	      next_pktcntxt_num = pktcntxt_num[PRCNTXTNUMMSB :0];
	   end	  

       CLASUSP   : begin   // Unsup CP
		  next_rrtyp  = pkttyp[PRTYPMSB :0];
		  next_rrlen =  pktlen[PRLENMSB :0];
		  next_rrdwbe = {pktdwbe[PRDWBEMSB :5],1'b1,pktdwbe[3 :0]};
		  next_rraddr = pktaddr[PRADDRMSB :0];
		  next_rrsbdtag = pkttr_tag[PRSBDTAGMSB :0];
		  next_rrdptr = pktdptr[PRDPTRMSB :0];
		  next_pktseq_num = pktseq_num[PRPKSEQNUMMSB :0];
	      next_pktcntxt_num = pktcntxt_num[PRCNTXTNUMMSB :0];
	   end	   

	   default begin
          next_rrtyp  = 0;
		  next_rrlen = 0;
		  next_rrdwbe = 0;
		  next_rraddr = 0;
		  next_rrsbdtag = 0;
		  next_rrdptr = 0;  
		  next_pktseq_num = 0;
	      next_pktcntxt_num = 0;
	   end	   
	endcase // case(next_clastyp)
  end // always @ (next_clastyp or pkttyp or pktlen or pktdwbe or pktaddr or...

// Class Type pipeline stage  
always @(posedge clk)
  begin			  
	if (rst_l == 1'b0) begin
	   scan_mode <= 0;
	end
	else begin
   	   scan_mode <= look_up ? 1'b1 : (~stop_scan & scan_mode);
	end
  end 

always @(posedge clk)
	if(~rst_l) begin
	 pipe_rrtyp        <= {RRTYP_WDTH{1'b0}};
	 pipe_rrlen        <= {RRLEN_WDTH{1'b0}};
	 pipe_rrdwbe       <= {RRFDWBE_WDTH + RRLDWBE_WDTH{1'b0}};
	 pipe_rraddr       <= {RRADDR_WDTH{1'b0}};
	 pipe_rrsbdtag     <= {RRSBDTAG_WDTH{1'b0}};
	 pipe_rrdptr       <= {RRDPTR_WDTH{1'b0}};
	 pipe_pktseq_num   <= {PRPKSEQNUM_WDTH{1'b0}};
	 pipe_pktcntxt_num <= {PRCNTXTNUM_WDTH{1'b0}};
	 pipe_clastyp      <= {3{1'b0}};
	end
  else begin
	 pipe_rrtyp        <= ld_pipe ? next_rrtyp        : pipe_rrtyp;	   
	 pipe_rrlen        <= ld_pipe ? next_rrlen        : pipe_rrlen;	   
	 pipe_rrdwbe       <= ld_pipe ? next_rrdwbe       : pipe_rrdwbe;	   
	 pipe_rraddr       <= ld_pipe ? next_rraddr       : pipe_rraddr;	   
	 pipe_rrsbdtag     <= ld_pipe ? next_rrsbdtag     : pipe_rrsbdtag;	   
	 pipe_rrdptr       <= ld_pipe ? next_rrdptr       : pipe_rrdptr;	   
	 pipe_pktseq_num   <= ld_pipe ? next_pktseq_num   : pipe_pktseq_num;	   
	 pipe_pktcntxt_num <= ld_pipe ? next_pktcntxt_num : pipe_pktcntxt_num;
	 pipe_clastyp      <= ld_pipe ? next_clastyp      : pipe_clastyp;
  end // always @ (posedge clk)

// Record Dequeue
// State machine 
   
// DEQ next state
always @(deq_state or pkmpty or pipe_full or rm2cm_rcd_full)
  begin
    case(deq_state)	// synopsys parallel_case
      DEQIDLE : begin
         case(pkmpty) // synopsys full_case parallel_case
          1'b1: deq_next = DEQIDLE;
          1'b0: begin
			 case(pipe_full | rm2cm_rcd_full)  // synopsys full_case parallel_case
			   1'b1 : deq_next = DEQIDLE;
			   1'b0 : deq_next = DEQ;
			 endcase // case(pipe_full | rm2cm_rcd_full)
		  end		   
		 endcase // case(pkmpty)		 
	  end // case: DEQIDLE

      DEQ : begin
		  deq_next = DEQIDLE;
	  end // case: DEQ

	  default : deq_next = DEQIDLE;
	  
	endcase // case(deq_state)
  end // always @ (deq_state or pkmpty or pipe_full)   
   
// DEQ state machine outputs
always @(deq_state or pipe_full or pkmpty or next_clastyp or 
         rm2cm_rcd_full)
  begin
    case(deq_state)	// synopsys parallel_case
      DEQIDLE : begin
        case(pkmpty) // synopsys full_case parallel_case
          1'b1: begin
			 ld_pipe   = 1'b0;
			 next_pkvld = 1'b0;
			 next_deq_pkr = 1'b0;
		  end
          1'b0: begin
			 next_deq_pkr = 1'b0;
			 case(pipe_full | rm2cm_rcd_full)  // synopsys full_case parallel_case
			   1'b1 : begin
				  ld_pipe   = 1'b0;
				  next_pkvld = 1'b0;
			   end			   
			   1'b0 : begin
				  ld_pipe   = 1'b1;
				  case(next_clastyp) // synopsys parallel_case
                    CLASUSP,
					CLASPIO,
					CLASMDO : next_pkvld = 1'b0;
					CLASCP ,
					CLASCPD : next_pkvld = 1'b1;
					default : next_pkvld = 1'b0;
				  endcase // case(next_clastyp)				  
			   end
			 endcase // case(pipe_full | rm2cm_rcd_full)
		  end // case: 1'b0		  
		endcase // case(pkmpty)
	  end // case: DEQIDLE	  
	  
	  DEQ : begin
		 ld_pipe   = 1'b0;
		 next_pkvld = 1'b0;
		 next_deq_pkr = 1'b1;
	  end

	  default: begin
		 next_deq_pkr = 1'b0;
		 ld_pipe   = 1'b0;
		 next_pkvld = 1'b0;
	  end

 	endcase // case(deq_state)
  end // always @ (deq_state or pipe_full or next_clastyp)   

// DEQ state transitions
always @(posedge clk)
  begin
	 if (rst_l == 1'b0)
	   deq_state <= DEQIDLE;	// Synchronous Reset
	 else begin
		deq_state <= deq_next;
	 end
  end
   
// Context look-up  (ctx_upd fsm)
always @(ctx_state or pkvld or store_pkt or frwd_pkt or last_in_pkt
         or last_scan_pkt or cpl or do_pkseq or scan_mode or
         rm2cm_rcd_full)
  begin
    case(ctx_state)	// synopsys parallel_case
      CTXIDLE : begin
		 case(pkvld)   // synopsys full_case parallel_case
		   1'b0: ctx_next = CTXIDLE;
		   1'b1: ctx_next = CTXSEQ;
		 endcase // case(pkvld)		 
	  end // case: CTXIDLE

	  CTXSEQ : begin
		 case(scan_mode) // synopsys full_case parallel_case
		   1'b1 : begin
			  if(last_scan_pkt) ctx_next = CTXIDLE;
			  else ctx_next = CTXCHK;
		   end // case: 1'b1
		   1'b0 : ctx_next = CTXCHK;
		 endcase // case(scan_mode)		 
	  end // case: CTXSEQ	  
	  
	  CTXCHK : begin
		 case(rm2cm_rcd_full) // synopsys full_case parallel_case
		   1'b1 : ctx_next = CTXCHK;
		   1'b0 : ctx_next = CTXDIS;
		 endcase // case(rm2cm_rcd_full)		 
	  end // case: CTXCHK
	  	  
	  CTXDIS : begin
		 case(scan_mode)    // synopsys full_case parallel_case
		   1'b0 : begin
			  case({store_pkt,frwd_pkt}) // synopsys parallel_case
				2'b01 : begin
				   if(last_in_pkt) ctx_next = CTXIDLE;
				   else ctx_next = CTXNXT;
				end // case: 2'b01
				2'b10 : begin                // wait for lst gnt?
				   if (do_pkseq) ctx_next = CTXIDLE;
				   else ctx_next = CTXDIS;
				end // case: 2'b10
				default : ctx_next = CTXIDLE;
			  endcase // case({store_pkt,frwd_pkt})
		   end // case: 1'b0
		   
		   1'b1 : begin
			  case(cpl) // synopsys full_case parallel_case
				1'b1: ctx_next = CTXSEQ;
				1'b0: begin
				   case (pkvld) // synopsys full_case parallel_case
					 1'b1: ctx_next = CTXSEQ;
					 1'b0: ctx_next = CTXIDLE;
				   endcase // case(pkvld)
				end
			  endcase // case(cpl)
		   end // case: 1'b1		   
		 endcase // case(scan_mode)
	  end // case: CTXDIS	  

	 CTXNXT : ctx_next = CTXSEQ;
	  
	 default : ctx_next = CTXIDLE;        // to satisfy vlint
	endcase // case(ctx_state)
  end // always @ (ctx_state or pkvld or store_pkt or frwd_pkt or last_in_pkt...   


// Context look-up  (ctx_upd fsm)
always @(ctx_state or pkvld or store_pkt or frwd_pkt or last_in_pkt
         or last_scan_pkt or cpl or do_pkseq or scan_mode)
  begin
    case(ctx_state)	// synopsys parallel_case
      CTXIDLE : begin
		 case(pkvld)   // synopsys full_case parallel_case
		   1'b0: begin
			  next_ctx_ck = 1'b0;
			  next_clist_put = 1'b0;
			  do_next_pkt = 1'b0;
			  look_up = 1'b0;
			  do_ctx = 1'b0;
			  stop_scan = 1'b0;
			  xfr_strt = 1'b0;
			  clear_pkvld = 1'b0;
			  next_ctx_addr = 1'b0;			  
			  
		   end
		   1'b1: begin
			  next_ctx_ck = 1'b1;
			  next_clist_put = 1'b0;
			  do_next_pkt = 1'b0;
			  look_up = 1'b0;
			  do_ctx = 1'b0;
			  stop_scan = 1'b0;
			  xfr_strt = 1'b0;
			  clear_pkvld = 1'b0;
			  next_ctx_addr = 1'b0; //next_ctx_addr = 1'b1;
		   end
		 endcase // case(pkvld)		 
	  end // case: CTXIDLE

	  CTXSEQ : begin
		 next_clist_put = 1'b0;
		 do_ctx = 1'b0;
		 clear_pkvld = 1'b0;
		 case(scan_mode) // synopsys full_case parallel_case
		   1'b1 : begin
			  case(last_scan_pkt) // synopsys full_case parallel_case
				1'b1: begin
				 next_ctx_ck = 1'b0;
				 do_next_pkt = 1'b0;
				 look_up = 1'b0;
				 xfr_strt = 1'b0;
				 stop_scan = 1'b1;
				 next_ctx_addr = 1'b0;
			  	end
				1'b0 : begin
				 next_ctx_ck = 1'b0; //	next_ctx_ck = 1'b1;
				 do_next_pkt = 1'b1;
				 look_up = 1'b1;
				 stop_scan = 1'b0;
				 xfr_strt = 1'b0;
				 next_ctx_addr = 1'b0;
				end
			  endcase // case(last_scan_pkt)
		   end // case: 1'b1
		   1'b0 : begin
			  next_ctx_ck = 1'b1;
			  do_next_pkt = 1'b1;
			  look_up = 1'b0;
			  stop_scan = 1'b0;
			  xfr_strt = 1'b0;
			  next_ctx_addr = 1'b1;
		   end
		 endcase // case(scan_mode)
	  end // case: CTXSEQ	  
	  
	  CTXCHK : begin
		 do_ctx = 1'b0;
		 xfr_strt = 1'b0;
		 do_next_pkt = 1'b0;
		 look_up = 1'b0;
		 clear_pkvld = 1'b0;
		 next_ctx_addr = 1'b0;
		 case(scan_mode) // synopsys full_case parallel_case
		   1'b1 : next_ctx_ck = 1'b0;
		   1'b0 : next_ctx_ck = 1'b1;
		   endcase // case(scan_mode)

		 next_clist_put = 1'b0;
		 stop_scan = 1'b0;
	  end // case: CTXCHK
	  	  
	  CTXDIS : begin
		 case(scan_mode)    // synopsys full_case parallel_case
		   1'b0 : begin
			  next_ctx_addr = 1'b0;
			  case({store_pkt,frwd_pkt}) // synopsys parallel_case
				2'b01 : begin
				   next_ctx_ck = 1'b1;
				   next_clist_put = 1'b0;
				   do_next_pkt = 1'b0;
				   do_ctx = 1'b1;
				   look_up = 1'b0;
				   xfr_strt = 1'b1;
				   clear_pkvld = 1'b1;
				   case(last_in_pkt) // synopsys full_case parallel_case
					 1'b1 : stop_scan = 1'b1;
					 1'b0 : stop_scan = 1'b0;
				   endcase // case(last_in_pkt)
				end // case: 2'b01
				2'b10 : begin                // wait for lst gnt?
				   clear_pkvld = 1'b1;
				   case(cpl) // synopsys full_case parallel_case
				   1'b0 : begin
					  next_ctx_ck = 1'b1;
					  next_clist_put = 1'b1;
					  do_next_pkt = 1'b0;
					  look_up = 1'b0;
					  do_ctx = 1'b0;
					  xfr_strt = 1'b0;					
					  case(do_pkseq) // synopsys full_case parallel_case
						1'b1 : stop_scan = 1'b1;
						1'b0 : stop_scan = 1'b0;
					  endcase // case(do_pkseq)					  
				   end
				   1'b1 : begin
					  next_ctx_ck = 1'b1;					  
					  next_clist_put = 1'b0;
					  do_next_pkt = 1'b0;
					  look_up = 1'b0;
					  do_ctx = 1'b0;
					  xfr_strt = 1'b0;
					  case(do_pkseq) // synopsys full_case parallel_case
						1'b1 : stop_scan = 1'b1;
						1'b0 : stop_scan = 1'b0;
					  endcase // case(do_pkseq)					  
				   end // case: 1'b1
				   endcase // case(cpl)
				end // case: 2'b10

				default : begin
				   next_ctx_ck = 1'b0;
				   next_clist_put = 1'b0;
				   do_next_pkt = 1'b0;
				   look_up = 1'b0;
				   do_ctx = 1'b0;
				   stop_scan = 1'b0;
				   xfr_strt = 1'b0;
				   clear_pkvld = 1'b0;
				end
			  endcase // case({store_pkt,frwd_pkt})
		   end // case: 1'b0
		   
		   1'b1 : begin
			  clear_pkvld = 1'b0;
			  case(cpl) // synopsys full_case parallel_case
				1'b1 : begin
				   next_ctx_ck = 1'b0;
				   next_clist_put = 1'b0;
				   do_next_pkt = 1'b0;
				   do_ctx = 1'b1;
				   xfr_strt = 1'b1;
				   look_up = 1'b1;
				   stop_scan = 1'b0;
				   next_ctx_addr = 1'b0;
				end
				1'b0 : begin
				   next_ctx_ck = 1'b0;
				   next_clist_put = 1'b0;
				   do_next_pkt = 1'b0;
				   do_ctx = 1'b0;     // do_ctx = 1'b1;
				   xfr_strt = 1'b0;   // xfr_strt = 1'b1;
				   look_up = 1'b0;
				   stop_scan = 1'b1;
				   case (pkvld) // synopsys full_case parallel_case
					 1'b1: next_ctx_addr = 1'b1;
					 1'b0: next_ctx_addr = 1'b0;
				   endcase // case(pkvld)				   
				end
			  endcase // case(cpl)			  
		   end // case: 1'b1
		 endcase // case(scan_mode)
	  end // case: CTXDIS	  

	 CTXNXT : begin
		next_ctx_ck = 1'b0;      // do not check incoming pkseq, get frm clist
		next_clist_put = 1'b0;
		do_next_pkt = 1'b0;
		look_up = 1'b1;
		do_ctx = 1'b0;
		stop_scan = 1'b0;
		xfr_strt = 1'b0;
		clear_pkvld = 1'b0;
		next_ctx_addr = 1'b0;
	 end	  
	  
	 default : begin                     // to satisfy vlint
		next_ctx_ck = 1'b0;
		next_clist_put = 1'b0;
		do_next_pkt = 1'b0;
		look_up = 1'b0;
		do_ctx = 1'b0;
		stop_scan = 1'b0;
		xfr_strt = 1'b0;
		clear_pkvld = 1'b0;
		next_ctx_addr = 1'b0;
	 end	  
	endcase // case(ctx_state)
  end // always @ (ctx_state or next_pkvld or store_pkt or frwd_pkt or last_pkt...   
				   
 // CTX state transitions
always @(posedge clk)
  begin
    if (rst_l == 1'b0)
      ctx_state <= CTXIDLE;	// Synchronous Reset
    else begin
      ctx_state <= ctx_next;
	end
  end


// CLIST Egress Packet Put FSM (lst_upd)
always @(lst_state or ctx2tcm_lst_gnt or next_clist_put)
  begin
	 do_lst = 1'b0;
	 do_pkseq = 1'b0;	 
	 next_lst_req = 1'b0;	 
     lst_next = lst_state;
     
    case(lst_state)	// synopsys parallel_case
      LSTIDLE : begin
		 case(next_clist_put)   // synopsys full_case parallel_case
		   1'b0: begin
			  do_lst = 1'b0;
			  do_pkseq = 1'b0;
			  next_lst_req = 1'b0;
			  lst_next = LSTIDLE;
		   end
		   1'b1: begin
			  do_lst = 1'b0;
			  do_pkseq = 1'b0;
			  next_lst_req = 1'b1;
			  lst_next = LSTGNT;
		   end
		 endcase // case(next_clist_put)		 
	  end // case: LSTIDLE	  
	  
     LSTGNT : begin
		case(ctx2tcm_lst_gnt)   // synopsys full_case parallel_case
		   1'b0: begin
			  do_lst = 1'b0;
			  do_pkseq = 1'b0;
			  next_lst_req = 1'b1;
			  lst_next = LSTGNT;
		   end
		   1'b1: begin
			  do_lst = 1'b0;
			  do_pkseq = 1'b0;
			  next_lst_req = 1'b0;
			  lst_next = LSTUPD;
		   end
		endcase // case(ctx2tcm_lst_gnt)		
	 end // case: LSTGNT	  	
     LSTUPD : begin		
		do_lst = 1'b1;
		do_pkseq = 1'b1;
		next_lst_req = 1'b0;
		lst_next = LSTIDLE;
	 end	  
     default : begin                     // to satisfy vlint
		do_lst = 1'b0;
		do_pkseq = 1'b0;
		next_lst_req = 1'b0;
		lst_next = LSTIDLE;
	 end	  
	endcase // case(lst_state)	 
  end // always @ (lst_state or ctx2tcm_lst_gnt or next_clist_put)   


// LST state transitions
always @(posedge clk)
  begin
    if (rst_l == 1'b0)
      lst_state <= LSTIDLE;	// Synchronous Reset
    else begin
      lst_state <= lst_next;
	end
end      
   
// *************** Build Context Procedures (build_cntx)*********/
// Packet Record Dequeue Process
// packet record dequeue state machine (dq_fsm)   

// Parse Schedule Record to issue Packet Records
// lengths are represented in DW's
   
// Context Build Process (build_cntx)
// Transfer State machine

// BLD next state   
always @(bld_state or pipe_mpty or rm2cm_rcd_full or pipe_clastyp 
         or xfr_strt or last_in_pkt or last_scan_pkt or stop_scan 
         or scan_mode)
  begin
    case(bld_state)	// synopsys full_case parallel_case
      BLDIDLE : begin
		 case(pipe_mpty) // synopsys full_case parallel_case
		   1'b1 : bld_next = BLDIDLE;
		   1'b0 : begin
			  case(pipe_clastyp)  // synopsys parallel_case
                CLASUSP,
				CLASPIO,
				CLASMDO : bld_next = BLDBPAS;
				CLASCP ,
				CLASCPD : bld_next = BLDCNTX;
				default : bld_next = BLDIDLE;
			  endcase // case(next_clastyp)
		   end
		 endcase // case(pipe_mpty)		 
	  end // case: BLDDEQ	  
	 
     BLDCNTX : begin
		case(rm2cm_rcd_full) // synopsys full_case parallel_case
		  1'b0 : begin
			 case({scan_mode,xfr_strt})	// synopsys full_case parallel_case
			   2'b00 : begin
				  case(stop_scan) // synopsys full_case parallel_case
					1'b1 : bld_next = BLDIDLE;
					1'b0 : bld_next = BLDCNTX;
				  endcase // case({stop_scan,pipe_mpty})				  
			   end
			   2'b01 : begin
				  case({pipe_clastyp, last_in_pkt})  // synopsys parallel_case
					{CLASCP, 1'b0},
					{CLASCPD,1'b0} : bld_next = BLDCNTX;	 
					{CLASCP, 1'b1},
					{CLASCPD,1'b1} : bld_next = BLDIDLE;
					default : bld_next = BLDIDLE; 
				  endcase // case({pipe_clastyp, last_in_pkt})				  
			   end // case: 2'b01

			   2'b10 : begin
				  case(stop_scan)  // synopsys full_case parallel_case
					1'b1 : bld_next = BLDIDLE;
					1'b0 : bld_next = BLDCNTX;
				  endcase // case(stop_scan)
			   end
			   2'b11 : begin
				  case(last_scan_pkt) // synopsys full_case parallel_case
					1'b1 : bld_next = BLDIDLE;
					1'b0 : begin
					   case(stop_scan)  // synopsys full_case parallel_case
						 1'b1 : bld_next = BLDIDLE;
						 1'b0 : bld_next = BLDCNTX;
						 endcase // case(stop_scan)
					end					
				  endcase // case(last_scan_pkt)				  
			   end
			 endcase // case({scan_mode,xfr_strt})
		  end // case: 1'b0

		  1'b1 : bld_next = BLDCNTX;
		endcase // case(rm2cm_rcd_full)
	 end // case: BLDCNTX
	  
     BLDBPAS : begin
		case(rm2cm_rcd_full) // synopsys full_case parallel_case
		  1'b0 : bld_next = BLDIDLE;
		  1'b1 : bld_next = BLDBPAS;
		endcase // case(rm2cm_rcd_full)
	 end // case: BLDBPAS	  
	  	  
    default : bld_next = BLDIDLE;
	  
	endcase // case(bld_state)
  end // always @ (bld_state or pkmpty or rm2cm_rcd_full or next_clastyp...

// BLD state machine outputs   
always @(bld_state or rm2cm_rcd_full or pipe_clastyp or xfr_strt 
         or last_in_pkt or last_scan_pkt or stop_scan or scan_mode)
  begin

// next_deq_pipe signal to dequeue next packet record in pipeline
// next_gen_pkt signal to start retire record build
// next_rcd_enq enqueues packet to pipeline
     
    case(bld_state)	// synopsys full_case parallel_case
     BLDIDLE : begin
		next_deq_pipe = 1'b0;
		next_gen_pkt = 1'b0;
		next_rcd_enq = 1'b0;
	  end
     BLDCNTX : begin
		case(rm2cm_rcd_full) // synopsys full_case parallel_case
		  1'b0 : begin
			 case({scan_mode,xfr_strt})	// synopsys full_case parallel_case
			   2'b00 : begin
				  next_gen_pkt = 1'b0;
				  next_rcd_enq = 1'b0;
				  case(stop_scan) // synopsys full_case parallel_case
					1'b1 : next_deq_pipe = 1'b1;
					1'b0 : next_deq_pipe = 1'b0;
				  endcase // case(stop_scan)				  
			   end // case: 2'b00

			   2'b01 : begin
				  case({pipe_clastyp, last_in_pkt})  // synopsys parallel_case
					{CLASCP, 1'b0},
					{CLASCPD,1'b0} : begin
					   next_deq_pipe = 1'b1;
					   next_rcd_enq = 1'b1;
					   next_gen_pkt = 1'b1;
					end					   
					{CLASCP, 1'b1},
					{CLASCPD,1'b1} : begin
					   next_deq_pipe = 1'b1;
					   next_rcd_enq = 1'b1;
					   next_gen_pkt = 1'b1;
					end
					default : begin
					   next_deq_pipe = 1'b0;
					   next_rcd_enq = 1'b0;
					   next_gen_pkt = 1'b0;
					end
				  endcase // case({pipe_clastyp, last_in_pkt})				  
			   end // case: 2'b01			   
			   2'b10 : begin
				  next_rcd_enq = 1'b0;
				  next_gen_pkt = 1'b0;
				  next_deq_pipe = 1'b0;
			   end
			   2'b11 : begin
				  case(last_scan_pkt) // synopsys full_case parallel_case
					1'b1 : begin
					   next_deq_pipe = 1'b1;
					   next_gen_pkt = 1'b1;
					   next_rcd_enq = 1'b1;
					end					
					1'b0 : begin
					   case(stop_scan) // synopsys full_case parallel_case
						 1'b1 : begin
							next_deq_pipe = 1'b1;
							next_gen_pkt = 1'b0;
							next_rcd_enq = 1'b0;
						 end						 
						 1'b0 : begin
							next_deq_pipe = 1'b0;
							next_gen_pkt = 1'b1;
							next_rcd_enq = 1'b1;
						 end
						endcase // case(stop_scan)
					end
				  endcase // case(last_scan_pkt)				  
			   end			   
			 endcase // case({scan_mode,xfr_strt})
		  end // case: 1'b0		  

		  1'b1 : begin
			 next_deq_pipe = 1'b0;
			 next_gen_pkt = 1'b0;
			 next_rcd_enq = 1'b0;
		  end
		endcase // case(rm2cm_rcd_full)
	 end // case: BLDCNTX
	  
     BLDBPAS : begin
		next_gen_pkt = 1'b0;
		case(rm2cm_rcd_full) // synopsys full_case parallel_case
		   1'b0 : begin
			  next_rcd_enq = 1'b1;
			  next_deq_pipe = 1'b1;
		   end		  
		   1'b1 : begin
			  next_rcd_enq = 1'b0;
			  next_deq_pipe = 1'b0;
		   end		  
		 endcase // case(rm2cm_rcd_full)
		end // case: BLDBPAS

	  default : begin		 
		 next_deq_pipe = 1'b0;
		 next_gen_pkt = 1'b0;
		 next_rcd_enq = 1'b0;
	  end	  
	endcase // case(bld_state)	 
  end // always @ (bld_state or pkmpty or rm2cm_rcd_full or next_clastyp...
   

// BLD state transitions
always @(posedge clk)
  begin
	 if (rst_l == 1'b0)
	   bld_state <= BLDIDLE;	// Synchronous Reset
	 else begin
		bld_state <= bld_next;
	 end
  end    

//************************************************
//				MODULES
//************************************************

dmu_cmu_tcm_pkrcd_q tcm_queue (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (cl2cm_rcd_enq),
		.rcd_in (cl2cm_rcd),
        .deq (next_deq_pkr), 
        .typ (pkttyp),
        .len(pktlen),
        .dwbe (pktdwbe),
        .addr(pktaddr),
        .sbd_tag(pkttr_tag),
        .dptr(pktdptr),
        .cntxt_num(pktcntxt_num),
        .pkseq_num(pktseq_num),
		.full (cm2cl_rcd_full),
        .empty (pkmpty),
        .overflow(),     // .overflow(overflow),
        .underflow()    // .underflow(underflow)
		);


// ********************** signal registers *************************/
// Release records

always @(posedge clk)
  begin
	 if (!rst_l) begin
		 ctx_sel      <= 0;		 
		 ctx_relrcd   <= 0;		
		 pkseq_sel    <= 0;
		 pkseq_relrcd <= 0;
		 clst_sel     <= 0;		 
		 clst_relrcd  <= 0;
	 end
	 else begin
		case(bld_state)   // synopsys parallel_case
		  BLDIDLE : begin               // BLDIDLE
			 ctx_sel      <= 0;
			 ctx_relrcd   <= ld_pipe ? pipe_pktcntxt_num : ctx_relrcd;
			 pkseq_sel    <= 0;
			 pkseq_relrcd <= tcm2ctx_ctx[PSEQMSB : PSEQLSB];
			 clst_sel     <= 0;
			 clst_relrcd  <= 0;
		  end

		  BLDCNTX : begin              // BLDCNTX
			 case({next_gen_pkt, scan_mode})  // synopsys parallel_case
			   2'b10 : begin
				  ctx_sel      <= last_pkt;
				  ctx_relrcd   <= pipe_pktcntxt_num;
				  pkseq_sel    <= 1'b1;
				  pkseq_relrcd <= tcm_cur_ctx[PSEQMSB : PSEQLSB] + pipe_pktseq_num;
				  clst_sel     <= 1'b0;
				  clst_relrcd  <= tcm2ctx_ctxlst_addr;
			   end
			   2'b11 : begin
				  ctx_sel      <= ctx2tcm_cur_lst[CLSTPKTMSB];
				  ctx_relrcd   <= ctx_relrcd;
				  pkseq_sel    <= 1'b1;
				  pkseq_relrcd <= tcm2ctx_pkseq_addr; // tcm_cur_ctx[PSEQMSB : PSEQLSB] + scan_pkseq_num;
				  clst_sel     <= 1'b1;
				  clst_relrcd  <= tcm2ctx_ctxlst_addr;
			   end
			   default : begin
				  ctx_sel      <= ctx_sel;
				  ctx_relrcd   <= ctx_relrcd;
				  pkseq_sel    <= pkseq_sel;
				  pkseq_relrcd <= pkseq_relrcd;
				  clst_sel     <= clst_sel;
				  clst_relrcd  <= clst_relrcd;
			   end
			   endcase // case({next_gen_pkt, scan_mode})
			 end // case: BLDCNTX

		  BLDBPAS : begin              // BLDBPAS
			 ctx_sel      <= ctx_sel;
			 ctx_relrcd   <= ctx_relrcd;
			 pkseq_sel    <= pkseq_sel;
			 pkseq_relrcd <= pkseq_relrcd;
			 clst_sel     <= clst_sel;
			 clst_relrcd  <= clst_relrcd;
		  end

		  default : begin
			 ctx_sel      <= ctx_sel;
			 ctx_relrcd   <= ctx_relrcd;
			 pkseq_sel    <= pkseq_sel;
			 pkseq_relrcd <= pkseq_relrcd;
			 clst_sel     <= clst_sel;
			 clst_relrcd  <= clst_relrcd;
		  end
		endcase // case(bld_state)
	 end // else: !if(!rst_l)
  end // always @ (posedge clk)
   
   

always @(posedge clk)
  begin	 
    if (rst_l == 1'b0) begin
       hld_pkvld <= 0;
	   pipe_full <= 0;	   

	   ctx_ck <= 0;	    
	   
	   cm2rm_rcd_enq <= 0;	   

	   tcm2ctx_ctx_addr_hld <= 0;	   
	   tcm2ctx_ctx_rw <= 0;
       tcm2ctx_ctx <= 0;	

	   tcm2ctx_pkseq_addr <= 0;	   
	   tcm2ctx_pkseq <= 0;
	   tcm2ctx_pkseq_rw <= 0;


	   tcm2ctx_ctxlst_addr <= 0;
	   tcm2ctx_lst <= 0;
	   tcm2ctx_clst_rw <= 0;

	   tcm2ctx_lst_req <= 0;	   
	   tcm2ctx_ctxlst_addr <= 0;
	   tcm2ctx_lst <= 0;
	   tcm2ctx_clst_rw <= 0;

       do_next_lst <= 0;

	   tcm_cur_ctx <= 0;

	   last_in_pkt <= 0;

	   tcm2ctx_ret_req <= 0;
	   tcm2ctx_ret_addr <= 0;	   

	   cpl <= 0;
	   
	end	 

    else begin
       hld_pkvld <= next_pkvld ? 1'b1 : (~clear_pkvld & hld_pkvld);
       pipe_full <= ld_pipe ? 1'b1 : (~next_deq_pipe & pipe_full);
	   
	   ctx_ck <= next_ctx_ck;	   
   
	   cm2rm_rcd_enq <= next_rcd_enq;
	   
	   tcm2ctx_ctx_addr_hld <= (next_ctx_addr  
                            && ((pipe_clastyp == CLASCP) || (pipe_clastyp == CLASCPD))
   							&&  hld_pkvld) ? pipe_pktcntxt_num 
                                       : tcm2ctx_ctx_addr_hld;	   
	   tcm2ctx_ctx_rw <= do_ctx;

	   tcm2ctx_ctx <=  do_ctx
                       ? (scan_mode 
                          ? {tcm_cur_ctx[CTXARRAYMSB : ERRLSB],(scan_order_bits & ctx_order_bits)}
                          : {tcm_cur_ctx[CTXARRAYMSB : ERRLSB],new_order_bits}) 
                       : tcm2ctx_ctx;

	   case(do_next_pkt) // synopsys parallel_case
		 1'b1 : begin
			case ({scan_mode,store_pkt})    // synopsys parallel_case
			  2'b11,
			  2'b10 : tcm2ctx_pkseq_addr <= tcm2ctx_pkseq_addr + 1'b1;
			  2'b01 : tcm2ctx_pkseq_addr <= ctx2tcm_cur_ctx[PSEQMSB : PSEQLSB] + pipe_pktseq_num;
			  2'b00 : tcm2ctx_pkseq_addr <= ctx2tcm_cur_ctx[PSEQMSB : PSEQLSB] + pipe_pktseq_num;
			endcase // case({scan_mode,store_pkt})
		 end
		 1'b0 :  tcm2ctx_pkseq_addr <= tcm2ctx_pkseq_addr;
	   endcase // case(do_next_lst)	   

	   tcm2ctx_pkseq <=  do_pkseq ? {1'b1, tcm2ctx_ctxlst_addr} 
                                  : tcm2ctx_pkseq;
	   
	   tcm2ctx_pkseq_rw <= do_pkseq;


	   tcm2ctx_ctxlst_addr <= do_next_lst
                               ? ctx2tcm_cur_pkseq[PTRCLSTMSB : PTRCLSTLSB]
                               : (ctx2tcm_lst_gnt ? ctx2tcm_nxlst_addr 
                                                  : tcm2ctx_ctxlst_addr);
	   tcm2ctx_lst <= do_lst ? {pipe_rrtyp,
								pipe_rrlen,
								last_in_pkt,
								{4'h0,pipe_rrdwbe[(PRDWBEMSB -4) :0]},
								pipe_rraddr[11:0],
								pipe_rrsbdtag,
								pipe_rrdptr,
                                pipe_pktseq_num}  : tcm2ctx_lst;
	   
	   tcm2ctx_clst_rw <= do_lst;

	   tcm2ctx_lst_req <= next_lst_req;	   

       do_next_lst <= do_next_pkt;

       tcm_cur_ctx  <=  next_ctx_addr ? ctx2tcm_cur_ctx : tcm_cur_ctx;
	   
       last_in_pkt <= ((tcm_cur_ctx[PKTOTMSB :PKTOTLSB] - {1'b0,pipe_pktseq_num}) == 6'h01)
                          ? 1'b1 : 1'b0;
       last_scan_pkt <= (scan_mode == 1'b1)
                         ? (do_ctx ? ((tcm_cur_ctx[PKTOTMSB :PKTOTLSB] - {1'b0,scan_pkseq_num}) == 6'h01)
							       : last_scan_pkt)
                         : 1'b0;
	   tcm2ctx_ret_req <= cm2rm_rcd_enq;	   
	   tcm2ctx_ret_addr <= cm2rm_rcd_enq ? ({ctx_sel,ctx_relrcd,
                                             pkseq_sel,pkseq_relrcd,
                                             clst_sel,clst_relrcd})
	                                     : tcm2ctx_ret_addr;
	   cpl <= ctx2tcm_cur_pkseq[CBITMSB : CBITLSB];
	   
	end // else: !if(rst_l == 1'b0)	 
  end // always @ (posedge clk)

// ----------------------------------------------------------------------------
// Debug
// ----------------------------------------------------------------------------
always @ (dbg2tcm_dbg_sel_a or dbg2tcm_dbg_sel_b) 
  begin
	 dbg_sel[0] = dbg2tcm_dbg_sel_a;
	 dbg_sel[1] = dbg2tcm_dbg_sel_b;
  end
   
always @ (dbg_sel[0] or dbg_sel[1] or next_clastyp or next_pktseq_num or
          frwd_pkt or store_pkt or ctx_ck or scan_mode or stop_scan or 
          pipe_clastyp or pkmpty or pipe_full or next_pkvld or ld_pipe or 
          next_deq_pkr or deq_state or pipe_pktseq_num or do_pkseq or 
          last_in_pkt or ctx_state or pkvld or next_ctx_ck or tcm_is_idle or
          next_clist_put or do_next_pkt or look_up or do_ctx or xfr_strt or
          next_deq_pipe or next_gen_pkt or next_rcd_enq or rm2cm_rcd_full or 
          bld_state or next_lst_req or do_lst or lst_state 
		  )
  begin
	 for (i = 0; i < 2; i = i + 1) begin
		case (dbg_sel[i]) // synopsys infer_mux
		  3'b000: nxt_dbg_bus[i] = {next_clastyp,next_pktseq_num};
		  3'b001: nxt_dbg_bus[i] = {frwd_pkt,store_pkt,ctx_ck,scan_mode,stop_scan,pipe_clastyp};
		  3'b010: nxt_dbg_bus[i] = {tcm_is_idle,pkmpty,pipe_full,next_pkvld,ld_pipe,next_deq_pkr,deq_state};
		  3'b011: nxt_dbg_bus[i] = {pipe_clastyp,pipe_pktseq_num};
		  3'b100: nxt_dbg_bus[i] = {store_pkt,do_pkseq,last_in_pkt,scan_mode,pkvld,ctx_state};
		  3'b101: nxt_dbg_bus[i] = {pkvld,next_ctx_ck,next_clist_put,do_next_pkt,look_up,do_ctx,stop_scan,xfr_strt};
		  3'b110: nxt_dbg_bus[i] = {1'b0,next_deq_pipe,next_gen_pkt,next_rcd_enq,rm2cm_rcd_full,bld_state};		  
		  3'b111: nxt_dbg_bus[i] = {2'b00,next_lst_req,do_pkseq,do_lst,next_clist_put,lst_state};		  
		endcase // case(dbg_sel[i])
	 end // for (i = 0; i < 2; i = i + 1)
  end // always @ (dbg_sel[0] or dbg_sel[1] or...   
   

// ********************** Output Procedures ************************/

// Debug
always @ (posedge clk) begin
   if(rst_l == 1'b0) begin
    for (k = 0; k < 2; k = k + 1) begin
      dbg_bus[k] <= 8'h00;
    end
   end
   else begin
	  for (k = 0; k < 2; k = k + 1) begin
		 dbg_bus[k] <= nxt_dbg_bus[k];
	  end
   end
end // always @ (posedge clk)
 
// Pipeline stages for next retire record packet sequence
// Registered outputs for Retire Record outputs
   
always @(posedge clk)
	if(~rst_l) begin
		 rrtyp    <= {RRTYP_WDTH{1'b0}};
		 rrlen    <= {RRLEN_WDTH{1'b0}};
		 rrdwbe   <= {RRFDWBE_WDTH + RRLDWBE_WDTH{1'b0}};
		 rraddr   <= {RRADDR_WDTH{1'b0}};
		 rrsbdtag <= {RRSBDTAG_WDTH{1'b0}};
		 rrdptr   <= {RRDPTR_WDTH{1'b0}};
		end
  else begin	 
     case(bld_state)   // synopsys parallel_case
	  BLDIDLE : begin               // BLDIDLE
		 rrtyp    <= rrtyp;
		 rrlen    <= rrlen;
		 rrdwbe   <= rrdwbe;
		 rraddr   <= rraddr;
		 rrsbdtag <= rrsbdtag;
		 rrdptr   <= rrdptr;
	   end

	   BLDCNTX : begin              // BLDCNTX
		  case({next_gen_pkt, scan_mode})  // synopsys parallel_case
            2'b10 : begin
			   rrtyp    <= pipe_rrtyp;
			   rrlen    <= pipe_rrlen;
			   rrdwbe   <= ({pipe_rrdwbe[PRDWBEMSB : PRDWBEMSB -2],last_pkt
                             ,pipe_rrdwbe[(PRDWBEMSB -4) :0]});			   
			   rraddr   <= pipe_rraddr;
			   rrsbdtag <= pipe_rrsbdtag;
			   rrdptr   <= pipe_rrdptr;
			end
			
			2'b11 : begin
			   rrtyp    <= ctx2tcm_cur_lst[CTYPMSB :CTYPLSB];
			   rrlen    <= ctx2tcm_cur_lst[CLENMSB :CLENLSB];
			   rrdwbe   <= ({{ctx2tcm_cur_lst[CDWBEMSB : CDWBEMSB -3] | {3'b0, ctx2tcm_cur_lst[CLSTPKTMSB]}},
 			   			  ctx2tcm_cur_lst[(CDWBEMSB -4) : CDWBELSB]});					
			   rraddr   <= {22'h000000,ctx2tcm_cur_lst[CADDRMSB :CADDRLSB]};
			   rrsbdtag <= ctx2tcm_cur_lst[CSBDTAGMSB :CSBDTAGLSB];
			   rrdptr   <= ctx2tcm_cur_lst[CDPTRMSB :CDPTRLSB];
			end			
				 
			default : begin
			   rrtyp    <= rrtyp;
			   rrlen    <= rrlen;
			   rrdwbe   <= rrdwbe;
			   rraddr   <= rraddr;
			   rrsbdtag <= rrsbdtag;
			   rrdptr   <= rrdptr;
			end
		  endcase // case({next_gen_pkt, scan_mode})		  
	   end // case: BLDCNTX	   

	   BLDBPAS : begin              // BLDBPAS
		  rrtyp    <= next_rcd_enq ? pipe_rrtyp    : rrtyp;
		  rrlen    <= next_rcd_enq ? pipe_rrlen    : rrlen;
		  rrdwbe   <= next_rcd_enq ? pipe_rrdwbe   : rrdwbe;
		  rraddr   <= next_rcd_enq ? pipe_rraddr   : rraddr;
		  rrsbdtag <= next_rcd_enq ? pipe_rrsbdtag : rrsbdtag;
		  rrdptr   <= next_rcd_enq ? pipe_rrdptr   : rrdptr;
	   end
	   default : begin
		  rrtyp    <= rrtyp;
		  rrlen    <= rrlen;
		  rrdwbe   <= rrdwbe;
		  rraddr   <= rraddr;
		  rrsbdtag <= rrsbdtag;
		  rrdptr   <= rrdptr;
	   end
	 endcase // case(bld_state)
  end // always @ (posedge clk)   
   
always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin
	   tcm_is_idle <= 1'b1;	   
     end
    else begin
	   tcm_is_idle <= ((pkmpty == 1'b1) && (deq_state ==  DEQIDLE) &&
					   (ctx_state == CTXIDLE) && (lst_state == LSTIDLE) &&
                       (pipe_mpty == 1'b1) && (bld_state == BLDIDLE))
                      ? 1'b1 : 1'b0;
	end
  end // always @ (posedge clk)

// ***********************Assignments *****************************/

// Signal assignments
   assign pkt_clsts = pktdwbe[2:0];
   
   assign pipe_mpty = ~pipe_full;

   assign pkvld = next_pkvld | hld_pkvld;   
   
   assign last_pkt = last_in_pkt | last_scan_pkt;
   
   assign new_order_bits = (((pipe_clastyp == CLASCPD) || (pipe_clastyp == CLASCP)) 
                            && (frwd_pkt == 1'b1))
                           ? (upd_order_bits & ctx_order_bits)
                           : ctx_order_bits;

   assign ctx_order_bits = ctx2tcm_cur_ctx[ORDERBITMSB :ORDERBITLSB];

   assign scan_pkseq_num = ctx2tcm_cur_lst[CPKSEQMSB :0];
   
// Output assignments    
   assign cm2rm_rcd [RRMSB :0] = {                   // Egress Retire Record
								   rrtyp[RRTYPMSB :0],
								   rrlen[RRLENMSB :0],
								   rrdwbe[RRDWBEMSB :0],
								   rraddr[RRADDRMSB :0],
								   rrsbdtag[RRSBDTAGMSB :0],
								   rrdptr[RRDPTRMSB :0]
								   };
    assign  tcm2ctx_ctx_addr = (next_ctx_addr  
                            && ((pipe_clastyp == CLASCP) || (pipe_clastyp == CLASCPD))
   							&&  hld_pkvld) ? pipe_pktcntxt_num 
                                       : tcm2ctx_ctx_addr_hld;	   
// Debug
   assign tcm2dbg_dbg_a = dbg_bus[0];
   assign tcm2dbg_dbg_b = dbg_bus[1];   

endmodule 

