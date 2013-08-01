// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_scheduler64.v
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
 * File Name    : niu_pio_scheduler64.v
 * Author Name  : John Lo
 * Description  : This file is copy from Vega ibtp scheduler64.v.
 *                It includes three major part of 
 *                fuctions:
 *                1. req_mux which is composed from req_mux.c code.
 *                2. daisy_chain which is a priority 
 *                   daisy chain nor gates.
 *                   It is composed from daisy_chain.c code.
 *                3. encoder which is composed from encoder.c code.
 * Parent Module: niu_pio_ic
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 6/17/02
 *
 * Copyright (c) 2008, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: There is a multicycle path of 2
 *                  from gnt[63:0] to result_qpn[5:0].
 *
 * 
 **************************************************************/

module niu_pio_scheduler64 (
clk,
reset,
intr_req_group,
intr_rel_group,
activate_ig_sm,
activate_ig_sm_rel,
activate_ig_sm_rel_latched,
latch_req_mux_out,
latch_result_group,
latch_nx_pri_group,
// output
group
		  );
   
   input                      clk;
   input 		      reset;
   input [63:0] 	      intr_req_group;
   input [63:0] 	      intr_rel_group;
   input 		      latch_req_mux_out;
   input 		      activate_ig_sm;
   input 		      activate_ig_sm_rel;
   input 		      activate_ig_sm_rel_latched;
   input 		      latch_result_group;
   input 		      latch_nx_pri_group;
                              // output
   output [5:0] 	      group;
    
   reg [63:0] 		      del_intr_rel_group;

   wire [63:0] 		      intr_req_group;
   wire [63:0] 		      mux_input;
   wire [63:0] 		      req_mux_dout;
   wire [63:0] 		      req_mux_dout_reg;
   wire [63:0] 		      gnt;
// wire [63:0] 		      gnt_reg;
   wire [5:0] 		      gnt_num;
   wire [5:0] 		      group;
   wire [5:0] 		      result_group;
   wire [5:0] 		      pri_group_1;
   wire [5:0] 		      pri_group_2;
   wire [5:0] 		      nx_pri_group;
   
always @ (posedge clk)
 begin
  if (reset)
   del_intr_rel_group <= 64'b0 ;
  else
   begin
    if (activate_ig_sm_rel)
     del_intr_rel_group <= intr_rel_group ;
    else
     del_intr_rel_group <= del_intr_rel_group;
    end
 end

 assign mux_input[63:0] = ((activate_ig_sm)?intr_req_group:((activate_ig_sm_rel_latched)?del_intr_rel_group:64'b0)) ;

reg [63:0] mux_input_del ;
reg        latch_req_mux_out_del ;
reg        latch_result_group_del ;
reg        latch_nx_pri_group_del ;

always @ (posedge clk)
 begin
  if (reset)
   begin
    mux_input_del           <= 64'b0 ;
    latch_req_mux_out_del   <= 1'b0 ;
    latch_result_group_del  <= 1'b0 ;
    latch_nx_pri_group_del  <= 1'b0 ;
   end
  else
   begin
    mux_input_del           <= mux_input ;
    latch_req_mux_out_del   <= latch_req_mux_out ;
    latch_result_group_del  <= latch_result_group ;
    latch_nx_pri_group_del  <= latch_nx_pri_group ;
   end
 end

niu_req_mux req_mux(.req_mux_din(mux_input_del),
                    .sel_1(pri_group_1),
                    .sel_2(pri_group_2),
                    .req_mux_dout(req_mux_dout));

dffre #(64) req_mux_dout_reg_dffre(
                .clk(clk),
                .reset(reset),
                .en(latch_req_mux_out_del),
                .d(req_mux_dout),
                .q(req_mux_dout_reg));

niu_daisy_chain daisy_chain(.req_mux_dout(req_mux_dout_reg),
                        .gnt(gnt)); 

niu_gnt_encoder gnt_encoder(.gnt(gnt),.gnt_num(gnt_num)); 


   assign result_group = gnt_num + pri_group_1;
   
dffre #(6) group_dffre (.clk(clk),.reset(reset),
               .en(latch_result_group_del),
               .d(result_group),
               .q(group));

   assign nx_pri_group = group + 1;

dffre #(6) pri_group_dffre_1(.clk(clk),.reset(reset),
                             .en(latch_nx_pri_group_del),
                             .d(nx_pri_group),
                             .q(pri_group_1));
   
dffre #(6) pri_group_dffre_2 (.clk(clk),.reset(reset),
                             .en(latch_nx_pri_group_del),
                             .d(nx_pri_group),
                             .q(pri_group_2));

endmodule // niu_pio_scheduler64
