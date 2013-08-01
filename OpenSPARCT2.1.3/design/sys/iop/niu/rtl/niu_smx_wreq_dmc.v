// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_wreq_dmc.v
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

module niu_smx_wreq_dmc(
/*AUTOARG*/
   // Outputs
   meta_dmc0_req_accept, meta_dmc0_data_req, wreq_cmdff_wr, 
   wreq_cmdff_wdata, wreq_dataff_wr, wreq_dataff_wdata, 
   wreq_pcmd_ff_wr, wreq_pcmd_ff_wdata, wreq_xtb_wr, wreq_xtb_waddr, 
   wreq_xtb_wdata, wreq_cmdreq_idle, wreq_cmd_cs, dreq_cs, wreq_dv_cs,
   // Inputs
   clk, reset_l, dmc_meta0_req, dmc_meta0_req_cmd, 
   dmc_meta0_req_address, dmc_meta0_req_length, 
   dmc_meta0_req_transID, dmc_meta0_req_port_num, 
   dmc_meta0_req_dma_num, dmc_meta0_req_client, dmc_meta0_data_valid, 
   dmc_meta0_data, dmc_meta0_req_byteenable, dmc_meta0_status, 
   dmc_meta0_transfer_complete, wreq_cmdff_full, wreq_dataff_full, 
   wreq_pcmd_ff_full, wreq_rst_xtb_wr, stall_enable
   );

input 		clk;
input 		reset_l;

input 		dmc_meta0_req;
input [7:0] 	dmc_meta0_req_cmd;
input [63:0] 	dmc_meta0_req_address;
input [13:0] 	dmc_meta0_req_length;
input [5:0] 	dmc_meta0_req_transID;
input [1:0] 	dmc_meta0_req_port_num;
input [4:0] 	dmc_meta0_req_dma_num;
input [7:0] 	dmc_meta0_req_client;
output 		meta_dmc0_req_accept;

output 		meta_dmc0_data_req;
input 		dmc_meta0_data_valid;
input [127:0] 	dmc_meta0_data;
input [15:0] 	dmc_meta0_req_byteenable;
input [3:0] 	dmc_meta0_status;
input 		dmc_meta0_transfer_complete;

// cmd ff 
output 		wreq_cmdff_wr;
output [65:0] 	wreq_cmdff_wdata; 
input 		wreq_cmdff_full;

// data ff
output 		wreq_dataff_wr;
output [127:0] 	wreq_dataff_wdata;
input 		wreq_dataff_full; // right now not use ???

// pcmd ff
output 		wreq_pcmd_ff_wr;
output [3:0] 	wreq_pcmd_ff_wdata;
input 		wreq_pcmd_ff_full; // right now not use ???

// xtb
output 		wreq_xtb_wr;
output [5:0] 	wreq_xtb_waddr;
output [127:0] 	wreq_xtb_wdata;
input 		wreq_rst_xtb_wr;

	// stall_hdlr if 
input	stall_enable;
output 	wreq_cmdreq_idle;

output [2:0] wreq_cmd_cs;
output [2:0]    dreq_cs;
output [1:0] wreq_dv_cs;

wire [2:0] cmd_cs;
wire [2:0] wreq_cmd_cs= cmd_cs;

wire [1:0] dv_cs;
wire [1:0] wreq_dv_cs= dv_cs;

// req input
wire dmc_smx_req= dmc_meta0_req; 
wire [7:0] dmc_smx_req_cmd= dmc_meta0_req_cmd; 
wire [63:0] dmc_smx_req_addr= dmc_meta0_req_address; 
wire [13:0] dmc_smx_req_len= dmc_meta0_req_length; 
wire [5:0] dmc_smx_req_xid= dmc_meta0_req_transID; 
wire [1:0] dmc_smx_req_port= dmc_meta0_req_port_num; 
wire [4:0] dmc_smx_req_dma= dmc_meta0_req_dma_num;
wire [7:0] dmc_smx_req_client= dmc_meta0_req_client;
// req output
wire smx_dmc_req_accept;
wire meta_dmc0_req_accept= smx_dmc_req_accept; 

// data req output
wire smx_dmc_datareq;
wire meta_dmc0_data_req= smx_dmc_datareq; 
// data input
wire dmc_smx_dv= dmc_meta0_data_valid;
wire [127:0] dmc_smx_data= dmc_meta0_data & 
			   {
			    {8{dmc_meta0_req_byteenable[15]}},
			    {8{dmc_meta0_req_byteenable[14]}},
			    {8{dmc_meta0_req_byteenable[13]}},
			    {8{dmc_meta0_req_byteenable[12]}},
			    {8{dmc_meta0_req_byteenable[11]}},
			    {8{dmc_meta0_req_byteenable[10]}},
			    {8{dmc_meta0_req_byteenable[9]}},
			    {8{dmc_meta0_req_byteenable[8]}},
			    {8{dmc_meta0_req_byteenable[7]}},
			    {8{dmc_meta0_req_byteenable[6]}},
			    {8{dmc_meta0_req_byteenable[5]}},
			    {8{dmc_meta0_req_byteenable[4]}},
			    {8{dmc_meta0_req_byteenable[3]}},
			    {8{dmc_meta0_req_byteenable[2]}},
			    {8{dmc_meta0_req_byteenable[1]}},
			    {8{dmc_meta0_req_byteenable[0]}}
				};

