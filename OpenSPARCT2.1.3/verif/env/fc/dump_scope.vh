// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dump_scope.vh
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

  //--------------------
  // Conditionally dump verif modules
  if ($test$plusargs("DUMP_CPU")) begin // {
   $fsdbDumpvars(1,tb_top.cpu);
  end // }
  //--------------------
  // Conditionally dump
  if ($test$plusargs("DUMP_TOP")) begin // {
   $fsdbDumpvars(1,tb_top);
  end // }
  //
  if ($test$plusargs("CPU_PINS")) begin // {
    $fsdbDumpvars(1,tb_top.cpu,"+IO_Only");
  end // }
  //
  //---------------------------------------
  //
  if ($test$plusargs("DUMP_ENV")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_ENV plusarg detected");
    $fsdbDumpvars(2,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
`ifndef PLAYBACK
    $fsdbDumpvars(0,tb_top.verif_args);
    $fsdbDumpvars(0,tb_top.nas_top);
    $fsdbDumpvars(0,tb_top.tlb_sync);
    $fsdbDumpvars(0,tb_top.ldst_sync);
    $fsdbDumpvars(0,tb_top.int_sync);
    $fsdbDumpvars(0,tb_top.err_sync);
`endif
`ifndef GATESIM
    // removed this for T2
    //$fsdbDumpvars(0,tb_top.mcusat_cov_mon);
    $fsdbDumpvars(0,fc_dmupeu_csr_probe);
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
    $fsdbDumpvars(0,fc_niu_csr_probe);
`endif
`endif
    $fsdbDumpvars(0,fc_ncu_csr_probe);
    $fsdbDumpvars(0,fc_l2_csr_probe);
    $fsdbDumpvars(0,fc_mcu_csr_probe);
`endif
    //$fsdbDumpvars(0,tb_top.ras);
    //$fsdbDumpvars(0,tb_top.debug);
    //$fsdbDumpvars(0,tb_top.monitors);
  end // }
  

  //--------------------
  // Conditionally dump monitors
  if ($test$plusargs("DUMP_MON")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_MON plusarg detected");
     // monitors included in  monitors_soc.v
`ifndef GATESIM
    $fsdbDumpvars(0,socras_mon); // aka iosras_mon
    $fsdbDumpvars(0,ncu_ucbmon);
    $fsdbDumpvars(0,mcu_errmon);
    $fsdbDumpvars(0,mcu_fmon);
    $fsdbDumpvars(0,nb_crc_mon);
    $fsdbDumpvars(0,ddr2_monitor);
    $fsdbDumpvars(0,l2esr_mon);
    $fsdbDumpvars(0,l2_tagstate_mon);
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
   $fsdbDumpvars(0,pcie_intx_mon);
`endif
`endif
   // removed this for T2
    //$fsdbDumpvars(0,dmu_int_relocation_cov_mon);
    $fsdbDumpvars(0,mcuesr_mon);
`ifndef TO_1_0_VECTORS
    $fsdbDumpvars(0,global_monitor);
`endif
`endif
  end // }

  //--------------------
  // Conditionally dump all top lvel design modules 
  if ($test$plusargs("DUMP_TOPMOD")) begin // {
   $fsdbDumpvars(1,tb_top.cpu);
   $fsdbDumpvars(1,tb_top.cpu.ccu);
   $fsdbDumpvars(1,tb_top.cpu.ccx);
   $fsdbDumpvars(1,tb_top.cpu.efu);
   $fsdbDumpvars(1,tb_top.cpu.dbg0);
   $fsdbDumpvars(1,tb_top.cpu.dbg1);
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
   $fsdbDumpvars(1,tb_top.cpu.esr);
   $fsdbDumpvars(1,tb_top.cpu.mac);
   $fsdbDumpvars(1,tb_top.cpu.rdp);
`endif
`endif
   $fsdbDumpvars(1,tb_top.cpu.mio);
   $fsdbDumpvars(1,tb_top.cpu.ncu);
// added this
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
   $fsdbDumpvars(1,tb_top.cpu.psr);
`endif
`endif
   $fsdbDumpvars(1,tb_top.cpu.sii);
   $fsdbDumpvars(1,tb_top.cpu.sio);
   $fsdbDumpvars(1,tb_top.cpu.tcu);
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
   $fsdbDumpvars(1,tb_top.cpu.tds);
   $fsdbDumpvars(1,tb_top.cpu.rtx);
`endif
`endif
   $fsdbDumpvars(1,tb_top.cpu.rst);
   $fsdbDumpvars(1,tb_top.cpu.mcu0);
   $fsdbDumpvars(1,tb_top.cpu.mcu1);
   $fsdbDumpvars(1,tb_top.cpu.mcu2);
   $fsdbDumpvars(1,tb_top.cpu.mcu3);
   $fsdbDumpvars(1,tb_top.cpu.l2b0);
   $fsdbDumpvars(1,tb_top.cpu.l2b1);
   $fsdbDumpvars(1,tb_top.cpu.l2b2);
   $fsdbDumpvars(1,tb_top.cpu.l2b3);
   $fsdbDumpvars(1,tb_top.cpu.l2b4);
   $fsdbDumpvars(1,tb_top.cpu.l2b5);
   $fsdbDumpvars(1,tb_top.cpu.l2b6);
   $fsdbDumpvars(1,tb_top.cpu.l2b7);
   $fsdbDumpvars(1,tb_top.cpu.l2d0);
   $fsdbDumpvars(1,tb_top.cpu.l2d1);
   $fsdbDumpvars(1,tb_top.cpu.l2d2);
   $fsdbDumpvars(1,tb_top.cpu.l2d3);
   $fsdbDumpvars(1,tb_top.cpu.l2d4);
   $fsdbDumpvars(1,tb_top.cpu.l2d5);
   $fsdbDumpvars(1,tb_top.cpu.l2d6);
   $fsdbDumpvars(1,tb_top.cpu.l2d7);
   $fsdbDumpvars(1,tb_top.cpu.l2t0);
   $fsdbDumpvars(1,tb_top.cpu.l2t1);
   $fsdbDumpvars(1,tb_top.cpu.l2t2);
   $fsdbDumpvars(1,tb_top.cpu.l2t3);
   $fsdbDumpvars(1,tb_top.cpu.l2t4);
   $fsdbDumpvars(1,tb_top.cpu.l2t5);
   $fsdbDumpvars(1,tb_top.cpu.l2t6);
   $fsdbDumpvars(1,tb_top.cpu.l2t7);
   $fsdbDumpvars(1,tb_top.cpu.spc0);

  end // }

  //--------------------
  // Conditionally dump verif modules
  if ($test$plusargs("DUMP_DMUPEU")) begin // {
   $fsdbDumpvars(1,tb_top.cpu.dmu);
// added this
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
   $fsdbDumpvars(1,tb_top.cpu.peu);
`endif
`endif
  end // }
 
  //--------------------
  // Conditionally dump the cores
  `ifdef CORE_0
  if ($test$plusargs("DUMP_SPC0")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_SPC0 plusarg detected");
`ifndef PLAYBACK
    $fsdbDumpvars(0,tb_top.intf0);
`endif
    $fsdbDumpvars(0,tb_top.cpu.spc0);
  end // }
  `endif
  `ifdef CORE_1
  if ($test$plusargs("DUMP_SPC1")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_SPC1 plusarg detected");
    $fsdbDumpvars(0,tb_top.intf1);
    $fsdbDumpvars(0,tb_top.cpu.spc1);
  end // }
  `endif
  `ifdef CORE_2
  if ($test$plusargs("DUMP_SPC2")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_SPC2 plusarg detected");
    $fsdbDumpvars(0,tb_top.intf2);
    $fsdbDumpvars(0,tb_top.cpu.spc2);
  end // }
  `endif
  `ifdef CORE_3
  if ($test$plusargs("DUMP_SPC3")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_SPC3 plusarg detected");
    $fsdbDumpvars(0,tb_top.intf3);
    $fsdbDumpvars(0,tb_top.cpu.spc3);
  end // }
  `endif
  `ifdef CORE_4
  if ($test$plusargs("DUMP_SPC4")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_SPC4 plusarg detected");
    $fsdbDumpvars(0,tb_top.intf4);
    $fsdbDumpvars(0,tb_top.cpu.spc4);
  end // }
  `endif
  `ifdef CORE_5
  if ($test$plusargs("DUMP_SPC5")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_SPC5 plusarg detected");
    $fsdbDumpvars(0,tb_top.intf5);
    $fsdbDumpvars(0,tb_top.cpu.spc5);
  end // }
  `endif
  `ifdef CORE_6
  if ($test$plusargs("DUMP_SPC6")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_SPC6 plusarg detected");
    $fsdbDumpvars(0,tb_top.intf6);
    $fsdbDumpvars(0,tb_top.cpu.spc6);
  end // }
  `endif
  `ifdef CORE_7
  if ($test$plusargs("DUMP_SPC7")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_SPC7 plusarg detected");
    $fsdbDumpvars(0,tb_top.intf7);
    $fsdbDumpvars(0,tb_top.cpu.spc7);
  end // }
  `endif


  // AT 03/23/06: Added Tung's DUMP_PINS option for vector gen.
  //---------------------------------------------------------


// `ifndef GATESIM
  if ($test$plusargs("DUMP_PINS")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_PINS plusarg detected");
	// ANALOG //
    $fsdbDumpvars(1,tb_top.cpu.VDD_PLL_CMP_REG);
    $fsdbDumpvars(1,tb_top.cpu.VDD_RNG_HV);
    $fsdbDumpvars(1,tb_top.cpu.VDD_SENSE);
    $fsdbDumpvars(1,tb_top.cpu.VSS_SENSE);
    $fsdbDumpvars(1,tb_top.cpu.VDDO_PCM);
    $fsdbDumpvars(1,tb_top.cpu.DIODE_TOP);
    $fsdbDumpvars(1,tb_top.cpu.DIODE_BOT);
    $fsdbDumpvars(1,tb_top.cpu.RNG_ANLG_CHAR_OUT);
    $fsdbDumpvars(1,tb_top.cpu.PLL_CHAR_OUT);  // should be PLL_CMP_CHAR_OUT
    $fsdbDumpvars(1,tb_top.cpu.PLL_TESTMODE);
    $fsdbDumpvars(1,tb_top.cpu.VREG_SELBG_L);


	// BISI //
    $fsdbDumpvars(1,tb_top.cpu.tcu_bisx_done);
    $fsdbDumpvars(1,tb_top.cpu.tcu.mbist_done);

	// CLOCKS //
    $fsdbDumpvars(1,tb_top.cpu.PLL_CMP_CLK_P);
    $fsdbDumpvars(1,tb_top.cpu.PLL_CMP_CLK_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1_REFCLK_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1_REFCLK_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2_REFCLK_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2_REFCLK_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3_REFCLK_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3_REFCLK_N);
    $fsdbDumpvars(1,tb_top.cpu.PEX_REFCLK_P);
    $fsdbDumpvars(1,tb_top.cpu.PEX_REFCLK_N);
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
    $fsdbDumpvars(1,tb_top.cpu.XAUI0_REFCLK_P);
    $fsdbDumpvars(1,tb_top.cpu.XAUI0_REFCLK_N);
`endif
`endif
    $fsdbDumpvars(1,tb_top.cpu.tcu.gclk);
    $fsdbDumpvars(1,tb_top.cpu.ccu.cmp_pll_clk);
    $fsdbDumpvars(1,tb_top.cpu.ccu.dr_pll_clk);
    $fsdbDumpvars(1,tb_top.cpu.efu.iol2clk);
    $fsdbDumpvars(1,tb_top.cpu.l2clk);

	// DEBUG //
    $fsdbDumpvars(1,tb_top.cpu.DBG_DQ);
    $fsdbDumpvars(1,tb_top.cpu.dbg1_mio_drv_en_muxtest_inp);
    $fsdbDumpvars(1,tb_top.cpu.dbg1_mio_drv_en_muxtestpll_inp);
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
    // tb_top.cpu.DBG_DQ[83]);                                                  //
    // tb_top.cpu.DBG_DQ[82:77])	----> NIU_CLK_EXT[5:0]			//
    // tb_top.cpu.DBG_DQ[76:75]);						//
    // tb_top.cpu.DBG_DQ[74])		----> SCAN_ENABLE			//
    // tb_top.cpu.DBG_DQ[73:43])	----> SCAN_OUT[30:0]			//
    // tb_top.cpu.DBG_DQ[42])		----> DMO_SYNC				//
    // tb_top.cpu.DBG_DQ[41:2])		----> DMO_DATA[39:0]			//
    // tb_top.cpu.DBG_DQ[1])		----> MBIST_DONE			//
    // tb_top.cpu.DBG_DQ[0])		----> MBIST_FAIL			//
    $fsdbDumpvars(1,tb_top.cpu.DBG_CK0);
    $fsdbDumpvars(1,tb_top.cpu.TRIGIN);
    $fsdbDumpvars(1,tb_top.cpu.TRIGOUT);
    $fsdbDumpvars(1,tb_top.cpu.tcu_sck_bypass);

`ifdef TCU_GATE
    $fsdbDumpvars(1,tb_top.verif_args.bisx_counter);
`else
    $fsdbDumpvars(1,tb_top.cpu.tcu.mbist_ctl.bisx_counter);
`endif // tcu_gate

    $fsdbDumpvars(1,tb_top.cpu.tcu_rst_clk_stop);
    $fsdbDumpvars(1,tb_top.cpu.tcu_rst_io_clk_stop);
    $fsdbDumpvars(1,tb_top.cpu.tcu_efu_read_start);

`ifdef TCU_GATE
    $fsdbDumpvars(1,tb_top.verif_args.mbist_start);
`else
    $fsdbDumpvars(1,tb_top.cpu.tcu.tcu_mbist_start);
`endif // tcu_gate

`ifdef NCU_GATE
    $fsdbDumpvars(1,tb_top.verif_args.coreavail);
`else
    $fsdbDumpvars(1,tb_top.cpu.ncu.coreavail);
`endif // ncu_gate

	// FBDIMM //
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0A_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0A_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0B_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0B_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1A_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1A_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1B_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1B_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2A_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2A_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2B_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2B_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3A_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3A_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3B_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3B_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0A_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0A_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0B_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0B_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1A_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1A_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1B_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1B_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2A_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2A_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2B_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2B_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3A_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3A_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3B_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3B_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0A_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM0B_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1A_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM1B_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2A_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM2B_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3A_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.FBDIMM3B_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.mcu0_fsr0_data);
    $fsdbDumpvars(1,tb_top.cpu.fsr0_mcu0_data);
    $fsdbDumpvars(1,tb_top.cpu.mcu1_fsr2_data);
    $fsdbDumpvars(1,tb_top.cpu.fsr2_mcu1_data);
    $fsdbDumpvars(1,tb_top.cpu.mcu2_fsr4_data);
    $fsdbDumpvars(1,tb_top.cpu.fsr4_mcu2_data);
    $fsdbDumpvars(1,tb_top.cpu.mcu3_fsr6_data);
    $fsdbDumpvars(1,tb_top.cpu.fsr6_mcu3_data);
	// FLUSH-RESETS //
    $fsdbDumpvars(1,tb_top.cpu.tcu.rst_tcu_flush_init_req);
    $fsdbDumpvars(1,tb_top.cpu.tcu.tcu_rst_flush_init_ack);
    $fsdbDumpvars(1,tb_top.cpu.tcu.rst_tcu_flush_stop_req);
    $fsdbDumpvars(1,tb_top.cpu.tcu.tcu_rst_flush_stop_ack);

`ifdef TCU_GATE
    $fsdbDumpvars(1,tb_top.verif_args.clock_stop_active);
`else
    $fsdbDumpvars(1,tb_top.cpu.tcu.sigmux_ctl.clock_stop_active);
`endif // tcu_gate

    $fsdbDumpvars(1,tb_top.cpu.tcu_se_scancollar_in);
    // $fsdbDumpvars(1,tb_top.cpu.rst.rst_fsm_ctl.rst_soc_run);
    $fsdbDumpvars(1,tb_top.cpu.rst_ncu_unpark_thread);

	// JTAG //
    $fsdbDumpvars(1,tb_top.cpu.TCK);
    $fsdbDumpvars(1,tb_top.cpu.TMS);
    $fsdbDumpvars(1,tb_top.cpu.TDI);
    $fsdbDumpvars(1,tb_top.cpu.TDO);

`ifdef TCU_GATE
    $fsdbDumpvars(1,tb_top.verif_args.tap_state);
    $fsdbDumpvars(1,tb_top.verif_args.instr);
`else
    $fsdbDumpvars(1,tb_top.cpu.tcu.jtag_ctl.tap_state);
    $fsdbDumpvars(1,tb_top.cpu.tcu.jtag_ctl.instr);
`endif // tcu_gate

    $fsdbDumpvars(1,tb_top.cpu.tcu.jtag_creg_addr);

`ifdef TCU_GATE
    $fsdbDumpvars(1,tb_top.cpu.tcu.jtag_creg_data);
`else
    $fsdbDumpvars(1,tb_top.cpu.tcu.jtag_ctl.jtag_creg_data);
`endif // tcu_gate

	// MISC. //
    $fsdbDumpvars(1,tb_top.cpu.PMI);
    $fsdbDumpvars(1,tb_top.cpu.PMO);
    $fsdbDumpvars(1,tb_top.cpu.PGRM_EN);
    $fsdbDumpvars(1,tb_top.cpu.VPP);
    $fsdbDumpvars(1,tb_top.cpu.BURNIN);

	// PCIE //
    $fsdbDumpvars(1,tb_top.cpu.PEX_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.PEX_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.PEX_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.PEX_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.PEX_AMUX);
// added this
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
    $fsdbDumpvars(1,tb_top.cpu.peu.peu_mio_pipe_txdata);
    $fsdbDumpvars(1,tb_top.cpu.peu.peu_mio_pipe_txdatak);
`endif
`endif
	// RESETS //
    $fsdbDumpvars(1,tb_top.cpu.PWRON_RST_L);
    $fsdbDumpvars(1,tb_top.cpu.PB_RST_L);
    $fsdbDumpvars(1,tb_top.cpu.BUTTON_XIR_L);
    $fsdbDumpvars(1,tb_top.cpu.PEX_RESET_L);
    $fsdbDumpvars(1,tb_top.cpu.TRST_L);
    // $fsdbDumpvars(1,tb_top.cpu.sigmux_ctl.por_one);
    // $fsdbDumpvars(1,tb_top.cpu.sigmux_ctl.por_two);
    // $fsdbDumpvars(1,tb_top.cpu.sigmux_ctl.wmr_one);
    // $fsdbDumpvars(1,tb_top.cpu.sigmux_ctl.wmr_two);

`ifdef TCU_GATE
    $fsdbDumpvars(1,tb_top.cpu.tcu.jtag_por_status);
`else
    $fsdbDumpvars(1,tb_top.cpu.tcu.sigmux_ctl.jtag_por_active);
`endif

    $fsdbDumpvars(1,tb_top.cpu.rst_l2_por_);
    $fsdbDumpvars(1,tb_top.cpu.rst_l2_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.sio.rst_por_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b0.rst_por_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b1.rst_por_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b2.rst_por_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b3.rst_por_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b4.rst_por_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b5.rst_por_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b6.rst_por_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b7.rst_por_);
    // $fsdbDumpvars(1,tb_top.rst_por_);
    // $fsdbDumpvars(1,tb_top.cpu.sio.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b0.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b1.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b2.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b3.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b4.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b5.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b6.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.l2b7.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.rst_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.rst.rst_dmu_peu_por_);
    // $fsdbDumpvars(1,tb_top.cpu.rst.rst_dmu_peu_wmr_);
    // $fsdbDumpvars(1,tb_top.cpu.rst.rst_niu_);
    // $fsdbDumpvars(1,tb_top.cpu.rst_niu_wmr_);
    $fsdbDumpvars(1,tb_top.cpu.rst.rst_mio_rst_state);
    $fsdbDumpvars(1,tb_top.cpu.rst_ccu_pll_);
    $fsdbDumpvars(1,tb_top.cpu.rst_ccu_);
    $fsdbDumpvars(1,tb_top.cpu.tcu_efu_read_start);
    $fsdbDumpvars(1,tb_top.cpu.efu.sbc_efa_word_addr);
    $fsdbDumpvars(1,tb_top.cpu.tcu_rst_efu_done);
    $fsdbDumpvars(1,tb_top.cpu.tcu_bisx_done);
    $fsdbDumpvars(1,tb_top.cpu.ccu_serdes_dtm);
    $fsdbDumpvars(1,tb_top.cpu.tcu.cycle_count);

	// SSI //
    $fsdbDumpvars(1,tb_top.cpu.SSI_SCK);
    $fsdbDumpvars(1,tb_top.cpu.SSI_MOSI);
    $fsdbDumpvars(1,tb_top.cpu.SSI_MISO);
    $fsdbDumpvars(1,tb_top.cpu.SSI_EXT_INT_L);
    $fsdbDumpvars(1,tb_top.cpu.SSI_SYNC_L);

`ifdef NCU_GATE
    $fsdbDumpvars(1,tb_top.verif_args.ssi_sm);
    $fsdbDumpvars(1,tb_top.cpu.ncu.ncu_ssitop_ctl__n2354);
`else
    $fsdbDumpvars(1,tb_top.cpu.ncu.ncu_ssitop_ctl.ncu_ssisif_ctl.ssi_sm);
    $fsdbDumpvars(1,tb_top.cpu.ncu.ncu_ssitop_ctl.ncu_ssisif_ctl.ssi_sm_rst_l);
`endif // ncu_gate


	// STCI //
    $fsdbDumpvars(1,tb_top.cpu.STCICLK);
    $fsdbDumpvars(1,tb_top.cpu.STCICFG);
    $fsdbDumpvars(1,tb_top.cpu.STCID);
    $fsdbDumpvars(1,tb_top.cpu.STCIQ);

	// TEST CONTROLS //
    $fsdbDumpvars(1,tb_top.cpu.TESTCLKT);
    $fsdbDumpvars(1,tb_top.cpu.TESTCLKR);
    $fsdbDumpvars(1,tb_top.cpu.TESTMODE);
    $fsdbDumpvars(1,tb_top.cpu.DIVIDER_BYPASS);
    $fsdbDumpvars(1,tb_top.cpu.PLL_CMP_BYPASS);
    // $fsdbDumpvars(1,tb_top.cpu.PLL_DR_BYPASS);
    $fsdbDumpvars(1,tb_top.cpu.PWR_THRTTL_0);
    $fsdbDumpvars(1,tb_top.cpu.PWR_THRTTL_1);
`ifdef TO_1_0_VECTORS
     $fsdbDumpvars(1,tb_top.cpu.SPARE);
`endif

	// XAUI //
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
`ifndef TO_1_0_VECTORS
    $fsdbDumpvars(1,tb_top.cpu.XAUI_MDINT1_L);
    $fsdbDumpvars(1,tb_top.cpu.XAUI_MDINT0_L);
`endif
    $fsdbDumpvars(1,tb_top.cpu.XAUI0_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.XAUI0_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.XAUI0_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.XAUI0_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.XAUI1_TX_P);
    $fsdbDumpvars(1,tb_top.cpu.XAUI1_TX_N);
    $fsdbDumpvars(1,tb_top.cpu.XAUI1_RX_P);
    $fsdbDumpvars(1,tb_top.cpu.XAUI1_RX_N);
    $fsdbDumpvars(1,tb_top.cpu.XAUI0_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.XAUI0_LINK_LED);
    $fsdbDumpvars(1,tb_top.cpu.XAUI0_ACT_LED);
    $fsdbDumpvars(1,tb_top.cpu.XAUI1_AMUX);
    $fsdbDumpvars(1,tb_top.cpu.XAUI1_LINK_LED);
    $fsdbDumpvars(1,tb_top.cpu.XAUI1_ACT_LED);
    $fsdbDumpvars(1,tb_top.cpu.XAUI_MDC);
    $fsdbDumpvars(1,tb_top.cpu.XAUI_MDIO);
    $fsdbDumpvars(1,tb_top.cpu.mdoe);
`endif
`endif


//Signal indicating splice point
`ifndef PLAYBACK
    $fsdbDumpvars(1,tb_top.splice_point);
`endif // PLAYBACK
// Add debug select dump
    if ($test$plusargs("DUMP_DEBUG_PORT")) begin // {
	`PR_NORMAL ("dump_scope",`NORMAL,"DUMP_DEBUG_PORT plusarg detected");
	// SOC OBSERVE
`ifndef GATESIM
          $fsdbDumpvars(1,tb_top.cpu.dbg1.dbg1_csr.dbg_train);
          $fsdbDumpvars(1,tb_top.cpu.dbg1.dbg1_csr.dbg_conf_mode);
	  $fsdbDumpvars(1,tb_top.cpu.dbg1.dbg1_dbgprt.soc_obs_data);
    	  $fsdbDumpvars(1,tb_top.cpu.dbg1.dbg1_dbgprt.charac_data);
          $fsdbDumpvars(1,tb_top.cpu.dbg1.dbg1_dbgprt.rep_data);
          $fsdbDumpvars(1,tb_top.cpu.dbg1.dbg1_dbgprt.core_soc_align_data);
          $fsdbDumpvars(1,tb_top.cpu.mio.niu_mio_debug_data);
          $fsdbDumpvars(1,tb_top.cpu.mio.dbg0_mio_debug_bus_a);
          $fsdbDumpvars(1,tb_top.cpu.mio.dbg0_mio_debug_bus_b);
          $fsdbDumpvars(1,tb_top.cpu.mio.peu_mio_debug_bus_a);
          $fsdbDumpvars(1,tb_top.cpu.mio.peu_mio_debug_bus_b);
`endif
          //MSA
`ifdef DTM_ENABLED
    	  $fsdbDumpvars(1,tb_top.cpu.DBG_DQ);
`ifndef GATESIM
    	  $fsdbDumpvars(1,tb_top.csr_cabinet.dbg1_l2clk);
    	  $fsdbDumpvars(1,tb_top.csr_cabinet.dtm_mode_on);
    	  $fsdbDumpvars(1,tb_top.csr_cabinet.dtm2_one_core_tester_dbg_pins);
    	  $fsdbDumpvars(1,tb_top.csr_cabinet.io2x_sync_en);
`endif // GATESIM
`endif // DTM_ENABLED

    end //}
  end //}
// `endif // gatesim




`ifdef FC_CRC_INJECT
  if ($test$plusargs("DUMP_CRC")) begin
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_CRC plusarg detected");
    $fsdbDumpvars(0,tb_top.crc_errinject_top);
  end
`endif

  //---------------------------------------------------------
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
  if ($test$plusargs("DUMP_NIU")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_NIU plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.mac);
    $fsdbDumpvars(0,tb_top.cpu.rdp);
    $fsdbDumpvars(0,tb_top.cpu.rtx);
    $fsdbDumpvars(0,tb_top.cpu.tds);
    $fsdbDumpvars(0,tb_top.cpu.esr);
`ifndef PLAYBACK
    $fsdbDumpvars(0,tb_top.enet_model);
`endif
  end // }
`endif
`endif

  //---------------------------------------------------------
  if ($test$plusargs("DUMP_NCU")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_NCU plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.ncu);
  end // }
  //---------------------------------------------------------

  //---------------------------------------------------------
  if ($test$plusargs("DUMP_SIU")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_SIU plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.sii);
    $fsdbDumpvars(0,tb_top.cpu.sio);
  end // }

  //---------------------------------------------------------
  if ($test$plusargs("DUMP_DMU")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_DMU plusarg detected");
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.dmu);
  end // }

  //---------------------------------------------------------
  if ($test$plusargs("DUMP_PIU")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_PIU plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.dmu);
// added this
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
    $fsdbDumpvars(0,tb_top.cpu.peu);
`endif
`endif
  end // }
// added this
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
  if ($test$plusargs("DUMP_PSR")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_PSR plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.psr);
  end // }
`ifdef FC_NO_PEUSAT_CODE
  if ($test$plusargs("DUMP_EPT")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_EPT plusarg detected");
    $fsdbDumpvars(0,tb_top.ept);
  end // }
  if ($test$plusargs("DUMP_BOBO")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_BOBO plusarg detected");
    $fsdbDumpvars(0,tb_top.ept.pci_dma.dma);
  end // }
`endif
`endif
`endif
  //---------------------------------------------------------
  if ( !$test$plusargs("DUMP_MCU0") && !$test$plusargs("DUMP_MCU1") &&
       !$test$plusargs("DUMP_MCU2") && !$test$plusargs("DUMP_MCU3")
     ) begin // {
     if ($test$plusargs("DUMP_MCU")) begin // {
	`PR_NORMAL ("dump_scope",`NORMAL,"DUMP_MCU plusarg detected");
`ifndef PLAYBACK
	$fsdbDumpvars(0,tb_top.mcusat_fbdimm);     // FBDIMM model
`endif
	$fsdbDumpvars(0,tb_top.cpu.mcu0);
	$fsdbDumpvars(0,tb_top.cpu.mcu1);
	$fsdbDumpvars(0,tb_top.cpu.mcu2);
	$fsdbDumpvars(0,tb_top.cpu.mcu3);
     end // }
  end // }
  //---------------------------------------------------------
  //  a la carte options for MCU
  //---------------------------------------------------------
  if ($test$plusargs("DUMP_FBDIMM")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_FBDIMM plusarg detected");
`ifndef PLAYBACK
    $fsdbDumpvars(0,tb_top.mcusat_fbdimm);     // FBDIMM model
`endif
  end // }
  if ($test$plusargs("DUMP_MCU0")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_MCU0 plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.mcu0);
  end // }
  if ($test$plusargs("DUMP_MCU1")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_MCU1 plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.mcu1);
  end // }
  if ($test$plusargs("DUMP_MCU2")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_MCU2 plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.mcu2);
  end // }
  if ($test$plusargs("DUMP_MCU3")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_MCU3 plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.mcu3);
  end // }
  //---------------------------------------------------------
  if ($test$plusargs("DUMP_FSR")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_FSR plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.fsr_bottom);
    $fsdbDumpvars(0,tb_top.cpu.fsr_left);
    $fsdbDumpvars(0,tb_top.cpu.fsr_right);
  end // }
  //--------------------
  // Conditionally dump L2 modules
  if ($test$plusargs("DUMP_L2_0")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_L2_0 plusarg detected");
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b0);
    $fsdbDumpvars(0,tb_top.cpu.l2d0);
    $fsdbDumpvars(0,tb_top.cpu.l2t0);
  end // }
  if ($test$plusargs("DUMP_L2_1")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_L2_1 plusarg detected");
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b1);
    $fsdbDumpvars(0,tb_top.cpu.l2d1);
    $fsdbDumpvars(0,tb_top.cpu.l2t1);
  end // }
  if ($test$plusargs("DUMP_L2_2")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_L2_2 plusarg detected");
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b2);
    $fsdbDumpvars(0,tb_top.cpu.l2d2);
    $fsdbDumpvars(0,tb_top.cpu.l2t2);
  end // }
  if ($test$plusargs("DUMP_L2_3")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_L2_3 plusarg detected");
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b3);
    $fsdbDumpvars(0,tb_top.cpu.l2d3);
    $fsdbDumpvars(0,tb_top.cpu.l2t3);
  end // }
  if ($test$plusargs("DUMP_L2_4")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_L2_4 plusarg detected");
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b4);
    $fsdbDumpvars(0,tb_top.cpu.l2d4);
    $fsdbDumpvars(0,tb_top.cpu.l2t4);
  end // }
  if ($test$plusargs("DUMP_L2_5")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_L2_5 plusarg detected");
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b5);
    $fsdbDumpvars(0,tb_top.cpu.l2d5);
    $fsdbDumpvars(0,tb_top.cpu.l2t5);
  end // }
  if ($test$plusargs("DUMP_L2_6")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_L2_6 plusarg detected");
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b6);
    $fsdbDumpvars(0,tb_top.cpu.l2d6);
    $fsdbDumpvars(0,tb_top.cpu.l2t6);
  end // }
  if ($test$plusargs("DUMP_L2_7")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_L2_7 plusarg detected");
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b7);
    $fsdbDumpvars(0,tb_top.cpu.l2d7);
    $fsdbDumpvars(0,tb_top.cpu.l2t7);
  end // }

  //---------------------------------------------------------
  if ($test$plusargs("DUMP_CCX")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_CCX plusarg detected");
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.ccx);
  end // }

  //---------------------------------------------------------
  if ($test$plusargs("DUMP_CCU")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_CCU plusarg detected");
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.ccu);
    $fsdbDumpvars(0,tb_top.cpu.n2_clk_gl_cust); // Global Clock Tree
  end // }
  
  //---------------------------------------------------------
  if ($test$plusargs("DUMP_EFU")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_EFU plusarg detected");
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.efu);
  end // }  
  
  //---------------------------------------------------------
  if ($test$plusargs("DUMP_RST")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_RST plusarg detected");
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.rst);
  end // }  

  //---------------------------------------------------------
  if ($test$plusargs("DUMP_TCU")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_TCU plusarg detected");
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.tcu);
  end // }

  //---------------------------------------------------------
  if ($test$plusargs("DUMP_DBG")) begin // {
    `PR_NORMAL ("dump_scope",`NORMAL,"DUMP_DBG plusarg detected");
    $fsdbDumpvars(0,tb_top.cpu.mio);
    $fsdbDumpvars(0,tb_top.cpu.dbg0);
    $fsdbDumpvars(0,tb_top.cpu.dbg1);
  end // }

  //----------------------------------------------------------
`ifndef GATESIM
  if ($test$plusargs("DUMP_CLUSTER_HDRS")) begin // {
    $display ("\nINFO : DUMP_CLUSTER_HDRS plusarg detected");
    //---blocks in TCU SAT---
    $fsdbDumpvars(1,tb_top.cpu.ccu.clkgen_cmp);
    $fsdbDumpvars(1,tb_top.cpu.ccu.clkgen_io);
    $fsdbDumpvars(1,tb_top.cpu.dbg0.db0_clk_header_cmp_clk);
    $fsdbDumpvars(1,tb_top.cpu.dbg0.db0_clk_header_iol2clk);
    $fsdbDumpvars(1,tb_top.cpu.dbg1.db1_clk_header_cmp_clk);
    $fsdbDumpvars(1,tb_top.cpu.dbg1.db1_clk_header_iol2clk);
    $fsdbDumpvars(1,tb_top.cpu.efu.efu_ioclk_header);
    $fsdbDumpvars(1,tb_top.cpu.efu.l2t_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.mio.mio_clk_header_cmp_clk_0);
    $fsdbDumpvars(1,tb_top.cpu.mio.mio_clk_header_cmp_clk_1);
    $fsdbDumpvars(1,tb_top.cpu.mio.mio_clk_header_cmp_clk_2);
    $fsdbDumpvars(1,tb_top.cpu.mio.mio_clk_header_cmp_clk_3);
    $fsdbDumpvars(1,tb_top.cpu.mio.mio_clk_header_iol2clk);
    $fsdbDumpvars(1,tb_top.cpu.ncu.clkgen_ncu_cmp);
    $fsdbDumpvars(1,tb_top.cpu.ncu.clkgen_ncu_io);
    $fsdbDumpvars(1,tb_top.cpu.rst.clkgen_rst_cmp);
    $fsdbDumpvars(1,tb_top.cpu.rst.clkgen_rst_io);
    $fsdbDumpvars(1,tb_top.cpu.tcu.clkgen_tcu_cmp);
    $fsdbDumpvars(1,tb_top.cpu.tcu.clkgen_tcu_io);
    //---blocks are NOT in TCU SAT---
    $fsdbDumpvars(1,tb_top.cpu.ccx.clk_ccx);
    $fsdbDumpvars(1,tb_top.cpu.dmu.dmu_clkgen);
    $fsdbDumpvars(1,tb_top.cpu.l2b0.clock_header);
    $fsdbDumpvars(1,tb_top.cpu.l2b1.clock_header);
    $fsdbDumpvars(1,tb_top.cpu.l2b2.clock_header);
    $fsdbDumpvars(1,tb_top.cpu.l2b3.clock_header);
    $fsdbDumpvars(1,tb_top.cpu.l2b4.clock_header);
    $fsdbDumpvars(1,tb_top.cpu.l2b5.clock_header);
    $fsdbDumpvars(1,tb_top.cpu.l2b6.clock_header);
    $fsdbDumpvars(1,tb_top.cpu.l2b7.clock_header);
    $fsdbDumpvars(1,tb_top.cpu.l2d0.l2d_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2d0.l2d_pregrid_drv_top);
    $fsdbDumpvars(1,tb_top.cpu.l2d0.l2d_pregrid_drv_bot);
    $fsdbDumpvars(1,tb_top.cpu.l2d1.l2d_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2d1.l2d_pregrid_drv_top);
    $fsdbDumpvars(1,tb_top.cpu.l2d1.l2d_pregrid_drv_bot);
    $fsdbDumpvars(1,tb_top.cpu.l2d2.l2d_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2d2.l2d_pregrid_drv_top);
    $fsdbDumpvars(1,tb_top.cpu.l2d2.l2d_pregrid_drv_bot);
    $fsdbDumpvars(1,tb_top.cpu.l2d3.l2d_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2d3.l2d_pregrid_drv_top);
    $fsdbDumpvars(1,tb_top.cpu.l2d3.l2d_pregrid_drv_bot);
    $fsdbDumpvars(1,tb_top.cpu.l2d4.l2d_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2d4.l2d_pregrid_drv_top);
    $fsdbDumpvars(1,tb_top.cpu.l2d4.l2d_pregrid_drv_bot);
    $fsdbDumpvars(1,tb_top.cpu.l2d5.l2d_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2d5.l2d_pregrid_drv_top);
    $fsdbDumpvars(1,tb_top.cpu.l2d5.l2d_pregrid_drv_bot);
    $fsdbDumpvars(1,tb_top.cpu.l2d6.l2d_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2d6.l2d_pregrid_drv_top);
    $fsdbDumpvars(1,tb_top.cpu.l2d6.l2d_pregrid_drv_bot);
    $fsdbDumpvars(1,tb_top.cpu.l2d7.l2d_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2d7.l2d_pregrid_drv_top);
    $fsdbDumpvars(1,tb_top.cpu.l2d7.l2d_pregrid_drv_bot);
    $fsdbDumpvars(1,tb_top.cpu.l2t0.l2t_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2t1.l2t_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2t2.l2t_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2t3.l2t_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2t4.l2t_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2t5.l2t_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2t6.l2t_clk_header);
    $fsdbDumpvars(1,tb_top.cpu.l2t7.l2t_clk_header);
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
    $fsdbDumpvars(1,tb_top.cpu.mac.clkgen_mac.clkgen_mac_io);
`endif
`endif
    $fsdbDumpvars(1,tb_top.cpu.mcu0.clkgen_cmp);
    $fsdbDumpvars(1,tb_top.cpu.mcu0.clkgen_dr);
    $fsdbDumpvars(1,tb_top.cpu.mcu0.clkgen_io);
    $fsdbDumpvars(1,tb_top.cpu.mcu1.clkgen_cmp);
    $fsdbDumpvars(1,tb_top.cpu.mcu1.clkgen_dr);
    $fsdbDumpvars(1,tb_top.cpu.mcu1.clkgen_io);
    $fsdbDumpvars(1,tb_top.cpu.mcu2.clkgen_cmp);
    $fsdbDumpvars(1,tb_top.cpu.mcu2.clkgen_dr);
    $fsdbDumpvars(1,tb_top.cpu.mcu2.clkgen_io);
    $fsdbDumpvars(1,tb_top.cpu.mcu3.clkgen_cmp);
    $fsdbDumpvars(1,tb_top.cpu.mcu3.clkgen_dr);
    $fsdbDumpvars(1,tb_top.cpu.mcu3.clkgen_io);
// added this
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
    $fsdbDumpvars(1,tb_top.cpu.peu.peu_iol2clk_gen);
    $fsdbDumpvars(1,tb_top.cpu.peu.peu_pcl2clk_gen);
`endif
`endif
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
    $fsdbDumpvars(1,tb_top.cpu.rdp.rdp_clkgen_rdp_io.clkgen_rdp_io);
    $fsdbDumpvars(1,tb_top.cpu.rdp.rdp_clkgen_rdp_io2x.clkgen_rdp_io2x);
    $fsdbDumpvars(1,tb_top.cpu.rtx.clkgen_rtx.clkgen_rtx_io);
    $fsdbDumpvars(1,tb_top.cpu.rtx.clkgen2x_rtx);
`endif
`endif
    $fsdbDumpvars(1,tb_top.cpu.sii.clkgen_cmp);
    $fsdbDumpvars(1,tb_top.cpu.sii.clkgen_io);
    $fsdbDumpvars(1,tb_top.cpu.sio.clkgen_cmp);
    $fsdbDumpvars(1,tb_top.cpu.sio.clkgen_io);
`ifdef CORE_0
    $fsdbDumpvars(1,tb_top.cpu.spc0.clk_spc);
`endif
`ifdef CORE_1
    $fsdbDumpvars(1,tb_top.cpu.spc1.clk_spc);
`endif
`ifdef CORE_2
    $fsdbDumpvars(1,tb_top.cpu.spc2.clk_spc);
`endif
`ifdef CORE_3
    $fsdbDumpvars(1,tb_top.cpu.spc3.clk_spc);
`endif
`ifdef CORE_4
    $fsdbDumpvars(1,tb_top.cpu.spc4.clk_spc);
`endif
`ifdef CORE_5
    $fsdbDumpvars(1,tb_top.cpu.spc5.clk_spc);
`endif
`ifdef CORE_6
    $fsdbDumpvars(1,tb_top.cpu.spc6.clk_spc);
`endif
`ifdef CORE_7
    $fsdbDumpvars(1,tb_top.cpu.spc7.clk_spc);
`endif
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
    $fsdbDumpvars(1,tb_top.cpu.tds.clkgen_tds.clkgen_tds_io);
    $fsdbDumpvars(1,tb_top.cpu.tds.clkgen2x_tds);
`endif
`endif
  end // }
`endif

  //----------------------------------------------------------

  if ($test$plusargs("DUMP_ALL_EXCEPT")) begin // {
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(1,tb_top.cpu);
// added this
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
    if (!$test$plusargs("DUMP_ALL_EXCEPT_NIU")) begin // {
      $fsdbDumpvars(0,tb_top.cpu.rdp);
      $fsdbDumpvars(0,tb_top.cpu.tds);
      $fsdbDumpvars(0,tb_top.cpu.rtx);
      $fsdbDumpvars(0,tb_top.cpu.mac);
    end // }
`endif
`endif
    if (!$test$plusargs("DUMP_ALL_EXCEPT_DMU")) begin // {
      $fsdbDumpvars(0,tb_top.cpu.dmu);
    end // }
// added this
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
    if (!$test$plusargs("DUMP_ALL_EXCEPT_PEU")) begin // {
      $fsdbDumpvars(0,tb_top.cpu.peu);
    end // }
`endif
`endif
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
    if (!$test$plusargs("DUMP_ALL_EXCEPT_SERDES")) begin // {
      $fsdbDumpvars(0,tb_top.cpu.esr);
// added this
`ifndef FC_NO_PEU_T2
`ifndef PEU_SYSTEMC_MODEL
      $fsdbDumpvars(0,tb_top.cpu.psr);
`endif
`endif
    end // }
`endif
`endif

    $fsdbDumpvars(0,tb_top.cpu.mio);
    $fsdbDumpvars(0,tb_top.cpu.dbg0);
    $fsdbDumpvars(0,tb_top.cpu.dbg1);
    if (!$test$plusargs("DUMP_ALL_EXCEPT_SPC")) begin // {
      `ifdef CORE_0 $fsdbDumpvars(0,tb_top.cpu.spc0); `endif
      `ifdef CORE_1 $fsdbDumpvars(0,tb_top.cpu.spc1); `endif
      `ifdef CORE_2 $fsdbDumpvars(0,tb_top.cpu.spc2); `endif
      `ifdef CORE_3 $fsdbDumpvars(0,tb_top.cpu.spc3); `endif
      `ifdef CORE_4 $fsdbDumpvars(0,tb_top.cpu.spc4); `endif
      `ifdef CORE_5 $fsdbDumpvars(0,tb_top.cpu.spc5); `endif
      `ifdef CORE_6 $fsdbDumpvars(0,tb_top.cpu.spc6); `endif
      `ifdef CORE_7 $fsdbDumpvars(0,tb_top.cpu.spc7); `endif
    end // }
    $fsdbDumpvars(0,tb_top.cpu.ccx);
    if (!$test$plusargs("DUMP_ALL_EXCEPT_L2D")) begin // {
      $fsdbDumpvars(0,tb_top.cpu.l2d0);
      $fsdbDumpvars(0,tb_top.cpu.l2d1);
      $fsdbDumpvars(0,tb_top.cpu.l2d2);
      $fsdbDumpvars(0,tb_top.cpu.l2d3);
      $fsdbDumpvars(0,tb_top.cpu.l2d4);
      $fsdbDumpvars(0,tb_top.cpu.l2d5);
      $fsdbDumpvars(0,tb_top.cpu.l2d6);
      $fsdbDumpvars(0,tb_top.cpu.l2d7);
    end // }

    if (!$test$plusargs("DUMP_ALL_EXCEPT_L2T")) begin // {
      $fsdbDumpvars(0,tb_top.cpu.l2t0);
      $fsdbDumpvars(0,tb_top.cpu.l2t1);
      $fsdbDumpvars(0,tb_top.cpu.l2t2);
      $fsdbDumpvars(0,tb_top.cpu.l2t3);
      $fsdbDumpvars(0,tb_top.cpu.l2t4);
      $fsdbDumpvars(0,tb_top.cpu.l2t5);
      $fsdbDumpvars(0,tb_top.cpu.l2t6);
      $fsdbDumpvars(0,tb_top.cpu.l2t7);
    end // }
    if (!$test$plusargs("DUMP_ALL_EXCEPT_L2B")) begin // {
      $fsdbDumpvars(0,tb_top.cpu.l2b0);
      $fsdbDumpvars(0,tb_top.cpu.l2b1);
      $fsdbDumpvars(0,tb_top.cpu.l2b2);
      $fsdbDumpvars(0,tb_top.cpu.l2b3);
      $fsdbDumpvars(0,tb_top.cpu.l2b4);
      $fsdbDumpvars(0,tb_top.cpu.l2b5);
      $fsdbDumpvars(0,tb_top.cpu.l2b6);
      $fsdbDumpvars(0,tb_top.cpu.l2b7);
    end // }
    if (!$test$plusargs("DUMP_ALL_EXCEPT_MCU")) begin // {
      $fsdbDumpvars(0,tb_top.cpu.mcu0);
      $fsdbDumpvars(0,tb_top.cpu.mcu1);
      $fsdbDumpvars(0,tb_top.cpu.mcu2);
      $fsdbDumpvars(0,tb_top.cpu.mcu3);
    end // }
    if (!$test$plusargs("DUMP_ALL_EXCEPT_SERDES")) begin // {
      $fsdbDumpvars(0,tb_top.cpu.fsr_left);
      $fsdbDumpvars(0,tb_top.cpu.fsr_right);
    end // }
    $fsdbDumpvars(0,tb_top.cpu.sii);
    $fsdbDumpvars(0,tb_top.cpu.sio);
    $fsdbDumpvars(0,tb_top.cpu.ncu);
    $fsdbDumpvars(0,tb_top.cpu.efu);
    $fsdbDumpvars(0,tb_top.cpu.ccu);
    $fsdbDumpvars(0,tb_top.cpu.tcu);
    $fsdbDumpvars(0,tb_top.cpu.rst);
    $fsdbDumpvars(0,tb_top.cpu.n2_clk_gl_cust);
  end // }
//---------------------------------------------------------
//Dump signals for syncing SLAM to NON_SLAM
   if($test$plusargs("DUMP_SYNC_SLAM_NON_SLAM")) begin //{
    $fsdbDumpvars(0,`NCU.rst_wmr_protect);
    $fsdbDumpvars(0,`NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.cntr);
    $fsdbDumpvars(0,`NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.l1clk);
    $fsdbDumpvars(0,`NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.ctu_jbi_ssiclk_ff);
    $fsdbDumpvars(0,`NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.iol2clk_div);
    $fsdbDumpvars(0,`NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.jbi_io_ssi_sck);
   end //}

//---------------------------------------------------------
end // }

//----------------------------------------------------------
// Default dumpfile scope
else begin // {
  // Dump from TestBench tb_top
  $fsdbDumpvars(0,tb_top);
end // }

//----------------------------------------------------------
if ($test$plusargs("DUMP_ALL")) begin // {
  // Dump TestBench tb_top and items not instantiated in tb_top (i.e. 0in)
  $fsdbDumpvars(0);
end // }

//----------------------------------------------------------
//----------------------------------------------------------
