// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_vuadpm_dp.v
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
module l2t_vuadpm_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  l2clk, 
  scan_in, 
  scan_out, 
  vuadpm_bistordiag_ua_data, 
  vuadpm_bistordiag_vd_data, 
  usaloc_diag_rd_ua_out, 
  vlddir_diag_rd_vd_out, 
  arb_acc_ua_c2, 
  vuadpm_vuad_diag_data_c7, 
  usaloc_ua_synd_c9, 
  vlddir_vd_synd_c9, 
  vuadpm_vd_ue_c4, 
  vuadpm_ua_ue_c4, 
  usaloc_ua_ue_c2, 
  vlddir_vd_ue_c2, 
  usaloc_ua_synd_c2, 
  vlddir_vd_synd_c2, 
  usaloc_ua_ce_c2, 
  vlddir_vd_ce_c2, 
  arbdat_arbdata_wr_data_c2, 
  bist_vuad_data_in, 
  vuaddp_sel_diag1_data_wr_c3, 
  vuaddp_sel_diag0_data_wr_c3, 
  mbist_write_data, 
  bist_vuad_rd_en_px1, 
  mbist_l2vuad_fail);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire arb_acc_ua_c2_n;
wire ff_diag_out_c3_scanin;
wire ff_diag_out_c3_scanout;
wire ff_mbist_write_data_scanin;
wire ff_mbist_write_data_scanout;
wire [7:0] mbist_write_data_px2;
wire bist_vuad_rd_en_px2;
wire [7:0] mbist_write_data_r1;
wire bist_vuad_rd_en_r1;
wire [7:0] mbist_write_data_r2;
wire bist_vuad_rd_en_r2;
wire [7:0] mbist_write_data_r3;
wire bist_vuad_rd_en_r3;
wire mbist_l2vuad_fail_unreg;
wire vuad_fail1;
wire vuad_fail2;
wire mbist_l2vuad_fail_raw;
wire bist_vuad_rd_en_r3_n;
wire ff_diag_out_c4_scanin;
wire ff_diag_out_c4_scanout;
wire ff_diag_out_c5_scanin;
wire ff_diag_out_c5_scanout;
wire ff_diag_out_c52_scanin;
wire ff_diag_out_c52_scanout;
wire ff_diag_out_c6_scanin;
wire ff_diag_out_c6_scanout;
wire ff_diag_out_c7_scanin;
wire ff_diag_out_c7_scanout;
wire ff_ue_fifo_scanin;
wire ff_ue_fifo_scanout;
wire vd_ue_c3;
wire ua_ue_c3;
wire vd_ue_c4;
wire ua_ue_c4;
wire ff_ua_synd_fifo_scanin;
wire ff_ua_synd_fifo_scanout;
wire ff_vd_synd_fifo_scanin;
wire ff_vd_synd_fifo_scanout;
wire [6:0] vlddir_vd_synd_52;
wire ff_arbdata_wr_data_c3_scanin;
wire ff_arbdata_wr_data_c3_scanout;
wire vuaddp_sel_diag1_data_wr_c3_n;
wire ff_bistordiag_ua_data_scanin;
wire ff_bistordiag_ua_data_scanout;
wire vuaddp_sel_diag0_data_wr_c3_n;
wire ff_bistordiag_vd_data_scanin;
wire ff_bistordiag_vd_data_scanout;
 

input 		tcu_pce_ov;
input 		tcu_aclk;
input 		tcu_bclk;
input 		tcu_scan_en;
input 		tcu_clk_stop;
 
input   	l2clk; 
input 		scan_in;
output 		scan_out; 
 
output	[38:0]	vuadpm_bistordiag_ua_data; // Left // BS and SR VUAD ECC Change 8/9/04
output	[38:0]	vuadpm_bistordiag_vd_data; // Right // BS and SR VUAD ECC Change 8/9/04
 
input	[38:0]	usaloc_diag_rd_ua_out ; // Left // BS and SR VUAD ECC Change 8/9/04
input	[38:0]	vlddir_diag_rd_vd_out ; // Right // BS and SR VUAD ECC Change 8/9/04
input		arb_acc_ua_c2; // TOP 
 
output   [38:0] vuadpm_vuad_diag_data_c7; // BS and SR VUAD ECC Change 8/9/04
 
// New ports VUAD ECC Change 
output	[6:0]	usaloc_ua_synd_c9;
output	[6:0]	vlddir_vd_synd_c9;
output		vuadpm_vd_ue_c4;
output 		vuadpm_ua_ue_c4;

input		usaloc_ua_ue_c2;
input		vlddir_vd_ue_c2;
input	[5:0]	usaloc_ua_synd_c2;
input	[5:0]	vlddir_vd_synd_c2;
input		usaloc_ua_ce_c2;
input		vlddir_vd_ce_c2;


input	 [38:0]	arbdat_arbdata_wr_data_c2; // Top // BS and SR VUAD ECC Change 8/9/04
input	 [7:0]	bist_vuad_data_in; // Top 		
input		vuaddp_sel_diag1_data_wr_c3; // Top 
input		vuaddp_sel_diag0_data_wr_c3; // Top 

input	[7:0]	mbist_write_data;
input		bist_vuad_rd_en_px1;

output		mbist_l2vuad_fail;

assign stop = tcu_clk_stop; 
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;


//assign scan_out = 1'b0;

 
// BS and SR VUAD ECC Change 8/9/04
wire    [38:0]  diag_out_c2; 
wire    [38:0]  diag_out_c3; 
wire    [38:0]  diag_out_c4; 
wire    [38:0]  diag_out_c5; 
wire    [38:0]  diag_out_c52; // BS 03/11/04 extra cycle for mem access
wire    [38:0]  diag_out_c6; 
wire    [38:0]  diag_out_c7; 
wire    [38:0]  diag_out_c8; 
 
wire	[38:0]	bist_data_c3; 
wire	[38:0]	arbdata_wr_data_c3; 
wire	[38:0]	bistordiag_ua_data_in, bistordiag_vd_data_in; 
 
wire	[6:0]	vlddir_vd_synd_c3;
wire	[6:0]	vlddir_vd_synd_c4;
wire	[6:0]	vlddir_vd_synd_c5;
wire	[6:0]	vlddir_vd_synd_c52;
wire	[6:0]	vlddir_vd_synd_c6;
wire	[6:0]	vlddir_vd_synd_c7;
wire	[6:0]	vlddir_vd_synd_c8;

wire	[6:0]	usaloc_ua_synd_c3;
wire	[6:0]	usaloc_ua_synd_c4;
wire	[6:0]	usaloc_ua_synd_c5;
wire	[6:0]	usaloc_ua_synd_c52;
wire	[6:0]	usaloc_ua_synd_c6;
wire	[6:0]	usaloc_ua_synd_c7;
wire	[6:0]	usaloc_ua_synd_c8;
 
////////////////////////////// 
// This is a 39 bit datapath 
////////////////////////////// 
 
////////////////////////////// 
// Use the 26 lfetmost dp pitches for this 
////////////////////////////// 
 
// Use a 2-1 mux flop to reduce the setup on arb_acc_ua_c2 

l2t_vuadpm_dp_inv_macro__width_1 arb_acc_ua_c2_inv_slice   (
        .dout   (arb_acc_ua_c2_n),
        .din    (arb_acc_ua_c2)
        );

l2t_vuadpm_dp_mux_macro__mux_aonpe__ports_2__stack_39c__width_39 mux_diag_out_c2  // BS and SR VUAD ECC Change 8/9/04
 	(	
	.dout 	(diag_out_c2[38:0]), 
 	.din0	(usaloc_diag_rd_ua_out[38:0]), 
 	.din1	(vlddir_diag_rd_vd_out[38:0]), 
 	.sel0	(arb_acc_ua_c2), 
 	.sel1	(arb_acc_ua_c2_n) 
	); 

