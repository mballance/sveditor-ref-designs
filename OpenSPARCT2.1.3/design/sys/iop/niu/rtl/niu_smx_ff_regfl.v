// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_ff_regfl.v
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

module niu_smx_ff_regfl(
/*AUTOARG*/
   // Outputs
   full, empty, rdata, 
   // Inputs
   clk, reset_l, wr, wdata, rd
   );

// synopsys template

parameter DATA_WIDTH= 128;
parameter ADDR_WIDTH= 4;

// fifo if
input 			clk;
input 			reset_l;

input 			wr;
input [DATA_WIDTH-1:0] 	wdata;
output 			full;

input 			rd;                       
output 			empty;
output [DATA_WIDTH-1:0]	rdata;

wire [DATA_WIDTH-1:0] mwdata= wdata;
wire [DATA_WIDTH-1:0] mrdata;
wire [DATA_WIDTH-1:0] rdata= mrdata;
wire [ADDR_WIDTH-1:0] mwaddr;
wire [ADDR_WIDTH-1:0] mraddr;
wire mwr;
wire mrd;

niu_smx_ff_ctrl #(ADDR_WIDTH) ctrl(
	.clk		(clk),
	.reset_l	(reset_l),	
	.wr		(wr),
	.rd		(rd),
	.full		(full),
	.empty		(empty),
	.mwr		(mwr),
	.mwaddr		(mwaddr[ADDR_WIDTH-1:0]),
	.mrd		(mrd),
	.mraddr		(mraddr[ADDR_WIDTH-1:0])
);


niu_smx_regfl #(DATA_WIDTH,ADDR_WIDTH) regfl(
	.clk		(clk),
	.reset_l	(reset_l),
	.wr		(mwr),
	.addr_wr	(mwaddr[ADDR_WIDTH-1:0]),	
	.data_wr	(mwdata[DATA_WIDTH-1:0]),
	.rd		(mrd),
	.addr_rd	(mraddr[ADDR_WIDTH-1:0]),
	.data_rd	(mrdata[DATA_WIDTH-1:0])
);

endmodule

/*
 // if need ram, need to explicitly specify  
module niu_smx_ff_66bx16(
);

parameter DATA_WIDTH= 128;
parameter ADDR_WIDTH= 4;

// fifo if
input clk;
input reset_l;

input wr;
input [DATA_WIDTH-1:0] wdata;
output full;

input rd;                       
output empty;
output [DATA_WIDTH-1:0]rdata;

wire [DATA_WIDTH-1:0] mwdata= wdata;
wire [DATA_WIDTH-1:0] mrdata;
wire [DATA_WIDTH-1:0] rdata= mrdata;

niu_smx_ff_ctrl #(DATA_WIDTH,ADDR_WIDTH) ctrl(
	.clk		(clk),
	.reset_l	(reset_l),	
	.wr		(wr),
	.rd		(rd),
	.full		(full),
	.empty		(empty),
	.mwr		(mwr),
	.mwaddr		(mwaddr[ADDR_WIDTH-1:0]),
	.mrd		(mrd),
	.mraddr		(mraddr[ADDR_WIDTH-1:0])
);


niu_smx_regfl regfl(DATA_WIDTH,ADDR_WIDTH) regfl
	.clk		(clk),
	.reset_l	(reset_l),
	.wr		(mwr),
	.addr_wr	(mwaddr[ADDR_WIDTH-1:0]),	
	.data_wr	(mwdata[DATA_WIDTH-1:0]),
	.rd		(mrd),
	.addr_rd	(mraddr[ADDR_WIDTH-1:0]),
	.data_rd	(mrdata[DATA_WIDTH-1:0])
);

endmodule
*/
