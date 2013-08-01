// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_regflag.v
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

module niu_smx_regflag(
/*AUTOARG*/
   // Outputs
   rdata, rdata_bus, 
   // Inputs
   clk, reset_l, set, rst0, rst1, set_addr, rst_addr0, rst_addr1, 
   rst_first, rd, raddr
   );

// synopsys template

parameter ADDR_WIDTH= 6;
parameter ENTRY_SIZE= 1<<ADDR_WIDTH;


input clk;
input reset_l;
input set;
input rst0;
input rst1;
input [ADDR_WIDTH-1:0]  set_addr;
input [ADDR_WIDTH-1:0]  rst_addr0;
input [ADDR_WIDTH-1:0]  rst_addr1;
input rst_first;

input rd;
input [ADDR_WIDTH-1:0]  raddr;
output rdata;	

output [ENTRY_SIZE-1:0] rdata_bus;

reg [ENTRY_SIZE-1:0] data;
reg rdata;

wire [ENTRY_SIZE-1:0] rdata_bus= data;

wire [ENTRY_SIZE-1:0] decode_rst0_n;
wire [ENTRY_SIZE-1:0] decode_rst1_n;
wire [ENTRY_SIZE-1:0] decode_set_n;
wire [ENTRY_SIZE-1:0] rst0_en_n= (decode_rst0_n & {ENTRY_SIZE{rst0}});
wire [ENTRY_SIZE-1:0] rst1_en_n= (decode_rst1_n & {ENTRY_SIZE{rst1}});
wire [ENTRY_SIZE-1:0] set_en_n= (decode_set_n & {ENTRY_SIZE{set}});
wire [ENTRY_SIZE-1:0] rst_en_n= rst0_en_n | rst1_en_n;
wire [ENTRY_SIZE-1:0] data_rst_n= data & ~rst_en_n;
wire [ENTRY_SIZE-1:0] data_set_n= data | set_en_n;

		// reset override set at same addr
wire [ENTRY_SIZE-1:0] rf_data_n= data_set_n & ~rst_en_n;
		// set override reset at same addr
wire [ENTRY_SIZE-1:0] sf_data_n= data_rst_n | set_en_n;

integer i;

  always @(posedge clk) begin
    if(!reset_l) begin
      for(i=0; i<ENTRY_SIZE; i=i+1)
        data[i]<= `SMX_PD  1'b0;
    end
    else begin
      if(rst0 | rst1 | set) 
        data<= `SMX_PD (rst_first)? rf_data_n : sf_data_n;
    end
  end

  always @(posedge clk) begin
    if(rd) begin
      rdata<= `SMX_PD  data[raddr];
    end
  end


niu_smx_decode #(ADDR_WIDTH, ENTRY_SIZE) decode_set(
	.in (set_addr[ADDR_WIDTH-1:0]),
	.out (decode_set_n[ENTRY_SIZE-1:0])
	);
niu_smx_decode #(ADDR_WIDTH, ENTRY_SIZE) decode_rst0(
	.in (rst_addr0[ADDR_WIDTH-1:0]),
	.out (decode_rst0_n[ENTRY_SIZE-1:0])
	);
niu_smx_decode #(ADDR_WIDTH, ENTRY_SIZE) decode_rst1(
	.in (rst_addr1[ADDR_WIDTH-1:0]),
	.out (decode_rst1_n[ENTRY_SIZE-1:0])
	);


endmodule

