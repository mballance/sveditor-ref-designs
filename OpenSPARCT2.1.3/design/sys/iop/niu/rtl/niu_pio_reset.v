// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_reset.v
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
/*********************************************************************
 *
 *  niu_pio_reset.v
 *
 *  Reset Block, includes LogicVision Reset Gating
 *
 *  Orignal Author(s):   Rahoul Puri
 *  Modifier(s):         Maya Suresh
 *  Project(s):          Neptune/Niagara 2
 *
 *  Copyright (c) 2003   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/

module niu_pio_reset (
        SysClk,
        niu_reset_l,
        FUNC_MODE,
        Reset_L
       );

// Clock & Reset
input   SysClk;
input   niu_reset_l;
input   FUNC_MODE;

output  Reset_L;

/*--------------------------------------------------------------*/
// Registers & Wires
/*--------------------------------------------------------------*/
wire   iReset_L;

reg    resetDlyOneCycle_l;

/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/
assign iReset_L = ((resetDlyOneCycle_l & FUNC_MODE) | ~FUNC_MODE);

/*--------------------------------------------------------------*/
// Control Logic
/*--------------------------------------------------------------*/
 always @ (posedge SysClk)
   begin
     resetDlyOneCycle_l <= niu_reset_l;
   end

`ifdef NEPTUNE
   RTS_ROOT_BUF pio_reset_CTS_ROOT  (.Z(Reset_L)  ,.A(iReset_L));
`else
   assign Reset_L = iReset_L;

`endif


endmodule
