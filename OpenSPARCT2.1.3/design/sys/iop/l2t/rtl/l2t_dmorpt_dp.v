// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_dmorpt_dp.v
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
module l2t_dmorpt_dp (
  in_bus0, 
  in_bus1, 
  out_bus0, 
  out_bus1);

input  [38:0] 	in_bus0;
input  [38:0] 	in_bus1;
output [38:0] 	out_bus0;
output [38:0] 	out_bus1;



l2t_dmorpt_dp_buff_macro__dbuff_64x__stack_20r__width_19 buff_bus0_0 
	(
	.dout	(out_bus0[18:0]),
	.din	(in_bus0[18:0])
	);

l2t_dmorpt_dp_buff_macro__dbuff_64x__stack_20r__width_20 buff_bus0_1 
        (
        .dout   (out_bus0[38:19]),
        .din    (in_bus0[38:19])
        );

l2t_dmorpt_dp_buff_macro__dbuff_64x__stack_20r__width_19 buff_bus1_0 
        (
        .dout   (out_bus1[18:0]),
        .din    (in_bus1[18:0])
        );

l2t_dmorpt_dp_buff_macro__dbuff_64x__stack_20r__width_20 buff_bus1_1 
        (
        .dout   (out_bus1[38:19]),
        .din    (in_bus1[38:19])
        );

endmodule


//
//   buff macro
//
//





module l2t_dmorpt_dp_buff_macro__dbuff_64x__stack_20r__width_19 (
  din, 
  dout);
  input [18:0] din;
  output [18:0] dout;






buff #(19)  d0_0 (
.in(din[18:0]),
.out(dout[18:0])
);








endmodule





//
//   buff macro
//
//





module l2t_dmorpt_dp_buff_macro__dbuff_64x__stack_20r__width_20 (
  din, 
  dout);
  input [19:0] din;
  output [19:0] dout;






buff #(20)  d0_0 (
.in(din[19:0]),
.out(dout[19:0])
);








endmodule




