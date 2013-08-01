// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: spc_rep1_dp.v
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
module spc_rep1_dp (
  exu_address0_e, 
  exu_address1_e, 
  exu_address0_e_rep0, 
  exu_address1_e_rep0, 
  exu_address0_e_rep01, 
  exu_address1_e_rep01, 
  fgu_exu_result_fx5, 
  fgu_exu_result_fx5_rep0, 
  fgu_exu_result_fx5_rep1, 
  lsu_exu_ld_data_b, 
  lsu_exu_ld_data_b_rep00, 
  lsu_exu_ld_data_b_rep01, 
  fgu_cecc_fx2, 
  fgu_uecc_fx2, 
  fgu_cecc_fx2_rep1, 
  fgu_uecc_fx2_rep1, 
  pce_ov, 
  spc_aclk, 
  spc_bclk, 
  spc_aclk_wmr, 
  lb_scan_en, 
  scan_in, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  rst_wmr_protect, 
  dmo_dcmuxctl, 
  hver_mask_minor_rev, 
  scan_out, 
  tcu_shscan_pce_ov, 
  tcu_shscan_aclk, 
  tcu_shscan_bclk, 
  tcu_shscan_scan_in, 
  tcu_shscan_scan_en, 
  spc_shscan_scan_out, 
  cluster_arst_l, 
  tcu_spc_mbist_scan_in, 
  tcu_spc_mbist_start_ff, 
  spc_mbist_fail, 
  spc_mbist_done, 
  spc_tcu_mbist_scan_out, 
  tcu_spc_lbist_start, 
  tcu_spc_lbist_scan_in, 
  tcu_spc_lbist_pgm, 
  tcu_spc_test_mode, 
  spc_tcu_lbist_done, 
  spc_tcu_lbist_scan_out, 
  scan_in_buf, 
  tcu_pce_ov_buf, 
  tcu_aclk_buf, 
  tcu_bclk_buf, 
  tcu_dectest_buf, 
  tcu_muxtest_buf, 
  tcu_scan_en_buf, 
  tcu_array_wr_inhibit_buf, 
  tcu_se_scancollar_in_buf, 
  tcu_se_scancollar_out_buf, 
  rst_wmr_protect_buf, 
  dmo_dcmuxctl_buf, 
  hver_mask_minor_rev_buf, 
  scan_out_buf, 
  tcu_shscan_pce_ov_buf, 
  tcu_shscan_aclk_buf, 
  tcu_shscan_bclk_buf, 
  tcu_shscan_scan_in_buf, 
  tcu_shscan_scan_en_buf, 
  spc_shscan_scan_out_buf, 
  cluster_arst_l_buf, 
  tcu_spc_mbist_scan_in_buf, 
  tcu_spc_mbist_start_buf0, 
  spc_mbist_fail_ff, 
  spc_mbist_done_ff, 
  spc_tcu_mbist_scan_out_buf, 
  tcu_spc_lbist_start_buf, 
  tcu_spc_lbist_scan_in_buf, 
  tcu_spc_lbist_pgm_buf, 
  tcu_spc_test_mode_buf, 
  lb_lbist_done, 
  spc_tcu_lbist_scan_out_buf, 
  ftu_instr_0_c, 
  ftu_instr_1_c, 
  ftu_instr_2_c, 
  ftu_instr_3_c, 
  ftu_instr_exceptions_c, 
  ftu_instr_0_c_rep0, 
  ftu_instr_0_c_rep1, 
  ftu_instr_0_c_rep2, 
  ftu_instr_0_c_rep3, 
  ftu_instr_1_c_rep0, 
  ftu_instr_1_c_rep1, 
  ftu_instr_1_c_rep2, 
  ftu_instr_1_c_rep3, 
  ftu_instr_2_c_rep0, 
  ftu_instr_2_c_rep1, 
  ftu_instr_2_c_rep2, 
  ftu_instr_2_c_rep3, 
  ftu_instr_3_c_rep0, 
  ftu_instr_3_c_rep1, 
  ftu_instr_3_c_rep2, 
  ftu_instr_3_c_rep3, 
  ftu_instr_0_exceptions_c_rep0, 
  ftu_instr_0_exceptions_c_rep1, 
  ftu_instr_0_exceptions_c_rep2, 
  ftu_instr_0_exceptions_c_rep3, 
  ftu_instr_1_exceptions_c_rep0, 
  ftu_instr_1_exceptions_c_rep1, 
  ftu_instr_1_exceptions_c_rep2, 
  ftu_instr_1_exceptions_c_rep3, 
  ftu_instr_2_exceptions_c_rep0, 
  ftu_instr_2_exceptions_c_rep1, 
  ftu_instr_2_exceptions_c_rep2, 
  ftu_instr_2_exceptions_c_rep3, 
  ftu_instr_3_exceptions_c_rep0, 
  ftu_instr_3_exceptions_c_rep1, 
  ftu_instr_3_exceptions_c_rep2, 
  ftu_instr_3_exceptions_c_rep3, 
  pce_ov_tl, 
  spc_aclk_tl, 
  spc_bclk_tl, 
  spc_aclk_wmr_tl, 
  lb_scan_en_tl, 
  pce_ov_tr, 
  spc_aclk_tr, 
  spc_bclk_tr, 
  spc_aclk_wmr_tr, 
  lb_scan_en_tr, 
  pce_ov_bl, 
  spc_aclk_bl, 
  spc_bclk_bl, 
  spc_aclk_wmr_bl, 
  lb_scan_en_bl, 
  pce_ov_br, 
  spc_aclk_br, 
  spc_bclk_br, 
  spc_aclk_wmr_br, 
  lb_scan_en_br, 
  dec_spu_grant_d, 
  dec_spu_grant_d_rep0);
