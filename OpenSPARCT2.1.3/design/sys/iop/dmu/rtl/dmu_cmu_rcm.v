// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu_rcm.v
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
module dmu_cmu_rcm (
		 clk, 	
		 rst_l,

      // Debug
		 dbg2rcm_dbg_sel_a,	
		 dbg2rcm_dbg_sel_b,	
		 rcm2dbg_dbg_a, 
		 rcm2dbg_dbg_b, 						 

      // MMU
         mm2cm_rcd_enq,
         mm2cm_rcd,
		 cm2mm_rcd_full,

      // PMU
         cm2pm_rcd_enq,
		 cm2pm_rcd,
		 pm2cm_rcd_full,

      // CTX
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

      // ILU  
         y2k_mps
		);
     
//************************************************
//				PARAMETERS
//************************************************

// Ingress Schedule Record Fields   
// parameter MM2CM_WDTH       = `FIRE_DLC_ISR_REC_WDTH;      //79
   parameter ISRMSB           = `FIRE_DLC_ISR_MSB;           // MM2CM_WDTH -1

   parameter SRTYP_WDTH      = `FIRE_DLC_ISR_TYP_WDTH,       // 7
			 SRLEN_WDTH      = `FIRE_DLC_ISR_LEN_WDTH,       //10
			 SRDWBE_WDTH     = `FIRE_DLC_ISR_DWBE_WDTH,      // 8
			 SRADDR_WDTH     = `FIRE_DLC_ISR_ADDR_WDTH,      //41
			 SRDPTR_WDTH     = `FIRE_DLC_ISR_DPTR_WDTH,      // 7
			 SRSBDTAG_WDTH   = `FIRE_DLC_ISR_SBDTAG_WDTH;    // 5

   parameter SRTYPMSB        =  SRTYP_WDTH -1,
			 SRLENMSB        =  SRLEN_WDTH -1,
			 SRDWBEMSB       =  SRDWBE_WDTH -1,
			 SRADDRMSB       =  SRADDR_WDTH -1,
			 SRDPTRMSB       =  SRDPTR_WDTH -1,
			 SRSBDTAGMSB     =  SRSBDTAG_WDTH -1; 

   parameter EXPLENMSB       = SRLENMSB +1;
   

// Ingress Packet Record Fields
// parameter CM2PM_WDTH      = `FIRE_DLC_IPR_REC_WDTH;       //93
   parameter IPRMSB          = `FIRE_DLC_IPR_MSB;            // CM2PM_WDTH -1
			 

   parameter PRTYP_WDTH      = `FIRE_DLC_IPR_TYP_WDTH,       // 7
			 PRLEN_WDTH      = `FIRE_DLC_IPR_LEN_WDTH,       //10
			 PRBYTCNT_WDTH   = `FIRE_DLC_IPR_BYTCNT_WDTH,    //12
             PRCNTXTNUM_WDTH = `FIRE_DLC_IPR_CNTXTNUM_WDTH,  // 5
			 PRSEQNUM_WDTH   = `FIRE_DLC_IPR_PKSEQNUM_WDTH,  // 5
			 PRADDR_WDTH     = `FIRE_DLC_IPR_ADDR_WDTH,      //41
			 PRDPTR_WDTH     = `FIRE_DLC_IPR_DPTR_WDTH,      // 7
			 PRSBDTAG_WDTH   = `FIRE_DLC_IPR_SBDTAG_WDTH;    // 5   

   parameter PRTYPMSB        =  PRTYP_WDTH -1,
			 PRLENMSB        =  PRLEN_WDTH -1,
			 PRBYTCNTMSB     =  PRBYTCNT_WDTH -1,
             PRCNTXTNUMMSB   =  PRCNTXTNUM_WDTH -1,
			 PRSEQNUMMSB     =  PRSEQNUM_WDTH -1,
			 PRADDRMSB       =  PRADDR_WDTH -1,
			 PRDPTRMSB       =  PRDPTR_WDTH -1,
			 PRSBDTAGMSB     =  PRSBDTAG_WDTH -1;  
   
// ILU
   parameter MPS_WDTH   = `FIRE_DLC_MPS;
   parameter MPSMSB     =  MPS_WDTH - 1;

// CTX
//   parameter CTXARRAY_WDTH      = 43,           // Context CTX entry width
   parameter CTXARRAY_WDTH      = 44,           // Context CTX entry width
			 CTXARRAYMSB        = CTXARRAY_WDTH -1,
             CTXADDRLSB         = 0,
			 CTXADDR_WDTH       = 5,
             CTXADDRMSB         = CTXADDRLSB + CTXADDR_WDTH -1;

// PKSEQ   
   parameter PSEQARRAY_WDTH     = 5,            // Context PKSEQ entry width
			 PSEQARRAYMSB       = PSEQARRAY_WDTH -1,
             PSEQADDRLSB        = 0,
			 PSEQADDR_WDTH      = 5,
			 PSEQADDRMSB        = PSEQADDRLSB + PSEQADDR_WDTH -1;

   parameter CLSTADDRLSB        = 0,
			 CLSTADDR_WDTH      = 4,
 			 CLSTADDRMSB        = CLSTADDRLSB + CLSTADDR_WDTH -1;
 
//MISC
//   parameter CLTOT_WDTH  = 5;
   parameter CLTOT_WDTH  = 6;
   
   parameter CLTOTMSB    = CLTOT_WDTH -1;

   parameter ORDERBITLSB        = 0,                                //0
			 ORDERBIT_WDTH      = 32,
			 ORDERBITMSB        = ORDERBITLSB + ORDERBIT_WDTH -1;   //63

//************************************************
//				PORTS
//************************************************

   input clk;                                      // The input clock
   input rst_l;                                    // synopsys sync_set_reset "rst_l"

// RCM
   input  mm2cm_rcd_enq;
   input  [ISRMSB : 0] mm2cm_rcd;
   output cm2mm_rcd_full;

   output cm2pm_rcd_enq;
   output [IPRMSB : 0] cm2pm_rcd;
   input  pm2cm_rcd_full;

   output rcm2ctx_ctx_req;   
   input  ctx2rcm_ctx_gnt; 
   input  [CTXADDRMSB :0] ctx2rcm_nxctx_addr;
   output [CTXADDRMSB :0] rcm2ctx_ctx_addr;
   output rcm2ctx_ctx_rw;
   input  [CTXARRAYMSB : 0] ctx2rcm_cur_ctx;
   output [CTXARRAYMSB : 0] rcm2ctx_ctx;
   output rcm2ctx_seq_req;
   input  ctx2rcm_seq_gnt;
   input  [PSEQADDRMSB :0] ctx2rcm_nxseq_addr;
   output [PSEQADDRMSB :0] rcm2ctx_pkseq_addr;
   output rcm2ctx_pkseq_rw;
   output [PSEQARRAYMSB : 0] rcm2ctx_pkseq;

// ILU  
   input [MPSMSB :0] y2k_mps;
   
// Debug
   input [`FIRE_DLC_CMU_RCM_DS_BITS] dbg2rcm_dbg_sel_a;
   input [`FIRE_DLC_CMU_RCM_DS_BITS] dbg2rcm_dbg_sel_b;
   output [`FIRE_DBG_DATA_BITS] 	rcm2dbg_dbg_a;
   output [`FIRE_DBG_DATA_BITS] 	rcm2dbg_dbg_b;

//************************************************
//				Functions
//************************************************

   function [EXPLENMSB :0] get_rem_payld;
	  input [EXPLENMSB :0] length;
	  input [MPSMSB :0] payload;
	  reg [EXPLENMSB :0] return;	  
	  
	  begin
		 case(payload)   // synopsys parallel_case
		   3'b000  : return = {6'h00,5'h1f} & length; // 128
		   3'b001  : return = {5'h00,6'h3f} & length; // 256
		   3'b010  : return = {4'h0 ,7'h7f} & length; // 512
		   default :	return = 11'h001;  	  // payloads > 512 are not supported
		 endcase // case(maxpayload)

		 get_rem_payld = return;
		 
	  end
   endfunction // get_rem_payld   

   function [EXPLENMSB :0] get_payld_offset;
	  input [EXPLENMSB :0] length;
	  input [MPSMSB :0] maxpayload;
	  reg [EXPLENMSB :0] return;	  
	  
	  begin
		 case(maxpayload)   // synopsys parallel_case
		   3'b000  : return = length >> 5; // 128
		   3'b001  : return = length >> 6; // 256
		   3'b010  : return = length >> 7; // 512
		   default :	return = 11'h001;  	  // payloads > 512 are not supported
		 endcase // case(maxpayload)

		 get_payld_offset = return;
		 
	  end
   endfunction // get_payld_offset   

   
 function [CLTOTMSB :0] num_paylds;      // added muxes to make vlint happy    
	  input [EXPLENMSB :0] length;
	  input [MPSMSB :0] maxpayload;
	  reg [EXPLENMSB :0] result;
	  reg [CLTOTMSB :0] return;	  
	  
	  begin
		 result = get_rem_payld(length, maxpayload);
		 
		 if (result == 0) begin
			case(maxpayload)     // synopsys parallel_case
			  3'b000  : return = {length[EXPLENMSB :5]}; // 128
			  3'b001  : return = {1'h0,length[EXPLENMSB :6]}; // 256
			  3'b010  : return = {2'h0,length[EXPLENMSB :7]}; // 512
			  default :	return = 6'h01;  	  // payloads > 512 are not supported
			endcase // case(maxpayload)
		 end
         else begin
			case(maxpayload)    // synopsys parallel_case
			  3'b000  : return = {length[EXPLENMSB :5]} + 6'h01; // 128
			  3'b001  : return = {1'h0,length[EXPLENMSB :6]} + 6'h01; // 256
			  3'b010  : return = {2'h0,length[EXPLENMSB :7]} + 6'h01; // 512
			  default :	return = 6'h01;  	  // payloads > 512 are not supported
			endcase // case(maxpayload)
		 end

	  num_paylds = return[CLTOTMSB :0];

	  end
 endfunction // num_paylds   
	  
function [PRBYTCNTMSB :0] byt_cnt;
	  input [EXPLENMSB :0] length;
	  input [SRDWBEMSB :0] dwbe;

      reg [2:0] frst_dw_bytcnt;
      reg [2:0] last_dw_bytcnt;
      reg [2:0] one_dw_bytcnt;
      reg is_one_dw;
	  reg [3:0] fst_dwbe;
	  reg [3:0] lst_dwbe;
   	  reg [1:0] minus_fst;
   	  reg [1:0] minus_lst;
	  reg [2:0] minus_all;
	  reg [PRBYTCNTMSB :0] raw_bytcnt;	  
      reg [PRBYTCNTMSB :0] final_bytcnt;

  begin
   fst_dwbe = dwbe[3:0];
   lst_dwbe = dwbe[7:4];	 
   is_one_dw = ~|length[EXPLENMSB-1:1] & length[0];

   casez (fst_dwbe)
	 4'b0000 : 	frst_dw_bytcnt = 3'h0;
	 4'b1000 : 	frst_dw_bytcnt = 3'h1;
	 4'b0100 : 	frst_dw_bytcnt = 3'h1;	 
	 4'b0010 : 	frst_dw_bytcnt = 3'h1;
	 4'b0001 : 	frst_dw_bytcnt = 3'h1;
     4'b1100 : 	frst_dw_bytcnt = 3'h2;
	 4'b0110 : 	frst_dw_bytcnt = 3'h2;
	 4'b0011 : 	frst_dw_bytcnt = 3'h2;
	 4'b1z10 : 	frst_dw_bytcnt = 3'h3;
	 4'b01z1 : 	frst_dw_bytcnt = 3'h3;
	 4'b1zz1 : 	frst_dw_bytcnt = 3'h4;
   endcase // casez(fst_dwbe)   

   casez (lst_dwbe)
	 4'b0000 : 	last_dw_bytcnt = 3'h0;
	 4'b1000 : 	last_dw_bytcnt = 3'h1;
	 4'b0100 : 	last_dw_bytcnt = 3'h1;	 
	 4'b0010 : 	last_dw_bytcnt = 3'h1;
	 4'b0001 : 	last_dw_bytcnt = 3'h1;
     4'b1100 : 	last_dw_bytcnt = 3'h2;
	 4'b0110 : 	last_dw_bytcnt = 3'h2;
	 4'b0011 : 	last_dw_bytcnt = 3'h2;
	 4'b1z10 : 	last_dw_bytcnt = 3'h3;
	 4'b01z1 : 	last_dw_bytcnt = 3'h3;
	 4'b1zz1 : 	last_dw_bytcnt = 3'h4;
   endcase // casez(last_dwbe)   
	 
		 
   if (dwbe[0]) 	 minus_fst = 2'b00;
   else if (dwbe[1]) minus_fst = 2'b01;
   else if (dwbe[2]) minus_fst = 2'b10;
   else if (dwbe[3]) minus_fst = 2'b11;
   else minus_fst = 2'b00;

   if (dwbe[7]) 	 minus_lst = 2'b00;
   else if (dwbe[6]) minus_lst = 2'b01;
   else if (dwbe[5]) minus_lst = 2'b10;
   else if (dwbe[4]) minus_lst = 2'b11;
   else minus_lst = 2'b00;

   minus_all = {1'b0,minus_fst} + {1'b0,minus_lst};
   one_dw_bytcnt = frst_dw_bytcnt + last_dw_bytcnt;
   raw_bytcnt = {1'b0, length << 2};
   final_bytcnt = raw_bytcnt - {9'h000,minus_all};

   byt_cnt = is_one_dw ? (((fst_dwbe == 4'h0) && (lst_dwbe == 4'h0))
                            ? {9'h000, 3'h1} : {9'h000,one_dw_bytcnt})
	                   : final_bytcnt;
	 
end	  
endfunction // byt_cnt

   
//************************************************
//				SIGNALS
//************************************************
 
   wire clk;
   wire rst_l;

   wire [EXPLENMSB : 0] cacheline;

// Schedule Record queue signals 
   wire srmpty;

// Schedule Record field assignments to RCM signals
   wire [SRTYPMSB :0] srtyp;
   wire [SRLENMSB :0] srlen;
   wire [SRDWBEMSB :0] srdwbe;
   wire [SRADDRMSB :0] sraddr;
   wire sraddrerr;
   wire [SRDPTRMSB :0] srdptr;
   wire [SRSBDTAGMSB :0] srtr_tag;

   wire [EXPLENMSB :0] part_len;
   wire [EXPLENMSB :0] sel_payld_len;
   wire [EXPLENMSB :0] first_len;   
   wire [EXPLENMSB :0] restof_len;
   
   wire fourk_bit;
   wire [EXPLENMSB :0] explen;   
   
//RCM - CTX
   reg rcm2ctx_ctx_req;
   reg [CTXADDRMSB :0] rcm2ctx_ctx_addr;
   reg rcm2ctx_ctx_rw;
   
   reg [ORDERBITMSB :0] new_order_bits;

   reg [CLTOTMSB +1 :0] j;                   // indicies for setting order_bits
   reg [CTXARRAYMSB : 0] cur_ctx;      
   reg [EXPLENMSB :0] maxpyld;   
   
   wire ctx2rcm_ctx_gnt; 
   wire [CTXADDRMSB :0] ctx2rcm_nxctx_addr;
   wire [CTXARRAYMSB : 0] ctx2rcm_cur_ctx;
   reg [CTXARRAYMSB : 0] rcm2ctx_ctx;
   
   reg  rcm2ctx_seq_req;
   wire ctx2rcm_seq_gnt;
   wire [PSEQADDRMSB :0] ctx2rcm_nxseq_addr;
   reg [PSEQADDRMSB :0] rcm2ctx_pkseq_addr;
   reg rcm2ctx_pkseq_rw;   
   wire [PSEQARRAYMSB : 0] rcm2ctx_pkseq;

   reg first_ctx_gnt;
   
// Multicycle signals
   wire [9 :0] lo_addr;
   wire [9 :0] payld_lo_addr;
   wire  pipe_mpty;
   
   reg xfr_strt;

// Registers
   reg [PRTYPMSB :0] pkt_typ;
   reg [PRLENMSB :0] pkt_len;
   reg [PRBYTCNTMSB :0] pkt_byt_cnt;
   reg [PRCNTXTNUMMSB :0] pkt_cntxt_num;
   reg [PRSEQNUMMSB :0] pkt_seq_num;
   reg [PRADDRMSB :0] pkt_addr;
   reg pkt_addr_err;
   reg [PRDPTRMSB :0] pkt_dptr;
   reg [PRSBDTAGMSB :0] pkt_tr_tag;

   reg [EXPLENMSB :0] next_pktlen;
   reg [PRBYTCNTMSB :0] next_pktbyt_cnt;
   reg [PRCNTXTNUMMSB :0] next_pktcntxt_num;
   reg [PRSEQNUMMSB :0] next_pktseq_num;
   reg [PRADDRMSB :0] next_pktaddr;
   reg [PRDPTRMSB :0] next_pktdptr;
   reg [PRSBDTAGMSB :0] next_pkttr_tag;

   reg [SRTYPMSB :0] pipe_typ;   
   reg [EXPLENMSB :0] pipe_len;   
   reg [EXPLENMSB :0] pipe_srlen;

   reg [PRBYTCNTMSB :0] pipe_bytcnt;
   reg [PRCNTXTNUMMSB :0] pipe_cntxtnum;
   reg [PRSEQNUMMSB :0] pipe_seqnum;
   reg [PRADDRMSB :0] pipe_addr;
   reg [PRADDRMSB :10] pipe_addr_hi;
   reg pipe_addrerr;
   reg [SRDWBEMSB :0] pipe_dwbe;
   reg [PRDPTRMSB :0] pipe_dptr;
   reg [SRSBDTAGMSB :0] pipe_trtag;
   reg [CLTOTMSB :0] pipe_cycles;
   reg pipe_mcycle;   

   wire [EXPLENMSB :0] temp_len;
   wire [EXPLENMSB :0] temp_payld_len;
   reg [EXPLENMSB :0] adj_len;
   reg [EXPLENMSB :0] adj_payld_len;
   wire [EXPLENMSB : 0] payld_offset;
   reg [EXPLENMSB :0] rem_payld_len;         

   reg [PRTYPMSB :0] cyc_typ;
   reg [EXPLENMSB :0] cyc_len;
   reg [PRBYTCNTMSB :0] cyc_bytcnt;   
   reg [PRCNTXTNUMMSB :0] cyc_cntxtnum;
   reg [PRSEQNUMMSB :0] cyc_seqnum;
   reg [SRADDRMSB :0] cyc_addr;
   reg  cyc_addrerr;
   reg [SRSBDTAGMSB :0] cyc_trtag;
   reg [SRDPTRMSB :0] cyc_dptr;
   
   reg [SRDWBEMSB :0] new_payld_dwbe;
   reg [3 :0] pipe_lastdwbe;
   reg [3 :0] lastdwbe;
   
   reg [CLTOTMSB :0] num_cmd;
   reg [CLTOTMSB :0] cycles;
   reg [CLTOTMSB :0] next_cycles;

   reg next_multicycle;
   
   reg next_deq_sr;
   reg next_gen_pkt; 
   reg next_pkseq_req;   
   reg next_rcd_enq;
   reg cm2pm_rcd_enq;
   reg next_gen_ctx;
   reg next_ctx_req;
  
   reg [1:0] deq_state;
   reg [1:0] deq_next;

   reg [1:0] ctx_state;
   reg [1:0] ctx_next;

   reg [1:0] seq_state;
   reg [1:0] seq_next;

   reg [2:0] bld_state;
   reg [2:0] bld_next;


   reg [2 :0] next_clastyp;
   reg [2 :0] pipe_clastyp;
   reg [2 :0] clastyp;
   
   reg multicycle;
   reg ld_ptr;
   reg pipe_full; 
   reg next_deq_pipe;
   reg deq_pipe;   
   reg ld_pipe;

   reg rcm_is_idle;
   
// Debug
  reg  [`FIRE_DLC_CMU_RCM_DS_BITS]	dbg_sel [0:1];
  reg  [`FIRE_DBG_DATA_BITS]	dbg_bus [0:1];
  reg  [`FIRE_DBG_DATA_BITS]	nxt_dbg_bus [0:1];
  integer i, k;
 
// Schedule queue signals

//   wire overflow;         //for debug use
//   wire underflow;        //for debug use
  
// *************** Local Declarations *************************************

  parameter DEQIDLE     = 2'b00,    // no work to do
			DEQPIPE     = 2'b01,    // load pipeline with current packet
			DEQ         = 2'b10;    // dequeue next packet

  parameter CTXIDLE     = 2'b00,    // Context Number Request Idle
			CTXGNT      = 2'b01;    // Context number Request granted

  parameter SEQIDLE     = 2'b00,    // Packet Sequence Address Request Idle
			SEQGNT      = 2'b01,    // Packet Sequence Address Request granted
			SEQWAIT     = 2'b10;    // wait for pipeline to unstall   

  parameter BLDIDLE     = 3'b000,   // Build Context Idle
			BLDCNTX     = 3'b010,   // Context ops in progress
			BLDBPAS     = 3'b011;   // NO context ops needed
   
  parameter CLASWR      = 3'b001,  // Schedule record is a Write
			CLASRD      = 3'b010,  // Schedule record is a Read
			CLASPIO     = 3'b011,  // Schedule record is a PIO
			CLASMSI     = 3'b100,  // Schedule record is a MSI
			CLASMSC     = 3'b101,  // Schedule record is a Misc
			CLASMDO     = 3'b110;  // Schedule record is a Mondo
   
//************************************************
// Zero In checkers
//************************************************

// Request Grant check for ctx number
  // 0in req_ack -req rcm2ctx_ctx_req  -ack ctx2rcm_ctx_gnt -req_until_ack

// Request Grant check for pkseq number
  // 0in req_ack -req rcm2ctx_seq_req -ack ctx2rcm_seq_gnt -req_until_ack

// deq_fsm
  //0in state_transition  -var deq_state  -val DEQIDLE  -next DEQIDLE DEQPIPE
  //0in state_transition  -var deq_state  -val DEQPIPE  -next DEQPIPE DEQ
  //0in state_transition  -var deq_state  -val DEQ      -next DEQIDLE 

// ctx_fsm
  //0in state_transition  -var ctx_state  -val CTXIDLE  -next CTXIDLE CTXGNT
  //0in state_transition  -var ctx_state  -val CTXGNT   -next CTXGNT CTXIDLE

// seq_fsm
  //0in state_transition  -var seq_state  -val SEQIDLE  -next SEQIDLE SEQGNT 
  //0in state_transition  -var seq_state  -val SEQGNT   -next SEQGNT SEQIDLE SEQWAIT
  //0in state_transition  -var seq_state  -val SEQWAIT  -next SEQWAIT SEQIDLE

// build_crcd (pipeline staging and command record build)
  //0in state_transition  -var bld_state  -val BLDIDLE   -next BLDIDLE BLDCNTX BLDBPAS
  //0in state_transition  -var bld_state  -val BLDCNTX   -next BLDCNTX BLDIDLE
  //0in state_transition  -var bld_state  -val BLDBPAS   -next BLDBPAS BLDIDLE 

// *************** Procedures *************************************

// Transaction Type Decode - context ops encoding
always @(srtyp)   
  begin
     case (srtyp)         // synopsys parallel_case
	   7'b0000000 : next_clastyp = CLASRD;             // DMAMR
	   7'b0100000 : next_clastyp = CLASRD;             // DMAMR
	   7'b0000001 : next_clastyp = CLASMSC;            // DMAMRDLK
	   7'b0100001 : next_clastyp = CLASMSC;            // DMARDLK_alt
	   7'b0001001 : next_clastyp = CLASMSC;            // UNSUP
	   7'b1000000 : next_clastyp = CLASWR;             // DMAMWR
	   7'b1100000 : next_clastyp = CLASWR;             // DMAMWR
	   7'b1111000 : next_clastyp = CLASMSI;            // MSIEQWR
	   7'b1011000 : next_clastyp = CLASMSI;            // MSIEQWR
	   7'b1010000 : next_clastyp = CLASMSI;            // MSGEQWR
	   7'b1110000 : next_clastyp = CLASMSI;            // MSGEQWR
	   7'b1111100 : next_clastyp = CLASMSC;            // NULL
	   7'b1111010 : next_clastyp = CLASMDO;            // MDO
	   7'b0001010 : next_clastyp = CLASPIO;            // PIOCP
	   7'b1001010 : next_clastyp = CLASPIO;            // PIOCPLD
       default    : next_clastyp = 3'b111;             // to satisfy vlint
	 endcase // case(srtyp)
  end // always @ (srtyp)   
   
// Parse Schedule Record to issue Packet Records
// lengths are represented in DW's

always @(next_clastyp or sraddr or cacheline or part_len or first_len 
         or srlen or srdwbe or srdptr or srtr_tag or sraddrerr or maxpyld 
         or y2k_mps or explen or restof_len)
  begin
	 next_pktlen[EXPLENMSB :0] = 0;
	 next_pktbyt_cnt[PRBYTCNTMSB :0] = 0;
	 next_pktcntxt_num[PRCNTXTNUMMSB :0] = 0;
	 next_pktseq_num[PRSEQNUMMSB :0] = 0;
	 next_pktaddr[PRADDRMSB :0] = 0;
	 next_pktdptr[PRDPTRMSB :0] = 0;
	 next_pkttr_tag[PRSBDTAGMSB :0] = 0;
	 next_multicycle = 1'b0;
	 next_cycles = 6'h01;
     
	 case (next_clastyp)      // synopsys full_case parallel_case
	   CLASWR: begin      // DMA Wr
		  if (explen <= cacheline) begin                   //(length LE 16)
			   next_pktcntxt_num = 0;
			   next_pktseq_num = 0;
			   next_pkttr_tag = srtr_tag[SRSBDTAGMSB :0];

			   if (sraddr[3:0] == 4'h0) begin
				  next_pktlen = explen[EXPLENMSB :0];     // DW's
				  next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]};
				  next_pktaddr = sraddr[SRADDRMSB :0];
				  next_pktdptr = srdptr[SRDPTRMSB :0];
				  next_multicycle = 1'b0;
				  next_cycles = 6'h01;
			   end
			   else begin                                 // (sraddr[3:0] != 4'h0)
				  if (explen > part_len) begin
					 next_pktlen = part_len[EXPLENMSB :0]; // DW's
					 next_pktbyt_cnt = {4'h0,4'hf,srdwbe[3 :0]};
					 next_pktaddr = sraddr[SRADDRMSB :0];
					 next_pktdptr = srdptr[SRDPTRMSB :0];
					 next_multicycle = 1'b1;
				     next_cycles = 6'h02;					 
				  end
				  else begin
					 next_pktlen = explen[EXPLENMSB :0];      // DW's
					 next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]};
					 next_pktaddr = sraddr[SRADDRMSB :0];
					 next_pktdptr = srdptr[SRDPTRMSB :0];
					 next_multicycle = 1'b0;
					 next_cycles = 6'h01;
				  end // else: !if(explen > part_len)				  
			   end // else: !if(sraddr[3:0] == 4'h0)
			  end // if ((srlen <= cacheline) begin...	

 		   if (explen > cacheline) begin                   //(length GT 16)
			   next_pktcntxt_num = 0;
			   next_pktseq_num = 0;
			   next_pkttr_tag = srtr_tag[SRSBDTAGMSB :0];
						 
				if (sraddr[3:0] == 4'h0) begin
				   if (srdwbe[7:0] == 8'hff) begin
					 next_pktlen = explen[EXPLENMSB :0];     // DW's
					 next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]};
					 next_pktaddr = sraddr[SRADDRMSB :0];
					 next_pktdptr = srdptr[SRDPTRMSB :0];
					 next_multicycle = 1'b0;
					 next_cycles = 6'h01;
				   end
                   else begin                      
					 next_pktlen = part_len[EXPLENMSB :0];
					 next_pktbyt_cnt = {4'h0,4'hf,srdwbe[3 :0]};
					 next_pktaddr = sraddr[SRADDRMSB :0];
					 next_pktdptr = srdptr[SRDPTRMSB :0];
					 next_multicycle = 1'b1;
					 next_cycles = 6'h02;
				   end // else: !if(srdwbe[7:0] == 8'hff)
				end // if (sraddr[3:0] == 4'h0)
			    else begin                                // sraddr[3:0] != 4'h0
					 next_pktlen = part_len[EXPLENMSB :0];
					 next_pktbyt_cnt = {4'h0,4'hf,srdwbe[3 :0]};
					 next_pktaddr = sraddr[SRADDRMSB :0];
					 next_pktdptr = srdptr[SRDPTRMSB :0];
					 next_multicycle = 1'b1;
					 next_cycles = 6'h02;
				end // else: !if(sraddr[3:0] == 4'h0)
		   end // if (srlen > cacheline)
	   end // case: CLASWR	   

	   CLASRD : begin     // DMA Rd
		  if (explen <= cacheline) begin                   //(length LE 16)
			 if ( srlen == 10'h001) next_pktbyt_cnt = {4'h0, 4'h0, srdwbe[3 :0]};
			  else next_pktbyt_cnt = {4'h0 , srdwbe[SRDWBEMSB :0]};
			 next_pktcntxt_num = 0;
			 next_pktseq_num = 0;
			 next_pkttr_tag = srtr_tag[SRSBDTAGMSB :0];
			 next_pktlen = explen[EXPLENMSB :0];     // DW's
			 next_pktaddr = sraddr[SRADDRMSB :0];
			 next_pktdptr = srdptr[SRDPTRMSB :0];
			 next_multicycle = 1'b0;
			 next_cycles = 6'h01;
		  end // if (explen <= cacheline)

		  if (explen > cacheline) begin                    //(length GT 16)
			  next_pktcntxt_num = 0;
			  next_pktseq_num = 0;
			  next_pkttr_tag = srtr_tag[SRSBDTAGMSB :0];

			  if (sraddr[3:0] == 4'h0) begin             // aligned
				 next_pktaddr = sraddr[SRADDRMSB :0];
				 next_pktdptr = srdptr[SRDPTRMSB :0];

				 if (sraddrerr) begin
					next_pktlen = explen[EXPLENMSB :0];
                    next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]}; 
					next_multicycle = 1'b0;
					next_cycles = 6'h01;
				 end
				 else begin
					if(explen <= maxpyld) begin
					   next_pktlen = explen[EXPLENMSB :0];
                       next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]};
					   next_multicycle = 1'b0;
					   next_cycles = 6'h01;
					end
					else begin
					   next_pktlen = maxpyld;
                       if (srdwbe[3:0] == 4'hf) next_pktbyt_cnt = {4'h0,8'hff};
                       else next_pktbyt_cnt = {4'h0,4'hf,srdwbe[3 :0]};			
					   next_multicycle = 1'b1;
					   next_cycles = (num_paylds(explen, y2k_mps));
					end
				 end // else: !if(sraddrerr)
			  end // if (sraddr[3:0] == 4'h0)
			  else begin				               // un-aligned
				 next_pktaddr = sraddr[SRADDRMSB :0];
				 next_pktdptr = srdptr[SRDPTRMSB :0];
								 
				 if (sraddrerr) begin
					next_pktlen = explen[EXPLENMSB :0];
                    next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]};	            
					next_multicycle = 1'b0;
					next_cycles = 6'h01;
				 end
				 else begin
					if(explen <= maxpyld) begin
					   next_pktlen = explen[EXPLENMSB :0];
                       next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]};           
					   next_multicycle = 1'b0;
					   next_cycles = 6'h01;
					end
					else begin
					   next_pktlen = first_len[EXPLENMSB :0];
                       if (srdwbe[3:0] == 4'hf) next_pktbyt_cnt = {4'h0,8'hff}; 
                       else next_pktbyt_cnt = {4'h0,4'hf,srdwbe[3 :0]};			
					   next_multicycle = 1'b1;
					   next_cycles = 6'h01 + (num_paylds(restof_len, y2k_mps));
					end
				 end // else: !if(sraddrerr)				 
			  end // else: !if(sraddr[3:0] == 4'h0)
		  end // if (explen > cacheline)
	   end // case: CLASRD	   
	   
	   CLASPIO : begin    // PIO CplD 
			   next_pktcntxt_num = {1'b0,srdwbe[3 :0]};
			   next_pktseq_num = 0;
			   next_pkttr_tag = srtr_tag[SRSBDTAGMSB :0];
			   next_pktlen = explen[EXPLENMSB :0];     // DW's
			   next_pktbyt_cnt = 0;
			   next_pktaddr = sraddr[SRADDRMSB :0];
			   next_pktdptr = srdptr[SRDPTRMSB :0];
               next_multicycle = 1'b0;
		       next_cycles = 6'h01;
	   end

	   CLASMDO : begin    //Mondo Wr
			   next_pktcntxt_num = 0;
			   next_pktseq_num = 0;
			   next_pkttr_tag = srtr_tag[SRSBDTAGMSB :0];
			   next_pktlen = explen[EXPLENMSB :0];     // DW's
			   next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]};
			   next_pktaddr = sraddr[SRADDRMSB :0];
			   next_pktdptr = srdptr[SRDPTRMSB :0];
               next_multicycle = 1'b0;
		       next_cycles = 6'h01;
	   end

	   CLASMSI : begin    //MSI,MSG Wr
			   next_pktcntxt_num = 0;
			   next_pktseq_num = 0;
			   next_pkttr_tag = srtr_tag[SRSBDTAGMSB :0];
               next_pktlen = explen[EXPLENMSB :0];     // DW's
			   next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]};
			   next_pktaddr = sraddr[SRADDRMSB :0];
			   next_pktdptr = srdptr[SRDPTRMSB :0];
               next_multicycle = 1'b0;
		       next_cycles = 6'h01;
	   end
	   CLASMSC : begin    // Unsup req
			   next_pktcntxt_num = 0;
			   next_pktseq_num = 0;
			   next_pkttr_tag = srtr_tag[SRSBDTAGMSB :0];
			   next_pktlen = explen[EXPLENMSB :0];     // DW's
			   next_pktbyt_cnt = {4'h0,srdwbe[SRDWBEMSB :0]};
			   next_pktaddr = sraddr[SRADDRMSB :0];
			   next_pktdptr = srdptr[SRDPTRMSB :0];
               next_multicycle = 1'b0;
		       next_cycles = 6'h01;
	   end

	   default begin
			   next_pktcntxt_num = 0;
			   next_pktseq_num = 0;
			   next_pkttr_tag = 0;
			   next_pktlen = 0;     // DW's
			   next_pktbyt_cnt = 0;
			   next_pktaddr = 0;
			   next_pktdptr = 0;
               next_multicycle = 0;
		       next_cycles = 0;
	   end
	 endcase // case(next_clastyp)
  end // always @ (next_clastyp or sraddrerr or srlen or sraddr or byt_cnt...   

// Maxpayload decoder
 always @(posedge clk)
  begin			  
	 if (rst_l == 1'b0) begin
		maxpyld <= 0;
	 end
	 else begin
		case (y2k_mps)    // synopsys parallel_case
		  3'b000  : maxpyld <= 11'h020;			 
		  3'b001  : maxpyld <= 11'h040;			 
		  3'b010  : maxpyld <= 11'h080;			 
		  default : maxpyld <= 11'h010;		  // payloads > 512 are not supported
		endcase // case(y2k_mps)		      // RCM will force length = 10DW
	 end // else: !if(!rst_l == 1'b1)	 
  end // always @ (posedge clk)
   
// Multicycle Parse Schedule Record to issue Packet Records
// lengths are represented in DW's

// Order Bit updates
// work around code re-write to make 0-in happy
// Zero-In cannot unroll for loops well enough to
// understand just bit wiring, but it does understand
// muxes

always @(cycles)            
  begin
	 for( j = 7'b0; j < 7'd32; j = j + 1'b1)
	   new_order_bits[j[CLTOTMSB -1 :0]] = (j < {1'b0,cycles}) ? 1'b1 : 1'b0;
  end   

// Pipelined staging for Packet record processing
always @(posedge clk)
	if(~rst_l) begin
	 pipe_clastyp  <= 3'b0; 
	 pipe_typ      <= {SRTYP_WDTH{1'b0}};
         pipe_len      <= {(SRLEN_WDTH +1){1'b0}};
         pipe_srlen    <= {(SRLEN_WDTH +1){1'b0}};
	 pipe_bytcnt   <= {PRBYTCNT_WDTH{1'b0}};
	 pipe_cntxtnum <= {PRCNTXTNUM_WDTH{1'b0}};
	 pipe_seqnum   <= {PRSEQNUM_WDTH{1'b0}};
         pipe_addr     <= {PRADDR_WDTH{1'b0}};
         pipe_addr_hi  <= {PRADDR_WDTH - 10{1'b0}};
	 pipe_addrerr  <= {{1'b0}};
         pipe_lastdwbe <= {4{1'b0}};
	 pipe_dwbe     <= {SRDWBE_WDTH{1'b0}};
	 pipe_dptr     <= {PRDPTR_WDTH{1'b0}};
	 pipe_trtag    <= {SRSBDTAG_WDTH{1'b0}};
	 pipe_cycles   <= {CLTOT_WDTH{1'b0}};
	 pipe_mcycle   <= {{1'b0}};
	end
  else begin
	 pipe_clastyp  <= ld_pipe ? next_clastyp : pipe_clastyp;	 
	 pipe_typ      <= ld_pipe ? srtyp : pipe_typ;	   
     pipe_len      <= ld_pipe ? next_pktlen : pipe_len;
     pipe_srlen    <= ld_pipe ? explen : pipe_srlen;
	 pipe_bytcnt   <= ld_pipe ? next_pktbyt_cnt : pipe_bytcnt;	   
	 pipe_cntxtnum <= ld_pipe ? next_pktcntxt_num : pipe_cntxtnum;	   
	 pipe_seqnum   <= ld_pipe ? next_pktseq_num : pipe_seqnum;
     pipe_addr     <= ld_pipe ? next_pktaddr : pipe_addr;
     pipe_addr_hi  <= ld_pipe ? next_pktaddr[PRADDRMSB :10] : pipe_addr_hi;	   
	 pipe_addrerr  <= ld_pipe ? sraddrerr : pipe_addrerr;
     pipe_lastdwbe <= ld_pipe ? srdwbe[7:4] : pipe_lastdwbe;
	 
	 case(next_clastyp)   // synopsys parallel_case
	   CLASRD : begin
		  pipe_dwbe <= ld_pipe ? next_pktbyt_cnt[SRDWBEMSB :0] : pipe_dwbe;
	   end

	   CLASWR,
	   CLASPIO,
	   CLASMSI,
	   CLASMSC,
	   CLASMDO : begin
		  pipe_dwbe <= ld_pipe ? srdwbe : pipe_dwbe;	   
	   end

	   default : begin
		  pipe_dwbe <= ld_pipe ? srdwbe : pipe_dwbe;	   
	   end
	 endcase // case(next_clastyp)
	 
	 pipe_dptr     <= ld_pipe ? next_pktdptr : pipe_dptr;
	 pipe_trtag    <= ld_pipe ? next_pkttr_tag : pipe_trtag;
	 pipe_cycles   <= ld_pipe ? next_cycles : pipe_cycles;
	 pipe_mcycle   <= ld_pipe ? next_multicycle : pipe_mcycle;	   
end // always @ (posedge clk)

always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin
	   multicycle <= 0;
	   cycles <= 6'h01;
	   adj_len <= 0;
	   adj_payld_len <= 0;	   
	   new_payld_dwbe <= 0;
	   rem_payld_len <= 0;
       lastdwbe <= 0;	   
     end
    else begin
       case (bld_state)   // synopsys parallel_case
		 BLDIDLE  : begin
			multicycle <= pipe_mcycle;
			cycles <= pipe_cycles;
			adj_len <= pipe_srlen;
			adj_payld_len <= pipe_srlen;
			new_payld_dwbe <= pipe_dwbe;			
			rem_payld_len <= 0;
			lastdwbe <= pipe_lastdwbe;	   			
		 end		 
         BLDBPAS : begin
			multicycle <= multicycle;
			cycles <= cycles;
			adj_len <= ld_ptr ? (adj_len - cyc_len) : adj_len;
			adj_payld_len <= (multicycle & xfr_strt)
                              ? (adj_payld_len - cyc_len) 
                              : adj_payld_len;
			new_payld_dwbe <= (payld_offset != 0) 
                               ? 8'hff 
                               : {pipe_dwbe[7:4], 4'hf};			
			rem_payld_len <= get_rem_payld(temp_payld_len,y2k_mps);
			lastdwbe <= lastdwbe;
			
		 end		 
		 BLDCNTX : begin
			multicycle <= multicycle;
			cycles <= cycles;
			adj_len <= ld_ptr ? (adj_len - cyc_len) : adj_len;
			adj_payld_len <= (multicycle & next_rcd_enq)
                              ? (adj_payld_len - cyc_len) 
                              : adj_payld_len;
			new_payld_dwbe <= (multicycle & next_rcd_enq)
                              ? ((payld_offset != 0) ? 8'hff 
                                                     : {lastdwbe, 4'hf})
                              : new_payld_dwbe;

			rem_payld_len <= get_rem_payld(temp_payld_len,y2k_mps);
			lastdwbe <= lastdwbe;			
		 end		 
		 default : begin
			multicycle <= 0;
			cycles <= 6'h01;
			adj_len <= 0;
			adj_payld_len <= 0;
			new_payld_dwbe <= 0;			
			rem_payld_len <= 0;
			lastdwbe <= 0;			
		 end
	   endcase // case(bld_state)
	end // else: !if(rst_l == 1'b0)
  end // always @ (posedge clk)

always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin	   
	   clastyp <= 0;	   
     end
    else begin
	   case (next_deq_pipe)     // synopsys parallel_case   
         1'b1 : clastyp <= pipe_clastyp;
		 1'b0 : clastyp <= clastyp;
	   endcase // case(next_deq_pipe)
	end	 
  end // always @ (posedge clk)   

// Pipelined computed values for the next multi-command 
// build for a given schedule record.
   
always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin
	   cyc_typ      <= 0;
	   cyc_len      <= 0;
	   cyc_bytcnt   <= 0;
	   cyc_addr     <= 0;
	   cyc_addrerr  <= 0;
	   cyc_dptr     <= 0;
	   cyc_cntxtnum <= 0;
	   cyc_seqnum   <= 0;
	   cyc_trtag    <= 0;
	end // if (rst_l == 1'b0)
   	else begin	   
	 case (next_deq_pipe)      // synopsys full_case parallel_case
      1'b1 : begin
		 case (pipe_clastyp)      // synopsys parallel_case
		   CLASWR: begin	        // DMA Wr
			  cyc_typ      <= pipe_typ;
			  cyc_len      <= pipe_len;
			  cyc_bytcnt   <= pipe_bytcnt;
			  cyc_addr     <= pipe_addr;
			  cyc_addrerr  <= pipe_addrerr;
			  cyc_dptr     <= pipe_dptr;
			  cyc_cntxtnum <= pipe_cntxtnum;
			  cyc_seqnum   <= pipe_seqnum;
			  cyc_trtag    <= pipe_trtag;
			  end // case: CLASWR

		   CLASRD: begin	        // DMA Rd
			  cyc_typ      <= pipe_typ;
			  cyc_len      <= pipe_len;
			  cyc_addr     <= pipe_addr;
			  cyc_addrerr  <= pipe_addrerr;
			  cyc_dptr     <= pipe_dptr;
			  cyc_bytcnt   <=  byt_cnt(pipe_len, pipe_dwbe); 
			  cyc_cntxtnum <= ctx2rcm_nxctx_addr;
			  cyc_seqnum   <= pipe_seqnum;
			  cyc_trtag    <= pipe_trtag;
			  end // case: CLASRD

			  default: begin
				 cyc_typ      <= pipe_typ;
				 cyc_len      <= pipe_len;
				 cyc_bytcnt   <= pipe_bytcnt;
				 cyc_addr     <= pipe_addr;
				 cyc_addrerr  <= pipe_addrerr;
				 cyc_dptr     <= pipe_dptr;
				 cyc_cntxtnum <= pipe_cntxtnum;
				 cyc_seqnum   <= pipe_seqnum;
				 cyc_trtag    <= pipe_trtag;
				 end // case: default		   
		 endcase // case(clastyp)
	   end // case: 1'b1
	   1'b0 : begin
		  case (clastyp)      // synopsys parallel_case
			 CLASWR: begin	        // DMA Wr
				cyc_typ    <= cyc_typ;
 				cyc_len    <= ld_ptr ? temp_len : cyc_len;
				cyc_bytcnt <= (multicycle & next_rcd_enq)
                                ? ({4'h0,lastdwbe,4'hf})
                                : cyc_bytcnt;
				cyc_addr    <= (ld_ptr ? {cyc_addr[SRADDRMSB :10],lo_addr} 
                                        : cyc_addr);
				cyc_addrerr <= cyc_addrerr;
				cyc_dptr    <= cyc_dptr;
				cyc_cntxtnum <= cyc_cntxtnum;
				cyc_seqnum   <= (ld_ptr ? (cyc_seqnum + 1'b1) : cyc_seqnum);
				cyc_trtag    <= next_deq_pipe ? pipe_trtag : cyc_trtag;
				end // case: CLASWR

			  CLASRD: begin	        // DMA Rd
				cyc_typ    <= cyc_typ;
				cyc_len    <= ((multicycle & next_rcd_enq) ? sel_payld_len 
                                                       : cyc_len);
				cyc_addr   <= ((multicycle & next_rcd_enq) 
                                ? {cyc_addr[SRADDRMSB :10],payld_lo_addr} 
                                : cyc_addr);
				cyc_addrerr <= cyc_addrerr;
				cyc_dptr    <= cyc_dptr;
				cyc_bytcnt   <= cyc_bytcnt;
				 
				cyc_cntxtnum <= cyc_cntxtnum;
				cyc_seqnum   <= (cm2pm_rcd_enq ? (cyc_seqnum + 1'b1) : cyc_seqnum);
				cyc_trtag    <= cyc_trtag;
			  end // case: CLASRD			
			  
			  default: begin
				cyc_typ      <= cyc_typ;
				cyc_len      <= cyc_len;
				cyc_bytcnt <= cyc_bytcnt;
				cyc_addr     <= cyc_addr;
				cyc_addrerr  <= cyc_addrerr;
				cyc_dptr     <= cyc_dptr;
				cyc_cntxtnum <= cyc_cntxtnum;
				cyc_seqnum   <= cyc_seqnum;
				cyc_trtag    <= cyc_trtag;
			  end // case: default
			endcase // case(clastyp)
		 end // case: 1'b0

 		 default: begin
			cyc_typ      <= cyc_typ;
			cyc_len      <= cyc_len;
			cyc_bytcnt   <= cyc_bytcnt;
			cyc_addr     <= cyc_addr;
			cyc_addrerr  <= cyc_addrerr;
			cyc_dptr     <= cyc_dptr;
			cyc_cntxtnum <= cyc_cntxtnum;
			cyc_seqnum   <= cyc_seqnum;
			cyc_trtag    <= cyc_trtag;
			end // case: default
	 endcase // case(next_deq_pipe)
	end // else: !if(rst_l == 1'b0)
  end // always @ (posedge clk)   
   
// number of packet commands (cycles) issued in multicycle cases
always @(posedge clk)			  
  begin
    if (rst_l == 1'b0) begin			  
       num_cmd   <= 6'b000001;                 // command counter
     end
    else begin
	   num_cmd <= next_deq_pipe ? pipe_cycles : (ld_ptr ? (num_cmd - 6'b000001) : num_cmd);
	end // else: !if(rst_l == 1'b0)
  end // always @ (posedge clk)

// DEQ next state
always @(deq_state or srmpty or pipe_full or pm2cm_rcd_full)
  begin
    case (deq_state)	// synopsys parallel_case
      DEQIDLE : begin
         case(srmpty) // synopsys full_case parallel_case
          1'b1: deq_next = DEQIDLE;
          1'b0: deq_next = DEQPIPE;
		 endcase // case(pkmpty)
	  end // case: DEQIDLE
	  
      DEQPIPE : begin
		case (pipe_full | pm2cm_rcd_full) // synopsys full_case parallel_case
		  1'b1 : deq_next = DEQPIPE;
		  1'b0 : deq_next = DEQ;
		endcase // case(pipe_full | pm2cm_rcd_full)		 
	  end	  

      DEQ : begin
		 deq_next = DEQIDLE;
	  end // case: DEQ

      default : deq_next = DEQIDLE;
	  
	endcase // case(deq_state)
  end // always @ (deq_state or srmpty or pipe_full)   
   
// DEQ state machine outputs
always @(deq_state or srmpty or pipe_full or pm2cm_rcd_full)
  begin
    case (deq_state)	// synopsys parallel_case
     DEQIDLE : begin
		 ld_pipe   = 1'b0;
		 next_deq_sr = 1'b0;
	  end // case: DEQIDLE

     DEQPIPE : begin
		next_deq_sr = 1'b0;
		case (pipe_full | pm2cm_rcd_full)  // synopsys full_case parallel_case
		  1'b1 : ld_pipe   = 1'b0;
		  1'b0 : ld_pipe   = 1'b1;
		endcase // case(pipe_full | pm2cm_rcd_full)		
	 end	  	  

     DEQ : begin
		ld_pipe   = 1'b0;
		case (srmpty)  // synopsys full_case parallel_case
		  1'b1 : next_deq_sr = 1'b0;
		  1'b0 : next_deq_sr = 1'b1;
		endcase // case(srmpty)
	 end
	  
     default : begin
		ld_pipe   = 1'b0;
		next_deq_sr = 1'b0;
	 end
	endcase // case(deq_state)
  end // always @ (deq_state or srmpty or pipe_full)   

// DEQ state transitions
always @(posedge clk)
  begin
	 if (rst_l == 1'b0)
	   deq_state <= DEQIDLE;	// Synchronous Reset
	 else begin
		deq_state <= deq_next;
	 end
  end   

// *************** Build Context Procedures (build_cntx)*********/
   
// Context Number Request State machine
always @(ctx_state or ctx2rcm_ctx_gnt or next_gen_ctx)
  begin
	 next_ctx_req = 1'b0;
     ctx_next = ctx_state;
     
    case (ctx_state)	// synopsys parallel_case
      CTXIDLE : begin
		 case (next_gen_ctx)   // synopsys full_case parallel_case
		   1'b0: begin
			  next_ctx_req = 1'b0;
			  ctx_next = CTXIDLE;
		   end
		   1'b1: begin
			  next_ctx_req = 1'b1;
			  ctx_next = CTXGNT;
		   end
		 endcase // case(next_gen_ctx)
	  end // case: CTXIDLE	  
	  
     CTXGNT : begin
		 case (ctx2rcm_ctx_gnt)   // synopsys full_case parallel_case
		   1'b0: begin
			  next_ctx_req = 1'b1;
			  ctx_next = CTXGNT;
		   end
		   1'b1: begin
			  next_ctx_req = 1'b0;
			  ctx_next = CTXIDLE;
		   end
		 endcase // case(ctx2rcm_ctx_gnt)		
	 end // case: CTXGNT	  	  

     default : begin                     // to satisfy vlint
		next_ctx_req = 1'b0;
		ctx_next = CTXIDLE;
	 end
	endcase // case(ctx_state)	 
  end // always @ (ctx_state or ctx2rcm_ctx_gnt or next_gen_ctx)


// CTX state transitions
always @(posedge clk)
  begin
    if (rst_l == 1'b0)
      ctx_state <= CTXIDLE;	// Synchronous Reset
    else begin
      ctx_state <= ctx_next;
	end
end


// Packet Sequence Address Request State machine
//  SEQ next state 
always @(seq_state or ctx2rcm_seq_gnt or next_gen_pkt or pm2cm_rcd_full)
  begin
     seq_next = seq_state;
     
    case (seq_state)	// synopsys parallel_case
      SEQIDLE : begin
		 case (next_gen_pkt)   // synopsys full_case parallel_case
		   1'b0: seq_next = SEQIDLE;
		   1'b1: seq_next = SEQGNT;
		 endcase // case(next_gen_pkt)		 
	  end // case: SEQIDLE	  
	  
     SEQGNT : begin
		 case ({ctx2rcm_seq_gnt, pm2cm_rcd_full})   // synopsys parallel_case
		   2'b00,
           2'b01: seq_next = SEQGNT;
		   2'b11: seq_next = SEQWAIT;
		   2'b10: seq_next = SEQIDLE;
		 endcase // case({ctx2rcm_seq_gnt, next_gen_pkt})		
	 end // case: SEQGNT

	 SEQWAIT : begin  
		case(pm2cm_rcd_full)          // synopsys parallel_case
		  1'b0: seq_next = SEQIDLE;
		  1'b1: seq_next = SEQWAIT;
		endcase // case(next_gen_pkt)
	 end

     default : begin                     // to satisfy vlint
		seq_next = SEQIDLE;
	 end
	endcase // case(seq_state)	 
  end // always @ (seq_state or ctx2rcm_seq_gnt or next_gen_pkt)   

// SEQ outputs   
always @(seq_state or ctx2rcm_seq_gnt or next_gen_pkt or pm2cm_rcd_full)
  begin
	 xfr_strt = 1'b0;	 
	 next_pkseq_req = 1'b0;
     
    case (seq_state)	// synopsys parallel_case
      SEQIDLE : begin
		 case (next_gen_pkt)   // synopsys full_case parallel_case
		   1'b0: begin
			  xfr_strt = 1'b0;
			  next_pkseq_req = 1'b0;
		   end
		   1'b1: begin
			  xfr_strt = 1'b0;
			  next_pkseq_req = 1'b1;
		   end
		 endcase // case(next_gen_pkt)		 
	  end // case: SEQIDLE	  
	  
     SEQGNT : begin
		 case ({ctx2rcm_seq_gnt, pm2cm_rcd_full})   // synopsys parallel_case
		   2'b00,
           2'b01: begin			  
			  xfr_strt = 1'b0;
			  next_pkseq_req = 1'b1;
		   end
		   2'b11: begin
			  xfr_strt = 1'b0;
			  next_pkseq_req = 1'b0;
		   end
		   2'b10 : begin
			  xfr_strt = 1'b1;
			  next_pkseq_req = 1'b0;
		   end		   
		 endcase // case({ctx2rcm_seq_gnt, next_gen_pkt})
	 end // case: SEQGNT

     SEQWAIT : begin	  
		case(pm2cm_rcd_full)
		  1'b0: begin
			 xfr_strt = 1'b1;
			 next_pkseq_req = 1'b0;
		  end
		  
		  1'b1: begin
			 xfr_strt = 1'b0;
			 next_pkseq_req = 1'b0;
		  end		  
		endcase // case(next_gen_pkt)
	 end

     default : begin                     // to satisfy vlint
		xfr_strt = 1'b0;
		next_pkseq_req = 1'b0;
	 end
	endcase // case(seq_state)	 
  end // always @ (seq_state or ctx2rcm_seq_gnt or next_gen_pkt)   
   

// SEQ state transitions
always @(posedge clk)
  begin
    if (rst_l == 1'b0)
      seq_state <= SEQIDLE;	// Synchronous Reset
    else begin
      seq_state <= seq_next;
	end
end   

// Save inital PSEQ address to post in Context
always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin
	   first_ctx_gnt <= 0;
	end
    else begin
	   first_ctx_gnt <= ctx2rcm_ctx_gnt 
                        ? 1'b1 : (~rcm2ctx_ctx_rw & first_ctx_gnt);	   
	end
  end // always @ (posedge clk)

   
// Schedule Record dequeue and Transfer State machine
// BLD next state   
always @(bld_state or pipe_mpty or pm2cm_rcd_full or clastyp or multicycle 
         or pipe_clastyp or num_cmd or xfr_strt)
  begin
    case (bld_state)	// synopsys parallel_case
      BLDIDLE : begin
		 case (pipe_mpty) // synopsys parallel_case
		   1'b1 : bld_next = BLDIDLE;
		   1'b0 : begin
			  case (pipe_clastyp) // synopsys  parallel_case
				CLASRD : bld_next = BLDCNTX;
				CLASWR,
				CLASPIO,
				CLASMSI,
				CLASMSC,
				CLASMDO : bld_next = BLDBPAS;
				default : bld_next = BLDIDLE;
			  endcase // case(pipe_clastyp)
		   end
		 endcase // case(pipe_mpty)
	  end // case: BLDDEQ	  

     BLDCNTX : begin
		case(pm2cm_rcd_full) 	// synopsys full_case parallel_case
		  1'b0 : begin
			 case ({multicycle,xfr_strt}) // synopsys full_case parallel_case
			   2'b00 : bld_next = BLDCNTX;
			   2'b01 : bld_next = BLDIDLE;
			   2'b10 : bld_next = BLDCNTX;
			   2'b11 : begin
				  if(num_cmd == 6'h01) bld_next = BLDIDLE;
				  else bld_next = BLDCNTX;
			   end
			 endcase // case({multicycle,xfr_strt})
		  end // case: 1'b0

		  1'b1 : bld_next = BLDCNTX;
		endcase // case(pm2cm_rcd_full)
	 end // case: BLDCNTX	  
	  
     BLDBPAS : begin
		case(pm2cm_rcd_full) 	// synopsys full_case parallel_case
		  1'b1 : bld_next = BLDBPAS;					
		  1'b0 : begin
			 case({multicycle, clastyp})  // synopsys parallel_case
			   {1'b1,CLASWR} : begin
				  if (num_cmd == 6'h01) bld_next = BLDIDLE;
				  else bld_next = BLDBPAS;
			   end
			   {1'b1,CLASRD},
			   {1'b1,CLASMSI},
			   {1'b1,CLASMDO},
			   {1'b1,CLASMSC} : bld_next = BLDIDLE;

			   {1'b0,CLASWR},
			   {1'b0,CLASPIO},
			   {1'b0,CLASMSI},
			   {1'b0,CLASMDO},
			   {1'b0,CLASMSC} : bld_next = BLDIDLE;

               default : bld_next = BLDIDLE;
			 endcase // case({multicycle, clastyp})
		  end // case: 1'b0
		endcase // case(pm2cm_rcd_full)
	 end // case: BLDBPAS

    default: bld_next = BLDIDLE;	  

	endcase // case(bld_state)
  end // always @ (bld_state or pipe_mpty or pm2cm_rcd_full or clastyp or multicycle...


// BLD state machine outputs   
always @(bld_state or pipe_mpty or pm2cm_rcd_full or clastyp or multicycle 
         or pipe_clastyp or num_cmd or xfr_strt)
  begin

// next_deq_pipe = signal to dequeue next packet from pipeline
// next_rcd_enq = signal to enqueue packet record to output queue
// next_gen_ctx = signal to strt context operations
// next_gen_pkt = signal to enqueue packet to output queue
// ld_ptr =  signal loads new packet values for multicycles
	 
    case (bld_state)	// synopsys parallel_case
      BLDIDLE : begin
		 next_rcd_enq = 1'b0;
		 ld_ptr = 1'b0;
		 case (pipe_mpty) // synopsys full_case parallel_case
		   1'b1 : begin
			  next_deq_pipe = 1'b0;
			  next_gen_ctx = 1'b0;
			  next_gen_pkt = 1'b0;
		   end
		   1'b0 : begin
			  case (pipe_clastyp) // synopsys  parallel_case
				CLASRD : begin
				   next_deq_pipe = 1'b1;
				   next_gen_ctx = 1'b1;
				   next_gen_pkt = 1'b1;
				end
				
				CLASWR,
				CLASPIO,
				CLASMSI,
				CLASMSC,
				CLASMDO : begin
				   next_deq_pipe = 1'b1;
				   next_gen_ctx = 1'b0;
				   next_gen_pkt = 1'b0;
				end // case: CLASWR,...

				default : begin
				   next_deq_pipe = 1'b0;
				   next_gen_ctx = 1'b0;
				   next_gen_pkt = 1'b0;
				end				
			  endcase // case(pipe_clastyp)
		   end // case: 1'b0		   
		 endcase // case(pipe_mpty)
	  end // case: BLDDEQ	  

     BLDCNTX : begin
		next_deq_pipe = 1'b0;
		next_gen_ctx = 1'b0;
		
		case(pm2cm_rcd_full) 	// synopsys full_case parallel_case
		  1'b0 : begin
			 case ({multicycle,xfr_strt}) // synopsys full_case parallel_case
			   2'b00 : begin				  				  
				  next_rcd_enq = 1'b0;				  
				  next_gen_pkt = 1'b0;
				  ld_ptr = 1'b0;
			   end
			   2'b01 : begin
				  next_rcd_enq = 1'b1;
				  next_gen_pkt = 1'b0;
				  ld_ptr = 1'b0;
			   end			   
			   2'b10 : begin
				  next_rcd_enq = 1'b0;
				  next_gen_pkt = 1'b1;
				  ld_ptr = 1'b0;
			   end			   
			   2'b11 : begin
				  if(num_cmd == 6'h01) begin
					 next_rcd_enq = 1'b1;
					 next_gen_pkt = 1'b0;
					 ld_ptr = 1'b1;
				  end				  
				  else begin
					 next_rcd_enq = 1'b1;
					 next_gen_pkt = 1'b1;
					 ld_ptr = 1'b1;
				  end // else: !if(num_cmd == 5'h01)				  
			   end // case: 2'b11
			 endcase // case({multicycle,xfr_strt})
		  end // case: 1'b0

		  1'b1 : begin
			 next_rcd_enq = 1'b0;
			 next_gen_pkt = 1'b0;
			 ld_ptr = 1'b0;
		  end // case: 1'b1
		endcase // case(pm2cm_rcd_full)
	 end // case: BLDCNTX	  
	  
     BLDBPAS : begin
		next_deq_pipe = 1'b0;
		next_gen_ctx = 1'b0;
		next_gen_pkt = 1'b0;
		case(pm2cm_rcd_full) 	// synopsys full_case parallel_case
		  1'b0 : begin
			 case({multicycle, clastyp})  // synopsys parallel_case
			   {1'b1,CLASWR} : begin
				  next_rcd_enq = 1'b1;
				  ld_ptr = 1'b1;
			   end

			   {1'b1,CLASRD},
			   {1'b1,CLASMSI},
			   {1'b1,CLASMDO},
			   {1'b1,CLASMSC} : begin
				  next_rcd_enq = 1'b0;
				  ld_ptr = 1'b0;
			   end // case: {1'b1,CLASRD},...
			   

			   {1'b0,CLASWR},
			   {1'b0,CLASMSI},
			   {1'b0,CLASMDO},
			   {1'b0,CLASMSC} : begin
				  next_rcd_enq = 1'b1;
				  ld_ptr = 1'b0;
			   end // case: {1'b0,CLASWR},...			   

		       default : begin
				  next_rcd_enq = 1'b1;
				  ld_ptr = 1'b1;
			   end
			 endcase // case({multicycle, clastyp})
		  end // case: 1'b0

		  1'b1 : begin
			   next_rcd_enq = 1'b0;
			   ld_ptr = 1'b0;

		  end // case: 1'b1
		endcase // case(pm2cm_rcd_full)
	 end // case: BLDBPAS	  

     default: begin
		 next_deq_pipe = 1'b0;
		 next_rcd_enq = 1'b0;
		 next_gen_ctx = 1'b0;
		 next_gen_pkt = 1'b0;
		 ld_ptr = 1'b0;
	 end

	endcase // case(bld_state)
  end // always @ (bld_state or pipe_mpty or pm2cm_rcd_full or clastyp or multicycle...
   
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

dmu_cmu_rcm_schrcd_q rcm_queue (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (mm2cm_rcd_enq),
		.rcd_in (mm2cm_rcd),
		.deq (next_deq_sr), 
        .typ (srtyp),
        .len(srlen),
        .dwbe (srdwbe),
        .addr(sraddr),
        .addr_err(sraddrerr),
        .dptr(srdptr),
        .sbd_tag(srtr_tag),
		.full (cm2mm_rcd_full),
        .empty (srmpty),
        .overflow(),            // .overflow(overflow),  //for debug use
        .underflow()            // .underflow(underflow) //for debug use
		);

// ********************** signal registers *************************/

always @(posedge clk)
  begin	 
    if (rst_l == 1'b0) begin
	   deq_pipe <= 0;
	   cm2pm_rcd_enq <= 0;

       rcm2ctx_ctx_req <= 0;	   
       rcm2ctx_ctx_addr <= 0;
	   rcm2ctx_ctx_rw  <= 0;

       rcm2ctx_seq_req <= 0;
	   rcm2ctx_pkseq_addr <= 0;
	   rcm2ctx_pkseq_rw <= 0;	   

       cur_ctx <= 0;
       rcm2ctx_ctx <= 0;

	   pipe_full <= 0;	   
	   
	end	 
    else begin
       deq_pipe <= next_deq_pipe;
	   
	   cm2pm_rcd_enq <= next_rcd_enq;

	   rcm2ctx_ctx_req <= next_ctx_req;
       rcm2ctx_ctx_addr <= ctx2rcm_ctx_gnt ? ctx2rcm_nxctx_addr : rcm2ctx_ctx_addr;
	   rcm2ctx_ctx_rw <= ((clastyp == CLASRD) && first_ctx_gnt)
                           ? cm2pm_rcd_enq : 1'b0;
	   rcm2ctx_seq_req <= next_pkseq_req;
       rcm2ctx_pkseq_addr <= ctx2rcm_seq_gnt ? ctx2rcm_nxseq_addr 
                                             : rcm2ctx_pkseq_addr;
	   rcm2ctx_pkseq_rw <= (clastyp == CLASRD) ? next_rcd_enq : 1'b0;
	   
       cur_ctx <= ctx2rcm_ctx_gnt ? ctx2rcm_cur_ctx : cur_ctx;

       rcm2ctx_ctx <= (first_ctx_gnt & cm2pm_rcd_enq)
                       ? ({                               // Context entry
						cycles[CLTOTMSB :0],
						rcm2ctx_pkseq_addr[PSEQADDRMSB :0],
						pkt_addr_err,
						new_order_bits[ORDERBITMSB :0]
						}) 
                       : {(CTXARRAYMSB + 1){1'b0}};	   

	   pipe_full <= ld_pipe ? 1'b1 : (~deq_pipe & pipe_full);

	end // else: !if(rst_l == 1'b0)	 
  end // always @ (posedge clk)
   
// ----------------------------------------------------------------------------
// Debug
// ----------------------------------------------------------------------------
   
always @ (dbg2rcm_dbg_sel_a or dbg2rcm_dbg_sel_b) 
  begin
	 dbg_sel[0] = dbg2rcm_dbg_sel_a;
	 dbg_sel[1] = dbg2rcm_dbg_sel_b;
  end

always @ (dbg_sel[0] or dbg_sel[1] or next_cycles or next_clastyp or
		  pipe_cycles or pipe_clastyp or xfr_strt or pipe_mcycle or
          clastyp or bld_state or srmpty or next_deq_sr or ld_pipe or 
          pipe_full or deq_state or ld_ptr or pipe_mpty or next_deq_pipe or
          next_gen_ctx or next_gen_pkt or pm2cm_rcd_full or multicycle or 
          ctx2rcm_ctx_gnt or next_ctx_req or rcm_is_idle or
          y2k_mps or ctx_state or next_pkseq_req or 
          ctx2rcm_seq_gnt or seq_state
		  )
  begin
	 for (i = 0; i < 2; i = i + 1) begin
		case (dbg_sel[i]) // synopsys infer_mux
		  3'b000: nxt_dbg_bus[i] = {next_cycles[CLTOTMSB -1 :0],next_clastyp};
		  3'b001: nxt_dbg_bus[i] = {pipe_cycles[CLTOTMSB -1 :0],pipe_clastyp};
		  3'b010: nxt_dbg_bus[i] = {xfr_strt,pipe_mcycle,clastyp,bld_state};
		  3'b011: nxt_dbg_bus[i] = {1'b0,rcm_is_idle,srmpty,next_deq_sr,ld_pipe,pipe_full,deq_state};
		  3'b100: nxt_dbg_bus[i] = {ld_ptr,pipe_mpty,next_deq_pipe,next_gen_ctx,next_gen_pkt,pipe_clastyp};
		  3'b101: nxt_dbg_bus[i] = {pm2cm_rcd_full,multicycle,clastyp,bld_state};		  
		  3'b110: nxt_dbg_bus[i] = {xfr_strt,ctx2rcm_ctx_gnt,next_ctx_req,y2k_mps,ctx_state};
		  3'b111: nxt_dbg_bus[i] = {3'b000,next_gen_pkt,next_pkseq_req,ctx2rcm_seq_gnt,seq_state};		  
		endcase // case(dbg_sel[i])
	 end // for (i = 0; i < 2; i = i + 1)
  end // always @ (dbg_sel[0] or dbg_sel[1] or...   
   
// ********************** Output Procedures ***********************/

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


//Pipeline final output stage for next packet record sequence

always @(posedge clk)
   if(rst_l == 1'b0) begin
		  pkt_typ       <= {PRTYP_WDTH{1'b0}};
		  pkt_len       <= {PRLEN_WDTH{1'b0}};
		  pkt_byt_cnt   <= {PRBYTCNT_WDTH{1'b0}};
		  pkt_cntxt_num <= {PRCNTXTNUM_WDTH{1'b0}};
		  pkt_seq_num   <= {PRSEQNUM_WDTH{1'b0}};
		  pkt_addr      <= {PRADDR_WDTH{1'b0}};
		  pkt_addr_err  <= {{1'b0}};
		  pkt_tr_tag    <= {PRSBDTAG_WDTH{1'b0}};
		  pkt_dptr      <= {PRDPTR_WDTH{1'b0}};
	end
  else begin
	 case ({bld_state,multicycle})   // synopsys parallel_case

// Single cycle pipeline stage		 
	   4'b0100 : begin            // BLDCNTX  modify
		  pkt_typ       <= next_rcd_enq ? cyc_typ : pkt_typ;
		  pkt_len       <= next_rcd_enq ? cyc_len[SRLENMSB :0] : pkt_len;
		  pkt_byt_cnt   <= next_rcd_enq ? cyc_bytcnt : pkt_byt_cnt;
		  pkt_cntxt_num <= next_rcd_enq ? cyc_cntxtnum : pkt_cntxt_num;
		  pkt_seq_num   <= next_rcd_enq ? cyc_seqnum : pkt_seq_num;
		  pkt_addr      <= next_rcd_enq ? cyc_addr : pkt_addr;			
		  pkt_addr_err  <= next_rcd_enq ? cyc_addrerr :pkt_addr_err ;
		  pkt_tr_tag    <= next_rcd_enq ? cyc_trtag : pkt_tr_tag;
		  pkt_dptr      <= next_rcd_enq ? cyc_dptr : pkt_dptr;
	   end // case: 4'b0100	   

	   4'b0110 : begin            // BLDBPAS
		  pkt_typ       <= next_rcd_enq ? cyc_typ : pkt_typ;
		  pkt_len       <= next_rcd_enq ? cyc_len[SRLENMSB :0] : pkt_len;
		  pkt_byt_cnt   <= next_rcd_enq ? cyc_bytcnt : pkt_byt_cnt;
		  pkt_cntxt_num <= next_rcd_enq ? cyc_cntxtnum : pkt_cntxt_num;
		  pkt_seq_num   <= next_rcd_enq ? cyc_seqnum : pkt_seq_num;			
		  pkt_addr      <= next_rcd_enq ? cyc_addr : pkt_addr;			
		  pkt_addr_err  <= next_rcd_enq ? cyc_addrerr :pkt_addr_err ;
		  pkt_tr_tag    <= next_rcd_enq ? cyc_trtag : pkt_tr_tag;
		  pkt_dptr      <= next_rcd_enq ? cyc_dptr : pkt_dptr;
	   end // case: 4'b0110
	   
// multicycle pipeline stages
	   4'b0101 : begin            // BLDCNTX modify 
		  pkt_typ       <= next_rcd_enq ? cyc_typ : pkt_typ;
		  pkt_len       <= next_rcd_enq ? cyc_len[SRLENMSB :0] : pkt_len;
		  pkt_byt_cnt   <= next_rcd_enq ? (num_cmd == 6'h01)
                                            ? ((cyc_len == 11'h001) ? byt_cnt(cyc_len, {lastdwbe, 4'h0})
											                        : byt_cnt(cyc_len, {lastdwbe,new_payld_dwbe[3:0]}))
		                                    : byt_cnt(cyc_len, new_payld_dwbe)
                                        : pkt_byt_cnt;			

		  pkt_cntxt_num <= next_rcd_enq ? cyc_cntxtnum : pkt_cntxt_num;
		  pkt_seq_num   <= next_rcd_enq ? cyc_seqnum : pkt_seq_num;
		  pkt_addr      <= next_rcd_enq ? cyc_addr : pkt_addr;			
		  pkt_addr_err  <= next_rcd_enq ? cyc_addrerr :pkt_addr_err ;
		  pkt_tr_tag    <= next_rcd_enq ? cyc_trtag : pkt_tr_tag;
		  pkt_dptr      <= next_rcd_enq ? cyc_dptr : pkt_dptr;
	   end // case: 4'b0101
	   
	   4'b0111 : begin            // BLDBPAS  modify
		  pkt_typ       <= next_rcd_enq ? cyc_typ : pkt_typ;
		  pkt_len       <= next_rcd_enq ? cyc_len[SRLENMSB :0] : pkt_len;
		  pkt_byt_cnt   <= next_rcd_enq ? cyc_bytcnt : pkt_byt_cnt;			
		  pkt_cntxt_num <= next_rcd_enq ? cyc_cntxtnum : pkt_cntxt_num;
		  pkt_seq_num   <= next_rcd_enq ? cyc_seqnum : pkt_seq_num;
		  pkt_addr      <= next_rcd_enq ? cyc_addr : pkt_addr;			
		  pkt_addr_err  <= next_rcd_enq ? cyc_addrerr :pkt_addr_err ;
		  pkt_tr_tag    <= next_rcd_enq ? cyc_trtag : pkt_tr_tag;
		  pkt_dptr      <= next_rcd_enq ? cyc_dptr : pkt_dptr;
	   end // case: 4'b0111
	   
	   default : begin
		  pkt_typ       <= pkt_typ;
		  pkt_len       <= pkt_len;
		  pkt_byt_cnt   <= pkt_byt_cnt;
		  pkt_cntxt_num <= pkt_cntxt_num;
		  pkt_seq_num   <= pkt_seq_num;
		  pkt_addr      <= pkt_addr;
		  pkt_addr_err  <= pkt_addr_err;			
		  pkt_tr_tag    <= pkt_tr_tag;
		  pkt_dptr      <= pkt_dptr;
	   end // case: default
	 endcase // case({bld_state,multicycle})
  end // always @ (posedge clk)

always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin
	   rcm_is_idle <= 1'b1;	   
     end
    else begin
	   rcm_is_idle <= ((srmpty == 1'b1) && (deq_state ==  DEQIDLE) &&
					   (ctx_state == CTXIDLE) && (seq_state == SEQIDLE) &&
                       (pipe_mpty == 1'b1) && (bld_state == BLDIDLE))
                      ? 1'b1 : 1'b0;
	end
  end
   
// ***********************Assignments *****************************/

// Signal assignments
   assign pipe_mpty = ~pipe_full;
   
   assign cacheline = 11'h010;

   assign part_len = cacheline - {7'h00, sraddr[3:0]}; //make vlint happy

   assign fourk_bit = ~|srlen[SRLENMSB :0];

   assign explen = {fourk_bit,srlen[SRLENMSB :0]};

   assign restof_len = explen - first_len;
   
   
//DMA Wr's

   assign lo_addr = (cyc_addr[9:0] + cyc_len[SRLENMSB :0]);

   assign temp_len = next_deq_pipe ? (cacheline - {7'h00, pipe_addr[3:0]}) 
                               : (adj_len - cyc_len);
   
// DMA Rd's
// allign to bigest payload < maxpayload

   assign first_len = (maxpyld - {7'h00,sraddr[3:0]});
   
   assign sel_payld_len = (temp_payld_len > maxpyld)
                          ? maxpyld  
                          : ((payld_offset == 0) ? rem_payld_len
                                                 : {temp_payld_len[10:4], 4'h0});
   assign payld_lo_addr = (cyc_addr[9:0] + cyc_len[9:0]);

// new temp payload length based on first_len
  assign temp_payld_len = next_deq_pipe ? first_len 
                                        : (adj_payld_len - cyc_len);

   assign payld_offset =  get_payld_offset(temp_payld_len, y2k_mps);

// Output assignments   

   assign rcm2ctx_pkseq = {                          // PKSEQ entry
						   1'b0,
						   {CLSTADDRMSB +1{1'b0}}    //make vlint happy
						   };   

   assign cm2pm_rcd [IPRMSB :0]  = {         // Egress Retire Record
                                   pkt_typ[PRTYPMSB :0],
								   pkt_len[PRLENMSB :0],
								   pkt_byt_cnt[PRBYTCNTMSB :0],
								   pkt_cntxt_num[PRCNTXTNUMMSB :0],
								   pkt_seq_num[PRSEQNUMMSB :0],
								   pkt_addr[PRADDRMSB :0],
								   pkt_addr_err,
								   pkt_dptr[PRDPTRMSB :0],
								   pkt_tr_tag[PRSBDTAGMSB :0]
								   };
// Debug
  assign rcm2dbg_dbg_a = dbg_bus[0];
  assign rcm2dbg_dbg_b = dbg_bus[1];

endmodule 