l2t_vuadpm_dp_msff_macro__stack_39c__width_39 ff_diag_out_c3  // VUAD ECC Change
        (
	.scan_in(ff_diag_out_c3_scanin),
	.scan_out(ff_diag_out_c3_scanout),
	.dout	(diag_out_c3[38:0]), 
        .din	(diag_out_c2[38:0]), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 


l2t_vuadpm_dp_msff_macro__stack_38c__width_37 ff_mbist_write_data  
        (
        .scan_in(ff_mbist_write_data_scanin),
        .scan_out(ff_mbist_write_data_scanout),
        .dout   ({mbist_write_data_px2[7:0],bist_vuad_rd_en_px2,
		  mbist_write_data_r1[7:0],bist_vuad_rd_en_r1,
		  mbist_write_data_r2[7:0],bist_vuad_rd_en_r2,
		  mbist_write_data_r3[7:0],bist_vuad_rd_en_r3,mbist_l2vuad_fail}),
        .din    ({mbist_write_data[7:0],bist_vuad_rd_en_px1,
		  mbist_write_data_px2[7:0],bist_vuad_rd_en_px2,
		  mbist_write_data_r1[7:0],bist_vuad_rd_en_r1,
		  mbist_write_data_r2[7:0],bist_vuad_rd_en_r2,mbist_l2vuad_fail_unreg}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ;


l2t_vuadpm_dp_cmp_macro__width_32 cmp_mbist_data_cmp0  
	(
	.dout	(vuad_fail1),
	.din0	(diag_out_c3[31:0]),
	.din1	({4{mbist_write_data_r3[7:0]}})
	);

l2t_vuadpm_dp_cmp_macro__width_8 cmp_mbist_data_cmp1  
        (
        .dout   (vuad_fail2),
        .din0   ({1'b0,diag_out_c3[38:32]}),
        .din1   ({1'b0,mbist_write_data_r3[6:0]})
        );

//assign mbist_l2vuad_fail = vuad_fail1 | vuad_fail2;

l2t_vuadpm_dp_and_macro__width_1 and_mbist_l2vuad_fail 
	(
	.dout	(mbist_l2vuad_fail_raw),
	.din0	(vuad_fail1),
	.din1	(vuad_fail2)
	);

l2t_vuadpm_dp_inv_macro__width_1 inv_bist_vuad_rd_en_r3_n 
	(
	.dout	(bist_vuad_rd_en_r3_n),
	.din	(bist_vuad_rd_en_r3)
	);

l2t_vuadpm_dp_mux_macro__mux_aonpe__ports_2__width_1 mux_mbdata_fail_unreg 
        (
        .dout   (mbist_l2vuad_fail_unreg),
        .din0   (mbist_l2vuad_fail_raw),
        .din1   (1'b1),
        .sel0   (bist_vuad_rd_en_r3),
        .sel1   (bist_vuad_rd_en_r3_n)
        );



 
l2t_vuadpm_dp_msff_macro__dmsff_4x__stack_39c__width_39 ff_diag_out_c4  // VUAD ECC Change
        (
	.scan_in(ff_diag_out_c4_scanin),
	.scan_out(ff_diag_out_c4_scanout),
	.dout	(diag_out_c4[38:0]), 
        .din	(diag_out_c3[38:0]), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 
 
l2t_vuadpm_dp_msff_macro__dmsff_4x__stack_39c__width_39 ff_diag_out_c5  // VUAD ECC Change
        (
	.scan_in(ff_diag_out_c5_scanin),
	.scan_out(ff_diag_out_c5_scanout),
	.dout	(diag_out_c5[38:0]), 
        .din	(diag_out_c4[38:0]), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 

// BS 03/11/04 extra cycle for mem access

l2t_vuadpm_dp_msff_macro__dmsff_4x__stack_39c__width_39 ff_diag_out_c52  // VUAD ECC Change
        (
        .scan_in(ff_diag_out_c52_scanin),
        .scan_out(ff_diag_out_c52_scanout),
        .dout   (diag_out_c52[38:0]),
        .din    (diag_out_c5[38:0]),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ;

 
l2t_vuadpm_dp_msff_macro__dmsff_4x__stack_39c__width_39 ff_diag_out_c6  // VUAD ECC Change
        (
	.scan_in(ff_diag_out_c6_scanin),
	.scan_out(ff_diag_out_c6_scanout),
	.dout	(diag_out_c6[38:0]), 
        .din	(diag_out_c52[38:0]), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 
 
l2t_vuadpm_dp_msff_macro__dmsff_32x__stack_39c__width_39 ff_diag_out_c7  // VUAD ECC Change
        (
	.scan_in(ff_diag_out_c7_scanin),
	.scan_out(ff_diag_out_c7_scanout),
	.dout	(diag_out_c7[38:0]), 
        .din	(diag_out_c6[38:0]), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 
 
//msff_macro ff_diag_out_c8 (width=39,stack=39c,dmsff=4x) // VUAD ECC Change
//        (
//	.scan_in(ff_diag_out_c8_scanin),
//	.scan_out(ff_diag_out_c8_scanout),
//	.dout	(diag_out_c8[38:0]), 
//        .din	(diag_out_c7[38:0]), 
//        .clk	(l2clk), 
//        .en	(1'b1)
//        ) ; 
// 
// eventhough the suffix says c7 this is actually c8 data 
// sent to decc. THis data gets muxed with other diagnostic 
// data and inval data in C8 and is transmitted to the 
// requesting sparc in the next cycle. 
 
assign  vuadpm_vuad_diag_data_c7 = diag_out_c7 ; 
 
////////////////////////////// 
// Use the 4 rightmost dp pitches for this 
////////////////////////////// 
 
l2t_vuadpm_dp_msff_macro__stack_4c__width_4 ff_ue_fifo 
        (
        .scan_in(ff_ue_fifo_scanin),
        .scan_out(ff_ue_fifo_scanout),
        .dout   ({vd_ue_c3, ua_ue_c3,
		  vd_ue_c4, ua_ue_c4}),
        .din    ({ vlddir_vd_ue_c2,usaloc_ua_ue_c2, 
		   vd_ue_c3, ua_ue_c3}),
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ; 
 
assign vuadpm_vd_ue_c4 = vd_ue_c4;
assign vuadpm_ua_ue_c4 = ua_ue_c4;

l2t_vuadpm_dp_msff_macro__stack_56c__width_56 ff_ua_synd_fifo 
        (
        .scan_in(ff_ua_synd_fifo_scanin),
        .scan_out(ff_ua_synd_fifo_scanout),
        .dout   ({ usaloc_ua_synd_c3[6:0], 
		   usaloc_ua_synd_c4[6:0], 
		   usaloc_ua_synd_c5[6:0], 
		   usaloc_ua_synd_c52[6:0],
		   usaloc_ua_synd_c6[6:0], 
		   usaloc_ua_synd_c7[6:0], 
		   usaloc_ua_synd_c8[6:0], 
		   usaloc_ua_synd_c9[6:0]}),
        .din    ({ {usaloc_ua_ce_c2,usaloc_ua_synd_c2[5:0]}, 
                 usaloc_ua_synd_c3[6:0], 
                 usaloc_ua_synd_c4[6:0], 
                 usaloc_ua_synd_c5[6:0], 
                 usaloc_ua_synd_c52[6:0],
                 usaloc_ua_synd_c6[6:0], 
                 usaloc_ua_synd_c7[6:0], 
                 usaloc_ua_synd_c8[6:0]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2t_vuadpm_dp_msff_macro__stack_56c__width_56 ff_vd_synd_fifo 
        (
        .scan_in(ff_vd_synd_fifo_scanin),
        .scan_out(ff_vd_synd_fifo_scanout),
        .dout   ({ vlddir_vd_synd_c3[6:0],
                   vlddir_vd_synd_c4[6:0],
                   vlddir_vd_synd_c5[6:0],
                   vlddir_vd_synd_52[6:0],
                   vlddir_vd_synd_c6[6:0],
                   vlddir_vd_synd_c7[6:0],
                   vlddir_vd_synd_c8[6:0],
                   vlddir_vd_synd_c9[6:0]}),
        .din    ({ {vlddir_vd_ce_c2,vlddir_vd_synd_c2[5:0]},
                 vlddir_vd_synd_c3[6:0],
                 vlddir_vd_synd_c4[6:0],
                 vlddir_vd_synd_c5[6:0],
                 vlddir_vd_synd_52[6:0],
                 vlddir_vd_synd_c6[6:0],
                 vlddir_vd_synd_c7[6:0],
                 vlddir_vd_synd_c8[6:0]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;




 
// Bist data flops 
 
 
// 34 bits from 8 bits. 
assign  bist_data_c3 = { bist_vuad_data_in[6:0], {4{bist_vuad_data_in[7:0]}}}; 
 
 
//Diagnostic WR data mux 
l2t_vuadpm_dp_msff_macro__stack_39c__width_39 ff_arbdata_wr_data_c3  // VUAD ECC Change
        (
	.scan_in(ff_arbdata_wr_data_c3_scanin),
	.scan_out(ff_arbdata_wr_data_c3_scanout),
	.dout	(arbdata_wr_data_c3[38:0]), 
        .din	(arbdat_arbdata_wr_data_c2[38:0]), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 
 
// Use a 2-1 mux flop for vuadpm_bistordiag_ua_data 

l2t_vuadpm_dp_inv_macro__width_1 vuaddp_sel_diag1_data_wr_c3_inv_slice   (
        .dout   (vuaddp_sel_diag1_data_wr_c3_n),
        .din    (vuaddp_sel_diag1_data_wr_c3)
        );

l2t_vuadpm_dp_mux_macro__mux_aonpe__ports_2__stack_39c__width_39 mux_lhs_bistordiag_data 
       (
        .dout (bistordiag_ua_data_in[38:0]), 
        .din0  (arbdata_wr_data_c3[38:0]),
        .din1  (bist_data_c3[38:0]),
        .sel0 (vuaddp_sel_diag1_data_wr_c3), 
        .sel1 (vuaddp_sel_diag1_data_wr_c3_n) 
       ) ; 
 
l2t_vuadpm_dp_msff_macro__stack_39c__width_39 ff_bistordiag_ua_data 
        (
	.scan_in(ff_bistordiag_ua_data_scanin),
	.scan_out(ff_bistordiag_ua_data_scanout),
	.dout	(vuadpm_bistordiag_ua_data[38:0]), 
        .din	(bistordiag_ua_data_in[38:0]), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 
 
 
// Use a 2-1 mux flop for vuadpm_bistordiag_vd_data 
l2t_vuadpm_dp_inv_macro__width_1 vuaddp_sel_diag0_data_wr_c3_inv_slice   (
        .dout   (vuaddp_sel_diag0_data_wr_c3_n),
        .din    (vuaddp_sel_diag0_data_wr_c3)
        );



l2t_vuadpm_dp_mux_macro__mux_aonpe__ports_2__stack_39c__width_39 mux_rhs_bistordiag_data  
	(
	.dout 	(bistordiag_vd_data_in[38:0]), 
 	.din0  	(arbdata_wr_data_c3[38:0]),
 	.din1  	(bist_data_c3[38:0]), 
  	.sel0 	(vuaddp_sel_diag0_data_wr_c3), 
  	.sel1 	(vuaddp_sel_diag0_data_wr_c3_n) 
	); 
 
l2t_vuadpm_dp_msff_macro__stack_39c__width_39 ff_bistordiag_vd_data  // VUAD ECC Change
        (
	.scan_in(ff_bistordiag_vd_data_scanin),
	.scan_out(ff_bistordiag_vd_data_scanout),
	.dout	(vuadpm_bistordiag_vd_data[38:0]), 
        .din	(bistordiag_vd_data_in[38:0]), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 
 
 
// fixscan start:
assign ff_diag_out_c3_scanin     = scan_in                  ;
assign ff_mbist_write_data_scanin = ff_diag_out_c3_scanout   ;
assign ff_diag_out_c4_scanin     = ff_mbist_write_data_scanout;
assign ff_diag_out_c5_scanin     = ff_diag_out_c4_scanout   ;
assign ff_diag_out_c52_scanin    = ff_diag_out_c5_scanout   ;
assign ff_diag_out_c6_scanin     = ff_diag_out_c52_scanout  ;
assign ff_diag_out_c7_scanin     = ff_diag_out_c6_scanout   ;
assign ff_ue_fifo_scanin         = ff_diag_out_c7_scanout   ;
assign ff_ua_synd_fifo_scanin    = ff_ue_fifo_scanout       ;
assign ff_vd_synd_fifo_scanin    = ff_ua_synd_fifo_scanout  ;
assign ff_arbdata_wr_data_c3_scanin = ff_vd_synd_fifo_scanout  ;
assign ff_bistordiag_ua_data_scanin = ff_arbdata_wr_data_c3_scanout;
assign ff_bistordiag_vd_data_scanin = ff_bistordiag_ua_data_scanout;
assign scan_out                  = ff_bistordiag_vd_data_scanout;
// fixscan end:
endmodule 



//
//   invert macro
//
//





module l2t_vuadpm_dp_inv_macro__width_1 (
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

module l2t_vuadpm_dp_mux_macro__mux_aonpe__ports_2__stack_39c__width_39 (
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






// any PARAMS parms go into naming of macro

module l2t_vuadpm_dp_msff_macro__stack_39c__width_39 (
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

module l2t_vuadpm_dp_msff_macro__stack_38c__width_37 (
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
wire [35:0] so;

  input [36:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [36:0] dout;


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
dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_vuadpm_dp_cmp_macro__width_32 (
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





module l2t_vuadpm_dp_cmp_macro__width_8 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_vuadpm_dp_and_macro__width_1 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_vuadpm_dp_mux_macro__mux_aonpe__ports_2__width_1 (
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






// any PARAMS parms go into naming of macro

module l2t_vuadpm_dp_msff_macro__dmsff_4x__stack_39c__width_39 (
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

module l2t_vuadpm_dp_msff_macro__dmsff_32x__stack_39c__width_39 (
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

module l2t_vuadpm_dp_msff_macro__stack_4c__width_4 (
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













// any PARAMS parms go into naming of macro

module l2t_vuadpm_dp_msff_macro__stack_56c__width_56 (
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








