// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_accepted_sm.v
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

/*************************************************************************
 *
 * File Name    : niu_pio_accepted_sm.v
 * Author Name  : John Lo
 * Description  : It contains niu pio interface, interrupt controller,
 *                UCB for N2. 
 * Parent Module: niu
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/08/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module niu_pio_accepted_sm (/*AUTOARG*/
   // Outputs
   accepted, accepted_state, 
   // Inputs
   clk, reset, full, ucb_rd_req, ucb_wr_req
   );

   input 		      clk;
   input 		      reset;
   input 		      full;
   input 		      ucb_rd_req;
   input 		      ucb_wr_req;

   output 		      accepted;
   output [1:0]		      accepted_state;

   reg 	[1:0]		      nx_accepted_state;
   reg 			      accepted;
   
   parameter 		      IDLE   = 2'd0;
   parameter 		      ACCEPT = 2'd1;
   parameter 		      DLY1   = 2'd2;
   parameter 		      DLY2   = 2'd3;

// combination logic
always @ (/*AUTOSENSE*/accepted_state or full or ucb_rd_req
	  or ucb_wr_req)
  begin
                  nx_accepted_state = IDLE;
		  accepted          = 0;
     case (accepted_state) // synopsys full_case parallel_case
       IDLE:   begin
                 if ((~full) & (ucb_rd_req | ucb_wr_req))
                      nx_accepted_state = ACCEPT;
                 else nx_accepted_state = accepted_state; // stay
	       end

       ACCEPT: begin
                  nx_accepted_state = DLY1;
		  accepted          = 1;

	       end
       DLY1:      nx_accepted_state = DLY2;  

       DLY2:      nx_accepted_state = IDLE;  

       default:begin
                  nx_accepted_state = IDLE;
		  accepted          = 0;
	       end
     endcase
  end

// seq part
dffr #(2) accepted_state_dffr(.d(nx_accepted_state[1:0]),.reset(reset),.clk(clk),.q(accepted_state[1:0]));

   
endmodule // niu_pio_accepted_sm


