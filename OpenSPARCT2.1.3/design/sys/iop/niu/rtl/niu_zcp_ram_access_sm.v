// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_ram_access_sm.v
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
 * File Name    : niu_zcp_ram_access_sm.v
 * Author Name  : John Lo
 * Description  : buffer response state machine
 *                for unloading response fifo data.
 * 
 * Parent Module: niu_zcp_rsp_intf
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 7/22/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 * Design Notes: 
 * 
 **************************************************************/


module niu_zcp_ram_access_sm 
(/*AUTOARG*/
   // Outputs
   ram_ren, ram_wen, slv_request, ld_ram2reg, ram_access_state, 
   // Inputs
   clk, reset10, ld_ram_addr_trail, slv_accepted, rw
   );
   
   input                      clk;
   input 		      reset10;
   input 		      ld_ram_addr_trail;
   input 		      slv_accepted;
   input 		      rw;
   output 		      ram_ren;
   output 		      ram_wen;
   output		      slv_request;
   output 		      ld_ram2reg;
   output [2:0] 	      ram_access_state;


   wire 		      slv_accepted;
   wire [2:0] 		      ram_access_state;
   reg  [2:0] 		      nx_ram_access_state;
   reg 			      slv_request;
   reg 			      ram_ren;
   reg 			      ram_wen;
   reg 			      p1_ld_ram2reg;

   parameter   IDLE              = 3'd0,
	       ARB               = 3'd1,
	       DLY1              = 3'd2,
	       D_RDY             = 3'd3, // data ready
	       P_CHK             = 3'd4; // parity check and latch into reg
   

// comb part   
always @ (/*AUTOSENSE*/ld_ram_addr_trail or ram_access_state or rw
	  or slv_accepted)
begin
                  nx_ram_access_state        = IDLE;
                  slv_request                = 0;
	          ram_ren                    = 0;
	          ram_wen                    = 0;
                  p1_ld_ram2reg              = 0;

   casex (ram_access_state) // synopsys parallel_case full_case infer_mux
   IDLE:    if (ld_ram_addr_trail)
                  nx_ram_access_state        = ARB;
            else  nx_ram_access_state        = ram_access_state; // stay

   ARB:   begin
                  slv_request                = 1;
            if (~slv_accepted)
                  nx_ram_access_state        = ram_access_state; // stay
            else  begin  
                  nx_ram_access_state        = DLY1;
	          ram_ren                    =  rw; // ram_ren is a pulse
	          ram_wen                    = ~rw; // ram_wen is a pulse
	          end
          end // case: ARB
   DLY1:  begin
                  nx_ram_access_state        = D_RDY; // register the ram_ren and ram_wen.
          end
     
   D_RDY: begin  // latch RAM output data time -> ld_ram_rdata == 1
                  nx_ram_access_state        = P_CHK;
                  p1_ld_ram2reg              = 1;
	  end

   P_CHK: begin  // parity check and latch result into Reg. -> ld_ram2reg == 1
                  nx_ram_access_state        = IDLE;
	  end

   default:
          begin
                  nx_ram_access_state        = IDLE;
	          // synopsys translate_off
	          // verilint translate off
                  $display("(* ERROR: at sim time = %d, niu_zcp_ram_access_sm is in forbidden state *) \n", $time);
	          // verilint translate on
	          // synopsys translate_on
          end
   endcase // casex(ram_access_state)
end // always @ (...
   

// seq part 
zcp_RegRst #(3) ram_access_state_RegRst(.din(nx_ram_access_state),
                              .clk(clk),
                              .reset(reset10),
                              .qout(ram_access_state));

zcp_RegDff #(1) ld_ram2reg_RegDff  (.din(p1_ld_ram2reg),  .clk(clk),.qout(ld_ram2reg));    // in P_CHK state
    
endmodule // niu_zcp_ram_access_sm

