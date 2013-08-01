// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_fbdiwr_dp.v
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
module mcu_fbdiwr_dp (
  fbdiwr0_data, 
  fbdiwr1_data, 
  fbdiwr_dtm_crc, 
  bc, 
  bd0, 
  bd1, 
  fbdic0_ts_data, 
  fbdic1_ts_data, 
  fbdic_ibist_data, 
  fbdic_f, 
  fbdic_f_1_l, 
  fbdic0_chnl_disable, 
  fbdic1_chnl_disable, 
  fbdic_a_cmd, 
  fbdic_bc_cmd, 
  fbdic0_cmd_crc_sel, 
  fbdic1_cmd_crc_sel, 
  fbdic0_data_crc_sel, 
  fbdic1_data_crc_sel, 
  fbdic_special_cmd, 
  fbdic_special_cmd_l, 
  fbdic0_failover_mask, 
  fbdic0_failover_mask_l, 
  fbdic1_failover_mask, 
  fbdic1_failover_mask_l, 
  wrdp_data, 
  fbd0_data, 
  fbd1_data, 
  fbdic_data_sel, 
  rdpctl_dtm_chnl_enable, 
  crcsc_crc, 
  crcscf_crc, 
  crcsd0_crc, 
  crcsdf0_crc, 
  crcsd1_crc, 
  crcsdf1_crc, 
  drl2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire test;
wire muxtst;
wire se;
wire [13:0] fbdiwr0_sbcmd_crc;
wire [13:0] fbdiwr1_sbcmd_crc;
wire u_ff_sbdata_crc_d1_scanin;
wire u_ff_sbdata_crc_d1_scanout;
wire [21:0] sbdata0_crc;
wire [21:0] sbdata1_crc;
wire [13:0] sbdata0_crc_d1;
wire [13:0] sbdata1_crc_d1;
wire [13:0] sbcmd0_crc;
wire [13:0] sbcmd1_crc;
wire [71:0] fbdiwr_bc_cmd_data0;
wire [119:0] mcu_fsr0_data_in;
wire [71:0] fbdiwr_bc_cmd_data1;
wire [119:0] mcu_fsr1_data_in;
wire [119:0] mux_fsr0_data;
wire [119:0] mux_fsr1_data;
wire [21:0] ch0_crc;
wire [21:0] ch1_crc;


output [119:0]	fbdiwr0_data;
output [119:0]	fbdiwr1_data;

output	[21:0]	fbdiwr_dtm_crc;

output	[25:0]	bc;
output	[71:0]	bd0;
output	[71:0]	bd1;

input [11:0]	fbdic0_ts_data;
input [11:0]	fbdic1_ts_data;
input [119:0]	fbdic_ibist_data;
input [1:0]	fbdic_f;
input 		fbdic_f_1_l;
input		fbdic0_chnl_disable;
input		fbdic1_chnl_disable;
input [23:0]	fbdic_a_cmd;
input [71:0]	fbdic_bc_cmd;

input [1:0]	fbdic0_cmd_crc_sel;
input [1:0]	fbdic1_cmd_crc_sel;
input [2:0]	fbdic0_data_crc_sel;
input [2:0]	fbdic1_data_crc_sel;
input		fbdic_special_cmd;
input		fbdic_special_cmd_l;

input	[8:0]	fbdic0_failover_mask;
input	[8:0]	fbdic0_failover_mask_l;
input	[8:0]	fbdic1_failover_mask;
input	[8:0]	fbdic1_failover_mask_l;

input 	[143:0]	wrdp_data;
input 	[167:0]	fbd0_data;
input 	[167:0]	fbd1_data;
input	[4:0]	fbdic_data_sel;

input	[1:0]	rdpctl_dtm_chnl_enable;

input	[13:0]	crcsc_crc;
input	[9:0]	crcscf_crc;

input	[21:0]	crcsd0_crc;
input	[9:0]	crcsdf0_crc;

input	[21:0]	crcsd1_crc;
input	[9:0]	crcsdf1_crc;

input		drl2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_dectest;
input		tcu_muxtest;
input		tcu_scan_en;

assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign test = tcu_dectest;
assign muxtst = tcu_muxtest;
assign se = tcu_scan_en;

// Branch command

assign bc[25:0] = {
		fbdic_f[1:0],
		fbdic_a_cmd[20], fbdic_a_cmd[21], fbdic_a_cmd[22], fbdic_a_cmd[23], fbdic_a_cmd[19:16],
		fbdic_a_cmd[12], fbdic_a_cmd[13], fbdic_a_cmd[14], fbdic_a_cmd[15], fbdic_a_cmd[11:8],
		fbdic_a_cmd[4],  fbdic_a_cmd[5],  fbdic_a_cmd[6],  fbdic_a_cmd[7],  fbdic_a_cmd[3:0]};

////csret 11/19/2004
//assign sbcmd_crc[13:0] = fbdic_special_cmd ? 14'h0 : fbdic_failover ? {4'h0,crcscf_crc[9:0]} : crcsc_crc[13:0];
mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_2__width_14 u_mux_sbcmd0_crc            (
        .dout ( fbdiwr0_sbcmd_crc[13:0] ),
        .din0 ( {crcscf_crc[9:0],4'h0} ),
        .din1 ( crcsc_crc[13:0] ),
        .sel0 ( fbdic0_cmd_crc_sel[0] ),
        .sel1 ( fbdic0_cmd_crc_sel[1] ));

mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_2__width_14 u_mux_sbcmd1_crc            (
        .dout ( fbdiwr1_sbcmd_crc[13:0] ),
        .din0 ( {crcscf_crc[9:0],4'h0} ),
        .din1 ( crcsc_crc[13:0] ),
        .sel0 ( fbdic1_cmd_crc_sel[0] ),
        .sel1 ( fbdic1_cmd_crc_sel[1] ));

mcu_fbdiwr_dp_msff_macro__mux_aonpe__ports_2__width_28 u_ff_sbdata_crc_d1     (
	.scan_in(u_ff_sbdata_crc_d1_scanin),
	.scan_out(u_ff_sbdata_crc_d1_scanout),
	.din0(28'h0),
	.din1({sbdata0_crc[13:0],sbdata1_crc[13:0]}),
	.dout({sbdata0_crc_d1[13:0],sbdata1_crc_d1[13:0]}),
	.sel0(fbdic_special_cmd),
	.sel1(fbdic_special_cmd_l),
	.en(1'b1),
	.clk(drl2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_fbdiwr_dp_xor_macro__width_14 u_xor_cmd_data0_crc  (
	.din0(fbdiwr0_sbcmd_crc[13:0]),
	.din1(sbdata0_crc_d1[13:0]),
	.dout(sbcmd0_crc[13:0]));

mcu_fbdiwr_dp_xor_macro__width_14 u_xor_cmd_data1_crc  (
	.din0(fbdiwr1_sbcmd_crc[13:0]),
	.din1(sbdata1_crc_d1[13:0]),
	.dout(sbcmd1_crc[13:0]));

// Channel 0 Data 

////csret 11/19/2004
//assign fbdiwr_bc_cmd_data0[71:0] = fbdic_f[1] ? wrdp_data[143:72] : fbdic_bc_cmd[71:0];
mcu_fbdiwr_dp_mux_macro__mux_pgpe__ports_3__width_36 u_mux_fbdiwr_bc_cmd_data0_35_0            (
           .dout ( fbdiwr_bc_cmd_data0[35:0] ),
	   .din0 ( 36'h0 ),
           .din1 ( fbdic_bc_cmd[35:0] ),
           .din2 ( wrdp_data[107:72] ),
	   .sel0 ( fbdic0_chnl_disable ),
           .sel1 ( fbdic_f_1_l ),
  .muxtst(muxtst),
  .test(test) );
mcu_fbdiwr_dp_mux_macro__mux_pgpe__ports_3__width_36 u_mux_fbdiwr_bc_cmd_data0_71_36            (
           .dout ( fbdiwr_bc_cmd_data0[71:36] ),
	   .din0 ( 36'h0 ),
           .din1 ( fbdic_bc_cmd[71:36] ),
           .din2 ( wrdp_data[143:108] ),
	   .sel0 ( fbdic0_chnl_disable ),
           .sel1 ( fbdic_f_1_l ),
  .muxtst(muxtst),
  .test(test) );

assign bd0[71:0] = {
	fbdiwr_bc_cmd_data0[7],  fbdiwr_bc_cmd_data0[15], fbdiwr_bc_cmd_data0[23], fbdiwr_bc_cmd_data0[31], fbdiwr_bc_cmd_data0[39], 
	fbdiwr_bc_cmd_data0[47], fbdiwr_bc_cmd_data0[55], fbdiwr_bc_cmd_data0[63], fbdiwr_bc_cmd_data0[71], 
	fbdiwr_bc_cmd_data0[70], fbdiwr_bc_cmd_data0[62], fbdiwr_bc_cmd_data0[54], fbdiwr_bc_cmd_data0[46], fbdiwr_bc_cmd_data0[38], 
	fbdiwr_bc_cmd_data0[30], fbdiwr_bc_cmd_data0[22], fbdiwr_bc_cmd_data0[14], fbdiwr_bc_cmd_data0[6], 
	fbdiwr_bc_cmd_data0[5],  fbdiwr_bc_cmd_data0[13], fbdiwr_bc_cmd_data0[21], fbdiwr_bc_cmd_data0[29], fbdiwr_bc_cmd_data0[37], 
	fbdiwr_bc_cmd_data0[45], fbdiwr_bc_cmd_data0[53], fbdiwr_bc_cmd_data0[61], fbdiwr_bc_cmd_data0[69], 
	fbdiwr_bc_cmd_data0[68], fbdiwr_bc_cmd_data0[60], fbdiwr_bc_cmd_data0[52], fbdiwr_bc_cmd_data0[44], fbdiwr_bc_cmd_data0[36], 
	fbdiwr_bc_cmd_data0[28], fbdiwr_bc_cmd_data0[20], fbdiwr_bc_cmd_data0[12], fbdiwr_bc_cmd_data0[4], 
	fbdiwr_bc_cmd_data0[3],  fbdiwr_bc_cmd_data0[11], fbdiwr_bc_cmd_data0[19], fbdiwr_bc_cmd_data0[27], fbdiwr_bc_cmd_data0[35], 
	fbdiwr_bc_cmd_data0[43], fbdiwr_bc_cmd_data0[51], fbdiwr_bc_cmd_data0[59], fbdiwr_bc_cmd_data0[67], 
	fbdiwr_bc_cmd_data0[66], fbdiwr_bc_cmd_data0[58], fbdiwr_bc_cmd_data0[50], fbdiwr_bc_cmd_data0[42], fbdiwr_bc_cmd_data0[34], 
	fbdiwr_bc_cmd_data0[26], fbdiwr_bc_cmd_data0[18], fbdiwr_bc_cmd_data0[10], fbdiwr_bc_cmd_data0[2], 
	fbdiwr_bc_cmd_data0[1],  fbdiwr_bc_cmd_data0[9],  fbdiwr_bc_cmd_data0[17], fbdiwr_bc_cmd_data0[25], fbdiwr_bc_cmd_data0[33], 
	fbdiwr_bc_cmd_data0[41], fbdiwr_bc_cmd_data0[49], fbdiwr_bc_cmd_data0[57], fbdiwr_bc_cmd_data0[65], 
	fbdiwr_bc_cmd_data0[64], fbdiwr_bc_cmd_data0[56], fbdiwr_bc_cmd_data0[48], fbdiwr_bc_cmd_data0[40], fbdiwr_bc_cmd_data0[32], 
	fbdiwr_bc_cmd_data0[24], fbdiwr_bc_cmd_data0[16], fbdiwr_bc_cmd_data0[8],  fbdiwr_bc_cmd_data0[0]};

////csret 11/19/2004
//assign sbdata0_crc[21:0] = fbdic_special_cmd ? 22'h2aaaaa : fbdic_failover ? {12'h0,crcsdf0_crc[9:0]} : crcsd0_crc[21:0];

mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_3__width_22 u_sbdata0_crc           (
	.din0(22'h2aaaaa),
	.din1({8'h0,crcsdf0_crc[9:0],4'h0}),
	.din2(crcsd0_crc[21:0]),
	.sel0(fbdic0_data_crc_sel[0]),
	.sel1(fbdic0_data_crc_sel[1]),
	.sel2(fbdic0_data_crc_sel[2]),
	.dout(sbdata0_crc[21:0]));

assign mcu_fsr0_data_in[119:0] = 
			{{sbdata0_crc[14],sbdata0_crc[15],sbdata0_crc[16],sbdata0_crc[17],
				sbdata0_crc[18],sbdata0_crc[19],sbdata0_crc[20],sbdata0_crc[21],sbcmd0_crc[3:0]},
			{fbdiwr_bc_cmd_data0[71:64],sbcmd0_crc[4],sbcmd0_crc[5],sbcmd0_crc[6],sbcmd0_crc[7]},
			{fbdiwr_bc_cmd_data0[63:56],sbcmd0_crc[11:8]},
			{fbdiwr_bc_cmd_data0[55:48],sbcmd0_crc[12],sbcmd0_crc[13],fbdic_f[1:0]},
			{fbdiwr_bc_cmd_data0[47:40],fbdic_a_cmd[23:20]},
			{fbdiwr_bc_cmd_data0[39:32],fbdic_a_cmd[19:16]},
			{fbdiwr_bc_cmd_data0[31:24],fbdic_a_cmd[15:12]},
			{fbdiwr_bc_cmd_data0[23:16],fbdic_a_cmd[11:8]},
			{fbdiwr_bc_cmd_data0[15:8],fbdic_a_cmd[7:4]},
			{fbdiwr_bc_cmd_data0[7:0],fbdic_a_cmd[3:0]}};

//msff_macro fsr_data0 (width=120) (
//	.scan_in(fbd_data0_scanin),
//	.scan_out(fbd_data0_scanout),
//	.din(mcu_fsr0_data_in[119:0]),
//	.dout(mcu_fsr0_data[119:0]),
//	.l1clk(l1clk));

// Channel 1 Data 

////csret 11/19/2004
//assign fbdiwr_bc_cmd_data1[71:0] = fbdic_f[1] ? wrdp_data[71:0] : fbdic_bc_cmd[71:0];
mcu_fbdiwr_dp_mux_macro__mux_pgpe__ports_3__width_36 u_mux_fbdicwr_bc_cmd_data1_71_36            (
         .dout( fbdiwr_bc_cmd_data1[71:36] ),
         .din0 ( 36'h0 ),
         .din1 ( fbdic_bc_cmd[71:36] ),
         .din2 ( wrdp_data[71:36] ),
	 .sel0 ( fbdic1_chnl_disable ),
         .sel1 ( fbdic_f_1_l ),
  .muxtst(muxtst),
  .test(test) );
mcu_fbdiwr_dp_mux_macro__mux_pgpe__ports_3__width_36 u_mux_fbdicwr_bc_cmd_data1_35_0            (
         .dout( fbdiwr_bc_cmd_data1[35:0] ),
         .din0 ( 36'h0 ),
         .din1 ( fbdic_bc_cmd[35:0] ),
         .din2 ( wrdp_data[35:0] ),
	 .sel0 ( fbdic1_chnl_disable ),
         .sel1 ( fbdic_f_1_l ),
  .muxtst(muxtst),
  .test(test) );

assign bd1[71:0] = {
	fbdiwr_bc_cmd_data1[7],  fbdiwr_bc_cmd_data1[15], fbdiwr_bc_cmd_data1[23], fbdiwr_bc_cmd_data1[31], fbdiwr_bc_cmd_data1[39], 
	fbdiwr_bc_cmd_data1[47], fbdiwr_bc_cmd_data1[55], fbdiwr_bc_cmd_data1[63], fbdiwr_bc_cmd_data1[71], 
	fbdiwr_bc_cmd_data1[70], fbdiwr_bc_cmd_data1[62], fbdiwr_bc_cmd_data1[54], fbdiwr_bc_cmd_data1[46], fbdiwr_bc_cmd_data1[38], 
	fbdiwr_bc_cmd_data1[30], fbdiwr_bc_cmd_data1[22], fbdiwr_bc_cmd_data1[14], fbdiwr_bc_cmd_data1[6], 
	fbdiwr_bc_cmd_data1[5],  fbdiwr_bc_cmd_data1[13], fbdiwr_bc_cmd_data1[21], fbdiwr_bc_cmd_data1[29], fbdiwr_bc_cmd_data1[37], 
	fbdiwr_bc_cmd_data1[45], fbdiwr_bc_cmd_data1[53], fbdiwr_bc_cmd_data1[61], fbdiwr_bc_cmd_data1[69], 
	fbdiwr_bc_cmd_data1[68], fbdiwr_bc_cmd_data1[60], fbdiwr_bc_cmd_data1[52], fbdiwr_bc_cmd_data1[44], fbdiwr_bc_cmd_data1[36], 
	fbdiwr_bc_cmd_data1[28], fbdiwr_bc_cmd_data1[20], fbdiwr_bc_cmd_data1[12], fbdiwr_bc_cmd_data1[4], 
	fbdiwr_bc_cmd_data1[3],  fbdiwr_bc_cmd_data1[11], fbdiwr_bc_cmd_data1[19], fbdiwr_bc_cmd_data1[27], fbdiwr_bc_cmd_data1[35], 
	fbdiwr_bc_cmd_data1[43], fbdiwr_bc_cmd_data1[51], fbdiwr_bc_cmd_data1[59], fbdiwr_bc_cmd_data1[67], 
	fbdiwr_bc_cmd_data1[66], fbdiwr_bc_cmd_data1[58], fbdiwr_bc_cmd_data1[50], fbdiwr_bc_cmd_data1[42], fbdiwr_bc_cmd_data1[34], 
	fbdiwr_bc_cmd_data1[26], fbdiwr_bc_cmd_data1[18], fbdiwr_bc_cmd_data1[10], fbdiwr_bc_cmd_data1[2], 
	fbdiwr_bc_cmd_data1[1],  fbdiwr_bc_cmd_data1[9],  fbdiwr_bc_cmd_data1[17], fbdiwr_bc_cmd_data1[25], fbdiwr_bc_cmd_data1[33], 
	fbdiwr_bc_cmd_data1[41], fbdiwr_bc_cmd_data1[49], fbdiwr_bc_cmd_data1[57], fbdiwr_bc_cmd_data1[65], 
	fbdiwr_bc_cmd_data1[64], fbdiwr_bc_cmd_data1[56], fbdiwr_bc_cmd_data1[48], fbdiwr_bc_cmd_data1[40], fbdiwr_bc_cmd_data1[32], 
	fbdiwr_bc_cmd_data1[24], fbdiwr_bc_cmd_data1[16], fbdiwr_bc_cmd_data1[8],  fbdiwr_bc_cmd_data1[0]};

////csret 11/19/2004
//assign sbdata1_crc[21:0] = fbdic_special_cmd ? 22'h2aaaaa : fbdic_failover ? {12'h0,crcsdf1_crc[9:0]} : crcsd1_crc[21:0];

mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_3__width_22 u_sbdata1_crc           (
	.din0(22'h2aaaaa),
	.din1({8'h0,crcsdf1_crc[9:0],4'h0}),
	.din2(crcsd1_crc[21:0]),
	.sel0(fbdic1_data_crc_sel[0]),
	.sel1(fbdic1_data_crc_sel[1]),
	.sel2(fbdic1_data_crc_sel[2]),
	.dout(sbdata1_crc[21:0]));

assign mcu_fsr1_data_in[119:0] = 
			{{sbdata1_crc[14],sbdata1_crc[15],sbdata1_crc[16],sbdata1_crc[17],
				sbdata1_crc[18],sbdata1_crc[19],sbdata1_crc[20],sbdata1_crc[21],sbcmd1_crc[3:0]},
			{fbdiwr_bc_cmd_data1[71:64],sbcmd1_crc[4],sbcmd1_crc[5],sbcmd1_crc[6],sbcmd1_crc[7]},
			{fbdiwr_bc_cmd_data1[63:56],sbcmd1_crc[11:8]},
			{fbdiwr_bc_cmd_data1[55:48],sbcmd1_crc[12],sbcmd1_crc[13],fbdic_f[1:0]},
			{fbdiwr_bc_cmd_data1[47:40],fbdic_a_cmd[23:20]},
			{fbdiwr_bc_cmd_data1[39:32],fbdic_a_cmd[19:16]},
			{fbdiwr_bc_cmd_data1[31:24],fbdic_a_cmd[15:12]},
			{fbdiwr_bc_cmd_data1[23:16],fbdic_a_cmd[11:8]},
			{fbdiwr_bc_cmd_data1[15:8], fbdic_a_cmd[7:4]},
			{fbdiwr_bc_cmd_data1[7:0],  fbdic_a_cmd[3:0]}};

//msff_ctl_macro fsr_data1 (width=120) (
//	.scan_in(fbd_data1_scanin),
//	.scan_out(fbd_data1_scanout),
//	.din(mcu_fsr1_data_in[119:0]),
//	.dout(mcu_fsr1_data[119:0]),
//	.l1clk(l1clk));

// output data muxes: 0-normal data, 1-training sequence data, 2/3-blunt-end loopback data
mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_5__width_60 m_mux_fsr0_data_119_60           (
	.din0(mcu_fsr0_data_in[119:60]),
	.din1({5{fbdic0_ts_data[11:0]}}),
	.din2(fbdic_ibist_data[119:60]),
	.din3(fbd0_data[119:60]),
	.din4(fbd0_data[167:108]),
	.sel0(fbdic_data_sel[0]),
	.sel1(fbdic_data_sel[1]),
	.sel2(fbdic_data_sel[2]),
	.sel3(fbdic_data_sel[3]),
	.sel4(fbdic_data_sel[4]),
	.dout(mux_fsr0_data[119:60]));

mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_5__width_60 m_mux_fsr0_data_59_0           (
	.din0(mcu_fsr0_data_in[59:0]),
	.din1({5{fbdic0_ts_data[11:0]}}),
	.din2(fbdic_ibist_data[59:0]),
	.din3(fbd0_data[59:0]),
	.din4(fbd0_data[107:48]),
	.sel0(fbdic_data_sel[0]),
	.sel1(fbdic_data_sel[1]),
	.sel2(fbdic_data_sel[2]),
	.sel3(fbdic_data_sel[3]),
	.sel4(fbdic_data_sel[4]),
	.dout(mux_fsr0_data[59:0]));

mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_5__width_60 m_mux_fsr1_data_119_60           (
	.din0(mcu_fsr1_data_in[119:60]),
	.din1({5{fbdic1_ts_data[11:0]}}),
	.din2(fbdic_ibist_data[119:60]),
	.din3(fbd1_data[119:60]),
	.din4(fbd1_data[167:108]),
	.sel0(fbdic_data_sel[0]),
	.sel1(fbdic_data_sel[1]),
	.sel2(fbdic_data_sel[2]),
	.sel3(fbdic_data_sel[3]),
	.sel4(fbdic_data_sel[4]),
	.dout(mux_fsr1_data[119:60]));

mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_5__width_60 m_mux_fsr1_data_59_0           (
	.din0(mcu_fsr1_data_in[59:0]),
	.din1({5{fbdic1_ts_data[11:0]}}),
	.din2(fbdic_ibist_data[59:0]),
	.din3(fbd1_data[59:0]),
	.din4(fbd1_data[107:48]),
	.sel0(fbdic_data_sel[0]),
	.sel1(fbdic_data_sel[1]),
	.sel2(fbdic_data_sel[2]),
	.sel3(fbdic_data_sel[3]),
	.sel4(fbdic_data_sel[4]),
	.dout(mux_fsr1_data[59:0]));

// Channel 0 failover muxes
assign fbdiwr0_data[11:0] = mux_fsr0_data[11:0];

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover0_23_12     (
	.din0(mux_fsr0_data[23:12]),
	.din1(mux_fsr0_data[11:0]),
	.sel0(fbdic0_failover_mask_l[0]),
	.sel1(fbdic0_failover_mask[0]),
	.dout(fbdiwr0_data[23:12]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover0_35_24     (
	.din0(mux_fsr0_data[35:24]),
	.din1(mux_fsr0_data[23:12]),
	.sel0(fbdic0_failover_mask_l[1]),
	.sel1(fbdic0_failover_mask[1]),
	.dout(fbdiwr0_data[35:24]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover0_47_36     (
	.din0(mux_fsr0_data[47:36]),
	.din1(mux_fsr0_data[35:24]),
	.sel0(fbdic0_failover_mask_l[2]),
	.sel1(fbdic0_failover_mask[2]),
	.dout(fbdiwr0_data[47:36]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover0_59_48     (
	.din0(mux_fsr0_data[59:48]),
	.din1(mux_fsr0_data[47:36]),
	.sel0(fbdic0_failover_mask_l[3]),
	.sel1(fbdic0_failover_mask[3]),
	.dout(fbdiwr0_data[59:48]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover0_71_60     (
	.din0(mux_fsr0_data[71:60]),
	.din1(mux_fsr0_data[59:48]),
	.sel0(fbdic0_failover_mask_l[4]),
	.sel1(fbdic0_failover_mask[4]),
	.dout(fbdiwr0_data[71:60]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover0_83_72     (
	.din0(mux_fsr0_data[83:72]),
	.din1(mux_fsr0_data[71:60]),
	.sel0(fbdic0_failover_mask_l[5]),
	.sel1(fbdic0_failover_mask[5]),
	.dout(fbdiwr0_data[83:72]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover0_95_84     (
	.din0(mux_fsr0_data[95:84]),
	.din1(mux_fsr0_data[83:72]),
	.sel0(fbdic0_failover_mask_l[6]),
	.sel1(fbdic0_failover_mask[6]),
	.dout(fbdiwr0_data[95:84]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover0_107_96     (
	.din0(mux_fsr0_data[107:96]),
	.din1(mux_fsr0_data[95:84]),
	.sel0(fbdic0_failover_mask_l[7]),
	.sel1(fbdic0_failover_mask[7]),
	.dout(fbdiwr0_data[107:96]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover0_119_108     (
	.din0(mux_fsr0_data[119:108]),
	.din1(mux_fsr0_data[107:96]),
	.sel0(fbdic0_failover_mask_l[8]),
	.sel1(fbdic0_failover_mask[8]),
	.dout(fbdiwr0_data[119:108]));

// Channel 1 failover muxes
assign fbdiwr1_data[11:0] = mux_fsr1_data[11:0];

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover1_23_12     (
	.din0(mux_fsr1_data[23:12]),
	.din1(mux_fsr1_data[11:0]),
	.sel0(fbdic1_failover_mask_l[0]),
	.sel1(fbdic1_failover_mask[0]),
	.dout(fbdiwr1_data[23:12]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover1_35_24     (
	.din0(mux_fsr1_data[35:24]),
	.din1(mux_fsr1_data[23:12]),
	.sel0(fbdic1_failover_mask_l[1]),
	.sel1(fbdic1_failover_mask[1]),
	.dout(fbdiwr1_data[35:24]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover1_47_36     (
	.din0(mux_fsr1_data[47:36]),
	.din1(mux_fsr1_data[35:24]),
	.sel0(fbdic1_failover_mask_l[2]),
	.sel1(fbdic1_failover_mask[2]),
	.dout(fbdiwr1_data[47:36]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover1_59_48     (
	.din0(mux_fsr1_data[59:48]),
	.din1(mux_fsr1_data[47:36]),
	.sel0(fbdic1_failover_mask_l[3]),
	.sel1(fbdic1_failover_mask[3]),
	.dout(fbdiwr1_data[59:48]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover1_71_60     (
	.din0(mux_fsr1_data[71:60]),
	.din1(mux_fsr1_data[59:48]),
	.sel0(fbdic1_failover_mask_l[4]),
	.sel1(fbdic1_failover_mask[4]),
	.dout(fbdiwr1_data[71:60]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover1_83_72     (
	.din0(mux_fsr1_data[83:72]),
	.din1(mux_fsr1_data[71:60]),
	.sel0(fbdic1_failover_mask_l[5]),
	.sel1(fbdic1_failover_mask[5]),
	.dout(fbdiwr1_data[83:72]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover1_95_84     (
	.din0(mux_fsr1_data[95:84]),
	.din1(mux_fsr1_data[83:72]),
	.sel0(fbdic1_failover_mask_l[6]),
	.sel1(fbdic1_failover_mask[6]),
	.dout(fbdiwr1_data[95:84]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover1_107_96     (
	.din0(mux_fsr1_data[107:96]),
	.din1(mux_fsr1_data[95:84]),
	.sel0(fbdic1_failover_mask_l[7]),
	.sel1(fbdic1_failover_mask[7]),
	.dout(fbdiwr1_data[107:96]));

mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover1_119_108     (
	.din0(mux_fsr1_data[119:108]),
	.din1(mux_fsr1_data[107:96]),
	.sel0(fbdic1_failover_mask_l[8]),
	.sel1(fbdic1_failover_mask[8]),
	.dout(fbdiwr1_data[119:108]));

// XOR of CRC for DTM

mcu_fbdiwr_dp_and_macro__width_22 m_ch0_crc_mask  (
	.din0({sbcmd0_crc[13:0],sbdata0_crc[21:14]}),
	.din1({22{rdpctl_dtm_chnl_enable[0]}}),
	.dout(ch0_crc[21:0]));

mcu_fbdiwr_dp_and_macro__width_22 m_ch1_crc_mask  (
	.din0({sbdata1_crc[21:14],sbcmd1_crc[13:0]}),
	.din1({22{rdpctl_dtm_chnl_enable[1]}}),
	.dout(ch1_crc[21:0]));

mcu_fbdiwr_dp_xor_macro__width_22 m_dtm_crc  (
	.din0(ch0_crc[21:0]),
	.din1(ch1_crc[21:0]),
	.dout(fbdiwr_dtm_crc[21:0]));

// fixscan start:
assign u_ff_sbdata_crc_d1_scanin = scan_in                  ;
assign scan_out                  = u_ff_sbdata_crc_d1_scanout;
// fixscan end:
endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_2__width_14 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [13:0] din0;
  input sel0;
  input [13:0] din1;
  input sel1;
  output [13:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(14)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
.dout(dout[13:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mcu_fbdiwr_dp_msff_macro__mux_aonpe__ports_2__width_28 (
  din0, 
  sel0, 
  din1, 
  sel1, 
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
wire buffout0;
wire buffout1;
wire [27:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [26:0] so;

  input [27:0] din0;
  input sel0;
  input [27:0] din1;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [27:0] dout;


  output scan_out;




cl_dp1_muxbuff2_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(28)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[27:0]),
  .in1(din1[27:0]),
.dout(muxout[27:0])
);
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
dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);




















endmodule









//
//   xor macro for ports = 2,3
//
//





module mcu_fbdiwr_dp_xor_macro__width_14 (
  din0, 
  din1, 
  dout);
  input [13:0] din0;
  input [13:0] din1;
  output [13:0] dout;





xor2 #(14)  d0_0 (
.in0(din0[13:0]),
.in1(din1[13:0]),
.out(dout[13:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbdiwr_dp_mux_macro__mux_pgpe__ports_3__width_36 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [35:0] din0;
  input [35:0] din1;
  input [35:0] din2;
  input sel0;
  input sel1;
  input muxtst;
  input test;
  output [35:0] dout;





cl_dp1_penc3_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
  .test(test)
);

mux3 #(36)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
  .in2(din2[35:0]),
.dout(dout[35:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_3__width_22 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [21:0] din0;
  input sel0;
  input [21:0] din1;
  input sel1;
  input [21:0] din2;
  input sel2;
  output [21:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(22)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[21:0]),
  .in1(din1[21:0]),
  .in2(din2[21:0]),
.dout(dout[21:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbdiwr_dp_mux_macro__mux_aonpe__ports_5__width_60 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [59:0] din0;
  input sel0;
  input [59:0] din1;
  input sel1;
  input [59:0] din2;
  input sel2;
  input [59:0] din3;
  input sel3;
  input [59:0] din4;
  input sel4;
  output [59:0] dout;





cl_dp1_muxbuff5_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4)
);
mux5s #(60)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[59:0]),
  .in1(din1[59:0]),
  .in2(din2[59:0]),
  .in3(din3[59:0]),
  .in4(din4[59:0]),
.dout(dout[59:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbdiwr_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  output [11:0] dout;





mux2s #(12)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
.dout(dout[11:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module mcu_fbdiwr_dp_and_macro__width_22 (
  din0, 
  din1, 
  dout);
  input [21:0] din0;
  input [21:0] din1;
  output [21:0] dout;






and2 #(22)  d0_0 (
.in0(din0[21:0]),
.in1(din1[21:0]),
.out(dout[21:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_fbdiwr_dp_xor_macro__width_22 (
  din0, 
  din1, 
  dout);
  input [21:0] din0;
  input [21:0] din1;
  output [21:0] dout;





xor2 #(22)  d0_0 (
.in0(din0[21:0]),
.in1(din1[21:0]),
.out(dout[21:0])
);








endmodule




