// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: gkt_pqm_ctl.v
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
module gkt_pqm_ctl (
  l1clk, 
  scan_in, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  pqm_req_drop, 
  pqm_empty, 
  spc_pcx_req_pq, 
  pcx_grant);
wire siclk;
wire soclk;
wire [1:0] qcnt_inc;
wire [1:0] qcnt;
wire [1:0] qcnt_dec;
wire qfull;
wire incr;
wire decr;
wire hold;
wire [1:0] qcnt_next;
wire dff_qcnt_scanin;
wire dff_qcnt_scanout;


// globals
input           l1clk;
input           scan_in;
input           spc_aclk;
input           spc_bclk;
output          scan_out;

output pqm_req_drop;
output pqm_empty;


input spc_pcx_req_pq;
input pcx_grant;

// scan renames
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan


////////////////////////////////////////////////////////
// keep track of ccx fifo
// l15 can send 2 requests followed by a 3rd speculative req.
// If a grant is not seen in the cycle when 3rd req is launched,
// then it is dropped by ccx, and l15 has to resend it.

assign qcnt_inc[1:0] = qcnt[1:0] + 2'b01;
assign qcnt_dec[1:0] = (qcnt[1:0] == 2'b00)? 2'b00: (qcnt[1:0] - 2'b01);

assign qfull = qcnt[1];
assign pqm_empty = ~qcnt[1] & ~qcnt[0];

// do not increment if qfull, the req is going to get dropped.

assign incr = spc_pcx_req_pq & ~qfull & ~pcx_grant;
assign decr = ~spc_pcx_req_pq & pcx_grant;
assign hold = ~incr & ~decr;
//assign qcnt_next[1:0] = incr? qcnt_inc[1:0]: decr ? qcnt_dec[1:0] : qcnt[1:0];

assign qcnt_next[1:0] = ({2{incr}} & qcnt_inc[1:0]) |
                        ({2{decr}} & qcnt_dec[1:0]) |
                        ({2{hold}} & qcnt[1:0]);

// pcx_grant is a very late signal.
//


// 0in overflow -var qcnt_next[1:0] -min 0 -max 2

assign pqm_req_drop = qcnt[1] & spc_pcx_req_pq & ~pcx_grant;

gkt_pqm_ctl_msff_ctl_macro__width_2 dff_qcnt
  (
   .scan_in(dff_qcnt_scanin),
   .scan_out(dff_qcnt_scanout),
   .din           (qcnt_next[1:0]),
   .dout             (qcnt[1:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// fixscan start:
assign dff_qcnt_scanin           = scan_in                  ;
assign scan_out                  = dff_qcnt_scanout         ;
// fixscan end:
endmodule // gkt_pqm_ctl






// any PARAMS parms go into naming of macro

module gkt_pqm_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule








