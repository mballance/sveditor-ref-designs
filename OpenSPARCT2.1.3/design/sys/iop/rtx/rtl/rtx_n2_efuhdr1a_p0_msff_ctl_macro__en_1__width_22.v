// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rtx_n2_efuhdr1a_p0_msff_ctl_macro__en_1__width_22.v
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





// any PARAMS parms go into naming of macro

module rtx_n2_efuhdr1a_p0_msff_ctl_macro__en_1__width_22 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [21:1] sout;

  input [ 21 : 0 ] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [ 21 : 0 ] dout;
  output scan_out;
assign fdin[ 21 : 0 ] = (din[ 21 : 0 ] & {22{en}}) | (dout[ 21 : 0 ] & ~{22{en}});








    







cl_a1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 0 ]),
.si(sout[ 1 ]),
.so(scan_out),
.q(dout[ 0 ])
);
cl_a1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 1 ]),
.si(sout[ 2 ]),
.so(sout[ 1 ]),
.q(dout[ 1 ])
);
cl_a1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 2 ]),
.si(sout[ 3 ]),
.so(sout[ 2 ]),
.q(dout[ 2 ])
);
cl_a1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 3 ]),
.si(sout[ 4 ]),
.so(sout[ 3 ]),
.q(dout[ 3 ])
);
cl_a1_msff_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 4 ]),
.si(sout[ 5 ]),
.so(sout[ 4 ]),
.q(dout[ 4 ])
);
cl_a1_msff_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 5 ]),
.si(sout[ 6 ]),
.so(sout[ 5 ]),
.q(dout[ 5 ])
);
cl_a1_msff_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 6 ]),
.si(sout[ 7 ]),
.so(sout[ 6 ]),
.q(dout[ 6 ])
);
cl_a1_msff_4x d0_7 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 7 ]),
.si(sout[ 8 ]),
.so(sout[ 7 ]),
.q(dout[ 7 ])
);
cl_a1_msff_4x d0_8 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 8 ]),
.si(sout[ 9 ]),
.so(sout[ 8 ]),
.q(dout[ 8 ])
);
cl_a1_msff_4x d0_9 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 9 ]),
.si(sout[ 10 ]),
.so(sout[ 9 ]),
.q(dout[ 9 ])
);
cl_a1_msff_4x d0_10 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 10 ]),
.si(sout[ 11 ]),
.so(sout[ 10 ]),
.q(dout[ 10 ])
);
cl_a1_msff_4x d0_11 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 11 ]),
.si(sout[ 12 ]),
.so(sout[ 11 ]),
.q(dout[ 11 ])
);
cl_a1_msff_4x d0_12 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 12 ]),
.si(sout[ 13 ]),
.so(sout[ 12 ]),
.q(dout[ 12 ])
);
cl_a1_msff_4x d0_13 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 13 ]),
.si(sout[ 14 ]),
.so(sout[ 13 ]),
.q(dout[ 13 ])
);
cl_a1_msff_4x d0_14 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 14 ]),
.si(sout[ 15 ]),
.so(sout[ 14 ]),
.q(dout[ 14 ])
);
cl_a1_msff_4x d0_15 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 15 ]),
.si(sout[ 16 ]),
.so(sout[ 15 ]),
.q(dout[ 15 ])
);
cl_a1_msff_4x d0_16 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 16 ]),
.si(sout[ 17 ]),
.so(sout[ 16 ]),
.q(dout[ 16 ])
);
cl_a1_msff_4x d0_17 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 17 ]),
.si(sout[ 18 ]),
.so(sout[ 17 ]),
.q(dout[ 17 ])
);
cl_a1_msff_4x d0_18 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 18 ]),
.si(sout[ 19 ]),
.so(sout[ 18 ]),
.q(dout[ 18 ])
);
cl_a1_msff_4x d0_19 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 19 ]),
.si(sout[ 20 ]),
.so(sout[ 19 ]),
.q(dout[ 19 ])
);
cl_a1_msff_4x d0_20 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 20 ]),
.si(sout[ 21 ]),
.so(sout[ 20 ]),
.q(dout[ 20 ])
);
cl_a1_msff_4x d0_21 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 21 ]),
.si(scan_in),
.so(sout[ 21 ]),
.q(dout[ 21 ])
);




endmodule








