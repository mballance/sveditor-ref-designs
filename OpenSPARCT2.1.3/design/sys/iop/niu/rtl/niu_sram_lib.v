// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_sram_lib.v
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

// George: from Carlos's 11/12/2004 emails


module niu_sram_msff_ctl_macro__width_9 (

  din,
  l1clk,
  scan_in,
  siclk,
  soclk,
  dout,
  scan_out
);

  wire [8:0] fdin;
  wire [8:1] sout;

  input [8:0] din;
  input l1clk;
  

  input scan_in;
  input siclk;
  input soclk;
  output [8:0] dout;
  output scan_out;
  assign fdin[8:0] = din[8:0];

cl_sc1_msff_4x d0_0 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[0]),
    .si(sout[1]),
    .so(scan_out),
    .q(dout[0])
  );

cl_sc1_msff_4x d0_1 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[1]),
    .si(sout[2]),
    .so(sout[1]),
    .q(dout[1])
  );

cl_sc1_msff_4x d0_2 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[2]),
    .si(sout[3]),
    .so(sout[2]),
    .q(dout[2])
  );

cl_sc1_msff_4x d0_3 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[3]),
    .si(sout[4]),
    .so(sout[3]),
    .q(dout[3])
  );

cl_sc1_msff_4x d0_4 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[4]),
    .si(sout[5]),
    .so(sout[4]),
    .q(dout[4])
  );

cl_sc1_msff_4x d0_5 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[5]),
    .si(sout[6]),
    .so(sout[5]),
    .q(dout[5])
  );

cl_sc1_msff_4x d0_6 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[6]),
    .si(sout[7]),
    .so(sout[6]),
    .q(dout[6])
  );

cl_sc1_msff_4x d0_7 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[7]),
    .si(sout[8]),
    .so(sout[7]),
    .q(dout[7])
  );

cl_sc1_msff_4x d0_8 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[8]),
    .si(scan_in),
    .so(sout[8]),
    .q(dout[8])
  );

endmodule



module niu_sram_msff_ctl_macro__width_14 (

  din,
  l1clk,
  scan_in,
  siclk,
  soclk,
  dout,
  scan_out
);

  wire [13:0] fdin;
  wire [13:1] sout;

  input [13:0] din;
  input l1clk;
  

  input scan_in;
  input siclk;
  input soclk;
  output [13:0] dout;
  output scan_out;
  assign fdin[13:0] = din[13:0];

cl_sc1_msff_4x d0_0 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[0]),
    .si(sout[1]),
    .so(scan_out),
    .q(dout[0])
  );

cl_sc1_msff_4x d0_1 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[1]),
    .si(sout[2]),
    .so(sout[1]),
    .q(dout[1])
  );

cl_sc1_msff_4x d0_2 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[2]),
    .si(sout[3]),
    .so(sout[2]),
    .q(dout[2])
  );

cl_sc1_msff_4x d0_3 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[3]),
    .si(sout[4]),
    .so(sout[3]),
    .q(dout[3])
  );

cl_sc1_msff_4x d0_4 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[4]),
    .si(sout[5]),
    .so(sout[4]),
    .q(dout[4])
  );

cl_sc1_msff_4x d0_5 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[5]),
    .si(sout[6]),
    .so(sout[5]),
    .q(dout[5])
  );

cl_sc1_msff_4x d0_6 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[6]),
    .si(sout[7]),
    .so(sout[6]),
    .q(dout[6])
  );

cl_sc1_msff_4x d0_7 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[7]),
    .si(sout[8]),
    .so(sout[7]),
    .q(dout[7])
  );

cl_sc1_msff_4x d0_8 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[8]),
    .si(sout[9]),
    .so(sout[8]),
    .q(dout[8])
  );

cl_sc1_msff_4x d0_9 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[9]),
    .si(sout[10]),
    .so(sout[9]),
    .q(dout[9])
  );

cl_sc1_msff_4x d0_10 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[10]),
    .si(sout[11]),
    .so(sout[10]),
    .q(dout[10])
  );

cl_sc1_msff_4x d0_11 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[11]),
    .si(sout[12]),
    .so(sout[11]),
    .q(dout[11])
  );

cl_sc1_msff_4x d0_12 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[12]),
    .si(sout[13]),
    .so(sout[12]),
    .q(dout[12])
  );

cl_sc1_msff_4x d0_13 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[13]),
    .si(scan_in),
    .so(sout[13]),
    .q(dout[13])
  );

endmodule



