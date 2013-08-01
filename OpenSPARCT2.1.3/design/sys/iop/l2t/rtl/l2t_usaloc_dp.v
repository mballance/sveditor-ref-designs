// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_usaloc_dp.v
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
module l2t_usaloc_dp (
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_muxtest, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  tagdp_lru_way_sel_c3, 
  vuaddp_fill_way_c3, 
  tag_hit_way_vld_c3, 
  arb_vuad_ce_err_c3, 
  vuadpm_bistordiag_ua_data, 
  vuaddp_vuad_evict_c3, 
  vuaddp_wr64_inst_c3, 
  vuaddp_vuad_sel_c4, 
  vuaddp_vuad_sel_rd, 
  vuaddp_vuad_sel_c2_d1, 
  vuaddp_bistordiag_wr_ua_c4, 
  vuaddp_sel_ua_wr_data_byp, 
  vuaddp_alloc_set_cond_c3, 
  vuaddp_alloc_rst_cond_c3, 
  filbuf_vuad_bypassed_c3, 
  arb_bs_or_bis_inst_c2, 
  vuad_array_rd_data_c1, 
  usaloc_vuad_array_wr_data_c4, 
  usaloc_vuad_used_c2, 
  usaloc_vuad_alloc_c2, 
  usaloc_diag_rd_ua_out, 
  usaloc_ua_ue_c2, 
  usaloc_ua_ce_c2, 
  usaloc_ua_synd_c2, 
  vuad_usaloc_mux_used_and_alloc_comb_sel0, 
  vuad_usaloc_mux_used_and_alloc_comb_sel1, 
  vuad_usaloc_mux_used_and_alloc_comb_sel2, 
  vuad_usaloc_mux_used_and_alloc_comb_sel3, 
  vuad_usaloc_mux_used_and_alloc_comb_sel4, 
  vuad_usaloc_mux_used_and_alloc_comb_sel5);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire muxtst;
wire vuaddp_vuad_evict_c3_qual;
wire ua_ecc_synd_zero;
wire usaloc_ua_ue_c2_unbuff;
wire vuaddp_vuad_sel_rd_c2_n;
wire usaloc_ua_ce_c2_n;
wire vuaddp_vuad_sel_rd_c2;
wire [5:0] usaloc_ua_synd_c2_n;
wire [15:0] vuaddp_fill_way_c3_n;
wire [15:0] tag_hit_way_vld_c3_n;
wire [15:0] vuaddp_hit_wayvld_c3;
wire [15:0] vuaddp_hit_wayvld_c3_n;
wire [15:0] used_byp_c3_in_1;
wire [15:0] used_c3_n;
wire [15:0] used_or_alloc_c3;
wire [15:0] alloc_c3_n;
wire mux_used_byp_c3_in_2_3_4_sel1;
wire arb_bs_or_bis_inst_c3;
wire used_byp_c3_in_4;
wire [15:0] used_byp_c3_in_2_3_4;
wire [15:0] used_byp_c3_in_2_3_4_n;
wire [15:0] used_byp_c3_in_n;
wire [15:0] used_byp_c3_in_buf;
wire [15:0] alloc_byp_c3_in_buf;
wire vuaddp_bistordiag_wr_ua_c4_n;
wire vuaddp_vuad_sel_c4_n;
wire vuaddp_sel_ua_wr_data_byp_n;
wire ff_used_and_alloc_c2_scanin;
wire ff_used_and_alloc_c2_scanout;
wire ff_used_and_alloc_rd_c2_scanin;
wire ff_used_and_alloc_rd_c2_scanout;
wire vuaddp_vuad_sel_c2_d1_n;
wire [15:0] used_fnl_c2_buf;
wire ff_used_alloc_c3_scanin;
wire ff_used_alloc_c3_scanout;
wire arb_bs_or_bis_inst_c2_n;
wire [15:0] alloc_byp_c3_in_12_13;
wire [15:0] alloc_byp_c3_in_12_13_n;
wire [15:0] alloc_byp_c3_in_1;
wire [15:0] alloc_byp_c3_in_2;
wire [15:0] alloc_byp_c3_in_2_n;
wire ff_used_alloc_c4_scanin;
wire ff_used_alloc_c4_scanout;
wire ff_used_alloc_wr_c5_scanin;
wire ff_used_alloc_wr_c5_scanout;
wire ff_used_alloc_wr_c52_scanin;
wire ff_used_alloc_wr_c52_scanout;
 
 
input   l2clk; 
input   scan_in; 
output   scan_out; 
input   tcu_pce_ov;
input   tcu_muxtest;
input   tcu_aclk;
input tcu_bclk;
input tcu_scan_en;
input tcu_clk_stop;

 
 
// 100+ pins on the right. 
input   [15:0]  tagdp_lru_way_sel_c3; // Right 
input   [15:0]  vuaddp_fill_way_c3; // Right 
//input   [15:0]  vuaddp_hit_wayvld_c3; // Right 

input   [15:0]  tag_hit_way_vld_c3; // Right 
input   arb_vuad_ce_err_c3; // Right 

input   [38:0]  vuadpm_bistordiag_ua_data; // Right 

// Right 
input           vuaddp_vuad_evict_c3;    
input           vuaddp_wr64_inst_c3; 
 
// Right 
input           vuaddp_vuad_sel_c4; 
input           vuaddp_vuad_sel_rd; 
input           vuaddp_vuad_sel_c2_d1; 
 
input           vuaddp_bistordiag_wr_ua_c4; 
input           vuaddp_sel_ua_wr_data_byp; 
input           vuaddp_alloc_set_cond_c3; 
input           vuaddp_alloc_rst_cond_c3; 
input           filbuf_vuad_bypassed_c3; 
input           arb_bs_or_bis_inst_c2;
 
// Bottom 
input   [77:39] vuad_array_rd_data_c1 ;  
 
output  [77:39] usaloc_vuad_array_wr_data_c4;  // Bottom 
 
output  [15:0]  usaloc_vuad_used_c2; // Top  
output  [15:0]  usaloc_vuad_alloc_c2; // Top  
 
output  [38:0]  usaloc_diag_rd_ua_out ; // Right 


output           usaloc_ua_ue_c2;
output           usaloc_ua_ce_c2;
output  [5:0]    usaloc_ua_synd_c2;

input		vuad_usaloc_mux_used_and_alloc_comb_sel0;
input		vuad_usaloc_mux_used_and_alloc_comb_sel1;
input		vuad_usaloc_mux_used_and_alloc_comb_sel2;
input		vuad_usaloc_mux_used_and_alloc_comb_sel3;
input		vuad_usaloc_mux_used_and_alloc_comb_sel4;
input		vuad_usaloc_mux_used_and_alloc_comb_sel5;

assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign muxtst = tcu_muxtest;
 
wire    [15:0]  used_rd_byp_c2; 
wire    [15:0]  used_rd_c2; 
wire    [15:0]  used_byp_c1; 
wire    [15:0]  used_byp_c3_in; 
wire    [15:0]  used_c1; 
wire    [15:0]  used_c2; 
wire    [15:0]  used_c3; 
wire    [15:0]  used_c4; 
wire    [15:0]  used_corr_c2; 
wire    [15:0]  used_fnl_c2; 
wire    [15:0]  used_wr_data_c5; 
wire    [15:0]  used_wr_data_c52; // BS 03/11/04 extra cycle for mem access 
wire    [15:0]  alloc_rd_byp_c2; 
wire    [15:0]  alloc_rd_c2; 
wire    [15:0]  alloc_byp_c1; 
wire    [15:0]  alloc_byp_c2_in; 
wire    [15:0]  alloc_byp_c3_in; 
wire    [15:0]  alloc_corr_c2;
wire    [15:0]  alloc_fnl_c2;
wire    [15:0]  alloc_c1; 
wire    [15:0]  alloc_c2; 
wire    [15:0]  alloc_c3; 
wire    [15:0]  alloc_c4; 
wire    [15:0]  alloc_wr_data_c5; 
wire    [15:0]  alloc_wr_data_c52; // BS 03/11/04 extra cycle for mem access 
wire    [15:0]  used_byp_c2c3; 
wire    [15:0]  used_byp_c4c5; 
wire    [15:0]  alloc_byp_c4c5; 
wire    [6:0]   ua_ecc_wr_data_c3;
wire    [6:0]   ua_ecc_wr_data_c4;
wire    [6:0]   ua_ecc_wr_data_c5;
wire    [6:0]   ua_ecc_wr_data_c52;
wire    [6:0]   ua_ecc_rd_data_c2;
wire    [6:0]   ua_ecc_c2;
wire    [6:0]   ua_ecc_synd;
 
l2t_usaloc_dp_nor_macro__dnor_16x__width_1 nor_vuaddp_vuad_evict_c3_qual 
	(
	.dout	(vuaddp_vuad_evict_c3_qual),
	.din0	(arb_vuad_ce_err_c3),
	.din1	(vuaddp_vuad_evict_c3)
	);
 
//////////////////////////////////////////////////////////////////////////////// 
//// ALLOC AND USED BIT 32 dp pitches 
////////////////////////////////////////////////////////////////////////////////// 
//assign usaloc_ua_ue_c2 = ((|(ua_ecc_synd[5:0])) & ~ua_ecc_synd[6]) & vuaddp_vuad_sel_rd_c2 ;

l2t_usaloc_dp_cmp_macro__width_8 cmp_ua_ecc_synd_nonzero 
        (
        .dout   (ua_ecc_synd_zero),
        .din0   ({2'b0,ua_ecc_synd[5:0]}),
        .din1   ({8'b0})
        );

l2t_usaloc_dp_nor_macro__ports_3__width_1 nor_usaloc_ua_ue_c2 
        (
        .dout   (usaloc_ua_ue_c2_unbuff),
        .din0   (ua_ecc_synd[6]),
        .din1   (vuaddp_vuad_sel_rd_c2_n),
        .din2   (ua_ecc_synd_zero)
        );

l2t_usaloc_dp_buff_macro__dbuff_48x__width_1 buff_usaloc_ua_ue_c2  
        (
        .dout   (usaloc_ua_ue_c2),
        .din    (usaloc_ua_ue_c2_unbuff)
        );


/////////////////////////////////////////////////////////////////////
//assign usaloc_ua_ce_c2 = (ua_ecc_synd[6] & (vuaddp_vuad_sel_rd_c2 ));
l2t_usaloc_dp_nand_macro__width_1 nand_usaloc_ua_ce_c2 
        (
        .dout   (usaloc_ua_ce_c2_n),
        .din0   (ua_ecc_synd[6]),
        .din1   (vuaddp_vuad_sel_rd_c2)
        );

l2t_usaloc_dp_inv_macro__width_1 inv_usaloc_ua_ce_c2 
        (
        .dout   (usaloc_ua_ce_c2),
        .din    (usaloc_ua_ce_c2_n)
        );

/////////////////////////////////////////////////////////////////////
//assign usaloc_ua_synd_c2 = (ua_ecc_synd[5:0] & {6{(vuaddp_vuad_sel_rd_c2 )}});

l2t_usaloc_dp_nand_macro__width_6 nand_usaloc_ua_synd_c2_n  
	(
	.dout	(usaloc_ua_synd_c2_n[5:0]),
	.din0	(ua_ecc_synd[5:0]),
	.din1	({6{vuaddp_vuad_sel_rd_c2}})
	);

l2t_usaloc_dp_inv_macro__dinv_48x__width_6  inv_usaloc_ua_synd_c2  
	(
	.dout	(usaloc_ua_synd_c2[5:0]),
	.din	(usaloc_ua_synd_c2_n[5:0])
	);

////////////////////////////////////////
// in case of BIST and BST , to mitigate L2 cache pollution on copy routines,
// we will reset the Use bit everytime the BIST or BST hits in the L2 cache
// and does the store to L2. This way the same line that the BST or BIST 
// is updating can be picked for replacement in the near future instead of 
// another line which is not getting
// touched by the copy routine.

//assign used_byp_c3_in_5[15:0] = ~used_byp_c3_in_2_3_4[15:0]);
//assign used_or_alloc_c3[15:0] = used_c3[15:0] | alloc_c3[15:0];

l2t_usaloc_dp_inv_macro__width_16 inv_vuaddp_fill_way_c3  
	(
	.dout	(vuaddp_fill_way_c3_n[15:0]),
	.din	(vuaddp_fill_way_c3[15:0])
	);

////////  Timing fix bypassed vuad ctl ///////////////
//inv_macro inv_arb_vuad_ce_err_c3 (width=1,dinv=16x)
//	(
//	.dout	(arb_vuad_ce_err_c3_n),
//	.din	(arb_vuad_ce_err_c3)
//	);
//
//
l2t_usaloc_dp_inv_macro__dinv_16x__width_16 inv_tag_hit_way_vld_c3 
        (
        .dout   (tag_hit_way_vld_c3_n[15:0]),
        .din    (tag_hit_way_vld_c3[15:0])
        );


l2t_usaloc_dp_nor_macro__width_16 nor_vuaddp_hit_wayvld_c3 
	(
	.dout	(vuaddp_hit_wayvld_c3[15:0]),
	.din0	(tag_hit_way_vld_c3_n[15:0]),
	.din1	({16{arb_vuad_ce_err_c3}})
	);
//////////  Timing fix bypassed vuad ctl ///////////////

l2t_usaloc_dp_inv_macro__width_16 inv_vuaddp_hit_wayvld_c3 
	(
	.dout	(vuaddp_hit_wayvld_c3_n[15:0]),
	.din	(vuaddp_hit_wayvld_c3[15:0])
	);

l2t_usaloc_dp_nand_macro__ports_3__width_16 nand_used_byp_c3_in_1 
	(
	.dout	(used_byp_c3_in_1[15:0]),
	.din0	(used_c3_n[15:0]),
	.din1	(vuaddp_fill_way_c3_n[15:0]),
	.din2	(vuaddp_hit_wayvld_c3_n[15:0])
	);

//
//inv_macro inv_alloc_used_c3  (width=32,dinv=16x)
//	(
//	.dout	({used_c3_n[15:0],alloc_c3_n[15:0]}),
//	.din	({used_c3[15:0],alloc_c3[15:0]})
//	);
//	
l2t_usaloc_dp_nand_macro__width_16 nand_used_or_alloc_c3 
	(
	.dout	(used_or_alloc_c3[15:0]),
	.din0	(used_c3_n[15:0]),
	.din1	(alloc_c3_n[15:0])
	);

l2t_usaloc_dp_or_macro__width_1 or_for_sel_1 
	(
	.dout	(mux_used_byp_c3_in_2_3_4_sel1),
	.din0	(vuaddp_wr64_inst_c3),
	.din1	(arb_bs_or_bis_inst_c3)
	);

l2t_usaloc_dp_cmp_macro__width_16 cmp_used_byp_c3_in_4 
	(
	.dout	(used_byp_c3_in_4),
	.din0	(used_or_alloc_c3[15:0]),
	.din1	(16'hFFFF)
	);

l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_16r__width_16 mux_used_byp_c3_in_2_3_4 
	(
	.dout	(used_byp_c3_in_2_3_4[15:0]),
	.din0	(tagdp_lru_way_sel_c3[15:0]),
	.din1	(vuaddp_hit_wayvld_c3[15:0]),
	.din2	(16'hffff),
	.sel0	(vuaddp_vuad_evict_c3_qual),
	.sel1	(mux_used_byp_c3_in_2_3_4_sel1),
	.sel2	(used_byp_c3_in_4)
	);

l2t_usaloc_dp_inv_macro__dinv_32x__width_16 inv_used_byp_c3_in_2_3_4 
	(
	.dout	(used_byp_c3_in_2_3_4_n[15:0]),
	.din	(used_byp_c3_in_2_3_4[15:0])
	);
	
//assign used_byp_c3_in[15:0]   = used_byp_c3_in_1[15:0] & ~used_byp_c3_in_2_3_4[15:0] ;

l2t_usaloc_dp_nand_macro__dnand_16x__width_16 and_used_byp_c3_in 
	(
	.dout	(used_byp_c3_in_n[15:0]),
	.din0	(used_byp_c3_in_1[15:0]),
	.din1	(used_byp_c3_in_2_3_4_n[15:0])
	);

l2t_usaloc_dp_inv_macro__dinv_32x__width_16 inv_used_byp_c3_in 
	(
	.dout	(used_byp_c3_in[15:0]),
	.din	(used_byp_c3_in_n[15:0])
	);

l2t_pgen32b_dp     ua_ecc_gen
        (
        .parity (ua_ecc_wr_data_c3[6:0]),
        .dout   ({used_byp_c3_in_buf[15:0],alloc_byp_c3_in_buf[15:0]}),
        .din    ({used_byp_c3_in[15:0],alloc_byp_c3_in[15:0]})
        );


l2t_usaloc_dp_inv_macro__dinv_32x__width_1 vuaddp_bistordiag_wr_ua_c4_inv_slice  
	( 
	.dout	(vuaddp_bistordiag_wr_ua_c4_n ), 
	.din	(vuaddp_bistordiag_wr_ua_c4 ) 
	);	

l2t_usaloc_dp_inv_macro__dinv_32x__width_1 vuaddp_vuad_sel_c4_inv_slice  
	( 
	.dout	(vuaddp_vuad_sel_c4_n ), 
	.din	(vuaddp_vuad_sel_c4 ) 
	);	
 
//inv_macro vuaddp_vuad_sel_rd_inv_slice (width=1,dinv=32x)
//        (
//        .dout   (vuaddp_vuad_sel_rd_n ),
//        .din    (vuaddp_vuad_sel_rd )
//        );

l2t_usaloc_dp_inv_macro__dinv_32x__width_1 vuaddp_vuad_sel_rd_inv_c2_slice 
        (
        .dout   (vuaddp_vuad_sel_rd_c2_n ),
        .din    (vuaddp_vuad_sel_rd_c2 )
        );
l2t_usaloc_dp_inv_macro__dinv_32x__width_1 vuaddp_sel_ua_wr_data_byp_inv_slice 
        (
        .dout   (vuaddp_sel_ua_wr_data_byp_n ),
        .din    (vuaddp_sel_ua_wr_data_byp )
        );

//inv_macro vuaddp_vuad_sel_c2_inv_slice (width=1,dinv=32x)
//        (
//        .dout   (vuaddp_vuad_sel_c2_n ),
//        .din    (vuaddp_vuad_sel_c2 )
//        );
//
//inv_macro vuaddp_vuad_sel_c2orc3_inv_slice (width=1,dinv=32x)
//        (
//        .dout   (vuaddp_vuad_sel_c2orc3_n ),
//        .din    (vuaddp_vuad_sel_c2orc3 )
//        );
//


l2t_usaloc_dp_msff_macro__dmsff_32x__stack_39r__width_39 ff_used_and_alloc_c2 
        (
	.scan_in(ff_used_and_alloc_c2_scanin),
	.scan_out(ff_used_and_alloc_c2_scanout),
	.dout	({ua_ecc_c2[6:0],used_c2[15:0],alloc_c2[15:0]}), 
	.din	({vuad_array_rd_data_c1[77:71],used_c1[15:0],alloc_c1[15:0]}), 
        .clk	(l2clk), 
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 

l2t_ecc39_dp ua_ecc_corr
  (
 .dout   ({used_corr_c2[15:0],alloc_corr_c2[15:0]}),
 .cflag  (ua_ecc_synd[5:0]),
 .pflag  (ua_ecc_synd[6]),
 .din    ({used_c2[15:0],alloc_c2[15:0]}),
 .parity (ua_ecc_c2[6:0])
  );

l2t_usaloc_dp_msff_macro__dmsff_32x__stack_33r__width_33 ff_used_and_alloc_rd_c2 
        (
	.scan_in(ff_used_and_alloc_rd_c2_scanin),
	.scan_out(ff_used_and_alloc_rd_c2_scanout),
	.dout({vuaddp_vuad_sel_rd_c2,used_rd_byp_c2[15:0],alloc_rd_byp_c2[15:0]}),  
	.din({vuaddp_vuad_sel_rd,vuad_array_rd_data_c1[70:55],vuad_array_rd_data_c1[54:39]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ); 

l2t_usaloc_dp_buff_macro__dbuff_48x__width_32 buff_usaloc_vuad_alloc_c2 
	(
	.dout	({usaloc_vuad_used_c2[15:0],usaloc_vuad_alloc_c2[15:0]}),
	.din	({used_c2[15:0],alloc_c2[15:0]})
	);



l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_39r__width_39 mux_used_alloc_rd_c2 
        (
        .dout ({ua_ecc_rd_data_c2[6:0],used_rd_c2[15:0],alloc_rd_c2[15:0]}),
        .din0  ({ua_ecc_wr_data_c52[6:0],used_wr_data_c52[15:0],alloc_wr_data_c52[15:0]}),
        .din1  ({ua_ecc_c2[6:0],used_rd_byp_c2[15:0],alloc_rd_byp_c2[15:0]}),
        .sel0 (vuaddp_sel_ua_wr_data_byp),
        .sel1 (vuaddp_sel_ua_wr_data_byp_n)
        );


l2t_usaloc_dp_buff_macro__dbuff_48x__width_39 buff_usaloc_diag_rd_ua_out 	
	(
	.dout	(usaloc_diag_rd_ua_out[38:0]),
	.din	({ua_ecc_rd_data_c2[6:0],used_rd_c2[15:0],alloc_rd_c2[15:0]})
	);

// assign  usaloc_diag_rd_ua_out[38:32] = ua_ecc_rd_data_c2[6:0];
// assign  usaloc_diag_rd_ua_out[31:16] = used_rd_c2[15:0];
// assign  usaloc_diag_rd_ua_out[15:0]  = alloc_rd_c2[15:0];

l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32r__width_32 mux_fnl_used_alloc_c2 
       (
	.dout({used_fnl_c2[15:0],alloc_fnl_c2[15:0]}),
        .din0  ({used_corr_c2[15:0],alloc_corr_c2[15:0]}),
        .din1  ({used_c2[15:0],alloc_c2[15:0]}),
        .sel0  (vuaddp_vuad_sel_rd_c2),
        .sel1  (vuaddp_vuad_sel_rd_c2_n)
       );


 
 
 
l2t_usaloc_dp_inv_macro__dinv_32x__width_1 vuaddp_vuad_sel_c2_d1_inv_slice  
	( 
	.dout	(vuaddp_vuad_sel_c2_d1_n ), 
	.din	(vuaddp_vuad_sel_c2_d1 ) 
	);	



l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_16r__width_16 mux_used_alloc_byp_c2_in 
         (
 	.dout (alloc_byp_c2_in[15:0]), 
        .din0  (alloc_fnl_c2[15:0]),         
        .din1  (alloc_byp_c3_in[15:0]),  
 	.sel0 (vuaddp_vuad_sel_c2_d1_n), 
 	.sel1 (vuaddp_vuad_sel_c2_d1) 
         ) ; 

l2t_usaloc_dp_buff_macro__minbuff_1__stack_33r__width_16 used_alloc_c3_minbuff  (
  .din (used_fnl_c2[15:0]),
  .dout(used_fnl_c2_buf[15:0]));

l2t_usaloc_dp_msffi_macro__dmsffi_32x__stack_33r__width_33 ff_used_alloc_c3 
        (
	.scan_in(ff_used_alloc_c3_scanin),
	.scan_out(ff_used_alloc_c3_scanout),
	.dout_l({arb_bs_or_bis_inst_c3,used_c3_n[15:0],alloc_c3_n[15:0]}), 
	.din({arb_bs_or_bis_inst_c2_n,used_fnl_c2_buf[15:0],alloc_byp_c2_in[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 

l2t_usaloc_dp_inv_macro__dinv_16x__width_1 inv_arb_bs_or_bis_inst_c2 
	(
	.dout	(arb_bs_or_bis_inst_c2_n),
	.din	(arb_bs_or_bis_inst_c2)
	);

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//assign  alloc_byp_c3_in[15:0] = (   alloc_c3[15:0] | 
//                 ({16{vuaddp_alloc_set_cond_c3}} & vuaddp_hit_wayvld_c3[15:0]) | 
//               ({16{vuaddp_vuad_evict_c3}} & tagdp_lru_way_sel_c3[15:0]) )  & 
//              ~( ({16{vuaddp_alloc_rst_cond_c3}} & vuaddp_hit_wayvld_c3[15:0]) |  
//                 ({16{filbuf_vuad_bypassed_c3}} & vuaddp_fill_way_c3[15:0]));  
//

//assign alloc_byp_c3_in_11[15:0] = alloc_c3[15:0];
//assign alloc_byp_c3_in_12[15:0] = ({16{vuaddp_alloc_set_cond_c3}} & vuaddp_hit_wayvld_c3[15:0]);
//assign alloc_byp_c3_in_13[15:0] =  ({16{vuaddp_vuad_evict_c3}} & tagdp_lru_way_sel_c3[15:0]);
//assign alloc_byp_c3_in_1[15:0] =  alloc_byp_c3_in_11[15:0] | alloc_byp_c3_in_12[15:0] | alloc_byp_c3_in_13[15:0];


l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_16r__width_16 mux_alloc_byp_c3_in_12_13 
	(
	.dout	(alloc_byp_c3_in_12_13[15:0]),
	.din0	(vuaddp_hit_wayvld_c3[15:0]),
	.din1	(tagdp_lru_way_sel_c3[15:0]),
	.sel0	(vuaddp_alloc_set_cond_c3),
	.sel1	(vuaddp_vuad_evict_c3_qual)
	);

l2t_usaloc_dp_inv_macro__dinv_32x__width_16 inv_alloc_byp_c3_in_12_13 
	(
	.dout	(alloc_byp_c3_in_12_13_n[15:0]),
	.din	(alloc_byp_c3_in_12_13[15:0])
	);

l2t_usaloc_dp_nand_macro__dnand_16x__width_16 nand_alloc_byp_c3_in_1  
	(
	.dout	(alloc_byp_c3_in_1[15:0]),
	.din0	(alloc_byp_c3_in_12_13_n[15:0]),
	.din1	(alloc_c3_n[15:0])
	);


//assign alloc_byp_c3_in_21[15:0] = ({16{vuaddp_alloc_rst_cond_c3}} & vuaddp_hit_wayvld_c3[15:0]);
//assign alloc_byp_c3_in_22[15:0] = ({16{filbuf_vuad_bypassed_c3}} & vuaddp_fill_way_c3[15:0]);
//assign alloc_byp_c3_in_2[15:0] = ~(alloc_byp_c3_in_21[15:0] | alloc_byp_c3_in_22[15:0]);


l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_16r__width_16 mux_alloc_byp_c3_in_21_22 
        (
        .dout   (alloc_byp_c3_in_2[15:0]),
        .din0   (vuaddp_hit_wayvld_c3[15:0]),
        .din1   (vuaddp_fill_way_c3[15:0]),
        .sel0   (vuaddp_alloc_rst_cond_c3),
        .sel1   (filbuf_vuad_bypassed_c3)
        );

l2t_usaloc_dp_inv_macro__dinv_32x__width_16 inv_alloc_byp_c3_in_2 
        (
        .dout   (alloc_byp_c3_in_2_n[15:0]),
        .din    (alloc_byp_c3_in_2[15:0])
        );

l2t_usaloc_dp_and_macro__width_16 or_alloc_byp_c3_in  
        (
	.dout 	(alloc_byp_c3_in[15:0]),
	.din0	(alloc_byp_c3_in_1[15:0]),
	.din1	(alloc_byp_c3_in_2_n[15:0])
	);


//assign alloc_byp_c3_in[15:0] = alloc_byp_c3_in_1[15:0] &  alloc_byp_c3_in_2[15:0];


 

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////



l2t_usaloc_dp_msff_macro__stack_39r__width_39 ff_used_alloc_c4 
        (
	.scan_in(ff_used_alloc_c4_scanin),
	.scan_out(ff_used_alloc_c4_scanout),
	.dout({ua_ecc_wr_data_c4[6:0],used_c4[15:0],alloc_c4[15:0]}), 
        .din({ua_ecc_wr_data_c3[6:0],used_byp_c3_in_buf[15:0],alloc_byp_c3_in_buf[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 
l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_39r__width_39 mux_wr_array_used_alloc_c4 
        (
        .dout  (usaloc_vuad_array_wr_data_c4[77:39]), 
        .din0  ({ua_ecc_wr_data_c4[6:0],used_c4[15:0],alloc_c4[15:0]}), 
        .din1  (vuadpm_bistordiag_ua_data[38:0]),  
        .sel0  (vuaddp_bistordiag_wr_ua_c4_n), 
        .sel1  (vuaddp_bistordiag_wr_ua_c4) 
        ) ;     

 
l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32r__width_32 mux_used_alloc_byp_c4c5 
        (
	.dout ({used_byp_c4c5[15:0],alloc_byp_c4c5[15:0]}), 
        .din0  ({used_c4[15:0],alloc_c4[15:0]}),         
        .din1  ({used_wr_data_c5[15:0],alloc_wr_data_c5[15:0]}), 
	.sel0 (vuaddp_vuad_sel_c4), 
	.sel1 (vuaddp_vuad_sel_c4_n) 
        ); 
 
// Row 2, Vuad C5 flop 
l2t_usaloc_dp_msff_macro__stack_39r__width_39 ff_used_alloc_wr_c5 
        (
	.scan_in(ff_used_alloc_wr_c5_scanin),
	.scan_out(ff_used_alloc_wr_c5_scanout),
	.dout({ua_ecc_wr_data_c5[6:0],used_wr_data_c5[15:0],alloc_wr_data_c5[15:0]}), 
        .din({ua_ecc_wr_data_c4[6:0],used_c4[15:0],alloc_c4[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 
 
 
// Row1, Vuad C6 flop 
l2t_usaloc_dp_msff_macro__stack_39r__width_39 ff_used_alloc_wr_c52 
        (
	.scan_in(ff_used_alloc_wr_c52_scanin),
	.scan_out(ff_used_alloc_wr_c52_scanout),
	.dout({ua_ecc_wr_data_c52[6:0],used_wr_data_c52[15:0],alloc_wr_data_c52[15:0]}),
        .din({ua_ecc_wr_data_c5[6:0],used_wr_data_c5[15:0],alloc_wr_data_c5[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 
 
 
//mux_macro mux_fnl_used_alloc_c2 (width=32,stack=32r,ports=2,mux=aonpe,dmux=8x)
//       (
//	.dout({used_fnl_c2[15:0],alloc_fnl_c2[15:0]}),
//        .din0  ({used_corr_c2[15:0],alloc_corr_c2[15:0]}),
//        .din1  ({used_c2[15:0],alloc_c2[15:0]}),
//        .sel0  (vuaddp_vuad_sel_rd_c2),
//        .sel1  (vuaddp_vuad_sel_rd_c2_n)
//       );
//
//
//mux_macro mux_used_alloc_byp_c2_in (width=16,ports=2,mux=aonpe,stack=16r,dmux=8x)
//        (
//	.dout (alloc_byp_c2_in[15:0]), 
//        .din0  (alloc_fnl_c2[15:0]),         
//        .din1  (alloc_byp_c3_in[15:0]),  
//	.sel0 (vuaddp_vuad_sel_c2_d1_n), 
//	.sel1 (vuaddp_vuad_sel_c2_d1) 
//        ) ; 
//
// 
// 
//
//msff_macro ff_used_and_alloc_c2 (width=39,stack=39r)
//        (
//	.scan_in(ff_used_and_alloc_c2_scanin),
//	.scan_out(ff_used_and_alloc_c2_scanout),
//	.dout	({ua_ecc_c2[6:0],used_c2[15:0],alloc_c2[15:0]}), 
//	.din	({vuad_array_rd_data_c1[77:71],used_c1[15:0],alloc_c1[15:0]}), 
//        .clk	(l2clk), 
//	.en	(1'b1)
//        ) ; 
//
//-------------------------------------------------------------------------------------
// assign mux_used_and_alloc_comb_sel0 = vuaddp_vuad_sel_rd_c2   & vuaddp_vuad_sel_c2_d1_n  & 
//                                       vuaddp_vuad_sel_c2      & vuaddp_vuad_sel_c2orc3   &  vuaddp_vuad_sel_rd_n; 
// assign mux_used_and_alloc_comb_sel1 = vuaddp_vuad_sel_rd_c2_n & vuaddp_vuad_sel_c2_d1_n  & 
//                                       vuaddp_vuad_sel_c2      & vuaddp_vuad_sel_c2orc3   & vuaddp_vuad_sel_rd_n; 
// assign mux_used_and_alloc_comb_sel2 = vuaddp_vuad_sel_c2_d1   & 
//                                       vuaddp_vuad_sel_c2      & vuaddp_vuad_sel_c2orc3   & vuaddp_vuad_sel_rd_n; 
// assign mux_used_and_alloc_comb_sel3 = vuaddp_vuad_sel_c2_n    & vuaddp_vuad_sel_c2orc3   & vuaddp_vuad_sel_rd_n ; 
// assign mux_used_and_alloc_comb_sel4 =                           vuaddp_vuad_sel_c2orc3_n & vuaddp_vuad_sel_rd_n ;
// assign mux_used_and_alloc_comb_sel5 =                                                      vuaddp_vuad_sel_rd   ;

//-------------------------------------------------------------------------------------
//// sel0
//and_macro alloc_comb_and_sel0_and0  (width=1,ports=3)
//        (
//        .dout   (mux_u_and_a_comb_sel0_and0),
//        .din0   (vuaddp_vuad_sel_rd_c2),
//        .din1   (vuaddp_vuad_sel_c2_d1_n),
//        .din2   (vuaddp_vuad_sel_c2)
//        );
//and_macro alloc_comb_and_sel0_and1  (width=1,ports=3)
//        (
//        .dout   (mux_used_and_alloc_comb_sel0),
//        .din0   (mux_u_and_a_comb_sel0_and0),
//        .din1   (vuaddp_vuad_sel_c2orc3),
//        .din2   (vuaddp_vuad_sel_rd_n)
//        );
//
//
//// sel1
//and_macro alloc_comb_and_sel1_and0  (width=1,ports=3)
//        (
//        .dout   (mux_u_and_a_comb_sel1_and0),
//        .din0   (vuaddp_vuad_sel_rd_c2_n),
//        .din1   (vuaddp_vuad_sel_c2_d1_n),
//        .din2   (vuaddp_vuad_sel_c2)
//        );
//
//and_macro alloc_comb_and_sel1_and1  (width=1,ports=3)
//        (
//        .dout   (mux_used_and_alloc_comb_sel1),
//        .din0   (mux_u_and_a_comb_sel1_and0),
//        .din1   (vuaddp_vuad_sel_c2orc3),
//        .din2   (vuaddp_vuad_sel_rd_n)
//        );
//
//// sel2
//and_macro alloc_comb_and_sel2_and0  (width=1,ports=3)
//        (
//        .dout   (mux_u_and_a_comb_sel2_and0),
//        .din0   (vuaddp_vuad_sel_c2_d1),
//        .din1   (vuaddp_vuad_sel_c2),
//        .din2   (vuaddp_vuad_sel_c2orc3)
//        );
//
//and_macro alloc_comb_and_sel2_and1  (width=1,ports=2)
//        (
//        .dout   (mux_used_and_alloc_comb_sel2),
//        .din0   (mux_u_and_a_comb_sel2_and0),
//        .din1   (vuaddp_vuad_sel_rd_n)
//        );
//
//// sel3
//and_macro alloc_comb_and_sel3_and0  (width=1,ports=3)
//        (
//        .dout   (mux_used_and_alloc_comb_sel3),
//        .din0   (vuaddp_vuad_sel_c2_n),
//        .din1   (vuaddp_vuad_sel_c2orc3),
//        .din2   (vuaddp_vuad_sel_rd_n)
//        );
//
//// sel4
//and_macro alloc_comb_and_sel4_and0  (width=1,ports=2)
//        (
//        .dout   (mux_used_and_alloc_comb_sel4),
//        .din0   (vuaddp_vuad_sel_c2orc3_n),
//        .din1   (vuaddp_vuad_sel_rd_n)
//        );
//
//// sel5
//assign mux_used_and_alloc_comb_sel5 =  vuaddp_vuad_sel_rd ;

l2t_usaloc_dp_mux_macro__dmux_16x__mux_pgnpe__ports_6__stack_32r__width_32 mux_used_and_alloc_comb 
        (
	.dout  ({used_c1[15:0],alloc_c1[15:0]}), 
        .din0  ({used_corr_c2[15:0],alloc_corr_c2[15:0]}),
        .din1  ({used_c2[15:0],alloc_c2[15:0]}),
        .din2  ({used_c2[15:0],alloc_byp_c3_in[15:0]}),  
        .din3  ({used_byp_c3_in[15:0],alloc_byp_c3_in[15:0]}),  
        .din4  ({used_byp_c4c5[15:0],alloc_byp_c4c5[15:0]}),  
        .din5  ({vuad_array_rd_data_c1[70:55],vuad_array_rd_data_c1[54:39]}),   
        .sel0  ( vuad_usaloc_mux_used_and_alloc_comb_sel0) ,
        .sel1  ( vuad_usaloc_mux_used_and_alloc_comb_sel1) ,
        .sel2  ( vuad_usaloc_mux_used_and_alloc_comb_sel2) ,
        .sel3  ( vuad_usaloc_mux_used_and_alloc_comb_sel3) , 
        .sel4  ( vuad_usaloc_mux_used_and_alloc_comb_sel4) , 
        .sel5  ( vuad_usaloc_mux_used_and_alloc_comb_sel5),
  .muxtst(muxtst) 
        ) ; 

 
// fixscan start:
assign ff_used_and_alloc_c2_scanin = scan_in                  ;
assign ff_used_and_alloc_rd_c2_scanin = ff_used_and_alloc_c2_scanout;
assign ff_used_alloc_c3_scanin   = ff_used_and_alloc_rd_c2_scanout;
assign ff_used_alloc_c4_scanin   = ff_used_alloc_c3_scanout ;
assign ff_used_alloc_wr_c5_scanin = ff_used_alloc_c4_scanout ;
assign ff_used_alloc_wr_c52_scanin = ff_used_alloc_wr_c5_scanout;
assign scan_out                  = ff_used_alloc_wr_c52_scanout;
// fixscan end:
endmodule 



//
//   nor macro for ports = 2,3
//
//





module l2t_usaloc_dp_nor_macro__dnor_16x__width_1 (
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
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_usaloc_dp_cmp_macro__width_8 (
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
//   nor macro for ports = 2,3
//
//





module l2t_usaloc_dp_nor_macro__ports_3__width_1 (
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





//
//   buff macro
//
//





module l2t_usaloc_dp_buff_macro__dbuff_48x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2t_usaloc_dp_nand_macro__width_1 (
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





module l2t_usaloc_dp_inv_macro__width_1 (
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





module l2t_usaloc_dp_nand_macro__width_6 (
  din0, 
  din1, 
  dout);
  input [5:0] din0;
  input [5:0] din1;
  output [5:0] dout;






nand2 #(6)  d0_0 (
.in0(din0[5:0]),
.in1(din1[5:0]),
.out(dout[5:0])
);









endmodule





//
//   invert macro
//
//





module l2t_usaloc_dp_inv_macro__dinv_48x__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






inv #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);









endmodule





//
//   invert macro
//
//





module l2t_usaloc_dp_inv_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






inv #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);









endmodule





//
//   invert macro
//
//





module l2t_usaloc_dp_inv_macro__dinv_16x__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






inv #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2t_usaloc_dp_nor_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






nor2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2t_usaloc_dp_nand_macro__ports_3__width_16 (
  din0, 
  din1, 
  din2, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  input [15:0] din2;
  output [15:0] dout;






nand3 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.in2(din2[15:0]),
.out(dout[15:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2t_usaloc_dp_nand_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






nand2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module l2t_usaloc_dp_or_macro__width_1 (
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
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_usaloc_dp_cmp_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_16r__width_16 (
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

  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  input [15:0] din2;
  input sel2;
  output [15:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(16)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
  .in2(din2[15:0]),
.dout(dout[15:0])
);









  



endmodule


//
//   invert macro
//
//





module l2t_usaloc_dp_inv_macro__dinv_32x__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






inv #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2t_usaloc_dp_nand_macro__dnand_16x__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






nand2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);









endmodule




//
//   xor macro for ports = 2,3
//
//





module l2t_usaloc_dp_xor_macro__dxor_8x__ports_3__width_1 (
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





module l2t_usaloc_dp_xor_macro__dxor_8x__ports_2__width_1 (
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





module l2t_usaloc_dp_inv_macro__dinv_32x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2t_usaloc_dp_msff_macro__dmsff_32x__stack_39r__width_39 (
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
//   xor macro for ports = 2,3
//
//





module l2t_usaloc_dp_xor_macro__dxor_16x__ports_3__width_1 (
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





module l2t_usaloc_dp_xor_macro__dxor_16x__ports_2__width_1 (
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
//   nand macro for ports = 2,3,4
//
//





module l2t_usaloc_dp_nand_macro__ports_3__width_1 (
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





module l2t_usaloc_dp_nor_macro__ports_2__width_1 (
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





module l2t_usaloc_dp_xor_macro__width_32 (
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









// any PARAMS parms go into naming of macro

module l2t_usaloc_dp_msff_macro__dmsff_32x__stack_33r__width_33 (
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
wire [31:0] so;

  input [32:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [32:0] dout;


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
dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);




















endmodule









//
//   buff macro
//
//





module l2t_usaloc_dp_buff_macro__dbuff_48x__width_32 (
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

module l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_39r__width_39 (
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


//
//   buff macro
//
//





module l2t_usaloc_dp_buff_macro__dbuff_48x__width_39 (
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

module l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32r__width_32 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_usaloc_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_16r__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  output [15:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(16)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
.dout(dout[15:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_usaloc_dp_buff_macro__minbuff_1__stack_33r__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule









// any PARAMS parms go into naming of macro

module l2t_usaloc_dp_msffi_macro__dmsffi_32x__stack_33r__width_33 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [31:0] so;

  input [32:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [32:0] dout_l;


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
msffi_dp #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q_l(dout_l[32:0])
);



















endmodule









//
//   invert macro
//
//





module l2t_usaloc_dp_inv_macro__dinv_16x__width_1 (
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





module l2t_usaloc_dp_and_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






and2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2t_usaloc_dp_msff_macro__stack_39r__width_39 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_usaloc_dp_mux_macro__dmux_16x__mux_pgnpe__ports_6__stack_32r__width_32 (
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
  din5, 
  sel5, 
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  input [31:0] din2;
  input sel2;
  input [31:0] din3;
  input sel3;
  input [31:0] din4;
  input sel4;
  input [31:0] din5;
  input sel5;
  input muxtst;
  output [31:0] dout;





cl_dp1_muxbuff6_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5)
);
mux6 #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
  .in5(din5[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule

