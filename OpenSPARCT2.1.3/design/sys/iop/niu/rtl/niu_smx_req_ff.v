// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_req_ff.v
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

module niu_smx_req_ff(
/*AUTOARG*/
   // Outputs
   rdreq_cmdff_full, rdreq_cmdff_rdata, rdreq_cmdff_empty, 
   wreq_cmdff_full, wreq_cmdff_rdata, wreq_cmdff_empty, 
   wreq_dataff_full, wreq_dataff_rdata, wreq_dataff_empty, 
   wreq_pcmd_ff_full, wreq_pcmd_ff_rdata, wreq_pcmd_ff_empty, 
   // Inputs
   clk, reset_l, rdreq_cmdff_wr, rdreq_cmdff_wdata, rdreq_cmdff_rd, 
   wreq_cmdff_wr, wreq_cmdff_wdata, wreq_cmdff_rd, wreq_dataff_wr, 
   wreq_dataff_wdata, wreq_dataff_rd, wreq_pcmd_ff_wr, 
   wreq_pcmd_ff_wdata, wreq_pcmd_ff_rd
   );

input clk;
input reset_l;

// rdreq  if; cmdff
input 		rdreq_cmdff_wr;
input [65:0] 	rdreq_cmdff_wdata;
output 		rdreq_cmdff_full;
input 		rdreq_cmdff_rd;
output [65:0] 	rdreq_cmdff_rdata;
output 		rdreq_cmdff_empty;  

// wreq if; cmd ff 
input 		wreq_cmdff_wr;
input [65:0] 	wreq_cmdff_wdata; 
output 		wreq_cmdff_full;
input 		wreq_cmdff_rd;
output [65:0] 	wreq_cmdff_rdata;
output 		wreq_cmdff_empty;  // not use


// wreq if; data ff
input 		wreq_dataff_wr;
input [127:0] 	wreq_dataff_wdata;
output 		wreq_dataff_full; // right now not use ???
input 		wreq_dataff_rd;
output [127:0] 	wreq_dataff_rdata; 
output 		wreq_dataff_empty;


// pcmd ff
input 		wreq_pcmd_ff_wr;
input [3:0] 	wreq_pcmd_ff_wdata;
output 		wreq_pcmd_ff_full; // right now not use ???
input 		wreq_pcmd_ff_rd;
output [3:0] 	wreq_pcmd_ff_rdata;
output 		wreq_pcmd_ff_empty; 

niu_smx_ff_regfl #(128,4) wreq_dataff_128bx16(
	.clk		(clk),
	.reset_l	(reset_l),
	.wr		(wreq_dataff_wr),
	.wdata		(wreq_dataff_wdata[127:0]),
	.full		(wreq_dataff_full),
	.rd		(wreq_dataff_rd),
	.empty		(wreq_dataff_empty),
	.rdata		(wreq_dataff_rdata[127:0])
);

niu_smx_ff_regfl #(66,2) wreq_cmdff_66bx4(
	.clk		(clk),
	.reset_l	(reset_l),
	.wr		(wreq_cmdff_wr),
	.wdata		(wreq_cmdff_wdata[65:0]), 
	.full		(wreq_cmdff_full),
	.rd		(wreq_cmdff_rd),
	.empty		(wreq_cmdff_empty),
	.rdata		(wreq_cmdff_rdata[65:0])
);

niu_smx_ff_regfl #(66,2) rdreq_cmdff_66bx4(
	.clk		(clk),
	.reset_l	(reset_l),
	.wr		(rdreq_cmdff_wr),
	.wdata		(rdreq_cmdff_wdata[65:0]),
	.full		(rdreq_cmdff_full),
	.rd		(rdreq_cmdff_rd),
	.empty		(rdreq_cmdff_empty),
	.rdata		(rdreq_cmdff_rdata[65:0])
);

niu_smx_ff_regfl #(4,2) wreq_pcmd_ff_4bx4(
	.clk		(clk),
	.reset_l	(reset_l),	
	.wr		(wreq_pcmd_ff_wr),
	.wdata		(wreq_pcmd_ff_wdata[3:0]),
	.full		(wreq_pcmd_ff_full),
	.rd		(wreq_pcmd_ff_rd),
	.empty		(wreq_pcmd_ff_empty),
	.rdata		(wreq_pcmd_ff_rdata[3:0])
);

endmodule