module niu_sram_msff_ctl_macro__width_18 (

  din,
  l1clk,
  scan_in,
  siclk,
  soclk,
  dout,
  scan_out
);

  wire [17:0] fdin;
  wire [17:1] sout;

  input [17:0] din;
  input l1clk;
  

  input scan_in;
  input siclk;
  input soclk;
  output [17:0] dout;
  output scan_out;
  assign fdin[17:0] = din[17:0];

cl_sc1_msff_4x d0_0 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[0]),
    .si(sout[1]),
    .so(scan_out),
    .q(dout[0])
  );

cl_sc1_msff_4x d0_1 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[1]),
    .si(sout[2]),
    .so(sout[1]),
    .q(dout[1])
  );

cl_sc1_msff_4x d0_2 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[2]),
    .si(sout[3]),
    .so(sout[2]),
    .q(dout[2])
  );

cl_sc1_msff_4x d0_3 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[3]),
    .si(sout[4]),
    .so(sout[3]),
    .q(dout[3])
  );

cl_sc1_msff_4x d0_4 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[4]),
    .si(sout[5]),
    .so(sout[4]),
    .q(dout[4])
  );

cl_sc1_msff_4x d0_5 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[5]),
    .si(sout[6]),
    .so(sout[5]),
    .q(dout[5])
  );

cl_sc1_msff_4x d0_6 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[6]),
    .si(sout[7]),
    .so(sout[6]),
    .q(dout[6])
  );

cl_sc1_msff_4x d0_7 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[7]),
    .si(sout[8]),
    .so(sout[7]),
    .q(dout[7])
  );

cl_sc1_msff_4x d0_8 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[8]),
    .si(sout[9]),
    .so(sout[8]),
    .q(dout[8])
  );

cl_sc1_msff_4x d0_9 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[9]),
    .si(sout[10]),
    .so(sout[9]),
    .q(dout[9])
  );

cl_sc1_msff_4x d0_10 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[10]),
    .si(sout[11]),
    .so(sout[10]),
    .q(dout[10])
  );

cl_sc1_msff_4x d0_11 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[11]),
    .si(sout[12]),
    .so(sout[11]),
    .q(dout[11])
  );

cl_sc1_msff_4x d0_12 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[12]),
    .si(sout[13]),
    .so(sout[12]),
    .q(dout[12])
  );

cl_sc1_msff_4x d0_13 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[13]),
    .si(sout[14]),
    .so(sout[13]),
    .q(dout[13])
  );

cl_sc1_msff_4x d0_14 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[14]),
    .si(sout[15]),
    .so(sout[14]),
    .q(dout[14])
  );

cl_sc1_msff_4x d0_15 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[15]),
    .si(sout[16]),
    .so(sout[15]),
    .q(dout[15])
  );

cl_sc1_msff_4x d0_16 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[16]),
    .si(sout[17]),
    .so(sout[16]),
    .q(dout[16])
  );

cl_sc1_msff_4x d0_17 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[17]),
    .si(scan_in),
    .so(sout[17]),
    .q(dout[17])
  );

endmodule



module niu_sram_msff_ctl_macro__width_20 (

  din,
  l1clk,
  scan_in,
  siclk,
  soclk,
  dout,
  scan_out
);

  wire [19:0] fdin;
  wire [19:1] sout;

  input [19:0] din;
  input l1clk;
  

  input scan_in;
  input siclk;
  input soclk;
  output [19:0] dout;
  output scan_out;
  assign fdin[19:0] = din[19:0];

cl_sc1_msff_4x d0_0 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[0]),
    .si(sout[1]),
    .so(scan_out),
    .q(dout[0])
  );

cl_sc1_msff_4x d0_1 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[1]),
    .si(sout[2]),
    .so(sout[1]),
    .q(dout[1])
  );

cl_sc1_msff_4x d0_2 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[2]),
    .si(sout[3]),
    .so(sout[2]),
    .q(dout[2])
  );

cl_sc1_msff_4x d0_3 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[3]),
    .si(sout[4]),
    .so(sout[3]),
    .q(dout[3])
  );

cl_sc1_msff_4x d0_4 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[4]),
    .si(sout[5]),
    .so(sout[4]),
    .q(dout[4])
  );

cl_sc1_msff_4x d0_5 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[5]),
    .si(sout[6]),
    .so(sout[5]),
    .q(dout[5])
  );

cl_sc1_msff_4x d0_6 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[6]),
    .si(sout[7]),
    .so(sout[6]),
    .q(dout[6])
  );

cl_sc1_msff_4x d0_7 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[7]),
    .si(sout[8]),
    .so(sout[7]),
    .q(dout[7])
  );

