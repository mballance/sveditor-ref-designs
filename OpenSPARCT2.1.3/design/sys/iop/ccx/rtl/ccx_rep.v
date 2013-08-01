// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccx_rep.v
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
module ccx_rep (
  rep_out, 
  rep_in);

output [11:0] rep_out;

input [11:0]  rep_in;

cl_dp1_rep_m6_32x i0(
                  .in (rep_in[0]),
                  .out(rep_out[0]));

cl_dp1_rep_m6_32x i1(
                  .in (rep_in[1]),
                  .out(rep_out[1]));

cl_dp1_rep_m6_32x i2(
                  .in (rep_in[2]),
                  .out(rep_out[2]));

cl_dp1_rep_m6_32x i3(
                  .in (rep_in[3]),
                  .out(rep_out[3]));

cl_dp1_rep_m6_32x i4(
                  .in (rep_in[4]),
                  .out(rep_out[4]));

cl_dp1_rep_m6_32x i5(
                  .in (rep_in[5]),
                  .out(rep_out[5]));

cl_dp1_rep_m6_32x i6(
                  .in (rep_in[6]),
                  .out(rep_out[6]));

cl_dp1_rep_m6_32x i7(
                  .in (rep_in[7]),
                  .out(rep_out[7]));

cl_dp1_rep_m6_32x i8(
                  .in (rep_in[8]),
                  .out(rep_out[8]));

cl_dp1_rep_m6_32x i9(
                  .in (rep_in[9]),
                  .out(rep_out[9]));

cl_dp1_rep_m6_32x i10(
                  .in (rep_in[10]),
                  .out(rep_out[10]));

cl_dp1_rep_m6_32x i11(
                  .in (rep_in[11]),
                  .out(rep_out[11]));


endmodule // ccx_rep








