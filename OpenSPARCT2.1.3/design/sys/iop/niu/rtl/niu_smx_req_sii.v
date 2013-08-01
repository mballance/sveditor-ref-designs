// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_req_sii.v
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

module niu_smx_req_sii(
/*AUTOARG*/
   // Outputs
   niu_sii_hdr_vld, niu_sii_reqbypass, niu_sii_datareq, niu_sii_data, 
   niu_sii_parity, wreq_cmdff_rd, wreq_pcmd_ff_rd, rdreq_cmdff_rd, 
   wreq_dataff_rd, siireq_idle, sii_cs, arb_cs, tid_xmited_set, 
   tid_xmited_set_addr, 
   // Inputs
   clk, reset_l, sii_niu_oqdq, sii_niu_bqdq, wreq_cmdff_rdata, 
   wreq_cmdff_empty, wreq_pcmd_ff_rdata, wreq_pcmd_ff_empty, 
   rdreq_cmdff_rdata, rdreq_cmdff_empty, wreq_dataff_rdata, 
   wreq_dataff_empty, tid_valid_rdata_bus
   );

input 		clk;
input		reset_l;

// sii interface
output         niu_sii_hdr_vld;
output         niu_sii_reqbypass;
output         niu_sii_datareq;
output [127:0] niu_sii_data;
output [7:0]   niu_sii_parity;

input 		sii_niu_oqdq;
input 		sii_niu_bqdq;


// wr cmdff if
output 		wreq_cmdff_rd;
input [65:0] 	wreq_cmdff_rdata;
input 		wreq_cmdff_empty;  // not use

// wr pcmd ff if
output 		wreq_pcmd_ff_rd;
input [3:0] 	wreq_pcmd_ff_rdata;
input 		wreq_pcmd_ff_empty;  // use this as wr req empty status

// rd cmdff if 
output 		rdreq_cmdff_rd;
input [65:0] 	rdreq_cmdff_rdata;
input 		rdreq_cmdff_empty;  

// dataff if
output 		wreq_dataff_rd;
input [127:0] 	wreq_dataff_rdata; 
input 		wreq_dataff_empty; // not use for now???

// stall_hdlr  if
output		siireq_idle;

output [1:0] sii_cs;
output [1:0] arb_cs;

// added 121405
input [63:0] tid_valid_rdata_bus;
// status file interface
output tid_xmited_set;   // rst by sii_req
output [5:0] tid_xmited_set_addr;


wire [128:0] arb_hdr_data;
wire [127:0] wreq_dataff_rdata;
wire [65:0] rdreq_cmdff_rdata;
wire [5:0] tid_xmited_set_addr;

wire arb_xmitflag;
wire arb_rwflag;
wire arb_bypass;
wire siireq_nxt_xmit;
wire ocr_avail;
wire bcr_avail;
wire o_enq;
wire b_enq; 

niu_smx_sm_req_siireq siireq(
	.clk 			(clk),
	.reset_l 		(reset_l), 
	.niu_sii_hdr_vld	(niu_sii_hdr_vld),
	.niu_sii_reqbypass	(niu_sii_reqbypass),
	.niu_sii_datareq	(niu_sii_datareq),
	.niu_sii_data		(niu_sii_data[127:0]),
	.niu_sii_parity		(niu_sii_parity[7:0]),
	.xmitflag		(arb_xmitflag),
	.rwflag			(arb_rwflag),
	.hdr_data		(arb_hdr_data[128:0]),
	.bypass			(arb_bypass),
	.nxt_xmit		(siireq_nxt_xmit),
	.wreq_dataff_rd		(wreq_dataff_rd),
	.wreq_dataff_rdata	(wreq_dataff_rdata[127:0]),
	.wreq_dataff_empty	(wreq_dataff_empty),
	.sii_cs			(sii_cs[1:0]),
	.siireq_idle		(siireq_idle),
        .tid_xmited_set     	(tid_xmited_set),     
        .tid_xmited_set_addr  	(tid_xmited_set_addr[5:0]) 
);

niu_smx_sm_req_siiarb siiarb(
	.clk (clk),
	.reset_l (reset_l), 
	.wreq_cmdff_rd		(wreq_cmdff_rd),
	.wreq_cmdff_rdata	(wreq_cmdff_rdata[65:0]),
	.wreq_cmdff_empty	(wreq_cmdff_empty),
	.wreq_pcmd_ff_rd	(wreq_pcmd_ff_rd),
	.wreq_pcmd_ff_rdata 	(wreq_pcmd_ff_rdata[3:0]),
	.wreq_pcmd_ff_empty 	(wreq_pcmd_ff_empty),	
	.rdreq_cmdff_rd		(rdreq_cmdff_rd),
	.rdreq_cmdff_rdata	(rdreq_cmdff_rdata[65:0]),
	.rdreq_cmdff_empty	(rdreq_cmdff_empty),
	.xmitflag		(arb_xmitflag),
	.rwflag			(arb_rwflag),
	.hdr_data		(arb_hdr_data[128:0]),
	.bypass			(arb_bypass),
	.nxt_xmit		(siireq_nxt_xmit),
	.ocr_avail		(ocr_avail),
	.bcr_avail		(bcr_avail),
	.o_enq			(o_enq),
	.b_enq			(b_enq),
	.arb_cs			(arb_cs[1:0]),
	.tid_valid_rdata_bus	(tid_valid_rdata_bus[63:0])
);

niu_smx_req_sii_cr sii_cr(
	.clk (clk),
	.reset_l (reset_l), 
	.sii_niu_oqdq 	(sii_niu_oqdq),
	.sii_niu_bqdq	(sii_niu_bqdq),
	.o_enq		(o_enq),
	.b_enq		(b_enq),
	.ocr_avail	(ocr_avail),
	.bcr_avail	(bcr_avail)
);

endmodule


