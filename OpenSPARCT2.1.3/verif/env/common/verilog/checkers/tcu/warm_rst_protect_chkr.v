// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: warm_rst_protect_chkr.v
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
module warm_protect_chkr();

//RST

reg wrm_rst_chk_off;
initial begin // {
    if ($test$plusargs("WRM_PROTECT_CHK_OFF"))
        wrm_rst_chk_off <= 1;
    else
        wrm_rst_chk_off <= 0;
end //}

//  0in disable_checker wrm_rst_chk_off -name wrm_protect*

/* 0in constant 
   -var `RST.rst_fsm_ctl.reset_source_q
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_rst_reset_source_q
   -module rst
   -group rst_chkr
*/

/*Need to take care in directed diag  0in constant 
   -var `RST.rst_fsm_ctl.reset_gen_q
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_rst_reset_gen_q
   -module rst
   -group rst_chkr
*/

/* 0in constant 
   -var `RST.rst_fsm_ctl.rset_stat_q
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_rst_rset_stat_q
   -module rst
   -group rst_chkr
*/

/*Need to take care in directed diag  0in constant 
   -var `RST.rst_fsm_ctl.ssys_reset_q
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_rst_ssys_reset_q
   -module rst
   -group rst_chkr
*/

// NCU

/* 0in constant 
   -var `TOP.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_sernum
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_sernum
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_fusestat
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_fusestat
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_coreavail
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_coreavail
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_bankavail
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_bankavail
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_bank_en
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_bank_en
   -module ncu
   -group rst_chkr
*/


/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_l2idxhs_en
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_l2idxhs_en
   -module ncu
   -group rst_chkr
*/


/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_per
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_per
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_esr
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_esr
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_err_steering
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_creg_err_steering
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_ncusyn
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_creg_ncusyn
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_ncu_scksel
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_creg_ncu_scksel
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_siisyn
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_creg_siisyn
   -module ncu
   -group rst_chkr
*/

/*Review path 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.asi_coreavail
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_asi_coreavail
   -module ncu
   -group rst_chkr
*/

/*Review path 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.asi_core_enable
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_asi_core_enable
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_cmp_tick_enable
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_creg_cmp_tick_enable
   -module ncu
   -group rst_chkr
*/

/* 0in constant 
   -var `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_wmr_vec_mask
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ncu_creg_wmr_vec_mask
   -module ncu
   -group rst_chkr
*/

// TCU
// MBIST Mode register
/* 0in constant 
   -var `CPU.tcu.mbist_ctl.csr_mbist_mode_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_tcu_mbist_mode_reg
   -module tcu
   -group rst_chkr
*/

// MBIST bypass reg
/* 0in constant 
   -var `CPU.tcu.mbist_ctl.csr_mbist_bypass_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_tcu_lower_mbist_bypass_reg
   -module tcu
   -group rst_chkr
*/

//  MBIST RESULTS done/fail bit(2)
//  Comment0in constant 
//   -var `CPU.tcu.mbist_ctl.mbist_done_fail_reg.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_tcu_mbist_done_fail
//   -module tcu
//   -group rst_chkr

// MBIST done reg
// Comment0in constant 
//   -var `CPU.tcu.mbist_ctl.mbist_done_reg.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_tcu_lower_mbist_done_reg
//   -module tcu
//   -group rst_chkr
//

// MBIST fail reg
// Comment0in constant 
//   -var `CPU.tcu.mbist_ctl.mbist_fail_reg.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_tcu_lower_mbist_fail_reg
//   -module tcu
//   -group rst_chkr
//

// LBIST Mode reg
/* 0in constant 
   -var `CPU.tcu.mbist_ctl.csr_lbist_mode_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_tcu_lbist_mode_reg
   -module tcu
   -group rst_chkr
*/

// LBIST bypass reg 
/* 0in constant 
   -var `CPU.tcu.mbist_ctl.csr_lbist_bypass_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_tcu_lbist_bypass_reg
   -module tcu
   -group rst_chkr
*/

/* LBIST done reg   
   0in constant 
   -var `CPU.tcu.mbist_ctl.tcu_lb_tcu_done_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_tcu_lbist_done_reg
   -module tcu
   -group rst_chkr
*/

// Debug control reg (DCR)
//   comment0in constant 
//   -var `CPU.tcu.regs_ctl.dbg_ctl.dbg_tcudcr_reg.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_tcu_debug_ctrl_reg
//   -module tcu
//   -group rst_chkr

/* Pulse TRIGOUT pin
   0in constant 
   -var `CPU.tcu.regs_ctl.dbg_ctl.dbg_trigout_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_tcu_pulse_trigout
   -module tcu
   -group rst_chkr
*/

// peu enable for test config bus
/* 0in constant 
   -var `CPU.tcu.mbist_ctl.csr_peu_entestcfg_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_tcu_peu_test_config
   -module tcu
   -group rst_chkr
*/

// CLKSTP_DELAY
/* 0in constant 
   -var `CPU.tcu.sigmux_ctl.tcusig_cntdly_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_tcu_cntdly
   -module tcu
   -group rst_chkr
*/

// CYCLE_COUNTER
// Comment0in constant 
//   -var `CPU.tcu.regs_ctl.dbg_ctl.dbg_cyccnt_reg.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_tcu_cycle_cnt
//   -module tcu
//   -group rst_chkr
//  Tom Z email dated Nov 28 2005

// DEBUG EVENT COUNTER
// Comment0in constant 
//   -var `CPU.tcu.regs_ctl.dbg_ctl.dbg_decnt_reg.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_tcu_dbg_event_cnt
//   -module tcu
//   -group rst_chkr
//

// MBIST_START
// 0IN constant 
//   -var `CPU.tcu.mbist_ctl.csr_mbist_start_reg.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_tcu_mbist_start
//   -module tcu
//   -group rst_chkr
// Tom Z email SENT dated Nov 28 2005

// MBIST_ABORT
// Comment0in constant 
//   -var `CPU.tcu.mbist_ctl.csr_mbist_abort_reg.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_tcu_mbist_abort
//   -module tcu
//   -group rst_chkr

// MBIST_START_WMR
// Comment0in constant 
//   -var `CPU.tcu.mbist_ctl.csr_mbist_start_wmr_reg.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_tcu_mbist_start_wmr
//   -module tcu
//   -group rst_chkr

// LBIST_START
/* 0in constant 
   -var `CPU.tcu.mbist_ctl.csr_lbist_start_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_tcu_lbist_start
   -module tcu
   -group rst_chkr
*/

// DB0  ...No Warm protect registers
//DB1

//N2 Debug Port configuration Register    0x86_0000_0000
/* 0in constant 
   -var `CPU.dbg1.dbg1_csr.ff_dbg_config.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_dbg1_debug_port_config
   -module db1
   -group rst_chkr
*/


//N2 I/O Quiesce control register bits 1:0 0x86_0000_0008
/* 0in constant 
   -var `CPU.dbg1.dbg1_csr.ff_io_quiesce.dout[0]
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_dbg1_io_quiesce_control_0
   -module db1
   -group rst_chkr
*/

//N2 I/O Quiesce control register bits 1:0 0x86_0000_0008
/* 0in constant 
   -var `CPU.dbg1.dbg1_csr.ff_io_quiesce.dout[1]
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_dbg1_io_quiesce_control_1
   -module db1
   -group rst_chkr
*/


`ifndef TCU_SAT
// SPC

// MCU

// TO ENABLE : DRAM CAS Address Width Register
/*   0in constant 
   -var `CPU.mcu0.drif.pff_cas_addr_bits.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_cas_addr_width
   -module mcu
   -group rst_chkr
*/

// : DRAM RAS Address Width Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_ras_addr_bits.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_ras_addr_width
   -module mcu
   -group rst_chkr
*/

// :DRAM CAS Latency Register	    0x84_0000_0010	
/* 0in constant 
   -var `CPU.mcu0.drif.pff_mode_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_cas_latency
   -module mcu
   -group rst_chkr
*/

// : DRAM Scrub Frequency Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_freq_scrub.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_scrub_freq
   -module mcu
   -group rst_chkr
*/

//:DRAM Refresh Frequency Register	    0x84_0000_0020
/* 0in constant 
   -var `CPU.mcu0.drif.pff_ref_freq.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_refresh_freq
   -module mcu
   -group rst_chkr
*/

//:DRAM Open Bank Max Register	    0x84_0000_0028
/* 0in constant 
   -var `CPU.mcu0.drif.pff_max_banks_open.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_open_bank_max
   -module mcu
   -group rst_chkr
*/

//:DRAM Scrub Enable Register	    0x84_0000_0040	
/* 0in constant 
   -var `CPU.mcu0.drif.pff_data_scrub.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_scrub_enable
   -module mcu
   -group rst_chkr
*/

//:DRAM Programmable Time Counter Register	0x84_0000_0048
/* 0in constant 
   -var `CPU.mcu0.drif.pff_max_time.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_programmable_time_counter
   -module mcu
   -group rst_chkr
*/

// : DRAM RAS to RAS Different Bank Delay Register	0x84_0000_0080	
/* 0in constant 
   -var `CPU.mcu0.drif.pff_rrd_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_rastoras_bank_delay
   -module mcu
   -group rst_chkr
*/

//:DRAM RAS to RAS Same Bank Delay Register	0x84_0000_0088	
/* 0in constant 
   -var `CPU.mcu0.drif.pff_rc_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_rastoras_same_bank_delay
   -module mcu
   -group rst_chkr
*/

// :DRAM RAS to CAS Delay Register	0x84_0000_0090	
/* 0in constant 
   -var `CPU.mcu0.drif.pff_rcd_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_rastocas_delay
   -module mcu
   -group rst_chkr
*/

//:DRAM Write to Read CAS Delay Register	0x84_0000_0098
/* 0in constant 
   -var `CPU.mcu0.drif.pff_wtr_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_writetoread_cas_delay
   -module mcu
   -group rst_chkr
*/

//:DRAM Read to Write CAS Delay Register	0x84_0000_00a0
/* 0in constant 
   -var `CPU.mcu0.drif.pff_rtw_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_readtowrite_cas_delay
   -module mcu
   -group rst_chkr
*/

//:DRAM internal Read to Precharge Delay Register	0x84_0000_00a8	
/* 0in constant 
   -var `CPU.mcu0.drif.pff_rtp_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_internal_readtoprecharge_delay
   -module mcu
   -group rst_chkr
*/

//:DRAM Active to Precharge Delay Register	0x84_0000_00b0
/* 0in constant 
   -var `CPU.mcu0.drif.pff_ras_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_active_to_precharge_delay
   -module mcu
   -group rst_chkr
*/

//:DRAM Precharge Command Period Register	0x84_0000_00b8
/* 0in constant 
   -var `CPU.mcu0.drif.pff_rp_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_precharge_command_period
   -module mcu
   -group rst_chkr
*/

//:DRAM Write Recovery Period Register	0x84_0000_00c0
/* 0in constant 
   -var `CPU.mcu0.drif.pff_wr_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_write_recovery_period
   -module mcu
   -group rst_chkr
*/

//:DRAM Autorefresh to Active Period Register	0x84_0000_00c8
/* 0in constant 
   -var `CPU.mcu0.drif.pff_rfc_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_autorefresh_active_period
   -module mcu
   -group rst_chkr
*/

//:DRAM Mode Register Set Command Period Register	0x84_0000_00d0	
/* 0in constant 
   -var `CPU.mcu0.drif.pff_mrd_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_mode_reg_set_command_period
   -module mcu
   -group rst_chkr
*/

//:DRAM Four Activate Window Register	0x84_0000_00d8	
/* 0in constant 
   -var `CPU.mcu0.drif.pff_faw_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_four_activate_window
   -module mcu
   -group rst_chkr
*/

//:DRAM Internal Write to Read Command Delay Register	0x84_0000_00e0	
/* 0in constant 
   -var `CPU.mcu0.drif.pff_iwtr_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_internal_writetoread_delay
   -module mcu
   -group rst_chkr
*/

//:DRAM Precharge Wait Register During Power Up
// Section 25.11.21 PRM 1.1, this register is obsolete and no more warm protected
// INVALID0in constant 
//   -var `CPU.mcu0.drif.ff_precharge_wait.dout
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_mcu_dram_precharge_wait_poweron
//   -module mcu
//   -group rst_chkr
//

// : DRAM DIMM Stacked Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_stacked_dimm.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_stacked_dimm
   -module mcu
   -group rst_chkr
*/
// : DRAM Extended Mode (1) Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_ext_mode_reg1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_ext_mode_1
   -module mcu
   -group rst_chkr
*/

// : DRAM Extended Mode (2) Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_ext_mode_reg2.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_ext_mode_2
   -module mcu
   -group rst_chkr
*/

// : DRAM Extended Mode (3) Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_ext_mode_reg3.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_ext_mode_3
   -module mcu
   -group rst_chkr
*/

// : DRAM 8 Bank Mode Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_eight_bank_present.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_8_bank_mode
   -module mcu
   -group rst_chkr
