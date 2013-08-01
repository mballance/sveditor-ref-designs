// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_arbdat_dp.v
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
module l2t_arbdat_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  tcu_dectest, 
  tcu_muxtest, 
  ique_iq_arbdp_data_px2, 
  snpd_snpq_arbdp_data_px2, 
  mb_data_read_data, 
  misbuf_buf_rd_en, 
  mbdata_cmp_sel, 
  l2t_mb2_wdata, 
  mbdata_fail_bot, 
  tag_data_array_wr_active_c1, 
  misbuf_arb_l2rd_en, 
  arb_mux2_snpsel_px2, 
  arb_mux3_bufsel_px2, 
  arb_mux4_c1sel_px2, 
  arb_decc_data_sel_c9, 
  arb_bist_or_diag_acc_c1, 
  arbdec_arbdp_poison_c1, 
  bist_data_data_c1, 
  bist_data_enable_c1, 
  decc_arbdp_data_c8, 
  arb_dword_mask_c8, 
  arbdec_arbdp_inst_bufidhi_c1, 
  sel_diag_store_data_c7, 
  l2clk, 
  scan_in, 
  l2t_mb2_run, 
  scan_out, 
  st_ack_data, 
  arbdat_arbdp_oque_int_ret_c7, 
  arbdat_arbdp_store_data_c2, 
  arbdat_arbdata_wr_data_c2, 
  arbdat_mbdata_inst_data_c8, 
  arbdat_csr_inst_wr_data_c8, 
  arbdat_word_lower_cmp_c8, 
  arbdat_word_upper_cmp_c8, 
  arb_inst_vld_c2_prev, 
  dec_col_offset_prev_c1, 
  arbadr_arbdp_addr5to4_c1, 
  tag_l2d_col_offset_c2);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire muxtst;
wire test;
wire ff_read_mbdata_reg1_scanin;
wire ff_read_mbdata_reg1_scanout;
wire ff_read_mbdata_reg2_scanin;
wire ff_read_mbdata_reg2_scanout;
wire arb_mux2_snpsel_px2_n;
wire arb_mux3_bufsel_px2_n;
wire arb_mux4_c1sel_px2_n;
wire ff_data_c11_scanin;
wire ff_data_c11_scanout;
wire ff_data_c12_scanin;
wire ff_data_c12_scanout;
wire ff_decc_data_c91_scanin;
wire ff_decc_data_c91_scanout;
wire ff_decc_data_c92_scanin;
wire ff_decc_data_c92_scanout;
wire arb_decc_data_sel_c9_n;
wire poison_qual_c1;
wire tag_data_array_wr_active_c1_n;
wire arbdec_arbdp_inst_bufidhi;
wire arbdec_arbdp_inst_bufidhi_n;
wire postecc_1_poison1;
wire postecc_1_poison0;
wire bist_data_enable_c1_n;
wire [63:0] arbdp_wr_data_c2_buff;
wire arb_bist_or_diag_acc_c1_n;
wire ff_data31to0_c2_scanin;
wire ff_data31to0_c2_scanout;
wire postecc_1_poison_33;
wire postecc_1_poison_32;
wire ff_data63to32_c2_scanin;
wire ff_data63to32_c2_scanout;
wire ff_ecc0to6_c2_scanin;
wire ff_ecc0to6_c2_scanout;
wire ff_ecc7to13_c2_scanin;
wire ff_ecc7to13_c2_scanout;
wire ff_data_c21_scanin;
wire ff_data_c21_scanout;
wire ff_data_c22_scanin;
wire ff_data_c22_scanout;
wire ff_data_c31_scanin;
wire ff_data_c31_scanout;
wire ff_data_c32_scanin;
wire ff_data_c32_scanout;
wire ff_data_c41_scanin;
wire ff_data_c41_scanout;
wire ff_data_c42_scanin;
wire ff_data_c42_scanout;
wire ff_data_c51_scanin;
wire ff_data_c51_scanout;
wire ff_data_c52_scanin;
wire ff_data_c52_scanout;
wire ff_data_c521_scanin;
wire ff_data_c521_scanout;
wire ff_data_c522_scanin;
wire ff_data_c522_scanout;
wire ff_data_c61_scanin;
wire ff_data_c61_scanout;
wire ff_data_c62_scanin;
wire ff_data_c62_scanout;
wire ff_data_c71_scanin;
wire ff_data_c71_scanout;
wire ff_data_c72_scanin;
wire ff_data_c72_scanout;
wire ff_data_c81_scanin;
wire ff_data_c81_scanout;
wire ff_data_c82_scanin;
wire ff_data_c82_scanout;
wire sel_diag_store_data_c8;
wire sel_diag_store_data_c8_n;
wire sel_diag_store_data_c7_n;
wire arb_dword_mask_c8_0_n;
wire sel_mux0_data_c6_0;
wire sel_mux0_data_c6_1;
wire arb_dword_mask_c8_7_n;
wire l2t_mb2_run_r1;
wire [7:0] l2t_mb2_wdata_r2;
wire arb_dword_mask_c8_1_n;
wire sel_mux1_data_c6_0;
wire sel_mux1_data_c6_1;
wire arb_dword_mask_c8_6_n;
wire arb_dword_mask_c8_2_n;
wire sel_mux2_data_c6_0;
wire sel_mux2_data_c6_1;
wire arb_dword_mask_c8_5_n;
wire arb_dword_mask_c8_3_n;
wire sel_mux3_data_c6_0;
wire sel_mux3_data_c6_1;
wire arb_dword_mask_c8_4_n;
wire sel_mux4_data_c6_0;
wire sel_mux4_data_c6_1;
wire sel_mux5_data_c6_0;
wire sel_mux5_data_c6_1;
wire sel_mux6_data_c6_0;
wire sel_mux6_data_c6_1;
wire sel_mux7_data_c6_0;
wire sel_mux7_data_c6_1;
wire mbdata_test_active;
wire misbuf_buf_rd_en_r2_qual;
wire misbuf_buf_rd_en_r2;
wire [31:0] mbdata_cmp_data;
wire mbdata_fail_unreg_w;
wire mbdata_fail_unreg;
wire misbuf_buf_rd_en_r2_n;
wire [7:0] l2t_mb2_wdata_r4;
wire ff_mbdata_mbist_reg_scanin;
wire ff_mbdata_mbist_reg_scanout;
wire [7:0] l2t_mb2_wdata_r1;
wire [7:0] l2t_mb2_wdata_r3;
wire misbuf_buf_rd_en_r1;
wire arb_inst_vld_c2_prev_n;
wire [1:0] arbadr_arbdp_addr5to4_c1_n;
wire col_offset_sel_c1_n;
wire col_offset_sel_c1;
wire [3:0] dec_col_offset_c1;
wire ff_col_offset_sel_c2_scanin;
wire ff_col_offset_sel_c2_scanout;
wire [3:0] dec_col_offset_c2;
wire [3:0] col_offset_dec_prev_c2;
wire col_offset_sel_c2;
wire col_offset_sel_c2_n;
wire [3:0] tag_l2d_col_offset_c2_1;
wire [3:0] tag_l2d_col_offset_c2_2;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 input tcu_clk_stop;
input	tcu_dectest;
 input tcu_muxtest;

 
input	[63:0]	ique_iq_arbdp_data_px2; // IQ data 
 
input	[63:0]	snpd_snpq_arbdp_data_px2 ; // from snpd 
 
input	[63:0]	mb_data_read_data; // data read from the Miss Buffer. 
input		misbuf_buf_rd_en;
input   [3:0]   mbdata_cmp_sel;
input	[7:0]	l2t_mb2_wdata;
output		mbdata_fail_bot;
input		tag_data_array_wr_active_c1; // tag data scrub write



input		misbuf_arb_l2rd_en; // clk enable for latching L2 arb Miss Buffer data. 
 
// from arb. 
input	arb_mux2_snpsel_px2; // sel snp data over mbf data 
input	arb_mux3_bufsel_px2; // sel buf or IQ data. 
input	arb_mux4_c1sel_px2;  // sel stall data. 
input	arb_decc_data_sel_c9; // scrub data sel for stores. 
input	arb_bist_or_diag_acc_c1;  // sel bist or diag data. 
input	arbdec_arbdp_poison_c1; // NEW_PIN ( pin is to the left ). 
 
// from databist 
input   [7:0]   bist_data_data_c1 ; // PIN grown from 2 bits in int_2.0 
input           bist_data_enable_c1 ; 
 
input	[63:0]	decc_arbdp_data_c8;	// from decc. 
 
// partial store related mask  
input	[7:0]	arb_dword_mask_c8; // from arbdec. 
input		arbdec_arbdp_inst_bufidhi_c1; // from arbdec.

input          sel_diag_store_data_c7;  // BS and SR 12/22/03, store ack generation for diagnostic store
 
input		l2clk;	 
input 		scan_in; 
input		l2t_mb2_run;
 
output scan_out; 
output  [63:0]  st_ack_data; // BS and SR 11/12/03 N2 Xbar Packet format change, 
                                // BS and SR 12/22/03, store ack generation for diagnostic store

output	[17:0]	arbdat_arbdp_oque_int_ret_c7; // interrupt vector 
output	[77:0]	arbdat_arbdp_store_data_c2; // store data with ecc., 
output	[38:0]	arbdat_arbdata_wr_data_c2; // for tag write 
output	[63:0]	arbdat_mbdata_inst_data_c8; // for mbdata write ( merged data ). 
 
output	[63:0]	arbdat_csr_inst_wr_data_c8;// added for timing reasons. previously 
				    // was using arbdat_mbdata_inst_data_c8. 
				    // New pin added POST_2.0. Place pins  
				    // @ the bottom and align with appropriate 
				    // bit position pitch 
 
//output	[6:0]	arbdat_csr_bist_wr_data_c8; //  added pin for tstub functionality. 
				     // Place pins at the bottom. align 
				     // with the appropriate bit position pitch. 
				     // New pin added POST_2.0 
 
 
output		arbdat_word_lower_cmp_c8; // addr 0x4; from arbdata 
output		arbdat_word_upper_cmp_c8; // addr 0x0; from arbdata 

assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk; 
assign se = tcu_scan_en;
assign muxtst = tcu_muxtest;
assign test = tcu_dectest;



//assign scan_out = 1'b0;


 wire   [63:0]  st_ack_data_muxout; 


 wire	[63:0]	arbdp_mux0_data_px2; 
 wire	[63:0]	arbdp_mux1_data_px2; 
 wire	[63:0]	arbdp_mux2_data_px2; 
 
 wire	[63:0]	arbdp_inst_data_c1; 
 wire	[63:0]	arbdp_inst_data_c2; 
 wire	[13:0]	arbdp_inst_ecc_c1; 
 wire   [13:0]  arbdp_inst_ecc_raw_c1;
 wire   [13:0]  arbdp_inst_ecc_raw_c1_inv;
 wire	[13:0]	arbdp_inst_ecc_c2; 
 wire	[63:0]	arbdp_inst_data_c3; 
 wire	[63:0]	arbdp_inst_data_c4; 
 wire	[63:0]	arbdp_inst_data_c5; 
 wire   [63:0]  arbdp_inst_data_c52; // BS 03/11/04 extra cycle for mem access
 wire	[63:0]	arbdp_inst_data_c6; 
 wire	[63:0]	arbdp_inst_data_c7; 
 wire	[63:0]	arbdp_inst_data_c8; 
 
 wire	[77:0] arbdp_bist_data_c1 ; 
 wire	[63:0] bist_or_diag_data_c1 ; 
 wire	[63:0]	store_data_c1; 
 wire	[13:0] bist_or_diag_ecc_c1 ; 
 wire	[63:0] postecc_data_c1; 
 wire	[63:0] poison_data_c1; 
 wire	[63:0] arbdp_wr_data_c1	; 
 wire	[63:0]	arbdp_wr_data_c2; 
 wire	[13:0] arbdp_wr_ecc_c1	; 
 
 wire	[63:0]	decc_data_c9; // data from decc is flopped here. 
 
wire	[63:0]	mbf_data_px2;// Mbf instruction 
 
//********************************* 
// Miss Buffer data processing. 
//********************************* 

// assign se = 1'b0; 
//inv_macro misbuf_arb_l2rd_en_inv_slice (width=1) 
//	( 
//	.dout	(misbuf_arb_l2rd_en_n), 
//	.din	(misbuf_arb_l2rd_en) 
//	);
//	
//inv_macro se_inv_slice (width=1) 
//        ( 
//        .dout   (se_n), 
//        .din    (se) 
//        );
//
//
//lib_clken_buf_cust  clk_buf_mbdata  
//	(
//	.clk	(en_clk_mbdata),                 
//	.l2clk	(l2clk), 
//       .enb_l	(misbuf_arb_l2rd_en_n),   
//	.tmb_l	(se_n)
//	); 
 
 
l2t_arbdat_dp_msff_macro__stack_32c__width_32 ff_read_mbdata_reg1 
         (
	.scan_in(ff_read_mbdata_reg1_scanin),
	.scan_out(ff_read_mbdata_reg1_scanout),
	.din	(mb_data_read_data[63:32]), 
	.clk	(l2clk), 
	.dout	(mbf_data_px2[63:32]), 
	.en	(misbuf_arb_l2rd_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 

	); 

l2t_arbdat_dp_msff_macro__stack_32c__width_32 ff_read_mbdata_reg2 
         (
        .scan_in(ff_read_mbdata_reg2_scanin),
        .scan_out(ff_read_mbdata_reg2_scanout),
        .din    (mb_data_read_data[31:0]),
        .clk    (l2clk),
        .dout   (mbf_data_px2[31:0]),
        .en     (misbuf_arb_l2rd_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

        );
 
 
//*************************************** 
// Arbiter muxes for data. 
// Store data can come from 5 srcs. 
// IQ, MB, diagnostic write, BIST or scrub. 
//*************************************** 

l2t_arbdat_dp_inv_macro__width_1 arb_mux2_snpsel_px2_inv_slice  
	( 
	.dout	(arb_mux2_snpsel_px2_n), 
	.din	(arb_mux2_snpsel_px2) 
	);

 
l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux0_data_px1 
	(
	.dout 	( arbdp_mux0_data_px2[63:32] ) , 
        .din0	(mbf_data_px2[63:32] ), // miss buffer data 
        .din1	(snpd_snpq_arbdp_data_px2[63:32]), // SNP data. 
        .sel0	(arb_mux2_snpsel_px2_n),	// select buffer data 
        .sel1	(arb_mux2_snpsel_px2)
	); 

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux0_data_px2 
        (
        .dout   ( arbdp_mux0_data_px2[31:0] ) ,
        .din0   (mbf_data_px2[31:0] ), // miss buffer data
        .din1   (snpd_snpq_arbdp_data_px2[31:0]), // SNP data.
        .sel0   (arb_mux2_snpsel_px2_n),        // select buffer data
        .sel1   (arb_mux2_snpsel_px2)
        );

l2t_arbdat_dp_inv_macro__width_1 arb_mux3_bufsel_px2_inv_slice  
        ( 
        .dout   (arb_mux3_bufsel_px2_n), 
        .din    (arb_mux3_bufsel_px2) 
        );


 
l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux1_data_px1 
	(
	.dout ( arbdp_mux1_data_px2[63:32] ) , 
        .din0(arbdp_mux0_data_px2[63:32] ), // miss buffer/snp data 
        .din1(ique_iq_arbdp_data_px2[63:32]), // IQ data. 
        .sel0(arb_mux3_bufsel_px2),	// select buffer data 
        .sel1(arb_mux3_bufsel_px2_n)
	); 

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux1_data_px2 
        (
        .dout ( arbdp_mux1_data_px2[31:0] ) ,
        .din0(arbdp_mux0_data_px2[31:0] ), // miss buffer/snp data
        .din1(ique_iq_arbdp_data_px2[31:0]), // IQ data.
        .sel0(arb_mux3_bufsel_px2),     // select buffer data
        .sel1(arb_mux3_bufsel_px2_n)
        );
 

// A mux flop can be used for C1 data instead of a mux2 + flop. 

l2t_arbdat_dp_inv_macro__width_1 arb_mux4_c1sel_px2_inv_slice  
        ( 
        .dout   (arb_mux4_c1sel_px2_n), 
        .din    (arb_mux4_c1sel_px2) 
        );

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux2_instr_px1 
	(
	.dout (arbdp_mux2_data_px2[63:32]) , 
        .din0(arbdp_mux1_data_px2[63:32]), 
        .din1(arbdp_inst_data_c1[63:32]), 
        .sel0(arb_mux4_c1sel_px2_n), 
        .sel1(arb_mux4_c1sel_px2)
	); 

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux2_instr_px2 
        (
        .dout (arbdp_mux2_data_px2[31:0]) ,
        .din0(arbdp_mux1_data_px2[31:0]),
        .din1(arbdp_inst_data_c1[31:0]),
        .sel0(arb_mux4_c1sel_px2_n),
        .sel1(arb_mux4_c1sel_px2)
        );
 
l2t_arbdat_dp_msff_macro__stack_32c__width_32 ff_data_c11 
                    (.din(arbdp_mux2_data_px2[63:32]), .clk(l2clk), 
                   .scan_in(ff_data_c11_scanin),
                   .scan_out(ff_data_c11_scanout),
                   .dout(arbdp_inst_data_c1[63:32]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

l2t_arbdat_dp_msff_macro__stack_32c__width_32 ff_data_c12 
                    (.din(arbdp_mux2_data_px2[31:0]), .clk(l2clk),
                   .scan_in(ff_data_c12_scanin),
                   .scan_out(ff_data_c12_scanout),
                   .dout(arbdp_inst_data_c1[31:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
 
 
// data ecc data flopped to C9 
l2t_arbdat_dp_msff_macro__stack_32c__width_32 ff_decc_data_c91 
        (
	.scan_in(ff_decc_data_c91_scanin),
	.scan_out(ff_decc_data_c91_scanout),
	.din(decc_arbdp_data_c8[63:32]), 
	.clk(l2clk),  
	.dout(decc_data_c9[63:32]), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 

	); 
 
l2t_arbdat_dp_msff_macro__stack_32c__width_32 ff_decc_data_c92 
        (
        .scan_in(ff_decc_data_c92_scanin),
        .scan_out(ff_decc_data_c92_scanout),
        .din(decc_arbdp_data_c8[31:0]),
        .clk(l2clk),
        .dout(decc_data_c9[31:0]),
        .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

        );
 
// normal store data is a combination of scrub/store data. 

l2t_arbdat_dp_inv_macro__width_1 arb_decc_data_sel_c9_inv_slice  
	( 
	.dout	(arb_decc_data_sel_c9_n ), 
	.din	(arb_decc_data_sel_c9 ) 
	);

l2t_arbdat_dp_and_macro__width_1 poison_qual_c1_slice  // BS 04/28/04 sync up with N1 TO 1.0 
        (
        .dout   (poison_qual_c1),
        .din0   (arb_decc_data_sel_c9_n),
        .din1   (arbdec_arbdp_poison_c1)
        );

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux_store_data_c11 
	(.dout (store_data_c1[63:32]), 
         .din0(decc_data_c9[63:32]), // scrub data 
         .din1(arbdp_inst_data_c1[63:32]), // store data. 
         .sel0(arb_decc_data_sel_c9),// decc scrub data sel 
         .sel1(arb_decc_data_sel_c9_n));// no decc scrub 

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux_store_data_c12 
        (.dout (store_data_c1[31:0]),
         .din0(decc_data_c9[31:0]), // scrub data
         .din1(arbdp_inst_data_c1[31:0]), // store data.
         .sel0(arb_decc_data_sel_c9),// decc scrub data sel
         .sel1(arb_decc_data_sel_c9_n));// no decc scrub
 
l2t_pgen32b_dp  ecc_bit31to0 
	( .dout(postecc_data_c1[31:0]),  
	  .parity(arbdp_inst_ecc_raw_c1[6:0]), 
	  .din(store_data_c1[31:0]) 
	); 
 
l2t_pgen32b_dp  ecc_bit63to32 
	( 
	.dout(postecc_data_c1[63:32]),  
	.parity(arbdp_inst_ecc_raw_c1[13:7]), 
	.din(store_data_c1[63:32]) 
	 ); 

// BS 06/13/04 added Notdata logic

// in case bit 116 is set for stores,swaps,ldstubs,cswaps, write Notdata
// into L2 data array. we do this by flipping the ecc bits when bit 116 = 1.
// if bit 116 of PCX packet (bufidhi bit) = 1'b1, Ecc bits of both 4 byte chunks get
// flipped irrespective of whether it is a low cas, high cas
// or whole cas, or partial store/swap/ldstub to lower or higher 4 byte chunk.

// in case of a Data Sccrub access , cannot rely on arbdec_arbdp_inst_bufidhi_c1
// as pipe is stalled and whatever is in the IQ at that point might be holding this
// signal to 1 or 0. Hence force arbdec_arbdp_inst_bufidhi to 1'b0 in case
// of the data scrub so that the computed ecc gets written by the scrub write and
// not the flipped ECC : fix for bug 102779

l2t_arbdat_dp_inv_macro__width_1 inv_tag_scrub_wr 
       (.dout (tag_data_array_wr_active_c1_n),
        .din  (tag_data_array_wr_active_c1)
       );

l2t_arbdat_dp_and_macro__ports_2__width_1 bufid1_and_not_scrub 
       (.dout (arbdec_arbdp_inst_bufidhi),
        .din0 (arbdec_arbdp_inst_bufidhi_c1),
        .din1 (tag_data_array_wr_active_c1_n)
       );

l2t_arbdat_dp_inv_macro__width_1 inv_bufidhi_c1 
        (.dout (arbdec_arbdp_inst_bufidhi_n),
	 .din (arbdec_arbdp_inst_bufidhi)
	);

l2t_arbdat_dp_inv_macro__width_14 inv_inst_ecc_raw_c1 
        (.dout (arbdp_inst_ecc_raw_c1_inv[13:0]),
         .din (arbdp_inst_ecc_raw_c1[13:0])
        );


l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_14c__width_14 mux_store_ecc_c1 
        (.dout (arbdp_inst_ecc_c1[13:0]),
         .din0(arbdp_inst_ecc_raw_c1_inv[13:0]), // flipped ECC 
         .din1(arbdp_inst_ecc_raw_c1[13:0]), // generated ECC 
         .sel0(arbdec_arbdp_inst_bufidhi),// select flipped ecc 
         .sel1(arbdec_arbdp_inst_bufidhi_n));// select generated ecc 

assign  arbdp_bist_data_c1[38:0] = {bist_data_data_c1[6:0],  
				bist_data_data_c1[7:0],  
				bist_data_data_c1[7:0], 
				bist_data_data_c1[7:0], 
				bist_data_data_c1[7:0] } ; 
 
assign	arbdp_bist_data_c1[77:39] = {bist_data_data_c1[6:0],  
                                bist_data_data_c1[7:0],  
                                bist_data_data_c1[7:0], 
                                bist_data_data_c1[7:0], 
                                bist_data_data_c1[7:0] } ; 
 
 
// Apply poison bit Xor to the  
// 2 LSBs of each 32 Bit word. 

//assign	poison_data_c1[31:0]  = {	postecc_data_c1[31:2],  
//				( postecc_data_c1[1] ^ poison_qual_c1), // BS 04/28/04 sync up with N1 TO 1.0 
//				( postecc_data_c1[0] ^ poison_qual_c1) 
//			 }; 

l2t_arbdat_dp_xor_macro__width_1 postecc_1_poison_slice1  
	( 
	.din1 	(poison_qual_c1),  // BS 04/28/04 sync up with N1 TO 1.0
	.din0	(postecc_data_c1[1]), 
	.dout	(postecc_1_poison1) 
	);

l2t_arbdat_dp_xor_macro__width_1 postecc_1_poison_slice0  
        ( 
        .din1   (poison_qual_c1),  // BS 04/28/04 sync up with N1 TO 1.0
        .din0   (postecc_data_c1[0]), 
        .dout   (postecc_1_poison0) 
        );


assign        poison_data_c1[31:0]  = {postecc_data_c1[31:2],postecc_1_poison1,postecc_1_poison0};


 
// bits 31:0 

l2t_arbdat_dp_inv_macro__width_1 bist_data_enable_c1_inv_slice  
	( 
	.dout	(bist_data_enable_c1_n ), 
	.din	(bist_data_enable_c1 ) 
	);

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux1_bist_diag_data_c1 
	(.dout (bist_or_diag_data_c1[31:0]), // bist or diag data 
         .din0(arbdp_bist_data_c1[38:7]),  // bist data 
         .din1(arbdp_wr_data_c2_buff[38:7]),  // diagnostic data 
         .sel0(bist_data_enable_c1),	// bist enable 
         .sel1(bist_data_enable_c1_n));	// diagnostic enable(or def) 
 
l2t_arbdat_dp_inv_macro__width_1 arb_bist_or_diag_acc_c1_inv_slice  
	( 
	.dout	(arb_bist_or_diag_acc_c1_n ), 
	.din	(arb_bist_or_diag_acc_c1 ) 
	);

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux_wr_data_c1_63to32 
	(.dout (arbdp_wr_data_c1[31:0]),  
         .din0(poison_data_c1[31:0]), // new data from mb or iq 
         .din1(bist_or_diag_data_c1[31:0]), //  bist or diag data 
         .sel0(arb_bist_or_diag_acc_c1_n), // default 
         .sel1(arb_bist_or_diag_acc_c1)); // bist or diagnostic enable. 
 
l2t_arbdat_dp_msff_macro__dmsff_32x__stack_32c__width_32 ff_data31to0_c2 
	(
	.scan_in(ff_data31to0_c2_scanin),
	.scan_out(ff_data31to0_c2_scanout),
	.din(arbdp_wr_data_c1[31:0]), 
	.clk(l2clk), 
	.dout(arbdp_wr_data_c2[31:0]), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 
 
l2t_arbdat_dp_buff_macro__dbuff_16x__stack_32c__width_32 buff_arbdp_wr_data_c2a 
	(
	.dout	(arbdp_wr_data_c2_buff[31:0]),
	.din	(arbdp_wr_data_c2[31:0])
	);
 
 
// bits 63:32 
 
// Apply poison bit Xor to the  
// 2 LSBs of each 32 Bit word. 
//assign	poison_data_c1[63:32]  = {	postecc_data_c1[63:34],  
//				( postecc_data_c1[33] ^ ), // BS 04/28/04 sync up with N1 TO 1.0 
//				( postecc_data_c1[32] ^ ) }; // BS 04/28/04 sync up with N1 TO 1.0 

l2t_arbdat_dp_xor_macro__width_1 postecc_1_poison_slice33 
        (
        .dout   (postecc_1_poison_33),
        .din0   (postecc_data_c1[33]),
        .din1   (poison_qual_c1) // BS 04/28/04 sync up with N1 TO 1.0
        );

l2t_arbdat_dp_xor_macro__width_1 postecc_1_poison_xor_slice32 
        (
        .dout   (postecc_1_poison_32),
        .din0   (postecc_data_c1[32]),
        .din1   (poison_qual_c1) // BS 04/28/04 sync up with N1 TO 1.0
        );

assign  poison_data_c1[63:32]  = {postecc_data_c1[63:34],postecc_1_poison_33,postecc_1_poison_32};



l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux2_bist_diag_data_c1 
	(.dout(bist_or_diag_data_c1[63:32]), // bist or diag data 
         .din0(arbdp_bist_data_c1[77:46]), // bist data 
         .din1(arbdp_wr_data_c2_buff[38:7]), // diagnostic data 
         .sel0(bist_data_enable_c1),	// bist enable 
         .sel1(bist_data_enable_c1_n));	// diagnostic enable(or def) 
 
l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux_wr_data_c1 
			(.dout (arbdp_wr_data_c1[63:32]), 
                                .din0(poison_data_c1[63:32]),	// new data from mb or iq 
                                .din1(bist_or_diag_data_c1[63:32]), //  bist or diag data 
                                .sel0(arb_bist_or_diag_acc_c1_n),	// default 
                                .sel1(arb_bist_or_diag_acc_c1));	// bist or diagnostic enable 
 
l2t_arbdat_dp_msff_macro__dmsff_32x__stack_32c__width_32 ff_data63to32_c2 
         (
	.scan_in(ff_data63to32_c2_scanin),
	.scan_out(ff_data63to32_c2_scanout),
	.din(arbdp_wr_data_c1[63:32]), 
	.clk(l2clk),  
	.dout(arbdp_wr_data_c2[63:32]), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 
 
 
 
l2t_arbdat_dp_buff_macro__dbuff_16x__stack_32c__width_32 buff_arbdp_wr_data_c2b 
	(
	.dout	(arbdp_wr_data_c2_buff[63:32]),
	.din	(arbdp_wr_data_c2[63:32])
	);

// ecc bits [6:0] 
l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_7c__width_7 mux1_bist_diag_ecc_c1 
			(.dout (bist_or_diag_ecc_c1[6:0]), // bist or diag ecc 
                                .din0(arbdp_bist_data_c1[6:0]),	// bist ecc 
                                .din1(arbdp_wr_data_c2_buff[6:0]), // diagnostic ecc 
                                .sel0(bist_data_enable_c1),	// bist enable 
                                .sel1(bist_data_enable_c1_n));	// diagnostic enable(or def) 
 
l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_7c__width_7 mux_wr_ecc0to6_c1 
			(.dout (arbdp_wr_ecc_c1[6:0]), 
                                .din0(arbdp_inst_ecc_c1[6:0]),// ecc for new data from mb or iq 
                                .din1(bist_or_diag_ecc_c1[6:0]),	 //  bist or diag ecc 
                                .sel0(arb_bist_or_diag_acc_c1_n),	// default 
                                .sel1(arb_bist_or_diag_acc_c1));	// bist or diagnostic enable 
 
l2t_arbdat_dp_msff_macro__dmsff_32x__stack_7c__width_7 ff_ecc0to6_c2 
        (
	.scan_in(ff_ecc0to6_c2_scanin),
	.scan_out(ff_ecc0to6_c2_scanout),
	.din(arbdp_wr_ecc_c1[6:0]), 
	.clk(l2clk), 
        .dout(arbdp_inst_ecc_c2[6:0]), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
 
// ecc bits [13:7] 
l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_7c__width_7 mux2_bist_diag_ecc_c1 
	(.dout (bist_or_diag_ecc_c1[13:7]),	// bist or diag ecc 
         .din0(arbdp_bist_data_c1[45:39]),	// bist ecc 
         .din1(arbdp_wr_data_c2_buff[6:0]),	// diagnostic ecc 
         .sel0(bist_data_enable_c1),	// bist enable 
         .sel1(bist_data_enable_c1_n));	// diagnostic enable(or def) 
 
l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_7c__width_7 mux_wr_ecc7to13_c2 
	(.dout (arbdp_wr_ecc_c1[13:7]), 
         .din0(arbdp_inst_ecc_c1[13:7]), //eccfor new data from mb or iq 
         .din1(bist_or_diag_ecc_c1[13:7]),//  bist or diag ecc	 
         .sel0(arb_bist_or_diag_acc_c1_n),// default 
         .sel1(arb_bist_or_diag_acc_c1)); // bist or diagnostic enable 
 
l2t_arbdat_dp_msff_macro__dmsff_32x__stack_7c__width_7 ff_ecc7to13_c2 
         (.din(arbdp_wr_ecc_c1[13:7]), .clk(l2clk), 
         .scan_in(ff_ecc7to13_c2_scanin),
         .scan_out(ff_ecc7to13_c2_scanout),
         .dout(arbdp_inst_ecc_c2[13:7]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
 
 
// stdecc to l2d and l2b. 
assign	arbdat_arbdp_store_data_c2=  { arbdp_wr_data_c2[63:32], arbdp_inst_ecc_c2[13:7], 
				        arbdp_wr_data_c2[31:0], arbdp_inst_ecc_c2[6:0] } ; 
 
 
 
 
//********************************************** 
// C3.. C8 staging flops. 
//********************************************** 
 
l2t_arbdat_dp_msff_macro__dmsff_32x__stack_32c__width_32 ff_data_c21 
           (.din(arbdp_inst_data_c1[63:32]), .clk(l2clk), 
           .scan_in(ff_data_c21_scanin),
           .scan_out(ff_data_c21_scanout),
           .dout(arbdp_inst_data_c2[63:32]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

l2t_arbdat_dp_msff_macro__dmsff_32x__stack_32c__width_32 ff_data_c22 
           (.din(arbdp_inst_data_c1[31:0]), .clk(l2clk),
           .scan_in(ff_data_c22_scanin),
           .scan_out(ff_data_c22_scanout),
           .dout(arbdp_inst_data_c2[31:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
 
assign	arbdat_arbdata_wr_data_c2 = arbdp_inst_data_c2[38:0] ; // data to the tag for diagnostic 
							// writes. 
l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c31 
           (.din(arbdp_inst_data_c2[63:32]), .clk(l2clk), 
           .scan_in(ff_data_c31_scanin),
           .scan_out(ff_data_c31_scanout),
           .dout(arbdp_inst_data_c3[63:32]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c32 
           (.din(arbdp_inst_data_c2[31:0]), .clk(l2clk),
           .scan_in(ff_data_c32_scanin),
           .scan_out(ff_data_c32_scanout),
           .dout(arbdp_inst_data_c3[31:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
 
							// diagostic writes. 
l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c41 
           (.din(arbdp_inst_data_c3[63:32]), .clk(l2clk), 
           .scan_in(ff_data_c41_scanin),
           .scan_out(ff_data_c41_scanout),
           .dout(arbdp_inst_data_c4[63:32]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c42 
           (.din(arbdp_inst_data_c3[31:0]), .clk(l2clk),
           .scan_in(ff_data_c42_scanin),
           .scan_out(ff_data_c42_scanout),
           .dout(arbdp_inst_data_c4[31:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
 
l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c51 
           (.din(arbdp_inst_data_c4[63:32]), .clk(l2clk), 
           .scan_in(ff_data_c51_scanin),
           .scan_out(ff_data_c51_scanout),
           .dout(arbdp_inst_data_c5[63:32]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c52 
           (.din(arbdp_inst_data_c4[31:0]), .clk(l2clk),
           .scan_in(ff_data_c52_scanin),
           .scan_out(ff_data_c52_scanout),
           .dout(arbdp_inst_data_c5[31:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// BS 03/11/04 extra cycle for mem access

l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c521 
           (.din(arbdp_inst_data_c5[63:32]), .clk(l2clk),
           .scan_in(ff_data_c521_scanin),
           .scan_out(ff_data_c521_scanout),
           .dout(arbdp_inst_data_c52[63:32]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
);

l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c522 
           (.din(arbdp_inst_data_c5[31:0]), .clk(l2clk),
           .scan_in(ff_data_c522_scanin),
           .scan_out(ff_data_c522_scanout),
           .dout(arbdp_inst_data_c52[31:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
 
 
l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c61 
           (.din(arbdp_inst_data_c52[63:32]), .clk(l2clk), 
           .scan_in(ff_data_c61_scanin),
           .scan_out(ff_data_c61_scanout),
           .dout(arbdp_inst_data_c6[63:32]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 ff_data_c62 
           (.din(arbdp_inst_data_c52[31:0]), .clk(l2clk),
           .scan_in(ff_data_c62_scanin),
           .scan_out(ff_data_c62_scanout),
           .dout(arbdp_inst_data_c6[31:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
 
l2t_arbdat_dp_msff_macro__dmsff_32x__stack_32c__width_32 ff_data_c71 
           (.din(arbdp_inst_data_c6[63:32]), .clk(l2clk), 
           .scan_in(ff_data_c71_scanin),
           .scan_out(ff_data_c71_scanout),
           .dout(arbdp_inst_data_c7[63:32]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

l2t_arbdat_dp_msff_macro__dmsff_32x__stack_32c__width_32 ff_data_c72 
           (.din(arbdp_inst_data_c6[31:0]), .clk(l2clk),
           .scan_in(ff_data_c72_scanin),
           .scan_out(ff_data_c72_scanout),
           .dout(arbdp_inst_data_c7[31:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
 
assign	arbdat_arbdp_oque_int_ret_c7 = arbdp_inst_data_c7[17:0] ; // interrupt vector to oque. 
 
l2t_arbdat_dp_msff_macro__dmsff_32x__minbuff_1__stack_32c__width_32 ff_data_c81 
           (.din(arbdp_inst_data_c7[63:32]), .clk(l2clk), 
           .scan_in(ff_data_c81_scanin),
           .scan_out(ff_data_c81_scanout),
           .dout(arbdp_inst_data_c8[63:32]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

l2t_arbdat_dp_msff_macro__dmsff_32x__minbuff_1__stack_32c__width_32 ff_data_c82 
           (.din(arbdp_inst_data_c7[31:0]), .clk(l2clk),
           .scan_in(ff_data_c82_scanin),
           .scan_out(ff_data_c82_scanout),
           .dout(arbdp_inst_data_c8[31:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// BS and SR 12/22/03, store ack generation for diagnostic store
l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux_st_ack_data1     
       (
       .dout   (st_ack_data_muxout[63:32]),
       .din0   (arbdp_inst_data_c8[63:32]),
       .din1   (arbdp_inst_data_c7[63:32]),
       .sel0   (sel_diag_store_data_c8),        // for diagnostic store ack cases
       .sel1   (sel_diag_store_data_c8_n)       // for default cases
       );

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux_st_ack_data2     
       (
       .dout   (st_ack_data_muxout[31:0]),
       .din0   (arbdp_inst_data_c8[31:0]),
       .din1   (arbdp_inst_data_c7[31:0]),
       .sel0   (sel_diag_store_data_c8),        // for diagnostic store ack cases
       .sel1   (sel_diag_store_data_c8_n)       // for default cases
       );
 
// BS and SR 12/22/03, store ack generation for diagnostic store
l2t_arbdat_dp_inv_macro__width_1 inv_sel_diag_store_data_c8 
        (
        .dout   (sel_diag_store_data_c7_n ),
        .din    (sel_diag_store_data_c7 )
        );


l2t_arbdat_dp_buff_macro__dbuff_32x__stack_32c__width_32 buff1_st_ack_data        
        (
        .dout   (st_ack_data[63:32]),
        .din    (st_ack_data_muxout[63:32])
        );
    
    
l2t_arbdat_dp_buff_macro__dbuff_32x__stack_32c__width_32 buff2_st_ack_data        
        (
        .dout   (st_ack_data[31:0]),
        .din    (st_ack_data_muxout[31:0])
        );
    
 
//********************************************** 
// MERGE operation for partial stores. 
//********************************************** 
l2t_arbdat_dp_inv_macro__dinv_4x__width_1 arb_dword_mask_c8_0_inv_slice  
	( 
	.dout	(arb_dword_mask_c8_0_n ), 
	.din	(arb_dword_mask_c8[0] ) 
	);

l2t_arbdat_dp_nor_macro__dnor_16x__width_2 nor_select_gen_mux0 
	(
	.dout	({sel_mux0_data_c6_0,sel_mux0_data_c6_1}),
	.din0	({arb_dword_mask_c8_7_n,arb_dword_mask_c8[7]}),
	.din1	({l2t_mb2_run_r1,l2t_mb2_run_r1})
	);

l2t_arbdat_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_8c__width_8 mux0_data_c6 
	(.dout (arbdat_mbdata_inst_data_c8[63:56]), 
        .din0(arbdp_inst_data_c8[63:56]), 
        .din1(decc_arbdp_data_c8[63:56]), 
        .din2(l2t_mb2_wdata_r2[7:0]),
	.sel0(sel_mux0_data_c6_0),
	.sel1(sel_mux0_data_c6_1),
  .muxtst(muxtst),
  .test(test) 
	); 
 
l2t_arbdat_dp_inv_macro__width_1 arb_dword_mask_c8_1_inv_slice  
        ( 
        .dout   (arb_dword_mask_c8_1_n ), 
        .din    (arb_dword_mask_c8[1] ) 
        );


l2t_arbdat_dp_nor_macro__dnor_16x__width_2 nor_select_gen_mux1 
	(
	.dout	({sel_mux1_data_c6_0,sel_mux1_data_c6_1}),
	.din0	({arb_dword_mask_c8_6_n,arb_dword_mask_c8[6]}),
	.din1	({l2t_mb2_run_r1,l2t_mb2_run_r1})
	);

l2t_arbdat_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_8c__width_8 mux1_data_c6 
	(
	.dout (arbdat_mbdata_inst_data_c8[55:48]), 
        .din0(arbdp_inst_data_c8[55:48]), 
        .din1(decc_arbdp_data_c8[55:48]), 
	.din2(l2t_mb2_wdata_r2[7:0]),
	.sel0 (sel_mux1_data_c6_0),
	.sel1 (sel_mux1_data_c6_1),
  .muxtst(muxtst),
  .test(test)
	); 
 
l2t_arbdat_dp_inv_macro__width_1 arb_dword_mask_c8_2_inv_slice  
	( 
	.dout	(arb_dword_mask_c8_2_n ), 
	.din	(arb_dword_mask_c8[2] ) 
	);

l2t_arbdat_dp_nor_macro__dnor_16x__width_2 nor_select_gen_mux2 
	(
	.dout	({sel_mux2_data_c6_0,sel_mux2_data_c6_1}),
	.din0	({arb_dword_mask_c8_5_n,arb_dword_mask_c8[5]}),
	.din1	({l2t_mb2_run_r1,l2t_mb2_run_r1})
	);

l2t_arbdat_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_8c__width_8 mux2_data_c6 
	(
	.dout (arbdat_mbdata_inst_data_c8[47:40]), 
        .din0(arbdp_inst_data_c8[47:40]), 
        .din1(decc_arbdp_data_c8[47:40]), 
        .din2(l2t_mb2_wdata_r2[7:0]),
	.sel0 (sel_mux2_data_c6_0),
	.sel1 (sel_mux2_data_c6_1),
  .muxtst(muxtst),
  .test(test)
	); 

l2t_arbdat_dp_inv_macro__width_1 arb_dword_mask_c8_3_inv_slice  
        ( 
        .dout   (arb_dword_mask_c8_3_n ), 
        .din    (arb_dword_mask_c8[3] ) 
        );

l2t_arbdat_dp_nor_macro__dnor_16x__width_2 nor_select_gen_mux3 
	(
	.dout	({sel_mux3_data_c6_0,sel_mux3_data_c6_1}),
	.din0	({arb_dword_mask_c8_4_n,arb_dword_mask_c8[4]}),
	.din1	({l2t_mb2_run_r1,l2t_mb2_run_r1})
	);
 
l2t_arbdat_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_8c__width_8 mux3_data_c6 
	(
	.dout (arbdat_mbdata_inst_data_c8[39:32]), 
        .din0(arbdp_inst_data_c8[39:32]), 
	.din1(decc_arbdp_data_c8[39:32]), 
        .din2(l2t_mb2_wdata_r2[7:0]),
	.sel0 (sel_mux3_data_c6_0),
	.sel1 (sel_mux3_data_c6_1),
  .muxtst(muxtst),
  .test(test)
	); 


l2t_arbdat_dp_inv_macro__width_1 arb_dword_mask_c8_4_inv_slice  
        ( 
        .dout   (arb_dword_mask_c8_4_n ), 
        .din    (arb_dword_mask_c8[4] ) 
        );

l2t_arbdat_dp_nor_macro__dnor_16x__width_2 nor_select_gen_mux4 
	(
	.dout	({sel_mux4_data_c6_0,sel_mux4_data_c6_1}),
	.din0	({arb_dword_mask_c8_3_n,arb_dword_mask_c8[3]}),
	.din1	({l2t_mb2_run_r1,l2t_mb2_run_r1})
	);

l2t_arbdat_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_8c__width_8 mux4_data_c6 
	(
	.dout (arbdat_mbdata_inst_data_c8[31:24]), 
        .din0(arbdp_inst_data_c8[31:24]), 
        .din1(decc_arbdp_data_c8[31:24]), 
        .din2(l2t_mb2_wdata_r2[7:0]),
	.sel0 (sel_mux4_data_c6_0),
	.sel1 (sel_mux4_data_c6_1),
  .muxtst(muxtst),
  .test(test)
	); 

l2t_arbdat_dp_inv_macro__width_1 arb_dword_mask_c8_5_inv_slice 
        (
        .dout   (arb_dword_mask_c8_5_n ),
        .din    (arb_dword_mask_c8[5] )
        );

l2t_arbdat_dp_nor_macro__dnor_16x__width_2 nor_select_gen_mux5 
	(
	.dout	({sel_mux5_data_c6_0,sel_mux5_data_c6_1}),
	.din0	({arb_dword_mask_c8_2_n,arb_dword_mask_c8[2]}),
	.din1	({l2t_mb2_run_r1,l2t_mb2_run_r1})
	);
 
l2t_arbdat_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_8c__width_8 mux5_data_c6 
	(
	.dout (arbdat_mbdata_inst_data_c8[23:16]), 
        .din0(arbdp_inst_data_c8[23:16]), 
        .din1(decc_arbdp_data_c8[23:16]), 
        .din2(l2t_mb2_wdata_r2[7:0]),
	.sel0 (sel_mux5_data_c6_0),
	.sel1 (sel_mux5_data_c6_1),
  .muxtst(muxtst),
  .test(test)
	); 

l2t_arbdat_dp_inv_macro__width_1 arb_dword_mask_c8_6_inv_slice 
        (
        .dout   (arb_dword_mask_c8_6_n ),
        .din    (arb_dword_mask_c8[6] )
        );
 
l2t_arbdat_dp_nor_macro__dnor_16x__width_2 nor_select_gen_mux6 
	(
	.dout	({sel_mux6_data_c6_0,sel_mux6_data_c6_1}),
	.din0	({arb_dword_mask_c8_1_n,arb_dword_mask_c8[1]}),
	.din1	({l2t_mb2_run_r1,l2t_mb2_run_r1})
	);
l2t_arbdat_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_8c__width_8 mux6_data_c6 
	(
	.dout (arbdat_mbdata_inst_data_c8[15:8]), 
        .din0(arbdp_inst_data_c8[15:8]), 
        .din1(decc_arbdp_data_c8[15:8]), 
        .din2(l2t_mb2_wdata_r2[7:0]),
	.sel0 (sel_mux6_data_c6_0),
	.sel1 (sel_mux6_data_c6_1),
  .muxtst(muxtst),
  .test(test)
	); 
 
l2t_arbdat_dp_inv_macro__width_1 arb_dword_mask_c8_7_inv_slice 
        (
        .dout   (arb_dword_mask_c8_7_n ),
        .din    (arb_dword_mask_c8[7] )
        );

l2t_arbdat_dp_nor_macro__dnor_16x__width_2 nor_select_gen_mux7 
	(
	.dout	({sel_mux7_data_c6_0,sel_mux7_data_c6_1}),
	.din0	({arb_dword_mask_c8_0_n,arb_dword_mask_c8[0]}),
	.din1	({l2t_mb2_run_r1,l2t_mb2_run_r1})
	);

l2t_arbdat_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_8c__width_8 mux7_data_c6 
	(
	.dout (arbdat_mbdata_inst_data_c8[7:0]), 
        .din0(arbdp_inst_data_c8[7:0]), 
        .din1(decc_arbdp_data_c8[7:0]), 
        .din2(l2t_mb2_wdata_r2[7:0]),
	.sel0 (sel_mux7_data_c6_0),
	.sel1 (sel_mux7_data_c6_1),
  .muxtst(muxtst),
  .test(test)
	); 
 
 
//*************************************** 
// CAS COMPARATORS 
//*************************************** 
 
// CAS instruction to addr 0x4 
//assign  arbdat_word_lower_cmp_c8 = ( arbdp_inst_data_c8[31:0] == decc_arbdp_data_c8[31:0] ) ; 

l2t_arbdat_dp_cmp_macro__width_32 cas_cmp1 
         ( 
	 .din0(decc_arbdp_data_c8[31:0]),
         .din1(arbdp_inst_data_c8[31:0]),
         .dout(arbdat_word_lower_cmp_c8)
         );

// CAS instruction to addr 0x0 
//assign  arbdat_word_upper_cmp_c8 = ( arbdp_inst_data_c8[63:32] == decc_arbdp_data_c8[63:32] ) ; 

l2t_arbdat_dp_cmp_macro__width_32 cas_cmp2 
          ( 
	  .din0(decc_arbdp_data_c8[63:32]),
          .din1(arbdp_inst_data_c8[63:32]),
          .dout(arbdat_word_upper_cmp_c8)
           ); 
 
//********************************************** 
// C8 data sent to the CSR block for writes. 
//********************************************** 
 
assign	arbdat_csr_inst_wr_data_c8 = arbdp_inst_data_c8 ; 
 
//assign	arbdat_csr_bist_wr_data_c8 = arbdp_inst_data_c8[6:0] ; 
 
// Removed arbdat_csr_bist_wr_data_c8 2-1 mux. 

/////////////////////////////////////////////////////////////
//	MBDATA MBIST SIGNALS
/////////////////////////////////////////////////////////////

l2t_arbdat_dp_or_macro__width_1 or_mbdata_mbist_active 
	(
	.dout	(mbdata_test_active),
	.din0	(mbdata_cmp_sel[0]),
	.din1	(mbdata_cmp_sel[1])
	);

l2t_arbdat_dp_and_macro__width_1 and_enable_mbdata_rd 
	(
	.dout	(misbuf_buf_rd_en_r2_qual),
	.din0	(mbdata_test_active),
	.din1	(misbuf_buf_rd_en_r2)
	);

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux_mb_data_read_data0 
        (
        .dout   (mbdata_cmp_data[31:0]),
        .din0   (mbf_data_px2[31:0]),
        .din1   (mbf_data_px2[63:32]),
        .sel0   (mbdata_cmp_sel[0]),
        .sel1   (mbdata_cmp_sel[1])
        );

l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2c__width_1 mux_mbdata_fail_unreg 
        (
        .dout   (mbdata_fail_unreg_w),
        .din0   (mbdata_fail_unreg),
        .din1   (1'b1),
        .sel0   (misbuf_buf_rd_en_r2_qual),
        .sel1   (misbuf_buf_rd_en_r2_n)
        );

l2t_arbdat_dp_inv_macro__width_1 inv_misbuf_buf_rd_en_r2 
	(
	.dout	(misbuf_buf_rd_en_r2_n),
	.din	(misbuf_buf_rd_en_r2_qual)
	);

l2t_arbdat_dp_cmp_macro__dcmp_8x__width_32 cmp_mbdata_cmp_data 
        (
        .dout   (mbdata_fail_unreg),
        .din0   ({4{l2t_mb2_wdata_r4[7:0]}}),
        .din1   (mbdata_cmp_data[31:0])
        );


l2t_arbdat_dp_msff_macro__stack_38c__width_38  ff_mbdata_mbist_reg  
        (
        .scan_in(ff_mbdata_mbist_reg_scanin),
        .scan_out(ff_mbdata_mbist_reg_scanout),
        .dout   ({mbdata_fail_bot,
		  l2t_mb2_run_r1,
		  l2t_mb2_wdata_r1[7:0],
		  l2t_mb2_wdata_r2[7:0],
		  l2t_mb2_wdata_r3[7:0],
		  l2t_mb2_wdata_r4[7:0],
                  misbuf_buf_rd_en_r1,
                  misbuf_buf_rd_en_r2,
			sel_diag_store_data_c8,
			sel_diag_store_data_c8_n}),
        .din    ({mbdata_fail_unreg_w,
		  l2t_mb2_run,
                  l2t_mb2_wdata[7:0],
                  l2t_mb2_wdata_r1[7:0],
                  l2t_mb2_wdata_r2[7:0],
		  l2t_mb2_wdata_r3[7:0],
		  misbuf_buf_rd_en,
                  misbuf_buf_rd_en_r1,
			sel_diag_store_data_c7,
			sel_diag_store_data_c7_n}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


/////////////////////   col offset generation /////////////////////////

input		arb_inst_vld_c2_prev ;
input	[3:0]   dec_col_offset_prev_c1;
input	[1:0]   arbadr_arbdp_addr5to4_c1;
output	[3:0]	tag_l2d_col_offset_c2;



l2t_arbdat_dp_inv_macro__dinv_8x__width_4 inv_col_offset_sel_c2 
        (
        .dout   ({arb_inst_vld_c2_prev_n,arbadr_arbdp_addr5to4_c1_n[1:0],col_offset_sel_c1_n}),
        .din    ({arb_inst_vld_c2_prev,arbadr_arbdp_addr5to4_c1[1:0],col_offset_sel_c1})
        );

l2t_arbdat_dp_nor_macro__dnor_8x__width_1 nor_col_offset_sel_c1 
        (
        .dout   (col_offset_sel_c1),
        .din0   (arb_inst_vld_c2_prev_n),
        .din1   (bist_data_enable_c1)
        );

l2t_arbdat_dp_and_macro__dinv_8x__dnand_8x__width_4 and_dec_col_offset_c1 
        (
        .dout   (dec_col_offset_c1[3:0]),
        .din0   ({arbadr_arbdp_addr5to4_c1[1],arbadr_arbdp_addr5to4_c1[1],
		  arbadr_arbdp_addr5to4_c1_n[1],arbadr_arbdp_addr5to4_c1_n[1]}),
        .din1   ({arbadr_arbdp_addr5to4_c1[0],arbadr_arbdp_addr5to4_c1_n[0],
		  arbadr_arbdp_addr5to4_c1[0],arbadr_arbdp_addr5to4_c1_n[0]})
        );


l2t_arbdat_dp_msff_macro__dmsff_32x__stack_10c__width_10 ff_col_offset_sel_c2 
        (
	.scan_in(ff_col_offset_sel_c2_scanin),
	.scan_out(ff_col_offset_sel_c2_scanout),
	.din({dec_col_offset_c1[3:0],dec_col_offset_prev_c1[3:0],
		col_offset_sel_c1,col_offset_sel_c1_n}), 
	.clk(l2clk),
	.en(1'b1),
        .dout({dec_col_offset_c2[3:0],col_offset_dec_prev_c2[3:0],
		col_offset_sel_c2,col_offset_sel_c2_n}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2t_arbdat_dp_nand_macro__dnand_16x__stack_4r__width_4 nand_tag_l2d_col_offset_c2_a 
	(
	.dout	(tag_l2d_col_offset_c2_1[3:0]),
	.din0	(col_offset_dec_prev_c2[3:0]),
	.din1	({4{col_offset_sel_c2_n}})
	);


l2t_arbdat_dp_nand_macro__dnand_16x__stack_4r__width_4 nand_tag_l2d_col_offset_c2_b 
        (
        .dout   (tag_l2d_col_offset_c2_2[3:0]),
        .din0   (dec_col_offset_c2[3:0]),
        .din1   ({4{col_offset_sel_c2}})
        );


l2t_arbdat_dp_nand_macro__dnand_32x__stack_4r__width_4 nand_tag_l2d_col_offset_c2 
        (
        .dout   ({tag_l2d_col_offset_c2[0], tag_l2d_col_offset_c2[1],
                  tag_l2d_col_offset_c2[2], tag_l2d_col_offset_c2[3]}),
        .din0   (tag_l2d_col_offset_c2_1[3:0]),
        .din1   (tag_l2d_col_offset_c2_2[3:0])
        );


 
 
// fixscan start:
assign ff_read_mbdata_reg1_scanin = scan_in                  ;
assign ff_read_mbdata_reg2_scanin = ff_read_mbdata_reg1_scanout;
assign ff_data_c11_scanin        = ff_read_mbdata_reg2_scanout;
assign ff_data_c12_scanin        = ff_data_c11_scanout      ;
assign ff_decc_data_c91_scanin   = ff_data_c12_scanout      ;
assign ff_decc_data_c92_scanin   = ff_decc_data_c91_scanout ;
assign ff_data31to0_c2_scanin    = ff_decc_data_c92_scanout ;
assign ff_data63to32_c2_scanin   = ff_data31to0_c2_scanout  ;
assign ff_ecc0to6_c2_scanin      = ff_data63to32_c2_scanout ;
assign ff_ecc7to13_c2_scanin     = ff_ecc0to6_c2_scanout    ;
assign ff_data_c21_scanin        = ff_ecc7to13_c2_scanout   ;
assign ff_data_c22_scanin        = ff_data_c21_scanout      ;
assign ff_data_c31_scanin        = ff_data_c22_scanout      ;
assign ff_data_c32_scanin        = ff_data_c31_scanout      ;
assign ff_data_c41_scanin        = ff_data_c32_scanout      ;
assign ff_data_c42_scanin        = ff_data_c41_scanout      ;
assign ff_data_c51_scanin        = ff_data_c42_scanout      ;
assign ff_data_c52_scanin        = ff_data_c51_scanout      ;
assign ff_data_c521_scanin       = ff_data_c52_scanout      ;
assign ff_data_c522_scanin       = ff_data_c521_scanout     ;
assign ff_data_c61_scanin        = ff_data_c522_scanout     ;
assign ff_data_c62_scanin        = ff_data_c61_scanout      ;
assign ff_data_c71_scanin        = ff_data_c62_scanout      ;
assign ff_data_c72_scanin        = ff_data_c71_scanout      ;
assign ff_data_c81_scanin        = ff_data_c72_scanout      ;
assign ff_data_c82_scanin        = ff_data_c81_scanout      ;
assign ff_mbdata_mbist_reg_scanin = ff_data_c82_scanout      ;
assign ff_col_offset_sel_c2_scanin = ff_mbdata_mbist_reg_scanout;
assign scan_out                  = ff_col_offset_sel_c2_scanout;
// fixscan end:
endmodule 








// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_msff_macro__stack_32c__width_32 (
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
//   invert macro
//
//





module l2t_arbdat_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_arbdat_dp_and_macro__width_1 (
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
//   xor macro for ports = 2,3
//
//





module l2t_arbdat_dp_xor_macro__dxor_8x__ports_3__width_1 (
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





module l2t_arbdat_dp_xor_macro__dxor_8x__ports_2__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_arbdat_dp_and_macro__ports_2__width_1 (
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





module l2t_arbdat_dp_inv_macro__width_14 (
  din, 
  dout);
  input [13:0] din;
  output [13:0] dout;






inv #(14)  d0_0 (
.in(din[13:0]),
.out(dout[13:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_14c__width_14 (
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


//
//   xor macro for ports = 2,3
//
//





module l2t_arbdat_dp_xor_macro__width_1 (
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









// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_msff_macro__dmsff_32x__stack_32c__width_32 (
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
//   buff macro
//
//





module l2t_arbdat_dp_buff_macro__dbuff_16x__stack_32c__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_7c__width_7 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [6:0] din0;
  input sel0;
  input [6:0] din1;
  input sel1;
  output [6:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(7)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
.dout(dout[6:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_msff_macro__dmsff_32x__stack_7c__width_7 (
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
wire [5:0] so;

  input [6:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [6:0] dout;


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
dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_msff_macro__dmsff_4x__stack_32c__width_32 (
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













// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_msff_macro__dmsff_32x__minbuff_1__stack_32c__width_32 (
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
//   buff macro
//
//





module l2t_arbdat_dp_buff_macro__dbuff_32x__stack_32c__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule





//
//   invert macro
//
//





module l2t_arbdat_dp_inv_macro__dinv_4x__width_1 (
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





module l2t_arbdat_dp_nor_macro__dnor_16x__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






nor2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_8c__width_8 (
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

  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  input sel0;
  input sel1;
  input muxtst;
  input test;
  output [7:0] dout;





cl_dp1_penc3_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
  .test(test)
);

mux3 #(8)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
  .in2(din2[7:0]),
.dout(dout[7:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_arbdat_dp_cmp_macro__width_32 (
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
//   or macro for ports = 2,3
//
//





module l2t_arbdat_dp_or_macro__width_1 (
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

module l2t_arbdat_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2c__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(1)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_arbdat_dp_cmp_macro__dcmp_8x__width_32 (
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









// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_msff_macro__stack_38c__width_38 (
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
wire [36:0] so;

  input [37:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [37:0] dout;


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
dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);




















endmodule









//
//   invert macro
//
//





module l2t_arbdat_dp_inv_macro__dinv_8x__width_4 (
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
//   nor macro for ports = 2,3
//
//





module l2t_arbdat_dp_nor_macro__dnor_8x__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_arbdat_dp_and_macro__dinv_8x__dnand_8x__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






and2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2t_arbdat_dp_msff_macro__dmsff_32x__stack_10c__width_10 (
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
//   nand macro for ports = 2,3,4
//
//





module l2t_arbdat_dp_nand_macro__dnand_16x__stack_4r__width_4 (
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





module l2t_arbdat_dp_nand_macro__dnand_32x__stack_4r__width_4 (
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




