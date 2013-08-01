// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu_tcm_pkrcd_q.v
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
module dmu_cmu_tcm_pkrcd_q (
		clk, 	
		rst_l,
        enq,
		rcd_in,
        deq, 
        typ,
        len,
        dwbe,
        addr,
        sbd_tag,
        dptr,
        cntxt_num,
        pkseq_num,
		full,
        empty,
        overflow,
        underflow
       );
     
//************************************************
//				PARAMETERS
//************************************************

 parameter  DEPTH = 4;

// Packet Record Field widths
 parameter  PRTYP_WDTH      = `FIRE_DLC_EPR_TYP_WDTH,       // 7
            PRLEN_WDTH      = `FIRE_DLC_EPR_LEN_WDTH,       //10
            PRDWBE_WDTH     = `FIRE_DLC_EPR_DWBE_WDTH,      // 8
            PRADDR_WDTH     = `FIRE_DLC_EPR_ADDR_WDTH,      //34
            PRSBDTAG_WDTH   = `FIRE_DLC_EPR_SBDTAG_WDTH,    // 5
            PRDPTR_WDTH     = `FIRE_DLC_EPR_DPTR_WDTH,      // 6
            PRSEQNUM_WDTH   = `FIRE_DLC_EPR_PKSEQNUM_WDTH,  // 5
            PRCNTXTNUM_WDTH = `FIRE_DLC_EPR_CNTXTNUM_WDTH;  // 5

 parameter  PRCNTXTNUMLSB  = `FIRE_DLC_EPR_CNTXTNUM_LSB,
            PRCNTXTNUMMSB  = `FIRE_DLC_EPR_CNTXTNUM_MSB,
            PRSEQNUMLSB    = `FIRE_DLC_EPR_PKSEQNUM_LSB,
            PRSEQNUMMSB    = `FIRE_DLC_EPR_PKSEQNUM_MSB,
            PRDPTRLSB      = `FIRE_DLC_EPR_DPTR_LSB,
            PRDPTRMSB      = `FIRE_DLC_EPR_DPTR_MSB,
            PRSBDTAGLSB    = `FIRE_DLC_EPR_SBDTAG_LSB,
            PRSBDTAGMSB    = `FIRE_DLC_EPR_SBDTAG_MSB,
            PRADDRLSB      = `FIRE_DLC_EPR_ADDR_LSB,
            PRADDRMSB      = `FIRE_DLC_EPR_ADDR_MSB,
            PRDWBELSB      = `FIRE_DLC_EPR_DWBE_LSB,
            PRDWBEMSB      = `FIRE_DLC_EPR_DWBE_MSB,
            PRLENLSB       = `FIRE_DLC_EPR_LEN_LSB,
            PRLENMSB       = `FIRE_DLC_EPR_LEN_MSB,
            PRTYPLSB       = `FIRE_DLC_EPR_TYP_LSB,
            PRTYPMSB       = `FIRE_DLC_EPR_TYP_MSB;
   

