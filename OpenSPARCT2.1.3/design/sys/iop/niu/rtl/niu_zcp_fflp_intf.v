// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_fflp_intf.v
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
/*%W%	%G%*/

/***************************************************************
 *
 * File Name    : niu_zcp_fflp_intf.v
 * Author Name  : John Lo
 * Description  : niu_zcp_fflp_intf
 * Parent Module:
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 3/18/05
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 * Design Notes: When adding more CAL states DON'T forget to 
 *               modify tt_atomic_op. 
 *              
 * 
 **************************************************************/


module niu_zcp_fflp_intf 
  (/*AUTOARG*/
   // Outputs
   ififo_ren, ififo_dout, ififo_overrun, ififo_state, 
   // Inputs
   clk, fflp_reset, fflp_zcp_wr, fflp_zcp_data
   );
   
   
   input                      clk;
   input  [5:0]		      fflp_reset;
   input  [4:0]		      fflp_zcp_wr;
   input  [`IFIFO_W_R]	      fflp_zcp_data;// 27 bytes = 216 bits
                              // outputs
   output [2:0]		      ififo_ren;
   output [`IFIFO_W_R] 	      ififo_dout;
   output 		      ififo_overrun;
   output [2:0] 	      ififo_state;

   wire   [2:0]		      ififo_ren;
   wire   [5:0]		      reset = fflp_reset;
   
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			empty;			// From niu_zcp_fflp_ififo of niu_zcp_ififo.v
wire			ififo_ren1;		// From niu_zcp_ififo_sm of niu_zcp_ififo_sm.v
// End of automatics

niu_zcp_ififo niu_zcp_fflp_ififo
  (/*AUTOINST*/
   // Outputs
   .ififo_dout				(ififo_dout[`IFIFO_W_R]),
   .empty				(empty),
   .ififo_overrun			(ififo_overrun),
   // Inputs
   .clk					(clk),
   .reset				(reset[4:0]),
   .ififo_ren1				(ififo_ren1),
   .fflp_zcp_wr				(fflp_zcp_wr[4:0]),
   .fflp_zcp_data			(fflp_zcp_data[`IFIFO_W_R]));
   
niu_zcp_ififo_sm niu_zcp_ififo_sm
  (/*AUTOINST*/
   // Outputs
   .ififo_ren1				(ififo_ren1),
   .ififo_ren				(ififo_ren[2:0]),
   .ififo_state				(ififo_state[2:0]),
   // Inputs
   .clk					(clk),
   .reset				(reset[5]),
   .empty				(empty));
   

       
endmodule // niu_zcp_fflp_intf

