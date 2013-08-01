// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_vuadcl_dp.v
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
module l2t_vuadcl_dp (
  data_in_l, 
  data_in_h, 
  mux1_h_sel, 
  mux1_l_sel, 
  mux2_sel, 
  tcu_muxtest, 
  vuadcl_data_out_col);
wire muxtst;
wire mux2_sel_n;
wire mux_2to1_sel0;
wire mux_2to1_sel1;
wire mux_2to1_sel2;
wire mux_2to1_sel3;
wire mux_2to1_sel4;
wire mux_2to1_sel5;
wire mux_2to1_sel6;
wire mux_2to1_sel7;
 
 
// every 4th dp pitch has empty. 
input	[155:0]	 data_in_l; // TOP 4 pins per  dp pitch. ( from the array below ) 
input	[155:0]	 data_in_h; // BOTTOM 4 pins per dp pitch. ( from the array above ) 
 
input	[3:0]	 mux1_h_sel; // logically the same as mux1_l_sel ( addr bits <9:8> ) 
input	[3:0]	 mux1_l_sel; // logically the same as mux1_h_sel 
input		 mux2_sel; // ( addr bit <10>) // int 5.0 change 
input            tcu_muxtest;

 
output	[38:0]	 vuadcl_data_out_col; // to vuadio 
 
 
wire	[38:0]	hi_4to1; 
wire	[38:0]	lo_4to1; 
 
wire	[38:0]	hi_4to1_0; 
wire	[38:0]	hi_4to1_1; 
wire	[38:0]	hi_4to1_2; 
wire	[38:0]	hi_4to1_3; 
 
wire	[38:0]	lo_4to1_0; 
wire	[38:0]	lo_4to1_1; 
wire	[38:0]	lo_4to1_2; 
wire	[38:0]	lo_4to1_3; 
 
assign muxtst = tcu_muxtest;
 
assign	hi_4to1_0 = { 
		data_in_h[152], data_in_h[148],data_in_h[144], data_in_h[140], data_in_h[136],
		data_in_h[132], data_in_h[128], data_in_h[124], data_in_h[120], 
                data_in_h[116], data_in_h[112], data_in_h[108], data_in_h[104], 
                data_in_h[100], data_in_h[96], data_in_h[92], 
		data_in_h[88], data_in_h[84], data_in_h[80],	 
		data_in_h[76], data_in_h[72], data_in_h[68], 
		data_in_h[64], data_in_h[60], data_in_h[56], 
		data_in_h[52], data_in_h[48], data_in_h[44], 
		data_in_h[40], data_in_h[36], data_in_h[32], 
		data_in_h[28], data_in_h[24], data_in_h[20], 
		data_in_h[16], data_in_h[12], data_in_h[8], 
		data_in_h[4], data_in_h[0]}; 
 
assign	hi_4to1_1 = {
		data_in_h[153], 
                data_in_h[149], data_in_h[145], data_in_h[141], data_in_h[137], 
		data_in_h[133], data_in_h[129], data_in_h[125], data_in_h[121], 
                data_in_h[117], data_in_h[113], data_in_h[109], data_in_h[105], 
                data_in_h[101], data_in_h[97], data_in_h[93], 
		data_in_h[89], data_in_h[85], data_in_h[81],	 
		data_in_h[77], data_in_h[73], data_in_h[69], 
		data_in_h[65], data_in_h[61], data_in_h[57], 
		data_in_h[53], data_in_h[49], data_in_h[45], 
		data_in_h[41], data_in_h[37], data_in_h[33], 
		data_in_h[29], data_in_h[25], data_in_h[21], 
		data_in_h[17], data_in_h[13], data_in_h[9], 
		data_in_h[5], data_in_h[1]}; 
 
assign	hi_4to1_2 = { 
		data_in_h[154],
		data_in_h[150], data_in_h[146], data_in_h[142], data_in_h[138],  
		data_in_h[134], data_in_h[130], data_in_h[126], data_in_h[122],  
                data_in_h[118], data_in_h[114], data_in_h[110], data_in_h[106], 
                data_in_h[102], data_in_h[98], data_in_h[94], 
		data_in_h[90], data_in_h[86], data_in_h[82],	 
		data_in_h[78], data_in_h[74], data_in_h[70], 
		data_in_h[66], data_in_h[62], data_in_h[58], 
		data_in_h[54], data_in_h[50], data_in_h[46], 
		data_in_h[42], data_in_h[38], data_in_h[34], 
		data_in_h[30], data_in_h[26], data_in_h[22], 
		data_in_h[18], data_in_h[14], data_in_h[10], 
		data_in_h[6], data_in_h[2]}; 
 
assign	hi_4to1_3 = { 
		data_in_h[155],
		data_in_h[151], data_in_h[147], data_in_h[143], data_in_h[139],   
		data_in_h[135], data_in_h[131], data_in_h[127], data_in_h[123],   
                data_in_h[119], data_in_h[115], data_in_h[111], data_in_h[107], 
                data_in_h[103], data_in_h[99], data_in_h[95], 
		data_in_h[91], data_in_h[87], data_in_h[83],	 
		data_in_h[79], data_in_h[75], data_in_h[71], 
		data_in_h[67], data_in_h[63], data_in_h[59], 
		data_in_h[55], data_in_h[51], data_in_h[47], 
		data_in_h[43], data_in_h[39], data_in_h[35], 
		data_in_h[31], data_in_h[27], data_in_h[23], 
		data_in_h[19], data_in_h[15], data_in_h[11], 
		data_in_h[7], data_in_h[3]}; 
 
assign	lo_4to1_0 = { 
		data_in_l[152], 
		data_in_l[148], data_in_l[144], data_in_l[140], data_in_l[136],

		data_in_l[132], data_in_l[128], data_in_l[124], data_in_l[120],
                data_in_l[116], data_in_l[112], data_in_l[108], data_in_l[104],
                data_in_l[100], data_in_l[96], data_in_l[92], 
		data_in_l[88], data_in_l[84], data_in_l[80],	 
		data_in_l[76], data_in_l[72], data_in_l[68], 
		data_in_l[64], data_in_l[60], data_in_l[56], 
		data_in_l[52], data_in_l[48], data_in_l[44], 
		data_in_l[40], data_in_l[36], data_in_l[32], 
		data_in_l[28], data_in_l[24], data_in_l[20], 
		data_in_l[16], data_in_l[12], data_in_l[8], 
		data_in_l[4], data_in_l[0]}; 
 
assign	lo_4to1_1 = {
		data_in_l[153], 
		data_in_l[149], data_in_l[145], data_in_l[141], data_in_l[137],

		data_in_l[133], data_in_l[129], data_in_l[125], data_in_l[121],
                data_in_l[117], data_in_l[113], data_in_l[109], data_in_l[105], 
                data_in_l[101], data_in_l[97], data_in_l[93], 
		data_in_l[89], data_in_l[85], data_in_l[81],	 
		data_in_l[77], data_in_l[73], data_in_l[69], 
		data_in_l[65], data_in_l[61], data_in_l[57], 
		data_in_l[53], data_in_l[49], data_in_l[45], 
		data_in_l[41], data_in_l[37], data_in_l[33], 
		data_in_l[29], data_in_l[25], data_in_l[21], 
		data_in_l[17], data_in_l[13], data_in_l[9], 
		data_in_l[5], data_in_l[1]}; 
 
assign	lo_4to1_2 = {
		data_in_l[154], 
		data_in_l[150], data_in_l[146], data_in_l[142], data_in_l[138],
		data_in_l[134], data_in_l[130], data_in_l[126], data_in_l[122],
                data_in_l[118], data_in_l[114], data_in_l[110], data_in_l[106], 
                data_in_l[102], data_in_l[98], data_in_l[94], 
		data_in_l[90], data_in_l[86], data_in_l[82],	 
		data_in_l[78], data_in_l[74], data_in_l[70], 
		data_in_l[66], data_in_l[62], data_in_l[58], 
		data_in_l[54], data_in_l[50], data_in_l[46], 
		data_in_l[42], data_in_l[38], data_in_l[34], 
		data_in_l[30], data_in_l[26], data_in_l[22], 
		data_in_l[18], data_in_l[14], data_in_l[10], 
		data_in_l[6], data_in_l[2]}; 
 
assign	lo_4to1_3 = {
		data_in_l[155], 
		data_in_l[151], data_in_l[147], data_in_l[143], data_in_l[139],
		data_in_l[135], data_in_l[131], data_in_l[127], data_in_l[123],
                data_in_l[119], data_in_l[115], data_in_l[111], data_in_l[107], 
                data_in_l[103], data_in_l[99], data_in_l[95], 
		data_in_l[91], data_in_l[87], data_in_l[83],	 
		data_in_l[79], data_in_l[75], data_in_l[71], 
		data_in_l[67], data_in_l[63], data_in_l[59], 
		data_in_l[55], data_in_l[51], data_in_l[47], 
		data_in_l[43], data_in_l[39], data_in_l[35], 
		data_in_l[31], data_in_l[27], data_in_l[23], 
		data_in_l[19], data_in_l[15], data_in_l[11], 
		data_in_l[7], data_in_l[3]}; 
 
