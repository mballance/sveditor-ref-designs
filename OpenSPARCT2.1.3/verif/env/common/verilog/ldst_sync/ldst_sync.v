// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ldst_sync.v
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
module ldst_sync;


`ifdef CORE_0

ldst_lsu_c0 ldst_c0 ();

`endif

`ifdef CORE_1

ldst_lsu_c1 ldst_c1 ();

`endif

`ifdef CORE_2

ldst_lsu_c2 ldst_c2 ();

`endif

`ifdef CORE_3

ldst_lsu_c3 ldst_c3 ();

`endif

`ifdef CORE_4

ldst_lsu_c4 ldst_c4 ();

`endif

`ifdef CORE_5

ldst_lsu_c5 ldst_c5 ();

`endif

`ifdef CORE_6

ldst_lsu_c6 ldst_c6 ();

`endif

`ifdef CORE_7

ldst_lsu_c7 ldst_c7 ();

`endif

ldst_l2 ldst_l2 ();

ldst_ncu ldst_ncu ();


endmodule
//----------------------------------------------------------
//----------------------------------------------------------