wire fgu_cecc_fx2_rep0;
wire fgu_uecc_fx2_rep0;


input	[47:0]	exu_address0_e;
input	[47:0]	exu_address1_e;

output	[47:0]	exu_address0_e_rep0;
output	[47:0]	exu_address1_e_rep0;
output	[47:0]	exu_address0_e_rep01;
output	[47:0]	exu_address1_e_rep01;

input	[63:0]	fgu_exu_result_fx5;
output	[63:0]	fgu_exu_result_fx5_rep0;
output	[63:0]	fgu_exu_result_fx5_rep1;

input	[63:0]	lsu_exu_ld_data_b;
output	[63:0]	lsu_exu_ld_data_b_rep00;
output	[63:0]	lsu_exu_ld_data_b_rep01;

input		fgu_cecc_fx2;
input		fgu_uecc_fx2;
output		fgu_cecc_fx2_rep1;
output		fgu_uecc_fx2_rep1;

// high-fanout nets that need buffering
input 	     pce_ov;  		// from cluster header
input        spc_aclk;		// from cluster header
input 	     spc_bclk;		// from cluster header
input 	     spc_aclk_wmr;	// from cluster header
input	     lb_scan_en;	// from spc_lb_ctl


// Next few are primary I/O's needing buffers and/or flops
input  [1:0] scan_in;       	
input 	     tcu_pce_ov;	
input 	     tcu_aclk;		
input 	     tcu_bclk;		
input 	     tcu_dectest;	
input 	     tcu_muxtest;	
input 	     tcu_scan_en;	
input        tcu_array_wr_inhibit;	
input        tcu_se_scancollar_in;	
input        tcu_se_scancollar_out;	
input        rst_wmr_protect;		

input		dmo_dcmuxctl;
input	[3:0]	hver_mask_minor_rev;

output [1:0] scan_out;	    	

// shadow scan signals
input		tcu_shscan_pce_ov;	
input		tcu_shscan_aclk;	
input		tcu_shscan_bclk;	
input		tcu_shscan_scan_in;	
input		tcu_shscan_scan_en;	
output		spc_shscan_scan_out;	

// From RST
input		cluster_arst_l;		

// MBIST signals
input           tcu_spc_mbist_scan_in;	
input           tcu_spc_mbist_start_ff;	// input flop + buffer
output		spc_mbist_fail;		// flop + output buffer
output          spc_mbist_done;		// flop + output buffer
output          spc_tcu_mbist_scan_out;	

