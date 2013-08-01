// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_deccck_ctl.v
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
module l2t_deccck_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tag_deccck_addr3_c7, 
  arb_inst_l2data_vld_c6, 
  tag_data_ecc_active_c3, 
  bist_data_enable_c1, 
  bist_data_waddr_c1, 
  arbadr_arbdp_addr22_c7, 
  arbadr_arbdp_waddr_c6, 
  deccck_bscd_corr_err_c8, 
  deccck_bscd_uncorr_err_c8, 
  deccck_bscd_notdata_err_c8, 
  deccck_spcd_corr_err_c8, 
  deccck_spcd_uncorr_err_c8, 
  deccck_spcd_notdata_err_c8, 
  deccck_scrd_corr_err_c8, 
  deccck_scrd_uncorr_err_c8, 
  deccck_spcfb_corr_err_c8, 
  deccck_spcfb_uncorr_err_c8, 
  deccck_uncorr_err_c8, 
  deccck_corr_err_c8, 
  deccck_notdata_err_c8, 
  deccdp_decck_uncorr_err_c7, 
  deccdp_decck_corr_err_c7, 
  tag_spc_rd_vld_c6, 
  tag_bsc_rd_vld_c7, 
  tag_scrub_rd_vld_c7, 
  filbuf_spc_corr_err_c6, 
  filbuf_spc_uncorr_err_c6, 
  filbuf_spc_rd_vld_c6, 
  deccck_dword_sel_c7, 
  deccck_muxsel_diag_out_c7, 
  arbadr_arbdp_line_addr_c7, 
  arbadr_arbdp_line_addr_c6, 
  l2clk, 
  scan_in, 
  scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire ff_bist_en_c2_scanin;
wire ff_bist_en_c2_scanout;
wire ff_bist_en_c3_scanin;
wire ff_bist_en_c3_scanout;
wire ff_bist_en_c4_scanin;
wire ff_bist_en_c4_scanout;
wire ff_bist_en_c5_scanin;
wire ff_bist_en_c5_scanout;
wire ff_bist_en_c52_scanin;
wire ff_bist_en_c52_scanout;
wire ff_bist_en_c6_scanin;
wire ff_bist_en_c6_scanout;
wire ff_bist_waddr_c2_scanin;
wire ff_bist_waddr_c2_scanout;
wire ff_bist_waddr_c3_scanin;
wire ff_bist_waddr_c3_scanout;
wire ff_bist_waddr_c4_scanin;
wire ff_bist_waddr_c4_scanout;
wire ff_bist_waddr_c5_scanin;
wire ff_bist_waddr_c5_scanout;
wire ff_bist_waddr_c52_scanin;
wire ff_bist_waddr_c52_scanout;
wire ff_bist_waddr_c6_scanin;
wire ff_bist_waddr_c6_scanout;
wire ff_misc_terms_scanin;
wire ff_misc_terms_scanout;
wire tag_spc_rd_vld_c7;
wire filbuf_spc_rd_vld_c7;
wire filbuf_spc_corr_err_c7;
wire filbuf_spc_uncorr_err_c7;
wire ff_spc_rd_vld_c8_scanin;
wire ff_spc_rd_vld_c8_scanout;
wire ff_deccck_scrd_corr_err_c8_scanin;
wire ff_deccck_scrd_corr_err_c8_scanout;
wire ff_deccck_scrd_uncorr_err_c8_scanin;
wire ff_deccck_scrd_uncorr_err_c8_scanout;
wire ff_filbuf_spc_rd_vld_c8_scanin;
wire ff_filbuf_spc_rd_vld_c8_scanout;
wire ff_filbuf_spc_corr_err_c8_scanin;
wire ff_filbuf_spc_corr_err_c8_scanout;
wire ff_filbuf_spc_uncorr_err_c8_scanin;
wire ff_filbuf_spc_uncorr_err_c8_scanout;
wire ff_bsc_rd_vld_c8_scanin;
wire ff_bsc_rd_vld_c8_scanout;
wire ff_waddr_c7_scanin;
wire ff_waddr_c7_scanout;
wire data_ecc_active_c4;
wire ff_deccck_active_c4_scanin;
wire ff_deccck_active_c4_scanout;
wire data_ecc_active_c5;
wire ff_deccck_active_c5_scanin;
wire ff_deccck_active_c5_scanout;
wire data_ecc_active_c52;
wire ff_deccck_active_c52_scanin;
wire ff_deccck_active_c52_scanout;
wire data_ecc_active_c6;
wire ff_deccck_active_c6_scanin;
wire ff_deccck_active_c6_scanout;
wire data_ecc_active_c7;
wire ff_deccck_active_c7_scanin;
wire ff_deccck_active_c7_scanout;
wire diag_data_vld_c7;
wire ff_diag_data_vld_c7_scanin;
wire ff_diag_data_vld_c7_scanout;
wire [3:0] deccck_muxsel_diag_out_c6;
wire ff_deccck_muxsel_diag_out_c7_scanin;
wire ff_deccck_muxsel_diag_out_c7_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
input	tag_deccck_addr3_c7; 
input	arb_inst_l2data_vld_c6; 
input	tag_data_ecc_active_c3; 
 
input	bist_data_enable_c1; 
input	[1:0]	bist_data_waddr_c1; 
input	arbadr_arbdp_addr22_c7; 
input	[1:0]	arbadr_arbdp_waddr_c6; 
 
//input	csr_error_ceen ;  // Correctable error enables 
//input	csr_error_nceen ; // Uncorrectable error enables 
 
 
 
output          deccck_bscd_corr_err_c8 ;    // siu data 
output          deccck_bscd_uncorr_err_c8 ;  // siu data 
output          deccck_bscd_notdata_err_c8;  // siu data

output          deccck_spcd_corr_err_c8 ;    // spc data 
output          deccck_spcd_uncorr_err_c8 ;  // spc data 
output          deccck_spcd_notdata_err_c8;  // spc data
output          deccck_scrd_corr_err_c8 ;    // scrub 
output          deccck_scrd_uncorr_err_c8 ;  // scrub 
output          deccck_spcfb_corr_err_c8 ;   // spc data from fb 
output          deccck_spcfb_uncorr_err_c8 ; // spc data from fb 

//output          deccck_uncorr_err_c8;        // an uncorr err has happenned Unqual 
//output          deccck_corr_err_c8;          // a correctable err has happened
//output		deccck_notdata_err_c8;       // a notdata err has happened

input		deccck_uncorr_err_c8;        // an uncorr err has happenned Unqual
input		deccck_corr_err_c8;        // a correctable err has happened
input		deccck_notdata_err_c8;        // a notdata err has happened

//input		data_uncorr_err_c7;        // an uncorr err has happenned Unqual
//input		data_corr_err_c7;        // a correctable err has happened
//input		data_notdata_err_c7;        // a notdata err has happened

input	[3:0]	deccdp_decck_uncorr_err_c7;        // an uncorr err has happenned Unqual
input	[3:0]	deccdp_decck_corr_err_c7;        // a correctable err has happened
//input	[3:0]	deccck_notdata_err_c7;        // a notdata err has happened

//input           tag_spc_rd_vld_c7 ;   // input for err classification 
input           tag_spc_rd_vld_c6 ;   // input for err classification 
input		tag_bsc_rd_vld_c7; // NEW_PIN 
input           tag_scrub_rd_vld_c7 ; // input for err classification 
 
//input           filbuf_spc_corr_err_c7;	// indicates that an corr err was  
//                                        // received from the DRAM 
//input           filbuf_spc_uncorr_err_c7; // indicates that an uncorr err was  
//					// received from the DRAM 
//input           filbuf_spc_rd_vld_c7; // indicates that an FB read is active for a  
//				     // sparc instruction 

input           filbuf_spc_corr_err_c6;
input           filbuf_spc_uncorr_err_c6;
input           filbuf_spc_rd_vld_c6;
 
 
//output		deccck_sel_higher_dword_c7; 
output		deccck_dword_sel_c7; 

output   [3:0] deccck_muxsel_diag_out_c7;
 
//output	[2:0]	deccck_ret_err_c8; 
//output	[2:0]	deccck_ret_err_c7; 

output	[5:4]	arbadr_arbdp_line_addr_c7;
input	[5:4]	arbadr_arbdp_line_addr_c6;
 
input		l2clk; 
input scan_in;
output scan_out; 
 
// from deccckdp. 
//input	[5:0]	decc_check0_c7;
//input   [5:0]   decc_check1_c7;
//input   [5:0]   decc_check2_c7;
//input   [5:0]   decc_check3_c7;
//input		decc_parity0_c7;
//input           decc_parity1_c7;
//input           decc_parity2_c7;
//input           decc_parity3_c7;
 
 

//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_deccck_ctl_l1clkhdr_ctl_macro clkgen (
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
l2t_deccck_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////



wire	[3:0]	corr_err_c7; 
wire	[3:0]	uncorr_err_c7; 
wire		data_corr_err_c7; 
wire		data_uncorr_err_c7; 
 
wire    [1:0]   bist_data_waddr_c2; 
wire    [1:0]   bist_data_waddr_c3; 
wire    [1:0]   bist_data_waddr_c4; 
wire    [1:0]   bist_data_waddr_c5; 
wire    [1:0]   bist_data_waddr_c52; // BS 03/11/04 extra cycle for mem access
wire    [1:0]   bist_data_waddr_c6; 
 
wire            bist_data_enable_c2; 
wire            bist_data_enable_c3; 
wire            bist_data_enable_c4; 
wire            bist_data_enable_c5; 
wire            bist_data_enable_c52; // BS 03/11/04 extra cycle for mem access
wire            bist_data_enable_c6; 
 
wire            scr_data_corr_err_c7 ; 
wire            scr_data_uncorr_err_c7 ; 
 
 
wire    [2:0]   ret_err_c7 ; 
wire            error_ceen_d1 ; 
wire            error_nceen_d1 ; 
 
 
 
wire    [1:0]   waddr_c7; // 3:2 
wire    [1:0]   diag_addr_c7; 
 
wire            sel_higher_word_c6; 
wire            sel_higher_dword_c6; 
 
wire            sel_bist_c6; 
wire            sel_diag_c7; 
wire            sel_def_c6; 
 
 
wire	data_corr_err_c8, filbuf_spc_rd_vld_c8, filbuf_spc_corr_err_c8; 
wire	spc_rd_vld_c8, bsc_rd_vld_c8; 
wire	filbuf_spc_uncorr_err_c8; 
 
 
 
 
/////////////
//// Bug id 91419
//// to distinguish not data from CE need to qualify it with
//// not notdata
////
//// assign  corr_err_c7[0] =  decc_parity0_c7 ; 
//// assign  corr_err_c7[1] =  decc_parity1_c7 ; 
//// assign  corr_err_c7[2] =  decc_parity2_c7 ; 
//// assign  corr_err_c7[3] =  decc_parity3_c7 ; 
//
//assign  corr_err_c7[0] =  decc_parity0_c7  & ~(decc_check0_c7[5:0] == 6'b111111);
//assign  corr_err_c7[1] =  decc_parity1_c7  & ~(decc_check1_c7[5:0] == 6'b111111);
//assign  corr_err_c7[2] =  decc_parity2_c7  & ~(decc_check2_c7[5:0] == 6'b111111);
//assign  corr_err_c7[3] =  decc_parity3_c7  & ~(decc_check3_c7[5:0] == 6'b111111);
//
//
//
// 
//assign  data_corr_err_c7 =  |( corr_err_c7[3:0] )  ; 
// 
//// BS 06/13/04 added Notdata logic
//// detect Notdata if check bits are all 1's on any 4 byte segment, and it is not a sparc
//// read of the fill buffer before the fill.
// 
//assign  data_notdata_err_c7 = (({decc_parity0_c7,decc_check0_c7[5:0]} == 7'b1111111) |
//                         ({decc_parity1_c7,decc_check1_c7[5:0]} == 7'b1111111) |
//                         ({decc_parity2_c7,decc_check2_c7[5:0]} == 7'b1111111) |
//                         ({decc_parity3_c7,decc_check3_c7[5:0]} == 7'b1111111))
//                              & ~filbuf_spc_rd_vld_c7; 
//
//// in case the Notdata is detected on a sparc read of the Fill buffer itself, should
//// treat it as UE . this is because a UE trap has not been issued yet, as the
//// read of the fill buffer is happening before the fill. 
//
//assign  uncorr_err_c7[0] = (|(decc_check0_c7[5:0]) & ~decc_parity0_c7) |
//                           (({decc_parity0_c7,decc_check0_c7[5:0]} == 7'b1111111) & filbuf_spc_rd_vld_c7) ;
//assign  uncorr_err_c7[1] = (|(decc_check1_c7[5:0]) & ~decc_parity1_c7)  |
//                           (({decc_parity1_c7,decc_check1_c7[5:0]} == 7'b1111111) & filbuf_spc_rd_vld_c7);
//assign  uncorr_err_c7[2] = (|(decc_check2_c7[5:0]) & ~decc_parity2_c7) |
//                           (({decc_parity2_c7,decc_check2_c7[5:0]} == 7'b1111111) & filbuf_spc_rd_vld_c7) ;
//assign  uncorr_err_c7[3] = (|(decc_check3_c7[5:0]) & ~decc_parity3_c7) |
//                           (({decc_parity3_c7,decc_check3_c7[5:0]} == 7'b1111111) & filbuf_spc_rd_vld_c7) ;
//
//assign  data_uncorr_err_c7 =  |(uncorr_err_c7[3:0]) ;
//
// 

assign uncorr_err_c7[3:0] = deccdp_decck_uncorr_err_c7[3:0];
assign corr_err_c7[3:0] = deccdp_decck_corr_err_c7[3:0];

 
l2t_deccck_ctl_msff_ctl_macro__width_3 ff_bist_en_c2 
              (.dout   ({arbadr_arbdp_line_addr_c7[5:4],bist_data_enable_c2}), 
		.scan_in(ff_bist_en_c2_scanin),
		.scan_out(ff_bist_en_c2_scanout),
		.din ({arbadr_arbdp_line_addr_c6[5:4],bist_data_enable_c1}), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_bist_en_c3 
              (.dout   (bist_data_enable_c3), .din (bist_data_enable_c2), 
               .scan_in(ff_bist_en_c3_scanin),
               .scan_out(ff_bist_en_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_bist_en_c4 
              (.dout   (bist_data_enable_c4), .din (bist_data_enable_c3), 
               .scan_in(ff_bist_en_c4_scanin),
               .scan_out(ff_bist_en_c4_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_bist_en_c5 
              (.dout   (bist_data_enable_c5), .din (bist_data_enable_c4), 
               .scan_in(ff_bist_en_c5_scanin),
               .scan_out(ff_bist_en_c5_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 

// BS 03/11/04 extra cycle for mem access

l2t_deccck_ctl_msff_ctl_macro__width_1 ff_bist_en_c52 
              (.dout   (bist_data_enable_c52), .din (bist_data_enable_c5),
               .scan_in(ff_bist_en_c52_scanin),
               .scan_out(ff_bist_en_c52_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ;

l2t_deccck_ctl_msff_ctl_macro__width_1 ff_bist_en_c6 
              (.dout   (bist_data_enable_c6), .din (bist_data_enable_c52), 
               .scan_in(ff_bist_en_c6_scanin),
               .scan_out(ff_bist_en_c6_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
 
 
l2t_deccck_ctl_msff_ctl_macro__width_2 ff_bist_waddr_c2 
              (.dout   (bist_data_waddr_c2[1:0]), .din (bist_data_waddr_c1[1:0]), 
               .scan_in(ff_bist_waddr_c2_scanin),
               .scan_out(ff_bist_waddr_c2_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
l2t_deccck_ctl_msff_ctl_macro__width_2 ff_bist_waddr_c3 
              (.dout   (bist_data_waddr_c3[1:0]), .din (bist_data_waddr_c2[1:0]), 
               .scan_in(ff_bist_waddr_c3_scanin),
               .scan_out(ff_bist_waddr_c3_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ;  
l2t_deccck_ctl_msff_ctl_macro__width_2 ff_bist_waddr_c4 
              (.dout   (bist_data_waddr_c4[1:0]), .din (bist_data_waddr_c3[1:0]), 
               .scan_in(ff_bist_waddr_c4_scanin),
               .scan_out(ff_bist_waddr_c4_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
l2t_deccck_ctl_msff_ctl_macro__width_2 ff_bist_waddr_c5 
              (.dout   (bist_data_waddr_c5[1:0]), .din (bist_data_waddr_c4[1:0]), 
               .scan_in(ff_bist_waddr_c5_scanin),
               .scan_out(ff_bist_waddr_c5_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 

// BS 03/11/04 extra cycle for mem access

l2t_deccck_ctl_msff_ctl_macro__width_2 ff_bist_waddr_c52 
              (.dout   (bist_data_waddr_c52[1:0]), .din (bist_data_waddr_c5[1:0]),
               .scan_in(ff_bist_waddr_c52_scanin),
               .scan_out(ff_bist_waddr_c52_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ;

l2t_deccck_ctl_msff_ctl_macro__width_2 ff_bist_waddr_c6 
              (.dout   (bist_data_waddr_c6[1:0]), .din (bist_data_waddr_c52[1:0]), 
               .scan_in(ff_bist_waddr_c6_scanin),
               .scan_out(ff_bist_waddr_c6_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
 
 
// 
//msff_ctl_macro ff_deccck_uncorr_err_c8 (width=1)
//              (.dout   (deccck_uncorr_err_c8), .din (data_uncorr_err_c7), 
//               .scan_in(ff_deccck_uncorr_err_c8_scanin),
//               .scan_out(ff_deccck_uncorr_err_c8_scanout),
//               .l1clk (l1clk)  
//) ; 

// BS 06/13/04 : added Notdata logic 
// register notdata error bit
//
//msff_ctl_macro ff_deccck_notdata_err_c8 (width=1)
//              (.dout   (deccck_notdata_err_c8), .din (data_notdata_err_c7),
//               .scan_in(ff_deccck_notdata_err_c8_scanin),
//               .scan_out(ff_deccck_notdata_err_c8_scanout),
//               .l1clk (l1clk)
//) ;
// 
// 
//msff_ctl_macro ff_data_corr_err_c8 (width=1)
//		(.dout   (data_corr_err_c8), .din (data_corr_err_c7), 
//               		.scan_in(ff_data_corr_err_c8_scanin),
//               		.scan_out(ff_data_corr_err_c8_scanout),
//               		.l1clk (l1clk)  
//		) ; 
////
//assign deccck_corr_err_c8 = data_corr_err_c8; // BS 03/18/04 : taking out deccck_corr_err_c8 to gate off cas and 
//                                              // swap/ldstub stores updates in case of Correctable Error as part
//                                              // of new requirment for RAS in N2 to retry the atomics on a CE.
//                                              // because of the retry, the update for the store should not happen
//                                              // in L2. 

assign data_corr_err_c8 = deccck_corr_err_c8;


l2t_deccck_ctl_msff_ctl_macro__width_4 ff_misc_terms  
        (
        .scan_in(ff_misc_terms_scanin),
        .scan_out(ff_misc_terms_scanout),
        .dout ({tag_spc_rd_vld_c7,filbuf_spc_rd_vld_c7,filbuf_spc_corr_err_c7,filbuf_spc_uncorr_err_c7}),
        .din  ({tag_spc_rd_vld_c6,filbuf_spc_rd_vld_c6, filbuf_spc_corr_err_c6,filbuf_spc_uncorr_err_c6}),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

l2t_deccck_ctl_msff_ctl_macro__width_1 ff_spc_rd_vld_c8 
		(.dout   (spc_rd_vld_c8), .din (tag_spc_rd_vld_c7), 
               		.scan_in(ff_spc_rd_vld_c8_scanin),
               		.scan_out(ff_spc_rd_vld_c8_scanout),
               		.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
		) ; 
 
assign	deccck_spcd_corr_err_c8 = data_corr_err_c8 & spc_rd_vld_c8; 
assign	deccck_spcd_uncorr_err_c8 = deccck_uncorr_err_c8 & spc_rd_vld_c8; 
assign  deccck_spcd_notdata_err_c8 = deccck_notdata_err_c8 & spc_rd_vld_c8;
 
assign	scr_data_corr_err_c7 = (((corr_err_c7[3] | corr_err_c7[2]) & ~tag_deccck_addr3_c7) | 
				((corr_err_c7[1] | corr_err_c7[0]) & tag_deccck_addr3_c7) 
			) & tag_scrub_rd_vld_c7 ; 
 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_deccck_scrd_corr_err_c8 
              	(.dout   (deccck_scrd_corr_err_c8), .din (scr_data_corr_err_c7), 
               		.scan_in(ff_deccck_scrd_corr_err_c8_scanin),
               		.scan_out(ff_deccck_scrd_corr_err_c8_scanout),
               		.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
		) ; 
 
assign  scr_data_uncorr_err_c7 = (((uncorr_err_c7[3] | uncorr_err_c7[2]) & ~tag_deccck_addr3_c7) | 
                                  ((uncorr_err_c7[1] | uncorr_err_c7[0]) & tag_deccck_addr3_c7) 
                                  ) & tag_scrub_rd_vld_c7 ; 
 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_deccck_scrd_uncorr_err_c8 
              (.dout   (deccck_scrd_uncorr_err_c8), .din (scr_data_uncorr_err_c7), 
               .scan_in(ff_deccck_scrd_uncorr_err_c8_scanin),
               .scan_out(ff_deccck_scrd_uncorr_err_c8_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
 
 
 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_filbuf_spc_rd_vld_c8 
              	(.dout   (filbuf_spc_rd_vld_c8), .din (filbuf_spc_rd_vld_c7), 
               		.scan_in(ff_filbuf_spc_rd_vld_c8_scanin),
               		.scan_out(ff_filbuf_spc_rd_vld_c8_scanout),
               		.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
		) ; 
 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_filbuf_spc_corr_err_c8 
              	(.dout   (filbuf_spc_corr_err_c8), .din (filbuf_spc_corr_err_c7), 
               		.scan_in(ff_filbuf_spc_corr_err_c8_scanin),
               		.scan_out(ff_filbuf_spc_corr_err_c8_scanout),
               		.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
		) ; 
 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_filbuf_spc_uncorr_err_c8 
              	(.dout   (filbuf_spc_uncorr_err_c8), .din (filbuf_spc_uncorr_err_c7), 
               		.scan_in(ff_filbuf_spc_uncorr_err_c8_scanin),
               		.scan_out(ff_filbuf_spc_uncorr_err_c8_scanout),
               		.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
		) ; 
 
assign	deccck_spcfb_corr_err_c8    = (data_corr_err_c8 & filbuf_spc_rd_vld_c8) |   
				filbuf_spc_corr_err_c8; 
 
 
assign	deccck_spcfb_uncorr_err_c8    = (deccck_uncorr_err_c8 & filbuf_spc_rd_vld_c8) |   
				filbuf_spc_uncorr_err_c8; 
 
 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_bsc_rd_vld_c8 
              	(.dout   (bsc_rd_vld_c8), .din (tag_bsc_rd_vld_c7), 
               		.scan_in(ff_bsc_rd_vld_c8_scanin),
               		.scan_out(ff_bsc_rd_vld_c8_scanout),
               		.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
 
		) ; 
 
assign	deccck_bscd_corr_err_c8  = data_corr_err_c8 & bsc_rd_vld_c8; 
 
assign	deccck_bscd_uncorr_err_c8  = deccck_uncorr_err_c8 & bsc_rd_vld_c8; 

assign  deccck_bscd_notdata_err_c8 = deccck_notdata_err_c8 & bsc_rd_vld_c8;
 
 
 
 
 
// csr_error_ceen and csr_error_nceen are the register bits for enabling the reporting 
// of the correctable and uncorrectable error respectively. 
// 
//msff_ctl_macro ff_error_ceen_d1 (width=1)
//              (.dout   (error_ceen_d1), .din (csr_error_ceen), 
//               .scan_in(ff_error_ceen_d1_scanin),
//               .scan_out(ff_error_ceen_d1_scanout),
//               .l1clk (l1clk),  
//) ; 
// 
//msff_ctl_macro ff_error_nceen_d1 (width=1)
//              (.dout   (error_nceen_d1), .din (csr_error_nceen),
//               .scan_in(ff_error_nceen_d1_scanin),
//               .scan_out(ff_error_nceen_d1_scanout),
//               .l1clk (l1clk)
//) ; 
// 
 
// only precise error reporting is handled here. 
//
//assign  ret_err_c7[0] = ((data_corr_err_c7 | filbuf_spc_corr_err_c7)   &
//                        ( ( tag_spc_rd_vld_c7 | filbuf_spc_rd_vld_c7 |
//                        filbuf_spc_corr_err_c7 ) & error_ceen_d1 )) |
//                        (data_notdata_err_c7 & tag_spc_rd_vld_c7 & error_nceen_d1); 
//                                       // Notdata encoding is err[1:0] = 2'b11
// 
//assign  ret_err_c7[1] = ((data_uncorr_err_c7 | filbuf_spc_uncorr_err_c7)   & 
//			( ( tag_spc_rd_vld_c7 | filbuf_spc_rd_vld_c7 | 
//			filbuf_spc_uncorr_err_c7 ) & error_nceen_d1 )) |
//                        (data_notdata_err_c7 & tag_spc_rd_vld_c7 & error_nceen_d1); 
//                                 // Notdata encoding is err[1:0] = 2'b11
// 
// 
//
//assign  ret_err_c7_uece[0] = ((data_corr_err_c7 | filbuf_spc_corr_err_c7)   &
//                        ((tag_spc_rd_vld_c7 | filbuf_spc_rd_vld_c7 | filbuf_spc_corr_err_c7 )
//			 & error_ceen_d1 )); 
//
//assign  ret_err_c7_uece[1] = ((data_uncorr_err_c7 | filbuf_spc_uncorr_err_c7)   &
//                      ((tag_spc_rd_vld_c7 | filbuf_spc_rd_vld_c7 | filbuf_spc_uncorr_err_c7 ) 
//			 & error_nceen_d1 )) ;
//
//assign ret_err_c7_nd[0] = (data_notdata_err_c7 & tag_spc_rd_vld_c7 & error_nceen_d1);
//assign ret_err_c7_nd[1] = (data_notdata_err_c7 & tag_spc_rd_vld_c7 & error_nceen_d1);
//
//assign ret_err_c7[0] = (ret_err_c7_uece[0] & ~ret_err_c7_uece[1]) | ret_err_c7_nd[0];
//assign ret_err_c7[1] =  ret_err_c7_uece[1] | ret_err_c7_nd[0];
// 
//assign  ret_err_c7[2] = 1'b0 ;  // RSVD 
//
//msff_ctl_macro ff_ret_err_c8 (width=3)
//              (.dout   (deccck_ret_err_c8[2:0]), .din (ret_err_c7[2:0]), 
//               .scan_in(ff_ret_err_c8_scanin),
//               .scan_out(ff_ret_err_c8_scanout),
//               .l1clk (l1clk)
//                
//) ; 
// 
// 
//assign deccck_ret_err_c7[2:0] = ret_err_c7[2:0] ;
// 
 
////////////////////////////////////////////////////////////////////////// 
// 
// data that is xmitted to the arbdat block 
// The following 2-1 mUX is used for psts. 
// In C6, the data is merged with partial dirty data and written into 
// the Miss Buffer. 
// arbadr_arbdp_waddr_c6[1:0] is the Address bit[3:2] of the regular instruction. 
// "arbdp_addr22_c7" is the Address Bit[22] of the Diagnostic access. 
// It is equivalent to the address bit[2] for the diagnostic access and is 
// used for selecting 32 bit out of 128 bit read from the L2$ data array. 
// 
////////////////////////////////////////////////////////////////////////// 
 
// arbadr_arbdp_waddr_c6[1:0] is the Address bit[3:2] of the regular instruction. 
l2t_deccck_ctl_msff_ctl_macro__width_2 ff_waddr_c7 
              (.dout   (waddr_c7[1:0]), 
               .scan_in(ff_waddr_c7_scanin),
               .scan_out(ff_waddr_c7_scanout),
               .din (arbadr_arbdp_waddr_c6[1:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign diag_addr_c7 = {waddr_c7[1], arbadr_arbdp_addr22_c7} ; 
 
 
 
// Address bit[3] of Scrub instruction, used for selecting 64 bit out of 
// 128 bit read from the L2$ data array. 
 
 
 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_deccck_active_c4 
              (.dout   (data_ecc_active_c4), 
               .scan_in(ff_deccck_active_c4_scanin),
               .scan_out(ff_deccck_active_c4_scanout),
               .din (tag_data_ecc_active_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_deccck_active_c5 
              (.dout   (data_ecc_active_c5), 
               .scan_in(ff_deccck_active_c5_scanin),
               .scan_out(ff_deccck_active_c5_scanout),
               .din (data_ecc_active_c4), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 

// BS 03/11/04 extra cycle for mem access

l2t_deccck_ctl_msff_ctl_macro__width_1 ff_deccck_active_c52 
              (.dout   (data_ecc_active_c52),
               .scan_in(ff_deccck_active_c52_scanin),
               .scan_out(ff_deccck_active_c52_scanout),
               .din (data_ecc_active_c5),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
                

              ) ;

l2t_deccck_ctl_msff_ctl_macro__width_1 ff_deccck_active_c6 
              (.dout   (data_ecc_active_c6), 
               .scan_in(ff_deccck_active_c6_scanin),
               .scan_out(ff_deccck_active_c6_scanout),
               .din (data_ecc_active_c52), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_deccck_active_c7 
              (.dout   (data_ecc_active_c7), 
               .scan_in(ff_deccck_active_c7_scanin),
               .scan_out(ff_deccck_active_c7_scanout),
               .din (data_ecc_active_c6), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign deccck_dword_sel_c7 = (diag_addr_c7[1] & ~data_ecc_active_c7)  
		| tag_deccck_addr3_c7 ; 
 
// the following data muxes are used for 
//  1. diagnostic accesses to l2data 
//  2. tap reads to DRAm addresses. 
//  3. bist accesses to l2data. 
// these operation need 39 bit data out of the 156 bit read from the L2 array, 
// so the data needs to be muxed 4:1. The 4to1 muxing is mbist_done in two stages 
// of 2to1 muxing using the address bit[3:2] as the select signals. 
 
l2t_deccck_ctl_msff_ctl_macro__width_1 ff_diag_data_vld_c7 
		(.dout   (diag_data_vld_c7), .din (arb_inst_l2data_vld_c6),  
		.scan_in(ff_diag_data_vld_c7_scanin),
		.scan_out(ff_diag_data_vld_c7_scanout),
		.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
 
 
assign	sel_bist_c6 = bist_data_enable_c6 ; 
assign	sel_diag_c7 = diag_data_vld_c7  & ~bist_data_enable_c6 ; 
assign	sel_def_c6  = ~diag_data_vld_c7 & ~bist_data_enable_c6 ; 
 
assign  sel_higher_word_c6 = (diag_addr_c7[0]       & sel_diag_c7) | 
                             (bist_data_waddr_c6[0] & sel_bist_c6) | 
                             (arbadr_arbdp_waddr_c6[0]     & sel_def_c6) ; 

 
 
 
assign  sel_higher_dword_c6 = (diag_addr_c7[1]       & sel_diag_c7) | 
                              (bist_data_waddr_c6[1] & sel_bist_c6) | 
                              (arbadr_arbdp_waddr_c6[1]     & sel_def_c6) ; 
 
//msff_ctl_macro ff_sel_higher_dword_c7 (width=1)
//              (.dout   (deccck_sel_higher_dword_c7), .din (sel_higher_dword_c6), 
//               .scan_in(ff_sel_higher_dword_c7_scanin),
//               .scan_out(ff_sel_higher_dword_c7_scanout),
//               .l1clk (l1clk),  
//) ; 



assign      deccck_muxsel_diag_out_c6[0] = ~sel_higher_word_c6   & ~sel_higher_dword_c6;
assign      deccck_muxsel_diag_out_c6[1] =  sel_higher_word_c6   & ~sel_higher_dword_c6;
assign      deccck_muxsel_diag_out_c6[2] = ~sel_higher_word_c6   &  sel_higher_dword_c6;
assign      deccck_muxsel_diag_out_c6[3] =  sel_higher_word_c6   &  sel_higher_dword_c6;


l2t_deccck_ctl_msff_ctl_macro__width_4 ff_deccck_muxsel_diag_out_c7 
              	(
		.scan_in(ff_deccck_muxsel_diag_out_c7_scanin),
		.scan_out(ff_deccck_muxsel_diag_out_c7_scanout),
		.dout (deccck_muxsel_diag_out_c7[3:0]), 
		.din (deccck_muxsel_diag_out_c6[3:0]),
                .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
		) ; 

 
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign ff_bist_en_c2_scanin      = spares_scanout           ;
assign ff_bist_en_c3_scanin      = ff_bist_en_c2_scanout    ;
assign ff_bist_en_c4_scanin      = ff_bist_en_c3_scanout    ;
assign ff_bist_en_c5_scanin      = ff_bist_en_c4_scanout    ;
assign ff_bist_en_c52_scanin     = ff_bist_en_c5_scanout    ;
assign ff_bist_en_c6_scanin      = ff_bist_en_c52_scanout   ;
assign ff_bist_waddr_c2_scanin   = ff_bist_en_c6_scanout    ;
assign ff_bist_waddr_c3_scanin   = ff_bist_waddr_c2_scanout ;
assign ff_bist_waddr_c4_scanin   = ff_bist_waddr_c3_scanout ;
assign ff_bist_waddr_c5_scanin   = ff_bist_waddr_c4_scanout ;
assign ff_bist_waddr_c52_scanin  = ff_bist_waddr_c5_scanout ;
assign ff_bist_waddr_c6_scanin   = ff_bist_waddr_c52_scanout;
assign ff_misc_terms_scanin      = ff_bist_waddr_c6_scanout ;
assign ff_spc_rd_vld_c8_scanin   = ff_misc_terms_scanout    ;
assign ff_deccck_scrd_corr_err_c8_scanin = ff_spc_rd_vld_c8_scanout ;
assign ff_deccck_scrd_uncorr_err_c8_scanin = ff_deccck_scrd_corr_err_c8_scanout;
assign ff_filbuf_spc_rd_vld_c8_scanin = ff_deccck_scrd_uncorr_err_c8_scanout;
assign ff_filbuf_spc_corr_err_c8_scanin = ff_filbuf_spc_rd_vld_c8_scanout;
assign ff_filbuf_spc_uncorr_err_c8_scanin = ff_filbuf_spc_corr_err_c8_scanout;
assign ff_bsc_rd_vld_c8_scanin   = ff_filbuf_spc_uncorr_err_c8_scanout;
assign ff_waddr_c7_scanin        = ff_bsc_rd_vld_c8_scanout ;
assign ff_deccck_active_c4_scanin = ff_waddr_c7_scanout      ;
assign ff_deccck_active_c5_scanin = ff_deccck_active_c4_scanout;
assign ff_deccck_active_c52_scanin = ff_deccck_active_c5_scanout;
assign ff_deccck_active_c6_scanin = ff_deccck_active_c52_scanout;
assign ff_deccck_active_c7_scanin = ff_deccck_active_c6_scanout;
assign ff_diag_data_vld_c7_scanin = ff_deccck_active_c7_scanout;
assign ff_deccck_muxsel_diag_out_c7_scanin = ff_diag_data_vld_c7_scanout;
assign scan_out                  = ff_deccck_muxsel_diag_out_c7_scanout;
// fixscan end:
endmodule 







// any PARAMS parms go into naming of macro

module l2t_deccck_ctl_l1clkhdr_ctl_macro (
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


module l2t_deccck_ctl_spare_ctl_macro__num_4 (
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






// any PARAMS parms go into naming of macro

module l2t_deccck_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_deccck_ctl_msff_ctl_macro__width_1 (
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

module l2t_deccck_ctl_msff_ctl_macro__width_2 (
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

module l2t_deccck_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule








