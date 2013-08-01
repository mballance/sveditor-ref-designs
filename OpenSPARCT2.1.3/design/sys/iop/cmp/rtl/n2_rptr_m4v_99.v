// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_rptr_m4v_99.v
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
module n2_rptr_m4v_99 (
in,
out
);
input   [98:0] in;
output  [98:0] out;

`ifdef LIB
//assign out[98:0] = in[98:0];
buf (out[0], in[0]);
buf (out[1], in[1]);
buf (out[2], in[2]);
buf (out[3], in[3]);
buf (out[4], in[4]);
buf (out[5], in[5]);
buf (out[6], in[6]);
buf (out[7], in[7]);
buf (out[8], in[8]);
buf (out[9], in[9]);
buf (out[10], in[10]);
buf (out[11], in[11]);
buf (out[12], in[12]);
buf (out[13], in[13]);
buf (out[14], in[14]);
buf (out[15], in[15]);
buf (out[16], in[16]);
buf (out[17], in[17]);
buf (out[18], in[18]);
buf (out[19], in[19]);
buf (out[20], in[20]);
buf (out[21], in[21]);
buf (out[22], in[22]);
buf (out[23], in[23]);
buf (out[24], in[24]);
buf (out[25], in[25]);
buf (out[26], in[26]);
buf (out[27], in[27]);
buf (out[28], in[28]);
buf (out[29], in[29]);
buf (out[30], in[30]);
buf (out[31], in[31]);
buf (out[32], in[32]);
buf (out[33], in[33]);
buf (out[34], in[34]);
buf (out[35], in[35]);
buf (out[36], in[36]);
buf (out[37], in[37]);
buf (out[38], in[38]);
buf (out[39], in[39]);
buf (out[40], in[40]);
buf (out[41], in[41]);
buf (out[42], in[42]);
buf (out[43], in[43]);
buf (out[44], in[44]);
buf (out[45], in[45]);
buf (out[46], in[46]);
buf (out[47], in[47]);
buf (out[48], in[48]);
buf (out[49], in[49]);
buf (out[50], in[50]);
buf (out[51], in[51]);
buf (out[52], in[52]);
buf (out[53], in[53]);
buf (out[54], in[54]);
buf (out[55], in[55]);
buf (out[56], in[56]);
buf (out[57], in[57]);
buf (out[58], in[58]);
buf (out[59], in[59]);
buf (out[60], in[60]);
buf (out[61], in[61]);
buf (out[62], in[62]);
buf (out[63], in[63]);
buf (out[64], in[64]);
buf (out[65], in[65]);
buf (out[66], in[66]);
buf (out[67], in[67]);
buf (out[68], in[68]);
buf (out[69], in[69]);
buf (out[70], in[70]);
buf (out[71], in[71]);
buf (out[72], in[72]);
buf (out[73], in[73]);
buf (out[74], in[74]);
buf (out[75], in[75]);
buf (out[76], in[76]);
buf (out[77], in[77]);
buf (out[78], in[78]);
buf (out[79], in[79]);
buf (out[80], in[80]);
buf (out[81], in[81]);
buf (out[82], in[82]);
buf (out[83], in[83]);
buf (out[84], in[84]);
buf (out[85], in[85]);
buf (out[86], in[86]);
buf (out[87], in[87]);
buf (out[88], in[88]);
buf (out[89], in[89]);
buf (out[90], in[90]);
buf (out[91], in[91]);
buf (out[92], in[92]);
buf (out[93], in[93]);
buf (out[94], in[94]);
buf (out[95], in[95]);
buf (out[96], in[96]);
buf (out[97], in[97]);
buf (out[98], in[98]);
`endif

endmodule
