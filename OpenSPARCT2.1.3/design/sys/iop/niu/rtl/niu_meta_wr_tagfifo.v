// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_meta_wr_tagfifo.v
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
/*********************************************************************
 *
 *  niu_meta_wr_tagfifo.v
 *
 *  Parameterized synchronous fifo for buffering data and commands
 *  in the gpi data path, this fifo is initialized with default tags
 * 
 *  Original Author(s):   Nimita Taneja
 *  Modifier(s):
 *  Project(s):          Neptune
 *
 *  Copyright (c) 2004   Sun Microsystems, Inc.
 *
 *  Revision History:  03-01-2004     : Initial Release
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/

module niu_meta_wr_tagfifo (core_clk, reset   , inc_rp, inc_wp, fifo_not_empty,
                   fifo_full, din, rdout, dout, count);

parameter WIDTH = 5;
parameter [31:0] DEPTH = 32;   
parameter ASIZE = 5;   

input           core_clk, reset   , inc_rp, inc_wp;
input [WIDTH-1:0]    din;

output          fifo_not_empty, fifo_full;
output [WIDTH-1:0]   rdout;
output [WIDTH-1:0]   dout;
output [ASIZE:0]    count;


reg [WIDTH-1:0]      fifo[0:DEPTH-1];
reg [ASIZE-1:0]          wp;
reg  [ASIZE-1:0]         rp;
wire [WIDTH-1:0]      dout;
reg [WIDTH-1:0]      rdout;
reg [ASIZE:0]       fifosize;
wire            fifo_not_empty;
wire            fifo_empty;
wire            fifo_full;
//reg  [WIDTH-1:0]      i;
   integer 	i;
wire [ASIZE:0]      count;
assign count = fifosize;

assign fifo_full = (fifosize==DEPTH[ASIZE:0]);

// synopsys translate_off
`ifdef META_ERR_CHECK
reg     error;
always@(posedge core_clk) begin
    if (reset) error <= 0;
    else if (fifo_full & inc_wp) begin
                error = 1;
                $display($time, " %m -ERROR:  fifo overrun !!!!!!!!!");
                repeat(10) @(posedge core_clk);
        end
        else if ((fifosize == 0) & inc_rp) begin
                error = 1;
                $display($time, " %m -ERROR:  fifo underrun !!!!!!!!!");
                repeat(10) @(posedge core_clk);
        end
end
`endif
// synopsys translate_on

always@(posedge core_clk)
   if (reset)           fifosize <= 6'd32;
   else if (inc_wp & !inc_rp)   fifosize <= fifosize +1'b1;
   else if (!inc_wp & inc_rp)   fifosize <= fifosize -1'b1;
   else                         fifosize <= fifosize;



assign fifo_not_empty   = fifosize > 0;
assign fifo_empty   = (fifosize == 0);

always@(posedge core_clk )
  if (reset)                    wp <= 0;
  else if (inc_wp & !fifo_full) wp <= wp + 1'b1;

always@(posedge core_clk)
  if (reset)                      rp <= 0;
 else if (inc_rp & !fifo_empty)  rp <= rp + 1'b1;

always@(posedge core_clk )
  if (reset) begin
     //   for (i=0; i<DEPTH; i=i+1) fifo[i] <= i;
     fifo[0] <= 5'd0;
     fifo[1] <= 5'd1;
     fifo[2] <= 5'd2;
     fifo[3] <= 5'd3;
     fifo[4] <= 5'd4;
     fifo[5] <= 5'd5;
     fifo[6] <= 5'd6;
     fifo[7] <= 5'd7;
     fifo[8] <= 5'd8;
     fifo[9] <= 5'd9;
     fifo[10] <= 5'd10;
     fifo[11] <= 5'd11;
     fifo[12] <= 5'd12;
     fifo[13] <= 5'd13;
     fifo[14] <= 5'd14;
     fifo[15] <= 5'd15;
     fifo[16] <= 5'd16;
     fifo[17] <= 5'd17;
     fifo[18] <= 5'd18;
     fifo[19] <= 5'd19;
     fifo[20] <= 5'd20;
     fifo[21] <= 5'd21;
     fifo[22] <= 5'd22;
     fifo[23] <= 5'd23;
     fifo[24] <= 5'd24;
     fifo[25] <= 5'd25;
     fifo[26] <= 5'd26;
     fifo[27] <= 5'd27;
     fifo[28] <= 5'd28;
     fifo[29] <= 5'd29;
     fifo[30] <= 5'd30;
     fifo[31] <= 5'd31;
   end
  else if (inc_wp)
        fifo[wp] <= din;
  else begin
        for (i=0; i<DEPTH; i=i+1) fifo[i] <= fifo[i];
  end
/*
always@(rp or fifo[0] or fifo[1] or fifo_not_empty)
  case(rp) // synopsys parallel_case
         1'b0: dout = fifo[0] & {WIDTH{fifo_not_empty}};
         1'b1: dout = fifo[1] & {WIDTH{fifo_not_empty}};
      default: dout = fifo[0] & {WIDTH{fifo_not_empty}};
  endcase
*/

assign  dout = fifo[rp]  & {WIDTH{fifo_not_empty}};
   
always@(posedge core_clk)
  if (reset)
 rdout <= 0;
  else
     rdout <= dout;

endmodule
