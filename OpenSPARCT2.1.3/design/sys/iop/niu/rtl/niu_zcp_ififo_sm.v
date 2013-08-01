// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_ififo_sm.v
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
 * File Name    : niu_zcp_ififo_sm.v
 * Author Name  : John Lo
 * Description  : niu_zcp_fflp_intf control path
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


module niu_zcp_ififo_sm 
  (/*AUTOARG*/
   // Outputs
   ififo_ren1, ififo_ren, ififo_state, 
   // Inputs
   clk, reset, empty
   );
   
   
   input                      clk;
   input 		      reset;
   input 		      empty;
                              // outputs
   output             	      ififo_ren1;
   output [2:0]       	      ififo_ren;
   output [2:0] 	      ififo_state;

   wire   [2:0] 	      ififo_state;
   reg    [2:0] 	      nx_ififo_state;
   reg                        kickoff_rd;
   parameter   ZERO              = 3'h0,
               ONE               = 3'h1,
	       TWO               = 3'h2,
	       THREE             = 3'h3,
	       FOUR              = 3'h4,
	       FIVE              = 3'h5,
	       SIX               = 3'h6,
	       SEVEN             = 3'h7;

// comb part    
always @ (/*AUTOSENSE*/empty or ififo_state)
 begin
                  nx_ififo_state      = ZERO;
	          kickoff_rd        = 0;
   casex (ififo_state)  // synopsys parallel_case 
     ZERO: if (~empty) 
             begin
                  nx_ififo_state      = ONE;
	          kickoff_rd          = 1;
             end // if (~empty)
           else   nx_ififo_state      = ififo_state; // stay
     ONE:         nx_ififo_state      = TWO;
     TWO:         nx_ififo_state      = THREE;
     THREE:       nx_ififo_state      = FOUR;
     FOUR:        nx_ififo_state      = FIVE;
     FIVE:        nx_ififo_state      = SIX;
     SIX:         nx_ififo_state      = SEVEN;
     SEVEN:       nx_ififo_state      = ZERO;
     default:begin
                  nx_ififo_state      = ZERO;
	          kickoff_rd          = 0;
	          // synopsys translate_off
                  $display("(* ERROR: at sim time = %d, niu_zcp_ififo_sm is in forbidden state *) \n", $time);
	          // synopsys translate_on
             end
   endcase // casex(ififo_state)
 end // always @ (...
   

// seq part 
zcp_RegRst #(3) ififo_state_RegRst(.din(nx_ififo_state[2:0]),.clk(clk),.reset(reset),.qout(ififo_state[2:0]));

// glue logic
zcp_RegRst #(4) ififo_ren_RegRst(.din({4{kickoff_rd}}),.clk(clk),.reset(reset),.qout({ififo_ren1,ififo_ren[2:0]}));


       
endmodule // niu_zcp_ififo_sm

