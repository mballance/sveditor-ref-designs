// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cmp.vh
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
`ifdef INC_CMP_DEFINE

`else

`define INC_CMP_DEFINE



// common defines
`include "defines.vh"

`define BAD_END bad_end

//`define    CORE_0

`define    PROBES0       tb_top.intf0
`define    PROBES1       tb_top.intf1
`define    PROBES2       tb_top.intf2
`define    PROBES3       tb_top.intf3
`define    PROBES4       tb_top.intf4
`define    PROBES5       tb_top.intf5
`define    PROBES6       tb_top.intf6
`define    PROBES7       tb_top.intf7

`define    SPC0          tb_top.cpu.spc0
`define    SPC1          tb_top.cpu.spc1
`define    SPC2          tb_top.cpu.spc2
`define    SPC3          tb_top.cpu.spc3
`define    SPC4          tb_top.cpu.spc4
`define    SPC5          tb_top.cpu.spc5
`define    SPC6          tb_top.cpu.spc6
`define    SPC7          tb_top.cpu.spc7

`endif
//----------------------------------------------------------
// END OF FILE
//----------------------------------------------------------