cl_sc1_msff_4x d0_8 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[8]),
    .si(sout[9]),
    .so(sout[8]),
    .q(dout[8])
  );

cl_sc1_msff_4x d0_9 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[9]),
    .si(sout[10]),
    .so(sout[9]),
    .q(dout[9])
  );

cl_sc1_msff_4x d0_10 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[10]),
    .si(sout[11]),
    .so(sout[10]),
    .q(dout[10])
  );

cl_sc1_msff_4x d0_11 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[11]),
    .si(sout[12]),
    .so(sout[11]),
    .q(dout[11])
  );

cl_sc1_msff_4x d0_12 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[12]),
    .si(sout[13]),
    .so(sout[12]),
    .q(dout[12])
  );

cl_sc1_msff_4x d0_13 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[13]),
    .si(sout[14]),
    .so(sout[13]),
    .q(dout[13])
  );

cl_sc1_msff_4x d0_14 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[14]),
    .si(sout[15]),
    .so(sout[14]),
    .q(dout[14])
  );

cl_sc1_msff_4x d0_15 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[15]),
    .si(sout[16]),
    .so(sout[15]),
    .q(dout[15])
  );

cl_sc1_msff_4x d0_16 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[16]),
    .si(sout[17]),
    .so(sout[16]),
    .q(dout[16])
  );

cl_sc1_msff_4x d0_17 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[17]),
    .si(sout[18]),
    .so(sout[17]),
    .q(dout[17])
  );

cl_sc1_msff_4x d0_18 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[18]),
    .si(sout[19]),
    .so(sout[18]),
    .q(dout[18])
  );

cl_sc1_msff_4x d0_19 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[19]),
    .si(scan_in),
    .so(sout[19]),
    .q(dout[19])
  );

endmodule



module niu_sram_msff_ctl_macro__width_22 (

  din,
  l1clk,
  scan_in,
  siclk,
  soclk,
  dout,
  scan_out
);

  wire [21:0] fdin;
  wire [21:1] sout;

  input [21:0] din;
  input l1clk;
  

  input scan_in;
  input siclk;
  input soclk;
  output [21:0] dout;
  output scan_out;
  assign fdin[21:0] = din[21:0];

cl_sc1_msff_4x d0_0 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[0]),
    .si(sout[1]),
    .so(scan_out),
    .q(dout[0])
  );

cl_sc1_msff_4x d0_1 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[1]),
    .si(sout[2]),
    .so(sout[1]),
    .q(dout[1])
  );

cl_sc1_msff_4x d0_2 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[2]),
    .si(sout[3]),
    .so(sout[2]),
    .q(dout[2])
  );

cl_sc1_msff_4x d0_3 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[3]),
    .si(sout[4]),
    .so(sout[3]),
    .q(dout[3])
  );

cl_sc1_msff_4x d0_4 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[4]),
    .si(sout[5]),
    .so(sout[4]),
    .q(dout[4])
  );

cl_sc1_msff_4x d0_5 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[5]),
    .si(sout[6]),
    .so(sout[5]),
    .q(dout[5])
  );

cl_sc1_msff_4x d0_6 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[6]),
    .si(sout[7]),
    .so(sout[6]),
    .q(dout[6])
  );

cl_sc1_msff_4x d0_7 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[7]),
    .si(sout[8]),
    .so(sout[7]),
    .q(dout[7])
  );

cl_sc1_msff_4x d0_8 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[8]),
    .si(sout[9]),
    .so(sout[8]),
    .q(dout[8])
  );

cl_sc1_msff_4x d0_9 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[9]),
    .si(sout[10]),
    .so(sout[9]),
    .q(dout[9])
  );

cl_sc1_msff_4x d0_10 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[10]),
    .si(sout[11]),
    .so(sout[10]),
    .q(dout[10])
  );

cl_sc1_msff_4x d0_11 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[11]),
    .si(sout[12]),
    .so(sout[11]),
    .q(dout[11])
  );

cl_sc1_msff_4x d0_12 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[12]),
    .si(sout[13]),
    .so(sout[12]),
    .q(dout[12])
  );

cl_sc1_msff_4x d0_13 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[13]),
    .si(sout[14]),
    .so(sout[13]),
    .q(dout[13])
  );

cl_sc1_msff_4x d0_14 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[14]),
    .si(sout[15]),
    .so(sout[14]),
    .q(dout[14])
  );

cl_sc1_msff_4x d0_15 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[15]),
    .si(sout[16]),
    .so(sout[15]),
    .q(dout[15])
  );

cl_sc1_msff_4x d0_16 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[16]),
    .si(sout[17]),
    .so(sout[16]),
    .q(dout[16])
  );

