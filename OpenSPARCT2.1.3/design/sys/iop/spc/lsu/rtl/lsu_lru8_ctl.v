// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_lru8_ctl.v
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
module lsu_lru8_ctl (
  l1clk, 
  scan_in, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  request, 
  enable, 
  select);
wire siclk;
wire soclk;
wire dff_lru_scanin;
wire dff_lru_scanout;
wire nlru0_7;
wire nlru0_3;
wire nlru4_7;
wire nlru0_1;
wire nlru2_3;
wire nlru4_5;
wire nlru6_7;
wire lru0_7;
wire lru0_3;
wire lru4_7;
wire lru0_1;
wire lru2_3;
wire lru4_5;
wire lru6_7;
wire pick_0123;
wire pick_4567;
wire pick_01;
wire pick_23;
wire pick_45;
wire pick_67;
wire pick_0;
wire pick_1;
wire pick_2;
wire pick_3;
wire pick_4;
wire pick_5;
wire pick_6;
wire pick_7;


input		l1clk;
input 		scan_in;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input	[7:0]	request;
input	[7:0]	enable;

output	[7:0]	select;

// scan renames
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

////////////////////////////////////////////////////////////////////////////////
// Pseudo-LRU picker to choose the oldest thread for issuing to pcx.
// The picker uses a binary tree to track age.
// lru0_1 -> 0=#0 is newer, 1=#1 is newer
// lru2_3 -> 0=#2 is newer, 1=#3 is newer
// lru0_3 -> 0={0,1} is newer, 1={2,3} is newer
// lru4_7 -> 0={4,5} is newer, 1={6,7} is newer
// lru0_7 -> 0={0,1,2,3} is newer, 1={4,5,6,7} is newer
// The state updates every time an entry is written.  The "least recently written"
// as determined by tracing the tree has priority.
////////////////////////////////////////////////////////////////////////////////

lsu_lru8_ctl_msff_ctl_macro__width_7 dff_lru  (
	.scan_in(dff_lru_scanin),
	.scan_out(dff_lru_scanout),
	.din	({nlru0_7,nlru0_3,nlru4_7,nlru0_1,nlru2_3,nlru4_5,nlru6_7}),
	.dout	({ lru0_7, lru0_3, lru4_7, lru0_1, lru2_3, lru4_5, lru6_7}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pick_0123 = (|request[3:0]) & ( lru0_7 | ~(|request[7:4]));
assign pick_4567 = (|request[7:4]) & (~lru0_7 | ~(|request[3:0]));
assign pick_01 = (|request[1:0]) & ( lru0_3 | ~(|request[3:2]));
assign pick_23 = (|request[3:2]) & (~lru0_3 | ~(|request[1:0]));
assign pick_45 = (|request[5:4]) & ( lru4_7 | ~(|request[7:6]));
assign pick_67 = (|request[7:6]) & (~lru4_7 | ~(|request[5:4]));
assign pick_0 = request[0] & ( lru0_1 | ~request[1]);
assign pick_1 = request[1] & (~lru0_1 | ~request[0]);
assign pick_2 = request[2] & ( lru2_3 | ~request[3]);
assign pick_3 = request[3] & (~lru2_3 | ~request[2]);
assign pick_4 = request[4] & ( lru4_5 | ~request[5]);
assign pick_5 = request[5] & (~lru4_5 | ~request[4]);
assign pick_6 = request[6] & ( lru6_7 | ~request[7]);
assign pick_7 = request[7] & (~lru6_7 | ~request[6]);

assign select[0] = pick_0123 & pick_01 & pick_0;
assign select[1] = pick_0123 & pick_01 & pick_1;
assign select[2] = pick_0123 & pick_23 & pick_2;
assign select[3] = pick_0123 & pick_23 & pick_3;
assign select[4] = pick_4567 & pick_45 & pick_4;
assign select[5] = pick_4567 & pick_45 & pick_5;
assign select[6] = pick_4567 & pick_67 & pick_6;
assign select[7] = pick_4567 & pick_67 & pick_7;

assign nlru0_1 = enable[1] | (~enable[0] & lru0_1);
assign nlru2_3 = enable[3] | (~enable[2] & lru2_3);
assign nlru4_5 = enable[5] | (~enable[4] & lru4_5);
assign nlru6_7 = enable[7] | (~enable[6] & lru6_7);
assign nlru0_3 = (enable[2] | enable[3]) | (~(enable[0] | enable[1]) & lru0_3);
assign nlru4_7 = (enable[6] | enable[7]) | (~(enable[4] | enable[5]) & lru4_7);
assign nlru0_7 = (enable[4] | enable[5] | enable[6] | enable[7]) |
                 (~(enable[0] | enable[1] | enable[2] | enable[3]) &
                   lru0_7);


supply0 vss;
supply1 vdd;
// fixscan start:
assign dff_lru_scanin            = scan_in                  ;
assign scan_out                  = dff_lru_scanout          ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module lsu_lru8_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule








