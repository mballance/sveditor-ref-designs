// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_status.v
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

module niu_smx_status(
/*AUTOARG*/
   // Outputs
   tid_valid_rdata, tid_valid_rdata_bus, tid_newarr_rdata, 
   tid_newarr_rdata_bus, resp_rcv_rdata, resp_rcv_rdata_bus, 
   timeout_rdata, timeout_rdata_bus, tid_xmited_rdata_bus, 
   tid_dirty_rdata_bus,
   // Inputs
   clk, reset_l, tid_valid_rst0, tid_valid_rst1, tid_valid_rst_addr0, 
   tid_valid_rst_addr1, tid_valid_set, tid_valid_set_addr, 
   tid_valid_rd, tid_valid_raddr, tid_newarr_rst, 
   tid_newarr_rst_addr, tid_newarr_set, tid_newarr_set_addr, 
   tid_newarr_rd, tid_newarr_raddr, resp_rcv_rst, resp_rcv_rst_addr, 
   resp_rcv_set, resp_rcv_set_addr, resp_rcv_rd, resp_rcv_raddr, 
   timeout_set, timeout_rst, timeout_set_addr, timeout_rst_addr, 
   timeout_rd, timeout_raddr, tid_xmited_set, tid_xmited_set_addr
   );

input clk;
input reset_l;
input tid_valid_rst0;  // rst by resp_cmdproc
input tid_valid_rst1;  // rst by timer
input [5:0] tid_valid_rst_addr0; 
input [5:0] tid_valid_rst_addr1;
input tid_valid_set;   // set by req_cmd
input [5:0] tid_valid_set_addr;

input tid_valid_rd;	// rd by resp_cmdproc
input [5:0] tid_valid_raddr;
output tid_valid_rdata;
output [63:0] tid_valid_rdata_bus; // rd by timer

input tid_newarr_rst;  // rst by timer
input [5:0] tid_newarr_rst_addr; 
input tid_newarr_set;   // set by req_cmd
input [5:0] tid_newarr_set_addr;

input tid_newarr_rd;	// rd by timer
input [5:0] tid_newarr_raddr;
output tid_newarr_rdata;
output [63:0] tid_newarr_rdata_bus; // rd by timer 

input resp_rcv_rst;   // rst by timer
input [5:0] resp_rcv_rst_addr;
input resp_rcv_set;    // set by resp_cmdproc
input [5:0] resp_rcv_set_addr;

input resp_rcv_rd;     // rd by timer
input [5:0] resp_rcv_raddr;
output resp_rcv_rdata;
output [63:0] resp_rcv_rdata_bus;  // (rd by timer)

input timeout_set;	// set by timer
input timeout_rst;	// rst by tohdlr
input [5:0] timeout_set_addr;
input [5:0] timeout_rst_addr;
input timeout_rd;	// rd by tohdlr
input [5:0] timeout_raddr;
output timeout_rdata;
output [63:0] timeout_rdata_bus;  // rd by tohdlr

input tid_xmited_set;   // rst by sii_req
input [5:0] tid_xmited_set_addr;
output [63:0] tid_xmited_rdata_bus; // rd by timer 

output [63:0] tid_dirty_rdata_bus;

/*
niu_smx_arb_2c #(6) arb_tid_valid(
	.req_a		(tid_valid_rst0), 
	.req_b		(tid_valid_rst1), 
	.muxin_a	(tid_valid_rst_addr0 [5:0]), 
	.muxin_b	(tid_valid_rst_addr1 [5:0]),
	.ack_a		(tid_valid_rst0_ack), 
	.ack_b		(tid_valid_rst1_ack), 
	.selout		(tid_valid_rst_addr [5:0])
	);
*/


		// 1 - valid
		// 0 - non-valid
