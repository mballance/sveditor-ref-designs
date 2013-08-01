// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2b_fillbf_dp.v
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
module l2b_fillbf_dp (
  l2clk, 
  l2t_l2b_fbrd_en_c3, 
  l2t_l2b_fbrd_wl_c3, 
  l2t_l2b_fbwr_wen_r2, 
  l2t_l2b_fbwr_wl_r2, 
  l2t_l2b_fbd_stdatasel_c3, 
  l2t_l2b_stdecc_c2, 
  mcu_l2b_data_r2, 
  mcu_l2b_ecc_r2, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  mbist_addr, 
  mbist_run, 
  fb_rw_fail, 
  fb_mbist_data, 
  mbist_fb_array_rd_en, 
  mbist_fb_array_wr_en, 
  select_delay_mcu, 
  scan_out, 
  fillbf_l2t_l2b_fbrd_en_c3_v1, 
  fillbf_l2t_l2b_fbrd_en_c3_v2, 
  fillbf_l2t_l2b_fbrd_en_c3_v3, 
  fillbf_l2t_l2b_fbrd_en_c3_v4, 
  fillbf_l2t_l2b_fbrd_wl_c3_v1, 
  fillbf_l2t_l2b_fbrd_wl_c3_v2, 
  fillbf_l2t_l2b_fbrd_wl_c3_v3, 
  fillbf_l2t_l2b_fbrd_wl_c3_v4, 
  fillbf_l2t_l2b_fbwr_wen_r3, 
  fillbf_l2t_l2b_fbwr_wren_r3_v4, 
  fillbf_l2t_l2b_fbwr_wren_r3_v3, 
  fillbf_l2t_l2b_fbwr_wren_r3_v2, 
  fillbf_l2t_l2b_fbwr_wren_r3_v1, 
  fillbf_l2t_l2b_fbwr_wl_r3_v1, 
  fillbf_l2t_l2b_fbwr_wl_r3_v2, 
  fillbf_l2t_l2b_fbwr_wl_r3_v3, 
  fillbf_l2t_l2b_fbwr_wl_r3_v4, 
  fillbf_fb_array_din, 
  l2b_l2d_fbdecc_c4, 
  fbuf_mux_sel);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire ff_mbist_run_scanin;
wire ff_mbist_run_scanout;
wire [7:0] fb_mbist_data_r2;
wire [7:0] fb_mbist_data_r1;
wire mbist_run_reg;
wire [2:0] mbist_addr_reg;
wire mbist_fb_array_rd_en_reg3;
wire mbist_fb_array_rd_en_reg2;
wire mbist_fb_array_rd_en_reg;
wire mbist_fb_array_wr_en_reg;
wire [15:0] fbuf_mux_sel_r1;
wire [15:0] fbuf_mux_sel_r2;
wire ff_mbist_v1_reg_scanin;
wire ff_mbist_v1_reg_scanout;
wire mbist_run_reg_v1;
wire [2:0] mbist_addr_reg_v1;
wire mbist_fb_array_rd_en_reg_v1;
wire mbist_fb_array_wr_en_reg_v1;
wire ff_mbist_v2_reg_scanin;
wire ff_mbist_v2_reg_scanout;
wire mbist_run_reg_v2;
wire [2:0] mbist_addr_reg_v2;
wire mbist_fb_array_rd_en_reg_v2;
wire mbist_fb_array_wr_en_reg_v2;
wire ff_mbist_v3_reg_scanin;
wire ff_mbist_v3_reg_scanout;
wire mbist_run_reg_v3;
wire [2:0] mbist_addr_reg_v3;
wire mbist_fb_array_rd_en_reg_v3;
wire mbist_fb_array_wr_en_reg_v3;
wire ff_mbist_v4_reg_scanin;
wire ff_mbist_v4_reg_scanout;
wire mbist_run_reg_v4;
wire [2:0] mbist_addr_reg_v4;
wire mbist_fb_array_rd_en_reg_v4;
wire mbist_fb_array_wr_en_reg_v4;
wire mbist_run_v1_n;
wire mbist_run_v2_n;
wire mbist_run_v3_n;
wire mbist_run_v4_n;
wire mbist_run_n;
wire fillbf_l2t_l2b_fbrd_en_c3_v4_1;
wire fillbf_l2t_l2b_fbrd_en_c3_v3_1;
wire fillbf_l2t_l2b_fbrd_en_c3_v2_1;
wire fillbf_l2t_l2b_fbrd_en_c3_v1_1;
wire fillbf_l2t_l2b_fbrd_en_c3_v4_2;
wire fillbf_l2t_l2b_fbrd_en_c3_v3_2;
wire fillbf_l2t_l2b_fbrd_en_c3_v2_2;
wire fillbf_l2t_l2b_fbrd_en_c3_v1_2;
wire [2:0] fillbf_l2t_l2b_fbrd_wl_c3_v4_1;
wire [2:0] fillbf_l2t_l2b_fbrd_wl_c3_v3_1;
wire [2:0] fillbf_l2t_l2b_fbrd_wl_c3_v2_1;
wire [2:0] fillbf_l2t_l2b_fbrd_wl_c3_v1_1;
wire [2:0] fillbf_l2t_l2b_fbrd_wl_c3_v4_2;
wire [2:0] fillbf_l2t_l2b_fbrd_wl_c3_v3_2;
wire [2:0] fillbf_l2t_l2b_fbrd_wl_c3_v2_2;
wire [2:0] fillbf_l2t_l2b_fbrd_wl_c3_v1_2;
wire ff_fillbf_control_reg_slice_scanin;
wire ff_fillbf_control_reg_slice_scanout;
wire l2t_l2b_fbd_stdatasel_c4;
wire ff_l2t_l2b_fbwr_wen_r3_bfr_4_scanin;
wire ff_l2t_l2b_fbwr_wen_r3_bfr_4_scanout;
wire [15:0] fillbf_l2t_l2b_fbwr_wen_r3_bfr;
wire ff_l2t_l2b_fbwr_wen_r3_bfr_3_scanin;
wire ff_l2t_l2b_fbwr_wen_r3_bfr_3_scanout;
wire ff_l2t_l2b_fbwr_wen_r3_bfr_2_scanin;
wire ff_l2t_l2b_fbwr_wen_r3_bfr_2_scanout;
wire ff_l2t_l2b_fbwr_wen_r3_bfr_1_scanin;
wire ff_l2t_l2b_fbwr_wen_r3_bfr_1_scanout;
wire fnl_fillbf_l2t_l2b_fbwr_wren_r3_v4;
wire fnl_fillbf_l2t_l2b_fbwr_wren_r3_v3;
wire fnl_fillbf_l2t_l2b_fbwr_wren_r3_v2;
wire fnl_fillbf_l2t_l2b_fbwr_wren_r3_v1;
wire fillbf_l2t_l2b_fbwr_wren_r3_v4_1;
wire fillbf_l2t_l2b_fbwr_wren_r3_v4_2;
wire fillbf_l2t_l2b_fbwr_wren_r3_v3_1;
wire fillbf_l2t_l2b_fbwr_wren_r3_v3_2;
wire fillbf_l2t_l2b_fbwr_wren_r3_v2_1;
wire fillbf_l2t_l2b_fbwr_wren_r3_v2_2;
wire fillbf_l2t_l2b_fbwr_wren_r3_v1_2;
wire fillbf_l2t_l2b_fbwr_wren_r3_v1_1;
wire ff_l2t_l2d_stdecc_c4_10_scanin;
wire ff_l2t_l2d_stdecc_c4_10_scanout;
wire [77:0] l2t_l2b_stdecc_c3;
wire ff_l2t_l2d_stdecc_c4_11_scanin;
wire ff_l2t_l2d_stdecc_c4_11_scanout;
wire ff_l2t_l2d_stdecc_c4_1_scanin;
wire ff_l2t_l2d_stdecc_c4_1_scanout;
wire ff_l2t_l2d_stdecc_c4_2_scanin;
wire ff_l2t_l2d_stdecc_c4_2_scanout;
wire [155:0] l2t_decc_in;
wire [155:0] btu_l2b_decc_r2a;
wire ff_btu_l2b_decc_r3_1a_scanin;
wire ff_btu_l2b_decc_r3_1a_scanout;
wire [155:0] btu_l2b_decc_r2b;
wire ff_btu_l2b_decc_r3_2a_scanin;
wire ff_btu_l2b_decc_r3_2a_scanout;
wire ff_btu_l2b_decc_r3_3a_scanin;
wire ff_btu_l2b_decc_r3_3a_scanout;
wire ff_btu_l2b_decc_r3_4a_scanin;
wire ff_btu_l2b_decc_r3_4a_scanout;
wire select_delay_mcu_n;
wire ff_btu_l2b_decc_r3_1_scanin;
wire ff_btu_l2b_decc_r3_1_scanout;
wire ff_btu_l2b_decc_r3_2_scanin;
wire ff_btu_l2b_decc_r3_2_scanout;
wire ff_btu_l2b_decc_r3_3_scanin;
wire ff_btu_l2b_decc_r3_3_scanout;
wire ff_btu_l2b_decc_r3_4_scanin;
wire ff_btu_l2b_decc_r3_4_scanout;
wire l2t_l2b_fbd_stdatasel_c4_n;
wire [38:0] fill_mbist_dout_0;
wire ff_fill_mbist_dout_reg_0_scanin;
wire ff_fill_mbist_dout_reg_0_scanout;
wire [38:0] fill_mbist_dout_0_reg;
wire [38:0] fill_mbist_dout_1;
wire ff_fill_mbist_dout_reg_1_scanin;
wire ff_fill_mbist_dout_reg_1_scanout;
wire [38:0] fill_mbist_dout_1_reg;
wire [38:0] fill_mbist_dout_2;
wire ff_fill_mbist_dout_reg_2_scanin;
wire ff_fill_mbist_dout_reg_2_scanout;
wire [38:0] fill_mbist_dout_2_reg;
wire [38:0] fill_mbist_dout_3;
wire ff_fill_mbist_dout_reg_3_scanin;
wire ff_fill_mbist_dout_reg_3_scanout;
wire [38:0] fill_mbist_dout_3_reg;
wire select_mbist_10;
wire select_mbist_1;
wire select_mbist_20;
wire select_mbist_2;
wire select_mbist_30;
wire select_mbist_3;
wire select_mbist_40;
wire select_mbist_4;
wire [38:0] fill_mbist_dout;
wire select_mbist_cmp_0;
wire fbuf_mux_sel_r1_0_;
wire fbuf_mux_sel_r1_4_;
wire fbuf_mux_sel_r1_8_;
wire fbuf_mux_sel_r1_12_;
wire select_mbist_cmp_1;
wire fbuf_mux_sel_r1_1_;
wire fbuf_mux_sel_r1_5_;
wire fbuf_mux_sel_r1_9_;
wire fbuf_mux_sel_r1_13_;
wire select_mbist_cmp_2;
wire fbuf_mux_sel_r1_2_;
wire fbuf_mux_sel_r1_6_;
wire fbuf_mux_sel_r1_10_;
wire fbuf_mux_sel_r1_14_;
wire select_mbist_cmp_3;
wire fbuf_mux_sel_r1_3_;
wire fbuf_mux_sel_r1_7_;
wire fbuf_mux_sel_r1_11_;
wire fbuf_mux_sel_r1_15_;
wire [155:0] fbuf_compare_data;
wire [38:0] fill_mbist_cmp_dout;
wire fb_rw_fail1;
wire fb_rw_fail2;
wire fb_rw_fail_unreg;
wire mux_fb_rw_fail_unreg;
wire mbist_fb_array_rd_en_reg4;
wire ff_fb_rw_fail_scanin;
wire ff_fb_rw_fail_scanout;