// wire [15:0] dmc_smx_ben= dmc_meta0_req_byteenable;
wire [3:0] dmc_smx_status= dmc_meta0_status;
wire dmc_smx_xfer_comp= dmc_meta0_transfer_complete;

wire [4:0] cmdflag_data;
wire [4:0] early_cmdflag_data_n;
// wire dv_eop, datareq_busy;
wire datareq_busy;
// wire xfer_done= dv_eop & ~datareq_busy; 
wire lnen_ff_empty;
wire xfer_done= lnen_ff_empty & ~datareq_busy; 

wire cmdflag;
wire early_cmdflag_n;
wire rst_cmdflag;
wire datareq_idle;

wire [4:0] lnen_ff_wdata;
wire [4:0] lnen_ff_rdata;

wire lnen_ff_wr;
wire lnen_ff_full;
wire dv_pad_done;
wire lnen_ff_rd;

niu_smx_sm_req_cmdreq wr_sm_cmd(
	.clk (clk),	
	.reset_l (reset_l),
	.req (dmc_smx_req),
	.req_cmd (dmc_smx_req_cmd[7:0]),
 	.req_addr ({dmc_smx_req_addr[63:6], 6'h0}), 
				// ??? force addr to 
				// be 64B aligned in wr;
				// tb generating random addr?? 
	.req_len (dmc_smx_req_len[13:0]),
	.req_xid (dmc_smx_req_xid[5:0]),
	.req_port (dmc_smx_req_port[1:0]),
	.req_dma (dmc_smx_req_dma[4:0]),
	.req_client (dmc_smx_req_client[7:0]),
	.ack (smx_dmc_req_accept),
	.cmdflag (cmdflag),
	.cmdflag_data (cmdflag_data[4:0]),
	.early_cmdflag_n (early_cmdflag_n),
	.early_cmdflag_data_n (early_cmdflag_data_n[4:0]),
	.rst_cmdflag (rst_cmdflag),
	.cfg_no_cmdflag (1'b0),
	.cfg_no_sameclientck (1'b0),
	.datareq_idle (datareq_idle), // hard wire to 0 if wanna 
			            // disable early_cmdflag  ???
			// diagram show 1 cy bubble from ack to datareq
	.xtb_wr (wreq_xtb_wr),
	.xtb_waddr (wreq_xtb_waddr[5:0]),
	.xtb_wdata (wreq_xtb_wdata[127:0]),
	.rst_xtb_wr (wreq_rst_xtb_wr),
	.ff_wr (wreq_cmdff_wr),
	.ff_wdata (wreq_cmdff_wdata[65:0]),
	.ff_full (wreq_cmdff_full),
	.lnen_ff_wr (lnen_ff_wr),
	.lnen_ff_wdata (lnen_ff_wdata[4:0]),
	.lnen_ff_full (lnen_ff_full),

	.stall_enable (stall_enable),
 	.cmdreq_idle (wreq_cmdreq_idle),

	.cmd_cs		(cmd_cs[2:0]),

	.tid_valid_rdata_bus ({64{1'b1}}), 

	.xfer_done (xfer_done)
);


niu_smx_sm_req_datareq wr_sm_datareq(
	.clk (clk),	
	.reset_l (reset_l),
	.cmdflag (cmdflag),
	.cmdflag_data (cmdflag_data[4:0]),
	.early_cmdflag_n (early_cmdflag_n),
	.early_cmdflag_data_n (early_cmdflag_data_n[4:0]),
	.rst_cmdflag (rst_cmdflag),
	.datareq (smx_dmc_datareq),
	.datareq_busy (datareq_busy),
	.datareq_idle (datareq_idle),
	.cfg_pad_wait (1'b0),
	.dreq_cs (dreq_cs[2:0]),
	.dv_pad_done  (dv_pad_done) 
);

niu_smx_sm_req_dv wr_sm_dv(
	.clk (clk),	
	.reset_l (reset_l),
	.dv (dmc_smx_dv),
	.data (dmc_smx_data[127:0]),
	.data_status (dmc_smx_status[3:0]),
	.xfer_comp (dmc_smx_xfer_comp),
	.ff_wr (wreq_dataff_wr),
	.ff_wdata (wreq_dataff_wdata[127:0]),
	.pcmd_ff_wr (wreq_pcmd_ff_wr), 
	.pcmd_ff_wdata (wreq_pcmd_ff_wdata[3:0]), 
	.lnen_ff_rd (lnen_ff_rd),
	.lnen_ff_rdata (lnen_ff_rdata[4:0]),
	.lnen_ff_empty (lnen_ff_empty),
	.dv_cs (dv_cs[1:0]),
	.dv_pad_done  (dv_pad_done)
);

//	.eop (dv_eop),

niu_smx_ff_regfl #(5,2) lnen_ff_5bx4(
        .clk            (clk),
        .reset_l        (reset_l),
        .wr             (lnen_ff_wr),
        .wdata          (lnen_ff_wdata[4:0]),
        .full           (lnen_ff_full),
        .rd             (lnen_ff_rd),
        .empty          (lnen_ff_empty),
        .rdata          (lnen_ff_rdata[4:0])
);


/*
errff - at 4th data, wr errff; ??? 
if data_status error, errff_data= sth
use this empty flag for read side 

if len0, drop at cmd sm ???
*/
	

endmodule


