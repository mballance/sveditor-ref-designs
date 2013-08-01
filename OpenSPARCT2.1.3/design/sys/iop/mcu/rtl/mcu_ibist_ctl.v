// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_ibist_ctl.v
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
module mcu_ibist_ctl (
  ibist_txdata, 
  ibtx_done, 
  ibrx_done, 
  ibrx_rxerrstat, 
  ibrx_errcnt, 
  ibrx_errlnnum, 
  ibrx_errstat, 
  fbdic_sbfibportctl, 
  fbdic_sbfibpgctl, 
  fbdic_sbfibpattbuf1, 
  fbdic_sbfibtxmsk, 
  fbdic_sbfibtxshft, 
  fbdic_sbfibpattbuf2, 
  fbdic_sbfibpatt2en, 
  fbdic_txstart, 
  fbdic_nbfibportctl, 
  fbdic_nbfibpgctl, 
  fbdic_nbfibpattbuf1, 
  fbdic_nbfibrxmsk, 
  fbdic_nbfibrxshft, 
  fbdic_nbfibrxlnerr, 
  fbdic_nbfibpattbuf2, 
  fbdic_nbfibpatt2en, 
  fbdic_rxstart, 
  fbdic_ibrx_start_ld, 
  fbdic_nbfibportctl_en, 
  fbdic_errcnt_clr, 
  fbdic_errstat_clr, 
  ibist_rxdata, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire u_ibtx_scanin;
wire u_ibtx_scanout;
wire u_ibrx_scanin;
wire u_ibrx_scanout;


output	[119:0]	ibist_txdata;
output		ibtx_done;

output		ibrx_done;
output	[13:0]	ibrx_rxerrstat;
output	[9:0]	ibrx_errcnt;
output	[3:0]	ibrx_errlnnum;
output	[1:0]	ibrx_errstat;

input	[23:0]	fbdic_sbfibportctl;
input	[31:0]	fbdic_sbfibpgctl;
input	[23:0]	fbdic_sbfibpattbuf1;
input	[9:0]	fbdic_sbfibtxmsk;
input	[9:0]	fbdic_sbfibtxshft;
input	[23:0]	fbdic_sbfibpattbuf2;
input	[9:0]	fbdic_sbfibpatt2en;
input		fbdic_txstart;

input	[23:0]	fbdic_nbfibportctl;
input	[31:0]	fbdic_nbfibpgctl;
input	[23:0]	fbdic_nbfibpattbuf1;
input	[13:0]	fbdic_nbfibrxmsk;
input	[13:0]	fbdic_nbfibrxshft;
input	[13:0]	fbdic_nbfibrxlnerr;
input	[23:0]	fbdic_nbfibpattbuf2;
input	[13:0]	fbdic_nbfibpatt2en;
input		fbdic_rxstart;

input		fbdic_ibrx_start_ld;
input		fbdic_nbfibportctl_en;
input	[9:0]	fbdic_errcnt_clr;
input	[1:0]	fbdic_errstat_clr;

input	[167:0]	ibist_rxdata;

input        l1clk ;
input        scan_in ;
output       scan_out ;

input        tcu_aclk ;
input        tcu_bclk ;
input        tcu_scan_en ;

// Code
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

mcu_ibtx_ctl u_ibtx (
	.scan_in(u_ibtx_scanin),
	.scan_out(u_ibtx_scanout),
	.l1clk(l1clk),
  .ibist_txdata(ibist_txdata[119:0]),
  .ibtx_done(ibtx_done),
  .fbdic_sbfibportctl(fbdic_sbfibportctl[23:0]),
  .fbdic_sbfibpgctl(fbdic_sbfibpgctl[31:0]),
  .fbdic_sbfibpattbuf1(fbdic_sbfibpattbuf1[23:0]),
  .fbdic_sbfibtxmsk(fbdic_sbfibtxmsk[9:0]),
  .fbdic_sbfibtxshft(fbdic_sbfibtxshft[9:0]),
  .fbdic_sbfibpattbuf2(fbdic_sbfibpattbuf2[23:0]),
  .fbdic_sbfibpatt2en(fbdic_sbfibpatt2en[9:0]),
  .fbdic_txstart(fbdic_txstart),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
      );

mcu_ibrx_ctl u_ibrx (
	.scan_in(u_ibrx_scanin),
	.scan_out(u_ibrx_scanout),
	.l1clk(l1clk),
  .ibrx_done(ibrx_done),
  .ibrx_rxerrstat(ibrx_rxerrstat[13:0]),
  .ibrx_errcnt(ibrx_errcnt[9:0]),
  .ibrx_errlnnum(ibrx_errlnnum[3:0]),
  .ibrx_errstat(ibrx_errstat[1:0]),
  .fbdic_nbfibportctl(fbdic_nbfibportctl[23:0]),
  .fbdic_nbfibpgctl(fbdic_nbfibpgctl[31:0]),
  .fbdic_nbfibpattbuf1(fbdic_nbfibpattbuf1[23:0]),
  .fbdic_nbfibrxmsk(fbdic_nbfibrxmsk[13:0]),
  .fbdic_nbfibrxshft(fbdic_nbfibrxshft[13:0]),
  .fbdic_nbfibrxlnerr(fbdic_nbfibrxlnerr[13:0]),
  .fbdic_nbfibpattbuf2(fbdic_nbfibpattbuf2[23:0]),
  .fbdic_nbfibpatt2en(fbdic_nbfibpatt2en[13:0]),
  .fbdic_rxstart(fbdic_rxstart),
  .fbdic_ibrx_start_ld(fbdic_ibrx_start_ld),
  .fbdic_nbfibportctl_en(fbdic_nbfibportctl_en),
  .fbdic_errcnt_clr(fbdic_errcnt_clr[9:0]),
  .fbdic_errstat_clr(fbdic_errstat_clr[1:0]),
  .ibist_rxdata(ibist_rxdata[167:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
      );

// fixscan start:
assign u_ibtx_scanin             = scan_in                  ;
assign u_ibrx_scanin             = u_ibtx_scanout           ;
assign scan_out                  = u_ibrx_scanout           ;
// fixscan end:
endmodule



// any PARAMS parms go into naming of macro

module mcu_ibist_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_ibist_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_ibist_ctl_msff_ctl_macro__width_7 (
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













// any PARAMS parms go into naming of macro

module mcu_ibist_ctl_msff_ctl_macro__width_2 (
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













// any PARAMS parms go into naming of macro

module mcu_ibist_ctl_msff_ctl_macro (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_ibist_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_ibist_ctl_msff_ctl_macro__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);


endmodule




// any PARAMS parms go into naming of macro

module mcu_ibist_ctl_msff_ctl_macro__width_14 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [13:0] fdin;
wire [12:0] so;

  input [13:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [13:0] dout;
  output scan_out;
assign fdin[13:0] = din[13:0];






dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);












endmodule








