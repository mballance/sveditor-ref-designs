// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_zeroIn_cfg.v
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
module cmp_zeroin_ctl;

   // set global default clock
   // 0in set_clock l2clk -default -module cpu
   // 0in set_clock drl2clk -default -module mcu
   // 0in set_clock iol2clk -posedge -default -module dmu


   // set default checker action to finish simulation when a checker fires
   // 0in set_checker_action -finish -severity 0

   // make sure a checker which fires causes a fail
   // 0in checker_firing_keyword -name "ERROR - failing assertion!" -severity 0
   // 0in checker_firing_keyword -name "WARNING - assertion fired!" -severity 1
   // 0in checker_firing_keyword -name "INFO - assertion fired!"    -severity 2


   //---------------------------------------------------------------------------
   // during flush reset, disable checkers
   //---------------------------------------------------------------------------
   // LOOK HERE -> you can not do -module *. You can not do -name w/o -type.
   // for all -> x0in disable_checker ~tb_top.flush_reset_complete -name cpu.* -type *
   // 0in disable_checker ~tb_top.flush_reset_complete -name cpu.dmu* -type *
   // 0in disable_checker ~tb_top.flush_reset_complete -name cpu.ncu* -type *
   // 0in disable_checker ~tb_top.flush_reset_complete -name cpu.peu* -type *
   // 0in disable_checker ~tb_top.flush_reset_complete -name cpu.si* -type *
   // 0in disable_checker ~tb_top.flush_reset_complete -name cpu.l2* -type *
   // 0in disable_checker ~tb_top.flush_reset_complete -name cpu.spc* -type *

   
   //---------------------------------------------------------------------------
   // PEU checkers
   //---------------------------------------------------------------------------

   // x0in default_reset -sync -infer -module dmu

   // get dmu reset signals after they are sync'd
   wire dmu_rst_asserted = (tb_top.cpu.dmu.por_ !== 1'b1 ||
			    tb_top.cpu.dmu.wmr_ !== 1'b1 );
  
   // 0in default_reset dmu_rst_asserted -sync -module dmu
 
   // get peu reset signals after they are sync'd
   wire peu_rst_asserted = (tb_top.cpu.peu.rst_por_sync_ !== 1'b1 ||
			    tb_top.cpu.peu.rst_wmr_sync_ !== 1'b1 );
  
   // 0in default_reset peu_rst_asserted -sync -module peu

   // Disable PEU checkers until the clocks have stabilized

   
   // This module does not specify clock in it's checkers
   // 0-in infers l2clk which causes false firings
   // 0in set_clock clk -module pcie_common_dcs_ism
   
   // 0in set_clock clk -module pcie_common_srq


   // From peu sat
   // 0in set_clock l1clk -default -module dmu_ilu
   // 0in set_clock `PEU.peu_ptl.l2t_clk -default -module peu
   // 0in set_clock l2t_clk -default -module ptl
   // 0in set_clock clk -default -module ptl_itl_ihp
   // x0in set_clock pc_clk -default -module peu

   
   // these checkers are not getting mapped correctly to 0-in.
   
   //
   // x0in exclude_checker -name cpu.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_addr_decode.mapped_after_valid
   // x0in exclude_checker -name cpu.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_addr_decode.daemon_csrbus_done_high

   // DH, 07/11/05: Disable this fifo check since it doesn't seem to be working correctly
   // x0in exclude_checker -name cpu.peu.peu_ptl.ihb.ptl_ihb_async_ram_chk
   
   // DH, 07/12/05: Disable this scoreboard check since it doesn't seem to be working correctly
   // x0in exclude_checker -name cpu.dmu.dsn.dmu_dsn_ctl.dsn_ncu_sii_scbd
   
   // x0in exclude_checker -name  cpu.peu.peu_ptl.itl.ifc.state_4 

   // x0in exclude_checker -name  cpu.peu.peu_ptl.etl.hcs.fifo_request.enq_deq
   
   //---------------------------------------------------------------------------
   // NIU checkers
   //---------------------------------------------------------------------------
   // disable NIU checkers till reset is deasserted
   //
   // 0in disable_checker  ~tb_top.flush_reset_complete -name cpu.rtx*
   // 0in disable_checker  ~tb_top.flush_reset_complete -name cpu.tds*
   // 0in disable_checker  ~tb_top.flush_reset_complete -name cpu.rdp*
   // 0in disable_checker  ~tb_top.flush_reset_complete -name cpu.mac*
   // 0in disable_checker  ~tb_top.flush_reset_complete -name cpu.esr*

   // 0in exclude_checker -name cpu.mac.mac_core.mac_2ports.xmac_2pcs_core_port0.xpcs.xpcs_rx.req_ack
   // 0in exclude_checker -name cpu.mac.mac_core.mac_2ports.xmac_2pcs_core_port1.xpcs.xpcs_rx.req_ack

   // 0in exclude_checker -name cpu.rtx.rxc.ipp_top_0.ipp0.ipp_unload_ctl_1ke_0.c_unload_st_1
   // 0in exclude_checker -name cpu.rtx.rxc.ipp_top_0.ipp1.ipp_unload_ctl_1ke_0.c_unload_st_1

   //---------------------------------------------------------------------------
   // MCU checkers
   //------------------------------------- --------------------------------------
   // disable MCU checkers since the fsr* will drive x for some time
   // after the clocks are running.
   reg 	fsr_clk_stable = 1'b0;

   initial fork
      repeat (50) @ (posedge `TOP.fbl2clk);
      fsr_clk_stable = 1'b1;
   join

   // 0in disable_checker fsr_clk_stable -name cpu.mcu*

   //=========================================================================
   //black box certain heirachy
   //=========================================================================
   //0in exclude_hier -module fc_l2_csr_probe
   //0in exclude_hier -module fc_mcu_csr_probe
   //0in exclude_hier -module trig_event 

   //Option to exclude rst_chkr 
   `ifdef EXCLUDE_RST_CHKR
      //0in exclude_checker -group rst_chkr
   `endif
    
endmodule
