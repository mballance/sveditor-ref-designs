// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_nibcor_dp.v
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
module mcu_nibcor_dp (
  diffecc2_nz, 
  diff_ecc2, 
  diff_ecc1, 
  result);
wire [3:0] errnib;
wire buf_0_0;
wire buf_0_1;
wire buf_0_1_0;
wire buf_0_1_1;
wire buf_0_1_2;
wire buf_0_1_3;
wire buf_0_1_4;
wire buf_0_1_5;
wire buf_0_1_6;
wire buf_0_1_7;
wire buf_1_0;
wire buf_1_1;
wire buf_1_1_0;
wire buf_1_1_1;
wire buf_1_1_2;
wire buf_1_1_3;
wire buf_1_1_4;
wire buf_1_1_5;
wire buf_1_1_6;
wire buf_1_1_7;
wire buf_2_0;
wire buf_2_1;
wire buf_2_1_0;
wire buf_2_1_1;
wire buf_2_1_2;
wire buf_2_1_3;
wire buf_2_1_4;
wire buf_2_1_5;
wire buf_2_1_6;
wire buf_2_1_7;
wire buf_3_0;
wire buf_3_1;
wire buf_3_1_0;
wire buf_3_1_1;
wire buf_3_1_2;
wire buf_3_1_3;
wire buf_3_1_4;
wire buf_3_1_5;
wire buf_3_1_6;
wire buf_3_1_7;
wire [127:0] d;
wire [3:0] pw29;
wire pw29_0;
wire pw28_3;
wire [3:0] pw28;
wire [3:0] pw27;
wire [3:0] pw26;
wire [3:0] pw25;
wire [3:0] pw24;
wire pw24_1;
wire [3:0] pw23;
wire [3:0] pw22;
wire [3:0] pw21;
wire pw21_2;
wire [3:0] pw20;
wire [3:0] pw19;
wire [3:0] pw18;
wire [3:0] pw17;
wire [3:0] pw16;
wire [3:0] pw14;
wire pw14_0;
wire pw13_3;
wire [3:0] pw13;
wire [3:0] pw12;
wire [3:0] pw11;
wire [3:0] pw10;
wire [3:0] pw9;
wire pw9_1;
wire [3:0] pw8;
wire [3:0] pw7;
wire [3:0] pw6;
wire pw6_2;
wire [3:0] pw5;
wire [3:0] pw4;
wire [3:0] pw3;
wire [3:0] pw2;
wire [3:0] pw1;


input		diffecc2_nz;
input	[3:0]	diff_ecc2;
input	[3:0]	diff_ecc1;	

output [111:0] result;


//		{d[127] , d[123] , d[119] , d[115]  } = {4 {buf_3_1_7}};
//		{d[111] , d[107] , d[103] , d[99]   } = {4 {buf_3_1_6}};
//		{d[95]  , d[91]  , d[87]  , d[83]   } = {4 {buf_3_1_5}};
//		{d[79]  , d[75]  , d[71]  , d[67]   } = {4 {buf_3_1_4}};
//		{d[63]  , d[59]  , d[55]  , d[51]   } = {4 {buf_3_1_3}};
//		{d[47]  , d[43]  , d[39]  , d[35]   } = {4 {buf_3_1_2}};
//		{d[31]  , d[27]  , d[23]  , d[19]   } = {4 {buf_3_1_1}};
//		{d[15]  , d[11]  , d[7]   , d[3]    } = {4 {buf_3_1_0}};
//		                          
//		{d[126] , d[122] , d[118] , d[114]  } = {4 {buf_2_1_7}};
//		{d[110] , d[106] , d[102] , d[98]   } = {4 {buf_2_1_6}};
//		{d[94]  , d[90]  , d[86]  , d[82]   } = {4 {buf_2_1_5}};
//		{d[78]  , d[74]  , d[70]  , d[66]   } = {4 {buf_2_1_4}};
//		{d[62]  , d[58]  , d[54]  , d[50]   } = {4 {buf_2_1_3}};
//		{d[46]  , d[42]  , d[38]  , d[34]   } = {4 {buf_2_1_2}};
//		{d[30]  , d[26]  , d[22]  , d[18]   } = {4 {buf_2_1_1}};
//		{d[14]  , d[10]  , d[6]   , d[2]    } = {4 {buf_2_1_0}};
//		                                 
//		{d[125] , d[121] , d[117] , d[113]  } = {4 {buf_1_1_7}};
//		{d[109] , d[105] , d[101] , d[97]   } = {4 {buf_1_1_6}};
//		{d[93]  , d[89]  , d[85]  , d[81]   } = {4 {buf_1_1_5}};
//		{d[77]  , d[73]  , d[69]  , d[65]   } = {4 {buf_1_1_4}};
//		{d[61]  , d[57]  , d[53]  , d[49]   } = {4 {buf_1_1_3}};
//		{d[45]  , d[41]  , d[37]  , d[33]   } = {4 {buf_1_1_2}};
//		{d[29]  , d[25]  , d[21]  , d[17]   } = {4 {buf_1_1_1}};
//		{d[13]  , d[9]   , d[5]   , d[1]    } = {4 {buf_1_1_0}};
//		                                 
//		{d[124] , d[120] , d[116] , d[112]  } = {4 {buf_0_1_7}};
//		{d[108] , d[104] , d[100] , d[96]   } = {4 {buf_0_1_6}};
//		{d[92]  , d[88]  , d[84]  , d[80]   } = {4 {buf_0_1_5}};
//		{d[76]  , d[72]  , d[68]  , d[64]   } = {4 {buf_0_1_4}};
//		{d[60]  , d[56]  , d[52]  , d[48]   } = {4 {buf_0_1_3}};
//		{d[44]  , d[40]  , d[36]  , d[32]   } = {4 {buf_0_1_2}};
//		{d[28]  , d[24]  , d[20]  , d[16]   } = {4 {buf_0_1_1}};
//		{d[12]  , d[8]   , d[4]   , d[0]    } = {4 {buf_0_1_0}};
                                         

