// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_fbdtm_ctl.v
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
module mcu_fbdtm_ctl (
  fbdic_sync_frm_period, 
  fbdic_sds_config, 
  fbdic_sds_invert, 
  fbdic_sds_testcfg, 
  rdpctl_kp_lnk_up, 
  rdpctl_kp_lnk_up_clr, 
  fbdic_idle_lfsr_reset, 
  mcu_fsr0_cfgrx_align, 
  mcu_fsr1_cfgrx_align, 
  mcu_fsr0_cfgtx_enidl, 
  mcu_fsr1_cfgtx_enidl, 
  drif_ucb_wr_req_vld, 
  drif_ucb_data, 
  drif_ucb_addr, 
  drif_dbg_trig_reg_ld, 
  drif_single_channel_mode, 
  fbdic_fbd_state, 
  fbd0_frame_lock, 
  fbd1_frame_lock, 
  fbdic_loopback_1, 
  fbdic_disable_state, 
  fbdic_serdes_dtm, 
  fbdic_status_frame, 
  drl2clk, 
  scan_in, 
  scan_out, 
  wmr_scan_in, 
  wmr_scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  fbdic_aclk_wmr, 
  tcu_scan_en, 
  wmr_protect, 
  tcu_mcu_testmode, 
  fbdtm_si, 
  fbdtm_so, 
  fbdtm_wmr_si, 
  fbdtm_wmr_so);
wire pce_ov;
wire se;
wire aclk_wmr;
wire siclk;
wire soclk;
wire l1clk;
wire fbdic_sync_frm_period_en;
wire [5:0] fbdic_sync_frm_period_in;
wire [5:0] fbdic_sync_frm_period_out;
wire pff_sync_frm_period_wmr_scanin;
wire pff_sync_frm_period_wmr_scanout;
wire fbdic_sds_config_en;
wire [29:0] fbdic_sds_config_in;
wire [29:0] fbdic_sds_config_reset_val;
wire [29:0] fbdic_sds_config_out;
wire pff_sds_config_wmr_scanin;
wire pff_sds_config_wmr_scanout;
wire fbdic_sds_invert_en;
wire [47:0] fbdic_sds_invert_in;
wire pff_sds_invert_wmr_scanin;
wire pff_sds_invert_wmr_scanout;
wire [13:0] mcu_fsr0_cfgrx_invpair;
wire [13:0] mcu_fsr1_cfgrx_invpair;
wire [9:0] mcu_fsr0_cfgtx_invpair;
wire [9:0] mcu_fsr1_cfgtx_invpair;
wire fbdic_sds_testcfg_en;
wire [31:0] fbdic_sds_testcfg_in;
wire [31:0] fbdic_sds_testcfg_rstval;
wire pff_sds_testcfg_wmr_scanin;
wire pff_sds_testcfg_wmr_scanout;
wire [31:0] fbdic_sds_testcfg_out;
wire mcu_fsr0_cfgtx_enidl_in;
wire mcu_fsr1_cfgtx_enidl_in;
wire inv_mcu_fsr0_cfgtx_enidl_in;
wire inv_mcu_fsr1_cfgtx_enidl_in;
wire inv_mcu_fsr0_cfgtx_enidl;
wire inv_mcu_fsr1_cfgtx_enidl;
wire pff_cfgtx_enidl_scanin;
wire pff_cfgtx_enidl_scanout;
wire mcu_fsr0_cfgrx_align_in;
wire mcu_fsr1_cfgrx_align_in;
wire ff_cfgrx_align_scanin;
wire ff_cfgrx_align_scanout;
wire fbdic_idle_lfsr_reset_in;
wire ff_idle_lfsr_reset_scanin;
wire ff_idle_lfsr_reset_scanout;
wire rdpctl_kp_lnk_up_in;
wire ff_kp_lnk_up_scanin;
wire ff_kp_lnk_up_scanout;


