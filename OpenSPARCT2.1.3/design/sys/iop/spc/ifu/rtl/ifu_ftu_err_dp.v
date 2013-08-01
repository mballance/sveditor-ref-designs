// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_err_dp.v
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
module ifu_ftu_err_dp (
  ict_itlb_way_0_tag_f, 
  ict_itlb_way_1_tag_f, 
  ict_itlb_way_2_tag_f, 
  ict_itlb_way_3_tag_f, 
  ict_itlb_way_4_tag_f, 
  ict_itlb_way_5_tag_f, 
  ict_itlb_way_6_tag_f, 
  ict_itlb_way_7_tag_f, 
  err_w0_8b_parity_f, 
  err_w1_8b_parity_f, 
  err_w2_8b_parity_f, 
  err_w3_8b_parity_f, 
  err_w4_8b_parity_f, 
  err_w5_8b_parity_f, 
  err_w6_8b_parity_f, 
  err_w7_8b_parity_f) ;
wire err_w0_8b_parity_f_3_xor0;
wire err_w0_8b_parity_f_3_xor1;
wire [3:0] err_w0_8b_parity_f_in;
wire err_w0_8b_parity_f_2_xor0;
wire err_w0_8b_parity_f_2_xor1;
wire err_w0_8b_parity_f_2_xor2;
wire err_w0_8b_parity_f_1_xor0;
wire err_w0_8b_parity_f_1_xor1;
wire err_w0_8b_parity_f_1_xor2;
wire err_w0_8b_parity_f_0_xor0;
wire err_w0_8b_parity_f_0_xor1;
wire err_w0_8b_parity_f_0_xor2;
wire err_w1_8b_parity_f_3_xor0;
wire err_w1_8b_parity_f_3_xor1;
wire [3:0] err_w1_8b_parity_f_in;
wire err_w1_8b_parity_f_2_xor0;
wire err_w1_8b_parity_f_2_xor1;
wire err_w1_8b_parity_f_2_xor2;
wire err_w1_8b_parity_f_1_xor0;
wire err_w1_8b_parity_f_1_xor1;
wire err_w1_8b_parity_f_1_xor2;
wire err_w1_8b_parity_f_0_xor0;
wire err_w1_8b_parity_f_0_xor1;
wire err_w1_8b_parity_f_0_xor2;
wire err_w2_8b_parity_f_3_xor0;
wire err_w2_8b_parity_f_3_xor1;
wire [3:0] err_w2_8b_parity_f_in;
wire err_w2_8b_parity_f_2_xor0;
wire err_w2_8b_parity_f_2_xor1;
wire err_w2_8b_parity_f_2_xor2;
wire err_w2_8b_parity_f_1_xor0;
wire err_w2_8b_parity_f_1_xor1;
wire err_w2_8b_parity_f_1_xor2;
wire err_w2_8b_parity_f_0_xor0;
wire err_w2_8b_parity_f_0_xor1;
wire err_w2_8b_parity_f_0_xor2;
wire err_w3_8b_parity_f_3_xor0;
wire err_w3_8b_parity_f_3_xor1;
wire [3:0] err_w3_8b_parity_f_in;
wire err_w3_8b_parity_f_2_xor0;
wire err_w3_8b_parity_f_2_xor1;
wire err_w3_8b_parity_f_2_xor2;
wire err_w3_8b_parity_f_1_xor0;
wire err_w3_8b_parity_f_1_xor1;
wire err_w3_8b_parity_f_1_xor2;
wire err_w3_8b_parity_f_0_xor0;
wire err_w3_8b_parity_f_0_xor1;
wire err_w3_8b_parity_f_0_xor2;
wire err_w4_8b_parity_f_3_xor0;
wire err_w4_8b_parity_f_3_xor1;
wire [3:0] err_w4_8b_parity_f_in;
wire err_w4_8b_parity_f_2_xor0;
wire err_w4_8b_parity_f_2_xor1;
wire err_w4_8b_parity_f_2_xor2;
wire err_w4_8b_parity_f_1_xor0;
wire err_w4_8b_parity_f_1_xor1;
wire err_w4_8b_parity_f_1_xor2;
wire err_w4_8b_parity_f_0_xor0;
wire err_w4_8b_parity_f_0_xor1;
wire err_w4_8b_parity_f_0_xor2;
wire err_w5_8b_parity_f_3_xor0;
wire err_w5_8b_parity_f_3_xor1;
wire [3:0] err_w5_8b_parity_f_in;
wire err_w5_8b_parity_f_2_xor0;
wire err_w5_8b_parity_f_2_xor1;
wire err_w5_8b_parity_f_2_xor2;
wire err_w5_8b_parity_f_1_xor0;
wire err_w5_8b_parity_f_1_xor1;
wire err_w5_8b_parity_f_1_xor2;
wire err_w5_8b_parity_f_0_xor0;
wire err_w5_8b_parity_f_0_xor1;
wire err_w5_8b_parity_f_0_xor2;
wire err_w6_8b_parity_f_3_xor0;
wire err_w6_8b_parity_f_3_xor1;
wire [3:0] err_w6_8b_parity_f_in;
wire err_w6_8b_parity_f_2_xor0;
wire err_w6_8b_parity_f_2_xor1;
wire err_w6_8b_parity_f_2_xor2;
wire err_w6_8b_parity_f_1_xor0;
wire err_w6_8b_parity_f_1_xor1;
wire err_w6_8b_parity_f_1_xor2;
wire err_w6_8b_parity_f_0_xor0;
wire err_w6_8b_parity_f_0_xor1;
wire err_w6_8b_parity_f_0_xor2;
wire err_w7_8b_parity_f_3_xor0;
wire err_w7_8b_parity_f_3_xor1;
wire [3:0] err_w7_8b_parity_f_in;
wire err_w7_8b_parity_f_2_xor0;
wire err_w7_8b_parity_f_2_xor1;
wire err_w7_8b_parity_f_2_xor2;
wire err_w7_8b_parity_f_1_xor0;
wire err_w7_8b_parity_f_1_xor1;
wire err_w7_8b_parity_f_1_xor2;
wire err_w7_8b_parity_f_0_xor0;
wire err_w7_8b_parity_f_0_xor1;
wire err_w7_8b_parity_f_0_xor2;




input  [29:0] ict_itlb_way_0_tag_f; // 
input  [29:0] ict_itlb_way_1_tag_f; // 
input  [29:0] ict_itlb_way_2_tag_f; // 
input  [29:0] ict_itlb_way_3_tag_f; // 
input  [29:0] ict_itlb_way_4_tag_f; // 
input  [29:0] ict_itlb_way_5_tag_f; // 
input  [29:0] ict_itlb_way_6_tag_f; // 
input  [29:0] ict_itlb_way_7_tag_f; // 



output [3:0] err_w0_8b_parity_f;
output [3:0] err_w1_8b_parity_f;
output [3:0] err_w2_8b_parity_f;
output [3:0] err_w3_8b_parity_f;
output [3:0] err_w4_8b_parity_f;
output [3:0] err_w5_8b_parity_f;
output [3:0] err_w6_8b_parity_f;
output [3:0] err_w7_8b_parity_f;




///////////////////////////////////////////////////////////
// Generate parity in two stages. First stage is done in //
// F cycle when the tags are read.    The second stage   //
// is done in C.                                         //
///////////////////////////////////////////////////////////
///////////////////////////////
// Way 0                     //
///////////////////////////////
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p3_xor0  (
	.din0	(ict_itlb_way_0_tag_f[29]),
	.din1	(ict_itlb_way_0_tag_f[28]),
	.din2	(ict_itlb_way_0_tag_f[27]),
	.dout	(err_w0_8b_parity_f_3_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p3_xor1   (
	.din0	(ict_itlb_way_0_tag_f[26]),
	.din1	(ict_itlb_way_0_tag_f[25]),
	.din2	(ict_itlb_way_0_tag_f[24]),
	.dout	(err_w0_8b_parity_f_3_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w0_8b_p3_xor2   (
	.din0	(err_w0_8b_parity_f_3_xor1),
        .din1   (err_w0_8b_parity_f_3_xor0),
	.dout	(err_w0_8b_parity_f_in[3])
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p2_xor0   (
	.din0	(ict_itlb_way_0_tag_f[23]),
	.din1	(ict_itlb_way_0_tag_f[22]),
	.din2	(ict_itlb_way_0_tag_f[21]),
	.dout	(err_w0_8b_parity_f_2_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p2_xor1   (
	.din0	(ict_itlb_way_0_tag_f[20]),
	.din1	(ict_itlb_way_0_tag_f[19]),
	.din2	(ict_itlb_way_0_tag_f[18]),
	.dout	(err_w0_8b_parity_f_2_xor1)
);

ifu_ftu_err_dp_xor_macro__ports_2__width_1 w0_8b_p2_xor2   (
	.din0	(ict_itlb_way_0_tag_f[17]),
	.din1	(ict_itlb_way_0_tag_f[16]),
	.dout	(err_w0_8b_parity_f_2_xor2)
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p2_xor3   (
	.din0	(err_w0_8b_parity_f_2_xor2),
	.din1	(err_w0_8b_parity_f_2_xor1),
	.din2	(err_w0_8b_parity_f_2_xor0),
	.dout	(err_w0_8b_parity_f_in[2])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p1_xor0   (
	.din0	(ict_itlb_way_0_tag_f[15]),
	.din1	(ict_itlb_way_0_tag_f[14]),
	.din2	(ict_itlb_way_0_tag_f[13]),
	.dout	(err_w0_8b_parity_f_1_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p1_xor1   (
	.din0	(ict_itlb_way_0_tag_f[12]),
	.din1	(ict_itlb_way_0_tag_f[11]),
	.din2	(ict_itlb_way_0_tag_f[10]),
	.dout	(err_w0_8b_parity_f_1_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w0_8b_p1_xor2   (
	.din0	(ict_itlb_way_0_tag_f[9]),
	.din1	(ict_itlb_way_0_tag_f[8]),
	.dout	(err_w0_8b_parity_f_1_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p1_xor3   (
	.din0	(err_w0_8b_parity_f_1_xor2),
	.din1	(err_w0_8b_parity_f_1_xor1),
	.din2	(err_w0_8b_parity_f_1_xor0),
	.dout	(err_w0_8b_parity_f_in[1])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p0_xor0   (
	.din0	(ict_itlb_way_0_tag_f[7]),
	.din1	(ict_itlb_way_0_tag_f[6]),
	.din2	(ict_itlb_way_0_tag_f[5]),
	.dout	(err_w0_8b_parity_f_0_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p0_xor1   (
	.din0	(ict_itlb_way_0_tag_f[4]),
	.din1	(ict_itlb_way_0_tag_f[3]),
	.din2	(ict_itlb_way_0_tag_f[2]),
	.dout	(err_w0_8b_parity_f_0_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w0_8b_p0_xor2   (
	.din0	(ict_itlb_way_0_tag_f[1]),
	.din1	(ict_itlb_way_0_tag_f[0]),
	.dout	(err_w0_8b_parity_f_0_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w0_8b_p0_xor3   (
	.din0	(err_w0_8b_parity_f_0_xor2),
	.din1	(err_w0_8b_parity_f_0_xor1),
	.din2	(err_w0_8b_parity_f_0_xor0),
	.dout	(err_w0_8b_parity_f_in[0])
);

ifu_ftu_err_dp_buff_macro__dbuff_56x__width_4 w0_buff   (
        .din   (err_w0_8b_parity_f_in[3:0]),
        .dout  (err_w0_8b_parity_f[3:0])) ;
///////////////////////////////
// Way 1                     //
///////////////////////////////
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p3_xor0  (
	.din0	(ict_itlb_way_1_tag_f[29]),
	.din1	(ict_itlb_way_1_tag_f[28]),
	.din2	(ict_itlb_way_1_tag_f[27]),
	.dout	(err_w1_8b_parity_f_3_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p3_xor1   (
	.din0	(ict_itlb_way_1_tag_f[26]),
	.din1	(ict_itlb_way_1_tag_f[25]),
	.din2	(ict_itlb_way_1_tag_f[24]),
	.dout	(err_w1_8b_parity_f_3_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w1_8b_p3_xor2   (
	.din0	(err_w1_8b_parity_f_3_xor1),
        .din1   (err_w1_8b_parity_f_3_xor0),
	.dout	(err_w1_8b_parity_f_in[3])
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p2_xor0   (
	.din0	(ict_itlb_way_1_tag_f[23]),
	.din1	(ict_itlb_way_1_tag_f[22]),
	.din2	(ict_itlb_way_1_tag_f[21]),
	.dout	(err_w1_8b_parity_f_2_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p2_xor1   (
	.din0	(ict_itlb_way_1_tag_f[20]),
	.din1	(ict_itlb_way_1_tag_f[19]),
	.din2	(ict_itlb_way_1_tag_f[18]),
	.dout	(err_w1_8b_parity_f_2_xor1)
);

ifu_ftu_err_dp_xor_macro__ports_2__width_1 w1_8b_p2_xor2   (
	.din0	(ict_itlb_way_1_tag_f[17]),
	.din1	(ict_itlb_way_1_tag_f[16]),
	.dout	(err_w1_8b_parity_f_2_xor2)
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p2_xor3   (
	.din0	(err_w1_8b_parity_f_2_xor2),
	.din1	(err_w1_8b_parity_f_2_xor1),
	.din2	(err_w1_8b_parity_f_2_xor0),
	.dout	(err_w1_8b_parity_f_in[2])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p1_xor0   (
	.din0	(ict_itlb_way_1_tag_f[15]),
	.din1	(ict_itlb_way_1_tag_f[14]),
	.din2	(ict_itlb_way_1_tag_f[13]),
	.dout	(err_w1_8b_parity_f_1_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p1_xor1   (
	.din0	(ict_itlb_way_1_tag_f[12]),
	.din1	(ict_itlb_way_1_tag_f[11]),
	.din2	(ict_itlb_way_1_tag_f[10]),
	.dout	(err_w1_8b_parity_f_1_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w1_8b_p1_xor2   (
	.din0	(ict_itlb_way_1_tag_f[9]),
	.din1	(ict_itlb_way_1_tag_f[8]),
	.dout	(err_w1_8b_parity_f_1_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p1_xor3   (
	.din0	(err_w1_8b_parity_f_1_xor2),
	.din1	(err_w1_8b_parity_f_1_xor1),
	.din2	(err_w1_8b_parity_f_1_xor0),
	.dout	(err_w1_8b_parity_f_in[1])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p0_xor0   (
	.din0	(ict_itlb_way_1_tag_f[7]),
	.din1	(ict_itlb_way_1_tag_f[6]),
	.din2	(ict_itlb_way_1_tag_f[5]),
	.dout	(err_w1_8b_parity_f_0_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p0_xor1   (
	.din0	(ict_itlb_way_1_tag_f[4]),
	.din1	(ict_itlb_way_1_tag_f[3]),
	.din2	(ict_itlb_way_1_tag_f[2]),
	.dout	(err_w1_8b_parity_f_0_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w1_8b_p0_xor2   (
	.din0	(ict_itlb_way_1_tag_f[1]),
	.din1	(ict_itlb_way_1_tag_f[0]),
	.dout	(err_w1_8b_parity_f_0_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w1_8b_p0_xor3   (
	.din0	(err_w1_8b_parity_f_0_xor2),
	.din1	(err_w1_8b_parity_f_0_xor1),
	.din2	(err_w1_8b_parity_f_0_xor0),
	.dout	(err_w1_8b_parity_f_in[0])
);


ifu_ftu_err_dp_buff_macro__dbuff_56x__width_4 w1_buff   (
        .din   (err_w1_8b_parity_f_in[3:0]),
        .dout  (err_w1_8b_parity_f[3:0])) ;
///////////////////////////////
// Way 2                     //
///////////////////////////////
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p3_xor0  (
	.din0	(ict_itlb_way_2_tag_f[29]),
	.din1	(ict_itlb_way_2_tag_f[28]),
	.din2	(ict_itlb_way_2_tag_f[27]),
	.dout	(err_w2_8b_parity_f_3_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p3_xor1   (
	.din0	(ict_itlb_way_2_tag_f[26]),
	.din1	(ict_itlb_way_2_tag_f[25]),
	.din2	(ict_itlb_way_2_tag_f[24]),
	.dout	(err_w2_8b_parity_f_3_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w2_8b_p3_xor2   (
	.din0	(err_w2_8b_parity_f_3_xor1),
        .din1   (err_w2_8b_parity_f_3_xor0),
	.dout	(err_w2_8b_parity_f_in[3])
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p2_xor0   (
	.din0	(ict_itlb_way_2_tag_f[23]),
	.din1	(ict_itlb_way_2_tag_f[22]),
	.din2	(ict_itlb_way_2_tag_f[21]),
	.dout	(err_w2_8b_parity_f_2_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p2_xor1   (
	.din0	(ict_itlb_way_2_tag_f[20]),
	.din1	(ict_itlb_way_2_tag_f[19]),
	.din2	(ict_itlb_way_2_tag_f[18]),
	.dout	(err_w2_8b_parity_f_2_xor1)
);

ifu_ftu_err_dp_xor_macro__ports_2__width_1 w2_8b_p2_xor2   (
	.din0	(ict_itlb_way_2_tag_f[17]),
	.din1	(ict_itlb_way_2_tag_f[16]),
	.dout	(err_w2_8b_parity_f_2_xor2)
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p2_xor3   (
	.din0	(err_w2_8b_parity_f_2_xor2),
	.din1	(err_w2_8b_parity_f_2_xor1),
	.din2	(err_w2_8b_parity_f_2_xor0),
	.dout	(err_w2_8b_parity_f_in[2])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p1_xor0   (
	.din0	(ict_itlb_way_2_tag_f[15]),
	.din1	(ict_itlb_way_2_tag_f[14]),
	.din2	(ict_itlb_way_2_tag_f[13]),
	.dout	(err_w2_8b_parity_f_1_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p1_xor1   (
	.din0	(ict_itlb_way_2_tag_f[12]),
	.din1	(ict_itlb_way_2_tag_f[11]),
	.din2	(ict_itlb_way_2_tag_f[10]),
	.dout	(err_w2_8b_parity_f_1_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w2_8b_p1_xor2   (
	.din0	(ict_itlb_way_2_tag_f[9]),
	.din1	(ict_itlb_way_2_tag_f[8]),
	.dout	(err_w2_8b_parity_f_1_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p1_xor3   (
	.din0	(err_w2_8b_parity_f_1_xor2),
	.din1	(err_w2_8b_parity_f_1_xor1),
	.din2	(err_w2_8b_parity_f_1_xor0),
	.dout	(err_w2_8b_parity_f_in[1])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p0_xor0   (
	.din0	(ict_itlb_way_2_tag_f[7]),
	.din1	(ict_itlb_way_2_tag_f[6]),
	.din2	(ict_itlb_way_2_tag_f[5]),
	.dout	(err_w2_8b_parity_f_0_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p0_xor1   (
	.din0	(ict_itlb_way_2_tag_f[4]),
	.din1	(ict_itlb_way_2_tag_f[3]),
	.din2	(ict_itlb_way_2_tag_f[2]),
	.dout	(err_w2_8b_parity_f_0_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w2_8b_p0_xor2   (
	.din0	(ict_itlb_way_2_tag_f[1]),
	.din1	(ict_itlb_way_2_tag_f[0]),
	.dout	(err_w2_8b_parity_f_0_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w2_8b_p0_xor3   (
	.din0	(err_w2_8b_parity_f_0_xor2),
	.din1	(err_w2_8b_parity_f_0_xor1),
	.din2	(err_w2_8b_parity_f_0_xor0),
	.dout	(err_w2_8b_parity_f_in[0])
);


ifu_ftu_err_dp_buff_macro__dbuff_56x__width_4 w2_buff   (
        .din   (err_w2_8b_parity_f_in[3:0]),
        .dout  (err_w2_8b_parity_f[3:0])) ;

///////////////////////////////
// Way 3                     //
///////////////////////////////
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p3_xor0  (
	.din0	(ict_itlb_way_3_tag_f[29]),
	.din1	(ict_itlb_way_3_tag_f[28]),
	.din2	(ict_itlb_way_3_tag_f[27]),
	.dout	(err_w3_8b_parity_f_3_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p3_xor1   (
	.din0	(ict_itlb_way_3_tag_f[26]),
	.din1	(ict_itlb_way_3_tag_f[25]),
	.din2	(ict_itlb_way_3_tag_f[24]),
	.dout	(err_w3_8b_parity_f_3_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w3_8b_p3_xor2   (
	.din0	(err_w3_8b_parity_f_3_xor1),
        .din1   (err_w3_8b_parity_f_3_xor0),
	.dout	(err_w3_8b_parity_f_in[3])
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p2_xor0   (
	.din0	(ict_itlb_way_3_tag_f[23]),
	.din1	(ict_itlb_way_3_tag_f[22]),
	.din2	(ict_itlb_way_3_tag_f[21]),
	.dout	(err_w3_8b_parity_f_2_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p2_xor1   (
	.din0	(ict_itlb_way_3_tag_f[20]),
	.din1	(ict_itlb_way_3_tag_f[19]),
	.din2	(ict_itlb_way_3_tag_f[18]),
	.dout	(err_w3_8b_parity_f_2_xor1)
);

ifu_ftu_err_dp_xor_macro__ports_2__width_1 w3_8b_p2_xor2   (
	.din0	(ict_itlb_way_3_tag_f[17]),
	.din1	(ict_itlb_way_3_tag_f[16]),
	.dout	(err_w3_8b_parity_f_2_xor2)
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p2_xor3   (
	.din0	(err_w3_8b_parity_f_2_xor2),
	.din1	(err_w3_8b_parity_f_2_xor1),
	.din2	(err_w3_8b_parity_f_2_xor0),
	.dout	(err_w3_8b_parity_f_in[2])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p1_xor0   (
	.din0	(ict_itlb_way_3_tag_f[15]),
	.din1	(ict_itlb_way_3_tag_f[14]),
	.din2	(ict_itlb_way_3_tag_f[13]),
	.dout	(err_w3_8b_parity_f_1_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p1_xor1   (
	.din0	(ict_itlb_way_3_tag_f[12]),
	.din1	(ict_itlb_way_3_tag_f[11]),
	.din2	(ict_itlb_way_3_tag_f[10]),
	.dout	(err_w3_8b_parity_f_1_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w3_8b_p1_xor2   (
	.din0	(ict_itlb_way_3_tag_f[9]),
	.din1	(ict_itlb_way_3_tag_f[8]),
	.dout	(err_w3_8b_parity_f_1_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p1_xor3   (
	.din0	(err_w3_8b_parity_f_1_xor2),
	.din1	(err_w3_8b_parity_f_1_xor1),
	.din2	(err_w3_8b_parity_f_1_xor0),
	.dout	(err_w3_8b_parity_f_in[1])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p0_xor0   (
	.din0	(ict_itlb_way_3_tag_f[7]),
	.din1	(ict_itlb_way_3_tag_f[6]),
	.din2	(ict_itlb_way_3_tag_f[5]),
	.dout	(err_w3_8b_parity_f_0_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p0_xor1   (
	.din0	(ict_itlb_way_3_tag_f[4]),
	.din1	(ict_itlb_way_3_tag_f[3]),
	.din2	(ict_itlb_way_3_tag_f[2]),
	.dout	(err_w3_8b_parity_f_0_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w3_8b_p0_xor2   (
	.din0	(ict_itlb_way_3_tag_f[1]),
	.din1	(ict_itlb_way_3_tag_f[0]),
	.dout	(err_w3_8b_parity_f_0_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w3_8b_p0_xor3   (
	.din0	(err_w3_8b_parity_f_0_xor2),
	.din1	(err_w3_8b_parity_f_0_xor1),
	.din2	(err_w3_8b_parity_f_0_xor0),
	.dout	(err_w3_8b_parity_f_in[0])
);


ifu_ftu_err_dp_buff_macro__dbuff_56x__width_4 w3_buff   (
        .din   (err_w3_8b_parity_f_in[3:0]),
        .dout  (err_w3_8b_parity_f[3:0])) ;

///////////////////////////////
// Way 4                     //
///////////////////////////////
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p3_xor0  (
	.din0	(ict_itlb_way_4_tag_f[29]),
	.din1	(ict_itlb_way_4_tag_f[28]),
	.din2	(ict_itlb_way_4_tag_f[27]),
	.dout	(err_w4_8b_parity_f_3_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p3_xor1   (
	.din0	(ict_itlb_way_4_tag_f[26]),
	.din1	(ict_itlb_way_4_tag_f[25]),
	.din2	(ict_itlb_way_4_tag_f[24]),
	.dout	(err_w4_8b_parity_f_3_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w4_8b_p3_xor2   (
	.din0	(err_w4_8b_parity_f_3_xor1),
        .din1   (err_w4_8b_parity_f_3_xor0),
	.dout	(err_w4_8b_parity_f_in[3])
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p2_xor0   (
	.din0	(ict_itlb_way_4_tag_f[23]),
	.din1	(ict_itlb_way_4_tag_f[22]),
	.din2	(ict_itlb_way_4_tag_f[21]),
	.dout	(err_w4_8b_parity_f_2_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p2_xor1   (
	.din0	(ict_itlb_way_4_tag_f[20]),
	.din1	(ict_itlb_way_4_tag_f[19]),
	.din2	(ict_itlb_way_4_tag_f[18]),
	.dout	(err_w4_8b_parity_f_2_xor1)
);

ifu_ftu_err_dp_xor_macro__ports_2__width_1 w4_8b_p2_xor2   (
	.din0	(ict_itlb_way_4_tag_f[17]),
	.din1	(ict_itlb_way_4_tag_f[16]),
	.dout	(err_w4_8b_parity_f_2_xor2)
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p2_xor3   (
	.din0	(err_w4_8b_parity_f_2_xor2),
	.din1	(err_w4_8b_parity_f_2_xor1),
	.din2	(err_w4_8b_parity_f_2_xor0),
	.dout	(err_w4_8b_parity_f_in[2])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p1_xor0   (
	.din0	(ict_itlb_way_4_tag_f[15]),
	.din1	(ict_itlb_way_4_tag_f[14]),
	.din2	(ict_itlb_way_4_tag_f[13]),
	.dout	(err_w4_8b_parity_f_1_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p1_xor1   (
	.din0	(ict_itlb_way_4_tag_f[12]),
	.din1	(ict_itlb_way_4_tag_f[11]),
	.din2	(ict_itlb_way_4_tag_f[10]),
	.dout	(err_w4_8b_parity_f_1_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w4_8b_p1_xor2   (
	.din0	(ict_itlb_way_4_tag_f[9]),
	.din1	(ict_itlb_way_4_tag_f[8]),
	.dout	(err_w4_8b_parity_f_1_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p1_xor3   (
	.din0	(err_w4_8b_parity_f_1_xor2),
	.din1	(err_w4_8b_parity_f_1_xor1),
	.din2	(err_w4_8b_parity_f_1_xor0),
	.dout	(err_w4_8b_parity_f_in[1])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p0_xor0   (
	.din0	(ict_itlb_way_4_tag_f[7]),
	.din1	(ict_itlb_way_4_tag_f[6]),
	.din2	(ict_itlb_way_4_tag_f[5]),
	.dout	(err_w4_8b_parity_f_0_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p0_xor1   (
	.din0	(ict_itlb_way_4_tag_f[4]),
	.din1	(ict_itlb_way_4_tag_f[3]),
	.din2	(ict_itlb_way_4_tag_f[2]),
	.dout	(err_w4_8b_parity_f_0_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w4_8b_p0_xor2   (
	.din0	(ict_itlb_way_4_tag_f[1]),
	.din1	(ict_itlb_way_4_tag_f[0]),
	.dout	(err_w4_8b_parity_f_0_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w4_8b_p0_xor3   (
	.din0	(err_w4_8b_parity_f_0_xor2),
	.din1	(err_w4_8b_parity_f_0_xor1),
	.din2	(err_w4_8b_parity_f_0_xor0),
	.dout	(err_w4_8b_parity_f_in[0])
);

ifu_ftu_err_dp_buff_macro__dbuff_56x__width_4 w4_buff   (
        .din   (err_w4_8b_parity_f_in[3:0]),
        .dout  (err_w4_8b_parity_f[3:0])) ;


///////////////////////////////
// Way 5                     //
///////////////////////////////
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p3_xor0  (
	.din0	(ict_itlb_way_5_tag_f[29]),
	.din1	(ict_itlb_way_5_tag_f[28]),
	.din2	(ict_itlb_way_5_tag_f[27]),
	.dout	(err_w5_8b_parity_f_3_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p3_xor1   (
	.din0	(ict_itlb_way_5_tag_f[26]),
	.din1	(ict_itlb_way_5_tag_f[25]),
	.din2	(ict_itlb_way_5_tag_f[24]),
	.dout	(err_w5_8b_parity_f_3_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w5_8b_p3_xor2   (
	.din0	(err_w5_8b_parity_f_3_xor1),
        .din1   (err_w5_8b_parity_f_3_xor0),
	.dout	(err_w5_8b_parity_f_in[3])
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p2_xor0   (
	.din0	(ict_itlb_way_5_tag_f[23]),
	.din1	(ict_itlb_way_5_tag_f[22]),
	.din2	(ict_itlb_way_5_tag_f[21]),
	.dout	(err_w5_8b_parity_f_2_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p2_xor1   (
	.din0	(ict_itlb_way_5_tag_f[20]),
	.din1	(ict_itlb_way_5_tag_f[19]),
	.din2	(ict_itlb_way_5_tag_f[18]),
	.dout	(err_w5_8b_parity_f_2_xor1)
);

ifu_ftu_err_dp_xor_macro__ports_2__width_1 w5_8b_p2_xor2   (
	.din0	(ict_itlb_way_5_tag_f[17]),
	.din1	(ict_itlb_way_5_tag_f[16]),
	.dout	(err_w5_8b_parity_f_2_xor2)
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p2_xor3   (
	.din0	(err_w5_8b_parity_f_2_xor2),
	.din1	(err_w5_8b_parity_f_2_xor1),
	.din2	(err_w5_8b_parity_f_2_xor0),
	.dout	(err_w5_8b_parity_f_in[2])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p1_xor0   (
	.din0	(ict_itlb_way_5_tag_f[15]),
	.din1	(ict_itlb_way_5_tag_f[14]),
	.din2	(ict_itlb_way_5_tag_f[13]),
	.dout	(err_w5_8b_parity_f_1_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p1_xor1   (
	.din0	(ict_itlb_way_5_tag_f[12]),
	.din1	(ict_itlb_way_5_tag_f[11]),
	.din2	(ict_itlb_way_5_tag_f[10]),
	.dout	(err_w5_8b_parity_f_1_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w5_8b_p1_xor2   (
	.din0	(ict_itlb_way_5_tag_f[9]),
	.din1	(ict_itlb_way_5_tag_f[8]),
	.dout	(err_w5_8b_parity_f_1_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p1_xor3   (
	.din0	(err_w5_8b_parity_f_1_xor2),
	.din1	(err_w5_8b_parity_f_1_xor1),
	.din2	(err_w5_8b_parity_f_1_xor0),
	.dout	(err_w5_8b_parity_f_in[1])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p0_xor0   (
	.din0	(ict_itlb_way_5_tag_f[7]),
	.din1	(ict_itlb_way_5_tag_f[6]),
	.din2	(ict_itlb_way_5_tag_f[5]),
	.dout	(err_w5_8b_parity_f_0_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p0_xor1   (
	.din0	(ict_itlb_way_5_tag_f[4]),
	.din1	(ict_itlb_way_5_tag_f[3]),
	.din2	(ict_itlb_way_5_tag_f[2]),
	.dout	(err_w5_8b_parity_f_0_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w5_8b_p0_xor2   (
	.din0	(ict_itlb_way_5_tag_f[1]),
	.din1	(ict_itlb_way_5_tag_f[0]),
	.dout	(err_w5_8b_parity_f_0_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w5_8b_p0_xor3   (
	.din0	(err_w5_8b_parity_f_0_xor2),
	.din1	(err_w5_8b_parity_f_0_xor1),
	.din2	(err_w5_8b_parity_f_0_xor0),
	.dout	(err_w5_8b_parity_f_in[0])
);

ifu_ftu_err_dp_buff_macro__dbuff_56x__width_4 w5_buff   (
        .din   (err_w5_8b_parity_f_in[3:0]),
        .dout  (err_w5_8b_parity_f[3:0])) ;


///////////////////////////////
// Way 6                     //
///////////////////////////////
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p3_xor0  (
	.din0	(ict_itlb_way_6_tag_f[29]),
	.din1	(ict_itlb_way_6_tag_f[28]),
	.din2	(ict_itlb_way_6_tag_f[27]),
	.dout	(err_w6_8b_parity_f_3_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p3_xor1   (
	.din0	(ict_itlb_way_6_tag_f[26]),
	.din1	(ict_itlb_way_6_tag_f[25]),
	.din2	(ict_itlb_way_6_tag_f[24]),
	.dout	(err_w6_8b_parity_f_3_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w6_8b_p3_xor2   (
	.din0	(err_w6_8b_parity_f_3_xor1),
        .din1   (err_w6_8b_parity_f_3_xor0),
	.dout	(err_w6_8b_parity_f_in[3])
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p2_xor0   (
	.din0	(ict_itlb_way_6_tag_f[23]),
	.din1	(ict_itlb_way_6_tag_f[22]),
	.din2	(ict_itlb_way_6_tag_f[21]),
	.dout	(err_w6_8b_parity_f_2_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p2_xor1   (
	.din0	(ict_itlb_way_6_tag_f[20]),
	.din1	(ict_itlb_way_6_tag_f[19]),
	.din2	(ict_itlb_way_6_tag_f[18]),
	.dout	(err_w6_8b_parity_f_2_xor1)
);

ifu_ftu_err_dp_xor_macro__ports_2__width_1 w6_8b_p2_xor2   (
	.din0	(ict_itlb_way_6_tag_f[17]),
	.din1	(ict_itlb_way_6_tag_f[16]),
	.dout	(err_w6_8b_parity_f_2_xor2)
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p2_xor3   (
	.din0	(err_w6_8b_parity_f_2_xor2),
	.din1	(err_w6_8b_parity_f_2_xor1),
	.din2	(err_w6_8b_parity_f_2_xor0),
	.dout	(err_w6_8b_parity_f_in[2])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p1_xor0   (
	.din0	(ict_itlb_way_6_tag_f[15]),
	.din1	(ict_itlb_way_6_tag_f[14]),
	.din2	(ict_itlb_way_6_tag_f[13]),
	.dout	(err_w6_8b_parity_f_1_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p1_xor1   (
	.din0	(ict_itlb_way_6_tag_f[12]),
	.din1	(ict_itlb_way_6_tag_f[11]),
	.din2	(ict_itlb_way_6_tag_f[10]),
	.dout	(err_w6_8b_parity_f_1_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w6_8b_p1_xor2   (
	.din0	(ict_itlb_way_6_tag_f[9]),
	.din1	(ict_itlb_way_6_tag_f[8]),
	.dout	(err_w6_8b_parity_f_1_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p1_xor3   (
	.din0	(err_w6_8b_parity_f_1_xor2),
	.din1	(err_w6_8b_parity_f_1_xor1),
	.din2	(err_w6_8b_parity_f_1_xor0),
	.dout	(err_w6_8b_parity_f_in[1])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p0_xor0   (
	.din0	(ict_itlb_way_6_tag_f[7]),
	.din1	(ict_itlb_way_6_tag_f[6]),
	.din2	(ict_itlb_way_6_tag_f[5]),
	.dout	(err_w6_8b_parity_f_0_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p0_xor1   (
	.din0	(ict_itlb_way_6_tag_f[4]),
	.din1	(ict_itlb_way_6_tag_f[3]),
	.din2	(ict_itlb_way_6_tag_f[2]),
	.dout	(err_w6_8b_parity_f_0_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w6_8b_p0_xor2   (
	.din0	(ict_itlb_way_6_tag_f[1]),
	.din1	(ict_itlb_way_6_tag_f[0]),
	.dout	(err_w6_8b_parity_f_0_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w6_8b_p0_xor3   (
	.din0	(err_w6_8b_parity_f_0_xor2),
	.din1	(err_w6_8b_parity_f_0_xor1),
	.din2	(err_w6_8b_parity_f_0_xor0),
	.dout	(err_w6_8b_parity_f_in[0])
);

ifu_ftu_err_dp_buff_macro__dbuff_56x__width_4 w6_buff   (
        .din   (err_w6_8b_parity_f_in[3:0]),
        .dout  (err_w6_8b_parity_f[3:0])) ;

///////////////////////////////
// Way 7                     //
///////////////////////////////
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p3_xor0  (
	.din0	(ict_itlb_way_7_tag_f[29]),
	.din1	(ict_itlb_way_7_tag_f[28]),
	.din2	(ict_itlb_way_7_tag_f[27]),
	.dout	(err_w7_8b_parity_f_3_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p3_xor1   (
	.din0	(ict_itlb_way_7_tag_f[26]),
	.din1	(ict_itlb_way_7_tag_f[25]),
	.din2	(ict_itlb_way_7_tag_f[24]),
	.dout	(err_w7_8b_parity_f_3_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w7_8b_p3_xor2   (
	.din0	(err_w7_8b_parity_f_3_xor1),
        .din1   (err_w7_8b_parity_f_3_xor0),
	.dout	(err_w7_8b_parity_f_in[3])
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p2_xor0   (
	.din0	(ict_itlb_way_7_tag_f[23]),
	.din1	(ict_itlb_way_7_tag_f[22]),
	.din2	(ict_itlb_way_7_tag_f[21]),
	.dout	(err_w7_8b_parity_f_2_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p2_xor1   (
	.din0	(ict_itlb_way_7_tag_f[20]),
	.din1	(ict_itlb_way_7_tag_f[19]),
	.din2	(ict_itlb_way_7_tag_f[18]),
	.dout	(err_w7_8b_parity_f_2_xor1)
);

ifu_ftu_err_dp_xor_macro__ports_2__width_1 w7_8b_p2_xor2   (
	.din0	(ict_itlb_way_7_tag_f[17]),
	.din1	(ict_itlb_way_7_tag_f[16]),
	.dout	(err_w7_8b_parity_f_2_xor2)
);

ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p2_xor3   (
	.din0	(err_w7_8b_parity_f_2_xor2),
	.din1	(err_w7_8b_parity_f_2_xor1),
	.din2	(err_w7_8b_parity_f_2_xor0),
	.dout	(err_w7_8b_parity_f_in[2])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p1_xor0   (
	.din0	(ict_itlb_way_7_tag_f[15]),
	.din1	(ict_itlb_way_7_tag_f[14]),
	.din2	(ict_itlb_way_7_tag_f[13]),
	.dout	(err_w7_8b_parity_f_1_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p1_xor1   (
	.din0	(ict_itlb_way_7_tag_f[12]),
	.din1	(ict_itlb_way_7_tag_f[11]),
	.din2	(ict_itlb_way_7_tag_f[10]),
	.dout	(err_w7_8b_parity_f_1_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w7_8b_p1_xor2   (
	.din0	(ict_itlb_way_7_tag_f[9]),
	.din1	(ict_itlb_way_7_tag_f[8]),
	.dout	(err_w7_8b_parity_f_1_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p1_xor3   (
	.din0	(err_w7_8b_parity_f_1_xor2),
	.din1	(err_w7_8b_parity_f_1_xor1),
	.din2	(err_w7_8b_parity_f_1_xor0),
	.dout	(err_w7_8b_parity_f_in[1])
);


ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p0_xor0   (
	.din0	(ict_itlb_way_7_tag_f[7]),
	.din1	(ict_itlb_way_7_tag_f[6]),
	.din2	(ict_itlb_way_7_tag_f[5]),
	.dout	(err_w7_8b_parity_f_0_xor0)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p0_xor1   (
	.din0	(ict_itlb_way_7_tag_f[4]),
	.din1	(ict_itlb_way_7_tag_f[3]),
	.din2	(ict_itlb_way_7_tag_f[2]),
	.dout	(err_w7_8b_parity_f_0_xor1)
);
ifu_ftu_err_dp_xor_macro__ports_2__width_1 w7_8b_p0_xor2   (
	.din0	(ict_itlb_way_7_tag_f[1]),
	.din1	(ict_itlb_way_7_tag_f[0]),
	.dout	(err_w7_8b_parity_f_0_xor2)
);
ifu_ftu_err_dp_xor_macro__ports_3__width_1 w7_8b_p0_xor3   (
	.din0	(err_w7_8b_parity_f_0_xor2),
	.din1	(err_w7_8b_parity_f_0_xor1),
	.din2	(err_w7_8b_parity_f_0_xor0),
	.dout	(err_w7_8b_parity_f_in[0])
);

ifu_ftu_err_dp_buff_macro__dbuff_56x__width_4 w7_buff   (
        .din   (err_w7_8b_parity_f_in[3:0]),
        .dout  (err_w7_8b_parity_f[3:0])) ;


endmodule






//
//   xor macro for ports = 2,3
//
//





module ifu_ftu_err_dp_xor_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module ifu_ftu_err_dp_xor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   buff macro
//
//





module ifu_ftu_err_dp_buff_macro__dbuff_56x__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule




