// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_eem_dp.v
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
module tlu_eem_dp (
  asi_error_inject, 
  asi_error_mask, 
  asi_mbist_ecc_in, 
  asi_mbist_run, 
  ecc_in, 
  ecc_out);
wire [7:0] error_inject;
wire [7:0] ecc_pre_mux;
wire [7:0] ecc_mux_0;
wire mbist_run_;
wire [7:0] ecc_mux_1;



input		asi_error_inject;
input	[7:0]	asi_error_mask;

input	[7:0]	asi_mbist_ecc_in;
input		asi_mbist_run;

input 	[7:0]	ecc_in;

output	[7:0]	ecc_out;	


//assign wr_ecc[07:00] = 
//	 ((pwr_ecc[07:00] ^ 
//	   ({8 {asi_error_tsau}} & asi_error_mask[07:00])) & 
//	  {8 {~asi_mbist_run}}) | asi_mbist_tsa_ecc_in[07:00];
//

tlu_eem_dp_and_macro__ports_2__stack_8r__width_8 error_inject_and    (
	.din0	({8 {asi_error_inject}}		),
	.din1	(asi_error_mask		[7:0]	),
	.dout	(error_inject		[7:0]	)
);

tlu_eem_dp_xor_macro__ports_2__stack_8r__width_8 ecc_pre_mux_xor    (
	.din0	(ecc_in			[7:0]	),
	.din1	(error_inject		[7:0]	),
	.dout	(ecc_pre_mux		[7:0]	)
);

tlu_eem_dp_inv_macro__stack_8r__width_8 ecc_mux_0_nand   (
	.din	(asi_mbist_ecc_in	[7:0]	),
	.dout	(ecc_mux_0		[7:0]	)
);

tlu_eem_dp_inv_macro__stack_8r__width_1 mbist_run_inv   (
	.din	(asi_mbist_run			),
	.dout	(mbist_run_			)
);

tlu_eem_dp_nand_macro__ports_2__stack_8r__width_8 ecc_mux_1_nand    (
	.din0	(ecc_pre_mux		[7:0]	),
	.din1	({8 {mbist_run_}}		),
	.dout	(ecc_mux_1		[7:0]	)
);

tlu_eem_dp_nand_macro__ports_2__stack_8r__width_8 ecc_mux_nand    (
	.din0	(ecc_mux_0		[7:0]	),
	.din1	(ecc_mux_1		[7:0]	),
	.dout	(ecc_out		[7:0]	)
);

//mux_macro ecc_mux (width=8, ports=2, mux=aope, stack=8r) (
//	  .din0	(asi_mbist_ecc_in	[07:00]	),
//	  .din1	(ecc_pre_mux		[07:00]	),
//	  .sel0	(asi_mbist_run			),
//	  .dout	(ecc_out		[07:00]	)
//);



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

endmodule



//  
//   and macro for ports = 2,3,4
//
//





module tlu_eem_dp_and_macro__ports_2__stack_8r__width_8 (
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
//   xor macro for ports = 2,3
//
//





module tlu_eem_dp_xor_macro__ports_2__stack_8r__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;





xor2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);








endmodule





//
//   invert macro
//
//





module tlu_eem_dp_inv_macro__stack_8r__width_8 (
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
//   invert macro
//
//





module tlu_eem_dp_inv_macro__stack_8r__width_1 (
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





module tlu_eem_dp_nand_macro__ports_2__stack_8r__width_8 (
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