input            l2clk;
input            l2t_l2b_fbrd_en_c3;
input   [2:0]    l2t_l2b_fbrd_wl_c3;
input   [15:0]   l2t_l2b_fbwr_wen_r2;      // mcu Fill or store in OFF mode.
input   [2:0]    l2t_l2b_fbwr_wl_r2;       // mcu Fill entry.
input            l2t_l2b_fbd_stdatasel_c3; // select store data in OFF mode
input   [77:0]   l2t_l2b_stdecc_c2;       // store data goes to l2b and l2d
input   [127:0]  mcu_l2b_data_r2;           // fill data.
input   [27:0]   mcu_l2b_ecc_r2;            // fill ecc


input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input		tcu_clk_stop;
input           scan_in;
// BIST
input	[2:0]	mbist_addr;
input		mbist_run;
output		fb_rw_fail;
input	[7:0]	fb_mbist_data;
input		mbist_fb_array_rd_en;
input		mbist_fb_array_wr_en;
input		select_delay_mcu;


output           scan_out;
output           fillbf_l2t_l2b_fbrd_en_c3_v1;
output           fillbf_l2t_l2b_fbrd_en_c3_v2;
output           fillbf_l2t_l2b_fbrd_en_c3_v3;
output           fillbf_l2t_l2b_fbrd_en_c3_v4;
output  [2:0]    fillbf_l2t_l2b_fbrd_wl_c3_v1;
output  [2:0]    fillbf_l2t_l2b_fbrd_wl_c3_v2;
output  [2:0]    fillbf_l2t_l2b_fbrd_wl_c3_v3;
output  [2:0]    fillbf_l2t_l2b_fbrd_wl_c3_v4;

output  [15:0]   fillbf_l2t_l2b_fbwr_wen_r3;      // mcu Fill or store in OFF mode.
output           fillbf_l2t_l2b_fbwr_wren_r3_v4;
output           fillbf_l2t_l2b_fbwr_wren_r3_v3;
output           fillbf_l2t_l2b_fbwr_wren_r3_v2;
output           fillbf_l2t_l2b_fbwr_wren_r3_v1;
output  [2:0]    fillbf_l2t_l2b_fbwr_wl_r3_v1;    // mcu Fill entry.
output  [2:0]    fillbf_l2t_l2b_fbwr_wl_r3_v2;
output  [2:0]    fillbf_l2t_l2b_fbwr_wl_r3_v3;
output  [2:0]    fillbf_l2t_l2b_fbwr_wl_r3_v4;
output  [623:0]  fillbf_fb_array_din;                 // FB read data

input	[623:0]	 l2b_l2d_fbdecc_c4;
input	[15:0]	 fbuf_mux_sel;
//output	[77:0]	 fill_mbist_dout;


////////////////////////////////////////////////////////////////////////////////
//	Wire decleration
////////////////////////////////////////////////////////////////////////////////

wire    [ 77:0]  l2t_l2d_stdecc_c4;
wire    [155:0]  btu_l2b_decc_r2, btu_l2b_decc_r3;
wire    [623:0]  ram_decc;
wire    [623:0]  l2t_decc;
wire    [2:0]    fillbf_l2t_l2b_fbwr_wl_r3;

////////////////////////////////////////////////////////////////////////////////

assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2b_fillbf_dp_msff_macro__stack_56c__width_56 ff_mbist_run 
	(
	.scan_in(ff_mbist_run_scanin),
	.scan_out(ff_mbist_run_scanout),
	.dout	({fb_mbist_data_r2[7:0],fb_mbist_data_r1[7:0],mbist_run_reg,mbist_addr_reg[2:0],
		  mbist_fb_array_rd_en_reg3,mbist_fb_array_rd_en_reg2,mbist_fb_array_rd_en_reg,mbist_fb_array_wr_en_reg,
		  fbuf_mux_sel_r1[15:0],fbuf_mux_sel_r2[15:0]}),
	.din	({fb_mbist_data_r1[7:0],fb_mbist_data[7:0],mbist_run,mbist_addr[2:0],
                  mbist_fb_array_rd_en_reg2,mbist_fb_array_rd_en_reg,mbist_fb_array_rd_en,mbist_fb_array_wr_en,
			fbuf_mux_sel[15:0],fbuf_mux_sel_r1[15:0]}),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);


