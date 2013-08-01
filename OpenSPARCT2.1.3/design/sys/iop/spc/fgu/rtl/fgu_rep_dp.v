// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_rep_dp.v
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
module fgu_rep_dp (
  fad_rs1_fmt_fx1, 
  fad_rs2_fmt_fx1, 
  fad_rs1_fmt_fx1_rep0, 
  fad_rs1_fmt_fx1_rep01, 
  fad_rs2_fmt_fx1_rep0, 
  fad_rs2_fmt_fx1_rep01, 
  fad_rs2_fmt_fx1_rep1, 
  fdd_result, 
  fdd_result_rep0, 
  fpf_hi_bof_fx1, 
  fpf_lo_bof_fx1, 
  fpf_hi_bof_fx1_rep0, 
  fpf_lo_bof_fx1_rep0, 
  fpe_rs2_fmt_fx1, 
  fpe_rs2_fmt_fx1_b0_rep0, 
  mul_clken, 
  div_clken, 
  mul_clken_rep0, 
  mul_clken_rep01, 
  div_clken_rep0, 
  fac_div_valid_fx1, 
  fac_divq_valid_fx1, 
  fac_div_control_fx1, 
  fac_div_valid_fx1_rep0, 
  fac_divq_valid_fx1_rep0, 
  fac_div_control_fx1_rep0, 
  fdc_finish_int_early, 
  fdc_finish_fltd_early, 
  fdc_finish_flts_early, 
  fdc_finish_int_early_rep0, 
  fdc_finish_fltd_early_rep0, 
  fdc_finish_flts_early_rep0);


// ----------------------------------------------------------------------------
// 
// ----------------------------------------------------------------------------

input   [63:0] fad_rs1_fmt_fx1;
input   [63:0] fad_rs2_fmt_fx1;
output  [63:0] fad_rs1_fmt_fx1_rep0;
output  [63:0] fad_rs1_fmt_fx1_rep01;
output  [63:0] fad_rs2_fmt_fx1_rep0;
output  [63:0] fad_rs2_fmt_fx1_rep01;
output  [63:0] fad_rs2_fmt_fx1_rep1;

input  [62:11] fdd_result;
output [62:11] fdd_result_rep0;

input          fpf_hi_bof_fx1;
input          fpf_lo_bof_fx1;
output         fpf_hi_bof_fx1_rep0;
output         fpf_lo_bof_fx1_rep0;

input    [0:0] fpe_rs2_fmt_fx1;
output         fpe_rs2_fmt_fx1_b0_rep0;

input          mul_clken;
input          div_clken;
output         mul_clken_rep0;
output         mul_clken_rep01;
output         div_clken_rep0;

input          fac_div_valid_fx1;
input          fac_divq_valid_fx1;
input    [4:0] fac_div_control_fx1;
output         fac_div_valid_fx1_rep0;
output         fac_divq_valid_fx1_rep0;
output   [4:0] fac_div_control_fx1_rep0;

input          fdc_finish_int_early;
input 	       fdc_finish_fltd_early;
input          fdc_finish_flts_early;
output         fdc_finish_int_early_rep0;
output	       fdc_finish_fltd_early_rep0;
output         fdc_finish_flts_early_rep0;


// ----------------------------------------------------------------------------
// 
// ----------------------------------------------------------------------------


fgu_rep_dp_buff_macro__rep_1__width_64 rs1_fmt_rep0  (
  .din (fad_rs1_fmt_fx1[63:0]     ),
  .dout(fad_rs1_fmt_fx1_rep0[63:0])
  );

fgu_rep_dp_buff_macro__rep_1__width_64 rs1_fmt_rep01  (
  .din (fad_rs1_fmt_fx1[63:0]     ),
  .dout(fad_rs1_fmt_fx1_rep01[63:0])
  );

fgu_rep_dp_buff_macro__rep_1__width_64 rs2_fmt_rep0  (
  .din (fad_rs2_fmt_fx1[63:0]     ),
  .dout(fad_rs2_fmt_fx1_rep0[63:0])
  );

fgu_rep_dp_buff_macro__rep_1__width_64 rs2_fmt_rep01  (
  .din (fad_rs2_fmt_fx1[63:0]     ),
  .dout(fad_rs2_fmt_fx1_rep01[63:0])
  );

fgu_rep_dp_buff_macro__rep_1__stack_88c__width_64 rs2_fmt_rep1  (  // placed in fpy, so stack width set to match
  .din (fad_rs2_fmt_fx1_rep0[63:0]),
  .dout(fad_rs2_fmt_fx1_rep1[63:0])
  );

fgu_rep_dp_buff_macro__rep_1__width_52 fdd_res_rep0  (
  .din (fdd_result[62:11]     ),
  .dout(fdd_result_rep0[62:11])
  );

fgu_rep_dp_buff_macro__rep_1__width_2 bof_rep0  (
  .din ({fpf_hi_bof_fx1,      fpf_lo_bof_fx1     }),
  .dout({fpf_hi_bof_fx1_rep0, fpf_lo_bof_fx1_rep0})
  );

fgu_rep_dp_buff_macro__rep_1__width_1 fpe_fmt_rep0  (
  .din (fpe_rs2_fmt_fx1[0]     ),
  .dout(fpe_rs2_fmt_fx1_b0_rep0)
  );

fgu_rep_dp_buff_macro__rep_1__width_2 mul_clkenable_rep0  (
  .din ({mul_clken,       mul_clken     }),
  .dout({mul_clken_rep01, mul_clken_rep0})
  );

fgu_rep_dp_buff_macro__rep_1__width_8 div_control_rep0  (
  .din ({div_clken,
         fac_div_valid_fx1,
         fac_divq_valid_fx1,
         fac_div_control_fx1[4:0]}),
  .dout({div_clken_rep0,
         fac_div_valid_fx1_rep0,
         fac_divq_valid_fx1_rep0,
         fac_div_control_fx1_rep0[4:0]})
  );

fgu_rep_dp_buff_macro__rep_1__width_3 finish_early_rep0  (
  .din ({fdc_finish_int_early,
         fdc_finish_fltd_early,
         fdc_finish_flts_early}),
  .dout({fdc_finish_int_early_rep0,
         fdc_finish_fltd_early_rep0,
         fdc_finish_flts_early_rep0})
  );


endmodule  // fgu_rep_dp



//
//   buff macro
//
//





module fgu_rep_dp_buff_macro__rep_1__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module fgu_rep_dp_buff_macro__rep_1__stack_88c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module fgu_rep_dp_buff_macro__rep_1__width_52 (
  din, 
  dout);
  input [51:0] din;
  output [51:0] dout;






buff #(52)  d0_0 (
.in(din[51:0]),
.out(dout[51:0])
);








endmodule





//
//   buff macro
//
//





module fgu_rep_dp_buff_macro__rep_1__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   buff macro
//
//





module fgu_rep_dp_buff_macro__rep_1__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   buff macro
//
//





module fgu_rep_dp_buff_macro__rep_1__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





//
//   buff macro
//
//





module fgu_rep_dp_buff_macro__rep_1__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






buff #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);








endmodule




