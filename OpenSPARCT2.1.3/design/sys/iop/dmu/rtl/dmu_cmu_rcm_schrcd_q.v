// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu_rcm_schrcd_q.v
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
module dmu_cmu_rcm_schrcd_q (
		clk, 	
		rst_l,
        enq,
		rcd_in,
        deq, 
        typ,
        len,
        dwbe,
        addr,
        addr_err,
        dptr,
        sbd_tag,
		full,
        empty,
        overflow,
        underflow
       );
     
//************************************************
//				PARAMETERS
//************************************************

   parameter  DEPTH = 4;

// Ingress Schedule Record Fields   
// parameter MM2CM_WDTH      = `FIRE_DLC_ISR_REC_WDTH;       //79
   parameter SRMSB           = `FIRE_DLC_ISR_MSB;            // MM2CM_WDTH -1

   parameter SRTYP_WDTH      = `FIRE_DLC_ISR_TYP_WDTH,       // 7
			 SRLEN_WDTH      = `FIRE_DLC_ISR_LEN_WDTH,       //10
			 SRDWBE_WDTH     = `FIRE_DLC_ISR_DWBE_WDTH,      // 8
			 SRADDR_WDTH     = `FIRE_DLC_ISR_ADDR_WDTH,      //41
//			 SRADDERR_WDTH   = `FIRE_DLC_ISR_ADDRERR_WDTH,   // 1
			 SRDPTR_WDTH     = `FIRE_DLC_ISR_DPTR_WDTH,      // 7
			 SRSBDTAG_WDTH   = `FIRE_DLC_ISR_SBDTAG_WDTH;    // 5

   parameter SRTYPMSB        =  SRTYP_WDTH -1,
             SRLENMSB        =  SRLEN_WDTH -1,
			 SRDWBEMSB       =  SRDWBE_WDTH -1,
			 SRADDRMSB       =  SRADDR_WDTH -1,
//			 SRADDRERRMSB    =  1,
			 SRDPTRMSB       =  SRDPTR_WDTH -1,
			 SRSBDTAGMSB     =  SRSBDTAG_WDTH -1;

   parameter SBDTAGLSB      = 0,
             SBDTAGMSB      = `FIRE_DLC_ISR_SBDTAG_MSB,
             DPTRLSB        = `FIRE_DLC_ISR_DPTR_LSB,
             DPTRMSB        = `FIRE_DLC_ISR_DPTR_MSB,
//           ADDRERRLSB     = `FIRE_DLC_ISR_ADDRERR_LSB,
             ADDRERRMSB     = `FIRE_DLC_ISR_ADDRERR_MSB,
             ADDRLSB        = `FIRE_DLC_ISR_ADDR_LSB,
             ADDRMSB        = `FIRE_DLC_ISR_ADDR_MSB,
             DWBELSB        = `FIRE_DLC_ISR_DWBE_LSB,
             DWBEMSB        = `FIRE_DLC_ISR_DWBE_MSB,
             LENLSB         = `FIRE_DLC_ISR_LEN_LSB,
             LENMSB         = `FIRE_DLC_ISR_LEN_MSB,
             TYPLSB         = `FIRE_DLC_ISR_TYP_LSB,
             TYPMSB         = `FIRE_DLC_ISR_TYP_MSB;
   

//************************************************
//				PORTS
//************************************************

  input clk;                             // The input clock
  input rst_l;                           // The fifo rst_l

  input [SRMSB :0] rcd_in;               // Schedule record in
  input enq;                             // enqueue to schrcd_q
  input deq;                             // local dequeue for packet fifo
        
  output [SRTYPMSB : 0] typ;
  output [SRLENMSB : 0] len;
  output [SRDWBEMSB : 0] dwbe;
  output [SRADDRMSB : 0] addr;
  output addr_err;
  output [SRDPTRMSB : 0] dptr;
  output [SRSBDTAGMSB : 0] sbd_tag;

  output full;                      // schrcd_q is full
  output overflow;                  // schrcd_q overflow
  output underflow;                 // schrcd_q underflow
  output empty;                     // fifo empty exported

//************************************************
//				SIGNALS
//************************************************
 
  wire clk;
  wire rst_l;

  wire typ_full, typ_empty, typ_overflow, typ_underflow;
  wire len_empty, len_overflow, len_underflow;
  wire dwbe_empty, dwbe_overflow, dwbe_underflow;
  wire addr_empty, addr_overflow, addr_underflow;
  wire dptr_empty, dptr_overflow, dptr_underflow;
  wire sbdtag_empty, sbdtag_overflow, sbdtag_underflow;

  wire [SRTYPMSB : 0] rcd_typ; 
  wire [SRLENMSB : 0] rcd_len;
  wire [SRDWBEMSB : 0] rcd_dwbe;
  wire [SRADDRMSB : 0] rcd_addr;
  wire rcd_addrerr;   
  wire [SRDPTRMSB : 0] rcd_dptr;
  wire [SRSBDTAGMSB : 0] rcd_sbdtag;

// Schedule Record field assignments to RCM signals
  assign rcd_typ[SRTYPMSB : 0]           = rcd_in[TYPMSB : TYPLSB ]; 
  assign rcd_len[SRLENMSB : 0]           = rcd_in[LENMSB : LENLSB];
  assign rcd_dwbe[SRDWBEMSB : 0]         = rcd_in[DWBEMSB : DWBELSB];
  assign rcd_addr[SRADDRMSB : 0]         = rcd_in[ADDRMSB : ADDRLSB];
  assign rcd_addrerr                     = rcd_in[ADDRERRMSB];
  assign rcd_dptr[SRDPTRMSB : 0]         = rcd_in[DPTRMSB : DPTRLSB];
  assign rcd_sbdtag[SRSBDTAGMSB : 0]     = rcd_in[SBDTAGMSB : SBDTAGLSB];

   
//************************************************
//				Modules
//************************************************

fire_dmc_common_srfifo #(SRTYP_WDTH, DEPTH) typ_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_typ),
        .deq (deq), 
		.data_out (typ),
		.full (typ_full),
        .empty (typ_empty),
        .overflow(typ_overflow),
        .underflow(typ_underflow)
		);

fire_dmc_common_srfifo #(SRLEN_WDTH, DEPTH) len_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_len),
        .deq (deq), 
		.data_out (len),
		.full (),
        .empty (len_empty),
        .overflow(len_overflow),
        .underflow(len_underflow)
		);

fire_dmc_common_srfifo #(SRDWBE_WDTH, DEPTH) dwbe_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_dwbe),
        .deq (deq), 
		.data_out (dwbe),
		.full (),
        .empty (dwbe_empty),
        .overflow(dwbe_overflow),
        .underflow(dwbe_underflow)
		);

// address and addrerr carried in addr_srfifo   
fire_dmc_common_srfifo #(SRADDR_WDTH +1, DEPTH) addr_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in ({rcd_addr, rcd_addrerr}),
        .deq (deq), 
		.data_out ({addr, addr_err}),
		.full (),
        .empty (addr_empty),
        .overflow(addr_overflow),
        .underflow(addr_underflow)
		);

fire_dmc_common_srfifo #(SRDPTR_WDTH, DEPTH) dptr_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_dptr),
        .deq (deq), 
		.data_out (dptr),
		.full (),
        .empty (dptr_empty),
        .overflow(dptr_overflow),
        .underflow(dptr_underflow)
		);

fire_dmc_common_srfifo #(SRSBDTAG_WDTH, DEPTH) sbdtag_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_sbdtag),
        .deq (deq), 
		.data_out (sbd_tag),
		.full (),
        .empty (sbdtag_empty),
        .overflow(sbdtag_overflow),
        .underflow(sbdtag_underflow)
		);



//assign full = (typ_full | len_full | dwbe_full | 
//               addr_full | dptr_full | sbdtag_full);

assign full = typ_full;  // since all fifos are in lock step, single fifo full
                         // can be exported

assign overflow = (typ_overflow | len_overflow | dwbe_overflow | 
                   addr_overflow | dptr_overflow | sbdtag_overflow);

assign underflow = (typ_underflow | len_underflow | dwbe_underflow | 
                    addr_underflow | dptr_underflow | sbdtag_underflow);

assign empty = (typ_empty & len_empty & dwbe_empty & 
                addr_empty & dptr_empty & sbdtag_empty);

endmodule 
