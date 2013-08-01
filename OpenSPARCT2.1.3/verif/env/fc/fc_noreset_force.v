// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_noreset_force.v
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
initial
        begin
  force `CPU.tcu_ncu_vld = 1'b0;
  force `CPU.tcu_ncu_stall = 1'b0;
  force `CPU.rst_ncu_vld = 1'b0;
  force `CPU.rst_ncu_stall = 1'b0;
  force `CPU.rst_ncu_xir_  =1'b1;

  force `CPU.ccu_ncu_vld = 1'b0;
  force `CPU.ccu_ncu_stall = 1'b0;

        force TRST_L = 1'b0;
        force PWRON_RST_L = 1'b1;
        force `TCU.ncu_tcu_bank_avail[7:0] = 8'b11111111;
        force `CPU.sio.niu_sio_dq = 1'b0;
        force `CPU.niu_ncu_vld = 1'b0;
        force `CPU.niu_ncu_stall = 1'b0;
        force `CPU.ncu.iol2clk = 0;
        force `CPU.ncu.cmp_io_sync_en  = 0;
        force `CPU.ncu.io_cmp_sync_en  = 0;

        force `CPU.ncu.aclk_cmp  = 0;
        force `CPU.ncu.aclk_io  = 0;
        force `CPU.ncu.bclk_cmp  = 0;
        force `CPU.ncu.bclk_io  = 0;

        force `CPU.tcu_spc0_scan_en = 1'b0;
        force `CPU.tcu_spc1_scan_en = 1'b0;
        force `CPU.tcu_spc2_scan_en = 1'b0;
        force `CPU.tcu_spc3_scan_en = 1'b0;
        force `CPU.tcu_spc4_scan_en = 1'b0;
        force `CPU.tcu_spc5_scan_en = 1'b0;
        force `CPU.tcu_spc6_scan_en = 1'b0;
        force `CPU.tcu_spc7_scan_en = 1'b0;

        force `CPU.tcu_spc0_aclk = 1'b0;
        force `CPU.tcu_spc1_aclk = 1'b0;
        force `CPU.tcu_spc2_aclk = 1'b0;
        force `CPU.tcu_spc3_aclk = 1'b0;
        force `CPU.tcu_spc4_aclk = 1'b0;
        force `CPU.tcu_spc5_aclk = 1'b0;
        force `CPU.tcu_spc6_aclk = 1'b0;
        force `CPU.tcu_spc7_aclk = 1'b0;
        force `CPU.tcu_spc0_bclk = 1'b0;
        force `CPU.tcu_spc1_bclk = 1'b0;
        force `CPU.tcu_spc2_bclk = 1'b0;
        force `CPU.tcu_spc3_bclk = 1'b0;
        force `CPU.tcu_spc4_bclk = 1'b0;
        force `CPU.tcu_spc5_bclk = 1'b0;
        force `CPU.tcu_spc6_bclk = 1'b0;
        force `CPU.tcu_spc7_bclk = 1'b0;

        force `CPU.tcu_spc0_clk_stop = 1'b0;
        force `CPU.tcu_spc1_clk_stop = 1'b0;
        force `CPU.tcu_spc2_clk_stop = 1'b0;
        force `CPU.tcu_spc3_clk_stop = 1'b0;
        force `CPU.tcu_spc4_clk_stop = 1'b0;
        force `CPU.tcu_spc5_clk_stop = 1'b0;
        force `CPU.tcu_spc6_clk_stop = 1'b0;
        force `CPU.tcu_spc7_clk_stop = 1'b0;

       force `CPU.ccx.gl_ccx_clk_stop_left = 0;
       force `CPU.ccx.gl_ccx_clk_stop_right = 0;

        force `CPU.tcu_spc0_se_scancollar_in = 1'b0;
        force `CPU.tcu_spc1_se_scancollar_in = 1'b0;
        force `CPU.tcu_spc2_se_scancollar_in = 1'b0;
        force `CPU.tcu_spc3_se_scancollar_in = 1'b0;
        force `CPU.tcu_spc4_se_scancollar_in = 1'b0;
        force `CPU.tcu_spc5_se_scancollar_in = 1'b0;
        force `CPU.tcu_spc6_se_scancollar_in = 1'b0;
        force `CPU.tcu_spc7_se_scancollar_in = 1'b0;

        force `CPU.tcu_spc0_se_scancollar_out = 1'b0;
        force `CPU.tcu_spc1_se_scancollar_out = 1'b0;
        force `CPU.tcu_spc2_se_scancollar_out = 1'b0;
        force `CPU.tcu_spc3_se_scancollar_out = 1'b0;
        force `CPU.tcu_spc4_se_scancollar_out = 1'b0;
        force `CPU.tcu_spc5_se_scancollar_out = 1'b0;
        force `CPU.tcu_spc6_se_scancollar_out = 1'b0;
        force `CPU.tcu_spc7_se_scancollar_out = 1'b0;

        force `CPU.tcu_spc0_array_wr_inhibit = 1'b0;
        force `CPU.tcu_spc1_array_wr_inhibit = 1'b0;
        force `CPU.tcu_spc2_array_wr_inhibit = 1'b0;
        force `CPU.tcu_spc3_array_wr_inhibit = 1'b0;
        force `CPU.tcu_spc4_array_wr_inhibit = 1'b0;
        force `CPU.tcu_spc5_array_wr_inhibit = 1'b0;
        force `CPU.tcu_spc6_array_wr_inhibit = 1'b0;
        force `CPU.tcu_spc7_array_wr_inhibit = 1'b0;

        force `CPU.tcu_spc0_shscan_clk_stop = 1'b0;
        force `CPU.tcu_spc1_shscan_clk_stop = 1'b0;
        force `CPU.tcu_spc2_shscan_clk_stop = 1'b0;
        force `CPU.tcu_spc3_shscan_clk_stop = 1'b0;
        force `CPU.tcu_spc4_shscan_clk_stop = 1'b0;
        force `CPU.tcu_spc5_shscan_clk_stop = 1'b0;
        force `CPU.tcu_spc6_shscan_clk_stop = 1'b0;
        force `CPU.tcu_spc7_shscan_clk_stop = 1'b0;

        force `CPU.tcu_spc0_mbist_scan_in = 1'b0;
        force `CPU.tcu_spc1_mbist_scan_in = 1'b0;
        force `CPU.tcu_spc2_mbist_scan_in = 1'b0;
        force `CPU.tcu_spc3_mbist_scan_in = 1'b0;
        force `CPU.tcu_spc4_mbist_scan_in = 1'b0;
        force `CPU.tcu_spc5_mbist_scan_in = 1'b0;
        force `CPU.tcu_spc6_mbist_scan_in = 1'b0;
        force `CPU.tcu_spc7_mbist_scan_in = 1'b0;

        force `CPU.tcu_l2t0_shscan_clk_stop = 1'b0;
        force `CPU.tcu_l2t1_shscan_clk_stop = 1'b0;
        force `CPU.tcu_l2t2_shscan_clk_stop = 1'b0;
        force `CPU.tcu_l2t3_shscan_clk_stop = 1'b0;
        force `CPU.tcu_l2t4_shscan_clk_stop = 1'b0;
        force `CPU.tcu_l2t5_shscan_clk_stop = 1'b0;
        force `CPU.tcu_l2t6_shscan_clk_stop = 1'b0;
        force `CPU.tcu_l2t7_shscan_clk_stop = 1'b0;


        force `CPU.tcu_spc_mbist_start = 24'b0;
        force `CPU.tcu_spc_lbist_start = 8'b0;
        force `CPU.tcu_sio_mbist_start = 2'b0;
        force `CPU.tcu_sii_mbist_start = 2'b0;
        force `CPU.tcu_ncu_mbist_start = 2'b0;
        force `CPU.tcu_mcu0_mbist_start = 1'b0;
        force `CPU.tcu_mcu1_mbist_start = 1'b0;
        force `CPU.tcu_mcu2_mbist_start = 1'b0;
        force `CPU.tcu_mcu3_mbist_start = 1'b0;
        force `CPU.tcu_l2b0_mbist_start = 1'b0;
        force `CPU.tcu_l2b1_mbist_start = 1'b0;
        force `CPU.tcu_l2b2_mbist_start = 1'b0;
        force `CPU.tcu_l2b3_mbist_start = 1'b0;
        force `CPU.tcu_l2b4_mbist_start = 1'b0;
        force `CPU.tcu_l2b5_mbist_start = 1'b0;
        force `CPU.tcu_l2b6_mbist_start = 1'b0;
        force `CPU.tcu_l2b7_mbist_start = 1'b0;
        force `CPU.tcu_l2t0_mbist_start = 3'b0;
        force `CPU.tcu_l2t1_mbist_start = 3'b0;
        force `CPU.tcu_l2t2_mbist_start = 3'b0;
        force `CPU.tcu_l2t3_mbist_start = 3'b0;
        force `CPU.tcu_l2t4_mbist_start = 3'b0;
        force `CPU.tcu_l2t5_mbist_start = 3'b0;
        force `CPU.tcu_l2t6_mbist_start = 3'b0;
        force `CPU.tcu_l2t7_mbist_start = 3'b0;
        force `CPU.tcu_dmu_mbist_start = 2'b0;
        force `CPU.tcu_peu_mbist_start = 1'b0;

        force `CPU.tcu_l2d0_clk_stop = 1'b0;
        force `CPU.tcu_l2d1_clk_stop = 1'b0;
        force `CPU.tcu_l2d2_clk_stop = 1'b0;
        force `CPU.tcu_l2d3_clk_stop = 1'b0;
        force `CPU.tcu_l2d4_clk_stop = 1'b0;
        force `CPU.tcu_l2d5_clk_stop = 1'b0;
        force `CPU.tcu_l2d6_clk_stop = 1'b0;
        force `CPU.tcu_l2d7_clk_stop = 1'b0;

        force `CPU.tcu_l2t0_clk_stop = 1'b0;
        force `CPU.tcu_l2t1_clk_stop = 1'b0;
        force `CPU.tcu_l2t2_clk_stop = 1'b0;
        force `CPU.tcu_l2t3_clk_stop = 1'b0;
        force `CPU.tcu_l2t4_clk_stop = 1'b0;
        force `CPU.tcu_l2t5_clk_stop = 1'b0;
        force `CPU.tcu_l2t6_clk_stop = 1'b0;
        force `CPU.tcu_l2t7_clk_stop = 1'b0;

        force `CPU.tcu_l2b0_clk_stop = 1'b0;
        force `CPU.tcu_l2b1_clk_stop = 1'b0;
        force `CPU.tcu_l2b2_clk_stop = 1'b0;
        force `CPU.tcu_l2b3_clk_stop = 1'b0;
        force `CPU.tcu_l2b4_clk_stop = 1'b0;
        force `CPU.tcu_l2b5_clk_stop = 1'b0;
        force `CPU.tcu_l2b6_clk_stop = 1'b0;
        force `CPU.tcu_l2b7_clk_stop = 1'b0;

        force `CPU.tcu_mbist_user_mode = 1'b0;

        force `CPU.tcu_mcu0_clk_stop = 1'b0;
        force `CPU.tcu_mcu1_clk_stop = 1'b0;
        force `CPU.tcu_mcu2_clk_stop = 1'b0;
        force `CPU.tcu_mcu3_clk_stop = 1'b0;


        force `CPU.tcu_mcu0_dr_clk_stop = 1'b0;
        force `CPU.tcu_mcu1_dr_clk_stop = 1'b0;
        force `CPU.tcu_mcu2_dr_clk_stop = 1'b0;
        force `CPU.tcu_mcu3_dr_clk_stop = 1'b0;

        force `CPU.tcu_mcu0_io_clk_stop = 1'b0;
        force `CPU.tcu_mcu1_io_clk_stop = 1'b0;
        force `CPU.tcu_mcu2_io_clk_stop = 1'b0;
        force `CPU.tcu_mcu3_io_clk_stop = 1'b0;

        force `CPU.tcu_ccx_clk_stop = 1'b0;
        force `CPU.tcu_sii_clk_stop = 1'b0;
        force `CPU.tcu_sii_io_clk_stop = 1'b0;
        force `CPU.tcu_sio_io_clk_stop = 1'b0;
        force `CPU.tcu_sio_clk_stop = 1'b0;
        force `CPU.tcu_ncu_clk_stop = 1'b0;
        force `CPU.tcu_ncu_io_clk_stop = 1'b0;
        force `CPU.tcu_efu_io_clk_stop = 1'b0;
        force `CPU.tcu_rst_clk_stop = 1'b0;
        force `CPU.tcu_rst_io_clk_stop = 1'b0;
        force `CPU.tcu_rst_dr_clk_stop = 1'b0;
        force `CPU.tcu_dmu_io_clk_stop = 1'b0;
        force `CPU.tcu_rdp_io_clk_stop = 1'b0;
        force `CPU.tcu_mac_io_clk_stop = 1'b0;
