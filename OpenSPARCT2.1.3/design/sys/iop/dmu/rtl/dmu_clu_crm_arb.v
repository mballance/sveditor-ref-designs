// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_crm_arb.v
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
module dmu_clu_crm_arb 
  (
   // clock/reset
   clk,
   rst_l,
   
   // ctl port
   grant,
   req,
   grnt_lck
   );
  
  // synopsys sync_set_reset "rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  parameter N = 3;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // Arbiter Control Port
  // --------------------------------------------------------
  
  output [(N-1):0] grant;
  input  [(N-1):0] req;
  input            grnt_lck;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  reg [(N-1):0] pointer_reg;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  wire [(N-1):0] req_masked;
  wire [(N-1):0] mask_higher_pri_reqs;
  wire [(N-1):0] grant_masked;
  wire [(N-1):0] unmask_higher_pri_reqs;
  wire [(N-1):0] grant_unmasked;
  wire           no_req_masked;
  wire           mask_ptr_sel;
  wire           unmask_ptr_sel;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  /* 0in arb
     -req req[0] req[1] req[2]
     -gnt (grant[0] & ~grnt_lck) (grant[1] & ~grnt_lck) (grant[2] & ~grnt_lck)
     -round_robin
     -known_grant
  */
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Mask_Expand Round-Robin Arbiter
  // --------------------------------------------------------
  
  // Simple priority arbitration for masked portion
  assign req_masked = req & pointer_reg;
  assign mask_higher_pri_reqs[N-1:1] = (mask_higher_pri_reqs[N-2: 0] |
					req_masked[N-2:0]);
  assign mask_higher_pri_reqs[0] = 1'b0;
  assign grant_masked[N-1:0] = (req_masked[N-1:0] &
				~mask_higher_pri_reqs[N-1:0]);
  
  // Simple priority arbitration for unmasked portion
  assign unmask_higher_pri_reqs[N-1:1] = (unmask_higher_pri_reqs[N-2:0] |
					  req[N-2:0]);
  assign unmask_higher_pri_reqs[0] = 1'b0;
  assign grant_unmasked[N-1:0] = req[N-1:0] & ~unmask_higher_pri_reqs[N-1:0];
  
  // Use grant_masked if there is any there, otherwise use grant_unmasked
  assign no_req_masked = ~(|req_masked);
  assign grant = ({N{no_req_masked}} & grant_unmasked) | grant_masked;
  
  // Generate arbiter pointer update
  assign mask_ptr_sel = |req_masked & ~grnt_lck;
  assign unmask_ptr_sel = |req & ~grnt_lck;
  
  // Pointer update : only update if there's a req
  always @ (posedge clk)
    if (~rst_l)
      pointer_reg <= {N{1'b1}};
    else if (mask_ptr_sel) // select if masked arbiter used
      pointer_reg <= mask_higher_pri_reqs;
    else if (unmask_ptr_sel) // select if unmasked arbiter used
      pointer_reg <= unmask_higher_pri_reqs;
  
endmodule // dmu_clu_crm_arb
