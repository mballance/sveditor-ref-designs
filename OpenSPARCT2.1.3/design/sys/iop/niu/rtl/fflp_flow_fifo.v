// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_flow_fifo.v
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
/**********************************************************************/
/*project name:  NIU                                                  */
/*module name:   fflp_flow_fifo                                       */
/*description:   contains the data storage for cam search results to  */
/*               hash table lookup and final merge function.          */
/*                                                                    */
/*parent module in:                                                   */
/*child modules in:  none                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai	                                      */
/*date created:      03-17-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */
module fflp_flow_fifo
		(
		clk,
		reset,
           	dout,            
		hdr_fifo_empty,
		hdr_fifo_full,
           	din,
	   	wen,
	   	ren
           	);

parameter dwidth = 16;

input			clk;
input			reset;
input   [dwidth-1:0]    din;
input                   wen; //increments wptr and writes in din
input                   ren; //increments rptr

output 	[dwidth-1:0]   	dout;            
output			hdr_fifo_empty;
output			hdr_fifo_full;
      

wire[dwidth-1:0]        dout;

`ifdef NEPTUNE
reg[dwidth-1:0]		data_mem[0:3];
reg[2:0]           	wptr;
reg[2:0]           	rptr;

wire[1:0]        	wptr1           = wptr[1:0];
wire[1:0]        	rptr1           = rptr[1:0];

wire			hdr_fifo_full	= (wptr[2] != rptr[2]) & (wptr1 == rptr1);
wire			hdr_fifo_empty	= (wptr[2] == rptr[2]) & (wptr1 == rptr1);			

`else
reg[dwidth-1:0]		data_mem[0:1];
reg[1:0]                wptr;
reg[1:0]                rptr;

wire        		wptr1           = wptr[0];
wire        		rptr1           = rptr[0];

wire                    hdr_fifo_full   = (wptr[1] != rptr[1]) & (wptr1 == rptr1);
wire                    hdr_fifo_empty  = (wptr[1] == rptr[1]) & (wptr1 == rptr1); 

`endif


always @(posedge clk)
if (wen)
	data_mem[wptr1] <= din;

assign dout	= data_mem[rptr1];

always @(posedge clk)
if (reset)
	wptr <= 0;
else if (wen)
	wptr <=  wptr + 1;
else
	wptr <=  wptr;

always @(posedge clk)
if (reset)
        rptr <= 0;
else if (ren)
        rptr <=  rptr + 1;
else
        rptr <=  rptr;


endmodule
