// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_pmu_prcd_q.v
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
module dmu_pmu_prcd_q (
		clk, 	
		rst_l,
        enq,
		rcd_in,
        deq, 
        typ,
        len,
        byt_cnt,
        cntxt_num,
        pkseq_num,
        addr,
        addr_err,
        dptr,
        sbd_tag,
		full,
        overflow,
        underflow,
        empty
       );
     
//************************************************
//				PARAMETERS
//************************************************

parameter DEPTH = 4;

// Packet Record Field widths

 parameter  SBDTAG_WDTH   = `FIRE_DLC_IPR_SBDTAG_WDTH,       // 5
            DPTR_WDTH     = `FIRE_DLC_IPR_DPTR_WDTH,         // 7
//          ADDRERR_WDTH  = `FIRE_DLC_IPR_ADDRERR_WDTH,      // 1
            ADDR_WDTH     = `FIRE_DLC_IPR_ADDR_WDTH,         //41
            PKSEQNUM_WDTH = `FIRE_DLC_IPR_PKSEQNUM_WDTH,     // 5
            CNTXTNUM_WDTH = `FIRE_DLC_IPR_CNTXTNUM_WDTH,     // 5
            BYTCNT_WDTH   = `FIRE_DLC_IPR_BYTCNT_WDTH,       //12
            LEN_WDTH      = `FIRE_DLC_IPR_LEN_WDTH,          //10
            TYP_WDTH      = `FIRE_DLC_IPR_TYP_WDTH;          // 7

 parameter  SBDTAGMSB   = SBDTAG_WDTH -1,
            DPTRMSB     = DPTR_WDTH  -1,
            ADDRMSB     = ADDR_WDTH -1,
            PKSEQNUMMSB = PKSEQNUM_WDTH -1,
            CNTXTNUMMSB = CNTXTNUM_WDTH -1,
            BYTCNTMSB   = BYTCNT_WDTH  -1,
            LENMSB      = LEN_WDTH  -1,
            TYPMSB      = TYP_WDTH -1;   
   
 parameter  SBDTAG_LSB    = 0,
            SBDTAG_MSB    = `FIRE_DLC_IPR_SBDTAG_MSB,
            DPTR_LSB      = `FIRE_DLC_IPR_DPTR_LSB,
            DPTR_MSB      = `FIRE_DLC_IPR_DPTR_MSB,
            ADDRERR_MSB   = `FIRE_DLC_IPR_ADDRERR_MSB,
            ADDR_LSB      = `FIRE_DLC_IPR_ADDR_LSB,
            ADDR_MSB      = `FIRE_DLC_IPR_ADDR_MSB,
            PKSEQNUM_LSB  = `FIRE_DLC_IPR_PKSEQNUM_LSB,
            PKSEQNUM_MSB  = `FIRE_DLC_IPR_PKSEQNUM_MSB,
            CNTXTNUM_LSB  = `FIRE_DLC_IPR_CNTXTNUM_LSB,
            CNTXTNUM_MSB  = `FIRE_DLC_IPR_CNTXTNUM_MSB,
            BYTCNT_LSB    = `FIRE_DLC_IPR_BYTCNT_LSB,
            BYTCNT_MSB    = `FIRE_DLC_IPR_BYTCNT_MSB,
            LEN_LSB       = `FIRE_DLC_IPR_LEN_LSB,
            LEN_MSB       = `FIRE_DLC_IPR_LEN_MSB,
            TYP_LSB       = `FIRE_DLC_IPR_TYP_LSB,
            TYP_MSB       = `FIRE_DLC_IPR_TYP_MSB;   

//  parameter  CM2PM_WDTH = `FIRE_DLC_IPR_REC_WDTH;           //93

 parameter  IPRMSB         = `FIRE_DLC_IPR_MSB;               // CM2PM_WDTH -1;


//************************************************
//				PORTS
//************************************************

  input clk;                             // The input clock
  input rst_l;                           // fifo reset

  input [IPRMSB :0] rcd_in;              // packet record in
  input enq;                             // enqueue to prcd_q
  input deq;                             // local dequeue for packet fifo
        
  output [TYPMSB : 0] typ;
  output [LENMSB : 0] len;
  output [BYTCNTMSB : 0] byt_cnt;
  output [CNTXTNUMMSB : 0] cntxt_num;
  output [PKSEQNUMMSB : 0] pkseq_num;
  output [ADDRMSB : 0] addr;
  output addr_err;
  output [DPTRMSB : 0] dptr;
  output [SBDTAGMSB : 0] sbd_tag;

  output full;                      // prcd_q is full
  output overflow;                  // prcd_q overflow
  output underflow;                 // prcd_q underflow
  output empty;                     // fifo empty exported

//************************************************
//				SIGNALS
//************************************************
 
  wire clk;
  wire rst_l;
  wire typ_full;

//  wire len_full,           // left in comments for later use if needed
//	   bytcnt_full,
//	   cntxtnum_full,
//	   pkseqnum_full,
//	   addr_full,
//	   dptr_full,
//	   sbdtag_full;   
	 
  wire typ_empty, typ_overflow, typ_underflow;
  wire len_empty, len_overflow, len_underflow;
  wire bytcnt_empty, bytcnt_overflow, bytcnt_underflow;
  wire cntxtnum_empty, cntxtnum_overflow, cntxtnum_underflow;
  wire pkseqnum_empty, pkseqnum_overflow, pkseqnum_underflow;
  wire addr_empty, addr_overflow, addr_underflow;
  wire dptr_empty, dptr_overflow, dptr_underflow;
  wire sbdtag_empty, sbdtag_overflow, sbdtag_underflow;

  wire [TYPMSB : 0] rcd_typ; 
  wire [LENMSB : 0] rcd_len;
  wire [BYTCNTMSB : 0] rcd_bytcnt;
  wire [CNTXTNUMMSB : 0] rcd_cntxtnum;
  wire [PKSEQNUMMSB : 0] rcd_pkseqnum;
  wire [ADDRMSB : 0] rcd_addr;
  wire rcd_addrerr;
  wire [DPTRMSB : 0] rcd_dptr;
  wire [SBDTAGMSB : 0] rcd_sbdtag;

//************************************************
// Zero In checkers
//************************************************

 


// Packet Record field assignments to PRM signals
  assign rcd_typ[TYPMSB : 0]           = rcd_in[TYP_MSB : TYP_LSB ]; 
  assign rcd_len[LENMSB : 0]           = rcd_in[LEN_MSB : LEN_LSB];
  assign rcd_bytcnt[BYTCNTMSB : 0]     = rcd_in[BYTCNT_MSB : BYTCNT_LSB];
  assign rcd_cntxtnum[CNTXTNUMMSB : 0] = rcd_in[CNTXTNUM_MSB : CNTXTNUM_LSB];
  assign rcd_pkseqnum[PKSEQNUMMSB : 0] = rcd_in[PKSEQNUM_MSB : PKSEQNUM_LSB];
  assign rcd_addr[ADDRMSB : 0]         = rcd_in[ADDR_MSB : ADDR_LSB];
  assign rcd_addrerr                   = rcd_in[ADDRERR_MSB];
  assign rcd_dptr[DPTRMSB : 0]         = rcd_in[DPTR_MSB : DPTR_LSB];
  assign rcd_sbdtag[SBDTAGMSB : 0]     = rcd_in[SBDTAG_MSB : SBDTAG_LSB];

//************************************************
//				Modules
//************************************************

fire_dmc_common_srfifo #(TYP_WDTH, DEPTH) typ_srfifo (
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

fire_dmc_common_srfifo #(LEN_WDTH, DEPTH) len_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_len),
        .deq (deq), 
		.data_out (len),
		.full (),                  // left as null port for later use if needed
        .empty (len_empty),
        .overflow(len_overflow),
        .underflow(len_underflow)
		);

fire_dmc_common_srfifo #(BYTCNT_WDTH, DEPTH) bytcnt_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_bytcnt),
        .deq (deq), 
		.data_out (byt_cnt),
		.full (),                  // left as null port for later use if needed
        .empty (bytcnt_empty),
        .overflow(bytcnt_overflow),
        .underflow(bytcnt_underflow)
		);

fire_dmc_common_srfifo #(CNTXTNUM_WDTH, DEPTH) cntxtnum_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_cntxtnum),
        .deq (deq), 
		.data_out (cntxt_num),
		.full (),                  // left as null port for later use if needed
        .empty (cntxtnum_empty),
        .overflow(cntxtnum_overflow),
        .underflow(cntxtnum_underflow)
		);

fire_dmc_common_srfifo #(PKSEQNUM_WDTH, DEPTH) pkseqnum_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_pkseqnum),
        .deq (deq), 
		.data_out (pkseq_num),
		.full (),                  // left as null port for later use if needed
        .empty (pkseqnum_empty),
        .overflow(pkseqnum_overflow),
        .underflow(pkseqnum_underflow)
		);

// address, address err in same fifo
fire_dmc_common_srfifo #(ADDR_WDTH +1, DEPTH) addr_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in ({rcd_addr, rcd_addrerr}),
        .deq (deq), 
		.data_out ({addr, addr_err}),
		.full (),                  // left as null port for later use if needed
        .empty (addr_empty),
        .overflow(addr_overflow),
        .underflow(addr_underflow)
		);

fire_dmc_common_srfifo #(DPTR_WDTH, DEPTH) dptr_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_dptr),
        .deq (deq), 
		.data_out (dptr),
		.full (),                  // left as null port for later use if needed
        .empty (dptr_empty),
        .overflow(dptr_overflow),
        .underflow(dptr_underflow)
		);

fire_dmc_common_srfifo #(SBDTAG_WDTH, DEPTH) sbdtag_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_sbdtag),
        .deq (deq), 
		.data_out (sbd_tag),
		.full (),                  // left as null port for later use if needed
        .empty (sbdtag_empty),
        .overflow(sbdtag_overflow),
        .underflow(sbdtag_underflow)
		);

// commented out for later use if needed
//assign full = (typ_full | len_full | bytcnt_full | cntxtnum_full | 
//               pkseqnum_full | addr_full | dptr_full | sbdtag_full);

assign full = typ_full;  // since all fifos are in lock step, single registered 
                         // fifo full can be exported

assign overflow = (typ_overflow | len_overflow | bytcnt_overflow | 
                   cntxtnum_overflow | pkseqnum_overflow | addr_overflow | 
                   dptr_overflow | sbdtag_overflow);

assign underflow = (typ_underflow | len_underflow | bytcnt_underflow | 
                    cntxtnum_underflow | pkseqnum_underflow | addr_underflow | 
                    dptr_underflow | sbdtag_underflow);

assign empty = (typ_empty & len_empty & bytcnt_empty & cntxtnum_empty & 
                pkseqnum_empty & addr_empty & dptr_empty & sbdtag_empty);

endmodule 
