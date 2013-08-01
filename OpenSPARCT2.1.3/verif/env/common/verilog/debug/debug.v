// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: debug.v
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
module debug0;

reg [7:0] parkedState;
reg [7:0] parkTrans;
reg [7:0] stepDone; // these tids have stepped
reg [7:0] stepAllowed; // these tids will be stepping/active
reg [7:0] stepActive;
reg [7:0] virtualPark; // tid is "virtually parked"
reg [7:0] watchStepFlush;
reg [7:0] watchStepMMU;
//reg [7:0] spuActive;
reg doMode;
reg ssMode;
reg enabled;
reg wasEnabled;
reg noCmtCheck;
integer stepWaitTime;
integer redirectWait;
integer parkWait;
integer tmp;
//integer spuTimeout;
integer stepCount;
//reg [63:0] threadEnable;
integer flushCount0;
integer flushCount1;
integer flushCount2;
integer flushCount3;
integer flushCount4;
integer flushCount5;
integer flushCount6;
integer flushCount7;
integer redirectCount0;
integer redirectCount1;
integer redirectCount2;
integer redirectCount3;
integer redirectCount4;
integer redirectCount5;
integer redirectCount6;
integer redirectCount7;
integer pipelineCount0;
integer pipelineCount1;
integer pipelineCount2;
integer pipelineCount3;
integer pipelineCount4;
integer pipelineCount5;
integer pipelineCount6;
integer pipelineCount7;
integer junk;
reg [1:0] cmtValid0;
reg [1:0] cmtValid1;
integer cmtCount0;
integer cmtCount1;
integer lastActiveVal;
integer cmtCountT0;
integer cmtCountT1;
integer cmtCountT2;
integer cmtCountT3;
integer count0;
integer count1;
integer count2;
integer count3;
integer count4;
integer count5;
integer count6;
integer count7;

initial begin
  parkedState = 8'hff;
  parkTrans = 8'h0;
  doMode = 0;
  ssMode = 0;
  stepDone = 0; // when stepDone = ~parked, all threads have steped
  stepAllowed = 0;
  stepActive = 0;
  virtualPark = 0;
  watchStepFlush = 0;
  watchStepMMU = 0;
  enabled = 0; // start out 0!
  wasEnabled = 0;
  noCmtCheck = 0;
  stepCount = 0;
//  threadEnable = 0;
  flushCount0 = 0;
  flushCount1 = 0;
  flushCount2 = 0;
  flushCount3 = 0;
  flushCount4 = 0;
  flushCount5 = 0;
  flushCount6 = 0;
  flushCount7 = 0;
  redirectCount0 = 0;
  redirectCount1 = 0;
  redirectCount2 = 0;
  redirectCount3 = 0;
  redirectCount4 = 0;
  redirectCount5 = 0;
  redirectCount6 = 0;
  redirectCount7 = 0;
  cmtValid0 = 0;
  cmtValid1 = 0;
  //spuActive = 0;
  cmtCount0 = 0;
  cmtCount1 = 0;
  lastActiveVal = 0;
  cmtCountT0 = 0;
  cmtCountT1 = 0;
  cmtCountT2 = 0;
  cmtCountT3 = 0;
  // tunable paramaters
`ifdef SPC_BENCH
  stepWaitTime = 1000; // From ss_start to ss_done, unless SPU
  redirectWait = 30; // From core_running_status to redirect
  parkWait = 600; // How long until core_running_status gets asserted/deasserted
  //spuTimeout = 10000000; // How long until we give up on waiting for possible SPU activity
`else
  stepWaitTime = 2000; // From ss_start to ss_done, unless SPU
  redirectWait = 60; // From core_running_status to redirect
  //spuTimeout = 15000000; // How long until we give up on waiting for possible SPU activity
  // How long until core_running_status gets asserted/deasserted
  #2
  parkWait = `PARGS.th_timeout-100;
`endif
end

initial begin
  //while (`TOP.core_cycle_cnt !== 5) #10;
  @(negedge `TOP.in_reset);
`ifdef FC_BENCH
`ifdef FLUSH_RESET
  @(posedge `TOP.flush_reset_complete);
`endif
`endif
  @(posedge `SPC0.l2clk);
  if (! $test$plusargs("noDebugChecks")) enabled = 1;
  if (enabled) `PR_ALWAYS ("dbg_chk", `ALWAYS, "Core 0 Debug Logic Checker debug.v is alive and enabled.");
  else `PR_ALWAYS ("dbg_chk", `ALWAYS, "!!!Core 0 Debug Logic Checker NOT enabled!!!");
  if ($test$plusargs("noCmtCheck")) noCmtCheck = 1;
  if (noCmtCheck) `PR_ALWAYS ("dbg_chk", `ALWAYS, "!!!Core 0 Debug Logic Commit Checker NOT enabled!!!");
  if ($value$plusargs("stepWaitTime=%d", tmp)) stepWaitTime = tmp;
  if ($value$plusargs("redirectWait=%d", tmp)) redirectWait = tmp;
  if ($value$plusargs("parkWait=%d", tmp)) parkWait = tmp;
  //if ($value$plusargs("spuTimeout=%d", tmp)) spuTimeout = tmp;
  //if (enabled) `PR_ALWAYS ("dbg_chk", `ALWAYS, "Using stepWaitTime/redirectWait/parkWait/spuTimeout = %0d/%0d/%0d/%0d",stepWaitTime,redirectWait,parkWait,spuTimeout);
  //threadEnable = `PARGS.finish_mask;
  //if (enabled) `PR_ALWAYS ("dbg_chk", `ALWAYS, "Assuming active threads are (%h)", threadEnable);
end



// look for some reset change
always @(`TOP.flush_reset_complete) begin
  `PR_ALWAYS ("debugChecker", `ALWAYS, "flush_reset_complete changed to %0d. checker enabled=%0d",`TOP.flush_reset_complete,enabled);
  // going into some kind of reset
  if (enabled && !`TOP.flush_reset_complete) begin
    wasEnabled = 1;
    enabled = 0;
  end
  disable parkingCheck0;
  disable parkedCheck0;
  disable unparkCheck0;
  disable watchStep0;
  disable parkingCheck1;
  disable parkedCheck1;
  disable unparkCheck1;
  disable watchStep1;
  disable parkingCheck2;
  disable parkedCheck2;
  disable unparkCheck2;
  disable watchStep2;
  disable parkingCheck3;
  disable parkedCheck3;
  disable unparkCheck3;
  disable watchStep3;
  disable parkingCheck4;
  disable parkedCheck4;
  disable unparkCheck4;
  disable watchStep4;
  disable parkingCheck5;
  disable parkedCheck5;
  disable unparkCheck5;
  disable watchStep5;
  disable parkingCheck6;
  disable parkedCheck6;
  disable unparkCheck6;
  disable watchStep6;
  disable parkingCheck7;
  disable parkedCheck7;
  disable unparkCheck7;
  disable watchStep7;
  disable DOMODE;
  disable SSMODE;
  parkedState = 8'hff;
  cmtValid0 = 0;
  cmtValid1 = 0;
  // coming out of reset
  if (wasEnabled && `TOP.flush_reset_complete) begin
    parkTrans = 8'b0;
    enabled = 1;
    wasEnabled = 0;
    cmtValid0 = 0;
    cmtValid1 = 0;
`ifdef FC_BENCH
`ifdef FLUSH_RESET
    if (`TOP.flush_reset_complete !== 1) @(posedge `TOP.flush_reset_complete);
`endif
`endif
  end
  `PR_ALWAYS ("debugChecker", `ALWAYS, "flush_reset_complete/rst_wmr_protect transition complete. checker enabled=%0d",enabled);
end

//////////////////////////////////////////////////////////////////
// THREAD 0
//////////////////////////////////////////////////////////////////


// got park request. transition into parking.  parking check.
always @(negedge `SPC0.tlu.tcu_core_running[0]) begin: GOTPARK0
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 0 calling parkingCheck");
  if (enabled) parkingCheck0();
end

// got unpark request. transition into running. unparking check.
always @(posedge `SPC0.tlu.tcu_core_running[0]) begin: UNPARKCHECK0
  if (enabled && !ssMode) begin
    `PR_DEBUG("dbg_chk", `DEBUG, "TID 0 calling unparkCheck.");
    unparkCheck0();
  end
end

// while parked check
always @(posedge parkedState[0] or posedge virtualPark[0]) begin: PARKCHECK0  
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 0 calling parkedCheck");
  if (enabled) parkedCheck0();
end

// check for unexpected running transition
  always @(`SPC0.tlu.tlu_core_running_status[0]) begin: UNEXPECTED0
  if (!parkTrans[0] && enabled && ! doMode && ! ssMode) // review? to remove ! doMode
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 0 spc_core_running_status changed w/o request to park/unpark (trans=%0d)!",parkTrans[0]);
end



////////////// tasks for tid 0 ////////////////////

// check the entering into parked state
task parkingCheck0;

begin


  `PR_DEBUG("dbg_chk", `DEBUG, "TID 0 got park request!");

  if (parkTrans[0] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 0 got park request while park state is already transitioning! Possible diag conflict (multiple parkers)! (enabled=%0d)",enabled);
    `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +noDebugChecks to disable all debug checkes!");
    disable parkingCheck0;
  end

  parkTrans[0] = 1;

  // wait before checking signals
  repeat (2) @(negedge `SPC0.l2clk);

  // need to see at least one assertion of flush
  // if (`SPC0.tlu_flush_ifu[0] !== 1) 
  //   @(posedge `SPC0.tlu_flush_ifu[0]); // has glitches
  if (`SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[0] !== 1)
    @(posedge `SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[0]);

  // need to see all of these go idle
  while (`SPC0.pku_quiesce[0] == 0 ||
         `SPC0.ftu_ifu_quiesce[0] == 0 ||
         `SPC0.lsu_stb_empty[0] == 0) 
     @(negedge `SPC0.l2clk);

//   // need to see all of these go idle
//   while (`SPC0.pku_quiesce[0] == 0 ||
//          `SPC0.ftu_ifu_quiesce[0] == 0 ||
//          `SPC0.lsu_stb_empty[0] == 0 ||
//          `SPC0.tlu.fls0.idl_request == 0) 
//      @(negedge `SPC0.l2clk);

  parkedState[0] <= 1;
  parkTrans[0] <= 0;
  // `PR_ALWAYS("dbg_chk", `ALWAYS, "INFO: TID %0d has parked!", 0);
  `PR_DEBUG("dbg_chk", `DEBUG, "INFO: TID 0 has parked!");

end
endtask


// in parked state.
// also called between single steps.
task parkedCheck0;
reg notified;
begin //{

  notified = 0;
  // loop while not transitioning out of park if not SS mode.
  // loop while in SS virtualPark if SS mode.
  while ((parkTrans[0] == 0 && ssMode == 0) || 
         (virtualPark[0] == 1 && ssMode == 1 && 
          `TOP.cpu.tcu_ss_request[0] == 0)) begin //{
    `PR_DEBUG ("dbg_chk", `DEBUG, "TID 0 watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[0],virtualPark[0],`TOP.cpu.tcu_ss_request[0]);

    @(negedge `SPC0.l2clk);

    // if in SS mode and core_running goes to zero for that thread, the thread
    // will self step once and flush in order to change to a parked state
    // (core_running_status=0). This looks like an un-asked for step so it
    // has to be detected and ignored. Try stalling here during it.
    while (`SPC0.tlu.tcu_core_running[0] == 0 && 
           `SPC0.tlu.tlu_core_running_status[0] == 1) 
      @(negedge `SPC0.l2clk);

    // watch for instructions sneaking in
    // dec_inst_valid_m[1:0], one bit per group
    if (`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 0 && `SPC0.tlu.tlu_retry[0] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 0 had tlu_trap_pc_0_valid activity while parked/between steps!");

    if (`SPC0.dec_inst_valid_m[0] == 1 && `SPC0.dec_tid0_m[1:0] == 0)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 0 had dec_inst_valid_m activity while parked/between steps!");


  end //} while

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 0 STOP watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[0],virtualPark[0],`TOP.cpu.tcu_ss_request[0]);

end //}
endtask


// leaving parked state
task unparkCheck0;
integer count;
begin

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 0 got unpark request!");  

  if (parkTrans[0] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 0 got unpark request while park state is already transitioning! Possible diag conflict! (trans=%0h)",parkTrans);
    disable unparkCheck0;
  end

  parkTrans[0] = 1;

  // must see `SPC0.tlu.core_running_status[0] w/in count clocks
  count0 = 0;

  while (`SPC0.tlu.tlu_core_running_status[0] == 0) begin
    @(negedge `SPC0.l2clk);
    if (count0 > parkWait) begin //  <--- may need to adjust
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 0 did not assert spc_core_running_status as soon as it should have (%0d clocks)!", count0);
      `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +parkWait=n (currently %0d). +noDebugChecks disables all checks!",parkWait);
    end
    count0 = count0 + 1;
  end
  
  if (!doMode && !ssMode) begin
    // need to see re-direct w/in "redirectWait" more clocks
    count0 = 0;

    // if this is true, the redirect and the assertion of core_running_status
    // happened at once so while loop can be skipped.
      while (! (`SPC0.tlu_trap_pc_0_valid && 
                `SPC0.tlu_trap_0_tid[1:0] == 0)) begin
        @(negedge `SPC0.l2clk);
        if (count0 > redirectWait) begin //  <--- may need to adjust
          `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 0 did not redirect within %d clocks after core_running_status assert!", redirectWait);
          `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +redirectWait=n (currently %0d). +noDebugChecks disables all checks!",redirectWait);
        end
        count0 = count0 + 1;
      end
  end

  parkedState[0] <= 0;
  parkTrans[0] <= 0;
  count0 <= 0;

end
endtask


// watch this tid step correctly. Should step 1 instruction
// and then "virtual park".
// for SS and DO modes.
task watchStep0;
begin

  watchStepFlush[0] = 0; // set if we got a flush
  watchStepMMU[0] = 0;   // set if we got a mmu reload
  stepDone[0] = 0;
  stepActive[0] = 1;

  if (flushCount0) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 repeating watchStep task due to flush (flushCount=%0d, redirectCount=%0d)!",flushCount0,redirectCount0);


  fork
    // timeout fork
    begin : FORK10_0
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep0: TID 0 did not see valid PC retry (waitTime=%0d)!", stepWaitTime);
    end

//     // look for SPU going active    
//     begin : FORK11_0
//       while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 0)))
//         @(negedge `SPC0.l2clk);
//       `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 see SPU active!");
//       spuActive[0] = 1;
//     end

    // might get ss_complete due to not knowing if there are 1 or 2 or more flushes.
    // this task gets called w/o knowing in advance if there will be one more
    // assertion of tlu_trap_pc_0/1_valid or not.
    begin : FORK8_0
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount0, redirectCount0);
        stepDone[0] = 1;
        stepActive[0] = 0;
        disable watchStep0; // return
      end
    end

    // valid PC / retry
    begin : FORK9_0
      // start step. tid wakes up/redirects and does "one instruction"
      while (!(`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 0 && `SPC0.tlu.tlu_retry[0] == 1)) begin
        // might see  `SPC0.tlu.mmu_reload_done[0] here if previous
        // redirect was due to a MMU miss. If so, decrement flush count because
        // the previous flush on prev pc_valid "does not count" and there can be
        // any number of them w/ no way to predict quantity.
        if (`SPC0.tlu.mmu_reload_done[0] && ssMode) begin
          flushCount0 = flushCount0-1;
          redirectCount0 = redirectCount0-1;
          watchStepMMU[0] = 1;
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 saw mmu_reload_done (hwtw)! flushCount/redirectCount decremented to %0d/%0d", flushCount0, redirectCount0);
        end
        @(negedge `SPC0.l2clk);
      end

      redirectCount0 = redirectCount0+1;
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 got valid retry, step waiting on negedge pku_quiesce (redirectCount=%0d)!",redirectCount0);
      disable FORK8_0; // kill sync on spc_ss_complete

      @(negedge `SPC0.pku_quiesce[0]);    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 got negedge pku_quiesce, step waiting on dec_inst_valid_m!");
    
      while (!(`SPC0.dec_inst_valid_m[0] == 1 && `SPC0.dec_tid0_m[1:0] == 0)) @(negedge `SPC0.l2clk);
    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 valid step starting!");
      disable FORK10_0; // kill timeout
      //disable FORK11_0;
      //       if (!`SPC0.spu_tlu_cwq_busy && 
//           !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//             `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 0)) spuActive[0] = 0;
    end
  join



  // finish step
  fork
    // timeout fork
    begin : FORK4_0
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);

      // may need to adjust. If a tid is doing a SPU sync ctl reg sync read,
      // it could stay "busy" for a REAL long time!!! Need delayed check of busy
      // since it can assert after the step has started.
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep0: TID 0 did not quiesce/complete after step (SS or DO) as it should have. not SPU busy (waitTime=%0d)!", stepWaitTime);
    end

    // look for SPU going active    
//     begin : FORK12_0
//       while (!(`SPC0.spu_tlu_cwq_busy || 
//         ((`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 0 && doMode) || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && ssMode))))
//         @(negedge `SPC0.l2clk);
//       spuActive[0] = 1;
//     end


    // look for flush_ifu (w/o lsu_trap_flush (aka ptrap_flush) if SS)
    // and end this task if seen. tlu_flush_ifu assertion always means
    // this "instruction" is done, but may repeat (tlb miss, etc) w/in the SS.
    begin : FORK6_0
        // checking ptrap_flush to make sure that flush is not caused by lsu_trap_flush
        while (`SPC0.tlu_flush_ifu[0] == 0)
          @(negedge `SPC0.l2clk);

// // debug!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if (`SPC0.tlu.fls0.ptrap_flush[0] == 1) begin
//   `PR_ERROR ("dbg_chk", `ERROR, "watchStep0: TID 0 have tlu_flush_ifu !!!!!!!!!!!!!!!!!!!!!!!");
// end
// 

        if ((ssMode && `SPC0.tlu.fls0.ptrap_flush[0] == 0) || doMode) begin
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 have tlu_flush_ifu (flushCount=%0d)!",flushCount0);
          watchStepFlush[0] = 1;
          flushCount0 = flushCount0+1;
          stepActive[0] = 0;
          disable watchStep0; // return
      end
    end


    // are we done fork, DO mode quiesce
    begin : FORK5_0
      if (doMode) begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 watching for quiesce (only matters fo DO mode)!");
        while (`SPC0.pku_quiesce[0] == 0 ||
               `SPC0.ftu_ifu_quiesce[0] == 0 ||
               `SPC0.lsu_stb_empty[0] == 0) @(negedge `SPC0.l2clk);

        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 have quiesce (only matters for DO mode)!");
        if (doMode) begin
          disable FORK4_0; // TO
          disable FORK6_0; // flush check
          //disable FORK12_0;
//           @(negedge `SPC0.l2clk);
//           if (!`SPC0.spu_tlu_cwq_busy && 
//               !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                 `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 0)) spuActive[0] = 0;
        end
      end
    end


    // are we done fork, SS mode only
    begin : FORK7_0
      // wait for SS complete
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount0,redirectCount0);
        stepDone[0] = 1;

//         while (ssMode && !`SPC0.spc_ss_complete) begin
//           // detect a second inst valid w/o a flush between
//           if (`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 0 && `SPC0.tlu.tlu_retry[0] == 1) begin
//             // delay error so flush thread can kill this in the "got flush" case
//             @(negedge `SPC0.l2clk); 
//             `PR_ERROR ("dbg_chk", `ERROR, "watchStep0: TID 0 had another inst start before SS done was asserted!");
//           end
//           @(negedge `SPC0.l2clk);
//         end // while

        if (`SPC0.pku_quiesce[0] == 0 ||
            `SPC0.ftu_ifu_quiesce[0] == 0 ||
            `SPC0.lsu_stb_empty[0] == 0)
          `PR_ERROR ("dbg_chk", `ERROR, "watchStep0: TID 0 was not quiesce at ss_complete assertion!");

        disable FORK4_0; // TO
        disable FORK6_0; // flush check
        //disable FORK12_0;
//         @(negedge `SPC0.l2clk);
//         if (!`SPC0.spu_tlu_cwq_busy && 
//             !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//               `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 0)) spuActive[0] = 0;
      end
    end

  join


  if (flushCount0 == 0) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 watchStep end!");
  else `PR_DEBUG("dbg_chk", `DEBUG, "watchStep0: TID 0 repeated watchStep end!");

  stepActive[0] = 0;

end
endtask



// check that thread does DO mode correctly
task watchDOsteps0;
begin
  
  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps0: TID 0 watchDOsteps starting!");

  if (! `TOP.cpu.tcu_do_mode[0]) disable watchDOsteps0;

  // now wait for a thread to start. TCU internal signal.
  if (`SPC0.tlu.tlu_core_running_status[0] == 0)
    @(posedge `SPC0.tlu.tlu_core_running_status[0]);

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps0 TID 0 unparked and running in DO mode!");

  // loop on step checking. DO mode is self stepping
  while (doMode) begin : watchDOsteps0loop// && `SPC0.tlu.tlu_core_running_status[7:0] != 0) begin

    stepDone[0] = 0;
    watchStepFlush[0] = 0;
    watchStepMMU[0] = 0;
 
    // are we starting to park in middle of DO mode (or end)?
    // wait here until unparked again
    if (parkTrans[0]) begin
      `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps0 TID 0 getting parked, will delay");
      @(negedge parkTrans[0]);
      if (!doMode) disable watchDOsteps0loop; // no longer in DO mode, bail
      // wait to be unparked or !doMode
      if (parkedState[0]) begin
        @(negedge doMode or negedge parkedState[0]);
        if (!doMode) disable watchDOsteps0loop; // no longer in DO mode, bail
      end
    end


    // an unparked thread does one instruction to completion before thread starts
    // the next instruction.
    fork
      // timeout fork
      begin : FORKDO10
        repeat (stepWaitTime) @(negedge `SPC0.l2clk);
          `PR_ERROR ("dbg_chk", `ERROR, "watchDOsteps0: DO mode, TID 0 timeout waiting for watchStep call to return, not SPU busy (+stepWaitTime=%0d)!", stepWaitTime);
      end

      // look for SPU going active    
//       begin : FORKDO20
//         while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 0)))
//           @(negedge `SPC0.l2clk);
//         `PR_ALWAYS("dbg_chk", `ALWAYS, "watchDOsteps0: DO mode, TID 0 sees SPU busy!");
//         spuActive[0] = 1;
//       end

      // watch step
      begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps0: TID 0 calling watchStep0 in DO mode!");
        watchStep0; // returns when step is done or flushed
        if (watchStepFlush[0]) 
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 0 in DO mode had flush!");
        if (watchStepMMU[0])
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 0 in DO mode had mmu reload!");
        // calling flush as a done in DO mode
        disable FORKDO10; // TO
        //disable FORKDO20; // SPU going active
      end

    join
  
    `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps0: TID 0 DO mode watchDOsteps step done!");
    stepDone[0] = 1;
    flushCount0 = 0;
//     if (!`SPC0.spu_tlu_cwq_busy && 
//         !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//           `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 0)) spuActive[0] = 0;

    @(negedge `SPC0.l2clk);
  end // while

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps0: TID 0 DO mode watchDOsteps task ending!");  
end
endtask




////////////////////////// end tid 0 ///////////////////////////////////////


//////////////////////////////////////////////////////////////////
// THREAD 1
//////////////////////////////////////////////////////////////////


// got park request. transition into parking.  parking check.
always @(negedge `SPC0.tlu.tcu_core_running[1]) begin: GOTPARK1
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 1 calling parkingCheck");
  if (enabled) parkingCheck1();
end

// got unpark request. transition into running. unparking check.
always @(posedge `SPC0.tlu.tcu_core_running[1]) begin: UNPARKCHECK1
  if (enabled && !ssMode) begin
    `PR_DEBUG("dbg_chk", `DEBUG, "TID 1 calling unparkCheck.");
    unparkCheck1();
  end
end

// while parked check
always @(posedge parkedState[1] or posedge virtualPark[1]) begin: PARKCHECK1  
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 1 calling parkedCheck");
  if (enabled) parkedCheck1();
end

// check for unexpected running transition
  always @(`SPC0.tlu.tlu_core_running_status[1]) begin: UNEXPECTED1
  if (!parkTrans[1] && enabled && ! doMode && ! ssMode) // review? to remove ! doMode
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 1 spc_core_running_status changed w/o request to park/unpark (trans=%0d)!",parkTrans[1]);
end



////////////// tasks for tid 1 ////////////////////

// check the entering into parked state
task parkingCheck1;

begin


  `PR_DEBUG("dbg_chk", `DEBUG, "TID 1 got park request!");

  if (parkTrans[1] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 1 got park request while park state is already transitioning! Possible diag conflict (multiple parkers)! (enabled=%0d)",enabled);
    `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +noDebugChecks to disable all debug checkes!");
    disable parkingCheck1;
  end

  parkTrans[1] = 1;

  // wait before checking signals
  repeat (2) @(negedge `SPC0.l2clk);

  // need to see at least one assertion of flush
  // if (`SPC0.tlu_flush_ifu[1] !== 1) 
  //   @(posedge `SPC0.tlu_flush_ifu[1]); // has glitches
  if (`SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[1] !== 1)
    @(posedge `SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[1]);

  // need to see all of these go idle
  while (`SPC0.pku_quiesce[1] == 0 ||
         `SPC0.ftu_ifu_quiesce[1] == 0 ||
         `SPC0.lsu_stb_empty[1] == 0) 
     @(negedge `SPC0.l2clk);

//   // need to see all of these go idle
//   while (`SPC0.pku_quiesce[1] == 0 ||
//          `SPC0.ftu_ifu_quiesce[1] == 0 ||
//          `SPC0.lsu_stb_empty[1] == 0 ||
//          `SPC0.tlu.fls0.idl_request == 0) 
//      @(negedge `SPC0.l2clk);

  parkedState[1] <= 1;
  parkTrans[1] <= 0;
  // `PR_ALWAYS("dbg_chk", `ALWAYS, "INFO: TID %0d has parked!", 1);
  `PR_DEBUG("dbg_chk", `DEBUG, "INFO: TID 1 has parked!");

end
endtask


// in parked state.
// also called between single steps.
task parkedCheck1;
reg notified;
begin //{

  notified = 0;
  // loop while not transitioning out of park if not SS mode.
  // loop while in SS virtualPark if SS mode.
  while ((parkTrans[1] == 0 && ssMode == 0) || 
         (virtualPark[1] == 1 && ssMode == 1 && 
          `TOP.cpu.tcu_ss_request[0] == 0)) begin //{
    `PR_DEBUG ("dbg_chk", `DEBUG, "TID 1 watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[1],virtualPark[1],`TOP.cpu.tcu_ss_request[0]);

    @(negedge `SPC0.l2clk);

    // if in SS mode and core_running goes to zero for that thread, the thread
    // will self step once and flush in order to change to a parked state
    // (core_running_status=0). This looks like an un-asked for step so it
    // has to be detected and ignored. Try stalling here during it.
    while (`SPC0.tlu.tcu_core_running[1] == 0 && 
           `SPC0.tlu.tlu_core_running_status[1] == 1) 
      @(negedge `SPC0.l2clk);

    // watch for instructions sneaking in
    // dec_inst_valid_m[1:0], one bit per group
    if (`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 1 && `SPC0.tlu.tlu_retry[0] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 1 had tlu_trap_pc_0_valid activity while parked/between steps!");

    if (`SPC0.dec_inst_valid_m[0] == 1 && `SPC0.dec_tid0_m[1:0] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 1 had dec_inst_valid_m activity while parked/between steps!");


  end //} while

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 1 STOP watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[1],virtualPark[1],`TOP.cpu.tcu_ss_request[0]);

end //}
endtask


// leaving parked state
task unparkCheck1;
integer count;
begin

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 1 got unpark request!");  

  if (parkTrans[1] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 1 got unpark request while park state is already transitioning! Possible diag conflict! (trans=%0h)",parkTrans);
    disable unparkCheck1;
  end

  parkTrans[1] = 1;

  // must see `SPC0.tlu.core_running_status[1] w/in count clocks
  count1 = 0;

  while (`SPC0.tlu.tlu_core_running_status[1] == 0) begin
    @(negedge `SPC0.l2clk);
    if (count1 > parkWait) begin //  <--- may need to adjust
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 1 did not assert spc_core_running_status as soon as it should have (%0d clocks)!", count1);
      `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +parkWait=n (currently %0d). +noDebugChecks disables all checks!",parkWait);
    end
    count1 = count1 + 1;
  end
  
  if (!doMode && !ssMode) begin
    // need to see re-direct w/in "redirectWait" more clocks
    count1 = 0;

    // if this is true, the redirect and the assertion of core_running_status
    // happened at once so while loop can be skipped.
      while (! (`SPC0.tlu_trap_pc_0_valid && 
                `SPC0.tlu_trap_0_tid[1:0] == 1)) begin
        @(negedge `SPC0.l2clk);
        if (count1 > redirectWait) begin //  <--- may need to adjust
          `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 1 did not redirect within %d clocks after core_running_status assert!", redirectWait);
          `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +redirectWait=n (currently %0d). +noDebugChecks disables all checks!",redirectWait);
        end
        count1 = count1 + 1;
      end
  end

  parkedState[1] <= 0;
  parkTrans[1] <= 0;
  count1 <= 0;

end
endtask


// watch this tid step correctly. Should step 1 instruction
// and then "virtual park".
// for SS and DO modes.
task watchStep1;
begin

  watchStepFlush[1] = 0; // set if we got a flush
  watchStepMMU[1] = 0;   // set if we got a mmu reload
  stepDone[1] = 0;
  stepActive[1] = 1;

  if (flushCount1) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 repeating watchStep task due to flush (flushCount=%0d, redirectCount=%0d)!",flushCount1,redirectCount1);


  fork
    // timeout fork
    begin : FORK10_1
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep1: TID 1 did not see valid PC retry (waitTime=%0d)!", stepWaitTime);
    end

//     // look for SPU going active    
//     begin : FORK11_1
//       while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 1)))
//         @(negedge `SPC0.l2clk);
//       `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 see SPU active!");
//       spuActive[1] = 1;
//     end

    // might get ss_complete due to not knowing if there are 1 or 2 or more flushes.
    // this task gets called w/o knowing in advance if there will be one more
    // assertion of tlu_trap_pc_0/1_valid or not.
    begin : FORK8_1
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount1, redirectCount1);
        stepDone[1] = 1;
        stepActive[1] = 0;
        disable watchStep1; // return
      end
    end

    // valid PC / retry
    begin : FORK9_1
      // start step. tid wakes up/redirects and does "one instruction"
      while (!(`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 1 && `SPC0.tlu.tlu_retry[0] == 1)) begin
        // might see  `SPC0.tlu.mmu_reload_done[1] here if previous
        // redirect was due to a MMU miss. If so, decrement flush count because
        // the previous flush on prev pc_valid "does not count" and there can be
        // any number of them w/ no way to predict quantity.
        if (`SPC0.tlu.mmu_reload_done[1] && ssMode) begin
          flushCount1 = flushCount1-1;
          redirectCount1 = redirectCount1-1;
          watchStepMMU[1] = 1;
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 saw mmu_reload_done (hwtw)! flushCount/redirectCount decremented to %0d/%0d", flushCount1, redirectCount1);
        end
        @(negedge `SPC0.l2clk);
      end

      redirectCount1 = redirectCount1+1;
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 got valid retry, step waiting on negedge pku_quiesce (redirectCount=%0d)!",redirectCount1);
      disable FORK8_1; // kill sync on spc_ss_complete

      @(negedge `SPC0.pku_quiesce[1]);    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 got negedge pku_quiesce, step waiting on dec_inst_valid_m!");
    
      while (!(`SPC0.dec_inst_valid_m[0] == 1 && `SPC0.dec_tid0_m[1:0] == 1)) @(negedge `SPC0.l2clk);
    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 valid step starting!");
      disable FORK10_1; // kill timeout
      //disable FORK11_1;
      //       if (!`SPC0.spu_tlu_cwq_busy && 
//           !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//             `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 1)) spuActive[1] = 0;
    end
  join



  // finish step
  fork
    // timeout fork
    begin : FORK4_1
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);

      // may need to adjust. If a tid is doing a SPU sync ctl reg sync read,
      // it could stay "busy" for a REAL long time!!! Need delayed check of busy
      // since it can assert after the step has started.
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep1: TID 1 did not quiesce/complete after step (SS or DO) as it should have. not SPU busy (waitTime=%0d)!", stepWaitTime);
    end

    // look for SPU going active    
//     begin : FORK12_1
//       while (!(`SPC0.spu_tlu_cwq_busy || 
//         ((`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 1 && doMode) || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && ssMode))))
//         @(negedge `SPC0.l2clk);
//       spuActive[1] = 1;
//     end


    // look for flush_ifu (w/o lsu_trap_flush (aka ptrap_flush) if SS)
    // and end this task if seen. tlu_flush_ifu assertion always means
    // this "instruction" is done, but may repeat (tlb miss, etc) w/in the SS.
    begin : FORK6_1
        // checking ptrap_flush to make sure that flush is not caused by lsu_trap_flush
        while (`SPC0.tlu_flush_ifu[1] == 0)
          @(negedge `SPC0.l2clk);

// // debug!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if (`SPC0.tlu.fls0.ptrap_flush[1] == 1) begin
//   `PR_ERROR ("dbg_chk", `ERROR, "watchStep1: TID 1 have tlu_flush_ifu !!!!!!!!!!!!!!!!!!!!!!!");
// end
// 

        if ((ssMode && `SPC0.tlu.fls0.ptrap_flush[1] == 0) || doMode) begin
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 have tlu_flush_ifu (flushCount=%0d)!",flushCount1);
          watchStepFlush[1] = 1;
          flushCount1 = flushCount1+1;
          stepActive[1] = 0;
          disable watchStep1; // return
      end
    end


    // are we done fork, DO mode quiesce
    begin : FORK5_1
      if (doMode) begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 watching for quiesce (only matters fo DO mode)!");
        while (`SPC0.pku_quiesce[1] == 0 ||
               `SPC0.ftu_ifu_quiesce[1] == 0 ||
               `SPC0.lsu_stb_empty[1] == 0) @(negedge `SPC0.l2clk);

        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 have quiesce (only matters for DO mode)!");
        if (doMode) begin
          disable FORK4_1; // TO
          disable FORK6_1; // flush check
          //disable FORK12_1;
//           @(negedge `SPC0.l2clk);
//           if (!`SPC0.spu_tlu_cwq_busy && 
//               !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                 `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 1)) spuActive[1] = 0;
        end
      end
    end


    // are we done fork, SS mode only
    begin : FORK7_1
      // wait for SS complete
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount1,redirectCount1);
        stepDone[1] = 1;

//         while (ssMode && !`SPC0.spc_ss_complete) begin
//           // detect a second inst valid w/o a flush between
//           if (`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 1 && `SPC0.tlu.tlu_retry[0] == 1) begin
//             // delay error so flush thread can kill this in the "got flush" case
//             @(negedge `SPC0.l2clk); 
//             `PR_ERROR ("dbg_chk", `ERROR, "watchStep1: TID 1 had another inst start before SS done was asserted!");
//           end
//           @(negedge `SPC0.l2clk);
//         end // while

        if (`SPC0.pku_quiesce[1] == 0 ||
            `SPC0.ftu_ifu_quiesce[1] == 0 ||
            `SPC0.lsu_stb_empty[1] == 0)
          `PR_ERROR ("dbg_chk", `ERROR, "watchStep1: TID 1 was not quiesce at ss_complete assertion!");

        disable FORK4_1; // TO
        disable FORK6_1; // flush check
        //disable FORK12_1;
//         @(negedge `SPC0.l2clk);
//         if (!`SPC0.spu_tlu_cwq_busy && 
//             !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//               `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 1)) spuActive[1] = 0;
      end
    end

  join


  if (flushCount1 == 0) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 watchStep end!");
  else `PR_DEBUG("dbg_chk", `DEBUG, "watchStep1: TID 1 repeated watchStep end!");

  stepActive[1] = 0;

end
endtask



// check that thread does DO mode correctly
task watchDOsteps1;
begin
  
  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps1: TID 1 watchDOsteps starting!");

  if (! `TOP.cpu.tcu_do_mode[0]) disable watchDOsteps1;

  // now wait for a thread to start. TCU internal signal.
  if (`SPC0.tlu.tlu_core_running_status[1] == 0)
    @(posedge `SPC0.tlu.tlu_core_running_status[1]);

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps1 TID 1 unparked and running in DO mode!");

  // loop on step checking. DO mode is self stepping
  while (doMode) begin : watchDOsteps1loop// && `SPC0.tlu.tlu_core_running_status[7:0] != 0) begin

    stepDone[1] = 0;
    watchStepFlush[1] = 0;
    watchStepMMU[1] = 0;
 
    // are we starting to park in middle of DO mode (or end)?
    // wait here until unparked again
    if (parkTrans[1]) begin
      `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps1 TID 1 getting parked, will delay");
      @(negedge parkTrans[1]);
      if (!doMode) disable watchDOsteps1loop; // no longer in DO mode, bail
      // wait to be unparked or !doMode
      if (parkedState[1]) begin
        @(negedge doMode or negedge parkedState[1]);
        if (!doMode) disable watchDOsteps1loop; // no longer in DO mode, bail
      end
    end


    // an unparked thread does one instruction to completion before thread starts
    // the next instruction.
    fork
      // timeout fork
      begin : FORKDO11
        repeat (stepWaitTime) @(negedge `SPC0.l2clk);
          `PR_ERROR ("dbg_chk", `ERROR, "watchDOsteps1: DO mode, TID 1 timeout waiting for watchStep call to return, not SPU busy (+stepWaitTime=%0d)!", stepWaitTime);
      end

      // look for SPU going active    
//       begin : FORKDO21
//         while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 1)))
//           @(negedge `SPC0.l2clk);
//         `PR_ALWAYS("dbg_chk", `ALWAYS, "watchDOsteps1: DO mode, TID 1 sees SPU busy!");
//         spuActive[1] = 1;
//       end

      // watch step
      begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps1: TID 1 calling watchStep1 in DO mode!");
        watchStep1; // returns when step is done or flushed
        if (watchStepFlush[1]) 
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 1 in DO mode had flush!");
        if (watchStepMMU[1])
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 1 in DO mode had mmu reload!");
        // calling flush as a done in DO mode
        disable FORKDO11; // TO
        //disable FORKDO21; // SPU going active
      end

    join
  
    `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps1: TID 1 DO mode watchDOsteps step done!");
    stepDone[1] = 1;
    flushCount1 = 0;
//     if (!`SPC0.spu_tlu_cwq_busy && 
//         !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//           `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 1)) spuActive[1] = 0;

    @(negedge `SPC0.l2clk);
  end // while

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps1: TID 1 DO mode watchDOsteps task ending!");  
end
endtask




////////////////////////// end tid 1 ///////////////////////////////////////


//////////////////////////////////////////////////////////////////
// THREAD 2
//////////////////////////////////////////////////////////////////


// got park request. transition into parking.  parking check.
always @(negedge `SPC0.tlu.tcu_core_running[2]) begin: GOTPARK2
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 2 calling parkingCheck");
  if (enabled) parkingCheck2();
end

// got unpark request. transition into running. unparking check.
always @(posedge `SPC0.tlu.tcu_core_running[2]) begin: UNPARKCHECK2
  if (enabled && !ssMode) begin
    `PR_DEBUG("dbg_chk", `DEBUG, "TID 2 calling unparkCheck.");
    unparkCheck2();
  end
end

// while parked check
always @(posedge parkedState[2] or posedge virtualPark[2]) begin: PARKCHECK2  
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 2 calling parkedCheck");
  if (enabled) parkedCheck2();
end

// check for unexpected running transition
  always @(`SPC0.tlu.tlu_core_running_status[2]) begin: UNEXPECTED2
  if (!parkTrans[2] && enabled && ! doMode && ! ssMode) // review? to remove ! doMode
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 2 spc_core_running_status changed w/o request to park/unpark (trans=%0d)!",parkTrans[2]);
end



////////////// tasks for tid 2 ////////////////////

// check the entering into parked state
task parkingCheck2;

begin


  `PR_DEBUG("dbg_chk", `DEBUG, "TID 2 got park request!");

  if (parkTrans[2] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 2 got park request while park state is already transitioning! Possible diag conflict (multiple parkers)! (enabled=%0d)",enabled);
    `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +noDebugChecks to disable all debug checkes!");
    disable parkingCheck2;
  end

  parkTrans[2] = 1;

  // wait before checking signals
  repeat (2) @(negedge `SPC0.l2clk);

  // need to see at least one assertion of flush
  // if (`SPC0.tlu_flush_ifu[2] !== 1) 
  //   @(posedge `SPC0.tlu_flush_ifu[2]); // has glitches
  if (`SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[2] !== 1)
    @(posedge `SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[2]);

  // need to see all of these go idle
  while (`SPC0.pku_quiesce[2] == 0 ||
         `SPC0.ftu_ifu_quiesce[2] == 0 ||
         `SPC0.lsu_stb_empty[2] == 0) 
     @(negedge `SPC0.l2clk);

//   // need to see all of these go idle
//   while (`SPC0.pku_quiesce[2] == 0 ||
//          `SPC0.ftu_ifu_quiesce[2] == 0 ||
//          `SPC0.lsu_stb_empty[2] == 0 ||
//          `SPC0.tlu.fls0.idl_request == 0) 
//      @(negedge `SPC0.l2clk);

  parkedState[2] <= 1;
  parkTrans[2] <= 0;
  // `PR_ALWAYS("dbg_chk", `ALWAYS, "INFO: TID %0d has parked!", 2);
  `PR_DEBUG("dbg_chk", `DEBUG, "INFO: TID 2 has parked!");