mcu_nibcor_dp_mux_macro__mux_pgpe__ports_2__stack_4c__width_4	u_errnib	               (
		.din0		( diff_ecc2[3:0] ),
		.din1		( diff_ecc1[3:0] ),
		.sel0		( diffecc2_nz ),
		.dout		( errnib[3:0] ));

mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_0	        ( .din  ( errnib[0]), .dout ( buf_0_0 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_1	        ( .din  ( errnib[0]), .dout ( buf_0_1 ));
                                                                              
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_1_0	        ( .din  ( buf_0_0  ), .dout ( buf_0_1_0 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_1_1	        ( .din  ( buf_0_0  ), .dout ( buf_0_1_1 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_1_2	        ( .din  ( buf_0_0  ), .dout ( buf_0_1_2 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_1_3	        ( .din  ( buf_0_0  ), .dout ( buf_0_1_3 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_1_4	        ( .din  ( buf_0_1  ), .dout ( buf_0_1_4 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_1_5	        ( .din  ( buf_0_1  ), .dout ( buf_0_1_5 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_1_6	        ( .din  ( buf_0_1  ), .dout ( buf_0_1_6 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_0_1_7	        ( .din  ( buf_0_1  ), .dout ( buf_0_1_7 ));
                                                                              

mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_0	        ( .din  ( errnib[1]), .dout ( buf_1_0 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_1	        ( .din  ( errnib[1]), .dout ( buf_1_1 ));
                                                                              
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_1_0	        ( .din  ( buf_1_0  ), .dout ( buf_1_1_0 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_1_1	        ( .din  ( buf_1_0  ), .dout ( buf_1_1_1 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_1_2	        ( .din  ( buf_1_0  ), .dout ( buf_1_1_2 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_1_3	        ( .din  ( buf_1_0  ), .dout ( buf_1_1_3 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_1_4	        ( .din  ( buf_1_1  ), .dout ( buf_1_1_4 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_1_5	        ( .din  ( buf_1_1  ), .dout ( buf_1_1_5 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_1_6	        ( .din  ( buf_1_1  ), .dout ( buf_1_1_6 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_1_1_7	        ( .din  ( buf_1_1  ), .dout ( buf_1_1_7 ));

                                                                              
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_0	        ( .din  ( errnib[2]), .dout ( buf_2_0 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_1	        ( .din  ( errnib[2]), .dout ( buf_2_1 ));
                                                                              
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_1_0	        ( .din  ( buf_2_0  ), .dout ( buf_2_1_0 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_1_1	        ( .din  ( buf_2_0  ), .dout ( buf_2_1_1 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_1_2	        ( .din  ( buf_2_0  ), .dout ( buf_2_1_2 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_1_3	        ( .din  ( buf_2_0  ), .dout ( buf_2_1_3 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_1_4	        ( .din  ( buf_2_1  ), .dout ( buf_2_1_4 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_1_5	        ( .din  ( buf_2_1  ), .dout ( buf_2_1_5 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_1_6	        ( .din  ( buf_2_1  ), .dout ( buf_2_1_6 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_2_1_7	        ( .din  ( buf_2_1  ), .dout ( buf_2_1_7 ));

                                                                              
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_0	        ( .din  ( errnib[3]), .dout ( buf_3_0 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_1	        ( .din  ( errnib[3]), .dout ( buf_3_1 ));
                                                                              
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_1_0	        ( .din  ( buf_3_0  ), .dout ( buf_3_1_0 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_1_1	        ( .din  ( buf_3_0  ), .dout ( buf_3_1_1 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_1_2	        ( .din  ( buf_3_0  ), .dout ( buf_3_1_2 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_1_3	        ( .din  ( buf_3_0  ), .dout ( buf_3_1_3 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_1_4	        ( .din  ( buf_3_1  ), .dout ( buf_3_1_4 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_1_5	        ( .din  ( buf_3_1  ), .dout ( buf_3_1_5 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_1_6	        ( .din  ( buf_3_1  ), .dout ( buf_3_1_6 ));
mcu_nibcor_dp_inv_macro__stack_1l__width_1	u_buf_3_1_7	        ( .din  ( buf_3_1  ), .dout ( buf_3_1_7 ));


assign	   d[127:0] = { {4 {buf_3_1_7, buf_2_1_7, buf_1_1_7, buf_0_1_7}}, {4 {buf_3_1_6, buf_2_1_6, buf_1_1_6, buf_0_1_6}},
		  	{4 {buf_3_1_5, buf_2_1_5, buf_1_1_5, buf_0_1_5}}, {4 {buf_3_1_4, buf_2_1_4, buf_1_1_4, buf_0_1_4}},
			{4 {buf_3_1_3, buf_2_1_3, buf_1_1_3, buf_0_1_3}}, {4 {buf_3_1_2, buf_2_1_2, buf_1_1_2, buf_0_1_2}},
			{4 {buf_3_1_1, buf_2_1_1, buf_1_1_1, buf_0_1_1}}, {4 {buf_3_1_0, buf_2_1_0, buf_1_1_0, buf_0_1_0}} };


//		assign	pw29[3]	= 	d[116]	^	d[117]	^	d[118];
//		assign	pw29[2]	= 	d[116]	^	d[117];
//		assign	pw29[1]	= 	d[116];
//		assign	pw29[0]	= 	d[117]	^	d[118]	^	d[119]	^	d[116];
//		assign	pw28[3]	= 	d[112]	^	d[115]	^	d[113]	^	d[114];
//		assign	pw28[2]	= 	d[112]	^	d[114]	^	d[113];
//		assign	pw28[1]	= 	d[113]	^	d[112];
//		assign	pw28[0]	= 	d[113]	^	d[114]	^	d[115];
//		assign	pw27[3]	= 	d[108]	^	d[109];
//		assign	pw27[2]	= 	d[108];
//		assign	pw27[1]	= 	d[111];
//		assign	pw27[0]	= 	d[109]	^	d[110]	^	d[108];
//		assign	pw26[3]	= 	d[104]	^	d[107]	^	d[105];
//		assign	pw26[2]	= 	d[104]	^	d[106];
//		assign	pw26[1]	= 	d[107]	^	d[105];
//		assign	pw26[0]	= 	d[105]	^	d[106];
//		assign	pw25[3]	= 	d[100]	^	d[102];
//		assign	pw25[2]	= 	d[103]	^	d[101];
//		assign	pw25[1]	= 	d[102]	^	d[100]	^	d[103];
//		assign	pw25[0]	= 	d[101]	^	d[100]	^	d[103];
//		assign	pw24[3]	= 	d[96]	^	d[99]	^	d[98];
//		assign	pw24[2]	= 	d[99]	^	d[98]	^	d[97];
//		assign	pw24[1]	= 	d[98]	^	d[97]	^	d[96]	^	d[99];
//		assign	pw24[0]	= 	d[97]	^	d[99];
//		assign	pw23[3]	= 	d[92];
//		assign	pw23[2]	= 	d[95];
//		assign	pw23[1]	= 	d[94];
//		assign	pw23[0]	= 	d[93]	^	d[92];
//		assign	pw22[3]	= 	d[88]	^	d[91];
//		assign	pw22[2]	= 	d[91]	^	d[90];
//		assign	pw22[1]	= 	d[90]	^	d[89];
//		assign	pw22[0]	= 	d[89];
//		assign	pw21[3]	= 	d[85]	^	d[86]	^	d[87];
//		assign	pw21[2]	= 	d[84]	^	d[87]	^	d[85]	^	d[86];
//		assign	pw21[1]	= 	d[86]	^	d[84]	^	d[85];
//		assign	pw21[0]	= 	d[86]	^	d[87]	^	d[84];
//		assign	pw20[3]	= 	d[81]	^	d[82];
//		assign	pw20[2]	= 	d[80]	^	d[83]	^	d[81];
//		assign	pw20[1]	= 	d[82]	^	d[80];
//		assign	pw20[0]	= 	d[82]	^	d[83];
//		assign	pw19[3]	= 	d[77]	^	d[79];
//		assign	pw19[2]	= 	d[76]	^	d[79]	^	d[78];
//		assign	pw19[1]	= 	d[79]	^	d[78]	^	d[77] ;
//		assign	pw19[0]	= 	d[78]	^	d[76];
//		assign	pw18[3]	= 	d[73];
//		assign	pw18[2]	= 	d[72]	^	d[75];
//		assign	pw18[1]	= 	d[75]	^	d[74];
//		assign	pw18[0]	= 	d[74];
//		assign	pw17[3]	= 	d[70]	^	d[71];
//		assign	pw17[2]	= 	d[69]	^	d[70];
//		assign	pw17[1]	= 	d[68]	^	d[71]	^	d[69];
//		assign	pw17[0]	= 	d[68]	^	d[71];
//		assign	pw16[3]	= 	d[66];
//		assign	pw16[2]	= 	d[65];
//		assign	pw16[1]	= 	d[64]	^	d[67];
//		assign	pw16[0]	= 	d[67];
//		assign	pw14[3]	= 	d[56]	^	d[57]	^	d[58];
//		assign	pw14[2]	= 	d[56]	^	d[57];
//		assign	pw14[1]	= 	d[56];
//		assign	pw14[0]	= 	d[57]	^	d[58]	^	d[59]	^	d[56];
//		assign	pw13[3]	= 	d[52]	^	d[55]	^	d[53]	^	d[54];
//		assign	pw13[2]	= 	d[52]	^	d[54]	^	d[53];
//		assign	pw13[1]	= 	d[53]	^	d[52];
//		assign	pw13[0]	= 	d[53]	^	d[54]	^	d[55];
//		assign	pw12[3]	= 	d[48]	^	d[49];
//		assign	pw12[2]	= 	d[48];
//		assign	pw12[1]	= 	d[51];
//		assign	pw12[0]	= 	d[49]	^	d[50]	^	d[48];
//		assign	pw11[3]	= 	d[44]	^	d[47]	^	d[45];
//		assign	pw11[2]	= 	d[44]	^	d[46];
//		assign	pw11[1]	= 	d[47]	^	d[45];
//		assign	pw11[0]	= 	d[45]	^	d[46];
//		assign	pw10[3]	= 	d[40]	^	d[42];
//		assign	pw10[2]	= 	d[43]	^	d[41];
//		assign	pw10[1]	= 	d[42]	^	d[40]	^	d[43];
//		assign	pw10[0]	= 	d[41]	^	d[40]	^	d[43];
//		assign	pw9[3]	= 	d[36]	^	d[39]	^	d[38];
//		assign	pw9[2]	= 	d[39]	^	d[38]	^	d[37];
//		assign	pw9[1]	= 	d[38]	^	d[37]	^	d[36]	^	d[39];
//		assign	pw9[0]	= 	d[37]	^	d[39];
//		assign	pw8[3]	= 	d[32];
//		assign	pw8[2]	= 	d[35];
//		assign	pw8[1]	= 	d[34];
//		assign	pw8[0]	= 	d[33]	^	d[32];
//		assign	pw7[3]	= 	d[28]	^	d[31];
//		assign	pw7[2]	= 	d[31]	^	d[30];
//		assign	pw7[1]	= 	d[30]	^	d[29] ;
//		assign	pw7[0]	= 	d[29];
//		assign	pw6[3]	= 	d[25]	^	d[26]	^	d[27];
//		assign	pw6[2]	= 	d[24]	^	d[27]	^	d[25]	^	d[26];
//		assign	pw6[1]	= 	d[26]	^	d[24]	^	d[25];
//		assign	pw6[0]	= 	d[26]	^	d[27]	^	d[24];
//		assign	pw5[3]	= 	d[21]	^	d[22];
//		assign	pw5[2]	= 	d[20]	^	d[23]	^	d[21];
//		assign	pw5[1]	= 	d[22]	^	d[20];
//		assign	pw5[0]	= 	d[22]	^	d[23];
//		assign	pw4[3]	= 	d[17]	^	d[19];
//		assign	pw4[2]	= 	d[16]	^	d[19]	^	d[18];
//		assign	pw4[1]	= 	d[19]	^	d[18]	^	d[17];
//		assign	pw4[0]	= 	d[18]	^	d[16];
//		assign	pw3[3]	= 	d[13];
//		assign	pw3[2]	= 	d[12]	^	d[15];
//		assign	pw3[1]	= 	d[15]	^	d[14];
//		assign	pw3[0]	= 	d[14];
//		assign	pw2[3]	= 	d[10]	^	d[11];
//		assign	pw2[2]	= 	d[9]	^	d[10];
//		assign	pw2[1]	= 	d[8]	^	d[11]	^	d[9];
//		assign	pw2[0]	= 	d[8]	^	d[11];
//		assign	pw1[3]	= 	d[6];
//		assign	pw1[2]	= 	d[5];
//		assign	pw1[1]	= 	d[4]	^	d[7];
//		assign	pw1[0]	= 	d[7];
//		



mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw29_3 	           ( .din0 ( d[116] ), .din1 ( d[117] ), .din2 ( d[118] ), .dout ( pw29[3] ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw29_2 	           ( .din0 ( d[116] ), .din1 ( d[117] ),                   .dout ( pw29[2] ));	   
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw29_1 	        ( .din  ( d[116] ),                                     .dout ( pw29[1] ));	   
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw29_0 	           ( .din0 ( d[116] ), .din1 ( d[117] ), .din2 ( d[118] ), .dout ( pw29_0  ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw29_0_1	           ( .din0 ( pw29_0 ), .din1 ( d[119] ),                   .dout ( pw29[0] ));	   
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw28_3 	           ( .din0 ( d[112] ), .din1 ( d[113] ), .din2 ( d[114] ), .dout ( pw28_3  )); 
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw28_3_1 	           ( .din0 ( pw28_3 ), .din1 ( d[115] ),                   .dout ( pw28[3] ));	   
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw28_2 	           ( .din0 ( d[112] ), .din1 ( d[113] ), .din2 ( d[114] ), .dout ( pw28[2] ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw28_1 	           ( .din0 ( d[113] ), .din1 ( d[112] ),                   .dout ( pw28[1] ));	   
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw28_0 	           ( .din0 ( d[113] ), .din1 ( d[114] ), .din2 ( d[115] ), .dout ( pw28[0] ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw27_3 	           ( .din0 ( d[108] ), .din1 ( d[109] ),                   .dout ( pw27[3] ));	   
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw27_2 	        ( .din  ( d[108] ),                                     .dout ( pw27[2] ));	   
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw27_1 	        ( .din  ( d[111] ),                                     .dout ( pw27[1] ));	   
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw27_0 	           ( .din0 ( d[108] ), .din1 ( d[109] ), .din2 ( d[110] ), .dout ( pw27[0] ));	   
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw26_3 	           ( .din0 ( d[104] ), .din1 ( d[105] ), .din2 ( d[107] ), .dout ( pw26[3] ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw26_2 	           ( .din0 ( d[104] ), .din1 ( d[106] ),                   .dout ( pw26[2] ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw26_1 	           ( .din0 ( d[105] ), .din1 ( d[107] ),                   .dout ( pw26[1] ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw26_0 	           ( .din0 ( d[105] ), .din1 ( d[106] ),                   .dout ( pw26[0] ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw25_3 	           ( .din0 ( d[100] ), .din1 ( d[102] ),                   .dout ( pw25[3] ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw25_2 	           ( .din0 ( d[101] ), .din1 ( d[103] ),                   .dout ( pw25[2] ));	   
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw25_1 	           ( .din0 ( d[100] ), .din1 ( d[102] ), .din2 ( d[103] ), .dout ( pw25[1] ));	   
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw25_0 	           ( .din0 ( d[101] ), .din1 ( d[100] ), .din2 ( d[103] ), .dout ( pw25[0] ));	   
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw24_3 	           ( .din0 ( d[96]  ), .din1 ( d[99]  ), .din2 ( d[98]  ), .dout ( pw24[3] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw24_2 	           ( .din0 ( d[99]  ), .din1 ( d[98]  ), .din2 ( d[97]  ), .dout ( pw24[2] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw24_1 	           ( .din0 ( d[96]  ), .din1 ( d[97]  ), .din2 ( d[98]  ), .dout ( pw24_1  ));
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw24_1_1	           ( .din0 ( pw24_1 ), .din1 ( d[99]  ),                   .dout ( pw24[1] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw24_0 	           ( .din0 ( d[97]  ), .din1 ( d[99]  ),                   .dout ( pw24[0] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw23_3 	        ( .din  ( d[92]  ),                                     .dout ( pw23[3] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw23_2 	        ( .din  ( d[95]  ),                                     .dout ( pw23[2] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw23_1 	        ( .din  ( d[94]  ),                                     .dout ( pw23[1] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw23_0 	           ( .din0 ( d[92]  ), .din1 ( d[93]  ),                   .dout ( pw23[0] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw22_3 	           ( .din0 ( d[88]  ), .din1 ( d[91]  ),                   .dout ( pw22[3] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw22_2 	           ( .din0 ( d[90]  ), .din1 ( d[91]  ),                   .dout ( pw22[2] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw22_1 	           ( .din0 ( d[89]  ), .din1 ( d[90]  ),                   .dout ( pw22[1] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw22_0 	        ( .din  ( d[89]  ),                                     .dout ( pw22[0] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw21_3 	           ( .din0 ( d[85]  ), .din1 ( d[86]  ), .din2 ( d[87]  ), .dout ( pw21[3] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw21_2 	           ( .din0 ( d[84]  ), .din1 ( d[85]  ), .din2 ( d[86]  ), .dout ( pw21_2  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw21_2_2 	           ( .din0 ( pw21_2 ), .din1 ( d[87]  ),                   .dout ( pw21[2] ));
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw21_1 	           ( .din0 ( d[84]  ), .din1 ( d[85]  ), .din2 ( d[86]  ), .dout ( pw21[1] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw21_0 	           ( .din0 ( d[84]  ), .din1 ( d[86]  ), .din2 ( d[87]  ), .dout ( pw21[0] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw20_3 	           ( .din0 ( d[81]  ), .din1 ( d[82]  ),                   .dout ( pw20[3] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw20_2 	           ( .din0 ( d[80]  ), .din1 ( d[81]  ), .din2 ( d[83]  ), .dout ( pw20[2] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw20_1 	           ( .din0 ( d[80]  ), .din1 ( d[82]  ),                   .dout ( pw20[1] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw20_0 	           ( .din0 ( d[82]  ), .din1 ( d[83]  ),                   .dout ( pw20[0] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw19_3 	           ( .din0 ( d[77]  ), .din1 ( d[79]  ),                   .dout ( pw19[3] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw19_2 	           ( .din0 ( d[76]  ), .din1 ( d[78]  ), .din2 ( d[79]  ), .dout ( pw19[2] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw19_1 	           ( .din0 ( d[77]  ), .din1 ( d[78]  ), .din2 ( d[79]  ), .dout ( pw19[1] ));	   
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw19_0 	           ( .din0 ( d[76]  ), .din1 ( d[78]  ),                   .dout ( pw19[0] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw18_3 	        ( .din  ( d[73]  ),                                     .dout ( pw18[3] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw18_2 	           ( .din0 ( d[72]  ), .din1 ( d[75]  ),                   .dout ( pw18[2] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw18_1 	           ( .din0 ( d[74]  ), .din1 ( d[75]  ),                   .dout ( pw18[1] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw18_0 	        ( .din  ( d[74]  ),                                     .dout ( pw18[0] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw17_3 	           ( .din0 ( d[70]  ), .din1 ( d[71]  ),                   .dout ( pw17[3] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw17_2 	           ( .din0 ( d[69]  ), .din1 ( d[70]  ),                   .dout ( pw17[2] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw17_1 	           ( .din0 ( d[68]  ), .din1 ( d[69]  ), .din2 ( d[71]  ), .dout ( pw17[1] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw17_0 	           ( .din0 ( d[68]  ), .din1 ( d[71]  ),                   .dout ( pw17[0] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw16_3 	        ( .din  ( d[66]  ),                                     .dout ( pw16[3] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw16_2 	        ( .din  ( d[65]  ),                                     .dout ( pw16[2] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw16_1 	           ( .din0 ( d[64]  ), .din1 ( d[67]  ),                   .dout ( pw16[1] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw16_0 	        ( .din  ( d[67]  ),                                     .dout ( pw16[0] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw14_3 	           ( .din0 ( d[56]  ), .din1 ( d[57]  ), .din2 ( d[58]  ), .dout ( pw14[3] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw14_2 	           ( .din0 ( d[56]  ), .din1 ( d[57]  ),                   .dout ( pw14[2] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw14_1 	        ( .din  ( d[56]  ),                                     .dout ( pw14[1] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw14_0 	           ( .din0 ( d[56]  ), .din1 ( d[57]  ), .din2 ( d[58]  ), .dout ( pw14_0  ));
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw14_0_1 	           ( .din0 ( pw14_0 ), .din1 ( d[59]  ),                   .dout ( pw14[0] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw13_3 	           ( .din0 ( d[52]  ), .din1 ( d[53]  ), .din2 ( d[54]  ), .dout ( pw13_3  ));
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw13_3_1 	           ( .din0 ( pw13_3 ), .din1 ( d[55]  ),                   .dout ( pw13[3] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw13_2 	           ( .din0 ( d[52]  ), .din1 ( d[53]  ), .din2 ( d[54]  ), .dout ( pw13[2] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw13_1 	           ( .din0 ( d[52]  ), .din1 ( d[53]  ),                   .dout ( pw13[1] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw13_0 	           ( .din0 ( d[53]  ), .din1 ( d[54]  ), .din2 ( d[55]  ), .dout ( pw13[0] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw12_3 	           ( .din0 ( d[48]  ), .din1 ( d[49]  ),                   .dout ( pw12[3] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw12_2 	        ( .din  ( d[48]  ),                                     .dout ( pw12[2] ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw12_1 	        ( .din  ( d[51]  ),                                     .dout ( pw12[1] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw12_0 	           ( .din0 ( d[48]  ), .din1 ( d[49]  ), .din2 ( d[50]  ), .dout ( pw12[0] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw11_3 	           ( .din0 ( d[44]  ), .din1 ( d[45]  ), .din2 ( d[47]  ), .dout ( pw11[3] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw11_2 	           ( .din0 ( d[44]  ), .din1 ( d[46]  ),                   .dout ( pw11[2] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw11_1 	           ( .din0 ( d[45]  ), .din1 ( d[47]  ),                   .dout ( pw11[1] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw11_0 	           ( .din0 ( d[45]  ), .din1 ( d[46]  ),                   .dout ( pw11[0] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw10_3 	           ( .din0 ( d[40]  ), .din1 ( d[42]  ),                   .dout ( pw10[3] ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw10_2 	           ( .din0 ( d[43]  ), .din1 ( d[41]  ),                   .dout ( pw10[2] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw10_1 	           ( .din0 ( d[40]  ), .din1 ( d[42]  ), .din2 ( d[43]  ), .dout ( pw10[1] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw10_0 	           ( .din0 ( d[40]  ), .din1 ( d[41]  ), .din2 ( d[43]  ), .dout ( pw10[0] ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw9_3 	           ( .din0 ( d[36]  ), .din1 ( d[38]  ), .din2 ( d[39]  ), .dout ( pw9[3]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw9_2 	           ( .din0 ( d[37]  ), .din1 ( d[38]  ), .din2 ( d[39]  ), .dout ( pw9[2]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw9_1 	           ( .din0 ( d[36]  ), .din1 ( d[37]  ), .din2 ( d[38]  ), .dout ( pw9_1   ));
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw9_1_1 	           ( .din0 ( pw9_1  ), .din1 ( d[39]  ),                   .dout ( pw9[1]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw9_0 	           ( .din0 ( d[37]  ), .din1 ( d[39]  ),                   .dout ( pw9[0]  ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw8_3 	        ( .din  ( d[32]  ),                                     .dout ( pw8[3]  ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw8_2 	        ( .din  ( d[35]  ),                                     .dout ( pw8[2]  ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw8_1 	        ( .din  ( d[34]  ),                                     .dout ( pw8[1]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw8_0 	           ( .din0 ( d[33]  ), .din1 ( d[32]  ),                   .dout ( pw8[0]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw7_3 	           ( .din0 ( d[28]  ), .din1 ( d[31]  ),                   .dout ( pw7[3]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw7_2 	           ( .din0 ( d[31]  ), .din1 ( d[30]  ),                   .dout ( pw7[2]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw7_1 	           ( .din0 ( d[30]  ), .din1 ( d[29]  ),                   .dout ( pw7[1]  ));	   
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw7_0 	        ( .din  ( d[29]  ),                                     .dout ( pw7[0]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw6_3 	           ( .din0 ( d[25]  ), .din1 ( d[26]  ), .din2 ( d[27]  ), .dout ( pw6[3]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw6_2 	           ( .din0 ( d[24]  ), .din1 ( d[25]  ), .din2 ( d[26]  ), .dout ( pw6_2   ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw6_2_1 	           ( .din0 ( pw6_2  ), .din1 ( d[27]  ),                   .dout ( pw6[2]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw6_1 	           ( .din0 ( d[24]  ), .din1 ( d[25]  ), .din2 ( d[26]  ), .dout ( pw6[1]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw6_0 	           ( .din0 ( d[24]  ), .din1 ( d[26]  ), .din2 ( d[27]  ), .dout ( pw6[0]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw5_3 	           ( .din0 ( d[21]  ), .din1 ( d[22]  ),                   .dout ( pw5[3]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw5_2 	           ( .din0 ( d[20]  ), .din1 ( d[21]  ), .din2 ( d[23]  ), .dout ( pw5[2]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw5_1 	           ( .din0 ( d[20]  ), .din1 ( d[22]  ),                   .dout ( pw5[1]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw5_0 	           ( .din0 ( d[22]  ), .din1 ( d[23]  ),                   .dout ( pw5[0]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw4_3 	           ( .din0 ( d[17]  ), .din1 ( d[19]  ),                   .dout ( pw4[3]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw4_2 	           ( .din0 ( d[16]  ), .din1 ( d[18]  ), .din2 ( d[19]  ), .dout ( pw4[2]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw4_1 	           ( .din0 ( d[17]  ), .din1 ( d[18]  ), .din2 ( d[19]  ), .dout ( pw4[1]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw4_0 	           ( .din0 ( d[16]  ), .din1 ( d[18]  ),                   .dout ( pw4[0]  ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw3_3 	        ( .din  ( d[13]  ),                                     .dout ( pw3[3]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw3_2 	           ( .din0 ( d[12]  ), .din1 ( d[15]  ),                   .dout ( pw3[2]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw3_1 	           ( .din0 ( d[15]  ), .din1 ( d[14]  ),                   .dout ( pw3[1]  ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw3_0 	        ( .din  ( d[14]  ),                                     .dout ( pw3[0]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw2_3 	           ( .din0 ( d[10]  ), .din1 ( d[11]  ),                   .dout ( pw2[3]  ));	  
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw2_2 	           ( .din0 ( d[9]   ), .din1 ( d[10]  ),                   .dout ( pw2[2]  ));	  
mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1	u_pw2_1 	           ( .din0 ( d[8]   ), .din1 ( d[11]  ), .din2 ( d[9]   ), .dout ( pw2[1]  ));	 
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw2_0 	           ( .din0 ( d[8]   ), .din1 ( d[11]  ),                   .dout ( pw2[0]  ));	  
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw1_3 	        ( .din  ( d[6]   ),                                     .dout ( pw1[3]  ));	 
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw1_2 	        ( .din  ( d[5]   ),                                     .dout ( pw1[2]  ));	 
mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1	u_pw1_1 	           ( .din0 ( d[4]   ), .din1 ( d[7]   ),                   .dout ( pw1[1]  ));	 
mcu_nibcor_dp_buff_macro__stack_1l__width_1	u_pw1_0 	        ( .din  ( d[7]   ),                                     .dout ( pw1[0]  ));	 


mcu_nibcor_dp_buff_macro__stack_56l__width_56	u_pw_buf_29_16	       ( 
                                  .din  ( { pw29, pw28, pw27, pw26, pw25, pw24, pw23, pw22, pw21, pw20, pw19, pw18, pw17, pw16 } ),
				  .dout ( result[111:56] ));

mcu_nibcor_dp_buff_macro__stack_56l__width_56	u_pw_buf_14_1 	       ( 
                                  .din  ( {  pw14, pw13, pw12, pw11, pw10, pw9, pw8, pw7, pw6, pw5, pw4, pw3, pw2, pw1 } ),
				  .dout ( result[55:0] ));   

// assign result = { pw29, pw28, pw27, pw26, pw25, pw24, pw23, pw22, pw21, pw20, pw19, pw18, pw17, pw16, 
// 	    	     pw14, pw13, pw12, pw11, pw10, pw9, pw8, pw7, pw6, pw5, pw4, pw3, pw2, pw1};

endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_nibcor_dp_mux_macro__mux_pgpe__ports_2__stack_4c__width_4 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [3:0] din0;
  input [3:0] din1;
  input sel0;
  output [3:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(4)  d0_0 (
  .sel(psel1),
  .in0(din0[3:0]),
  .in1(din1[3:0]),
.dout(dout[3:0])
);









  



endmodule


//
//   invert macro
//
//





module mcu_nibcor_dp_inv_macro__stack_1l__width_1 (
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
//   xor macro for ports = 2,3
//
//





module mcu_nibcor_dp_xor_macro__ports_3__stack_1l__width_1 (
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





module mcu_nibcor_dp_xor_macro__ports_2__stack_1l__width_1 (
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





module mcu_nibcor_dp_buff_macro__stack_1l__width_1 (
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





module mcu_nibcor_dp_buff_macro__stack_56l__width_56 (
  din, 
  dout);
  input [55:0] din;
  output [55:0] dout;






buff #(56)  d0_0 (
.in(din[55:0]),
.out(dout[55:0])
);








endmodule