niu_smx_regflag  tid_valid_flag(
   	.clk		(clk), 
	.reset_l	(reset_l), 	
	.set		(tid_valid_set), 
	.rst0		(tid_valid_rst0), 
	.rst1		(tid_valid_rst1), 
	.set_addr	(tid_valid_set_addr [5:0]), 	
	.rst_addr0	(tid_valid_rst_addr0 [5:0]), 
	.rst_addr1	(tid_valid_rst_addr1 [5:0]), 
	.rst_first	(1'b1),
	.rd		(tid_valid_rd), 
	.raddr		(tid_valid_raddr [5:0]),	
   	.rdata		(tid_valid_rdata), 
	.rdata_bus	(tid_valid_rdata_bus [63:0]) 
   );

wire tid_dirty_rdata;
wire tid_dirty_set= tid_valid_rst1 |   // set this same time as valid rst by timer
			(tid_dirty_rdata & 1'b0);  // avoid vlint since tid_dirty_rdata not use
wire [5:0] tid_dirty_set_addr= tid_valid_rst_addr1;
wire tid_dirty_rst0= tid_valid_set;  // reset dirty same time as valid entry set; 
wire [5:0] tid_dirty_rst_addr0= tid_valid_set_addr;

niu_smx_regflag  tid_dirty_flag(
   	.clk		(clk), 
	.reset_l	(reset_l), 	
	.set		(tid_dirty_set), 
	.rst0		(tid_dirty_rst0), 
	.rst1		(1'b0), 
	.set_addr	(tid_dirty_set_addr [5:0]), 	
	.rst_addr0	(tid_dirty_rst_addr0 [5:0]), 
	.rst_addr1	(tid_dirty_rst_addr0 [5:0]), 
	.rst_first	(1'b1),
	.rd		(1'b0), 
	.raddr		(6'h0),	
   	.rdata		(tid_dirty_rdata), 
	.rdata_bus	(tid_dirty_rdata_bus [63:0]) 
   );



/*
niu_smx_arb_2c #(6) arb_resp_rcv(
	.req_a		(resp_rcv_rst0), 
	.req_b		(resp_rcv_rst1), 
	.muxin_a	(resp_rcv_rst_addr0 [5:0]), 
	.muxin_b	(resp_rcv_rst_addr1 [5:0]),
	.ack_a		(resp_rcv_rst0_ack), 
	.ack_b		(resp_rcv_rst1_ack), 
	.selout		(resp_rcv_rst_addr [5:0])
	);
*/

niu_smx_regflag  resp_rcv_flag(
   	.clk		(clk), 
	.reset_l	(reset_l), 	
	.set		(resp_rcv_set), 
	.rst0		(resp_rcv_rst),
	.rst1		(1'b0),
	.set_addr	(resp_rcv_set_addr [5:0]), 	
	.rst_addr0	(resp_rcv_rst_addr [5:0]), 
	.rst_addr1	(resp_rcv_rst_addr [5:0]), 
	.rst_first	(1'b0),
	.rd		(resp_rcv_rd), 
	.raddr		(resp_rcv_raddr [5:0]),	
   	.rdata		(resp_rcv_rdata), 
	.rdata_bus	(resp_rcv_rdata_bus [63:0])
   );

niu_smx_regflag  timeout_flag(
   	.clk		(clk), 
	.reset_l	(reset_l), 	
	.set		(timeout_set), 
	.rst0		(timeout_rst), 
	.rst1		(1'b0), 
	.set_addr	(timeout_set_addr [5:0]), 	
	.rst_addr0	(timeout_rst_addr [5:0]), 
	.rst_addr1	(timeout_rst_addr [5:0]), 
	.rst_first	(1'b0),
	.rd		(timeout_rd), 
	.raddr		(timeout_raddr [5:0]),	
   	.rdata		(timeout_rdata ), 
	.rdata_bus	(timeout_rdata_bus [63:0])
   );

niu_smx_regflag  tid_newarr_flag(
   	.clk		(clk), 
	.reset_l	(reset_l), 	
	.set		(tid_newarr_set), 
	.rst0		(tid_newarr_rst), 
	.rst1		(1'b0), 
	.set_addr	(tid_newarr_set_addr [5:0]), 	
	.rst_addr0	(tid_newarr_rst_addr [5:0]), 
	.rst_addr1	(tid_newarr_rst_addr [5:0]), 
	.rst_first	(1'b0),
	.rd		(tid_newarr_rd), 
	.raddr		(tid_newarr_raddr [5:0]),	
   	.rdata		(tid_newarr_rdata ), 
	.rdata_bus	(tid_newarr_rdata_bus [63:0]) 
   );

wire tid_xmited_rdata; // not use; put this to avoid vlint null port
                // rst xmited bit at beginning of a transaction request
wire tid_xmited_rst= tid_valid_set | (tid_xmited_rdata & (1'b0));
wire [5:0] tid_xmited_rst_addr= tid_valid_set_addr;

niu_smx_regflag  tid_xmited_flag(
   	.clk		(clk), 
	.reset_l	(reset_l), 	
	.set		(tid_xmited_set), 
	.rst0		(tid_xmited_rst), 
	.rst1		(1'b0), 
	.set_addr	(tid_xmited_set_addr [5:0]), 	
	.rst_addr0	(tid_xmited_rst_addr [5:0]), 
	.rst_addr1	(tid_xmited_rst_addr [5:0]), 
	.rst_first	(1'b0),
	.rd		(1'b0), 
	.raddr		(6'h0),	
   	.rdata		(tid_xmited_rdata), 
	.rdata_bus	(tid_xmited_rdata_bus [63:0]) 
   );




endmodule


