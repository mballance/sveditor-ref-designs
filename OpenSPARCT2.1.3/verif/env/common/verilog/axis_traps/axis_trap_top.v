// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_trap_top.v
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
module axis_trap_top(pc_dmp_sz);
input [21:0] pc_dmp_sz;

//`include "defines.vh"
//`include "nas.vh"

// wires for asm user events
//`include "asmEventsProbes.vh"

//----------------------------------------------------------
// Instantiate 1-8 cores
`ifdef CORE_0
  axis_trap_core0 c0 (3'h0,pc_dmp_sz);
`endif
`ifdef CORE_1
  axis_trap_core1 c1 (3'h1,pc_dmp_sz);
`endif
`ifdef CORE_2
  axis_trap_core2 c2 (3'h2,pc_dmp_sz);
`endif
`ifdef CORE_3
  axis_trap_core3 c3 (3'h3,pc_dmp_sz);
`endif
`ifdef CORE_4
  axis_trap_core4 c4 (3'h4,pc_dmp_sz);
`endif
`ifdef CORE_5
  axis_trap_core5 c5 (3'h5,pc_dmp_sz);
`endif
`ifdef CORE_6
  axis_trap_core6 c6 (3'h6,pc_dmp_sz);
`endif
`ifdef CORE_7
  axis_trap_core7 c7 (3'h7,pc_dmp_sz);
`endif

//----------------------------------------------------------
endmodule
//----------------------------------------------------------
//----------------------------------------------------------
