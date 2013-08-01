// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_dbg_ctl.v
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
module tcu_dbg_ctl (
  scan_in, 
  tcu_int_se, 
  tcu_int_aclk, 
  tcu_int_bclk, 
  tcu_int_ce, 
  tcu_pce_ov, 
  l2clk, 
  scan_out, 
  cmp_io_sync_en_local, 
  io_cmp_sync_en_local, 
  cmp_io2x_sync_en_local, 
  spc_hstop_req, 
  spc_sstop_req, 
  spc_tp, 
  reset_event, 
  spc_crstat, 
  spc_crs, 
  spc_ss_comp, 
  doss_stat, 
  tcu_ss_request, 
  ssreq_upd_sync, 
  tcu_ss_mode, 
  tcu_do_mode, 
  dbg1_tcu_soc_hard_stop, 
  dbg1_tcu_soc_asrt_trigout, 
  trigout_pulse, 
  mio_tcu_trigin, 
  cycle_stretch, 
  mbist_clk_stop_req, 
  mbist_clk_stop, 
  jtag_clock_start, 
  jtscan_off, 
  cyc_count, 
  cyc_count_upd_sync, 
  tcudcr_data, 
  tcudcr_upd_sync, 
  decnt_data, 
  decnt_upd_sync, 
  core_sel, 
  core_sel_upd_sync, 
  spc_doss_enab, 
  doss_mode, 
  doss_enab, 
  csmode, 
  csmode_upd_sync, 
  cs_mode, 
  cs_mode_active, 
  jtagclkstop_ov, 
  de_count, 
  cycle_count, 
  tcu_dcr, 
  debug_cycle_counter_stop, 
  clock_domain_data, 
  dbg_upd_clock_domain, 
  tcu_dcr_en, 
  spc_ss_mode, 
  spc_ss_sel, 
  dbg_creg_access, 
  dbg_creg_addr, 
  dbg_creg_data, 
  dbg_creg_wr_en, 
  dbg_creg_addr_en, 
  dbg_creg_data_en, 
  ucb_csr_wr_sync, 
  ucb_csr_addr, 
  ucb_data_out);
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire ucb_sel_cycle_count;
wire ucb_sel_dcr;
wire ucb_sel_trigout;
wire ucb_sel_dec;
wire ucb_wr_cycle_count;
wire ucb_wr_dcr;
wire ucb_wr_trigout;
wire ucb_wr_dec;
wire dbg_cyccnt_reg_scanin;
wire dbg_cyccnt_reg_scanout;
wire [63:0] next_cycle_count;
wire cycle_count_dec;
wire xxxrst_count_dec;
wire cycxxx_count_dec;
wire [63:0] cycxxx_count;
wire cycle_count_begin;
wire de_count_stop;
wire dbg_evnt_hld;
wire do_mode_active;
wire cycle_count_stop;
wire cycrst_count_beg;
wire reset_count_stop;
wire dbg_tcudcr_reg_scanin;
wire dbg_tcudcr_reg_scanout;
wire [3:0] next_tcu_dcr;
wire sstop_all_spcs;
wire dbg_decnt_reg_scanin;
wire dbg_decnt_reg_scanout;
wire [31:0] next_de_count;
wire de_count_dec;
wire de_count_begin;
wire dbg_event_active;
wire soc_hs_active;
wire soc_hard_stop;
wire trigin_sync;
wire spc_hs_active;
wire spc_ss_active;
wire spc_tp_active;
wire dbg1_tcu_soc_asrt_trigout_sync;
wire dbg_eventhold_reg_scanin;
wire dbg_eventhold_reg_scanout;
wire evnt_hld_en;
wire [3:0] dbg_event;
wire [3:0] dbg_event_hold;
wire jtag_clock_start_sync;
wire soc_hs_hold;
wire spc_tp_hold;
wire spc_hs_hold;
wire spc_ss_hold;
wire dbg_sshold_reg_scanin;
wire dbg_sshold_reg_scanout;
wire ss_evnt_hld_en;
wire [7:0] spc_sstop_din;
wire [7:0] ss_hold;
wire ss_hold_active;
wire [7:0] spc_sstop_qual;
wire [7:0] spc_clk_dom;
wire cntrs_stopped;
wire crstat_ss_vld;
wire tcu_dcr_one;
wire tcu_dcr_three;
wire tcu_dcr_two;
wire rst_evnt_trigger;
wire rst_evnt_trigger_2nd;
wire dbg_trigout_reg_scanin;
wire dbg_trigout_reg_scanout;
wire trigout;
wire trigout_q;
wire trigout2;
wire trigout2_q;
wire trigout_qq;
wire trigout2_qq;
wire [63:0] core_run;
wire [63:0] do_core_run;
wire dbg_creg_access_din;
wire dbg_creg_ad_enab;
wire dbg_creg_wr_enab;
wire dbg_cregreq_reg_scanin;
wire dbg_cregreq_reg_scanout;
wire dbg_creg_ad_enab_q;
wire dbg_creg_wr_enab_q;
wire dbg_cregreqb_reg_scanin;
wire dbg_cregreqb_reg_scanout;
wire dbg_creg_ad_enab_qq;
wire dbg_creg_wr_enab_qq;
wire dbg_creg_access_reg_scanin;
wire dbg_creg_access_reg_scanout;
wire [63:0] do_park;
wire [7:0] spc_dolap_enab;
wire [63:0] do_unpark;
wire ss_mode_active;
wire [7:0] spc_sstep_enab;
wire [7:0] singstep_mode;
wire dbg_ssupd_reg_scanin;
wire dbg_ssupd_reg_scanout;
wire ss_request;
wire ss_request_pulse;
wire [7:0] singstep_request;
wire dbg_ssmode_reg_scanin;
wire dbg_ssmode_reg_scanout;
wire dbg_ssreq_reg_scanin;
wire dbg_ssreq_reg_scanout;
wire [7:0] disbolap_mode;
wire dbg_domode_reg_scanin;
wire dbg_domode_reg_scanout;
wire dbg_cstep_reg_scanin;
wire dbg_cstep_reg_scanout;
wire next_cs_mode;
wire dbg_sochs_sync_reg_scanin;
wire dbg_sochs_sync_reg_scanout;
wire sochs_en;
wire dbg_trigreq_sync_reg_scanin;
wire dbg_trigreq_sync_reg_scanout;
wire trigreq_en;
wire dbg_trigin_sync_reg_scanin;
wire dbg_trigin_sync_reg_scanout;
wire mio_tcu_trigin_mission;
wire dbg_clkst_sync_reg_scanin;
wire dbg_clkst_sync_reg_scanout;

    
   // Scan Control
   input 	 scan_in;
   input         tcu_int_se;
   input         tcu_int_aclk;
   input 	 tcu_int_bclk;
   input         tcu_int_ce;
   input         tcu_pce_ov;
   input 	 l2clk;
   output 	 scan_out;
   // Synchronizer
   input 	 cmp_io_sync_en_local;
   input 	 io_cmp_sync_en_local;
   input         cmp_io2x_sync_en_local;

   // Debug Event Requests from SPC Cores
   input [7:0]	 spc_hstop_req;
   input [7:0] 	 spc_sstop_req;
   input [7:0] 	 spc_tp;
   // End of POR as a Debug Event Request
   input         reset_event;

   // Core_running Status
   input [7:0] 	 spc_crstat;
   input [63:0]  spc_crs;
   input [7:0] 	 spc_ss_comp; // single-step complete

   // Disable Overlap & Single-Step
   output [7:0]	 doss_stat;      // to jtag
   output [7:0]  tcu_ss_request;
   input 	 ssreq_upd_sync; // from jtag
   output [7:0]  tcu_ss_mode;    // single-step
   output [7:0]  tcu_do_mode;    // Disable Overlap
   
   // Hard Stop from SOC
   input 	 dbg1_tcu_soc_hard_stop;
   
   // Watchpoint Trigger
   input 	 dbg1_tcu_soc_asrt_trigout;
   output 	 trigout_pulse;  // to TRIGOUT package pin

   // Trigger Input from Pin
   input         mio_tcu_trigin;

   // Cycle stretch
   output        cycle_stretch;

   // MBIST Clock Stop
   input         mbist_clk_stop_req;
   output        mbist_clk_stop;

   // From JTAG
   input 	 jtag_clock_start;
   
   input         jtscan_off;
   input [63:0]  cyc_count;
   input 	 cyc_count_upd_sync;
   input [3:0] 	 tcudcr_data;
   input 	 tcudcr_upd_sync;
   input [31:0]  decnt_data;
   input 	 decnt_upd_sync;
   input [7:0] 	 core_sel;
   input 	 core_sel_upd_sync;
   
   input [7:0] 	 spc_doss_enab;
   input [1:0] 	 doss_mode;
   input [63:0]  doss_enab;

   input 	 csmode;
   input 	 csmode_upd_sync;
   output 	 cs_mode;
   output 	 cs_mode_active;
   output        jtagclkstop_ov;

   // To JTAG
   output [31:0] de_count;
   output [63:0] cycle_count;
   output [3:0]  tcu_dcr;

   // To Clock Sequencer
   output 	 debug_cycle_counter_stop;
   output [23:0] clock_domain_data;
   output        dbg_upd_clock_domain;
   output 	 tcu_dcr_en; // bit[2]
   output 	 spc_ss_mode; // soft-stop
   output [7:0]  spc_ss_sel;

   // To UCB Control
   output 	 dbg_creg_access;  
   output [39:0] dbg_creg_addr;    
   output [63:0] dbg_creg_data;    
   output 	 dbg_creg_wr_en;   
   output 	 dbg_creg_addr_en; 
   output 	 dbg_creg_data_en;

	// CSR (mbist_ctl)
   input         ucb_csr_wr_sync;
   input [5:0]   ucb_csr_addr;
   input [63:0]  ucb_data_out;

   // Scan reassigns
   assign 	 l1en   = tcu_int_ce; // 1'b1; 
   assign 	 pce_ov = tcu_pce_ov; // 1'b1; 
   assign 	 stop   = 1'b0;
   assign 	 se     = tcu_int_se;
   assign 	 siclk  = tcu_int_aclk;
   assign 	 soclk  = tcu_int_bclk;   
   // clock header
   tcu_dbg_ctl_l1clkhdr_ctl_macro dbgctl_clkgen 
     (
      .l2clk  (l2clk   ),
      .l1clk  (l1clk   ),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
      );

   assign ucb_sel_cycle_count = (ucb_csr_addr == 6'h20);
   assign ucb_sel_dcr         = (ucb_csr_addr == 6'h21);
   assign ucb_sel_trigout     = (ucb_csr_addr == 6'h22);
   assign ucb_sel_dec         = (ucb_csr_addr == 6'h23);

   assign ucb_wr_cycle_count = ucb_csr_wr_sync && ucb_sel_cycle_count;
   assign ucb_wr_dcr         = ucb_csr_wr_sync && ucb_sel_dcr;
   assign ucb_wr_trigout     = ucb_csr_wr_sync && ucb_sel_trigout;
   assign ucb_wr_dec         = ucb_csr_wr_sync && ucb_sel_dec;

   //// Synchronizer Pulse from cluster header
   //   msff_ctl_macro dbg_cmpiosync_reg (width=3)
   //( 
   //  .scan_in(dbg_cmpiosync_reg_scanin),
   //  .scan_out(dbg_cmpiosync_reg_scanout),
   //  .l1clk    (l1clk),
   //  .din      ({cmp_io_sync_en,       io_cmp_sync_en,       cmp_io2x_sync_en}), 
   //  .dout     ({cmp_io_sync_en_local, io_cmp_sync_en_local, cmp_io2x_sync_en_local})
   //  );
   
   //********************************************************************
   // Cycle Counter
   //********************************************************************
   // 64-bit for non-reset event; tcu_dcr[2]==1 ==> 2 32-bit counters
   //  where upper word is cycle counter, lower word is reset counter
   // When tcu_dcr[2]==0, cycle counter waits until debug events counter
   //  reaches zero
   
   tcu_dbg_ctl_msff_ctl_macro__width_64 dbg_cyccnt_reg 
   ( 
     .scan_in(dbg_cyccnt_reg_scanin),
     .scan_out(dbg_cyccnt_reg_scanout),
     .l1clk    (l1clk),
     .din      (next_cycle_count[63:0]), 
     .dout     (cycle_count[63:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   next_cycle_count[63:0] =  cycle_count_dec    ? (cycle_count[63:0] - 64'b1)
                                   :  xxxrst_count_dec   ? (cycle_count[63:0] - 64'b1)
                                   :  cycxxx_count_dec   ?  cycxxx_count[63:0]
                                   :  cyc_count_upd_sync ?  cyc_count[63:0]
                                   :  ucb_wr_cycle_count ?  ucb_data_out[63:0]
                                   :  cycle_count[63:0];

   assign   cycle_count_begin = ~tcu_dcr_en        
                              & ((de_count_stop    &  dbg_evnt_hld)   | do_mode_active | cs_mode 
                                                                      | mbist_clk_stop_req);
   assign   cycle_count_dec   =  cycle_count_begin & ~cycle_count_stop;
   assign   cycle_count_stop  = (cycle_count[63:0] == 64'b0);

   assign   cycrst_count_beg  =  tcu_dcr_en        &  reset_event;
   assign   xxxrst_count_dec  =  cycrst_count_beg  & ~reset_count_stop;
   assign   cycxxx_count_dec  =  cycrst_count_beg  &  reset_count_stop & ~cycle_count_stop;
   assign   reset_count_stop  = (cycle_count[31:0] == 32'b0);

   assign   cycxxx_count[63:0] = (cycle_count[63:0] - 64'b1) & 64'hFFFFFFFF00000000;
   //assign   cc_gt_f            = |cycle_count[63:4];

   //********************************************************************
   // TCU DCR: Debug event Control Register
   //********************************************************************
   // 4 bits; [2] makes Cycle Counter operate as Cycle[63:32]/Reset[31:0]
   // Counter and enables End-of-POR-Sequence as a debug event
   // bit[3] enables all spc's to be softstopped if any requests a sstop
   
   tcu_dbg_ctl_msff_ctl_macro__width_4 dbg_tcudcr_reg 
   ( 
     .scan_in(dbg_tcudcr_reg_scanin),
     .scan_out(dbg_tcudcr_reg_scanout),
     .l1clk    (l1clk),
     .din      (next_tcu_dcr[3:0]), 
     .dout     (tcu_dcr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   next_tcu_dcr[3:0] = tcudcr_upd_sync ? tcudcr_data[3:0]
                              : ucb_wr_dcr      ? ucb_data_out[3:0]
                              : tcu_dcr[3:0];

   assign   tcu_dcr_en     = tcu_dcr[2];
   assign   sstop_all_spcs = tcu_dcr[3] & ~tcu_dcr[2];
   
   //********************************************************************
   // Debug Events Counter
   //********************************************************************
   // Counts Debug Events: decrements until zero
   // enabled if tcu_dcr[2]=0
   
   tcu_dbg_ctl_msff_ctl_macro__width_32 dbg_decnt_reg 
   ( 
     .scan_in(dbg_decnt_reg_scanin),
     .scan_out(dbg_decnt_reg_scanout),
     .l1clk    (l1clk),
     .din      (next_de_count[31:0]), 
     .dout     (de_count[31:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   next_de_count[31:0] =  de_count_dec ? (de_count[31:0] - 32'b1)
                                :  decnt_upd_sync ? decnt_data[31:0]
                                :  ucb_wr_dec ? ucb_data_out[31:0]
                                :  de_count[31:0];
   
   // counter stops after reaching 0
   assign   de_count_dec   =  (de_count_begin & dbg_event_active) 
            	           & ~(de_count_stop);

   assign   de_count_begin = ~tcu_dcr_en;
   assign   de_count_stop  = (de_count[31:0] == 32'b0)  |  tcu_dcr_en;
   
   //********************************************************************
   // Detect Edge of Any Debug Request and Hold the Request (from spc/soc)
   //********************************************************************
   // Only after all debug events have been counted per de_counter
   assign   soc_hs_active            =  soc_hard_stop      |  trigin_sync;
   assign   spc_hs_active            = |spc_hstop_req[7:0];
   assign   spc_ss_active            = |spc_sstop_req[7:0];
   assign   spc_tp_active            = |spc_tp[7:0] | dbg1_tcu_soc_asrt_trigout_sync;

   tcu_dbg_ctl_msff_ctl_macro__en_1__width_4 dbg_eventhold_reg 
   ( 
     .scan_in(dbg_eventhold_reg_scanin),
     .scan_out(dbg_eventhold_reg_scanout),
     .l1clk    (l1clk),
     .en       (evnt_hld_en),
     .din      (dbg_event[3:0]), 
     .dout     (dbg_event_hold[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   dbg_event[3:0]   = {soc_hs_active,spc_tp_active,spc_hs_active,spc_ss_active};
   assign   dbg_evnt_hld     = |dbg_event_hold[3:0];
   assign   evnt_hld_en      = (de_count_stop & ~dbg_evnt_hld) | jtag_clock_start_sync;

   assign   soc_hs_hold      =  dbg_event_hold[3];
   assign   spc_tp_hold      =  dbg_event_hold[2];
   assign   spc_hs_hold      =  dbg_event_hold[1];
   assign   spc_ss_hold      =  dbg_event_hold[0];
   assign   dbg_event_active = |dbg_event[3:0];

   //********************************************************************
   // Detect Edge of Soft Stop Debug Request and Hold It 
   //********************************************************************
   // This doubles as core select reg for JTAG

   tcu_dbg_ctl_msff_ctl_macro__en_1__width_8 dbg_sshold_reg 
   ( 
     .scan_in(dbg_sshold_reg_scanin),
     .scan_out(dbg_sshold_reg_scanout),
     .l1clk    (l1clk),
     .en       (ss_evnt_hld_en),
     .din      (spc_sstop_din[7:0]), 
     .dout     (ss_hold[7:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   ss_hold_active     = ~(|ss_hold[7:0]) & de_count_stop;
   assign   ss_evnt_hld_en     = (ss_hold_active | core_sel_upd_sync) | jtag_clock_start_sync;
   assign   spc_sstop_qual[7:0]= {8{sstop_all_spcs & spc_ss_active}}  |  spc_sstop_req[7:0];
   assign   spc_sstop_din[7:0] =  core_sel_upd_sync ? core_sel[7:0] : spc_sstop_qual[7:0]; 
 //assign   spc_sstop_din[7:0] =  core_sel_upd_sync ? core_sel[7:0] : spc_sstop_req[7:0]; 
   
   //********************************************************************
   // Interface to Clock Sequencer
   //********************************************************************

   // Soft Stop - only stop clocks to target SPC cores
   // Start with SPC0 
   assign   spc_ss_mode              =  spc_ss_hold;
   assign   spc_ss_sel[7:0]          =  ss_hold[7:0];

   // Hard Stop - stop all clocks, start with target SPC core or SOC0
   assign   clock_domain_data[23:8]  =  soc_hs_active ? 16'b1  :  16'b0;
   assign   spc_clk_dom[7:0]         =  spc_hs_active ? spc_hstop_req[7:0]
                                     :  spc_ss_active ? 8'b1 // start w/spc0
                                     :  8'b0;
    
   assign   clock_domain_data[7:0]   =  spc_clk_dom[7:0];
   
   assign   dbg_upd_clock_domain     = ~tcu_dcr_en    &  evnt_hld_en 
                                     & (soc_hs_active | spc_hs_active | spc_ss_active); 
   //assign   dbg_upd_clock_domain     = ~tcu_dcr_en    & dbg_evnt_hld;
   assign   cntrs_stopped            =  de_count_stop & cycle_count_stop & ~tcu_dcr_en;
   
   assign   debug_cycle_counter_stop =  cntrs_stopped  & ( spc_hs_hold | soc_hs_hold
                                        | (spc_ss_hold & crstat_ss_vld))
                                     | (reset_count_stop
                                        & reset_event & tcu_dcr_one)
                                     | (cycle_count_stop 
                                        & reset_event & tcu_dcr_three) ;

   assign   mbist_clk_stop           =  cycle_count_stop & ~tcu_dcr_en &  mbist_clk_stop_req;

   //********************************************************************
   // End of Reset Sequence as an Event
   //********************************************************************
   assign   tcu_dcr_one              =  tcu_dcr[2:0]==3'b101;
   assign   tcu_dcr_two              =  tcu_dcr[2:0]==3'b110;
   assign   tcu_dcr_three            = &tcu_dcr[2:0];
  
   assign   rst_evnt_trigger         =  reset_count_stop & tcu_dcr_en   &  reset_event; 
   assign   rst_evnt_trigger_2nd     =  cycle_count_stop & tcu_dcr_three &  reset_event;
   assign   cycle_stretch            =  reset_count_stop & (tcu_dcr_two | tcu_dcr_three) & reset_event;

   //********************************************************************
   // Trigger Pulse
   //********************************************************************
   // Send pulse to TRIGOUT package pin, in io_clk domain
   
   tcu_dbg_ctl_msff_ctl_macro__en_1__width_4 dbg_trigout_reg 
   ( 
     .scan_in(dbg_trigout_reg_scanin),
     .scan_out(dbg_trigout_reg_scanout),
     .l1clk    (l1clk),
     .en       (cmp_io2x_sync_en_local),
     .din      ({trigout,  trigout_q,   trigout2,   trigout2_q }), 
     .dout     ({trigout_q,trigout_qq,  trigout2_q, trigout2_qq}),
  .siclk(siclk),
  .soclk(soclk)
     );

   assign   trigout             = ucb_wr_trigout | rst_evnt_trigger | (cntrs_stopped  &  spc_tp_hold);
                                //|  dbg1_tcu_soc_asrt_trigout_sync;
   assign   trigout2            =  rst_evnt_trigger_2nd;
   assign   trigout_pulse       = (trigout_q        & ~trigout_qq) |
                                  (trigout2_q       & ~trigout2_qq);
   
   //********************************************************************
   // Core Parking and Run Status Detection
   //********************************************************************
   // Send request to NCU to park targeted SPC Core(s) for Soft-stop or Disable Overlap

   // Generate data for parking cores for soft stop
   assign   core_run[7:0]   = ~ss_hold[0]  ?    spc_crs[7:0]   : 8'b0;
   assign   core_run[15:8]  = ~ss_hold[1]  ?    spc_crs[15:8]  : 8'b0;
   assign   core_run[23:16] = ~ss_hold[2]  ?    spc_crs[23:16] : 8'b0;
   assign   core_run[31:24] = ~ss_hold[3]  ?    spc_crs[31:24] : 8'b0;
   assign   core_run[39:32] = ~ss_hold[4]  ?    spc_crs[39:32] : 8'b0;
   assign   core_run[47:40] = ~ss_hold[5]  ?    spc_crs[47:40] : 8'b0;
   assign   core_run[55:48] = ~ss_hold[6]  ?    spc_crs[55:48] : 8'b0;
   assign   core_run[63:56] = ~ss_hold[7]  ?    spc_crs[63:56] : 8'b0;

   // Generate Core Run Address & Data to send over UCB to NCU; this is to
   //  park cores that should be soft-stopped
   assign   dbg_creg_data[63:0] =  spc_ss_hold ?  core_run[63:0]  :  do_core_run[63:0];
   assign   dbg_creg_addr[39:0] =  40'h9001040050;

   // Tells ucb to use dbg signals instead of jtag signals
   assign   dbg_creg_access_din     = (spc_ss_hold & ~tcu_dcr_en)   |  do_mode_active;
   
   // Send addr/data 'enables' to ucb as one pulse synch'd to io clk domain
   assign   dbg_creg_ad_enab    = (spc_ss_hold & ~tcu_dcr_en)   | (do_mode_active & cycle_count_dec); // & ~cc_gt_f);
   assign   dbg_creg_wr_enab    = (spc_ss_hold & cntrs_stopped) | (do_mode_active & cycle_count_dec); // & ~cc_gt_f);
   
   tcu_dbg_ctl_msff_ctl_macro__en_1__width_2 dbg_cregreq_reg 
   ( 
     .scan_in(dbg_cregreq_reg_scanin),
     .scan_out(dbg_cregreq_reg_scanout),
     .l1clk    (l1clk),
     .en       (cmp_io_sync_en_local),
     .din      ({dbg_creg_ad_enab,dbg_creg_wr_enab}), 
     .dout     ({dbg_creg_ad_enab_q,dbg_creg_wr_enab_q}),
  .siclk(siclk),
  .soclk(soclk)
     );
   tcu_dbg_ctl_msff_ctl_macro__en_1__width_2 dbg_cregreqb_reg 
   ( 
     .scan_in(dbg_cregreqb_reg_scanin),
     .scan_out(dbg_cregreqb_reg_scanout),
     .l1clk    (l1clk),
     .en       (cmp_io_sync_en_local),
     .din      ({dbg_creg_ad_enab_q,dbg_creg_wr_enab_q}), 
     .dout     ({dbg_creg_ad_enab_qq,dbg_creg_wr_enab_qq}),
  .siclk(siclk),
  .soclk(soclk)
     );

   tcu_dbg_ctl_msff_ctl_macro__en_1__width_1 dbg_creg_access_reg  ( 
      .scan_in  ( dbg_creg_access_reg_scanin  ),
      .scan_out ( dbg_creg_access_reg_scanout ),
      .l1clk    ( l1clk                       ),
      .en       ( cmp_io_sync_en_local        ),
      .din      ( dbg_creg_access_din         ),
      .dout     ( dbg_creg_access             ),
  .siclk(siclk),
  .soclk(soclk));

   assign   dbg_creg_data_en    =   dbg_creg_ad_enab_q   & ~dbg_creg_ad_enab_qq
                                | (~dbg_creg_ad_enab_q   &  dbg_creg_ad_enab_qq  & do_mode_active);
   assign   dbg_creg_wr_en      =   dbg_creg_wr_enab_q   & ~dbg_creg_wr_enab_qq
                                | (~dbg_creg_wr_enab_q   &  dbg_creg_wr_enab_qq  & do_mode_active);
   assign   dbg_creg_addr_en    = dbg_creg_data_en;

   // This signal is set when targeted cores say they are parked via Core_Run_Status
   assign   crstat_ss_vld = (~ss_hold[0] | (ss_hold[0] & ~spc_crstat[0]))
                          & (~ss_hold[1] | (ss_hold[1] & ~spc_crstat[1]))
                          & (~ss_hold[2] | (ss_hold[2] & ~spc_crstat[2]))
                          & (~ss_hold[3] | (ss_hold[3] & ~spc_crstat[3]))
                          & (~ss_hold[4] | (ss_hold[4] & ~spc_crstat[4]))
                          & (~ss_hold[5] | (ss_hold[5] & ~spc_crstat[5]))
                          & (~ss_hold[6] | (ss_hold[6] & ~spc_crstat[6]))
                          & (~ss_hold[7] | (ss_hold[7] & ~spc_crstat[7]));

   // Generate data for parking cores for disable overlap

   assign   do_park[7:0]     = ~spc_dolap_enab[0]  ?  spc_crs[7:0]   : 8'b0;
   assign   do_park[15:8]    = ~spc_dolap_enab[1]  ?  spc_crs[15:8]  : 8'b0;
   assign   do_park[23:16]   = ~spc_dolap_enab[2]  ?  spc_crs[23:16] : 8'b0;
   assign   do_park[31:24]   = ~spc_dolap_enab[3]  ?  spc_crs[31:24] : 8'b0;
   assign   do_park[39:32]   = ~spc_dolap_enab[4]  ?  spc_crs[39:32] : 8'b0;
   assign   do_park[47:40]   = ~spc_dolap_enab[5]  ?  spc_crs[47:40] : 8'b0;
   assign   do_park[55:48]   = ~spc_dolap_enab[6]  ?  spc_crs[55:48] : 8'b0;
   assign   do_park[63:56]   = ~spc_dolap_enab[7]  ?  spc_crs[63:56] : 8'b0;

   assign   do_unpark[7:0]   = ~spc_dolap_enab[0]  ?  spc_crs[7:0]   : doss_enab[7:0];
   assign   do_unpark[15:8]  = ~spc_dolap_enab[1]  ?  spc_crs[15:8]  : doss_enab[15:8];
   assign   do_unpark[23:16] = ~spc_dolap_enab[2]  ?  spc_crs[23:16] : doss_enab[23:16];
   assign   do_unpark[31:24] = ~spc_dolap_enab[3]  ?  spc_crs[31:24] : doss_enab[31:24];
   assign   do_unpark[39:32] = ~spc_dolap_enab[4]  ?  spc_crs[39:32] : doss_enab[39:32];
   assign   do_unpark[47:40] = ~spc_dolap_enab[5]  ?  spc_crs[47:40] : doss_enab[47:40];
   assign   do_unpark[55:48] = ~spc_dolap_enab[6]  ?  spc_crs[55:48] : doss_enab[55:48];
   assign   do_unpark[63:56] = ~spc_dolap_enab[7]  ?  spc_crs[63:56] : doss_enab[63:56];
   
   assign   do_core_run[63:0] = cycle_count_stop  ?  do_park[63:0]: do_unpark[63:0];
   
   //********************************************************************
   // Single Step Mode
   //********************************************************************
   // Detect when all physical cores that should be in single-step mode
   // become parked & send a tcu_ss_mode signal to those cores; only update
   // when core becomes parked; single step does not stop clocks to cores

   assign   ss_mode_active      = &doss_mode[1:0];

   assign   spc_sstep_enab[7:0] =  spc_doss_enab[7:0] & {8{ss_mode_active}};
   
   assign   singstep_mode[0]    = ~spc_crstat[0]      ? spc_sstep_enab[0] : tcu_ss_mode[0];
   assign   singstep_mode[1]    = ~spc_crstat[1]      ? spc_sstep_enab[1] : tcu_ss_mode[1];
   assign   singstep_mode[2]    = ~spc_crstat[2]      ? spc_sstep_enab[2] : tcu_ss_mode[2];
   assign   singstep_mode[3]    = ~spc_crstat[3]      ? spc_sstep_enab[3] : tcu_ss_mode[3];
   assign   singstep_mode[4]    = ~spc_crstat[4]      ? spc_sstep_enab[4] : tcu_ss_mode[4];
   assign   singstep_mode[5]    = ~spc_crstat[5]      ? spc_sstep_enab[5] : tcu_ss_mode[5];
   assign   singstep_mode[6]    = ~spc_crstat[6]      ? spc_sstep_enab[6] : tcu_ss_mode[6];
   assign   singstep_mode[7]    = ~spc_crstat[7]      ? spc_sstep_enab[7] : tcu_ss_mode[7];

   // Create single-step request pulses to target SPC cores
   tcu_dbg_ctl_msff_ctl_macro__en_1__width_1 dbg_ssupd_reg 
   ( 
     .scan_in(dbg_ssupd_reg_scanin),
     .scan_out(dbg_ssupd_reg_scanout),
     .l1clk    (l1clk),
     .en       (ss_mode_active),
     .din      (ssreq_upd_sync), 
     .dout     (ss_request),
  .siclk(siclk),
  .soclk(soclk)
     );

   assign   ss_request_pulse      = ~ss_request         &    ssreq_upd_sync;

   assign   singstep_request[7:0] =  singstep_mode[7:0] & {8{ss_request_pulse}};
   
   // Outputs to SPC Cores for Single Step 
   tcu_dbg_ctl_msff_ctl_macro__en_1__width_8 dbg_ssmode_reg 
   ( 
     .scan_in(dbg_ssmode_reg_scanin),
     .scan_out(dbg_ssmode_reg_scanout),
     .l1clk    (l1clk),
     .en       (io_cmp_sync_en_local),
     .din      (singstep_mode[7:0]), 
     .dout     (tcu_ss_mode[7:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   tcu_dbg_ctl_msff_ctl_macro__width_8 dbg_ssreq_reg 
   ( 
     .scan_in(dbg_ssreq_reg_scanin),
     .scan_out(dbg_ssreq_reg_scanout),
     .l1clk    (l1clk),
     .din      (singstep_request[7:0]), 
     .dout     (tcu_ss_request[7:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

   //********************************************************************
   // Disable Overlap Mode
   //********************************************************************
   // disable overlap does not stop clocks to cores
   assign   do_mode_active      =  doss_mode[1] & ~doss_mode[0];

   assign   spc_dolap_enab[7:0] =  spc_doss_enab[7:0] & {8{do_mode_active}};
   
   assign   disbolap_mode[0]    = ~spc_crstat[0]      ?  spc_dolap_enab[0]  :  tcu_do_mode[0];
   assign   disbolap_mode[1]    = ~spc_crstat[1]      ?  spc_dolap_enab[1]  :  tcu_do_mode[1];
   assign   disbolap_mode[2]    = ~spc_crstat[2]      ?  spc_dolap_enab[2]  :  tcu_do_mode[2];
   assign   disbolap_mode[3]    = ~spc_crstat[3]      ?  spc_dolap_enab[3]  :  tcu_do_mode[3];
   assign   disbolap_mode[4]    = ~spc_crstat[4]      ?  spc_dolap_enab[4]  :  tcu_do_mode[4];
   assign   disbolap_mode[5]    = ~spc_crstat[5]      ?  spc_dolap_enab[5]  :  tcu_do_mode[5];
   assign   disbolap_mode[6]    = ~spc_crstat[6]      ?  spc_dolap_enab[6]  :  tcu_do_mode[6];
   assign   disbolap_mode[7]    = ~spc_crstat[7]      ?  spc_dolap_enab[7]  :  tcu_do_mode[7];

   // Outputs to SPC Cores for Disable Overlap
   tcu_dbg_ctl_msff_ctl_macro__clr__1__en_1__width_8 dbg_domode_reg 
   ( 
     .scan_in(dbg_domode_reg_scanin),
     .scan_out(dbg_domode_reg_scanout),
     .l1clk    (l1clk),
     .en       (io_cmp_sync_en_local),
     .clr_     (do_mode_active),
     .din      (disbolap_mode[7:0]), 
     .dout     (tcu_do_mode[7:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
   
   // Single-step complete status back to JTAG; spc_ss_comp is spc_single-step_complete
   // Also Disable Overlap Running Status when enabled and counter is done and parked
   assign   doss_stat[0]        = (singstep_mode[0]   &  spc_ss_comp[0])  | (spc_dolap_enab[0]  & ~cycle_count_dec  & ~spc_crstat[0]);
   assign   doss_stat[1]        = (singstep_mode[1]   &  spc_ss_comp[1])  | (spc_dolap_enab[1]  & ~cycle_count_dec  & ~spc_crstat[1]);
   assign   doss_stat[2]        = (singstep_mode[2]   &  spc_ss_comp[2])  | (spc_dolap_enab[2]  & ~cycle_count_dec  & ~spc_crstat[2]);
   assign   doss_stat[3]        = (singstep_mode[3]   &  spc_ss_comp[3])  | (spc_dolap_enab[3]  & ~cycle_count_dec  & ~spc_crstat[3]);
   assign   doss_stat[4]        = (singstep_mode[4]   &  spc_ss_comp[4])  | (spc_dolap_enab[4]  & ~cycle_count_dec  & ~spc_crstat[4]);
   assign   doss_stat[5]        = (singstep_mode[5]   &  spc_ss_comp[5])  | (spc_dolap_enab[5]  & ~cycle_count_dec  & ~spc_crstat[5]);
   assign   doss_stat[6]        = (singstep_mode[6]   &  spc_ss_comp[6])  | (spc_dolap_enab[6]  & ~cycle_count_dec  & ~spc_crstat[6]);
   assign   doss_stat[7]        = (singstep_mode[7]   &  spc_ss_comp[7])  | (spc_dolap_enab[7]  & ~cycle_count_dec  & ~spc_crstat[7]);

   //********************************************************************
   // Cycle Step Mode
   //********************************************************************
   tcu_dbg_ctl_msff_ctl_macro__width_1 dbg_cstep_reg 
   ( 
     .scan_in(dbg_cstep_reg_scanin),
     .scan_out(dbg_cstep_reg_scanout),
     .l1clk    (l1clk),
     .din      (next_cs_mode), 
     .dout     (cs_mode),
  .siclk(siclk),
  .soclk(soclk)
     );

   assign   next_cs_mode   =  csmode_upd_sync ? csmode
                           :  cs_mode;

   assign   cs_mode_active =  cycle_count_stop  &  cs_mode;
   assign   jtagclkstop_ov = ~cycle_count_stop  &  cs_mode; // overrides jtag clk stop

   //********************************************************************
   // SOC Hard Stop  
   //********************************************************************
   // In io_clk domain, synchronize to cmp
   
   tcu_dbg_ctl_msff_ctl_macro__en_1__width_1 dbg_sochs_sync_reg 
   ( 
     .scan_in(dbg_sochs_sync_reg_scanin),
     .scan_out(dbg_sochs_sync_reg_scanout),
     .l1clk    (l1clk),
     .en       (sochs_en),
     .din      (dbg1_tcu_soc_hard_stop), 
     .dout     (soc_hard_stop),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   sochs_en       =  io_cmp_sync_en_local &  jtscan_off;

   //********************************************************************
   // DBG Generated Trigger Pulse Request
   //********************************************************************
   // From io2x_clk domain, receive with io2x sync enable 
   tcu_dbg_ctl_msff_ctl_macro__en_1__width_1 dbg_trigreq_sync_reg 
   ( 
     .scan_in(dbg_trigreq_sync_reg_scanin),
     .scan_out(dbg_trigreq_sync_reg_scanout),
     .l1clk    (l1clk),
     .en       (trigreq_en),
     .din      (dbg1_tcu_soc_asrt_trigout), 
     .dout     (dbg1_tcu_soc_asrt_trigout_sync),
  .siclk(siclk),
  .soclk(soclk)
     );
   assign   trigreq_en     =  io_cmp_sync_en_local &  jtscan_off;

   //********************************************************************
   // Trigger In Request from Pins
   //********************************************************************
   // Incoming from MIO, asynchronous 
   cl_sc1_clksyncff_4x dbg_trigin_sync_reg
   ( 
     .si     (dbg_trigin_sync_reg_scanin),
     .so      (dbg_trigin_sync_reg_scanout),
     .l1clk    (l1clk),
     .d        (mio_tcu_trigin_mission), 
     .q        (trigin_sync),
  .siclk(siclk),
  .soclk(soclk)
     );
   // once it's set, hold the trigger_in and kick off a hard clock stop
   //  - treat as a pulse, it will get held in other logic
   assign   mio_tcu_trigin_mission = mio_tcu_trigin &  jtscan_off;
   
   // ********************************************************************
   // Synchronizer for JTAG Clock Start, from instr_clock_start
   // ********************************************************************
   // This is so a jtag clock start instruction can turn off the debug event
   //  that is active, thus restarting clocks
   cl_sc1_clksyncff_4x dbg_clkst_sync_reg
     (.si (dbg_clkst_sync_reg_scanin),
      .so (dbg_clkst_sync_reg_scanout),
      .l1clk (l1clk),
      .d     (jtag_clock_start),
      .q     (jtag_clock_start_sync),
  .siclk(siclk),
  .soclk(soclk)
      );

// fixscan start:
//assign dbg_cmpiosync_reg_scanin  = scan_in                  ;
//assign dbg_cyccnt_reg_scanin     = dbg_cmpiosync_reg_scanout;
assign dbg_cyccnt_reg_scanin     = scan_in                  ;
assign dbg_tcudcr_reg_scanin     = dbg_cyccnt_reg_scanout   ;
assign dbg_decnt_reg_scanin      = dbg_tcudcr_reg_scanout   ;
assign dbg_eventhold_reg_scanin  = dbg_decnt_reg_scanout    ;
assign dbg_sshold_reg_scanin     = dbg_eventhold_reg_scanout;
assign dbg_trigout_reg_scanin    = dbg_sshold_reg_scanout   ;
assign dbg_cregreq_reg_scanin    = dbg_trigout_reg_scanout  ;
assign dbg_cregreqb_reg_scanin   = dbg_cregreq_reg_scanout  ;
assign dbg_creg_access_reg_scanin = dbg_cregreqb_reg_scanout;
assign dbg_ssupd_reg_scanin      = dbg_creg_access_reg_scanout;
assign dbg_ssmode_reg_scanin     = dbg_ssupd_reg_scanout    ;
assign dbg_ssreq_reg_scanin      = dbg_ssmode_reg_scanout   ;
assign dbg_domode_reg_scanin     = dbg_ssreq_reg_scanout    ;
assign dbg_cstep_reg_scanin      = dbg_domode_reg_scanout   ;
assign dbg_sochs_sync_reg_scanin = dbg_cstep_reg_scanout    ;
assign dbg_trigreq_sync_reg_scanin = dbg_sochs_sync_reg_scanout;
assign dbg_trigin_sync_reg_scanin = dbg_trigreq_sync_reg_scanout;
assign dbg_clkst_sync_reg_scanin = dbg_trigin_sync_reg_scanout;
assign scan_out                  = dbg_clkst_sync_reg_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module tcu_dbg_ctl_l1clkhdr_ctl_macro (
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

module tcu_dbg_ctl_msff_ctl_macro__width_64 (
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

module tcu_dbg_ctl_msff_ctl_macro__width_4 (
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

module tcu_dbg_ctl_msff_ctl_macro__width_32 (
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

module tcu_dbg_ctl_msff_ctl_macro__en_1__width_4 (
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

module tcu_dbg_ctl_msff_ctl_macro__en_1__width_8 (
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

module tcu_dbg_ctl_msff_ctl_macro__en_1__width_2 (
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

module tcu_dbg_ctl_msff_ctl_macro__en_1__width_1 (
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

module tcu_dbg_ctl_msff_ctl_macro__width_8 (
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

module tcu_dbg_ctl_msff_ctl_macro__clr__1__en_1__width_8 (
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

module tcu_dbg_ctl_msff_ctl_macro__width_1 (
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