*/

// : DRAM Branch Disabled Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_branch_disabled.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_branch_disabled
   -module mcu
   -group rst_chkr
*/

// : DRAM Select Low Order Address Bits Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_bank_low_sel.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_select_low_order_addr_bits
   -module mcu
   -group rst_chkr
*/

// : DRAM Single Channel Mode Register   0x84_0000_0148
/* 0in constant 
   -var `CPU.mcu0.drif.pff_single_channel_mode.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_single_channel_mode
   -module mcu
   -group rst_chkr
*/

// : DRAM DIMMs Present Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_dimms_present.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_dimms_present
   -module mcu
   -group rst_chkr
*/

// : DRAM Fail-Over Status Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_fail_over_mode.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_fail_over_status
   -module mcu
   -group rst_chkr
*/

// : DRAM Fail-Over Mask Register
/* 0in constant 
   -var `CPU.mcu0.drif.pff_fail_over_mask.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_fail_over_mask
   -module mcu
   -group rst_chkr
*/

//:DRAM Debug Trigger Enable Register  0x84_0000_0230
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_dbg_trig.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_debug_trigger_enable
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 63	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit63.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit63
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 62	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit62.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit62
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 61	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit61.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit61
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 60	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit60.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit60
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 59	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit59.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit59
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 58	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit58.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit58
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 57	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit57.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit57
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 56	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit56.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit56
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 55	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit55.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit55
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 54	    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_sts_bit54.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit54
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Status Register bit 15:0    0x84_0000_0280
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_syn.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_status_bit0to15
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Address Register	    0x84_0000_0288
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_addr_reg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_addr
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Injection enable Register    0x84_0000_0290
/* 0in constant 
   -var `CPU.mcu0.drif.pff_err_inj.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_injection
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Injection Register (single shot vs continouos)
/* 0in constant 
   -var `CPU.mcu0.drif.pff_sshot.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_injection_sshot
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Injection Register (mask to XOR with ECC bits)
/* 0in constant 
   -var `CPU.mcu0.drif.pff_err_mask.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_injection_mask
   -module mcu
   -group rst_chkr
*/



//:DRAM Error Counter Register	    0x84_0000_0298
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_secc_cnt.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_counter
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Location Register	    0x84_0000_02a0
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_loc.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_err_location
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Retry Register18 bits    0x84_0000_02a8	
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_retry1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_retry1
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Retry Register 18 bits   0x84_0000_02a8	
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_err_retry2.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_retry2
   -module mcu
   -group rst_chkr
*/

//:DRAM Error Retry Register valid bit   0x84_0000_02a8
/* 0in constant 
   -var `CPU.mcu0.rdpctl.pff_retry_reg_valid.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_error_retry_valid
   -module mcu
   -group rst_chkr
*/

//:FBD Channel State Register	    0x84_0000_0800	
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_fbd_state.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_fbd_channel_state
   -module mcu
   -group rst_chkr
*/

//:FBD Fast Reset Flag Register	    0x84_0000_0808
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_fast_reset.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_fbd_fast_reset_flag
   -module mcu
   -group rst_chkr
*/

//:FBD Channel Reset Register	    0x84_0000_0810	
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_chnl_reset1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_fbd_channel_reset
   -module mcu
   -group rst_chkr
*/

//:TS1 Southbound to Northbound Mapping Register	0x84_0000_0818	
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sb2nb_map.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ts1_sounthbound_northbound_mapping
   -module mcu
   -group rst_chkr
*/

//:TS1 Test Parameter Register	    0x84_0000_0820
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_amb_test_param.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ts1_test_parameter
   -module mcu
   -group rst_chkr
*/

//:TS3 Failover Configuration Register 0x84_0000_0828
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_failover_config.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ts3_failover_config
   -module mcu
   -group rst_chkr
*/

//:Disable State Period Register	    0x84_0000_0838
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_tdisable_period.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_disable_state_period
   -module mcu
   -group rst_chkr
*/

//:Calibrate State Period Register	    0x84_0000_0848
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_tcalibrate_period.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_calibrate_state_period
   -module mcu
   -group rst_chkr
*/

//:Training State Minimum Time Register	0x84_0000_0858
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_tclktrain_min.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_training_state_min_time
   -module mcu
   -group rst_chkr
*/

//:Training State Timeout Register	    0x84_0000_0868
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_tclktrain_timeout.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_training_state_timeout
   -module mcu
   -group rst_chkr
*/

//:Testing State Timeout Register	    0x84_0000_0878
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_testing_timeout.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_testing_state_timeout
   -module mcu
   -group rst_chkr
*/

//:Polling State Timeout Register	    0x84_0000_0888
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_polling_timeout.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_polling_state_timeout
   -module mcu
   -group rst_chkr
*/

//:Config State Done Register	    0x84_0000_0898	
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_config_timeout.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_config_state_timeout
   -module mcu
   -group rst_chkr
*/

//:DRAM Per-Rank CKE Register	    0x84_0000_08a0	
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_per_rank_cke.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_per_rank_cke
   -module mcu
   -group rst_chkr
*/

//:L0s Duration Register
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_l0s_time.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_l0s_duration
   -module mcu
   -group rst_chkr
*/

//:Channel Sync Frame Frequency Register	0x84_0000_08b0
/* 0in constant 
   -var `CPU.mcu0.fbdic.fbdtm.pff_sync_frm_period.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_channel_sync_frame_freq
   -module mcu
   -group rst_chkr
*/

//:SERDES Configuration Bus Register	0x84_0000_08d0	
/* 0in constant 
   -var `CPU.mcu0.fbdic.fbdtm.pff_sds_config.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_serdes_config_bus
   -module mcu
   -group rst_chkr
*/

//:SERDES Transmitter and Receiver Differential Pair Inversion Register	0x84_0000_08d8	
/* 0in constant 
   -var `CPU.mcu0.fbdic.fbdtm.pff_sds_invert.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_serdes_transmit_receive_diif_pair_inversion
   -module mcu
   -group rst_chkr
*/

//:SERDES Test Configuration Bus Register	0x84_0000_08e0
/* 0in constant 
   -var `CPU.mcu0.fbdic.fbdtm.pff_sds_testcfg.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_serdes_test_config_bus
   -module mcu
   -group rst_chkr
*/

//:DRAM FBD Error Syndrome Register	0x84_0000_0c00	
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_mcu_syndrome.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_fbd_err_syndrome
   -module mcu
   -group rst_chkr
*/

//:DRAM FBD Injected Error Source Register	0x84_0000_0c08
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_inj_err_src.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_fbd_injected_err_source
   -module mcu
   -group rst_chkr
*/

//:DRAM FBR Count Register
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_fbr_count.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_dram_fbr_count
   -module mcu
   -group rst_chkr
*/

//:IBIST sbfibportctl Register	0x84_0000_0e80
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sbfibportctl.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_sbfibportctl
   -module mcu
   -group rst_chkr
*/

//:IBIST sbfibpgctl Register	0x84_0000_0e80
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sbfibpgctl.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_sbfibpgctl
   -module mcu
   -group rst_chkr
*/

//:IBIST sbfibpattbuf1/sbfibtxmsk Register	0x84_0000_0e88
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sbfibpattbuf1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_sbfibpattbuf1
   -module mcu
   -group rst_chkr
*/

//:IBIST sbfibpattbuf1/sbfibtxmsk Register	0x84_0000_0e88
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sbfibtxmsk.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_sbfibtxmsk
   -module mcu
   -group rst_chkr
*/

//:IBIST sbfibtxshft Register		0x84_0000_0e90	
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sbfibtxshft.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_sbfibtxshft
   -module mcu
   -group rst_chkr
*/

//:IBIST sbfibpattbuf2/sbfibpatt2en Register	0x84_0000_0ea0
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sbfibpattbuf2.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_sbfibpattbuf2
   -module mcu
   -group rst_chkr
*/

//:IBIST sbfibpattbuf2/sbfibpatt2en Register	0x84_0000_0ea0
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sbfibpatt2en.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_sbfibpatt2en
   -module mcu
   -group rst_chkr
*/

//:IBIST sbfibinit/sbibistmisc Register	0x84_0000_0eb0
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sbfibinit.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_sbfibinit
   -module mcu
   -group rst_chkr
*/

//:IBIST sbfibinit/sbibistmisc Register	0x84_0000_0eb0
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_sbibistmisc.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_sbibistmisc
   -module mcu
   -group rst_chkr
*/

//:IBIST nbfibportctl/nbfibpgctl Register	0x84_0000_0ec0
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_nbfibportctl.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_nbfibportctl
   -module mcu
   -group rst_chkr
*/

//:IBIST nbfibportctl/nbfibpgctl Register	0x84_0000_0ec0
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_nbfibpgctl.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_nbfibpgctl
   -module mcu
   -group rst_chkr
*/

//:IBIST nbfibpattbuf1 Register		0x84_0000_0ec8
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_nbfibpattbuf1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_nbfibpattbuf1
   -module mcu
   -group rst_chkr
*/

//:IBIST nbfibrxmsk Register		0x84_0000_0ed0	
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_nbfibrxmsk.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_nbfibrxmsk
   -module mcu
   -group rst_chkr
*/

//:IBIST nbfibrxshft Register		0x84_0000_0ed8	
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_nbfibrxshft.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_nbfibrxshft
   -module mcu
   -group rst_chkr
*/

//:IBIST nbfibpattbuf2/nbfibpatt2en Register	0x84_0000_0ee0
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_nbfibpattbuf2.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_nbfibpattbuf2
   -module mcu
   -group rst_chkr
*/

//:IBIST nbfibpattbuf2/nbfibpatt2en Register	0x84_0000_0ee0
/* 0in constant 
   -var `CPU.mcu0.fbdic.pff_nbfibpatt2en.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mcu_ibist_nbfibpatt2en
   -module mcu
   -group rst_chkr
*/



// PEU DMU

// TO ENABLE : IMU Error Log Enable Register (0x00631000 / 0x7FFF)
/* 0in constant 
   -var `CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_error_log_en_reg.imu_error_log_en_reg_0.imu_error_log_en_reg_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_dmu_error_log_enable
   -module dmu
   -group rst_chkr
*/

// TO ENABLE : IMU Error Status Clear Register (0x00631018 / 0x0)
/* 0in constant 
   -var `CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_logged_error_status_reg.imu_logged_error_status_reg_0.imu_logged_error_status_reg_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_dmu_error_status_clear
   -module dmu
   -group rst_chkr
*/

// TO ENABLE : IMU RDS Error Log Register (0x00631028 / 0x0)
/* 0in constant 
   -var `CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_rds_error_log_reg.imu_rds_error_log_reg_0.imu_rds_error_log_reg_csrbus_read_data
   -active (`RST.rst_wmr_protect & ((|`CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_rds_error_log_reg.imu_rds_error_log_reg_0.imu_rds_error_log_reg_csrbus_read_data[7:0]) | (|`CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_rds_error_log_reg.imu_rds_error_log_reg_0.imu_rds_error_log_reg_csrbus_read_data[39:10])))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_dmu_error_log
   -module dmu
   -group rst_chkr
*/

// TO ENABLE :IMU SCS Error Log Register (0x00631030 / 0x0)
/* 0in constant 
   -var `CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_scs_error_log_reg.imu_scs_error_log_reg_0.imu_scs_error_log_reg_csrbus_read_data
   -active (`RST.rst_wmr_protect &((|`CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_rds_error_log_reg.imu_rds_error_log_reg_0.imu_rds_error_log_reg_csrbus_read_data[8]) | (|`CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_rds_error_log_reg.imu_rds_error_log_reg_0.imu_rds_error_log_reg_csrbus_read_data[40])))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_imu_scs_error_log
   -module dmu
   -group rst_chkr
*/

// TO ENABLE :IMU EQS Error Log Register (0x00631038 / 0x0)
/* 0in constant 
   -var `CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_eqs_error_log_reg.imu_eqs_error_log_reg_0.imu_eqs_error_log_reg_csrbus_read_data[63:0]
   -active (`RST.rst_wmr_protect & ((|`CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_rds_error_log_reg.imu_rds_error_log_reg_0.imu_rds_error_log_reg_csrbus_read_data[9]) | (|`CPU.dmu.dmc.imu.ics.csr.dmu_imu_ics_default_grp.imu_rds_error_log_reg.imu_rds_error_log_reg_0.imu_rds_error_log_reg_csrbus_read_data[41])))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_imu_eqs_error_log
   -module dmu
   -group rst_chkr
*/

// TO ENABLE :MMU Error Log Enable Register (0x00641000 / 0x1FFFFF)
/* 0in constant 
   -var `CPU.dmu.dmc.mmu.csr.csr.dmu_mmu_csr_default_grp.log.log_0.log_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mmu_error_log_enable
   -module dmu
   -group rst_chkr
*/

// TO ENABLE :MMU Error Status Clear Register (0x00641018 / 0x0)
/* 0in constant 
   -var `CPU.dmu.dmc.mmu.csr.csr.dmu_mmu_csr_default_grp.err.err_0.err_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mmu_error_status_clear
   -module dmu
   -group rst_chkr
*/

// TO ENABLE :MMU Translation Fault Address Register (0x00641028 / 0x0)
/* 0in constant 
   -var `CPU.dmu.dmc.mmu.csr.csr.dmu_mmu_csr_default_grp.flta.flta_0.flta_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mmu_translation_fault_addr
   -module dmu
   -group rst_chkr
*/

// TO ENABLE :MMU Translation Fault Status Register (0x00641030 / 0x0)
/* 0in constant 
   -var `CPU.dmu.dmc.mmu.csr.csr.dmu_mmu_csr_default_grp.flts.flts_0.flts_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_mmu_translation_fault_status
   -module dmu
   -group rst_chkr
*/

// TO ENABLE :ILU Error Log Enable Register (0x00651000 / 0xF0)
/* 0in constant 
   -var `CPU.dmu.ilu.cib.csr.dmu_ilu_cib_default_grp.ilu_log_en.ilu_log_en_0.ilu_log_en_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ilu_error_log_enable
   -module dmu
   -group rst_chkr
*/

// TO ENABLE :ILU Error Status Clear Register (0x00651018 / 0x0)
/* 0in constant 
   -var `CPU.dmu.ilu.cib.csr.dmu_ilu_cib_default_grp.ilu_log_err.ilu_log_err_0.ilu_log_err_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_ilu_error_status_clear
   -module dmu
   -group rst_chkr
*/

// TO ENABLE :PEU Control Register (0x00680000 / 0x1)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.tlu_ctl.tlu_ctl_0.tlu_ctl_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_control
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Ingress Credits Initial Register (0x00680018 / 0x10000200C0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.tlu_ici.tlu_ici_0.tlu_ici_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_ingress_credit_initial
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Other Event Log Enable Register (0x00681000 / 0xFFFFFF)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.oe_log.oe_log_0.oe_log_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_other_event_log_enable
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Other Event Status Clear Register (0x00681018 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.oe_err.oe_err_0.oe_err_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_other_event_status_clear
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Receive Other Event Header1 Log Register (0x00681028 / 0x0)

/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.roe_hdr1.roe_hdr1_0.roe_hdr1_csrbus_read_data
   -active (`RST.rst_wmr_protect & (|`CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.oe_err.oe_err_0.oe_err_csrbus_read_data))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_receive_other_event_header1_log
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Receive Other Event Header2 Log Register (0x00681030 / 0x0)

/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.roe_hdr2.roe_hdr2_0.roe_hdr2_csrbus_read_data
   -active (`RST.rst_wmr_protect & (|`CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.oe_err.oe_err_0.oe_err_csrbus_read_data))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_receive_other_event_header2_log
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Transmit Other Event Header1 Log Register (0x00681038 / 0x0)

/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.toe_hdr1.toe_hdr1_0.toe_hdr1_csrbus_read_data
   -active (`RST.rst_wmr_protect & (|`CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.oe_err.oe_err_0.oe_err_csrbus_read_data))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_transmit_other_event_header1_log
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Transmit Other Event Header2 Log Register (0x00681040 / 0x0)

/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.toe_hdr2.toe_hdr2_0.toe_hdr2_csrbus_read_data
   -active (`RST.rst_wmr_protect & (|`CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.oe_err.oe_err_0.oe_err_csrbus_read_data))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_transmit_other_event_header2_log
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Uncorrectable Error Log Enable Register (0x00691000 / 0x17F011)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_log.ue_log_0.ue_log_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_uncorrectible_error_log_enable
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Uncorrectable Error Status Clear Register (0x00691018 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_err.ue_err_0.ue_err_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_uncorrectible_error_status_clear
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Receive Uncorrectable Error Header1 Log Register (0x00691028

/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.rue_hdr1.rue_hdr1_0.rue_hdr1_csrbus_read_data
   -active (`RST.rst_wmr_protect & (|`CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_err.ue_err_0.ue_err_csrbus_read_data))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_receive_uncorrectible_error_header1_log
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Receive Uncorrectable Error Header2 Log Register (0x00691030 /

/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.rue_hdr2.rue_hdr2_0.rue_hdr2_csrbus_read_data
   -active (`RST.rst_wmr_protect & (|`CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_err.ue_err_0.ue_err_csrbus_read_data))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_receive_uncorrectible_error_header2_log
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Transmit Uncorrectable Error Header1 Log Register (0x00691038

/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.tue_hdr1.tue_hdr1_0.tue_hdr1_csrbus_read_data
   -active (`RST.rst_wmr_protect & (|`CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_err.ue_err_0.ue_err_csrbus_read_data))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_transmit_uncorrectible_error_header1_log
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Transmit Uncorrectable Error Header2 Log Register (0x00691040 / 0x0)

/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.tue_hdr2.tue_hdr2_0.tue_hdr2_csrbus_read_data
   -active (`RST.rst_wmr_protect & (|`CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_err.ue_err_0.ue_err_csrbus_read_data))
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_transmit_uncorrectible_error_header2_log
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Correctable Error Log Enable Register (0x006A1000 / 0x11C1)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ce_log.ce_log_0.ce_log_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_correctible_error_log_enable
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU Correctable Error Status Clear Register (0x006A1018 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ce_err.ce_err_0.ce_err_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_correctible_error_status_clear
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU DLPL/SERDES Revision Register (0x006E2000 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.peu_dlpl_serdes_rev.peu_dlpl_serdes_rev_0.peu_dlpl_serdes_rev_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_DLPL_serdes_revision
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU DLPL Event/Error Log Enable Register (0x006E2108)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.event_err_log_en.event_err_log_en_0.event_err_log_en_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_DLPL_event_log_enable
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU DLPL Event/Error Status Clear Register (0x006E2120 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.event_err_sts_clr.event_err_sts_clr_0.event_err_sts_clr_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_DLPL_event_status_clear
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES PLL Control/Status Register (0x006E2200 / 0x1)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_pll.serdes_pll_0.serdes_pll_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_pll_control
   -module peu
   -group rst_chkr
*/

//// TO ENABLE :PEU SERDES Receiver Lane 0  Control Register (0x006E2300 -

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_ctl.serdes_receiver_lane_ctl_0.serdes_receiver_lane_ctl_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_0
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 1  Control Register (0x006E2300 -

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_ctl.serdes_receiver_lane_ctl_1.serdes_receiver_lane_ctl_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_1
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 2  Control Register (0x006E2300 -

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_ctl.serdes_receiver_lane_ctl_2.serdes_receiver_lane_ctl_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_2
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 3  Control Register (0x006E2300 -

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_ctl.serdes_receiver_lane_ctl_3.serdes_receiver_lane_ctl_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_3
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 4  Control Register (0x006E2300 -

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_ctl.serdes_receiver_lane_ctl_4.serdes_receiver_lane_ctl_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_4
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 5  Control Register (0x006E2300 -

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_ctl.serdes_receiver_lane_ctl_5.serdes_receiver_lane_ctl_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_5
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 6  Control Register (0x006E2300 -

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_ctl.serdes_receiver_lane_ctl_6.serdes_receiver_lane_ctl_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_6
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 7  Control Register (0x006E2300 -

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_ctl.serdes_receiver_lane_ctl_7.serdes_receiver_lane_ctl_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_7
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 0 Status Register (0x006E2380 - 0x006E23B8 / 0x0)

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_status.serdes_receiver_lane_status_0.serdes_receiver_lane_status_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_status_0
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 1 Status Register (0x006E2380 - 0x006E23B8 / 0x0)

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_status.serdes_receiver_lane_status_1.serdes_receiver_lane_status_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_status_1
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 2 Status Register (0x006E2380 - 0x006E23B8 / 0x0)

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_status.serdes_receiver_lane_status_2.serdes_receiver_lane_status_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_status_2
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 3 Status Register (0x006E2380 - 0x006E23B8 / 0x0)

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_status.serdes_receiver_lane_status_3.serdes_receiver_lane_status_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_status_3
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 4 Status Register (0x006E2380 - 0x006E23B8 / 0x0)

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_status.serdes_receiver_lane_status_4.serdes_receiver_lane_status_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_status_4
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 5 Status Register (0x006E2380 - 0x006E23B8 / 0x0)

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_status.serdes_receiver_lane_status_5.serdes_receiver_lane_status_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_status_5
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 6 Status Register (0x006E2380 - 0x006E23B8 / 0x0)

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_status.serdes_receiver_lane_status_6.serdes_receiver_lane_status_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_status_6
//   -module peu
//   -group rst_chkr
//*/
//
//// TO ENABLE :PEU SERDES Receiver Lane 7 Status Register (0x006E2380 - 0x006E23B8 / 0x0)

//   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_receiver_lane_status.serdes_receiver_lane_status_7.serdes_receiver_lane_status_csrbus_read_data
//   -active (`RST.rst_wmr_protect )
//   -clock `RST.ccu_rst_sys_clk
//   -name wrm_protect_peu_serdes_receiver_lane_status_7
//   -module peu
//   -group rst_chkr
//*/

// TO ENABLE :PEU SERDES Transmitter Lane 0  Control Register (0x006E2400 -
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_ctl.serdes_xmitter_lane_ctl_0.serdes_xmitter_lane_ctl_csrbus_read_data 
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_0
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 1  Control Register (0x006E2400 -
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_ctl.serdes_xmitter_lane_ctl_1.serdes_xmitter_lane_ctl_csrbus_read_data 
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_1
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 2  Control Register (0x006E2400 -
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_ctl.serdes_xmitter_lane_ctl_2.serdes_xmitter_lane_ctl_csrbus_read_data 
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_2
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 3  Control Register (0x006E2400 -
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_ctl.serdes_xmitter_lane_ctl_3.serdes_xmitter_lane_ctl_csrbus_read_data 
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_3
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 4  Control Register (0x006E2400 -
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_ctl.serdes_xmitter_lane_ctl_4.serdes_xmitter_lane_ctl_csrbus_read_data 
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_4
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 5  Control Register (0x006E2400 -
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_ctl.serdes_xmitter_lane_ctl_5.serdes_xmitter_lane_ctl_csrbus_read_data 
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_5
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 6  Control Register (0x006E2400 -
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_ctl.serdes_xmitter_lane_ctl_6.serdes_xmitter_lane_ctl_csrbus_read_data 
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_6
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 7  Control Register (0x006E2400 -
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_ctl.serdes_xmitter_lane_ctl_7.serdes_xmitter_lane_ctl_csrbus_read_data 
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_7
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 0  Status Register (0x006E2480 - 0x006E24B8 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_status.serdes_xmitter_lane_status_0.serdes_xmitter_lane_status_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_status_0
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 1  Status Register (0x006E2480 - 0x006E24B8 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_status.serdes_xmitter_lane_status_1.serdes_xmitter_lane_status_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_status_1
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 2  Status Register (0x006E2480 - 0x006E24B8 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_status.serdes_xmitter_lane_status_2.serdes_xmitter_lane_status_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_status_2
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 3  Status Register (0x006E2480 - 0x006E24B8 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_status.serdes_xmitter_lane_status_3.serdes_xmitter_lane_status_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_status_3
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 4  Status Register (0x006E2480 - 0x006E24B8 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_status.serdes_xmitter_lane_status_4.serdes_xmitter_lane_status_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_status_4
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 5  Status Register (0x006E2480 - 0x006E24B8 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_status.serdes_xmitter_lane_status_5.serdes_xmitter_lane_status_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_status_5
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 6  Status Register (0x006E2480 - 0x006E24B8 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_status.serdes_xmitter_lane_status_6.serdes_xmitter_lane_status_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_status_6
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES Transmitter Lane 7  Status Register (0x006E2480 - 0x006E24B8 / 0x0)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_xmitter_lane_status.serdes_xmitter_lane_status_7.serdes_xmitter_lane_status_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_transmitter_lane_status_7
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES MACRO 0 Test Configuration Register (0x006E2500 - 0x006E2508 / 0x03)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_macro_test_cfg.serdes_macro_test_cfg_0.serdes_macro_test_cfg_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_macro_test_conf_0
   -module peu
   -group rst_chkr
*/

// TO ENABLE :PEU SERDES MACRO 1 Test Configuration Register (0x006E2500 - 0x006E2508 / 0x03)
/* 0in constant 
   -var `CPU.peu.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_macro_test_cfg.serdes_macro_test_cfg_1.serdes_macro_test_cfg_csrbus_read_data
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_peu_serdes_macro_test_conf_1
   -module peu
   -group rst_chkr
*/


// L2
//L2 Error Enable register       0xAA-0000-0000 or 0xBA-0000-0000
/* 0in constant 
   -var `CPU.l2t0.csr.ff_csr_l2_erren_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_enable
   -module l2t
   -group rst_chkr
*/

//L2 Error Status Reg            0xAB-0000-0000 or 0xBB-0000-0000
/* 0in constant 
   -var `CPU.l2t0.csr.csr_l2_errstate_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_status
   -module l2t
   -group rst_chkr
*/
//L2 Error Address Unknown       0xAC-0000-0000 or 0xBC-0000-0000
/* 0in constant 
   -var `CPU.l2t0.csr.ff_csr_l2_erraddr_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_address
   -module l2t
   -group rst_chkr
*/
//L2 Notdata Error Register      0xAE-0000-0000 or 0xBE-0000-0000
/* 0in constant 
   -var `CPU.l2t0.csr.csr_l2_notdata_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_notdata_error
   -module l2t
   -group rst_chkr
*/
//L2 Error Inject 0              0xAD-0000- 0000 or 0xBD-0000-0000
/* 0in constant 
   -var `CPU.l2t0.csr.ff_csr_l2_errinj_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_inject
   -module l2t
   -group rst_chkr
*/
//L2 Mask Reg 0                  0xAF-0000-0000
/* 0in constant 
   -var `CPU.l2t0.csr.ff_l2_mask_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_mask
   -module l2t
   -group rst_chkr
*/
//L2 Address Compare Reg 0       0xBF-0000-0000
/* 0in constant 
   -var `CPU.l2t0.csr.ff_l2_compare_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_address_compare
   -module l2t
   -group rst_chkr
*/

//l2t1
//L2 Error Enable register       0xAA-0000-0000 or 0xBA-0000-0000
/* 0in constant 
   -var `CPU.l2t1.csr.ff_csr_l2_erren_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_enable
   -module l2t
   -group rst_chkr
*/

//L2 Error Status Reg            0xAB-0000-0000 or 0xBB-0000-0000
/* 0in constant 
   -var `CPU.l2t1.csr.csr_l2_errstate_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_status
   -module l2t
   -group rst_chkr
*/
//L2 Error Address Unknown       0xAC-0000-0000 or 0xBC-0000-0000
/* 0in constant 
   -var `CPU.l2t1.csr.ff_csr_l2_erraddr_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_address
   -module l2t
   -group rst_chkr
*/
//L2 Notdata Error Register      0xAE-0000-0000 or 0xBE-0000-0000
/* 0in constant 
   -var `CPU.l2t1.csr.csr_l2_notdata_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_notdata_error
   -module l2t
   -group rst_chkr
*/
//L2 Error Inject 0              0xAD-0000- 0000 or 0xBD-0000-0000
/* 0in constant 
   -var `CPU.l2t1.csr.ff_csr_l2_errinj_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_inject
   -module l2t
   -group rst_chkr
*/
//L2 Mask Reg 0                  0xAF-0000-0000
/* 0in constant 
   -var `CPU.l2t1.csr.ff_l2_mask_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_mask
   -module l2t
   -group rst_chkr
*/
//L2 Address Compare Reg 0       0xBF-0000-0000
/* 0in constant 
   -var `CPU.l2t1.csr.ff_l2_compare_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_address_compare
   -module l2t
   -group rst_chkr
*/
//l2t2
//L2 Error Enable register       0xAA-0000-0000 or 0xBA-0000-0000
/* 0in constant 
   -var `CPU.l2t2.csr.ff_csr_l2_erren_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_enable
   -module l2t
   -group rst_chkr
*/

//L2 Error Status Reg            0xAB-0000-0000 or 0xBB-0000-0000
/* 0in constant 
   -var `CPU.l2t2.csr.csr_l2_errstate_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_status
   -module l2t
   -group rst_chkr
*/
//L2 Error Address Unknown       0xAC-0000-0000 or 0xBC-0000-0000
/* 0in constant 
   -var `CPU.l2t2.csr.ff_csr_l2_erraddr_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_address
   -module l2t
   -group rst_chkr
*/
//L2 Notdata Error Register      0xAE-0000-0000 or 0xBE-0000-0000
/* 0in constant 
   -var `CPU.l2t2.csr.csr_l2_notdata_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_notdata_error
   -module l2t
   -group rst_chkr
*/
//L2 Error Inject 0              0xAD-0000- 0000 or 0xBD-0000-0000
/* 0in constant 
   -var `CPU.l2t2.csr.ff_csr_l2_errinj_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_inject
   -module l2t
   -group rst_chkr
*/
//L2 Mask Reg 0                  0xAF-0000-0000
/* 0in constant 
   -var `CPU.l2t2.csr.ff_l2_mask_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_mask
   -module l2t
   -group rst_chkr
*/
//L2 Address Compare Reg 0       0xBF-0000-0000
/* 0in constant 
   -var `CPU.l2t2.csr.ff_l2_compare_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_address_compare
   -module l2t
   -group rst_chkr
*/

//L2 Error Enable register       0xAA-0000-0000 or 0xBA-0000-0000
/* 0in constant 
   -var `CPU.l2t3.csr.ff_csr_l2_erren_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_enable
   -module l2t
   -group rst_chkr
*/

//L2 Error Status Reg            0xAB-0000-0000 or 0xBB-0000-0000
/* 0in constant 
   -var `CPU.l2t3.csr.csr_l2_errstate_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_status
   -module l2t
   -group rst_chkr
*/
//L2 Error Address Unknown       0xAC-0000-0000 or 0xBC-0000-0000
/* 0in constant 
   -var `CPU.l2t3.csr.ff_csr_l2_erraddr_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_address
   -module l2t
   -group rst_chkr
*/
//L2 Notdata Error Register      0xAE-0000-0000 or 0xBE-0000-0000
/* 0in constant 
   -var `CPU.l2t3.csr.csr_l2_notdata_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_notdata_error
   -module l2t
   -group rst_chkr
*/
//L2 Error Inject 0              0xAD-0000- 0000 or 0xBD-0000-0000
/* 0in constant 
   -var `CPU.l2t3.csr.ff_csr_l2_errinj_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_inject
   -module l2t
   -group rst_chkr
*/
//L2 Mask Reg 0                  0xAF-0000-0000
/* 0in constant 
   -var `CPU.l2t3.csr.ff_l2_mask_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_mask
   -module l2t
   -group rst_chkr
*/
//L2 Address Compare Reg 0       0xBF-0000-0000
/* 0in constant 
   -var `CPU.l2t3.csr.ff_l2_compare_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_address_compare
   -module l2t
   -group rst_chkr
*/

//l2t4
//L2 Error Enable register       0xAA-0000-0000 or 0xBA-0000-0000
/* 0in constant 
   -var `CPU.l2t4.csr.ff_csr_l2_erren_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_enable
   -module l2t
   -group rst_chkr
*/

//L2 Error Status Reg            0xAB-0000-0000 or 0xBB-0000-0000
/* 0in constant 
   -var `CPU.l2t4.csr.csr_l2_errstate_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_status
   -module l2t
   -group rst_chkr
*/
//L2 Error Address Unknown       0xAC-0000-0000 or 0xBC-0000-0000
/* 0in constant 
   -var `CPU.l2t4.csr.ff_csr_l2_erraddr_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_address
   -module l2t
   -group rst_chkr
*/
//L2 Notdata Error Register      0xAE-0000-0000 or 0xBE-0000-0000
/* 0in constant 
   -var `CPU.l2t4.csr.csr_l2_notdata_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_notdata_error
   -module l2t
   -group rst_chkr
*/
//L2 Error Inject 0              0xAD-0000- 0000 or 0xBD-0000-0000
/* 0in constant 
   -var `CPU.l2t4.csr.ff_csr_l2_errinj_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_inject
   -module l2t
   -group rst_chkr
*/
//L2 Mask Reg 0                  0xAF-0000-0000
/* 0in constant 
   -var `CPU.l2t4.csr.ff_l2_mask_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_mask
   -module l2t
   -group rst_chkr
*/
//L2 Address Compare Reg 0       0xBF-0000-0000
/* 0in constant 
   -var `CPU.l2t4.csr.ff_l2_compare_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_address_compare
   -module l2t
   -group rst_chkr
*/

//l2t5
//L2 Error Enable register       0xAA-0000-0000 or 0xBA-0000-0000
/* 0in constant 
   -var `CPU.l2t5.csr.ff_csr_l2_erren_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_enable
   -module l2t
   -group rst_chkr
*/

//L2 Error Status Reg            0xAB-0000-0000 or 0xBB-0000-0000
/* 0in constant 
   -var `CPU.l2t5.csr.csr_l2_errstate_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_status
   -module l2t
   -group rst_chkr
*/
//L2 Error Address Unknown       0xAC-0000-0000 or 0xBC-0000-0000
/* 0in constant 
   -var `CPU.l2t5.csr.ff_csr_l2_erraddr_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_address
   -module l2t
   -group rst_chkr
*/
//L2 Notdata Error Register      0xAE-0000-0000 or 0xBE-0000-0000
/* 0in constant 
   -var `CPU.l2t5.csr.csr_l2_notdata_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_notdata_error
   -module l2t
   -group rst_chkr
*/
//L2 Error Inject 0              0xAD-0000- 0000 or 0xBD-0000-0000
/* 0in constant 
   -var `CPU.l2t5.csr.ff_csr_l2_errinj_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_inject
   -module l2t
   -group rst_chkr
*/
//L2 Mask Reg 0                  0xAF-0000-0000
/* 0in constant 
   -var `CPU.l2t5.csr.ff_l2_mask_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_mask
   -module l2t
   -group rst_chkr
*/
//L2 Address Compare Reg 0       0xBF-0000-0000
/* 0in constant 
   -var `CPU.l2t5.csr.ff_l2_compare_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_address_compare
   -module l2t
   -group rst_chkr
*/

//l2t6
//L2 Error Enable register       0xAA-0000-0000 or 0xBA-0000-0000
/* 0in constant 
   -var `CPU.l2t6.csr.ff_csr_l2_erren_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_enable
   -module l2t
   -group rst_chkr
*/

//L2 Error Status Reg            0xAB-0000-0000 or 0xBB-0000-0000
/* 0in constant 
   -var `CPU.l2t6.csr.csr_l2_errstate_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_status
   -module l2t
   -group rst_chkr
*/
//L2 Error Address Unknown       0xAC-0000-0000 or 0xBC-0000-0000
/* 0in constant 
   -var `CPU.l2t6.csr.ff_csr_l2_erraddr_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_address
   -module l2t
   -group rst_chkr
*/
//L2 Notdata Error Register      0xAE-0000-0000 or 0xBE-0000-0000
/* 0in constant 
   -var `CPU.l2t6.csr.csr_l2_notdata_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_notdata_error
   -module l2t
   -group rst_chkr
*/
//L2 Error Inject 0              0xAD-0000- 0000 or 0xBD-0000-0000
/* 0in constant 
   -var `CPU.l2t6.csr.ff_csr_l2_errinj_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_inject
   -module l2t
   -group rst_chkr
*/
//L2 Mask Reg 0                  0xAF-0000-0000
/* 0in constant 
   -var `CPU.l2t6.csr.ff_l2_mask_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_mask
   -module l2t
   -group rst_chkr
*/
//L2 Address Compare Reg 0       0xBF-0000-0000
/* 0in constant 
   -var `CPU.l2t6.csr.ff_l2_compare_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_address_compare
   -module l2t
   -group rst_chkr
*/

//l2t7
//L2 Error Enable register       0xAA-0000-0000 or 0xBA-0000-0000
/* 0in constant 
   -var `CPU.l2t7.csr.ff_csr_l2_erren_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_enable
   -module l2t
   -group rst_chkr
*/

//L2 Error Status Reg            0xAB-0000-0000 or 0xBB-0000-0000
/* 0in constant 
   -var `CPU.l2t7.csr.csr_l2_errstate_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_status
   -module l2t
   -group rst_chkr
*/
//L2 Error Address Unknown       0xAC-0000-0000 or 0xBC-0000-0000
/* 0in constant 
   -var `CPU.l2t7.csr.ff_csr_l2_erraddr_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_address
   -module l2t
   -group rst_chkr
*/
//L2 Notdata Error Register      0xAE-0000-0000 or 0xBE-0000-0000
/* 0in constant 
   -var `CPU.l2t7.csr.csr_l2_notdata_reg
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_notdata_error
   -module l2t
   -group rst_chkr
*/
//L2 Error Inject 0              0xAD-0000- 0000 or 0xBD-0000-0000
/* 0in constant 
   -var `CPU.l2t7.csr.ff_csr_l2_errinj_d1.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_error_inject
   -module l2t
   -group rst_chkr
*/
//L2 Mask Reg 0                  0xAF-0000-0000
/* 0in constant 
   -var `CPU.l2t7.csr.ff_l2_mask_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_mask
   -module l2t
   -group rst_chkr
*/
//L2 Address Compare Reg 0       0xBF-0000-0000
/* 0in constant 
   -var `CPU.l2t7.csr.ff_l2_compare_register.dout
   -active (`RST.rst_wmr_protect )
   -clock `RST.ccu_rst_sys_clk
   -name wrm_protect_l2_address_compare
   -module l2t
   -group rst_chkr
*/

`endif


endmodule // warm_protect_checker

