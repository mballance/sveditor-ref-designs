// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_mbist_ctl.v
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
`define CNT_ADDR_HI 14
`define CNT_ADDR_LO 12
`define IAB_ADDR_HI 11
`define IAB_ADDR_LO 9
`define DAB_ADDR_HI 8
`define DAB_ADDR_LO 6
`define EXT_ADDR_HI 5
`define EXT_ADDR_LO 3
`define AE_ADDR_HI 2
`define AE_ADDR_LO 0

//debug event codes
`define WATCH_POINT 2'b00  
`define HARD_STOP 2'b01
`define SOFT_STOP 2'b10
`define START_COUNT 2'b11

//debug event status bit location
`define CNT 4
`define IAB 3
`define DAB 2
`define EXT 1
`define AE 0

// UCB defines, copied from Niagara iop/include/sys.h or iop.h
`define UCB_BUF_HI            11        // (2) buffer ID
`define UCB_BUF_LO            10
`define UCB_THR_HI             9        // (6) cpu/thread ID
`define UCB_THR_LO             4
`define UCB_DATA_HI          127        // (64) data
`define UCB_DATA_LO           64
`define UCB_PKT_HI             3        // (4) packet type
`define UCB_PKT_LO             0
`define UCB_READ_ACK         4'b0001
`define UCB_READ_REQ         4'b0100    // req types
`define UCB_WRITE_ACK        4'b0010
`define UCB_WRITE_REQ        4'b0101
`define UCB_SIZE_HI           14        // (3) request size
`define UCB_SIZE_LO           12
`define UCB_BID_TAP          2'b01
`define UCB_ADDR_HI           54        // (40) bit address
`define UCB_ADDR_LO           15
`define PCX_SZ_8B    3'b011  // encoding for 8B access

// MBIST Defines
`define NUM_TOTAL_MBIST_M1			47
`define NUM_TOTAL_MBIST				48

`define NUM_TOTAL_LBIST				8
`define NUM_TOTAL_LBIST_M1			7

`define MBIST_IDLE       4'd0
`define POR_CLR_DF       4'd1
`define POR_START        4'd2
`define POR_CLR_START    4'd3
`define POR_END_WAIT     4'd4
`define WMR_DUMMY        4'd5
`define WMR_CLR_DF       4'd6
`define WMR_START        4'd7
`define WMR_CLR_START    4'd8
`define WMR_END_WAIT     4'd9
`define BISX_CLR_DF      4'd10
`define BISX_START       4'd11
`define BISX_CLR_START   4'd12



module tcu_mbist_ctl (
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_int_aclk, 
  tcu_int_bclk, 
  tcu_int_se, 
  tcu_int_ce, 
  tcu_pce_ov, 
  tcu_rst_flush_init_ack, 
  start_bisx_por, 
  start_bisx_wmr, 
  stop_bisx_wmr, 
  tcu_bisx_done, 
  mbist_clk_stop_req, 
  mbist_done, 
  mbist_fail, 
  mbist_done_fail, 
  core_avail, 
  mbist_clkstpen, 
  lb_tcu_done_d, 
  mb_tcu_done, 
  mb_tcu_fail, 
  tcu_mb_start, 
  tcu_mbist_bisi_en, 
  tcu_mbist_user_mode, 
  lb_tcu_done, 
  tcu_spc_lbist_start, 
  dmo_coresel, 
  dmo_dcmuxctl, 
  dmo_icmuxctl, 
  spc4_dmo_dout, 
  spc6_dmo_dout, 
  l2t4_dmo_dout, 
  l2t6_dmo_dout, 
  dmo_l2tsel, 
  dmo_tagmuxctl, 
  rtx_tcu_dmo_data_out, 
  tds_tcu_dmo_dout, 
  rdp_tcu_dmo_dout, 
  tcu_rtx_dmo_ctl, 
  tcu_mio_dmo_data, 
  tcu_mio_dmo_sync, 
  tcu_mio_mbist_done, 
  tcu_mio_mbist_fail, 
  tcu_mio_jtag_membist_mode, 
  jtag_dmo_enable, 
  jtag_dmo_control_upd, 
  jtag_dmo_control, 
  dmo_cfg, 
  cmp_io2x_sync_en, 
  io_cmp_sync_en, 
  cmp_io_sync_en, 
  ncu_spc0_core_available, 
  ncu_spc1_core_available, 
  ncu_spc2_core_available, 
  ncu_spc3_core_available, 
  ncu_spc4_core_available, 
  ncu_spc5_core_available, 
  ncu_spc6_core_available, 
  ncu_spc7_core_available, 
  ncu_spc0_core_enable_status, 
  ncu_spc1_core_enable_status, 
  ncu_spc2_core_enable_status, 
  ncu_spc3_core_enable_status, 
  ncu_spc4_core_enable_status, 
  ncu_spc5_core_enable_status, 
  ncu_spc6_core_enable_status, 
  ncu_spc7_core_enable_status, 
  ncu_spc_pm, 
  ncu_spc_ba01, 
  ncu_spc_ba23, 
  ncu_spc_ba45, 
  ncu_spc_ba67, 
  ncu_tcu_bank_avail, 
  bank_avail, 
  tcu_test_protect, 
  tcu_test_protect_cmp, 
  jtag_csr_wr, 
  jtag_csr_addr, 
  jtag_csr_data, 
  ucb_csr_wr, 
  ucb_csr_addr, 
  ucb_data_out, 
  ac_test_mode, 
  csr_ucb_data, 
  csdel_data, 
  cycle_count, 
  tcu_dcr, 
  de_count, 
  debug_reg_hard_stop_domain_1st, 
  tcu_peu_entestcfg, 
  debug_cycle_counter_stop_to_mbc, 
  mbist_clk_stop_to_mbc, 
  debug_cycle_counter_stop, 
  mbist_clk_stop, 
  cycle_stretch_to_mbc, 
  cycle_stretch);
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire jtag_csr_wr_sync_reg_scanin;
wire jtag_csr_wr_sync_reg_scanout;
wire jtag_csr_wr_sync;
wire mb_tcu_done_36_sync_reg_scanin;
wire mb_tcu_done_36_sync_reg_scanout;
wire mb_tcu_done_36_sync;
wire mb_tcu_fail_36_sync_reg_scanin;
wire mb_tcu_fail_36_sync_reg_scanout;
wire mb_tcu_fail_36_sync;
wire tcu_mbist_sync_en_reg_scanin;
wire tcu_mbist_sync_en_reg_scanout;
wire io_cmp_sync_en_local;
wire cmp_io_sync_en_local;
wire cmp_io2x_sync_en_local;
wire tcu_test_protect_cmp_reg_scanin;
wire tcu_test_protect_cmp_reg_scanout;
wire tcu_test_protect_sync;
wire ucb_csr_wr_sync_reg_scanin;
wire ucb_csr_wr_sync_reg_scanout;
wire ucb_csr_wr_sync;
wire ucb_csr_addr_sync_reg_scanin;
wire ucb_csr_addr_sync_reg_scanout;
wire [5:0] ucb_csr_addr_sync;
wire ucb_sel_mbist_mode;
wire ucb_sel_mbist_bypass;
wire ucb_sel_mbist_start;
wire ucb_sel_mbist_abort;
wire ucb_sel_mbist_result;
wire ucb_sel_mbist_get_done;
wire ucb_sel_mbist_get_fail;
wire ucb_sel_mbist_start_wmr;
wire ucb_sel_lbist_mode;
wire ucb_sel_lbist_bypass;
wire ucb_sel_lbist_start;
wire ucb_sel_lbist_get_done;
wire ucb_sel_cycle_count;
wire ucb_sel_dcr;
wire ucb_sel_dec;
wire ucb_sel_clkstp_delay;
wire ucb_sel_clk_domain;
wire ucb_sel_peu_entestcfg;
wire ucb_wr_mbist_mode;
wire ucb_wr_mbist_bypass;
wire ucb_wr_mbist_start;
wire ucb_wr_mbist_abort;
wire ucb_wr_mbist_start_wmr;
wire ucb_wr_lbist_mode;
wire ucb_wr_lbist_bypass;
wire ucb_wr_lbist_start;
wire ucb_wr_peu_entestcfg;
wire jtag_sel_mbist_mode;
wire jtag_sel_mbist_bypass;
wire jtag_sel_mbist_start;
wire jtag_sel_mbist_abort;
wire jtag_sel_mbist_start_wmr;
wire jtag_sel_lbist_mode;
wire jtag_sel_lbist_bypass;
wire jtag_sel_lbist_start;
wire jtag_sel_lbist_abort;
wire jtag_wr_mbist_mode;
wire jtag_wr_mbist_bypass;
wire jtag_wr_mbist_start;
wire jtag_wr_mbist_abort;
wire jtag_wr_mbist_start_wmr;
wire jtag_wr_lbist_mode;
wire jtag_wr_lbist_bypass;
wire jtag_wr_lbist_start;
wire jtag_wr_lbist_abort;
wire [3:0] csr_mbist_mode_din;
wire [3:0] csr_mbist_mode;
wire csr_mbist_mode_reg_scanin;
wire csr_mbist_mode_reg_scanout;
wire tcu_mbist_loop_mode;
wire parallel;
wire hold_start;
wire [47:0] csr_mbist_bypass_din;
wire [47:0] csr_mbist_bypass;
wire csr_mbist_bypass_reg_scanin;
wire csr_mbist_bypass_reg_scanout;
wire csr_mbist_start_reg_scanin;
wire csr_mbist_start_reg_scanout;
wire csr_mbist_start;
wire csr_mbist_abort_din;
wire csr_mbist_abort_reg_scanin;
wire csr_mbist_abort_reg_scanout;
wire csr_mbist_abort;
wire csr_mbist_abort_d_reg_scanin;
wire csr_mbist_abort_d_reg_scanout;
wire csr_mbist_abort_d;
wire csr_mbist_abort_up;
wire csr_mbist_start_wmr_din;
wire clr_mbist_start_wmr;
wire csr_mbist_start_wmr;
wire csr_mbist_start_wmr_reg_scanin;
wire csr_mbist_start_wmr_reg_scanout;
wire [47:0] mbist_done_din;
wire mbist_start_io_sync;
wire [47:0] mbist_skip;
wire [47:0] mb_tcu_done_d;
wire mbist_done_reg_scanin;
wire mbist_done_reg_scanout;
wire [47:0] mbist_fail_din;
wire [47:0] mb_tcu_fail_d;
wire mbist_fail_reg_scanin;
wire mbist_fail_reg_scanout;
wire [1:0] mbist_done_fail_din;
wire [47:0] mbist_skip_or_done;
wire mbist_done_fail_reg_scanin;
wire mbist_done_fail_reg_scanout;
wire mbist_all_done;
wire mbist_all_done_real_time;
wire mbist_one_fail_real_time;
wire [1:0] csr_lbist_mode_din;
wire [1:0] csr_lbist_mode;
wire csr_lbist_mode_reg_scanin;
wire csr_lbist_mode_reg_scanout;
wire [7:0] csr_lbist_bypass_din;
wire [7:0] csr_lbist_bypass;
wire csr_lbist_bypass_reg_scanin;
wire csr_lbist_bypass_reg_scanout;
wire csr_lbist_start_din;
wire lbist_all_done;
wire csr_lbist_start;
wire csr_lbist_start_reg_scanin;
wire csr_lbist_start_reg_scanout;
wire csr_lbist_start_d_reg_scanin;
wire csr_lbist_start_d_reg_scanout;
wire csr_lbist_start_d;
wire csr_lbist_start_up;
wire [7:0] csr_lbist_done_din;
wire [7:0] csr_lbist_done;
wire csr_lbist_done_reg_scanin;
wire csr_lbist_done_reg_scanout;
wire csr_peu_entestcfg_din;
wire csr_peu_entestcfg;
wire csr_peu_entestcfg_reg_scanin;
wire csr_peu_entestcfg_reg_scanout;
wire [63:0] csr_ucb_data_din;
wire csr_ucb_data_reg_scanin;
wire csr_ucb_data_reg_scanout;
wire start_bisx_por_d_reg_scanin;
wire start_bisx_por_d_reg_scanout;
wire start_bisx_por_d;
wire start_bisx_por_up;
wire [3:0] state;
wire bisx_counter_en;
wire bisx_time_out;
wire tcu_mbist_state_reg_scanin;
wire tcu_mbist_state_reg_scanout;
wire mbist_start_io_sync_reg_scanin;
wire mbist_start_io_sync_reg_scanout;
wire hold_start_reg_scanin;
wire hold_start_reg_scanout;
wire clr_mbist_start_wmr_reg_scanin;
wire clr_mbist_start_wmr_reg_scanout;
wire tcu_mbist_user_mode_reg_scanin;
wire tcu_mbist_user_mode_reg_scanout;
wire [17:0] mb_tcu_done_stg_din;
wire mb_tcu_done_stg_reg_scanin;
wire mb_tcu_done_stg_reg_scanout;
wire [17:0] mb_tcu_done_stg;
wire [31:0] mb_tcu_done_d_cmp_din;
wire mb_tcu_done_d_cmp_reg_scanin;
wire mb_tcu_done_d_cmp_reg_scanout;
wire [31:0] mb_tcu_done_d_cmp;
wire [15:0] mb_tcu_done_d_io_din;
wire mb_tcu_done_d_io_reg_scanin;
wire mb_tcu_done_d_io_reg_scanout;
wire [15:0] mb_tcu_done_d_io;
wire [17:0] mb_tcu_fail_stg_din;
wire mb_tcu_fail_stg_reg_scanin;
wire mb_tcu_fail_stg_reg_scanout;
wire [17:0] mb_tcu_fail_stg;
wire [31:0] mb_tcu_fail_d_cmp_din;
wire mb_tcu_fail_d_cmp_reg_scanin;
wire mb_tcu_fail_d_cmp_reg_scanout;
wire [31:0] mb_tcu_fail_d_cmp;
wire [15:0] mb_tcu_fail_d_io_din;
wire mb_tcu_fail_d_io_reg_scanin;
wire mb_tcu_fail_d_io_reg_scanout;
wire [15:0] mb_tcu_fail_d_io;
wire [7:0] tcu_core_avail;
wire [7:0] core_avail_din;
wire core_avail_reg_scanin;
wire core_avail_reg_scanout;
wire [7:0] bank_avail_din;
wire bank_avail_reg_scanin;
wire bank_avail_reg_scanout;
wire [7:0] ncu_core_enable_status;
wire [7:0] core_enable_status_din;
wire [7:0] core_enable_status;
wire core_enable_status_reg_scanin;
wire core_enable_status_reg_scanout;
wire [4:0] ncu_bank_enable_status;
wire [4:0] bank_enable_status_din;
wire [4:0] bank_enable_status;
wire bank_enable_status_reg_scanin;
wire bank_enable_status_reg_scanout;
wire [7:0] bank_enable_status_8;
wire [3:0] bank_avail_4;
wire [47:0] not_core_avail_48;
wire [47:0] not_core_enable_48;
wire [47:0] not_bank_avail_48;
wire [47:0] not_bank_enable_48;
wire prev_skip_done_reg_scanin;
wire prev_skip_done_reg_scanout;
wire [47:0] tcu_mb_start_din;
wire [31:0] tcu_mb_start_d_cmp_din;
wire tcu_mb_start_d_cmp_reg_scanin;
wire tcu_mb_start_d_cmp_reg_scanout;
wire [31:0] tcu_mb_start_d_cmp;
wire [17:0] tcu_mb_start_d2_cmp_din;
wire tcu_mb_start_d2_cmp_reg_scanin;
wire tcu_mb_start_d2_cmp_reg_scanout;
wire [17:0] tcu_mb_start_d2_cmp;
wire [15:0] tcu_mb_start_d_io_din;
wire tcu_mb_start_d_io_reg_scanin;
wire tcu_mb_start_d_io_reg_scanout;
wire [15:0] tcu_mb_start_d_io;
wire tcu_bisx_done_reg_scanin;
wire tcu_bisx_done_reg_scanout;
wire bisx_counter_en_reg_scanin;
wire bisx_counter_en_reg_scanout;
wire [31:0] bisx_counter_din;
wire [31:0] bisx_counter;
wire bisx_counter_reg_scanin;
wire bisx_counter_reg_scanout;
wire tcu_lb_tcu_done_reg_scanin;
wire tcu_lb_tcu_done_reg_scanout;
wire [7:0] lb_prev_clear;
wire [7:0] lbist_skip_or_done;
wire lbist_all_done_din;
wire lbist_all_done_reg_scanin;
wire lbist_all_done_reg_scanout;
wire [7:0] lb_start;
wire tcu_lbist_start_reg_scanin;
wire tcu_lbist_start_reg_scanout;
wire tcu_mb_clkstop_reg_scanin;
wire tcu_mb_clkstop_reg_scanout;
wire mb_clkstop_req;
wire tcu_dmo_ctl_scanin;
wire tcu_dmo_ctl_scanout;
wire spare_flops_scanin;
wire spare_flops_scanout;
wire [11:0] spare_flops_d;
wire [11:0] spare_flops_q;
wire spare9_flop_d;
wire spare3_flop_d;
wire spare0_flop_d;
wire [11:1] spare_flops_unused;
wire spare9_flop_q;
wire spare3_flop_q;
wire spare0_flop_q;


// global
input         l2clk;
input         scan_in;
output        scan_out;
input         tcu_int_aclk;
input         tcu_int_bclk;
input         tcu_int_se;
input         tcu_int_ce;
input         tcu_pce_ov;

// Interface with sigmux_ctl
input         tcu_rst_flush_init_ack;
input         start_bisx_por;
input         start_bisx_wmr;
input         stop_bisx_wmr;
output        tcu_bisx_done;
output        mbist_clk_stop_req;

// JTAG interface
output [47:0] mbist_done;
output [47:0] mbist_fail;
output [1:0]  mbist_done_fail;
output [7:0]  core_avail;
input         mbist_clkstpen;

output [7:0]  lb_tcu_done_d;

// core/SOC interface
input [47:0]  mb_tcu_done;
input [47:0]  mb_tcu_fail;
output [47:0] tcu_mb_start; 
output        tcu_mbist_bisi_en;
output        tcu_mbist_user_mode;

input [7:0]   lb_tcu_done;
output [7:0]  tcu_spc_lbist_start; 

// DMO Memory BIST Direct-Output Observe: For SPCs
output [5:0]  dmo_coresel;   // to SPC {4,5,1,6,7,3}
output        dmo_dcmuxctl;   // to all SPCs
output        dmo_icmuxctl;   // to all SPCs

input [35:0]  spc4_dmo_dout; // Mux'ed data from spc4
input [35:0]  spc6_dmo_dout; // Mux'ed data from spc6

// DMO MBIST Direct Observe: For L2 Tags
input [38:0]  l2t4_dmo_dout; // Mux'ed data from l2t4
input [38:0]  l2t6_dmo_dout; // Mux'ed data from l2t6

output [5:0]  dmo_l2tsel;    // to l2t {1,5,4 & 3,7,6}
output        dmo_tagmuxctl; // to all l2ts

// DMO MBIST Direct Observe: For NIU (RTX, RDP, TDS)
input [39:0]  rtx_tcu_dmo_data_out;
input [39:0]  tds_tcu_dmo_dout;
input [39:0]  rdp_tcu_dmo_dout;

output [2:0]  tcu_rtx_dmo_ctl; // Mux Control 

// DMO Output to MIO (Chip Pins)
output [39:0] tcu_mio_dmo_data; // final data to pins
output        tcu_mio_dmo_sync;
output        tcu_mio_mbist_done;
output        tcu_mio_mbist_fail;
output        tcu_mio_jtag_membist_mode;

// DMO JTAG Interface
input         jtag_dmo_enable; // enables DMO port
input         jtag_dmo_control_upd;
input [47:0]  jtag_dmo_control;
output [47:0] dmo_cfg;

// Synchronizer
input         cmp_io2x_sync_en;
input         io_cmp_sync_en;
input         cmp_io_sync_en;

// NCU interface
input         ncu_spc0_core_available;
input         ncu_spc1_core_available;
input         ncu_spc2_core_available;
input         ncu_spc3_core_available;
input         ncu_spc4_core_available;
input         ncu_spc5_core_available;
input         ncu_spc6_core_available;
input         ncu_spc7_core_available;
input         ncu_spc0_core_enable_status;
input         ncu_spc1_core_enable_status;
input         ncu_spc2_core_enable_status;
input         ncu_spc3_core_enable_status;
input         ncu_spc4_core_enable_status;
input         ncu_spc5_core_enable_status;
input         ncu_spc6_core_enable_status;
input         ncu_spc7_core_enable_status;
input         ncu_spc_pm;
input         ncu_spc_ba01;
input         ncu_spc_ba23;
input         ncu_spc_ba45;
input         ncu_spc_ba67;

input  [7:0]  ncu_tcu_bank_avail;
output [7:0]  bank_avail;

// UCB/CSR Related
input         tcu_test_protect;
output        tcu_test_protect_cmp;
input         jtag_csr_wr;
input [5:0]   jtag_csr_addr;
input [47:0]  jtag_csr_data;
input         ucb_csr_wr;
input [5:0]   ucb_csr_addr;
input [63:0]  ucb_data_out;
input         ac_test_mode;

output [63:0] csr_ucb_data;

input [6:0]   csdel_data;     // From sigmux_ctl
input [63:0]  cycle_count;    // From dbg_ctl
input [3:0]   tcu_dcr;        // From dbg_ctl
input [31:0]  de_count;       // From dbg_ctl
input [23:0]  debug_reg_hard_stop_domain_1st; // From regs_ctl

output        tcu_peu_entestcfg;

// For ECO C to use spare flops to flop these signals for timing
input         debug_cycle_counter_stop_to_mbc; // ECO C
input         mbist_clk_stop_to_mbc;           // ECO C
output        debug_cycle_counter_stop;        // ECO C
output        mbist_clk_stop;                  // ECO C
// For ECO D to use spare flops to flop these signals for timing
input         cycle_stretch_to_mbc;            // ECO D
output        cycle_stretch;                   // ECO D

reg           hold_start_din;
reg           set_bisi_en;
reg           clr_done_fail;
reg           clr_mbist_start_wmr_din;
reg           csr_mbist_start_din;
reg           tcu_bisx_done_din;
reg           bisx_counter_en_din;
reg [3:0]     next_state;

wire [47:1]   prev_skip_done;
wire [47:1]   prev_skip_done_din;

// Scan reassigns
assign l1en   = tcu_int_ce;
assign pce_ov = tcu_pce_ov;
assign stop   = 1'b0;
assign se     = tcu_int_se;
assign siclk  = tcu_int_aclk;
assign soclk  = tcu_int_bclk;

tcu_mbist_ctl_l1clkhdr_ctl_macro ucb_clkgen (
   .l2clk  (l2clk),
   .l1clk  (l1clk  ),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//================================================================================
// Synchronizers
// TCK -> CMP
//================================================================================
cl_sc1_clksyncff_4x jtag_csr_wr_sync_reg (
   .si    ( jtag_csr_wr_sync_reg_scanin  ),
   .so    ( jtag_csr_wr_sync_reg_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( jtag_csr_wr                  ),
   .q     ( jtag_csr_wr_sync             ),
  .siclk(siclk),
  .soclk(soclk));

//================================================================================
// Synchronizers
// SERDES -> CMP
//================================================================================
cl_sc1_clksyncff_4x mb_tcu_done_36_sync_reg (
   .si    ( mb_tcu_done_36_sync_reg_scanin  ),
   .so    ( mb_tcu_done_36_sync_reg_scanout ),
   .l1clk ( l1clk                           ),
   .d     ( mb_tcu_done[36]                 ),
   .q     ( mb_tcu_done_36_sync             ),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x mb_tcu_fail_36_sync_reg (
   .si    ( mb_tcu_fail_36_sync_reg_scanin  ),
   .so    ( mb_tcu_fail_36_sync_reg_scanout ),
   .l1clk ( l1clk                           ),
   .d     ( mb_tcu_fail[36]                 ),
   .q     ( mb_tcu_fail_36_sync             ),
  .siclk(siclk),
  .soclk(soclk));

//================================================================================
// Flop the Sync Enable Output from clkgen_tcu_cmp
//================================================================================
tcu_mbist_ctl_msff_ctl_macro__width_3 tcu_mbist_sync_en_reg  ( 
   .scan_in  ( tcu_mbist_sync_en_reg_scanin                                         ),
   .scan_out ( tcu_mbist_sync_en_reg_scanout                                        ),
   .l1clk    ( l1clk                                                                ),
   .din      ( {io_cmp_sync_en,       cmp_io_sync_en,       cmp_io2x_sync_en}       ), 
   .dout     ( {io_cmp_sync_en_local, cmp_io_sync_en_local, cmp_io2x_sync_en_local} ),
  .siclk(siclk),
  .soclk(soclk));

//================================================================================
// Synchronize tcu_test_protect
//================================================================================
tcu_mbist_ctl_msff_ctl_macro__en_1__width_1 tcu_test_protect_cmp_reg   (
   .scan_in  ( tcu_test_protect_cmp_reg_scanin  ),
   .scan_out ( tcu_test_protect_cmp_reg_scanout ),
   .l1clk    ( l1clk                            ),
   .en       ( io_cmp_sync_en_local             ),
   .din      ( tcu_test_protect                 ),
   .dout     ( tcu_test_protect_sync            ),
  .siclk(siclk),
  .soclk(soclk));

assign tcu_test_protect_cmp  = ac_test_mode     |  tcu_test_protect_sync;

//==================================================
// UCB CREG Access
//==================================================
//================================================================================
// Synchronize ucb_csr_wr
// FROM IO to CMP
//================================================================================
tcu_mbist_ctl_msff_ctl_macro__en_1__width_1 ucb_csr_wr_sync_reg   (
   .scan_in  ( ucb_csr_wr_sync_reg_scanin  ),
   .scan_out ( ucb_csr_wr_sync_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .en       ( io_cmp_sync_en_local        ),
   .din      ( ucb_csr_wr                  ),
   .dout     ( ucb_csr_wr_sync             ),
  .siclk(siclk),
  .soclk(soclk));

tcu_mbist_ctl_msff_ctl_macro__en_1__width_6 ucb_csr_addr_sync_reg   (
   .scan_in  ( ucb_csr_addr_sync_reg_scanin  ),
   .scan_out ( ucb_csr_addr_sync_reg_scanout ),
   .l1clk    ( l1clk                         ),
   .en       ( io_cmp_sync_en_local          ),
   .din      ( ucb_csr_addr[5:0]             ),
   .dout     ( ucb_csr_addr_sync[5:0]        ),
  .siclk(siclk),
  .soclk(soclk));

assign ucb_sel_mbist_mode        = (ucb_csr_addr_sync == 6'h0);
assign ucb_sel_mbist_bypass      = (ucb_csr_addr_sync == 6'h1);
assign ucb_sel_mbist_start       = (ucb_csr_addr_sync == 6'h2);
assign ucb_sel_mbist_abort       = (ucb_csr_addr_sync == 6'h3);
assign ucb_sel_mbist_result      = (ucb_csr_addr_sync == 6'h4);
assign ucb_sel_mbist_get_done    = (ucb_csr_addr_sync == 6'h5);
assign ucb_sel_mbist_get_fail    = (ucb_csr_addr_sync == 6'h6);
assign ucb_sel_mbist_start_wmr   = (ucb_csr_addr_sync == 6'h7);
assign ucb_sel_lbist_mode        = (ucb_csr_addr_sync == 6'h8);
assign ucb_sel_lbist_bypass      = (ucb_csr_addr_sync == 6'h9);
assign ucb_sel_lbist_start       = (ucb_csr_addr_sync == 6'hA);
assign ucb_sel_lbist_get_done    = (ucb_csr_addr_sync == 6'hC);
assign ucb_sel_cycle_count       = (ucb_csr_addr_sync == 6'h20);
assign ucb_sel_dcr               = (ucb_csr_addr_sync == 6'h21);
assign ucb_sel_dec               = (ucb_csr_addr_sync == 6'h23);
assign ucb_sel_clkstp_delay      = (ucb_csr_addr_sync == 6'h24);
assign ucb_sel_clk_domain        = (ucb_csr_addr_sync == 6'h25);
assign ucb_sel_peu_entestcfg     = (ucb_csr_addr_sync == 6'h30);


assign ucb_wr_mbist_mode      = ucb_csr_wr_sync && ucb_sel_mbist_mode;
assign ucb_wr_mbist_bypass    = ucb_csr_wr_sync && ucb_sel_mbist_bypass;
assign ucb_wr_mbist_start     = ucb_csr_wr_sync && ucb_sel_mbist_start && ucb_data_out[0];
assign ucb_wr_mbist_abort     = ucb_csr_wr_sync && ucb_sel_mbist_abort && ucb_data_out[0];
assign ucb_wr_mbist_start_wmr = ucb_csr_wr_sync && ucb_sel_mbist_start_wmr && ucb_data_out[0];
assign ucb_wr_lbist_mode      = ucb_csr_wr_sync && ucb_sel_lbist_mode;
assign ucb_wr_lbist_bypass    = ucb_csr_wr_sync && ucb_sel_lbist_bypass;
assign ucb_wr_lbist_start     = ucb_csr_wr_sync && ucb_sel_lbist_start;
assign ucb_wr_peu_entestcfg   = ucb_csr_wr_sync && ucb_sel_peu_entestcfg;

assign jtag_sel_mbist_mode        = (jtag_csr_addr == 6'h0);
assign jtag_sel_mbist_bypass      = (jtag_csr_addr == 6'h1);
assign jtag_sel_mbist_start       = (jtag_csr_addr == 6'h2);
assign jtag_sel_mbist_abort       = (jtag_csr_addr == 6'h3);
assign jtag_sel_mbist_start_wmr   = (jtag_csr_addr == 6'h7);
assign jtag_sel_lbist_mode        = (jtag_csr_addr == 6'h8);
assign jtag_sel_lbist_bypass      = (jtag_csr_addr == 6'h9);
assign jtag_sel_lbist_start       = (jtag_csr_addr == 6'hA);
assign jtag_sel_lbist_abort       = (jtag_csr_addr == 6'hB);

assign jtag_wr_mbist_mode      = jtag_csr_wr_sync && jtag_sel_mbist_mode;
assign jtag_wr_mbist_bypass    = jtag_csr_wr_sync && jtag_sel_mbist_bypass;
assign jtag_wr_mbist_start     = jtag_csr_wr_sync && jtag_sel_mbist_start;
assign jtag_wr_mbist_abort     = jtag_csr_wr_sync && jtag_sel_mbist_abort;
assign jtag_wr_mbist_start_wmr = jtag_csr_wr_sync && jtag_sel_mbist_start_wmr;
assign jtag_wr_lbist_mode      = jtag_csr_wr_sync && jtag_sel_lbist_mode;
assign jtag_wr_lbist_bypass    = jtag_csr_wr_sync && jtag_sel_lbist_bypass;
assign jtag_wr_lbist_start     = jtag_csr_wr_sync && jtag_sel_lbist_start;
assign jtag_wr_lbist_abort     = jtag_csr_wr_sync && jtag_sel_lbist_abort;


//==================================================
// MBIST MODE CREG
//==================================================
assign {csr_mbist_mode_din[3:2], csr_mbist_mode_din[0]} =
          jtag_wr_mbist_mode  ? {jtag_csr_data[3:2], jtag_csr_data[0]}  :
          ucb_wr_mbist_mode   ? {ucb_data_out[3:2], ucb_data_out[0]}    :
                                {csr_mbist_mode[3:2], csr_mbist_mode[0]};

assign csr_mbist_mode_din[1] = jtag_wr_mbist_mode  ? jtag_csr_data[1] :
                               ucb_wr_mbist_mode   ? ucb_data_out[1]  :
                               set_bisi_en         ? 1'b1             :
                                                     tcu_mbist_bisi_en;

tcu_mbist_ctl_msff_ctl_macro__width_4 csr_mbist_mode_reg  (
   .scan_in  ( csr_mbist_mode_reg_scanin  ),
   .scan_out ( csr_mbist_mode_reg_scanout ),
   .l1clk    ( l1clk                      ),
   .din      ( csr_mbist_mode_din[3:0]    ), 
   .dout     ( csr_mbist_mode[3:0]        ),
  .siclk(siclk),
  .soclk(soclk));

assign tcu_mbist_loop_mode = csr_mbist_mode[3];
assign tcu_mbist_bisi_en   = csr_mbist_mode[1];
assign parallel            = csr_mbist_mode[0] || hold_start;

//==================================================
// MBIST BYPASS CREG
//==================================================
assign csr_mbist_bypass_din[47:0] = jtag_wr_mbist_bypass ? jtag_csr_data[47:0] :
                                    ucb_wr_mbist_bypass  ? ucb_data_out[47:0] :
                                                           csr_mbist_bypass[47:0];
tcu_mbist_ctl_msff_ctl_macro__width_48 csr_mbist_bypass_reg  (
   .scan_in  ( csr_mbist_bypass_reg_scanin  ),
   .scan_out ( csr_mbist_bypass_reg_scanout ),
   .l1clk    ( l1clk                        ),
   .din      ( csr_mbist_bypass_din[47:0]   ), 
   .dout     ( csr_mbist_bypass[47:0]       ),
  .siclk(siclk),
  .soclk(soclk));


//==================================================
// MBIST START CREG
//==================================================
tcu_mbist_ctl_msff_ctl_macro__width_1 csr_mbist_start_reg  (
   .scan_in  ( csr_mbist_start_reg_scanin  ),
   .scan_out ( csr_mbist_start_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .din      ( csr_mbist_start_din         ), 
   .dout     ( csr_mbist_start             ),
  .siclk(siclk),
  .soclk(soclk));


//==================================================
// MBIST ABORT CREG
//==================================================
assign csr_mbist_abort_din = jtag_wr_mbist_abort ? 1'b1 :
                             ucb_wr_mbist_abort  ? ucb_data_out[0] : 1'b0;
tcu_mbist_ctl_msff_ctl_macro__width_1 csr_mbist_abort_reg  (
   .scan_in  ( csr_mbist_abort_reg_scanin  ),
   .scan_out ( csr_mbist_abort_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .din      ( csr_mbist_abort_din         ), 
   .dout     ( csr_mbist_abort             ),
  .siclk(siclk),
  .soclk(soclk));

tcu_mbist_ctl_msff_ctl_macro__width_1 csr_mbist_abort_d_reg  (
   .scan_in  ( csr_mbist_abort_d_reg_scanin  ),
   .scan_out ( csr_mbist_abort_d_reg_scanout ),
   .l1clk    ( l1clk                         ),
   .din      ( csr_mbist_abort               ), 
   .dout     ( csr_mbist_abort_d             ),
  .siclk(siclk),
  .soclk(soclk));

assign csr_mbist_abort_up = csr_mbist_abort && !csr_mbist_abort_d;

//==================================================
// MBIST START WMR CREG
//==================================================
assign csr_mbist_start_wmr_din = jtag_wr_mbist_start_wmr ? jtag_csr_data[0] :
                                 ucb_wr_mbist_start_wmr  ? ucb_data_out[0] :
                                 clr_mbist_start_wmr     ? 1'b0 :
                                                           csr_mbist_start_wmr;
tcu_mbist_ctl_msff_ctl_macro__width_1 csr_mbist_start_wmr_reg  (
   .scan_in  ( csr_mbist_start_wmr_reg_scanin  ),
   .scan_out ( csr_mbist_start_wmr_reg_scanout ),
   .l1clk    ( l1clk                           ),
   .din      ( csr_mbist_start_wmr_din         ), 
   .dout     ( csr_mbist_start_wmr             ),
  .siclk(siclk),
  .soclk(soclk));


//==================================================
// MBIST DONE CREG
//==================================================
assign mbist_done_din[47:0] =
             clr_done_fail       ? 48'h0 :
             mbist_start_io_sync ? ((~mbist_skip & mb_tcu_done_d) | mbist_done):
                                   mbist_done;

tcu_mbist_ctl_msff_ctl_macro__width_48 mbist_done_reg  (
   .scan_in  ( mbist_done_reg_scanin  ),
   .scan_out ( mbist_done_reg_scanout ),
   .l1clk    ( l1clk                  ),
   .din      ( mbist_done_din[47:0]   ),
   .dout     ( mbist_done[47:0]       ),
  .siclk(siclk),
  .soclk(soclk));


//================================================================================
// MBIST FAIL
// Reset to 0 before starting a new MBIST operation
// When DONE comes back capture FAIL signals
//================================================================================
assign mbist_fail_din =
             clr_done_fail       ? 48'h0 :
             mbist_start_io_sync ? ((~mbist_skip & mb_tcu_fail_d) | mbist_fail) :
                                   mbist_fail;

tcu_mbist_ctl_msff_ctl_macro__width_48 mbist_fail_reg  (
   .scan_in  ( mbist_fail_reg_scanin  ),
   .scan_out ( mbist_fail_reg_scanout ),
   .l1clk    ( l1clk                  ),
   .din      ( mbist_fail_din[47:0]   ),
   .dout     ( mbist_fail[47:0]       ),
  .siclk(siclk),
  .soclk(soclk));


//==================================================
// MBIST RESULT CREG
//==================================================
assign mbist_done_fail_din[1:0] = clr_done_fail ? 2'b0 :
                                     {(&mbist_skip_or_done && !(&mbist_skip)), |mbist_fail};
tcu_mbist_ctl_msff_ctl_macro__width_2 mbist_done_fail_reg  (
   .scan_in  ( mbist_done_fail_reg_scanin  ),
   .scan_out ( mbist_done_fail_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .din      ( mbist_done_fail_din[1:0]    ),
   .dout     ( mbist_done_fail[1:0]        ),
  .siclk(siclk),
  .soclk(soclk));

assign mbist_all_done = mbist_done_fail[1];

assign mbist_all_done_real_time = mbist_done_fail_din[1];
assign mbist_one_fail_real_time = mbist_done_fail_din[0];


//==================================================
// LBIST MODE CREG
//==================================================
assign csr_lbist_mode_din[1:0] = jtag_wr_lbist_abort ? 2'b0 :
                                 jtag_wr_lbist_mode  ? jtag_csr_data[1:0] :
                                 ucb_wr_lbist_mode   ? ucb_data_out[1:0] :
                                                       csr_lbist_mode[1:0];
tcu_mbist_ctl_msff_ctl_macro__width_2 csr_lbist_mode_reg  (
   .scan_in  ( csr_lbist_mode_reg_scanin  ),
   .scan_out ( csr_lbist_mode_reg_scanout ),
   .l1clk    ( l1clk                      ),
   .din      ( csr_lbist_mode_din[1:0]    ), 
   .dout     ( csr_lbist_mode[1:0]        ),
  .siclk(siclk),
  .soclk(soclk));


//==================================================
// LBIST BYPASS CREG
//==================================================
assign csr_lbist_bypass_din[7:0] = jtag_wr_lbist_abort  ? 8'h0 :
                                   jtag_wr_lbist_bypass ? jtag_csr_data[7:0] :
                                   ucb_wr_lbist_bypass  ? ucb_data_out[7:0] :
                                                          csr_lbist_bypass[7:0];
tcu_mbist_ctl_msff_ctl_macro__width_8 csr_lbist_bypass_reg  (
   .scan_in  ( csr_lbist_bypass_reg_scanin  ),
   .scan_out ( csr_lbist_bypass_reg_scanout ),
   .l1clk    ( l1clk                        ),
   .din      ( csr_lbist_bypass_din[7:0]    ), 
   .dout     ( csr_lbist_bypass[7:0]        ),
  .siclk(siclk),
  .soclk(soclk));


//==================================================
// LBIST START CREG
//==================================================
assign csr_lbist_start_din = jtag_wr_lbist_abort ? 1'b0 :
                             jtag_wr_lbist_start ? 1'b1 :
                             ucb_wr_lbist_start  ? ucb_data_out[0] :
                             lbist_all_done      ? 1'b0 :
                                                   csr_lbist_start;
tcu_mbist_ctl_msff_ctl_macro__width_1 csr_lbist_start_reg  (
   .scan_in  ( csr_lbist_start_reg_scanin  ),
   .scan_out ( csr_lbist_start_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .din      ( csr_lbist_start_din         ), 
   .dout     ( csr_lbist_start             ),
  .siclk(siclk),
  .soclk(soclk));

tcu_mbist_ctl_msff_ctl_macro__width_1 csr_lbist_start_d_reg  (
   .scan_in  ( csr_lbist_start_d_reg_scanin  ),
   .scan_out ( csr_lbist_start_d_reg_scanout ),
   .l1clk    ( l1clk                         ),
   .din      ( csr_lbist_start               ), 
   .dout     ( csr_lbist_start_d             ),
  .siclk(siclk),
  .soclk(soclk));

assign csr_lbist_start_up = csr_lbist_start && !csr_lbist_start_d;

//==================================================
// LBIST DONE
//==================================================
assign csr_lbist_done_din[7:0] = csr_lbist_start_up ?
                                    8'h0 :
                                    (csr_lbist_done | lb_tcu_done_d);

tcu_mbist_ctl_msff_ctl_macro__width_8 csr_lbist_done_reg  (
   .scan_in  ( csr_lbist_done_reg_scanin  ),
   .scan_out ( csr_lbist_done_reg_scanout ),
   .l1clk    ( l1clk                      ),
   .din      ( csr_lbist_done_din[7:0]    ), 
   .dout     ( csr_lbist_done[7:0]        ),
  .siclk(siclk),
  .soclk(soclk));


//==================================================
// PEU Test Config Enable
// CSR Only. No JTAG Access
//==================================================
assign csr_peu_entestcfg_din = ucb_wr_peu_entestcfg ?
                                  ucb_data_out[0] :
                                  csr_peu_entestcfg;

tcu_mbist_ctl_msff_ctl_macro__width_1 csr_peu_entestcfg_reg  (
   .scan_in  ( csr_peu_entestcfg_reg_scanin  ),
   .scan_out ( csr_peu_entestcfg_reg_scanout ),
   .l1clk    ( l1clk                         ),
   .din      ( csr_peu_entestcfg_din         ), 
   .dout     ( csr_peu_entestcfg             ),
  .siclk(siclk),
  .soclk(soclk));

assign tcu_peu_entestcfg = csr_peu_entestcfg;

//==================================================
// Send CSR Read Back to UCB
//==================================================
assign csr_ucb_data_din =
          ucb_sel_mbist_mode      ? {60'h0, csr_mbist_mode[3:0]}            :
          ucb_sel_mbist_bypass    ? {16'h0, csr_mbist_bypass[47:0]}         :
          ucb_sel_mbist_start     ? {63'h0, csr_mbist_start}                :
          ucb_sel_mbist_abort     ? {63'h0, csr_mbist_abort}                :
          ucb_sel_mbist_result    ? {62'h0, mbist_done_fail[1:0]}           :
          ucb_sel_mbist_get_done  ? {16'h0, mbist_done}                     :
          ucb_sel_mbist_get_fail  ? {16'h0, mbist_fail}                     :
          ucb_sel_mbist_start_wmr ? {63'h0, csr_mbist_start_wmr}            :
          ucb_sel_lbist_mode      ? {62'h0, csr_lbist_mode[1:0]}            :
          ucb_sel_lbist_bypass    ? {56'h0, csr_lbist_bypass[7:0]}          :
          ucb_sel_lbist_start     ? {63'h0, csr_lbist_start}                :
          ucb_sel_lbist_get_done  ? {56'h0, csr_lbist_done[7:0]}            :
          ucb_sel_cycle_count     ? cycle_count                             :
          ucb_sel_dcr             ? {60'h0, tcu_dcr}                        :
          ucb_sel_dec             ? {32'h0, de_count}                       :
          ucb_sel_clkstp_delay    ? {57'h0, csdel_data}                     :
          ucb_sel_peu_entestcfg   ? {63'h0, csr_peu_entestcfg}              :
          ucb_sel_clk_domain      ? {40'h0, debug_reg_hard_stop_domain_1st} :
                                    csr_ucb_data;

tcu_mbist_ctl_msff_ctl_macro__en_1__width_64 csr_ucb_data_reg   (
   .scan_in  ( csr_ucb_data_reg_scanin  ),
   .scan_out ( csr_ucb_data_reg_scanout ),
   .l1clk    ( l1clk                    ),
   .en       ( cmp_io_sync_en_local     ),
   .din      ( csr_ucb_data_din[63:0]   ), 
   .dout     ( csr_ucb_data[63:0]       ),
  .siclk(siclk),
  .soclk(soclk));


tcu_mbist_ctl_msff_ctl_macro__width_1 start_bisx_por_d_reg  (
   .scan_in  ( start_bisx_por_d_reg_scanin  ),
   .scan_out ( start_bisx_por_d_reg_scanout ),
   .l1clk    ( l1clk                        ),
   .din      ( start_bisx_por               ), 
   .dout     ( start_bisx_por_d             ),
  .siclk(siclk),
  .soclk(soclk));

assign start_bisx_por_up = start_bisx_por && !start_bisx_por_d;


//==================================================
// MBIST Control State Machine
//==================================================
always @(state or clr_mbist_start_wmr or csr_mbist_start or hold_start or
         tcu_bisx_done or bisx_counter_en or start_bisx_por_up or
         start_bisx_wmr or csr_mbist_start_wmr or jtag_wr_mbist_start or
         ucb_wr_mbist_start or csr_mbist_abort_up or tcu_rst_flush_init_ack or
         mbist_all_done or tcu_mbist_loop_mode or
         bisx_time_out or csr_mbist_mode[1])
begin
   set_bisi_en                     = 1'b0;
   clr_done_fail                   = 1'b0;
   clr_mbist_start_wmr_din         = clr_mbist_start_wmr;
   csr_mbist_start_din             = csr_mbist_start;
   hold_start_din                  = hold_start;
   tcu_bisx_done_din               = tcu_bisx_done;
   bisx_counter_en_din             = bisx_counter_en;
   next_state                      = `MBIST_IDLE;
   case (state)
      `MBIST_IDLE: begin       // 0
         clr_mbist_start_wmr_din   = 1'b0;
         if (start_bisx_por_up)
            next_state = `POR_CLR_DF;
         else if (start_bisx_wmr)
            if (csr_mbist_start_wmr)
               next_state = `WMR_CLR_DF;
            else
               next_state = `WMR_DUMMY;
         else if (jtag_wr_mbist_start || ucb_wr_mbist_start)
            next_state = `BISX_CLR_DF;
         else
            next_state = `MBIST_IDLE;
      end

      `POR_CLR_DF: begin       // 1
         clr_done_fail             = 1'b1;
         bisx_counter_en_din       = 1'b0;
         hold_start_din            = 1'b1;
         if (csr_mbist_abort_up) begin
            next_state             = `MBIST_IDLE;
         end
         else begin
            next_state             = `POR_START;
            set_bisi_en            = 1'b1;
         end
      end

      `POR_START: begin        // 2
         bisx_counter_en_din       = 1'b1;
         csr_mbist_start_din    = 1'b1;
         if (csr_mbist_abort_up)
            next_state             = `POR_CLR_START;
         else if (mbist_all_done || bisx_time_out)
            next_state             = `POR_CLR_START;
         else
            next_state             = `POR_START;
      end

      `POR_CLR_START: begin    // 3
         next_state                = `POR_END_WAIT;
         bisx_counter_en_din       = 1'b0;
         tcu_bisx_done_din         = 1'b1;
      end

      `POR_END_WAIT: begin     // 4
         if (csr_mbist_abort_up || tcu_rst_flush_init_ack) begin
            next_state             = `MBIST_IDLE;
            tcu_bisx_done_din      = 1'b0;
            hold_start_din         = 1'b0;
            csr_mbist_start_din    = 1'b0;
         end
         else
            next_state             = `POR_END_WAIT;
      end

      `WMR_DUMMY: begin        // 6 - For asserting tcu_bisx_done when no WMR BISX is programmed
         if (csr_mbist_abort_up || tcu_rst_flush_init_ack) begin
            tcu_bisx_done_din      = 1'b0;
            next_state             = `MBIST_IDLE;
         end
         else begin
            tcu_bisx_done_din      = 1'b1;
            next_state             = `WMR_DUMMY;
         end
      end

      `WMR_CLR_DF: begin       // 7
         clr_done_fail             = 1'b1;
         bisx_counter_en_din       = 1'b0;
         hold_start_din            = 1'b1;
         if (csr_mbist_abort_up) begin
            next_state             = `MBIST_IDLE;
         end
         else begin
            next_state             = `WMR_START;
         end
      end

      `WMR_START: begin        // 8
         bisx_counter_en_din       = 1'b1;
         if (csr_mbist_abort_up) begin
            next_state             = `MBIST_IDLE;
            csr_mbist_start_din    = 1'b0;
         end
         else if (mbist_all_done || bisx_time_out) begin
            next_state             = `WMR_CLR_START;
            csr_mbist_start_din    = 1'b1;
         end
         else begin
            next_state             = `WMR_START;
            csr_mbist_start_din    = 1'b1;
         end
      end

      `WMR_CLR_START: begin    // 9
         next_state                = `WMR_END_WAIT;
         clr_mbist_start_wmr_din   = 1'b1;
         bisx_counter_en_din       = 1'b0;
         tcu_bisx_done_din         = 1'b1;
      end

      `WMR_END_WAIT: begin     // 10
         if (csr_mbist_abort_up || tcu_rst_flush_init_ack) begin
            next_state             = `MBIST_IDLE;
            tcu_bisx_done_din      = 1'b0;
            hold_start_din         = 1'b0;
            csr_mbist_start_din    = 1'b0;
         end
         else
            next_state             = `WMR_END_WAIT;
      end

      `BISX_CLR_DF: begin      // 11
         clr_done_fail             = 1'b1;
         bisx_counter_en_din       = 1'b0;
         if (csr_mbist_abort_up) begin
            next_state             = `MBIST_IDLE;
         end
         else begin
            next_state             = `BISX_START;
         end
      end

      `BISX_START: begin       // 12
         if (csr_mbist_mode[1]) begin
            bisx_counter_en_din    = 1'b1;
         end
         else begin
            bisx_counter_en_din    = 1'b0;
         end
         if (csr_mbist_abort_up) begin
            next_state             = `MBIST_IDLE;
            csr_mbist_start_din    = 1'b0;
         end
         else if (mbist_all_done && !tcu_mbist_loop_mode) begin
            next_state             = `BISX_CLR_START;
            csr_mbist_start_din    = 1'b1;
         end
         else begin
            next_state = `BISX_START;
            csr_mbist_start_din    = 1'b1;
         end
      end

      `BISX_CLR_START: begin   // 13
         next_state                = `MBIST_IDLE;
         csr_mbist_start_din       = 1'b0;
         bisx_counter_en_din       = 1'b0;
      end

		default: begin
         set_bisi_en                     = 1'b0;
         clr_done_fail                   = 1'b0;
         clr_mbist_start_wmr_din         = clr_mbist_start_wmr;
         csr_mbist_start_din             = csr_mbist_start;
         hold_start_din                  = hold_start;
         tcu_bisx_done_din               = tcu_bisx_done;
         bisx_counter_en_din             = bisx_counter_en;
         next_state                      = `MBIST_IDLE;
		end
   endcase
end

tcu_mbist_ctl_msff_ctl_macro__width_4 tcu_mbist_state_reg  (
   .scan_in  ( tcu_mbist_state_reg_scanin  ),
   .scan_out ( tcu_mbist_state_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .din      ( next_state[3:0]             ),
   .dout     ( state[3:0]                  ),
  .siclk(siclk),
  .soclk(soclk));


tcu_mbist_ctl_msff_ctl_macro__en_1__width_1 mbist_start_io_sync_reg   (
   .scan_in  ( mbist_start_io_sync_reg_scanin  ),
   .scan_out ( mbist_start_io_sync_reg_scanout ),
   .l1clk    ( l1clk                           ),
   .en       ( cmp_io_sync_en_local            ),
   .din      ( csr_mbist_start                 ), 
   .dout     ( mbist_start_io_sync             ),
  .siclk(siclk),
  .soclk(soclk));

tcu_mbist_ctl_msff_ctl_macro__width_1 hold_start_reg  (
   .scan_in  ( hold_start_reg_scanin  ),
   .scan_out ( hold_start_reg_scanout ),
   .l1clk    ( l1clk                  ),
   .din      ( hold_start_din         ), 
   .dout     ( hold_start             ),
  .siclk(siclk),
  .soclk(soclk));

tcu_mbist_ctl_msff_ctl_macro__width_1 clr_mbist_start_wmr_reg  (
   .scan_in  ( clr_mbist_start_wmr_reg_scanin  ),
   .scan_out ( clr_mbist_start_wmr_reg_scanout ),
   .l1clk    ( l1clk                           ),
   .din      ( clr_mbist_start_wmr_din         ), 
   .dout     ( clr_mbist_start_wmr             ),
  .siclk(siclk),
  .soclk(soclk));


tcu_mbist_ctl_msff_ctl_macro__en_1__width_1 tcu_mbist_user_mode_reg   (
   .scan_in  ( tcu_mbist_user_mode_reg_scanin  ),
   .scan_out ( tcu_mbist_user_mode_reg_scanout ),
   .l1clk    ( l1clk                           ),
   .en       ( cmp_io_sync_en_local            ),
   .din      ( csr_mbist_mode[2]               ), 
   .dout     ( tcu_mbist_user_mode             ),
  .siclk(siclk),
  .soclk(soclk));

//================================================================================
// Latch mb_tcu_done to filter DONE signals that are less than 2-cycle wide
// During loop mode, MBIST engines generate DONE pulse (1-cycle) per compare
// TCU should not turn off START signals when it sees such DONE pulses
// Since TCU doesn't know if the engines are running in loop or non-loop mode
// We need to exame the width of the DONE signals to determine if we should turn
// off START signals when DONE signals are back
// For engines running in CMP latch their DONE signals once so that we can filter
// out those DONE pulses during loop mode
// For engines running in IO clock or PEU we need at least 6 CMP to be safe
//================================================================================

//================================================================================
// First latch the DONE signal because they are coming from other clusters
// For L2T1, L2T3-7, L2B4-7, SPC1, SPC3-7, MCU2, and MCU3
// We need to latch twice because there are corresponding staging flops in some
// other blocks for every other MBIST signals
//================================================================================
assign mb_tcu_done_stg_din[17:0] = {mb_tcu_done[33:29],     // L2T7-3
                                    mb_tcu_done[27],        // L2T1
                                    mb_tcu_done[25:22],     // L2B7-4
                                    mb_tcu_done[17:16],     // MCU3-2
                                    mb_tcu_done[7:3],       // SPC7-3
                                    mb_tcu_done[1]};        // SPC1

tcu_mbist_ctl_msff_ctl_macro__width_18 mb_tcu_done_stg_reg  (
   .scan_in  ( mb_tcu_done_stg_reg_scanin  ),
   .scan_out ( mb_tcu_done_stg_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .din      ( mb_tcu_done_stg_din[17:0]   ),
   .dout     ( mb_tcu_done_stg[17:0]       ),
  .siclk(siclk),
  .soclk(soclk));

assign mb_tcu_done_d_cmp_din[31:0] = {mb_tcu_done_stg[17:13],  // L2T7-3
                                      mb_tcu_done[28],         // L2T2
                                      mb_tcu_done_stg[12],     // L2T1
                                      mb_tcu_done[26],         // L2T0
                                      mb_tcu_done_stg[11:8],   // L2B7-4
                                      mb_tcu_done[21:18],      // L2B3-0
                                      mb_tcu_done_stg[7:6],    // MCU3-2
                                      mb_tcu_done[15:14],      // MCU1-0
                                      mb_tcu_done[12],         // NCU0
                                      mb_tcu_done[10],         // SIO0
                                      mb_tcu_done[9:8],        // SII
                                      mb_tcu_done_stg[5:1],    // SPC7-3
                                      mb_tcu_done[2],          // SPC2
                                      mb_tcu_done_stg[0],      // SPC1
                                      mb_tcu_done[0]};         // SPC0

tcu_mbist_ctl_msff_ctl_macro__width_32 mb_tcu_done_d_cmp_reg  (
   .scan_in  ( mb_tcu_done_d_cmp_reg_scanin  ),
   .scan_out ( mb_tcu_done_d_cmp_reg_scanout ),
   .l1clk    ( l1clk                         ),
   .din      ( mb_tcu_done_d_cmp_din[31:0]   ),
   .dout     ( mb_tcu_done_d_cmp[31:0]       ),
  .siclk(siclk),
  .soclk(soclk));

assign mb_tcu_done_d_io_din[15:0] = {mb_tcu_done[47:37],  // 15:5 (NIU)
                                     mb_tcu_done_36_sync, // 4    (PEU)
                                     mb_tcu_done[35:34],  // 3:2  (DMU)
                                     mb_tcu_done[13],     // 1    (NCU 1)
                                     mb_tcu_done[11]};    // 0    (SIO 1)

tcu_mbist_ctl_msff_ctl_macro__en_1__width_16 mb_tcu_done_d_io_reg   (
   .scan_in  ( mb_tcu_done_d_io_reg_scanin  ),
   .scan_out ( mb_tcu_done_d_io_reg_scanout ),
   .l1clk    ( l1clk                        ),
   .en       ( io_cmp_sync_en_local         ),
   .din      ( mb_tcu_done_d_io_din[15:0]   ),
   .dout     ( mb_tcu_done_d_io[15:0]       ),
  .siclk(siclk),
  .soclk(soclk));

assign mb_tcu_done_d[47:0] = {mb_tcu_done_d_io[15:2],     // (NIU, PEU, DMU)
                              mb_tcu_done_d_cmp[31:12],   // (L2T, L2B, MCU3-0)
                              mb_tcu_done_d_io[1],        // (NCU 1)
                              mb_tcu_done_d_cmp[11],      // (NCU 0)
                              mb_tcu_done_d_io[0],        // (SIO 1)
                              mb_tcu_done_d_cmp[10:0]};   // (SIO 0, SII, SPC)


//================================================================================
// Staging Flops for FAIL signals
//================================================================================
assign mb_tcu_fail_stg_din[17:0] = {mb_tcu_fail[33:29],     // [17:13] L2T7-3
                                    mb_tcu_fail[27],        // [12]    L2T1
                                    mb_tcu_fail[25:22],     // [11:8]  L2B7-4
                                    mb_tcu_fail[17:16],     // [7:6]   MCU3-2
                                    mb_tcu_fail[7:3],       // [5:1]   SPC7-3
                                    mb_tcu_fail[1]};        // [0]     SPC1

tcu_mbist_ctl_msff_ctl_macro__width_18 mb_tcu_fail_stg_reg  (
   .scan_in  ( mb_tcu_fail_stg_reg_scanin  ),
   .scan_out ( mb_tcu_fail_stg_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .din      ( mb_tcu_fail_stg_din[17:0]   ),
   .dout     ( mb_tcu_fail_stg[17:0]       ),
  .siclk(siclk),
  .soclk(soclk));

assign mb_tcu_fail_d_cmp_din[31:0] = {mb_tcu_fail_stg[17:13],  // L2T7-3
                                      mb_tcu_fail[28],         // L2T2
                                      mb_tcu_fail_stg[12],     // L2T1
                                      mb_tcu_fail[26],         // L2T0
                                      mb_tcu_fail_stg[11:8],   // L2B7-4
                                      mb_tcu_fail[21:18],      // L2B3-0
                                      mb_tcu_fail_stg[7:6],    // MCU3-2
                                      mb_tcu_fail[15:14],      // MCU1-0
                                      mb_tcu_fail[12],         // NCU0
                                      mb_tcu_fail[10],         // SIO0
                                      mb_tcu_fail[9:8],        // SII
                                      mb_tcu_fail_stg[5:1],    // SPC7-3
                                      mb_tcu_fail[2],          // SPC2
                                      mb_tcu_fail_stg[0],      // SPC1
                                      mb_tcu_fail[0]};         // SPC0

tcu_mbist_ctl_msff_ctl_macro__width_32 mb_tcu_fail_d_cmp_reg  (
   .scan_in  ( mb_tcu_fail_d_cmp_reg_scanin  ),
   .scan_out ( mb_tcu_fail_d_cmp_reg_scanout ),
   .l1clk    ( l1clk                         ),
   .din      ( mb_tcu_fail_d_cmp_din[31:0]   ),
   .dout     ( mb_tcu_fail_d_cmp[31:0]       ),
  .siclk(siclk),
  .soclk(soclk));

assign mb_tcu_fail_d_io_din[15:0] = {mb_tcu_fail[47:37],  // 15:5 (NIU)
                                     mb_tcu_fail_36_sync, // 4    (PEU)
                                     mb_tcu_fail[35:34],  // 3:2  (DMU)
                                     mb_tcu_fail[13],     // 1    (NCU 1)
                                     mb_tcu_fail[11]};    // 0    (SIO 1)

tcu_mbist_ctl_msff_ctl_macro__en_1__width_16 mb_tcu_fail_d_io_reg   (
   .scan_in  ( mb_tcu_fail_d_io_reg_scanin  ),
   .scan_out ( mb_tcu_fail_d_io_reg_scanout ),
   .l1clk    ( l1clk                        ),
   .en       ( io_cmp_sync_en_local         ),
   .din      ( mb_tcu_fail_d_io_din[15:0]   ),
   .dout     ( mb_tcu_fail_d_io[15:0]       ),
  .siclk(siclk),
  .soclk(soclk));

assign mb_tcu_fail_d[47:0] = {mb_tcu_fail_d_io[15:2],     // (NIU, PEU, DMU)
                              mb_tcu_fail_d_cmp[31:12],   // (L2T, L2B, MCU3-0)
                              mb_tcu_fail_d_io[1],        // (NCU 1)
                              mb_tcu_fail_d_cmp[11],      // (NCU 0)
                              mb_tcu_fail_d_io[0],        // (SIO 1)
                              mb_tcu_fail_d_cmp[10:0]};   // (SIO 0, SII, SPC)

assign tcu_core_avail[0] = ncu_spc0_core_available;
assign tcu_core_avail[1] = ncu_spc1_core_available;
assign tcu_core_avail[2] = ncu_spc2_core_available;
assign tcu_core_avail[3] = ncu_spc3_core_available;
assign tcu_core_avail[4] = ncu_spc4_core_available;
assign tcu_core_avail[5] = ncu_spc5_core_available;
assign tcu_core_avail[6] = ncu_spc6_core_available;
assign tcu_core_avail[7] = ncu_spc7_core_available;

assign core_avail_din[7:0] = tcu_test_protect_cmp ?
                                core_avail[7:0] :
                                tcu_core_avail[7:0];

tcu_mbist_ctl_msff_ctl_macro__en_1__width_8 core_avail_reg  (
   .scan_in  ( core_avail_reg_scanin  ),
   .scan_out ( core_avail_reg_scanout ),
   .l1clk    ( l1clk                  ),
   .en       ( io_cmp_sync_en_local   ),
   .din      ( core_avail_din[7:0]    ),
   .dout     ( core_avail[7:0]        ),
  .siclk(siclk),
  .soclk(soclk));

// Incoming bank_available signals from NCU
// One Bank = one each of L2D, L2T and L2B

assign bank_avail_din[7:0] = tcu_test_protect_cmp ?
                                bank_avail[7:0] :
                                ncu_tcu_bank_avail[7:0];

tcu_mbist_ctl_msff_ctl_macro__en_1__width_8 bank_avail_reg  (
   .scan_in  ( bank_avail_reg_scanin   ),
   .scan_out ( bank_avail_reg_scanout  ),
   .l1clk    ( l1clk                   ),
   .en       ( io_cmp_sync_en_local    ),
   .din      ( bank_avail_din[7:0]     ),
   .dout     ( bank_avail[7:0]         ),
  .siclk(siclk),
  .soclk(soclk));

assign ncu_core_enable_status[7:0] =
          {ncu_spc7_core_enable_status, ncu_spc6_core_enable_status,
           ncu_spc5_core_enable_status, ncu_spc4_core_enable_status,
           ncu_spc3_core_enable_status, ncu_spc2_core_enable_status,
           ncu_spc1_core_enable_status, ncu_spc0_core_enable_status};

assign core_enable_status_din[7:0] = tcu_test_protect_cmp ?
                                        core_enable_status[7:0] :
                                        ncu_core_enable_status[7:0];

tcu_mbist_ctl_msff_ctl_macro__en_1__width_8 core_enable_status_reg  (
   .scan_in  ( core_enable_status_reg_scanin  ),
   .scan_out ( core_enable_status_reg_scanout ),
   .l1clk    ( l1clk                          ),
   .en       ( io_cmp_sync_en_local           ),
   .din      ( core_enable_status_din[7:0]    ),
   .dout     ( core_enable_status[7:0]        ),
  .siclk(siclk),
  .soclk(soclk));


assign ncu_bank_enable_status[4:0] = {ncu_spc_pm,
                                      ncu_spc_ba67, ncu_spc_ba45,
                                      ncu_spc_ba23, ncu_spc_ba01};

assign bank_enable_status_din[4:0] = tcu_test_protect_cmp ?
                                        bank_enable_status[4:0] :
                                        ncu_bank_enable_status[4:0];

tcu_mbist_ctl_msff_ctl_macro__en_1__width_5 bank_enable_status_reg  (
   .scan_in  ( bank_enable_status_reg_scanin  ),
   .scan_out ( bank_enable_status_reg_scanout ),
   .l1clk    ( l1clk                          ),
   .en       ( io_cmp_sync_en_local           ),
   .din      ( bank_enable_status_din[4:0]    ),
   .dout     ( bank_enable_status[4:0]        ),
  .siclk(siclk),
  .soclk(soclk));

assign bank_enable_status_8[7:0] =
          {8{!bank_enable_status[4]}} | {{2{bank_enable_status[3]}},
                                         {2{bank_enable_status[2]}},
                                         {2{bank_enable_status[1]}},
                                         {2{bank_enable_status[0]}}};
assign bank_avail_4[3:0] = {|bank_avail[7:6], |bank_avail[5:4],
                            |bank_avail[3:2], |bank_avail[1:0]};

assign not_core_avail_48[47:0]  = {40'h0, ~core_avail[7:0]};
assign not_core_enable_48[47:0] = {40'h0, ~core_enable_status[7:0]};
assign not_bank_avail_48[47:0]  = {14'h0, {2{~bank_avail[7:0]}}, ~bank_avail_4[3:0], 14'h0};
assign not_bank_enable_48[47:0] = {14'h0,                               // NIU, PEU, DMU
                                   {2{~bank_enable_status_8[7:0]}},     // L2T, L2B
                                   ~bank_enable_status_8[6],            // MCU3
                                   ~bank_enable_status_8[4],            // MCU2
                                   ~bank_enable_status_8[2],            // MCU1
                                   ~bank_enable_status_8[0],            // MCU0
                                   14'h0};                              // SIO, SII, SPC

assign mbist_skip[47:0] = csr_mbist_bypass |
                          not_core_avail_48 | not_core_enable_48 |
                          not_bank_avail_48 | not_bank_enable_48;
assign mbist_skip_or_done[47:0] = mbist_skip | mbist_done;

//================================================================================
// Previous is Skipped or Done
// Go through one engine in one cycle
// Move on to the next engine when the previous one is
//    1. Skipped (Bypassed or Core not available)
//    2. Done
//================================================================================
assign prev_skip_done_din[47:1] = {prev_skip_done[46:1], mbist_start_io_sync} & mbist_skip_or_done[46:0];

tcu_mbist_ctl_msff_ctl_macro__width_47 prev_skip_done_reg  (
   .scan_in  ( prev_skip_done_reg_scanin  ),
   .scan_out ( prev_skip_done_reg_scanout ),
   .l1clk    ( l1clk                      ),
   .din      ( prev_skip_done_din[47:1]   ),
   .dout     ( prev_skip_done[47:1]       ),
  .siclk(siclk),
  .soclk(soclk));


assign tcu_mb_start_din = ~mbist_skip[47:0] & (~mbist_done | {48{hold_start}} | {48{tcu_mbist_loop_mode}}) &
                          (parallel ? {48{mbist_start_io_sync}}:
                                      {prev_skip_done_din, mbist_start_io_sync});

assign tcu_mb_start_d_cmp_din[31:0] = {tcu_mb_start_din[33:14],     // [31:12] L2T, L2B, MCU
                                       tcu_mb_start_din[12],        // [11]    NCU 0
                                       tcu_mb_start_din[10],        // [10]    SIO 0
                                       tcu_mb_start_din[9:0]};      // [9:0]   SII, SPC

tcu_mbist_ctl_msff_ctl_macro__width_32 tcu_mb_start_d_cmp_reg  (
   .scan_in  ( tcu_mb_start_d_cmp_reg_scanin  ),
   .scan_out ( tcu_mb_start_d_cmp_reg_scanout ),
   .l1clk    ( l1clk                          ),
   .din      ( tcu_mb_start_d_cmp_din[31:0]   ),
   .dout     ( tcu_mb_start_d_cmp[31:0]       ),
  .siclk(siclk),
  .soclk(soclk));

// Latch again for staging flops
assign tcu_mb_start_d2_cmp_din[17:0] = {tcu_mb_start_d_cmp[31:27],     // [17:13] L2T7-3
                                        tcu_mb_start_d_cmp[25],        // [12]    L2T1
                                        tcu_mb_start_d_cmp[23:20],     // [11:8]  L2B7-3
                                        tcu_mb_start_d_cmp[15:14],     // [7:6]   MCU3-2
                                        tcu_mb_start_d_cmp[7:3],       // [5:1]   SPC7-3
                                        tcu_mb_start_d_cmp[1]};        // [0]     SPC1

tcu_mbist_ctl_msff_ctl_macro__width_18 tcu_mb_start_d2_cmp_reg  (
   .scan_in  ( tcu_mb_start_d2_cmp_reg_scanin  ),
   .scan_out ( tcu_mb_start_d2_cmp_reg_scanout ),
   .l1clk    ( l1clk                           ),
   .din      ( tcu_mb_start_d2_cmp_din[17:0]   ),
   .dout     ( tcu_mb_start_d2_cmp[17:0]       ),
  .siclk(siclk),
  .soclk(soclk));

assign tcu_mb_start_d_io_din = {tcu_mb_start_din[47:34],     // [15:2] NIU, PEU DMU
                                tcu_mb_start_din[13],        // [1]    NCU1
                                tcu_mb_start_din[11]};       // [0]    SIO1

tcu_mbist_ctl_msff_ctl_macro__en_1__width_16 tcu_mb_start_d_io_reg   (
   .scan_in  ( tcu_mb_start_d_io_reg_scanin  ),
   .scan_out ( tcu_mb_start_d_io_reg_scanout ),
   .l1clk    ( l1clk                         ),
   .en       ( cmp_io_sync_en_local          ),
   .din      ( tcu_mb_start_d_io_din[15:0]   ),
   .dout     ( tcu_mb_start_d_io[15:0]       ),
  .siclk(siclk),
  .soclk(soclk));

assign tcu_mb_start = {tcu_mb_start_d_io[15:2],     // NIU, PEU, DMU
                       tcu_mb_start_d2_cmp[17:13],  // L2T7-3
                       tcu_mb_start_d_cmp[26],      // L2T2
                       tcu_mb_start_d2_cmp[12],     // L2T1
                       tcu_mb_start_d_cmp[24],      // L2T0
                       tcu_mb_start_d2_cmp[11:8],   // L2B7-4
                       tcu_mb_start_d_cmp[19:16],   // L2B3-0
                       tcu_mb_start_d2_cmp[7:6],    // MCU3-2
                       tcu_mb_start_d_cmp[13:12],   // MCU1-0
                       tcu_mb_start_d_io[1],        // NCU1
                       tcu_mb_start_d_cmp[11],      // NCU0
                       tcu_mb_start_d_io[0],        // SIO1
                       tcu_mb_start_d_cmp[10:8],    // SIO0, SII
                       tcu_mb_start_d2_cmp[5:1],    // SPC7-3
                       tcu_mb_start_d_cmp[2],       // SPC2
                       tcu_mb_start_d2_cmp[0],      // SPC1
                       tcu_mb_start_d_cmp[0]};      // SPC0

tcu_mbist_ctl_msff_ctl_macro__width_1 tcu_bisx_done_reg  (
   .scan_in  ( tcu_bisx_done_reg_scanin  ),
   .scan_out ( tcu_bisx_done_reg_scanout ),
   .l1clk    ( l1clk                     ),
   .din      ( tcu_bisx_done_din         ),
   .dout     ( tcu_bisx_done             ),
  .siclk(siclk),
  .soclk(soclk));

tcu_mbist_ctl_msff_ctl_macro__width_1 bisx_counter_en_reg  (
   .scan_in  ( bisx_counter_en_reg_scanin  ),
   .scan_out ( bisx_counter_en_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .din      ( bisx_counter_en_din         ),
   .dout     ( bisx_counter_en             ),
  .siclk(siclk),
  .soclk(soclk));

//================================================================================
// BISX Counter
//================================================================================
assign bisx_counter_din = bisx_counter_en ? bisx_counter + 32'b1 :
                                            32'h0;
                          

tcu_mbist_ctl_msff_ctl_macro__width_32 bisx_counter_reg  (
   .scan_in  ( bisx_counter_reg_scanin  ),
   .scan_out ( bisx_counter_reg_scanout ),
   .l1clk    ( l1clk                    ),
   .din      ( bisx_counter_din[31:0]   ),
   .dout     ( bisx_counter[31:0]       ),
  .siclk(siclk),
  .soclk(soclk));

assign bisx_time_out = &bisx_counter;


//==============================================================================
// LBIST Control
//==============================================================================
//==============================================================================
// Flop Incoming Signals from Another Block
//==============================================================================
tcu_mbist_ctl_msff_ctl_macro__en_1__width_8 tcu_lb_tcu_done_reg   (
   .scan_in  ( tcu_lb_tcu_done_reg_scanin  ),
   .scan_out ( tcu_lb_tcu_done_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .en       ( io_cmp_sync_en_local        ),
   .din      ( lb_tcu_done[7:0]            ),
   .dout     ( lb_tcu_done_d[7:0]          ),
  .siclk(siclk),
  .soclk(soclk));

assign lb_prev_clear[7:1] =
       lb_prev_clear[6:0] & lbist_skip_or_done[6:0];

assign lb_prev_clear[0] = csr_lbist_start;

assign lbist_skip_or_done[7:0] = lb_tcu_done_d | csr_lbist_bypass | not_core_avail_48[7:0];

assign lbist_all_done_din = &lbist_skip_or_done[7:0];
tcu_mbist_ctl_msff_ctl_macro__width_1 lbist_all_done_reg  (
   .scan_in  ( lbist_all_done_reg_scanin  ),
   .scan_out ( lbist_all_done_reg_scanout ),
   .l1clk    ( l1clk                      ),
   .din      ( lbist_all_done_din         ),
   .dout     ( lbist_all_done             ),
  .siclk(siclk),
  .soclk(soclk));


assign lb_start[7:0] = ~lbist_skip_or_done &
                       (csr_lbist_mode[0] ? {8{csr_lbist_start}} : lb_prev_clear);

tcu_mbist_ctl_msff_ctl_macro__en_1__width_8 tcu_lbist_start_reg   (
   .scan_in  ( tcu_lbist_start_reg_scanin  ),
   .scan_out ( tcu_lbist_start_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .en       ( io_cmp_sync_en_local        ),
   .din      ( lb_start[7:0]               ),
   .dout     ( tcu_spc_lbist_start[7:0]    ),
  .siclk(siclk),
  .soclk(soclk));

//================================================================================
// Send mbist start to debug ctl to request a clock stop when cycle counter
// reaches zero
//================================================================================
tcu_mbist_ctl_msff_ctl_macro__width_1 tcu_mb_clkstop_reg  (
   .scan_in  ( tcu_mb_clkstop_reg_scanin  ),
   .scan_out ( tcu_mb_clkstop_reg_scanout ),
   .l1clk    ( l1clk                         ),
   .din      ( mb_clkstop_req                ),
   .dout     ( mbist_clk_stop_req            ),
  .siclk(siclk),
  .soclk(soclk));

assign  mb_clkstop_req  = (mbist_clk_stop_req  |  mbist_start_io_sync) & mbist_clkstpen;

//********************************************************************
// Instantiate DMO Control Sub-Block
//********************************************************************
  
tcu_dmo_ctl dmo_ctl (
   .mbist_all_done ( mbist_all_done_real_time ),
   .mbist_one_fail ( mbist_one_fail_real_time ),
   .scan_in        ( tcu_dmo_ctl_scanin       ),
   .scan_out       ( tcu_dmo_ctl_scanout      ),
  .l2clk(l2clk),
  .tcu_int_se(tcu_int_se),
  .tcu_int_aclk(tcu_int_aclk),
  .tcu_int_bclk(tcu_int_bclk),
  .tcu_int_ce(tcu_int_ce),
  .tcu_pce_ov(tcu_pce_ov),
  .io_cmp_sync_en_local(io_cmp_sync_en_local),
  .cmp_io2x_sync_en_local(cmp_io2x_sync_en_local),
  .mbist_start_io_sync(mbist_start_io_sync),
  .tcu_mio_dmo_data(tcu_mio_dmo_data[39:0]),
  .tcu_mio_dmo_sync(tcu_mio_dmo_sync),
  .tcu_mio_mbist_done(tcu_mio_mbist_done),
  .tcu_mio_mbist_fail(tcu_mio_mbist_fail),
  .tcu_mio_jtag_membist_mode(tcu_mio_jtag_membist_mode),
  .spc4_dmo_dout(spc4_dmo_dout[35:0]),
  .spc6_dmo_dout(spc6_dmo_dout[35:0]),
  .dmo_coresel(dmo_coresel[5:0]),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .dmo_icmuxctl(dmo_icmuxctl),
  .l2t4_dmo_dout(l2t4_dmo_dout[38:0]),
  .l2t6_dmo_dout(l2t6_dmo_dout[38:0]),
  .dmo_l2tsel(dmo_l2tsel[5:0]),
  .dmo_tagmuxctl(dmo_tagmuxctl),
  .rtx_tcu_dmo_data_out(rtx_tcu_dmo_data_out[39:0]),
  .tds_tcu_dmo_dout(tds_tcu_dmo_dout[39:0]),
  .rdp_tcu_dmo_dout(rdp_tcu_dmo_dout[39:0]),
  .tcu_rtx_dmo_ctl(tcu_rtx_dmo_ctl[2:0]),
  .jtag_dmo_enable(jtag_dmo_enable),
  .jtag_dmo_control_upd(jtag_dmo_control_upd),
  .jtag_dmo_control(jtag_dmo_control[47:0]),
  .dmo_cfg(dmo_cfg[47:0]));


//==================================================
// Spare Gates
//==================================================
// ----------------------------------------------------------------------
// Removed for ECO to make flops visible in SunV
//
//spare_ctl_macro spare (num=12) (
//   .l1clk    ( l1clk         ),
//   .scan_in  ( spare_scanin  ),
//   .scan_out ( spare_scanout ));

// Added for ECO to make flops visible

// - this is an expansion of spare_ctl_macro with just the gates
tcu_mbist_ctl_spare_ctl_macro__flops_0__num_12 spare_gates  (
);

tcu_mbist_ctl_msff_ctl_macro__scanreverse_1__width_12 spare_flops  (
   .scan_in(spare_flops_scanin),
   .scan_out(spare_flops_scanout),
   .l1clk(l1clk),
   .din  (spare_flops_d[11:0]),
   .dout (spare_flops_q[11:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign   spare_flops_d[11]        =  1'b0;
assign   spare_flops_d[10]        =  1'b0;
assign   spare_flops_d[9]         =  spare9_flop_d;  // ECO C
assign   spare_flops_d[8]         =  1'b0;
assign   spare_flops_d[7]         =  1'b0;
assign   spare_flops_d[6]         =  1'b0;
assign   spare_flops_d[5]         =  1'b0;
assign   spare_flops_d[4]         =  1'b0;
assign   spare_flops_d[3]         =  spare3_flop_d;  // ECO C
assign   spare_flops_d[2]         =  1'b0;
assign   spare_flops_d[1]         =  1'b0;
assign   spare_flops_d[0]         =  spare0_flop_d;  // ECO D

assign   spare_flops_unused[11]   =  spare_flops_q[11];
assign   spare_flops_unused[10]   =  spare_flops_q[10];
assign   spare9_flop_q            =  spare_flops_q[9];    // ECO C
assign   spare_flops_unused[8]    =  spare_flops_q[8];  
assign   spare_flops_unused[7]    =  spare_flops_q[7];  
assign   spare_flops_unused[6]    =  spare_flops_q[6];  
assign   spare_flops_unused[5]    =  spare_flops_q[5];  
assign   spare_flops_unused[4]    =  spare_flops_q[4];  
assign   spare3_flop_q            =  spare_flops_q[3];    // ECO C
assign   spare_flops_unused[2]    =  spare_flops_q[2];  
assign   spare_flops_unused[1]    =  spare_flops_q[1];  
assign   spare0_flop_q            =  spare_flops_q[0];    // ECO D

assign   spare0_flop_d            =  cycle_stretch_to_mbc;            // ECO D
assign   cycle_stretch            =  spare0_flop_q;                   // ECO D

assign   spare3_flop_d            =  debug_cycle_counter_stop_to_mbc; // ECO C
assign   debug_cycle_counter_stop =  spare3_flop_q;                   // ECO C

assign   spare9_flop_d            =  mbist_clk_stop_to_mbc;           // ECO C
assign   mbist_clk_stop           =  spare9_flop_q;                   // ECO C

// ----------------------------------------------------------------------

// fixscan start:
assign jtag_csr_wr_sync_reg_scanin      = scan_in;
assign mb_tcu_done_36_sync_reg_scanin   = jtag_csr_wr_sync_reg_scanout;
assign mb_tcu_fail_36_sync_reg_scanin   = mb_tcu_done_36_sync_reg_scanout;
assign tcu_mbist_sync_en_reg_scanin     = mb_tcu_fail_36_sync_reg_scanout;
assign tcu_test_protect_cmp_reg_scanin  = tcu_mbist_sync_en_reg_scanout;
assign ucb_csr_wr_sync_reg_scanin       = tcu_test_protect_cmp_reg_scanout;
assign ucb_csr_addr_sync_reg_scanin     = ucb_csr_wr_sync_reg_scanout;
assign csr_mbist_mode_reg_scanin        = ucb_csr_addr_sync_reg_scanout;
assign csr_mbist_bypass_reg_scanin      = csr_mbist_mode_reg_scanout;
assign csr_mbist_start_reg_scanin       = csr_mbist_bypass_reg_scanout;
assign csr_mbist_abort_reg_scanin       = csr_mbist_start_reg_scanout;
assign csr_mbist_abort_d_reg_scanin     = csr_mbist_abort_reg_scanout;
assign csr_mbist_start_wmr_reg_scanin   = csr_mbist_abort_d_reg_scanout;
assign mbist_done_reg_scanin            = csr_mbist_start_wmr_reg_scanout;
assign mbist_fail_reg_scanin            = mbist_done_reg_scanout;
assign mbist_done_fail_reg_scanin       = mbist_fail_reg_scanout;
assign csr_lbist_mode_reg_scanin        = mbist_done_fail_reg_scanout;
assign csr_lbist_bypass_reg_scanin      = csr_lbist_mode_reg_scanout;
assign csr_lbist_start_reg_scanin       = csr_lbist_bypass_reg_scanout;
assign csr_lbist_start_d_reg_scanin     = csr_lbist_start_reg_scanout;
assign csr_lbist_done_reg_scanin        = csr_lbist_start_d_reg_scanout;
assign csr_peu_entestcfg_reg_scanin     = csr_lbist_done_reg_scanout;
assign csr_ucb_data_reg_scanin          = csr_peu_entestcfg_reg_scanout;
assign start_bisx_por_d_reg_scanin      = csr_ucb_data_reg_scanout;
assign tcu_mbist_state_reg_scanin       = start_bisx_por_d_reg_scanout;
assign mbist_start_io_sync_reg_scanin   = tcu_mbist_state_reg_scanout;
assign hold_start_reg_scanin            = mbist_start_io_sync_reg_scanout;
assign clr_mbist_start_wmr_reg_scanin   = hold_start_reg_scanout;
assign tcu_mbist_user_mode_reg_scanin   = clr_mbist_start_wmr_reg_scanout;
assign mb_tcu_done_stg_reg_scanin       = tcu_mbist_user_mode_reg_scanout;
assign mb_tcu_done_d_cmp_reg_scanin     = mb_tcu_done_stg_reg_scanout;
assign mb_tcu_done_d_io_reg_scanin      = mb_tcu_done_d_cmp_reg_scanout;
assign mb_tcu_fail_stg_reg_scanin       = mb_tcu_done_d_io_reg_scanout;
assign mb_tcu_fail_d_cmp_reg_scanin     = mb_tcu_fail_stg_reg_scanout;
assign mb_tcu_fail_d_io_reg_scanin      = mb_tcu_fail_d_cmp_reg_scanout;
assign core_avail_reg_scanin            = mb_tcu_fail_d_io_reg_scanout;
assign bank_avail_reg_scanin            = core_avail_reg_scanout;
assign core_enable_status_reg_scanin    = bank_avail_reg_scanout;
assign bank_enable_status_reg_scanin    = core_enable_status_reg_scanout;
assign prev_skip_done_reg_scanin        = bank_enable_status_reg_scanout;
assign tcu_mb_start_d_cmp_reg_scanin    = prev_skip_done_reg_scanout;
assign tcu_mb_start_d2_cmp_reg_scanin   = tcu_mb_start_d_cmp_reg_scanout;
assign tcu_mb_start_d_io_reg_scanin     = tcu_mb_start_d2_cmp_reg_scanout;
assign tcu_bisx_done_reg_scanin         = tcu_mb_start_d_io_reg_scanout;
assign bisx_counter_en_reg_scanin       = tcu_bisx_done_reg_scanout;
assign bisx_counter_reg_scanin          = bisx_counter_en_reg_scanout;
assign tcu_lb_tcu_done_reg_scanin       = bisx_counter_reg_scanout;
assign lbist_all_done_reg_scanin        = tcu_lb_tcu_done_reg_scanout;
assign tcu_lbist_start_reg_scanin       = lbist_all_done_reg_scanout;
assign tcu_mb_clkstop_reg_scanin        = tcu_lbist_start_reg_scanout;
assign tcu_dmo_ctl_scanin               = tcu_mb_clkstop_reg_scanout;
assign spare_flops_scanin               = tcu_dmo_ctl_scanout;
assign scan_out                         = spare_flops_scanout;
// fixscan end:

endmodule






// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






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

module tcu_mbist_ctl_msff_ctl_macro__en_1__width_1 (
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

module tcu_mbist_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






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

module tcu_mbist_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__width_48 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [47:0] fdin;
wire [46:0] so;

  input [47:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [47:0] dout;
  output scan_out;
assign fdin[47:0] = din[47:0];






dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__width_1 (
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

module tcu_mbist_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






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

module tcu_mbist_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






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

module tcu_mbist_ctl_msff_ctl_macro__en_1__width_64 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = (din[63:0] & {64{en}}) | (dout[63:0] & ~{64{en}});






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__width_18 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [17:0] fdin;
wire [16:0] so;

  input [17:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [17:0] dout;
  output scan_out;
assign fdin[17:0] = din[17:0];






dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__en_1__width_16 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = (din[15:0] & {16{en}}) | (dout[15:0] & ~{16{en}});






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

module tcu_mbist_ctl_msff_ctl_macro__en_1__width_8 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






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

module tcu_mbist_ctl_msff_ctl_macro__en_1__width_5 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = (din[4:0] & {5{en}}) | (dout[4:0] & ~{5{en}});






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__width_47 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [46:0] fdin;
wire [45:0] so;

  input [46:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [46:0] dout;
  output scan_out;
assign fdin[46:0] = din[46:0];






dff #(47)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[46:0]),
.si({scan_in,so[45:0]}),
.so({so[45:0],scan_out}),
.q(dout[46:0])
);












endmodule



// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__width_36 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [35:0] fdin;
wire [34:0] so;

  input [35:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [35:0] dout;
  output scan_out;
assign fdin[35:0] = din[35:0];






dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__width_39 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [38:0] fdin;
wire [37:0] so;

  input [38:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [38:0] dout;
  output scan_out;
assign fdin[38:0] = din[38:0];






dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__en_1__width_40 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = (din[39:0] & {40{en}}) | (dout[39:0] & ~{40{en}});






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

module tcu_mbist_ctl_msff_ctl_macro__clr__1__width_1 (
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

module tcu_mbist_ctl_msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module tcu_mbist_ctl_spare_ctl_macro__flops_0__num_12;
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
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;
wire spare10_buf_32x_unused;
wire spare10_nand3_8x_unused;
wire spare10_inv_8x_unused;
wire spare10_aoi22_4x_unused;
wire spare10_buf_8x_unused;
wire spare10_oai22_4x_unused;
wire spare10_inv_16x_unused;
wire spare10_nand2_16x_unused;
wire spare10_nor3_4x_unused;
wire spare10_nand2_8x_unused;
wire spare10_buf_16x_unused;
wire spare10_nor2_16x_unused;
wire spare10_inv_32x_unused;
wire spare11_buf_32x_unused;
wire spare11_nand3_8x_unused;
wire spare11_inv_8x_unused;
wire spare11_aoi22_4x_unused;
wire spare11_buf_8x_unused;
wire spare11_oai22_4x_unused;
wire spare11_inv_16x_unused;
wire spare11_nand2_16x_unused;
wire spare11_nor3_4x_unused;
wire spare11_nand2_8x_unused;
wire spare11_buf_16x_unused;
wire spare11_nor2_16x_unused;
wire spare11_inv_32x_unused;


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

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));

cl_u1_buf_32x   spare10_buf_32x (.in(1'b1),
                                   .out(spare10_buf_32x_unused));
cl_u1_nand3_8x spare10_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare10_nand3_8x_unused));
cl_u1_inv_8x    spare10_inv_8x (.in(1'b1),
                                  .out(spare10_inv_8x_unused));
cl_u1_aoi22_4x spare10_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_aoi22_4x_unused));
cl_u1_buf_8x    spare10_buf_8x (.in(1'b1),
                                  .out(spare10_buf_8x_unused));
cl_u1_oai22_4x spare10_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_oai22_4x_unused));
cl_u1_inv_16x   spare10_inv_16x (.in(1'b1),
                                   .out(spare10_inv_16x_unused));
cl_u1_nand2_16x spare10_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare10_nand2_16x_unused));
cl_u1_nor3_4x spare10_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare10_nor3_4x_unused));
cl_u1_nand2_8x spare10_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare10_nand2_8x_unused));
cl_u1_buf_16x   spare10_buf_16x (.in(1'b1),
                                   .out(spare10_buf_16x_unused));
cl_u1_nor2_16x spare10_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare10_nor2_16x_unused));
cl_u1_inv_32x   spare10_inv_32x (.in(1'b1),
                                   .out(spare10_inv_32x_unused));

cl_u1_buf_32x   spare11_buf_32x (.in(1'b1),
                                   .out(spare11_buf_32x_unused));
cl_u1_nand3_8x spare11_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare11_nand3_8x_unused));
cl_u1_inv_8x    spare11_inv_8x (.in(1'b1),
                                  .out(spare11_inv_8x_unused));
cl_u1_aoi22_4x spare11_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_aoi22_4x_unused));
cl_u1_buf_8x    spare11_buf_8x (.in(1'b1),
                                  .out(spare11_buf_8x_unused));
cl_u1_oai22_4x spare11_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_oai22_4x_unused));
cl_u1_inv_16x   spare11_inv_16x (.in(1'b1),
                                   .out(spare11_inv_16x_unused));
cl_u1_nand2_16x spare11_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare11_nand2_16x_unused));
cl_u1_nor3_4x spare11_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare11_nor3_4x_unused));
cl_u1_nand2_8x spare11_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare11_nand2_8x_unused));
cl_u1_buf_16x   spare11_buf_16x (.in(1'b1),
                                   .out(spare11_buf_16x_unused));
cl_u1_nor2_16x spare11_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare11_nor2_16x_unused));
cl_u1_inv_32x   spare11_inv_32x (.in(1'b1),
                                   .out(spare11_inv_32x_unused));



endmodule






// any PARAMS parms go into naming of macro

module tcu_mbist_ctl_msff_ctl_macro__scanreverse_1__width_12 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [0:10] so;

  input [11:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = din[11:0];






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({so[0:10],scan_in}),
.so({scan_out,so[0:10]}),
.q(dout[11:0])
);












endmodule








