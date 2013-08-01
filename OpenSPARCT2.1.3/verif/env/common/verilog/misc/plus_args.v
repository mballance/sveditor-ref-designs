// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: plus_args.v
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
`ifndef PLUS_ARGS_INC
`define PLUS_ARGS_INC

//----------------------------------------------------------
// Plusarg processing

reg [16*8:0] tempstr;
integer    timeout ;
reg        nas_check_on;
reg        dma_memchk_off;
reg        tlb_sync_on;
reg        ldst_sync_on;
reg        icache_sync_on;
reg        int_sync_on;
reg        err_sync_on;
reg        pku_err_inject;
reg        lsu_mon_on;
reg        gchkr_on;
reg        err_chkrs_off;
reg        show_delta_on;
reg        show_memop_on;
reg        show_tlb_on;
reg        hash_on;
reg        perf_diag;
reg        win_check_on;
reg        axis_debug_on;
reg        soc_sync_on;
reg        socket_use_flush;
integer    max_cycle;
integer    nas_q_rate;
//  reg [3:0]  pwr_throttle;
`ifdef AXIS_TL
reg [`TRAP_ADDR_WIDTH-1:0] good_trap_addr;
reg [`TRAP_ADDR_WIDTH-1:0] bad_trap_addr1;
reg [`TRAP_ADDR_WIDTH-1:0] bad_trap_addr2;
reg [`TRAP_ADDR_WIDTH-1:0] bad_trap_addr3;
reg [`TRAP_ADDR_WIDTH-1:0] bad_trap_addr4;
`else
reg [`TRAP_ADDR_WIDTH-1:0] good_trap_addr [`MAX_TRAP_ADDRS-1:0];
reg [`TRAP_ADDR_WIDTH-1:0] bad_trap_addr [`MAX_TRAP_ADDRS-1:0];
`endif
reg [6:0]  good_trap_count;
reg [6:0]  bad_trap_count;
reg        mamon;
reg        dec_spu_grant;
reg [63:0] th_check_enable;
reg [63:0] finish_mask;
reg [63:0] mp_mask;
integer th_timeout;
integer skt_timeout;

reg [3:0] bank_set_mask;
reg [3:0] bank_set_mask_csr;

reg [8*(`TRAP_ADDR_CHARS+1)*`MAX_TRAP_ADDRS:0] tmptrapstr;
integer i;
reg [31:0] tmp32;
integer asi_power_throttle_freq;
reg [7:0] core_set_mask;
reg [63:0] core_set_mask_tids;

//
//  ALL calls to $random MUST look like this!!!  $random(`PARGS.seed)
//  and must be made AFTER time zero!!!  <-------------
//
integer seedin, seed;


initial begin // {

    nas_check_on = 0;
    dma_memchk_off = 0;
    tlb_sync_on = 1;     // Enabled by default
    ldst_sync_on = 1;    // Enabled by default
    icache_sync_on = 0;
    int_sync_on = 1;     // Enabled by default
    err_sync_on = 1;     // Enabled by default
    pku_err_inject = 0;
    lsu_mon_on = 1;      // Enabled by default
    gchkr_on = 0;
    err_chkrs_off = 0;
    show_delta_on = 0;
    show_memop_on = 0;
    show_tlb_on = 0;
    hash_on = 0;
    perf_diag = 0;
    win_check_on = 0;
    axis_debug_on = 0;
    soc_sync_on = 1;    // Enabled by default
    max_cycle = 0;
    good_trap_count = 0;
    bad_trap_count = 0;
    mamon = 0;
    dec_spu_grant = 0;
    timeout = `TIMEOUT;
    th_timeout = 0;
    skt_timeout = 0;
    th_check_enable = 64'b1;
    finish_mask  = 0;
    seed = 1;
    seedin = 1;
    asi_power_throttle_freq = 1500;
    nas_q_rate = 20;
    mp_mask = 0;
    socket_use_flush = 0;
    bank_set_mask_csr = 0;
    bank_set_mask = 0;
    core_set_mask = 8'hff;
    core_set_mask_tids = 64'hffffffffffffffff;

`ifdef CORE_0
  mp_mask = mp_mask | 64'h00000000_000000ff;
`endif
`ifdef CORE_1
  mp_mask = mp_mask | 64'h00000000_0000ff00;
`endif
`ifdef CORE_2
  mp_mask = mp_mask | 64'h00000000_00ff0000;
`endif
`ifdef CORE_3
  mp_mask = mp_mask | 64'h00000000_ff000000;
`endif
`ifdef CORE_4
  mp_mask = mp_mask | 64'h000000ff_00000000;
`endif
`ifdef CORE_5
  mp_mask = mp_mask | 64'h0000ff00_00000000;
`endif
`ifdef CORE_6
  mp_mask = mp_mask | 64'h00ff0000_00000000;
`endif
`ifdef CORE_7
  mp_mask = mp_mask | 64'hff000000_00000000;
`endif

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
// These +args must be processed first so other initial blocks can use the values.
// Therefore, any initial block that uses `PARGS.var MUST have a #0 or #1 first.
// Ideally, you should do NOTHING at time zero since nothing is stable at time zero.
// Ideally, you should do NOTHING at time zero since nothing is stable at time zero.
//
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//
//  ALL calls to $random MUST look like this!!!  $random(`PARGS.seed)
//  and must be made AFTER time zero!!!  <-------------
//
    i = $value$plusargs("tg_seed=%d", seedin);
    tmp32 = seedin;
    tmp32[31] = 0;
    seedin = tmp32; // always positive int ([31] = 0)
    seed = seedin;  // seedin is a copy of passed in seedValue. seed var changes as used.
    `PR_ALWAYS ("arg", `ALWAYS, "The VERILOG random generator initial seed is %0d (should match VERA)",seedin);

//
//  ALL calls to $random MUST look like this!!!  $random(`PARGS.seed)
//  and must be made AFTER time zero!!!  <-------------
//

    // initial call
    i = $random(`PARGS.seed);

`ifdef AXIS_TL
        nas_check_on = 0;
`else
    //--------------
    // Misc
    // !!! Must check for this plusarg (before *sync args since they need to know if ~nas_check_on.
    if ($test$plusargs("use_sas_tasks")) begin // {
      nas_check_on = 1;
      `PR_ALWAYS ("arg", `ALWAYS, "Nas Checking Enabled");
    end // }
    else begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"-------------------------------");
      `PR_ALWAYS ("arg",`ALWAYS,"!!!!!                     !!!!!");
      `PR_ALWAYS ("arg",`ALWAYS,"!!!!!                     !!!!!");
      `PR_ALWAYS ("arg",`ALWAYS,"     Nas Checking Disabled");
      `PR_ALWAYS ("arg",`ALWAYS,"!!!!!                     !!!!!");
      `PR_ALWAYS ("arg",`ALWAYS,"!!!!!                     !!!!!");
      `PR_ALWAYS ("arg",`ALWAYS,"-------------------------------");
    end //}
`endif

    //--------------
    // NAS Q RATE
    if ($test$plusargs("nas_q_rate")) begin // {
      if($value$plusargs("nas_q_rate=%d", nas_q_rate)) begin
      end
    end // }
    `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - Nas Q Rate is %d", nas_q_rate);
    //--------------
    // SOCKET USE FLUSH
    if ($test$plusargs("socket_use_flush")) begin // {
        socket_use_flush = 1;
        `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - Socket Sends on Flush ONLY");
    end // }
    //--------------
    // TLB SYNC
    if (($test$plusargs("notlb_sync"))|(nas_check_on==0))  begin // {
      tlb_sync_on = 0;
      `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - tlb_sync Disabled");
    end // }
    else begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"tlb_sync Enabled");
    end //}

    //--------------
    // Icache SYNC - must have nas & ldst_sync & tlb_sync enabled first
    if (($test$plusargs("noldst_sync"))|($test$plusargs("notlb_sync"))|(nas_check_on==0)) begin // {
      icache_sync_on = 0;
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - icache_sync Disabled");
    end // }
    else if ($test$plusargs("icache_sync_on"))begin // {
      icache_sync_on = 1;
      `PR_ALWAYS ("arg", `ALWAYS, "icache_sync Enabled");
    end //}
    else begin // {
      icache_sync_on = 0;
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - icache_sync Disabled");
    end //}

    //--------------
    // LDST SYNC
    if (($test$plusargs("noldst_sync"))|(nas_check_on==0)) begin // {
      ldst_sync_on = 0;
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - ldst_sync Disabled");
    end // }
    else begin // {
      `PR_ALWAYS ("arg", `ALWAYS, "ldst_sync Enabled");
    end //}

    //--------------
    // INT SYNC
    if (($test$plusargs("noint_sync"))|(nas_check_on==0)) begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - int_sync Disabled");
      int_sync_on = 0;
    end // }
    else begin // {
      `PR_ALWAYS ("arg", `ALWAYS, "int_sync Enabled");
    end //}

    //--------------
    // ERR SYNC
    if (($test$plusargs("err_sync_on"))&&(nas_check_on!=0)) begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - err_sync Enabled");
      err_sync_on = 1;
    end // }

    if (($test$plusargs("noerr_sync"))|(nas_check_on==0)) begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - err_sync Disabled");
      err_sync_on = 0;
    end // }
    else begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"err_sync Enabled");
    end //}

    //--------------
    // DMA Mem Check
    if (($test$plusargs("dma_memchk_off"))|(nas_check_on==0)) begin // {
      dma_memchk_off = 1;
      `PR_ALWAYS ("arg",`ALWAYS,"dma_memchk Disabled");
    end // }
    else begin // {
      dma_memchk_off = 0;
      `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - dma_memchk Enabled");
    end //}

    //--------------
    // SOC SYNC
    if ($test$plusargs("nosoc_sync")) begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - soc_sync Disabled");
      soc_sync_on = 0;
    end // }
    else begin // {
      `PR_ALWAYS ("arg", `ALWAYS, "soc_sync Enabled");
    end //}

    //--------------
    // PKU Error Injection
    if ($test$plusargs("pku_err_inject")) begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"pku_err_inject Enabled");
      pku_err_inject = 1;
    end // }

    // LSU_MON
    if ($test$plusargs("lsu_mon_off")) begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - lsu_mon Disabled");
      lsu_mon_on = 0;
    end // }
    else begin // {
      `PR_ALWAYS ("arg", `ALWAYS, "lsu_mon Enabled");
    end //}

    // global_chkr
    if ($test$plusargs("gchkr_off")) begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - Global Chkr Disabled.");
      gchkr_on = 0;
    end // }
    else begin // {
`ifndef SPC_BENCH     //global chkr shd not be enabled in the SPC bench
      gchkr_on = 1;
      `PR_ALWAYS ("arg", `ALWAYS,"NOTICE - Global Chkr Enabled.");
`endif
    end //}

    // RAS_CHKR
    if ($test$plusargs("err_chkrs_off")) begin // {
      `PR_ALWAYS ("arg",`ALWAYS,"NOTICE - Block level err chkrs Disabled");
      err_chkrs_off = 1;
    end // }

    //--------------
    // Debug & printing ..
    if ($test$plusargs("show_delta")) begin // {
      show_delta_on = 1;
      `TOP.quiet = 0;
      `PR_ALWAYS ("arg", `ALWAYS, "Show Delta Enabled");
    end // }

    if ($test$plusargs("show_memop")) begin // {
      show_memop_on = 1;
      `PR_ALWAYS ("arg", `ALWAYS, "show_memop Enabled");
    end // }

    if ($test$plusargs("show_tlb")) begin // {
      show_tlb_on = 1;
      `PR_ALWAYS ("arg", `ALWAYS, "show_tlb Enabled");
    end // }

    //-----
    // Index Hash
    if ($test$plusargs("hash_on")) begin // {
      hash_on = 1;
      `PR_ALWAYS ("arg", `ALWAYS, "hash_on Enabled");
      `ifdef FC_BENCH
        `PR_ALWAYS ("arg", `ALWAYS, "Force bit in NCU to enable hash.");
        `ifdef NCU_GATE
          force `CPU.ncu.ncu_scd_ctl__n63154 = 1'b1;
        `else
          force `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.l2idxhs_en_status = 1'b1;
        `endif
      `endif
    end // }

    if ($test$plusargs("hash_on_no_force")) begin // {
      hash_on = 1;
      `PR_ALWAYS ("arg", `ALWAYS, "hash_on Enabled");
    end // }
    //-----

    if ($test$plusargs("perf_diag")) begin // {
      perf_diag = 1;
      `PR_ALWAYS ("arg", `ALWAYS, "perf_diag Enabled");
    end // }

    if ($test$plusargs("win_check")) begin // {
      win_check_on = 1;
      `PR_ALWAYS ("arg", `ALWAYS, "win_check Enabled");
    end // }

    if ($test$plusargs("AXIS_DEBUG_ON")) begin // {
      axis_debug_on = 1;
      `PR_ALWAYS ("arg", `ALWAYS, "AXIS_DEBUG_ON Enabled");
    end // }


    //---------------
    // reduced core set.  partial core for vectors. "portable core" related.
    // must be done before finish_mask and th_check_enable!!!
    if ($test$plusargs("core_set_mask")) begin
      if ($value$plusargs("core_set_mask=%0h", core_set_mask)) begin
        if (core_set_mask < 8'hff) begin
          `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - Partial core mode is enabled. core_set_mask = %0h", core_set_mask);
          `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - Partial core mode. thread/th_check_enable/finish_mask/etc may be adjusted based on core_set_mask.");
          for (i=7;i>=0;i=i-1) begin
            core_set_mask_tids = core_set_mask_tids << 8;
            core_set_mask_tids[7:0] = {8{core_set_mask[i]}};
          end
          mp_mask = mp_mask & core_set_mask_tids;
        end
      end
    end


    //--------------
    // Thread Enable
    if (! $test$plusargs("no_thread_force")) begin // {
      if ($value$plusargs("thread=%s", tempstr))  begin // {
        if (tempstr == "0") begin
            `PR_WARN ("arg", `WARN, "WARNING: thread=0 has the same effect as none, all threads will be disabled!\n");
        end
        th_check_enable = {get_thread_enables(tempstr)};
      end // }
    end // }

    th_check_enable = th_check_enable & mp_mask;
    `PR_ALWAYS ("arg", `ALWAYS, "Initial Thread Check Control (may change if SW startup): %h (th_check_enable/+thread)",th_check_enable);

    //--------------
    // FinishMask
    finish_mask = th_check_enable;
    //`PR_ALWAYS ("arg", `ALWAYS, "Thread Finish Mask (finish_mask) is now 0x%h (+thread/th_check_enable based).\n", finish_mask);
    // Override finish mask from plusarg
    if ($value$plusargs("finish_mask=%s", tempstr)) begin // {
      if (tempstr == "0") begin
          `PR_WARN ("arg", `WARN, "WARNING - finish_mask=0 has the same effect as none, bench will not wait for any threads to reach good/bad trap!\n");
      end
       finish_mask = {get_thread_enables(tempstr)};
    end // }

    finish_mask = finish_mask & mp_mask;
    `PR_ALWAYS("arg", `ALWAYS, "Thread Finish Mask, adjusted: %h (finish_mask/+finish_mask)",finish_mask);



    //--------------
    // Timeouts
    `PR_ALWAYS ("arg", `ALWAYS, "");
    `PR_ALWAYS ("arg", `ALWAYS,"!!! BE AWARE - timeout values are in # of Cycles, NOT # of ps/fs units");

    // Runaway throttle
    if ($value$plusargs("max_cycle=%d", max_cycle)) begin // {
    end // }
    else begin // {
      max_cycle = 1000000;
    end // }
    `PR_ALWAYS ("arg", `ALWAYS,
            "Max Cycles      %d Cycles (Timeout if simulation reaches this cycle count) ",
            max_cycle);

    if ($value$plusargs("TIMEOUT=%d", timeout)) begin // {
    end // }
    else begin // {
      timeout = 1000;
    end // }
    `PR_ALWAYS ("arg", `ALWAYS, 
            "Global Timeout  %d Cycles (Timeout if ALL threads are idle (i.e. no SSTEP)) ",
            timeout);

    if ($value$plusargs("th_timeout=%d", th_timeout)) begin // {
    end // }
    else begin // {
      th_timeout = timeout * 5;
    end // }
    `PR_ALWAYS ("arg", `ALWAYS,
            "Thread Timeout  %d Cycles (Timeout if ANY thread is idle (i.e. no SSTEP))",
            th_timeout);

    if ($value$plusargs("skt_timeout=%d", skt_timeout)) begin // {
    end // }
    else begin // {
      skt_timeout = 5000;
    end // }
    `PR_ALWAYS ("arg", `ALWAYS,
            "Socket Timeout  %d Cycles (Timeout if no socket msg from Riesling) ",
            skt_timeout);
    `PR_ALWAYS ("arg", `ALWAYS, "");



  //--------------
  // Goodtrap/Badtrap
    if ($test$plusargs("good_trap")) begin // {
      if ($value$plusargs("good_trap=%s", tmptrapstr)) begin
          good_trap_count = get_good_trap_addr(tmptrapstr);
          `WR_ALWAYS("arg", `ALWAYS, "Good Trap Address (%0d):", good_trap_count);
`ifdef AXIS_TL
          `WR_ALWAYS("arg", `ALWAYS, " %h", good_trap_addr);
          `PR_ALWAYS("arg", `ALWAYS, "");
          if (good_trap_count > 1)
            `PR_WARN("arg", `WARN, "axis targetless model can only support one good trap and one bad trap address");
`else
          for (i=0;i<good_trap_count;i=i+1)
            `WR_ALWAYS("arg", `ALWAYS, " %h", good_trap_addr[i]);
          `PR_ALWAYS("arg", `ALWAYS, "");
`endif
      end
    end // }
    else begin // {
      good_trap_count = 0;
      `PR_WARN("arg", `WARN, "WARNING - No good_trap address found!\n\tSimulation may not terminate!\n");
    end // }

    if ($test$plusargs("bad_trap")) begin // {
      if ($value$plusargs("bad_trap=%s", tmptrapstr)) begin
          bad_trap_count = get_bad_trap_addr(tmptrapstr);
          `WR_ALWAYS("arg", `ALWAYS, "Bad Trap Address(%0d):", bad_trap_count);
`ifdef AXIS_TL
          //`WR_ALWAYS("arg", `ALWAYS, " %h", bad_trap_addr);
          //`PR_ALWAYS("arg", `ALWAYS, "");
         for (i=0;i<=bad_trap_count;i=i+1)
             case (i)
            1: $display("bad trap addr 1 = %h",bad_trap_addr1);
            2: $display("bad trap addr 2 = %h",bad_trap_addr2);
            3: $display("bad trap addr 3 = %h",bad_trap_addr3);
            4: $display("bad trap addr 4 = %h",bad_trap_addr4);
             endcase

            `PR_WARN("arg", `WARN, "axis targetless model can only support four bad trap and one bad trap address");
`else
          for (i=0;i<bad_trap_count;i=i+1)
            `WR_ALWAYS("arg", `ALWAYS, " %h", bad_trap_addr[i]);
          `PR_ALWAYS("arg", `ALWAYS, "");
`endif
      end
    end  // }
    else begin // {
      bad_trap_count = 0;
      `PR_WARN("arg", `WARN, "WARNING - No bad_trap address found!\n\tSimulation may not terminate!\n");
    end // }


    //--------------
    // bank_set_mask for efuse partial bank mode
    if ($test$plusargs("bank_set_mask")) begin 
      // will runtime force NCU wires pm, ba01, ba23, ... if not 4'h0
      if ($value$plusargs("bank_set_mask=%h", bank_set_mask)) begin // {
        if (bank_set_mask == 0) begin
            `PR_WARN ("arg", `WARN, "WARNING - bank_set_mask=0 is being ignored! You need at least one pair!\n");
        end
        if (bank_set_mask !== 0) begin
            `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - Partial bank mode is enabled w/ binary mask of %b (ba67|ba45|ba23|ba01)\n", bank_set_mask);
        end
      end
    end


    //--------------
    // bank_set_mask_csr for csr partial bank mode
    if ($test$plusargs("bank_set_mask_csr")) begin 
      // will runtime force NCU wires pm, ba01, ba23, ... if not 4'h0
      if ($value$plusargs("bank_set_mask_csr=%h", bank_set_mask_csr)) begin // {
        if (bank_set_mask_csr == 0) begin
            `PR_WARN ("arg", `WARN, "WARNING - bank_set_mask_csr=0 is being ignored! You need at least one pair!\n");
        end
        if (bank_set_mask_csr !== 0) begin
            `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - Partial bank mode is enabled w/ binary mask of %b (ba67|ba45|ba23|ba01)\n", bank_set_mask_csr);
        end
      end // }
    end

end // initial }


`ifndef AXIS_TL
`ifndef PLAYBACK
`ifdef CORE_BENCH
initial begin
  if ($test$plusargs("clk_stop_exit")) begin
    `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - +clk_stop_exit seen. Simulation will exit after ANY clocks have stopped (FC/SPC2 only)!");

`ifdef FC_BENCH
    // wait for clocks to stop
    @(posedge `TOP.flush_reset_complete);
    @(posedge `CPU.tcu_ccu_clk_stop or
      posedge `CPU.tcu_ccu_io_clk_stop or
      posedge `CPU.tcu_spc0_clk_stop or
      posedge `CPU.tcu_spc1_clk_stop or
      posedge `CPU.tcu_spc2_clk_stop or
      posedge `CPU.tcu_spc3_clk_stop or
      posedge `CPU.tcu_spc4_clk_stop or
      posedge `CPU.tcu_spc5_clk_stop or
      posedge `CPU.tcu_spc6_clk_stop or
      posedge `CPU.tcu_spc7_clk_stop or
      posedge `CPU.tcu_l2d0_clk_stop or
      posedge `CPU.tcu_l2d1_clk_stop or
      posedge `CPU.tcu_l2d2_clk_stop or
      posedge `CPU.tcu_l2d3_clk_stop or
      posedge `CPU.tcu_l2d4_clk_stop or
      posedge `CPU.tcu_l2d5_clk_stop or
      posedge `CPU.tcu_l2d6_clk_stop or
      posedge `CPU.tcu_l2d7_clk_stop or
      posedge `CPU.tcu_l2t0_clk_stop or
      posedge `CPU.tcu_l2t1_clk_stop or
      posedge `CPU.tcu_l2t2_clk_stop or
      posedge `CPU.tcu_l2t3_clk_stop or
      posedge `CPU.tcu_l2t4_clk_stop or
      posedge `CPU.tcu_l2t5_clk_stop or
      posedge `CPU.tcu_l2t6_clk_stop or
      posedge `CPU.tcu_l2t7_clk_stop or
      posedge `CPU.tcu_l2b0_clk_stop or
      posedge `CPU.tcu_l2b1_clk_stop or
      posedge `CPU.tcu_l2b2_clk_stop or
      posedge `CPU.tcu_l2b3_clk_stop or
      posedge `CPU.tcu_l2b4_clk_stop or
      posedge `CPU.tcu_l2b5_clk_stop or
      posedge `CPU.tcu_l2b6_clk_stop or
      posedge `CPU.tcu_l2b7_clk_stop or
      posedge `CPU.tcu_mcu0_clk_stop or
      posedge `CPU.tcu_mcu0_dr_clk_stop or
      posedge `CPU.tcu_mcu0_io_clk_stop or
      posedge `CPU.tcu_mcu0_fbd_clk_stop or
      posedge `CPU.tcu_mcu1_clk_stop or
      posedge `CPU.tcu_mcu1_dr_clk_stop or
      posedge `CPU.tcu_mcu1_io_clk_stop or
      posedge `CPU.tcu_mcu1_fbd_clk_stop or
      posedge `CPU.tcu_mcu2_clk_stop or
      posedge `CPU.tcu_mcu2_dr_clk_stop or
      posedge `CPU.tcu_mcu2_io_clk_stop or
      posedge `CPU.tcu_mcu2_fbd_clk_stop or
      posedge `CPU.tcu_mcu3_clk_stop or
      posedge `CPU.tcu_mcu3_dr_clk_stop or
      posedge `CPU.tcu_mcu3_io_clk_stop or
      posedge `CPU.tcu_mcu3_fbd_clk_stop or
      posedge `CPU.tcu_ccx_clk_stop or
      posedge `CPU.tcu_sii_clk_stop or
      posedge `CPU.tcu_sii_io_clk_stop or
      posedge `CPU.tcu_sio_clk_stop or
      posedge `CPU.tcu_sio_io_clk_stop or
      posedge `CPU.tcu_ncu_clk_stop or
      posedge `CPU.tcu_ncu_io_clk_stop or
      posedge `CPU.tcu_efu_clk_stop or
      posedge `CPU.tcu_efu_io_clk_stop or
      posedge `CPU.tcu_rst_clk_stop or
      posedge `CPU.tcu_rst_io_clk_stop or
      posedge `CPU.tcu_dmu_io_clk_stop or
      posedge `CPU.tcu_rdp_io_clk_stop or
      posedge `CPU.tcu_mac_io_clk_stop or
      posedge `CPU.tcu_rtx_io_clk_stop or
      posedge `CPU.tcu_tds_io_clk_stop or
      posedge `CPU.tcu_peu_pc_clk_stop or
      posedge `CPU.tcu_peu_io_clk_stop);

    #1000;
    `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - +clk_stop_exit exiting because clocks have stopped!");
    good_end;
`endif

`ifdef SPC_BENCH
    // wait for clocks to stop
    @(posedge `CPU.spc0_ncu_core_running_status);
    @(posedge `CPU.tcu_spc0_clk_stop);
    #1000;
    `PR_ALWAYS ("arg", `ALWAYS, "NOTICE - +clk_stop_exit exiting because clocks have stopped!");
    good_end;
`endif
    
  end
end
`endif
`endif // PLAYBACK
`endif


initial begin
    // do not add anything else in this block!!!
    //
    // fast_boot for booting out of main memory
    if ($test$plusargs("fast_boot")) begin 

      `PR_ALWAYS ("arg", `ALWAYS, "\nNOTICE - fast_boot seen!!! Will boot from 0x20!!!\n");

      // will runtime force wire tb_top.cpu.ncu_wmr_vec_mask
      //force `TOP.cpu.ncu_wmr_vec_mask = 1;

      `ifndef FC_SCAN_BENCH
      `ifndef FC_BENCH
      `ifndef NCURTL
      `TOP.asi_wmr_vec_mask <= #1 1; // cmp_tasks fake NCU reg
      `endif
      `endif
      `endif

      `ifdef AXIS_TL
       force tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.wmr_vec_mask=1;
       `else
      `ifdef NCURTL
      // real NCU internal register
      // we are forcing a register write, NOT holding a force. Diag can write later.
      //assign wmr_vec_mask_n = asi_wmr_vec_mask_wr ? ncu_man_ucb_c2i_packet_data[0] : wmr_vec_mask;
`ifdef NCU_GATE
`define ASI_WMR_VEC_MASK_WR `NCU.ncu_scd_ctl__n36047
`define NCU_MAN_UCB_C2I_PACKET_DATA0 `NCU.ncu_scd_ctl__ncu_c2iscd_ctl_ncu_ctrl_ctl_ncu_man_ucb_c2i_packet_data_0_
`define WMR_VEC_MASK `NCU.ncu_scd_ctl__n63512
`define WAKE_THREAD  `NCU.ncu_scd_ctl__ncu_c2iscd_ctl_ncu_ctrl_ctl_wake_thread
`define NCU_L1CLK    `NCU.ca1_l1clkhdr__iol2clk__col_3__vdd__tcu_scan_en__vss__grp_1_30__l1clk

`else
`define ASI_WMR_VEC_MASK_WR `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.asi_wmr_vec_mask_wr
`define NCU_MAN_UCB_C2I_PACKET_DATA0 `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.ncu_man_ucb_c2i_packet_data[0]
`define WMR_VEC_MASK `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.wmr_vec_mask
`define WAKE_THREAD  `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.wake_thread
`define NCU_L1CLK    `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.l1clk
`endif // NCU_GATE

      forever begin
          force `ASI_WMR_VEC_MASK_WR = 1;
          force `NCU_MAN_UCB_C2I_PACKET_DATA0 = 1;
          force `WMR_VEC_MASK = 1;

          // get past X to zero
          if (`WAKE_THREAD !== 0)
            while (`WAKE_THREAD !== 0)
              @(negedge `NCU_L1CLK);

          `PR_ALWAYS ("arg", `ALWAYS, "\nNOTICE - fast_boot is forcing NCU asi_wmr_vec_mask register to set!!!\n");

          // wait for first thread to get wake up, then release
          while (`WAKE_THREAD !== 1)
            @(negedge `NCU_L1CLK);

          `PR_ALWAYS ("arg", `ALWAYS, "\nNOTICE - fast_boot is releasing NCU asi_wmr_vec_mask register force (reg still set)!!!\n");

          // safely past reset, write has stuck!
          release `ASI_WMR_VEC_MASK_WR;
          release `NCU_MAN_UCB_C2I_PACKET_DATA0;
          release `WMR_VEC_MASK;

          // Wait for the next power-on reset (if any)
          @(negedge `TOP.PWRON_RST_L);
      end // forever begin

      // do this to just force all the time
      //force `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_wmr_vec_mask[63:0] = 64'h1;

// All done with these text macros, so undefine them
`undef ASI_WMR_VEC_MASK_WR
`undef NCU_MAN_UCB_C2I_PACKET_DATA0
`undef WMR_VEC_MASK
`undef WAKE_THREAD
`undef NCU_L1CLK
      `endif //  `ifdef NCURTL
      `endif // !`ifdef AXIS_TL
    end
end


initial begin
    // do not add anything else in this block!!!
    //
    //--------------
    // Power Throttle
`ifndef PLAYBACK
    if ($value$plusargs("pwr_throttle=%s", tempstr))  begin // {
      if (tempstr == "rand" || tempstr == "random") begin // {
          `TOP.asi_power_throttle = $random(`PARGS.seed);
          `PR_ALWAYS ("arg", `ALWAYS,"pwr_throttle=static random, asi_power_throttle=%h (cores 0,1,4,5 = %0h/cores 2,3,6,7 = %0h",`TOP.asi_power_throttle,`TOP.asi_power_throttle[2:0],`TOP.asi_power_throttle[5:3]);
      end // }
      else if (tempstr == "cycle") begin // {
          if ($test$plusargs("pwr_throttle_freq")) 
            tmp32 = $value$plusargs("pwr_throttle_freq=%d", asi_power_throttle_freq);
          if (asi_power_throttle_freq < 2) asi_power_throttle_freq = 3;
          `PR_ALWAYS ("arg", `ALWAYS,"pwr_throttle=cycle random, pwr_throttle_freq=%0d",asi_power_throttle_freq);
      `ifdef PALLADIUM
         // No pwr_throttle switch in FC1
      `else
          while (1) begin
            `TOP.asi_power_throttle = $random(`PARGS.seed);
            repeat (asi_power_throttle_freq) @(negedge `CPU.cmp_gclk_c3_spc0);
          end
      `endif
      end // }
      else if (tempstr == "pulse") begin // {
          if ($test$plusargs("pwr_throttle_freq"))
            tmp32 = $value$plusargs("pwr_throttle_freq=%d", asi_power_throttle_freq);
          if (asi_power_throttle_freq < 2) asi_power_throttle_freq = 3;
          `PR_ALWAYS ("arg", `ALWAYS,"pwr_throttle=pulse random (return to zero), pwr_throttle_freq=%0d",asi_power_throttle_freq);
      `ifdef PALLADIUM
         // No pwr_throttle switch in FC1
      `else
          while (1) begin
            if (`TOP.asi_power_throttle !== 0) `TOP.asi_power_throttle = 0;
            else `TOP.asi_power_throttle = $random(`PARGS.seed) + 1;
            repeat (asi_power_throttle_freq) @(negedge `CPU.cmp_gclk_c3_spc0);
          end
      `endif
      end // }
      else begin
        tmp32 = $value$plusargs("pwr_throttle=%d",`TOP.asi_power_throttle);
        `PR_ALWAYS ("arg", `ALWAYS,"pwr_throttle=%0d",`TOP.asi_power_throttle);
      end
    end // }
    else begin
      `TOP.asi_power_throttle = 0;
    end
`endif // PLAYBACK
end

  
`ifndef FC_SCAN_BENCH  
`ifndef AXIS_TL
`ifndef PLAYBACK
// Need to set th_check_enable for all threads that POR ..
// (and ONLY at their POR!)
initial begin // {

  // wait...
  @(posedge `CPU.cmp_gclk_c3_spc0);
  @(negedge `CPU.cmp_gclk_c3_spc0);
`ifdef FC_BENCH
 `ifndef FC_SCAN_BENCH
  @(posedge `TOP.flush_reset_complete);
 `endif
`endif

  // detect saturation and then bail to optimize performance.
  // NOTE: if a warm reset causes us to go from 16 -> 8 threads running,
  // th_check_enable will still assume 16 threads are still running.
  while (`PARGS.th_check_enable[63:0] !== ({{8{`CPU.ncu_spc7_core_enable_status}},
                                            {8{`CPU.ncu_spc6_core_enable_status}},
                                            {8{`CPU.ncu_spc5_core_enable_status}},
                                            {8{`CPU.ncu_spc4_core_enable_status}},
                                            {8{`CPU.ncu_spc3_core_enable_status}},
                                            {8{`CPU.ncu_spc2_core_enable_status}},
                                            {8{`CPU.ncu_spc1_core_enable_status}},
                                            {8{`CPU.ncu_spc0_core_enable_status}}})) begin // {
                                
    // wait for a change of any core_running bit
    @(`CPU.ncu_spc0_core_running[7:0] or `CPU.ncu_spc1_core_running[7:0] or
      `CPU.ncu_spc2_core_running[7:0] or `CPU.ncu_spc3_core_running[7:0] or
      `CPU.ncu_spc4_core_running[7:0] or `CPU.ncu_spc5_core_running[7:0] or
      `CPU.ncu_spc6_core_running[7:0] or `CPU.ncu_spc7_core_running[7:0]);
    
    // X sanity, it's a good thing
    if (^(`CPU.ncu_spc0_core_running[7:0] ^ `CPU.ncu_spc1_core_running[7:0] ^
          `CPU.ncu_spc2_core_running[7:0] ^ `CPU.ncu_spc3_core_running[7:0] ^
          `CPU.ncu_spc4_core_running[7:0] ^ `CPU.ncu_spc4_core_running[7:0] ^
          `CPU.ncu_spc6_core_running[7:0] ^ `CPU.ncu_spc5_core_running[7:0]) === 1'bx) begin // {
      // can't assume dispmon is not disabled
      $display("ERROR: Thread Check Control th_check_enable=%h core_running=%h X detected!!!", `PARGS.th_check_enable,{`CPU.ncu_spc7_core_running[7:0],
                             `CPU.ncu_spc6_core_running[7:0],
                             `CPU.ncu_spc5_core_running[7:0],
                             `CPU.ncu_spc4_core_running[7:0],
                             `CPU.ncu_spc3_core_running[7:0],
                             `CPU.ncu_spc2_core_running[7:0],
                             `CPU.ncu_spc1_core_running[7:0],
                             `CPU.ncu_spc0_core_running[7:0]});
      `PR_ERROR ("arg", `ERROR, "ERROR: Thread Check Control (th_check_enable=%h) core_running X detected!!!", `PARGS.th_check_enable);
      $finish;
    end // }
                                                                  
    // add in additional bits
    `PARGS.th_check_enable = `PARGS.th_check_enable | {`CPU.ncu_spc7_core_running[7:0],
                                                       `CPU.ncu_spc6_core_running[7:0],
                                                       `CPU.ncu_spc5_core_running[7:0],
                                                       `CPU.ncu_spc4_core_running[7:0],
                                                       `CPU.ncu_spc3_core_running[7:0],
                                                       `CPU.ncu_spc2_core_running[7:0],
                                                       `CPU.ncu_spc1_core_running[7:0],
                                                       `CPU.ncu_spc0_core_running[7:0]};
    `PR_NORMAL ("arg", `NORMAL, "Thread Check Control (th_check_enable) is now 0x%h (core_running changed).", `PARGS.th_check_enable);

  end // while }
  `PR_NORMAL ("arg", `NORMAL, "Thread Check Control (th_check_enable) is now 0x%h (saturated, bye).", `PARGS.th_check_enable);
end // init }
`endif // PLAYBACK
`endif
`endif

//----------------------------------------------------------
  // MA monitor
  initial begin
    if ($value$plusargs("mamon=%d", mamon)) begin
      `PR_ALWAYS ("arg", `ALWAYS, "Enabling SPU MA monitor.\n");
    end
    if ($value$plusargs("dec_spu_grant=%d", dec_spu_grant)) begin
      `PR_ALWAYS ("arg", `ALWAYS, "Enabling random dec_spu_grant_d irritator.\n");
    end
  end

//----------------------------------------------------------
// Trap address extraction functions

function [6:0] get_good_trap_addr ;
    input [8*(`TRAP_ADDR_CHARS+1)*`MAX_TRAP_ADDRS:0] instring;
    reg [`TRAP_ADDR_CHARS*8-1:0] addr_str;
    reg [`TRAP_ADDR_WIDTH-1:0] address;
    integer l;
    begin // {

`ifdef PALLADIUM
   // The following contains some unsynthesizable RTL code.
`else
      get_good_trap_addr = 0;
      begin : SCAN_INSTRING // {
          while (instring !== 0) begin  // {
            addr_str = instring[8*`TRAP_ADDR_CHARS-1:0];
            instring = instring >> 8*`TRAP_ADDR_CHARS;
            if (instring[7:0] == ":" || instring[7:0] == 0) begin // {
                l= $sscanf(addr_str, "%h", address);
                get_good_trap_addr = get_good_trap_addr+1;
`ifdef AXIS_TL
                good_trap_addr=address;
`else
                good_trap_addr[get_good_trap_addr-1]=address;
`endif
            end // }
            if (instring[7:0] == ":") instring = instring >> 8;
            if (instring[7:0] == 0 ) disable SCAN_INSTRING;
          end // }
      end // }
`endif // !`ifdef PALLADIUM

    end // }

endfunction

function [6:0] get_bad_trap_addr ;
    input [8*(`TRAP_ADDR_CHARS+1)*`MAX_TRAP_ADDRS:0] instring;
    reg [`TRAP_ADDR_CHARS*8-1:0] addr_str;
    reg [`TRAP_ADDR_WIDTH-1:0] address;
    integer l;
    begin // {

`ifdef PALLADIUM
   // The following contains some unsynthesizable RTL code.
`else
      get_bad_trap_addr = 0;
      begin : SCAN_INSTRING // {
          while (instring !== 0) begin  // {
            addr_str = instring[8*`TRAP_ADDR_CHARS-1:0];
            instring = instring >> 8*`TRAP_ADDR_CHARS;
            if (instring[7:0] == ":" || instring[7:0] == 0) begin // {
                l= $sscanf(addr_str, "%h", address);
                get_bad_trap_addr = get_bad_trap_addr+1;
`ifdef AXIS_TL
                case (get_bad_trap_addr)
                  0: $display("No bad trap addresses?");
                  1: bad_trap_addr1 = address;
                  2: bad_trap_addr2 = address;
                  3: bad_trap_addr3 = address;
                  4: bad_trap_addr4 = address;
               default: $display("greater than 4 bad trap addresses not allowed");
                endcase
`else
                bad_trap_addr[get_bad_trap_addr-1]=address;
`endif
            end // }
            if (instring[7:0] == ":") instring = instring >> 8;
            if (instring[7:0] == 0 ) disable SCAN_INSTRING;
          end // }
      end // }

`endif // !`ifdef PALLADIUM

    end // }

endfunction




//----------------------------------------------------------
function [63:0] get_thread_enables ;
    input [8*16:0] instring;
    reg [7:0] char;
    integer i, j;
    reg [3:0] nibble;

    begin
      get_thread_enables = 64'h0;
      // if argument is thread=all
      if (instring == "all") begin
          get_thread_enables = 64'hffffffff_ffffffff;
      end
      // if argument is thread=none
      else if (instring == "none") begin
          get_thread_enables = 64'h0;
      end
      // if argument is thread=rand
      else if (instring == "rand" || instring == "random") begin
          get_thread_enables = {$random(`PARGS.seed),$random(`PARGS.seed)};
      end
      // rest should just be the actual value
      else begin
         for (i=0; i<16; i=i+1) begin
            for (j=0; j<=7; j=j+1) begin
            char[j] = instring[8*i+j];
            end

            case (char)
            "0" : nibble = 4'b0000;
            "1" : nibble = 4'b0001;
            "2" : nibble = 4'b0010;
            "3" : nibble = 4'b0011;
            "4" : nibble = 4'b0100;
            "5" : nibble = 4'b0101;
            "6" : nibble = 4'b0110;
            "7" : nibble = 4'b0111;
            "8" : nibble = 4'b1000;
            "9" : nibble = 4'b1001;
            "a","A" : nibble = 4'b1010;
            "b","B" : nibble = 4'b1011;
            "c","C" : nibble = 4'b1100;
            "d","D" : nibble = 4'b1101;
            "e","E" : nibble = 4'b1110;
            "f","F" : nibble = 4'b1111;
            default : nibble = 4'b0000;
            endcase

            get_thread_enables = get_thread_enables | (nibble << (i*4));
         end
      end
    end
endfunction
//----------------------------------------------------------
//----------------------------------------------------------

`endif
