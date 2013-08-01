// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_io_rstgen.v
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
module ccu_io_rstgen ( 
	iol2clk,
	csr_ucb_rst_n,
	tcu_atpg_mode,
	csr_rst_n,
	ucb_rst_n
);

// port def

input iol2clk;
input csr_ucb_rst_n;
input tcu_atpg_mode;
output csr_rst_n;
output ucb_rst_n;


// external wire/reg def

wire iol2clk;
wire csr_ucb_rst_n;
wire tcu_atpg_mode;
wire csr_rst_n;
wire ucb_rst_n;


// internal wire/reg def

wire io_csr_ucb_rst_n;
wire pre_io_csr_ucb_rst_n;

//
// async active-low reset assertion, sync deassertion 
//
assign io_csr_ucb_rst_n = pre_io_csr_ucb_rst_n & csr_ucb_rst_n;

cl_a1_clksyncff_4x csr_ucb_rst_syncff (
	.l1clk (l1clk), .d (csr_ucb_rst_n), .q(pre_io_csr_ucb_rst_n),
	.si(1'b0), .siclk(1'b0), .soclk (1'b0), .so() 
);


assign ucb_rst_n = io_csr_ucb_rst_n;  // no gating needed since drives sync flops 
assign csr_rst_n = io_csr_ucb_rst_n  |  tcu_atpg_mode;  // drives async flops 


// ***********************************************************
// L1 header - iol2 clk 
// ***********************************************************
//
cl_a1_l1hdr_8x header_iol2clk (
    .l2clk(iol2clk),
    .l1clk(l1clk),
    .pce(1'b1),
    .se(1'b0),
    .pce_ov(1'b1),
    .stop(1'b0)
);

endmodule
