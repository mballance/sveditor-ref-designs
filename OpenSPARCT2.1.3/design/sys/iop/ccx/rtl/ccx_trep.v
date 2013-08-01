// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccx_trep.v
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
module ccx_trep (
  cpu_rep_out, 
  cpu_rep_in);

output [191:0] cpu_rep_out;

input [191:0]  cpu_rep_in;

ccx_rep i0(
           .rep_out(cpu_rep_out[11:0]),
           .rep_in(cpu_rep_in[11:0]));

ccx_rep i1(
           .rep_out(cpu_rep_out[23:12]),
           .rep_in(cpu_rep_in[23:12]));

ccx_rep i2(
           .rep_out(cpu_rep_out[35:24]),
           .rep_in(cpu_rep_in[35:24]));

ccx_rep i3(
           .rep_out(cpu_rep_out[47:36]),
           .rep_in(cpu_rep_in[47:36]));

ccx_rep i4(
           .rep_out(cpu_rep_out[59:48]),
           .rep_in(cpu_rep_in[59:48]));

ccx_rep i5(
           .rep_out(cpu_rep_out[71:60]),
           .rep_in(cpu_rep_in[71:60]));

ccx_rep i6(
           .rep_out(cpu_rep_out[83:72]),
           .rep_in(cpu_rep_in[83:72]));

ccx_rep i7(
           .rep_out(cpu_rep_out[95:84]),
           .rep_in(cpu_rep_in[95:84]));

ccx_rep i8(
           .rep_out(cpu_rep_out[107:96]),
           .rep_in(cpu_rep_in[107:96]));

ccx_rep i9(
           .rep_out(cpu_rep_out[119:108]),
           .rep_in(cpu_rep_in[119:108]));

ccx_rep i10(
           .rep_out(cpu_rep_out[131:120]),
           .rep_in(cpu_rep_in[131:120]));

ccx_rep i11(
           .rep_out(cpu_rep_out[143:132]),
           .rep_in(cpu_rep_in[143:132]));

ccx_rep i12(
           .rep_out(cpu_rep_out[155:144]),
           .rep_in(cpu_rep_in[155:144]));

ccx_rep i13(
           .rep_out(cpu_rep_out[167:156]),
           .rep_in(cpu_rep_in[167:156]));

ccx_rep i14(
           .rep_out(cpu_rep_out[179:168]),
           .rep_in(cpu_rep_in[179:168]));

ccx_rep i15(
           .rep_out(cpu_rep_out[191:180]),
           .rep_in(cpu_rep_in[191:180]));

endmodule // ccx_trep


