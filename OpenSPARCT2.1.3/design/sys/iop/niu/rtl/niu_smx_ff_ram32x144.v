// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_ff_ram32x144.v
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

module niu_smx_ff_ram32x144(
/*AUTOARG*/
   // Outputs
   full, empty, rdata, mb0_smx_store_32x146_scan_out, 
   niu_mb0_smx_store_data_out, 
   // Inputs
   clk, iol2clk, reset_l, wr, wdata, rd, tcu_aclk, tcu_bclk, 
   tcu_se_scancollar_in,
   tcu_array_wr_inhibit, mb0_smx_store_32x146_scan_in, 
   niu_mb0_smx_store_32x146_wdata, niu_mb0_smx_store_32x146_rd_addr, 
   niu_mb0_smx_store_32x146_wr_addr, niu_mb0_smx_store_32x146_wr_en, 
   niu_mb0_smx_store_32x146_rd_en, niu_mb0_run
   );


parameter DATA_WIDTH= 144;
parameter ADDR_WIDTH= 5;

// fifo if
input 			clk;
input                   iol2clk;
input 			reset_l;

input 			wr;
input [DATA_WIDTH-1:0] 	wdata;
output 			full;

input 			rd;                       
output 			empty;
output [DATA_WIDTH-1:0]	rdata;

// mbist if
input                          tcu_aclk;
input                          tcu_bclk;
input                          tcu_se_scancollar_in;
input                          tcu_array_wr_inhibit;
input                          mb0_smx_store_32x146_scan_in;
output                         mb0_smx_store_32x146_scan_out;

input    [7:0]   niu_mb0_smx_store_32x146_wdata;
input    [4:0]   niu_mb0_smx_store_32x146_rd_addr;
input    [4:0]   niu_mb0_smx_store_32x146_wr_addr;
input            niu_mb0_smx_store_32x146_wr_en;
input            niu_mb0_smx_store_32x146_rd_en;
input            niu_mb0_run;

output [145:0]	niu_mb0_smx_store_data_out;


wire [DATA_WIDTH-1:0] mwdata= wdata;
wire [145:0] 	      mrdata;
wire [DATA_WIDTH-1:0] rdata= mrdata[143:0];
wire [ADDR_WIDTH-1:0] mwaddr;
wire [ADDR_WIDTH-1:0] mraddr;
wire mwr;
wire mrd;
wire [145:0] 	      niu_mb0_smx_store_data_out= mrdata;

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

/*
 uncomment later ????
niu_ram_32_146 ram(
          .clk	(clk),
          .wt_enable	(mwr),
          .addr_wt	(mwaddr[ADDR_WIDTH-1:0]),
          .data_inp	({2'h0, mwdata[DATA_WIDTH-1:0]}),
          .cs_rd	(mrd),
          .addr_rd	(mraddr[ADDR_WIDTH-1:0]),
          .data_out	(mrdata[145:0])
	);
*/

wire [145:0] concat_niu_mb0_smx_store_32x146_wdata={
	niu_mb0_smx_store_32x146_wdata[1:0],
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata,
	niu_mb0_smx_store_32x146_wdata
	}; 

wire mb0_smx_store_32x146_scan_out;

niu_ram_32_146 ram(
          .tcu_aclk		(tcu_aclk),
          .tcu_bclk		(tcu_bclk),
          .tcu_se_scancollar_in	  (tcu_se_scancollar_in),
          .tcu_array_wr_inhibit  (tcu_array_wr_inhibit),
          .scan_in	(mb0_smx_store_32x146_scan_in),
          .scan_out 	(mb0_smx_store_32x146_scan_out),
          .mbi_wdata    (concat_niu_mb0_smx_store_32x146_wdata [145:0]),
          .mbi_rd_adr   (niu_mb0_smx_store_32x146_rd_addr [4:0]),
          .mbi_wr_adr   (niu_mb0_smx_store_32x146_wr_addr [4:0]),
          .mbi_wr_en 	(niu_mb0_smx_store_32x146_wr_en),
          .mbi_rd_en	(niu_mb0_smx_store_32x146_rd_en),
          .mbi_run	(niu_mb0_run),
          .clk	        (iol2clk),
          .wt_enable	(mwr),
          .addr_wt	(mwaddr[ADDR_WIDTH-1:0]),
          .data_inp	({2'h0, mwdata[DATA_WIDTH-1:0]}),
          .cs_rd	(mrd),
          .addr_rd	(mraddr[ADDR_WIDTH-1:0]),
          .data_out	(mrdata[145:0])
	);


/*
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
*/

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


