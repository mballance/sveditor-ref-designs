// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_debug.v
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
 *  niu_pio_debug..v
 *
 *  NIU TDMC Top Level Debug Module
 *
 *  Orignal Author(s):   Maya Suresh
 *  Modifier(s):
 *  Project(s):          Neptune/Niagara 2
 *
 *  Copyright (c) 2004   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/

module niu_pio_debug( 
        SysClk,
        Reset_L,
        TrainingVector,
        pio_debug_port,
        rd_ptr,
        wr_ptr,
        pio_rw_state,
        accepted_state,
        ig_state,
        debug_select
       );

// Global Signals
input         SysClk;
input         Reset_L;
input [4:0]   rd_ptr ;
input [4:0]   wr_ptr ;
input [2:0]   pio_rw_state ;
input [1:0]   accepted_state ;
input [2:0]   ig_state ;

// To Debug Module
output [31:0] pio_debug_port;

reg    [31:0] pio_debug_port;

// From Control Regs
input  [5:0]  debug_select ;
input  [31:0] TrainingVector ;

/*--------------------------------------------------------------*/
// Debug Block
/*--------------------------------------------------------------*/

always @(posedge SysClk)
  if (!Reset_L) pio_debug_port  <= 32'h0;
  else
   case(debug_select)
     6'h0: pio_debug_port <= {22'b0,rd_ptr[4:0],wr_ptr[4:0]};
     6'h1: pio_debug_port <= {24'b0,ig_state[2:0],pio_rw_state[2:0],accepted_state[1:0]};
     6'h2: pio_debug_port <= ~pio_debug_port;
     6'h3: pio_debug_port <= TrainingVector;
  
  default: pio_debug_port <= 32'h0;

  endcase

endmodule
