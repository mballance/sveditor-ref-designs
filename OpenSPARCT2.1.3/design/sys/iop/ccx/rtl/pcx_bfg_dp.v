// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcx_bfg_dp.v
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
`ifndef FPGA
module pcx_bfg_dp (
  pcx_spc_grant_px, 
  pcx_spc_grant_pa, 
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  ccx_aclk, 
  ccx_bclk, 
  scan_out, 
  ccx_aclk_out, 
  ccx_bclk_out, 
  tcu_pce_ov_out, 
  tcu_scan_en_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire i_dff_grant_x_scanin;
wire i_dff_grant_x_scanout;
wire [13:0] pcx_spc_grant_x;
wire scan_out_prebuf;


output [13:0] pcx_spc_grant_px;

input [13:0] pcx_spc_grant_pa;

// globals
input tcu_scan_en ;
input           l2clk;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           ccx_aclk;
input           ccx_bclk;
output          scan_out;

// buffer the high fanout nets
output          ccx_aclk_out;
output          ccx_bclk_out;
output          tcu_pce_ov_out;
output          tcu_scan_en_out;

// scan renames
assign pce_ov = tcu_pce_ov_out;
assign stop = 1'b0;
assign siclk = ccx_aclk_out;
assign soclk = ccx_bclk_out;
assign se = tcu_scan_en_out ;
// end scan

pcx_bfg_dp_buff_macro__dbuff_8x__stack_none__width_4 buf_hfn    (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_out,ccx_bclk_out,tcu_pce_ov_out,tcu_scan_en_out})
);


pcx_bfg_dp_msff_macro__stack_14r__width_14 i_dff_grant_x   (
	.scan_in(i_dff_grant_x_scanin),
	.scan_out(i_dff_grant_x_scanout),
	.clk	(l2clk),
	.din	(pcx_spc_grant_pa[13:0]),
	.dout	(pcx_spc_grant_x[13:0]),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

pcx_bfg_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_14 i_buf_grant_x     (
	.din	(pcx_spc_grant_x[13:0]),
	.dout	(pcx_spc_grant_px[13:0])
);

pcx_bfg_dp_buff_macro__dbuff_8x__stack_none__width_1 buf_scanout    (
	.din	(scan_out_prebuf),
	.dout	(scan_out)
);

// fixscan start:
assign i_dff_grant_x_scanin      = scan_in                  ;
assign scan_out_prebuf                  = i_dff_grant_x_scanout    ;
// fixscan end:
endmodule // pcx_bfc_dp


//
//   buff macro
//
//





module pcx_bfg_dp_buff_macro__dbuff_8x__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module pcx_bfg_dp_msff_macro__stack_14r__width_14 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [12:0] so;

  input [13:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [13:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);




















endmodule









//
//   buff macro
//
//





module pcx_bfg_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_14 (
  din, 
  dout);
  input [13:0] din;
  output [13:0] dout;






buff #(14)  d0_0 (
.in(din[13:0]),
.out(dout[13:0])
);








endmodule





//
//   buff macro
//
//





module pcx_bfg_dp_buff_macro__dbuff_8x__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule

`endif // `ifndef FPGA

`ifdef FPGA
`timescale 1 ns / 100 ps
module pcx_bfg_dp(pcx_spc_grant_px, pcx_spc_grant_pa, tcu_scan_en, l2clk, 
	scan_in, tcu_pce_ov, ccx_aclk, ccx_bclk, scan_out, ccx_aclk_out, 
	ccx_bclk_out, tcu_pce_ov_out, tcu_scan_en_out);

	output	[13:0]		pcx_spc_grant_px;
	input	[13:0]		pcx_spc_grant_pa;
	input			tcu_scan_en;
	input			l2clk;
	input			scan_in;
	input			tcu_pce_ov;
	input			ccx_aclk;
	input			ccx_bclk;
	output			scan_out;
	output			ccx_aclk_out;
	output			ccx_bclk_out;
	output			tcu_pce_ov_out;
	output			tcu_scan_en_out;

	wire			pce_ov;
	wire			stop;
	wire			siclk;
	wire			soclk;
	wire			se;
	wire			i_dff_grant_x_scanin;
	wire			i_dff_grant_x_scanout;
	wire	[13:0]		pcx_spc_grant_x;
	wire			scan_out_prebuf;

	assign pce_ov = tcu_pce_ov_out;
	assign stop = 1'b0;
	assign siclk = ccx_aclk_out;
	assign soclk = ccx_bclk_out;
	assign se = tcu_scan_en_out;
	assign i_dff_grant_x_scanin = scan_in;
	assign scan_out_prebuf = i_dff_grant_x_scanout;

	buff_macro__dbuff_8x__stack_none__width_4 buf_hfn(
		.din				({ccx_aclk, ccx_bclk,
		tcu_pce_ov, tcu_scan_en}), 
		.dout				({ccx_aclk_out, ccx_bclk_out,
		tcu_pce_ov_out, tcu_scan_en_out}));
	msff_macro__stack_14r__width_14 i_dff_grant_x(
		.scan_in			(i_dff_grant_x_scanin), 
		.scan_out			(i_dff_grant_x_scanout), 
		.clk				(l2clk), 
		.din				(pcx_spc_grant_pa[13:0]), 
		.dout				(pcx_spc_grant_x[13:0]), 
		.en				(1'b1), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	buff_macro__dbuff_32x__rep_1__stack_none__width_14 i_buf_grant_x(
		.din				(pcx_spc_grant_x[13:0]), 
		.dout				(pcx_spc_grant_px[13:0]));
	buff_macro__dbuff_8x__stack_none__width_1 buf_scanout(
		.din				(scan_out_prebuf), 
		.dout				(scan_out));
endmodule

module buff_macro__dbuff_32x__rep_1__stack_none__width_14(din, dout);

        input   [13:0]          din;
        output  [13:0]          dout;

        buff #(14) d0_0(
                .in                             (din[13:0]),
                .out                            (dout[13:0]));
endmodule

module msff_macro__stack_14r__width_14(din, clk, en, se, scan_in, siclk, soclk,
        pce_ov, stop, dout, scan_out);

        input   [13:0]          din;
        input                   clk;
        input                   en;
        input                   se;
        input                   scan_in;
        input                   siclk;
        input                   soclk;
        input                   pce_ov;
        input                   stop;
        output  [13:0]          dout;
        output                  scan_out;

        wire                    l1clk;
        wire                    siclk_out;
        wire                    soclk_out;
        wire    [12:0]          so;

        cl_dp1_l1hdr_8x c0_0(
                .l2clk                          (clk),
                .pce                            (en),
                .aclk                           (siclk),
                .bclk                           (soclk),
                .l1clk                          (l1clk),
                .se                             (se),
                .pce_ov                         (pce_ov),
                .stop                           (stop),
                .siclk_out                      (siclk_out),
                .soclk_out                      (soclk_out));
        dff #(14) d0_0(
                .l1clk                          (l1clk),
                .siclk                          (siclk_out),
                .soclk                          (soclk_out),
                .d                              (din[13:0]),
                .si                             ({scan_in, so[12:0]}),
                .so                             ({so[12:0], scan_out}),
                .q                              (dout[13:0]));
endmodule


`endif // `ifdef FPGA

