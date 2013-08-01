// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_srq.v
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
module dmu_mmu_srq 
  (
   clk,				// clock
   rst_l,			// rst_l
   ld,				// load
   ds,				// data select
   di,				// data in
   do				// data out
   );
     
// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	QD = 4,		// queue depth
		QW = 2;		// queue width

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input			clk;
  input			rst_l;

  input  [QD-1:0]	ld;
  input  [QD-2:0]	ds;

  input  [QW-1:0]	di;
  output [QW-1:0]	do;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [QW-1:0] 	do;
  reg  [QW-1:0]		que [0:QD-1];

  integer i;

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
  assign do = que[0];

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) 
	if(~rst_l) begin : que_rst
	   integer j;
    for (j = 0; j < QD; j = j + 1) begin
        que[j] <= {QW{1'b0}};
	end
      end
	else begin
    for (i = 0; i < QD-1; i = i + 1) begin
      if (ld[i]) que[i] <= ds[i] ? que[i+1] : di;
    end
    if (ld[QD-1]) que[QD-1] <= di;
  end

endmodule // dmu_mmu_srq
