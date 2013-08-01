// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_resp_dmc.v
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
module niu_smx_resp_dmc(
/*AUTOARG*/
   // Outputs
   meta_dmc_resp_ready, meta_dmc_resp_cmd, meta_dmc_resp_cmd_status, 
   meta_dmc_resp_address, meta_dmc_resp_length, 
   meta_dmc_resp_transID, meta_dmc_resp_port_num, 
   meta_dmc_resp_dma_num, meta_dmc_resp_client, meta_dmc_data_valid, 
   meta_dmc_data, meta_dmc_resp_byteenable, meta_dmc_data_status, 
   meta_dmc_resp_complete, meta_dmc_resp_transfer_cmpl, 
   meta_dmc_ack_ready, meta_dmc_ack_cmd, meta_dmc_ack_cmd_status, 
   meta_dmc_ack_transID, meta_dmc_ack_dma_num, meta_dmc_ack_client, 
   meta_dmc_ack_complete, meta_dmc_ack_transfer_cmpl, niu_sio_dq, 
   xtb_rd, xtb_raddr, xtb_rcvfile_update, xtb_rcvfile_update_addr, 
   resp_cmdff_rd, resp_dataff_rd, tid_valid_rst0, 
   tid_valid_rst_addr0, tid_valid_rd, tid_valid_raddr, resp_rcv_set, 
   resp_rcv_set_addr, cmdl_tohdl_ack, cmdl_cs, dv_cs, proc_cs, 
   // Inputs
   clk, reset_l, dmc_meta_resp_accept, dmc_meta_ack_accept, 
   xtb_rdata, xtb_rd_ack, xtb_rdata_err, resp_cmdff_empty, 
   resp_cmdff_rdata, resp_dataff_empty, resp_dataff_rdata, 
   tid_valid_rdata, tohdl_cmdl_req, tohdl_cmdl_cmd, tohdl_cmdl_addr, 
   tohdl_cmdl_len, tohdl_cmdl_xid, tohdl_cmdl_port, tohdl_cmdl_dma, 
   tohdl_cmdl_client, pio_resp_err_inject_cfg, tid_dirty_rdata_bus
   );

input clk;
input reset_l;

// dmc cmd if
output 		meta_dmc_resp_ready;
output [7:0] 	meta_dmc_resp_cmd;
output [3:0]    meta_dmc_resp_cmd_status;   
output [63:0] 	meta_dmc_resp_address;
output [13:0] 	meta_dmc_resp_length;
output [5:0] 	meta_dmc_resp_transID;
output [1:0] 	meta_dmc_resp_port_num;
output [4:0] 	meta_dmc_resp_dma_num;
output [7:0] 	meta_dmc_resp_client;
input [7:0] 	dmc_meta_resp_accept;

// dmc data if
output [7:0] 	meta_dmc_data_valid;
output [127:0] 	meta_dmc_data;
output [15:0] 	meta_dmc_resp_byteenable;
output [3:0] 	meta_dmc_data_status;
output [7:0] 	meta_dmc_resp_complete;
output [7:0] 	meta_dmc_resp_transfer_cmpl;

// dmc ack if
output          meta_dmc_ack_ready;
output [7:0]    meta_dmc_ack_cmd;
output [3:0]    meta_dmc_ack_cmd_status;   
// output [63:0]   meta_dmc_ack_address;
// output [13:0]   meta_dmc_ack_length;
output [5:0]    meta_dmc_ack_transID;
// output [1:0]    meta_dmc_ack_port_num;
output [4:0]    meta_dmc_ack_dma_num;
output [7:0]    meta_dmc_ack_client;
input [7:0]     dmc_meta_ack_accept;
// output [7:0] 	meta_dmc_ack_complete;
output  	meta_dmc_ack_complete;
output [7:0] 	meta_dmc_ack_transfer_cmpl;


// sio if
output 		niu_sio_dq;

// xtb if
output 		xtb_rd;
output [5:0] 	xtb_raddr;
input [128:0] 	xtb_rdata;
input		xtb_rd_ack; // rst client rd signal
input		xtb_rdata_err;   	

output		xtb_rcvfile_update;
output [5:0] 	xtb_rcvfile_update_addr;

// resp cmdff if
input 		resp_cmdff_empty;
input [21:0] 	resp_cmdff_rdata;
output 		resp_cmdff_rd;

// resp dataff if
input 		resp_dataff_empty;  
input [143:0] 	resp_dataff_rdata;
output 		resp_dataff_rd;

// status if
output tid_valid_rst0;  // rst by resp_cmdproc
output [5:0] tid_valid_rst_addr0; 

output tid_valid_rd;	// rd by resp_cmdproc
output [5:0] tid_valid_raddr;
input tid_valid_rdata;

output resp_rcv_set;    // set by resp_cmdproc
output [5:0] resp_rcv_set_addr;

	// TO handler if
input		tohdl_cmdl_req;
input [7:0] 	tohdl_cmdl_cmd;
input [63:0] 	tohdl_cmdl_addr;
input [13:0] 	tohdl_cmdl_len;
input [5:0] 	tohdl_cmdl_xid;
input [1:0] 	tohdl_cmdl_port;
input [4:0] 	tohdl_cmdl_dma;
input [7:0] 	tohdl_cmdl_client;
output		cmdl_tohdl_ack;

// pio i/f
input [2:0]  pio_resp_err_inject_cfg; // [0] - one pkt
				     //	[1] - alt pkt
			  	     // [2] - all pkt

output [2:0] 	cmdl_cs;
output [2:0]	dv_cs;
output [1:0]    proc_cs; 	

input [63:0] tid_dirty_rdata_bus; 


/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			dv_idle;		// From resp_dv of niu_smx_sm_resp_dv.v
wire			dvflag;			// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [7:0]		dvflag_client;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [15:0]		dvflag_eop_byte_en;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		dvflag_eop_pos;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		dvflag_line_en;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [15:0]		dvflag_sop_byte_en;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		dvflag_sop_pos;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		dvflag_status;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [1:0]		dvflag_with_data;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		dvflag_xcomp;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire			early_dvflag;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [7:0]		early_dvflag_client;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [15:0]		early_dvflag_eop_byte_en;// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		early_dvflag_eop_pos;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		early_dvflag_line_en;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [15:0]		early_dvflag_sop_byte_en;// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		early_dvflag_sop_pos;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		early_dvflag_status;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [1:0]		early_dvflag_with_data;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		early_dvflag_xcomp;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire			procflag;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [63:0]		procflag_addr;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [7:0]		procflag_client;	// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [7:0]		procflag_cmd;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [4:0]		procflag_dma;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire			procflag_eop;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [3:0]		procflag_eop_byte_en;	// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [3:0]		procflag_eop_line_en;	// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [2:0]		procflag_err;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [1:0]		procflag_port;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire			procflag_rd;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire			procflag_sop;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [3:0]		procflag_sop_byte_en;	// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [3:0]		procflag_sop_line_en;	// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire			procflag_with_data;	// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire			procflag_xcomp;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire [5:0]		procflag_xid;		// From resp_cmdproc of niu_smx_sm_resp_cmdproc.v
wire			rst_dvflag;		// From resp_dv of niu_smx_sm_resp_dv.v
wire			rst_procflag;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [7:0]		smx_dmc_ack_client;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [7:0]		smx_dmc_ack_cmd;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		smx_dmc_ack_cmd_status;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [7:0]		smx_dmc_ack_comp;	// From resp_dv of niu_smx_sm_resp_dv.v
wire [4:0]		smx_dmc_ack_dma;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire			smx_dmc_ack_rdy;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [7:0]		smx_dmc_ack_xcomp;	// From resp_dv of niu_smx_sm_resp_dv.v
wire [5:0]		smx_dmc_ack_xid;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [63:0]		smx_dmc_addr;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [15:0]		smx_dmc_byte_en;	// From resp_dv of niu_smx_sm_resp_dv.v
wire [7:0]		smx_dmc_client;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [7:0]		smx_dmc_cmd;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [3:0]		smx_dmc_cmd_status;	// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [127:0]		smx_dmc_data;		// From resp_dv of niu_smx_sm_resp_dv.v
wire [4:0]		smx_dmc_dma;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [7:0]		smx_dmc_dv;		// From resp_dv of niu_smx_sm_resp_dv.v
wire [13:0]		smx_dmc_len;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [1:0]		smx_dmc_port;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire			smx_dmc_rdy;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
wire [7:0]		smx_dmc_resp_comp;	// From resp_dv of niu_smx_sm_resp_dv.v
wire [3:0]		smx_dmc_status;		// From resp_dv of niu_smx_sm_resp_dv.v
wire [7:0]		smx_dmc_xcomp;		// From resp_dv of niu_smx_sm_resp_dv.v
wire [5:0]		smx_dmc_xid;		// From resp_cmdlaunch of niu_smx_sm_resp_cmdlaunch.v
// End of automatics


