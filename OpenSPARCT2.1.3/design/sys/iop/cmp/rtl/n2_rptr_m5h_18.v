// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_rptr_m5h_18.v
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
module n2_rptr_m5h_18 (
in,
out
);
input   [17:0] in;
output  [17:0] out;

`ifdef LIB
//assign out[17:0] = in[17:0];
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

`endif

endmodule
