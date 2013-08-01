// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rst_fsm_ctl.v
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
`define   ASSERT               1'b0            // For active low signal.
`define DEASSERT               1'b1            // For active low signal.

`define INFO   20
                                               //                     (Origin:)
`define IOB_CREG_RESET_GEN    40'h89_0000_0808 //Adr of RESET_GEN    reg (Fire.)
`define IOB_CREG_RESET_SOURCE 40'h89_0000_0818 //Adr of RESET_SOURCE reg (Fire.)
`define IOB_CREG_SSYSRESET    40'h89_0000_0838 //Adr of SSYS_RESET   reg (N1.)
`define IOB_CREG_RESETSTAT    40'h89_0000_0810 //Adr of RSET_STAT    reg (N1.)
`define IOB_CREG_CCU_TIME     40'h89_0000_0860 //Adr of CCU_TIME     reg (N2.)
`define IOB_CREG_LOCK_TIME    40'h89_0000_0870 //Adr of LOCK_TIME    reg (N2.)
`define IOB_CREG_PROP_TIME    40'h89_0000_0880 //Adr of PROP_TIME    reg (N2.)
`define IOB_CREG_NIU_TIME     40'h89_0000_0890 //Adr of NIU_TIME     reg (N2.)
`define IOB_CREG_RESET_FEE    40'h89_0000_0820 //Adr of RESET_FEE    reg (N2.)
//________________________________________________________________

`define RST_FSM_WIDTH           33
`define RST_INIT_STATE          33'h0_0000_0001
`define POR1_LOCK_TIME          33'h0_0000_0002
`define POR1_ARST_TIME          33'h0_0000_0004
`define POR1_SYNC_STABLE        33'h0_0000_0008
`define POR1_ASICFLUSH_STOP_ACK 33'h0_0000_0010
`define POR1_NIU_TIME           33'h0_0000_0020
`define POR1_FLUSH_STOP_ACK     33'h0_0000_0040
`define POR1_BISX_DONE          33'h0_0000_0080
`define POR2_FLUSH_INIT_ACK     33'h0_0000_0100
`define POR2_LOCK_TIME          33'h0_0000_0200
`define POR2_FLUSH_STOP_ACK     33'h0_0000_0400
`define POR2_EFU_DONE           33'h0_0000_0800
`define POR2_ASSERT_RUN         33'h0_0000_1000
`define POR2_UNPARK_THREAD      33'h0_0000_2000
`define WMR1_WMR_GEN            33'h0_0000_4000
`define WMR1_DEASSERT_RUN       33'h0_0000_8000
`define WMR1_FLUSH_INIT_ACK     33'h0_0001_0000
`define WMR1_PRE_PLL1           33'h0_0002_0000
`define WMR1_PRE_PLL2           33'h0_0004_0000
`define WMR1_CCU_PLL            33'h0_0008_0000
`define WMR1_LOCK_TIME          33'h0_0010_0000
`define WMR1_ARST_TIME          33'h0_0020_0000
`define WMR1_PROP_TIME          33'h0_0040_0000
`define WMR1_SYNC_STABLE        33'h0_0080_0000
`define WMR1_FLUSH_STOP_ACK     33'h0_0100_0000
`define WMR1_BISX_DONE          33'h0_0200_0000
`define WMR2_FLUSH_INIT_ACK     33'h0_0400_0000
`define WMR2_PROP_TIME          33'h0_0800_0000
`define WMR2_FLUSH_STOP_ACK     33'h0_1000_0000
`define WMR2_NIU_TIME           33'h1_0000_0000
`define WMR2_ASSERT_RUN         33'h0_2000_0000
`define WMR2_UNPARK_THREAD      33'h0_4000_0000
`define RST_ARBITER             33'h0_8000_0000

`define XIR_IDLE                 2'h1
`define XIR_DONE                 2'h2

`define DMU_IDLE                 3'h1
`define DMU_TIME1                3'h2
`define DMU_TIME2                3'h4

`define NIU_IDLE                 2'h1
`define NIU_TIME                 2'h2
//________________________________________________________________

// Already taken addresses, in address order:
// sort -t "'" -k 2 /home/jl148824/project/NCU/include/iop.h:

//`define IOB_CREG_INTMAN            32'h00000000
//`define IOB_CREG_INTSTAT           32'h00000000
//`define IOB_CREG_INTCTL            32'h00000400
//`define IOB_CREG_MDATA0            32'h00000400
//`define IOB_CREG_MDATA1            32'h00000500
//`define IOB_CREG_MDATA0_ALIAS      32'h00000600
//`define IOB_CREG_MDATA1_ALIAS      32'h00000700
//`define IOB_CREG_INTVECDISP        32'h00000800
//                                   32'h00000808 // Adr of RESET_GEN    reg.
// Bill Bryg removed the CHIP_RESET reg from the Niagara 1 spec Feb 4 '03.
//`define IOB_CREG_RESETSTAT         32'h00000810 // Adr of RSET_STAT    reg.
//`define IOB_CREG_SERNUM            32'h00000820
//`define IOB_CREG_TMSTATCTRL        32'h00000828
//`define IOB_CREG_COREAVAIL         32'h00000830
//`define IOB_CREG_SSYSRESET         32'h00000838 // Adr of SSYS_RESET   reg.
//`define IOB_CREG_FUSESTAT          32'h00000840
//`define IOB_CREG_MARGIN            32'h00000850
//`define IOB_CREG_MBUSY             32'h00000900
//`define IOB_CREG_JINTV             32'h00000a00
//`define IOB_CREG_MBUSY_ALIAS       32'h00000b00
//`define IOB_CREG_DBG_IOBVIS_CTRL   32'h00001000
//`define IOB_CREG_DBG_L2VIS_CTRL    32'h00001800 
//`define IOB_CREG_DBG_L2VIS_MASKA   32'h00001820 
//`define IOB_CREG_DBG_L2VIS_MASKB   32'h00001828 
//`define IOB_CREG_DBG_L2VIS_CMPA    32'h00001830
//`define IOB_CREG_DBG_L2VIS_CMPB    32'h00001838
//`define IOB_CREG_DBG_L2VIS_TRIG    32'h00001840
//`define IOB_CREG_DBG_ENET_CTRL     32'h00002000
//`define IOB_CREG_DBG_ENET_IDLEVAL  32'h00002008
//`define IOB_CREG_DBG_JBUS_CTRL     32'h00002100
//`define IOB_CREG_DBG_JBUS_LO_MASK0 32'h00002140
//`define IOB_CREG_DBG_JBUS_LO_CMP0  32'h00002148
//`define IOB_CREG_DBG_JBUS_LO_CNT0  32'h00002150
//`define IOB_CREG_DBG_JBUS_LO_MASK1 32'h00002160
//`define IOB_CREG_DBG_JBUS_LO_CMP1  32'h00002168
//`define IOB_CREG_DBG_JBUS_LO_CNT1  32'h00002170
//`define IOB_CREG_DBG_JBUS_HI_MASK0 32'h00002180
//`define IOB_CREG_DBG_JBUS_HI_CMP0  32'h00002188
//`define IOB_CREG_DBG_JBUS_HI_CNT0  32'h00002190
//`define IOB_CREG_DBG_JBUS_HI_MASK1 32'h000021a0
//`define IOB_CREG_DBG_JBUS_HI_CMP1  32'h000021a8
//`define IOB_CREG_DBG_JBUS_HI_CNT1  32'h000021b0
//________________________________________________________________

// Verilog define statements for:
//   rst_ucbbusin4_ctl.sv    and:
//   rst_ucbbusout4_ctl.sv:

`define UCB_BUS_WIDTH     4
`define UCB_BUS_WIDTH_M1  3
`define CYC_NUM          32
`define CYC_NUM_M1       31

`define RST_UCB_DATA_WIDTH 16
// Width of:
//   data_in_io            ;// Convert    from io  to cmp to sys.
//   data_in_sys           ;// Convert    from io  to cmp to sys.
//   data_out_sys2         ;// Convert    from sys to cmp.
//   data_out_cmp2         ;// Convert    from sys to cmp to io.
// The following stay 64 bits wide:
//   data_in               ;// Convert    from io  to cmp to sys.
//   data_out              ;// Converted  from        cmp to io.
// If you modify RST_UCB_DATA_WIDTH, adjust the width of x'b0 in
// the following two concatenations:
//   assign         data_out     [                   63:0] =
//   assign data_out_sys[`RST_UCB_DATA_WIDTH-1:0] =

`define RST_TIME_WIDTH 16
// Width of:
//   lock_time_addr    ? {32'b0, lock_time_q   [31:0] }:// LOCK_TIME
//   prop_time_addr    ? {32'b0, prop_time_q   [31:0] }:// PROP_TIME
//   niu_time_addr     ? {32'b0, niu_time_q    [31:0] }:// NIU_TIME
//   msff_ctl_macro lock_time_ff         (width=32,en=1,clr_=1)
//   msff_ctl_macro lock_count_ff        (width=32,en=0,clr_=1)
//   msff_ctl_macro prop_time_ff         (width=32,en=1,clr_=1)
//   msff_ctl_macro prop_count_ff        (width=32,en=0,clr_=1)
//   msff_ctl_macro niu_time_ff          (width=32,en=1,clr_=1)
//   msff_ctl_macro niu_count_ff         (width=32,en=0,clr_=1)
//   msff_ctl_macro dmu_time_ff          (width=32,en=1,clr_=1)
//   msff_ctl_macro dmu_count_ff         (width=32,en=0,clr_=1)


// `include "dispmonDefines.vh" (Now in :/verif/env/tcu/tcu.flist.)

module rst_fsm_ctl (
  ref_clk, 
  scan_in, 
  rst_fsm_ctl_scanout, 
  rst_aclk, 
  rst_bclk, 
  rst_scan_en, 
  tcu_pce_ov, 
  rst_clk_stop, 
  req_acpted_sys, 
  rd_req_vld_sys, 
  wr_req_vld_sys, 
  addr_in_sys, 
  data_in_sys, 
  thr_id_in_sys, 
  buf_id_in_sys, 
  ack_busy_sys, 
  rd_ack_vld_sys, 
  rd_nack_vld_sys, 
  data_out_sys2, 
  thr_id_out_sys, 
  buf_id_out_sys, 
  mio_rst_pwron_rst_l, 
  mio_rst_button_xir_l, 
  ncu_rst_xir_done_sys, 
  mio_rst_pb_rst_l, 
  ccu_rst_change_cmp, 
  tcu_bisx_done_cmp, 
  tcu_rst_efu_done_cmp, 
  tr_flush_init_ack_cmp, 
  tr_flush_stop_ack_cmp, 
  tr_asicflush_stop_ack_cmp, 
  ncu_rst_fatal_error_cmp, 
  l2t0_rst_fatal_error_cmp, 
  l2t1_rst_fatal_error_cmp, 
  l2t2_rst_fatal_error_cmp, 
  l2t3_rst_fatal_error_cmp, 
  l2t4_rst_fatal_error_cmp, 
  l2t5_rst_fatal_error_cmp, 
  l2t6_rst_fatal_error_cmp, 
  l2t7_rst_fatal_error_cmp, 
  tcu_rst_scan_mode, 
  mio_rst_pb_rst_sys2_, 
  tcu_test_protect_cmp, 
  rst_ccu_pll_, 
  rst_ccu_, 
  rst_l2_por_sys2_, 
  rst_l2_wmr_sys2_, 
  rst_cmp_ctl_wmr_sys2_, 
  rst_wmr_protect, 
  rst_tcu_clk_stop_sys2, 
  rst_mcu_selfrsh_sys2, 
  rst_dmu_peu_por_sys2_, 
  rst_dmu_peu_wmr_sys2_, 
  rt_flush_init_req_sys2, 
  rt_flush_stop_req_sys2, 
  rt_asicflush_stop_req_sys2, 
  rst_niu_mac_sys2_, 
  rst_niu_wmr_sys2_, 
  rst_ncu_unpark_thread_sys2, 
  rst_ncu_xir_sys2_, 
  rst_mio_pex_reset_l, 
  rst_mio_ssi_sync_l, 
  rst_mio_rst_state, 
  cluster_arst_l, 
  rst_dmu_async_por_, 
  rst_rst_pwron_rst_l_sys2_, 
  reset_gen_dbr_gen_q, 
  rst_rst_por_sys2_, 
  rst_rst_wmr_sys2_, 
  mio_rst_pb_rst_sys_)                 ;
wire scan_out;
wire tcu_aclk;
wire tcu_bclk;
wire tcu_scan_en;
wire rd_req_vld_sys2_ff_scanin;
wire rd_req_vld_sys2_ff_scanout;
wire mio_rst_pwron_rst_sys_;
wire l1clk;
wire rd_req_vld_sys2;
wire wr_req_vld_sys2_ff_scanin;
wire wr_req_vld_sys2_ff_scanout;
wire wr_req_vld_sys2;
wire rd_req_vld_sys3_ff_scanin;
wire rd_req_vld_sys3_ff_scanout;
wire rd_req_vld_sys3;
wire wr_req_vld_sys3_ff_scanin;
wire wr_req_vld_sys3_ff_scanout;
wire wr_req_vld_sys3;
wire rd_req_vld_trunc;
wire rst_rst_wmr_sys_;
wire tcu_test_protect_sys;
wire wr_req_vld_trunc;
wire [15:0] data_out_sys;
wire data_out_sys2_ff_scanin;
wire data_out_sys2_ff_scanout;
wire ncu_rst_xir_done_sys2_ff_scanin;
wire ncu_rst_xir_done_sys2_ff_scanout;
wire ncu_rst_xir_done_sys2;
wire rt_flush_init_req_sys2_ff_scanin;
wire rt_flush_init_req_sys2_ff_scanout;
wire rt_flush_stop_req_sys2_ff_scanin;
wire rt_flush_stop_req_sys2_ff_scanout;
wire rt_asicflush_stop_req_sys2_ff_scanin;
wire rt_asicflush_stop_req_sys2_ff_scanout;
wire rst_l2_por_sys2_ff_scanin;
wire rst_l2_por_sys2_ff_scanout;
wire rst_l2_wmr_sys2_ff_scanin;
wire rst_l2_wmr_sys2_ff_scanout;
wire rst_cmp_ctl_wmr_sys2_ff_scanin;
wire rst_cmp_ctl_wmr_sys2_ff_scanout;
wire rst_wmr_protect_sys2_ff_scanin;
wire rst_wmr_protect_sys2_ff_scanout;
wire rst_wmr_protect_sys2;
wire mio_rst_pwron_rst_l_sys_;
wire rst_tcu_clk_stop_sys2_ff_scanin;
wire rst_tcu_clk_stop_sys2_ff_scanout;
wire rst_dmu_async_por_sys_ff_scanin;
wire rst_dmu_async_por_sys_ff_scanout;
wire rst_dmu_async_por_sys_;
wire rst_dmu_peu_por_sys_;
wire rst_dmu_peu_por_sys2_ff_scanin;
wire rst_dmu_peu_por_sys2_ff_scanout;
wire rst_dmu_peu_wmr_sys_;
wire rst_dmu_peu_wmr_sys2_ff_scanin;
wire rst_dmu_peu_wmr_sys2_ff_scanout;
wire rst_niu_mac_sys_;
wire rst_niu_mac_sys2_ff_scanin;
wire rst_niu_mac_sys2_ff_scanout;
wire rst_niu_wmr_sys_;
wire rst_niu_wmr_sys2_ff_scanin;
wire rst_niu_wmr_sys2_ff_scanout;
wire rst_ncu_unpark_thread_sys2_ff_scanin;
wire rst_ncu_unpark_thread_sys2_ff_scanout;
wire rst_ncu_xir_dout;
wire rst_ncu_xir_sys2_ff_scanin;
wire rst_ncu_xir_sys2_ff_scanout;
wire rst_rst_wmr_sys_ff_scanin;
wire rst_rst_wmr_sys_ff_scanout;
wire rst_rst_por_sys_;
wire rst_rst_por_sys_ff_scanin;
wire rst_rst_por_sys_ff_scanout;
wire tcu_rst_efu_done_sys_ff_scanin;
wire tcu_rst_efu_done_sys_ff_scanout;
wire tcu_rst_efu_done_sys;
wire tcu_bisx_done_sys_ff_scanin;
wire tcu_bisx_done_sys_ff_scanout;
wire tcu_bisx_done_sys;
wire ccu_rst_change_sys_ff_scanin;
wire ccu_rst_change_sys_ff_scanout;
wire ccu_rst_change_sys;
wire tcu_test_protect_sys_ff_scanin;
wire tcu_test_protect_sys_ff_scanout;
wire ncu_rst_fatal_error_sys_ff_scanin;
wire ncu_rst_fatal_error_sys_ff_scanout;
wire l2t7_rst_fatal_error_sys_ff_scanin;
wire l2t7_rst_fatal_error_sys_ff_scanout;
wire l2t6_rst_fatal_error_sys_ff_scanin;
wire l2t6_rst_fatal_error_sys_ff_scanout;
wire l2t5_rst_fatal_error_sys_ff_scanin;
wire l2t5_rst_fatal_error_sys_ff_scanout;
wire l2t4_rst_fatal_error_sys_ff_scanin;
wire l2t4_rst_fatal_error_sys_ff_scanout;
wire l2t3_rst_fatal_error_sys_ff_scanin;
wire l2t3_rst_fatal_error_sys_ff_scanout;
wire l2t2_rst_fatal_error_sys_ff_scanin;
wire l2t2_rst_fatal_error_sys_ff_scanout;
wire l2t1_rst_fatal_error_sys_ff_scanin;
wire l2t1_rst_fatal_error_sys_ff_scanout;
wire l2t0_rst_fatal_error_sys_ff_scanin;
wire l2t0_rst_fatal_error_sys_ff_scanout;
wire mio_rst_pwron_rst_sys_ff_scanin;
wire mio_rst_pwron_rst_sys_ff_scanout;
wire cluster_arst_sm2_;
wire rst_rst_pwron_rst_sys2_ff_scanin;
wire rst_rst_pwron_rst_sys2_ff_scanout;
wire rst_rst_pwron_rst_l_sys2_sync_;
wire mio_rst_button_xir_sys_ff_scanin;
wire mio_rst_button_xir_sys_ff_scanout;
wire mio_rst_button_xir_sys_;
wire mio_rst_pb_rst_sys_ff_scanin;
wire mio_rst_pb_rst_sys_ff_scanout;
wire rst_assert_ssi_sync_q;
wire [39:0] addr_in_sys2;
wire [15:0] data_in_sys2;
wire reset_gen_dbr_gen_ff_scanin;
wire reset_gen_dbr_gen_ff_scanout;
wire siclk;
wire soclk;
wire reset_gen_xir_gen_ff_scanin;
wire reset_gen_xir_gen_ff_scanout;
wire reset_gen_xir_gen_q;
wire reset_gen_wmr_gen_ff_scanin;
wire reset_gen_wmr_gen_ff_scanout;
wire reset_gen_wmr_gen_q;
wire [7:0] reset_fee_q;
wire reset_source_l2t7_fatal_ff_scanin;
wire reset_source_l2t7_fatal_ff_scanout;
wire reset_source_l2t7_fatal_q;
wire reset_source_l2t6_fatal_ff_scanin;
wire reset_source_l2t6_fatal_ff_scanout;
wire reset_source_l2t6_fatal_q;
wire reset_source_l2t5_fatal_ff_scanin;
wire reset_source_l2t5_fatal_ff_scanout;
wire reset_source_l2t5_fatal_q;
wire reset_source_l2t4_fatal_ff_scanin;
wire reset_source_l2t4_fatal_ff_scanout;
wire reset_source_l2t4_fatal_q;
wire reset_source_l2t3_fatal_ff_scanin;
wire reset_source_l2t3_fatal_ff_scanout;
wire reset_source_l2t3_fatal_q;
wire reset_source_l2t2_fatal_ff_scanin;
wire reset_source_l2t2_fatal_ff_scanout;
wire reset_source_l2t2_fatal_q;
wire reset_source_l2t1_fatal_ff_scanin;
wire reset_source_l2t1_fatal_ff_scanout;
wire reset_source_l2t1_fatal_q;
wire reset_source_l2t0_fatal_ff_scanin;
wire reset_source_l2t0_fatal_ff_scanout;
wire reset_source_l2t0_fatal_q;
wire reset_source_ncu_fatal_ff_scanin;
wire reset_source_ncu_fatal_ff_scanout;
wire reset_source_ncu_fatal_q;
wire reset_source_pb_xir_ff_scanin;
wire reset_source_pb_xir_ff_scanout;
wire reset_source_pb_xir_q;
wire reset_source_pb_rst_ff_scanin;
wire reset_source_pb_rst_ff_scanout;
wire reset_source_pb_rst_q;
wire reset_source_pwron_ff_scanin;
wire reset_source_pwron_ff_scanout;
wire reset_source_pwron_q_;
wire reset_source_dbr_gen_ff_scanin;
wire reset_source_dbr_gen_ff_scanout;
wire reset_source_dbr_gen_q;
wire reset_source_xir_gen_ff_scanin;
wire reset_source_xir_gen_ff_scanout;
wire reset_source_xir_gen_q;
wire reset_source_wmr_gen_ff_scanin;
wire reset_source_wmr_gen_ff_scanout;
wire reset_source_wmr_gen_q;
wire rst_ccu_pll_sys_ff_scanin;
wire rst_ccu_pll_sys_ff_scanout;
wire rst_ccu_pll_sm2_;
wire rst_ccu_sys_ff_scanin;
wire rst_ccu_sys_ff_scanout;
wire rst_ccu_sm2_;
wire cluster_arst_sys_ff_scanin;
wire cluster_arst_sys_ff_scanout;
wire rst_assert_ssi_sync_ff_scanin;
wire rst_assert_ssi_sync_ff_scanout;
wire ssys_reset_mac_ff_scanin;
wire ssys_reset_mac_ff_scanout;
wire ssys_reset_mac_q;
wire ssys_reset_mcu_q;
wire ssys_reset_mcu_ff_scanin;
wire ssys_reset_mcu_ff_scanout;
wire ssys_reset_dmu_ff_scanin;
wire ssys_reset_dmu_ff_scanout;
wire ssys_reset_dmu_q;
wire ssys_reset_niu_ff_scanin;
wire ssys_reset_niu_ff_scanout;
wire ssys_reset_niu_q;
wire rset_stat_shadow_ff_scanin;
wire rset_stat_shadow_ff_scanout;
wire rset_stat_freq_ff_scanin;
wire rset_stat_freq_ff_scanout;
wire rset_stat_por_din_phy_;
wire rset_stat_por_q;
wire rset_stat_por_ff_scanin;
wire rset_stat_por_ff_scanout;
wire rset_stat_wmr_ff_scanin;
wire rset_stat_wmr_ff_scanout;
wire lock_time_ff_scanin;
wire lock_time_ff_scanout;
wire lock_count_ff_scanin;
wire lock_count_ff_scanout;
wire prop_time_ff_scanin;
wire prop_time_ff_scanout;
wire prop_count_ff_scanin;
wire prop_count_ff_scanout;
wire niu_time_ff_scanin;
wire niu_time_ff_scanout;
wire niu_count_ff_scanin;
wire niu_count_ff_scanout;
wire ccu_time_ff_scanin;
wire ccu_time_ff_scanout;
wire ccu_count_ff_scanin;
wire ccu_count_ff_scanout;
wire reset_fee_ff_scanin;
wire reset_fee_ff_scanout;
wire tr_flush_init_ack_sys;
wire tr_flush_stop_ack_sys;
wire mio_rst_pb_rst_sys3_;
wire tr_asicflush_stop_ack_sys;
wire state_ff_scanin;
wire state_ff_scanout;
wire xir_state_ff_scanin;
wire xir_state_ff_scanout;
wire dmu_state_ff_scanin;
wire dmu_state_ff_scanout;
wire niu_state_ff_scanin;
wire niu_state_ff_scanout;
wire ack_busy_sys2;
wire rd_ack_vld_sys_ff_scanin;
wire rd_ack_vld_sys_ff_scanout;
wire rd_nack_vld_sys_ff_scanin;
wire rd_nack_vld_sys_ff_scanout;
wire req_acpted_orig_sys_ff_scanin;
wire req_acpted_orig_sys_ff_scanout;
wire req_acpted_sys_ff_scanin;
wire req_acpted_sys_ff_scanout;
wire mio_rst_pb_rst_sys3_ff_scanin;
wire mio_rst_pb_rst_sys3_ff_scanout;
wire tr_flush_init_ack_sys_ff_scanin;
wire tr_flush_init_ack_sys_ff_scanout;
wire tr_flush_stop_ack_sys_ff_scanin;
wire tr_flush_stop_ack_sys_ff_scanout;
wire tr_asicflush_stop_ack_sys_ff_scanin;
wire tr_asicflush_stop_ack_sys_ff_scanout;
wire addr_in_sys2_ff_scanin;
wire addr_in_sys2_ff_scanout;
wire data_in_sys2_ff_scanin;
wire data_in_sys2_ff_scanout;
wire thr_id_in_sys2_ff_scanin;
wire thr_id_in_sys2_ff_scanout;
wire [5:0] thr_id_in_sys2;
wire buf_id_in_sys2_ff_scanin;
wire buf_id_in_sys2_ff_scanout;
wire [1:0] buf_id_in_sys2;
wire ack_busy_sys2_ff_scanin;
wire ack_busy_sys2_ff_scanout;
wire thr_id_out_sys_ff_scanin;
wire thr_id_out_sys_ff_scanout;
wire buf_id_out_sys_ff_scanin;
wire buf_id_out_sys_ff_scanout;
wire spares_scanin;
wire spares_scanout;

                                    // Globals
