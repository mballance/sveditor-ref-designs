// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_reset.v
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
 *  niu_tdmc_reset.v
 *
 *  Reset Block, includes LogicVision Reset Gating 
 *
 *  Orignal Author(s):   Rahoul Puri
 *  Modifier(s):	Arvind Srinivasan
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

`timescale 1ns/100ps

module niu_tdmc_reset (
        SysClk,
        niu_reset_l,
	`ifdef NEPTUNE
	`else
	sram_reset,
	`endif
        Reset_L
       );

`include "txc_defines.h"

// Clock & Reset
input   SysClk;
input   niu_reset_l;
`ifdef NEPTUNE
`else
output sram_reset;
`endif

output  Reset_L;

/*--------------------------------------------------------------*/
// Registers & Wires
/*--------------------------------------------------------------*/
   reg 	resetDlyOneCycle_l;
   wire Reset_L;
   wire Reset_L_prebuf;
`ifdef NEPTUNE
`else
   wire sram_reset;
`endif

/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/
assign Reset_L_prebuf = resetDlyOneCycle_l;

 
`ifdef NEPTUNE
      assign Reset_L = Reset_L_prebuf;
`else
   assign Reset_L = Reset_L_prebuf;
   assign sram_reset = ~Reset_L;
`endif
  

/*--------------------------------------------------------------*/
// Control Logic
/*--------------------------------------------------------------*/
 always @ (posedge SysClk)
   begin
     resetDlyOneCycle_l <= #`SD niu_reset_l;
   end
  
endmodule
