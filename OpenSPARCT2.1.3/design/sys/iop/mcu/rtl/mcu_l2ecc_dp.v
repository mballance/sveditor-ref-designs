// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_l2ecc_dp.v
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
module mcu_l2ecc_dp (
  din, 
  mecc_err, 
  pa_err, 
  parity);
wire l2_eccgen_err;
wire dout_p0_1;
wire dout_p0_2;
wire dout_p0_3;
wire dout_p0_4;
wire dout_p0_5;
wire dout_p0_6;
wire dout_p0_7;
wire dout_p0_8;
wire dout_p1_1;
wire dout_p1_2;
wire dout_p1_3;
wire dout_p1_4;
wire dout_p1_5;
wire dout_p1_6;
wire dout_p1_7;
wire dout_p1_8;
wire dout_p2_1;
wire dout_p2_2;
wire dout_p2_3;
wire dout_p2_4;
wire dout_p2_5;
wire dout_p2_6;
wire dout_p2_7;
wire dout_p2_8;
wire dout_p3_1;
wire dout_p3_2;
wire dout_p3_3;
wire dout_p3_4;
wire dout_p3_5;
wire dout_p4_1;
wire dout_p4_2;
wire dout_p4_3;
wire dout_p4_4;
wire dout_p4_5;
wire dout_p5_1;
wire dout_p6_1;
wire dout_p6_2;
wire dout_p6_3;
wire dout_p6_4;
wire dout_p6_5;
wire dout_p6_6;
wire dout_p6_7;
wire dout_p6_8;


input  [31:0] 	din;
input		mecc_err;	// ECC multi err
input		pa_err;		// Physical address err
output [6:0] 	parity;