// Logic BIST signals
input           tcu_spc_lbist_start;    // buffer
input           tcu_spc_lbist_scan_in;  
input           tcu_spc_lbist_pgm;      
input           tcu_spc_test_mode;      

output          spc_tcu_lbist_done;     // output buffer
output          spc_tcu_lbist_scan_out; 

// and the I/O from the internals of SPC for these signals

output [1:0] 	scan_in_buf;       	
output 	     	tcu_pce_ov_buf;	
output 	     	tcu_aclk_buf;		
output 	     	tcu_bclk_buf;		
output 	     	tcu_dectest_buf;	
output 	     	tcu_muxtest_buf;	
output 	     	tcu_scan_en_buf;	
output       	tcu_array_wr_inhibit_buf;	
output       	tcu_se_scancollar_in_buf;	
output       	tcu_se_scancollar_out_buf;	
output       	rst_wmr_protect_buf;		

output		dmo_dcmuxctl_buf;
output	[3:0]	hver_mask_minor_rev_buf;

input  [1:0]  	scan_out_buf;	    	

// shadow scan signals
output		tcu_shscan_pce_ov_buf;	
output		tcu_shscan_aclk_buf;	
output		tcu_shscan_bclk_buf;	
output		tcu_shscan_scan_in_buf;	
output		tcu_shscan_scan_en_buf;	
input		spc_shscan_scan_out_buf;	

// From RST
output		cluster_arst_l_buf;		

// MBIST signals
output           tcu_spc_mbist_scan_in_buf;	
output           tcu_spc_mbist_start_buf0;	
input 		 spc_mbist_fail_ff;		
input            spc_mbist_done_ff;		
input            spc_tcu_mbist_scan_out_buf;	

// Logic BIST signals
output           tcu_spc_lbist_start_buf;    
output           tcu_spc_lbist_scan_in_buf;  
output           tcu_spc_lbist_pgm_buf;      
output           tcu_spc_test_mode_buf;      

input 		 lb_lbist_done;
input            spc_tcu_lbist_scan_out_buf; 

/////////////////////////////////////////////////////////
// Added the following for ifu_ftu                     //
/////////////////////////////////////////////////////////
input [32:0] ftu_instr_0_c ;
input [32:0] ftu_instr_1_c ;
input [32:0] ftu_instr_2_c ;
input [32:0] ftu_instr_3_c ;

input  [4:0]  ftu_instr_exceptions_c;

output [32:0] ftu_instr_0_c_rep0 ;
output [32:0] ftu_instr_0_c_rep1 ;
output [32:0] ftu_instr_0_c_rep2 ;
output [32:0] ftu_instr_0_c_rep3 ;
output [32:0] ftu_instr_1_c_rep0 ;
output [32:0] ftu_instr_1_c_rep1 ;
output [32:0] ftu_instr_1_c_rep2 ;
output [32:0] ftu_instr_1_c_rep3 ;
output [32:0] ftu_instr_2_c_rep0 ;
output [32:0] ftu_instr_2_c_rep1 ;
output [32:0] ftu_instr_2_c_rep2 ;
output [32:0] ftu_instr_2_c_rep3 ;
output [32:0] ftu_instr_3_c_rep0 ;
output [32:0] ftu_instr_3_c_rep1 ;
output [32:0] ftu_instr_3_c_rep2 ;
output [32:0] ftu_instr_3_c_rep3 ;

output  [4:0]  ftu_instr_0_exceptions_c_rep0;
output  [4:0]  ftu_instr_0_exceptions_c_rep1;
output  [4:0]  ftu_instr_0_exceptions_c_rep2;
output  [4:0]  ftu_instr_0_exceptions_c_rep3;

output  [4:0]  ftu_instr_1_exceptions_c_rep0;
output  [4:0]  ftu_instr_1_exceptions_c_rep1;
output  [4:0]  ftu_instr_1_exceptions_c_rep2;
output  [4:0]  ftu_instr_1_exceptions_c_rep3;

output  [4:0]  ftu_instr_2_exceptions_c_rep0;
output  [4:0]  ftu_instr_2_exceptions_c_rep1;
output  [4:0]  ftu_instr_2_exceptions_c_rep2;
output  [4:0]  ftu_instr_2_exceptions_c_rep3;