`ifndef FC_NO_NIU_T2
        force `RTX.tcu_rtx_io_clk_stop = 1'b0;
`endif
        force `CPU.tcu_tds_io_clk_stop = 1'b0;
        force `CPU.tcu_peu_io_clk_stop = 1'b0;
        force `CPU.tcu_mio_clk_stop = 1'b0;
        force `CPU.tcu_db0_clk_stop = 1'b0;
        force `CPU.tcu_db1_clk_stop = 1'b0;
        force `CPU.tcu_spc_lbist_scan_in = 8'b0;

        force `CPU.tcu_spc_lbist_pgm = 1'b0;
        force `CPU.tcu_spc_test_mode = 1'b0;
        force `CPU.tcu.io_test_mode = 1'b0;
        force `CPU.tcu_ss_mode = 8'b0;
        force `CPU.tcu_do_mode = 8'b0;
        force `CPU.tcu_ss_request = 8'b0;
        force `CPU.tcu_div_bypass = 1'b0;

        force `CPU.tcu_dectest = 1'b1;
        force `CPU.tcu_muxtest = 1'b1;
        force `CPU.rst_wmr_protect = 1'b0;
        force `CPU.tcu_pce_ov = 1'b0;
        force `CPU.tcu_mbist_bisi_en = 1'b0;
        force `CPU.tcu_mbist_user_mode = 1'b0;
        force `CPU.tcu_spc_shscan_pce_ov = 1'b0;
        force `CPU.tcu_spc_shscan_aclk = 1'b0;
        force `CPU.tcu_spc_shscan_bclk = 1'b0;
        force `CPU.tcu_spc_shscan_scan_en = 1'b0;
        force `CPU.tcu_array_wr_inhibit = 1'b0;
        force `CPU.tcu_array_bypass = 1'b0;
        force `CPU.tcu_scan_en = 1'b0;
        force `CPU.tcu_aclk = 1'b0;
        force `CPU.tcu_bclk = 1'b0;
        force `CPU.tcu_se_scancollar_in = 1'b0;
        force `CPU.tcu_se_scancollar_out = 1'b0;
        force `CPU.tcu_sii_vld = 1'b0;

        force `CPU.mio.niu_mio_debug_data   = 32'b0;

        force `CPU.tcu_dmu_io_clk_stop  = 1'b0;
        force `CPU.tcu_peu_io_clk_stop  = 1'b0;
        force `CPU.tcu_peu_pc_clk_stop  = 1'b0;

        force `CPU.rst_dmu_peu_por_     = 1'b0;
        force `CPU.rst_dmu_peu_wmr_     = 1'b0;
        `ifdef AXIS #1 `endif force `CPU.rst_ccu_pll_ = 1'b0;
        force `CPU.rst_mio_pex_reset_l = 1'b0;

        force `CPU.ccx.scan_in = 0;
        force `CPU.tcu_ccu_clk_stop = 0;
        force `CPU.tcu_ccu_io_clk_stop = 0;

`ifdef GATESIM
        force `CPU.ccx.cpx__bfg5_scanout = 1'b0;
`else
        force `CPU.ccx.cpx.cpx_dpa_scanin = 1'b0;
`endif
        force `CPU.ccx.tcu_pce_ov = 0;
        force `CPU.ccx.tcu_aclk = 0;
        force `CPU.ccx.tcu_bclk = 0;

        force `CPU.ncu.mio_ncu_ext_int_l = 1'b1;

        force `CPU.ncu_spc_ba01 = 1'b1;
        force `CPU.ncu_spc_ba23 = 1'b1;
        force `CPU.ncu_spc_ba45 = 1'b1;
        force `CPU.ncu_spc_ba67 = 1'b1;
        force `CPU.ncu_spc_pm = 1'b0;
        force `CPU.ncu_l2t_ba01 = 1'b1;
        force `CPU.ncu_l2t_ba23 = 1'b1;
        force `CPU.ncu_l2t_ba45 = 1'b1;
        force `CPU.ncu_l2t_ba67 = 1'b1;
        force `CPU.ncu_l2t_pm = 1'b0;
        force `CPU.ncu_sii_ba01 = 1'b1;
        force `CPU.ncu_sii_ba23 = 1'b1;
        force `CPU.ncu_sii_ba45 = 1'b1;
        force `CPU.ncu_sii_ba67 = 1'b1;
        force `CPU.ncu_sii_pm = 1'b0;
        force `CPU.ncu_mcu_ba01 = 1'b1;
        force `CPU.ncu_mcu_ba23 = 1'b1;
        force `CPU.ncu_mcu_ba45 = 1'b1;
        force `CPU.ncu_mcu_ba67 = 1'b1;
        force `CPU.ncu_mcu_pm = 1'b0;
        force `CPU.ncu_sii_ba01 = 1'b1;
        force `CPU.ncu_sii_ba23 = 1'b1;
        force `CPU.ncu_sii_ba45 = 1'b1;
        force `CPU.ncu_sii_ba67 = 1'b1;
        force `CPU.ncu_sii_pm = 1'b0;
        force `CPU.ncu_mcu_ba01 = 1'b1;
        force `CPU.ncu_mcu_ba23 = 1'b1;
        force `CPU.ncu_mcu_ba45 = 1'b1;
        force `CPU.ncu_mcu_ba67 = 1'b1;
        force `CPU.ncu_mcu_pm = 1'b0;

        force `CPU.rst_ccu_ = 1; // changed from rst_por_ Mar31'05.

        force `TCU.io_test_mode = 0;

`ifdef GATESIM
        force `CPU.ccx.cpx__bfg5_scanout = 1'b0;
`else
        force `CPU.ccx.cpx.cpx_dpa_scanin = 1'b0;
`endif
        force `CPU.tcu.tcu_soc0_scan_out = 0;
        force `CPU.tcu.tcu_soc1_scan_out = 0;
        force `CPU.tcu.tcu_soc2_scan_out = 0;
        force `CPU.tcu.tcu_soc3_scan_out = 0;
        force `CPU.tcu.tcu_soc4_scan_out = 0;
        force `CPU.tcu.tcu_soc5_scan_out = 0;
        force `CPU.tcu.tcu_soc6_scan_out = 0;


        force `CPU.rst_mcu_selfrsh = 0;

        force `CPU.mcu0.scan_in = 1'b0 ;
        force `CPU.mcu1.scan_in = 1'b0 ;
        force `CPU.mcu2.scan_in = 1'b0 ;
        force `CPU.mcu3.scan_in = 1'b0 ;

`ifndef FC_NO_NIU_T2
        force `TDS.rst_por_ = ~niu_reset;
        force `RTX.rst_por_ = ~niu_reset;
        force `MAC.gl_mac_   = ~niu_reset;
        force `RDP.rst_por_  = ~niu_reset;


  force `RDP.cluster_arst_l               = 1'b1;
  force `RTX.cluster_arst_l               = 1'b1;
  force `TDS.cluster_arst_l               = 1'b1;
  force `MAC.cluster_arst_l               = 1'b1;
`endif

        repeat (20) @(posedge core_clk);
      force `CPU.rst_l2_por_          = 1'b1;
        release `CPU.ncu.iol2clk ;
        release `CPU.ncu.cmp_io_sync_en ;
        release `CPU.ncu.io_cmp_sync_en ;
        release `CPU.sio.niu_sio_dq;
        release `CPU.niu_ncu_vld;
        release  `CPU.niu_ncu_stall;


      repeat (20) @(posedge core_clk);
      force `CPU.rst_l2_wmr_          = 1'b1;

      force `CPU.rst_ccu_pll_ = 1'b1;
      force `CPU.rst_mio_pex_reset_l = 1'b1;

`ifdef GATESIM
      repeat (88) @(posedge `PEU.ca0_l1clkhdr__pcl2clk__col_0__vdd__tcu_scan_en__grp_2_3__l1clk);
`else
      repeat (88) @ (posedge `PEU.pcl1clk);
`endif
      force `CPU.rst_dmu_peu_wmr_     = 1'b1;

     end