wire 		meta_dmc_resp_ready= smx_dmc_rdy;
wire [7:0] 	meta_dmc_resp_cmd= smx_dmc_cmd;
wire [3:0] 	meta_dmc_resp_cmd_status= smx_dmc_cmd_status;
wire [63:0] 	meta_dmc_resp_address= smx_dmc_addr;
wire [13:0] 	meta_dmc_resp_length= smx_dmc_len;
wire [5:0] 	meta_dmc_resp_transID= smx_dmc_xid;
wire [1:0] 	meta_dmc_resp_port_num= smx_dmc_port;
wire [4:0] 	meta_dmc_resp_dma_num= smx_dmc_dma;
wire [7:0] 	meta_dmc_resp_client= smx_dmc_client;
wire [7:0] 	dmc_smx_accept= dmc_meta_resp_accept;

// dmc data if
wire [7:0] 	meta_dmc_data_valid= smx_dmc_dv;
wire [127:0] 	meta_dmc_data= smx_dmc_data;
wire [15:0] 	meta_dmc_resp_byteenable= smx_dmc_byte_en;
wire [3:0] 	meta_dmc_data_status= smx_dmc_status;
wire [7:0] 	meta_dmc_resp_complete= smx_dmc_resp_comp;
wire [7:0] 	meta_dmc_resp_transfer_cmpl= smx_dmc_xcomp;

// dmc ack if
wire 		meta_dmc_ack_ready= smx_dmc_ack_rdy;
wire [7:0] 	meta_dmc_ack_cmd= smx_dmc_ack_cmd;
wire [3:0] 	meta_dmc_ack_cmd_status= smx_dmc_ack_cmd_status;
// wire [63:0] 	meta_dmc_ack_address= smx_dmc_ack_addr;
// wire [13:0] 	meta_dmc_ack_length= smx_dmc_ack_len;
wire [5:0] 	meta_dmc_ack_transID= smx_dmc_ack_xid;
// wire [1:0] 	meta_dmc_ack_port_num= smx_dmc_ack_port;
wire [4:0] 	meta_dmc_ack_dma_num= smx_dmc_ack_dma;
wire [7:0] 	meta_dmc_ack_client= smx_dmc_ack_client;
wire [7:0] 	dmc_smx_ack_accept= dmc_meta_ack_accept;
// wire [7:0] 	meta_dmc_ack_complete= smx_dmc_ack_comp;
wire  		meta_dmc_ack_complete= smx_dmc_ack_comp[2]; // only tdmc uses this
							// do this for vlint 
wire [7:0] 	meta_dmc_ack_transfer_cmpl= smx_dmc_ack_xcomp;
   

niu_smx_sm_resp_cmdproc resp_cmdproc( /*AUTOINST*/
				     // Outputs
				     .resp_cmdff_rd(resp_cmdff_rd),
				     .xtb_rd(xtb_rd),
				     .xtb_raddr(xtb_raddr[5:0]),
				     .xtb_rcvfile_update(xtb_rcvfile_update),
				     .xtb_rcvfile_update_addr(xtb_rcvfile_update_addr[5:0]),
				     .tid_valid_rst0(tid_valid_rst0),
				     .tid_valid_rst_addr0(tid_valid_rst_addr0[5:0]),
				     .tid_valid_rd(tid_valid_rd),
				     .tid_valid_raddr(tid_valid_raddr[5:0]),
				     .resp_rcv_set(resp_rcv_set),
				     .resp_rcv_set_addr(resp_rcv_set_addr[5:0]),
				     .procflag(procflag),
				     .procflag_cmd(procflag_cmd[7:0]),
				     .procflag_addr(procflag_addr[63:0]),
				     .procflag_xid(procflag_xid[5:0]),
				     .procflag_port(procflag_port[1:0]),
				     .procflag_dma(procflag_dma[4:0]),
				     .procflag_client(procflag_client[7:0]),
				     .procflag_sop_line_en(procflag_sop_line_en[3:0]),
				     .procflag_eop_line_en(procflag_eop_line_en[3:0]),
				     .procflag_sop_byte_en(procflag_sop_byte_en[3:0]),
				     .procflag_eop_byte_en(procflag_eop_byte_en[3:0]),
				     .procflag_err(procflag_err[2:0]),
				     .procflag_rd(procflag_rd),
				     .procflag_with_data(procflag_with_data),
				     .procflag_sop(procflag_sop),
				     .procflag_eop(procflag_eop),
				     .procflag_xcomp(procflag_xcomp),
				     .niu_sio_dq(niu_sio_dq),
				     .proc_cs(proc_cs[1:0]),
				     // Inputs
				     .clk(clk),
				     .reset_l(reset_l),
				     .resp_cmdff_empty(resp_cmdff_empty),
				     .resp_cmdff_rdata(resp_cmdff_rdata[21:0]),
				     .xtb_rdata(xtb_rdata[128:0]),
				     .xtb_rd_ack(xtb_rd_ack),
				     .xtb_rdata_err(xtb_rdata_err),
				     .tid_valid_rdata(tid_valid_rdata),
				     .rst_procflag(rst_procflag));
/*
 	.resp_cmdff_empty (resp_cmdff_empty),
	.resp_cmdff_rdata (resp_cmdff_rdata),
	.resp_cmdff_rd (resp_cmdff_rd),
	.xtb_rd (xtb_rd),
	.xtb_raddr (xtb_raddr),
	.xtb_rdata (xtb_rdata),
 	.procflag (procflag),
	.procflag_cmd (procflag_cmd),
	.procflag_addr (procflag_addr),
	.procflag_len (procflag_len),
	.procflag_xid (procflag_xid),
	.procflag_port (procflag_port),
	.procflag_dma (procflag_dma),
	.procflag_client (procflag_client),
	.procflag_sop_line_en (procflag_sop_line_en),
	.procflag_eop_line_en (procflag_eop_line_en),
	.procflag_sop_byte_en (procflag_sop_byte_en),
	.procflag_eop_byte_en (procflag_eop_byte_en),
	.procflag_err (procflag_err),
 	.procflag_rd  (procflag_rd),  
 	.procflag_with_data  (procflag_with_data),  
 	.procflag_sop  (procflag_sop),  
 	.procflag_eop (procflag_eop), 
 	.procflag_xcomp  (procflag_xcomp),  
 	.rst_procflag (rst_procflag),
  	.cmdlaunch_idle   (cmdlaunch_idle),   
 	.early_procflag (early_procflag),
	.early_procflag_data (early_procflag_data)
*/

// ??? instantiate
niu_smx_sm_resp_cmdlaunch resp_cmdlaunch( /*AUTOINST*/
					 // Outputs
					 .smx_dmc_rdy(smx_dmc_rdy),
					 .smx_dmc_cmd(smx_dmc_cmd[7:0]),
					 .smx_dmc_cmd_status(smx_dmc_cmd_status[3:0]),
					 .smx_dmc_addr(smx_dmc_addr[63:0]),
					 .smx_dmc_len(smx_dmc_len[13:0]),
					 .smx_dmc_xid(smx_dmc_xid[5:0]),
					 .smx_dmc_port(smx_dmc_port[1:0]),
					 .smx_dmc_dma(smx_dmc_dma[4:0]),
					 .smx_dmc_client(smx_dmc_client[7:0]),
					 .smx_dmc_ack_rdy(smx_dmc_ack_rdy),
					 .smx_dmc_ack_cmd(smx_dmc_ack_cmd[7:0]),
					 .smx_dmc_ack_cmd_status(smx_dmc_ack_cmd_status[3:0]),
					 .smx_dmc_ack_xid(smx_dmc_ack_xid[5:0]),
					 .smx_dmc_ack_dma(smx_dmc_ack_dma[4:0]),
					 .smx_dmc_ack_client(smx_dmc_ack_client[7:0]),
					 .rst_procflag(rst_procflag),
					 .dvflag(dvflag),
					 .dvflag_with_data(dvflag_with_data[1:0]),
					 .dvflag_line_en(dvflag_line_en[3:0]),
					 .dvflag_sop_pos(dvflag_sop_pos[3:0]),
					 .dvflag_eop_pos(dvflag_eop_pos[3:0]),
					 .dvflag_sop_byte_en(dvflag_sop_byte_en[15:0]),
					 .dvflag_eop_byte_en(dvflag_eop_byte_en[15:0]),
					 .dvflag_client(dvflag_client[7:0]),
					 .dvflag_xcomp(dvflag_xcomp[3:0]),
					 .dvflag_status(dvflag_status[3:0]),
					 .early_dvflag(early_dvflag),
					 .early_dvflag_with_data(early_dvflag_with_data[1:0]),
					 .early_dvflag_line_en(early_dvflag_line_en[3:0]),
					 .early_dvflag_sop_pos(early_dvflag_sop_pos[3:0]),
					 .early_dvflag_eop_pos(early_dvflag_eop_pos[3:0]),
					 .early_dvflag_sop_byte_en(early_dvflag_sop_byte_en[15:0]),
					 .early_dvflag_eop_byte_en(early_dvflag_eop_byte_en[15:0]),
					 .early_dvflag_client(early_dvflag_client[7:0]),
					 .early_dvflag_xcomp(early_dvflag_xcomp[3:0]),
					 .early_dvflag_status(early_dvflag_status[3:0]),
					 .cmdl_tohdl_ack(cmdl_tohdl_ack),
					 .cmdl_cs(cmdl_cs[2:0]),
					 // Inputs
					 .clk(clk),
					 .reset_l(reset_l),
					 .dmc_smx_accept(dmc_smx_accept[7:0]),
					 .dmc_smx_ack_accept(dmc_smx_ack_accept[7:0]),
					 .procflag(procflag),
					 .procflag_cmd(procflag_cmd[7:0]),
					 .procflag_addr(procflag_addr[63:0]),
					 .procflag_xid(procflag_xid[5:0]),
					 .procflag_port(procflag_port[1:0]),
					 .procflag_dma(procflag_dma[4:0]),
					 .procflag_client(procflag_client[7:0]),
					 .procflag_sop_line_en(procflag_sop_line_en[3:0]),
					 .procflag_eop_line_en(procflag_eop_line_en[3:0]),
					 .procflag_sop_byte_en(procflag_sop_byte_en[3:0]),
					 .procflag_eop_byte_en(procflag_eop_byte_en[3:0]),
					 .procflag_err(procflag_err[2:0]),
					 .procflag_rd(procflag_rd),
					 .procflag_with_data(procflag_with_data),
					 .procflag_xcomp(procflag_xcomp),
					 .procflag_sop(procflag_sop),
					 .procflag_eop(procflag_eop),
					 .rst_dvflag(rst_dvflag),
					 .dv_idle(dv_idle),
					 .tohdl_cmdl_req(tohdl_cmdl_req),
					 .tohdl_cmdl_cmd(tohdl_cmdl_cmd[7:0]),
					 .tohdl_cmdl_addr(tohdl_cmdl_addr[63:0]),
					 .tohdl_cmdl_len(tohdl_cmdl_len[13:0]),
					 .tohdl_cmdl_xid(tohdl_cmdl_xid[5:0]),
					 .tohdl_cmdl_port(tohdl_cmdl_port[1:0]),
					 .tohdl_cmdl_dma(tohdl_cmdl_dma[4:0]),
					 .tohdl_cmdl_client(tohdl_cmdl_client[7:0]),
					 .tid_dirty_rdata_bus(tid_dirty_rdata_bus[63:0]));

niu_smx_sm_resp_dv resp_dv( /*AUTOINST*/
			   // Outputs
			   .smx_dmc_dv	(smx_dmc_dv[7:0]),
			   .smx_dmc_data(smx_dmc_data[127:0]),
			   .smx_dmc_byte_en(smx_dmc_byte_en[15:0]),
			   .smx_dmc_status(smx_dmc_status[3:0]),
			   .smx_dmc_resp_comp(smx_dmc_resp_comp[7:0]),
			   .smx_dmc_xcomp(smx_dmc_xcomp[7:0]),
			   .smx_dmc_ack_comp(smx_dmc_ack_comp[7:0]),
			   .smx_dmc_ack_xcomp(smx_dmc_ack_xcomp[7:0]),
			   .rst_dvflag	(rst_dvflag),
			   .dv_idle	(dv_idle),
			   .resp_dataff_rd(resp_dataff_rd),
			   .dv_cs	(dv_cs[2:0]),
			   // Inputs
			   .clk		(clk),
			   .reset_l	(reset_l),
			   .dvflag	(dvflag),
			   .dvflag_with_data(dvflag_with_data[1:0]),
			   .dvflag_line_en(dvflag_line_en[3:0]),
			   .dvflag_sop_pos(dvflag_sop_pos[3:0]),
			   .dvflag_eop_pos(dvflag_eop_pos[3:0]),
			   .dvflag_sop_byte_en(dvflag_sop_byte_en[15:0]),
			   .dvflag_eop_byte_en(dvflag_eop_byte_en[15:0]),
			   .dvflag_client(dvflag_client[7:0]),
			   .dvflag_xcomp(dvflag_xcomp[3:0]),
			   .dvflag_status(dvflag_status[3:0]),
			   .early_dvflag(early_dvflag),
			   .early_dvflag_with_data(early_dvflag_with_data[1:0]),
			   .early_dvflag_line_en(early_dvflag_line_en[3:0]),
			   .early_dvflag_sop_pos(early_dvflag_sop_pos[3:0]),
			   .early_dvflag_eop_pos(early_dvflag_eop_pos[3:0]),
			   .early_dvflag_sop_byte_en(early_dvflag_sop_byte_en[15:0]),
			   .early_dvflag_eop_byte_en(early_dvflag_eop_byte_en[15:0]),
			   .early_dvflag_client(early_dvflag_client[7:0]),
			   .early_dvflag_xcomp(early_dvflag_xcomp[3:0]),
			   .early_dvflag_status(early_dvflag_status[3:0]),
			   .resp_dataff_empty(resp_dataff_empty),
			   .resp_dataff_rdata(resp_dataff_rdata[143:0]),
			   .pio_resp_err_inject_cfg(pio_resp_err_inject_cfg[2:0]));

endmodule
