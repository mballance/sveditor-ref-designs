// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_dft_tasks.v
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
task force_pkg_pin_TRIGIN;
  input is_forcing;  // 0: release; otherwise, forcing
  input value;
  begin
    release `CPU.TRIGIN;
    if (is_forcing)
      force `CPU.TRIGIN = value;
  end
endtask

//==============================================================
// WHAT: force/release cpu.tcu.tcu_*_clk_stop
//==============================================================
task force_tcu_clk_stop_at_tcu;
  input       is_forcing;     // 0: release; otherwise, force
  input       value;          // value for forcing (all signals)
  begin
    release `CPU.tcu.tcu_ccu_clk_stop;
    release `CPU.tcu.tcu_ccu_io_clk_stop;
    release `CPU.tcu.tcu_ccx_clk_stop;
    release `CPU.tcu.tcu_db0_clk_stop;
    release `CPU.tcu.tcu_db1_clk_stop;
    release `CPU.tcu.tcu_dmu_io_clk_stop;
    release `CPU.tcu.tcu_efu_clk_stop;
    release `CPU.tcu.tcu_efu_io_clk_stop;
    release `CPU.tcu.tcu_l2b0_clk_stop;
    release `CPU.tcu.tcu_l2b1_clk_stop;
    release `CPU.tcu.tcu_l2b2_clk_stop;
    release `CPU.tcu.tcu_l2b3_clk_stop;
    release `CPU.tcu.tcu_l2b4_clk_stop;
    release `CPU.tcu.tcu_l2b5_clk_stop;
    release `CPU.tcu.tcu_l2b6_clk_stop;
    release `CPU.tcu.tcu_l2b7_clk_stop;
    release `CPU.tcu.tcu_l2d0_clk_stop;
    release `CPU.tcu.tcu_l2d1_clk_stop;
    release `CPU.tcu.tcu_l2d2_clk_stop;
    release `CPU.tcu.tcu_l2d3_clk_stop;
    release `CPU.tcu.tcu_l2d4_clk_stop;
    release `CPU.tcu.tcu_l2d5_clk_stop;
    release `CPU.tcu.tcu_l2d6_clk_stop;
    release `CPU.tcu.tcu_l2d7_clk_stop;
    release `CPU.tcu.tcu_l2t0_clk_stop;
    release `CPU.tcu.tcu_l2t0_shscan_clk_stop;
    release `CPU.tcu.tcu_l2t1_clk_stop;
    release `CPU.tcu.tcu_l2t1_shscan_clk_stop;
    release `CPU.tcu.tcu_l2t2_clk_stop;
    release `CPU.tcu.tcu_l2t2_shscan_clk_stop;
    release `CPU.tcu.tcu_l2t3_clk_stop;
    release `CPU.tcu.tcu_l2t3_shscan_clk_stop;
    release `CPU.tcu.tcu_l2t4_clk_stop;
    release `CPU.tcu.tcu_l2t4_shscan_clk_stop;
    release `CPU.tcu.tcu_l2t5_clk_stop;
    release `CPU.tcu.tcu_l2t5_shscan_clk_stop;
    release `CPU.tcu.tcu_l2t6_clk_stop;
    release `CPU.tcu.tcu_l2t6_shscan_clk_stop;
    release `CPU.tcu.tcu_l2t7_clk_stop;
    release `CPU.tcu.tcu_l2t7_shscan_clk_stop;
    release `CPU.tcu.tcu_mac_io_clk_stop;
    release `CPU.tcu.tcu_mcu0_clk_stop;
    release `CPU.tcu.tcu_mcu0_dr_clk_stop;
    release `CPU.tcu.tcu_mcu0_fbd_clk_stop;
    release `CPU.tcu.tcu_mcu0_io_clk_stop;
    release `CPU.tcu.tcu_mcu1_clk_stop;
    release `CPU.tcu.tcu_mcu1_dr_clk_stop;
    release `CPU.tcu.tcu_mcu1_fbd_clk_stop;
    release `CPU.tcu.tcu_mcu1_io_clk_stop;
    release `CPU.tcu.tcu_mcu2_clk_stop;
    release `CPU.tcu.tcu_mcu2_dr_clk_stop;
    release `CPU.tcu.tcu_mcu2_fbd_clk_stop;
    release `CPU.tcu.tcu_mcu2_io_clk_stop;
    release `CPU.tcu.tcu_mcu3_clk_stop;
    release `CPU.tcu.tcu_mcu3_dr_clk_stop;
    release `CPU.tcu.tcu_mcu3_fbd_clk_stop;
    release `CPU.tcu.tcu_mcu3_io_clk_stop;
    release `CPU.tcu.tcu_mio_clk_stop;
    release `CPU.tcu.tcu_ncu_clk_stop;
    release `CPU.tcu.tcu_ncu_io_clk_stop;
    release `CPU.tcu.tcu_peu_io_clk_stop;
    release `CPU.tcu.tcu_peu_pc_clk_stop;
    release `CPU.tcu.tcu_rdp_io_clk_stop;
    release `CPU.tcu.tcu_rst_clk_stop;
    release `CPU.tcu.tcu_rst_io_clk_stop;
    release `CPU.tcu.tcu_rtx_io_clk_stop;
    release `CPU.tcu.tcu_sii_clk_stop;
    release `CPU.tcu.tcu_sii_io_clk_stop;
    release `CPU.tcu.tcu_sio_clk_stop;
    release `CPU.tcu.tcu_sio_io_clk_stop;
    release `CPU.tcu.tcu_spc0_clk_stop;
    release `CPU.tcu.tcu_spc0_shscan_clk_stop;
    release `CPU.tcu.tcu_spc1_clk_stop;
    release `CPU.tcu.tcu_spc1_shscan_clk_stop;
    release `CPU.tcu.tcu_spc2_clk_stop;
    release `CPU.tcu.tcu_spc2_shscan_clk_stop;
    release `CPU.tcu.tcu_spc3_clk_stop;
    release `CPU.tcu.tcu_spc3_shscan_clk_stop;
    release `CPU.tcu.tcu_spc4_clk_stop;
    release `CPU.tcu.tcu_spc4_shscan_clk_stop;
    release `CPU.tcu.tcu_spc5_clk_stop;
    release `CPU.tcu.tcu_spc5_shscan_clk_stop;
    release `CPU.tcu.tcu_spc6_clk_stop;
    release `CPU.tcu.tcu_spc6_shscan_clk_stop;
    release `CPU.tcu.tcu_spc7_clk_stop;
    release `CPU.tcu.tcu_spc7_shscan_clk_stop;
    release `CPU.tcu.tcu_tds_io_clk_stop;
    if (is_forcing) begin
      force `CPU.tcu.tcu_ccu_clk_stop = value;
      force `CPU.tcu.tcu_ccu_io_clk_stop = value;
      force `CPU.tcu.tcu_ccx_clk_stop = value;
      force `CPU.tcu.tcu_db0_clk_stop = value;
      force `CPU.tcu.tcu_db1_clk_stop = value;
      force `CPU.tcu.tcu_dmu_io_clk_stop = value;
      force `CPU.tcu.tcu_efu_clk_stop = value;
      force `CPU.tcu.tcu_efu_io_clk_stop = value;
      force `CPU.tcu.tcu_l2b0_clk_stop = value;
      force `CPU.tcu.tcu_l2b1_clk_stop = value;
      force `CPU.tcu.tcu_l2b2_clk_stop = value;
      force `CPU.tcu.tcu_l2b3_clk_stop = value;
      force `CPU.tcu.tcu_l2b4_clk_stop = value;
      force `CPU.tcu.tcu_l2b5_clk_stop = value;
      force `CPU.tcu.tcu_l2b6_clk_stop = value;
      force `CPU.tcu.tcu_l2b7_clk_stop = value;
      force `CPU.tcu.tcu_l2d0_clk_stop = value;
      force `CPU.tcu.tcu_l2d1_clk_stop = value;
      force `CPU.tcu.tcu_l2d2_clk_stop = value;
      force `CPU.tcu.tcu_l2d3_clk_stop = value;
      force `CPU.tcu.tcu_l2d4_clk_stop = value;
      force `CPU.tcu.tcu_l2d5_clk_stop = value;
      force `CPU.tcu.tcu_l2d6_clk_stop = value;
      force `CPU.tcu.tcu_l2d7_clk_stop = value;
      force `CPU.tcu.tcu_l2t0_clk_stop = value;
      force `CPU.tcu.tcu_l2t0_shscan_clk_stop = value;
      force `CPU.tcu.tcu_l2t1_clk_stop = value;
      force `CPU.tcu.tcu_l2t1_shscan_clk_stop = value;
      force `CPU.tcu.tcu_l2t2_clk_stop = value;
      force `CPU.tcu.tcu_l2t2_shscan_clk_stop = value;
      force `CPU.tcu.tcu_l2t3_clk_stop = value;
      force `CPU.tcu.tcu_l2t3_shscan_clk_stop = value;
      force `CPU.tcu.tcu_l2t4_clk_stop = value;
      force `CPU.tcu.tcu_l2t4_shscan_clk_stop = value;
      force `CPU.tcu.tcu_l2t5_clk_stop = value;
      force `CPU.tcu.tcu_l2t5_shscan_clk_stop = value;
      force `CPU.tcu.tcu_l2t6_clk_stop = value;
      force `CPU.tcu.tcu_l2t6_shscan_clk_stop = value;
      force `CPU.tcu.tcu_l2t7_clk_stop = value;
      force `CPU.tcu.tcu_l2t7_shscan_clk_stop = value;
      force `CPU.tcu.tcu_mac_io_clk_stop = value;
      force `CPU.tcu.tcu_mcu0_clk_stop = value;
      force `CPU.tcu.tcu_mcu0_dr_clk_stop = value;
      force `CPU.tcu.tcu_mcu0_fbd_clk_stop = value;
      force `CPU.tcu.tcu_mcu0_io_clk_stop = value;
      force `CPU.tcu.tcu_mcu1_clk_stop = value;
      force `CPU.tcu.tcu_mcu1_dr_clk_stop = value;
      force `CPU.tcu.tcu_mcu1_fbd_clk_stop = value;
      force `CPU.tcu.tcu_mcu1_io_clk_stop = value;
      force `CPU.tcu.tcu_mcu2_clk_stop = value;
      force `CPU.tcu.tcu_mcu2_dr_clk_stop = value;
      force `CPU.tcu.tcu_mcu2_fbd_clk_stop = value;
      force `CPU.tcu.tcu_mcu2_io_clk_stop = value;
      force `CPU.tcu.tcu_mcu3_clk_stop = value;
      force `CPU.tcu.tcu_mcu3_dr_clk_stop = value;
      force `CPU.tcu.tcu_mcu3_fbd_clk_stop = value;
      force `CPU.tcu.tcu_mcu3_io_clk_stop = value;
      force `CPU.tcu.tcu_mio_clk_stop = value;
      force `CPU.tcu.tcu_ncu_clk_stop = value;
      force `CPU.tcu.tcu_ncu_io_clk_stop = value;
      force `CPU.tcu.tcu_peu_io_clk_stop = value;
      force `CPU.tcu.tcu_peu_pc_clk_stop = value;
      force `CPU.tcu.tcu_rdp_io_clk_stop = value;
      force `CPU.tcu.tcu_rst_clk_stop = value;
      force `CPU.tcu.tcu_rst_io_clk_stop = value;
      force `CPU.tcu.tcu_rtx_io_clk_stop = value;
      force `CPU.tcu.tcu_sii_clk_stop = value;
      force `CPU.tcu.tcu_sii_io_clk_stop = value;
      force `CPU.tcu.tcu_sio_clk_stop = value;
      force `CPU.tcu.tcu_sio_io_clk_stop = value;
      force `CPU.tcu.tcu_spc0_clk_stop = value;
      force `CPU.tcu.tcu_spc0_shscan_clk_stop = value;
      force `CPU.tcu.tcu_spc1_clk_stop = value;
      force `CPU.tcu.tcu_spc1_shscan_clk_stop = value;
      force `CPU.tcu.tcu_spc2_clk_stop = value;
      force `CPU.tcu.tcu_spc2_shscan_clk_stop = value;
      force `CPU.tcu.tcu_spc3_clk_stop = value;
      force `CPU.tcu.tcu_spc3_shscan_clk_stop = value;
      force `CPU.tcu.tcu_spc4_clk_stop = value;
      force `CPU.tcu.tcu_spc4_shscan_clk_stop = value;
      force `CPU.tcu.tcu_spc5_clk_stop = value;
      force `CPU.tcu.tcu_spc5_shscan_clk_stop = value;
      force `CPU.tcu.tcu_spc6_clk_stop = value;
      force `CPU.tcu.tcu_spc6_shscan_clk_stop = value;
      force `CPU.tcu.tcu_spc7_clk_stop = value;
      force `CPU.tcu.tcu_spc7_shscan_clk_stop = value;
      force `CPU.tcu.tcu_tds_io_clk_stop = value;
    end // if (is_forcing)
  end   // task
endtask

//==============================================================
// WHAT: testing pll_char_out
//==============================================================
task dft_testing_pll_char_out;
  integer i;
  integer wait_toggle_char_in; // number of sys cycs wait before toggle pll_char_in
  integer delay_next_char_in;
  integer num_pll_char_in_pulse;
  begin
    `PR_ALWAYS ("top", `ALWAYS, "pll_char_out test: enter");

    //--- process +args -----
    if (!($value$plusargs("wait_toggle_char_in=%d", wait_toggle_char_in)))
      wait_toggle_char_in = 100;
    if (!($value$plusargs("delay_next_char_in=%d", delay_next_char_in)))
      delay_next_char_in = 100;
    if (!($value$plusargs("num_pll_char_in_pulse=%d", num_pll_char_in_pulse)))
      num_pll_char_in_pulse = 1;

    //---- config PKG pins for pll_testmode ------
    #5;    // avoid race with initial blocks
    tb_top.dbg_dq_reg[157]     = 1'b0; // aka pll_char_in
    tb_top.dbg_dq_reg[156:151] = 6'h7; // aka pll_div2[5:0]. 0x7 is divided by 8.
    tb_top.dbg_dq_reg[150]     = 1'b0; // aka pll_trst_l
    tb_top.dbg_dq_reg[149]     = 1'b0; // aka pll_clamp_fltr. Must be 0.
    tb_top.dbg_dq_reg[146:140] = 7'h8; // aka pll_div4[6:0]. 0x8 is divided by 4.0
    tb_top.dbg_dq_reg[139]     = 1'b0; // aka ext_dr_clk. TESTMODE is 0, so CCU not send this sig to PLL.
    tb_top.dbg_dq_reg[138]     = 1'b0; // aka ext_cmp_clk. TESTMODE is 0, so CCU not send this sig to PLL.
    pll_testmode_reg = 1'b0;  // per KC, PLL_TESTMODE must have 0->1 edge for pll_char mode to work
    if (`CPU.PWRON_RST_L !== 1'b0)
      @(`CPU.PWRON_RST_L);    // wait for bench driving PWRON_RST_L
    repeat (2) @(`CPU.PLL_CMP_CLK_P);    // wait for 2 edges of sys clk
    pll_testmode_reg = 1'b1;  // per KC, PLL_TESTMODE must have 0->1 edge for pll_char mode to work
    `PR_ALWAYS ("top", `ALWAYS, "pll_char_out test: assert PLL_TESTMODE (ie. 0->1 transition)");

    //--- reset PLL, wait PLL locked and CCU out of reset
    @(posedge `CPU.ccu.rst_ccu_pll_);
    tb_top.dbg_dq_reg[150] = 1'b1;     // deassert pll_trst_l
    `PR_ALWAYS ("top", `ALWAYS, "pll_char_out test: detect rst_ccu_pll_ deasserted. Deassert PLL_TRST_L");
    @(posedge `CPU.ccu.ccu_rst_sync_stable);
    `PR_ALWAYS ("top", `ALWAYS, "pll_char_out test: detect ccu_rst_sync_stable asserted");
    repeat (wait_toggle_char_in)  @(posedge `CPU.PLL_CMP_CLK_P);
    //--- toggle pll_char_in pin to bring out PLL internal nodes to pll_char_out[1:0]
    for (i = 1; i <= num_pll_char_in_pulse; i= i + 1) begin
      `PR_ALWAYS ("top", `ALWAYS, "pll_char_out test: pulse pll_char_in (pulse #%0d. X mod 8 = %0d)", i, i % 8);
      tb_top.dbg_dq_reg[157] = 1'b1;
      @(posedge `CPU.PLL_CMP_CLK_P);
      tb_top.dbg_dq_reg[157] = 1'b0;
      repeat (delay_next_char_in) @(posedge `CPU.PLL_CMP_CLK_P);
    end
    //--- terminate simulation---
    `PR_ALWAYS ("top", `ALWAYS, "pll_char_out test: terminate simulation");
    $finish;
  end
endtask

//==============================================================
// WHAT: force write request onto TCU-SII bus to mimic L2 write
//       access from JTAG port. Wait for SIU's acknowledge.
// ARGS: see comments in the task's port list.
// TCU writes to L2 via SIU:
//    - Write request is 128-bit (64-bit header and 64-bit write data).
//    - The 64-bit header for wr req is as follows:
//      [63:56] is 8'h82 for write req, [55:40]: reserved and are 16'h0, [39:0] is 8-byte aligned PA addr.
//    - TCU sends write req in 128 l2clk cycles.
//    - In cycles 0 to 63, TCU pulses tcu_sii_vld for one cycle (cycle 0) and drives 64-bit header
//      onto tcu_sii_data for 64 cycles with LSB first.
//    - In cycles 64 to 127, TCU pulses tcu_sii_vld for one cycle (cycle 64) and drives 64-bit data
//      onto tcu_sii_data for 64 cycles with LSB first.
//    - TCU then must drive tcu_sii_data to low (in active state).
//    - When L2/SIU completes write, it sends acknowledge back to TCU by pulsing sio_tcu_vld 
//      for one cycle. Per SIU spec, SIU should drive 0 onto sio_tcu_data, but simulation showed
//      SIU sometime toggles sio_tcu_data.
// NOTE: addr should be 8-byte aligned, but this task does not check it.
//==============================================================

