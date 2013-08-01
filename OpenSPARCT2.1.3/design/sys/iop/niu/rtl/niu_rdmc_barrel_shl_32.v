// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_barrel_shl_32.v
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
module niu_rdmc_barrel_shl_32 (din,shift,dout);

output [15:0] dout;   
input  [15:0] din;
input  [3:0]  shift; 

wire   [15:0] temp_s1 = shift[0] ? {din[14:0],    1'b0} :din[15:0];
wire   [15:0] temp_s2 = shift[1] ? {temp_s1[13:0],2'b0} :temp_s1[15:0];
wire   [15:0] temp_s3 = shift[2] ? {temp_s2[11:0],4'b0} :temp_s2[15:0];
wire   [15:0] dout    = shift[3] ? {temp_s3[7:0],8'b0}  :temp_s3[15:0];
 
endmodule