output  [4:0]  ftu_instr_3_exceptions_c_rep0;
output  [4:0]  ftu_instr_3_exceptions_c_rep1;
output  [4:0]  ftu_instr_3_exceptions_c_rep2;
output  [4:0]  ftu_instr_3_exceptions_c_rep3;


output pce_ov_tl;
output spc_aclk_tl;
output spc_bclk_tl;
output spc_aclk_wmr_tl;
output lb_scan_en_tl;

output pce_ov_tr;
output spc_aclk_tr;
output spc_bclk_tr;
output spc_aclk_wmr_tr;
output lb_scan_en_tr;

output pce_ov_bl;
output spc_aclk_bl;
output spc_bclk_bl;
output spc_aclk_wmr_bl;
output lb_scan_en_bl;

output pce_ov_br;
output spc_aclk_br;
output spc_bclk_br;
output spc_aclk_wmr_br;
output lb_scan_en_br;


////////////// END ifu_ftu /////////////////////////////////////

// dec -> spu_mct_ctl
input		dec_spu_grant_d;
output		dec_spu_grant_d_rep0;

spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__vertical_1__width_37 chip_io_rep0  (
  .din ({scan_in[1:0], tcu_pce_ov, tcu_aclk, tcu_bclk, tcu_dectest, tcu_muxtest, tcu_scan_en, tcu_array_wr_inhibit,
         tcu_se_scancollar_in, tcu_se_scancollar_out, rst_wmr_protect, scan_out_buf[1:0], tcu_shscan_pce_ov, 
         tcu_shscan_aclk, tcu_shscan_bclk, tcu_shscan_scan_in, tcu_shscan_scan_en, spc_shscan_scan_out_buf,
         cluster_arst_l, tcu_spc_mbist_scan_in, tcu_spc_mbist_start_ff, spc_mbist_fail_ff,
         spc_mbist_done_ff, spc_tcu_mbist_scan_out_buf, tcu_spc_lbist_start, tcu_spc_lbist_scan_in, tcu_spc_lbist_pgm, 
         tcu_spc_test_mode, lb_lbist_done, spc_tcu_lbist_scan_out_buf, dmo_dcmuxctl, hver_mask_minor_rev[3:0]}),

  .dout ({scan_in_buf[1:0], tcu_pce_ov_buf, tcu_aclk_buf, tcu_bclk_buf, tcu_dectest_buf, tcu_muxtest_buf, tcu_scan_en_buf, tcu_array_wr_inhibit_buf,
         tcu_se_scancollar_in_buf, tcu_se_scancollar_out_buf, rst_wmr_protect_buf, scan_out[1:0], tcu_shscan_pce_ov_buf, 
         tcu_shscan_aclk_buf, tcu_shscan_bclk_buf, tcu_shscan_scan_in_buf, tcu_shscan_scan_en_buf, spc_shscan_scan_out,
         cluster_arst_l_buf, tcu_spc_mbist_scan_in_buf, tcu_spc_mbist_start_buf0, spc_mbist_fail,
         spc_mbist_done, spc_tcu_mbist_scan_out, tcu_spc_lbist_start_buf, tcu_spc_lbist_scan_in_buf, tcu_spc_lbist_pgm_buf, 
         tcu_spc_test_mode_buf, spc_tcu_lbist_done, spc_tcu_lbist_scan_out, dmo_dcmuxctl_buf, hver_mask_minor_rev_buf[3:0]})
  );

spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_1 spu_grant_rep0  (
  .din (dec_spu_grant_d),
  .dout(dec_spu_grant_d_rep0)
  );


// end dec -> spu_mct_ctl

// high-fanout buffering
spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_5 hf_tl_rep0  (
  .din ({pce_ov,spc_aclk,spc_bclk,spc_aclk_wmr,lb_scan_en}),
  .dout({pce_ov_tl,spc_aclk_tl,spc_bclk_tl,spc_aclk_wmr_tl,lb_scan_en_tl})
  );

spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_5 hf_tr_rep0  (
  .din ({pce_ov,spc_aclk,spc_bclk,spc_aclk_wmr,lb_scan_en}),
  .dout({pce_ov_tr,spc_aclk_tr,spc_bclk_tr,spc_aclk_wmr_tr,lb_scan_en_tr})
  );

spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_5 hf_br_rep0  (
  .din ({pce_ov,spc_aclk,spc_bclk,spc_aclk_wmr,lb_scan_en}),
  .dout({pce_ov_br,spc_aclk_br,spc_bclk_br,spc_aclk_wmr_br,lb_scan_en_br})
  );

spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_5 hf_bl_rep0  (
  .din ({pce_ov,spc_aclk,spc_bclk,spc_aclk_wmr,lb_scan_en}),
  .dout({pce_ov_bl,spc_aclk_bl,spc_bclk_bl,spc_aclk_wmr_bl,lb_scan_en_bl})
  );

///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
// Added the following for ifu_ftu                     //
// All exception buses are the same and interchangeable//
// The exception buses are connected to the closest    //
// buffer.                                             //
/////////////////////////////////////////////////////////
spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_0_rep0  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_0_c[32:0]  }  ),
  .dout({ftu_instr_0_exceptions_c_rep0[4:0] , ftu_instr_0_c_rep0[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_0_rep1  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_0_c[32:0]  }  ),
  .dout({ftu_instr_0_exceptions_c_rep1[4:0] , ftu_instr_0_c_rep1[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_0_rep2  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_0_c[32:0]  }  ),
  .dout({ftu_instr_0_exceptions_c_rep2[4:0] , ftu_instr_0_c_rep2[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_0_rep3  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_0_c[32:0]  }  ),
  .dout({ftu_instr_0_exceptions_c_rep3[4:0] , ftu_instr_0_c_rep3[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_1_rep0  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_1_c[32:0]  }  ),
  .dout({ftu_instr_1_exceptions_c_rep0[4:0] , ftu_instr_1_c_rep0[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_1_rep1  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_1_c[32:0]  }  ),
  .dout({ftu_instr_1_exceptions_c_rep1[4:0] , ftu_instr_1_c_rep1[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_1_rep2  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_1_c[32:0]  }  ),
  .dout({ftu_instr_1_exceptions_c_rep2[4:0] , ftu_instr_1_c_rep2[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_1_rep3  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_1_c[32:0]  }  ),
  .dout({ftu_instr_1_exceptions_c_rep3[4:0] , ftu_instr_1_c_rep3[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_2_rep0  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_2_c[32:0]  }  ),
  .dout({ftu_instr_2_exceptions_c_rep0[4:0] , ftu_instr_2_c_rep0[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_2_rep1  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_2_c[32:0]  }  ),
  .dout({ftu_instr_2_exceptions_c_rep1[4:0] , ftu_instr_2_c_rep1[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_2_rep2  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_2_c[32:0]  }  ),
  .dout({ftu_instr_2_exceptions_c_rep2[4:0] , ftu_instr_2_c_rep2[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_2_rep3  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_2_c[32:0]  }  ),
  .dout({ftu_instr_2_exceptions_c_rep3[4:0] , ftu_instr_2_c_rep3[32:0]})
  );

spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_3_rep0  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_3_c[32:0]  }  ),
  .dout({ftu_instr_3_exceptions_c_rep0[4:0] , ftu_instr_3_c_rep0[32:0]})
  );
spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_3_rep1  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_3_c[32:0]  }  ),
  .dout({ftu_instr_3_exceptions_c_rep1[4:0] , ftu_instr_3_c_rep1[32:0]})
  );
spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_3_rep2  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_3_c[32:0]  }  ),
  .dout({ftu_instr_3_exceptions_c_rep2[4:0] , ftu_instr_3_c_rep2[32:0]})
  );
spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 ftu_instr_3_rep3  (
  .din ({ftu_instr_exceptions_c[4:0], ftu_instr_3_c[32:0]  }  ),
  .dout({ftu_instr_3_exceptions_c_rep3[4:0] , ftu_instr_3_c_rep3[32:0]})
  );

////////////// END ifu_ftu /////////////////////////////////////

// exu_address; buffer off the less critical ifu/tlu load to
// improve timing on the path to lsu

spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_64c__width_48 i_exu_address0_e_rep0  (
  .din (exu_address0_e[47:0]),
  .dout(exu_address0_e_rep0[47:0])
);
spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_50c__width_48 i_exu_address0_e_rep01  (
  .din (exu_address0_e_rep0[47:0]),
  .dout(exu_address0_e_rep01[47:0])
);
spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_64c__width_48 i_exu_address1_e_rep0  (
  .din (exu_address1_e[47:0]),
  .dout(exu_address1_e_rep0[47:0])
);
spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_50c__width_48 i_exu_address1_e_rep01  (
  .din (exu_address1_e_rep0[47:0]),
  .dout(exu_address1_e_rep01[47:0])
);

spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__top_lsb__vertical_1__width_32 i_fgu_exu_result_fx5_rep0a  (
	.din	(fgu_exu_result_fx5[31:0]),
	.dout	(fgu_exu_result_fx5_rep0[31:0])
);
spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__top_lsb__vertical_1__width_32 i_fgu_exu_result_fx5_rep0b  (
	.din	(fgu_exu_result_fx5[63:32]),
	.dout	(fgu_exu_result_fx5_rep0[63:32])
);

spc_rep1_dpbuff_macro__dbuff_16x__rep_1__stack_none__top_lsb__vertical_1__width_32 i_fgu_exu_result_fx5_rep1a  (
	.din	(fgu_exu_result_fx5_rep0[31:0]),
	.dout	(fgu_exu_result_fx5_rep1[31:0])
);
spc_rep1_dpbuff_macro__dbuff_16x__rep_1__stack_none__top_lsb__vertical_1__width_32 i_fgu_exu_result_fx5_rep1b  (
	.din	(fgu_exu_result_fx5_rep0[63:32]),
	.dout	(fgu_exu_result_fx5_rep1[63:32])
);

// lsu_exu_ld_data_b
spc_rep1_dpbuff_macro__dbuff_16x__rep_1__stack_72c__width_64 i_lsu_exu_ld_data_rep00  (
  .din (lsu_exu_ld_data_b[63:0]),
  .dout(lsu_exu_ld_data_b_rep00[63:0])
);
spc_rep1_dpbuff_macro__dbuff_16x__rep_1__stack_72c__width_64 i_lsu_exu_ld_data_rep01  (
  .din (lsu_exu_ld_data_b[63:0]),
  .dout(lsu_exu_ld_data_b_rep01[63:0])
);

spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_2 i_fgu_ecc_fx2_rep0  (
  .din ({fgu_cecc_fx2,      fgu_uecc_fx2     }),
  .dout({fgu_cecc_fx2_rep0, fgu_uecc_fx2_rep0})
);

spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__vertical_1__width_2 i_fgu_ecc_fx2_rep1  (
  .din ({fgu_cecc_fx2_rep0, fgu_uecc_fx2_rep0}),
  .dout({fgu_cecc_fx2_rep1, fgu_uecc_fx2_rep1})
);


endmodule


//
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__vertical_1__width_37 (
  din, 
  dout);
  input [36:0] din;
  output [36:0] dout;






buff #(37)  d0_0 (
.in(din[36:0]),
.out(dout[36:0])
);








endmodule





//
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_1 (
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
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule





//
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_48x__rep_1__stack_38c__width_38 (
  din, 
  dout);
  input [37:0] din;
  output [37:0] dout;






buff #(38)  d0_0 (
.in(din[37:0]),
.out(dout[37:0])
);








endmodule





//
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_64c__width_48 (
  din, 
  dout);
  input [47:0] din;
  output [47:0] dout;






buff #(48)  d0_0 (
.in(din[47:0]),
.out(dout[47:0])
);








endmodule





//
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_50c__width_48 (
  din, 
  dout);
  input [47:0] din;
  output [47:0] dout;






buff #(48)  d0_0 (
.in(din[47:0]),
.out(dout[47:0])
);








endmodule





//
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__top_lsb__vertical_1__width_32 (
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
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_16x__rep_1__stack_none__top_lsb__vertical_1__width_32 (
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
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_16x__rep_1__stack_72c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   buff macro
//
//





module spc_rep1_dpbuff_macro__dbuff_32x__rep_1__stack_none__vertical_1__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule




