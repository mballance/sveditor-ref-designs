// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_clk_clhdr_sync.v
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
module n2_clk_clhdr_sync(se ,g_clk_stop ,g_pce_ov ,g_dbg_init ,
     g_wmr_reset ,wmr_reset ,dbg_init ,so ,si ,siclk ,soclk ,gclk ,
     pce_ov ,clk_stop ,l2clk );
output		wmr_reset ;
output		dbg_init ;
output		so ;
output		pce_ov ;
output		clk_stop ;
input		se ;
input		g_clk_stop ;
input		g_pce_ov ;
input		g_dbg_init ;
input		g_wmr_reset ;
input		si ;
input		siclk ;
input		soclk ;
input		gclk ;
input		l2clk ;
 
wire		net70 ;
wire		scan_wmr ;
wire		scan_pceov ;
wire		scan_stop_l ;
wire		net91 ;
wire		scan_pceov_l ;
wire		scan_dbg ;
wire		net42 ;
wire		l1clk ;
wire		net56 ;
wire		scan_wmr_l ;
wire		scan_stop ;
 
 
cl_sc1_l1hdr_8x x5 (
     .se              (se ),
     .l1clk           (l1clk ),
     .l2clk           (l2clk ),
     .stop            (clk_stop ),
     .pce_ov          (1'b1 ),
     .pce             (1'b1 ) );
cl_dp1_msff_4x xstop_g (
     .q               (net42 ),
     .so              (scan_stop ),
     .soclk           (soclk ),
     .siclk           (siclk ),
     .si              (si ),
     .l1clk           (gclk ),
     .d               (g_clk_stop ) );
cl_dp1_msff_4x xstop_l (
     .q               (clk_stop ),
     .so              (scan_stop_l ),
     .soclk           (soclk ),
     .siclk           (siclk ),
     .si              (scan_stop ),
     .l1clk           (l1clk ),
     .d               (net42 ) );
cl_dp1_msff_4x xdbg_g (
     .q               (net70 ),
     .so              (scan_dbg ),
     .soclk           (soclk ),
     .siclk           (siclk ),
     .si              (scan_wmr_l ),
     .l1clk           (gclk ),
     .d               (g_dbg_init ) );
cl_dp1_msff_4x xdbg_l (
     .q               (dbg_init ),
     .so              (so ),
     .soclk           (soclk ),
     .siclk           (siclk ),
     .si              (scan_dbg ),
     .l1clk           (l1clk ),
     .d               (net70 ) );
cl_dp1_msff_4x xpceov_g (
     .q               (net91 ),
     .so              (scan_pceov ),
     .soclk           (soclk ),
     .siclk           (siclk ),
     .si              (scan_stop_l ),
     .l1clk           (gclk ),
     .d               (g_pce_ov ) );
cl_dp1_msff_4x xpceov_l (
     .q               (pce_ov ),
     .so              (scan_pceov_l ),
     .soclk           (soclk ),
     .siclk           (siclk ),
     .si              (scan_pceov ),
     .l1clk           (l1clk ),
     .d               (net91 ) );
cl_dp1_msff_4x xwmr_g (
     .q               (net56 ),
     .so              (scan_wmr ),
     .soclk           (soclk ),
     .siclk           (siclk ),
     .si              (scan_pceov_l ),
     .l1clk           (gclk ),
     .d               (g_wmr_reset ) );
cl_dp1_msff_4x xwmr_l (
     .q               (wmr_reset ),
     .so              (scan_wmr_l ),
     .soclk           (soclk ),
     .siclk           (siclk ),
     .si              (scan_wmr ),
     .l1clk           (l1clk ),
     .d               (net56 ) );
endmodule
