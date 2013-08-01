// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_ig_sm.v
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
 * File Name    : niu_pio_ig_sm.v
 * Author Name  : John Lo
 * Description  : Interrupt Generator. 
 *                This state machine check the group number to generate
 *                interrupt.
 *                It then reset the arm bit and timer.
 *  
 * Parent Module: niu_pio_ic
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/19/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module niu_pio_ig_sm (/*AUTOARG*/
   // Outputs
   latch_req_mux_out, latch_result_group, latch_nx_pri_group, 
   intr_valid, intr_invalid, rst_at, ig_state, 
   activate_ig_sm_rel_latched,
   // Inputs
   clk, reset, ibusy, activate_ig_sm, activate_ig_sm_rel
   );
   input 		      clk;
   input 		      reset;
   input 		      ibusy;
   input 		      activate_ig_sm;
   input 		      activate_ig_sm_rel;
                              // outputs
   output 		      latch_req_mux_out;
   output 		      latch_result_group;
   output 		      latch_nx_pri_group;
   output 		      intr_valid;
   output 		      intr_invalid;
   output 		      rst_at;
   output [2:0] 	      ig_state;
   output                     activate_ig_sm_rel_latched ;

   wire [2:0] 		      ig_state;
   reg  		      intr_vld_ip;    // (ip - in progress)
   reg  		      intr_invld_ip;  // (ip - in progress)
   reg          intr_vld_ip_del ; 
   reg          intr_invld_ip_del ;

   reg [2:0] 		      nx_ig_state;
   reg 			      latch_req_mux_out;
   reg 			      latch_result_group;
   reg 			      latch_nx_pri_group;
   reg 			      intr_valid;
   reg 			      intr_invalid;
   
   parameter 		      IDLE              = 3'h0;
   parameter 		      LCH_REQ_MUX       = 3'h1;
   parameter 		      LCH_RESULT_GROUP  = 3'h2;
   parameter 		      LCH_NX_PRI        = 3'h3;
   parameter 		      WAIT4BUSY         = 3'h4;
   parameter 		      DLY1              = 3'h5;
   
reg 			      activate_ig_sm_rel_latched ;

always @(posedge clk)
begin
 if (reset)
     activate_ig_sm_rel_latched   <= 1'b0 ;
 else
  begin
    if (activate_ig_sm_rel)
      activate_ig_sm_rel_latched <= 1'b1 ;
    else
     if (intr_invalid)
      activate_ig_sm_rel_latched <= 1'b0 ;
  end
end

// comb part   
always @ (/*AUTOSENSE*/activate_ig_sm or ibusy or ig_state 
          or activate_ig_sm_rel or activate_ig_sm_rel_latched
          or intr_invld_ip_del or intr_vld_ip_del)
begin
   nx_ig_state          = IDLE;
   latch_req_mux_out    = 0;
   latch_result_group   = 0;
   latch_nx_pri_group   = 0;
   intr_valid           = 0;
   intr_invalid         = 0;
   intr_vld_ip          = 0 ;
   intr_invld_ip        = 0 ;
   case (ig_state) // synopsys parallel_case full_case
   IDLE:
       if (activate_ig_sm || activate_ig_sm_rel || activate_ig_sm_rel_latched)
        begin
          nx_ig_state          = LCH_REQ_MUX;
          if (activate_ig_sm)
           intr_vld_ip         = 1 ;
          else
          if (activate_ig_sm_rel_latched || activate_ig_sm_rel)
           intr_invld_ip       = 1 ;
        end
       else
         begin
          nx_ig_state          = ig_state;// stay&wait
         end

   LCH_REQ_MUX:
       begin
             nx_ig_state          = LCH_RESULT_GROUP;
             latch_req_mux_out    = 1;
       end
     
  LCH_RESULT_GROUP:
       begin
	     nx_ig_state          = LCH_NX_PRI;
             latch_result_group   = 1;
       end
     
   LCH_NX_PRI:
       begin
             nx_ig_state          = WAIT4BUSY;
             latch_nx_pri_group   = 1;
       end

   WAIT4BUSY:
       if (ibusy)
             nx_ig_state          = ig_state;// stay&wait

       else 
           begin
// geo:      if (activate_ig_sm && !intr_invld_ip_del)
             if (                  !intr_invld_ip_del)
              begin
               intr_valid          = 1;
               nx_ig_state         = DLY1;
              end
             else 
              if (activate_ig_sm_rel_latched && !intr_vld_ip_del)
              begin
               intr_invalid       = 1;
               nx_ig_state        = DLY1;
              end
	    end

   DLY1:     
       begin
          nx_ig_state          = IDLE;
       end
       
   default:
     begin
	          nx_ig_state     = IDLE;
     end
   endcase // casex(ig_state)
end
   
// synopsys translate_off
  always @(posedge clk) begin
    if ( (ig_state==WAIT4BUSY) && !ibusy && !activate_ig_sm && !intr_invld_ip_del )
      $display ("Warning @time=%d_ns, hit niu_pio_ig_sm looping condition, bugID_119020, ig_state=%h,ibusy=%h,activate_ig_sm=%h,intr_invld_ip_del=%h \n",
                          $stime, ig_state, ibusy, activate_ig_sm, intr_invld_ip_del);
  end
// synopsys translate_on


// seq part 
dffr #(3) ig_state_dffr(.clk(clk),
                        .reset(reset),
                        .d(nx_ig_state),
                        .q(ig_state));

df1 #(1) rst_at_dffr(.clk(clk),
                        .d(intr_valid),
                        .q(rst_at));


always @(posedge clk)
begin
 if (reset)
  begin
          intr_vld_ip_del          <= 1'b0 ;
          intr_invld_ip_del        <= 1'b0 ;
  end
 else
  begin
     if(intr_vld_ip)
          intr_vld_ip_del          <= 1'b1 ;
     else
      if(intr_valid)
          intr_vld_ip_del          <= 1'b0 ;

     if(intr_invld_ip)
          intr_invld_ip_del        <= 1'b1 ;
     else
      if(intr_invalid)
          intr_invld_ip_del        <= 1'b0 ;
  end
end

   
endmodule // niu_pio_ig_sm