l2b_fillbf_dp_msff_macro__stack_6c__width_6 ff_mbist_v1_reg 
       (
        .scan_in(ff_mbist_v1_reg_scanin),
        .scan_out(ff_mbist_v1_reg_scanout),
        .dout ({mbist_run_reg_v1,mbist_addr_reg_v1[2:0],mbist_fb_array_rd_en_reg_v1,mbist_fb_array_wr_en_reg_v1}),
        .din  ({mbist_run,mbist_addr_reg[2:0],mbist_fb_array_rd_en_reg,mbist_fb_array_wr_en_reg}),
        .clk  (l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
        

l2b_fillbf_dp_msff_macro__stack_6c__width_6 ff_mbist_v2_reg 
       (
        .scan_in(ff_mbist_v2_reg_scanin),
        .scan_out(ff_mbist_v2_reg_scanout),
        .dout ({mbist_run_reg_v2,mbist_addr_reg_v2[2:0],mbist_fb_array_rd_en_reg_v2,mbist_fb_array_wr_en_reg_v2}),
        .din  ({mbist_run,mbist_addr_reg[2:0],mbist_fb_array_rd_en_reg,mbist_fb_array_wr_en_reg}),
        .clk  (l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
        

l2b_fillbf_dp_msff_macro__stack_6c__width_6 ff_mbist_v3_reg 
       (
        .scan_in(ff_mbist_v3_reg_scanin),
        .scan_out(ff_mbist_v3_reg_scanout),
        .dout ({mbist_run_reg_v3,mbist_addr_reg_v3[2:0],mbist_fb_array_rd_en_reg_v3,mbist_fb_array_wr_en_reg_v3}),
        .din  ({mbist_run,mbist_addr_reg[2:0],mbist_fb_array_rd_en_reg,mbist_fb_array_wr_en_reg}),
        .clk  (l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
        

l2b_fillbf_dp_msff_macro__stack_6c__width_6 ff_mbist_v4_reg 
       (
        .scan_in(ff_mbist_v4_reg_scanin),
        .scan_out(ff_mbist_v4_reg_scanout),
        .dout ({mbist_run_reg_v4,mbist_addr_reg_v4[2:0],mbist_fb_array_rd_en_reg_v4,mbist_fb_array_wr_en_reg_v4}),
        .din  ({mbist_run,mbist_addr_reg[2:0],mbist_fb_array_rd_en_reg,mbist_fb_array_wr_en_reg}),
        .clk  (l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
        

l2b_fillbf_dp_inv_macro__width_1   inv_mbist_run_v1 
        (
        .dout   (mbist_run_v1_n),
        .din    (mbist_run_reg_v1)
        );

l2b_fillbf_dp_inv_macro__width_1   inv_mbist_run_v2 
        (
        .dout   (mbist_run_v2_n),
        .din    (mbist_run_reg_v2)
        );

l2b_fillbf_dp_inv_macro__width_1   inv_mbist_run_v3 
        (
        .dout   (mbist_run_v3_n),
        .din    (mbist_run_reg_v3)
        );

l2b_fillbf_dp_inv_macro__width_1   inv_mbist_run_v4 
        (
        .dout   (mbist_run_v4_n),
        .din    (mbist_run_reg_v4)
        );

l2b_fillbf_dp_inv_macro__width_1   inv_mbist_run 
        (
        .dout   (mbist_run_n),
        .din    (mbist_run_reg)
        );

//mux_macro    l2t_l2b_fbrd_en_c3_v1_mux   (width=1,mux=aonpe,ports=2,stack=2r)
//        (
//        .dout   (fillbf_l2t_l2b_fbrd_en_c3_v1),
//        .din0   (l2t_l2b_fbrd_en_c3),
//        .din1   (mbist_fb_array_rd_en_reg_v1),
//        .sel0   (mbist_run_v1_n),
//        .sel1   (mbist_run_reg_v1)
//        );
//
//mux_macro    l2t_l2b_fbrd_en_c3_v2_mux   (width=1,mux=aonpe,ports=2,stack=2r)
//        (
//        .dout   (fillbf_l2t_l2b_fbrd_en_c3_v2),
//        .din0   (l2t_l2b_fbrd_en_c3),
//        .din1   (mbist_fb_array_rd_en_reg_v2),
//        .sel0   (mbist_run_v2_n),
//        .sel1   (mbist_run_reg_v2)
//        );
//
//mux_macro    l2t_l2b_fbrd_en_c3_v3_mux   (width=1,mux=aonpe,ports=2,stack=2r)
//        (
//        .dout   (fillbf_l2t_l2b_fbrd_en_c3_v3),
//        .din0   (l2t_l2b_fbrd_en_c3),
//        .din1   (mbist_fb_array_rd_en_reg_v3),
//        .sel0   (mbist_run_v3_n),
//        .sel1   (mbist_run_reg_v3)
//        );
//
//mux_macro    l2t_l2b_fbrd_en_c3_v4_mux   (width=1,mux=aonpe,ports=2,stack=2r)
//        (
//        .dout   (fillbf_l2t_l2b_fbrd_en_c3_v4),
//        .din0   (l2t_l2b_fbrd_en_c3),
//        .din1   (mbist_fb_array_rd_en_reg_v4),
//        .sel0   (mbist_run_v4_n),
//        .sel1   (mbist_run_reg_v4)
//        );

l2b_fillbf_dp_nand_macro__dnand_8x__ports_2__stack_4r__width_4 nand_l2t_l2b_fbrd_en_c3_a 
	(
	.dout	({fillbf_l2t_l2b_fbrd_en_c3_v4_1,
		  fillbf_l2t_l2b_fbrd_en_c3_v3_1,
		  fillbf_l2t_l2b_fbrd_en_c3_v2_1,
		  fillbf_l2t_l2b_fbrd_en_c3_v1_1}),
	.din0	({4{l2t_l2b_fbrd_en_c3}}),
	.din1	({mbist_run_v4_n,mbist_run_v3_n,
		  mbist_run_v2_n,mbist_run_v1_n})
	);

l2b_fillbf_dp_nand_macro__dnand_8x__ports_2__stack_4r__width_4 nand_l2t_l2b_fbrd_en_c3_b 
        (
        .dout   ({fillbf_l2t_l2b_fbrd_en_c3_v4_2,
                  fillbf_l2t_l2b_fbrd_en_c3_v3_2,
                  fillbf_l2t_l2b_fbrd_en_c3_v2_2,
                  fillbf_l2t_l2b_fbrd_en_c3_v1_2}),
        .din0   ({mbist_fb_array_rd_en_reg_v4,
                  mbist_fb_array_rd_en_reg_v3,
                  mbist_fb_array_rd_en_reg_v2,
                  mbist_fb_array_rd_en_reg_v1}),
	.din1	({mbist_run_reg_v4,mbist_run_reg_v3,mbist_run_reg_v2,mbist_run_reg_v1})
        );

l2b_fillbf_dp_nand_macro__dnand_32x__ports_2__stack_4r__width_4 nand_l2t_l2b_fbrd_en_c3 
        (
        .dout   ({fillbf_l2t_l2b_fbrd_en_c3_v4,
                  fillbf_l2t_l2b_fbrd_en_c3_v3,
                  fillbf_l2t_l2b_fbrd_en_c3_v2,
                  fillbf_l2t_l2b_fbrd_en_c3_v1}),
        .din0   ({fillbf_l2t_l2b_fbrd_en_c3_v4_1,
                  fillbf_l2t_l2b_fbrd_en_c3_v3_1,
                  fillbf_l2t_l2b_fbrd_en_c3_v2_1,
                  fillbf_l2t_l2b_fbrd_en_c3_v1_1}),
        .din1   ({fillbf_l2t_l2b_fbrd_en_c3_v4_2,
                  fillbf_l2t_l2b_fbrd_en_c3_v3_2,
                  fillbf_l2t_l2b_fbrd_en_c3_v2_2,
                  fillbf_l2t_l2b_fbrd_en_c3_v1_2})
        );

		  

//mux_macro    l2t_l2b_fbrd_wl_c3_v1_mux   (width=3,mux=aonpe,ports=2,stack=4r)
//        (
//        .dout   (fillbf_l2t_l2b_fbrd_wl_c3_v1[2:0]),
//        .din0   (l2t_l2b_fbrd_wl_c3[2:0]),
//        .din1   (mbist_addr_reg_v1[2:0]),
//        .sel0   (mbist_run_v1_n),
//        .sel1   (mbist_run_reg_v1)
//        );
//
//mux_macro    l2t_l2b_fbrd_wl_c3_v2_mux   (width=3,mux=aonpe,ports=2,stack=4r)
//        (
//        .dout   (fillbf_l2t_l2b_fbrd_wl_c3_v2[2:0]),
//        .din0   (l2t_l2b_fbrd_wl_c3[2:0]),
//        .din1   (mbist_addr_reg_v2[2:0]),
//        .sel0   (mbist_run_v2_n),
//        .sel1   (mbist_run_reg_v2)
//        );
//
//mux_macro    l2t_l2b_fbrd_wl_c3_v3_mux   (width=3,mux=aonpe,ports=2,stack=4r)
//        (
//        .dout   (fillbf_l2t_l2b_fbrd_wl_c3_v3[2:0]),
//        .din0   (l2t_l2b_fbrd_wl_c3[2:0]),
//        .din1   (mbist_addr_reg_v3[2:0]),
//        .sel0   (mbist_run_v3_n),
//        .sel1   (mbist_run_reg_v3)
//        );
//
//mux_macro    l2t_l2b_fbrd_wl_c3_v4_mux   (width=3,mux=aonpe,ports=2,stack=4r)
//        (
//        .dout   (fillbf_l2t_l2b_fbrd_wl_c3_v4[2:0]),
//        .din0   (l2t_l2b_fbrd_wl_c3[2:0]),
//        .din1   (mbist_addr_reg_v4[2:0]),
//        .sel0   (mbist_run_v4_n),
//        .sel1   (mbist_run_reg_v4)
//        );

l2b_fillbf_dp_nand_macro__dnand_8x__ports_2__stack_12r__width_12 nand_l2t_l2b_fbrd_wl_c3_a	
        (
        .dout   ({fillbf_l2t_l2b_fbrd_wl_c3_v4_1[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v3_1[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v2_1[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v1_1[2:0]}),
        .din0   ({ mbist_addr_reg_v4[2:0],
		   mbist_addr_reg_v3[2:0],
		   mbist_addr_reg_v2[2:0],
		   mbist_addr_reg_v1[2:0]}),
        .din1   ({{3{mbist_run_reg_v4}},
		  {3{mbist_run_reg_v3}},
		  {3{mbist_run_reg_v2}},
		  {3{mbist_run_reg_v1}}})
        );

l2b_fillbf_dp_nand_macro__dnand_8x__ports_2__stack_12r__width_12 nand_l2t_l2b_fbrd_wl_c3_b 
        (
        .dout   ({fillbf_l2t_l2b_fbrd_wl_c3_v4_2[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v3_2[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v2_2[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v1_2[2:0]}),
        .din0   ({4{l2t_l2b_fbrd_wl_c3[2:0]}}),
        .din1   ({{3{mbist_run_v4_n}},
		  {3{mbist_run_v3_n}},
		  {3{mbist_run_v2_n}},
		  {3{mbist_run_v1_n}}})
        );

l2b_fillbf_dp_nand_macro__dnand_32x__ports_2__stack_12r__width_12 nand_l2t_l2b_fbrd_wl_c3 
        (
        .dout   ({fillbf_l2t_l2b_fbrd_wl_c3_v4[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v3[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v2[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v1[2:0]}),
        .din0   ({fillbf_l2t_l2b_fbrd_wl_c3_v4_2[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v3_2[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v2_2[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v1_2[2:0]}),
        .din1   ({fillbf_l2t_l2b_fbrd_wl_c3_v4_1[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v3_1[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v2_1[2:0],
                  fillbf_l2t_l2b_fbrd_wl_c3_v1_1[2:0]})
        );








// assign  fillbf_l2t_l2b_fbrd_en_c3_v1 = l2t_l2b_fbrd_en_c3_fnl;
// assign  fillbf_l2t_l2b_fbrd_en_c3_v2 = l2t_l2b_fbrd_en_c3_fnl;
// assign  fillbf_l2t_l2b_fbrd_en_c3_v3 = l2t_l2b_fbrd_en_c3_fnl;
// assign  fillbf_l2t_l2b_fbrd_en_c3_v4 = l2t_l2b_fbrd_en_c3_fnl;

// assign  fillbf_l2t_l2b_fbrd_wl_c3_v1[2:0] = l2t_l2b_fbrd_wl_c3_fnl[2:0];
// assign  fillbf_l2t_l2b_fbrd_wl_c3_v2[2:0] = l2t_l2b_fbrd_wl_c3_fnl[2:0];
// assign  fillbf_l2t_l2b_fbrd_wl_c3_v3[2:0] = l2t_l2b_fbrd_wl_c3_fnl[2:0];
// assign  fillbf_l2t_l2b_fbrd_wl_c3_v4[2:0] = l2t_l2b_fbrd_wl_c3_fnl[2:0];


l2b_fillbf_dp_msff_macro__stack_4r__width_4    ff_fillbf_control_reg_slice    
              (
		.scan_in(ff_fillbf_control_reg_slice_scanin),
		.scan_out(ff_fillbf_control_reg_slice_scanout),
		.dout  	({l2t_l2b_fbd_stdatasel_c4,fillbf_l2t_l2b_fbwr_wl_r3[2:0]}),
               	.din 	({l2t_l2b_fbd_stdatasel_c3,        l2t_l2b_fbwr_wl_r2[2:0]}),
               	.clk 	(l2clk),
               	.en  	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;

l2b_fillbf_dp_msff_macro__stack_4r__width_4    ff_l2t_l2b_fbwr_wen_r3_bfr_4    
              (
		.scan_in(ff_l2t_l2b_fbwr_wen_r3_bfr_4_scanin),
		.scan_out(ff_l2t_l2b_fbwr_wen_r3_bfr_4_scanout),
		.dout  	({fillbf_l2t_l2b_fbwr_wen_r3_bfr[6],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[4],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[2],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[0]}),
               	.din 	({ l2t_l2b_fbwr_wen_r2[6],
                           l2t_l2b_fbwr_wen_r2[4],
                           l2t_l2b_fbwr_wen_r2[2],
                           l2t_l2b_fbwr_wen_r2[0]}),
               	.clk 	(l2clk),
               	.en  	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;

l2b_fillbf_dp_msff_macro__stack_4r__width_4    ff_l2t_l2b_fbwr_wen_r3_bfr_3    
              (
		.scan_in(ff_l2t_l2b_fbwr_wen_r3_bfr_3_scanin),
		.scan_out(ff_l2t_l2b_fbwr_wen_r3_bfr_3_scanout),
		.dout  	({fillbf_l2t_l2b_fbwr_wen_r3_bfr[7],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[5],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[3],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[1]}),
               	.din 	({ l2t_l2b_fbwr_wen_r2[7],
                           l2t_l2b_fbwr_wen_r2[5],
                           l2t_l2b_fbwr_wen_r2[3],
                           l2t_l2b_fbwr_wen_r2[1]}),
               	.clk 	(l2clk),
               	.en  	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;

l2b_fillbf_dp_msff_macro__stack_4r__width_4    ff_l2t_l2b_fbwr_wen_r3_bfr_2    
              (
		.scan_in(ff_l2t_l2b_fbwr_wen_r3_bfr_2_scanin),
		.scan_out(ff_l2t_l2b_fbwr_wen_r3_bfr_2_scanout),
		.dout  	({fillbf_l2t_l2b_fbwr_wen_r3_bfr[14],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[12],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[10],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[8]}),
               	.din 	({ l2t_l2b_fbwr_wen_r2[14],
                           l2t_l2b_fbwr_wen_r2[12],
                           l2t_l2b_fbwr_wen_r2[10],
                           l2t_l2b_fbwr_wen_r2[8]}),
               	.clk 	(l2clk),
               	.en  	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;

l2b_fillbf_dp_msff_macro__stack_4r__width_4    ff_l2t_l2b_fbwr_wen_r3_bfr_1    
              (
		.scan_in(ff_l2t_l2b_fbwr_wen_r3_bfr_1_scanin),
		.scan_out(ff_l2t_l2b_fbwr_wen_r3_bfr_1_scanout),
		.dout  	({fillbf_l2t_l2b_fbwr_wen_r3_bfr[15],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[13],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[11],
		       	  fillbf_l2t_l2b_fbwr_wen_r3_bfr[9]}),
               	.din 	({ l2t_l2b_fbwr_wen_r2[15],
                           l2t_l2b_fbwr_wen_r2[13],
                           l2t_l2b_fbwr_wen_r2[11],
                           l2t_l2b_fbwr_wen_r2[9]}),
               	.clk 	(l2clk),
               	.en  	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;

// mux_macro    mux_fb_fnl_wordaddr   (width=16,mux=aonpe,ports=2,stack=16r)
//         (
//         .dout   (fillbf_l2t_l2b_fbwr_wen_r3[15:0]),
//         .din0   (fillbf_l2t_l2b_fbwr_wen_r3_bfr[15:0]),
//         .din1   ({16{mbist_fb_array_wr_en_reg}}),
//         .sel0   (mbist_run_n),
//         .sel1   (mbist_run_reg)
//         );

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_6r__width_5    l2t_l2b_fbwr_wen_r3_v4_mux   
        (
        .dout   ({fillbf_l2t_l2b_fbwr_wen_r3[6],
                  fillbf_l2t_l2b_fbwr_wen_r3[4],
                  fillbf_l2t_l2b_fbwr_wen_r3[2],
                  fillbf_l2t_l2b_fbwr_wen_r3[0],fillbf_l2t_l2b_fbwr_wren_r3_v4}),
        .din0   ({fillbf_l2t_l2b_fbwr_wen_r3_bfr[6],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[4],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[2],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[0],fnl_fillbf_l2t_l2b_fbwr_wren_r3_v4}),
        .din1   ({{4{mbist_fb_array_wr_en_reg_v1}},mbist_fb_array_wr_en_reg_v4}),
        .sel0   (mbist_run_v4_n),
        .sel1   (mbist_run_reg_v4)
        );

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_6r__width_5    l2t_l2b_fbwr_wen_r3_v3_mux   
        (
        .dout   ({fillbf_l2t_l2b_fbwr_wen_r3[7],
                  fillbf_l2t_l2b_fbwr_wen_r3[5],
                  fillbf_l2t_l2b_fbwr_wen_r3[3],
                  fillbf_l2t_l2b_fbwr_wen_r3[1],fillbf_l2t_l2b_fbwr_wren_r3_v3}),
        .din0   ({fillbf_l2t_l2b_fbwr_wen_r3_bfr[7],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[5],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[3],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[1],fnl_fillbf_l2t_l2b_fbwr_wren_r3_v3}),
        .din1   ({{4{mbist_fb_array_wr_en_reg_v3}},mbist_fb_array_wr_en_reg_v3}),
        .sel0   (mbist_run_v3_n),
        .sel1   (mbist_run_reg_v3)
        );

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_6r__width_5    l2t_l2b_fbwr_wen_r3_v2_mux   
        (
        .dout   ({fillbf_l2t_l2b_fbwr_wen_r3[14],
                  fillbf_l2t_l2b_fbwr_wen_r3[12],
                  fillbf_l2t_l2b_fbwr_wen_r3[10],
                  fillbf_l2t_l2b_fbwr_wen_r3[8],fillbf_l2t_l2b_fbwr_wren_r3_v2}),
        .din0   ({fillbf_l2t_l2b_fbwr_wen_r3_bfr[14],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[12],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[10],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[8],fnl_fillbf_l2t_l2b_fbwr_wren_r3_v2}),
        .din1   ({{4{mbist_fb_array_wr_en_reg_v2}},mbist_fb_array_wr_en_reg_v2}),
        .sel0   (mbist_run_v2_n),
        .sel1   (mbist_run_reg_v2)
        );

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_6r__width_5    l2t_l2b_fbwr_wen_r3_v1_mux   
        (
        .dout   ({fillbf_l2t_l2b_fbwr_wen_r3[15],
                  fillbf_l2t_l2b_fbwr_wen_r3[13],
                  fillbf_l2t_l2b_fbwr_wen_r3[11],
                  fillbf_l2t_l2b_fbwr_wen_r3[9], fillbf_l2t_l2b_fbwr_wren_r3_v1}),
        .din0   ({fillbf_l2t_l2b_fbwr_wen_r3_bfr[15],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[13],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[11],
                  fillbf_l2t_l2b_fbwr_wen_r3_bfr[9],fnl_fillbf_l2t_l2b_fbwr_wren_r3_v1}),
        .din1   ({{4{mbist_fb_array_wr_en_reg_v1}},mbist_fb_array_wr_en_reg_v1}),
        .sel0   (mbist_run_v1_n),
        .sel1   (mbist_run_reg_v1)
        );

	

l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v4_slice1  
	(
	.dout	(fillbf_l2t_l2b_fbwr_wren_r3_v4_1),
	.din0	(fillbf_l2t_l2b_fbwr_wen_r3[6]),
	.din1	(fillbf_l2t_l2b_fbwr_wen_r3[4])
	);

l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v4_slice2 
        (
        .dout   (fillbf_l2t_l2b_fbwr_wren_r3_v4_2),
        .din0   (fillbf_l2t_l2b_fbwr_wen_r3[2]),
        .din1   (fillbf_l2t_l2b_fbwr_wen_r3[0])
	);

l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v4_slice3 
        (
        .dout   (fnl_fillbf_l2t_l2b_fbwr_wren_r3_v4),
        .din0   (fillbf_l2t_l2b_fbwr_wren_r3_v4_1),
        .din1   (fillbf_l2t_l2b_fbwr_wren_r3_v4_2)
	);
///
l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v3_slice1   
        (
        .dout   (fillbf_l2t_l2b_fbwr_wren_r3_v3_1),
        .din0   (fillbf_l2t_l2b_fbwr_wen_r3[7]),
        .din1   (fillbf_l2t_l2b_fbwr_wen_r3[5])
        );

l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v3_slice2  
        (
        .dout   (fillbf_l2t_l2b_fbwr_wren_r3_v3_2),
        .din0   (fillbf_l2t_l2b_fbwr_wen_r3[3]),
        .din1   (fillbf_l2t_l2b_fbwr_wen_r3[1])
	);

l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v3_slice3  
        (
        .dout   (fnl_fillbf_l2t_l2b_fbwr_wren_r3_v3),
        .din0   (fillbf_l2t_l2b_fbwr_wren_r3_v3_1),
        .din1   (fillbf_l2t_l2b_fbwr_wren_r3_v3_2)
	);

///
l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v2_slice1  
        (
        .dout   (fillbf_l2t_l2b_fbwr_wren_r3_v2_1),
        .din0   (fillbf_l2t_l2b_fbwr_wen_r3[14]),
        .din1   (fillbf_l2t_l2b_fbwr_wen_r3[12])
        );

l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v2_slice2  
        (
        .dout   (fillbf_l2t_l2b_fbwr_wren_r3_v2_2),
        .din0   (fillbf_l2t_l2b_fbwr_wen_r3[10]),
        .din1   (fillbf_l2t_l2b_fbwr_wen_r3[8])
	);
l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v2_slice3  
        (
        .dout   (fnl_fillbf_l2t_l2b_fbwr_wren_r3_v2),
        .din0   (fillbf_l2t_l2b_fbwr_wren_r3_v2_1),
        .din1   (fillbf_l2t_l2b_fbwr_wren_r3_v2_2)
	);

///

l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v1_slice1  
        (
        .dout   (fillbf_l2t_l2b_fbwr_wren_r3_v1_2),
        .din0   (fillbf_l2t_l2b_fbwr_wen_r3[15]),
        .din1   (fillbf_l2t_l2b_fbwr_wen_r3[13])
	);

l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v1_slice2  
        (
        .dout   (fillbf_l2t_l2b_fbwr_wren_r3_v1_1),
        .din0   (fillbf_l2t_l2b_fbwr_wen_r3[11]),
        .din1   (fillbf_l2t_l2b_fbwr_wen_r3[9])
	);

l2b_fillbf_dp_or_macro__width_1 fillbf_l2t_l2b_fbwr_wren_r3_v1_slice3  
        (
        .dout   (fnl_fillbf_l2t_l2b_fbwr_wren_r3_v1),
        .din0   (fillbf_l2t_l2b_fbwr_wren_r3_v1_1),
        .din1   (fillbf_l2t_l2b_fbwr_wren_r3_v1_2)
	);

/// CHANGE 

//msff_macro    ff_fbwr_wl_r3    (width=3)
//              (
//                .dout   (fillbf_l2t_l2b_fbwr_wl_r3[2:0]),
//                .din    (l2t_l2b_fbwr_wl_r2[2:0]),
//                .clk    (l2clk),
//                .en     (1'b1),
//                .scan_in   (),
//                .scan_out  ()
//              ) ;


l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_3    l2t_l2b_fbwr_wl_r3_v1_mux   
        (
        .dout   (fillbf_l2t_l2b_fbwr_wl_r3_v1[2:0]),
        .din0   (fillbf_l2t_l2b_fbwr_wl_r3[2:0]),
        .din1   (mbist_addr_reg_v1[2:0]),
        .sel0   (mbist_run_n),
        .sel1   (mbist_run_reg)
        );


l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_3    l2t_l2b_fbwr_wl_r3_v2_mux   
        (
        .dout   (fillbf_l2t_l2b_fbwr_wl_r3_v2[2:0]),
        .din0   (fillbf_l2t_l2b_fbwr_wl_r3[2:0]),
        .din1   (mbist_addr_reg_v2[2:0]),
        .sel0   (mbist_run_n),
        .sel1   (mbist_run_reg)
        );

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_3    l2t_l2b_fbwr_wl_r3_v3_mux   
        (
        .dout   (fillbf_l2t_l2b_fbwr_wl_r3_v3[2:0]),
        .din0   (fillbf_l2t_l2b_fbwr_wl_r3[2:0]),
        .din1   (mbist_addr_reg_v3[2:0]),
        .sel0   (mbist_run_n),
        .sel1   (mbist_run_reg)
        );


l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_3    l2t_l2b_fbwr_wl_r3_v4_mux   
        (
        .dout   (fillbf_l2t_l2b_fbwr_wl_r3_v4[2:0]),
        .din0   (fillbf_l2t_l2b_fbwr_wl_r3[2:0]),
        .din1   (mbist_addr_reg_v4[2:0]),
        .sel0   (mbist_run_n),
        .sel1   (mbist_run_reg)
        );

// assign fillbf_l2t_l2b_fbwr_wl_r3_v1[2:0] = fillbf_l2t_l2b_fbwr_wl_r3_fnl[2:0] ;
// assign fillbf_l2t_l2b_fbwr_wl_r3_v2[2:0] = fillbf_l2t_l2b_fbwr_wl_r3_fnl[2:0] ;
// assign fillbf_l2t_l2b_fbwr_wl_r3_v3[2:0] = fillbf_l2t_l2b_fbwr_wl_r3_fnl[2:0] ;
// assign fillbf_l2t_l2b_fbwr_wl_r3_v4[2:0] = fillbf_l2t_l2b_fbwr_wl_r3_fnl[2:0] ;


l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_l2t_l2d_stdecc_c4_10    
              (
                .scan_in(ff_l2t_l2d_stdecc_c4_10_scanin),
                .scan_out(ff_l2t_l2d_stdecc_c4_10_scanout),
                .dout   (l2t_l2b_stdecc_c3[38:0]),
                .din    (l2t_l2b_stdecc_c2[38:0]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_l2t_l2d_stdecc_c4_11    
              (
                .scan_in(ff_l2t_l2d_stdecc_c4_11_scanin),
                .scan_out(ff_l2t_l2d_stdecc_c4_11_scanout),
                .dout   (l2t_l2b_stdecc_c3[77:39]),
                .din    (l2t_l2b_stdecc_c2[77:39]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;



l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_l2t_l2d_stdecc_c4_1    
              (
                .scan_in(ff_l2t_l2d_stdecc_c4_1_scanin),
                .scan_out(ff_l2t_l2d_stdecc_c4_1_scanout),
                .dout   (l2t_l2d_stdecc_c4[38:0]),
                .din    (l2t_l2b_stdecc_c3[38:0]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_l2t_l2d_stdecc_c4_2    
              (
                .scan_in(ff_l2t_l2d_stdecc_c4_2_scanin),
                .scan_out(ff_l2t_l2d_stdecc_c4_2_scanout),
                .dout   (l2t_l2d_stdecc_c4[77:39]),
                .din    (l2t_l2b_stdecc_c3[77:39]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


l2b_fillbf_dp_buff_macro__stack_40r__width_39	buff_l2t_l2d_stdecc_c4_1	
		(
		.dout	(l2t_decc_in[38:0]),
		.din	(l2t_l2d_stdecc_c4[38:0])
		);

l2b_fillbf_dp_buff_macro__stack_40r__width_39      buff_l2t_l2d_stdecc_c4_2  
                (
                .dout   (l2t_decc_in[77:39]),
                .din    (l2t_l2d_stdecc_c4[77:39])
                );


l2b_fillbf_dp_buff_macro__stack_40r__width_39      buff_l2t_l2d_stdecc_c4_3        
                (
                .dout   (l2t_decc_in[116:78]),
                .din    (l2t_l2d_stdecc_c4[38:0])
                );

l2b_fillbf_dp_buff_macro__stack_40r__width_39      buff_l2t_l2d_stdecc_c4_4  
                (
                .dout   (l2t_decc_in[155:117]),
                .din    (l2t_l2d_stdecc_c4[77:39])
                );


// assign l2t_decc = {8{l2t_l2d_stdecc_c4[77:0]}};
assign  l2t_decc = {4{l2t_decc_in[155:0]}} ;

assign  btu_l2b_decc_r2a[155:0]  = {mcu_l2b_data_r2[127:96], mcu_l2b_ecc_r2[27:21],
                              mcu_l2b_data_r2[ 95:64], mcu_l2b_ecc_r2[20:14],
                              mcu_l2b_data_r2[ 63:32], mcu_l2b_ecc_r2[13: 7],
                              mcu_l2b_data_r2[ 31: 0], mcu_l2b_ecc_r2[ 6: 0]} ;


l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_btu_l2b_decc_r3_1a    
              (
                .scan_in(ff_btu_l2b_decc_r3_1a_scanin),
                .scan_out(ff_btu_l2b_decc_r3_1a_scanout),
                .dout   (btu_l2b_decc_r2b[38:0]),
                .din    (btu_l2b_decc_r2a[38:0]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_btu_l2b_decc_r3_2a    
              (
                .scan_in(ff_btu_l2b_decc_r3_2a_scanin),
                .scan_out(ff_btu_l2b_decc_r3_2a_scanout),
                .dout   (btu_l2b_decc_r2b[77:39]),
                .din    (btu_l2b_decc_r2a[77:39]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_btu_l2b_decc_r3_3a    
              (
                .scan_in(ff_btu_l2b_decc_r3_3a_scanin),
                .scan_out(ff_btu_l2b_decc_r3_3a_scanout),
                .dout   (btu_l2b_decc_r2b[116:78]),
                .din    (btu_l2b_decc_r2a[116:78]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_btu_l2b_decc_r3_4a    
              (
                .scan_in(ff_btu_l2b_decc_r3_4a_scanin),
                .scan_out(ff_btu_l2b_decc_r3_4a_scanout),
                .dout   (btu_l2b_decc_r2b[155:117]),
                .din    (btu_l2b_decc_r2a[155:117]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


l2b_fillbf_dp_inv_macro__width_1 inv_select_delay_mcu 
	(
	.dout	(select_delay_mcu_n),
	.din	(select_delay_mcu)
	);

l2b_fillbf_dp_mux_macro__dmux_8x__mux_aonpe__stack_40r__width_39   mux_btu_l2b_decc_r2_1	
	(
	.dout	(btu_l2b_decc_r2[155:117]),
	.din0	(btu_l2b_decc_r2b[155:117]),
	.din1	(btu_l2b_decc_r2a[155:117]),
	.sel0	(select_delay_mcu),
	.sel1	(select_delay_mcu_n)
	);

l2b_fillbf_dp_mux_macro__dmux_8x__mux_aonpe__stack_40r__width_39   mux_btu_l2b_decc_r2_2       
        (
        .dout   (btu_l2b_decc_r2[116:78]),
        .din0   (btu_l2b_decc_r2b[116:78]),
        .din1   (btu_l2b_decc_r2a[116:78]),
        .sel0   (select_delay_mcu),
        .sel1   (select_delay_mcu_n)
        );

l2b_fillbf_dp_mux_macro__dmux_8x__mux_aonpe__stack_40r__width_39   mux_btu_l2b_decc_r2_3       
        (
        .dout   (btu_l2b_decc_r2[77:39]),
        .din0   (btu_l2b_decc_r2b[77:39]),
        .din1   (btu_l2b_decc_r2a[77:39]),
        .sel0   (select_delay_mcu),
        .sel1   (select_delay_mcu_n)
        );

l2b_fillbf_dp_mux_macro__dmux_8x__mux_aonpe__stack_40r__width_39   mux_btu_l2b_decc_r2_4       
        (
        .dout   (btu_l2b_decc_r2[38:0]),
        .din0   (btu_l2b_decc_r2b[38:0]),
        .din1   (btu_l2b_decc_r2a[38:0]),
        .sel0   (select_delay_mcu),
        .sel1   (select_delay_mcu_n)
        );

//assign  btu_l2b_decc_r2  = {mcu_l2b_data_r2[127:96], mcu_l2b_ecc_r2[27:21],
//                              mcu_l2b_data_r2[ 95:64], mcu_l2b_ecc_r2[20:14],
//                              mcu_l2b_data_r2[ 63:32], mcu_l2b_ecc_r2[13: 7],
//                              mcu_l2b_data_r2[ 31: 0], mcu_l2b_ecc_r2[ 6: 0]} ;
//

l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_btu_l2b_decc_r3_1    
              (
                .scan_in(ff_btu_l2b_decc_r3_1_scanin),
                .scan_out(ff_btu_l2b_decc_r3_1_scanout),
                .dout   (btu_l2b_decc_r3[38:0]),
                .din    (btu_l2b_decc_r2[38:0]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_btu_l2b_decc_r3_2    
              (
                .scan_in(ff_btu_l2b_decc_r3_2_scanin),
                .scan_out(ff_btu_l2b_decc_r3_2_scanout),
                .dout   (btu_l2b_decc_r3[77:39]),
                .din    (btu_l2b_decc_r2[77:39]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_btu_l2b_decc_r3_3    
              (
                .scan_in(ff_btu_l2b_decc_r3_3_scanin),
                .scan_out(ff_btu_l2b_decc_r3_3_scanout),
                .dout   (btu_l2b_decc_r3[116:78]),
                .din    (btu_l2b_decc_r2[116:78]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2b_fillbf_dp_msff_macro__stack_40r__width_39    ff_btu_l2b_decc_r3_4    
              (
                .scan_in(ff_btu_l2b_decc_r3_4_scanin),
                .scan_out(ff_btu_l2b_decc_r3_4_scanout),
                .dout   (btu_l2b_decc_r3[155:117]),
                .din    (btu_l2b_decc_r2[155:117]),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;




assign  ram_decc   = {4{btu_l2b_decc_r3[155:0]}} ;


//msff_macro    ff_fbd_stdatasel_c4    (width=1)
//              (
//                .dout   (l2t_l2b_fbd_stdatasel_c4),
//                .din    (l2t_l2b_fbd_stdatasel_c3),
//                .clk    (l2clk),
//                .en     (1'b1),
//                .scan_in   (),
//                .scan_out  ()
//              ) ;


l2b_fillbf_dp_inv_macro__width_1 sel1_fillbf_fb_array_din_mux  
	(
	.dout	(l2t_l2b_fbd_stdatasel_c4_n),
	.din	(l2t_l2b_fbd_stdatasel_c4)
	);

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_1  
        (
        .dout   (fillbf_fb_array_din[38:0]),
        .din0   (ram_decc[38:0]),
        .din1   (l2t_decc[38:0]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_2  
        (
        .dout   (fillbf_fb_array_din[77:39]),
        .din0   (ram_decc[77:39]),
        .din1   (l2t_decc[77:39]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_3  
        (
        .dout   (fillbf_fb_array_din[116:78]),
        .din0   (ram_decc[116:78]),
        .din1   (l2t_decc[116:78]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_4  
        (
        .dout   (fillbf_fb_array_din[155:117]),
        .din0   (ram_decc[155:117]),
        .din1   (l2t_decc[155:117]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_5  
        (
        .dout   (fillbf_fb_array_din[194:156]),
        .din0   (ram_decc[194:156]),
        .din1   (l2t_decc[194:156]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_6  
        (
        .dout   (fillbf_fb_array_din[233:195]),
        .din0   (ram_decc[233:195]),
        .din1   (l2t_decc[233:195]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_7  
        (
        .dout   (fillbf_fb_array_din[272:234]),
        .din0   (ram_decc[272:234]),
        .din1   (l2t_decc[272:234]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_8  
        (
        .dout   (fillbf_fb_array_din[311:273]),
        .din0   (ram_decc[311:273]),
        .din1   (l2t_decc[311:273]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_9  
        (
        .dout   (fillbf_fb_array_din[350:312]),
        .din0   (ram_decc[350:312]),
        .din1   (l2t_decc[350:312]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_10  
        (
        .dout   (fillbf_fb_array_din[389:351]),
        .din0   (ram_decc[389:351]),
        .din1   (l2t_decc[389:351]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_11  
        (
        .dout   (fillbf_fb_array_din[428:390]),
        .din0   (ram_decc[428:390]),
        .din1   (l2t_decc[428:390]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_12  
        (
        .dout   (fillbf_fb_array_din[467:429]),
        .din0   (ram_decc[467:429]),
        .din1   (l2t_decc[467:429]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_13  
        (
        .dout   (fillbf_fb_array_din[506:468]),
        .din0   (ram_decc[506:468]),
        .din1   (l2t_decc[506:468]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_14  
        (
        .dout   (fillbf_fb_array_din[545:507]),
        .din0   (ram_decc[545:507]),
        .din1   (l2t_decc[545:507]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );
l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_15  
        (
        .dout   (fillbf_fb_array_din[584:546]),
        .din0   (ram_decc[584:546]),
        .din1   (l2t_decc[584:546]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39       mux_fillbf_fb_array_din_16  
        (
        .dout   (fillbf_fb_array_din[623:585]),
        .din0   (ram_decc[623:585]),
        .din1   (l2t_decc[623:585]),
        .sel0   (l2t_l2b_fbd_stdatasel_c4_n),
        .sel1   (l2t_l2b_fbd_stdatasel_c4)
        );

///////////////////  new 8:1 mux for mbist//////////////////
// input	[623:0]	 l2b_l2d_fbdecc_c4;
// output	[77:0]	 fill_mbist_dout;


l2b_fillbf_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39    mux_fbuf_slice0 
	(
	.dout	(fill_mbist_dout_0[38:0]),
	.din0	(l2b_l2d_fbdecc_c4[38:0]),
	.din1	(l2b_l2d_fbdecc_c4[77:39]),
	.din2	(l2b_l2d_fbdecc_c4[116:78]),
	.din3	(l2b_l2d_fbdecc_c4[155:117]),
	.sel0	(fbuf_mux_sel_r1[0]),
	.sel1	(fbuf_mux_sel_r1[1]),
	.sel2	(fbuf_mux_sel_r1[2]),
	.sel3	(fbuf_mux_sel_r1[3])
	);

l2b_fillbf_dp_msff_macro__stack_40r__width_39  ff_fill_mbist_dout_reg_0 
	(
	.scan_in(ff_fill_mbist_dout_reg_0_scanin),
	.scan_out(ff_fill_mbist_dout_reg_0_scanout),
	.din	(fill_mbist_dout_0[38:0]),
	.dout	(fill_mbist_dout_0_reg[38:0]),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39    mux_fbuf_slice1 
	(
	.dout	(fill_mbist_dout_1[38:0]),
	.din0	(l2b_l2d_fbdecc_c4[194:156]),
	.din1	(l2b_l2d_fbdecc_c4[233:195]),
	.din2	(l2b_l2d_fbdecc_c4[272:234]),
	.din3	(l2b_l2d_fbdecc_c4[311:273]),
	.sel0	(fbuf_mux_sel_r1[4]),
	.sel1	(fbuf_mux_sel_r1[5]),
	.sel2	(fbuf_mux_sel_r1[6]),
	.sel3	(fbuf_mux_sel_r1[7])
	);

l2b_fillbf_dp_msff_macro__stack_40r__width_39  ff_fill_mbist_dout_reg_1 
	(
	.scan_in(ff_fill_mbist_dout_reg_1_scanin),
	.scan_out(ff_fill_mbist_dout_reg_1_scanout),
	.din	(fill_mbist_dout_1[38:0]),
	.dout	(fill_mbist_dout_1_reg[38:0]),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39    mux_fbuf_slice3 
	(
	.dout	(fill_mbist_dout_2[38:0]),
	.din0	(l2b_l2d_fbdecc_c4[350:312]),
	.din1	(l2b_l2d_fbdecc_c4[389:351]),
	.din2	(l2b_l2d_fbdecc_c4[428:390]),
	.din3	(l2b_l2d_fbdecc_c4[467:429]),
	.sel0	(fbuf_mux_sel_r1[8]),
	.sel1	(fbuf_mux_sel_r1[9]),
	.sel2	(fbuf_mux_sel_r1[10]),
	.sel3	(fbuf_mux_sel_r1[11])
	);

l2b_fillbf_dp_msff_macro__stack_40r__width_39  ff_fill_mbist_dout_reg_2 
        (
        .scan_in(ff_fill_mbist_dout_reg_2_scanin),
        .scan_out(ff_fill_mbist_dout_reg_2_scanout),
        .din    (fill_mbist_dout_2[38:0]),
        .dout   (fill_mbist_dout_2_reg[38:0]),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39    mux_fbuf_slice4 
	(
	.dout	(fill_mbist_dout_3[38:0]),
	.din0	(l2b_l2d_fbdecc_c4[506:468]),
	.din1	(l2b_l2d_fbdecc_c4[545:507]),
	.din2	(l2b_l2d_fbdecc_c4[584:546]),
	.din3	(l2b_l2d_fbdecc_c4[623:585]),
	.sel0	(fbuf_mux_sel_r1[12]),
	.sel1	(fbuf_mux_sel_r1[13]),
	.sel2	(fbuf_mux_sel_r1[14]),
	.sel3	(fbuf_mux_sel_r1[15])
	);

l2b_fillbf_dp_msff_macro__stack_40r__width_39  ff_fill_mbist_dout_reg_3 
        (
        .scan_in(ff_fill_mbist_dout_reg_3_scanin),
        .scan_out(ff_fill_mbist_dout_reg_3_scanout),
        .din    (fill_mbist_dout_3[38:0]),
        .dout   (fill_mbist_dout_3_reg[38:0]),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );



l2b_fillbf_dp_or_macro__ports_3__width_1 or_select_mbist_10 
	(
	.dout	(select_mbist_10),
	.din0	(fbuf_mux_sel_r2[0]),
	.din1	(fbuf_mux_sel_r2[1]),
	.din2	(fbuf_mux_sel_r2[2])
	);

l2b_fillbf_dp_or_macro__ports_2__width_1 or_select_mbist_11 
	(
	.dout	(select_mbist_1),
	.din0	(select_mbist_10),
	.din1	(fbuf_mux_sel_r2[3])
	);


l2b_fillbf_dp_or_macro__ports_3__width_1 or_select_mbist_20 
	(
	.dout	(select_mbist_20),
	.din0	(fbuf_mux_sel_r2[4]),
	.din1	(fbuf_mux_sel_r2[5]),
	.din2	(fbuf_mux_sel_r2[6])
	);

l2b_fillbf_dp_or_macro__ports_2__width_1 or_select_mbist_21 
	(
	.dout	(select_mbist_2),
	.din0	(select_mbist_20),
	.din1	(fbuf_mux_sel_r2[7])
	);

l2b_fillbf_dp_or_macro__ports_3__width_1 or_select_mbist_30 
	(
	.dout	(select_mbist_30),
	.din0	(fbuf_mux_sel_r2[8]),
	.din1	(fbuf_mux_sel_r2[9]),
	.din2	(fbuf_mux_sel_r2[10])
	);

l2b_fillbf_dp_or_macro__ports_2__width_1 or_select_mbist_31 
	(
	.dout	(select_mbist_3),
	.din0	(select_mbist_30),
	.din1	(fbuf_mux_sel_r2[11])
	);

l2b_fillbf_dp_or_macro__ports_3__width_1 or_select_mbist_40 
	(
	.dout	(select_mbist_40),
	.din0	(fbuf_mux_sel_r2[12]),
	.din1	(fbuf_mux_sel_r2[13]),
	.din2	(fbuf_mux_sel_r2[14])
	);

l2b_fillbf_dp_or_macro__ports_2__width_1 or_select_mbist_41 
	(
	.dout	(select_mbist_4),
	.din0	(select_mbist_40),
	.din1	(fbuf_mux_sel_r2[15])
	);

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39    mux_fbuf_slice10 
	(
	.dout	(fill_mbist_dout[38:0]),
	.din0	(fill_mbist_dout_0_reg[38:0]),
	.din1	(fill_mbist_dout_1_reg[38:0]),
	.din2	(fill_mbist_dout_2_reg[38:0]),
	.din3	(fill_mbist_dout_3_reg[38:0]),	
	.sel0	(select_mbist_1),
	.sel1	(select_mbist_2),
	.sel2	(select_mbist_3),
	.sel3	(select_mbist_4)
	);


// or_macro or_select_mbist_cmp_10 (width=1,ports=3)
// 	(
// 	.dout	(select_mbist_cmp_10),
// 	.din0	(fbuf_mux_sel_r1[0]),
// 	.din1	(fbuf_mux_sel_r1[4]),
// 	.din2	(fbuf_mux_sel_r1[8])
// 	);

// or_macro or_select_mbist_cmp_11 (width=1,ports=2)
// 	(
// 	.dout	(select_mbist_cmp_0),
// 	.din0	(select_mbist_cmp_10),
// 	.din1	(fbuf_mux_sel_r1[12])
// 	);

// or_macro or_select_mbist_cmp_20 (width=1,ports=3)
// 	(
// 	.dout	(select_mbist_cmp_20),
// 	.din0	(fbuf_mux_sel_r1[1]),
// 	.din1	(fbuf_mux_sel_r1[5]),
// 	.din2	(fbuf_mux_sel_r1[9])
// 	);

// or_macro or_select_mbist_cmp_21 (width=1,ports=2)
// 	(
// 	.dout	(select_mbist_cmp_1),
// 	.din0	(select_mbist_cmp_20),
// 	.din1	(fbuf_mux_sel_r1[13])
// 	);

l2b_fillbf_dp_nand_macro__ports_4__width_1 nand_select_mbist_cmp_10 
	(
	.dout	(select_mbist_cmp_0),
	.din0	(fbuf_mux_sel_r1_0_),
	.din1	(fbuf_mux_sel_r1_4_),
	.din2	(fbuf_mux_sel_r1_8_),
	.din3	(fbuf_mux_sel_r1_12_)
	);

l2b_fillbf_dp_inv_macro__width_4 inv_select_mbist_cmp_10 
	(
	.dout	({fbuf_mux_sel_r1_0_, fbuf_mux_sel_r1_4_, fbuf_mux_sel_r1_8_, fbuf_mux_sel_r1_12_}),
	.din 	({fbuf_mux_sel_r1[0], fbuf_mux_sel_r1[4], fbuf_mux_sel_r1[8], fbuf_mux_sel_r1[12]})
	);


l2b_fillbf_dp_nand_macro__ports_4__width_1 nand_select_mbist_cmp_20 
	(
	.dout	(select_mbist_cmp_1),
	.din0	(fbuf_mux_sel_r1_1_),
	.din1	(fbuf_mux_sel_r1_5_),
	.din2	(fbuf_mux_sel_r1_9_),
	.din3	(fbuf_mux_sel_r1_13_)
	);

l2b_fillbf_dp_inv_macro__width_4 inv_select_mbist_cmp_20 
	(
	.dout	({fbuf_mux_sel_r1_1_, fbuf_mux_sel_r1_5_, fbuf_mux_sel_r1_9_, fbuf_mux_sel_r1_13_}),
	.din 	({fbuf_mux_sel_r1[1], fbuf_mux_sel_r1[5], fbuf_mux_sel_r1[9], fbuf_mux_sel_r1[13]})
	);


l2b_fillbf_dp_nand_macro__ports_4__width_1 nand_select_mbist_cmp_30 
	(
	.dout	(select_mbist_cmp_2),
	.din0	(fbuf_mux_sel_r1_2_),
	.din1	(fbuf_mux_sel_r1_6_),
	.din2	(fbuf_mux_sel_r1_10_),
	.din3	(fbuf_mux_sel_r1_14_)
	);

l2b_fillbf_dp_inv_macro__width_4 inv_select_mbist_cmp_30 
	(
	.dout	({fbuf_mux_sel_r1_2_, fbuf_mux_sel_r1_6_, fbuf_mux_sel_r1_10_, fbuf_mux_sel_r1_14_}),
	.din 	({fbuf_mux_sel_r1[2], fbuf_mux_sel_r1[6], fbuf_mux_sel_r1[10], fbuf_mux_sel_r1[14]})
	);

l2b_fillbf_dp_nand_macro__ports_4__width_1 nand_select_mbist_cmp_40 
	(
	.dout	(select_mbist_cmp_3),
	.din0	(fbuf_mux_sel_r1_3_),
	.din1	(fbuf_mux_sel_r1_7_),
	.din2	(fbuf_mux_sel_r1_11_),
	.din3	(fbuf_mux_sel_r1_15_)
	);

l2b_fillbf_dp_inv_macro__width_4 inv_select_mbist_cmp_40 
	(
	.dout	({fbuf_mux_sel_r1_3_, fbuf_mux_sel_r1_7_, fbuf_mux_sel_r1_11_, fbuf_mux_sel_r1_15_}),
	.din 	({fbuf_mux_sel_r1[3], fbuf_mux_sel_r1[7], fbuf_mux_sel_r1[11], fbuf_mux_sel_r1[15]})
	);

// or_macro or_select_mbist_cmp_31 (width=1,ports=2)
// 	(
// 	.dout	(select_mbist_cmp_2),
// 	.din0	(select_mbist_cmp_30),
// 	.din1	(fbuf_mux_sel_r1[14])
// 	);

// or_macro or_select_mbist_cmp_40 (width=1,ports=3)
// 	(
// 	.dout	(select_mbist_cmp_40),
// 	.din0	(fbuf_mux_sel_r1[3]),
// 	.din1	(fbuf_mux_sel_r1[7]),
// 	.din2	(fbuf_mux_sel_r1[11])
// 	);

// or_macro or_select_mbist_cmp_41 (width=1,ports=2)
// 	(
// 	.dout	(select_mbist_cmp_3),
// 	.din0	(select_mbist_cmp_40),
// 	.din1	(fbuf_mux_sel_r1[15])
// 	);

//assign select_mbist_cmp_0 = fbuf_mux_sel_r1[0] |  fbuf_mux_sel_r1[4] | fbuf_mux_sel_r1[8] |   fbuf_mux_sel_r1[12] ;
//assign select_mbist_cmp_1 = fbuf_mux_sel_r1[1] |  fbuf_mux_sel_r1[5] | fbuf_mux_sel_r1[9] |   fbuf_mux_sel_r1[13] ;
//assign select_mbist_cmp_2 = fbuf_mux_sel_r1[2] |  fbuf_mux_sel_r1[6] | fbuf_mux_sel_r1[10] |  fbuf_mux_sel_r1[14];
//assign select_mbist_cmp_3 = fbuf_mux_sel_r1[3] |  fbuf_mux_sel_r1[7] | fbuf_mux_sel_r1[11] |  fbuf_mux_sel_r1[15];

assign fbuf_compare_data[155:0] = ({fb_mbist_data_r2[3:0],{19{fb_mbist_data_r2[7:0]}}});

l2b_fillbf_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39    mux_fbuf_slice11 
        (
        .dout   (fill_mbist_cmp_dout[38:0]),
        .din0   (fbuf_compare_data[38:0]),
        .din1   (fbuf_compare_data[77:39]),
        .din2   (fbuf_compare_data[116:78]),
        .din3   (fbuf_compare_data[155:117]),
        .sel0   (select_mbist_cmp_0),
        .sel1   (select_mbist_cmp_1),
        .sel2   (select_mbist_cmp_2),
        .sel3   (select_mbist_cmp_3)
        );



l2b_fillbf_dp_cmp_macro__width_32 ff_mbist_compare0  
        (
		.dout   (fb_rw_fail1),
		.din0   (fill_mbist_dout[31:0]),
		.din1   (fill_mbist_cmp_dout[31:0])
        );


l2b_fillbf_dp_cmp_macro__width_8 ff_mbist_compare1  
        (
        .dout   (fb_rw_fail2),
        .din0   ({1'b0,fill_mbist_dout[38:32]}),
        .din1   ({1'b0,fill_mbist_cmp_dout[38:32]})
        //.din1   ({1'b0,fb_mbist_data_r3[6:0]}),
        );

l2b_fillbf_dp_nand_macro__width_1 or_wb_or_rdma_rw_fail 
        (
        .dout   (fb_rw_fail_unreg),
        .din0   (fb_rw_fail1),
        .din1   (fb_rw_fail2)
        );


l2b_fillbf_dp_nand_macro__width_1 nand_rdma_rw_fail_qual 
        (
        .dout   (mux_fb_rw_fail_unreg),
        .din0   (fb_rw_fail_unreg),
        .din1   (mbist_fb_array_rd_en_reg4)
        );


// inv_macro inv_mbist_fb_array_rd_en_reg4 (width=1,stack=2c)
// 	(
// 	.dout	(mbist_fb_array_rd_en_reg4_n),
// 	.din	(mbist_fb_array_rd_en_reg4)
// 	);

// mux_macro mux_wb_or_rdma_rw_fail_unreg (width=1,mux=aonpe,ports=2,stack=2c)
//         (
//         .dout   (mux_fb_rw_fail_unreg),
//         .din0   (fb_rw_fail_unreg),
//         .din1   (1'b1),
//         .sel0   (mbist_fb_array_rd_en_reg4),
//         .sel1   (mbist_fb_array_rd_en_reg4_n)
//         );



l2b_fillbf_dp_msff_macro__stack_2c__width_2 ff_fb_rw_fail  
	(
	.scan_in(ff_fb_rw_fail_scanin),
	.scan_out(ff_fb_rw_fail_scanout),
	.dout	({fb_rw_fail,mbist_fb_array_rd_en_reg4}),
	.din	({mux_fb_rw_fail_unreg,mbist_fb_array_rd_en_reg3}),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
	



// fixscan start:
assign ff_mbist_run_scanin       = scan_in                  ;
assign ff_mbist_v1_reg_scanin    = ff_mbist_run_scanout     ;
assign ff_mbist_v2_reg_scanin    = ff_mbist_v1_reg_scanout  ;
assign ff_mbist_v3_reg_scanin    = ff_mbist_v2_reg_scanout  ;
assign ff_mbist_v4_reg_scanin    = ff_mbist_v3_reg_scanout  ;
assign ff_fillbf_control_reg_slice_scanin = ff_mbist_v4_reg_scanout  ;
assign ff_l2t_l2b_fbwr_wen_r3_bfr_4_scanin = ff_fillbf_control_reg_slice_scanout;
assign ff_l2t_l2b_fbwr_wen_r3_bfr_3_scanin = ff_l2t_l2b_fbwr_wen_r3_bfr_4_scanout;
assign ff_l2t_l2b_fbwr_wen_r3_bfr_2_scanin = ff_l2t_l2b_fbwr_wen_r3_bfr_3_scanout;
assign ff_l2t_l2b_fbwr_wen_r3_bfr_1_scanin = ff_l2t_l2b_fbwr_wen_r3_bfr_2_scanout;
assign ff_l2t_l2d_stdecc_c4_10_scanin = ff_l2t_l2b_fbwr_wen_r3_bfr_1_scanout;
assign ff_l2t_l2d_stdecc_c4_11_scanin = ff_l2t_l2d_stdecc_c4_10_scanout;
assign ff_l2t_l2d_stdecc_c4_1_scanin = ff_l2t_l2d_stdecc_c4_11_scanout;
assign ff_l2t_l2d_stdecc_c4_2_scanin = ff_l2t_l2d_stdecc_c4_1_scanout;
assign ff_btu_l2b_decc_r3_1a_scanin = ff_l2t_l2d_stdecc_c4_2_scanout;
assign ff_btu_l2b_decc_r3_2a_scanin = ff_btu_l2b_decc_r3_1a_scanout;
assign ff_btu_l2b_decc_r3_3a_scanin = ff_btu_l2b_decc_r3_2a_scanout;
assign ff_btu_l2b_decc_r3_4a_scanin = ff_btu_l2b_decc_r3_3a_scanout;
assign ff_btu_l2b_decc_r3_1_scanin = ff_btu_l2b_decc_r3_4a_scanout;
assign ff_btu_l2b_decc_r3_2_scanin = ff_btu_l2b_decc_r3_1_scanout;
assign ff_btu_l2b_decc_r3_3_scanin = ff_btu_l2b_decc_r3_2_scanout;
assign ff_btu_l2b_decc_r3_4_scanin = ff_btu_l2b_decc_r3_3_scanout;
assign ff_fill_mbist_dout_reg_0_scanin = ff_btu_l2b_decc_r3_4_scanout;
assign ff_fill_mbist_dout_reg_1_scanin = ff_fill_mbist_dout_reg_0_scanout;
assign ff_fill_mbist_dout_reg_2_scanin = ff_fill_mbist_dout_reg_1_scanout;
assign ff_fill_mbist_dout_reg_3_scanin = ff_fill_mbist_dout_reg_2_scanout;
assign ff_fb_rw_fail_scanin      = ff_fill_mbist_dout_reg_3_scanout;
assign scan_out                  = ff_fb_rw_fail_scanout    ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_msff_macro__stack_56c__width_56 (
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
wire [54:0] so;

  input [55:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [55:0] dout;


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
dff #(56)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[55:0]),
.si({scan_in,so[54:0]}),
.so({so[54:0],scan_out}),
.q(dout[55:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_msff_macro__stack_6c__width_6 (
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
wire [4:0] so;

  input [5:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [5:0] dout;


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
dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);




















endmodule









//
//   invert macro
//
//





module l2b_fillbf_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2b_fillbf_dp_nand_macro__dnand_8x__ports_2__stack_4r__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nand2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2b_fillbf_dp_nand_macro__dnand_32x__ports_2__stack_4r__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nand2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2b_fillbf_dp_nand_macro__dnand_8x__ports_2__stack_12r__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output [11:0] dout;






nand2 #(12)  d0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout[11:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2b_fillbf_dp_nand_macro__dnand_32x__ports_2__stack_12r__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output [11:0] dout;






nand2 #(12)  d0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout[11:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_msff_macro__stack_4r__width_4 (
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
wire [2:0] so;

  input [3:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [3:0] dout;


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
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_6r__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  output [4:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(5)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[4:0]),
  .in1(din1[4:0]),
.dout(dout[4:0])
);









  



endmodule


//  
//   or macro for ports = 2,3
//
//





module l2b_fillbf_dp_or_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  output [2:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(3)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
.dout(dout[2:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_msff_macro__stack_40r__width_39 (
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
wire [37:0] so;

  input [38:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [38:0] dout;


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
dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);




















endmodule









//
//   buff macro
//
//





module l2b_fillbf_dp_buff_macro__stack_40r__width_39 (
  din, 
  dout);
  input [38:0] din;
  output [38:0] dout;






buff #(39)  d0_0 (
.in(din[38:0]),
.out(dout[38:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_mux_macro__dmux_8x__mux_aonpe__stack_40r__width_39 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [38:0] din0;
  input sel0;
  input [38:0] din1;
  input sel1;
  output [38:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(39)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
.dout(dout[38:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [38:0] din0;
  input sel0;
  input [38:0] din1;
  input sel1;
  output [38:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(39)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
.dout(dout[38:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [38:0] din0;
  input sel0;
  input [38:0] din1;
  input sel1;
  input [38:0] din2;
  input sel2;
  input [38:0] din3;
  input sel3;
  output [38:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(39)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
  .in2(din2[38:0]),
  .in3(din3[38:0]),
.dout(dout[38:0])
);









  



endmodule


//  
//   or macro for ports = 2,3
//
//





module l2b_fillbf_dp_or_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






or3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module l2b_fillbf_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2b_fillbf_dp_nand_macro__ports_4__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  output [0:0] dout;






nand4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module l2b_fillbf_dp_inv_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2b_fillbf_dp_cmp_macro__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2b_fillbf_dp_cmp_macro__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output dout;






cmp #(8)  m0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout)
);










endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2b_fillbf_dp_nand_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2b_fillbf_dp_msff_macro__stack_2c__width_2 (
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
wire [0:0] so;

  input [1:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [1:0] dout;


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
dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);




















endmodule