// parameter  CL2CM_WDTH    = `FIRE_DLC_EPR_REC_WDTH;       //80
  
   parameter  EPRMSB        = `FIRE_DLC_EPR_MSB;            // CL2CM_WDTH -1;


//************************************************
//				PORTS
//************************************************

  input clk;                             // The input clock
  input rst_l;                           // The fifo rst_l

  input [EPRMSB :0] rcd_in;              // Egress packet record in
  input enq;                             // enqueue to prcd_q
  input deq;                             // local dequeue for packet fifo
        
  output [PRTYP_WDTH  -1 : 0] typ;
  output [PRLEN_WDTH  -1 : 0] len;
  output [PRDWBE_WDTH  -1 : 0] dwbe;
  output [PRADDR_WDTH  -1 : 0] addr;
  output [PRSBDTAG_WDTH  -1 : 0] sbd_tag;
  output [PRDPTR_WDTH  -1 : 0] dptr;
  output [PRCNTXTNUM_WDTH  -1 : 0] cntxt_num;
  output [PRSEQNUM_WDTH  -1 : 0] pkseq_num;

  output full;                      // prcd_q is full
  output overflow;                  // prcd_q overflow
  output underflow;                 // prcd_q underflow
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
  wire sbdtag_empty, sbdtag_overflow, sbdtag_underflow;
  wire dptr_empty, dptr_overflow, dptr_underflow;
  wire pkseqnum_empty, pkseqnum_overflow, pkseqnum_underflow;
  wire cntxtnum_empty, cntxtnum_overflow, cntxtnum_underflow;

  wire [PRTYP_WDTH  -1 : 0] rcd_typ; 
  wire [PRLEN_WDTH  -1 : 0] rcd_len;
  wire [PRDWBE_WDTH  -1 : 0] rcd_dwbe;
  wire [PRADDR_WDTH  -1 : 0] rcd_addr;
  wire [PRSBDTAG_WDTH  -1 : 0] rcd_sbdtag;
  wire [PRDPTR_WDTH  -1 : 0] rcd_dptr;
  wire [PRSEQNUM_WDTH  -1 : 0] rcd_pkseqnum;
  wire [PRCNTXTNUM_WDTH  -1 : 0] rcd_cntxtnum;



// Packet Record field assignments to PRM signals
  assign rcd_typ[PRTYP_WDTH  -1 : 0]           = rcd_in[PRTYPMSB : PRTYPLSB ]; 
  assign rcd_len[PRLEN_WDTH  -1 : 0]           = rcd_in[PRLENMSB : PRLENLSB];
  assign rcd_dwbe[PRDWBE_WDTH  -1 : 0]         = rcd_in[PRDWBEMSB : PRDWBELSB];
  assign rcd_addr[PRADDR_WDTH  -1 : 0]         = rcd_in[PRADDRMSB : PRADDRLSB];
  assign rcd_sbdtag[PRSBDTAG_WDTH  -1 : 0]     = rcd_in[PRSBDTAGMSB : PRSBDTAGLSB];
  assign rcd_dptr[PRDPTR_WDTH  -1 : 0]         = rcd_in[PRDPTRMSB : PRDPTRLSB];
  assign rcd_pkseqnum[PRSEQNUM_WDTH  -1 : 0]   = rcd_in[PRSEQNUMMSB : PRSEQNUMLSB];
  assign rcd_cntxtnum[PRCNTXTNUM_WDTH  -1 : 0] = rcd_in[PRCNTXTNUMMSB : PRCNTXTNUMLSB];
   
//************************************************
//				Modules
//************************************************

fire_dmc_common_srfifo #(PRTYP_WDTH, DEPTH) typ_srfifo (
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

fire_dmc_common_srfifo #(PRLEN_WDTH, DEPTH) len_srfifo (
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

fire_dmc_common_srfifo #(PRDWBE_WDTH, DEPTH) dwbe_srfifo (
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

fire_dmc_common_srfifo #(PRADDR_WDTH, DEPTH) addr_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_addr),
        .deq (deq), 
		.data_out (addr),
		.full (),
        .empty (addr_empty),
        .overflow(addr_overflow),
        .underflow(addr_underflow)
		);

fire_dmc_common_srfifo #(PRSBDTAG_WDTH, DEPTH) sbdtag_srfifo (
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

fire_dmc_common_srfifo #(PRDPTR_WDTH, DEPTH) dptr_srfifo (
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

fire_dmc_common_srfifo #(PRSEQNUM_WDTH, DEPTH) pkseqnum_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_pkseqnum),
        .deq (deq), 
		.data_out (pkseq_num),
		.full (),
        .empty (pkseqnum_empty),
        .overflow(pkseqnum_overflow),
        .underflow(pkseqnum_underflow)
		);

fire_dmc_common_srfifo #(PRCNTXTNUM_WDTH, DEPTH) cntxtnum_srfifo (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (enq),
		.data_in (rcd_cntxtnum),
        .deq (deq), 
		.data_out (cntxt_num),
		.full (),
        .empty (cntxtnum_empty),
        .overflow(cntxtnum_overflow),
        .underflow(cntxtnum_underflow)
		);

//assign full = (typ_full | len_full | dwbe_full | cntxtnum_full | 
//               pkseqnum_full | addr_full | dptr_full | sbdtag_full);

assign full = typ_full;  // since all fifos are in lock step, single fifo full
                         // can be exported

assign overflow = (typ_overflow | len_overflow | dwbe_overflow | 
                   cntxtnum_overflow | pkseqnum_overflow | addr_overflow | 
                   dptr_overflow | sbdtag_overflow);

assign underflow = (typ_underflow | len_underflow | dwbe_underflow | 
                    cntxtnum_underflow | pkseqnum_underflow | addr_underflow | 
                    dptr_underflow | sbdtag_underflow);

assign empty = (typ_empty & len_empty & dwbe_empty & cntxtnum_empty & 
                pkseqnum_empty & addr_empty & dptr_empty & sbdtag_empty);

endmodule 