input         ref_clk              ;// Reference clock.
input         scan_in              ;
output        rst_fsm_ctl_scanout  ;// Replace scan_out Mar 2 '05.
input         rst_aclk             ;// Called rst_ here.
input         rst_bclk             ;// to allow assign stmt.
input         rst_scan_en          ;// Assign.
input         tcu_pce_ov           ;// (No assign needed.)
input         rst_clk_stop         ;// Assign.

output        req_acpted_sys       ;// Acceptance of CSR write or read command.

                                    // Commands to RST, the local unit
input         rd_req_vld_sys       ;// 
input         wr_req_vld_sys       ;// 
input  [39:0] addr_in_sys          ;// 
input  [`RST_UCB_DATA_WIDTH-1:0]
              data_in_sys          ;// 
input  [ 5:0] thr_id_in_sys        ;// 
input  [ 1:0] buf_id_in_sys        ;// 
input         ack_busy_sys         ;// 
                                    // Ack-Nack from RST, the local unit
output        rd_ack_vld_sys       ;// 
output        rd_nack_vld_sys      ;// 

output [`RST_UCB_DATA_WIDTH-1:0]
              data_out_sys2        ;// Return data.
output [ 5:0] thr_id_out_sys       ;// 
output [ 1:0] buf_id_out_sys       ;// 

input         mio_rst_pwron_rst_l  ;// PWRON_RST_L
input         mio_rst_button_xir_l ;//
input         ncu_rst_xir_done_sys ;// Active until rst deasserts rst_ncu_xir_.
input         mio_rst_pb_rst_l     ;//
input         ccu_rst_change_cmp   ;//
//put         ccu_rst_sync_stable  ;// Replaced by ccu_count_q.
input         tcu_bisx_done_cmp    ;// Active for one clock.
input         tcu_rst_efu_done_cmp ;// 
input         tr_flush_init_ack_cmp     ;// Request TCU to   assert se.
input         tr_flush_stop_ack_cmp     ;// Request TCU to deassert se.
input         tr_asicflush_stop_ack_cmp ;// Request TCU to deassert se.
input          ncu_rst_fatal_error_cmp;// Added Mar 26 '05.
input         l2t0_rst_fatal_error_cmp;//
input         l2t1_rst_fatal_error_cmp;//
input         l2t2_rst_fatal_error_cmp;//
input         l2t3_rst_fatal_error_cmp;//
input         l2t4_rst_fatal_error_cmp;//
input         l2t5_rst_fatal_error_cmp;//
input         l2t6_rst_fatal_error_cmp;//
input         l2t7_rst_fatal_error_cmp;//
input         tcu_rst_scan_mode    ;// Indicates scan is active.
input         mio_rst_pb_rst_sys2_ ;// To rst_cmp_ctl and back again.
input         tcu_test_protect_cmp ;
                // During mbist, lbist, jtag scan, trans test may want
                // to block tcu, rst and ccu from seeing random activity
                // from ucb (NCU), SPC's, etc.
                // This signal synch'd to ioclk & set via jtag id for blocking

output        rst_ccu_pll_         ;// Reset PLL   in Clock Control Unit.
output        rst_ccu_             ;// Reset logic in Clock Control Unit.
output        rst_l2_por_sys2_     ;// Data Path     Reset.
output        rst_l2_wmr_sys2_     ;// State Machine Reset.
output        rst_cmp_ctl_wmr_sys2_;// State Machine Reset.

output        rst_wmr_protect      ;
output        rst_tcu_clk_stop_sys2;
output        rst_mcu_selfrsh_sys2 ;// MCU_SELFRFSH    bit of RESET_SSYS reg.
output        rst_dmu_peu_por_sys2_;
output        rst_dmu_peu_wmr_sys2_;
output        rt_flush_init_req_sys2;// Request TCU to   assert se.
output        rt_flush_stop_req_sys2;// Request TCU to deassert se.
output        rt_asicflush_stop_req_sys2;
                                    // Request TCU to deassert se.
output        rst_niu_mac_sys2_    ;// Formerly rst_niu_.
output        rst_niu_wmr_sys2_    ;// Formerly rst_niu_.
output        rst_ncu_unpark_thread_sys2;//
output        rst_ncu_xir_sys2_    ;//
output        rst_mio_pex_reset_l  ;// Added Nov 11 '04.
output        rst_mio_ssi_sync_l   ;// Takes the place of rst_mio_fatal_error.
output  [5:0] rst_mio_rst_state    ;// Added Apr 26 '05.
output        cluster_arst_l       ;// Added May 02 '05.
//tput        mio_rst_pwron_rst_l_sys_;// BP 7-28-05 local por clr to cmp_ctl
output        rst_dmu_async_por_   ;// BP 8-05-05 async reset to dmu for por1
output        rst_rst_pwron_rst_l_sys2_;// BP 7-28-05 to rst_cmp_ctl then on
                                        // to tcu, has asyn 
output        reset_gen_dbr_gen_q  ;// To rst_cmp_ctl then on to tcu
output        rst_rst_por_sys2_    ;// 
output        rst_rst_wmr_sys2_    ;// BP 8-19-05.  Was ucb_clr_sys2_.
output        mio_rst_pb_rst_sys_  ;// To rst_cmp_ctl and back again.
//tput        tcu_clk_stop_scan_mode;

//________________________________________________________________

                                    // Local signals
reg           rst_ccu_pll_sm_      ;// Reset PLL   in ccu.
reg           rst_ccu_sm_          ;// Reset logic in ccu.
reg           cluster_arst_sm_     ;// Reset logic in cluster headers.
reg           rst_rst_por_sm_      ;// 
reg           rst_l2_por_sys_      ;// 
reg           rst_l2_wmr_sys_      ;// 
reg           rst_cmp_ctl_wmr_sys_ ;// 
reg           rst_niu_mac_sm_      ;// Driven by state machine.
reg           rst_niu_wmr_sm_      ;// Driven by state machine.
reg           rst_niu_ssys_sm_     ;// 
reg           rst_dmu_async_por_sm_;// 
reg           rst_dmu_peu_por_sm_  ;// 
reg           rst_dmu_peu_wmr_sm_  ;// 
reg           rst_dmu_ssys_sm_     ;// 
reg           rst_wmr_protect_sys  ;// 
reg           rst_tcu_clk_stop_sys ;// 

reg           rst_ncu_unpark_thread_sys;// 
reg           rst_ncu_xir_sys_     ;// 
reg           rt_flush_init_req_sys     ;// Request TCU to   assert se.
reg           rt_flush_stop_req_sys     ;// Request TCU to deassert se.
reg           rt_asicflush_stop_req_sys ;// Request TCU to deassert se.
reg           rst_WMR_done              ;//   Completion of WMR.
reg           rst_DBR_done              ;//   Completion of DBR.
reg           rst_assert_ssi_sync_en    ;
reg           rst_assert_ssi_sync_din   ;
reg           rset_stat_wmr_set         ;// Set WMR bit in RSET_STAT.
reg           reset_source_pb_xir_set   ;// Set   PB_XIR  bit in RESET_SOURCE.
reg           reset_source_xir_gen_set  ;// Set   XIR_GEN bit in RESET_SOURCE.
reg           reset_gen_xir_gen_clr     ;// Clear XIR_GEN bit in RESET_GEN.
reg           reset_source_pb_rst_set   ;// Set    PB_RST bit in RESET_SOURCE.
      
reg     [5:0] rst_mio_rst_state         ;// Added Apr 26 '05.
//________________________________________________________________

// I've attached 2 files with changes that should make RST block
// scannable during ATPG and other scan modes (such as jtag serial
// scan), but not allow rst_fsm_ctl to be flushed during flush reset.
//
// There is one new input, sourced by TCU: "tcu_rst_scan_mode" This
// would look a lot like io_test_mode that we had discussed using,
// but it allows TCU to control it to cover other scan modes.
//
// Also, these changes make both rst_fsm_ctl and rst_ucbflow_ctl
// scannable, this is a good thing. But as I said, rst_fsm_ctl will
// not be flushed ever.
//
// We would need to drive the signal "tcu_rst_scan_mode" to "1"
// during chaintest for it to pass. I verified it passes chaintest
// by tying it high.
//
// One disclaimer, I don't know how these muxes on the scan control
// signals will affect the composition flows, but they may cause
// problems that we'd need to look at as they arise. 

// The following three lines used to be in rst.sv:
//
// rst_fsm_ctl(.scan_out(rst_fsm_ctl_scanout), ...
// assign rst_ucbflow_ctl_scanin    = tcu_rst_scan_mode ? rst_fsm_ctl_scanout
//                                                   : 1'b0 ;
//  moved that logic here, to rst_fsm_ctl.sv, Mar 2 '05.
// .scan_out            output port replaced by:
// .rst_fsm_ctl_scanout output port, which has the
//                      tcu_rst_scan_mode logic already
//                      performed.
// Now, in rst.sv:
// rst_fsm_ctl(.rst_fsm_ctl_scanout(rst_fsm_ctl_scanout), ...
// assign rst_ucbflow_ctl_scanin    =                     rst_fsm_ctl_scanout;

assign   rst_fsm_ctl_scanout
                      = tcu_rst_scan_mode ? scan_out     : 1'b0;
assign   tcu_aclk     = tcu_rst_scan_mode ? rst_aclk     : 1'b0;
assign   tcu_bclk     = tcu_rst_scan_mode ? rst_bclk     : 1'b0;
assign   tcu_scan_en  = tcu_rst_scan_mode ? rst_scan_en  : 1'b0;
//sign   tcu_clk_stop = tcu_rst_scan_mode ? rst_clk_stop : 1'b0;
//sign   tcu_clk_stop_scan_mode = tcu_clk_stop; // See Bug 107214, below:
//________________________________________________________________
//
// Short Description: clock stop goes directly to flop header in rst_fsm_ctl
// Command Line:           sims -sys=fc_mfg_scan -sunv_run -vcs_build
//                         -novera_build -vcs_run -config_cpp_args=-DCORES1
//                         -vcs_run_args=+scanCapture
//                         -vcs_run_args=+chainsel=00000001
// ======================================================================
// Inside the rst unit, the tcu_rst_clk_stop goes to the following mux
// inside rst_fsm_ctl:
//
//   assign   tcu_clk_stop = tcu_rst_scan_mode ? rst_clk_stop : 1'b0;
//
// Because tcu_rst_clk_stop is pipelined with non-scannable flops, it will
// be 'x' during atpg scan capture.  It goes directly to the flop header
// inside rst_fsm_ctl, which breaks scan capture for all of the flops
// inside that macro.
//
// ... according to him the tcu_rst_clk_stop comes from
// a scannable flop in the tcu and was only put in there as a "may be nice
// to have."
// Since the clocks to the rst unit are never stopped during functional
// mode, and since we don't need to stop the clock during atpg mode, the
// equation above can be changed to:
//
//   assign   tcu_clk_stop = tcu_rst_scan_mode ? 1'b0 : 1'b0;
//
// or just tied tcu_clk_stop to 1'b0;
//________________________________________________________________

// ign         tr_flush_init_ack_sys = tr_flush_init_ack_cmp;// (Now a flop.)
// ign         tr_flush_stop_ack_sys = tr_flush_stop_ack_cmp;// (Now a flop.)
//sign         tr_asicflush_stop_ack_sys
//                                   = tr_asicflush_stop_ack_cmp;//(Now a flop.)

// ign        rt_flush_init_req_sys2 = rt_flush_init_req_sys;// (Now a flop.)
// ign        rt_flush_stop_req_sys2 = rt_flush_stop_req_sys;// (Now a flop.)

wire                                   req_acpted_orig_sys  ;// Flop TK.
//sign        req_acpted_sys         = req_acpted_orig_sys  ;// (Now a flop.)
//sign        rd_req_vld             = rd_req_vld_sys       ;// (Now a flop.)
//sign        wr_req_vld             = wr_req_vld_sys       ;// (Now a flop.)

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rd_req_vld_sys2_ff         
    (.din     (rd_req_vld_sys            ),
     .scan_in (rd_req_vld_sys2_ff_scanin ),
     .scan_out(rd_req_vld_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (rd_req_vld_sys2           ),
  .siclk(siclk),
  .soclk(soclk));// Cross from cmp_clk to sys_clk.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 wr_req_vld_sys2_ff         
    (.din     (wr_req_vld_sys            ),
     .scan_in (wr_req_vld_sys2_ff_scanin ),
     .scan_out(wr_req_vld_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (wr_req_vld_sys2           ),
  .siclk(siclk),
  .soclk(soclk));// Cross from cmp_clk to sys_clk.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rd_req_vld_sys3_ff         
    (.din     (rd_req_vld_sys2           ),
     .scan_in (rd_req_vld_sys3_ff_scanin ),
     .scan_out(rd_req_vld_sys3_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (rd_req_vld_sys3           ),
  .siclk(siclk),
  .soclk(soclk));// Delay by one cycle.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 wr_req_vld_sys3_ff         
    (.din     (wr_req_vld_sys2           ),
     .scan_in (wr_req_vld_sys3_ff_scanin ),
     .scan_out(wr_req_vld_sys3_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (wr_req_vld_sys3           ),
  .siclk(siclk),
  .soclk(soclk));// Delay by one cycle.

assign         rd_req_vld_trunc    =  
               rd_req_vld_sys2     &
              ~rd_req_vld_sys3     & // Leading-edge detector.
               rst_rst_wmr_sys_    & // BP 8-22-05
              ~tcu_test_protect_sys; // Suppress on MBist scan.

assign         wr_req_vld_trunc    =
               wr_req_vld_sys2     &
              ~wr_req_vld_sys3     & // Leading-edge detector.
               rst_rst_wmr_sys_    & // BP 8-22-05
              ~tcu_test_protect_sys; // Suppress on MBist scan.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_16 data_out_sys2_ff
                      
    (.din     (data_out_sys [`RST_UCB_DATA_WIDTH-1:0]      ),
     .scan_in (data_out_sys2_ff_scanin ),
     .scan_out(data_out_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_                      ),
     .l1clk   (l1clk                                       ),
     .dout    (data_out_sys2[`RST_UCB_DATA_WIDTH-1:0]      ),
  .siclk(siclk),
  .soclk(soclk));// Cross cmp-sys.
//________________________________________________________________

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 ncu_rst_xir_done_sys2_ff         
    (.din     (ncu_rst_xir_done_sys            ),
     .scan_in (ncu_rst_xir_done_sys2_ff_scanin ),
     .scan_out(ncu_rst_xir_done_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_          ),
     .l1clk   (l1clk                           ),
     .dout    (ncu_rst_xir_done_sys2           ),
  .siclk(siclk),
  .soclk(soclk));// Delay by one cycle.
//________________________________________________________________

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rt_flush_init_req_sys2_ff         
    (.din     (rt_flush_init_req_sys            ),
     .scan_in (rt_flush_init_req_sys2_ff_scanin ),
     .scan_out(rt_flush_init_req_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_           ),
     .l1clk   (l1clk                            ),
     .dout    (rt_flush_init_req_sys2           ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to go fr sys-cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rt_flush_stop_req_sys2_ff         
    (.din     (rt_flush_stop_req_sys            ),
     .scan_in (rt_flush_stop_req_sys2_ff_scanin ),
     .scan_out(rt_flush_stop_req_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_           ),
     .l1clk   (l1clk                            ),
     .dout    (rt_flush_stop_req_sys2           ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to go fr sys-cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rt_asicflush_stop_req_sys2_ff         
    (.din     (rt_asicflush_stop_req_sys            ),
     .scan_in (rt_asicflush_stop_req_sys2_ff_scanin ),
     .scan_out(rt_asicflush_stop_req_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_               ),
     .l1clk   (l1clk                                ),
     .dout    (rt_asicflush_stop_req_sys2           ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to go sys-cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_l2_por_sys2_ff         
    (.din     (rst_l2_por_sys_           ),
     .scan_in (rst_l2_por_sys2_ff_scanin ),
     .scan_out(rst_l2_por_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (rst_l2_por_sys2_          ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross from sys to cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_l2_wmr_sys2_ff         
    (.din     (rst_l2_wmr_sys_           ),
     .scan_in (rst_l2_wmr_sys2_ff_scanin ),
     .scan_out(rst_l2_wmr_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (rst_l2_wmr_sys2_          ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross from sys to cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_cmp_ctl_wmr_sys2_ff         
    (.din     (rst_cmp_ctl_wmr_sys_           ),
     .scan_in (rst_cmp_ctl_wmr_sys2_ff_scanin ),
     .scan_out(rst_cmp_ctl_wmr_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_         ),
     .l1clk   (l1clk                          ),
     .dout    (rst_cmp_ctl_wmr_sys2_          ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross fr sys-cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_wmr_protect_sys2_ff         
    (.din     (rst_wmr_protect_sys            ),
     .scan_in (rst_wmr_protect_sys2_ff_scanin ),
     .scan_out(rst_wmr_protect_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_         ),
     .l1clk   (l1clk                          ),
     .dout    (rst_wmr_protect_sys2           ),
  .siclk(siclk),
  .soclk(soclk));// 

assign rst_wmr_protect = tcu_rst_scan_mode ?
                         1'b0 : // Suppress when chip is being scanned.
                         ~mio_rst_pwron_rst_l_sys_ ? // This is a TCU bug.
                         1'b0 : // Make not x when chip is in POR.
                         rst_wmr_protect_sys2;

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_tcu_clk_stop_sys2_ff         
    (.din     (rst_tcu_clk_stop_sys            ),
     .scan_in (rst_tcu_clk_stop_sys2_ff_scanin ),
     .scan_out(rst_tcu_clk_stop_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_          ),
     .l1clk   (l1clk                           ),
     .dout    (rst_tcu_clk_stop_sys2  ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross from sys to cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_dmu_async_por_sys_ff         
    (.din     (rst_dmu_async_por_sm_           ),
     .scan_in (rst_dmu_async_por_sys_ff_scanin ),
     .scan_out(rst_dmu_async_por_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_          ),
     .l1clk   (l1clk                           ),
     .dout    (rst_dmu_async_por_sys_          ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross sys->cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_dmu_peu_por_sys2_ff         
    (.din     (rst_dmu_peu_por_sys_           ),
     .scan_in (rst_dmu_peu_por_sys2_ff_scanin ),
     .scan_out(rst_dmu_peu_por_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_         ),
     .l1clk   (l1clk                          ),
     .dout    (rst_dmu_peu_por_sys2_ ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross from sys to cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_dmu_peu_wmr_sys2_ff         
    (.din     (rst_dmu_peu_wmr_sys_           ),
     .scan_in (rst_dmu_peu_wmr_sys2_ff_scanin ),
     .scan_out(rst_dmu_peu_wmr_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_         ),
     .l1clk   (l1clk                          ),
     .dout    (rst_dmu_peu_wmr_sys2_ ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross from sys to cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_niu_mac_sys2_ff         
    (.din     (rst_niu_mac_sys_           ),
     .scan_in (rst_niu_mac_sys2_ff_scanin ),
     .scan_out(rst_niu_mac_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_     ),
     .l1clk   (l1clk                      ),
     .dout    (rst_niu_mac_sys2_          ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross fr sys to cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_niu_wmr_sys2_ff         
    (.din     (rst_niu_wmr_sys_           ),
     .scan_in (rst_niu_wmr_sys2_ff_scanin ),
     .scan_out(rst_niu_wmr_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_     ),
     .l1clk   (l1clk                      ),
     .dout    (rst_niu_wmr_sys2_          ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross fr sys to cmp.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_ncu_unpark_thread_sys2_ff         
    (.din     (rst_ncu_unpark_thread_sys            ),
     .scan_in (rst_ncu_unpark_thread_sys2_ff_scanin ),
     .scan_out(rst_ncu_unpark_thread_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_               ),
     .l1clk   (l1clk                                ),
     .dout    (rst_ncu_unpark_thread_sys2  ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross fr sys to cmp.

wire           rst_ncu_xir_din   = ~rst_ncu_xir_sys_;
assign         rst_ncu_xir_sys2_ = ~rst_ncu_xir_dout;
                                              // Store as active low, so
                                              // resets to deasserted value.
rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_ncu_xir_sys2_ff         
    (.din     (rst_ncu_xir_din            ),
     .scan_in (rst_ncu_xir_sys2_ff_scanin ),
     .scan_out(rst_ncu_xir_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_     ),
     .l1clk   (l1clk                      ),
     .dout    (rst_ncu_xir_dout           ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross fr sys to cmp.

//BP 9-27-05
rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_rst_wmr_sys_ff         
    (.din     (rst_rst_wmr_sys_          ),
     .scan_in (rst_rst_wmr_sys_ff_scanin ),
     .scan_out(rst_rst_wmr_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (rst_rst_wmr_sys2_         ),
  .siclk(siclk),
  .soclk(soclk));//  sys to cmp

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_rst_por_sys_ff         
    (.din     (rst_rst_por_sys_          ),
     .scan_in (rst_rst_por_sys_ff_scanin ),
     .scan_out(rst_rst_por_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (rst_rst_por_sys2_         ),
  .siclk(siclk),
  .soclk(soclk));//  sys to cmp
//________________________________________________________________

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 tcu_rst_efu_done_sys_ff         
    (.din     (tcu_rst_efu_done_cmp           ),
     .scan_in (tcu_rst_efu_done_sys_ff_scanin ),
     .scan_out(tcu_rst_efu_done_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_         ),
     .l1clk   (l1clk                          ),
     .dout    (tcu_rst_efu_done_sys           ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 tcu_bisx_done_sys_ff         
    (.din     (tcu_bisx_done_cmp           ),
     .scan_in (tcu_bisx_done_sys_ff_scanin ),
     .scan_out(tcu_bisx_done_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_      ),
     .l1clk   (l1clk                       ),
     .dout    (tcu_bisx_done_sys           ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 ccu_rst_change_sys_ff         
    (.din     (ccu_rst_change_cmp           ),
     .scan_in (ccu_rst_change_sys_ff_scanin ),
     .scan_out(ccu_rst_change_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_       ),
     .l1clk   (l1clk                        ),
     .dout    (ccu_rst_change_sys           ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 tcu_test_protect_sys_ff         
    (.din     (tcu_test_protect_cmp           ),
     .scan_in (tcu_test_protect_sys_ff_scanin ),
     .scan_out(tcu_test_protect_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_         ),
     .l1clk   (l1clk                          ),
     .dout    (tcu_test_protect_sys           ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

wire           ncu_rst_fatal_error_sys_mbist;// Suppress during MBist scan.
wire          l2t7_rst_fatal_error_sys_mbist;// Suppress during MBist scan.
wire          l2t6_rst_fatal_error_sys_mbist;// Suppress during MBist scan.
wire          l2t5_rst_fatal_error_sys_mbist;// Suppress during MBist scan.
wire          l2t4_rst_fatal_error_sys_mbist;// Suppress during MBist scan.
wire          l2t3_rst_fatal_error_sys_mbist;// Suppress during MBist scan.
wire          l2t2_rst_fatal_error_sys_mbist;// Suppress during MBist scan.
wire          l2t1_rst_fatal_error_sys_mbist;// Suppress during MBist scan.
wire          l2t0_rst_fatal_error_sys_mbist;// Suppress during MBist scan.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 ncu_rst_fatal_error_sys_ff         
    (.din     (ncu_rst_fatal_error_cmp           ),
     .scan_in (ncu_rst_fatal_error_sys_ff_scanin ),
     .scan_out(ncu_rst_fatal_error_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_            ),
     .l1clk   (l1clk                             ),
     .dout    (ncu_rst_fatal_error_sys_mbist     ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 l2t7_rst_fatal_error_sys_ff        
    (.din     (l2t7_rst_fatal_error_cmp           ),
     .scan_in (l2t7_rst_fatal_error_sys_ff_scanin ),
     .scan_out(l2t7_rst_fatal_error_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (l2t7_rst_fatal_error_sys_mbist    ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 l2t6_rst_fatal_error_sys_ff        
    (.din     (l2t6_rst_fatal_error_cmp           ),
     .scan_in (l2t6_rst_fatal_error_sys_ff_scanin ),
     .scan_out(l2t6_rst_fatal_error_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (l2t6_rst_fatal_error_sys_mbist    ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 l2t5_rst_fatal_error_sys_ff        
    (.din     (l2t5_rst_fatal_error_cmp           ),
     .scan_in (l2t5_rst_fatal_error_sys_ff_scanin ),
     .scan_out(l2t5_rst_fatal_error_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (l2t5_rst_fatal_error_sys_mbist    ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 l2t4_rst_fatal_error_sys_ff        
    (.din     (l2t4_rst_fatal_error_cmp           ),
     .scan_in (l2t4_rst_fatal_error_sys_ff_scanin ),
     .scan_out(l2t4_rst_fatal_error_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (l2t4_rst_fatal_error_sys_mbist    ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 l2t3_rst_fatal_error_sys_ff        
    (.din     (l2t3_rst_fatal_error_cmp           ),
     .scan_in (l2t3_rst_fatal_error_sys_ff_scanin ),
     .scan_out(l2t3_rst_fatal_error_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (l2t3_rst_fatal_error_sys_mbist    ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 l2t2_rst_fatal_error_sys_ff        
    (.din     (l2t2_rst_fatal_error_cmp           ),
     .scan_in (l2t2_rst_fatal_error_sys_ff_scanin ),
     .scan_out(l2t2_rst_fatal_error_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (l2t2_rst_fatal_error_sys_mbist    ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 l2t1_rst_fatal_error_sys_ff        
    (.din     (l2t1_rst_fatal_error_cmp           ),
     .scan_in (l2t1_rst_fatal_error_sys_ff_scanin ),
     .scan_out(l2t1_rst_fatal_error_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (l2t1_rst_fatal_error_sys_mbist    ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 l2t0_rst_fatal_error_sys_ff        
    (.din     (l2t0_rst_fatal_error_cmp           ),
     .scan_in (l2t0_rst_fatal_error_sys_ff_scanin ),
     .scan_out(l2t0_rst_fatal_error_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (l2t0_rst_fatal_error_sys_mbist    ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr cmp to sys.

wire           ncu_rst_fatal_error_sys       = 
               ncu_rst_fatal_error_sys_mbist &
               ~tcu_test_protect_sys          ;// Suppress during MBist scan.

wire           l2t7_rst_fatal_error_sys      = 
               l2t7_rst_fatal_error_sys_mbist&
               ~tcu_test_protect_sys          ;// Suppress during MBist scan.

wire           l2t6_rst_fatal_error_sys      = 
               l2t6_rst_fatal_error_sys_mbist&
               ~tcu_test_protect_sys          ;// Suppress during MBist scan.

wire           l2t5_rst_fatal_error_sys      = 
               l2t5_rst_fatal_error_sys_mbist&
               ~tcu_test_protect_sys          ;// Suppress during MBist scan.

wire           l2t4_rst_fatal_error_sys      = 
               l2t4_rst_fatal_error_sys_mbist&
               ~tcu_test_protect_sys          ;// Suppress during MBist scan.

wire           l2t3_rst_fatal_error_sys      = 
               l2t3_rst_fatal_error_sys_mbist&
               ~tcu_test_protect_sys          ;// Suppress during MBist scan.

wire           l2t2_rst_fatal_error_sys      = 
               l2t2_rst_fatal_error_sys_mbist&
               ~tcu_test_protect_sys          ;// Suppress during MBist scan.

wire           l2t1_rst_fatal_error_sys      = 
               l2t1_rst_fatal_error_sys_mbist&
               ~tcu_test_protect_sys          ;// Suppress during MBist scan.

wire           l2t0_rst_fatal_error_sys      = 
               l2t0_rst_fatal_error_sys_mbist&
               ~tcu_test_protect_sys          ;// Suppress during MBist scan.
//________________________________________________________________
//
//              mio_rst_pwron_rst_l from Pins
//________________________________________________________________
//
// Incoming from MIO, asynchronous

cl_sc1_clksyncff_4x
               mio_rst_pwron_rst_sys_ff
    (.si      (mio_rst_pwron_rst_sys_ff_scanin ), // Don't forget to re-link 3
                                                  // into chain of assigns
     .so      (mio_rst_pwron_rst_sys_ff_scanout), // when rerunning fixscan.
     .l1clk   (l1clk                           ),
     .d       (mio_rst_pwron_rst_l             ),
     .q       (mio_rst_pwron_rst_sys_          ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr async to sys.

assign         mio_rst_pwron_rst_l_sys_  =
               mio_rst_pwron_rst_l       &  // Async assert, sync deassert.
               mio_rst_pwron_rst_sys_    ;

wire           rst_rst_pwron_rst_l_sys_  ;
assign         rst_rst_pwron_rst_l_sys_  =  // Was ccu_rdy_pwron_rst_sys_.
        ~( ( (~mio_rst_pwron_rst_l_sys_) |  // Async assert, sync deassert.
           //(~ccu_rst_sync_stable       &  // 
           //(~cluster_arst_l            &  // Assert through iol2clk running.
           //(~rst_l2_por_sys_           &  // Assert through iol2clk running.
             (~rst_rst_por_sm_           &  // Assert through iol2clk running.
           //(~rst_rst_por_sys_          &  // Review Nov 23 '05.
              ~rst_wmr_protect_sys       ) )// Only assert when it is
         );                                 // not a WMR.  (POR1 only.)

assign         rst_dmu_async_por_        =  // Was rst_rst_pwron_rst_l_sys_
        ~( ( (~mio_rst_pwron_rst_l_sys_) |  // Async assert, sync deassert.
           //(~ccu_rst_sync_stable       &  // 
           //(~cluster_arst_l            &  // Assert through iol2clk running.
           //(~rst_l2_por_sys_           &  // Assert through iol2clk running.
           //(~rst_rst_por_sm_           &  // Assert through iol2clk running.
             (~rst_dmu_async_por_sys_    ) )// Assert through POR1.
         );

assign         rst_rst_wmr_sys_          =
               cluster_arst_sm2_         &  // Was: ccu_rst_sync_stable, but
                                            // ccu_count_q replaced it.
               rst_l2_wmr_sys_           &
               mio_rst_pwron_rst_sys_    ;  // BP 8-05-05 to DMU for SERDES rst

assign         rst_rst_por_sys_          =
               rst_l2_por_sys_           &
               mio_rst_pwron_rst_sys_    ;  // BP 8-05-05 to DMU for SERDES rst

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_rst_pwron_rst_sys2_ff         
    (.din     (rst_rst_pwron_rst_l_sys_         ),
     .scan_in (rst_rst_pwron_rst_sys2_ff_scanin ),
     .scan_out(rst_rst_pwron_rst_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_           ),
     .l1clk   (l1clk                            ),
     .dout    (rst_rst_pwron_rst_l_sys2_sync_    ),
  .siclk(siclk),
  .soclk(soclk));// Prepare to cross sys-cmp.

wire           rst_rst_pwron_rst_l_sys2_      ;
assign         rst_rst_pwron_rst_l_sys2_      = // 
//BP 2-21-06               rst_rst_pwron_rst_l_sys_       & // Async   assert,
               mio_rst_pwron_rst_l       & // Async   assert,
               rst_rst_pwron_rst_l_sys2_sync_ ; //  sync deassert.
//________________________________________________________________
//
//              mio_rst_button_xir_l from Pins
//________________________________________________________________
//
// Incoming from MIO, asynchronous

cl_sc1_clksyncff_4x
               mio_rst_button_xir_sys_ff
    (.si      (mio_rst_button_xir_sys_ff_scanin ), // Don't forget to re-link 3
                                                   // into chain of assigns
     .so      (mio_rst_button_xir_sys_ff_scanout), // when rerunning fixscan.
     .l1clk   (l1clk                            ),
     .d       (mio_rst_button_xir_l             ),
     .q       (mio_rst_button_xir_sys_          ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr async to sys.
//________________________________________________________________

//
//              mio_rst_pb_rst_l from Pins
//________________________________________________________________
//
// Incoming from MIO, asynchronous

cl_sc1_clksyncff_4x
               mio_rst_pb_rst_sys_ff
    (.si      (mio_rst_pb_rst_sys_ff_scanin ), // Don't forget to re-link 3
                                               // into chain of assign stmts
     .so      (mio_rst_pb_rst_sys_ff_scanout), // when rerunning fixscan.
     .l1clk   (l1clk                        ),
     .d       (mio_rst_pb_rst_l             ),
     .q       (mio_rst_pb_rst_sys_          ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr async to sys.
//________________________________________________________________

assign         rst_mio_pex_reset_l = ~( //  rst_pwron_sys_ better? Sep 16 '05.
                                      (~mio_rst_pwron_rst_l      ) | // Review.
                                      (~rst_dmu_peu_wmr_sys2_    )
                                      );

assign         rst_mio_ssi_sync_l  = ~rst_assert_ssi_sync_q;

//________________________________________________________________
//
//              RESET_GEN register, RW
//________________________________________________________________

wire           reset_gen_addr        = addr_in_sys2 == `IOB_CREG_RESET_GEN;
wire           reset_gen_en          = wr_req_vld_trunc & reset_gen_addr;
//________________________________________________________________

wire           reset_gen_dbr_gen_en  = reset_gen_en | rst_DBR_done;
wire           reset_gen_dbr_gen_din = reset_gen_en & data_in_sys2[3] ; // |
                                    // rst_DBR_done & 1'b0 (== 0)
                                    // If  DBR done, clear DBR_GEN bit.
rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_gen_dbr_gen_ff        
    (.din     (reset_gen_dbr_gen_din       ),
     .scan_in (reset_gen_dbr_gen_ff_scanin ),
     .scan_out(reset_gen_dbr_gen_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_      ),
     .l1clk   (l1clk                       ),
     .en      (reset_gen_dbr_gen_en        ),
     .dout    (reset_gen_dbr_gen_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

// Error: Cell 'rst_ctl': Net 'siclk' (implicitly created from
//        connection to inst 'reset_gen_xir_gen_ff') has no driver.
// Error: Cell 'rst_ctl': Net 'soclk' (implicitly created from
//        connection to inst 'reset_gen_xir_gen_ff') has no driver.

assign siclk = tcu_aclk; // When say wire instead of assign, siclk = z.
                         // Described to Anurag Bhatnagar Feb 23 '05.
assign soclk = tcu_bclk;
// scan renames
//sign se = tcu_scan_en;// rst.sv2sim.log: Warning: In module <rst_fsm_ctl>
                        // the net <se> has source but no sink.
// end scan
//________________________________________________________________

wire           reset_gen_xir_gen_en  = reset_gen_en    |  reset_gen_xir_gen_clr;
wire           reset_gen_xir_gen_din = data_in_sys2[1] & ~reset_gen_xir_gen_clr;
                                       // If xir_done, clear xir_gen bit.
				       // To avoid collision, software should
				       // wait until Reset Unit clears prior
				       // XIR_GEN before writing to it again.
rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_gen_xir_gen_ff        
    (.din     (reset_gen_xir_gen_din       ),
     .scan_in (reset_gen_xir_gen_ff_scanin ),
     .scan_out(reset_gen_xir_gen_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_      ),
     .l1clk   (l1clk                       ),
     .en      (reset_gen_xir_gen_en        ),
     .dout    (reset_gen_xir_gen_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_gen_wmr_gen_en  = reset_gen_en | rst_WMR_done;
wire           reset_gen_wmr_gen_din = reset_gen_en & data_in_sys2[0]; // |
                                    // rst_WMR_done & 1'b0 (== 0)
                                    // If  WMR done, clear WMR_GEN bit.
rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_gen_wmr_gen_ff        
    (.din     (reset_gen_wmr_gen_din       ),
     .scan_in (reset_gen_wmr_gen_ff_scanin ),
     .scan_out(reset_gen_wmr_gen_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_      ),
     .l1clk   (l1clk                       ),
     .en      (reset_gen_wmr_gen_en        ),
     .dout    (reset_gen_wmr_gen_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire [3:0] reset_gen_q  = {reset_gen_dbr_gen_q,
                           1'b0, // Reserved.  (Was reset_gen_por_gen_q.)
                           reset_gen_xir_gen_q,
                           reset_gen_wmr_gen_q};


//________________________________________________________________
//
//              RESET_SOURCE register, RW1C
//________________________________________________________________

wire reset_source_addr = addr_in_sys2 == `IOB_CREG_RESET_SOURCE;
wire reset_source_en   = wr_req_vld_trunc & reset_source_addr &
                         rst_cmp_ctl_wmr_sys_                 ;
                         // Wait for cmp_clk to start to reset:
                         // l2t7_fatal_error_sys and:
                         //  ncu_fatal_error_sys.

// Each bit in Reset Source register is RW1C, meaning:
// Read, Write 1 to Clear:  Writing a 0 to a bit has no effect,
// but writing a 1 to a bit will cause that bit to be set to 0.
// No need to feed data_in_sys2 to _din port of msff, because we know
// data_in_sys2 must be 1 for _en port to be high. (W1C)
//________________________________________________________________

wire           reset_source_l2t7_fatal_en  = reset_source_en & data_in_sys2[15] |
                            l2t7_rst_fatal_error_sys & reset_fee_q[7];
wire           reset_source_l2t7_fatal_din = // ~data_in_sys2[15] | // W1C.
                            l2t7_rst_fatal_error_sys & reset_fee_q[7];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_l2t7_fatal_ff 
    (.din     (reset_source_l2t7_fatal_din),
     .scan_in (reset_source_l2t7_fatal_ff_scanin ),
     .scan_out(reset_source_l2t7_fatal_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk                 ),
     .en      (reset_source_l2t7_fatal_en ),
     .dout    (reset_source_l2t7_fatal_q  ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_l2t6_fatal_en  = reset_source_en & data_in_sys2[14] |
                            l2t6_rst_fatal_error_sys & reset_fee_q[6];
wire           reset_source_l2t6_fatal_din = // ~data_in_sys2[14] | // W1C.
                            l2t6_rst_fatal_error_sys & reset_fee_q[6];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_l2t6_fatal_ff        
    (.din     (reset_source_l2t6_fatal_din       ),
     .scan_in (reset_source_l2t6_fatal_ff_scanin ),
     .scan_out(reset_source_l2t6_fatal_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_            ),
     .l1clk   (l1clk                             ),
     .en      (reset_source_l2t6_fatal_en        ),
     .dout    (reset_source_l2t6_fatal_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_l2t5_fatal_en  = reset_source_en & data_in_sys2[13] |
                            l2t5_rst_fatal_error_sys & reset_fee_q[5];
wire           reset_source_l2t5_fatal_din = // ~data_in_sys2[13] | // W1C.
                            l2t5_rst_fatal_error_sys & reset_fee_q[5];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_l2t5_fatal_ff        
    (.din     (reset_source_l2t5_fatal_din       ),
     .scan_in (reset_source_l2t5_fatal_ff_scanin ),
     .scan_out(reset_source_l2t5_fatal_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_            ),
     .l1clk   (l1clk                             ),
     .en      (reset_source_l2t5_fatal_en        ),
     .dout    (reset_source_l2t5_fatal_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_l2t4_fatal_en  = reset_source_en & data_in_sys2[12] |
                            l2t4_rst_fatal_error_sys & reset_fee_q[4];
wire           reset_source_l2t4_fatal_din = // ~data_in_sys2[12] | // W1C.
                            l2t4_rst_fatal_error_sys & reset_fee_q[4];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_l2t4_fatal_ff        
    (.din     (reset_source_l2t4_fatal_din       ),
     .scan_in (reset_source_l2t4_fatal_ff_scanin ),
     .scan_out(reset_source_l2t4_fatal_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_            ),
     .l1clk   (l1clk                             ),
     .en      (reset_source_l2t4_fatal_en        ),
     .dout    (reset_source_l2t4_fatal_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_l2t3_fatal_en  = reset_source_en & data_in_sys2[11] |
                            l2t3_rst_fatal_error_sys & reset_fee_q[3];
wire           reset_source_l2t3_fatal_din = // ~data_in_sys2[11] | // W1C.
                            l2t3_rst_fatal_error_sys & reset_fee_q[3];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_l2t3_fatal_ff        
    (.din     (reset_source_l2t3_fatal_din       ),
     .scan_in (reset_source_l2t3_fatal_ff_scanin ),
     .scan_out(reset_source_l2t3_fatal_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_            ),
     .l1clk   (l1clk                             ),
     .en      (reset_source_l2t3_fatal_en        ),
     .dout    (reset_source_l2t3_fatal_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_l2t2_fatal_en  = reset_source_en & data_in_sys2[10] |
                            l2t2_rst_fatal_error_sys & reset_fee_q[2];
wire           reset_source_l2t2_fatal_din = // ~data_in_sys2[10] | // W1C.
                            l2t2_rst_fatal_error_sys & reset_fee_q[2];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_l2t2_fatal_ff         
    (.din     (reset_source_l2t2_fatal_din       ),
     .scan_in (reset_source_l2t2_fatal_ff_scanin ),
     .scan_out(reset_source_l2t2_fatal_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_            ),
     .l1clk   (l1clk                             ),
     .en      (reset_source_l2t2_fatal_en        ),
     .dout    (reset_source_l2t2_fatal_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_l2t1_fatal_en  = reset_source_en & data_in_sys2[9] |
                            l2t1_rst_fatal_error_sys & reset_fee_q[1];
wire           reset_source_l2t1_fatal_din = // ~data_in_sys2[9] | // W1C.
                            l2t1_rst_fatal_error_sys & reset_fee_q[1];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_l2t1_fatal_ff         
    (.din     (reset_source_l2t1_fatal_din       ),
     .scan_in (reset_source_l2t1_fatal_ff_scanin ),
     .scan_out(reset_source_l2t1_fatal_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_            ),
     .l1clk   (l1clk                             ),
     .en      (reset_source_l2t1_fatal_en        ),
     .dout    (reset_source_l2t1_fatal_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_l2t0_fatal_en  = reset_source_en & data_in_sys2[8] |
                            l2t0_rst_fatal_error_sys & reset_fee_q[0];
wire           reset_source_l2t0_fatal_din = // ~data_in_sys2[8] | // W1C.
                            l2t0_rst_fatal_error_sys & reset_fee_q[0];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_l2t0_fatal_ff         
    (.din     (reset_source_l2t0_fatal_din       ),
     .scan_in (reset_source_l2t0_fatal_ff_scanin ),
     .scan_out(reset_source_l2t0_fatal_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_            ),
     .l1clk   (l1clk                             ),
     .en      (reset_source_l2t0_fatal_en        ),
     .dout    (reset_source_l2t0_fatal_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_ncu_fatal_en  = reset_source_en & data_in_sys2[7] |
                              (ncu_rst_fatal_error_sys & rst_cmp_ctl_wmr_sys_) ;
                            // ncu_rst_fatal_error_sys = x until
                            //                           rst_cmp_ctl_wmr_sys_
                            //                    (after ccu_rst_sync_stable).
                            // ncu will keep ncu_rst_fatal_error_sys around
                            // until it has had a chance to be seen, via the
                            // rst_fatal_or signal, in RST_ARBITER state.  Then,
                            // WMR will reset the WMR-exposed register FEE in
                            // ncu.
wire           reset_source_ncu_fatal_din =
                            (reset_source_en & ~data_in_sys2[7]) | // W1C.
                         // (ncu_rst_fatal_error_sys & ccu_rst_sync_stable);
                            (ncu_rst_fatal_error_sys & cluster_arst_sm2_  );
                         //  ncu_rst_fatal_error_sys = x until sync_stable.
                                            // Was:    ccu_rst_sync_stable, 
                                            // but ccu_count_q replaced it.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_ncu_fatal_ff         
    (.din     (reset_source_ncu_fatal_din       ),
     .scan_in (reset_source_ncu_fatal_ff_scanin ),
     .scan_out(reset_source_ncu_fatal_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_           ),
     .l1clk   (l1clk                            ),
     .en      (reset_source_ncu_fatal_en        ),
     .dout    (reset_source_ncu_fatal_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_pb_xir_en  = reset_source_en & data_in_sys2[6] |
                                         reset_source_pb_xir_set;
wire           reset_source_pb_xir_din = // ~data_in_sys2[6]      | // W1C.
                                         reset_source_pb_xir_set;
rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_pb_xir_ff         
    (.din     (reset_source_pb_xir_din       ),
     .scan_in (reset_source_pb_xir_ff_scanin ),
     .scan_out(reset_source_pb_xir_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_        ),
     .l1clk   (l1clk                         ),
     .en      (reset_source_pb_xir_en        ),
     .dout    (reset_source_pb_xir_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_pb_rst_en   = reset_source_en & data_in_sys2[5] |
                                          reset_source_pb_rst_set;
wire           reset_source_pb_rst_din  = // ~data_in_sys2[5]      | // W1C.
                                          reset_source_pb_rst_set;
rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_pb_rst_ff         
    (.din     (reset_source_pb_rst_din       ),
     .scan_in (reset_source_pb_rst_ff_scanin ),
     .scan_out(reset_source_pb_rst_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_        ),
     .l1clk   (l1clk                         ),
     .en      (reset_source_pb_rst_en        ),
     .dout    (reset_source_pb_rst_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_pwron_en      = reset_source_en &  data_in_sys2[4] |
                                          reset_gen_en    &  data_in_sys2[4];
                                       // SW setting POR_GEN bit of
                                       // RESET_GEN reg.
wire           reset_source_pwron_din     = 1'b0;
                                       // = reset_source_en & ~data_in_sys2[4];
                                       // W1C, so
                                       // writing a 1 will cause this bit to be
                                       // set to 0.
wire           reset_source_pwron_din_phy_ =
              ~reset_source_pwron_din; // Initial value 1 on POR, so
                                       // reset_source_pwron_q_ holds inverse.
rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_pwron_ff         
    (.din     (reset_source_pwron_din_phy_  ),
     .scan_in (reset_source_pwron_ff_scanin ),
     .scan_out(reset_source_pwron_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_       ),
     .l1clk   (l1clk                        ),
     .en      (reset_source_pwron_en        ),
     .dout    (reset_source_pwron_q_        ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_dbr_gen_en  = reset_source_en & data_in_sys2[3] | 
                                          reset_gen_en    & data_in_sys2[3];
                                       // SW setting DBR_GEN bit of
                                       // RESET_GEN reg.
wire           reset_source_dbr_gen_din = reset_source_en & ~data_in_sys2[3] |//W1C.
                                          reset_gen_en    &  data_in_sys2[3];
                                       // SW setting DBR_GEN bit of
                                       // RESET_GEN reg.
rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_dbr_gen_ff         
    (.din     (reset_source_dbr_gen_din       ),
     .scan_in (reset_source_dbr_gen_ff_scanin ),
     .scan_out(reset_source_dbr_gen_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_         ),
     .l1clk   (l1clk                          ),
     .en      (reset_source_dbr_gen_en        ),
     .dout    (reset_source_dbr_gen_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

                                       // RESET_SOURCE[2] reserved.
                                       // Was SW setting POR_GEN bit of
                                       // RESET_GEN reg.
//________________________________________________________________

wire           reset_source_xir_gen_en  = reset_source_en & data_in_sys2[1] | 
                                          reset_source_xir_gen_set;
                                       // xir_state machine servicing
                                       // SW setting XIR_GEN bit of
                                       // RESET_GEN reg.
wire           reset_source_xir_gen_din = ~data_in_sys2[1]      | // W1C.
                                          reset_source_xir_gen_set;
rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_xir_gen_ff         
    (.din     (reset_source_xir_gen_din       ),
     .scan_in (reset_source_xir_gen_ff_scanin ),
     .scan_out(reset_source_xir_gen_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_         ),
     .l1clk   (l1clk                          ),
     .en      (reset_source_xir_gen_en        ),
     .dout    (reset_source_xir_gen_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           reset_source_wmr_gen_en  = reset_source_en & data_in_sys2[0] | 
                                          reset_gen_en    & data_in_sys2[0];
                                       // SW setting WMR_GEN bit of
                                       // RESET_GEN reg.
wire           reset_source_wmr_gen_din = ~data_in_sys2[0]      | // W1C
                                          reset_gen_en & data_in_sys2[0];
                                       // SW setting WMR_GEN bit of
                                       // RESET_GEN reg.
rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 reset_source_wmr_gen_ff         
    (.din     (reset_source_wmr_gen_din       ),
     .scan_in (reset_source_wmr_gen_ff_scanin ),
     .scan_out(reset_source_wmr_gen_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_         ),
     .l1clk   (l1clk                          ),
     .en      (reset_source_wmr_gen_en        ),
     .dout    (reset_source_wmr_gen_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________
//
// BP 9-26-05 for bug 101377:  Added flop to sm output so no
//	combination logic between here and ccu where it
//	uses rst_ccu_pll_ and rst_ccu_ as async flop resets.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_ccu_pll_sys_ff         
    (.din     (rst_ccu_pll_sm_           ),
     .scan_in (rst_ccu_pll_sys_ff_scanin ),
     .scan_out(rst_ccu_pll_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (rst_ccu_pll_sm2_          ),
  .siclk(siclk),
  .soclk(soclk));// gen rst_ccu_pll_

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_ccu_sys_ff         
    (.din     (rst_ccu_sm_           ),
     .scan_in (rst_ccu_sys_ff_scanin ),
     .scan_out(rst_ccu_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk                 ),
     .dout    (rst_ccu_sm2_          ),
  .siclk(siclk),
  .soclk(soclk));// gen_ccu_

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 cluster_arst_sys_ff         
    (.din     (cluster_arst_sm_           ),
     .scan_in (cluster_arst_sys_ff_scanin ),
     .scan_out(cluster_arst_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_     ),
     .l1clk   (l1clk                      ),
     .dout    (cluster_arst_sm2_          ),
  .siclk(siclk),
  .soclk(soclk));// 
//________________________________________________________________

wire rst_fatal_or                           =
        ((l2t7_rst_fatal_error_sys == 1'b1) & (reset_fee_q[7] == 1'b1)) |
        ((l2t6_rst_fatal_error_sys == 1'b1) & (reset_fee_q[6] == 1'b1)) |
        ((l2t5_rst_fatal_error_sys == 1'b1) & (reset_fee_q[5] == 1'b1)) |
        ((l2t4_rst_fatal_error_sys == 1'b1) & (reset_fee_q[4] == 1'b1)) |
        ((l2t3_rst_fatal_error_sys == 1'b1) & (reset_fee_q[3] == 1'b1)) |
        ((l2t2_rst_fatal_error_sys == 1'b1) & (reset_fee_q[2] == 1'b1)) |
        ((l2t1_rst_fatal_error_sys == 1'b1) & (reset_fee_q[1] == 1'b1)) |
        ((l2t0_rst_fatal_error_sys == 1'b1) & (reset_fee_q[0] == 1'b1)) |
        (  ncu_rst_fatal_error_sys == 1'b1                            ) ;
//________________________________________________________________

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_assert_ssi_sync_ff         
    (.din     (rst_assert_ssi_sync_din       ),
     .scan_in (rst_assert_ssi_sync_ff_scanin ),
     .scan_out(rst_assert_ssi_sync_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_        ),
     .l1clk   (l1clk                         ),
     .en      (rst_assert_ssi_sync_en        ),
     .dout    (rst_assert_ssi_sync_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire [15:0] reset_source_q        =
        {reset_source_l2t7_fatal_q, // [15]
         reset_source_l2t6_fatal_q, // [14]
         reset_source_l2t5_fatal_q, // [13]
         reset_source_l2t4_fatal_q, // [12]
         reset_source_l2t3_fatal_q, // [11]
         reset_source_l2t2_fatal_q, // [10]
         reset_source_l2t1_fatal_q, //  [9]
         reset_source_l2t0_fatal_q, //  [8]
         reset_source_ncu_fatal_q , //  [7]
         reset_source_pb_xir_q    , //  [6]
         reset_source_pb_rst_q    , //  [5]
        ~reset_source_pwron_q_    , //  [4] Holds inverse.
         reset_source_dbr_gen_q   , //  [3]
         1'b0                     , //  [2] Reserved
       //reset_source_por_gen_q   , //  [2] // Was.
         reset_source_xir_gen_q   , //  [1]
         reset_source_wmr_gen_q   };//  [0]

wire   rst_ccu_pll_raw_    =
  ~(
    (~mio_rst_pwron_rst_l) | // Async assert, sync deassert.
    (~rst_ccu_pll_sm2_   )   // BP 9-26-05 bug 101377: was ~rst_ccu_pll_sm_
   );

wire   rst_ccu_raw_        =
  ~(
    (~mio_rst_pwron_rst_l) | // Async assert, sync deassert.
    (~rst_ccu_sm2_       )   // BP 9-26-05 bug 101377: was ~rst_ccu_sm_
   );

wire   cluster_arst_raw_   =
  ~(
    (~mio_rst_pwron_rst_l) | // Async assert, sync deassert.
    (~cluster_arst_sm2_  )   // BP 9-26-05 bug 101377: was ~rst_ccu_sm_
   );

assign rst_ccu_pll_    = tcu_rst_scan_mode ?
                         `DEASSERT : // Suppress when chip is being scanned.
                         rst_ccu_pll_raw_;

assign rst_ccu_        = tcu_rst_scan_mode ?
                         `DEASSERT : // Suppress when chip is being scanned.
                         rst_ccu_raw_;

assign cluster_arst_l  = tcu_rst_scan_mode ?
                         `DEASSERT : // Suppress when chip is being scanned.
                         cluster_arst_raw_;


//________________________________________________________________
//
//              SSYS_RESET register, RW
//________________________________________________________________

wire ssys_reset_addr = addr_in_sys2 == `IOB_CREG_SSYSRESET;
wire ssys_reset_en   = wr_req_vld_trunc & ssys_reset_addr;

//________________________________________________________________

wire            ssys_reset_mac_en    = ssys_reset_en;
wire            ssys_reset_mac_din   = data_in_sys2[6];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1  ssys_reset_mac_ff         
     (.din     (ssys_reset_mac_din       ),
      .scan_in (ssys_reset_mac_ff_scanin ),
      .scan_out(ssys_reset_mac_ff_scanout),
      .clr_    (mio_rst_pwron_rst_sys_   ),
      .l1clk   (l1clk                    ),
      .en      (ssys_reset_mac_en        ),
      .dout    (ssys_reset_mac_q         ),
  .siclk(siclk),
  .soclk(soclk));// = SSYS_RESET  [MAC_PROTECT].
                                            // = ssys_reset_q[          6].
//________________________________________________________________

wire            ssys_reset_mcu_en    = ssys_reset_en;
wire            ssys_reset_mcu_din   = data_in_sys2[5];
assign          rst_mcu_selfrsh_sys2 = ssys_reset_mcu_q;

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1  ssys_reset_mcu_ff         
     (.din     (ssys_reset_mcu_din       ),
      .scan_in (ssys_reset_mcu_ff_scanin ),
      .scan_out(ssys_reset_mcu_ff_scanout),
      .clr_    (mio_rst_pwron_rst_sys_   ),
      .l1clk   (l1clk                    ),
      .en      (ssys_reset_mcu_en        ),
      .dout    (ssys_reset_mcu_q         ),
  .siclk(siclk),
  .soclk(soclk));// = SSYS_RESET  [MCU_SELFRSH].
                                            // = ssys_reset_q[          5].
//________________________________________________________________
//
//  SSYS_RESET[4:2] reserved.
//________________________________________________________________

reg                                    ssys_reset_dmu_clr ;
wire            ssys_reset_dmu_en    = ssys_reset_en      |
                                       ssys_reset_dmu_clr ;
wire            ssys_reset_dmu_din   = ssys_reset_dmu_clr ? 1'b0 :
                                                            data_in_sys2[1];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1  ssys_reset_dmu_ff         
     (.din     (ssys_reset_dmu_din       ),
      .scan_in (ssys_reset_dmu_ff_scanin ),
      .scan_out(ssys_reset_dmu_ff_scanout),
      .clr_    (mio_rst_pwron_rst_sys_   ),
      .l1clk   (l1clk                    ),
      .en      (ssys_reset_dmu_en        ),
      .dout    (ssys_reset_dmu_q         ),
  .siclk(siclk),
  .soclk(soclk));// = SSYS_RESET  [    DMU_PEU].
                                            // = ssys_reset_q[          1].
//________________________________________________________________

reg                                    ssys_reset_niu_clr ;
wire            ssys_reset_niu_en    = ssys_reset_en      |
                                       ssys_reset_niu_clr ;
wire            ssys_reset_niu_din   = ssys_reset_niu_clr ? 1'b0 :
                                                            data_in_sys2[0];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1  ssys_reset_niu_ff         
     (.din     (ssys_reset_niu_din       ),
      .scan_in (ssys_reset_niu_ff_scanin ),
      .scan_out(ssys_reset_niu_ff_scanout),
      .clr_    (mio_rst_pwron_rst_sys_   ),
      .l1clk   (l1clk                    ),
      .en      (ssys_reset_niu_en        ),
      .dout    (ssys_reset_niu_q         ),
  .siclk(siclk),
  .soclk(soclk));// = SSYS_RESET  [        NIU].
                                            // = ssys_reset_q[          0].
//________________________________________________________________

assign rst_dmu_peu_por_sys_       =
  ~(
    (~rst_l2_por_sys_           ) |   // (Independent of DBR.)
    (~mio_rst_pwron_rst_sys_    ) |   // Async assert, sync deassert.
    (~rst_dmu_peu_por_sm_       )
   );

assign rst_dmu_peu_wmr_sys_       =
  ~(
     (~mio_rst_pwron_rst_sys_   )   | // Async assert, sync deassert.
    ((~rst_dmu_peu_wmr_sm_      ) &   // It is OK that this does not come from
				      // a flop, because we flop
				      // rst_dmu_peu_wmr_sys_ before using.
     (~reset_gen_dbr_gen_q      ) ) | // Don't assert rst_dmu_peu_wmr_i
                                      // during DBR.
     (~rst_dmu_ssys_sm_         )     // DMU_PEU bit of SSYS_RESET register.
   );                                 // 

assign rst_niu_mac_sys_           =
  ~(
     (~mio_rst_pwron_rst_sys_   )   | // Async assert, sync deassert.
    ((~rst_niu_mac_sm_          ) &   // It is OK that this does not come from
				      // a flop, because we flop
				      // rst_niu_mac_sys_ before using.
     (~reset_gen_dbr_gen_q      ) ) | // Don't assert rst_niu_mac_sys_
                                      // during DBR.
    ((~rst_niu_ssys_sm_         ) &   // NIU         bit of SSYS_RESET register.
     (~ssys_reset_mac_q         ) )   // MAC_PROTECT bit of SSYS_RESET register.
   );                                 // 

assign rst_niu_wmr_sys_           =
  ~(
     (~mio_rst_pwron_rst_sys_   )   | // Async assert, sync deassert.
    ((~rst_niu_wmr_sm_          ) &   // It is OK that this does not come from
				      // a flop, because we flop
				      // rst_niu_wmr_sys_ before using.
     (~reset_gen_dbr_gen_q      ) ) | // Don't assert rst_niu_wmr_sys_
                                      // during DBR.
     (~rst_niu_ssys_sm_         )     // NIU bit of SSYS_RESET register.
   );                                 // 

wire assert_mac_during_wmr = (ccu_rst_change_sys == 1'b1) & ~ssys_reset_mac_q;

// Set SSYS_RESET[MAC_PROTECT] (ssys_reset_mac_q) to one to
// suppress the assertion of rst_niu_mac_sys_ that the Reset Unit
// would normally generate during a WMR with ccu_rst_change_sys==1.  
//________________________________________________________________
  
                                                      //[63:7] RSVD0
wire [6:0] ssys_reset_q    = {ssys_reset_mac_q      , //   [6] MAC_PROTECT
                              ssys_reset_mcu_q      , //   [5] MCU_SELFRSH
                              1'b0                  , //   [4] RSVD1
                              2'b0                  , // [3:2] RSVD2
                              ssys_reset_dmu_q      , //   [1] DMU_PEU
                              ssys_reset_niu_q      };//   [0] NIU


//________________________________________________________________
//
//              RSET_STAT register, RW (except shadow bits are RO)
//________________________________________________________________

wire rset_stat_addr   = addr_in_sys2 == `IOB_CREG_RESETSTAT;
wire rset_stat_en     = (wr_req_vld_trunc & rset_stat_addr) |
                                            rset_stat_wmr_set;

//re rset_stat_wmr_en =         reset_gen_en    & data_in_sys2[0] 
//                              // SW setting WMR_GEN bit of
//                              // RESET_GEN reg.
//                    |         rset_stat_en
//                    |         ~mio_rst_pb_rst_sys3_;
//________________________________________________________________
//
// The shadow versions of the bits only have meaning after a WMR,
// since by definition, a reset the system controller applies after
// the machine has been running is a WMR.  Since the system
// controller only applies a POR upon applying power, the shadow
// versions of the bits will always be 0 after a POR.
//________________________________________________________________

wire   [11:0]                   rset_stat_q;
wire   [ 2:0]  rset_stat_shadow_din = 
                               ((reset_gen_en    & data_in_sys2[0])
                                // SW setting WMR_GEN bit of
                                // RESET_GEN reg.
                               |   rset_stat_wmr_set 
                               ) ? rset_stat_q[3:1] :
                               rset_stat_en ? data_in_sys2[11:9] :
                               3'h0; // ~mio_rst_pb_rst_sys3_  Review May02'05.
wire   [ 2:0]  rset_stat_shadow_q;

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_3 rset_stat_shadow_ff         
    (.din     (rset_stat_shadow_din[2:0]  ),
     .scan_in (rset_stat_shadow_ff_scanin ),
     .scan_out(rset_stat_shadow_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_     ),
     .l1clk   (l1clk                      ),
     .en      (rset_stat_en               ), // Only meaningful after a WMR.
     .dout    (rset_stat_shadow_q[2:0]    ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           rset_stat_freq_din =
                                //(reset_gen_en    & data_in_sys2[0] 
                                // SW setting WMR_GEN bit of
                                // RESET_GEN reg.
                               (rset_stat_wmr_set
                               ) ?  ccu_rst_change_sys :
                               rset_stat_en ? data_in_sys2[3] :
                               1'h0; // ~mio_rst_pb_rst_sys3_
wire           rset_stat_freq_q;

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 rset_stat_freq_ff         
    (.din     (rset_stat_freq_din       ),
     .scan_in (rset_stat_freq_ff_scanin ),
     .scan_out(rset_stat_freq_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_   ),
     .l1clk   (l1clk                    ),
     .en      (rset_stat_en             ), // Only meaningful after a WMR.
     .dout    (rset_stat_freq_q         ),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________

wire           rset_stat_por_din      =
                               rset_stat_wmr_set ? 1'b0 :
                             //(reset_gen_en    & data_in_sys2[2] 
                             //    SW can't set POR_GEN bit of
                             //    RESET_GEN reg. because there is none.
                             //) ?  1'b1 :
                               rset_stat_en ? data_in_sys2[2] :
                               1'h0; // RST_ARBITER: rset_stat_wmr_set.
assign         rset_stat_por_din_phy_ = ~rset_stat_por_din;
wire           rset_stat_por_q_phy_;
assign         rset_stat_por_q        = ~rset_stat_por_q_phy_;
                                // Initial value 1 on POR, so
                                // rset_stat_por_din_, like
                                // reset_source_por_q_, holds inverse.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 rset_stat_por_ff         
    (.din     (rset_stat_por_din_phy_  ),
     .scan_in (rset_stat_por_ff_scanin ),
     .scan_out(rset_stat_por_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_  ),
     .l1clk   (l1clk                   ),
     .en      (rset_stat_en            ),
     .dout    (rset_stat_por_q_phy_    ),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________

wire           rset_stat_wmr_din =
                               rset_stat_wmr_set ? 1'b1 :
                               (reset_gen_en    & data_in_sys2[0] 
                                // SW setting WMR_GEN bit of
                                // RESET_GEN reg.
                               ) ?  1'b1 :
                               rset_stat_en ? data_in_sys2[1] :
                               1'h1; // ~mio_rst_pb_rst_sys3_
wire           rset_stat_wmr_q;

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 rset_stat_wmr_ff         
    (.din     (rset_stat_wmr_din       ),
     .scan_in (rset_stat_wmr_ff_scanin ),
     .scan_out(rset_stat_wmr_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_  ),
     .l1clk   (l1clk                   ),
     .en      (rset_stat_en            ),
     .dout    (rset_stat_wmr_q         ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

assign rset_stat_q[11:0]    = {rset_stat_shadow_q[2:0],// [11:9] Shadow.
                               5'b0                   ,// [ 8:4] Reserved.
                               rset_stat_freq_q       ,// [   3] Freq.
                               rset_stat_por_q        ,// [   2] POR.
                               rset_stat_wmr_q        ,// [   1] WMR.
                               1'b0                  };// [   0] Reserved.

// xx 0in range -var {~rset_stat_por_q_, rset_stat_wmr_q} -min 0 -max 2
/* xx 0in value
   -var {~rset_stat_por_q_, rset_stat_wmr_q}
   -val 2'b00 2'b01 2'b10
   -active ... (What is this?) -module ... -name ...
   -message "POR and WMR bits in RSET_STAT are mutually exclusive."
*/
// commented out the assertion that
// POR and WMR bits in RSET_STAT are mutually exclusive, because,
// while that is true as rst operates, software can write all ones
// into the rset_stat register.  Dec 23 '04

//________________________________________________________________
//
//              LOCK_TIME register, RW
//________________________________________________________________

wire           lock_time_addr    = addr_in_sys2 == `IOB_CREG_LOCK_TIME;
wire           lock_time_en      = wr_req_vld_trunc & lock_time_addr;

                      // 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
                      //  0  0  1  0  1  0  0  0  0  0  0  0  0  0  0 = 5k.

wire [`RST_TIME_WIDTH-1:0]
               lock_time_din     = data_in_sys2[`RST_TIME_WIDTH-1:0];
wire [`RST_TIME_WIDTH-1:0]
               lock_time_din_phy
           = { lock_time_din  [`RST_TIME_WIDTH-1:13],// Reset to 5k=5120.
              ~lock_time_din  [                  12],// = logical 1.
               lock_time_din  [                  11],// = logical 0.
              ~lock_time_din  [                  10],// = logical 1.
               lock_time_din  [                9:0] };
wire [`RST_TIME_WIDTH-1:0]
               lock_time_q_phy;
wire [`RST_TIME_WIDTH-1:0]
               lock_time_q
           = { lock_time_q_phy[`RST_TIME_WIDTH-1:13],// Reset to 5k=5120.
              ~lock_time_q_phy[                  12],// = logical 1.
               lock_time_q_phy[                  11],// = logical 0.
              ~lock_time_q_phy[                  10],// = logical 1.
               lock_time_q_phy[                9:0] };

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_16 lock_time_ff
                          
    (.din     (lock_time_din_phy[`RST_TIME_WIDTH-1:0]),
     .scan_in (lock_time_ff_scanin ),
     .scan_out(lock_time_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_                ),
     .l1clk   (l1clk                                 ),
     .en      (lock_time_en                          ),
     .dout    (lock_time_q_phy  [`RST_TIME_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________
//
//              LOCK_TIME counter, internal to rst_ctl.
//________________________________________________________________

wire [`RST_TIME_WIDTH-1:0]
               lock_count_q;
reg            lock_count_run;             // Enable LOCK_TIME counter.
wire [`RST_TIME_WIDTH-1:0]
               lock_count_din
             = lock_count_run
             ? lock_count_q[`RST_TIME_WIDTH-1:0] - `RST_TIME_WIDTH'b1
             : lock_time_q [`RST_TIME_WIDTH-1:0];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_16 lock_count_ff
                       
    (.din     (lock_count_din[`RST_TIME_WIDTH-1:0]),
     .scan_in (lock_count_ff_scanin ),
     .scan_out(lock_count_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (lock_count_q  [`RST_TIME_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________
//
//              PROP_TIME register, RW
//________________________________________________________________

wire           prop_time_addr    = addr_in_sys2 == `IOB_CREG_PROP_TIME;
wire           prop_time_en      = wr_req_vld_trunc & prop_time_addr;

                      // 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
                      //  0  0  0  1  1  0  0  0  0  0  0  0  0  0  0 = 3k.

wire [`RST_TIME_WIDTH-1:0]
               prop_time_din     = data_in_sys2[`RST_TIME_WIDTH-1:0];
wire [`RST_TIME_WIDTH-1:0]
               prop_time_din_phy
           = { prop_time_din  [`RST_TIME_WIDTH-1:12],// Reset to 3k=3072.
              ~prop_time_din  [               11:10],// = logical 1.
               prop_time_din  [                9:0] };
wire [`RST_TIME_WIDTH-1:0]
               prop_time_q_phy;
wire [`RST_TIME_WIDTH-1:0]
               prop_time_q
           = { prop_time_q_phy[`RST_TIME_WIDTH-1:12],// Reset to 3k=3072.
              ~prop_time_q_phy[               11:10],// = logical 1.
               prop_time_q_phy[                9:0] };

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_16 prop_time_ff            
    (.din     (prop_time_din_phy[`RST_TIME_WIDTH-1:0]),
     .scan_in (prop_time_ff_scanin ),
     .scan_out(prop_time_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_                ),
     .l1clk   (l1clk                                 ),
     .en      (prop_time_en                          ),
     .dout    (prop_time_q_phy[`RST_TIME_WIDTH-1:0]  ),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________
//
//              PROP_TIME counter, internal to rst_ctl.
//________________________________________________________________

wire [`RST_TIME_WIDTH-1:0]
               prop_count_q;
reg            prop_count_run; // Enable PROP_TIME counter.
wire [`RST_TIME_WIDTH-1:0]
               prop_count_din
             = prop_count_run
             ? prop_count_q[`RST_TIME_WIDTH-1:0] - `RST_TIME_WIDTH'b1
             : prop_time_q [`RST_TIME_WIDTH-1:0];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_16 prop_count_ff
                       
    (.din     (prop_count_din[`RST_TIME_WIDTH-1:0]),
     .scan_in (prop_count_ff_scanin ),
     .scan_out(prop_count_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_             ),
     .l1clk   (l1clk                              ),
     .dout    (prop_count_q  [`RST_TIME_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________
//
//              NIU_TIME register, RW
//________________________________________________________________

wire           niu_time_addr     = addr_in_sys2 == `IOB_CREG_NIU_TIME;
wire           niu_time_en       = wr_req_vld_trunc & niu_time_addr;

                      // 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
                      //  0  0  0  0  1  1  0  0  1  0  0  0  0  0  0 = 1.5k+64.
                      //                                              = 1,600.
wire [`RST_TIME_WIDTH-1:0]
               niu_time_din      = data_in_sys2[`RST_TIME_WIDTH-1:0];
wire [`RST_TIME_WIDTH-1:0]
               niu_time_din_phy
           = { niu_time_din  [`RST_TIME_WIDTH-1:11],// Reset to 1.5k+64.
              ~niu_time_din  [               10:9],// Physical 0 = logical 1.
               niu_time_din  [                8:7],//
              ~niu_time_din  [                  6],// Reset to phy 0, log 1.
               niu_time_din  [                5:0] };
wire [`RST_TIME_WIDTH-1:0]
               niu_time_q_phy;
wire [`RST_TIME_WIDTH-1:0]
               niu_time_q
           = { niu_time_q_phy[`RST_TIME_WIDTH-1:11],// Reset to 1.5k+64.
              ~niu_time_q_phy[               10:9],// = logical 1.
               niu_time_q_phy[                8:7],//
              ~niu_time_q_phy[                  6],// = logical 1.
               niu_time_q_phy[                5:0] };

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_16 niu_time_ff
                         
    (.din     (niu_time_din_phy[`RST_TIME_WIDTH-1:0]),
     .scan_in (niu_time_ff_scanin ),
     .scan_out(niu_time_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk                 ),
     .en      (niu_time_en           ),
     .dout    (niu_time_q_phy  [`RST_TIME_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________
//
//              NIU_TIME counter, internal to rst_ctl.
//________________________________________________________________

wire [`RST_TIME_WIDTH-1:0]
                niu_count_q         ;
reg             niu_count_run       ;  // Enable NIU_TIME counter.
reg             niu_count_run_dmu_sm; 
reg             niu_count_run_niu_sm;  // Only one SM active at a time.
wire [`RST_TIME_WIDTH-1:0]
                niu_count_din
             = (niu_count_run        |
                niu_count_run_dmu_sm |
                niu_count_run_niu_sm ) // Only one SM active at a time.
             ? niu_count_q[`RST_TIME_WIDTH-1:0] - `RST_TIME_WIDTH'b1
             : niu_time_q [`RST_TIME_WIDTH-1:0];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_16 niu_count_ff
                      
    (.din     (niu_count_din[`RST_TIME_WIDTH-1:0]),
     .scan_in (niu_count_ff_scanin ),
     .scan_out(niu_count_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk                 ),
     .dout    (niu_count_q  [`RST_TIME_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________
//
//              CCU_TIME register, RW
//________________________________________________________________

wire           ccu_time_addr     = addr_in_sys2 == `IOB_CREG_CCU_TIME;
wire           ccu_time_en       = wr_req_vld_trunc & ccu_time_addr;

             // 15 14 13 12   11 10 09 08   07 06 05 04   03 02 01 00
             //  0  0  0  0    0  0  0  0    0  0  1  0    0  0  0  0 = 32
wire [`RST_TIME_WIDTH-1:0]
               ccu_time_din      = data_in_sys2[`RST_TIME_WIDTH-1:0];
wire [`RST_TIME_WIDTH-1:0]
               ccu_time_din_phy
           = { ccu_time_din  [`RST_TIME_WIDTH-1:6],// Reset to 32.
              ~ccu_time_din  [                  5],// = logical 1.
               ccu_time_din  [                4:0] };
wire [`RST_TIME_WIDTH-1:0]
               ccu_time_q_phy;
wire [`RST_TIME_WIDTH-1:0]
               ccu_time_q
           = { ccu_time_q_phy[`RST_TIME_WIDTH-1:6],// Reset to 32.
              ~ccu_time_q_phy[                  5],// = logical 1.
               ccu_time_q_phy[                4:0] };

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_16 ccu_time_ff            
    (.din     (ccu_time_din_phy[`RST_TIME_WIDTH-1:0]),
     .scan_in (ccu_time_ff_scanin ),
     .scan_out(ccu_time_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk                 ),
     .en      (ccu_time_en           ),
     .dout    (ccu_time_q_phy  [`RST_TIME_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________
//
//              CCU_TIME counter, internal to rst_ctl.
//________________________________________________________________

wire [`RST_TIME_WIDTH-1:0]
               ccu_count_q;
reg            ccu_count_run; // Enable CCU_TIME counter.
wire [`RST_TIME_WIDTH-1:0]
               ccu_count_din
             = ccu_count_run
             ? ccu_count_q[`RST_TIME_WIDTH-1:0] - `RST_TIME_WIDTH'b1
             : ccu_time_q [`RST_TIME_WIDTH-1:0];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_16 ccu_count_ff
                      
    (.din     (ccu_count_din[`RST_TIME_WIDTH-1:0]),
     .scan_in (ccu_count_ff_scanin ),
     .scan_out(ccu_count_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk                 ),
     .dout    (ccu_count_q  [`RST_TIME_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________
//
//              RESET_FEE register, Fatal Error Enable, RW
//________________________________________________________________

wire           reset_fee_addr    = addr_in_sys2 == `IOB_CREG_RESET_FEE;
wire           reset_fee_en      = (wr_req_vld_trunc & reset_fee_addr) |
                                   rset_stat_wmr_set;       // Clr on WMR.
wire [7:0]     reset_fee_din     = rset_stat_wmr_set ? 8'b0 // Clr on WMR.
                                                     : data_in_sys2[15:8];

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_8 reset_fee_ff         
    (.din     (reset_fee_din[7:0]  ),
     .scan_in (reset_fee_ff_scanin ),
     .scan_out(reset_fee_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_      ),
     .l1clk   (l1clk               ),
     .en      (reset_fee_en        ),
     .dout    (reset_fee_q[7:0]    ),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________
//
//               Reset sequence state machine
//________________________________________________________________

//________________________________________________________________
//
// 1.4   POR_1:                                           RST_INIT_STATE      .
//                                                       (POR1_FLUSH_STOP_REQ)
//       Both rst and tcu reset.
//       Come out of PWRON_RST_L continuing to assert rt_flush_stop_req_sys .
//                              tcu (Re-start tcu clk.) (POR1: Never stopped.)
// 5.4.2                        tcu Deassert scan_en, wait for it to propagate.
// 5.4.8                        tcu Deassert clk_stop in a staggered fashion.
// 5.4.9                        tcu Conditional EFU.  (Not WMR.)
// 5.5 Bisi1                    tcu Conditional Bisi or Bist.
//                              tcu (Conditional stop clocks according to
//                              tcu asi_core_available.)  (Not POR1.)
// 5.6   Wait for tr_flush_stop_ack_sys .                 POR1_FLUSH_STOP_ACK
//                                                       (FLUSH_POR_1         .)
//________________________________________________________________
// 
// 5.7   POR_2:
//       Assert rt_flush_init_req_sys .                     
//                              tcu Assert   clk_stop in a staggered fashion.
//                              tcu Assert   scan_en, wait for it to propagate.
//                              tcu (Both rst and tcu protected from reset.)
//                              tcu Stop     tcu clock, since PLL may unlock.
//       Wait for tr_flush_init_ack_sys .                 POR2_FLUSH_INIT_ACK
// 5.8   Wait lock_time.                                  POR2_LOCK_TIME
//                                                       (POR2_FLUSH_INIT_ACK .)
//                                                        DEASSERT_CLOCK_STOP .
//                                                        EFU_RUN_1           .
//                                                        REASSERT_CLOCK_STOP_1
//                                                        BISI_RUN_1
//                                                        FLUSH_POR_2
//                                                        DEASSERT_SE_PROP_2
//                                                        EFU_RUN_2
//                                                        REASSERT_CLOCK_STOP_2
//       Assert rt_flush_stop_req_sys .
//                              tcu Re-start tcu clock.
// 5.9                          tcu Deassert scan_en, wait for it to propagate.
//                              tcu Deassert clk_stop in a staggered fashion.
// 5.10                         tcu Conditional EFU.  (Not WMR.)
//                              tcu (Conditional Bisi or Bist: Suppressed.)
//                              tcu Conditional stop clocks according to
//                              tcu asi_core_available.  (Not POR1.)
//       Wait for tr_flush_stop_ack_sys .                 POR2_FLUSH_STOP_ACK
// 5.12  Assert rst_soc_run.                              POR2_ASSERT_RUN
// 5.12  Assert rst_ncu_unpark_thread_sys2.               POR2_UNPARK_THREAD
// 8     Wait for WMR_GEN.                                POR2_WMR_GEN
// 8     Deassert rst_soc_run.                            WMR1_DEASSERT_RUN
// 9     Assert rst_l2_wmr_sys_                          (POR2_RST_WMR_)
//________________________________________________________________
//
//       Flush WMR 1:
//       Assert rt_flush_init_req_sys .
//                              tcu Assert   clk_stop in a staggered fashion.
//                              tcu Assert   scan_en, wait for it to propagate.
//                              tcu (Both rst and tcu protected from reset.)
//                              tcu Stop     tcu clock, since PLL may unlock.
//       Wait for tr_flush_init_ack_sys .                 WMR1_FLUSH_INIT_ACK
// 9.4.2 Wait lock_time.                                  WMR1_LOCK_TIME
//       Assert rt_flush_stop_req_sys .
//                              tcu Re-start tcu clock.
//                              tcu Deassert scan_en, wait for it to propagate.
//                              tcu Deassert clk_stop in a staggered fashion.
//                              tcu (Conditional EFU.)  (Not WMR.)
// 9.5 Bist2                    tcu Conditional Bisi or Bist.
//                              tcu Conditional stop clocks according to
//                              tcu asi_core_available.  (Not POR1.)
// 9.6   Wait for tr_flush_stop_ack_sys .                  WMR1_FLUSH_STOP_ACK
//________________________________________________________________
//
//       Flush WMR 2:
// 9.7   Assert rst_wrm_.
//       Assert rt_flush_init_req_sys .
//                              tcu Assert   clk_stop in a staggered fashion.
//                              tcu Assert   scan_en, wait for it to propagate.
//                              tcu (Both rst and tcu protected from reset.)
//                              tcu Stop     tcu clock, since PLL may unlock.
//       Wait for tr_flush_init_ack_sys .                 WMR2_FLUSH_INIT_ACK
// 9.8   Wait lock_time.                                  WMR2_PROP_TIME
//       Assert rt_flush_stop_req_sys .
//                              tcu Re-start tcu clock.
//                              tcu Deassert scan_en, wait for it to propagate.
//                              tcu Deassert clk_stop in a staggered fashion.
//                              tcu (Conditional EFU.)  (Not WMR.)
//                              tcu (Conditional Bisi or Bist.)  (Not WMR2.)
//                              tcu Conditional stop clocks according to
//                              tcu asi_core_available.  (Not POR1.)
// 9.9   Wait for tr_flush_stop_ack_sys .                 WMR2_FLUSH_STOP_ACK
// 9.11  Set RSET-STATUS reg WMR bit + Freq bit           
// 9.12  Assert rst_soc_run.
// 9.12  Assert rst_ncu_unpark_thread_sys2.               WMR2_UNPARK_THREAD
//________________________________________________________________

//                                             rst  tcu  rst  tcu   
//                                             tcu  rst  tcu  rst   
//                         rst_ rst_           flsh flsh flsh flsh  
//                         ccu_ ccu_ rst_ rst_ init init stop stop rst_
// State                   pll_      por_ wmr_ req  ack  req  ack  niu_
// ___________________     ____ ____ ____ ____ ___  ___  ___  ___  ____
// 
// RST_INIT_STATE          a    a    a    a    .    .    .    .    a    .
// POR1_LOCK_TIME          a    .
// POR1_SYNC_STABLE        .    .
// POR1_FLUSH_STOP_REQ     .    .    a    a    .    .    .    .    a    .
// POR1_FLUSH_STOP_ACK     .    .    a    a    .    .    1    .    a    .
// POR1_BISX_DONE          .    .

// POR2_FLUSH_INIT_ACK     .    .    .    .    1    .    .    .    .    .
// POR2_LOCK_TIME          .    .    a    a    .    .    .    .    a    .
// POR2_FLUSH_STOP_ACK     .    .    .    .    .    .    1    .    .    .
// POR2_EFU_DONE           .    .
// POR2_ASSERT_RUN         .    .    .    .    .    .    .    .    .    .
// POR2_UNPARK_THREAD      .    .    .    .    .    .    .    .    .    .

// WMR1_WMR_GEN            .    .    .    .    .    .    .    .    .    .
// WMR1_DEASSERT_RUN       .    .    .    .    .    .    .    .    .    .
// WMR1_FLUSH_INIT_ACK     .    .    .    .    1    .    .    .    .    .
// WMR1_PRE_PLL1           .    .
// WMR1_PRE_PLL2           .    .
// WMR1_CCU_PLL            a    a
// WMR1_LOCK_TIME          a    .    .    a    .    .    .    .    a    .
// WMR1_SYNC_STABLE        .    .
// WMR1_PROP_TIME (alt path)    .
// WMR1_FLUSH_STOP_ACK     .    .    .    .    .    .    1    .    .    .

// WMR2_FLUSH_INIT_ACK     .    .    .    .    1    .    .    .    .    .
// WMR2_PROP_TIME          .    .    .    a    .    .    .    .    a    .
// WMR2_FLUSH_STOP_ACK     .    .    .    .    .    .    1    .    .    .
// WMR2_ASSERT_RUN         .    .    .    .    .    .    .    .    .    .
// WMR2_UNPARK_THREAD      .    .    .    .    .    .    .    .    .    .
// RST_ARBITER             .    .
// XIR_DONE                .    .
//________________________________________________________________

reg  [`RST_FSM_WIDTH-1:0]    state_d;                          // Next state.
wire [`RST_FSM_WIDTH-1:0]    state_d_phy = {
                             state_d    [`RST_FSM_WIDTH-1:1],  // Reset to 1.
                            ~state_d    [                 0] };
wire [`RST_FSM_WIDTH-1:0]    state_q_phy;                      // Current state.
wire [`RST_FSM_WIDTH-1:0]    state_q     = {
                             state_q_phy[`RST_FSM_WIDTH-1:1],  // Reset to 1.
                            ~state_q_phy[                 0] };
//________________________________________________________________
//
//             Reset sequence state_q state machine (always block)
//________________________________________________________________

always @(
//PWRON_RST_L               or // variable in sensitivity list not
                               // used in block (PWRON_RST_L)
  state_q                   or
  tr_flush_init_ack_sys     or
  tr_flush_stop_ack_sys     or
  tcu_bisx_done_sys         or
  tcu_rst_efu_done_sys      or
  lock_count_q              or
  prop_count_q              or
  niu_count_q               or
  ccu_count_q               or
  mio_rst_pb_rst_sys3_      or
  reset_gen_wmr_gen_q       or
  reset_gen_dbr_gen_q       or
  rst_fatal_or              or
  //ccu_rst_sync_stable     or
  ccu_rst_change_sys        or
  tr_asicflush_stop_ack_sys or
  assert_mac_during_wmr     )
begin  // Reset sequence state machine

lock_count_run            = 1'b0;      // Default value.
prop_count_run            = 1'b0;      // Default value.
niu_count_run             = 1'b0;      // Default value.
ccu_count_run             = 1'b0;      // Default value.

rst_ccu_pll_sm_           = `DEASSERT; // Default value.
rst_ccu_sm_               = `DEASSERT; // Default value.
cluster_arst_sm_          = `DEASSERT; // Default value.
rst_rst_por_sm_           = `DEASSERT; // Default value.
rst_l2_por_sys_           = `DEASSERT; // Default value.
rst_l2_wmr_sys_           = `DEASSERT; // Default value.
rst_cmp_ctl_wmr_sys_      = `DEASSERT; // Default value.
rst_niu_mac_sm_           = `DEASSERT; // Default value.
rst_niu_wmr_sm_           = `DEASSERT; // Default value.
rst_dmu_async_por_sm_     = `DEASSERT; // Default value.
rst_dmu_peu_por_sm_       = `DEASSERT; // Default value.
rst_dmu_peu_wmr_sm_       = `DEASSERT; // Default value.
rst_wmr_protect_sys       = 1'b0;      // Default value.
rst_tcu_clk_stop_sys      = 1'b0;      // Default value.

rst_ncu_unpark_thread_sys = 1'b0;      // Default value.
rt_flush_init_req_sys     = 1'b0;      // Default value.
rt_flush_stop_req_sys     = 1'b0;      // Default value.
rt_asicflush_stop_req_sys = 1'b0;      // Default value.
rst_WMR_done              = 1'b0;      // Default value.
rst_DBR_done              = 1'b0;      // Default value.
rst_assert_ssi_sync_en    = 1'b0;      // Default value.
rst_assert_ssi_sync_din   = 1'b0;      // Default value.
rset_stat_wmr_set         = 1'b0;      // Default value.
reset_source_pb_rst_set   = 1'b0;      // Default value.

state_d           = `RST_INIT_STATE;  // Default value.

/* 0in one_hot -var state_q -active mio_rst_pwron_rst_l
   -message "RST seq state machine state violated one_hot." 
*/

case (state_q) // synopsys parallel_case
               // syn-op-sys full_case not applicable since one-hot.
               /* 0in case
                  -parallel
                  -default
                  -active  (mio_rst_pwron_rst_l === 1'b1)
                  -message "Main Reset Unit state machine case bad."
               */

  `RST_INIT_STATE:                  // 17'h0001
  begin                             // Steps 1.4 and 5.4.
                                    // PWRON_RST_L forces this state, because:
                                    // msff state_ff(.clr_(PWRON_RST_L));
                                    // and init value of state_q =
                                    // RST_INIT_STATE == 17'h0001.

    rst_ccu_pll_sm_      = `ASSERT; // Hold pll       until end of PWRON_RST_L.
    rst_ccu_sm_          = `ASSERT; // Hold ccu       a few cycles more.
    cluster_arst_sm_     = `ASSERT; // Hold ccu       a few cycles more.
    rst_rst_por_sm_      = `ASSERT; // Hold ccu       a few cycles more.
    rst_l2_por_sys_      = `ASSERT; // Hold IP blocks until stop_ack.
    rst_l2_wmr_sys_      = `ASSERT; // Hold IP blocks until stop_ack.
    rst_cmp_ctl_wmr_sys_ = `ASSERT; // Hold rst_cmp_ctl until sync_stable.
    rst_niu_mac_sm_      = `ASSERT; // Hold IP blocks until stop_ack.
    rst_niu_wmr_sm_      = `ASSERT; // Hold IP blocks until stop_ack.
    rst_dmu_async_por_sm_= `ASSERT; // Hold IP blocks until stop_ack.
    rst_dmu_peu_por_sm_  = `ASSERT; // Hold IP blocks until stop_ack.
    rst_dmu_peu_wmr_sm_  = `ASSERT; // Hold IP blocks until stop_ack.
    rst_wmr_protect_sys  = 1'b0;    // POR, not WMR.
    rst_ncu_unpark_thread_sys= 1'b0;//

    state_d = `POR1_LOCK_TIME;      // Move on, as soon as Service
                                    // Processor releases PWRON_RST_L.
  end

  `POR1_LOCK_TIME:                  // 17'h000-
  begin                             // Step 5.4.2: lock time.
    rst_ccu_pll_sm_      =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    rst_ccu_sm_          =  `ASSERT;// Release PLL for LOCK_TIME before ccu.
    cluster_arst_sm_     =  `ASSERT;// Release PLL for LOCK_TIME before ccu.
    rst_rst_por_sm_      =  `ASSERT;// Release PLL for LOCK_TIME before ccu.
    rst_l2_por_sys_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_l2_wmr_sys_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_cmp_ctl_wmr_sys_ =  `ASSERT;// Hold rst_cmp_ctl until sync_stable.
    rst_niu_mac_sm_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_niu_wmr_sm_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_dmu_async_por_sm_=  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_dmu_peu_por_sm_  =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_dmu_peu_wmr_sm_  =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_wmr_protect_sys  = 1'b0;    // POR, not WMR.
  
    lock_count_run   = 1'b1;        // Allow PLLs to lock.
    if (lock_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
      state_d = `POR1_ARST_TIME;    // 
    else
      state_d = `POR1_LOCK_TIME;     
  end

  `POR1_ARST_TIME:                  // 17'h000-
  begin                             // Step 5.4.2: lock time.
    rst_ccu_pll_sm_      =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    rst_ccu_sm_          =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    cluster_arst_sm_     =  `ASSERT;// Release PLL for LOCK_TIME before ccu.
    rst_rst_por_sm_      =  `ASSERT;// Sync reset of rst sync_en flops.
    rst_l2_por_sys_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_l2_wmr_sys_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_cmp_ctl_wmr_sys_ =  `ASSERT;// Hold rst_cmp_ctl until sync_stable.
    rst_niu_mac_sm_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_niu_wmr_sm_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_dmu_async_por_sm_=  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_dmu_peu_por_sm_  =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_dmu_peu_wmr_sm_  =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_wmr_protect_sys  = 1'b0;    // POR, not WMR.
  
    ccu_count_run   = 1'b1;         // Deassert rst_ccu_ before cluster_arst_l.
    if (ccu_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
    begin
      ccu_count_run   = 1'b0;       // Clear counter before use next cycle.
      state_d = `POR1_SYNC_STABLE;
    end
    else
      state_d = `POR1_ARST_TIME;     
  end

  `POR1_SYNC_STABLE:                // 
  begin                             // 
    rst_ccu_pll_sm_      =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    rst_ccu_sm_          =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    cluster_arst_sm_     =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    rst_rst_por_sm_      =  `ASSERT;// Sync reset of rst sync_en flops,
                                    // since l2clk and iol2clk now running.
    rst_l2_por_sys_      =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_l2_wmr_sys_      =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_cmp_ctl_wmr_sys_ =  `ASSERT;// Hold rst_cmp_ctl until sync_stable.
    rst_niu_mac_sm_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_niu_wmr_sm_      =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_dmu_async_por_sm_=  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_por_sm_  =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_wmr_sm_  =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys  = 1'b0;    // POR, not WMR.

    ccu_count_run    = 1'b1;        // Allow ccu_*_sync_en signals to settle.
    if (
    //ccu_rst_sync_stable  == 1'b1) // Wait for ccu to say sync_en OK.
        ccu_count_q[`RST_TIME_WIDTH-1:0]  == `RST_TIME_WIDTH'b0)
                                    // Cannot use ccu_rst_sync_stable
                                    // because cannot cross clock domains
                                    // because need to
                                    // allow ccu_*_sync_en signals to settle.
      state_d = `POR1_ASICFLUSH_STOP_ACK;
    else
      state_d = `POR1_SYNC_STABLE;
  end

  `POR1_ASICFLUSH_STOP_ACK:         // Req. for tcu to stop        w. stop_req.
  begin                             // 
    rst_ccu_pll_sm_      =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    rst_ccu_sm_          =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    cluster_arst_sm_     =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
  //rst_rst_por_sm_      =  `ASSERT;// Hold psr config regs: rst_dmu_async_por_.
    rst_rst_por_sm_      =`DEASSERT;// Hold psr config regs: rst_dmu_async_por_.
    rst_l2_por_sys_      =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_l2_wmr_sys_      =`DEASSERT;// Hold IP blocks in reset until stop_ack.
    rst_cmp_ctl_wmr_sys_ =`DEASSERT;// Hold rst_cmp_ctl until sync_stable.
    rst_niu_mac_sm_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_niu_wmr_sm_      =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_dmu_async_por_sm_=  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_por_sm_  =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_wmr_sm_  =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys  = 1'b0;    // POR, not WMR.
    rt_asicflush_stop_req_sys 
                         = 1'b1;    // Req. for tcu to stop        w. stop_req.
    if (tr_asicflush_stop_ack_sys  == 1'b1)
                                    // Wait for tcu to acknowledge w. stop_ack.
      state_d = `POR1_NIU_TIME;     // tcu has finished POR 1 flush stop.
    else
      state_d = `POR1_ASICFLUSH_STOP_ACK;
  end

  `POR1_NIU_TIME:                   // 
  begin                             // 
    rst_ccu_pll_sm_      =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    rst_ccu_sm_          =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
    cluster_arst_sm_     =`DEASSERT;// Release PLL for LOCK_TIME before ccu.
  //rst_rst_por_sm_      =  `ASSERT;// Hold psr config regs: rst_dmu_async_por_.
    rst_rst_por_sm_      =`DEASSERT;// Hold psr config regs: rst_dmu_async_por_.
    rst_l2_por_sys_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_l2_wmr_sys_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_cmp_ctl_wmr_sys_ =`DEASSERT;// Hold rst_cmp_ctl until sync_stable.
    rst_niu_mac_sm_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_niu_wmr_sm_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
                                    // To do: separate into
                                    // rst_por_sm_ and
                                    // rst_mac_sm_.
    rst_dmu_async_por_sm_=  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_dmu_peu_por_sm_  =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_dmu_peu_wmr_sm_  =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_wmr_protect_sys  = 1'b0;    // POR, not WMR.
  
    niu_count_run        = 1'b1;    // Allow mac in niu to reset.
    if (niu_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
      state_d = `POR1_FLUSH_STOP_ACK;
    else
      state_d = `POR1_NIU_TIME;     
  end

  `POR1_FLUSH_STOP_ACK:             // Req. tcu to stop            w. stop_req.
                                    // Wait for tcu to acknowledge w. stop_ack.
  begin                             // Steps 1.4 and 5.4.
                                    // Ask tcu to perform a flush reset.
                                    // It will:
                                    // 1) Deassert clk_stop to each of the 17
                                    //    clock domains in a staggered fashion.
                                    // 2) Assert se and drive the data-in at the
                                    //    head of each scan chain to 0.
                                    // 3) Wait for se to propagate throughout
                                    //    the chip.
                                    // 4) Wait for the reset value (0) to
                                    //    propagate along the length of each
                                    //    scan chain.
                                    // 5) Deassert se.
                                    // 6) Wait for se to propagate throughout
                                    //    the chip.
                                    // 1) Reassert clk_stop to each of the 17
                                    //    clock domains in a staggered fashion.

                                    // Tcu requires these signals to deassert.
    rst_rst_por_sm_      =`DEASSERT;// In accord with Reset Unit spec. Fig 5.
    rst_l2_por_sys_      =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_l2_wmr_sys_      =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_cmp_ctl_wmr_sys_ =`DEASSERT;// Hold rst_cmp_ctl until sync_stable.
    rst_niu_mac_sm_      =  `ASSERT;// Hold IP blocks in reset for LOCK_TIME.
    rst_niu_wmr_sm_      =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_dmu_async_por_sm_=  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_por_sm_  =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_wmr_sm_  =  `ASSERT;// Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys  =  1'b0;   // POR, not WMR.
// 
// Above 2 assertions of rst_por_, and rst_wmr_
// commented out Feb 26 '05 because:
// EXPECT MISMATCH
//         TIME:5612764 CYCLE:      0
//         Signal: rst.rst_por_.0
//                 Exp Value:      1 : 1
//                 Actual Value:   0 : 0
// VERIFICATION ERROR: Expect mismatch      Location:
// CALL in program tcu_top_test            (tcu_top.vr, line 102, cycle 0);
// CALL in function tcu_diag               (diag.vr, line 35, cycle 0);
// CALL in task SystemReset.runRstSequence (sys_reset.vr, line 141, cycle 0);
// WAIT_ON_EXPECT in task SystemReset.prstDeassert
//                                         (sys_reset.vr, line 426, cycle 0)

    rt_flush_stop_req_sys  =  1'b1; // Req. tcu to stop            w. stop_req.
    if (
    tr_flush_stop_ack_sys  == 1'b1) // Wait for tcu to acknowledge w. stop_ack.
      state_d = `POR1_BISX_DONE;    // tcu has finished POR 1 flush stop.
    else
      state_d = `POR1_FLUSH_STOP_ACK;
  end

  `POR1_BISX_DONE:                  // Wait for tcu_bisx_done_sys.
  begin                             // Steps 1.4 and 5.4.
    rst_l2_por_sys_      =`DEASSERT;// Start IP blocks for EFU.
    rst_l2_wmr_sys_      =`DEASSERT;// Start IP blocks for EFU.
    rst_cmp_ctl_wmr_sys_ =`DEASSERT;// Hold rst_cmp_ctl until sync_stable.
    rst_niu_mac_sm_      =`DEASSERT;// Start IP blocks for EFU.
    rst_niu_wmr_sm_      =`DEASSERT;// Start IP blocks for EFU.
    rst_dmu_async_por_sm_=`DEASSERT;// Start IP blocks for EFU.
    rst_dmu_peu_por_sm_  =`DEASSERT;// Start IP blocks for EFU.
    rst_dmu_peu_wmr_sm_  =`DEASSERT;// Start IP blocks for EFU.
    rst_wmr_protect_sys  = 1'b0;    // POR, not WMR.

    if (tcu_bisx_done_sys == 1'b1)  // 
      state_d = `POR2_FLUSH_INIT_ACK;
    else
      state_d = `POR1_BISX_DONE;
  end

  `POR2_FLUSH_INIT_ACK:             // 17'h0004
  begin                             // 
    rt_flush_init_req_sys  =  1'b1; // Req. tcu to init            w. init_req.
    rst_l2_por_sys_    = `DEASSERT; // Stop clks, then reset IP blocks.
    rst_l2_wmr_sys_    = `DEASSERT; // Stop clks, then reset IP blocks.
    rst_niu_mac_sm_    = `DEASSERT; // Stop clks, then reset IP blocks.
    rst_niu_wmr_sm_    = `DEASSERT; // Stop clks, then reset IP blocks.
    rst_dmu_peu_por_sm_= `DEASSERT; // Stop clks, then reset IP blocks.
    rst_dmu_peu_wmr_sm_= `DEASSERT; // Stop clks, then reset IP blocks.
    rst_wmr_protect_sys= 1'b0;      // POR, not WMR.
    if (
    tr_flush_init_ack_sys  == 1'b1) // Wait for tcu to acknowledge w. init_ack.
      state_d = `POR2_LOCK_TIME;    // tcu has finished POR 2 flush init.
    else
      state_d = `POR2_FLUSH_INIT_ACK;
    
  end

  `POR2_LOCK_TIME: //make prop_time // 17'h000-
  begin                             // Step 5.4.2: lock time.
    rst_l2_por_sys_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_l2_wmr_sys_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_niu_mac_sm_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_niu_wmr_sm_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_dmu_peu_por_sm_=   `ASSERT; // Reset IP blocks after init_ack.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Reset IP blocks after init_ack.
    rst_wmr_protect_sys= 1'b0;      // POR, not WMR.
  
    prop_count_run   = 1'b1;        // Allow deassertion of se to prop.
    if (prop_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
      state_d = `POR2_FLUSH_STOP_ACK;
    else
      state_d = `POR2_LOCK_TIME;     
  end

  `POR2_FLUSH_STOP_ACK:             // 
  begin                             // Steps 1.4 and 5.4.
    rt_flush_stop_req_sys  = 1'b1;  // Ask tcu to perform a flush stop.
    rst_l2_por_sys_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_l2_wmr_sys_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_niu_mac_sm_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_niu_wmr_sm_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_por_sm_=   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys= 1'b0;      // POR, not WMR.

    if (tr_flush_stop_ack_sys  == 1'b1)
      state_d = `POR2_EFU_DONE;      // tcu has finished POR 2 flush stop.
    else
      state_d = `POR2_FLUSH_STOP_ACK;
  end

  `POR2_EFU_DONE:
  begin                             // Step 5.10.
    if (tcu_rst_efu_done_sys == 1'b1)   // 
      state_d = `POR2_ASSERT_RUN;   // efu has finished.
    else
      state_d = `POR2_EFU_DONE;
  end


  `POR2_ASSERT_RUN:                 // 
  begin                             // Steps 1.4 and 5.4.
    rst_ncu_unpark_thread_sys = 1'b1;// Hold for 2 cycles to catch a sync_en.
    state_d = `POR2_UNPARK_THREAD;
  end

  `POR2_UNPARK_THREAD:              // 17'h0008
  begin                             // Step 5.4.8.
    rst_ncu_unpark_thread_sys = 1'b1;// Hold for 2 cycles to catch a sync_en.
    state_d = `RST_ARBITER;         // End of POR.
  end

  `WMR1_WMR_GEN:                    // 17'h0010
  begin
    rst_wmr_protect_sys= 1'b1;      // Start protecting before assert
                                    // rt_flush_init_req_sys .
    state_d = `WMR1_DEASSERT_RUN;   // 
  end

  `WMR1_DEASSERT_RUN:               // 17'h0020
  begin
//  rst_wmr_         = 1'b1;        // 
    rst_wmr_protect_sys= 1'b1;      // Start protecting before assert
                                    // rt_flush_init_req_sys .
    state_d = `WMR1_FLUSH_INIT_ACK;
  end

  `WMR1_FLUSH_INIT_ACK:             // 17'h0040
  begin                             // 
    rt_flush_init_req_sys  = 1'b1;  // Ask tcu to perform WMR 1 flush init.
    
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Reset IP blocks, then stop clks.
    rst_niu_wmr_sm_    =   `ASSERT; // Reset IP blocks, then stop clks.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Reset IP blocks, then stop clks.
    rst_wmr_protect_sys= 1'b1;      // Start protecting before assert
                                    // rt_flush_init_req_sys .
    if (tr_flush_init_ack_sys  == 1'b1)
    begin
      if (ccu_rst_change_sys == 1'b1)// Reset PLL and CCU.
      begin
        rst_tcu_clk_stop_sys=1'b1;   // Protect tcu from clk while PLL resets.
      end
      state_d = `WMR1_PRE_PLL1;      // tcu has finished WMR 1 flush init.
    end
    else
      state_d = `WMR1_FLUSH_INIT_ACK;
  end

  `WMR1_PRE_PLL1:                    // 
  begin                             // Time to cross domains before rst_ccu_.
    rst_ccu_pll_sm_    = `DEASSERT; // Reset   PLL             for LOCK_TIME.
    rst_ccu_sm_        = `DEASSERT; // Reset   PLL             for LOCK_TIME.
    cluster_arst_sm_   = `DEASSERT; // Reset   PLL             for LOCK_TIME.
    rst_rst_por_sm_    = `DEASSERT; // Reset   PLL             for LOCK_TIME.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Reset IP blocks after init_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.
    if (ccu_rst_change_sys == 1'b1) // Reset PLL and CCU.
      rst_tcu_clk_stop_sys=1'b1;    // Protect tcu from clk while PLL resets.
    state_d = `WMR1_PRE_PLL2;
  end

  `WMR1_PRE_PLL2:                    // 
  begin                             // Time to cross domains before rst_ccu_.
    rst_ccu_pll_sm_    = `DEASSERT; // Reset   PLL             for LOCK_TIME.
    rst_ccu_sm_        = `DEASSERT; // Reset   PLL             for LOCK_TIME.
    cluster_arst_sm_   = `DEASSERT; // Reset   PLL             for LOCK_TIME.
    rst_rst_por_sm_    = `DEASSERT; // Reset   PLL             for LOCK_TIME.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Reset IP blocks after init_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.
    if (ccu_rst_change_sys == 1'b1) // Reset PLL and CCU.
    begin
      rst_tcu_clk_stop_sys=1'b1;    // Protect tcu from clk while PLL resets.
      state_d = `WMR1_CCU_PLL;
    end
    else
      state_d = `WMR1_PROP_TIME;    // Skip reset of PLL and CCU.
  end

  `WMR1_CCU_PLL:                    // 17'h000-
  begin                             // Step 5.4.2: lock time.
    rst_ccu_pll_sm_    =   `ASSERT; // Reset   PLL             for PROP_TIME.
    rst_ccu_sm_        =   `ASSERT; // Reset   PLL             for LOCK_TIME.
    cluster_arst_sm_   =   `ASSERT; // Reset   PLL             for LOCK_TIME.
    rst_rst_por_sm_    =   `ASSERT; // Reset   PLL             for LOCK_TIME.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Reset IP blocks after init_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.
    rst_tcu_clk_stop_sys=1'b1;      // Protect tcu from clk while PLL resets.
    
    prop_count_run   = 1'b1;        // Allow PLL to reset for PROP_TIME.
    if (prop_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0) 
      state_d = `WMR1_LOCK_TIME;
    else
      state_d = `WMR1_CCU_PLL;
  end

  `WMR1_LOCK_TIME:                  // 17'h0080
  begin                             // Step 5.4.2: lock time.
    rst_ccu_pll_sm_    = `DEASSERT; // Release PLL  from reset for LOCK_TIME.
    rst_ccu_sm_        =   `ASSERT; // Reset   PLL             for LOCK_TIME.
    cluster_arst_sm_   =   `ASSERT; // Reset   PLL             for LOCK_TIME.
    rst_rst_por_sm_    =   `ASSERT; // Reset   PLL             for LOCK_TIME.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.
    rst_tcu_clk_stop_sys=1'b1;      // Protect tcu from clk while PLL resets.
  
    lock_count_run     = 1'b1;      // PLL lock, + flush reset, for LOCK_TIME.
    if (lock_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
      state_d = `WMR1_ARST_TIME;    // 
    else
      state_d = `WMR1_LOCK_TIME;     
  end

  `WMR1_ARST_TIME:                  // 17'h0080
  begin                             // Step 5.4.2: lock time.
    rst_ccu_pll_sm_    = `DEASSERT; // Release PLL  from reset for LOCK_TIME.
    rst_ccu_sm_        = `DEASSERT; // Reset   PLL             for LOCK_TIME.
    cluster_arst_sm_   =   `ASSERT; // Reset   PLL             for LOCK_TIME.
    rst_rst_por_sm_    =   `ASSERT; // Sync reset of rst sync_en flops.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.
    rst_tcu_clk_stop_sys=1'b1;      // Protect tcu from clk while PLL resets.
  
    ccu_count_run     = 1'b1;       // Deassert rst_ccu_ before cluster_arst_l.
    if (ccu_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
    begin
      ccu_count_run   = 1'b0;       // Clear counter before use next cycle.
      state_d = `WMR1_SYNC_STABLE;
    end
    else
      state_d = `WMR1_ARST_TIME;     
  end

  `WMR1_SYNC_STABLE:                // 
  begin                             // 
    rst_ccu_pll_sm_    = `DEASSERT; // Wait for ccu to say sync_en OK.
    rst_ccu_sm_        = `DEASSERT; // Wait for ccu to say sync_en OK.
    cluster_arst_sm_   = `DEASSERT; // Wait for ccu to say sync_en OK.
    rst_rst_por_sm_    = `DEASSERT; // Wait for ccu to say sync_en OK.
  //rst_rst_wmr_sm_    =   `ASSERT; // Sync reset of rst sync_en flops,
  //                                // since l2clk and iol2clk now running.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.
    rst_tcu_clk_stop_sys=1'b0;      // Expose tcu to clk now that PLL is stable.

    ccu_count_run    = 1'b1;        // Allow ccu_*_sync_en signals to settle.
    if (
    //ccu_rst_sync_stable  == 1'b1) // Wait for ccu to say sync_en OK.
        ccu_count_q[`RST_TIME_WIDTH-1:0]  == `RST_TIME_WIDTH'b0)
                                    // Cannot use ccu_rst_sync_stable
                                    // because cannot cross clock domains
                                    // because need to
                                    // allow ccu_*_sync_en signals to settle.
      state_d = `WMR1_FLUSH_STOP_ACK;
    else
      state_d = `WMR1_SYNC_STABLE;
  end

  `WMR1_PROP_TIME:                  // Skip reset of PLL and CCU.
                                    // (ccu_rst_change_sys == 1'b0)
  begin                             // Step 5.4.2: lock time.
    rst_ccu_pll_sm_    = `DEASSERT; // ccu_rst_change_sys == 0.
    rst_ccu_sm_        = `DEASSERT; // ccu_rst_change_sys == 0.
    cluster_arst_sm_   = `DEASSERT; // ccu_rst_change_sys == 0.
    rst_rst_por_sm_    = `DEASSERT; // ccu_rst_change_sys == 0.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Reset IP blocks after init_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Reset IP blocks after init_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.
    rst_tcu_clk_stop_sys=1'b0;      // Expose tcu to clk now that PLL is stable.
    
    prop_count_run   = 1'b1;        // Allow flush reset for PROP_TIME.
    if (prop_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0) 
      state_d = `WMR1_FLUSH_STOP_ACK;
    else
      state_d = `WMR1_PROP_TIME;
  end

  `WMR1_FLUSH_STOP_ACK:             // 
  begin                             // Steps 1.4 and 5.4.
    rt_flush_stop_req_sys  = 1'b1;  // Ask tcu to perform WMR 1 flush stop.
                                    // Replace with tr_flush_stop_ack_sys .
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.

    if (tr_flush_stop_ack_sys  == 1'b1) // 
      state_d = `WMR1_BISX_DONE     ;// tcu has finished WMR 1 flush stop.
    else
      state_d = `WMR1_FLUSH_STOP_ACK;
  end

  `WMR1_BISX_DONE:                  // 
  begin                             // 
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    = `DEASSERT; // Release from reset during Bist 2.      
    rst_niu_wmr_sm_    = `DEASSERT; // Release from reset during Bist 2.      
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_= `DEASSERT; // Release from reset during Bist 2.      
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.

    if (tcu_bisx_done_sys  == 1'b1) // 
      state_d = `WMR2_FLUSH_INIT_ACK;// tcu has finished Bist 2.
    else
      state_d = `WMR1_BISX_DONE;
  end

  `WMR2_FLUSH_INIT_ACK:             // 17'h0040
  begin                             // 
    rt_flush_init_req_sys  = 1'b1;  // Ask tcu to perform WMR 2 flush init.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    = `DEASSERT; // Stop clks, then reset IP blocks.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    = `DEASSERT; // Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // Stop clks, then reset IP blocks.
    rst_dmu_peu_wmr_sm_= `DEASSERT; // Stop clks, then reset IP blocks.
    rst_wmr_protect_sys= 1'b1;      // Protect until tr_flush_init_ack_sys .

    if (tr_flush_init_ack_sys  == 1'b1) // 
      state_d = `WMR2_PROP_TIME;     // tcu has finished WMR 2 flush init.
    else
      state_d = `WMR2_FLUSH_INIT_ACK;
  end

  `WMR2_PROP_TIME:                  // 17'h0080
  begin                             // Step 5.4.2: lock time.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect until tr_flush_init_ack_sys .
                                    // (Review.)
  
    prop_count_run     = 1'b1;      // Allow deassertion of se to prop.
    if (prop_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
      state_d = `WMR2_FLUSH_STOP_ACK;
    else
      state_d = `WMR2_PROP_TIME;     
  end

  `WMR2_FLUSH_STOP_ACK:             // 
  begin                             // Steps 1.4 and 5.4.
    rt_flush_stop_req_sys  = 1'b1;  // Ask tcu to perform WMR 1 flush stop.
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Hold IP blocks in reset until stop_ack.
    rst_wmr_protect_sys= 1'b1;      // Protect until tr_flush_init_ack_sys .
                                    // (Review.)

    if (tr_flush_stop_ack_sys  == 1'b1) // 
                                    // Replace with tr_flush_stop_ack_sys .
      if (reset_gen_dbr_gen_q    == 1'b1)
      state_d = `WMR2_ASSERT_RUN   ;// DBR same as WMR, but leave NIU running.
      else
      state_d = `WMR2_NIU_TIME     ;// tcu has finished WMR 2 flush stop.
    else
      state_d = `WMR2_FLUSH_STOP_ACK;
  end

  `WMR2_NIU_TIME      :             // 
  begin                             // 
    rst_l2_por_sys_    = `DEASSERT; // WMR, not POR.
    rst_l2_wmr_sys_    =   `ASSERT; // Hold in reset along with NIU.
    rst_niu_mac_sm_    =  assert_mac_during_wmr ? `ASSERT : `DEASSERT;
    rst_niu_wmr_sm_    =   `ASSERT; // Hold NIU in reset now that clocks run.
    rst_dmu_peu_por_sm_= `DEASSERT; // WMR, not POR.
    rst_dmu_peu_wmr_sm_=   `ASSERT; // Hold in reset along with NIU.
    rst_wmr_protect_sys= 1'b1;      // Protect during WMR.

    niu_count_run      = 1'b1;      // Allow mac in niu to reset now clocks run.
    if (niu_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
      state_d = `WMR2_ASSERT_RUN    ;
    else
      state_d = `WMR2_NIU_TIME;
  end

  `WMR2_ASSERT_RUN:                 // 
  begin                             // Steps 1.4 and 5.4.
    rst_ncu_unpark_thread_sys   = 1'b1;// Hold for 2 cycles to catch a sync_en.
    state_d = `WMR2_UNPARK_THREAD;
  end

  `WMR2_UNPARK_THREAD:              // 17'h0008
  begin                             // Step 5.4.8.
    rst_ncu_unpark_thread_sys   = 1'b1;// Hold for 2 cycles to catch a sync_en.
    if (reset_gen_wmr_gen_q    == 1'b1)
      rst_WMR_done              = 1'b1;// WMR done.  Clear WMR_GEN bit.
    if (reset_gen_dbr_gen_q    == 1'b1)
      rst_DBR_done              = 1'b1;// DBR done.  Clear DBR_GEN bit.
    state_d = `RST_ARBITER;
  end

  `RST_ARBITER:
  begin
    rst_ncu_unpark_thread_sys   = 1'b1;
    rst_assert_ssi_sync_din     = 1'b1;   // Set on return to RST_ARBITER.
    rst_assert_ssi_sync_en      = 1'b1;   // Set on return to RST_ARBITER.
    if ( rst_fatal_or          == 1'b1)   // ncu | l2t0 | ... | l2t7
    begin
      rst_assert_ssi_sync_din   = 1'b0;   // Until return to RST_ARBITER.
      rset_stat_wmr_set         = 1'b1;   // Set WMR bit in RSET_STAT
                                          // and clear RESET_FEE.
      state_d                   = `WMR1_WMR_GEN;
    end
    else
    if ((reset_gen_wmr_gen_q == 1'b1   ) |
        (mio_rst_pb_rst_sys3_== `ASSERT) )// Review May01'05.
                                          // No need to debounce PB_RST_L.
                                          // FPGA will send it debounced.
    begin
      rst_assert_ssi_sync_din   = 1'b0;   // Until return to RST_ARBITER.
      rset_stat_wmr_set         = 1'b1;   // Set WMR bit in RSET_STAT
                                          // and clear RESET_FEE.
      if (mio_rst_pb_rst_sys3_== `ASSERT)
        reset_source_pb_rst_set = 1'b1;   // Set PB_RST bit in RESET_SOURCE.
      state_d                   = `WMR1_WMR_GEN;
    end
    else
    if  (reset_gen_dbr_gen_q == 1'b1   )
    begin
      rst_assert_ssi_sync_din   = 1'b0;   // Until return to RST_ARBITER.
      rset_stat_wmr_set         = 1'b1;   // Set WMR bit in RSET_STAT
                                          // (Review Aug 3 '05)
                                          // Set DBR bit in RSET_STAT?
                                          // and clear RESET_FEE.
      state_d                   = `WMR1_WMR_GEN;
    end
    else
      state_d = `RST_ARBITER;
  end

  default: // This clause sets all state machine outputs to unknown.
  begin    // 
    lock_count_run            = 1'b0;      // Unknown.
    prop_count_run            = 1'b0;      // Unknown.
    niu_count_run             = 1'b0;      // Unknown.
    ccu_count_run             = 1'b0;      // Unknown.
    
    rst_ccu_pll_sm_           = 1'b0;      // Unknown.
    rst_ccu_sm_               = 1'b0;      // Unknown.
    cluster_arst_sm_          = 1'b0;      // Unknown.
    rst_rst_por_sm_           = 1'b0;      // Unknown.
    rst_l2_por_sys_           = 1'b0;      // Unknown.
    rst_l2_wmr_sys_           = 1'b0;      // Unknown.
    rst_niu_mac_sm_           = 1'b0;      // Unknown.
    rst_niu_wmr_sm_           = 1'b0;      // Unknown.
    rst_dmu_async_por_sm_     = 1'b0;      // Unknown.
    rst_dmu_peu_por_sm_       = 1'b0;      // Unknown.
    rst_dmu_peu_wmr_sm_       = 1'b0;      // Unknown.
    rst_wmr_protect_sys       = 1'b0;      // Unknown.
    rst_tcu_clk_stop_sys      = 1'b0;      // Unknown.
    
    rst_ncu_unpark_thread_sys = 1'b0;      // Unknown.
    rt_flush_init_req_sys     = 1'b0;      // Unknown.
    rt_flush_stop_req_sys     = 1'b0;      // Unknown.
    rt_asicflush_stop_req_sys = 1'b0;      // Unknown.
    rst_WMR_done              = 1'b0;      // Unknown.
    rst_DBR_done              = 1'b0;      // Unknown.
    rst_assert_ssi_sync_en    = 1'b0;      // Unknown.
    rst_assert_ssi_sync_din   = 1'b0;      // Unknown.
    rset_stat_wmr_set         = 1'b0;      // Unknown.
    reset_source_pb_rst_set   = 1'b0;      // Unknown.
    
    state_d           = `RST_FSM_WIDTH'b0; // Unknown.

//  // copied the following from dmu_imu_rds_msi_addr_decode.v:
//  // vlint flag_system_call off
//  // synopsys translate_off
//  if(daemon_csrbus_valid)
//  begin // axis tbcall_region
//    `PR_ERROR(
//      "rst_fsm_ctl",
//      `MON_ERROR,
//      "ERROR: case (state_q) in module rst_fsm_ctl entered default: case.");
//  end // end of tbcall_region
//  // synopsys translate_on
//  // vlint flag_system_call on

  end      

  // default: // This clause mollifies the following vlint error:
  // begin    // flag_not_all_case_items_are_specified (1) : (state_q)
  // end      // missing pattern: 00000000000000000000
  //          // Instead, this clause induces the following vlint error:
  //***********************************************************************
  // flag_empty_block (1)
  //***********************************************************************

  // *** EMPTY BLOCK ...
  //     in module: rst_fsm_ctl
  //     in line 597754 of file
  //     /import/n2-svl-regress10/vlint_run/fc8/v.fc8/fc/rel-0.1/sunvDir/cpu.v

endcase
end
//________________________________________________________________
//
//      end of reset sequence state_q state machine (always block)
//________________________________________________________________

reg  [1:0] xir_state_d;                           // Next state.
wire [1:0] xir_state_d_phy = {xir_state_d    [1], // Reset to 1.
                             ~xir_state_d    [0] };
wire [1:0] xir_state_q_phy;                       // Current state.
wire [1:0] xir_state_q     = {xir_state_q_phy[1], // Reset to 1.
                             ~xir_state_q_phy[0] };
//________________________________________________________________
//
//                        xir_state_q state machine (always block)
//________________________________________________________________

always @(
  xir_state_q               or
  state_q                   or
  reset_gen_xir_gen_q       or
  mio_rst_button_xir_sys_   or
  ncu_rst_xir_done_sys2     )
begin  // Reset sequence state machine
rst_ncu_xir_sys_         = `DEASSERT; // Default value.
reset_source_pb_xir_set  = 1'b0;      // Default value.
reset_source_xir_gen_set = 1'b0;      // Default value.
reset_gen_xir_gen_clr    = 1'b0;      // Default value.
xir_state_d              = `XIR_IDLE; // Default value.

case (xir_state_q) // synopsys parallel_case
                   // syn-op-sys full_case not applicable since one-hot.
                   /* 0in case
                      -parallel
                      -default
                      -active  (mio_rst_pwron_rst_l === 1'b1)
                      -message "XIR Reset Unit state machine case bad."
                   */

  `XIR_IDLE: // Look for mio_rst_button_xir_sys_.
  begin                                  // No need to debounce BUTTON_XIR_L.
                                         // FPGA will send it debounced.
    if ( ((mio_rst_button_xir_sys_== `ASSERT) |
          (reset_gen_xir_gen_q    == 1'b1   ) )    &
         ( state_q                == `RST_ARBITER) )// XIR has lowest priority.
    begin
      rst_ncu_xir_sys_ = `ASSERT;
      if  (mio_rst_button_xir_sys_== `ASSERT)
          reset_source_pb_xir_set    = 1'b1;// Set PB_XIR  bit in RESET_SOURCE.
      else
          reset_source_xir_gen_set   = 1'b1;// Set XIR_GEN bit in RESET_SOURCE.
      xir_state_d      = `XIR_DONE;// Wait for NCU to finish XIR.
    end
    else
    begin
      rst_ncu_xir_sys_ = `DEASSERT;
      xir_state_d      = `XIR_IDLE;// Look for mio_rst_button_xir_sys_.
    end
  end

  `XIR_DONE: // Wait for NCU to finish XIR.
  begin
    if ( (ncu_rst_xir_done_sys2 == 1'b1        ) |
         (state_q               != `RST_ARBITER) ) // XIR has lowest priority.
    begin
                                   // reset_gen_xir_gen_en and
				   // reset_gen_xir_gen_din logic depends on
				   // ncu_rst_xir_done_sys2.
      rst_ncu_xir_sys_ = `DEASSERT;
      reset_gen_xir_gen_clr = 1'b1;// Clear XIR_GEN bit in RESET_GEN
                                   // (even if we're servicing a BUTTON_XIR).
      xir_state_d      = `XIR_IDLE;// NCU has finished XIR.
    end
    else
    begin
      rst_ncu_xir_sys_ = `ASSERT;
      xir_state_d      = `XIR_DONE;// Wait for NCU to finish XIR.
    end
  end

  default: // This clause sets all state machine outputs to unknown.
  begin    // 
    rst_ncu_xir_sys_         = 1'b0; // Unknown.
    reset_source_pb_xir_set  = 1'b0; // Unknown.
    reset_source_xir_gen_set = 1'b0; // Unknown.
    reset_gen_xir_gen_clr    = 1'b0; // Unknown.
    xir_state_d              = 2'b0; // Unknown.

//  // copied the following from dmu_imu_rds_msi_addr_decode.v:
//  // vlint flag_system_call off
//  // synopsys translate_off
//  if(daemon_csrbus_valid)
//  begin // axis tbcall_region
//    `PR_ERROR(
//      "rst_fsm_ctl",
//      `MON_ERROR,
//      "ERROR: State machine state_q for module rst_fsm_ctl is bad.");
//  end // end of tbcall_region
//  // synopsys translate_on
//  // vlint flag_system_call on

  end      

endcase
end
//________________________________________________________________
//
//                 end of xir_state_q state machine (always block)
//________________________________________________________________

reg  [2:0] dmu_state_d;                             // Next state.
wire [2:0] dmu_state_d_phy = {dmu_state_d    [2:1], // Reset to 1.
                             ~dmu_state_d    [  0] };
wire [2:0] dmu_state_q_phy;                         // Current state.
wire [2:0] dmu_state_q     = {dmu_state_q_phy[2:1], // Reset to 1.
                             ~dmu_state_q_phy[  0] };
//________________________________________________________________
//
//                        dmu_state_q state machine (always block)
//________________________________________________________________

always @(
  dmu_state_q               or
      state_q               or
  ssys_reset_dmu_q          or
  niu_count_q               ) // Use 8 us niu counter twice: 15 <= 8+8 us.
begin  // Reset sequence state machine

niu_count_run_dmu_sm     = 1'b0;      // Default value.
ssys_reset_dmu_clr       = 1'b0;      // Default value.
rst_dmu_ssys_sm_         = `DEASSERT; // Default value.
dmu_state_d              = `DMU_IDLE; // Default value.

case (dmu_state_q) // synopsys parallel_case
                   // syn-op-sys full_case not applicable since one-hot.
                   /* 0in case
                      -parallel
                      -default
                      -active  (mio_rst_pwron_rst_l === 1'b1)
                      -message "DMU Reset Unit state machine case bad."
                   */

  `DMU_IDLE: // Look for DMU_PEU bit of SSYS_RESET
  begin                  
    if ( (ssys_reset_dmu_q       ) & // DMU_PEU bit of SSYS_RESET
         (state_q == `RST_ARBITER) ) // DMU-PEU has lowest priority.
    begin
      rst_dmu_ssys_sm_ = `ASSERT;
      dmu_state_d      = `DMU_TIME1;// Give DMU time to reset.
    end
    else
    begin
      rst_dmu_ssys_sm_ = `DEASSERT;
      dmu_state_d      = `DMU_IDLE; // Look for DMU_PEU bit of SSYS_RESET.
    end
  end

  `DMU_TIME1:                      // Give DMU time to reset, part 1.
  begin
    if (state_q != `RST_ARBITER)   // DMU has lowest priority.
    begin
      rst_dmu_ssys_sm_ = `DEASSERT;
      dmu_state_d      = `DMU_IDLE;// Another, higher-priority
    end                            // reset has occurred.
    else
    begin
      rst_dmu_ssys_sm_ = `ASSERT;

      niu_count_run_dmu_sm       = 1'b1;      // Allow dmu to reset.
      if (niu_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
        begin
          niu_count_run_dmu_sm   = 1'b0;      // Get counter ready for another go.
          dmu_state_d  = `DMU_TIME2;// Give DMU time to reset, part 2.
        end
      else
        dmu_state_d    = `DMU_TIME1;// Give DMU time to reset, part 1.
    end
  end

  `DMU_TIME2:                       // Give DMU time to reset, part 2.
  begin
    if (state_q != `RST_ARBITER)    // DMU has lowest priority.
    begin
      rst_dmu_ssys_sm_ = `DEASSERT;
      dmu_state_d      = `DMU_IDLE; // Another, higher-priority
    end                             // reset has occurred.
    else
    begin
      rst_dmu_ssys_sm_ = `ASSERT;

      niu_count_run_dmu_sm       = 1'b1;      // Allow dmu to reset.
      if (niu_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
      begin
	ssys_reset_dmu_clr       = 1'b1;      // Clear DMU_PEU bit of
                                              // SSYS_RESET register
        dmu_state_d    = `DMU_IDLE; // DMU done resetting.
      end
      else
        dmu_state_d    = `DMU_TIME2;// Give DMU time to reset, part 2.
    end
  end

  default: // This clause sets all state machine outputs to unknown.
  begin    // 
    rst_dmu_ssys_sm_         = 1'b0; // Unknown.
    ssys_reset_dmu_clr       = 1'b0; // Unknown.
    niu_count_run_dmu_sm     = 1'b0; // Unknown.
    dmu_state_d              = 3'b0; // Unknown.

//  // copied the following from dmu_imu_rds_msi_addr_decode.v:
//  // vlint flag_system_call off
//  // synopsys translate_off
//  if(daemon_csrbus_valid)
//  begin // axis tbcall_region
//    `PR_ERROR(
//    "rst_fsm_ctl",
//    `MON_ERROR,
//    "ERROR: case (dmu_state_q) in module rst_fsm_ctl entered default: case.");
//  end // end of tbcall_region
//  // synopsys translate_on
//  // vlint flag_system_call on

  end      

endcase
end
//________________________________________________________________
//
//                 end of dmu_state_q state machine (always block)
//________________________________________________________________

reg  [1:0] niu_state_d;                             // Next state.
wire [1:0] niu_state_d_phy = {niu_state_d    [  1], // Reset to 1.
                             ~niu_state_d    [  0] };
wire [1:0] niu_state_q_phy;                         // Current state.
wire [1:0] niu_state_q     = {niu_state_q_phy[  1], // Reset to 1.
                             ~niu_state_q_phy[  0] };
//________________________________________________________________
//
//                        niu_state_q state machine (always block)
//________________________________________________________________

always @(
  niu_state_q               or
      state_q               or
  ssys_reset_niu_q          or
  niu_count_q               ) // Re-use 8 us niu counter: 4 us <= 8 us.
begin  // Reset sequence state machine

niu_count_run_niu_sm     = 1'b0;      // Default value.
ssys_reset_niu_clr       = 1'b0;      // Default value.
rst_niu_ssys_sm_         = `DEASSERT; // Default value.
niu_state_d              = `NIU_IDLE; // Default value.

case (niu_state_q) // synopsys parallel_case
                   // syn-op-sys full_case not applicable since one-hot.
                   /* 0in case
                      -parallel
                      -default
                      -active  (mio_rst_pwron_rst_l === 1'b1)
                      -message "NIU Reset Unit state machine case bad."
                   */

  `NIU_IDLE: // Look for NIU bit of SSYS_RESET
  begin                  
    if ( (ssys_reset_niu_q       ) & // NIU bit of SSYS_RESET
         (state_q == `RST_ARBITER) ) // NIU has lowest priority.
    begin
      rst_niu_ssys_sm_ = `ASSERT;
      niu_state_d      = `NIU_TIME; // Give DMU time to reset.
    end
    else
    begin
      rst_niu_ssys_sm_ = `DEASSERT;
      niu_state_d      = `NIU_IDLE; // Look for NIU bit of SSYS_RESET.
    end
  end

  `NIU_TIME:                        // Give DMU time to reset, part 2.
  begin
    if (state_q != `RST_ARBITER)    // DMU has lowest priority.
    begin
      rst_niu_ssys_sm_ = `DEASSERT;
      niu_state_d      = `NIU_IDLE; // Another, higher-priority
    end                             // reset has occurred.
    else
    begin
      rst_niu_ssys_sm_ = `ASSERT;

      niu_count_run_niu_sm       = 1'b1;      // Allow dmu to reset.
      if (niu_count_q[`RST_TIME_WIDTH-1:0] == `RST_TIME_WIDTH'b0)
      begin
        ssys_reset_niu_clr       = 1'b1;      // Clear NIU bit of SSY_RESET.
        niu_state_d    = `NIU_IDLE; // DMU done resetting.
      end
      else
        niu_state_d    = `NIU_TIME; // Give DMU time to reset, part 2.
    end
  end

  default: // This clause sets all state machine outputs to unknown.
  begin    //
    rst_niu_ssys_sm_         = 1'b0; // Unknown.
    ssys_reset_niu_clr       = 1'b0; // Unknown.
    niu_count_run_niu_sm     = 1'b0; // Unknown.
    niu_state_d              = 2'b0; // Unknown.

//  // copied the following from dmu_imu_rds_msi_addr_decode.v:
//  // vlint flag_system_call off
//  // synopsys translate_off
//  if(daemon_csrbus_valid)
//  begin // axis tbcall_region
//    `PR_ERROR(
//    "rst_fsm_ctl",
//    `MON_ERROR,
//    "ERROR: case (niu_state_q) in module rst_fsm_ctl entered default: case.");
//  end // end of tbcall_region
//  // synopsys translate_on
//  // vlint flag_system_call on

  end      

endcase
end
//________________________________________________________________
//
//                 end of niu_state_q state machine (always block)
//________________________________________________________________

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_33 state_ff         
    (.din     (state_d_phy[`RST_FSM_WIDTH-1:0]),
     .scan_in (state_ff_scanin ),
     .scan_out(state_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk           ),
     .dout    (state_q_phy[`RST_FSM_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_2 xir_state_ff         
    (.din     (xir_state_d_phy[1:0]),
     .scan_in (xir_state_ff_scanin ),
     .scan_out(xir_state_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk               ),
     .dout    (xir_state_q_phy[1:0]),
  .siclk(siclk),
  .soclk(soclk));

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_3 dmu_state_ff         
    (.din     (dmu_state_d_phy[2:0]),
     .scan_in (dmu_state_ff_scanin ),
     .scan_out(dmu_state_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk               ),
     .dout    (dmu_state_q_phy[2:0]),
  .siclk(siclk),
  .soclk(soclk));

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_2 niu_state_ff         
    (.din     (niu_state_d_phy[1:0]),
     .scan_in (niu_state_ff_scanin ),
     .scan_out(niu_state_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_),
     .l1clk   (l1clk               ),
     .dout    (niu_state_q_phy[1:0]),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

always @(state_q)
begin
case    (state_q) // synopsys parallel_case
                  // syn-op-sys full_case not applicable since one-hot.
                  /* 0in case
                     -parallel
                     -default
                     -active  (mio_rst_pwron_rst_l === 1'b1)
                     -message
                     "rst_mio_rst_state Reset Unit state machine case bad."
                  */

                                                           // Should never see:
  `RST_FSM_WIDTH'h0       : rst_mio_rst_state[5:0] = 6'd63;//33'h0_0000_0000 No
  `RST_INIT_STATE         : rst_mio_rst_state[5:0] = 6'd00;//33'h0_0000_0001
  `POR1_LOCK_TIME         : rst_mio_rst_state[5:0] = 6'd01;//33'h0_0000_0002
  `POR1_ARST_TIME         : rst_mio_rst_state[5:0] = 6'd02;//33'h0_0000_0004
  `POR1_SYNC_STABLE       : rst_mio_rst_state[5:0] = 6'd03;//33'h0_0000_0008
  `POR1_ASICFLUSH_STOP_ACK: rst_mio_rst_state[5:0] = 6'd04;//33'h0_0000_0010
  `POR1_NIU_TIME          : rst_mio_rst_state[5:0] = 6'd05;//33'h0_0000_0020
  `POR1_FLUSH_STOP_ACK    : rst_mio_rst_state[5:0] = 6'd06;//33'h0_0000_0040
  `POR1_BISX_DONE         : rst_mio_rst_state[5:0] = 6'd07;//33'h0_0000_0080
  `POR2_FLUSH_INIT_ACK    : rst_mio_rst_state[5:0] = 6'd08;//33'h0_0000_0100
  `POR2_LOCK_TIME         : rst_mio_rst_state[5:0] = 6'd09;//33'h0_0000_0200
  `POR2_FLUSH_STOP_ACK    : rst_mio_rst_state[5:0] = 6'd10;//33'h0_0000_0400
  `POR2_EFU_DONE          : rst_mio_rst_state[5:0] = 6'd11;//33'h0_0000_0800
  `POR2_ASSERT_RUN        : rst_mio_rst_state[5:0] = 6'd12;//33'h0_0000_1000
  `POR2_UNPARK_THREAD     : rst_mio_rst_state[5:0] = 6'd13;//33'h0_0000_2000
  `WMR1_WMR_GEN           : rst_mio_rst_state[5:0] = 6'd14;//33'h0_0000_4000
  `WMR1_DEASSERT_RUN      : rst_mio_rst_state[5:0] = 6'd15;//33'h0_0000_8000
  `WMR1_FLUSH_INIT_ACK    : rst_mio_rst_state[5:0] = 6'd16;//33'h0_0001_0000
  `WMR1_PRE_PLL1          : rst_mio_rst_state[5:0] = 6'd17;//33'h0_0002_0000
  `WMR1_PRE_PLL2          : rst_mio_rst_state[5:0] = 6'd18;//33'h0_0004_0000
  `WMR1_CCU_PLL           : rst_mio_rst_state[5:0] = 6'd19;//33'h0_0008_0000
  `WMR1_LOCK_TIME         : rst_mio_rst_state[5:0] = 6'd20;//33'h0_0010_0000
  `WMR1_ARST_TIME         : rst_mio_rst_state[5:0] = 6'd21;//33'h0_0020_0000
  `WMR1_PROP_TIME         : rst_mio_rst_state[5:0] = 6'd22;//33'h0_0040_0000
  `WMR1_SYNC_STABLE       : rst_mio_rst_state[5:0] = 6'd23;//33'h0_0080_0000
  `WMR1_FLUSH_STOP_ACK    : rst_mio_rst_state[5:0] = 6'd24;//33'h0_0100_0000
  `WMR1_BISX_DONE         : rst_mio_rst_state[5:0] = 6'd25;//33'h0_0200_0000
  `WMR2_FLUSH_INIT_ACK    : rst_mio_rst_state[5:0] = 6'd26;//33'h0_0400_0000
  `WMR2_PROP_TIME         : rst_mio_rst_state[5:0] = 6'd27;//33'h0_0800_0000
  `WMR2_FLUSH_STOP_ACK    : rst_mio_rst_state[5:0] = 6'd28;//33'h0_1000_0000
  `WMR2_NIU_TIME          : rst_mio_rst_state[5:0] = 6'd32;//33'h1_1000_0000
  `WMR2_ASSERT_RUN        : rst_mio_rst_state[5:0] = 6'd29;//33'h0_2000_0000
  `WMR2_UNPARK_THREAD     : rst_mio_rst_state[5:0] = 6'd30;//33'h0_4000_0000
  `RST_ARBITER            : rst_mio_rst_state[5:0] = 6'd31;//33'h0_8000_0000
  default                 :                                // Should never see:
  begin                     rst_mio_rst_state[5:0] = 6'd62;//33'hx_xxxx_xxxx No

//  // copied the following from dmu_imu_rds_msi_addr_decode.v:
//  // vlint flag_system_call off
//  // synopsys translate_off
//  if(daemon_csrbus_valid)
//  begin // axis tbcall_region
//    `PR_ERROR(
//    "rst_fsm_ctl",
//    `MON_ERROR,
//    "ERROR: case (state_q) for rst_mio_rst_state[5:0] in module rst_fsm_ctl entered default: case.");
//  end // end of tbcall_region
//  // synopsys translate_on
//  // vlint flag_system_call on

  end

//default: // This clause mollifies the following vlint error:
//begin    // flag_not_all_case_items_are_specified (1) : (state_q)
//end      // missing pattern: 00000000000000000000
           // Instead, this clause induces the following vlint error:
  //***********************************************************************
  // flag_empty_block (1)
  //***********************************************************************

  // *** EMPTY BLOCK ...
  //     in module: rst_fsm_ctl
  //     in line 597754 of file
  //     /import/n2-svl-regress10/vlint_run/fc8/v.fc8/fc/rel-0.1/sunvDir/cpu.v
endcase

end  // Reset Unit state output to debug port (always block)

//________________________________________________________________
//
//               Output mux
//________________________________________________________________

assign data_out_sys[`RST_UCB_DATA_WIDTH-1:0] =

  reset_gen_addr   ?{12'b0,reset_gen_q   [                3:0] }:// RESET_GEN
  reset_source_addr?{      reset_source_q[               15:0] }:// RESET_SOURCE
  ssys_reset_addr  ?{ 9'b0,ssys_reset_q  [                6:0] }:// SSYS_RESET
  rset_stat_addr   ?{ 4'b0,rset_stat_q   [               11:0] }:// RSET_STAT
  lock_time_addr   ?{      lock_time_q   [`RST_TIME_WIDTH-1:0] }:// LOCK_TIME
  prop_time_addr   ?{      prop_time_q   [`RST_TIME_WIDTH-1:0] }:// PROP_TIME
  niu_time_addr    ?{      niu_time_q    [`RST_TIME_WIDTH-1:0] }:// NIU_TIME
  ccu_time_addr    ?{      ccu_time_q    [`RST_TIME_WIDTH-1:0] }:// CCU_TIME
  reset_fee_addr   ?{      reset_fee_q   [                7:0],  // RESET_FEE
                      8'b0                                     }:// RESET_FEE
    `RST_UCB_DATA_WIDTH'b0                                      ;// (default)

wire iob_creg_addr    = 
  (
  reset_gen_addr    | // RESET_GEN
  reset_source_addr | // RESET_SOURCE
  ssys_reset_addr   | // SSYS_RESET
  rset_stat_addr    | // RSET_STAT
  lock_time_addr    | // LOCK_TIME
  prop_time_addr    | // PROP_TIME
  niu_time_addr     | // NIU_TIME
  ccu_time_addr     | // CCU_TIME
  reset_fee_addr      // RESET_FEE
  );

//  "UCB Interface document", Jan 6 '04, page 3:
//  
//    CSR Write case: ...
//  
//    Write command to invalid address should be discarded silently.
//  
//    CSR read case: ...
//  
//    In the case of an unsuccessful read, CSR Register Block
//    asserts the signal "rd_nack_vld" along with the
//    "thr_id_out[5:0]" and
//    "buf_id_out[1:0]" signals which came from the read message.
//  
//
// In the case of ack_busy_sys2 signal is asserted, CSR Register
// Block should not assert rd_ack_vld or rd_nack_vld until
// ack_busy_sys2 signal is de-asserted.

wire   rd_ack_vld_din  =   rd_req_vld_trunc &  iob_creg_addr &
                           rst_rst_wmr_sys_ &       //BP 8-22-05
                          ~ack_busy_sys2    &
                          ~rd_ack_vld_sys;

wire   rd_nack_vld_din =   rd_req_vld_trunc & ~iob_creg_addr &
                           rst_rst_wmr_sys_ &       //BP 8-22-05
                          ~ack_busy_sys2    &
                          ~rd_nack_vld_sys;

wire   req_acpted_orig_sys_din
                       = ( wr_req_vld_trunc & // No iob_creg_addr term:
                                              // silently discard.
                          ~req_acpted_orig_sys
                         )              |
                         rd_ack_vld_din |
                         rd_nack_vld_din;

wire   rd_wr_req_vld_sys2
                       = (rd_req_vld_sys2 |//Current transaction is  rd_req_vld.
                          rd_req_vld_sys3 )//Current transaction was rd_req_vld.
                        ? rd_req_vld_sys2  //Current transaction is  rd_req_vld.
                        : wr_req_vld_sys2; //Current transaction is  wr_req_vld.

wire   req_acpted_sys_din
                       // When high, fall when rd_wr_req_vld_sys2 falls.
                       = req_acpted_sys      ? rd_wr_req_vld_sys2
                                             : req_acpted_orig_sys;
                       // When low,  rise when req_acpted_orig_sys rises.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rd_ack_vld_sys_ff         
    (.din     (rd_ack_vld_din           ),
     .scan_in (rd_ack_vld_sys_ff_scanin ),
     .scan_out(rd_ack_vld_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_   ),
     .l1clk   (l1clk                    ),
     .dout    (rd_ack_vld_sys           ),
  .siclk(siclk),
  .soclk(soclk));

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 rd_nack_vld_sys_ff         
    (.din     (rd_nack_vld_din           ),
     .scan_in (rd_nack_vld_sys_ff_scanin ),
     .scan_out(rd_nack_vld_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_    ),
     .l1clk   (l1clk                     ),
     .dout    (rd_nack_vld_sys           ),
  .siclk(siclk),
  .soclk(soclk));

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 req_acpted_orig_sys_ff         
    (.din     (req_acpted_orig_sys_din       ),
     .scan_in (req_acpted_orig_sys_ff_scanin ),
     .scan_out(req_acpted_orig_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_        ),
     .l1clk   (l1clk                         ),
     .dout    (req_acpted_orig_sys           ),
  .siclk(siclk),
  .soclk(soclk));

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 req_acpted_sys_ff         
    (.din     (req_acpted_sys_din       ),
     .scan_in (req_acpted_sys_ff_scanin ),
     .scan_out(req_acpted_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_   ),
     .l1clk   (l1clk                    ),
     .dout    (req_acpted_sys           ),
  .siclk(siclk),
  .soclk(soclk));

//________________________________________________________________

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 mio_rst_pb_rst_sys3_ff         
    (.din     (mio_rst_pb_rst_sys2_          ),
     .scan_in (mio_rst_pb_rst_sys3_ff_scanin ),
     .scan_out(mio_rst_pb_rst_sys3_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_        ),
     .l1clk   (l1clk                         ),
     .dout    (mio_rst_pb_rst_sys3_          ),
  .siclk(siclk),
  .soclk(soclk));// Complete cross cmp to sys.
//________________________________________________________________

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 tr_flush_init_ack_sys_ff         
    (.din     (tr_flush_init_ack_cmp           ),
     .scan_in (tr_flush_init_ack_sys_ff_scanin ),
     .scan_out(tr_flush_init_ack_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_          ),
     .l1clk   (l1clk                           ),
     .dout    (tr_flush_init_ack_sys           ),
  .siclk(siclk),
  .soclk(soclk));// Complete cross cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 tr_flush_stop_ack_sys_ff         
    (.din     (tr_flush_stop_ack_cmp           ),
     .scan_in (tr_flush_stop_ack_sys_ff_scanin ),
     .scan_out(tr_flush_stop_ack_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_          ),
     .l1clk   (l1clk                           ),
     .dout    (tr_flush_stop_ack_sys           ),
  .siclk(siclk),
  .soclk(soclk));// Complete cross cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 tr_asicflush_stop_ack_sys_ff         
    (.din     (tr_asicflush_stop_ack_cmp           ),
     .scan_in (tr_asicflush_stop_ack_sys_ff_scanin ),
     .scan_out(tr_asicflush_stop_ack_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_              ),
     .l1clk   (l1clk                               ),
     .dout    (tr_asicflush_stop_ack_sys           ),
  .siclk(siclk),
  .soclk(soclk));// Complete cross cmp-sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_40 addr_in_sys2_ff         
    (.din     (addr_in_sys[39:0]      ),
     .scan_in (addr_in_sys2_ff_scanin ),
     .scan_out(addr_in_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_ ),
     .l1clk   (l1clk                  ),
     .dout    (addr_in_sys2[39:0]     ),
  .siclk(siclk),
  .soclk(soclk));// Complete crossing from cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_16 data_in_sys2_ff
                     
    (.din     (data_in_sys [`RST_UCB_DATA_WIDTH-1:0]),
     .scan_in (data_in_sys2_ff_scanin ),
     .scan_out(data_in_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_               ),
     .l1clk   (l1clk                                ),
     .dout    (data_in_sys2[`RST_UCB_DATA_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));// Complete cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_6 thr_id_in_sys2_ff         
    (.din     (thr_id_in_sys[5:0]       ),
     .scan_in (thr_id_in_sys2_ff_scanin ),
     .scan_out(thr_id_in_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_   ),
     .l1clk   (l1clk                    ),
     .dout    (thr_id_in_sys2[5:0]      ),
  .siclk(siclk),
  .soclk(soclk));// Complete crossing from cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_2 buf_id_in_sys2_ff         
    (.din     (buf_id_in_sys[1:0]       ),
     .scan_in (buf_id_in_sys2_ff_scanin ),
     .scan_out(buf_id_in_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_   ),
     .l1clk   (l1clk                    ),
     .dout    (buf_id_in_sys2[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));// Complete crossing from cmp to sys.

rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 ack_busy_sys2_ff         
    (.din     (ack_busy_sys            ),
     .scan_in (ack_busy_sys2_ff_scanin ),
     .scan_out(ack_busy_sys2_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_   ),
     .l1clk   (l1clk                    ),
     .dout    (ack_busy_sys2           ),
  .siclk(siclk),
  .soclk(soclk));// Complete crossing from cmp to sys.
//________________________________________________________________

wire   thr_buf_id_en   = req_acpted_orig_sys_din |
                         rd_nack_vld_din;

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_6 thr_id_out_sys_ff         
    (.din     (thr_id_in_sys2[5:0]      ),
     .scan_in (thr_id_out_sys_ff_scanin ),
     .scan_out(thr_id_out_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_   ),
     .l1clk   (l1clk                    ),
     .en      (thr_buf_id_en            ),
     .dout    (thr_id_out_sys[5:0]      ),
  .siclk(siclk),
  .soclk(soclk));

rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_2 buf_id_out_sys_ff         
    (.din     (buf_id_in_sys2[1:0]      ),
     .scan_in (buf_id_out_sys_ff_scanin ),
     .scan_out(buf_id_out_sys_ff_scanout),
     .clr_    (mio_rst_pwron_rst_sys_   ),
     .l1clk   (l1clk                    ),
     .en      (thr_buf_id_en            ),
     .dout    (buf_id_out_sys[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_fsm_ctl_l1clkhdr_ctl_macro clkgen (
   .l2clk  (ref_clk     ),
   .l1en   (1'b1        ),
   .pce_ov (tcu_pce_ov  ), // (No assign needed.)
// .pce_ov (1'b0        ), pce_ov and se appear in cpu.v
// .stop   (tcu_clk_stop), // Qualified by assign stmt.
   .stop   (1'b0        ), 

   .se     (tcu_scan_en ), // Qualified by assign stmt.
// .se     (1'b0        ),
   .l1clk  (l1clk       ));

// grep "Number of cells:" rst_*_l/*/scf/dc/rpt/syn_area.rpt
//                               Number of cells/450 = spare gate macros
// rst_fsm_l/rst_fsm_ctl/scf/dc/rpt/syn_area.rpt:        Num:1870 /450=4

rst_fsm_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in (spares_scanin ),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)        );

//________________________________________________________________

                                            // Don't forget to re-link 3
                                            // into chain of assign statments
                                            // when rerunning fixscan.
// assign mio_rst_pwron_rst_sys_ff_scanin = buf_id_out_sys_ff_scanout;
// assign mio_rst_button_xir_sys_ff_scanin= mio_rst_pwron_rst_sys_ff_scanout;
// assign mio_rst_pb_rst_sys_ff_scanin    = mio_rst_button_xir_sys_ff_scanout;
// assign spares_scanin                   = mio_rst_pb_rst_sys_ff_scanout  ;

// fixscan start:
assign rd_req_vld_sys2_ff_scanin = scan_in                  ;
assign wr_req_vld_sys2_ff_scanin = rd_req_vld_sys2_ff_scanout;
assign rd_req_vld_sys3_ff_scanin = wr_req_vld_sys2_ff_scanout;
assign wr_req_vld_sys3_ff_scanin = rd_req_vld_sys3_ff_scanout;
assign data_out_sys2_ff_scanin   = wr_req_vld_sys3_ff_scanout;
assign ncu_rst_xir_done_sys2_ff_scanin = data_out_sys2_ff_scanout ;
assign rt_flush_init_req_sys2_ff_scanin = ncu_rst_xir_done_sys2_ff_scanout;
assign rt_flush_stop_req_sys2_ff_scanin = rt_flush_init_req_sys2_ff_scanout;
assign rt_asicflush_stop_req_sys2_ff_scanin = rt_flush_stop_req_sys2_ff_scanout;
assign rst_l2_por_sys2_ff_scanin = rt_asicflush_stop_req_sys2_ff_scanout;
assign rst_l2_wmr_sys2_ff_scanin = rst_l2_por_sys2_ff_scanout;
assign rst_cmp_ctl_wmr_sys2_ff_scanin = rst_l2_wmr_sys2_ff_scanout;
assign rst_wmr_protect_sys2_ff_scanin = rst_cmp_ctl_wmr_sys2_ff_scanout;
assign rst_tcu_clk_stop_sys2_ff_scanin = rst_wmr_protect_sys2_ff_scanout;
assign rst_dmu_async_por_sys_ff_scanin = rst_tcu_clk_stop_sys2_ff_scanout;
assign rst_dmu_peu_por_sys2_ff_scanin = rst_dmu_async_por_sys_ff_scanout;
assign rst_dmu_peu_wmr_sys2_ff_scanin = rst_dmu_peu_por_sys2_ff_scanout;
assign rst_niu_mac_sys2_ff_scanin = rst_dmu_peu_wmr_sys2_ff_scanout;
assign rst_niu_wmr_sys2_ff_scanin = rst_niu_mac_sys2_ff_scanout;
assign rst_ncu_unpark_thread_sys2_ff_scanin = rst_niu_wmr_sys2_ff_scanout;
assign rst_ncu_xir_sys2_ff_scanin = rst_ncu_unpark_thread_sys2_ff_scanout;
assign rst_rst_wmr_sys_ff_scanin = rst_ncu_xir_sys2_ff_scanout;
assign rst_rst_por_sys_ff_scanin = rst_rst_wmr_sys_ff_scanout;
assign tcu_rst_efu_done_sys_ff_scanin = rst_rst_por_sys_ff_scanout;
assign tcu_bisx_done_sys_ff_scanin = tcu_rst_efu_done_sys_ff_scanout;
assign ccu_rst_change_sys_ff_scanin = tcu_bisx_done_sys_ff_scanout;
assign tcu_test_protect_sys_ff_scanin = ccu_rst_change_sys_ff_scanout;
assign ncu_rst_fatal_error_sys_ff_scanin = tcu_test_protect_sys_ff_scanout;
assign l2t7_rst_fatal_error_sys_ff_scanin = ncu_rst_fatal_error_sys_ff_scanout;
assign l2t6_rst_fatal_error_sys_ff_scanin = l2t7_rst_fatal_error_sys_ff_scanout;
assign l2t5_rst_fatal_error_sys_ff_scanin = l2t6_rst_fatal_error_sys_ff_scanout;
assign l2t4_rst_fatal_error_sys_ff_scanin = l2t5_rst_fatal_error_sys_ff_scanout;
assign l2t3_rst_fatal_error_sys_ff_scanin = l2t4_rst_fatal_error_sys_ff_scanout;
assign l2t2_rst_fatal_error_sys_ff_scanin = l2t3_rst_fatal_error_sys_ff_scanout;
assign l2t1_rst_fatal_error_sys_ff_scanin = l2t2_rst_fatal_error_sys_ff_scanout;
assign l2t0_rst_fatal_error_sys_ff_scanin = l2t1_rst_fatal_error_sys_ff_scanout;
assign rst_rst_pwron_rst_sys2_ff_scanin = l2t0_rst_fatal_error_sys_ff_scanout;
assign reset_gen_dbr_gen_ff_scanin = rst_rst_pwron_rst_sys2_ff_scanout;
assign reset_gen_xir_gen_ff_scanin = reset_gen_dbr_gen_ff_scanout;
assign reset_gen_wmr_gen_ff_scanin = reset_gen_xir_gen_ff_scanout;
assign reset_source_l2t7_fatal_ff_scanin = reset_gen_wmr_gen_ff_scanout;
assign reset_source_l2t6_fatal_ff_scanin = reset_source_l2t7_fatal_ff_scanout;
assign reset_source_l2t5_fatal_ff_scanin = reset_source_l2t6_fatal_ff_scanout;
assign reset_source_l2t4_fatal_ff_scanin = reset_source_l2t5_fatal_ff_scanout;
assign reset_source_l2t3_fatal_ff_scanin = reset_source_l2t4_fatal_ff_scanout;
assign reset_source_l2t2_fatal_ff_scanin = reset_source_l2t3_fatal_ff_scanout;
assign reset_source_l2t1_fatal_ff_scanin = reset_source_l2t2_fatal_ff_scanout;
assign reset_source_l2t0_fatal_ff_scanin = reset_source_l2t1_fatal_ff_scanout;
assign reset_source_ncu_fatal_ff_scanin = reset_source_l2t0_fatal_ff_scanout;
assign reset_source_pb_xir_ff_scanin = reset_source_ncu_fatal_ff_scanout;
assign reset_source_pb_rst_ff_scanin = reset_source_pb_xir_ff_scanout;
assign reset_source_pwron_ff_scanin = reset_source_pb_rst_ff_scanout;
assign reset_source_dbr_gen_ff_scanin = reset_source_pwron_ff_scanout;
assign reset_source_xir_gen_ff_scanin = reset_source_dbr_gen_ff_scanout;
assign reset_source_wmr_gen_ff_scanin = reset_source_xir_gen_ff_scanout;
assign rst_ccu_pll_sys_ff_scanin = reset_source_wmr_gen_ff_scanout;
assign rst_ccu_sys_ff_scanin     = rst_ccu_pll_sys_ff_scanout;
assign cluster_arst_sys_ff_scanin = rst_ccu_sys_ff_scanout   ;
assign rst_assert_ssi_sync_ff_scanin = cluster_arst_sys_ff_scanout;
assign ssys_reset_mac_ff_scanin  = rst_assert_ssi_sync_ff_scanout;
assign ssys_reset_mcu_ff_scanin  = ssys_reset_mac_ff_scanout;
assign ssys_reset_dmu_ff_scanin  = ssys_reset_mcu_ff_scanout;
assign ssys_reset_niu_ff_scanin  = ssys_reset_dmu_ff_scanout;
assign rset_stat_shadow_ff_scanin = ssys_reset_niu_ff_scanout;
assign rset_stat_freq_ff_scanin  = rset_stat_shadow_ff_scanout;
assign rset_stat_por_ff_scanin   = rset_stat_freq_ff_scanout;
assign rset_stat_wmr_ff_scanin   = rset_stat_por_ff_scanout ;
assign lock_time_ff_scanin       = rset_stat_wmr_ff_scanout ;
assign lock_count_ff_scanin      = lock_time_ff_scanout     ;
assign prop_time_ff_scanin       = lock_count_ff_scanout    ;
assign prop_count_ff_scanin      = prop_time_ff_scanout     ;
assign niu_time_ff_scanin        = prop_count_ff_scanout    ;
assign niu_count_ff_scanin       = niu_time_ff_scanout      ;
assign ccu_time_ff_scanin        = niu_count_ff_scanout     ;
assign ccu_count_ff_scanin       = ccu_time_ff_scanout      ;
assign reset_fee_ff_scanin       = ccu_count_ff_scanout     ;
assign state_ff_scanin           = reset_fee_ff_scanout     ;
assign xir_state_ff_scanin       = state_ff_scanout         ;
assign dmu_state_ff_scanin       = xir_state_ff_scanout     ;
assign niu_state_ff_scanin       = dmu_state_ff_scanout     ;
assign rd_ack_vld_sys_ff_scanin  = niu_state_ff_scanout     ;
assign rd_nack_vld_sys_ff_scanin = rd_ack_vld_sys_ff_scanout;
assign req_acpted_orig_sys_ff_scanin = rd_nack_vld_sys_ff_scanout;
assign req_acpted_sys_ff_scanin  = req_acpted_orig_sys_ff_scanout;
assign mio_rst_pb_rst_sys3_ff_scanin = req_acpted_sys_ff_scanout;
assign tr_flush_init_ack_sys_ff_scanin = mio_rst_pb_rst_sys3_ff_scanout;
assign tr_flush_stop_ack_sys_ff_scanin = tr_flush_init_ack_sys_ff_scanout;
assign tr_asicflush_stop_ack_sys_ff_scanin = tr_flush_stop_ack_sys_ff_scanout;
assign addr_in_sys2_ff_scanin    = tr_asicflush_stop_ack_sys_ff_scanout;
assign data_in_sys2_ff_scanin    = addr_in_sys2_ff_scanout  ;
assign thr_id_in_sys2_ff_scanin  = data_in_sys2_ff_scanout  ;
assign buf_id_in_sys2_ff_scanin  = thr_id_in_sys2_ff_scanout;
assign ack_busy_sys2_ff_scanin   = buf_id_in_sys2_ff_scanout;
assign thr_id_out_sys_ff_scanin  = ack_busy_sys2_ff_scanout ;
assign buf_id_out_sys_ff_scanin  = thr_id_out_sys_ff_scanout;
//sign spares_scanin             = buf_id_out_sys_ff_scanout;

                                            // Don't forget to re-link 3
                                            // into chain of assign statments
                                            // when rerunning fixscan.
assign mio_rst_pwron_rst_sys_ff_scanin = buf_id_out_sys_ff_scanout;
assign mio_rst_button_xir_sys_ff_scanin= mio_rst_pwron_rst_sys_ff_scanout;
assign mio_rst_pb_rst_sys_ff_scanin    = mio_rst_button_xir_sys_ff_scanout;
assign spares_scanin                   = mio_rst_pb_rst_sys_ff_scanout  ;

assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule // rst_ctl






// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_1 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{(~clr_)}};






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













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_16 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0] & ~{16{(~clr_)}};






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_1 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}} & ~{1{(~clr_)}}) | (dout[0:0] & ~{1{en}} & ~{1{(~clr_)}});






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













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_3 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}} & ~{3{(~clr_)}}) | (dout[2:0] & ~{3{en}} & ~{3{(~clr_)}});






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

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_16 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = (din[15:0] & {16{en}} & ~{16{(~clr_)}}) | (dout[15:0] & ~{16{en}} & ~{16{(~clr_)}});






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_8 (
  din, 
  en, 
  clr_, 
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
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}} & ~{8{(~clr_)}}) | (dout[7:0] & ~{8{en}} & ~{8{(~clr_)}});






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

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_33 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [32:0] fdin;
wire [31:0] so;

  input [32:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [32:0] dout;
  output scan_out;
assign fdin[32:0] = din[32:0] & ~{33{(~clr_)}};






dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_2 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0] & ~{2{(~clr_)}};






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_3 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0] & ~{3{(~clr_)}};






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

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_40 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [39:0] fdin;
wire [38:0] so;

  input [39:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = din[39:0] & ~{40{(~clr_)}};






dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_0__width_6 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0] & ~{6{(~clr_)}};






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_6 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}} & ~{6{(~clr_)}}) | (dout[5:0] & ~{6{en}} & ~{6{(~clr_)}});






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_msff_ctl_macro__clr__1__en_1__width_2 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}} & ~{2{(~clr_)}}) | (dout[1:0] & ~{2{en}} & ~{2{(~clr_)}});






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_fsm_ctl_l1clkhdr_ctl_macro (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module rst_fsm_ctl_spare_ctl_macro__num_4 (
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
assign scan_out = so_3;



endmodule

