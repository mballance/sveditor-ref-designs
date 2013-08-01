// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rst.v
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
module rst (
  ccu_rst_sys_clk, 
  gclk, 
  ccu_io_out, 
  scan_in, 
  scan_out, 
  tcu_div_bypass, 
  tcu_atpg_mode, 
  tcu_rst_clk_stop, 
  tcu_rst_io_clk_stop, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  ccu_cmp_sys_sync_en, 
  ccu_sys_cmp_sync_en, 
  ccu_cmp_io_sync_en, 
  ccu_io_cmp_sync_en, 
  ncu_rst_vld, 
  ncu_rst_data, 
  rst_ncu_stall, 
  rst_ncu_vld, 
  rst_ncu_data, 
  ncu_rst_stall, 
  mio_rst_pwron_rst_l, 
  mio_rst_button_xir_l, 
  ncu_rst_xir_done, 
  tcu_rst_flush_init_ack, 
  tcu_rst_flush_stop_ack, 
  tcu_rst_asicflush_stop_ack, 
  mio_rst_pb_rst_l, 
  ccu_rst_change, 
  tcu_bisx_done, 
  tcu_rst_efu_done, 
  l2t0_rst_fatal_error, 
  l2t1_rst_fatal_error, 
  l2t2_rst_fatal_error, 
  l2t3_rst_fatal_error, 
  l2t4_rst_fatal_error, 
  l2t5_rst_fatal_error, 
  l2t6_rst_fatal_error, 
  l2t7_rst_fatal_error, 
  ncu_rst_fatal_error, 
  tcu_rst_scan_mode, 
  ccu_rst_sync_stable, 
  tcu_test_protect, 
  rst_l2_por_, 
  rst_l2_wmr_, 
  rst_ccu_pll_, 
  rst_ccu_, 
  rst_wmr_protect, 
  rst_tcu_clk_stop, 
  rst_mcu_selfrsh, 
  rst_tcu_flush_init_req, 
  rst_tcu_flush_stop_req, 
  rst_tcu_asicflush_stop_req, 
  rst_niu_mac_, 
  rst_niu_wmr_, 
  rst_dmu_peu_por_, 
  rst_dmu_peu_wmr_, 
  rst_ncu_unpark_thread, 
  rst_ncu_xir_, 
  rst_mio_pex_reset_l, 
  rst_mio_ssi_sync_l, 
  rst_mio_rst_state, 
  cluster_arst_l, 
  rst_tcu_dbr_gen, 
  rst_dmu_async_por_, 
  rst_tcu_pwron_rst_l);
wire clkgen_rst_cmp_scanin;
wire clkgen_rst_cmp_scanout;
wire l2clk;
wire clkgen_rst_cmp_aclk_wmr_unused;
wire clkgen_rst_cmp_wmr_protect_unused;
wire clkgen_rst_cmp_wmr_unused;
wire clkgen_rst_cmp_por_unused;
wire cmp_io_sync_en;
wire io_cmp_sync_en;
wire clkgen_rst_cmp_array_wr_inhibit_unused;
wire pwron_rst_h_scan_mode_en;
wire clkgen_rst_io_scanin;
wire clkgen_rst_io_scanout;
wire iol2clk;
wire tcu_aclk_gen;
wire clkgen_rst_io_aclk_wmr_unused;
wire tcu_bclk_gen;
wire tcu_pce_ov_gen;
wire clkgen_rst_io_wmr_protect_unused;
wire clkgen_rst_io_wmr_unused;
wire clkgen_rst_io_por_unused;
wire clkgen_rst_io_cmp_slow_sync_en_unused;
wire clkgen_rst_io_slow_cmp_sync_en_unused;
wire clkgen_rst_io_array_wr_inhibit_unused;
wire rst_tcu_clk_stop_io;
wire rst_fsm_ctl_scanout;
wire rst_fsm_ctl_scanin;
wire rst_ucbflow_ctl_scanin;
wire rst_ucbflow_ctl_scanout;
wire rst_rst_wmr_io_;
wire rd_req_vld;
wire wr_req_vld;
wire [5:0] thr_id_in;
wire [1:0] buf_id_in;
wire [39:0] addr_in;
wire [63:0] data_in;
wire req_acpted;
wire rd_ack_vld;
wire rd_nack_vld;
wire [5:0] thr_id_out;
wire [1:0] buf_id_out;
wire [63:0] data_out;
wire ack_busy;
wire rst_cmp_ctl_scanin;
wire rst_cmp_ctl_scanout;
wire rst_io_ctl_scanin;
wire rst_io_ctl_scanout;
wire aclk;
wire bclk;
wire pce_ov;
wire req_acpted_sys;
wire rd_req_vld_sys;
wire wr_req_vld_sys;
wire [39:0] addr_in_sys;
wire [15:0] data_in_sys;
wire [5:0] thr_id_in_sys;
wire [1:0] buf_id_in_sys;
wire ack_busy_sys;
wire rd_ack_vld_sys;
wire rd_nack_vld_sys;
wire [15:0] data_out_sys2;
wire [5:0] thr_id_out_sys;
wire [1:0] buf_id_out_sys;
wire ncu_rst_xir_done_sys;
wire ccu_rst_change_cmp;
wire tcu_bisx_done_cmp;
wire tcu_rst_efu_done_cmp;
wire tr_flush_init_ack_cmp;
wire tr_flush_stop_ack_cmp;
wire tr_asicflush_stop_ack_cmp;
wire ncu_rst_fatal_error_cmp;
wire l2t0_rst_fatal_error_cmp;
wire l2t1_rst_fatal_error_cmp;
wire l2t2_rst_fatal_error_cmp;
wire l2t3_rst_fatal_error_cmp;
wire l2t4_rst_fatal_error_cmp;
wire l2t5_rst_fatal_error_cmp;
wire l2t6_rst_fatal_error_cmp;
wire l2t7_rst_fatal_error_cmp;
wire mio_rst_pb_rst_sys2_;
wire tcu_test_protect_cmp;
wire rst_l2_por_sys2_;
wire rst_l2_wmr_sys2_;
wire rst_cmp_ctl_wmr_sys2_;
wire rst_tcu_clk_stop_sys2;
wire rst_mcu_selfrsh_sys2;
wire rst_dmu_peu_por_sys2_;
wire rst_dmu_peu_wmr_sys2_;
wire rt_flush_init_req_sys2;
wire rt_flush_stop_req_sys2;
wire rt_asicflush_stop_req_sys2;
wire rst_niu_mac_sys2_;
wire rst_niu_wmr_sys2_;
wire rst_ncu_unpark_thread_sys2;
wire rst_ncu_xir_sys2_;
wire rst_rst_pwron_rst_l_sys2_;
wire reset_gen_dbr_gen_q;
wire rst_rst_por_sys2_;
wire rst_rst_wmr_sys2_;
wire mio_rst_pb_rst_sys_;
wire ncu_rst_xir_done_io;
wire tcu_test_protect_io;
wire ccu_rst_change_io;
wire [7:0] l2ta_rst_fatal_error_io;
wire ncu_rst_fatal_error_io;
wire rd_req_vld_io;
wire wr_req_vld_io;
wire [39:0] addr_in_io;
wire [15:0] data_in_io;
wire [5:0] thr_id_in_io;
wire [1:0] buf_id_in_io;
wire ack_busy_io;
wire req_acpted_cmp2;
wire rd_ack_vld_cmp2;
wire rd_nack_vld_cmp2;
wire [15:0] data_out_cmp2;
wire [5:0] thr_id_out_cmp2;
wire [1:0] buf_id_out_cmp2;
wire rst_mcu_selfrsh_cmp2;
wire rst_ncu_unpark_thread_cmp2;
wire rst_ncu_xir_cmp2_;
wire rst_rst_pwron_rst_l_io0_;
wire rst_rst_por_io0_;
wire rst_rst_wmr_io0_;

//________________________________________________________________

                                      // Globals
input           ccu_rst_sys_clk      ;// Was io_ref_clk.
//
// ut           iol2clk              ;// Now driven by clkgen_rst_io.
// This is now the input to clkgen_rst_io, which drives io_ref_clk.
input           gclk                 ;
input           ccu_io_out           ;
input           scan_in              ;
output          scan_out             ;
input           tcu_div_bypass       ;

input           tcu_atpg_mode        ;
input           tcu_rst_clk_stop     ;// Was tcu_soc4cmp_clk_stop.
input           tcu_rst_io_clk_stop  ;// Was tcu_clk_stop.
                                      // Unused as of Nov 19 '05.
input           tcu_pce_ov           ;
input           tcu_aclk             ;
input           tcu_bclk             ;
input           tcu_scan_en          ;
input           ccu_cmp_sys_sync_en  ;// rst_cmp_ctl cross from cmp to sys.
input           ccu_sys_cmp_sync_en  ;// rst_cmp_ctl cross from sys to cmp.
input           ccu_cmp_io_sync_en   ;// rst_cmp_ctl cross from cmp to io.
input           ccu_io_cmp_sync_en   ;// rst_cmp_ctl cross from io  to cmp.
                                      // RST: UCB downstream from NCU
input           ncu_rst_vld          ;
input  [ 3:0]   ncu_rst_data         ;
output          rst_ncu_stall        ;

                                      // RST: UCB upstream to NCU
output          rst_ncu_vld          ;
output [ 3:0]   rst_ncu_data         ;
input           ncu_rst_stall        ;

input           mio_rst_pwron_rst_l  ;// PWRON_RST_L
input           mio_rst_button_xir_l ;// BUTTON_XIR_L
input           ncu_rst_xir_done     ;// Active for one clock.
input           tcu_rst_flush_init_ack    ;// Request TCU to   assert se.
input           tcu_rst_flush_stop_ack    ;// Request TCU to deassert se.
input           tcu_rst_asicflush_stop_ack;// Request TCU to deassert se.
input           mio_rst_pb_rst_l     ;// PB_RST_L
input           ccu_rst_change       ;//
input           tcu_bisx_done        ;// Active for one clock.
input           tcu_rst_efu_done     ;// 
input           l2t0_rst_fatal_error ;//
input           l2t1_rst_fatal_error ;//
input           l2t2_rst_fatal_error ;//
input           l2t3_rst_fatal_error ;//
input           l2t4_rst_fatal_error ;//
input           l2t5_rst_fatal_error ;//
input           l2t6_rst_fatal_error ;//
input           l2t7_rst_fatal_error ;//
input           ncu_rst_fatal_error  ;//
input           tcu_rst_scan_mode    ;// Indicates scan is active.
input           ccu_rst_sync_stable  ;
input           tcu_test_protect     ;
                // During mbist, lbist, jtag scan, trans test may want
                // to block tcu, rst and ccu from seeing random activity
                // from ucb (NCU), SPC's, etc.
                // This signal synch'd to ioclk & set via jtag id for blocking

output          rst_l2_por_          ;// Data Path     Reset.
output          rst_l2_wmr_          ;// State Machine Reset.
output          rst_ccu_pll_         ;// Reset PLL   in Clock Control Unit.
output          rst_ccu_             ;// Reset logic in Clock Control Unit.
output          rst_wmr_protect      ;//
output          rst_tcu_clk_stop     ;// Protect tcu from clk while PLL resets.
output          rst_mcu_selfrsh      ;// Self-refresh bit of RESET_SSYS reg.
output          rst_tcu_flush_init_req    ;// Request TCU to   assert se.
output          rst_tcu_flush_stop_req    ;// Request TCU to deassert se.
output          rst_tcu_asicflush_stop_req;// Request TCU to deassert se.
output          rst_niu_mac_         ;// Formerly rst_niu_.
output          rst_niu_wmr_         ;// Formerly rst_niu_.
output          rst_dmu_peu_por_     ;//
output          rst_dmu_peu_wmr_     ;//
output          rst_ncu_unpark_thread;// 
output          rst_ncu_xir_         ;//
output          rst_mio_pex_reset_l  ;// Added Nov 11 '04.
output          rst_mio_ssi_sync_l   ;// Takes the place of rst_mio_fatal_error.
output [ 5:0]   rst_mio_rst_state    ;// Added Apr 26 '05.
output          cluster_arst_l       ;// Added May 02 '05.
output          rst_tcu_dbr_gen      ;// Added Aug 04 '05.
output          rst_dmu_async_por_   ;// BP  Aug 05 '05.
output          rst_tcu_pwron_rst_l  ;// = rst_tcu_pwron_rst_l_cmp_ & 
                                      //   rst_rst_pwron_rst_l_sys2_;
                                      // Async assert, cmp-sync deassert.
//________________________________________________________________
//
// Last Action Date:       12/13/2005 03:12:23 PM
// Model Name:             @fc_scan_latest
// Rev Open:               1.515
// FoundByTool:            VCS
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
// I talked to Tom Z., and according to him the tcu_rst_clk_stop comes from
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

clkgen_rst_cmp clkgen_rst_cmp        (
                                      // Clock & test out
  .scan_in(clkgen_rst_cmp_scanin),
  .scan_out(clkgen_rst_cmp_scanout),
  .l2clk           (l2clk           ),// Assume we do not need aclk,bclk outputs
//.aclk            (                ),// Buffered version of aclk
  .aclk_wmr        (clkgen_rst_cmp_aclk_wmr_unused),
                                      // Reset Unit uses sync reset, not flush.
//.bclk            (                ),// Buffered version of bclk

                   // Pipelined out
//.clk_stop        (                ),// Allows clk stop in flop-header
//.pce_ov          (                ),// pce override to l1 header

                   // rst is not reset by flush reset.
  .wmr_protect     (clkgen_rst_cmp_wmr_protect_unused),
  .wmr_            (clkgen_rst_cmp_wmr_unused        ),
  .por_            (clkgen_rst_cmp_por_unused        ),
                                      // Must assign, else mult drivers.)

  .cmp_slow_sync_en(cmp_io_sync_en  ),// Use for cmp->slow clk sync pulse
  .slow_cmp_sync_en(io_cmp_sync_en  ),// Use for slow->cmp clk sync pulse
  .array_wr_inhibit(clkgen_rst_cmp_array_wr_inhibit_unused),
                                      // (Reset Unit has no SRam array.
                                      // but must assign, else mult drivers.)

                                      // Ctrl in (for pipelining    )
//.tcu_clk_stop    (tcu_clk_stop_scan_mode),// = tcu_rst_scan_mode ?
                                            //   tcu_rst_clk_stop : 1'b0;
                                            //               1'b0 : 1'b0;
  .tcu_clk_stop    (1'b0            ),// 
//.tcu_atpg_mode   (tcu_atpg_mode   ),// 
  .tcu_wr_inhibit  (1'b0            ),// (Reset Unit has no SRam array.)
  .tcu_pce_ov      (tcu_pce_ov      ),// "Connect to tcu_pce_ov port on TCU."
//.rst_wmr_protect (rst_wmr_protect ),// No cmp flops are WMR protected.
  .rst_wmr_        (1'b1            ),// No IP modules.
  .rst_por_        (1'b1            ),// No IP modules.

  .ccu_cmp_slow_sync_en
    (ccu_cmp_io_sync_en             ),// "Connect to ccu_cmp_<slow>_sync_en."
  .ccu_slow_cmp_sync_en 
    (ccu_io_cmp_sync_en             ),// "Connect to ccu_<slow>_cmp_sync_en."
                                      // "Cluster Heder Usage, Niagara 2",
                                      // Version 1.41, Apr 29, 2005, Section
                                      // 4.1, "CMP Domain Example", page 6.

                                      // Ctrl in (for clock gen    )
  .tcu_div_bypass  (tcu_div_bypass  ),// Bypasses clk divider to mux in ext clk
                                      // "Connect to TBD port on TCU." 
                                      // CH Hdr Usage in RTL, v1.2 Feb 16 '05
  .ccu_div_ph      (1'b1            ),// Phase signal from ccu (div/4 or div/2)
                                      // "Tie high."
  .cluster_div_en  (1'b0            ),// If enabled, l2clk is divided down
                                      // Clock & test in
                                      // "Tie low."
  .gclk            (gclk            ),// Global clk - this is either cmp or dr
  .cluster_arst_l  (1'b1            ),// Need to be able to provide a
									  // free-running version of l1clk
									  // for rst_tcu_clk_stop,
									  // ccu_cmp_sys_cync_en2, _en3,
									  // ccu_sys_cmp_sync_en2, and _en3.
  .clk_ext         (1'b0            ),// External clk muxed in for ioclk bypass
                                      // "Unused - tie low."
				      // ".clk_ext and .ccu_serdes_dtm have
				      // been removed from the cluster_header
				      // but still exist in the wrapper for
				      // minimal disruption.  They will have no
				      // effect on RTL/simulation.  They can be
				      // taken out later on."
  .ccu_serdes_dtm  (1'b0            ),// (See above.)
  .scan_en (pwron_rst_h_scan_mode_en),// = (~mio_rst_pwron_rst_l          ) |
                                      //   ( tcu_rst_scan_mode&rst_scan_en)
                                      // Was tcu_scan_en, but always 1.
                                      // "Tie low."
  .tcu_aclk        (tcu_aclk        ),
  .tcu_bclk        (tcu_bclk        ),
  .tcu_atpg_mode(tcu_atpg_mode),
  .aclk(aclk),
  .bclk(bclk),
  .pce_ov(pce_ov),
  .rst_wmr_protect(rst_wmr_protect)
                                     );
//________________________________________________________________

clkgen_rst_io clkgen_rst_io          (
                                      // Clock & test out
  .scan_in(clkgen_rst_io_scanin),
  .scan_out(clkgen_rst_io_scanout),
  .l2clk           (iol2clk         ),// Assume we do not need aclk,bclk outputs
                                      // Later, change to iol2clk, and
                                      // drive fsm directly from pll_ref_clk.
  .aclk            (tcu_aclk_gen    ),// Buffered version of aclk
  .aclk_wmr        (clkgen_rst_io_aclk_wmr_unused),
                                      // Reset Unit uses sync reset, not flush.
  .bclk            (tcu_bclk_gen    ),// Buffered version of bclk

                                      // Pipelined out
  .pce_ov          (tcu_pce_ov_gen  ),// pce override to l1 header

//.rst_wmr_protect (rst_wmr_protect ),// No UCB flops are WMR protected.
//.wmr_            (                ),// Warm reset (active low)
//.por_            (                ),// Power-on-reset
  .wmr_protect     (clkgen_rst_io_wmr_protect_unused),
  .wmr_            (clkgen_rst_io_wmr_unused        ),
  .por_            (clkgen_rst_io_por_unused        ),
                                      // Must assign, else mult drivers.)

  .cmp_slow_sync_en(clkgen_rst_io_cmp_slow_sync_en_unused),
                                      // See cmp_slow_sync_en on clkgen_rst_cmp.
  .slow_cmp_sync_en(clkgen_rst_io_slow_cmp_sync_en_unused),
                                      // See slow_cmp_sync_en on clkgen_rst_cmp.
                                      // "Tie low (use corresponding port on
                                      // CMP cluster header, clkgen_rst_cmp.)",
                                      // "Cluster Heder Usage, Niagara 2",
                                      // Version 1.41, Apr 29, 2005, Section
                                      // 4.3, "CMP and DR Domains Example",
                                      // page 9.
  .array_wr_inhibit(clkgen_rst_io_array_wr_inhibit_unused),
                                      // (Reset Unit has no SRam array.
                                      // but must assign, else mult drivers.)

                                      // Ctrl in (for pipelining    )
//.tcu_clk_stop    (tcu_rst_io_clk_stop
  .tcu_clk_stop    (rst_tcu_clk_stop_io),// Stop clocks when pll locking, to
                                      // allow rst_mcu_selfrsh to hold value.
//.tcu_atpg_mode   (tcu_atpg_mode   ),//
  .tcu_wr_inhibit  (1'b0            ),// (Reset Unit has no SRam array.)
  .tcu_pce_ov      (tcu_pce_ov      ),
  .rst_wmr_protect (1'b0            ),// rst is not reset by flush reset.
  .rst_wmr_        (1'b1            ),
  .rst_por_        (1'b1            ),
  .ccu_cmp_slow_sync_en
                   (1'b0            ),// "Tie low."
  .ccu_slow_cmp_sync_en
                   (1'b0            ),// "Tie low."
                                      // "Tie low (use corresponding port on
                                      // CMP cluster header, clkgen_rst_cmp.)",
                                      // "Cluster Heder Usage, Niagara 2",
                                      // Version 1.41, Apr 29, 2005, Section
                                      // 4.3, "CMP and DR Domains Example",
                                      // page 9.

                                      // Ctrl in (for clock gen    )
  .tcu_div_bypass  (tcu_div_bypass  ),// Bypasses clk divider to mux in ext clk
                                      // "Connect to TBD port on TCU." 
                                      // CH Hdr Usage in RTL, v1.2 Feb 16 '05
  .ccu_div_ph      (ccu_io_out      ),// Phase signal from ccu (div/4 or div/2)
  .cluster_div_en  (1'b1            ),// If enabled, l2clk is divided down
                                      // Clock & test in
  .gclk            (gclk            ),// Global clk - this is either cmp or dr
//.cluster_arst_l  (cluster_arst_l  ),// SunV connect by name.
  .clk_ext         (1'b0            ),// External clk muxed in for ioclk bypass
				      // ".clk_ext and .ccu_serdes_dtm have
				      // been removed from the cluster_header
				      // but still exist in the wrapper for
				      // minimal disruption.  They will have no
				      // effect on RTL/simulation.  They can be
				      // taken out later on."
  .ccu_serdes_dtm  (1'b0            ),// (See above.)
  .scan_en (pwron_rst_h_scan_mode_en),// = (~mio_rst_pwron_rst_l          ) |
                                      //   ( tcu_rst_scan_mode&rst_scan_en)
                                      // Was tcu_scan_en, but always 1.
                                      // "Tie low."
//.scan_en         (tcu_scan_en     ),// Was: stop clocks for flush reset.
  .tcu_aclk        (tcu_aclk        ),
  .tcu_bclk        (tcu_bclk        ),
  .tcu_atpg_mode(tcu_atpg_mode),
  .cluster_arst_l(cluster_arst_l)
                                     );
//________________________________________________________________

rst_fsm_ctl              rst_fsm_ctl           (

  .ref_clk              (ccu_rst_sys_clk/*iol2clk*/         ),// (Was io_ref_clk.)
  .rst_fsm_ctl_scanout(rst_fsm_ctl_scanout),

//                      If you run fixscan rst.sv, you will get the following:
//.scan_out(rst_fsm_ctl_scanout),
//                      If you run fixscan rst.sv, be sure to
//                      comment out the preceding line, so that the:
//.rst_fsm_ctl_scanout(rst_fsm_ctl_scanout)
//                      port above will be used.

  .scan_in(rst_fsm_ctl_scanin),
  .rst_aclk             (tcu_aclk_gen         ),// Called rst_ here...
  .rst_bclk             (tcu_bclk_gen         ),// to allow assign stmt.
  .rst_scan_en          (tcu_scan_en          ),// Assign stmt.
  .tcu_pce_ov           (tcu_pce_ov_gen       ),// (No assign needed.)
  .rst_clk_stop         (tcu_rst_clk_stop     ),// Assign stmt.
//.rst_rst_por_sys2_    (rst_rst_por_sys2_    ),// BP 8-22-05 sync rst ucb
//.rst_rst_wmr_sys2_    (rst_rst_wmr_sys2_    ),// BP 8-22-05 sync rst ucb
                                                // Was ucb_clr_sys2_.
//.req_acpted           (req_acpted           ),// Acceptance of CSR wr,rd cmd.
                                                // Commands to RST
//.rd_req_vld           (rd_req_vld           ),//
//.wr_req_vld           (wr_req_vld           ),// 
//.addr_in              (addr_in[39:0]        ),// 
//.data_in              (data_in[63:0]        ),// 
//.thr_id_in            (thr_id_in[ 5:0]      ),//
//.buf_id_in            (buf_id_in[ 1:0]      ),//
//.ack_busy             (ack_busy             ),//
                                                // Ack-Nack from RST
//.rd_ack_vld           (rd_ack_vld           ),// 
//.rd_nack_vld          (rd_nack_vld          ),//
                 
//.data_out             (data_out[63:0]       ),// Return data.
//.thr_id_out           (thr_id_out[ 5:0]     ),// 
//.buf_id_out           (buf_id_out[ 1:0]     ),//
   
//.mio_rst_pwron_rst_l  (mio_rst_pwron_rst_l  ),// SunV implicit connect.
//.mio_rst_button_xir_l (mio_rst_button_xir_l ),// SunV implicit connect.
//.ncu_rst_xir_done_sys (ncu_rst_xir_done_sys ),// SunV connect by name.
//.mio_rst_pb_rst_l     (mio_rst_pb_rst_l     ),// SunV implicit connect.
//.ccu_rst_change_cmp   (ccu_rst_change_cmp   ),// To be connect by name.
//.tcu_bisx_done_cmp    (tcu_bisx_done_cmp    ),// SunV connect by name.
//.tcu_rst_efu_done_cmp (tcu_rst_efu_done_cmp ),// SunV connect by name.

//.l2t0_rst_fatal_error_cmp(l2t0_rst_fatal_error_cmp),// SunV connect by name.
//.l2t1_rst_fatal_error_cmp(l2t1_rst_fatal_error_cmp),// SunV connect by name.
//.l2t2_rst_fatal_error_cmp(l2t2_rst_fatal_error_cmp),// SunV connect by name.
//.l2t3_rst_fatal_error_cmp(l2t3_rst_fatal_error_cmp),// SunV connect by name.
//.l2t4_rst_fatal_error_cmp(l2t4_rst_fatal_error_cmp),// SunV connect by name.
//.l2t5_rst_fatal_error_cmp(l2t5_rst_fatal_error_cmp),// SunV connect by name.
//.l2t6_rst_fatal_error_cmp(l2t6_rst_fatal_error_cmp),// SunV connect by name.
//.l2t7_rst_fatal_error_cmp(l2t7_rst_fatal_error_cmp),// SunV connect by name.
                 
//.rst_l2_por_          (rst_l2_por_          ),// SunV connect by name.
//.rst_l2_wmr_          (rst_l2_wmr_          ),// SunV connect by name.
              
//.rst_niu_wmr_         (rst_niu_wmr_         ),// SunV implicit connect.
//.rst_ncu_unpark_thread_sys2(rst_ncu_unpark_thread_sys2),//Sunv connect.
//.rst_ncu_xir_sys2     (rst_ncu_xir_sys2     ),// Sunv implicit connect.
  .rst_mio_pex_reset_l  (rst_mio_pex_reset_l  ),
  .req_acpted_sys(req_acpted_sys),
  .rd_req_vld_sys(rd_req_vld_sys),
  .wr_req_vld_sys(wr_req_vld_sys),
  .addr_in_sys(addr_in_sys[39:0]),
  .data_in_sys(data_in_sys[15:0]),
  .thr_id_in_sys(thr_id_in_sys[5:0]),
  .buf_id_in_sys(buf_id_in_sys[1:0]),
  .ack_busy_sys(ack_busy_sys),
  .rd_ack_vld_sys(rd_ack_vld_sys),
  .rd_nack_vld_sys(rd_nack_vld_sys),
  .data_out_sys2(data_out_sys2[15:0]),
  .thr_id_out_sys(thr_id_out_sys[5:0]),
  .buf_id_out_sys(buf_id_out_sys[1:0]),
  .mio_rst_pwron_rst_l(mio_rst_pwron_rst_l),
  .mio_rst_button_xir_l(mio_rst_button_xir_l),
  .ncu_rst_xir_done_sys(ncu_rst_xir_done_sys),
  .mio_rst_pb_rst_l(mio_rst_pb_rst_l),
  .ccu_rst_change_cmp(ccu_rst_change_cmp),
  .tcu_bisx_done_cmp(tcu_bisx_done_cmp),
  .tcu_rst_efu_done_cmp(tcu_rst_efu_done_cmp),
  .tr_flush_init_ack_cmp(tr_flush_init_ack_cmp),
  .tr_flush_stop_ack_cmp(tr_flush_stop_ack_cmp),
  .tr_asicflush_stop_ack_cmp(tr_asicflush_stop_ack_cmp),
  .ncu_rst_fatal_error_cmp(ncu_rst_fatal_error_cmp),
  .l2t0_rst_fatal_error_cmp(l2t0_rst_fatal_error_cmp),
  .l2t1_rst_fatal_error_cmp(l2t1_rst_fatal_error_cmp),
  .l2t2_rst_fatal_error_cmp(l2t2_rst_fatal_error_cmp),
  .l2t3_rst_fatal_error_cmp(l2t3_rst_fatal_error_cmp),
  .l2t4_rst_fatal_error_cmp(l2t4_rst_fatal_error_cmp),
  .l2t5_rst_fatal_error_cmp(l2t5_rst_fatal_error_cmp),
  .l2t6_rst_fatal_error_cmp(l2t6_rst_fatal_error_cmp),
  .l2t7_rst_fatal_error_cmp(l2t7_rst_fatal_error_cmp),
  .tcu_rst_scan_mode(tcu_rst_scan_mode),
  .mio_rst_pb_rst_sys2_(mio_rst_pb_rst_sys2_),
  .tcu_test_protect_cmp(tcu_test_protect_cmp),
  .rst_ccu_pll_(rst_ccu_pll_),
  .rst_ccu_(rst_ccu_),
  .rst_l2_por_sys2_(rst_l2_por_sys2_),
  .rst_l2_wmr_sys2_(rst_l2_wmr_sys2_),
  .rst_cmp_ctl_wmr_sys2_(rst_cmp_ctl_wmr_sys2_),
  .rst_wmr_protect(rst_wmr_protect),
  .rst_tcu_clk_stop_sys2(rst_tcu_clk_stop_sys2),
  .rst_mcu_selfrsh_sys2(rst_mcu_selfrsh_sys2),
  .rst_dmu_peu_por_sys2_(rst_dmu_peu_por_sys2_),
  .rst_dmu_peu_wmr_sys2_(rst_dmu_peu_wmr_sys2_),
  .rt_flush_init_req_sys2(rt_flush_init_req_sys2),
  .rt_flush_stop_req_sys2(rt_flush_stop_req_sys2),
  .rt_asicflush_stop_req_sys2(rt_asicflush_stop_req_sys2),
  .rst_niu_mac_sys2_(rst_niu_mac_sys2_),
  .rst_niu_wmr_sys2_(rst_niu_wmr_sys2_),
  .rst_ncu_unpark_thread_sys2(rst_ncu_unpark_thread_sys2),
  .rst_ncu_xir_sys2_(rst_ncu_xir_sys2_),
  .rst_mio_ssi_sync_l(rst_mio_ssi_sync_l),
  .rst_mio_rst_state(rst_mio_rst_state[5:0]),
  .cluster_arst_l(cluster_arst_l),
  .rst_dmu_async_por_(rst_dmu_async_por_),
  .rst_rst_pwron_rst_l_sys2_(rst_rst_pwron_rst_l_sys2_),
  .reset_gen_dbr_gen_q(reset_gen_dbr_gen_q),
  .rst_rst_por_sys2_(rst_rst_por_sys2_),
  .rst_rst_wmr_sys2_(rst_rst_wmr_sys2_),
  .mio_rst_pb_rst_sys_(mio_rst_pb_rst_sys_)// Added Nov 11 '04.
//.rst_mio_ssi_sync_l   (rst_mio_ssi_sync_l   ),// Sunv implicit connect.
                                                // Replaces rst_mio_fatal_error.
                                               );
//________________________________________________________________

rst_ucbflow_ctl         rst_ucbflow_ctl        (
                                                // Globals
  .scan_in(rst_ucbflow_ctl_scanin),
  .ucb_ctl_scanout(rst_ucbflow_ctl_scanout),
  .iol2clk              (iol2clk              ),
  .tcu_pce_ov           (tcu_pce_ov_gen       ),
  .rst_clk_stop         (1'b0                 ),// BP 8-22-05
  .rst_aclk             (tcu_aclk_gen         ),// BP 8-22-05
  .rst_bclk             (tcu_bclk_gen         ),// BP 8-22-05
  .rst_scan_en          (tcu_scan_en          ),// BP 8-22-05
  .ucb_clr_io_          (rst_rst_wmr_io_      ),// BP 8-22-05
  // Should be          (rst_rst_wmr_io2_     ),// BP 8-22-05
                                                // Downstream from NCU
  .ncu_rst_vld          (ncu_rst_vld          ),
  .ncu_rst_data         (ncu_rst_data[3:0]    ),
  .rst_ncu_stall        (rst_ncu_stall        ),
                                                // Upstream to NCU
  .rst_ncu_vld          (rst_ncu_vld          ),
  .rst_ncu_data         (rst_ncu_data[3:0]    ),
  .ncu_rst_stall        (ncu_rst_stall        ),
                                                // CMDs to local unit
  .rd_req_vld           (rd_req_vld           ),
  .wr_req_vld           (wr_req_vld           ),
  .thr_id_in            (thr_id_in[5:0]       ),
  .buf_id_in            (buf_id_in[1:0]       ),
  .addr_in              (addr_in[39:0]        ),
  .data_in              (data_in[63:0]        ),
  .req_acpted           (req_acpted           ),
                                                // Ack/Nack from local unit
  .rd_ack_vld           (rd_ack_vld           ),//
  .rd_nack_vld          (rd_nack_vld          ),
  .thr_id_out           (thr_id_out[5:0]      ),
  .buf_id_out           (buf_id_out[1:0]      ),
  .data_out             (data_out[63:0]       ),
  .ack_busy             (ack_busy             ),
  .tcu_rst_scan_mode(tcu_rst_scan_mode)
                                               );
//________________________________________________________________

rst_cmp_ctl             rst_cmp_ctl            (
  .scan_in(rst_cmp_ctl_scanin),
  .scan_out(rst_cmp_ctl_scanout),
  .rst_aclk             (tcu_aclk_gen         ),// Called rst_ here...
  .rst_bclk             (tcu_bclk_gen         ),// to allow assign stmt.
  .rst_scan_en          (tcu_scan_en          ),// Assign stmt.
  .tcu_pce_ov           (tcu_pce_ov_gen       ),// (No assign needed.)
  .rst_clk_stop         (1'b0                 ),
  .l2clk(l2clk),
  .tcu_rst_scan_mode(tcu_rst_scan_mode),
  .ccu_cmp_sys_sync_en(ccu_cmp_sys_sync_en),
  .ccu_sys_cmp_sync_en(ccu_sys_cmp_sync_en),
  .cmp_io_sync_en(cmp_io_sync_en),
  .io_cmp_sync_en(io_cmp_sync_en),
  .rst_cmp_ctl_wmr_sys2_(rst_cmp_ctl_wmr_sys2_),
  .mio_rst_pwron_rst_l(mio_rst_pwron_rst_l),
  .tcu_rst_flush_init_ack(tcu_rst_flush_init_ack),
  .tcu_rst_flush_stop_ack(tcu_rst_flush_stop_ack),
  .tcu_rst_asicflush_stop_ack(tcu_rst_asicflush_stop_ack),
  .rst_mcu_selfrsh_sys2(rst_mcu_selfrsh_sys2),
  .rst_l2_por_sys2_(rst_l2_por_sys2_),
  .rst_l2_wmr_sys2_(rst_l2_wmr_sys2_),
  .rst_dmu_peu_por_sys2_(rst_dmu_peu_por_sys2_),
  .rst_dmu_peu_wmr_sys2_(rst_dmu_peu_wmr_sys2_),
  .rst_niu_mac_sys2_(rst_niu_mac_sys2_),
  .rst_niu_wmr_sys2_(rst_niu_wmr_sys2_),
  .rst_tcu_clk_stop_sys2(rst_tcu_clk_stop_sys2),
  .rst_ncu_unpark_thread_sys2(rst_ncu_unpark_thread_sys2),
  .rst_ncu_xir_sys2_(rst_ncu_xir_sys2_),
  .ncu_rst_xir_done_io(ncu_rst_xir_done_io),
  .tcu_rst_efu_done(tcu_rst_efu_done),
  .tcu_bisx_done(tcu_bisx_done),
  .tcu_test_protect_io(tcu_test_protect_io),
  .ccu_rst_change_io(ccu_rst_change_io),
  .l2ta_rst_fatal_error_io(l2ta_rst_fatal_error_io[7:0]),
  .ncu_rst_fatal_error_io(ncu_rst_fatal_error_io),
  .tr_flush_init_ack_cmp(tr_flush_init_ack_cmp),
  .tr_flush_stop_ack_cmp(tr_flush_stop_ack_cmp),
  .tr_asicflush_stop_ack_cmp(tr_asicflush_stop_ack_cmp),
  .rt_flush_init_req_sys2(rt_flush_init_req_sys2),
  .rt_flush_stop_req_sys2(rt_flush_stop_req_sys2),
  .rt_asicflush_stop_req_sys2(rt_asicflush_stop_req_sys2),
  .rst_tcu_flush_init_req(rst_tcu_flush_init_req),
  .rst_tcu_flush_stop_req(rst_tcu_flush_stop_req),
  .rst_tcu_asicflush_stop_req(rst_tcu_asicflush_stop_req),
  .rd_req_vld_io(rd_req_vld_io),
  .wr_req_vld_io(wr_req_vld_io),
  .req_acpted_sys(req_acpted_sys),
  .rd_ack_vld_sys(rd_ack_vld_sys),
  .rd_nack_vld_sys(rd_nack_vld_sys),
  .addr_in_io(addr_in_io[39:0]),
  .data_in_io(data_in_io[15:0]),
  .thr_id_in_io(thr_id_in_io[5:0]),
  .buf_id_in_io(buf_id_in_io[1:0]),
  .ack_busy_io(ack_busy_io),
  .data_out_sys2(data_out_sys2[15:0]),
  .thr_id_out_sys(thr_id_out_sys[5:0]),
  .buf_id_out_sys(buf_id_out_sys[1:0]),
  .reset_gen_dbr_gen_q(reset_gen_dbr_gen_q),
  .rd_req_vld_sys(rd_req_vld_sys),
  .wr_req_vld_sys(wr_req_vld_sys),
  .req_acpted_cmp2(req_acpted_cmp2),
  .rd_ack_vld_cmp2(rd_ack_vld_cmp2),
  .rd_nack_vld_cmp2(rd_nack_vld_cmp2),
  .addr_in_sys(addr_in_sys[39:0]),
  .data_in_sys(data_in_sys[15:0]),
  .thr_id_in_sys(thr_id_in_sys[5:0]),
  .buf_id_in_sys(buf_id_in_sys[1:0]),
  .ack_busy_sys(ack_busy_sys),
  .data_out_cmp2(data_out_cmp2[15:0]),
  .thr_id_out_cmp2(thr_id_out_cmp2[5:0]),
  .buf_id_out_cmp2(buf_id_out_cmp2[1:0]),
  .rst_mcu_selfrsh_cmp2(rst_mcu_selfrsh_cmp2),
  .rst_dmu_peu_por_(rst_dmu_peu_por_),
  .rst_dmu_peu_wmr_(rst_dmu_peu_wmr_),
  .rst_niu_mac_(rst_niu_mac_),
  .rst_niu_wmr_(rst_niu_wmr_),
  .rst_tcu_clk_stop(rst_tcu_clk_stop),
  .rst_tcu_clk_stop_io(rst_tcu_clk_stop_io),
  .rst_l2_por_(rst_l2_por_),
  .rst_l2_wmr_(rst_l2_wmr_),
  .rst_ncu_unpark_thread_cmp2(rst_ncu_unpark_thread_cmp2),
  .rst_ncu_xir_cmp2_(rst_ncu_xir_cmp2_),
  .ncu_rst_xir_done_sys(ncu_rst_xir_done_sys),
  .tcu_rst_efu_done_cmp(tcu_rst_efu_done_cmp),
  .tcu_bisx_done_cmp(tcu_bisx_done_cmp),
  .ncu_rst_fatal_error_cmp(ncu_rst_fatal_error_cmp),
  .tcu_test_protect_cmp(tcu_test_protect_cmp),
  .ccu_rst_change_cmp(ccu_rst_change_cmp),
  .l2t7_rst_fatal_error_cmp(l2t7_rst_fatal_error_cmp),
  .l2t6_rst_fatal_error_cmp(l2t6_rst_fatal_error_cmp),
  .l2t5_rst_fatal_error_cmp(l2t5_rst_fatal_error_cmp),
  .l2t4_rst_fatal_error_cmp(l2t4_rst_fatal_error_cmp),
  .l2t3_rst_fatal_error_cmp(l2t3_rst_fatal_error_cmp),
  .l2t2_rst_fatal_error_cmp(l2t2_rst_fatal_error_cmp),
  .l2t1_rst_fatal_error_cmp(l2t1_rst_fatal_error_cmp),
  .l2t0_rst_fatal_error_cmp(l2t0_rst_fatal_error_cmp),
  .pwron_rst_h_scan_mode_en(pwron_rst_h_scan_mode_en),
  .rst_tcu_dbr_gen(rst_tcu_dbr_gen),
  .rst_rst_pwron_rst_l_sys2_(rst_rst_pwron_rst_l_sys2_),
  .rst_tcu_pwron_rst_l(rst_tcu_pwron_rst_l),
  .rst_rst_pwron_rst_l_io0_(rst_rst_pwron_rst_l_io0_),
  .mio_rst_pb_rst_sys_(mio_rst_pb_rst_sys_),
  .mio_rst_pb_rst_sys2_(mio_rst_pb_rst_sys2_),
  .rst_rst_por_sys2_(rst_rst_por_sys2_),
  .rst_rst_por_io0_(rst_rst_por_io0_),
  .rst_rst_wmr_sys2_(rst_rst_wmr_sys2_),
  .rst_rst_wmr_io0_(rst_rst_wmr_io0_) // Assign stmt.
//.rst_tcu_clk_stop_io  (rst_tcu_clk_stop_io  ) // Implicit SunV connect.
//.pwron_rst_h_scan_mode_en
//                      (pwron_rst_h_scan_mode_en  ),// Implicit SunV connect.
//.tcu_rst_asicflush_stop_ack                        // Implicit SunV connect.
//                      (tcu_rst_asicflush_stop_ack),// Implicit SunV connect.
//                      (1'b1                      ),// Until tcu drives.
//.rst_rst_por_sys2_    (rst_rst_por_sys2_    ),// Implicit SunV connect.
//.rst_rst_wmr_sys2_    (rst_rst_wmr_sys2_    ),// Implicit SunV connect.
                                                // Was ucb_clr_sys2_.
//.rst_rst_wmr_io_      (rst_rst_wmr_io_      ) // Implicit SunV connect.
                                                // Was ucb_clr_io_.
                                               );
//________________________________________________________________

rst_io_ctl              rst_io_ctl             (
  .scan_in(rst_io_ctl_scanin),
  .scan_out(rst_io_ctl_scanout),
  .rst_aclk             (tcu_aclk_gen         ),// Called rst_ here...
  .rst_bclk             (tcu_bclk_gen         ),// to allow assign stmt.
//.rst_scan_en          (tcu_scan_en          ),// Assign stmt.
                                                // Don't protect from flush,
                                                // so pass tcu_scan_en.
//.rst_rst_por_io_      (rst_rst_por_io_      ),// 
//.rst_rst_wmr_io_      (rst_rst_wmr_io_      ),// BP 8-22-05 Was ucb_clr_io_.
  // Should add:        (rst_rst_wmr_io2_     ),// BP 8-22-05
  .tcu_pce_ov           (tcu_pce_ov_gen       ),// (No assign needed.)
  .rst_clk_stop         (1'b0                 ),
  .iol2clk(iol2clk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_rst_scan_mode(tcu_rst_scan_mode),
  .rst_rst_por_io0_(rst_rst_por_io0_),
  .rst_rst_wmr_io0_(rst_rst_wmr_io0_),
  .rd_req_vld(rd_req_vld),
  .wr_req_vld(wr_req_vld),
  .req_acpted_cmp2(req_acpted_cmp2),
  .rd_ack_vld_cmp2(rd_ack_vld_cmp2),
  .rd_nack_vld_cmp2(rd_nack_vld_cmp2),
  .addr_in(addr_in[39:0]),
  .data_in(data_in[63:0]),
  .thr_id_in(thr_id_in[5:0]),
  .buf_id_in(buf_id_in[1:0]),
  .ack_busy(ack_busy),
  .data_out_cmp2(data_out_cmp2[15:0]),
  .thr_id_out_cmp2(thr_id_out_cmp2[5:0]),
  .buf_id_out_cmp2(buf_id_out_cmp2[1:0]),
  .rst_ncu_unpark_thread_cmp2(rst_ncu_unpark_thread_cmp2),
  .rst_ncu_xir_cmp2_(rst_ncu_xir_cmp2_),
  .ncu_rst_xir_done(ncu_rst_xir_done),
  .ccu_rst_change(ccu_rst_change),
  .l2t0_rst_fatal_error(l2t0_rst_fatal_error),
  .l2t1_rst_fatal_error(l2t1_rst_fatal_error),
  .l2t2_rst_fatal_error(l2t2_rst_fatal_error),
  .l2t3_rst_fatal_error(l2t3_rst_fatal_error),
  .l2t4_rst_fatal_error(l2t4_rst_fatal_error),
  .l2t5_rst_fatal_error(l2t5_rst_fatal_error),
  .l2t6_rst_fatal_error(l2t6_rst_fatal_error),
  .l2t7_rst_fatal_error(l2t7_rst_fatal_error),
  .ncu_rst_fatal_error(ncu_rst_fatal_error),
  .tcu_test_protect(tcu_test_protect),
  .rst_mcu_selfrsh_cmp2(rst_mcu_selfrsh_cmp2),
  .rst_rst_pwron_rst_l_io0_(rst_rst_pwron_rst_l_io0_),
  .rd_req_vld_io(rd_req_vld_io),
  .wr_req_vld_io(wr_req_vld_io),
  .req_acpted(req_acpted),
  .rd_ack_vld(rd_ack_vld),
  .rd_nack_vld(rd_nack_vld),
  .addr_in_io(addr_in_io[39:0]),
  .data_in_io(data_in_io[15:0]),
  .thr_id_in_io(thr_id_in_io[5:0]),
  .buf_id_in_io(buf_id_in_io[1:0]),
  .ack_busy_io(ack_busy_io),
  .data_out(data_out[63:0]),
  .thr_id_out(thr_id_out[5:0]),
  .buf_id_out(buf_id_out[1:0]),
  .rst_ncu_unpark_thread(rst_ncu_unpark_thread),
  .rst_ncu_xir_(rst_ncu_xir_),
  .ncu_rst_xir_done_io(ncu_rst_xir_done_io),
  .ccu_rst_change_io(ccu_rst_change_io),
  .l2ta_rst_fatal_error_io(l2ta_rst_fatal_error_io[7:0]),
  .ncu_rst_fatal_error_io(ncu_rst_fatal_error_io),
  .tcu_test_protect_io(tcu_test_protect_io),
  .rst_rst_wmr_io_(rst_rst_wmr_io_),
  .rst_mcu_selfrsh(rst_mcu_selfrsh) // Assign stmt.
                                               );
//________________________________________________________________

// The following three lines used to be in rst.sv:
//
// rst_fsm_ctl(.scan_out(rst_fsm_ctl_scanout), ...
// assign rst_ucbflow_ctl_scanin    = tcu_rst_scan_mode ? rst_fsm_ctl_scanout
//                                                   : 1'b0 ;
// moved that logic to rst_fsm_ctl.sv, Mar 2 '05.
// .scan_out            output port replaced by:
// .rst_fsm_ctl_scanout output port, which has the
//                      tcu_rst_scan_mode logic already performed.
// Now, in rst.sv:
// rst_fsm_ctl(.rst_fsm_ctl_scanout(rst_fsm_ctl_scanout), ...
// assign rst_ucbflow_ctl_scanin    =                     rst_fsm_ctl_scanout;

// assign rst_ucbflow_ctl_scanin    = tcu_rst_scan_mode ? rst_fsm_ctl_scanout
//                                                      : 1'b0; (See above.)
// fixscan start:
assign clkgen_rst_cmp_scanin     = scan_in                  ;
assign clkgen_rst_io_scanin      = clkgen_rst_cmp_scanout   ;
assign rst_fsm_ctl_scanin        = clkgen_rst_io_scanout    ;
assign rst_ucbflow_ctl_scanin    = rst_fsm_ctl_scanout      ;
assign rst_cmp_ctl_scanin        = rst_ucbflow_ctl_scanout  ;
assign rst_io_ctl_scanin         = rst_cmp_ctl_scanout      ;
assign scan_out                  = rst_io_ctl_scanout       ;
// fixscan end:
endmodule // rst