output	[5:0]	fbdic_sync_frm_period;
output	[29:0]	fbdic_sds_config;
output	[47:0]	fbdic_sds_invert;
output	[31:0]	fbdic_sds_testcfg;
output		rdpctl_kp_lnk_up;
output		rdpctl_kp_lnk_up_clr;
output		fbdic_idle_lfsr_reset;
output		mcu_fsr0_cfgrx_align;
output		mcu_fsr1_cfgrx_align;
output		mcu_fsr0_cfgtx_enidl;
output		mcu_fsr1_cfgtx_enidl;

input		drif_ucb_wr_req_vld;
input	[47:0]	drif_ucb_data;
input	[12:0]	drif_ucb_addr;
input		drif_dbg_trig_reg_ld;

input		drif_single_channel_mode;
input	[2:0]	fbdic_fbd_state;
input	[13:0]	fbd0_frame_lock;
input	[13:0]	fbd1_frame_lock;
input		fbdic_loopback_1;
input		fbdic_disable_state;
input		fbdic_serdes_dtm;
input		fbdic_status_frame;

input		drl2clk;
input 		scan_in;
output		scan_out;
input 		wmr_scan_in;
output		wmr_scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		fbdic_aclk_wmr;
input		tcu_scan_en;
input		wmr_protect;
input		tcu_mcu_testmode;

input 		fbdtm_si;
output		fbdtm_so;
input 		fbdtm_wmr_si;
output		fbdtm_wmr_so;

assign pce_ov = tcu_pce_ov;
assign se = tcu_scan_en & tcu_mcu_testmode;
assign aclk_wmr = fbdic_aclk_wmr & tcu_mcu_testmode;
assign siclk = tcu_aclk & tcu_mcu_testmode;
assign soclk = tcu_bclk & tcu_mcu_testmode;

assign scan_out = scan_in;
assign wmr_scan_out = wmr_scan_in;

mcu_fbdtm_ctl_l1clkhdr_ctl_macro clkgen_tm (
 	.l2clk(drl2clk),
 	.l1en (1'b1),
	.stop(1'b0),
	.se(se),
 	.l1clk(l1clk),
  .pce_ov(pce_ov));

/////////////////////////////////
// FBD Sync Frame Frequency Register
/////////////////////////////////
assign fbdic_sync_frm_period_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8B0;
assign fbdic_sync_frm_period_in[5:0] = drif_ucb_data[5:0] ^ 6'h2a;
assign fbdic_sync_frm_period[5:0] = fbdic_sync_frm_period_out[5:0] ^ 6'h2a;

mcu_fbdtm_ctl_msff_ctl_macro__en_1__width_6 pff_sync_frm_period  ( // FS:wmr_protect
	.scan_in(pff_sync_frm_period_wmr_scanin),
	.scan_out(pff_sync_frm_period_wmr_scanout),
	.siclk(fbdic_aclk_wmr),
	.din(fbdic_sync_frm_period_in[5:0]),
	.dout(fbdic_sync_frm_period_out[5:0]),
	.en(fbdic_sync_frm_period_en),
	.l1clk(l1clk),
  .soclk(soclk));

/////////////////////////////////
// SERDES Configuration Bus Register
/////////////////////////////////
assign fbdic_sds_config_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8D0;
assign fbdic_sds_config_in[29:0] = drif_ucb_data[29:0] ^ fbdic_sds_config_reset_val[29:0];
assign fbdic_sds_config[29:0] = fbdic_sds_config_out[29:0] ^ fbdic_sds_config_reset_val[29:0];
assign fbdic_sds_config_reset_val[29:0] = {3'h0,3'h1,18'h0,4'h6,2'h0};

mcu_fbdtm_ctl_msff_ctl_macro__en_1__width_27 pff_sds_config  ( // FS:wmr_protect
	.scan_in(pff_sds_config_wmr_scanin),
	.scan_out(pff_sds_config_wmr_scanout),
	.siclk(fbdic_aclk_wmr),
	.din({fbdic_sds_config_in[29:16],fbdic_sds_config_in[14:8],fbdic_sds_config_in[5:0]}),
	.dout({fbdic_sds_config_out[29:16],fbdic_sds_config_out[14:8],fbdic_sds_config_out[5:0]}),
	.en(fbdic_sds_config_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_sds_config_out[7:6] = 2'h0;
assign fbdic_sds_config_out[15] = 1'b0;

/////////////////////////////////
// SERDES Transmitter and Receiver Differential Pair Inversion Register
/////////////////////////////////
assign fbdic_sds_invert_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8D8;
assign fbdic_sds_invert_in[47:0] = drif_ucb_data[47:0];

mcu_fbdtm_ctl_msff_ctl_macro__en_1__width_48 pff_sds_invert  ( // FS:wmr_protect
	.scan_in(pff_sds_invert_wmr_scanin),
	.scan_out(pff_sds_invert_wmr_scanout),
	.siclk(fbdic_aclk_wmr),
	.din(fbdic_sds_invert_in[47:0]),
	.dout(fbdic_sds_invert[47:0]),
	.en(fbdic_sds_invert_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign mcu_fsr0_cfgrx_invpair[13:0] = fbdic_sds_invert[13:0];
assign mcu_fsr1_cfgrx_invpair[13:0] = fbdic_sds_invert[27:14];
assign mcu_fsr0_cfgtx_invpair[9:0] = fbdic_sds_invert[37:28];
assign mcu_fsr1_cfgtx_invpair[9:0] = fbdic_sds_invert[47:38];

/////////////////////////////////
// SERDES Test Configuration Bus Register
/////////////////////////////////
assign fbdic_sds_testcfg_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8E0;
assign fbdic_sds_testcfg_in[31:0] = drif_ucb_data[31:0] ^ fbdic_sds_testcfg_rstval[31:0];
assign fbdic_sds_testcfg_rstval[31:0] = {4'h0, 14'h3, 14'h3};

mcu_fbdtm_ctl_msff_ctl_macro__en_1__width_32 pff_sds_testcfg  ( // FS:wmr_protect
	.scan_in(pff_sds_testcfg_wmr_scanin),
	.scan_out(pff_sds_testcfg_wmr_scanout),
	.siclk(fbdic_aclk_wmr),
	.din(fbdic_sds_testcfg_in[31:0]),
	.dout(fbdic_sds_testcfg_out[31:0]),
	.en(fbdic_sds_testcfg_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_sds_testcfg[31:0] = fbdic_sds_testcfg_out[31:0] ^ fbdic_sds_testcfg_rstval[31:0];

// Enable Idle signal to FSRs
assign mcu_fsr0_cfgtx_enidl_in = rdpctl_kp_lnk_up ? mcu_fsr0_cfgtx_enidl : ~(|fbdic_fbd_state[2:0]);
assign mcu_fsr1_cfgtx_enidl_in = mcu_fsr0_cfgtx_enidl_in & ~drif_single_channel_mode;

assign inv_mcu_fsr0_cfgtx_enidl_in = ~mcu_fsr0_cfgtx_enidl_in;
assign inv_mcu_fsr1_cfgtx_enidl_in = ~mcu_fsr1_cfgtx_enidl_in;
assign mcu_fsr0_cfgtx_enidl = ~inv_mcu_fsr0_cfgtx_enidl;
assign mcu_fsr1_cfgtx_enidl = ~inv_mcu_fsr1_cfgtx_enidl;

mcu_fbdtm_ctl_msff_ctl_macro__width_2 pff_cfgtx_enidl  (
	.scan_in(pff_cfgtx_enidl_scanin),
	.scan_out(pff_cfgtx_enidl_scanout),
	.din({inv_mcu_fsr0_cfgtx_enidl_in,inv_mcu_fsr1_cfgtx_enidl_in}),
	.dout({inv_mcu_fsr0_cfgtx_enidl,inv_mcu_fsr1_cfgtx_enidl}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_fsr0_cfgrx_align_in = (fbdic_fbd_state[2:0] == 3'h2) & ~(&fbd0_frame_lock[13:0]) | 
				  (fbdic_serdes_dtm | fbdic_loopback_1) & fbdic_disable_state;
assign mcu_fsr1_cfgrx_align_in = ((fbdic_fbd_state[2:0] == 3'h2) & ~(&fbd1_frame_lock[13:0]) | 
				  (fbdic_serdes_dtm | fbdic_loopback_1) & fbdic_disable_state) & ~drif_single_channel_mode;

mcu_fbdtm_ctl_msff_ctl_macro__width_2 ff_cfgrx_align  (
	.scan_in(ff_cfgrx_align_scanin),
	.scan_out(ff_cfgrx_align_scanout),
	.din({mcu_fsr0_cfgrx_align_in,mcu_fsr1_cfgrx_align_in}),
	.dout({mcu_fsr0_cfgrx_align,mcu_fsr1_cfgrx_align}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Control signals from fbdird data path block
assign fbdic_idle_lfsr_reset_in = (fbdic_fbd_state[2:1] != 2'h3) & ~rdpctl_kp_lnk_up ? 1'b1 : 
				  fbdic_status_frame ? 1'b0 : fbdic_idle_lfsr_reset;

mcu_fbdtm_ctl_msff_ctl_macro ff_idle_lfsr_reset (
	.scan_in(ff_idle_lfsr_reset_scanin),
	.scan_out(ff_idle_lfsr_reset_scanout),
	.din(fbdic_idle_lfsr_reset_in),
	.dout(fbdic_idle_lfsr_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_kp_lnk_up_in = drif_ucb_data[0];

mcu_fbdtm_ctl_msff_ctl_macro__en_1 ff_kp_lnk_up  (
	.scan_in(ff_kp_lnk_up_scanin),
	.scan_out(ff_kp_lnk_up_scanout),
	.din(rdpctl_kp_lnk_up_in),
	.dout(rdpctl_kp_lnk_up),
	.en(drif_dbg_trig_reg_ld),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_kp_lnk_up_clr = rdpctl_kp_lnk_up & drif_dbg_trig_reg_ld & ~drif_ucb_data[0];

assign pff_cfgtx_enidl_scanin    = fbdtm_si                 ;
assign ff_cfgrx_align_scanin     = pff_cfgtx_enidl_scanout  ;
assign ff_idle_lfsr_reset_scanin = ff_cfgrx_align_scanout   ;
assign ff_kp_lnk_up_scanin       = ff_idle_lfsr_reset_scanout;
assign fbdtm_so                  = tcu_mcu_testmode ? ff_kp_lnk_up_scanout : fbdtm_si;

assign pff_sync_frm_period_wmr_scanin = fbdtm_wmr_si        ;
assign pff_sds_config_wmr_scanin = pff_sync_frm_period_wmr_scanout;
assign pff_sds_invert_wmr_scanin = pff_sds_config_wmr_scanout;
assign pff_sds_testcfg_wmr_scanin = pff_sds_invert_wmr_scanout;
assign fbdtm_wmr_so              = tcu_mcu_testmode ? pff_sds_testcfg_wmr_scanout : fbdtm_wmr_si;

endmodule






// any PARAMS parms go into naming of macro

module mcu_fbdtm_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdtm_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






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

module mcu_fbdtm_ctl_msff_ctl_macro__en_1__width_27 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [26:0] fdin;
wire [25:0] so;

  input [26:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [26:0] dout;
  output scan_out;
assign fdin[26:0] = (din[26:0] & {27{en}}) | (dout[26:0] & ~{27{en}});






dff #(27)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[26:0]),
.si({scan_in,so[25:0]}),
.so({so[25:0],scan_out}),
.q(dout[26:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdtm_ctl_msff_ctl_macro__en_1__width_48 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [47:0] fdin;
wire [46:0] so;

  input [47:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [47:0] dout;
  output scan_out;
assign fdin[47:0] = (din[47:0] & {48{en}}) | (dout[47:0] & ~{48{en}});






dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdtm_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdtm_ctl_msff_ctl_macro__width_2 (
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

module mcu_fbdtm_ctl_msff_ctl_macro (
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

module mcu_fbdtm_ctl_msff_ctl_macro__en_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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








