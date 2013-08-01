// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_dirvec_ctl.v
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
module l2t_dirvec_ctl (
  scan_in, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  arbadr_ncu_l2t_pm_n_dist, 
  arbadr_2bnk_true_enbld_dist, 
  arbadr_4bnk_true_enbld_dist, 
  io_cmp_sync_en, 
  ncu_spc0_core_enable_status, 
  ncu_spc1_core_enable_status, 
  ncu_spc2_core_enable_status, 
  ncu_spc3_core_enable_status, 
  ncu_spc4_core_enable_status, 
  ncu_spc5_core_enable_status, 
  ncu_spc6_core_enable_status, 
  ncu_spc7_core_enable_status, 
  ic_cam_hit, 
  dc_cam_hit, 
  oqu_sel_mux1_c6, 
  oqu_sel_mux2_c6, 
  oqu_sel_mux3_c6, 
  oqu_mux_vec_sel_c6, 
  sel_st_ack_c7, 
  st_ack_bmask, 
  arbadr_dirvec_addr3_c7, 
  arbadr_arbdp_line_addr_c7, 
  l2clk, 
  dirvec_dirdp_req_vec_c6, 
  dirvec_dirdp_way_info_c7, 
  dirvec_dirdp_inval_pckt_c7, 
  scan_out, 
  ic_cam_fail, 
  dc_cam_fail, 
  mb0_l2t_cambist);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire ff_sync_en_scanin;
wire ff_sync_en_scanout;
wire io_cmp_sync_en_r1;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire ff_ncu_signals_scanin;
wire ff_ncu_signals_scanout;
wire spc0_avl;
wire spc1_avl;
wire spc2_avl;
wire spc3_avl;
wire spc4_avl;
wire spc5_avl;
wire spc6_avl;
wire spc7_avl;
wire ff_staged_part_bank_scanin;
wire ff_staged_part_bank_scanout;
wire arbadr_ncu_l2t_pm_n;
wire arbadr_2bnk_true_enbld;
wire arbadr_4bnk_true_enbld;
wire arb_dirvec_cpu0_sel00;
wire arb_dirvec_cpu0_selbot;
wire arb_dirvec_cpu1_sel00_w;
wire arb_dirvec_cpu1_sel01_w;
wire arb_dirvec_cpu1_selbot_w;
wire arb_dirvec_cpu1_seltop_w;
wire arb_dirvec_cpu2_sel00_w;
wire arb_dirvec_cpu2_sel01_w;
wire arb_dirvec_cpu2_sel10_w;
wire arb_dirvec_cpu2_selbot_w;
wire arb_dirvec_cpu2_seltop_w;
wire arb_dirvec_cpu3_sel00_w;
wire arb_dirvec_cpu3_sel01_w;
wire arb_dirvec_cpu3_sel10_w;
wire arb_dirvec_cpu3_sel11_w;
wire arb_dirvec_cpu3_selbot_w;
wire arb_dirvec_cpu3_seltop_w;
wire arb_dirvec_cpu4_sel00_w;
wire arb_dirvec_cpu4_sel01_w;
wire arb_dirvec_cpu4_sel10_w;
wire arb_dirvec_cpu4_sel11_w;
wire arb_dirvec_cpu4_selbot_w;
wire arb_dirvec_cpu4_seltop_w;
wire arb_dirvec_cpu5_sel00_w;
wire arb_dirvec_cpu5_sel01_w;
wire arb_dirvec_cpu5_sel10_w;
wire arb_dirvec_cpu5_sel11_w;
wire arb_dirvec_cpu5_selbot_w;
wire arb_dirvec_cpu5_seltop_w;
wire arb_dirvec_cpu6_sel00_w;
wire arb_dirvec_cpu6_sel01_w;
wire arb_dirvec_cpu6_sel10_w;
wire arb_dirvec_cpu6_sel11_w;
wire arb_dirvec_cpu6_selbot_w;
wire arb_dirvec_cpu6_seltop_w;
wire arb_dirvec_cpu7_sel00_w;
wire arb_dirvec_cpu7_sel01_w;
wire arb_dirvec_cpu7_sel10_w;
wire arb_dirvec_cpu7_sel11_w;
wire arb_dirvec_cpu7_selbot_w;
wire arb_dirvec_cpu7_seltop_w;
wire ff_partial_bank_support_scanin;
wire ff_partial_bank_support_scanout;
wire arb_dirvec_cpu1_sel00;
wire arb_dirvec_cpu1_sel01;
wire arb_dirvec_cpu1_selbot;
wire arb_dirvec_cpu1_seltop;
wire arb_dirvec_cpu2_sel00;
wire arb_dirvec_cpu2_sel01;
wire arb_dirvec_cpu2_sel10;
wire arb_dirvec_cpu2_selbot;
wire arb_dirvec_cpu2_seltop;
wire arb_dirvec_cpu3_sel00;
wire arb_dirvec_cpu3_sel01;
wire arb_dirvec_cpu3_sel10;
wire arb_dirvec_cpu3_sel11;
wire arb_dirvec_cpu3_selbot;
wire arb_dirvec_cpu3_seltop;
wire arb_dirvec_cpu4_sel00;
wire arb_dirvec_cpu4_sel01;
wire arb_dirvec_cpu4_sel10;
wire arb_dirvec_cpu4_sel11;
wire arb_dirvec_cpu4_selbot;
wire arb_dirvec_cpu4_seltop;
wire arb_dirvec_cpu5_sel00;
wire arb_dirvec_cpu5_sel01;
wire arb_dirvec_cpu5_sel10;
wire arb_dirvec_cpu5_sel11;
wire arb_dirvec_cpu5_selbot;
wire arb_dirvec_cpu5_seltop;
wire arb_dirvec_cpu6_sel00;
wire arb_dirvec_cpu6_sel01;
wire arb_dirvec_cpu6_sel10;
wire arb_dirvec_cpu6_sel11;
wire arb_dirvec_cpu6_selbot;
wire arb_dirvec_cpu6_seltop;
wire arb_dirvec_cpu7_sel00;
wire arb_dirvec_cpu7_sel01;
wire arb_dirvec_cpu7_sel10;
wire arb_dirvec_cpu7_sel11;
wire arb_dirvec_cpu7_selbot;
wire arb_dirvec_cpu7_seltop;
wire sel_st_ack_c7_n;
wire arbadr_arbdp_line_addr_c7_5_n;
wire arbadr_arbdp_line_addr_c7_4_n;
wire ff_dirdp_inval_pckt_c7_slice0_scanin;
wire ff_dirdp_inval_pckt_c7_slice0_scanout;
wire ff_dirdp_inval_pckt_c7_slice1_scanin;
wire ff_dirdp_inval_pckt_c7_slice1_scanout;
wire ff_dirdp_inval_pckt_c7_slice2_scanin;
wire ff_dirdp_inval_pckt_c7_slice2_scanout;
wire ff_dirdp_inval_pckt_c7_slice3_scanin;
wire ff_dirdp_inval_pckt_c7_slice3_scanout;
wire [3:0] way_wayvld00_mux1_c6;
wire [2:0] way_wayvld01_mux1_c6;
wire [3:0] way_wayvld10_mux1_c6;
wire [2:0] way_wayvld11_mux1_c6;
wire [13:0] mux1_way_way_wayvld_stage1_din0;
wire [3:0] way_way_vld0_c6;
wire [2:0] way_way_vld32_c6;
wire [3:0] way_way_vld64_c6;
wire [2:0] way_way_vld96_c6;
wire [13:0] mux1_way_way_wayvld_stage1_din1;
wire [3:0] way_way_vld4_c6;
wire [2:0] way_way_vld36_c6;
wire [3:0] way_way_vld68_c6;
wire [2:0] way_way_vld100_c6;
wire [13:0] mux1_way_way_wayvld_stage1_din2;
wire [3:0] way_way_vld8_c6;
wire [2:0] way_way_vld40_c6;
wire [3:0] way_way_vld72_c6;
wire [2:0] way_way_vld104_c6;
wire [13:0] mux1_way_way_wayvld_stage1_din3;
wire [3:0] way_way_vld12_c6;
wire [2:0] way_way_vld44_c6;
wire [3:0] way_way_vld76_c6;
wire [2:0] way_way_vld108_c6;
wire [3:0] way_wayvld00_mux2_c6;
wire [2:0] way_wayvld01_mux2_c6;
wire [3:0] way_wayvld10_mux2_c6;
wire [2:0] way_wayvld11_mux2_c6;
wire [13:0] stage2_din0;
wire [3:0] way_way_vld16_c6;
wire [2:0] way_way_vld48_c6;
wire [3:0] way_way_vld80_c6;
wire [2:0] way_way_vld112_c6;
wire [13:0] stage2_din1;
wire [3:0] way_way_vld20_c6;
wire [2:0] way_way_vld52_c6;
wire [3:0] way_way_vld84_c6;
wire [2:0] way_way_vld116_c6;
wire [13:0] stage2_din2;
wire [3:0] way_way_vld24_c6;
wire [2:0] way_way_vld56_c6;
wire [3:0] way_way_vld88_c6;
wire [2:0] way_way_vld120_c6;
wire [13:0] stage2_din3;
wire [3:0] way_way_vld28_c6;
wire [2:0] way_way_vld60_c6;
wire [3:0] way_way_vld92_c6;
wire [2:0] way_way_vld124_c6;
wire [3:0] way_wayvld00_mux3_c6;
wire [2:0] way_wayvld01_mux3_c6;
wire [3:0] way_wayvld10_mux3_c6;
wire [2:0] way_wayvld11_mux3_c6;
wire oqu_sel_mux3_c6_n;
wire ff_dirvecdp_way_info_c7_scanin;
wire ff_dirvecdp_way_info_c7_scanout;
wire ff_dc_cam_hit_c52_4_scanin;
wire ff_dc_cam_hit_c52_4_scanout;
wire ff_dc_cam_hit_c52_3_scanin;
wire ff_dc_cam_hit_c52_3_scanout;
wire ff_dc_cam_hit_c52_2_scanin;
wire ff_dc_cam_hit_c52_2_scanout;
wire ff_dc_cam_hit_c52_1_scanin;
wire ff_dc_cam_hit_c52_1_scanout;
wire ff_dc_cam_hit_c6_4_scanin;
wire ff_dc_cam_hit_c6_4_scanout;
wire ff_dc_cam_hit_c6_3_scanin;
wire ff_dc_cam_hit_c6_3_scanout;
wire ff_dc_cam_hit_c6_2_scanin;
wire ff_dc_cam_hit_c6_2_scanout;
wire ff_dc_cam_hit_c6_1_scanin;
wire ff_dc_cam_hit_c6_1_scanout;
wire ff_ic_cam_hit_c52_1_scanin;
wire ff_ic_cam_hit_c52_1_scanout;
wire ff_ic_cam_hit_c52_3_scanin;
wire ff_ic_cam_hit_c52_3_scanout;
wire ff_ic_cam_hit_c6_1_scanin;
wire ff_ic_cam_hit_c6_1_scanout;
wire ff_ic_cam_hit_c6_3_scanin;
wire ff_ic_cam_hit_c6_3_scanout;
wire [3:0] enc_c_vec0;
wire [3:0] enc_c_vec4;
wire [3:0] enc_c_vec8;
wire [3:0] enc_c_vec12;
wire [3:0] enc_c_vec16;
wire [3:0] enc_c_vec20;
wire [3:0] enc_c_vec24;
wire [3:0] enc_c_vec28;
wire [1:0] enc_c_vec32_way_c6;
wire dc_dir_vec32_c6;
wire [1:0] enc_c_vec36_way_c6;
wire dc_dir_vec36_c6;
wire [1:0] enc_c_vec40_way_c6;
wire dc_dir_vec40_c6;
wire [1:0] enc_c_vec44_way_c6;
wire dc_dir_vec44_c6;
wire [1:0] enc_c_vec48_way_c6;
wire dc_dir_vec48_c6;
wire [1:0] enc_c_vec52_way_c6;
wire dc_dir_vec52_c6;
wire [1:0] enc_c_vec56_way_c6;
wire dc_dir_vec56_c6;
wire [1:0] enc_c_vec60_way_c6;
wire dc_dir_vec60_c6;
wire [3:0] enc_c_vec64;
wire [3:0] enc_c_vec68;
wire [3:0] enc_c_vec72;
wire [3:0] enc_c_vec76;
wire [3:0] enc_c_vec80;
wire [3:0] enc_c_vec84;
wire [3:0] enc_c_vec88;
wire [3:0] enc_c_vec92;
wire [1:0] enc_c_vec96_way_c6;
wire dc_dir_vec96_c6;
wire [1:0] enc_c_vec100_way_c6;
wire dc_dir_vec100_c6;
wire [1:0] enc_c_vec104_way_c6;
wire dc_dir_vec104_c6;
wire [1:0] enc_c_vec108_way_c6;
wire dc_dir_vec108_c6;
wire [1:0] enc_c_vec112_way_c6;
wire dc_dir_vec112_c6;
wire [1:0] enc_c_vec116_way_c6;
wire dc_dir_vec116_c6;
wire [1:0] enc_c_vec120_way_c6;
wire dc_dir_vec120_c6;
wire [1:0] enc_c_vec124_way_c6;
wire dc_dir_vec124_c6;
wire ff_ic_cam_hit_reg0_scanin;
wire ff_ic_cam_hit_reg0_scanout;
wire [127:0] ic_cam_hit_reg;
wire ff_ic_cam_hit_reg1_scanin;
wire ff_ic_cam_hit_reg1_scanout;
wire ff_dc_cam_hit_reg0_scanin;
wire ff_dc_cam_hit_reg0_scanout;
wire [127:0] dc_cam_hit_reg;
wire ff_dc_cam_hit_reg_scanin;
wire ff_dc_cam_hit_reg_scanout;
wire ic_cam_fail0;
wire ic_cam_fail1;
wire ic_cam_fail2;
wire ic_cam_fail3;
wire ff_cam_tst_failed11_scanin;
wire ff_cam_tst_failed11_scanout;
wire ic_cam_fail3_reg;
wire ic_cam_fail2_reg;
wire ic_cam_fail1_reg;
wire ic_cam_fail0_reg;
wire dc_cam_fail0;
wire dc_cam_fail1;
wire dc_cam_fail2;
wire dc_cam_fail3;
wire ff_cam_tst_failed00_scanin;
wire ff_cam_tst_failed00_scanout;
wire dc_cam_fail3_reg;
wire dc_cam_fail2_reg;
wire dc_cam_fail1_reg;
wire dc_cam_fail0_reg;
wire mb0_l2t_cambist_reg;
 
 
input scan_in; 

input           tcu_pce_ov;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_clk_stop;

input           arbadr_ncu_l2t_pm_n_dist; //  BS 03/25/04 for partial bank/core modes support
input           arbadr_2bnk_true_enbld_dist;
input           arbadr_4bnk_true_enbld_dist;
//input  [2:0]    arbdec_arbdp_cpuid_c2;
input		io_cmp_sync_en;
input		ncu_spc0_core_enable_status;
input		ncu_spc1_core_enable_status;
input		ncu_spc2_core_enable_status;
input		ncu_spc3_core_enable_status;
input		ncu_spc4_core_enable_status;
input		ncu_spc5_core_enable_status;
input		ncu_spc6_core_enable_status;
input		ncu_spc7_core_enable_status;





//input           arb_dirvec_cpu0_sel00;// BS 03/25/04 for partial bank/core modes support
//input           arb_dirvec_cpu0_selbot;// BS 03/25/04 for partial bank/core modes support
//              
//input           arb_dirvec_cpu1_sel00;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu1_sel01;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu1_selbot;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu1_seltop;// BS 03/25/04 for partial bank/core modes support
//           
//input		 arb_dirvec_cpu2_sel00 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu2_sel01 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu2_sel10 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu2_selbot ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu2_seltop ;// BS 03/25/04 for partial bank/core modes support
//           
//input		 arb_dirvec_cpu3_sel00 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu3_sel01 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu3_sel10 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu3_sel11 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu3_selbot ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu3_seltop ;// BS 03/25/04 for partial bank/core modes support
//           
//input		 arb_dirvec_cpu4_sel00 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu4_sel01 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu4_sel10 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu4_sel11 ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu4_selbot ;// BS 03/25/04 for partial bank/core modes support
//input		 arb_dirvec_cpu4_seltop ;// BS 03/25/04 for partial bank/core modes support
//     	
//input		arb_dirvec_cpu5_sel00 ;// BS 03/25/04 for partial bank/core modes support
//input   	arb_dirvec_cpu5_sel01 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu5_sel10 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu5_sel11 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu5_selbot ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu5_seltop ;// BS 03/25/04 for partial bank/core modes support
//     	
//input   	arb_dirvec_cpu6_sel00 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu6_sel01 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu6_sel10 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu6_sel11 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu6_selbot ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu6_seltop ;// BS 03/25/04 for partial bank/core modes support
//     	
//input   	arb_dirvec_cpu7_sel00 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu7_sel01 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu7_sel10 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu7_sel11 ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu7_selbot ;// BS 03/25/04 for partial bank/core modes support
//input		arb_dirvec_cpu7_seltop ;// BS 03/25/04 for partial bank/core modes support
     	
input   [127:0]  ic_cam_hit; 
input   [127:0]  dc_cam_hit; 
 
input   [  3:0]  oqu_sel_mux1_c6; 
input   [  3:0]  oqu_sel_mux2_c6; 
input            oqu_sel_mux3_c6; 
 
input   [  3:0]  oqu_mux_vec_sel_c6; 

input          sel_st_ack_c7;  // BS and SR 11/12/03 N2 Xbar Packet format change
input   [7:0]  st_ack_bmask; // BS and SR 11/12/03 N2 Xbar Packet format change
//input   [63:0] st_ack_data; // BS and SR 11/12/03 N2 Xbar Packet format change
			// BS and SR 12/22/03, store ack generation for diagnostic store
input          arbadr_dirvec_addr3_c7; // Bit 3 of address, BS and SR 11/12/03 N2 Xbar Packet format change
input	[5:4]	arbadr_arbdp_line_addr_c7; // Bit 5 & 4 of address to create Vack from Vinv

 
input            l2clk; 
 
output  [  7:0]  dirvec_dirdp_req_vec_c6; 
 
output  [  3:0]  dirvec_dirdp_way_info_c7; // BS and SR 11/18/03 Support for 8 way I$ 
output  [111:0]  dirvec_dirdp_inval_pckt_c7; 

output 		scan_out; 
// mbist

output	[1:0]	ic_cam_fail;
output	[1:0]	dc_cam_fail;
input		mb0_l2t_cambist;

assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
//assign muxtst = tcu_muxtest;



//assign scan_out = 1'b0;

wire [7:0] arb_cpuid_dec_c2;
wire       sel_bot_seg;
wire       sel_00;
wire       sel_01;
wire       sel_10;
wire       sel_11;
wire       sum0;
wire [1:0] sum01;
wire [1:0] sum012;
wire [2:0] sum0123,sum01234,sum012345,sum0123456;
wire [1:0] seg;
wire [2:0] arb_cpuid_c3,arb_cpuid_c4,arb_cpuid_c52;

 
wire    [3:0]    dirvec_vack1_ic_inv_0to3,dirvec_vack1_ic_inv_4to7,dirvec_vack1_ic_inv_8to11,dirvec_vack1_ic_inv_12to15;
wire    [3:0]    dirvec_vack1_ic_inv_16to19,dirvec_vack1_ic_inv_20to23,dirvec_vack1_ic_inv_24to27,dirvec_vack1_ic_inv_28to31;
wire    [3:0]    dirvec_vack3_ic_inv_0to3,dirvec_vack3_ic_inv_4to7,dirvec_vack3_ic_inv_8to11,dirvec_vack3_ic_inv_12to15;
wire    [3:0]    dirvec_vack3_ic_inv_16to19,dirvec_vack3_ic_inv_20to23,dirvec_vack3_ic_inv_24to27,dirvec_vack3_ic_inv_28to31;
 
wire    [31:0]   dirvec_dirdp_pckt_vack1_c7;
wire    [31:0]   dirvec_dirdp_pckt_vack3_c7;
wire    [127:0]  dc_cam_hit_c6; 
wire    [127:0]  ic_cam_hit_c6; 
wire    [127:0]  dc_cam_hit_c5; 
wire    [127:0]  dc_cam_hit_c52; // BS 03/11/04 extra cycle for mem access 
wire    [127:0]  ic_cam_hit_reorg_c5;  // BS and SR 11/18/03 Support for 8 way I$ 
wire    [127:0]  ic_cam_hit_reorg_c52; // BS 03/11/04 extra cycle for mem access
 
wire    [111:0]  dirdp_inval_pckt_c6; 
wire    [111:0]  dirvec_dirdp_inval_pckt_c7; 
wire    [111:0]  dirvec_dirdp_inval_pckt_c7_tmp; // BS and SR 11/12/03 N2 Xbar Packet format change
wire    [  3:0]  dirvecdp_way_info_c7; 

wire		sel_inv_pkt_vack0;
wire		sel_inv_pkt_vack1;
wire		sel_inv_pkt_vack2;
wire		sel_inv_pkt_vack3;
reg	[3:0]	dirvecdp_way_info_c6;
reg	[31:0]	dirvec_dirdp_inval_pckt_vack;
reg	[13:0]	mux1_way_way_wayvld_stage1_dout;
reg	[13:0]	stage2_dout;

//************************************************************************************ 
//   PARTIAL CORE SUPPORT
//************************************************************************************ 

l2t_dirvec_ctl_msff_ctl_macro__width_1 ff_sync_en 
	(
	.scan_in(ff_sync_en_scanin),
	.scan_out(ff_sync_en_scanout),
	.dout	(io_cmp_sync_en_r1),
	.din	(io_cmp_sync_en),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);



//////////////////////////////////////////
// Spare gate insertion
//////////////////////////////////////////
l2t_dirvec_ctl_spare_ctl_macro__num_10 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



l2t_dirvec_ctl_msff_ctl_macro__en_1__width_8 ff_ncu_signals 
	(
	.scan_in(ff_ncu_signals_scanin),
	.scan_out(ff_ncu_signals_scanout),
	.dout	({spc0_avl,
                  spc1_avl,
                  spc2_avl,
                  spc3_avl,
                  spc4_avl,
                  spc5_avl,
                  spc6_avl,
                  spc7_avl}),
	.din	({ ncu_spc0_core_enable_status,
                   ncu_spc1_core_enable_status,
                   ncu_spc2_core_enable_status,
                   ncu_spc3_core_enable_status,
                   ncu_spc4_core_enable_status,
                   ncu_spc5_core_enable_status,
                   ncu_spc6_core_enable_status,
                   ncu_spc7_core_enable_status}),
	.l1clk	(l1clk),
	.en	(io_cmp_sync_en_r1),
  .siclk(siclk),
  .soclk(soclk)
	);



l2t_dirvec_ctl_msff_ctl_macro__width_3 ff_staged_part_bank	
	(
	.scan_in(ff_staged_part_bank_scanin),
	.scan_out(ff_staged_part_bank_scanout),
	.dout	({arbadr_ncu_l2t_pm_n,
 		  arbadr_2bnk_true_enbld,
 		  arbadr_4bnk_true_enbld}),
	.din	({arbadr_ncu_l2t_pm_n_dist,
                  arbadr_2bnk_true_enbld_dist,
                  arbadr_4bnk_true_enbld_dist}),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


//assign arb_cpuid_dec_c2[0] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b000);
//assign arb_cpuid_dec_c2[1] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b001); 
//assign arb_cpuid_dec_c2[2] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b010); 
//assign arb_cpuid_dec_c2[3] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b011); 
//assign arb_cpuid_dec_c2[4] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b100); 
//assign arb_cpuid_dec_c2[5] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b101); 
//assign arb_cpuid_dec_c2[6] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b110); 
//assign arb_cpuid_dec_c2[7] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b111); 





assign sum01 = {1'b0,spc0_avl} + {1'b0,spc1_avl};
assign sum012 = {1'b0,spc0_avl} + {1'b0,spc1_avl} + {1'b0,spc2_avl};
assign sum0123 = {2'b00,spc0_avl} + {2'b00,spc1_avl} + {2'b00,spc2_avl} + {2'b00,spc3_avl};
assign sum01234 = {2'b00,spc0_avl} + {2'b00,spc1_avl} + {2'b00,spc2_avl} + {2'b00,spc3_avl} + {2'b00,spc4_avl};
assign sum012345 = {2'b00,spc0_avl} + {2'b00,spc1_avl} + {2'b00,spc2_avl} + {2'b00,spc3_avl} + {2'b00,spc4_avl} + {2'b00,spc5_avl};
assign sum0123456 = {2'b00,spc0_avl} + {2'b00,spc1_avl} + {2'b00,spc2_avl} + {2'b00,spc3_avl} + {2'b00,spc4_avl} + {2'b00,spc5_avl} 
                    + {2'b00,spc6_avl};

assign sum0 = spc0_avl;


//assign   sel_00 = sel_bot_seg;
//
//assign sel_bot_seg = (arb_cpuid_dec_c2[0]) | 
//                     (arb_cpuid_dec_c2[1] & (sum0 == 1'b0)) |
//                     (arb_cpuid_dec_c2[2] & (sum01 == 2'b00)) | 
//                     (arb_cpuid_dec_c2[3] & (sum012 == 2'b00)) | 
//                     (arb_cpuid_dec_c2[4] & (sum0123 == 3'b000)) | 
//                     (arb_cpuid_dec_c2[5] & (sum01234 == 3'b000)) |
//                     (arb_cpuid_dec_c2[6] & (sum012345 == 3'b000)) | 
//                     (arb_cpuid_dec_c2[7] & (sum0123456  == 3'b000)); 
//
//assign   sel_01 = (arb_cpuid_dec_c2[1] & (sum0 == 1'b1)) |
//                  (arb_cpuid_dec_c2[2] & (sum01 == 2'b01)) |
//                  (arb_cpuid_dec_c2[3] & (sum012 == 2'b01)) |
//                  (arb_cpuid_dec_c2[4] & (sum0123 == 3'b001)) |
//                  (arb_cpuid_dec_c2[5] & (sum01234 == 3'b001)) |
//                  (arb_cpuid_dec_c2[6] & (sum012345 == 3'b001)) |
//                  (arb_cpuid_dec_c2[7] & (sum0123456  == 3'b001));
//                 
//assign   sel_10 = (arb_cpuid_dec_c2[2] & (sum01 == 2'b10)) |
//                  (arb_cpuid_dec_c2[3] & (sum012 == 2'b10)) |
//                  (arb_cpuid_dec_c2[4] & (sum0123 == 3'b010)) |
//                  (arb_cpuid_dec_c2[5] & (sum01234 == 3'b010)) |
//                  (arb_cpuid_dec_c2[6] & (sum012345 == 3'b010)) |
//                  (arb_cpuid_dec_c2[7] & (sum0123456 == 3'b010));
//
//assign   sel_11 = (arb_cpuid_dec_c2[3] & (sum012 == 2'b11)) |
//                  (arb_cpuid_dec_c2[4] & (sum0123 == 3'b011)) |
//                  (arb_cpuid_dec_c2[5] & (sum01234 == 3'b011)) |
//                  (arb_cpuid_dec_c2[6] & (sum012345 == 3'b011)) |
//                  (arb_cpuid_dec_c2[7] & (sum0123456 == 3'b011)); 

assign arb_dirvec_cpu0_sel00 = arbadr_4bnk_true_enbld & sum0;
assign arb_dirvec_cpu0_selbot = arbadr_2bnk_true_enbld & sum0; // fix for bug 93049, had a typo here.
                                                               // should have been arbadr_2bnk_true_enbld
                                                               // instead of "arbadr_4bnk_true_enbld"

assign arb_dirvec_cpu1_sel00_w    = arbadr_4bnk_true_enbld & ~sum0 & (sum01==2'b01);
assign arb_dirvec_cpu1_sel01_w    = arbadr_4bnk_true_enbld & (sum01==2'b10);
assign arb_dirvec_cpu1_selbot_w   = arbadr_2bnk_true_enbld & ~sum0 & (sum01==2'b01);
assign arb_dirvec_cpu1_seltop_w   = arbadr_2bnk_true_enbld & (sum01==2'b10);
assign arb_dirvec_cpu2_sel00_w    = arbadr_4bnk_true_enbld & (sum01==2'b00) & (sum012 == 2'b01);
assign arb_dirvec_cpu2_sel01_w    = arbadr_4bnk_true_enbld & (sum01==2'b01) & (sum012 == 2'b10);
assign arb_dirvec_cpu2_sel10_w    = arbadr_4bnk_true_enbld & (sum01==2'b10) & (sum012 == 2'b11);
assign arb_dirvec_cpu2_selbot_w   = arbadr_2bnk_true_enbld & (sum01==2'b00) & (sum012 == 2'b01);
assign arb_dirvec_cpu2_seltop_w   = arbadr_2bnk_true_enbld & (sum01==2'b01) & (sum012 == 2'b10);
assign arb_dirvec_cpu3_sel00_w    = arbadr_4bnk_true_enbld & (sum012 == 2'b00) & (sum0123 == 3'b001);
assign arb_dirvec_cpu3_sel01_w    = arbadr_4bnk_true_enbld & (sum012 == 2'b01) & (sum0123 == 3'b010);
assign arb_dirvec_cpu3_sel10_w    = arbadr_4bnk_true_enbld & (sum012 == 2'b10) & (sum0123 == 3'b011);
assign arb_dirvec_cpu3_sel11_w    = arbadr_4bnk_true_enbld & (sum012 == 2'b11) & (sum0123 == 3'b100);
assign arb_dirvec_cpu3_selbot_w   = arbadr_2bnk_true_enbld & (sum012 == 2'b00) & (sum0123 == 3'b001);
assign arb_dirvec_cpu3_seltop_w   = arbadr_2bnk_true_enbld & (sum012 == 2'b01) & (sum0123 == 3'b010);
assign arb_dirvec_cpu4_sel00_w    = arbadr_4bnk_true_enbld & (sum0123 == 3'b000) & (sum01234 == 3'b001); 
assign arb_dirvec_cpu4_sel01_w    = arbadr_4bnk_true_enbld & (sum0123 == 3'b001) & (sum01234 == 3'b010); 
assign arb_dirvec_cpu4_sel10_w    = arbadr_4bnk_true_enbld & (sum0123 == 3'b010) & (sum01234 == 3'b011); 
assign arb_dirvec_cpu4_sel11_w    = arbadr_4bnk_true_enbld & (sum0123 == 3'b011) & (sum01234 == 3'b100);
assign arb_dirvec_cpu4_selbot_w   = arbadr_2bnk_true_enbld & (sum0123 == 3'b000) & (sum01234 == 3'b001); 
assign arb_dirvec_cpu4_seltop_w   = arbadr_2bnk_true_enbld & (sum0123 == 3'b001) & (sum01234 == 3'b010); 
assign arb_dirvec_cpu5_sel00_w    = arbadr_4bnk_true_enbld & (sum01234 == 3'b000) & (sum012345== 3'b001); 
assign arb_dirvec_cpu5_sel01_w    = arbadr_4bnk_true_enbld & (sum01234 == 3'b001) & (sum012345== 3'b010); 
assign arb_dirvec_cpu5_sel10_w    = arbadr_4bnk_true_enbld & (sum01234 == 3'b010) & (sum012345== 3'b011);
assign arb_dirvec_cpu5_sel11_w    = arbadr_4bnk_true_enbld & (sum01234 == 3'b011) & (sum012345== 3'b100);
assign arb_dirvec_cpu5_selbot_w   = arbadr_2bnk_true_enbld & (sum01234 == 3'b000) & (sum012345 == 3'b001); 
assign arb_dirvec_cpu5_seltop_w   = arbadr_2bnk_true_enbld & (sum01234 == 3'b001) & (sum012345 == 3'b010); 
assign arb_dirvec_cpu6_sel00_w    = arbadr_4bnk_true_enbld & (sum012345 == 3'b000) & (sum0123456 == 3'b001); 
assign arb_dirvec_cpu6_sel01_w    = arbadr_4bnk_true_enbld & (sum012345 == 3'b001) & (sum0123456 == 3'b010); 
assign arb_dirvec_cpu6_sel10_w    = arbadr_4bnk_true_enbld & (sum012345 == 3'b010) & (sum0123456 == 3'b011);
assign arb_dirvec_cpu6_sel11_w    = arbadr_4bnk_true_enbld & (sum012345 == 3'b011) & (sum0123456 == 3'b100);
assign arb_dirvec_cpu6_selbot_w   = arbadr_2bnk_true_enbld & (sum012345 == 3'b000) & (sum0123456 == 3'b001); 
assign arb_dirvec_cpu6_seltop_w   = arbadr_2bnk_true_enbld & (sum012345 == 3'b001) & (sum0123456 == 3'b010); 
assign arb_dirvec_cpu7_sel00_w    = arbadr_4bnk_true_enbld & (sum0123456 == 3'b000) & spc7_avl; 
assign arb_dirvec_cpu7_sel01_w    = arbadr_4bnk_true_enbld & (sum0123456 == 3'b001) & spc7_avl; 
assign arb_dirvec_cpu7_sel10_w    = arbadr_4bnk_true_enbld & (sum0123456 == 3'b010) & spc7_avl; 
assign arb_dirvec_cpu7_sel11_w    = arbadr_4bnk_true_enbld & (sum0123456 == 3'b011) & spc7_avl; 
assign arb_dirvec_cpu7_selbot_w   = arbadr_2bnk_true_enbld & (sum0123456 == 3'b000) & spc7_avl;
assign arb_dirvec_cpu7_seltop_w   = arbadr_2bnk_true_enbld & (sum0123456 == 3'b001) & spc7_avl;

l2t_dirvec_ctl_msff_ctl_macro__width_39 ff_partial_bank_support  
        (
        .scan_in(ff_partial_bank_support_scanin),
        .scan_out(ff_partial_bank_support_scanout),
        .din    ({ arb_dirvec_cpu1_sel00_w, arb_dirvec_cpu1_sel01_w,
                        arb_dirvec_cpu1_selbot_w, arb_dirvec_cpu1_seltop_w, arb_dirvec_cpu2_sel00_w,
                        arb_dirvec_cpu2_sel01_w, arb_dirvec_cpu2_sel10_w, arb_dirvec_cpu2_selbot_w,
                        arb_dirvec_cpu2_seltop_w, arb_dirvec_cpu3_sel00_w, arb_dirvec_cpu3_sel01_w,
                        arb_dirvec_cpu3_sel10_w, arb_dirvec_cpu3_sel11_w, arb_dirvec_cpu3_selbot_w,
                        arb_dirvec_cpu3_seltop_w, arb_dirvec_cpu4_sel00_w, arb_dirvec_cpu4_sel01_w,
                        arb_dirvec_cpu4_sel10_w, arb_dirvec_cpu4_sel11_w, arb_dirvec_cpu4_selbot_w,
                        arb_dirvec_cpu4_seltop_w, arb_dirvec_cpu5_sel00_w, arb_dirvec_cpu5_sel01_w,
                        arb_dirvec_cpu5_sel10_w, arb_dirvec_cpu5_sel11_w, arb_dirvec_cpu5_selbot_w,
                        arb_dirvec_cpu5_seltop_w, arb_dirvec_cpu6_sel00_w, arb_dirvec_cpu6_sel01_w,
                        arb_dirvec_cpu6_sel10_w, arb_dirvec_cpu6_sel11_w, arb_dirvec_cpu6_selbot_w,
                        arb_dirvec_cpu6_seltop_w, arb_dirvec_cpu7_sel00_w, arb_dirvec_cpu7_sel01_w,
                        arb_dirvec_cpu7_sel10_w, arb_dirvec_cpu7_sel11_w, arb_dirvec_cpu7_selbot_w,
                        arb_dirvec_cpu7_seltop_w}),
        .dout   ({ arb_dirvec_cpu1_sel00, arb_dirvec_cpu1_sel01,
                        arb_dirvec_cpu1_selbot, arb_dirvec_cpu1_seltop, arb_dirvec_cpu2_sel00,
                        arb_dirvec_cpu2_sel01, arb_dirvec_cpu2_sel10, arb_dirvec_cpu2_selbot,
                        arb_dirvec_cpu2_seltop, arb_dirvec_cpu3_sel00, arb_dirvec_cpu3_sel01,
                        arb_dirvec_cpu3_sel10, arb_dirvec_cpu3_sel11, arb_dirvec_cpu3_selbot,
                        arb_dirvec_cpu3_seltop, arb_dirvec_cpu4_sel00, arb_dirvec_cpu4_sel01,
                        arb_dirvec_cpu4_sel10, arb_dirvec_cpu4_sel11, arb_dirvec_cpu4_selbot,
                        arb_dirvec_cpu4_seltop, arb_dirvec_cpu5_sel00, arb_dirvec_cpu5_sel01,
                        arb_dirvec_cpu5_sel10, arb_dirvec_cpu5_sel11, arb_dirvec_cpu5_selbot,
                        arb_dirvec_cpu5_seltop, arb_dirvec_cpu6_sel00, arb_dirvec_cpu6_sel01,
                        arb_dirvec_cpu6_sel10, arb_dirvec_cpu6_sel11, arb_dirvec_cpu6_selbot,
                        arb_dirvec_cpu6_seltop, arb_dirvec_cpu7_sel00, arb_dirvec_cpu7_sel01,
                        arb_dirvec_cpu7_sel10, arb_dirvec_cpu7_sel11, arb_dirvec_cpu7_selbot,
                        arb_dirvec_cpu7_seltop}),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );








//************************************************************************************ 
// FLOP INVAL PCKT TILL C6 
//************************************************************************************ 


// BS and SR 11/12/03 N2 Xbar Packet format change

   

l2t_dirvec_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


assign sel_st_ack_c7_n = ~sel_st_ack_c7;

assign dirvec_dirdp_inval_pckt_c7[63:0] = dirvec_dirdp_inval_pckt_c7_tmp[63:0];

//mux_ctl_macro dirvec_dirdp_inval_pckt_c7_slice0_1 (width=32,ports=2,mux=aonpe)
//	(
//	.dout	(dirvec_dirdp_inval_pckt_c7[63:32]),
//	.din0	(dirvec_dirdp_inval_pckt_c7_tmp[63:32]),
//	.din1	(st_ack_data[63:32]), // BS and SR 12/22/03, store ack generation for diagnostic store
//	.sel0	(sel_st_ack_c7_n),
//	.sel1	(sel_st_ack_c7)
//	);
//
//mux_ctl_macro dirvec_dirdp_inval_pckt_c7_slice0_2     (width=32,ports=2,mux=aonpe)
//        (
//        .dout   (dirvec_dirdp_inval_pckt_c7[31:0]),
//        .din0   (dirvec_dirdp_inval_pckt_c7_tmp[31:0]),
//        .din1   (st_ack_data[31:0]), // BS and SR 12/22/03, store ack generation for diagnostic store
//        .sel0   (sel_st_ack_c7_n),
//        .sel1   (sel_st_ack_c7)
//        );
//	
////  BS and SR  1/29/04
////  Depnding on the address bits [5:4], the store ack bits[95:64] have to 
//  be appropriately picked from dirvec_dirdp_inval_pckt_c7_tmp[111:0]
//

//inv_macro inv_arbadr_arbdp_line_addr_c7_5 (width=1)
//        (
//        .dout   (arbadr_arbdp_line_addr_c7_5_n),
//        .din    (arbadr_arbdp_line_addr_c7[5])
//        );
//
//inv_macro inv_arbadr_arbdp_line_addr_c7_4 (width=1)
//        (
//        .dout   (arbadr_arbdp_line_addr_c7_4_n),
//        .din    (arbadr_arbdp_line_addr_c7[4])
//        );
//
//and_macro and_sel_inv_pkt_vack0 (width=1,ports=2)
//	(
//	.dout	(sel_inv_pkt_vack0),
//	.din0	(arbadr_arbdp_line_addr_c7_5_n),
//	.din1	(arbadr_arbdp_line_addr_c7_4_n)
//	);
//
//and_macro and_sel_inv_pkt_vack1 (width=1,ports=2)
//        (
//        .dout   (sel_inv_pkt_vack1),
//        .din0   (arbadr_arbdp_line_addr_c7_5_n),
//        .din1   (arbadr_arbdp_line_addr_c7[4])
//        );
//
//and_macro and_sel_inv_pkt_vack2 (width=1,ports=2)
//        (
//        .dout   (sel_inv_pkt_vack2),
//        .din0   (arbadr_arbdp_line_addr_c7[5]),
//        .din1   (arbadr_arbdp_line_addr_c7_4_n)
//        );
//
//and_macro and_sel_inv_pkt_vack3 (width=1,ports=2)
//        (
//        .dout   (sel_inv_pkt_vack3),
//        .din0   (arbadr_arbdp_line_addr_c7[5]),
//        .din1   (arbadr_arbdp_line_addr_c7[4])
//        );

assign arbadr_arbdp_line_addr_c7_5_n = ~arbadr_arbdp_line_addr_c7[5];
assign arbadr_arbdp_line_addr_c7_4_n = ~arbadr_arbdp_line_addr_c7[4];
assign sel_inv_pkt_vack0 = arbadr_arbdp_line_addr_c7_5_n & arbadr_arbdp_line_addr_c7_4_n;
assign sel_inv_pkt_vack1 = arbadr_arbdp_line_addr_c7_5_n & arbadr_arbdp_line_addr_c7[4];
assign sel_inv_pkt_vack2 = arbadr_arbdp_line_addr_c7[5] & arbadr_arbdp_line_addr_c7_4_n;
assign sel_inv_pkt_vack3 = arbadr_arbdp_line_addr_c7[5] & arbadr_arbdp_line_addr_c7[4]; 

// BS 03/25/04
// fix for bugs 80709 and 81416 ::
// since icache stores can come with PA[5:4] = 01 or 11, (i.e 16 bytes aligned), we
// still need to invalidate all copies in L1's. hence if I$ Dir hit is high,
//  we choose dirvec_dirdp_inval_pckt_c7_tmp[87:56] in case of PA[5:4] == 11, and
// dirvec_dirdp_inval_pckt_c7_tmp[31:0] in case of PA[5:4] == 01 to be
// driven out on dirvec_dirdp_pckt_vack1_c7[31:0], otherwise result of D$ DIR CAM
// for PA[5:4] == 11 and 01 get driven out.
 

// bits 3:0 for <5:4> = 01
//and_macro dirvec_vack1_ic_inv_0to3_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack1_ic_inv_0to3[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[3:0]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[0]}}) // cpu 0  I$ inval true for <5> = 0
//       );

assign dirvec_vack1_ic_inv_0to3[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[3:0] & ({4{dirvec_dirdp_inval_pckt_c7_tmp[0]}});

//or_macro dirvec_vack1_0to3_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack1_c7[3:0]),
//       .din0(dirvec_vack1_ic_inv_0to3[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[34:32],1'b0}) // cpu 0 D$ inval for <5:4> = 01, if true
//      );


assign dirvec_dirdp_pckt_vack1_c7[3:0] = dirvec_vack1_ic_inv_0to3[3:0] | 
				{dirvec_dirdp_inval_pckt_c7_tmp[34:32],1'b0};



//// bits 7:4 for <5:4> = 01
//and_macro dirvec_vack1_ic_inv_4to7_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack1_ic_inv_4to7[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[7:4]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[4]}}) // cpu 1  I$ inval true for <5> = 0
//       );
//
//or_macro dirvec_vack1_4to7_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack1_c7[7:4]),
//       .din0(dirvec_vack1_ic_inv_4to7[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[37:35],1'b0}) // cpu 1 D$ inval for <5:4> = 01, if true
//      );

assign dirvec_vack1_ic_inv_4to7[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[7:4] & 
					({4{dirvec_dirdp_inval_pckt_c7_tmp[4]}});

assign dirvec_dirdp_pckt_vack1_c7[7:4] = dirvec_vack1_ic_inv_4to7[3:0] | 
					({dirvec_dirdp_inval_pckt_c7_tmp[37:35],1'b0});


//// bits 11:8 for <5:4> = 01
//and_macro dirvec_vack1_ic_inv_8to11_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack1_ic_inv_8to11[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[11:8]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[8]}}) // cpu 2  I$ inval true for <5> = 0
//       );
//
//or_macro dirvec_vack1_8to11_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack1_c7[11:8]),
//       .din0(dirvec_vack1_ic_inv_8to11[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[40:38],1'b0}) // cpu 2 D$ inval for <5:4> = 01, if true
//      );

assign dirvec_vack1_ic_inv_8to11[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[11:8] & 
				({4{dirvec_dirdp_inval_pckt_c7_tmp[8]}});

assign dirvec_dirdp_pckt_vack1_c7[11:8] = dirvec_vack1_ic_inv_8to11[3:0] | 
					({dirvec_dirdp_inval_pckt_c7_tmp[40:38],1'b0});


//// bits 15:12 for <5:4> = 01
//and_macro dirvec_vack1_ic_inv_12to15_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack1_ic_inv_12to15[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[15:12]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[12]}}) // cpu 3  I$ inval true for <5> = 0
//       );
//
//or_macro dirvec_vack1_12to15_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack1_c7[15:12]),
//       .din0(dirvec_vack1_ic_inv_12to15[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[43:41],1'b0}) // cpu 3 D$ inval for <5:4> = 01, if true
//      );

assign dirvec_vack1_ic_inv_12to15[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[15:12] & 
				({4{dirvec_dirdp_inval_pckt_c7_tmp[12]}});

assign dirvec_dirdp_pckt_vack1_c7[15:12] = dirvec_vack1_ic_inv_12to15[3:0] |
				({dirvec_dirdp_inval_pckt_c7_tmp[43:41],1'b0});

//// bits 19:16 for <5:4> = 01
//and_macro dirvec_vack1_ic_inv_16to19_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack1_ic_inv_16to19[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[19:16]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[16]}}) // cpu 4  I$ inval true for <5> = 0
//       );
//
//or_macro dirvec_vack1_16to19_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack1_c7[19:16]),
//       .din0(dirvec_vack1_ic_inv_16to19[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[46:44],1'b0}) // cpu 4 D$ inval for <5:4> = 01, if true
//      );

assign dirvec_vack1_ic_inv_16to19[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[19:16] &
		({4{dirvec_dirdp_inval_pckt_c7_tmp[16]}});

assign dirvec_dirdp_pckt_vack1_c7[19:16] = dirvec_vack1_ic_inv_16to19[3:0] | 
			({dirvec_dirdp_inval_pckt_c7_tmp[46:44],1'b0});

//// bits 23:20 for <5:4> = 01
//and_macro dirvec_vack1_ic_inv_20to23_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack1_ic_inv_20to23[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[23:20]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[20]}}) // cpu 5  I$ inval true for <5> = 0
//       );
//
//or_macro dirvec_vack1_20to23_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack1_c7[23:20]),
//       .din0(dirvec_vack1_ic_inv_20to23[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[49:47],1'b0}) // cpu 5 D$ inval for <5:4> = 01, if true
//      );

assign dirvec_vack1_ic_inv_20to23[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[23:20] &
				({4{dirvec_dirdp_inval_pckt_c7_tmp[20]}});

assign dirvec_dirdp_pckt_vack1_c7[23:20] = dirvec_vack1_ic_inv_20to23[3:0] |
				({dirvec_dirdp_inval_pckt_c7_tmp[49:47],1'b0});

//// bits 27:24 for <5:4> = 01
//and_macro dirvec_vack1_ic_inv_24to27_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack1_ic_inv_24to27[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[27:24]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[24]}}) // cpu 6  I$ inval true for <5> = 0
//       );
//
//or_macro dirvec_vack1_24to27_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack1_c7[27:24]),
//       .din0(dirvec_vack1_ic_inv_24to27[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[52:50],1'b0}) // cpu 6 D$ inval for <5:4> = 01, if true
//      );

assign dirvec_vack1_ic_inv_24to27[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[27:24] &
				({4{dirvec_dirdp_inval_pckt_c7_tmp[24]}});

assign dirvec_dirdp_pckt_vack1_c7[27:24] = dirvec_vack1_ic_inv_24to27[3:0] |
			({dirvec_dirdp_inval_pckt_c7_tmp[52:50],1'b0});

//// bits 31:28 for <5:4> = 01
//and_macro dirvec_vack1_ic_inv_28to31_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack1_ic_inv_28to31[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[31:28]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[28]}}) // cpu 7  I$ inval true for <5> = 0
//       );
//
//or_macro dirvec_vack1_28to31_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack1_c7[31:28]),
//       .din0(dirvec_vack1_ic_inv_28to31[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[55:53],1'b0}) // cpu 7 D$ inval for <5:4> = 01, if true
//      );


assign dirvec_vack1_ic_inv_28to31[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[31:28] &
				({4{dirvec_dirdp_inval_pckt_c7_tmp[28]}});
assign dirvec_dirdp_pckt_vack1_c7[31:28] = dirvec_vack1_ic_inv_28to31[3:0] | 
				({dirvec_dirdp_inval_pckt_c7_tmp[55:53],1'b0});

//
//// bits 3:0 for <5:4> = 11
//and_macro dirvec_vack3_ic_inv_0to3_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack3_ic_inv_0to3[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[59:56]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[56]}}) // cpu 0  I$ inval true for <5> = 1
//       );
//
//or_macro dirvec_vack3_0to3_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack3_c7[3:0]),
//       .din0(dirvec_vack3_ic_inv_0to3[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[90:88],1'b0}) // cpu 0 D$ inval for <5:4> = 11, if true
//      );


assign dirvec_vack3_ic_inv_0to3[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[59:56] &
			({4{dirvec_dirdp_inval_pckt_c7_tmp[56]}});
assign dirvec_dirdp_pckt_vack3_c7[3:0] = dirvec_vack3_ic_inv_0to3[3:0] |
			({dirvec_dirdp_inval_pckt_c7_tmp[90:88],1'b0});


//// bits 7:4 for <5:4> = 11
//and_macro dirvec_vack3_ic_inv_4to7_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack3_ic_inv_4to7[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[63:60]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[60]}}) // cpu 1  I$ inval true for <5> = 1
//       );
//
//or_macro dirvec_vack3_4to7_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack3_c7[7:4]),
//       .din0(dirvec_vack3_ic_inv_4to7[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[93:91],1'b0}) // cpu 1 D$ inval for <5:4> = 11, if true
//      );

assign dirvec_vack3_ic_inv_4to7[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[63:60] &
			({4{dirvec_dirdp_inval_pckt_c7_tmp[60]}});
assign dirvec_dirdp_pckt_vack3_c7[7:4] = dirvec_vack3_ic_inv_4to7[3:0] | 
			({dirvec_dirdp_inval_pckt_c7_tmp[93:91],1'b0});

//// bits 11:8 for <5:4> = 11
//and_macro dirvec_vack3_ic_inv_8to11_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack3_ic_inv_8to11[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[67:64]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[64]}}) // cpu 2  I$ inval true for <5> = 1
//       );
//
//or_macro dirvec_vack3_8to11_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack3_c7[11:8]),
//       .din0(dirvec_vack3_ic_inv_8to11[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[96:94],1'b0}) // cpu 2 D$ inval for <5:4> = 11, if true
//      );

assign dirvec_vack3_ic_inv_8to11[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[67:64] &
			({4{dirvec_dirdp_inval_pckt_c7_tmp[64]}});
assign dirvec_dirdp_pckt_vack3_c7[11:8] = dirvec_vack3_ic_inv_8to11[3:0] |
			({dirvec_dirdp_inval_pckt_c7_tmp[96:94],1'b0}) ;

//// bits 15:12 for <5:4> = 11
//and_macro dirvec_vack3_ic_inv_12to15_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack3_ic_inv_12to15[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[71:68]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[68]}}) // cpu 3  I$ inval true for <5> = 1
//       );
//
//or_macro dirvec_vack3_12to15_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack3_c7[15:12]),
//       .din0(dirvec_vack3_ic_inv_12to15[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[99:97],1'b0}) // cpu 3 D$ inval for <5:4> = 11, if true
//      );

assign dirvec_vack3_ic_inv_12to15[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[71:68] &
			({4{dirvec_dirdp_inval_pckt_c7_tmp[68]}});
assign dirvec_dirdp_pckt_vack3_c7[15:12] = dirvec_vack3_ic_inv_12to15[3:0] |
		({dirvec_dirdp_inval_pckt_c7_tmp[99:97],1'b0});


/// bits 19:16 for <5:4> = 11
//and_macro dirvec_vack3_ic_inv_16to19_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack3_ic_inv_16to19[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[75:72]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[72]}}) // cpu 4  I$ inval true for <5> = 1
//       );
//
//or_macro dirvec_vack3_16to19_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack3_c7[19:16]),
//       .din0(dirvec_vack3_ic_inv_16to19[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[102:100],1'b0}) // cpu 4 D$ inval for <5:4> = 11, if true
//      );

assign dirvec_vack3_ic_inv_16to19[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[75:72] &
		({4{dirvec_dirdp_inval_pckt_c7_tmp[72]}});
assign dirvec_dirdp_pckt_vack3_c7[19:16] = dirvec_vack3_ic_inv_16to19[3:0] |
			({dirvec_dirdp_inval_pckt_c7_tmp[102:100],1'b0});

//// bits 23:20 for <5:4> = 11
//and_macro dirvec_vack3_ic_inv_20to23_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack3_ic_inv_20to23[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[79:76]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[76]}}) // cpu 5  I$ inval true for <5> = 1
//       );
//
//or_macro dirvec_vack3_20to23_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack3_c7[23:20]),
//       .din0(dirvec_vack3_ic_inv_20to23[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[105:103],1'b0}) // cpu 5 D$ inval for <5:4> = 11, if true
//      );

assign dirvec_vack3_ic_inv_20to23[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[79:76] &
			({4{dirvec_dirdp_inval_pckt_c7_tmp[76]}});
assign dirvec_dirdp_pckt_vack3_c7[23:20] = dirvec_vack3_ic_inv_20to23[3:0] |
			({dirvec_dirdp_inval_pckt_c7_tmp[105:103],1'b0});

//// bits 27:24 for <5:4> = 11
//and_macro dirvec_vack3_ic_inv_24to27_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack3_ic_inv_24to27[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[83:80]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[80]}}) // cpu 6  I$ inval true for <5> = 1
//       );
//
//or_macro dirvec_vack3_24to27_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack3_c7[27:24]),
//       .din0(dirvec_vack3_ic_inv_24to27[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[108:106],1'b0}) // cpu 6 D$ inval for <5:4> = 11, if true
//      );

assign dirvec_vack3_ic_inv_24to27[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[83:80] &
			({4{dirvec_dirdp_inval_pckt_c7_tmp[80]}});
assign dirvec_dirdp_pckt_vack3_c7[27:24] = dirvec_vack3_ic_inv_24to27[3:0] |
			({dirvec_dirdp_inval_pckt_c7_tmp[108:106],1'b0});

//// bits 31:28 for <5:4> = 11
//and_macro dirvec_vack3_ic_inv_28to31_slice (width=4,ports=2)
//      (
//       .dout(dirvec_vack3_ic_inv_28to31[3:0]),
//       .din0(dirvec_dirdp_inval_pckt_c7_tmp[87:84]),
//       .din1({4{dirvec_dirdp_inval_pckt_c7_tmp[84]}}) // cpu 7  I$ inval true for <5> = 1
//       );
//
//or_macro dirvec_vack3_28to31_slice (width=4,ports=2)
//      (
//       .dout(dirvec_dirdp_pckt_vack3_c7[31:28]),
//       .din0(dirvec_vack3_ic_inv_28to31[3:0]),
//       .din1({dirvec_dirdp_inval_pckt_c7_tmp[111:109],1'b0}) // cpu 7 D$ inval for <5:4> = 11, if true
//      );

assign dirvec_vack3_ic_inv_28to31[3:0] = dirvec_dirdp_inval_pckt_c7_tmp[87:84] &
			({4{dirvec_dirdp_inval_pckt_c7_tmp[84]}});
assign dirvec_dirdp_pckt_vack3_c7[31:28] = dirvec_vack3_ic_inv_28to31[3:0] |
		({dirvec_dirdp_inval_pckt_c7_tmp[111:109],1'b0});

//mux_ctl_macro dirvec_dirdp_inval_pckt_Vack_slice	(width=32,ports=4,mux=pgnpe)
//	(
//	.dout	(dirvec_dirdp_inval_pckt_vack[31:0]),
//	.din0	(dirvec_dirdp_inval_pckt_c7_tmp[31:0]),
//	.din1	(dirvec_dirdp_pckt_vack1_c7[31:0]),
//	.din2	(dirvec_dirdp_inval_pckt_c7_tmp[87:56]),
//	.din3	(dirvec_dirdp_pckt_vack3_c7[31:0]),
//	.sel0	( sel_inv_pkt_vack0 ),
//	.sel1	( sel_inv_pkt_vack1 ),
//	.sel2	( sel_inv_pkt_vack2 ),
//	.sel3	( sel_inv_pkt_vack3 )
//	);


always@(dirvec_dirdp_inval_pckt_c7_tmp or dirvec_dirdp_pckt_vack1_c7 or dirvec_dirdp_inval_pckt_c7_tmp 
	or dirvec_dirdp_pckt_vack3_c7 or sel_inv_pkt_vack0 or sel_inv_pkt_vack1 or sel_inv_pkt_vack2
	 or sel_inv_pkt_vack3)
begin
case({sel_inv_pkt_vack3,sel_inv_pkt_vack2,sel_inv_pkt_vack1,sel_inv_pkt_vack0}) // synopsys parallel_case full_case
4'b0001	:	dirvec_dirdp_inval_pckt_vack[31:0] = dirvec_dirdp_inval_pckt_c7_tmp[31:0];
4'b0010	:	dirvec_dirdp_inval_pckt_vack[31:0] = dirvec_dirdp_pckt_vack1_c7[31:0];
4'b0100	:	dirvec_dirdp_inval_pckt_vack[31:0] = dirvec_dirdp_inval_pckt_c7_tmp[87:56];
4'b1000	:	dirvec_dirdp_inval_pckt_vack[31:0] = dirvec_dirdp_pckt_vack3_c7[31:0];
endcase
end



l2t_dirvec_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_24 dirvec_dirdp_inval_pckt_c7_slice1_1 
        (
        .dout   (dirvec_dirdp_inval_pckt_c7[111:88]),
        .din0   (dirvec_dirdp_inval_pckt_c7_tmp[111:88]),
        .din1   ({7'b0,arbadr_dirvec_addr3_c7,st_ack_bmask[7:0],
                        dirvec_dirdp_inval_pckt_vack[31:24]}),
        .sel0   (sel_st_ack_c7_n),
        .sel1   (sel_st_ack_c7)
        );

l2t_dirvec_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_24 dirvec_dirdp_inval_pckt_c7_slice1_2 
        (
        .dout   (dirvec_dirdp_inval_pckt_c7[87:64]),
        .din0   (dirvec_dirdp_inval_pckt_c7_tmp[87:64]),
        .din1   (dirvec_dirdp_inval_pckt_vack[23:0]),
        .sel0   (sel_st_ack_c7_n),
        .sel1   (sel_st_ack_c7)
        );



//msff_ctl_macro ff_dirdp_inval_pckt_c7_slice0_1 (width=32)
//                             (.din(dirdp_inval_pckt_c6[63:32]), 
//                              .scan_in(ff_dirdp_inval_pckt_c7_slice0_1_scanin),
//                              .scan_out(ff_dirdp_inval_pckt_c7_slice0_1_scanout),
//                              .l1clk(l1clk), 
//                              .dout(dirvec_dirdp_inval_pckt_c7_tmp[63:32]), 
//                              
//                              
//); 
//
//msff_ctl_macro ff_dirdp_inval_pckt_c7_slice0_2 (width=32,stack=32r)
//                             (.din(dirdp_inval_pckt_c6[31:0]),
//                              .scan_in(ff_dirdp_inval_pckt_c7_slice0_2_scanin),
//                              .scan_out(ff_dirdp_inval_pckt_c7_slice0_2_scanout),
//                              .l1clk(l1clk),
//                              .dout(dirvec_dirdp_inval_pckt_c7_tmp[31:0]),
//
//
//);
//
//msff_ctl_macro ff_dirdp_inval_pckt_c7_slice1_1 (width=24,stack=24r)
//                             (.din(dirdp_inval_pckt_c6[111:88]),
//                              .scan_in(ff_dirdp_inval_pckt_c7_slice1_1_scanin),
//                              .scan_out(ff_dirdp_inval_pckt_c7_slice1_1_scanout),
//                              .l1clk(l1clk),
//                              .dout(dirvec_dirdp_inval_pckt_c7_tmp[111:88]),
//                              
//                              
//);
//
//msff_ctl_macro ff_dirdp_inval_pckt_c7_slice1_2 (width=24,stack=24r)
//                             (.din(dirdp_inval_pckt_c6[87:64]),
//                              .scan_in(ff_dirdp_inval_pckt_c7_slice1_2_scanin),
//                              .scan_out(ff_dirdp_inval_pckt_c7_slice1_2_scanout),
//                              .l1clk(l1clk),
//                              .dout(dirvec_dirdp_inval_pckt_c7_tmp[87:64]),
//
//
//);

l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dirdp_inval_pckt_c7_slice0 
                             (.din(dirdp_inval_pckt_c6[31:0]),
                              .scan_in(ff_dirdp_inval_pckt_c7_slice0_scanin),
                              .scan_out(ff_dirdp_inval_pckt_c7_slice0_scanout),
                              .l1clk(l1clk), 
                              .dout(dirvec_dirdp_inval_pckt_c7_tmp[31:0]),
  .siclk(siclk),
  .soclk(soclk)
                        );


l2t_dirvec_ctl_msff_ctl_macro__width_24 ff_dirdp_inval_pckt_c7_slice1 
                             (.din(dirdp_inval_pckt_c6[55:32]),
                              .scan_in(ff_dirdp_inval_pckt_c7_slice1_scanin),
                              .scan_out(ff_dirdp_inval_pckt_c7_slice1_scanout),
                              .l1clk(l1clk),  
                              .dout(dirvec_dirdp_inval_pckt_c7_tmp[55:32]),
  .siclk(siclk),
  .soclk(soclk)
                        );

l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dirdp_inval_pckt_c7_slice2 
                             (.din(dirdp_inval_pckt_c6[87:56]),
                              .scan_in(ff_dirdp_inval_pckt_c7_slice2_scanin),
                              .scan_out(ff_dirdp_inval_pckt_c7_slice2_scanout),
                              .l1clk(l1clk),
                              .dout(dirvec_dirdp_inval_pckt_c7_tmp[87:56]),
  .siclk(siclk),
  .soclk(soclk)
                        );

l2t_dirvec_ctl_msff_ctl_macro__width_24 ff_dirdp_inval_pckt_c7_slice3 
                             (.din(dirdp_inval_pckt_c6[111:88]),
                              .scan_in(ff_dirdp_inval_pckt_c7_slice3_scanin),
                              .scan_out(ff_dirdp_inval_pckt_c7_slice3_scanout),
                              .l1clk(l1clk),
                              .dout(dirvec_dirdp_inval_pckt_c7_tmp[111:88]),
  .siclk(siclk),
  .soclk(soclk)
                        );




//************************************************************************************
// WAY info muxes
//************************************************************************************

// STAGE 1
//mux_ctl_macro mux1_way_way_wayvld00_c6 (width=4,ports=4,mux=pgnpe)
//                        ( .dout(way_wayvld00_mux1_c6[3:0]), 
//                                .din0(way_way_vld0_c6[3:0]), 
//                                .din1(way_way_vld4_c6[3:0]), 
//                                .din2(way_way_vld8_c6[3:0]), 
//                                .din3(way_way_vld12_c6[3:0]), 
//                                .sel0(oqu_sel_mux1_c6[0]), 
//                                .sel1(oqu_sel_mux1_c6[1]), 
//                                .sel2(oqu_sel_mux1_c6[2]), 
//                                .sel3(oqu_sel_mux1_c6[3])); 
//
//mux_ctl_macro mux1_way_way_wayvld01_c6 (width=3,ports=4,mux=pgnpe,stack=3l)
//                      ( .dout(way_wayvld01_mux1_c6[2:0]),
//                                .din0(way_way_vld32_c6[2:0]),
//                                .din1(way_way_vld36_c6[2:0]),
//                                .din2(way_way_vld40_c6[2:0]),
//                                .din3(way_way_vld44_c6[2:0]),
//                                .sel0(oqu_sel_mux1_c6[0]),
//                                .sel1(oqu_sel_mux1_c6[1]),
//                                .sel2(oqu_sel_mux1_c6[2]),
//                                .sel3(oqu_sel_mux1_c6[3]));
//
//
//mux_ctl_macro mux1_way_way_wayvld10_c6 (width=4,ports=4,mux=pgnpe,stack=4l)
//                      ( .dout(way_wayvld10_mux1_c6[3:0]),
//                                .din0(way_way_vld64_c6[3:0]),
//                                .din1(way_way_vld68_c6[3:0]),
//                                .din2(way_way_vld72_c6[3:0]),
//                                .din3(way_way_vld76_c6[3:0]),
//                                .sel0(oqu_sel_mux1_c6[0]),
//                                .sel1(oqu_sel_mux1_c6[1]),
//                                .sel2(oqu_sel_mux1_c6[2]),
//                                .sel3(oqu_sel_mux1_c6[3]));
//
//
//
//mux_ctl_macro mux1_way_way_wayvld11_c6 (width=3,ports=4,mux=pgnpe,stack=3l)
//                        ( .dout(way_wayvld11_mux1_c6[2:0]), 
//                                .din0(way_way_vld96_c6[2:0]), 
//                                .din1(way_way_vld100_c6[2:0]), 
//                                .din2(way_way_vld104_c6[2:0]), 
//                                .din3(way_way_vld108_c6[2:0]), 
//                                .sel0(oqu_sel_mux1_c6[0]), 
//                                .sel1(oqu_sel_mux1_c6[1]), 
//                                .sel2(oqu_sel_mux1_c6[2]), 
//                                .sel3(oqu_sel_mux1_c6[3])); 
//

assign {way_wayvld00_mux1_c6[3:0],way_wayvld01_mux1_c6[2:0],way_wayvld10_mux1_c6[3:0],way_wayvld11_mux1_c6[2:0]} = 
	mux1_way_way_wayvld_stage1_dout[13:0];


assign	mux1_way_way_wayvld_stage1_din0[13:0] =	({way_way_vld0_c6[3:0],way_way_vld32_c6[2:0],way_way_vld64_c6[3:0],way_way_vld96_c6[2:0]});
assign	mux1_way_way_wayvld_stage1_din1[13:0] =	({way_way_vld4_c6[3:0],way_way_vld36_c6[2:0],way_way_vld68_c6[3:0],way_way_vld100_c6[2:0]});
assign	mux1_way_way_wayvld_stage1_din2[13:0] =	({way_way_vld8_c6[3:0],way_way_vld40_c6[2:0],way_way_vld72_c6[3:0],way_way_vld104_c6[2:0]});
assign	mux1_way_way_wayvld_stage1_din3[13:0] =	({way_way_vld12_c6[3:0],way_way_vld44_c6[2:0],way_way_vld76_c6[3:0],way_way_vld108_c6[2:0]});

//mux_ctl_macro mux1_way_way_wayvld_stage1_c6	(width=14,ports=4,mux=pgnpe)
//	(
//	.dout	(mux1_way_way_wayvld_stage1_dout[13:0]),
//	.din0	(mux1_way_way_wayvld_stage1_din0[13:0]),
//	.din1	(mux1_way_way_wayvld_stage1_din1[13:0]),
//	.din2	(mux1_way_way_wayvld_stage1_din2[13:0]),
//	.din3	(mux1_way_way_wayvld_stage1_din3[13:0]),
//	.sel0	(oqu_sel_mux1_c6[0]),
//	.sel1	(oqu_sel_mux1_c6[1]),
//	.sel2	(oqu_sel_mux1_c6[2]),
//	.sel3	(oqu_sel_mux1_c6[3])
//	);


always@(mux1_way_way_wayvld_stage1_din0 or mux1_way_way_wayvld_stage1_din1 or 
	mux1_way_way_wayvld_stage1_din2 or mux1_way_way_wayvld_stage1_din3 or oqu_sel_mux1_c6)
begin
case(oqu_sel_mux1_c6)  // synopsys full_case parallel_case
4'b0001	:	mux1_way_way_wayvld_stage1_dout[13:0] = mux1_way_way_wayvld_stage1_din0[13:0];
4'b0010	:	mux1_way_way_wayvld_stage1_dout[13:0] = mux1_way_way_wayvld_stage1_din1[13:0];
4'b0100	:	mux1_way_way_wayvld_stage1_dout[13:0] = mux1_way_way_wayvld_stage1_din2[13:0];
4'b1000	:	mux1_way_way_wayvld_stage1_dout[13:0] = mux1_way_way_wayvld_stage1_din3[13:0];
default : 	mux1_way_way_wayvld_stage1_dout[13:0] = 14'b0;
endcase
end


// STAGE 2
//mux_ctl_macro mux2_way_way_wayvld00_c6 (width=4,ports=4,mux=pgnpe)
//                        ( .dout(way_wayvld00_mux2_c6[3:0]), 
//                                .din0(way_way_vld16_c6[3:0]), 
//                                .din1(way_way_vld20_c6[3:0]), 
//                                .din2(way_way_vld24_c6[3:0]), 
//                                .din3(way_way_vld28_c6[3:0]), 
//                                .sel0(oqu_sel_mux2_c6[0]), 
//                                .sel1(oqu_sel_mux2_c6[1]), 
//                                .sel2(oqu_sel_mux2_c6[2]), 
//                                .sel3(oqu_sel_mux2_c6[3])); 
//mux_ctl_macro mux2_way_way_wayvld01_c6 (width=3,ports=4,mux=pgnpe)
//                      ( .dout(way_wayvld01_mux2_c6[2:0]),
//                                .din0(way_way_vld48_c6[2:0]),
//                                .din1(way_way_vld52_c6[2:0]),
//                                .din2(way_way_vld56_c6[2:0]),
//                                .din3(way_way_vld60_c6[2:0]),
//                                .sel0(oqu_sel_mux2_c6[0]),
//                                .sel1(oqu_sel_mux2_c6[1]),
//                                .sel2(oqu_sel_mux2_c6[2]),
//                                .sel3(oqu_sel_mux2_c6[3]));
//mux_ctl_macro mux2_way_way_wayvld10_c6 (width=4,ports=4,mux=pgnpe)
//                      ( .dout(way_wayvld10_mux2_c6[3:0]),
//                                .din0(way_way_vld80_c6[3:0]),
//                                .din1(way_way_vld84_c6[3:0]),
//                                .din2(way_way_vld88_c6[3:0]),
//                                .din3(way_way_vld92_c6[3:0]),
//                                .sel0(oqu_sel_mux2_c6[0]),
//                                .sel1(oqu_sel_mux2_c6[1]),
//                                .sel2(oqu_sel_mux2_c6[2]),
//                                .sel3(oqu_sel_mux2_c6[3]));
//mux_ctl_macro mux2_way_way_wayvld11_c6 (width=3,ports=4,mux=pgnpe)
//                        ( .dout(way_wayvld11_mux2_c6[2:0]), 
//                                .din0(way_way_vld112_c6[2:0]), 
//                                .din1(way_way_vld116_c6[2:0]), 
//                                .din2(way_way_vld120_c6[2:0]), 
//                                .din3(way_way_vld124_c6[2:0]), 
//                                .sel0(oqu_sel_mux2_c6[0]), 
//                                .sel1(oqu_sel_mux2_c6[1]), 
//                                .sel2(oqu_sel_mux2_c6[2]), 
//                                .sel3(oqu_sel_mux2_c6[3])); 

assign {way_wayvld00_mux2_c6[3:0],way_wayvld01_mux2_c6[2:0],way_wayvld10_mux2_c6[3:0],way_wayvld11_mux2_c6[2:0]} = stage2_dout[13:0];
assign stage2_din0[13:0] = {way_way_vld16_c6[3:0],way_way_vld48_c6[2:0],way_way_vld80_c6[3:0],way_way_vld112_c6[2:0]};
assign stage2_din1[13:0] = {way_way_vld20_c6[3:0],way_way_vld52_c6[2:0],way_way_vld84_c6[3:0],way_way_vld116_c6[2:0]};
assign stage2_din2[13:0] = {way_way_vld24_c6[3:0],way_way_vld56_c6[2:0],way_way_vld88_c6[3:0],way_way_vld120_c6[2:0]};
assign stage2_din3[13:0] = {way_way_vld28_c6[3:0],way_way_vld60_c6[2:0],way_way_vld92_c6[3:0],way_way_vld124_c6[2:0]};




//mux_ctl_macro mux1_way_way_wayvld_stage2_c6	(width=14,ports=4,mux=pgnpe)
//	(
//	.dout	(stage2_dout[13:0]),
//	.din0	(stage2_din0[13:0]),
//	.din1	(stage2_din1[13:0]),
//	.din2	(stage2_din2[13:0]),
//	.din3	(stage2_din3[13:0]),
//	.sel0	(oqu_sel_mux2_c6[0]),
//	.sel1	(oqu_sel_mux2_c6[1]),
//	.sel2	(oqu_sel_mux2_c6[2]),
//	.sel3	(oqu_sel_mux2_c6[3])
//	);

always@(stage2_din0 or stage2_din1 or stage2_din2 or stage2_din3 or oqu_sel_mux2_c6)
begin
case(oqu_sel_mux2_c6)  // synopsys full_case parallel_case
4'b0001 :       stage2_dout[13:0] = stage2_din0[13:0];
4'b0010 :       stage2_dout[13:0] = stage2_din1[13:0];
4'b0100 :       stage2_dout[13:0] = stage2_din2[13:0];
4'b1000 :       stage2_dout[13:0] = stage2_din3[13:0];
default :       stage2_dout[13:0] = 14'b0;
endcase
end





// STAGE 3

//mux_ctl_macro mux3_way_way_wayvld00_c6 (width=4,ports=2,mux=aonpe)
//                        ( .dout(way_wayvld00_mux3_c6[3:0]), 
//                                .din0(way_wayvld00_mux1_c6[3:0]), 
//                                .din1(way_wayvld00_mux2_c6[3:0]), 
//                                .sel0(oqu_sel_mux3_c6), 
//                                .sel1(oqu_sel_mux3_c6_n)); 
// 
//
//mux_ctl_macro mux3_way_way_wayvld01_c6 (width=3,ports=2,mux=aonpe)
//                      ( .dout(way_wayvld01_mux3_c6[2:0]),
//                                .din0(way_wayvld01_mux1_c6[2:0]),
//                                .din1(way_wayvld01_mux2_c6[2:0]),
//                                .sel0(oqu_sel_mux3_c6),
//                                .sel1(oqu_sel_mux3_c6_n));
//
//
//mux_ctl_macro mux3_way_way_wayvld10_c6 (width=4,ports=2,mux=aonpe)
//                      ( .dout(way_wayvld10_mux3_c6[3:0]),
//                                .din0(way_wayvld10_mux1_c6[3:0]),
//                                .din1(way_wayvld10_mux2_c6[3:0]),
//                                .sel0(oqu_sel_mux3_c6),
//                                .sel1(oqu_sel_mux3_c6_n));
//
//
//mux_ctl_macro mux3_way_way_wayvld11_c6 (width=3,ports=2,mux=aonpe,stack=3l)
//                        ( .dout(way_wayvld11_mux3_c6[2:0]), 
//                                .din0(way_wayvld11_mux1_c6[2:0]), 
//                                .din1(way_wayvld11_mux2_c6[2:0]), 
//                                .sel0(oqu_sel_mux3_c6), 
//                                .sel1(oqu_sel_mux3_c6_n)); 

l2t_dirvec_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_14 stage3_mux	
	(
	.dout	({way_wayvld00_mux3_c6[3:0],way_wayvld01_mux3_c6[2:0],way_wayvld10_mux3_c6[3:0],way_wayvld11_mux3_c6[2:0]}),
	.din0	({way_wayvld00_mux1_c6[3:0],way_wayvld01_mux1_c6[2:0],way_wayvld10_mux1_c6[3:0],way_wayvld11_mux1_c6[2:0]}),
	.din1	({way_wayvld00_mux2_c6[3:0],way_wayvld01_mux2_c6[2:0],way_wayvld10_mux2_c6[3:0],way_wayvld11_mux2_c6[2:0]}),
	.sel0	(oqu_sel_mux3_c6),
	.sel1	(oqu_sel_mux3_c6_n)
	);


//************************************************************************************ 
// FLOP way INFO PCKT TILL C6 
//************************************************************************************ 
 
l2t_dirvec_ctl_msff_ctl_macro__width_4 ff_dirvecdp_way_info_c7 
                             (.din(dirvecdp_way_info_c6[3:0]), 
                              .scan_in(ff_dirvecdp_way_info_c7_scanin),
                              .scan_out(ff_dirvecdp_way_info_c7_scanout),
                              .l1clk(l1clk), 
                              .dout(dirvecdp_way_info_c7[3:0]),
  .siclk(siclk),
  .soclk(soclk) 
                              
                              
); 
 
assign	dirvec_dirdp_way_info_c7 = dirvecdp_way_info_c7 ; 
 
//***************************************************************************** 
// PIPELINE FOR DIR VEC GENERATION 
// DC cam hit has to be 128 b. 
// IC cam hit is 64b 
//***************************************************************************** 
 
assign	dc_cam_hit_c5	= 	dc_cam_hit ; 

// BS 03/11/04 extra cycle for mem access

//msff_ctl_macro ff_dc_cam_hit_c52_0 (width=32)
//                             ( .din(dc_cam_hit_c5[127:96]),
//                              .scan_in(ff_dc_cam_hit_c52_0_scanin),
//                              .scan_out(ff_dc_cam_hit_c52_0_scanout),
//                              .l1clk(l1clk),
//                              .dout(dc_cam_hit_c52[127:96]),
//                              
//                              
//);
//
//msff_ctl_macro ff_dc_cam_hit_c52_1 (width=32,stack=32r)
//                             ( .din(dc_cam_hit_c5[95:64]),
//                              .scan_in(ff_dc_cam_hit_c52_1_scanin),
//                              .scan_out(ff_dc_cam_hit_c52_1_scanout),
//                              .l1clk(l1clk),
//                              .dout(dc_cam_hit_c52[95:64]),
//
//
//);
//msff_ctl_macro ff_dc_cam_hit_c52_2 (width=32,stack=32r)
//                             ( .din(dc_cam_hit_c5[63:32]),
//                              .scan_in(ff_dc_cam_hit_c52_2_scanin),
//                              .scan_out(ff_dc_cam_hit_c52_2_scanout),
//                              .l1clk(l1clk),
//                              .dout(dc_cam_hit_c52[63:32]),
//
//
//);
//msff_ctl_macro ff_dc_cam_hit_c52_3 (width=32,stack=32r)
//                             ( .din(dc_cam_hit_c5[31:0]),
//                              .scan_in(ff_dc_cam_hit_c52_3_scanin),
//                              .scan_out(ff_dc_cam_hit_c52_3_scanout),
//                              .l1clk(l1clk),
//                              .dout(dc_cam_hit_c52[31:0]),
//
//
//);
//msff_ctl_macro ff_dc_cam_hit_c6_0 (width=32,stack=32r)
//                             ( .din(dc_cam_hit_c52[127:96]), 
//                              .scan_in(ff_dc_cam_hit_c6_0_scanin),
//                              .scan_out(ff_dc_cam_hit_c6_0_scanout),
//                              .l1clk(l1clk), 
//                              .dout(dc_cam_hit_c6[127:96]), 
//                              
//                              
//); 
//
//msff_ctl_macro ff_dc_cam_hit_c6_1 (width=32,stack=32r)
//                             ( .din(dc_cam_hit_c52[95:64]),
//                              .scan_in(ff_dc_cam_hit_c6_1_scanin),
//                              .scan_out(ff_dc_cam_hit_c6_1_scanout),
//                              .l1clk(l1clk),
//                              .dout(dc_cam_hit_c6[95:64]),
//
//
//);
//msff_ctl_macro ff_dc_cam_hit_c6_2 (width=32,stack=32r)
//                             ( .din(dc_cam_hit_c52[63:32]),
//                              .scan_in(ff_dc_cam_hit_c6_2_scanin),
//                              .scan_out(ff_dc_cam_hit_c6_2_scanout),
//                              .l1clk(l1clk),
//                              .dout(dc_cam_hit_c6[63:32]),
//
//
//);
//msff_ctl_macro ff_dc_cam_hit_c6_3 (width=32,stack=32r)
//                             ( .din(dc_cam_hit_c52[31:0]),
//                              .scan_in(ff_dc_cam_hit_c6_3_scanin),
//                              .scan_out(ff_dc_cam_hit_c6_3_scanout),
//                              .l1clk(l1clk),
//                              .dout(dc_cam_hit_c6[31:0]),
//
//
//);



l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dc_cam_hit_c52_4 
                             ( .din(dc_cam_hit_c5[127:96]),
                              .scan_in(ff_dc_cam_hit_c52_4_scanin),
                              .scan_out(ff_dc_cam_hit_c52_4_scanout),
                              .l1clk(l1clk),
                              .dout(dc_cam_hit_c52[127:96]),
  .siclk(siclk),
  .soclk(soclk)
                              
                              
);

l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dc_cam_hit_c52_3 
                             ( .din(dc_cam_hit_c5[95:64]),
                              .scan_in(ff_dc_cam_hit_c52_3_scanin),
                              .scan_out(ff_dc_cam_hit_c52_3_scanout),
                              .l1clk(l1clk),
                              .dout(dc_cam_hit_c52[95:64]),
  .siclk(siclk),
  .soclk(soclk)


);
l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dc_cam_hit_c52_2 
                             ( .din(dc_cam_hit_c5[63:32]),
                              .scan_in(ff_dc_cam_hit_c52_2_scanin),
                              .scan_out(ff_dc_cam_hit_c52_2_scanout),
                              .l1clk(l1clk),
                              .dout(dc_cam_hit_c52[63:32]),
  .siclk(siclk),
  .soclk(soclk)


);
l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dc_cam_hit_c52_1 
                             ( .din(dc_cam_hit_c5[31:0]),
                              .scan_in(ff_dc_cam_hit_c52_1_scanin),
                              .scan_out(ff_dc_cam_hit_c52_1_scanout),
                              .l1clk(l1clk),
                              .dout(dc_cam_hit_c52[31:0]),
  .siclk(siclk),
  .soclk(soclk)


);

 
l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dc_cam_hit_c6_4 
                             ( .din(dc_cam_hit_c52[127:96]), 
                              .scan_in(ff_dc_cam_hit_c6_4_scanin),
                              .scan_out(ff_dc_cam_hit_c6_4_scanout),
                              .l1clk(l1clk), 
                              .dout(dc_cam_hit_c6[127:96]),
  .siclk(siclk),
  .soclk(soclk) 
                              
                              
); 

l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dc_cam_hit_c6_3 
                             ( .din(dc_cam_hit_c52[95:64]),
                              .scan_in(ff_dc_cam_hit_c6_3_scanin),
                              .scan_out(ff_dc_cam_hit_c6_3_scanout),
                              .l1clk(l1clk),
                              .dout(dc_cam_hit_c6[95:64]),
  .siclk(siclk),
  .soclk(soclk)


);
l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dc_cam_hit_c6_2 
                             ( .din(dc_cam_hit_c52[63:32]),
                              .scan_in(ff_dc_cam_hit_c6_2_scanin),
                              .scan_out(ff_dc_cam_hit_c6_2_scanout),
                              .l1clk(l1clk),
                              .dout(dc_cam_hit_c6[63:32]),
  .siclk(siclk),
  .soclk(soclk)


);
l2t_dirvec_ctl_msff_ctl_macro__width_32 ff_dc_cam_hit_c6_1 
                             ( .din(dc_cam_hit_c52[31:0]),
                              .scan_in(ff_dc_cam_hit_c6_1_scanin),
                              .scan_out(ff_dc_cam_hit_c6_1_scanout),
                              .l1clk(l1clk),
                              .dout(dc_cam_hit_c6[31:0]),
  .siclk(siclk),
  .soclk(soclk)


);






// BS and SR 11/18/03 Support for 8 way I$

assign ic_cam_hit_reorg_c5 = {ic_cam_hit[127:124], ic_cam_hit[95:92],
			      ic_cam_hit[123:120], ic_cam_hit[91:88],
			      ic_cam_hit[119:116], ic_cam_hit[87:84],
			      ic_cam_hit[115:112], ic_cam_hit[83:80],
			      ic_cam_hit[111:108], ic_cam_hit[79:76],
			      ic_cam_hit[107:104], ic_cam_hit[75:72],
			      ic_cam_hit[103:100], ic_cam_hit[71:68],
			      ic_cam_hit[99:96],   ic_cam_hit[67:64],
			      ic_cam_hit[63:60],   ic_cam_hit[31:28],
			      ic_cam_hit[59:56],   ic_cam_hit[27:24],
			      ic_cam_hit[55:52],   ic_cam_hit[23:20],
			      ic_cam_hit[51:48],   ic_cam_hit[19:16],
			      ic_cam_hit[47:44],   ic_cam_hit[15:12],
			      ic_cam_hit[43:40],   ic_cam_hit[11:8],
			      ic_cam_hit[39:36],   ic_cam_hit[7:4],
			      ic_cam_hit[35:32],   ic_cam_hit[3:0]};

// BS 03/11/04 extra cycle for mem access

//msff_ctl_macro ff_ic_cam_hit_c52_2 (width=32,stack=32r) // BS and SR 11/18/03 Support for 8 way I$
//                            ( .din(ic_cam_hit_reorg_c5[63:32]),
//                              .scan_in(ff_ic_cam_hit_c52_2_scanin),
//                              .scan_out(ff_ic_cam_hit_c52_2_scanout),
//                              .l1clk(l1clk),
//                              .dout(ic_cam_hit_reorg_c52[63:32]),
//                              
//                              
//);
//
//msff_ctl_macro ff_ic_cam_hit_c52_1 (width=32,stack=32r) // BS and SR 11/18/03 Support for 8 way I$
//                            ( .din(ic_cam_hit_reorg_c5[31:0]),
//                              .scan_in(ff_ic_cam_hit_c52_1_scanin),
//                              .scan_out(ff_ic_cam_hit_c52_1_scanout),
//                              .l1clk(l1clk),
//                              .dout(ic_cam_hit_reorg_c52[31:0]),
//
//
//);


l2t_dirvec_ctl_msff_ctl_macro__width_64 ff_ic_cam_hit_c52_1  // BS and SR 11/18/03 Support for 8 way I$
                           ( .din(ic_cam_hit_reorg_c5[63:0]),
                             .scan_in(ff_ic_cam_hit_c52_1_scanin),
                             .scan_out(ff_ic_cam_hit_c52_1_scanout),
                             .l1clk(l1clk),
                             .dout(ic_cam_hit_reorg_c52[63:0]),
  .siclk(siclk),
  .soclk(soclk)
       			);


//msff_ctl_macro ff_ic_cam_hit_c52_4 (width=32) // BS and SR 11/18/03 Support for 8 way I$
//		( 
//		.scan_in(ff_ic_cam_hit_c52_4_scanin),
//		.scan_out(ff_ic_cam_hit_c52_4_scanout),
//		.din(ic_cam_hit_reorg_c5[127:96]),
//		.l1clk(l1clk),
//		.dout(ic_cam_hit_reorg_c52[127:96]),
//		);
//
//msff_ctl_macro ff_ic_cam_hit_c52_3 (width=32stack=32r) // BS and SR 11/18/03 Support for 8 way I$
//                            ( .din(ic_cam_hit_reorg_c5[95:64]),
//                              .scan_in(ff_ic_cam_hit_c52_3_scanin),
//                              .scan_out(ff_ic_cam_hit_c52_3_scanout),
//                              .l1clk(l1clk),
//                              .dout(ic_cam_hit_reorg_c52[95:64]),
//
//
//);

l2t_dirvec_ctl_msff_ctl_macro__width_64 ff_ic_cam_hit_c52_3  // BS and SR 11/18/03 Support for 8 way I$
                           ( .din(ic_cam_hit_reorg_c5[127:64]),
                             .scan_in(ff_ic_cam_hit_c52_3_scanin),
                             .scan_out(ff_ic_cam_hit_c52_3_scanout),
                             .l1clk(l1clk),
                             .dout(ic_cam_hit_reorg_c52[127:64]),
  .siclk(siclk),
  .soclk(soclk)
                               );




 
//msff_ctl_macro ff_ic_cam_hit_c6_2 (width=32) // BS and SR 11/18/03 Support for 8 way I$
//                            ( .din(ic_cam_hit_reorg_c52[63:32]), 
//                              .scan_in(ff_ic_cam_hit_c6_2_scanin),
//                              .scan_out(ff_ic_cam_hit_c6_2_scanout),
//                              .l1clk(l1clk), 
//                              .dout(ic_cam_hit_c6[63:32]), 
//                              
//                              
//); 
//
//msff_ctl_macro ff_ic_cam_hit_c6_1 (width=32) // BS and SR 11/18/03 Support for 8 way I$
//                            ( .din(ic_cam_hit_reorg_c52[31:0]),
//                              .scan_in(ff_ic_cam_hit_c6_1_scanin),
//                              .scan_out(ff_ic_cam_hit_c6_1_scanout),
//                              .l1clk(l1clk),
//                              .dout(ic_cam_hit_c6[31:0]),
//
//
//);



l2t_dirvec_ctl_msff_ctl_macro__width_64 ff_ic_cam_hit_c6_1  // BS and SR 11/18/03 Support for 8 way I$
                           ( .din(ic_cam_hit_reorg_c52[63:0]),
                             .scan_in(ff_ic_cam_hit_c6_1_scanin),
                             .scan_out(ff_ic_cam_hit_c6_1_scanout),
                             .l1clk(l1clk),
                             .dout(ic_cam_hit_c6[63:0]),
  .siclk(siclk),
  .soclk(soclk)
       			);


 
//msff_ctl_macro ff_ic_cam_hit_c6_4 (width=32) // BS and SR 11/18/03 Support for 8 way I$
//                            ( .din(ic_cam_hit_reorg_c52[127:96]), 
//                              .scan_in(ff_ic_cam_hit_c6_4_scanin),
//                              .scan_out(ff_ic_cam_hit_c6_4_scanout),
//                              .l1clk(l1clk), 
//                              .dout(ic_cam_hit_c6[127:96]), 
//                              
//                              
//); 
//
//msff_ctl_macro ff_ic_cam_hit_c6_3 (width=32stack=32r) // BS and SR 11/18/03 Support for 8 way I$
//                            ( .din(ic_cam_hit_reorg_c52[95:64]),
//                              .scan_in(ff_ic_cam_hit_c6_3_scanin),
//                              .scan_out(ff_ic_cam_hit_c6_3_scanout),
//                              .l1clk(l1clk),
//                              .dout(ic_cam_hit_c6[95:64]),
//
//
//);

l2t_dirvec_ctl_msff_ctl_macro__width_64 ff_ic_cam_hit_c6_3  // BS and SR 11/18/03 Support for 8 way I$
                            ( .din(ic_cam_hit_reorg_c52[127:64]),
                              .scan_in(ff_ic_cam_hit_c6_3_scanin),
                              .scan_out(ff_ic_cam_hit_c6_3_scanout),
                              .l1clk(l1clk),
                              .dout(ic_cam_hit_c6[127:64]),
  .siclk(siclk),
  .soclk(soclk)
                        );

 
 
//***************************************************************************** 
// FORM THE 112b PACKET in C4 ( step 1) 
// Get the request vect to be sent to oque  
// Get the I$ and D$ invalidation way for L1 load misses. 
// DC cam hit has to be 128 b. 
// IC cam hit is 64b 
//***************************************************************************** 
 
 


l2t_dcicvec_ctl	vec0_slice	
	(
	.dc_cam_hit	(dc_cam_hit_c6[3:0]),
	.ic_cam_hit	(ic_cam_hit_c6[7:0]),
	.way_way_vld_c6	(way_way_vld0_c6[3:0]),
//	.dir_hit	(dir_hit_vec0_c6_unused),
	.enc_vec	(enc_c_vec0[3:0])
	);


l2t_dcicvec_ctl     vec4_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[7:4]),
        .ic_cam_hit     (ic_cam_hit_c6[15:8]),
        .way_way_vld_c6 (way_way_vld4_c6[3:0]),
       // .dir_hit        (dir_hit_vec4_c6_unused),
	.enc_vec	(enc_c_vec4[3:0])
        );


l2t_dcicvec_ctl     vec8_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[11:8]),
        .ic_cam_hit     (ic_cam_hit_c6[23:16]),
        .way_way_vld_c6 (way_way_vld8_c6[3:0]),
       // .dir_hit        (dir_hit_vec8_c6),
	.enc_vec	(enc_c_vec8[3:0])
        );


l2t_dcicvec_ctl     vec12_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[15:12]),
        .ic_cam_hit     (ic_cam_hit_c6[31:24]),
        .way_way_vld_c6 (way_way_vld12_c6[3:0]),
       // .dir_hit        (dir_hit_vec12_c6),
	.enc_vec	(enc_c_vec12[3:0])
        );


l2t_dcicvec_ctl     vec16_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[19:16]),
        .ic_cam_hit     (ic_cam_hit_c6[39:32]),
        .way_way_vld_c6 (way_way_vld16_c6[3:0]),
       // .dir_hit        (dir_hit_vec16_c6),
	.enc_vec	(enc_c_vec16[3:0])
        );


l2t_dcicvec_ctl     vec20_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[23:20]),
        .ic_cam_hit     (ic_cam_hit_c6[47:40]),
        .way_way_vld_c6 (way_way_vld20_c6[3:0]),
       // .dir_hit        (dir_hit_vec20_c6),
	.enc_vec	(enc_c_vec20[3:0])
        );


l2t_dcicvec_ctl     vec24_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[27:24]),
        .ic_cam_hit     (ic_cam_hit_c6[55:48]),
        .way_way_vld_c6 (way_way_vld24_c6[3:0]),
	.enc_vec	(enc_c_vec24[3:0])
       // .dir_hit        (dir_hit_vec24_c6)
        );

l2t_dcicvec_ctl     vec28_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[31:28]),
        .ic_cam_hit     (ic_cam_hit_c6[63:56]),
        .way_way_vld_c6 (way_way_vld28_c6[3:0]),
       // .dir_hit        (dir_hit_vec28_c6),
	.enc_vec	(enc_c_vec28[3:0])
        );


 
	  
///***************** START code for generating way wayvld00  ******************/ 
//wire	[3:0]	way_wayvld00_mux1_c6; 
//wire	[3:0]	way_wayvld00_mux2_c6; 
//wire	[3:0]	way_wayvld00_mux3_c6; 
// 
//mux_ctl_macro mux1_way_way_wayvld00_c6 (width=4,ports=4,mux=pgnpe,stack=4l)
//			( .dout(way_wayvld00_mux1_c6[3:0]), 
//                              	.din0(way_way_vld0_c6[3:0]), 
//                              	.din1(way_way_vld4_c6[3:0]), 
//                              	.din2(way_way_vld8_c6[3:0]), 
//                              	.din3(way_way_vld12_c6[3:0]), 
//                              	.sel0(oqu_sel_mux1_c6[0]), 
//                              	.sel1(oqu_sel_mux1_c6[1]), 
//                              	.sel2(oqu_sel_mux1_c6[2]), 
//                              	.sel3(oqu_sel_mux1_c6[3])); 
// 
//mux_ctl_macro mux2_way_way_wayvld00_c6 (width=4,ports=4,mux=pgnpe,stack=4l)
//			( .dout(way_wayvld00_mux2_c6[3:0]), 
//                                .din0(way_way_vld16_c6[3:0]), 
//                                .din1(way_way_vld20_c6[3:0]), 
//                                .din2(way_way_vld24_c6[3:0]), 
//                                .din3(way_way_vld28_c6[3:0]), 
//                                .sel0(oqu_sel_mux2_c6[0]), 
//                                .sel1(oqu_sel_mux2_c6[1]), 
//                                .sel2(oqu_sel_mux2_c6[2]), 
//                                .sel3(oqu_sel_mux2_c6[3])); 
//
//mux_ctl_macro mux3_way_way_wayvld00_c6 (width=4,ports=2,mux=aonpe,stack=4l)
//			( .dout(way_wayvld00_mux3_c6[3:0]), 
//                                .din0(way_wayvld00_mux1_c6[3:0]), 
//                                .din1(way_wayvld00_mux2_c6[3:0]), 
//                                .sel0(oqu_sel_mux3_c6), 
//                                .sel1(oqu_sel_mux3_c6_n)); 


//inv_macro oqu_sel_mux3_c6_inv_slice (width=1)
//        (
//        .dout   (oqu_sel_mux3_c6_n ),
//        .din    (oqu_sel_mux3_c6 )
//        );


assign oqu_sel_mux3_c6_n = ~oqu_sel_mux3_c6;




 
		 

l2t_dcvec_ctl	vec32_slice
	(
   	.dc_cam_hit	(dc_cam_hit_c6[35:32]),
   	.way_way_vld	(way_way_vld32_c6[2:0]),
   	.enc_dc_way	(enc_c_vec32_way_c6[1:0]),
   	.dc_dir_hit	(dc_dir_vec32_c6)
   //	.dir_hit	(dir_hit_vec32_c6)
	);









l2t_dcvec_ctl   vec36_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[39:36]),
        .way_way_vld    (way_way_vld36_c6[2:0]),
        .enc_dc_way     (enc_c_vec36_way_c6[1:0]),
        .dc_dir_hit     (dc_dir_vec36_c6)
       // .dir_hit        (dir_hit_vec36_c6)
        );


l2t_dcvec_ctl   vec40_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[43:40]),
        .way_way_vld    (way_way_vld40_c6[2:0]),
        .enc_dc_way     (enc_c_vec40_way_c6[1:0]),
        .dc_dir_hit     (dc_dir_vec40_c6)
       // .dir_hit        (dir_hit_vec40_c6)
        );


l2t_dcvec_ctl   vec44_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[47:44]),
        .way_way_vld    (way_way_vld44_c6[2:0]),
        .enc_dc_way     (enc_c_vec44_way_c6[1:0]),
        .dc_dir_hit     (dc_dir_vec44_c6)
       // .dir_hit        (dir_hit_vec44_c6)
        );


l2t_dcvec_ctl   vec48_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[51:48]),
        .way_way_vld    (way_way_vld48_c6[2:0]),
        .enc_dc_way     (enc_c_vec48_way_c6[1:0]),
        .dc_dir_hit     (dc_dir_vec48_c6)
       // .dir_hit        (dir_hit_vec48_c6)
        );



 


l2t_dcvec_ctl   vec52_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[55:52]), 
        .way_way_vld    (way_way_vld52_c6[2:0]),
        .enc_dc_way     (enc_c_vec52_way_c6[1:0]),
        .dc_dir_hit     (dc_dir_vec52_c6)
       // .dir_hit        (dir_hit_vec52_c6)
        );

 

l2t_dcvec_ctl   vec56_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[59:56]),
        .way_way_vld    (way_way_vld56_c6[2:0]),
        .enc_dc_way     (enc_c_vec56_way_c6[1:0]),
        .dc_dir_hit     (dc_dir_vec56_c6)
       // .dir_hit        (dir_hit_vec56_c6)
        );


 

l2t_dcvec_ctl   vec60_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[63:60]),
        .way_way_vld    (way_way_vld60_c6[2:0]),
        .enc_dc_way     (enc_c_vec60_way_c6[1:0]),
        .dc_dir_hit     (dc_dir_vec60_c6)
       // .dir_hit        (dir_hit_vec60_c6)
        );


// 
//		/***************** END code for generating return pckt. ******************/ 
//	 
// 
//                wire    [2:0]   way_wayvld01_mux1_c6; 
//                wire    [2:0]   way_wayvld01_mux2_c6; 
//                wire    [2:0]   way_wayvld01_mux3_c6; 
// 
//mux_ctl_macro mux1_way_way_wayvld01_c6 (width=3,ports=4,mux=pgnpe,stack=3l)
//			( .dout(way_wayvld01_mux1_c6[2:0]), 
//                                .din0(way_way_vld32_c6[2:0]), 
//                                .din1(way_way_vld36_c6[2:0]), 
//                                .din2(way_way_vld40_c6[2:0]), 
//                                .din3(way_way_vld44_c6[2:0]), 
//                                .sel0(oqu_sel_mux1_c6[0]), 
//                                .sel1(oqu_sel_mux1_c6[1]), 
//                                .sel2(oqu_sel_mux1_c6[2]), 
//                                .sel3(oqu_sel_mux1_c6[3])); 
// 
//mux_ctl_macro mux2_way_way_wayvld01_c6 (width=3,ports=4,mux=pgnpe,stack=3l)
//			( .dout(way_wayvld01_mux2_c6[2:0]), 
//                                .din0(way_way_vld48_c6[2:0]), 
//                                .din1(way_way_vld52_c6[2:0]), 
//                                .din2(way_way_vld56_c6[2:0]), 
//                                .din3(way_way_vld60_c6[2:0]), 
//                                .sel0(oqu_sel_mux2_c6[0]), 
//                                .sel1(oqu_sel_mux2_c6[1]), 
//                                .sel2(oqu_sel_mux2_c6[2]), 
//                                .sel3(oqu_sel_mux2_c6[3])); 
// 
//
//mux_ctl_macro mux3_way_way_wayvld01_c6 (width=3,ports=2,mux=aonpe,stack=3l)
//			( .dout(way_wayvld01_mux3_c6[2:0]), 
//                                .din0(way_wayvld01_mux1_c6[2:0]), 
//                                .din1(way_wayvld01_mux2_c6[2:0]), 
//                                .sel0(oqu_sel_mux3_c6), 
//                                .sel1(oqu_sel_mux3_c6_n)); 
// 
                 

l2t_dcicvec_ctl	vec64_slice	
	(
	.dc_cam_hit	(dc_cam_hit_c6[67:64]),
	.ic_cam_hit	(ic_cam_hit_c6[71:64]),
	.way_way_vld_c6	(way_way_vld64_c6[3:0]),
//	.dir_hit	(dir_hit_vec64_c6),
	.enc_vec	(enc_c_vec64[3:0])
	);


l2t_dcicvec_ctl     vec68_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[71:68]),
        .ic_cam_hit     (ic_cam_hit_c6[79:72]),
        .way_way_vld_c6 (way_way_vld68_c6[3:0]),
	.enc_vec	(enc_c_vec68[3:0])
       // .dir_hit        (dir_hit_vec68_c6)
        );



l2t_dcicvec_ctl     vec72_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[75:72]),
        .ic_cam_hit     (ic_cam_hit_c6[87:80]),
        .way_way_vld_c6 (way_way_vld72_c6[3:0]),
	.enc_vec	(enc_c_vec72[3:0])
       // .dir_hit        (dir_hit_vec72_c6)
        );

l2t_dcicvec_ctl     vec76_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[79:76]),
        .ic_cam_hit     (ic_cam_hit_c6[95:88]),
        .way_way_vld_c6 (way_way_vld76_c6[3:0]),
       // .dir_hit        (dir_hit_vec76_c6),
	.enc_vec	(enc_c_vec76[3:0])
        );



l2t_dcicvec_ctl     vec80_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[83:80]),
        .ic_cam_hit     (ic_cam_hit_c6[103:96]),
        .way_way_vld_c6 (way_way_vld80_c6[3:0]),
       // .dir_hit        (dir_hit_vec80_c6),
	.enc_vec	(enc_c_vec80[3:0])
        );


l2t_dcicvec_ctl     vec84_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[87:84]),
        .ic_cam_hit     (ic_cam_hit_c6[111:104]),
        .way_way_vld_c6 (way_way_vld84_c6[3:0]),
	.enc_vec	(enc_c_vec84[3:0])
       // .dir_hit        (dir_hit_vec84_c6)
        );
l2t_dcicvec_ctl     vec88_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[91:88]),
        .ic_cam_hit     (ic_cam_hit_c6[119:112]),
        .way_way_vld_c6 (way_way_vld88_c6[3:0]),
       // .dir_hit        (dir_hit_vec88_c6),
	.enc_vec	(enc_c_vec88[3:0])
        );



l2t_dcicvec_ctl     vec92_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[95:92]),
        .ic_cam_hit     (ic_cam_hit_c6[127:120]),
        .way_way_vld_c6 (way_way_vld92_c6[3:0]),
       // .dir_hit        (dir_hit_vec92_c6),
	.enc_vec	(enc_c_vec92[3:0])
        );

		/***************** END code for generating return pckt. ******************/ 
//         
// 
//                wire    [3:0]   way_wayvld10_mux1_c6; 
//                wire    [3:0]   way_wayvld10_mux2_c6; 
//                wire    [3:0]   way_wayvld10_mux3_c6; 
// 
//mux_ctl_macro mux1_way_way_wayvld10_c6 (width=4,ports=4,mux=pgnpe,stack=4l)
//			( .dout(way_wayvld10_mux1_c6[3:0]), 
//                                .din0(way_way_vld64_c6[3:0]), 
//                                .din1(way_way_vld68_c6[3:0]), 
//                                .din2(way_way_vld72_c6[3:0]), 
//                                .din3(way_way_vld76_c6[3:0]), 
//                                .sel0(oqu_sel_mux1_c6[0]), 
//                                .sel1(oqu_sel_mux1_c6[1]), 
//                                .sel2(oqu_sel_mux1_c6[2]), 
//                                .sel3(oqu_sel_mux1_c6[3])); 
// 
//mux_ctl_macro mux2_way_way_wayvld10_c6 (width=4,ports=4,mux=pgnpe,stack=4l)
//			( .dout(way_wayvld10_mux2_c6[3:0]), 
//                                .din0(way_way_vld80_c6[3:0]), 
//                                .din1(way_way_vld84_c6[3:0]), 
//                                .din2(way_way_vld88_c6[3:0]), 
//                                .din3(way_way_vld92_c6[3:0]), 
//                                .sel0(oqu_sel_mux2_c6[0]), 
//                                .sel1(oqu_sel_mux2_c6[1]), 
//                                .sel2(oqu_sel_mux2_c6[2]), 
//                                .sel3(oqu_sel_mux2_c6[3])); 
//
//mux_ctl_macro mux3_way_way_wayvld10_c6 (width=4,ports=2,mux=aonpe,stack=4l)
//			( .dout(way_wayvld10_mux3_c6[3:0]), 
//                                .din0(way_wayvld10_mux1_c6[3:0]), 
//                                .din1(way_wayvld10_mux2_c6[3:0]), 
//                                .sel0(oqu_sel_mux3_c6), 
//                                .sel1(oqu_sel_mux3_c6_n)); 
//

                 
l2t_dcvec_ctl   vec96_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[99:96]),
        .way_way_vld    (way_way_vld96_c6[2:0]),   
        .enc_dc_way     (enc_c_vec96_way_c6[1:0]), 
        .dc_dir_hit     (dc_dir_vec96_c6)
       // .dir_hit        (dir_hit_vec96_c6)
        );




l2t_dcvec_ctl   vec100_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[103:100]),
        .way_way_vld    (way_way_vld100_c6[2:0]),   
        .enc_dc_way     (enc_c_vec100_way_c6[1:0]), 
        .dc_dir_hit     (dc_dir_vec100_c6)
       // .dir_hit        (dir_hit_vec100_c6)
        );




l2t_dcvec_ctl   vec104_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[107:104]),
        .way_way_vld    (way_way_vld104_c6[2:0]),   
        .enc_dc_way     (enc_c_vec104_way_c6[1:0]), 
        .dc_dir_hit     (dc_dir_vec104_c6)
       // .dir_hit        (dir_hit_vec104_c6)
        );



l2t_dcvec_ctl   vec108_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[111:108]),
        .way_way_vld    (way_way_vld108_c6[2:0]),   
        .enc_dc_way     (enc_c_vec108_way_c6[1:0]), 
        .dc_dir_hit     (dc_dir_vec108_c6)
       // .dir_hit        (dir_hit_vec108_c6)
        );




l2t_dcvec_ctl   vec112_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[115:112]),
        .way_way_vld    (way_way_vld112_c6[2:0]),   
        .enc_dc_way     (enc_c_vec112_way_c6[1:0]), 
        .dc_dir_hit     (dc_dir_vec112_c6)
       // .dir_hit        (dir_hit_vec112_c6)
        );





l2t_dcvec_ctl   vec116_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[119:116]),
        .way_way_vld    (way_way_vld116_c6[2:0]),   
        .enc_dc_way     (enc_c_vec116_way_c6[1:0]), 
        .dc_dir_hit     (dc_dir_vec116_c6)
       // .dir_hit        (dir_hit_vec116_c6)
        );


l2t_dcvec_ctl   vec120_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[123:120]),
        .way_way_vld    (way_way_vld120_c6[2:0]),   
        .enc_dc_way     (enc_c_vec120_way_c6[1:0]), 
        .dc_dir_hit     (dc_dir_vec120_c6)
       // .dir_hit        (dir_hit_vec120_c6)
        );



l2t_dcvec_ctl   vec124_slice
        (
        .dc_cam_hit     (dc_cam_hit_c6[127:124]),
        .way_way_vld    (way_way_vld124_c6[2:0]),   
        .enc_dc_way     (enc_c_vec124_way_c6[1:0]), 
        .dc_dir_hit     (dc_dir_vec124_c6)
       // .dir_hit        (dir_hit_vec124_c6)
        );




/////***************** END code for generating return pckt. ******************/ 
//         
// 
//                wire    [2:0]   way_wayvld11_mux1_c6; 
//                wire    [2:0]   way_wayvld11_mux2_c6; 
//                wire    [2:0]   way_wayvld11_mux3_c6; 
// 
//mux_ctl_macro mux1_way_way_wayvld11_c6 (width=3,ports=4,mux=pgnpe,stack=3l)
//			( .dout(way_wayvld11_mux1_c6[2:0]), 
//                                .din0(way_way_vld96_c6[2:0]), 
//                                .din1(way_way_vld100_c6[2:0]), 
//                                .din2(way_way_vld104_c6[2:0]), 
//                                .din3(way_way_vld108_c6[2:0]), 
//                                .sel0(oqu_sel_mux1_c6[0]), 
//                                .sel1(oqu_sel_mux1_c6[1]), 
//                                .sel2(oqu_sel_mux1_c6[2]), 
//                                .sel3(oqu_sel_mux1_c6[3])); 
// 
//mux_ctl_macro mux2_way_way_wayvld11_c6 (width=3,ports=4,mux=pgnpe,stack=3l)
//			( .dout(way_wayvld11_mux2_c6[2:0]), 
//                                .din0(way_way_vld112_c6[2:0]), 
//                                .din1(way_way_vld116_c6[2:0]), 
//                                .din2(way_way_vld120_c6[2:0]), 
//                                .din3(way_way_vld124_c6[2:0]), 
//                                .sel0(oqu_sel_mux2_c6[0]), 
//                                .sel1(oqu_sel_mux2_c6[1]), 
//                                .sel2(oqu_sel_mux2_c6[2]), 
//                                .sel3(oqu_sel_mux2_c6[3])); 
// 
//
//mux_ctl_macro mux3_way_way_wayvld11_c6 (width=3,ports=2,mux=aonpe,stack=3l)
//			( .dout(way_wayvld11_mux3_c6[2:0]), 
//                                .din0(way_wayvld11_mux1_c6[2:0]), 
//                                .din1(way_wayvld11_mux2_c6[2:0]), 
//                                .sel0(oqu_sel_mux3_c6), 
//                                .sel1(oqu_sel_mux3_c6_n)); 
// 
//                 
// 
////******************************************************************************************* 
// REQUEST VEC FORMATION 
//******************************************************************************************* 
 

// B.S : 05/04/05 . FIx for bug 92618. The dirvec_dirdp_req_vec_c6[7:0] needs to created 
// based on enc_c_vec*_fnl values
// due to the remapping for partial core,bank mode after directory caming from virtual 
// cpuid to real cpuid. 

wire [3:0] enc_c_vec0_fnl,enc_c_vec4_fnl,enc_c_vec8_fnl,enc_c_vec12_fnl,enc_c_vec16_fnl,enc_c_vec20_fnl,
           enc_c_vec24_fnl,enc_c_vec28_fnl;
wire [2:0] enc_c_vec32_fnl,enc_c_vec36_fnl,enc_c_vec40_fnl,enc_c_vec44_fnl,enc_c_vec48_fnl,enc_c_vec52_fnl,
           enc_c_vec56_fnl,enc_c_vec60_fnl;
wire [3:0] enc_c_vec64_fnl,enc_c_vec68_fnl,enc_c_vec72_fnl,enc_c_vec76_fnl,enc_c_vec80_fnl,enc_c_vec84_fnl,
           enc_c_vec88_fnl,enc_c_vec92_fnl;
wire [2:0] enc_c_vec96_fnl,enc_c_vec100_fnl,enc_c_vec104_fnl,enc_c_vec108_fnl,enc_c_vec112_fnl,enc_c_vec116_fnl,
           enc_c_vec120_fnl,enc_c_vec124_fnl;





//or_macro        dirvec_dirdp_req_vec_c6_0_slice_1  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec0_fnl[0]),
//        .din1   (enc_c_vec32_fnl[0]),
//        .din2   (enc_c_vec0_fnl[1]),
//        .dout   (dir_hit_vec0_or_32_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_0_slice_12  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec32_fnl[1]),
//        .din1   (dir_hit_vec0_or_32_tmp),
//        .dout   (dir_hit_vec0_or_32)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_0_slice_2  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec64_fnl[0]),
//        .din1   (enc_c_vec96_fnl[0]),
//        .din2   (enc_c_vec64_fnl[1]),
//        .dout   (dir_hit_vec64_or_96_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_0_slice_22  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec96_fnl[1]),
//        .din1   (dir_hit_vec64_or_96_tmp),
//        .dout   (dir_hit_vec64_or_96)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_slice1  (width=1)
//        (
//        .din0   (dir_hit_vec0_or_32),
//        .din1   (dir_hit_vec64_or_96),
//        .dout   (dirvec_dirdp_req_vec_c6[0])
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_1_slice_2  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec4_fnl[0]),
//        .din1   (enc_c_vec36_fnl[0]),
//        .din2   (enc_c_vec4_fnl[1]),
//        .dout   (dir_hit_vec4_or_36_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_1_slice_22  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec36_fnl[1]),
//        .din1   (dir_hit_vec4_or_36_tmp),
//        .dout   (dir_hit_vec4_or_36)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_1_slice_3  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec68_fnl[0]),
//        .din1   (enc_c_vec100_fnl[0]),
//        .din2   (enc_c_vec68_fnl[1]),
//        .dout   (dir_hit_vec68_or_100_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_1_slice_32  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec100_fnl[1]),
//        .din1   (dir_hit_vec68_or_100_tmp),
//        .dout   (dir_hit_vec68_or_100)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_slice2  (width=1)
//        (
//        .din0   (dir_hit_vec4_or_36),
//        .din1   (dir_hit_vec68_or_100),
//        .dout   (dirvec_dirdp_req_vec_c6[1])
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_2_slice_3  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec8_fnl[0]),
//        .din1   (enc_c_vec40_fnl[0]),
//        .din2   (enc_c_vec8_fnl[1]),
//        .dout   (dir_hit_vec8_or_40_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_2_slice_32  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec40_fnl[1]),
//        .din1   (dir_hit_vec8_or_40_tmp),
//        .dout   (dir_hit_vec8_or_40)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_2_slice_4  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec72_fnl[0]),
//        .din1   (enc_c_vec104_fnl[0]),
//        .din2   (enc_c_vec72_fnl[1]),
//        .dout   (dir_hit_vec72_or_104_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_2_slice_42  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec104_fnl[1]),
//        .din1   (dir_hit_vec72_or_104_tmp),
//        .dout   (dir_hit_vec72_or_104)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_slice3  (width=1)
//        (
//        .din0   (dir_hit_vec8_or_40),
//        .din1   (dir_hit_vec72_or_104),
//        .dout   (dirvec_dirdp_req_vec_c6[2])
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_3_slice_4  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec12_fnl[0]),
//        .din1   (enc_c_vec44_fnl[0]),
//        .din2   (enc_c_vec12_fnl[1]),
//        .dout   (dir_hit_vec12_or_44_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_3_slice_42  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec44_fnl[1]),
//        .din1   (dir_hit_vec12_or_44_tmp),
//        .dout   (dir_hit_vec12_or_44)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_3_slice_5  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec76_fnl[0]),
//        .din1   (enc_c_vec108_fnl[0]),
//        .din2   (enc_c_vec76_fnl[1]),
//        .dout   (dir_hit_vec76_or_108_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_3_slice_52  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec108_fnl[1]),
//        .din1   (dir_hit_vec76_or_108_tmp),
//        .dout   (dir_hit_vec76_or_108)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_slice4  (width=1)
//        (
//        .din0   (dir_hit_vec12_or_44),
//        .din1   (dir_hit_vec76_or_108),
//        .dout   (dirvec_dirdp_req_vec_c6[3])
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_4_slice_5  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec16_fnl[0]),
//        .din1   (enc_c_vec48_fnl[0]),
//        .din2   (enc_c_vec16_fnl[1]),
//        .dout   (dir_hit_vec16_or_48_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_4_slice_52  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec48_fnl[1]),
//        .din1   (dir_hit_vec16_or_48_tmp),
//        .dout   (dir_hit_vec16_or_48)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_4_slice_6  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec80_fnl[0]),
//        .din1   (enc_c_vec112_fnl[0]),
//        .din2   (enc_c_vec80_fnl[1]),
//        .dout   (dir_hit_vec80_or_112_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_4_slice_62  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec112_fnl[1]),
//        .din1   (dir_hit_vec80_or_112_tmp),
//        .dout   (dir_hit_vec80_or_112)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_slice5  (width=1)
//        (
//        .din0   (dir_hit_vec16_or_48),
//        .din1   (dir_hit_vec80_or_112),
//        .dout   (dirvec_dirdp_req_vec_c6[4])
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_5_slice_6  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec20_fnl[0]),
//        .din1   (enc_c_vec52_fnl[0]),
//        .din2   (enc_c_vec20_fnl[1]),
//        .dout   (dir_hit_vec20_or_52_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_5_slice_62  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec52_fnl[1]),
//        .din1   (dir_hit_vec20_or_52_tmp),
//        .dout   (dir_hit_vec20_or_52)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_5_slice_7  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec84_fnl[0]),
//        .din1   (enc_c_vec116_fnl[0]),
//        .din2   (enc_c_vec84_fnl[1]),
//        .dout   (dir_hit_vec84_or_116_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_5_slice_72  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec116_fnl[1]),
//        .din1   (dir_hit_vec84_or_116_tmp),
//        .dout   (dir_hit_vec84_or_116)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_slice6  (width=1)
//        (
//        .din0   (dir_hit_vec20_or_52),
//        .din1   (dir_hit_vec84_or_116),
//        .dout   (dirvec_dirdp_req_vec_c6[5])
//        );
//
//
//
//or_macro        dirvec_dirdp_req_vec_c6_6_slice_7  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec24_fnl[0]),
//        .din1   (enc_c_vec56_fnl[0]),
//        .din2   (enc_c_vec24_fnl[1]),
//        .dout   (dir_hit_vec24_or_56_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_6_slice_72  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec56_fnl[1]),
//        .din1   (dir_hit_vec24_or_56_tmp),
//        .dout   (dir_hit_vec24_or_56)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_6_slice_8  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec88_fnl[0]),
//        .din1   (enc_c_vec120_fnl[0]),
//        .din2   (enc_c_vec88_fnl[1]),
//        .dout   (dir_hit_vec88_or_120_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_6_slice_82  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec120_fnl[1]),
//        .din1   (dir_hit_vec88_or_120_tmp),
//        .dout   (dir_hit_vec88_or_120)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_slice7  (width=1)
//        (
//        .din0   (dir_hit_vec24_or_56),
//        .din1   (dir_hit_vec88_or_120),
//        .dout   (dirvec_dirdp_req_vec_c6[6])
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_7_slice_8  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec28_fnl[0]),
//        .din1   (enc_c_vec60_fnl[0]),
//        .din2   (enc_c_vec28_fnl[1]),
//        .dout   (dir_hit_vec28_or_60_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_7_slice_82  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec60_fnl[1]),
//        .din1   (dir_hit_vec28_or_60_tmp),
//        .dout   (dir_hit_vec28_or_60)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_7_slice_9  (width=1,ports=3)
//        (
//        .din0   (enc_c_vec92_fnl[0]),
//        .din1   (enc_c_vec124_fnl[0]),
//        .din2   (enc_c_vec92_fnl[1]),
//        .dout   (dir_hit_vec92_or_124_tmp)
//        );
//
//or_macro        dirvec_dirdp_req_vec_c6_7_slice_92  (width=1,ports=2)
//        (
//        .din0   (enc_c_vec124_fnl[1]),
//        .din1   (dir_hit_vec92_or_124_tmp),
//        .dout   (dir_hit_vec92_or_124)
//        );
//
//
//or_macro        dirvec_dirdp_req_vec_c6_slice0  (width=1)
//        (
//        .din0   (dir_hit_vec28_or_60),
//        .din1   (dir_hit_vec92_or_124),
//        .dout   (dirvec_dirdp_req_vec_c6[7])
//        );
//
//
// 

assign  dirvec_dirdp_req_vec_c6[0] = |({enc_c_vec0_fnl[1:0],enc_c_vec32_fnl[1:0],
                                     enc_c_vec64_fnl[1:0],enc_c_vec96_fnl[1:0]});

assign  dirvec_dirdp_req_vec_c6[1] = |({enc_c_vec4_fnl[1:0],enc_c_vec36_fnl[1:0],
                                     enc_c_vec68_fnl[1:0],enc_c_vec100_fnl[1:0]});

assign  dirvec_dirdp_req_vec_c6[2] = |({enc_c_vec8_fnl[1:0],enc_c_vec40_fnl[1:0],
                                     enc_c_vec72_fnl[1:0],enc_c_vec104_fnl[1:0]});

assign  dirvec_dirdp_req_vec_c6[3] = |({enc_c_vec12_fnl[1:0],enc_c_vec44_fnl[1:0],
                                     enc_c_vec76_fnl[1:0],enc_c_vec108_fnl[1:0]});

assign  dirvec_dirdp_req_vec_c6[4] = |({enc_c_vec16_fnl[1:0],enc_c_vec48_fnl[1:0],
                                     enc_c_vec80_fnl[1:0],enc_c_vec112_fnl[1:0]});

assign  dirvec_dirdp_req_vec_c6[5] = |({enc_c_vec20_fnl[1:0],enc_c_vec52_fnl[1:0],
                                     enc_c_vec84_fnl[1:0],enc_c_vec116_fnl[1:0]});

assign  dirvec_dirdp_req_vec_c6[6] = |({enc_c_vec24_fnl[1:0],enc_c_vec56_fnl[1:0],
                                     enc_c_vec88_fnl[1:0],enc_c_vec120_fnl[1:0]});

assign  dirvec_dirdp_req_vec_c6[7] = |({enc_c_vec28_fnl[1:0],enc_c_vec60_fnl[1:0],
                                     enc_c_vec92_fnl[1:0],enc_c_vec124_fnl[1:0]});


//******************************************************************************************* 
// INVALIDATE PACKET FORMATION 
////******************************************************************************************* 
//// 32 bit dir vec. 
//
//wire	[3:0]	enc_c_vec0;
//wire    [3:0]   enc_c_vec4; 
//wire    [3:0]   enc_c_vec8; 
//wire    [3:0]   enc_c_vec12; 
//wire    [3:0]   enc_c_vec16; 
//wire    [3:0]   enc_c_vec20; 
//wire    [3:0]   enc_c_vec24; 
//wire    [3:0]   enc_c_vec28; 
//
//wire    [3:0]   enc_c_vec64; 
//wire    [3:0]   enc_c_vec68; 
//wire    [3:0]   enc_c_vec72; 
//wire    [3:0]   enc_c_vec76; 
//wire    [3:0]   enc_c_vec80; 
//wire    [3:0]   enc_c_vec84; 
//wire    [3:0]   enc_c_vec88; 
//wire    [3:0]   enc_c_vec92; 
//
// 
//
//// BS and SR 11/18/03 Support for 8 way I$
//assign enc_c_vec0[3:0] = ic_dir_vec0_c6 ? {enc_ic_vec0_way_c6,1'b1} : {enc_dc_vec0_way_c6,dc_dir_vec0_c6,1'b0};
//assign enc_c_vec4[3:0] = ic_dir_vec4_c6 ? {enc_ic_vec4_way_c6,1'b1} : {enc_dc_vec4_way_c6,dc_dir_vec4_c6,1'b0};
//assign enc_c_vec8[3:0] = ic_dir_vec8_c6 ? {enc_ic_vec8_way_c6,1'b1} : {enc_dc_vec8_way_c6,dc_dir_vec8_c6,1'b0};
//assign enc_c_vec12[3:0] = ic_dir_vec12_c6 ? {enc_ic_vec12_way_c6,1'b1} : {enc_dc_vec12_way_c6,dc_dir_vec12_c6,1'b0};
//assign enc_c_vec16[3:0] = ic_dir_vec16_c6 ? {enc_ic_vec16_way_c6,1'b1} : {enc_dc_vec16_way_c6,dc_dir_vec16_c6,1'b0};
//assign enc_c_vec20[3:0] = ic_dir_vec20_c6 ? {enc_ic_vec20_way_c6,1'b1} : {enc_dc_vec20_way_c6,dc_dir_vec20_c6,1'b0};
//assign enc_c_vec24[3:0] = ic_dir_vec24_c6 ? {enc_ic_vec24_way_c6,1'b1} : {enc_dc_vec24_way_c6,dc_dir_vec24_c6,1'b0};
//assign enc_c_vec28[3:0] = ic_dir_vec28_c6 ? {enc_ic_vec28_way_c6,1'b1} : {enc_dc_vec28_way_c6,dc_dir_vec28_c6,1'b0};
//
//mux_ctl_macro mux_enc_c_vec0 (width=4,ports=2,mux=aonpe,stack=4r)
//                        ( .dout(enc_c_vec0[3:0]),
//                                .din0({enc_ic_vec0_way_c6,1'b1}),
//                                .din1({enc_dc_vec0_way_c6,dc_dir_vec0_c6,1'b0}),
//                                .sel0(ic_dir_vec0_c6),
//                                .sel1(ic_dir_vec0_c6_n));
//
//mux_ctl_macro mux_enc_c_vec4 (width=4,ports=2,mux=aonpe,stack=4r)
//                        ( .dout(enc_c_vec4[3:0]),
//                                .din0({enc_ic_vec4_way_c6,1'b1}),
//                                .din1({enc_dc_vec4_way_c6,dc_dir_vec4_c6,1'b0}),
//                                .sel0(ic_dir_vec4_c6),
//                                .sel1(ic_dir_vec4_c6_n));
//
//mux_ctl_macro mux_enc_c_vec8 (width=4,ports=2,mux=aonpe,stack=4r)
//                        ( .dout(enc_c_vec8[3:0]),
//                                .din0({enc_ic_vec8_way_c6,1'b1}),
//                                .din1({enc_dc_vec8_way_c6,dc_dir_vec8_c6,1'b0}),
//                                .sel0(ic_dir_vec8_c6),
//                                .sel1(ic_dir_vec8_c6_n));
//
//mux_ctl_macro mux_enc_c_vec12 (width=4,ports=2,mux=aonpe,stack=4r)
//                        ( .dout(enc_c_vec12[3:0]),
//                                .din0({enc_ic_vec12_way_c6,1'b1}),
//                                .din1({enc_dc_vec12_way_c6,dc_dir_vec12_c6,1'b0}),
//                                .sel0(ic_dir_vec12_c6),
//                                .sel1(ic_dir_vec12_c6_n));
//
//mux_ctl_macro mux_enc_c_vec16 (width=4,ports=2,mux=aonpe,stack=4r)
//                        ( .dout(enc_c_vec16[3:0]),
//                                .din0({enc_ic_vec16_way_c6,1'b1}),
//                                .din1({enc_dc_vec16_way_c6,dc_dir_vec16_c6,1'b0}),
//                                .sel0(ic_dir_vec16_c6),
//                                .sel1(ic_dir_vec16_c6_n));
//
//mux_ctl_macro mux_enc_c_vec20 (width=4,ports=2,mux=aonpe,stack=4r)
//                        ( .dout(enc_c_vec20[3:0]),
//                                .din0({enc_ic_vec20_way_c6,1'b1}),
//                                .din1({enc_dc_vec20_way_c6,dc_dir_vec20_c6,1'b0}),
//                                .sel0(ic_dir_vec20_c6),
//                                .sel1(ic_dir_vec20_c6_n));
//
//mux_ctl_macro mux_enc_c_vec24 (width=4,ports=2,mux=aonpe,stack=4r)
//                        ( .dout(enc_c_vec24[3:0]),
//                                .din0({enc_ic_vec24_way_c6,1'b1}),
//                                .din1({enc_dc_vec24_way_c6,dc_dir_vec24_c6,1'b0}),
//                                .sel0(ic_dir_vec24_c6),
//                                .sel1(ic_dir_vec24_c6_n));
//
//mux_ctl_macro mux_enc_c_vec28 (width=4,ports=2,mux=aonpe,stack=4r)
//                        ( .dout(enc_c_vec28[3:0]),
//                                .din0({enc_ic_vec28_way_c6,1'b1}),
//                                .din1({enc_dc_vec28_way_c6,dc_dir_vec28_c6,1'b0}),
//                                .sel0(ic_dir_vec28_c6),
//                                .sel1(ic_dir_vec28_c6_n));
//

l2t_prbnk0_ctl prbnk0_addr54_00 (
                               .arbadr_ncu_l2t_pm_n(arbadr_ncu_l2t_pm_n),
				.arb_dirvec_cpu0_selbot(arb_dirvec_cpu0_selbot),
				.arb_dirvec_cpu1_selbot(arb_dirvec_cpu1_selbot),
                                .arb_dirvec_cpu2_selbot(arb_dirvec_cpu2_selbot),
                                .arb_dirvec_cpu3_selbot(arb_dirvec_cpu3_selbot),
                                .arb_dirvec_cpu4_selbot(arb_dirvec_cpu4_selbot),
                                .arb_dirvec_cpu5_selbot(arb_dirvec_cpu5_selbot),
                                .arb_dirvec_cpu6_selbot(arb_dirvec_cpu6_selbot),
                                .arb_dirvec_cpu7_selbot(arb_dirvec_cpu7_selbot),
				.arb_dirvec_cpu1_seltop(arb_dirvec_cpu1_seltop),
                                .arb_dirvec_cpu2_seltop(arb_dirvec_cpu2_seltop),
                                .arb_dirvec_cpu3_seltop(arb_dirvec_cpu3_seltop),
                                .arb_dirvec_cpu4_seltop(arb_dirvec_cpu4_seltop),
                                .arb_dirvec_cpu5_seltop(arb_dirvec_cpu5_seltop),
                                .arb_dirvec_cpu6_seltop(arb_dirvec_cpu6_seltop),
                                .arb_dirvec_cpu7_seltop(arb_dirvec_cpu7_seltop),
                                .arb_dirvec_cpu0_sel00(arb_dirvec_cpu0_sel00),
                                .arb_dirvec_cpu1_sel00(arb_dirvec_cpu1_sel00),
                                .arb_dirvec_cpu1_sel01(arb_dirvec_cpu1_sel01),
                                .arb_dirvec_cpu2_sel00(arb_dirvec_cpu2_sel00),
				.arb_dirvec_cpu2_sel01(arb_dirvec_cpu2_sel01),
                                .arb_dirvec_cpu2_sel10(arb_dirvec_cpu2_sel10),
                                .arb_dirvec_cpu3_sel00(arb_dirvec_cpu3_sel00),
                                .arb_dirvec_cpu3_sel01(arb_dirvec_cpu3_sel01),
                                .arb_dirvec_cpu3_sel10(arb_dirvec_cpu3_sel10),
                                .arb_dirvec_cpu3_sel11(arb_dirvec_cpu3_sel11),
                                .arb_dirvec_cpu4_sel00(arb_dirvec_cpu4_sel00),
                                .arb_dirvec_cpu4_sel01(arb_dirvec_cpu4_sel01),
                                .arb_dirvec_cpu4_sel10(arb_dirvec_cpu4_sel10),
                                .arb_dirvec_cpu4_sel11(arb_dirvec_cpu4_sel11),
                                .arb_dirvec_cpu5_sel00(arb_dirvec_cpu5_sel00),
                                .arb_dirvec_cpu5_sel01(arb_dirvec_cpu5_sel01),
                                .arb_dirvec_cpu5_sel10(arb_dirvec_cpu5_sel10),
                                .arb_dirvec_cpu5_sel11(arb_dirvec_cpu5_sel11),
                                .arb_dirvec_cpu6_sel00(arb_dirvec_cpu6_sel00),
                                .arb_dirvec_cpu6_sel01(arb_dirvec_cpu6_sel01),
                                .arb_dirvec_cpu6_sel10(arb_dirvec_cpu6_sel10),
                                .arb_dirvec_cpu6_sel11(arb_dirvec_cpu6_sel11),
                                .arb_dirvec_cpu7_sel00(arb_dirvec_cpu7_sel00),
                                .arb_dirvec_cpu7_sel01(arb_dirvec_cpu7_sel01),
                                .arb_dirvec_cpu7_sel10(arb_dirvec_cpu7_sel10),
                                .arb_dirvec_cpu7_sel11(arb_dirvec_cpu7_sel11),
				.enc_c_vec0(enc_c_vec0[3:0]),
                                .enc_c_vec1(enc_c_vec4[3:0]),
                                .enc_c_vec2(enc_c_vec8[3:0]),
                                .enc_c_vec3(enc_c_vec12[3:0]),
                                .enc_c_vec4(enc_c_vec16[3:0]),
                                .enc_c_vec5(enc_c_vec20[3:0]),
                                .enc_c_vec6(enc_c_vec24[3:0]),
                                .enc_c_vec7(enc_c_vec28[3:0]),
                                .enc_c_vec0_fnl(enc_c_vec0_fnl[3:0]),
                                .enc_c_vec1_fnl(enc_c_vec4_fnl[3:0]),
                                .enc_c_vec2_fnl(enc_c_vec8_fnl[3:0]),
                                .enc_c_vec3_fnl(enc_c_vec12_fnl[3:0]),
                                .enc_c_vec4_fnl(enc_c_vec16_fnl[3:0]),
                                .enc_c_vec5_fnl(enc_c_vec20_fnl[3:0]),
                                .enc_c_vec6_fnl(enc_c_vec24_fnl[3:0]),
                                .enc_c_vec7_fnl(enc_c_vec28_fnl[3:0])
                               );

assign	dirdp_inval_pckt_c6[31:0] = { enc_c_vec28_fnl,enc_c_vec24_fnl,enc_c_vec20_fnl,enc_c_vec16_fnl,enc_c_vec12_fnl,enc_c_vec8_fnl,
                                      enc_c_vec4_fnl,enc_c_vec0_fnl}; 

wire [2:0] enc_c_vec32,enc_c_vec36,enc_c_vec40,enc_c_vec44,enc_c_vec48,enc_c_vec52,enc_c_vec56,enc_c_vec60;

assign enc_c_vec32 = {enc_c_vec32_way_c6, dc_dir_vec32_c6};
assign enc_c_vec36 = {enc_c_vec36_way_c6, dc_dir_vec36_c6};
assign enc_c_vec40 = {enc_c_vec40_way_c6, dc_dir_vec40_c6};
assign enc_c_vec44 = {enc_c_vec44_way_c6, dc_dir_vec44_c6};
assign enc_c_vec48 = {enc_c_vec48_way_c6, dc_dir_vec48_c6};
assign enc_c_vec52 = {enc_c_vec52_way_c6, dc_dir_vec52_c6};
assign enc_c_vec56 = {enc_c_vec56_way_c6, dc_dir_vec56_c6};
assign enc_c_vec60 = {enc_c_vec60_way_c6, dc_dir_vec60_c6};


l2t_prbnk1_ctl prbnk1_addr54_01 (
                               .arbadr_ncu_l2t_pm_n(arbadr_ncu_l2t_pm_n),
				.arb_dirvec_cpu0_selbot(arb_dirvec_cpu0_selbot),
				.arb_dirvec_cpu1_selbot(arb_dirvec_cpu1_selbot),
                                .arb_dirvec_cpu2_selbot(arb_dirvec_cpu2_selbot),
                                .arb_dirvec_cpu3_selbot(arb_dirvec_cpu3_selbot),
                                .arb_dirvec_cpu4_selbot(arb_dirvec_cpu4_selbot),
                                .arb_dirvec_cpu5_selbot(arb_dirvec_cpu5_selbot),
                                .arb_dirvec_cpu6_selbot(arb_dirvec_cpu6_selbot),
                                .arb_dirvec_cpu7_selbot(arb_dirvec_cpu7_selbot),
				.arb_dirvec_cpu1_seltop(arb_dirvec_cpu1_seltop),
                                .arb_dirvec_cpu2_seltop(arb_dirvec_cpu2_seltop),
                                .arb_dirvec_cpu3_seltop(arb_dirvec_cpu3_seltop),
                                .arb_dirvec_cpu4_seltop(arb_dirvec_cpu4_seltop),
                                .arb_dirvec_cpu5_seltop(arb_dirvec_cpu5_seltop),
                                .arb_dirvec_cpu6_seltop(arb_dirvec_cpu6_seltop),
                                .arb_dirvec_cpu7_seltop(arb_dirvec_cpu7_seltop),
                                .arb_dirvec_cpu0_sel00(arb_dirvec_cpu0_sel00),
                                .arb_dirvec_cpu1_sel00(arb_dirvec_cpu1_sel00),
                                .arb_dirvec_cpu1_sel01(arb_dirvec_cpu1_sel01),
                                .arb_dirvec_cpu2_sel00(arb_dirvec_cpu2_sel00),
				.arb_dirvec_cpu2_sel01(arb_dirvec_cpu2_sel01),
                                .arb_dirvec_cpu2_sel10(arb_dirvec_cpu2_sel10),
                                .arb_dirvec_cpu3_sel00(arb_dirvec_cpu3_sel00),
                                .arb_dirvec_cpu3_sel01(arb_dirvec_cpu3_sel01),
                                .arb_dirvec_cpu3_sel10(arb_dirvec_cpu3_sel10),
                                .arb_dirvec_cpu3_sel11(arb_dirvec_cpu3_sel11),
                                .arb_dirvec_cpu4_sel00(arb_dirvec_cpu4_sel00),
                                .arb_dirvec_cpu4_sel01(arb_dirvec_cpu4_sel01),
                                .arb_dirvec_cpu4_sel10(arb_dirvec_cpu4_sel10),
                                .arb_dirvec_cpu4_sel11(arb_dirvec_cpu4_sel11),
                                .arb_dirvec_cpu5_sel00(arb_dirvec_cpu5_sel00),
                                .arb_dirvec_cpu5_sel01(arb_dirvec_cpu5_sel01),
                                .arb_dirvec_cpu5_sel10(arb_dirvec_cpu5_sel10),
                                .arb_dirvec_cpu5_sel11(arb_dirvec_cpu5_sel11),
                                .arb_dirvec_cpu6_sel00(arb_dirvec_cpu6_sel00),
                                .arb_dirvec_cpu6_sel01(arb_dirvec_cpu6_sel01),
                                .arb_dirvec_cpu6_sel10(arb_dirvec_cpu6_sel10),
                                .arb_dirvec_cpu6_sel11(arb_dirvec_cpu6_sel11),
                                .arb_dirvec_cpu7_sel00(arb_dirvec_cpu7_sel00),
                                .arb_dirvec_cpu7_sel01(arb_dirvec_cpu7_sel01),
                                .arb_dirvec_cpu7_sel10(arb_dirvec_cpu7_sel10),
                                .arb_dirvec_cpu7_sel11(arb_dirvec_cpu7_sel11),
				.enc_c_vec0(enc_c_vec32[2:0]),
                                .enc_c_vec1(enc_c_vec36[2:0]),
                                .enc_c_vec2(enc_c_vec40[2:0]),
                                .enc_c_vec3(enc_c_vec44[2:0]),
                                .enc_c_vec4(enc_c_vec48[2:0]),
                                .enc_c_vec5(enc_c_vec52[2:0]),
                                .enc_c_vec6(enc_c_vec56[2:0]),
                                .enc_c_vec7(enc_c_vec60[2:0]),
                                .enc_c_vec0_fnl(enc_c_vec32_fnl[2:0]),
                                .enc_c_vec1_fnl(enc_c_vec36_fnl[2:0]),
                                .enc_c_vec2_fnl(enc_c_vec40_fnl[2:0]),
                                .enc_c_vec3_fnl(enc_c_vec44_fnl[2:0]),
                                .enc_c_vec4_fnl(enc_c_vec48_fnl[2:0]),
                                .enc_c_vec5_fnl(enc_c_vec52_fnl[2:0]),
                                .enc_c_vec6_fnl(enc_c_vec56_fnl[2:0]),
                                .enc_c_vec7_fnl(enc_c_vec60_fnl[2:0])
                               );
	  
// 24 bit dir vec. 
assign	dirdp_inval_pckt_c6[55:32] = { enc_c_vec60_fnl,enc_c_vec56_fnl,enc_c_vec52_fnl,enc_c_vec48_fnl,
                                       enc_c_vec44_fnl,enc_c_vec40_fnl,enc_c_vec36_fnl,enc_c_vec32_fnl 
				   } ; 

//// 32 bit dir vec.
//// BS and SR 11/18/03 Support for 8 way I$
//// assign enc_c_vec92 = ic_dir_vec92_c6 ? {enc_ic_vec92_way_c6,1'b1} : {enc_dc_vec92_way_c6,dc_dir_vec92_c6,1'b0};
//// assign enc_c_vec88 = ic_dir_vec88_c6 ? {enc_ic_vec88_way_c6,1'b1} : {enc_dc_vec88_way_c6,dc_dir_vec88_c6,1'b0};
//// assign enc_c_vec84 = ic_dir_vec84_c6 ? {enc_ic_vec84_way_c6,1'b1} : {enc_dc_vec84_way_c6,dc_dir_vec84_c6,1'b0};
//// assign enc_c_vec80 = ic_dir_vec80_c6 ? {enc_ic_vec80_way_c6,1'b1} : {enc_dc_vec80_way_c6,dc_dir_vec80_c6,1'b0};
//// assign enc_c_vec76 = ic_dir_vec76_c6 ? {enc_ic_vec76_way_c6,1'b1} : {enc_dc_vec76_way_c6,dc_dir_vec76_c6,1'b0};
//// assign enc_c_vec72 = ic_dir_vec72_c6 ? {enc_ic_vec72_way_c6,1'b1} : {enc_dc_vec72_way_c6,dc_dir_vec72_c6,1'b0};
//// assign enc_c_vec68 = ic_dir_vec68_c6 ? {enc_ic_vec68_way_c6,1'b1} : {enc_dc_vec68_way_c6,dc_dir_vec68_c6,1'b0};
//// assign enc_c_vec64 = ic_dir_vec64_c6 ? {enc_ic_vec64_way_c6,1'b1} : {enc_dc_vec64_way_c6,dc_dir_vec64_c6,1'b0};
//
//
//mux_ctl_macro mux_enc_c_vec64 (width=4,ports=2,mux=aonpe,stack=4l)
//                        	( 
//				.dout(enc_c_vec64[3:0]),
//                                .din0({enc_ic_vec64_way_c6,1'b1}),
//                                .din1({enc_dc_vec64_way_c6,dc_dir_vec64_c6,1'b0}),
//                                .sel0(ic_dir_vec64_c6),
//                                .sel1(ic_dir_vec64_c6_n));
//
//mux_ctl_macro mux_enc_c_vec68 (width=4,ports=2,mux=aonpe,stack=4l)
//                                ( 
//                                .dout(enc_c_vec68[3:0]),
//                                .din0({enc_ic_vec68_way_c6,1'b1}),
//                                .din1({enc_dc_vec68_way_c6,dc_dir_vec68_c6,1'b0}),
//                                .sel0(ic_dir_vec68_c6),
//                                .sel1(ic_dir_vec68_c6_n));
//
//
//mux_ctl_macro mux_enc_c_vec72 (width=4,ports=2,mux=aonpe,stack=4l)
//                                ( 
//                                .dout(enc_c_vec72[3:0]),
//                                .din0({enc_ic_vec72_way_c6,1'b1}),
//                                .din1({enc_dc_vec72_way_c6,dc_dir_vec72_c6,1'b0}),
//                                .sel0(ic_dir_vec72_c6),
//                                .sel1(ic_dir_vec72_c6_n));
//
//
//mux_ctl_macro mux_enc_c_vec76 (width=4,ports=2,mux=aonpe,stack=4l)
//                                ( 
//                                .dout(enc_c_vec76[3:0]),
//                                .din0({enc_ic_vec76_way_c6,1'b1}),
//                                .din1({enc_dc_vec76_way_c6,dc_dir_vec76_c6,1'b0}),
//                                .sel0(ic_dir_vec76_c6),
//                                .sel1(ic_dir_vec76_c6_n));
//
//
//mux_ctl_macro mux_enc_c_vec80 (width=4,ports=2,mux=aonpe,stack=4l)
//                                ( 
//                                .dout(enc_c_vec80[3:0]),
//                                .din0({enc_ic_vec80_way_c6,1'b1}),
//                                .din1({enc_dc_vec80_way_c6,dc_dir_vec80_c6,1'b0}),
//                                .sel0(ic_dir_vec80_c6),
//                                .sel1(ic_dir_vec80_c6_n));
//
//
//mux_ctl_macro mux_enc_c_vec84 (width=4,ports=2,mux=aonpe,stack=4l)
//                                ( 
//                                .dout(enc_c_vec84[3:0]),
//                                .din0({enc_ic_vec84_way_c6,1'b1}),
//                                .din1({enc_dc_vec84_way_c6,dc_dir_vec84_c6,1'b0}),
//                                .sel0(ic_dir_vec84_c6),
//                                .sel1(ic_dir_vec84_c6_n));
//
//
//mux_ctl_macro mux_enc_c_vec88 (width=4,ports=2,mux=aonpe,stack=4l)
//                                ( 
//                                .dout(enc_c_vec88[3:0]),
//                                .din0({enc_ic_vec88_way_c6,1'b1}),
//                                .din1({enc_dc_vec88_way_c6,dc_dir_vec88_c6,1'b0}),
//                                .sel0(ic_dir_vec88_c6),
//                                .sel1(ic_dir_vec88_c6_n));
//
//
//mux_ctl_macro mux_enc_c_vec92 (width=4,ports=2,mux=aonpe,stack=4l)
//                                ( 
//                                .dout(enc_c_vec92[3:0]),
//                                .din0({enc_ic_vec92_way_c6,1'b1}),
//                                .din1({enc_dc_vec92_way_c6,dc_dir_vec92_c6,1'b0}),
//                                .sel0(ic_dir_vec92_c6),
//                                .sel1(ic_dir_vec92_c6_n));


l2t_prbnk0_ctl prbnk0_addr54_10 (
                               .arbadr_ncu_l2t_pm_n(arbadr_ncu_l2t_pm_n),
				.arb_dirvec_cpu0_selbot(arb_dirvec_cpu0_selbot),
				.arb_dirvec_cpu1_selbot(arb_dirvec_cpu1_selbot),
                                .arb_dirvec_cpu2_selbot(arb_dirvec_cpu2_selbot),
                                .arb_dirvec_cpu3_selbot(arb_dirvec_cpu3_selbot),
                                .arb_dirvec_cpu4_selbot(arb_dirvec_cpu4_selbot),
                                .arb_dirvec_cpu5_selbot(arb_dirvec_cpu5_selbot),
                                .arb_dirvec_cpu6_selbot(arb_dirvec_cpu6_selbot),
                                .arb_dirvec_cpu7_selbot(arb_dirvec_cpu7_selbot),
				.arb_dirvec_cpu1_seltop(arb_dirvec_cpu1_seltop),
                                .arb_dirvec_cpu2_seltop(arb_dirvec_cpu2_seltop),
                                .arb_dirvec_cpu3_seltop(arb_dirvec_cpu3_seltop),
                                .arb_dirvec_cpu4_seltop(arb_dirvec_cpu4_seltop),
                                .arb_dirvec_cpu5_seltop(arb_dirvec_cpu5_seltop),
                                .arb_dirvec_cpu6_seltop(arb_dirvec_cpu6_seltop),
                                .arb_dirvec_cpu7_seltop(arb_dirvec_cpu7_seltop),
                                .arb_dirvec_cpu0_sel00(arb_dirvec_cpu0_sel00),
                                .arb_dirvec_cpu1_sel00(arb_dirvec_cpu1_sel00),
                                .arb_dirvec_cpu1_sel01(arb_dirvec_cpu1_sel01),
                                .arb_dirvec_cpu2_sel00(arb_dirvec_cpu2_sel00),
				.arb_dirvec_cpu2_sel01(arb_dirvec_cpu2_sel01),
                                .arb_dirvec_cpu2_sel10(arb_dirvec_cpu2_sel10),
                                .arb_dirvec_cpu3_sel00(arb_dirvec_cpu3_sel00),
                                .arb_dirvec_cpu3_sel01(arb_dirvec_cpu3_sel01),
                                .arb_dirvec_cpu3_sel10(arb_dirvec_cpu3_sel10),
                                .arb_dirvec_cpu3_sel11(arb_dirvec_cpu3_sel11),
                                .arb_dirvec_cpu4_sel00(arb_dirvec_cpu4_sel00),
                                .arb_dirvec_cpu4_sel01(arb_dirvec_cpu4_sel01),
                                .arb_dirvec_cpu4_sel10(arb_dirvec_cpu4_sel10),
                                .arb_dirvec_cpu4_sel11(arb_dirvec_cpu4_sel11),
                                .arb_dirvec_cpu5_sel00(arb_dirvec_cpu5_sel00),
                                .arb_dirvec_cpu5_sel01(arb_dirvec_cpu5_sel01),
                                .arb_dirvec_cpu5_sel10(arb_dirvec_cpu5_sel10),
                                .arb_dirvec_cpu5_sel11(arb_dirvec_cpu5_sel11),
                                .arb_dirvec_cpu6_sel00(arb_dirvec_cpu6_sel00),
                                .arb_dirvec_cpu6_sel01(arb_dirvec_cpu6_sel01),
                                .arb_dirvec_cpu6_sel10(arb_dirvec_cpu6_sel10),
                                .arb_dirvec_cpu6_sel11(arb_dirvec_cpu6_sel11),
                                .arb_dirvec_cpu7_sel00(arb_dirvec_cpu7_sel00),
                                .arb_dirvec_cpu7_sel01(arb_dirvec_cpu7_sel01),
                                .arb_dirvec_cpu7_sel10(arb_dirvec_cpu7_sel10),
                                .arb_dirvec_cpu7_sel11(arb_dirvec_cpu7_sel11),
				.enc_c_vec0(enc_c_vec64[3:0]),
                                .enc_c_vec1(enc_c_vec68[3:0]),
                                .enc_c_vec2(enc_c_vec72[3:0]),
                                .enc_c_vec3(enc_c_vec76[3:0]),
                                .enc_c_vec4(enc_c_vec80[3:0]),
                                .enc_c_vec5(enc_c_vec84[3:0]),
                                .enc_c_vec6(enc_c_vec88[3:0]),
                                .enc_c_vec7(enc_c_vec92[3:0]),
                                .enc_c_vec0_fnl(enc_c_vec64_fnl[3:0]),
                                .enc_c_vec1_fnl(enc_c_vec68_fnl[3:0]),
                                .enc_c_vec2_fnl(enc_c_vec72_fnl[3:0]),
                                .enc_c_vec3_fnl(enc_c_vec76_fnl[3:0]),
                                .enc_c_vec4_fnl(enc_c_vec80_fnl[3:0]),
                                .enc_c_vec5_fnl(enc_c_vec84_fnl[3:0]),
                                .enc_c_vec6_fnl(enc_c_vec88_fnl[3:0]),
                                .enc_c_vec7_fnl(enc_c_vec92_fnl[3:0])
                               );


assign dirdp_inval_pckt_c6[87:56] = { enc_c_vec92_fnl, enc_c_vec88_fnl, enc_c_vec84_fnl, enc_c_vec80_fnl, enc_c_vec76_fnl,
                                      enc_c_vec72_fnl, enc_c_vec68_fnl, enc_c_vec64_fnl};

wire [2:0] enc_c_vec96,enc_c_vec100,enc_c_vec104,enc_c_vec108,enc_c_vec112,enc_c_vec116,enc_c_vec120,enc_c_vec124;

assign enc_c_vec96 = {enc_c_vec96_way_c6, dc_dir_vec96_c6};
assign enc_c_vec100 = {enc_c_vec100_way_c6, dc_dir_vec100_c6};
assign enc_c_vec104 = {enc_c_vec104_way_c6, dc_dir_vec104_c6};
assign enc_c_vec108 = {enc_c_vec108_way_c6, dc_dir_vec108_c6};
assign enc_c_vec112 = {enc_c_vec112_way_c6, dc_dir_vec112_c6};
assign enc_c_vec116 = {enc_c_vec116_way_c6, dc_dir_vec116_c6};
assign enc_c_vec120 = {enc_c_vec120_way_c6, dc_dir_vec120_c6};
assign enc_c_vec124 = {enc_c_vec124_way_c6, dc_dir_vec124_c6};



l2t_prbnk1_ctl prbnk1_addr54_11 (
                               .arbadr_ncu_l2t_pm_n(arbadr_ncu_l2t_pm_n),
				.arb_dirvec_cpu0_selbot(arb_dirvec_cpu0_selbot),
				.arb_dirvec_cpu1_selbot(arb_dirvec_cpu1_selbot),
                                .arb_dirvec_cpu2_selbot(arb_dirvec_cpu2_selbot),
                                .arb_dirvec_cpu3_selbot(arb_dirvec_cpu3_selbot),
                                .arb_dirvec_cpu4_selbot(arb_dirvec_cpu4_selbot),
                                .arb_dirvec_cpu5_selbot(arb_dirvec_cpu5_selbot),
                                .arb_dirvec_cpu6_selbot(arb_dirvec_cpu6_selbot),
                                .arb_dirvec_cpu7_selbot(arb_dirvec_cpu7_selbot),
				.arb_dirvec_cpu1_seltop(arb_dirvec_cpu1_seltop),
                                .arb_dirvec_cpu2_seltop(arb_dirvec_cpu2_seltop),
                                .arb_dirvec_cpu3_seltop(arb_dirvec_cpu3_seltop),
                                .arb_dirvec_cpu4_seltop(arb_dirvec_cpu4_seltop),
                                .arb_dirvec_cpu5_seltop(arb_dirvec_cpu5_seltop),
                                .arb_dirvec_cpu6_seltop(arb_dirvec_cpu6_seltop),
                                .arb_dirvec_cpu7_seltop(arb_dirvec_cpu7_seltop),
                                .arb_dirvec_cpu0_sel00(arb_dirvec_cpu0_sel00),
                                .arb_dirvec_cpu1_sel00(arb_dirvec_cpu1_sel00),
                                .arb_dirvec_cpu1_sel01(arb_dirvec_cpu1_sel01),
                                .arb_dirvec_cpu2_sel00(arb_dirvec_cpu2_sel00),
				.arb_dirvec_cpu2_sel01(arb_dirvec_cpu2_sel01),
                                .arb_dirvec_cpu2_sel10(arb_dirvec_cpu2_sel10),
                                .arb_dirvec_cpu3_sel00(arb_dirvec_cpu3_sel00),
                                .arb_dirvec_cpu3_sel01(arb_dirvec_cpu3_sel01),
                                .arb_dirvec_cpu3_sel10(arb_dirvec_cpu3_sel10),
                                .arb_dirvec_cpu3_sel11(arb_dirvec_cpu3_sel11),
                                .arb_dirvec_cpu4_sel00(arb_dirvec_cpu4_sel00),
                                .arb_dirvec_cpu4_sel01(arb_dirvec_cpu4_sel01),
                                .arb_dirvec_cpu4_sel10(arb_dirvec_cpu4_sel10),
                                .arb_dirvec_cpu4_sel11(arb_dirvec_cpu4_sel11),
                                .arb_dirvec_cpu5_sel00(arb_dirvec_cpu5_sel00),
                                .arb_dirvec_cpu5_sel01(arb_dirvec_cpu5_sel01),
                                .arb_dirvec_cpu5_sel10(arb_dirvec_cpu5_sel10),
                                .arb_dirvec_cpu5_sel11(arb_dirvec_cpu5_sel11),
                                .arb_dirvec_cpu6_sel00(arb_dirvec_cpu6_sel00),
                                .arb_dirvec_cpu6_sel01(arb_dirvec_cpu6_sel01),
                                .arb_dirvec_cpu6_sel10(arb_dirvec_cpu6_sel10),
                                .arb_dirvec_cpu6_sel11(arb_dirvec_cpu6_sel11),
                                .arb_dirvec_cpu7_sel00(arb_dirvec_cpu7_sel00),
                                .arb_dirvec_cpu7_sel01(arb_dirvec_cpu7_sel01),
                                .arb_dirvec_cpu7_sel10(arb_dirvec_cpu7_sel10),
                                .arb_dirvec_cpu7_sel11(arb_dirvec_cpu7_sel11),
				.enc_c_vec0(enc_c_vec96[2:0]),
                                .enc_c_vec1(enc_c_vec100[2:0]),
                                .enc_c_vec2(enc_c_vec104[2:0]),
                                .enc_c_vec3(enc_c_vec108[2:0]),
                                .enc_c_vec4(enc_c_vec112[2:0]),
                                .enc_c_vec5(enc_c_vec116[2:0]),
                                .enc_c_vec6(enc_c_vec120[2:0]),
                                .enc_c_vec7(enc_c_vec124[2:0]),
                                .enc_c_vec0_fnl(enc_c_vec96_fnl[2:0]),
                                .enc_c_vec1_fnl(enc_c_vec100_fnl[2:0]),
                                .enc_c_vec2_fnl(enc_c_vec104_fnl[2:0]),
                                .enc_c_vec3_fnl(enc_c_vec108_fnl[2:0]),
                                .enc_c_vec4_fnl(enc_c_vec112_fnl[2:0]),
                                .enc_c_vec5_fnl(enc_c_vec116_fnl[2:0]),
                                .enc_c_vec6_fnl(enc_c_vec120_fnl[2:0]),
                                .enc_c_vec7_fnl(enc_c_vec124_fnl[2:0])
                               );

// 24 bit dir vec. 
assign    dirdp_inval_pckt_c6[111:88] = {enc_c_vec124_fnl,enc_c_vec120_fnl,enc_c_vec116_fnl,enc_c_vec112_fnl,
                                         enc_c_vec108_fnl,enc_c_vec104_fnl,enc_c_vec100_fnl,enc_c_vec96_fnl
                                        } ; 
                 
//******************************************************************************************* 
// GENERATION OR WAY AND WAYVLD FOR THE CPX RETURN  
//******************************************************************************************* 
 
 
// 
// 
//mux_ctl_macro mux_way_waywayvld_c6 (width=4,ports=4,mux=pgnpe)
//			( .dout(dirvecdp_way_info_c6[3:0]), 
//                                .din0(way_wayvld00_mux3_c6[3:0]), 
//                                .din1({way_wayvld01_mux3_c6[2:0],1'b0}), 
//                                .din2(way_wayvld10_mux3_c6[3:0]), 
//                                .din3({way_wayvld11_mux3_c6[2:0],1'b0}), 
//                                .sel0(oqu_mux_vec_sel_c6[0]), 
//                                .sel1(oqu_mux_vec_sel_c6[1]), 
//                                .sel2(oqu_mux_vec_sel_c6[2]), 
//                                .sel3(oqu_mux_vec_sel_c6[3])); 
//



always@(way_wayvld00_mux3_c6 or way_wayvld01_mux3_c6 or way_wayvld10_mux3_c6 
	or way_wayvld11_mux3_c6 or oqu_mux_vec_sel_c6)
begin
case(oqu_mux_vec_sel_c6)  // synopsys full_case parallel_case
4'b0001 :       dirvecdp_way_info_c6[3:0] = way_wayvld00_mux3_c6[3:0];
4'b0010 :       dirvecdp_way_info_c6[3:0] = {way_wayvld01_mux3_c6[2:0],1'b0};
4'b0100 :       dirvecdp_way_info_c6[3:0] = way_wayvld10_mux3_c6[3:0];
4'b1000 :       dirvecdp_way_info_c6[3:0] = {way_wayvld11_mux3_c6[2:0],1'b0};
default :       dirvecdp_way_info_c6[3:0] = 4'b0;
endcase
end


////////////////////////  DC IC CAM MBIST support ////////////////////////////



//msff_ctl_macro ff_arbadr_ncu_l2t_pm_n_dist (width=1)
//               (
//                .scan_in(ff_arbadr_ncu_l2t_pm_n_dist_scanin),
//                .scan_out(ff_arbadr_ncu_l2t_pm_n_dist_scanout),
//                .din(arbadr_ncu_l2t_pm_n_dist),
//                .l1clk(l1clk),
//                .dout(arbadr_ncu_l2t_pm_n_1),
//               );



l2t_dirvec_ctl_msff_ctl_macro__width_64 ff_ic_cam_hit_reg0  
               ( 
		.scan_in(ff_ic_cam_hit_reg0_scanin),
		.scan_out(ff_ic_cam_hit_reg0_scanout),
		.din(ic_cam_hit[63:0]),
                .l1clk(l1clk),
                .dout(ic_cam_hit_reg[63:0]),
  .siclk(siclk),
  .soclk(soclk)
               );

l2t_dirvec_ctl_msff_ctl_macro__width_64 ff_ic_cam_hit_reg1  
               ( 
                .scan_in(ff_ic_cam_hit_reg1_scanin),
                .scan_out(ff_ic_cam_hit_reg1_scanout),
                .din(ic_cam_hit[127:64]),
                .l1clk(l1clk),
                .dout(ic_cam_hit_reg[127:64]),
  .siclk(siclk),
  .soclk(soclk)
               );

l2t_dirvec_ctl_msff_ctl_macro__width_64 ff_dc_cam_hit_reg0  
               ( 
                .scan_in(ff_dc_cam_hit_reg0_scanin),
                .scan_out(ff_dc_cam_hit_reg0_scanout),
                .din(dc_cam_hit[63:0]),
                .l1clk(l1clk),
                .dout(dc_cam_hit_reg[63:0]),
  .siclk(siclk),
  .soclk(soclk)
               );

l2t_dirvec_ctl_msff_ctl_macro__width_64 ff_dc_cam_hit_reg  
               ( 
                .scan_in(ff_dc_cam_hit_reg_scanin),
                .scan_out(ff_dc_cam_hit_reg_scanout),
                .din(dc_cam_hit[127:64]),
                .l1clk(l1clk),
                .dout(dc_cam_hit_reg[127:64]),
  .siclk(siclk),
  .soclk(soclk)
               );

assign ic_cam_fail0 = |(ic_cam_hit_reg[31:0]);
assign ic_cam_fail1 = |(ic_cam_hit_reg[63:32]);
assign ic_cam_fail2 = |(ic_cam_hit_reg[95:64]);
assign ic_cam_fail3 = |(ic_cam_hit_reg[127:96]);

l2t_dirvec_ctl_msff_ctl_macro__width_4 ff_cam_tst_failed11  
               ( 
                .scan_in(ff_cam_tst_failed11_scanin),
                .scan_out(ff_cam_tst_failed11_scanout),
                .din({ic_cam_fail3,ic_cam_fail2,ic_cam_fail1,ic_cam_fail0}),
                .l1clk(l1clk),
                .dout({ic_cam_fail3_reg,ic_cam_fail2_reg,ic_cam_fail1_reg,ic_cam_fail0_reg}),
  .siclk(siclk),
  .soclk(soclk)
               );



assign dc_cam_fail0 = |(dc_cam_hit_reg[31:0] );
assign dc_cam_fail1 = |(dc_cam_hit_reg[63:32] );
assign dc_cam_fail2 = |(dc_cam_hit_reg[95:64] );
assign dc_cam_fail3 = |(dc_cam_hit_reg[127:96] );

l2t_dirvec_ctl_msff_ctl_macro__width_5 ff_cam_tst_failed00 
               (
                .scan_in(ff_cam_tst_failed00_scanin),
                .scan_out(ff_cam_tst_failed00_scanout),
                .din({dc_cam_fail3,dc_cam_fail2,dc_cam_fail1,dc_cam_fail0,mb0_l2t_cambist}),
                .l1clk(l1clk),
                .dout({dc_cam_fail3_reg,dc_cam_fail2_reg,dc_cam_fail1_reg,dc_cam_fail0_reg,mb0_l2t_cambist_reg}),
  .siclk(siclk),
  .soclk(soclk)
               );

assign dc_cam_fail[0] = (dc_cam_fail0_reg | dc_cam_fail1_reg) & mb0_l2t_cambist_reg;
assign dc_cam_fail[1] = (dc_cam_fail2_reg | dc_cam_fail3_reg) & mb0_l2t_cambist_reg;
assign ic_cam_fail[0] = (ic_cam_fail0_reg | ic_cam_fail1_reg) & mb0_l2t_cambist_reg;
assign ic_cam_fail[1] = (ic_cam_fail2_reg | ic_cam_fail3_reg) & mb0_l2t_cambist_reg;




 
 
// fixscan start:
assign spares_scanin         = scan_in                  ;
assign ff_sync_en_scanin         = spares_scanout                  ;
assign ff_ncu_signals_scanin     = ff_sync_en_scanout       ;
assign ff_staged_part_bank_scanin = ff_ncu_signals_scanout   ;
assign ff_partial_bank_support_scanin = ff_staged_part_bank_scanout;
assign ff_dirdp_inval_pckt_c7_slice0_scanin = ff_partial_bank_support_scanout;
assign ff_dirdp_inval_pckt_c7_slice1_scanin = ff_dirdp_inval_pckt_c7_slice0_scanout;
assign ff_dirdp_inval_pckt_c7_slice2_scanin = ff_dirdp_inval_pckt_c7_slice1_scanout;
assign ff_dirdp_inval_pckt_c7_slice3_scanin = ff_dirdp_inval_pckt_c7_slice2_scanout;
assign ff_dirvecdp_way_info_c7_scanin = ff_dirdp_inval_pckt_c7_slice3_scanout;
assign ff_dc_cam_hit_c52_4_scanin = ff_dirvecdp_way_info_c7_scanout;
assign ff_dc_cam_hit_c52_3_scanin = ff_dc_cam_hit_c52_4_scanout;
assign ff_dc_cam_hit_c52_2_scanin = ff_dc_cam_hit_c52_3_scanout;
assign ff_dc_cam_hit_c52_1_scanin = ff_dc_cam_hit_c52_2_scanout;
assign ff_dc_cam_hit_c6_4_scanin = ff_dc_cam_hit_c52_1_scanout;
assign ff_dc_cam_hit_c6_3_scanin = ff_dc_cam_hit_c6_4_scanout;
assign ff_dc_cam_hit_c6_2_scanin = ff_dc_cam_hit_c6_3_scanout;
assign ff_dc_cam_hit_c6_1_scanin = ff_dc_cam_hit_c6_2_scanout;
assign ff_ic_cam_hit_c52_1_scanin = ff_dc_cam_hit_c6_1_scanout;
assign ff_ic_cam_hit_c52_3_scanin = ff_ic_cam_hit_c52_1_scanout;
assign ff_ic_cam_hit_c6_1_scanin = ff_ic_cam_hit_c52_3_scanout;
assign ff_ic_cam_hit_c6_3_scanin = ff_ic_cam_hit_c6_1_scanout;
assign ff_ic_cam_hit_reg0_scanin = ff_ic_cam_hit_c6_3_scanout;
assign ff_ic_cam_hit_reg1_scanin = ff_ic_cam_hit_reg0_scanout;
assign ff_dc_cam_hit_reg0_scanin = ff_ic_cam_hit_reg1_scanout;
assign ff_dc_cam_hit_reg_scanin  = ff_dc_cam_hit_reg0_scanout;
assign ff_cam_tst_failed11_scanin = ff_dc_cam_hit_reg_scanout;
assign ff_cam_tst_failed00_scanin = ff_cam_tst_failed11_scanout;
assign scan_out                  = ff_cam_tst_failed00_scanout;
// fixscan end:
endmodule 













module l2t_dcvec_ctl (
  dc_cam_hit, 
  way_way_vld, 
  enc_dc_way, 
  dc_dir_hit);
wire dir_hit;


input	[3:0]	dc_cam_hit;
output	[2:0]	way_way_vld;
output	[1:0]	enc_dc_way;
output		dc_dir_hit;	
//output		dir_hit;	
	



assign dc_dir_hit = (| dc_cam_hit[3:0]);
assign enc_dc_way[0] = dc_cam_hit[1] | dc_cam_hit[3];
assign enc_dc_way[1] = dc_cam_hit[2] | dc_cam_hit[3];
assign  dir_hit =  dc_dir_hit ; 
assign  way_way_vld[0] = enc_dc_way[0] ;
assign  way_way_vld[1] = enc_dc_way[1] ;
assign  way_way_vld[2] = dir_hit ; 

endmodule


module l2t_dcicvec_ctl (
  dc_cam_hit, 
  ic_cam_hit, 
  enc_vec, 
  way_way_vld_c6);
wire [1:0] enc_dc_way;
wire [2:0] enc_ic_way;
wire dir_hit;
wire [4:0] final_mux_enc_way_in0;
wire [4:0] final_mux_enc_way_in1;
wire [4:0] enc_hit_way;


input   [3:0] dc_cam_hit;
input   [7:0] ic_cam_hit;

//output	      dir_hit;
output	[3:0]	enc_vec;
output	[3:0]	way_way_vld_c6;

wire	      ic_hit;
wire	      dc_hit;
wire	      ic_hit_n;

// DC hit processing

assign dc_hit = ( | dc_cam_hit[3:0] );

assign enc_dc_way[0] = dc_cam_hit[1] | dc_cam_hit[3];
assign enc_dc_way[1] = dc_cam_hit[2] | dc_cam_hit[3];


//or_macro dc_slice0 (ports=2,width=1)
//         (
//         .dout   (dc_cam_hit_1),
//         .din0   (dc_cam_hit[0]),
//         .din1   (dc_cam_hit[1]),
//         );
//
//
//or_macro dc_slice1 (ports=2,width=1)
//         (
//         .dout   (dc_cam_hit_2),
//         .din0   (dc_cam_hit[2]),
//         .din1   (dc_cam_hit[3])
//	 );
//
//
//or_macro dc_slice3 (ports=2,width=1)
//         (
//         .dout   (dc_hit),
//         .din0   (dc_cam_hit_1),
//         .din1   (dc_cam_hit_2)
//         );
//
//or_macro  enc_dc_way_slice_1  (width=1)
//         (
//         .dout   (enc_dc_way[0]),
//         .din0   (dc_cam_hit[1]),
//         .din1   (dc_cam_hit[3])
//         );
//
//or_macro  enc_dc_way_slice_2  (width=1)
//         (
//         .dout   (enc_dc_way[1]),
//         .din0   (dc_cam_hit[2]),
//         .din1   (dc_cam_hit[3])
//         );
//
//
//
//// IC hit processing

assign ic_hit = ( |ic_cam_hit[7:0]);

//or_macro ic_slice0 (ports=2,width=1)
//         (
//         .dout   (ic_cam_hit_1),
//         .din0   (ic_cam_hit[0]),
//         .din1   (ic_cam_hit[1]),
//         );
//
//or_macro ic_slice1 (ports=2,width=1)
//         (
//         .dout   (ic_cam_hit_2),
//         .din0   (ic_cam_hit[2]),
//         .din1   (ic_cam_hit[3]),
//         );
//
//
//or_macro ic_slice2 (ports=2,width=1)
//         (
//         .dout   (ic_cam_hit_3),
//         .din0   (ic_cam_hit[4]),
//         .din1   (ic_cam_hit[5]),
//         );
//
//
//or_macro ic_slice3 (ports=2,width=1)
//         (
//         .dout   (ic_cam_hit_4),
//         .din0   (ic_cam_hit[6]),
//         .din1   (ic_cam_hit[7]),
//         );
//
//
//or_macro ic_slice5 (ports=3,width=1)
//         (
//         .dout   (ic_cam_hit_10),
//         .din0   (ic_cam_hit_1),
//         .din1   (ic_cam_hit_2),
//         .din2   (ic_cam_hit_3)
//         );
//
//or_macro ic_slice6 (ports=2,width=1)
//         (
//         .dout   (ic_hit),
//         .din0   (ic_cam_hit_4),
//         .din1   (ic_cam_hit_10)
//         );



//or_macro or_added1 (ports=2,width=1)
//         (
//         .dout   (wire_added1),
//         .din0   (ic_cam_hit[1]),
//         .din1   (ic_cam_hit[3])
//         );
//or_macro or_added2 (ports=2,width=1)
//         (
//         .dout   (wire_added2),
//         .din0   (ic_cam_hit[5]),
//         .din1   (ic_cam_hit[7])
//         );
//or_macro or_added3 (ports=2,width=1)
//         (
//         .dout   (wire_added3),
//         .din0   (wire_added1),
//         .din1   (wire_added2)
//         );
//
//or_macro or_added4 (ports=2,width=1)
//         (
//         .dout   (wire_added4),
//         .din0   (ic_cam_hit[2]),
//         .din1   (ic_cam_hit[3])
//         );
//or_macro or_added5 (ports=2,width=1)
//         (
//         .dout   (wire_added5),
//         .din0   (ic_cam_hit[6]),
//         .din1   (ic_cam_hit[7])
//         );
//or_macro or_added6 (ports=2,width=1)
//         (
//         .dout   (wire_added6),
//         .din0   (wire_added4),
//         .din1   (wire_added5)
//         );
//
//or_macro or_added7 (ports=2,width=1)
//         (
//         .dout   (wire_added7),
//         .din0   (ic_cam_hit[4]),
//         .din1   (ic_cam_hit[5])
//         );
//or_macro or_added8 (ports=2,width=1)
//         (
//         .dout   (wire_added8),
//         .din0   (ic_cam_hit[6]),
//         .din1   (ic_cam_hit[7])
//         );
//or_macro or_added9 (ports=2,width=1)
//         (
//         .dout   (wire_added9),
//         .din0   (wire_added8),
//         .din1   (wire_added7)
//         );
//
assign  enc_ic_way[0]  = ic_cam_hit[1] | ic_cam_hit[3] | ic_cam_hit[5] | ic_cam_hit[7] ; 
assign  enc_ic_way[1]  = ic_cam_hit[2] | ic_cam_hit[3] | ic_cam_hit[6] | ic_cam_hit[7] ; 
assign  enc_ic_way[2]  = ic_cam_hit[4] | ic_cam_hit[5] | ic_cam_hit[6] | ic_cam_hit[7] ; 

//or_macro        dir_hit_slice  (width=1)
//        (
//        .dout   (dir_hit),
//        .din0   (dc_hit),
//        .din1   (ic_hit)
//        );

assign dir_hit = ic_hit | dc_hit;


//inv_macro ic_dir_inv_slice (width=1) 
//        ( 
//        .dout   (ic_hit_n ), 
//        .din    (ic_hit ) 
//        );      
//
//
//assign enc_hit_way[4:0] = ic_hit ? ({enc_ic_way[2:0],enc_ic_way[0],1'b1}) :
//				   ({enc_dc_way[1:0],1'b0,dc_hit,1'b0}) ; 
//


assign final_mux_enc_way_in0[4:0] = {enc_dc_way[1:0],1'b0,dc_hit,1'b0} ;
assign final_mux_enc_way_in1[4:0] = {enc_ic_way[2:0],enc_ic_way[0],1'b1};
assign enc_hit_way[4:0] = ~ic_hit?  final_mux_enc_way_in0[4:0] : final_mux_enc_way_in1[4:0];

//and_macro  final_mux_enc_way_0 (width=5,ports=2)
//	(
//	.dout	(final_mux_enc_way_in0[4:0]),
//	.din0	({enc_dc_way[1:0],1'b0,dc_hit,1'b0}),
//	.din1	({5{ic_hit_n}})
//	);
//
//and_macro  final_mux_enc_way_1 (width=5,ports=2)
//        (
//        .dout   (final_mux_enc_way_in1[4:0]),
//        .din0   ({enc_ic_way[2:0],enc_ic_way[0],1'b1}),
//        .din1   ({5{ic_hit}})
//        );
//
//or_macro  final_mux_enc_way (width=5,ports=2)
//        (
//        .dout   (enc_hit_way[4:0]),
//        .din0   (final_mux_enc_way_in0[4:0]),
//        .din1   (final_mux_enc_way_in1[4:0])
//        );
 
assign  way_way_vld_c6[0] = ic_hit ? enc_ic_way[0] : 1'b0;
assign  way_way_vld_c6[1] = ic_hit ? enc_ic_way[1] : enc_dc_way[0];
assign  way_way_vld_c6[2] = ic_hit ? enc_ic_way[2] : enc_dc_way[1];
assign  way_way_vld_c6[3] = dir_hit; 


assign enc_vec[3:0] = {enc_hit_way[4:3],enc_hit_way[1:0]};



//buff_macro buff_way_way_vld_c6	(width=4,stack=4r)
//	(
//	.dout	(way_way_vld_c6[3:0]),
//	.din	({dir_hit,enc_hit_way[4:2]})
//	);
//
//
//buff_macro buff_enc_vec  (width=4,stack=4r)
//        (
//        .dout   (enc_vec[3:0]),
//        .din    ({enc_hit_way[4:3],enc_hit_way[1:0]})
//        );
//


endmodule



module l2t_prbnk0_ctl (
  arbadr_ncu_l2t_pm_n, 
  arb_dirvec_cpu0_selbot, 
  arb_dirvec_cpu1_selbot, 
  arb_dirvec_cpu2_selbot, 
  arb_dirvec_cpu3_selbot, 
  arb_dirvec_cpu4_selbot, 
  arb_dirvec_cpu5_selbot, 
  arb_dirvec_cpu6_selbot, 
  arb_dirvec_cpu7_selbot, 
  arb_dirvec_cpu1_seltop, 
  arb_dirvec_cpu2_seltop, 
  arb_dirvec_cpu3_seltop, 
  arb_dirvec_cpu4_seltop, 
  arb_dirvec_cpu5_seltop, 
  arb_dirvec_cpu6_seltop, 
  arb_dirvec_cpu7_seltop, 
  arb_dirvec_cpu0_sel00, 
  arb_dirvec_cpu1_sel00, 
  arb_dirvec_cpu1_sel01, 
  arb_dirvec_cpu2_sel00, 
  arb_dirvec_cpu2_sel01, 
  arb_dirvec_cpu2_sel10, 
  arb_dirvec_cpu3_sel00, 
  arb_dirvec_cpu3_sel01, 
  arb_dirvec_cpu3_sel10, 
  arb_dirvec_cpu3_sel11, 
  arb_dirvec_cpu4_sel00, 
  arb_dirvec_cpu4_sel01, 
  arb_dirvec_cpu4_sel10, 
  arb_dirvec_cpu4_sel11, 
  arb_dirvec_cpu5_sel00, 
  arb_dirvec_cpu5_sel01, 
  arb_dirvec_cpu5_sel10, 
  arb_dirvec_cpu5_sel11, 
  arb_dirvec_cpu6_sel00, 
  arb_dirvec_cpu6_sel01, 
  arb_dirvec_cpu6_sel10, 
  arb_dirvec_cpu6_sel11, 
  arb_dirvec_cpu7_sel00, 
  arb_dirvec_cpu7_sel01, 
  arb_dirvec_cpu7_sel10, 
  arb_dirvec_cpu7_sel11, 
  enc_c_vec0, 
  enc_c_vec1, 
  enc_c_vec2, 
  enc_c_vec3, 
  enc_c_vec4, 
  enc_c_vec5, 
  enc_c_vec6, 
  enc_c_vec7, 
  enc_c_vec0_fnl, 
  enc_c_vec1_fnl, 
  enc_c_vec2_fnl, 
  enc_c_vec3_fnl, 
  enc_c_vec4_fnl, 
  enc_c_vec5_fnl, 
  enc_c_vec6_fnl, 
  enc_c_vec7_fnl);


input        arbadr_ncu_l2t_pm_n;
input        arb_dirvec_cpu0_selbot;
input        arb_dirvec_cpu1_selbot;
input        arb_dirvec_cpu2_selbot;
input        arb_dirvec_cpu3_selbot;
input        arb_dirvec_cpu4_selbot;
input        arb_dirvec_cpu5_selbot;
input        arb_dirvec_cpu6_selbot;
input        arb_dirvec_cpu7_selbot;
input        arb_dirvec_cpu1_seltop;
input        arb_dirvec_cpu2_seltop;
input        arb_dirvec_cpu3_seltop;
input        arb_dirvec_cpu4_seltop;
input        arb_dirvec_cpu5_seltop;
input        arb_dirvec_cpu6_seltop;
input        arb_dirvec_cpu7_seltop;
input        arb_dirvec_cpu0_sel00;
input        arb_dirvec_cpu1_sel00;
input        arb_dirvec_cpu1_sel01;
input        arb_dirvec_cpu2_sel00;
input        arb_dirvec_cpu2_sel01;
input        arb_dirvec_cpu2_sel10;
input        arb_dirvec_cpu3_sel00;
input        arb_dirvec_cpu3_sel01;
input        arb_dirvec_cpu3_sel10;
input        arb_dirvec_cpu3_sel11;
input        arb_dirvec_cpu4_sel00;
input        arb_dirvec_cpu4_sel01;
input        arb_dirvec_cpu4_sel10;
input        arb_dirvec_cpu4_sel11;
input        arb_dirvec_cpu5_sel00;
input        arb_dirvec_cpu5_sel01;
input        arb_dirvec_cpu5_sel10;
input        arb_dirvec_cpu5_sel11;
input        arb_dirvec_cpu6_sel00;
input        arb_dirvec_cpu6_sel01;
input        arb_dirvec_cpu6_sel10;
input        arb_dirvec_cpu6_sel11;
input        arb_dirvec_cpu7_sel00;
input        arb_dirvec_cpu7_sel01;
input        arb_dirvec_cpu7_sel10;
input        arb_dirvec_cpu7_sel11;






input  [3:0] enc_c_vec0;
input  [3:0] enc_c_vec1;
input  [3:0] enc_c_vec2;
input  [3:0] enc_c_vec3;
input  [3:0] enc_c_vec4;
input  [3:0] enc_c_vec5;
input  [3:0] enc_c_vec6;
input  [3:0] enc_c_vec7;

output  [3:0] enc_c_vec0_fnl;
output  [3:0] enc_c_vec1_fnl;
output  [3:0] enc_c_vec2_fnl;
output  [3:0] enc_c_vec3_fnl;
output  [3:0] enc_c_vec4_fnl;
output  [3:0] enc_c_vec5_fnl;
output  [3:0] enc_c_vec6_fnl;
output  [3:0] enc_c_vec7_fnl;




wire [3:0] enc_c_vec0_1,enc_c_vec2_3,enc_c_vec4_5,enc_c_vec6_7,enc_c_vec0_1_2_3,enc_c_vec4_5_6_7;

wire [3:0] cpu0_2bnk,cpu0_4bnk,cpu0_8bnk;
wire [3:0] cpu1_2bnk,cpu1_4bnk,cpu1_8bnk;
wire [3:0] cpu2_2bnk,cpu2_4bnk,cpu2_8bnk;
wire [3:0] cpu3_2bnk,cpu3_4bnk,cpu3_8bnk;
wire [3:0] cpu4_2bnk,cpu4_4bnk,cpu4_8bnk;
wire [3:0] cpu5_2bnk,cpu5_4bnk,cpu5_8bnk;
wire [3:0] cpu6_2bnk,cpu6_4bnk,cpu6_8bnk;
wire [3:0] cpu7_2bnk,cpu7_4bnk,cpu7_8bnk;

wire [3:0] cpu0_2bnk_0,cpu0_2bnk_1;
wire [3:0] cpu1_2bnk_0,cpu1_2bnk_1;
wire [3:0] cpu2_2bnk_0,cpu2_2bnk_1;
wire [3:0] cpu3_2bnk_0,cpu3_2bnk_1;
wire [3:0] cpu4_2bnk_0,cpu4_2bnk_1;
wire [3:0] cpu5_2bnk_0,cpu5_2bnk_1;
wire [3:0] cpu6_2bnk_0,cpu6_2bnk_1;
wire [3:0] cpu7_2bnk_0,cpu7_2bnk_1;


wire [3:0] cpu1_4bnk_0,cpu1_4bnk_1;
wire [3:0] cpu2_4bnk_0,cpu2_4bnk_1,cpu2_4bnk_2;
wire [3:0] cpu3_4bnk_0,cpu3_4bnk_1,cpu3_4bnk_2,cpu3_4bnk_3;
wire [3:0] cpu4_4bnk_0,cpu4_4bnk_1,cpu4_4bnk_2,cpu4_4bnk_3;
wire [3:0] cpu5_4bnk_0,cpu5_4bnk_1,cpu5_4bnk_2,cpu5_4bnk_3;
wire [3:0] cpu6_4bnk_0,cpu6_4bnk_1,cpu6_4bnk_2,cpu6_4bnk_3;
wire [3:0] cpu7_4bnk_0,cpu7_4bnk_1,cpu7_4bnk_2,cpu7_4bnk_3;

wire [3:0] cpu3_4bnk_4,cpu4_4bnk_4,cpu5_4bnk_4,cpu6_4bnk_4,cpu7_4bnk_4;

assign enc_c_vec0_1 = enc_c_vec0 | enc_c_vec1;
assign enc_c_vec2_3 = enc_c_vec2 | enc_c_vec3;
assign enc_c_vec4_5 = enc_c_vec4 | enc_c_vec5;
assign enc_c_vec6_7 = enc_c_vec6 | enc_c_vec7;
assign enc_c_vec0_1_2_3 = enc_c_vec0_1 | enc_c_vec2_3;
assign enc_c_vec4_5_6_7 = enc_c_vec4_5 | enc_c_vec6_7;

//or_macro or_0_1 (width=4)
//			(
//                        .dout   (enc_c_vec0_1),
//                        .din0   (enc_c_vec0),
//                        .din1   (enc_c_vec1)
//                        );
//or_macro or_2_3 (width=4)
//                        (
//                        .dout   (enc_c_vec2_3),
//                        .din0   (enc_c_vec2),
//                        .din1   (enc_c_vec3)
//                        );
//or_macro or_4_5 (width=4)
//                        (
//                        .dout   (enc_c_vec4_5),
//                        .din0   (enc_c_vec4),
//                        .din1   (enc_c_vec5)
//                        );
//or_macro or_6_7 (width=4)
//                        (
//                        .dout   (enc_c_vec6_7),
//                        .din0   (enc_c_vec6),
//                        .din1   (enc_c_vec7)
//                        );
//
//or_macro or_0_1_2_3 (width=4)
//                        (
//                        .dout   (enc_c_vec0_1_2_3),
//                        .din0   (enc_c_vec0_1),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//or_macro or_4_5_6_7 (width=4)
//                        (
//                        .dout   (enc_c_vec4_5_6_7),
//                        .din0   (enc_c_vec4_5),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//// CPU 0 
//
//// 2 bank :


assign cpu0_2bnk[3:0] = {4{arb_dirvec_cpu0_selbot}} & enc_c_vec0_1_2_3[3:0];
assign cpu0_4bnk[3:0] = {4{arb_dirvec_cpu0_sel00}} & enc_c_vec0_1[3:0];
assign cpu0_8bnk[3:0] = {4{arbadr_ncu_l2t_pm_n}} & enc_c_vec0[3:0];
assign enc_c_vec0_fnl[3:0] = cpu0_4bnk[3:0] | cpu0_8bnk[3:0] | cpu0_2bnk[3:0];

//and_macro cpu0_2bnk_vec (width = 4)
//                        (
//                        .dout   (cpu0_2bnk),
//                        .din0   ({4{arb_dirvec_cpu0_selbot}}),
//                        .din1   (enc_c_vec0_1_2_3)
//                        );
//// 4 bank :
//and_macro cpu0_4bnk_vec (width = 4)
//                        (
//                        .dout   (cpu0_4bnk),
//                        .din0   ({4{arb_dirvec_cpu0_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
// // 8 bank :
//and_macro cpu0_8bnk_vec (width = 4)
//                        (
//                        .dout   (cpu0_8bnk),
//                        .din0   ({4{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec0)
//                       );
//// final value
//
//or_macro cpu0_vec (width=4, ports=3)
//                        (
//                        .dout   (enc_c_vec0_fnl),
//                        .din0   (cpu0_4bnk),
//                        .din1   (cpu0_8bnk),
//                        .din2   (cpu0_2bnk)
//                        );
//
//// CPU 1 

assign cpu1_2bnk_0[3:0] = ({4{arb_dirvec_cpu1_selbot}}) & enc_c_vec0_1_2_3[3:0];
assign cpu1_2bnk_1[3:0] = ({4{arb_dirvec_cpu1_seltop}}) & enc_c_vec4_5_6_7[3:0];
assign cpu1_2bnk[3:0] = cpu1_2bnk_0[3:0] | cpu1_2bnk_1[3:0];

//// 2 bank :
//and_macro cpu1_2bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu1_2bnk_0),
//                        .din0   ({4{arb_dirvec_cpu1_selbot}}),
//                        .din1   (enc_c_vec0_1_2_3)
//                        );
//and_macro cpu1_2bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu1_2bnk_1),
//                        .din0   ({4{arb_dirvec_cpu1_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu1_2bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu1_2bnk),
//                        .din0   (cpu1_2bnk_0),
//                        .din1   (cpu1_2bnk_1)
//                        );

assign cpu1_4bnk_0[3:0] = {4{arb_dirvec_cpu1_sel00}} & enc_c_vec0_1[3:0];
assign cpu1_4bnk_1[3:0] = {4{arb_dirvec_cpu1_sel01}} & enc_c_vec2_3[3:0];
assign cpu1_4bnk[3:0] = cpu1_4bnk_0[3:0] | cpu1_4bnk_1[3:0];


//// 4 bank :
//and_macro cpu1_4bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu1_4bnk_0),
//                        .din0   ({4{arb_dirvec_cpu1_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu1_4bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu1_4bnk_1),
//                        .din0   ({4{arb_dirvec_cpu1_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//or_macro cpu1_4bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu1_4bnk),
//                        .din0   (cpu1_4bnk_0),
//                        .din1   (cpu1_4bnk_1)
//                        );


assign cpu1_8bnk[3:0] = {4{arbadr_ncu_l2t_pm_n}} & enc_c_vec1[3:0];
assign enc_c_vec1_fnl[3:0] = cpu1_4bnk[3:0] | cpu1_8bnk[3:0] | cpu1_2bnk[3:0];

//// 8 bank :
//
//and_macro cpu1_8bnk_vec (width = 4)
//                        (
//                        .dout   (cpu1_8bnk),
//                        .din0   ({4{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec1)
//                       );
//
//// final value
//
//or_macro cpu1_vec (width=4, ports=3)
//                        (
//                        .dout   (enc_c_vec1_fnl),
//                        .din0   (cpu1_4bnk),
//                        .din1   (cpu1_8bnk),
//                        .din2   (cpu1_2bnk)
//                        );
//
//
//// CPU 2 

assign cpu2_2bnk_0[3:0] = {4{arb_dirvec_cpu2_selbot}} & enc_c_vec0_1_2_3[3:0];
assign cpu2_2bnk_1[3:0] = {4{arb_dirvec_cpu2_seltop}} & enc_c_vec4_5_6_7[3:0];
assign cpu2_2bnk[3:0] = cpu2_2bnk_0[3:0] | cpu2_2bnk_1[3:0];

//// 2 bank :
//and_macro cpu2_2bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu2_2bnk_0),
//                        .din0   ({4{arb_dirvec_cpu2_selbot}}),
//                        .din1   (enc_c_vec0_1_2_3)
//                        );
//and_macro cpu2_2bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu2_2bnk_1),
//                        .din0   ({4{arb_dirvec_cpu2_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu2_2bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu2_2bnk),
//                        .din0   (cpu2_2bnk_0),
//                        .din1   (cpu2_2bnk_1)
//                        );

assign cpu2_4bnk_0[3:0] = {4{arb_dirvec_cpu2_sel00}} & enc_c_vec0_1[3:0];
assign cpu2_4bnk_1[3:0] = ({4{arb_dirvec_cpu2_sel01}}) & enc_c_vec2_3[3:0];
assign cpu2_4bnk_2[3:0] = {4{arb_dirvec_cpu2_sel10}} & enc_c_vec4_5[3:0];
assign cpu2_4bnk[3:0] = cpu2_4bnk_0[3:0] | cpu2_4bnk_1[3:0] | cpu2_4bnk_2[3:0];

//// 4 bank :
//and_macro cpu2_4bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu2_4bnk_0),
//                        .din0   ({4{arb_dirvec_cpu2_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu2_4bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu2_4bnk_1),
//                        .din0   ({4{arb_dirvec_cpu2_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu2_4bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu2_4bnk_2),
//                        .din0   ({4{arb_dirvec_cpu2_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//or_macro cpu2_4bnk_vec3 (width = 4, ports=3)
//                        (
//                        .dout   (cpu2_4bnk),
//                        .din0   (cpu2_4bnk_0),
//                        .din1   (cpu2_4bnk_1),
//                        .din2   (cpu2_4bnk_2)
//                        );

assign cpu2_8bnk[3:0] = {4{arbadr_ncu_l2t_pm_n}} & enc_c_vec2[3:0];
assign enc_c_vec2_fnl[3:0] = cpu2_4bnk[3:0] | cpu2_8bnk[3:0] | cpu2_2bnk[3:0];


//// 8 bank :
//
//and_macro cpu2_8bnk_vec (width = 4)
//                        (
//                        .dout   (cpu2_8bnk),
//                        .din0   ({4{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec2)
//                       );
//
//// final value
//
//or_macro cpu2_vec (width=4, ports=3)
//                        (
//                        .dout   (enc_c_vec2_fnl),
//                        .din0   (cpu2_4bnk),
//                        .din1   (cpu2_8bnk),
//                        .din2   (cpu2_2bnk)
//                        );




//// CPU 3 

assign cpu3_2bnk[3:0] = (({4{arb_dirvec_cpu3_selbot}} & enc_c_vec0_1_2_3[3:0] ) |
			({4{arb_dirvec_cpu3_seltop}} & enc_c_vec4_5_6_7[3:0]));


//// 2 bank :
//and_macro cpu3_2bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu3_2bnk_0),
//                        .din0   ({4{arb_dirvec_cpu3_selbot}}),
//                        .din1   (enc_c_vec0_1_2_3)
//                        );
//and_macro cpu3_2bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu3_2bnk_1),
//                        .din0   ({4{arb_dirvec_cpu3_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu3_2bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu3_2bnk),
//                        .din0   (cpu3_2bnk_0),
//                        .din1   (cpu3_2bnk_1)
//                        );

assign cpu3_4bnk[3:0]   = (({4{arb_dirvec_cpu3_sel00}} & enc_c_vec0_1[3:0]) | 
			   ({4{arb_dirvec_cpu3_sel01}} & enc_c_vec2_3[3:0]) |
			   ({4{arb_dirvec_cpu3_sel10}} & enc_c_vec4_5[3:0]) |
			   ({4{arb_dirvec_cpu3_sel11}} & enc_c_vec6_7[3:0]) );


//// 4 bank :
//and_macro cpu3_4bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu3_4bnk_0),
//                        .din0   ({4{arb_dirvec_cpu3_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu3_4bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu3_4bnk_1),
//                        .din0   ({4{arb_dirvec_cpu3_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu3_4bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu3_4bnk_2),
//                        .din0   ({4{arb_dirvec_cpu3_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu3_4bnk_vec3 (width = 4)
//                        (
//                        .dout   (cpu3_4bnk_3),
//                        .din0   ({4{arb_dirvec_cpu3_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu3_4bnk_vec4 (width = 4, ports=3)
//                        (
//                        .dout   (cpu3_4bnk_4),
//                        .din0   (cpu3_4bnk_0),
//                        .din1   (cpu3_4bnk_1),
//                        .din2   (cpu3_4bnk_2)
//                        );
//or_macro cpu3_4bnk_vec5  (width = 4)
//                        (
//                        .dout   (cpu3_4bnk),
//                        .din0   (cpu3_4bnk_4),
//                        .din1   (cpu3_4bnk_3)
//                        );
//// 8 bank :
assign cpu3_8bnk[3:0] = {4{arbadr_ncu_l2t_pm_n}} & enc_c_vec3[3:0];

//and_macro cpu3_8bnk_vec (width = 4)
//                        (
//                        .dout   (cpu3_8bnk),
//                        .din0   ({4{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec3)
//                       );
//
//// final value

assign enc_c_vec3_fnl[3:0] = cpu3_4bnk[3:0] | cpu3_8bnk[3:0] | cpu3_2bnk[3:0];

//or_macro cpu3_vec (width=4, ports=3)
//                        (
//                        .dout   (enc_c_vec3_fnl),
//                        .din0   (cpu3_4bnk),
//                        .din1   (cpu3_8bnk),
//                        .din2   (cpu3_2bnk)
//                        );
//
//
//// CPU 4 

assign cpu4_2bnk[3:0] = (({4{arb_dirvec_cpu4_selbot}} & enc_c_vec0_1_2_3[3:0] ) |
			 ({4{arb_dirvec_cpu4_seltop}} & enc_c_vec4_5_6_7[3:0] ) );

//// 2 bank :
//and_macro cpu4_2bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu4_2bnk_0),
//                        .din0   ({4{arb_dirvec_cpu4_selbot}}),
//                        .din1   (enc_c_vec0_1_2_3)
//                        );
//and_macro cpu4_2bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu4_2bnk_1),
//                        .din0   ({4{arb_dirvec_cpu4_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu4_2bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu4_2bnk),
//                        .din0   (cpu4_2bnk_0),
//                        .din1   (cpu4_2bnk_1)
//                        );
//
//
//// 4 bank :

assign cpu4_4bnk[3:0] = ( ({4{arb_dirvec_cpu4_sel00}} & enc_c_vec0_1[3:0] ) |
			  ({4{arb_dirvec_cpu4_sel01}} & enc_c_vec2_3[3:0] ) |
			  ({4{arb_dirvec_cpu4_sel10}} & enc_c_vec4_5[3:0] ) |
			  ({4{arb_dirvec_cpu4_sel11}} & enc_c_vec6_7[3:0] ) );

//and_macro cpu4_4bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu4_4bnk_0),
//                        .din0   ({4{arb_dirvec_cpu4_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu4_4bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu4_4bnk_1),
//                        .din0   ({4{arb_dirvec_cpu4_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu4_4bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu4_4bnk_2),
//                        .din0   ({4{arb_dirvec_cpu4_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu4_4bnk_vec3 (width = 4)
//                        (
//                        .dout   (cpu4_4bnk_3),
//                        .din0   ({4{arb_dirvec_cpu4_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu4_4bnk_vec4 (width = 4, ports=3)
//                        (
//                        .dout   (cpu4_4bnk_4),
//                        .din0   (cpu4_4bnk_0),
//                        .din1   (cpu4_4bnk_1),
//                        .din2   (cpu4_4bnk_2)
//                        );
//
//or_macro cpu4_4bnk_vec5  (width = 4)
//                        (
//                        .dout   (cpu4_4bnk),
//                        .din0   (cpu4_4bnk_4),
//                        .din1   (cpu4_4bnk_3)
//                        );
//// 8 bank :

assign cpu4_8bnk[3:0] = {4{arbadr_ncu_l2t_pm_n}} & enc_c_vec4[3:0];


//and_macro cpu4_8bnk_vec (width = 4)
//                        (
//                        .dout   (cpu4_8bnk),
//                        .din0   ({4{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec4)
//                       );
//
//// final value

assign enc_c_vec4_fnl = cpu4_4bnk | cpu4_8bnk | cpu4_2bnk;

//or_macro cpu4_vec (width=4, ports=3)
//                        (
//                        .dout   (enc_c_vec4_fnl),
//                        .din0   (cpu4_4bnk),
//                        .din1   (cpu4_8bnk),
//                        .din2   (cpu4_2bnk)
//                        );
//
//// CPU 5 

assign cpu5_2bnk = ( ({4{arb_dirvec_cpu5_selbot}} & enc_c_vec0_1_2_3[3:0] ) | 
		     ({4{arb_dirvec_cpu5_seltop}} & enc_c_vec4_5_6_7[3:0] ));

//// 2 bank :
//and_macro cpu5_2bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu5_2bnk_0),
//                        .din0   ({4{arb_dirvec_cpu5_selbot}}),
//                        .din1   (enc_c_vec0_1_2_3)
//                        );
//and_macro cpu5_2bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu5_2bnk_1),
//                        .din0   ({4{arb_dirvec_cpu5_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu5_2bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu5_2bnk),
//                        .din0   (cpu5_2bnk_0),
//                        .din1   (cpu5_2bnk_1)
//                        );
//

assign cpu5_4bnk[3:0] = ( ({4{arb_dirvec_cpu5_sel00}} & enc_c_vec0_1[3:0] ) |
			  ({4{arb_dirvec_cpu5_sel01}} & enc_c_vec2_3[3:0] ) |
			  ({4{arb_dirvec_cpu5_sel10}} & enc_c_vec4_5[3:0] ) |
			  ({4{arb_dirvec_cpu5_sel11}} & enc_c_vec6_7[3:0] ) );
//// 4 bank :
//and_macro cpu5_4bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu5_4bnk_0),
//                        .din0   ({4{arb_dirvec_cpu5_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu5_4bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu5_4bnk_1),
//                        .din0   ({4{arb_dirvec_cpu5_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu5_4bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu5_4bnk_2),
//                        .din0   ({4{arb_dirvec_cpu5_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu5_4bnk_vec3 (width = 4)
//                        (
//                        .dout   (cpu5_4bnk_3),
//                        .din0   ({4{arb_dirvec_cpu5_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu5_4bnk_vec4 (width = 4, ports=3)
//                        (
//                        .dout   (cpu5_4bnk_4),
//                        .din0   (cpu5_4bnk_0),
//                        .din1   (cpu5_4bnk_1),
//                        .din2   (cpu5_4bnk_2)
//                        );
//
//or_macro cpu5_4bnk_vec5  (width = 4)
//                        (
//                        .dout   (cpu5_4bnk),
//                        .din0   (cpu5_4bnk_4),
//                        .din1   (cpu5_4bnk_3)
//                        );


assign cpu5_8bnk[3:0] = {4{arbadr_ncu_l2t_pm_n}} & enc_c_vec5[3:0];

assign enc_c_vec5_fnl[3:0] = cpu5_4bnk[3:0] | cpu5_8bnk[3:0] | cpu5_2bnk[3:0];


//// 8 bank :
//
//and_macro cpu5_8bnk_vec (width = 4)
//                        (
//                        .dout   (cpu5_8bnk),
//                        .din0   ({4{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec5)
//                       );
//
//// final value
//
//or_macro cpu5_vec (width=4, ports=3)
//                        (
//                        .dout   (enc_c_vec5_fnl),
//                        .din0   (cpu5_4bnk),
//                        .din1   (cpu5_8bnk),
//                        .din2   (cpu5_2bnk)
//                        );
//
//
//// CPU 6 


assign cpu6_2bnk[3:0] = ( ({4{arb_dirvec_cpu6_selbot}} & enc_c_vec0_1_2_3[3:0]) | 
			  ({4{arb_dirvec_cpu6_seltop}} & enc_c_vec4_5_6_7[3:0]) );
//// 2 bank :
//and_macro cpu6_2bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu6_2bnk_0),
//                        .din0   ({4{arb_dirvec_cpu6_selbot}}),
//                        .din1   (enc_c_vec0_1_2_3)
//                        );
//and_macro cpu6_2bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu6_2bnk_1),
//                        .din0   ({4{arb_dirvec_cpu6_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu6_2bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu6_2bnk),
//                        .din0   (cpu6_2bnk_0),
//                        .din1   (cpu6_2bnk_1)
//                        );

assign cpu6_4bnk[3:0] = ( ({4{arb_dirvec_cpu6_sel00}} & enc_c_vec0_1[3:0] ) |
			  ({4{arb_dirvec_cpu6_sel01}} & enc_c_vec2_3[3:0] ) |
			  ({4{arb_dirvec_cpu6_sel10}} & enc_c_vec4_5[3:0] ) |
			  ({4{arb_dirvec_cpu6_sel11}} & enc_c_vec6_7[3:0] ) );


//// 4 bank :
//and_macro cpu6_4bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu6_4bnk_0),
//                        .din0   ({4{arb_dirvec_cpu6_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu6_4bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu6_4bnk_1),
//                        .din0   ({4{arb_dirvec_cpu6_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu6_4bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu6_4bnk_2),
//                        .din0   ({4{arb_dirvec_cpu6_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu6_4bnk_vec3 (width = 4)
//                        (
//                        .dout   (cpu6_4bnk_3),
//                        .din0   ({4{arb_dirvec_cpu6_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu6_4bnk_vec4 (width = 4, ports=3)
//                        (
//                        .dout   (cpu6_4bnk_4),
//                        .din0   (cpu6_4bnk_0),
//                        .din1   (cpu6_4bnk_1),
//                        .din2   (cpu6_4bnk_2)
//                        );
//
//or_macro cpu6_4bnk_vec5  (width = 4)
//                        (
//                        .dout   (cpu6_4bnk),
//                        .din0   (cpu6_4bnk_4),
//                        .din1   (cpu6_4bnk_3)
//                        );
//// 8 bank :

assign cpu6_8bnk[3:0] = {4{arbadr_ncu_l2t_pm_n}} & enc_c_vec6[3:0];
assign enc_c_vec6_fnl[3:0] = cpu6_4bnk[3:0] | cpu6_8bnk[3:0] | cpu6_2bnk[3:0];

//and_macro cpu6_8bnk_vec (width = 4)
//                        (
//                        .dout   (cpu6_8bnk),
//                        .din0   ({4{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec6)
//                       );
//
//// final value
//
//or_macro cpu6_vec (width=4, ports=3)
//                        (
//                        .dout   (enc_c_vec6_fnl),
//                        .din0   (cpu6_4bnk),
//                        .din1   (cpu6_8bnk),
//                        .din2   (cpu6_2bnk)
//                        );
//
//
//// CPU 7 

assign cpu7_2bnk[3:0] = ( ({4{arb_dirvec_cpu7_selbot}} & enc_c_vec0_1_2_3[3:0] ) |
			  ({4{arb_dirvec_cpu7_seltop}} & enc_c_vec4_5_6_7[3:0] ) );

//// 2 bank :
//and_macro cpu7_2bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu7_2bnk_0),
//                        .din0   ({4{arb_dirvec_cpu7_selbot}}),
//                        .din1   (enc_c_vec0_1_2_3)
//                        );
//and_macro cpu7_2bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu7_2bnk_1),
//                        .din0   ({4{arb_dirvec_cpu7_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu7_2bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu7_2bnk),
//                        .din0   (cpu7_2bnk_0),
//                        .din1   (cpu7_2bnk_1)
//                        );
//

assign cpu7_4bnk[3:0] = ( ({4{arb_dirvec_cpu7_sel00}} & enc_c_vec0_1[3:0]) | 
			  ({4{arb_dirvec_cpu7_sel01}} & enc_c_vec2_3[3:0] ) |
			  ({4{arb_dirvec_cpu7_sel10}} & enc_c_vec4_5[3:0] ) |
			  ({4{arb_dirvec_cpu7_sel11}} & enc_c_vec6_7[3:0] ) );

//// 4 bank :
//and_macro cpu7_4bnk_vec0 (width = 4)
//                        (
//                        .dout   (cpu7_4bnk_0),
//                        .din0   ({4{arb_dirvec_cpu7_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu7_4bnk_vec1 (width = 4)
//                        (
//                        .dout   (cpu7_4bnk_1),
//                        .din0   ({4{arb_dirvec_cpu7_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu7_4bnk_vec2 (width = 4)
//                        (
//                        .dout   (cpu7_4bnk_2),
//                        .din0   ({4{arb_dirvec_cpu7_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu7_4bnk_vec3 (width = 4)
//                        (
//                        .dout   (cpu7_4bnk_3),
//                        .din0   ({4{arb_dirvec_cpu7_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu7_4bnk_vec4 (width = 4, ports=3)
//                        (
//                        .dout   (cpu7_4bnk_4),
//                        .din0   (cpu7_4bnk_0),
//                        .din1   (cpu7_4bnk_1),
//                        .din2   (cpu7_4bnk_2)
//                        );
//
//or_macro cpu7_4bnk_vec5  (width = 4)
//                        (
//                        .dout   (cpu7_4bnk),
//                        .din0   (cpu7_4bnk_4),
//                        .din1   (cpu7_4bnk_3)
//                        );
//// 8 bank :
assign cpu7_8bnk[3:0] = {4{arbadr_ncu_l2t_pm_n}} & enc_c_vec7[3:0] ;
assign enc_c_vec7_fnl[3:0] = cpu7_4bnk[3:0] | cpu7_8bnk[3:0] | cpu7_2bnk[3:0] ;

//and_macro cpu7_8bnk_vec (width = 4)
//                        (
//                        .dout   (cpu7_8bnk),
//                        .din0   ({4{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec7)
//                       );
//
//// final value
//
//or_macro cpu7_vec (width=4, ports=3)
//                        (
//                        .dout   (enc_c_vec7_fnl),
//                        .din0   (cpu7_4bnk),
//                        .din1   (cpu7_8bnk),
//                        .din2   (cpu7_2bnk)
//                        );
//

endmodule


module l2t_prbnk1_ctl (
  arbadr_ncu_l2t_pm_n, 
  arb_dirvec_cpu0_selbot, 
  arb_dirvec_cpu1_selbot, 
  arb_dirvec_cpu2_selbot, 
  arb_dirvec_cpu3_selbot, 
  arb_dirvec_cpu4_selbot, 
  arb_dirvec_cpu5_selbot, 
  arb_dirvec_cpu6_selbot, 
  arb_dirvec_cpu7_selbot, 
  arb_dirvec_cpu1_seltop, 
  arb_dirvec_cpu2_seltop, 
  arb_dirvec_cpu3_seltop, 
  arb_dirvec_cpu4_seltop, 
  arb_dirvec_cpu5_seltop, 
  arb_dirvec_cpu6_seltop, 
  arb_dirvec_cpu7_seltop, 
  arb_dirvec_cpu0_sel00, 
  arb_dirvec_cpu1_sel00, 
  arb_dirvec_cpu1_sel01, 
  arb_dirvec_cpu2_sel00, 
  arb_dirvec_cpu2_sel01, 
  arb_dirvec_cpu2_sel10, 
  arb_dirvec_cpu3_sel00, 
  arb_dirvec_cpu3_sel01, 
  arb_dirvec_cpu3_sel10, 
  arb_dirvec_cpu3_sel11, 
  arb_dirvec_cpu4_sel00, 
  arb_dirvec_cpu4_sel01, 
  arb_dirvec_cpu4_sel10, 
  arb_dirvec_cpu4_sel11, 
  arb_dirvec_cpu5_sel00, 
  arb_dirvec_cpu5_sel01, 
  arb_dirvec_cpu5_sel10, 
  arb_dirvec_cpu5_sel11, 
  arb_dirvec_cpu6_sel00, 
  arb_dirvec_cpu6_sel01, 
  arb_dirvec_cpu6_sel10, 
  arb_dirvec_cpu6_sel11, 
  arb_dirvec_cpu7_sel00, 
  arb_dirvec_cpu7_sel01, 
  arb_dirvec_cpu7_sel10, 
  arb_dirvec_cpu7_sel11, 
  enc_c_vec0, 
  enc_c_vec1, 
  enc_c_vec2, 
  enc_c_vec3, 
  enc_c_vec4, 
  enc_c_vec5, 
  enc_c_vec6, 
  enc_c_vec7, 
  enc_c_vec0_fnl, 
  enc_c_vec1_fnl, 
  enc_c_vec2_fnl, 
  enc_c_vec3_fnl, 
  enc_c_vec4_fnl, 
  enc_c_vec5_fnl, 
  enc_c_vec6_fnl, 
  enc_c_vec7_fnl);
input        arbadr_ncu_l2t_pm_n;
input        arb_dirvec_cpu0_selbot;
input        arb_dirvec_cpu1_selbot;
input        arb_dirvec_cpu2_selbot;
input        arb_dirvec_cpu3_selbot;
input        arb_dirvec_cpu4_selbot;
input        arb_dirvec_cpu5_selbot;
input        arb_dirvec_cpu6_selbot;
input        arb_dirvec_cpu7_selbot;
input        arb_dirvec_cpu1_seltop;
input        arb_dirvec_cpu2_seltop;
input        arb_dirvec_cpu3_seltop;
input        arb_dirvec_cpu4_seltop;
input        arb_dirvec_cpu5_seltop;
input        arb_dirvec_cpu6_seltop;
input        arb_dirvec_cpu7_seltop;

input        arb_dirvec_cpu0_sel00;

input        arb_dirvec_cpu1_sel00;
input        arb_dirvec_cpu1_sel01;

input        arb_dirvec_cpu2_sel00;
input        arb_dirvec_cpu2_sel01;
input        arb_dirvec_cpu2_sel10;

input        arb_dirvec_cpu3_sel00;
input        arb_dirvec_cpu3_sel01;
input        arb_dirvec_cpu3_sel10;
input        arb_dirvec_cpu3_sel11;

input        arb_dirvec_cpu4_sel00;
input        arb_dirvec_cpu4_sel01;
input        arb_dirvec_cpu4_sel10;
input        arb_dirvec_cpu4_sel11;

input        arb_dirvec_cpu5_sel00;
input        arb_dirvec_cpu5_sel01;
input        arb_dirvec_cpu5_sel10;
input        arb_dirvec_cpu5_sel11;

input        arb_dirvec_cpu6_sel00;
input        arb_dirvec_cpu6_sel01;
input        arb_dirvec_cpu6_sel10;
input        arb_dirvec_cpu6_sel11;
input        arb_dirvec_cpu7_sel00;
input        arb_dirvec_cpu7_sel01;
input        arb_dirvec_cpu7_sel10;
input        arb_dirvec_cpu7_sel11;






input  [2:0] enc_c_vec0;
input  [2:0] enc_c_vec1;
input  [2:0] enc_c_vec2;
input  [2:0] enc_c_vec3;
input  [2:0] enc_c_vec4;
input  [2:0] enc_c_vec5;
input  [2:0] enc_c_vec6;
input  [2:0] enc_c_vec7;

output  [2:0] enc_c_vec0_fnl;
output  [2:0] enc_c_vec1_fnl;
output  [2:0] enc_c_vec2_fnl;
output  [2:0] enc_c_vec3_fnl;
output  [2:0] enc_c_vec4_fnl;
output  [2:0] enc_c_vec5_fnl;
output  [2:0] enc_c_vec6_fnl;
output  [2:0] enc_c_vec7_fnl;

wire [2:0] enc_c_vec0_1,enc_c_vec2_3,enc_c_vec4_5,enc_c_vec6_7,enc_c_vec_0_1_2_3,enc_c_vec4_5_6_7;
wire [2:0] cpu0_2bnk,cpu0_4bnk,cpu0_8bnk;
wire [2:0] cpu1_2bnk,cpu1_4bnk,cpu1_8bnk;
wire [2:0] cpu2_2bnk,cpu2_4bnk,cpu2_8bnk;
wire [2:0] cpu3_2bnk,cpu3_4bnk,cpu3_8bnk;
wire [2:0] cpu4_2bnk,cpu4_4bnk,cpu4_8bnk;
wire [2:0] cpu5_2bnk,cpu5_4bnk,cpu5_8bnk;
wire [2:0] cpu6_2bnk,cpu6_4bnk,cpu6_8bnk;
wire [2:0] cpu7_2bnk,cpu7_4bnk,cpu7_8bnk;

wire [2:0] cpu0_2bnk_0,cpu0_2bnk_1;
wire [2:0] cpu1_2bnk_0,cpu1_2bnk_1;
wire [2:0] cpu2_2bnk_0,cpu2_2bnk_1;
wire [2:0] cpu3_2bnk_0,cpu3_2bnk_1;
wire [2:0] cpu4_2bnk_0,cpu4_2bnk_1;
wire [2:0] cpu5_2bnk_0,cpu5_2bnk_1;
wire [2:0] cpu6_2bnk_0,cpu6_2bnk_1;
wire [2:0] cpu7_2bnk_0,cpu7_2bnk_1;


wire [2:0] cpu1_4bnk_0,cpu1_4bnk_1;
wire [2:0] cpu2_4bnk_0,cpu2_4bnk_1,cpu2_4bnk_2;
wire [2:0] cpu3_4bnk_0,cpu3_4bnk_1,cpu3_4bnk_2,cpu3_4bnk_3;
wire [2:0] cpu4_4bnk_0,cpu4_4bnk_1,cpu4_4bnk_2,cpu4_4bnk_3;
wire [2:0] cpu5_4bnk_0,cpu5_4bnk_1,cpu5_4bnk_2,cpu5_4bnk_3;
wire [2:0] cpu6_4bnk_0,cpu6_4bnk_1,cpu6_4bnk_2,cpu6_4bnk_3;
wire [2:0] cpu7_4bnk_0,cpu7_4bnk_1,cpu7_4bnk_2,cpu7_4bnk_3;

wire [2:0] cpu3_4bnk_4,cpu4_4bnk_4,cpu5_4bnk_4,cpu6_4bnk_4,cpu7_4bnk_4;


assign enc_c_vec0_1 = enc_c_vec0 | enc_c_vec1;
assign enc_c_vec2_3 = enc_c_vec2 | enc_c_vec3;
assign enc_c_vec4_5 = enc_c_vec4 | enc_c_vec5;
assign enc_c_vec6_7 = enc_c_vec6 | enc_c_vec7;
assign enc_c_vec_0_1_2_3 = enc_c_vec0_1 | enc_c_vec2_3;
assign enc_c_vec4_5_6_7 = enc_c_vec4_5 | enc_c_vec6_7;


//or_macro or_0_1 (width=3)
//			(
//                        .dout   (enc_c_vec0_1),
//                        .din0   (enc_c_vec0),
//                        .din1   (enc_c_vec1)
//                        );
//or_macro or_2_3 (width=3)
//                        (
//                        .dout   (enc_c_vec2_3),
//                        .din0   (enc_c_vec2),
//                        .din1   (enc_c_vec3)
//                        );
//or_macro or_4_5 (width=3)
//                        (
//                        .dout   (enc_c_vec4_5),
//                        .din0   (enc_c_vec4),
//                        .din1   (enc_c_vec5)
//                        );
//or_macro or_6_7 (width=3)
//                        (
//                        .dout   (enc_c_vec6_7),
//                        .din0   (enc_c_vec6),
//                        .din1   (enc_c_vec7)
//                        );
//
//or_macro or_0_1_2_3 (width=3)
//                        (
//                        .dout   (enc_c_vec_0_1_2_3),
//                        .din0   (enc_c_vec0_1),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//or_macro or_4_5_6_7 (width=3)
//                        (
//                        .dout   (enc_c_vec4_5_6_7),
//                        .din0   (enc_c_vec4_5),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//// CPU 0 
//
//// 2 bank :


assign cpu0_2bnk[2:0] = {3{arb_dirvec_cpu0_selbot}} & enc_c_vec_0_1_2_3[2:0];
assign cpu0_4bnk[2:0] = {3{arb_dirvec_cpu0_sel00}} & enc_c_vec0_1[2:0];
assign cpu0_8bnk[2:0] = {3{arbadr_ncu_l2t_pm_n}} & enc_c_vec0[2:0];
assign enc_c_vec0_fnl[2:0] = cpu0_4bnk[2:0] | cpu0_8bnk[2:0] | cpu0_2bnk[2:0];

//and_macro cpu0_2bnk_vec (width = 3)
//                        (
//                        .dout   (cpu0_2bnk),
//                        .din0   ({3{arb_dirvec_cpu0_selbot}}),
//                        .din1   (enc_c_vec_0_1_2_3)
//                        );
//// 4 bank :
//and_macro cpu0_4bnk_vec (width = 3)
//                        (
//                        .dout   (cpu0_4bnk),
//                        .din0   ({3{arb_dirvec_cpu0_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
// // 8 bank :
//and_macro cpu0_8bnk_vec (width = 3)
//                        (
//                        .dout   (cpu0_8bnk),
//                        .din0   ({3{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec0)
//                       );
//// final value
//
//or_macro cpu0_vec (width=3, ports=3)
//                        (
//                        .dout   (enc_c_vec0_fnl),
//                        .din0   (cpu0_4bnk),
//                        .din1   (cpu0_8bnk),
//                        .din2   (cpu0_2bnk)
//                        );
//
//// CPU 1 

assign cpu1_2bnk[2:0] = ( ({3{arb_dirvec_cpu1_selbot}} & enc_c_vec_0_1_2_3[2:0] ) |
			  ({3{arb_dirvec_cpu1_seltop}} & enc_c_vec4_5_6_7[2:0] ) );

//// 2 bank :
//and_macro cpu1_2bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu1_2bnk_0),
//                        .din0   ({3{arb_dirvec_cpu1_selbot}}),
//                        .din1   (enc_c_vec_0_1_2_3)
//                        );
//and_macro cpu1_2bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu1_2bnk_1),
//                        .din0   ({3{arb_dirvec_cpu1_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu1_2bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu1_2bnk),
//                        .din0   (cpu1_2bnk_0),
//                        .din1   (cpu1_2bnk_1)
//                        );

assign cpu1_4bnk[2:0] = ( ({3{arb_dirvec_cpu1_sel00}} & enc_c_vec0_1[2:0] ) |
			  ({3{arb_dirvec_cpu1_sel01}} & enc_c_vec2_3[2:0] ) );

//// 4 bank :
//and_macro cpu1_4bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu1_4bnk_0),
//                        .din0   ({3{arb_dirvec_cpu1_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu1_4bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu1_4bnk_1),
//                        .din0   ({3{arb_dirvec_cpu1_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//or_macro cpu1_4bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu1_4bnk),
//                        .din0   (cpu1_4bnk_0),
//                        .din1   (cpu1_4bnk_1)
//                        );
//

assign cpu1_8bnk[2:0] = ({3{arbadr_ncu_l2t_pm_n}} & enc_c_vec1[2:0] );

//// 8 bank :
//
//and_macro cpu1_8bnk_vec (width = 3)
//                        (
//                        .dout   (cpu1_8bnk),
//                        .din0   ({3{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec1)
//                       );
//
//// final value
assign enc_c_vec1_fnl[2:0] = cpu1_4bnk | cpu1_8bnk | cpu1_2bnk;
//or_macro cpu1_vec (width=3, ports=3)
//                        (
//                        .dout   (enc_c_vec1_fnl),
//                        .din0   (cpu1_4bnk),
//                        .din1   (cpu1_8bnk),
//                        .din2   (cpu1_2bnk)
//                        );


//// CPU 2 

assign cpu2_2bnk[2:0] =( ({3{arb_dirvec_cpu2_selbot}} & enc_c_vec_0_1_2_3[2:0]) |
			 ({3{arb_dirvec_cpu2_seltop}} & enc_c_vec4_5_6_7[2:0]) );

//// 2 bank :
//and_macro cpu2_2bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu2_2bnk_0),
//                        .din0   ({3{arb_dirvec_cpu2_selbot}}),
//                        .din1   (enc_c_vec_0_1_2_3)
//                        );
//and_macro cpu2_2bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu2_2bnk_1),
//                        .din0   ({3{arb_dirvec_cpu2_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu2_2bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu2_2bnk),
//                        .din0   (cpu2_2bnk_0),
//                        .din1   (cpu2_2bnk_1)
//                        );

assign cpu2_4bnk[2:0] = ( ({3{arb_dirvec_cpu2_sel00}} & enc_c_vec0_1[2:0] ) |
			  ({3{arb_dirvec_cpu2_sel01}} & enc_c_vec2_3[2:0] ) |
			  ({3{arb_dirvec_cpu2_sel10}} & enc_c_vec4_5[2:0] ) );

//// 4 bank :
//and_macro cpu2_4bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu2_4bnk_0),
//                        .din0   ({3{arb_dirvec_cpu2_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu2_4bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu2_4bnk_1),
//                        .din0   ({3{arb_dirvec_cpu2_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu2_4bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu2_4bnk_2),
//                        .din0   ({3{arb_dirvec_cpu2_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//or_macro cpu2_4bnk_vec3 (width = 3, ports=3)
//                        (
//                        .dout   (cpu2_4bnk),
//                        .din0   (cpu2_4bnk_0),
//                        .din1   (cpu2_4bnk_1),
//                        .din2   (cpu2_4bnk_2)
//                        );
//
//
//// 8 bank :

assign cpu2_8bnk[2:0] = {3{arbadr_ncu_l2t_pm_n}} & enc_c_vec2[2:0];
assign enc_c_vec2_fnl[2:0]  = cpu2_4bnk[2:0] | cpu2_8bnk[2:0] | cpu2_2bnk[2:0];

//and_macro cpu2_8bnk_vec (width = 3)
//                        (
//                        .dout   (cpu2_8bnk),
//                        .din0   ({3{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec2)
//                       );
//
//// final value
//
//or_macro cpu2_vec (width=3, ports=3)
//                        (
//                        .dout   (enc_c_vec2_fnl),
//                        .din0   (cpu2_4bnk),
//                        .din1   (cpu2_8bnk),
//                        .din2   (cpu2_2bnk)
//                        );
//
//
//// CPU 3 

assign cpu3_2bnk[2:0] = ( ({3{arb_dirvec_cpu3_selbot}} & enc_c_vec_0_1_2_3[2:0]) |
			  ({3{arb_dirvec_cpu3_seltop}} & enc_c_vec4_5_6_7[2:0]) );
//// 2 bank :
//and_macro cpu3_2bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu3_2bnk_0),
//                        .din0   ({3{arb_dirvec_cpu3_selbot}}),
//                        .din1   (enc_c_vec_0_1_2_3)
//                        );
//and_macro cpu3_2bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu3_2bnk_1),
//                        .din0   ({3{arb_dirvec_cpu3_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu3_2bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu3_2bnk),
//                        .din0   (cpu3_2bnk_0),
//                        .din1   (cpu3_2bnk_1)
//                        );
//
//
//// 4 bank :

assign cpu3_4bnk[2:0] = ( ({3{arb_dirvec_cpu3_sel00}} & enc_c_vec0_1[2:0] ) |
			  ({3{arb_dirvec_cpu3_sel01}} & enc_c_vec2_3[2:0] ) |
			  ({3{arb_dirvec_cpu3_sel10}} & enc_c_vec4_5[2:0] ) |
			  ({3{arb_dirvec_cpu3_sel11}} & enc_c_vec6_7[2:0] ) );

//and_macro cpu3_4bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu3_4bnk_0),
//                        .din0   ({3{arb_dirvec_cpu3_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu3_4bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu3_4bnk_1),
//                        .din0   ({3{arb_dirvec_cpu3_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu3_4bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu3_4bnk_2),
//                        .din0   ({3{arb_dirvec_cpu3_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu3_4bnk_vec3 (width = 3)
//                        (
//                        .dout   (cpu3_4bnk_3),
//                        .din0   ({3{arb_dirvec_cpu3_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu3_4bnk_vec4 (width = 3, ports=3)
//                        (
//                        .dout   (cpu3_4bnk_4),
//                        .din0   (cpu3_4bnk_0),
//                        .din1   (cpu3_4bnk_1),
//                        .din2   (cpu3_4bnk_2)
//                        );
//
//or_macro cpu3_4bnk_vec5  (width = 3)
//                        (
//                        .dout   (cpu3_4bnk),
//                        .din0   (cpu3_4bnk_4),
//                        .din1   (cpu3_4bnk_3)
//                        );
//// 8 bank :

assign cpu3_8bnk[2:0] = {3{arbadr_ncu_l2t_pm_n}} & enc_c_vec3[2:0];

//and_macro cpu3_8bnk_vec (width = 3)
//                        (
//                        .dout   (cpu3_8bnk),
//                        .din0   ({3{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec3)
//                       );
//
//// final value

assign enc_c_vec3_fnl[2:0] = cpu3_4bnk[2:0] | cpu3_8bnk[2:0] | cpu3_2bnk[2:0] ;

//or_macro cpu3_vec (width=3, ports=3)
//                        (
//                        .dout   (enc_c_vec3_fnl),
//                        .din0   (cpu3_4bnk),
//                        .din1   (cpu3_8bnk),
//                        .din2   (cpu3_2bnk)
//                        );
//
//
//// CPU 4 

assign cpu4_2bnk[2:0] = ( ({3{arb_dirvec_cpu4_selbot}} & enc_c_vec_0_1_2_3[2:0]) |
			  ({3{arb_dirvec_cpu4_seltop}} & enc_c_vec4_5_6_7[2:0]) ); 

//// 2 bank :
//and_macro cpu4_2bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu4_2bnk_0),
//                        .din0   ({3{arb_dirvec_cpu4_selbot}}),
//                        .din1   (enc_c_vec_0_1_2_3)
//                        );
//and_macro cpu4_2bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu4_2bnk_1),
//                        .din0   ({3{arb_dirvec_cpu4_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu4_2bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu4_2bnk),
//                        .din0   (cpu4_2bnk_0),
//                        .din1   (cpu4_2bnk_1)
//                        );
//
//// 4 bank :


assign cpu4_4bnk[2:0] = (  ({3{arb_dirvec_cpu4_sel00}} & enc_c_vec0_1[2:0] ) |
                           ({3{arb_dirvec_cpu4_sel01}} & enc_c_vec2_3[2:0] ) |
                           ({3{arb_dirvec_cpu4_sel10}} & enc_c_vec4_5[2:0] ) |
                           ({3{arb_dirvec_cpu4_sel11}} & enc_c_vec6_7[2:0] ) );



//and_macro cpu4_4bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu4_4bnk_0),
//                        .din0   ({3{arb_dirvec_cpu4_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu4_4bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu4_4bnk_1),
//                        .din0   ({3{arb_dirvec_cpu4_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu4_4bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu4_4bnk_2),
//                        .din0   ({3{arb_dirvec_cpu4_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu4_4bnk_vec3 (width = 3)
//                        (
//                        .dout   (cpu4_4bnk_3),
//                        .din0   ({3{arb_dirvec_cpu4_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu4_4bnk_vec4 (width = 3, ports=3)
//                        (
//                        .dout   (cpu4_4bnk_4),
//                        .din0   (cpu4_4bnk_0),
//                        .din1   (cpu4_4bnk_1),
//                        .din2   (cpu4_4bnk_2)
//                        );
//
//or_macro cpu4_4bnk_vec5  (width = 3)
//                        (
//                        .dout   (cpu4_4bnk),
//                        .din0   (cpu4_4bnk_4),
//                        .din1   (cpu4_4bnk_3)
//                        );
//// 8 bank :

assign cpu4_8bnk[2:0] = {3{arbadr_ncu_l2t_pm_n}} & enc_c_vec4[2:0];

//and_macro cpu4_8bnk_vec (width = 3)
//                        (
//                        .dout   (cpu4_8bnk),
//                        .din0   ({3{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec4)
//                       );

//// final value


assign enc_c_vec4_fnl[2:0] = cpu4_4bnk[2:0] | cpu4_8bnk[2:0] | cpu4_2bnk[2:0] ;

//or_macro cpu4_vec (width=3, ports=3)
//                        (
//                        .dout   (enc_c_vec4_fnl),
//                        .din0   (cpu4_4bnk),
//                        .din1   (cpu4_8bnk),
//                        .din2   (cpu4_2bnk)
//                        );
//
//// CPU 5 
//
//// 2 bank :

assign cpu5_2bnk[2:0] = ( ({3{arb_dirvec_cpu5_selbot}} & enc_c_vec_0_1_2_3[2:0]) |
                          ({3{arb_dirvec_cpu5_seltop}} & enc_c_vec4_5_6_7[2:0]) );

//and_macro cpu5_2bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu5_2bnk_0),
//                        .din0   ({3{arb_dirvec_cpu5_selbot}}),
//                        .din1   (enc_c_vec_0_1_2_3)
//                        );
//and_macro cpu5_2bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu5_2bnk_1),
//                        .din0   ({3{arb_dirvec_cpu5_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu5_2bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu5_2bnk),
//                        .din0   (cpu5_2bnk_0),
//                        .din1   (cpu5_2bnk_1)
//                        );
//
//
//// 4 bank :

assign cpu5_4bnk[2:0] = (  ({3{arb_dirvec_cpu5_sel00}} & enc_c_vec0_1[2:0] ) |
                           ({3{arb_dirvec_cpu5_sel01}} & enc_c_vec2_3[2:0] ) |
                           ({3{arb_dirvec_cpu5_sel10}} & enc_c_vec4_5[2:0] ) |
                           ({3{arb_dirvec_cpu5_sel11}} & enc_c_vec6_7[2:0] ) );

//and_macro cpu5_4bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu5_4bnk_0),
//                        .din0   ({3{arb_dirvec_cpu5_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu5_4bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu5_4bnk_1),
//                        .din0   ({3{arb_dirvec_cpu5_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu5_4bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu5_4bnk_2),
//                        .din0   ({3{arb_dirvec_cpu5_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu5_4bnk_vec3 (width = 3)
//                        (
//                        .dout   (cpu5_4bnk_3),
//                        .din0   ({3{arb_dirvec_cpu5_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu5_4bnk_vec4 (width = 3, ports=3)
//                        (
//                        .dout   (cpu5_4bnk_4),
//                        .din0   (cpu5_4bnk_0),
//                        .din1   (cpu5_4bnk_1),
//                        .din2   (cpu5_4bnk_2)
//                        );
//
//or_macro cpu5_4bnk_vec5  (width = 3)
//                        (
//                        .dout   (cpu5_4bnk),
//                        .din0   (cpu5_4bnk_4),
//                        .din1   (cpu5_4bnk_3)
//                        );
//// 8 bank :
assign cpu5_8bnk[2:0] = {3{arbadr_ncu_l2t_pm_n}} & enc_c_vec5[2:0];
assign enc_c_vec5_fnl[2:0] = cpu5_4bnk[2:0] | cpu5_8bnk[2:0] | cpu5_2bnk[2:0] ;

//
//and_macro cpu5_8bnk_vec (width = 3)
//                        (
//                        .dout   (cpu5_8bnk),
//                        .din0   ({3{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec5)
//                       );
//
//// final value
//
//or_macro cpu5_vec (width=3, ports=3)
//                        (
//                        .dout   (enc_c_vec5_fnl),
//                        .din0   (cpu5_4bnk),
//                        .din1   (cpu5_8bnk),
//                        .din2   (cpu5_2bnk)
//                        );
//
//
//// CPU 6 
//
//// 2 bank :

assign cpu6_2bnk[2:0] = ( ({3{arb_dirvec_cpu6_selbot}} & enc_c_vec_0_1_2_3[2:0]) |
                          ({3{arb_dirvec_cpu6_seltop}} & enc_c_vec4_5_6_7[2:0]) );


//and_macro cpu6_2bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu6_2bnk_0),
//                        .din0   ({3{arb_dirvec_cpu6_selbot}}),
//                        .din1   (enc_c_vec_0_1_2_3)
//                        );
//and_macro cpu6_2bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu6_2bnk_1),
//                        .din0   ({3{arb_dirvec_cpu6_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu6_2bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu6_2bnk),
//                        .din0   (cpu6_2bnk_0),
//                        .din1   (cpu6_2bnk_1)
//                        );
//
//
//// 4 bank :


assign cpu6_4bnk[2:0] = (  ({3{arb_dirvec_cpu6_sel00}} & enc_c_vec0_1[2:0] ) |
                           ({3{arb_dirvec_cpu6_sel01}} & enc_c_vec2_3[2:0] ) |
                           ({3{arb_dirvec_cpu6_sel10}} & enc_c_vec4_5[2:0] ) |
                           ({3{arb_dirvec_cpu6_sel11}} & enc_c_vec6_7[2:0] ) );


//and_macro cpu6_4bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu6_4bnk_0),
//                        .din0   ({3{arb_dirvec_cpu6_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu6_4bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu6_4bnk_1),
//                        .din0   ({3{arb_dirvec_cpu6_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu6_4bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu6_4bnk_2),
//                        .din0   ({3{arb_dirvec_cpu6_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu6_4bnk_vec3 (width = 3)
//                        (
//                        .dout   (cpu6_4bnk_3),
//                        .din0   ({3{arb_dirvec_cpu6_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu6_4bnk_vec4 (width = 3, ports=3)
//                        (
//                        .dout   (cpu6_4bnk_4),
//                        .din0   (cpu6_4bnk_0),
//                        .din1   (cpu6_4bnk_1),
//                        .din2   (cpu6_4bnk_2)
//                        );
//
//or_macro cpu6_4bnk_vec5  (width = 3)
//                        (
//                        .dout   (cpu6_4bnk),
//                        .din0   (cpu6_4bnk_4),
//                        .din1   (cpu6_4bnk_3)
//                        );
//// 8 bank :

assign cpu6_8bnk[2:0] = {3{arbadr_ncu_l2t_pm_n}} & enc_c_vec6[2:0];
assign enc_c_vec6_fnl[2:0] = cpu6_4bnk[2:0] | cpu6_8bnk[2:0] | cpu6_2bnk[2:0] ;


//
//and_macro cpu6_8bnk_vec (width = 3)
//                        (
//                        .dout   (cpu6_8bnk),
//                        .din0   ({3{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec6)
//                       );
//
//// final value
//
//or_macro cpu6_vec (width=3, ports=3)
//                        (
//                        .dout   (enc_c_vec6_fnl),
//                        .din0   (cpu6_4bnk),
//                        .din1   (cpu6_8bnk),
//                        .din2   (cpu6_2bnk)
//                        );
//
//
//// CPU 7 
//
//// 2 bank :
assign cpu7_2bnk[2:0] = ( ({3{arb_dirvec_cpu7_selbot}} & enc_c_vec_0_1_2_3[2:0]) |
                          ({3{arb_dirvec_cpu7_seltop}} & enc_c_vec4_5_6_7[2:0]) );



assign cpu7_4bnk[2:0] = (  ({3{arb_dirvec_cpu7_sel00}} & enc_c_vec0_1[2:0] ) |
                           ({3{arb_dirvec_cpu7_sel01}} & enc_c_vec2_3[2:0] ) |
                           ({3{arb_dirvec_cpu7_sel10}} & enc_c_vec4_5[2:0] ) |
                           ({3{arb_dirvec_cpu7_sel11}} & enc_c_vec6_7[2:0] ) );


assign cpu7_8bnk[2:0] = {3{arbadr_ncu_l2t_pm_n}} & enc_c_vec7[2:0];


assign enc_c_vec7_fnl[2:0] = cpu7_4bnk[2:0] | cpu7_8bnk[2:0] | cpu7_2bnk[2:0] ;

//and_macro cpu7_2bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu7_2bnk_0),
//                        .din0   ({3{arb_dirvec_cpu7_selbot}}),
//                        .din1   (enc_c_vec_0_1_2_3)
//                        );
//and_macro cpu7_2bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu7_2bnk_1),
//                        .din0   ({3{arb_dirvec_cpu7_seltop}}),
//                        .din1   (enc_c_vec4_5_6_7)
//                        );
//or_macro cpu7_2bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu7_2bnk),
//                        .din0   (cpu7_2bnk_0),
//                        .din1   (cpu7_2bnk_1)
//                        );
//
//
//// 4 bank :
//and_macro cpu7_4bnk_vec0 (width = 3)
//                        (
//                        .dout   (cpu7_4bnk_0),
//                        .din0   ({3{arb_dirvec_cpu7_sel00}}),
//                        .din1   (enc_c_vec0_1)
//                        );
//and_macro cpu7_4bnk_vec1 (width = 3)
//                        (
//                        .dout   (cpu7_4bnk_1),
//                        .din0   ({3{arb_dirvec_cpu7_sel01}}),
//                        .din1   (enc_c_vec2_3)
//                        );
//
//and_macro cpu7_4bnk_vec2 (width = 3)
//                        (
//                        .dout   (cpu7_4bnk_2),
//                        .din0   ({3{arb_dirvec_cpu7_sel10}}),
//                        .din1   (enc_c_vec4_5)
//                        );
//
//and_macro cpu7_4bnk_vec3 (width = 3)
//                        (
//                        .dout   (cpu7_4bnk_3),
//                        .din0   ({3{arb_dirvec_cpu7_sel11}}),
//                        .din1   (enc_c_vec6_7)
//                        );
//
//
//or_macro cpu7_4bnk_vec4 (width = 3, ports=3)
//                        (
//                        .dout   (cpu7_4bnk_4),
//                        .din0   (cpu7_4bnk_0),
//                        .din1   (cpu7_4bnk_1),
//                        .din2   (cpu7_4bnk_2)
//                        );
//
//or_macro cpu7_4bnk_vec5  (width = 3)
//                        (
//                        .dout   (cpu7_4bnk),
//                        .din0   (cpu7_4bnk_4),
//                        .din1   (cpu7_4bnk_3)
//                        );
//// 8 bank :
//
//and_macro cpu7_8bnk_vec (width = 3)
//                        (
//                        .dout   (cpu7_8bnk),
//                        .din0   ({3{arbadr_ncu_l2t_pm_n}}),
//                        .din1   (enc_c_vec7)
//                       );
//
//// final value
//
//or_macro cpu7_vec (width=3, ports=3)
//                        (
//                        .dout   (enc_c_vec7_fnl),
//                        .din0   (cpu7_4bnk),
//                        .din1   (cpu7_8bnk),
//                        .din2   (cpu7_2bnk)
//                        );
//

endmodule






// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_msff_ctl_macro__width_1 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module l2t_dirvec_ctl_spare_ctl_macro__num_10 (
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
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;


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

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));
assign scan_out = so_9;



endmodule






// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_msff_ctl_macro__en_1__width_8 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_msff_ctl_macro__width_3 (
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

module l2t_dirvec_ctl_msff_ctl_macro__width_39 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [38:0] fdin;
wire [37:0] so;

  input [38:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [38:0] dout;
  output scan_out;
assign fdin[38:0] = din[38:0];






dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_l1clkhdr_ctl_macro (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_24 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [23:0] din0;
  input sel0;
  input [23:0] din1;
  input sel1;
  output [23:0] dout;





assign dout[23:0] = ( {24{sel0}} & din0[23:0] ) |
                       ( {24{sel1}} & din1[23:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_msff_ctl_macro__width_24 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = din[23:0];






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_14 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [13:0] din0;
  input sel0;
  input [13:0] din1;
  input sel1;
  output [13:0] dout;





assign dout[13:0] = ( {14{sel0}} & din0[13:0] ) |
                       ( {14{sel1}} & din1[13:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_msff_ctl_macro__width_4 (
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













// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_dirvec_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule








