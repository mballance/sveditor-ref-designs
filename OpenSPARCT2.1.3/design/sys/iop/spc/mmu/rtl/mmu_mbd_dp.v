// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_mbd_dp.v
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
module mmu_mbd_dp (
  asi_mbd_scp_data, 
  asi_compare_data, 
  asi_mbd_sel_scp, 
  ase_mbd_mbist_data, 
  mbd_compare);
wire [31:0] read_data;



input	[31:0]	asi_mbd_scp_data;
input	[7:0]	asi_compare_data;
input 		asi_mbd_sel_scp;

input	[31:0]	ase_mbd_mbist_data;	// MBIST

output		mbd_compare;




//////////////////////////////////////////////////////////////////////



mmu_mbd_dp_mux_macro__mux_aope__ports_2__stack_32r__width_32 read_data_mux     (
	.din0	(asi_mbd_scp_data	[31:0]	),
	.din1	(ase_mbd_mbist_data	[31:0]	),
	.sel0	(asi_mbd_sel_scp		),
	.dout	(read_data		[31:0]	)
);

mmu_mbd_dp_cmp_macro__width_32 mbist_cmp  (
	.din0	(read_data		[31:0]	),
	.din1	({4 {asi_compare_data	[7:0]}}),
	.dout	(mbd_compare			)

);





endmodule




// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_mbd_dp_mux_macro__mux_aope__ports_2__stack_32r__width_32 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;
  output [31:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mmu_mbd_dp_cmp_macro__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule




