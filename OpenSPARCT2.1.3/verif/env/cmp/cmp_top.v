// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cmp_top.v
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
module tb_top;

`include "cpu.h"
`include "cmp.vh"

  // Global registers & values
  reg [63:0] finished_tids ;
  integer last_act_cycle ;
  integer th_last_act_cycle[63:0];

	wire	[63:0]	gOutOfBoot;		// Vera Interface signal. Vera drives.

  // Other signals
  reg SystemClock ;
  reg reset;
  reg arst;

  // I/O to DUT

  // Outputs from L2 BFMs to LDST_sync
`ifdef NOL2RTL
  wire [39:0]  b0_cpx_pa;
  wire [145:0] b0_cpx_pkt;
  wire [39:0]  b1_cpx_pa;
  wire [145:0] b1_cpx_pkt;
  wire [39:0]  b2_cpx_pa;
  wire [145:0] b2_cpx_pkt;
  wire [39:0]  b3_cpx_pa;
  wire [145:0] b3_cpx_pkt;
  wire [39:0]  b4_cpx_pa;
  wire [145:0] b4_cpx_pkt;
  wire [39:0]  b5_cpx_pa;
  wire [145:0] b5_cpx_pkt;
  wire [39:0]  b6_cpx_pa;
  wire [145:0] b6_cpx_pkt;
  wire [39:0]  b7_cpx_pa;
  wire [145:0] b7_cpx_pkt;
  wire [2:0]   b0_cpx_cid;
  wire         b0_cpx_ctrue;
  wire         b0_cpx_swap;
  wire [2:0]   b1_cpx_cid;
  wire         b1_cpx_ctrue;
  wire         b1_cpx_swap;
  wire [2:0]   b2_cpx_cid;
  wire         b2_cpx_ctrue;
  wire         b2_cpx_swap;
  wire [2:0]   b3_cpx_cid;
  wire         b3_cpx_ctrue;
  wire         b3_cpx_swap;
  wire [2:0]   b4_cpx_cid;
  wire         b4_cpx_ctrue;
  wire         b4_cpx_swap;
  wire [2:0]   b5_cpx_cid;
  wire         b5_cpx_ctrue;
  wire         b5_cpx_swap;
  wire [2:0]   b6_cpx_cid;
  wire         b6_cpx_ctrue;
  wire         b6_cpx_swap;
  wire [2:0]   b7_cpx_cid;
  wire         b7_cpx_ctrue;
  wire         b7_cpx_swap;
`endif
  // for NCU BFM, always present
  wire [39:0]  b8_cpx_pa;
  wire [145:0] b8_cpx_pkt;
  wire [2:0]   b8_cpx_cid;
  wire         b8_cpx_ctrue;
  wire         b8_cpx_swap;

  reg ccu_slow_cmp_sync_en;
  reg ccu_cmp_slow_sync_en;
  integer rand_sync_en_skew;
  integer sync_en_delay;
  reg [31:0]   rand32;
  integer      half_period;

  // debug, remove
//   wire [1:0] count0;
//   wire [1:0] count1;
//   wire [1:0] count2;
//   wire [1:0] count3;
//   wire [1:0] count4;
//   wire [1:0] count5;
//   wire [1:0] count6;
//   wire [1:0] count7;

  // error/warn count tasks and integers and plusargs
  `include "errorCountTasks.v"

  // handle thread enables and all CMP register details
  `include "cmp_tasks.v"

  // initial values
  initial begin
    finished_tids = 0;
    last_act_cycle = 0;
    cmp_core_running_rw = 64'h0;
    
  end




  //----------------------------------------------------------
  // Clock Generator
  //

  initial begin
    // This is needed to prevent an X->0|1 edge at time zero.
    // See VCS manual "Time Zero Race Conditions" for info.   
    SystemClock = 1'bx;
    #1  SystemClock = 0;
    #49 SystemClock = 1;
    SystemClock = 1'b0;
    half_period = `TOP.core_period/2;

    // core_period is defined in misc_tasks.v
    forever begin
        #(half_period)
        SystemClock = ~SystemClock;
    end
  end

  assign `CPU.ccu_cmp_io_sync_en = ccu_slow_cmp_sync_en;
  assign `CPU.ccu_io_cmp_sync_en = ccu_cmp_slow_sync_en;
  initial begin
    // This is needed to prevent an X->0|1 edge at time zero.
    // See VCS manual "Time Zero Race Conditions" for info.
    ccu_slow_cmp_sync_en = 1'bx;
    ccu_cmp_slow_sync_en = 1'bx;
    #1 
    ccu_slow_cmp_sync_en = 0;
    ccu_cmp_slow_sync_en = 0;
    @(posedge tb_top.cpu.cmp_gclk_c3_spc0);
    rand32 = $random(`PARGS.seed);
    repeat (rand32[17:16]) @(posedge tb_top.cpu.cmp_gclk_c3_spc0);
    rand_sync_en_skew = rand32[28:25] + 10;     sync_en_delay = `TOP.core_period;
    #rand_sync_en_skew
    ccu_slow_cmp_sync_en = 1;
    forever begin
      #sync_en_delay
      ccu_slow_cmp_sync_en = 0;
      #sync_en_delay
      ccu_cmp_slow_sync_en = 1;
      #sync_en_delay
      ccu_cmp_slow_sync_en = 0;
      #sync_en_delay
      ccu_slow_cmp_sync_en = 1;
    end
  end


  initial begin

    // review to enable as needed
//     `ifdef CORE_0 force `CPU.spc0.ncu_spc_l2_idx_hash_en = 0; `endif
//     `ifdef CORE_1 force `CPU.spc1.ncu_spc_l2_idx_hash_en = 0; `endif
//     `ifdef CORE_2 force `CPU.spc2.ncu_spc_l2_idx_hash_en = 0; `endif
//     `ifdef CORE_3 force `CPU.spc3.ncu_spc_l2_idx_hash_en = 0; `endif
//     `ifdef CORE_4 force `CPU.spc4.ncu_spc_l2_idx_hash_en = 0; `endif
//     `ifdef CORE_5 force `CPU.spc5.ncu_spc_l2_idx_hash_en = 0; `endif
//     `ifdef CORE_6 force `CPU.spc6.ncu_spc_l2_idx_hash_en = 0; `endif
//     `ifdef CORE_7 force `CPU.spc7.ncu_spc_l2_idx_hash_en = 0; `endif


    // start reset
    reset = 1'b0;
    arst = 1'b0;
    #1550

    // end reset
    @(negedge SystemClock);
    @(posedge SystemClock) begin
      reset = 1'b1;
      repeat (10) @(posedge SystemClock);
      arst = 1'b1;
      repeat (10) @(posedge SystemClock);
    end // @ SystemClock

  end // initial



// force L2 cache on  
  initial begin

`ifndef NOL2RTL

    while (tb_top.in_reset !== 0 || tb_top.in_reset_core !== 0) #100;
    repeat (2) @(posedge tb_top.cpu.l2clk);
    
// RTL_NO_BNKXX not used by N2, we always build in all banks for N2.
// these defs are always not defined for N2.
`ifndef RTL_NO_BNK01
    force tb_top.cpu.l2t0.csr.arbdat_csr_inst_wr_data_c8[0] = 0;
    force tb_top.cpu.l2t0.csr.csreg_csr_wr_en_c8 = 1;
    force tb_top.cpu.l2t1.csr.arbdat_csr_inst_wr_data_c8[0] = 0;
    force tb_top.cpu.l2t1.csr.csreg_csr_wr_en_c8 = 1;
    @(negedge tb_top.cpu.l2t1.csr.l1clk);
    @(posedge tb_top.cpu.l2t1.csr.l1clk);
    @(negedge tb_top.cpu.l2t1.csr.l1clk);
    release tb_top.cpu.l2t0.csr.arbdat_csr_inst_wr_data_c8[0];
    release tb_top.cpu.l2t0.csr.csreg_csr_wr_en_c8;
    release tb_top.cpu.l2t1.csr.arbdat_csr_inst_wr_data_c8[0];
    release tb_top.cpu.l2t1.csr.csreg_csr_wr_en_c8;
`endif
`ifndef RTL_NO_BNK23
    force tb_top.cpu.l2t2.csr.arbdat_csr_inst_wr_data_c8[0] = 0;
    force tb_top.cpu.l2t2.csr.csreg_csr_wr_en_c8 = 1;
    force tb_top.cpu.l2t3.csr.arbdat_csr_inst_wr_data_c8[0] = 0;
    force tb_top.cpu.l2t3.csr.csreg_csr_wr_en_c8 = 1;
    @(negedge tb_top.cpu.l2t2.csr.l1clk);
    @(posedge tb_top.cpu.l2t2.csr.l1clk);
    @(negedge tb_top.cpu.l2t2.csr.l1clk);
    release tb_top.cpu.l2t2.csr.arbdat_csr_inst_wr_data_c8[0];
    release tb_top.cpu.l2t2.csr.csreg_csr_wr_en_c8;
    release tb_top.cpu.l2t3.csr.arbdat_csr_inst_wr_data_c8[0];
    release tb_top.cpu.l2t3.csr.csreg_csr_wr_en_c8;
`endif
`ifndef RTL_NO_BNK45
    force tb_top.cpu.l2t4.csr.arbdat_csr_inst_wr_data_c8[0] = 0;
    force tb_top.cpu.l2t4.csr.csreg_csr_wr_en_c8 = 1;
    force tb_top.cpu.l2t5.csr.arbdat_csr_inst_wr_data_c8[0] = 0;
    force tb_top.cpu.l2t5.csr.csreg_csr_wr_en_c8 = 1;
    @(negedge tb_top.cpu.l2t4.csr.l1clk);
    @(posedge tb_top.cpu.l2t4.csr.l1clk);
    @(negedge tb_top.cpu.l2t4.csr.l1clk);
    release tb_top.cpu.l2t4.csr.arbdat_csr_inst_wr_data_c8[0];
    release tb_top.cpu.l2t4.csr.csreg_csr_wr_en_c8;
    release tb_top.cpu.l2t5.csr.arbdat_csr_inst_wr_data_c8[0];
    release tb_top.cpu.l2t5.csr.csreg_csr_wr_en_c8;
`endif
`ifndef RTL_NO_BNK67
    force tb_top.cpu.l2t6.csr.arbdat_csr_inst_wr_data_c8[0] = 0;
    force tb_top.cpu.l2t6.csr.csreg_csr_wr_en_c8 = 1;
    force tb_top.cpu.l2t7.csr.arbdat_csr_inst_wr_data_c8[0] = 0;
    force tb_top.cpu.l2t7.csr.csreg_csr_wr_en_c8 = 1;
    @(negedge tb_top.cpu.l2t6.csr.l1clk);
    @(posedge tb_top.cpu.l2t6.csr.l1clk);
    @(negedge tb_top.cpu.l2t6.csr.l1clk);
    release tb_top.cpu.l2t6.csr.arbdat_csr_inst_wr_data_c8[0];
    release tb_top.cpu.l2t6.csr.csreg_csr_wr_en_c8;
    release tb_top.cpu.l2t7.csr.arbdat_csr_inst_wr_data_c8[0];
    release tb_top.cpu.l2t7.csr.csreg_csr_wr_en_c8;
`endif

`endif
  end // initial
  
  initial begin
    // Partial bank modes...
    // these are after time 0 and over-ride time 0 forces
    // based on missing cache banks or dissabled banks.
    // bank_set_mask should be consistant with any missing banks
    // that are not built in by use of RTL_NO_BNKxx defines.

    #0 // wait for plus arg processing to complete.
    if (`PARGS.bank_set_mask) begin
      force `CPU.ncu_spc_pm = 1;
      force `CPU.ncu_l2t_pm = 1;
      force `CPU.ncu_sii_pm = 1;
      force `CPU.ncu_mcu_pm = 1;
      force `CPU.ncu_spc_ba01 = `PARGS.bank_set_mask[0];
      force `CPU.ncu_spc_ba23 = `PARGS.bank_set_mask[1];
      force `CPU.ncu_spc_ba45 = `PARGS.bank_set_mask[2];
      force `CPU.ncu_spc_ba67 = `PARGS.bank_set_mask[3];
      force `CPU.ncu_l2t_ba01 = `PARGS.bank_set_mask[0];
      force `CPU.ncu_l2t_ba23 = `PARGS.bank_set_mask[1];
      force `CPU.ncu_l2t_ba45 = `PARGS.bank_set_mask[2];
      force `CPU.ncu_l2t_ba67 = `PARGS.bank_set_mask[3];
      force `CPU.ncu_sii_ba01 = `PARGS.bank_set_mask[0];
      force `CPU.ncu_sii_ba23 = `PARGS.bank_set_mask[1];
      force `CPU.ncu_sii_ba45 = `PARGS.bank_set_mask[2];
      force `CPU.ncu_sii_ba67 = `PARGS.bank_set_mask[3];
      force `CPU.ncu_mcu_ba01 = `PARGS.bank_set_mask[0];
      force `CPU.ncu_mcu_ba23 = `PARGS.bank_set_mask[1];
      force `CPU.ncu_mcu_ba45 = `PARGS.bank_set_mask[2];
      force `CPU.ncu_mcu_ba67 = `PARGS.bank_set_mask[3];
    end

  end // initial




  //----------------------------------------------------------
  // Bench Code Instantiation


  // +args and the vars they set.
  // use `PARGS.var to get value
  // +args should be processed first so other initial blocks can use
  // the values. Any initial block that uses `PARGS.var should have a #0 first.
  //
  // defines globals and inits them first.
  // has an initial block that reads +args and sets some values.
  verif_args verif_args();

  nas_top nas_top ();

  `ifdef CORE_0 nas_probes0 intf0(); `endif
  `ifdef CORE_1 nas_probes1 intf1(); `endif
  `ifdef CORE_2 nas_probes2 intf2(); `endif
  `ifdef CORE_3 nas_probes3 intf3(); `endif
  `ifdef CORE_4 nas_probes4 intf4(); `endif
  `ifdef CORE_5 nas_probes5 intf5(); `endif
  `ifdef CORE_6 nas_probes6 intf6(); `endif
  `ifdef CORE_7 nas_probes7 intf7(); `endif

  tlb_sync tlb_sync ();

  ldst_sync ldst_sync ();

  int_sync  int_sync ();

  err_sync  err_sync ();

  reg_slam  reg_slam ();

  monitors monitors ();

  l2_scrub l2_scrub ();

  //----------------------------------------------------------
  // Device Under Test
  //

  cpu cpu ();

  // clocks

  assign cmp_gclk_c3_spc0 = SystemClock;  // cmp_gclk_c1_r[1])
  assign cmp_gclk_c3_spc1 = SystemClock;
  assign cmp_gclk_c3_spc2 = SystemClock;
  assign cmp_gclk_c3_spc3 = SystemClock;
  assign cmp_gclk_c3_spc4 = SystemClock;
  assign cmp_gclk_c3_spc5 = SystemClock;
  assign cmp_gclk_c3_spc6 = SystemClock;
  assign cmp_gclk_c3_spc7 = SystemClock;
  assign gl_spc0_clk_stop = 0;
  assign gl_spc1_clk_stop = 0;
  assign gl_spc2_clk_stop = 0;
  assign gl_spc3_clk_stop = 0;
  assign gl_spc4_clk_stop = 0;
  assign gl_spc5_clk_stop = 0;
  assign gl_spc6_clk_stop = 0;
  assign gl_spc7_clk_stop = 0;

  assign cmp_gclk_c2_ccx_left = SystemClock;
  assign cmp_gclk_c2_ccx_right = SystemClock;
  assign gl_ccx_clk_stop_left = 0;
  assign gl_ccx_clk_stop_right = 0;

  assign cmp_gclk_c3_l2d0 = SystemClock;
  assign cmp_gclk_c3_l2d1 = SystemClock;
  assign cmp_gclk_c3_l2d2 = SystemClock;
  assign cmp_gclk_c3_l2d3 = SystemClock;
  assign cmp_gclk_c3_l2d4 = SystemClock;
  assign cmp_gclk_c3_l2d5 = SystemClock;
  assign cmp_gclk_c3_l2d6 = SystemClock;
  assign cmp_gclk_c3_l2d7 = SystemClock;

  assign gl_l2d0_clk_stop = 0;
  assign gl_l2d1_clk_stop = 0;
  assign gl_l2d2_clk_stop = 0;
  assign gl_l2d3_clk_stop = 0;
  assign gl_l2d4_clk_stop = 0;
  assign gl_l2d5_clk_stop = 0;
  assign gl_l2d6_clk_stop = 0;
  assign gl_l2d7_clk_stop = 0;

  assign cmp_gclk_c3_l2t0 = SystemClock;
  assign cmp_gclk_c3_l2t1 = SystemClock;
  assign cmp_gclk_c3_l2t2 = SystemClock;
  assign cmp_gclk_c3_l2t3 = SystemClock;
  assign cmp_gclk_c3_l2t4 = SystemClock;
  assign cmp_gclk_c3_l2t5 = SystemClock;
  assign cmp_gclk_c3_l2t6 = SystemClock;
  assign cmp_gclk_c3_l2t7 = SystemClock;

  assign gl_l2t0_clk_stop = 0;
  assign gl_l2t1_clk_stop = 0;
  assign gl_l2t2_clk_stop = 0;
  assign gl_l2t3_clk_stop = 0;
  assign gl_l2t4_clk_stop = 0;
  assign gl_l2t5_clk_stop = 0;
  assign gl_l2t6_clk_stop = 0;
  assign gl_l2t7_clk_stop = 0;

  assign `CPU.l2clk = SystemClock;
  //assign `CPU.efu_ncu_fuse_clk1 = SystemClock;



  // Force outputs of Vera to 0,1 when driven to Z - NCU interface
  // need !!!
  assign (weak0, weak1) `CPU.ncu_cpx_req_cq = 8'b0;
  assign (weak0, weak1) `CPU.ncu_cpx_data_ca = 146'b0;
  assign (weak0, weak1) `CPU.ncu_pcx_stall_pq = 1'b0;

  // for time zero, CCX inputs from vera BFMs
  // vera drives later
`ifdef NOL2RTL
  assign (weak0, weak1) `CPU.sctag0_cpx_atom_cq = 0;
  assign (weak0, weak1) `CPU.sctag0_cpx_req_cq = 0;
  assign (weak0, weak1) `CPU.sctag0_cpx_data_ca = 0;
  assign (weak0, weak1) `CPU.sctag0_pcx_stall_pq = 0;
  assign (weak0, weak1) `CPU.sctag1_cpx_atom_cq = 0;
  assign (weak0, weak1) `CPU.sctag1_cpx_req_cq = 0;
  assign (weak0, weak1) `CPU.sctag1_cpx_data_ca = 0;
  assign (weak0, weak1) `CPU.sctag1_pcx_stall_pq = 0;
  assign (weak0, weak1) `CPU.sctag2_cpx_atom_cq = 0;
  assign (weak0, weak1) `CPU.sctag2_cpx_req_cq = 0;
  assign (weak0, weak1) `CPU.sctag2_cpx_data_ca = 0;
  assign (weak0, weak1) `CPU.sctag2_pcx_stall_pq = 0;
  assign (weak0, weak1) `CPU.sctag3_cpx_atom_cq = 0;
  assign (weak0, weak1) `CPU.sctag3_cpx_req_cq = 0;
  assign (weak0, weak1) `CPU.sctag3_cpx_data_ca = 0;
  assign (weak0, weak1) `CPU.sctag3_pcx_stall_pq = 0;
  assign (weak0, weak1) `CPU.sctag4_cpx_atom_cq = 0;
  assign (weak0, weak1) `CPU.sctag4_cpx_req_cq = 0;
  assign (weak0, weak1) `CPU.sctag4_cpx_data_ca = 0;
  assign (weak0, weak1) `CPU.sctag4_pcx_stall_pq = 0;
  assign (weak0, weak1) `CPU.sctag5_cpx_atom_cq = 0;
  assign (weak0, weak1) `CPU.sctag5_cpx_req_cq = 0;
  assign (weak0, weak1) `CPU.sctag5_cpx_data_ca = 0;
  assign (weak0, weak1) `CPU.sctag5_pcx_stall_pq = 0;
  assign (weak0, weak1) `CPU.sctag6_cpx_atom_cq = 0;
  assign (weak0, weak1) `CPU.sctag6_cpx_req_cq = 0;
  assign (weak0, weak1) `CPU.sctag6_cpx_data_ca = 0;
  assign (weak0, weak1) `CPU.sctag6_pcx_stall_pq = 0;
  assign (weak0, weak1) `CPU.sctag7_cpx_atom_cq = 0;
  assign (weak0, weak1) `CPU.sctag7_cpx_req_cq = 0;
  assign (weak0, weak1) `CPU.sctag7_cpx_data_ca = 0;
  assign (weak0, weak1) `CPU.sctag7_pcx_stall_pq = 0;
`endif



// missing core inputs to CCX. Should be done in cpu.sv but is not.
`ifndef CORE_0
  assign (weak0, weak1) `CPU.spc0_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc0_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc0_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_1
  assign (weak0, weak1) `CPU.spc1_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc1_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc1_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_2
  assign (weak0, weak1) `CPU.spc2_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc2_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc2_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_3
  assign (weak0, weak1) `CPU.spc3_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc3_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc3_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_4
  assign (weak0, weak1) `CPU.spc4_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc4_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc4_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_5
  assign (weak0, weak1) `CPU.spc5_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc5_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc5_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_6
  assign (weak0, weak1) `CPU.spc6_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc6_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc6_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_7
  assign (weak0, weak1) `CPU.spc7_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc7_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc7_pcx_atm_pq = 9'b0;
`endif



  // all forces at time 0
  initial begin


  // L2
  // RTL_NO_BNKXX not used by N2, we always build in all banks for N2.
  // these defs are always not defined for N2.

// `ifdef NOL2RTL
// `else
// `ifndef RTL_NO_BNK01
//     force `CPU.l2d0_efu_fuse_data = 1'b0;
//     force `CPU.l2d1_efu_fuse_data = 1'b0;
// `endif
// `ifndef RTL_NO_BNK23
//     force `CPU.l2d2_efu_fuse_data = 1'b0;
//     force `CPU.l2d3_efu_fuse_data = 1'b0;
// `endif
// `ifndef RTL_NO_BNK45
//     force `CPU.l2d4_efu_fuse_data = 1'b0;
//     force `CPU.l2d5_efu_fuse_data = 1'b0;
// `endif
// `ifndef RTL_NO_BNK67
//     force `CPU.l2d6_efu_fuse_data = 1'b0;
//     force `CPU.l2d7_efu_fuse_data = 1'b0;
// `endif
// `endif


    force `CPU.rst_l2_por_ = arst;
    force `CPU.rst_l2_wmr_ = reset;

    force `CPU.rst_wmr_protect = 0;
//     force `CPU.l2b0_l2d0_fuse_clr = 0;
//     force `CPU.l2b1_l2d1_fuse_clr = 0;
//     force `CPU.l2b2_l2d2_fuse_clr = 0;
//     force `CPU.l2b3_l2d3_fuse_clr = 0;
//     force `CPU.l2b4_l2d4_fuse_clr = 0;
//     force `CPU.l2b5_l2d5_fuse_clr = 0;
//     force `CPU.l2b6_l2d6_fuse_clr = 0;
//     force `CPU.l2b7_l2d7_fuse_clr = 0;
//     force `CPU.efu_l2t0_fuse_clr = 0;
//     force `CPU.efu_l2t1_fuse_clr = 0;
//     force `CPU.efu_l2t2_fuse_clr = 0;
//     force `CPU.efu_l2t3_fuse_clr = 0;
//     force `CPU.efu_l2t4_fuse_clr = 0;
//     force `CPU.efu_l2t5_fuse_clr = 0;
//     force `CPU.efu_l2t6_fuse_clr = 0;
//     force `CPU.efu_l2t7_fuse_clr = 0;
//     force `CPU.efu_l2b0_fuse_clr = 0;
//     force `CPU.efu_l2b1_fuse_clr = 0;
//     force `CPU.efu_l2b2_fuse_clr = 0;
//     force `CPU.efu_l2b3_fuse_clr = 0;
//     force `CPU.efu_l2b4_fuse_clr = 0;
//     force `CPU.efu_l2b5_fuse_clr = 0;
//     force `CPU.efu_l2b6_fuse_clr = 0;
//     force `CPU.efu_l2b7_fuse_clr = 0;

// force `CPU.l2t0.efu_l2t_fuse_clr = 0; 
// force `CPU.l2t0.efu_l2t_fuse_xfer_en = 0;
// force `CPU.l2t0.efu_l2t_fuse_data = 0;
// force `CPU.l2t1.efu_l2t_fuse_clr = 0; 
// force `CPU.l2t1.efu_l2t_fuse_xfer_en = 0;
// force `CPU.l2t1.efu_l2t_fuse_data = 0;
// force `CPU.l2t2.efu_l2t_fuse_clr = 0; 
// force `CPU.l2t2.efu_l2t_fuse_xfer_en = 0;
// force `CPU.l2t2.efu_l2t_fuse_data = 0;
// force `CPU.l2t3.efu_l2t_fuse_clr = 0; 
// force `CPU.l2t3.efu_l2t_fuse_xfer_en = 0;
// force `CPU.l2t3.efu_l2t_fuse_data = 0;
// force `CPU.l2t4.efu_l2t_fuse_clr = 0; 
// force `CPU.l2t4.efu_l2t_fuse_xfer_en = 0;
// force `CPU.l2t4.efu_l2t_fuse_data = 0;
// force `CPU.l2t5.efu_l2t_fuse_clr = 0; 
// force `CPU.l2t5.efu_l2t_fuse_xfer_en = 0;
// force `CPU.l2t5.efu_l2t_fuse_data = 0;
// force `CPU.l2t6.efu_l2t_fuse_clr = 0; 
// force `CPU.l2t6.efu_l2t_fuse_xfer_en = 0;
// force `CPU.l2t6.efu_l2t_fuse_data = 0;
// force `CPU.l2t7.efu_l2t_fuse_clr = 0; 
// force `CPU.l2t7.efu_l2t_fuse_xfer_en = 0;
// force `CPU.l2t7.efu_l2t_fuse_data = 0;
// 
// force `CPU.l2t0.l2t_tag_fuse_clr = 0;
// force `CPU.l2t1.l2t_tag_fuse_clr = 0;
// force `CPU.l2t2.l2t_tag_fuse_clr = 0;
// force `CPU.l2t3.l2t_tag_fuse_clr = 0;
// force `CPU.l2t4.l2t_tag_fuse_clr = 0;
// force `CPU.l2t5.l2t_tag_fuse_clr = 0;
// force `CPU.l2t6.l2t_tag_fuse_clr = 0;
// force `CPU.l2t7.l2t_tag_fuse_clr = 0;
// 
// force `CPU.l2t0.mux_drive_disable = 0;
// force `CPU.l2t1.mux_drive_disable = 0;
// force `CPU.l2t2.mux_drive_disable = 0;
// force `CPU.l2t3.mux_drive_disable = 0;
// force `CPU.l2t4.mux_drive_disable = 0;
// force `CPU.l2t5.mux_drive_disable = 0;
// force `CPU.l2t6.mux_drive_disable = 0;
// force `CPU.l2t7.mux_drive_disable = 0;
// 
// force `CPU.l2t0.l2t_fuse_repair_en[1:0] = 0;
// force `CPU.l2t1.l2t_fuse_repair_en[1:0] = 0;
// force `CPU.l2t2.l2t_fuse_repair_en[1:0] = 0;
// force `CPU.l2t3.l2t_fuse_repair_en[1:0] = 0;
// force `CPU.l2t4.l2t_fuse_repair_en[1:0] = 0;
// force `CPU.l2t5.l2t_fuse_repair_en[1:0] = 0;
// force `CPU.l2t6.l2t_fuse_repair_en[1:0] = 0;
// force `CPU.l2t7.l2t_fuse_repair_en[1:0] = 0;
// 
// force `CPU.l2t0.fuse_l2t_wren = 0;
// force `CPU.l2t1.fuse_l2t_wren = 0;
// force `CPU.l2t2.fuse_l2t_wren = 0;
// force `CPU.l2t3.fuse_l2t_wren = 0;
// force `CPU.l2t4.fuse_l2t_wren = 0;
// force `CPU.l2t5.fuse_l2t_wren = 0;
// force `CPU.l2t6.fuse_l2t_wren = 0;
// force `CPU.l2t7.fuse_l2t_wren = 0;
// 
// force `CPU.l2t0.rdmat_sii_req_vld_buf = 0;
// force `CPU.l2t1.rdmat_sii_req_vld_buf = 0;
// force `CPU.l2t2.rdmat_sii_req_vld_buf = 0;
// force `CPU.l2t3.rdmat_sii_req_vld_buf = 0;
// force `CPU.l2t4.rdmat_sii_req_vld_buf = 0;
// force `CPU.l2t5.rdmat_sii_req_vld_buf = 0;
// force `CPU.l2t6.rdmat_sii_req_vld_buf = 0;
// force `CPU.l2t7.rdmat_sii_req_vld_buf = 0;
// 
// 
// force `CPU.l2b0.l2b_l2d_fuse_clr = 0;
// force `CPU.l2b1.l2b_l2d_fuse_clr = 0;
// force `CPU.l2b2.l2b_l2d_fuse_clr = 0;
// force `CPU.l2b3.l2b_l2d_fuse_clr = 0;
// force `CPU.l2b4.l2b_l2d_fuse_clr = 0;
// force `CPU.l2b5.l2b_l2d_fuse_clr = 0;
// force `CPU.l2b6.l2b_l2d_fuse_clr = 0;
// force `CPU.l2b7.l2b_l2d_fuse_clr = 0;
// 
// force `CPU.l2b0.efu_l2b_fuse_clr = 0;
// force `CPU.l2b1.efu_l2b_fuse_clr = 0;
// force `CPU.l2b2.efu_l2b_fuse_clr = 0;
// force `CPU.l2b3.efu_l2b_fuse_clr = 0;
// force `CPU.l2b4.efu_l2b_fuse_clr = 0;
// force `CPU.l2b5.efu_l2b_fuse_clr = 0;
// force `CPU.l2b6.efu_l2b_fuse_clr = 0;
// force `CPU.l2b7.efu_l2b_fuse_clr = 0;
// 
// force `CPU.l2b0.efu_l2b_fuse_data = 0;
// force `CPU.l2b1.efu_l2b_fuse_data = 0;
// force `CPU.l2b2.efu_l2b_fuse_data = 0;
// force `CPU.l2b3.efu_l2b_fuse_data = 0;
// force `CPU.l2b4.efu_l2b_fuse_data = 0;
// force `CPU.l2b5.efu_l2b_fuse_data = 0;
// force `CPU.l2b6.efu_l2b_fuse_data = 0;
// force `CPU.l2b7.efu_l2b_fuse_data = 0;
// 
// force `CPU.l2b0.efu_l2b_fuse_xfer_en = 0;
// force `CPU.l2b1.efu_l2b_fuse_xfer_en = 0;
// force `CPU.l2b2.efu_l2b_fuse_xfer_en = 0;
// force `CPU.l2b3.efu_l2b_fuse_xfer_en = 0;
// force `CPU.l2b4.efu_l2b_fuse_xfer_en = 0;
// force `CPU.l2b5.efu_l2b_fuse_xfer_en = 0;
// force `CPU.l2b6.efu_l2b_fuse_xfer_en = 0;
// force `CPU.l2b7.efu_l2b_fuse_xfer_en = 0;

    // initial partial bank values
    force `CPU.ncu_spc_pm = 0;
    force `CPU.ncu_l2t_pm = 0;
    force `CPU.ncu_sii_pm = 0;
    force `CPU.ncu_mcu_pm = 0;
    force `CPU.ncu_spc_ba01 = 1;
    force `CPU.ncu_spc_ba23 = 1;
    force `CPU.ncu_spc_ba45 = 1;
    force `CPU.ncu_spc_ba67 = 1;
    force `CPU.ncu_l2t_ba01 = 1;
    force `CPU.ncu_l2t_ba23 = 1;
    force `CPU.ncu_l2t_ba45 = 1;
    force `CPU.ncu_l2t_ba67 = 1;
    force `CPU.ncu_sii_ba01 = 1;
    force `CPU.ncu_sii_ba23 = 1;
    force `CPU.ncu_sii_ba45 = 1;
    force `CPU.ncu_sii_ba67 = 1;
    force `CPU.ncu_mcu_ba01 = 1;
    force `CPU.ncu_mcu_ba23 = 1;
    force `CPU.ncu_mcu_ba45 = 1;
    force `CPU.ncu_mcu_ba67 = 1;


    // if banks are missing, that implies partial bank mode, so...
    // not used by N2, we always build in all banks for N2
`ifdef RTL_NO_BNK01
    force `CPU.ncu_spc_pm = 1;
    force `CPU.ncu_l2t_pm = 1;
    force `CPU.ncu_sii_pm = 1;
    force `CPU.ncu_mcu_pm = 1;
    force `CPU.ncu_spc_ba01 = 0;
    force `CPU.ncu_spc_ba23 = 1;
    force `CPU.ncu_spc_ba45 = 1;
    force `CPU.ncu_spc_ba67 = 1;
    force `CPU.ncu_l2t_ba01 = 0;
    force `CPU.ncu_l2t_ba23 = 1;
    force `CPU.ncu_l2t_ba45 = 1;
    force `CPU.ncu_l2t_ba67 = 1;
    force `CPU.ncu_sii_ba01 = 0;
    force `CPU.ncu_sii_ba23 = 1;
    force `CPU.ncu_sii_ba45 = 1;
    force `CPU.ncu_sii_ba67 = 1;
    force `CPU.ncu_mcu_ba01 = 0;
    force `CPU.ncu_mcu_ba23 = 1;
    force `CPU.ncu_mcu_ba45 = 1;
    force `CPU.ncu_mcu_ba67 = 1;
`endif
`ifdef RTL_NO_BNK23
    force `CPU.ncu_spc_pm = 1;
    force `CPU.ncu_l2t_pm = 1;
    force `CPU.ncu_sii_pm = 1;
    force `CPU.ncu_mcu_pm = 1;
    force `CPU.ncu_spc_ba01 = 1;
    force `CPU.ncu_spc_ba23 = 0;
    force `CPU.ncu_spc_ba45 = 1;
    force `CPU.ncu_spc_ba67 = 1;
    force `CPU.ncu_l2t_ba01 = 1;
    force `CPU.ncu_l2t_ba23 = 0;
    force `CPU.ncu_l2t_ba45 = 1;
    force `CPU.ncu_l2t_ba67 = 1;
    force `CPU.ncu_sii_ba01 = 1;
    force `CPU.ncu_sii_ba23 = 0;
    force `CPU.ncu_sii_ba45 = 1;
    force `CPU.ncu_sii_ba67 = 1;
    force `CPU.ncu_mcu_ba01 = 1;
    force `CPU.ncu_mcu_ba23 = 0;
    force `CPU.ncu_mcu_ba45 = 1;
    force `CPU.ncu_mcu_ba67 = 1;
`endif                                                
`ifdef RTL_NO_BNK45                      
    force `CPU.ncu_spc_pm = 1;
    force `CPU.ncu_l2t_pm = 1;
    force `CPU.ncu_sii_pm = 1;
    force `CPU.ncu_mcu_pm = 1;
    force `CPU.ncu_spc_ba01 = 1;
    force `CPU.ncu_spc_ba23 = 1;
    force `CPU.ncu_spc_ba45 = 0;
    force `CPU.ncu_spc_ba67 = 1;
    force `CPU.ncu_l2t_ba01 = 1;
    force `CPU.ncu_l2t_ba23 = 1;
    force `CPU.ncu_l2t_ba45 = 0;
    force `CPU.ncu_l2t_ba67 = 1;
    force `CPU.ncu_sii_ba01 = 1;
    force `CPU.ncu_sii_ba23 = 1;
    force `CPU.ncu_sii_ba45 = 0;
    force `CPU.ncu_sii_ba67 = 1;
    force `CPU.ncu_mcu_ba01 = 1;
    force `CPU.ncu_mcu_ba23 = 1;
    force `CPU.ncu_mcu_ba45 = 0;
    force `CPU.ncu_mcu_ba67 = 1;
`endif
`ifdef RTL_NO_BNK67
    force `CPU.ncu_spc_pm = 1;
    force `CPU.ncu_l2t_pm = 1;
    force `CPU.ncu_sii_pm = 1;
    force `CPU.ncu_mcu_pm = 1;
    force `CPU.ncu_spc_ba01 = 1;
    force `CPU.ncu_spc_ba23 = 1;
    force `CPU.ncu_spc_ba45 = 1;
    force `CPU.ncu_spc_ba67 = 0;
    force `CPU.ncu_l2t_ba01 = 1;
    force `CPU.ncu_l2t_ba23 = 1;
    force `CPU.ncu_l2t_ba45 = 1;
    force `CPU.ncu_l2t_ba67 = 0;
    force `CPU.ncu_sii_ba01 = 1;
    force `CPU.ncu_sii_ba23 = 1;
    force `CPU.ncu_sii_ba45 = 1;
    force `CPU.ncu_sii_ba67 = 0;
    force `CPU.ncu_mcu_ba01 = 1;
    force `CPU.ncu_mcu_ba23 = 1;
    force `CPU.ncu_mcu_ba45 = 1;
    force `CPU.ncu_mcu_ba67 = 0;
`endif


    // MISC cache bank enable



    // TCU-L2
    // RTL_NO_BNKXX not used by N2, we always build in all banks for N2.
    // these defs are always not defined for N2.
`ifndef RTL_NO_BNK01
    force `CPU.l2b0.scan_in = 0;
    force `CPU.l2b0.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2b0.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2b1.scan_in = 0;
    force `CPU.l2b1.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2b1.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2d0.scan_in = 0;
    force `CPU.l2d0.tcu_clk_stop = 0;
    force `CPU.l2d1.scan_in = 0;
    force `CPU.l2d1.tcu_clk_stop = 0;
    force `CPU.l2t0.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2t0.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2t1.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2t1.tcu_se_scancollar_out = 1'b0;
`endif
`ifndef RTL_NO_BNK23
    force `CPU.l2b2.scan_in = 0;
    force `CPU.l2b2.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2b2.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2b3.scan_in = 0;
    force `CPU.l2b3.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2b3.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2d2.scan_in = 0;
    force `CPU.l2d2.tcu_clk_stop = 0;
    force `CPU.l2d3.scan_in = 0;
    force `CPU.l2d3.tcu_clk_stop = 0;
    force `CPU.l2t2.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2t2.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2t3.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2t3.tcu_se_scancollar_out = 1'b0;
`endif
`ifndef RTL_NO_BNK45
    force `CPU.l2b4.scan_in = 0;
    force `CPU.l2b4.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2b4.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2b5.scan_in = 0;
    force `CPU.l2b5.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2b5.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2d4.scan_in = 0;
    force `CPU.l2d4.tcu_clk_stop = 0;
    force `CPU.l2d5.scan_in = 0;
    force `CPU.l2d5.tcu_clk_stop = 0;
    force `CPU.l2t4.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2t4.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2t5.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2t5.tcu_se_scancollar_out = 1'b0;
`endif
`ifndef RTL_NO_BNK67
    force `CPU.l2b6.scan_in = 0;
    force `CPU.l2b6.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2b6.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2b7.scan_in = 0;
    force `CPU.l2b7.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2b7.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2d6.scan_in = 0;
    force `CPU.l2d6.tcu_clk_stop = 0;
    force `CPU.l2d7.scan_in = 0;
    force `CPU.l2d7.tcu_clk_stop = 0;
    force `CPU.l2t6.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2t6.tcu_se_scancollar_out = 1'b0;
    force `CPU.l2t7.tcu_se_scancollar_in = 1'b0;
    force `CPU.l2t7.tcu_se_scancollar_out = 1'b0;
`endif


    force `CPU.ccx.cpx.cpx_dpa_scanin = 1'b0;
    force `CPU.ccx.scan_in = 0;
    force `CPU.ccx.tcu_aclk = 0;
    force `CPU.ccx.tcu_bclk = 0;
    force `CPU.ccx.tcu_pce_ov = 0;
    force `CPU.ccx.tcu_scan_en = 0;
    force `CPU.rst_ncu_vld = 1'b0;
    force `CPU.sii_l2b0_ecc = 7'b0;
    force `CPU.sii_l2b1_ecc = 7'b0;
    force `CPU.sii_l2b2_ecc = 7'b0;
    force `CPU.sii_l2b3_ecc = 7'b0;
    force `CPU.sii_l2b4_ecc = 7'b0;
    force `CPU.sii_l2b5_ecc = 7'b0;
    force `CPU.sii_l2b6_ecc = 7'b0;
    force `CPU.sii_l2b7_ecc = 7'b0;
    force `CPU.sii_l2t0_req = 32'b0;
    force `CPU.sii_l2t0_req_vld = 1'b0;
    force `CPU.sii_l2t1_req = 32'b0;
    force `CPU.sii_l2t1_req_vld = 1'b0;
    force `CPU.sii_l2t2_req = 32'b0;
    force `CPU.sii_l2t2_req_vld = 1'b0;
    force `CPU.sii_l2t3_req = 32'b0;
    force `CPU.sii_l2t3_req_vld = 1'b0;
    force `CPU.sii_l2t4_req = 32'b0;
    force `CPU.sii_l2t4_req_vld = 1'b0;
    force `CPU.sii_l2t5_req = 32'b0;
    force `CPU.sii_l2t5_req_vld = 1'b0;
    force `CPU.sii_l2t6_req = 32'b0;
    force `CPU.sii_l2t6_req_vld = 1'b0;
    force `CPU.sii_l2t7_req = 32'b0;
    force `CPU.sii_l2t7_req_vld = 1'b0;
    force `CPU.sii_ncu_syn_vld = 1'b0;
    force `CPU.tck = 0;

// leave this out of cmp model
`ifdef OPENSPARC_CMP
`else
    force `CPU.tcu.tcu_soc0_scan_out = 1'b0;
    force `CPU.tcu.tcu_soc1_scan_out = 1'b0;
    force `CPU.tcu.tcu_soc2_scan_out = 1'b0;
    force `CPU.tcu.tcu_soc3_scan_out = 1'b0;
    force `CPU.tcu.tcu_soc4_scan_out = 1'b0;
    force `CPU.tcu.tcu_soc5_scan_out = 1'b0;
    force `CPU.tcu.tcu_soc6_scan_out = 1'b0;
`endif  // OPENSPARC_CMP

    force `CPU.tcu_aclk = 0;
    force `CPU.tcu_array_bypass = 0;
    force `CPU.tcu_array_wr_inhibit = 0;
    force `CPU.tcu_bclk = 0;

    force `CPU.tcu_dectest = 1;
    force `CPU.tcu_div_bypass = 1'b0;

    // l2 scan in
    force `CPU.tcu_l2b0_mbist_scan_in = 0;
    force `CPU.tcu_l2b0_mbist_start = 0;
    force `CPU.tcu_l2b1_mbist_scan_in = 0;
    force `CPU.tcu_l2b1_mbist_start = 0;
    force `CPU.tcu_l2b2_mbist_scan_in = 0;
    force `CPU.tcu_l2b2_mbist_start = 0;
    force `CPU.tcu_l2b3_mbist_scan_in = 0;
    force `CPU.tcu_l2b3_mbist_start = 0;
    force `CPU.tcu_l2b4_mbist_scan_in = 0;
    force `CPU.tcu_l2b4_mbist_start = 0;
    force `CPU.tcu_l2b5_mbist_scan_in = 0;
    force `CPU.tcu_l2b5_mbist_start = 0;
    force `CPU.tcu_l2b6_mbist_scan_in = 0;
    force `CPU.tcu_l2b6_mbist_start = 0;
    force `CPU.tcu_l2b7_mbist_scan_in = 0;
    force `CPU.tcu_l2b7_mbist_start = 0;

    force `CPU.tcu_l2t0_mbist_scan_in = 0;
    force `CPU.tcu_l2t0_mbist_start = 0;
    force `CPU.tcu_l2t0_shscan_scan_in = 0;
    force `CPU.tcu_l2t1_mbist_scan_in = 0;
    force `CPU.tcu_l2t1_mbist_start = 0;
    force `CPU.tcu_l2t1_shscan_scan_in = 0;
    force `CPU.tcu_l2t2_mbist_scan_in = 0;
    force `CPU.tcu_l2t2_mbist_start = 0;
    force `CPU.tcu_l2t2_shscan_scan_in = 0;
    force `CPU.tcu_l2t3_mbist_scan_in = 0;
    force `CPU.tcu_l2t3_mbist_start = 0;
    force `CPU.tcu_l2t3_shscan_scan_in = 0;
    force `CPU.tcu_l2t4_mbist_scan_in = 0;
    force `CPU.tcu_l2t4_mbist_start = 0;
    force `CPU.tcu_l2t4_shscan_scan_in = 0;
    force `CPU.tcu_l2t5_mbist_scan_in = 0;
    force `CPU.tcu_l2t5_mbist_start = 0;
    force `CPU.tcu_l2t5_shscan_scan_in = 0;
    force `CPU.tcu_l2t6_mbist_scan_in = 0;
    force `CPU.tcu_l2t6_mbist_start = 0;
    force `CPU.tcu_l2t6_shscan_scan_in = 0;
    force `CPU.tcu_l2t7_mbist_scan_in = 0;
    force `CPU.tcu_l2t7_mbist_start = 0;
    force `CPU.tcu_l2t7_shscan_scan_in = 0;

    force `CPU.tcu_l2t_shscan_aclk = 0;
    force `CPU.tcu_l2t_shscan_bclk = 0;
    force `CPU.tcu_l2t_shscan_pce_ov = 0;
    force `CPU.tcu_l2t_shscan_scan_en = 0;

    force `CPU.tcu_mbist_bisi_en = 0;
    force `CPU.tcu_muxtest = 1'b1;
    force `CPU.tcu_pce_ov = 0;

    force `CPU.tcu_atpg_mode = 0;
    force `CPU.tcu_srd_atpgd = 0;
    force `CPU.tcu_srd_atpgse = 0;
    force `CPU.tcu_srd_atpgmode = 3'b0;

    force `CPU.tcu_mbist_user_mode = 0;
    force `CPU.tcu_scan_en = 0;
    force `CPU.tcu_se_scancollar_in = 0;
    force `CPU.tcu_se_scancollar_out = 0;
    force `CPU.tcu_spc0_aclk = 1'b0;
    force `CPU.tcu_spc0_array_wr_inhibit = 1'b0;
    force `CPU.tcu_spc0_bclk = 1'b0;
    force `CPU.tcu_spc0_mbist_scan_in = 1'b0;
    force `CPU.tcu_spc0_scan_en = 1'b0;
    force `CPU.tcu_spc0_scan_out = 0;
    force `CPU.tcu_spc0_se_scancollar_in = 1'b0;
    force `CPU.tcu_spc0_se_scancollar_out = 1'b0;
    force `CPU.tcu_spc0_shscan_scan_out = 1'b0;
    force `CPU.tcu_spc1_aclk = 1'b0;
    force `CPU.tcu_spc1_array_wr_inhibit = 1'b0;
    force `CPU.tcu_spc1_bclk = 1'b0;
    force `CPU.tcu_spc1_mbist_scan_in = 1'b0;
    force `CPU.tcu_spc1_scan_en = 1'b0;
    force `CPU.tcu_spc1_scan_out = 0;
    force `CPU.tcu_spc1_se_scancollar_in = 1'b0;
    force `CPU.tcu_spc1_se_scancollar_out = 1'b0;
    force `CPU.tcu_spc1_shscan_scan_out = 1'b0;
    force `CPU.tcu_spc2_aclk = 1'b0;
    force `CPU.tcu_spc2_array_wr_inhibit = 1'b0;
    force `CPU.tcu_spc2_bclk = 1'b0;
    force `CPU.tcu_spc2_mbist_scan_in = 1'b0;
    force `CPU.tcu_spc2_scan_en = 1'b0;
    force `CPU.tcu_spc2_scan_out = 0;
    force `CPU.tcu_spc2_se_scancollar_in = 1'b0;
    force `CPU.tcu_spc2_se_scancollar_out = 1'b0;
    force `CPU.tcu_spc2_shscan_scan_out = 1'b0;
    force `CPU.tcu_spc3_aclk = 1'b0;
    force `CPU.tcu_spc3_array_wr_inhibit = 1'b0;
    force `CPU.tcu_spc3_bclk = 1'b0;
    force `CPU.tcu_spc3_mbist_scan_in = 1'b0;
    force `CPU.tcu_spc3_scan_en = 1'b0;
    force `CPU.tcu_spc3_scan_out = 0;
    force `CPU.tcu_spc3_se_scancollar_in = 1'b0;
    force `CPU.tcu_spc3_se_scancollar_out = 1'b0;
    force `CPU.tcu_spc3_shscan_scan_out = 1'b0;
    force `CPU.tcu_spc4_aclk = 1'b0;
    force `CPU.tcu_spc4_array_wr_inhibit = 1'b0;
    force `CPU.tcu_spc4_bclk = 1'b0;
    force `CPU.tcu_spc4_mbist_scan_in = 1'b0;
    force `CPU.tcu_spc4_scan_en = 1'b0;
    force `CPU.tcu_spc4_scan_out = 0;
    force `CPU.tcu_spc4_se_scancollar_in = 1'b0;
    force `CPU.tcu_spc4_se_scancollar_out = 1'b0;
    force `CPU.tcu_spc4_shscan_scan_out = 1'b0;
    force `CPU.tcu_spc5_aclk = 1'b0;
    force `CPU.tcu_spc5_array_wr_inhibit = 1'b0;
    force `CPU.tcu_spc5_bclk = 1'b0;
    force `CPU.tcu_spc5_mbist_scan_in = 1'b0;
    force `CPU.tcu_spc5_scan_en = 1'b0;
    force `CPU.tcu_spc5_scan_out = 0;
    force `CPU.tcu_spc5_se_scancollar_in = 1'b0;
    force `CPU.tcu_spc5_se_scancollar_out = 1'b0;
    force `CPU.tcu_spc5_shscan_scan_out = 1'b0;
    force `CPU.tcu_spc6_aclk = 1'b0;
    force `CPU.tcu_spc6_array_wr_inhibit = 1'b0;
    force `CPU.tcu_spc6_bclk = 1'b0;
    force `CPU.tcu_spc6_mbist_scan_in = 1'b0;
    force `CPU.tcu_spc6_scan_en = 1'b0;
    force `CPU.tcu_spc6_scan_out = 0;
    force `CPU.tcu_spc6_se_scancollar_in = 1'b0;
    force `CPU.tcu_spc6_se_scancollar_out = 1'b0;
    force `CPU.tcu_spc6_shscan_scan_out = 1'b0;
    force `CPU.tcu_spc7_aclk = 1'b0;
    force `CPU.tcu_spc7_array_wr_inhibit = 1'b0;
    force `CPU.tcu_spc7_bclk = 1'b0;
    force `CPU.tcu_spc7_mbist_scan_in = 1'b0;
    force `CPU.tcu_spc7_scan_en = 1'b0;
    force `CPU.tcu_spc7_scan_out = 0;
    force `CPU.tcu_spc7_se_scancollar_in = 1'b0;
    force `CPU.tcu_spc7_se_scancollar_out = 1'b0;
    force `CPU.tcu_spc7_shscan_scan_out = 1'b0;

    force `CPU.tcu_spc_mbist_start = 0;
`ifdef NOL2RTL
    force `CPU.tcu_spc0_mbist_start_t1lff_0 = 0;
    force `CPU.tcu_spc_mbist_start_t3lff_2 = 0;
`endif

    force `CPU.tcu_spc_shscan_aclk = 0;
    force `CPU.tcu_spc_shscan_bclk = 0;
    force `CPU.tcu_spc_shscan_pce_ov = 0;
    force `CPU.tcu_spc_shscan_scan_en = 0;
    force `CPU.tcu_spc_shscanid = 3'b0;

    force `CPU.L2T_VNW = 8'hff;
    force `CPU.SPC_VNW = 8'hff;
    force `CPU.L2D_VNW0 = 8'hff;
    force `CPU.L2D_VNW1 = 8'hff; 


//     force `CPU.tcu_do_mode = 0; //in cmp_tasks
//     force `CPU.tcu_ss_mode = 0; //in cmp_tasks

    force `CPU.tcu_ss_request = 0;
`ifdef NOL2RTL
    force `CPU.tcu_ss_request_t1lff_0 = 0;
    force `CPU.tcu_ss_request_t3lff_2 = 0;
`endif

    force `CPU.dmo_coresel[5:0] = 6'h3f;
    force `CPU.dmo_tagmuxctl = 0;
    force `CPU.dmo_l2tsel[5:0] = 6'b0;
    force `CPU.dmo_icmuxctl = 0;
    force `CPU.dmo_dcmuxctl = 0;
    force `CPU.tcu_spc_lbist_start[7:0] = 8'b0;
//     force `CPU.tcu_spc_test_mode = 0;



// clock stop    
    force `CPU.tcu_ccx_clk_stop = 0;
    force `CPU.tcu_l2b0_clk_stop = 0;
    force `CPU.tcu_l2b1_clk_stop = 0;
    force `CPU.tcu_l2b2_clk_stop = 0;
    force `CPU.tcu_l2b3_clk_stop = 0;
    force `CPU.tcu_l2b4_clk_stop = 0;
    force `CPU.tcu_l2b5_clk_stop = 0;
    force `CPU.tcu_l2b6_clk_stop = 0;
    force `CPU.tcu_l2b7_clk_stop = 0;
    force `CPU.tcu_l2d0_clk_stop = 0;
    force `CPU.tcu_l2d1_clk_stop = 0;
    force `CPU.tcu_l2d2_clk_stop = 0;
    force `CPU.tcu_l2d3_clk_stop = 0;
    force `CPU.tcu_l2d4_clk_stop = 0;
    force `CPU.tcu_l2d5_clk_stop = 0;
    force `CPU.tcu_l2d6_clk_stop = 0;
    force `CPU.tcu_l2d7_clk_stop = 0;
    force `CPU.tcu_l2t0_clk_stop = 0;
    force `CPU.tcu_l2t0_shscan_clk_stop = 0;
    force `CPU.tcu_l2t1_clk_stop = 0;
    force `CPU.tcu_l2t1_shscan_clk_stop = 0;
    force `CPU.tcu_l2t2_clk_stop = 0;
    force `CPU.tcu_l2t2_shscan_clk_stop = 0;
    force `CPU.tcu_l2t3_clk_stop = 0;
    force `CPU.tcu_l2t3_shscan_clk_stop = 0;
    force `CPU.tcu_l2t4_clk_stop = 0;
    force `CPU.tcu_l2t4_shscan_clk_stop = 0;
    force `CPU.tcu_l2t5_clk_stop = 0;
    force `CPU.tcu_l2t5_shscan_clk_stop = 0;
    force `CPU.tcu_l2t6_clk_stop = 0;
    force `CPU.tcu_l2t6_shscan_clk_stop = 0;
    force `CPU.tcu_l2t7_clk_stop = 0;
    force `CPU.tcu_l2t7_shscan_clk_stop = 0;


// done in cmp_tasks.v
    force `CPU.tcu_spc0_clk_stop = 0;
    force `CPU.tcu_spc0_shscan_clk_stop = 0;
    force `CPU.tcu_spc1_clk_stop = 0;
    force `CPU.tcu_spc1_shscan_clk_stop = 0;
    force `CPU.tcu_spc2_clk_stop = 0;
    force `CPU.tcu_spc2_shscan_clk_stop = 0;
    force `CPU.tcu_spc3_clk_stop = 0;
    force `CPU.tcu_spc3_shscan_clk_stop = 0;
    force `CPU.tcu_spc4_clk_stop = 0;
    force `CPU.tcu_spc4_shscan_clk_stop = 0;
    force `CPU.tcu_spc5_clk_stop = 0;
    force `CPU.tcu_spc5_shscan_clk_stop = 0;
    force `CPU.tcu_spc6_clk_stop = 0;
    force `CPU.tcu_spc6_shscan_clk_stop = 0;
    force `CPU.tcu_spc7_clk_stop = 0;
    force `CPU.tcu_spc7_shscan_clk_stop = 0;


    force `CPU.cluster_arst_l = 1;
    force `CPU.efu_spc0_fuse_ixfer_en = 0;
    force `CPU.efu_spc0_fuse_iclr = 0;
    force `CPU.efu_spc0_fuse_dxfer_en = 0;
    force `CPU.efu_spc0_fuse_dclr = 0;
    force `CPU.tcu_spc_lbist_pgm = 0;
    force `CPU.tcu_spc_lbist_scan_in = 0;

    force `CPU.spc_revid_out[3:0] = 0;

  end // forces
    
  
  // The vera shell. Give it the fastest bench clock, always.
  // You could pass in all the DUTs top wires, but it is not required.
  // Vera can still get to any hdl node through interface.if.vrh files.
  // NTB on the otherhand...
  
  // review 
  `ifdef NTB
  cmp_test vshell(
    .SystemClock (SystemClock), 
    .\top_if.clk (SystemClock), 
  //   .\top_if.spc_pcx_req_pq (spc_pcx_req_pq), 
  //   .\top_if.spc_pcx_atm_pq (spc_pcx_atm_pq), 
  //   .\top_if.spc_pcx_data_pa (spc_pcx_data_pa), 
  //   .\top_if.pcx_spc_grant_px (pcx_spc_grant_px), 
  //   .\top_if.cpx_spc_data_cx (cpx_spc_data_cx), 
  //   .\top_if.cmp_core_running_rw (cmp_core_running_rw), 
    .\probe_if.raw_set (`TB_TOP.spc.lsu.lmc.ld_rawp_disabled_set[7:0])
  );
  
//   `else
//   cmp_top_shell vshell();
//   //`else
//   //cmp_top_shell vshell(
//   //   .SystemClock (SystemClock),
//   //   .topInterface_clk (SystemClock),
//   //   .topInterface_spc_pcx_req_pq (spc_pcx_req_pq),
//   //   .topInterface_spc_pcx_atm_pq (spc_pcx_atm_pq),
//   //   .topInterface_spc_pcx_data_pa (spc_pcx_data_pa),
//   //   .topInterface_pcx_spc_grant_px (pcx_spc_grant_px),
//   //   .topInterface_cpx_spc_data_cx (cpx_spc_data_cx),
//   //   .topInterface_cmp_core_running_rw (cmp_core_running_rw)
//   // );
  `endif
  
  
  //----------------------------------------------------------
  `include "misc_tasks.v"

endmodule  
//----------------------------------------------------------
//----------------------------------------------------------
