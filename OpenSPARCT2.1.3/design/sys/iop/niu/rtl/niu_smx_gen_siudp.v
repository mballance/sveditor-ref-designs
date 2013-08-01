// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_gen_siudp.v
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

// generate data parity per N2 ras

module niu_smx_gen_siudp(
		data,
		parity
);


input [127:0] data;
output [7:0] parity;

wire [15:0] e0_data={
				data[30], data[28],
				data[26], data[24],
				data[22], data[20],
				data[18], data[16],
				data[14], data[12],
				data[10], data[8],
				data[6], data[4],
				data[2], data[0]
				};
wire [15:0] e1_data={
				data[62], data[60],
				data[58], data[56],
				data[54], data[52],
				data[50], data[48],
				data[46], data[44],
				data[42], data[40],
				data[38], data[36],
				data[34], data[32]
				};
wire [15:0] e2_data={
				data[94], data[92],
				data[90], data[88],
				data[86], data[84],
				data[82], data[80],
				data[78], data[76],
				data[74], data[72],
				data[70], data[68],
				data[66], data[64]
				};
wire [15:0] e3_data={
				data[126], data[124],
				data[122], data[120],
				data[118], data[116],
				data[114], data[112],
				data[110], data[108],
				data[106], data[104],
				data[102], data[100],
				data[98], data[96]
				};

wire [15:0] o0_data={
				data[31], data[29],
				data[27], data[25],
				data[23], data[21],
				data[19], data[17],
				data[15], data[13],
				data[11], data[9],
				data[7], data[5],
				data[3], data[1]
				};
wire [15:0] o1_data={
				data[63], data[61],
				data[59], data[57],
				data[55], data[53],
				data[51], data[49],
				data[47], data[45],
				data[43], data[41],
				data[39], data[37],
				data[35], data[33]
				};
wire [15:0] o2_data={
				data[95], data[93],
				data[91], data[89],
				data[87], data[85],
				data[83], data[81],
				data[79], data[77],
				data[75], data[73],
				data[71], data[69],
				data[67], data[65]
				};
wire [15:0] o3_data={
				data[127], data[125],
				data[123], data[121],
				data[119], data[117],
				data[115], data[113],
				data[111], data[109],
				data[107], data[105],
				data[103], data[101],
				data[99], data[97]
				};


wire [7:0] parity;

assign parity[0]=  ~(^e0_data);
assign parity[2]=  ~(^e1_data);
assign parity[4]=  ~(^e2_data);
assign parity[6]=  ~(^e3_data);

assign parity[1]=  ~(^o0_data);
assign parity[3]=  ~(^o1_data);
assign parity[5]=  ~(^o2_data);
assign parity[7]=  ~(^o3_data);


endmodule
