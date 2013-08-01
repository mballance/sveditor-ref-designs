// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_mem_dp.v
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
module mmu_mem_dp (
  asi_error_inject, 
  asi_error_mask, 
  asi_mbist_ecc, 
  asi_mbist_run, 
  parity_in, 
  parity_out);
wire mbist_run_;
wire pre_error_inject_;
wire pre_error_inject;
wire error_inject;
wire error_inject_;
wire parity_in_;
wire parity_mux_0;
wire parity_mux_1;
wire parity_mux_2;



input		asi_error_inject;
input		asi_error_mask;

input		asi_mbist_ecc;
input		asi_mbist_run;

input 		parity_in;

output		parity_out;	



mmu_mem_dp_inv_macro__width_1 mbist_run_b_inv  (
	.din	(asi_mbist_run			),
	.dout	(mbist_run_			)
);

mmu_mem_dp_nand_macro__ports_2__width_1 pre_error_inject_b_nand   (
	.din0	({1 {asi_error_inject}}		),
	.din1	(asi_error_mask			),
	.dout	(pre_error_inject_		)
);

mmu_mem_dp_inv_macro__width_1 pre_error_inject_inv  (
	.din	(pre_error_inject_		),
	.dout	(pre_error_inject		)
);

mmu_mem_dp_and_macro__width_1 error_inject_and  (
	.din0	(pre_error_inject		),
	.din1	({1 {mbist_run_}}		),
	.dout	(error_inject			)
);

mmu_mem_dp_and_macro__width_1 error_inject_b_and  (
	.din0	(pre_error_inject_		),
	.din1	({1 {mbist_run_}}		),
	.dout	(error_inject_			)
);

mmu_mem_dp_inv_macro__width_1 parity_in_b_inv  (
	.din	(parity_in			),
	.dout	(parity_in_			)
);

mmu_mem_dp_nand_macro__ports_2__width_1 parity_mux_0_nand   (
	.din0	(asi_mbist_ecc			),
	.din1	(asi_mbist_run			),
	.dout	(parity_mux_0			)
);

mmu_mem_dp_nand_macro__ports_2__width_1 parity_mux_1_nand   (
	.din0	(parity_in			),
	.din1	(error_inject_			),
	.dout	(parity_mux_1			)
);

mmu_mem_dp_nand_macro__ports_2__width_1 parity_mux_2_nand   (
	.din0	(parity_in_			),
	.din1	(error_inject			),
	.dout	(parity_mux_2			)
);

mmu_mem_dp_nand_macro__ports_3__width_1 parity_mux_nand   (
	.din0	(parity_mux_0			),
	.din1	(parity_mux_1			),
	.din2	(parity_mux_2			),
	.dout	(parity_out			)
);




supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

endmodule



//
//   invert macro
//
//





module mmu_mem_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module mmu_mem_dp_nand_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mmu_mem_dp_and_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module mmu_mem_dp_nand_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nand3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule




