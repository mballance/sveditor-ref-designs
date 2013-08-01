// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_clk_gl_cust.v
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
`define FLOP_STAGES_ON

module n2_clk_gl_cust(

	cmp_gclk_c1_ccu , cmp_gclk_c2_ccx_left , cmp_gclk_c2_ccx_right ,
	cmp_gclk_c3_db0 , cmp_gclk_c1_db1 , cmp_gclk_c3_dmu ,
	cmp_gclk_c1_efu , cmp_gclk_c3_l2b0 , cmp_gclk_c3_l2b1 ,
	cmp_gclk_c3_l2b2 , cmp_gclk_c3_l2b3 , cmp_gclk_c1_l2b4 ,
	cmp_gclk_c1_l2b5 , cmp_gclk_c1_l2b6 , cmp_gclk_c1_l2b7 ,
	cmp_gclk_c3_l2d0 , cmp_gclk_c3_l2d1 , cmp_gclk_c3_l2d2 ,
	cmp_gclk_c3_l2d3 , cmp_gclk_c1_l2d4 , cmp_gclk_c1_l2d5 ,
	cmp_gclk_c1_l2d6 , cmp_gclk_c1_l2d7 , cmp_gclk_c3_l2t0 ,
	cmp_gclk_c3_l2t2 , cmp_gclk_c1_l2t4 , cmp_gclk_c1_l2t6 ,
	cmp_gclk_c2_l2t1 , cmp_gclk_c2_l2t3 , cmp_gclk_c2_l2t5 ,
	cmp_gclk_c2_l2t7 , cmp_gclk_c4_mcu0 , cmp_gclk_c4_mcu1 ,
	cmp_gclk_c0_mcu2 , cmp_gclk_c0_mcu3 , dr_gclk_c4_mcu0 ,
	dr_gclk_c4_mcu1 , dr_gclk_c0_mcu2 , dr_gclk_c0_mcu3 ,
	cmp_gclk_c1_mio , cmp_gclk_c3_mio , cmp_gclk_c2_mio_left ,
	cmp_gclk_c2_mio_right , cmp_gclk_c3_ncu , cmp_gclk_c3_peu ,
	// cmp_gclk_c1_rst , 
	cmp_gclk_c3_sii , cmp_gclk_c1_sio ,
	cmp_gclk_c3_spc0 , cmp_gclk_c3_spc2 , cmp_gclk_c1_spc4 ,
	cmp_gclk_c1_spc6 , cmp_gclk_c2_spc1 , cmp_gclk_c2_spc3 ,
	cmp_gclk_c2_spc5 , cmp_gclk_c2_spc7 , cmp_gclk_c1_tcu ,
	cmp_gclk_c1_mac , cmp_gclk_c0_rdp , cmp_gclk_c0_rtx ,
	cmp_gclk_c0_tds , cmp_gclk_c3_rng, 

	dr_gclk_c4_fsr0_0 , dr_gclk_c4_fsr0_1 , dr_gclk_c4_fsr0_2 , 
	dr_gclk_c4_fsr1_0 , dr_gclk_c4_fsr1_1 , dr_gclk_c4_fsr1_2 ,
	dr_gclk_c4_fsr2_0 , dr_gclk_c4_fsr2_1 , dr_gclk_c4_fsr2_2 , 
	dr_gclk_c4_fsr3_0 , dr_gclk_c4_fsr3_1 , dr_gclk_c4_fsr3_2 , 
	dr_gclk_c0_fsr4_0 , dr_gclk_c0_fsr4_1 , dr_gclk_c0_fsr4_2 ,
	dr_gclk_c0_fsr5_0 , dr_gclk_c0_fsr5_1 , dr_gclk_c0_fsr5_2 , 
	dr_gclk_c0_fsr6_0 , dr_gclk_c0_fsr6_1 , dr_gclk_c0_fsr6_2 , 
	dr_gclk_c2_fsr7_0 , dr_gclk_c2_fsr7_1 , dr_gclk_c2_fsr7_2 ,
	pll_dr_clk , pll_cmp_clk, 

	stg2_mcu0_clk_stop_in_c2t,
	stg2_mcu1_clk_stop_in_c2t,
	stg3_mcu0_clk_stop_out_c2t,
	stg3_mcu1_clk_stop_out_c2t,
	stg2_mcu0_io_clk_stop_in_c2t,
//	stg2_mcu0_dr_clk_stop_in_c2t,
//	stg2_mcu1_dr_clk_stop_in_c2t,
	stg2_mcu1_io_clk_stop_in_c2t,
//	stg3_mcu0_dr_clk_stop_out_c2t,
	stg3_mcu0_io_clk_stop_out_c2t,
//	stg3_mcu1_dr_clk_stop_out_c2t,
	stg3_mcu1_io_clk_stop_out_c2t,

	stg2_io2x_sync_en_in_c2t, stg3_io2x_sync_en_out_c2t,
	ccu_cmp_io_sync_en, ccu_dr_sync_en, ccu_io2x_out,
	ccu_io2x_sync_en, ccu_io_cmp_sync_en, ccu_io_out,
	ccu_vco_aligned, gclk_aligned, gl_ccu_clk_stop,
	gl_ccu_io_clk_stop, gl_ccx_clk_stop, gl_cmp_io_sync_en_c1b,
	gl_cmp_io_sync_en_c1m, gl_cmp_io_sync_en_c1t, gl_cmp_io_sync_en_c2b,
	gl_cmp_io_sync_en_c2t, gl_cmp_io_sync_en_c3b, gl_cmp_io_sync_en_c3t,
	gl_cmp_io_sync_en_c3t0, gl_db0_clk_stop, gl_db1_clk_stop,
	gl_dmu_io_clk_stop, gl_dmu_peu_por_c3b, gl_dmu_peu_wmr_c3b,
	gl_dr_sync_en_c1m, gl_dr_sync_en_c3t, gl_efu_clk_stop,
	gl_efu_io_clk_stop, gl_io2x_out_c1b, gl_io2x_sync_en_c1m,
	gl_io2x_sync_en_c3t, gl_io2x_sync_en_c3t0, gl_io2x_sync_en_c2t,
	gl_io_cmp_sync_en_c1b, gl_io_cmp_sync_en_c1m, gl_io_cmp_sync_en_c1t,
	gl_io_cmp_sync_en_c2b, gl_io_cmp_sync_en_c2t, gl_io_cmp_sync_en_c3b,
	gl_io_cmp_sync_en_c3t, gl_io_cmp_sync_en_c3t0, gl_io_out_c1b,
	gl_io_out_c1m, gl_io_out_c3b, gl_io_out_c3b0, gl_io_out_c3t,
	gl_l2_por_c1t, gl_l2_por_c2b, gl_l2_por_c2t, gl_l2_por_c3b0,
	gl_l2_por_c3t, gl_l2_por_c3t0, gl_l2_wmr_c1b, gl_l2_wmr_c1t,
	gl_l2_wmr_c2b, gl_l2_wmr_c2t, gl_l2_wmr_c3b, gl_l2_wmr_c3t,
	gl_l2_wmr_c3t0, gl_l2b0_clk_stop, gl_l2b1_clk_stop,
	gl_l2b2_clk_stop, gl_l2b3_clk_stop, gl_l2b4_clk_stop,
	gl_l2b5_clk_stop, gl_l2b6_clk_stop, gl_l2b7_clk_stop,
	gl_l2d0_clk_stop, gl_l2d1_clk_stop, gl_l2d2_clk_stop,
	gl_l2d3_clk_stop, gl_l2d4_clk_stop, gl_l2d5_clk_stop,
	gl_l2d6_clk_stop, gl_l2d7_clk_stop, gl_l2t0_clk_stop,
	gl_l2t1_clk_stop, gl_l2t2_clk_stop, gl_l2t3_clk_stop,
	gl_l2t4_clk_stop, gl_l2t5_clk_stop, gl_l2t6_clk_stop,
	gl_l2t7_clk_stop, gl_mac_io_clk_stop, gl_mcu0_clk_stop,
	gl_mcu0_dr_clk_stop, gl_mcu0_io_clk_stop, gl_mcu1_clk_stop,
	gl_mcu1_dr_clk_stop, gl_mcu1_io_clk_stop, gl_mcu2_clk_stop,
	gl_mcu2_dr_clk_stop, gl_mcu2_io_clk_stop, gl_mcu3_clk_stop,
	gl_mcu3_dr_clk_stop, gl_mcu3_io_clk_stop, gl_mio_clk_stop_c1t,
	gl_mio_clk_stop_c2t, gl_mio_clk_stop_c3t, // gl_mio_io2x_sync_en_c1b,
	gl_mio_io2x_sync_en_c1t, gl_ncu_clk_stop, gl_ncu_io_clk_stop,
	gl_peu_io_clk_stop, gl_rdp_io_clk_stop, gl_rst_clk_stop,
	gl_rst_io_clk_stop, gl_rst_l2_por_c1m, gl_rst_l2_wmr_c1m,
	gl_rst_mac_c1b, gl_rst_niu_wmr_c1b, gl_rtx_io_clk_stop,
	gl_sii_clk_stop, gl_sii_io_clk_stop, gl_sio_clk_stop,
	gl_sio_io_clk_stop, gl_spc0_clk_stop, gl_spc1_clk_stop,
	gl_spc2_clk_stop, gl_spc3_clk_stop, gl_spc4_clk_stop,
	gl_spc5_clk_stop, gl_spc6_clk_stop, gl_spc7_clk_stop,
	gl_tds_io_clk_stop, rst_dmu_peu_por_, rst_dmu_peu_wmr_,
	rst_l2_por_, rst_l2_wmr_, rst_niu_mac_,
	gl_l2_por_c1b, // for int6.1
	rst_niu_wmr_, stg1_ccx_clk_stop_in_c1b, stg1_ccx_clk_stop_out_c1b,
	stg1_cmp_io_sync_en_in_c1b, stg1_cmp_io_sync_en_in_c1t, stg1_cmp_io_sync_en_out_c1b,
	stg1_cmp_io_sync_en_out_c1t, stg1_db0_clk_stop_in_c1b, stg1_db0_clk_stop_out_c1b,
	stg1_dmu_io_clk_stop_in_c1b, stg1_dmu_io_clk_stop_out_c1b, stg1_dmu_peu_por_in_c1b,
	stg1_dmu_peu_por_out_c1b, stg1_dmu_peu_wmr_in_c1b, stg1_dmu_peu_wmr_out_c1b,
	stg1_dr_sync_en_in_c1t, stg1_dr_sync_en_out_c1t, stg1_io2x_out_in_c1b,
	stg1_io2x_out_out_c1b, stg1_io2x_sync_en_out_c1b, stg1_io2x_sync_en_out_c1t,
	stg1_io_cmp_sync_en_in_c1b, stg1_io_cmp_sync_en_in_c1t, stg1_io_cmp_sync_en_out_c1b,
	stg1_io_cmp_sync_en_out_c1t, stg1_io_out_in_c1b, stg1_io_out_in_c1t,
	stg1_io_out_out_c1b, stg1_io_out_out_c1t, 			stg1_l2_por_in_c1b,
	stg1_l2_por_in_c1t, stg1_l2_wmr_in_c1b, stg1_l2_wmr_in_c1t,
	stg1_l2b0_clk_stop_in_c1t, stg1_l2b0_clk_stop_out_c1t, stg1_l2b1_clk_stop_in_c1t,
	stg1_l2b1_clk_stop_out_c1t, stg1_l2b2_clk_stop_in_c1b, stg1_l2b2_clk_stop_out_c1b,
	stg1_l2b3_clk_stop_in_c1b, stg1_l2b3_clk_stop_out_c1b, stg1_l2b4_clk_stop_in_c1t,
	stg1_l2b4_clk_stop_out_c1t, stg1_l2b5_clk_stop_in_c1t, stg1_l2b5_clk_stop_out_c1t,
	stg1_l2d0_clk_stop_in_c1t, stg1_l2d0_clk_stop_out_c1t, stg1_l2d1_clk_stop_in_c1t,
	stg1_l2d1_clk_stop_out_c1t, stg1_l2d2_clk_stop_in_c1b, stg1_l2d2_clk_stop_out_c1b,
	stg1_l2d3_clk_stop_in_c1b, stg1_l2d3_clk_stop_out_c1b, stg1_l2d4_clk_stop_in_c1t,
	stg1_l2d4_clk_stop_out_c1t, stg1_l2d5_clk_stop_in_c1t, stg1_l2d5_clk_stop_out_c1t,
	stg1_l2d7_clk_stop_in_c1b, stg1_l2d7_clk_stop_out_c1b, stg1_l2t0_clk_stop_in_c1t,
	stg1_l2t0_clk_stop_out_c1t, stg1_l2t1_clk_stop_in_c1t, stg1_l2t1_clk_stop_out_c1t,
	stg1_l2t2_clk_stop_in_c1b, stg1_l2t2_clk_stop_out_c1b, stg1_l2t3_clk_stop_in_c1b,
	stg1_l2t3_clk_stop_out_c1b, stg1_l2t5_clk_stop_in_c1t, stg1_l2t5_clk_stop_out_c1t,
	stg1_l2t7_clk_stop_in_c1b, stg1_l2t7_clk_stop_out_c1b, stg1_mac_io_clk_stop_in_c1b,
	stg1_mac_io_clk_stop_out_c1b, stg1_mcu0_clk_stop_in_c1t, stg1_mcu0_clk_stop_out_c1t,
	// stg1_mcu0_dr_clk_stop_in_c1t, 
	stg1_mcu0_dr_clk_stop_out_c1t, 
    stg1_mcu0_io_clk_stop_in_c1t,
	stg1_mcu0_io_clk_stop_out_c1t, stg1_mcu1_clk_stop_in_c1t, stg1_mcu1_clk_stop_out_c1t,
	// stg1_mcu1_dr_clk_stop_in_c1t, 
	stg1_mcu1_dr_clk_stop_out_c1t, 
    stg1_mcu1_io_clk_stop_in_c1t,
	stg1_mcu1_io_clk_stop_out_c1t, stg1_mio_clk_stop_in_c1t, stg1_mio_clk_stop_out_c1t,
	stg1_mio_io2x_sync_en_in_c1t, stg1_ncu_clk_stop_in_c1b, stg1_ncu_clk_stop_out_c1b,
	stg1_ncu_io_clk_stop_in_c1b, stg1_ncu_io_clk_stop_out_c1b, stg1_peu_io_clk_stop_in_c1b,
	stg1_peu_io_clk_stop_out_c1b, stg1_rdp_io_clk_stop_in_c1b, stg1_rdp_io_clk_stop_out_c1b,
	stg1_rst_l2_por_out_c1b, stg1_rst_l2_por_out_c1t, stg1_rst_l2_wmr_out_c1b,
	stg1_rst_l2_wmr_out_c1t, stg1_rst_mac_in_c1b, stg1_rst_niu_mac_out_c1b,
	stg1_rst_niu_wmr_in_c1b, stg1_rst_niu_wmr_out_c1b, stg1_rtx_io_clk_stop_in_c1b,
	stg1_rtx_io_clk_stop_out_c1b, stg1_sii_clk_stop_in_c1b, stg1_sii_clk_stop_out_c1b,
	stg1_sii_io_clk_stop_in_c1b, stg1_sii_io_clk_stop_out_c1b, stg1_spc0_clk_stop_in_c1t,
	stg1_spc0_clk_stop_out_c1t, stg1_spc1_clk_stop_in_c1t, stg1_spc1_clk_stop_out_c1t,
	stg1_spc2_clk_stop_in_c1b, stg1_spc2_clk_stop_out_c1b, stg1_spc3_clk_stop_in_c1b,
	stg1_spc3_clk_stop_out_c1b, stg1_spc4_clk_stop_in_c1t, stg1_spc4_clk_stop_out_c1t,
	stg1_spc5_clk_stop_in_c1t, stg1_spc5_clk_stop_out_c1t, stg1_spc6_clk_stop_in_c1b,
	stg1_spc6_clk_stop_out_c1b, stg1_spc7_clk_stop_in_c1b, stg1_spc7_clk_stop_out_c1b,
	stg1_tds_io_clk_stop_in_c1b, stg1_tds_io_clk_stop_out_c1b, stg2_ccx_clk_stop_in_c2b,
	stg2_ccx_clk_stop_out_c1b, stg2_cmp_io_sync_en_in_c2b, stg2_cmp_io_sync_en_in_c2t,
	stg2_cmp_io_sync_en_out_c1b, stg2_cmp_io_sync_en_out_c1t, stg2_db0_clk_stop_in_c2b,
	stg2_db0_clk_stop_out_c1b, stg2_dmu_io_clk_stop_in_c2b, stg2_dmu_io_clk_stop_out_c1b,
	stg2_dmu_peu_por_in_c2b, stg2_dmu_peu_por_out_c1b, stg2_dmu_peu_wmr_in_c2b,
	stg2_dmu_peu_wmr_out_c1b, stg2_dr_sync_en_in_c2t, stg2_dr_sync_en_out_c1t,
	stg2_io_cmp_sync_en_in_c2b, stg2_io_cmp_sync_en_in_c2t, stg2_io_cmp_sync_en_out_c1b,
	stg2_io_cmp_sync_en_out_c1t, stg2_io_out_in_c2t, stg2_io_out_out_c1t,
	stg2_l2_por_in_c2b, stg2_l2_por_in_c2t, stg2_l2_por_out_c1b,
	stg2_l2_por_out_c1t, stg2_l2_wmr_in_c2b, stg2_l2_wmr_in_c2t,
	stg2_l2_wmr_out_c1b, stg2_l2_wmr_out_c1t, stg2_l2b0_clk_stop_in_c2t,
	stg2_l2b0_clk_stop_out_c1t, stg2_l2b1_clk_stop_in_c2t, stg2_l2b1_clk_stop_out_c1t,
	stg2_l2b2_clk_stop_in_c2b, stg2_l2b2_clk_stop_out_c1b, stg2_l2b3_clk_stop_in_c2b,
	stg2_l2b3_clk_stop_out_c1b, stg2_l2d0_clk_stop_in_c2t, stg2_l2d0_clk_stop_out_c1t,
	stg2_l2d1_clk_stop_in_c2t, stg2_l2d1_clk_stop_out_c1t, stg2_l2d2_clk_stop_in_c2b,
	stg2_l2d2_clk_stop_out_c1b, stg2_l2d3_clk_stop_in_c2b, stg2_l2d3_clk_stop_out_c1b,
	stg2_l2t0_clk_stop_in_c2t, stg2_l2t0_clk_stop_out_c1t, stg2_l2t1_clk_stop_in_c2t,
	stg2_l2t1_clk_stop_out_c1t, stg2_l2t2_clk_stop_in_c2b, stg2_l2t2_clk_stop_out_c1b,
	stg2_l2t3_clk_stop_in_c2bz, stg2_l2t3_clk_stop_out_c1b, stg2_l2t5_clk_stop_in_c2t,
	stg2_l2t5_clk_stop_out_c1t, stg2_l2t7_clk_stop_in_c2b, stg2_l2t7_clk_stop_out_c1b,
	stg2_mcu0_clk_stop_out_c1t, // stg2_mcu0_dr_clk_stop_out_c1t, 
    stg2_mcu0_io_clk_stop_out_c1t,
	stg2_mcu1_clk_stop_out_c1t, // stg2_mcu1_dr_clk_stop_out_c1t, 
    stg2_mcu1_io_clk_stop_out_c1t,
	stg2_io_out_out_c1b,
	stg2_mio_clk_stop_in_c2t, stg2_mio_clk_stop_out_c1t, stg2_mio_io2x_sync_en_in_c2t,
	stg2_mio_io2x_sync_en_out_c1t, stg2_ncu_clk_stop_in_c2b, stg2_ncu_clk_stop_out_c1b,
	stg2_ncu_io_clk_stop_in_c2b, stg2_ncu_io_clk_stop_out_c1b, stg2_peu_io_clk_stop_in_c2b,
	stg2_peu_io_clk_stop_out_c1b, stg2_sii_clk_stop_in_c2b, stg2_sii_clk_stop_out_c1b,
	stg2_sii_io_clk_stop_in_c2b, stg2_sii_io_clk_stop_out_c1b, stg2_spc0_clk_stop_in_c2t,
	stg2_spc0_clk_stop_out_c1t, stg2_spc1_clk_stop_in_c2t, stg2_spc1_clk_stop_out_c1t,
	stg2_spc2_clk_stop_in_c2b, stg2_spc2_clk_stop_out_c1b, stg2_spc3_clk_stop_in_c2b,
	stg2_spc3_clk_stop_out_c1b, stg2_spc5_clk_stop_in_c2t, stg2_spc5_clk_stop_out_c1t,
	stg2_spc7_clk_stop_in_c2b, stg2_spc7_clk_stop_out_c1b, stg3_ccx_clk_stop_in_c2b,
	stg3_ccx_clk_stop_out_c2b, stg3_cmp_io_sync_en_in_c2b, stg3_cmp_io_sync_en_in_c2t,
	stg3_cmp_io_sync_en_in_c3b, stg3_cmp_io_sync_en_in_c3t, stg3_cmp_io_sync_en_out_c2b,
	stg3_cmp_io_sync_en_out_c2t, stg3_db0_clk_stop_in_c3b, stg3_db0_clk_stop_out_c2b,
	stg3_dmu_io_clk_stop_in_c3b, stg3_dmu_io_clk_stop_out_c2b, stg3_dmu_peu_por_in_c3b,
	stg3_dmu_peu_por_out_c2b, stg3_dmu_peu_wmr_in_c3b, stg3_dmu_peu_wmr_out_c2b,
	stg3_dr_sync_en_in_c3t, stg3_dr_sync_en_out_c2t, stg3_io2x_sync_en_in_c2t,
	stg3_io_cmp_sync_en_in_c2b, stg3_io_cmp_sync_en_in_c2t, stg3_io_cmp_sync_en_in_c3b,
	stg3_io_cmp_sync_en_in_c3t, stg3_io_cmp_sync_en_out_c2b, stg3_io_cmp_sync_en_out_c2t,
	stg3_io_out_in_c3b, stg3_io_out_in_c3t, stg3_io_out_out_c2t,
	stg3_l2_por_in_c2b, stg3_l2_por_in_c2t, stg3_l2_por_in_c3b,
	stg3_l2_por_in_c3t, stg3_l2_por_out_c2b, stg3_l2_por_out_c2t,
	stg3_l2_wmr_in_c2b, stg3_l2_wmr_in_c2t, stg3_l2_wmr_in_c3b,
	stg3_l2_wmr_in_c3t, stg3_l2_wmr_out_c2b, stg3_l2_wmr_out_c2t,
	stg3_l2b0_clk_stop_in_c3t, stg3_l2b0_clk_stop_out_c2t, stg3_l2b1_clk_stop_in_c3t,
	stg3_l2b1_clk_stop_out_c2t, stg3_l2b2_clk_stop_in_c3b, stg3_l2b2_clk_stop_out_c2b,
	stg3_l2b3_clk_stop_in_c3b, stg3_l2b3_clk_stop_out_c2b, stg3_l2d0_clk_stop_in_c3t,
	stg3_l2d0_clk_stop_out_c2t, stg3_l2d1_clk_stop_in_c3t, stg3_l2d1_clk_stop_out_c2t,
	stg3_l2d2_clk_stop_in_c3b, stg3_l2d2_clk_stop_out_c2b, stg3_l2d3_clk_stop_in_c3b,
	stg3_l2d3_clk_stop_out_c2b, stg3_l2t0_clk_stop_in_c3t, stg3_l2t0_clk_stop_out_c2t,
	stg3_l2t1_clk_stop_in_c2t, stg3_l2t1_clk_stop_out_c2t, stg3_l2t2_clk_stop_in_c3b,
	stg3_l2t2_clk_stop_out_c2b, stg3_l2t3_clk_stop_in_c2b, stg3_l2t3_clk_stop_out_c2b,
	stg3_l2t5_clk_stop_in_c2t, stg3_l2t5_clk_stop_out_c2t, stg3_l2t7_clk_stop_in_c2b,
	stg3_l2t7_clk_stop_out_c2b, stg3_mcu0_clk_stop_in_c3t, //stg3_mcu0_dr_clk_stop_in_c3t,
	stg3_mcu0_io_clk_stop_in_c3t, stg3_mcu1_clk_stop_in_c3t, //stg3_mcu1_dr_clk_stop_in_c3t,
	stg3_mcu1_io_clk_stop_in_c3t, stg3_mio_clk_stop_in_c2t, stg3_mio_clk_stop_in_c3t,
	stg3_mio_clk_stop_out_c2t, stg3_mio_io2x_sync_en_in_c3t, stg3_mio_io2x_sync_en_out_c2t,
	stg3_ncu_clk_stop_in_c3b, stg3_ncu_clk_stop_out_c2b, stg3_ncu_io_clk_stop_in_c3b,
	stg3_ncu_io_clk_stop_out_c2b, stg3_peu_io_clk_stop_in_c3b,
	stg3_peu_io_clk_stop_out_c2b, stg3_sii_clk_stop_in_c3b, stg3_sii_clk_stop_out_c2b,
	stg3_sii_io_clk_stop_in_c3b, stg3_sii_io_clk_stop_out_c2b, stg3_spc0_clk_stop_in_c3t,
	stg3_spc0_clk_stop_out_c2t, stg3_spc1_clk_stop_in_c2t, 
	stg3_spc1_clk_stop_out_c2t,
	stg3_spc2_clk_stop_in_c3b, stg3_spc2_clk_stop_out_c2b, stg3_spc3_clk_stop_in_c2b,
	stg3_spc3_clk_stop_out_c2b, stg3_spc5_clk_stop_in_c2t, stg3_spc5_clk_stop_out_c2t,
	stg3_spc7_clk_stop_in_c2b, stg3_spc7_clk_stop_out_c2b, stg4_cmp_io_sync_en_in_c3b,
	stg4_cmp_io_sync_en_in_c3t, stg4_cmp_io_sync_en_out_c3b, stg4_cmp_io_sync_en_out_c3t,
	stg4_db0_clk_stop_c3b, stg4_db0_clk_stop_out_c3b, stg4_dmu_io_clk_stop_in_c3b,
	stg4_dmu_io_clk_stop_out_c3b, stg4_dmu_peu_por_in_c3b, stg4_dmu_peu_por_out_c3b,
	stg4_dmu_peu_wmr_in_c3b, stg4_dmu_peu_wmr_out_c3b, stg4_dr_sync_en_in_c3t,
	stg4_dr_sync_en_out_c3t, stg4_io2x_sync_en_c3t, stg4_io2x_sync_en_in_c3t,
	 stg4_io_cmp_sync_en_in_c3b, stg4_io_cmp_sync_en_in_c3t,
	stg4_io_cmp_sync_en_out_c3b, stg4_io_cmp_sync_en_out_c3t, stg4_io_out_in_c3b,
	stg4_io_out_in_c3t, stg4_io_out_out_c3b, stg4_io_out_out_c3t,
	stg4_l2_por_in_c3b, stg4_l2_por_in_c3t, stg4_l2_por_out_c3b,
	stg4_l2_por_out_c3t, stg4_l2_wmr_in_c3b, stg4_l2_wmr_in_c3t,
	stg4_l2_wmr_out_c3b, stg4_l2_wmr_out_c3t, stg4_l2b0_clk_stop_in_c3t,
	stg4_l2b0_clk_stop_out_c3t, stg4_l2b1_clk_stop_in_c3t, stg4_l2b1_clk_stop_out_c3t,
	stg4_l2b2_clk_stop_in_c3b, stg4_l2b2_clk_stop_out_c3b, stg4_l2b3_clk_stop_in_c3b,
	stg4_l2b3_clk_stop_out_c3b, stg4_l2d0_clk_stop_in_c3t, stg4_l2d0_clk_stop_out_c3t,
	stg4_l2d1_clk_stop_in_c3t, stg4_l2d1_clk_stop_out_c3t, stg4_l2d2_clk_stop_in_c3b,
	stg4_l2d2_clk_stop_out_c3b, stg4_l2d3_clk_stop_in_c3b, stg4_l2d3_clk_stop_out_c3b,
	stg4_l2t0_clk_stop_in_c3t, stg4_l2t0_clk_stop_out_c3t, stg4_l2t2_clk_stop_in_c3b,
	stg4_l2t2_clk_stop_out_c3b, stg4_mcu0_clk_stop_in_c3t, stg4_mcu0_clk_stop_out_c3t,
	// stg4_mcu0_dr_clk_stop_in_c3t, stg4_mcu0_dr_clk_stop_out_c3t, 
	stg4_mcu0_io_clk_stop_in_c3t,
	stg4_mcu0_io_clk_stop_out_c3t, stg4_mcu1_clk_stop_in_c3t, stg4_mcu1_clk_stop_out_c3t,
	// stg4_mcu1_dr_clk_stop_in_c3t, stg4_mcu1_dr_clk_stop_out_c3t, 
	stg1_mcu0_dr_clk_stop_in_c2b, stg1_mcu1_dr_clk_stop_in_c2b, 
	stg2_mcu0_dr_clk_stop_in_c4t, stg2_mcu1_dr_clk_stop_in_c4t, 
	stg2_mcu0_dr_clk_stop_out_c2b, stg2_mcu1_dr_clk_stop_out_c2b, 
	stg4_mcu1_io_clk_stop_in_c3t,
	stg4_mcu1_io_clk_stop_out_c3t, stg4_mio_clk_stop_in_c3t, 
	stg4_mio_clk_stop_out_c3t, stg4_mio_io2x_sync_en_out_c3t, stg4_ncu_clk_stop_in_c3b,
	stg4_ncu_clk_stop_out_c3b, stg4_ncu_io_clk_stop_c3b, stg4_ncu_io_clk_stop_out_c3b,
	stg4_peu_io_clk_stop_in_c3b, stg4_peu_io_clk_stop_out_c3b, stg4_sii_clk_stop_in_c3b,
	stg4_sii_clk_stop_out_c3b, stg4_sii_io_clk_stop_in_c3b, stg4_sii_io_clk_stop_out_c3b,
	stg4_spc0_clk_stop_in_c3t, stg4_spc0_clk_stop_out_c3t, // stg4_spc1_clk_stop_out_c2b,
	stg4_spc2_clk_stop_in_c3b, stg4_spc2_clk_stop_out_c3b, // stg4_spc5_clk_stop_out_c2b,
	// for int6.1 (set 3)
	stg1_cmp_io_sync_en_in_c1bg, stg1_cmp_io_sync_en_in_c1tg, stg1_io_cmp_sync_en_in_c1bg,
	stg1_io_cmp_sync_en_in_c1tg, stg1_io_out_in_c1bg, stg1_l2_por_in_c1bg,
	stg1_l2_por_in_c1tg, stg1_l2_wmr_in_c1bg, stg1_l2_wmr_in_c1tg,
	stg1_mio_clk_stop_in_c1tg, stg1_mio_io2x_sync_en_in_c1tg, stg4_cmp_io_sync_en_in_c3t0,
	stg4_io_cmp_sync_en_in_c3t0, stg4_io_out_in_c3b0, stg4_l2_por_in_c3t0,
	stg4_l2_wmr_in_c3t0, 

	tcu_ccu_clk_stop, stg2_io_out_in_c2b, stg3_io_out_out_c2b, 
	tcu_ccu_io_clk_stop, tcu_ccx_clk_stop, tcu_db0_clk_stop,
	tcu_db1_clk_stop, tcu_dmu_io_clk_stop, tcu_efu_clk_stop,
	tcu_efu_io_clk_stop, tcu_l2b0_clk_stop, tcu_l2b1_clk_stop,
	tcu_l2b2_clk_stop, tcu_l2b3_clk_stop, tcu_l2b4_clk_stop,
	tcu_l2b5_clk_stop, tcu_l2b6_clk_stop, tcu_l2b7_clk_stop,
	tcu_l2d0_clk_stop, tcu_l2d1_clk_stop, tcu_l2d2_clk_stop,
	tcu_l2d3_clk_stop, tcu_l2d4_clk_stop, tcu_l2d5_clk_stop,
	tcu_l2d6_clk_stop, tcu_l2d7_clk_stop, tcu_l2t0_clk_stop,
	tcu_l2t1_clk_stop, tcu_l2t2_clk_stop, tcu_l2t3_clk_stop,
	tcu_l2t4_clk_stop, tcu_l2t5_clk_stop, tcu_l2t6_clk_stop,
	tcu_l2t7_clk_stop, tcu_mac_io_clk_stop, tcu_mcu0_clk_stop,
	tcu_mcu0_dr_clk_stop, tcu_mcu0_io_clk_stop, tcu_mcu1_clk_stop,
	tcu_mcu1_dr_clk_stop, tcu_mcu1_io_clk_stop, tcu_mcu2_clk_stop,
	tcu_mcu2_dr_clk_stop, tcu_mcu2_io_clk_stop, tcu_mcu3_clk_stop,
	tcu_mcu3_dr_clk_stop, tcu_mcu3_io_clk_stop, tcu_mio_clk_stop,
	tcu_ncu_clk_stop, tcu_ncu_io_clk_stop, tcu_peu_io_clk_stop,
	tcu_rdp_io_clk_stop, tcu_rst_clk_stop, tcu_rst_io_clk_stop,
	tcu_rtx_io_clk_stop, tcu_sii_clk_stop, tcu_sii_io_clk_stop,
	tcu_sio_clk_stop, tcu_sio_io_clk_stop, tcu_spc0_clk_stop,
	tcu_spc1_clk_stop, tcu_spc2_clk_stop, tcu_spc3_clk_stop,
	tcu_spc4_clk_stop, tcu_spc5_clk_stop, tcu_spc6_clk_stop,
	tcu_spc7_clk_stop, tcu_tds_io_clk_stop



);



 

// only clock nets 
output		cmp_gclk_c1_ccu ;
output		cmp_gclk_c2_ccx_left ;
output		cmp_gclk_c2_ccx_right ;
output		cmp_gclk_c3_db0 ;
output		cmp_gclk_c1_db1 ;
output		cmp_gclk_c3_dmu ;
output		cmp_gclk_c1_efu ;
output		cmp_gclk_c3_l2b0 ;
output		cmp_gclk_c3_l2b1 ;
output		cmp_gclk_c3_l2b2 ;
output		cmp_gclk_c3_l2b3 ;
output		cmp_gclk_c1_l2b4 ;
output		cmp_gclk_c1_l2b5 ;
output		cmp_gclk_c1_l2b6 ;
output		cmp_gclk_c1_l2b7 ;
output		cmp_gclk_c3_l2d0 ;
output		cmp_gclk_c3_l2d1 ;
output		cmp_gclk_c3_l2d2 ;
output		cmp_gclk_c3_l2d3 ;
output		cmp_gclk_c1_l2d4 ;
output		cmp_gclk_c1_l2d5 ;
output		cmp_gclk_c1_l2d6 ;
output		cmp_gclk_c1_l2d7 ;
output		cmp_gclk_c3_l2t0 ;
output		cmp_gclk_c3_l2t2 ;
output		cmp_gclk_c1_l2t4 ;
output		cmp_gclk_c1_l2t6 ;
output		cmp_gclk_c2_l2t1 ;
output		cmp_gclk_c2_l2t3 ;
output		cmp_gclk_c2_l2t5 ;
output		cmp_gclk_c2_l2t7 ;
output		cmp_gclk_c4_mcu0 ;
output		cmp_gclk_c4_mcu1 ;
output		cmp_gclk_c0_mcu2 ;
output		cmp_gclk_c0_mcu3 ;
output		dr_gclk_c4_mcu0 ;
output		dr_gclk_c4_mcu1 ;
output		dr_gclk_c0_mcu2 ;
output		dr_gclk_c0_mcu3 ;
output		cmp_gclk_c1_mio ;
output		cmp_gclk_c3_mio ;
output		cmp_gclk_c2_mio_left ;
output		cmp_gclk_c2_mio_right ;
output		cmp_gclk_c3_ncu ;
output		cmp_gclk_c3_peu ;
// output		cmp_gclk_c1_rst ;
output		cmp_gclk_c3_sii ;
output		cmp_gclk_c1_sio ;
output		cmp_gclk_c3_spc0 ;
output		cmp_gclk_c3_spc2 ;
output		cmp_gclk_c1_spc4 ;
output		cmp_gclk_c1_spc6 ;
output		cmp_gclk_c2_spc1 ;
output		cmp_gclk_c2_spc3 ;
output		cmp_gclk_c2_spc5 ;
output		cmp_gclk_c2_spc7 ;
output		cmp_gclk_c1_tcu ;
output		cmp_gclk_c1_mac ;
output		cmp_gclk_c0_rdp ;
output		cmp_gclk_c0_rtx ;
output		cmp_gclk_c0_tds ;

output		cmp_gclk_c3_rng; 

output		dr_gclk_c4_fsr0_0; 
output		dr_gclk_c4_fsr0_1; 
output		dr_gclk_c4_fsr0_2; 
output		dr_gclk_c4_fsr1_0;
output		dr_gclk_c4_fsr1_1;
output		dr_gclk_c4_fsr1_2;
output		dr_gclk_c4_fsr2_0; 
output		dr_gclk_c4_fsr2_1; 
output		dr_gclk_c4_fsr2_2; 
output		dr_gclk_c4_fsr3_0; 
output		dr_gclk_c4_fsr3_1; 
output		dr_gclk_c4_fsr3_2; 
output		dr_gclk_c0_fsr4_0;
output		dr_gclk_c0_fsr4_1;
output		dr_gclk_c0_fsr4_2;
output		dr_gclk_c0_fsr5_0; 
output		dr_gclk_c0_fsr5_1; 
output		dr_gclk_c0_fsr5_2; 
output		dr_gclk_c0_fsr6_0; 
output		dr_gclk_c0_fsr6_1; 
output		dr_gclk_c0_fsr6_2; 
output		dr_gclk_c2_fsr7_0;
output		dr_gclk_c2_fsr7_1;
output		dr_gclk_c2_fsr7_2;

input		pll_dr_clk ;
input		pll_cmp_clk ;

input 		stg2_io2x_sync_en_in_c2t;
output 		stg3_io2x_sync_en_out_c2t;

input stg2_io_out_in_c2b; 

input		ccu_cmp_io_sync_en ;
input		ccu_dr_sync_en ;
input		ccu_io2x_out ;
input		ccu_io2x_sync_en ;
input		ccu_io_cmp_sync_en ;
input		ccu_io_out ;
input		ccu_vco_aligned ;  

input		rst_dmu_peu_por_ ;
input		rst_dmu_peu_wmr_ ;
input		rst_l2_por_ ;
input		rst_l2_wmr_ ;
input		rst_niu_mac_ ;
input		rst_niu_wmr_ ;

input		stg1_ccx_clk_stop_in_c1b ;
input		stg1_cmp_io_sync_en_in_c1b ;
input		stg1_cmp_io_sync_en_in_c1t;
input		stg1_db0_clk_stop_in_c1b ;
input		stg1_dmu_io_clk_stop_in_c1b ;
input		stg1_dmu_peu_por_in_c1b ;
input		stg1_dmu_peu_wmr_in_c1b ;
input		stg1_dr_sync_en_in_c1t ;
input		stg1_io2x_out_in_c1b ;
input		stg1_io_cmp_sync_en_in_c1b ;
input		stg1_io_cmp_sync_en_in_c1t ;
input		stg1_io_out_in_c1b ;
input		stg1_io_out_in_c1t ;
input		stg1_l2_por_in_c1b ;
input		stg1_l2_por_in_c1t ;
input		stg1_l2_wmr_in_c1b ;
input		stg1_l2_wmr_in_c1t ;
input		stg1_l2b0_clk_stop_in_c1t ;
input		stg1_l2b1_clk_stop_in_c1t ;
input		stg1_l2b2_clk_stop_in_c1b ;
input		stg1_l2b3_clk_stop_in_c1b ;
input		stg1_l2b4_clk_stop_in_c1t ;
input		stg1_l2b5_clk_stop_in_c1t ;
input		stg1_l2d0_clk_stop_in_c1t ;
input		stg1_l2d1_clk_stop_in_c1t ;
input		stg1_l2d2_clk_stop_in_c1b ;
input		stg1_l2d3_clk_stop_in_c1b ;
input		stg1_l2d4_clk_stop_in_c1t ;
input		stg1_l2d5_clk_stop_in_c1t ;
input		stg1_l2d7_clk_stop_in_c1b ;
input		stg1_l2t0_clk_stop_in_c1t ;
input		stg1_l2t1_clk_stop_in_c1t ;
input		stg1_l2t2_clk_stop_in_c1b ;
input		stg1_l2t3_clk_stop_in_c1b ;
input		stg1_l2t5_clk_stop_in_c1t ;
input		stg1_l2t7_clk_stop_in_c1b ;
input		stg1_mac_io_clk_stop_in_c1b ;
input		stg1_mcu0_clk_stop_in_c1t ;
// input		stg1_mcu0_dr_clk_stop_in_c1t ;
input		stg1_mcu0_io_clk_stop_in_c1t ;
input		stg1_mcu1_clk_stop_in_c1t ;
// input		stg1_mcu1_dr_clk_stop_in_c1t ;
input		stg1_mcu1_io_clk_stop_in_c1t ;
input		stg1_mio_clk_stop_in_c1t ;
input		stg1_mio_io2x_sync_en_in_c1t ;
input		stg1_ncu_clk_stop_in_c1b ;
input		stg1_ncu_io_clk_stop_in_c1b ;
input		stg1_peu_io_clk_stop_in_c1b ;
input		stg1_rdp_io_clk_stop_in_c1b ;
input		stg1_rst_mac_in_c1b ;
input		stg1_rst_niu_wmr_in_c1b ;
input		stg1_rtx_io_clk_stop_in_c1b ;
input		stg1_sii_clk_stop_in_c1b ;
input		stg1_sii_io_clk_stop_in_c1b ;
input		stg1_spc0_clk_stop_in_c1t ;
input		stg1_spc1_clk_stop_in_c1t ;
input		stg1_spc2_clk_stop_in_c1b ;
input		stg1_spc3_clk_stop_in_c1b ;
input		stg1_spc4_clk_stop_in_c1t;
input		stg1_spc5_clk_stop_in_c1t ;
input		stg1_spc6_clk_stop_in_c1b;
input		stg1_spc7_clk_stop_in_c1b ;
input		stg1_tds_io_clk_stop_in_c1b ;
input		stg2_ccx_clk_stop_in_c2b ;
input		stg2_cmp_io_sync_en_in_c2b ;
input		stg2_cmp_io_sync_en_in_c2t ;
input		stg2_db0_clk_stop_in_c2b ;
input		stg2_dmu_io_clk_stop_in_c2b ;
input		stg2_dmu_peu_por_in_c2b ;
input		stg2_dmu_peu_wmr_in_c2b ;
input		stg2_dr_sync_en_in_c2t ;
input		stg2_io_cmp_sync_en_in_c2b ;
input		stg2_io_cmp_sync_en_in_c2t ;
input		stg2_io_out_in_c2t ;
input		stg2_l2_por_in_c2b ;
input		stg2_l2_por_in_c2t ;
input		stg2_l2_wmr_in_c2b ;
input		stg2_l2_wmr_in_c2t ;
input		stg2_l2b0_clk_stop_in_c2t ;
input		stg2_l2b1_clk_stop_in_c2t ;
input		stg2_l2b2_clk_stop_in_c2b ;
input		stg2_l2b3_clk_stop_in_c2b ;
input		stg2_l2d0_clk_stop_in_c2t ;
input		stg2_l2d1_clk_stop_in_c2t ;
input		stg2_l2d2_clk_stop_in_c2b ;
input		stg2_l2d3_clk_stop_in_c2b ;
input		stg2_l2t0_clk_stop_in_c2t ;
input		stg2_l2t1_clk_stop_in_c2t ;
input		stg2_l2t2_clk_stop_in_c2b ;
input		stg2_l2t3_clk_stop_in_c2bz ;
input		stg2_l2t5_clk_stop_in_c2t ;
input		stg2_l2t7_clk_stop_in_c2b ;
input		stg2_mio_clk_stop_in_c2t ; 
input		stg2_mio_io2x_sync_en_in_c2t ;
input		stg2_ncu_clk_stop_in_c2b ;
input		stg2_ncu_io_clk_stop_in_c2b ;
input		stg2_peu_io_clk_stop_in_c2b ;
input		stg2_sii_clk_stop_in_c2b ;
input		stg2_sii_io_clk_stop_in_c2b ;
input		stg2_spc0_clk_stop_in_c2t ;
input		stg2_spc1_clk_stop_in_c2t ;
input		stg2_spc2_clk_stop_in_c2b ;
input		stg2_spc3_clk_stop_in_c2b ;
input		stg2_spc5_clk_stop_in_c2t ;
input		stg2_spc7_clk_stop_in_c2b ;
input		stg3_ccx_clk_stop_in_c2b ;
input		stg3_cmp_io_sync_en_in_c2b ;
input		stg3_cmp_io_sync_en_in_c2t ;
input		stg3_cmp_io_sync_en_in_c3b ;
input		stg3_cmp_io_sync_en_in_c3t ;
input		stg3_db0_clk_stop_in_c3b ;
input		stg3_dmu_io_clk_stop_in_c3b ;
input		stg3_dmu_peu_por_in_c3b ;
input		stg3_dmu_peu_wmr_in_c3b ;
input		stg3_dr_sync_en_in_c3t ;
input		stg3_io2x_sync_en_in_c2t ;
input		stg3_io_cmp_sync_en_in_c2b ;
input		stg3_io_cmp_sync_en_in_c2t ;
input		stg3_io_cmp_sync_en_in_c3b ;
input		stg3_io_cmp_sync_en_in_c3t ;
input		stg3_io_out_in_c3b ;
input		stg3_io_out_in_c3t ;
input		stg3_l2_por_in_c2b ;
input		stg3_l2_por_in_c2t ;
input		stg3_l2_por_in_c3b ;
input		stg3_l2_por_in_c3t ;
input		stg3_l2_wmr_in_c2b ;
input		stg3_l2_wmr_in_c2t ;
input		stg3_l2_wmr_in_c3b ;
input		stg3_l2_wmr_in_c3t ;
input		stg3_l2b0_clk_stop_in_c3t ;
input		stg3_l2b1_clk_stop_in_c3t ;
input		stg3_l2b2_clk_stop_in_c3b ;
input		stg3_l2b3_clk_stop_in_c3b ;
input		stg3_l2d0_clk_stop_in_c3t ;
input		stg3_l2d1_clk_stop_in_c3t ;
input		stg3_l2d2_clk_stop_in_c3b ;
input		stg3_l2d3_clk_stop_in_c3b ;
input		stg3_l2t0_clk_stop_in_c3t ;
input		stg3_l2t1_clk_stop_in_c2t ;
input		stg3_l2t3_clk_stop_in_c2b ;
input		stg3_l2t5_clk_stop_in_c2t ;
input		stg3_l2t7_clk_stop_in_c2b ;
input		stg3_mcu0_clk_stop_in_c3t ;
//input		stg3_mcu0_dr_clk_stop_in_c3t ;
input		stg3_mcu0_io_clk_stop_in_c3t ;
input		stg3_mcu1_clk_stop_in_c3t ;
//input		stg3_mcu1_dr_clk_stop_in_c3t ;
input		stg3_mcu1_io_clk_stop_in_c3t ;
input		stg3_mio_clk_stop_in_c2t ;
input		stg3_mio_clk_stop_in_c3t ;
input		stg3_mio_io2x_sync_en_in_c3t ;
input		stg3_ncu_clk_stop_in_c3b ;
input		stg3_ncu_io_clk_stop_in_c3b ;
input		stg3_peu_io_clk_stop_in_c3b ;
input		stg3_sii_clk_stop_in_c3b ;
input		stg3_sii_io_clk_stop_in_c3b ;
input		stg3_spc0_clk_stop_in_c3t ;
input		stg3_spc1_clk_stop_in_c2t ;
input		stg3_spc2_clk_stop_in_c3b ;
input		stg3_spc3_clk_stop_in_c2b ;
input		stg3_spc5_clk_stop_in_c2t ;
input		stg3_spc7_clk_stop_in_c2b ;
input		stg4_cmp_io_sync_en_in_c3b ;
input		stg4_cmp_io_sync_en_in_c3t ;
input		stg4_db0_clk_stop_c3b ;
input		stg4_dmu_io_clk_stop_in_c3b ;
input		stg4_dmu_peu_por_in_c3b ;
input		stg4_dmu_peu_wmr_in_c3b ;
input		stg4_dr_sync_en_in_c3t ;
//output		stg4_io2x_sync_en_c3t ;//lijuan
input		stg4_io2x_sync_en_c3t ;//lijuan
input		stg4_io2x_sync_en_in_c3t ;
input		stg4_io_cmp_sync_en_in_c3b ;
input		stg4_io_cmp_sync_en_in_c3t ;
input		stg4_io_out_in_c3b ;
input		stg4_io_out_in_c3t ;
input		stg4_l2_por_in_c3b ;
input		stg4_l2_por_in_c3t ;
input		stg4_l2_wmr_in_c3b ;
input		stg4_l2_wmr_in_c3t ;
input		stg4_l2b0_clk_stop_in_c3t ;
input		stg4_l2b1_clk_stop_in_c3t ;
input		stg4_l2b2_clk_stop_in_c3b ;
input		stg4_l2b3_clk_stop_in_c3b ;
input		stg4_l2d0_clk_stop_in_c3t ;
input		stg4_l2d1_clk_stop_in_c3t ;
input		stg4_l2d2_clk_stop_in_c3b ;
input		stg4_l2d3_clk_stop_in_c3b ;
input		stg4_l2t0_clk_stop_in_c3t ;
input		stg4_l2t2_clk_stop_in_c3b ;
input		stg4_mcu0_clk_stop_in_c3t ;
// input		stg4_mcu0_dr_clk_stop_in_c3t ;
input		stg4_mcu0_io_clk_stop_in_c3t ;
input		stg4_mcu1_clk_stop_in_c3t ;
// input		stg4_mcu1_dr_clk_stop_in_c3t ;
input		stg4_mcu1_io_clk_stop_in_c3t ;
input		stg4_mio_clk_stop_in_c3t ;
input		stg4_ncu_clk_stop_in_c3b ;
input		stg4_ncu_io_clk_stop_c3b ;
input		stg4_peu_io_clk_stop_in_c3b ;
input		stg4_sii_clk_stop_in_c3b ;
input		stg4_sii_io_clk_stop_in_c3b ;
input		stg4_spc0_clk_stop_in_c3t ;
input		stg4_spc2_clk_stop_in_c3b ;
input		tcu_ccu_clk_stop ;
input		tcu_ccu_io_clk_stop ;
input		tcu_ccx_clk_stop ;
input		tcu_db0_clk_stop ;
input		tcu_db1_clk_stop ;
input		tcu_dmu_io_clk_stop ;
input		tcu_efu_clk_stop ;
input		tcu_efu_io_clk_stop ;
input		tcu_l2b0_clk_stop ;
input		tcu_l2b1_clk_stop ;
input		tcu_l2b2_clk_stop ;
input		tcu_l2b3_clk_stop ;
input		tcu_l2b4_clk_stop ;
input		tcu_l2b5_clk_stop ;
input		tcu_l2b6_clk_stop ;
input		tcu_l2b7_clk_stop ;
input		tcu_l2d0_clk_stop ;
input		tcu_l2d1_clk_stop ;
input		tcu_l2d2_clk_stop ;
input		tcu_l2d3_clk_stop ;
input		tcu_l2d4_clk_stop ;
input		tcu_l2d5_clk_stop ;
input		tcu_l2d7_clk_stop ;
input		tcu_l2d6_clk_stop ;
input		tcu_l2t0_clk_stop ;
input		tcu_l2t1_clk_stop ;
input		tcu_l2t2_clk_stop ;
input		tcu_l2t3_clk_stop ;
input		tcu_l2t4_clk_stop ;
input		tcu_l2t5_clk_stop ;
input		tcu_l2t6_clk_stop ;
input		tcu_l2t7_clk_stop ;
input		tcu_mac_io_clk_stop ;
input		tcu_mcu0_clk_stop ;
input		tcu_mcu0_dr_clk_stop ;
input		tcu_mcu0_io_clk_stop ;
input		tcu_mcu1_clk_stop ;
input		tcu_mcu1_dr_clk_stop ;
input		tcu_mcu1_io_clk_stop ;
input		tcu_mcu2_clk_stop ;
input		tcu_mcu2_dr_clk_stop ;
input		tcu_mcu2_io_clk_stop ;
input		tcu_mcu3_clk_stop ;
input		tcu_mcu3_dr_clk_stop ;
input		tcu_mcu3_io_clk_stop ;
input		tcu_mio_clk_stop ;
input		tcu_ncu_clk_stop ;
input		tcu_ncu_io_clk_stop ;
input		tcu_peu_io_clk_stop ;
input		tcu_rdp_io_clk_stop ;
input		tcu_rst_clk_stop ;
input		tcu_rst_io_clk_stop ;
input		tcu_rtx_io_clk_stop ;
input		tcu_sii_clk_stop ;
input		tcu_sii_io_clk_stop ;
input		tcu_sio_clk_stop ;
input		tcu_sio_io_clk_stop ;
input		tcu_spc0_clk_stop ;
input		tcu_spc1_clk_stop ;
input		tcu_spc2_clk_stop ;
input		tcu_spc3_clk_stop ;
input		tcu_spc4_clk_stop ;
input		tcu_spc5_clk_stop ;
input		tcu_spc6_clk_stop ;
input		tcu_spc7_clk_stop ;
input		tcu_tds_io_clk_stop ;
input 		stg3_l2t2_clk_stop_in_c3b ;

input		stg2_mcu0_clk_stop_in_c2t;
input		stg2_mcu1_clk_stop_in_c2t;

input		stg2_mcu0_io_clk_stop_in_c2t;
// input		stg2_mcu0_dr_clk_stop_in_c2t;
// input		stg2_mcu1_dr_clk_stop_in_c2t;
input		stg2_mcu1_io_clk_stop_in_c2t;

input 		stg1_mcu0_dr_clk_stop_in_c2b; 
input 		stg1_mcu1_dr_clk_stop_in_c2b; 
input 		stg2_mcu0_dr_clk_stop_in_c4t; 
input 		stg2_mcu1_dr_clk_stop_in_c4t; 

// for int6.1 (set 3)
input    stg1_cmp_io_sync_en_in_c1bg;
input    stg1_cmp_io_sync_en_in_c1tg;
input    stg1_io_cmp_sync_en_in_c1bg;
input    stg1_io_cmp_sync_en_in_c1tg;
input    stg1_io_out_in_c1bg;
input    stg1_l2_por_in_c1bg;
input    stg1_l2_por_in_c1tg;
input    stg1_l2_wmr_in_c1bg;
input    stg1_l2_wmr_in_c1tg;
input    stg1_mio_clk_stop_in_c1tg;
input    stg1_mio_io2x_sync_en_in_c1tg;
input    stg4_cmp_io_sync_en_in_c3t0;
input    stg4_io_cmp_sync_en_in_c3t0;
input    stg4_io_out_in_c3b0;
input    stg4_l2_por_in_c3t0;
input    stg4_l2_wmr_in_c3t0;

output 		stg3_io_out_out_c2b; 
output 		stg2_mcu0_dr_clk_stop_out_c2b; 
output 		stg2_mcu1_dr_clk_stop_out_c2b; 

//output		stg3_mcu0_dr_clk_stop_out_c2t;
output		stg3_mcu0_io_clk_stop_out_c2t;
//output		stg3_mcu1_dr_clk_stop_out_c2t;
output		stg3_mcu1_io_clk_stop_out_c2t;

output		stg3_mcu0_clk_stop_out_c2t;
output		stg3_mcu1_clk_stop_out_c2t;

output		gl_ccu_clk_stop ;
output		gl_ccu_io_clk_stop ;
output		gl_ccx_clk_stop ;
output		gl_cmp_io_sync_en_c1b ;
output		gl_cmp_io_sync_en_c1m ;
output		gl_cmp_io_sync_en_c1t ;
output		gl_cmp_io_sync_en_c2b ;
output		gl_cmp_io_sync_en_c2t ;
output		gl_cmp_io_sync_en_c3b ;
output		gl_cmp_io_sync_en_c3t ;
output		gl_cmp_io_sync_en_c3t0 ;
output		gl_db0_clk_stop ;
output		gl_db1_clk_stop ;
output		gl_dmu_io_clk_stop ;
output		gl_dmu_peu_por_c3b ;
output		gl_dmu_peu_wmr_c3b ;
output		gl_dr_sync_en_c1m ;
output		gl_dr_sync_en_c3t ;
output		gl_efu_clk_stop ;
output		gl_efu_io_clk_stop ;
output		gl_io2x_out_c1b ;
output		gl_io2x_sync_en_c1m ;
output		gl_io2x_sync_en_c3t ;
output		gl_io2x_sync_en_c3t0 ;
output		gl_io2x_sync_en_c2t ;
output		gl_io_cmp_sync_en_c1b ;
output		gl_io_cmp_sync_en_c1m ;
output		gl_io_cmp_sync_en_c1t ;
output		gl_io_cmp_sync_en_c2b ;
output		gl_io_cmp_sync_en_c2t ;
output		gl_io_cmp_sync_en_c3b ;
output		gl_io_cmp_sync_en_c3t ;
output		gl_io_cmp_sync_en_c3t0 ;
output		gl_io_out_c1b ;
output		gl_io_out_c1m ;
output		gl_io_out_c3b ;
output		gl_io_out_c3b0 ;
output		gl_io_out_c3t ;
output		gl_l2_por_c1t ;
output		gl_l2_por_c1b ; // for int6.1
output		gl_l2_por_c2b ;
output		gl_l2_por_c2t ;
output		gl_l2_por_c3b0 ;
output		gl_l2_por_c3t ;
output		gl_l2_por_c3t0 ;
output		gl_l2_wmr_c1b ;
output		gl_l2_wmr_c1t ;
output		gl_l2_wmr_c2b ;
output		gl_l2_wmr_c2t ;
output		gl_l2_wmr_c3b ;
output		gl_l2_wmr_c3t ;
output		gl_l2_wmr_c3t0 ;
output		gl_l2b0_clk_stop ;
output		gl_l2b1_clk_stop ;
output		gl_l2b2_clk_stop ;
output		gl_l2b3_clk_stop ;
output		gl_l2b4_clk_stop ;
output		gl_l2b5_clk_stop ;
output		gl_l2b6_clk_stop ;
output		gl_l2b7_clk_stop ;
output		gl_l2d0_clk_stop ;
output		gl_l2d1_clk_stop ;
output		gl_l2d2_clk_stop ;
output		gl_l2d3_clk_stop ;
output		gl_l2d4_clk_stop ;
output		gl_l2d5_clk_stop ;
output		gl_l2d7_clk_stop ;
output		gl_l2d6_clk_stop ;
output		gl_l2t0_clk_stop ;
output		gl_l2t1_clk_stop ;
output		gl_l2t2_clk_stop ;
output		gl_l2t3_clk_stop ;
output		gl_l2t4_clk_stop ;
output		gl_l2t5_clk_stop ;
output		gl_l2t6_clk_stop ;
output		gl_l2t7_clk_stop ;
output		gl_mac_io_clk_stop ;
output		gl_mcu0_clk_stop ;
output		gl_mcu0_dr_clk_stop ;
output		gl_mcu0_io_clk_stop ;
output		gl_mcu1_clk_stop ;
output		gl_mcu1_dr_clk_stop ;
output		gl_mcu1_io_clk_stop ;
output		gl_mcu2_clk_stop ;
output		gl_mcu2_dr_clk_stop ;
output		gl_mcu2_io_clk_stop ;
output		gl_mcu3_clk_stop ;
output		gl_mcu3_dr_clk_stop ;
output		gl_mcu3_io_clk_stop ;
output		gl_mio_clk_stop_c1t ;
output		gl_mio_clk_stop_c2t ;
output		gl_mio_clk_stop_c3t ;
// output		gl_mio_io2x_sync_en_c1b ;
output		gl_mio_io2x_sync_en_c1t ;
output		gl_ncu_clk_stop ;
output		gl_ncu_io_clk_stop ;
output		gl_peu_io_clk_stop ;
output		gl_rdp_io_clk_stop ;
output		gl_rst_clk_stop ;
output		gl_rst_io_clk_stop ;
output		gl_rst_l2_por_c1m ;
output		gl_rst_l2_wmr_c1m ;
output		gl_rst_mac_c1b ;
output		gl_rst_niu_wmr_c1b ;
output		gl_rtx_io_clk_stop ;
output		gl_sii_clk_stop ;
output		gl_sii_io_clk_stop ;
output		gl_sio_clk_stop ;
output		gl_sio_io_clk_stop ;
output		gl_spc0_clk_stop ;
output		gl_spc1_clk_stop ;
output		gl_spc2_clk_stop ;
output		gl_spc3_clk_stop ;
output		gl_spc4_clk_stop ;
output		gl_spc5_clk_stop ;
output		gl_spc6_clk_stop ;
output		gl_spc7_clk_stop ;
output		gl_tds_io_clk_stop ;
output		stg1_ccx_clk_stop_out_c1b ;
output		stg1_cmp_io_sync_en_out_c1b ;
output		stg1_cmp_io_sync_en_out_c1t ;
output		stg1_db0_clk_stop_out_c1b ;
output		stg1_dmu_io_clk_stop_out_c1b ;
output		stg1_dmu_peu_por_out_c1b ;
output		stg1_dmu_peu_wmr_out_c1b ;
output		stg1_dr_sync_en_out_c1t ;
output		stg1_io2x_out_out_c1b ;
output		stg1_io2x_sync_en_out_c1b ;
output		stg1_io2x_sync_en_out_c1t ;
output		stg1_io_cmp_sync_en_out_c1b ;
output		stg1_io_cmp_sync_en_out_c1t ;
output		stg1_io_out_out_c1b ;
output		stg1_io_out_out_c1t ;
output		stg1_l2b0_clk_stop_out_c1t ;
output		stg1_l2b1_clk_stop_out_c1t ;
output		stg1_l2b2_clk_stop_out_c1b ;
output		stg1_l2b3_clk_stop_out_c1b ;
output		stg1_l2b4_clk_stop_out_c1t ;
output		stg1_l2b5_clk_stop_out_c1t ;
output		stg1_l2d0_clk_stop_out_c1t ;
output		stg1_l2d1_clk_stop_out_c1t ;
output		stg1_l2d2_clk_stop_out_c1b ;
output		stg1_l2d3_clk_stop_out_c1b ;
output		stg1_l2d4_clk_stop_out_c1t ;
output		stg1_l2d5_clk_stop_out_c1t ;
output		stg1_l2d7_clk_stop_out_c1b ;
output		stg1_l2t0_clk_stop_out_c1t ;
output		stg1_l2t1_clk_stop_out_c1t ;
output		stg1_l2t2_clk_stop_out_c1b ;
output		stg1_l2t3_clk_stop_out_c1b ;
output		stg1_l2t5_clk_stop_out_c1t ;
output		stg1_l2t7_clk_stop_out_c1b ;
output		stg1_mac_io_clk_stop_out_c1b ;
output		stg1_mcu0_clk_stop_out_c1t ;
output		stg1_mcu0_dr_clk_stop_out_c1t ;
output		stg1_mcu0_io_clk_stop_out_c1t ;
output		stg1_mcu1_clk_stop_out_c1t ;
output		stg1_mcu1_dr_clk_stop_out_c1t ;
output		stg1_mcu1_io_clk_stop_out_c1t ;
output		stg1_mio_clk_stop_out_c1t ;
output		stg1_ncu_clk_stop_out_c1b ;
output		stg1_ncu_io_clk_stop_out_c1b ;
output		stg1_peu_io_clk_stop_out_c1b ;
output		stg1_rdp_io_clk_stop_out_c1b ;
output		stg1_rst_l2_por_out_c1b ;
output		stg1_rst_l2_por_out_c1t ;
output		stg1_rst_l2_wmr_out_c1b ;
output		stg1_rst_l2_wmr_out_c1t ;
output		stg1_rst_niu_mac_out_c1b ;
output		stg1_rst_niu_wmr_out_c1b ;
output		stg1_rtx_io_clk_stop_out_c1b ;
output		stg1_sii_clk_stop_out_c1b ;
output		stg1_sii_io_clk_stop_out_c1b ;
output		stg1_spc0_clk_stop_out_c1t ;
output		stg1_spc1_clk_stop_out_c1t ;
output		stg1_spc2_clk_stop_out_c1b ;
output		stg1_spc3_clk_stop_out_c1b ;
output		stg1_spc4_clk_stop_out_c1t ;
output		stg1_spc5_clk_stop_out_c1t ;
output		stg1_spc6_clk_stop_out_c1b ;
output		stg1_spc7_clk_stop_out_c1b ;
output		stg1_tds_io_clk_stop_out_c1b ;
output		stg2_ccx_clk_stop_out_c1b ;
output		stg2_cmp_io_sync_en_out_c1b ;
output		stg2_cmp_io_sync_en_out_c1t ;
output		stg2_db0_clk_stop_out_c1b ;
output		stg2_dmu_io_clk_stop_out_c1b ;
output		stg2_dmu_peu_por_out_c1b ;
output		stg2_dmu_peu_wmr_out_c1b ;
output		stg2_dr_sync_en_out_c1t ;
output 		stg2_io_out_out_c1b;
output		stg2_io_cmp_sync_en_out_c1b ;
output		stg2_io_cmp_sync_en_out_c1t ;
output		stg2_io_out_out_c1t ;
output		stg2_l2_por_out_c1b ;
output		stg2_l2_por_out_c1t ;
output		stg2_l2_wmr_out_c1b ;
output		stg2_l2_wmr_out_c1t ;
output		stg2_l2b0_clk_stop_out_c1t ;
output		stg2_l2b1_clk_stop_out_c1t ;
output		stg2_l2b2_clk_stop_out_c1b ;
output		stg2_l2b3_clk_stop_out_c1b ;
output		stg2_l2d0_clk_stop_out_c1t ;
output		stg2_l2d1_clk_stop_out_c1t ;
output		stg2_l2d2_clk_stop_out_c1b ;
output		stg2_l2d3_clk_stop_out_c1b ;
output		stg2_l2t0_clk_stop_out_c1t ;
output		stg2_l2t1_clk_stop_out_c1t ;
output		stg2_l2t2_clk_stop_out_c1b ;
output		stg2_l2t3_clk_stop_out_c1b ;
output		stg2_l2t5_clk_stop_out_c1t ;
output		stg2_l2t7_clk_stop_out_c1b ;
output		stg2_mcu0_clk_stop_out_c1t ;
// output		stg2_mcu0_dr_clk_stop_out_c1t ;
output		stg2_mcu0_io_clk_stop_out_c1t ;
output		stg2_mcu1_clk_stop_out_c1t ;
// output		stg2_mcu1_dr_clk_stop_out_c1t ;
output		stg2_mcu1_io_clk_stop_out_c1t ;
output		stg2_mio_clk_stop_out_c1t ;
output		stg2_mio_io2x_sync_en_out_c1t ;
output		stg2_ncu_clk_stop_out_c1b ;
output		stg2_ncu_io_clk_stop_out_c1b ;
output		stg2_peu_io_clk_stop_out_c1b ;
output		stg2_sii_clk_stop_out_c1b ;
output		stg2_sii_io_clk_stop_out_c1b ;
output		stg2_spc0_clk_stop_out_c1t ;
output		stg2_spc1_clk_stop_out_c1t ;
output		stg2_spc2_clk_stop_out_c1b ;
output		stg2_spc3_clk_stop_out_c1b ;
output		stg2_spc5_clk_stop_out_c1t ;
output		stg2_spc7_clk_stop_out_c1b ;
output		stg3_ccx_clk_stop_out_c2b ;
output		stg3_cmp_io_sync_en_out_c2b ;
output		stg3_cmp_io_sync_en_out_c2t ;
output		stg3_db0_clk_stop_out_c2b ;
output		stg3_dmu_io_clk_stop_out_c2b ;
output		stg3_dmu_peu_por_out_c2b ;
output		stg3_dmu_peu_wmr_out_c2b ;
output		stg3_dr_sync_en_out_c2t ;
output		stg3_io_cmp_sync_en_out_c2b ;
output		stg3_io_cmp_sync_en_out_c2t ;
output		stg3_io_out_out_c2t ;
output		stg3_l2_por_out_c2b ;
output		stg3_l2_por_out_c2t ;
output		stg3_l2_wmr_out_c2b ;
output		stg3_l2_wmr_out_c2t ;
output		stg3_l2b0_clk_stop_out_c2t ;
output		stg3_l2b1_clk_stop_out_c2t ;
output		stg3_l2b2_clk_stop_out_c2b ;
output		stg3_l2b3_clk_stop_out_c2b ;
output		stg3_l2d0_clk_stop_out_c2t ;
output		stg3_l2d1_clk_stop_out_c2t ;
output		stg3_l2d2_clk_stop_out_c2b ;
output		stg3_l2d3_clk_stop_out_c2b ;
output		stg3_l2t0_clk_stop_out_c2t ;
output		stg3_l2t1_clk_stop_out_c2t ;
output		stg3_l2t2_clk_stop_out_c2b ;
output		stg3_l2t3_clk_stop_out_c2b ;
output		stg3_l2t5_clk_stop_out_c2t ;
output		stg3_l2t7_clk_stop_out_c2b ;
output		stg3_mio_clk_stop_out_c2t ; 
output		stg3_mio_io2x_sync_en_out_c2t ;
output		stg3_ncu_clk_stop_out_c2b ;
output		stg3_ncu_io_clk_stop_out_c2b ;
output		stg3_peu_io_clk_stop_out_c2b ;
output		stg3_sii_clk_stop_out_c2b ;
output		stg3_sii_io_clk_stop_out_c2b ;
output		stg3_spc0_clk_stop_out_c2t ;
output		stg3_spc1_clk_stop_out_c2t ;
output		stg3_spc2_clk_stop_out_c2b ;
output		stg3_spc3_clk_stop_out_c2b ;
output		stg3_spc5_clk_stop_out_c2t ;
output		stg3_spc7_clk_stop_out_c2b ;
output		stg4_cmp_io_sync_en_out_c3b ;
output		stg4_cmp_io_sync_en_out_c3t ;
output		stg4_db0_clk_stop_out_c3b ;
output		stg4_dmu_io_clk_stop_out_c3b ;
output		stg4_dmu_peu_por_out_c3b ;
output		stg4_dmu_peu_wmr_out_c3b ;
output		stg4_dr_sync_en_out_c3t ;
// output		stg4_io2x_sync_en_out_c2b ;
output		stg4_io_cmp_sync_en_out_c3b ;
output		stg4_io_cmp_sync_en_out_c3t ;
output		stg4_io_out_out_c3b ;
output		stg4_io_out_out_c3t ;
output		stg4_l2_por_out_c3b ;
output		stg4_l2_por_out_c3t ;
output		stg4_l2_wmr_out_c3b ;
output		stg4_l2_wmr_out_c3t ;
output		stg4_l2b0_clk_stop_out_c3t ;
output		stg4_l2b1_clk_stop_out_c3t ;
output		stg4_l2b2_clk_stop_out_c3b ;
output		stg4_l2b3_clk_stop_out_c3b ;
output		stg4_l2d0_clk_stop_out_c3t ;
output		stg4_l2d1_clk_stop_out_c3t ;
output		stg4_l2d2_clk_stop_out_c3b ;
output		stg4_l2d3_clk_stop_out_c3b ;
output		stg4_l2t0_clk_stop_out_c3t ;
output		stg4_mcu0_clk_stop_out_c3t ;
// output		stg4_mcu0_dr_clk_stop_out_c3t ;
output		stg4_mcu0_io_clk_stop_out_c3t ;
output		stg4_mcu1_clk_stop_out_c3t ;
// output		stg4_mcu1_dr_clk_stop_out_c3t ;
output		stg4_mcu1_io_clk_stop_out_c3t ;
output		stg4_mio_clk_stop_out_c3t ;
output		stg4_mio_io2x_sync_en_out_c3t ;
output		stg4_ncu_clk_stop_out_c3b ;
output		stg4_ncu_io_clk_stop_out_c3b ;
output		stg4_peu_io_clk_stop_out_c3b ;
output		stg4_sii_clk_stop_out_c3b ;
output		stg4_sii_io_clk_stop_out_c3b ;
output		stg4_spc0_clk_stop_out_c3t ;
// output		stg4_spc1_clk_stop_out_c2b ;
output		stg4_spc2_clk_stop_out_c3b ;
// output		stg4_spc5_clk_stop_out_c2b ;
output 		gclk_aligned ; 
output 		stg4_l2t2_clk_stop_out_c3b ;

 
 
wire dr_gclk_stg_tcu;
wire dr_gclk_fsr7_stg;



// special aligned signal
// assign gclk_aligned = ccu_vco_aligned ;	


// dr clock tree 
n2_clk_gl_dr_tree gl_dr_clk_buffer (
	.pll_dr_clk (pll_dr_clk), 	
	.dr_gclk_stg_tcu  (dr_gclk_stg_tcu ), 
	.dr_gclk_fsr7_stg (dr_gclk_fsr7_stg), 
	.dr_gclk_c4_mcu0 ( dr_gclk_c4_mcu0 ),
	.dr_gclk_c4_mcu1 ( dr_gclk_c4_mcu1 ),
	.dr_gclk_c0_mcu2 ( dr_gclk_c0_mcu2 ),
	.dr_gclk_c0_mcu3 ( dr_gclk_c0_mcu3 ),
	.dr_gclk_c4_fsr0_0 ( dr_gclk_c4_fsr0_0 ),  
	.dr_gclk_c4_fsr0_1 ( dr_gclk_c4_fsr0_1 ),  
	.dr_gclk_c4_fsr0_2 ( dr_gclk_c4_fsr0_2 ),  
	.dr_gclk_c4_fsr1_0 ( dr_gclk_c4_fsr1_0 ), 
	.dr_gclk_c4_fsr1_1 ( dr_gclk_c4_fsr1_1 ), 
	.dr_gclk_c4_fsr1_2 ( dr_gclk_c4_fsr1_2 ), 
	.dr_gclk_c4_fsr2_0 ( dr_gclk_c4_fsr2_0 ),  
	.dr_gclk_c4_fsr2_1 ( dr_gclk_c4_fsr2_1 ),  
	.dr_gclk_c4_fsr2_2 ( dr_gclk_c4_fsr2_2 ),  
	.dr_gclk_c4_fsr3_0 ( dr_gclk_c4_fsr3_0 ),  
	.dr_gclk_c4_fsr3_1 ( dr_gclk_c4_fsr3_1 ),  
	.dr_gclk_c4_fsr3_2 ( dr_gclk_c4_fsr3_2 ),  
	.dr_gclk_c0_fsr4_0 ( dr_gclk_c0_fsr4_0 ), 
	.dr_gclk_c0_fsr4_1 ( dr_gclk_c0_fsr4_1 ), 
	.dr_gclk_c0_fsr4_2 ( dr_gclk_c0_fsr4_2 ), 
	.dr_gclk_c0_fsr5_0 ( dr_gclk_c0_fsr5_0 ),  
	.dr_gclk_c0_fsr5_1 ( dr_gclk_c0_fsr5_1 ),  
	.dr_gclk_c0_fsr5_2 ( dr_gclk_c0_fsr5_2 ),  
	.dr_gclk_c0_fsr6_0 ( dr_gclk_c0_fsr6_0 ),  
	.dr_gclk_c0_fsr6_1 ( dr_gclk_c0_fsr6_1 ),  
	.dr_gclk_c0_fsr6_2 ( dr_gclk_c0_fsr6_2 ),  
	.dr_gclk_c2_fsr7_0 ( dr_gclk_c2_fsr7_0 ), 
	.dr_gclk_c2_fsr7_1 ( dr_gclk_c2_fsr7_1 ), 
	.dr_gclk_c2_fsr7_2 ( dr_gclk_c2_fsr7_2 )
);


// cmp clock tree 
n2_clk_gl_cmp_tree gl_cmp_clk_buffer (
	.pll_cmp_clk (pll_cmp_clk),
	.cmp_gclk_c1_ccu(cmp_gclk_c1_ccu),
	.cmp_gclk_c3_rng(cmp_gclk_c3_rng),
	.cmp_gclk_c2_ccx_left(cmp_gclk_c2_ccx_left),
	.cmp_gclk_c2_ccx_right(cmp_gclk_c2_ccx_right),
	.cmp_gclk_c3_db0(cmp_gclk_c3_db0),
	.cmp_gclk_c1_db1(cmp_gclk_c1_db1),
	.cmp_gclk_c3_dmu(cmp_gclk_c3_dmu),
	.cmp_gclk_c1_efu(cmp_gclk_c1_efu),
	.cmp_gclk_c3_l2b0(cmp_gclk_c3_l2b0),
	.cmp_gclk_c3_l2b1(cmp_gclk_c3_l2b1),
	.cmp_gclk_c3_l2b2(cmp_gclk_c3_l2b2),
	.cmp_gclk_c3_l2b3(cmp_gclk_c3_l2b3),
	.cmp_gclk_c1_l2b4(cmp_gclk_c1_l2b4),
	.cmp_gclk_c1_l2b5(cmp_gclk_c1_l2b5),
	.cmp_gclk_c1_l2b6(cmp_gclk_c1_l2b6),
	.cmp_gclk_c1_l2b7(cmp_gclk_c1_l2b7),
	.cmp_gclk_c3_l2d0(cmp_gclk_c3_l2d0),
	.cmp_gclk_c3_l2d1(cmp_gclk_c3_l2d1),
	.cmp_gclk_c3_l2d2(cmp_gclk_c3_l2d2),
	.cmp_gclk_c3_l2d3(cmp_gclk_c3_l2d3),
	.cmp_gclk_c1_l2d4(cmp_gclk_c1_l2d4),
	.cmp_gclk_c1_l2d5(cmp_gclk_c1_l2d5),
	.cmp_gclk_c1_l2d6(cmp_gclk_c1_l2d6),
	.cmp_gclk_c1_l2d7(cmp_gclk_c1_l2d7),
	.cmp_gclk_c3_l2t0(cmp_gclk_c3_l2t0),
	.cmp_gclk_c3_l2t2(cmp_gclk_c3_l2t2),
	.cmp_gclk_c1_l2t4(cmp_gclk_c1_l2t4),
	.cmp_gclk_c1_l2t6(cmp_gclk_c1_l2t6),
	.cmp_gclk_c2_l2t1(cmp_gclk_c2_l2t1),
	.cmp_gclk_c2_l2t3(cmp_gclk_c2_l2t3),
	.cmp_gclk_c2_l2t5(cmp_gclk_c2_l2t5),
	.cmp_gclk_c2_l2t7(cmp_gclk_c2_l2t7),
	.cmp_gclk_c4_mcu0(cmp_gclk_c4_mcu0),
	.cmp_gclk_c4_mcu1(cmp_gclk_c4_mcu1),
	.cmp_gclk_c0_mcu2(cmp_gclk_c0_mcu2),
	.cmp_gclk_c0_mcu3(cmp_gclk_c0_mcu3),
	.cmp_gclk_c1_mio(cmp_gclk_c1_mio),
	.cmp_gclk_c3_mio(cmp_gclk_c3_mio),
	.cmp_gclk_c2_mio_left(cmp_gclk_c2_mio_left),
	.cmp_gclk_c2_mio_right(cmp_gclk_c2_mio_right),
	.cmp_gclk_c3_ncu(cmp_gclk_c3_ncu),
	.cmp_gclk_c3_peu(cmp_gclk_c3_peu),
//	.cmp_gclk_c1_rst(cmp_gclk_c1_rst),
	.cmp_gclk_c3_sii(cmp_gclk_c3_sii),
	.cmp_gclk_c1_sio(cmp_gclk_c1_sio),
	.cmp_gclk_c3_spc0(cmp_gclk_c3_spc0),
	.cmp_gclk_c3_spc2(cmp_gclk_c3_spc2),
	.cmp_gclk_c1_spc4(cmp_gclk_c1_spc4),
	.cmp_gclk_c1_spc6(cmp_gclk_c1_spc6),
	.cmp_gclk_c2_spc1(cmp_gclk_c2_spc1),
	.cmp_gclk_c2_spc3(cmp_gclk_c2_spc3),
	.cmp_gclk_c2_spc5(cmp_gclk_c2_spc5),
	.cmp_gclk_c2_spc7(cmp_gclk_c2_spc7),
	.cmp_gclk_c1_tcu(cmp_gclk_c1_tcu),
	.cmp_gclk_c1_mac(cmp_gclk_c1_mac),
	.cmp_gclk_c0_rdp(cmp_gclk_c0_rdp),
	.cmp_gclk_c0_rtx(cmp_gclk_c0_rtx),
	.cmp_gclk_c0_tds(cmp_gclk_c0_tds)
);


// staging flops 
// Using file: n2_clk_gl_cc_stage_top.v
// Searching for module 'n2_clk_gl_cc_stage_top'
n2_clk_gl_cc_stage_top n2_clk_gl_cc_stage_top_inst (
	// for int6.1 (set 3)
	.stg1_cmp_io_sync_en_in_c1bg ( stg1_cmp_io_sync_en_in_c1bg ),
	.stg1_cmp_io_sync_en_in_c1tg ( stg1_cmp_io_sync_en_in_c1tg ),
	.stg1_io_cmp_sync_en_in_c1bg ( stg1_io_cmp_sync_en_in_c1bg ),
	.stg1_io_cmp_sync_en_in_c1tg ( stg1_io_cmp_sync_en_in_c1tg ),
	.stg1_io_out_in_c1bg ( stg1_io_out_in_c1bg ),
	.stg1_l2_por_in_c1bg ( stg1_l2_por_in_c1bg ),
	.stg1_l2_por_in_c1tg ( stg1_l2_por_in_c1tg ),
	.stg1_l2_wmr_in_c1bg ( stg1_l2_wmr_in_c1bg ),
	.stg1_l2_wmr_in_c1tg ( stg1_l2_wmr_in_c1tg ),
	.stg1_mio_clk_stop_in_c1tg ( stg1_mio_clk_stop_in_c1tg ),
	.stg1_mio_io2x_sync_en_in_c1tg ( stg1_mio_io2x_sync_en_in_c1tg ),
	.stg4_cmp_io_sync_en_in_c3t0 ( stg4_cmp_io_sync_en_in_c3t0 ),
	.stg4_io_cmp_sync_en_in_c3t0 ( stg4_io_cmp_sync_en_in_c3t0 ),
	.stg4_io_out_in_c3b0 ( stg4_io_out_in_c3b0 ),
	.stg4_l2_por_in_c3t0 ( stg4_l2_por_in_c3t0 ),
	.stg4_l2_wmr_in_c3t0 ( stg4_l2_wmr_in_c3t0 ),

	.ccu_cmp_io_sync_en ( ccu_cmp_io_sync_en ),
	.ccu_dr_sync_en ( ccu_dr_sync_en ),
	.ccu_io2x_out ( ccu_io2x_out ),
	.ccu_io2x_sync_en ( ccu_io2x_sync_en ),
	.ccu_io_cmp_sync_en ( ccu_io_cmp_sync_en ),
	.ccu_io_out ( ccu_io_out ),
	.ccu_vco_aligned ( ccu_vco_aligned ),
	.dr_gclk_stg_tcu  (dr_gclk_stg_tcu ), 
	.dr_gclk_fsr7_stg (dr_gclk_fsr7_stg), 
	.dr_gclk_c4_mcu1 ( dr_gclk_c4_mcu1 ),
	.gclk_a ( pll_cmp_clk ),
	.gclk_aligned ( gclk_aligned ),
	.gclk_b ( pll_cmp_clk ),
	.gclk_c ( pll_cmp_clk ),
	.gclk_ccu ( pll_cmp_clk ),
	.gclk_dmu ( pll_cmp_clk ),
	.gclk_l2b0 ( pll_cmp_clk ),
	.gclk_l2b4 ( pll_cmp_clk ),
	.gclk_l2b5 ( pll_cmp_clk ),
	.gclk_l2b6 ( pll_cmp_clk ),
	.gclk_l2d2 ( pll_cmp_clk ),
	.gclk_l2d5 ( pll_cmp_clk ),
	.gclk_l2d6 ( pll_cmp_clk ),
	.gclk_l2t0 ( pll_cmp_clk ),
	.gclk_l2t1 ( pll_cmp_clk ),
	.gclk_l2t2 ( pll_cmp_clk ),
	.gclk_l2t3 ( pll_cmp_clk ),
	.gclk_l2t4 ( pll_cmp_clk ),
	.gclk_l2t5 ( pll_cmp_clk ),
	.gclk_l2t6 ( pll_cmp_clk ),
	.gclk_l2t7 ( pll_cmp_clk ),
	.gclk_mac ( pll_cmp_clk ),
	.gclk_ncu ( pll_cmp_clk ),
	.gclk_rst ( pll_cmp_clk ),
	.gclk_spc0 ( pll_cmp_clk ),
	.gclk_spc1 ( pll_cmp_clk ),
	.gclk_spc2 ( pll_cmp_clk ),
	.gclk_spc3 ( pll_cmp_clk ),
	.gclk_spc4 ( pll_cmp_clk ),
	.gclk_spc5 ( pll_cmp_clk ),
	.gclk_spc6 ( pll_cmp_clk ),
	.gclk_spc6s ( pll_cmp_clk ), // for int6.1 (set 3)
	.gclk_spc7 ( pll_cmp_clk ),
	.gclk_tcu ( pll_cmp_clk ),
	.stg1_mcu0_dr_clk_stop_in_c2b (stg1_mcu0_dr_clk_stop_in_c2b), 
	.stg1_mcu1_dr_clk_stop_in_c2b (stg1_mcu1_dr_clk_stop_in_c2b), 
	.stg2_mcu0_dr_clk_stop_in_c4t (stg2_mcu0_dr_clk_stop_in_c4t), 
	.stg2_mcu1_dr_clk_stop_in_c4t (stg2_mcu1_dr_clk_stop_in_c4t), 
	.stg2_mcu0_dr_clk_stop_out_c2b (stg2_mcu0_dr_clk_stop_out_c2b), 
	.stg2_mcu1_dr_clk_stop_out_c2b (stg2_mcu1_dr_clk_stop_out_c2b), 
	.gl_ccu_clk_stop ( gl_ccu_clk_stop ),
	.gl_ccu_io_clk_stop ( gl_ccu_io_clk_stop ),
	.gl_ccx_clk_stop ( gl_ccx_clk_stop ),
	.gl_cmp_io_sync_en_c1b ( gl_cmp_io_sync_en_c1b ),
	.gl_cmp_io_sync_en_c1m ( gl_cmp_io_sync_en_c1m ),
	.gl_cmp_io_sync_en_c1t ( gl_cmp_io_sync_en_c1t ),
	.gl_cmp_io_sync_en_c2b ( gl_cmp_io_sync_en_c2b ),
	.gl_cmp_io_sync_en_c2t ( gl_cmp_io_sync_en_c2t ),
	.gl_cmp_io_sync_en_c3b ( gl_cmp_io_sync_en_c3b ),
	.gl_cmp_io_sync_en_c3t ( gl_cmp_io_sync_en_c3t ),
	.gl_cmp_io_sync_en_c3t0 ( gl_cmp_io_sync_en_c3t0 ),
	.gl_db0_clk_stop ( gl_db0_clk_stop ),
	.gl_db1_clk_stop ( gl_db1_clk_stop ),
	.gl_dmu_io_clk_stop ( gl_dmu_io_clk_stop ),
	.gl_dmu_peu_por_c3b ( gl_dmu_peu_por_c3b ),
	.gl_dmu_peu_wmr_c3b ( gl_dmu_peu_wmr_c3b ),
	.gl_dr_sync_en_c1m ( gl_dr_sync_en_c1m ),
	.gl_dr_sync_en_c3t ( gl_dr_sync_en_c3t ),
	.gl_efu_clk_stop ( gl_efu_clk_stop ),
	.gl_efu_io_clk_stop ( gl_efu_io_clk_stop ),
	.gl_io2x_out_c1b ( gl_io2x_out_c1b ),
	.gl_io2x_sync_en_c1m ( gl_io2x_sync_en_c1m ),
	.gl_io2x_sync_en_c3t ( gl_io2x_sync_en_c3t ),
	.gl_io2x_sync_en_c3t0 ( gl_io2x_sync_en_c3t0 ),
	.gl_io2x_sync_en_c2t ( gl_io2x_sync_en_c2t ),
	.gl_io_cmp_sync_en_c1b ( gl_io_cmp_sync_en_c1b ),
	.gl_io_cmp_sync_en_c1m ( gl_io_cmp_sync_en_c1m ),
	.gl_io_cmp_sync_en_c1t ( gl_io_cmp_sync_en_c1t ),
	.gl_io_cmp_sync_en_c2b ( gl_io_cmp_sync_en_c2b ),
	.gl_io_cmp_sync_en_c2t ( gl_io_cmp_sync_en_c2t ),
	.gl_io_cmp_sync_en_c3b ( gl_io_cmp_sync_en_c3b ),
	.gl_io_cmp_sync_en_c3t ( gl_io_cmp_sync_en_c3t ),
	.gl_io_cmp_sync_en_c3t0 ( gl_io_cmp_sync_en_c3t0 ),
	.gl_io_out_c1b ( gl_io_out_c1b ),
	.gl_io_out_c1m ( gl_io_out_c1m ),
	.gl_io_out_c3b ( gl_io_out_c3b ),
	.gl_io_out_c3b0 ( gl_io_out_c3b0 ),
	.gl_io_out_c3t ( gl_io_out_c3t ),
	.gl_l2_por_c1t ( gl_l2_por_c1t ),
	.gl_l2_por_c1b ( gl_l2_por_c1b ), // for int6.1
	.gl_l2_por_c2b ( gl_l2_por_c2b ),
	.gl_l2_por_c2t ( gl_l2_por_c2t ),
	.gl_l2_por_c3b0 ( gl_l2_por_c3b0 ),
	.gl_l2_por_c3t ( gl_l2_por_c3t ),
	.gl_l2_por_c3t0 ( gl_l2_por_c3t0 ),
	.gl_l2_wmr_c1b ( gl_l2_wmr_c1b ),
	.gl_l2_wmr_c1t ( gl_l2_wmr_c1t ),
	.gl_l2_wmr_c2b ( gl_l2_wmr_c2b ),
	.gl_l2_wmr_c2t ( gl_l2_wmr_c2t ),
	.gl_l2_wmr_c3b ( gl_l2_wmr_c3b ),
	.gl_l2_wmr_c3t ( gl_l2_wmr_c3t ),
	.gl_l2_wmr_c3t0 ( gl_l2_wmr_c3t0 ),
	.gl_l2b0_clk_stop ( gl_l2b0_clk_stop ),
	.gl_l2b1_clk_stop ( gl_l2b1_clk_stop ),
	.gl_l2b2_clk_stop ( gl_l2b2_clk_stop ),
	.gl_l2b3_clk_stop ( gl_l2b3_clk_stop ),
	.gl_l2b4_clk_stop ( gl_l2b4_clk_stop ),
	.gl_l2b5_clk_stop ( gl_l2b5_clk_stop ),
	.gl_l2b6_clk_stop ( gl_l2b6_clk_stop ),
	.gl_l2b7_clk_stop ( gl_l2b7_clk_stop ),
	.gl_l2d0_clk_stop ( gl_l2d0_clk_stop ),
	.gl_l2d1_clk_stop ( gl_l2d1_clk_stop ),
	.gl_l2d2_clk_stop ( gl_l2d2_clk_stop ),
	.gl_l2d3_clk_stop ( gl_l2d3_clk_stop ),
	.gl_l2d4_clk_stop ( gl_l2d4_clk_stop ),
	.gl_l2d5_clk_stop ( gl_l2d5_clk_stop ),
	.gl_l2d7_clk_stop ( gl_l2d7_clk_stop ),
	.gl_l2d6_clk_stop ( gl_l2d6_clk_stop ),
	.gl_l2t0_clk_stop ( gl_l2t0_clk_stop ),
	.gl_l2t1_clk_stop ( gl_l2t1_clk_stop ),
	.gl_l2t2_clk_stop ( gl_l2t2_clk_stop ),
	.gl_l2t3_clk_stop ( gl_l2t3_clk_stop ),
	.gl_l2t4_clk_stop ( gl_l2t4_clk_stop ),
	.gl_l2t5_clk_stop ( gl_l2t5_clk_stop ),
	.gl_l2t6_clk_stop ( gl_l2t6_clk_stop ),
	.gl_l2t7_clk_stop ( gl_l2t7_clk_stop ),
	.gl_mac_io_clk_stop ( gl_mac_io_clk_stop ),
	.gl_mcu0_clk_stop ( gl_mcu0_clk_stop ),
	.gl_mcu0_dr_clk_stop ( gl_mcu0_dr_clk_stop ),
	.gl_mcu0_io_clk_stop ( gl_mcu0_io_clk_stop ),
	.gl_mcu1_clk_stop ( gl_mcu1_clk_stop ),
	.gl_mcu1_dr_clk_stop ( gl_mcu1_dr_clk_stop ),
	.gl_mcu1_io_clk_stop ( gl_mcu1_io_clk_stop ),
	.gl_mcu2_clk_stop ( gl_mcu2_clk_stop ),
	.gl_mcu2_dr_clk_stop ( gl_mcu2_dr_clk_stop ),
	.gl_mcu2_io_clk_stop ( gl_mcu2_io_clk_stop ),
	.gl_mcu3_clk_stop ( gl_mcu3_clk_stop ),
	.gl_mcu3_dr_clk_stop ( gl_mcu3_dr_clk_stop ),
	.gl_mcu3_io_clk_stop ( gl_mcu3_io_clk_stop ),
	.gl_mio_clk_stop_c1t ( gl_mio_clk_stop_c1t ),
	.gl_mio_clk_stop_c2t ( gl_mio_clk_stop_c2t ),
	.gl_mio_clk_stop_c3t ( gl_mio_clk_stop_c3t ),
//	.gl_mio_io2x_sync_en_c1b ( gl_mio_io2x_sync_en_c1b ),
	.gl_mio_io2x_sync_en_c1t ( gl_mio_io2x_sync_en_c1t ),
	.gl_ncu_clk_stop ( gl_ncu_clk_stop ),
	.gl_ncu_io_clk_stop ( gl_ncu_io_clk_stop ),
	.gl_peu_io_clk_stop ( gl_peu_io_clk_stop ),
	.gl_rdp_io_clk_stop ( gl_rdp_io_clk_stop ),
	.gl_rst_clk_stop ( gl_rst_clk_stop ),
	.gl_rst_io_clk_stop ( gl_rst_io_clk_stop ),
	.gl_rst_l2_por_c1m ( gl_rst_l2_por_c1m ),
	.gl_rst_l2_wmr_c1m ( gl_rst_l2_wmr_c1m ),
	.gl_rst_mac_c1b ( gl_rst_mac_c1b ),
	.gl_rst_niu_wmr_c1b ( gl_rst_niu_wmr_c1b ),
	.gl_rtx_io_clk_stop ( gl_rtx_io_clk_stop ),
	.gl_sii_clk_stop ( gl_sii_clk_stop ),
	.gl_sii_io_clk_stop ( gl_sii_io_clk_stop ),
	.gl_sio_clk_stop ( gl_sio_clk_stop ),
	.gl_sio_io_clk_stop ( gl_sio_io_clk_stop ),
	.gl_spc0_clk_stop ( gl_spc0_clk_stop ),
	.gl_spc1_clk_stop ( gl_spc1_clk_stop ),
	.gl_spc2_clk_stop ( gl_spc2_clk_stop ),
	.gl_spc3_clk_stop ( gl_spc3_clk_stop ),
	.gl_spc4_clk_stop ( gl_spc4_clk_stop ),
	.gl_spc5_clk_stop ( gl_spc5_clk_stop ),
	.gl_spc6_clk_stop ( gl_spc6_clk_stop ),
	.gl_spc7_clk_stop ( gl_spc7_clk_stop ),
	.gl_tds_io_clk_stop ( gl_tds_io_clk_stop ),
	.rst_dmu_peu_por_ ( rst_dmu_peu_por_ ),
	.rst_dmu_peu_wmr_ ( rst_dmu_peu_wmr_ ),
	.rst_l2_por_ ( rst_l2_por_ ),
	.rst_l2_wmr_ ( rst_l2_wmr_ ),
	.rst_niu_mac_ ( rst_niu_mac_ ),
	.rst_niu_wmr_ ( rst_niu_wmr_ ),
	.stg1_ccx_clk_stop_in_c1b ( stg1_ccx_clk_stop_in_c1b ),
	.stg1_ccx_clk_stop_out_c1b ( stg1_ccx_clk_stop_out_c1b ),
	.stg1_cmp_io_sync_en_in_c1b ( stg1_cmp_io_sync_en_in_c1b ),
	.stg1_cmp_io_sync_en_in_c1t ( stg1_cmp_io_sync_en_in_c1t ),
	.stg1_cmp_io_sync_en_out_c1b ( stg1_cmp_io_sync_en_out_c1b ),
	.stg1_cmp_io_sync_en_out_c1t ( stg1_cmp_io_sync_en_out_c1t ),
	.stg1_db0_clk_stop_in_c1b ( stg1_db0_clk_stop_in_c1b ),
	.stg1_db0_clk_stop_out_c1b ( stg1_db0_clk_stop_out_c1b ),
	.stg1_dmu_io_clk_stop_in_c1b ( stg1_dmu_io_clk_stop_in_c1b ),
	.stg1_dmu_io_clk_stop_out_c1b ( stg1_dmu_io_clk_stop_out_c1b ),
	.stg1_dmu_peu_por_in_c1b ( stg1_dmu_peu_por_in_c1b ),
	.stg1_dmu_peu_por_out_c1b ( stg1_dmu_peu_por_out_c1b ),
	.stg1_dmu_peu_wmr_in_c1b ( stg1_dmu_peu_wmr_in_c1b ),
	.stg1_dmu_peu_wmr_out_c1b ( stg1_dmu_peu_wmr_out_c1b ),
	.stg1_dr_sync_en_in_c1t ( stg1_dr_sync_en_in_c1t ),
	.stg1_dr_sync_en_out_c1t ( stg1_dr_sync_en_out_c1t ),
	.stg1_io2x_out_in_c1b ( stg1_io2x_out_in_c1b ),
	.stg1_io2x_out_out_c1b ( stg1_io2x_out_out_c1b ),
	.stg1_io2x_sync_en_out_c1b ( stg1_io2x_sync_en_out_c1b ),
	.stg1_io2x_sync_en_out_c1t ( stg1_io2x_sync_en_out_c1t ),
	.stg1_io_cmp_sync_en_in_c1b ( stg1_io_cmp_sync_en_in_c1b ),
	.stg1_io_cmp_sync_en_in_c1t ( stg1_io_cmp_sync_en_in_c1t ),
	.stg1_io_cmp_sync_en_out_c1b ( stg1_io_cmp_sync_en_out_c1b ),
	.stg1_io_cmp_sync_en_out_c1t ( stg1_io_cmp_sync_en_out_c1t ),
	.stg1_io_out_in_c1b ( stg1_io_out_in_c1b ),
	.stg1_io_out_in_c1t ( stg1_io_out_in_c1t ),
	.stg1_io_out_out_c1b ( stg1_io_out_out_c1b ),
	.stg1_io_out_out_c1t ( stg1_io_out_out_c1t ),
	.stg1_l2_por_in_c1b ( stg1_l2_por_in_c1b ),
	.stg1_l2_por_in_c1t ( stg1_l2_por_in_c1t ),
	.stg1_l2_wmr_in_c1b ( stg1_l2_wmr_in_c1b ),
	.stg1_l2_wmr_in_c1t ( stg1_l2_wmr_in_c1t ),
	.stg1_l2b0_clk_stop_in_c1t ( stg1_l2b0_clk_stop_in_c1t ),
	.stg1_l2b0_clk_stop_out_c1t ( stg1_l2b0_clk_stop_out_c1t ),
	.stg1_l2b1_clk_stop_in_c1t ( stg1_l2b1_clk_stop_in_c1t ),
	.stg1_l2b1_clk_stop_out_c1t ( stg1_l2b1_clk_stop_out_c1t ),
	.stg1_l2b2_clk_stop_in_c1b ( stg1_l2b2_clk_stop_in_c1b ),
	.stg1_l2b2_clk_stop_out_c1b ( stg1_l2b2_clk_stop_out_c1b ),
	.stg1_l2b3_clk_stop_in_c1b ( stg1_l2b3_clk_stop_in_c1b ),
	.stg1_l2b3_clk_stop_out_c1b ( stg1_l2b3_clk_stop_out_c1b ),
	.stg1_l2b4_clk_stop_in_c1t ( stg1_l2b4_clk_stop_in_c1t ),
	.stg1_l2b4_clk_stop_out_c1t ( stg1_l2b4_clk_stop_out_c1t ),
	.stg1_l2b5_clk_stop_in_c1t ( stg1_l2b5_clk_stop_in_c1t ),
	.stg1_l2b5_clk_stop_out_c1t ( stg1_l2b5_clk_stop_out_c1t ),
	.stg1_l2d0_clk_stop_in_c1t ( stg1_l2d0_clk_stop_in_c1t ),
	.stg1_l2d0_clk_stop_out_c1t ( stg1_l2d0_clk_stop_out_c1t ),
	.stg1_l2d1_clk_stop_in_c1t ( stg1_l2d1_clk_stop_in_c1t ),
	.stg1_l2d1_clk_stop_out_c1t ( stg1_l2d1_clk_stop_out_c1t ),
	.stg1_l2d2_clk_stop_in_c1b ( stg1_l2d2_clk_stop_in_c1b ),
	.stg1_l2d2_clk_stop_out_c1b ( stg1_l2d2_clk_stop_out_c1b ),
	.stg1_l2d3_clk_stop_in_c1b ( stg1_l2d3_clk_stop_in_c1b ),
	.stg1_l2d3_clk_stop_out_c1b ( stg1_l2d3_clk_stop_out_c1b ),
	.stg1_l2d4_clk_stop_in_c1t ( stg1_l2d4_clk_stop_in_c1t ),
	.stg1_l2d4_clk_stop_out_c1t ( stg1_l2d4_clk_stop_out_c1t ),
	.stg1_l2d5_clk_stop_in_c1t ( stg1_l2d5_clk_stop_in_c1t ),
	.stg1_l2d5_clk_stop_out_c1t ( stg1_l2d5_clk_stop_out_c1t ),
	.stg1_l2d7_clk_stop_in_c1b ( stg1_l2d7_clk_stop_in_c1b ),
	.stg1_l2d7_clk_stop_out_c1b ( stg1_l2d7_clk_stop_out_c1b ),
	.stg1_l2t0_clk_stop_in_c1t ( stg1_l2t0_clk_stop_in_c1t ),
	.stg1_l2t0_clk_stop_out_c1t ( stg1_l2t0_clk_stop_out_c1t ),
	.stg1_l2t1_clk_stop_in_c1t ( stg1_l2t1_clk_stop_in_c1t ),
	.stg1_l2t1_clk_stop_out_c1t ( stg1_l2t1_clk_stop_out_c1t ),
	.stg1_l2t2_clk_stop_in_c1b ( stg1_l2t2_clk_stop_in_c1b ),
	.stg1_l2t2_clk_stop_out_c1b ( stg1_l2t2_clk_stop_out_c1b ),
	.stg1_l2t3_clk_stop_in_c1b ( stg1_l2t3_clk_stop_in_c1b ),
	.stg1_l2t3_clk_stop_out_c1b ( stg1_l2t3_clk_stop_out_c1b ),
	.stg1_l2t5_clk_stop_in_c1t ( stg1_l2t5_clk_stop_in_c1t ),
	.stg1_l2t5_clk_stop_out_c1t ( stg1_l2t5_clk_stop_out_c1t ),
	.stg1_l2t7_clk_stop_in_c1b ( stg1_l2t7_clk_stop_in_c1b ),
	.stg1_l2t7_clk_stop_out_c1b ( stg1_l2t7_clk_stop_out_c1b ),
	.stg1_mac_io_clk_stop_in_c1b ( stg1_mac_io_clk_stop_in_c1b ),
	.stg1_mac_io_clk_stop_out_c1b ( stg1_mac_io_clk_stop_out_c1b ),
	.stg1_mcu0_clk_stop_in_c1t ( stg1_mcu0_clk_stop_in_c1t ),
	.stg1_mcu0_clk_stop_out_c1t ( stg1_mcu0_clk_stop_out_c1t ),
//	.stg1_mcu0_dr_clk_stop_in_c1t ( stg1_mcu0_dr_clk_stop_in_c1t ),
	.stg1_mcu0_dr_clk_stop_out_c1t ( stg1_mcu0_dr_clk_stop_out_c1t ),
	.stg1_mcu0_io_clk_stop_in_c1t ( stg1_mcu0_io_clk_stop_in_c1t ),
	.stg1_mcu0_io_clk_stop_out_c1t ( stg1_mcu0_io_clk_stop_out_c1t ),
	.stg1_mcu1_clk_stop_in_c1t ( stg1_mcu1_clk_stop_in_c1t ),
	.stg1_mcu1_clk_stop_out_c1t ( stg1_mcu1_clk_stop_out_c1t ),
//	.stg1_mcu1_dr_clk_stop_in_c1t ( stg1_mcu1_dr_clk_stop_in_c1t ),
	.stg1_mcu1_dr_clk_stop_out_c1t ( stg1_mcu1_dr_clk_stop_out_c1t ),
	.stg1_mcu1_io_clk_stop_in_c1t ( stg1_mcu1_io_clk_stop_in_c1t ),
	.stg1_mcu1_io_clk_stop_out_c1t ( stg1_mcu1_io_clk_stop_out_c1t ),
	.stg1_mio_clk_stop_in_c1t ( stg1_mio_clk_stop_in_c1t ),
	.stg1_mio_clk_stop_out_c1t ( stg1_mio_clk_stop_out_c1t ),
	.stg1_mio_io2x_sync_en_in_c1t ( stg1_mio_io2x_sync_en_in_c1t ),
	.stg1_ncu_clk_stop_in_c1b ( stg1_ncu_clk_stop_in_c1b ),
	.stg1_ncu_clk_stop_out_c1b ( stg1_ncu_clk_stop_out_c1b ),
	.stg1_ncu_io_clk_stop_in_c1b ( stg1_ncu_io_clk_stop_in_c1b ),
	.stg1_ncu_io_clk_stop_out_c1b ( stg1_ncu_io_clk_stop_out_c1b ),
	.stg1_peu_io_clk_stop_in_c1b ( stg1_peu_io_clk_stop_in_c1b ),
	.stg1_peu_io_clk_stop_out_c1b ( stg1_peu_io_clk_stop_out_c1b ),
	.stg1_rdp_io_clk_stop_in_c1b ( stg1_rdp_io_clk_stop_in_c1b ),
	.stg1_rdp_io_clk_stop_out_c1b ( stg1_rdp_io_clk_stop_out_c1b ),
	.stg1_rst_l2_por_out_c1b ( stg1_rst_l2_por_out_c1b ),
	.stg1_rst_l2_por_out_c1t ( stg1_rst_l2_por_out_c1t ),
	.stg1_rst_l2_wmr_out_c1b ( stg1_rst_l2_wmr_out_c1b ),
	.stg1_rst_l2_wmr_out_c1t ( stg1_rst_l2_wmr_out_c1t ),
	.stg1_rst_mac_in_c1b ( stg1_rst_mac_in_c1b ),
	.stg1_rst_niu_mac_out_c1b ( stg1_rst_niu_mac_out_c1b ),
	.stg1_rst_niu_wmr_in_c1b ( stg1_rst_niu_wmr_in_c1b ),
	.stg1_rst_niu_wmr_out_c1b ( stg1_rst_niu_wmr_out_c1b ),
	.stg1_rtx_io_clk_stop_in_c1b ( stg1_rtx_io_clk_stop_in_c1b ),
	.stg1_rtx_io_clk_stop_out_c1b ( stg1_rtx_io_clk_stop_out_c1b ),
	.stg1_sii_clk_stop_in_c1b ( stg1_sii_clk_stop_in_c1b ),
	.stg1_sii_clk_stop_out_c1b ( stg1_sii_clk_stop_out_c1b ),
	.stg1_sii_io_clk_stop_in_c1b ( stg1_sii_io_clk_stop_in_c1b ),
	.stg1_sii_io_clk_stop_out_c1b ( stg1_sii_io_clk_stop_out_c1b ),
	.stg1_spc0_clk_stop_in_c1t ( stg1_spc0_clk_stop_in_c1t ),
	.stg1_spc0_clk_stop_out_c1t ( stg1_spc0_clk_stop_out_c1t ),
	.stg1_spc1_clk_stop_in_c1t ( stg1_spc1_clk_stop_in_c1t ),
	.stg1_spc1_clk_stop_out_c1t ( stg1_spc1_clk_stop_out_c1t ),
	.stg1_spc2_clk_stop_in_c1b ( stg1_spc2_clk_stop_in_c1b ),
	.stg1_spc2_clk_stop_out_c1b ( stg1_spc2_clk_stop_out_c1b ),
	.stg1_spc3_clk_stop_in_c1b ( stg1_spc3_clk_stop_in_c1b ),
	.stg1_spc3_clk_stop_out_c1b ( stg1_spc3_clk_stop_out_c1b ),
	.stg1_spc4_clk_stop_in_c1t ( stg1_spc4_clk_stop_in_c1t ),
	.stg1_spc4_clk_stop_out_c1t ( stg1_spc4_clk_stop_out_c1t ),
	.stg1_spc5_clk_stop_in_c1t ( stg1_spc5_clk_stop_in_c1t ),
	.stg1_spc5_clk_stop_out_c1t ( stg1_spc5_clk_stop_out_c1t ),
	.stg1_spc6_clk_stop_in_c1b ( stg1_spc6_clk_stop_in_c1b ), // for int6.1 (set 3)
	.stg1_spc6_clk_stop_out_c1b ( stg1_spc6_clk_stop_out_c1b ),
	.stg1_spc7_clk_stop_in_c1b ( stg1_spc7_clk_stop_in_c1b ),
	.stg1_spc7_clk_stop_out_c1b ( stg1_spc7_clk_stop_out_c1b ),
	.stg1_tds_io_clk_stop_in_c1b ( stg1_tds_io_clk_stop_in_c1b ),
	.stg1_tds_io_clk_stop_out_c1b ( stg1_tds_io_clk_stop_out_c1b ),
	.stg2_io_out_out_c1b ( stg2_io_out_out_c1b),
	.stg2_ccx_clk_stop_in_c2b ( stg2_ccx_clk_stop_in_c2b ),
	.stg2_ccx_clk_stop_out_c1b ( stg2_ccx_clk_stop_out_c1b ),
	.stg2_cmp_io_sync_en_in_c2b ( stg2_cmp_io_sync_en_in_c2b ),
	.stg2_cmp_io_sync_en_in_c2t ( stg2_cmp_io_sync_en_in_c2t ),
	.stg2_cmp_io_sync_en_out_c1b ( stg2_cmp_io_sync_en_out_c1b ),
	.stg2_cmp_io_sync_en_out_c1t ( stg2_cmp_io_sync_en_out_c1t ),
	.stg2_db0_clk_stop_in_c2b ( stg2_db0_clk_stop_in_c2b ),
	.stg2_db0_clk_stop_out_c1b ( stg2_db0_clk_stop_out_c1b ),
	.stg2_dmu_io_clk_stop_in_c2b ( stg2_dmu_io_clk_stop_in_c2b ),
	.stg2_dmu_io_clk_stop_out_c1b ( stg2_dmu_io_clk_stop_out_c1b ),
	.stg2_dmu_peu_por_in_c2b ( stg2_dmu_peu_por_in_c2b ),
	.stg2_dmu_peu_por_out_c1b ( stg2_dmu_peu_por_out_c1b ),
	.stg2_dmu_peu_wmr_in_c2b ( stg2_dmu_peu_wmr_in_c2b ),
	.stg2_dmu_peu_wmr_out_c1b ( stg2_dmu_peu_wmr_out_c1b ),
	.stg2_dr_sync_en_in_c2t ( stg2_dr_sync_en_in_c2t ),
	.stg2_dr_sync_en_out_c1t ( stg2_dr_sync_en_out_c1t ),
	.stg2_io_cmp_sync_en_in_c2b ( stg2_io_cmp_sync_en_in_c2b ),
	.stg2_io_cmp_sync_en_in_c2t ( stg2_io_cmp_sync_en_in_c2t ),
	.stg2_io_cmp_sync_en_out_c1b ( stg2_io_cmp_sync_en_out_c1b ),
	.stg2_io_cmp_sync_en_out_c1t ( stg2_io_cmp_sync_en_out_c1t ),
	.stg2_io_out_in_c2t ( stg2_io_out_in_c2t ),
	.stg2_io_out_out_c1t ( stg2_io_out_out_c1t ),
	.stg2_io2x_sync_en_in_c2t (stg2_io2x_sync_en_in_c2t ),
	.stg2_l2_por_in_c2b ( stg2_l2_por_in_c2b ),
	.stg2_l2_por_in_c2t ( stg2_l2_por_in_c2t ),
	.stg2_l2_por_out_c1b ( stg2_l2_por_out_c1b ),
	.stg2_l2_por_out_c1t ( stg2_l2_por_out_c1t ),
	.stg2_l2_wmr_in_c2b ( stg2_l2_wmr_in_c2b ),
	.stg2_l2_wmr_in_c2t ( stg2_l2_wmr_in_c2t ),
	.stg2_l2_wmr_out_c1b ( stg2_l2_wmr_out_c1b ),
	.stg2_l2_wmr_out_c1t ( stg2_l2_wmr_out_c1t ),
	.stg2_io_out_in_c2b (stg2_io_out_in_c2b ), 
	.stg2_l2b0_clk_stop_in_c2t ( stg2_l2b0_clk_stop_in_c2t ),
	.stg2_l2b0_clk_stop_out_c1t ( stg2_l2b0_clk_stop_out_c1t ),
	.stg2_l2b1_clk_stop_in_c2t ( stg2_l2b1_clk_stop_in_c2t ),
	.stg2_l2b1_clk_stop_out_c1t ( stg2_l2b1_clk_stop_out_c1t ),
	.stg2_l2b2_clk_stop_in_c2b ( stg2_l2b2_clk_stop_in_c2b ),
	.stg2_l2b2_clk_stop_out_c1b ( stg2_l2b2_clk_stop_out_c1b ),
	.stg2_l2b3_clk_stop_in_c2b ( stg2_l2b3_clk_stop_in_c2b ),
	.stg2_l2b3_clk_stop_out_c1b ( stg2_l2b3_clk_stop_out_c1b ),
	.stg2_l2d0_clk_stop_in_c2t ( stg2_l2d0_clk_stop_in_c2t ),
	.stg2_l2d0_clk_stop_out_c1t ( stg2_l2d0_clk_stop_out_c1t ),
	.stg2_l2d1_clk_stop_in_c2t ( stg2_l2d1_clk_stop_in_c2t ),
	.stg2_l2d1_clk_stop_out_c1t ( stg2_l2d1_clk_stop_out_c1t ),
	.stg2_l2d2_clk_stop_in_c2b ( stg2_l2d2_clk_stop_in_c2b ),
	.stg2_l2d2_clk_stop_out_c1b ( stg2_l2d2_clk_stop_out_c1b ),
	.stg2_l2d3_clk_stop_in_c2b ( stg2_l2d3_clk_stop_in_c2b ),
	.stg2_l2d3_clk_stop_out_c1b ( stg2_l2d3_clk_stop_out_c1b ),
	.stg2_l2t0_clk_stop_in_c2t ( stg2_l2t0_clk_stop_in_c2t ),
	.stg2_l2t0_clk_stop_out_c1t ( stg2_l2t0_clk_stop_out_c1t ),
	.stg2_l2t1_clk_stop_in_c2t ( stg2_l2t1_clk_stop_in_c2t ),
	.stg2_l2t1_clk_stop_out_c1t ( stg2_l2t1_clk_stop_out_c1t ),
	.stg2_l2t2_clk_stop_in_c2b ( stg2_l2t2_clk_stop_in_c2b ),
	.stg2_l2t2_clk_stop_out_c1b ( stg2_l2t2_clk_stop_out_c1b ),
	.stg2_l2t3_clk_stop_in_c2bz ( stg2_l2t3_clk_stop_in_c2bz ),
	.stg2_l2t3_clk_stop_out_c1b ( stg2_l2t3_clk_stop_out_c1b ),
	.stg2_l2t5_clk_stop_in_c2t ( stg2_l2t5_clk_stop_in_c2t ),
	.stg2_l2t5_clk_stop_out_c1t ( stg2_l2t5_clk_stop_out_c1t ),
	.stg2_l2t7_clk_stop_in_c2b ( stg2_l2t7_clk_stop_in_c2b ),
	.stg2_l2t7_clk_stop_out_c1b ( stg2_l2t7_clk_stop_out_c1b ),
	.stg2_mcu0_clk_stop_out_c1t ( stg2_mcu0_clk_stop_out_c1t ),
//	.stg2_mcu0_dr_clk_stop_out_c1t ( stg2_mcu0_dr_clk_stop_out_c1t ),
	.stg2_mcu0_io_clk_stop_out_c1t ( stg2_mcu0_io_clk_stop_out_c1t ),
	.stg2_mcu1_clk_stop_out_c1t ( stg2_mcu1_clk_stop_out_c1t ),
//	.stg2_mcu1_dr_clk_stop_out_c1t ( stg2_mcu1_dr_clk_stop_out_c1t ),
	.stg2_mcu1_io_clk_stop_out_c1t ( stg2_mcu1_io_clk_stop_out_c1t ),
	.stg2_mio_clk_stop_in_c2t ( stg2_mio_clk_stop_in_c2t ),
	.stg2_mio_clk_stop_out_c1t ( stg2_mio_clk_stop_out_c1t ),
	.stg2_mio_io2x_sync_en_in_c2t ( stg2_mio_io2x_sync_en_in_c2t ),
	.stg2_mio_io2x_sync_en_out_c1t ( stg2_mio_io2x_sync_en_out_c1t ),
	.stg2_ncu_clk_stop_in_c2b ( stg2_ncu_clk_stop_in_c2b ),
	.stg2_ncu_clk_stop_out_c1b ( stg2_ncu_clk_stop_out_c1b ),
	.stg2_ncu_io_clk_stop_in_c2b ( stg2_ncu_io_clk_stop_in_c2b ),
	.stg2_ncu_io_clk_stop_out_c1b ( stg2_ncu_io_clk_stop_out_c1b ),
	.stg2_peu_io_clk_stop_in_c2b ( stg2_peu_io_clk_stop_in_c2b ),
	.stg2_peu_io_clk_stop_out_c1b ( stg2_peu_io_clk_stop_out_c1b ),
	.stg2_sii_clk_stop_in_c2b ( stg2_sii_clk_stop_in_c2b ),
	.stg2_sii_clk_stop_out_c1b ( stg2_sii_clk_stop_out_c1b ),
	.stg2_sii_io_clk_stop_in_c2b ( stg2_sii_io_clk_stop_in_c2b ),
	.stg2_sii_io_clk_stop_out_c1b ( stg2_sii_io_clk_stop_out_c1b ),
	.stg2_spc0_clk_stop_in_c2t ( stg2_spc0_clk_stop_in_c2t ),
	.stg2_spc0_clk_stop_out_c1t ( stg2_spc0_clk_stop_out_c1t ),
	.stg2_spc1_clk_stop_in_c2t ( stg2_spc1_clk_stop_in_c2t ),
	.stg2_spc1_clk_stop_out_c1t ( stg2_spc1_clk_stop_out_c1t ),
	.stg2_spc2_clk_stop_in_c2b ( stg2_spc2_clk_stop_in_c2b ),
	.stg2_spc2_clk_stop_out_c1b ( stg2_spc2_clk_stop_out_c1b ),
	.stg2_spc3_clk_stop_in_c2b ( stg2_spc3_clk_stop_in_c2b ),
	.stg2_spc3_clk_stop_out_c1b ( stg2_spc3_clk_stop_out_c1b ),
	.stg2_spc5_clk_stop_in_c2t ( stg2_spc5_clk_stop_in_c2t ),
	.stg2_spc5_clk_stop_out_c1t ( stg2_spc5_clk_stop_out_c1t ),
	.stg2_spc7_clk_stop_in_c2b ( stg2_spc7_clk_stop_in_c2b ),
	.stg2_spc7_clk_stop_out_c1b ( stg2_spc7_clk_stop_out_c1b ),
	.stg2_mcu0_clk_stop_in_c2t ( stg2_mcu0_clk_stop_in_c2t ),
	.stg2_mcu1_clk_stop_in_c2t ( stg2_mcu1_clk_stop_in_c2t ),
	.stg2_mcu0_io_clk_stop_in_c2t ( stg2_mcu0_io_clk_stop_in_c2t ),
//	.stg2_mcu0_dr_clk_stop_in_c2t ( stg2_mcu0_dr_clk_stop_in_c2t ),
//	.stg2_mcu1_dr_clk_stop_in_c2t ( stg2_mcu1_dr_clk_stop_in_c2t ),
	.stg2_mcu1_io_clk_stop_in_c2t ( stg2_mcu1_io_clk_stop_in_c2t ),
//	.stg3_mcu0_dr_clk_stop_out_c2t ( stg3_mcu0_dr_clk_stop_out_c2t ),
	.stg3_mcu0_io_clk_stop_out_c2t ( stg3_mcu0_io_clk_stop_out_c2t ),
//	.stg3_mcu1_dr_clk_stop_out_c2t ( stg3_mcu1_dr_clk_stop_out_c2t ),
	.stg3_mcu1_io_clk_stop_out_c2t ( stg3_mcu1_io_clk_stop_out_c2t ),
	.stg3_mcu0_clk_stop_out_c2t ( stg3_mcu0_clk_stop_out_c2t ),
	.stg3_mcu1_clk_stop_out_c2t ( stg3_mcu1_clk_stop_out_c2t ),
	.stg3_ccx_clk_stop_in_c2b ( stg3_ccx_clk_stop_in_c2b ),
	.stg3_ccx_clk_stop_out_c2b ( stg3_ccx_clk_stop_out_c2b ),
	.stg3_cmp_io_sync_en_in_c2b ( stg3_cmp_io_sync_en_in_c2b ),
	.stg3_cmp_io_sync_en_in_c2t ( stg3_cmp_io_sync_en_in_c2t ),
	.stg3_cmp_io_sync_en_in_c3b ( stg3_cmp_io_sync_en_in_c3b ),
	.stg3_cmp_io_sync_en_in_c3t ( stg3_cmp_io_sync_en_in_c3t ),
	.stg3_cmp_io_sync_en_out_c2b ( stg3_cmp_io_sync_en_out_c2b ),
	.stg3_cmp_io_sync_en_out_c2t ( stg3_cmp_io_sync_en_out_c2t ),
	.stg3_db0_clk_stop_in_c3b ( stg3_db0_clk_stop_in_c3b ),
	.stg3_db0_clk_stop_out_c2b ( stg3_db0_clk_stop_out_c2b ),
	.stg3_dmu_io_clk_stop_in_c3b ( stg3_dmu_io_clk_stop_in_c3b ),
	.stg3_dmu_io_clk_stop_out_c2b ( stg3_dmu_io_clk_stop_out_c2b ),
	.stg3_dmu_peu_por_in_c3b ( stg3_dmu_peu_por_in_c3b ),
	.stg3_dmu_peu_por_out_c2b ( stg3_dmu_peu_por_out_c2b ),
	.stg3_dmu_peu_wmr_in_c3b ( stg3_dmu_peu_wmr_in_c3b ),
	.stg3_dmu_peu_wmr_out_c2b ( stg3_dmu_peu_wmr_out_c2b ),
	.stg3_dr_sync_en_in_c3t ( stg3_dr_sync_en_in_c3t ),
	.stg3_dr_sync_en_out_c2t ( stg3_dr_sync_en_out_c2t ),
	.stg3_io2x_sync_en_in_c2t ( stg3_io2x_sync_en_in_c2t ),
	.stg3_io_cmp_sync_en_in_c2b ( stg3_io_cmp_sync_en_in_c2b ),
	.stg3_io_cmp_sync_en_in_c2t ( stg3_io_cmp_sync_en_in_c2t ),
	.stg3_io_cmp_sync_en_in_c3b ( stg3_io_cmp_sync_en_in_c3b ),
	.stg3_io_cmp_sync_en_in_c3t ( stg3_io_cmp_sync_en_in_c3t ),
	.stg3_io_cmp_sync_en_out_c2b ( stg3_io_cmp_sync_en_out_c2b ),
	.stg3_io_cmp_sync_en_out_c2t ( stg3_io_cmp_sync_en_out_c2t ),
	.stg3_io_out_in_c3b ( stg3_io_out_in_c3b ),
	.stg3_io_out_in_c3t ( stg3_io_out_in_c3t ),
	.stg3_io_out_out_c2t ( stg3_io_out_out_c2t ),
	.stg3_io2x_sync_en_out_c2t (stg3_io2x_sync_en_out_c2t ),
	.stg3_l2_por_in_c2b ( stg3_l2_por_in_c2b ),
	.stg3_l2_por_in_c2t ( stg3_l2_por_in_c2t ),
	.stg3_l2_por_in_c3b ( stg3_l2_por_in_c3b ),
	.stg3_l2_por_in_c3t ( stg3_l2_por_in_c3t ),
	.stg3_l2_por_out_c2b ( stg3_l2_por_out_c2b ),
	.stg3_l2_por_out_c2t ( stg3_l2_por_out_c2t ),
	.stg3_l2_wmr_in_c2b ( stg3_l2_wmr_in_c2b ),
	.stg3_l2_wmr_in_c2t ( stg3_l2_wmr_in_c2t ),
	.stg3_l2_wmr_in_c3b ( stg3_l2_wmr_in_c3b ),
	.stg3_l2_wmr_in_c3t ( stg3_l2_wmr_in_c3t ),
	.stg3_l2_wmr_out_c2b ( stg3_l2_wmr_out_c2b ),
	.stg3_l2_wmr_out_c2t ( stg3_l2_wmr_out_c2t ),
	.stg3_l2b0_clk_stop_in_c3t ( stg3_l2b0_clk_stop_in_c3t ),
	.stg3_l2b0_clk_stop_out_c2t ( stg3_l2b0_clk_stop_out_c2t ),
	.stg3_l2b1_clk_stop_in_c3t ( stg3_l2b1_clk_stop_in_c3t ),
	.stg3_l2b1_clk_stop_out_c2t ( stg3_l2b1_clk_stop_out_c2t ),
	.stg3_l2b2_clk_stop_in_c3b ( stg3_l2b2_clk_stop_in_c3b ),
	.stg3_l2b2_clk_stop_out_c2b ( stg3_l2b2_clk_stop_out_c2b ),
	.stg3_l2b3_clk_stop_in_c3b ( stg3_l2b3_clk_stop_in_c3b ),
	.stg3_l2b3_clk_stop_out_c2b ( stg3_l2b3_clk_stop_out_c2b ),
	.stg3_l2d0_clk_stop_in_c3t ( stg3_l2d0_clk_stop_in_c3t ),
	.stg3_l2d0_clk_stop_out_c2t ( stg3_l2d0_clk_stop_out_c2t ),
	.stg3_l2d1_clk_stop_in_c3t ( stg3_l2d1_clk_stop_in_c3t ),
	.stg3_l2d1_clk_stop_out_c2t ( stg3_l2d1_clk_stop_out_c2t ),
	.stg3_l2d2_clk_stop_in_c3b ( stg3_l2d2_clk_stop_in_c3b ),
	.stg3_l2d2_clk_stop_out_c2b ( stg3_l2d2_clk_stop_out_c2b ),
	.stg3_l2d3_clk_stop_in_c3b ( stg3_l2d3_clk_stop_in_c3b ),
	.stg3_l2d3_clk_stop_out_c2b ( stg3_l2d3_clk_stop_out_c2b ),
	.stg3_l2t0_clk_stop_in_c3t ( stg3_l2t0_clk_stop_in_c3t ),
	.stg3_l2t0_clk_stop_out_c2t ( stg3_l2t0_clk_stop_out_c2t ),
	.stg3_l2t1_clk_stop_in_c2t ( stg3_l2t1_clk_stop_in_c2t ),
	.stg3_l2t1_clk_stop_out_c2t ( stg3_l2t1_clk_stop_out_c2t ),
	.stg3_l2t2_clk_stop_in_c3b ( stg3_l2t2_clk_stop_in_c3b ),
	.stg3_l2t2_clk_stop_out_c2b ( stg3_l2t2_clk_stop_out_c2b ),
	.stg3_l2t3_clk_stop_in_c2b ( stg3_l2t3_clk_stop_in_c2b ),
	.stg3_l2t3_clk_stop_out_c2b ( stg3_l2t3_clk_stop_out_c2b ),
	.stg3_l2t5_clk_stop_in_c2t ( stg3_l2t5_clk_stop_in_c2t ),
	.stg3_l2t5_clk_stop_out_c2t ( stg3_l2t5_clk_stop_out_c2t ),
	.stg3_l2t7_clk_stop_in_c2b ( stg3_l2t7_clk_stop_in_c2b ),
	.stg3_l2t7_clk_stop_out_c2b ( stg3_l2t7_clk_stop_out_c2b ),
	.stg3_mcu0_clk_stop_in_c3t ( stg3_mcu0_clk_stop_in_c3t ),
//	.stg3_mcu0_dr_clk_stop_in_c3t ( stg3_mcu0_dr_clk_stop_in_c3t ),
	.stg3_mcu0_io_clk_stop_in_c3t ( stg3_mcu0_io_clk_stop_in_c3t ),
	.stg3_mcu1_clk_stop_in_c3t ( stg3_mcu1_clk_stop_in_c3t ),
//	.stg3_mcu1_dr_clk_stop_in_c3t ( stg3_mcu1_dr_clk_stop_in_c3t ),
	.stg3_mcu1_io_clk_stop_in_c3t ( stg3_mcu1_io_clk_stop_in_c3t ),
	.stg3_mio_clk_stop_in_c2t ( stg3_mio_clk_stop_in_c2t ),
	.stg3_mio_clk_stop_in_c3t ( stg3_mio_clk_stop_in_c3t ),
	.stg3_mio_clk_stop_out_c2t ( stg3_mio_clk_stop_out_c2t ),
	.stg3_mio_io2x_sync_en_in_c3t ( stg3_mio_io2x_sync_en_in_c3t ),
	.stg3_mio_io2x_sync_en_out_c2t ( stg3_mio_io2x_sync_en_out_c2t ),
	.stg3_ncu_clk_stop_in_c3b ( stg3_ncu_clk_stop_in_c3b ),
	.stg3_ncu_clk_stop_out_c2b ( stg3_ncu_clk_stop_out_c2b ),
	.stg3_ncu_io_clk_stop_in_c3b ( stg3_ncu_io_clk_stop_in_c3b ),
	.stg3_ncu_io_clk_stop_out_c2b ( stg3_ncu_io_clk_stop_out_c2b ),
	.stg3_io_out_out_c2b ( stg3_io_out_out_c2b ),
	.stg3_peu_io_clk_stop_in_c3b ( stg3_peu_io_clk_stop_in_c3b ),
	.stg3_peu_io_clk_stop_out_c2b ( stg3_peu_io_clk_stop_out_c2b ),
	.stg3_sii_clk_stop_in_c3b ( stg3_sii_clk_stop_in_c3b ),
	.stg3_sii_clk_stop_out_c2b ( stg3_sii_clk_stop_out_c2b ),
	.stg3_sii_io_clk_stop_in_c3b ( stg3_sii_io_clk_stop_in_c3b ),
	.stg3_sii_io_clk_stop_out_c2b ( stg3_sii_io_clk_stop_out_c2b ),
	.stg3_spc0_clk_stop_in_c3t ( stg3_spc0_clk_stop_in_c3t ),
	.stg3_spc0_clk_stop_out_c2t ( stg3_spc0_clk_stop_out_c2t ),
 	.stg3_spc1_clk_stop_in_c2t ( stg3_spc1_clk_stop_in_c2t ),
	.stg3_spc1_clk_stop_out_c2t ( stg3_spc1_clk_stop_out_c2t ),
	.stg3_spc2_clk_stop_in_c3b ( stg3_spc2_clk_stop_in_c3b ),
	.stg3_spc2_clk_stop_out_c2b ( stg3_spc2_clk_stop_out_c2b ),
	.stg3_spc3_clk_stop_in_c2b ( stg3_spc3_clk_stop_in_c2b ),
	.stg3_spc3_clk_stop_out_c2b ( stg3_spc3_clk_stop_out_c2b ),
	.stg3_spc5_clk_stop_in_c2t ( stg3_spc5_clk_stop_in_c2t ),
	.stg3_spc5_clk_stop_out_c2t ( stg3_spc5_clk_stop_out_c2t ),
	.stg3_spc7_clk_stop_in_c2b ( stg3_spc7_clk_stop_in_c2b ),
	.stg3_spc7_clk_stop_out_c2b ( stg3_spc7_clk_stop_out_c2b ),
	.stg4_cmp_io_sync_en_in_c3b ( stg4_cmp_io_sync_en_in_c3b ),
	.stg4_cmp_io_sync_en_in_c3t ( stg4_cmp_io_sync_en_in_c3t ),
	.stg4_cmp_io_sync_en_out_c3b ( stg4_cmp_io_sync_en_out_c3b ),
	.stg4_cmp_io_sync_en_out_c3t ( stg4_cmp_io_sync_en_out_c3t ),
	.stg4_db0_clk_stop_c3b ( stg4_db0_clk_stop_c3b ),
	.stg4_db0_clk_stop_out_c3b ( stg4_db0_clk_stop_out_c3b ),
	.stg4_dmu_io_clk_stop_in_c3b ( stg4_dmu_io_clk_stop_in_c3b ),
	.stg4_dmu_io_clk_stop_out_c3b ( stg4_dmu_io_clk_stop_out_c3b ),
	.stg4_dmu_peu_por_in_c3b ( stg4_dmu_peu_por_in_c3b ),
	.stg4_dmu_peu_por_out_c3b ( stg4_dmu_peu_por_out_c3b ),
	.stg4_dmu_peu_wmr_in_c3b ( stg4_dmu_peu_wmr_in_c3b ),
	.stg4_dmu_peu_wmr_out_c3b ( stg4_dmu_peu_wmr_out_c3b ),
	.stg4_dr_sync_en_in_c3t ( stg4_dr_sync_en_in_c3t ),
	.stg4_dr_sync_en_out_c3t ( stg4_dr_sync_en_out_c3t ),
	.stg4_io2x_sync_en_c3t ( stg4_io2x_sync_en_c3t ),
	.stg4_io2x_sync_en_in_c3t ( stg4_io2x_sync_en_in_c3t ),
	// .stg4_io2x_sync_en_out_c2b ( stg4_io2x_sync_en_out_c2b ),
	.stg4_io_cmp_sync_en_in_c3b ( stg4_io_cmp_sync_en_in_c3b ),
	.stg4_io_cmp_sync_en_in_c3t ( stg4_io_cmp_sync_en_in_c3t ),
	.stg4_io_cmp_sync_en_out_c3b ( stg4_io_cmp_sync_en_out_c3b ),
	.stg4_io_cmp_sync_en_out_c3t ( stg4_io_cmp_sync_en_out_c3t ),
	.stg4_io_out_in_c3b ( stg4_io_out_in_c3b ),
	.stg4_io_out_in_c3t ( stg4_io_out_in_c3t ),
	.stg4_io_out_out_c3b ( stg4_io_out_out_c3b ),
	.stg4_io_out_out_c3t ( stg4_io_out_out_c3t ),
	.stg4_l2_por_in_c3b ( stg4_l2_por_in_c3b ),
	.stg4_l2_por_in_c3t ( stg4_l2_por_in_c3t ),
	.stg4_l2_por_out_c3b ( stg4_l2_por_out_c3b ),
	.stg4_l2_por_out_c3t ( stg4_l2_por_out_c3t ),
	.stg4_l2_wmr_in_c3b ( stg4_l2_wmr_in_c3b ),
	.stg4_l2_wmr_in_c3t ( stg4_l2_wmr_in_c3t ),
	.stg4_l2_wmr_out_c3b ( stg4_l2_wmr_out_c3b ),
	.stg4_l2_wmr_out_c3t ( stg4_l2_wmr_out_c3t ),
	.stg4_l2b0_clk_stop_in_c3t ( stg4_l2b0_clk_stop_in_c3t ),
	.stg4_l2b0_clk_stop_out_c3t ( stg4_l2b0_clk_stop_out_c3t ),
	.stg4_l2b1_clk_stop_in_c3t ( stg4_l2b1_clk_stop_in_c3t ),
	.stg4_l2b1_clk_stop_out_c3t ( stg4_l2b1_clk_stop_out_c3t ),
	.stg4_l2b2_clk_stop_in_c3b ( stg4_l2b2_clk_stop_in_c3b ),
	.stg4_l2b2_clk_stop_out_c3b ( stg4_l2b2_clk_stop_out_c3b ),
	.stg4_l2b3_clk_stop_in_c3b ( stg4_l2b3_clk_stop_in_c3b ),
	.stg4_l2b3_clk_stop_out_c3b ( stg4_l2b3_clk_stop_out_c3b ),
	.stg4_l2d0_clk_stop_in_c3t ( stg4_l2d0_clk_stop_in_c3t ),
	.stg4_l2d0_clk_stop_out_c3t ( stg4_l2d0_clk_stop_out_c3t ),
	.stg4_l2d1_clk_stop_in_c3t ( stg4_l2d1_clk_stop_in_c3t ),
	.stg4_l2d1_clk_stop_out_c3t ( stg4_l2d1_clk_stop_out_c3t ),
	.stg4_l2d2_clk_stop_in_c3b ( stg4_l2d2_clk_stop_in_c3b ),
	.stg4_l2d2_clk_stop_out_c3b ( stg4_l2d2_clk_stop_out_c3b ),
	.stg4_l2d3_clk_stop_in_c3b ( stg4_l2d3_clk_stop_in_c3b ),
	.stg4_l2d3_clk_stop_out_c3b ( stg4_l2d3_clk_stop_out_c3b ),
	.stg4_l2t0_clk_stop_in_c3t ( stg4_l2t0_clk_stop_in_c3t ),
	.stg4_l2t0_clk_stop_out_c3t ( stg4_l2t0_clk_stop_out_c3t ),
	.stg4_l2t2_clk_stop_in_c3b ( stg4_l2t2_clk_stop_in_c3b ),
	.stg4_l2t2_clk_stop_out_c3b ( stg4_l2t2_clk_stop_out_c3b ),
	.stg4_mcu0_clk_stop_in_c3t ( stg4_mcu0_clk_stop_in_c3t ),
	.stg4_mcu0_clk_stop_out_c3t ( stg4_mcu0_clk_stop_out_c3t ),
// 	.stg4_mcu0_dr_clk_stop_in_c3t ( stg4_mcu0_dr_clk_stop_in_c3t ),
// 	.stg4_mcu0_dr_clk_stop_out_c3t ( stg4_mcu0_dr_clk_stop_out_c3t ),
	.stg4_mcu0_io_clk_stop_in_c3t ( stg4_mcu0_io_clk_stop_in_c3t ),
	.stg4_mcu0_io_clk_stop_out_c3t ( stg4_mcu0_io_clk_stop_out_c3t ),
	.stg4_mcu1_clk_stop_in_c3t ( stg4_mcu1_clk_stop_in_c3t ),
	.stg4_mcu1_clk_stop_out_c3t ( stg4_mcu1_clk_stop_out_c3t ),
// 	.stg4_mcu1_dr_clk_stop_in_c3t ( stg4_mcu1_dr_clk_stop_in_c3t ),
// 	.stg4_mcu1_dr_clk_stop_out_c3t ( stg4_mcu1_dr_clk_stop_out_c3t ),
	.stg4_mcu1_io_clk_stop_in_c3t ( stg4_mcu1_io_clk_stop_in_c3t ),
	.stg4_mcu1_io_clk_stop_out_c3t ( stg4_mcu1_io_clk_stop_out_c3t ),
	.stg4_mio_clk_stop_in_c3t ( stg4_mio_clk_stop_in_c3t ),
	.stg4_mio_clk_stop_out_c3t ( stg4_mio_clk_stop_out_c3t ),
	.stg4_mio_io2x_sync_en_out_c3t ( stg4_mio_io2x_sync_en_out_c3t ),
	.stg4_ncu_clk_stop_in_c3b ( stg4_ncu_clk_stop_in_c3b ),
	.stg4_ncu_clk_stop_out_c3b ( stg4_ncu_clk_stop_out_c3b ),
	.stg4_ncu_io_clk_stop_c3b ( stg4_ncu_io_clk_stop_c3b ),
	.stg4_ncu_io_clk_stop_out_c3b ( stg4_ncu_io_clk_stop_out_c3b ),
	.stg4_peu_io_clk_stop_in_c3b ( stg4_peu_io_clk_stop_in_c3b ),
	.stg4_peu_io_clk_stop_out_c3b ( stg4_peu_io_clk_stop_out_c3b ),
	.stg4_sii_clk_stop_in_c3b ( stg4_sii_clk_stop_in_c3b ),
	.stg4_sii_clk_stop_out_c3b ( stg4_sii_clk_stop_out_c3b ),
	.stg4_sii_io_clk_stop_in_c3b ( stg4_sii_io_clk_stop_in_c3b ),
	.stg4_sii_io_clk_stop_out_c3b ( stg4_sii_io_clk_stop_out_c3b ),
	.stg4_spc0_clk_stop_in_c3t ( stg4_spc0_clk_stop_in_c3t ),
	.stg4_spc0_clk_stop_out_c3t ( stg4_spc0_clk_stop_out_c3t ),
//	.stg4_spc1_clk_stop_out_c2b ( stg4_spc1_clk_stop_out_c2b ),
	.stg4_spc2_clk_stop_in_c3b ( stg4_spc2_clk_stop_in_c3b ),
	.stg4_spc2_clk_stop_out_c3b ( stg4_spc2_clk_stop_out_c3b ),
// 	.stg4_spc5_clk_stop_out_c2b ( stg4_spc5_clk_stop_out_c2b ),
	.tcu_ccu_clk_stop ( tcu_ccu_clk_stop ),
	.tcu_ccu_io_clk_stop ( tcu_ccu_io_clk_stop ),
	.tcu_ccx_clk_stop ( tcu_ccx_clk_stop ),
	.tcu_db0_clk_stop ( tcu_db0_clk_stop ),
	.tcu_db1_clk_stop ( tcu_db1_clk_stop ),
	.tcu_dmu_io_clk_stop ( tcu_dmu_io_clk_stop ),
	.tcu_efu_clk_stop ( tcu_efu_clk_stop ),
	.tcu_efu_io_clk_stop ( tcu_efu_io_clk_stop ),
	.tcu_l2b0_clk_stop ( tcu_l2b0_clk_stop ),
	.tcu_l2b1_clk_stop ( tcu_l2b1_clk_stop ),
	.tcu_l2b2_clk_stop ( tcu_l2b2_clk_stop ),
	.tcu_l2b3_clk_stop ( tcu_l2b3_clk_stop ),
	.tcu_l2b4_clk_stop ( tcu_l2b4_clk_stop ),
	.tcu_l2b5_clk_stop ( tcu_l2b5_clk_stop ),
	.tcu_l2b6_clk_stop ( tcu_l2b6_clk_stop ),
	.tcu_l2b7_clk_stop ( tcu_l2b7_clk_stop ),
	.tcu_l2d0_clk_stop ( tcu_l2d0_clk_stop ),
	.tcu_l2d1_clk_stop ( tcu_l2d1_clk_stop ),
	.tcu_l2d2_clk_stop ( tcu_l2d2_clk_stop ),
	.tcu_l2d3_clk_stop ( tcu_l2d3_clk_stop ),
	.tcu_l2d4_clk_stop ( tcu_l2d4_clk_stop ),
	.tcu_l2d5_clk_stop ( tcu_l2d5_clk_stop ),
	.tcu_l2d7_clk_stop ( tcu_l2d7_clk_stop ),
	.tcu_l2d6_clk_stop ( tcu_l2d6_clk_stop ),
	.tcu_l2t0_clk_stop ( tcu_l2t0_clk_stop ),
	.tcu_l2t1_clk_stop ( tcu_l2t1_clk_stop ),
	.tcu_l2t2_clk_stop ( tcu_l2t2_clk_stop ),
	.tcu_l2t3_clk_stop ( tcu_l2t3_clk_stop ),
	.tcu_l2t4_clk_stop ( tcu_l2t4_clk_stop ),
	.tcu_l2t5_clk_stop ( tcu_l2t5_clk_stop ),
	.tcu_l2t6_clk_stop ( tcu_l2t6_clk_stop ),
	.tcu_l2t7_clk_stop ( tcu_l2t7_clk_stop ),
	.tcu_mac_io_clk_stop ( tcu_mac_io_clk_stop ),
	.tcu_mcu0_clk_stop ( tcu_mcu0_clk_stop ),
	.tcu_mcu0_dr_clk_stop ( tcu_mcu0_dr_clk_stop ),
	.tcu_mcu0_io_clk_stop ( tcu_mcu0_io_clk_stop ),
	.tcu_mcu1_clk_stop ( tcu_mcu1_clk_stop ),
	.tcu_mcu1_dr_clk_stop ( tcu_mcu1_dr_clk_stop ),
	.tcu_mcu1_io_clk_stop ( tcu_mcu1_io_clk_stop ),
	.tcu_mcu2_clk_stop ( tcu_mcu2_clk_stop ),
	.tcu_mcu2_dr_clk_stop ( tcu_mcu2_dr_clk_stop ),
	.tcu_mcu2_io_clk_stop ( tcu_mcu2_io_clk_stop ),
	.tcu_mcu3_clk_stop ( tcu_mcu3_clk_stop ),
	.tcu_mcu3_dr_clk_stop ( tcu_mcu3_dr_clk_stop ),
	.tcu_mcu3_io_clk_stop ( tcu_mcu3_io_clk_stop ),
	.tcu_mio_clk_stop ( tcu_mio_clk_stop ),
	.tcu_ncu_clk_stop ( tcu_ncu_clk_stop ),
	.tcu_ncu_io_clk_stop ( tcu_ncu_io_clk_stop ),
	.tcu_peu_io_clk_stop ( tcu_peu_io_clk_stop ),
	.tcu_rdp_io_clk_stop ( tcu_rdp_io_clk_stop ),
	.tcu_rst_clk_stop ( tcu_rst_clk_stop ),
	.tcu_rst_io_clk_stop ( tcu_rst_io_clk_stop ),
	.tcu_rtx_io_clk_stop ( tcu_rtx_io_clk_stop ),
	.tcu_sii_clk_stop ( tcu_sii_clk_stop ),
	.tcu_sii_io_clk_stop ( tcu_sii_io_clk_stop ),
	.tcu_sio_clk_stop ( tcu_sio_clk_stop ),
	.tcu_sio_io_clk_stop ( tcu_sio_io_clk_stop ),
	.tcu_spc0_clk_stop ( tcu_spc0_clk_stop ),
	.tcu_spc1_clk_stop ( tcu_spc1_clk_stop ),
	.tcu_spc2_clk_stop ( tcu_spc2_clk_stop ),
	.tcu_spc3_clk_stop ( tcu_spc3_clk_stop ),
	.tcu_spc4_clk_stop ( tcu_spc4_clk_stop ),
	.tcu_spc5_clk_stop ( tcu_spc5_clk_stop ),
	.tcu_spc6_clk_stop ( tcu_spc6_clk_stop ),
	.tcu_spc7_clk_stop ( tcu_spc7_clk_stop ),
	.tcu_tds_io_clk_stop ( tcu_tds_io_clk_stop )
);

	
endmodule




// ************************************************************************
// module n2_clk_gl_dr_tree 
// ************************************************************************

module n2_clk_gl_dr_tree ( pll_dr_clk, dr_gclk_stg_tcu, dr_gclk_fsr7_stg,
	dr_gclk_c4_mcu0 , dr_gclk_c4_mcu1 , dr_gclk_c0_mcu2 , dr_gclk_c0_mcu3 ,
	dr_gclk_c4_fsr0_0 , dr_gclk_c4_fsr0_1 , dr_gclk_c4_fsr0_2 , 
	dr_gclk_c4_fsr1_0 , dr_gclk_c4_fsr1_1 , dr_gclk_c4_fsr1_2 ,
	dr_gclk_c4_fsr2_0 , dr_gclk_c4_fsr2_1 , dr_gclk_c4_fsr2_2 , 
	dr_gclk_c4_fsr3_0 , dr_gclk_c4_fsr3_1 , dr_gclk_c4_fsr3_2 , 
	dr_gclk_c0_fsr4_0 , dr_gclk_c0_fsr4_1 , dr_gclk_c0_fsr4_2 ,
	dr_gclk_c0_fsr5_0 , dr_gclk_c0_fsr5_1 , dr_gclk_c0_fsr5_2 , 
	dr_gclk_c0_fsr6_0 , dr_gclk_c0_fsr6_1 , dr_gclk_c0_fsr6_2 , 
	dr_gclk_c2_fsr7_0 , dr_gclk_c2_fsr7_1 , dr_gclk_c2_fsr7_2 
); 

input		pll_dr_clk ;

output		dr_gclk_stg_tcu; 
output		dr_gclk_fsr7_stg;
output 		dr_gclk_c4_mcu0 ;
output 		dr_gclk_c4_mcu1 ;
output 		dr_gclk_c0_mcu2 ;
output 		dr_gclk_c0_mcu3 ;
output		dr_gclk_c4_fsr0_0; 
output		dr_gclk_c4_fsr0_1; 
output		dr_gclk_c4_fsr0_2; 
output		dr_gclk_c4_fsr1_0;
output		dr_gclk_c4_fsr1_1;
output		dr_gclk_c4_fsr1_2;
output		dr_gclk_c4_fsr2_0; 
output		dr_gclk_c4_fsr2_1; 
output		dr_gclk_c4_fsr2_2; 
output		dr_gclk_c4_fsr3_0; 
output		dr_gclk_c4_fsr3_1; 
output		dr_gclk_c4_fsr3_2; 
output		dr_gclk_c0_fsr4_0;
output		dr_gclk_c0_fsr4_1;
output		dr_gclk_c0_fsr4_2;
output		dr_gclk_c0_fsr5_0; 
output		dr_gclk_c0_fsr5_1; 
output		dr_gclk_c0_fsr5_2; 
output		dr_gclk_c0_fsr6_0; 
output		dr_gclk_c0_fsr6_1; 
output		dr_gclk_c0_fsr6_2; 
output		dr_gclk_c2_fsr7_0;
output		dr_gclk_c2_fsr7_1;
output		dr_gclk_c2_fsr7_2;

assign dr_gclk_stg_tcu = pll_dr_clk; 
assign dr_gclk_fsr7_stg = pll_dr_clk;
assign dr_gclk_c4_mcu0 = pll_dr_clk ;
assign dr_gclk_c4_mcu1 = pll_dr_clk ;
assign dr_gclk_c0_mcu2 = pll_dr_clk ;
assign dr_gclk_c0_mcu3 = pll_dr_clk ;
assign dr_gclk_c4_fsr0_0 = pll_dr_clk; 
assign dr_gclk_c4_fsr0_1 = pll_dr_clk; 
assign dr_gclk_c4_fsr0_2 = pll_dr_clk; 
assign dr_gclk_c4_fsr1_0 = pll_dr_clk;
assign dr_gclk_c4_fsr1_1 = pll_dr_clk;
assign dr_gclk_c4_fsr1_2 = pll_dr_clk;
assign dr_gclk_c4_fsr2_0 = pll_dr_clk; 
assign dr_gclk_c4_fsr2_1 = pll_dr_clk; 
assign dr_gclk_c4_fsr2_2 = pll_dr_clk; 
assign dr_gclk_c4_fsr3_0 = pll_dr_clk; 
assign dr_gclk_c4_fsr3_1 = pll_dr_clk; 
assign dr_gclk_c4_fsr3_2 = pll_dr_clk; 
assign dr_gclk_c0_fsr4_0 = pll_dr_clk;
assign dr_gclk_c0_fsr4_1 = pll_dr_clk;
assign dr_gclk_c0_fsr4_2 = pll_dr_clk;
assign dr_gclk_c0_fsr5_0 = pll_dr_clk; 
assign dr_gclk_c0_fsr5_1 = pll_dr_clk; 
assign dr_gclk_c0_fsr5_2 = pll_dr_clk; 
assign dr_gclk_c0_fsr6_0 = pll_dr_clk; 
assign dr_gclk_c0_fsr6_1 = pll_dr_clk; 
assign dr_gclk_c0_fsr6_2 = pll_dr_clk; 
assign dr_gclk_c2_fsr7_0 = pll_dr_clk;
assign dr_gclk_c2_fsr7_1 = pll_dr_clk;
assign dr_gclk_c2_fsr7_2 = pll_dr_clk;

endmodule


// ************************************************************************
// module n2_clk_gl_cmp_tree 
// ************************************************************************

module n2_clk_gl_cmp_tree (
     cmp_gclk_c1_ccu , cmp_gclk_c2_ccx_left , cmp_gclk_c2_ccx_right ,
     cmp_gclk_c3_db0 , cmp_gclk_c1_db1 , cmp_gclk_c3_dmu ,
     cmp_gclk_c1_efu , cmp_gclk_c3_l2b0 , cmp_gclk_c3_l2b1 ,
     cmp_gclk_c3_l2b2 , cmp_gclk_c3_l2b3 , cmp_gclk_c1_l2b4 ,
     cmp_gclk_c1_l2b5 , cmp_gclk_c1_l2b6 , cmp_gclk_c1_l2b7 ,
     cmp_gclk_c3_l2d0 , cmp_gclk_c3_l2d1 , cmp_gclk_c3_l2d2 ,
     cmp_gclk_c3_l2d3 , cmp_gclk_c1_l2d4 , cmp_gclk_c1_l2d5 ,
     cmp_gclk_c1_l2d6 , cmp_gclk_c1_l2d7 , cmp_gclk_c3_l2t0 ,
     cmp_gclk_c3_l2t2 , cmp_gclk_c1_l2t4 , cmp_gclk_c1_l2t6 ,
     cmp_gclk_c2_l2t1 , cmp_gclk_c2_l2t3 , cmp_gclk_c2_l2t5 ,
     cmp_gclk_c2_l2t7 , cmp_gclk_c4_mcu0 , cmp_gclk_c4_mcu1 ,
     cmp_gclk_c0_mcu2 , cmp_gclk_c0_mcu3 , 
     cmp_gclk_c1_mio , cmp_gclk_c3_mio , cmp_gclk_c2_mio_left ,
     cmp_gclk_c2_mio_right , cmp_gclk_c3_ncu , cmp_gclk_c3_peu ,
     // cmp_gclk_c1_rst , 
	cmp_gclk_c3_sii , cmp_gclk_c1_sio ,
     cmp_gclk_c3_spc0 , cmp_gclk_c3_spc2 , cmp_gclk_c1_spc4 ,
     cmp_gclk_c1_spc6 , cmp_gclk_c2_spc1 , cmp_gclk_c2_spc3 ,
     cmp_gclk_c2_spc5 , cmp_gclk_c2_spc7 , cmp_gclk_c1_tcu ,
     cmp_gclk_c1_mac , cmp_gclk_c0_rdp , cmp_gclk_c0_rtx ,
     cmp_gclk_c0_tds , cmp_gclk_c3_rng, 
     pll_cmp_clk );

output 		cmp_gclk_c3_rng ;
output 		cmp_gclk_c1_ccu ;
output 		cmp_gclk_c2_ccx_left ;
output 		cmp_gclk_c2_ccx_right ;
output 		cmp_gclk_c3_db0 ;
output 		cmp_gclk_c1_db1 ;
output 		cmp_gclk_c3_dmu ;
output 		cmp_gclk_c1_efu ;
output 		cmp_gclk_c3_l2b0 ;
output 		cmp_gclk_c3_l2b1 ;
output 		cmp_gclk_c3_l2b2 ;
output 		cmp_gclk_c3_l2b3 ;
output 		cmp_gclk_c1_l2b4 ;
output 		cmp_gclk_c1_l2b5 ;
output 		cmp_gclk_c1_l2b6 ;
output 		cmp_gclk_c1_l2b7 ;
output 		cmp_gclk_c3_l2d0 ;
output 		cmp_gclk_c3_l2d1 ;
output 		cmp_gclk_c3_l2d2 ;
output 		cmp_gclk_c3_l2d3 ;
output 		cmp_gclk_c1_l2d4 ;
output 		cmp_gclk_c1_l2d5 ;
output 		cmp_gclk_c1_l2d6 ;
output 		cmp_gclk_c1_l2d7 ;
output 		cmp_gclk_c3_l2t0 ;
output 		cmp_gclk_c3_l2t2 ;
output 		cmp_gclk_c1_l2t4 ;
output 		cmp_gclk_c1_l2t6 ;
output 		cmp_gclk_c2_l2t1 ;
output 		cmp_gclk_c2_l2t3 ;
output 		cmp_gclk_c2_l2t5 ;
output 		cmp_gclk_c2_l2t7 ;
output 		cmp_gclk_c4_mcu0 ;
output 		cmp_gclk_c4_mcu1 ;
output 		cmp_gclk_c0_mcu2 ;
output 		cmp_gclk_c0_mcu3 ;
output 		cmp_gclk_c1_mio ;
output 		cmp_gclk_c3_mio ;
output 		cmp_gclk_c2_mio_left ;
output 		cmp_gclk_c2_mio_right ;
output 		cmp_gclk_c3_ncu ;
output 		cmp_gclk_c3_peu ;
// output 		cmp_gclk_c1_rst ;
output 		cmp_gclk_c3_sii ;
output 		cmp_gclk_c1_sio ;
output 		cmp_gclk_c3_spc0 ;
output 		cmp_gclk_c3_spc2 ;
output 		cmp_gclk_c1_spc4 ;
output 		cmp_gclk_c1_spc6 ;
output 		cmp_gclk_c2_spc1 ;
output 		cmp_gclk_c2_spc3 ;
output 		cmp_gclk_c2_spc5 ;
output 		cmp_gclk_c2_spc7 ;
output 		cmp_gclk_c1_tcu ;
output 		cmp_gclk_c1_mac ;
output 		cmp_gclk_c0_rdp ;
output 		cmp_gclk_c0_rtx ;
output 		cmp_gclk_c0_tds ;
input		pll_cmp_clk ;


//  new clock names are here to stay
assign cmp_gclk_c3_rng = pll_cmp_clk ;
assign cmp_gclk_c1_ccu = pll_cmp_clk ;
assign cmp_gclk_c2_ccx_left = pll_cmp_clk ;
assign cmp_gclk_c2_ccx_right = pll_cmp_clk ;
assign cmp_gclk_c3_db0 = pll_cmp_clk ;
assign cmp_gclk_c1_db1 = pll_cmp_clk ;
assign cmp_gclk_c3_dmu = pll_cmp_clk ;
assign cmp_gclk_c1_efu = pll_cmp_clk ;
assign cmp_gclk_c3_l2b0 = pll_cmp_clk ;
assign cmp_gclk_c3_l2b1 = pll_cmp_clk ;
assign cmp_gclk_c3_l2b2 = pll_cmp_clk ;
assign cmp_gclk_c3_l2b3 = pll_cmp_clk ;
assign cmp_gclk_c1_l2b4 = pll_cmp_clk ;
assign cmp_gclk_c1_l2b5 = pll_cmp_clk ;
assign cmp_gclk_c1_l2b6 = pll_cmp_clk ;
assign cmp_gclk_c1_l2b7 = pll_cmp_clk ;
assign cmp_gclk_c3_l2d0 = pll_cmp_clk ;
assign cmp_gclk_c3_l2d1 = pll_cmp_clk ;
assign cmp_gclk_c3_l2d2 = pll_cmp_clk ;
assign cmp_gclk_c3_l2d3 = pll_cmp_clk ;
assign cmp_gclk_c1_l2d4 = pll_cmp_clk ;
assign cmp_gclk_c1_l2d5 = pll_cmp_clk ;
assign cmp_gclk_c1_l2d6 = pll_cmp_clk ;
assign cmp_gclk_c1_l2d7 = pll_cmp_clk ;
assign cmp_gclk_c3_l2t0 = pll_cmp_clk ;
assign cmp_gclk_c3_l2t2 = pll_cmp_clk ;
assign cmp_gclk_c1_l2t4 = pll_cmp_clk ;
assign cmp_gclk_c1_l2t6 = pll_cmp_clk ;
assign cmp_gclk_c2_l2t1 = pll_cmp_clk ;
assign cmp_gclk_c2_l2t3 = pll_cmp_clk ;
assign cmp_gclk_c2_l2t5 = pll_cmp_clk ;
assign cmp_gclk_c2_l2t7 = pll_cmp_clk ;
assign cmp_gclk_c4_mcu0 = pll_cmp_clk ;
assign cmp_gclk_c4_mcu1 = pll_cmp_clk ;
assign cmp_gclk_c0_mcu2 = pll_cmp_clk ;
assign cmp_gclk_c0_mcu3 = pll_cmp_clk ;
assign cmp_gclk_c1_mio = pll_cmp_clk ;
assign cmp_gclk_c3_mio = pll_cmp_clk ;
assign cmp_gclk_c2_mio_left = pll_cmp_clk ;
assign cmp_gclk_c2_mio_right = pll_cmp_clk ;
assign cmp_gclk_c3_ncu = pll_cmp_clk ;
assign cmp_gclk_c3_peu = pll_cmp_clk ;
// assign cmp_gclk_c1_rst = pll_cmp_clk ;
assign cmp_gclk_c3_sii = pll_cmp_clk ;
assign cmp_gclk_c1_sio = pll_cmp_clk ;
assign cmp_gclk_c3_spc0 = pll_cmp_clk ;
assign cmp_gclk_c3_spc2 = pll_cmp_clk ;
assign cmp_gclk_c1_spc4 = pll_cmp_clk ;
assign cmp_gclk_c1_spc6 = pll_cmp_clk ;
assign cmp_gclk_c2_spc1 = pll_cmp_clk ;
assign cmp_gclk_c2_spc3 = pll_cmp_clk ;
assign cmp_gclk_c2_spc5 = pll_cmp_clk ;
assign cmp_gclk_c2_spc7 = pll_cmp_clk ;
assign cmp_gclk_c1_tcu = pll_cmp_clk ;
assign cmp_gclk_c1_mac = pll_cmp_clk ;
assign cmp_gclk_c0_rdp = pll_cmp_clk ;
assign cmp_gclk_c0_rtx = pll_cmp_clk ;
assign cmp_gclk_c0_tds = pll_cmp_clk ;

endmodule




// TBD    -- check niu reset stuff
//        -- sync pulses for l2b, l2t (falls under mapping)
//        -- extra clock port for rng
//        -- [error] mcu*_dr_clk_stop needs separate gclk
//        -- how to handle spare ports??

// MACRO = n2_clk_gl_cc 
// 
// TOP: n2_clk_gl_cust
// 		- n2_clk_gl_cmp_tree
// 		- n2_clk_gl_dr_tree
// 		- n2_clk_gl_cc_stage_top 
// 

// tcu_l2t6_clk_stop  & tcu_l2t5_clk_stop  connectivity swapped at primary inputs
// spc1 & spc5 clk_stops messed up in latest cdms version (older one ok)
// no use for outputs stg3_io2x_sync_en_out_c2t & stg4_io2x_sync_en_c3t
// change stg4_io2x_sync_en_c3t from output pin to input pin, //lijuan

// 34  n2_clk_gl_cc_stage_top
// 2   n2_clk_gl_cc_stage_ccu_m0
// 3   n2_clk_gl_cc_stage_rst_m0
// 4   n2_clk_gl_cc_stage_tcu_m0  - need correction for dr_clk_stop
// 5   n2_clk_gl_cc_stage_17s1 
// 17  n2_clk_gl_cc_stage_8s2 
// 7   n2_clk_gl_cc_stage_4s4 
// 1   n2_clk_gl_cc_stg_c2b_s1_1 
// 6   n2_clk_gl_cc_stg_c1t_s1_0
// 8   n2_clk_gl_cc_stg_c1t_s4_0
// 9   n2_clk_gl_cc_stg_c1t_s4_1
// 10  n2_clk_gl_cc_stg_c1t_s4_2
// 11  n2_clk_gl_cc_stg_c1t_s1_1
// 12  n2_clk_gl_cc_stg_c1b_s4_0   
// 13  n2_clk_gl_cc_stg_c1b_s4_1
// 14  n2_clk_gl_cc_stg_c1b_s4_2
// 15  n2_clk_gl_cc_stg_c1b_s4_3
// 16  n2_clk_gl_cc_stg_c2b_s1_0
// 18  n2_clk_gl_cc_stg_c2b_s2_0
// 19  n2_clk_gl_cc_stg_c2b_s2_1
// 20  n2_clk_gl_cc_stg_c2t_s1_0
// 21  n2_clk_gl_cc_stg_c2t_s2_0
// 22  n2_clk_gl_cc_stg_c2t_s2_1
// 23  n2_clk_gl_cc_stg_c3t_s1_0
// 24  n2_clk_gl_cc_stg_c3t_s1_1
// 25  n2_clk_gl_cc_stg_c3t_s1_3 	
// 26  n2_clk_gl_cc_stg_c3t_s1_2
// 27  n2_clk_gl_cc_stg_c3b_s1_0 - connection errors (wires crossed)
// 28  n2_clk_gl_cc_stg_c3b_s1_1 - compilation errors here
// 29  n2_clk_gl_cc_stg_c3b_s1_3
// 30  n2_clk_gl_cc_stg_c3b_s1_2 - compilation errors here
// 31  n2_clk_gl_cc_stg_c1b_s1_0
// 32  n2_clk_gl_cc_stg_c1b_s1_1
// 33  n2_clk_gl_cc_stg_c2t_s1_1
// 35  n2_clk_gl_cc_stage_align 
// 36  n2_clk_gl_cc_stg_mcu_dr   - FOR INT6.1
 

// EDITS NEEDED
// input [2:2] stg3_l2t_clk_stop_in_c3b   -> stg3_l2t2_clk_stop_in_c3b 
// output [2:2] stg4_l2t_clk_stop_out_c3b -> stg4_l2t2_clk_stop_out_c3b 

// ADDITIONAL
// input ccu_vco_aligned
// output gclk_aligned 

// MAPPING FOR ALL OUTPUTS
// 
// gl_ccx_clk_stop;
// gl_cmp_io_sync_en_c1b;
// gl_cmp_io_sync_en_c1m;
// gl_cmp_io_sync_en_c1t;
// gl_cmp_io_sync_en_c2b;
// gl_cmp_io_sync_en_c2t;
// gl_cmp_io_sync_en_c3b;
// gl_cmp_io_sync_en_c3t0;
// gl_cmp_io_sync_en_c3t;
// gl_dmu_peu_por_c3b;
// gl_dmu_peu_wmr_c3b;
// gl_dr_sync_en_c1m;
// gl_dr_sync_en_c3t;
// gl_io2x_out_c1b;
// gl_io2x_sync_en_c1m;
// gl_io2x_sync_en_c3t0;
// gl_io2x_sync_en_c3t;
// gl_io2x_sync_en_in_c2b;
// gl_io_cmp_sync_en_c1b;
// gl_io_cmp_sync_en_c1m;
// gl_io_cmp_sync_en_c1t;
// gl_io_cmp_sync_en_c2b;
// gl_io_cmp_sync_en_c2t;
// gl_io_cmp_sync_en_c3b;
// gl_io_cmp_sync_en_c3t0;
// gl_io_cmp_sync_en_c3t;
// gl_io_out_c1b;
// gl_io_out_c1m;
// gl_io_out_c3b0;
// gl_io_out_c3b;
// gl_io_out_c3t;
// gl_l2_por_c1t;
// gl_l2_por_c2b;
// gl_l2_por_c2t;
// gl_l2_por_c3b0;
// gl_l2_por_c3b;
// gl_l2_por_c3t0;
// gl_l2_por_c3t;
// gl_l2_wmr_c1b;
// gl_l2_wmr_c1t;
// gl_l2_wmr_c2b;
// gl_l2_wmr_c2t;
// gl_l2_wmr_c3b;
// gl_l2_wmr_c3t0;
// gl_l2_wmr_c3t;
// gl_mio_clk_stop_c1t;
// gl_mio_clk_stop_c2t;
// gl_mio_clk_stop_c3t;
// gl_mio_io2x_sync_en_c1b;
// gl_mio_io2x_sync_en_c1t;
// gl_rst_l2_por_c1m;
// gl_rst_l2_wmr_c1m;
// gl_rst_mac_c1b;
// gl_rst_niu_wmr_c1b;



// ************************************************************************
// 1 module n2_clk_gl_cc_stg_c2b_s1_1 (8x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c2b_s1_1  (stg2_sii_clk_stop_in_c2b ,gclk_l2t7 ,
     stg2_ncu_clk_stop_in_c2b ,stg3_l2t7_clk_stop_out_c2b ,
     stg3_ccx_clk_stop_out_c2b ,stg3_sii_clk_stop_out_c2b ,
     stg3_ncu_clk_stop_out_c2b ,stg3_sii_io_clk_stop_out_c2b ,
     stg3_ncu_io_clk_stop_out_c2b ,stg3_dmu_io_clk_stop_out_c2b ,
     stg3_peu_io_clk_stop_out_c2b ,stg2_peu_io_clk_stop_in_c2b ,
     stg2_sii_io_clk_stop_in_c2b ,stg2_ncu_io_clk_stop_in_c2b ,
     stg2_dmu_io_clk_stop_in_c2b ,stg2_l2t7_clk_stop_in_c2b ,
     stg2_ccx_clk_stop_in_c2b );

input		gclk_l2t7 ;
input		stg2_ccx_clk_stop_in_c2b ;
input		stg2_dmu_io_clk_stop_in_c2b ;
input		stg2_l2t7_clk_stop_in_c2b ;
input		stg2_ncu_clk_stop_in_c2b ;
input		stg2_ncu_io_clk_stop_in_c2b ;
input		stg2_peu_io_clk_stop_in_c2b ;
input		stg2_sii_clk_stop_in_c2b ;
input		stg2_sii_io_clk_stop_in_c2b ;
output		stg3_ccx_clk_stop_out_c2b ;
output		stg3_dmu_io_clk_stop_out_c2b ;
output		stg3_l2t7_clk_stop_out_c2b ;
output		stg3_ncu_clk_stop_out_c2b ;
output		stg3_ncu_io_clk_stop_out_c2b ;
output		stg3_peu_io_clk_stop_out_c2b ;
output		stg3_sii_clk_stop_out_c2b ;
output		stg3_sii_io_clk_stop_out_c2b ;

wire 	[8:0]	unused;
 
n2_clk_gl_cc_stage_17s1 xc2b_s1_1  (
     .stg0_in          ( {9'b0,
	    stg2_ccx_clk_stop_in_c2b, stg2_dmu_io_clk_stop_in_c2b,
		stg2_l2t7_clk_stop_in_c2b, stg2_ncu_clk_stop_in_c2b,
		stg2_ncu_io_clk_stop_in_c2b, stg2_peu_io_clk_stop_in_c2b,
		stg2_sii_clk_stop_in_c2b, stg2_sii_io_clk_stop_in_c2b} ),
     .stg1_out         ( {unused,
		stg3_ccx_clk_stop_out_c2b, stg3_dmu_io_clk_stop_out_c2b,
		stg3_l2t7_clk_stop_out_c2b, stg3_ncu_clk_stop_out_c2b,
		stg3_ncu_io_clk_stop_out_c2b, stg3_peu_io_clk_stop_out_c2b,
		stg3_sii_clk_stop_out_c2b, stg3_sii_io_clk_stop_out_c2b} ),
     .gclk             (gclk_l2t7) );

endmodule


// ************************************************************************
// 2 module n2_clk_gl_cc_stage_ccu_m1 (special)
// ************************************************************************

module n2_clk_gl_exp (gclk_in ,gl_cmp_io_sync_en_c1m ,
     gl_io_out_c1m ,gl_io_cmp_sync_en_c1m ,stg1_io2x_out_out_c1b ,
     gl_io2x_sync_en_c1m ,ccu_cmp_io_sync_en ,ccu_io_out ,
     stg1_dr_sync_en_out_c1t ,stg1_io2x_sync_en_out_c1b ,
     stg1_cmp_io_sync_en_out_c1t ,stg1_io_cmp_sync_en_out_c1t ,
     stg1_io2x_sync_en_out_c1t ,ccu_io2x_sync_en ,gl_dr_sync_en_c1m ,
     stg1_cmp_io_sync_en_out_c1b ,stg1_io_out_out_c1t ,
     stg1_io_out_out_c1b ,stg1_io_cmp_sync_en_out_c1b ,
     ccu_io_cmp_sync_en ,ccu_dr_sync_en ,ccu_io2x_out );
input		ccu_cmp_io_sync_en ;
input		ccu_dr_sync_en ;
input		ccu_io2x_out ;
input		ccu_io2x_sync_en ;
input		ccu_io_cmp_sync_en ;
input		ccu_io_out ;
input		gclk_in ;
output		gl_cmp_io_sync_en_c1m ;
output		gl_dr_sync_en_c1m ;
output		gl_io2x_sync_en_c1m ;
output		gl_io_cmp_sync_en_c1m ;
output		gl_io_out_c1m ;
output		stg1_cmp_io_sync_en_out_c1b ;
output		stg1_cmp_io_sync_en_out_c1t ;
output		stg1_dr_sync_en_out_c1t ;
output		stg1_io2x_out_out_c1b ;
output		stg1_io2x_sync_en_out_c1b ;
output		stg1_io2x_sync_en_out_c1t ;
output		stg1_io_cmp_sync_en_out_c1b ;
output		stg1_io_cmp_sync_en_out_c1t ;
output		stg1_io_out_out_c1b ;
output		stg1_io_out_out_c1t ;

wire		stg1_cmp_io_sync_en_c1m ;
wire		stg1_dr_sync_en_c1m ;
wire		stg1_io2x_sync_en_c1m ;
wire		stg1_io_cmp_sync_en_c1m ;
wire		stg1_io_out_c1m ;

wire [1:0] 	unused0;
wire [2:0] 	unused1;

n2_clk_gl_cc_stage_17s1 xccu_m0_0  (
     .stg0_in          ( {2'b0, ccu_cmp_io_sync_en,
		ccu_cmp_io_sync_en, ccu_cmp_io_sync_en,
		ccu_dr_sync_en, ccu_dr_sync_en,
		ccu_io2x_out, ccu_io2x_sync_en,
		ccu_io2x_sync_en, ccu_io2x_sync_en,
		ccu_io_cmp_sync_en, ccu_io_cmp_sync_en,
		ccu_io_cmp_sync_en, ccu_io_out,
		ccu_io_out, ccu_io_out} ),
     .stg1_out         ( {unused0, stg1_cmp_io_sync_en_c1m,
		stg1_cmp_io_sync_en_out_c1b, stg1_cmp_io_sync_en_out_c1t,
		stg1_dr_sync_en_c1m, stg1_dr_sync_en_out_c1t,
		stg1_io2x_out_out_c1b, stg1_io2x_sync_en_c1m,
		stg1_io2x_sync_en_out_c1b, stg1_io2x_sync_en_out_c1t,
		stg1_io_cmp_sync_en_c1m, stg1_io_cmp_sync_en_out_c1b,
		stg1_io_cmp_sync_en_out_c1t, stg1_io_out_c1m,
		stg1_io_out_out_c1b, stg1_io_out_out_c1t} ),
     .gclk             (gclk_in) 
);


n2_clk_gl_cc_stage_4s4 xccu_m0_1  (
	.stg1_in	( 
		{stg1_cmp_io_sync_en_c1m, stg1_dr_sync_en_c1m,
		stg1_io2x_sync_en_c1m, stg1_io_cmp_sync_en_c1m} ),
	.stg5_out	( 
		{gl_cmp_io_sync_en_c1m, gl_dr_sync_en_c1m,
		gl_io2x_sync_en_c1m, gl_io_cmp_sync_en_c1m} ),
	.gclk		(gclk_in)
);


n2_clk_gl_cc_stage_4s4 xccu_m0_2  (
	.stg1_in	( {3'b0, stg1_io_out_c1m} ),
	.stg5_out	( {unused1, gl_io_out_c1m} ),
	.gclk		(gclk_in)
);


endmodule


// ************************************************************************
// 3 module n2_clk_gl_cc_stage_rst_m0 (special)
// ************************************************************************

module n2_clk_gl_cc_stage_rst_m0 (stg1_rst_l2_por_out_c1b ,
     stg1_dmu_peu_por_out_c1b ,gclk_in ,gl_rst_l2_por_c1m ,
     stg1_rst_l2_wmr_out_c1t ,stg1_rst_l2_wmr_out_c1b ,
     stg1_rst_niu_wmr_out_c1b ,stg1_dmu_peu_wmr_out_c1b ,rst_niu_mac_ ,
     rst_l2_por_ ,rst_l2_wmr_ ,stg1_rst_niu_mac_out_c1b ,
     rst_dmu_peu_por_ ,rst_dmu_peu_wmr_ ,stg1_rst_l2_por_out_c1t ,
     gl_rst_l2_wmr_c1m ,rst_niu_wmr_ );

input		gclk_in ;

input		rst_dmu_peu_por_ ;
input		rst_dmu_peu_wmr_ ;
input		rst_l2_por_ ;
input		rst_l2_wmr_ ;
input		rst_niu_mac_ ;
input		rst_niu_wmr_ ;

output		gl_rst_l2_por_c1m ;
output		gl_rst_l2_wmr_c1m ;

output		stg1_dmu_peu_por_out_c1b ;
output		stg1_dmu_peu_wmr_out_c1b ;
output		stg1_rst_l2_por_out_c1b ;
output		stg1_rst_l2_por_out_c1t ;
output		stg1_rst_l2_wmr_out_c1b ;
output		stg1_rst_l2_wmr_out_c1t ;
output		stg1_rst_niu_mac_out_c1b ;
output		stg1_rst_niu_wmr_out_c1b ;
 
wire		stg1_rst_l2_por_c1m ;
wire		stg1_rst_l2_wmr_c1m ;

wire [6:0] 	unused0;
wire [1:0] 	unused1;

n2_clk_gl_cc_stage_17s1 xrst_m0_0  (
	.stg0_in	( {7'b0, 
		rst_dmu_peu_por_, rst_dmu_peu_wmr_,
		rst_l2_por_, rst_l2_por_,
		rst_l2_wmr_, rst_l2_wmr_,
		rst_niu_mac_, rst_niu_wmr_,
		rst_l2_por_, rst_l2_wmr_} ),
	.stg1_out	( {unused0, 
		stg1_dmu_peu_por_out_c1b, stg1_dmu_peu_wmr_out_c1b,
		stg1_rst_l2_por_out_c1b, stg1_rst_l2_por_out_c1t,
		stg1_rst_l2_wmr_out_c1b, stg1_rst_l2_wmr_out_c1t,
		stg1_rst_niu_mac_out_c1b, stg1_rst_niu_wmr_out_c1b,
		stg1_rst_l2_por_c1m, stg1_rst_l2_wmr_c1m} ),
	.gclk		(gclk_in)
);

n2_clk_gl_cc_stage_4s4 xrst_m0_1  (
	.stg1_in	( {2'b0, stg1_rst_l2_por_c1m, stg1_rst_l2_wmr_c1m} ),
	.stg5_out	( {unused1, gl_rst_l2_por_c1m, gl_rst_l2_wmr_c1m} ),
	.gclk		(gclk_in)
);

endmodule


// ************************************************************************
// 4 module n2_clk_gl_cc_stage_tcu_m0 (special)
// ************************************************************************

module n2_clk_gl_cc_stage_tcu_m0 (stg1_peu_io_clk_stop_out_c1b ,
     gl_l2t4_clk_stop ,tcu_mcu1_clk_stop ,gl_ccu_io_clk_stop ,
     gl_sio_clk_stop ,gl_sio_io_clk_stop ,gl_db1_clk_stop ,
     gl_rst_clk_stop ,gl_rst_io_clk_stop ,gl_efu_clk_stop ,
     stg1_l2t3_clk_stop_out_c1b ,tcu_l2t5_clk_stop ,tcu_l2t7_clk_stop ,
     stg1_ncu_clk_stop_out_c1b ,gl_mcu2_dr_clk_stop ,
     stg1_l2t1_clk_stop_out_c1t ,tcu_spc1_clk_stop ,tcu_sii_clk_stop ,
     tcu_ncu_io_clk_stop ,tcu_sii_io_clk_stop ,tcu_ncu_clk_stop ,
     tcu_db0_clk_stop ,gl_l2d6_clk_stop ,gl_l2t6_clk_stop ,
     stg1_l2t7_clk_stop_out_c1b ,stg1_sii_io_clk_stop_out_c1b ,
     stg1_l2d0_clk_stop_out_c1t ,stg1_ccx_clk_stop_out_c1b ,
     stg1_rtx_io_clk_stop_out_c1b ,gclk_in ,tcu_mcu2_io_clk_stop ,
     gl_efu_io_clk_stop ,tcu_mcu0_clk_stop ,stg1_mio_clk_stop_out_c1t ,
     stg1_l2t2_clk_stop_out_c1b ,stg1_mcu1_clk_stop_out_c1t ,
     stg1_ncu_io_clk_stop_out_c1b ,tcu_ccu_clk_stop ,tcu_ccu_io_clk_stop
      ,tcu_efu_io_clk_stop ,tcu_l2b6_clk_stop ,tcu_l2t6_clk_stop ,
     tcu_rst_clk_stop ,tcu_rst_io_clk_stop ,tcu_efu_clk_stop ,
     tcu_sio_clk_stop ,tcu_sio_io_clk_stop ,tcu_db1_clk_stop ,
     tcu_peu_io_clk_stop ,stg1_db0_clk_stop_out_c1b ,tcu_ccx_clk_stop ,
     tcu_spc0_clk_stop ,tcu_spc2_clk_stop ,stg1_mcu1_dr_clk_stop_out_c1t
      ,tcu_spc3_clk_stop ,tcu_spc4_clk_stop ,tcu_spc5_clk_stop ,
     tcu_spc6_clk_stop ,tcu_spc7_clk_stop ,tcu_mcu2_clk_stop ,
     tcu_mcu3_io_clk_stop ,tcu_mcu3_dr_clk_stop ,tcu_l2t0_clk_stop ,
     gl_mcu2_clk_stop ,tcu_l2t3_clk_stop ,tcu_l2t2_clk_stop ,
     tcu_l2t1_clk_stop ,tcu_l2d0_clk_stop ,tcu_l2d1_clk_stop ,
     tcu_l2d2_clk_stop ,tcu_l2d3_clk_stop ,tcu_l2d4_clk_stop ,
     tcu_l2d5_clk_stop ,tcu_l2d7_clk_stop ,tcu_l2b0_clk_stop ,
     tcu_l2b1_clk_stop ,tcu_l2b2_clk_stop ,tcu_l2b3_clk_stop ,
     tcu_l2b4_clk_stop ,tcu_l2b5_clk_stop ,tcu_mcu0_io_clk_stop ,
     tcu_mcu1_io_clk_stop ,tcu_mcu0_dr_clk_stop ,tcu_mcu1_dr_clk_stop ,
     gl_ccu_clk_stop ,stg1_spc1_clk_stop_out_c1t ,tcu_mac_io_clk_stop ,
     tcu_tds_io_clk_stop ,tcu_rtx_io_clk_stop ,tcu_rdp_io_clk_stop ,
     stg1_spc2_clk_stop_out_c1b ,gl_l2b6_clk_stop ,
     stg1_spc3_clk_stop_out_c1b ,stg1_spc4_clk_stop_out_c1t ,
     stg1_spc5_clk_stop_out_c1t ,gl_l2b7_clk_stop ,gl_mcu3_clk_stop ,
     tcu_mcu3_clk_stop ,tcu_l2b7_clk_stop ,tcu_l2d6_clk_stop ,
     tcu_l2t4_clk_stop ,stg1_spc6_clk_stop_out_c1b ,
     stg1_spc7_clk_stop_out_c1b ,stg1_l2t0_clk_stop_out_c1t ,
     tcu_dmu_io_clk_stop ,stg1_l2t5_clk_stop_out_c1t ,
     stg1_l2d1_clk_stop_out_c1t ,stg1_l2d2_clk_stop_out_c1b ,
     stg1_l2d3_clk_stop_out_c1b ,stg1_l2d4_clk_stop_out_c1t ,
     stg1_l2d5_clk_stop_out_c1t ,stg1_l2d7_clk_stop_out_c1b ,
     stg1_l2b0_clk_stop_out_c1t ,stg1_sii_clk_stop_out_c1b ,
     stg1_l2b1_clk_stop_out_c1t ,stg1_l2b2_clk_stop_out_c1b ,
     stg1_l2b3_clk_stop_out_c1b ,stg1_l2b4_clk_stop_out_c1t ,
     stg1_l2b5_clk_stop_out_c1t ,stg1_mcu0_clk_stop_out_c1t ,
     stg1_spc0_clk_stop_out_c1t ,stg1_mcu1_io_clk_stop_out_c1t ,
     stg1_mcu0_dr_clk_stop_out_c1t ,stg1_rdp_io_clk_stop_out_c1b ,
     stg1_tds_io_clk_stop_out_c1b ,stg1_mac_io_clk_stop_out_c1b ,
     stg1_dmu_io_clk_stop_out_c1b ,stg1_mcu0_io_clk_stop_out_c1t ,
     tcu_mio_clk_stop ,gl_mcu2_io_clk_stop ,tcu_mcu2_dr_clk_stop ,
     gl_mcu3_io_clk_stop ,gl_mcu3_dr_clk_stop, dr_gclk_in );

input		gclk_in ;
input 		dr_gclk_in; 		// FOR INT6.1
input		tcu_ccu_clk_stop ;
input		tcu_ccu_io_clk_stop ;
input		tcu_ccx_clk_stop ;
input		tcu_db0_clk_stop ;
input		tcu_db1_clk_stop ;
input		tcu_dmu_io_clk_stop ;
input		tcu_efu_clk_stop ;
input		tcu_efu_io_clk_stop ;
input		tcu_l2b0_clk_stop ;
input		tcu_l2b1_clk_stop ;
input		tcu_l2b2_clk_stop ;
input		tcu_l2b3_clk_stop ;
input		tcu_l2b4_clk_stop ;
input		tcu_l2b5_clk_stop ;
input		tcu_l2b6_clk_stop ;
input		tcu_l2b7_clk_stop ;
input		tcu_l2d0_clk_stop ;
input		tcu_l2d1_clk_stop ;
input		tcu_l2d2_clk_stop ;
input		tcu_l2d3_clk_stop ;
input		tcu_l2d4_clk_stop ;
input		tcu_l2d5_clk_stop ;
input		tcu_l2d7_clk_stop ;
input		tcu_l2d6_clk_stop ;
input		tcu_l2t0_clk_stop ;
input		tcu_l2t1_clk_stop ;
input		tcu_l2t2_clk_stop ;
input		tcu_l2t3_clk_stop ;
input		tcu_l2t4_clk_stop ;
input		tcu_l2t5_clk_stop ;
input		tcu_l2t6_clk_stop ;
input		tcu_l2t7_clk_stop ;
input		tcu_mac_io_clk_stop ;
input		tcu_mcu0_clk_stop ;
input		tcu_mcu0_dr_clk_stop ;
input		tcu_mcu0_io_clk_stop ;
input		tcu_mcu1_clk_stop ;
input		tcu_mcu1_dr_clk_stop ;
input		tcu_mcu1_io_clk_stop ;
input		tcu_mcu2_clk_stop ;
input		tcu_mcu2_dr_clk_stop ;
input		tcu_mcu2_io_clk_stop ;
input		tcu_mcu3_clk_stop ;
input		tcu_mcu3_dr_clk_stop ;
input		tcu_mcu3_io_clk_stop ;
input		tcu_mio_clk_stop ;
input		tcu_ncu_clk_stop ;
input		tcu_ncu_io_clk_stop ;
input		tcu_peu_io_clk_stop ;
input		tcu_rdp_io_clk_stop ;
input		tcu_rst_clk_stop ;
input		tcu_rst_io_clk_stop ;
input		tcu_rtx_io_clk_stop ;
input		tcu_sii_clk_stop ;
input		tcu_sii_io_clk_stop ;
input		tcu_sio_clk_stop ;
input		tcu_sio_io_clk_stop ;
input		tcu_spc0_clk_stop ;
input		tcu_spc1_clk_stop ;
input		tcu_spc2_clk_stop ;
input		tcu_spc3_clk_stop ;
input		tcu_spc4_clk_stop ;
input		tcu_spc5_clk_stop ;
input		tcu_spc6_clk_stop ;
input		tcu_spc7_clk_stop ;
input		tcu_tds_io_clk_stop ;

output		gl_ccu_clk_stop ;
output		gl_ccu_io_clk_stop ;
output		gl_db1_clk_stop ;
output		gl_efu_clk_stop ;
output		gl_efu_io_clk_stop ;
output		gl_l2b6_clk_stop ;
output		gl_l2b7_clk_stop ;
output		gl_l2d6_clk_stop ;
output		gl_l2t4_clk_stop ;
output		gl_l2t6_clk_stop ;
output		gl_mcu2_clk_stop ;
output		gl_mcu2_dr_clk_stop ;
output		gl_mcu2_io_clk_stop ;
output		gl_mcu3_clk_stop ;
output		gl_mcu3_dr_clk_stop ;
output		gl_mcu3_io_clk_stop ;
output		gl_rst_clk_stop ;
output		gl_rst_io_clk_stop ;
output		gl_sio_clk_stop ;
output		gl_sio_io_clk_stop ;


output		stg1_ccx_clk_stop_out_c1b ;
output		stg1_db0_clk_stop_out_c1b ;
output		stg1_dmu_io_clk_stop_out_c1b ;
output		stg1_l2b0_clk_stop_out_c1t ;
output		stg1_l2b1_clk_stop_out_c1t ;
output		stg1_l2b2_clk_stop_out_c1b ;
output		stg1_l2b3_clk_stop_out_c1b ;
output		stg1_l2b4_clk_stop_out_c1t ;
output		stg1_l2b5_clk_stop_out_c1t ;
output		stg1_l2d0_clk_stop_out_c1t ;
output		stg1_l2d1_clk_stop_out_c1t ;
output		stg1_l2d2_clk_stop_out_c1b ;
output		stg1_l2d3_clk_stop_out_c1b ;
output		stg1_l2d4_clk_stop_out_c1t ;
output		stg1_l2d5_clk_stop_out_c1t ;
output		stg1_l2d7_clk_stop_out_c1b ;
output		stg1_l2t0_clk_stop_out_c1t ;
output		stg1_l2t1_clk_stop_out_c1t ;
output		stg1_l2t2_clk_stop_out_c1b ;
output		stg1_l2t3_clk_stop_out_c1b ;
output		stg1_l2t5_clk_stop_out_c1t ;
output		stg1_l2t7_clk_stop_out_c1b ;
output		stg1_mac_io_clk_stop_out_c1b ;
output		stg1_mcu0_clk_stop_out_c1t ;
output		stg1_mcu0_dr_clk_stop_out_c1t ; 
output		stg1_mcu0_io_clk_stop_out_c1t ;
output		stg1_mcu1_clk_stop_out_c1t ;
output		stg1_mcu1_dr_clk_stop_out_c1t ; 
output		stg1_mcu1_io_clk_stop_out_c1t ;
output		stg1_mio_clk_stop_out_c1t ;
output		stg1_ncu_clk_stop_out_c1b ;
output		stg1_ncu_io_clk_stop_out_c1b ;
output		stg1_peu_io_clk_stop_out_c1b ;
output		stg1_rdp_io_clk_stop_out_c1b ;
output		stg1_rtx_io_clk_stop_out_c1b ;
output		stg1_sii_clk_stop_out_c1b ;
output		stg1_sii_io_clk_stop_out_c1b ;
output		stg1_spc0_clk_stop_out_c1t ;
output		stg1_spc1_clk_stop_out_c1t ;
output		stg1_spc2_clk_stop_out_c1b ;
output		stg1_spc3_clk_stop_out_c1b ;
output		stg1_spc4_clk_stop_out_c1t ;
output		stg1_spc5_clk_stop_out_c1t ;
output		stg1_spc6_clk_stop_out_c1b ;
output		stg1_spc7_clk_stop_out_c1b ;
output		stg1_tds_io_clk_stop_out_c1b ;


wire		stg1_ccu_clk_stop ;
wire		stg1_ccu_io_clk_stop ;
wire		stg1_db1_clk_stop ;
wire		stg1_efu_clk_stop ;
wire		stg1_efu_io_clk_stop ;
wire		stg1_l2b6_clk_stop ;
wire		stg1_l2b7_clk_stop ;
wire		stg1_l2d6_clk_stop ;
wire		stg1_l2t4_clk_stop ;
wire		stg1_l2t6_clk_stop ;
wire		stg1_mcu2_clk_stop ;
wire		stg1_mcu2_dr_clk_stop ;
wire		stg1_mcu2_io_clk_stop ;
wire		stg1_mcu3_clk_stop ;
wire		stg1_mcu3_dr_clk_stop ;
wire		stg1_mcu3_io_clk_stop ;
wire		stg1_rst_clk_stop ;
wire		stg1_rst_io_clk_stop ;
wire		stg1_sio_clk_stop ;
wire		stg1_sio_io_clk_stop ;

wire [1:0] unused;
wire [1:0] unused_1;
wire [1:0] unused_2;
wire unused_3;
wire unused_4;
wire [1:0] unused_5;
wire [12:0] unused_6;
wire [5:0] unused_7;


// ordered pairs (set 0)
n2_clk_gl_cc_stage_17s1 xtcu_m0_0  (
	.stg1_out ( {stg1_ccx_clk_stop_out_c1b,
		stg1_db0_clk_stop_out_c1b, stg1_dmu_io_clk_stop_out_c1b,
		stg1_l2b0_clk_stop_out_c1t, stg1_l2b1_clk_stop_out_c1t,
		stg1_l2b2_clk_stop_out_c1b, stg1_l2b3_clk_stop_out_c1b,
		stg1_l2b4_clk_stop_out_c1t, stg1_l2b5_clk_stop_out_c1t,
		stg1_l2d0_clk_stop_out_c1t, stg1_l2d1_clk_stop_out_c1t,
		stg1_l2d2_clk_stop_out_c1b, stg1_l2d3_clk_stop_out_c1b,
		stg1_l2d4_clk_stop_out_c1t, stg1_l2d5_clk_stop_out_c1t,
		stg1_l2d7_clk_stop_out_c1b, stg1_l2t0_clk_stop_out_c1t} ),
	.stg0_in ( {tcu_ccx_clk_stop,
		tcu_db0_clk_stop, tcu_dmu_io_clk_stop,
		tcu_l2b0_clk_stop, tcu_l2b1_clk_stop,
		tcu_l2b2_clk_stop, tcu_l2b3_clk_stop,
		tcu_l2b4_clk_stop, tcu_l2b5_clk_stop,
		tcu_l2d0_clk_stop, tcu_l2d1_clk_stop,
		tcu_l2d2_clk_stop, tcu_l2d3_clk_stop,
		tcu_l2d4_clk_stop, tcu_l2d5_clk_stop,
		tcu_l2d7_clk_stop, tcu_l2t0_clk_stop} ),
	.gclk (gclk_in)
);

// ordered pairs (set 1)
n2_clk_gl_cc_stage_17s1 xtcu_m0_1  (
	.stg1_out ( {unused_5, stg1_l2t1_clk_stop_out_c1t,
		stg1_l2t2_clk_stop_out_c1b, stg1_l2t3_clk_stop_out_c1b,
		stg1_l2t5_clk_stop_out_c1t, stg1_l2t7_clk_stop_out_c1b,
		stg1_mac_io_clk_stop_out_c1b, stg1_mcu0_clk_stop_out_c1t,
		// stg1_mcu0_dr_clk_stop_out_c1t, 
		stg1_mcu0_io_clk_stop_out_c1t,
		stg1_mcu1_clk_stop_out_c1t, // stg1_mcu1_dr_clk_stop_out_c1t,
		stg1_mcu1_io_clk_stop_out_c1t, stg1_mio_clk_stop_out_c1t,
		stg1_ncu_clk_stop_out_c1b, stg1_ncu_io_clk_stop_out_c1b,
		stg1_peu_io_clk_stop_out_c1b, stg1_rdp_io_clk_stop_out_c1b} ),
	.stg0_in ( {2'b0, tcu_l2t1_clk_stop,
		tcu_l2t2_clk_stop, tcu_l2t3_clk_stop,
		tcu_l2t5_clk_stop, tcu_l2t7_clk_stop,
		tcu_mac_io_clk_stop, tcu_mcu0_clk_stop,
		// tcu_mcu0_dr_clk_stop, 
		tcu_mcu0_io_clk_stop,
		tcu_mcu1_clk_stop, // tcu_mcu1_dr_clk_stop,
		tcu_mcu1_io_clk_stop, tcu_mio_clk_stop,
		tcu_ncu_clk_stop, tcu_ncu_io_clk_stop,
		tcu_peu_io_clk_stop, tcu_rdp_io_clk_stop} ),
	.gclk (gclk_in) 
);


// ordered pairs (set 2) - last 5 will be finalized
n2_clk_gl_cc_stage_17s1 xtcu_m0_2  (
	.stg1_out ({stg1_rtx_io_clk_stop_out_c1b,
		stg1_sii_clk_stop_out_c1b, stg1_sii_io_clk_stop_out_c1b,
		stg1_spc0_clk_stop_out_c1t, stg1_spc1_clk_stop_out_c1t,
		stg1_spc2_clk_stop_out_c1b, stg1_spc3_clk_stop_out_c1b,
		stg1_spc4_clk_stop_out_c1t, stg1_spc5_clk_stop_out_c1t,
		stg1_spc6_clk_stop_out_c1b, stg1_spc7_clk_stop_out_c1b,
		stg1_tds_io_clk_stop_out_c1b, stg1_ccu_clk_stop,
		stg1_ccu_io_clk_stop, stg1_db1_clk_stop,
		stg1_efu_clk_stop, stg1_efu_io_clk_stop} ),
	.stg0_in ({tcu_rtx_io_clk_stop,
		tcu_sii_clk_stop, tcu_sii_io_clk_stop,
		tcu_spc0_clk_stop, tcu_spc1_clk_stop,
		tcu_spc2_clk_stop, tcu_spc3_clk_stop,
		tcu_spc4_clk_stop, tcu_spc5_clk_stop,
		tcu_spc6_clk_stop, tcu_spc7_clk_stop,
		tcu_tds_io_clk_stop, tcu_ccu_clk_stop,
		tcu_ccu_io_clk_stop, tcu_db1_clk_stop,
		tcu_efu_clk_stop, tcu_efu_io_clk_stop} ),
	.gclk (gclk_in)
);


// ordered pairs (set 3)
n2_clk_gl_cc_stage_17s1 xtcu_m0_3  (
	.stg1_out ({unused, unused_1, stg1_l2b6_clk_stop,
		stg1_l2b7_clk_stop, stg1_l2d6_clk_stop,
		stg1_l2t4_clk_stop, stg1_l2t6_clk_stop,
		stg1_mcu2_clk_stop, // stg1_mcu2_dr_clk_stop,
		stg1_mcu2_io_clk_stop, stg1_mcu3_clk_stop,
		// stg1_mcu3_dr_clk_stop, 
		stg1_mcu3_io_clk_stop,
		stg1_rst_clk_stop, stg1_rst_io_clk_stop,
		stg1_sio_clk_stop, stg1_sio_io_clk_stop} ),
	.stg0_in ({4'b0, tcu_l2b6_clk_stop,
		tcu_l2b7_clk_stop, tcu_l2d6_clk_stop,
		tcu_l2t4_clk_stop, tcu_l2t6_clk_stop,
		tcu_mcu2_clk_stop, // tcu_mcu2_dr_clk_stop,
		tcu_mcu2_io_clk_stop, tcu_mcu3_clk_stop,
		// tcu_mcu3_dr_clk_stop, 
		tcu_mcu3_io_clk_stop,
		tcu_rst_clk_stop, tcu_rst_io_clk_stop,
		tcu_sio_clk_stop, tcu_sio_io_clk_stop} ),
	.gclk (gclk_in)
);


// ordered pairs (set 4)
n2_clk_gl_cc_stage_4s4  xtcu_m0_4  (
	.stg1_in ({
		stg1_ccu_clk_stop, stg1_ccu_io_clk_stop,
		stg1_db1_clk_stop, stg1_efu_clk_stop}),
	.stg5_out ({
		gl_ccu_clk_stop, gl_ccu_io_clk_stop,
		gl_db1_clk_stop, gl_efu_clk_stop}),
	.gclk (gclk_in)
);

// ordered pairs (set 5)
n2_clk_gl_cc_stage_4s4  xtcu_m0_5  (
	.stg1_in ({
		stg1_efu_io_clk_stop, stg1_l2b6_clk_stop,
		stg1_l2b7_clk_stop, stg1_l2d6_clk_stop}),
	.stg5_out ({
		gl_efu_io_clk_stop, gl_l2b6_clk_stop,
		gl_l2b7_clk_stop, gl_l2d6_clk_stop}),
	.gclk (gclk_in)
);


// ordered pairs (set 6)
n2_clk_gl_cc_stage_4s4  xtcu_m0_6  (
	.stg1_in ({1'b0,
		stg1_l2t4_clk_stop, stg1_l2t6_clk_stop,
		stg1_mcu2_clk_stop // , stg1_mcu2_dr_clk_stop
	}),
	.stg5_out ({unused_3, 
		gl_l2t4_clk_stop, gl_l2t6_clk_stop,
		gl_mcu2_clk_stop // , gl_mcu2_dr_clk_stop
	}),
	.gclk (gclk_in)
);


// ordered pairs (set 7)
n2_clk_gl_cc_stage_4s4  xtcu_m0_7  (
	.stg1_in ({ 1'b0,
		stg1_mcu2_io_clk_stop, stg1_mcu3_clk_stop,
		// stg1_mcu3_dr_clk_stop, 
		stg1_mcu3_io_clk_stop}),
	.stg5_out ({ unused_4,
		gl_mcu2_io_clk_stop, gl_mcu3_clk_stop,
		// gl_mcu3_dr_clk_stop, 
		gl_mcu3_io_clk_stop}),
	.gclk (gclk_in)
);

// ordered pairs (set 8)
n2_clk_gl_cc_stage_4s4  xtcu_m0_8  (
	.stg1_in ({
		stg1_rst_clk_stop, stg1_rst_io_clk_stop,
		stg1_sio_clk_stop, stg1_sio_io_clk_stop}),
	.stg5_out ({
		gl_rst_clk_stop, gl_rst_io_clk_stop,
		gl_sio_clk_stop, gl_sio_io_clk_stop}),
	.gclk (gclk_in)
);


// ordered pairs (set 9) -- FOR INT6.1 // stage 4 dr_stop signals once
n2_clk_gl_cc_stage_17s1  xtcu_m0_9  (
	.gclk (dr_gclk_in),
	.stg0_in  ({13'b0,   tcu_mcu0_dr_clk_stop,  tcu_mcu1_dr_clk_stop,  
						 tcu_mcu2_dr_clk_stop,  tcu_mcu3_dr_clk_stop}),
	.stg1_out ({unused_6,stg1_mcu0_dr_clk_stop_out_c1t, stg1_mcu1_dr_clk_stop_out_c1t, 
						 stg1_mcu2_dr_clk_stop, stg1_mcu3_dr_clk_stop})
);

// ordered pairs (set 10) -- FOR INT6.1 // stage 2 dr_stop signals twice 
n2_clk_gl_cc_stage_8s2  xtcu_m0_10  (
	.gclk (dr_gclk_in),
	.stg3_in  ({6'b0,    stg1_mcu2_dr_clk_stop, stg1_mcu3_dr_clk_stop}),
	.stg5_out ({unused_7, gl_mcu2_dr_clk_stop,   gl_mcu3_dr_clk_stop})
);


endmodule


// ************************************************************************
// 5 module n2_clk_gl_cc_stage_17s1  (17x1)
// ************************************************************************

module n2_clk_gl_cc_stage_17s1 (stg0_in ,stg1_out ,gclk );
output [16:0]	stg1_out ;
input  [16:0]	stg0_in ;
input		gclk ;

wire  [16:0]	stg1_out ;
wire  [16:0]	stg0_in ;
wire			gclk ;

reg  [16:0]	q1;

always @(posedge gclk) begin
	q1 <= stg0_in;
end 

//ifdef FLOP_STAGES_ON
	assign stg1_out = q1;
//else
//	assign stg1_out = stg0_in;
//endif


endmodule



// ************************************************************************
// 6 module n2_clk_gl_cc_stg_c1t_s1_0  (17x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c1t_s1_0 (stg2_l2_por_out_c1t ,
     stg2_l2b1_clk_stop_out_c1t ,stg2_l2t0_clk_stop_out_c1t ,
     stg2_spc5_clk_stop_out_c1t ,stg2_spc0_clk_stop_out_c1t ,
     stg2_dr_sync_en_out_c1t ,stg2_mio_io2x_sync_en_out_c1t ,
     stg2_l2_wmr_out_c1t ,stg2_cmp_io_sync_en_out_c1t ,
     stg2_spc1_clk_stop_out_c1t ,stg1_spc5_clk_stop_in_c1t ,
     stg2_io_cmp_sync_en_out_c1t ,stg2_io_out_out_c1t ,gclk_l2b5 ,
     stg2_l2t1_clk_stop_out_c1t ,stg2_l2t5_clk_stop_out_c1t ,
     stg2_l2b0_clk_stop_out_c1t ,stg2_l2d1_clk_stop_out_c1t ,
     stg2_l2d0_clk_stop_out_c1t ,stg1_l2b1_clk_stop_in_c1t ,
     stg1_cmp_io_sync_en_in_c1t ,stg1_mio_io2x_sync_en_in_c1t ,
     stg1_l2_wmr_in_c1t ,stg1_l2_por_in_c1t ,stg1_spc1_clk_stop_in_c1t ,
     stg1_l2b0_clk_stop_in_c1t ,stg1_l2t5_clk_stop_in_c1t ,
     stg1_l2t1_clk_stop_in_c1t ,stg1_l2d1_clk_stop_in_c1t ,
     stg1_io_cmp_sync_en_in_c1t ,stg1_io_out_in_c1t ,
     stg1_l2d0_clk_stop_in_c1t ,stg1_l2t0_clk_stop_in_c1t ,
     stg1_dr_sync_en_in_c1t ,stg1_spc0_clk_stop_in_c1t );



input		gclk_l2b5 ;
input		stg1_cmp_io_sync_en_in_c1t ;
input		stg1_dr_sync_en_in_c1t ;
input		stg1_io_cmp_sync_en_in_c1t ;
input		stg1_io_out_in_c1t ;
input		stg1_l2_por_in_c1t ;
input		stg1_l2_wmr_in_c1t ;
input		stg1_l2b0_clk_stop_in_c1t ;
input		stg1_l2b1_clk_stop_in_c1t ;
input		stg1_l2d0_clk_stop_in_c1t ;
input		stg1_l2d1_clk_stop_in_c1t ;
input		stg1_l2t0_clk_stop_in_c1t ;
input		stg1_l2t1_clk_stop_in_c1t ;
input		stg1_l2t5_clk_stop_in_c1t ;
input		stg1_mio_io2x_sync_en_in_c1t ;
input		stg1_spc0_clk_stop_in_c1t ;
input		stg1_spc1_clk_stop_in_c1t ;
input		stg1_spc5_clk_stop_in_c1t ;
output		stg2_cmp_io_sync_en_out_c1t ;
output		stg2_dr_sync_en_out_c1t ;
output		stg2_io_cmp_sync_en_out_c1t ;
output		stg2_io_out_out_c1t ;
output		stg2_l2_por_out_c1t ;
output		stg2_l2_wmr_out_c1t ;
output		stg2_l2b0_clk_stop_out_c1t ;
output		stg2_l2b1_clk_stop_out_c1t ;
output		stg2_l2d0_clk_stop_out_c1t ;
output		stg2_l2d1_clk_stop_out_c1t ;
output		stg2_l2t0_clk_stop_out_c1t ;
output		stg2_l2t1_clk_stop_out_c1t ;
output		stg2_l2t5_clk_stop_out_c1t ;
output		stg2_mio_io2x_sync_en_out_c1t ;
output		stg2_spc0_clk_stop_out_c1t ;
output		stg2_spc1_clk_stop_out_c1t ;
output		stg2_spc5_clk_stop_out_c1t ;
 
 
 
n2_clk_gl_cc_stage_17s1 xc1t_s1_0  (
     .stg0_in          ({stg1_l2t5_clk_stop_in_c1t ,
            stg1_l2t1_clk_stop_in_c1t ,stg1_l2t0_clk_stop_in_c1t ,
            stg1_l2b1_clk_stop_in_c1t ,stg1_l2b0_clk_stop_in_c1t ,
            stg1_l2d1_clk_stop_in_c1t ,stg1_l2d0_clk_stop_in_c1t ,
            stg1_spc5_clk_stop_in_c1t ,stg1_spc1_clk_stop_in_c1t ,
            stg1_spc0_clk_stop_in_c1t ,stg1_l2_por_in_c1t ,
            stg1_l2_wmr_in_c1t ,stg1_io_out_in_c1t ,
            stg1_dr_sync_en_in_c1t ,stg1_mio_io2x_sync_en_in_c1t ,
            stg1_io_cmp_sync_en_in_c1t ,stg1_cmp_io_sync_en_in_c1t } ),
     .stg1_out         ({stg2_l2t5_clk_stop_out_c1t ,
            stg2_l2t1_clk_stop_out_c1t ,stg2_l2t0_clk_stop_out_c1t ,
            stg2_l2b1_clk_stop_out_c1t ,stg2_l2b0_clk_stop_out_c1t ,
            stg2_l2d1_clk_stop_out_c1t ,stg2_l2d0_clk_stop_out_c1t ,
            stg2_spc5_clk_stop_out_c1t ,stg2_spc1_clk_stop_out_c1t ,
            stg2_spc0_clk_stop_out_c1t ,stg2_l2_por_out_c1t ,
            stg2_l2_wmr_out_c1t ,stg2_io_out_out_c1t ,
            stg2_dr_sync_en_out_c1t ,stg2_mio_io2x_sync_en_out_c1t ,
            stg2_io_cmp_sync_en_out_c1t ,stg2_cmp_io_sync_en_out_c1t } )
,
     .gclk             (gclk_l2b5 ) );
endmodule



// ************************************************************************
// 7 module n2_clk_gl_cc_stage_4s4 (4x4)
// ************************************************************************

module n2_clk_gl_cc_stage_4s4 (stg1_in ,stg5_out ,gclk );

output [3:0]	stg5_out ;
input [3:0]	stg1_in ;
input		gclk ;

wire [3:0]	stg5_out ;
wire [3:0]	stg1_in ;
wire		gclk ;

reg  [3:0] q1;
reg  [3:0] q2;
reg  [3:0] q3;
reg  [3:0] q4;

always @(posedge gclk) begin
	q1 <= stg1_in;
	q2 <= q1; 
	q3 <= q2; 
	q4 <= q3; 
end

//ifdef FLOP_STAGES_ON
    assign stg5_out = q4;
//else
//    assign stg5_out = stg1_in;
//endif


endmodule



// ************************************************************************
// 8 module n2_clk_gl_cc_stg_c1t_s4_0 (4x4)
// ************************************************************************
 
module n2_clk_gl_cc_stg_c1t_s4_0 (gl_mio_io2x_sync_en_c1t ,gl_l2_wmr_c1t
      ,stg1_io_cmp_sync_en_in_c1t ,stg1_cmp_io_sync_en_in_c1t,
     stg1_mio_io2x_sync_en_in_c1t,stg1_l2_wmr_in_c1t ,
     gl_io_cmp_sync_en_c1t ,gclk_spc4 ,gl_cmp_io_sync_en_c1t );



input		gclk_spc4 ;
input		stg1_cmp_io_sync_en_in_c1t;
input		stg1_io_cmp_sync_en_in_c1t ;
input		stg1_l2_wmr_in_c1t ;
input		stg1_mio_io2x_sync_en_in_c1t;
output		gl_cmp_io_sync_en_c1t ;
output		gl_io_cmp_sync_en_c1t ;
output		gl_l2_wmr_c1t ;
output		gl_mio_io2x_sync_en_c1t ;

 
n2_clk_gl_cc_stage_4s4 x6  (
     .stg1_in  ({stg1_l2_wmr_in_c1t ,stg1_mio_io2x_sync_en_in_c1t,
	 			 stg1_io_cmp_sync_en_in_c1t ,stg1_cmp_io_sync_en_in_c1t} ),
     .stg5_out ({gl_l2_wmr_c1t ,gl_mio_io2x_sync_en_c1t, 
	 		     gl_io_cmp_sync_en_c1t ,gl_cmp_io_sync_en_c1t } ),
     .gclk             (gclk_spc4 ) );
endmodule



// ************************************************************************
// 9 module n2_clk_gl_cc_stg_c1t_s4_1 (3x4)
// ************************************************************************

module n2_clk_gl_cc_stg_c1t_s4_1 (gl_l2d4_clk_stop ,gclk_l2b4 ,
     stg1_l2_por_in_c1t ,stg1_l2d4_clk_stop_in_c1t ,gl_l2_por_c1t ,
     stg1_l2b4_clk_stop_in_c1t ,gl_l2b4_clk_stop, stg1_spc4_clk_stop_in_c1t, gl_spc4_clk_stop  );



input		gclk_l2b4 ;
input 		stg1_spc4_clk_stop_in_c1t ;
input		stg1_l2_por_in_c1t ;
input		stg1_l2b4_clk_stop_in_c1t ;
input		stg1_l2d4_clk_stop_in_c1t ;
output		gl_spc4_clk_stop ;
output		gl_l2_por_c1t ;
output		gl_l2b4_clk_stop ;
output		gl_l2d4_clk_stop ;
 
 
n2_clk_gl_cc_stage_4s4 xc1t_s4_1  (
     .stg1_in          ({stg1_spc4_clk_stop_in_c1t, stg1_l2b4_clk_stop_in_c1t ,
            stg1_l2d4_clk_stop_in_c1t ,stg1_l2_por_in_c1t } ),
     .stg5_out         ({gl_spc4_clk_stop,gl_l2b4_clk_stop ,
            gl_l2d4_clk_stop ,gl_l2_por_c1t } ),
     .gclk             (gclk_l2b4 ) );
endmodule



// ************************************************************************
// 10 module n2_clk_gl_cc_stg_c1t_s4_2 (3x4) 
// ************************************************************************
//
module n2_clk_gl_cc_stg_c1t_s4_2 (gl_l2d5_clk_stop ,
     gl_l2b5_clk_stop ,stg1_l2d5_clk_stop_in_c1t ,
     stg1_mio_clk_stop_in_c1t ,gl_mio_clk_stop_c1t ,
     stg1_l2b5_clk_stop_in_c1t ,gclk_l2d5 );


input		gclk_l2d5 ;
input		stg1_l2b5_clk_stop_in_c1t ;
input		stg1_l2d5_clk_stop_in_c1t ;
input		stg1_mio_clk_stop_in_c1t ;
output		gl_l2b5_clk_stop ;
output		gl_l2d5_clk_stop ;
output		gl_mio_clk_stop_c1t ;

wire 		net51;
 
n2_clk_gl_cc_stage_4s4 xc1t_s4_2  (
     .stg1_in          ({1'b0,stg1_l2b5_clk_stop_in_c1t ,
            stg1_l2d5_clk_stop_in_c1t ,stg1_mio_clk_stop_in_c1t } ),
     .stg5_out         ({net51 ,gl_l2b5_clk_stop ,
            gl_l2d5_clk_stop,gl_mio_clk_stop_c1t } ),
     .gclk             (gclk_l2d5 ) );
endmodule


// ************************************************************************
// 11 module n2_clk_gl_cc_stg_c1t_s1_1 (7x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c1t_s1_1 ( // stg2_mcu1_dr_clk_stop_out_c1t ,
     // stg1_mcu0_dr_clk_stop_in_c1t ,
	 stg1_mcu0_io_clk_stop_in_c1t ,
     stg1_mcu0_clk_stop_in_c1t , // stg1_mcu1_dr_clk_stop_in_c1t ,
     gclk_l2t4 ,
     stg1_mcu1_clk_stop_in_c1t ,stg1_mcu1_io_clk_stop_in_c1t ,
     // stg2_mcu0_dr_clk_stop_out_c1t ,
	 stg1_mio_clk_stop_in_c1t ,
     stg2_mcu0_io_clk_stop_out_c1t ,stg2_mcu0_clk_stop_out_c1t ,
     stg2_mio_clk_stop_out_c1t ,stg2_mcu1_io_clk_stop_out_c1t ,
     stg2_mcu1_clk_stop_out_c1t );



input		gclk_l2t4 ;
input		stg1_mcu0_clk_stop_in_c1t ;
// input		stg1_mcu0_dr_clk_stop_in_c1t ;
input		stg1_mcu0_io_clk_stop_in_c1t ;
input		stg1_mcu1_clk_stop_in_c1t ;
// input		stg1_mcu1_dr_clk_stop_in_c1t ;
input		stg1_mcu1_io_clk_stop_in_c1t ;
input		stg1_mio_clk_stop_in_c1t ;
output		stg2_mcu0_clk_stop_out_c1t ;
// output		stg2_mcu0_dr_clk_stop_out_c1t ;
output		stg2_mcu0_io_clk_stop_out_c1t ;
output		stg2_mcu1_clk_stop_out_c1t ;
// output		stg2_mcu1_dr_clk_stop_out_c1t ;
output		stg2_mcu1_io_clk_stop_out_c1t ;
output		stg2_mio_clk_stop_out_c1t ;
 
wire [11:0] unused; 
 
n2_clk_gl_cc_stage_17s1 xc1t_s1_1  (
     .stg0_in          ({12'b0,stg1_mio_clk_stop_in_c1t ,
            // stg1_mcu1_dr_clk_stop_in_c1t ,stg1_mcu0_dr_clk_stop_in_c1t ,
            stg1_mcu1_io_clk_stop_in_c1t ,stg1_mcu0_io_clk_stop_in_c1t ,
            stg1_mcu1_clk_stop_in_c1t ,stg1_mcu0_clk_stop_in_c1t } ),
     .stg1_out         ({unused,stg2_mio_clk_stop_out_c1t ,
            // stg2_mcu1_dr_clk_stop_out_c1t ,stg2_mcu0_dr_clk_stop_out_c1t,
             stg2_mcu1_io_clk_stop_out_c1t ,
            stg2_mcu0_io_clk_stop_out_c1t ,stg2_mcu1_clk_stop_out_c1t ,
            stg2_mcu0_clk_stop_out_c1t } ),
     .gclk             (gclk_l2t4 ) );
endmodule


// ************************************************************************
// 12 module n2_clk_gl_cc_stg_c1b_s4_0 (4x4)
// ************************************************************************

module n2_clk_gl_cc_stg_c1b_s4_0 (gl_l2_wmr_c1b ,gclk_l2b6 ,
    gl_io_cmp_sync_en_c1b ,stg1_io_cmp_sync_en_in_c1b ,
	stg1_cmp_io_sync_en_in_c1b ,
	stg1_l2_por_in_c1b, gl_l2_por_c1b,  // added for  int6.1 
    gl_cmp_io_sync_en_c1b ,stg1_l2_wmr_in_c1b 
  );



input		gclk_l2b6 ;

input		stg1_cmp_io_sync_en_in_c1b ;
input		stg1_io_cmp_sync_en_in_c1b ;
// input		stg1_l2_por_in_c1b ; // removed prior to int6.1
input		stg1_l2_wmr_in_c1b ;
input		stg1_l2_por_in_c1b ; // added for  int6.1 

output		gl_cmp_io_sync_en_c1b ;
output		gl_io_cmp_sync_en_c1b ;
output		gl_l2_wmr_c1b ;
// output		gl_mio_io2x_sync_en_c1b ; // removed prior to int6.1
output		gl_l2_por_c1b ; // added for  int6.1 
 
 
n2_clk_gl_cc_stage_4s4 xc1b_s4_0  (
     .stg1_in          ( {	stg1_cmp_io_sync_en_in_c1b ,
							stg1_io_cmp_sync_en_in_c1b ,
							stg1_l2_por_in_c1b, // added for  int6.1 
							stg1_l2_wmr_in_c1b } ),
     .stg5_out         ({	gl_cmp_io_sync_en_c1b ,
							gl_io_cmp_sync_en_c1b ,
							gl_l2_por_c1b,  // added for  int6.1 
							gl_l2_wmr_c1b } ),
     .gclk             (gclk_l2b6 ) );
endmodule


// ************************************************************************
// 13 module n2_clk_gl_cc_stg_c1b_s4_1 (4x4)
// ************************************************************************

module n2_clk_gl_cc_stg_c1b_s4_1 (gclk_l2d6 ,
gl_l2d7_clk_stop ,stg1_spc6_clk_stop_in_c1b,
gl_spc6_clk_stop ,stg1_l2d7_clk_stop_in_c1b );

// n2_clk_gl_cc_stg_c1b_s4_1 (spare2_c1b ,gclk_l2b4 ,spare3_c1b ,
//     spare2_c1b_in ,gl_l2d7_clk_stop ,stg1_spc6_clk_stop_c1t_in ,
//    gl_spc6_clk_stop ,spare3_c1b_in ,stg1_l2d7_clk_stop_c1b_in );



input		gclk_l2d6 ;
// input		spare2_c1b_in ;
// input		spare3_c1b_in ;
input		stg1_l2d7_clk_stop_in_c1b;
input		stg1_spc6_clk_stop_in_c1b;
output		gl_l2d7_clk_stop ;
output		gl_spc6_clk_stop ;
// output		spare2_c1b ;
// output		spare3_c1b ;
 
 
/* 
n2_clk_gl_cc_stage_4s4 xc1b_s4_1  (
     .stg1_in          ({spare2_c1b_in ,stg1_l2d7_clk_stop_c1b_in ,
            stg1_spc6_clk_stop_c1t_in ,spare3_c1b_in } ),
     .stg5_out         ({spare2_c1b ,gl_l2d7_clk_stop ,
            gl_spc6_clk_stop ,spare3_c1b } ),
     .gclk             (gclk_l2b4 ) );
*/
wire [1:0] unused;

n2_clk_gl_cc_stage_4s4 xc1b_s4_1  (
     .stg1_in          ({2'b0, stg1_l2d7_clk_stop_in_c1b,
            stg1_spc6_clk_stop_in_c1b} ),
     .stg5_out         ({unused,gl_l2d7_clk_stop ,
            gl_spc6_clk_stop } ),
     .gclk             (gclk_l2d6 ) );

endmodule


// ************************************************************************
// 14 module n2_clk_gl_cc_stg_c1b_s4_2 (4x4)
// ************************************************************************

module n2_clk_gl_cc_stg_c1b_s4_2 (gl_rdp_io_clk_stop ,
     gl_rtx_io_clk_stop ,stg1_rdp_io_clk_stop_in_c1b ,
     stg1_mac_io_clk_stop_in_c1b ,stg1_rtx_io_clk_stop_in_c1b ,
     gl_mac_io_clk_stop ,stg1_tds_io_clk_stop_in_c1b ,gclk_spc6 ,
     gl_tds_io_clk_stop );

input           gclk_spc6 ;
input           stg1_mac_io_clk_stop_in_c1b ;
input           stg1_rdp_io_clk_stop_in_c1b ;
input           stg1_tds_io_clk_stop_in_c1b ;
input           stg1_rtx_io_clk_stop_in_c1b ;
output          gl_mac_io_clk_stop ;
output          gl_rdp_io_clk_stop ;
output          gl_tds_io_clk_stop ;
output          gl_rtx_io_clk_stop ;
 
 
 
n2_clk_gl_cc_stage_4s4 xc1b_s4_2  (
	.stg1_in	({stg1_rdp_io_clk_stop_in_c1b, stg1_tds_io_clk_stop_in_c1b,
				  stg1_rtx_io_clk_stop_in_c1b, stg1_mac_io_clk_stop_in_c1b } ),
	.stg5_out	({gl_rdp_io_clk_stop ,gl_tds_io_clk_stop, 
				  gl_rtx_io_clk_stop ,gl_mac_io_clk_stop } ),
	.gclk		(gclk_spc6 ) );
endmodule



// ************************************************************************
// 15 module n2_clk_gl_cc_stg_c1b_s4_3 (4x4)
// ************************************************************************


module n2_clk_gl_cc_stg_c1b_s4_3 (gl_io2x_out_c1b ,gl_io_out_c1b ,
     stg1_io_out_in_c1b ,stg1_rst_niu_wmr_in_c1b ,stg1_rst_mac_in_c1b ,
     stg1_io2x_out_in_c1b ,gl_rst_mac_c1b ,gclk_mac ,gl_rst_niu_wmr_c1b
      );

input           gclk_mac ;
input           stg1_io2x_out_in_c1b ;
input           stg1_io_out_in_c1b ;
input           stg1_rst_mac_in_c1b ;
input           stg1_rst_niu_wmr_in_c1b ;
output          gl_io2x_out_c1b ;
output          gl_io_out_c1b ;
output          gl_rst_mac_c1b ;
output          gl_rst_niu_wmr_c1b ;
 
 
 
n2_clk_gl_cc_stage_4s4 x35  (
     .stg1_in          ({stg1_io_out_in_c1b ,stg1_io2x_out_in_c1b ,
            stg1_rst_mac_in_c1b ,stg1_rst_niu_wmr_in_c1b } ),
     .stg5_out         ({gl_io_out_c1b ,gl_io2x_out_c1b ,gl_rst_mac_c1b ,
            gl_rst_niu_wmr_c1b } ),
     .gclk             (gclk_mac ) );
endmodule



// ************************************************************************
// 16 module n2_clk_gl_cc_stg_c2b_s1_0 (17x1)
// ************************************************************************


module n2_clk_gl_cc_stg_c2b_s1_0 (gclk_spc7 ,stg3_l2t2_clk_stop_out_c2b ,
     stg3_l2t3_clk_stop_out_c2b ,stg2_l2t3_clk_stop_in_c2bz ,
     stg3_io_cmp_sync_en_out_c2b ,stg3_io_out_out_c2b ,stg3_l2_wmr_out_c2b
      ,stg3_l2_por_out_c2b ,stg3_dmu_peu_por_out_c2b ,
     stg3_dmu_peu_wmr_out_c2b ,stg3_spc2_clk_stop_out_c2b ,
     stg3_spc3_clk_stop_out_c2b ,stg3_spc7_clk_stop_out_c2b ,
     stg3_l2b2_clk_stop_out_c2b ,stg3_db0_clk_stop_out_c2b ,
     stg3_l2d2_clk_stop_out_c2b ,stg3_l2d3_clk_stop_out_c2b ,
     stg3_l2b3_clk_stop_out_c2b ,stg2_io_cmp_sync_en_in_c2b ,
     stg2_io_out_in_c2b ,stg2_l2_wmr_in_c2b ,stg2_l2_por_in_c2b ,
     stg2_dmu_peu_por_in_c2b ,stg2_dmu_peu_wmr_in_c2b ,
     stg2_spc2_clk_stop_in_c2b ,stg2_spc3_clk_stop_in_c2b ,
     stg2_spc7_clk_stop_in_c2b ,stg2_db0_clk_stop_in_c2b ,
     stg2_l2d2_clk_stop_in_c2b ,stg2_l2d3_clk_stop_in_c2b ,
     stg2_l2b2_clk_stop_in_c2b ,stg2_l2b3_clk_stop_in_c2b ,
     stg3_cmp_io_sync_en_out_c2b ,stg2_cmp_io_sync_en_in_c2b ,
     stg2_l2t2_clk_stop_in_c2b );



input		gclk_spc7 ;
input		stg2_cmp_io_sync_en_in_c2b ;
input		stg2_db0_clk_stop_in_c2b ;
input		stg2_dmu_peu_por_in_c2b ;
input		stg2_dmu_peu_wmr_in_c2b ;
input		stg2_io_cmp_sync_en_in_c2b ;
input		stg2_l2_por_in_c2b ;
input		stg2_l2_wmr_in_c2b ;
input		stg2_l2b2_clk_stop_in_c2b ;
input		stg2_l2b3_clk_stop_in_c2b ;
input		stg2_l2d2_clk_stop_in_c2b ;
input		stg2_l2d3_clk_stop_in_c2b ;
input		stg2_l2t2_clk_stop_in_c2b ;
input		stg2_l2t3_clk_stop_in_c2bz ;
input		stg2_io_out_in_c2b ;
input		stg2_spc2_clk_stop_in_c2b ;
input		stg2_spc3_clk_stop_in_c2b ;
input		stg2_spc7_clk_stop_in_c2b ;
output		stg3_cmp_io_sync_en_out_c2b ;
output		stg3_db0_clk_stop_out_c2b ;
output		stg3_dmu_peu_por_out_c2b ;
output		stg3_dmu_peu_wmr_out_c2b ;
output		stg3_io_cmp_sync_en_out_c2b ;
output		stg3_l2_por_out_c2b ;
output		stg3_l2_wmr_out_c2b ;
output		stg3_l2b2_clk_stop_out_c2b ;
output		stg3_l2b3_clk_stop_out_c2b ;
output		stg3_l2d2_clk_stop_out_c2b ;
output		stg3_l2d3_clk_stop_out_c2b ;
output		stg3_l2t2_clk_stop_out_c2b ;
output		stg3_l2t3_clk_stop_out_c2b ;
output		stg3_io_out_out_c2b ;
output		stg3_spc2_clk_stop_out_c2b ;
output		stg3_spc3_clk_stop_out_c2b ;
output		stg3_spc7_clk_stop_out_c2b ;
 
 
 
n2_clk_gl_cc_stage_17s1 xc2b_s1_0  (
     .stg0_in          ({stg2_l2t3_clk_stop_in_c2bz ,
            stg2_l2t2_clk_stop_in_c2b ,stg2_l2b3_clk_stop_in_c2b ,
            stg2_l2b2_clk_stop_in_c2b ,stg2_l2d3_clk_stop_in_c2b ,
            stg2_l2d2_clk_stop_in_c2b ,stg2_db0_clk_stop_in_c2b ,
            stg2_spc7_clk_stop_in_c2b ,stg2_spc3_clk_stop_in_c2b ,
            stg2_spc2_clk_stop_in_c2b ,stg2_dmu_peu_wmr_in_c2b ,
            stg2_dmu_peu_por_in_c2b ,stg2_l2_por_in_c2b ,
            stg2_l2_wmr_in_c2b ,stg2_io_out_in_c2b ,
            stg2_io_cmp_sync_en_in_c2b ,stg2_cmp_io_sync_en_in_c2b } ),
     .stg1_out         ({stg3_l2t3_clk_stop_out_c2b ,
            stg3_l2t2_clk_stop_out_c2b ,stg3_l2b3_clk_stop_out_c2b ,
            stg3_l2b2_clk_stop_out_c2b ,stg3_l2d3_clk_stop_out_c2b ,
            stg3_l2d2_clk_stop_out_c2b ,stg3_db0_clk_stop_out_c2b ,
            stg3_spc7_clk_stop_out_c2b ,stg3_spc3_clk_stop_out_c2b ,
            stg3_spc2_clk_stop_out_c2b ,stg3_dmu_peu_wmr_out_c2b ,
            stg3_dmu_peu_por_out_c2b ,stg3_l2_por_out_c2b ,
            stg3_l2_wmr_out_c2b ,stg3_io_out_out_c2b ,
            stg3_io_cmp_sync_en_out_c2b ,stg3_cmp_io_sync_en_out_c2b } )
,
     .gclk             (gclk_spc7 ) );
endmodule

// ************************************************************************
// 17 module n2_clk_gl_cc_stage_8s2 (8x2)
// ************************************************************************

module n2_clk_gl_cc_stage_8s2 (stg5_out ,stg3_in ,gclk );

output [7:0]	stg5_out ;
input  [7:0]	stg3_in ;
input			gclk ;

wire  [7:0]		stg5_out ;
wire  [7:0]		stg3_in ;
wire			gclk ;

reg  [7:0] q1;
reg  [7:0] q2;

always @(posedge gclk) begin
	q1 <= stg3_in;
	q2 <= q1; 
end

//ifdef FLOP_STAGES_ON
    assign stg5_out = q2;
//else
//    assign stg5_out = stg3_in;
//endif

endmodule



// ************************************************************************
// 18 module n2_clk_gl_cc_stg_c2b_s2_0 (8x2)
// ************************************************************************

module n2_clk_gl_cc_stg_c2b_s2_0 (gclk_l2t3 ,
     gl_l2_wmr_c2b ,stg3_ccx_clk_stop_in_c2b ,stg3_l2t3_clk_stop_in_c2b
      ,stg3_l2_por_in_c2b ,stg3_l2_wmr_in_c2b ,
     stg3_io_cmp_sync_en_in_c2b ,stg3_cmp_io_sync_en_in_c2b ,
     stg3_l2t7_clk_stop_in_c2b ,gl_ccx_clk_stop ,
     gl_l2t3_clk_stop ,gl_l2t7_clk_stop ,gl_l2_por_c2b ,
     gl_cmp_io_sync_en_c2b ,gl_io_cmp_sync_en_c2b );

/*
n2_clk_gl_cc_stg_c2b_s2_0 (gclk_l2t3 ,spare_c2b_s2_out6 ,
     gl_l2_wmr_c2b ,stg3_ccx_clk_stop_in_c2b ,stg3_l2t3_clk_stop_in_c2b
      ,stg3_l2_por_in_c2b ,stg3_l2_wmr_in_c2b ,
     stg3_io_cmp_sync_en_in_c2b ,stg3_cmp_io_sync_en_in_c2b ,
     stg3_l2t7_clk_stop_in_c2b ,gl_ccx_clk_stop ,
     gl_l2t3_clk_stop ,gl_l2t7_clk_stop ,gl_l2_por_c2b ,
     spare_c2b_s2_in6 ,gl_cmp_io_sync_en_c2b ,gl_io_cmp_sync_en_c2b );
*/

input           gclk_l2t3 ;
// input           spare_c2b_s2_in6 ;
input           stg3_ccx_clk_stop_in_c2b ;
input           stg3_cmp_io_sync_en_in_c2b ;
input           stg3_io_cmp_sync_en_in_c2b ;
input           stg3_l2_por_in_c2b ;
input           stg3_l2_wmr_in_c2b ;
input           stg3_l2t3_clk_stop_in_c2b ;
input           stg3_l2t7_clk_stop_in_c2b ;
output          gl_ccx_clk_stop ;
output          gl_cmp_io_sync_en_c2b ;
output          gl_io_cmp_sync_en_c2b ;
output          gl_l2_por_c2b ;
output          gl_l2_wmr_c2b ;
output          gl_l2t3_clk_stop ;
output          gl_l2t7_clk_stop ;
// output          spare_c2b_s2_out6 ;

wire 		unused;
 
n2_clk_gl_cc_stage_8s2 xc2t_s2_0  (
     .stg5_out         ({unused,gl_ccx_clk_stop ,
            gl_l2t7_clk_stop ,gl_l2t3_clk_stop ,gl_l2_por_c2b ,
            gl_l2_wmr_c2b ,gl_io_cmp_sync_en_c2b ,gl_cmp_io_sync_en_c2b
         } ),
     .stg3_in          ({1'b0,stg3_ccx_clk_stop_in_c2b ,
            stg3_l2t7_clk_stop_in_c2b ,stg3_l2t3_clk_stop_in_c2b ,
            stg3_l2_por_in_c2b ,stg3_l2_wmr_in_c2b ,
            stg3_io_cmp_sync_en_in_c2b ,stg3_cmp_io_sync_en_in_c2b } ),
     .gclk             (gclk_l2t3 ) );
endmodule


// ************************************************************************
// 19 module n2_clk_gl_cc_stg_c2b_s2_1 (2x2)
// ************************************************************************


module n2_clk_gl_cc_stg_c2b_s2_1 (gclk_spc3 ,gl_spc3_clk_stop ,
     gl_spc7_clk_stop ,stg3_spc7_clk_stop_in_c2b ,
     stg3_spc3_clk_stop_in_c2b );

input		gclk_spc3 ;
input		stg3_spc7_clk_stop_in_c2b ;
input		stg3_spc3_clk_stop_in_c2b ;
output		gl_spc3_clk_stop ;
output		gl_spc7_clk_stop ;

wire	[5:0] unused; 
 
 
n2_clk_gl_cc_stage_8s2 xc2t_s2_0  (
     .stg5_out         ({unused,
            gl_spc7_clk_stop ,gl_spc3_clk_stop } ),
     .stg3_in          ({6'b0,
            stg3_spc7_clk_stop_in_c2b ,stg3_spc3_clk_stop_in_c2b } ),
     .gclk             (gclk_spc3 ) );
endmodule



// ************************************************************************
// 20 module n2_clk_gl_cc_stg_c2t_s1_0 (17x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c2t_s1_0 (gclk_spc5 ,stg3_l2t5_clk_stop_out_c2t ,
     stg3_l2t1_clk_stop_out_c2t ,stg3_l2t0_clk_stop_out_c2t ,
     stg3_l2b1_clk_stop_out_c2t ,stg3_l2b0_clk_stop_out_c2t ,
     stg3_l2d1_clk_stop_out_c2t ,stg3_l2d0_clk_stop_out_c2t ,
     stg3_spc5_clk_stop_out_c2t ,stg3_spc1_clk_stop_out_c2t ,
     stg3_spc0_clk_stop_out_c2t ,stg3_l2_por_out_c2t ,
     stg3_io_out_out_c2t ,stg3_dr_sync_en_out_c2t ,
     stg3_mio_io2x_sync_en_out_c2t ,stg3_io_cmp_sync_en_out_c2t ,
     stg3_cmp_io_sync_en_out_c2t ,stg2_cmp_io_sync_en_in_c2t ,
     stg2_io_cmp_sync_en_in_c2t ,stg2_mio_io2x_sync_en_in_c2t ,
     stg2_dr_sync_en_in_c2t ,stg2_io_out_in_c2t ,stg3_l2_wmr_out_c2t ,
     stg2_l2_wmr_in_c2t ,stg2_l2_por_in_c2t ,stg2_spc0_clk_stop_in_c2t ,
     stg2_spc1_clk_stop_in_c2t ,stg2_spc5_clk_stop_in_c2t ,
     stg2_l2d0_clk_stop_in_c2t ,stg2_l2d1_clk_stop_in_c2t ,
     stg2_l2b0_clk_stop_in_c2t ,stg2_l2b1_clk_stop_in_c2t ,
     stg2_l2t0_clk_stop_in_c2t ,stg2_l2t5_clk_stop_in_c2t ,
     stg2_l2t1_clk_stop_in_c2t );



 
input		gclk_spc5 ;
input		stg2_cmp_io_sync_en_in_c2t ;
input		stg2_dr_sync_en_in_c2t ;
input		stg2_io_cmp_sync_en_in_c2t ;
input		stg2_io_out_in_c2t ;
input		stg2_l2_por_in_c2t ;
input		stg2_l2_wmr_in_c2t ;
input		stg2_l2b0_clk_stop_in_c2t ;
input		stg2_l2b1_clk_stop_in_c2t ;
input		stg2_l2d0_clk_stop_in_c2t ;
input		stg2_l2d1_clk_stop_in_c2t ;
input		stg2_l2t0_clk_stop_in_c2t ;
input		stg2_l2t1_clk_stop_in_c2t ;
input		stg2_l2t5_clk_stop_in_c2t ;
input		stg2_mio_io2x_sync_en_in_c2t ;
input		stg2_spc0_clk_stop_in_c2t ;
input		stg2_spc1_clk_stop_in_c2t ;
input		stg2_spc5_clk_stop_in_c2t ;
output		stg3_cmp_io_sync_en_out_c2t ;
output		stg3_dr_sync_en_out_c2t ;
output		stg3_io_cmp_sync_en_out_c2t ;
output		stg3_io_out_out_c2t ;
output		stg3_l2_por_out_c2t ;
output		stg3_l2_wmr_out_c2t ;
output		stg3_l2b0_clk_stop_out_c2t ;
output		stg3_l2b1_clk_stop_out_c2t ;
output		stg3_l2d0_clk_stop_out_c2t ;
output		stg3_l2d1_clk_stop_out_c2t ;
output		stg3_l2t0_clk_stop_out_c2t ;
output		stg3_l2t1_clk_stop_out_c2t ;
output		stg3_l2t5_clk_stop_out_c2t ;
output		stg3_mio_io2x_sync_en_out_c2t ;
output		stg3_spc0_clk_stop_out_c2t ;
output		stg3_spc1_clk_stop_out_c2t ;
output		stg3_spc5_clk_stop_out_c2t ;
 
 
n2_clk_gl_cc_stage_17s1 xc2t_s1_0  (
     .stg0_in          ({stg2_l2t5_clk_stop_in_c2t ,
            stg2_l2t1_clk_stop_in_c2t ,stg2_l2t0_clk_stop_in_c2t ,
            stg2_l2b1_clk_stop_in_c2t ,stg2_l2b0_clk_stop_in_c2t ,
            stg2_l2d1_clk_stop_in_c2t ,stg2_l2d0_clk_stop_in_c2t ,
            stg2_spc5_clk_stop_in_c2t ,stg2_spc1_clk_stop_in_c2t ,
            stg2_spc0_clk_stop_in_c2t ,stg2_l2_por_in_c2t ,
            stg2_l2_wmr_in_c2t ,stg2_io_out_in_c2t ,
            stg2_dr_sync_en_in_c2t ,stg2_mio_io2x_sync_en_in_c2t ,
            stg2_io_cmp_sync_en_in_c2t ,stg2_cmp_io_sync_en_in_c2t } ),
     .stg1_out         ({stg3_l2t5_clk_stop_out_c2t ,
            stg3_l2t1_clk_stop_out_c2t ,stg3_l2t0_clk_stop_out_c2t ,
            stg3_l2b1_clk_stop_out_c2t ,stg3_l2b0_clk_stop_out_c2t ,
            stg3_l2d1_clk_stop_out_c2t ,stg3_l2d0_clk_stop_out_c2t ,
            stg3_spc5_clk_stop_out_c2t ,stg3_spc1_clk_stop_out_c2t ,
            stg3_spc0_clk_stop_out_c2t ,stg3_l2_por_out_c2t ,
            stg3_l2_wmr_out_c2t ,stg3_io_out_out_c2t ,
            stg3_dr_sync_en_out_c2t ,stg3_mio_io2x_sync_en_out_c2t ,
            stg3_io_cmp_sync_en_out_c2t ,stg3_cmp_io_sync_en_out_c2t } )
,
     .gclk             (gclk_spc5 ) );
endmodule


// ************************************************************************
// 21 module n2_clk_gl_cc_stg_c2t_s2_0  (6x2)
// ************************************************************************

module n2_clk_gl_cc_stg_c2t_s2_0 (stg3_l2t5_clk_stop_in_c2t ,
     gl_l2_por_c2t ,stg3_io_cmp_sync_en_in_c2t ,stg3_l2_wmr_in_c2t ,
     stg3_l2_por_in_c2t ,stg3_l2t1_clk_stop_in_c2t ,
     stg3_cmp_io_sync_en_in_c2t ,gclk_l2t1 ,gl_l2_wmr_c2t ,
     gl_cmp_io_sync_en_c2t ,gl_l2t5_clk_stop ,gl_io_cmp_sync_en_c2t
      ,gl_l2t1_clk_stop );

input       gclk_l2t1 ;
input       stg3_cmp_io_sync_en_in_c2t ;
input       stg3_io_cmp_sync_en_in_c2t ;
input       stg3_l2_por_in_c2t ;
input       stg3_l2_wmr_in_c2t ;
input       stg3_l2t1_clk_stop_in_c2t ;
input       stg3_l2t5_clk_stop_in_c2t ;
output      gl_cmp_io_sync_en_c2t ;
output      gl_io_cmp_sync_en_c2t ;
output      gl_l2_por_c2t ;
output      gl_l2_wmr_c2t ;
output      gl_l2t1_clk_stop ;
output      gl_l2t5_clk_stop ;

wire 	[1:0] unused; 

n2_clk_gl_cc_stage_8s2 xc2t_s2_0  (
     .stg5_out         ({unused, gl_l2t5_clk_stop ,
            gl_l2t1_clk_stop ,gl_l2_por_c2t ,gl_l2_wmr_c2t ,
            gl_io_cmp_sync_en_c2t ,gl_cmp_io_sync_en_c2t } ),
     .stg3_in          ({2'b0, stg3_l2t5_clk_stop_in_c2t ,
            stg3_l2t1_clk_stop_in_c2t ,stg3_l2_por_in_c2t ,
            stg3_l2_wmr_in_c2t ,stg3_io_cmp_sync_en_in_c2t ,
            stg3_cmp_io_sync_en_in_c2t } ),
     .gclk             (gclk_l2t1 ) );
endmodule


// ************************************************************************
// 22 module n2_clk_gl_cc_stg_c2t_s2_1 (4x2)
// ************************************************************************

module n2_clk_gl_cc_stg_c2t_s2_1 (gclk_spc1 ,stg3_spc1_clk_stop_in_c2t ,
     stg3_mio_clk_stop_in_c2t ,gl_mio_clk_stop_c2t ,
     gl_spc5_clk_stop ,gl_io2x_sync_en_c2t ,
     gl_spc1_clk_stop ,stg3_io2x_sync_en_in_c2t ,
     stg3_spc5_clk_stop_in_c2t );

input       gclk_spc1 ;
input       stg3_io2x_sync_en_in_c2t ;
input       stg3_mio_clk_stop_in_c2t ;
input       stg3_spc1_clk_stop_in_c2t ;
input       stg3_spc5_clk_stop_in_c2t ;
output      gl_io2x_sync_en_c2t;
output      gl_mio_clk_stop_c2t ;
output      gl_spc1_clk_stop ;
output      gl_spc5_clk_stop ;

wire [3:0] unused;
 
n2_clk_gl_cc_stage_8s2 xc2t_s2_0  (
     .stg5_out         ({unused,
			gl_mio_clk_stop_c2t, gl_spc5_clk_stop ,
			gl_spc1_clk_stop, gl_io2x_sync_en_c2t } ),
     .stg3_in          ({4'b0,
            stg3_mio_clk_stop_in_c2t ,stg3_spc5_clk_stop_in_c2t ,
            stg3_spc1_clk_stop_in_c2t ,stg3_io2x_sync_en_in_c2t } ),
     .gclk             (gclk_spc1 ) );
endmodule


// ************************************************************************
// 23 module n2_clk_gl_cc_stg_c3t_s1_0 (13x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c3t_s1_0 (stg3_cmp_io_sync_en_in_c3t ,
     stg4_mio_io2x_sync_en_out_c3t ,stg4_io_out_out_c3t ,
     stg4_l2_wmr_out_c3t ,stg4_l2_por_out_c3t ,
     stg4_spc0_clk_stop_out_c3t ,stg4_l2d0_clk_stop_out_c3t ,
     stg4_l2d1_clk_stop_out_c3t ,stg4_l2b0_clk_stop_out_c3t ,
     stg4_l2b1_clk_stop_out_c3t ,stg4_l2t0_clk_stop_out_c3t ,
     stg3_mio_io2x_sync_en_in_c3t ,stg3_dr_sync_en_in_c3t ,
     stg3_io_out_in_c3t ,stg3_l2_wmr_in_c3t ,stg3_l2_por_in_c3t ,
     stg3_spc0_clk_stop_in_c3t ,stg3_l2d0_clk_stop_in_c3t ,
     stg3_l2d1_clk_stop_in_c3t ,stg3_l2b0_clk_stop_in_c3t ,
     stg3_l2b1_clk_stop_in_c3t ,stg3_l2t0_clk_stop_in_c3t ,
     stg4_cmp_io_sync_en_out_c3t ,stg4_dr_sync_en_out_c3t ,gclk_spc0 ,
     stg3_io_cmp_sync_en_in_c3t ,stg4_io_cmp_sync_en_out_c3t );


input		gclk_spc0 ;
input		stg3_cmp_io_sync_en_in_c3t ;
input		stg3_dr_sync_en_in_c3t ;
input		stg3_io_cmp_sync_en_in_c3t ;
input		stg3_io_out_in_c3t ;
input		stg3_l2_por_in_c3t ;
input		stg3_l2_wmr_in_c3t ;
input		stg3_l2b0_clk_stop_in_c3t ;
input		stg3_l2b1_clk_stop_in_c3t ;
input		stg3_l2d0_clk_stop_in_c3t ;
input		stg3_l2d1_clk_stop_in_c3t ;
input		stg3_l2t0_clk_stop_in_c3t ;
input		stg3_mio_io2x_sync_en_in_c3t ;
input		stg3_spc0_clk_stop_in_c3t ;
output		stg4_cmp_io_sync_en_out_c3t ;
output		stg4_dr_sync_en_out_c3t ;
output		stg4_io_cmp_sync_en_out_c3t ;
output		stg4_io_out_out_c3t ;
output		stg4_l2_por_out_c3t ;
output		stg4_l2_wmr_out_c3t ;
output		stg4_l2b0_clk_stop_out_c3t ;
output		stg4_l2b1_clk_stop_out_c3t ;
output		stg4_l2d0_clk_stop_out_c3t ;
output		stg4_l2d1_clk_stop_out_c3t ;
output		stg4_l2t0_clk_stop_out_c3t ;
output		stg4_mio_io2x_sync_en_out_c3t ;
output		stg4_spc0_clk_stop_out_c3t ;
 
wire [3:0] 	unused; 
 
n2_clk_gl_cc_stage_17s1 xc3t_s1_0  (
     .stg0_in          ({4'b0,
            stg3_l2t0_clk_stop_in_c3t ,stg3_l2b1_clk_stop_in_c3t ,
            stg3_l2b0_clk_stop_in_c3t ,stg3_l2d1_clk_stop_in_c3t ,
            stg3_l2d0_clk_stop_in_c3t ,stg3_spc0_clk_stop_in_c3t ,
            stg3_l2_por_in_c3t ,stg3_l2_wmr_in_c3t ,stg3_io_out_in_c3t ,
            stg3_dr_sync_en_in_c3t ,stg3_mio_io2x_sync_en_in_c3t ,
            stg3_io_cmp_sync_en_in_c3t ,stg3_cmp_io_sync_en_in_c3t } ),
     .stg1_out         ({unused,
            stg4_l2t0_clk_stop_out_c3t ,stg4_l2b1_clk_stop_out_c3t ,
            stg4_l2b0_clk_stop_out_c3t ,stg4_l2d1_clk_stop_out_c3t ,
            stg4_l2d0_clk_stop_out_c3t ,stg4_spc0_clk_stop_out_c3t ,
            stg4_l2_por_out_c3t ,stg4_l2_wmr_out_c3t ,
            stg4_io_out_out_c3t ,stg4_dr_sync_en_out_c3t ,
            stg4_mio_io2x_sync_en_out_c3t ,stg4_io_cmp_sync_en_out_c3t ,
            stg4_cmp_io_sync_en_out_c3t } ),
     .gclk             (gclk_spc0 ) );
endmodule


// ************************************************************************
// 24 module n2_clk_gl_cc_stg_c3t_s1_1 (7x1)
// ************************************************************************


module n2_clk_gl_cc_stg_c3t_s1_1 (gclk_l2t0 ,stg3_mcu1_clk_stop_in_c3t ,
     stg3_mcu0_io_clk_stop_in_c3t ,stg3_mcu1_io_clk_stop_in_c3t ,
//     stg3_mcu0_dr_clk_stop_in_c3t ,stg3_mcu1_dr_clk_stop_in_c3t ,
     stg3_mio_clk_stop_in_c3t ,stg4_mcu0_clk_stop_out_c3t ,
     stg4_mcu1_clk_stop_out_c3t ,stg4_mcu0_io_clk_stop_out_c3t ,
     stg4_mcu1_io_clk_stop_out_c3t ,  // stg4_mcu0_dr_clk_stop_out_c3t ,
//     stg4_mcu1_dr_clk_stop_out_c3t ,
	 stg4_mio_clk_stop_out_c3t ,
     stg3_mcu0_clk_stop_in_c3t );

input           gclk_l2t0 ;
input           stg3_mcu0_clk_stop_in_c3t ;
// input           stg3_mcu0_dr_clk_stop_in_c3t ;
input           stg3_mcu0_io_clk_stop_in_c3t ;
input           stg3_mcu1_clk_stop_in_c3t ;
// input           stg3_mcu1_dr_clk_stop_in_c3t ;
input           stg3_mcu1_io_clk_stop_in_c3t ;
input           stg3_mio_clk_stop_in_c3t ;
output          stg4_mcu0_clk_stop_out_c3t ;
// output          stg4_mcu0_dr_clk_stop_out_c3t ;
output          stg4_mcu0_io_clk_stop_out_c3t ;
output          stg4_mcu1_clk_stop_out_c3t ;
// output          stg4_mcu1_dr_clk_stop_out_c3t ;
output          stg4_mcu1_io_clk_stop_out_c3t ;
output          stg4_mio_clk_stop_out_c3t ;
 
wire [11:0]		unused; 
 
n2_clk_gl_cc_stage_17s1 xc2t_s1_0  (
     .stg0_in          ({12'b0 ,stg3_mio_clk_stop_in_c3t ,
//            stg3_mcu1_dr_clk_stop_in_c3t ,stg3_mcu0_dr_clk_stop_in_c3t ,
            stg3_mcu1_io_clk_stop_in_c3t ,stg3_mcu0_io_clk_stop_in_c3t ,
            stg3_mcu1_clk_stop_in_c3t ,stg3_mcu0_clk_stop_in_c3t } ),
     .stg1_out         ({unused ,stg4_mio_clk_stop_out_c3t ,
 //           stg4_mcu1_dr_clk_stop_out_c3t ,stg4_mcu0_dr_clk_stop_out_c3t,
            stg4_mcu1_io_clk_stop_out_c3t , stg4_mcu0_io_clk_stop_out_c3t ,
			stg4_mcu1_clk_stop_out_c3t , stg4_mcu0_clk_stop_out_c3t } ),
     .gclk             (gclk_l2t0 ) );
endmodule


// ************************************************************************
// 25 module n2_clk_gl_cc_stg_c3t_s1_3 (14x1)
// ************************************************************************


module n2_clk_gl_cc_stg_c3t_s1_3 (gclk_ncu ,stg4_cmp_io_sync_en_in_c3t ,
     gl_io2x_sync_en_c3t ,gl_io_out_c3t ,gl_l2_wmr_c3t ,gl_l2_por_c3t ,
     gl_l2t0_clk_stop ,gl_mcu0_clk_stop ,gl_mcu1_clk_stop ,
//   gl_mcu0_dr_clk_stop ,gl_mcu1_dr_clk_stop ,
     gl_mcu0_io_clk_stop ,gl_mcu1_io_clk_stop ,
     stg4_dr_sync_en_in_c3t ,stg4_io_out_in_c3t ,stg4_l2_wmr_in_c3t ,
     stg4_l2_por_in_c3t ,stg4_l2t0_clk_stop_in_c3t ,
     stg4_mcu0_clk_stop_in_c3t ,stg4_mcu1_clk_stop_in_c3t ,
//   stg4_mcu0_dr_clk_stop_in_c3t ,stg4_mcu1_dr_clk_stop_in_c3t ,
     stg4_mcu0_io_clk_stop_in_c3t ,stg4_mcu1_io_clk_stop_in_c3t ,
     gl_cmp_io_sync_en_c3t ,gl_dr_sync_en_c3t ,
     stg4_io_cmp_sync_en_in_c3t ,stg4_io2x_sync_en_in_c3t ,
     gl_io_cmp_sync_en_c3t );

input		gclk_ncu ;
input		stg4_cmp_io_sync_en_in_c3t ;
input		stg4_dr_sync_en_in_c3t ;
input		stg4_io2x_sync_en_in_c3t ;
input		stg4_io_cmp_sync_en_in_c3t ;
input		stg4_io_out_in_c3t ;
input		stg4_l2_por_in_c3t ;
input		stg4_l2_wmr_in_c3t ;
input		stg4_l2t0_clk_stop_in_c3t ;
// input		stg4_mcu1_dr_clk_stop_in_c3t ;
input		stg4_mcu0_clk_stop_in_c3t ;
// input		stg4_mcu0_dr_clk_stop_in_c3t ;
input		stg4_mcu0_io_clk_stop_in_c3t ;
input		stg4_mcu1_clk_stop_in_c3t ;
input		stg4_mcu1_io_clk_stop_in_c3t ;

output		gl_cmp_io_sync_en_c3t ;
output		gl_dr_sync_en_c3t ;
output		gl_io2x_sync_en_c3t ;
output		gl_io_cmp_sync_en_c3t ;
output		gl_io_out_c3t ;
output		gl_l2_por_c3t ;
output		gl_l2_wmr_c3t ;
output		gl_l2t0_clk_stop ;
// output		gl_mcu1_dr_clk_stop ;
output		gl_mcu0_clk_stop ;
// output		gl_mcu0_dr_clk_stop ;
output		gl_mcu0_io_clk_stop ;
output		gl_mcu1_clk_stop ;
output		gl_mcu1_io_clk_stop ;

wire [4:0] 	unused;
 
n2_clk_gl_cc_stage_17s1 xc2t_s1_0 (
     .stg0_in         ({5'b0,
            stg4_mcu1_io_clk_stop_in_c3t ,stg4_mcu0_io_clk_stop_in_c3t ,
//          stg4_mcu1_dr_clk_stop_in_c3t ,stg4_mcu0_dr_clk_stop_in_c3t ,
            stg4_mcu1_clk_stop_in_c3t ,stg4_mcu0_clk_stop_in_c3t ,
            stg4_l2t0_clk_stop_in_c3t ,stg4_l2_por_in_c3t ,
            stg4_l2_wmr_in_c3t ,stg4_io_out_in_c3t ,
            stg4_dr_sync_en_in_c3t ,stg4_io2x_sync_en_in_c3t ,
            stg4_io_cmp_sync_en_in_c3t ,stg4_cmp_io_sync_en_in_c3t } ),
     .stg1_out        ({unused,
			gl_mcu1_io_clk_stop , gl_mcu0_io_clk_stop ,
//			gl_mcu1_dr_clk_stop , gl_mcu0_dr_clk_stop ,
			gl_mcu1_clk_stop , gl_mcu0_clk_stop ,
			gl_l2t0_clk_stop ,gl_l2_por_c3t ,
            gl_l2_wmr_c3t ,gl_io_out_c3t,
			gl_dr_sync_en_c3t , gl_io2x_sync_en_c3t ,
			gl_io_cmp_sync_en_c3t , gl_cmp_io_sync_en_c3t } ),
     .gclk            (gclk_ncu ) );

endmodule


// ************************************************************************
// 26 module n2_clk_gl_cc_stg_c3t_s1_2 (11x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c3t_s1_2(gclk_l2b0 ,gl_l2_por_c3t ,
     gl_l2d1_clk_stop ,gl_l2b0_clk_stop ,gl_l2b1_clk_stop ,
     gl_mio_clk_stop_c3t ,stg4_spc0_clk_stop_in_c3t ,
     stg4_cmp_io_sync_en_in_c3t ,stg4_io_cmp_sync_en_in_c3t ,
     stg4_l2_wmr_in_c3t ,stg4_l2_por_in_c3t ,stg4_l2d0_clk_stop_in_c3t ,
     stg4_l2d1_clk_stop_in_c3t ,stg4_l2b0_clk_stop_in_c3t ,
     stg4_l2b1_clk_stop_in_c3t ,stg4_mio_clk_stop_in_c3t ,
     gl_io2x_sync_en_c3t ,gl_spc0_clk_stop ,gl_cmp_io_sync_en_c3t ,
     gl_io_cmp_sync_en_c3t ,gl_l2d0_clk_stop ,
     stg4_io2x_sync_en_in_c3t ,gl_l2_wmr_c3t );
output		gl_l2_por_c3t ;
output		gl_l2d1_clk_stop ;
output		gl_l2b0_clk_stop ;
output		gl_l2b1_clk_stop ;
output		gl_mio_clk_stop_c3t ;
output		gl_io2x_sync_en_c3t ;
output		gl_spc0_clk_stop ;
output		gl_cmp_io_sync_en_c3t ;
output		gl_io_cmp_sync_en_c3t ;
output		gl_l2d0_clk_stop ;
output		gl_l2_wmr_c3t ;
input		gclk_l2b0 ;
input		stg4_spc0_clk_stop_in_c3t ;
input		stg4_cmp_io_sync_en_in_c3t ;
input		stg4_io_cmp_sync_en_in_c3t ;
input		stg4_l2_wmr_in_c3t ;
input		stg4_l2_por_in_c3t ;
input		stg4_l2d0_clk_stop_in_c3t ;
input		stg4_l2d1_clk_stop_in_c3t ;
input		stg4_l2b0_clk_stop_in_c3t ;
input		stg4_l2b1_clk_stop_in_c3t ;
input		stg4_mio_clk_stop_in_c3t ;
input		stg4_io2x_sync_en_in_c3t ;

wire [5:0] 	unused;
 
n2_clk_gl_cc_stage_17s1 xc2t_s1_0 (
     .stg0_in         ({6'b0,
            stg4_mio_clk_stop_in_c3t ,stg4_l2b1_clk_stop_in_c3t ,
            stg4_l2b0_clk_stop_in_c3t ,stg4_l2d1_clk_stop_in_c3t ,
            stg4_l2d0_clk_stop_in_c3t ,stg4_l2_por_in_c3t ,
            stg4_l2_wmr_in_c3t ,stg4_io_cmp_sync_en_in_c3t ,
            stg4_cmp_io_sync_en_in_c3t ,stg4_spc0_clk_stop_in_c3t ,
            stg4_io2x_sync_en_in_c3t } ),
     .stg1_out        ({unused,
            gl_mio_clk_stop_c3t ,gl_l2b1_clk_stop,
            gl_l2b0_clk_stop ,gl_l2d1_clk_stop ,
            gl_l2d0_clk_stop ,gl_l2_por_c3t ,gl_l2_wmr_c3t ,
            gl_io_cmp_sync_en_c3t ,gl_cmp_io_sync_en_c3t ,
            gl_spc0_clk_stop ,gl_io2x_sync_en_c3t } ),
     .gclk            (gclk_l2b0 ) );
endmodule


// ************************************************************************
// 27 module n2_clk_gl_cc_stg_c3b_s1_0 (14x1)
// ************************************************************************


module n2_clk_gl_cc_stg_c3b_s1_0 (stg4_io_out_out_c3b ,
     stg4_l2_wmr_out_c3b ,stg4_l2_por_out_c3b ,stg4_dmu_peu_por_out_c3b
      ,stg4_dmu_peu_wmr_out_c3b ,stg4_spc2_clk_stop_out_c3b ,
     stg4_db0_clk_stop_out_c3b ,stg4_l2d2_clk_stop_out_c3b ,
     stg4_l2d3_clk_stop_out_c3b ,stg4_l2b2_clk_stop_out_c3b ,
     stg4_l2b3_clk_stop_out_c3b ,stg4_l2t2_clk_stop_out_c3b ,
     stg3_cmp_io_sync_en_in_c3b ,stg3_io_cmp_sync_en_in_c3b ,
     stg3_io_out_in_c3b ,stg3_l2_wmr_in_c3b ,stg3_l2_por_in_c3b ,
     stg3_dmu_peu_por_in_c3b ,stg3_dmu_peu_wmr_in_c3b ,
     stg3_spc2_clk_stop_in_c3b ,stg3_db0_clk_stop_in_c3b ,
     stg3_l2d2_clk_stop_in_c3b ,stg3_l2d3_clk_stop_in_c3b ,
     stg3_l2b2_clk_stop_in_c3b ,stg3_l2b3_clk_stop_in_c3b ,
     stg3_l2t2_clk_stop_in_c3b ,stg4_io_cmp_sync_en_out_c3b ,gclk_spc2 ,
     stg4_cmp_io_sync_en_out_c3b );

input       gclk_spc2 ;
input       stg3_cmp_io_sync_en_in_c3b ;
input       stg3_db0_clk_stop_in_c3b ;
input       stg3_dmu_peu_por_in_c3b ;
input       stg3_dmu_peu_wmr_in_c3b ;
input       stg3_io_cmp_sync_en_in_c3b ;
input       stg3_io_out_in_c3b ;
input       stg3_l2_por_in_c3b ;
input       stg3_l2_wmr_in_c3b ;
input       stg3_l2b2_clk_stop_in_c3b ;
input       stg3_l2b3_clk_stop_in_c3b ;
input       stg3_l2d2_clk_stop_in_c3b ;
input       stg3_l2d3_clk_stop_in_c3b ;
input       stg3_spc2_clk_stop_in_c3b ;
input		stg3_l2t2_clk_stop_in_c3b ;
output      stg4_cmp_io_sync_en_out_c3b ;
output      stg4_db0_clk_stop_out_c3b ;
output      stg4_dmu_peu_por_out_c3b ;
output      stg4_dmu_peu_wmr_out_c3b ;
output      stg4_io_cmp_sync_en_out_c3b ;
output      stg4_io_out_out_c3b ;
output      stg4_l2_por_out_c3b ;
output      stg4_l2_wmr_out_c3b ;
output      stg4_l2b2_clk_stop_out_c3b ;
output      stg4_l2b3_clk_stop_out_c3b ;
output      stg4_l2d2_clk_stop_out_c3b ;
output      stg4_l2d3_clk_stop_out_c3b ;
output      stg4_spc2_clk_stop_out_c3b ;
output 		stg4_l2t2_clk_stop_out_c3b ;
 
wire [2:0]	unused;
 



n2_clk_gl_cc_stage_17s1 xc3b_s1_0  (
     .stg0_in          ({3'b0,
		stg3_cmp_io_sync_en_in_c3b, stg3_db0_clk_stop_in_c3b,
		stg3_dmu_peu_por_in_c3b, 	stg3_dmu_peu_wmr_in_c3b,
		stg3_io_cmp_sync_en_in_c3b, stg3_io_out_in_c3b,
		stg3_l2_por_in_c3b, 		stg3_l2_wmr_in_c3b,
		stg3_l2b2_clk_stop_in_c3b, stg3_l2b3_clk_stop_in_c3b,
		stg3_l2d2_clk_stop_in_c3b, stg3_l2d3_clk_stop_in_c3b,
		stg3_spc2_clk_stop_in_c3b, stg3_l2t2_clk_stop_in_c3b} ),
     .stg1_out         ({unused,
		stg4_cmp_io_sync_en_out_c3b, stg4_db0_clk_stop_out_c3b,
		stg4_dmu_peu_por_out_c3b, 	 stg4_dmu_peu_wmr_out_c3b,
		stg4_io_cmp_sync_en_out_c3b, stg4_io_out_out_c3b,
		stg4_l2_por_out_c3b, 		 stg4_l2_wmr_out_c3b,
		stg4_l2b2_clk_stop_out_c3b, stg4_l2b3_clk_stop_out_c3b,
		stg4_l2d2_clk_stop_out_c3b, stg4_l2d3_clk_stop_out_c3b,
		stg4_spc2_clk_stop_out_c3b, stg4_l2t2_clk_stop_out_c3b} ),
     .gclk             (gclk_spc2 ) );
endmodule


// ************************************************************************
// 28 module n2_clk_gl_cc_stg_c3b_s1_1 (6x1)
// ************************************************************************


module n2_clk_gl_cc_stg_c3b_s1_1 (gclk_l2t2 ,stg3_ncu_clk_stop_in_c3b ,
     stg3_sii_io_clk_stop_in_c3b ,stg3_ncu_io_clk_stop_in_c3b ,
     stg3_dmu_io_clk_stop_in_c3b ,stg3_peu_io_clk_stop_in_c3b ,
     stg4_sii_clk_stop_out_c3b ,stg4_ncu_clk_stop_out_c3b ,
     stg4_sii_io_clk_stop_out_c3b ,stg4_ncu_io_clk_stop_out_c3b ,
     stg4_dmu_io_clk_stop_out_c3b ,stg4_peu_io_clk_stop_out_c3b ,
     stg3_sii_clk_stop_in_c3b );

input       gclk_l2t2 ;
input       stg3_dmu_io_clk_stop_in_c3b ;
input       stg3_ncu_clk_stop_in_c3b ;
input       stg3_ncu_io_clk_stop_in_c3b ;
input       stg3_peu_io_clk_stop_in_c3b ;
input       stg3_sii_clk_stop_in_c3b ;
input       stg3_sii_io_clk_stop_in_c3b ;
output      stg4_dmu_io_clk_stop_out_c3b ;
output      stg4_ncu_clk_stop_out_c3b ;
output      stg4_ncu_io_clk_stop_out_c3b ;
output      stg4_peu_io_clk_stop_out_c3b ;
output      stg4_sii_clk_stop_out_c3b ;
output      stg4_sii_io_clk_stop_out_c3b ;

wire [10:0] unused;
 
n2_clk_gl_cc_stage_17s1 xc3b_s1_1  (
     .stg0_in          ({11'b0,
		stg3_dmu_io_clk_stop_in_c3b, stg3_ncu_clk_stop_in_c3b,
		stg3_ncu_io_clk_stop_in_c3b, stg3_peu_io_clk_stop_in_c3b,
		stg3_sii_clk_stop_in_c3b, stg3_sii_io_clk_stop_in_c3b }),
     .stg1_out         ({unused,
		stg4_dmu_io_clk_stop_out_c3b, stg4_ncu_clk_stop_out_c3b,
		stg4_ncu_io_clk_stop_out_c3b, stg4_peu_io_clk_stop_out_c3b,
		stg4_sii_clk_stop_out_c3b, stg4_sii_io_clk_stop_out_c3b }),
     .gclk             (gclk_l2t2 ) );
endmodule


// ************************************************************************
// 29 module n2_clk_gl_cc_stg_c3b_s1_3 (7x1)
// ************************************************************************


module n2_clk_gl_cc_stg_c3b_s1_3 (gclk_dmu ,stg4_dmu_peu_por_in_c3b ,
     stg4_dmu_peu_wmr_in_c3b ,stg4_spc2_clk_stop_in_c3b ,
     stg4_db0_clk_stop_c3b ,stg4_dmu_io_clk_stop_in_c3b ,
     stg4_peu_io_clk_stop_in_c3b ,gl_io_out_c3b ,gl_dmu_peu_por_c3b ,
     gl_dmu_peu_wmr_c3b ,gl_spc2_clk_stop ,gl_db0_clk_stop ,
     gl_dmu_io_clk_stop ,gl_peu_io_clk_stop ,stg4_io_out_in_c3b
      );

input       gclk_dmu ;
input       stg4_db0_clk_stop_c3b ;
input       stg4_dmu_io_clk_stop_in_c3b ;
input       stg4_dmu_peu_por_in_c3b ;
input       stg4_dmu_peu_wmr_in_c3b ;
input       stg4_io_out_in_c3b ;
input       stg4_peu_io_clk_stop_in_c3b ;
input       stg4_spc2_clk_stop_in_c3b ;
output      gl_db0_clk_stop ;
output      gl_dmu_io_clk_stop ;
output      gl_dmu_peu_por_c3b ;
output      gl_dmu_peu_wmr_c3b ;
output      gl_io_out_c3b ;
output      gl_peu_io_clk_stop ;
output      gl_spc2_clk_stop ;
 
wire [9:0]	unused;

n2_clk_gl_cc_stage_17s1 xc2t_s1_0  (
     .stg0_in          ({10'b0,stg4_peu_io_clk_stop_in_c3b ,
            stg4_dmu_io_clk_stop_in_c3b ,stg4_db0_clk_stop_c3b ,
            stg4_spc2_clk_stop_in_c3b ,stg4_dmu_peu_wmr_in_c3b ,
            stg4_dmu_peu_por_in_c3b ,stg4_io_out_in_c3b } ),
     .stg1_out         ({unused,gl_peu_io_clk_stop ,
            gl_dmu_io_clk_stop ,gl_db0_clk_stop ,
            gl_spc2_clk_stop ,gl_dmu_peu_wmr_c3b ,
			gl_dmu_peu_por_c3b,gl_io_out_c3b } ),
     .gclk             (gclk_dmu ) );
endmodule



// ************************************************************************
// 30 module n2_clk_gl_cc_stg_c3b_s1_2 (14x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c3b_s1_2 (stg4_sii_io_clk_stop_in_c3b ,
     gl_io_out_c3b ,gl_l2_wmr_c3b ,gl_l2_por_c3b ,gl_l2d2_clk_stop ,
     gl_l2d3_clk_stop ,gl_l2b2_clk_stop ,gl_l2b3_clk_stop ,
     gl_l2t2_clk_stop ,gl_sii_clk_stop ,gl_ncu_clk_stop ,
     gl_sii_io_clk_stop ,gl_ncu_io_clk_stop ,gclk_l2d2 ,
     stg4_ncu_clk_stop_in_c3b ,stg4_sii_clk_stop_in_c3b ,
     stg4_l2t2_clk_stop_in_c3b ,stg4_l2b3_clk_stop_in_c3b ,
     stg4_l2b2_clk_stop_in_c3b ,stg4_cmp_io_sync_en_in_c3b ,
     stg4_l2d3_clk_stop_in_c3b ,stg4_l2d2_clk_stop_in_c3b ,
     stg4_l2_por_in_c3b ,stg4_l2_wmr_in_c3b ,stg4_io_out_in_c3b ,
     stg4_io_cmp_sync_en_in_c3b ,gl_io_cmp_sync_en_c3b ,
     gl_cmp_io_sync_en_c3b ,stg4_ncu_io_clk_stop_c3b );


input		gclk_l2d2 ;
input		stg4_cmp_io_sync_en_in_c3b ;
input		stg4_io_cmp_sync_en_in_c3b ;
input		stg4_io_out_in_c3b ;
input		stg4_l2_por_in_c3b ;
input		stg4_l2_wmr_in_c3b ;
input		stg4_l2b2_clk_stop_in_c3b ;
input		stg4_l2b3_clk_stop_in_c3b ;
input		stg4_l2d2_clk_stop_in_c3b ;
input		stg4_l2d3_clk_stop_in_c3b ;
input		stg4_l2t2_clk_stop_in_c3b ;
input		stg4_ncu_clk_stop_in_c3b ;
input		stg4_ncu_io_clk_stop_c3b ;
input		stg4_sii_clk_stop_in_c3b ;
input		stg4_sii_io_clk_stop_in_c3b ;
output		gl_cmp_io_sync_en_c3b ;
output		gl_io_cmp_sync_en_c3b ;
output		gl_io_out_c3b ;
output		gl_l2_por_c3b ;
output		gl_l2_wmr_c3b ;
output		gl_l2b2_clk_stop ;
output		gl_l2b3_clk_stop ;
output		gl_l2d2_clk_stop ;
output		gl_l2d3_clk_stop ;
output		gl_l2t2_clk_stop ;
output		gl_ncu_clk_stop ;
output		gl_ncu_io_clk_stop ;
output		gl_sii_clk_stop ;
output		gl_sii_io_clk_stop ;

wire [2:0] 	unused; 
n2_clk_gl_cc_stage_17s1 xc3b_s1_2  (
     .stg0_in          ({3'b0,
		stg4_cmp_io_sync_en_in_c3b, stg4_io_cmp_sync_en_in_c3b,
		stg4_io_out_in_c3b, stg4_l2_por_in_c3b,
		stg4_l2_wmr_in_c3b, stg4_l2b2_clk_stop_in_c3b,
		stg4_l2b3_clk_stop_in_c3b, stg4_l2d2_clk_stop_in_c3b,
		stg4_l2d3_clk_stop_in_c3b, stg4_l2t2_clk_stop_in_c3b,
		stg4_ncu_clk_stop_in_c3b, stg4_ncu_io_clk_stop_c3b,
		stg4_sii_clk_stop_in_c3b, stg4_sii_io_clk_stop_in_c3b} ),
     .stg1_out         ({unused,
		gl_cmp_io_sync_en_c3b, gl_io_cmp_sync_en_c3b,
		gl_io_out_c3b, gl_l2_por_c3b,
		gl_l2_wmr_c3b, gl_l2b2_clk_stop,
		gl_l2b3_clk_stop, gl_l2d2_clk_stop,
		gl_l2d3_clk_stop, gl_l2t2_clk_stop,
		gl_ncu_clk_stop, gl_ncu_io_clk_stop,
		gl_sii_clk_stop, gl_sii_io_clk_stop} ),
     .gclk             (gclk_l2d2 ) );
endmodule



// ************************************************************************
// 31 module n2_clk_gl_cc_stg_c1b_s1_0 (17x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c1b_s1_0 (gclk_l2t6 ,stg1_l2b2_clk_stop_in_c1b ,
     stg2_l2t2_clk_stop_out_c1b ,stg1_spc7_clk_stop_in_c1b ,
     stg2_db0_clk_stop_out_c1b ,stg2_l2_por_out_c1b ,
     stg2_dmu_peu_wmr_out_c1b ,stg2_dmu_peu_por_out_c1b ,
     stg2_l2d3_clk_stop_out_c1b ,stg2_io_cmp_sync_en_out_c1b ,
     stg2_spc2_clk_stop_out_c1b ,
     stg2_l2t3_clk_stop_out_c1b ,stg2_cmp_io_sync_en_out_c1b ,
     stg2_l2_wmr_out_c1b ,stg2_spc3_clk_stop_out_c1b ,
     stg2_l2b2_clk_stop_out_c1b ,stg2_spc7_clk_stop_out_c1b ,
     stg1_l2d3_clk_stop_in_c1b ,stg1_l2t3_clk_stop_in_c1b ,
     stg1_l2t2_clk_stop_in_c1b ,stg1_dmu_peu_wmr_in_c1b ,
	stg1_io_out_in_c1b, stg2_io_out_out_c1b,
     stg1_dmu_peu_por_in_c1b , stg1_l2b3_clk_stop_in_c1b
      ,stg1_db0_clk_stop_in_c1b ,stg1_l2_por_in_c1b ,stg1_l2_wmr_in_c1b
      ,stg1_cmp_io_sync_en_in_c1b ,stg2_l2d2_clk_stop_out_c1b ,
     stg1_l2d2_clk_stop_in_c1b ,stg1_io_cmp_sync_en_in_c1b ,
     stg1_spc2_clk_stop_in_c1b ,stg2_l2b3_clk_stop_out_c1b ,
     stg1_spc3_clk_stop_in_c1b );



input		gclk_l2t6 ;
input		stg1_cmp_io_sync_en_in_c1b ;
input		stg1_db0_clk_stop_in_c1b ;
input		stg1_dmu_peu_por_in_c1b ;
input		stg1_dmu_peu_wmr_in_c1b ;
input		stg1_io_cmp_sync_en_in_c1b ;
input		stg1_l2_por_in_c1b ;
input		stg1_l2_wmr_in_c1b ;
input		stg1_l2b2_clk_stop_in_c1b ;
input		stg1_l2b3_clk_stop_in_c1b ;
input		stg1_l2d2_clk_stop_in_c1b ;
input		stg1_l2d3_clk_stop_in_c1b ;
input		stg1_l2t2_clk_stop_in_c1b ;
input		stg1_l2t3_clk_stop_in_c1b ;
input		stg1_spc2_clk_stop_in_c1b ;
input		stg1_spc3_clk_stop_in_c1b ;
input		stg1_spc7_clk_stop_in_c1b ;
input 		stg1_io_out_in_c1b;
output		stg2_cmp_io_sync_en_out_c1b ;
output		stg2_db0_clk_stop_out_c1b ;
output		stg2_dmu_peu_por_out_c1b ;
output		stg2_dmu_peu_wmr_out_c1b ;
output		stg2_io_cmp_sync_en_out_c1b ;
output		stg2_l2_por_out_c1b ;
output		stg2_l2_wmr_out_c1b ;
output		stg2_l2b2_clk_stop_out_c1b ;
output		stg2_l2b3_clk_stop_out_c1b ;
output		stg2_l2d2_clk_stop_out_c1b ;
output		stg2_l2d3_clk_stop_out_c1b ;
output		stg2_l2t2_clk_stop_out_c1b ;
output		stg2_l2t3_clk_stop_out_c1b ;
output		stg2_spc2_clk_stop_out_c1b ;
output		stg2_spc3_clk_stop_out_c1b ;
output		stg2_spc7_clk_stop_out_c1b ;
output 		stg2_io_out_out_c1b;

 
n2_clk_gl_cc_stage_17s1 xc1b_s1_0  (
     .stg0_in          ({stg1_l2t3_clk_stop_in_c1b ,
            stg1_l2t2_clk_stop_in_c1b ,stg1_l2b3_clk_stop_in_c1b ,
            stg1_l2b2_clk_stop_in_c1b ,stg1_l2d3_clk_stop_in_c1b ,
            stg1_l2d2_clk_stop_in_c1b ,stg1_db0_clk_stop_in_c1b ,
            stg1_spc7_clk_stop_in_c1b ,stg1_spc3_clk_stop_in_c1b ,
            stg1_spc2_clk_stop_in_c1b ,stg1_dmu_peu_wmr_in_c1b ,
            stg1_dmu_peu_por_in_c1b ,stg1_l2_por_in_c1b ,
            stg1_l2_wmr_in_c1b ,stg1_io_out_in_c1b ,
            stg1_io_cmp_sync_en_in_c1b ,stg1_cmp_io_sync_en_in_c1b } ),
     .stg1_out         ({stg2_l2t3_clk_stop_out_c1b ,
            stg2_l2t2_clk_stop_out_c1b ,stg2_l2b3_clk_stop_out_c1b ,
            stg2_l2b2_clk_stop_out_c1b ,stg2_l2d3_clk_stop_out_c1b ,
            stg2_l2d2_clk_stop_out_c1b ,stg2_db0_clk_stop_out_c1b ,
            stg2_spc7_clk_stop_out_c1b ,stg2_spc3_clk_stop_out_c1b ,
            stg2_spc2_clk_stop_out_c1b ,stg2_dmu_peu_wmr_out_c1b ,
            stg2_dmu_peu_por_out_c1b ,stg2_l2_por_out_c1b ,
            stg2_l2_wmr_out_c1b ,stg2_io_out_out_c1b ,
            stg2_io_cmp_sync_en_out_c1b ,stg2_cmp_io_sync_en_out_c1b } )
,
     .gclk             (gclk_l2t6 ) );
endmodule


// ************************************************************************
// 32 module n2_clk_gl_cc_stg_c1b_s1_1 (8x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c1b_s1_1 (gclk_spc6 ,stg2_ncu_io_clk_stop_out_c1b
      ,stg2_ccx_clk_stop_out_c1b ,stg1_ncu_clk_stop_in_c1b ,
     stg1_sii_io_clk_stop_in_c1b ,stg1_ncu_io_clk_stop_in_c1b ,
     stg1_sii_clk_stop_in_c1b ,stg1_ccx_clk_stop_in_c1b ,
     stg1_dmu_io_clk_stop_in_c1b ,stg2_peu_io_clk_stop_out_c1b ,
     stg2_sii_clk_stop_out_c1b ,stg2_ncu_clk_stop_out_c1b ,
     stg2_l2t7_clk_stop_out_c1b ,stg2_dmu_io_clk_stop_out_c1b ,
     stg1_peu_io_clk_stop_in_c1b ,stg1_l2t7_clk_stop_in_c1b ,
     stg2_sii_io_clk_stop_out_c1b );

input       gclk_spc6 ;
input       stg1_ccx_clk_stop_in_c1b ;
input       stg1_dmu_io_clk_stop_in_c1b ;
input       stg1_l2t7_clk_stop_in_c1b ;
input       stg1_ncu_clk_stop_in_c1b ;
input       stg1_ncu_io_clk_stop_in_c1b ;
input       stg1_peu_io_clk_stop_in_c1b ;
input       stg1_sii_clk_stop_in_c1b ;
input       stg1_sii_io_clk_stop_in_c1b ;
output      stg2_ccx_clk_stop_out_c1b ;
output      stg2_dmu_io_clk_stop_out_c1b ;
output      stg2_l2t7_clk_stop_out_c1b ;
output      stg2_ncu_clk_stop_out_c1b ;
output      stg2_ncu_io_clk_stop_out_c1b ;
output      stg2_peu_io_clk_stop_out_c1b ;
output      stg2_sii_clk_stop_out_c1b ;
output      stg2_sii_io_clk_stop_out_c1b ;

wire [8:0] unused;
 
 
n2_clk_gl_cc_stage_17s1 xc1b_s1_1  (
     .stg0_in          ({9'b0,stg1_peu_io_clk_stop_in_c1b ,
            stg1_dmu_io_clk_stop_in_c1b ,stg1_ncu_io_clk_stop_in_c1b ,
            stg1_sii_io_clk_stop_in_c1b ,stg1_ncu_clk_stop_in_c1b ,
            stg1_sii_clk_stop_in_c1b ,stg1_ccx_clk_stop_in_c1b ,
            stg1_l2t7_clk_stop_in_c1b } ),
     .stg1_out         ({unused,stg2_peu_io_clk_stop_out_c1b ,
            stg2_dmu_io_clk_stop_out_c1b ,stg2_ncu_io_clk_stop_out_c1b ,
            stg2_sii_io_clk_stop_out_c1b ,stg2_ncu_clk_stop_out_c1b ,
            stg2_sii_clk_stop_out_c1b ,stg2_ccx_clk_stop_out_c1b ,
            stg2_l2t7_clk_stop_out_c1b } ),
     .gclk             (gclk_spc6 ) );
endmodule




// ************************************************************************
// 33 module n2_clk_gl_cc_stg_c2t_s1_1 (5x1)
// ************************************************************************

module n2_clk_gl_cc_stg_c2t_s1_1 (stg2_io2x_sync_en_in_c2t ,
	  // stg3_spc1_clk_stop_in_c2b, stg3_spc5_clk_stop_in_c2b ,
     stg3_io2x_sync_en_out_c2t , 
     // stg4_spc1_clk_stop_out_c2b , stg4_spc5_clk_stop_out_c2b ,
	 gclk_l2t5 ,
			stg2_mcu0_clk_stop_in_c2t,
			stg2_mcu1_clk_stop_in_c2t,
			stg3_mcu0_clk_stop_out_c2t,
			stg3_mcu1_clk_stop_out_c2t,
			stg2_mcu0_io_clk_stop_in_c2t,
//			stg2_mcu0_dr_clk_stop_in_c2t, // FOR INT6.1
//			stg2_mcu1_dr_clk_stop_in_c2t, // FOR INT6.1
			stg2_mcu1_io_clk_stop_in_c2t,
//			stg3_mcu0_dr_clk_stop_out_c2t, // FOR INT6.1
			stg3_mcu0_io_clk_stop_out_c2t,
//			stg3_mcu1_dr_clk_stop_out_c2t, // FOR INT6.1
			stg3_mcu1_io_clk_stop_out_c2t,
		stg2_mio_clk_stop_in_c2t , stg3_mio_clk_stop_out_c2t 

 );

input       gclk_l2t5 ;
input       stg2_io2x_sync_en_in_c2t ;
// input       stg3_spc1_clk_stop_in_c2b ;
// input       stg3_spc5_clk_stop_in_c2b ;
input 		stg2_mio_clk_stop_in_c2t ; 
output 		stg3_mio_clk_stop_out_c2t ; 
output      stg3_io2x_sync_en_out_c2t ;
// output      stg4_spc1_clk_stop_out_c2b ;
// output      stg4_spc5_clk_stop_out_c2b ;
 
input		stg2_mcu0_clk_stop_in_c2t;
input		stg2_mcu1_clk_stop_in_c2t;
output		stg3_mcu0_clk_stop_out_c2t;
output		stg3_mcu1_clk_stop_out_c2t;

 
input		stg2_mcu0_io_clk_stop_in_c2t;
//input		stg2_mcu0_dr_clk_stop_in_c2t;
//input		stg2_mcu1_dr_clk_stop_in_c2t;
input		stg2_mcu1_io_clk_stop_in_c2t;
//output		stg3_mcu0_dr_clk_stop_out_c2t;
output		stg3_mcu0_io_clk_stop_out_c2t;
//output		stg3_mcu1_dr_clk_stop_out_c2t;
output		stg3_mcu1_io_clk_stop_out_c2t;

wire [10:0] unused;

n2_clk_gl_cc_stage_17s1 xc2t_s1_1  (
     .stg0_in          ({11'b0, 
			stg2_mio_clk_stop_in_c2t, 
			stg2_mcu0_clk_stop_in_c2t,
			stg2_mcu0_io_clk_stop_in_c2t,
//			stg2_mcu0_dr_clk_stop_in_c2t,
			stg2_mcu1_clk_stop_in_c2t,
			stg2_mcu1_io_clk_stop_in_c2t,
//			stg2_mcu1_dr_clk_stop_in_c2t,
//          stg3_spc5_clk_stop_in_c2b ,
//          stg3_spc1_clk_stop_in_c2b ,
			stg2_io2x_sync_en_in_c2t } ),
     .stg1_out         ({unused, 
			stg3_mio_clk_stop_out_c2t, 
			stg3_mcu0_clk_stop_out_c2t,
			stg3_mcu0_io_clk_stop_out_c2t,
//			stg3_mcu0_dr_clk_stop_out_c2t,
			stg3_mcu1_clk_stop_out_c2t,
			stg3_mcu1_io_clk_stop_out_c2t,
//			stg3_mcu1_dr_clk_stop_out_c2t,
//          stg4_spc5_clk_stop_out_c2b ,
//          stg4_spc1_clk_stop_out_c2b ,
			stg3_io2x_sync_en_out_c2t } ),
     .gclk             (gclk_l2t5 ) );
endmodule

// ************************************************************************
// 35 module n2_clk_gl_cc_stage_align 
// ************************************************************************

// n2_clk_gl_cc_stage_ccu_align (
module n2_clk_gl_cc_stage_align (
	gclk_a , gclk_b ,gclk_aligned , gclk_c, ccu_vco_aligned 
);
output          gclk_aligned ;
input           gclk_a ;
input           gclk_b ;
input           gclk_c ;
input           ccu_vco_aligned ;

reg		q2;
reg		q3;
wire		gclk_b;
wire		gclk_c;
wire		gclk_aligned;
wire		ccu_vco_aligned;

// special aligned signal


// delayed clocking scheme
// following causes functional mismatch
// uncomment this for equivalency
	// always @(posedge gclk_b) begin
	//         q2 <= ccu_vco_aligned;
	// end
	// 
	// always @(posedge gclk_c) begin
	// 
	//         q3 <= q2;
	// end
	// assign gclk_aligned = q3; 

assign gclk_aligned = ccu_vco_aligned;

endmodule


// ************************************************************************
// 36  n2_clk_gl_cc_stg_mcu_dr   - FOR INT6.1
// ************************************************************************
module n2_clk_gl_cc_stg_mcu_dr(stg1_mcu1_dr_clk_stop_in ,
     stg2_mcu0_dr_clk_stop_out ,stg2_mcu1_dr_clk_stop_out ,dr_gclk ,
     stg1_mcu0_dr_clk_stop_in );
output		stg2_mcu0_dr_clk_stop_out ;
output		stg2_mcu1_dr_clk_stop_out ;
input		stg1_mcu1_dr_clk_stop_in ;
input		dr_gclk ;
input		stg1_mcu0_dr_clk_stop_in ;

wire [14:0] unused;

n2_clk_gl_cc_stage_17s1 xmcu_dr_0 (
	.gclk 		( dr_gclk ),
	.stg0_in   ({15'b0, stg1_mcu1_dr_clk_stop_in, stg1_mcu0_dr_clk_stop_in}),
	.stg1_out ({unused, stg2_mcu1_dr_clk_stop_out, stg2_mcu0_dr_clk_stop_out})
);
 
endmodule

	// ************************************************************************
	// 34 module n2_clk_gl_cc_stage_top
	// ************************************************************************

	module n2_clk_gl_cc_stage_top (
				// for int6.1 (set 3)
				gclk_spc6s,
				stg1_cmp_io_sync_en_in_c1bg,
				stg1_cmp_io_sync_en_in_c1tg,
				stg1_io_cmp_sync_en_in_c1bg,
				stg1_io_cmp_sync_en_in_c1tg,
				stg1_io_out_in_c1bg,
				stg1_l2_por_in_c1bg,
				stg1_l2_por_in_c1tg,
				stg1_l2_wmr_in_c1bg,
				stg1_l2_wmr_in_c1tg,
				stg1_mio_clk_stop_in_c1tg,
				stg1_mio_io2x_sync_en_in_c1tg,
				stg4_cmp_io_sync_en_in_c3t0,
				stg4_io_cmp_sync_en_in_c3t0,
				stg4_io_out_in_c3b0,
				stg4_l2_por_in_c3t0,
				stg4_l2_wmr_in_c3t0,

				stg2_mcu0_clk_stop_in_c2t,
				stg2_mcu1_clk_stop_in_c2t,
				stg3_mcu0_clk_stop_out_c2t,
				stg3_mcu1_clk_stop_out_c2t,
				stg2_mcu0_io_clk_stop_in_c2t,
//				stg2_mcu0_dr_clk_stop_in_c2t,
//				stg2_mcu1_dr_clk_stop_in_c2t,
				stg2_mcu1_io_clk_stop_in_c2t,
//				stg3_mcu0_dr_clk_stop_out_c2t,
				stg3_mcu0_io_clk_stop_out_c2t,
//				stg3_mcu1_dr_clk_stop_out_c2t,
				stg3_mcu1_io_clk_stop_out_c2t,
		 stg2_io_out_out_c1b ,
		stg2_io2x_sync_en_in_c2t,
		stg3_io2x_sync_en_out_c2t,
		 stg2_mio_clk_stop_in_c2t, stg3_mio_clk_stop_out_c2t, 
		 gclk_aligned, ccu_vco_aligned, gclk_a, gclk_b, gclk_c,
		 stg1_l2d2_clk_stop_in_c1b ,
		 stg2_l2d2_clk_stop_out_c1b ,gl_io_out_c3b0 ,gl_l2_por_c3b0 ,
		 gl_io_cmp_sync_en_c2t ,gl_l2_por_c2t ,gl_cmp_io_sync_en_c2t ,
		 gl_cmp_io_sync_en_c3t0 ,gl_l2t5_clk_stop ,
		 stg3_l2t1_clk_stop_in_c2t ,stg3_l2_wmr_in_c2t ,gclk_spc3 ,gclk_l2t3,
		 gclk_l2t7 ,gclk_spc7 ,stg3_l2t5_clk_stop_in_c2t ,
		 stg3_io_cmp_sync_en_in_c2t ,gl_io2x_sync_en_c3t0 ,
		 gl_io_cmp_sync_en_c3t0 ,gl_l2_por_c3t0 ,gl_spc0_clk_stop ,
		 gl_mio_clk_stop_c1t ,gl_l2d5_clk_stop,gl_l2t1_clk_stop,
		 gclk_dmu ,gclk_l2d2 ,gclk_mac ,gclk_l2d6 ,gl_spc5_clk_stop,
		 stg3_l2_por_in_c2t ,stg3_cmp_io_sync_en_in_c2t ,
		 gl_io2x_sync_en_c2t ,gl_spc1_clk_stop, 
		 stg4_cmp_io_sync_en_out_c3b ,stg4_l2t2_clk_stop_out_c3b ,
		 stg4_io_out_out_c3b ,stg4_l2_wmr_out_c3b ,stg4_l2_por_out_c3b ,
		 stg4_dmu_peu_por_out_c3b ,stg4_dmu_peu_wmr_out_c3b ,
		 stg4_spc2_clk_stop_out_c3b ,stg4_db0_clk_stop_out_c3b ,
		 stg4_l2d2_clk_stop_out_c3b ,stg4_l2d3_clk_stop_out_c3b ,
		 stg4_l2b2_clk_stop_out_c3b ,stg4_l2b3_clk_stop_out_c3b ,
		 stg4_io_cmp_sync_en_out_c3b ,stg3_l2b2_clk_stop_in_c3b ,
		 stg3_l2b3_clk_stop_in_c3b ,stg3_l2t2_clk_stop_in_c3b ,
		 stg3_io_cmp_sync_en_in_c3b ,stg3_io_out_in_c3b ,stg3_l2_wmr_in_c3b
		  ,stg3_l2_por_in_c3b ,stg3_dmu_peu_por_in_c3b ,
		 stg3_dmu_peu_wmr_in_c3b ,stg3_spc2_clk_stop_in_c3b ,
		 stg3_cmp_io_sync_en_in_c3b ,stg3_db0_clk_stop_in_c3b ,
		 stg3_l2d2_clk_stop_in_c3b ,stg3_l2d3_clk_stop_in_c3b ,
		 stg4_sii_clk_stop_out_c3b ,stg4_ncu_clk_stop_out_c3b ,
		 stg4_sii_io_clk_stop_out_c3b ,stg4_ncu_io_clk_stop_out_c3b ,
		 stg4_dmu_io_clk_stop_out_c3b ,stg4_peu_io_clk_stop_out_c3b ,
		 stg3_sii_clk_stop_in_c3b ,stg3_ncu_clk_stop_in_c3b ,
		 stg3_sii_io_clk_stop_in_c3b ,stg3_ncu_io_clk_stop_in_c3b ,
		 stg3_dmu_io_clk_stop_in_c3b ,stg3_peu_io_clk_stop_in_c3b ,
		 gl_cmp_io_sync_en_c3b ,gl_io_cmp_sync_en_c3b ,gl_ncu_clk_stop ,
		 gl_sii_io_clk_stop ,gl_ncu_io_clk_stop ,gl_l2_wmr_c3b ,
		 gl_l2d2_clk_stop ,gl_l2d3_clk_stop ,gl_l2b2_clk_stop ,
		 gl_l2b3_clk_stop ,gl_l2t2_clk_stop ,gl_io_out_c3b ,
		 gl_sii_clk_stop ,stg4_l2_wmr_in_c3b ,stg4_io_out_in_c3b ,
		 stg4_io_cmp_sync_en_in_c3b ,stg4_ncu_io_clk_stop_c3b ,
		 stg4_sii_io_clk_stop_in_c3b ,stg4_ncu_clk_stop_in_c3b ,
		 stg4_sii_clk_stop_in_c3b ,stg4_l2t2_clk_stop_in_c3b ,
		 stg4_l2b3_clk_stop_in_c3b ,stg4_l2b2_clk_stop_in_c3b ,
		 stg4_cmp_io_sync_en_in_c3b ,stg4_l2d3_clk_stop_in_c3b ,
		 stg4_l2d2_clk_stop_in_c3b ,stg4_l2_por_in_c3b ,gl_db0_clk_stop
		  ,gl_dmu_io_clk_stop ,gl_peu_io_clk_stop ,
		 gl_dmu_peu_por_c3b ,gl_dmu_peu_wmr_c3b ,gl_spc2_clk_stop ,
		 stg4_dmu_peu_por_in_c3b ,stg4_dmu_peu_wmr_in_c3b ,
		 stg4_spc2_clk_stop_in_c3b ,stg4_db0_clk_stop_c3b ,
		 stg4_dmu_io_clk_stop_in_c3b ,stg4_peu_io_clk_stop_in_c3b ,
		 stg4_cmp_io_sync_en_out_c3t ,stg4_io_cmp_sync_en_out_c3t ,
		 stg4_mio_io2x_sync_en_out_c3t ,stg4_dr_sync_en_out_c3t ,
		 stg4_io_out_out_c3t ,stg4_l2_wmr_out_c3t ,stg4_l2_por_out_c3t ,
		 stg4_spc0_clk_stop_out_c3t ,stg4_l2d0_clk_stop_out_c3t ,
		 stg4_l2d1_clk_stop_out_c3t ,stg4_l2b0_clk_stop_out_c3t ,
		 stg4_l2b1_clk_stop_out_c3t ,stg4_l2t0_clk_stop_out_c3t ,
		 stg3_l2b1_clk_stop_in_c3t ,stg3_l2t0_clk_stop_in_c3t ,
		 stg3_io_cmp_sync_en_in_c3t ,stg3_mio_io2x_sync_en_in_c3t ,
		 stg3_dr_sync_en_in_c3t ,stg3_io_out_in_c3t ,stg3_l2_wmr_in_c3t ,
		 stg3_l2_por_in_c3t ,stg3_spc0_clk_stop_in_c3t ,
		 stg3_cmp_io_sync_en_in_c3t ,stg3_l2d0_clk_stop_in_c3t ,
		 stg3_l2d1_clk_stop_in_c3t ,stg3_l2b0_clk_stop_in_c3t ,
		 // stg4_mcu1_dr_clk_stop_out_c3t ,
		 stg4_mio_clk_stop_out_c3t ,
		 stg4_mcu0_clk_stop_out_c3t ,stg4_mcu1_clk_stop_out_c3t ,
		 stg4_mcu0_io_clk_stop_out_c3t ,stg4_mcu1_io_clk_stop_out_c3t ,
		 // stg4_mcu0_dr_clk_stop_out_c3t ,
		 stg3_mcu0_clk_stop_in_c3t ,
		 stg3_mcu1_clk_stop_in_c3t ,stg3_mcu0_io_clk_stop_in_c3t ,
		 stg3_mcu1_io_clk_stop_in_c3t ,
		 // stg3_mcu0_dr_clk_stop_in_c3t , stg3_mcu1_dr_clk_stop_in_c3t ,
		 stg3_mio_clk_stop_in_c3t ,
		 gl_l2_wmr_c3t0 ,gl_cmp_io_sync_en_c3t ,gl_io_cmp_sync_en_c3t ,
		 gl_l2_wmr_c3t ,gl_l2_por_c3t ,gl_l2d0_clk_stop ,
		 gl_l2d1_clk_stop ,gl_l2b0_clk_stop ,gl_l2b1_clk_stop ,
		 gl_mio_clk_stop_c3t ,gl_io2x_sync_en_c3t ,
		 stg4_cmp_io_sync_en_in_c3t ,stg4_io2x_sync_en_in_c3t ,
		 stg4_spc0_clk_stop_in_c3t ,stg4_io_cmp_sync_en_in_c3t ,
		 stg4_l2_wmr_in_c3t ,gl_io_cmp_sync_en_c1t ,stg4_l2_por_in_c3t ,
		 gl_cmp_io_sync_en_c1t ,stg4_l2d0_clk_stop_in_c3t ,
		 stg4_l2d1_clk_stop_in_c3t ,stg3_mio_clk_stop_in_c2t ,
		 // stg4_spc1_clk_stop_out_c2b ,
		 stg4_l2b0_clk_stop_in_c3t ,stg4_l2b1_clk_stop_in_c3t ,
		 stg4_mio_clk_stop_in_c3t ,gclk_l2b4 ,stg3_io2x_sync_en_in_c2t ,
		 gclk_l2b5 ,gclk_l2b6 , stg2_ncu_io_clk_stop_in_c2b ,stg3_ccx_clk_stop_out_c2b ,
		 stg2_spc3_clk_stop_in_c2b ,stg3_l2b0_clk_stop_out_c2t ,
		 stg3_sii_clk_stop_out_c2b ,
		 stg2_l2t2_clk_stop_in_c2b ,stg3_cmp_io_sync_en_out_c2t ,
		 gl_l2_wmr_c1t ,gl_mio_io2x_sync_en_c1t ,gclk_l2t4 ,
		 stg1_cmp_io_sync_en_in_c1t,gclk_spc6 ,stg1_l2d5_clk_stop_in_c1t ,
		 stg3_l2b3_clk_stop_out_c2b ,stg2_l2t5_clk_stop_in_c2t ,
		 stg2_cmp_io_sync_en_in_c2t ,stg2_l2t3_clk_stop_in_c2bz ,
		 stg2_l2_wmr_in_c2b ,stg2_dmu_peu_wmr_in_c2b ,
		 stg2_spc2_clk_stop_in_c2b ,stg3_peu_io_clk_stop_out_c2b ,
		 stg3_ncu_io_clk_stop_out_c2b ,stg2_l2t7_clk_stop_in_c2b ,
		 stg2_ccx_clk_stop_in_c2b ,stg2_ncu_clk_stop_in_c2b ,
		 stg2_sii_io_clk_stop_in_c2b ,stg2_peu_io_clk_stop_in_c2b ,
		 stg3_l2_por_in_c2b ,stg3_l2_wmr_in_c2b ,stg3_cmp_io_sync_en_in_c2b,
		 gl_spc3_clk_stop ,stg3_spc7_clk_stop_in_c2b ,gl_spc4_clk_stop ,
		 stg1_spc4_clk_stop_in_c1t,
		 stg3_l2t5_clk_stop_out_c2t ,stg3_l2t0_clk_stop_out_c2t ,
		 stg3_l2b1_clk_stop_out_c2t ,stg3_l2d0_clk_stop_out_c2t ,
		 stg3_spc5_clk_stop_out_c2t ,stg3_io_out_out_c2t ,
		 stg3_io_cmp_sync_en_out_c2t ,stg3_l2_por_out_c2t ,
		 stg2_mio_clk_stop_out_c1t ,stg2_mcu0_clk_stop_out_c1t ,
		 // stg1_mcu0_dr_clk_stop_in_c1t ,
		 stg1_mio_clk_stop_in_c1t ,
		 stg2_dmu_peu_por_in_c2b ,stg2_spc7_clk_stop_in_c2b ,
		 stg2_db0_clk_stop_in_c2b ,stg3_sii_io_clk_stop_out_c2b ,
		 stg3_l2t7_clk_stop_out_c2b ,stg2_sii_clk_stop_in_c2b ,
		 stg2_dmu_io_clk_stop_in_c2b ,stg3_l2t3_clk_stop_in_c2b ,
		 stg3_io_cmp_sync_en_in_c2b ,stg3_spc3_clk_stop_in_c2b ,
		 stg3_l2t1_clk_stop_out_c2t ,stg3_l2d1_clk_stop_out_c2t ,
		 stg3_spc0_clk_stop_out_c2t ,stg3_l2_wmr_out_c2t ,
		 stg3_mio_io2x_sync_en_out_c2t ,stg2_l2b2_clk_stop_in_c2b ,
		 stg2_l2b3_clk_stop_in_c2b ,gl_l2b4_clk_stop ,
		 stg1_l2b4_clk_stop_in_c1t ,stg3_l2t2_clk_stop_out_c2b ,
		 stg3_l2d2_clk_stop_out_c2b ,stg3_l2d3_clk_stop_out_c2b ,
		 stg3_io_cmp_sync_en_out_c2b ,stg3_io_out_out_c2b ,
		 stg3_dmu_peu_wmr_out_c2b ,stg3_spc2_clk_stop_out_c2b ,
		 stg2_l2d2_clk_stop_in_c2b ,stg2_l2d3_clk_stop_in_c2b ,gl_l2_por_c1t
		  ,stg1_l2d4_clk_stop_in_c1t ,stg3_l2t3_clk_stop_out_c2b ,
		 gl_l2b5_clk_stop ,stg3_db0_clk_stop_out_c2b ,
		 stg3_cmp_io_sync_en_out_c2b ,stg3_dmu_peu_por_out_c2b ,
		 stg3_spc3_clk_stop_out_c2b ,stg3_spc1_clk_stop_in_c2t ,
		 stg3_spc5_clk_stop_in_c2t ,stg2_dr_sync_en_in_c2t ,
		 stg2_l2_por_in_c2t ,stg2_spc5_clk_stop_in_c2t ,
		 stg2_l2b0_clk_stop_in_c2t ,stg2_l2t1_clk_stop_in_c2t ,
		 stg2_io_cmp_sync_en_in_c2t ,
		 stg2_mio_io2x_sync_en_in_c2t ,stg2_io_out_in_c2t ,
		 stg2_l2_wmr_in_c2t ,stg2_spc0_clk_stop_in_c2t ,
		 stg2_spc1_clk_stop_in_c2t ,stg2_l2d0_clk_stop_in_c2t ,
		 stg2_l2d1_clk_stop_in_c2t ,stg2_l2b1_clk_stop_in_c2t ,
		 stg2_l2t0_clk_stop_in_c2t ,gl_l2_wmr_c2t ,
		 // stg4_spc5_clk_stop_out_c2b ,
		 stg4_io_out_in_c3t ,
		 gl_mcu1_dr_clk_stop ,gclk_spc4 ,gl_mcu0_io_clk_stop ,
		 stg4_dr_sync_en_in_c3t ,stg4_io2x_sync_en_c3t ,
		 stg4_mcu1_io_clk_stop_in_c3t ,stg4_mcu0_io_clk_stop_in_c3t ,
		 // stg4_mcu1_dr_clk_stop_in_c3t ,
		 stg4_mcu1_clk_stop_in_c3t ,
		 gl_mcu0_dr_clk_stop ,gl_mcu1_clk_stop ,gl_mcu0_clk_stop
		  ,gl_l2t0_clk_stop ,gl_io_out_c3t ,gl_dr_sync_en_c3t ,
		 gl_mcu1_io_clk_stop ,gclk_l2t6 ,// stg4_mcu0_dr_clk_stop_in_c3t ,
		 stg4_mcu0_clk_stop_in_c3t ,stg4_l2t0_clk_stop_in_c3t ,gclk_l2t2 ,
		 gclk_ncu ,gclk_spc2 ,gclk_l2b0 ,gclk_spc0 ,gclk_l2t0 ,gclk_spc5 ,
		 gclk_spc1 ,gclk_l2t5 ,gclk_l2t1 ,stg2_mcu1_clk_stop_out_c1t ,
		 stg1_mcu1_clk_stop_in_c1t ,stg1_mcu0_io_clk_stop_in_c1t ,
		 // stg2_mcu0_dr_clk_stop_out_c1t ,stg2_mcu1_dr_clk_stop_out_c1t ,
		 stg2_mcu1_io_clk_stop_out_c1t ,stg1_mcu1_io_clk_stop_in_c1t ,
		 // stg1_mcu1_dr_clk_stop_in_c1t ,
		 stg1_mcu0_clk_stop_in_c1t ,
		 stg2_mcu0_io_clk_stop_out_c1t ,stg3_dr_sync_en_out_c2t ,
		 stg3_spc1_clk_stop_out_c2t ,stg3_ccx_clk_stop_in_c2b ,
		 stg3_l2t7_clk_stop_in_c2b ,stg3_dmu_io_clk_stop_out_c2b ,
		 stg3_ncu_clk_stop_out_c2b ,stg2_l2_por_in_c2b ,
		 stg2_io_cmp_sync_en_in_c2b ,stg2_cmp_io_sync_en_in_c2b ,
		 stg3_l2_wmr_out_c2b ,
		 stg3_l2_por_out_c2b ,
		 stg3_l2b2_clk_stop_out_c2b ,stg1_l2b5_clk_stop_in_c1t ,
		 gl_l2d4_clk_stop ,gclk_l2d5 ,
		 stg1_mio_io2x_sync_en_in_c1t ,stg1_l2_wmr_in_c1t ,
		 stg1_l2_por_in_c1t ,stg1_spc1_clk_stop_in_c1t ,
		 stg1_l2b0_clk_stop_in_c1t ,stg1_l2t5_clk_stop_in_c1t ,
		 stg1_l2t1_clk_stop_in_c1t ,stg1_l2d1_clk_stop_in_c1t ,
		 stg1_io_cmp_sync_en_in_c1t ,stg1_io_out_in_c1t ,
		 stg1_l2d0_clk_stop_in_c1t ,stg1_l2t0_clk_stop_in_c1t ,
		 stg1_l2b1_clk_stop_in_c1t ,stg1_dr_sync_en_in_c1t ,
		 stg1_spc0_clk_stop_in_c1t ,stg1_spc5_clk_stop_in_c1t ,
		 stg2_spc1_clk_stop_out_c1t ,stg2_cmp_io_sync_en_out_c1t ,
		 stg2_l2_wmr_out_c1t ,stg2_mio_io2x_sync_en_out_c1t ,
		 stg2_dr_sync_en_out_c1t ,stg2_spc0_clk_stop_out_c1t ,
		 stg2_spc5_clk_stop_out_c1t ,stg2_l2d0_clk_stop_out_c1t ,
		 stg2_l2d1_clk_stop_out_c1t ,stg2_l2b1_clk_stop_out_c1t ,
		 stg2_l2b0_clk_stop_out_c1t ,stg2_l2t0_clk_stop_out_c1t ,
		 stg2_l2t5_clk_stop_out_c1t ,stg2_l2t1_clk_stop_out_c1t ,
		 stg2_io_out_out_c1t ,stg2_l2_por_out_c1t ,
		 stg2_io_cmp_sync_en_out_c1t ,gl_io_out_c1b ,gl_io2x_out_c1b ,
		 gl_rst_niu_wmr_c1b ,gl_rst_mac_c1b ,stg1_io2x_out_in_c1b ,
		 stg1_io_out_in_c1b ,stg1_rst_mac_in_c1b ,stg1_rst_niu_wmr_in_c1b ,
		 gl_rtx_io_clk_stop ,gl_rdp_io_clk_stop ,gl_tds_io_clk_stop ,
		 gl_mac_io_clk_stop ,stg1_tds_io_clk_stop_in_c1b ,
		 stg1_rdp_io_clk_stop_in_c1b ,stg1_rtx_io_clk_stop_in_c1b ,
		 stg1_mac_io_clk_stop_in_c1b ,gl_spc6_clk_stop ,
		 gl_l2d7_clk_stop ,
		 stg1_l2d7_clk_stop_in_c1b ,stg1_spc6_clk_stop_in_c1b 
		  ,gl_io_cmp_sync_en_c1b ,gl_l2_wmr_c1b ,
		 gl_cmp_io_sync_en_c1b ,stg2_ccx_clk_stop_out_c1b ,
		 stg2_l2t7_clk_stop_out_c1b ,stg2_ncu_clk_stop_out_c1b ,
		 stg2_sii_clk_stop_out_c1b ,stg2_peu_io_clk_stop_out_c1b ,
		 stg2_ncu_io_clk_stop_out_c1b ,stg2_sii_io_clk_stop_out_c1b ,
		 stg2_dmu_io_clk_stop_out_c1b ,stg1_peu_io_clk_stop_in_c1b ,
		 stg1_dmu_io_clk_stop_in_c1b ,stg1_ccx_clk_stop_in_c1b ,
		 stg1_sii_clk_stop_in_c1b ,stg1_ncu_io_clk_stop_in_c1b ,
		 stg1_sii_io_clk_stop_in_c1b ,stg1_ncu_clk_stop_in_c1b ,
		 stg1_l2t7_clk_stop_in_c1b ,stg2_spc7_clk_stop_out_c1b ,
		 stg2_spc2_clk_stop_out_c1b ,stg2_io_cmp_sync_en_out_c1b ,
		 stg2_l2d3_clk_stop_out_c1b ,
		 stg2_dmu_peu_por_out_c1b ,stg2_dmu_peu_wmr_out_c1b ,
		 stg2_l2_por_out_c1b ,stg2_db0_clk_stop_out_c1b ,
		 stg2_cmp_io_sync_en_out_c1b ,stg2_spc3_clk_stop_out_c1b ,
		 stg2_l2_wmr_out_c1b ,stg2_l2t3_clk_stop_out_c1b ,
		 stg2_l2t2_clk_stop_out_c1b ,stg2_l2b3_clk_stop_out_c1b ,
		 stg2_l2b2_clk_stop_out_c1b , stg1_l2_por_in_c1b ,
		 stg1_db0_clk_stop_in_c1b ,stg1_l2b3_clk_stop_in_c1b ,
		 stg1_dmu_peu_por_in_c1b ,stg1_dmu_peu_wmr_in_c1b ,
		 stg1_l2t2_clk_stop_in_c1b ,stg1_l2d3_clk_stop_in_c1b ,
		 stg1_spc2_clk_stop_in_c1b ,stg1_spc7_clk_stop_in_c1b ,
		 stg1_spc3_clk_stop_in_c1b ,stg1_io_cmp_sync_en_in_c1b ,
		 stg1_cmp_io_sync_en_in_c1b ,stg1_l2b2_clk_stop_in_c1b ,
		 stg1_l2_wmr_in_c1b ,stg1_l2t3_clk_stop_in_c1b ,gclk_tcu ,gclk_ccu ,
		 gclk_rst , dr_gclk_stg_tcu, dr_gclk_fsr7_stg, dr_gclk_c4_mcu1,
		 gl_mio_clk_stop_c2t ,gl_spc7_clk_stop,gl_l2_por_c2b ,
		 gl_l2t7_clk_stop ,gl_l2t3_clk_stop ,gl_l2_wmr_c2b ,
		 gl_io_cmp_sync_en_c2b ,gl_cmp_io_sync_en_c2b ,
		 gl_ccx_clk_stop ,ccu_io2x_sync_en ,ccu_cmp_io_sync_en ,
		 ccu_dr_sync_en ,ccu_io2x_out ,rst_niu_mac_ ,rst_dmu_peu_wmr_ ,
		 rst_niu_wmr_ ,rst_dmu_peu_por_ ,stg1_mio_clk_stop_out_c1t ,
		 stg1_spc5_clk_stop_out_c1t ,stg1_spc4_clk_stop_out_c1t ,
		 stg1_spc1_clk_stop_out_c1t ,stg1_spc0_clk_stop_out_c1t ,
		 stg1_mcu1_io_clk_stop_out_c1t ,stg1_mcu1_dr_clk_stop_out_c1t ,
		 stg1_mcu1_clk_stop_out_c1t ,stg1_mcu0_io_clk_stop_out_c1t ,
		 stg1_mcu0_dr_clk_stop_out_c1t ,stg1_mcu0_clk_stop_out_c1t ,
		 stg1_l2t1_clk_stop_out_c1t ,stg1_l2t0_clk_stop_out_c1t ,
		 stg1_l2d5_clk_stop_out_c1t ,stg1_l2d4_clk_stop_out_c1t ,
		 stg1_l2d1_clk_stop_out_c1t ,stg1_l2d0_clk_stop_out_c1t ,
		 stg1_l2b5_clk_stop_out_c1t ,stg1_l2b4_clk_stop_out_c1t ,
		 stg1_l2b0_clk_stop_out_c1t ,stg1_l2t5_clk_stop_out_c1t ,
		 gl_l2t4_clk_stop ,gl_ccu_clk_stop ,gl_ccu_io_clk_stop ,
		 gl_mcu2_io_clk_stop ,gl_mcu2_dr_clk_stop ,gl_mcu2_clk_stop ,
		 gl_mcu3_io_clk_stop ,gl_mcu3_dr_clk_stop ,gl_mcu3_clk_stop ,
		 gl_l2b7_clk_stop ,gl_l2d6_clk_stop ,gl_l2b6_clk_stop ,
		 gl_l2t6_clk_stop ,gl_sio_clk_stop ,gl_sio_io_clk_stop ,
		 gl_db1_clk_stop ,gl_rst_clk_stop ,gl_rst_io_clk_stop ,
		 gl_efu_clk_stop ,gl_efu_io_clk_stop ,stg1_ncu_clk_stop_out_c1b ,
		stg1_mcu0_dr_clk_stop_in_c2b, stg1_mcu1_dr_clk_stop_in_c2b, 
		stg2_mcu0_dr_clk_stop_in_c4t, stg2_mcu1_dr_clk_stop_in_c4t, 
		stg2_mcu0_dr_clk_stop_out_c2b, stg2_mcu1_dr_clk_stop_out_c2b, 
		 stg1_ncu_io_clk_stop_out_c1b ,stg1_dmu_io_clk_stop_out_c1b ,
		 stg1_peu_io_clk_stop_out_c1b ,stg1_ccx_clk_stop_out_c1b ,
		 stg1_db0_clk_stop_out_c1b ,stg1_l2t7_clk_stop_out_c1b ,
		 stg1_sii_clk_stop_out_c1b ,stg1_sii_io_clk_stop_out_c1b ,
		 stg1_l2b2_clk_stop_out_c1b ,stg1_l2b3_clk_stop_out_c1b ,
		 stg1_l2d7_clk_stop_out_c1b ,stg1_l2d2_clk_stop_out_c1b ,
		 stg1_l2d3_clk_stop_out_c1b ,stg1_l2t2_clk_stop_out_c1b ,
		 stg1_l2t3_clk_stop_out_c1b ,stg1_tds_io_clk_stop_out_c1b ,
		 stg1_rdp_io_clk_stop_out_c1b ,stg1_rtx_io_clk_stop_out_c1b ,
		 stg1_mac_io_clk_stop_out_c1b ,stg1_spc2_clk_stop_out_c1b ,
		 ccu_io_cmp_sync_en ,ccu_io_out ,gl_dr_sync_en_c1m ,rst_l2_por_ ,
		 stg1_spc3_clk_stop_out_c1b ,stg1_spc6_clk_stop_out_c1b ,
		 stg1_spc7_clk_stop_out_c1b ,rst_l2_wmr_ ,tcu_l2b1_clk_stop ,
		 tcu_l2b2_clk_stop ,tcu_l2b3_clk_stop ,tcu_l2b4_clk_stop ,
		 tcu_l2b5_clk_stop ,tcu_l2b6_clk_stop ,gl_io_out_c1m ,
		 tcu_l2b7_clk_stop ,tcu_mcu1_clk_stop ,tcu_mcu2_clk_stop ,
		 tcu_mcu3_clk_stop ,tcu_mcu0_io_clk_stop ,tcu_mcu1_io_clk_stop ,
		 tcu_mcu2_io_clk_stop ,tcu_mcu3_io_clk_stop ,tcu_spc5_clk_stop ,
		 tcu_l2t1_clk_stop ,tcu_l2t7_clk_stop ,tcu_mcu1_dr_clk_stop ,
		 tcu_mcu2_dr_clk_stop ,tcu_mcu3_dr_clk_stop ,tcu_dmu_io_clk_stop ,
		 tcu_peu_io_clk_stop ,tcu_mac_io_clk_stop ,tcu_tds_io_clk_stop ,
		 tcu_rtx_io_clk_stop ,tcu_rdp_io_clk_stop ,tcu_l2t0_clk_stop ,
		 tcu_efu_io_clk_stop ,tcu_ccx_clk_stop ,tcu_ncu_clk_stop ,
		 tcu_sii_clk_stop ,tcu_ncu_io_clk_stop ,tcu_sio_clk_stop ,
		 tcu_sii_io_clk_stop ,tcu_db0_clk_stop ,tcu_mio_clk_stop ,
		 tcu_rst_io_clk_stop ,tcu_sio_io_clk_stop ,tcu_mcu0_dr_clk_stop ,
		 tcu_mcu0_clk_stop ,tcu_ccu_io_clk_stop ,tcu_efu_clk_stop ,
		 tcu_rst_clk_stop ,tcu_ccu_clk_stop ,tcu_db1_clk_stop ,
		 tcu_l2d0_clk_stop ,tcu_l2d1_clk_stop ,tcu_l2d2_clk_stop ,
		 tcu_l2d3_clk_stop ,tcu_l2d4_clk_stop ,tcu_l2d5_clk_stop ,
		 tcu_l2d7_clk_stop ,tcu_l2d6_clk_stop ,tcu_l2b0_clk_stop ,
		 tcu_spc0_clk_stop ,tcu_spc1_clk_stop ,tcu_spc2_clk_stop ,
		 tcu_spc3_clk_stop ,stg1_rst_niu_wmr_out_c1b ,
		 stg1_l2b1_clk_stop_out_c1t ,tcu_spc4_clk_stop ,tcu_l2t6_clk_stop ,
		 tcu_spc6_clk_stop ,tcu_spc7_clk_stop ,tcu_l2t4_clk_stop ,
		 tcu_l2t3_clk_stop ,tcu_l2t2_clk_stop ,tcu_l2t5_clk_stop ,
		 stg1_io_out_out_c1b ,stg1_io2x_sync_en_out_c1b ,
		 stg1_io2x_sync_en_out_c1t ,stg1_dr_sync_en_out_c1t ,
		 gl_io_cmp_sync_en_c1m ,stg1_cmp_io_sync_en_out_c1b ,
		 gl_rst_l2_wmr_c1m ,stg1_io2x_out_out_c1b ,
		 stg3_spc7_clk_stop_out_c2b ,gl_cmp_io_sync_en_c1m ,
		 stg1_rst_l2_wmr_out_c1t ,stg1_io_cmp_sync_en_out_c1b ,
		 stg1_rst_l2_por_out_c1b ,stg1_rst_l2_wmr_out_c1b ,gl_rst_l2_por_c1m
		  ,gl_io2x_sync_en_c1m ,stg1_dmu_peu_por_out_c1b ,
		 stg1_io_out_out_c1t ,stg1_io_cmp_sync_en_out_c1t ,
		 stg1_cmp_io_sync_en_out_c1t ,stg1_dmu_peu_wmr_out_c1b , 
		 stg2_io_out_in_c2b, gl_l2_por_c1b, // for int6.1
		 stg1_rst_l2_por_out_c1t ,stg1_rst_niu_mac_out_c1b );
		 
	// for int6.1 (set 3)
	input   gclk_spc6s;
	input   stg1_cmp_io_sync_en_in_c1bg;
	input   stg1_cmp_io_sync_en_in_c1tg;
	input   stg1_io_cmp_sync_en_in_c1bg;
	input   stg1_io_cmp_sync_en_in_c1tg;
	input   stg1_io_out_in_c1bg;
	input   stg1_l2_por_in_c1bg;
	input   stg1_l2_por_in_c1tg;
	input   stg1_l2_wmr_in_c1bg;
	input   stg1_l2_wmr_in_c1tg;
	input   stg1_mio_clk_stop_in_c1tg;
	input   stg1_mio_io2x_sync_en_in_c1tg;
	input   stg4_cmp_io_sync_en_in_c3t0;
	input   stg4_io_cmp_sync_en_in_c3t0;
	input   stg4_io_out_in_c3b0;
	input   stg4_l2_por_in_c3t0;
	input   stg4_l2_wmr_in_c3t0;

	input 		stg2_io2x_sync_en_in_c2t;
	input		ccu_vco_aligned ;  
	input		gclk_a ; 
	input		gclk_b ; 
	input		gclk_c ;
	input		ccu_cmp_io_sync_en ;
	input		ccu_dr_sync_en ;
	input		ccu_io2x_out ;
	input		ccu_io2x_sync_en ;
	input		ccu_io_cmp_sync_en ;
	input		ccu_io_out ;
	input		gclk_ccu ;
	input		gclk_dmu ;
	input		gclk_l2b0 ;
	input		gclk_l2b4 ;
	input		gclk_l2b5 ;
	input		gclk_l2b6 ;
	input		gclk_l2d2 ;
	input		gclk_l2d5 ;
	input		gclk_l2d6 ;
	input		gclk_l2t0 ;
	input		gclk_l2t1 ;
	input		gclk_l2t2 ;
	input		gclk_l2t3 ;
	input		gclk_l2t4 ;
	input		gclk_l2t5 ;
	input		gclk_l2t6 ;
	input		gclk_l2t7 ;
	input		gclk_mac ;
	input		gclk_ncu ;
	input		gclk_rst ;
	input		gclk_spc0 ;
	input		gclk_spc1 ;
	input		gclk_spc2 ;
	input		gclk_spc3 ;
	input		gclk_spc4 ;
	input		gclk_spc5 ;
	input		gclk_spc6 ;
	input		gclk_spc7 ;
	input		gclk_tcu ;
	input		dr_gclk_stg_tcu;
	input		dr_gclk_fsr7_stg;
	input		dr_gclk_c4_mcu1;
	input		rst_dmu_peu_por_ ;
	input		rst_dmu_peu_wmr_ ;
	input		rst_l2_por_ ;
	input		rst_l2_wmr_ ;
	input		rst_niu_mac_ ;
	input		rst_niu_wmr_ ;
	// input		spare2_c1b_in ;
	// input		spare3_c1b_in ;
	// input		spare_c2b_s2_in6 ;
	input		stg1_ccx_clk_stop_in_c1b ;
	input		stg1_cmp_io_sync_en_in_c1t;
	input		stg1_cmp_io_sync_en_in_c1b ;
	input		stg1_db0_clk_stop_in_c1b ;
	input		stg1_dmu_io_clk_stop_in_c1b ;
	input		stg1_dmu_peu_por_in_c1b ;
	input		stg1_dmu_peu_wmr_in_c1b ;
	input		stg1_dr_sync_en_in_c1t ;
	input		stg1_io2x_out_in_c1b ;
	input		stg1_io_cmp_sync_en_in_c1t ;
	input		stg1_io_cmp_sync_en_in_c1b ;
	input		stg1_io_out_in_c1b ;
	input		stg1_io_out_in_c1t ;
	input		stg1_l2_por_in_c1b ;
	input		stg1_l2_por_in_c1t ;
	input		stg1_l2_wmr_in_c1b ;
	input		stg1_l2_wmr_in_c1t ;
	input		stg1_l2b0_clk_stop_in_c1t ;
	input		stg1_l2b1_clk_stop_in_c1t ;
	input		stg1_l2b2_clk_stop_in_c1b ;
	input		stg1_l2b3_clk_stop_in_c1b ;
	input		stg1_l2b4_clk_stop_in_c1t ;
	input		stg1_l2b5_clk_stop_in_c1t ;
	input		stg1_l2d0_clk_stop_in_c1t ;
	input		stg1_l2d1_clk_stop_in_c1t ;
	input		stg1_l2d2_clk_stop_in_c1b ;
	input		stg1_l2d3_clk_stop_in_c1b ;
	input		stg1_l2d4_clk_stop_in_c1t ;
	input		stg1_l2d5_clk_stop_in_c1t ;
	input		stg1_l2d7_clk_stop_in_c1b ;
	input		stg1_l2t0_clk_stop_in_c1t ;
	input		stg1_l2t1_clk_stop_in_c1t ;
	input		stg1_l2t2_clk_stop_in_c1b ;
	input		stg1_l2t3_clk_stop_in_c1b ;
	input		stg1_l2t5_clk_stop_in_c1t ;
	input		stg1_l2t7_clk_stop_in_c1b ;
	input		stg1_mac_io_clk_stop_in_c1b ;
	input		stg1_mcu0_clk_stop_in_c1t ;
//	input		stg1_mcu0_dr_clk_stop_in_c1t ;
	input		stg1_mcu0_io_clk_stop_in_c1t ;
	input		stg1_mcu1_clk_stop_in_c1t ;
//	input		stg1_mcu1_dr_clk_stop_in_c1t ;
	input		stg1_mcu1_io_clk_stop_in_c1t ;
	input		stg1_mio_clk_stop_in_c1t ;
	input		stg1_mio_io2x_sync_en_in_c1t ;
	input		stg1_ncu_clk_stop_in_c1b ;
	input		stg1_ncu_io_clk_stop_in_c1b ;
	input		stg1_peu_io_clk_stop_in_c1b ;
	input		stg1_rdp_io_clk_stop_in_c1b ;
	input		stg1_rst_mac_in_c1b ;
	input		stg1_rst_niu_wmr_in_c1b ;
	input		stg1_tds_io_clk_stop_in_c1b ;
	input		stg1_rtx_io_clk_stop_in_c1b ;
	input		stg1_sii_clk_stop_in_c1b ;
	input		stg1_sii_io_clk_stop_in_c1b ;
	input		stg1_spc0_clk_stop_in_c1t ;
	input		stg1_spc1_clk_stop_in_c1t ;
	input		stg1_spc2_clk_stop_in_c1b ;
	input		stg1_spc3_clk_stop_in_c1b ;
	input		stg1_spc5_clk_stop_in_c1t ;
	input		stg1_spc6_clk_stop_in_c1b ;
	input		stg1_spc7_clk_stop_in_c1b ;
	input		stg2_ccx_clk_stop_in_c2b ;
	input		stg2_cmp_io_sync_en_in_c2b ;
	input		stg2_cmp_io_sync_en_in_c2t ;
	input		stg2_db0_clk_stop_in_c2b ;
	input		stg2_dmu_io_clk_stop_in_c2b ;
	input		stg2_dmu_peu_por_in_c2b ;
	input		stg2_dmu_peu_wmr_in_c2b ;
	input		stg2_dr_sync_en_in_c2t ;
	input		stg2_io_cmp_sync_en_in_c2b ;
	input		stg2_io_cmp_sync_en_in_c2t ;
	input		stg2_io_out_in_c2t ;
	input		stg2_l2_por_in_c2b ;
	input		stg2_l2_por_in_c2t ;
	input		stg2_l2_wmr_in_c2b ;
	input		stg2_l2_wmr_in_c2t ;
	input		stg2_l2b0_clk_stop_in_c2t ;
	input		stg2_l2b1_clk_stop_in_c2t ;
	input		stg2_l2b2_clk_stop_in_c2b ;
	input		stg2_l2b3_clk_stop_in_c2b ;
	input		stg2_l2d0_clk_stop_in_c2t ;
	input		stg2_l2d1_clk_stop_in_c2t ;
	input		stg2_l2d2_clk_stop_in_c2b ;
	input		stg2_l2d3_clk_stop_in_c2b ;
	input		stg2_l2t0_clk_stop_in_c2t ;
	input		stg2_l2t1_clk_stop_in_c2t ;
	input		stg2_l2t2_clk_stop_in_c2b ;
	input		stg2_l2t3_clk_stop_in_c2bz ;
	input		stg2_l2t5_clk_stop_in_c2t ;
	input		stg2_l2t7_clk_stop_in_c2b ;
	input		stg2_mio_io2x_sync_en_in_c2t ;
	input		stg2_ncu_clk_stop_in_c2b ;
	input		stg2_ncu_io_clk_stop_in_c2b ;
	input		stg2_peu_io_clk_stop_in_c2b ;
	input		stg2_sii_clk_stop_in_c2b ;
	input		stg2_sii_io_clk_stop_in_c2b ;
	input		stg2_spc0_clk_stop_in_c2t ;
	input		stg2_spc1_clk_stop_in_c2t ;
	input		stg2_spc2_clk_stop_in_c2b ;
	input		stg2_spc3_clk_stop_in_c2b ;
	input		stg2_spc5_clk_stop_in_c2t ;
	input		stg2_spc7_clk_stop_in_c2b ;
	input		stg3_ccx_clk_stop_in_c2b ;
	input		stg3_cmp_io_sync_en_in_c2b ;
	input		stg3_cmp_io_sync_en_in_c2t ;
	input		stg3_cmp_io_sync_en_in_c3b ;
	input		stg3_cmp_io_sync_en_in_c3t ;
	input		stg3_db0_clk_stop_in_c3b ;
	input		stg3_dmu_io_clk_stop_in_c3b ;
	input		stg3_dmu_peu_por_in_c3b ;
	input		stg3_dmu_peu_wmr_in_c3b ;
	input		stg3_dr_sync_en_in_c3t ;
	input		stg3_io2x_sync_en_in_c2t ;
	input		stg3_io_cmp_sync_en_in_c2b ;
	input		stg3_io_cmp_sync_en_in_c2t ;
	input		stg3_io_cmp_sync_en_in_c3b ;
	input		stg3_io_cmp_sync_en_in_c3t ;
	input		stg3_io_out_in_c3b ;
	input		stg3_io_out_in_c3t ;
	input		stg3_l2_por_in_c2b ;
	input		stg3_l2_por_in_c2t ;
	input		stg3_l2_por_in_c3b ;
	input		stg3_l2_por_in_c3t ;
	input		stg3_l2_wmr_in_c2b ;
	input		stg3_l2_wmr_in_c2t ;
	input		stg3_l2_wmr_in_c3b ;
	input		stg3_l2_wmr_in_c3t ;
	input		stg3_l2b0_clk_stop_in_c3t ;
	input		stg3_l2b1_clk_stop_in_c3t ;
	input		stg3_l2b2_clk_stop_in_c3b ;
	input		stg3_l2b3_clk_stop_in_c3b ;
	input		stg3_l2d0_clk_stop_in_c3t ;
	input		stg3_l2d1_clk_stop_in_c3t ;
	input		stg3_l2d2_clk_stop_in_c3b ;
	input		stg3_l2d3_clk_stop_in_c3b ;
	input		stg3_l2t0_clk_stop_in_c3t ;
	input		stg3_l2t1_clk_stop_in_c2t ;
	input		stg3_l2t3_clk_stop_in_c2b ;
	input		stg3_l2t5_clk_stop_in_c2t ;
	input		stg3_l2t7_clk_stop_in_c2b ;
	input		stg3_mcu0_clk_stop_in_c3t ;
//	input		stg3_mcu0_dr_clk_stop_in_c3t ;
	input		stg3_mcu0_io_clk_stop_in_c3t ;
	input		stg3_mcu1_clk_stop_in_c3t ;
//	input		stg3_mcu1_dr_clk_stop_in_c3t ;
	input		stg3_mcu1_io_clk_stop_in_c3t ;
	input		stg3_mio_clk_stop_in_c2t ;
	input		stg3_mio_clk_stop_in_c3t ;
	input		stg3_mio_io2x_sync_en_in_c3t ;
	input		stg3_ncu_clk_stop_in_c3b ;
	input		stg3_ncu_io_clk_stop_in_c3b ;
	input		stg3_peu_io_clk_stop_in_c3b ;
	input		stg3_sii_clk_stop_in_c3b ;
	input		stg3_sii_io_clk_stop_in_c3b ;
	input		stg3_spc0_clk_stop_in_c3t ;
	input		stg3_spc1_clk_stop_in_c2t ; // for int6.1
	input		stg3_spc2_clk_stop_in_c3b ;
	input		stg3_spc3_clk_stop_in_c2b ;
	input		stg3_spc5_clk_stop_in_c2t ; // for int6.1
	input		stg3_spc7_clk_stop_in_c2b ;
	input		stg4_cmp_io_sync_en_in_c3b ;
	input		stg4_cmp_io_sync_en_in_c3t ;
	input		stg4_db0_clk_stop_c3b ;
	input		stg4_dmu_io_clk_stop_in_c3b ;
	input		stg4_dmu_peu_por_in_c3b ;
	input		stg4_dmu_peu_wmr_in_c3b ;
	input		stg4_dr_sync_en_in_c3t ;
	input		stg4_io2x_sync_en_in_c3t ;
	input		stg4_io_cmp_sync_en_in_c3b ;
	input		stg4_io_cmp_sync_en_in_c3t ;
	input		stg4_io_out_in_c3b ;
	input		stg4_io_out_in_c3t ;
	input		stg4_l2_por_in_c3b ;
	input		stg4_l2_por_in_c3t ;
	input		stg4_l2_wmr_in_c3b ;
	input		stg4_l2_wmr_in_c3t ;
	input		stg4_l2b0_clk_stop_in_c3t ;
	input		stg4_l2b1_clk_stop_in_c3t ;
	input		stg4_l2b2_clk_stop_in_c3b ;
	input		stg4_l2b3_clk_stop_in_c3b ;
	input		stg4_l2d0_clk_stop_in_c3t ;
	input		stg4_l2d1_clk_stop_in_c3t ;
	input		stg4_l2d2_clk_stop_in_c3b ;
	input		stg4_l2d3_clk_stop_in_c3b ;
	input		stg4_l2t0_clk_stop_in_c3t ;
	input		stg4_l2t2_clk_stop_in_c3b ;
//	input		stg4_mcu1_dr_clk_stop_in_c3t ;
	input		stg4_mcu0_clk_stop_in_c3t ;
//	input		stg4_mcu0_dr_clk_stop_in_c3t ;
	input		stg4_mcu0_io_clk_stop_in_c3t ;
	input		stg4_mcu1_clk_stop_in_c3t ;
	input		stg4_mcu1_io_clk_stop_in_c3t ;
	input		stg4_mio_clk_stop_in_c3t ;
	input		stg4_ncu_clk_stop_in_c3b ;
	input		stg4_ncu_io_clk_stop_c3b ;
	input		stg4_peu_io_clk_stop_in_c3b ;
	input		stg4_sii_clk_stop_in_c3b ;
	input		stg4_sii_io_clk_stop_in_c3b ;
	input		stg4_spc0_clk_stop_in_c3t ;
	input		stg4_spc2_clk_stop_in_c3b ;
	input		stg1_spc4_clk_stop_in_c1t;
	input		tcu_ccu_clk_stop ;
	input		tcu_ccu_io_clk_stop ;
	input		tcu_ccx_clk_stop ;
	input		tcu_db0_clk_stop ;
	input		tcu_db1_clk_stop ;
	input		tcu_dmu_io_clk_stop ;
	input		tcu_efu_clk_stop ;
	input		tcu_efu_io_clk_stop ;
	input		tcu_l2b0_clk_stop ;
	input		tcu_l2b1_clk_stop ;
	input		tcu_l2b2_clk_stop ;
	input		tcu_l2b3_clk_stop ;
	input		tcu_l2b4_clk_stop ;
	input		tcu_l2b5_clk_stop ;
	input		tcu_l2b6_clk_stop ;
	input		tcu_l2b7_clk_stop ;
	input		tcu_l2d0_clk_stop ;
	input		tcu_l2d1_clk_stop ;
	input		tcu_l2d2_clk_stop ;
	input		tcu_l2d3_clk_stop ;
	input		tcu_l2d4_clk_stop ;
	input		tcu_l2d5_clk_stop ;
	input		tcu_l2d7_clk_stop ;
	input		tcu_l2d6_clk_stop ;
	input		tcu_l2t0_clk_stop ;
	input		tcu_l2t1_clk_stop ;
	input		tcu_l2t2_clk_stop ;
	input		tcu_l2t3_clk_stop ;
	input		tcu_l2t4_clk_stop ;
	input		tcu_l2t5_clk_stop ;
	input		tcu_l2t6_clk_stop ;
	input		tcu_l2t7_clk_stop ;
	input		tcu_mac_io_clk_stop ;
	input		tcu_mcu0_clk_stop ;
	input		tcu_mcu0_dr_clk_stop ;
	input		tcu_mcu0_io_clk_stop ;
	input		tcu_mcu1_clk_stop ;
	input		tcu_mcu1_dr_clk_stop ;
	input		tcu_mcu1_io_clk_stop ;
	input		tcu_mcu2_clk_stop ;
	input		tcu_mcu2_dr_clk_stop ;
	input		tcu_mcu2_io_clk_stop ;
	input		tcu_mcu3_clk_stop ;
	input		tcu_mcu3_dr_clk_stop ;
	input		tcu_mcu3_io_clk_stop ;
	input		tcu_mio_clk_stop ;
	input		tcu_ncu_clk_stop ;
	input		tcu_ncu_io_clk_stop ;
	input		tcu_peu_io_clk_stop ;
	input		tcu_rdp_io_clk_stop ;
	input		tcu_rst_clk_stop ;
	input		tcu_rst_io_clk_stop ;
	input		tcu_rtx_io_clk_stop ;
	input		tcu_sii_clk_stop ;
	input		tcu_sii_io_clk_stop ;
	input		tcu_sio_clk_stop ;
	input		tcu_sio_io_clk_stop ;
	input		tcu_spc0_clk_stop ;
	input		tcu_spc1_clk_stop ;
	input		tcu_spc2_clk_stop ;
	input		tcu_spc3_clk_stop ;
	input		tcu_spc4_clk_stop ;
	input		tcu_spc5_clk_stop ;
	input		tcu_spc6_clk_stop ;
	input		tcu_spc7_clk_stop ;
	input		tcu_tds_io_clk_stop ;
	input 		stg3_l2t2_clk_stop_in_c3b ;
	input		stg2_mio_clk_stop_in_c2t ; 
	input		stg2_mcu0_clk_stop_in_c2t;
	input		stg2_mcu1_clk_stop_in_c2t;
	input		stg2_mcu0_io_clk_stop_in_c2t;
//	input		stg2_mcu0_dr_clk_stop_in_c2t;
//	input		stg2_mcu1_dr_clk_stop_in_c2t;
	input		stg2_mcu1_io_clk_stop_in_c2t;
   input 		stg1_mcu0_dr_clk_stop_in_c2b; 
   input 		stg1_mcu1_dr_clk_stop_in_c2b; 
   input 		stg2_mcu0_dr_clk_stop_in_c4t; 
   input 		stg2_mcu1_dr_clk_stop_in_c4t; 
   input 		stg2_io_out_in_c2b;
 
   output 		stg2_io_out_out_c1b;
   output 		stg2_mcu0_dr_clk_stop_out_c2b; 
   output 		stg2_mcu1_dr_clk_stop_out_c2b; 
//	output		stg3_mcu0_dr_clk_stop_out_c2t;
	output		stg3_mcu0_io_clk_stop_out_c2t;
//	output		stg3_mcu1_dr_clk_stop_out_c2t;
	output		stg3_mcu1_io_clk_stop_out_c2t;
	output		stg3_mcu0_clk_stop_out_c2t;
	output		stg3_mcu1_clk_stop_out_c2t;
	output 		stg3_io2x_sync_en_out_c2t;
	output		stg3_mio_clk_stop_out_c2t ; 
	output 		gclk_aligned ; 
	output		gl_ccu_clk_stop ;
	output		gl_ccu_io_clk_stop ;
	output		gl_ccx_clk_stop ;
	output		gl_cmp_io_sync_en_c1b ;
	output		gl_cmp_io_sync_en_c1m ;
	output		gl_cmp_io_sync_en_c1t ;
	output		gl_cmp_io_sync_en_c2b ;
	output		gl_cmp_io_sync_en_c2t ;
	output		gl_cmp_io_sync_en_c3b ;
	output		gl_cmp_io_sync_en_c3t ;
	output		gl_cmp_io_sync_en_c3t0 ;
	output		gl_db0_clk_stop ;
	output		gl_db1_clk_stop ;
	output		gl_dmu_io_clk_stop ;
	output		gl_dmu_peu_por_c3b ;
	output		gl_dmu_peu_wmr_c3b ;
	output		gl_dr_sync_en_c1m ;
	output		gl_dr_sync_en_c3t ;
	output		gl_efu_clk_stop ;
	output		gl_efu_io_clk_stop ;
	output		gl_io2x_out_c1b ;
	output		gl_io2x_sync_en_c1m ;
	output		gl_io2x_sync_en_c3t ;
	output		gl_io2x_sync_en_c3t0 ;
	output		gl_io2x_sync_en_c2t ;
	output		gl_io_cmp_sync_en_c1b ;
	output		gl_io_cmp_sync_en_c1m ;
	output		gl_io_cmp_sync_en_c1t ;
	output		gl_io_cmp_sync_en_c2b ;
	output		gl_io_cmp_sync_en_c2t ;
	output		gl_io_cmp_sync_en_c3b ;
	output		gl_io_cmp_sync_en_c3t ;
	output		gl_io_cmp_sync_en_c3t0 ;
	output		gl_io_out_c1b ;
	output		gl_io_out_c1m ;
	output		gl_io_out_c3b ;
	output		gl_io_out_c3b0 ;
	output		gl_io_out_c3t ;
	output		gl_l2_por_c1t ;
	output		gl_l2_por_c1b ; // for int6.1
	output		gl_l2_por_c2b ;
	output		gl_l2_por_c2t ;
	output		gl_l2_por_c3b0 ;
	output		gl_l2_por_c3t ;
	output		gl_l2_por_c3t0 ;
	output		gl_l2_wmr_c1b ;
	output		gl_l2_wmr_c1t ;
	output		gl_l2_wmr_c2b ;
	output		gl_l2_wmr_c2t ;
	output		gl_l2_wmr_c3b ;
	output		gl_l2_wmr_c3t ;
	output		gl_l2_wmr_c3t0 ;
	output		gl_l2b0_clk_stop ;
	output		gl_l2b1_clk_stop ;
	output		gl_l2b2_clk_stop ;
	output		gl_l2b3_clk_stop ;
	output		gl_l2b4_clk_stop ;
	output		gl_l2b5_clk_stop ;
	output		gl_l2b6_clk_stop ;
	output		gl_l2b7_clk_stop ;
	output		gl_l2d0_clk_stop ;
	output		gl_l2d1_clk_stop ;
	output		gl_l2d2_clk_stop ;
	output		gl_l2d3_clk_stop ;
	output		gl_l2d4_clk_stop ;
	output		gl_l2d5_clk_stop ;
	output		gl_l2d7_clk_stop ;
	output		gl_l2d6_clk_stop ;
	output		gl_l2t0_clk_stop ;
	output		gl_l2t1_clk_stop ;
	output		gl_l2t2_clk_stop ;
	output		gl_l2t3_clk_stop ;
	output		gl_l2t4_clk_stop ;
	output		gl_l2t5_clk_stop ;
	output		gl_l2t6_clk_stop ;
	output		gl_l2t7_clk_stop ;
	output		gl_mac_io_clk_stop ;
	output		gl_mcu1_dr_clk_stop ;
	output		gl_mcu0_clk_stop ;
	output		gl_mcu0_dr_clk_stop ;
	output		gl_mcu0_io_clk_stop ;
	output		gl_mcu1_clk_stop ;
	output		gl_mcu1_io_clk_stop ;
	output		gl_mcu2_clk_stop ;
	output		gl_mcu2_dr_clk_stop ;
	output		gl_mcu2_io_clk_stop ;
	output		gl_mcu3_clk_stop ;
	output		gl_mcu3_dr_clk_stop ;
	output		gl_mcu3_io_clk_stop ;
	output		gl_mio_clk_stop_c1t ;
	output		gl_mio_clk_stop_c2t ;
	output		gl_mio_clk_stop_c3t ;
	// output		gl_mio_io2x_sync_en_c1b ;
	//output		stg4_io2x_sync_en_c3t;//lijuan
	input		stg4_io2x_sync_en_c3t;//lijuan
	output		gl_mio_io2x_sync_en_c1t ;
	output		gl_ncu_clk_stop ;
	output		gl_ncu_io_clk_stop ;
	output		gl_peu_io_clk_stop ;
	output		gl_rdp_io_clk_stop ;
	output		gl_rst_clk_stop ;
	output		gl_rst_io_clk_stop ;
	output		gl_rst_l2_por_c1m ;
	output		gl_rst_l2_wmr_c1m ;
	output		gl_rst_mac_c1b ;
	output		gl_rst_niu_wmr_c1b ;
	output		gl_tds_io_clk_stop ;
	output		gl_rtx_io_clk_stop ;
	output		gl_sii_clk_stop ;
	output		gl_sii_io_clk_stop ;
	output		gl_sio_clk_stop ;
	output		gl_sio_io_clk_stop ;
	output		gl_spc0_clk_stop ;
	output		gl_spc1_clk_stop ;
	output		gl_spc2_clk_stop ;
	output		gl_spc3_clk_stop ;
	output		gl_spc4_clk_stop ;
	output		gl_spc5_clk_stop ;
	output		gl_spc6_clk_stop ;
	output		gl_spc7_clk_stop ;
	// output		spare2_c1b ;
	// output		spare3_c1b ;
	// output		spare_c2b_s2_out6 ;
	output		stg1_ccx_clk_stop_out_c1b ;
	output		stg1_cmp_io_sync_en_out_c1b ;
	output		stg1_cmp_io_sync_en_out_c1t ;
	output		stg1_db0_clk_stop_out_c1b ;
	output		stg1_dmu_io_clk_stop_out_c1b ;
	output		stg1_dmu_peu_por_out_c1b ;
	output		stg1_dmu_peu_wmr_out_c1b ;
	output		stg1_dr_sync_en_out_c1t ;
	output		stg1_io2x_out_out_c1b ;
	output		stg1_io2x_sync_en_out_c1b ;
	output		stg1_io2x_sync_en_out_c1t ;
	output		stg1_io_cmp_sync_en_out_c1b ;
	output		stg1_io_cmp_sync_en_out_c1t ;
	output		stg1_io_out_out_c1b ;
	output		stg1_io_out_out_c1t ;
	output		stg1_l2b0_clk_stop_out_c1t ;
	output		stg1_l2b1_clk_stop_out_c1t ;
	output		stg1_l2b2_clk_stop_out_c1b ;
	output		stg1_l2b3_clk_stop_out_c1b ;
	output		stg1_l2b4_clk_stop_out_c1t ;
	output		stg1_l2b5_clk_stop_out_c1t ;
	output		stg1_l2d0_clk_stop_out_c1t ;
	output		stg1_l2d1_clk_stop_out_c1t ;
	output		stg1_l2d2_clk_stop_out_c1b ;
	output		stg1_l2d3_clk_stop_out_c1b ;
	output		stg1_l2d4_clk_stop_out_c1t ;
	output		stg1_l2d5_clk_stop_out_c1t ;
	output		stg1_l2d7_clk_stop_out_c1b ;
	output		stg1_l2t0_clk_stop_out_c1t ;
	output		stg1_l2t1_clk_stop_out_c1t ;
	output		stg1_l2t2_clk_stop_out_c1b ;
	output		stg1_l2t3_clk_stop_out_c1b ;
	output		stg1_l2t5_clk_stop_out_c1t ;
	output		stg1_l2t7_clk_stop_out_c1b ;
	output		stg1_mac_io_clk_stop_out_c1b ;
	output		stg1_mcu0_clk_stop_out_c1t ;
	output		stg1_mcu0_dr_clk_stop_out_c1t ;
	output		stg1_mcu0_io_clk_stop_out_c1t ;
	output		stg1_mcu1_clk_stop_out_c1t ;
	output		stg1_mcu1_dr_clk_stop_out_c1t ;
	output		stg1_mcu1_io_clk_stop_out_c1t ;
	output		stg1_mio_clk_stop_out_c1t ;
	output		stg1_ncu_clk_stop_out_c1b ;
	output		stg1_ncu_io_clk_stop_out_c1b ;
	output		stg1_peu_io_clk_stop_out_c1b ;
	output		stg1_rdp_io_clk_stop_out_c1b ;
	output		stg1_rst_l2_por_out_c1b ;
	output		stg1_rst_l2_por_out_c1t ;
	output		stg1_rst_l2_wmr_out_c1b ;
	output		stg1_rst_l2_wmr_out_c1t ;
	output		stg1_rst_niu_mac_out_c1b ;
	output		stg1_rst_niu_wmr_out_c1b ;
	output		stg1_rtx_io_clk_stop_out_c1b ;
	output		stg1_sii_clk_stop_out_c1b ;
	output		stg1_sii_io_clk_stop_out_c1b ;
	output		stg1_spc0_clk_stop_out_c1t ;
	output		stg1_spc1_clk_stop_out_c1t ;
	output		stg1_spc2_clk_stop_out_c1b ;
	output		stg1_spc3_clk_stop_out_c1b ;
	output		stg1_spc4_clk_stop_out_c1t ;
	output		stg1_spc5_clk_stop_out_c1t ;
	output		stg1_spc6_clk_stop_out_c1b ;
	output		stg1_spc7_clk_stop_out_c1b ;
	output		stg1_tds_io_clk_stop_out_c1b ;
	output		stg2_ccx_clk_stop_out_c1b ;
	output		stg2_cmp_io_sync_en_out_c1b ;
	output		stg2_cmp_io_sync_en_out_c1t ;
	output		stg2_db0_clk_stop_out_c1b ;
	output		stg2_dmu_io_clk_stop_out_c1b ;
	output		stg2_dmu_peu_por_out_c1b ;
	output		stg2_dmu_peu_wmr_out_c1b ;
	output		stg2_dr_sync_en_out_c1t ;
	output		stg2_io_cmp_sync_en_out_c1b ;
	output		stg2_io_cmp_sync_en_out_c1t ;
	output		stg2_io_out_out_c1t ;
	output		stg2_l2_por_out_c1b ;
	output		stg2_l2_por_out_c1t ;
	output		stg2_l2_wmr_out_c1b ;
	output		stg2_l2_wmr_out_c1t ;
	output		stg2_l2b0_clk_stop_out_c1t ;
	output		stg2_l2b1_clk_stop_out_c1t ;
	output		stg2_l2b2_clk_stop_out_c1b ;
	output		stg2_l2b3_clk_stop_out_c1b ;
	output		stg2_l2d0_clk_stop_out_c1t ;
	output		stg2_l2d1_clk_stop_out_c1t ;
	output		stg2_l2d2_clk_stop_out_c1b ;
	output		stg2_l2d3_clk_stop_out_c1b ;
	output		stg2_l2t0_clk_stop_out_c1t ;
	output		stg2_l2t1_clk_stop_out_c1t ;
	output		stg2_l2t2_clk_stop_out_c1b ;
	output		stg2_l2t3_clk_stop_out_c1b ;
	output		stg2_l2t5_clk_stop_out_c1t ;
	output		stg2_l2t7_clk_stop_out_c1b ;
	output		stg2_mcu0_clk_stop_out_c1t ;
//	output		stg2_mcu0_dr_clk_stop_out_c1t ;
	output		stg2_mcu0_io_clk_stop_out_c1t ;
	output		stg2_mcu1_clk_stop_out_c1t ;
//	output		stg2_mcu1_dr_clk_stop_out_c1t ;
	output		stg2_mcu1_io_clk_stop_out_c1t ;
	output		stg2_mio_clk_stop_out_c1t ;
	output		stg2_mio_io2x_sync_en_out_c1t ;
	output		stg2_ncu_clk_stop_out_c1b ;
	output		stg2_ncu_io_clk_stop_out_c1b ;
	output		stg2_peu_io_clk_stop_out_c1b ;
	output		stg2_sii_clk_stop_out_c1b ;
	output		stg2_sii_io_clk_stop_out_c1b ;
	output		stg2_spc0_clk_stop_out_c1t ;
	output		stg2_spc1_clk_stop_out_c1t ;
	output		stg2_spc2_clk_stop_out_c1b ;
	output		stg2_spc3_clk_stop_out_c1b ;
	output		stg2_spc5_clk_stop_out_c1t ;
	output		stg2_spc7_clk_stop_out_c1b ;
	output		stg3_ccx_clk_stop_out_c2b ;
	output		stg3_cmp_io_sync_en_out_c2b ;
	output		stg3_cmp_io_sync_en_out_c2t ;
	output		stg3_db0_clk_stop_out_c2b ;
	output		stg3_dmu_io_clk_stop_out_c2b ;
	output		stg3_dmu_peu_por_out_c2b ;
	output		stg3_dmu_peu_wmr_out_c2b ;
	output		stg3_dr_sync_en_out_c2t ;
	output		stg3_io_cmp_sync_en_out_c2b ;
	output		stg3_io_cmp_sync_en_out_c2t ;
	output		stg3_io_out_out_c2t ;
	output		stg3_l2_por_out_c2b ;
	output		stg3_l2_por_out_c2t ;
	output		stg3_l2_wmr_out_c2b ;
	output		stg3_l2_wmr_out_c2t ;
	output		stg3_l2b0_clk_stop_out_c2t ;
	output		stg3_l2b1_clk_stop_out_c2t ;
	output		stg3_l2b2_clk_stop_out_c2b ;
	output		stg3_l2b3_clk_stop_out_c2b ;
	output		stg3_l2d0_clk_stop_out_c2t ;
	output		stg3_l2d1_clk_stop_out_c2t ;
	output		stg3_l2d2_clk_stop_out_c2b ;
	output		stg3_l2d3_clk_stop_out_c2b ;
	output		stg3_l2t0_clk_stop_out_c2t ;
	output		stg3_l2t1_clk_stop_out_c2t ;
	output		stg3_l2t2_clk_stop_out_c2b ;
	output		stg3_l2t3_clk_stop_out_c2b ;
	output		stg3_l2t5_clk_stop_out_c2t ;
	output		stg3_l2t7_clk_stop_out_c2b ;
	output		stg3_mio_io2x_sync_en_out_c2t ;
	output		stg3_ncu_clk_stop_out_c2b ;
	output		stg3_ncu_io_clk_stop_out_c2b ;
	output		stg3_io_out_out_c2b ;
	output		stg3_peu_io_clk_stop_out_c2b ;
	output		stg3_sii_clk_stop_out_c2b ;
	output		stg3_sii_io_clk_stop_out_c2b ;
	output		stg3_spc0_clk_stop_out_c2t ;
	output		stg3_spc1_clk_stop_out_c2t ;
	output		stg3_spc2_clk_stop_out_c2b ;
	output		stg3_spc3_clk_stop_out_c2b ;
	output		stg3_spc5_clk_stop_out_c2t ;
	output		stg3_spc7_clk_stop_out_c2b ;
	output		stg4_cmp_io_sync_en_out_c3b ;
	output		stg4_cmp_io_sync_en_out_c3t ;
	output		stg4_db0_clk_stop_out_c3b ;
	output		stg4_dmu_io_clk_stop_out_c3b ;
	output		stg4_dmu_peu_por_out_c3b ;
	output		stg4_dmu_peu_wmr_out_c3b ;
	output		stg4_dr_sync_en_out_c3t ;
	// output		stg4_io2x_sync_en_out_c2b ;
	output		stg4_io_cmp_sync_en_out_c3b ;
	output		stg4_io_cmp_sync_en_out_c3t ;
	output		stg4_io_out_out_c3b ;
	output		stg4_io_out_out_c3t ;
	output		stg4_l2_por_out_c3b ;
	output		stg4_l2_por_out_c3t ;
	output		stg4_l2_wmr_out_c3b ;
	output		stg4_l2_wmr_out_c3t ;
	output		stg4_l2b0_clk_stop_out_c3t ;
	output		stg4_l2b1_clk_stop_out_c3t ;
	output		stg4_l2b2_clk_stop_out_c3b ;
	output		stg4_l2b3_clk_stop_out_c3b ;
	output		stg4_l2d0_clk_stop_out_c3t ;
	output		stg4_l2d1_clk_stop_out_c3t ;
	output		stg4_l2d2_clk_stop_out_c3b ;
	output		stg4_l2d3_clk_stop_out_c3b ;
	output		stg4_l2t0_clk_stop_out_c3t ;
	output		stg4_mcu0_clk_stop_out_c3t ;
//	output		stg4_mcu0_dr_clk_stop_out_c3t ;
	output		stg4_mcu0_io_clk_stop_out_c3t ;
	output		stg4_mcu1_clk_stop_out_c3t ;
//	output		stg4_mcu1_dr_clk_stop_out_c3t ;
	output		stg4_mcu1_io_clk_stop_out_c3t ;
	output		stg4_mio_clk_stop_out_c3t ;
	output		stg4_mio_io2x_sync_en_out_c3t ;
	output		stg4_ncu_clk_stop_out_c3b ;
	output		stg4_ncu_io_clk_stop_out_c3b ;
	output		stg4_peu_io_clk_stop_out_c3b ;
	output		stg4_sii_clk_stop_out_c3b ;
	output		stg4_sii_io_clk_stop_out_c3b ;
	output		stg4_spc0_clk_stop_out_c3t ;
//	output		stg4_spc1_clk_stop_out_c2b ;  // for int6.1
	output		stg4_spc2_clk_stop_out_c3b ;
//	output		stg4_spc5_clk_stop_out_c2b ;  // for int6.1
	output 		stg4_l2t2_clk_stop_out_c3b ;
	 
	 
	 
	n2_clk_gl_cc_stg_c1t_s4_1 x2  (
		 .gl_l2d4_clk_stop  (gl_l2d4_clk_stop ),
		 .gclk_l2b4        (gclk_l2b4 ),
		 .stg1_l2_por_in_c1t  (stg1_l2_por_in_c1tg ), // for int6.1 (set 3)
		 .stg1_l2d4_clk_stop_in_c1t  (stg1_l2d4_clk_stop_in_c1t ),
		 .gl_l2_por_c1t    (gl_l2_por_c1t ),
		 .stg1_l2b4_clk_stop_in_c1t  (stg1_l2b4_clk_stop_in_c1t ),
		 .stg1_spc4_clk_stop_in_c1t	(stg1_spc4_clk_stop_in_c1t ),
		 .gl_spc4_clk_stop	(gl_spc4_clk_stop ),
		 .gl_l2b4_clk_stop  (gl_l2b4_clk_stop ) );

	 n2_clk_gl_cc_stg_c1t_s1_0 x3  (
		 .stg2_l2_por_out_c1t  (stg2_l2_por_out_c1t ),
		 .stg2_l2b1_clk_stop_out_c1t  (stg2_l2b1_clk_stop_out_c1t ),
		 .stg2_l2t0_clk_stop_out_c1t  (stg2_l2t0_clk_stop_out_c1t ),
		 .stg2_spc5_clk_stop_out_c1t  (stg2_spc5_clk_stop_out_c1t ),
		 .stg2_spc0_clk_stop_out_c1t  (stg2_spc0_clk_stop_out_c1t ),
		 .stg2_dr_sync_en_out_c1t  (stg2_dr_sync_en_out_c1t ),
		 .stg2_mio_io2x_sync_en_out_c1t  (stg2_mio_io2x_sync_en_out_c1t ),
		 .stg2_l2_wmr_out_c1t  (stg2_l2_wmr_out_c1t ),
		 .stg2_cmp_io_sync_en_out_c1t  (stg2_cmp_io_sync_en_out_c1t ),
		 .stg2_spc1_clk_stop_out_c1t  (stg2_spc1_clk_stop_out_c1t ),
		 .stg1_spc5_clk_stop_in_c1t  (stg1_spc5_clk_stop_in_c1t ),
		 .stg2_io_cmp_sync_en_out_c1t  (stg2_io_cmp_sync_en_out_c1t ),
		 .stg2_io_out_out_c1t  (stg2_io_out_out_c1t ),
		 .gclk_l2b5        (gclk_l2b5 ),
		 .stg2_l2t1_clk_stop_out_c1t  (stg2_l2t1_clk_stop_out_c1t ),
		 .stg2_l2t5_clk_stop_out_c1t  (stg2_l2t5_clk_stop_out_c1t ),
		 .stg2_l2b0_clk_stop_out_c1t  (stg2_l2b0_clk_stop_out_c1t ),
		 .stg2_l2d1_clk_stop_out_c1t  (stg2_l2d1_clk_stop_out_c1t ),
		 .stg2_l2d0_clk_stop_out_c1t  (stg2_l2d0_clk_stop_out_c1t ),
		 .stg1_l2b1_clk_stop_in_c1t  (stg1_l2b1_clk_stop_in_c1t ),
		 .stg1_cmp_io_sync_en_in_c1t  (stg1_cmp_io_sync_en_in_c1t ),
		 .stg1_mio_io2x_sync_en_in_c1t  (stg1_mio_io2x_sync_en_in_c1t ),
		 .stg1_l2_wmr_in_c1t  (stg1_l2_wmr_in_c1t ),
		 .stg1_l2_por_in_c1t  (stg1_l2_por_in_c1t ),
		 .stg1_spc1_clk_stop_in_c1t  (stg1_spc1_clk_stop_in_c1t ),
		 .stg1_l2b0_clk_stop_in_c1t  (stg1_l2b0_clk_stop_in_c1t ),
		 .stg1_l2t5_clk_stop_in_c1t  (stg1_l2t5_clk_stop_in_c1t ),
		 .stg1_l2t1_clk_stop_in_c1t  (stg1_l2t1_clk_stop_in_c1t ),
		 .stg1_l2d1_clk_stop_in_c1t  (stg1_l2d1_clk_stop_in_c1t ),
		 .stg1_io_cmp_sync_en_in_c1t  (stg1_io_cmp_sync_en_in_c1t ),
		 .stg1_io_out_in_c1t  (stg1_io_out_in_c1t ),
		 .stg1_l2d0_clk_stop_in_c1t  (stg1_l2d0_clk_stop_in_c1t ),
		 .stg1_l2t0_clk_stop_in_c1t  (stg1_l2t0_clk_stop_in_c1t ),
		 .stg1_dr_sync_en_in_c1t  (stg1_dr_sync_en_in_c1t ),
		 .stg1_spc0_clk_stop_in_c1t  (stg1_spc0_clk_stop_in_c1t ) );

	 n2_clk_gl_cc_stg_c1t_s1_1 x4  (
//		 .stg2_mcu1_dr_clk_stop_out_c1t  (stg2_mcu1_dr_clk_stop_out_c1t ),
//		 .stg1_mcu0_dr_clk_stop_in_c1t  (stg1_mcu0_dr_clk_stop_in_c1t ),
		 .stg1_mcu0_io_clk_stop_in_c1t  (stg1_mcu0_io_clk_stop_in_c1t ),
		 .stg1_mcu0_clk_stop_in_c1t  (stg1_mcu0_clk_stop_in_c1t ),
//		 .stg1_mcu1_dr_clk_stop_in_c1t  (stg1_mcu1_dr_clk_stop_in_c1t ),
		 .gclk_l2t4        (gclk_l2t4 ),
		 .stg1_mcu1_clk_stop_in_c1t  (stg1_mcu1_clk_stop_in_c1t ),
		 .stg1_mcu1_io_clk_stop_in_c1t  (stg1_mcu1_io_clk_stop_in_c1t ),
//		 .stg2_mcu0_dr_clk_stop_out_c1t  (stg2_mcu0_dr_clk_stop_out_c1t ),
		 .stg1_mio_clk_stop_in_c1t  (stg1_mio_clk_stop_in_c1t ),
		 .stg2_mcu0_io_clk_stop_out_c1t  (stg2_mcu0_io_clk_stop_out_c1t ),
		 .stg2_mcu0_clk_stop_out_c1t  (stg2_mcu0_clk_stop_out_c1t ),
		 .stg2_mio_clk_stop_out_c1t  (stg2_mio_clk_stop_out_c1t ),
		 .stg2_mcu1_io_clk_stop_out_c1t  (stg2_mcu1_io_clk_stop_out_c1t ),
		 .stg2_mcu1_clk_stop_out_c1t  (stg2_mcu1_clk_stop_out_c1t ) );

	 n2_clk_gl_cc_stage_rst_m0 x5  (
		 .stg1_rst_l2_por_out_c1b  (stg1_rst_l2_por_out_c1b ),
		 .stg1_dmu_peu_por_out_c1b  (stg1_dmu_peu_por_out_c1b ),
		 .gclk_in          (gclk_rst ),
		 .gl_rst_l2_por_c1m  (gl_rst_l2_por_c1m ),
		 .stg1_rst_l2_wmr_out_c1t  (stg1_rst_l2_wmr_out_c1t ),
		 .stg1_rst_l2_wmr_out_c1b  (stg1_rst_l2_wmr_out_c1b ),
		 .stg1_rst_niu_wmr_out_c1b  (stg1_rst_niu_wmr_out_c1b ),
		 .stg1_dmu_peu_wmr_out_c1b  (stg1_dmu_peu_wmr_out_c1b ),
		 .rst_niu_mac_     (rst_niu_mac_ ),
		 .rst_l2_por_      (rst_l2_por_ ),
		 .rst_l2_wmr_      (rst_l2_wmr_ ),
		 .stg1_rst_niu_mac_out_c1b  (stg1_rst_niu_mac_out_c1b ),
		 .rst_dmu_peu_por_  (rst_dmu_peu_por_ ),
		 .rst_dmu_peu_wmr_  (rst_dmu_peu_wmr_ ),
		 .stg1_rst_l2_por_out_c1t  (stg1_rst_l2_por_out_c1t ),
		 .gl_rst_l2_wmr_c1m  (gl_rst_l2_wmr_c1m ),
		 .rst_niu_wmr_     (rst_niu_wmr_ ) );

	 n2_clk_gl_cc_stg_c1t_s4_0 x6  (
		 .gl_mio_io2x_sync_en_c1t  (gl_mio_io2x_sync_en_c1t ), 
		 .gl_l2_wmr_c1t    (gl_l2_wmr_c1t ),
		 .stg1_io_cmp_sync_en_in_c1t  (stg1_io_cmp_sync_en_in_c1tg ), // for int6.1 (set 3)
		 .stg1_cmp_io_sync_en_in_c1t (stg1_cmp_io_sync_en_in_c1tg ), // for int6.1 (set 3)
		 .stg1_mio_io2x_sync_en_in_c1t (stg1_mio_io2x_sync_en_in_c1tg), // for int6.1 (set 3)
		 .stg1_l2_wmr_in_c1t  (stg1_l2_wmr_in_c1tg ), // for int6.1 (set 3)
		 .gl_io_cmp_sync_en_c1t  (gl_io_cmp_sync_en_c1t ),
		 .gclk_spc4        (gclk_spc4 ),
		 .gl_cmp_io_sync_en_c1t  (gl_cmp_io_sync_en_c1t ) );

	 n2_clk_gl_cc_stg_c1t_s4_2 x7  (
		 .gl_l2d5_clk_stop  (gl_l2d5_clk_stop ),
		 .gl_l2b5_clk_stop  (gl_l2b5_clk_stop ),
		 .stg1_l2d5_clk_stop_in_c1t  (stg1_l2d5_clk_stop_in_c1t ),
		 .stg1_mio_clk_stop_in_c1t  (stg1_mio_clk_stop_in_c1tg ), // for int6.1 (set 3)	
		 .gl_mio_clk_stop_c1t  (gl_mio_clk_stop_c1t ),
		 .stg1_l2b5_clk_stop_in_c1t  (stg1_l2b5_clk_stop_in_c1t ),
		 .gclk_l2d5        (gclk_l2d5 ) );

	 n2_clk_gl_cc_stg_c1b_s1_1 x8  (
		 .gclk_spc6        (gclk_spc6s ), //  for int6.1 (set 3)
		 .stg2_ncu_io_clk_stop_out_c1b  (stg2_ncu_io_clk_stop_out_c1b ),
		 .stg2_ccx_clk_stop_out_c1b  (stg2_ccx_clk_stop_out_c1b ),
		 .stg1_ncu_clk_stop_in_c1b  (stg1_ncu_clk_stop_in_c1b ),
		 .stg1_sii_io_clk_stop_in_c1b  (stg1_sii_io_clk_stop_in_c1b ),
		 .stg1_ncu_io_clk_stop_in_c1b  (stg1_ncu_io_clk_stop_in_c1b ),
		 .stg1_sii_clk_stop_in_c1b  (stg1_sii_clk_stop_in_c1b ),
		 .stg1_ccx_clk_stop_in_c1b  (stg1_ccx_clk_stop_in_c1b ),
		 .stg1_dmu_io_clk_stop_in_c1b  (stg1_dmu_io_clk_stop_in_c1b ),
		 .stg2_peu_io_clk_stop_out_c1b  (stg2_peu_io_clk_stop_out_c1b ),
		 .stg2_sii_clk_stop_out_c1b  (stg2_sii_clk_stop_out_c1b ),
		 .stg2_ncu_clk_stop_out_c1b  (stg2_ncu_clk_stop_out_c1b ),
		 .stg2_l2t7_clk_stop_out_c1b  (stg2_l2t7_clk_stop_out_c1b ),
		 .stg2_dmu_io_clk_stop_out_c1b  (stg2_dmu_io_clk_stop_out_c1b ),
		 .stg1_peu_io_clk_stop_in_c1b  (stg1_peu_io_clk_stop_in_c1b ),
		 .stg1_l2t7_clk_stop_in_c1b  (stg1_l2t7_clk_stop_in_c1b ),
		 .stg2_sii_io_clk_stop_out_c1b  (stg2_sii_io_clk_stop_out_c1b ) );

	 n2_clk_gl_cc_stg_c1b_s4_2 x9  (
		 .gl_rdp_io_clk_stop  (gl_rdp_io_clk_stop ),
		 .gl_rtx_io_clk_stop  (gl_rtx_io_clk_stop ),
		 .stg1_rdp_io_clk_stop_in_c1b  (stg1_rdp_io_clk_stop_in_c1b ),
		 .stg1_mac_io_clk_stop_in_c1b  (stg1_mac_io_clk_stop_in_c1b ),
		 .stg1_rtx_io_clk_stop_in_c1b  (stg1_rtx_io_clk_stop_in_c1b ),
		 .gl_mac_io_clk_stop  (gl_mac_io_clk_stop ),
		 .stg1_tds_io_clk_stop_in_c1b  (stg1_tds_io_clk_stop_in_c1b ),
		 .gclk_spc6        (gclk_spc6 ),
		 .gl_tds_io_clk_stop  (gl_tds_io_clk_stop ) );

	 n2_clk_gl_cc_stg_c1b_s4_1 x10  (
		 .gclk_l2d6        (gclk_l2d6 ),
		 .gl_l2d7_clk_stop  (gl_l2d7_clk_stop ),
		 .stg1_spc6_clk_stop_in_c1b  (stg1_spc6_clk_stop_in_c1b ),
		 .gl_spc6_clk_stop  (gl_spc6_clk_stop ),
		 .stg1_l2d7_clk_stop_in_c1b (stg1_l2d7_clk_stop_in_c1b ) );

	 n2_clk_gl_cc_stg_c1b_s4_0 x11  (
		 .gl_l2_wmr_c1b    (gl_l2_wmr_c1b ),
		 .gclk_l2b6        (gclk_l2b6 ),
		 .gl_io_cmp_sync_en_c1b  (gl_io_cmp_sync_en_c1b ),
		 .stg1_io_cmp_sync_en_in_c1b  (stg1_io_cmp_sync_en_in_c1bg ), // for int6.1 (set 3)
	 	 .stg1_l2_por_in_c1b  (stg1_l2_por_in_c1bg ),	// for int6.1 (set 3)
		 .stg1_cmp_io_sync_en_in_c1b  (stg1_cmp_io_sync_en_in_c1bg ), //  for int6.1 (set 3)
		 .gl_cmp_io_sync_en_c1b  (gl_cmp_io_sync_en_c1b ),
	 	 .gl_l2_por_c1b  (gl_l2_por_c1b ),	// for int6.1
		 .stg1_l2_wmr_in_c1b  (stg1_l2_wmr_in_c1bg ) ); // for int6.1 (set 3)

	 n2_clk_gl_cc_stg_c1b_s1_0 x12  (
		 .gclk_l2t6        (gclk_l2t6 ),
		 .stg1_l2b2_clk_stop_in_c1b  (stg1_l2b2_clk_stop_in_c1b ),
		 .stg2_l2t2_clk_stop_out_c1b  (stg2_l2t2_clk_stop_out_c1b ),
		 .stg1_spc7_clk_stop_in_c1b  (stg1_spc7_clk_stop_in_c1b ),
		 .stg2_db0_clk_stop_out_c1b  (stg2_db0_clk_stop_out_c1b ),
		 .stg2_l2_por_out_c1b  (stg2_l2_por_out_c1b ),
		 .stg2_dmu_peu_wmr_out_c1b  (stg2_dmu_peu_wmr_out_c1b ),
		 .stg2_dmu_peu_por_out_c1b  (stg2_dmu_peu_por_out_c1b ),
		 .stg2_l2d3_clk_stop_out_c1b  (stg2_l2d3_clk_stop_out_c1b ),
		 .stg2_io_cmp_sync_en_out_c1b  (stg2_io_cmp_sync_en_out_c1b ),
		 .stg2_spc2_clk_stop_out_c1b  (stg2_spc2_clk_stop_out_c1b ),
		 .stg2_l2t3_clk_stop_out_c1b  (stg2_l2t3_clk_stop_out_c1b ),
		 .stg2_cmp_io_sync_en_out_c1b  (stg2_cmp_io_sync_en_out_c1b ),
		 .stg2_l2_wmr_out_c1b  (stg2_l2_wmr_out_c1b ),
		 .stg2_spc3_clk_stop_out_c1b  (stg2_spc3_clk_stop_out_c1b ),
		 .stg2_l2b2_clk_stop_out_c1b  (stg2_l2b2_clk_stop_out_c1b ),
		 .stg2_spc7_clk_stop_out_c1b  (stg2_spc7_clk_stop_out_c1b ),
		 .stg1_l2d3_clk_stop_in_c1b  (stg1_l2d3_clk_stop_in_c1b ),
		 .stg1_l2t3_clk_stop_in_c1b  (stg1_l2t3_clk_stop_in_c1b ),
		 .stg1_l2t2_clk_stop_in_c1b  (stg1_l2t2_clk_stop_in_c1b ),
		 .stg1_dmu_peu_wmr_in_c1b  (stg1_dmu_peu_wmr_in_c1b ),
		 .stg1_dmu_peu_por_in_c1b  (stg1_dmu_peu_por_in_c1b ),
		 .stg1_io_out_in_c1b  (stg1_io_out_in_c1b ), 
		 .stg2_io_out_out_c1b (stg2_io_out_out_c1b), 
		 .stg1_l2b3_clk_stop_in_c1b  (stg1_l2b3_clk_stop_in_c1b ),
		 .stg1_db0_clk_stop_in_c1b  (stg1_db0_clk_stop_in_c1b ),
		 .stg1_l2_por_in_c1b  (stg1_l2_por_in_c1b ),
		 .stg1_l2_wmr_in_c1b  (stg1_l2_wmr_in_c1b ),
		 .stg1_cmp_io_sync_en_in_c1b  (stg1_cmp_io_sync_en_in_c1b ),
		 .stg2_l2d2_clk_stop_out_c1b  (stg2_l2d2_clk_stop_out_c1b ),
		 .stg1_l2d2_clk_stop_in_c1b  (stg1_l2d2_clk_stop_in_c1b ),
		 .stg1_io_cmp_sync_en_in_c1b  (stg1_io_cmp_sync_en_in_c1b ),
		 .stg1_spc2_clk_stop_in_c1b  (stg1_spc2_clk_stop_in_c1b ),
		 .stg2_l2b3_clk_stop_out_c1b  (stg2_l2b3_clk_stop_out_c1b ),
		 .stg1_spc3_clk_stop_in_c1b  (stg1_spc3_clk_stop_in_c1b ) );

	 n2_clk_gl_cc_stg_c1b_s4_3 x13  (
		 .gl_io2x_out_c1b  (gl_io2x_out_c1b ),
		 .gl_io_out_c1b    (gl_io_out_c1b ),
		 .stg1_io_out_in_c1b  (stg1_io_out_in_c1bg ),
		 .stg1_rst_niu_wmr_in_c1b  (stg1_rst_niu_wmr_in_c1b ),
		 .stg1_rst_mac_in_c1b  (stg1_rst_mac_in_c1b ),
		 .stg1_io2x_out_in_c1b  (stg1_io2x_out_in_c1b ),
		 .gl_rst_mac_c1b   (gl_rst_mac_c1b ),
		 .gclk_mac         (gclk_mac ),
		 .gl_rst_niu_wmr_c1b  (gl_rst_niu_wmr_c1b ) );

	 n2_clk_gl_cc_stg_c2b_s1_0 x14  (
		 .gclk_spc7        (gclk_spc7 ),
		 .stg3_l2t2_clk_stop_out_c2b  (stg3_l2t2_clk_stop_out_c2b ),
		 .stg3_l2t3_clk_stop_out_c2b  (stg3_l2t3_clk_stop_out_c2b ),
		 .stg2_l2t3_clk_stop_in_c2bz  (stg2_l2t3_clk_stop_in_c2bz ),
		 .stg3_io_cmp_sync_en_out_c2b  (stg3_io_cmp_sync_en_out_c2b ),
		 .stg3_io_out_out_c2b  (stg3_io_out_out_c2b ),
		 .stg3_l2_wmr_out_c2b  (stg3_l2_wmr_out_c2b ),
		 .stg3_l2_por_out_c2b  (stg3_l2_por_out_c2b ),
		 .stg3_dmu_peu_por_out_c2b  (stg3_dmu_peu_por_out_c2b ),
		 .stg3_dmu_peu_wmr_out_c2b  (stg3_dmu_peu_wmr_out_c2b ),
		 .stg3_spc2_clk_stop_out_c2b  (stg3_spc2_clk_stop_out_c2b ),
		 .stg3_spc3_clk_stop_out_c2b  (stg3_spc3_clk_stop_out_c2b ),
		 .stg3_spc7_clk_stop_out_c2b  (stg3_spc7_clk_stop_out_c2b ),
		 .stg3_l2b2_clk_stop_out_c2b  (stg3_l2b2_clk_stop_out_c2b ),
		 .stg3_db0_clk_stop_out_c2b  (stg3_db0_clk_stop_out_c2b ),
		 .stg3_l2d2_clk_stop_out_c2b  (stg3_l2d2_clk_stop_out_c2b ),
		 .stg3_l2d3_clk_stop_out_c2b  (stg3_l2d3_clk_stop_out_c2b ),
		 .stg3_l2b3_clk_stop_out_c2b  (stg3_l2b3_clk_stop_out_c2b ),
		 .stg2_io_cmp_sync_en_in_c2b  (stg2_io_cmp_sync_en_in_c2b ),
		 .stg2_l2_wmr_in_c2b  (stg2_l2_wmr_in_c2b ),
		 .stg2_l2_por_in_c2b  (stg2_l2_por_in_c2b ),
		 .stg2_dmu_peu_por_in_c2b  (stg2_dmu_peu_por_in_c2b ),
		 .stg2_dmu_peu_wmr_in_c2b  (stg2_dmu_peu_wmr_in_c2b ),
		 .stg2_spc2_clk_stop_in_c2b  (stg2_spc2_clk_stop_in_c2b ),
		 .stg2_spc3_clk_stop_in_c2b  (stg2_spc3_clk_stop_in_c2b ),
		 .stg2_spc7_clk_stop_in_c2b  (stg2_spc7_clk_stop_in_c2b ),
		 .stg2_db0_clk_stop_in_c2b  (stg2_db0_clk_stop_in_c2b ),
		 .stg2_l2d2_clk_stop_in_c2b  (stg2_l2d2_clk_stop_in_c2b ),
		 .stg2_l2d3_clk_stop_in_c2b  (stg2_l2d3_clk_stop_in_c2b ),
		 .stg2_l2b2_clk_stop_in_c2b  (stg2_l2b2_clk_stop_in_c2b ),
		 .stg2_l2b3_clk_stop_in_c2b  (stg2_l2b3_clk_stop_in_c2b ),
		 .stg3_cmp_io_sync_en_out_c2b  (stg3_cmp_io_sync_en_out_c2b ),
		 .stg2_cmp_io_sync_en_in_c2b  (stg2_cmp_io_sync_en_in_c2b ),
		 .stg2_io_out_in_c2b (stg2_io_out_in_c2b ), 
		 .stg2_l2t2_clk_stop_in_c2b  (stg2_l2t2_clk_stop_in_c2b ) );

	 n2_clk_gl_cc_stg_c2b_s1_1 x15  (
		 .stg2_sii_clk_stop_in_c2b  (stg2_sii_clk_stop_in_c2b ),
		 .gclk_l2t7        (gclk_l2t7 ),
		 .stg2_ncu_clk_stop_in_c2b  (stg2_ncu_clk_stop_in_c2b ),
		 .stg3_l2t7_clk_stop_out_c2b  (stg3_l2t7_clk_stop_out_c2b ),
		 .stg3_ccx_clk_stop_out_c2b  (stg3_ccx_clk_stop_out_c2b ),
		 .stg3_sii_clk_stop_out_c2b  (stg3_sii_clk_stop_out_c2b ),
		 .stg3_ncu_clk_stop_out_c2b  (stg3_ncu_clk_stop_out_c2b ),
		 .stg3_sii_io_clk_stop_out_c2b  (stg3_sii_io_clk_stop_out_c2b ),
		 .stg3_ncu_io_clk_stop_out_c2b  (stg3_ncu_io_clk_stop_out_c2b ),
		 .stg3_dmu_io_clk_stop_out_c2b  (stg3_dmu_io_clk_stop_out_c2b ),
		 .stg3_peu_io_clk_stop_out_c2b  (stg3_peu_io_clk_stop_out_c2b ),
		 .stg2_peu_io_clk_stop_in_c2b  (stg2_peu_io_clk_stop_in_c2b ),
		 .stg2_sii_io_clk_stop_in_c2b  (stg2_sii_io_clk_stop_in_c2b ),
		 .stg2_ncu_io_clk_stop_in_c2b  (stg2_ncu_io_clk_stop_in_c2b ),
		 .stg2_dmu_io_clk_stop_in_c2b  (stg2_dmu_io_clk_stop_in_c2b ),
		 .stg2_l2t7_clk_stop_in_c2b  (stg2_l2t7_clk_stop_in_c2b ),
		 .stg2_ccx_clk_stop_in_c2b  (stg2_ccx_clk_stop_in_c2b ) );

	 n2_clk_gl_cc_stg_c2b_s2_0 x16  (
		 .gclk_l2t3        (gclk_l2t3 ),
	//     .spare_c2b_s2_out6  (spare_c2b_s2_out6 ),
		 .gl_l2_wmr_c2b    (gl_l2_wmr_c2b ),
		 .stg3_ccx_clk_stop_in_c2b  (stg3_ccx_clk_stop_in_c2b ),
		 .stg3_l2t3_clk_stop_in_c2b  (stg3_l2t3_clk_stop_in_c2b ),
		 .stg3_l2_por_in_c2b  (stg3_l2_por_in_c2b ),
		 .stg3_l2_wmr_in_c2b  (stg3_l2_wmr_in_c2b ),
		 .stg3_io_cmp_sync_en_in_c2b  (stg3_io_cmp_sync_en_in_c2b ),
		 .stg3_cmp_io_sync_en_in_c2b  (stg3_cmp_io_sync_en_in_c2b ),
		 .stg3_l2t7_clk_stop_in_c2b  (stg3_l2t7_clk_stop_in_c2b ),
		 .gl_ccx_clk_stop  (gl_ccx_clk_stop ),
		 .gl_l2t3_clk_stop  (gl_l2t3_clk_stop ),
		 .gl_l2t7_clk_stop  (gl_l2t7_clk_stop ),
		 .gl_l2_por_c2b    (gl_l2_por_c2b ),
	//     .spare_c2b_s2_in6  (1'b0 ),
		 .gl_cmp_io_sync_en_c2b  (gl_cmp_io_sync_en_c2b ),
		 .gl_io_cmp_sync_en_c2b  (gl_io_cmp_sync_en_c2b ) );

	 n2_clk_gl_cc_stg_c2b_s2_1 x17  (
		 .gclk_spc3        (gclk_spc3 ),
		 .gl_spc3_clk_stop  (gl_spc3_clk_stop ),
		 .gl_spc7_clk_stop  (gl_spc7_clk_stop ),
		 .stg3_spc7_clk_stop_in_c2b  (stg3_spc7_clk_stop_in_c2b ),
		 .stg3_spc3_clk_stop_in_c2b  (stg3_spc3_clk_stop_in_c2b ) );

	 n2_clk_gl_cc_stg_c2t_s1_1 x18  (
		 .stg2_io2x_sync_en_in_c2t  (stg2_io2x_sync_en_in_c2t ),
//		 .stg3_spc5_clk_stop_in_c2b  (stg3_spc5_clk_stop_in_c2b ),
		 .stg2_mio_clk_stop_in_c2t  (stg2_mio_clk_stop_in_c2t ),
		 .stg3_mio_clk_stop_out_c2t  (stg3_mio_clk_stop_out_c2t ),
		 .stg3_io2x_sync_en_out_c2t  (stg3_io2x_sync_en_out_c2t ),
//		 .stg4_spc1_clk_stop_out_c2b  (stg4_spc1_clk_stop_out_c2b ),
//		 .stg4_spc5_clk_stop_out_c2b  (stg4_spc5_clk_stop_out_c2b ),
		 .gclk_l2t5        (gclk_l2t5 ),
			.stg2_mcu0_clk_stop_in_c2t ( stg2_mcu0_clk_stop_in_c2t ),
			.stg2_mcu1_clk_stop_in_c2t ( stg2_mcu1_clk_stop_in_c2t ),
			.stg3_mcu0_clk_stop_out_c2t ( stg3_mcu0_clk_stop_out_c2t ),
			.stg3_mcu1_clk_stop_out_c2t ( stg3_mcu1_clk_stop_out_c2t ),

			.stg2_mcu0_io_clk_stop_in_c2t ( stg2_mcu0_io_clk_stop_in_c2t ),
//			.stg2_mcu0_dr_clk_stop_in_c2t ( stg2_mcu0_dr_clk_stop_in_c2t ),
//			.stg2_mcu1_dr_clk_stop_in_c2t ( stg2_mcu1_dr_clk_stop_in_c2t ),
			.stg2_mcu1_io_clk_stop_in_c2t ( stg2_mcu1_io_clk_stop_in_c2t ),
//			.stg3_mcu0_dr_clk_stop_out_c2t ( stg3_mcu0_dr_clk_stop_out_c2t ),
			.stg3_mcu0_io_clk_stop_out_c2t ( stg3_mcu0_io_clk_stop_out_c2t ),
//			.stg3_mcu1_dr_clk_stop_out_c2t ( stg3_mcu1_dr_clk_stop_out_c2t ),
			.stg3_mcu1_io_clk_stop_out_c2t ( stg3_mcu1_io_clk_stop_out_c2t ) );
//		 .stg3_spc1_clk_stop_in_c2b  (stg3_spc1_clk_stop_in_c2b ) );

	 n2_clk_gl_cc_stg_c2t_s1_0 x19  (
		 .gclk_spc5        (gclk_spc5 ),
		 .stg3_l2t5_clk_stop_out_c2t  (stg3_l2t5_clk_stop_out_c2t ),
		 .stg3_l2t1_clk_stop_out_c2t  (stg3_l2t1_clk_stop_out_c2t ),
		 .stg3_l2t0_clk_stop_out_c2t  (stg3_l2t0_clk_stop_out_c2t ),
		 .stg3_l2b1_clk_stop_out_c2t  (stg3_l2b1_clk_stop_out_c2t ),
		 .stg3_l2b0_clk_stop_out_c2t  (stg3_l2b0_clk_stop_out_c2t ),
		 .stg3_l2d1_clk_stop_out_c2t  (stg3_l2d1_clk_stop_out_c2t ),
		 .stg3_l2d0_clk_stop_out_c2t  (stg3_l2d0_clk_stop_out_c2t ),
		 .stg3_spc5_clk_stop_out_c2t  (stg3_spc5_clk_stop_out_c2t ),
		 .stg3_spc1_clk_stop_out_c2t  (stg3_spc1_clk_stop_out_c2t ),
		 .stg3_spc0_clk_stop_out_c2t  (stg3_spc0_clk_stop_out_c2t ),
		 .stg3_l2_por_out_c2t  (stg3_l2_por_out_c2t ),
		 .stg3_io_out_out_c2t  (stg3_io_out_out_c2t ),
		 .stg3_dr_sync_en_out_c2t  (stg3_dr_sync_en_out_c2t ),
		 .stg3_mio_io2x_sync_en_out_c2t  (stg3_mio_io2x_sync_en_out_c2t ),
		 .stg3_io_cmp_sync_en_out_c2t  (stg3_io_cmp_sync_en_out_c2t ),
		 .stg3_cmp_io_sync_en_out_c2t  (stg3_cmp_io_sync_en_out_c2t ),
		 .stg2_cmp_io_sync_en_in_c2t  (stg2_cmp_io_sync_en_in_c2t ),
		 .stg2_io_cmp_sync_en_in_c2t  (stg2_io_cmp_sync_en_in_c2t ),
		 .stg2_mio_io2x_sync_en_in_c2t  (stg2_mio_io2x_sync_en_in_c2t ),
		 .stg2_dr_sync_en_in_c2t  (stg2_dr_sync_en_in_c2t ),
		 .stg2_io_out_in_c2t  (stg2_io_out_in_c2t ),
		 .stg3_l2_wmr_out_c2t  (stg3_l2_wmr_out_c2t ),
		 .stg2_l2_wmr_in_c2t  (stg2_l2_wmr_in_c2t ),
		 .stg2_l2_por_in_c2t  (stg2_l2_por_in_c2t ),
		 .stg2_spc0_clk_stop_in_c2t  (stg2_spc0_clk_stop_in_c2t ),
		 .stg2_spc1_clk_stop_in_c2t  (stg2_spc1_clk_stop_in_c2t ),
		 .stg2_spc5_clk_stop_in_c2t  (stg2_spc5_clk_stop_in_c2t ),
		 .stg2_l2d0_clk_stop_in_c2t  (stg2_l2d0_clk_stop_in_c2t ),
		 .stg2_l2d1_clk_stop_in_c2t  (stg2_l2d1_clk_stop_in_c2t ),
		 .stg2_l2b0_clk_stop_in_c2t  (stg2_l2b0_clk_stop_in_c2t ),
		 .stg2_l2b1_clk_stop_in_c2t  (stg2_l2b1_clk_stop_in_c2t ),
		 .stg2_l2t0_clk_stop_in_c2t  (stg2_l2t0_clk_stop_in_c2t ),
		 .stg2_l2t5_clk_stop_in_c2t  (stg2_l2t5_clk_stop_in_c2t ),
		 .stg2_l2t1_clk_stop_in_c2t  (stg2_l2t1_clk_stop_in_c2t ) );

	 n2_clk_gl_cc_stg_c2t_s2_1 x20  (
		 .gclk_spc1        (gclk_spc1 ),
		 .stg3_spc1_clk_stop_in_c2t  (stg3_spc1_clk_stop_in_c2t ),
		 .stg3_mio_clk_stop_in_c2t  (stg3_mio_clk_stop_in_c2t ),
		 .gl_mio_clk_stop_c2t  (gl_mio_clk_stop_c2t ),
		 .gl_spc5_clk_stop (gl_spc5_clk_stop ),
		 .gl_io2x_sync_en_c2t  (gl_io2x_sync_en_c2t ),
		 .gl_spc1_clk_stop (gl_spc1_clk_stop ),
		 .stg3_io2x_sync_en_in_c2t  (stg3_io2x_sync_en_in_c2t ),
		 .stg3_spc5_clk_stop_in_c2t  (stg3_spc5_clk_stop_in_c2t ) );

	 n2_clk_gl_cc_stg_c2t_s2_0 x21  (
		 .stg3_l2t5_clk_stop_in_c2t  (stg3_l2t5_clk_stop_in_c2t ),
		 .gl_l2_por_c2t    (gl_l2_por_c2t ),
		 .stg3_io_cmp_sync_en_in_c2t  (stg3_io_cmp_sync_en_in_c2t ),
		 .stg3_l2_wmr_in_c2t  (stg3_l2_wmr_in_c2t ),
		 .stg3_l2_por_in_c2t  (stg3_l2_por_in_c2t ),
		 .stg3_l2t1_clk_stop_in_c2t  (stg3_l2t1_clk_stop_in_c2t ),
		 .stg3_cmp_io_sync_en_in_c2t  (stg3_cmp_io_sync_en_in_c2t ),
		 .gclk_l2t1        (gclk_l2t1 ),
		 .gl_l2_wmr_c2t    (gl_l2_wmr_c2t ),
		 .gl_cmp_io_sync_en_c2t  (gl_cmp_io_sync_en_c2t ),
		 .gl_l2t5_clk_stop  (gl_l2t5_clk_stop ),
		 .gl_io_cmp_sync_en_c2t  (gl_io_cmp_sync_en_c2t ),
		 .gl_l2t1_clk_stop  (gl_l2t1_clk_stop ) );

	 n2_clk_gl_cc_stg_c3t_s1_0 x22  (
		 .stg3_cmp_io_sync_en_in_c3t  (stg3_cmp_io_sync_en_in_c3t ),
		 .stg4_mio_io2x_sync_en_out_c3t  (stg4_mio_io2x_sync_en_out_c3t ),
		 .stg4_io_out_out_c3t  (stg4_io_out_out_c3t ),
		 .stg4_l2_wmr_out_c3t  (stg4_l2_wmr_out_c3t ),
		 .stg4_l2_por_out_c3t  (stg4_l2_por_out_c3t ),
		 .stg4_spc0_clk_stop_out_c3t  (stg4_spc0_clk_stop_out_c3t ),
		 .stg4_l2d0_clk_stop_out_c3t  (stg4_l2d0_clk_stop_out_c3t ),
		 .stg4_l2d1_clk_stop_out_c3t  (stg4_l2d1_clk_stop_out_c3t ),
		 .stg4_l2b0_clk_stop_out_c3t  (stg4_l2b0_clk_stop_out_c3t ),
		 .stg4_l2b1_clk_stop_out_c3t  (stg4_l2b1_clk_stop_out_c3t ),
		 .stg4_l2t0_clk_stop_out_c3t  (stg4_l2t0_clk_stop_out_c3t ),
		 .stg3_mio_io2x_sync_en_in_c3t  (stg3_mio_io2x_sync_en_in_c3t ),
		 .stg3_dr_sync_en_in_c3t  (stg3_dr_sync_en_in_c3t ),
		 .stg3_io_out_in_c3t  (stg3_io_out_in_c3t ),
		 .stg3_l2_wmr_in_c3t  (stg3_l2_wmr_in_c3t ),
		 .stg3_l2_por_in_c3t  (stg3_l2_por_in_c3t ),
		 .stg3_spc0_clk_stop_in_c3t  (stg3_spc0_clk_stop_in_c3t ),
		 .stg3_l2d0_clk_stop_in_c3t  (stg3_l2d0_clk_stop_in_c3t ),
		 .stg3_l2d1_clk_stop_in_c3t  (stg3_l2d1_clk_stop_in_c3t ),
		 .stg3_l2b0_clk_stop_in_c3t  (stg3_l2b0_clk_stop_in_c3t ),
		 .stg3_l2b1_clk_stop_in_c3t  (stg3_l2b1_clk_stop_in_c3t ),
		 .stg3_l2t0_clk_stop_in_c3t  (stg3_l2t0_clk_stop_in_c3t ),
		 .stg4_cmp_io_sync_en_out_c3t  (stg4_cmp_io_sync_en_out_c3t ),
		 .stg4_dr_sync_en_out_c3t  (stg4_dr_sync_en_out_c3t ),
		 .gclk_spc0        (gclk_spc0 ),
		 .stg3_io_cmp_sync_en_in_c3t  (stg3_io_cmp_sync_en_in_c3t ),
		 .stg4_io_cmp_sync_en_out_c3t  (stg4_io_cmp_sync_en_out_c3t ) );

	 n2_clk_gl_cc_stg_c3t_s1_1 x23  (
		 .gclk_l2t0        (gclk_l2t0 ),
		 .stg3_mcu1_clk_stop_in_c3t  (stg3_mcu1_clk_stop_in_c3t ),
		 .stg3_mcu0_io_clk_stop_in_c3t  (stg3_mcu0_io_clk_stop_in_c3t ),
		 .stg3_mcu1_io_clk_stop_in_c3t  (stg3_mcu1_io_clk_stop_in_c3t ),
//		 .stg3_mcu0_dr_clk_stop_in_c3t  (stg3_mcu0_dr_clk_stop_in_c3t ),
//		 .stg3_mcu1_dr_clk_stop_in_c3t  (stg3_mcu1_dr_clk_stop_in_c3t ),
		 .stg3_mio_clk_stop_in_c3t  (stg3_mio_clk_stop_in_c3t ),
		 .stg4_mcu0_clk_stop_out_c3t  (stg4_mcu0_clk_stop_out_c3t ),
		 .stg4_mcu1_clk_stop_out_c3t  (stg4_mcu1_clk_stop_out_c3t ),
		 .stg4_mcu0_io_clk_stop_out_c3t  (stg4_mcu0_io_clk_stop_out_c3t ),
		 .stg4_mcu1_io_clk_stop_out_c3t  (stg4_mcu1_io_clk_stop_out_c3t ),
//		 .stg4_mcu0_dr_clk_stop_out_c3t  (stg4_mcu0_dr_clk_stop_out_c3t ),
//		 .stg4_mcu1_dr_clk_stop_out_c3t  (stg4_mcu1_dr_clk_stop_out_c3t ),
		 .stg4_mio_clk_stop_out_c3t  (stg4_mio_clk_stop_out_c3t ),
		 .stg3_mcu0_clk_stop_in_c3t  (stg3_mcu0_clk_stop_in_c3t ) );

	 n2_clk_gl_cc_stg_c3t_s1_3 x24  (
		 .gclk_ncu         (gclk_ncu ),
		 .stg4_cmp_io_sync_en_in_c3t  (stg4_cmp_io_sync_en_in_c3t ),
		 .gl_io2x_sync_en_c3t  (gl_io2x_sync_en_c3t ),
		 .gl_io_out_c3t    (gl_io_out_c3t ),
		 .gl_l2_wmr_c3t    (gl_l2_wmr_c3t ),
		 .gl_l2_por_c3t    (gl_l2_por_c3t ),
		 .gl_l2t0_clk_stop  (gl_l2t0_clk_stop ),
		 .gl_mcu0_clk_stop  (gl_mcu0_clk_stop ),
		 .gl_mcu1_clk_stop  (gl_mcu1_clk_stop ),
//		 .gl_mcu0_dr_clk_stop  (gl_mcu0_dr_clk_stop ),
//		 .gl_mcu1_dr_clk_stop  (gl_mcu1_dr_clk_stop ),
		 .gl_mcu0_io_clk_stop  (gl_mcu0_io_clk_stop ),
		 .gl_mcu1_io_clk_stop  (gl_mcu1_io_clk_stop ),
		 .stg4_dr_sync_en_in_c3t  (stg4_dr_sync_en_in_c3t ),
		 .stg4_io_out_in_c3t  (stg4_io_out_in_c3t ),
		 .stg4_l2_wmr_in_c3t  (stg4_l2_wmr_in_c3t ),
		 .stg4_l2_por_in_c3t  (stg4_l2_por_in_c3t ),
		 .stg4_l2t0_clk_stop_in_c3t  (stg4_l2t0_clk_stop_in_c3t ),
		 .stg4_mcu0_clk_stop_in_c3t  (stg4_mcu0_clk_stop_in_c3t ),
		 .stg4_mcu1_clk_stop_in_c3t  (stg4_mcu1_clk_stop_in_c3t ),
//		 .stg4_mcu0_dr_clk_stop_in_c3t  (stg4_mcu0_dr_clk_stop_in_c3t ),
//		 .stg4_mcu1_dr_clk_stop_in_c3t  (stg4_mcu1_dr_clk_stop_in_c3t ),
		 .stg4_mcu0_io_clk_stop_in_c3t  (stg4_mcu0_io_clk_stop_in_c3t ),
		 .stg4_mcu1_io_clk_stop_in_c3t  (stg4_mcu1_io_clk_stop_in_c3t ),
		 .gl_cmp_io_sync_en_c3t  (gl_cmp_io_sync_en_c3t ),
		 .gl_dr_sync_en_c3t  (gl_dr_sync_en_c3t ),
		 .stg4_io_cmp_sync_en_in_c3t  (stg4_io_cmp_sync_en_in_c3t ),
		 .stg4_io2x_sync_en_in_c3t  (stg4_io2x_sync_en_c3t ),
		 .gl_io_cmp_sync_en_c3t  (gl_io_cmp_sync_en_c3t ) );

	 n2_clk_gl_cc_stg_c3t_s1_2 x25  (
		 .gclk_l2b0        (gclk_l2b0 ),
		 .gl_l2_por_c3t    (gl_l2_por_c3t0 ),
		 .gl_l2d1_clk_stop  (gl_l2d1_clk_stop ),
		 .gl_l2b0_clk_stop  (gl_l2b0_clk_stop ),
		 .gl_l2b1_clk_stop  (gl_l2b1_clk_stop ),
		 .gl_mio_clk_stop_c3t  (gl_mio_clk_stop_c3t ),
		 .stg4_spc0_clk_stop_in_c3t  (stg4_spc0_clk_stop_in_c3t ),
		 .stg4_cmp_io_sync_en_in_c3t  (stg4_cmp_io_sync_en_in_c3t0 ), // for int6.1 (set 3)
		 .stg4_io_cmp_sync_en_in_c3t  (stg4_io_cmp_sync_en_in_c3t0 ), // for int6.1 (set 3)
		 .stg4_l2_wmr_in_c3t  (stg4_l2_wmr_in_c3t0 ),// for int6.1 (set 3)
		 .stg4_l2_por_in_c3t  (stg4_l2_por_in_c3t0 ),// for int6.1 (set 3)
		 .stg4_l2d0_clk_stop_in_c3t  (stg4_l2d0_clk_stop_in_c3t ),
		 .stg4_l2d1_clk_stop_in_c3t  (stg4_l2d1_clk_stop_in_c3t ),
		 .stg4_l2b0_clk_stop_in_c3t  (stg4_l2b0_clk_stop_in_c3t ),
		 .stg4_l2b1_clk_stop_in_c3t  (stg4_l2b1_clk_stop_in_c3t ),
		 .stg4_mio_clk_stop_in_c3t  (stg4_mio_clk_stop_in_c3t ),
		 .gl_io2x_sync_en_c3t  (gl_io2x_sync_en_c3t0 ),
		 .gl_spc0_clk_stop  (gl_spc0_clk_stop ),
		 .gl_cmp_io_sync_en_c3t  (gl_cmp_io_sync_en_c3t0 ),
		 .gl_io_cmp_sync_en_c3t  (gl_io_cmp_sync_en_c3t0 ),
		 .gl_l2d0_clk_stop  (gl_l2d0_clk_stop ),
		 .stg4_io2x_sync_en_in_c3t  (stg4_io2x_sync_en_in_c3t ),
		 .gl_l2_wmr_c3t    (gl_l2_wmr_c3t0 ) );

	 n2_clk_gl_cc_stg_c3b_s1_2 x26  (
		 .stg4_sii_io_clk_stop_in_c3b  (stg4_sii_io_clk_stop_in_c3b ),
		 .gl_io_out_c3b    (gl_io_out_c3b0 ),
		 .gl_l2_wmr_c3b    (gl_l2_wmr_c3b ),
		 .gl_l2_por_c3b    (gl_l2_por_c3b0 ),
		 .gl_l2d2_clk_stop  (gl_l2d2_clk_stop ),
		 .gl_l2d3_clk_stop  (gl_l2d3_clk_stop ),
		 .gl_l2b2_clk_stop  (gl_l2b2_clk_stop ),
		 .gl_l2b3_clk_stop  (gl_l2b3_clk_stop ),
		 .gl_l2t2_clk_stop  (gl_l2t2_clk_stop ),
		 .gl_sii_clk_stop  (gl_sii_clk_stop ),
		 .gl_ncu_clk_stop  (gl_ncu_clk_stop ),
		 .gl_sii_io_clk_stop  (gl_sii_io_clk_stop ),
		 .gl_ncu_io_clk_stop  (gl_ncu_io_clk_stop ),
		 .gclk_l2d2        (gclk_l2d2 ),
		 .stg4_ncu_clk_stop_in_c3b  (stg4_ncu_clk_stop_in_c3b ),
		 .stg4_sii_clk_stop_in_c3b  (stg4_sii_clk_stop_in_c3b ),
		 .stg4_l2t2_clk_stop_in_c3b  (stg4_l2t2_clk_stop_in_c3b ),
		 .stg4_l2b3_clk_stop_in_c3b  (stg4_l2b3_clk_stop_in_c3b ),
		 .stg4_l2b2_clk_stop_in_c3b  (stg4_l2b2_clk_stop_in_c3b ),
		 .stg4_cmp_io_sync_en_in_c3b  (stg4_cmp_io_sync_en_in_c3b ),
		 .stg4_l2d3_clk_stop_in_c3b  (stg4_l2d3_clk_stop_in_c3b ),
		 .stg4_l2d2_clk_stop_in_c3b  (stg4_l2d2_clk_stop_in_c3b ),
		 .stg4_l2_por_in_c3b  (stg4_l2_por_in_c3b ),
		 .stg4_l2_wmr_in_c3b  (stg4_l2_wmr_in_c3b ),
		 .stg4_io_out_in_c3b  (stg4_io_out_in_c3b0 ), // for int6.1 (set 3)
		 .stg4_io_cmp_sync_en_in_c3b  (stg4_io_cmp_sync_en_in_c3b ),
		 .gl_io_cmp_sync_en_c3b  (gl_io_cmp_sync_en_c3b ),
		 .gl_cmp_io_sync_en_c3b  (gl_cmp_io_sync_en_c3b ),
		 .stg4_ncu_io_clk_stop_c3b  (stg4_ncu_io_clk_stop_c3b ) );

	 n2_clk_gl_cc_stg_c3b_s1_3 x27  (
		 .gclk_dmu         (gclk_dmu ),
		 .stg4_dmu_peu_por_in_c3b  (stg4_dmu_peu_por_in_c3b ),
		 .stg4_dmu_peu_wmr_in_c3b  (stg4_dmu_peu_wmr_in_c3b ),
		 .stg4_spc2_clk_stop_in_c3b  (stg4_spc2_clk_stop_in_c3b ),
		 .stg4_db0_clk_stop_c3b  (stg4_db0_clk_stop_c3b ),
		 .stg4_dmu_io_clk_stop_in_c3b  (stg4_dmu_io_clk_stop_in_c3b ),
		 .stg4_peu_io_clk_stop_in_c3b  (stg4_peu_io_clk_stop_in_c3b ),
		 .gl_io_out_c3b    (gl_io_out_c3b ),
		 .gl_dmu_peu_por_c3b  (gl_dmu_peu_por_c3b ),
		 .gl_dmu_peu_wmr_c3b  (gl_dmu_peu_wmr_c3b ),
		 .gl_spc2_clk_stop  (gl_spc2_clk_stop ),
		 .gl_db0_clk_stop  (gl_db0_clk_stop ),
		 .gl_dmu_io_clk_stop  (gl_dmu_io_clk_stop ),
		 .gl_peu_io_clk_stop  (gl_peu_io_clk_stop ),
		 .stg4_io_out_in_c3b  (stg4_io_out_in_c3b ) );

	 n2_clk_gl_cc_stg_c3b_s1_1 x28  (
		 .gclk_l2t2        (gclk_l2t2 ),
		 .stg3_ncu_clk_stop_in_c3b  (stg3_ncu_clk_stop_in_c3b ),
		 .stg3_sii_io_clk_stop_in_c3b  (stg3_sii_io_clk_stop_in_c3b ),
		 .stg3_ncu_io_clk_stop_in_c3b  (stg3_ncu_io_clk_stop_in_c3b ),
		 .stg3_dmu_io_clk_stop_in_c3b  (stg3_dmu_io_clk_stop_in_c3b ),
		 .stg3_peu_io_clk_stop_in_c3b  (stg3_peu_io_clk_stop_in_c3b ),
		 .stg4_sii_clk_stop_out_c3b  (stg4_sii_clk_stop_out_c3b ),
		 .stg4_ncu_clk_stop_out_c3b  (stg4_ncu_clk_stop_out_c3b ),
		 .stg4_sii_io_clk_stop_out_c3b  (stg4_sii_io_clk_stop_out_c3b ),
		 .stg4_ncu_io_clk_stop_out_c3b  (stg4_ncu_io_clk_stop_out_c3b ),
		 .stg4_dmu_io_clk_stop_out_c3b  (stg4_dmu_io_clk_stop_out_c3b ),
		 .stg4_peu_io_clk_stop_out_c3b  (stg4_peu_io_clk_stop_out_c3b ),
		 .stg3_sii_clk_stop_in_c3b  (stg3_sii_clk_stop_in_c3b ) );

	 n2_clk_gl_cc_stg_c3b_s1_0 x29  (
		 .stg4_l2t2_clk_stop_out_c3b  ({stg4_l2t2_clk_stop_out_c3b } ),
		 .stg3_l2t2_clk_stop_in_c3b  ({stg3_l2t2_clk_stop_in_c3b } ),
		 .stg4_io_out_out_c3b  (stg4_io_out_out_c3b ),
		 .stg4_l2_wmr_out_c3b  (stg4_l2_wmr_out_c3b ),
		 .stg4_l2_por_out_c3b  (stg4_l2_por_out_c3b ),
		 .stg4_dmu_peu_por_out_c3b  (stg4_dmu_peu_por_out_c3b ),
		 .stg4_dmu_peu_wmr_out_c3b  (stg4_dmu_peu_wmr_out_c3b ),
		 .stg4_spc2_clk_stop_out_c3b  (stg4_spc2_clk_stop_out_c3b ),
		 .stg4_db0_clk_stop_out_c3b  (stg4_db0_clk_stop_out_c3b ),
		 .stg4_l2d2_clk_stop_out_c3b  (stg4_l2d2_clk_stop_out_c3b ),
		 .stg4_l2d3_clk_stop_out_c3b  (stg4_l2d3_clk_stop_out_c3b ),
		 .stg4_l2b2_clk_stop_out_c3b  (stg4_l2b2_clk_stop_out_c3b ),
		 .stg4_l2b3_clk_stop_out_c3b  (stg4_l2b3_clk_stop_out_c3b ),
		 .stg3_cmp_io_sync_en_in_c3b  (stg3_cmp_io_sync_en_in_c3b ),
		 .stg3_io_cmp_sync_en_in_c3b  (stg3_io_cmp_sync_en_in_c3b ),
		 .stg3_io_out_in_c3b  (stg3_io_out_in_c3b ),
		 .stg3_l2_wmr_in_c3b  (stg3_l2_wmr_in_c3b ),
		 .stg3_l2_por_in_c3b  (stg3_l2_por_in_c3b ),
		 .stg3_dmu_peu_por_in_c3b  (stg3_dmu_peu_por_in_c3b ),
		 .stg3_dmu_peu_wmr_in_c3b  (stg3_dmu_peu_wmr_in_c3b ),
		 .stg3_spc2_clk_stop_in_c3b  (stg3_spc2_clk_stop_in_c3b ),
		 .stg3_db0_clk_stop_in_c3b  (stg3_db0_clk_stop_in_c3b ),
		 .stg3_l2d2_clk_stop_in_c3b  (stg3_l2d2_clk_stop_in_c3b ),
		 .stg3_l2d3_clk_stop_in_c3b  (stg3_l2d3_clk_stop_in_c3b ),
		 .stg3_l2b2_clk_stop_in_c3b  (stg3_l2b2_clk_stop_in_c3b ),
		 .stg3_l2b3_clk_stop_in_c3b  (stg3_l2b3_clk_stop_in_c3b ),
		 .stg4_io_cmp_sync_en_out_c3b  (stg4_io_cmp_sync_en_out_c3b ),
		 .gclk_spc2        (gclk_spc2 ),
		 .stg4_cmp_io_sync_en_out_c3b  (stg4_cmp_io_sync_en_out_c3b ) );

//     n2_clk_gl_cc_stage_ccu_align xccu_align (
     n2_clk_gl_cc_stage_align xccu_align (
		 .gclk_a          (gclk_a ),
		 .gclk_b          (gclk_b ),
		 .gclk_aligned    (gclk_aligned ),
		 .gclk_c          (gclk_c ),
		 .ccu_vco_aligned (ccu_vco_aligned ) );


	n2_clk_gl_cc_stg_mcu_dr xstg_dr_1 ( // FOR INT6.1
     .stg1_mcu1_dr_clk_stop_in (stg1_mcu0_dr_clk_stop_in_c2b ),
     .stg2_mcu1_dr_clk_stop_out (stg2_mcu0_dr_clk_stop_out_c2b ),
     .dr_gclk         (dr_gclk_fsr7_stg ),
     .stg1_mcu0_dr_clk_stop_in (stg1_mcu1_dr_clk_stop_in_c2b ), 
     .stg2_mcu0_dr_clk_stop_out (stg2_mcu1_dr_clk_stop_out_c2b ));

	n2_clk_gl_cc_stg_mcu_dr xstg_dr_2 ( // FOR INT6.1
     .stg1_mcu1_dr_clk_stop_in (stg2_mcu0_dr_clk_stop_in_c4t ),
     .stg2_mcu1_dr_clk_stop_out (gl_mcu0_dr_clk_stop ),
     .dr_gclk       ( dr_gclk_c4_mcu1 ),   // (dr_gclk_mcu1 ),
     .stg1_mcu0_dr_clk_stop_in (stg2_mcu1_dr_clk_stop_in_c4t ), 
     .stg2_mcu0_dr_clk_stop_out (gl_mcu1_dr_clk_stop ));


	 n2_clk_gl_cc_stage_tcu_m0 x0  (
		 .stg1_peu_io_clk_stop_out_c1b  (stg1_peu_io_clk_stop_out_c1b ),
		 .gl_l2t4_clk_stop  (gl_l2t4_clk_stop ),
		 .tcu_mcu1_clk_stop  (tcu_mcu1_clk_stop ),
		 .gl_ccu_io_clk_stop  (gl_ccu_io_clk_stop ),
		 .gl_sio_clk_stop  (gl_sio_clk_stop ),
		 .gl_sio_io_clk_stop  (gl_sio_io_clk_stop ),
		 .gl_db1_clk_stop  (gl_db1_clk_stop ),
		 .gl_rst_clk_stop  (gl_rst_clk_stop ),
		 .gl_rst_io_clk_stop  (gl_rst_io_clk_stop ),
		 .gl_efu_clk_stop  (gl_efu_clk_stop ),
		 .stg1_l2t3_clk_stop_out_c1b  (stg1_l2t3_clk_stop_out_c1b ),
		 .tcu_l2t5_clk_stop  (tcu_l2t5_clk_stop ),
		 .tcu_l2t7_clk_stop  (tcu_l2t7_clk_stop ),
		 .stg1_ncu_clk_stop_out_c1b  (stg1_ncu_clk_stop_out_c1b ),
		 .gl_mcu2_dr_clk_stop  (gl_mcu2_dr_clk_stop ),
		 .stg1_l2t1_clk_stop_out_c1t  (stg1_l2t1_clk_stop_out_c1t ),
		 .tcu_spc1_clk_stop  (tcu_spc1_clk_stop ),
		 .tcu_sii_clk_stop  (tcu_sii_clk_stop ),
		 .tcu_ncu_io_clk_stop  (tcu_ncu_io_clk_stop ),
		 .tcu_sii_io_clk_stop  (tcu_sii_io_clk_stop ),
		 .tcu_ncu_clk_stop  (tcu_ncu_clk_stop ),
		 .tcu_db0_clk_stop  (tcu_db0_clk_stop ),
		 .gl_l2d6_clk_stop  (gl_l2d6_clk_stop ),
		 .gl_l2t6_clk_stop  (gl_l2t6_clk_stop ),
		 .stg1_l2t7_clk_stop_out_c1b  (stg1_l2t7_clk_stop_out_c1b ),
		 .stg1_sii_io_clk_stop_out_c1b  (stg1_sii_io_clk_stop_out_c1b ),
		 .stg1_l2d0_clk_stop_out_c1t  (stg1_l2d0_clk_stop_out_c1t ),
		 .stg1_ccx_clk_stop_out_c1b  (stg1_ccx_clk_stop_out_c1b ),
		 .stg1_rtx_io_clk_stop_out_c1b  (stg1_rtx_io_clk_stop_out_c1b ),
		 .gclk_in          (gclk_tcu ),
		 .dr_gclk_in		( dr_gclk_stg_tcu), 
		 .tcu_mcu2_io_clk_stop  (tcu_mcu2_io_clk_stop ),
		 .gl_efu_io_clk_stop  (gl_efu_io_clk_stop ),
		 .tcu_mcu0_clk_stop  (tcu_mcu0_clk_stop ),
		 .stg1_mio_clk_stop_out_c1t  (stg1_mio_clk_stop_out_c1t ),
		 .stg1_l2t2_clk_stop_out_c1b  (stg1_l2t2_clk_stop_out_c1b ),
		 .stg1_mcu1_clk_stop_out_c1t  (stg1_mcu1_clk_stop_out_c1t ),
		 .stg1_ncu_io_clk_stop_out_c1b  (stg1_ncu_io_clk_stop_out_c1b ),
		 .tcu_ccu_clk_stop  (tcu_ccu_clk_stop ),
		 .tcu_ccu_io_clk_stop  (tcu_ccu_io_clk_stop ),
		 .tcu_efu_io_clk_stop  (tcu_efu_io_clk_stop ),
		 .tcu_l2b6_clk_stop  (tcu_l2b6_clk_stop ),
		 .tcu_l2t6_clk_stop  (tcu_l2t6_clk_stop ),
		 .tcu_rst_clk_stop  (tcu_rst_clk_stop ),
		 .tcu_rst_io_clk_stop  (tcu_rst_io_clk_stop ),
		 .tcu_efu_clk_stop  (tcu_efu_clk_stop ),
		 .tcu_sio_clk_stop  (tcu_sio_clk_stop ),
		 .tcu_sio_io_clk_stop  (tcu_sio_io_clk_stop ),
		 .tcu_db1_clk_stop  (tcu_db1_clk_stop ),
		 .tcu_peu_io_clk_stop  (tcu_peu_io_clk_stop ),
		 .stg1_db0_clk_stop_out_c1b  (stg1_db0_clk_stop_out_c1b ),
		 .tcu_ccx_clk_stop  (tcu_ccx_clk_stop ),
		 .tcu_spc0_clk_stop  (tcu_spc0_clk_stop ),
		 .tcu_spc2_clk_stop  (tcu_spc2_clk_stop ),
		 .stg1_mcu1_dr_clk_stop_out_c1t  (stg1_mcu1_dr_clk_stop_out_c1t ),
		 .tcu_spc3_clk_stop  (tcu_spc3_clk_stop ),
		 .tcu_spc4_clk_stop  (tcu_spc4_clk_stop ),
		 .tcu_spc5_clk_stop  (tcu_spc5_clk_stop ),
		 .tcu_spc6_clk_stop  (tcu_spc6_clk_stop ),
		 .tcu_spc7_clk_stop  (tcu_spc7_clk_stop ),
		 .tcu_mcu2_clk_stop  (tcu_mcu2_clk_stop ),
		 .tcu_mcu3_io_clk_stop  (tcu_mcu3_io_clk_stop ),
		 .tcu_mcu3_dr_clk_stop  (tcu_mcu3_dr_clk_stop ),
		 .tcu_l2t0_clk_stop  (tcu_l2t0_clk_stop ),
		 .gl_mcu2_clk_stop  (gl_mcu2_clk_stop ),
		 .tcu_l2t3_clk_stop  (tcu_l2t3_clk_stop ),
		 .tcu_l2t2_clk_stop  (tcu_l2t2_clk_stop ),
		 .tcu_l2t1_clk_stop  (tcu_l2t1_clk_stop ),
		 .tcu_l2d0_clk_stop  (tcu_l2d0_clk_stop ),
		 .tcu_l2d1_clk_stop  (tcu_l2d1_clk_stop ),
		 .tcu_l2d2_clk_stop  (tcu_l2d2_clk_stop ),
		 .tcu_l2d3_clk_stop  (tcu_l2d3_clk_stop ),
		 .tcu_l2d4_clk_stop  (tcu_l2d4_clk_stop ),
		 .tcu_l2d5_clk_stop  (tcu_l2d5_clk_stop ),
		 .tcu_l2d7_clk_stop  (tcu_l2d7_clk_stop ),
		 .tcu_l2b0_clk_stop  (tcu_l2b0_clk_stop ),
		 .tcu_l2b1_clk_stop  (tcu_l2b1_clk_stop ),
		 .tcu_l2b2_clk_stop  (tcu_l2b2_clk_stop ),
		 .tcu_l2b3_clk_stop  (tcu_l2b3_clk_stop ),
		 .tcu_l2b4_clk_stop  (tcu_l2b4_clk_stop ),
		 .tcu_l2b5_clk_stop  (tcu_l2b5_clk_stop ),
		 .tcu_mcu0_io_clk_stop  (tcu_mcu0_io_clk_stop ),
		 .tcu_mcu1_io_clk_stop  (tcu_mcu1_io_clk_stop ),
		 .tcu_mcu0_dr_clk_stop  (tcu_mcu0_dr_clk_stop ),
		 .tcu_mcu1_dr_clk_stop  (tcu_mcu1_dr_clk_stop ),
		 .gl_ccu_clk_stop  (gl_ccu_clk_stop ),
		 .stg1_spc1_clk_stop_out_c1t  (stg1_spc1_clk_stop_out_c1t ),
		 .tcu_mac_io_clk_stop  (tcu_mac_io_clk_stop ),
		 .tcu_tds_io_clk_stop  (tcu_tds_io_clk_stop ),
		 .tcu_rtx_io_clk_stop  (tcu_rtx_io_clk_stop ),
		 .tcu_rdp_io_clk_stop  (tcu_rdp_io_clk_stop ),
		 .stg1_spc2_clk_stop_out_c1b  (stg1_spc2_clk_stop_out_c1b ),
		 .gl_l2b6_clk_stop  (gl_l2b6_clk_stop ),
		 .stg1_spc3_clk_stop_out_c1b  (stg1_spc3_clk_stop_out_c1b ),
		 .stg1_spc4_clk_stop_out_c1t  (stg1_spc4_clk_stop_out_c1t ),
		 .stg1_spc5_clk_stop_out_c1t  (stg1_spc5_clk_stop_out_c1t ),
		 .gl_l2b7_clk_stop  (gl_l2b7_clk_stop ),
		 .gl_mcu3_clk_stop  (gl_mcu3_clk_stop ),
		 .tcu_mcu3_clk_stop  (tcu_mcu3_clk_stop ),
		 .tcu_l2b7_clk_stop  (tcu_l2b7_clk_stop ),
		 .tcu_l2d6_clk_stop  (tcu_l2d6_clk_stop ),
		 .tcu_l2t4_clk_stop  (tcu_l2t4_clk_stop ),
		 .stg1_spc6_clk_stop_out_c1b  (stg1_spc6_clk_stop_out_c1b ),
		 .stg1_spc7_clk_stop_out_c1b  (stg1_spc7_clk_stop_out_c1b ),
		 .stg1_l2t0_clk_stop_out_c1t  (stg1_l2t0_clk_stop_out_c1t ),
		 .tcu_dmu_io_clk_stop  (tcu_dmu_io_clk_stop ),
		 .stg1_l2t5_clk_stop_out_c1t  (stg1_l2t5_clk_stop_out_c1t ),
		 .stg1_l2d1_clk_stop_out_c1t  (stg1_l2d1_clk_stop_out_c1t ),
		 .stg1_l2d2_clk_stop_out_c1b  (stg1_l2d2_clk_stop_out_c1b ),
		 .stg1_l2d3_clk_stop_out_c1b  (stg1_l2d3_clk_stop_out_c1b ),
		 .stg1_l2d4_clk_stop_out_c1t  (stg1_l2d4_clk_stop_out_c1t ),
		 .stg1_l2d5_clk_stop_out_c1t  (stg1_l2d5_clk_stop_out_c1t ),
		 .stg1_l2d7_clk_stop_out_c1b  (stg1_l2d7_clk_stop_out_c1b ),
		 .stg1_l2b0_clk_stop_out_c1t  (stg1_l2b0_clk_stop_out_c1t ),
		 .stg1_sii_clk_stop_out_c1b  (stg1_sii_clk_stop_out_c1b ),
		 .stg1_l2b1_clk_stop_out_c1t  (stg1_l2b1_clk_stop_out_c1t ),
		 .stg1_l2b2_clk_stop_out_c1b  (stg1_l2b2_clk_stop_out_c1b ),
		 .stg1_l2b3_clk_stop_out_c1b  (stg1_l2b3_clk_stop_out_c1b ),
		 .stg1_l2b4_clk_stop_out_c1t  (stg1_l2b4_clk_stop_out_c1t ),
		 .stg1_l2b5_clk_stop_out_c1t  (stg1_l2b5_clk_stop_out_c1t ),
		 .stg1_mcu0_clk_stop_out_c1t  (stg1_mcu0_clk_stop_out_c1t ),
		 .stg1_spc0_clk_stop_out_c1t  (stg1_spc0_clk_stop_out_c1t ),
		 .stg1_mcu1_io_clk_stop_out_c1t  (stg1_mcu1_io_clk_stop_out_c1t ),
		 .stg1_mcu0_dr_clk_stop_out_c1t  (stg1_mcu0_dr_clk_stop_out_c1t ),
		 .stg1_rdp_io_clk_stop_out_c1b  (stg1_rdp_io_clk_stop_out_c1b ),
		 .stg1_tds_io_clk_stop_out_c1b  (stg1_tds_io_clk_stop_out_c1b ),
		 .stg1_mac_io_clk_stop_out_c1b  (stg1_mac_io_clk_stop_out_c1b ),
		 .stg1_dmu_io_clk_stop_out_c1b  (stg1_dmu_io_clk_stop_out_c1b ),
		 .stg1_mcu0_io_clk_stop_out_c1t  (stg1_mcu0_io_clk_stop_out_c1t ),
		 .tcu_mio_clk_stop  (tcu_mio_clk_stop ),
		 .gl_mcu2_io_clk_stop  (gl_mcu2_io_clk_stop ),
		 .tcu_mcu2_dr_clk_stop  (tcu_mcu2_dr_clk_stop ),
		 .gl_mcu3_io_clk_stop  (gl_mcu3_io_clk_stop ),
		 .gl_mcu3_dr_clk_stop  (gl_mcu3_dr_clk_stop ) );

//	 n2_clk_gl_cc_stage_ccu_m0 x1  (
	 n2_clk_gl_exp x1  (
		 .gclk_in          (gclk_ccu ),
		 .gl_cmp_io_sync_en_c1m  (gl_cmp_io_sync_en_c1m ),
		 .gl_io_out_c1m    (gl_io_out_c1m ),
		 .gl_io_cmp_sync_en_c1m  (gl_io_cmp_sync_en_c1m ),
		 .stg1_io2x_out_out_c1b  (stg1_io2x_out_out_c1b ),
		 .gl_io2x_sync_en_c1m  (gl_io2x_sync_en_c1m ),
		 .ccu_cmp_io_sync_en  (ccu_cmp_io_sync_en ),
		 .ccu_io_out       (ccu_io_out ),
		 .stg1_dr_sync_en_out_c1t  (stg1_dr_sync_en_out_c1t ),
		 .stg1_io2x_sync_en_out_c1b  (stg1_io2x_sync_en_out_c1b ),
		 .stg1_cmp_io_sync_en_out_c1t  (stg1_cmp_io_sync_en_out_c1t ),
		 .stg1_io_cmp_sync_en_out_c1t  (stg1_io_cmp_sync_en_out_c1t ),
		 .stg1_io2x_sync_en_out_c1t  (stg1_io2x_sync_en_out_c1t ),
		 .ccu_io2x_sync_en  (ccu_io2x_sync_en ),
		 .gl_dr_sync_en_c1m  (gl_dr_sync_en_c1m ),
		 .stg1_cmp_io_sync_en_out_c1b  (stg1_cmp_io_sync_en_out_c1b ),
		 .stg1_io_out_out_c1t  (stg1_io_out_out_c1t ),
		 .stg1_io_out_out_c1b  (stg1_io_out_out_c1b ),
		 .stg1_io_cmp_sync_en_out_c1b  (stg1_io_cmp_sync_en_out_c1b ),
		 .ccu_io_cmp_sync_en  (ccu_io_cmp_sync_en ),
		 .ccu_dr_sync_en   (ccu_dr_sync_en ),
		 .ccu_io2x_out     (ccu_io2x_out ) );


// temporarily grounded
//assign stg4_io2x_sync_en_c3t  = 1'b0;//lijuan

endmodule

