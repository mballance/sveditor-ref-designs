// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: int_sync.v
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
module int_sync;

int_cmp int_cmp (); // 1 instance per NCU


`ifdef CORE_0

int_c0t0 int_c0t0 ();
int_c0t1 int_c0t1 ();
int_c0t2 int_c0t2 ();
int_c0t3 int_c0t3 ();
int_c0t4 int_c0t4 ();
int_c0t5 int_c0t5 ();
int_c0t6 int_c0t6 ();
int_c0t7 int_c0t7 ();

core_sync_c0 core_sync_c0 (); 


`endif

`ifdef CORE_1

int_c1t0 int_c1t0 ();
int_c1t1 int_c1t1 ();
int_c1t2 int_c1t2 ();
int_c1t3 int_c1t3 ();
int_c1t4 int_c1t4 ();
int_c1t5 int_c1t5 ();
int_c1t6 int_c1t6 ();
int_c1t7 int_c1t7 ();

core_sync_c1 core_sync_c1 (); 


`endif

`ifdef CORE_2

int_c2t0 int_c2t0 ();
int_c2t1 int_c2t1 ();
int_c2t2 int_c2t2 ();
int_c2t3 int_c2t3 ();
int_c2t4 int_c2t4 ();
int_c2t5 int_c2t5 ();
int_c2t6 int_c2t6 ();
int_c2t7 int_c2t7 ();

core_sync_c2 core_sync_c2 (); 


`endif

`ifdef CORE_3

int_c3t0 int_c3t0 ();
int_c3t1 int_c3t1 ();
int_c3t2 int_c3t2 ();
int_c3t3 int_c3t3 ();
int_c3t4 int_c3t4 ();
int_c3t5 int_c3t5 ();
int_c3t6 int_c3t6 ();
int_c3t7 int_c3t7 ();

core_sync_c3 core_sync_c3 (); 


`endif

`ifdef CORE_4

int_c4t0 int_c4t0 ();
int_c4t1 int_c4t1 ();
int_c4t2 int_c4t2 ();
int_c4t3 int_c4t3 ();
int_c4t4 int_c4t4 ();
int_c4t5 int_c4t5 ();
int_c4t6 int_c4t6 ();
int_c4t7 int_c4t7 ();

core_sync_c4 core_sync_c4 (); 


`endif

`ifdef CORE_5

int_c5t0 int_c5t0 ();
int_c5t1 int_c5t1 ();
int_c5t2 int_c5t2 ();
int_c5t3 int_c5t3 ();
int_c5t4 int_c5t4 ();
int_c5t5 int_c5t5 ();
int_c5t6 int_c5t6 ();
int_c5t7 int_c5t7 ();

core_sync_c5 core_sync_c5 (); 


`endif

`ifdef CORE_6

int_c6t0 int_c6t0 ();
int_c6t1 int_c6t1 ();
int_c6t2 int_c6t2 ();
int_c6t3 int_c6t3 ();
int_c6t4 int_c6t4 ();
int_c6t5 int_c6t5 ();
int_c6t6 int_c6t6 ();
int_c6t7 int_c6t7 ();

core_sync_c6 core_sync_c6 (); 


`endif

`ifdef CORE_7

int_c7t0 int_c7t0 ();
int_c7t1 int_c7t1 ();
int_c7t2 int_c7t2 ();
int_c7t3 int_c7t3 ();
int_c7t4 int_c7t4 ();
int_c7t5 int_c7t5 ();
int_c7t6 int_c7t6 ();
int_c7t7 int_c7t7 ();

core_sync_c7 core_sync_c7 (); 


`endif


endmodule
//----------------------------------------------------------
//----------------------------------------------------------