mcu_l2ecc_dp_or_macro__ports_2__width_1  u_mecc_pa_err	      (.din0 (mecc_err), .din1 (pa_err), .dout (l2_eccgen_err) );
//	
//	P0
//	Incase of mecc_err, flip 2 low order parity to flag L2 that theere is an mecc_err in the current data
//
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p0_1        ( .din0 ( din[0] ),    .din1 ( din[1] ),    .din2 ( din[3] ),    .dout ( dout_p0_1 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p0_2        ( .din0 ( din[4] ),    .din1 ( din[6] ),    .din2 ( din[8] ),    .dout ( dout_p0_2 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p0_3        ( .din0 ( din[10] ),   .din1 ( din[11] ),   .din2 ( din[13] ),   .dout ( dout_p0_3 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p0_4        ( .din0 ( din[15] ),   .din1 ( din[17] ),   .din2 ( din[19] ),   .dout ( dout_p0_4 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p0_5        ( .din0 ( din[21] ),   .din1 ( din[23] ),   .din2 ( din[25] ),   .dout ( dout_p0_5 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p0_6        ( .din0 ( din[26] ),   .din1 ( din[28] ),   .din2 ( din[30] ),   .dout ( dout_p0_6 ));

mcu_l2ecc_dp_xor_macro__ports_3__width_1 p0_7        ( .din0 ( dout_p0_1 ), .din1 ( dout_p0_2 ), .din2 ( dout_p0_3 ), .dout ( dout_p0_7 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p0_8        ( .din0 ( dout_p0_4 ), .din1 ( dout_p0_5 ), .din2 ( dout_p0_6 ), .dout ( dout_p0_8 ));

mcu_l2ecc_dp_xor_macro__ports_3__width_1 p0_9        ( .din0 ( dout_p0_7 ), .din1 ( dout_p0_8 ), .din2 ( l2_eccgen_err ), .dout ( parity[0] )); 

//
//	P1
//
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p1_1        ( .din0 ( din[0] ),    .din1 ( din[2] ),    .din2 ( din[3] ),	 .dout ( dout_p1_1 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p1_2        ( .din0 ( din[5] ),    .din1 ( din[6] ),    .din2 ( din[9] ),	 .dout ( dout_p1_2 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p1_3        ( .din0 ( din[10] ),   .din1 ( din[12] ),   .din2 ( din[13] ),	 .dout ( dout_p1_3 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p1_4        ( .din0 ( din[16] ),   .din1 ( din[17] ),   .din2 ( din[20] ),	 .dout ( dout_p1_4 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p1_5        ( .din0 ( din[21] ),   .din1 ( din[24] ),   .din2 ( din[25] ),	 .dout ( dout_p1_5 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p1_6        ( .din0 ( din[27] ),   .din1 ( din[28] ),   .din2 ( din[31] ),	 .dout ( dout_p1_6 )); 
                                                                                                         
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p1_7        ( .din0 ( dout_p1_1 ), .din1 ( dout_p1_2 ), .din2 ( dout_p1_3 ), .dout ( dout_p1_7 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p1_8        ( .din0 ( dout_p1_4 ), .din1 ( dout_p1_5 ), .din2 ( dout_p1_6 ), .dout ( dout_p1_8 )); 
                                                                                                         
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p1_9        ( .din0 ( dout_p1_7 ), .din1 ( dout_p1_8 ), .din2 ( l2_eccgen_err ), .dout ( parity[1] ));
                                                                                                                           
//
//	P2
//
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p2_1        ( .din0 ( din[1] ),    .din1 ( din[2] ),    .din2 ( din[3] ),	 .dout ( dout_p2_1 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p2_2        ( .din0 ( din[7] ),    .din1 ( din[8] ),    .din2 ( din[9] ),	 .dout ( dout_p2_2 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p2_3        ( .din0 ( din[10] ),   .din1 ( din[14] ),   .din2 ( din[15] ),	 .dout ( dout_p2_3 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p2_4        ( .din0 ( din[16] ),   .din1 ( din[17] ),   .din2 ( din[22] ),	 .dout ( dout_p2_4 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p2_5        ( .din0 ( din[23] ),   .din1 ( din[24] ),   .din2 ( din[25] ),	 .dout ( dout_p2_5 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p2_6        ( .din0 ( din[29] ),   .din1 ( din[30] ),   .din2 ( din[31] ),	 .dout ( dout_p2_6 )); 
                                                                                                         
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p2_7        ( .din0 ( dout_p2_1 ), .din1 ( dout_p2_2 ), .din2 ( dout_p2_3 ), .dout ( dout_p2_7 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p2_8        ( .din0 ( dout_p2_4 ), .din1 ( dout_p2_5 ), .din2 ( dout_p2_6 ), .dout ( dout_p2_8 )); 
                                                                                                         
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p2_9        ( .din0 ( dout_p2_7 ), .din1 ( dout_p2_8 ), .din2 ( l2_eccgen_err ), .dout ( parity[2] )); 
                                                                                                                           
//
//	P3
//
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p3_1        ( .din0 ( din[4] ),    .din1 ( din[5] ),    .din2 ( din[6] ),	 .dout ( dout_p3_1 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p3_2        ( .din0 ( din[10] ),   .din1 ( din[18] ),   .din2 ( din[19] ),	 .dout ( dout_p3_2 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p3_3        ( .din0 ( din[20] ),   .din1 ( din[21] ),   .din2 ( din[22] ),	 .dout ( dout_p3_3 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p3_4        ( .din0 ( dout_p3_1 ), .din1 ( dout_p2_2 ), .din2 ( dout_p3_2 ), .dout ( dout_p3_4 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p3_5        ( .din0 ( dout_p3_4 ), .din1 ( dout_p2_5 ), .din2 ( dout_p3_3 ), .dout ( dout_p3_5 )); 
mcu_l2ecc_dp_xor_macro__ports_2__width_1 p3_6        ( .din0 ( dout_p3_5 ), .din1 ( l2_eccgen_err ),                  .dout ( parity[3] )); 
                                                                                                                            
//                                                                                                       
//	P4                                                                                               
//                                                                                                       
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p4_1        ( .din0 ( din[11] ),   .din1 ( din[12] ),   .din2 ( din[13] ),	 .dout ( dout_p4_1 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p4_2        ( .din0 ( din[14] ),   .din1 ( din[15] ),   .din2 ( din[16] ),	 .dout ( dout_p4_2 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p4_3        ( .din0 ( din[17] ),   .din1 ( din[18] ),   .din2 ( din[19] ),	 .dout ( dout_p4_3 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p4_4        ( .din0 ( dout_p4_1 ), .din1 ( dout_p4_2 ), .din2 ( dout_p4_3 ), .dout ( dout_p4_4 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p4_5        ( .din0 ( dout_p4_4 ), .din1 ( dout_p2_5 ), .din2 ( dout_p3_3 ), .dout ( dout_p4_5 ));
mcu_l2ecc_dp_xor_macro__ports_2__width_1 p4_6        ( .din0 ( dout_p4_5 ), .din1 ( l2_eccgen_err ),                  .dout ( parity[4] ));
                                                                                                                           
//
//	P5
//
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p5_1        ( .din0 ( din[26] ),   .din1 ( din[27] ),   .din2 ( din[28] ),	 .dout ( dout_p5_1 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p5_2        ( .din0 ( dout_p2_6 ), .din1 ( dout_p5_1 ),.din2 ( l2_eccgen_err ),.dout ( parity[5] )); 
                                                                                                                           
//
//	P6
//
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p6_1        ( .din0 ( din[0] ),    .din1 ( din[1] ),    .din2 ( din[2] ),	 .dout ( dout_p6_1 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p6_2        ( .din0 ( din[4] ),    .din1 ( din[5] ),    .din2 ( din[7] ),	 .dout ( dout_p6_2 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p6_3        ( .din0 ( din[10] ),   .din1 ( din[11] ),   .din2 ( din[12] ),	 .dout ( dout_p6_3 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p6_4        ( .din0 ( din[14] ),   .din1 ( din[17] ),   .din2 ( din[18] ),	 .dout ( dout_p6_4 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p6_5        ( .din0 ( din[21] ),   .din1 ( din[23] ),   .din2 ( din[24] ),	 .dout ( dout_p6_5 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p6_6        ( .din0 ( din[26] ),   .din1 ( din[27] ),   .din2 ( din[29] ),	 .dout ( dout_p6_6 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p6_7        ( .din0 ( dout_p6_1 ), .din1 ( dout_p6_2 ), .din2 ( dout_p6_3 ), .dout ( dout_p6_7 )); 
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p6_8        ( .din0 ( dout_p6_4 ), .din1 ( dout_p6_5 ), .din2 ( dout_p6_6 ), .dout ( dout_p6_8 ));
mcu_l2ecc_dp_xor_macro__ports_3__width_1 p6_9        ( .din0 ( dout_p6_7 ), .din1 ( dout_p6_8 ), .din2 ( l2_eccgen_err ), .dout ( parity[6] )); 
                                                                                                         
endmodule	// mcu_l2ecc_dp


//  
//   or macro for ports = 2,3
//
//





module mcu_l2ecc_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_l2ecc_dp_xor_macro__ports_3__width_1 (
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





module mcu_l2ecc_dp_xor_macro__ports_2__width_1 (
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




