// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_bnksm_ctl.v
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
module mcu_bnksm_ctl (
  rcd_cnt_is_zero, 
  rc_cnt_is_zero, 
  dal_cnt_is_zero, 
  drif_abnk_ras_picked, 
  drif_abnk_cas_picked, 
  drif_bcbnk_ras_picked, 
  drif_bcbnk_cas_picked, 
  drif_cmd_picked_d1, 
  rcd_reg, 
  rc_reg, 
  dal_reg, 
  ral_reg, 
  fbdic_sync_frame_req_l, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire drif_bnk_ras_picked;
wire drif_bnk_cas_picked;
wire [3:0] rcd_cnt_next;
wire [3:0] rcd_cnt;
wire ff_rcd_cnt_scanin;
wire ff_rcd_cnt_scanout;
wire [4:0] rc_cnt_next;
wire [4:0] rc_cnt;
wire ff_rc_cnt_scanin;
wire ff_rc_cnt_scanout;
wire [4:0] dal_cnt_next;
wire [4:0] dal_cnt;
wire ff_dal_cnt_scanin;
wire ff_dal_cnt_scanout;


output		rcd_cnt_is_zero;
output		rc_cnt_is_zero;
output		dal_cnt_is_zero;

input		drif_abnk_ras_picked;
input		drif_abnk_cas_picked;
input		drif_bcbnk_ras_picked;
input		drif_bcbnk_cas_picked;
input		drif_cmd_picked_d1;
input	[3:0]	rcd_reg;
input	[4:0]	rc_reg;
input	[4:0]	dal_reg;
input	[4:0]	ral_reg;
input		fbdic_sync_frame_req_l;

input 		l1clk;
input 		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

// Code
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

assign drif_bnk_ras_picked = drif_abnk_ras_picked | drif_bcbnk_ras_picked;
assign drif_bnk_cas_picked = drif_abnk_cas_picked | drif_bcbnk_cas_picked;

//////////////////////////////////////////////////////////////////
// mcu bank SM
//////////////////////////////////////////////////////////////////

// ras to cas delay timer
assign rcd_cnt_next[3:0] = drif_bnk_ras_picked & fbdic_sync_frame_req_l ? rcd_reg[3:0] - 4'h1 : 
			(rcd_cnt[3:0] == 4'h0) ?  4'h0 : rcd_cnt[3:0] - 4'h1;

mcu_bnksm_ctl_msff_ctl_macro__width_4 ff_rcd_cnt  (
        .scan_in(ff_rcd_cnt_scanin),
        .scan_out(ff_rcd_cnt_scanout),
        .din(rcd_cnt_next[3:0]),
        .dout(rcd_cnt[3:0]),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rcd_cnt_is_zero = (rcd_cnt[3:0] == 4'h0);

// ras to ras (bankA to bankA) delay timer
assign rc_cnt_next[4:0] = drif_bnk_ras_picked & fbdic_sync_frame_req_l ? rc_reg[4:0] : 
			(rc_cnt[4:0] == 5'h0) ? 5'h0 : rc_cnt[4:0] - 5'h1;

mcu_bnksm_ctl_msff_ctl_macro__width_5	ff_rc_cnt  (
        .scan_in(ff_rc_cnt_scanin),
        .scan_out(ff_rc_cnt_scanout),
        .din(rc_cnt_next[4:0]),
        .dout(rc_cnt[4:0]),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rc_cnt_is_zero = (rc_cnt[4:0] == 5'h0);

// read/write to ras (DAL) delay timer
assign dal_cnt_next[4:0] = drif_bnk_cas_picked & fbdic_sync_frame_req_l ? 
				((drif_cmd_picked_d1 & drif_abnk_cas_picked | drif_bcbnk_cas_picked) ? 
					dal_reg[4:0] : ral_reg[4:0]) : 
				((dal_cnt[4:0] == 5'h0) ? 5'h0 : dal_cnt[4:0] - 5'h1);

mcu_bnksm_ctl_msff_ctl_macro__width_5 ff_dal_cnt  (
	.scan_in(ff_dal_cnt_scanin),
	.scan_out(ff_dal_cnt_scanout),
	.din(dal_cnt_next[4:0]),
	.dout(dal_cnt[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign dal_cnt_is_zero = (dal_cnt[4:0] == 5'h0);

// fixscan start:
assign ff_rcd_cnt_scanin         = scan_in                  ;
assign ff_rc_cnt_scanin          = ff_rcd_cnt_scanout       ;
assign ff_dal_cnt_scanin         = ff_rc_cnt_scanout        ;
assign scan_out                  = ff_dal_cnt_scanout       ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_bnksm_ctl_msff_ctl_macro__width_4 (
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

module mcu_bnksm_ctl_msff_ctl_macro__width_5 (
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








