// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_regs_ctl.v
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


module tcu_regs_ctl (
  debug_event_stop, 
  l2clk, 
  tcu_int_aclk, 
  tcu_int_bclk, 
  tcu_int_se, 
  tcu_int_ce, 
  tcu_int_ce_to_ucb, 
  tcu_int_ce_ucb, 
  tcu_pce_ov, 
  ac_test_mode, 
  cmp_io_sync_en, 
  io_cmp_sync_en, 
  cmp_io2x_sync_en, 
  ac_trans_test_counter_start, 
  jtag_clock_start, 
  clock_domain, 
  clock_domain_upd, 
  core_sel, 
  core_sel_upd, 
  decnt_data, 
  decnt_upd, 
  de_count, 
  cyc_count, 
  cyc_count_upd, 
  cycle_count, 
  tcudcr_data, 
  tcudcr_upd, 
  tcu_dcr, 
  dossen, 
  dossen_upd, 
  doss_enab, 
  dossmode, 
  dossmode_upd, 
  doss_mode, 
  ssreq_upd, 
  csmode, 
  csmode_upd, 
  cs_mode, 
  cs_mode_active, 
  jtagclkstop_ov, 
  jtag_ser_scan_q, 
  jtag_mt_enable, 
  jtag_test_protect, 
  flush_test_protect, 
  tcu_tp_sync_2io, 
  mt_mode_sync, 
  rst_tcu_dbr_gen, 
  tcu_dbr_gateoff, 
  cycle_stretch_to_mbc, 
  spc_crs, 
  doss_stat, 
  dbg1_tcu_soc_hard_stop, 
  spc0_hardstop_request, 
  spc1_hardstop_request, 
  spc2_hardstop_request, 
  spc3_hardstop_request, 
  spc4_hardstop_request, 
  spc5_hardstop_request, 
  spc6_hardstop_request, 
  spc7_hardstop_request, 
  clk_stop_ac_trans_counter_initiated, 
  debug_reg_hard_stop_domain_1st, 
  debug_cycle_counter_stop_to_mbc, 
  spc0_ss_complete, 
  spc1_ss_complete, 
  spc2_ss_complete, 
  spc3_ss_complete, 
  spc4_ss_complete, 
  spc5_ss_complete, 
  spc6_ss_complete, 
  spc7_ss_complete, 
  tcu_ss_request, 
  tcu_do_mode, 
  tcu_ss_mode, 
  spc0_softstop_request, 
  spc1_softstop_request, 
  spc2_softstop_request, 
  spc3_softstop_request, 
  spc4_softstop_request, 
  spc5_softstop_request, 
  spc6_softstop_request, 
  spc7_softstop_request, 
  spc0_ncu_core_running_status, 
  spc1_ncu_core_running_status, 
  spc2_ncu_core_running_status, 
  spc3_ncu_core_running_status, 
  spc4_ncu_core_running_status, 
  spc5_ncu_core_running_status, 
  spc6_ncu_core_running_status, 
  spc7_ncu_core_running_status, 
  spc0_trigger_pulse, 
  spc1_trigger_pulse, 
  spc2_trigger_pulse, 
  spc3_trigger_pulse, 
  spc4_trigger_pulse, 
  spc5_trigger_pulse, 
  spc6_trigger_pulse, 
  spc7_trigger_pulse, 
  dbg_creg_access, 
  dbg_creg_addr, 
  dbg_creg_data, 
  dbg_creg_wr_en, 
  dbg_creg_addr_en, 
  dbg_creg_data_en, 
  spc_ss_mode, 
  spc_ss_sel, 
  dbg1_tcu_soc_asrt_trigout, 
  tcu_mio_trigout, 
  mio_tcu_trigin, 
  tcu_rst_flush_stop_ack, 
  wmr_two, 
  mbist_clk_stop_req, 
  mbist_clk_stop_to_mbc, 
  scan_in, 
  scan_out, 
  l2data_upd, 
  l2addr_upd, 
  l2rti, 
  instr_l2_wr, 
  instr_l2_rd, 
  sio_tcu_data, 
  sio_tcu_vld, 
  l2access, 
  tcu_sii_data, 
  tcu_sii_vld, 
  l2rddata, 
  l2_read_vld, 
  ucb_csr_wr, 
  ucb_csr_addr, 
  ucb_data_out);
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire tcuregs_cmpiosync_reg_scanin;
wire tcuregs_cmpiosync_reg_scanout;
wire io_cmp_sync_en_local;
wire cmp_io_sync_en_local;
wire cmp_io2x_sync_en_local;
wire ucb_csr_wr_sync_reg_scanin;
wire ucb_csr_wr_sync_reg_scanout;
wire ucb_csr_wr_sync;
wire ac_test_muxed_clk_qual;
wire ac_trans_test_counter_stop;
wire tcuregs_ttcounter_reg_scanin;
wire tcuregs_ttcounter_reg_scanout;
wire [7:0] tt_count;
wire [7:0] tt_count_dout;
wire tt_start_d;
wire tcuregs_ttstart_reg_scanin;
wire tcuregs_ttstart_reg_scanout;
wire ucb_wr_clk_domain;
wire ff_debug_event_hard_stop_scanin;
wire ff_debug_event_hard_stop_scanout;
wire [23:0] clk_stop_domain;
wire clock_domain_upd_sync;
wire dbg_upd_clock_domain;
wire [23:0] clock_domain_data;
wire rst_upd_clock_domain;
wire reset_event;
wire tcu_dcr_en;
wire clk_stop_dom_zero;
wire rstend_reg_scanin;
wire rstend_reg_scanout;
wire rst_event;
wire end_of_reset;
wire wmr_two_d;
wire [5:0] spc_hs_req_stg_din;
wire spc7_hstop_req;
wire spc6_hstop_req;
wire spc5_hstop_req;
wire spc4_hstop_req;
wire spc3_hstop_req;
wire spc1_hstop_req;
wire spc_hs_req_stg_reg_scanin;
wire spc_hs_req_stg_reg_scanout;
wire [5:0] spc_hs_req_stg;
wire [7:0] spc_hs_req;
wire spc2_hstop_req;
wire spc0_hstop_req;
wire spchsreq_reg_scanin;
wire spchsreq_reg_scanout;
wire spchsreq_en;
wire [7:0] spc_hstop_req;
wire jtscan_off;
wire dossen_reg_scanin;
wire dossen_reg_scanout;
wire [63:0] next_doss_enab;
wire dossen_upd_sync;
wire spc0_doss_enab;
wire spc1_doss_enab;
wire spc2_doss_enab;
wire spc3_doss_enab;
wire spc4_doss_enab;
wire spc5_doss_enab;
wire spc6_doss_enab;
wire spc7_doss_enab;
wire [7:0] spc_doss_enab;
wire dossmode_reg_scanin;
wire dossmode_reg_scanout;
wire [1:0] next_doss_mode;
wire dossmode_upd_sync;
wire [5:0] spc_ss_complete_stg_din;
wire spc_ss_complete_stg_reg_scanin;
wire spc_ss_complete_stg_reg_scanout;
wire [5:0] spc_ss_complete_stg;
wire [7:0] spc_ss_complete;
wire spcsscomp_reg_scanin;
wire spcsscomp_reg_scanout;
wire spc_ss_en;
wire [7:0] spc_ss_comp_hld;
wire [7:0] spc_ss_comp;
wire [7:0] spc_ss_comp_din;
wire [5:0] spc_ss_req_stg_din;
wire spc7_sstop_req;
wire spc6_sstop_req;
wire spc5_sstop_req;
wire spc4_sstop_req;
wire spc3_sstop_req;
wire spc1_sstop_req;
wire spc_ss_req_stg_reg_scanin;
wire spc_ss_req_stg_reg_scanout;
wire [5:0] spc_ss_req_stg;
wire [7:0] spc_ss_req;
wire spc2_sstop_req;
wire spc0_sstop_req;
wire spcssreq_reg_scanin;
wire spcssreq_reg_scanout;
wire spcssreq_en;
wire [7:0] spc_sstop_req;
wire [63:0] spc_crunstat;
wire spcrstat_reg_scanin;
wire spcrstat_reg_scanout;
wire spccrs_en;
wire spc0_crunstat;
wire spc1_crunstat;
wire spc2_crunstat;
wire spc3_crunstat;
wire spc4_crunstat;
wire spc5_crunstat;
wire spc6_crunstat;
wire spc7_crunstat;
wire [7:0] spc_crstat;
wire [5:0] spc_tp_req_stg_din;
wire spc7_tp_req;
wire spc6_tp_req;
wire spc5_tp_req;
wire spc4_tp_req;
wire spc3_tp_req;
wire spc1_tp_req;
wire spc_tp_req_stg_reg_scanin;
wire spc_tp_req_stg_reg_scanout;
wire [5:0] spc_tp_req_stg;
wire [7:0] spc_tp_req;
wire spc2_tp_req;
wire spc0_tp_req;
wire spctp_reg_scanin;
wire spctp_reg_scanout;
wire spctpreq_en;
wire [7:0] spc_tp;
wire trigout_pulse;
wire clkdomain_upd_sync_reg_scanin;
wire clkdomain_upd_sync_reg_scanout;
wire coresel_upd_sync_reg_scanin;
wire coresel_upd_sync_reg_scanout;
wire core_sel_upd_sync;
wire decnt_upd_sync_reg_scanin;
wire decnt_upd_sync_reg_scanout;
wire decnt_upd_sync;
wire cyccnt_upd_sync_reg_scanin;
wire cyccnt_upd_sync_reg_scanout;
wire cyc_count_upd_sync;
wire tcudcr_upd_sync_reg_scanin;
wire tcudcr_upd_sync_reg_scanout;
wire tcudcr_upd_sync;
wire dossen_upd_sync_reg_scanin;
wire dossen_upd_sync_reg_scanout;
wire dossmode_upd_sync_reg_scanin;
wire dossmode_upd_sync_reg_scanout;
wire ssreq_upd_sync_reg_scanin;
wire ssreq_upd_sync_reg_scanout;
wire ssreq_upd_sync;
wire csmode_upd_sync_reg_scanin;
wire csmode_upd_sync_reg_scanout;
wire csmode_upd_sync;
wire jtagserscan_sync_reg_scanin;
wire jtagserscan_sync_reg_scanout;
wire jtag_ser_scan_sync;
wire testprotect_sync_reg_scanin;
wire testprotect_sync_reg_scanout;
wire jtag_test_protect_sync;
wire test_protect;
wire dbr_gateoff;
wire testprotect_reg_scanin;
wire testprotect_reg_scanout;
wire test_protect_en;
wire test_protect_sync_to_io;
wire mt_mode;
wire tcuregs_mtmode_syncreg_scanin;
wire tcuregs_mtmode_syncreg_scanout;
wire jtagclkstop_ov_d;
wire tcu_dbg_ctl_scan_in;
wire tcu_dbg_ctl_scan_out;
wire tcuregs_l2dataupd_syncreg_scanin;
wire tcuregs_l2dataupd_syncreg_scanout;
wire l2data_upd_sync;
wire tcuregs_l2addrupd_syncreg_scanin;
wire tcuregs_l2addrupd_syncreg_scanout;
wire l2addr_upd_sync;
wire tcuregs_l2rti_syncreg_scanin;
wire tcuregs_l2rti_syncreg_scanout;
wire l2rti_sync;
wire tcuregs_l2rd_syncreg_scanin;
wire tcuregs_l2rd_syncreg_scanout;
wire instr_l2_rd_sync;
wire tcuregs_l2wr_syncreg_scanin;
wire tcuregs_l2wr_syncreg_scanout;
wire instr_l2_wr_sync;
wire tcuregs_l2data_reg_scanin;
wire tcuregs_l2data_reg_scanout;
wire [63:0] next_l2data_reg;
wire [63:0] l2data_reg;
wire l2wrdata_shift;
wire l2rddata_shift;
wire l2addr_shift;
wire l2_read_start;
wire l2cnt_done;
wire tcuregs_l2addr_reg_scanin;
wire tcuregs_l2addr_reg_scanout;
wire [63:0] next_l2addr_reg;
wire [63:0] l2addr_reg;
wire tcu_sii_data_din;
wire tcuregs_tcu_sii_data_reg_scanin;
wire tcuregs_tcu_sii_data_reg_scanout;
wire [6:0] l2cnt;
wire tcuregs_l2rti_reg_scanin;
wire tcuregs_l2rti_reg_scanout;
wire l2rti_dly;
wire tcu_sii_vld_din;
wire tcuregs_tcu_sii_vld_reg_scanin;
wire tcuregs_tcu_sii_vld_reg_scanout;
wire tcuregs_l2siovld_reg_scanin;
wire tcuregs_l2siovld_reg_scanout;
wire tcuregs_l2cntr_reg_scanin;
wire tcuregs_l2cntr_reg_scanout;
wire l2cnt_clr_;
wire [6:0] new_l2cnt;
wire l2cnt_en;
wire l2cnt_max;
wire spare_flops_scanin;
wire spare_flops_scanout;
wire [8:0] spare_flops_d;
wire [8:0] spare_flops_q;
wire spare6_flop_d;
wire spare4_flop_d;
wire [8:0] spare_flops_unused;
wire spare6_flop_q;
wire spare4_flop_q;

   output debug_event_stop; assign debug_event_stop = 1'b0; // to be removed
   input l2clk;
   input tcu_int_aclk;
   input tcu_int_bclk;
   input tcu_int_se;
   input tcu_int_ce;
   input tcu_int_ce_to_ucb; // for timing ECO A
   output tcu_int_ce_ucb;   // for timing ECO A
   input tcu_pce_ov;
   //input io_test_mode;
   //input io_ac_test_mode;
   input ac_test_mode;
   input cmp_io_sync_en;
   input io_cmp_sync_en;
   input cmp_io2x_sync_en;
   input ac_trans_test_counter_start;

   // from JTAG
   input         jtag_clock_start;

   input [23:0]  clock_domain;
   input         clock_domain_upd;
   input [7:0] 	 core_sel;
   input 	 core_sel_upd;
  
   input [31:0]  decnt_data;
   input         decnt_upd;
   output [31:0] de_count;

   input [63:0]  cyc_count;
   input         cyc_count_upd;
   output [63:0] cycle_count; 

   input [3:0]   tcudcr_data;
   input         tcudcr_upd;
   output [3:0]  tcu_dcr;

   input [63:0]  dossen;
   input 	 dossen_upd;
   output [63:0] doss_enab;

   input [1:0] 	 dossmode;
   input 	 dossmode_upd;
   output [1:0]  doss_mode;

   input 	 ssreq_upd;

   input 	 csmode;
   input 	 csmode_upd;
   output 	 cs_mode;
   output 	 cs_mode_active;
   output        jtagclkstop_ov;

   // test protect goes to live blocks to gate off
   // unwanted activity during test modes and scan flush
   input         jtag_ser_scan_q;    // during jtag scan // ECO yyyyyy
   input         jtag_mt_enable;     // during macrotest
   input         jtag_test_protect;  // when set via jtag
   input         flush_test_protect; // during scan flush
   output        tcu_tp_sync_2io;
   output        mt_mode_sync;  // synchronized macrotest mode signal
   // and during debug reset to block outputs of blocks
   // that can interfere with debug reset
   input         rst_tcu_dbr_gen;    // during debug reset
   output        tcu_dbr_gateoff;

   // Cycle Stretch
   output        cycle_stretch_to_mbc;   // ECO D
   
   // To JTAG
   output [63:0] spc_crs; // core_run status
   output [7:0]	 doss_stat;
   
   // Hard Stop from SOC
   input 	 dbg1_tcu_soc_hard_stop;
   
   // Debug Event Requests from SPC Cores
   input       	 spc0_hardstop_request;
   input       	 spc1_hardstop_request;
   input       	 spc2_hardstop_request;
   input       	 spc3_hardstop_request;
   input       	 spc4_hardstop_request;
   input       	 spc5_hardstop_request;
   input       	 spc6_hardstop_request;
   input       	 spc7_hardstop_request;
   
   output clk_stop_ac_trans_counter_initiated;   
   output [23:0] debug_reg_hard_stop_domain_1st;
   output 	 debug_cycle_counter_stop_to_mbc; // ECO C

   input 	 spc0_ss_complete;
   input 	 spc1_ss_complete;
   input 	 spc2_ss_complete;
   input 	 spc3_ss_complete;
   input 	 spc4_ss_complete;
   input 	 spc5_ss_complete;
   input 	 spc6_ss_complete;
   input 	 spc7_ss_complete;

   // To SPC Cores: Single Step and Disable Overlap
   output [7:0]  tcu_ss_request; // pulse
   output [7:0]  tcu_do_mode;
   output [7:0]  tcu_ss_mode;
   
   input       	 spc0_softstop_request;
   input       	 spc1_softstop_request;
   input       	 spc2_softstop_request;
   input       	 spc3_softstop_request;
   input       	 spc4_softstop_request;
   input       	 spc5_softstop_request;
   input       	 spc6_softstop_request;
   input       	 spc7_softstop_request;

   input [7:0] 	 spc0_ncu_core_running_status;
   input [7:0] 	 spc1_ncu_core_running_status;
   input [7:0] 	 spc2_ncu_core_running_status;
   input [7:0] 	 spc3_ncu_core_running_status;
   input [7:0] 	 spc4_ncu_core_running_status;
   input [7:0] 	 spc5_ncu_core_running_status;
   input [7:0] 	 spc6_ncu_core_running_status;
   input [7:0] 	 spc7_ncu_core_running_status;

   input       	 spc0_trigger_pulse;
   input       	 spc1_trigger_pulse;
   input       	 spc2_trigger_pulse;
   input       	 spc3_trigger_pulse;
   input       	 spc4_trigger_pulse;
   input       	 spc5_trigger_pulse;
   input       	 spc6_trigger_pulse;
   input       	 spc7_trigger_pulse;

   // Interface to UCB Control for parking cores
   output 	 dbg_creg_access;  
   output [39:0] dbg_creg_addr;    
   output [63:0] dbg_creg_data;    
   output 	 dbg_creg_wr_en;   
   output 	 dbg_creg_addr_en; 
   output 	 dbg_creg_data_en;

   output        spc_ss_mode;
   output [7:0]  spc_ss_sel;

   // Watchpoint Trigger
   input 	 dbg1_tcu_soc_asrt_trigout;
   output 	 tcu_mio_trigout;  // to TRIGOUT package pin

   // Trigger Input from Pin
   input 	 mio_tcu_trigin;

   // End of Power-on Reset as a Debug Event
   input         tcu_rst_flush_stop_ack;
   input         wmr_two;

   // MBIST Clock Stop
   input         mbist_clk_stop_req;
   output        mbist_clk_stop_to_mbc; // ECO C

   //scan
   input scan_in;
   output scan_out;
   
   // SIU Interface (L2 Access)
   input         l2data_upd;
   input         l2addr_upd;
   input         l2rti;
   input         instr_l2_wr;
   input         instr_l2_rd;
   input         sio_tcu_data;
   input         sio_tcu_vld;
   input  [64:0] l2access; // bit 0 is ignored 
   output        tcu_sii_data;
   output        tcu_sii_vld;
   output [63:0] l2rddata;
   output        l2_read_vld;

   // CSR (mbist_ctl)
   input         ucb_csr_wr;
   input [5:0]   ucb_csr_addr;
   input [63:0]  ucb_data_out;

   // Scan reassigns
   assign 	 l1en   = tcu_int_ce; // 1'b1;
   assign        pce_ov = tcu_pce_ov; // 1'b1;
   assign 	 stop   = 1'b0;
   assign 	 se     = tcu_int_se;
   assign 	 siclk = tcu_int_aclk;
   assign 	 soclk = tcu_int_bclk;

   //create clock headers
   tcu_regs_ctl_l1clkhdr_ctl_macro regs_clkgen 
     (
      .l2clk  (l2clk),
      .l1clk  (l1clk),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
      );

   // Synchronizer Pulse from cluster header
   tcu_regs_ctl_msff_ctl_macro__width_3 tcuregs_cmpiosync_reg 
   ( 
     .scan_in(tcuregs_cmpiosync_reg_scanin),
     .scan_out(tcuregs_cmpiosync_reg_scanout),
     .l1clk    (l1clk),
     .din      ({io_cmp_sync_en      , cmp_io_sync_en  ,     cmp_io2x_sync_en}), 
     .dout     ({io_cmp_sync_en_local, cmp_io_sync_en_local, cmp_io2x_sync_en_local}),
  .siclk(siclk),
  .soclk(soclk)
     );

	 // Sync UCB CSR write signal and then pass it to dbg_ctl
    tcu_regs_ctl_msff_ctl_macro__en_1__width_1 ucb_csr_wr_sync_reg   (
      .scan_in  ( ucb_csr_wr_sync_reg_scanin  ),
      .scan_out ( ucb_csr_wr_sync_reg_scanout ),
      .l1clk    ( l1clk                       ),
      .en       ( io_cmp_sync_en_local        ),
      .din      ( ucb_csr_wr                  ),
      .dout     ( ucb_csr_wr_sync             ),
  .siclk(siclk),
  .soclk(soclk));

   //********************************************************************
   // Transition Test Control
   //********************************************************************
   //assign   ac_test_mode   = io_test_mode  &  io_ac_test_mode;

   //need to qualify muxed clock with de-assertion of a clock stop
   assign   ac_test_muxed_clk_qual =  ac_test_mode &
	    ac_trans_test_counter_start &
	    ~ac_trans_test_counter_stop;
   
   //ac trans test counter only 8 bits wide, ac tests not that long
   //msff_ctl_macro  ff_counter_ac_trans_clk_stop (width=8,en=1) (
   tcu_regs_ctl_msff_ctl_macro__en_1__width_8  tcuregs_ttcounter_reg  (
    .scan_in(tcuregs_ttcounter_reg_scanin),
    .scan_out(tcuregs_ttcounter_reg_scanout),
    .din     (tt_count[7:0]),
    .dout    (tt_count_dout[7:0]),
    .en      (ac_test_muxed_clk_qual),
    .l1clk   (l1clk),
  .siclk(siclk),
  .soclk(soclk)); //ac_test_muxed_clk));


   assign   tt_count[7:0] = tt_count_dout[7:0] - 8'b1;
   
   assign   ac_trans_test_counter_stop =
	    ac_test_mode &
	    (tt_count_dout[7:0] == 8'h0) &
	    tt_start_d; //ac_trans_test_counter_start;

   //means clk stop initiated by counter stop
   assign   clk_stop_ac_trans_counter_initiated = ac_trans_test_counter_stop;

   // Flop start of ac transition test to break timing loop
   tcu_regs_ctl_msff_ctl_macro__width_1  tcuregs_ttstart_reg  (
    .scan_in(tcuregs_ttstart_reg_scanin),
    .scan_out(tcuregs_ttstart_reg_scanout),
    .din     (ac_trans_test_counter_start),
    .dout    (tt_start_d),
    .l1clk   (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 

   //********************************************************************
   // Clock Domain Register
   //********************************************************************
   assign ucb_wr_clk_domain = ucb_csr_wr_sync && ucb_csr_addr == 6'h25;
   
   //debug event hard stop clk register
   tcu_regs_ctl_msff_ctl_macro__width_24  ff_debug_event_hard_stop  (
    .scan_in(ff_debug_event_hard_stop_scanin),
    .scan_out(ff_debug_event_hard_stop_scanout),
    .din(clk_stop_domain[23:0]), //debug_reg_hard_stop_domain_1st[16:0]),
    .dout(debug_reg_hard_stop_domain_1st[23:0]),
    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));
   
   // from JTAG
   assign   clk_stop_domain[23:0] = clock_domain_upd_sync ? clock_domain[23:0]
	                          : dbg_upd_clock_domain ? clock_domain_data[23:0]
                                  : rst_upd_clock_domain ? 24'h1
                                  : ucb_wr_clk_domain ? ucb_data_out[23:0]
                                  : debug_reg_hard_stop_domain_1st[23:0];
   assign   rst_upd_clock_domain  = reset_event  &  tcu_dcr_en  &  clk_stop_dom_zero;
   assign   clk_stop_dom_zero     = ~(|debug_reg_hard_stop_domain_1st[23:0]);

   //********************************************************************
   // Debug Control
   //********************************************************************

   //********************************************************************
   // Create a debug event when Power-on reset sequence ends 
   //********************************************************************
   // For use with TCU DCR - only enabled when tcu_dcr[2] active
   tcu_regs_ctl_msff_ctl_macro__clr_1__en_1__width_2 rstend_reg 
   ( 
     .scan_in(rstend_reg_scanin),
     .scan_out(rstend_reg_scanout),
     .l1clk    (l1clk),
     .clr      (~tcu_dcr_en),
     .en       (~rst_event),
     .din      ({wmr_two,   end_of_reset}), 
     .dout     ({wmr_two_d, rst_event}),
  .siclk(siclk),
  .soclk(soclk)
     );

   assign   end_of_reset    =  wmr_two_d & tcu_rst_flush_stop_ack;
   assign   reset_event     =  rst_event;

   //********************************************************************
   // Hard Stop - SPC request for Hard Clock Stop
   //********************************************************************
   assign spc_hs_req_stg_din = {spc7_hstop_req, spc6_hstop_req, spc5_hstop_req,
                                spc4_hstop_req, spc3_hstop_req, spc1_hstop_req};

   tcu_regs_ctl_msff_ctl_macro__width_6 spc_hs_req_stg_reg  (
      .scan_in  ( spc_hs_req_stg_reg_scanin  ),
      .scan_out ( spc_hs_req_stg_reg_scanout ),
      .l1clk    ( l1clk                      ),
      .din      ( spc_hs_req_stg_din[5:0]    ),
      .dout     ( spc_hs_req_stg[5:0]        ),
  .siclk(siclk),
  .soclk(soclk));

   assign spc_hs_req[7:0] = {spc_hs_req_stg[5:1],
                             spc2_hstop_req,
                             spc_hs_req_stg[0],
                             spc0_hstop_req};

   tcu_regs_ctl_msff_ctl_macro__clr_1__en_1__width_8 spchsreq_reg 
   ( 
     .scan_in(spchsreq_reg_scanin),
     .scan_out(spchsreq_reg_scanout),
     .l1clk    (l1clk),
     .clr      (tcu_dcr_en),
     .en       (spchsreq_en),
     .din      (spc_hs_req[7:0]), 
     .dout     (spc_hstop_req[7:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   spchsreq_en    =  jtscan_off;
   
   assign   spc0_hstop_req = spc0_hardstop_request; //|spc0_hardstop_request[7:0];
   assign   spc1_hstop_req = spc1_hardstop_request; //|spc1_hardstop_request[7:0];
   assign   spc2_hstop_req = spc2_hardstop_request; //|spc2_hardstop_request[7:0];
   assign   spc3_hstop_req = spc3_hardstop_request; //|spc3_hardstop_request[7:0];
   assign   spc4_hstop_req = spc4_hardstop_request; //|spc4_hardstop_request[7:0];
   assign   spc5_hstop_req = spc5_hardstop_request; //|spc5_hardstop_request[7:0];
   assign   spc6_hstop_req = spc6_hardstop_request; //|spc6_hardstop_request[7:0];
   assign   spc7_hstop_req = spc7_hardstop_request; //|spc7_hardstop_request[7:0];
   
   //********************************************************************
   // Disable Overlap and Single Step Enable Register
   //********************************************************************
   
   tcu_regs_ctl_msff_ctl_macro__width_64 dossen_reg 
   ( 
     .scan_in(dossen_reg_scanin),
     .scan_out(dossen_reg_scanout),
     .l1clk    (l1clk),
     .din      (next_doss_enab[63:0]), 
     .dout     (doss_enab[63:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

   assign   next_doss_enab[63:0] =  dossen_upd_sync ? dossen[63:0]
                                 :  doss_enab[63:0];
   
   assign   spc0_doss_enab = |doss_enab[7:0];
   assign   spc1_doss_enab = |doss_enab[15:8];
   assign   spc2_doss_enab = |doss_enab[23:16];
   assign   spc3_doss_enab = |doss_enab[31:24];
   assign   spc4_doss_enab = |doss_enab[39:32];
   assign   spc5_doss_enab = |doss_enab[47:40];
   assign   spc6_doss_enab = |doss_enab[55:48];
   assign   spc7_doss_enab = |doss_enab[63:56];

   assign spc_doss_enab[7:0] = {spc7_doss_enab,spc6_doss_enab,
				spc5_doss_enab,spc4_doss_enab,
				spc3_doss_enab,spc2_doss_enab,
				spc1_doss_enab,spc0_doss_enab};

   //********************************************************************
   // Disable Overlap Mode Register
   //********************************************************************
   
   tcu_regs_ctl_msff_ctl_macro__en_1__width_2 dossmode_reg  
   ( 
     .scan_in(dossmode_reg_scanin),
     .scan_out(dossmode_reg_scanout),
     .l1clk    (l1clk),
     .en       (cmp_io_sync_en_local),
     .din      (next_doss_mode[1:0]), 
     .dout     (doss_mode[1:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

   assign   next_doss_mode[1:0] =  dossmode_upd_sync ? dossmode[1:0]
                                :  doss_mode[1:0];
   
   //********************************************************************
   // Single Step Complete - SPC acknowledgement that its single-step is complete
   //********************************************************************

   // Staging Flops
   assign spc_ss_complete_stg_din = {spc7_ss_complete, spc6_ss_complete, spc5_ss_complete,
                                     spc4_ss_complete, spc3_ss_complete, spc1_ss_complete};

   tcu_regs_ctl_msff_ctl_macro__width_6 spc_ss_complete_stg_reg  (
      .scan_in  ( spc_ss_complete_stg_reg_scanin  ),
      .scan_out ( spc_ss_complete_stg_reg_scanout ),
      .l1clk    ( l1clk                           ),
      .din      ( spc_ss_complete_stg_din[5:0]    ),
      .dout     ( spc_ss_complete_stg[5:0]        ),
  .siclk(siclk),
  .soclk(soclk));

   assign spc_ss_complete[7:0] = {spc_ss_complete_stg[5:1],
                                  spc2_ss_complete,
                                  spc_ss_complete_stg[0],
                                  spc0_ss_complete};

   tcu_regs_ctl_msff_ctl_macro__clr_1__en_1__width_8 spcsscomp_reg 
   ( 
     .scan_in(spcsscomp_reg_scanin),
     .scan_out(spcsscomp_reg_scanout),
     .l1clk    (l1clk),
     .clr      (~spc_ss_en),
     .en       (spc_ss_en),
     .din      (spc_ss_comp_hld[7:0]),
     .dout     (spc_ss_comp[7:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   // ss_complete from SPC's is a pulse, but need to hold until cleared
   assign   spc_ss_comp_din[7:0] =  spc_ss_complete[7:0]  & ~tcu_ss_request[7:0];
   assign   spc_ss_comp_hld[7:0] =  spc_ss_comp_din[7:0]  |  spc_ss_comp[7:0];
   assign   spc_ss_en            =  doss_mode[1] & doss_mode[0] &  jtscan_off;

   //********************************************************************
   // Soft Stop - SPC request for Soft Clock Stop
   //********************************************************************
   assign spc_ss_req_stg_din = {spc7_sstop_req, spc6_sstop_req, spc5_sstop_req,
                                spc4_sstop_req, spc3_sstop_req, spc1_sstop_req};

   tcu_regs_ctl_msff_ctl_macro__width_6 spc_ss_req_stg_reg  (
      .scan_in  ( spc_ss_req_stg_reg_scanin  ),
      .scan_out ( spc_ss_req_stg_reg_scanout ),
      .l1clk    ( l1clk                      ),
      .din      ( spc_ss_req_stg_din[5:0]    ),
      .dout     ( spc_ss_req_stg[5:0]        ),
  .siclk(siclk),
  .soclk(soclk));

   assign spc_ss_req[7:0] = {spc_ss_req_stg[5:1],
                             spc2_sstop_req,
                             spc_ss_req_stg[0],
                             spc0_sstop_req};

   tcu_regs_ctl_msff_ctl_macro__clr_1__en_1__width_8 spcssreq_reg 
   ( 
     .scan_in(spcssreq_reg_scanin),
     .scan_out(spcssreq_reg_scanout),
     .l1clk    (l1clk),
     .clr      (tcu_dcr_en),
     .en       (spcssreq_en),
     .din      (spc_ss_req[7:0]), 
     .dout     (spc_sstop_req[7:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   spcssreq_en    =  jtscan_off;
   
   assign   spc0_sstop_req = spc0_softstop_request; //|spc0_softstop_request[7:0];
   assign   spc1_sstop_req = spc1_softstop_request; //|spc1_softstop_request[7:0];
   assign   spc2_sstop_req = spc2_softstop_request; //|spc2_softstop_request[7:0];
   assign   spc3_sstop_req = spc3_softstop_request; //|spc3_softstop_request[7:0];
   assign   spc4_sstop_req = spc4_softstop_request; //|spc4_softstop_request[7:0];
   assign   spc5_sstop_req = spc5_softstop_request; //|spc5_softstop_request[7:0];
   assign   spc6_sstop_req = spc6_softstop_request; //|spc6_softstop_request[7:0];
   assign   spc7_sstop_req = spc7_softstop_request; //|spc7_softstop_request[7:0];

   //********************************************************************
   // Core Running Status - SPC status: parked or running
   //********************************************************************
   assign   spc_crunstat[63:0] = {spc7_ncu_core_running_status[7:0],
                                  spc6_ncu_core_running_status[7:0],
				  spc5_ncu_core_running_status[7:0],
				  spc4_ncu_core_running_status[7:0],
				  spc3_ncu_core_running_status[7:0],
				  spc2_ncu_core_running_status[7:0],
				  spc1_ncu_core_running_status[7:0],
				  spc0_ncu_core_running_status[7:0]};

   tcu_regs_ctl_msff_ctl_macro__en_1__width_64 spcrstat_reg 
   ( 
     .scan_in(spcrstat_reg_scanin),
     .scan_out(spcrstat_reg_scanout),
     .l1clk    (l1clk),
     .en       (spccrs_en),
     .din      (spc_crunstat[63:0]), 
     .dout     (spc_crs[63:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   spccrs_en        =  jtscan_off & cmp_io_sync_en_local;

   assign   spc0_crunstat    = |spc_crs[7:0];
   assign   spc1_crunstat    = |spc_crs[15:8];
   assign   spc2_crunstat    = |spc_crs[23:16];
   assign   spc3_crunstat    = |spc_crs[31:24];
   assign   spc4_crunstat    = |spc_crs[39:32];
   assign   spc5_crunstat    = |spc_crs[47:40];
   assign   spc6_crunstat    = |spc_crs[55:48];
   assign   spc7_crunstat    = |spc_crs[63:56];

   assign   spc_crstat[7:0]  = {spc7_crunstat,spc6_crunstat,
			        spc5_crunstat,spc4_crunstat,
			        spc3_crunstat,spc2_crunstat,
			        spc1_crunstat,spc0_crunstat};

   //********************************************************************
   // Trigger Pulse - SPC request to pulse Watchpoint (TRIGOUT) pin
   //********************************************************************
   assign spc_tp_req_stg_din = {spc7_tp_req, spc6_tp_req, spc5_tp_req,
                                spc4_tp_req, spc3_tp_req, spc1_tp_req};

   tcu_regs_ctl_msff_ctl_macro__width_6 spc_tp_req_stg_reg  (
      .scan_in  ( spc_tp_req_stg_reg_scanin  ),
      .scan_out ( spc_tp_req_stg_reg_scanout ),
      .l1clk    ( l1clk                      ),
      .din      ( spc_tp_req_stg_din[5:0]    ),
      .dout     ( spc_tp_req_stg[5:0]        ),
  .siclk(siclk),
  .soclk(soclk));

   assign spc_tp_req[7:0] = {spc_tp_req_stg[5:1],
                             spc2_tp_req,
                             spc_tp_req_stg[0],
                             spc0_tp_req};

   tcu_regs_ctl_msff_ctl_macro__clr_1__en_1__width_8 spctp_reg 
   ( 
     .scan_in(spctp_reg_scanin),
     .scan_out(spctp_reg_scanout),
     .l1clk    (l1clk),
     .clr      (tcu_dcr_en),
     .en       (spctpreq_en),
     .din      (spc_tp_req[7:0]), 
     .dout     (spc_tp[7:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   spctpreq_en =  jtscan_off;

   assign   spc0_tp_req = spc0_trigger_pulse; //|spc0_trigger_pulse[7:0];
   assign   spc1_tp_req = spc1_trigger_pulse; //|spc1_trigger_pulse[7:0];
   assign   spc2_tp_req = spc2_trigger_pulse; //|spc2_trigger_pulse[7:0];
   assign   spc3_tp_req = spc3_trigger_pulse; //|spc3_trigger_pulse[7:0];
   assign   spc4_tp_req = spc4_trigger_pulse; //|spc4_trigger_pulse[7:0];
   assign   spc5_tp_req = spc5_trigger_pulse; //|spc5_trigger_pulse[7:0];
   assign   spc6_tp_req = spc6_trigger_pulse; //|spc6_trigger_pulse[7:0];
   assign   spc7_tp_req = spc7_trigger_pulse; //|spc7_trigger_pulse[7:0];

   assign   tcu_mio_trigout =  trigout_pulse; // from dbg_ctl

   
   //********************************************************************
   // Synchronizers for Updates from JTAG (TCK Clock Domain)
   //********************************************************************
   
   cl_sc1_clksyncff_4x clkdomain_upd_sync_reg
   ( .si (clkdomain_upd_sync_reg_scanin),
     .so (clkdomain_upd_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (clock_domain_upd),
     .q     (clock_domain_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
     );

   cl_sc1_clksyncff_4x coresel_upd_sync_reg
   ( .si (coresel_upd_sync_reg_scanin),
     .so (coresel_upd_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (core_sel_upd),
     .q     (core_sel_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
     );

   cl_sc1_clksyncff_4x decnt_upd_sync_reg
   ( .si (decnt_upd_sync_reg_scanin),
     .so (decnt_upd_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (decnt_upd),
     .q     (decnt_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
     );

   cl_sc1_clksyncff_4x cyccnt_upd_sync_reg
   ( .si (cyccnt_upd_sync_reg_scanin),
     .so (cyccnt_upd_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (cyc_count_upd),
     .q     (cyc_count_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
     );

   cl_sc1_clksyncff_4x tcudcr_upd_sync_reg
   ( .si (tcudcr_upd_sync_reg_scanin),
     .so (tcudcr_upd_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (tcudcr_upd),
     .q     (tcudcr_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
     );

   cl_sc1_clksyncff_4x dossen_upd_sync_reg
   ( .si (dossen_upd_sync_reg_scanin),
     .so (dossen_upd_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (dossen_upd),
     .q     (dossen_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
     );

   cl_sc1_clksyncff_4x dossmode_upd_sync_reg
   ( .si (dossmode_upd_sync_reg_scanin),
     .so (dossmode_upd_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (dossmode_upd),
     .q     (dossmode_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
     );

   cl_sc1_clksyncff_4x ssreq_upd_sync_reg
   ( .si (ssreq_upd_sync_reg_scanin),
     .so (ssreq_upd_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (ssreq_upd),
     .q     (ssreq_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
     );

   cl_sc1_clksyncff_4x csmode_upd_sync_reg
   ( .si (csmode_upd_sync_reg_scanin),
     .so (csmode_upd_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (csmode_upd),
     .q     (csmode_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
     );

   // Test Protect mode to block inputs to TCU
   cl_sc1_clksyncff_4x jtagserscan_sync_reg
   ( .si (jtagserscan_sync_reg_scanin),
     .so (jtagserscan_sync_reg_scanout),
     .l1clk (l1clk),
     .d	    (jtag_ser_scan_q), // ECO yyyyyy
     .q	    (jtag_ser_scan_sync),
  .siclk(siclk),
  .soclk(soclk)
     );
   cl_sc1_clksyncff_4x testprotect_sync_reg
   ( .si (testprotect_sync_reg_scanin),
     .so (testprotect_sync_reg_scanout),
     .l1clk (l1clk),
     .d     (jtag_test_protect),
     .q     (jtag_test_protect_sync),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   test_protect    =  jtag_test_protect_sync  |  flush_test_protect;
   assign   dbr_gateoff     =  rst_tcu_dbr_gen         &  flush_test_protect;
   tcu_regs_ctl_msff_ctl_macro__en_1__width_2 testprotect_reg 
   ( .scan_in(testprotect_reg_scanin),
     .scan_out(testprotect_reg_scanout),
     .l1clk    (l1clk),
     .en       (test_protect_en),
     .din      ({test_protect,            dbr_gateoff     }), 
     .dout     ({test_protect_sync_to_io, tcu_dbr_gateoff }),
  .siclk(siclk),
  .soclk(soclk)
     );
   // block inputs when jtag scan or mbist, lbist when desired
   // or when jtag serial scan, block tcu inputs; also goes to RST, CCU, DMU, PEU
   assign   mt_mode         =  jtag_mt_enable;
   assign   test_protect_en =  cmp_io_sync_en_local & ~ac_test_mode & ~mt_mode_sync;
   assign   jtscan_off      = ~tcu_tp_sync_2io      & ~jtag_ser_scan_sync;
   assign   tcu_tp_sync_2io =  ac_test_mode         |  test_protect_sync_to_io;

   // to synchronize mt_mode, just in case
   cl_sc1_clksyncff_4x tcuregs_mtmode_syncreg (
     .si     ( tcuregs_mtmode_syncreg_scanin  ),
     .so     ( tcuregs_mtmode_syncreg_scanout ),
     .l1clk  ( l1clk                          ),
     .d      ( mt_mode                        ),
     .q      ( mt_mode_sync                   ),
  .siclk(siclk),
  .soclk(soclk));


   //********************************************************************
   // Instantiate Debug Sub-Block
   //********************************************************************
     
   tcu_dbg_ctl dbg_ctl
     (
      .jtagclkstop_ov           (jtagclkstop_ov_d),                // ECO B
      .debug_cycle_counter_stop (debug_cycle_counter_stop_to_mbc), // ECO C
      .cycle_stretch            (cycle_stretch_to_mbc),            // ECO D
      .mbist_clk_stop           (mbist_clk_stop_to_mbc),           // ECO C
      .scan_in  (tcu_dbg_ctl_scan_in),
      .scan_out (tcu_dbg_ctl_scan_out),
  .tcu_int_se(tcu_int_se),
  .tcu_int_aclk(tcu_int_aclk),
  .tcu_int_bclk(tcu_int_bclk),
  .tcu_int_ce(tcu_int_ce),
  .tcu_pce_ov(tcu_pce_ov),
  .l2clk(l2clk),
  .cmp_io_sync_en_local(cmp_io_sync_en_local),
  .io_cmp_sync_en_local(io_cmp_sync_en_local),
  .cmp_io2x_sync_en_local(cmp_io2x_sync_en_local),
  .spc_hstop_req(spc_hstop_req[7:0]),
  .spc_sstop_req(spc_sstop_req[7:0]),
  .spc_tp(spc_tp[7:0]),
  .reset_event(reset_event),
  .spc_crstat(spc_crstat[7:0]),
  .spc_crs(spc_crs[63:0]),
  .spc_ss_comp(spc_ss_comp[7:0]),
  .doss_stat(doss_stat[7:0]),
  .tcu_ss_request(tcu_ss_request[7:0]),
  .ssreq_upd_sync(ssreq_upd_sync),
  .tcu_ss_mode(tcu_ss_mode[7:0]),
  .tcu_do_mode(tcu_do_mode[7:0]),
  .dbg1_tcu_soc_hard_stop(dbg1_tcu_soc_hard_stop),
  .dbg1_tcu_soc_asrt_trigout(dbg1_tcu_soc_asrt_trigout),
  .trigout_pulse(trigout_pulse),
  .mio_tcu_trigin(mio_tcu_trigin),
  .mbist_clk_stop_req(mbist_clk_stop_req),
  .jtag_clock_start(jtag_clock_start),
  .jtscan_off(jtscan_off),
  .cyc_count(cyc_count[63:0]),
  .cyc_count_upd_sync(cyc_count_upd_sync),
  .tcudcr_data(tcudcr_data[3:0]),
  .tcudcr_upd_sync(tcudcr_upd_sync),
  .decnt_data(decnt_data[31:0]),
  .decnt_upd_sync(decnt_upd_sync),
  .core_sel(core_sel[7:0]),
  .core_sel_upd_sync(core_sel_upd_sync),
  .spc_doss_enab(spc_doss_enab[7:0]),
  .doss_mode(doss_mode[1:0]),
  .doss_enab(doss_enab[63:0]),
  .csmode(csmode),
  .csmode_upd_sync(csmode_upd_sync),
  .cs_mode(cs_mode),
  .cs_mode_active(cs_mode_active),
  .de_count(de_count[31:0]),
  .cycle_count(cycle_count[63:0]),
  .tcu_dcr(tcu_dcr[3:0]),
  .clock_domain_data(clock_domain_data[23:0]),
  .dbg_upd_clock_domain(dbg_upd_clock_domain),
  .tcu_dcr_en(tcu_dcr_en),
  .spc_ss_mode(spc_ss_mode),
  .spc_ss_sel(spc_ss_sel[7:0]),
  .dbg_creg_access(dbg_creg_access),
  .dbg_creg_addr(dbg_creg_addr[39:0]),
  .dbg_creg_data(dbg_creg_data[63:0]),
  .dbg_creg_wr_en(dbg_creg_wr_en),
  .dbg_creg_addr_en(dbg_creg_addr_en),
  .dbg_creg_data_en(dbg_creg_data_en),
  .ucb_csr_wr_sync(ucb_csr_wr_sync),
  .ucb_csr_addr(ucb_csr_addr[5:0]),
  .ucb_data_out(ucb_data_out[63:0])
      );


//============================================================
// Following is for L2 Access via SIU, using JTAG
//============================================================

// these synchronizers for L2 access via SIU
cl_sc1_clksyncff_4x tcuregs_l2dataupd_syncreg (
   .si    ( tcuregs_l2dataupd_syncreg_scanin  ),
   .so    ( tcuregs_l2dataupd_syncreg_scanout ),
   .l1clk ( l1clk                            ),
   .d     ( l2data_upd                       ),
   .q     ( l2data_upd_sync                  ),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x tcuregs_l2addrupd_syncreg (
   .si    ( tcuregs_l2addrupd_syncreg_scanin  ),
   .so    ( tcuregs_l2addrupd_syncreg_scanout ),
   .l1clk ( l1clk                            ),
   .d     ( l2addr_upd                       ),
   .q     ( l2addr_upd_sync                  ),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x tcuregs_l2vld_syncreg (
   .si    ( tcuregs_l2rti_syncreg_scanin  ),
   .so    ( tcuregs_l2rti_syncreg_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( l2rti                        ),
   .q     ( l2rti_sync                   ),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x tcuregs_l2rd_syncreg (
   .si    ( tcuregs_l2rd_syncreg_scanin  ),
   .so    ( tcuregs_l2rd_syncreg_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( instr_l2_rd                  ),
   .q     ( instr_l2_rd_sync             ),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x tcuregs_l2wr_syncreg (
   .si    ( tcuregs_l2wr_syncreg_scanin  ),
   .so    ( tcuregs_l2wr_syncreg_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( instr_l2_wr                  ),
   .q     ( instr_l2_wr_sync             ),
  .siclk(siclk),
  .soclk(soclk));


//============================================================
// L2 Write/Read Data Register - for L2 access via SIU; this is PAYLOAD
// - during l2_WRITE, it sends data to L2
// - during l2_READ, it is an input and receives data from L2
//============================================================
// Comes from shift register in JTAG, enable is synchronzed to cmp clock

tcu_regs_ctl_msff_ctl_macro__width_64 tcuregs_l2data_reg  (
   .scan_in  ( tcuregs_l2data_reg_scanin  ),
   .scan_out ( tcuregs_l2data_reg_scanout ),
   .l1clk    ( l1clk                     ),
   .din      ( next_l2data_reg[63:0]     ),
   .dout     ( l2data_reg[63:0]          ),
  .siclk(siclk),
  .soclk(soclk));

assign next_l2data_reg[63:0] = l2wrdata_shift ?
                                  {1'b0, l2data_reg[63:1]} :
                                  l2data_upd_sync ?
                                     l2access[64:1] :
                                     l2rddata_shift ?
                                        {sio_tcu_data,l2data_reg[63:1]} :
                                        l2data_reg[63:0];

assign l2rddata[63:0] = l2data_reg[63:0];

assign l2wrdata_shift = instr_l2_wr_sync & l2rti_sync & ~l2addr_shift; 
assign l2rddata_shift = instr_l2_rd_sync & (l2_read_start | sio_tcu_vld) & ~l2cnt_done;

//============================================================
// L2 Write/Read Address Register - for L2 access via SIU; this is HEADER
//============================================================
// Comes from shift register in JTAG, enable is synchronzed to cmp clock

tcu_regs_ctl_msff_ctl_macro__width_64 tcuregs_l2addr_reg  (
   .scan_in  ( tcuregs_l2addr_reg_scanin  ),
   .scan_out ( tcuregs_l2addr_reg_scanout ),
   .l1clk    ( l1clk                     ),
   .din      ( next_l2addr_reg[63:0]     ),
   .dout     ( l2addr_reg[63:0]          ),
  .siclk(siclk),
  .soclk(soclk));

assign next_l2addr_reg[63:0] = l2addr_shift ?
                               {1'b0, l2addr_reg[63:1]} :
                                  l2addr_upd_sync ?
                                     l2access[64:1] :
                                     l2addr_reg[63:0];

assign tcu_sii_data_din = l2wrdata_shift ?
                             l2data_reg[0] :
                             l2addr_shift ?
                                l2addr_reg[0] :
                                1'b0;

tcu_regs_ctl_msff_ctl_macro__width_1 tcuregs_tcu_sii_data_reg  (
   .scan_in  ( tcuregs_tcu_sii_data_reg_scanin  ),
   .scan_out ( tcuregs_tcu_sii_data_reg_scanout ),
   .l1clk    ( l1clk                           ),
   .din      ( tcu_sii_data_din                ),
   .dout     ( tcu_sii_data                    ),
  .siclk(siclk),
  .soclk(soclk));


assign l2addr_shift = (instr_l2_wr_sync | instr_l2_rd_sync) & l2rti_sync & ~l2cnt[6];

//============================================================
// L2 Access - Generate VALID pulse & catch sio_tcu_vld for L2 Read 
//============================================================
tcu_regs_ctl_msff_ctl_macro__width_1 tcuregs_l2rti_reg  (
   .scan_in  ( tcuregs_l2rti_reg_scanin  ),
   .scan_out ( tcuregs_l2rti_reg_scanout ),
   .l1clk    ( l1clk                    ),
   .din      ( l2rti_sync               ),
   .dout     ( l2rti_dly                ),
  .siclk(siclk),
  .soclk(soclk));

assign tcu_sii_vld_din = (l2rti_sync & ~l2rti_dly & (instr_l2_wr_sync | instr_l2_rd_sync)) 
                             | (instr_l2_wr_sync & (l2cnt[6:0] == 7'b1000000));

tcu_regs_ctl_msff_ctl_macro__width_1 tcuregs_tcu_sii_vld_reg  (
   .scan_in  ( tcuregs_tcu_sii_vld_reg_scanin  ),
   .scan_out ( tcuregs_tcu_sii_vld_reg_scanout ),
   .l1clk    ( l1clk                          ),
   .din      ( tcu_sii_vld_din                ),
   .dout     ( tcu_sii_vld                    ),
  .siclk(siclk),
  .soclk(soclk));


tcu_regs_ctl_msff_ctl_macro__clr__1__en_1__width_1 tcuregs_l2siovld_reg  (
   .scan_in  ( tcuregs_l2siovld_reg_scanin  ),
   .scan_out ( tcuregs_l2siovld_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .en       ( sio_tcu_vld                 ),
   .clr_     ( instr_l2_rd_sync            ),
   .din      ( instr_l2_rd_sync            ),    //(l2rti_dly),
   .dout     ( l2_read_start               ),
  .siclk(siclk),
  .soclk(soclk));

//============================================================
// L2 Access - Counter to track number of shifts
//============================================================
tcu_regs_ctl_msff_ctl_macro__clr__1__width_7 tcuregs_l2cntr_reg  (
   .scan_in  ( tcuregs_l2cntr_reg_scanin  ),
   .scan_out ( tcuregs_l2cntr_reg_scanout ),
   .l1clk    ( l1clk                     ),
   .clr_     ( l2cnt_clr_                ),
   .din      ( new_l2cnt[6:0]            ),
   .dout     ( l2cnt[6:0]                ),
  .siclk(siclk),
  .soclk(soclk));

assign new_l2cnt[6:0] = l2cnt_en ? (l2cnt[6:0] + 7'b0000001) : l2cnt[6:0];
assign l2cnt_clr_ = (instr_l2_wr_sync | instr_l2_rd_sync);
assign l2cnt_en   = (instr_l2_wr_sync & l2rti_sync & ~l2cnt_done) | (l2rddata_shift);
                      //| (instr_l2_rd & l2rti_sync & l2rddata_shift);
assign l2cnt_max = &l2cnt[6:0];
assign l2cnt_done = (instr_l2_rd_sync & l2cnt[6]) | (instr_l2_wr_sync & l2cnt_max);
assign l2_read_vld = instr_l2_rd_sync & l2cnt_done;

// ----------------------------------------------------------------------
// Removed for ECO to make flops visible in SunV
//spare_ctl_macro spare (num=9) (
//   .l1clk    ( l1clk         ),
//   .scan_in  ( spare_scanin  ),
//   .scan_out ( spare_scanout ));
 
// Added for ECO to make flops visible

// - this is an expansion of spare_ctl_macro with just the gates
tcu_regs_ctl_spare_ctl_macro__flops_0__num_9 spare_gates  (
);

tcu_regs_ctl_msff_ctl_macro__scanreverse_1__width_9 spare_flops  (
   .scan_in(spare_flops_scanin),
   .scan_out(spare_flops_scanout),
   .l1clk(l1clk),
   .din  (spare_flops_d[8:0]),
   .dout (spare_flops_q[8:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign   spare_flops_d[8]         =  1'b0;
assign   spare_flops_d[7]         =  1'b0;
assign   spare_flops_d[6]         =  spare6_flop_d;
assign   spare_flops_d[5]         =  1'b0;
assign   spare_flops_d[4]         =  spare4_flop_d;
assign   spare_flops_d[3]         =  1'b0;
assign   spare_flops_d[2]         =  1'b0;
assign   spare_flops_d[1]         =  1'b0;
assign   spare_flops_d[0]         =  1'b0;

assign   spare_flops_unused[8]    =  spare_flops_q[8];  
assign   spare_flops_unused[7]    =  spare_flops_q[7];  
assign   spare6_flop_q            =  spare_flops_q[6];  
assign   spare_flops_unused[5]    =  spare_flops_q[5];  
assign   spare4_flop_q            =  spare_flops_q[4];  
assign   spare_flops_unused[3]    =  spare_flops_q[3];  
assign   spare_flops_unused[2]    =  spare_flops_q[2];  
assign   spare_flops_unused[1]    =  spare_flops_q[1];  
assign   spare_flops_unused[0]    =  spare_flops_q[0];  

assign   spare4_flop_d          =  tcu_int_ce_to_ucb; // ECO A
assign   tcu_int_ce_ucb         =  spare4_flop_q  &  ~ac_test_mode; // ECO A

assign   spare6_flop_d          =  jtagclkstop_ov_d;  // ECO B
assign   jtagclkstop_ov         =  spare6_flop_q;     // ECO B

// ----------------------------------------------------------------------

// fixscan start:
assign tcuregs_ttcounter_reg_scanin       = scan_in                  ;
assign tcuregs_ttstart_reg_scanin      = tcuregs_ttcounter_reg_scanout;
assign tcuregs_cmpiosync_reg_scanin    = tcuregs_ttstart_reg_scanout; //tcuregs_ttcounter_reg_scanout;
assign ucb_csr_wr_sync_reg_scanin      = tcuregs_cmpiosync_reg_scanout;
assign ff_debug_event_hard_stop_scanin = ucb_csr_wr_sync_reg_scanout;
assign rstend_reg_scanin               = ff_debug_event_hard_stop_scanout;
assign spc_hs_req_stg_reg_scanin       = rstend_reg_scanout;
assign spchsreq_reg_scanin             = spc_hs_req_stg_reg_scanout;
assign tcu_dbg_ctl_scan_in             = spchsreq_reg_scanout;
assign dossen_reg_scanin               = tcu_dbg_ctl_scan_out;
assign dossmode_reg_scanin             = dossen_reg_scanout;
assign spc_ss_complete_stg_reg_scanin  = dossmode_reg_scanout;
assign spcsscomp_reg_scanin            = spc_ss_complete_stg_reg_scanout;
assign spc_ss_req_stg_reg_scanin       = spcsscomp_reg_scanout;
assign spcssreq_reg_scanin             = spc_ss_req_stg_reg_scanout;
assign spcrstat_reg_scanin             = spcssreq_reg_scanout;
assign spc_tp_req_stg_reg_scanin       = spcrstat_reg_scanout;
assign spctp_reg_scanin                = spc_tp_req_stg_reg_scanout;
assign clkdomain_upd_sync_reg_scanin   = spctp_reg_scanout;
assign coresel_upd_sync_reg_scanin     = clkdomain_upd_sync_reg_scanout;
assign decnt_upd_sync_reg_scanin       = coresel_upd_sync_reg_scanout;
assign cyccnt_upd_sync_reg_scanin      = decnt_upd_sync_reg_scanout;
assign tcudcr_upd_sync_reg_scanin      = cyccnt_upd_sync_reg_scanout;
assign dossen_upd_sync_reg_scanin      = tcudcr_upd_sync_reg_scanout;
assign dossmode_upd_sync_reg_scanin    = dossen_upd_sync_reg_scanout;
assign ssreq_upd_sync_reg_scanin       = dossmode_upd_sync_reg_scanout;
assign csmode_upd_sync_reg_scanin      = ssreq_upd_sync_reg_scanout;
assign jtagserscan_sync_reg_scanin     = csmode_upd_sync_reg_scanout;
assign testprotect_sync_reg_scanin     = jtagserscan_sync_reg_scanout;
assign testprotect_reg_scanin          = testprotect_sync_reg_scanout;
assign tcuregs_mtmode_syncreg_scanin   = testprotect_reg_scanout;
assign tcuregs_l2dataupd_syncreg_scanin = tcuregs_mtmode_syncreg_scanout;
assign tcuregs_l2addrupd_syncreg_scanin = tcuregs_l2dataupd_syncreg_scanout;
assign tcuregs_l2rti_syncreg_scanin     = tcuregs_l2addrupd_syncreg_scanout;
assign tcuregs_l2rd_syncreg_scanin      = tcuregs_l2rti_syncreg_scanout;
assign tcuregs_l2wr_syncreg_scanin      = tcuregs_l2rd_syncreg_scanout;
assign tcuregs_l2data_reg_scanin        = tcuregs_l2wr_syncreg_scanout;
assign tcuregs_l2addr_reg_scanin        = tcuregs_l2data_reg_scanout;
assign tcuregs_tcu_sii_data_reg_scanin  = tcuregs_l2addr_reg_scanout;
assign tcuregs_l2rti_reg_scanin         = tcuregs_tcu_sii_data_reg_scanout;
assign tcuregs_tcu_sii_vld_reg_scanin   = tcuregs_l2rti_reg_scanout;
assign tcuregs_l2siovld_reg_scanin      = tcuregs_tcu_sii_vld_reg_scanout;
assign tcuregs_l2cntr_reg_scanin        = tcuregs_l2siovld_reg_scanout;
assign spare_flops_scanin               = tcuregs_l2cntr_reg_scanout;
assign scan_out                         = spare_flops_scanout;
// fixscan end:

endmodule






// any PARAMS parms go into naming of macro

module tcu_regs_ctl_l1clkhdr_ctl_macro (
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

module tcu_regs_ctl_msff_ctl_macro__width_3 (
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

module tcu_regs_ctl_msff_ctl_macro__en_1__width_1 (
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

module tcu_regs_ctl_msff_ctl_macro__en_1__width_8 (
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

module tcu_regs_ctl_msff_ctl_macro__width_1 (
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

module tcu_regs_ctl_msff_ctl_macro__width_24 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = din[23:0];






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_regs_ctl_msff_ctl_macro__clr_1__en_1__width_2 (
  din, 
  en, 
  clr, 
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
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}} & ~{2{clr}}) | (dout[1:0] & ~{2{en}} & ~{2{clr}});






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

module tcu_regs_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






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

module tcu_regs_ctl_msff_ctl_macro__clr_1__en_1__width_8 (
  din, 
  en, 
  clr, 
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
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}} & ~{8{clr}}) | (dout[7:0] & ~{8{en}} & ~{8{clr}});






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

module tcu_regs_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






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

module tcu_regs_ctl_msff_ctl_macro__en_1__width_2 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});






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

module tcu_regs_ctl_msff_ctl_macro__en_1__width_64 (
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

module tcu_regs_ctl_msff_ctl_macro__width_4 (
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

module tcu_regs_ctl_msff_ctl_macro__width_32 (
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

module tcu_regs_ctl_msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});






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

module tcu_regs_ctl_msff_ctl_macro__width_8 (
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

module tcu_regs_ctl_msff_ctl_macro__clr__1__en_1__width_8 (
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

module tcu_regs_ctl_msff_ctl_macro__clr__1__en_1__width_1 (
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

module tcu_regs_ctl_msff_ctl_macro__clr__1__width_7 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0] & ~{7{(~clr_)}};






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module tcu_regs_ctl_spare_ctl_macro__flops_0__num_9;
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



endmodule






// any PARAMS parms go into naming of macro

module tcu_regs_ctl_msff_ctl_macro__scanreverse_1__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [0:7] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({so[0:7],scan_in}),
.so({scan_out,so[0:7]}),
.q(dout[8:0])
);












endmodule








