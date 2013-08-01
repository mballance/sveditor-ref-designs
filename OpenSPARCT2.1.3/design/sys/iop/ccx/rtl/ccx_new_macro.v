// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccx_new_macro.v
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
module ccx_new_macro_ccx_new_macro (
  l2clk, 
  l1clk, 
  pce0, 
  pce1, 
  pce_ov, 
  se, 
  stop, 
  siclk_in, 
  soclk_in, 
  scan_in, 
  grant_a, 
  qsel0, 
  shift, 
  data_a, 
  data_x_l, 
  scan_out);
wire so5;
wire siclk_out;
wire soclk_out;
wire l1clk0;
wire l1clk1;
wire grant_x;
wire qsel0_buf;
wire shift_buf;

input l2clk;
input l1clk;
input pce0;
input pce1;
input pce_ov;
input se;
input stop;
input siclk_in;
input soclk_in;
input scan_in;
input grant_a;
input qsel0;
input shift;
input [9:0] data_a;
output [9:0] data_x_l;
output       scan_out;
cl_dp1_ccxhdr c0 (			
.si(scan_in),    			
.so(so5),
  .l2clk(l2clk),
  .pce0(pce0),
  .pce1(pce1),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_in(siclk_in),
  .soclk_in(soclk_in),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out),
  .l1clk0(l1clk0),
  .l1clk1(l1clk1),
  .se(se),
  .l1clk(l1clk),
  .grant_a(grant_a),
  .grant_x(grant_x),
  .qsel0(qsel0),
  .qsel0_buf(qsel0_buf),
  .shift(shift),
  .shift_buf(shift_buf)    				
);					






ccx_mac_a #(10)  mac_a(
.siclk(siclk_out),			
.soclk(soclk_out),			
.data_a(data_a[9:0]),			
.data_x_l(data_x_l[9:0]),		
.si(so5),                         	
.so(scan_out),
  .l1clk0(l1clk0),
  .l1clk1(l1clk1),
  .grant_x(grant_x),
  .qsel0_buf(qsel0_buf),
  .shift_buf(shift_buf)		
);














endmodule




