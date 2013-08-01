// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: monitors.v
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
module monitors;


  `ifdef CORE_0
//    ma_mon_c0 ma_mon_c0(); 
    lsu_mon_c0 lsu_mon_c0 ();
    lru_mon_c0 lru_mon_c0 ();
  `endif


  `ifdef CORE_1
//    ma_mon_c1 ma_mon_c1(); 
    lsu_mon_c1 lsu_mon_c1 ();
    lru_mon_c1 lru_mon_c1 ();
  `endif


  `ifdef CORE_2
//    ma_mon_c2 ma_mon_c2(); 
    lsu_mon_c2 lsu_mon_c2 ();
    lru_mon_c2 lru_mon_c2 ();
  `endif


  `ifdef CORE_3
//    ma_mon_c3 ma_mon_c3(); 
    lsu_mon_c3 lsu_mon_c3 ();
    lru_mon_c3 lru_mon_c3 ();
  `endif


  `ifdef CORE_4
//    ma_mon_c4 ma_mon_c4(); 
    lsu_mon_c4 lsu_mon_c4 ();
    lru_mon_c4 lru_mon_c4 ();
  `endif


  `ifdef CORE_5
//    ma_mon_c5 ma_mon_c5(); 
    lsu_mon_c5 lsu_mon_c5 ();
    lru_mon_c5 lru_mon_c5 ();
  `endif


  `ifdef CORE_6
//    ma_mon_c6 ma_mon_c6(); 
    lsu_mon_c6 lsu_mon_c6 ();
    lru_mon_c6 lru_mon_c6 ();
  `endif


  `ifdef CORE_7
//    ma_mon_c7 ma_mon_c7(); 
    lsu_mon_c7 lsu_mon_c7 ();
    lru_mon_c7 lru_mon_c7 ();
  `endif

global_chkr global_chkr();

endmodule
//----------------------------------------------------------



