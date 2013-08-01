// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_resp_ff.v
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
module niu_smx_resp_ff(
/*AUTOARG*/
   // Outputs
   resp_cmdff_full, resp_cmdff_rdata, resp_cmdff_empty, 
   resp_dataff_full, resp_dataff_rdata, resp_dataff_empty, 
   mb0_smx_store_32x146_scan_out, niu_mb0_smx_store_data_out, 
   // Inputs
   clk, iol2clk, reset_l, resp_cmdff_wr, resp_cmdff_wdata, resp_cmdff_rd, 
   resp_dataff_wr, resp_dataff_wdata, resp_dataff_rd,
   tcu_aclk, tcu_bclk, tcu_se_scancollar_in,
   tcu_array_wr_inhibit, mb0_smx_store_32x146_scan_in, 
   niu_mb0_smx_store_32x146_wdata, niu_mb0_smx_store_32x146_rd_addr, 
   niu_mb0_smx_store_32x146_wr_addr, niu_mb0_smx_store_32x146_wr_en, 
   niu_mb0_smx_store_32x146_rd_en, niu_mb0_run
   );

input clk;
input iol2clk;
input reset_l;

// resp  if; cmdff
input 		resp_cmdff_wr;
input [21:0] 	resp_cmdff_wdata;
output 		resp_cmdff_full;
input 		resp_cmdff_rd;
output [21:0] 	resp_cmdff_rdata;
output 		resp_cmdff_empty;  

// resp if; data ff
input 		resp_dataff_wr;
input [143:0] 	resp_dataff_wdata;
output 		resp_dataff_full; // right now not use ???
input 		resp_dataff_rd;
output [143:0] 	resp_dataff_rdata; 
output 		resp_dataff_empty;

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

/*
niu_smx_ff_regfl #(129,4) resp_dataff_129bx16(
	.clk		(clk),
	.reset_l	(reset_l),
	.wr		(resp_dataff_wr),
	.wdata		({resp_dataff_wdata_err, resp_dataff_wdata[127:0]}),
	.full		(resp_dataff_full),
	.rd		(resp_dataff_rd),
	.empty		(resp_dataff_empty),
	.rdata		(dataff_rdata[128:0])
);
*/

niu_smx_ff_ram32x144  resp_dataff_144bx32(
          .tcu_aclk		(tcu_aclk),
          .tcu_bclk		(tcu_bclk),
          .tcu_se_scancollar_in	  (tcu_se_scancollar_in),
          .tcu_array_wr_inhibit  (tcu_array_wr_inhibit),
          .mb0_smx_store_32x146_scan_in	(mb0_smx_store_32x146_scan_in),
          .mb0_smx_store_32x146_scan_out (mb0_smx_store_32x146_scan_out),
          .niu_mb0_smx_store_32x146_wdata    (niu_mb0_smx_store_32x146_wdata [7:0]),
          .niu_mb0_smx_store_32x146_rd_addr   (niu_mb0_smx_store_32x146_rd_addr [4:0]),
          .niu_mb0_smx_store_32x146_wr_addr   (niu_mb0_smx_store_32x146_wr_addr [4:0]),
          .niu_mb0_smx_store_32x146_wr_en 	(niu_mb0_smx_store_32x146_wr_en),
          .niu_mb0_smx_store_32x146_rd_en	(niu_mb0_smx_store_32x146_rd_en),
          .niu_mb0_run	(niu_mb0_run),
	  .niu_mb0_smx_store_data_out  (niu_mb0_smx_store_data_out[145:0]),
	.iol2clk	(iol2clk),
        .clk            (clk),
	.reset_l	(reset_l),
	.wr		(resp_dataff_wr),
	.wdata		(resp_dataff_wdata[143:0]),
	.full		(resp_dataff_full),
	.rd		(resp_dataff_rd),
	.empty		(resp_dataff_empty),
	.rdata		(resp_dataff_rdata[143:0])
);


niu_smx_ff_regfl #(22,2) resp_cmdff_22bx4(
	.clk		(clk),
	.reset_l	(reset_l),
	.wr		(resp_cmdff_wr),
	.wdata		(resp_cmdff_wdata[21:0]), 
	.full		(resp_cmdff_full),
	.rd		(resp_cmdff_rd),
	.empty		(resp_cmdff_empty),
	.rdata		(resp_cmdff_rdata[21:0])
);

endmodule
