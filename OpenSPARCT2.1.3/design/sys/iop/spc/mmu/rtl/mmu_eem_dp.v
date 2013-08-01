// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_eem_dp.v
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
module mmu_eem_dp (
  asi_error_inject, 
  asi_error_mask, 
  asi_mbist_ecc_in, 
  asi_mbist_run, 
  ecc_in, 
  ecc_out);
wire mbist_run_;
wire [7:0] pre_error_inject_;
wire [7:0] pre_error_inject;
wire [7:0] error_inject;
wire [7:0] error_inject_;
wire [7:0] ecc_in_;
wire [7:0] ecc_mux_0;
wire [7:0] ecc_mux_1;
wire [7:0] ecc_mux_2;



input		asi_error_inject;
input	[7:0]	asi_error_mask;

input	[7:0]	asi_mbist_ecc_in;
input		asi_mbist_run;

input 	[7:0]	ecc_in;

output	[7:0]	ecc_out;	


mmu_eem_dp_inv_macro__stack_8r__width_1 mbist_run_b_inv   (
	.din	(asi_mbist_run			),
	.dout	(mbist_run_			)
);

mmu_eem_dp_nand_macro__ports_2__stack_8r__width_8 pre_error_inject_b_and    (
	.din0	({8 {asi_error_inject}}		),
	.din1	(asi_error_mask		[7:0]	),
	.dout	(pre_error_inject_	[7:0]	)
);

mmu_eem_dp_inv_macro__stack_8r__width_8 pre_error_inject_inv   (
	.din	(pre_error_inject_	[7:0]	),
	.dout	(pre_error_inject	[7:0]	)
);

mmu_eem_dp_and_macro__stack_8r__width_8 error_inject_and   (
	.din0	(pre_error_inject	[7:0]	),
	.din1	({8 {mbist_run_}}		),
	.dout	(error_inject		[7:0]	)
);

mmu_eem_dp_and_macro__stack_8r__width_8 error_inject_b_and   (
	.din0	(pre_error_inject_	[7:0]	),
	.din1	({8 {mbist_run_}}		),
	.dout	(error_inject_		[7:0]	)
);

mmu_eem_dp_inv_macro__stack_8r__width_8 ecc_in_b_inv   (
	.din	(ecc_in			[7:0]	),
	.dout	(ecc_in_		[7:0]	)
);

mmu_eem_dp_nand_macro__ports_2__stack_8r__width_8 ecc_mux_0_nand    (
	.din0	(ecc_in			[7:0]	),
	.din1	(error_inject_		[7:0]	),
	.dout	(ecc_mux_0		[7:0]	)
);

mmu_eem_dp_nand_macro__ports_2__stack_8r__width_8 ecc_mux_1_nand    (
	.din0	(ecc_in_		[7:0]	),
	.din1	(error_inject		[7:0]	),
	.dout	(ecc_mux_1		[7:0]	)
);

mmu_eem_dp_nand_macro__ports_2__stack_8r__width_8 ecc_mux_2_nand    (
	.din0	(asi_mbist_ecc_in	[7:0]	),
	.din1	({8 {asi_mbist_run}}		),
	.dout	(ecc_mux_2		[7:0]	)
);

mmu_eem_dp_nand_macro__ports_3__stack_8r__width_8 ecc_mux_nand    (
	.din0	(ecc_mux_0		[7:0]	),
	.din1	(ecc_mux_1		[7:0]	),
	.din2	(ecc_mux_2		[7:0]	),
	.dout	(ecc_out		[7:0]	)
);



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

endmodule



//
//   invert macro
//
//





module mmu_eem_dp_inv_macro__stack_8r__width_1 (
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





module mmu_eem_dp_nand_macro__ports_2__stack_8r__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






nand2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule





//
//   invert macro
//
//





module mmu_eem_dp_inv_macro__stack_8r__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






inv #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mmu_eem_dp_and_macro__stack_8r__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






and2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module mmu_eem_dp_nand_macro__ports_3__stack_8r__width_8 (
  din0, 
  din1, 
  din2, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  output [7:0] dout;






nand3 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.in2(din2[7:0]),
.out(dout[7:0])
);









endmodule




