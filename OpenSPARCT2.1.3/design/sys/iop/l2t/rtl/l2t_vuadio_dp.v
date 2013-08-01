// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_vuadio_dp.v
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
module l2t_vuadio_dp (
  data_out_col1, 
  data_out_col2, 
  array_data_in, 
  vuadio_data_out_io, 
  vuadio_array_data_in_buf, 
  vuad_mux_sel); 
 
 
input	[38:0]	 data_out_col1; // from  vuadcl
input	[38:0]	 data_out_col2; // from  vuadcl
 
input	[38:0]	 array_data_in; 
 
output	[38:0]	 vuadio_data_out_io ; // output to vuad dp. 
output	[38:0]	 vuadio_array_data_in_buf; 
 
input	[1:0]	 vuad_mux_sel;  // 2-1 mux output to vuad dp. 
 
 
// assign	vuadio_array_data_in_buf = array_data_in ; 

l2t_vuadio_dp_buff_macro__dbuff_32x__stack_40c__width_39 vuadio_array_buffer  
	(
	.dout	(vuadio_array_data_in_buf[38:0]),
	.din	(array_data_in[38:0])
	);

//mux_macro mux_vuadio_data_out_io (width=39,ports=2,mux=aonpe,stack=39c,dmux=8x)
//		(
//		.dout	(vuadio_data_out_io[38:0]), 
//                .din0	(data_out_col1[38:0]), 
//                .din1	(data_out_col2[38:0]), 
//                .sel0	(vuad_mux_sel[0]), 
//                .sel1	(vuad_mux_sel[1]) 
//		); 
//

l2t_vuadio_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_39c__width_39 mux_vuadio_data_out_io 
                (
                .dout   (vuadio_data_out_io[38:0]), 
                .din0   (data_out_col1[38:0]), 
                .din1   (data_out_col2[38:0]), 
                .sel0   (vuad_mux_sel[0])
                );
 
endmodule 


//
//   buff macro
//
//





module l2t_vuadio_dp_buff_macro__dbuff_32x__stack_40c__width_39 (
  din, 
  dout);
  input [38:0] din;
  output [38:0] dout;






buff #(39)  d0_0 (
.in(din[38:0]),
.out(dout[38:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_vuadio_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_39c__width_39 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [38:0] din0;
  input [38:0] din1;
  input sel0;
  output [38:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(39)  d0_0 (
  .sel(psel1),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
.dout(dout[38:0])
);









  



endmodule