/////////////////////////////////////////////////////////////////////////////
//mux_macro mux_h_4to1 (width=39,ports=4,mux=pgnpe,stack=39c)
//                (
//                .dout   (hi_4to1[38:0]),
//                .din0   (hi_4to1_0[38:0]),
//                .din1   (hi_4to1_1[38:0]),
//                .din2   (hi_4to1_2[38:0]),
//                .din3   (hi_4to1_3[38:0]),
//                .sel0   (mux1_h_sel[0]),
//                .sel1   (mux1_h_sel[1]),
//                .sel2   (mux1_h_sel[2]),
//                .sel3   (mux1_h_sel[3])
//                );
// 
//mux_macro mux_l_4to1 (width=39,ports=4,mux=pgnpe,stack=39c)
//		(
//		.dout 	(lo_4to1[38:0]), 
//                .din0	(lo_4to1_0[38:0]), 
//                .din1	(lo_4to1_1[38:0]), 
//                .din2	(lo_4to1_2[38:0]), 
//                .din3	(lo_4to1_3[38:0]), 
//                .sel0	(mux1_l_sel[0]), 
//                .sel1	(mux1_l_sel[1]), 
//                .sel2	(mux1_l_sel[2]), 
//                .sel3	(mux1_l_sel[3])
//		); 
//
// 
//inv_macro inv_mux2_sel (width=1)  // int 5.0 changes
//	(
//	.dout	(mux2_sel_n),
//	.din 	(mux2_sel)
//	);
//
//mux_macro mux_2to1 (width=39,ports=2,mux=aonpe,stack=39c,dmux=8x) // int 5.0 changes
//		(
//		.dout 	(vuadcl_data_out_col[38:0]), 
//                .din0	(hi_4to1[38:0]), 
//                .din1	(lo_4to1[38:0]), 
//                .sel0	(mux2_sel_n), 
//                .sel1	(mux2_sel)
//		); 
// 
/////////////////////////////////////////////////////////////////////////////

l2t_vuadcl_dp_inv_macro__width_1 inv_mux2_sel 
	(
	.dout	(mux2_sel_n),
	.din 	(mux2_sel)
	);





l2t_vuadcl_dp_mux_macro__dmux_32x__mux_pgnpe__ports_8__stack_40c__width_39 mux_2to1 
	(
	.dout	(vuadcl_data_out_col[38:0]),
        .din0   (hi_4to1_0[38:0]),
        .din1   (hi_4to1_1[38:0]),
        .din2   (hi_4to1_2[38:0]),
        .din3   (hi_4to1_3[38:0]),
        .din4   (lo_4to1_0[38:0]),
        .din5   (lo_4to1_1[38:0]),
        .din6   (lo_4to1_2[38:0]),
        .din7   (lo_4to1_3[38:0]),
	.sel0	(mux_2to1_sel0),
        .sel1   (mux_2to1_sel1),
        .sel2   (mux_2to1_sel2),
        .sel3   (mux_2to1_sel3),
        .sel4   (mux_2to1_sel4),
        .sel5   (mux_2to1_sel5),
        .sel6   (mux_2to1_sel6),
        .sel7   (mux_2to1_sel7),
  .muxtst(muxtst)
	);

l2t_vuadcl_dp_and_macro__dinv_16x__stack_8c__width_8 and_select  
	(
	.dout	({mux_2to1_sel0,
		  mux_2to1_sel1,
		  mux_2to1_sel2,
		  mux_2to1_sel3,
		  mux_2to1_sel4,
		  mux_2to1_sel5,
		  mux_2to1_sel6,
		  mux_2to1_sel7}),
	.din0	({mux2_sel_n,
		  mux2_sel_n,
		  mux2_sel_n,
		  mux2_sel_n,
		  mux2_sel,
		  mux2_sel,
		  mux2_sel,
		  mux2_sel}),
	.din1	({mux1_h_sel[0],
                  mux1_h_sel[1],
                  mux1_h_sel[2],
                  mux1_h_sel[3],
		  mux1_l_sel[0],
                  mux1_l_sel[1],
                  mux1_l_sel[2],
                  mux1_l_sel[3]})
	);
	
endmodule


//
//   invert macro
//
//





module l2t_vuadcl_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_vuadcl_dp_mux_macro__dmux_32x__mux_pgnpe__ports_8__stack_40c__width_39 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [38:0] din0;
  input sel0;
  input [38:0] din1;
  input sel1;
  input [38:0] din2;
  input sel2;
  input [38:0] din3;
  input sel3;
  input [38:0] din4;
  input sel4;
  input [38:0] din5;
  input sel5;
  input [38:0] din6;
  input sel6;
  input [38:0] din7;
  input sel7;
  input muxtst;
  output [38:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8 #(39)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
  .in2(din2[38:0]),
  .in3(din3[38:0]),
  .in4(din4[38:0]),
  .in5(din5[38:0]),
  .in6(din6[38:0]),
  .in7(din7[38:0]),
.dout(dout[38:0]),
  .muxtst(muxtst)
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module l2t_vuadcl_dp_and_macro__dinv_16x__stack_8c__width_8 (
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




