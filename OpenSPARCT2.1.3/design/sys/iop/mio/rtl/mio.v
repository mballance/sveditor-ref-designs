// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mio.v
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
module mio (
  cluster_arst_l,
  ccu_io_out, 
  tcu_div_bypass, 
  tcu_atpg_mode,
  ccu_mio_serdes_dtm, 
  io_burnin,
  sel59,
  sel60,
  sel61,
  ro_in,
`ifndef FC_NO_NIU_T2
  XAUI_MDINT0_L,
  XAUI_MDINT1_L,
  XAUI0_ACT_LED, 
  XAUI0_LINK_LED, 
  XAUI1_ACT_LED, 
  XAUI1_LINK_LED, 
  XAUI_MDC, 
  XAUI_MDIO, 
  xaui_act_led_0, 
  xaui_link_led_0, 
  xaui_act_led_1, 
  xaui_link_led_1, 
  mdc, 
  mdoe, 
  mdi, 
  mio_mac_xaui_mdint0_l,
  mio_mac_xaui_mdint1_l,
`endif
  TCK, 
  TDI, 
  TDO, 
  TMS, 
  TRST_L, 
  TESTMODE, 
  STCIQ, 
  STCID, 
  STCICFG, 
  STCICLK, 
  TESTCLKT, 
  TESTCLKR, 
  VDDO_PCM,
  DIVIDER_BYPASS, 
  PLL_CMP_BYPASS, 
  mio_tcu_tck, 
  mio_tcu_tdi, 
  tcu_mio_tdo, 
  mio_tcu_tms, 
  mio_tcu_trst_l, 
  mio_tcu_testmode, 
  tcu_mio_tdo_en, 
  tcu_mio_stciq, 
  mio_tcu_stcid, 
  mio_tcu_stcicfg, 
  mio_tcu_stciclk, 
  mio_fsr_testclkt, 
  mio_psr_testclkt, 
  mio_esr_testclkt, 
  mio_fsr_testclkr, 
  mio_psr_testclkr, 
  mio_esr_testclkr, 
  mio_tcu_divider_bypass, 
  mio_tcu_pll_cmp_bypass, 
  DBG_DQ, 
  DBG_CK0, 
  TRIGIN, 
  TRIGOUT, 
  mio_tcu_scan_in31, 
  tcu_mio_scan_out31, 
  niu_mio_debug_data, 
  niu_mio_debug_clock, 
  dbg0_mio_debug_bus_a, 
  dbg0_mio_debug_bus_b, 
  peu_mio_debug_bus_a, 
  peu_mio_debug_bus_b, 
  peu_mio_pipe_txdata, 
  peu_mio_pipe_txdatak, 
  peu_mio_debug_clk, 
  mio_pll_testmode, 
  mio_ccu_pll_char_in, 
  mio_ccu_pll_div2, 
  mio_ccu_pll_trst_l, 
  mio_ccu_pll_clamp_fltr, 
  mio_ccu_pll_div4, 
  mio_ext_dr_clk, 
  mio_ext_cmp_clk, 
  ccu_mio_pll_char_out, 
  mio_ccu_vreg_selbg_l, 
  mio_tcu_io_ac_testmode, 
  mio_tcu_io_ac_testtrig, 
  mio_tcu_io_aclk, 
  mio_tcu_io_bclk, 
  mio_tcu_io_scan_in, 
  mio_tcu_peu_clk_ext, 
  mio_tcu_niu_clk_ext, 
  mio_tcu_io_scan_en, 
  tcu_mio_pins_scan_out, 
  tcu_mio_dmo_data, 
  tcu_mio_mbist_done, 
  tcu_mio_mbist_fail, 
  tcu_mio_dmo_sync, 
  dbg1_mio_dbg_dq, 
  mio_tcu_trigin, 
  tcu_mio_trigout, 
  dbg1_mio_drv_en_op_only, 
  dbg1_mio_drv_en_muxtest_inp, 
  dbg1_mio_drv_en_muxtestpll_inp, 
  dbg1_mio_drv_en_muxtest_op, 
  dbg1_mio_drv_en_muxbist_op, 
  PMI, 
  PMO, 
  PGRM_EN, 
  BURNIN, 
  PEX_RESET_L, 
  PB_RST_L, 
  BUTTON_XIR_L, 
  PWRON_RST_L, 
  SSI_MOSI, 
  SSI_MISO, 
  SSI_SCK, 
  SSI_EXT_INT_L, 
  SSI_SYNC_L, 
  VREG_SELBG_L, 
  PLL_CHAR_OUT, 
  PLL_TESTMODE, 
  PWR_THRTTL_0, 
  PWR_THRTTL_1, 
  mio_efu_prgm_en, 
  rst_mio_pex_reset_l, 
  rst_mio_rst_state, 
  mio_rst_pb_rst_l, 
  mio_rst_button_xir_l, 
  mio_rst_pwron_rst_l, 
  ncu_mio_ssi_mosi, 
  mio_ncu_ssi_miso, 
  ncu_mio_ssi_sck, 
  mio_ncu_ext_int_l, 
  rst_mio_ssi_sync_l, 
  mio_spc_pwr_throttle_0, 
  mio_spc_pwr_throttle_1, 
  gclk_0, 
  gclk_1, 
  gclk_2, 
  gclk_3, 
  tcu_mio_jtag_membist_mode, 
  dbg1_mio_sel_niu_debug_mode, 
  dbg1_mio_sel_pcix_debug_mode, 
  dbg1_mio_sel_soc_obs_mode, 
  dbg1_mio_drv_imped, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  scan_in, 
  scan_out, 
  gl_mio_clk_stop_c3,
  gl_mio_clk_stop_c2_left,
  gl_mio_clk_stop_c2_right,
  gl_mio_clk_stop_c1,
  gl_mio_io2x_sync_en_c3,
  gl_mio_io2x_sync_en_c2_left,
  gl_mio_io2x_sync_en_c2_right,
  gl_mio_io2x_sync_en_c1,
  tcu_mio_bs_scan_in, 
  tcu_mio_bs_highz_l, 
  mio_tcu_bs_scan_out, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  tcu_mio_bs_mode_ctl);

wire ncu_mio_ssi_mosi_r;
wire ncu_mio_ssi_sck_r;
wire mio_ncu_ssi_miso_pin;
wire cell_193_scanin;
wire cell_193_scanout;
wire cell_23_bscan_in;
wire cell_23_bscan_out;
wire cell_23_scanin;
wire cell_23_scanout;
wire l2clk_0;
wire aclk;
wire bclk;
wire mio_clk_header_cmp_clk_0_scan_out;
wire ce_ovrd;
wire cmp_io2x_sync_en_out_0;
wire mio_clk_header_cmp_clk_0_scan_in;
wire l2clk_1;
wire mio_clk_header_cmp_clk_1_scan_out;
wire mio_clk_header_cmp_clk_1_scan_in;
wire cmp_io2x_sync_en_out_1;
wire l2clk_2;
wire mio_clk_header_cmp_clk_2_scan_out;
wire mio_clk_header_cmp_clk_2_scan_in;
wire cmp_io2x_sync_en_out_2;
wire l2clk_3;
wire mio_clk_header_cmp_clk_3_scan_out;
wire mio_clk_header_cmp_clk_3_scan_in;
wire cmp_io2x_sync_en_out_3;
wire iol2clk;
wire mio_clk_header_iol2clk_scan_out;
wire mio_clk_header_iol2clk_scan_in;
wire io2xsyncen_reg3_scanin;
wire io2xsyncen_reg3_scanout;
wire cmp_io2x_sync_en_fnl_3;
wire io2xsyncen_reg2_scanin;
wire io2xsyncen_reg2_scanout;
wire cmp_io2x_sync_en_fnl_2;
wire io2xsyncen_reg1_scanin;
wire io2xsyncen_reg1_scanout;
wire cmp_io2x_sync_en_fnl_1;
wire io2xsyncen_reg0_scanin;
wire io2xsyncen_reg0_scanout;
wire cmp_io2x_sync_en_fnl_0;
wire muxsel_scanin;
wire muxsel_scanout;
wire cell_6_bscan_in;
wire cell_6_bscan_out;
wire cell_6_scanin;
wire cell_6_scanout;
wire cell_211_bscan_in;
wire cell_211_bscan_out;
wire cell_211_scanin;
wire cell_211_scanout;
wire cell_18_bscan_in;
wire cell_18_bscan_out;
wire cell_18_scanin;
wire cell_18_scanout;
wire cell_17_bscan_in;
wire cell_17_bscan_out;
wire cell_17_scanin;
wire cell_17_scanout;
wire cell_210_bscan_in;
wire cell_210_bscan_out;
wire cell_210_scanin;
wire cell_210_scanout;
wire cell_209_bscan_in;
wire cell_209_bscan_out;
wire cell_209_scanin;
wire cell_209_scanout;
wire cell_203_bscan_in;
wire cell_203_bscan_out;
wire cell_202_bscan_in;
wire cell_202_bscan_out;
wire cell_202_scanin;
wire cell_202_scanout;
wire cell_201_bscan_in;
wire cell_201_bscan_out;
wire cell_200_bscan_in;
wire cell_200_bscan_out;
wire cell_199_bscan_in;
wire cell_199_bscan_out;
wire cell_198_bscan_in;
wire cell_198_bscan_out;
wire mio_testclkt;
wire cell_197_bscan_in;
wire cell_197_bscan_out;
wire mio_testclkr;
wire cell_196_bscan_in;
wire cell_196_bscan_out;
wire cell_195_bscan_in;
wire cell_195_bscan_out;
wire cell_194_bscan_in;
wire cell_194_bscan_out;
wire cell_193_bscan_in;
wire cell_193_bscan_out;
wire cell_192_bscan_in;
wire cell_192_bscan_out;
wire cell_192_scanin;
wire cell_192_scanout;
wire cell_191_bscan_in;
wire cell_191_bscan_out;
wire dbg1_mio_sel_soc_obs_mode_l;
wire cell_191_scanin;
wire cell_191_scanout;
wire cell_190_bscan_in;
wire cell_190_bscan_out;
wire cell_190_scanin;
wire cell_190_scanout;
wire cell_189_bscan_in;
wire cell_189_bscan_out;
wire cell_189_scanin;
wire cell_189_scanout;
wire cell_188_bscan_in;
wire cell_188_bscan_out;
wire cell_188_scanin;
wire cell_188_scanout;
wire cell_187_bscan_in;
wire cell_187_bscan_out;
wire cell_187_scanin;
wire cell_187_scanout;
wire cell_186_bscan_in;
wire cell_186_bscan_out;
wire cell_186_scanin;
wire cell_186_scanout;
wire cell_185_bscan_in;
wire cell_185_bscan_out;
wire mio_tcu_testmode_l;
wire cell_185_scanin;
wire cell_185_scanout;
wire cell_184_bscan_in;
wire cell_184_bscan_out;
wire cell_184_scanin;
wire cell_184_scanout;
wire cell_183_bscan_in;
wire cell_183_bscan_out;
wire dbg1_mio_sel_niu_debug_mode_l;
wire cell_183_scanin;
wire cell_183_scanout;
wire cell_182_bscan_in;
wire cell_182_bscan_out;
wire cell_182_scanin;
wire cell_182_scanout;
wire cell_181_bscan_in;
wire cell_181_bscan_out;
wire cell_181_scanin;
wire cell_181_scanout;
wire cell_180_bscan_in;
wire cell_180_bscan_out;
wire cell_180_scanin;
wire cell_180_scanout;
wire cell_179_bscan_in;
wire cell_179_bscan_out;
wire cell_179_scanin;
wire cell_179_scanout;
wire cell_178_bscan_in;
wire cell_178_bscan_out;
wire cell_178_scanin;
wire cell_178_scanout;
wire cell_177_bscan_in;
wire cell_177_bscan_out;
wire cell_177_scanin;
wire cell_177_scanout;
wire cell_176_bscan_in;
wire cell_176_bscan_out;
wire cell_176_scanin;
wire cell_176_scanout;
wire cell_175_bscan_in;
wire cell_175_bscan_out;
wire cell_175_scanin;
wire cell_175_scanout;
wire cell_174_bscan_in;
wire cell_174_bscan_out;
wire cell_174_scanin;
wire cell_174_scanout;
wire cell_173_bscan_in;
wire cell_173_bscan_out;
wire cell_173_scanin;
wire cell_173_scanout;
wire cell_172_bscan_in;
wire cell_172_bscan_out;
wire cell_172_scanin;
wire cell_172_scanout;
wire cell_171_bscan_in;
wire cell_171_bscan_out;
wire cell_171_scanin;
wire cell_171_scanout;
wire cell_170_bscan_in;
wire cell_170_bscan_out;
wire cell_170_scanin;
wire cell_170_scanout;
wire cell_169_bscan_in;
wire cell_169_bscan_out;
wire cell_169_scanin;
wire cell_169_scanout;
wire cell_168_bscan_in;
wire cell_168_bscan_out;
wire cell_168_scanin;
wire cell_168_scanout;
wire cell_167_bscan_in;
wire cell_167_bscan_out;
wire cell_167_scanin;
wire cell_167_scanout;
wire cell_166_bscan_in;
wire cell_166_bscan_out;
wire cell_166_scanin;
wire cell_166_scanout;
wire cell_165_bscan_in;
wire cell_165_bscan_out;
wire cell_165_scanin;
wire cell_165_scanout;
wire cell_164_bscan_in;
wire cell_164_bscan_out;
wire cell_164_scanin;
wire cell_164_scanout;
wire cell_163_bscan_in;
wire cell_163_bscan_out;
wire cell_163_scanin;
wire cell_163_scanout;
wire cell_162_bscan_in;
wire cell_162_bscan_out;
wire cell_162_scanin;
wire cell_162_scanout;
wire cell_161_bscan_in;
wire cell_161_bscan_out;
wire cell_161_scanin;
wire cell_161_scanout;
wire cell_160_bscan_in;
wire cell_160_bscan_out;
wire cell_160_scanin;
wire cell_160_scanout;
wire cell_159_bscan_in;
wire cell_159_bscan_out;
wire cell_159_scanin;
wire cell_159_scanout;
wire cell_158_bscan_in;
wire cell_158_bscan_out;
wire cell_158_scanin;
wire cell_158_scanout;
wire cell_157_bscan_in;
wire cell_157_bscan_out;
wire cell_157_scanin;
wire cell_157_scanout;
wire cell_156_bscan_in;
wire cell_156_bscan_out;
wire cell_156_scanin;
wire cell_156_scanout;
wire cell_155_bscan_in;
wire cell_155_bscan_out;
wire cell_155_scanin;
wire cell_155_scanout;
wire cell_154_bscan_in;
wire cell_154_bscan_out;
wire cell_154_scanin;
wire cell_154_scanout;
wire cell_153_bscan_in;
wire cell_153_bscan_out;
wire cell_153_scanin;
wire cell_153_scanout;
wire cell_152_bscan_in;
wire cell_152_bscan_out;
wire cell_152_scanin;
wire cell_152_scanout;
wire cell_151_bscan_in;
wire cell_151_bscan_out;
wire cell_151_scanin;
wire cell_151_scanout;
wire cell_150_bscan_in;
wire cell_150_bscan_out;
wire cell_150_scanin;
wire cell_150_scanout;
wire cell_149_bscan_in;
wire cell_149_bscan_out;
wire dbg1_mio_sel_pcix_debug_mode_l;
wire cell_149_scanin;
wire cell_149_scanout;
wire cell_148_bscan_in;
wire cell_148_bscan_out;
wire cell_148_scanin;
wire cell_148_scanout;
wire cell_147_bscan_in;
wire cell_147_bscan_out;
wire cell_147_scanin;
wire cell_147_scanout;
wire cell_146_bscan_in;
wire cell_146_bscan_out;
wire cell_146_scanin;
wire cell_146_scanout;
wire cell_145_bscan_in;
wire cell_145_bscan_out;
wire cell_145_scanin;
wire cell_145_scanout;
wire cell_144_bscan_in;
wire cell_144_bscan_out;
wire cell_144_scanin;
wire cell_144_scanout;
wire cell_143_bscan_in;
wire cell_143_bscan_out;
wire cell_143_scanin;
wire cell_143_scanout;
wire cell_142_bscan_in;
wire cell_142_bscan_out;
wire cell_142_scanin;
wire cell_142_scanout;
wire cell_141_bscan_in;
wire cell_141_bscan_out;
wire cell_141_scanin;
wire cell_141_scanout;
wire cell_140_bscan_in;
wire cell_140_bscan_out;
wire cell_140_scanin;
wire cell_140_scanout;
wire cell_139_bscan_in;
wire cell_139_bscan_out;
wire cell_139_scanin;
wire cell_139_scanout;
wire cell_138_bscan_in;
wire cell_138_bscan_out;
wire cell_138_scanin;
wire cell_138_scanout;
wire cell_137_bscan_in;
wire cell_137_bscan_out;
wire cell_137_scanin;
wire cell_137_scanout;
wire cell_136_bscan_in;
wire cell_136_bscan_out;
wire cell_136_scanin;
wire cell_136_scanout;
wire cell_135_bscan_in;
wire cell_135_bscan_out;
wire cell_135_scanin;
wire cell_135_scanout;
wire cell_134_bscan_in;
wire cell_134_bscan_out;
wire cell_134_scanin;
wire cell_134_scanout;
wire cell_133_bscan_in;
wire cell_133_bscan_out;
wire cell_133_scanin;
wire cell_133_scanout;
wire cell_132_bscan_in;
wire cell_132_bscan_out;
wire cell_132_scanin;
wire cell_132_scanout;
wire cell_131_bscan_in;
wire cell_131_bscan_out;
wire cell_131_scanin;
wire cell_131_scanout;
wire cell_130_bscan_in;
wire cell_130_bscan_out;
wire cell_130_scanin;
wire cell_130_scanout;
wire cell_129_bscan_in;
wire cell_129_bscan_out;
wire cell_129_scanin;
wire cell_129_scanout;
wire cell_128_bscan_in;
wire cell_128_bscan_out;
wire cell_128_scanin;
wire cell_128_scanout;
wire cell_127_bscan_in;
wire cell_127_bscan_out;
wire cell_127_scanin;
wire cell_127_scanout;
wire cell_126_bscan_in;
wire cell_126_bscan_out;
wire cell_126_scanin;
wire cell_126_scanout;
wire cell_125_bscan_in;
wire cell_125_bscan_out;
wire cell_125_scanin;
wire cell_125_scanout;
wire cell_124_bscan_in;
wire cell_124_bscan_out;
wire cell_124_scanin;
wire cell_124_scanout;
wire cell_123_bscan_in;
wire cell_123_bscan_out;
wire cell_123_scanin;
wire cell_123_scanout;
wire cell_122_bscan_in;
wire cell_122_bscan_out;
wire cell_122_scanin;
wire cell_122_scanout;
wire cell_121_bscan_in;
wire cell_121_bscan_out;
wire cell_121_scanin;
wire cell_121_scanout;
wire cell_120_bscan_in;
wire cell_120_bscan_out;
wire cell_120_scanin;
wire cell_120_scanout;
wire cell_119_bscan_in;
wire cell_119_bscan_out;
wire cell_119_scanin;
wire cell_119_scanout;
wire cell_118_bscan_in;
wire cell_118_bscan_out;
wire cell_118_scanin;
wire cell_118_scanout;
wire cell_117_bscan_in;
wire cell_117_bscan_out;
wire cell_117_scanin;
wire cell_117_scanout;
wire cell_116_bscan_in;
wire cell_116_bscan_out;
wire cell_116_scanin;
wire cell_116_scanout;
wire cell_115_bscan_in;
wire cell_115_bscan_out;
wire cell_115_scanin;
wire cell_115_scanout;
wire cell_114_bscan_in;
wire cell_114_bscan_out;
wire cell_114_scanin;
wire cell_114_scanout;
wire cell_113_bscan_in;
wire cell_113_bscan_out;
wire cell_113_scanin;
wire cell_113_scanout;
wire cell_112_bscan_in;
wire cell_112_bscan_out;
wire cell_112_scanin;
wire cell_112_scanout;
wire cell_111_bscan_in;
wire cell_111_bscan_out;
wire cell_111_scanin;
wire cell_111_scanout;
wire cell_110_bscan_in;
wire cell_110_bscan_out;
wire cell_110_scanin;
wire cell_110_scanout;
wire cell_109_bscan_in;
wire cell_109_bscan_out;
wire cell_109_scanin;
wire cell_109_scanout;
wire cell_108_bscan_in;
wire cell_108_bscan_out;
wire cell_108_scanin;
wire cell_108_scanout;
wire cell_107_bscan_in;
wire cell_107_bscan_out;
wire cell_107_scanin;
wire cell_107_scanout;
wire cell_106_bscan_in;
wire cell_106_bscan_out;
wire cell_106_scanin;
wire cell_106_scanout;
wire cell_105_bscan_in;
wire cell_105_bscan_out;
wire cell_105_scanin;
wire cell_105_scanout;
wire cell_104_bscan_in;
wire cell_104_bscan_out;
wire cell_104_scanin;
wire cell_104_scanout;
wire cell_103_bscan_in;
wire cell_103_bscan_out;
wire cell_103_scanin;
wire cell_103_scanout;
wire cell_102_bscan_in;
wire cell_102_bscan_out;
wire cell_102_scanin;
wire cell_102_scanout;
wire cell_101_bscan_in;
wire cell_101_bscan_out;
wire cell_101_scanin;
wire cell_101_scanout;
wire cell_98_bscan_in;
wire cell_98_bscan_out;
wire cell_98_scanin;
wire cell_98_scanout;
wire cell_97_bscan_in;
wire cell_97_bscan_out;
wire cell_97_scanin;
wire cell_97_scanout;
wire cell_96_bscan_in;
wire cell_96_bscan_out;
wire cell_96_scanin;
wire cell_96_scanout;
wire cell_95_bscan_in;
wire cell_95_bscan_out;
wire cell_95_scanin;
wire cell_95_scanout;
wire cell_94_bscan_in;
wire cell_94_bscan_out;
wire cell_94_scanin;
wire cell_94_scanout;
wire cell_93_bscan_in;
wire cell_93_bscan_out;
wire cell_93_scanin;
wire cell_93_scanout;
wire cell_92_bscan_in;
wire cell_92_bscan_out;
wire cell_92_scanin;
wire cell_92_scanout;
wire cell_91_bscan_in;
wire cell_91_bscan_out;
wire cell_91_scanin;
wire cell_91_scanout;
wire cell_90_bscan_in;
wire cell_90_bscan_out;
wire cell_90_scanin;
wire cell_90_scanout;
wire cell_89_bscan_in;
wire cell_89_bscan_out;
wire cell_89_scanin;
wire cell_89_scanout;
wire cell_88_bscan_in;
wire cell_88_bscan_out;
wire cell_88_scanin;
wire cell_88_scanout;
wire cell_87_bscan_in;
wire cell_87_bscan_out;
wire cell_87_scanin;
wire cell_87_scanout;
wire cell_86_bscan_in;
wire cell_86_bscan_out;
wire cell_86_scanin;
wire cell_86_scanout;
wire cell_85_bscan_in;
wire cell_85_bscan_out;
wire cell_85_scanin;
wire cell_85_scanout;
wire cell_84_bscan_in;
wire cell_84_bscan_out;
wire cell_84_scanin;
wire cell_84_scanout;
wire cell_83_bscan_in;
wire cell_83_bscan_out;
wire cell_83_scanin;
wire cell_83_scanout;
wire cell_82_bscan_in;
wire cell_82_bscan_out;
wire cell_82_scanin;
wire cell_82_scanout;
wire cell_81_bscan_in;
wire cell_81_bscan_out;
wire cell_81_scanin;
wire cell_81_scanout;
wire cell_80_bscan_in;
wire cell_80_bscan_out;
wire cell_80_scanin;
wire cell_80_scanout;
wire cell_79_bscan_in;
wire cell_79_bscan_out;
wire cell_79_scanin;
wire cell_79_scanout;
wire cell_78_bscan_in;
wire cell_78_bscan_out;
wire cell_78_scanin;
wire cell_78_scanout;
wire cell_77_bscan_in;
wire cell_77_bscan_out;
wire cell_77_scanin;
wire cell_77_scanout;
wire cell_76_bscan_in;
wire cell_76_bscan_out;
wire cell_76_scanin;
wire cell_76_scanout;
wire cell_75_bscan_in;
wire cell_75_bscan_out;
wire cell_75_scanin;
wire cell_75_scanout;
wire cell_74_bscan_in;
wire cell_74_bscan_out;
wire cell_74_scanin;
wire cell_74_scanout;
wire cell_73_bscan_in;
wire cell_73_bscan_out;
wire cell_73_scanin;
wire cell_73_scanout;
wire cell_72_bscan_in;
wire cell_72_bscan_out;
wire cell_72_scanin;
wire cell_72_scanout;
wire cell_71_bscan_in;
wire cell_71_bscan_out;
wire cell_71_scanin;
wire cell_71_scanout;
wire cell_70_bscan_in;
wire cell_70_bscan_out;
wire cell_70_scanin;
wire cell_70_scanout;
wire cell_69_bscan_in;
wire cell_69_bscan_out;
wire cell_69_scanin;
wire cell_69_scanout;
wire cell_68_bscan_in;
wire cell_68_bscan_out;
wire cell_68_scanin;
wire cell_68_scanout;
wire cell_67_bscan_in;
wire cell_67_bscan_out;
wire cell_67_scanin;
wire cell_67_scanout;
wire cell_100_bscan_in;
wire cell_100_bscan_out;
wire tcu_mio_jtag_membist_mode_l;
wire cell_100_scanin;
wire cell_100_scanout;
wire cell_99_bscan_in;
wire cell_99_bscan_out;
wire cell_99_scanin;
wire cell_99_scanout;
wire cell_66_bscan_in;
wire cell_66_bscan_out;
wire cell_66_scanin;
wire cell_66_scanout;
wire cell_65_bscan_in;
wire cell_65_bscan_out;
wire cell_65_scanin;
wire cell_65_scanout;
wire cell_64_bscan_in;
wire cell_64_bscan_out;
wire cell_64_scanin;
wire cell_64_scanout;
wire cell_63_bscan_in;
wire cell_63_bscan_out;
wire cell_63_scanin;
wire cell_63_scanout;
wire cell_62_bscan_in;
wire cell_62_bscan_out;
wire cell_62_scanin;
wire cell_62_scanout;
wire cell_61_bscan_in;
wire cell_61_bscan_out;
wire cell_61_scanin;
wire cell_61_scanout;
wire cell_60_bscan_in;
wire cell_60_bscan_out;
wire cell_60_scanin;
wire cell_60_scanout;
wire cell_59_bscan_in;
wire cell_59_bscan_out;
wire cell_59_scanin;
wire cell_59_scanout;
wire cell_58_bscan_in;
wire cell_58_bscan_out;
wire cell_58_scanin;
wire cell_58_scanout;
wire cell_57_bscan_in;
wire cell_57_bscan_out;
wire cell_57_scanin;
wire cell_57_scanout;
wire cell_56_bscan_in;
wire cell_56_bscan_out;
wire cell_56_scanin;
wire cell_56_scanout;
wire cell_55_bscan_in;
wire cell_55_bscan_out;
wire cell_55_scanin;
wire cell_55_scanout;
wire cell_54_bscan_in;
wire cell_54_bscan_out;
wire cell_54_scanin;
wire cell_54_scanout;
wire cell_53_bscan_in;
wire cell_53_bscan_out;
wire cell_53_scanin;
wire cell_53_scanout;
wire cell_52_bscan_in;
wire cell_52_bscan_out;
wire cell_52_scanin;
wire cell_52_scanout;
wire cell_51_bscan_in;
wire cell_51_bscan_out;
wire cell_51_scanin;
wire cell_51_scanout;
wire cell_50_bscan_in;
wire cell_50_bscan_out;
wire cell_50_scanin;
wire cell_50_scanout;
wire cell_49_bscan_in;
wire cell_49_bscan_out;
wire cell_49_scanin;
wire cell_49_scanout;
wire cell_48_bscan_in;
wire cell_48_bscan_out;
wire cell_48_scanin;
wire cell_48_scanout;
wire cell_47_bscan_in;
wire cell_47_bscan_out;
wire cell_47_scanin;
wire cell_47_scanout;
wire cell_46_bscan_in;
wire cell_46_bscan_out;
wire cell_46_scanin;
wire cell_46_scanout;
wire cell_45_bscan_in;
wire cell_45_bscan_out;
wire cell_45_scanin;
wire cell_45_scanout;
wire cell_44_bscan_in;
wire cell_44_bscan_out;
wire cell_44_scanin;
wire cell_44_scanout;
wire cell_43_bscan_in;
wire cell_43_bscan_out;
wire cell_43_scanin;
wire cell_43_scanout;
wire cell_42_bscan_in;
wire cell_42_bscan_out;
wire cell_42_scanin;
wire cell_42_scanout;
wire cell_41_bscan_in;
wire cell_41_bscan_out;
wire cell_41_scanin;
wire cell_41_scanout;
wire cell_40_bscan_in;
wire cell_40_bscan_out;
wire cell_40_scanin;
wire cell_40_scanout;
wire cell_39_bscan_in;
wire cell_39_bscan_out;
wire cell_39_scanin;
wire cell_39_scanout;
wire cell_38_bscan_in;
wire cell_38_bscan_out;
wire cell_38_scanin;
wire cell_38_scanout;
wire cell_37_bscan_in;
wire cell_37_bscan_out;
wire cell_37_scanin;
wire cell_37_scanout;
wire cell_36_bscan_in;
wire cell_36_bscan_out;
wire cell_36_scanin;
wire cell_36_scanout;
wire cell_35_bscan_in;
wire cell_35_bscan_out;
wire cell_35_scanin;
wire cell_35_scanout;
wire cell_34_bscan_in;
wire cell_34_bscan_out;
wire cell_34_scanin;
wire cell_34_scanout;
wire cell_33_bscan_in;
wire cell_33_bscan_out;
wire cell_33_scanin;
wire cell_33_scanout;
wire cell_32_bscan_in;
wire cell_32_bscan_out;
wire cell_32_scanin;
wire cell_32_scanout;
wire cell_31_bscan_in;
wire cell_31_bscan_out;
wire cell_31_scanin;
wire cell_31_scanout;
wire cell_30_bscan_in;
wire cell_30_bscan_out;
wire cell_30_scanin;
wire cell_30_scanout;
wire cell_29_bscan_in;
wire cell_29_bscan_out;
wire cell_29_scanin;
wire cell_29_scanout;
wire cell_28_bscan_in;
wire cell_28_bscan_out;
wire cell_28_scanin;
wire cell_28_scanout;
wire cell_27_bscan_in;
wire cell_27_bscan_out;
wire cell_27_scanin;
wire cell_27_scanout;
wire cell_26_bscan_in;
wire cell_26_bscan_out;
wire cell_26_scanin;
wire cell_26_scanout;
wire cell_25_bscan_in;
wire cell_25_bscan_out;
wire cell_24_bscan_in;
wire cell_24_bscan_out;
wire cell_24_scanin;
wire cell_24_scanout;
wire cell_15_bscan_in;
wire cell_15_bscan_out;
wire cell_15_scanin;
wire cell_15_scanout;
wire cell_14_bscan_in;
wire cell_14_bscan_out;
wire cell_13_bscan_in;
wire cell_13_bscan_out;
wire cell_12_bscan_in;
wire cell_12_bscan_out;
wire cell_5_bscan_in;
wire cell_5_bscan_out;
wire cell_5_scanin;
wire cell_5_scanout;
wire cell_10_bscan_in;
wire cell_10_bscan_out;
wire cell_09_bscan_in;
wire cell_09_bscan_out;
wire cell_9_scanin;
wire cell_9_scanout;
wire cell_08_bscan_in;
wire cell_08_bscan_out;
wire cell_07_bscan_in;
wire cell_07_bscan_out;
wire cell_7_scanin;
wire cell_7_scanout;
wire cell_04_bscan_in;
wire cell_04_bscan_out;
wire cell_03_bscan_in;
wire cell_03_bscan_out;
wire cell_3_scanin;
wire cell_3_scanout;
wire cell_02_bscan_in;
wire cell_02_bscan_out;
wire cell_2_scanin;
wire cell_2_scanout;
wire cell_01_bscan_in;
wire cell_01_bscan_out;
wire cell_00_bscan_in;
wire cell_00_bscan_out;
wire cell_212_bscan_in;
wire cell_212_bscan_out;
wire cell_213_bscan_in;
wire cell_213_bscan_out;
wire cell_214_bscan_in;
wire cell_214_bscan_out;
wire cell_215_bscan_in;
wire cell_215_bscan_out;
wire cell_216_bscan_in;
wire cell_216_bscan_out;


// new signals after clock header insertion

input           cluster_arst_l;
input           ccu_io_out;
input           tcu_div_bypass;
input           tcu_atpg_mode;
input           ccu_mio_serdes_dtm;

// pcm related signals

output            io_burnin;
output            sel59;
output            sel60;
output            sel61;
input             ro_in;

`ifndef FC_NO_NIU_T2
/////////////////////////////////////////////////////////////////////////////
// XAUI PADS : 6 not shared with debug port
/////////////////////////////////////////////////////////////////////////////

output          XAUI0_ACT_LED; // 5 Hz, core_clk/2to26
output          XAUI0_LINK_LED; // 0 Hz    a level signal
output          XAUI1_ACT_LED;  // 5 Hz    core_clk/2to26
output          XAUI1_LINK_LED; // a level signal
output          XAUI_MDC;       // 2.5 MHz  to the input of the output driver
inout           XAUI_MDIO;      // 2.5 MHz  to the input of the bidir output driver
inout           XAUI_MDINT1_L;  // XAUI INterrupt 1
inout           XAUI_MDINT0_L;  // XAUI INterrupt 0

// Core interface for XAUI pins ////

input           xaui_act_led_0;
input           xaui_link_led_0;
input           xaui_act_led_1;
input           xaui_link_led_1;
input           mdc;
input           mdoe;           // Output enable for XAUI_MDIO
output          mdi;            // 2.5 MHz  from the output of bidir input buffer
output          mio_mac_xaui_mdint0_l;
output		mio_mac_xaui_mdint1_l;
`endif


/////////////////////////////////////////////////////////////////////////////
// TEST PADS : 16 total not shared with debug port
/////////////////////////////////////////////////////////////////////////////

input		TCK;			// JTAG Test Clock
input		TDI;			// JTAG Test Data In
output		TDO;			// JTAG Test Data Out
input		TMS;			// JTAG Test Mode Select
input		TRST_L;			// JTAG Test Reset
input		TESTMODE;		// test pin to switch from various 
					// testmodes from scan, function 
					// test, MEMBIST
output          STCIQ;                  // SERDES STCI Scan Chain Data Out
input           STCID;                  // SERDES STCI Scan Chain Data In
input [1:0]     STCICFG;                // SERDES STCI Scan Configuration
input           STCICLK;                // SERDES ATPG/STCI Scan Clock
input           TESTCLKT;               // SERDES Bypass Clock for Transmit
input           TESTCLKR;               // SERDES Bypass Clock for Receive
input		DIVIDER_BYPASS;		// Bypasses Clock Tree Dividers
input		PLL_CMP_BYPASS;		// CMP Clock PLL Bypass

/////////////////////////////////////////////////////////////////////////////
// TEST CORE SIGNALS
/////////////////////////////////////////////////////////////////////////////

output		mio_tcu_tck;
output		mio_tcu_tdi;
input		tcu_mio_tdo;
output		mio_tcu_tms;
output		mio_tcu_trst_l;
output		mio_tcu_testmode;

input		tcu_mio_tdo_en;
input           tcu_mio_stciq;
output          mio_tcu_stcid;
output [1:0]    mio_tcu_stcicfg;
output		mio_tcu_stciclk;
output [7:0]	mio_fsr_testclkt;
output		mio_psr_testclkt;
output		mio_esr_testclkt;
output [7:0]	mio_fsr_testclkr;
output		mio_psr_testclkr;
output		mio_esr_testclkr;

output		mio_tcu_divider_bypass;
output		mio_tcu_pll_cmp_bypass;



/////////////////////////////////////////////////////////////////////////////
// TEST CONNECTIONS
/////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
// DEBUG PADS : 167 total including 166 debug pins for data, 1 for debug port clock
//////////////////////////////////////////////////////////////////////////////////

inout	[165:0]		DBG_DQ;			// Debug Ports
output			DBG_CK0;                // Debug Output CLK Unit 0


// The basic unit in MIO will be of this form:
//
//           output A > ---- | flop | --- |\
//           output B > ---- | flop | --- | |--- |> ------ <> dbg_port
//           output C > ----------------- |/           |
//              input < ------------------------ <| ----
//
// Outputs A and B are flopped while output C is just a feedthru.  The dbg
// block controls the 3:1 mux.  The pin mapping is as follows:
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 1 bit NOT SHARED - serves the purpose of DBG_CK and DMU_DBG_CLK 
//
// output A             DBG_CK0/DMU_DBG_CLK
//
// leg A of mux always selected, select hard coded
// drive_en = dbg1_mio_drv_en_op_only  
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 6 bits shared between DBG_DQ and RST_STATE[5:0]  *****************
//
// output A [165:160]	DBG_DQ		// N2 DEBUG PORTS
//
// output C             rst_mio_rst_state[5:0] // Reset State
//
// sel = C if dbg1_mio_sel_soc_obs_mode, otherwise always select A
// drive_en = dbg1_mio_drv_en_op_only
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 1 bits shared between DBG_DQ and C leg of output mux ********
//
// output A [159:159]	DBG_DQ		// N2 DEBUG PORTS
//
// output C 		SCAN_OUT31	// SERDES ATPG Scan Chain Data Out
//					// (SERDES_ATPGQ)
//
// sel = C if mio_tcu_testmode =1, otherwise always select A 
// drive_en = dbg1_mio_drv_en_muxtest_op
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 1 bit shared between DBG_DQ and STCID input *****************
//
// output A [158:158]	DBG_DQ		// N2 DEBUG PORTS
// 
// leg A of mux always selected, select hard coded
// drive_en = dbg1_mio_drv_en_muxtest_inp
//
// input		SCAN_IN31	// SERDES ATPG Scan Chain Data In
//					// (SERDES_ATPGD)
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 55 bit shared between DBG_DQ and C leg of output mux ***************
//
// output A [157:103]	DBG_DQ		// N2 DEBUG PORTS
//
// output C [31:0]	NIU_DBG_DAT	// NIU DBG signals (=< 2 clk domains)
// output C [1:0]       NIU_DBG_CLK     // =< 2 clks that NIU_DBG_DAT refs
//
// sel = C if dbg1_mio_sel_niu_debug_mode =1, otherwise always select A
// drive_en = dbg1_mio_drv_en_muxtest_inp
//
// output C [7:0]       DMU_DBG_BUS_A   // Debug Bus A from DMU
// output C [7:0]       DMU_DBG_BUS_B   // Debug Bus B from DMU
// output C [7:3]       PEU_DBG_BUS_A   // Debug Bus A from PEU
//
// sel = C if dbg1_mio_sel_pcix_debug_mode =1, otherwise always select A
// drive_en = dbg1_mio_drv_en_muxtest_inp
//
// input                PLL_CHAR_IN     // PLL Char IN
// input [5:0]		PLL_DIV2	// Input for PLL Feedback Divider
// input		PLL_TRST_L	// Async Reset in Testmode for PLL
// input		PLL_CLAMP_FLTR	// VCO runs at low freq
// input		PLL_CMP_CHAR_MODE	// Put PLL in Char mode
// input [7:0]		PLL_DIV4	// 
// input		PLL_EXT_DR_CLK	// External DR clock in PLL Bypass 
// input		PLL_EXT_CMP_CLK // External CMP Clock in PLL Bypass 
// input		AC_TESTMODE	// TRANSITION TEST MODE
// input		AC_TESTRIG	// TRIGGERS TRANSITION CAPTURE
// input		ACLK		// MASTER SCAN CLK
// input		BCLK		// SLAVE SCAN CLK
// input [30:0]		SCAN_IN		// SCAN IN DATA
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 12 bits output only and shared with PEU debug signals *********
// 
// output A [102:91]  DBG_DQ          // N2 DEBUG PORTS
//
// output C [2:0]       PEU_DBG_BUS_A   // Debug Bus A from PEU
// output C [7:0]       PEU_DBG_BUS_B   // Debug Bus B from PEU
// output C             PEU_DBG_CLK     // PEU clock sent out on DBG port
//
// sel = C if dbg1_mio_sel_pcix_debug_mode =1, otherwise always select A
// drive_en = dbg1_mio_drv_en_op_only   
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 6 bits output only and not shared *********
//
// output A [90:85]  DBG_DQ          // N2 DEBUG PORTS
//
// leg A of mux always selected, select hard coded
// drive_en = dbg1_mio_drv_en_op_only
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 1 bit shared between DBG_DQ   and misc. input *********
// output A [84] DBG_DQ          // N2 DEBUG PORTS
//
// leg A of mux always selected, select hard coded
// drive_en = dbg1_mio_drv_en_muxtest_inp
//
// input		PEU_CLK_EXT	// SCAN TEST CAPTURES @ PEU
// 
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 1 bits output only and not shared *********
//
// output A [83] DBG_DQ          // N2 DEBUG PORTS
//
// leg A of mux always selected, select hard coded
// drive_en = dbg1_mio_drv_en_op_only
//
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 6 bit shared between DBG_DQ   and misc. input *********
// output A [82:77] DBG_DQ          // N2 DEBUG PORTS
//
// leg A of mux always selected, select hard coded
// drive_en = dbg1_mio_drv_en_muxtest_inp
// input [5:0]          NIU_CLK_EXT     // SCAN TEST CAPTURES @ IO2X
// 
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 2 bits output only and not shared *********
//
// output A [76:75] DBG_DQ          // N2 DEBUG PORTS
//
// leg A of mux always selected, select hard coded
// drive_en = dbg1_mio_drv_en_op_only 
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 1 bit shared between DBG_DQ   and misc. input *********
// output A [74]     DBG_DQ          // N2 DEBUG PORT
// leg A of mux always selected, select hard coded
// drive_en = dbg1_mio_drv_en_muxtest_inp
//
// input                SCAN_EN         // SCAN ENABLE
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 31 bits shared between DBG_DQ  and C leg of output mux ************
//
// output A [73:43]	DBG_DQ		// N2 DEBUG PORTS
//
// output C [30:0]	SCAN_OUT	// SCAN OUT DATA
//
// sel = C if mio_tcu_testmode =1, otherwise always select A 
// drive_en = dbg1_mio_drv_en_muxtest_op
//
//----------------------- Debug PIN Sharing Map ---------------------------//
// **** 43 bits shared between DBG_DQ  and B leg of output mux ************
//
// output A [42:0]	DBG_DQ		// N2 DEBUG PORTS
//
// output B             DMO_SYNC      // DMO SYNC
// output B [39:0]	DMO_DATA	// DMO DATA 
// output B		MBIST_DONE	// MEMBIST STATUS
// output B		MBIST_FAIL	// MEMBIST STATUS
//
// sel = B if tcu_mio_jtag_membist_mode = 1, otherwise always select A
// drive_en = dbg1_mio_drv_en_muxbist_op

//////////////////////////////////////////////////////////////////////////////////
// DEBUG PADS that are not part of debug port : 4 pins total
//////////////////////////////////////////////////////////////////////////////////


input		TRIGIN;			// Stop clock based on external event
output		TRIGOUT;		// DBG event signal to logic analyzer

/////////////////////////////////////////////////////////////////////////////
// DEBUG Port signals with the test and miscellenous signals they are shared with  
/////////////////////////////////////////////////////////////////////////////


output 		mio_tcu_scan_in31;
input		tcu_mio_scan_out31;

input [31:0]	niu_mio_debug_data;
input [1:0]	niu_mio_debug_clock;

input [7:0]	dbg0_mio_debug_bus_a;
input [7:0]	dbg0_mio_debug_bus_b;

input [7:0]	peu_mio_debug_bus_a;
input [7:0]	peu_mio_debug_bus_b;
input [63:0]    peu_mio_pipe_txdata;
input [7:0]     peu_mio_pipe_txdatak;

input		peu_mio_debug_clk; //TXBCLK_SDS0[0] , peu clock from Serdes

output          mio_pll_testmode;
output		mio_ccu_pll_char_in;
output [5:0]	mio_ccu_pll_div2;
output		mio_ccu_pll_trst_l;
output		mio_ccu_pll_clamp_fltr;
output [6:0]	mio_ccu_pll_div4;
output		mio_ext_dr_clk;
output          mio_ext_cmp_clk;
input  [1:0]    ccu_mio_pll_char_out;

output		mio_ccu_vreg_selbg_l;


output		mio_tcu_io_ac_testmode;
output		mio_tcu_io_ac_testtrig;
output		mio_tcu_io_aclk;
output		mio_tcu_io_bclk;
output [30:0]	mio_tcu_io_scan_in;

output		mio_tcu_peu_clk_ext;
output [5:0]	mio_tcu_niu_clk_ext;
output		mio_tcu_io_scan_en;

input [30:0]	tcu_mio_pins_scan_out;

input [39:0]	tcu_mio_dmo_data;
input		tcu_mio_mbist_done;
input		tcu_mio_mbist_fail;
input		tcu_mio_dmo_sync;

input [165:0]	dbg1_mio_dbg_dq;

output		mio_tcu_trigin;
input		tcu_mio_trigout;

input		dbg1_mio_drv_en_op_only;	// Drive en to pins configured 
						// only as debug port

input		dbg1_mio_drv_en_muxtest_inp;	// Drive en to pins configured 
						// as debug port and testmode 
						// input pins

input           dbg1_mio_drv_en_muxtestpll_inp; // Drive en to pins configured
                                                // as debug port and pll testmode
                                                // input pins

input		dbg1_mio_drv_en_muxtest_op;	// Drive en to pins configured 
						// both as debug port and scan 
						// out[31:0] pins

input		dbg1_mio_drv_en_muxbist_op;	// Drive en to pins configured 
						// both as debug port and mbist 
						// output pins


/////////////////////////////////////////////////////////////////////////////
// DEBUG CONNECTIONS
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// MISC PADS : total of 22 that are not shared with debug port
//             (including 7 spares)
/////////////////////////////////////////////////////////////////////////////

input           VDDO_PCM;               // 1.5 V supply for PCM module
input	[1:0]	PMI;			// process control monitor inputs
output		PMO;			// process control monitor output
input		PGRM_EN;		// Efuse Program enable

input		BURNIN;			// Sets Burnin Mode for PCM Modules
output		PEX_RESET_L;		// To External PCI Express switch and
					// PCI Express Devices

input		PB_RST_L;		// Like Niagara J_RST_L
input		BUTTON_XIR_L;		// Externally Initiated Reset
input		PWRON_RST_L;		// Power On Reset
output		SSI_MOSI;		// SSI Master Out, Slave In
input		SSI_MISO;		// SSI Master In, Slave Out
output		SSI_SCK;		// SSI Clock
input		SSI_EXT_INT_L;		// External Interrupt
output		SSI_SYNC_L;		// SSI SYnc signal to FPGA 
input           VREG_SELBG_L;           // Bandgap Select
output  [1:0]   PLL_CHAR_OUT;           // PLL Char Out
input           PLL_TESTMODE;           // PLL Testmode
input   [2:0]   PWR_THRTTL_0;           // Power Throttle pins grp 0
input   [2:0]   PWR_THRTTL_1;           // Power Throttle pins grp 1

/////////////////////////////////////////////////////////////////////////////
// MISC CORE SIGNALS : 15 total not shared with Debug Port
/////////////////////////////////////////////////////////////////////////////

output		mio_efu_prgm_en;
input		rst_mio_pex_reset_l;
input   [5:0]   rst_mio_rst_state; 
output		mio_rst_pb_rst_l;
output		mio_rst_button_xir_l;
output		mio_rst_pwron_rst_l;
input		ncu_mio_ssi_mosi;
output		mio_ncu_ssi_miso;
input		ncu_mio_ssi_sck;
output		mio_ncu_ext_int_l;
input		rst_mio_ssi_sync_l;
output  [2:0]   mio_spc_pwr_throttle_0;
output  [2:0]   mio_spc_pwr_throttle_1;

/////////////////////////////////////////////////////////////////////////////
// MISC CONNECTIONS
/////////////////////////////////////////////////////////////////////////////



////// New signals added 02/10/05 ///////
input           gclk_0;                  //Internal CMP clock from CCU
input           gclk_1;                  //Internal CMP clock from CCU
input           gclk_2;                  //Internal CMP clock from CCU
input           gclk_3;                  //Internal CMP clock from CCU
input           gl_mio_clk_stop_c3;
input           gl_mio_clk_stop_c2_left;
input           gl_mio_clk_stop_c2_right;
input           gl_mio_clk_stop_c1;
input           gl_mio_io2x_sync_en_c3;
input           gl_mio_io2x_sync_en_c2_left;
input           gl_mio_io2x_sync_en_c2_right;
input           gl_mio_io2x_sync_en_c1;

input		tcu_mio_jtag_membist_mode; 
input		dbg1_mio_sel_niu_debug_mode;
input           dbg1_mio_sel_pcix_debug_mode;
input           dbg1_mio_sel_soc_obs_mode;
input [1:0]     dbg1_mio_drv_imped;
///////////////////////////////////////////////////////

////// New signals added 02/10/05 //////
input		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;
input		tcu_pce_ov;
input		scan_in;
output		scan_out;

// Boundary Scan:
input		tcu_mio_bs_scan_in;
input		tcu_mio_bs_highz_l;
output		mio_tcu_bs_scan_out;
input		tcu_mio_bs_scan_en;
input		tcu_mio_bs_clk;
input		tcu_mio_bs_aclk;
input		tcu_mio_bs_bclk;
input		tcu_mio_bs_uclk;
input		tcu_mio_bs_mode_ctl;


wire   [7:0]    dbg0_mio_debug_bus_a_r;
wire   [7:0]    dbg0_mio_debug_bus_b_r;

n2_pcm_main_blk  mio_pcm_module 
        (
	.pmi		(PMI[1:0]),
	.pmo		(PMO),
        .sel_m3         (1'b0),
        .vdd_pcm        (1'b1),
        .vss_pcm        (1'b0),
        .vddo_pcm       (VDDO_PCM),
	.burnin_pcm	(io_burnin),
	.pcm_reset_l	(mio_rst_pwron_rst_l),
	.sel59		(sel59),
	.sel60		(sel60),
	.sel61		(sel61),
	.ro_in		(ro_in)
        );

        

clkgen_mio_cmp mio_clk_header_cmp_clk_0
        (
        .l2clk                  (l2clk_0                ),
        .aclk                   (aclk                   ),
        .bclk                   (bclk                   ),
        .scan_out               (mio_clk_header_cmp_clk_0_scan_out),
        .pce_ov                 (ce_ovrd                ),
        .aclk_wmr               (                       ),
        .wmr_protect            (			),
        .wmr_                   (			),
        .por_                   (			),
        .cmp_slow_sync_en       (cmp_io2x_sync_en_out_0 ),
        .slow_cmp_sync_en       (                       ),
        .tcu_clk_stop           (gl_mio_clk_stop_c3     ),
        .tcu_pce_ov             (tcu_pce_ov             ),
        .rst_wmr_protect        (1'b0        		),
        .rst_wmr_               (1'b0               	),
        .rst_por_               (1'b0               	),
        .ccu_cmp_slow_sync_en   (gl_mio_io2x_sync_en_c3 ),
        .ccu_slow_cmp_sync_en   (1'b0                   ),
        .tcu_div_bypass         (1'b0                   ),
        .ccu_div_ph             (1'b1                   ),
        .cluster_div_en         (1'b0                   ),
        .gclk                   (gclk_0                 ),
        .cluster_arst_l         (cluster_arst_l         ),
        .clk_ext                (1'b0                   ),
        .ccu_serdes_dtm         (1'b0                   ),
        .tcu_wr_inhibit         (1'b0                   ),
        .tcu_atpg_mode          (tcu_atpg_mode          ),
        .array_wr_inhibit       (                       ),
        .tcu_aclk               (tcu_aclk               ),
        .tcu_bclk               (tcu_bclk               ),
        .scan_in	        (mio_clk_header_cmp_clk_0_scan_in),
        .scan_en                (tcu_scan_en            )
        );


clkgen_mio_cmp mio_clk_header_cmp_clk_1
        (
        .l2clk                  (l2clk_1                ),
        .scan_out               (mio_clk_header_cmp_clk_1_scan_out),
        .scan_in                (mio_clk_header_cmp_clk_1_scan_in),
        .aclk                   (			),
        .bclk                   (			),
        .pce_ov                 (			),
        .wmr_protect            (                       ),
        .wmr_                   (                       ),
        .por_                   (                       ),
        .aclk_wmr               (                       ),
        .slow_cmp_sync_en       (                       ),
        .cmp_slow_sync_en       (cmp_io2x_sync_en_out_1 ),
        .tcu_clk_stop           (gl_mio_clk_stop_c2_left),
        .tcu_pce_ov             (tcu_pce_ov             ),
        .rst_wmr_protect        (1'b0                   ),
        .rst_wmr_               (1'b0                   ),
        .rst_por_               (1'b0                   ),
        .ccu_cmp_slow_sync_en   (gl_mio_io2x_sync_en_c2_left),
        .ccu_slow_cmp_sync_en   (1'b0                   ),
        .tcu_div_bypass         (1'b0                   ),
        .ccu_div_ph             (1'b1                   ),
        .cluster_div_en         (1'b0                   ),
        .gclk                   (gclk_1                 ),
        .scan_en                (tcu_scan_en            ),
        .clk_ext                (1'b0                   ),
        .ccu_serdes_dtm         (1'b0                   ),
        .cluster_arst_l         (cluster_arst_l         ),
        .tcu_wr_inhibit         (1'b0                   ),
        .tcu_atpg_mode          (tcu_atpg_mode          ),
        .array_wr_inhibit       (                       ),
        .tcu_aclk               (tcu_aclk               ),
        .tcu_bclk               (tcu_bclk               )
        );

clkgen_mio_cmp mio_clk_header_cmp_clk_2
        (
        .l2clk                  (l2clk_2                ),
        .scan_out               (mio_clk_header_cmp_clk_2_scan_out),
        .scan_in                (mio_clk_header_cmp_clk_2_scan_in),
        .aclk                   (			),
        .bclk                   (			),
        .pce_ov                 (			),
        .wmr_protect            (                       ),
        .wmr_                   (                       ),
        .por_                   (                       ),
        .aclk_wmr               (                       ),
        .slow_cmp_sync_en       (                       ),
        .cmp_slow_sync_en       (cmp_io2x_sync_en_out_2 ),
        .tcu_clk_stop           (gl_mio_clk_stop_c2_right),
        .tcu_pce_ov             (tcu_pce_ov             ),
        .rst_wmr_protect        (1'b0                   ),
        .rst_wmr_               (1'b0                   ),
        .rst_por_               (1'b0                   ),
        .ccu_cmp_slow_sync_en   (gl_mio_io2x_sync_en_c2_right),
        .ccu_slow_cmp_sync_en   (1'b0                   ),
        .tcu_div_bypass         (1'b0                   ),
        .ccu_div_ph             (1'b1                   ),
        .cluster_div_en         (1'b0                   ),
        .gclk                   (gclk_2                 ),
        .scan_en                (tcu_scan_en            ),
        .clk_ext                (1'b0                   ),
        .ccu_serdes_dtm         (1'b0                   ),
        .cluster_arst_l         (cluster_arst_l         ),
        .tcu_wr_inhibit         (1'b0                   ),
        .tcu_atpg_mode          (tcu_atpg_mode          ),
        .array_wr_inhibit       (                       ),
        .tcu_aclk               (tcu_aclk               ),
        .tcu_bclk               (tcu_bclk               )
        );

clkgen_mio_cmp mio_clk_header_cmp_clk_3
        (
        .l2clk                  (l2clk_3                ),
        .scan_out               (mio_clk_header_cmp_clk_3_scan_out),
        .scan_in                (mio_clk_header_cmp_clk_3_scan_in),
        .aclk                   (			),
        .bclk                   (			),
        .pce_ov                 (			),
        .wmr_protect            (                       ),
        .wmr_                   (                       ),
        .por_                   (                       ),
        .aclk_wmr               (                       ),
        .slow_cmp_sync_en       (                       ),
        .cmp_slow_sync_en       (cmp_io2x_sync_en_out_3 ),
        .tcu_clk_stop           (gl_mio_clk_stop_c1     ),
        .tcu_pce_ov             (tcu_pce_ov             ),
        .rst_wmr_protect        (1'b0                   ),
        .rst_wmr_               (1'b0                   ),
        .rst_por_               (1'b0                   ),
        .ccu_cmp_slow_sync_en   (gl_mio_io2x_sync_en_c1 ),
        .ccu_slow_cmp_sync_en   (1'b0                   ),
        .tcu_div_bypass         (1'b0                   ),
        .ccu_div_ph             (1'b1                   ),
        .cluster_div_en         (1'b0                   ),
        .gclk                   (gclk_3                 ),
        .scan_en                (tcu_scan_en            ),
        .clk_ext                (1'b0                   ),
        .ccu_serdes_dtm         (1'b0                   ),
        .cluster_arst_l         (cluster_arst_l         ),
        .tcu_wr_inhibit         (1'b0                   ),
        .tcu_atpg_mode          (tcu_atpg_mode          ),
        .array_wr_inhibit       (                       ),
        .tcu_aclk               (tcu_aclk               ),
        .tcu_bclk               (tcu_bclk               )
        );



clkgen_mio_io mio_clk_header_iol2clk
        (
        .l2clk                  (iol2clk                ),
        .scan_out               (mio_clk_header_iol2clk_scan_out),
        .scan_in	 	(mio_clk_header_iol2clk_scan_in),
        .aclk                   (                       ),
        .bclk                   (                       ),
        .pce_ov                 (                       ),
        .wmr_protect            (                       ),
        .wmr_                   (                       ),
        .por_                   (                       ),
        .aclk_wmr               (	                ),
        .slow_cmp_sync_en       (                       ),
        .cmp_slow_sync_en       (                       ),
        .tcu_clk_stop           (gl_mio_clk_stop_c2_left),
        .tcu_pce_ov             (tcu_pce_ov             ),
        .rst_wmr_protect        (1'b0			),
        .rst_wmr_               (1'b0			),
        .rst_por_               (1'b0			),
        .ccu_cmp_slow_sync_en   (1'b0                   ),
        .ccu_slow_cmp_sync_en   (1'b0                   ),
        .tcu_div_bypass         (tcu_div_bypass         ),
        .ccu_div_ph             (ccu_io_out             ),
        .cluster_div_en         (1'b1                   ),
        .gclk                   (gclk_1                 ),
        .clk_ext                (1'b0                   ),
        .ccu_serdes_dtm         (1'b0                   ),
        .cluster_arst_l         (cluster_arst_l         ),
        .tcu_wr_inhibit         (1'b0                   ),
        .tcu_atpg_mode          (tcu_atpg_mode          ),
        .array_wr_inhibit       (                       ),
        .tcu_aclk               (tcu_aclk               ),
        .tcu_bclk               (tcu_bclk               ),
        .scan_en                (tcu_scan_en            )
        );


//////////////////////////////////////////////////////////

// io2x sync enable flops 

/////////////////////////////////////////////////////////

mio_syncreg_ctl io2xsyncen_reg3 (
                .scan_in		   (io2xsyncen_reg3_scanin),
                .scan_out		   (io2xsyncen_reg3_scanout),
                .l2clk                     (l2clk_3),
                .tcu_clk_stop              (1'b0),
                .cmp_io2x_sync_en_out      (cmp_io2x_sync_en_out_3),
                .cmp_io2x_sync_en_fnl      (cmp_io2x_sync_en_fnl_3),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
                );

mio_syncreg_ctl io2xsyncen_reg2 (
                .scan_in                   (io2xsyncen_reg2_scanin),
                .scan_out                  (io2xsyncen_reg2_scanout),
                .l2clk                     (l2clk_2),
                .tcu_clk_stop              (1'b0),
                .cmp_io2x_sync_en_out      (cmp_io2x_sync_en_out_2),
                .cmp_io2x_sync_en_fnl      (cmp_io2x_sync_en_fnl_2),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
                );

mio_syncreg_ctl io2xsyncen_reg1 (
                .scan_in                   (io2xsyncen_reg1_scanin),
                .scan_out                  (io2xsyncen_reg1_scanout),
                .l2clk                     (l2clk_1),
                .tcu_clk_stop              (1'b0),
                .cmp_io2x_sync_en_out      (cmp_io2x_sync_en_out_1),
                .cmp_io2x_sync_en_fnl      (cmp_io2x_sync_en_fnl_1),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
                );

mio_syncreg_ctl io2xsyncen_reg0 (
                .scan_in                   (io2xsyncen_reg0_scanin),
                .scan_out                  (io2xsyncen_reg0_scanout),
                .l2clk                     (l2clk_0),
                .tcu_clk_stop              (1'b0),
                .cmp_io2x_sync_en_out      (cmp_io2x_sync_en_out_0),
                .cmp_io2x_sync_en_fnl      (cmp_io2x_sync_en_fnl_0),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
                );

               

///////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// MUXSELECT CTL LOGIC
/////////////////////////////////////////////////////////////////////////////

mio_muxsel_ctl muxsel (
        .scan_in(muxsel_scanin),
        .scan_out(muxsel_scanout),
                .tcu_clk_stop              (1'b0),
        .iol2clk                  ( iol2clk ),
  .dbg0_mio_debug_bus_a(dbg0_mio_debug_bus_a[7:0]),
  .dbg0_mio_debug_bus_b(dbg0_mio_debug_bus_b[7:0]),
  .dbg0_mio_debug_bus_a_r(dbg0_mio_debug_bus_a_r[7:0]),
  .dbg0_mio_debug_bus_b_r(dbg0_mio_debug_bus_b_r[7:0]),
  .ncu_mio_ssi_mosi(ncu_mio_ssi_mosi),
  .ncu_mio_ssi_mosi_r(ncu_mio_ssi_mosi_r),
  .ncu_mio_ssi_sck(ncu_mio_ssi_sck),
  .ncu_mio_ssi_sck_r(ncu_mio_ssi_sck_r),
  .mio_ncu_ssi_miso_pin(mio_ncu_ssi_miso_pin),
  .mio_ncu_ssi_miso(mio_ncu_ssi_miso),
  .mio_testclkt(mio_testclkt),
  .mio_fsr_testclkt(mio_fsr_testclkt[7:0]),
  .mio_psr_testclkt(mio_psr_testclkt),
  .mio_esr_testclkt(mio_esr_testclkt),
  .mio_testclkr(mio_testclkr),
  .mio_fsr_testclkr(mio_fsr_testclkr[7:0]),
  .mio_psr_testclkr(mio_psr_testclkr),
  .mio_esr_testclkr(mio_esr_testclkr),
  .dbg1_mio_sel_niu_debug_mode(dbg1_mio_sel_niu_debug_mode),
  .dbg1_mio_sel_niu_debug_mode_l(dbg1_mio_sel_niu_debug_mode_l),
  .dbg1_mio_sel_pcix_debug_mode(dbg1_mio_sel_pcix_debug_mode),
  .dbg1_mio_sel_pcix_debug_mode_l(dbg1_mio_sel_pcix_debug_mode_l),
  .dbg1_mio_sel_soc_obs_mode(dbg1_mio_sel_soc_obs_mode),
  .dbg1_mio_sel_soc_obs_mode_l(dbg1_mio_sel_soc_obs_mode_l),
  .mio_tcu_testmode(mio_tcu_testmode),
  .mio_tcu_testmode_l(mio_tcu_testmode_l),
  .tcu_mio_jtag_membist_mode(tcu_mio_jtag_membist_mode),
  .tcu_mio_jtag_membist_mode_l(tcu_mio_jtag_membist_mode_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
        );

/////////////////////////////////////////////////////////////////////////////
// MIO CELL INSTANTIATIONS
/////////////////////////////////////////////////////////////////////////////

n2_mio_cell_out_bscan cell_6 (
        .data_oe                ( 1'b1 ),
        .bs_scan_in             (cell_6_bscan_in),
        .bs_scan_out		(cell_6_bscan_out),
        .pad                    ( XAUI_MDC ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
        .ain_mux_data           ( 1'b0 ),
        .bin_mux_data           ( 1'b0 ),
        .cin_mux_data           ( mdc ),
        .ain_mux_sel            ( 1'b0 ),
        .bin_mux_sel            ( 1'b0 ),
        .cin_mux_sel            ( 1'b1 ),
        .scan_in(cell_6_scanin),
        .scan_out(cell_6_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
        .l2clk                  ( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped({1'b0,1'b1}),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
        );

n2_mio_cell_bi_od_bscan cell_211 (
	.data_to_core		( mdi ),
	.bs_scan_in		(cell_211_bscan_in),
	.bs_scan_out		(cell_211_bscan_out),
	.pad			( XAUI_MDIO ),
        .ain_mux_data           ( 1'b0 ),
        .bin_mux_data           ( 1'b0 ),
        .cin_mux_data           ( mdoe ),
        .ain_mux_sel            ( 1'b0 ),
        .bin_mux_sel            ( 1'b0 ),
        .cin_mux_sel            ( 1'b1 ),
        .scan_in(cell_211_scanin),
        .scan_out(cell_211_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
        .l2clk                  ( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_18 (
        .data_oe                ( 1'b1 ),
        .bs_scan_in             (cell_18_bscan_in),
        .bs_scan_out		(cell_18_bscan_out),
        .pad                    ( XAUI0_ACT_LED ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
        .ain_mux_data           ( 1'b0 ),
        .bin_mux_data           ( 1'b0 ),
        .cin_mux_data           ( xaui_act_led_0 ),
        .ain_mux_sel            ( 1'b0 ),
        .bin_mux_sel            ( 1'b0 ),
        .cin_mux_sel            ( 1'b1 ),
        .scan_in(cell_18_scanin),
        .scan_out(cell_18_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
        .l2clk                  ( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
        );

n2_mio_cell_out_bscan cell_17 (
        .data_oe                ( 1'b1 ),
        .bs_scan_in             (cell_17_bscan_in),
        .bs_scan_out		(cell_17_bscan_out),
        .pad                    ( XAUI0_LINK_LED ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
        .ain_mux_data           ( 1'b0 ),
        .bin_mux_data           ( 1'b0 ),
        .cin_mux_data           ( xaui_link_led_0 ),
        .ain_mux_sel            ( 1'b0 ),
        .bin_mux_sel            ( 1'b0 ),
        .cin_mux_sel            ( 1'b1 ),
        .scan_in(cell_17_scanin),
        .scan_out(cell_17_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
        .l2clk                  ( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
        );


n2_mio_cell_out_bscan cell_210 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_210_bscan_in),
	.bs_scan_out		(cell_210_bscan_out),
	.pad			( XAUI1_ACT_LED ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( xaui_act_led_1 ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
	.scan_in(cell_210_scanin),
	.scan_out(cell_210_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_209 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_209_bscan_in),
	.bs_scan_out		(cell_209_bscan_out),
	.pad			( XAUI1_LINK_LED ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( xaui_link_led_1 ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
	.scan_in(cell_209_scanin),
	.scan_out(cell_209_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_in cell_19 (
        .data_to_core           ( mio_efu_prgm_en ),
        .pad                    ( PGRM_EN )
        );


n2_mio_cell_in cell_208 (
	.data_to_core		( mio_tcu_tck ),
	.pad			( TCK )
	);

n2_mio_cell_in_pu cell_207 (
	.data_to_core		( mio_tcu_tdi ),
	.pad			( TDI )
	);

n2_mio_cell_out cell_206 (
	.data_oe		( tcu_mio_tdo_en ),
	.pad			( TDO ),
	.data_from_core		( tcu_mio_tdo ),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0])
	);

n2_mio_cell_in_pu cell_205 (
	.data_to_core		( mio_tcu_tms ),
	.pad			( TMS )
	);

n2_mio_cell_in_pu cell_204 (
	.data_to_core		( mio_tcu_trst_l ),
	.pad			( TRST_L )
	);

n2_mio_cell_in_pd_bscan cell_203 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_tcu_testmode ),
	.bs_scan_in		(cell_203_bscan_in),
	.bs_scan_out		(cell_203_bscan_out),
	.pad			( TESTMODE ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_out_bscan cell_202 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_202_bscan_in),
	.bs_scan_out		(cell_202_bscan_out),
	.pad			( STCIQ ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_stciq ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
	.scan_in(cell_202_scanin),
	.scan_out(cell_202_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_in_pd_bscan cell_201 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_tcu_stcid ),
	.bs_scan_in		(cell_201_bscan_in),
	.bs_scan_out		(cell_201_bscan_out),
	.pad			( STCID ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_pd_bscan cell_200 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_tcu_stcicfg[1] ),
	.bs_scan_in		(cell_200_bscan_in),
	.bs_scan_out		(cell_200_bscan_out),
	.pad			( STCICFG[1] ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_pd_bscan cell_199 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_tcu_stcicfg[0] ),
	.bs_scan_in		(cell_199_bscan_in),
	.bs_scan_out		(cell_199_bscan_out),
	.pad			( STCICFG[0] ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_pd_bscan cell_198 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_tcu_stciclk ),
	.bs_scan_in		(cell_198_bscan_in),
	.bs_scan_out		(cell_198_bscan_out),
	.pad			( STCICLK ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_pd_bscan cell_197 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_testclkt ),
	.bs_scan_in		(cell_197_bscan_in),
	.bs_scan_out		(cell_197_bscan_out),
	.pad			( TESTCLKT ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_pd_bscan cell_196 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_testclkr ),
	.bs_scan_in		(cell_196_bscan_in),
	.bs_scan_out		(cell_196_bscan_out),
	.pad			( TESTCLKR ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_bscan cell_195 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_tcu_divider_bypass ),
	.bs_scan_in		(cell_195_bscan_in),
	.bs_scan_out		(cell_195_bscan_out),
	.pad			( DIVIDER_BYPASS ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_bscan cell_194 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_tcu_pll_cmp_bypass ),
	.bs_scan_in		(cell_194_bscan_in),
	.bs_scan_out		(cell_194_bscan_out),
	.pad			( PLL_CMP_BYPASS ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_bi_pu_bscan cell_193 (
        .data_oe                ( 1'b0 ),
        .data_to_core           ( mio_mac_xaui_mdint1_l),
        .bs_scan_in             (cell_193_bscan_in),
        .bs_scan_out            (cell_193_bscan_out),
        .pad                    ( XAUI_MDINT1_L ),
        .dtm_data               ( 1'b0 ),
        .ain_mux_data           ( 1'b0 ),
        .bin_mux_data           ( 1'b0 ),
        .cin_mux_data           ( 1'b0 ),
        .ain_mux_sel            ( 1'b0 ),
        .bin_mux_sel            ( 1'b0 ),
        .cin_mux_sel            ( 1'b1 ),
        .tcu_clk_stop              (1'b0),
        .scan_in(cell_193_scanin),
        .scan_out(cell_193_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .l2clk                  ( l2clk_3 ),
        .ccu_mio_serdes_dtm(1'b0),
        .tcu_mio_bs_clk(tcu_mio_bs_clk),
        .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
        .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
        .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
        .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
        .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
        .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
        .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
        .tcu_aclk(tcu_aclk),
        .tcu_bclk(tcu_bclk),
        .tcu_scan_en(tcu_scan_en),
        .tcu_pce_ov(tcu_pce_ov)
        );



n2_mio_cell_bi_pu_bscan cell_23 (
        .data_oe                ( 1'b0 ),
        .data_to_core           (mio_mac_xaui_mdint0_l),
        .bs_scan_in             (cell_23_bscan_in),
        .bs_scan_out            (cell_23_bscan_out),
        .pad                    ( XAUI_MDINT0_L ),
        .dtm_data               ( 1'b0 ),
        .ain_mux_data           ( 1'b0 ),
        .bin_mux_data           ( 1'b0 ),
        .cin_mux_data           ( 1'b0 ),
        .ain_mux_sel            ( 1'b0 ),
        .bin_mux_sel            ( 1'b0 ),
        .cin_mux_sel            ( 1'b1 ),
        .tcu_clk_stop              (1'b0),
        .scan_in(cell_23_scanin),
        .scan_out(cell_23_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .l2clk                  ( l2clk_3 ),
        .ccu_mio_serdes_dtm(1'b0),
        .tcu_mio_bs_clk(tcu_mio_bs_clk),
        .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
        .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
        .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
        .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
        .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
        .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
        .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
        .tcu_aclk(tcu_aclk),
        .tcu_bclk(tcu_bclk),
        .tcu_scan_en(tcu_scan_en),
        .tcu_pce_ov(tcu_pce_ov)
        );


n2_mio_cell_out_bscan cell_192 (
	.data_oe		( dbg1_mio_drv_en_op_only ),
	.bs_scan_in		(cell_192_bscan_in),
	.bs_scan_out		(cell_192_bscan_out),
	.pad			( DBG_CK0 ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
        .cmp_io2x_sync_en_fnl   ( 1'b1 ), // always enabled
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.scan_in(cell_192_scanin),
	.scan_out(cell_192_scanout),
	.cin_mux_data		( iol2clk ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_191 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_191_bscan_in),
	.bs_scan_out		(cell_191_bscan_out),
	.pad			( DBG_DQ[165] ),
        .dtm_data               ( peu_mio_pipe_txdata[63]),
	.ain_mux_data		( dbg1_mio_dbg_dq[165] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( rst_mio_rst_state[5]),
	.ain_mux_sel		( dbg1_mio_sel_soc_obs_mode_l),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_soc_obs_mode ),
	.scan_in(cell_191_scanin),
	.scan_out(cell_191_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_190 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_190_bscan_in),
	.bs_scan_out		(cell_190_bscan_out),
	.pad			( DBG_DQ[164] ),
        .dtm_data               ( peu_mio_pipe_txdata[62]),
	.ain_mux_data		( dbg1_mio_dbg_dq[164] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( rst_mio_rst_state[4] ),
	.ain_mux_sel		( dbg1_mio_sel_soc_obs_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_soc_obs_mode ),
	.scan_in(cell_190_scanin),
	.scan_out(cell_190_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_189 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_189_bscan_in),
	.bs_scan_out		(cell_189_bscan_out),
	.pad			( DBG_DQ[163] ),
        .dtm_data               ( peu_mio_pipe_txdata[61]),
	.ain_mux_data		( dbg1_mio_dbg_dq[163] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( rst_mio_rst_state[3] ),
	.ain_mux_sel		( dbg1_mio_sel_soc_obs_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_soc_obs_mode ),
	.scan_in(cell_189_scanin),
	.scan_out(cell_189_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_188 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_188_bscan_in),
	.bs_scan_out		(cell_188_bscan_out),
	.pad			( DBG_DQ[162] ),
        .dtm_data               ( peu_mio_pipe_txdata[60]),
	.ain_mux_data		( dbg1_mio_dbg_dq[162] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( rst_mio_rst_state[2] ),
	.ain_mux_sel		( dbg1_mio_sel_soc_obs_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_soc_obs_mode ),
	.scan_in(cell_188_scanin),
	.scan_out(cell_188_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_187 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_187_bscan_in),
	.bs_scan_out		(cell_187_bscan_out),
	.pad			( DBG_DQ[161] ),
        .dtm_data               ( peu_mio_pipe_txdata[59]),
	.ain_mux_data		( dbg1_mio_dbg_dq[161] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( rst_mio_rst_state[1] ),
	.ain_mux_sel		( dbg1_mio_sel_soc_obs_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_soc_obs_mode ),
	.scan_in(cell_187_scanin),
	.scan_out(cell_187_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_186 (
	.data_oe		( dbg1_mio_drv_en_op_only ),
	.bs_scan_in		(cell_186_bscan_in),
	.bs_scan_out		(cell_186_bscan_out),
	.pad			( DBG_DQ[160] ),
        .dtm_data               ( peu_mio_pipe_txdata[58]),
	.ain_mux_data		( dbg1_mio_dbg_dq[160] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( rst_mio_rst_state[0] ),
	.ain_mux_sel		( dbg1_mio_sel_soc_obs_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_soc_obs_mode ),
	.scan_in(cell_186_scanin),
	.scan_out(cell_186_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_185 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_185_bscan_in),
	.bs_scan_out		(cell_185_bscan_out),
	.pad			( DBG_DQ[159] ),
        .dtm_data               ( peu_mio_pipe_txdata[57]),
	.ain_mux_data		( dbg1_mio_dbg_dq[159] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_scan_out31 ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_185_scanin),
	.scan_out(cell_185_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_184 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_scan_in31 ),
	.bs_scan_in		(cell_184_bscan_in),
	.bs_scan_out		(cell_184_bscan_out),
	.pad			( DBG_DQ[158] ),
        .dtm_data               ( peu_mio_pipe_txdata[56]),
	.ain_mux_data		( dbg1_mio_dbg_dq[158] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_184_scanin),
	.scan_out(cell_184_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pd_bscan cell_183 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp),
        .data_to_core           ( mio_ccu_pll_char_in),
	.bs_scan_in		(cell_183_bscan_in),
	.bs_scan_out		(cell_183_bscan_out),
	.pad			( DBG_DQ[157] ),
        .dtm_data               ( peu_mio_pipe_txdata[55]),
	.ain_mux_data		( dbg1_mio_dbg_dq[157] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[31] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_183_scanin),
	.scan_out(cell_183_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pu_bscan cell_182 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div2[5] ),
	.bs_scan_in		(cell_182_bscan_in),
	.bs_scan_out		(cell_182_bscan_out),
	.pad			( DBG_DQ[156] ),
        .dtm_data               ( peu_mio_pipe_txdata[54]),
	.ain_mux_data		( dbg1_mio_dbg_dq[156] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[30] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_182_scanin),
	.scan_out(cell_182_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pu_bscan cell_181 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div2[4] ),
	.bs_scan_in		(cell_181_bscan_in),
	.bs_scan_out		(cell_181_bscan_out),
	.pad			( DBG_DQ[155] ),
        .dtm_data               ( peu_mio_pipe_txdata[53]),
	.ain_mux_data		( dbg1_mio_dbg_dq[155] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[29] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_181_scanin),
	.scan_out(cell_181_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pu_bscan cell_180 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div2[3] ),
	.bs_scan_in		(cell_180_bscan_in),
	.bs_scan_out		(cell_180_bscan_out),
	.pad			( DBG_DQ[154] ),
        .dtm_data               ( peu_mio_pipe_txdata[52]),
	.ain_mux_data		( dbg1_mio_dbg_dq[154] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[28] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_180_scanin),
	.scan_out(cell_180_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pu_bscan cell_179 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div2[2] ),
	.bs_scan_in		(cell_179_bscan_in),
	.bs_scan_out		(cell_179_bscan_out),
	.pad			( DBG_DQ[153] ),
        .dtm_data               ( peu_mio_pipe_txdata[51]),
	.ain_mux_data		( dbg1_mio_dbg_dq[153] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[27] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_179_scanin),
	.scan_out(cell_179_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pu_bscan cell_178 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div2[1] ),
	.bs_scan_in		(cell_178_bscan_in),
	.bs_scan_out		(cell_178_bscan_out),
	.pad			( DBG_DQ[152] ),
        .dtm_data               ( peu_mio_pipe_txdata[50]),
	.ain_mux_data		( dbg1_mio_dbg_dq[152] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[26] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_178_scanin),
	.scan_out(cell_178_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pu_bscan cell_177 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div2[0] ),
	.bs_scan_in		(cell_177_bscan_in),
	.bs_scan_out		(cell_177_bscan_out),
	.pad			( DBG_DQ[151] ),
        .dtm_data               ( peu_mio_pipe_txdata[49]),
	.ain_mux_data		( dbg1_mio_dbg_dq[151] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[25] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_177_scanin),
	.scan_out(cell_177_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pu_bscan cell_176 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_trst_l ),
	.bs_scan_in		(cell_176_bscan_in),
	.bs_scan_out		(cell_176_bscan_out),
	.pad			( DBG_DQ[150] ),
        .dtm_data               ( peu_mio_pipe_txdata[48]),
	.ain_mux_data		( dbg1_mio_dbg_dq[150] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[24] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_176_scanin),
	.scan_out(cell_176_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pd_bscan cell_175 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_clamp_fltr ),
	.bs_scan_in		(cell_175_bscan_in),
	.bs_scan_out		(cell_175_bscan_out),
	.pad			( DBG_DQ[149] ),
        .dtm_data               ( peu_mio_pipe_txdata[47]),
	.ain_mux_data		( dbg1_mio_dbg_dq[149] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[23] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_175_scanin),
	.scan_out(cell_175_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_174 (
	.data_oe		( dbg1_mio_drv_en_op_only ),
	.bs_scan_in		(cell_174_bscan_in),
	.bs_scan_out		(cell_174_bscan_out),
	.pad			( DBG_DQ[148] ),
        .dtm_data               ( peu_mio_pipe_txdata[46]),
	.ain_mux_data		( dbg1_mio_dbg_dq[148] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[22] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_174_scanin),
	.scan_out(cell_174_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_173 (
	.data_oe		( dbg1_mio_drv_en_op_only ),
	.bs_scan_in		(cell_173_bscan_in),
	.bs_scan_out		(cell_173_bscan_out),
	.pad			( DBG_DQ[147] ),
        .dtm_data               ( peu_mio_pipe_txdata[45]),
	.ain_mux_data		( dbg1_mio_dbg_dq[147] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[21] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_173_scanin),
	.scan_out(cell_173_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pd_bscan cell_172 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div4[6] ),
	.bs_scan_in		(cell_172_bscan_in),
	.bs_scan_out		(cell_172_bscan_out),
	.pad			( DBG_DQ[146] ),
        .dtm_data               ( peu_mio_pipe_txdata[44]),
	.ain_mux_data		( dbg1_mio_dbg_dq[146] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[20] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_172_scanin),
	.scan_out(cell_172_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pd_bscan cell_171 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div4[5] ),
	.bs_scan_in		(cell_171_bscan_in),
	.bs_scan_out		(cell_171_bscan_out),
	.pad			( DBG_DQ[145] ),
        .dtm_data               ( peu_mio_pipe_txdata[43]),
	.ain_mux_data		( dbg1_mio_dbg_dq[145] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[19] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_171_scanin),
	.scan_out(cell_171_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pd_bscan cell_170 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div4[4] ),
	.bs_scan_in		(cell_170_bscan_in),
	.bs_scan_out		(cell_170_bscan_out),
	.pad			( DBG_DQ[144] ),
        .dtm_data               ( peu_mio_pipe_txdata[42]),
	.ain_mux_data		( dbg1_mio_dbg_dq[144] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[18] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_170_scanin),
	.scan_out(cell_170_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pd_bscan cell_169 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div4[3] ),
	.bs_scan_in		(cell_169_bscan_in),
	.bs_scan_out		(cell_169_bscan_out),
	.pad			( DBG_DQ[143] ),
        .dtm_data               ( peu_mio_pipe_txdata[41]),
	.ain_mux_data		( dbg1_mio_dbg_dq[143] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[17] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_169_scanin),
	.scan_out(cell_169_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pd_bscan cell_168 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div4[2] ),
	.bs_scan_in		(cell_168_bscan_in),
	.bs_scan_out		(cell_168_bscan_out),
	.pad			( DBG_DQ[142] ),
        .dtm_data               ( peu_mio_pipe_txdata[40]),
	.ain_mux_data		( dbg1_mio_dbg_dq[142] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[16] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_168_scanin),
	.scan_out(cell_168_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pd_bscan cell_167 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div4[1]),
	.bs_scan_in		(cell_167_bscan_in),
	.bs_scan_out		(cell_167_bscan_out),
	.pad			( DBG_DQ[141] ),
        .dtm_data               ( peu_mio_pipe_txdata[39]),
	.ain_mux_data		( dbg1_mio_dbg_dq[141] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[15] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_167_scanin),
	.scan_out(cell_167_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_pd_bscan cell_166 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ccu_pll_div4[0]),
	.bs_scan_in		(cell_166_bscan_in),
	.bs_scan_out		(cell_166_bscan_out),
	.pad			( DBG_DQ[140] ),
        .dtm_data               ( peu_mio_pipe_txdata[38]),
	.ain_mux_data		( dbg1_mio_dbg_dq[140] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[14] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_166_scanin),
	.scan_out(cell_166_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_165 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp ),
	.data_to_core		( mio_ext_dr_clk ),
	.bs_scan_in		(cell_165_bscan_in),
	.bs_scan_out		(cell_165_bscan_out),
	.pad			( DBG_DQ[139] ),
        .dtm_data               ( peu_mio_pipe_txdata[37]),
	.ain_mux_data		( dbg1_mio_dbg_dq[139] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[13] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_165_scanin),
	.scan_out(cell_165_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_164 (
	.data_oe		( dbg1_mio_drv_en_muxtestpll_inp),
        .data_to_core           ( mio_ext_cmp_clk),
	.bs_scan_in		(cell_164_bscan_in),
	.bs_scan_out		(cell_164_bscan_out),
	.pad			( DBG_DQ[138] ),
        .dtm_data               ( peu_mio_pipe_txdata[36]),
	.ain_mux_data		( dbg1_mio_dbg_dq[138] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[12] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_164_scanin),
	.scan_out(cell_164_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_163 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_ac_testmode ),
	.bs_scan_in		(cell_163_bscan_in),
	.bs_scan_out		(cell_163_bscan_out),
	.pad			( DBG_DQ[137] ),
        .dtm_data               ( peu_mio_pipe_txdata[35]),
	.ain_mux_data		( dbg1_mio_dbg_dq[137] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[11] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_163_scanin),
	.scan_out(cell_163_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_162 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_ac_testtrig ),
	.bs_scan_in		(cell_162_bscan_in),
	.bs_scan_out		(cell_162_bscan_out),
	.pad			( DBG_DQ[136] ),
        .dtm_data               ( peu_mio_pipe_txdata[34]),
	.ain_mux_data		( dbg1_mio_dbg_dq[136] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[10] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_162_scanin),
	.scan_out(cell_162_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_161 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_aclk ),
	.bs_scan_in		(cell_161_bscan_in),
	.bs_scan_out		(cell_161_bscan_out),
	.pad			( DBG_DQ[135] ),
        .dtm_data               ( peu_mio_pipe_txdata[33]),
	.ain_mux_data		( dbg1_mio_dbg_dq[135] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[9] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_161_scanin),
	.scan_out(cell_161_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_160 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_bclk ),
	.bs_scan_in		(cell_160_bscan_in),
	.bs_scan_out		(cell_160_bscan_out),
	.pad			( DBG_DQ[134] ),
        .dtm_data               ( peu_mio_pipe_txdata[32]),
	.ain_mux_data		( dbg1_mio_dbg_dq[134] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[8] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_160_scanin),
	.scan_out(cell_160_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_159 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[30] ),
	.bs_scan_in		(cell_159_bscan_in),
	.bs_scan_out		(cell_159_bscan_out),
	.pad			( DBG_DQ[133] ),
        .dtm_data               ( peu_mio_pipe_txdata[31]),
	.ain_mux_data		( dbg1_mio_dbg_dq[133] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[7] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_159_scanin),
	.scan_out(cell_159_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_158 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[29] ),
	.bs_scan_in		(cell_158_bscan_in),
	.bs_scan_out		(cell_158_bscan_out),
	.pad			( DBG_DQ[132] ),
        .dtm_data               ( peu_mio_pipe_txdata[30]),
	.ain_mux_data		( dbg1_mio_dbg_dq[132] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[6] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_158_scanin),
	.scan_out(cell_158_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_157 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[28] ),
	.bs_scan_in		(cell_157_bscan_in),
	.bs_scan_out		(cell_157_bscan_out),
	.pad			( DBG_DQ[131] ),
        .dtm_data               ( peu_mio_pipe_txdata[29]),
	.ain_mux_data		( dbg1_mio_dbg_dq[131] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[5] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_157_scanin),
	.scan_out(cell_157_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_156 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[27] ),
	.bs_scan_in		(cell_156_bscan_in),
	.bs_scan_out		(cell_156_bscan_out),
	.pad			( DBG_DQ[130] ),
        .dtm_data               ( peu_mio_pipe_txdata[28]),
	.ain_mux_data		( dbg1_mio_dbg_dq[130] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[4] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_156_scanin),
	.scan_out(cell_156_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_155 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[26] ),
	.bs_scan_in		(cell_155_bscan_in),
	.bs_scan_out		(cell_155_bscan_out),
	.pad			( DBG_DQ[129] ),
        .dtm_data               ( peu_mio_pipe_txdata[27]),
	.ain_mux_data		( dbg1_mio_dbg_dq[129] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[3] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_155_scanin),
	.scan_out(cell_155_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_154 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[25] ),
	.bs_scan_in		(cell_154_bscan_in),
	.bs_scan_out		(cell_154_bscan_out),
	.pad			( DBG_DQ[128] ),
        .dtm_data               ( peu_mio_pipe_txdata[26]),
	.ain_mux_data		( dbg1_mio_dbg_dq[128] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[2] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_154_scanin),
	.scan_out(cell_154_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_153 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[24] ),
	.bs_scan_in		(cell_153_bscan_in),
	.bs_scan_out		(cell_153_bscan_out),
	.pad			( DBG_DQ[127] ),
        .dtm_data               ( peu_mio_pipe_txdata[25]),
	.ain_mux_data		( dbg1_mio_dbg_dq[127] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[1] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_153_scanin),
	.scan_out(cell_153_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_152 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[23] ),
	.bs_scan_in		(cell_152_bscan_in),
	.bs_scan_out		(cell_152_bscan_out),
	.pad			( DBG_DQ[126] ),
        .dtm_data               ( peu_mio_pipe_txdata[24]),
	.ain_mux_data		( dbg1_mio_dbg_dq[126] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_data[0] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_152_scanin),
	.scan_out(cell_152_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_151 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[22] ),
	.bs_scan_in		(cell_151_bscan_in),
	.bs_scan_out		(cell_151_bscan_out),
	.pad			( DBG_DQ[125] ),
        .dtm_data               ( peu_mio_pipe_txdata[23]),
	.ain_mux_data		( dbg1_mio_dbg_dq[125] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_clock[1] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_151_scanin),
	.scan_out(cell_151_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_150 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[21] ),
	.bs_scan_in		(cell_150_bscan_in),
	.bs_scan_out		(cell_150_bscan_out),
	.pad			( DBG_DQ[124] ),
        .dtm_data               ( peu_mio_pipe_txdata[22]),
	.ain_mux_data		( dbg1_mio_dbg_dq[124] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( niu_mio_debug_clock[0] ),
	.ain_mux_sel		( dbg1_mio_sel_niu_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_niu_debug_mode ),
	.scan_in(cell_150_scanin),
	.scan_out(cell_150_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_149 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[20] ),
	.bs_scan_in		(cell_149_bscan_in),
	.bs_scan_out		(cell_149_bscan_out),
	.pad			( DBG_DQ[123] ),
        .dtm_data               ( peu_mio_pipe_txdata[21]),
	.ain_mux_data		( dbg1_mio_dbg_dq[123] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_a_r[7] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_149_scanin),
	.scan_out(cell_149_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_148 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[19] ),
	.bs_scan_in		(cell_148_bscan_in),
	.bs_scan_out		(cell_148_bscan_out),
	.pad			( DBG_DQ[122] ),
        .dtm_data               ( peu_mio_pipe_txdata[20]),
	.ain_mux_data		( dbg1_mio_dbg_dq[122] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_a_r[6] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_148_scanin),
	.scan_out(cell_148_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_147 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[18] ),
	.bs_scan_in		(cell_147_bscan_in),
	.bs_scan_out		(cell_147_bscan_out),
	.pad			( DBG_DQ[121] ),
        .dtm_data               ( peu_mio_pipe_txdata[19]),
	.ain_mux_data		( dbg1_mio_dbg_dq[121] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_a_r[5] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_147_scanin),
	.scan_out(cell_147_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_146 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[17] ),
	.bs_scan_in		(cell_146_bscan_in),
	.bs_scan_out		(cell_146_bscan_out),
	.pad			( DBG_DQ[120] ),
        .dtm_data               ( peu_mio_pipe_txdata[18]),
	.ain_mux_data		( dbg1_mio_dbg_dq[120] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_a_r[4] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_146_scanin),
	.scan_out(cell_146_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_145 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[16] ),
	.bs_scan_in		(cell_145_bscan_in),
	.bs_scan_out		(cell_145_bscan_out),
	.pad			( DBG_DQ[119] ),
        .dtm_data               ( peu_mio_pipe_txdata[17]),
	.ain_mux_data		( dbg1_mio_dbg_dq[119] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_a_r[3] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_145_scanin),
	.scan_out(cell_145_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_144 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[15] ),
	.bs_scan_in		(cell_144_bscan_in),
	.bs_scan_out		(cell_144_bscan_out),
	.pad			( DBG_DQ[118] ),
        .dtm_data               ( peu_mio_pipe_txdata[16]),
	.ain_mux_data		( dbg1_mio_dbg_dq[118] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_a_r[2] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_144_scanin),
	.scan_out(cell_144_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_143 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[14] ),
	.bs_scan_in		(cell_143_bscan_in),
	.bs_scan_out		(cell_143_bscan_out),
	.pad			( DBG_DQ[117] ),
        .dtm_data               ( peu_mio_pipe_txdata[15]),
	.ain_mux_data		( dbg1_mio_dbg_dq[117] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_a_r[1] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_143_scanin),
	.scan_out(cell_143_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_142 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[13] ),
	.bs_scan_in		(cell_142_bscan_in),
	.bs_scan_out		(cell_142_bscan_out),
	.pad			( DBG_DQ[116] ),
        .dtm_data               ( peu_mio_pipe_txdata[14]),
	.ain_mux_data		( dbg1_mio_dbg_dq[116] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_a_r[0] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_142_scanin),
	.scan_out(cell_142_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_141 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[12] ),
	.bs_scan_in		(cell_141_bscan_in),
	.bs_scan_out		(cell_141_bscan_out),
	.pad			( DBG_DQ[115] ),
        .dtm_data               ( peu_mio_pipe_txdata[13]),
	.ain_mux_data		( dbg1_mio_dbg_dq[115] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_b_r[7] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_141_scanin),
	.scan_out(cell_141_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_140 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[11] ),
	.bs_scan_in		(cell_140_bscan_in),
	.bs_scan_out		(cell_140_bscan_out),
	.pad			( DBG_DQ[114] ),
        .dtm_data               ( peu_mio_pipe_txdata[12]),
	.ain_mux_data		( dbg1_mio_dbg_dq[114] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_b_r[6] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_140_scanin),
	.scan_out(cell_140_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_139 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[10] ),
	.bs_scan_in		(cell_139_bscan_in),
	.bs_scan_out		(cell_139_bscan_out),
	.pad			( DBG_DQ[113] ),
        .dtm_data               ( peu_mio_pipe_txdata[11]),
	.ain_mux_data		( dbg1_mio_dbg_dq[113] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_b_r[5] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_139_scanin),
	.scan_out(cell_139_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_138 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[9] ),
	.bs_scan_in		(cell_138_bscan_in),
	.bs_scan_out		(cell_138_bscan_out),
	.pad			( DBG_DQ[112] ),
        .dtm_data               ( peu_mio_pipe_txdata[10]),
	.ain_mux_data		( dbg1_mio_dbg_dq[112] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_b_r[4] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_138_scanin),
	.scan_out(cell_138_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_137 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[8] ),
	.bs_scan_in		(cell_137_bscan_in),
	.bs_scan_out		(cell_137_bscan_out),
	.pad			( DBG_DQ[111] ),
        .dtm_data               ( peu_mio_pipe_txdata[9]),
	.ain_mux_data		( dbg1_mio_dbg_dq[111] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_b_r[3] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_137_scanin),
	.scan_out(cell_137_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_136 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[7] ),
	.bs_scan_in		(cell_136_bscan_in),
	.bs_scan_out		(cell_136_bscan_out),
	.pad			( DBG_DQ[110] ),
        .dtm_data               ( peu_mio_pipe_txdata[8]),
	.ain_mux_data		( dbg1_mio_dbg_dq[110] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_b_r[2] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_136_scanin),
	.scan_out(cell_136_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_135 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[6] ),
	.bs_scan_in		(cell_135_bscan_in),
	.bs_scan_out		(cell_135_bscan_out),
	.pad			( DBG_DQ[109] ),
        .dtm_data               ( peu_mio_pipe_txdata[7]),
	.ain_mux_data		( dbg1_mio_dbg_dq[109] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_b_r[1] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_135_scanin),
	.scan_out(cell_135_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_134 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[5] ),
	.bs_scan_in		(cell_134_bscan_in),
	.bs_scan_out		(cell_134_bscan_out),
	.pad			( DBG_DQ[108] ),
        .dtm_data               ( peu_mio_pipe_txdata[6]),
	.ain_mux_data		( dbg1_mio_dbg_dq[108] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( dbg0_mio_debug_bus_b_r[0] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_134_scanin),
	.scan_out(cell_134_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_133 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[4] ),
	.bs_scan_in		(cell_133_bscan_in),
	.bs_scan_out		(cell_133_bscan_out),
	.pad			( DBG_DQ[107] ),
        .dtm_data               ( peu_mio_pipe_txdata[5]),
	.ain_mux_data		( dbg1_mio_dbg_dq[107] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_a[7] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_133_scanin),
	.scan_out(cell_133_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_132 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[3] ),
	.bs_scan_in		(cell_132_bscan_in),
	.bs_scan_out		(cell_132_bscan_out),
	.pad			( DBG_DQ[106] ),
        .dtm_data               ( peu_mio_pipe_txdata[4]),
	.ain_mux_data		( dbg1_mio_dbg_dq[106] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_a[6] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_132_scanin),
	.scan_out(cell_132_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_131 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[2] ),
	.bs_scan_in		(cell_131_bscan_in),
	.bs_scan_out		(cell_131_bscan_out),
	.pad			( DBG_DQ[105] ),
        .dtm_data               ( peu_mio_pipe_txdata[3]),
	.ain_mux_data		( dbg1_mio_dbg_dq[105] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_a[5] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_131_scanin),
	.scan_out(cell_131_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_130 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[1] ),
	.bs_scan_in		(cell_130_bscan_in),
	.bs_scan_out		(cell_130_bscan_out),
	.pad			( DBG_DQ[104] ),
        .dtm_data               ( peu_mio_pipe_txdata[2]),
	.ain_mux_data		( dbg1_mio_dbg_dq[104] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_a[4] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_130_scanin),
	.scan_out(cell_130_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_129 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_in[0] ),
	.bs_scan_in		(cell_129_bscan_in),
	.bs_scan_out		(cell_129_bscan_out),
	.pad			( DBG_DQ[103] ),
        .dtm_data               ( peu_mio_pipe_txdata[1]),
	.ain_mux_data		( dbg1_mio_dbg_dq[103] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_a[3] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_129_scanin),
	.scan_out(cell_129_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_128 (
	.data_oe		( dbg1_mio_drv_en_op_only ),
	.bs_scan_in		(cell_128_bscan_in),
	.bs_scan_out		(cell_128_bscan_out),
	.pad			( DBG_DQ[102] ),
        .dtm_data               ( peu_mio_pipe_txdata[0]),
	.ain_mux_data		( dbg1_mio_dbg_dq[102] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_a[2] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_128_scanin),
	.scan_out(cell_128_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_127 (
	.data_oe		( dbg1_mio_drv_en_op_only ),
	.bs_scan_in		(cell_127_bscan_in),
	.bs_scan_out		(cell_127_bscan_out),
	.pad			( DBG_DQ[101] ),
        .dtm_data               ( peu_mio_pipe_txdatak[7]),
	.ain_mux_data		( dbg1_mio_dbg_dq[101] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_a[1] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_127_scanin),
	.scan_out(cell_127_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_126 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_126_bscan_in),
	.bs_scan_out		(cell_126_bscan_out),
	.pad			( DBG_DQ[100] ),
        .dtm_data               ( peu_mio_pipe_txdatak[6]),
	.ain_mux_data		( dbg1_mio_dbg_dq[100] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_a[0] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_126_scanin),
	.scan_out(cell_126_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_125 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_125_bscan_in),
	.bs_scan_out		(cell_125_bscan_out),
	.pad			( DBG_DQ[99] ),
        .dtm_data               ( peu_mio_pipe_txdatak[5]),
	.ain_mux_data		( dbg1_mio_dbg_dq[99] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_b[7] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_125_scanin),
	.scan_out(cell_125_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_124 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_124_bscan_in),
	.bs_scan_out		(cell_124_bscan_out),
	.pad			( DBG_DQ[98] ),
        .dtm_data               ( peu_mio_pipe_txdatak[4]),
	.ain_mux_data		( dbg1_mio_dbg_dq[98] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_b[6] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_124_scanin),
	.scan_out(cell_124_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_123 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_123_bscan_in),
	.bs_scan_out		(cell_123_bscan_out),
	.pad			( DBG_DQ[97] ),
        .dtm_data               ( peu_mio_pipe_txdatak[3]),
	.ain_mux_data		( dbg1_mio_dbg_dq[97] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_b[5] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_123_scanin),
	.scan_out(cell_123_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_122 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_122_bscan_in),
	.bs_scan_out		(cell_122_bscan_out),
	.pad			( DBG_DQ[96] ),
        .dtm_data               ( peu_mio_pipe_txdatak[2]),
	.ain_mux_data		( dbg1_mio_dbg_dq[96] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_b[4] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_122_scanin),
	.scan_out(cell_122_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_121 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_121_bscan_in),
	.bs_scan_out		(cell_121_bscan_out),
	.pad			( DBG_DQ[95] ),
        .dtm_data               ( peu_mio_pipe_txdatak[1]),
	.ain_mux_data		( dbg1_mio_dbg_dq[95] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_b[3] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_121_scanin),
	.scan_out(cell_121_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_120 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_120_bscan_in),
	.bs_scan_out		(cell_120_bscan_out),
	.pad			( DBG_DQ[94] ),
        .dtm_data               ( peu_mio_pipe_txdatak[0]),
	.ain_mux_data		( dbg1_mio_dbg_dq[94] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_b[2] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_120_scanin),
	.scan_out(cell_120_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_119 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_119_bscan_in),
	.bs_scan_out		(cell_119_bscan_out),
	.pad			( DBG_DQ[93] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[93] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_b[1] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_119_scanin),
	.scan_out(cell_119_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_118 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_118_bscan_in),
	.bs_scan_out		(cell_118_bscan_out),
	.pad			( DBG_DQ[92] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[92] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_bus_b[0] ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_118_scanin),
	.scan_out(cell_118_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_117 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_117_bscan_in),
	.bs_scan_out		(cell_117_bscan_out),
	.pad			( DBG_DQ[91] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[91] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( peu_mio_debug_clk ),
	.ain_mux_sel		( dbg1_mio_sel_pcix_debug_mode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( dbg1_mio_sel_pcix_debug_mode ),
	.scan_in(cell_117_scanin),
	.scan_out(cell_117_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_116 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_116_bscan_in),
	.bs_scan_out		(cell_116_bscan_out),
	.pad			( DBG_DQ[90] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[90] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_116_scanin),
	.scan_out(cell_116_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_115 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_115_bscan_in),
	.bs_scan_out		(cell_115_bscan_out),
	.pad			( DBG_DQ[89] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[89] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_115_scanin),
	.scan_out(cell_115_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_114 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_114_bscan_in),
	.bs_scan_out		(cell_114_bscan_out),
	.pad			( DBG_DQ[88] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[88] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_114_scanin),
	.scan_out(cell_114_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_113 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_113_bscan_in),
	.bs_scan_out		(cell_113_bscan_out),
	.pad			( DBG_DQ[87] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[87] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_113_scanin),
	.scan_out(cell_113_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_112 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_112_bscan_in),
	.bs_scan_out		(cell_112_bscan_out),
	.pad			( DBG_DQ[86] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[86] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_112_scanin),
	.scan_out(cell_112_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_111 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_111_bscan_in),
	.bs_scan_out		(cell_111_bscan_out),
	.pad			( DBG_DQ[85] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[85] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_111_scanin),
	.scan_out(cell_111_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_110 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_peu_clk_ext ),
	.bs_scan_in		(cell_110_bscan_in),
	.bs_scan_out		(cell_110_bscan_out),
	.pad			( DBG_DQ[84] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[84] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_110_scanin),
	.scan_out(cell_110_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_109 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_109_bscan_in),
	.bs_scan_out		(cell_109_bscan_out),
	.pad			( DBG_DQ[83] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[83] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_109_scanin),
	.scan_out(cell_109_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_108 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_niu_clk_ext[5] ),
	.bs_scan_in		(cell_108_bscan_in),
	.bs_scan_out		(cell_108_bscan_out),
	.pad			( DBG_DQ[82] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[82] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_108_scanin),
	.scan_out(cell_108_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_107 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_niu_clk_ext[4] ),
	.bs_scan_in		(cell_107_bscan_in),
	.bs_scan_out		(cell_107_bscan_out),
	.pad			( DBG_DQ[81] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[81] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_107_scanin),
	.scan_out(cell_107_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_106 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_niu_clk_ext[3] ),
	.bs_scan_in		(cell_106_bscan_in),
	.bs_scan_out		(cell_106_bscan_out),
	.pad			( DBG_DQ[80] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[80] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_106_scanin),
	.scan_out(cell_106_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_105 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_niu_clk_ext[2] ),
	.bs_scan_in		(cell_105_bscan_in),
	.bs_scan_out		(cell_105_bscan_out),
	.pad			( DBG_DQ[79] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[79] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_105_scanin),
	.scan_out(cell_105_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_104 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_niu_clk_ext[1] ),
	.bs_scan_in		(cell_104_bscan_in),
	.bs_scan_out		(cell_104_bscan_out),
	.pad			( DBG_DQ[78] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[78] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_104_scanin),
	.scan_out(cell_104_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_103 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_niu_clk_ext[0] ),
	.bs_scan_in		(cell_103_bscan_in),
	.bs_scan_out		(cell_103_bscan_out),
	.pad			( DBG_DQ[77] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[77] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_103_scanin),
	.scan_out(cell_103_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_102 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_102_bscan_in),
	.bs_scan_out		(cell_102_bscan_out),
	.pad			( DBG_DQ[76] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[76] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_102_scanin),
	.scan_out(cell_102_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_101 (
	.data_oe		( dbg1_mio_drv_en_op_only),
	.bs_scan_in		(cell_101_bscan_in),
	.bs_scan_out		(cell_101_bscan_out),
	.pad			( DBG_DQ[75] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[75] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_101_scanin),
	.scan_out(cell_101_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_bi_bscan cell_98 (
	.data_oe		( dbg1_mio_drv_en_muxtest_inp ),
	.data_to_core		( mio_tcu_io_scan_en ),
	.bs_scan_in		(cell_98_bscan_in),
	.bs_scan_out		(cell_98_bscan_out),
	.pad			( DBG_DQ[74] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[74] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_98_scanin),
	.scan_out(cell_98_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_97 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_97_bscan_in),
	.bs_scan_out		(cell_97_bscan_out),
	.pad			( DBG_DQ[73] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[73] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[30] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_97_scanin),
	.scan_out(cell_97_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_96 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_96_bscan_in),
	.bs_scan_out		(cell_96_bscan_out),
	.pad			( DBG_DQ[72] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[72] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[29] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_96_scanin),
	.scan_out(cell_96_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_95 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_95_bscan_in),
	.bs_scan_out		(cell_95_bscan_out),
	.pad			( DBG_DQ[71] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[71] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[28] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_95_scanin),
	.scan_out(cell_95_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_94 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_94_bscan_in),
	.bs_scan_out		(cell_94_bscan_out),
	.pad			( DBG_DQ[70] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[70] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[27] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_94_scanin),
	.scan_out(cell_94_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_93 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_93_bscan_in),
	.bs_scan_out		(cell_93_bscan_out),
	.pad			( DBG_DQ[69] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[69] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[26] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_93_scanin),
	.scan_out(cell_93_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_92 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_92_bscan_in),
	.bs_scan_out		(cell_92_bscan_out),
	.pad			( DBG_DQ[68] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[68] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[25] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_92_scanin),
	.scan_out(cell_92_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_91 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_91_bscan_in),
	.bs_scan_out		(cell_91_bscan_out),
	.pad			( DBG_DQ[67] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[67] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[24] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_91_scanin),
	.scan_out(cell_91_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_90 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_90_bscan_in),
	.bs_scan_out		(cell_90_bscan_out),
	.pad			( DBG_DQ[66] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[66] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[23] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_90_scanin),
	.scan_out(cell_90_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_89 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_89_bscan_in),
	.bs_scan_out		(cell_89_bscan_out),
	.pad			( DBG_DQ[65] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[65] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[22] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_89_scanin),
	.scan_out(cell_89_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_88 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_88_bscan_in),
	.bs_scan_out		(cell_88_bscan_out),
	.pad			( DBG_DQ[64] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[64] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[21] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_88_scanin),
	.scan_out(cell_88_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_87 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_87_bscan_in),
	.bs_scan_out		(cell_87_bscan_out),
	.pad			( DBG_DQ[63] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[63] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[20] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_87_scanin),
	.scan_out(cell_87_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_86 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_86_bscan_in),
	.bs_scan_out		(cell_86_bscan_out),
	.pad			( DBG_DQ[62] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[62] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[19] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_86_scanin),
	.scan_out(cell_86_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_85 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_85_bscan_in),
	.bs_scan_out		(cell_85_bscan_out),
	.pad			( DBG_DQ[61] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[61] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[18] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_85_scanin),
	.scan_out(cell_85_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_84 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_84_bscan_in),
	.bs_scan_out		(cell_84_bscan_out),
	.pad			( DBG_DQ[60] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[60] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[17] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_84_scanin),
	.scan_out(cell_84_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_83 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_83_bscan_in),
	.bs_scan_out		(cell_83_bscan_out),
	.pad			( DBG_DQ[59] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[59] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[16] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_83_scanin),
	.scan_out(cell_83_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_82 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_82_bscan_in),
	.bs_scan_out		(cell_82_bscan_out),
	.pad			( DBG_DQ[58] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[58] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[15] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_82_scanin),
	.scan_out(cell_82_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_81 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_81_bscan_in),
	.bs_scan_out		(cell_81_bscan_out),
	.pad			( DBG_DQ[57] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[57] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[14] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_81_scanin),
	.scan_out(cell_81_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_80 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_80_bscan_in),
	.bs_scan_out		(cell_80_bscan_out),
	.pad			( DBG_DQ[56] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[56] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[13] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_80_scanin),
	.scan_out(cell_80_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_79 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_79_bscan_in),
	.bs_scan_out		(cell_79_bscan_out),
	.pad			( DBG_DQ[55] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[55] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[12] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_79_scanin),
	.scan_out(cell_79_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_78 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_78_bscan_in),
	.bs_scan_out		(cell_78_bscan_out),
	.pad			( DBG_DQ[54] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[54] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[11] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_78_scanin),
	.scan_out(cell_78_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_77 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_77_bscan_in),
	.bs_scan_out		(cell_77_bscan_out),
	.pad			( DBG_DQ[53] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[53] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[10] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_77_scanin),
	.scan_out(cell_77_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_76 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_76_bscan_in),
	.bs_scan_out		(cell_76_bscan_out),
	.pad			( DBG_DQ[52] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[52] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[9] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_76_scanin),
	.scan_out(cell_76_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_75 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_75_bscan_in),
	.bs_scan_out		(cell_75_bscan_out),
	.pad			( DBG_DQ[51] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[51] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[8] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_75_scanin),
	.scan_out(cell_75_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_74 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_74_bscan_in),
	.bs_scan_out		(cell_74_bscan_out),
	.pad			( DBG_DQ[50] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[50] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[7] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_74_scanin),
	.scan_out(cell_74_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_73 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_73_bscan_in),
	.bs_scan_out		(cell_73_bscan_out),
	.pad			( DBG_DQ[49] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[49] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[6] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_73_scanin),
	.scan_out(cell_73_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_72 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_72_bscan_in),
	.bs_scan_out		(cell_72_bscan_out),
	.pad			( DBG_DQ[48] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[48] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[5] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_72_scanin),
	.scan_out(cell_72_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_71 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_71_bscan_in),
	.bs_scan_out		(cell_71_bscan_out),
	.pad			( DBG_DQ[47] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[47] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[4] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_71_scanin),
	.scan_out(cell_71_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_70 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_70_bscan_in),
	.bs_scan_out		(cell_70_bscan_out),
	.pad			( DBG_DQ[46] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[46] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[3] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_70_scanin),
	.scan_out(cell_70_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_69 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_69_bscan_in),
	.bs_scan_out		(cell_69_bscan_out),
	.pad			( DBG_DQ[45] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[45] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[2] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_69_scanin),
	.scan_out(cell_69_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_68 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_68_bscan_in),
	.bs_scan_out		(cell_68_bscan_out),
	.pad			( DBG_DQ[44] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[44] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[1] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_68_scanin),
	.scan_out(cell_68_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_67 (
	.data_oe		( dbg1_mio_drv_en_muxtest_op ),
	.bs_scan_in		(cell_67_bscan_in),
	.bs_scan_out		(cell_67_bscan_out),
	.pad			( DBG_DQ[43] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[43] ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( tcu_mio_pins_scan_out[0] ),
	.ain_mux_sel		( mio_tcu_testmode_l ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( mio_tcu_testmode ),
	.scan_in(cell_67_scanin),
	.scan_out(cell_67_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_100 (
        .data_oe                ( dbg1_mio_drv_en_muxbist_op),
        .bs_scan_in             (cell_100_bscan_in),
        .bs_scan_out            (cell_100_bscan_out),
        .pad                    ( DBG_DQ[42] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
        .ain_mux_data           ( dbg1_mio_dbg_dq[42] ),
        .bin_mux_data           ( tcu_mio_dmo_sync ),
        .cin_mux_data           ( 1'b0 ),
        .ain_mux_sel            ( tcu_mio_jtag_membist_mode_l),
        .bin_mux_sel            ( tcu_mio_jtag_membist_mode ),
        .cin_mux_sel            ( 1'b0 ),
        .scan_in(cell_100_scanin),
        .scan_out(cell_100_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
        .l2clk                  ( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
        );


n2_mio_cell_out_bscan cell_99 (
        .data_oe                ( dbg1_mio_drv_en_muxbist_op ),
        .bs_scan_in             (cell_99_bscan_in),
        .bs_scan_out            (cell_99_bscan_out),
        .pad                    ( DBG_DQ[41] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
        .ain_mux_data           ( dbg1_mio_dbg_dq[41] ),
        .bin_mux_data           ( tcu_mio_dmo_data[39]),
        .cin_mux_data           ( 1'b0 ),
        .ain_mux_sel            ( tcu_mio_jtag_membist_mode_l ),
        .bin_mux_sel            ( tcu_mio_jtag_membist_mode ),
        .cin_mux_sel            ( 1'b0 ),
        .scan_in(cell_99_scanin),
        .scan_out(cell_99_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
        .l2clk                  ( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
        );


n2_mio_cell_out_bscan cell_66 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_66_bscan_in),
	.bs_scan_out		(cell_66_bscan_out),
	.pad			( DBG_DQ[40] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[40] ),
	.bin_mux_data		( tcu_mio_dmo_data[38] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_66_scanin),
	.scan_out(cell_66_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_65 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_65_bscan_in),
	.bs_scan_out		(cell_65_bscan_out),
	.pad			( DBG_DQ[39] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[39] ),
	.bin_mux_data		( tcu_mio_dmo_data[37] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_65_scanin),
	.scan_out(cell_65_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_64 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_64_bscan_in),
	.bs_scan_out		(cell_64_bscan_out),
	.pad			( DBG_DQ[38] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[38] ),
	.bin_mux_data		( tcu_mio_dmo_data[36] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_64_scanin),
	.scan_out(cell_64_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_63 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_63_bscan_in),
	.bs_scan_out		(cell_63_bscan_out),
	.pad			( DBG_DQ[37] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[37] ),
	.bin_mux_data		( tcu_mio_dmo_data[35] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_63_scanin),
	.scan_out(cell_63_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_62 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_62_bscan_in),
	.bs_scan_out		(cell_62_bscan_out),
	.pad			( DBG_DQ[36] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[36] ),
	.bin_mux_data		( tcu_mio_dmo_data[34] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_62_scanin),
	.scan_out(cell_62_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_61 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_61_bscan_in),
	.bs_scan_out		(cell_61_bscan_out),
	.pad			( DBG_DQ[35] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[35] ),
	.bin_mux_data		( tcu_mio_dmo_data[33] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_61_scanin),
	.scan_out(cell_61_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_60 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_60_bscan_in),
	.bs_scan_out		(cell_60_bscan_out),
	.pad			( DBG_DQ[34] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[34] ),
	.bin_mux_data		( tcu_mio_dmo_data[32] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_60_scanin),
	.scan_out(cell_60_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_59 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_59_bscan_in),
	.bs_scan_out		(cell_59_bscan_out),
	.pad			( DBG_DQ[33] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[33] ),
	.bin_mux_data		( tcu_mio_dmo_data[31] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_59_scanin),
	.scan_out(cell_59_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_58 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_58_bscan_in),
	.bs_scan_out		(cell_58_bscan_out),
	.pad			( DBG_DQ[32] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[32] ),
	.bin_mux_data		( tcu_mio_dmo_data[30] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_58_scanin),
	.scan_out(cell_58_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_57 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_57_bscan_in),
	.bs_scan_out		(cell_57_bscan_out),
	.pad			( DBG_DQ[31] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[31] ),
	.bin_mux_data		( tcu_mio_dmo_data[29] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_57_scanin),
	.scan_out(cell_57_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_56 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_56_bscan_in),
	.bs_scan_out		(cell_56_bscan_out),
	.pad			( DBG_DQ[30] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[30] ),
	.bin_mux_data		( tcu_mio_dmo_data[28] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_56_scanin),
	.scan_out(cell_56_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_2),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_2 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_55 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_55_bscan_in),
	.bs_scan_out		(cell_55_bscan_out),
	.pad			( DBG_DQ[29] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[29] ),
	.bin_mux_data		( tcu_mio_dmo_data[27] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_55_scanin),
	.scan_out(cell_55_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_54 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_54_bscan_in),
	.bs_scan_out		(cell_54_bscan_out),
	.pad			( DBG_DQ[28] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[28] ),
	.bin_mux_data		( tcu_mio_dmo_data[26] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_54_scanin),
	.scan_out(cell_54_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_53 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_53_bscan_in),
	.bs_scan_out		(cell_53_bscan_out),
	.pad			( DBG_DQ[27] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[27] ),
	.bin_mux_data		( tcu_mio_dmo_data[25] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_53_scanin),
	.scan_out(cell_53_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_52 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_52_bscan_in),
	.bs_scan_out		(cell_52_bscan_out),
	.pad			( DBG_DQ[26] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[26] ),
	.bin_mux_data		( tcu_mio_dmo_data[24] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_52_scanin),
	.scan_out(cell_52_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_51 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_51_bscan_in),
	.bs_scan_out		(cell_51_bscan_out),
	.pad			( DBG_DQ[25] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[25] ),
	.bin_mux_data		( tcu_mio_dmo_data[23] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_51_scanin),
	.scan_out(cell_51_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_50 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_50_bscan_in),
	.bs_scan_out		(cell_50_bscan_out),
	.pad			( DBG_DQ[24] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[24] ),
	.bin_mux_data		( tcu_mio_dmo_data[22] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_50_scanin),
	.scan_out(cell_50_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_49 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_49_bscan_in),
	.bs_scan_out		(cell_49_bscan_out),
	.pad			( DBG_DQ[23] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[23] ),
	.bin_mux_data		( tcu_mio_dmo_data[21] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_49_scanin),
	.scan_out(cell_49_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_48 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_48_bscan_in),
	.bs_scan_out		(cell_48_bscan_out),
	.pad			( DBG_DQ[22] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[22] ),
	.bin_mux_data		( tcu_mio_dmo_data[20] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_48_scanin),
	.scan_out(cell_48_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_47 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_47_bscan_in),
	.bs_scan_out		(cell_47_bscan_out),
	.pad			( DBG_DQ[21] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[21] ),
	.bin_mux_data		( tcu_mio_dmo_data[19] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_47_scanin),
	.scan_out(cell_47_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_46 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_46_bscan_in),
	.bs_scan_out		(cell_46_bscan_out),
	.pad			( DBG_DQ[20] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[20] ),
	.bin_mux_data		( tcu_mio_dmo_data[18] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_46_scanin),
	.scan_out(cell_46_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_45 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_45_bscan_in),
	.bs_scan_out		(cell_45_bscan_out),
	.pad			( DBG_DQ[19] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[19] ),
	.bin_mux_data		( tcu_mio_dmo_data[17] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_45_scanin),
	.scan_out(cell_45_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_44 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_44_bscan_in),
	.bs_scan_out		(cell_44_bscan_out),
	.pad			( DBG_DQ[18] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[18] ),
	.bin_mux_data		( tcu_mio_dmo_data[16] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_44_scanin),
	.scan_out(cell_44_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_43 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_43_bscan_in),
	.bs_scan_out		(cell_43_bscan_out),
	.pad			( DBG_DQ[17] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[17] ),
	.bin_mux_data		( tcu_mio_dmo_data[15] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_43_scanin),
	.scan_out(cell_43_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_42 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_42_bscan_in),
	.bs_scan_out		(cell_42_bscan_out),
	.pad			( DBG_DQ[16] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[16] ),
	.bin_mux_data		( tcu_mio_dmo_data[14] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_42_scanin),
	.scan_out(cell_42_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_41 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_41_bscan_in),
	.bs_scan_out		(cell_41_bscan_out),
	.pad			( DBG_DQ[15] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[15] ),
	.bin_mux_data		( tcu_mio_dmo_data[13] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_41_scanin),
	.scan_out(cell_41_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_40 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_40_bscan_in),
	.bs_scan_out		(cell_40_bscan_out),
	.pad			( DBG_DQ[14] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[14] ),
	.bin_mux_data		( tcu_mio_dmo_data[12] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_40_scanin),
	.scan_out(cell_40_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_39 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_39_bscan_in),
	.bs_scan_out		(cell_39_bscan_out),
	.pad			( DBG_DQ[13] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[13] ),
	.bin_mux_data		( tcu_mio_dmo_data[11] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_39_scanin),
	.scan_out(cell_39_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_38 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_38_bscan_in),
	.bs_scan_out		(cell_38_bscan_out),
	.pad			( DBG_DQ[12] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[12] ),
	.bin_mux_data		( tcu_mio_dmo_data[10] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_38_scanin),
	.scan_out(cell_38_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_37 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_37_bscan_in),
	.bs_scan_out		(cell_37_bscan_out),
	.pad			( DBG_DQ[11] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[11] ),
	.bin_mux_data		( tcu_mio_dmo_data[9] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_37_scanin),
	.scan_out(cell_37_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_36 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_36_bscan_in),
	.bs_scan_out		(cell_36_bscan_out),
	.pad			( DBG_DQ[10] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[10] ),
	.bin_mux_data		( tcu_mio_dmo_data[8] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_36_scanin),
	.scan_out(cell_36_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_35 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_35_bscan_in),
	.bs_scan_out		(cell_35_bscan_out),
	.pad			( DBG_DQ[9] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[9] ),
	.bin_mux_data		( tcu_mio_dmo_data[7] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_35_scanin),
	.scan_out(cell_35_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_34 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_34_bscan_in),
	.bs_scan_out		(cell_34_bscan_out),
	.pad			( DBG_DQ[8] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[8] ),
	.bin_mux_data		( tcu_mio_dmo_data[6] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_34_scanin),
	.scan_out(cell_34_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_33 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_33_bscan_in),
	.bs_scan_out		(cell_33_bscan_out),
	.pad			( DBG_DQ[7] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[7] ),
	.bin_mux_data		( tcu_mio_dmo_data[5] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_33_scanin),
	.scan_out(cell_33_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_32 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_32_bscan_in),
	.bs_scan_out		(cell_32_bscan_out),
	.pad			( DBG_DQ[6] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[6] ),
	.bin_mux_data		( tcu_mio_dmo_data[4] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_32_scanin),
	.scan_out(cell_32_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_31 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_31_bscan_in),
	.bs_scan_out		(cell_31_bscan_out),
	.pad			( DBG_DQ[5] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[5] ),
	.bin_mux_data		( tcu_mio_dmo_data[3] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_31_scanin),
	.scan_out(cell_31_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_30 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_30_bscan_in),
	.bs_scan_out		(cell_30_bscan_out),
	.pad			( DBG_DQ[4] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[4] ),
	.bin_mux_data		( tcu_mio_dmo_data[2] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_30_scanin),
	.scan_out(cell_30_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_29 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_29_bscan_in),
	.bs_scan_out		(cell_29_bscan_out),
	.pad			( DBG_DQ[3] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[3] ),
	.bin_mux_data		( tcu_mio_dmo_data[1] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_29_scanin),
	.scan_out(cell_29_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_28 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_28_bscan_in),
	.bs_scan_out		(cell_28_bscan_out),
	.pad			( DBG_DQ[2] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[2] ),
	.bin_mux_data		( tcu_mio_dmo_data[0] ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_28_scanin),
	.scan_out(cell_28_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_27 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_27_bscan_in),
	.bs_scan_out		(cell_27_bscan_out),
	.pad			( DBG_DQ[1] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[1] ),
	.bin_mux_data		( tcu_mio_mbist_done ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_27_scanin),
	.scan_out(cell_27_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_26 (
	.data_oe		( dbg1_mio_drv_en_muxbist_op ),
	.bs_scan_in		(cell_26_bscan_in),
	.bs_scan_out		(cell_26_bscan_out),
	.pad			( DBG_DQ[0] ),
        .ccu_mio_serdes_dtm         ( 1'b0),
        .dtm_data               ( 1'b0),
	.ain_mux_data		( dbg1_mio_dbg_dq[0] ),
	.bin_mux_data		( tcu_mio_mbist_fail ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( tcu_mio_jtag_membist_mode_l ),
	.bin_mux_sel		( tcu_mio_jtag_membist_mode ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_26_scanin),
	.scan_out(cell_26_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_3),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_3 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_in_bscan cell_25 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_tcu_trigin ),
	.bs_scan_in		(cell_25_bscan_in),
	.bs_scan_out		(cell_25_bscan_out),
	.pad			( TRIGIN ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_out_bscan cell_24 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_24_bscan_in),
	.bs_scan_out		(cell_24_bscan_out),
	.pad			( TRIGOUT ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
	.ain_mux_data		( tcu_mio_trigout ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( 1'b0 ),
	.ain_mux_sel		( 1'b1 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b0 ),
	.scan_in(cell_24_scanin),
	.scan_out(cell_24_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

// cells 22,23 used to be IMP_MON cells


n2_mio_cell_in cell_16 (
        .data_to_core           ( io_burnin ),
        .pad                    ( BURNIN )
        );

n2_mio_cell_out_bscan cell_15 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_15_bscan_in),
	.bs_scan_out		(cell_15_bscan_out),
	.pad			( PEX_RESET_L ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( rst_mio_pex_reset_l ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
	.scan_in(cell_15_scanin),
	.scan_out(cell_15_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_in_bscan cell_14 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_rst_pb_rst_l ),
	.bs_scan_in		(cell_14_bscan_in),
	.bs_scan_out		(cell_14_bscan_out),
	.pad			( PB_RST_L ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_bscan cell_13 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_rst_button_xir_l ),
	.bs_scan_in		(cell_13_bscan_in),
	.bs_scan_out		(cell_13_bscan_out),
	.pad			( BUTTON_XIR_L ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_bscan cell_12 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_rst_pwron_rst_l ),
	.bs_scan_in		(cell_12_bscan_in),
	.bs_scan_out		(cell_12_bscan_out),
	.pad			( PWRON_RST_L ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_out_bscan cell_5 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_5_bscan_in),
	.bs_scan_out		(cell_5_bscan_out),
	.pad			( SSI_MOSI ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( ncu_mio_ssi_mosi_r ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
	.scan_in(cell_5_scanin),
	.scan_out(cell_5_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);


n2_mio_cell_in_bscan cell_10 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_ncu_ssi_miso_pin ),
	.bs_scan_in		(cell_10_bscan_in),
	.bs_scan_out		(cell_10_bscan_out),
	.pad			( SSI_MISO ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_out_bscan cell_9 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_09_bscan_in),
	.bs_scan_out		(cell_09_bscan_out),
	.pad			( SSI_SCK ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( ncu_mio_ssi_sck_r ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
	.scan_in(cell_9_scanin),
	.scan_out(cell_9_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_in_bscan cell_8 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		( mio_ncu_ext_int_l ),
	.bs_scan_in		(cell_08_bscan_in),
	.bs_scan_out		(cell_08_bscan_out),
	.pad			( SSI_EXT_INT_L ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_out_bscan cell_7 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_07_bscan_in),
	.bs_scan_out		(cell_07_bscan_out),
	.pad			( SSI_SYNC_L ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm     ( 1'b0 ),
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( rst_mio_ssi_sync_l ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
	.scan_in(cell_7_scanin),
	.scan_out(cell_7_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_1),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_1 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_in_bscan cell_4 (
        .tcu_mio_bs_mode_ctl    (1'b1),
        .data_to_core           ( mio_ccu_vreg_selbg_l),
        .bs_scan_in             (cell_04_bscan_in),
        .bs_scan_out            (cell_04_bscan_out),
        .pad                    ( VREG_SELBG_L ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
        );

n2_mio_cell_out_bscan cell_3 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_03_bscan_in),
	.bs_scan_out		(cell_03_bscan_out),
	.pad			( PLL_CHAR_OUT[1] ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( ccu_mio_pll_char_out[1] ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
	.scan_in(cell_3_scanin),
	.scan_out(cell_3_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_out_bscan cell_2 (
	.data_oe		( 1'b1 ),
	.bs_scan_in		(cell_02_bscan_in),
	.bs_scan_out		(cell_02_bscan_out),
	.pad			( PLL_CHAR_OUT[0] ),
        .dtm_data               ( 1'b0 ),
        .ccu_mio_serdes_dtm         ( 1'b0 ),
	.ain_mux_data		( 1'b0 ),
	.bin_mux_data		( 1'b0 ),
	.cin_mux_data		( ccu_mio_pll_char_out[0] ),
	.ain_mux_sel		( 1'b0 ),
	.bin_mux_sel		( 1'b0 ),
	.cin_mux_sel		( 1'b1 ),
	.scan_in(cell_2_scanin),
	.scan_out(cell_2_scanout),
        .cmp_io2x_sync_en_fnl(cmp_io2x_sync_en_fnl_0),
        .tcu_clk_stop              (1'b0),
	.l2clk			( l2clk_0 ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov)
	);

n2_mio_cell_in_pd_bscan cell_1 (
        .tcu_mio_bs_mode_ctl    (1'b1),
	.data_to_core		(mio_pll_testmode),
	.bs_scan_in		(cell_01_bscan_in),
	.bs_scan_out		(cell_01_bscan_out),
	.pad			( PLL_TESTMODE ),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
	);

n2_mio_cell_in_bscan cell_0 (
        .tcu_mio_bs_mode_ctl    (1'b1),
        .data_to_core           (mio_spc_pwr_throttle_0[2]),
        .bs_scan_in             (cell_00_bscan_in),
        .bs_scan_out            (cell_00_bscan_out),
        .pad                    (PWR_THRTTL_0[2]),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
        );

n2_mio_cell_in_bscan cell_212 (
        .tcu_mio_bs_mode_ctl    (1'b1),
        .data_to_core           (mio_spc_pwr_throttle_0[1]),
        .bs_scan_in             (cell_212_bscan_in),
        .bs_scan_out            (cell_212_bscan_out),
        .pad                    (PWR_THRTTL_0[1]),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
        );

n2_mio_cell_in_bscan cell_213 (
        .tcu_mio_bs_mode_ctl    (1'b1),
        .data_to_core           (mio_spc_pwr_throttle_0[0]),
        .bs_scan_in             (cell_213_bscan_in),
        .bs_scan_out            (cell_213_bscan_out),
        .pad                    (PWR_THRTTL_0[0]),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
        );

n2_mio_cell_in_bscan cell_214 (
        .tcu_mio_bs_mode_ctl    (1'b1),
        .data_to_core           (mio_spc_pwr_throttle_1[2]),
        .bs_scan_in             (cell_214_bscan_in),
        .bs_scan_out            (cell_214_bscan_out),
        .pad                    (PWR_THRTTL_1[2]),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
        );

n2_mio_cell_in_bscan cell_215 (
        .tcu_mio_bs_mode_ctl    (1'b1),
        .data_to_core           (mio_spc_pwr_throttle_1[1]),
        .bs_scan_in             (cell_215_bscan_in),
        .bs_scan_out            (cell_215_bscan_out),
        .pad                    (PWR_THRTTL_1[1]),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
        );


n2_mio_cell_in_bscan cell_216 (
        .tcu_mio_bs_mode_ctl    (1'b1),
        .data_to_core           (mio_spc_pwr_throttle_1[0]),
        .bs_scan_in             (cell_216_bscan_in),
        .bs_scan_out            (cell_216_bscan_out),
        .pad                    (PWR_THRTTL_1[0]),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en)
        );

// Boundary scan chain

assign mio_tcu_bs_scan_out      =                        cell_216_bscan_out	;
assign cell_216_bscan_in	=                        cell_215_bscan_out	;
assign cell_215_bscan_in	=                        cell_214_bscan_out	;
assign cell_214_bscan_in	=                        cell_213_bscan_out	;
assign cell_213_bscan_in	=                        cell_212_bscan_out	;
assign cell_212_bscan_in	=                        cell_00_bscan_out		;
assign cell_00_bscan_in		=                        cell_01_bscan_out		;
assign cell_01_bscan_in		=                        cell_02_bscan_out		;
assign cell_02_bscan_in		=                        cell_03_bscan_out		;
assign cell_03_bscan_in		=                        cell_12_bscan_out	;
assign cell_12_bscan_in		=                        cell_04_bscan_out		;
assign cell_04_bscan_in		=                        cell_24_bscan_out	;
assign cell_24_bscan_in		=                        cell_14_bscan_out	;
assign cell_14_bscan_in		=                        cell_13_bscan_out	;
assign cell_13_bscan_in		=                        cell_15_bscan_out	;
assign cell_15_bscan_in		=                        cell_25_bscan_out	;
assign cell_25_bscan_in		=                        cell_191_bscan_out	;
assign cell_191_bscan_in	=                        cell_190_bscan_out	;
assign cell_190_bscan_in	=                        cell_189_bscan_out	;
assign cell_189_bscan_in	=                        cell_188_bscan_out	;
assign cell_188_bscan_in	=                        cell_187_bscan_out     ;
assign cell_187_bscan_in	=                        cell_186_bscan_out	;
assign cell_186_bscan_in	=                        cell_183_bscan_out	;
assign cell_183_bscan_in	=                        cell_182_bscan_out	;
assign cell_182_bscan_in	=                        cell_181_bscan_out	;
assign cell_181_bscan_in	=                        cell_180_bscan_out	;
assign cell_180_bscan_in	=                        cell_179_bscan_out	;
assign cell_179_bscan_in	=                        cell_178_bscan_out	;
assign cell_178_bscan_in	=                        cell_177_bscan_out	;
assign cell_177_bscan_in	=                        cell_176_bscan_out	;
assign cell_176_bscan_in	=                        cell_175_bscan_out	;
assign cell_175_bscan_in	=                        cell_174_bscan_out	;
assign cell_174_bscan_in	=                        cell_173_bscan_out	;
assign cell_173_bscan_in	=                        cell_172_bscan_out	;
assign cell_172_bscan_in	=                        cell_171_bscan_out	;
assign cell_171_bscan_in	=                        cell_170_bscan_out	;
assign cell_170_bscan_in	=                        cell_169_bscan_out	;
assign cell_169_bscan_in	=                        cell_168_bscan_out	;
assign cell_168_bscan_in	=                        cell_167_bscan_out	;
assign cell_167_bscan_in	=                        cell_166_bscan_out	;
assign cell_166_bscan_in	=                        cell_165_bscan_out	;
assign cell_165_bscan_in	=                        cell_164_bscan_out	;
assign cell_164_bscan_in	=                        cell_163_bscan_out	;
assign cell_163_bscan_in	=                        cell_162_bscan_out	;
assign cell_162_bscan_in	=                        cell_161_bscan_out	;
assign cell_161_bscan_in	=                        cell_160_bscan_out	;
assign cell_160_bscan_in	=                        cell_159_bscan_out	;
assign cell_159_bscan_in	=                        cell_158_bscan_out	;
assign cell_158_bscan_in	=                        cell_157_bscan_out	;
assign cell_157_bscan_in	=                        cell_156_bscan_out	;
assign cell_156_bscan_in	=                        cell_155_bscan_out	;
assign cell_155_bscan_in	=                        cell_154_bscan_out	;
assign cell_154_bscan_in	=                        cell_153_bscan_out	;
assign cell_153_bscan_in	=                        cell_152_bscan_out	;
assign cell_152_bscan_in	=                        cell_151_bscan_out	;
assign cell_151_bscan_in	=                        cell_150_bscan_out	;
assign cell_150_bscan_in	=                        cell_149_bscan_out	;
assign cell_149_bscan_in	=                        cell_148_bscan_out	;
assign cell_148_bscan_in	=                        cell_147_bscan_out	;
assign cell_147_bscan_in	=                        cell_146_bscan_out	;
assign cell_146_bscan_in	=                        cell_145_bscan_out	;
assign cell_145_bscan_in	=                        cell_144_bscan_out	;
assign cell_144_bscan_in	=                        cell_07_bscan_out      ;
assign cell_07_bscan_in		=                        cell_08_bscan_out	;
assign cell_08_bscan_in		=                        cell_09_bscan_out	;
assign cell_09_bscan_in		=                        cell_10_bscan_out	;
assign cell_10_bscan_in		=                        cell_5_bscan_out	;
assign cell_5_bscan_in		=                        cell_192_bscan_out	;
assign cell_192_bscan_in	=                        cell_143_bscan_out	;
assign cell_143_bscan_in	=                        cell_142_bscan_out	;
assign cell_142_bscan_in	=                        cell_141_bscan_out	;
assign cell_141_bscan_in	=                        cell_140_bscan_out	;
assign cell_140_bscan_in	=                        cell_139_bscan_out	;
assign cell_139_bscan_in	=                        cell_138_bscan_out	;
assign cell_138_bscan_in	=                        cell_137_bscan_out     ;
assign cell_137_bscan_in	=                        cell_136_bscan_out	;
assign cell_136_bscan_in	=                        cell_135_bscan_out	;
assign cell_135_bscan_in	=                        cell_134_bscan_out	;
assign cell_134_bscan_in	=                        cell_133_bscan_out	;
assign cell_133_bscan_in	=                        cell_132_bscan_out	;
assign cell_132_bscan_in	=                        cell_131_bscan_out	;
assign cell_131_bscan_in	=                        cell_130_bscan_out	;
assign cell_130_bscan_in	=                        cell_129_bscan_out	;
assign cell_129_bscan_in	=                        cell_128_bscan_out	;
assign cell_128_bscan_in	=                        cell_127_bscan_out	;
assign cell_127_bscan_in	=                        cell_126_bscan_out	;
assign cell_126_bscan_in	=                        cell_125_bscan_out	;
assign cell_125_bscan_in	=                        cell_124_bscan_out	;
assign cell_124_bscan_in	=                        cell_123_bscan_out	;
assign cell_123_bscan_in	=                        cell_122_bscan_out	;
assign cell_122_bscan_in	=                        cell_121_bscan_out	;
assign cell_121_bscan_in	=                        cell_120_bscan_out	;
assign cell_120_bscan_in	=                        cell_119_bscan_out	;
assign cell_119_bscan_in	=                        cell_118_bscan_out	;
assign cell_118_bscan_in	=                        cell_117_bscan_out	;
assign cell_117_bscan_in	=                        cell_116_bscan_out	;
assign cell_116_bscan_in	=                        cell_115_bscan_out	;
assign cell_115_bscan_in	=                        cell_114_bscan_out	;
assign cell_114_bscan_in	=                        cell_113_bscan_out	;
assign cell_113_bscan_in	=                        cell_112_bscan_out	;
assign cell_112_bscan_in	=                        cell_111_bscan_out	;
assign cell_111_bscan_in	=                        cell_110_bscan_out	;
assign cell_110_bscan_in	=                        cell_109_bscan_out	;
assign cell_109_bscan_in	=                        cell_108_bscan_out	;
assign cell_108_bscan_in	=                        cell_107_bscan_out	;
assign cell_107_bscan_in	=                        cell_106_bscan_out	;
assign cell_106_bscan_in	=                        cell_105_bscan_out	;
assign cell_105_bscan_in	=                        cell_104_bscan_out	;
assign cell_104_bscan_in	=                        cell_103_bscan_out	;
assign cell_103_bscan_in	=                        cell_102_bscan_out	;
assign cell_102_bscan_in	=                        cell_101_bscan_out	;
assign cell_101_bscan_in	=                        cell_98_bscan_out	;
assign cell_98_bscan_in		=                        cell_97_bscan_out	;
assign cell_97_bscan_in		=                        cell_96_bscan_out	;
assign cell_96_bscan_in		=			 cell_185_bscan_out	;
assign cell_185_bscan_in	=                        cell_184_bscan_out	;
assign cell_184_bscan_in	=                        cell_95_bscan_out	;
assign cell_95_bscan_in		=                        cell_94_bscan_out	;
assign cell_94_bscan_in		=                        cell_93_bscan_out	;
assign cell_93_bscan_in		=                        cell_92_bscan_out	;
assign cell_92_bscan_in		=                        cell_91_bscan_out	;
assign cell_91_bscan_in		=                        cell_90_bscan_out	;
assign cell_90_bscan_in		=                        cell_89_bscan_out	;
assign cell_89_bscan_in		=                        cell_88_bscan_out	;
assign cell_88_bscan_in		=                        cell_87_bscan_out	;
assign cell_87_bscan_in		=                        cell_86_bscan_out	;
assign cell_86_bscan_in		=                        cell_85_bscan_out	;
assign cell_85_bscan_in		=                        cell_84_bscan_out      ;
assign cell_84_bscan_in		=                        cell_83_bscan_out	;
assign cell_83_bscan_in		=                        cell_82_bscan_out	;
assign cell_82_bscan_in		=                        cell_81_bscan_out	;
assign cell_81_bscan_in		=                        cell_80_bscan_out	;
assign cell_80_bscan_in		=                        cell_79_bscan_out	;
assign cell_79_bscan_in		=                        cell_78_bscan_out	;
assign cell_78_bscan_in		=                        cell_77_bscan_out	;
assign cell_77_bscan_in		=                        cell_76_bscan_out	;
assign cell_76_bscan_in		=                        cell_75_bscan_out	;
assign cell_75_bscan_in		=                        cell_74_bscan_out	;
assign cell_74_bscan_in		=                        cell_73_bscan_out	;
assign cell_73_bscan_in		=                        cell_72_bscan_out	;
assign cell_72_bscan_in		=                        cell_71_bscan_out	;
assign cell_71_bscan_in		=                        cell_70_bscan_out	;
assign cell_70_bscan_in		=                        cell_69_bscan_out	;
assign cell_69_bscan_in		=                        cell_68_bscan_out	;
assign cell_68_bscan_in		=                        cell_67_bscan_out	;
assign cell_67_bscan_in		=                        cell_100_bscan_out	;
assign cell_100_bscan_in	=			 cell_99_bscan_out	;
assign cell_99_bscan_in		=                        cell_66_bscan_out	;
assign cell_66_bscan_in		=                        cell_65_bscan_out	;
assign cell_65_bscan_in		=                        cell_64_bscan_out	;
assign cell_64_bscan_in		=                        cell_63_bscan_out	;
assign cell_63_bscan_in		=                        cell_62_bscan_out	;
assign cell_62_bscan_in		=                        cell_61_bscan_out	;
assign cell_61_bscan_in		=                        cell_60_bscan_out	;
assign cell_60_bscan_in		=                        cell_59_bscan_out	;
assign cell_59_bscan_in		=                        cell_58_bscan_out	;
assign cell_58_bscan_in		=                        cell_57_bscan_out	;
assign cell_57_bscan_in		=                        cell_56_bscan_out	;
assign cell_56_bscan_in		=                        cell_55_bscan_out	;
assign cell_55_bscan_in		=                        cell_54_bscan_out	;
assign cell_54_bscan_in		=                        cell_53_bscan_out	;
assign cell_53_bscan_in		=                        cell_52_bscan_out	;
assign cell_52_bscan_in		=                        cell_51_bscan_out	;
assign cell_51_bscan_in		=                        cell_50_bscan_out	;
assign cell_50_bscan_in		=                        cell_49_bscan_out	;
assign cell_49_bscan_in		=                        cell_48_bscan_out	;
assign cell_48_bscan_in		=                        cell_47_bscan_out	;
assign cell_47_bscan_in		=                        cell_46_bscan_out	;
assign cell_46_bscan_in		=                        cell_45_bscan_out	;
assign cell_45_bscan_in		=                        cell_44_bscan_out	;
assign cell_44_bscan_in		=                        cell_43_bscan_out	;
assign cell_43_bscan_in		=                        cell_42_bscan_out	;
assign cell_42_bscan_in		=                        cell_41_bscan_out	;
assign cell_41_bscan_in		=                        cell_40_bscan_out	;
assign cell_40_bscan_in		=                        cell_39_bscan_out	;
assign cell_39_bscan_in		=                        cell_38_bscan_out	;
assign cell_38_bscan_in		=                        cell_37_bscan_out	;
assign cell_37_bscan_in		=                        cell_36_bscan_out	;
assign cell_36_bscan_in		=                        cell_35_bscan_out	;
assign cell_35_bscan_in		=                        cell_34_bscan_out	;
assign cell_34_bscan_in		=                        cell_33_bscan_out	;
assign cell_33_bscan_in		=                        cell_32_bscan_out	;
assign cell_32_bscan_in		=                        cell_31_bscan_out      ;
assign cell_31_bscan_in		=                        cell_30_bscan_out	;
assign cell_30_bscan_in		=                        cell_29_bscan_out	;
assign cell_29_bscan_in		=                        cell_28_bscan_out	;
assign cell_28_bscan_in		=                        cell_27_bscan_out	;
assign cell_27_bscan_in		=                        cell_26_bscan_out	;
assign cell_26_bscan_in		=                        cell_23_bscan_out	;
assign cell_23_bscan_in		=                        cell_193_bscan_out	;
assign cell_193_bscan_in	=                        cell_194_bscan_out	;
assign cell_194_bscan_in	=                        cell_195_bscan_out	;
assign cell_195_bscan_in	=                        cell_196_bscan_out	;
assign cell_196_bscan_in	=                        cell_197_bscan_out	;
assign cell_197_bscan_in	=                        cell_198_bscan_out	;
assign cell_198_bscan_in	=                        cell_199_bscan_out	;
assign cell_199_bscan_in	=                        cell_200_bscan_out	;
assign cell_200_bscan_in	=                        cell_201_bscan_out	;
assign cell_201_bscan_in	=                        cell_202_bscan_out	;
assign cell_202_bscan_in	=                        cell_203_bscan_out	;
assign cell_203_bscan_in	=                        cell_209_bscan_out	;
assign cell_209_bscan_in	=                        cell_210_bscan_out	;
assign cell_210_bscan_in	=                        cell_17_bscan_out	;
assign cell_17_bscan_in		=                        cell_18_bscan_out	;
assign cell_18_bscan_in		=                        cell_211_bscan_out	;
assign cell_211_bscan_in	=                        cell_6_bscan_out	        ;
assign cell_6_bscan_in		=                        tcu_mio_bs_scan_in     ; 

// scan chain order
assign scan_out  		=                        cell_2_scanout		;
assign cell_2_scanin		=                        cell_3_scanout		;
assign cell_3_scanin		=                        cell_24_scanout	;
assign cell_24_scanin		=                        cell_15_scanout	;
assign cell_15_scanin		=                        cell_191_scanout	;
assign cell_191_scanin		=                        cell_190_scanout	;
assign cell_190_scanin		=                        cell_189_scanout	;
assign cell_189_scanin		=                        cell_188_scanout	;
assign cell_188_scanin		=                        io2xsyncen_reg0_scanout	;
assign io2xsyncen_reg0_scanin		=                mio_clk_header_cmp_clk_0_scan_out	;
assign mio_clk_header_cmp_clk_0_scan_in		=        cell_187_scanout	;
assign cell_187_scanin		=                        cell_186_scanout	;
assign cell_186_scanin		=                        cell_183_scanout	;
assign cell_183_scanin		=                        cell_182_scanout	;
assign cell_182_scanin		=                        cell_181_scanout	;
assign cell_181_scanin		=                        cell_180_scanout	;
assign cell_180_scanin		=                        cell_179_scanout	;
assign cell_179_scanin		=                        cell_178_scanout	;
assign cell_178_scanin		=                        cell_177_scanout	;
assign cell_177_scanin		=                        cell_176_scanout	;
assign cell_176_scanin		=                        cell_175_scanout	;
assign cell_175_scanin		=                        cell_174_scanout	;
assign cell_174_scanin		=                        cell_173_scanout	;
assign cell_173_scanin		=                        cell_172_scanout	;
assign cell_172_scanin		=                        cell_171_scanout	;
assign cell_171_scanin		=                        cell_170_scanout	;
assign cell_170_scanin		=                        cell_169_scanout	;
assign cell_169_scanin		=                        cell_168_scanout	;
assign cell_168_scanin		=                        cell_167_scanout	;
assign cell_167_scanin		=                        cell_166_scanout	;
assign cell_166_scanin		=                        cell_165_scanout	;
assign cell_165_scanin		=                        cell_164_scanout	;
assign cell_164_scanin		=                        cell_163_scanout	;
assign cell_163_scanin		=                        cell_162_scanout	;
assign cell_162_scanin		=                        cell_161_scanout	;
assign cell_161_scanin		=                        cell_160_scanout	;
assign cell_160_scanin		=                        cell_159_scanout	;
assign cell_159_scanin		=                        cell_158_scanout	;
assign cell_158_scanin		=                        cell_157_scanout	;
assign cell_157_scanin		=                        cell_156_scanout	;
assign cell_156_scanin		=                        cell_155_scanout	;
assign cell_155_scanin		=                        cell_154_scanout	;
assign cell_154_scanin		=                        cell_153_scanout	;
assign cell_153_scanin		=                        cell_152_scanout	;
assign cell_152_scanin		=                        cell_151_scanout	;
assign cell_151_scanin		=                        cell_150_scanout	;
assign cell_150_scanin		=                        cell_149_scanout	;
assign cell_149_scanin		=                        cell_148_scanout	;
assign cell_148_scanin		=                        cell_147_scanout	;
assign cell_147_scanin		=                        cell_146_scanout	;
assign cell_146_scanin		=                        cell_145_scanout	;
assign cell_145_scanin		=                        cell_144_scanout	;
assign cell_144_scanin		=                        muxsel_scanout		;
assign muxsel_scanin		=                        mio_clk_header_iol2clk_scan_out	;
assign mio_clk_header_iol2clk_scan_in		=        cell_7_scanout		;
assign cell_7_scanin		=                        cell_9_scanout		;
assign cell_9_scanin		=                        cell_5_scanout	;
assign cell_5_scanin		=                        cell_192_scanout	;
assign cell_192_scanin		=                        cell_143_scanout	;
assign cell_143_scanin		=                        cell_142_scanout	;
assign cell_142_scanin		=                        cell_141_scanout	;
assign cell_141_scanin		=                        cell_140_scanout	;
assign cell_140_scanin		=                        cell_139_scanout	;
assign cell_139_scanin		=                        cell_138_scanout	;
assign cell_138_scanin		=                        io2xsyncen_reg1_scanout	;
assign io2xsyncen_reg1_scanin		=                mio_clk_header_cmp_clk_1_scan_out	;
assign mio_clk_header_cmp_clk_1_scan_in		=        cell_137_scanout	;
assign cell_137_scanin		=                        cell_136_scanout	;
assign cell_136_scanin		=                        cell_135_scanout	;
assign cell_135_scanin		=                        cell_134_scanout	;
assign cell_134_scanin		=                        cell_133_scanout	;
assign cell_133_scanin		=                        cell_132_scanout	;
assign cell_132_scanin		=                        cell_131_scanout	;
assign cell_131_scanin		=                        cell_130_scanout	;
assign cell_130_scanin		=                        cell_129_scanout	;
assign cell_129_scanin		=                        cell_128_scanout	;
assign cell_128_scanin		=                        cell_127_scanout	;
assign cell_127_scanin		=                        cell_126_scanout	;
assign cell_126_scanin		=                        cell_125_scanout	;
assign cell_125_scanin		=                        cell_124_scanout	;
assign cell_124_scanin		=                        cell_123_scanout	;
assign cell_123_scanin		=                        cell_122_scanout	;
assign cell_122_scanin		=                        cell_121_scanout	;
assign cell_121_scanin		=                        cell_120_scanout	;
assign cell_120_scanin		=                        cell_119_scanout	;
assign cell_119_scanin		=                        cell_118_scanout	;
assign cell_118_scanin		=                        cell_117_scanout	;
assign cell_117_scanin		=                        cell_116_scanout	;
assign cell_116_scanin		=                        cell_115_scanout	;
assign cell_115_scanin		=                        cell_114_scanout	;
assign cell_114_scanin		=                        cell_113_scanout	;
assign cell_113_scanin		=                        cell_112_scanout	;
assign cell_112_scanin		=                        cell_111_scanout	;
assign cell_111_scanin		=                        cell_110_scanout	;
assign cell_110_scanin		=                        cell_109_scanout	;
assign cell_109_scanin		=                        cell_108_scanout	;
assign cell_108_scanin		=                        cell_107_scanout	;
assign cell_107_scanin		=                        cell_106_scanout	;
assign cell_106_scanin		=                        cell_105_scanout	;
assign cell_105_scanin		=                        cell_104_scanout	;
assign cell_104_scanin		=                        cell_103_scanout	;
assign cell_103_scanin		=                        cell_102_scanout	;
assign cell_102_scanin		=                        cell_101_scanout	;
assign cell_101_scanin		=                        cell_98_scanout	;
assign cell_98_scanin		=                        cell_97_scanout	;
assign cell_97_scanin		=                        cell_96_scanout	;
assign cell_96_scanin		=			cell_185_scanout	;
assign cell_185_scanin		=                        cell_184_scanout	;
assign cell_184_scanin		=                        cell_95_scanout	;
assign cell_95_scanin		=                        cell_94_scanout	;
assign cell_94_scanin		=                        cell_93_scanout	;
assign cell_93_scanin		=                        cell_92_scanout	;
assign cell_92_scanin		=                        cell_91_scanout	;
assign cell_91_scanin		=                        cell_90_scanout	;
assign cell_90_scanin		=                        cell_89_scanout	;
assign cell_89_scanin		=                        cell_88_scanout	;
assign cell_88_scanin		=                        cell_87_scanout	;
assign cell_87_scanin		=                        cell_86_scanout	;
assign cell_86_scanin		=                        cell_85_scanout	;
assign cell_85_scanin		=			 cell_84_scanout	;
assign cell_84_scanin		=                        io2xsyncen_reg2_scanout	;
assign io2xsyncen_reg2_scanin		=                mio_clk_header_cmp_clk_2_scan_out	;
assign mio_clk_header_cmp_clk_2_scan_in		=        cell_83_scanout	;
assign cell_83_scanin		=                        cell_82_scanout	;
assign cell_82_scanin		=                        cell_81_scanout	;
assign cell_81_scanin		=                        cell_80_scanout	;
assign cell_80_scanin		=                        cell_79_scanout	;
assign cell_79_scanin		=                        cell_78_scanout	;
assign cell_78_scanin		=                        cell_77_scanout	;
assign cell_77_scanin		=                        cell_76_scanout	;
assign cell_76_scanin		=                        cell_75_scanout	;
assign cell_75_scanin		=                        cell_74_scanout	;
assign cell_74_scanin		=                        cell_73_scanout	;
assign cell_73_scanin		=                        cell_72_scanout	;
assign cell_72_scanin		=                        cell_71_scanout	;
assign cell_71_scanin		=                        cell_70_scanout	;
assign cell_70_scanin		=                        cell_69_scanout	;
assign cell_69_scanin		=                        cell_68_scanout	;
assign cell_68_scanin		=                        cell_67_scanout	;
assign cell_67_scanin		=                        cell_100_scanout	;
assign cell_100_scanin		=			 cell_99_scanout	;
assign cell_99_scanin		=                        cell_66_scanout	;
assign cell_66_scanin		=                        cell_65_scanout	;
assign cell_65_scanin		=                        cell_64_scanout	;
assign cell_64_scanin		=                        cell_63_scanout	;
assign cell_63_scanin		=                        cell_62_scanout	;
assign cell_62_scanin		=                        cell_61_scanout	;
assign cell_61_scanin		=                        cell_60_scanout	;
assign cell_60_scanin		=                        cell_59_scanout	;
assign cell_59_scanin		=                        cell_58_scanout	;
assign cell_58_scanin		=                        cell_57_scanout	;
assign cell_57_scanin		=                        cell_56_scanout	;
assign cell_56_scanin		=                        cell_55_scanout	;
assign cell_55_scanin		=                        cell_54_scanout	;
assign cell_54_scanin		=                        cell_53_scanout	;
assign cell_53_scanin		=                        cell_52_scanout	;
assign cell_52_scanin		=                        cell_51_scanout	;
assign cell_51_scanin		=                        cell_50_scanout	;
assign cell_50_scanin		=                        cell_49_scanout	;
assign cell_49_scanin		=                        cell_48_scanout	;
assign cell_48_scanin		=                        cell_47_scanout	;
assign cell_47_scanin		=                        cell_46_scanout	;
assign cell_46_scanin		=                        cell_45_scanout	;
assign cell_45_scanin		=                        cell_44_scanout	;
assign cell_44_scanin		=                        cell_43_scanout	;
assign cell_43_scanin		=                        cell_42_scanout	;
assign cell_42_scanin		=                        cell_41_scanout	;
assign cell_41_scanin		=                        cell_40_scanout	;
assign cell_40_scanin		=                        cell_39_scanout	;
assign cell_39_scanin		=                        cell_38_scanout	;
assign cell_38_scanin		=                        cell_37_scanout	;
assign cell_37_scanin		=                        cell_36_scanout	;
assign cell_36_scanin		=                        cell_35_scanout	;
assign cell_35_scanin		=                        cell_34_scanout	;
assign cell_34_scanin		=                        cell_33_scanout	;
assign cell_33_scanin		=                        cell_32_scanout	;
assign cell_32_scanin		=                        io2xsyncen_reg3_scanout	;
assign io2xsyncen_reg3_scanin		=                mio_clk_header_cmp_clk_3_scan_out	;
assign mio_clk_header_cmp_clk_3_scan_in		=        cell_31_scanout	;
assign cell_31_scanin		=                        cell_30_scanout	;
assign cell_30_scanin		=                        cell_29_scanout	;
assign cell_29_scanin		=                        cell_28_scanout	;
assign cell_28_scanin		=                        cell_27_scanout	;
assign cell_27_scanin		=                        cell_26_scanout	;
assign cell_26_scanin		=                        cell_23_scanout	;
assign cell_23_scanin		=                        cell_193_scanout	;
assign cell_193_scanin          =                        cell_202_scanout       ;
assign cell_202_scanin		=                        cell_209_scanout	;
assign cell_209_scanin		=                        cell_210_scanout	;
assign cell_210_scanin		=                        cell_17_scanout	;
assign cell_17_scanin		=                        cell_18_scanout	;
assign cell_18_scanin		=                        cell_211_scanout	;
assign cell_211_scanin		=                        cell_6_scanout	        ;
assign cell_6_scanin		=                        scan_in                ;
endmodule 



module mio_syncreg_ctl (
  cmp_io2x_sync_en_out, 
  cmp_io2x_sync_en_fnl, 
  l2clk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;
wire l1clk;
wire ff_0_scanin;
wire ff_0_scanout;


input           cmp_io2x_sync_en_out;
output          cmp_io2x_sync_en_fnl;

input		l2clk;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           scan_in;
output          scan_out;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;

l1clkhdr_ctl_macro l1clk_gen (
        .l2clk  ( l2clk ),
        .l1en   ( 1'b1 ),
        .l1clk  ( l1clk ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );

msff_ctl_macro_en_1_width_1 ff_0        (
	.scan_in(ff_0_scanin),
	.scan_out(ff_0_scanout),
	.l1clk		( l1clk ),
	.en		( 1'b1 ),
	.din		( cmp_io2x_sync_en_out ),
	.dout		( cmp_io2x_sync_en_fnl ),
  .siclk(siclk),
  .soclk(soclk) );

// fixscan start:
assign ff_0_scanin               = scan_in                  ;
assign scan_out                  = ff_0_scanout             ;
// fixscan end:
endmodule


// any PARAMS parms go into naming of macro

module msff_ctl_macro_en_1_width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});

cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(scan_in),
.so(scan_out),
.q(dout[0])
);

endmodule








module mio_muxsel_ctl (
  iol2clk, 
  dbg0_mio_debug_bus_a, 
  dbg0_mio_debug_bus_b, 
  dbg0_mio_debug_bus_a_r, 
  dbg0_mio_debug_bus_b_r, 
  ncu_mio_ssi_mosi,
  ncu_mio_ssi_mosi_r,
  ncu_mio_ssi_sck,
  ncu_mio_ssi_sck_r,
  mio_ncu_ssi_miso_pin,
  mio_ncu_ssi_miso,
  mio_testclkt, 
  mio_fsr_testclkt, 
  mio_psr_testclkt, 
  mio_esr_testclkt, 
  mio_testclkr, 
  mio_fsr_testclkr, 
  mio_psr_testclkr, 
  mio_esr_testclkr, 
  dbg1_mio_sel_niu_debug_mode, 
  dbg1_mio_sel_niu_debug_mode_l, 
  dbg1_mio_sel_pcix_debug_mode, 
  dbg1_mio_sel_pcix_debug_mode_l, 
  dbg1_mio_sel_soc_obs_mode, 
  dbg1_mio_sel_soc_obs_mode_l, 
  mio_tcu_testmode, 
  mio_tcu_testmode_l, 
  tcu_mio_jtag_membist_mode, 
  tcu_mio_jtag_membist_mode_l, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;
wire l1clk_io;
wire ff_1_scanin;
wire ff_1_scanout;


input		iol2clk;
input    [7:0]  dbg0_mio_debug_bus_a;
input    [7:0]  dbg0_mio_debug_bus_b;
output   [7:0]  dbg0_mio_debug_bus_a_r;
output   [7:0]  dbg0_mio_debug_bus_b_r;

input  		ncu_mio_ssi_mosi;
output  	ncu_mio_ssi_mosi_r;
input  		ncu_mio_ssi_sck;
output  	ncu_mio_ssi_sck_r;
input  		mio_ncu_ssi_miso_pin;
output  	mio_ncu_ssi_miso;


input		mio_testclkt;
output [7:0]    mio_fsr_testclkt;
output          mio_psr_testclkt;
output          mio_esr_testclkt;

input		mio_testclkr;
output [7:0]    mio_fsr_testclkr;
output          mio_psr_testclkr;
output          mio_esr_testclkr;

input		dbg1_mio_sel_niu_debug_mode;
output		dbg1_mio_sel_niu_debug_mode_l;

input		dbg1_mio_sel_pcix_debug_mode;
output		dbg1_mio_sel_pcix_debug_mode_l;

input           dbg1_mio_sel_soc_obs_mode;
output          dbg1_mio_sel_soc_obs_mode_l;

input		mio_tcu_testmode;
output		mio_tcu_testmode_l;

input		tcu_mio_jtag_membist_mode;
output		tcu_mio_jtag_membist_mode_l;

input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           scan_in;
output          scan_out;

wire   [7:0]    dbg0_mio_debug_bus_a_r;
wire   [7:0]    dbg0_mio_debug_bus_b_r;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;

l1clkhdr_ctl_macro_dl1hdr_24x l1clk_gen_io  (
        .l2clk  (iol2clk),
        .l1en   ( 1'b1 ),
        .l1clk  ( l1clk_io),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );

// retiming of DMU debug bus signals and SSI signals

msff_ctl_macro_en_1_width_19 ff_1        (
        .scan_in(ff_1_scanin),
        .scan_out(ff_1_scanout),
        .l1clk          ( l1clk_io),
        .en             ( 1'b1 ),
        .din            ( {dbg0_mio_debug_bus_a[7:0],dbg0_mio_debug_bus_b[7:0],
                           ncu_mio_ssi_mosi,ncu_mio_ssi_sck,mio_ncu_ssi_miso_pin}),
        .dout           ( {dbg0_mio_debug_bus_a_r[7:0],dbg0_mio_debug_bus_b_r[7:0],
                           ncu_mio_ssi_mosi_r,ncu_mio_ssi_sck_r,mio_ncu_ssi_miso}),
  .siclk(siclk),
  .soclk(soclk) );

assign mio_fsr_testclkt[7:0] = { 8 { mio_testclkt } };
assign mio_psr_testclkt = mio_testclkt;
assign mio_esr_testclkt = mio_testclkt;

assign mio_fsr_testclkr[7:0] = { 8 { mio_testclkr } };
assign mio_psr_testclkr = mio_testclkr;
assign mio_esr_testclkr = mio_testclkr;

assign dbg1_mio_sel_niu_debug_mode_l = ~dbg1_mio_sel_niu_debug_mode;
assign dbg1_mio_sel_pcix_debug_mode_l = ~dbg1_mio_sel_pcix_debug_mode;
assign mio_tcu_testmode_l = ~mio_tcu_testmode;
assign tcu_mio_jtag_membist_mode_l = ~tcu_mio_jtag_membist_mode;
assign dbg1_mio_sel_soc_obs_mode_l = ~dbg1_mio_sel_soc_obs_mode;

// fixscan start:
assign ff_1_scanin               = scan_in                  ;
assign scan_out                  = ff_1_scanout             ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module msff_ctl_macro_en_1_width_19 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [18:0] fdin;
wire [18:1] sout;

  input [18:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [18:0] dout;
  output scan_out;
assign fdin[18:0] = (din[18:0] & {19{en}}) | (dout[18:0] & ~{19{en}});








    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.q(dout[0])
);
cl_sc1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.q(dout[1])
);
cl_sc1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.q(dout[2])
);
cl_sc1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(sout[4]),
.so(sout[3]),
.q(dout[3])
);
cl_sc1_msff_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4]),
.si(sout[5]),
.so(sout[4]),
.q(dout[4])
);
cl_sc1_msff_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5]),
.si(sout[6]),
.so(sout[5]),
.q(dout[5])
);
cl_sc1_msff_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6]),
.si(sout[7]),
.so(sout[6]),
.q(dout[6])
);
cl_sc1_msff_4x d0_7 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7]),
.si(sout[8]),
.so(sout[7]),
.q(dout[7])
);
cl_sc1_msff_4x d0_8 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8]),
.si(sout[9]),
.so(sout[8]),
.q(dout[8])
);
cl_sc1_msff_4x d0_9 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9]),
.si(sout[10]),
.so(sout[9]),
.q(dout[9])
);
cl_sc1_msff_4x d0_10 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10]),
.si(sout[11]),
.so(sout[10]),
.q(dout[10])
);
cl_sc1_msff_4x d0_11 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11]),
.si(sout[12]),
.so(sout[11]),
.q(dout[11])
);
cl_sc1_msff_4x d0_12 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12]),
.si(sout[13]),
.so(sout[12]),
.q(dout[12])
);
cl_sc1_msff_4x d0_13 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13]),
.si(sout[14]),
.so(sout[13]),
.q(dout[13])
);
cl_sc1_msff_4x d0_14 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14]),
.si(sout[15]),
.so(sout[14]),
.q(dout[14])
);
cl_sc1_msff_4x d0_15 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15]),
.si(sout[16]),
.so(sout[15]),
.q(dout[15])
);

cl_sc1_msff_4x d0_16 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[16]),
.si(sout[17]),
.so(sout[16]),
.q(dout[16])
);
cl_sc1_msff_4x d0_17 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17]),
.si(sout[18]),
.so(sout[17]),
.q(dout[17])
);
cl_sc1_msff_4x d0_18 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[18]),
.si(scan_in),
.so(sout[18]),
.q(dout[18])
);




endmodule



module n2_mio_cell_out_bscan (
  ccu_mio_serdes_dtm, 
  data_oe, 
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  tcu_mio_bs_highz_l, 
  dbg1_mio_drv_imped, 
  bs_scan_in, 
  bs_scan_out, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_mode_ctl, 
  pad, 
  ain_mux_data, 
  dtm_data, 
  bin_mux_data, 
  cin_mux_data, 
  ain_mux_sel, 
  bin_mux_sel, 
  cin_mux_sel, 
  cmp_io2x_sync_en_fnl, 
  l2clk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;
wire l1clk;
wire ain_mux_data_fnl;
wire ff_in_mux_data_scanin;
wire ff_in_mux_data_scanout;
wire ain_mux_data_dout;
wire bin_mux_data_dout;
wire data_from_core;
wire rcvr_out;
wire l1bsclk;
wire ff_out_scanin;
wire drvr_in;
wire ff_out_scanout;
wire drvr_oe;
wire ff_oe_scanin;
wire ff_oe_scanout;


input           ccu_mio_serdes_dtm;
input		data_oe;
input		tcu_mio_bs_clk;
input		tcu_mio_bs_aclk;
input		tcu_mio_bs_bclk;
input		tcu_mio_bs_uclk;
input		tcu_mio_bs_highz_l;
input [1:0]	dbg1_mio_drv_imped;
input		bs_scan_in;
output		bs_scan_out;
input		tcu_mio_bs_scan_en;
input		tcu_mio_bs_mode_ctl;
output		pad;
input		ain_mux_data;
input           dtm_data;
input		bin_mux_data;
input		cin_mux_data;
input		ain_mux_sel;
input		bin_mux_sel;
input		cin_mux_sel;
input		cmp_io2x_sync_en_fnl;

input		l2clk;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           scan_in;
output          scan_out;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;

l1clkhdr_ctl_macro l1clk_gen (
         .l2clk         ( l2clk ),
         .l1en          ( 1'b1 ),
         .l1clk         ( l1clk ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );

mux_ctl_macro_mux_aonpe_ports_2_width_1 mux_dtm_data 
            (.dout(ain_mux_data_fnl),
             .din0(ain_mux_data),
             .din1(dtm_data),
             .sel0(~ccu_mio_serdes_dtm),
             .sel1(ccu_mio_serdes_dtm)
            );

msff_ctl_macro_en_1_width_2 ff_in_mux_data        (
	.scan_in	( ff_in_mux_data_scanin ),
	.scan_out	( ff_in_mux_data_scanout ),
	.l1clk		( l1clk ),
	.en		( cmp_io2x_sync_en_fnl ),
	.din		( { ain_mux_data_fnl , bin_mux_data } ),
	.dout		( { ain_mux_data_dout , bin_mux_data_dout } ),
  .siclk(siclk),
  .soclk(soclk) );

mux_ctl_macro_mux_aonpe_ports_3_width_1 mux_data 
              (.dout (data_from_core),
               .din0  (ain_mux_data_dout),     .sel0 (ain_mux_sel),
               .din1  (bin_mux_data_dout),     .sel1 (bin_mux_sel),
               .din2  (cin_mux_data),          .sel2 (cin_mux_sel)
              ) ;

cl_sc1_bs_cell2_4x ff_out (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( data_from_core ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_out_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( drvr_in ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_out_scanout ) );

cl_sc1_bs_cell2_4x ff_oe (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( data_oe ),
	.d		( drvr_oe ),
	.l1clk		( l1bsclk ),
	.si		( ff_oe_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( drvr_oe ),
        .highz_n		( tcu_mio_bs_highz_l ), // sw148268 Apr2'05
	.so		( ff_oe_scanout ) );

l1clkhdr_ctl_macro l1bsclk_gen (
        .l2clk          ( tcu_mio_bs_clk ),
        .l1en           ( 1'b1 ),
        .l1clk          ( l1bsclk ),
        .pce_ov         ( 1'b1 ),
        .stop           ( 1'b0 ),
        .se             ( tcu_mio_bs_scan_en ) );      

///// Driver Model w/ OE input /////

assign pad = drvr_oe ? drvr_in : 1'bz ;

///// Receiver Model /////

assign rcvr_out = pad ;

///// Boundary Scan Chain /////

assign bs_scan_out = ff_oe_scanout ;
assign ff_oe_scanin = ff_out_scanout ;
assign ff_out_scanin = bs_scan_in ;

///// Regular Scan Chain /////

assign scan_out = ff_in_mux_data_scanout ;
assign ff_in_mux_data_scanin = scan_in ;

endmodule



// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mux_ctl_macro_mux_aonpe_ports_2_width_1 (
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

module msff_ctl_macro_en_1_width_2 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [1:1] sout;

  input [1:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});








    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.q(dout[0])
);
cl_sc1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(scan_in),
.so(sout[1]),
.q(dout[1])
);




endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mux_ctl_macro_mux_aonpe_ports_3_width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  input [0:0] din2;
  input sel2;
  output [0:0] dout;





assign dout[0:0] = ( {1{sel0}} & din0[0:0] ) |
                       ( {1{sel1}} & din1[0:0]) |
                       ( {1{sel2}} & din2[0:0]);





endmodule



module n2_mio_cell_bi_bscan (
  ccu_mio_serdes_dtm, 
  data_oe, 
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  tcu_mio_bs_highz_l, 
  dbg1_mio_drv_imped, 
  data_to_core, 
  bs_scan_in, 
  bs_scan_out, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_mode_ctl, 
  pad, 
  dtm_data, 
  ain_mux_data, 
  bin_mux_data, 
  cin_mux_data, 
  ain_mux_sel, 
  bin_mux_sel, 
  cin_mux_sel, 
  cmp_io2x_sync_en_fnl, 
  l2clk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;
wire l1clk;
wire ain_mux_data_fnl;
wire ff_in_mux_data_scanin;
wire ff_in_mux_data_scanout;
wire ain_mux_data_dout;
wire bin_mux_data_dout;
wire data_from_core;
wire rcvr_out;
wire l1bsclk;
wire ff_in_scanin;
wire ff_in_scanout;
wire ff_out_scanin;
wire drvr_in;
wire ff_out_scanout;
wire drvr_oe;
wire ff_oe_scanin;
wire ff_oe_scanout;


input           ccu_mio_serdes_dtm;
input		data_oe;
input		tcu_mio_bs_clk;
input		tcu_mio_bs_aclk;
input		tcu_mio_bs_bclk;
input		tcu_mio_bs_uclk;
input		tcu_mio_bs_highz_l;
input [1:0]	dbg1_mio_drv_imped;
output		data_to_core;
input		bs_scan_in;
output		bs_scan_out;
input		tcu_mio_bs_scan_en;
input		tcu_mio_bs_mode_ctl;
inout		pad;
input           dtm_data;
input		ain_mux_data;
input		bin_mux_data;
input		cin_mux_data;
input		ain_mux_sel;
input		bin_mux_sel;
input		cin_mux_sel;
input		cmp_io2x_sync_en_fnl;

input		l2clk;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           scan_in;
output          scan_out;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;

l1clkhdr_ctl_macro l1clk_gen (
        .l2clk  ( l2clk ),
        .l1en   ( 1'b1 ),
        .l1clk  ( l1clk ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );

mux_ctl_macro_mux_aonpe_ports_2_width_1 mux_dtm_data 
            (.dout(ain_mux_data_fnl),
             .din0(ain_mux_data),
             .din1(dtm_data),
             .sel0(~ccu_mio_serdes_dtm),
             .sel1(ccu_mio_serdes_dtm)
            );


msff_ctl_macro_en_1_width_2 ff_in_mux_data        (
	.scan_in	( ff_in_mux_data_scanin ),
	.scan_out	( ff_in_mux_data_scanout ),
	.l1clk		( l1clk ),
	.en		( cmp_io2x_sync_en_fnl ),
	.din		( { ain_mux_data_fnl , bin_mux_data } ),
	.dout		( { ain_mux_data_dout , bin_mux_data_dout } ),
  .siclk(siclk),
  .soclk(soclk) );


mux_ctl_macro_mux_aonpe_ports_3_width_1 mux_data 
              (.dout (data_from_core),
               .din0  (ain_mux_data_dout),     .sel0 (ain_mux_sel),
               .din1  (bin_mux_data_dout),     .sel1 (bin_mux_sel),
               .din2  (cin_mux_data),          .sel2 (cin_mux_sel)
              ) ;


cl_sc1_bs_cell2_4x ff_in (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( rcvr_out ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_in_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( data_to_core ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_in_scanout ) );

cl_sc1_bs_cell2_4x ff_out (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( data_from_core ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_out_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( drvr_in ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_out_scanout ) );

cl_sc1_bs_cell2_4x ff_oe (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( data_oe ),
	.d		( drvr_oe ),
	.l1clk		( l1bsclk ),
	.si		( ff_oe_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( drvr_oe ),
        .highz_n		( tcu_mio_bs_highz_l ), // sw148268 Apr2'05
	.so		( ff_oe_scanout ) );

l1clkhdr_ctl_macro l1bsclk_gen (
        .l2clk          ( tcu_mio_bs_clk ),
        .l1en           ( 1'b1 ),
        .l1clk          ( l1bsclk ),
        .pce_ov         ( 1'b1 ),
        .se             ( tcu_mio_bs_scan_en ),
        .stop           ( 1'b0 ) );      

///// Driver Model w/ OE input /////

assign pad = drvr_oe ? drvr_in : 1'bz ;

///// Receiver Model /////

assign rcvr_out = pad ;

///// Boundary Scan Chain /////

assign bs_scan_out = ff_oe_scanout ;
assign ff_oe_scanin = ff_out_scanout ;
assign ff_out_scanin = ff_in_scanout ;
assign ff_in_scanin = bs_scan_in ;

///// Regular Scan Chain /////

assign scan_out = ff_in_mux_data_scanout ;
assign ff_in_mux_data_scanin = scan_in ;

endmodule



module n2_mio_cell_in (
  data_to_core, 
  pad);
wire rcvr_out;


output		data_to_core;
input		pad;

///// Receiver Model /////

assign rcvr_out = pad;

assign data_to_core = rcvr_out;

endmodule




module n2_mio_cell_in_pu (
  data_to_core, 
  pad);

output		data_to_core;
input		pad;

// Pullup on pad//
wire            pad_int = pad;
pullup(pull1) (pad_int);

///// Receiver Model /////

wire rcvr_out = pad_int;

assign data_to_core = rcvr_out;

endmodule




module n2_mio_cell_out (
  data_oe, 
  dbg1_mio_drv_imped, 
  pad, 
  data_from_core);

input		data_oe;
input [1:0]	dbg1_mio_drv_imped;
output		pad;
input		data_from_core;

///// Driver Model w/ OE input /////

assign pad = data_oe ? data_from_core : 1'bz ;

endmodule



module n2_mio_cell_in_pd_bscan (
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  data_to_core, 
  bs_scan_in, 
  bs_scan_out, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_mode_ctl, 
  pad);
wire l1bsclk;
wire ff_in_scanin;
wire ff_in_scanout;


input		tcu_mio_bs_clk;
input		tcu_mio_bs_aclk;
input		tcu_mio_bs_bclk;
input		tcu_mio_bs_uclk;
output		data_to_core;
input		bs_scan_in;
output		bs_scan_out;
input		tcu_mio_bs_scan_en;
input		tcu_mio_bs_mode_ctl;
input		pad;

///// Receiver Model /////

// Pulldown on pad//
wire            pad_int = pad;
pulldown(pull0) (pad_int);


wire rcvr_out = pad_int ;

cl_sc1_bs_cell2_4x ff_in (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( rcvr_out ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_in_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( data_to_core ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_in_scanout ) );

l1clkhdr_ctl_macro l1bsclk_gen (
        .l2clk          ( tcu_mio_bs_clk ),
        .l1en           ( 1'b1 ),
        .l1clk          ( l1bsclk ),
        .pce_ov         ( 1'b1 ),
	.se	        ( tcu_mio_bs_scan_en ),
        .stop           ( 1'b0 ) );      

///// Boundary Scan Chain /////

assign bs_scan_out = ff_in_scanout ;
assign ff_in_scanin = bs_scan_in ;

endmodule




module n2_mio_cell_in_bscan (
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  data_to_core, 
  bs_scan_in, 
  bs_scan_out, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_mode_ctl, 
  pad);
wire rcvr_out;
wire l1bsclk;
wire ff_in_scanin;
wire ff_in_scanout;


input		tcu_mio_bs_clk;
input		tcu_mio_bs_aclk;
input		tcu_mio_bs_bclk;
input		tcu_mio_bs_uclk;
output		data_to_core;
input		bs_scan_in;
output		bs_scan_out;
input		tcu_mio_bs_scan_en;
input		tcu_mio_bs_mode_ctl;
input		pad;

cl_sc1_bs_cell2_4x ff_in (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( rcvr_out ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_in_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( data_to_core ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_in_scanout ) );

l1clkhdr_ctl_macro l1bsclk_gen (
        .l2clk          ( tcu_mio_bs_clk ),
        .l1en           ( 1'b1 ),
        .l1clk          ( l1bsclk ),
        .pce_ov         ( 1'b1 ),
	.se	        ( tcu_mio_bs_scan_en ),
        .stop           ( 1'b0 ) );      

///// Receiver Model /////

assign rcvr_out = pad ;

///// Boundary Scan Chain /////

assign bs_scan_out = ff_in_scanout ;
assign ff_in_scanin = bs_scan_in ;

endmodule




module n2_mio_cell_bi_pd_bscan (
  ccu_mio_serdes_dtm, 
  data_oe, 
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  tcu_mio_bs_highz_l, 
  dbg1_mio_drv_imped, 
  data_to_core, 
  bs_scan_in, 
  bs_scan_out, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_mode_ctl, 
  pad, 
  dtm_data, 
  ain_mux_data, 
  bin_mux_data, 
  cin_mux_data, 
  ain_mux_sel, 
  bin_mux_sel, 
  cin_mux_sel, 
  cmp_io2x_sync_en_fnl, 
  l2clk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;
wire l1clk;
wire drvr_oe;
wire drvr_in;
wire rcvr_out;
wire ain_mux_data_fnl;
wire ff_in_mux_data_scanin;
wire ff_in_mux_data_scanout;
wire ain_mux_data_dout;
wire bin_mux_data_dout;
wire data_from_core;
wire l1bsclk;
wire ff_in_scanin;
wire ff_in_scanout;
wire ff_out_scanin;
wire ff_out_scanout;
wire ff_oe_scanin;
wire ff_oe_scanout;


input		ccu_mio_serdes_dtm;
input		data_oe;
input		tcu_mio_bs_clk;
input		tcu_mio_bs_aclk;
input		tcu_mio_bs_bclk;
input		tcu_mio_bs_uclk;
input		tcu_mio_bs_highz_l;
input [1:0]	dbg1_mio_drv_imped;
output		data_to_core;
input		bs_scan_in;
output		bs_scan_out;
input		tcu_mio_bs_scan_en;
input		tcu_mio_bs_mode_ctl;
inout		pad;
input           dtm_data;
input		ain_mux_data;
input		bin_mux_data;
input		cin_mux_data;
input		ain_mux_sel;
input		bin_mux_sel;
input		cin_mux_sel;
input		cmp_io2x_sync_en_fnl;

input		l2clk;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           scan_in;
output          scan_out;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;

l1clkhdr_ctl_macro l1clk_gen (
        .l2clk  ( l2clk ),
        .l1en   ( 1'b1 ),
        .l1clk  ( l1clk ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );

///// Driver Model w/ OE input and pulldown /////

wire pad_int;
pulldown (pull0) (pad_int);
wire (highz1, pull0) pad = pad_int;
bufif1 U2 ( pad, drvr_in, drvr_oe); // if en=1 then q=in; else q=1'bz

///// Receiver Model /////

assign rcvr_out = pad ;

mux_ctl_macro_mux_aonpe_ports_2_width_1 mux_dtm_data 
            (.dout(ain_mux_data_fnl),
             .din0(ain_mux_data),
             .din1(dtm_data),
             .sel0(~ccu_mio_serdes_dtm),
             .sel1(ccu_mio_serdes_dtm)
            );

msff_ctl_macro_en_1_width_2 ff_in_mux_data        (
	.scan_in	( ff_in_mux_data_scanin ),
	.scan_out	( ff_in_mux_data_scanout ),
	.l1clk		( l1clk ),
	.en		( cmp_io2x_sync_en_fnl ),
	.din		( { ain_mux_data_fnl , bin_mux_data } ),
	.dout		( { ain_mux_data_dout , bin_mux_data_dout } ),
  .siclk(siclk),
  .soclk(soclk) );


mux_ctl_macro_mux_aonpe_ports_3_width_1 mux_data 
              (.dout (data_from_core),
               .din0  (ain_mux_data_dout),     .sel0 (ain_mux_sel),
               .din1  (bin_mux_data_dout),     .sel1 (bin_mux_sel),
               .din2  (cin_mux_data),          .sel2 (cin_mux_sel)
              ) ;


cl_sc1_bs_cell2_4x ff_in (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( rcvr_out ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_in_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( data_to_core ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_in_scanout ) );

cl_sc1_bs_cell2_4x ff_out (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( data_from_core ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_out_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( drvr_in ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_out_scanout ) );

cl_sc1_bs_cell2_4x ff_oe (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( data_oe ),
	.d		( drvr_oe ),
	.l1clk		( l1bsclk ),
	.si		( ff_oe_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( drvr_oe ),
        .highz_n		( tcu_mio_bs_highz_l ), // sw148268 Apr2'05
	.so		( ff_oe_scanout ) );

l1clkhdr_ctl_macro l1bsclk_gen (
        .l2clk          ( tcu_mio_bs_clk ),
        .l1en           ( 1'b1 ),
        .l1clk          ( l1bsclk ),
        .pce_ov         ( 1'b1 ),
        .se             ( tcu_mio_bs_scan_en ),
        .stop           ( 1'b0 ) );      

///// Boundary Scan Chain /////

assign bs_scan_out = ff_oe_scanout ;
assign ff_oe_scanin = ff_out_scanout ;
assign ff_out_scanin = ff_in_scanout ;
assign ff_in_scanin = bs_scan_in ;

///// Regular Scan Chain /////

assign scan_out = ff_in_mux_data_scanout ;
assign ff_in_mux_data_scanin = scan_in ;

endmodule



module n2_mio_cell_bi_pu_bscan (
  ccu_mio_serdes_dtm, 
  data_oe, 
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  tcu_mio_bs_highz_l, 
  dbg1_mio_drv_imped, 
  data_to_core, 
  bs_scan_in, 
  bs_scan_out, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_mode_ctl, 
  pad, 
  dtm_data, 
  ain_mux_data, 
  bin_mux_data, 
  cin_mux_data, 
  ain_mux_sel, 
  bin_mux_sel, 
  cin_mux_sel, 
  cmp_io2x_sync_en_fnl, 
  l2clk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;
wire l1clk;
wire drvr_oe;
wire drvr_in;
wire rcvr_out;
wire ain_mux_data_fnl;
wire ff_in_mux_data_scanin;
wire ff_in_mux_data_scanout;
wire ain_mux_data_dout;
wire bin_mux_data_dout;
wire data_from_core;
wire l1bsclk;
wire ff_in_scanin;
wire ff_in_scanout;
wire ff_out_scanin;
wire ff_out_scanout;
wire ff_oe_scanin;
wire ff_oe_scanout;


input           ccu_mio_serdes_dtm;
input		data_oe;
input		tcu_mio_bs_clk;
input		tcu_mio_bs_aclk;
input		tcu_mio_bs_bclk;
input		tcu_mio_bs_uclk;
input		tcu_mio_bs_highz_l;
input [1:0]	dbg1_mio_drv_imped;
output		data_to_core;
input		bs_scan_in;
output		bs_scan_out;
input		tcu_mio_bs_scan_en;
input		tcu_mio_bs_mode_ctl;
inout		pad;
input           dtm_data;
input		ain_mux_data;
input		bin_mux_data;
input		cin_mux_data;
input		ain_mux_sel;
input		bin_mux_sel;
input		cin_mux_sel;
input		cmp_io2x_sync_en_fnl;

input		l2clk;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           scan_in;
output          scan_out;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;

l1clkhdr_ctl_macro l1clk_gen (
        .l2clk  ( l2clk ),
        .l1en   ( 1'b1 ),
        .l1clk  ( l1clk ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );

///// Driver Model w/ OE input and pullup /////

wire pad_int;
pullup (pull1) (pad_int);
wire (pull1, highz0) pad = pad_int;
bufif1 U2 ( pad, drvr_in, drvr_oe); // if en=1 then q=in; else q=1'bz

///// Receiver Model /////

assign rcvr_out = pad ;

mux_ctl_macro_mux_aonpe_ports_2_width_1 mux_dtm_data 
            (.dout(ain_mux_data_fnl),
             .din0(ain_mux_data),
             .din1(dtm_data),
             .sel0(~ccu_mio_serdes_dtm),
             .sel1(ccu_mio_serdes_dtm)
            );

msff_ctl_macro_en_1_width_2 ff_in_mux_data        (
	.scan_in	( ff_in_mux_data_scanin ),
	.scan_out	( ff_in_mux_data_scanout ),
	.l1clk		( l1clk ),
	.en		( cmp_io2x_sync_en_fnl ),
	.din		( { ain_mux_data_fnl , bin_mux_data } ),
	.dout		( { ain_mux_data_dout , bin_mux_data_dout } ),
  .siclk(siclk),
  .soclk(soclk) );


mux_ctl_macro_mux_aonpe_ports_3_width_1 mux_data 
              (.dout (data_from_core),
               .din0  (ain_mux_data_dout),     .sel0 (ain_mux_sel),
               .din1  (bin_mux_data_dout),     .sel1 (bin_mux_sel),
               .din2  (cin_mux_data),          .sel2 (cin_mux_sel)
              ) ;


cl_sc1_bs_cell2_4x ff_in (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( rcvr_out ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_in_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( data_to_core ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_in_scanout ) );

cl_sc1_bs_cell2_4x ff_out (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( data_from_core ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_out_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( drvr_in ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_out_scanout ) );

cl_sc1_bs_cell2_4x ff_oe (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( data_oe ),
	.d		( drvr_oe ),
	.l1clk		( l1bsclk ),
	.si		( ff_oe_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( drvr_oe ),
        .highz_n		( tcu_mio_bs_highz_l ), // sw148268 Apr2'05
	.so		( ff_oe_scanout ) );

l1clkhdr_ctl_macro l1bsclk_gen (
        .l2clk          ( tcu_mio_bs_clk ),
        .l1en           ( 1'b1 ),
        .l1clk          ( l1bsclk ),
        .pce_ov         ( 1'b1 ),
        .se             ( tcu_mio_bs_scan_en ),
        .stop           ( 1'b0 ) );      

///// Boundary Scan Chain /////

assign bs_scan_out = ff_oe_scanout ;
assign ff_oe_scanin = ff_out_scanout ;
assign ff_out_scanin = ff_in_scanout ;
assign ff_in_scanin = bs_scan_in ;

///// Regular Scan Chain /////

assign scan_out = ff_in_mux_data_scanout ;
assign ff_in_mux_data_scanin = scan_in ;

endmodule


module n2_mio_cell_bi_od_bscan (
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  data_to_core, 
  bs_scan_in, 
  bs_scan_out, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_mode_ctl, 
  pad, 
  ain_mux_data, 
  bin_mux_data, 
  cin_mux_data, 
  ain_mux_sel, 
  bin_mux_sel, 
  cin_mux_sel, 
  cmp_io2x_sync_en_fnl, 
  l2clk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;
wire l1clk;
wire ff_in_mux_data_scanin;
wire ff_in_mux_data_scanout;
wire ain_mux_data_dout;
wire bin_mux_data_dout;
wire data_from_core;
wire rcvr_out;
wire l1bsclk;
wire ff_in_scanin;
wire ff_in_scanout;
wire ff_out_scanin;
wire drvr_in;
wire ff_out_scanout;


input		tcu_mio_bs_clk;
input		tcu_mio_bs_aclk;
input		tcu_mio_bs_bclk;
input		tcu_mio_bs_uclk;
output		data_to_core;
input		bs_scan_in;
output		bs_scan_out;
input		tcu_mio_bs_scan_en;
input		tcu_mio_bs_mode_ctl;
inout		pad;
input		ain_mux_data;
input		bin_mux_data;
input		cin_mux_data;
input		ain_mux_sel;
input		bin_mux_sel;
input		cin_mux_sel;
input		cmp_io2x_sync_en_fnl;

input		l2clk;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           scan_in;
output          scan_out;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;

l1clkhdr_ctl_macro l1clk_gen (
        .l2clk  ( l2clk ),
        .l1en   ( 1'b1 ),
        .l1clk  ( l1clk ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );


msff_ctl_macro_en_1_width_2 ff_in_mux_data        (
	.scan_in	( ff_in_mux_data_scanin ),
	.scan_out	( ff_in_mux_data_scanout ),
	.l1clk		( l1clk ),
	.en		( cmp_io2x_sync_en_fnl ),
	.din		( { ain_mux_data , bin_mux_data } ),
	.dout		( { ain_mux_data_dout , bin_mux_data_dout } ),
  .siclk(siclk),
  .soclk(soclk) );


mux_ctl_macro_mux_aonpe_ports_3_width_1 mux_data 
              (.dout (data_from_core),
               .din0  (ain_mux_data_dout),     .sel0 (ain_mux_sel),
               .din1  (bin_mux_data_dout),     .sel1 (bin_mux_sel),
               .din2  (cin_mux_data),          .sel2 (cin_mux_sel)
              ) ;


cl_sc1_bs_cell2_4x ff_in (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( rcvr_out ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_in_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( data_to_core ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_in_scanout ) );

cl_sc1_bs_cell2_4x ff_out (
	.mode		( tcu_mio_bs_mode_ctl ),
	.muxd		( data_from_core ),
	.d		( rcvr_out ),
	.l1clk		( l1bsclk ),
	.si		( ff_out_scanin ),
	.siclk		( tcu_mio_bs_aclk ),
	.soclk		( tcu_mio_bs_bclk ),
	.updateclk	( tcu_mio_bs_uclk ),
	.q		( drvr_in ),
        .highz_n		( 1'b1 ), // sw148268 Apr2'05
	.so		( ff_out_scanout ) );

l1clkhdr_ctl_macro l1bsclk_gen (
        .l2clk          ( tcu_mio_bs_clk ),
        .l1en           ( 1'b1 ),
        .l1clk          ( l1bsclk ),
        .pce_ov         ( 1'b1 ),
        .se             ( tcu_mio_bs_scan_en ),
        .stop           ( 1'b0 ) );      

///// Driver Model w/ OE input /////

assign pad = drvr_in ? 1'bz : 1'b0 ;

///// Receiver Model /////

assign rcvr_out = pad ;

///// Boundary Scan Chain /////

assign bs_scan_out = ff_out_scanout ;
assign ff_out_scanin = ff_in_scanout ;
assign ff_in_scanin = bs_scan_in ;

///// Regular Scan Chain /////

assign scan_out = ff_in_mux_data_scanout ;
assign ff_in_mux_data_scanin = scan_in ;

endmodule


module l1clkhdr_ctl_macro_dl1hdr_24x (
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

cl_sc1_l1hdr_24x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);

endmodule


module l1clkhdr_ctl_macro (
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


module n2_pcm_main_blk (
pmi,
pmo,
burnin_pcm,
pcm_reset_l,
sel59,
sel60,
sel61,
sel_m3,
vdd_pcm,
vss_pcm,
vddo_pcm,
ro_in
);

input       sel_m3;
input       vdd_pcm;
input       vss_pcm;
input       vddo_pcm;


input [1:0] pmi;
input burnin_pcm;
input pcm_reset_l;
input ro_in;

output pmo;
output sel59;
output sel60;
output sel61;

wire [6:0]  qcorepcm;
wire        bypass;
wire        out;

n2_i_hpcm_blk1_m2 hpcm_blk1 ( 
       .pmi0  (pmi[0]),
       .pmi1  (pmi[1]),
       .jt_burnin (burnin_pcm),
       .reset_l   (pcm_reset_l),
       .qcorepcm  (qcorepcm[6:0]),
       .out       (bypass)
//     .mdl_out  (mdl_out)
        );   

n2_i_hpcm_blk3  hpcm_blk3  (
	.q	(qcorepcm[6:0]),
	.burnin (burnin_pcm),
	.sel59  (sel59),
	.sel60  (sel60),
	.sel61  (sel61),
	.out    (out),
        .bypass (bypass)
        );

n2_i_pcm_pmo   pmo_gen_blk 
      (
      .pmo      (pmo)
      );

endmodule

module n2_i_hpcm_blk1_m2 (
pmi0,
pmi1,
jt_burnin,
reset_l,
qcorepcm,
out
);

input  pmi0;
input  pmi1;
input jt_burnin;
input reset_l;
output [6:0] qcorepcm;
output out;

n2_i_pcm_schmitt_m2  schmitt_buff (
 	.pmi0	(pmi0),
	.out	(out)
	);

n2_i_pcm_counter_m2 pcm_counter  (
	.ck	(out),
	.pmi1   (pmi1),
	.reset_l (reset_l),
	.qcorepcm (qcorepcm[6:0])
	);
endmodule


module n2_i_pcm_schmitt_m2 (
pmi0,
out
);
input pmi0;
output out;
assign out = pmi0; // Schmitt Trigger Buffer
endmodule

module n2_i_pcm_counter_m2 (
ck,
pmi1,
reset_l,
qcorepcm
);

input ck;
input pmi1;
input reset_l;
output [6:0] qcorepcm;

reg [6:0]  qcorepcm;

wire count_eq_127;

assign count_eq_127 = (qcorepcm[6:0] == 7'b1111111);

always @ (posedge ck or negedge reset_l)
   if (~reset_l) 
           qcorepcm = 7'b0000000;
   else if (~pmi1 & ~count_eq_127)
           qcorepcm = qcorepcm + 1'b1;
   else if (~pmi1 & count_eq_127)
           qcorepcm = 7'b0000000;
   else    qcorepcm = qcorepcm;

endmodule 

module n2_i_hpcm_blk3 (
burnin,
q,
sel59,
sel60,
sel61,
bypass,
out
);

input [6:0]  q;
input        burnin;
input        bypass;
output       sel59;
output       sel60;
output       sel61;
output       out;

assign out = 1'b1;

n2_i_hpcm_dec7_m2 pcm_decoder (
	.burnin		(burnin),
	.q		(q[6:0]),
	.sel59		(sel59),
	.sel60		(sel60),
	.sel61		(sel61),
	.sel56		(),
	.sel57		(),
	.sel58		()
	);

endmodule 

module n2_i_hpcm_dec7_m2 (
burnin,
q,
sel59,
sel60,
sel61,
sel56,
sel57,
sel58
);

input	burnin;
input	[6:0] q;
output  sel56;
output  sel57;
output  sel58;
output  sel59;
output  sel60;
output  sel61;

assign sel56 = (q[6:0] == 7'b0111000);
assign sel57 = (q[6:0] == 7'b0111001);
assign sel58  = (q[6:0] == 7'b0111010);
assign sel59 = (q[6:0] == 7'b0111011);
assign sel60 = (q[6:0] == 7'b0111100);
assign sel61 = (q[6:0] == 7'b0111101);

endmodule

module n2_i_pcm_pmo (
pmo
);

output pmo;

assign pmo = 1'b0;

endmodule
 
