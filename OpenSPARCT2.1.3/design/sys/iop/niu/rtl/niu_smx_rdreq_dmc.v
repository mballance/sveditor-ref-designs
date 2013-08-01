// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_rdreq_dmc.v
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

module niu_smx_rdreq_dmc(
/*AUTOARG*/
   // Outputs
   meta_dmc1_req_accept, rdreq_cmdff_wr, rdreq_cmdff_wdata, 
   rdreq_xtb_wr, rdreq_xtb_waddr, rdreq_xtb_wdata, rdreq_cmdreq_idle, 
   rdreq_cmd_cs, 
   // Inputs
   clk, reset_l, dmc_meta1_req, dmc_meta1_req_cmd, 
   dmc_meta1_req_address, dmc_meta1_req_length, 
   dmc_meta1_req_transID, dmc_meta1_req_port_num, 
   dmc_meta1_req_dma_num, dmc_meta1_req_client, rdreq_cmdff_full, 
   rdreq_rst_xtb_wr, stall_enable, tid_valid_rdata_bus
   );

input 		clk;
input 		reset_l;

input 		dmc_meta1_req;
input [7:0] 	dmc_meta1_req_cmd;
input [63:0] 	dmc_meta1_req_address;
input [13:0] 	dmc_meta1_req_length;
input [5:0] 	dmc_meta1_req_transID;
input [1:0] 	dmc_meta1_req_port_num;
input [4:0] 	dmc_meta1_req_dma_num;
input [7:0] 	dmc_meta1_req_client;
output 		meta_dmc1_req_accept;

// cmd ff
output 		rdreq_cmdff_wr;
output [65:0] 	rdreq_cmdff_wdata;
input 		rdreq_cmdff_full;

// xtb
output 		rdreq_xtb_wr;
output [5:0] 	rdreq_xtb_waddr;
output [127:0] 	rdreq_xtb_wdata;
input		rdreq_rst_xtb_wr;

	// stall_hdlr if 
input	stall_enable;
output 	rdreq_cmdreq_idle;

output [2:0] rdreq_cmd_cs;

// status
// added 121405
input [63:0] tid_valid_rdata_bus;

wire [2:0] cmd_cs;
wire [2:0] rdreq_cmd_cs= cmd_cs;

// req input
wire dmc_smx_req= dmc_meta1_req;
wire [7:0] dmc_smx_req_cmd= dmc_meta1_req_cmd;
wire [63:0] dmc_smx_req_addr= dmc_meta1_req_address;
wire [13:0] dmc_smx_req_len= dmc_meta1_req_length;
wire [5:0] dmc_smx_req_xid= dmc_meta1_req_transID;
wire [1:0] dmc_smx_req_port= dmc_meta1_req_port_num;
wire [4:0] dmc_smx_req_dma= dmc_meta1_req_dma_num;
wire [7:0] dmc_smx_req_client= dmc_meta1_req_client;
// req output
wire smx_dmc_req_accept;
wire meta_dmc1_req_accept= smx_dmc_req_accept;


niu_smx_sm_req_cmdreq rd_sm_cmd(
	.clk (clk),
	.reset_l (reset_l), 
        .req (dmc_smx_req),
	.req_cmd  (dmc_smx_req_cmd[7:0]),
        .req_addr (dmc_smx_req_addr[63:0]),
        .req_len (dmc_smx_req_len[13:0]),
        .req_xid (dmc_smx_req_xid[5:0]),
        .req_port (dmc_smx_req_port[1:0]),
        .req_dma (dmc_smx_req_dma[4:0]),
        .req_client (dmc_smx_req_client[7:0]),
        .ack (smx_dmc_req_accept),
        .cmdflag (), // nc
        .cmdflag_data (), // nc
        .early_cmdflag_n (), // nc
        .early_cmdflag_data_n (), // nc 
        .rst_cmdflag (1'b0),
        .cfg_no_cmdflag (1'b1), // disable cmdflag gen
	.cfg_no_sameclientck (1'b1), // disable same client check;
				// rd can switch over immediately
        .datareq_idle (1'b0),
        .xtb_wr (rdreq_xtb_wr),
        .xtb_waddr (rdreq_xtb_waddr[5:0]),
        .xtb_wdata (rdreq_xtb_wdata[127:0]),
        .rst_xtb_wr (rdreq_rst_xtb_wr),
        .ff_wr (rdreq_cmdff_wr),
        .ff_wdata (rdreq_cmdff_wdata[65:0]),
        .ff_full (rdreq_cmdff_full),
	.lnen_ff_wr (), // nc
	.lnen_ff_wdata (), // nc
	.lnen_ff_full (1'b0),

	.stall_enable (stall_enable),
 	.cmdreq_idle (rdreq_cmdreq_idle),

	.cmd_cs	(cmd_cs [2:0]),

	.tid_valid_rdata_bus (tid_valid_rdata_bus[63:0]),

        .xfer_done (1'b1)
);

endmodule