end
endtask


// in parked state.
// also called between single steps.
task parkedCheck2;
reg notified;
begin //{

  notified = 0;
  // loop while not transitioning out of park if not SS mode.
  // loop while in SS virtualPark if SS mode.
  while ((parkTrans[2] == 0 && ssMode == 0) || 
         (virtualPark[2] == 1 && ssMode == 1 && 
          `TOP.cpu.tcu_ss_request[0] == 0)) begin //{
    `PR_DEBUG ("dbg_chk", `DEBUG, "TID 2 watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[2],virtualPark[2],`TOP.cpu.tcu_ss_request[0]);

    @(negedge `SPC0.l2clk);

    // if in SS mode and core_running goes to zero for that thread, the thread
    // will self step once and flush in order to change to a parked state
    // (core_running_status=0). This looks like an un-asked for step so it
    // has to be detected and ignored. Try stalling here during it.
    while (`SPC0.tlu.tcu_core_running[2] == 0 && 
           `SPC0.tlu.tlu_core_running_status[2] == 1) 
      @(negedge `SPC0.l2clk);

    // watch for instructions sneaking in
    // dec_inst_valid_m[1:0], one bit per group
    if (`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 2 && `SPC0.tlu.tlu_retry[0] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 2 had tlu_trap_pc_0_valid activity while parked/between steps!");

    if (`SPC0.dec_inst_valid_m[0] == 1 && `SPC0.dec_tid0_m[1:0] == 2)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 2 had dec_inst_valid_m activity while parked/between steps!");


  end //} while

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 2 STOP watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[2],virtualPark[2],`TOP.cpu.tcu_ss_request[0]);

end //}
endtask


// leaving parked state
task unparkCheck2;
integer count;
begin

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 2 got unpark request!");  

  if (parkTrans[2] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 2 got unpark request while park state is already transitioning! Possible diag conflict! (trans=%0h)",parkTrans);
    disable unparkCheck2;
  end

  parkTrans[2] = 1;

  // must see `SPC0.tlu.core_running_status[2] w/in count clocks
  count2 = 0;

  while (`SPC0.tlu.tlu_core_running_status[2] == 0) begin
    @(negedge `SPC0.l2clk);
    if (count2 > parkWait) begin //  <--- may need to adjust
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 2 did not assert spc_core_running_status as soon as it should have (%0d clocks)!", count2);
      `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +parkWait=n (currently %0d). +noDebugChecks disables all checks!",parkWait);
    end
    count2 = count2 + 1;
  end
  
  if (!doMode && !ssMode) begin
    // need to see re-direct w/in "redirectWait" more clocks
    count2 = 0;

    // if this is true, the redirect and the assertion of core_running_status
    // happened at once so while loop can be skipped.
      while (! (`SPC0.tlu_trap_pc_0_valid && 
                `SPC0.tlu_trap_0_tid[1:0] == 2)) begin
        @(negedge `SPC0.l2clk);
        if (count2 > redirectWait) begin //  <--- may need to adjust
          `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 2 did not redirect within %d clocks after core_running_status assert!", redirectWait);
          `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +redirectWait=n (currently %0d). +noDebugChecks disables all checks!",redirectWait);
        end
        count2 = count2 + 1;
      end
  end

  parkedState[2] <= 0;
  parkTrans[2] <= 0;
  count2 <= 0;

end
endtask


// watch this tid step correctly. Should step 1 instruction
// and then "virtual park".
// for SS and DO modes.
task watchStep2;
begin

  watchStepFlush[2] = 0; // set if we got a flush
  watchStepMMU[2] = 0;   // set if we got a mmu reload
  stepDone[2] = 0;
  stepActive[2] = 1;

  if (flushCount2) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 repeating watchStep task due to flush (flushCount=%0d, redirectCount=%0d)!",flushCount2,redirectCount2);


  fork
    // timeout fork
    begin : FORK10_2
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep2: TID 2 did not see valid PC retry (waitTime=%0d)!", stepWaitTime);
    end

//     // look for SPU going active    
//     begin : FORK11_2
//       while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 2)))
//         @(negedge `SPC0.l2clk);
//       `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 see SPU active!");
//       spuActive[2] = 1;
//     end

    // might get ss_complete due to not knowing if there are 1 or 2 or more flushes.
    // this task gets called w/o knowing in advance if there will be one more
    // assertion of tlu_trap_pc_0/1_valid or not.
    begin : FORK8_2
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount2, redirectCount2);
        stepDone[2] = 1;
        stepActive[2] = 0;
        disable watchStep2; // return
      end
    end

    // valid PC / retry
    begin : FORK9_2
      // start step. tid wakes up/redirects and does "one instruction"
      while (!(`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 2 && `SPC0.tlu.tlu_retry[0] == 1)) begin
        // might see  `SPC0.tlu.mmu_reload_done[2] here if previous
        // redirect was due to a MMU miss. If so, decrement flush count because
        // the previous flush on prev pc_valid "does not count" and there can be
        // any number of them w/ no way to predict quantity.
        if (`SPC0.tlu.mmu_reload_done[2] && ssMode) begin
          flushCount2 = flushCount2-1;
          redirectCount2 = redirectCount2-1;
          watchStepMMU[2] = 1;
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 saw mmu_reload_done (hwtw)! flushCount/redirectCount decremented to %0d/%0d", flushCount2, redirectCount2);
        end
        @(negedge `SPC0.l2clk);
      end

      redirectCount2 = redirectCount2+1;
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 got valid retry, step waiting on negedge pku_quiesce (redirectCount=%0d)!",redirectCount2);
      disable FORK8_2; // kill sync on spc_ss_complete

      @(negedge `SPC0.pku_quiesce[2]);    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 got negedge pku_quiesce, step waiting on dec_inst_valid_m!");
    
      while (!(`SPC0.dec_inst_valid_m[0] == 1 && `SPC0.dec_tid0_m[1:0] == 2)) @(negedge `SPC0.l2clk);
    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 valid step starting!");
      disable FORK10_2; // kill timeout
      //disable FORK11_2;
      //       if (!`SPC0.spu_tlu_cwq_busy && 
//           !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//             `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 2)) spuActive[2] = 0;
    end
  join



  // finish step
  fork
    // timeout fork
    begin : FORK4_2
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);

      // may need to adjust. If a tid is doing a SPU sync ctl reg sync read,
      // it could stay "busy" for a REAL long time!!! Need delayed check of busy
      // since it can assert after the step has started.
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep2: TID 2 did not quiesce/complete after step (SS or DO) as it should have. not SPU busy (waitTime=%0d)!", stepWaitTime);
    end

    // look for SPU going active    
//     begin : FORK12_2
//       while (!(`SPC0.spu_tlu_cwq_busy || 
//         ((`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 2 && doMode) || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && ssMode))))
//         @(negedge `SPC0.l2clk);
//       spuActive[2] = 1;
//     end


    // look for flush_ifu (w/o lsu_trap_flush (aka ptrap_flush) if SS)
    // and end this task if seen. tlu_flush_ifu assertion always means
    // this "instruction" is done, but may repeat (tlb miss, etc) w/in the SS.
    begin : FORK6_2
        // checking ptrap_flush to make sure that flush is not caused by lsu_trap_flush
        while (`SPC0.tlu_flush_ifu[2] == 0)
          @(negedge `SPC0.l2clk);

// // debug!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if (`SPC0.tlu.fls0.ptrap_flush[2] == 1) begin
//   `PR_ERROR ("dbg_chk", `ERROR, "watchStep2: TID 2 have tlu_flush_ifu !!!!!!!!!!!!!!!!!!!!!!!");
// end
// 

        if ((ssMode && `SPC0.tlu.fls0.ptrap_flush[2] == 0) || doMode) begin
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 have tlu_flush_ifu (flushCount=%0d)!",flushCount2);
          watchStepFlush[2] = 1;
          flushCount2 = flushCount2+1;
          stepActive[2] = 0;
          disable watchStep2; // return
      end
    end


    // are we done fork, DO mode quiesce
    begin : FORK5_2
      if (doMode) begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 watching for quiesce (only matters fo DO mode)!");
        while (`SPC0.pku_quiesce[2] == 0 ||
               `SPC0.ftu_ifu_quiesce[2] == 0 ||
               `SPC0.lsu_stb_empty[2] == 0) @(negedge `SPC0.l2clk);

        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 have quiesce (only matters for DO mode)!");
        if (doMode) begin
          disable FORK4_2; // TO
          disable FORK6_2; // flush check
          //disable FORK12_2;
//           @(negedge `SPC0.l2clk);
//           if (!`SPC0.spu_tlu_cwq_busy && 
//               !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                 `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 2)) spuActive[2] = 0;
        end
      end
    end


    // are we done fork, SS mode only
    begin : FORK7_2
      // wait for SS complete
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount2,redirectCount2);
        stepDone[2] = 1;

//         while (ssMode && !`SPC0.spc_ss_complete) begin
//           // detect a second inst valid w/o a flush between
//           if (`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 2 && `SPC0.tlu.tlu_retry[0] == 1) begin
//             // delay error so flush thread can kill this in the "got flush" case
//             @(negedge `SPC0.l2clk); 
//             `PR_ERROR ("dbg_chk", `ERROR, "watchStep2: TID 2 had another inst start before SS done was asserted!");
//           end
//           @(negedge `SPC0.l2clk);
//         end // while

        if (`SPC0.pku_quiesce[2] == 0 ||
            `SPC0.ftu_ifu_quiesce[2] == 0 ||
            `SPC0.lsu_stb_empty[2] == 0)
          `PR_ERROR ("dbg_chk", `ERROR, "watchStep2: TID 2 was not quiesce at ss_complete assertion!");

        disable FORK4_2; // TO
        disable FORK6_2; // flush check
        //disable FORK12_2;
//         @(negedge `SPC0.l2clk);
//         if (!`SPC0.spu_tlu_cwq_busy && 
//             !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//               `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 2)) spuActive[2] = 0;
      end
    end

  join


  if (flushCount2 == 0) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 watchStep end!");
  else `PR_DEBUG("dbg_chk", `DEBUG, "watchStep2: TID 2 repeated watchStep end!");

  stepActive[2] = 0;

end
endtask



// check that thread does DO mode correctly
task watchDOsteps2;
begin
  
  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps2: TID 2 watchDOsteps starting!");

  if (! `TOP.cpu.tcu_do_mode[0]) disable watchDOsteps2;

  // now wait for a thread to start. TCU internal signal.
  if (`SPC0.tlu.tlu_core_running_status[2] == 0)
    @(posedge `SPC0.tlu.tlu_core_running_status[2]);

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps2 TID 2 unparked and running in DO mode!");

  // loop on step checking. DO mode is self stepping
  while (doMode) begin : watchDOsteps2loop// && `SPC0.tlu.tlu_core_running_status[7:0] != 0) begin

    stepDone[2] = 0;
    watchStepFlush[2] = 0;
    watchStepMMU[2] = 0;
 
    // are we starting to park in middle of DO mode (or end)?
    // wait here until unparked again
    if (parkTrans[2]) begin
      `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps2 TID 2 getting parked, will delay");
      @(negedge parkTrans[2]);
      if (!doMode) disable watchDOsteps2loop; // no longer in DO mode, bail
      // wait to be unparked or !doMode
      if (parkedState[2]) begin
        @(negedge doMode or negedge parkedState[2]);
        if (!doMode) disable watchDOsteps2loop; // no longer in DO mode, bail
      end
    end


    // an unparked thread does one instruction to completion before thread starts
    // the next instruction.
    fork
      // timeout fork
      begin : FORKDO12
        repeat (stepWaitTime) @(negedge `SPC0.l2clk);
          `PR_ERROR ("dbg_chk", `ERROR, "watchDOsteps2: DO mode, TID 2 timeout waiting for watchStep call to return, not SPU busy (+stepWaitTime=%0d)!", stepWaitTime);
      end

      // look for SPU going active    
//       begin : FORKDO22
//         while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 2)))
//           @(negedge `SPC0.l2clk);
//         `PR_ALWAYS("dbg_chk", `ALWAYS, "watchDOsteps2: DO mode, TID 2 sees SPU busy!");
//         spuActive[2] = 1;
//       end

      // watch step
      begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps2: TID 2 calling watchStep2 in DO mode!");
        watchStep2; // returns when step is done or flushed
        if (watchStepFlush[2]) 
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 2 in DO mode had flush!");
        if (watchStepMMU[2])
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 2 in DO mode had mmu reload!");
        // calling flush as a done in DO mode
        disable FORKDO12; // TO
        //disable FORKDO22; // SPU going active
      end

    join
  
    `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps2: TID 2 DO mode watchDOsteps step done!");
    stepDone[2] = 1;
    flushCount2 = 0;
//     if (!`SPC0.spu_tlu_cwq_busy && 
//         !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//           `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 2)) spuActive[2] = 0;

    @(negedge `SPC0.l2clk);
  end // while

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps2: TID 2 DO mode watchDOsteps task ending!");  
end
endtask




////////////////////////// end tid 2 ///////////////////////////////////////


//////////////////////////////////////////////////////////////////
// THREAD 3
//////////////////////////////////////////////////////////////////


// got park request. transition into parking.  parking check.
always @(negedge `SPC0.tlu.tcu_core_running[3]) begin: GOTPARK3
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 3 calling parkingCheck");
  if (enabled) parkingCheck3();
end

// got unpark request. transition into running. unparking check.
always @(posedge `SPC0.tlu.tcu_core_running[3]) begin: UNPARKCHECK3
  if (enabled && !ssMode) begin
    `PR_DEBUG("dbg_chk", `DEBUG, "TID 3 calling unparkCheck.");
    unparkCheck3();
  end
end

// while parked check
always @(posedge parkedState[3] or posedge virtualPark[3]) begin: PARKCHECK3  
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 3 calling parkedCheck");
  if (enabled) parkedCheck3();
end

// check for unexpected running transition
  always @(`SPC0.tlu.tlu_core_running_status[3]) begin: UNEXPECTED3
  if (!parkTrans[3] && enabled && ! doMode && ! ssMode) // review? to remove ! doMode
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 3 spc_core_running_status changed w/o request to park/unpark (trans=%0d)!",parkTrans[3]);
end



////////////// tasks for tid 3 ////////////////////

// check the entering into parked state
task parkingCheck3;

begin


  `PR_DEBUG("dbg_chk", `DEBUG, "TID 3 got park request!");

  if (parkTrans[3] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 3 got park request while park state is already transitioning! Possible diag conflict (multiple parkers)! (enabled=%0d)",enabled);
    `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +noDebugChecks to disable all debug checkes!");
    disable parkingCheck3;
  end

  parkTrans[3] = 1;

  // wait before checking signals
  repeat (2) @(negedge `SPC0.l2clk);

  // need to see at least one assertion of flush
  // if (`SPC0.tlu_flush_ifu[3] !== 1) 
  //   @(posedge `SPC0.tlu_flush_ifu[3]); // has glitches
  if (`SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[3] !== 1)
    @(posedge `SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[3]);

  // need to see all of these go idle
  while (`SPC0.pku_quiesce[3] == 0 ||
         `SPC0.ftu_ifu_quiesce[3] == 0 ||
         `SPC0.lsu_stb_empty[3] == 0) 
     @(negedge `SPC0.l2clk);

//   // need to see all of these go idle
//   while (`SPC0.pku_quiesce[3] == 0 ||
//          `SPC0.ftu_ifu_quiesce[3] == 0 ||
//          `SPC0.lsu_stb_empty[3] == 0 ||
//          `SPC0.tlu.fls0.idl_request == 0) 
//      @(negedge `SPC0.l2clk);

  parkedState[3] <= 1;
  parkTrans[3] <= 0;
  // `PR_ALWAYS("dbg_chk", `ALWAYS, "INFO: TID %0d has parked!", 3);
  `PR_DEBUG("dbg_chk", `DEBUG, "INFO: TID 3 has parked!");

end
endtask


// in parked state.
// also called between single steps.
task parkedCheck3;
reg notified;
begin //{

  notified = 0;
  // loop while not transitioning out of park if not SS mode.
  // loop while in SS virtualPark if SS mode.
  while ((parkTrans[3] == 0 && ssMode == 0) || 
         (virtualPark[3] == 1 && ssMode == 1 && 
          `TOP.cpu.tcu_ss_request[0] == 0)) begin //{
    `PR_DEBUG ("dbg_chk", `DEBUG, "TID 3 watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[3],virtualPark[3],`TOP.cpu.tcu_ss_request[0]);

    @(negedge `SPC0.l2clk);

    // if in SS mode and core_running goes to zero for that thread, the thread
    // will self step once and flush in order to change to a parked state
    // (core_running_status=0). This looks like an un-asked for step so it
    // has to be detected and ignored. Try stalling here during it.
    while (`SPC0.tlu.tcu_core_running[3] == 0 && 
           `SPC0.tlu.tlu_core_running_status[3] == 1) 
      @(negedge `SPC0.l2clk);

    // watch for instructions sneaking in
    // dec_inst_valid_m[1:0], one bit per group
    if (`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 3 && `SPC0.tlu.tlu_retry[0] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 3 had tlu_trap_pc_0_valid activity while parked/between steps!");

    if (`SPC0.dec_inst_valid_m[0] == 1 && `SPC0.dec_tid0_m[1:0] == 3)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 3 had dec_inst_valid_m activity while parked/between steps!");


  end //} while

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 3 STOP watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[3],virtualPark[3],`TOP.cpu.tcu_ss_request[0]);

end //}
endtask


// leaving parked state
task unparkCheck3;
integer count;
begin

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 3 got unpark request!");  

  if (parkTrans[3] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 3 got unpark request while park state is already transitioning! Possible diag conflict! (trans=%0h)",parkTrans);
    disable unparkCheck3;
  end

  parkTrans[3] = 1;

  // must see `SPC0.tlu.core_running_status[3] w/in count clocks
  count3 = 0;

  while (`SPC0.tlu.tlu_core_running_status[3] == 0) begin
    @(negedge `SPC0.l2clk);
    if (count3 > parkWait) begin //  <--- may need to adjust
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 3 did not assert spc_core_running_status as soon as it should have (%0d clocks)!", count3);
      `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +parkWait=n (currently %0d). +noDebugChecks disables all checks!",parkWait);
    end
    count3 = count3 + 1;
  end
  
  if (!doMode && !ssMode) begin
    // need to see re-direct w/in "redirectWait" more clocks
    count3 = 0;

    // if this is true, the redirect and the assertion of core_running_status
    // happened at once so while loop can be skipped.
      while (! (`SPC0.tlu_trap_pc_0_valid && 
                `SPC0.tlu_trap_0_tid[1:0] == 3)) begin
        @(negedge `SPC0.l2clk);
        if (count3 > redirectWait) begin //  <--- may need to adjust
          `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 3 did not redirect within %d clocks after core_running_status assert!", redirectWait);
          `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +redirectWait=n (currently %0d). +noDebugChecks disables all checks!",redirectWait);
        end
        count3 = count3 + 1;
      end
  end

  parkedState[3] <= 0;
  parkTrans[3] <= 0;
  count3 <= 0;

end
endtask


// watch this tid step correctly. Should step 1 instruction
// and then "virtual park".
// for SS and DO modes.
task watchStep3;
begin

  watchStepFlush[3] = 0; // set if we got a flush
  watchStepMMU[3] = 0;   // set if we got a mmu reload
  stepDone[3] = 0;
  stepActive[3] = 1;

  if (flushCount3) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 repeating watchStep task due to flush (flushCount=%0d, redirectCount=%0d)!",flushCount3,redirectCount3);


  fork
    // timeout fork
    begin : FORK10_3
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep3: TID 3 did not see valid PC retry (waitTime=%0d)!", stepWaitTime);
    end

//     // look for SPU going active    
//     begin : FORK11_3
//       while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 3)))
//         @(negedge `SPC0.l2clk);
//       `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 see SPU active!");
//       spuActive[3] = 1;
//     end

    // might get ss_complete due to not knowing if there are 1 or 2 or more flushes.
    // this task gets called w/o knowing in advance if there will be one more
    // assertion of tlu_trap_pc_0/1_valid or not.
    begin : FORK8_3
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount3, redirectCount3);
        stepDone[3] = 1;
        stepActive[3] = 0;
        disable watchStep3; // return
      end
    end

    // valid PC / retry
    begin : FORK9_3
      // start step. tid wakes up/redirects and does "one instruction"
      while (!(`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 3 && `SPC0.tlu.tlu_retry[0] == 1)) begin
        // might see  `SPC0.tlu.mmu_reload_done[3] here if previous
        // redirect was due to a MMU miss. If so, decrement flush count because
        // the previous flush on prev pc_valid "does not count" and there can be
        // any number of them w/ no way to predict quantity.
        if (`SPC0.tlu.mmu_reload_done[3] && ssMode) begin
          flushCount3 = flushCount3-1;
          redirectCount3 = redirectCount3-1;
          watchStepMMU[3] = 1;
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 saw mmu_reload_done (hwtw)! flushCount/redirectCount decremented to %0d/%0d", flushCount3, redirectCount3);
        end
        @(negedge `SPC0.l2clk);
      end

      redirectCount3 = redirectCount3+1;
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 got valid retry, step waiting on negedge pku_quiesce (redirectCount=%0d)!",redirectCount3);
      disable FORK8_3; // kill sync on spc_ss_complete

      @(negedge `SPC0.pku_quiesce[3]);    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 got negedge pku_quiesce, step waiting on dec_inst_valid_m!");
    
      while (!(`SPC0.dec_inst_valid_m[0] == 1 && `SPC0.dec_tid0_m[1:0] == 3)) @(negedge `SPC0.l2clk);
    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 valid step starting!");
      disable FORK10_3; // kill timeout
      //disable FORK11_3;
      //       if (!`SPC0.spu_tlu_cwq_busy && 
//           !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//             `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 3)) spuActive[3] = 0;
    end
  join



  // finish step
  fork
    // timeout fork
    begin : FORK4_3
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);

      // may need to adjust. If a tid is doing a SPU sync ctl reg sync read,
      // it could stay "busy" for a REAL long time!!! Need delayed check of busy
      // since it can assert after the step has started.
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep3: TID 3 did not quiesce/complete after step (SS or DO) as it should have. not SPU busy (waitTime=%0d)!", stepWaitTime);
    end

    // look for SPU going active    
//     begin : FORK12_3
//       while (!(`SPC0.spu_tlu_cwq_busy || 
//         ((`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 3 && doMode) || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && ssMode))))
//         @(negedge `SPC0.l2clk);
//       spuActive[3] = 1;
//     end


    // look for flush_ifu (w/o lsu_trap_flush (aka ptrap_flush) if SS)
    // and end this task if seen. tlu_flush_ifu assertion always means
    // this "instruction" is done, but may repeat (tlb miss, etc) w/in the SS.
    begin : FORK6_3
        // checking ptrap_flush to make sure that flush is not caused by lsu_trap_flush
        while (`SPC0.tlu_flush_ifu[3] == 0)
          @(negedge `SPC0.l2clk);

// // debug!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if (`SPC0.tlu.fls0.ptrap_flush[3] == 1) begin
//   `PR_ERROR ("dbg_chk", `ERROR, "watchStep3: TID 3 have tlu_flush_ifu !!!!!!!!!!!!!!!!!!!!!!!");
// end
// 

        if ((ssMode && `SPC0.tlu.fls0.ptrap_flush[3] == 0) || doMode) begin
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 have tlu_flush_ifu (flushCount=%0d)!",flushCount3);
          watchStepFlush[3] = 1;
          flushCount3 = flushCount3+1;
          stepActive[3] = 0;
          disable watchStep3; // return
      end
    end


    // are we done fork, DO mode quiesce
    begin : FORK5_3
      if (doMode) begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 watching for quiesce (only matters fo DO mode)!");
        while (`SPC0.pku_quiesce[3] == 0 ||
               `SPC0.ftu_ifu_quiesce[3] == 0 ||
               `SPC0.lsu_stb_empty[3] == 0) @(negedge `SPC0.l2clk);

        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 have quiesce (only matters for DO mode)!");
        if (doMode) begin
          disable FORK4_3; // TO
          disable FORK6_3; // flush check
          //disable FORK12_3;
//           @(negedge `SPC0.l2clk);
//           if (!`SPC0.spu_tlu_cwq_busy && 
//               !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                 `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 3)) spuActive[3] = 0;
        end
      end
    end


    // are we done fork, SS mode only
    begin : FORK7_3
      // wait for SS complete
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount3,redirectCount3);
        stepDone[3] = 1;

//         while (ssMode && !`SPC0.spc_ss_complete) begin
//           // detect a second inst valid w/o a flush between
//           if (`SPC0.tlu_trap_pc_0_valid && `SPC0.tlu_trap_0_tid[1:0] == 3 && `SPC0.tlu.tlu_retry[0] == 1) begin
//             // delay error so flush thread can kill this in the "got flush" case
//             @(negedge `SPC0.l2clk); 
//             `PR_ERROR ("dbg_chk", `ERROR, "watchStep3: TID 3 had another inst start before SS done was asserted!");
//           end
//           @(negedge `SPC0.l2clk);
//         end // while

        if (`SPC0.pku_quiesce[3] == 0 ||
            `SPC0.ftu_ifu_quiesce[3] == 0 ||
            `SPC0.lsu_stb_empty[3] == 0)
          `PR_ERROR ("dbg_chk", `ERROR, "watchStep3: TID 3 was not quiesce at ss_complete assertion!");

        disable FORK4_3; // TO
        disable FORK6_3; // flush check
        //disable FORK12_3;
//         @(negedge `SPC0.l2clk);
//         if (!`SPC0.spu_tlu_cwq_busy && 
//             !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//               `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 3)) spuActive[3] = 0;
      end
    end

  join


  if (flushCount3 == 0) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 watchStep end!");
  else `PR_DEBUG("dbg_chk", `DEBUG, "watchStep3: TID 3 repeated watchStep end!");

  stepActive[3] = 0;

end
endtask



// check that thread does DO mode correctly
task watchDOsteps3;
begin
  
  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps3: TID 3 watchDOsteps starting!");

  if (! `TOP.cpu.tcu_do_mode[0]) disable watchDOsteps3;

  // now wait for a thread to start. TCU internal signal.
  if (`SPC0.tlu.tlu_core_running_status[3] == 0)
    @(posedge `SPC0.tlu.tlu_core_running_status[3]);

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps3 TID 3 unparked and running in DO mode!");

  // loop on step checking. DO mode is self stepping
  while (doMode) begin : watchDOsteps3loop// && `SPC0.tlu.tlu_core_running_status[7:0] != 0) begin

    stepDone[3] = 0;
    watchStepFlush[3] = 0;
    watchStepMMU[3] = 0;
 
    // are we starting to park in middle of DO mode (or end)?
    // wait here until unparked again
    if (parkTrans[3]) begin
      `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps3 TID 3 getting parked, will delay");
      @(negedge parkTrans[3]);
      if (!doMode) disable watchDOsteps3loop; // no longer in DO mode, bail
      // wait to be unparked or !doMode
      if (parkedState[3]) begin
        @(negedge doMode or negedge parkedState[3]);
        if (!doMode) disable watchDOsteps3loop; // no longer in DO mode, bail
      end
    end


    // an unparked thread does one instruction to completion before thread starts
    // the next instruction.
    fork
      // timeout fork
      begin : FORKDO13
        repeat (stepWaitTime) @(negedge `SPC0.l2clk);
          `PR_ERROR ("dbg_chk", `ERROR, "watchDOsteps3: DO mode, TID 3 timeout waiting for watchStep call to return, not SPU busy (+stepWaitTime=%0d)!", stepWaitTime);
      end

      // look for SPU going active    
//       begin : FORKDO23
//         while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 3)))
//           @(negedge `SPC0.l2clk);
//         `PR_ALWAYS("dbg_chk", `ALWAYS, "watchDOsteps3: DO mode, TID 3 sees SPU busy!");
//         spuActive[3] = 1;
//       end

      // watch step
      begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps3: TID 3 calling watchStep3 in DO mode!");
        watchStep3; // returns when step is done or flushed
        if (watchStepFlush[3]) 
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 3 in DO mode had flush!");
        if (watchStepMMU[3])
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 3 in DO mode had mmu reload!");
        // calling flush as a done in DO mode
        disable FORKDO13; // TO
        //disable FORKDO23; // SPU going active
      end

    join
  
    `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps3: TID 3 DO mode watchDOsteps step done!");
    stepDone[3] = 1;
    flushCount3 = 0;
//     if (!`SPC0.spu_tlu_cwq_busy && 
//         !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//           `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 3)) spuActive[3] = 0;

    @(negedge `SPC0.l2clk);
  end // while

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps3: TID 3 DO mode watchDOsteps task ending!");  
end
endtask




////////////////////////// end tid 3 ///////////////////////////////////////


//////////////////////////////////////////////////////////////////
// THREAD 4
//////////////////////////////////////////////////////////////////


// got park request. transition into parking.  parking check.
always @(negedge `SPC0.tlu.tcu_core_running[4]) begin: GOTPARK4
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 4 calling parkingCheck");
  if (enabled) parkingCheck4();
end

// got unpark request. transition into running. unparking check.
always @(posedge `SPC0.tlu.tcu_core_running[4]) begin: UNPARKCHECK4
  if (enabled && !ssMode) begin
    `PR_DEBUG("dbg_chk", `DEBUG, "TID 4 calling unparkCheck.");
    unparkCheck4();
  end
end

// while parked check
always @(posedge parkedState[4] or posedge virtualPark[4]) begin: PARKCHECK4  
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 4 calling parkedCheck");
  if (enabled) parkedCheck4();
end

// check for unexpected running transition
  always @(`SPC0.tlu.tlu_core_running_status[4]) begin: UNEXPECTED4
  if (!parkTrans[4] && enabled && ! doMode && ! ssMode) // review? to remove ! doMode
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 4 spc_core_running_status changed w/o request to park/unpark (trans=%0d)!",parkTrans[4]);
end



////////////// tasks for tid 4 ////////////////////

// check the entering into parked state
task parkingCheck4;

begin


  `PR_DEBUG("dbg_chk", `DEBUG, "TID 4 got park request!");

  if (parkTrans[4] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 4 got park request while park state is already transitioning! Possible diag conflict (multiple parkers)! (enabled=%0d)",enabled);
    `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +noDebugChecks to disable all debug checkes!");
    disable parkingCheck4;
  end

  parkTrans[4] = 1;

  // wait before checking signals
  repeat (2) @(negedge `SPC0.l2clk);

  // need to see at least one assertion of flush
  // if (`SPC0.tlu_flush_ifu[4] !== 1) 
  //   @(posedge `SPC0.tlu_flush_ifu[4]); // has glitches
  if (`SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[4] !== 1)
    @(posedge `SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[4]);

  // need to see all of these go idle
  while (`SPC0.pku_quiesce[4] == 0 ||
         `SPC0.ftu_ifu_quiesce[4] == 0 ||
         `SPC0.lsu_stb_empty[4] == 0) 
     @(negedge `SPC0.l2clk);

//   // need to see all of these go idle
//   while (`SPC0.pku_quiesce[4] == 0 ||
//          `SPC0.ftu_ifu_quiesce[4] == 0 ||
//          `SPC0.lsu_stb_empty[4] == 0 ||
//          `SPC0.tlu.fls1.idl_request == 0) 
//      @(negedge `SPC0.l2clk);

  parkedState[4] <= 1;
  parkTrans[4] <= 0;
  // `PR_ALWAYS("dbg_chk", `ALWAYS, "INFO: TID %0d has parked!", 4);
  `PR_DEBUG("dbg_chk", `DEBUG, "INFO: TID 4 has parked!");

end
endtask


// in parked state.
// also called between single steps.
task parkedCheck4;
reg notified;
begin //{

  notified = 0;
  // loop while not transitioning out of park if not SS mode.
  // loop while in SS virtualPark if SS mode.
  while ((parkTrans[4] == 0 && ssMode == 0) || 
         (virtualPark[4] == 1 && ssMode == 1 && 
          `TOP.cpu.tcu_ss_request[0] == 0)) begin //{
    `PR_DEBUG ("dbg_chk", `DEBUG, "TID 4 watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[4],virtualPark[4],`TOP.cpu.tcu_ss_request[0]);

    @(negedge `SPC0.l2clk);

    // if in SS mode and core_running goes to zero for that thread, the thread
    // will self step once and flush in order to change to a parked state
    // (core_running_status=0). This looks like an un-asked for step so it
    // has to be detected and ignored. Try stalling here during it.
    while (`SPC0.tlu.tcu_core_running[4] == 0 && 
           `SPC0.tlu.tlu_core_running_status[4] == 1) 
      @(negedge `SPC0.l2clk);

    // watch for instructions sneaking in
    // dec_inst_valid_m[1:0], one bit per group
    if (`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 4 && `SPC0.tlu.tlu_retry[1] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 4 had tlu_trap_pc_1_valid activity while parked/between steps!");

    if (`SPC0.dec_inst_valid_m[1] == 1 && `SPC0.dec_tid1_m[1:0] == 0)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 4 had dec_inst_valid_m activity while parked/between steps!");


  end //} while

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 4 STOP watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[4],virtualPark[4],`TOP.cpu.tcu_ss_request[0]);

end //}
endtask


// leaving parked state
task unparkCheck4;
integer count;
begin

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 4 got unpark request!");  

  if (parkTrans[4] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 4 got unpark request while park state is already transitioning! Possible diag conflict! (trans=%0h)",parkTrans);
    disable unparkCheck4;
  end

  parkTrans[4] = 1;

  // must see `SPC0.tlu.core_running_status[4] w/in count clocks
  count4 = 0;

  while (`SPC0.tlu.tlu_core_running_status[4] == 0) begin
    @(negedge `SPC0.l2clk);
    if (count4 > parkWait) begin //  <--- may need to adjust
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 4 did not assert spc_core_running_status as soon as it should have (%0d clocks)!", count4);
      `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +parkWait=n (currently %0d). +noDebugChecks disables all checks!",parkWait);
    end
    count4 = count4 + 1;
  end
  
  if (!doMode && !ssMode) begin
    // need to see re-direct w/in "redirectWait" more clocks
    count4 = 0;

    // if this is true, the redirect and the assertion of core_running_status
    // happened at once so while loop can be skipped.
      while (! (`SPC0.tlu_trap_pc_1_valid && 
                `SPC0.tlu_trap_1_tid[1:0] == 0)) begin
        @(negedge `SPC0.l2clk);
        if (count4 > redirectWait) begin //  <--- may need to adjust
          `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 4 did not redirect within %d clocks after core_running_status assert!", redirectWait);
          `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +redirectWait=n (currently %0d). +noDebugChecks disables all checks!",redirectWait);
        end
        count4 = count4 + 1;
      end
  end

  parkedState[4] <= 0;
  parkTrans[4] <= 0;
  count4 <= 0;

end
endtask


// watch this tid step correctly. Should step 1 instruction
// and then "virtual park".
// for SS and DO modes.
task watchStep4;
begin

  watchStepFlush[4] = 0; // set if we got a flush
  watchStepMMU[4] = 0;   // set if we got a mmu reload
  stepDone[4] = 0;
  stepActive[4] = 1;

  if (flushCount4) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 repeating watchStep task due to flush (flushCount=%0d, redirectCount=%0d)!",flushCount4,redirectCount4);


  fork
    // timeout fork
    begin : FORK10_4
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep4: TID 4 did not see valid PC retry (waitTime=%0d)!", stepWaitTime);
    end

//     // look for SPU going active    
//     begin : FORK11_4
//       while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 4)))
//         @(negedge `SPC0.l2clk);
//       `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 see SPU active!");
//       spuActive[4] = 1;
//     end

    // might get ss_complete due to not knowing if there are 1 or 2 or more flushes.
    // this task gets called w/o knowing in advance if there will be one more
    // assertion of tlu_trap_pc_0/1_valid or not.
    begin : FORK8_4
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount4, redirectCount4);
        stepDone[4] = 1;
        stepActive[4] = 0;
        disable watchStep4; // return
      end
    end

    // valid PC / retry
    begin : FORK9_4
      // start step. tid wakes up/redirects and does "one instruction"
      while (!(`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 0 && `SPC0.tlu.tlu_retry[1] == 1)) begin
        // might see  `SPC0.tlu.mmu_reload_done[4] here if previous
        // redirect was due to a MMU miss. If so, decrement flush count because
        // the previous flush on prev pc_valid "does not count" and there can be
        // any number of them w/ no way to predict quantity.
        if (`SPC0.tlu.mmu_reload_done[4] && ssMode) begin
          flushCount4 = flushCount4-1;
          redirectCount4 = redirectCount4-1;
          watchStepMMU[4] = 1;
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 saw mmu_reload_done (hwtw)! flushCount/redirectCount decremented to %0d/%0d", flushCount4, redirectCount4);
        end
        @(negedge `SPC0.l2clk);
      end

      redirectCount4 = redirectCount4+1;
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 got valid retry, step waiting on negedge pku_quiesce (redirectCount=%0d)!",redirectCount4);
      disable FORK8_4; // kill sync on spc_ss_complete

      @(negedge `SPC0.pku_quiesce[4]);    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 got negedge pku_quiesce, step waiting on dec_inst_valid_m!");
    
      while (!(`SPC0.dec_inst_valid_m[1] == 1 && `SPC0.dec_tid1_m[1:0] == 0)) @(negedge `SPC0.l2clk);
    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 valid step starting!");
      disable FORK10_4; // kill timeout
      //disable FORK11_4;
      //       if (!`SPC0.spu_tlu_cwq_busy && 
//           !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//             `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 4)) spuActive[4] = 0;
    end
  join



  // finish step
  fork
    // timeout fork
    begin : FORK4_4
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);

      // may need to adjust. If a tid is doing a SPU sync ctl reg sync read,
      // it could stay "busy" for a REAL long time!!! Need delayed check of busy
      // since it can assert after the step has started.
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep4: TID 4 did not quiesce/complete after step (SS or DO) as it should have. not SPU busy (waitTime=%0d)!", stepWaitTime);
    end

    // look for SPU going active    
//     begin : FORK12_4
//       while (!(`SPC0.spu_tlu_cwq_busy || 
//         ((`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 4 && doMode) || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && ssMode))))
//         @(negedge `SPC0.l2clk);
//       spuActive[4] = 1;
//     end


    // look for flush_ifu (w/o lsu_trap_flush (aka ptrap_flush) if SS)
    // and end this task if seen. tlu_flush_ifu assertion always means
    // this "instruction" is done, but may repeat (tlb miss, etc) w/in the SS.
    begin : FORK6_4
        // checking ptrap_flush to make sure that flush is not caused by lsu_trap_flush
        while (`SPC0.tlu_flush_ifu[4] == 0)
          @(negedge `SPC0.l2clk);

// // debug!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if (`SPC0.tlu.fls1.ptrap_flush[0] == 1) begin
//   `PR_ERROR ("dbg_chk", `ERROR, "watchStep4: TID 4 have tlu_flush_ifu !!!!!!!!!!!!!!!!!!!!!!!");
// end
// 

        if ((ssMode && `SPC0.tlu.fls1.ptrap_flush[0] == 0) || doMode) begin
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 have tlu_flush_ifu (flushCount=%0d)!",flushCount4);
          watchStepFlush[4] = 1;
          flushCount4 = flushCount4+1;
          stepActive[4] = 0;
          disable watchStep4; // return
      end
    end


    // are we done fork, DO mode quiesce
    begin : FORK5_4
      if (doMode) begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 watching for quiesce (only matters fo DO mode)!");
        while (`SPC0.pku_quiesce[4] == 0 ||
               `SPC0.ftu_ifu_quiesce[4] == 0 ||
               `SPC0.lsu_stb_empty[4] == 0) @(negedge `SPC0.l2clk);

        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 have quiesce (only matters for DO mode)!");
        if (doMode) begin
          disable FORK4_4; // TO
          disable FORK6_4; // flush check
          //disable FORK12_4;
//           @(negedge `SPC0.l2clk);
//           if (!`SPC0.spu_tlu_cwq_busy && 
//               !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                 `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 4)) spuActive[4] = 0;
        end
      end
    end


    // are we done fork, SS mode only
    begin : FORK7_4
      // wait for SS complete
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount4,redirectCount4);
        stepDone[4] = 1;

//         while (ssMode && !`SPC0.spc_ss_complete) begin
//           // detect a second inst valid w/o a flush between
//           if (`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 0 && `SPC0.tlu.tlu_retry[1] == 1) begin
//             // delay error so flush thread can kill this in the "got flush" case
//             @(negedge `SPC0.l2clk); 
//             `PR_ERROR ("dbg_chk", `ERROR, "watchStep4: TID 4 had another inst start before SS done was asserted!");
//           end
//           @(negedge `SPC0.l2clk);
//         end // while

        if (`SPC0.pku_quiesce[4] == 0 ||
            `SPC0.ftu_ifu_quiesce[4] == 0 ||
            `SPC0.lsu_stb_empty[4] == 0)
          `PR_ERROR ("dbg_chk", `ERROR, "watchStep4: TID 4 was not quiesce at ss_complete assertion!");

        disable FORK4_4; // TO
        disable FORK6_4; // flush check
        //disable FORK12_4;
//         @(negedge `SPC0.l2clk);
//         if (!`SPC0.spu_tlu_cwq_busy && 
//             !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//               `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 4)) spuActive[4] = 0;
      end
    end

  join


  if (flushCount4 == 0) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 watchStep end!");
  else `PR_DEBUG("dbg_chk", `DEBUG, "watchStep4: TID 4 repeated watchStep end!");

  stepActive[4] = 0;

end
endtask



// check that thread does DO mode correctly
task watchDOsteps4;
begin
  
  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps4: TID 4 watchDOsteps starting!");

  if (! `TOP.cpu.tcu_do_mode[0]) disable watchDOsteps4;

  // now wait for a thread to start. TCU internal signal.
  if (`SPC0.tlu.tlu_core_running_status[4] == 0)
    @(posedge `SPC0.tlu.tlu_core_running_status[4]);

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps4 TID 4 unparked and running in DO mode!");

  // loop on step checking. DO mode is self stepping
  while (doMode) begin : watchDOsteps4loop// && `SPC0.tlu.tlu_core_running_status[7:0] != 0) begin

    stepDone[4] = 0;
    watchStepFlush[4] = 0;
    watchStepMMU[4] = 0;
 
    // are we starting to park in middle of DO mode (or end)?
    // wait here until unparked again
    if (parkTrans[4]) begin
      `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps4 TID 4 getting parked, will delay");
      @(negedge parkTrans[4]);
      if (!doMode) disable watchDOsteps4loop; // no longer in DO mode, bail
      // wait to be unparked or !doMode
      if (parkedState[4]) begin
        @(negedge doMode or negedge parkedState[4]);
        if (!doMode) disable watchDOsteps4loop; // no longer in DO mode, bail
      end
    end


    // an unparked thread does one instruction to completion before thread starts
    // the next instruction.
    fork
      // timeout fork
      begin : FORKDO14
        repeat (stepWaitTime) @(negedge `SPC0.l2clk);
          `PR_ERROR ("dbg_chk", `ERROR, "watchDOsteps4: DO mode, TID 4 timeout waiting for watchStep call to return, not SPU busy (+stepWaitTime=%0d)!", stepWaitTime);
      end

      // look for SPU going active    
//       begin : FORKDO24
//         while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 4)))
//           @(negedge `SPC0.l2clk);
//         `PR_ALWAYS("dbg_chk", `ALWAYS, "watchDOsteps4: DO mode, TID 4 sees SPU busy!");
//         spuActive[4] = 1;
//       end

      // watch step
      begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps4: TID 4 calling watchStep4 in DO mode!");
        watchStep4; // returns when step is done or flushed
        if (watchStepFlush[4]) 
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 4 in DO mode had flush!");
        if (watchStepMMU[4])
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 4 in DO mode had mmu reload!");
        // calling flush as a done in DO mode
        disable FORKDO14; // TO
        //disable FORKDO24; // SPU going active
      end

    join
  
    `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps4: TID 4 DO mode watchDOsteps step done!");
    stepDone[4] = 1;
    flushCount4 = 0;
//     if (!`SPC0.spu_tlu_cwq_busy && 
//         !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//           `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 4)) spuActive[4] = 0;

    @(negedge `SPC0.l2clk);
  end // while

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps4: TID 4 DO mode watchDOsteps task ending!");  
end
endtask




////////////////////////// end tid 4 ///////////////////////////////////////


//////////////////////////////////////////////////////////////////
// THREAD 5
//////////////////////////////////////////////////////////////////


// got park request. transition into parking.  parking check.
always @(negedge `SPC0.tlu.tcu_core_running[5]) begin: GOTPARK5
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 5 calling parkingCheck");
  if (enabled) parkingCheck5();
end

// got unpark request. transition into running. unparking check.
always @(posedge `SPC0.tlu.tcu_core_running[5]) begin: UNPARKCHECK5
  if (enabled && !ssMode) begin
    `PR_DEBUG("dbg_chk", `DEBUG, "TID 5 calling unparkCheck.");
    unparkCheck5();
  end
end

// while parked check
always @(posedge parkedState[5] or posedge virtualPark[5]) begin: PARKCHECK5  
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 5 calling parkedCheck");
  if (enabled) parkedCheck5();
end

// check for unexpected running transition
  always @(`SPC0.tlu.tlu_core_running_status[5]) begin: UNEXPECTED5
  if (!parkTrans[5] && enabled && ! doMode && ! ssMode) // review? to remove ! doMode
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 5 spc_core_running_status changed w/o request to park/unpark (trans=%0d)!",parkTrans[5]);
end



////////////// tasks for tid 5 ////////////////////

// check the entering into parked state
task parkingCheck5;

begin


  `PR_DEBUG("dbg_chk", `DEBUG, "TID 5 got park request!");

  if (parkTrans[5] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 5 got park request while park state is already transitioning! Possible diag conflict (multiple parkers)! (enabled=%0d)",enabled);
    `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +noDebugChecks to disable all debug checkes!");
    disable parkingCheck5;
  end

  parkTrans[5] = 1;

  // wait before checking signals
  repeat (2) @(negedge `SPC0.l2clk);

  // need to see at least one assertion of flush
  // if (`SPC0.tlu_flush_ifu[5] !== 1) 
  //   @(posedge `SPC0.tlu_flush_ifu[5]); // has glitches
  if (`SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[5] !== 1)
    @(posedge `SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[5]);

  // need to see all of these go idle
  while (`SPC0.pku_quiesce[5] == 0 ||
         `SPC0.ftu_ifu_quiesce[5] == 0 ||
         `SPC0.lsu_stb_empty[5] == 0) 
     @(negedge `SPC0.l2clk);

//   // need to see all of these go idle
//   while (`SPC0.pku_quiesce[5] == 0 ||
//          `SPC0.ftu_ifu_quiesce[5] == 0 ||
//          `SPC0.lsu_stb_empty[5] == 0 ||
//          `SPC0.tlu.fls1.idl_request == 0) 
//      @(negedge `SPC0.l2clk);

  parkedState[5] <= 1;
  parkTrans[5] <= 0;
  // `PR_ALWAYS("dbg_chk", `ALWAYS, "INFO: TID %0d has parked!", 5);
  `PR_DEBUG("dbg_chk", `DEBUG, "INFO: TID 5 has parked!");

end
endtask


// in parked state.
// also called between single steps.
task parkedCheck5;
reg notified;
begin //{

  notified = 0;
  // loop while not transitioning out of park if not SS mode.
  // loop while in SS virtualPark if SS mode.
  while ((parkTrans[5] == 0 && ssMode == 0) || 
         (virtualPark[5] == 1 && ssMode == 1 && 
          `TOP.cpu.tcu_ss_request[0] == 0)) begin //{
    `PR_DEBUG ("dbg_chk", `DEBUG, "TID 5 watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[5],virtualPark[5],`TOP.cpu.tcu_ss_request[0]);

    @(negedge `SPC0.l2clk);

    // if in SS mode and core_running goes to zero for that thread, the thread
    // will self step once and flush in order to change to a parked state
    // (core_running_status=0). This looks like an un-asked for step so it
    // has to be detected and ignored. Try stalling here during it.
    while (`SPC0.tlu.tcu_core_running[5] == 0 && 
           `SPC0.tlu.tlu_core_running_status[5] == 1) 
      @(negedge `SPC0.l2clk);

    // watch for instructions sneaking in
    // dec_inst_valid_m[1:0], one bit per group
    if (`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 5 && `SPC0.tlu.tlu_retry[1] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 5 had tlu_trap_pc_1_valid activity while parked/between steps!");

    if (`SPC0.dec_inst_valid_m[1] == 1 && `SPC0.dec_tid1_m[1:0] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 5 had dec_inst_valid_m activity while parked/between steps!");


  end //} while

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 5 STOP watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[5],virtualPark[5],`TOP.cpu.tcu_ss_request[0]);

end //}
endtask


// leaving parked state
task unparkCheck5;
integer count;
begin

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 5 got unpark request!");  

  if (parkTrans[5] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 5 got unpark request while park state is already transitioning! Possible diag conflict! (trans=%0h)",parkTrans);
    disable unparkCheck5;
  end

  parkTrans[5] = 1;

  // must see `SPC0.tlu.core_running_status[5] w/in count clocks
  count5 = 0;

  while (`SPC0.tlu.tlu_core_running_status[5] == 0) begin
    @(negedge `SPC0.l2clk);
    if (count5 > parkWait) begin //  <--- may need to adjust
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 5 did not assert spc_core_running_status as soon as it should have (%0d clocks)!", count5);
      `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +parkWait=n (currently %0d). +noDebugChecks disables all checks!",parkWait);
    end
    count5 = count5 + 1;
  end
  
  if (!doMode && !ssMode) begin
    // need to see re-direct w/in "redirectWait" more clocks
    count5 = 0;

    // if this is true, the redirect and the assertion of core_running_status
    // happened at once so while loop can be skipped.
      while (! (`SPC0.tlu_trap_pc_1_valid && 
                `SPC0.tlu_trap_1_tid[1:0] == 1)) begin
        @(negedge `SPC0.l2clk);
        if (count5 > redirectWait) begin //  <--- may need to adjust
          `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 5 did not redirect within %d clocks after core_running_status assert!", redirectWait);
          `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +redirectWait=n (currently %0d). +noDebugChecks disables all checks!",redirectWait);
        end
        count5 = count5 + 1;
      end
  end

  parkedState[5] <= 0;
  parkTrans[5] <= 0;
  count5 <= 0;

end
endtask


// watch this tid step correctly. Should step 1 instruction
// and then "virtual park".
// for SS and DO modes.
task watchStep5;
begin

  watchStepFlush[5] = 0; // set if we got a flush
  watchStepMMU[5] = 0;   // set if we got a mmu reload
  stepDone[5] = 0;
  stepActive[5] = 1;

  if (flushCount5) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 repeating watchStep task due to flush (flushCount=%0d, redirectCount=%0d)!",flushCount5,redirectCount5);


  fork
    // timeout fork
    begin : FORK10_5
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep5: TID 5 did not see valid PC retry (waitTime=%0d)!", stepWaitTime);
    end

//     // look for SPU going active    
//     begin : FORK11_5
//       while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 5)))
//         @(negedge `SPC0.l2clk);
//       `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 see SPU active!");
//       spuActive[5] = 1;
//     end

    // might get ss_complete due to not knowing if there are 1 or 2 or more flushes.
    // this task gets called w/o knowing in advance if there will be one more
    // assertion of tlu_trap_pc_0/1_valid or not.
    begin : FORK8_5
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount5, redirectCount5);
        stepDone[5] = 1;
        stepActive[5] = 0;
        disable watchStep5; // return
      end
    end

    // valid PC / retry
    begin : FORK9_5
      // start step. tid wakes up/redirects and does "one instruction"
      while (!(`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 1 && `SPC0.tlu.tlu_retry[1] == 1)) begin
        // might see  `SPC0.tlu.mmu_reload_done[5] here if previous
        // redirect was due to a MMU miss. If so, decrement flush count because
        // the previous flush on prev pc_valid "does not count" and there can be
        // any number of them w/ no way to predict quantity.
        if (`SPC0.tlu.mmu_reload_done[5] && ssMode) begin
          flushCount5 = flushCount5-1;
          redirectCount5 = redirectCount5-1;
          watchStepMMU[5] = 1;
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 saw mmu_reload_done (hwtw)! flushCount/redirectCount decremented to %0d/%0d", flushCount5, redirectCount5);
        end
        @(negedge `SPC0.l2clk);
      end

      redirectCount5 = redirectCount5+1;
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 got valid retry, step waiting on negedge pku_quiesce (redirectCount=%0d)!",redirectCount5);
      disable FORK8_5; // kill sync on spc_ss_complete

      @(negedge `SPC0.pku_quiesce[5]);    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 got negedge pku_quiesce, step waiting on dec_inst_valid_m!");
    
      while (!(`SPC0.dec_inst_valid_m[1] == 1 && `SPC0.dec_tid1_m[1:0] == 1)) @(negedge `SPC0.l2clk);
    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 valid step starting!");
      disable FORK10_5; // kill timeout
      //disable FORK11_5;
      //       if (!`SPC0.spu_tlu_cwq_busy && 
//           !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//             `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 5)) spuActive[5] = 0;
    end
  join



  // finish step
  fork
    // timeout fork
    begin : FORK4_5
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);

      // may need to adjust. If a tid is doing a SPU sync ctl reg sync read,
      // it could stay "busy" for a REAL long time!!! Need delayed check of busy
      // since it can assert after the step has started.
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep5: TID 5 did not quiesce/complete after step (SS or DO) as it should have. not SPU busy (waitTime=%0d)!", stepWaitTime);
    end

    // look for SPU going active    
//     begin : FORK12_5
//       while (!(`SPC0.spu_tlu_cwq_busy || 
//         ((`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 5 && doMode) || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && ssMode))))
//         @(negedge `SPC0.l2clk);
//       spuActive[5] = 1;
//     end


    // look for flush_ifu (w/o lsu_trap_flush (aka ptrap_flush) if SS)
    // and end this task if seen. tlu_flush_ifu assertion always means
    // this "instruction" is done, but may repeat (tlb miss, etc) w/in the SS.
    begin : FORK6_5
        // checking ptrap_flush to make sure that flush is not caused by lsu_trap_flush
        while (`SPC0.tlu_flush_ifu[5] == 0)
          @(negedge `SPC0.l2clk);

// // debug!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if (`SPC0.tlu.fls1.ptrap_flush[1] == 1) begin
//   `PR_ERROR ("dbg_chk", `ERROR, "watchStep5: TID 5 have tlu_flush_ifu !!!!!!!!!!!!!!!!!!!!!!!");
// end
// 

        if ((ssMode && `SPC0.tlu.fls1.ptrap_flush[1] == 0) || doMode) begin
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 have tlu_flush_ifu (flushCount=%0d)!",flushCount5);
          watchStepFlush[5] = 1;
          flushCount5 = flushCount5+1;
          stepActive[5] = 0;
          disable watchStep5; // return
      end
    end


    // are we done fork, DO mode quiesce
    begin : FORK5_5
      if (doMode) begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 watching for quiesce (only matters fo DO mode)!");
        while (`SPC0.pku_quiesce[5] == 0 ||
               `SPC0.ftu_ifu_quiesce[5] == 0 ||
               `SPC0.lsu_stb_empty[5] == 0) @(negedge `SPC0.l2clk);

        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 have quiesce (only matters for DO mode)!");
        if (doMode) begin
          disable FORK4_5; // TO
          disable FORK6_5; // flush check
          //disable FORK12_5;
//           @(negedge `SPC0.l2clk);
//           if (!`SPC0.spu_tlu_cwq_busy && 
//               !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                 `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 5)) spuActive[5] = 0;
        end
      end
    end


    // are we done fork, SS mode only
    begin : FORK7_5
      // wait for SS complete
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount5,redirectCount5);
        stepDone[5] = 1;

//         while (ssMode && !`SPC0.spc_ss_complete) begin
//           // detect a second inst valid w/o a flush between
//           if (`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 1 && `SPC0.tlu.tlu_retry[1] == 1) begin
//             // delay error so flush thread can kill this in the "got flush" case
//             @(negedge `SPC0.l2clk); 
//             `PR_ERROR ("dbg_chk", `ERROR, "watchStep5: TID 5 had another inst start before SS done was asserted!");
//           end
//           @(negedge `SPC0.l2clk);
//         end // while

        if (`SPC0.pku_quiesce[5] == 0 ||
            `SPC0.ftu_ifu_quiesce[5] == 0 ||
            `SPC0.lsu_stb_empty[5] == 0)
          `PR_ERROR ("dbg_chk", `ERROR, "watchStep5: TID 5 was not quiesce at ss_complete assertion!");

        disable FORK4_5; // TO
        disable FORK6_5; // flush check
        //disable FORK12_5;
//         @(negedge `SPC0.l2clk);
//         if (!`SPC0.spu_tlu_cwq_busy && 
//             !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//               `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 5)) spuActive[5] = 0;
      end
    end

  join


  if (flushCount5 == 0) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 watchStep end!");
  else `PR_DEBUG("dbg_chk", `DEBUG, "watchStep5: TID 5 repeated watchStep end!");

  stepActive[5] = 0;

end
endtask



// check that thread does DO mode correctly
task watchDOsteps5;
begin
  
  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps5: TID 5 watchDOsteps starting!");

  if (! `TOP.cpu.tcu_do_mode[0]) disable watchDOsteps5;

  // now wait for a thread to start. TCU internal signal.
  if (`SPC0.tlu.tlu_core_running_status[5] == 0)
    @(posedge `SPC0.tlu.tlu_core_running_status[5]);

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps5 TID 5 unparked and running in DO mode!");

  // loop on step checking. DO mode is self stepping
  while (doMode) begin : watchDOsteps5loop// && `SPC0.tlu.tlu_core_running_status[7:0] != 0) begin

    stepDone[5] = 0;
    watchStepFlush[5] = 0;
    watchStepMMU[5] = 0;
 
    // are we starting to park in middle of DO mode (or end)?
    // wait here until unparked again
    if (parkTrans[5]) begin
      `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps5 TID 5 getting parked, will delay");
      @(negedge parkTrans[5]);
      if (!doMode) disable watchDOsteps5loop; // no longer in DO mode, bail
      // wait to be unparked or !doMode
      if (parkedState[5]) begin
        @(negedge doMode or negedge parkedState[5]);
        if (!doMode) disable watchDOsteps5loop; // no longer in DO mode, bail
      end
    end


    // an unparked thread does one instruction to completion before thread starts
    // the next instruction.
    fork
      // timeout fork
      begin : FORKDO15
        repeat (stepWaitTime) @(negedge `SPC0.l2clk);
          `PR_ERROR ("dbg_chk", `ERROR, "watchDOsteps5: DO mode, TID 5 timeout waiting for watchStep call to return, not SPU busy (+stepWaitTime=%0d)!", stepWaitTime);
      end

      // look for SPU going active    
//       begin : FORKDO25
//         while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 5)))
//           @(negedge `SPC0.l2clk);
//         `PR_ALWAYS("dbg_chk", `ALWAYS, "watchDOsteps5: DO mode, TID 5 sees SPU busy!");
//         spuActive[5] = 1;
//       end

      // watch step
      begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps5: TID 5 calling watchStep5 in DO mode!");
        watchStep5; // returns when step is done or flushed
        if (watchStepFlush[5]) 
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 5 in DO mode had flush!");
        if (watchStepMMU[5])
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 5 in DO mode had mmu reload!");
        // calling flush as a done in DO mode
        disable FORKDO15; // TO
        //disable FORKDO25; // SPU going active
      end

    join
  
    `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps5: TID 5 DO mode watchDOsteps step done!");
    stepDone[5] = 1;
    flushCount5 = 0;
//     if (!`SPC0.spu_tlu_cwq_busy && 
//         !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//           `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 5)) spuActive[5] = 0;

    @(negedge `SPC0.l2clk);
  end // while

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps5: TID 5 DO mode watchDOsteps task ending!");  
end
endtask




////////////////////////// end tid 5 ///////////////////////////////////////


//////////////////////////////////////////////////////////////////
// THREAD 6
//////////////////////////////////////////////////////////////////


// got park request. transition into parking.  parking check.
always @(negedge `SPC0.tlu.tcu_core_running[6]) begin: GOTPARK6
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 6 calling parkingCheck");
  if (enabled) parkingCheck6();
end

// got unpark request. transition into running. unparking check.
always @(posedge `SPC0.tlu.tcu_core_running[6]) begin: UNPARKCHECK6
  if (enabled && !ssMode) begin
    `PR_DEBUG("dbg_chk", `DEBUG, "TID 6 calling unparkCheck.");
    unparkCheck6();
  end
end

// while parked check
always @(posedge parkedState[6] or posedge virtualPark[6]) begin: PARKCHECK6  
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 6 calling parkedCheck");
  if (enabled) parkedCheck6();
end

// check for unexpected running transition
  always @(`SPC0.tlu.tlu_core_running_status[6]) begin: UNEXPECTED6
  if (!parkTrans[6] && enabled && ! doMode && ! ssMode) // review? to remove ! doMode
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 6 spc_core_running_status changed w/o request to park/unpark (trans=%0d)!",parkTrans[6]);
end



////////////// tasks for tid 6 ////////////////////

// check the entering into parked state
task parkingCheck6;

begin


  `PR_DEBUG("dbg_chk", `DEBUG, "TID 6 got park request!");

  if (parkTrans[6] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 6 got park request while park state is already transitioning! Possible diag conflict (multiple parkers)! (enabled=%0d)",enabled);
    `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +noDebugChecks to disable all debug checkes!");
    disable parkingCheck6;
  end

  parkTrans[6] = 1;

  // wait before checking signals
  repeat (2) @(negedge `SPC0.l2clk);

  // need to see at least one assertion of flush
  // if (`SPC0.tlu_flush_ifu[6] !== 1) 
  //   @(posedge `SPC0.tlu_flush_ifu[6]); // has glitches
  if (`SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[6] !== 1)
    @(posedge `SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[6]);

  // need to see all of these go idle
  while (`SPC0.pku_quiesce[6] == 0 ||
         `SPC0.ftu_ifu_quiesce[6] == 0 ||
         `SPC0.lsu_stb_empty[6] == 0) 
     @(negedge `SPC0.l2clk);

//   // need to see all of these go idle
//   while (`SPC0.pku_quiesce[6] == 0 ||
//          `SPC0.ftu_ifu_quiesce[6] == 0 ||
//          `SPC0.lsu_stb_empty[6] == 0 ||
//          `SPC0.tlu.fls1.idl_request == 0) 
//      @(negedge `SPC0.l2clk);

  parkedState[6] <= 1;
  parkTrans[6] <= 0;
  // `PR_ALWAYS("dbg_chk", `ALWAYS, "INFO: TID %0d has parked!", 6);
  `PR_DEBUG("dbg_chk", `DEBUG, "INFO: TID 6 has parked!");

end
endtask


// in parked state.
// also called between single steps.
task parkedCheck6;
reg notified;
begin //{

  notified = 0;
  // loop while not transitioning out of park if not SS mode.
  // loop while in SS virtualPark if SS mode.
  while ((parkTrans[6] == 0 && ssMode == 0) || 
         (virtualPark[6] == 1 && ssMode == 1 && 
          `TOP.cpu.tcu_ss_request[0] == 0)) begin //{
    `PR_DEBUG ("dbg_chk", `DEBUG, "TID 6 watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[6],virtualPark[6],`TOP.cpu.tcu_ss_request[0]);

    @(negedge `SPC0.l2clk);

    // if in SS mode and core_running goes to zero for that thread, the thread
    // will self step once and flush in order to change to a parked state
    // (core_running_status=0). This looks like an un-asked for step so it
    // has to be detected and ignored. Try stalling here during it.
    while (`SPC0.tlu.tcu_core_running[6] == 0 && 
           `SPC0.tlu.tlu_core_running_status[6] == 1) 
      @(negedge `SPC0.l2clk);

    // watch for instructions sneaking in
    // dec_inst_valid_m[1:0], one bit per group
    if (`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 6 && `SPC0.tlu.tlu_retry[1] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 6 had tlu_trap_pc_1_valid activity while parked/between steps!");

    if (`SPC0.dec_inst_valid_m[1] == 1 && `SPC0.dec_tid1_m[1:0] == 2)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 6 had dec_inst_valid_m activity while parked/between steps!");


  end //} while

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 6 STOP watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[6],virtualPark[6],`TOP.cpu.tcu_ss_request[0]);

end //}
endtask


// leaving parked state
task unparkCheck6;
integer count;
begin

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 6 got unpark request!");  

  if (parkTrans[6] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 6 got unpark request while park state is already transitioning! Possible diag conflict! (trans=%0h)",parkTrans);
    disable unparkCheck6;
  end

  parkTrans[6] = 1;

  // must see `SPC0.tlu.core_running_status[6] w/in count clocks
  count6 = 0;

  while (`SPC0.tlu.tlu_core_running_status[6] == 0) begin
    @(negedge `SPC0.l2clk);
    if (count6 > parkWait) begin //  <--- may need to adjust
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 6 did not assert spc_core_running_status as soon as it should have (%0d clocks)!", count6);
      `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +parkWait=n (currently %0d). +noDebugChecks disables all checks!",parkWait);
    end
    count6 = count6 + 1;
  end
  
  if (!doMode && !ssMode) begin
    // need to see re-direct w/in "redirectWait" more clocks
    count6 = 0;

    // if this is true, the redirect and the assertion of core_running_status
    // happened at once so while loop can be skipped.
      while (! (`SPC0.tlu_trap_pc_1_valid && 
                `SPC0.tlu_trap_1_tid[1:0] == 2)) begin
        @(negedge `SPC0.l2clk);
        if (count6 > redirectWait) begin //  <--- may need to adjust
          `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 6 did not redirect within %d clocks after core_running_status assert!", redirectWait);
          `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +redirectWait=n (currently %0d). +noDebugChecks disables all checks!",redirectWait);
        end
        count6 = count6 + 1;
      end
  end

  parkedState[6] <= 0;
  parkTrans[6] <= 0;
  count6 <= 0;

end
endtask


// watch this tid step correctly. Should step 1 instruction
// and then "virtual park".
// for SS and DO modes.
task watchStep6;
begin

  watchStepFlush[6] = 0; // set if we got a flush
  watchStepMMU[6] = 0;   // set if we got a mmu reload
  stepDone[6] = 0;
  stepActive[6] = 1;

  if (flushCount6) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 repeating watchStep task due to flush (flushCount=%0d, redirectCount=%0d)!",flushCount6,redirectCount6);


  fork
    // timeout fork
    begin : FORK10_6
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep6: TID 6 did not see valid PC retry (waitTime=%0d)!", stepWaitTime);
    end

//     // look for SPU going active    
//     begin : FORK11_6
//       while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 6)))
//         @(negedge `SPC0.l2clk);
//       `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 see SPU active!");
//       spuActive[6] = 1;
//     end

    // might get ss_complete due to not knowing if there are 1 or 2 or more flushes.
    // this task gets called w/o knowing in advance if there will be one more
    // assertion of tlu_trap_pc_0/1_valid or not.
    begin : FORK8_6
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount6, redirectCount6);
        stepDone[6] = 1;
        stepActive[6] = 0;
        disable watchStep6; // return
      end
    end

    // valid PC / retry
    begin : FORK9_6
      // start step. tid wakes up/redirects and does "one instruction"
      while (!(`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 2 && `SPC0.tlu.tlu_retry[1] == 1)) begin
        // might see  `SPC0.tlu.mmu_reload_done[6] here if previous
        // redirect was due to a MMU miss. If so, decrement flush count because
        // the previous flush on prev pc_valid "does not count" and there can be
        // any number of them w/ no way to predict quantity.
        if (`SPC0.tlu.mmu_reload_done[6] && ssMode) begin
          flushCount6 = flushCount6-1;
          redirectCount6 = redirectCount6-1;
          watchStepMMU[6] = 1;
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 saw mmu_reload_done (hwtw)! flushCount/redirectCount decremented to %0d/%0d", flushCount6, redirectCount6);
        end
        @(negedge `SPC0.l2clk);
      end

      redirectCount6 = redirectCount6+1;
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 got valid retry, step waiting on negedge pku_quiesce (redirectCount=%0d)!",redirectCount6);
      disable FORK8_6; // kill sync on spc_ss_complete

      @(negedge `SPC0.pku_quiesce[6]);    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 got negedge pku_quiesce, step waiting on dec_inst_valid_m!");
    
      while (!(`SPC0.dec_inst_valid_m[1] == 1 && `SPC0.dec_tid1_m[1:0] == 2)) @(negedge `SPC0.l2clk);
    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 valid step starting!");
      disable FORK10_6; // kill timeout
      //disable FORK11_6;
      //       if (!`SPC0.spu_tlu_cwq_busy && 
//           !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//             `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 6)) spuActive[6] = 0;
    end
  join



  // finish step
  fork
    // timeout fork
    begin : FORK4_6
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);

      // may need to adjust. If a tid is doing a SPU sync ctl reg sync read,
      // it could stay "busy" for a REAL long time!!! Need delayed check of busy
      // since it can assert after the step has started.
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep6: TID 6 did not quiesce/complete after step (SS or DO) as it should have. not SPU busy (waitTime=%0d)!", stepWaitTime);
    end

    // look for SPU going active    
//     begin : FORK12_6
//       while (!(`SPC0.spu_tlu_cwq_busy || 
//         ((`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 6 && doMode) || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && ssMode))))
//         @(negedge `SPC0.l2clk);
//       spuActive[6] = 1;
//     end


    // look for flush_ifu (w/o lsu_trap_flush (aka ptrap_flush) if SS)
    // and end this task if seen. tlu_flush_ifu assertion always means
    // this "instruction" is done, but may repeat (tlb miss, etc) w/in the SS.
    begin : FORK6_6
        // checking ptrap_flush to make sure that flush is not caused by lsu_trap_flush
        while (`SPC0.tlu_flush_ifu[6] == 0)
          @(negedge `SPC0.l2clk);

// // debug!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if (`SPC0.tlu.fls1.ptrap_flush[2] == 1) begin
//   `PR_ERROR ("dbg_chk", `ERROR, "watchStep6: TID 6 have tlu_flush_ifu !!!!!!!!!!!!!!!!!!!!!!!");
// end
// 

        if ((ssMode && `SPC0.tlu.fls1.ptrap_flush[2] == 0) || doMode) begin
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 have tlu_flush_ifu (flushCount=%0d)!",flushCount6);
          watchStepFlush[6] = 1;
          flushCount6 = flushCount6+1;
          stepActive[6] = 0;
          disable watchStep6; // return
      end
    end


    // are we done fork, DO mode quiesce
    begin : FORK5_6
      if (doMode) begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 watching for quiesce (only matters fo DO mode)!");
        while (`SPC0.pku_quiesce[6] == 0 ||
               `SPC0.ftu_ifu_quiesce[6] == 0 ||
               `SPC0.lsu_stb_empty[6] == 0) @(negedge `SPC0.l2clk);

        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 have quiesce (only matters for DO mode)!");
        if (doMode) begin
          disable FORK4_6; // TO
          disable FORK6_6; // flush check
          //disable FORK12_6;
//           @(negedge `SPC0.l2clk);
//           if (!`SPC0.spu_tlu_cwq_busy && 
//               !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                 `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 6)) spuActive[6] = 0;
        end
      end
    end


    // are we done fork, SS mode only
    begin : FORK7_6
      // wait for SS complete
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount6,redirectCount6);
        stepDone[6] = 1;

//         while (ssMode && !`SPC0.spc_ss_complete) begin
//           // detect a second inst valid w/o a flush between
//           if (`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 2 && `SPC0.tlu.tlu_retry[1] == 1) begin
//             // delay error so flush thread can kill this in the "got flush" case
//             @(negedge `SPC0.l2clk); 
//             `PR_ERROR ("dbg_chk", `ERROR, "watchStep6: TID 6 had another inst start before SS done was asserted!");
//           end
//           @(negedge `SPC0.l2clk);
//         end // while

        if (`SPC0.pku_quiesce[6] == 0 ||
            `SPC0.ftu_ifu_quiesce[6] == 0 ||
            `SPC0.lsu_stb_empty[6] == 0)
          `PR_ERROR ("dbg_chk", `ERROR, "watchStep6: TID 6 was not quiesce at ss_complete assertion!");

        disable FORK4_6; // TO
        disable FORK6_6; // flush check
        //disable FORK12_6;
//         @(negedge `SPC0.l2clk);
//         if (!`SPC0.spu_tlu_cwq_busy && 
//             !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//               `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 6)) spuActive[6] = 0;
      end
    end

  join


  if (flushCount6 == 0) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 watchStep end!");
  else `PR_DEBUG("dbg_chk", `DEBUG, "watchStep6: TID 6 repeated watchStep end!");

  stepActive[6] = 0;

end
endtask



// check that thread does DO mode correctly
task watchDOsteps6;
begin
  
  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps6: TID 6 watchDOsteps starting!");

  if (! `TOP.cpu.tcu_do_mode[0]) disable watchDOsteps6;

  // now wait for a thread to start. TCU internal signal.
  if (`SPC0.tlu.tlu_core_running_status[6] == 0)
    @(posedge `SPC0.tlu.tlu_core_running_status[6]);

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps6 TID 6 unparked and running in DO mode!");

  // loop on step checking. DO mode is self stepping
  while (doMode) begin : watchDOsteps6loop// && `SPC0.tlu.tlu_core_running_status[7:0] != 0) begin

    stepDone[6] = 0;
    watchStepFlush[6] = 0;
    watchStepMMU[6] = 0;
 
    // are we starting to park in middle of DO mode (or end)?
    // wait here until unparked again
    if (parkTrans[6]) begin
      `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps6 TID 6 getting parked, will delay");
      @(negedge parkTrans[6]);
      if (!doMode) disable watchDOsteps6loop; // no longer in DO mode, bail
      // wait to be unparked or !doMode
      if (parkedState[6]) begin
        @(negedge doMode or negedge parkedState[6]);
        if (!doMode) disable watchDOsteps6loop; // no longer in DO mode, bail
      end
    end


    // an unparked thread does one instruction to completion before thread starts
    // the next instruction.
    fork
      // timeout fork
      begin : FORKDO16
        repeat (stepWaitTime) @(negedge `SPC0.l2clk);
          `PR_ERROR ("dbg_chk", `ERROR, "watchDOsteps6: DO mode, TID 6 timeout waiting for watchStep call to return, not SPU busy (+stepWaitTime=%0d)!", stepWaitTime);
      end

      // look for SPU going active    
//       begin : FORKDO26
//         while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 6)))
//           @(negedge `SPC0.l2clk);
//         `PR_ALWAYS("dbg_chk", `ALWAYS, "watchDOsteps6: DO mode, TID 6 sees SPU busy!");
//         spuActive[6] = 1;
//       end

      // watch step
      begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps6: TID 6 calling watchStep6 in DO mode!");
        watchStep6; // returns when step is done or flushed
        if (watchStepFlush[6]) 
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 6 in DO mode had flush!");
        if (watchStepMMU[6])
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 6 in DO mode had mmu reload!");
        // calling flush as a done in DO mode
        disable FORKDO16; // TO
        //disable FORKDO26; // SPU going active
      end

    join
  
    `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps6: TID 6 DO mode watchDOsteps step done!");
    stepDone[6] = 1;
    flushCount6 = 0;
//     if (!`SPC0.spu_tlu_cwq_busy && 
//         !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//           `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 6)) spuActive[6] = 0;

    @(negedge `SPC0.l2clk);
  end // while

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps6: TID 6 DO mode watchDOsteps task ending!");  
end
endtask




////////////////////////// end tid 6 ///////////////////////////////////////


//////////////////////////////////////////////////////////////////
// THREAD 7
//////////////////////////////////////////////////////////////////


// got park request. transition into parking.  parking check.
always @(negedge `SPC0.tlu.tcu_core_running[7]) begin: GOTPARK7
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 7 calling parkingCheck");
  if (enabled) parkingCheck7();
end

// got unpark request. transition into running. unparking check.
always @(posedge `SPC0.tlu.tcu_core_running[7]) begin: UNPARKCHECK7
  if (enabled && !ssMode) begin
    `PR_DEBUG("dbg_chk", `DEBUG, "TID 7 calling unparkCheck.");
    unparkCheck7();
  end
end

// while parked check
always @(posedge parkedState[7] or posedge virtualPark[7]) begin: PARKCHECK7  
  `PR_DEBUG("dbg_chk", `DEBUG, "TID 7 calling parkedCheck");
  if (enabled) parkedCheck7();
end

// check for unexpected running transition
  always @(`SPC0.tlu.tlu_core_running_status[7]) begin: UNEXPECTED7
  if (!parkTrans[7] && enabled && ! doMode && ! ssMode) // review? to remove ! doMode
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 7 spc_core_running_status changed w/o request to park/unpark (trans=%0d)!",parkTrans[7]);
end



////////////// tasks for tid 7 ////////////////////

// check the entering into parked state
task parkingCheck7;

begin


  `PR_DEBUG("dbg_chk", `DEBUG, "TID 7 got park request!");

  if (parkTrans[7] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 7 got park request while park state is already transitioning! Possible diag conflict (multiple parkers)! (enabled=%0d)",enabled);
    `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +noDebugChecks to disable all debug checkes!");
    disable parkingCheck7;
  end

  parkTrans[7] = 1;

  // wait before checking signals
  repeat (2) @(negedge `SPC0.l2clk);

  // need to see at least one assertion of flush
  // if (`SPC0.tlu_flush_ifu[7] !== 1) 
  //   @(posedge `SPC0.tlu_flush_ifu[7]); // has glitches
  if (`SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[7] !== 1)
    @(posedge `SPC0.ifu_ftu.ftu_agc_ctl.tlu_flush_ifu_f[7]);

  // need to see all of these go idle
  while (`SPC0.pku_quiesce[7] == 0 ||
         `SPC0.ftu_ifu_quiesce[7] == 0 ||
         `SPC0.lsu_stb_empty[7] == 0) 
     @(negedge `SPC0.l2clk);

//   // need to see all of these go idle
//   while (`SPC0.pku_quiesce[7] == 0 ||
//          `SPC0.ftu_ifu_quiesce[7] == 0 ||
//          `SPC0.lsu_stb_empty[7] == 0 ||
//          `SPC0.tlu.fls1.idl_request == 0) 
//      @(negedge `SPC0.l2clk);

  parkedState[7] <= 1;
  parkTrans[7] <= 0;
  // `PR_ALWAYS("dbg_chk", `ALWAYS, "INFO: TID %0d has parked!", 7);
  `PR_DEBUG("dbg_chk", `DEBUG, "INFO: TID 7 has parked!");

end
endtask


// in parked state.
// also called between single steps.
task parkedCheck7;
reg notified;
begin //{

  notified = 0;
  // loop while not transitioning out of park if not SS mode.
  // loop while in SS virtualPark if SS mode.
  while ((parkTrans[7] == 0 && ssMode == 0) || 
         (virtualPark[7] == 1 && ssMode == 1 && 
          `TOP.cpu.tcu_ss_request[0] == 0)) begin //{
    `PR_DEBUG ("dbg_chk", `DEBUG, "TID 7 watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[7],virtualPark[7],`TOP.cpu.tcu_ss_request[0]);

    @(negedge `SPC0.l2clk);

    // if in SS mode and core_running goes to zero for that thread, the thread
    // will self step once and flush in order to change to a parked state
    // (core_running_status=0). This looks like an un-asked for step so it
    // has to be detected and ignored. Try stalling here during it.
    while (`SPC0.tlu.tcu_core_running[7] == 0 && 
           `SPC0.tlu.tlu_core_running_status[7] == 1) 
      @(negedge `SPC0.l2clk);

    // watch for instructions sneaking in
    // dec_inst_valid_m[1:0], one bit per group
    if (`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 7 && `SPC0.tlu.tlu_retry[1] == 1)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 7 had tlu_trap_pc_1_valid activity while parked/between steps!");

    if (`SPC0.dec_inst_valid_m[1] == 1 && `SPC0.dec_tid1_m[1:0] == 3)
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 7 had dec_inst_valid_m activity while parked/between steps!");


  end //} while

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 7 STOP watching for activity while parked/between steps. trans=%0h, virtualPark=%0h, tcu_ss_request=%0h",parkTrans[7],virtualPark[7],`TOP.cpu.tcu_ss_request[0]);

end //}
endtask


// leaving parked state
task unparkCheck7;
integer count;
begin

  `PR_DEBUG ("dbg_chk", `DEBUG, "TID 7 got unpark request!");  

  if (parkTrans[7] == 1) begin
    `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 7 got unpark request while park state is already transitioning! Possible diag conflict! (trans=%0h)",parkTrans);
    disable unparkCheck7;
  end

  parkTrans[7] = 1;

  // must see `SPC0.tlu.core_running_status[7] w/in count clocks
  count7 = 0;

  while (`SPC0.tlu.tlu_core_running_status[7] == 0) begin
    @(negedge `SPC0.l2clk);
    if (count7 > parkWait) begin //  <--- may need to adjust
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 7 did not assert spc_core_running_status as soon as it should have (%0d clocks)!", count7);
      `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +parkWait=n (currently %0d). +noDebugChecks disables all checks!",parkWait);
    end
    count7 = count7 + 1;
  end
  
  if (!doMode && !ssMode) begin
    // need to see re-direct w/in "redirectWait" more clocks
    count7 = 0;

    // if this is true, the redirect and the assertion of core_running_status
    // happened at once so while loop can be skipped.
      while (! (`SPC0.tlu_trap_pc_1_valid && 
                `SPC0.tlu_trap_1_tid[1:0] == 3)) begin
        @(negedge `SPC0.l2clk);
        if (count7 > redirectWait) begin //  <--- may need to adjust
          `PR_ERROR ("dbg_chk", `ERROR, "ERROR: TID 7 did not redirect within %d clocks after core_running_status assert!", redirectWait);
          `PR_ERROR ("dbg_chk", `ERROR, "NOTICE: For unusual circumstances, use +redirectWait=n (currently %0d). +noDebugChecks disables all checks!",redirectWait);
        end
        count7 = count7 + 1;
      end
  end

  parkedState[7] <= 0;
  parkTrans[7] <= 0;
  count7 <= 0;

end
endtask


// watch this tid step correctly. Should step 1 instruction
// and then "virtual park".
// for SS and DO modes.
task watchStep7;
begin

  watchStepFlush[7] = 0; // set if we got a flush
  watchStepMMU[7] = 0;   // set if we got a mmu reload
  stepDone[7] = 0;
  stepActive[7] = 1;

  if (flushCount7) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 repeating watchStep task due to flush (flushCount=%0d, redirectCount=%0d)!",flushCount7,redirectCount7);


  fork
    // timeout fork
    begin : FORK10_7
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep7: TID 7 did not see valid PC retry (waitTime=%0d)!", stepWaitTime);
    end

//     // look for SPU going active    
//     begin : FORK11_7
//       while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 7)))
//         @(negedge `SPC0.l2clk);
//       `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 see SPU active!");
//       spuActive[7] = 1;
//     end

    // might get ss_complete due to not knowing if there are 1 or 2 or more flushes.
    // this task gets called w/o knowing in advance if there will be one more
    // assertion of tlu_trap_pc_0/1_valid or not.
    begin : FORK8_7
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount7, redirectCount7);
        stepDone[7] = 1;
        stepActive[7] = 0;
        disable watchStep7; // return
      end
    end

    // valid PC / retry
    begin : FORK9_7
      // start step. tid wakes up/redirects and does "one instruction"
      while (!(`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 3 && `SPC0.tlu.tlu_retry[1] == 1)) begin
        // might see  `SPC0.tlu.mmu_reload_done[7] here if previous
        // redirect was due to a MMU miss. If so, decrement flush count because
        // the previous flush on prev pc_valid "does not count" and there can be
        // any number of them w/ no way to predict quantity.
        if (`SPC0.tlu.mmu_reload_done[7] && ssMode) begin
          flushCount7 = flushCount7-1;
          redirectCount7 = redirectCount7-1;
          watchStepMMU[7] = 1;
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 saw mmu_reload_done (hwtw)! flushCount/redirectCount decremented to %0d/%0d", flushCount7, redirectCount7);
        end
        @(negedge `SPC0.l2clk);
      end

      redirectCount7 = redirectCount7+1;
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 got valid retry, step waiting on negedge pku_quiesce (redirectCount=%0d)!",redirectCount7);
      disable FORK8_7; // kill sync on spc_ss_complete

      @(negedge `SPC0.pku_quiesce[7]);    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 got negedge pku_quiesce, step waiting on dec_inst_valid_m!");
    
      while (!(`SPC0.dec_inst_valid_m[1] == 1 && `SPC0.dec_tid1_m[1:0] == 3)) @(negedge `SPC0.l2clk);
    
      `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 valid step starting!");
      disable FORK10_7; // kill timeout
      //disable FORK11_7;
      //       if (!`SPC0.spu_tlu_cwq_busy && 
//           !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//             `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 7)) spuActive[7] = 0;
    end
  join



  // finish step
  fork
    // timeout fork
    begin : FORK4_7
      repeat (stepWaitTime) @(negedge `SPC0.l2clk);

      // may need to adjust. If a tid is doing a SPU sync ctl reg sync read,
      // it could stay "busy" for a REAL long time!!! Need delayed check of busy
      // since it can assert after the step has started.
        `PR_ERROR ("dbg_chk", `ERROR, "watchStep7: TID 7 did not quiesce/complete after step (SS or DO) as it should have. not SPU busy (waitTime=%0d)!", stepWaitTime);
    end

    // look for SPU going active    
//     begin : FORK12_7
//       while (!(`SPC0.spu_tlu_cwq_busy || 
//         ((`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 7 && doMode) || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && ssMode))))
//         @(negedge `SPC0.l2clk);
//       spuActive[7] = 1;
//     end


    // look for flush_ifu (w/o lsu_trap_flush (aka ptrap_flush) if SS)
    // and end this task if seen. tlu_flush_ifu assertion always means
    // this "instruction" is done, but may repeat (tlb miss, etc) w/in the SS.
    begin : FORK6_7
        // checking ptrap_flush to make sure that flush is not caused by lsu_trap_flush
        while (`SPC0.tlu_flush_ifu[7] == 0)
          @(negedge `SPC0.l2clk);

// // debug!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if (`SPC0.tlu.fls1.ptrap_flush[3] == 1) begin
//   `PR_ERROR ("dbg_chk", `ERROR, "watchStep7: TID 7 have tlu_flush_ifu !!!!!!!!!!!!!!!!!!!!!!!");
// end
// 

        if ((ssMode && `SPC0.tlu.fls1.ptrap_flush[3] == 0) || doMode) begin
          `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 have tlu_flush_ifu (flushCount=%0d)!",flushCount7);
          watchStepFlush[7] = 1;
          flushCount7 = flushCount7+1;
          stepActive[7] = 0;
          disable watchStep7; // return
      end
    end


    // are we done fork, DO mode quiesce
    begin : FORK5_7
      if (doMode) begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 watching for quiesce (only matters fo DO mode)!");
        while (`SPC0.pku_quiesce[7] == 0 ||
               `SPC0.ftu_ifu_quiesce[7] == 0 ||
               `SPC0.lsu_stb_empty[7] == 0) @(negedge `SPC0.l2clk);

        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 have quiesce (only matters for DO mode)!");
        if (doMode) begin
          disable FORK4_7; // TO
          disable FORK6_7; // flush check
          //disable FORK12_7;
//           @(negedge `SPC0.l2clk);
//           if (!`SPC0.spu_tlu_cwq_busy && 
//               !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                 `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 7)) spuActive[7] = 0;
        end
      end
    end


    // are we done fork, SS mode only
    begin : FORK7_7
      // wait for SS complete
      if (ssMode) begin
        @(posedge `SPC0.spc_ss_complete);
        `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 see spc_ss_complete, step done, bailing (flushCount=%0d/redirectCount=%0d)!", flushCount7,redirectCount7);
        stepDone[7] = 1;

//         while (ssMode && !`SPC0.spc_ss_complete) begin
//           // detect a second inst valid w/o a flush between
//           if (`SPC0.tlu_trap_pc_1_valid && `SPC0.tlu_trap_1_tid[1:0] == 3 && `SPC0.tlu.tlu_retry[1] == 1) begin
//             // delay error so flush thread can kill this in the "got flush" case
//             @(negedge `SPC0.l2clk); 
//             `PR_ERROR ("dbg_chk", `ERROR, "watchStep7: TID 7 had another inst start before SS done was asserted!");
//           end
//           @(negedge `SPC0.l2clk);
//         end // while

        if (`SPC0.pku_quiesce[7] == 0 ||
            `SPC0.ftu_ifu_quiesce[7] == 0 ||
            `SPC0.lsu_stb_empty[7] == 0)
          `PR_ERROR ("dbg_chk", `ERROR, "watchStep7: TID 7 was not quiesce at ss_complete assertion!");

        disable FORK4_7; // TO
        disable FORK6_7; // flush check
        //disable FORK12_7;
//         @(negedge `SPC0.l2clk);
//         if (!`SPC0.spu_tlu_cwq_busy && 
//             !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//               `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 7)) spuActive[7] = 0;
      end
    end

  join


  if (flushCount7 == 0) `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 watchStep end!");
  else `PR_DEBUG("dbg_chk", `DEBUG, "watchStep7: TID 7 repeated watchStep end!");

  stepActive[7] = 0;

end
endtask



// check that thread does DO mode correctly
task watchDOsteps7;
begin
  
  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps7: TID 7 watchDOsteps starting!");

  if (! `TOP.cpu.tcu_do_mode[0]) disable watchDOsteps7;

  // now wait for a thread to start. TCU internal signal.
  if (`SPC0.tlu.tlu_core_running_status[7] == 0)
    @(posedge `SPC0.tlu.tlu_core_running_status[7]);

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps7 TID 7 unparked and running in DO mode!");

  // loop on step checking. DO mode is self stepping
  while (doMode) begin : watchDOsteps7loop// && `SPC0.tlu.tlu_core_running_status[7:0] != 0) begin

    stepDone[7] = 0;
    watchStepFlush[7] = 0;
    watchStepMMU[7] = 0;
 
    // are we starting to park in middle of DO mode (or end)?
    // wait here until unparked again
    if (parkTrans[7]) begin
      `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps7 TID 7 getting parked, will delay");
      @(negedge parkTrans[7]);
      if (!doMode) disable watchDOsteps7loop; // no longer in DO mode, bail
      // wait to be unparked or !doMode
      if (parkedState[7]) begin
        @(negedge doMode or negedge parkedState[7]);
        if (!doMode) disable watchDOsteps7loop; // no longer in DO mode, bail
      end
    end


    // an unparked thread does one instruction to completion before thread starts
    // the next instruction.
    fork
      // timeout fork
      begin : FORKDO17
        repeat (stepWaitTime) @(negedge `SPC0.l2clk);
          `PR_ERROR ("dbg_chk", `ERROR, "watchDOsteps7: DO mode, TID 7 timeout waiting for watchStep call to return, not SPU busy (+stepWaitTime=%0d)!", stepWaitTime);
      end

      // look for SPU going active    
//       begin : FORKDO27
//         while (!(`SPC0.spu_tlu_cwq_busy || (`SPC0.spu.mct.spu_pmu_ma_busy[3] && `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 7)))
//           @(negedge `SPC0.l2clk);
//         `PR_ALWAYS("dbg_chk", `ALWAYS, "watchDOsteps7: DO mode, TID 7 sees SPU busy!");
//         spuActive[7] = 1;
//       end

      // watch step
      begin
        `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps7: TID 7 calling watchStep7 in DO mode!");
        watchStep7; // returns when step is done or flushed
        if (watchStepFlush[7]) 
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 7 in DO mode had flush!");
        if (watchStepMMU[7])
          `PR_DEBUG ("dbg_chk", `DEBUG, "TID 7 in DO mode had mmu reload!");
        // calling flush as a done in DO mode
        disable FORKDO17; // TO
        //disable FORKDO27; // SPU going active
      end

    join
  
    `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps7: TID 7 DO mode watchDOsteps step done!");
    stepDone[7] = 1;
    flushCount7 = 0;
//     if (!`SPC0.spu_tlu_cwq_busy && 
//         !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//           `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 7)) spuActive[7] = 0;

    @(negedge `SPC0.l2clk);
  end // while

  `PR_DEBUG("dbg_chk", `DEBUG, "watchDOsteps7: TID 7 DO mode watchDOsteps task ending!");  
end
endtask




////////////////////////// end tid 7 ///////////////////////////////////////



////////////// DO mode checks ////////////////////

always @(posedge `TOP.cpu.tcu_do_mode[0]) begin: DOMODE
  if (enabled) begin
 
    `PR_ALWAYS ("dbg_chk", `ALWAYS, "Entering Disable Overlap mode!");
    if (parkedState !== 8'hff) 
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: All threads must be parked when enabling/disabling DO mode!");
    doMode = 1;
    stepDone = 0;

    // wait for core_running to change (unparking) so DO steps can start
    // Assumes (safely) a SINGLE change to this register!
    if (`SPC0.tlu.tcu_core_running[7:0] == 0) 
      @(`SPC0.tlu.tcu_core_running[7:0]) 

    stepAllowed[7:0] = `SPC0.tlu.tcu_core_running[7:0];

    `PR_DEBUG("dbg_chk", `DEBUG, "DO mode, ready to run in DO mode!");


    // for each thread, call a task that checks DO mode.
    // these return when DO mode ends
    fork
      if (stepAllowed[0]) watchDOsteps0;
      if (stepAllowed[1]) watchDOsteps1;
      if (stepAllowed[2]) watchDOsteps2;
      if (stepAllowed[3]) watchDOsteps3;
      if (stepAllowed[4]) watchDOsteps4;
      if (stepAllowed[5]) watchDOsteps5;
      if (stepAllowed[6]) watchDOsteps6;
      if (stepAllowed[7]) watchDOsteps7;
    join

  end
end



always @(negedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    `PR_ALWAYS ("dbg_chk", `ALWAYS, "Ending Disable Overlap mode!");
    doMode = 0;
    if (parkedState !== 8'hff) 
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: All threads must be parked when enabling/disabling DO mode!");
    if (stepAllowed[0]) disable watchStep0;
    if (stepAllowed[1]) disable watchStep1;
    if (stepAllowed[2]) disable watchStep2;
    if (stepAllowed[3]) disable watchStep3;
    if (stepAllowed[4]) disable watchStep4;
    if (stepAllowed[5]) disable watchStep5;
    if (stepAllowed[6]) disable watchStep6;
    if (stepAllowed[7]) disable watchStep7;
    stepAllowed[7:0] = 0;
  end
end



////////////// SS mode checks ////////////////////
////////////// SS mode checks ////////////////////
////////////// SS mode checks ////////////////////

always @(posedge `TOP.cpu.tcu_ss_mode[0]) begin: SSMODE

  if (enabled) begin
 
    // initial value in case ss_mode and tcu_core_running change at once
    stepAllowed[7:0] = `SPC0.tlu.tcu_core_running[7:0]; // need?
  
    `PR_ALWAYS ("dbg_chk", `ALWAYS, "Entering Single Step mode!");
    if (parkedState !== 8'hff) 
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: All threads must be parked when enabling SS mode!");
  
    stepDone = 0;
    ssMode = 1;
    @(negedge `SPC0.l2clk);
    // use virtualPark for SS mode, not parkedState
    //virtualPark = threadEnable;
    virtualPark = `PARGS.th_check_enable; // th_check_enable is set dynamically

    // wait for core_running to change so steps can start
    if (`SPC0.tlu.tcu_core_running[7:0] == 0) 
      @(`SPC0.tlu.tcu_core_running[7:0]) stepAllowed[7:0] = `SPC0.tlu.tcu_core_running[7:0];

    `PR_DEBUG("dbg_chk", `DEBUG, "SS mode, ready to run in SS mode!");

    // loop on this step checking
    while (`TOP.cpu.tcu_ss_mode[0] === 1) begin
  
      // wait for TCU to request a step or for SS mode to end
      @(posedge `TOP.cpu.tcu_ss_request or negedge `TOP.cpu.tcu_ss_mode[0]);

      if (`TOP.cpu.tcu_ss_mode[0] === 1) begin

        @(negedge `SPC0.l2clk);

        virtualPark = 0;
        stepCount = stepCount+1;
        stepDone = 0;
        watchStepFlush = 0;
        watchStepMMU = 0;
        
        fork
          if (stepAllowed[0]) begin
            flushCount0 = 0;
            redirectCount0 = 0;
            watchStep0; // returns when inst is done
            // got a flush, will be more activity
            if (flushCount0 != 0) begin
              while (!stepDone[0]) begin
                @(negedge `SPC0.l2clk);
                watchStep0; // returns when inst is done
                if (flushCount0 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 0 too many flushes in SS mode (%0d)",flushCount0);
                if (redirectCount0 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 0 too many redirects in SS mode (%0d)",redirectCount0);
                if (redirectCount0 > 1 && watchStepMMU[0])
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 0 too many redirects in SS mode when mmu_reload_done (%0d)",redirectCount0);
              end
            end
            virtualPark[0] = 1; // should be in virtual park. starts parkedCheck0
            stepDone[0] = 1;
//             if (!`SPC0.spu_tlu_cwq_busy && 
//                 !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                   `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 0)) spuActive[0] = 0;
          end

          if (stepAllowed[1]) begin
            flushCount1 = 0;
            redirectCount1 = 0;
            watchStep1; // returns when inst is done
            // got a flush, will be more activity
            if (flushCount1 != 0) begin
              while (!stepDone[1]) begin
                @(negedge `SPC0.l2clk);
                watchStep1; // returns when inst is done
                if (flushCount1 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 1 too many flushes in SS mode (%0d)",flushCount1);
                if (redirectCount1 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 1 too many redirects in SS mode (%0d)",redirectCount1);
                if (redirectCount1 > 1 && watchStepMMU[1])
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 1 too many redirects in SS mode when mmu_reload_done (%0d)",redirectCount1);
              end
            end
            virtualPark[1] = 1; // should be in virtual park. starts parkedCheck0
            stepDone[1] = 1;
//             if (!`SPC0.spu_tlu_cwq_busy && 
//                 !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                   `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 1)) spuActive[1] = 0;
          end

          if (stepAllowed[2]) begin
            flushCount2 = 0;
            redirectCount2 = 0;
            watchStep2; // returns when inst is done
            // got a flush, will be more activity
            if (flushCount2 != 0) begin
              while (!stepDone[2]) begin
                @(negedge `SPC0.l2clk);
                watchStep2; // returns when inst is done
                if (flushCount2 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 2 too many flushes in SS mode (%0d)",flushCount2);
                if (redirectCount2 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 2 too many redirects in SS mode (%0d)",redirectCount2);
                if (redirectCount2 > 1 && watchStepMMU[2])
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 2 too many redirects in SS mode when mmu_reload_done (%0d)",redirectCount2);
              end
            end
            virtualPark[2] = 1; // should be in virtual park. starts parkedCheck0
            stepDone[2] = 1;
//             if (!`SPC0.spu_tlu_cwq_busy && 
//                 !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                   `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 2)) spuActive[2] = 0;
          end

          if (stepAllowed[3]) begin
            flushCount3 = 0;
            redirectCount3 = 0;
            watchStep3; // returns when inst is done
            // got a flush, will be more activity
            if (flushCount3 != 0) begin
              while (!stepDone[3]) begin
                @(negedge `SPC0.l2clk);
                watchStep3; // returns when inst is done
                if (flushCount3 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 3 too many flushes in SS mode (%0d)",flushCount3);
                if (redirectCount3 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 3 too many redirects in SS mode (%0d)",redirectCount3);
                if (redirectCount3 > 1 && watchStepMMU[3])
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 3 too many redirects in SS mode when mmu_reload_done (%0d)",redirectCount3);
              end
            end
            virtualPark[3] = 1; // should be in virtual park. starts parkedCheck0
            stepDone[3] = 1;
//             if (!`SPC0.spu_tlu_cwq_busy && 
//                 !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                   `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 3)) spuActive[3] = 0;
          end

          if (stepAllowed[4]) begin
            flushCount4 = 0;
            redirectCount4 = 0;
            watchStep4; // returns when inst is done
            // got a flush, will be more activity
            if (flushCount4 != 0) begin
              while (!stepDone[4]) begin
                @(negedge `SPC0.l2clk);
                watchStep4; // returns when inst is done
                if (flushCount4 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 4 too many flushes in SS mode (%0d)",flushCount4);
                if (redirectCount4 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 4 too many redirects in SS mode (%0d)",redirectCount4);
                if (redirectCount4 > 1 && watchStepMMU[4])
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 4 too many redirects in SS mode when mmu_reload_done (%0d)",redirectCount4);
              end
            end
            virtualPark[4] = 1; // should be in virtual park. starts parkedCheck0
            stepDone[4] = 1;
//             if (!`SPC0.spu_tlu_cwq_busy && 
//                 !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                   `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 4)) spuActive[4] = 0;
          end

          if (stepAllowed[5]) begin
            flushCount5 = 0;
            redirectCount5 = 0;
            watchStep5; // returns when inst is done
            // got a flush, will be more activity
            if (flushCount5 != 0) begin
              while (!stepDone[5]) begin
                @(negedge `SPC0.l2clk);
                watchStep5; // returns when inst is done
                if (flushCount5 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 5 too many flushes in SS mode (%0d)",flushCount5);
                if (redirectCount5 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 5 too many redirects in SS mode (%0d)",redirectCount5);
                if (redirectCount5 > 1 && watchStepMMU[5])
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 5 too many redirects in SS mode when mmu_reload_done (%0d)",redirectCount5);
              end
            end
            virtualPark[5] = 1; // should be in virtual park. starts parkedCheck0
            stepDone[5] = 1;
//             if (!`SPC0.spu_tlu_cwq_busy && 
//                 !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                   `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 5)) spuActive[5] = 0;
          end

          if (stepAllowed[6]) begin
            flushCount6 = 0;
            redirectCount6 = 0;
            watchStep6; // returns when inst is done
            // got a flush, will be more activity
            if (flushCount6 != 0) begin
              while (!stepDone[6]) begin
                @(negedge `SPC0.l2clk);
                watchStep6; // returns when inst is done
                if (flushCount6 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 6 too many flushes in SS mode (%0d)",flushCount6);
                if (redirectCount6 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 6 too many redirects in SS mode (%0d)",redirectCount6);
                if (redirectCount6 > 1 && watchStepMMU[6])
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 6 too many redirects in SS mode when mmu_reload_done (%0d)",redirectCount6);
              end
            end
            virtualPark[6] = 1; // should be in virtual park. starts parkedCheck0
            stepDone[6] = 1;
//             if (!`SPC0.spu_tlu_cwq_busy && 
//                 !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                   `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 6)) spuActive[6] = 0;
          end

          if (stepAllowed[7]) begin
            flushCount7 = 0;
            redirectCount7 = 0;
            watchStep7; // returns when inst is done
            // got a flush, will be more activity
            if (flushCount7 != 0) begin
              while (!stepDone[7]) begin
                @(negedge `SPC0.l2clk);
                watchStep7; // returns when inst is done
                if (flushCount7 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 7 too many flushes in SS mode (%0d)",flushCount7);
                if (redirectCount7 > 2)
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 7 too many redirects in SS mode (%0d)",redirectCount7);
                if (redirectCount7 > 1 && watchStepMMU[7])
                  `PR_ERROR ("dbg_chk", `ERROR, "TID 7 too many redirects in SS mode when mmu_reload_done (%0d)",redirectCount7);
              end
            end
            virtualPark[7] = 1; // should be in virtual park. starts parkedCheck0
            stepDone[7] = 1;
//             if (!`SPC0.spu_tlu_cwq_busy && 
//                 !(`SPC0.spu.mct.spu_pmu_ma_busy[3] && 
//                   `SPC0.spu.mct.spu_pmu_ma_busy[2:0] == 7)) spuActive[7] = 0;
          end


        join
  
  
        // redundant sanity check
        if (stepDone[7:0] !== `SPC0.tlu.tcu_core_running[7:0])
           `PR_ERROR ("dbg_chk", `ERROR, "ERROR: SS mode stepDone not correct (%b/%b/%b stepAllowed,stepDone,core_running)!",stepAllowed, stepDone, `SPC0.tlu.tcu_core_running[7:0]);
  
      // DUT must assert ss_complete AND stay idle. timeout for ss_complete
//       fork
//         begin : FORK2
//           repeat (stepWaitTime) @(negedge `SPC0.l2clk);
//           `PR_ERROR ("dbg_chk", `ERROR, "ERROR: Core did not assert ss_complete when it should have! Waited %0d clocks after watchStep return.",stepWaitTime);
//         end
//         @(posedge `SPC0.spc_ss_complete) disable FORK2;
//       join

      // DUT must have asserted ss_complete
//       if (!`SPC0.spc_ss_complete)
//         `PR_ERROR ("dbg_chk", `ERROR, "ERROR: Not seeing ss_complete after all threads stepped. Checker problem?");

        // all threads must be in virtual park state and quiesced
        if (virtualPark[7:0] !== `SPC0.tlu.tcu_core_running[7:0])
          `PR_ERROR ("dbg_chk", `ERROR, "ERROR: Core at ss_complete assertion, threads were not idle.");

        `PR_DEBUG("dbg_chk", `DEBUG, "SS mode stepDone (%0d)!", stepCount);
  
      end // while
    end
  `PR_ALWAYS ("dbg_chk", `ALWAYS, "Ending Single Step mode (running step count: %0d!",stepCount);
  end
end


always @(negedge `TOP.cpu.tcu_ss_mode[0]) begin
  if (enabled) begin
    `PR_DEBUG("dbg_chk", `DEBUG, "Clearing out Single Step mode state!");
    ssMode = 0;
    stepAllowed = 0;
    virtualPark = 0;
    if (!(`SPC0.tcu_core_running[7:0] == 0 && 
        `SPC0.spc_core_running_status[7:0] == 8'h0))
      `PR_ERROR ("dbg_chk", `ERROR, "ERROR: All threads must be parked when disabling SS mode!");
    disable watchStep0;
    disable watchStep1;
    disable watchStep2;
    disable watchStep3;
    disable watchStep4;
    disable watchStep5;
    disable watchStep6;
    disable watchStep7;
  end
end




// TID 0 ifetch buffer check
// make sure that buffer zero is the only buffer valid. 
// 
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.ifu_ibu.ibq0.buf_valid_p[7:1] != 0 && 
          `TOP.cpu.spc0.ifu_ibu.ibq0.instr_sf_valid_except_p == 0 &&
          `SPC0.tcu_core_running[0])
        `PR_ERROR ("dbg_chk", `ERROR, "TID 0 had ifetch buffer(s) valid other than zero (buf_valid_p[7:1]=%0b)!",`TOP.cpu.spc0.ifu_ibu.ibq0.buf_valid_p[7:1]);
    end      
  end
end

// TID 1 ifetch buffer check
// make sure that buffer zero is the only buffer valid. 
// 
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.ifu_ibu.ibq1.buf_valid_p[7:1] != 0 && 
          `TOP.cpu.spc0.ifu_ibu.ibq1.instr_sf_valid_except_p == 0 &&
          `SPC0.tcu_core_running[1])
        `PR_ERROR ("dbg_chk", `ERROR, "TID 1 had ifetch buffer(s) valid other than zero (buf_valid_p[7:1]=%0b)!",`TOP.cpu.spc0.ifu_ibu.ibq1.buf_valid_p[7:1]);
    end      
  end
end

// TID 2 ifetch buffer check
// make sure that buffer zero is the only buffer valid. 
// 
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.ifu_ibu.ibq2.buf_valid_p[7:1] != 0 && 
          `TOP.cpu.spc0.ifu_ibu.ibq2.instr_sf_valid_except_p == 0 &&
          `SPC0.tcu_core_running[2])
        `PR_ERROR ("dbg_chk", `ERROR, "TID 2 had ifetch buffer(s) valid other than zero (buf_valid_p[7:1]=%0b)!",`TOP.cpu.spc0.ifu_ibu.ibq2.buf_valid_p[7:1]);
    end      
  end
end

// TID 3 ifetch buffer check
// make sure that buffer zero is the only buffer valid. 
// 
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.ifu_ibu.ibq3.buf_valid_p[7:1] != 0 && 
          `TOP.cpu.spc0.ifu_ibu.ibq3.instr_sf_valid_except_p == 0 &&
          `SPC0.tcu_core_running[3])
        `PR_ERROR ("dbg_chk", `ERROR, "TID 3 had ifetch buffer(s) valid other than zero (buf_valid_p[7:1]=%0b)!",`TOP.cpu.spc0.ifu_ibu.ibq3.buf_valid_p[7:1]);
    end      
  end
end

// TID 4 ifetch buffer check
// make sure that buffer zero is the only buffer valid. 
// 
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.ifu_ibu.ibq4.buf_valid_p[7:1] != 0 && 
          `TOP.cpu.spc0.ifu_ibu.ibq4.instr_sf_valid_except_p == 0 &&
          `SPC0.tcu_core_running[4])
        `PR_ERROR ("dbg_chk", `ERROR, "TID 4 had ifetch buffer(s) valid other than zero (buf_valid_p[7:1]=%0b)!",`TOP.cpu.spc0.ifu_ibu.ibq4.buf_valid_p[7:1]);
    end      
  end
end

// TID 5 ifetch buffer check
// make sure that buffer zero is the only buffer valid. 
// 
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.ifu_ibu.ibq5.buf_valid_p[7:1] != 0 && 
          `TOP.cpu.spc0.ifu_ibu.ibq5.instr_sf_valid_except_p == 0 &&
          `SPC0.tcu_core_running[5])
        `PR_ERROR ("dbg_chk", `ERROR, "TID 5 had ifetch buffer(s) valid other than zero (buf_valid_p[7:1]=%0b)!",`TOP.cpu.spc0.ifu_ibu.ibq5.buf_valid_p[7:1]);
    end      
  end
end

// TID 6 ifetch buffer check
// make sure that buffer zero is the only buffer valid. 
// 
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.ifu_ibu.ibq6.buf_valid_p[7:1] != 0 && 
          `TOP.cpu.spc0.ifu_ibu.ibq6.instr_sf_valid_except_p == 0 &&
          `SPC0.tcu_core_running[6])
        `PR_ERROR ("dbg_chk", `ERROR, "TID 6 had ifetch buffer(s) valid other than zero (buf_valid_p[7:1]=%0b)!",`TOP.cpu.spc0.ifu_ibu.ibq6.buf_valid_p[7:1]);
    end      
  end
end

// TID 7 ifetch buffer check
// make sure that buffer zero is the only buffer valid. 
// 
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.ifu_ibu.ibq7.buf_valid_p[7:1] != 0 && 
          `TOP.cpu.spc0.ifu_ibu.ibq7.instr_sf_valid_except_p == 0 &&
          `SPC0.tcu_core_running[7])
        `PR_ERROR ("dbg_chk", `ERROR, "TID 7 had ifetch buffer(s) valid other than zero (buf_valid_p[7:1]=%0b)!",`TOP.cpu.spc0.ifu_ibu.ibq7.buf_valid_p[7:1]);
    end      
  end
end

// TID 0 pipelineing check
// watch m stage and make sure that the tid does not have a valid inst
// there more often than every 9 clocks. counter must get to at least 9.
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    pipelineCount0 = 9;
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.tlu.dec_tid0_m[1:0] == 0 && `TOP.cpu.spc0.tlu.dec_inst_valid_m[0] == 1 && `SPC0.tcu_core_running[0] && (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0])) begin
        // have inst
        if (pipelineCount0 < 9) begin
          `PR_ERROR ("dbg_chk", `ERROR, "TID 0 had pipelining in DO or SS mode (pipelineCount=%0d)!",pipelineCount0);
          //stall
          @(negedge `TOP.cpu.tcu_ss_mode[0] or negedge `TOP.cpu.tcu_do_mode[0]);
        end
        pipelineCount0 = 0; // reset after each inst
      end
      else
        // no new inst for tid yet
        pipelineCount0 = pipelineCount0+1;

    end // while DO/SS mode
  end // if
end // always



// TID 1 pipelineing check
// watch m stage and make sure that the tid does not have a valid inst
// there more often than every 9 clocks. counter must get to at least 9.
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    pipelineCount1 = 9;
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.tlu.dec_tid0_m[1:0] == 1 && `TOP.cpu.spc0.tlu.dec_inst_valid_m[0] == 1 && `SPC0.tcu_core_running[1] && (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0])) begin
        // have inst
        if (pipelineCount1 < 9) begin
          `PR_ERROR ("dbg_chk", `ERROR, "TID 1 had pipelining in DO or SS mode (pipelineCount=%0d)!",pipelineCount1);
          //stall
          @(negedge `TOP.cpu.tcu_ss_mode[0] or negedge `TOP.cpu.tcu_do_mode[0]);
        end
        pipelineCount1 = 0; // reset after each inst
      end
      else
        // no new inst for tid yet
        pipelineCount1 = pipelineCount1+1;

    end // while DO/SS mode
  end // if
end // always



// TID 2 pipelineing check
// watch m stage and make sure that the tid does not have a valid inst
// there more often than every 9 clocks. counter must get to at least 9.
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    pipelineCount2 = 9;
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.tlu.dec_tid0_m[1:0] == 2 && `TOP.cpu.spc0.tlu.dec_inst_valid_m[0] == 1 && `SPC0.tcu_core_running[2] && (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0])) begin
        // have inst
        if (pipelineCount2 < 9) begin
          `PR_ERROR ("dbg_chk", `ERROR, "TID 2 had pipelining in DO or SS mode (pipelineCount=%0d)!",pipelineCount2);
          //stall
          @(negedge `TOP.cpu.tcu_ss_mode[0] or negedge `TOP.cpu.tcu_do_mode[0]);
        end
        pipelineCount2 = 0; // reset after each inst
      end
      else
        // no new inst for tid yet
        pipelineCount2 = pipelineCount2+1;

    end // while DO/SS mode
  end // if
end // always



// TID 3 pipelineing check
// watch m stage and make sure that the tid does not have a valid inst
// there more often than every 9 clocks. counter must get to at least 9.
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    pipelineCount3 = 9;
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.tlu.dec_tid0_m[1:0] == 3 && `TOP.cpu.spc0.tlu.dec_inst_valid_m[0] == 1 && `SPC0.tcu_core_running[3] && (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0])) begin
        // have inst
        if (pipelineCount3 < 9) begin
          `PR_ERROR ("dbg_chk", `ERROR, "TID 3 had pipelining in DO or SS mode (pipelineCount=%0d)!",pipelineCount3);
          //stall
          @(negedge `TOP.cpu.tcu_ss_mode[0] or negedge `TOP.cpu.tcu_do_mode[0]);
        end
        pipelineCount3 = 0; // reset after each inst
      end
      else
        // no new inst for tid yet
        pipelineCount3 = pipelineCount3+1;

    end // while DO/SS mode
  end // if
end // always



// TID 4 pipelineing check
// watch m stage and make sure that the tid does not have a valid inst
// there more often than every 9 clocks. counter must get to at least 9.
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    pipelineCount4 = 9;
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.tlu.dec_tid1_m[1:0] == 0 && `TOP.cpu.spc0.tlu.dec_inst_valid_m[1] == 1 && `SPC0.tcu_core_running[4] && (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0])) begin
        // have inst
        if (pipelineCount4 < 9) begin
          `PR_ERROR ("dbg_chk", `ERROR, "TID 4 had pipelining in DO or SS mode (pipelineCount=%0d)!",pipelineCount4);
          //stall
          @(negedge `TOP.cpu.tcu_ss_mode[0] or negedge `TOP.cpu.tcu_do_mode[0]);
        end
        pipelineCount4 = 0; // reset after each inst
      end
      else
        // no new inst for tid yet
        pipelineCount4 = pipelineCount4+1;

    end // while DO/SS mode
  end // if
end // always



// TID 5 pipelineing check
// watch m stage and make sure that the tid does not have a valid inst
// there more often than every 9 clocks. counter must get to at least 9.
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    pipelineCount5 = 9;
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.tlu.dec_tid1_m[1:0] == 1 && `TOP.cpu.spc0.tlu.dec_inst_valid_m[1] == 1 && `SPC0.tcu_core_running[5] && (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0])) begin
        // have inst
        if (pipelineCount5 < 9) begin
          `PR_ERROR ("dbg_chk", `ERROR, "TID 5 had pipelining in DO or SS mode (pipelineCount=%0d)!",pipelineCount5);
          //stall
          @(negedge `TOP.cpu.tcu_ss_mode[0] or negedge `TOP.cpu.tcu_do_mode[0]);
        end
        pipelineCount5 = 0; // reset after each inst
      end
      else
        // no new inst for tid yet
        pipelineCount5 = pipelineCount5+1;

    end // while DO/SS mode
  end // if
end // always



// TID 6 pipelineing check
// watch m stage and make sure that the tid does not have a valid inst
// there more often than every 9 clocks. counter must get to at least 9.
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    pipelineCount6 = 9;
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.tlu.dec_tid1_m[1:0] == 2 && `TOP.cpu.spc0.tlu.dec_inst_valid_m[1] == 1 && `SPC0.tcu_core_running[6] && (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0])) begin
        // have inst
        if (pipelineCount6 < 9) begin
          `PR_ERROR ("dbg_chk", `ERROR, "TID 6 had pipelining in DO or SS mode (pipelineCount=%0d)!",pipelineCount6);
          //stall
          @(negedge `TOP.cpu.tcu_ss_mode[0] or negedge `TOP.cpu.tcu_do_mode[0]);
        end
        pipelineCount6 = 0; // reset after each inst
      end
      else
        // no new inst for tid yet
        pipelineCount6 = pipelineCount6+1;

    end // while DO/SS mode
  end // if
end // always



// TID 7 pipelineing check
// watch m stage and make sure that the tid does not have a valid inst
// there more often than every 9 clocks. counter must get to at least 9.
always @(posedge `TOP.cpu.tcu_ss_mode[0] or posedge `TOP.cpu.tcu_do_mode[0]) begin
  if (enabled) begin
    pipelineCount7 = 9;
    while (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0]) begin
      @(negedge `SPC0.l2clk);
      if (`TOP.cpu.spc0.tlu.dec_tid1_m[1:0] == 3 && `TOP.cpu.spc0.tlu.dec_inst_valid_m[1] == 1 && `SPC0.tcu_core_running[7] && (`TOP.cpu.tcu_ss_mode[0] || `TOP.cpu.tcu_do_mode[0])) begin
        // have inst
        if (pipelineCount7 < 9) begin
          `PR_ERROR ("dbg_chk", `ERROR, "TID 7 had pipelining in DO or SS mode (pipelineCount=%0d)!",pipelineCount7);
          //stall
          @(negedge `TOP.cpu.tcu_ss_mode[0] or negedge `TOP.cpu.tcu_do_mode[0]);
        end
        pipelineCount7 = 0; // reset after each inst
      end
      else
        // no new inst for tid yet
        pipelineCount7 = pipelineCount7+1;

    end // while DO/SS mode
  end // if
end // always


// commit output for each thread group
always @(negedge `SPC0.l2clk) begin

  if (!noCmtCheck && enabled) begin
    if (cmtValid0) cmtCount0 = cmtCount0 + 1;
  
    // should we see non zero this cycle?
    if (cmtValid0 !== `TOP.cpu.spc0.tlu_dbg_instr_cmt_grp0[1:0]) begin
      `PR_ERROR ("dbg_chk", `ERROR, "tlu_dbg_instr_cmt_grp0 not right, (cmtValid0=%0h, tlu_dbg_instr_cmt_grp0=%0h)",cmtValid0,`TOP.cpu.spc0.tlu_dbg_instr_cmt_grp0[1:0]);
      `PR_ALWAYS ("dbg_chk", `ALWAYS, "tlu_dbg_instr_cmt_grp0 not right, IF THE VALUE IS X, SPC IS NOT RESET OR SOME SPC INPUT IS X!");
    end

    // should see non zero next cycle
    if (`TOP.cpu.spc0.tlu.fls0.inst_valid_w && 
        !(`TOP.cpu.spc0.tlu.fls0.flush_ifu[3:0] & 
          `TOP.cpu.spc0.tlu.fls0.tid_dec_w[3:0])) begin
       if (`TOP.cpu.spc0.tlu.fls0.cti_w) cmtValid0 = 1;
       else if (`TOP.cpu.spc0.tlu.fls0.lsu_inst_w) cmtValid0 = 3;
       else cmtValid0 = 2;
    end
    else cmtValid0 = 0;
  end
end

// commit output for each thread group
always @(negedge `SPC0.l2clk) begin

  if (!noCmtCheck && enabled) begin
    if (cmtValid1) cmtCount1 = cmtCount1 + 1;
  
    // should we see non zero this cycle?
    if (cmtValid1 !== `TOP.cpu.spc0.tlu_dbg_instr_cmt_grp1[1:0]) begin
      `PR_ERROR ("dbg_chk", `ERROR, "tlu_dbg_instr_cmt_grp1 not right, (cmtValid1=%0h, tlu_dbg_instr_cmt_grp1=%0h)",cmtValid1,`TOP.cpu.spc0.tlu_dbg_instr_cmt_grp1[1:0]);
      `PR_ALWAYS ("dbg_chk", `ALWAYS, "tlu_dbg_instr_cmt_grp1 not right, IF THE VALUE IS X, SPC IS NOT RESET OR SOME SPC INPUT IS X!");
    end

    // should see non zero next cycle
    if (`TOP.cpu.spc0.tlu.fls1.inst_valid_w && 
        !(`TOP.cpu.spc0.tlu.fls1.flush_ifu[3:0] & 
          `TOP.cpu.spc0.tlu.fls1.tid_dec_w[3:0])) begin
       if (`TOP.cpu.spc0.tlu.fls1.cti_w) cmtValid1 = 1;
       else if (`TOP.cpu.spc0.tlu.fls1.lsu_inst_w) cmtValid1 = 3;
       else cmtValid1 = 2;
    end
    else cmtValid1 = 0;
  end
end


// second count tid 0
always @(negedge `SPC0.l2clk) begin
  if(`TOP.nas_top.c0.t0.complete_fw2[7:0]) cmtCountT0 = cmtCountT0+1;
  if(`TOP.nas_top.c0.t1.complete_fw2[7:0]) cmtCountT1 = cmtCountT1+1;
  if(`TOP.nas_top.c0.t2.complete_fw2[7:0]) cmtCountT2 = cmtCountT2+1;
  if(`TOP.nas_top.c0.t3.complete_fw2[7:0]) cmtCountT3 = cmtCountT3+1;
end

// always @(`TOP.sim_status) begin
//   if (!noCmtCheck && enabled) begin
//     `PR_ALWAYS ("dbg_chk", `ALWAYS, "Final commit count for group 0 is %0d!",cmtCount0);
//     `PR_ALWAYS ("dbg_chk", `ALWAYS, "Final commit count for group 1 is %0d!",cmtCount1);
//     `PR_ALWAYS ("dbg_chk", `ALWAYS, "Final commit count for groups  is %0d!",cmtCount0+cmtCount1);
//     `PR_ALWAYS ("dbg_chk", `ALWAYS, "Final nas pipe complete_fw2 count for T0 is %0d!",cmtCountT0);
//     `PR_ALWAYS ("dbg_chk", `ALWAYS, "Final nas pipe complete_fw2 count for T1 is %0d!",cmtCountT1);
//     `PR_ALWAYS ("dbg_chk", `ALWAYS, "Final nas pipe complete_fw2 count for T2 is %0d!",cmtCountT2);
//     `PR_ALWAYS ("dbg_chk", `ALWAYS, "Final nas pipe complete_fw2 count for T3 is %0d!",cmtCountT3);
//   end
// end


endmodule
