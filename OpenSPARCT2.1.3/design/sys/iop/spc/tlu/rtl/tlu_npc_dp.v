// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_npc_dp.v
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
module tlu_npc_dp (
  pct0_npc_w, 
  pct1_npc_w, 
  fls1_lsu_inst_w, 
  tlu_npc_w);


input	[47:2]	pct0_npc_w;
input	[47:2]	pct1_npc_w;
input 		fls1_lsu_inst_w;


output	[47:2]	tlu_npc_w;




//////////////////////////////////////////////////////////////////////




tlu_npc_dp_mux_macro__mux_aope__ports_2__stack_48c__width_46 npc_w_mux     (
	.din1	(pct0_npc_w		[47:2]	),
	.din0	(pct1_npc_w		[47:2]	),
	.sel0	(fls1_lsu_inst_w		),
	.dout	(tlu_npc_w		[47:2]	)
);




endmodule




// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_npc_dp_mux_macro__mux_aope__ports_2__stack_48c__width_46 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [45:0] din0;
  input [45:0] din1;
  input sel0;
  output [45:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(46)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[45:0]),
  .in1(din1[45:0]),
.dout(dout[45:0])
);









  



endmodule

