// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_vuad_ctl.v
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
module l2t_vuad_ctl (
  l2clk, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  scan_in, 
  scan_out, 
  rd_addr1, 
  rd_addr2, 
  rd_addr_sel, 
  wr_addr, 
  wr_en0, 
  wr_en1, 
  array_rd_en, 
  bist_vuad_idx_c3, 
  evctag_vuad_idx_c3, 
  bist_wr_vd_c3, 
  arb_decdp_wr64_inst_c2, 
  arb_acc_vd_c2, 
  arb_acc_ua_c2, 
  arbadr_idx_c1c2comp_c1_n, 
  arbadr_idx_c1c3comp_c1_n, 
  arbadr_idx_c1c4comp_c1_n, 
  arbadr_idx_c1c5comp_c1_n, 
  arb_decdp_inst_int_c1, 
  csr_l2_bypass_mode_on, 
  arb_inst_diag_c1, 
  bist_vuad_wr_en, 
  arb_inst_vld_c2, 
  arb_inst_l2vuad_vld_c3, 
  arb_decdp_st_inst_c3, 
  arbdec_arbdp_inst_fb_c2, 
  vuadpm_vd_ue_c4, 
  vuadpm_ua_ue_c4, 
  arbdec_arbdp_inst_way_c2, 
  arb_arbdp_vuadctl_pst_no_ctrue_c2, 
  arb_decdp_cas1_inst_c2, 
  arb_arbdp_pst_with_ctrue_c2, 
  arb_decdp_cas2_inst_c2, 
  arbdec_arbdp_inst_mb_c2, 
  arb_vuadctl_no_bypass_px2, 
  vuaddp_vuad_sel_c2, 
  vuaddp_vuad_sel_c2_d1, 
  vuaddp_vuad_sel_c4, 
  vuaddp_vuad_sel_rd, 
  vuaddp_vuad_tagd_sel_c2_d1, 
  vuaddp_wr64_inst_c3, 
  vuaddp_alloc_set_cond_c3, 
  vuaddp_alloc_rst_cond_c3, 
  vuaddp_vuad_error_c8, 
  vuaddp_fill_way_c3, 
  vuaddp_bistordiag_wr_vd_c4, 
  vuaddp_bistordiag_wr_ua_c4, 
  vuaddp_sel_ua_wr_data_byp, 
  vuaddp_sel_vd_wr_data_byp, 
  vuaddp_sel_diag0_data_wr_c3, 
  vuaddp_sel_diag1_data_wr_c3, 
  vuaddp_vuad_array_wr_en0_c4, 
  vuaddp_vuad_array_wr_en1_c4, 
  vuaddp_vuad_idx_c4, 
  vuad_rd_addr1_r0, 
  vuad_rd_addr2_r0, 
  vuad_rd_addr_sel_r0, 
  vuad_wr_addr_r0, 
  vuad_word_en_r0, 
  vuad_wr_en_r0c0, 
  vuad_wr_en_r0c1, 
  vuad_mux1_h_sel_r0, 
  vuad_mux1_l_sel_r0, 
  vuad_mux2_sel_r0, 
  vuad_rd_en_r0, 
  vuad_rd_addr1_r1, 
  vuad_rd_addr2_r1, 
  vuad_rd_addr_sel_r1, 
  vuad_wr_addr_r1, 
  vuad_word_en_r1, 
  vuad_wr_en_r1c0, 
  vuad_wr_en_r1c1, 
  vuad_rd_en_r1, 
  vuad_rd_addr1_r2, 
  vuad_rd_addr2_r2, 
  vuad_rd_addr_sel_r2, 
  vuad_wr_addr_r2, 
  vuad_word_en_r2, 
  vuad_wr_en_r2c0, 
  vuad_wr_en_r2c1, 
  vuad_mux1_h_sel_r2, 
  vuad_mux1_l_sel_r2, 
  vuad_mux2_sel_r2, 
  vuad_rd_en_r2, 
  vuad_rd_addr1_r3, 
  vuad_rd_addr2_r3, 
  vuad_rd_addr_sel_r3, 
  vuad_wr_addr_r3, 
  vuad_word_en_r3, 
  vuad_wr_en_r3c0, 
  vuad_wr_en_r3c1, 
  vuad_rd_en_r3, 
  vuad_mux_sel, 
  mbist_run, 
  vuad_usaloc_mux_used_and_alloc_comb_sel0, 
  vuad_usaloc_mux_used_and_alloc_comb_sel1, 
  vuad_usaloc_mux_used_and_alloc_comb_sel2, 
  vuad_usaloc_mux_used_and_alloc_comb_sel3, 
  vuad_usaloc_mux_used_and_alloc_comb_sel4, 
  vuad_usaloc_mux_used_and_alloc_comb_sel5, 
  mux_valid_dirty_c1_sel0, 
  mux_valid_dirty_c1_sel1, 
  mux_valid_dirty_c1_sel2);
wire [4:0] wr_addr_entry;
wire [3:0] wr_word_en;
wire [3:0] wr_en;
wire rd_addr_sel_n;
wire [1:0] addr1to0_px2;
wire ff_addr1to0_c1_scanin;
wire ff_addr1to0_c1_scanout;
wire l1clk;
wire [1:0] addr1to0_c1;
wire addr8_px2;
wire ff_addr8_c1_scanin;
wire ff_addr8_c1_scanout;
wire addr8_c1;
wire addr7_px2;
wire ff_addr7_c1_scanin;
wire ff_addr7_c1_scanout;
wire addr7_c1;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire spares_scanin;
wire spares_scanout;
wire ff_vuadctl_no_bypass_c1_scanin;
wire ff_vuadctl_no_bypass_c1_scanout;
wire vuaddp_vuad_sel_c2orc3;
wire vuaddp_vuad_sel_rd_c2;
wire vuadctl_no_bypass_c1_1;
wire ff_vuadctl_no_bypass_c1_1_scanin;
wire ff_vuadctl_no_bypass_c1_1_scanout;
wire ff_vuaddp_vuad_sel_c2_scanin;
wire ff_vuaddp_vuad_sel_c2_scanout;
wire ff_vuaddp_vuad_sel_c2_d1_scanin;
wire ff_vuaddp_vuad_sel_c2_d1_scanout;
wire ff_vuad_sel_wr_d1_scanin;
wire ff_vuad_sel_wr_d1_scanout;
wire vuad_sel_wr_d1;
wire ff_vuad_tagd_sel_c2_d1_scanin;
wire ff_vuad_tagd_sel_c2_d1_scanout;
wire ff_wr64_inst_c3_scanin;
wire ff_wr64_inst_c3_scanout;
wire ff_arb_acc_vd_c3_scanin;
wire ff_arb_acc_vd_c3_scanout;
wire ff_arb_acc_ua_c3_scanin;
wire ff_arb_acc_ua_c3_scanout;
wire ff_inst_vld_c3_scanin;
wire ff_inst_vld_c3_scanout;
wire ff_inst_vld_c4_scanin;
wire ff_inst_vld_c4_scanout;
wire ff_inst_vld_c5_scanin;
wire ff_inst_vld_c5_scanout;
wire ff_arb_inst_diag_c2_scanin;
wire ff_arb_inst_diag_c2_scanout;
wire ff_arb_inst_diag_c3_scanin;
wire ff_arb_inst_diag_c3_scanout;
wire ff_arb_inst_diag_c4_scanin;
wire ff_arb_inst_diag_c4_scanout;
wire mbist_run_r1;
wire ff_mux_idx_c4_scanin;
wire ff_mux_idx_c4_scanout;
wire ff_l2_bypass_mode_on_d1_scanin;
wire ff_l2_bypass_mode_on_d1_scanout;
wire ff_bistordiag_wr_vd_c4_scanin;
wire ff_bistordiag_wr_vd_c4_scanout;
wire ff_bistordiag_wr_ua_c4_scanin;
wire ff_bistordiag_wr_ua_c4_scanout;
wire ff_vuad_array_wr_en0_c4_scanin;
wire ff_vuad_array_wr_en0_c4_scanout;
wire ff_vuad_array_wr_en1_c4_scanin;
wire ff_vuad_array_wr_en1_c4_scanout;
wire ff_vuad_array_wr_en0_c5_scanin;
wire ff_vuad_array_wr_en0_c5_scanout;
wire ff_vuad_array_wr_en1_c5_scanin;
wire ff_vuad_array_wr_en1_c5_scanout;
wire ff_vuad_array_wr_en0_c52_scanin;
wire ff_vuad_array_wr_en0_c52_scanout;
wire ff_vuad_array_wr_en1_c52_scanin;
wire ff_vuad_array_wr_en1_c52_scanout;
wire ff_inst_int_c2_scanin;
wire ff_inst_int_c2_scanout;
wire ff_inst_int_c3_scanin;
wire ff_inst_int_c3_scanout;
wire ff_inst_int_c4_scanin;
wire ff_inst_int_c4_scanout;
wire ff_inst_int_c5_scanin;
wire ff_inst_int_c5_scanout;
wire ff_vuad_error_c5_scanin;
wire ff_vuad_error_c5_scanout;
wire ff_vuad_error_c52_scanin;
wire ff_vuad_error_c52_scanout;
wire ff_vuad_error_c6_scanin;
wire ff_vuad_error_c6_scanout;
wire ff_vuad_error_c7_scanin;
wire ff_vuad_error_c7_scanout;
wire ff_vuad_error_c8_scanin;
wire ff_vuad_error_c8_scanout;
wire ff_fill_way_c3_scanin;
wire ff_fill_way_c3_scanout;
wire ff_alloc_set_cond_c3_scanin;
wire ff_alloc_set_cond_c3_scanout;
wire ff_alloc_rst_cond_c3_scanin;
wire ff_alloc_rst_cond_c3_scanout;


input            l2clk; 
input  		 tcu_pce_ov;
input  		 tcu_aclk;
input  		 tcu_bclk;
input  		 tcu_scan_en;
// l2t_vuad_ctl
input		 tcu_clk_stop;
 
input	 	 scan_in; 
output 		 scan_out; 

//////////////////////////////////////////////////////////////
// l2t_vuad_ctl
//////////////////////////////////////////////////////////////
input	[8:0]	 rd_addr1;
input	[8:0]	 rd_addr2;
input		 rd_addr_sel;
input	[8:0]	 wr_addr;
input		 wr_en0;
input		 wr_en1;
input		 array_rd_en;
//

 
input	[8:0]	bist_vuad_idx_c3 ;
input	[8:0]	evctag_vuad_idx_c3;
input		bist_wr_vd_c3 ;
 
//input	[15:0]	tag_hit_way_vld_c3;
//input	[15:0]	tagdp_lru_way_sel_c3;
//input		tag_st_to_data_array_c3;
input		arb_decdp_wr64_inst_c2;
 
input		arb_acc_vd_c2;	// Top // diagnostic access only 
input		arb_acc_ua_c2;	// Top // diagnostic access only 
 
// C1 outputs 
input  arbadr_idx_c1c2comp_c1_n ; // from arbaddr Top 
input  arbadr_idx_c1c3comp_c1_n ; // from arbaddr Top 
input  arbadr_idx_c1c4comp_c1_n ; // from arbaddr Top 
input  arbadr_idx_c1c5comp_c1_n ; // from arbaddr. POST_3.0 Top 
 
input		arb_decdp_inst_int_c1;	// Top // int 5.0 changes
input		csr_l2_bypass_mode_on;	// Top 
input		arb_inst_diag_c1;	// Top 
input		bist_vuad_wr_en;	// Top // This is a C3 signal. 
input		arb_inst_vld_c2;	// Top 
input		arb_inst_l2vuad_vld_c3; // Top 
input		arb_decdp_st_inst_c3; // Top 
input		arbdec_arbdp_inst_fb_c2; // Top 
 
input		vuadpm_vd_ue_c4;
input		vuadpm_ua_ue_c4;
//input		arb_vuad_ce_err_c3;

input	[3:0]	arbdec_arbdp_inst_way_c2; 
 
input		arb_arbdp_vuadctl_pst_no_ctrue_c2; // Top 
input		arb_decdp_cas1_inst_c2; // Top 
input		arb_arbdp_pst_with_ctrue_c2; // Top 
input		arb_decdp_cas2_inst_c2; // Top 
input		arbdec_arbdp_inst_mb_c2; // Top 
 
input		arb_vuadctl_no_bypass_px2; // Top 
 
 
output		vuaddp_vuad_sel_c2;	// Bottom 
output		vuaddp_vuad_sel_c2_d1;	// Bottom 
output		vuaddp_vuad_sel_c4;	// Bottom 
output		vuaddp_vuad_sel_rd;	// Bottom 
output		vuaddp_vuad_tagd_sel_c2_d1;	// Top 
 
//output		vuaddp_st_to_data_array_c3;	// Bottom 
output		vuaddp_wr64_inst_c3	; // Bottom 
 
 
output		vuaddp_alloc_set_cond_c3; // Bottom 
output		vuaddp_alloc_rst_cond_c3; // Bottom 
 
output		vuaddp_vuad_error_c8; // Bottom 
 
//output	[15:0]	vuaddp_hit_wayvld_c3; // Bottom 
output	[15:0]	vuaddp_fill_way_c3; // Bottom 
//output	[15:0]	vuaddp_lru_way_c3; // Bottom 
 
output		vuaddp_bistordiag_wr_vd_c4   ; // Bottom // bist or diag access 
output		vuaddp_bistordiag_wr_ua_c4   ; // Bottom // bist or diag access 
 
output		vuaddp_sel_ua_wr_data_byp;	// Bottom 
output		vuaddp_sel_vd_wr_data_byp;	// Bottom 
 
output		vuaddp_sel_diag0_data_wr_c3; // Bottom  sel between diagnostic and bist data 
output		vuaddp_sel_diag1_data_wr_c3; // Bottom  sel between diagnostic and bist data 
 
output		vuaddp_vuad_array_wr_en0_c4; // Bottom // Change to C4 
output		vuaddp_vuad_array_wr_en1_c4; // Bottom // Change to C4 
 
output	[8:0]	vuaddp_vuad_idx_c4; // NEW PIN 

// from l2t_vuad_ctl
output	[4:0]	 vuad_rd_addr1_r0;
output	[4:0]	 vuad_rd_addr2_r0;
output		 vuad_rd_addr_sel_r0;
output	[4:0]	 vuad_wr_addr_r0; // address bits 6:2
output	[3:0]	 vuad_word_en_r0; // decoded address bits 1:0
output		 vuad_wr_en_r0c0; // decoded address bits 8:7
output		 vuad_wr_en_r0c1; // decoded address bits 8:7
output	[3:0]	vuad_mux1_h_sel_r0;
output	[3:0]	vuad_mux1_l_sel_r0;
output		vuad_mux2_sel_r0;  //int 5.0 change
output	vuad_rd_en_r0;

output	[4:0]	 vuad_rd_addr1_r1;
output	[4:0]	 vuad_rd_addr2_r1;
output		 vuad_rd_addr_sel_r1;
output	[4:0]	 vuad_wr_addr_r1; // address bits 6:2
output	[3:0]	 vuad_word_en_r1; // decoded address bits 1:0
output		 vuad_wr_en_r1c0; // decoded address bits 8:7
output		 vuad_wr_en_r1c1; // decoded address bits 8:7
output	vuad_rd_en_r1;

output	[4:0]	 vuad_rd_addr1_r2;
output	[4:0]	 vuad_rd_addr2_r2;
output		 vuad_rd_addr_sel_r2;
output	[4:0]	 vuad_wr_addr_r2; // address bits 6:2
output	[3:0]	 vuad_word_en_r2; // decoded address bits 1:0
output		 vuad_wr_en_r2c0; // decoded address bits 8:7
output		 vuad_wr_en_r2c1; // decoded address bits 8:7
output	[3:0]	vuad_mux1_h_sel_r2;
output	[3:0]	vuad_mux1_l_sel_r2;
output		vuad_mux2_sel_r2;  // int 5.0 changes
output	vuad_rd_en_r2;

output	[4:0]	 vuad_rd_addr1_r3;
output	[4:0]	 vuad_rd_addr2_r3;
output		 vuad_rd_addr_sel_r3;
output	[4:0]	 vuad_wr_addr_r3; // address bits 6:2
output	[3:0]	 vuad_word_en_r3; // decoded address bits 1:0
output		 vuad_wr_en_r3c0; // decoded address bits 8:7
output		 vuad_wr_en_r3c1; // decoded address bits 8:7
output		vuad_rd_en_r3;

output	[1:0]	vuad_mux_sel; // middle mux select.
//

input	mbist_run;


//
//
//


output     vuad_usaloc_mux_used_and_alloc_comb_sel0;
output     vuad_usaloc_mux_used_and_alloc_comb_sel1;
output     vuad_usaloc_mux_used_and_alloc_comb_sel2;
output     vuad_usaloc_mux_used_and_alloc_comb_sel3;
output     vuad_usaloc_mux_used_and_alloc_comb_sel4;
output     vuad_usaloc_mux_used_and_alloc_comb_sel5;


output  mux_valid_dirty_c1_sel0;
output  mux_valid_dirty_c1_sel1;
output  mux_valid_dirty_c1_sel2;




 
wire 	vuad_array_wr_en0_c3, vuad_array_wr_en0_c5, vuad_array_wr_en0_c52; 
     // BS 03/11/04 extra cycle for mem access
wire	vuad_array_wr_en1_c3, vuad_array_wr_en1_c5, vuad_array_wr_en1_c52; 
     // BS 03/11/04 extra cycle for mem access
wire	vuad_sel_wr, vuad_sel_c4orc5; 
 
wire	inst_vld_c3; 
wire	inst_vld_c4; 
wire	inst_vld_c5; 
 
wire	arb_inst_diag_c2; 
wire	arb_inst_diag_c3; 
wire	arb_inst_diag_c4; 
 
wire	l2_bypass_mode_on_d1; 
wire	wr_disable_c3; 
wire	inst_int_c2; // int 5.0 changes 
wire	inst_int_c3;  // int 5.0 changes
wire	inst_int_c4;  // int 5.0 changes
wire	inst_int_c5;  // int 5.0 changes
wire	vuad_error_c4, vuad_error_c5, vuad_error_c52; // BS 03/11/04 extra cycle for mem access 
wire	vuad_error_c6, vuad_error_c7; 
 
 
 
wire	alloc_set_cond_c2; 
wire	alloc_rst_cond_c2; 
wire	fill_inst_vld_c2; 
wire	[3:0]	dec_lo_fill_way_c2; 
wire	[3:0]	dec_hi_fill_way_c2; 
wire	[15:0]	fill_way_c2; 
 
wire	acc_vd_c3; 
wire	acc_ua_c3; 
wire	bistordiag_wr_vd_c3, bistordiag_wr_ua_c3 ; 
wire	[8:0]	vuad_acc_idx_c3; 
wire	vuadctl_no_bypass_c1; 


//////////////////////////////////////////////////
// l2t_vuad_ctl
//////////////////////////////////////////////////
assign	wr_addr_entry = wr_addr[6:2] ;
assign	wr_word_en[0]  = ~wr_addr[1] & ~wr_addr[0] ;
assign	wr_word_en[1]  = ~wr_addr[1] & wr_addr[0] ;
assign	wr_word_en[2]  = wr_addr[1] & ~wr_addr[0] ;
assign	wr_word_en[3]  = wr_addr[1] & wr_addr[0] ;
assign	wr_en[0] =  ~wr_addr[8] & ~wr_addr[7] ;
assign	wr_en[1] =  ~wr_addr[8] & wr_addr[7] ;
assign	wr_en[2] =   wr_addr[8] & ~wr_addr[7] ;
assign	wr_en[3] =   wr_addr[8] & wr_addr[7] ;

assign rd_addr_sel_n = ~rd_addr_sel;

// LSb 1:0
l2t_vuad_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_addr1to0_px2 
		(.dout (addr1to0_px2[1:0] ) ,
       			.din0(rd_addr1[1:0]),
			.din1(rd_addr2[1:0]),
			.sel0(rd_addr_sel),
			.sel1(rd_addr_sel_n));

l2t_vuad_ctl_msff_ctl_macro__width_2 ff_addr1to0_c1  // int 5.0 change
		(.din(addr1to0_px2[1:0]),
		.scan_in(ff_addr1to0_c1_scanin),
		.scan_out(ff_addr1to0_c1_scanout),
		.l1clk(l1clk),
		.dout(addr1to0_c1[1:0]),
  .siclk(siclk),
  .soclk(soclk)
		);

// LSb 8
l2t_vuad_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_addr8_px2 
		(.dout (addr8_px2) ,
       			.din0(rd_addr1[8]),
			.din1(rd_addr2[8]),
			.sel0(rd_addr_sel),
			.sel1(rd_addr_sel_n));

l2t_vuad_ctl_msff_ctl_macro__width_1 ff_addr8_c1 
		(.din(addr8_px2),
		.scan_in(ff_addr8_c1_scanin),
		.scan_out(ff_addr8_c1_scanout),
		.l1clk(l1clk),
		.dout(addr8_c1),
  .siclk(siclk),
  .soclk(soclk)
);


// Lsb 7
l2t_vuad_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_addr7_px2 
		(.dout (addr7_px2) ,
       			.din0(rd_addr1[7]),
			.din1(rd_addr2[7]),
			.sel0(rd_addr_sel),
			.sel1(rd_addr_sel_n));

l2t_vuad_ctl_msff_ctl_macro__width_1 ff_addr7_c1  // int 5.0 change
                           (.din(addr7_px2),
		.scan_in(ff_addr7_c1_scanin),
		.scan_out(ff_addr7_c1_scanout),
		.l1clk(l1clk),
		.dout(addr7_c1),
  .siclk(siclk),
  .soclk(soclk)
);




// Mux2 of the read address.
// Buffer appropriately to get the following
// signals.


// XY = 75 X 50
assign	vuad_rd_addr1_r0 = rd_addr1[6:2];
assign	vuad_rd_addr2_r0 = rd_addr2[6:2];
assign	vuad_rd_addr_sel_r0 = rd_addr_sel ;

assign	vuad_wr_addr_r0[4:0] = wr_addr_entry[4:0] ;
assign	vuad_word_en_r0 = wr_word_en ;
assign	vuad_wr_en_r0c0 = wr_en[0] & wr_en0 ;
assign	vuad_wr_en_r0c1 = wr_en[0] & wr_en1 ;

assign		vuad_mux1_h_sel_r0[0]  = ~addr1to0_c1[1] & ~addr1to0_c1[0] ;
assign		vuad_mux1_h_sel_r0[1]  = ~addr1to0_c1[1] & addr1to0_c1[0] ;
assign		vuad_mux1_h_sel_r0[2]  = addr1to0_c1[1] & ~addr1to0_c1[0] ;
assign		vuad_mux1_h_sel_r0[3]  = addr1to0_c1[1] & addr1to0_c1[0] ;

assign		vuad_mux1_l_sel_r0 = vuad_mux1_h_sel_r0 ;
assign		vuad_mux2_sel_r0= addr7_c1; // int 5.0 change
assign		vuad_rd_en_r0  = ~addr7_px2 & array_rd_en;

// XY = 75 X 50
assign	vuad_rd_addr1_r1 = rd_addr1[6:2];
assign	vuad_rd_addr2_r1 = rd_addr2[6:2];
assign	vuad_rd_addr_sel_r1 = rd_addr_sel ;
assign	vuad_wr_addr_r1[4:0] = wr_addr_entry[4:0] ;
assign	vuad_word_en_r1 = wr_word_en ;
assign	vuad_wr_en_r1c0 = wr_en[1] & wr_en0 ;
assign	vuad_wr_en_r1c1 = wr_en[1] & wr_en1 ;
assign	vuad_rd_en_r1  = addr7_px2 & array_rd_en ;

// XY = 75 X 50
assign	vuad_rd_addr1_r2 = rd_addr1[6:2];
assign	vuad_rd_addr2_r2 = rd_addr2[6:2];
assign	vuad_rd_addr_sel_r2 = rd_addr_sel ;
assign	vuad_wr_addr_r2[4:0] = wr_addr_entry[4:0] ;
assign	vuad_word_en_r2 = wr_word_en ;
assign	vuad_wr_en_r2c0 = wr_en[2] & wr_en0 ;
assign	vuad_wr_en_r2c1 = wr_en[2] & wr_en1 ;

assign	vuad_mux1_h_sel_r2[0]  = ~addr1to0_c1[1] & ~addr1to0_c1[0] ;
assign	vuad_mux1_h_sel_r2[1]  = ~addr1to0_c1[1] & addr1to0_c1[0] ;
assign	vuad_mux1_h_sel_r2[2]  = addr1to0_c1[1] & ~addr1to0_c1[0] ;
assign	vuad_mux1_h_sel_r2[3]  = addr1to0_c1[1] & addr1to0_c1[0] ;
assign	vuad_mux1_l_sel_r2 = vuad_mux1_h_sel_r2 ;
assign	vuad_mux2_sel_r2 = addr7_c1;
assign	vuad_rd_en_r2  = ~addr7_px2 & array_rd_en;


// XY = 75 X 50
assign	vuad_rd_addr1_r3 = rd_addr1[6:2];
assign	vuad_rd_addr2_r3 = rd_addr2[6:2];
assign	vuad_rd_addr_sel_r3 = rd_addr_sel ;
assign	vuad_wr_addr_r3[4:0] = wr_addr_entry[4:0] ;
assign	vuad_word_en_r3 = wr_word_en ;
assign	vuad_wr_en_r3c0 = wr_en[3] & wr_en0 ;
assign	vuad_wr_en_r3c1 = wr_en[3] & wr_en1 ;
assign	vuad_rd_en_r3  = addr7_px2 & array_rd_en;

// Middle Io = 75 X 50

assign	vuad_mux_sel[0]	 =  ~addr8_c1 ;
assign	vuad_mux_sel[1]	 =   addr8_c1 ;

//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
//assign stop = 1'b0;
assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_vuad_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//////////////////////////////////////////////////

//////////////////////////////////////////
// Spare gate insertion
//////////////////////////////////////////
l2t_vuad_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////

 
//assign	vuaddp_st_to_data_array_c3 = tag_st_to_data_array_c3; 
//assign	vuaddp_lru_way_c3 = tagdp_lru_way_sel_c3; 
//assign	vuaddp_hit_wayvld_c3 = tag_hit_way_vld_c3  & ~{16{arb_vuad_ce_err_c3}}; 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuadctl_no_bypass_c1 
                           (.din(arb_vuadctl_no_bypass_px2),  
		 .scan_in(ff_vuadctl_no_bypass_c1_scanin),
		 .scan_out(ff_vuadctl_no_bypass_c1_scanout),
		 .l1clk(l1clk), 
                 .dout(vuadctl_no_bypass_c1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//////////////////////////////////////////////////////////////////////// 
 // index compares to for vuad mux selects. 
 //////////////////////////////////////////////////////////////////////// 
 
 assign vuaddp_vuad_sel_c2 = ~arbadr_idx_c1c2comp_c1_n & arb_inst_vld_c2 &
                        ~( arb_decdp_inst_int_c1  | inst_int_c2  ) ;  // int 5.0 changes
 
 assign vuaddp_vuad_sel_c4 = ~arbadr_idx_c1c4comp_c1_n & inst_vld_c4 &
				~( arb_decdp_inst_int_c1  | inst_int_c4)  ; // int 5.0 changes
 
 assign vuaddp_vuad_sel_c2orc3 = ((( ~arbadr_idx_c1c3comp_c1_n & inst_vld_c3)  &
                                ~( arb_decdp_inst_int_c1  | inst_int_c3) ) |
                                vuaddp_vuad_sel_c2 ); // int 5.0 change
 
 assign vuad_sel_wr = ~arbadr_idx_c1c5comp_c1_n & inst_vld_c5 &
			~( arb_decdp_inst_int_c1  | inst_int_c5); // int 5.0 change
 
 assign vuad_sel_c4orc5 = vuaddp_vuad_sel_c4 | vuad_sel_wr ; 

 assign vuaddp_vuad_sel_rd = ~( vuaddp_vuad_sel_c2orc3 | vuad_sel_c4orc5 ) | // int 5.0 changes 
			vuadctl_no_bypass_c1; // BIST or DECC read of VUAD 


assign vuad_usaloc_mux_used_and_alloc_comb_sel0 = vuaddp_vuad_sel_rd_c2   & ~vuaddp_vuad_sel_c2_d1  &
						 vuaddp_vuad_sel_c2 & vuaddp_vuad_sel_c2orc3 & ~vuaddp_vuad_sel_rd;
assign vuad_usaloc_mux_used_and_alloc_comb_sel1 = ~vuaddp_vuad_sel_rd_c2 & ~vuaddp_vuad_sel_c2_d1 & 
						vuaddp_vuad_sel_c2 & vuaddp_vuad_sel_c2orc3 & ~vuaddp_vuad_sel_rd;
assign vuad_usaloc_mux_used_and_alloc_comb_sel2 = vuaddp_vuad_sel_c2_d1 & vuaddp_vuad_sel_c2 & vuaddp_vuad_sel_c2orc3   &
						 ~vuaddp_vuad_sel_rd;
assign vuad_usaloc_mux_used_and_alloc_comb_sel3 = ~vuaddp_vuad_sel_c2  & vuaddp_vuad_sel_c2orc3 & ~vuaddp_vuad_sel_rd ;
assign vuad_usaloc_mux_used_and_alloc_comb_sel4 = ~vuaddp_vuad_sel_c2orc3 & ~vuaddp_vuad_sel_rd;
assign vuad_usaloc_mux_used_and_alloc_comb_sel5 = vuaddp_vuad_sel_rd;



//assign mux_valid_dirty_c1_sel0 =  vuaddp_vuad_sel_rd;
//assign mux_valid_dirty_c1_sel1 = ~vuaddp_vuad_sel_rd & vuaddp_vuad_sel_c2orc3;
//assign mux_valid_dirty_c1_sel2 = ~vuaddp_vuad_sel_rd & ~vuaddp_vuad_sel_c2orc3;

assign mux_valid_dirty_c1_sel0 =  ~( vuaddp_vuad_sel_c2orc3 | vuad_sel_c4orc5 ) | vuadctl_no_bypass_c1_1;
assign mux_valid_dirty_c1_sel1 = ~(~( vuaddp_vuad_sel_c2orc3 | vuad_sel_c4orc5 ) | vuadctl_no_bypass_c1_1)  & vuaddp_vuad_sel_c2orc3;
assign mux_valid_dirty_c1_sel2 = ~(~( vuaddp_vuad_sel_c2orc3 | vuad_sel_c4orc5 ) | vuadctl_no_bypass_c1_1)  & ~vuaddp_vuad_sel_c2orc3;



l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuadctl_no_bypass_c1_1 
                           (.din(arb_vuadctl_no_bypass_px2),
                 .scan_in(ff_vuadctl_no_bypass_c1_1_scanin),
                 .scan_out(ff_vuadctl_no_bypass_c1_1_scanout),
                 .l1clk(l1clk),
                 .dout(vuadctl_no_bypass_c1_1),
  .siclk(siclk),
  .soclk(soclk)
);



l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuaddp_vuad_sel_c2 
                           (.din(vuaddp_vuad_sel_rd), .l1clk(l1clk),
                 .scan_in(ff_vuaddp_vuad_sel_c2_scanin),
                 .scan_out(ff_vuaddp_vuad_sel_c2_scanout),
                 .dout(vuaddp_vuad_sel_rd_c2),
  .siclk(siclk),
  .soclk(soclk)
);

			 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuaddp_vuad_sel_c2_d1 
                           (.din(vuaddp_vuad_sel_c2), .l1clk(l1clk), 
                 .scan_in(ff_vuaddp_vuad_sel_c2_d1_scanin),
                 .scan_out(ff_vuaddp_vuad_sel_c2_d1_scanout),
                 .dout(vuaddp_vuad_sel_c2_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_sel_wr_d1 
                           (.din(vuad_sel_wr), .l1clk(l1clk), 
                 .scan_in(ff_vuad_sel_wr_d1_scanin),
                 .scan_out(ff_vuad_sel_wr_d1_scanout),
                 .dout(vuad_sel_wr_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_tagd_sel_c2_d1 
                           (.din(vuaddp_vuad_sel_c2), .l1clk(l1clk), 
                 .scan_in(ff_vuad_tagd_sel_c2_d1_scanin),
                 .scan_out(ff_vuad_tagd_sel_c2_d1_scanout),
                 .dout(vuaddp_vuad_tagd_sel_c2_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_wr64_inst_c3 
		(.din(arb_decdp_wr64_inst_c2), .l1clk(l1clk), 
               .scan_in(ff_wr64_inst_c3_scanin),
               .scan_out(ff_wr64_inst_c3_scanout),
               .dout(vuaddp_wr64_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
 
		); 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_arb_acc_vd_c3 
              (.dout   (acc_vd_c3), .din (arb_acc_vd_c2), 
               .scan_in(ff_arb_acc_vd_c3_scanin),
               .scan_out(ff_arb_acc_vd_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_arb_acc_ua_c3 
              (.dout   (acc_ua_c3), .din (arb_acc_ua_c2), 
               .scan_in(ff_arb_acc_ua_c3_scanin),
               .scan_out(ff_arb_acc_ua_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_inst_vld_c3 
              (.dout   (inst_vld_c3), .din (arb_inst_vld_c2), 
               .scan_in(ff_inst_vld_c3_scanin),
               .scan_out(ff_inst_vld_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_inst_vld_c4 
              (.dout   (inst_vld_c4), .din (inst_vld_c3), 
               .scan_in(ff_inst_vld_c4_scanin),
               .scan_out(ff_inst_vld_c4_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_inst_vld_c5 
              (.dout   (inst_vld_c5), .din (inst_vld_c4), 
               .scan_in(ff_inst_vld_c5_scanin),
               .scan_out(ff_inst_vld_c5_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_arb_inst_diag_c2 
              (.dout   (arb_inst_diag_c2), .din (arb_inst_diag_c1), 
               .scan_in(ff_arb_inst_diag_c2_scanin),
               .scan_out(ff_arb_inst_diag_c2_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_arb_inst_diag_c3 
              (.dout   (arb_inst_diag_c3), .din (arb_inst_diag_c2), 
               .scan_in(ff_arb_inst_diag_c3_scanin),
               .scan_out(ff_arb_inst_diag_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_arb_inst_diag_c4 
              (.dout   (arb_inst_diag_c4), .din (arb_inst_diag_c3), 
               .scan_in(ff_arb_inst_diag_c4_scanin),
               .scan_out(ff_arb_inst_diag_c4_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
// msff_ctl_macro ff_filbuf_vuad_bypassed_c3 (width=1)
              //(.dout   (filbuf_vuad_bypassed_c3), .din (filbuf_vuad_bypassed_c2), 
               //.l1clk (l1clk),  
	//	.scan_in  (), 
	//	.scan_out()
 
              //) ; 
 
l2t_vuad_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_9 mux_idx_c3 
		(.dout (vuad_acc_idx_c3[8:0]) , 
                                .din0(bist_vuad_idx_c3[8:0] ),  
                                .din1(evctag_vuad_idx_c3[8:0]),  
                                .sel0(bist_vuad_wr_en & mbist_run_r1),         
                                .sel1(~bist_vuad_wr_en & ~mbist_run_r1)) ; 
 
l2t_vuad_ctl_msff_ctl_macro__width_9 ff_mux_idx_c4 
              (.dout   (vuaddp_vuad_idx_c4[8:0]), .din (vuad_acc_idx_c3[8:0]), 
               .scan_in(ff_mux_idx_c4_scanin),
               .scan_out(ff_mux_idx_c4_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
 
 
 
////////////////////////////////////////////////////////////////////////////////////////// 
// Disable L2 VUAD writes if 
// 1. Instruction is an INT. 
// 2. L2 is OFF and the instruction is a non-diag instruction. 
// 3. diag instruction is not a VUAD store. 
//     (in implementation disable the write whenever there is Diag Inst and 
//    enable it if the inst is a Diag write to the VUAD array.) 
////////////////////////////////////////////////////////////////////////////////////////// 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_l2_bypass_mode_on_d1 
              (.dout   (l2_bypass_mode_on_d1), .din (csr_l2_bypass_mode_on), 
               .scan_in(ff_l2_bypass_mode_on_d1_scanin),
               .scan_out(ff_l2_bypass_mode_on_d1_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 


//////////////////////////////////////////////////////////////////////////////
//If a diagnostic access, normal write is disabled by wr_disable_c3. 
//If not a diagnostic access :
//      if bypass mode is on, write is disabled by wr_disable_c3
//      if bypass mode is off, write is always enabled ( even upon vuad CE)
//                  hence we dont need to use CE to force the write to happen ??
///////////////////////////////////////////////////////////////////////////////////// 
 
assign  wr_disable_c3  = inst_int_c3 | // int 5.0 changes	// VUAD ecc changes
                         (l2_bypass_mode_on_d1 & ~arb_inst_diag_c3) | 
                          arb_inst_diag_c3 ; 
 
////////////////////////// 
// access  PV, PD, V, P 
////////////////////////// 
assign  vuaddp_sel_diag0_data_wr_c3 = arb_inst_l2vuad_vld_c3 &  
			arb_decdp_st_inst_c3 &  acc_vd_c3 ; // sel diag over bist data 
 
assign	bistordiag_wr_vd_c3 =  (vuaddp_sel_diag0_data_wr_c3 & ~mbist_run_r1)| // diagorbist over normal data 
				( bist_vuad_wr_en & bist_wr_vd_c3 & mbist_run_r1 );  
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_bistordiag_wr_vd_c4 
              (.dout   (vuaddp_bistordiag_wr_vd_c4), .din (bistordiag_wr_vd_c3), 
               .scan_in(ff_bistordiag_wr_vd_c4_scanin),
               .scan_out(ff_bistordiag_wr_vd_c4_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
//assign  vuad_array_wr_en1_c3 = ((inst_vld_c3 & ~wr_disable_c3) &~mbist_run_r1) |  // normal write 
//				(bistordiag_wr_vd_c3 & mbist_run_r1); // bist or diag write 

assign  vuad_array_wr_en1_c3 = ((inst_vld_c3 & ~wr_disable_c3) &~mbist_run_r1) | // normal write
			bistordiag_wr_vd_c3;

////////////////////////// 
// access  PU, PA, U, A 
////////////////////////// 
assign  vuaddp_sel_diag1_data_wr_c3 = arb_inst_l2vuad_vld_c3 &  
			arb_decdp_st_inst_c3 & acc_ua_c3 ; // sel diag over bist data 
 
assign	bistordiag_wr_ua_c3 =  (vuaddp_sel_diag1_data_wr_c3  & ~mbist_run_r1)| // diagorbist over normal data 
				( mbist_run_r1 & bist_vuad_wr_en & ~bist_wr_vd_c3 ); 
 
l2t_vuad_ctl_msff_ctl_macro__width_2 ff_bistordiag_wr_ua_c4 
              (.dout ({mbist_run_r1,vuaddp_bistordiag_wr_ua_c4}), 
		.scan_in(ff_bistordiag_wr_ua_c4_scanin),
		.scan_out(ff_bistordiag_wr_ua_c4_scanout),
		.din ({mbist_run,bistordiag_wr_ua_c3}), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
              ) ; 

 
assign  vuad_array_wr_en0_c3 = (( inst_vld_c3 & ~wr_disable_c3) &~mbist_run_r1) | // normal write 
				bistordiag_wr_ua_c3; // bist or diag write 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_array_wr_en0_c4 
			(.din(vuad_array_wr_en0_c3), .l1clk(l1clk), 
                 	.scan_in(ff_vuad_array_wr_en0_c4_scanin),
                 	.scan_out(ff_vuad_array_wr_en0_c4_scanout),
                 	.dout(vuaddp_vuad_array_wr_en0_c4),
  .siclk(siclk),
  .soclk(soclk)  
 
			); 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_array_wr_en1_c4 
			(.din(vuad_array_wr_en1_c3), .l1clk(l1clk), 
                 	.scan_in(ff_vuad_array_wr_en1_c4_scanin),
                 	.scan_out(ff_vuad_array_wr_en1_c4_scanout),
                 	.dout(vuaddp_vuad_array_wr_en1_c4),
  .siclk(siclk),
  .soclk(soclk)  
 
			); 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_array_wr_en0_c5 
			(.din(vuaddp_vuad_array_wr_en0_c4), .l1clk(l1clk), 
                 	.scan_in(ff_vuad_array_wr_en0_c5_scanin),
                 	.scan_out(ff_vuad_array_wr_en0_c5_scanout),
                 	.dout(vuad_array_wr_en0_c5),
  .siclk(siclk),
  .soclk(soclk)  
 
			); 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_array_wr_en1_c5 
			(.din(vuaddp_vuad_array_wr_en1_c4), .l1clk(l1clk), 
                 	.scan_in(ff_vuad_array_wr_en1_c5_scanin),
                 	.scan_out(ff_vuad_array_wr_en1_c5_scanout),
                 	.dout(vuad_array_wr_en1_c5),
  .siclk(siclk),
  .soclk(soclk)  
 
			); 

// BS 03/11/04 extra cycle for mem access

l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_array_wr_en0_c52 
                        (.din(vuad_array_wr_en0_c5), .l1clk(l1clk),
                        .scan_in(ff_vuad_array_wr_en0_c52_scanin),
                        .scan_out(ff_vuad_array_wr_en0_c52_scanout),
                        .dout(vuad_array_wr_en0_c52),
  .siclk(siclk),
  .soclk(soclk)  

                        );


l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_array_wr_en1_c52 
                        (.din(vuad_array_wr_en1_c5), .l1clk(l1clk),
                        .scan_in(ff_vuad_array_wr_en1_c52_scanin),
                        .scan_out(ff_vuad_array_wr_en1_c52_scanout),
                        .dout(vuad_array_wr_en1_c52),
  .siclk(siclk),
  .soclk(soclk)  

                        );

// 
//msff_ctl_macro ff_vuad_array_wr_en0_c6 (width=1)
//			(.din(vuad_array_wr_en0_c52), .l1clk(l1clk), 
//                 	.scan_in(ff_vuad_array_wr_en0_c6_scanin),
//                 	.scan_out(ff_vuad_array_wr_en0_c6_scanout),
//                 	.dout(vuad_array_wr_en0_c6),  
// 
//			); 
// 
//msff_ctl_macro ff_vuad_array_wr_en1_c6 (width=1)
//			(.din(vuad_array_wr_en1_c52), .l1clk(l1clk), 
//                 	.scan_in(ff_vuad_array_wr_en1_c6_scanin),
//                 	.scan_out(ff_vuad_array_wr_en1_c6_scanout),
//                 	.dout(vuad_array_wr_en1_c6),  
// 
//			); 
// 
//assign	vuaddp_sel_ua_wr_data_byp = vuad_sel_wr_d1  
//				& vuad_array_wr_en1_c6 ; 
//assign	vuaddp_sel_vd_wr_data_byp = vuad_sel_wr_d1  
//				& vuad_array_wr_en0_c6 ; 
// 

assign        vuaddp_sel_ua_wr_data_byp = vuad_sel_wr_d1
				& vuad_array_wr_en1_c52 ;
assign        vuaddp_sel_vd_wr_data_byp = vuad_sel_wr_d1
                              & vuad_array_wr_en0_c52 ;

 
 
 
//* All errors are qualififed in the block that generates them 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_inst_int_c2  // int 5.0 changes
              (.dout   (inst_int_c2), .din (arb_decdp_inst_int_c1), 
               .scan_in(ff_inst_int_c2_scanin),
               .scan_out(ff_inst_int_c2_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 

l2t_vuad_ctl_msff_ctl_macro__width_1 ff_inst_int_c3  // int 5.0 changes
              (.dout   (inst_int_c3), .din (inst_int_c2),
               .scan_in(ff_inst_int_c3_scanin),
               .scan_out(ff_inst_int_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  

              ) ;

l2t_vuad_ctl_msff_ctl_macro__width_1 ff_inst_int_c4  // int 5.0 changes
              (.dout   (inst_int_c4), .din (inst_int_c3),
               .scan_in(ff_inst_int_c4_scanin),
               .scan_out(ff_inst_int_c4_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  

              ) ;

l2t_vuad_ctl_msff_ctl_macro__width_1 ff_inst_int_c5  // int 5.0 changes
              (.dout   (inst_int_c5), .din (inst_int_c4),
               .scan_in(ff_inst_int_c5_scanin),
               .scan_out(ff_inst_int_c5_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  

              ) ;


 
 
// Used bit error will not be reported as they are harmless. 
 
assign	vuad_error_c4 = ~(arb_inst_diag_c4 | inst_int_c4) &  
			 (vuadpm_vd_ue_c4 | vuadpm_ua_ue_c4) &  // int 5.0 changes
                          inst_vld_c4; 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_error_c5 
              (.dout   (vuad_error_c5), .din (vuad_error_c4), 
               .scan_in(ff_vuad_error_c5_scanin),
               .scan_out(ff_vuad_error_c5_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 

// BS 03/11/04 extra cycle for mem access

l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_error_c52 
              (.dout   (vuad_error_c52), .din (vuad_error_c5),
               .scan_in(ff_vuad_error_c52_scanin),
               .scan_out(ff_vuad_error_c52_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  

              ) ;

 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_error_c6 
              (.dout   (vuad_error_c6), .din (vuad_error_c52), 
               .scan_in(ff_vuad_error_c6_scanin),
               .scan_out(ff_vuad_error_c6_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_error_c7 
              (.dout   (vuad_error_c7), .din (vuad_error_c6), 
               .scan_in(ff_vuad_error_c7_scanin),
               .scan_out(ff_vuad_error_c7_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_vuad_error_c8 
              (.dout   (vuaddp_vuad_error_c8), .din (vuad_error_c7), 
               .scan_in(ff_vuad_error_c8_scanin),
               .scan_out(ff_vuad_error_c8_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
//////////////////////////////////////////////////////////////////////////////// 
// 4-16 decoder for the fill way 
// Conditions for altering the VUAD bits. 
//////////////////////////////////////////////////////////////////////////////// 
assign  fill_inst_vld_c2 = arbdec_arbdp_inst_fb_c2 & arb_inst_vld_c2 ; 
 
 
 
assign	dec_lo_fill_way_c2[0] = ( arbdec_arbdp_inst_way_c2[1:0]==2'd0 )  
					& fill_inst_vld_c2 ; 
assign	dec_lo_fill_way_c2[1] = ( arbdec_arbdp_inst_way_c2[1:0]==2'd1 )  
					& fill_inst_vld_c2 ; 
assign	dec_lo_fill_way_c2[2] = ( arbdec_arbdp_inst_way_c2[1:0]==2'd2 )  
					& fill_inst_vld_c2 ; 
assign	dec_lo_fill_way_c2[3] = ( arbdec_arbdp_inst_way_c2[1:0]==2'd3 )  
					& fill_inst_vld_c2 ; 
 
 
assign	dec_hi_fill_way_c2[0] = ( arbdec_arbdp_inst_way_c2[3:2]==2'd0 ) ; 
 
assign	dec_hi_fill_way_c2[1] = ( arbdec_arbdp_inst_way_c2[3:2]==2'd1 ) ; 
 
assign	dec_hi_fill_way_c2[2] = ( arbdec_arbdp_inst_way_c2[3:2]==2'd2 ) ; 
 
assign	dec_hi_fill_way_c2[3] = ( arbdec_arbdp_inst_way_c2[3:2]==2'd3 ) ; 
 
 
assign	fill_way_c2[0] = dec_hi_fill_way_c2[0] & dec_lo_fill_way_c2[0] ; // 0000 
 
assign	fill_way_c2[1] = dec_hi_fill_way_c2[0] & dec_lo_fill_way_c2[1] ; // 0001 
 
assign	fill_way_c2[2] = dec_hi_fill_way_c2[0] & dec_lo_fill_way_c2[2] ; // 0010 
 
assign	fill_way_c2[3] = dec_hi_fill_way_c2[0] & dec_lo_fill_way_c2[3] ; // 0011 


 
assign  fill_way_c2[4] = dec_hi_fill_way_c2[1] & dec_lo_fill_way_c2[0] ; // 0100

assign  fill_way_c2[5] = dec_hi_fill_way_c2[1] & dec_lo_fill_way_c2[1] ; // 0101

assign  fill_way_c2[6] = dec_hi_fill_way_c2[1] & dec_lo_fill_way_c2[2] ; // 0110

assign  fill_way_c2[7] = dec_hi_fill_way_c2[1] & dec_lo_fill_way_c2[3] ; // 0111



assign  fill_way_c2[8] = dec_hi_fill_way_c2[2] & dec_lo_fill_way_c2[0] ; // 1000

assign  fill_way_c2[9] = dec_hi_fill_way_c2[2] & dec_lo_fill_way_c2[1] ; // 1001

assign  fill_way_c2[10] = dec_hi_fill_way_c2[2] & dec_lo_fill_way_c2[2] ; // 1010

assign  fill_way_c2[11] = dec_hi_fill_way_c2[2] & dec_lo_fill_way_c2[3] ; // 1011
 
 
assign	fill_way_c2[12] = dec_hi_fill_way_c2[3] & dec_lo_fill_way_c2[0] ; // 1100 
 
assign	fill_way_c2[13] = dec_hi_fill_way_c2[3] & dec_lo_fill_way_c2[1] ; // 1101 
 
assign	fill_way_c2[14] = dec_hi_fill_way_c2[3] & dec_lo_fill_way_c2[2] ; // 1110 
 
assign	fill_way_c2[15] = dec_hi_fill_way_c2[3] & dec_lo_fill_way_c2[3] ; // 1111 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_16 ff_fill_way_c3 
              (.dout   (vuaddp_fill_way_c3[15:0]), .din (fill_way_c2[15:0]), 
               .scan_in(ff_fill_way_c3_scanin),
               .scan_out(ff_fill_way_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
 
 
 
assign  alloc_set_cond_c2 = (arb_arbdp_vuadctl_pst_no_ctrue_c2 | arb_decdp_cas1_inst_c2) ; 
 
 
 
assign  alloc_rst_cond_c2 = arb_arbdp_pst_with_ctrue_c2 | 
                            (arb_decdp_cas2_inst_c2 & arbdec_arbdp_inst_mb_c2) | 
                            (arbdec_arbdp_inst_mb_c2 & ~alloc_set_cond_c2) ; 
 
 
 
 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_alloc_set_cond_c3 
              (.dout   (vuaddp_alloc_set_cond_c3), .din (alloc_set_cond_c2), 
               .scan_in(ff_alloc_set_cond_c3_scanin),
               .scan_out(ff_alloc_set_cond_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
l2t_vuad_ctl_msff_ctl_macro__width_1 ff_alloc_rst_cond_c3 
              (.dout   (vuaddp_alloc_rst_cond_c3), .din (alloc_rst_cond_c2), 
               .scan_in(ff_alloc_rst_cond_c3_scanin),
               .scan_out(ff_alloc_rst_cond_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
              ) ; 
 
 
// fixscan start:
assign ff_addr1to0_c1_scanin     = scan_in                  ;
assign ff_addr8_c1_scanin        = ff_addr1to0_c1_scanout   ;
assign ff_addr7_c1_scanin        = ff_addr8_c1_scanout      ;
assign spares_scanin             = ff_addr7_c1_scanout      ;
assign ff_vuadctl_no_bypass_c1_scanin = spares_scanout           ;
assign ff_vuadctl_no_bypass_c1_1_scanin = ff_vuadctl_no_bypass_c1_scanout;
assign ff_vuaddp_vuad_sel_c2_scanin = ff_vuadctl_no_bypass_c1_1_scanout;
assign ff_vuaddp_vuad_sel_c2_d1_scanin = ff_vuaddp_vuad_sel_c2_scanout;
assign ff_vuad_sel_wr_d1_scanin  = ff_vuaddp_vuad_sel_c2_d1_scanout;
assign ff_vuad_tagd_sel_c2_d1_scanin = ff_vuad_sel_wr_d1_scanout;
assign ff_wr64_inst_c3_scanin    = ff_vuad_tagd_sel_c2_d1_scanout;
assign ff_arb_acc_vd_c3_scanin   = ff_wr64_inst_c3_scanout  ;
assign ff_arb_acc_ua_c3_scanin   = ff_arb_acc_vd_c3_scanout ;
assign ff_inst_vld_c3_scanin     = ff_arb_acc_ua_c3_scanout ;
assign ff_inst_vld_c4_scanin     = ff_inst_vld_c3_scanout   ;
assign ff_inst_vld_c5_scanin     = ff_inst_vld_c4_scanout   ;
assign ff_arb_inst_diag_c2_scanin = ff_inst_vld_c5_scanout   ;
assign ff_arb_inst_diag_c3_scanin = ff_arb_inst_diag_c2_scanout;
assign ff_arb_inst_diag_c4_scanin = ff_arb_inst_diag_c3_scanout;
assign ff_mux_idx_c4_scanin      = ff_arb_inst_diag_c4_scanout;
assign ff_l2_bypass_mode_on_d1_scanin = ff_mux_idx_c4_scanout    ;
assign ff_bistordiag_wr_vd_c4_scanin = ff_l2_bypass_mode_on_d1_scanout;
assign ff_bistordiag_wr_ua_c4_scanin = ff_bistordiag_wr_vd_c4_scanout;
assign ff_vuad_array_wr_en0_c4_scanin = ff_bistordiag_wr_ua_c4_scanout;
assign ff_vuad_array_wr_en1_c4_scanin = ff_vuad_array_wr_en0_c4_scanout;
assign ff_vuad_array_wr_en0_c5_scanin = ff_vuad_array_wr_en1_c4_scanout;
assign ff_vuad_array_wr_en1_c5_scanin = ff_vuad_array_wr_en0_c5_scanout;
assign ff_vuad_array_wr_en0_c52_scanin = ff_vuad_array_wr_en1_c5_scanout;
assign ff_vuad_array_wr_en1_c52_scanin = ff_vuad_array_wr_en0_c52_scanout;
assign ff_inst_int_c2_scanin     = ff_vuad_array_wr_en1_c52_scanout;
assign ff_inst_int_c3_scanin     = ff_inst_int_c2_scanout   ;
assign ff_inst_int_c4_scanin     = ff_inst_int_c3_scanout   ;
assign ff_inst_int_c5_scanin     = ff_inst_int_c4_scanout   ;
assign ff_vuad_error_c5_scanin   = ff_inst_int_c5_scanout   ;
assign ff_vuad_error_c52_scanin  = ff_vuad_error_c5_scanout ;
assign ff_vuad_error_c6_scanin   = ff_vuad_error_c52_scanout;
assign ff_vuad_error_c7_scanin   = ff_vuad_error_c6_scanout ;
assign ff_vuad_error_c8_scanin   = ff_vuad_error_c7_scanout ;
assign ff_fill_way_c3_scanin     = ff_vuad_error_c8_scanout ;
assign ff_alloc_set_cond_c3_scanin = ff_fill_way_c3_scanout   ;
assign ff_alloc_rst_cond_c3_scanin = ff_alloc_set_cond_c3_scanout;
assign scan_out                  = ff_alloc_rst_cond_c3_scanout;
// fixscan end:
endmodule 


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_vuad_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





assign dout[1:0] = ( {2{sel0}} & din0[1:0] ) |
                       ( {2{sel1}} & din1[1:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_vuad_ctl_msff_ctl_macro__width_2 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_vuad_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_1 (
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





assign dout[0:0] = ( {1{sel0}} & din0[0:0] ) |
                       ( {1{sel1}} & din1[0:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_vuad_ctl_msff_ctl_macro__width_1 (
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

module l2t_vuad_ctl_l1clkhdr_ctl_macro (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module l2t_vuad_ctl_spare_ctl_macro__num_4 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));
assign scan_out = so_3;



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_vuad_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_9 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [8:0] din0;
  input sel0;
  input [8:0] din1;
  input sel1;
  output [8:0] dout;





assign dout[8:0] = ( {9{sel0}} & din0[8:0] ) |
                       ( {9{sel1}} & din1[8:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_vuad_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_vuad_ctl_msff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule








