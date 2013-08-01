// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2b_rdmard_dp.v
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
module l2b_rdmard_dp (
  l2clk, 
  l2t_l2b_ctag_en_c7, 
  l2t_l2b_ctag_c7, 
  l2t_l2b_req_en_c7, 
  l2d_l2b_decc_out_c7, 
  l2t_l2b_word_c7, 
  l2t_l2b_word_vld_c7, 
  l2b_dbg_sio_ctag_vld, 
  l2b_dbg_sio_ack_type, 
  l2b_dbg_sio_ack_dest, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  scan_out, 
  rdmard_l2b_sio_ctag_vld, 
  rdmard_l2b_sio_data, 
  rdmard_l2b_sio_ue_err, 
  rdmard_l2b_l2t_rdma_uerr_c10, 
  rdmard_l2b_l2t_rdma_cerr_c10, 
  rdmard_l2b_l2t_rdma_notdata_c10, 
  rdmard_l2b_sio_parity) ;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire ff_l2t_l2b_ctag_c8_scanin;
wire ff_l2t_l2b_ctag_c8_scanout;
wire l2t_l2b_ctag_en_c7_reg;
wire ff_l2t_l2b_ctag_c9_scanin;
wire ff_l2t_l2b_ctag_c9_scanout;
wire ff_l2d_l2b_decc_out_c9_1_scanin;
wire ff_l2d_l2b_decc_out_c9_1_scanout;
wire ff_l2d_l2b_decc_out_c9_2_scanin;
wire ff_l2d_l2b_decc_out_c9_2_scanout;
wire ff_l2d_l2b_decc_out_c9_3_scanin;
wire ff_l2d_l2b_decc_out_c9_3_scanout;
wire ff_l2d_l2b_decc_out_c9_4_scanin;
wire ff_l2d_l2b_decc_out_c9_4_scanout;
wire ff_l2d_l2b_decc_out_c9_5_scanin;
wire ff_l2d_l2b_decc_out_c9_5_scanout;
wire ff_l2d_l2b_decc_out_c9_6_scanin;
wire ff_l2d_l2b_decc_out_c9_6_scanout;
wire ff_l2d_l2b_decc_out_c9_7_scanin;
wire ff_l2d_l2b_decc_out_c9_7_scanout;
wire ff_l2d_l2b_decc_out_c9_8_scanin;
wire ff_l2d_l2b_decc_out_c9_8_scanout;
wire ff_l2d_l2b_decc_out_c9_9_scanin;
wire ff_l2d_l2b_decc_out_c9_9_scanout;
wire ff_l2d_l2b_decc_out_c9_10_scanin;
wire ff_l2d_l2b_decc_out_c9_10_scanout;
wire ff_l2d_l2b_decc_out_c9_11_scanin;
wire ff_l2d_l2b_decc_out_c9_11_scanout;
wire ff_l2d_l2b_decc_out_c9_12_scanin;
wire ff_l2d_l2b_decc_out_c9_12_scanout;
wire ff_l2d_l2b_decc_out_c9_13_scanin;
wire ff_l2d_l2b_decc_out_c9_13_scanout;
wire ff_l2d_l2b_decc_out_c9_14_scanin;
wire ff_l2d_l2b_decc_out_c9_14_scanout;
wire ff_l2d_l2b_decc_out_c9_15_scanin;
wire ff_l2d_l2b_decc_out_c9_15_scanout;
wire ff_l2d_l2b_decc_out_c9_16_scanin;
wire ff_l2d_l2b_decc_out_c9_16_scanout;
wire ff_l2t_l2b_word_and_req_en_c8910_scanin;
wire ff_l2t_l2b_word_and_req_en_c8910_scanout;
wire sel_in0_c8;
wire sel_in1_c8;
wire sel_in2_c8;
wire sel_in3_c8;
wire ff_sel_r1_slice_scanin;
wire ff_sel_r1_slice_scanout;
wire sel_r1_in0;
wire sel_r1_in1;
wire sel_r1_in2;
wire sel_r1_in3;
wire ff_sel_r2_slice_scanin;
wire ff_sel_r2_slice_scanout;
wire sel_r2_in0;
wire sel_r2_in1;
wire sel_r2_in2;
wire sel_r2_in3;
wire ff_sel_l1_slice_scanin;
wire ff_sel_l1_slice_scanout;
wire sel_l1_in0;
wire sel_l1_in1;
wire sel_l1_in2;
wire sel_l1_in3;
wire ff_sel_l2_slice_scanin;
wire ff_sel_l2_slice_scanout;
wire sel_l2_in0;
wire sel_l2_in1;
wire sel_l2_in2;
wire sel_l2_in3;
wire [1:0] word_c8;
wire sel_in4_c8;
wire sel_in5_c8;
wire sel_in6_c8;
wire sel_in7_c8;
wire ff_select_inputs_scanin;
wire ff_select_inputs_scanout;
wire ff_l2d_l2b_decc_out_c10_scanin;
wire ff_l2d_l2b_decc_out_c10_scanout;
wire rdmard_notdata_err_c10_unqual;
wire rdmard_notdata_err_c10_n;
wire rdmard_notdata_err_c10;
wire check0_c10_012345_n;
wire check0_c10_012345;
wire parity0_c10_n;
wire orcheck0_and_parity0_n;
wire l2t_l2b_req_en_c9_n;
wire ff_rdmard_err_and_ctag_scanin;
wire ff_rdmard_err_and_ctag_scanout;
wire l2b_dbg_sio_ack_type_unreg;
wire rdmard_notdata_err_c11;
wire rdmard_fnl_uncorr_err_c11;
wire ff_sio_data_scanin;
wire ff_sio_data_scanout;

input            l2clk;
input            l2t_l2b_ctag_en_c7 ;
input   [31:0]   l2t_l2b_ctag_c7 ;// Phase 2 : SIU inteface and packet format change 2/7/04
input            l2t_l2b_req_en_c7 ;
input   [623:0]  l2d_l2b_decc_out_c7 ;
input   [ 3:0]   l2t_l2b_word_c7 ;
input            l2t_l2b_word_vld_c7 ;

// Debug ports
output          l2b_dbg_sio_ctag_vld;
output          l2b_dbg_sio_ack_type;
output          l2b_dbg_sio_ack_dest;


input           tcu_aclk;
input           tcu_bclk;
 input           tcu_scan_en;
input           tcu_pce_ov;
input		tcu_clk_stop;
input           scan_in;
output          scan_out;

output           rdmard_l2b_sio_ctag_vld ;
output  [31:0]   rdmard_l2b_sio_data ;
output           rdmard_l2b_sio_ue_err ;
output           rdmard_l2b_l2t_rdma_uerr_c10 ;
output           rdmard_l2b_l2t_rdma_cerr_c10 ;
output           rdmard_l2b_l2t_rdma_notdata_c10 ; 
output	[1:0]	 rdmard_l2b_sio_parity;



assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

//assign scan_out = 1'b0;

//////////////////////////////////////////////////////////////////////////////////
wire             l2t_l2b_req_en_c8 ;
wire             l2t_l2b_req_en_c9 ;
wire             l2t_l2b_req_en_c10 ;
wire    [ 31:0]  l2t_l2b_ctag_c8 ;// Phase 2 : SIU inteface and packet format change 2/7/04
wire    [ 31:0]  l2t_l2b_ctag_c9 ;// Phase 2 : SIU inteface and packet format change 2/7/04
wire             io_read_c8 ;
wire             l2t_l2b_we_c8 ;
wire    [623:0]  l2d_l2b_decc_out_c8 ;
wire    [623:0]  l2d_l2b_decc_out_c9 ;
wire    [ 38:0]  l2d_l2b_decc_out_c10 ;
wire    [ 31:0]  l2d_l2b_dat_out_c10 ;
wire    [ 31:0]  data_ctag_mux_out_c9 ;
wire    [ 31:0]  data_ctag_mux_out_c10 ;
wire    [  3:0]  l2t_l2b_word_c8 ;
//wire    [  3:0]  l2t_l2b_word_c9 ;
wire             l2t_l2b_word_vld_c8 ;
wire             l2t_l2b_word_vld_c9 ;
wire             l2t_l2b_word_vld_c10 ;

//wire             sel_in0 ;
//wire             sel_in1 ;
//wire             sel_in2 ;
//wire             sel_in3 ;
wire             sel_in4 ;
wire             sel_in5 ;
wire             sel_in6 ;
wire             sel_in7 ;
wire    [155:0]  l2d_l2b_decc_out_c9_4t1 ;
wire    [ 38:0]  l2d_l2b_decc_out_c9_16t1 ;

wire    [  5:0]  check0_c10 ;
wire             parity0_c10 ;
wire             rdmard_uncorr_err_c10 ;
wire             rdmard_uncorr_err_c11 ;
wire             rdmard_corr_err_c10 ;
wire             rdmard_corr_err_c11 ;
//wire	[1:0]	 word_c9 ;

// Phase 2 : SIU Interface changes 2/5/04 
wire	[1:0]	rdmard_l2b_sio_parity;
wire	[1:0]	siu_data_rtn_parity_c10;
//wire	[1:0]	siu_data_rtn_parity_c9;



////////////////////////////////////////////////////////////////////////////////
//
//inv_macro l2t_l2b_ctag_en_c7_inv_slice  (width=1,stack=2r) (
//	.dout	(l2t_l2b_ctag_en_c7_reg_n),
//	.din	(l2t_l2b_ctag_en_c7_reg)
//	);
//


l2b_rdmard_dp_msff_macro__stack_32r__width_32   ff_l2t_l2b_ctag_c8   // Phase 2 : SIU inteface and packet format change 2/7/04
                (
                .scan_in(ff_l2t_l2b_ctag_c8_scanin),
                .scan_out(ff_l2t_l2b_ctag_c8_scanout),
                .din    (l2t_l2b_ctag_c7[31:0]), 
                .clk    (l2clk),
                .dout   (l2t_l2b_ctag_c8[31:0]), 
                .en     (l2t_l2b_ctag_en_c7_reg),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
                );

l2b_rdmard_dp_msff_macro__stack_32r__width_32   ff_l2t_l2b_ctag_c9   // Phase 2 : SIU inteface and packet format change 2/7/04
                (
                .scan_in(ff_l2t_l2b_ctag_c9_scanin),
                .scan_out(ff_l2t_l2b_ctag_c9_scanout),
                .dout   (l2t_l2b_ctag_c9[31:0]), 
                .din    (l2t_l2b_ctag_c8[31:0]), 
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
                );


l2b_rdmard_dp_and_macro__width_1 l2t_l2b_we_c8_slice  
	( 
	.dout 	(l2t_l2b_we_c8), 
	.din0	(l2t_l2b_ctag_c8[16]), // Phase 2 : SIU inteface and packet format change 2/7/04
	.din1	(l2t_l2b_req_en_c8) 
	); 

//
//inv_macro l2t_l2b_we_c8_inv_macro (width=1)
//        ( 
//        .dout   (l2t_l2b_we_c8_n ),
//        .din    (l2t_l2b_we_c8 ) 
//        );
//

assign  l2d_l2b_decc_out_c8 = l2d_l2b_decc_out_c7[623:0] ;


l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_1  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_1_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_1_scanout),
        .dout           (l2d_l2b_decc_out_c9[38:0]),
        .din            (l2d_l2b_decc_out_c8[38:0]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_2  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_2_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_2_scanout),
        .dout           (l2d_l2b_decc_out_c9[77:39]),
        .din            (l2d_l2b_decc_out_c8[77:39]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_3  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_3_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_3_scanout),
        .dout           (l2d_l2b_decc_out_c9[116:78]),
        .din            (l2d_l2b_decc_out_c8[116:78]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_4  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_4_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_4_scanout),
        .dout           (l2d_l2b_decc_out_c9[155:117]),
        .din            (l2d_l2b_decc_out_c8[155:117]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_5  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_5_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_5_scanout),
        .dout           (l2d_l2b_decc_out_c9[194:156]),
        .din            (l2d_l2b_decc_out_c8[194:156]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_6  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_6_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_6_scanout),
        .dout           (l2d_l2b_decc_out_c9[233:195]),
        .din            (l2d_l2b_decc_out_c8[233:195]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_7  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_7_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_7_scanout),
        .dout           (l2d_l2b_decc_out_c9[272:234]),
        .din            (l2d_l2b_decc_out_c8[272:234]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_8  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_8_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_8_scanout),
        .dout           (l2d_l2b_decc_out_c9[311:273]),
        .din            (l2d_l2b_decc_out_c8[311:273]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_9  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_9_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_9_scanout),
        .dout           (l2d_l2b_decc_out_c9[350:312]),
        .din            (l2d_l2b_decc_out_c8[350:312]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_10  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_10_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_10_scanout),
        .dout           (l2d_l2b_decc_out_c9[389:351]),
        .din            (l2d_l2b_decc_out_c8[389:351]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_11  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_11_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_11_scanout),
        .dout           (l2d_l2b_decc_out_c9[428:390]),
        .din            (l2d_l2b_decc_out_c8[428:390]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_12  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_12_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_12_scanout),
        .dout           (l2d_l2b_decc_out_c9[467:429]),
        .din            (l2d_l2b_decc_out_c8[467:429]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_13  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_13_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_13_scanout),
        .dout           (l2d_l2b_decc_out_c9[506:468]),
        .din            (l2d_l2b_decc_out_c8[506:468]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_14  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_14_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_14_scanout),
        .dout           (l2d_l2b_decc_out_c9[545:507]),
        .din            (l2d_l2b_decc_out_c8[545:507]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_15  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_15_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_15_scanout),
        .dout           (l2d_l2b_decc_out_c9[584:546]),
        .din            (l2d_l2b_decc_out_c8[584:546]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_40r__width_39      ff_l2d_l2b_decc_out_c9_16  
        (
        .scan_in(ff_l2d_l2b_decc_out_c9_16_scanin),
        .scan_out(ff_l2d_l2b_decc_out_c9_16_scanout),
        .dout           (l2d_l2b_decc_out_c9[623:585]),
        .din            (l2d_l2b_decc_out_c8[623:585]),
        .clk            (l2clk),
        .en             (l2t_l2b_we_c8),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );



l2b_rdmard_dp_msff_macro__stack_14r__width_10  ff_l2t_l2b_word_and_req_en_c8910    
                  (
                  .scan_in(ff_l2t_l2b_word_and_req_en_c8910_scanin),
                  .scan_out(ff_l2t_l2b_word_and_req_en_c8910_scanout),
                  .dout         ({l2t_l2b_req_en_c8,l2t_l2b_req_en_c9,l2t_l2b_req_en_c10,
                                  l2t_l2b_word_vld_c8,l2t_l2b_word_vld_c9,l2t_l2b_word_vld_c10,
				//  l2t_l2b_word_c9[3:0],
				l2t_l2b_word_c8[3:0]}),
                  .din          ({l2t_l2b_req_en_c7,l2t_l2b_req_en_c8,l2t_l2b_req_en_c9,
                                  l2t_l2b_word_vld_c7,l2t_l2b_word_vld_c8, l2t_l2b_word_vld_c9,
			//	  l2t_l2b_word_c8[3:0],
				l2t_l2b_word_c7[3:0]}),
                  .clk          (l2clk),
                  .en           (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                  );

//////////////////////////////////////////////////////////////////////////////////

// DWORD selection is based on addr<4:3>

l2b_rdmard_dp_cmp_macro__width_4 l2t_l2b_word_c8_cmp1_slice  (
		.din0	({2'b0,l2t_l2b_word_c8[2:1]}),
		.din1	({2'b0,2'b0}),
		.dout	(sel_in0_c8)
		);

l2b_rdmard_dp_cmp_macro__width_4 l2t_l2b_word_c8_cmp2_slice  (
		.din0	({2'b0,l2t_l2b_word_c8[2:1]}),
		.din1	({2'b0,2'b01}),
		.dout	(sel_in1_c8)
		);

l2b_rdmard_dp_cmp_macro__width_4 l2t_l2b_word_c8_cmp3_slice  (
		.din0	({2'b0,l2t_l2b_word_c8[2:1]}),
		.din1	({2'b0,2'b10}),
		.dout	(sel_in2_c8)
		);


l2b_rdmard_dp_nor_macro__ports_3__width_1 select_in01_or_slice  (
	.dout	(sel_in3_c8),
	.din0	(sel_in0_c8),
	.din1	(sel_in1_c8),
	.din2	(sel_in2_c8)
		);

l2b_rdmard_dp_msff_macro__stack_4r__width_4 ff_sel_r1_slice 
        (
        .scan_in(ff_sel_r1_slice_scanin),
        .scan_out(ff_sel_r1_slice_scanout),
        .dout   ({sel_r1_in0,sel_r1_in1,sel_r1_in2,sel_r1_in3}),
        .din    ({sel_in0_c8,sel_in1_c8,sel_in2_c8,sel_in3_c8}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_4r__width_4 ff_sel_r2_slice 
        (
        .scan_in(ff_sel_r2_slice_scanin),
        .scan_out(ff_sel_r2_slice_scanout),
        .dout   ({sel_r2_in0,sel_r2_in1,sel_r2_in2,sel_r2_in3}),
        .din    ({sel_in0_c8,sel_in1_c8,sel_in2_c8,sel_in3_c8}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_4r__width_4 ff_sel_l1_slice 
        (
        .scan_in(ff_sel_l1_slice_scanin),
        .scan_out(ff_sel_l1_slice_scanout),
        .dout   ({sel_l1_in0,sel_l1_in1,sel_l1_in2,sel_l1_in3}),
        .din    ({sel_in0_c8,sel_in1_c8,sel_in2_c8,sel_in3_c8}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_rdmard_dp_msff_macro__stack_4r__width_4 ff_sel_l2_slice 
        (
        .scan_in(ff_sel_l2_slice_scanin),
        .scan_out(ff_sel_l2_slice_scanout),
        .dout   ({sel_l2_in0,sel_l2_in1,sel_l2_in2,sel_l2_in3}),
        .din    ({sel_in0_c8,sel_in1_c8,sel_in2_c8,sel_in3_c8}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );






//////////////////////////////////////////////////////////////////////////////////

assign	word_c8 = { l2t_l2b_word_c8[3], l2t_l2b_word_c8[0] } ;

l2b_rdmard_dp_cmp_macro__width_4 word_c8_cmp1_slice   
		(
		.din0	({2'b0,word_c8[1:0]}),
		.din1	({2'b0, 2'b00}),
		.dout	(sel_in4_c8)
		);

l2b_rdmard_dp_cmp_macro__width_4 word_c8_cmp2_slice   
		(
		.din0	({2'b0,word_c8[1:0]}),
		.din1	({2'b0, 2'b01}),
		.dout	(sel_in5_c8)
		);


l2b_rdmard_dp_cmp_macro__width_4 word_c8_cmp3_slice   
		(
		.din0	({2'b0,word_c8[1:0]}),
		.din1	({2'b0, 2'b10}),
		.dout	(sel_in6_c8)
		);

l2b_rdmard_dp_nor_macro__ports_3__width_1 select_in7_or_slice  (
	.dout	(sel_in7_c8),
	.din0	(sel_in4_c8),
	.din1	(sel_in5_c8),
	.din2	(sel_in6_c8)
		);

l2b_rdmard_dp_msff_macro__stack_4r__width_4 ff_select_inputs 
	(
	.scan_in(ff_select_inputs_scanin),
	.scan_out(ff_select_inputs_scanout),
	.dout	({sel_in7,sel_in6,sel_in5,sel_in4}),
	.din	({sel_in7_c8,sel_in6_c8,sel_in5_c8,sel_in4_c8}),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);


////////////////////////////////////////////////////////////////////////////////////////

l2b_rdmard_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39   mux_l2d_l2b_decc_out_r_1 
		(
                .dout (l2d_l2b_decc_out_c9_4t1[38:0]),
                .din0  (l2d_l2b_decc_out_c9[ 38:  0]),  
                .din1  (l2d_l2b_decc_out_c9[116: 78]),  
                .din2  (l2d_l2b_decc_out_c9[194:156]),  
                .din3  (l2d_l2b_decc_out_c9[272:234]),  
		.sel0 (sel_r1_in3),
		.sel1 (sel_r1_in2),
		.sel2 (sel_r1_in1),
		.sel3 (sel_r1_in0) 
		);
		
l2b_rdmard_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39   mux_l2d_l2b_decc_out_r_2 
		(
               .dout (l2d_l2b_decc_out_c9_4t1[77:39]),
               .din0  (l2d_l2b_decc_out_c9[ 77:39]),  
               .din1  (l2d_l2b_decc_out_c9[155:117]), 
               .din2  (l2d_l2b_decc_out_c9[233:195]), 
               .din3  (l2d_l2b_decc_out_c9[311:273]), 
		.sel0 (sel_r2_in3),
                .sel1 (sel_r2_in2),
                .sel2 (sel_r2_in1),
                .sel3 (sel_r2_in0) 
		);


l2b_rdmard_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39  mux_l2d_l2b_decc_out_l_1 
		(
                .dout  (l2d_l2b_decc_out_c9_4t1[116:78]),
                .din0  (l2d_l2b_decc_out_c9[350:312]),  
                .din1  (l2d_l2b_decc_out_c9[428:390]), 
                .din2  (l2d_l2b_decc_out_c9[506:468]), 
                .din3  (l2d_l2b_decc_out_c9[584:546]), 
		.sel0  (sel_l1_in3),
                .sel1  (sel_l1_in2),
                .sel2  (sel_l1_in1),
                .sel3  (sel_l1_in0) 
		);


l2b_rdmard_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39  mux_l2d_l2b_decc_out_l_2 
		(
                .dout  (l2d_l2b_decc_out_c9_4t1[155:117]),
                .din0  (l2d_l2b_decc_out_c9[389:351]),  
                .din1  (l2d_l2b_decc_out_c9[467:429]), 
                .din2  (l2d_l2b_decc_out_c9[545:507]), 
                .din3  (l2d_l2b_decc_out_c9[623:585]), 
		.sel0  (sel_l2_in3),
                .sel1  (sel_l2_in2),
                .sel2  (sel_l2_in1),
                .sel3  (sel_l2_in0) 
		);



l2b_rdmard_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39  mux_l2d_l2b_decc_out_1 
		(
		.dout (l2d_l2b_decc_out_c9_16t1[38:0]), 	
        	.din0  (l2d_l2b_decc_out_c9_4t1[ 38:  0]),
        	.din1  (l2d_l2b_decc_out_c9_4t1[ 77: 39]),
        	.din2  (l2d_l2b_decc_out_c9_4t1[116: 78]),
        	.din3  (l2d_l2b_decc_out_c9_4t1[155:117]),
		.sel0  (sel_in7),
                .sel1  (sel_in6),
                .sel2  (sel_in5),
                .sel3  (sel_in4) 
		);

l2b_rdmard_dp_msff_macro__stack_40r__width_39    ff_l2d_l2b_decc_out_c10   
                (
                .scan_in(ff_l2d_l2b_decc_out_c10_scanin),
                .scan_out(ff_l2d_l2b_decc_out_c10_scanout),
                .dout      (l2d_l2b_decc_out_c10[38:0]), 
                .clk       (l2clk),
                .din       (l2d_l2b_decc_out_c9_16t1[38:0]), 
                .en        (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
                );

//
//////////////////////////////////////////////////////////////////////////////////

l2b_ecc39_dp u_ecctree_39b
  (.dout   (l2d_l2b_dat_out_c10[31:0]),
   .cflag  (check0_c10[5:0]),
   .pflag  (parity0_c10),
   .parity (l2d_l2b_decc_out_c10[6:0]),
   .din    (l2d_l2b_decc_out_c10[38:7])
  ) ;

// assign rdmard_notdata_err_c10 = ({check0_c10,parity0_c10} == 7'b1111111);

l2b_rdmard_dp_cmp_macro__width_8 cmp_rdmard_notdata_err 
        (
        .din0   ({1'b0,7'b1111111}),
        .din1   ({1'b0,parity0_c10,check0_c10[5:0]}),
        .dout   (rdmard_notdata_err_c10_unqual)
        );

l2b_rdmard_dp_nand_macro__stack_2c__width_1 and_rdmard_notdata_err_c10 
	(
	.dout	(rdmard_notdata_err_c10_n),
	.din0	(rdmard_notdata_err_c10_unqual),
	.din1	(l2t_l2b_word_vld_c10)
	);

l2b_rdmard_dp_inv_macro__width_1 inv_rdmard_notdata_err_c10_n 
	(
      .dout   (rdmard_notdata_err_c10),
      .din   (rdmard_notdata_err_c10_n)
	);

//or_macro check0_or01_slice1 (width=1) (
//.dout(check0_c10_01),
//.din0(check0_c10[0]),
//.din1(check0_c10[1])
//);
//
//or_macro check0_or23_slice1 (width=1) (
//.dout(check0_c10_23),
//.din0(check0_c10[3]),
//.din1(check0_c10[2])
//);
//
//or_macro check0_or45_slice1 (width=1) (
//.dout(check0_c10_45),
//.din0(check0_c10[5]),
//.din1(check0_c10[4])
//);
//
//or_macro check0_or0123_slice1 (width=1) (
//.dout(check0_c10_0123),
//.din0(check0_c10_01),
//.din1(check0_c10_23)
//);
//
////or_macro check0_or0123_slice1 (width=1) (
////.dout(check0_c10_0123),
////.din0(check0_c10_01),
////.din1(check0_c10_23)
////);
//
//or_macro check0_or012345_slice1 (width=1) (
//.dout(check0_c10_012345),
//.din0(check0_c10_0123),
//.din1(check0_c10_45)
//);

l2b_rdmard_dp_cmp_macro__width_8 cmp_check0_slice   
	(
	.dout	(check0_c10_012345_n),
	.din0	({2'b0,check0_c10[5:0]}),
	.din1	(8'b0)
	);

l2b_rdmard_dp_inv_macro__width_1 inv_check0_c10_012345_n 
	(
	.dout	(check0_c10_012345),
	.din	(check0_c10_012345_n)
	);

l2b_rdmard_dp_inv_macro__width_1 parity0_c10_invert_slice   (
	.dout	(parity0_c10_n),
	.din	(parity0_c10)
	);

l2b_rdmard_dp_and_macro__width_1 check0_and_parity0_slice  (
	.dout(orcheck0_and_parity0_n),
	.din0(check0_c10_012345),
	.din1(parity0_c10_n)
	);


// bug id. Needs to log DRU on encountering UE/ND on ld64
l2b_rdmard_dp_and_macro__ports_3__width_1 rdmard_uncorr_err_c10_slice  (
        .dout(rdmard_uncorr_err_c10),
        .din0(l2t_l2b_word_vld_c10),
        .din1(rdmard_notdata_err_c10_n),
        .din2(orcheck0_and_parity0_n)
        );

l2b_rdmard_dp_and_macro__ports_3__width_1 rdmard_corr_err_c10_and_slice  (
	.dout(rdmard_corr_err_c10),
	.din0(l2t_l2b_word_vld_c10),
        .din1(rdmard_notdata_err_c10_n),
	.din2(parity0_c10)
	);



l2b_rdmard_dp_inv_macro__width_1 l2t_l2b_req_en_c9_inv_slice   (
	.dout	(l2t_l2b_req_en_c9_n),
	.din	(l2t_l2b_req_en_c9)
	);


l2b_rdmard_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_32     mux_data_ctag_c9   
        (
        .dout  (data_ctag_mux_out_c9[31:0]),
        .din0  (l2d_l2b_dat_out_c10[31:0]),
        .din1  (l2t_l2b_ctag_c9[31:0]),
        .sel0  (l2t_l2b_req_en_c9_n),
        .sel1  (l2t_l2b_req_en_c9)
        );

//
//  Phase 2 : SIU interface changes : 2/5/04 
//  SIU now needs the data return data_ctag_mux_out_c9[31:0] 
//  bus between L2 and SIU to be
//  parity protected on 16 bit boundary.
//  

// For timing reasons moved these to c10

//
//prty_macro    siu_dtartn_15_0_prty  (width=16)
//        (
//        .din(data_ctag_mux_out_c9[15:0]),
//        .dout(siu_data_rtn_parity_c9[0])
//        );
//
//prty_macro    siu_dtartn_31_16_prty  (width=16)
//        (
//        .din(data_ctag_mux_out_c9[31:16]),
//        .dout(siu_data_rtn_parity_c9[1])
//        );


l2b_rdmard_dp_prty_macro__width_16    siu_dtartn_15_0_prty  
        (
        .din(data_ctag_mux_out_c10[15:0]),
        .dout(siu_data_rtn_parity_c10[0])
        );

l2b_rdmard_dp_prty_macro__width_16    siu_dtartn_31_16_prty  
        (
        .din(data_ctag_mux_out_c10[31:16]),
        .dout(siu_data_rtn_parity_c10[1])
        );



//msff_macro   ff_data_ctag_mux_out_c10   (width=32) 
//                (
//                .din    	(data_ctag_mux_out_c9[31:0]),
//                .clk    	(l2clk),
//                .dout   	(data_ctag_mux_out_c10[31:0]),
//                .en     	(1'b1), 
//                .scan_in        (), 
//                .scan_out       ()
//                );
//
//msff_macro   ff_siu_data_rtn_parity   (width=2)
//                (
//                .din          (siu_data_rtn_parity_c9[1:0]),
//                .clk          (l2clk),
//                .dout         (siu_data_rtn_parity_c10[1:0]),
//                .en           (1'b1),
//                .scan_in        (),
//                .scan_out       ()
//                );
//
//msff_macro   ff_rdmard_uncorr_err_c11   (width=1) 
//                (
//                .din    	(rdmard_uncorr_err_c10),
//                .clk    	(l2clk),
//                .dout   	(rdmard_uncorr_err_c11),
//                .en     	(1'b1), 
//                .scan_in        (), 
//                .scan_out       ()
//                );
//
//msff_macro    ff_rdmard_corr_err_c11  (width=1) 
//                (
//                .din    	(rdmard_corr_err_c10),
//                .clk    	(l2clk),
//                .dout   	(rdmard_corr_err_c11),
//                .en     	(1'b1), 
//                .scan_in        (), 
//                .scan_out       ()
//                );

//msff_macro ff_rdmard_err_and_ctag	(width=37,stack=38r)
//	(
//        .scan_in(ff_rdmard_err_and_ctag_scanin),
//        .scan_out(ff_rdmard_err_and_ctag_scanout),
//        .din          ({rdmard_corr_err_c10,rdmard_uncorr_err_c10,rdmard_notdata_err_c10,
//                        data_ctag_mux_out_c9[31:0],siu_data_rtn_parity_c9[1:0]}),
//        .clk          (l2clk),
//        .dout         ({rdmard_corr_err_c11,rdmard_uncorr_err_c11,rdmard_notdata_err_c11,
//                        data_ctag_mux_out_c10[31:0],siu_data_rtn_parity_c10[1:0]}),
//        .en           (1'b1),
//        );

l2b_rdmard_dp_msff_macro__stack_39r__width_39 ff_rdmard_err_and_ctag     
      (
        .scan_in(ff_rdmard_err_and_ctag_scanin),
        .scan_out(ff_rdmard_err_and_ctag_scanout),
        .din          ({l2t_l2b_ctag_en_c7,rdmard_corr_err_c10,rdmard_uncorr_err_c10,rdmard_notdata_err_c10,
                        data_ctag_mux_out_c9[31:0],data_ctag_mux_out_c10[20],
			l2b_dbg_sio_ack_type_unreg,l2t_l2b_req_en_c10}),
        .clk          (l2clk),
        .dout         ({l2t_l2b_ctag_en_c7_reg,rdmard_corr_err_c11,rdmard_uncorr_err_c11,rdmard_notdata_err_c11,
                        data_ctag_mux_out_c10[31:0],l2b_dbg_sio_ack_dest,l2b_dbg_sio_ack_type,
			l2b_dbg_sio_ctag_vld}),
        .en           (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


// BS 06/13/04 Added Notdata logic
// in case a siu read reads notdata , should turn that into a UE when sending to SIU
// However it will be logged as Notdata error in L2 in l2t_csr_ctl.sv
 
l2b_rdmard_dp_or_macro__width_1 rdmard_fnl_ue  (
.dout(rdmard_fnl_uncorr_err_c11),
.din0(rdmard_uncorr_err_c11),
.din1(rdmard_notdata_err_c11)
);




//////////////////////////////////////////////////////////////////////////////////
//assign  rdmard_l2b_sio_ctag_vld        = l2t_l2b_req_en_c10 ;
//assign  rdmard_l2b_sio_data            = data_ctag_mux_out_c10[31:0] ;
//assign  rdmard_l2b_sio_ue_err          = rdmard_fnl_uncorr_err_c11 ;
assign  rdmard_l2b_l2t_rdma_uerr_c10   = rdmard_uncorr_err_c11 ;
assign  rdmard_l2b_l2t_rdma_cerr_c10   = rdmard_corr_err_c11 ;
assign  rdmard_l2b_l2t_rdma_notdata_c10   = rdmard_notdata_err_c11 ;
//assign  rdmard_l2b_sio_parity[1:0]     = siu_data_rtn_parity_c10[1:0];

// for debug
//assign l2b_dbg_sio_ctag_vld		= l2t_l2b_req_en_c10;
////assign l2b_dbg_sio_ack_type		= data_ctag_mux_out_c10[21] & l2t_l2b_req_en_c10;
l2b_rdmard_dp_and_macro__width_1  and_l2b_dbg_sio_ack_type 
	(
	.dout	(l2b_dbg_sio_ack_type_unreg),
	.din0	(data_ctag_mux_out_c10[21]),
	.din1	(l2t_l2b_req_en_c10)
	);

//assign l2b_dbg_sio_ack_dest		= data_ctag_mux_out_c10[20];

l2b_rdmard_dp_msff_macro__dmsff_32x__stack_36r__width_36 ff_sio_data  
	(
	.scan_in(ff_sio_data_scanin),
	.scan_out(ff_sio_data_scanout),
	.dout	({rdmard_l2b_sio_ctag_vld,rdmard_l2b_sio_data[31:0],rdmard_l2b_sio_ue_err,rdmard_l2b_sio_parity[1:0]}),
	.din	({l2t_l2b_req_en_c10,data_ctag_mux_out_c10[31:0],rdmard_fnl_uncorr_err_c11,siu_data_rtn_parity_c10[1:0]}),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);



// fixscan start:
assign ff_l2t_l2b_ctag_c8_scanin = scan_in                  ;
assign ff_l2t_l2b_ctag_c9_scanin = ff_l2t_l2b_ctag_c8_scanout;
assign ff_l2d_l2b_decc_out_c9_1_scanin = ff_l2t_l2b_ctag_c9_scanout;
assign ff_l2d_l2b_decc_out_c9_2_scanin = ff_l2d_l2b_decc_out_c9_1_scanout;
assign ff_l2d_l2b_decc_out_c9_3_scanin = ff_l2d_l2b_decc_out_c9_2_scanout;
assign ff_l2d_l2b_decc_out_c9_4_scanin = ff_l2d_l2b_decc_out_c9_3_scanout;
assign ff_l2d_l2b_decc_out_c9_5_scanin = ff_l2d_l2b_decc_out_c9_4_scanout;
assign ff_l2d_l2b_decc_out_c9_6_scanin = ff_l2d_l2b_decc_out_c9_5_scanout;
assign ff_l2d_l2b_decc_out_c9_7_scanin = ff_l2d_l2b_decc_out_c9_6_scanout;
assign ff_l2d_l2b_decc_out_c9_8_scanin = ff_l2d_l2b_decc_out_c9_7_scanout;
assign ff_l2d_l2b_decc_out_c9_9_scanin = ff_l2d_l2b_decc_out_c9_8_scanout;
assign ff_l2d_l2b_decc_out_c9_10_scanin = ff_l2d_l2b_decc_out_c9_9_scanout;
assign ff_l2d_l2b_decc_out_c9_11_scanin = ff_l2d_l2b_decc_out_c9_10_scanout;
assign ff_l2d_l2b_decc_out_c9_12_scanin = ff_l2d_l2b_decc_out_c9_11_scanout;
assign ff_l2d_l2b_decc_out_c9_13_scanin = ff_l2d_l2b_decc_out_c9_12_scanout;
assign ff_l2d_l2b_decc_out_c9_14_scanin = ff_l2d_l2b_decc_out_c9_13_scanout;
assign ff_l2d_l2b_decc_out_c9_15_scanin = ff_l2d_l2b_decc_out_c9_14_scanout;
assign ff_l2d_l2b_decc_out_c9_16_scanin = ff_l2d_l2b_decc_out_c9_15_scanout;
assign ff_l2t_l2b_word_and_req_en_c8910_scanin = ff_l2d_l2b_decc_out_c9_16_scanout;
assign ff_sel_r1_slice_scanin    = ff_l2t_l2b_word_and_req_en_c8910_scanout;
assign ff_sel_r2_slice_scanin    = ff_sel_r1_slice_scanout  ;
assign ff_sel_l1_slice_scanin    = ff_sel_r2_slice_scanout  ;
assign ff_sel_l2_slice_scanin    = ff_sel_l1_slice_scanout  ;
assign ff_select_inputs_scanin   = ff_sel_l2_slice_scanout  ;
assign ff_l2d_l2b_decc_out_c10_scanin = ff_select_inputs_scanout ;
assign ff_rdmard_err_and_ctag_scanin = ff_l2d_l2b_decc_out_c10_scanout;
assign ff_sio_data_scanin        = ff_rdmard_err_and_ctag_scanout;
assign scan_out                  = ff_sio_data_scanout      ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module l2b_rdmard_dp_msff_macro__stack_32r__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









//  
//   and macro for ports = 2,3,4
//
//





module l2b_rdmard_dp_and_macro__width_1 (
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

module l2b_rdmard_dp_msff_macro__stack_40r__width_39 (
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













// any PARAMS parms go into naming of macro

module l2b_rdmard_dp_msff_macro__stack_14r__width_10 (
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
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


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
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2b_rdmard_dp_cmp_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output dout;






cmp #(4)  m0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout)
);










endmodule





//
//   nor macro for ports = 2,3
//
//





module l2b_rdmard_dp_nor_macro__ports_3__width_1 (
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

module l2b_rdmard_dp_msff_macro__stack_4r__width_4 (
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

module l2b_rdmard_dp_mux_macro__mux_aonpe__ports_4__stack_40r__width_39 (
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
//   xor macro for ports = 2,3
//
//





module l2b_rdmard_dp_xor_macro__dxor_8x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module l2b_rdmard_dp_xor_macro__dxor_16x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module l2b_rdmard_dp_xor_macro__dxor_16x__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   invert macro
//
//





module l2b_rdmard_dp_inv_macro__dinv_32x__stack_1r__width_1 (
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





module l2b_rdmard_dp_nand_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nand3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2b_rdmard_dp_nor_macro__ports_2__width_1 (
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
//   xor macro for ports = 2,3
//
//





module l2b_rdmard_dp_xor_macro__stack_32r__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;





xor2 #(32)  d0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2b_rdmard_dp_cmp_macro__width_8 (
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





module l2b_rdmard_dp_nand_macro__stack_2c__width_1 (
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





//
//   invert macro
//
//





module l2b_rdmard_dp_inv_macro__width_1 (
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





module l2b_rdmard_dp_and_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






and3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_rdmard_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  output [31:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   parity macro (even parity)
//
//





module l2b_rdmard_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule









// any PARAMS parms go into naming of macro

module l2b_rdmard_dp_msff_macro__stack_39r__width_39 (
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
//   or macro for ports = 2,3
//
//





module l2b_rdmard_dp_or_macro__width_1 (
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









// any PARAMS parms go into naming of macro

module l2b_rdmard_dp_msff_macro__dmsff_32x__stack_36r__width_36 (
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
wire [34:0] so;

  input [35:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [35:0] dout;


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
dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);




















endmodule








