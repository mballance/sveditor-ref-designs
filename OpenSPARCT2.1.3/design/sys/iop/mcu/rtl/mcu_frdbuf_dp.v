// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_frdbuf_dp.v
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
module mcu_frdbuf_dp (
  frdbuf_data, 
  frdbuf_elect_idle_sync, 
  frdbuf_frame_lock, 
  frdbuf_testfail_sync, 
  fsr_data, 
  fsr_stsrx_sync, 
  fsr_stsrx_losdtct, 
  fsr_stsrx_testfail, 
  fdout_rptr, 
  fdout_frame_lock, 
  fbdic_enable_sync_count, 
  rxbclk, 
  drl2clk, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_mcu_fbd_clk_stop, 
  tcu_mcu_testmode, 
  tcu_atpg_mode, 
  scan_in, 
  scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire fbd_siclk;
wire fbd_soclk;
wire fbd_se;
wire ff_clk_stop_sync_scanin;
wire ff_clk_stop_sync_scanout;
wire clk_stop_d1;
wire tcu_pce_ov_d1;
wire rxbclk_stop;
wire fbd_pce_ov;
wire rxbclk_stop_l;
wire rxbclk_stop_atpg;
wire rxb_l1clk;
wire rxb_siclk;
wire rxb_soclk;
wire alat10_so;
wire alat11_so;
wire [11:0] latout;
wire alat9_so;
wire alat8_so;
wire alat7_so;
wire alat6_so;
wire alat5_so;
wire alat4_so;
wire alat3_so;
wire alat2_so;
wire alat1_so;
wire alat0_so;
wire alat0_si;
wire [11:0] latout_buf;
wire [3:0] frdbuf_cnt;
wire fsr_stsrx_sync_lat;
wire [3:0] frdbuf_cnt_next;
wire frdbuf_cnt_cout_unused;
wire fsr_stsrx_losdtct_sync_l;
wire frdbuf_enable_sync_count;
wire [3:0] frdbuf_cnt_in;
wire fbd_siclk_out;
wire fbd_soclk_out;
wire l1clk_cnt;
wire [10:0] sout;
wire ff_cnt_scanout;
wire frdbuf_frame_lock_in;
wire [1:0] frdbuf_wptr_in;
wire [1:0] frdbuf_wptr;
wire fsr_stsrx_losdtct_d1;
wire fsr_stsrx_losdtct_sync;
wire frdbuf_enable_sync_count_in;
wire ff_cnt_scanin;
wire t2;
wire frdbuf_frame_lock_l;
wire [1:0] frdbuf_wptr_l;
wire frdbuf_buffer0_en;
wire ff_buffer0_scanin;
wire ff_buffer0_scanout;
wire [11:0] frdbuf_buffer0;
wire frdbuf_buffer1_en;
wire ff_buffer1_scanin;
wire ff_buffer1_scanout;
wire [11:0] frdbuf_buffer1;
wire frdbuf_buffer2_en;
wire ff_buffer2_scanin;
wire ff_buffer2_scanout;
wire [11:0] frdbuf_buffer2;
wire frdbuf_buffer3_en;
wire ff_buffer3_scanin;
wire ff_buffer3_scanout;
wire [11:0] frdbuf_buffer3;
wire ff_sync_scanin;
wire ff_sync_scanout;
wire frdbuf_testfail_d1;
wire frdbuf_elect_idle_d1;
wire [1:0] fdout_rptr_l;
wire sl0;
wire sl1;
wire sl2;
wire sl3;
wire ff_data_sync_scanin;
wire ff_data_sync_scanout;
wire tcu_mcu_testmode_l;
wire m_scan_mux_scanout;


output [11:0]	frdbuf_data;
output		frdbuf_elect_idle_sync;
output		frdbuf_frame_lock;
output		frdbuf_testfail_sync;

input [11:0]	fsr_data;
input 		fsr_stsrx_sync;
input		fsr_stsrx_losdtct;
input		fsr_stsrx_testfail;
input	[1:0]	fdout_rptr;
input		fdout_frame_lock;
input		fbdic_enable_sync_count;

input		rxbclk;
input		drl2clk;

input		tcu_pce_ov;
input           tcu_aclk;
input           tcu_bclk;
input		tcu_scan_en;
input		tcu_mcu_fbd_clk_stop;
input		tcu_mcu_testmode;
input		tcu_atpg_mode;

input 		scan_in;
output		scan_out;

assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// 
mcu_frdbuf_dp_and_macro m_fbd_siclk (
	.din0(tcu_aclk),
	.din1(tcu_mcu_testmode),
	.dout(fbd_siclk));

mcu_frdbuf_dp_and_macro m_fbd_soclk (
	.din0(tcu_bclk),
	.din1(tcu_mcu_testmode),
	.dout(fbd_soclk));

mcu_frdbuf_dp_and_macro m_fbd_se (
	.din0(tcu_scan_en),
	.din1(tcu_mcu_testmode),
	.dout(fbd_se));

assign ff_clk_stop_sync_scanin = 1'b0;
mcu_frdbuf_dp_msff_macro__stack_11r__width_4 ff_clk_stop_sync  (
	.scan_in(ff_clk_stop_sync_scanin),
	.scan_out(ff_clk_stop_sync_scanout),
	.din({tcu_mcu_fbd_clk_stop, clk_stop_d1, tcu_pce_ov, tcu_pce_ov_d1}),
	.dout({clk_stop_d1, rxbclk_stop, tcu_pce_ov_d1, fbd_pce_ov}),
	.en(1'b1),
	.se(1'b0),
	.siclk(1'b0),
	.soclk(1'b0),
	.pce_ov(1'b0),
	.clk(rxbclk),
  .stop(stop));

// want to turn off clk_stop in atpg_mode 
mcu_frdbuf_dp_inv_macro m_inv_rxbclk_stop (
	.din(rxbclk_stop),
	.dout(rxbclk_stop_l));

mcu_frdbuf_dp_nor_macro m_rxbclk_stop_atpg (
	.din0(rxbclk_stop_l),
	.din1(tcu_atpg_mode),
	.dout(rxbclk_stop_atpg));

////////////////////////////
// SERDES Clock Domain
////////////////////////////

cl_dp1_l1hdr_8x alat_hdr (
	.l2clk(rxbclk),
	.pce(1'b1),
	.aclk(fbd_siclk),
	.bclk(fbd_soclk),
	.l1clk(rxb_l1clk),
	.se(fbd_se),
	.pce_ov(fbd_pce_ov),
	.stop(rxbclk_stop_atpg),
	.siclk_out(rxb_siclk),
	.soclk_out(rxb_soclk));

cl_dp1_alatch_4x alat11 (
	.si(alat10_so),
	.so(alat11_so),
	.q(latout[11]), 
        .d(fsr_data[11]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat10 (
	.si(alat9_so),
	.so(alat10_so),
	.q(latout[10]), 
        .d(fsr_data[10]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat9 (
	.si(alat8_so),
	.so(alat9_so),
	.q(latout[9]), 
        .d(fsr_data[9]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat8 (
	.si(alat7_so),
	.so(alat8_so),
	.q(latout[8]), 
        .d(fsr_data[8]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat7 (
	.si(alat6_so),
	.so(alat7_so),
	.q(latout[7]), 
        .d(fsr_data[7]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat6 (
	.si(alat5_so),
	.so(alat6_so),
	.q(latout[6]), 
        .d(fsr_data[6]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat5 (
	.si(alat4_so),
	.so(alat5_so),
	.q(latout[5]), 
        .d(fsr_data[5]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat4 (
	.si(alat3_so),
	.so(alat4_so),
	.q(latout[4]), 
        .d(fsr_data[4]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat3 (
	.si(alat2_so),
	.so(alat3_so),
	.q(latout[3]), 
        .d(fsr_data[3]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat2 (
	.si(alat1_so),
	.so(alat2_so),
	.q(latout[2]), 
        .d(fsr_data[2]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat1 (
	.si(alat0_so),
	.so(alat1_so),
	.q(latout[1]), 
        .d(fsr_data[1]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

cl_dp1_alatch_4x alat0 (
	.si(alat0_si),
	.so(alat0_so),
	.q(latout[0]), 
        .d(fsr_data[0]), 
	.se(fbd_se),
	.siclk(rxb_siclk),
	.soclk(rxb_soclk),
        .l1clk(rxb_l1clk));

mcu_frdbuf_dp_buff_macro__minbuff_1__stack_12r__width_12 m_alat_buf    (
	.din(latout[11:0]),
	.dout(latout_buf[11:0]));

// Count 4 frame sync signals from SERDES before determining frame lock
// Reset on electrical idle

mcu_frdbuf_dp_increment_macro__width_4 m_frdbuf_cnt_inc    ( 
	.din ( frdbuf_cnt[3:0] ), 
	.cin ( fsr_stsrx_sync_lat ), 
	.dout ( frdbuf_cnt_next[3:0] ), 
	.cout ( frdbuf_cnt_cout_unused ) );

mcu_frdbuf_dp_and_macro__ports_3__width_4 m_frdbuf_cnt_clr  (
	.din0(frdbuf_cnt_next[3:0]),
	.din1({4{fsr_stsrx_losdtct_sync_l}}),
	.din2({4{frdbuf_enable_sync_count}}),
	.dout(frdbuf_cnt_in[3:0]));

// ff_cnt[11:0]
cl_dp1_l1hdr_8x ff_cnt_hdr (
  	.l2clk(rxbclk),
  	.pce(1'b1),
  	.aclk(fbd_siclk),
  	.bclk(fbd_soclk),
  	.siclk_out(fbd_siclk_out),
  	.soclk_out(fbd_soclk_out),
  	.l1clk(l1clk_cnt),
  	.se(fbd_se),
  	.pce_ov(fbd_pce_ov),
  	.stop(rxbclk_stop_atpg));

cl_dp1_alatch_4x ff_cnt_d11 (
	.si(sout[10]),
	.so(ff_cnt_scanout),
	.q(fsr_stsrx_sync_lat), 
        .d(fsr_stsrx_sync), 
	.se(fbd_se),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
        .l1clk(l1clk_cnt));

cl_dp1_msff_4x ff_cnt_d10 (
	.l1clk(l1clk_cnt),
	.d(frdbuf_frame_lock_in),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[9]),
	.so(sout[10]),
	.q(frdbuf_frame_lock));

cl_dp1_msff_4x ff_cnt_d9 (
	.l1clk(l1clk_cnt),
	.d(frdbuf_wptr_in[1]),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[8]),
	.so(sout[9]),
	.q(frdbuf_wptr[1]));

cl_dp1_msff_4x ff_cnt_d8 (
	.l1clk(l1clk_cnt),
	.d(frdbuf_wptr_in[0]),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[7]),
	.so(sout[8]),
	.q(frdbuf_wptr[0]));

cl_dp1_msff_4x ff_cnt_d7 (
	.l1clk(l1clk_cnt),
	.d(frdbuf_cnt_in[3]),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[6]),
	.so(sout[7]),
	.q(frdbuf_cnt[3]));

cl_dp1_msff_4x ff_cnt_d6 (
	.l1clk(l1clk_cnt),
	.d(frdbuf_cnt_in[2]),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[5]),
	.so(sout[6]),
	.q(frdbuf_cnt[2]));

cl_dp1_msff_4x ff_cnt_d5 (
	.l1clk(l1clk_cnt),
	.d(frdbuf_cnt_in[1]),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[4]),
	.so(sout[5]),
	.q(frdbuf_cnt[1]));

cl_dp1_msff_4x ff_cnt_d4 (
	.l1clk(l1clk_cnt),
	.d(frdbuf_cnt_in[0]),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[3]),
	.so(sout[4]),
	.q(frdbuf_cnt[0]));

cl_dp1_msff_4x ff_cnt_d3 (
	.l1clk(l1clk_cnt),
	.d(fsr_stsrx_losdtct),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[2]),
	.so(sout[3]),
	.q(fsr_stsrx_losdtct_d1));

cl_dp1_msff_4x ff_cnt_d2 (
	.l1clk(l1clk_cnt),
	.d(fsr_stsrx_losdtct_d1),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[1]),
	.so(sout[2]),
	.q(fsr_stsrx_losdtct_sync));

cl_dp1_msff_4x ff_cnt_d1 (
	.l1clk(l1clk_cnt),
	.d(fbdic_enable_sync_count),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(sout[0]),
	.so(sout[1]),
	.q(frdbuf_enable_sync_count_in));

cl_dp1_msff_4x ff_cnt_d0 (
	.l1clk(l1clk_cnt),
	.d(frdbuf_enable_sync_count_in),
	.siclk(fbd_siclk_out),
	.soclk(fbd_soclk_out),
	.si(ff_cnt_scanin),
	.so(sout[0]),
	.q(frdbuf_enable_sync_count));

////csret 11/12/2004
//assign frdbuf_frame_lock_in = ~fsr_fbd_elect_idle & (frdbuf_cnt[2] | frdbuf_frame_lock);

mcu_frdbuf_dp_or_macro__ports_2__width_1 m_or_0_0        ( 
	.din0 ( frdbuf_cnt[2] ), 
	.din1 ( frdbuf_frame_lock ), 
	.dout ( t2 ) );

mcu_frdbuf_dp_inv_macro__width_1 m_fsr_fbd_elect_idle_not    ( 
	.din ( fsr_stsrx_losdtct_sync ), 
	.dout ( fsr_stsrx_losdtct_sync_l ) );

mcu_frdbuf_dp_and_macro__ports_2__width_1 m_frdbuf_frame_lock_in        ( 
	.din0 ( fsr_stsrx_losdtct_sync_l ), 
	.din1 ( t2 ), 
	.dout ( frdbuf_frame_lock_in ) );

mcu_frdbuf_dp_inv_macro__width_1 m_frdbuf_frame_lock_inv     ( 
	.din ( frdbuf_frame_lock ), 
	.dout ( frdbuf_frame_lock_l ) );

////csret 11/12/2004
// write pointer for asynchronous buffer, enabled by frame lock in SERDES clock domain
//assign frdbuf_wptr_in[1:0] = {2{frdbuf_frame_lock}} & {frdbuf_wptr[0],~frdbuf_wptr[1]};

mcu_frdbuf_dp_inv_macro__width_2 m_frdbuf_wptr_inv     ( 
	.din ( frdbuf_wptr[1:0] ), 
	.dout ( frdbuf_wptr_l[1:0] ) );

mcu_frdbuf_dp_and_macro__width_2 m_frdbuf_wptr_in  (
	.din0({frdbuf_wptr[0],frdbuf_wptr_l[1]}),
	.din1({2{frdbuf_frame_lock}}),
	.dout(frdbuf_wptr_in[1:0]));

////csret 11/12/2004
// Four deep buffer for asynchronous clock domain crossing 
//assign frdbuf_buffer0_en = frdbuf_frame_lock & ~frdbuf_wptr[1] & ~frdbuf_wptr[0];
mcu_frdbuf_dp_nor_macro__ports_3__width_1 m_frdbuf_buffer0_en        (  
	.din0 ( frdbuf_wptr[0] ),  
	.din1 ( frdbuf_wptr[1] ),  
	.din2 ( frdbuf_frame_lock_l ),  
	.dout ( frdbuf_buffer0_en ) );

mcu_frdbuf_dp_msff_macro__stack_12r__width_12 ff_buffer0   (
	.scan_in(ff_buffer0_scanin),
	.scan_out(ff_buffer0_scanout),
	.din(latout_buf[11:0]),
	.dout(frdbuf_buffer0[11:0]),
	.en(frdbuf_buffer0_en),
	.se(fbd_se),
	.siclk(fbd_siclk),
	.soclk(fbd_soclk),
	.stop(rxbclk_stop_atpg),
	.pce_ov(fbd_pce_ov),
	.clk(rxbclk));

////csret 11/12/2004
//assign frdbuf_buffer1_en = frdbuf_frame_lock & ~frdbuf_wptr[1] & frdbuf_wptr[0];
mcu_frdbuf_dp_nor_macro__ports_3__width_1 m_frdbuf_buffer1_en        ( 
	.din0 ( frdbuf_wptr[1] ), 
	.din1 ( frdbuf_wptr_l[0] ), 
	.din2 ( frdbuf_frame_lock_l ), 
	.dout ( frdbuf_buffer1_en ) );

mcu_frdbuf_dp_msff_macro__stack_12r__width_12 ff_buffer1   (
	.scan_in(ff_buffer1_scanin),
	.scan_out(ff_buffer1_scanout),
	.din(latout_buf[11:0]),
	.dout(frdbuf_buffer1[11:0]),
	.en(frdbuf_buffer1_en),
	.se(fbd_se),
	.siclk(fbd_siclk),
	.soclk(fbd_soclk),
	.stop(rxbclk_stop_atpg),
	.pce_ov(fbd_pce_ov),
	.clk(rxbclk));

////csret 11/12/2004
//assign frdbuf_buffer2_en = frdbuf_frame_lock & frdbuf_wptr[1] & ~frdbuf_wptr[0];
mcu_frdbuf_dp_nor_macro__ports_3__width_1 m_frdbuf_buffer2_en        ( 
	.din0 ( frdbuf_wptr[0] ), 
	.din1 ( frdbuf_wptr_l[1] ), 
	.din2 ( frdbuf_frame_lock_l ), 
	.dout ( frdbuf_buffer2_en ) );

mcu_frdbuf_dp_msff_macro__stack_12r__width_12 ff_buffer2   (
	.scan_in(ff_buffer2_scanin),
	.scan_out(ff_buffer2_scanout),
	.din(latout_buf[11:0]),
	.dout(frdbuf_buffer2[11:0]),
	.en(frdbuf_buffer2_en),
	.se(fbd_se),
	.siclk(fbd_siclk),
	.soclk(fbd_soclk),
	.stop(rxbclk_stop_atpg),
	.pce_ov(fbd_pce_ov),
	.clk(rxbclk));

////csret 11/12/2004
//assign frdbuf_buffer3_en = frdbuf_frame_lock & frdbuf_wptr[1] & frdbuf_wptr[0];
mcu_frdbuf_dp_nor_macro__ports_3__width_1 m_frdbuf_buffer3_en        ( 
	.din0 ( frdbuf_wptr_l[0] ), 
	.din1 ( frdbuf_wptr_l[1] ), 
	.din2 ( frdbuf_frame_lock_l ), 
	.dout ( frdbuf_buffer3_en ) );

mcu_frdbuf_dp_msff_macro__stack_12r__width_12 ff_buffer3   (
	.scan_in(ff_buffer3_scanin),
	.scan_out(ff_buffer3_scanout),
	.din(latout_buf[11:0]),
	.dout(frdbuf_buffer3[11:0]),
	.en(frdbuf_buffer3_en),
	.se(fbd_se),
	.siclk(fbd_siclk),
	.soclk(fbd_soclk),
	.stop(rxbclk_stop_atpg),
	.pce_ov(fbd_pce_ov),
	.clk(rxbclk));

////////////////////////////
// MCU Clock Domain
////////////////////////////

// Synchronize electrical idle and frame lock signals for MCU
mcu_frdbuf_dp_msff_macro__stack_12r__width_4 ff_sync   (
	.scan_in(ff_sync_scanin),
	.scan_out(ff_sync_scanout),
	.din({fsr_stsrx_testfail,frdbuf_testfail_d1,fsr_stsrx_losdtct,frdbuf_elect_idle_d1}),
	.dout({frdbuf_testfail_d1,frdbuf_testfail_sync,frdbuf_elect_idle_d1,frdbuf_elect_idle_sync}),
	.en(1'b1),
	.clk(drl2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_frdbuf_dp_inv_macro__width_2 m_frdbuf_rptr_inv     ( 
	.din ( fdout_rptr[1:0] ), 
	.dout ( fdout_rptr_l[1:0] ) );

// Selection of async buffer output

mcu_frdbuf_dp_nor_macro__ports_2__width_1 m_sl0         ( 
	.dout ( sl0 ), 
	.din0 ( fdout_rptr[0] ), 
	.din1 ( fdout_rptr[1] ) );

mcu_frdbuf_dp_nor_macro__ports_2__width_1 m_sl1         ( 
	.dout ( sl1 ), 
	.din0 ( fdout_rptr_l[0] ),   
	.din1 ( fdout_rptr[1] ) );

mcu_frdbuf_dp_nor_macro__ports_2__width_1 m_sl2         ( 
	.dout ( sl2 ), 
	.din0 ( fdout_rptr[0] ), 
	.din1 ( fdout_rptr_l[1] ) );

mcu_frdbuf_dp_nor_macro__ports_2__width_1 m_sl3         ( 
	.dout ( sl3 ), 
	.din0 ( fdout_rptr_l[0] ),   
	.din1 ( fdout_rptr_l[1] ) );

mcu_frdbuf_dp_msff_macro__mux_aonpe__ports_4__stack_12r__width_12 ff_data_sync         (
	.scan_in(ff_data_sync_scanin),
	.scan_out(ff_data_sync_scanout),
	.din0 ( frdbuf_buffer0[11:0] ), 
	.din1 ( frdbuf_buffer1[11:0] ), 
	.din2 ( frdbuf_buffer2[11:0] ), 
	.din3 ( frdbuf_buffer3[11:0] ), 
	.dout ( frdbuf_data[11:0] ),
	.sel0 ( sl0 ), 
	.sel1 ( sl1 ), 
	.sel2 ( sl2 ), 
	.sel3 ( sl3 ),
	.en   (fdout_frame_lock),
	.clk  (drl2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_frdbuf_dp_inv_macro m_inv_testmode (
	.din(tcu_mcu_testmode),
	.dout(tcu_mcu_testmode_l));

mcu_frdbuf_dp_mux_macro__buffsel_none__mux_aonpe m_scan_mux   (
	.din0(ff_buffer3_scanout),
	.din1(scan_in),
	.sel0(tcu_mcu_testmode),
	.sel1(tcu_mcu_testmode_l),
	.dout(m_scan_mux_scanout));

assign alat0_si                  = scan_in                  ;
assign ff_cnt_scanin             = alat11_so                ;
assign ff_buffer0_scanin         = ff_cnt_scanout           ;
assign ff_buffer1_scanin         = ff_buffer0_scanout       ;
assign ff_buffer2_scanin         = ff_buffer1_scanout       ;
assign ff_buffer3_scanin         = ff_buffer2_scanout       ;
assign ff_sync_scanin            = m_scan_mux_scanout       ;
assign ff_data_sync_scanin       = ff_sync_scanout          ;
assign scan_out                  = ff_data_sync_scanout     ;

endmodule


//  
//   and macro for ports = 2,3,4
//
//





module mcu_frdbuf_dp_and_macro (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module mcu_frdbuf_dp_msff_macro__stack_11r__width_4 (
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









//
//   invert macro
//
//





module mcu_frdbuf_dp_inv_macro (
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
//   nor macro for ports = 2,3
//
//





module mcu_frdbuf_dp_nor_macro (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   buff macro
//
//





module mcu_frdbuf_dp_buff_macro__minbuff_1__stack_12r__width_12 (
  din, 
  dout);
  input [11:0] din;
  output [11:0] dout;






buff #(12)  d0_0 (
.in(din[11:0]),
.out(dout[11:0])
);








endmodule





//
//   increment macro 
//
//





module mcu_frdbuf_dp_increment_macro__width_4 (
  din, 
  cin, 
  dout, 
  cout);
  input [3:0] din;
  input cin;
  output [3:0] dout;
  output cout;






incr #(4)  m0_0 (
.cin(cin),
.in(din[3:0]),
.out(dout[3:0]),
.cout(cout)
);











endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_frdbuf_dp_and_macro__ports_3__width_4 (
  din0, 
  din1, 
  din2, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  input [3:0] din2;
  output [3:0] dout;






and3 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.in2(din2[3:0]),
.out(dout[3:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mcu_frdbuf_dp_or_macro__ports_2__width_1 (
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
//   invert macro
//
//





module mcu_frdbuf_dp_inv_macro__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module mcu_frdbuf_dp_and_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module mcu_frdbuf_dp_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_frdbuf_dp_and_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module mcu_frdbuf_dp_nor_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule









// any PARAMS parms go into naming of macro

module mcu_frdbuf_dp_msff_macro__stack_12r__width_12 (
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
wire [10:0] so;

  input [11:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [11:0] dout;


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
dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mcu_frdbuf_dp_msff_macro__stack_12r__width_4 (
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









//
//   nor macro for ports = 2,3
//
//





module mcu_frdbuf_dp_nor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule









// any PARAMS parms go into naming of macro

module mcu_frdbuf_dp_msff_macro__mux_aonpe__ports_4__stack_12r__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
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
wire buffout2;
wire buffout3;
wire [11:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [10:0] so;

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  input [11:0] din2;
  input sel2;
  input [11:0] din3;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [11:0] dout;


  output scan_out;




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(12)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
  .in3(din3[11:0]),
.dout(muxout[11:0])
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
dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_frdbuf_dp_mux_macro__buffsel_none__mux_aonpe (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





mux2s #(1)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule

