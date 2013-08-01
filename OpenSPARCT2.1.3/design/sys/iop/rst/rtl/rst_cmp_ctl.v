// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rst_cmp_ctl.v
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



module rst_cmp_ctl (
  l2clk, 
  scan_in, 
  scan_out, 
  rst_aclk, 
  rst_bclk, 
  rst_scan_en, 
  tcu_pce_ov, 
  rst_clk_stop, 
  tcu_rst_scan_mode, 
  ccu_cmp_sys_sync_en, 
  ccu_sys_cmp_sync_en, 
  cmp_io_sync_en, 
  io_cmp_sync_en, 
  rst_cmp_ctl_wmr_sys2_, 
  mio_rst_pwron_rst_l, 
  tcu_rst_flush_init_ack, 
  tcu_rst_flush_stop_ack, 
  tcu_rst_asicflush_stop_ack, 
  rst_mcu_selfrsh_sys2, 
  rst_l2_por_sys2_, 
  rst_l2_wmr_sys2_, 
  rst_dmu_peu_por_sys2_, 
  rst_dmu_peu_wmr_sys2_, 
  rst_niu_mac_sys2_, 
  rst_niu_wmr_sys2_, 
  rst_tcu_clk_stop_sys2, 
  rst_ncu_unpark_thread_sys2, 
  rst_ncu_xir_sys2_, 
  ncu_rst_xir_done_io, 
  tcu_rst_efu_done, 
  tcu_bisx_done, 
  tcu_test_protect_io, 
  ccu_rst_change_io, 
  l2ta_rst_fatal_error_io, 
  ncu_rst_fatal_error_io, 
  tr_flush_init_ack_cmp, 
  tr_flush_stop_ack_cmp, 
  tr_asicflush_stop_ack_cmp, 
  rt_flush_init_req_sys2, 
  rt_flush_stop_req_sys2, 
  rt_asicflush_stop_req_sys2, 
  rst_tcu_flush_init_req, 
  rst_tcu_flush_stop_req, 
  rst_tcu_asicflush_stop_req, 
  rd_req_vld_io, 
  wr_req_vld_io, 
  req_acpted_sys, 
  rd_ack_vld_sys, 
  rd_nack_vld_sys, 
  addr_in_io, 
  data_in_io, 
  thr_id_in_io, 
  buf_id_in_io, 
  ack_busy_io, 
  data_out_sys2, 
  thr_id_out_sys, 
  buf_id_out_sys, 
  reset_gen_dbr_gen_q, 
  rd_req_vld_sys, 
  wr_req_vld_sys, 
  req_acpted_cmp2, 
  rd_ack_vld_cmp2, 
  rd_nack_vld_cmp2, 
  addr_in_sys, 
  data_in_sys, 
  thr_id_in_sys, 
  buf_id_in_sys, 
  ack_busy_sys, 
  data_out_cmp2, 
  thr_id_out_cmp2, 
  buf_id_out_cmp2, 
  rst_mcu_selfrsh_cmp2, 
  rst_dmu_peu_por_, 
  rst_dmu_peu_wmr_, 
  rst_niu_mac_, 
  rst_niu_wmr_, 
  rst_tcu_clk_stop, 
  rst_tcu_clk_stop_io, 
  rst_l2_por_, 
  rst_l2_wmr_, 
  rst_ncu_unpark_thread_cmp2, 
  rst_ncu_xir_cmp2_, 
  ncu_rst_xir_done_sys, 
  tcu_rst_efu_done_cmp, 
  tcu_bisx_done_cmp, 
  ncu_rst_fatal_error_cmp, 
  tcu_test_protect_cmp, 
  ccu_rst_change_cmp, 
  l2t7_rst_fatal_error_cmp, 
  l2t6_rst_fatal_error_cmp, 
  l2t5_rst_fatal_error_cmp, 
  l2t4_rst_fatal_error_cmp, 
  l2t3_rst_fatal_error_cmp, 
  l2t2_rst_fatal_error_cmp, 
  l2t1_rst_fatal_error_cmp, 
  l2t0_rst_fatal_error_cmp, 
  pwron_rst_h_scan_mode_en, 
  rst_tcu_dbr_gen, 
  rst_rst_pwron_rst_l_sys2_, 
  rst_tcu_pwron_rst_l, 
  rst_rst_pwron_rst_l_io0_, 
  mio_rst_pb_rst_sys_, 
  mio_rst_pb_rst_sys2_, 
  rst_rst_por_sys2_, 
  rst_rst_por_io0_, 
  rst_rst_wmr_sys2_, 
  rst_rst_wmr_io0_);
wire spares_scanout;
wire tcu_aclk;
wire tcu_bclk;
wire tcu_scan_en;
wire tcu_clk_stop;
wire siclk;
wire soclk;
wire rst_tcu_pwron_rst_l_ff_scanin;
wire rst_tcu_pwron_rst_l_ff_scanout;
wire l1clk;
wire ccu_sys_cmp_sync_en3;
wire rst_tcu_pwron_rst_l_cmp_;
wire rst_rst_pwron_rst_l_io0_ff_scanin;
wire rst_rst_pwron_rst_l_io0_ff_scanout;
wire cmp_io_sync_en2;
wire rst_tcu_flush_init_req_ff_scanin;
wire rst_tcu_flush_init_req_ff_scanout;
wire rst_cmp_ctl_wmr_cmp_;
wire rst_tcu_flush_stop_req_ff_scanin;
wire rst_tcu_flush_stop_req_ff_scanout;
wire rst_tcu_asicflush_stop_req_ff_scanin;
wire rst_tcu_asicflush_stop_req_ff_scanout;
wire rst_tcu_dbr_gen_ff_scanin;
wire rst_tcu_dbr_gen_ff_scanout;
wire tcu_rst_flush_init_ack_ff_scanin;
wire tcu_rst_flush_init_ack_ff_scanout;
wire ccu_cmp_sys_sync_en3;
wire tcu_rst_flush_stop_ack_ff_scanin;
wire tcu_rst_flush_stop_ack_ff_scanout;
wire tcu_rst_asicflush_stop_ack_ff_scanin;
wire tcu_rst_asicflush_stop_ack_ff_scanout;
wire req_acpted_cmp_ff_scanin;
wire req_acpted_cmp_ff_scanout;
wire req_acpted_cmp;
wire req_acpted_cmp2_ff_scanin;
wire req_acpted_cmp2_ff_scanout;
wire rd_ack_vld_cmp_ff_scanin;
wire rd_ack_vld_cmp_ff_scanout;
wire rd_ack_vld_cmp;
wire rd_ack_vld_cmp2_ff_scanin;
wire rd_ack_vld_cmp2_ff_scanout;
wire rd_nack_vld_cmp_ff_scanin;
wire rd_nack_vld_cmp_ff_scanout;
wire rd_nack_vld_cmp;
wire rd_nack_vld_cmp2_ff_scanin;
wire rd_nack_vld_cmp2_ff_scanout;
wire data_out_cmp_ff_scanin;
wire data_out_cmp_ff_scanout;
wire [15:0] data_out_cmp;
wire data_out_cmp2_ff_scanin;
wire data_out_cmp2_ff_scanout;
wire addr_in_cmp_ff_scanin;
wire addr_in_cmp_ff_scanout;
wire io_cmp_sync_en2;
wire [39:0] addr_in_cmp;
wire addr_in_sys_ff_scanin;
wire addr_in_sys_ff_scanout;
wire data_in_cmp_ff_scanin;
wire data_in_cmp_ff_scanout;
wire [15:0] data_in_cmp;
wire data_in_sys_ff_scanin;
wire data_in_sys_ff_scanout;
wire thr_id_in_cmp_ff_scanin;
wire thr_id_in_cmp_ff_scanout;
wire [5:0] thr_id_in_cmp;
wire thr_id_in_sys_ff_scanin;
wire thr_id_in_sys_ff_scanout;
wire buf_id_in_cmp_ff_scanin;
wire buf_id_in_cmp_ff_scanout;
wire [1:0] buf_id_in_cmp;
wire buf_id_in_sys_ff_scanin;
wire buf_id_in_sys_ff_scanout;
wire ack_busy_cmp_ff_scanin;
wire ack_busy_cmp_ff_scanout;
wire ack_busy_cmp;
wire ack_busy_sys_ff_scanin;
wire ack_busy_sys_ff_scanout;
wire thr_id_out_cmp_ff_scanin;
wire thr_id_out_cmp_ff_scanout;
wire [5:0] thr_id_out_cmp;
wire thr_id_out_cmp2_ff_scanin;
wire thr_id_out_cmp2_ff_scanout;
wire buf_id_out_cmp_ff_scanin;
wire buf_id_out_cmp_ff_scanout;
wire [1:0] buf_id_out_cmp;
wire buf_id_out_cmp2_ff_scanin;
wire buf_id_out_cmp2_ff_scanout;
wire rd_req_vld_cmp_ff_scanin;
wire rd_req_vld_cmp_ff_scanout;
wire rd_req_vld_cmp;
wire rd_req_vld_cmp2_ff_scanin;
wire rd_req_vld_cmp2_ff_scanout;
wire wr_req_vld_cmp_ff_scanin;
wire wr_req_vld_cmp_ff_scanout;
wire wr_req_vld_cmp;
wire wr_req_vld_cmp2_ff_scanin;
wire wr_req_vld_cmp2_ff_scanout;
wire rst_mcu_selfrsh_cmp_ff_scanin;
wire rst_mcu_selfrsh_cmp_ff_scanout;
wire rst_mcu_selfrsh_cmp;
wire rst_mcu_selfrsh_cmp2_ff_scanin;
wire rst_mcu_selfrsh_cmp2_ff_scanout;
wire rst_l2_por_ff_scanin;
wire rst_l2_por_ff_scanout;
wire rst_l2_wmr_ff_scanin;
wire rst_l2_wmr_ff_scanout;
wire rst_tcu_clk_stop_cmp_ff_scanin;
wire rst_tcu_clk_stop_cmp_ff_scanout;
wire l1clk_free_running;
wire rst_tcu_clk_stop_io_ff_scanin;
wire rst_tcu_clk_stop_io_ff_scanout;
wire rst_dmu_peu_por_ff_scanin;
wire rst_dmu_peu_por_ff_scanout;
wire rst_dmu_peu_wmr_ff_scanin;
wire rst_dmu_peu_wmr_ff_scanout;
wire rst_niu_mac_ff_scanin;
wire rst_niu_mac_ff_scanout;
wire rst_niu_wmr_ff_scanin;
wire rst_niu_wmr_ff_scanout;
wire rst_ncu_unpark_thread_cmp_ff_scanin;
wire rst_ncu_unpark_thread_cmp_ff_scanout;
wire rst_ncu_unpark_thread_cmp;
wire rst_ncu_unpark_thread_cmp2_ff_scanin;
wire rst_ncu_unpark_thread_cmp2_ff_scanout;
wire rst_ncu_xir_dout;
wire rst_ncu_xir_cmp_ff_scanin;
wire rst_ncu_xir_cmp_ff_scanout;
wire rst_ncu_xir_cmp_;
wire rst_ncu_xir_cmp2_ff_scanin;
wire rst_ncu_xir_cmp2_ff_scanout;
wire ncu_rst_xir_done_cmp_ff_scanin;
wire ncu_rst_xir_done_cmp_ff_scanout;
wire ncu_rst_xir_done_cmp;
wire ncu_rst_xir_done_sys_ff_scanin;
wire ncu_rst_xir_done_sys_ff_scanout;
wire tcu_rst_efu_done_sys_ff_scanin;
wire tcu_rst_efu_done_sys_ff_scanout;
wire tcu_bisx_done_sys_ff_scanin;
wire tcu_bisx_done_sys_ff_scanout;
wire tcu_test_protect_cmp0_ff_scanin;
wire tcu_test_protect_cmp0_ff_scanout;
wire tcu_test_protect_cmp0;
wire tcu_test_protect_cmp_ff_scanin;
wire tcu_test_protect_cmp_ff_scanout;
wire ccu_rst_change_cmp0_ff_scanin;
wire ccu_rst_change_cmp0_ff_scanout;
wire ccu_rst_change_cmp0;
wire ccu_rst_change_cmp_ff_scanin;
wire ccu_rst_change_cmp_ff_scanout;
wire ncu_rst_fatal_error_cmp0_ff_scanin;
wire ncu_rst_fatal_error_cmp0_ff_scanout;
wire ncu_rst_fatal_error_cmp0;
wire ncu_rst_fatal_error_hold_din;
wire ncu_rst_fatal_error_hold_dout;
wire ncu_rst_fatal_error_hold_ff_scanin;
wire ncu_rst_fatal_error_hold_ff_scanout;
wire ncu_rst_fatal_error_cmp_ff_scanin;
wire ncu_rst_fatal_error_cmp_ff_scanout;
wire l2ta_rst_fatal_error_cmp0_ff_scanin;
wire l2ta_rst_fatal_error_cmp0_ff_scanout;
wire [7:0] l2ta_rst_fatal_error_cmp0;
wire [7:0] l2ta_rst_fatal_error_hold_din;
wire [7:0] l2ta_rst_fatal_error_hold_dout;
wire [7:0] l2ta_rst_fatal_error_cmp;
wire l2ta_rst_fatal_error_hold_ff_scanin;
wire l2ta_rst_fatal_error_hold_ff_scanout;
wire l2ta_rst_fatal_error_cmp_ff_scanin;
wire l2ta_rst_fatal_error_cmp_ff_scanout;
wire mio_rst_pb_rst_cmp_ff_scanin;
wire mio_rst_pb_rst_cmp_ff_scanout;
wire mio_rst_pb_rst_cmp_;
wire mio_rst_pb_rst_sys2_ff_scanin;
wire mio_rst_pb_rst_sys2_ff_scanout;
wire rst_cmp_ctl_wmr_cmp_ff_scanin;
wire rst_cmp_ctl_wmr_cmp_ff_scanout;
wire rst_rst_por_cmp_ff_scanin;
wire rst_rst_por_cmp_ff_scanout;
wire rst_rst_por_cmp_;
wire rst_rst_por_io_ff_scanin;
wire rst_rst_por_io_ff_scanout;
wire rst_rst_wmr_cmp_ff_scanin;
wire rst_rst_wmr_cmp_ff_scanout;
wire rst_rst_wmr_cmp_;
wire rst_rst_wmr_io_ff_scanin;
wire rst_rst_wmr_io_ff_scanout;
wire cmp_io_sync_en2_ff_scanin;
wire cmp_io_sync_en2_ff_scanout;
wire io_cmp_sync_en2_ff_scanin;
wire io_cmp_sync_en2_ff_scanout;
wire ccu_cmp_sys_sync_en2_ff_scanin;
wire ccu_cmp_sys_sync_en2_ff_scanout;
wire ccu_cmp_sys_sync_en2;
wire ccu_cmp_sys_sync_en3_ff_scanin;
wire ccu_cmp_sys_sync_en3_ff_scanout;
wire ccu_sys_cmp_sync_en2_ff_scanin;
wire ccu_sys_cmp_sync_en2_ff_scanout;
wire ccu_sys_cmp_sync_en2;
wire ccu_sys_cmp_sync_en3_ff_scanin;
wire ccu_sys_cmp_sync_en3_ff_scanout;
wire spares_scanin;

input         l2clk                ;// From clkgen_rst_cmp.
input         scan_in              ;// rst_fsm_ctl_scanin? rst_cmp_ctl_scanin?
output        scan_out             ;// 
//output        rst_fsm_ctl_scanout  ;
input         rst_aclk             ;// Called rst_ here.     .(tcu_aclk_gen  )
input         rst_bclk             ;// to allow assign stmt. .(tcu_bclk_gen  )
input         rst_scan_en          ;// Assign.               .(tcu_scan_en   )
input         tcu_pce_ov           ;// (No assign needed.)   .(tcu_pce_ov_gen)
input         rst_clk_stop         ;// Assign.               .(1'b0          )
input         tcu_rst_scan_mode    ;// Indicates scan is active.
input         ccu_cmp_sys_sync_en  ;
input         ccu_sys_cmp_sync_en  ;
input         cmp_io_sync_en       ;
input         io_cmp_sync_en       ;
//put         ccu_rst_sync_stable  ;// Review Oct 24 '05.
input         rst_cmp_ctl_wmr_sys2_;

input         mio_rst_pwron_rst_l  ;
input         tcu_rst_flush_init_ack;// Convert from cmp to sys.
input         tcu_rst_flush_stop_ack;// Convert from cmp to sys.
input         tcu_rst_asicflush_stop_ack;// Convert from cmp to sys.

input         rst_mcu_selfrsh_sys2      ;// Convert from sys to cmp to io.
input         rst_l2_por_sys2_          ;// Convert from sys to cmp.
input         rst_l2_wmr_sys2_          ;// Convert from sys to cmp.
input         rst_dmu_peu_por_sys2_     ;// Convert from sys to cmp.
input         rst_dmu_peu_wmr_sys2_     ;// Convert from sys to cmp.
input         rst_niu_mac_sys2_         ;// Convert from sys to cmp.
input         rst_niu_wmr_sys2_         ;// Convert from sys to cmp.
input         rst_tcu_clk_stop_sys2     ;// Convert from sys to cmp.
input         rst_ncu_unpark_thread_sys2;// Convert from sys to cmp to io.
input         rst_ncu_xir_sys2_         ;// Convert from sys to cmp to io.
input         ncu_rst_xir_done_io       ;// Convert from io  to cmp to sys.
input         tcu_rst_efu_done          ;// Convert from cmp to sys.
input         tcu_bisx_done             ;// Convert from cmp to sys.
input         tcu_test_protect_io       ;// Convert from cmp to sys.
input         ccu_rst_change_io         ;// Convert from cmp to sys.
input [ 7:0]  l2ta_rst_fatal_error_io   ;// Convert from io  to cmp to sys.
input          ncu_rst_fatal_error_io   ;// Convert from io  to cmp to sys.

output        tr_flush_init_ack_cmp     ;// Converted from cmp to sys.
output        tr_flush_stop_ack_cmp     ;// Converted from cmp to sys.
output        tr_asicflush_stop_ack_cmp ;// Converted from cmp to sys.

input         rt_flush_init_req_sys2    ;// Convert from sys to cmp.
input         rt_flush_stop_req_sys2    ;// Convert from sys to cmp.
input         rt_asicflush_stop_req_sys2;// Convert from sys to cmp.

output        rst_tcu_flush_init_req    ;// Converted from sys to cmp.
output        rst_tcu_flush_stop_req    ;// Converted from sys to cmp.
output        rst_tcu_asicflush_stop_req;// Converted from sys to cmp.

input         rd_req_vld_io             ;// Convert from io  to cmp.
input         wr_req_vld_io             ;// Convert from io  to cmp.
input         req_acpted_sys            ;// Convert from sys to cmp.
input         rd_ack_vld_sys            ;// Convert from sys to cmp.
input         rd_nack_vld_sys           ;// Convert from sys to cmp.
input [39:0]  addr_in_io                ;// Convert from io  to cmp to sys.
input [`RST_UCB_DATA_WIDTH-1:0]
              data_in_io                ;// Convert from io  to cmp to sys.
input [ 5:0]  thr_id_in_io              ;// Convert from io  to cmp to sys.
input [ 1:0]  buf_id_in_io              ;// Convert from io  to cmp to sys.
input         ack_busy_io               ;// Convert from io  to cmp to sys.
input [`RST_UCB_DATA_WIDTH-1:0]
              data_out_sys2             ;// Convert from sys to cmp.
input [ 5:0]  thr_id_out_sys            ;// Convert from sys to cmp to io.
input [ 1:0]  buf_id_out_sys            ;// Convert from sys to cmp to io.
input         reset_gen_dbr_gen_q       ;// Convert from sys to cmp:
                                         // rst_tcu_dbr_gen

output        rd_req_vld_sys            ;// Converted from io  to cmp.
output        wr_req_vld_sys            ;// Converted from io  to cmp.
output        req_acpted_cmp2           ;// Convert   from sys to cmp to io.
output        rd_ack_vld_cmp2           ;// Convert   from sys to cmp to io.
output        rd_nack_vld_cmp2          ;// Convert   from sys to cmp to io.
output[39:0]  addr_in_sys               ;// Convert   from io  to cmp to sys.
output[`RST_UCB_DATA_WIDTH-1:0]
              data_in_sys               ;// Convert   from io  to cmp to sys.
output[ 5:0]  thr_id_in_sys             ;// Convert   from io  to cmp to sys.
output[ 1:0]  buf_id_in_sys             ;// Convert   from io  to cmp to sys.
output        ack_busy_sys              ;// Convert   from io  to cmp to sys.
output[`RST_UCB_DATA_WIDTH-1:0]
              data_out_cmp2             ;// Convert   from sys to cmp to io.
output[ 5:0]  thr_id_out_cmp2           ;// Convert   from sys to cmp to io.
output[ 1:0]  buf_id_out_cmp2           ;// Convert   from sys to cmp to io.

output        rst_mcu_selfrsh_cmp2      ;// Convert   from sys to cmp to io.
output        rst_dmu_peu_por_          ;// Converted from sys to cmp.
output        rst_dmu_peu_wmr_          ;// Converted from sys to cmp.
output        rst_niu_mac_              ;// Converted from sys to cmp.
output        rst_niu_wmr_              ;// Converted from sys to cmp.
output        rst_tcu_clk_stop          ;// Converted from sys to cmp.
output        rst_tcu_clk_stop_io       ;// Converted from sys to io.
output        rst_l2_por_               ;// Converted from sys to cmp.
output        rst_l2_wmr_               ;// Converted from sys to cmp.
output        rst_ncu_unpark_thread_cmp2;// Convert   from sys to cmp to io.
output        rst_ncu_xir_cmp2_         ;// Convert   from sys to cmp to io.
output        ncu_rst_xir_done_sys      ;// Convert   from io  to cmp to sys.
output        tcu_rst_efu_done_cmp      ;// Convert   from cmp to sys.
output        tcu_bisx_done_cmp         ;// Convert   from cmp to sys.
output        ncu_rst_fatal_error_cmp   ;// Convert   from io  to cmp to sys.
output        tcu_test_protect_cmp      ;// Convert   from io  to cmp to sys.
output        ccu_rst_change_cmp        ;// Convert   from io  to cmp to sys.
output        l2t7_rst_fatal_error_cmp  ;// Convert   from cmp to sys.
output        l2t6_rst_fatal_error_cmp  ;// Convert   from cmp to sys.
output        l2t5_rst_fatal_error_cmp  ;// Convert   from cmp to sys.
output        l2t4_rst_fatal_error_cmp  ;// Convert   from cmp to sys.
output        l2t3_rst_fatal_error_cmp  ;// Convert   from cmp to sys.
output        l2t2_rst_fatal_error_cmp  ;// Convert   from cmp to sys.
output        l2t1_rst_fatal_error_cmp  ;// Convert   from cmp to sys.
output        l2t0_rst_fatal_error_cmp  ;// Convert   from cmp to sys.
output        pwron_rst_h_scan_mode_en  ;// = tcu_rst_scan_mode ? rst_scan_en:
                                         //              ~mio_rst_pwron_rst_l;
output        rst_tcu_dbr_gen           ;// Convert reset_gen_dbr_gen_q
                                         //           from sys to cmp.
input         rst_rst_pwron_rst_l_sys2_ ;// BP 7-28-06 from rst_fsm_ctl sync to
                                         //            cmp_clk then on to tcu
output        rst_tcu_pwron_rst_l       ;// BP 7-28-05 rst_tcu_pwron_rst_cmp_
                                         //            synched to cmp_clk
output        rst_rst_pwron_rst_l_io0_  ;
input         mio_rst_pb_rst_sys_       ;// From rst_fsm_ctl sync to cmp&back.
output        mio_rst_pb_rst_sys2_      ;// 
input         rst_rst_por_sys2_         ;// From rst_fsm_ctl to cmp to _io_ctl.
output        rst_rst_por_io0_          ;// From rst_fsm_ctl to cmp to _io_ctl.
input         rst_rst_wmr_sys2_         ;// From rst_fsm_ctl to cmp to ucbflow.
output        rst_rst_wmr_io0_          ;// From rst_fsm_ctl to cmp to ucbflow.

// ign        tr_flush_init_ack_cmp  = tcu_rst_flush_init_ack;// Now a flop.
// ign        tr_flush_stop_ack_cmp  = tcu_rst_flush_stop_ack;// Now a flop.

// ign        rst_tcu_flush_init_req = rt_flush_init_req_sys; // Now a flop.
// ign        rst_tcu_flush_stop_req = rt_flush_stop_req_sys; // Now a flop.

// ign        rst_tcu_flush_init_req = rt_flush_init_req_sys2;// Now a flop.
// ign        rst_tcu_flush_stop_req = rt_flush_stop_req_sys2;// Now a flop.

// ign        rd_req_vld_sys         = rd_req_vld_io         ;// Now a flop.
// ign        wr_req_vld_sys         = wr_req_vld_io         ;// Now a flop.
// ign        req_acpted_cmp2        = req_acpted_sys        ;// Now a flop.
//________________________________________________________________

assign   scan_out
                      = tcu_rst_scan_mode ? spares_scanout     : 1'b0;
assign   tcu_aclk     = tcu_rst_scan_mode ? rst_aclk     : 1'b0;
assign   tcu_bclk     = tcu_rst_scan_mode ? rst_bclk     : 1'b0;
assign   tcu_scan_en  = tcu_rst_scan_mode ? rst_scan_en  : 1'b0;
assign   tcu_clk_stop = tcu_rst_scan_mode ? rst_clk_stop : 1'b0;

//sign   rst_fsm_ctl_scanout
//                    = (~mio_rst_pwron_rst_l) ? scan_out     : 1'b0;
//sign   tcu_aclk     = (~mio_rst_pwron_rst_l) ? rst_aclk     : 1'b0;
//sign   tcu_bclk     = (~mio_rst_pwron_rst_l) ? rst_bclk     : 1'b0;
//sign   tcu_scan_en  = (~mio_rst_pwron_rst_l) ? rst_scan_en  : 1'b0;
//sign   tcu_clk_stop = (~mio_rst_pwron_rst_l) ? rst_clk_stop : 1'b0;
//________________________________________________________________

// N2 Bug ID: 107214
// The current fix leaves us with an 'x' after scan_en goes low,
// right before we launch the capture clock.
// This is b/c the PWRON_RST_L pin is not constrained during atpg.
// So the equation should actually be a mux, as follows:

assign   pwron_rst_h_scan_mode_en  = tcu_rst_scan_mode ? rst_scan_en        :
                                                        ~mio_rst_pwron_rst_l;
                         // Place logic here (not allowed in rst.sv)
                         // to pass this function to clkgen_rst_cmp's
                         // input ports .tcu_clk_stop and .scan_en.
//________________________________________________________________

assign siclk = tcu_aclk; // When say wire instead of assign, siclk = z.
                         // Described to Anurag Bhatnagar Feb 23 '05.
assign soclk = tcu_bclk;
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__0__en_1__width_1 rst_tcu_pwron_rst_l_ff         
    (.din     (rst_rst_pwron_rst_l_sys2_     ),// synchronized version on sysclk
//   .clr_    (rst_cmp_ctl_wmr_cmp_          ),// Don't assert during WMR.
     .scan_in (rst_tcu_pwron_rst_l_ff_scanin ),
     .scan_out(rst_tcu_pwron_rst_l_ff_scanout),
     .l1clk   (l1clk                         ),
     .en      (ccu_sys_cmp_sync_en3          ),// Convert from sys to cmp.
     .dout    (rst_tcu_pwron_rst_l_cmp_      ),
  .siclk(siclk),
  .soclk(soclk));

assign         rst_tcu_pwron_rst_l      =
               rst_tcu_pwron_rst_l_cmp_ & // BP 7-29-05
                                          // rst_tcu_pwron_rst_l_cmp_ -> cmp clk
               rst_rst_pwron_rst_l_sys2_; // rst_tcu_pwron_rst_l_cmp_ -> sys clk
                                          // Async assert, cmp-sync deassert.

rst_cmp_ctl_msff_ctl_macro__clr__0__en_1__width_1 rst_rst_pwron_rst_l_io0_ff         
    (.din     (rst_tcu_pwron_rst_l_cmp_          ),
//   .clr_    (rst_cmp_ctl_wmr_cmp_              ),// Don't assert during WMR.
     .scan_in (rst_rst_pwron_rst_l_io0_ff_scanin ),
     .scan_out(rst_rst_pwron_rst_l_io0_ff_scanout),
     .l1clk   (l1clk                             ),
     .en      (cmp_io_sync_en2                   ),// Convert from cmp to io.
     .dout    (rst_rst_pwron_rst_l_io0_          ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_tcu_flush_init_req_ff         
    (.din     (rt_flush_init_req_sys2    ),// 
     .scan_in (rst_tcu_flush_init_req_ff_scanin ),
     .scan_out(rst_tcu_flush_init_req_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_             ),
     .l1clk   (l1clk                            ),
     .en      (ccu_sys_cmp_sync_en3             ),// Convert from sys to cmp.
     .dout    (rst_tcu_flush_init_req           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_tcu_flush_stop_req_ff         
    (.din     (rt_flush_stop_req_sys2           ),
     .scan_in (rst_tcu_flush_stop_req_ff_scanin ),
     .scan_out(rst_tcu_flush_stop_req_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_             ),
     .l1clk   (l1clk                            ),
     .en      (ccu_sys_cmp_sync_en3             ),// Convert from sys to cmp.
     .dout    (rst_tcu_flush_stop_req           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_tcu_asicflush_stop_req_ff         
    (.din     (rt_asicflush_stop_req_sys2           ),
     .scan_in (rst_tcu_asicflush_stop_req_ff_scanin ),
     .scan_out(rst_tcu_asicflush_stop_req_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                 ),
     .l1clk   (l1clk                                ),
     .en      (ccu_sys_cmp_sync_en3                 ),// Convert from sys to cmp.
     .dout    (rst_tcu_asicflush_stop_req           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_tcu_dbr_gen_ff         
    (.din     (reset_gen_dbr_gen_q       ),// 
     .scan_in (rst_tcu_dbr_gen_ff_scanin ),
     .scan_out(rst_tcu_dbr_gen_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (ccu_sys_cmp_sync_en3      ),// Convert from sys to cmp.
     .dout    (rst_tcu_dbr_gen           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 tcu_rst_flush_init_ack_ff         
    (.din     (tcu_rst_flush_init_ack           ),
     .scan_in (tcu_rst_flush_init_ack_ff_scanin ),
     .scan_out(tcu_rst_flush_init_ack_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_             ),
     .l1clk   (l1clk                            ),
     .en      (ccu_cmp_sys_sync_en3             ),// Convert from cmp to sys.
     .dout    (tr_flush_init_ack_cmp            ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 tcu_rst_flush_stop_ack_ff         
    (.din     (tcu_rst_flush_stop_ack           ),
     .scan_in (tcu_rst_flush_stop_ack_ff_scanin ),
     .scan_out(tcu_rst_flush_stop_ack_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_             ),
     .l1clk   (l1clk                            ),
     .en      (ccu_cmp_sys_sync_en3             ),// Convert from cmp to sys.
     .dout    (tr_flush_stop_ack_cmp            ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 tcu_rst_asicflush_stop_ack_ff         
    (.din     (tcu_rst_asicflush_stop_ack           ),
     .scan_in (tcu_rst_asicflush_stop_ack_ff_scanin ),
     .scan_out(tcu_rst_asicflush_stop_ack_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                 ),
     .l1clk   (l1clk                                ),
     .en      (ccu_cmp_sys_sync_en3                 ),//Convert from cmp to sys.
     .dout    (tr_asicflush_stop_ack_cmp            ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 req_acpted_cmp_ff         
    (.din     (req_acpted_sys           ),
     .scan_in (req_acpted_cmp_ff_scanin ),
     .scan_out(req_acpted_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_     ),
     .l1clk   (l1clk                    ),
     .en      (ccu_sys_cmp_sync_en3     ),// Convert from sys to cmp.
     .dout    (req_acpted_cmp           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 req_acpted_cmp2_ff         
    (.din     (req_acpted_cmp            ),
     .scan_in (req_acpted_cmp2_ff_scanin ),
     .scan_out(req_acpted_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (cmp_io_sync_en2           ),// Convert from cmp to io.
     .dout    (req_acpted_cmp2           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rd_ack_vld_cmp_ff         
    (.din     (rd_ack_vld_sys           ),
     .scan_in (rd_ack_vld_cmp_ff_scanin ),
     .scan_out(rd_ack_vld_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_     ),
     .l1clk   (l1clk                    ),
     .en      (ccu_sys_cmp_sync_en3     ),// Convert from sys to cmp.
     .dout    (rd_ack_vld_cmp           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rd_ack_vld_cmp2_ff         
    (.din     (rd_ack_vld_cmp            ),
     .scan_in (rd_ack_vld_cmp2_ff_scanin ),
     .scan_out(rd_ack_vld_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (cmp_io_sync_en2           ),// Convert from cmp to io.
     .dout    (rd_ack_vld_cmp2           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rd_nack_vld_cmp_ff         
    (.din     (rd_nack_vld_sys           ),
     .scan_in (rd_nack_vld_cmp_ff_scanin ),
     .scan_out(rd_nack_vld_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (ccu_sys_cmp_sync_en3      ),// Convert from sys to cmp.
     .dout    (rd_nack_vld_cmp           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rd_nack_vld_cmp2_ff         
    (.din     (rd_nack_vld_cmp            ),
     .scan_in (rd_nack_vld_cmp2_ff_scanin ),
     .scan_out(rd_nack_vld_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_       ),
     .l1clk   (l1clk                      ),
     .en      (cmp_io_sync_en2            ),// Convert from cmp to io.
     .dout    (rd_nack_vld_cmp2           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_16 data_out_cmp_ff
                      
    (.din     (data_out_sys2[`RST_UCB_DATA_WIDTH-1:0]),
     .scan_in (data_out_cmp_ff_scanin ),
     .scan_out(data_out_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                  ),
     .l1clk   (l1clk                                 ),
     .en      (ccu_sys_cmp_sync_en3                  ),// Convert fr sys to cmp.
     .dout    (data_out_cmp [`RST_UCB_DATA_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_16 data_out_cmp2_ff
                      
    (.din     (data_out_cmp [`RST_UCB_DATA_WIDTH-1:0]),
     .scan_in (data_out_cmp2_ff_scanin ),
     .scan_out(data_out_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                  ),
     .l1clk   (l1clk                                 ),
     .en      (cmp_io_sync_en2                       ),// Convert fr cmp to io.
     .dout    (data_out_cmp2[`RST_UCB_DATA_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_40 addr_in_cmp_ff         
    (.din     (addr_in_io[39:0]      ),
     .scan_in (addr_in_cmp_ff_scanin ),
     .scan_out(addr_in_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_  ),
     .l1clk   (l1clk                 ),
     .en      (io_cmp_sync_en2       ),// Convert from io to cmp.
     .dout    (addr_in_cmp[39:0]     ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_40 addr_in_sys_ff         
    (.din     (addr_in_cmp[39:0]     ),
     .scan_in (addr_in_sys_ff_scanin ),
     .scan_out(addr_in_sys_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_  ),
     .l1clk   (l1clk                 ),
     .en      (ccu_cmp_sys_sync_en3  ),// Cross fr cmp to sys.
     .dout    (addr_in_sys[39:0]     ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_16 data_in_cmp_ff
                    
    (.din     (data_in_io [`RST_UCB_DATA_WIDTH-1:0]),
     .scan_in (data_in_cmp_ff_scanin ),
     .scan_out(data_in_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                ),
     .l1clk   (l1clk                               ),
     .en      (io_cmp_sync_en2                     ),// Convert from io to cmp.
     .dout    (data_in_cmp[`RST_UCB_DATA_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_16 data_in_sys_ff
                    
    (.din     (data_in_cmp[`RST_UCB_DATA_WIDTH-1:0]),
     .scan_in (data_in_sys_ff_scanin ),
     .scan_out(data_in_sys_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                ),
     .l1clk   (l1clk                               ),
     .en      (ccu_cmp_sys_sync_en3                ),// Cross fr cmp to sys.
     .dout    (data_in_sys[`RST_UCB_DATA_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_6 thr_id_in_cmp_ff         
    (.din     (thr_id_in_io[5:0]       ),
     .scan_in (thr_id_in_cmp_ff_scanin ),
     .scan_out(thr_id_in_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_    ),
     .l1clk   (l1clk                   ),
     .en      (io_cmp_sync_en2         ),// Convert from io to cmp.
     .dout    (thr_id_in_cmp[5:0]      ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_6 thr_id_in_sys_ff         
    (.din     (thr_id_in_cmp[5:0]      ),
     .scan_in (thr_id_in_sys_ff_scanin ),
     .scan_out(thr_id_in_sys_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_    ),
     .l1clk   (l1clk                   ),
     .en      (ccu_cmp_sys_sync_en3    ),// Cross fr cmp to sys.
     .dout    (thr_id_in_sys[5:0]      ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_2 buf_id_in_cmp_ff         
    (.din     (buf_id_in_io[1:0]       ),
     .scan_in (buf_id_in_cmp_ff_scanin ),
     .scan_out(buf_id_in_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_    ),
     .l1clk   (l1clk                   ),
     .en      (io_cmp_sync_en2         ),// Convert from io to cmp.
     .dout    (buf_id_in_cmp[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_2 buf_id_in_sys_ff         
    (.din     (buf_id_in_cmp[1:0]      ),
     .scan_in (buf_id_in_sys_ff_scanin ),
     .scan_out(buf_id_in_sys_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_    ),
     .l1clk   (l1clk                   ),
     .en      (ccu_cmp_sys_sync_en3    ),// Cross fr cmp to sys.
     .dout    (buf_id_in_sys[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 ack_busy_cmp_ff         
    (.din     (ack_busy_io            ),
     .scan_in (ack_busy_cmp_ff_scanin ),
     .scan_out(ack_busy_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_   ),
     .l1clk   (l1clk                  ),
     .en      (io_cmp_sync_en2        ),// Convert from io to cmp.
     .dout    (ack_busy_cmp           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 ack_busy_sys_ff         
    (.din     (ack_busy_cmp           ),
     .scan_in (ack_busy_sys_ff_scanin ),
     .scan_out(ack_busy_sys_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_   ),
     .l1clk   (l1clk                  ),
     .en      (ccu_cmp_sys_sync_en3   ),// Cross fr cmp to sys.
     .dout    (ack_busy_sys           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_6 thr_id_out_cmp_ff         
    (.din     (thr_id_out_sys[ 5:0]     ),
     .scan_in (thr_id_out_cmp_ff_scanin ),
     .scan_out(thr_id_out_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_     ),
     .l1clk   (l1clk                    ),
     .en      (ccu_sys_cmp_sync_en3     ),// Convert from sys to cmp.
     .dout    (thr_id_out_cmp[ 5:0]     ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_6 thr_id_out_cmp2_ff         
    (.din     (thr_id_out_cmp[ 5:0]      ),
     .scan_in (thr_id_out_cmp2_ff_scanin ),
     .scan_out(thr_id_out_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (cmp_io_sync_en2           ),// Convert from cmp to io.
     .dout    (thr_id_out_cmp2[ 5:0]     ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_2 buf_id_out_cmp_ff         
    (.din     (buf_id_out_sys[ 1:0]     ),
     .scan_in (buf_id_out_cmp_ff_scanin ),
     .scan_out(buf_id_out_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_     ),
     .l1clk   (l1clk                    ),
     .en      (ccu_sys_cmp_sync_en3     ),// Convert from sys to cmp.
     .dout    (buf_id_out_cmp[ 1:0]     ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_2 buf_id_out_cmp2_ff         
    (.din     (buf_id_out_cmp[ 1:0]      ),
     .scan_in (buf_id_out_cmp2_ff_scanin ),
     .scan_out(buf_id_out_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (cmp_io_sync_en2           ),// Convert from cmp to io.
     .dout    (buf_id_out_cmp2[ 1:0]     ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rd_req_vld_cmp_ff         
    (.din     (rd_req_vld_io            ),
     .scan_in (rd_req_vld_cmp_ff_scanin ),
     .scan_out(rd_req_vld_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_     ),
     .l1clk   (l1clk                    ),
     .en      (io_cmp_sync_en2          ),// Convert from io to cmp.
     .dout    (rd_req_vld_cmp           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rd_req_vld_cmp2_ff         
    (.din     (rd_req_vld_cmp            ),
     .scan_in (rd_req_vld_cmp2_ff_scanin ),
     .scan_out(rd_req_vld_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (ccu_cmp_sys_sync_en3      ),// Convert from cmp to sys.
     .dout    (rd_req_vld_sys            ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 wr_req_vld_cmp_ff         
    (.din     (wr_req_vld_io            ),
     .scan_in (wr_req_vld_cmp_ff_scanin ),
     .scan_out(wr_req_vld_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_     ),
     .l1clk   (l1clk                    ),
     .en      (io_cmp_sync_en2          ),// Convert from io to cmp.
     .dout    (wr_req_vld_cmp           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 wr_req_vld_cmp2_ff         
    (.din     (wr_req_vld_cmp            ),
     .scan_in (wr_req_vld_cmp2_ff_scanin ),
     .scan_out(wr_req_vld_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (ccu_cmp_sys_sync_en3      ),// Convert from cmp to sys.
     .dout    (wr_req_vld_sys            ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_mcu_selfrsh_cmp_ff         
    (.din     (rst_mcu_selfrsh_sys2          ),    
     .scan_in (rst_mcu_selfrsh_cmp_ff_scanin ),
     .scan_out(rst_mcu_selfrsh_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_          ),
     .l1clk   (l1clk                         ),
     .en      (ccu_sys_cmp_sync_en3          ), // Cross fr sys to cmp to io.
     .dout    (rst_mcu_selfrsh_cmp           ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr sys to cmp to io.

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_mcu_selfrsh_cmp2_ff         
    (.din     (rst_mcu_selfrsh_cmp            ),
     .scan_in (rst_mcu_selfrsh_cmp2_ff_scanin ),
     .scan_out(rst_mcu_selfrsh_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_           ),
     .l1clk   (l1clk                          ),
     .en      (cmp_io_sync_en2                ),// Convert fr cmp to io.
     .dout    (rst_mcu_selfrsh_cmp2           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_l2_por_ff         
    (.din     (rst_l2_por_sys2_     ),    
     .scan_in (rst_l2_por_ff_scanin ),
     .scan_out(rst_l2_por_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_         ),
     .l1clk   (l1clk                ),
     .en      (ccu_sys_cmp_sync_en3 ), // Cross fr sys_clk to cmp_clk.
     .dout    (rst_l2_por_          ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr sys_clk to cmp_clk.

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_l2_wmr_ff         
    (.din     (rst_l2_wmr_sys2_     ),    
     .scan_in (rst_l2_wmr_ff_scanin ),
     .scan_out(rst_l2_wmr_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_         ),
     .l1clk   (l1clk                ),
     .en      (ccu_sys_cmp_sync_en3 ), // Cross fr sys_clk to cmp_clk.
     .dout    (rst_l2_wmr_          ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr sys_clk to cmp_clk.

// rst_wmr_protect generation moved to rst_fsm_ctl, since untimed.
//
// msff_ctl_macro rst_wmr_protect_cmp_ff         (width=1,en=1,clr_=0)
//     (.din     (rst_wmr_protect_sys2          ),    
//      .scan_in (rst_wmr_protect_cmp_ff_scanin ),
//      .scan_out(rst_wmr_protect_cmp_ff_scanout),
// //   .clr_    (rst_cmp_ctl_wmr_cmp_          ),// Don't clear during WMR.
//      .l1clk   (l1clk                         ),
//      .en      (ccu_sys_cmp_sync_en3          ), // Cross fr sys_clk-cmp_clk.
//      .dout    (rst_wmr_protect_cmp           ));// Cross fr sys_clk-cmp_clk.
// 
// assign rst_wmr_protect = tcu_rst_scan_mode ?
//                          1'b0 : // Suppress when chip is being scanned.
//                          ~mio_rst_pwron_rst_l_sys_ ? // This is a TCU bug.
//                          1'b0 : // Make not x when chip is in POR.
//                          rst_wmr_protect_cmp;
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__0__en_1__width_1 rst_tcu_clk_stop_cmp_ff         
    (.din     (rst_tcu_clk_stop_sys2          ),    
//   .clr_    (rst_cmp_ctl_wmr_cmp_           ), // Needs to keep going.
     .scan_in (rst_tcu_clk_stop_cmp_ff_scanin ),
     .scan_out(rst_tcu_clk_stop_cmp_ff_scanout),
     .l1clk   (l1clk_free_running             ), // Needs to keep going.
     .en      (ccu_sys_cmp_sync_en3           ), // Cross fr sys_clk to cmp_clk.
     .dout    (rst_tcu_clk_stop               ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_tcu_clk_stop_io_ff         
    (.din     (rst_tcu_clk_stop              ),
     .scan_in (rst_tcu_clk_stop_io_ff_scanin ),
     .scan_out(rst_tcu_clk_stop_io_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_          ),
     .l1clk   (l1clk_free_running            ), // Needs to keep going.
     .en      (cmp_io_sync_en2               ), // Cross fr cmp_clk to  io_clk.
     .dout    (rst_tcu_clk_stop_io           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

//BP 9-27-05 note: to make sure rst_dmu_peu_por_ is repeatable. S has
//         implemented a counter after rst_ccu_ is deasserted and counts
//         sys clocks and then releases rst_dmu_peu_por_sys2_ thus
//         the por to dmu and peu will always happen the same number
//         of sys clocks after PWRON_RST_L is deasserted

rst_cmp_ctl_msff_ctl_macro__clr__0__en_1__width_1 rst_dmu_peu_por_ff         
    (.din     (rst_dmu_peu_por_sys2_     ),    
//   .clr_    (rst_cmp_ctl_wmr_cmp_          ),// Don't clear during WMR.
     .scan_in (rst_dmu_peu_por_ff_scanin ),
     .scan_out(rst_dmu_peu_por_ff_scanout),
     .l1clk   (l1clk                     ),
     .en      (ccu_sys_cmp_sync_en3      ), // Cross fr sys_clk to cmp_clk.
     .dout    (rst_dmu_peu_por_          ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr sys_clk to cmp_clk.

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_dmu_peu_wmr_ff         
    (.din     (rst_dmu_peu_wmr_sys2_     ),    
     .scan_in (rst_dmu_peu_wmr_ff_scanin ),
     .scan_out(rst_dmu_peu_wmr_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (ccu_sys_cmp_sync_en3      ), // Cross fr sys_clk to cmp_clk.
     .dout    (rst_dmu_peu_wmr_          ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr sys_clk to cmp_clk.

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_niu_mac_ff         
    (.din     (rst_niu_mac_sys2_     ),    
     .scan_in (rst_niu_mac_ff_scanin ),
     .scan_out(rst_niu_mac_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_  ),
     .l1clk   (l1clk                 ),
     .en      (ccu_sys_cmp_sync_en3  ), // Cross fr sys_clk to cmp_clk.
     .dout    (rst_niu_mac_          ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr sys_clk to cmp_clk.

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_niu_wmr_ff         
    (.din     (rst_niu_wmr_sys2_     ),    
     .scan_in (rst_niu_wmr_ff_scanin ),
     .scan_out(rst_niu_wmr_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_  ),
     .l1clk   (l1clk                 ),
     .en      (ccu_sys_cmp_sync_en3  ), // Cross fr sys_clk to cmp_clk.
     .dout    (rst_niu_wmr_          ),
  .siclk(siclk),
  .soclk(soclk));// Cross fr sys_clk to cmp_clk.
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_ncu_unpark_thread_cmp_ff         
    (.din     (rst_ncu_unpark_thread_sys2          ),
     .scan_in (rst_ncu_unpark_thread_cmp_ff_scanin ),
     .scan_out(rst_ncu_unpark_thread_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                ),
     .l1clk   (l1clk                               ),
     .en      (ccu_sys_cmp_sync_en3                ),// Convert fr sys to cmp.
     .dout    (rst_ncu_unpark_thread_cmp           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_ncu_unpark_thread_cmp2_ff         
    (.din     (rst_ncu_unpark_thread_cmp            ),
     .scan_in (rst_ncu_unpark_thread_cmp2_ff_scanin ),
     .scan_out(rst_ncu_unpark_thread_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                 ),
     .l1clk   (l1clk                                ),
     .en      (cmp_io_sync_en2                      ),// Convert fr cmp to io.
     .dout    (rst_ncu_unpark_thread_cmp2           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           rst_ncu_xir_din   = ~rst_ncu_xir_sys2_;
assign         rst_ncu_xir_cmp2_ = ~rst_ncu_xir_dout;
                                              // Store as active low, so
                                              // resets to deasserted value.
rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_ncu_xir_cmp_ff         
    (.din     (rst_ncu_xir_din           ),
     .scan_in (rst_ncu_xir_cmp_ff_scanin ),
     .scan_out(rst_ncu_xir_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (ccu_sys_cmp_sync_en3      ),// Convert fr sys to cmp.
     .dout    (rst_ncu_xir_cmp_          ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_ncu_xir_cmp2_ff         
    (.din     (rst_ncu_xir_cmp_           ),
     .scan_in (rst_ncu_xir_cmp2_ff_scanin ),
     .scan_out(rst_ncu_xir_cmp2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_       ),
     .l1clk   (l1clk                      ),
     .en      (cmp_io_sync_en2            ),// Convert fr cmp to io.
     .dout    (rst_ncu_xir_dout           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 ncu_rst_xir_done_cmp_ff         
    (.din     (ncu_rst_xir_done_io            ),
     .scan_in (ncu_rst_xir_done_cmp_ff_scanin ),
     .scan_out(ncu_rst_xir_done_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_           ),
     .l1clk   (l1clk                          ),
     .en      (io_cmp_sync_en2                ),// Convert from io to cmp.
     .dout    (ncu_rst_xir_done_cmp           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 ncu_rst_xir_done_sys_ff         
    (.din     (ncu_rst_xir_done_cmp           ),
     .scan_in (ncu_rst_xir_done_sys_ff_scanin ),
     .scan_out(ncu_rst_xir_done_sys_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_           ),
     .l1clk   (l1clk                          ),
     .en      (ccu_cmp_sys_sync_en3           ),// Cross fr cmp to sys.
     .dout    (ncu_rst_xir_done_sys           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 tcu_rst_efu_done_sys_ff         
    (.din     (tcu_rst_efu_done               ),
     .scan_in (tcu_rst_efu_done_sys_ff_scanin ),
     .scan_out(tcu_rst_efu_done_sys_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_           ),
     .l1clk   (l1clk                          ),
     .en      (ccu_cmp_sys_sync_en3           ),// Cross fr cmp to sys.
     .dout    (tcu_rst_efu_done_cmp           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 tcu_bisx_done_sys_ff         
    (.din     (tcu_bisx_done               ),
     .scan_in (tcu_bisx_done_sys_ff_scanin ),
     .scan_out(tcu_bisx_done_sys_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_        ),
     .l1clk   (l1clk                       ),
     .en      (ccu_cmp_sys_sync_en3        ),// Cross fr cmp to sys.
     .dout    (tcu_bisx_done_cmp           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 tcu_test_protect_cmp0_ff         
    (.din     (tcu_test_protect_io             ),
     .scan_in (tcu_test_protect_cmp0_ff_scanin ),
     .scan_out(tcu_test_protect_cmp0_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_            ),
     .l1clk   (l1clk                           ),
     .en      (io_cmp_sync_en2                 ),// Convert from io to cmp.
     .dout    (tcu_test_protect_cmp0           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 tcu_test_protect_cmp_ff         
    (.din     (tcu_test_protect_cmp0          ),
     .scan_in (tcu_test_protect_cmp_ff_scanin ),
     .scan_out(tcu_test_protect_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_           ),
     .l1clk   (l1clk                          ),
     .en      (ccu_cmp_sys_sync_en3           ),// Cross fr cmp to sys.
     .dout    (tcu_test_protect_cmp           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__0__en_1__width_1 ccu_rst_change_cmp0_ff         
    (.din     (ccu_rst_change_io             ),
//   .clr_    (rst_cmp_ctl_wmr_cmp_          ),// Don't assert during WMR.
     .scan_in (ccu_rst_change_cmp0_ff_scanin ),
     .scan_out(ccu_rst_change_cmp0_ff_scanout),
     .l1clk   (l1clk                         ),
     .en      (io_cmp_sync_en2               ),// Convert from io to cmp.
     .dout    (ccu_rst_change_cmp0           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__0__en_1__width_1 ccu_rst_change_cmp_ff         
    (.din     (ccu_rst_change_cmp0          ),
//   .clr_    (rst_cmp_ctl_wmr_cmp_         ),// Don't assert during WMR.
     .scan_in (ccu_rst_change_cmp_ff_scanin ),
     .scan_out(ccu_rst_change_cmp_ff_scanout),
     .l1clk   (l1clk                        ),
     .en      (ccu_cmp_sys_sync_en3         ),// Cross fr cmp to sys.
     .dout    (ccu_rst_change_cmp           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 ncu_rst_fatal_error_cmp0_ff         
    (.din     (ncu_rst_fatal_error_io            ),
     .scan_in (ncu_rst_fatal_error_cmp0_ff_scanin ),
     .scan_out(ncu_rst_fatal_error_cmp0_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_               ),
     .l1clk   (l1clk                              ),
     .en      (io_cmp_sync_en2                    ),// Convert from io to cmp.
     .dout    (ncu_rst_fatal_error_cmp0           ),
  .siclk(siclk),
  .soclk(soclk));

assign         ncu_rst_fatal_error_hold_din  =
               ncu_rst_fatal_error_hold_dout ?
             (~ncu_rst_fatal_error_cmp     |   // Hold if pulse
                                               // has not yet crossed to sys
               ncu_rst_fatal_error_cmp0    ) : // or input is still high
                                               // (has not yet fallen).
               ncu_rst_fatal_error_cmp0    &   // Assert when input asserts
              ~ncu_rst_fatal_error_cmp       ; // and output has fallen.

rst_cmp_ctl_msff_ctl_macro__clr__1__width_1 ncu_rst_fatal_error_hold_ff         
    (.din     (ncu_rst_fatal_error_hold_din       ),
     .scan_in (ncu_rst_fatal_error_hold_ff_scanin ),
     .scan_out(ncu_rst_fatal_error_hold_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_               ),
     .l1clk   (l1clk                              ),
     .dout    (ncu_rst_fatal_error_hold_dout      ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 ncu_rst_fatal_error_cmp_ff         
    (.din     (ncu_rst_fatal_error_hold_dout     ),
     .scan_in (ncu_rst_fatal_error_cmp_ff_scanin ),
     .scan_out(ncu_rst_fatal_error_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_              ),
     .l1clk   (l1clk                             ),
     .en      (ccu_cmp_sys_sync_en3              ),// Cross fr cmp to sys.
     .dout    (ncu_rst_fatal_error_cmp           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_8 l2ta_rst_fatal_error_cmp0_ff         
    (.din     (l2ta_rst_fatal_error_io[7:0]        ),
     .scan_in (l2ta_rst_fatal_error_cmp0_ff_scanin ),
     .scan_out(l2ta_rst_fatal_error_cmp0_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                ),
     .l1clk   (l1clk                               ),
     .en      (io_cmp_sync_en2                     ),// Convert from io to cmp.
     .dout    (l2ta_rst_fatal_error_cmp0[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));

assign         l2ta_rst_fatal_error_hold_din [7]  =
               l2ta_rst_fatal_error_hold_dout[7] ?
            ~( l2ta_rst_fatal_error_cmp      [7] &  // Drop when pulse has
                                                    // crossed to sys and
              ~l2ta_rst_fatal_error_cmp0     [7] ) :// input has fallen.
               l2ta_rst_fatal_error_cmp0     [7] &  // Assert when input rises
              ~l2ta_rst_fatal_error_cmp      [7]   ;// and output has fallen.

assign         l2ta_rst_fatal_error_hold_din [6]  =
               l2ta_rst_fatal_error_hold_dout[6] ?
            ~( l2ta_rst_fatal_error_cmp      [6] &  // Drop when pulse has
                                                    // crossed to sys and
              ~l2ta_rst_fatal_error_cmp0     [6] ) :// input has fallen.
               l2ta_rst_fatal_error_cmp0     [6] &  // Assert when input rises
              ~l2ta_rst_fatal_error_cmp      [6]   ;// and output has fallen.

assign         l2ta_rst_fatal_error_hold_din [5]  =
               l2ta_rst_fatal_error_hold_dout[5] ?
            ~( l2ta_rst_fatal_error_cmp      [5] &  // Drop when pulse has
                                                    // crossed to sys and
              ~l2ta_rst_fatal_error_cmp0     [5] ) :// input has fallen.
               l2ta_rst_fatal_error_cmp0     [5] &  // Assert when input rises
              ~l2ta_rst_fatal_error_cmp      [5]   ;// and output has fallen.

assign         l2ta_rst_fatal_error_hold_din [4]  =
               l2ta_rst_fatal_error_hold_dout[4] ?
            ~( l2ta_rst_fatal_error_cmp      [4] &  // Drop when pulse has
                                                    // crossed to sys and
              ~l2ta_rst_fatal_error_cmp0     [4] ) :// input has fallen.
               l2ta_rst_fatal_error_cmp0     [4] &  // Assert when input rises
              ~l2ta_rst_fatal_error_cmp      [4]   ;// and output has fallen.

assign         l2ta_rst_fatal_error_hold_din [3]  =
               l2ta_rst_fatal_error_hold_dout[3] ?
            ~( l2ta_rst_fatal_error_cmp      [3] &  // Drop when pulse has
                                                    // crossed to sys and
              ~l2ta_rst_fatal_error_cmp0     [3] ) :// input has fallen.
               l2ta_rst_fatal_error_cmp0     [3] &  // Assert when input rises
              ~l2ta_rst_fatal_error_cmp      [3]   ;// and output has fallen.

assign         l2ta_rst_fatal_error_hold_din [2]  =
               l2ta_rst_fatal_error_hold_dout[2] ?
            ~( l2ta_rst_fatal_error_cmp      [2] &  // Drop when pulse has
                                                    // crossed to sys and
              ~l2ta_rst_fatal_error_cmp0     [2] ) :// input has fallen.
               l2ta_rst_fatal_error_cmp0     [2] &  // Assert when input rises
              ~l2ta_rst_fatal_error_cmp      [2]   ;// and output has fallen.

assign         l2ta_rst_fatal_error_hold_din [1]  =
               l2ta_rst_fatal_error_hold_dout[1] ?
            ~( l2ta_rst_fatal_error_cmp      [1] &  // Drop when pulse has
                                                    // crossed to sys and
              ~l2ta_rst_fatal_error_cmp0     [1] ) :// input has fallen.
               l2ta_rst_fatal_error_cmp0     [1] &  // Assert when input rises
              ~l2ta_rst_fatal_error_cmp      [1]   ;// and output has fallen.

assign         l2ta_rst_fatal_error_hold_din [0]  =
               l2ta_rst_fatal_error_hold_dout[0] ?
            ~( l2ta_rst_fatal_error_cmp      [0] &  // Drop when pulse has
                                                    // crossed to sys and
              ~l2ta_rst_fatal_error_cmp0     [0] ) :// input has fallen.
               l2ta_rst_fatal_error_cmp0     [0] &  // Assert when input rises
              ~l2ta_rst_fatal_error_cmp      [0]   ;// and output has fallen.

rst_cmp_ctl_msff_ctl_macro__clr__1__width_8 l2ta_rst_fatal_error_hold_ff         
    (.din     (l2ta_rst_fatal_error_hold_din[7:0]  ),
     .scan_in (l2ta_rst_fatal_error_hold_ff_scanin ),
     .scan_out(l2ta_rst_fatal_error_hold_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_                ),
     .l1clk   (l1clk                               ),
     .dout    (l2ta_rst_fatal_error_hold_dout[7:0] ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_8 l2ta_rst_fatal_error_cmp_ff         
    (.din     (l2ta_rst_fatal_error_hold_dout[7:0]),
     .scan_in (l2ta_rst_fatal_error_cmp_ff_scanin ),
     .scan_out(l2ta_rst_fatal_error_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_               ),
     .l1clk   (l1clk                              ),
     .en      (ccu_cmp_sys_sync_en3               ),// Cross fr cmp to sys.
     .dout    (l2ta_rst_fatal_error_cmp[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));

assign        {l2t7_rst_fatal_error_cmp           ,
               l2t6_rst_fatal_error_cmp           ,
               l2t5_rst_fatal_error_cmp           ,
               l2t4_rst_fatal_error_cmp           ,
               l2t3_rst_fatal_error_cmp           ,
               l2t2_rst_fatal_error_cmp           ,
               l2t1_rst_fatal_error_cmp           ,
               l2t0_rst_fatal_error_cmp           } =
               l2ta_rst_fatal_error_cmp[7:0]      ; // l2t all in one array.
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 mio_rst_pb_rst_cmp_ff         
    (.din     (mio_rst_pb_rst_sys_          ),
     .scan_in (mio_rst_pb_rst_cmp_ff_scanin ),
     .scan_out(mio_rst_pb_rst_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_         ),
     .l1clk   (l1clk                        ),
     .en      (ccu_sys_cmp_sync_en3         ),// Convert fr sys to cmp.
     .dout    (mio_rst_pb_rst_cmp_          ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 mio_rst_pb_rst_sys2_ff         
    (.din     (mio_rst_pb_rst_cmp_           ),
     .scan_in (mio_rst_pb_rst_sys2_ff_scanin ),
     .scan_out(mio_rst_pb_rst_sys2_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_          ),
     .l1clk   (l1clk                         ),
     .en      (ccu_cmp_sys_sync_en3          ),// Convert fr cmp to sys.
     .dout    (mio_rst_pb_rst_sys2_          ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

// //
// // Incoming from MIO, asynchronous
// 
// cl_sc1_clksyncff_4x
//                mio_rst_pwron_rst_cmp_ff
//     (.si      (mio_rst_pwron_rst_cmp_ff_scanin ), // Remember to re-link
//                                                   // into chain of assigns
//      .so      (mio_rst_pwron_rst_cmp_ff_scanout), // when rerunning fixscan.
//      .l1clk   (l1clk                           ),
//      .d       (ccu_rst_sync_stable             ),
//      .q       (mio_rst_pwron_rst_cmp_          ));// Cross fr async to cmp.
//                                                   // Review Oct 24 '05:
// //   .d       (mio_rst_pwron_rst_l             ), // This input will deassert
//                                                   // before the clock starts.

rst_cmp_ctl_msff_ctl_macro__clr__0__en_1__width_1 rst_cmp_ctl_wmr_cmp_ff         
    (.din     (rst_cmp_ctl_wmr_sys2_         ),
//   .clr_    (rst_cmp_ctl_wmr_cmp_          ),// Avoid loop.
     .scan_in (rst_cmp_ctl_wmr_cmp_ff_scanin ),
     .scan_out(rst_cmp_ctl_wmr_cmp_ff_scanout),
     .l1clk   (l1clk                         ),
     .en      (ccu_sys_cmp_sync_en3          ),// Convert fr sys to cmp.
     .dout    (rst_cmp_ctl_wmr_cmp_          ),
  .siclk(siclk),
  .soclk(soclk));

//sign         rst_cmp_ctl_wmr_cmp_            =
//             rst_cmp_ctl_wmr_cmp_dout_       & //  Sync deassert, and
//             rst_cmp_ctl_wmr_sys2_           ; // async   assert.
                                                 // No need for
                                                 // async   assert since
                                                 // only used for sync reset.
//________________________________________________________________

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_rst_por_cmp_ff         
    (.din     (rst_rst_por_sys2_         ),
     .scan_in (rst_rst_por_cmp_ff_scanin ),
     .scan_out(rst_rst_por_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (ccu_sys_cmp_sync_en3      ),// Convert fr sys to cmp.
     .dout    (rst_rst_por_cmp_          ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_rst_por_io_ff         
    (.din     (rst_rst_por_cmp_         ),
     .scan_in (rst_rst_por_io_ff_scanin ),
     .scan_out(rst_rst_por_io_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_     ),
     .l1clk   (l1clk                    ),
     .en      (cmp_io_sync_en2          ),// Convert fr cmp to io.
     .dout    (rst_rst_por_io0_         ),
  .siclk(siclk),
  .soclk(soclk));// One last flop to go, in _io_ctl.

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_rst_wmr_cmp_ff         
    (.din     (rst_rst_wmr_sys2_         ),
     .scan_in (rst_rst_wmr_cmp_ff_scanin ),
     .scan_out(rst_rst_wmr_cmp_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_      ),
     .l1clk   (l1clk                     ),
     .en      (ccu_sys_cmp_sync_en3      ),// Convert fr sys to cmp.
     .dout    (rst_rst_wmr_cmp_          ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 rst_rst_wmr_io_ff         
    (.din     (rst_rst_wmr_cmp_         ),
     .scan_in (rst_rst_wmr_io_ff_scanin ),
     .scan_out(rst_rst_wmr_io_ff_scanout),
     .clr_    (rst_cmp_ctl_wmr_cmp_     ),
     .l1clk   (l1clk                    ),
     .en      (cmp_io_sync_en2          ),// Convert fr cmp to io.
     .dout    (rst_rst_wmr_io0_         ),
  .siclk(siclk),
  .soclk(soclk));// One last flop to go, in _io_ctl.
//________________________________________________________________

     // "Note 2. In every cluster that uses domain crossing,
     // *_sync_en signals are to be flopped once, after the "cmp"
     // cluster header output."  "Cluster Heder Usage, Niagara 2",
     // Version 1.41, Apr 29, 2005, Appendix B, "Cluster Header
     // Waveforms", page 16.

rst_cmp_ctl_msff_ctl_macro__clr__0__en_0__width_1 cmp_io_sync_en2_ff         
    (.din     (cmp_io_sync_en            ),
     .scan_in (cmp_io_sync_en2_ff_scanin ),
     .scan_out(cmp_io_sync_en2_ff_scanout),
//   .clr_    (rst_cmp_ctl_wmr_cmp_      ),// Shift-in reset.
     .l1clk   (l1clk                     ),
     .dout    (cmp_io_sync_en2           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__0__en_0__width_1 io_cmp_sync_en2_ff         
    (.din     (io_cmp_sync_en            ),
     .scan_in (io_cmp_sync_en2_ff_scanin ),
     .scan_out(io_cmp_sync_en2_ff_scanout),
//   .clr_    (rst_cmp_ctl_wmr_cmp_      ),// Shift-in reset.
     .l1clk   (l1clk                     ),
     .dout    (io_cmp_sync_en2           ),
  .siclk(siclk),
  .soclk(soclk));

     // Since the cmp-sys CDC sync_en signals are used directly,
     // without being buffered by a cluster header, we flop them
     // once upon arrival to the Reset Unit, and once more to allow
     // each leaf flop to drive approximately 15 loads.

// assign ccu_cmp_sys_sync_en3 = ccu_cmp_sys_sync_en;// Until ccu adjusts.
// assign ccu_sys_cmp_sync_en3 = ccu_sys_cmp_sync_en;// Until ccu adjusts.

rst_cmp_ctl_msff_ctl_macro__clr__0__en_0__width_1 ccu_cmp_sys_sync_en2_ff         
    (.din     (ccu_cmp_sys_sync_en            ),
//   .clr_    (rst_cmp_ctl_wmr_cmp_           ),
     .scan_in (ccu_cmp_sys_sync_en2_ff_scanin ),
     .scan_out(ccu_cmp_sys_sync_en2_ff_scanout),
     .l1clk   (l1clk_free_running             ),
     .dout    (ccu_cmp_sys_sync_en2           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__0__en_0__width_1 ccu_cmp_sys_sync_en3_ff         
    (.din     (ccu_cmp_sys_sync_en2           ),
//   .clr_    (rst_cmp_ctl_wmr_cmp_           ),
     .scan_in (ccu_cmp_sys_sync_en3_ff_scanin ),
     .scan_out(ccu_cmp_sys_sync_en3_ff_scanout),
     .l1clk   (l1clk_free_running             ),
     .dout    (ccu_cmp_sys_sync_en3           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__0__en_0__width_1 ccu_sys_cmp_sync_en2_ff         
    (.din     (ccu_sys_cmp_sync_en            ),
//   .clr_    (rst_cmp_ctl_wmr_cmp_           ),
     .scan_in (ccu_sys_cmp_sync_en2_ff_scanin ),
     .scan_out(ccu_sys_cmp_sync_en2_ff_scanout),
     .l1clk   (l1clk_free_running             ),
     .dout    (ccu_sys_cmp_sync_en2           ),
  .siclk(siclk),
  .soclk(soclk));

rst_cmp_ctl_msff_ctl_macro__clr__0__en_0__width_1 ccu_sys_cmp_sync_en3_ff         
    (.din     (ccu_sys_cmp_sync_en2           ),
//   .clr_    (rst_cmp_ctl_wmr_cmp_           ),
     .scan_in (ccu_sys_cmp_sync_en3_ff_scanin ),
     .scan_out(ccu_sys_cmp_sync_en3_ff_scanout),
     .l1clk   (l1clk_free_running             ),
     .dout    (ccu_sys_cmp_sync_en3           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_cmp_ctl_l1clkhdr_ctl_macro clkgen (
   .l2clk  (l2clk       ),
   .l1en   (1'b1        ),
   .pce_ov (tcu_pce_ov  ), // (No assign needed.)
   .stop   (tcu_clk_stop), // Qualified by assign stmt.
   .se     (tcu_scan_en ), // Qualified by assign stmt.
   .l1clk  (l1clk       ));

rst_cmp_ctl_l1clkhdr_ctl_macro rst_tcu_clk_stop_clkgen (
   .l2clk  (l2clk       ),
   .l1en   (1'b1        ),
   .pce_ov (tcu_pce_ov  ), // (No assign needed.)
   .stop   (1'b0        ), // Need to keep going to deassert rst_tcu_clk_stop.
   .se     (tcu_scan_en ), // Qualified by assign stmt.
   .l1clk  (l1clk_free_running));

// grep "Number of cells:" rst_*_l/*/scf/dc/rpt/syn_area.rpt
//                               Number of cells/450 = spare gate macros
// rst_cmp_l/rst_cmp_ctl/scf/dc/rpt/syn_area.rpt:        Num:  22 /450=1

rst_cmp_ctl_spare_ctl_macro__num_1 spares  (
        .scan_in (spares_scanin ),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)        );
//________________________________________________________________

// No longer need to re-link the following: rst_cmp_ctl_wmr_cmp_ff has replaced
//                                          mio_rst_pwron_rst_cmp_ff.
                                            // Remember to re-link
                                            // into chain of assign statments
                                            // when rerunning fixscan.
// assign mio_rst_pwron_rst_cmp_ff_scanin = io_cmp_sync_en2_ff_scanout      ;
// assign spares_scanin                   = mio_rst_pwron_rst_cmp_ff_scanout;

// But still do the following:
// After run fixscan, remember to comment out the line:
//     assign scan_out                  = spares_scanout           ;
// because elsewhere we have:
//     assign scan_out
//                       = tcu_rst_scan_mode ? spares_scanout     : 1'b0;

//________________________________________________________________

// fixscan start:
assign rst_tcu_pwron_rst_l_ff_scanin = scan_in                  ;
assign rst_rst_pwron_rst_l_io0_ff_scanin = rst_tcu_pwron_rst_l_ff_scanout;
assign rst_tcu_flush_init_req_ff_scanin = rst_rst_pwron_rst_l_io0_ff_scanout;
assign rst_tcu_flush_stop_req_ff_scanin = rst_tcu_flush_init_req_ff_scanout;
assign rst_tcu_asicflush_stop_req_ff_scanin = rst_tcu_flush_stop_req_ff_scanout;
assign rst_tcu_dbr_gen_ff_scanin = rst_tcu_asicflush_stop_req_ff_scanout;
assign tcu_rst_flush_init_ack_ff_scanin = rst_tcu_dbr_gen_ff_scanout;
assign tcu_rst_flush_stop_ack_ff_scanin = tcu_rst_flush_init_ack_ff_scanout;
assign tcu_rst_asicflush_stop_ack_ff_scanin = tcu_rst_flush_stop_ack_ff_scanout;
assign req_acpted_cmp_ff_scanin  = tcu_rst_asicflush_stop_ack_ff_scanout;
assign req_acpted_cmp2_ff_scanin = req_acpted_cmp_ff_scanout;
assign rd_ack_vld_cmp_ff_scanin  = req_acpted_cmp2_ff_scanout;
assign rd_ack_vld_cmp2_ff_scanin = rd_ack_vld_cmp_ff_scanout;
assign rd_nack_vld_cmp_ff_scanin = rd_ack_vld_cmp2_ff_scanout;
assign rd_nack_vld_cmp2_ff_scanin = rd_nack_vld_cmp_ff_scanout;
assign data_out_cmp_ff_scanin    = rd_nack_vld_cmp2_ff_scanout;
assign data_out_cmp2_ff_scanin   = data_out_cmp_ff_scanout  ;
assign addr_in_cmp_ff_scanin     = data_out_cmp2_ff_scanout ;
assign addr_in_sys_ff_scanin     = addr_in_cmp_ff_scanout   ;
assign data_in_cmp_ff_scanin     = addr_in_sys_ff_scanout   ;
assign data_in_sys_ff_scanin     = data_in_cmp_ff_scanout   ;
assign thr_id_in_cmp_ff_scanin   = data_in_sys_ff_scanout   ;
assign thr_id_in_sys_ff_scanin   = thr_id_in_cmp_ff_scanout ;
assign buf_id_in_cmp_ff_scanin   = thr_id_in_sys_ff_scanout ;
assign buf_id_in_sys_ff_scanin   = buf_id_in_cmp_ff_scanout ;
assign ack_busy_cmp_ff_scanin    = buf_id_in_sys_ff_scanout ;
assign ack_busy_sys_ff_scanin    = ack_busy_cmp_ff_scanout  ;
assign thr_id_out_cmp_ff_scanin  = ack_busy_sys_ff_scanout  ;
assign thr_id_out_cmp2_ff_scanin = thr_id_out_cmp_ff_scanout;
assign buf_id_out_cmp_ff_scanin  = thr_id_out_cmp2_ff_scanout;
assign buf_id_out_cmp2_ff_scanin = buf_id_out_cmp_ff_scanout;
assign rd_req_vld_cmp_ff_scanin  = buf_id_out_cmp2_ff_scanout;
assign rd_req_vld_cmp2_ff_scanin = rd_req_vld_cmp_ff_scanout;
assign wr_req_vld_cmp_ff_scanin  = rd_req_vld_cmp2_ff_scanout;
assign wr_req_vld_cmp2_ff_scanin = wr_req_vld_cmp_ff_scanout;
assign rst_mcu_selfrsh_cmp_ff_scanin = wr_req_vld_cmp2_ff_scanout;
assign rst_mcu_selfrsh_cmp2_ff_scanin = rst_mcu_selfrsh_cmp_ff_scanout;
assign rst_l2_por_ff_scanin      = rst_mcu_selfrsh_cmp2_ff_scanout;
assign rst_l2_wmr_ff_scanin      = rst_l2_por_ff_scanout    ;
assign rst_tcu_clk_stop_cmp_ff_scanin = rst_l2_wmr_ff_scanout    ;
assign rst_tcu_clk_stop_io_ff_scanin = rst_tcu_clk_stop_cmp_ff_scanout;
assign rst_dmu_peu_por_ff_scanin = rst_tcu_clk_stop_io_ff_scanout;
assign rst_dmu_peu_wmr_ff_scanin = rst_dmu_peu_por_ff_scanout;
assign rst_niu_mac_ff_scanin     = rst_dmu_peu_wmr_ff_scanout;
assign rst_niu_wmr_ff_scanin     = rst_niu_mac_ff_scanout   ;
assign rst_ncu_unpark_thread_cmp_ff_scanin = rst_niu_wmr_ff_scanout   ;
assign rst_ncu_unpark_thread_cmp2_ff_scanin = rst_ncu_unpark_thread_cmp_ff_scanout;
assign rst_ncu_xir_cmp_ff_scanin = rst_ncu_unpark_thread_cmp2_ff_scanout;
assign rst_ncu_xir_cmp2_ff_scanin = rst_ncu_xir_cmp_ff_scanout;
assign ncu_rst_xir_done_cmp_ff_scanin = rst_ncu_xir_cmp2_ff_scanout;
assign ncu_rst_xir_done_sys_ff_scanin = ncu_rst_xir_done_cmp_ff_scanout;
assign tcu_rst_efu_done_sys_ff_scanin = ncu_rst_xir_done_sys_ff_scanout;
assign tcu_bisx_done_sys_ff_scanin = tcu_rst_efu_done_sys_ff_scanout;
assign tcu_test_protect_cmp0_ff_scanin = tcu_bisx_done_sys_ff_scanout;
assign tcu_test_protect_cmp_ff_scanin = tcu_test_protect_cmp0_ff_scanout;
assign ccu_rst_change_cmp0_ff_scanin = tcu_test_protect_cmp_ff_scanout;
assign ccu_rst_change_cmp_ff_scanin = ccu_rst_change_cmp0_ff_scanout;
assign ncu_rst_fatal_error_cmp0_ff_scanin = ccu_rst_change_cmp_ff_scanout;
assign ncu_rst_fatal_error_hold_ff_scanin = ncu_rst_fatal_error_cmp0_ff_scanout;
assign ncu_rst_fatal_error_cmp_ff_scanin = ncu_rst_fatal_error_hold_ff_scanout;
assign l2ta_rst_fatal_error_cmp0_ff_scanin = ncu_rst_fatal_error_cmp_ff_scanout;
assign l2ta_rst_fatal_error_hold_ff_scanin = l2ta_rst_fatal_error_cmp0_ff_scanout;
assign l2ta_rst_fatal_error_cmp_ff_scanin = l2ta_rst_fatal_error_hold_ff_scanout;
assign mio_rst_pb_rst_cmp_ff_scanin = l2ta_rst_fatal_error_cmp_ff_scanout;
assign mio_rst_pb_rst_sys2_ff_scanin = mio_rst_pb_rst_cmp_ff_scanout;
assign rst_cmp_ctl_wmr_cmp_ff_scanin = mio_rst_pb_rst_sys2_ff_scanout;
assign rst_rst_por_cmp_ff_scanin = rst_cmp_ctl_wmr_cmp_ff_scanout;
assign rst_rst_por_io_ff_scanin  = rst_rst_por_cmp_ff_scanout;
assign rst_rst_wmr_cmp_ff_scanin = rst_rst_por_io_ff_scanout;
assign rst_rst_wmr_io_ff_scanin  = rst_rst_wmr_cmp_ff_scanout;
assign cmp_io_sync_en2_ff_scanin = rst_rst_wmr_io_ff_scanout;
assign io_cmp_sync_en2_ff_scanin = cmp_io_sync_en2_ff_scanout;
assign ccu_cmp_sys_sync_en2_ff_scanin = io_cmp_sync_en2_ff_scanout;
assign ccu_cmp_sys_sync_en3_ff_scanin = ccu_cmp_sys_sync_en2_ff_scanout;
assign ccu_sys_cmp_sync_en2_ff_scanin = ccu_cmp_sys_sync_en3_ff_scanout;
assign ccu_sys_cmp_sync_en3_ff_scanin = ccu_sys_cmp_sync_en2_ff_scanout;
assign spares_scanin             = ccu_sys_cmp_sync_en3_ff_scanout;

// But still do the following:
// After run fixscan, remember to comment out the line:
//     assign scan_out                  = spares_scanout           ;
// because elsewhere we have:
//     assign scan_out
//                       = tcu_rst_scan_mode ? spares_scanout     : 1'b0;

//sign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule // rst_cmp_ctl






// any PARAMS parms go into naming of macro

module rst_cmp_ctl_msff_ctl_macro__clr__0__en_1__width_1 (
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

module rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_1 (
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

module rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_16 (
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

module rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_40 (
  din, 
  en, 
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
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = (din[39:0] & {40{en}} & ~{40{(~clr_)}}) | (dout[39:0] & ~{40{en}} & ~{40{(~clr_)}});






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

module rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_6 (
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

module rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_2 (
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

module rst_cmp_ctl_msff_ctl_macro__clr__1__width_1 (
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

module rst_cmp_ctl_msff_ctl_macro__clr__1__en_1__width_8 (
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

module rst_cmp_ctl_msff_ctl_macro__clr__1__width_8 (
  din, 
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
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0] & ~{8{(~clr_)}};






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

module rst_cmp_ctl_msff_ctl_macro__clr__0__en_0__width_1 (
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













// any PARAMS parms go into naming of macro

module rst_cmp_ctl_l1clkhdr_ctl_macro (
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


module rst_cmp_ctl_spare_ctl_macro__num_1 (
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
assign scan_out = so_0;



endmodule

