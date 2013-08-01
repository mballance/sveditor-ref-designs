// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_pdmc_ctl.v
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
module mcu_pdmc_ctl (
  pdmc_pde_pending, 
  pdmc_pdx_pending, 
  pdmc_rank_avail, 
  drq0_pd_mode_rd_incr, 
  drq1_pd_mode_rd_incr, 
  drq0_pd_mode_wr_incr, 
  drq1_pd_mode_wr_incr, 
  drif_pd_mode_scrub_incr, 
  drif_pd_mode_err_incr, 
  woq_pd_mode_wr_err_incr, 
  drq0_pd_mode_rd_decr, 
  drq1_pd_mode_rd_decr, 
  woq_pd_mode_wr_decr, 
  drif_pd_mode_scrub_decr, 
  drif_pd_mode_err_decr, 
  woq_pd_mode_wr_err_decr, 
  drif_pdx_issued, 
  drif_pde_issued, 
  fbdic_l0_state, 
  drif_pdmc_enable, 
  drif_refresh_mode, 
  fbdic_scr_frame_req_d4, 
  drif_pdmc_idle, 
  dal_reg, 
  ral_reg, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire [2:0] pdmc_pd_cnt_incr;
wire [5:0] pdmc_pd_cnt_decr;
wire [5:0] pdmc_pd_cnt_in;
wire [5:0] pdmc_pd_cnt;
wire ff_pd_cnt_scanin;
wire ff_pd_cnt_scanout;
wire pdmc_pd_cnt_is_zero;
wire [3:0] pdmc_state;
wire inv_pdmc_state_in_0;
wire inv_pdmc_state_0;
wire ff_pdmc_state_scanin;
wire ff_pdmc_state_scanout;
wire pdmc_cke_cnt_is_zero;
wire pdmc_precharge_cnt_is_zero;
wire pdmc_xp_cnt_is_zero;
wire pdmc_cke_reset;
wire [1:0] pdmc_cke_cnt_in;
wire [1:0] pdmc_cke_cnt;
wire ff_cke_cnt_scanin;
wire ff_cke_cnt_scanout;
wire pdmc_xp_reset;
wire [1:0] pdmc_xp_cnt_in;
wire [1:0] pdmc_xp_cnt;
wire ff_xp_cnt_scanin;
wire ff_xp_cnt_scanout;
wire pdmc_precharge_rd_reset;
wire pdmc_precharge_wr_reset;
wire [4:0] pdmc_precharge_cnt_in;
wire [4:0] pdmc_precharge_cnt;
wire ff_precharge_cnt_scanin;
wire ff_precharge_cnt_scanout;


output		pdmc_pde_pending;
output		pdmc_pdx_pending;

output		pdmc_rank_avail;

input		drq0_pd_mode_rd_incr;
input		drq1_pd_mode_rd_incr;
input		drq0_pd_mode_wr_incr;
input		drq1_pd_mode_wr_incr;
input		drif_pd_mode_scrub_incr;
input		drif_pd_mode_err_incr;
input		woq_pd_mode_wr_err_incr;

input		drq0_pd_mode_rd_decr;
input		drq1_pd_mode_rd_decr;
input		woq_pd_mode_wr_decr;
input		drif_pd_mode_scrub_decr;
input		drif_pd_mode_err_decr;
input		woq_pd_mode_wr_err_decr;

input		drif_pdx_issued;
input		drif_pde_issued;

input		fbdic_l0_state;
input		drif_pdmc_enable;
input		drif_refresh_mode;
input		fbdic_scr_frame_req_d4;
input		drif_pdmc_idle;

input	[4:0]	dal_reg;
input	[4:0]	ral_reg;

input 		l1clk;
input 		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

// Clock header connections
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// Count the number of pending transactions
assign pdmc_pd_cnt_incr[2:0] = {2'h0, drq0_pd_mode_rd_incr} + {2'h0, drq0_pd_mode_wr_incr} + 
			       {2'h0, drq1_pd_mode_rd_incr} + {2'h0, drq1_pd_mode_wr_incr} + 
			       {2'h0, drif_pd_mode_err_incr} + {2'h0, drif_pd_mode_scrub_incr} +
			       {2'h0, woq_pd_mode_wr_err_incr};
assign pdmc_pd_cnt_decr[5:0] = {5'h0, drq0_pd_mode_rd_decr | drq1_pd_mode_rd_decr | 
				      woq_pd_mode_wr_decr | drif_pd_mode_scrub_decr |
				      drif_pd_mode_err_decr | woq_pd_mode_wr_err_decr};

assign pdmc_pd_cnt_in[5:0] = {6{~drif_pdmc_idle}} & 
				(pdmc_pd_cnt[5:0] + {3'h0, pdmc_pd_cnt_incr[2:0]} - pdmc_pd_cnt_decr[5:0]);

// 0in overflow -var pdmc_pd_cnt[5:0]
// 0in underflow -var pdmc_pd_cnt[5:0]
mcu_pdmc_ctl_msff_ctl_macro__width_6 ff_pd_cnt  (
	.scan_in(ff_pd_cnt_scanin),
	.scan_out(ff_pd_cnt_scanout),
	.din(pdmc_pd_cnt_in[5:0]),
	.dout(pdmc_pd_cnt[5:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign pdmc_pd_cnt_is_zero = pdmc_pd_cnt[5:0] == 6'h0 & ~drif_refresh_mode;

reg [3:0] pdmc_state_in;

// 0in one_hot -var pdmc_state[3:0]
always @(pdmc_pd_cnt_is_zero or fbdic_l0_state or drif_pdmc_enable or drif_pde_issued or 
	 drif_pdx_issued or pdmc_state or fbdic_scr_frame_req_d4)  
begin
	pdmc_state_in[3:0] = 4'h0;

	case (1'b1)

	// State 0: In active mode
	pdmc_state[0] : begin
		if (pdmc_pd_cnt_is_zero & fbdic_l0_state & drif_pdmc_enable) 
			pdmc_state_in[1] = 1'b1;
		else
			pdmc_state_in[0] = 1'b1;
	end

	// State 1: Entering power down mode
	pdmc_state[1] : begin
		if (~fbdic_l0_state | ~drif_pdmc_enable | ~pdmc_pd_cnt_is_zero & ~drif_pde_issued | fbdic_scr_frame_req_d4)
			pdmc_state_in[0] = 1'b1;
		else if (drif_pde_issued)
			pdmc_state_in[2] = 1'b1;
		else
			pdmc_state_in[1] = 1'b1;
	end

	// State 2: In power down mode
	pdmc_state[2] : begin
		if (~fbdic_l0_state | fbdic_scr_frame_req_d4)
			pdmc_state_in[0] = 1'b1;
		else if (~pdmc_pd_cnt_is_zero | ~drif_pdmc_enable)
			pdmc_state_in[3] = 1'b1;
		else
			pdmc_state_in[2] = 1'b1;
	end

	// State 3: Exiting power down mode
	pdmc_state[3] : begin
		if (~fbdic_l0_state | drif_pdx_issued | fbdic_scr_frame_req_d4)
			pdmc_state_in[0] = 1'b1;
		else 
			pdmc_state_in[3] = 1'b1;
	end

	default: ;

	endcase

end

assign inv_pdmc_state_in_0 = ~pdmc_state_in[0];
assign pdmc_state[0] = ~inv_pdmc_state_0;
mcu_pdmc_ctl_msff_ctl_macro__width_4 ff_pdmc_state  (
	.scan_in(ff_pdmc_state_scanin),
	.scan_out(ff_pdmc_state_scanout),
	.din({pdmc_state_in[3:1], inv_pdmc_state_in_0}),
	.dout({pdmc_state[3:1], inv_pdmc_state_0}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign pdmc_pde_pending = pdmc_state[1] & pdmc_cke_cnt_is_zero & pdmc_precharge_cnt_is_zero;
assign pdmc_pdx_pending = pdmc_state[3] & pdmc_cke_cnt_is_zero;

assign pdmc_rank_avail = pdmc_state[0] & pdmc_xp_cnt_is_zero;

// Make sure CKE is asserted or deasserted for tCKE cycles before changing
assign pdmc_cke_reset = pdmc_state[3] & drif_pdx_issued | pdmc_state[1] & drif_pde_issued;
assign pdmc_cke_cnt_in[1:0] = pdmc_cke_reset ? 2'h3 : pdmc_cke_cnt_is_zero ? 2'h0 : pdmc_cke_cnt[1:0] - 2'h1;
mcu_pdmc_ctl_msff_ctl_macro__width_2 ff_cke_cnt  (
	.scan_in(ff_cke_cnt_scanin),
	.scan_out(ff_cke_cnt_scanout),
	.din(pdmc_cke_cnt_in[1:0]),
	.dout(pdmc_cke_cnt[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign pdmc_cke_cnt_is_zero = pdmc_cke_cnt[1:0] == 2'h0;

// Wait for tXP (precharge power down to any command) before enabling rank
assign pdmc_xp_reset = pdmc_state[3] & drif_pdx_issued;
assign pdmc_xp_cnt_in[1:0] = pdmc_xp_reset ? 2'h2 : pdmc_xp_cnt_is_zero ? 2'h0 : pdmc_xp_cnt[1:0] - 2'h1;
mcu_pdmc_ctl_msff_ctl_macro__width_2 ff_xp_cnt  (
	.scan_in(ff_xp_cnt_scanin),
	.scan_out(ff_xp_cnt_scanout),
	.din(pdmc_xp_cnt_in[1:0]),
	.dout(pdmc_xp_cnt[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign pdmc_xp_cnt_is_zero = pdmc_xp_cnt[1:0] == 2'h0;

// Wait for precharge time after a command is issued before going back to power down mode
assign pdmc_precharge_rd_reset = drq0_pd_mode_rd_decr | drq1_pd_mode_rd_decr | 
				 drif_pd_mode_scrub_decr | drif_pd_mode_err_decr;
assign pdmc_precharge_wr_reset = woq_pd_mode_wr_decr | woq_pd_mode_wr_err_decr;
assign pdmc_precharge_cnt_in[4:0] = pdmc_precharge_rd_reset ? ral_reg[4:0] : 
				    pdmc_precharge_wr_reset ? dal_reg[4:0] :
				    pdmc_precharge_cnt_is_zero ? 5'h0 : pdmc_precharge_cnt[4:0] - 5'h1;
mcu_pdmc_ctl_msff_ctl_macro__width_5 ff_precharge_cnt  (
	.scan_in(ff_precharge_cnt_scanin),
	.scan_out(ff_precharge_cnt_scanout),
	.din(pdmc_precharge_cnt_in[4:0]),
	.dout(pdmc_precharge_cnt[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign pdmc_precharge_cnt_is_zero = pdmc_precharge_cnt[4:0] == 5'h0;

// fixscan start:
assign ff_pd_cnt_scanin          = scan_in                  ;
assign ff_pdmc_state_scanin      = ff_pd_cnt_scanout        ;
assign ff_cke_cnt_scanin         = ff_pdmc_state_scanout    ;
assign ff_xp_cnt_scanin          = ff_cke_cnt_scanout       ;
assign ff_precharge_cnt_scanin   = ff_xp_cnt_scanout        ;
assign scan_out                  = ff_precharge_cnt_scanout ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_pdmc_ctl_msff_ctl_macro__width_6 (
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

module mcu_pdmc_ctl_msff_ctl_macro__width_4 (
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

module mcu_pdmc_ctl_msff_ctl_macro__width_2 (
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

module mcu_pdmc_ctl_msff_ctl_macro__width_5 (
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