task force_tcu_siu_L2_write;
  //--- args ----
  input [39:0] addr;      // PA addr
  input [63:0] data;      // write data
  //--- vars ---
  reg [63:0] header;      // wr req header
  reg vld_reg, data_reg;  // regs to drive tcu_sii_vld and tcu_sii_data signals
  integer i;

  begin
    header = {8'h82, 16'h0, addr};  // 8'h82: write request
    `PR_ALWAYS ("top", `ALWAYS, "force_tcu_siu_L2_write(addr[39:0]=%h, wr_data[63:0]=%h)", addr, data);
    `PR_ALWAYS ("top", `ALWAYS, "force_tcu_siu_L2_write(): header[63:0]=%h or %b", header, header);
    //--- init vars ---
    @(posedge `TCU.l2clk);
    vld_reg  = 1'b0;
    data_reg = 1'b0;
    force `TCU.tcu_sii_vld  = vld_reg;  // LHS is updated whenever RHS changed
    force `TCU.tcu_sii_data = data_reg; // LHS is updated whenever RHS changed
    //--- send 64-bit header with LSB first ---
    for (i = 0; i < 64; i = i + 1) begin  // TCU sends LSB first
      @(posedge `TCU.l2clk);
      #2
      vld_reg = (i == 0)? 1'b1 : 1'b0;    // TCU pulses tcu_sii_vld for one cycle
      data_reg = header[i];
    end
    //--- send 64-bit write data with LSB first ----
    for (i = 0; i < 64; i = i + 1) begin  // TCU sends LSB first
      @(posedge `TCU.l2clk);
      #2
      vld_reg = (i == 0)? 1'b1 : 1'b0;    // TCU pulses tcu_sii_vld for one cycle
      data_reg = data[i];
    end
    //--- TCU must drive tcu_sii_data with 0 when it's inactive----
    @(posedge `TCU.l2clk);
    #2 data_reg = 1'b0;
    @(posedge `TCU.l2clk);
    `PR_ALWAYS ("top", `ALWAYS, "force_tcu_siu_L2_write(): write req was sent. Wait for SIU acknowledge");
    repeat (2) @(posedge `TCU.l2clk);
    release `TCU.tcu_sii_vld;
    release `TCU.tcu_sii_data;
    //--- wait for L2/SIU acks ----
    @(posedge `TCU.sio_tcu_vld);
    `PR_ALWAYS ("top", `ALWAYS, "force_tcu_siu_L2_write(): received SIU acknowledge (ie. sio_tcu_vld pulsed). Wait for 64 l2clk cycs");
    repeat (64) @(posedge `TCU.l2clk);   // response pkt is 64 cycles
    repeat (2) @(posedge `TCU.l2clk);    // just wait few cycles
  end
endtask

//==============================================================
// WHAT: force read request onto TCU-SII bus to mimic L2 read
//       access from JTAG port. Wait for SIU sending back rd data and returns
//       it to the caller.
// ARGS: see comments in the task's port list.
// TCU reads to L2 via SIU:
//    - Read request is 64-bit (64-bit header).
//    - The 64-bit header for read req is as follows:
//      [63:56] is 8'h81 for read req, [55:40]: reserved and are 16'h0, [39:0] is 8-byte aligned PA addr.
//    - TCU sends read req in 64 l2clk cycles.
//    - In cycles 0 to 63, TCU pulses tcu_sii_vld for one cycle (cycle 0) and drives 64-bit header
//      onto tcu_sii_data for 64 cycles with LSB first.
//    - TCU then must drive tcu_sii_data to low (in active state).
//    - When L2/SIU returns 64-bit read data, SIU pulses sio_tcu_vld for one cycle and drives
//      64-bit read data onto sio_tcu_data for 64 l2clk cycles with LSB first.
//    - SIU must drive 0 onto sio_tcu_data when it is not active.
// NOTE: addr should be 8-byte aligned, but this task does not check it.
//==============================================================

task force_tcu_siu_L2_read;
  //--- args ----
  input  [39:0] addr;      // PA addr
  output [63:0] data;      // read data returned by SIU
  //--- vars ---
  reg [63:0] header;       // rd req header
  reg vld_reg, data_reg;   // regs to drive tcu_sii_vld and tcu_sii_data signals
  integer i;               // bit position to be sent

  begin
    header = {8'h81, 16'h0, addr};  // 8'h81: read request
    `PR_ALWAYS ("top", `ALWAYS, "force_tcu_siu_L2_read(addr[39:0]=%h)", addr);
    `PR_ALWAYS ("top", `ALWAYS, "force_tcu_siu_L2_read(): header[63:0]=%h or %b", header, header);
    //--- init vars ---
    @(posedge `TCU.l2clk);
    vld_reg  = 1'b0;
    data_reg = 1'b0;
    force `TCU.tcu_sii_vld  = vld_reg;  // LHS is updated whenever RHS changes
    force `TCU.tcu_sii_data = data_reg; // LHS is updated whenever RHS changes
    //--- send 64-bit header with LSB first ---
    for (i = 0; i < 64; i = i + 1) begin  // TCU sends LSB first
      @(posedge `TCU.l2clk);
      #2
      vld_reg = (i == 0)? 1'b1 : 1'b0;    // TCU pulses tcu_sii_vld for one cycle
      data_reg = header[i];
    end
    //--- TCU must drive tcu_sii_data with 0 when it's inactive----
    @(posedge `TCU.l2clk);
    #2 data_reg = 1'b0;
    @(posedge `TCU.l2clk);
    `PR_ALWAYS ("top", `ALWAYS, "force_tcu_siu_L2_read(): read req was sent. Wait for SIU sends back rd data");
    repeat (2) @(posedge `TCU.l2clk);  // SIU cannot send back rd response in 2 l2clk cycs
    release `TCU.tcu_sii_vld;
    release `TCU.tcu_sii_data;
    //--- wait for L2/SIU sends back rd response  ----
    @(posedge `TCU.sio_tcu_vld);
    for (i = 0; i < 64; i = i + 1) begin
      @(posedge `TCU.l2clk);
      data[i] = `TCU.sio_tcu_data;
    end
    `PR_ALWAYS ("top", `ALWAYS, "force_tcu_siu_L2_read(): addr[39:0]=%h, received rd_data[63:0]=%h with LSB first", addr, data);
    repeat (2) @(posedge `TCU.l2clk);    // just wait few cycles
  end
endtask

//==============================================================
//==============================================================

task force_tlrState;
begin
`ifndef GATESIM
   force `TCU.jtag_ctl.tap_state[3:0] = 4'hF;
   repeat (2) @(posedge `CPU.ccu.l2clk);  // this is always-running clock
   release `TCU.jtag_ctl.tap_state;
`endif
end
endtask
task release_tlrState;
begin
`ifndef GATESIM
   release `TCU.jtag_ctl.tap_state;
`endif
end
endtask
