// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: vcd_scope.vh
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
if ($test$plusargs("DUMP_LIMIT")) begin // {

`ifndef GATESIM

  if ($test$plusargs("DUMP_PINS")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_PINS plusarg detected");
	  // ANALOG //
    $dumpvars(1,tb_top.cpu.VDD_PLL_CMP_REG);
    $dumpvars(1,tb_top.cpu.VDD_RNG_HV);
    $dumpvars(1,tb_top.cpu.VDD_SENSE);
    $dumpvars(1,tb_top.cpu.VSS_SENSE);
    $dumpvars(1,tb_top.cpu.VDDO_PCM);
    $dumpvars(1,tb_top.cpu.DIODE_TOP);
    $dumpvars(1,tb_top.cpu.DIODE_BOT);
    $dumpvars(1,tb_top.cpu.RNG_ANLG_CHAR_OUT);
    $dumpvars(1,tb_top.cpu.PLL_CHAR_OUT);  // should be PLL_CMP_CHAR_OUT[1:0]
    $dumpvars(1,tb_top.cpu.PLL_TESTMODE);
    $dumpvars(1,tb_top.cpu.VREG_SELBG_L);


	  // BISI //
    $dumpvars(1,tb_top.cpu.tcu_bisx_done);
    $dumpvars(1,tb_top.cpu.tcu.mbist_done);

	  // CLOCKS //
    $dumpvars(1,tb_top.cpu.PLL_CMP_CLK_P);
    $dumpvars(1,tb_top.cpu.PLL_CMP_CLK_N);
    $dumpvars(1,tb_top.cpu.FBDIMM1_REFCLK_P);
    $dumpvars(1,tb_top.cpu.FBDIMM1_REFCLK_N);
    $dumpvars(1,tb_top.cpu.FBDIMM2_REFCLK_P);
    $dumpvars(1,tb_top.cpu.FBDIMM2_REFCLK_N);
    $dumpvars(1,tb_top.cpu.FBDIMM3_REFCLK_P);
    $dumpvars(1,tb_top.cpu.FBDIMM3_REFCLK_N);
    $dumpvars(1,tb_top.cpu.PEX_REFCLK_P);
    $dumpvars(1,tb_top.cpu.PEX_REFCLK_N);
`ifndef FC_NO_NIU_T2
    $dumpvars(1,tb_top.cpu.XAUI0_REFCLK_P);
    $dumpvars(1,tb_top.cpu.XAUI0_REFCLK_N);
`endif
    $dumpvars(1,tb_top.cpu.tcu.gclk);
    $dumpvars(1,tb_top.cpu.ccu.cmp_pll_clk);
    $dumpvars(1,tb_top.cpu.ccu.dr_pll_clk);
    $dumpvars(1,tb_top.cpu.efu.iol2clk);
    $dumpvars(1,tb_top.cpu.l2clk);

	  // DEBUG //
    $dumpvars(1,tb_top.cpu.DBG_DQ);
    $dumpvars(1,tb_top.cpu.dbg1_mio_drv_en_muxtest_inp);
    $dumpvars(1,tb_top.cpu.dbg1_mio_drv_en_muxtestpll_inp);
    // tb_top.cpu.DBG_DQ[165:160])	----> SOC Observability FSM state	//
    // tb_top.cpu.DBG_DQ[159])		----> SCAN_OUT31			//
    // tb_top.cpu.DBG_DQ[158])		----> SCAN_IN31				//
    // tb_top.cpu.DBG_DQ[157])		----> PLL_CMP_CHAR_IN			//
    // tb_top.cpu.DBG_DQ[156:151])	----> PLL_CMP_DIV2[5:0]			//
    // tb_top.cpu.DBG_DQ[150])		----> PLL_CMP_TRST_L			//
    // tb_top.cpu.DBG_DQ[149])		----> PLL_CMP_CLAMP_FLTR		//
    // tb_top.cpu.DBG_DQ[148:147])						//
    // tb_top.cpu.DBG_DQ[146:140])	----> PLL_CMP_DIV4[6:0]			//	
    // tb_top.cpu.DBG_DQ[139])		----> PLL_EXT_DR_CLK			//
    // tb_top.cpu.DBG_DQ[138])		----> PLL_EXT_CMP_CLK			//
    // tb_top.cpu.DBG_DQ[137])		----> AC_TESTMODE			//
    // tb_top.cpu.DBG_DQ[136])		----> AC_TESTTRIG			//
    // tb_top.cpu.DBG_DQ[135])		----> ACLK				//
    // tb_top.cpu.DBG_DQ[134])		----> BCLK				//
    // tb_top.cpu.DBG_DQ[133:103])	----> SCAN_IN[30:0]			//
    // tb_top.cpu.DBG_DQ[102:85]);						//
    // tb_top.cpu.DBG_DQ[84])		----> PEU_CLK_EXT			//
    // tb_top.cpu.DBG_DQ[83]);							//
    // tb_top.cpu.DBG_DQ[82:77])	----> NIU_CLK_EXT[5:0]			//
    // tb_top.cpu.DBG_DQ[76:75]);						//
    // tb_top.cpu.DBG_DQ[74])		----> SCAN_ENABLE			//
    // tb_top.cpu.DBG_DQ[73:43])	----> SCAN_OUT[30:0]			//
    // tb_top.cpu.DBG_DQ[42])		----> DMO_SYNC				//
    // tb_top.cpu.DBG_DQ[41:2])		----> DMO_DATA[39:0]			//
    // tb_top.cpu.DBG_DQ[1])		----> MBIST_DONE			//
    // tb_top.cpu.DBG_DQ[0])		----> MBIST_FAIL			//
    $dumpvars(1,tb_top.cpu.DBG_CK0);
    $dumpvars(1,tb_top.cpu.TRIGIN);
    $dumpvars(1,tb_top.cpu.TRIGOUT);
    $dumpvars(1,tb_top.cpu.tcu_sck_bypass);
    $dumpvars(1,tb_top.cpu.tcu.mbist_ctl.bisx_counter);
    $dumpvars(1,tb_top.cpu.tcu_rst_clk_stop);
    $dumpvars(1,tb_top.cpu.tcu_rst_io_clk_stop);
    $dumpvars(1,tb_top.cpu.tcu_efu_read_start);
    $dumpvars(1,tb_top.cpu.tcu.tcu_mbist_start);
    $dumpvars(1,tb_top.cpu.ncu.coreavail);


	  // FBDIMM //
    $dumpvars(1,tb_top.cpu.FBDIMM0A_TX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM0A_TX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM0B_TX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM0B_TX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM1A_TX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM1A_TX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM1B_TX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM1B_TX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM2A_TX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM2A_TX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM2B_TX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM2B_TX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM3A_TX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM3A_TX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM3B_TX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM3B_TX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM0A_RX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM0A_RX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM0B_RX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM0B_RX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM1A_RX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM1A_RX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM1B_RX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM1B_RX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM2A_RX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM2A_RX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM2B_RX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM2B_RX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM3A_RX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM3A_RX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM3B_RX_P);
    $dumpvars(1,tb_top.cpu.FBDIMM3B_RX_N);
    $dumpvars(1,tb_top.cpu.FBDIMM0A_AMUX);
    $dumpvars(1,tb_top.cpu.FBDIMM0B_AMUX);
    $dumpvars(1,tb_top.cpu.FBDIMM1A_AMUX);
    $dumpvars(1,tb_top.cpu.FBDIMM1B_AMUX);
    $dumpvars(1,tb_top.cpu.FBDIMM2A_AMUX);
    $dumpvars(1,tb_top.cpu.FBDIMM2B_AMUX);
    $dumpvars(1,tb_top.cpu.FBDIMM3A_AMUX);
    $dumpvars(1,tb_top.cpu.FBDIMM3B_AMUX);
    $dumpvars(1,tb_top.cpu.mcu0_fsr0_data);
    $dumpvars(1,tb_top.cpu.fsr0_mcu0_data);
    $dumpvars(1,tb_top.cpu.mcu1_fsr2_data);
    $dumpvars(1,tb_top.cpu.fsr2_mcu1_data);
    $dumpvars(1,tb_top.cpu.mcu2_fsr4_data);
    $dumpvars(1,tb_top.cpu.fsr4_mcu2_data);
    $dumpvars(1,tb_top.cpu.mcu3_fsr6_data);
    $dumpvars(1,tb_top.cpu.fsr6_mcu3_data);

	  // FLUSH-RESETS //
    $dumpvars(1,tb_top.cpu.tcu.rst_tcu_flush_init_req);
    $dumpvars(1,tb_top.cpu.tcu.tcu_rst_flush_init_ack);
    $dumpvars(1,tb_top.cpu.tcu.rst_tcu_flush_stop_req);
    $dumpvars(1,tb_top.cpu.tcu.tcu_rst_flush_stop_ack);
    $dumpvars(1,tb_top.cpu.tcu.sigmux_ctl.clock_stop_active);
    $dumpvars(1,tb_top.cpu.tcu_se_scancollar_in);
    // $dumpvars(1,tb_top.cpu.rst.rst_fsm_ctl.rst_soc_run);
    $dumpvars(1,tb_top.cpu.rst_ncu_unpark_thread);

	  // JTAG //
    $dumpvars(1,tb_top.cpu.TCK);
    $dumpvars(1,tb_top.cpu.TMS);
    $dumpvars(1,tb_top.cpu.TDI);
    $dumpvars(1,tb_top.cpu.TDO);
    $dumpvars(1,tb_top.cpu.tcu.jtag_ctl.tap_state);
    $dumpvars(1,tb_top.cpu.tcu.jtag_ctl.instr);
    $dumpvars(1,tb_top.cpu.tcu.jtag_creg_addr);
    $dumpvars(1,tb_top.cpu.tcu.jtag_ctl.jtag_creg_data);

	  // MISC. //
    $dumpvars(1,tb_top.cpu.PMI);
    $dumpvars(1,tb_top.cpu.PMO);
    $dumpvars(1,tb_top.cpu.PGRM_EN);
    $dumpvars(1,tb_top.cpu.VPP);
    $dumpvars(1,tb_top.cpu.BURNIN);

	  // PCIE //
    $dumpvars(1,tb_top.cpu.PEX_TX_P);
    $dumpvars(1,tb_top.cpu.PEX_TX_N);
    $dumpvars(1,tb_top.cpu.PEX_RX_P);
    $dumpvars(1,tb_top.cpu.PEX_RX_N);
    $dumpvars(1,tb_top.cpu.PEX_AMUX);
// added this
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
    $dumpvars(1,tb_top.cpu.peu.peu_mio_pipe_txdata);
    $dumpvars(1,tb_top.cpu.peu.peu_mio_pipe_txdatak);
`endif
`endif
	  // RESETS //
    $dumpvars(1,tb_top.cpu.PWRON_RST_L);
    $dumpvars(1,tb_top.cpu.PB_RST_L);
    $dumpvars(1,tb_top.cpu.BUTTON_XIR_L);
    $dumpvars(1,tb_top.cpu.PEX_RESET_L);
    $dumpvars(1,tb_top.cpu.TRST_L);
    // $dumpvars(1,tb_top.cpu.sigmux_ctl.por_one);
    // $dumpvars(1,tb_top.cpu.sigmux_ctl.por_two);
    // $dumpvars(1,tb_top.cpu.sigmux_ctl.wmr_one);
    // $dumpvars(1,tb_top.cpu.sigmux_ctl.wmr_two);
    $dumpvars(1,tb_top.cpu.tcu.sigmux_ctl.jtag_por_active);
    $dumpvars(1,tb_top.cpu.rst_l2_por_);
    $dumpvars(1,tb_top.cpu.rst_l2_wmr_);
    // $dumpvars(1,tb_top.cpu.sio.rst_por_);
    // $dumpvars(1,tb_top.cpu.l2b0.rst_por_);
    // $dumpvars(1,tb_top.cpu.l2b1.rst_por_);
    // $dumpvars(1,tb_top.cpu.l2b2.rst_por_);
    // $dumpvars(1,tb_top.cpu.l2b3.rst_por_);
    // $dumpvars(1,tb_top.cpu.l2b4.rst_por_);
    // $dumpvars(1,tb_top.cpu.l2b5.rst_por_);
    // $dumpvars(1,tb_top.cpu.l2b6.rst_por_);
    // $dumpvars(1,tb_top.cpu.l2b7.rst_por_);
    // $dumpvars(1,tb_top.rst_por_);
    // $dumpvars(1,tb_top.cpu.sio.rst_wmr_);
    // $dumpvars(1,tb_top.cpu.l2b0.rst_wmr_);
    // $dumpvars(1,tb_top.cpu.l2b1.rst_wmr_);
    // $dumpvars(1,tb_top.cpu.l2b2.rst_wmr_);
    // $dumpvars(1,tb_top.cpu.l2b3.rst_wmr_);
    // $dumpvars(1,tb_top.cpu.l2b4.rst_wmr_);
    // $dumpvars(1,tb_top.cpu.l2b5.rst_wmr_);
    // $dumpvars(1,tb_top.cpu.l2b6.rst_wmr_);
    // $dumpvars(1,tb_top.cpu.l2b7.rst_wmr_);  
    // $dumpvars(1,tb_top.rst_wmr_); 
    // $dumpvars(1,tb_top.cpu.rst.rst_dmu_peu_por_);
    // $dumpvars(1,tb_top.cpu.rst.rst_dmu_peu_wmr_);
    // $dumpvars(1,tb_top.cpu.rst.rst_niu_);
    // $dumpvars(1,tb_top.cpu.rst_niu_wmr_);
    $dumpvars(1,tb_top.cpu.rst.rst_mio_rst_state);
    $dumpvars(1,tb_top.cpu.rst_ccu_pll_);
    $dumpvars(1,tb_top.cpu.rst_ccu_);
    $dumpvars(1,tb_top.cpu.tcu_efu_read_start);
    $dumpvars(1,tb_top.cpu.efu.sbc_efa_word_addr);
    $dumpvars(1,tb_top.cpu.tcu_rst_efu_done);
    $dumpvars(1,tb_top.cpu.tcu_bisx_done);
    $dumpvars(1,tb_top.cpu.ccu_serdes_dtm);
    $dumpvars(1,tb_top.cpu.tcu.cycle_count);    

	  // SSI //
    $dumpvars(1,tb_top.cpu.SSI_SCK);
    $dumpvars(1,tb_top.cpu.SSI_MOSI);
    $dumpvars(1,tb_top.cpu.SSI_MISO);
    $dumpvars(1,tb_top.cpu.SSI_EXT_INT_L);
    $dumpvars(1,tb_top.cpu.SSI_SYNC_L);
    $dumpvars(1,tb_top.cpu.ncu.ncu_ssitop_ctl.ncu_ssisif_ctl.ssi_sm);
    $dumpvars(1,tb_top.cpu.ncu.ncu_ssitop_ctl.ncu_ssisif_ctl.ssi_sm_rst_l);

	  // STCI //
    $dumpvars(1,tb_top.cpu.STCICLK);
    $dumpvars(1,tb_top.cpu.STCICFG);
    $dumpvars(1,tb_top.cpu.STCID);
    $dumpvars(1,tb_top.cpu.STCIQ);

	  // TEST CONTROLS //
    $dumpvars(1,tb_top.cpu.TESTCLKT);
    $dumpvars(1,tb_top.cpu.TESTCLKR);
    $dumpvars(1,tb_top.cpu.TESTMODE);
    $dumpvars(1,tb_top.cpu.DIVIDER_BYPASS);
    $dumpvars(1,tb_top.cpu.PLL_CMP_BYPASS);
    // $dumpvars(1,tb_top.cpu.PLL_DR_BYPASS);
    $dumpvars(1,tb_top.cpu.PWR_THRTTL_0);
    $dumpvars(1,tb_top.cpu.PWR_THRTTL_1);
    // $dumpvars(1,tb_top.cpu.SPARE);

`ifndef FC_NO_NIU_T2
	  // XAUI //
    $dumpvars(1,tb_top.cpu.XAUI_MDINT1_L);
    $dumpvars(1,tb_top.cpu.XAUI_MDINT0_L); 
    $dumpvars(1,tb_top.cpu.XAUI0_TX_P);
    $dumpvars(1,tb_top.cpu.XAUI0_TX_N);
    $dumpvars(1,tb_top.cpu.XAUI0_RX_P);
    $dumpvars(1,tb_top.cpu.XAUI0_RX_N);
    $dumpvars(1,tb_top.cpu.XAUI1_TX_P);
    $dumpvars(1,tb_top.cpu.XAUI1_TX_N);
    $dumpvars(1,tb_top.cpu.XAUI1_RX_P);
    $dumpvars(1,tb_top.cpu.XAUI1_RX_N);
    $dumpvars(1,tb_top.cpu.XAUI0_AMUX);
    $dumpvars(1,tb_top.cpu.XAUI0_LINK_LED);
    $dumpvars(1,tb_top.cpu.XAUI0_ACT_LED);
    $dumpvars(1,tb_top.cpu.XAUI1_AMUX);
    $dumpvars(1,tb_top.cpu.XAUI1_LINK_LED);
    $dumpvars(1,tb_top.cpu.XAUI1_ACT_LED);
    $dumpvars(1,tb_top.cpu.XAUI_MDC);
    $dumpvars(1,tb_top.cpu.XAUI_MDIO);
    $dumpvars(1,tb_top.cpu.mdoe);
`endif
  end //}

`endif

end
