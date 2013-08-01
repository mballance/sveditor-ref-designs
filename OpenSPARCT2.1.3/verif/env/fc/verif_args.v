// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: verif_args.v
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
`include "fc.vh"

module verif_args;

`ifdef TCU_GATE
    wire [31:0] bisx_counter;
    wire [47:0] mbist_start;
    wire clock_stop_active;
    wire [3:0] tap_state;
    wire [7:0] instr;

    assign bisx_counter = {tb_top.cpu.tcu.mbist_ctl__bisx_counter_31_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_30_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_29_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_28_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_27_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_26_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_25_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_24_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_23_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_22_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_21_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_20_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_19_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_18_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_17_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_16_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_15_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_14_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_13_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_12_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_11_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_10_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_9_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_8_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_7_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_6_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_5_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_4_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_3_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_2_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_1_, tb_top.cpu.tcu.mbist_ctl__bisx_counter_0_};

    assign mbist_start = {tb_top.cpu.tcu.tcu_rdp_rdmc_mbist_start, tb_top.cpu.tcu.tcu_rtx_rxc_ipp0_mbist_start, tb_top.cpu.tcu.tcu_rtx_rxc_ipp1_mbist_start, tb_top.cpu.tcu.tcu_rtx_rxc_mb5_mbist_start, tb_top.cpu.tcu.tcu_rtx_rxc_mb6_mbist_start, tb_top.cpu.tcu.tcu_rtx_rxc_zcp0_mbist_start, tb_top.cpu.tcu.tcu_rtx_rxc_zcp1_mbist_start, tb_top.cpu.tcu.tcu_rtx_txc_txe0_mbist_start, tb_top.cpu.tcu.tcu_rtx_txc_txe1_mbist_start, tb_top.cpu.tcu.tcu_tds_smx_mbist_start, tb_top.cpu.tcu.tcu_tds_tdmc_mbist_start, tb_top.cpu.tcu.tcu_peu_mbist_start, tb_top.cpu.tcu.tcu_dmu_mbist_start, tb_top.cpu.tcu.tcu_l2t7_mbist_start, tb_top.cpu.tcu.tcu_l2t6_mbist_start, tb_top.cpu.tcu.tcu_l2t5_mbist_start, tb_top.cpu.tcu.tcu_l2t4_mbist_start, tb_top.cpu.tcu.tcu_l2t3_mbist_start, tb_top.cpu.tcu.tcu_l2t2_mbist_start, tb_top.cpu.tcu.tcu_l2t1_mbist_start, tb_top.cpu.tcu.tcu_l2t0_mbist_start, tb_top.cpu.tcu.tcu_l2b7_mbist_start, tb_top.cpu.tcu.tcu_l2b6_mbist_start, tb_top.cpu.tcu.tcu_l2b5_mbist_start, tb_top.cpu.tcu.tcu_l2b4_mbist_start, tb_top.cpu.tcu.tcu_l2b3_mbist_start, tb_top.cpu.tcu.tcu_l2b2_mbist_start, tb_top.cpu.tcu.tcu_l2b1_mbist_start, tb_top.cpu.tcu.tcu_l2b0_mbist_start, tb_top.cpu.tcu.tcu_mcu3_mbist_start, tb_top.cpu.tcu.tcu_mcu2_mbist_start, tb_top.cpu.tcu.tcu_mcu1_mbist_start, tb_top.cpu.tcu.tcu_mcu0_mbist_start, tb_top.cpu.tcu.tcu_ncu_mbist_start, tb_top.cpu.tcu.tcu_sio_mbist_start, tb_top.cpu.tcu.tcu_sii_mbist_start, tb_top.cpu.tcu.tcu_spc_mbist_start};

    assign clock_stop_active = tb_top.cpu.tcu.sigmux_ctl__hard_stop_via_reg | tb_top.cpu.tcu.sigmux_ctl__flush_clk_stop_active_l | tb_top.cpu.tcu.sigmux_ctl__coreavail_clk_stop_active_dout | tb_top.cpu.tcu.sigmux_ctl__jtag_clk_stop_active;

    assign tap_state = {tb_top.cpu.tcu.jtag_ctl__tcu_jtag_tap_ctl_tap_state_l_3_, tb_top.cpu.tcu.jtag_ctl__tcu_jtag_tap_ctl_tap_state_l_2_, tb_top.cpu.tcu.jtag_ctl__tcu_jtag_tap_ctl_tap_state_l_1_, tb_top.cpu.tcu.jtag_ctl__tcu_jtag_tap_ctl_tap_state_l_0_};

    assign instr = {tb_top.cpu.tcu.jtag_ctl__instr_7_, tb_top.cpu.tcu.jtag_ctl__instr_6_, tb_top.cpu.tcu.jtag_ctl__instr_5_, tb_top.cpu.tcu.jtag_ctl__instr_4_, tb_top.cpu.tcu.jtag_ctl__instr_3_, tb_top.cpu.tcu.jtag_ctl__instr_2_, tb_top.cpu.tcu.jtag_ctl__instr_1_, tb_top.cpu.tcu.jtag_ctl__tcu_jtag_tap_ctl_instr_l};
`endif // TCU_GATE

`ifdef NCU_GATE
    wire [7:0] coreavail;
    wire [2:0] ssi_sm;

    assign  coreavail = {tb_top.cpu.ncu.ncu_spc7_core_enable_status, tb_top.cpu.ncu.ncu_spc6_core_enable_status, tb_top.cpu.ncu.ncu_spc6_core_enable_status, tb_top.cpu.ncu.ncu_spc4_core_enable_status, tb_top.cpu.ncu.ncu_spc3_core_enable_status, tb_top.cpu.ncu.ncu_spc2_core_enable_status, tb_top.cpu.ncu.ncu_spc1_core_enable_status, tb_top.cpu.ncu.ncu_spc0_core_enable_status};

    assign ssi_sm = {tb_top.cpu.ncu.ncu_ssitop_ctl__ncu_ssisif_ctl_ssi_sm_2_, tb_top.cpu.ncu.ncu_ssitop_ctl__ncu_ssisif_ctl_ssi_sm_1_, tb_top.cpu.ncu.ncu_ssitop_ctl__ncu_ssisif_ctl_ssi_sm_0_};
`endif // NCU_GATE

// common args. has associated vars in it as well, rather than in top.
`include "plus_args.v"

// Dump for Debussy
`include "dump.v"


endmodule

