// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: L2_RST.v
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
module L2_RST();

//parameter DELAY = 15744276;
parameter DELAY = 12638748;

//--------------------------------------------------------------------------------------
// Enable/Disable support : MAQ
//--------------------------------------------------------------------------------------

wire L2_INT_RST = `TOP.flush_reset_complete;

// MAQ :reg L2_INT_RST;
//--------------------------------------------------------------------------------------
wire [23:0] err_cnt,cpx_pkt,desr_cnt;

l2err_ccm      l2err_ccm(L2_INT_RST,err_cnt); // Data Array CE Err injector, only bank0
l2err_checker  l2err_checker(L2_INT_RST,cpx_pkt,desr_cnt);
l2err_scrbrd   l2err_scrbrd(cpx_pkt,desr_cnt,err_cnt); 
TagArray       TagArray(L2_INT_RST); //TAG Array CE err injector
vuaderr        vuaderr(L2_INT_RST); // VUAD CE Err injector
l2ue_errinj    l2ue_errinj(L2_INT_RST,err_cnt); // UE Err Injector. all banks


// MAQ :
// MAQ :initial
// MAQ :begin
// MAQ :
// MAQ :L2_INT_RST = 0;
// MAQ :forever #(DELAY)  L2_INT_RST = 1;
// MAQ :
// MAQ :end


endmodule

