// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2_scrub.v
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
module l2_scrub;

`ifndef GATESIM
`ifndef NOL2RTL
`ifndef AXIS
`ifndef AXIS_TL


reg [31:0] scrub_freq;
integer    indexType;
reg [16*8:0] fcModesTempstr;
reg [8:0] bank_index;
reg [31:0] localSeed;

integer scrub_count0;
integer scrub_count1;
integer scrub_count2;
integer scrub_count3;
integer scrub_count4;
integer scrub_count5;
integer scrub_count6;
integer scrub_count7;

initial begin
  #10;
  while (scrub_freq) begin
  @(scrub_count0 or
     scrub_count1 or
     scrub_count2 or
     scrub_count3 or
     scrub_count4 or
     scrub_count5 or
     scrub_count6 or
     scrub_count7);
    `PR_ALWAYS ("l2_scrub", `ALWAYS,"L2_SCRUB, scrubs done b0-b7 =%d,%d,%d,%d,%d,%d,%d,%d", scrub_count0,scrub_count1,scrub_count2,scrub_count3,scrub_count4,scrub_count5,scrub_count6,scrub_count7);
  end
end


  initial begin
    #10;
    if (scrub_freq) begin
      @(`TOP.sim_status);
      `PR_ALWAYS ("l2_scrub", `ALWAYS,"L2_SCRUB, final scrubs done b0-b7 = %d,%d,%d,%d,%d,%d,%d,%d", scrub_count0,scrub_count1,scrub_count2,scrub_count3,scrub_count4,scrub_count5,scrub_count6,scrub_count7);
    end
  end


  initial begin

    scrub_freq = 0;
    bank_index = 0;
    indexType = 0;
    scrub_count0 = 0;
    scrub_count1 = 0;
    scrub_count2 = 0;
    scrub_count3 = 0;
    scrub_count4 = 0;
    scrub_count5 = 0;
    scrub_count6 = 0;
    scrub_count7 = 0;
    
    // if L2_SCRUB, use default freq. If L2_SCRUB_FREQ, use given freq,
    // else do nothing.
    if ($test$plusargs("L2_SCRUB") || 
        $value$plusargs("L2_SCRUB_FREQ=%d",scrub_freq)) begin
      // default of every 2200 clks. scrubs take about 1800 clocks!
      // don't want > 50% of time spent in scrubs!
      if (scrub_freq == 0) scrub_freq = 2200;
      if (scrub_freq < 1000) begin
        scrub_freq = 1000;
        `PR_ALWAYS ("l2_scrub", `ALWAYS,"L2_SCRUB_FREQ min is 1000");
      end

      `PR_ALWAYS ("l2_scrub", `ALWAYS,"L2_SCRUB_FREQ is set to %d (min=1000)", scrub_freq);

      // index choices:
      // 0) leave alone. do not use -> L2_SCRUB_IDX
      // 1) random idx always picked  +L2_SCRUB_IDX=rand
      // 2) increment from x          +L2_SCRUB_IDX=n
      if ($test$plusargs("L2_SCRUB_IDX")) begin
        if ($value$plusargs("L2_SCRUB_IDX=%s", fcModesTempstr)) begin
          if (fcModesTempstr == "rand" || fcModesTempstr == "random") indexType = 1;
          else if ($value$plusargs("L2_SCRUB_IDX=%h", bank_index)) indexType = 2;
        end
      end

      if (indexType == 0) `PR_ALWAYS ("l2_scrub", `ALWAYS,"L2_SCRUB_IDX will be left alone");
      if (indexType == 1) `PR_ALWAYS ("l2_scrub", `ALWAYS,"L2_SCRUB_IDX will be random");
      if (indexType == 2) `PR_ALWAYS ("l2_scrub", `ALWAYS,"L2_SCRUB_IDX will increment from %h", bank_index);


      // wait...
      #10;

      // get the original seed and use it locally so others
      // are not affected by this "somtimes used" code.
      localSeed = `PARGS.seedin;

      // wait for a thread to be unparked
      @(negedge `TOP.in_reset);

      // wait for any one thread to be out of boot.
      @(`TOP.gOutOfBoot);

      // increase timeouts since scrubbing is slow
      `PARGS.timeout = `PARGS.timeout * 4;
      `PR_ALWAYS ("l2_scrub", `ALWAYS,"L2_SCRUB `PARGS.timeout increased to %d",`PARGS.timeout);
      `PARGS.th_timeout = `PARGS.timeout * 5;
      `PR_ALWAYS ("l2_scrub", `ALWAYS,"L2_SCRUB `PARGS.th_timeout increased to %d",`PARGS.th_timeout);

      repeat (100) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

      fork
        scrubBank0(bank_index);
        scrubBank1(bank_index);
        scrubBank2(bank_index);
        scrubBank3(bank_index);
        scrubBank4(bank_index);
        scrubBank5(bank_index);
        scrubBank6(bank_index);
        scrubBank7(bank_index);
      join
    end // if
  end // initial
  

  // 1) force the counter to a high value for 2 clocks,
  //    force the scrub index to a random value.
  // 2) release the forces.
  // 3) wait for the scrub (posedge csr_filbuf_scrub_ready).
  // 4) wait for scrub to be done (posedge filbuf.fb_tecc_pend_reset)
  // 5) repeat
  task scrubBank0;
    input l2_bank_index;

    reg [8:0] l2_bank_index;
    reg [12:0] rtl_idx;
    reg [11:0] randVal;
    reg [31:0] value;
    
    begin


$strobe("1 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",0,`PARGS.seed,localSeed);


      if (`TOP.cpu.ncu_l2t_pm == 0 || 
          (`TOP.cpu.ncu_l2t_pm == 1 && `TOP.cpu.ncu_l2t_ba01 == 1)) begin
        // initial skew between banks
        repeat ($random(localSeed)%16) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

        if (indexType == 2) begin
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d starting index = %h", 0, l2_bank_index);
          force `TOP.cpu.l2t0.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
          force `TOP.cpu.l2t0.arbadr.arb_data_ecc_idx_en = 1;
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          release `TOP.cpu.l2t0.arbadr.arbadr_data_ecc_idx_plus1;
          release `TOP.cpu.l2t0.arbadr.arb_data_ecc_idx_en;
        end

        while (1) begin

$strobe("2 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",0,`PARGS.seed,localSeed);

          // set counter to be valueIn clocks away from matching
          // {csr_l2_control_reg[14:3], 20'b0}.
          // Pick csr_l2_control_reg[14:3] at random then subtract
          // valueIn. Force this new value into the scrub_counter so
          // it will count up naturally and then match.
          randVal = $random(localSeed);
          if (randVal == 12'hfff) randVal = 12'hffe;
          if (randVal == 0) randVal = 1;
          value = {randVal,20'h0} - scrub_freq;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d scrub_counter = %d", 0,value);
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d csr_l2_control_reg[14:3] = %d", 0, randVal);
          force `TOP.cpu.l2t0.csr.scrub_counter = value;
          force `TOP.cpu.l2t0.csr.csr_l2_control_reg[14:3] = randVal;
          force `TOP.cpu.l2t0.csr.csr_l2_control_reg[2] = 1;

          if (indexType == 1) begin
            l2_bank_index = $random(localSeed);
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d index = %h", 0, l2_bank_index);
            // force `TOP.cpu.l2t0.csr.arbadr_data_ecc_idx = l2_bank_index;
            force `TOP.cpu.l2t0.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
            force `TOP.cpu.l2t0.arbadr.arb_data_ecc_idx_en = 1;
          end

          else begin
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB RTL bank %d index = %h", 0, `TOP.cpu.l2t0.csr.arbadr_data_ecc_idx);
          end

          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

          // 2 release the forces.
          release `TOP.cpu.l2t0.csr.scrub_counter;
          release `TOP.cpu.l2t0.csr.csr_l2_control_reg[14:3];
          // if (indexType == 1) release `TOP.cpu.l2t0.csr.arbadr_data_ecc_idx;
          if (indexType == 1) release `TOP.cpu.l2t0.arbadr.arbadr_data_ecc_idx_plus1;
          if (indexType == 1) release `TOP.cpu.l2t0.arbadr.arb_data_ecc_idx_en;

          // 3 wait for the scrub to be signaled (posedge csr_filbuf_scrub_ready).
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on csr_filbuf_scrub_ready (scrub counter matching)", 0);
          @(posedge `TOP.cpu.l2t0.csr.csr_filbuf_scrub_ready);
          rtl_idx = `TOP.cpu.l2t0.csr.scrub_addr;

          // 3 wait for scrub to start
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en assert (wait for scrub to start)", 0);                               
          @(posedge `TOP.cpu.l2t0.tagctl.scrub_fsm_en);

          // 4 wait for scrub to be done (all ways)
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en de-assert(scrub has started, wait for finish)", 0);                              
          @(negedge `TOP.cpu.l2t0.tagctl.scrub_fsm_en);
          scrub_count0 = scrub_count0+1;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d scrub has finished (count=%d)", 0,scrub_count0);

          // check index incrementing
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          if (rtl_idx == `TOP.cpu.l2t0.csr.scrub_addr)
            `PR_ERROR ("l2_scrub", `ERROR, "ERROR: bank 0 RTL did not increment the scrub index!");

        end // 5 while 1
      end
    end
  endtask


  // 1) force the counter to a high value for 2 clocks,
  //    force the scrub index to a random value.
  // 2) release the forces.
  // 3) wait for the scrub (posedge csr_filbuf_scrub_ready).
  // 4) wait for scrub to be done (posedge filbuf.fb_tecc_pend_reset)
  // 5) repeat
  task scrubBank1;
    input l2_bank_index;

    reg [8:0] l2_bank_index;
    reg [12:0] rtl_idx;
    reg [11:0] randVal;
    reg [31:0] value;
    
    begin


$strobe("1 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",1,`PARGS.seed,localSeed);


      if (`TOP.cpu.ncu_l2t_pm == 0 || 
          (`TOP.cpu.ncu_l2t_pm == 1 && `TOP.cpu.ncu_l2t_ba01 == 1)) begin
        // initial skew between banks
        repeat ($random(localSeed)%16) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

        if (indexType == 2) begin
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d starting index = %h", 1, l2_bank_index);
          force `TOP.cpu.l2t1.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
          force `TOP.cpu.l2t1.arbadr.arb_data_ecc_idx_en = 1;
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          release `TOP.cpu.l2t1.arbadr.arbadr_data_ecc_idx_plus1;
          release `TOP.cpu.l2t1.arbadr.arb_data_ecc_idx_en;
        end

        while (1) begin

$strobe("2 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",1,`PARGS.seed,localSeed);

          // set counter to be valueIn clocks away from matching
          // {csr_l2_control_reg[14:3], 20'b0}.
          // Pick csr_l2_control_reg[14:3] at random then subtract
          // valueIn. Force this new value into the scrub_counter so
          // it will count up naturally and then match.
          randVal = $random(localSeed);
          if (randVal == 12'hfff) randVal = 12'hffe;
          if (randVal == 0) randVal = 1;
          value = {randVal,20'h0} - scrub_freq;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d scrub_counter = %d", 1,value);
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d csr_l2_control_reg[14:3] = %d", 1, randVal);
          force `TOP.cpu.l2t1.csr.scrub_counter = value;
          force `TOP.cpu.l2t1.csr.csr_l2_control_reg[14:3] = randVal;
          force `TOP.cpu.l2t1.csr.csr_l2_control_reg[2] = 1;

          if (indexType == 1) begin
            l2_bank_index = $random(localSeed);
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d index = %h", 1, l2_bank_index);
            // force `TOP.cpu.l2t1.csr.arbadr_data_ecc_idx = l2_bank_index;
            force `TOP.cpu.l2t1.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
            force `TOP.cpu.l2t1.arbadr.arb_data_ecc_idx_en = 1;
          end

          else begin
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB RTL bank %d index = %h", 1, `TOP.cpu.l2t1.csr.arbadr_data_ecc_idx);
          end

          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

          // 2 release the forces.
          release `TOP.cpu.l2t1.csr.scrub_counter;
          release `TOP.cpu.l2t1.csr.csr_l2_control_reg[14:3];
          // if (indexType == 1) release `TOP.cpu.l2t1.csr.arbadr_data_ecc_idx;
          if (indexType == 1) release `TOP.cpu.l2t1.arbadr.arbadr_data_ecc_idx_plus1;
          if (indexType == 1) release `TOP.cpu.l2t1.arbadr.arb_data_ecc_idx_en;

          // 3 wait for the scrub to be signaled (posedge csr_filbuf_scrub_ready).
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on csr_filbuf_scrub_ready (scrub counter matching)", 1);
          @(posedge `TOP.cpu.l2t1.csr.csr_filbuf_scrub_ready);
          rtl_idx = `TOP.cpu.l2t1.csr.scrub_addr;

          // 3 wait for scrub to start
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en assert (wait for scrub to start)", 1);                               
          @(posedge `TOP.cpu.l2t1.tagctl.scrub_fsm_en);

          // 4 wait for scrub to be done (all ways)
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en de-assert(scrub has started, wait for finish)", 1);                              
          @(negedge `TOP.cpu.l2t1.tagctl.scrub_fsm_en);
          scrub_count1 = scrub_count1+1;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d scrub has finished (count=%d)", 1,scrub_count1);

          // check index incrementing
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          if (rtl_idx == `TOP.cpu.l2t1.csr.scrub_addr)
            `PR_ERROR ("l2_scrub", `ERROR, "ERROR: bank 1 RTL did not increment the scrub index!");

        end // 5 while 1
      end
    end
  endtask


  // 1) force the counter to a high value for 2 clocks,
  //    force the scrub index to a random value.
  // 2) release the forces.
  // 3) wait for the scrub (posedge csr_filbuf_scrub_ready).
  // 4) wait for scrub to be done (posedge filbuf.fb_tecc_pend_reset)
  // 5) repeat
  task scrubBank2;
    input l2_bank_index;

    reg [8:0] l2_bank_index;
    reg [12:0] rtl_idx;
    reg [11:0] randVal;
    reg [31:0] value;
    
    begin


$strobe("1 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",2,`PARGS.seed,localSeed);


      if (`TOP.cpu.ncu_l2t_pm == 0 || 
          (`TOP.cpu.ncu_l2t_pm == 1 && `TOP.cpu.ncu_l2t_ba23 == 1)) begin
        // initial skew between banks
        repeat ($random(localSeed)%16) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

        if (indexType == 2) begin
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d starting index = %h", 2, l2_bank_index);
          force `TOP.cpu.l2t2.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
          force `TOP.cpu.l2t2.arbadr.arb_data_ecc_idx_en = 1;
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          release `TOP.cpu.l2t2.arbadr.arbadr_data_ecc_idx_plus1;
          release `TOP.cpu.l2t2.arbadr.arb_data_ecc_idx_en;
        end

        while (1) begin

$strobe("2 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",2,`PARGS.seed,localSeed);

          // set counter to be valueIn clocks away from matching
          // {csr_l2_control_reg[14:3], 20'b0}.
          // Pick csr_l2_control_reg[14:3] at random then subtract
          // valueIn. Force this new value into the scrub_counter so
          // it will count up naturally and then match.
          randVal = $random(localSeed);
          if (randVal == 12'hfff) randVal = 12'hffe;
          if (randVal == 0) randVal = 1;
          value = {randVal,20'h0} - scrub_freq;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d scrub_counter = %d", 2,value);
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d csr_l2_control_reg[14:3] = %d", 2, randVal);
          force `TOP.cpu.l2t2.csr.scrub_counter = value;
          force `TOP.cpu.l2t2.csr.csr_l2_control_reg[14:3] = randVal;
          force `TOP.cpu.l2t2.csr.csr_l2_control_reg[2] = 1;

          if (indexType == 1) begin
            l2_bank_index = $random(localSeed);
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d index = %h", 2, l2_bank_index);
            // force `TOP.cpu.l2t2.csr.arbadr_data_ecc_idx = l2_bank_index;
            force `TOP.cpu.l2t2.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
            force `TOP.cpu.l2t2.arbadr.arb_data_ecc_idx_en = 1;
          end

          else begin
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB RTL bank %d index = %h", 2, `TOP.cpu.l2t2.csr.arbadr_data_ecc_idx);
          end

          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

          // 2 release the forces.
          release `TOP.cpu.l2t2.csr.scrub_counter;
          release `TOP.cpu.l2t2.csr.csr_l2_control_reg[14:3];
          // if (indexType == 1) release `TOP.cpu.l2t2.csr.arbadr_data_ecc_idx;
          if (indexType == 1) release `TOP.cpu.l2t2.arbadr.arbadr_data_ecc_idx_plus1;
          if (indexType == 1) release `TOP.cpu.l2t2.arbadr.arb_data_ecc_idx_en;

          // 3 wait for the scrub to be signaled (posedge csr_filbuf_scrub_ready).
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on csr_filbuf_scrub_ready (scrub counter matching)", 2);
          @(posedge `TOP.cpu.l2t2.csr.csr_filbuf_scrub_ready);
          rtl_idx = `TOP.cpu.l2t2.csr.scrub_addr;

          // 3 wait for scrub to start
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en assert (wait for scrub to start)", 2);                               
          @(posedge `TOP.cpu.l2t2.tagctl.scrub_fsm_en);

          // 4 wait for scrub to be done (all ways)
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en de-assert(scrub has started, wait for finish)", 2);                              
          @(negedge `TOP.cpu.l2t2.tagctl.scrub_fsm_en);
          scrub_count2 = scrub_count2+1;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d scrub has finished (count=%d)", 2,scrub_count2);

          // check index incrementing
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          if (rtl_idx == `TOP.cpu.l2t2.csr.scrub_addr)
            `PR_ERROR ("l2_scrub", `ERROR, "ERROR: bank 2 RTL did not increment the scrub index!");

        end // 5 while 1
      end
    end
  endtask


  // 1) force the counter to a high value for 2 clocks,
  //    force the scrub index to a random value.
  // 2) release the forces.
  // 3) wait for the scrub (posedge csr_filbuf_scrub_ready).
  // 4) wait for scrub to be done (posedge filbuf.fb_tecc_pend_reset)
  // 5) repeat
  task scrubBank3;
    input l2_bank_index;

    reg [8:0] l2_bank_index;
    reg [12:0] rtl_idx;
    reg [11:0] randVal;
    reg [31:0] value;
    
    begin


$strobe("1 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",3,`PARGS.seed,localSeed);


      if (`TOP.cpu.ncu_l2t_pm == 0 || 
          (`TOP.cpu.ncu_l2t_pm == 1 && `TOP.cpu.ncu_l2t_ba23 == 1)) begin
        // initial skew between banks
        repeat ($random(localSeed)%16) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

        if (indexType == 2) begin
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d starting index = %h", 3, l2_bank_index);
          force `TOP.cpu.l2t3.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
          force `TOP.cpu.l2t3.arbadr.arb_data_ecc_idx_en = 1;
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          release `TOP.cpu.l2t3.arbadr.arbadr_data_ecc_idx_plus1;
          release `TOP.cpu.l2t3.arbadr.arb_data_ecc_idx_en;
        end

        while (1) begin

$strobe("2 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",3,`PARGS.seed,localSeed);

          // set counter to be valueIn clocks away from matching
          // {csr_l2_control_reg[14:3], 20'b0}.
          // Pick csr_l2_control_reg[14:3] at random then subtract
          // valueIn. Force this new value into the scrub_counter so
          // it will count up naturally and then match.
          randVal = $random(localSeed);
          if (randVal == 12'hfff) randVal = 12'hffe;
          if (randVal == 0) randVal = 1;
          value = {randVal,20'h0} - scrub_freq;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d scrub_counter = %d", 3,value);
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d csr_l2_control_reg[14:3] = %d", 3, randVal);
          force `TOP.cpu.l2t3.csr.scrub_counter = value;
          force `TOP.cpu.l2t3.csr.csr_l2_control_reg[14:3] = randVal;
          force `TOP.cpu.l2t3.csr.csr_l2_control_reg[2] = 1;

          if (indexType == 1) begin
            l2_bank_index = $random(localSeed);
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d index = %h", 3, l2_bank_index);
            // force `TOP.cpu.l2t3.csr.arbadr_data_ecc_idx = l2_bank_index;
            force `TOP.cpu.l2t3.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
            force `TOP.cpu.l2t3.arbadr.arb_data_ecc_idx_en = 1;
          end

          else begin
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB RTL bank %d index = %h", 3, `TOP.cpu.l2t3.csr.arbadr_data_ecc_idx);
          end

          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

          // 2 release the forces.
          release `TOP.cpu.l2t3.csr.scrub_counter;
          release `TOP.cpu.l2t3.csr.csr_l2_control_reg[14:3];
          // if (indexType == 1) release `TOP.cpu.l2t3.csr.arbadr_data_ecc_idx;
          if (indexType == 1) release `TOP.cpu.l2t3.arbadr.arbadr_data_ecc_idx_plus1;
          if (indexType == 1) release `TOP.cpu.l2t3.arbadr.arb_data_ecc_idx_en;

          // 3 wait for the scrub to be signaled (posedge csr_filbuf_scrub_ready).
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on csr_filbuf_scrub_ready (scrub counter matching)", 3);
          @(posedge `TOP.cpu.l2t3.csr.csr_filbuf_scrub_ready);
          rtl_idx = `TOP.cpu.l2t3.csr.scrub_addr;

          // 3 wait for scrub to start
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en assert (wait for scrub to start)", 3);                               
          @(posedge `TOP.cpu.l2t3.tagctl.scrub_fsm_en);

          // 4 wait for scrub to be done (all ways)
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en de-assert(scrub has started, wait for finish)", 3);                              
          @(negedge `TOP.cpu.l2t3.tagctl.scrub_fsm_en);
          scrub_count3 = scrub_count3+1;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d scrub has finished (count=%d)", 3,scrub_count3);

          // check index incrementing
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          if (rtl_idx == `TOP.cpu.l2t3.csr.scrub_addr)
            `PR_ERROR ("l2_scrub", `ERROR, "ERROR: bank 3 RTL did not increment the scrub index!");

        end // 5 while 1
      end
    end
  endtask


  // 1) force the counter to a high value for 2 clocks,
  //    force the scrub index to a random value.
  // 2) release the forces.
  // 3) wait for the scrub (posedge csr_filbuf_scrub_ready).
  // 4) wait for scrub to be done (posedge filbuf.fb_tecc_pend_reset)
  // 5) repeat
  task scrubBank4;
    input l2_bank_index;

    reg [8:0] l2_bank_index;
    reg [12:0] rtl_idx;
    reg [11:0] randVal;
    reg [31:0] value;
    
    begin


$strobe("1 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",4,`PARGS.seed,localSeed);


      if (`TOP.cpu.ncu_l2t_pm == 0 || 
          (`TOP.cpu.ncu_l2t_pm == 1 && `TOP.cpu.ncu_l2t_ba45 == 1)) begin
        // initial skew between banks
        repeat ($random(localSeed)%16) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

        if (indexType == 2) begin
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d starting index = %h", 4, l2_bank_index);
          force `TOP.cpu.l2t4.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
          force `TOP.cpu.l2t4.arbadr.arb_data_ecc_idx_en = 1;
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          release `TOP.cpu.l2t4.arbadr.arbadr_data_ecc_idx_plus1;
          release `TOP.cpu.l2t4.arbadr.arb_data_ecc_idx_en;
        end

        while (1) begin

$strobe("2 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",4,`PARGS.seed,localSeed);

          // set counter to be valueIn clocks away from matching
          // {csr_l2_control_reg[14:3], 20'b0}.
          // Pick csr_l2_control_reg[14:3] at random then subtract
          // valueIn. Force this new value into the scrub_counter so
          // it will count up naturally and then match.
          randVal = $random(localSeed);
          if (randVal == 12'hfff) randVal = 12'hffe;
          if (randVal == 0) randVal = 1;
          value = {randVal,20'h0} - scrub_freq;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d scrub_counter = %d", 4,value);
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d csr_l2_control_reg[14:3] = %d", 4, randVal);
          force `TOP.cpu.l2t4.csr.scrub_counter = value;
          force `TOP.cpu.l2t4.csr.csr_l2_control_reg[14:3] = randVal;
          force `TOP.cpu.l2t4.csr.csr_l2_control_reg[2] = 1;

          if (indexType == 1) begin
            l2_bank_index = $random(localSeed);
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d index = %h", 4, l2_bank_index);
            // force `TOP.cpu.l2t4.csr.arbadr_data_ecc_idx = l2_bank_index;
            force `TOP.cpu.l2t4.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
            force `TOP.cpu.l2t4.arbadr.arb_data_ecc_idx_en = 1;
          end

          else begin
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB RTL bank %d index = %h", 4, `TOP.cpu.l2t4.csr.arbadr_data_ecc_idx);
          end

          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

          // 2 release the forces.
          release `TOP.cpu.l2t4.csr.scrub_counter;
          release `TOP.cpu.l2t4.csr.csr_l2_control_reg[14:3];
          // if (indexType == 1) release `TOP.cpu.l2t4.csr.arbadr_data_ecc_idx;
          if (indexType == 1) release `TOP.cpu.l2t4.arbadr.arbadr_data_ecc_idx_plus1;
          if (indexType == 1) release `TOP.cpu.l2t4.arbadr.arb_data_ecc_idx_en;

          // 3 wait for the scrub to be signaled (posedge csr_filbuf_scrub_ready).
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on csr_filbuf_scrub_ready (scrub counter matching)", 4);
          @(posedge `TOP.cpu.l2t4.csr.csr_filbuf_scrub_ready);
          rtl_idx = `TOP.cpu.l2t4.csr.scrub_addr;

          // 3 wait for scrub to start
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en assert (wait for scrub to start)", 4);                               
          @(posedge `TOP.cpu.l2t4.tagctl.scrub_fsm_en);

          // 4 wait for scrub to be done (all ways)
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en de-assert(scrub has started, wait for finish)", 4);                              
          @(negedge `TOP.cpu.l2t4.tagctl.scrub_fsm_en);
          scrub_count4 = scrub_count4+1;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d scrub has finished (count=%d)", 4,scrub_count4);

          // check index incrementing
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          if (rtl_idx == `TOP.cpu.l2t4.csr.scrub_addr)
            `PR_ERROR ("l2_scrub", `ERROR, "ERROR: bank 4 RTL did not increment the scrub index!");

        end // 5 while 1
      end
    end
  endtask


  // 1) force the counter to a high value for 2 clocks,
  //    force the scrub index to a random value.
  // 2) release the forces.
  // 3) wait for the scrub (posedge csr_filbuf_scrub_ready).
  // 4) wait for scrub to be done (posedge filbuf.fb_tecc_pend_reset)
  // 5) repeat
  task scrubBank5;
    input l2_bank_index;

    reg [8:0] l2_bank_index;
    reg [12:0] rtl_idx;
    reg [11:0] randVal;
    reg [31:0] value;
    
    begin


$strobe("1 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",5,`PARGS.seed,localSeed);


      if (`TOP.cpu.ncu_l2t_pm == 0 || 
          (`TOP.cpu.ncu_l2t_pm == 1 && `TOP.cpu.ncu_l2t_ba45 == 1)) begin
        // initial skew between banks
        repeat ($random(localSeed)%16) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

        if (indexType == 2) begin
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d starting index = %h", 5, l2_bank_index);
          force `TOP.cpu.l2t5.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
          force `TOP.cpu.l2t5.arbadr.arb_data_ecc_idx_en = 1;
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          release `TOP.cpu.l2t5.arbadr.arbadr_data_ecc_idx_plus1;
          release `TOP.cpu.l2t5.arbadr.arb_data_ecc_idx_en;
        end

        while (1) begin

$strobe("2 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",5,`PARGS.seed,localSeed);

          // set counter to be valueIn clocks away from matching
          // {csr_l2_control_reg[14:3], 20'b0}.
          // Pick csr_l2_control_reg[14:3] at random then subtract
          // valueIn. Force this new value into the scrub_counter so
          // it will count up naturally and then match.
          randVal = $random(localSeed);
          if (randVal == 12'hfff) randVal = 12'hffe;
          if (randVal == 0) randVal = 1;
          value = {randVal,20'h0} - scrub_freq;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d scrub_counter = %d", 5,value);
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d csr_l2_control_reg[14:3] = %d", 5, randVal);
          force `TOP.cpu.l2t5.csr.scrub_counter = value;
          force `TOP.cpu.l2t5.csr.csr_l2_control_reg[14:3] = randVal;
          force `TOP.cpu.l2t5.csr.csr_l2_control_reg[2] = 1;

          if (indexType == 1) begin
            l2_bank_index = $random(localSeed);
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d index = %h", 5, l2_bank_index);
            // force `TOP.cpu.l2t5.csr.arbadr_data_ecc_idx = l2_bank_index;
            force `TOP.cpu.l2t5.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
            force `TOP.cpu.l2t5.arbadr.arb_data_ecc_idx_en = 1;
          end

          else begin
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB RTL bank %d index = %h", 5, `TOP.cpu.l2t5.csr.arbadr_data_ecc_idx);
          end

          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

          // 2 release the forces.
          release `TOP.cpu.l2t5.csr.scrub_counter;
          release `TOP.cpu.l2t5.csr.csr_l2_control_reg[14:3];
          // if (indexType == 1) release `TOP.cpu.l2t5.csr.arbadr_data_ecc_idx;
          if (indexType == 1) release `TOP.cpu.l2t5.arbadr.arbadr_data_ecc_idx_plus1;
          if (indexType == 1) release `TOP.cpu.l2t5.arbadr.arb_data_ecc_idx_en;

          // 3 wait for the scrub to be signaled (posedge csr_filbuf_scrub_ready).
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on csr_filbuf_scrub_ready (scrub counter matching)", 5);
          @(posedge `TOP.cpu.l2t5.csr.csr_filbuf_scrub_ready);
          rtl_idx = `TOP.cpu.l2t5.csr.scrub_addr;

          // 3 wait for scrub to start
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en assert (wait for scrub to start)", 5);                               
          @(posedge `TOP.cpu.l2t5.tagctl.scrub_fsm_en);

          // 4 wait for scrub to be done (all ways)
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en de-assert(scrub has started, wait for finish)", 5);                              
          @(negedge `TOP.cpu.l2t5.tagctl.scrub_fsm_en);
          scrub_count5 = scrub_count5+1;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d scrub has finished (count=%d)", 5,scrub_count5);

          // check index incrementing
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          if (rtl_idx == `TOP.cpu.l2t5.csr.scrub_addr)
            `PR_ERROR ("l2_scrub", `ERROR, "ERROR: bank 5 RTL did not increment the scrub index!");

        end // 5 while 1
      end
    end
  endtask


  // 1) force the counter to a high value for 2 clocks,
  //    force the scrub index to a random value.
  // 2) release the forces.
  // 3) wait for the scrub (posedge csr_filbuf_scrub_ready).
  // 4) wait for scrub to be done (posedge filbuf.fb_tecc_pend_reset)
  // 5) repeat
  task scrubBank6;
    input l2_bank_index;

    reg [8:0] l2_bank_index;
    reg [12:0] rtl_idx;
    reg [11:0] randVal;
    reg [31:0] value;
    
    begin


$strobe("1 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",6,`PARGS.seed,localSeed);


      if (`TOP.cpu.ncu_l2t_pm == 0 || 
          (`TOP.cpu.ncu_l2t_pm == 1 && `TOP.cpu.ncu_l2t_ba67 == 1)) begin
        // initial skew between banks
        repeat ($random(localSeed)%16) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

        if (indexType == 2) begin
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d starting index = %h", 6, l2_bank_index);
          force `TOP.cpu.l2t6.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
          force `TOP.cpu.l2t6.arbadr.arb_data_ecc_idx_en = 1;
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          release `TOP.cpu.l2t6.arbadr.arbadr_data_ecc_idx_plus1;
          release `TOP.cpu.l2t6.arbadr.arb_data_ecc_idx_en;
        end

        while (1) begin

$strobe("2 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",6,`PARGS.seed,localSeed);

          // set counter to be valueIn clocks away from matching
          // {csr_l2_control_reg[14:3], 20'b0}.
          // Pick csr_l2_control_reg[14:3] at random then subtract
          // valueIn. Force this new value into the scrub_counter so
          // it will count up naturally and then match.
          randVal = $random(localSeed);
          if (randVal == 12'hfff) randVal = 12'hffe;
          if (randVal == 0) randVal = 1;
          value = {randVal,20'h0} - scrub_freq;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d scrub_counter = %d", 6,value);
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d csr_l2_control_reg[14:3] = %d", 6, randVal);
          force `TOP.cpu.l2t6.csr.scrub_counter = value;
          force `TOP.cpu.l2t6.csr.csr_l2_control_reg[14:3] = randVal;
          force `TOP.cpu.l2t6.csr.csr_l2_control_reg[2] = 1;

          if (indexType == 1) begin
            l2_bank_index = $random(localSeed);
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d index = %h", 6, l2_bank_index);
            // force `TOP.cpu.l2t6.csr.arbadr_data_ecc_idx = l2_bank_index;
            force `TOP.cpu.l2t6.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
            force `TOP.cpu.l2t6.arbadr.arb_data_ecc_idx_en = 1;
          end

          else begin
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB RTL bank %d index = %h", 6, `TOP.cpu.l2t6.csr.arbadr_data_ecc_idx);
          end

          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

          // 2 release the forces.
          release `TOP.cpu.l2t6.csr.scrub_counter;
          release `TOP.cpu.l2t6.csr.csr_l2_control_reg[14:3];
          // if (indexType == 1) release `TOP.cpu.l2t6.csr.arbadr_data_ecc_idx;
          if (indexType == 1) release `TOP.cpu.l2t6.arbadr.arbadr_data_ecc_idx_plus1;
          if (indexType == 1) release `TOP.cpu.l2t6.arbadr.arb_data_ecc_idx_en;

          // 3 wait for the scrub to be signaled (posedge csr_filbuf_scrub_ready).
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on csr_filbuf_scrub_ready (scrub counter matching)", 6);
          @(posedge `TOP.cpu.l2t6.csr.csr_filbuf_scrub_ready);
          rtl_idx = `TOP.cpu.l2t6.csr.scrub_addr;

          // 3 wait for scrub to start
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en assert (wait for scrub to start)", 6);                               
          @(posedge `TOP.cpu.l2t6.tagctl.scrub_fsm_en);

          // 4 wait for scrub to be done (all ways)
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en de-assert(scrub has started, wait for finish)", 6);                              
          @(negedge `TOP.cpu.l2t6.tagctl.scrub_fsm_en);
          scrub_count6 = scrub_count6+1;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d scrub has finished (count=%d)", 6,scrub_count6);

          // check index incrementing
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          if (rtl_idx == `TOP.cpu.l2t6.csr.scrub_addr)
            `PR_ERROR ("l2_scrub", `ERROR, "ERROR: bank 6 RTL did not increment the scrub index!");

        end // 5 while 1
      end
    end
  endtask


  // 1) force the counter to a high value for 2 clocks,
  //    force the scrub index to a random value.
  // 2) release the forces.
  // 3) wait for the scrub (posedge csr_filbuf_scrub_ready).
  // 4) wait for scrub to be done (posedge filbuf.fb_tecc_pend_reset)
  // 5) repeat
  task scrubBank7;
    input l2_bank_index;

    reg [8:0] l2_bank_index;
    reg [12:0] rtl_idx;
    reg [11:0] randVal;
    reg [31:0] value;
    
    begin


$strobe("1 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",7,`PARGS.seed,localSeed);


      if (`TOP.cpu.ncu_l2t_pm == 0 || 
          (`TOP.cpu.ncu_l2t_pm == 1 && `TOP.cpu.ncu_l2t_ba67 == 1)) begin
        // initial skew between banks
        repeat ($random(localSeed)%16) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

        if (indexType == 2) begin
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d starting index = %h", 7, l2_bank_index);
          force `TOP.cpu.l2t7.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
          force `TOP.cpu.l2t7.arbadr.arb_data_ecc_idx_en = 1;
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          release `TOP.cpu.l2t7.arbadr.arbadr_data_ecc_idx_plus1;
          release `TOP.cpu.l2t7.arbadr.arb_data_ecc_idx_en;
        end

        while (1) begin

$strobe("2 bank %0d PARGS.seed=%d, l2_scrub.localSeed=%d",7,`PARGS.seed,localSeed);

          // set counter to be valueIn clocks away from matching
          // {csr_l2_control_reg[14:3], 20'b0}.
          // Pick csr_l2_control_reg[14:3] at random then subtract
          // valueIn. Force this new value into the scrub_counter so
          // it will count up naturally and then match.
          randVal = $random(localSeed);
          if (randVal == 12'hfff) randVal = 12'hffe;
          if (randVal == 0) randVal = 1;
          value = {randVal,20'h0} - scrub_freq;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d scrub_counter = %d", 7,value);
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB seting bank %d csr_l2_control_reg[14:3] = %d", 7, randVal);
          force `TOP.cpu.l2t7.csr.scrub_counter = value;
          force `TOP.cpu.l2t7.csr.csr_l2_control_reg[14:3] = randVal;
          force `TOP.cpu.l2t7.csr.csr_l2_control_reg[2] = 1;

          if (indexType == 1) begin
            l2_bank_index = $random(localSeed);
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB set bank %d index = %h", 7, l2_bank_index);
            // force `TOP.cpu.l2t7.csr.arbadr_data_ecc_idx = l2_bank_index;
            force `TOP.cpu.l2t7.arbadr.arbadr_data_ecc_idx_plus1 = l2_bank_index;
            force `TOP.cpu.l2t7.arbadr.arb_data_ecc_idx_en = 1;
          end

          else begin
            `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB RTL bank %d index = %h", 7, `TOP.cpu.l2t7.csr.arbadr_data_ecc_idx);
          end

          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);

          // 2 release the forces.
          release `TOP.cpu.l2t7.csr.scrub_counter;
          release `TOP.cpu.l2t7.csr.csr_l2_control_reg[14:3];
          // if (indexType == 1) release `TOP.cpu.l2t7.csr.arbadr_data_ecc_idx;
          if (indexType == 1) release `TOP.cpu.l2t7.arbadr.arbadr_data_ecc_idx_plus1;
          if (indexType == 1) release `TOP.cpu.l2t7.arbadr.arb_data_ecc_idx_en;

          // 3 wait for the scrub to be signaled (posedge csr_filbuf_scrub_ready).
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on csr_filbuf_scrub_ready (scrub counter matching)", 7);
          @(posedge `TOP.cpu.l2t7.csr.csr_filbuf_scrub_ready);
          rtl_idx = `TOP.cpu.l2t7.csr.scrub_addr;

          // 3 wait for scrub to start
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en assert (wait for scrub to start)", 7);                               
          @(posedge `TOP.cpu.l2t7.tagctl.scrub_fsm_en);

          // 4 wait for scrub to be done (all ways)
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d waiting on scrub_fsm_en de-assert(scrub has started, wait for finish)", 7);                              
          @(negedge `TOP.cpu.l2t7.tagctl.scrub_fsm_en);
          scrub_count7 = scrub_count7+1;
          `PR_NORMAL ("l2_scrub", `NORMAL,"L2_SCRUB bank %d scrub has finished (count=%d)", 7,scrub_count7);

          // check index incrementing
          repeat (2) @(posedge `TOP.cpu.cmp_gclk_c3_l2t0);
          if (rtl_idx == `TOP.cpu.l2t7.csr.scrub_addr)
            `PR_ERROR ("l2_scrub", `ERROR, "ERROR: bank 7 RTL did not increment the scrub index!");

        end // 5 while 1
      end
    end
  endtask


`endif

`endif


`endif

`endif

endmodule
