// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_qcb_qgc.v
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
module dmu_mmu_qcb_qgc 
  (
   clk,				// clock
   rst_l,			// reset
   enq,				// enqueue
   deq,				// dequeue
   ld,				// load
   ds,				// data select
   vld				// valid bits
   );
     
// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	QD = 4;		// queue depth	

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input			clk;
  input 		rst_l;

  input 		enq;
  input 		deq;

  output [QD-1:0] 	ld;
  output [QD-2:0] 	ds;
  output [QD-1:0] 	vld;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  reg  [QD-1:0]		ld;
  reg  [QD-2:0]		ds;
  reg  [QD-1:0]		vld, nxt_vld;

  integer i;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in fifo -enq enq -deq deq -depth QD

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
  always @ (rst_l or enq or deq or vld) begin
    case ({enq, deq})
      2'b00 : ld = ~{ QD { rst_l } };
      2'b01 : ld =  vld;
      2'b10 : ld = ~vld;
      2'b11 : ld =  vld;
    endcase
  end

  always @ (vld) begin
    for (i = 0; i < QD - 1; i = i + 1) ds[i] = vld[i+1];
  end

  always @ (enq or deq or vld) begin
    case ({enq, deq})
      2'b00 : nxt_vld = vld;
      2'b01 : nxt_vld = { 1'b0, vld[QD-1:1] };
      2'b10 : nxt_vld = { vld[QD-2:0], 1'b1 };
      2'b11 : nxt_vld = vld;
    endcase
  end

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin 
      vld <= 0;
    end
    else begin
      vld <= nxt_vld;
    end
  end

endmodule // dmu_mmu_qcb_qgc
