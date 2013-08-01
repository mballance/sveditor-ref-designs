// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pku_pkd_dp.v
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
module pku_pkd_dp (
  dec_valid_d, 
  dec_decode_d, 
  swl_cancel_pick_p, 
  pku_flush_buffer0, 
  pku_raw_pick_p, 
  pku_base_pick_p, 
  pku_pick_p);
wire [3:0] cancel_pick_p_;
wire [3:0] flush_buffer0_;
wire valid_d_;
wire decode_cancel;
wire [3:0] qraw_pick_;
wire [3:0] qraw_pick;
wire [3:0] early0;
wire [3:0] base_pick_p_;
wire [3:0] final_pick_p_;


input dec_valid_d;		// inst is valid at decode for relevant TG
input dec_decode_d;	        // decoded inst at decode for relevant TG
input [3:0] swl_cancel_pick_p;	// cancel pick for thread i
input [3:0] pku_flush_buffer0;	// flush oldest instruction for thread i
input [3:0] pku_raw_pick_p;	// raw_pick

output [3:0] pku_base_pick_p;
output [3:0] pku_pick_p;


// assign pku_base_pick_p[3:0] = ~swl_cancel_pick_p[3:0] & pku_raw_pick_p[3:0] & ~pku_flush_buffer0[3:0];

// assign pku_pick_p[3:0] = ~swl_cancel_pick_p[3:0] & ~{4{dec_valid_d & ~dec_decode_d}} & pku_raw_pick_p[3:0] & ~pku_flush_buffer0[3:0];

pku_pkd_dp_inv_macro__dinv_12x__width_4 inv00  (
	.din(swl_cancel_pick_p[3:0]),
	.dout(cancel_pick_p_[3:0])
);

pku_pkd_dp_inv_macro__dinv_8x__width_4 inv01  (
	.din(pku_flush_buffer0[3:0]),
	.dout(flush_buffer0_[3:0])
);

pku_pkd_dp_inv_macro__dinv_6x__width_1 inv02  (
	.din(dec_valid_d),
	.dout(valid_d_)
);

pku_pkd_dp_nor_macro__dnor_8x__ports_2__width_1 nor02  (
	.din0(dec_decode_d),
	.din1(valid_d_),
	.dout(decode_cancel)
);

pku_pkd_dp_nand_macro__dnand_12x__ports_2__width_4 nand03  (
	.din0(pku_raw_pick_p[3:0]),	
	.din1(flush_buffer0_[3:0]),
	.dout(qraw_pick_[3:0])
);

pku_pkd_dp_inv_macro__dinv_8x__width_4 inv05  (
	.din(qraw_pick_[3:0]),
	.dout(qraw_pick[3:0])
);

pku_pkd_dp_nor_macro__dnor_12x__ports_2__width_4 nor01  (
	.din0({4{decode_cancel}}),
	.din1(qraw_pick_[3:0]),
	.dout(early0[3:0])
);


pku_pkd_dp_nand_macro__dnand_12x__ports_2__width_4 nand01  (
	.din0(cancel_pick_p_[3:0]),
	.din1(qraw_pick[3:0]),
	.dout(base_pick_p_[3:0])
);


pku_pkd_dp_inv_macro__dinv_28x__width_4 inv03  (
	.din(base_pick_p_[3:0]),
	.dout(pku_base_pick_p[3:0])
);


pku_pkd_dp_nand_macro__dnand_20x__ports_2__width_4 nand02  (
	.din0(cancel_pick_p_[3:0]),
	.din1(early0[3:0]),
	.dout(final_pick_p_[3:0])
);


pku_pkd_dp_inv_macro__dinv_56x__width_4 inv04  (
	.din(final_pick_p_[3:0]),
	.dout(pku_pick_p[3:0])
);

endmodule


//
//   invert macro
//
//





module pku_pkd_dp_inv_macro__dinv_12x__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule





//
//   invert macro
//
//





module pku_pkd_dp_inv_macro__dinv_8x__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule





//
//   invert macro
//
//





module pku_pkd_dp_inv_macro__dinv_6x__width_1 (
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
//   nor macro for ports = 2,3
//
//





module pku_pkd_dp_nor_macro__dnor_8x__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module pku_pkd_dp_nand_macro__dnand_12x__ports_2__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nand2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module pku_pkd_dp_nor_macro__dnor_12x__ports_2__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nor2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);







endmodule





//
//   invert macro
//
//





module pku_pkd_dp_inv_macro__dinv_28x__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module pku_pkd_dp_nand_macro__dnand_20x__ports_2__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nand2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   invert macro
//
//





module pku_pkd_dp_inv_macro__dinv_56x__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule




