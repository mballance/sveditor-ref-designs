// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_rptr_m79h_59.v
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
module n2_rptr_m79h_59 (
in,
out
);
input   [59:0] in;
output  [59:0] out;

`ifdef LIB
//assign out[59:0] = in[59:0];
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

`endif

endmodule