cl_sc1_msff_4x d0_17 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[17]),
    .si(sout[18]),
    .so(sout[17]),
    .q(dout[17])
  );

cl_sc1_msff_4x d0_18 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[18]),
    .si(sout[19]),
    .so(sout[18]),
    .q(dout[18])
  );

cl_sc1_msff_4x d0_19 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[19]),
    .si(sout[20]),
    .so(sout[19]),
    .q(dout[19])
  );

cl_sc1_msff_4x d0_20 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[20]),
    .si(sout[21]),
    .so(sout[20]),
    .q(dout[20])
  );

cl_sc1_msff_4x d0_21 (

    .l1clk(l1clk),
    .siclk(siclk),
    .soclk(soclk),
    .d(fdin[21]),
    .si(scan_in),
    .so(sout[21]),
    .q(dout[21])
  );


endmodule



module niu_sram_msff_ctl_macro__width_152 (

  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [151:0] fdin;
wire [151:1] sout;

  input [151:0] din;
  input l1clk;


  input scan_in;
  input siclk;
  input soclk;

  output [151:0] dout;
  output scan_out;
assign fdin[151:0] = din[151:0];








    







mb1_cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.q(dout[0])
);
mb1_cl_sc1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.q(dout[1])
);
mb1_cl_sc1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.q(dout[2])
);
mb1_cl_sc1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(sout[4]),
.so(sout[3]),
.q(dout[3])
);
mb1_cl_sc1_msff_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4]),
.si(sout[5]),
.so(sout[4]),
.q(dout[4])
);
mb1_cl_sc1_msff_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5]),
.si(sout[6]),
.so(sout[5]),
.q(dout[5])
);
mb1_cl_sc1_msff_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6]),
.si(sout[7]),
.so(sout[6]),
.q(dout[6])
);
mb1_cl_sc1_msff_4x d0_7 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7]),
.si(sout[8]),
.so(sout[7]),
.q(dout[7])
);
mb1_cl_sc1_msff_4x d0_8 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8]),
.si(sout[9]),
.so(sout[8]),
.q(dout[8])
);
mb1_cl_sc1_msff_4x d0_9 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9]),
.si(sout[10]),
.so(sout[9]),
.q(dout[9])
);
mb1_cl_sc1_msff_4x d0_10 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10]),
.si(sout[11]),
.so(sout[10]),
.q(dout[10])
);
mb1_cl_sc1_msff_4x d0_11 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11]),
.si(sout[12]),
.so(sout[11]),
.q(dout[11])
);
mb1_cl_sc1_msff_4x d0_12 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12]),
.si(sout[13]),
.so(sout[12]),
.q(dout[12])
);
mb1_cl_sc1_msff_4x d0_13 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13]),
.si(sout[14]),
.so(sout[13]),
.q(dout[13])
);
mb1_cl_sc1_msff_4x d0_14 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14]),
.si(sout[15]),
.so(sout[14]),
.q(dout[14])
);
mb1_cl_sc1_msff_4x d0_15 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15]),
.si(sout[16]),
.so(sout[15]),
.q(dout[15])
);
mb1_cl_sc1_msff_4x d0_16 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[16]),
.si(sout[17]),
.so(sout[16]),
.q(dout[16])
);
mb1_cl_sc1_msff_4x d0_17 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17]),
.si(sout[18]),
.so(sout[17]),
.q(dout[17])
);
mb1_cl_sc1_msff_4x d0_18 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[18]),
.si(sout[19]),
.so(sout[18]),
.q(dout[18])
);
mb1_cl_sc1_msff_4x d0_19 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19]),
.si(sout[20]),
.so(sout[19]),
.q(dout[19])
);





mb1_cl_sc1_msff_4x d0_20 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[20]),
.si(sout[21]),
.so(sout[20]),
.q(dout[20])
);
mb1_cl_sc1_msff_4x d0_21 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21]),
.si(sout[22]),
.so(sout[21]),
.q(dout[21])
);
mb1_cl_sc1_msff_4x d0_22 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[22]),
.si(sout[23]),
.so(sout[22]),
.q(dout[22])
);
mb1_cl_sc1_msff_4x d0_23 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23]),
.si(sout[24]),
.so(sout[23]),
.q(dout[23])
);
mb1_cl_sc1_msff_4x d0_24 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[24]),
.si(sout[25]),
.so(sout[24]),
.q(dout[24])
);
mb1_cl_sc1_msff_4x d0_25 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[25]),
.si(sout[26]),
.so(sout[25]),
.q(dout[25])
);
mb1_cl_sc1_msff_4x d0_26 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[26]),
.si(sout[27]),
.so(sout[26]),
.q(dout[26])
);
mb1_cl_sc1_msff_4x d0_27 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[27]),
.si(sout[28]),
.so(sout[27]),
.q(dout[27])
);
mb1_cl_sc1_msff_4x d0_28 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[28]),
.si(sout[29]),
.so(sout[28]),
.q(dout[28])
);
mb1_cl_sc1_msff_4x d0_29 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[29]),
.si(sout[30]),
.so(sout[29]),
.q(dout[29])
);


mb1_cl_sc1_msff_4x d0_30 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[30]),
.si(sout[31]),
.so(sout[30]),
.q(dout[30])
);
mb1_cl_sc1_msff_4x d0_31 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31]),
.si(sout[32]),
.so(sout[31]),
.q(dout[31])
);
mb1_cl_sc1_msff_4x d0_32 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[32]),
.si(sout[33]),
.so(sout[32]),
.q(dout[32])
);
mb1_cl_sc1_msff_4x d0_33 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[33]),
.si(sout[34]),
.so(sout[33]),
.q(dout[33])
);
mb1_cl_sc1_msff_4x d0_34 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[34]),
.si(sout[35]),
.so(sout[34]),
.q(dout[34])
);
mb1_cl_sc1_msff_4x d0_35 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[35]),
.si(sout[36]),
.so(sout[35]),
.q(dout[35])
);
mb1_cl_sc1_msff_4x d0_36 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[36]),
.si(sout[37]),
.so(sout[36]),
.q(dout[36])
);
mb1_cl_sc1_msff_4x d0_37 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[37]),
.si(sout[38]),
.so(sout[37]),
.q(dout[37])
);
mb1_cl_sc1_msff_4x d0_38 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[38]),
.si(sout[39]),
.so(sout[38]),
.q(dout[38])
);
mb1_cl_sc1_msff_4x d0_39 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[39]),
.si(sout[40]),
.so(sout[39]),
.q(dout[39])
);









mb1_cl_sc1_msff_4x d0_40 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[40]),
.si(sout[41]),
.so(sout[40]),
.q(dout[40])
);
mb1_cl_sc1_msff_4x d0_41 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[41]),
.si(sout[42]),
.so(sout[41]),
.q(dout[41])
);
mb1_cl_sc1_msff_4x d0_42 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[42]),
.si(sout[43]),
.so(sout[42]),
.q(dout[42])
);
mb1_cl_sc1_msff_4x d0_43 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[43]),
.si(sout[44]),
.so(sout[43]),
.q(dout[43])
);
mb1_cl_sc1_msff_4x d0_44 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[44]),
.si(sout[45]),
.so(sout[44]),
.q(dout[44])
);
mb1_cl_sc1_msff_4x d0_45 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[45]),
.si(sout[46]),
.so(sout[45]),
.q(dout[45])
);
mb1_cl_sc1_msff_4x d0_46 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[46]),
.si(sout[47]),
.so(sout[46]),
.q(dout[46])
);
mb1_cl_sc1_msff_4x d0_47 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[47]),
.si(sout[48]),
.so(sout[47]),
.q(dout[47])
);
mb1_cl_sc1_msff_4x d0_48 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[48]),
.si(sout[49]),
.so(sout[48]),
.q(dout[48])
);
mb1_cl_sc1_msff_4x d0_49 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[49]),
.si(sout[50]),
.so(sout[49]),
.q(dout[49])
);






mb1_cl_sc1_msff_4x d0_50 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[50]),
.si(sout[51]),
.so(sout[50]),
.q(dout[50])
);
mb1_cl_sc1_msff_4x d0_51 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[51]),
.si(sout[52]),
.so(sout[51]),
.q(dout[51])
);
mb1_cl_sc1_msff_4x d0_52 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[52]),
.si(sout[53]),
.so(sout[52]),
.q(dout[52])
);
mb1_cl_sc1_msff_4x d0_53 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[53]),
.si(sout[54]),
.so(sout[53]),
.q(dout[53])
);
mb1_cl_sc1_msff_4x d0_54 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[54]),
.si(sout[55]),
.so(sout[54]),
.q(dout[54])
);
mb1_cl_sc1_msff_4x d0_55 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[55]),
.si(sout[56]),
.so(sout[55]),
.q(dout[55])
);
mb1_cl_sc1_msff_4x d0_56 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[56]),
.si(sout[57]),
.so(sout[56]),
.q(dout[56])
);
mb1_cl_sc1_msff_4x d0_57 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[57]),
.si(sout[58]),
.so(sout[57]),
.q(dout[57])
);
mb1_cl_sc1_msff_4x d0_58 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[58]),
.si(sout[59]),
.so(sout[58]),
.q(dout[58])
);
mb1_cl_sc1_msff_4x d0_59 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[59]),
.si(sout[60]),
.so(sout[59]),
.q(dout[59])
);






mb1_cl_sc1_msff_4x d0_60 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[60]),
.si(sout[61]),
.so(sout[60]),
.q(dout[60])
);
mb1_cl_sc1_msff_4x d0_61 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[61]),
.si(sout[62]),
.so(sout[61]),
.q(dout[61])
);
mb1_cl_sc1_msff_4x d0_62 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[62]),
.si(sout[63]),
.so(sout[62]),
.q(dout[62])
);
mb1_cl_sc1_msff_4x d0_63 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63]),
.si(sout[64]),
.so(sout[63]),
.q(dout[63])
);
mb1_cl_sc1_msff_4x d0_64 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[64]),
.si(sout[65]),
.so(sout[64]),
.q(dout[64])
);
mb1_cl_sc1_msff_4x d0_65 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[65]),
.si(sout[66]),
.so(sout[65]),
.q(dout[65])
);
mb1_cl_sc1_msff_4x d0_66 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[66]),
.si(sout[67]),
.so(sout[66]),
.q(dout[66])
);
mb1_cl_sc1_msff_4x d0_67 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[67]),
.si(sout[68]),
.so(sout[67]),
.q(dout[67])
);
mb1_cl_sc1_msff_4x d0_68 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[68]),
.si(sout[69]),
.so(sout[68]),
.q(dout[68])
);
mb1_cl_sc1_msff_4x d0_69 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[69]),
.si(sout[70]),
.so(sout[69]),
.q(dout[69])
);






mb1_cl_sc1_msff_4x d0_70 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[70]),
.si(sout[71]),
.so(sout[70]),
.q(dout[70])
);
mb1_cl_sc1_msff_4x d0_71 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[71]),
.si(sout[72]),
.so(sout[71]),
.q(dout[71])
);
mb1_cl_sc1_msff_4x d0_72 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[72]),
.si(sout[73]),
.so(sout[72]),
.q(dout[72])
);
mb1_cl_sc1_msff_4x d0_73 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[73]),
.si(sout[74]),
.so(sout[73]),
.q(dout[73])
);
mb1_cl_sc1_msff_4x d0_74 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[74]),
.si(sout[75]),
.so(sout[74]),
.q(dout[74])
);
mb1_cl_sc1_msff_4x d0_75 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[75]),
.si(sout[76]),
.so(sout[75]),
.q(dout[75])
);
mb1_cl_sc1_msff_4x d0_76 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[76]),
.si(sout[77]),
.so(sout[76]),
.q(dout[76])
);
mb1_cl_sc1_msff_4x d0_77 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[77]),
.si(sout[78]),
.so(sout[77]),
.q(dout[77])
);
mb1_cl_sc1_msff_4x d0_78 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[78]),
.si(sout[79]),
.so(sout[78]),
.q(dout[78])
);
mb1_cl_sc1_msff_4x d0_79 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[79]),
.si(sout[80]),
.so(sout[79]),
.q(dout[79])
);






mb1_cl_sc1_msff_4x d0_80 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[80]),
.si(sout[81]),
.so(sout[80]),
.q(dout[80])
);
mb1_cl_sc1_msff_4x d0_81 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[81]),
.si(sout[82]),
.so(sout[81]),
.q(dout[81])
);
mb1_cl_sc1_msff_4x d0_82 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[82]),
.si(sout[83]),
.so(sout[82]),
.q(dout[82])
);
mb1_cl_sc1_msff_4x d0_83 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[83]),
.si(sout[84]),
.so(sout[83]),
.q(dout[83])
);
mb1_cl_sc1_msff_4x d0_84 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[84]),
.si(sout[85]),
.so(sout[84]),
.q(dout[84])
);
mb1_cl_sc1_msff_4x d0_85 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[85]),
.si(sout[86]),
.so(sout[85]),
.q(dout[85])
);
mb1_cl_sc1_msff_4x d0_86 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[86]),
.si(sout[87]),
.so(sout[86]),
.q(dout[86])
);
mb1_cl_sc1_msff_4x d0_87 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[87]),
.si(sout[88]),
.so(sout[87]),
.q(dout[87])
);
mb1_cl_sc1_msff_4x d0_88 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[88]),
.si(sout[89]),
.so(sout[88]),
.q(dout[88])
);
mb1_cl_sc1_msff_4x d0_89 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[89]),
.si(sout[90]),
.so(sout[89]),
.q(dout[89])
);






mb1_cl_sc1_msff_4x d0_90 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[90]),
.si(sout[91]),
.so(sout[90]),
.q(dout[90])
);
mb1_cl_sc1_msff_4x d0_91 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[91]),
.si(sout[92]),
.so(sout[91]),
.q(dout[91])
);
mb1_cl_sc1_msff_4x d0_92 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[92]),
.si(sout[93]),
.so(sout[92]),
.q(dout[92])
);
mb1_cl_sc1_msff_4x d0_93 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[93]),
.si(sout[94]),
.so(sout[93]),
.q(dout[93])
);
mb1_cl_sc1_msff_4x d0_94 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[94]),
.si(sout[95]),
.so(sout[94]),
.q(dout[94])
);
mb1_cl_sc1_msff_4x d0_95 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[95]),
.si(sout[96]),
.so(sout[95]),
.q(dout[95])
);
mb1_cl_sc1_msff_4x d0_96 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[96]),
.si(sout[97]),
.so(sout[96]),
.q(dout[96])
);
mb1_cl_sc1_msff_4x d0_97 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[97]),
.si(sout[98]),
.so(sout[97]),
.q(dout[97])
);
mb1_cl_sc1_msff_4x d0_98 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[98]),
.si(sout[99]),
.so(sout[98]),
.q(dout[98])
);
mb1_cl_sc1_msff_4x d0_99 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[99]),
.si(sout[100]),
.so(sout[99]),
.q(dout[99])
);






mb1_cl_sc1_msff_4x d0_100 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[100]),
.si(sout[101]),
.so(sout[100]),
.q(dout[100])
);
mb1_cl_sc1_msff_4x d0_101 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[101]),
.si(sout[102]),
.so(sout[101]),
.q(dout[101])
);
mb1_cl_sc1_msff_4x d0_102 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[102]),
.si(sout[103]),
.so(sout[102]),
.q(dout[102])
);
mb1_cl_sc1_msff_4x d0_103 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[103]),
.si(sout[104]),
.so(sout[103]),
.q(dout[103])
);
mb1_cl_sc1_msff_4x d0_104 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[104]),
.si(sout[105]),
.so(sout[104]),
.q(dout[104])
);
mb1_cl_sc1_msff_4x d0_105 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[105]),
.si(sout[106]),
.so(sout[105]),
.q(dout[105])
);
mb1_cl_sc1_msff_4x d0_106 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[106]),
.si(sout[107]),
.so(sout[106]),
.q(dout[106])
);
mb1_cl_sc1_msff_4x d0_107 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[107]),
.si(sout[108]),
.so(sout[107]),
.q(dout[107])
);
mb1_cl_sc1_msff_4x d0_108 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[108]),
.si(sout[109]),
.so(sout[108]),
.q(dout[108])
);
mb1_cl_sc1_msff_4x d0_109 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[109]),
.si(sout[110]),
.so(sout[109]),
.q(dout[109])
);






mb1_cl_sc1_msff_4x d0_110 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[110]),
.si(sout[111]),
.so(sout[110]),
.q(dout[110])
);
mb1_cl_sc1_msff_4x d0_111 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[111]),
.si(sout[112]),
.so(sout[111]),
.q(dout[111])
);
mb1_cl_sc1_msff_4x d0_112 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[112]),
.si(sout[113]),
.so(sout[112]),
.q(dout[112])
);
mb1_cl_sc1_msff_4x d0_113 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[113]),
.si(sout[114]),
.so(sout[113]),
.q(dout[113])
);
mb1_cl_sc1_msff_4x d0_114 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[114]),
.si(sout[115]),
.so(sout[114]),
.q(dout[114])
);
mb1_cl_sc1_msff_4x d0_115 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[115]),
.si(sout[116]),
.so(sout[115]),
.q(dout[115])
);
mb1_cl_sc1_msff_4x d0_116 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[116]),
.si(sout[117]),
.so(sout[116]),
.q(dout[116])
);
mb1_cl_sc1_msff_4x d0_117 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[117]),
.si(sout[118]),
.so(sout[117]),
.q(dout[117])
);
mb1_cl_sc1_msff_4x d0_118 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[118]),
.si(sout[119]),
.so(sout[118]),
.q(dout[118])
);
mb1_cl_sc1_msff_4x d0_119 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[119]),
.si(sout[120]),
.so(sout[119]),
.q(dout[119])
);






mb1_cl_sc1_msff_4x d0_120 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[120]),
.si(sout[121]),
.so(sout[120]),
.q(dout[120])
);
mb1_cl_sc1_msff_4x d0_121 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[121]),
.si(sout[122]),
.so(sout[121]),
.q(dout[121])
);
mb1_cl_sc1_msff_4x d0_122 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[122]),
.si(sout[123]),
.so(sout[122]),
.q(dout[122])
);
mb1_cl_sc1_msff_4x d0_123 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[123]),
.si(sout[124]),
.so(sout[123]),
.q(dout[123])
);
mb1_cl_sc1_msff_4x d0_124 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[124]),
.si(sout[125]),
.so(sout[124]),
.q(dout[124])
);
mb1_cl_sc1_msff_4x d0_125 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[125]),
.si(sout[126]),
.so(sout[125]),
.q(dout[125])
);
mb1_cl_sc1_msff_4x d0_126 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[126]),
.si(sout[127]),
.so(sout[126]),
.q(dout[126])
);
mb1_cl_sc1_msff_4x d0_127 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127]),
.si(sout[128]),
.so(sout[127]),
.q(dout[127])
);
mb1_cl_sc1_msff_4x d0_128 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[128]),
.si(sout[129]),
.so(sout[128]),
.q(dout[128])
);
mb1_cl_sc1_msff_4x d0_129 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[129]),
.si(sout[130]),
.so(sout[129]),
.q(dout[129])
);






mb1_cl_sc1_msff_4x d0_130 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[130]),
.si(sout[131]),
.so(sout[130]),
.q(dout[130])
);
mb1_cl_sc1_msff_4x d0_131 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[131]),
.si(sout[132]),
.so(sout[131]),
.q(dout[131])
);
mb1_cl_sc1_msff_4x d0_132 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[132]),
.si(sout[133]),
.so(sout[132]),
.q(dout[132])
);
mb1_cl_sc1_msff_4x d0_133 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[133]),
.si(sout[134]),
.so(sout[133]),
.q(dout[133])
);
mb1_cl_sc1_msff_4x d0_134 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[134]),
.si(sout[135]),
.so(sout[134]),
.q(dout[134])
);
mb1_cl_sc1_msff_4x d0_135 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[135]),
.si(sout[136]),
.so(sout[135]),
.q(dout[135])
);
mb1_cl_sc1_msff_4x d0_136 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[136]),
.si(sout[137]),
.so(sout[136]),
.q(dout[136])
);
mb1_cl_sc1_msff_4x d0_137 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[137]),
.si(sout[138]),
.so(sout[137]),
.q(dout[137])
);
mb1_cl_sc1_msff_4x d0_138 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[138]),
.si(sout[139]),
.so(sout[138]),
.q(dout[138])
);
mb1_cl_sc1_msff_4x d0_139 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[139]),
.si(sout[140]),
.so(sout[139]),
.q(dout[139])
);






mb1_cl_sc1_msff_4x d0_140 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[140]),
.si(sout[141]),
.so(sout[140]),
.q(dout[140])
);
mb1_cl_sc1_msff_4x d0_141 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[141]),
.si(sout[142]),
.so(sout[141]),
.q(dout[141])
);
mb1_cl_sc1_msff_4x d0_142 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[142]),
.si(sout[143]),
.so(sout[142]),
.q(dout[142])
);
mb1_cl_sc1_msff_4x d0_143 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[143]),
.si(sout[144]),
.so(sout[143]),
.q(dout[143])
);
mb1_cl_sc1_msff_4x d0_144 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[144]),
.si(sout[145]),
.so(sout[144]),
.q(dout[144])
);
mb1_cl_sc1_msff_4x d0_145 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[145]),
.si(sout[146]),
.so(sout[145]),
.q(dout[145])
);
mb1_cl_sc1_msff_4x d0_146 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[146]),
.si(sout[147]),
.so(sout[146]),
.q(dout[146])
);
mb1_cl_sc1_msff_4x d0_147 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[147]),
.si(sout[148]),
.so(sout[147]),
.q(dout[147])
);
mb1_cl_sc1_msff_4x d0_148 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[148]),
.si(sout[149]),
.so(sout[148]),
.q(dout[148])
);
mb1_cl_sc1_msff_4x d0_149 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[149]),
.si(sout[150]),
.so(sout[149]),
.q(dout[149])
);




mb1_cl_sc1_msff_4x d0_150 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[150]),
.si(sout[151]),
.so(sout[150]),
.q(dout[150])
);
mb1_cl_sc1_msff_4x d0_151 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[151]),
.si(scan_in),
.so(sout[151]),
.q(dout[151])
);



endmodule
