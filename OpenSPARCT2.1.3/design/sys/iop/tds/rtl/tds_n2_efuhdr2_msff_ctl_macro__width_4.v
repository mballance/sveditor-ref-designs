// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tds_n2_efuhdr2_msff_ctl_macro__width_4.v
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

module tds_n2_efuhdr2_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [3:1] sout;

  input [ 3 : 0 ] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [ 3 : 0 ] dout;
  output scan_out;
assign fdin[ 3 : 0 ] = din[ 3 : 0 ];








    







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
.si(scan_in),
.so(sout[ 3 ]),
.q(dout[ 3 ])
);




endmodule








