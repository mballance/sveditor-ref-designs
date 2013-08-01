// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_vlddir_dp.v
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
module l2t_vlddir_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  tcu_muxtest, 
  scan_out, 
  vuaddp_lru_way_c3, 
  vuaddp_fill_way_c3, 
  vuadpm_bistordiag_vd_data, 
  tag_hit_way_vld_c3, 
  arb_vuad_ce_err_c3, 
  vuaddp_vuad_evict_c3, 
  vuaddp_wr64_inst_c3, 
  vuaddp_st_to_data_array_c3, 
  vuaddp_vuad_sel_c2, 
  vuaddp_vuad_sel_c4, 
  vuaddp_vuad_sel_rd, 
  vuaddp_vuad_sel_c2_d1, 
  vuaddp_bistordiag_wr_vd_c4, 
  vuaddp_sel_vd_wr_data_byp, 
  vuad_array_rd_data_c1, 
  vlddir_vuad_array_wr_data_c4, 
  vlddir_dirty_evict_c3, 
  vlddir_vuad_valid_c2, 
  vlddir_diag_rd_vd_out, 
  vlddir_vd_ue_c2, 
  vlddir_vd_ce_c2, 
  vlddir_vd_synd_c2, 
  mux_valid_dirty_c1_sel0, 
  mux_valid_dirty_c1_sel1, 
  mux_valid_dirty_c1_sel2);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire muxtst;
wire vuaddp_vuad_sel_rd_c2_n;
wire vuaddp_vuad_sel_rd_c2;
wire ff_valid_clone_c2_scanin;
wire ff_valid_clone_c2_scanout;
wire ff_valid_dirty_c2_scanin;
wire ff_valid_dirty_c2_scanout;
wire vd_ecc_sync_zero;
wire vlddir_vd_ue_c2_unbuff;
wire vlddir_vd_ce_c2_n;
wire [5:0] vlddir_vd_synd_c2_n;
wire vuaddp_sel_vd_wr_data_byp_n;
wire vuaddp_vuad_sel_c2_n;
wire ff_valid_dirty_rd_c2_scanin;
wire ff_valid_dirty_rd_c2_scanout;
wire vuaddp_vuad_sel_c2_d1_n;
wire ff_valid_dirty_c3_scanin;
wire ff_valid_dirty_c3_scanout;
wire [15:0] valid_fill_way_c3;
wire [15:0] tag_hit_way_vld_c3_n;
wire [15:0] vuaddp_hit_wayvld_c3;
wire [15:0] vuaddp_lru_hit_way_c3;
wire [15:0] vuaddp_lru_hit_way_c3_n;
wire [15:0] dirty_byp_c3_in_1;
wire [15:0] dirty_byp_c3_in_2;
wire [15:0] vuaddp_lru_and_dirty_c3;
wire vlddir_dirty_evict_c3_1_n;
wire vuaddp_vuad_evict_c3_n;
wire ff_valid_dirty_c4_scanin;
wire ff_valid_dirty_c4_scanout;
wire vuaddp_bistordiag_wr_vd_c4_n;
wire vuaddp_vuad_sel_c4_n;
wire ff_ecc_valid_dirty_wr_c5_scanin;
wire ff_ecc_valid_dirty_wr_c5_scanout;
wire ff_ecc_valid_dirty_wr_c52_scanin;
wire ff_ecc_valid_dirty_wr_c52_scanout;
 



input           l2clk; 
input 		scan_in;
input 		tcu_pce_ov;
input 		tcu_aclk;
input 		tcu_bclk;
input 		tcu_scan_en;
input 		tcu_clk_stop;
input 		tcu_muxtest;
 
output scan_out; 
 
// 100+ pins on the right. 
input	[15:0]	vuaddp_lru_way_c3; // Left 
input	[15:0]	vuaddp_fill_way_c3; // Left 
input	[38:0]	vuadpm_bistordiag_vd_data; // Left // This should be C4 data. // BS and SR VUAD ECC Change 8/9/04

//input   [15:0]  vuaddp_hit_wayvld_c3; // Right

input   [15:0]  tag_hit_way_vld_c3; // Right
input   arb_vuad_ce_err_c3; // Right
// Left 
input		vuaddp_vuad_evict_c3;	 
input		vuaddp_wr64_inst_c3; 
input		vuaddp_st_to_data_array_c3; 
 
input		vuaddp_vuad_sel_c2; 
input		vuaddp_vuad_sel_c4;  
input		vuaddp_vuad_sel_rd; 
input		vuaddp_vuad_sel_c2_d1; 
 
input		vuaddp_bistordiag_wr_vd_c4; 
input		vuaddp_sel_vd_wr_data_byp; // should be a C6-c2 bypass 
 
// Bottom 
input   [38:0]  vuad_array_rd_data_c1 ;  
 
output	[38:0]	vlddir_vuad_array_wr_data_c4;  // Bottom 
 
output		vlddir_dirty_evict_c3; // TOP 
output	[15:0]	vlddir_vuad_valid_c2; // Top  
 
output	[38:0]	vlddir_diag_rd_vd_out ; // Left 

output           vlddir_vd_ue_c2;
output  [1:0]         vlddir_vd_ce_c2;
output  [5:0]    vlddir_vd_synd_c2;

input	mux_valid_dirty_c1_sel0;
input	mux_valid_dirty_c1_sel1;
input	mux_valid_dirty_c1_sel2;

 
assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign muxtst = tcu_muxtest;

wire    [7:0]   first_level_out;
wire    [3:0]   second_level_out;
wire    [1:0]   third_level_out;
  
wire	[15:0]	valid_rd_byp_c2; 
wire    [15:0]  valid_rd_c2; 
wire    [15:0]  valid_byp_c1; 
wire    [15:0]  valid_byp_c3_in; 
wire    [15:0]  valid_byp_c3_in_buf; 
wire    [15:0]  valid_c1; 
wire    [15:0]  valid_c2; 
wire    [15:0]  valid_corr_c2;  // BS and SR VUAD ECC Change 8/9/04
wire    [15:0]  valid_fnl_c2;  // BS and SR VUAD ECC Change 8/9/04
wire    [15:0]  valid_c3; 
wire    [15:0]  valid_c4; 
wire    [15:0]  valid_wr_data_c5; 
wire    [15:0]  valid_wr_data_c52; // BS 03/11/04 extra cycle for mem access 
 
 
wire    [15:0]  dirty_byp_c2_in; 
wire    [15:0]  dirty_rd_byp_c2; 
wire    [15:0]  dirty_rd_c2; 
wire    [15:0]  dirty_byp_c1; 
wire    [15:0]  dirty_byp_c3_in; 
wire    [15:0]  dirty_byp_c3_in_buf; 
wire    [15:0]  dirty_c1; 
wire    [15:0]  dirty_c2; 
wire    [15:0]  dirty_corr_c2;
wire    [15:0]  dirty_fnl_c2;
wire    [15:0]  dirty_c3; 
wire    [15:0]  dirty_c4; 
wire    [15:0]  dirty_wr_data_c5; 
wire    [15:0]  dirty_wr_data_c52; // BS 03/11/04 extra cycle for mem access 
 
 
wire	[15:0]	valid_byp_c2c3; 
wire	[15:0]	valid_byp_c4c5; 
wire	[15:0]	dirty_byp_c2c3; 
wire	[15:0]	dirty_byp_c4c5; 
 
// BS and SR VUAD ECC Change 8/9/04

wire	[6:0]	vd_ecc_wr_data_c3;
wire	[6:0]	vd_ecc_wr_data_c4;
wire	[6:0]	vd_ecc_wr_data_c5;
wire	[6:0]	vd_ecc_wr_data_c52;
wire	[6:0]	vd_ecc_rd_data_c2;
wire    [6:0]   vd_ecc_c2;
wire    [6:0]   vd_ecc_synd;
 
 
//////////////////////////////////////////////////////////////////////////////// 
// VALID BIT ( Use leftmost 16 dp pitches for the valid bit) 
// DIRTY bit ( use the right 16 dp pitches ) 
//////////////////////////////////////////////////////////////////////////////// 
 
 
// Row 17 
// Use a 2-1 mux flop here to reduce setup 
//inv_macro vuaddp_vuad_sel_rd_inv_slice (width=1,dinv=16x)
//        (
//        .dout   (vuaddp_vuad_sel_rd_n ),
//        .din    (vuaddp_vuad_sel_rd )
//        );

l2t_vlddir_dp_inv_macro__dinv_16x__width_1 vuaddp_vuad_sel_rd_inv_c2_slice 
        (
        .dout   (vuaddp_vuad_sel_rd_c2_n ),
        .din    (vuaddp_vuad_sel_rd_c2 )
        );
//
//mux_macro mux_valid_dirty_c1 (width=32,ports=2,mux=aonpe,stack=32r,dmux=8x)
//        (
//	.dout ({valid_c1[15:0],dirty_c1[15:0]}), 
//        .din0  ({vuad_array_rd_data_c1[31:16],vuad_array_rd_data_c1[15:0]}),   
//        .din1  ({valid_byp_c1[15:0],dirty_byp_c1[15:0]}),  
//	.sel0 (vuaddp_vuad_sel_rd), 
//	.sel1 (vuaddp_vuad_sel_rd_n) 
//        ); 
//

//assign valid_c1[15:0] = vuaddp_vuad_sel_rd ? vuad_array_rd_data_c1[31:16] : valid_byp_c1[15:0];
//assign dirty_c1[15:0] = vuaddp_vuad_sel_rd ? vuad_array_rd_data_c1[15:0] : dirty_byp_c1[15:0];
//assign  valid_byp_c1[15:0] = vuaddp_vuad_sel_c2orc3 ? valid_byp_c2c3[15:0] : valid_byp_c4c5[15:0];
//assign  dirty_byp_c1[15:0] = vuaddp_vuad_sel_c2orc3 ? dirty_byp_c2c3[15:0] : dirty_byp_c4c5[15:0];

//assign mux_valid_dirty_c1_sel0 =  vuaddp_vuad_sel_rd;
//assign mux_valid_dirty_c1_sel1 = ~vuaddp_vuad_sel_rd & vuaddp_vuad_sel_c2orc3;
//assign mux_valid_dirty_c1_sel2 = ~vuaddp_vuad_sel_rd & ~vuaddp_vuad_sel_c2orc3;


l2t_vlddir_dp_mux_macro__dmux_32x__mux_pgnpe__stack_32r__width_32 mux_valid_dirty_c1 
	(
	.dout({valid_c1[15:0],dirty_c1[15:0]}),
	.din0({vuad_array_rd_data_c1[31:16],vuad_array_rd_data_c1[15:0]}),
        .din1({valid_byp_c2c3[15:0],dirty_byp_c2c3[15:0]}),
        .din2({valid_byp_c4c5[15:0],dirty_byp_c4c5[15:0]}),
	.sel0(mux_valid_dirty_c1_sel0 ),
	.sel1(mux_valid_dirty_c1_sel1 ),
	.sel2(mux_valid_dirty_c1_sel2 ),
  .muxtst(muxtst)
	);


//mux_macro mux_valid_dirty_byp_c1 (width=32,ports=2,mux=aonpe,stack=32r,dmux=8x)
//        (
//        .dout   ({valid_byp_c1[15:0],dirty_byp_c1[15:0]}),
//        .din0   ({valid_byp_c2c3[15:0],dirty_byp_c2c3[15:0]}),
//        .din1   ({valid_byp_c4c5[15:0],dirty_byp_c4c5[15:0]}),
//        .sel0   (vuaddp_vuad_sel_c2orc3),
//        .sel1   (vuaddp_vuad_sel_c2orc3_n)
//        );
//


l2t_vlddir_dp_msff_macro__dmsff_32x__stack_16r__width_16 ff_valid_clone_c2 
         (
        .scan_in(ff_valid_clone_c2_scanin),
        .scan_out(ff_valid_clone_c2_scanout),
        .dout(vlddir_vuad_valid_c2[15:0]),
        .din(valid_c1[15:0]),
        .clk(l2clk),
        .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ;

l2t_vlddir_dp_msff_macro__dmsff_32x__stack_39r__width_39 ff_valid_dirty_c2 
         (
	.scan_in(ff_valid_dirty_c2_scanin),
	.scan_out(ff_valid_dirty_c2_scanout),
	.dout({vd_ecc_c2[6:0],valid_c2[15:0],dirty_c2[15:0]}), 
	.din({vuad_array_rd_data_c1[38:32],valid_c1[15:0],dirty_c1[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 


l2t_ecc39_dp vd_ecc_corr // BS and SR VUAD ECC Change 8/9/04
  	(
 	.dout   ({valid_corr_c2[15:0],dirty_corr_c2[15:0]}),
 	.cflag  (vd_ecc_synd[5:0]),
 	.pflag  (vd_ecc_synd[6]),
 	.din    ({valid_c2[15:0],dirty_c2[15:0]}),
 	.parity (vd_ecc_c2[6:0])
	);

// assign vlddir_vd_ue_c2 = ((|(vd_ecc_synd[5:0])) & ~vd_ecc_synd[6]) & vuaddp_vuad_sel_rd_c2 ; 

l2t_vlddir_dp_cmp_macro__width_8 cmp_vd_ecc_synd_nonzero 
        (
        .dout   (vd_ecc_sync_zero),
        .din0   ({2'b0,vd_ecc_synd[5:0]}),
        .din1   ({8'b0})
        );

l2t_vlddir_dp_nor_macro__ports_3__width_1 nor_vlddir_vd_ue_c2 
        (
        .dout   (vlddir_vd_ue_c2_unbuff),
        .din0   (vd_ecc_synd[6]),
        .din1   (vuaddp_vuad_sel_rd_c2_n),
        .din2   (vd_ecc_sync_zero)
        );

l2t_vlddir_dp_buff_macro__dbuff_48x__width_1 buff_vlddir_vd_ue_c2  
        (
        .dout   (vlddir_vd_ue_c2),
        .din    (vlddir_vd_ue_c2_unbuff)
        );

// assign vlddir_vd_ce_c2 = (vd_ecc_synd[6] & (vuaddp_vuad_sel_rd_c2 )) ; 
l2t_vlddir_dp_nand_macro__width_1 nand_vlddir_ua_ce_c2 
        (
        .dout   (vlddir_vd_ce_c2_n),
        .din0   (vd_ecc_synd[6]),
        .din1   (vuaddp_vuad_sel_rd_c2)
        );

l2t_vlddir_dp_inv_macro__dinv_32x__width_2 inv_usaloc_ua_ce_c2 
        (
        .dout   ({vlddir_vd_ce_c2[0],vlddir_vd_ce_c2[1]}),
        .din    ({vlddir_vd_ce_c2_n,vlddir_vd_ce_c2_n})
        );

// assign vlddir_vd_synd_c2 = (vd_ecc_synd[5:0] & {6{(vuaddp_vuad_sel_rd_c2 )}}) ; 

l2t_vlddir_dp_nand_macro__width_6 nand_vlddir_vd_synd_c2_n  
        (
        .dout   (vlddir_vd_synd_c2_n[5:0]),
        .din0   (vd_ecc_synd[5:0]),
        .din1   ({6{vuaddp_vuad_sel_rd_c2}})
        );

l2t_vlddir_dp_inv_macro__dinv_48x__width_6  inv_vlddir_vd_synd_c2  
        (
        .dout   (vlddir_vd_synd_c2[5:0]),
        .din    (vlddir_vd_synd_c2_n[5:0])
        );

l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32r__width_32 mux_fnl_valid_dirty_c2 
              (.dout({valid_fnl_c2[15:0],dirty_fnl_c2[15:0]}),
               .din0  ({valid_corr_c2[15:0],dirty_corr_c2[15:0]}),
               .din1  ({valid_c2[15:0],dirty_c2[15:0]}),
               .sel0  (vuaddp_vuad_sel_rd_c2),
               .sel1  (vuaddp_vuad_sel_rd_c2_n)
              );

//assign  vlddir_vuad_valid_c2 = valid_c2 ; // Top Drive using a 40X driver.

//buff_macro buff_vlddir_vuad_valid_c2 (width=16,dbuff=48x)
//	(
//	.dout	(vlddir_vuad_valid_c2[15:0]),
//	.din	(valid_c2[15:0])
//	);

l2t_vlddir_dp_inv_macro__dinv_16x__width_1 vuaddp_sel_vd_wr_data_byp_inv_slice 
        (
        .dout   (vuaddp_sel_vd_wr_data_byp_n ),
        .din    (vuaddp_sel_vd_wr_data_byp )
        );
l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_39r__width_39 mux_valid_dirty_rd_c2 
        (
        .dout ({vd_ecc_rd_data_c2[6:0],valid_rd_c2[15:0],dirty_rd_c2[15:0]}),
        .din0  ({vd_ecc_wr_data_c52[6:0],valid_wr_data_c52[15:0],dirty_wr_data_c52[15:0]}),
        .din1  ({vd_ecc_c2[6:0],valid_rd_byp_c2[15:0],dirty_rd_byp_c2[15:0]}),
        .sel0 (vuaddp_sel_vd_wr_data_byp),
        .sel1 (vuaddp_sel_vd_wr_data_byp_n)
        ) ;

l2t_vlddir_dp_inv_macro__dinv_16x__width_1 vuaddp_vuad_sel_c2_inv_slice 
        (
        .dout   (vuaddp_vuad_sel_c2_n ),
        .din    (vuaddp_vuad_sel_c2 )
        );
 
// Row 16, vuad rd data c2 flop 
l2t_vlddir_dp_msff_macro__stack_33r__width_33 ff_valid_dirty_rd_c2 
        (
	.scan_in(ff_valid_dirty_rd_c2_scanin),
	.scan_out(ff_valid_dirty_rd_c2_scanout),
	.dout({vuaddp_vuad_sel_rd_c2,valid_rd_byp_c2[15:0],dirty_rd_byp_c2[15:0]}), 
        .din({vuaddp_vuad_sel_rd,vuad_array_rd_data_c1[31:16],vuad_array_rd_data_c1[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ); 
 
 
// Combinational row. Use a 20x Buffer 
// assign	vlddir_diag_rd_vd_out[38:32] = vd_ecc_rd_data_c2[6:0]; 
// assign	vlddir_diag_rd_vd_out[31:16] = valid_rd_c2[15:0]; 
// assign	vlddir_diag_rd_vd_out[15:0]  = dirty_rd_c2[15:0]; 
 

l2t_vlddir_dp_buff_macro__dbuff_48x__width_39 buff_vlddir_diag_rd_vd_out 
	(
	.dout	(vlddir_diag_rd_vd_out[38:0]),
	.din	({vd_ecc_rd_data_c2[6:0],valid_rd_c2[15:0],dirty_rd_c2[15:0]})
	);
 
// Row 12 
l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32r__width_32 mux_valid_dirty_byp_c2c3 
        (
	.dout 	({valid_byp_c2c3[15:0],dirty_byp_c2c3[15:0]}), 
        .din0  	({valid_fnl_c2[15:0],dirty_fnl_c2[15:0]}),         
        .din1  	({valid_byp_c3_in[15:0],dirty_byp_c3_in[15:0]}),  
	.sel0 	(vuaddp_vuad_sel_c2), 
	.sel1 	(vuaddp_vuad_sel_c2_n) 
        ); 
 
 
//// final bypass mux can be here. 
//inv_macro vuaddp_vuad_sel_c2orc3_inv_slice (width=1,dinv=16x)
//        (
//        .dout   (vuaddp_vuad_sel_c2orc3_n ),
//        .din    (vuaddp_vuad_sel_c2orc3 )
//        );
//// ROw11 
//mux_macro mux_valid_dirty_byp_c1 (width=32,ports=2,mux=aonpe,stack=32r,dmux=8x)
//        (
//	.dout 	({valid_byp_c1[15:0],dirty_byp_c1[15:0]}), 
//        .din0  	({valid_byp_c2c3[15:0],dirty_byp_c2c3[15:0]}),  
//        .din1  	({valid_byp_c4c5[15:0],dirty_byp_c4c5[15:0]}),  
//	.sel0 	(vuaddp_vuad_sel_c2orc3), 
//	.sel1 	(vuaddp_vuad_sel_c2orc3_n) 
//        ); 
// 
// Row 9 
 
// Use a 2-1 mux flop here to reduce setup and area 
l2t_vlddir_dp_inv_macro__dinv_16x__width_1 vuaddp_vuad_sel_c2_d1_inv_slice  
	( 
	.dout	(vuaddp_vuad_sel_c2_d1_n ), 
	.din	(vuaddp_vuad_sel_c2_d1 ) 
	);

l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_16r__width_16 mux_valid_dirty_byp_c2_in 
        (
	.dout  (dirty_byp_c2_in[15:0]), 
        .din0  (dirty_fnl_c2[15:0]),         
        .din1  (dirty_byp_c3_in[15:0]),  
	.sel0 (vuaddp_vuad_sel_c2_d1_n), 
	.sel1 (vuaddp_vuad_sel_c2_d1) 
        ); 
 
l2t_vlddir_dp_msff_macro__stack_32r__width_32 ff_valid_dirty_c3 
         (
	.scan_in(ff_valid_dirty_c3_scanin),
	.scan_out(ff_valid_dirty_c3_scanout),
	.dout({valid_c3[15:0],dirty_c3[15:0]}), 
	.din({valid_fnl_c2[15:0],dirty_byp_c2_in[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
         ); 
 

//////////////////////////////////////////////////////////////////
//assign  valid_byp_c3_in  =  (valid_c3 |  vuaddp_fill_way_c3) &  
//              ~( ({16{vuaddp_vuad_evict_c3}} & vuaddp_lru_way_c3) |  
//                 ({16{vuaddp_wr64_inst_c3}} & vuaddp_hit_wayvld_c3)  );  
//
//
//
l2t_vlddir_dp_or_macro__width_16  nand_valid_fill_way_c3 
	(
	.dout	(valid_fill_way_c3[15:0]),
	.din0	(valid_c3[15:0]),
	.din1	(vuaddp_fill_way_c3[15:0])
	);

////////  Timing fix bypassed vuad ctl ///////////////
//inv_macro inv_arb_vuad_ce_err_c3 (width=1,dinv=16x)
//        (
//        .dout   (arb_vuad_ce_err_c3_n),
//        .din    (arb_vuad_ce_err_c3)
//        );
//
//
l2t_vlddir_dp_inv_macro__dinv_16x__width_16 inv_tag_hit_way_vld_c3 
        (
        .dout   (tag_hit_way_vld_c3_n[15:0]),
        .din    (tag_hit_way_vld_c3[15:0])
        );
l2t_vlddir_dp_nor_macro__width_16 nor_vuaddp_hit_wayvld_c3 
        (
        .dout   (vuaddp_hit_wayvld_c3[15:0]),
        .din0   (tag_hit_way_vld_c3_n[15:0]),
        .din1   ({16{arb_vuad_ce_err_c3}})
        );
////////  Timing fix bypassed vuad ctl ///////////////


l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_16 mux_lru_hit_way 	
	(
	.dout	(vuaddp_lru_hit_way_c3[15:0]),
	.din0	(vuaddp_lru_way_c3[15:0]),
	.din1	(vuaddp_hit_wayvld_c3[15:0]),
	.sel0	(vuaddp_vuad_evict_c3),
	.sel1	(vuaddp_wr64_inst_c3)
	);

l2t_vlddir_dp_inv_macro__dinv_8x__width_16  inv_lru_hit_way_c3	
	(
	.dout	(vuaddp_lru_hit_way_c3_n[15:0]),
	.din	(vuaddp_lru_hit_way_c3[15:0])
	);

l2t_vlddir_dp_and_macro__width_16   nor_valid_byp_c3_in  
	(
	.dout	(valid_byp_c3_in[15:0]),
	.din0	(vuaddp_lru_hit_way_c3_n[15:0]),
	.din1	(valid_fill_way_c3[15:0])
	); 

//////////////////////////////////////////////////////////////////
//// Row8 
//assign  dirty_byp_c3_in = ( dirty_c3 | ({16{vuaddp_st_to_data_array_c3}} & vuaddp_hit_wayvld_c3) )  
//					& 
//	~( ({16{vuaddp_vuad_evict_c3}} & vuaddp_lru_way_c3) |  
//		({16{vuaddp_wr64_inst_c3}} & vuaddp_hit_wayvld_c3)  );  
///////////////////////////////////////////////////////////////////////////////



l2t_vlddir_dp_and_macro__width_16 nand_dirty_byp_c3_in_1 
	(
	.dout	(dirty_byp_c3_in_1[15:0]),
	.din0	({16{vuaddp_st_to_data_array_c3}}),
	.din1	(vuaddp_hit_wayvld_c3[15:0])
	);

l2t_vlddir_dp_or_macro__width_16 nand_dirty_byp_c3_in  
	(
	.dout	(dirty_byp_c3_in_2[15:0]),
	.din0	(dirty_byp_c3_in_1[15:0]),
	.din1	(dirty_c3[15:0])
	);

l2t_vlddir_dp_and_macro__width_16  and_dirty_byp_c3_in_2 
	(
	.dout	(dirty_byp_c3_in[15:0]),
	.din0	(dirty_byp_c3_in_2[15:0]),
	.din1	(vuaddp_lru_hit_way_c3_n[15:0])
	);


//////////////////////////////////////////////////////////////////
// assign  vlddir_dirty_evict_c3  = vuaddp_vuad_evict_c3 & |(vuaddp_lru_way_c3 & dirty_c3) ;// Top 

l2t_vlddir_dp_and_macro__width_16 and_valid_dirty_c3 
	(
	.dout	(vuaddp_lru_and_dirty_c3[15:0]),
	.din0	(vuaddp_lru_way_c3[15:0]),
	.din1	(dirty_c3[15:0])
	);

l2t_vlddir_dp_cmp_macro__width_16 cmp_and_valid_dirty_c3 
        (
        .dout   (vlddir_dirty_evict_c3_1_n),
        .din0   (vuaddp_lru_and_dirty_c3[15:0]),
        .din1   (16'h0000)
        );

l2t_vlddir_dp_inv_macro__width_1 inv_vuaddp_vuad_evict_c3 
	(
	.dout	(vuaddp_vuad_evict_c3_n),
	.din	(vuaddp_vuad_evict_c3)
	);

l2t_vlddir_dp_nor_macro__width_1 nor_vlddir_dirty_evict_c3 
	(
	.dout	(vlddir_dirty_evict_c3),
	.din0	(vuaddp_vuad_evict_c3_n),
	.din1	(vlddir_dirty_evict_c3_1_n)
	);

//////////////////////////////////////////////////////////////////
l2t_pgen32b_dp  vd_ecc_gen
        (
        .parity (vd_ecc_wr_data_c3[6:0]),
        .dout   ({valid_byp_c3_in_buf[15:0],dirty_byp_c3_in_buf[15:0]}),
        .din    ({valid_byp_c3_in[15:0],dirty_byp_c3_in[15:0]})
        );

// Row 5, vuad C4 flop 
l2t_vlddir_dp_msff_macro__stack_39r__width_39 ff_valid_dirty_c4 
        (
	.scan_in(ff_valid_dirty_c4_scanin),
	.scan_out(ff_valid_dirty_c4_scanout),
	.dout({vd_ecc_wr_data_c4[6:0],valid_c4[15:0],dirty_c4[15:0]}), 
        .din({vd_ecc_wr_data_c3[6:0],valid_byp_c3_in_buf[15:0],dirty_byp_c3_in_buf[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
       ) ; 


l2t_vlddir_dp_inv_macro__dinv_16x__width_1 vuaddp_bistordiag_wr_vd_c4_inv_slice 
        (
        .dout   (vuaddp_bistordiag_wr_vd_c4_n ),
        .din    (vuaddp_bistordiag_wr_vd_c4 )
        );

l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_39r__width_39 mux_wr_array_valid_dirty_c4 
         (
        .dout (vlddir_vuad_array_wr_data_c4[38:0]),
        .din0 ({vd_ecc_wr_data_c4[6:0],valid_c4[15:0],dirty_c4[15:0]}),
        .din1 (vuadpm_bistordiag_vd_data[38:0]),
        .sel0 (vuaddp_bistordiag_wr_vd_c4_n),
        .sel1 (vuaddp_bistordiag_wr_vd_c4)
        ) ;

l2t_vlddir_dp_inv_macro__dinv_16x__width_1 vuaddp_vuad_sel_c4_inv_slice  
        ( 
        .dout   (vuaddp_vuad_sel_c4_n ), 
        .din    (vuaddp_vuad_sel_c4 ) 
        );


l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32r__width_32 mux_valid_dirty_byp_c4c5 
        (
	.dout ({valid_byp_c4c5[15:0],dirty_byp_c4c5[15:0]}), 
        .din0  ({valid_c4[15:0],dirty_c4[15:0]}),         
        .din1  ({valid_wr_data_c5[15:0],dirty_wr_data_c5[15:0]}), 
	.sel0 (vuaddp_vuad_sel_c4), 
	.sel1 (vuaddp_vuad_sel_c4_n) 
        ) ; 
 
// Row 2, Vuad C5 flop 
l2t_vlddir_dp_msff_macro__stack_39r__width_39 ff_ecc_valid_dirty_wr_c5 
       (
	.scan_in(ff_ecc_valid_dirty_wr_c5_scanin),
	.scan_out(ff_ecc_valid_dirty_wr_c5_scanout),
	.dout({vd_ecc_wr_data_c5[6:0],valid_wr_data_c5[15:0],dirty_wr_data_c5[15:0]}), 
        .din({vd_ecc_wr_data_c4[6:0],valid_c4[15:0],dirty_c4[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
       ); 
 
//Row 1, Vuad C6 flop 
l2t_vlddir_dp_msff_macro__stack_39r__width_39 ff_ecc_valid_dirty_wr_c52  // BS 03/11/04 extra cycle for mem access
        (
	.scan_in(ff_ecc_valid_dirty_wr_c52_scanin),
	.scan_out(ff_ecc_valid_dirty_wr_c52_scanout),
	.dout({vd_ecc_wr_data_c52[6:0],valid_wr_data_c52[15:0],dirty_wr_data_c52[15:0]}), 
        .din({vd_ecc_wr_data_c5[6:0],valid_wr_data_c5[15:0],dirty_wr_data_c5[15:0]}), 
        .clk(l2clk), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 
 
 
// fixscan start:
assign ff_valid_clone_c2_scanin  = scan_in                  ;
assign ff_valid_dirty_c2_scanin  = ff_valid_clone_c2_scanout;
assign ff_valid_dirty_rd_c2_scanin = ff_valid_dirty_c2_scanout;
assign ff_valid_dirty_c3_scanin  = ff_valid_dirty_rd_c2_scanout;
assign ff_valid_dirty_c4_scanin  = ff_valid_dirty_c3_scanout;
assign ff_ecc_valid_dirty_wr_c5_scanin = ff_valid_dirty_c4_scanout;
assign ff_ecc_valid_dirty_wr_c52_scanin = ff_ecc_valid_dirty_wr_c5_scanout;
assign scan_out                  = ff_ecc_valid_dirty_wr_c52_scanout;
// fixscan end:
endmodule 



//
//   invert macro
//
//





module l2t_vlddir_dp_inv_macro__dinv_16x__width_1 (
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

module l2t_vlddir_dp_mux_macro__dmux_32x__mux_pgnpe__stack_32r__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  input [31:0] din2;
  input sel2;
  input muxtst;
  output [31:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3 #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_vlddir_dp_msff_macro__dmsff_32x__stack_16r__width_16 (
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
wire [14:0] so;

  input [15:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [15:0] dout;


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
dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_vlddir_dp_msff_macro__dmsff_32x__stack_39r__width_39 (
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





module l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 (
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





module l2t_vlddir_dp_xor_macro__dxor_16x__ports_3__width_1 (
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





module l2t_vlddir_dp_xor_macro__dxor_16x__ports_2__width_1 (
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





module l2t_vlddir_dp_inv_macro__dinv_32x__width_1 (
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





module l2t_vlddir_dp_nand_macro__ports_3__width_1 (
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





module l2t_vlddir_dp_nor_macro__ports_2__width_1 (
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





module l2t_vlddir_dp_xor_macro__width_32 (
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





module l2t_vlddir_dp_cmp_macro__width_8 (
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





module l2t_vlddir_dp_nor_macro__ports_3__width_1 (
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





module l2t_vlddir_dp_buff_macro__dbuff_48x__width_1 (
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





module l2t_vlddir_dp_nand_macro__width_1 (
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





module l2t_vlddir_dp_inv_macro__dinv_32x__width_2 (
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
//   nand macro for ports = 2,3,4
//
//





module l2t_vlddir_dp_nand_macro__width_6 (
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





module l2t_vlddir_dp_inv_macro__dinv_48x__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






inv #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32r__width_32 (
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

module l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_39r__width_39 (
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

module l2t_vlddir_dp_msff_macro__stack_33r__width_33 (
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





module l2t_vlddir_dp_buff_macro__dbuff_48x__width_39 (
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

module l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_16r__width_16 (
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






// any PARAMS parms go into naming of macro

module l2t_vlddir_dp_msff_macro__stack_32r__width_32 (
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
//   or macro for ports = 2,3
//
//





module l2t_vlddir_dp_or_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






or2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);









endmodule





//
//   invert macro
//
//





module l2t_vlddir_dp_inv_macro__dinv_16x__width_16 (
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





module l2t_vlddir_dp_nor_macro__width_16 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_vlddir_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_16 (
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
//   invert macro
//
//





module l2t_vlddir_dp_inv_macro__dinv_8x__width_16 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_vlddir_dp_and_macro__width_16 (
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





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_vlddir_dp_cmp_macro__width_16 (
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





//
//   invert macro
//
//





module l2t_vlddir_dp_inv_macro__width_1 (
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





module l2t_vlddir_dp_nor_macro__width_1 (
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





module l2t_vlddir_dp_xor_macro__dxor_8x__ports_2__width_1 (
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

module l2t_vlddir_dp_msff_macro__stack_39r__width_39 (
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








