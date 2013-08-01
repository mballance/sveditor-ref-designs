// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlb_sync.vh
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
`ifdef     INC_TLBSYNC_DEFINE

`else

`define     INC_TLBSYNC_DEFINE

`define ITLB_ENTRIES       64
`define DTLB_ENTRIES      128
`define ITLB_ENTRY_WIDTH    6
`define DTLB_ENTRY_WIDTH    7

// Number of entries in Instruction Buffer
`define IB_DEPTH           10  
`define IB_PTR_WIDTH        4

// Only include err_vect in SPC2 bench
`ifdef SPC
  `define TLB_FIFO_WIDE
`endif

`ifdef TLB_FIFO_WIDE
  // IB entry = {err_vect[7:0],timestamp}
  `define TLB_FIFO_WIDTH            9+`TS_WIDTH
`else
  `define TLB_FIFO_WIDTH            `TS_WIDTH
`endif

`endif

//----------------------------------------------------------

