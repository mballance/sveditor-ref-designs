// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_common_srq.v
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
module pcie_common_srq (
			clk,
  			rst_l,
			enq,
			deq,
			di,
			do,
			empty,
			full,
			afull
			);

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	QD = 4,				// queue depth
		QW = 8;				// queue width

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input			clk;			// clock
  input 		rst_l;			// reset

  input 		enq;			// enqueue
  input 		deq;			// dequeue
  
  input  [QW-1:0] 	di;			// data in

  output [QW-1:0] 	do;			// data out

  output		empty;			// empty
  output		full;			// full
  output		afull;			// almost full

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------

  wire [QW-1:0] 	do;
  wire			empty;
  wire			full;
  wire			afull;

  wire [QD-1:0] 	vld;
  wire [QD-1:0] 	ld;
  wire [QD-2:0] 	ds;
  
// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  //0in fifo -enq enq -deq deq -depth QD -enq_data di -deq_data do

// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------

  pcie_common_srq_qdp #(QD, QW)	qdp (
				     .clk	(clk),
				     .rst_l	(rst_l),
				     .ld	(ld),
				     .ds	(ds),
				     .di	(di),
				     .do	(do)
				     );

  pcie_common_srq_qcp #(QD)	qcp (
				     .clk	(clk),
				     .rst_l	(rst_l),
				     .enq	(enq),
				     .deq	(deq),
				     .ld	(ld),
				     .ds	(ds),
				     .vld	(vld)
				     );

  pcie_common_srq_qci #(QD)	qci (
				     .vld	(vld),
				     .empty	(empty),
				     .full	(full),
				     .afull	(afull)
				     );

endmodule // pcie_common_srq

