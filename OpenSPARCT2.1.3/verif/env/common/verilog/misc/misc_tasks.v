// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: misc_tasks.v
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
`include "defines.vh"

reg [7:0] sim_status;  // Simlation status flags. Vera sees this for coverage.
integer junk;
integer PLIerrors;
integer core_cycle_cnt;  // Core clock cycle count
integer global_cycle_cnt;  // Core clock cycle count
reg [31:0] core_period;  // Number of time units per cycle for core clock
reg core_period_change;
reg in_reset;
reg in_por;
reg in_reset_core;  // delay start of in_reset for core because clocks take a couple cycles to stop


initial
  begin
    core_cycle_cnt = 0;
    global_cycle_cnt = 0;
    core_period = 750000;  // Default value
    core_period_change = 0;
    sim_status = 0;
    PLIerrors = 0;
    last_act_cycle = 0;

    $enable_dispmon_finish(0); // dispmon will not terminate sim
    `ifdef RELEASE1
      //`PR_ALWAYS ("top", `ALWAYS, "Running with build CDMS release version: %s", `RELEASE);
      `PR_ALWAYS ("top", `ALWAYS, "Running with build CDMS release version: %d.%d", `RELEASE1,`RELEASE2);
    `else
      `PR_ALWAYS ("top", `ALWAYS, "If you build with -vcs_build_args=+define+RELEASE1=a+RELEASE2=nnn you will see your CDMS release version as: a.nnn");
      `PR_ALWAYS ("top", `ALWAYS, "Running with build CDMS release version: UNKNOWN");
    `endif
`ifndef AXIS_TL
`ifndef PLAYBACK
    `ifdef EMBED_SIMS_BUILD_CMD
        `PR_ALWAYS ("top", `ALWAYS, "------------BUILD_CMD-----------");
        `EMBED_SIMS_BUILD_CMD
        `PR_ALWAYS ("top", `ALWAYS, "---------------------------------\n");
    `endif
    `ifdef EMBED_SIMS_BUILD_ARGS
        `PR_ALWAYS ("top", `ALWAYS, "------------BUILD_ARGS-----------");
        `EMBED_SIMS_BUILD_ARGS
        `PR_ALWAYS ("top", `ALWAYS, "---------------------------------\n");
    `endif
`endif // PLAYBACK
`endif
  end
`ifdef GATESIM
initial
  begin
    repeat (100) @ (posedge `CPU.cmp_gclk_c3_spc0);
    $display();
    $display();
    `PR_ALWAYS ("top", `ALWAYS, "!!!!!!!!!!!!!!!!!!!!");
    `PR_ALWAYS ("top", `ALWAYS, "Gate Simulation.  You must run -nosas.  ");
    `PR_ALWAYS ("top", `ALWAYS, "                  You will get very few messages in vcs.log.");
    `PR_ALWAYS ("top", `ALWAYS, "!!!!!!!!!!!!!!!!!!!!");
    $display();
    $display();
  end
`endif


`ifdef CORE_BENCH
`ifndef AXIS_TL
`ifndef AXIS  
`ifndef PLAYBACK  
  initial begin
    `ifdef FC_BENCH
    `ifndef FC_SCAN_BENCH
       // FC Bench changes the core clock period based on plusargs
       // can be delayed.
       @(posedge `CPU.mio_rst_pwron_rst_l);
       @(posedge `CPU.cluster_arst_l);
       repeat (10) @(posedge `TOP.SYSCLK);
       core_period = $rtoi(1000000.0/`TOP.ccu_pll_config.cmpclk) * 1000;
       core_period_change = 1;
    `endif
    `else
       #0;
       // SPC2,CMP Benches have the same core clock period
       core_period = 100;
       core_period_change = 1;
    `endif
    `PR_NORMAL ("top", `NORMAL, "core and regreport clock period: %0d units", core_period);
    repeat (10) @(posedge `TOP.SystemClock);
    core_period_change = 0;
  end
`endif // PLAYBACK
`endif
`endif
`endif


`ifdef CORE_BENCH

// Bench requires free-running clocks.
// Signal delays the clock by 1 to match the clock header implementation that delays gclk->l2clk by 1
   wire      bench_gclk;

   // in FC, this cmp clock does not run until/if the CCU is reset.
   assign #1 bench_gclk = `CPU.cmp_gclk_c3_spc0;

  // All core,l2 clocks are same period and phase in the core benches.
  // So, only 1 signal is needed in the Bench.
  // Created separate defines to be used by the nas_car,ldst_sync,int_sync modules
  `define BENCH_SPC0_GCLK  `TOP.bench_gclk
  `define BENCH_SPC1_GCLK  `TOP.bench_gclk
  `define BENCH_SPC2_GCLK  `TOP.bench_gclk
  `define BENCH_SPC3_GCLK  `TOP.bench_gclk
  `define BENCH_SPC4_GCLK  `TOP.bench_gclk
  `define BENCH_SPC5_GCLK  `TOP.bench_gclk
  `define BENCH_SPC6_GCLK  `TOP.bench_gclk
  `define BENCH_SPC7_GCLK  `TOP.bench_gclk
  `define BENCH_L2T0_GCLK  `TOP.bench_gclk
  `define BENCH_L2T1_GCLK  `TOP.bench_gclk
  `define BENCH_L2T2_GCLK  `TOP.bench_gclk
  `define BENCH_L2T3_GCLK  `TOP.bench_gclk
  `define BENCH_L2T4_GCLK  `TOP.bench_gclk
  `define BENCH_L2T5_GCLK  `TOP.bench_gclk
  `define BENCH_L2T6_GCLK  `TOP.bench_gclk
  `define BENCH_L2T7_GCLK  `TOP.bench_gclk

  `define BENCH_NCU_GCLK `TOP.bench_gclk

always @ (posedge `CPU.cmp_gclk_c3_spc0) begin
  core_cycle_cnt=core_cycle_cnt+1;
end

`ifndef PLAYBACK
// SystemClock always runs
always @ (posedge `TOP.SystemClock) begin
  global_cycle_cnt=global_cycle_cnt+1;
end
`endif // PLAYBACK

`endif

`ifndef PLAYBACK
always @(global_cycle_cnt) begin
    // Runaway throttle
    if (global_cycle_cnt > `PARGS.max_cycle)  begin // {
        // Note:  Do not change this message because regreport parses it for certain words.
        `PR_ALWAYS ("top", `ALWAYS, "ERROR: Maximum Simulation Cycles (%0d) Reached.", `PARGS.max_cycle);
        `PR_ALWAYS ("top", `ALWAYS, "      Use -max_cycle=n to extend, if not runaway simulation");
        junk = incErr(9999); // must exceed users max error setting to force exit.
        `BAD_END;
    end //}

`ifndef FC_SCAN_BENCH
`ifndef AXIS_TL
`ifndef GATESIM
    // Timeout Check
    if ((core_cycle_cnt - `TOP.last_act_cycle) > `PARGS.timeout) begin //{
        // Note:  Do not change this message because regreport parses it for certain words.
        `PR_ALWAYS ("top", `ALWAYS, "ERROR: All Threads No Activity for %0d Cycles - Global TIMEOUT!", `PARGS.timeout);
        `PR_ALWAYS ("top", `ALWAYS, "      Use -rtl_timeout=n to extend, if not runaway simulation");
        junk = incErr(9999); // must exceed users max error setting to force exit.
        `BAD_END;
    end // }
`endif
`endif
`endif

end // }
`endif // PLAYBACK 


`ifndef PLAYBACK
always @(`TOP.finished_tids) begin
  if (!((`TOP.finished_tids & `PARGS.finish_mask)^`PARGS.finish_mask) &&
      (core_cycle_cnt > 1)) begin
    if (!`PARGS.nas_check_on) begin
      `PR_ALWAYS ("top",`ALWAYS,"-------------------------------------------------");
      `PR_ALWAYS ("top",`ALWAYS,"!!!!!                                       !!!!!");
      `PR_ALWAYS ("top",`ALWAYS,"     Nas Checking was Disabled for this diag.");
      `PR_ALWAYS ("top",`ALWAYS,"!!!!!                                       !!!!!");
      `PR_ALWAYS ("top",`ALWAYS,"-------------------------------------------------");
    end
    `PR_ALWAYS("top", `ALWAYS, "\nAll Threads Have Finished Due To Reaching The Good Trap Address...");
    good_end; // potential good end
  end
end
`endif // PLAYBACK


// in_reset indicates that core(s) are not running due to "reset".
// This would be true before the first thread starts and during warm resets.
// in_reset_core - used by core Bench code to reset nas_pipe & tlb_sync.
//               delay start because clocks take a couple cycles to stop in the core

// This code only works in a core Bench (ie SPC2,CMP,FC), not a SAT (ie DMU SAT)
// But, this file (misc_tasks.v) is included in all SATs.
`ifdef CORE_BENCH

`ifndef FC_SCAN_BENCH
`ifndef AXIS_TL
`ifndef GATESIM

initial begin
  in_por = 1;
  in_reset = 1;
  in_reset_core = 1;
`ifdef SPC_BENCH
  while (|`CPU.ncu_spc0_core_running !== 1) // while X or 0, still waiting
    @(posedge |`CPU.ncu_spc0_core_running); // X -> 1 or 0 -> 1
`else
  while (|(`CPU.ncu_spc0_core_running |`CPU.ncu_spc1_core_running |
           `CPU.ncu_spc2_core_running |`CPU.ncu_spc3_core_running |
           `CPU.ncu_spc4_core_running |`CPU.ncu_spc5_core_running |
           `CPU.ncu_spc6_core_running |`CPU.ncu_spc7_core_running) 
                                     !== 1) // while X or 0, still waiting
    @(posedge |(`CPU.ncu_spc0_core_running |`CPU.ncu_spc1_core_running |
           `CPU.ncu_spc2_core_running |`CPU.ncu_spc3_core_running |
           `CPU.ncu_spc4_core_running |`CPU.ncu_spc5_core_running |
           `CPU.ncu_spc6_core_running |`CPU.ncu_spc7_core_running)) 
                                            // X -> 1 or 0 -> 1
`endif
  in_por = 0;
  in_reset = 0;
  in_reset_core = 0;

  // Warm/Debug reset :
  //   - Assert in_reset when clocks are stopped and rst_wrm_protect is asserted
  //   - Negate in_reset when rst_wrm_protect negates
  forever begin
    // Wait for clock_stop or rst_wmr_protect to change
`ifdef SPC_BENCH
    @(`CPU.rst_wmr_protect or `CPU.tcu_spc0_clk_stop);
`else
    @(`CPU.rst_wmr_protect   or `CPU.tcu_spc0_clk_stop or
      `CPU.tcu_spc1_clk_stop or `CPU.tcu_spc2_clk_stop or
      `CPU.tcu_spc3_clk_stop or `CPU.tcu_spc4_clk_stop or
      `CPU.tcu_spc5_clk_stop or `CPU.tcu_spc6_clk_stop or
      `CPU.tcu_spc7_clk_stop or `CPU.rst_tcu_pwron_rst_l);
`endif
    if ((`CPU.rst_wmr_protect !== ~`CPU.rst_wmr_protect) 
`ifndef SPC_BENCH
        || (`CPU.rst_tcu_pwron_rst_l !== `CPU.rst_tcu_pwron_rst_l)
`endif
        ) begin // if not X and not z
      if (!in_reset) begin  // Assertion of in_reset
`ifndef SPC_BENCH
        if (`CPU.rst_tcu_pwron_rst_l) //delay only if not POR  
`endif
          repeat (6) @(posedge `CPU.cmp_gclk_c3_spc0); // Delay for clock stopping.
`ifdef SPC_BENCH
        in_reset = `CPU.rst_wmr_protect & `CPU.tcu_spc0_clk_stop;
`else
        in_por = ~`CPU.rst_tcu_pwron_rst_l ;
        in_reset = ((`CPU.rst_wmr_protect |~`CPU.rst_tcu_pwron_rst_l) &
                   `CPU.tcu_spc0_clk_stop & `CPU.tcu_spc1_clk_stop & 
                   `CPU.tcu_spc2_clk_stop & `CPU.tcu_spc3_clk_stop & 
                   `CPU.tcu_spc4_clk_stop & `CPU.tcu_spc5_clk_stop & 
                   `CPU.tcu_spc6_clk_stop & `CPU.tcu_spc7_clk_stop );
`endif
      end
      else begin  // De-assertion of in_reset
                  // If just wmr, deassert on wmr negation.
                  // If POR, de-assert on thread startup ..
`ifdef SPC_BENCH
        in_reset = `CPU.rst_wmr_protect ;
`else
        if (in_por) begin // {
            @(posedge |(`CPU.ncu_spc0_core_running |`CPU.ncu_spc1_core_running |
                   `CPU.ncu_spc2_core_running |`CPU.ncu_spc3_core_running |
                   `CPU.ncu_spc4_core_running |`CPU.ncu_spc5_core_running |
                   `CPU.ncu_spc6_core_running |`CPU.ncu_spc7_core_running)) 
            in_por = 0;
            in_reset = 0;
        end //}
        else 
            in_reset = `CPU.rst_wmr_protect ;
`endif
      end
    end
    in_reset_core = in_reset_core & in_reset;  // deassert on same cycle as in_reset
    if (in_reset & !in_reset_core) begin
        repeat (5) @(posedge `CPU.cmp_gclk_c3_spc0);
        in_reset_core = in_reset ;    // assert N cycles after in_reset asserts
    end 
  end
end
`endif
`endif
`endif
`endif


task pli_quit;
integer tmp;
begin
`ifndef AXIS_TL  
`ifndef PLAYBACK  
  if (`PARGS.nas_check_on) begin // {
    tmp = $sim_send(`PLI_QUIT);
    `PARGS.nas_check_on = 0;
  end //}
`endif // PLAYBACK
`endif
end
endtask

//----------------------------------------------------------
// potential good end, but need to check error status!
task good_end;
  reg [31:0] countDown;
  reg [31:0] sysclk_period;
  reg [16*8:0] miscstr;
  reg          ssi_diag;

  begin // --axis tbcall_region// {

`ifndef AXIS_TL
`ifndef PLAYBACK
    ssi_diag = 0;

`ifdef FC_SCAN_BENCH
`else
    pli_quit;
`endif
    // query the C dispmon code to see if there are any errors
    // from Riesling.
    $check_num_dispmon_errors(PLIerrors);
`endif // PLAYBACK
`endif


    // If verilog/Reisling sees errors, print Failed right away.
    // Vera may do the same, but two is better than none.
    //
    // If Verilog sees NO errors, wait some clocks so that
    // vera can have time to decide to print a failing message.
    // In this case, the following message will never have a chance to happen.
    if (!`TOP.error_count && `TOP.warning_count < maxwarning && !PLIerrors) begin

`ifdef FC_BENCH
`ifndef FC_SCAN_BENCH
`ifndef AXIS_TL
`ifndef PLAYBACK
      // wait for any SSI writes to complete. Used in DTM_MODE.
      if ($test$plusargs("SSI_STATUS")) begin
        if ($value$plusargs("good_trap=%s", miscstr))  begin
          if (get_thread_enables(miscstr) > 64'hf000000000) ssi_diag = 1;
        end
        if ($value$plusargs("bad_trap=%s", miscstr))  begin
          if (get_thread_enables(miscstr) > 64'hf000000000) ssi_diag = 1;
        end

        if (!ssi_diag) begin
          `PR_ALWAYS ("top", `ALWAYS, "\n+SSI_STATUS seen, good_end waiting for SSI idle (could take a while)");
          // prevent a bogus timeout
          `PARGS.timeout = `PARGS.timeout + 10000;
          countDown = 50;
          while (countDown) begin
            @(posedge `CPU.ncu_mio_ssi_sck);
            if (`CPU.mio_ncu_ssi_miso === 1 || 
                `CPU.ncu_mio_ssi_mosi === 1) begin
              countDown = 50;
            end
            countDown = countDown - 1;
          end
          `PR_ALWAYS ("top", `ALWAYS, "+SSI_STATUS seen, good_end is done waiting for SSI idle...");
        end
      end
`endif // PLAYBACK
  
      // for vector collection
      if ($test$plusargs("SSI_STATUS") || $test$plusargs("DTM_ENABLED")) begin
        core_period = $rtoi(1000000.0/`TOP.ccu_pll_config.cmpclk) * 1000;
        core_period_change = 1;
        `PR_ALWAYS ("top", `ALWAYS, "\ncore and regreport clock period: %0d units",core_period);
        sysclk_period = $rtoi(1000000.0/`TOP.ccu_pll_config.sysclk) * 1000;
        `PR_ALWAYS ("top", `ALWAYS, "SYSCLK period is: %0d units",sysclk_period);
        sysclk_period = sysclk_period/1000; // fs to ps since $time will be ps
        `PR_ALWAYS ("top", `ALWAYS, "SYSCLK count is: %0d\n", $time/sysclk_period);
      end
`endif
`endif
`endif
     
        // Vera needs to see this sim_status!
        // Vera might fail and exit before we pass and exit if
        // there are Vera errors. Just because verilog
        // thinks the end is good, Vera may not agree!!!
`ifndef AXIS_TL
`ifndef PLAYBACK
        sim_status[`ASM_PASS] = 1;
        // Give Vera some time to fail on its final errors if it wants to.
        // Vera has at least 5 clocks to print failed and die if it needs to.
        // NEVER do this in the failing case (bad_end)!
        repeat (`TOP.wait_cycle_to_kill + 5) @(posedge `CPU.cmp_gclk_c3_spc0);
        // Stall here forever if no_verilog_finish is set.
        // User sets this when Vera wants to do a delayed exit
        // after asm code has finished.
        if (`TOP.no_verilog_finish) begin
          `PR_ALWAYS ("top", `ALWAYS, "See no_verilog_finish set, simulation will continue until Vera finishes it!");
          while (`TOP.no_verilog_finish) @(posedge `CPU.cmp_gclk_c3_spc0);
        end
`endif // PLAYBACK
`endif
        // regreport needs "GOOD End". Do not alter.
        // Reaching GOOD End does not imply passing. The word PASS shall never
        // be printed, ever! That is up to regreport to decide.
        `PR_ALWAYS ("top", `ALWAYS, "Diag Reached GOOD End! (pre regreport checking)");
        // will remove following later after sims gets changed
        `PR_ALWAYS ("top", `ALWAYS, "regreport will determine if diag has really PASSED");



      
`ifdef FC_BENCH
`ifndef FC_SCAN_BENCH
`ifndef AXIS_TL
`ifndef AXIS
          core_period = $rtoi(1000000.0/`TOP.ccu_pll_config.cmpclk) * 1000;
`endif
`endif
`endif
`endif

`ifndef AXIS_TL
`ifndef AXIS     
        `PR_ALWAYS ("top", `ALWAYS, "core and regreport clock period: %0d units\n",core_period);
`endif
`endif
    
        $finish;

    end
    else begin
        `PR_ALWAYS ("top", `ALWAYS, "good_end is calling bad_end. Had PLI errors, or error_count was not zero. This should be UNUSUAL!");
        bad_end;
    end

  end // }

endtask

//----------------------------------------------------------
// Have verilog errors, need to die.
task bad_end;
  begin // --axis tbcall_region // {
`ifndef AXIS_TL
`ifndef PLAYBACK
    `TOP.bad_end_called = `TOP.bad_end_called + 1;
`ifndef FC_SCAN_BENCH
    pli_quit;
`endif

    // query the C dispmon code to see if there are any Riesling errors
    $check_num_dispmon_errors(PLIerrors);
    if (PLIerrors > `TOP.error_count) begin
      //`TOP.error_count = `TOP.error_count + PLIerrors;
      `PR_ALWAYS("top", `ALWAYS, "\nRiesling/PLI had ERRORs! (PLIerrors=%0d)\n",PLIerrors);
    end

    `PR_ALWAYS ("top", `ALWAYS, "Diag Finished/Failed with ERRORs! (error_count=%0d)",`TOP.error_count);
    `PR_ALWAYS ("top", `ALWAYS, "Disabling further checking.\n");

`ifdef FC_BENCH
`ifndef FC_SCAN_BENCH
`ifndef AXIS_TL
`ifndef AXIS
      core_period = $rtoi(1000000.0/`TOP.ccu_pll_config.cmpclk) * 1000;
      core_period_change = 1;
`endif
`endif
`endif
`endif

`ifndef AXIS_TL
`ifndef AXIS     
    `PR_ALWAYS ("top", `ALWAYS, "core and regreport clock period: %0d units\n",core_period);
`endif
`endif
    
    // vera needs to see this
    sim_status[`ASM_ERR] = 1; 
    // if maxerror > 1 we hang now unless $finish. don't know why
    // so do this for now. Might be dispmon C code seeing > 1 error.
    if (`TOP.maxerror > 1) $finish;

    // Give Vera some time to do stuff. Vera may fail the
    // simulation and exit before our wait is up. No big deal.
    // We might get two "Diag Finished/Failed with ERRORs!".
    // Two is always better than none.
    if (`TOP.wait_cycle_to_kill > 4) repeat (`TOP.wait_cycle_to_kill) @(posedge `TOP.SystemClock);
    else repeat (5) @(posedge `TOP.SystemClock);
    $finish;
`endif // PLAYBACK
`endif
  end // }
endtask




//----------------------------------------------------------
//
//  ALL calls to $random MUST look like this!!!  $random(`PARGS.seed)
//

// this is obsolete, see file plus_args.v to see how seeding is done
// ALL calls to $random MUST look like this!!!  $random(`PARGS.seed)

task set_seed;
  input integer seedIn;
  begin
  $display("Calling set_seed or verilog_set_seed is obsolete. You can stop now.");
//     seedin = seedIn; // save seed
//     seed = seedIn;
//     junk = $random(seedIn);
  end
endtask

//----------------------------------------------------------
function [39:0] hashpa;
  input [39:0] pa;

  begin // {

    hashpa = pa;
    hashpa[17:11] = {(pa[32:28]^pa[17:13]),(pa[19:18]^pa[12:11])};

  end // }
endfunction

