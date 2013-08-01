// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: reg_slam.v
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
module reg_slam;

  task slam_TsbSearchMode_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
      @(posedge `SPC0.l2clk);
      force `SPC0.mmu.asi.hwtw_config_0 = value;
      @(posedge `SPC0.l2clk);
      release `SPC0.mmu.asi.hwtw_config_0;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  0, 0, 58, value);
      tid  = 0;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
      @(posedge `SPC0.l2clk);
      force `SPC0.mmu.asi.hwtw_config_1 = value;
      @(posedge `SPC0.l2clk);
      release `SPC0.mmu.asi.hwtw_config_1;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  0, 1, 58, value);
      tid  = 1;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
      @(posedge `SPC0.l2clk);
      force `SPC0.mmu.asi.hwtw_config_2 = value;
      @(posedge `SPC0.l2clk);
      release `SPC0.mmu.asi.hwtw_config_2;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  0, 2, 58, value);
      tid  = 2;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
      @(posedge `SPC0.l2clk);
      force `SPC0.mmu.asi.hwtw_config_3 = value;
      @(posedge `SPC0.l2clk);
      release `SPC0.mmu.asi.hwtw_config_3;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  0, 3, 58, value);
      tid  = 3;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
      @(posedge `SPC0.l2clk);
      force `SPC0.mmu.asi.hwtw_config_4 = value;
      @(posedge `SPC0.l2clk);
      release `SPC0.mmu.asi.hwtw_config_4;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  0, 4, 58, value);
      tid  = 4;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
      @(posedge `SPC0.l2clk);
      force `SPC0.mmu.asi.hwtw_config_5 = value;
      @(posedge `SPC0.l2clk);
      release `SPC0.mmu.asi.hwtw_config_5;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  0, 5, 58, value);
      tid  = 5;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
      @(posedge `SPC0.l2clk);
      force `SPC0.mmu.asi.hwtw_config_6 = value;
      @(posedge `SPC0.l2clk);
      release `SPC0.mmu.asi.hwtw_config_6;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  0, 6, 58, value);
      tid  = 6;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
      @(posedge `SPC0.l2clk);
      force `SPC0.mmu.asi.hwtw_config_7 = value;
      @(posedge `SPC0.l2clk);
      release `SPC0.mmu.asi.hwtw_config_7;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  0, 7, 58, value);
      tid  = 7;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
      @(posedge `SPC1.l2clk);
      force `SPC1.mmu.asi.hwtw_config_0 = value;
      @(posedge `SPC1.l2clk);
      release `SPC1.mmu.asi.hwtw_config_0;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  1, 0, 58, value);
      tid  = 0;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
      @(posedge `SPC1.l2clk);
      force `SPC1.mmu.asi.hwtw_config_1 = value;
      @(posedge `SPC1.l2clk);
      release `SPC1.mmu.asi.hwtw_config_1;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  1, 1, 58, value);
      tid  = 1;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
      @(posedge `SPC1.l2clk);
      force `SPC1.mmu.asi.hwtw_config_2 = value;
      @(posedge `SPC1.l2clk);
      release `SPC1.mmu.asi.hwtw_config_2;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  1, 2, 58, value);
      tid  = 2;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
      @(posedge `SPC1.l2clk);
      force `SPC1.mmu.asi.hwtw_config_3 = value;
      @(posedge `SPC1.l2clk);
      release `SPC1.mmu.asi.hwtw_config_3;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  1, 3, 58, value);
      tid  = 3;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
      @(posedge `SPC1.l2clk);
      force `SPC1.mmu.asi.hwtw_config_4 = value;
      @(posedge `SPC1.l2clk);
      release `SPC1.mmu.asi.hwtw_config_4;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  1, 4, 58, value);
      tid  = 4;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
      @(posedge `SPC1.l2clk);
      force `SPC1.mmu.asi.hwtw_config_5 = value;
      @(posedge `SPC1.l2clk);
      release `SPC1.mmu.asi.hwtw_config_5;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  1, 5, 58, value);
      tid  = 5;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
      @(posedge `SPC1.l2clk);
      force `SPC1.mmu.asi.hwtw_config_6 = value;
      @(posedge `SPC1.l2clk);
      release `SPC1.mmu.asi.hwtw_config_6;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  1, 6, 58, value);
      tid  = 6;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
      @(posedge `SPC1.l2clk);
      force `SPC1.mmu.asi.hwtw_config_7 = value;
      @(posedge `SPC1.l2clk);
      release `SPC1.mmu.asi.hwtw_config_7;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  1, 7, 58, value);
      tid  = 7;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
      @(posedge `SPC2.l2clk);
      force `SPC2.mmu.asi.hwtw_config_0 = value;
      @(posedge `SPC2.l2clk);
      release `SPC2.mmu.asi.hwtw_config_0;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  2, 0, 58, value);
      tid  = 0;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
      @(posedge `SPC2.l2clk);
      force `SPC2.mmu.asi.hwtw_config_1 = value;
      @(posedge `SPC2.l2clk);
      release `SPC2.mmu.asi.hwtw_config_1;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  2, 1, 58, value);
      tid  = 1;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
      @(posedge `SPC2.l2clk);
      force `SPC2.mmu.asi.hwtw_config_2 = value;
      @(posedge `SPC2.l2clk);
      release `SPC2.mmu.asi.hwtw_config_2;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  2, 2, 58, value);
      tid  = 2;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
      @(posedge `SPC2.l2clk);
      force `SPC2.mmu.asi.hwtw_config_3 = value;
      @(posedge `SPC2.l2clk);
      release `SPC2.mmu.asi.hwtw_config_3;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  2, 3, 58, value);
      tid  = 3;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
      @(posedge `SPC2.l2clk);
      force `SPC2.mmu.asi.hwtw_config_4 = value;
      @(posedge `SPC2.l2clk);
      release `SPC2.mmu.asi.hwtw_config_4;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  2, 4, 58, value);
      tid  = 4;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
      @(posedge `SPC2.l2clk);
      force `SPC2.mmu.asi.hwtw_config_5 = value;
      @(posedge `SPC2.l2clk);
      release `SPC2.mmu.asi.hwtw_config_5;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  2, 5, 58, value);
      tid  = 5;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
      @(posedge `SPC2.l2clk);
      force `SPC2.mmu.asi.hwtw_config_6 = value;
      @(posedge `SPC2.l2clk);
      release `SPC2.mmu.asi.hwtw_config_6;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  2, 6, 58, value);
      tid  = 6;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
      @(posedge `SPC2.l2clk);
      force `SPC2.mmu.asi.hwtw_config_7 = value;
      @(posedge `SPC2.l2clk);
      release `SPC2.mmu.asi.hwtw_config_7;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  2, 7, 58, value);
      tid  = 7;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
      @(posedge `SPC3.l2clk);
      force `SPC3.mmu.asi.hwtw_config_0 = value;
      @(posedge `SPC3.l2clk);
      release `SPC3.mmu.asi.hwtw_config_0;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  3, 0, 58, value);
      tid  = 0;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
      @(posedge `SPC3.l2clk);
      force `SPC3.mmu.asi.hwtw_config_1 = value;
      @(posedge `SPC3.l2clk);
      release `SPC3.mmu.asi.hwtw_config_1;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  3, 1, 58, value);
      tid  = 1;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
      @(posedge `SPC3.l2clk);
      force `SPC3.mmu.asi.hwtw_config_2 = value;
      @(posedge `SPC3.l2clk);
      release `SPC3.mmu.asi.hwtw_config_2;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  3, 2, 58, value);
      tid  = 2;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
      @(posedge `SPC3.l2clk);
      force `SPC3.mmu.asi.hwtw_config_3 = value;
      @(posedge `SPC3.l2clk);
      release `SPC3.mmu.asi.hwtw_config_3;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  3, 3, 58, value);
      tid  = 3;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
      @(posedge `SPC3.l2clk);
      force `SPC3.mmu.asi.hwtw_config_4 = value;
      @(posedge `SPC3.l2clk);
      release `SPC3.mmu.asi.hwtw_config_4;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  3, 4, 58, value);
      tid  = 4;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
      @(posedge `SPC3.l2clk);
      force `SPC3.mmu.asi.hwtw_config_5 = value;
      @(posedge `SPC3.l2clk);
      release `SPC3.mmu.asi.hwtw_config_5;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  3, 5, 58, value);
      tid  = 5;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
      @(posedge `SPC3.l2clk);
      force `SPC3.mmu.asi.hwtw_config_6 = value;
      @(posedge `SPC3.l2clk);
      release `SPC3.mmu.asi.hwtw_config_6;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  3, 6, 58, value);
      tid  = 6;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
      @(posedge `SPC3.l2clk);
      force `SPC3.mmu.asi.hwtw_config_7 = value;
      @(posedge `SPC3.l2clk);
      release `SPC3.mmu.asi.hwtw_config_7;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  3, 7, 58, value);
      tid  = 7;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
      @(posedge `SPC4.l2clk);
      force `SPC4.mmu.asi.hwtw_config_0 = value;
      @(posedge `SPC4.l2clk);
      release `SPC4.mmu.asi.hwtw_config_0;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  4, 0, 58, value);
      tid  = 0;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
      @(posedge `SPC4.l2clk);
      force `SPC4.mmu.asi.hwtw_config_1 = value;
      @(posedge `SPC4.l2clk);
      release `SPC4.mmu.asi.hwtw_config_1;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  4, 1, 58, value);
      tid  = 1;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
      @(posedge `SPC4.l2clk);
      force `SPC4.mmu.asi.hwtw_config_2 = value;
      @(posedge `SPC4.l2clk);
      release `SPC4.mmu.asi.hwtw_config_2;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  4, 2, 58, value);
      tid  = 2;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
      @(posedge `SPC4.l2clk);
      force `SPC4.mmu.asi.hwtw_config_3 = value;
      @(posedge `SPC4.l2clk);
      release `SPC4.mmu.asi.hwtw_config_3;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  4, 3, 58, value);
      tid  = 3;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
      @(posedge `SPC4.l2clk);
      force `SPC4.mmu.asi.hwtw_config_4 = value;
      @(posedge `SPC4.l2clk);
      release `SPC4.mmu.asi.hwtw_config_4;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  4, 4, 58, value);
      tid  = 4;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
      @(posedge `SPC4.l2clk);
      force `SPC4.mmu.asi.hwtw_config_5 = value;
      @(posedge `SPC4.l2clk);
      release `SPC4.mmu.asi.hwtw_config_5;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  4, 5, 58, value);
      tid  = 5;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
      @(posedge `SPC4.l2clk);
      force `SPC4.mmu.asi.hwtw_config_6 = value;
      @(posedge `SPC4.l2clk);
      release `SPC4.mmu.asi.hwtw_config_6;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  4, 6, 58, value);
      tid  = 6;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
      @(posedge `SPC4.l2clk);
      force `SPC4.mmu.asi.hwtw_config_7 = value;
      @(posedge `SPC4.l2clk);
      release `SPC4.mmu.asi.hwtw_config_7;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  4, 7, 58, value);
      tid  = 7;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
      @(posedge `SPC5.l2clk);
      force `SPC5.mmu.asi.hwtw_config_0 = value;
      @(posedge `SPC5.l2clk);
      release `SPC5.mmu.asi.hwtw_config_0;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  5, 0, 58, value);
      tid  = 0;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
      @(posedge `SPC5.l2clk);
      force `SPC5.mmu.asi.hwtw_config_1 = value;
      @(posedge `SPC5.l2clk);
      release `SPC5.mmu.asi.hwtw_config_1;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  5, 1, 58, value);
      tid  = 1;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
      @(posedge `SPC5.l2clk);
      force `SPC5.mmu.asi.hwtw_config_2 = value;
      @(posedge `SPC5.l2clk);
      release `SPC5.mmu.asi.hwtw_config_2;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  5, 2, 58, value);
      tid  = 2;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
      @(posedge `SPC5.l2clk);
      force `SPC5.mmu.asi.hwtw_config_3 = value;
      @(posedge `SPC5.l2clk);
      release `SPC5.mmu.asi.hwtw_config_3;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  5, 3, 58, value);
      tid  = 3;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
      @(posedge `SPC5.l2clk);
      force `SPC5.mmu.asi.hwtw_config_4 = value;
      @(posedge `SPC5.l2clk);
      release `SPC5.mmu.asi.hwtw_config_4;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  5, 4, 58, value);
      tid  = 4;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
      @(posedge `SPC5.l2clk);
      force `SPC5.mmu.asi.hwtw_config_5 = value;
      @(posedge `SPC5.l2clk);
      release `SPC5.mmu.asi.hwtw_config_5;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  5, 5, 58, value);
      tid  = 5;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
      @(posedge `SPC5.l2clk);
      force `SPC5.mmu.asi.hwtw_config_6 = value;
      @(posedge `SPC5.l2clk);
      release `SPC5.mmu.asi.hwtw_config_6;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  5, 6, 58, value);
      tid  = 6;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
      @(posedge `SPC5.l2clk);
      force `SPC5.mmu.asi.hwtw_config_7 = value;
      @(posedge `SPC5.l2clk);
      release `SPC5.mmu.asi.hwtw_config_7;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  5, 7, 58, value);
      tid  = 7;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
      @(posedge `SPC6.l2clk);
      force `SPC6.mmu.asi.hwtw_config_0 = value;
      @(posedge `SPC6.l2clk);
      release `SPC6.mmu.asi.hwtw_config_0;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  6, 0, 58, value);
      tid  = 0;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
      @(posedge `SPC6.l2clk);
      force `SPC6.mmu.asi.hwtw_config_1 = value;
      @(posedge `SPC6.l2clk);
      release `SPC6.mmu.asi.hwtw_config_1;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  6, 1, 58, value);
      tid  = 1;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
      @(posedge `SPC6.l2clk);
      force `SPC6.mmu.asi.hwtw_config_2 = value;
      @(posedge `SPC6.l2clk);
      release `SPC6.mmu.asi.hwtw_config_2;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  6, 2, 58, value);
      tid  = 2;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
      @(posedge `SPC6.l2clk);
      force `SPC6.mmu.asi.hwtw_config_3 = value;
      @(posedge `SPC6.l2clk);
      release `SPC6.mmu.asi.hwtw_config_3;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  6, 3, 58, value);
      tid  = 3;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
      @(posedge `SPC6.l2clk);
      force `SPC6.mmu.asi.hwtw_config_4 = value;
      @(posedge `SPC6.l2clk);
      release `SPC6.mmu.asi.hwtw_config_4;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  6, 4, 58, value);
      tid  = 4;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
      @(posedge `SPC6.l2clk);
      force `SPC6.mmu.asi.hwtw_config_5 = value;
      @(posedge `SPC6.l2clk);
      release `SPC6.mmu.asi.hwtw_config_5;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  6, 5, 58, value);
      tid  = 5;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
      @(posedge `SPC6.l2clk);
      force `SPC6.mmu.asi.hwtw_config_6 = value;
      @(posedge `SPC6.l2clk);
      release `SPC6.mmu.asi.hwtw_config_6;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  6, 6, 58, value);
      tid  = 6;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
      @(posedge `SPC6.l2clk);
      force `SPC6.mmu.asi.hwtw_config_7 = value;
      @(posedge `SPC6.l2clk);
      release `SPC6.mmu.asi.hwtw_config_7;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  6, 7, 58, value);
      tid  = 7;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
      @(posedge `SPC7.l2clk);
      force `SPC7.mmu.asi.hwtw_config_0 = value;
      @(posedge `SPC7.l2clk);
      release `SPC7.mmu.asi.hwtw_config_0;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  7, 0, 58, value);
      tid  = 0;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
      @(posedge `SPC7.l2clk);
      force `SPC7.mmu.asi.hwtw_config_1 = value;
      @(posedge `SPC7.l2clk);
      release `SPC7.mmu.asi.hwtw_config_1;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  7, 1, 58, value);
      tid  = 1;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
      @(posedge `SPC7.l2clk);
      force `SPC7.mmu.asi.hwtw_config_2 = value;
      @(posedge `SPC7.l2clk);
      release `SPC7.mmu.asi.hwtw_config_2;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  7, 2, 58, value);
      tid  = 2;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
      @(posedge `SPC7.l2clk);
      force `SPC7.mmu.asi.hwtw_config_3 = value;
      @(posedge `SPC7.l2clk);
      release `SPC7.mmu.asi.hwtw_config_3;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  7, 3, 58, value);
      tid  = 3;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
      @(posedge `SPC7.l2clk);
      force `SPC7.mmu.asi.hwtw_config_4 = value;
      @(posedge `SPC7.l2clk);
      release `SPC7.mmu.asi.hwtw_config_4;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  7, 4, 58, value);
      tid  = 4;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
      @(posedge `SPC7.l2clk);
      force `SPC7.mmu.asi.hwtw_config_5 = value;
      @(posedge `SPC7.l2clk);
      release `SPC7.mmu.asi.hwtw_config_5;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  7, 5, 58, value);
      tid  = 5;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
      @(posedge `SPC7.l2clk);
      force `SPC7.mmu.asi.hwtw_config_6 = value;
      @(posedge `SPC7.l2clk);
      release `SPC7.mmu.asi.hwtw_config_6;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  7, 6, 58, value);
      tid  = 6;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_TsbSearchMode_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
      @(posedge `SPC7.l2clk);
      force `SPC7.mmu.asi.hwtw_config_7 = value;
      @(posedge `SPC7.l2clk);
      release `SPC7.mmu.asi.hwtw_config_7;
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x0 val=0x%h",  7, 7, 58, value);
      tid  = 7;
      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h58, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core0_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[0]" );
     `SPC0.mmu.mra0.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core0_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[8]" );
     `SPC0.mmu.mra0.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core0_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[16]" );
     `SPC0.mmu.mra0.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core0_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[24]" );
     `SPC0.mmu.mra0.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core0_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[0]" );
     `SPC0.mmu.mra1.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core0_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[8]" );
     `SPC0.mmu.mra1.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core0_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[16]" );
     `SPC0.mmu.mra1.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core0_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[24]" );
     `SPC0.mmu.mra1.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core1_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[0]" );
     `SPC1.mmu.mra0.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core1_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[8]" );
     `SPC1.mmu.mra0.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core1_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[16]" );
     `SPC1.mmu.mra0.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core1_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[24]" );
     `SPC1.mmu.mra0.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core1_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[0]" );
     `SPC1.mmu.mra1.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core1_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[8]" );
     `SPC1.mmu.mra1.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core1_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[16]" );
     `SPC1.mmu.mra1.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core1_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[24]" );
     `SPC1.mmu.mra1.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core2_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[0]" );
     `SPC2.mmu.mra0.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core2_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[8]" );
     `SPC2.mmu.mra0.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core2_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[16]" );
     `SPC2.mmu.mra0.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core2_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[24]" );
     `SPC2.mmu.mra0.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core2_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[0]" );
     `SPC2.mmu.mra1.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core2_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[8]" );
     `SPC2.mmu.mra1.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core2_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[16]" );
     `SPC2.mmu.mra1.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core2_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[24]" );
     `SPC2.mmu.mra1.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core3_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[0]" );
     `SPC3.mmu.mra0.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core3_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[8]" );
     `SPC3.mmu.mra0.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core3_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[16]" );
     `SPC3.mmu.mra0.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core3_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[24]" );
     `SPC3.mmu.mra0.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core3_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[0]" );
     `SPC3.mmu.mra1.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core3_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[8]" );
     `SPC3.mmu.mra1.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core3_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[16]" );
     `SPC3.mmu.mra1.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core3_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[24]" );
     `SPC3.mmu.mra1.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core4_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[0]" );
     `SPC4.mmu.mra0.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core4_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[8]" );
     `SPC4.mmu.mra0.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core4_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[16]" );
     `SPC4.mmu.mra0.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core4_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[24]" );
     `SPC4.mmu.mra0.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core4_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[0]" );
     `SPC4.mmu.mra1.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core4_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[8]" );
     `SPC4.mmu.mra1.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core4_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[16]" );
     `SPC4.mmu.mra1.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core4_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[24]" );
     `SPC4.mmu.mra1.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core5_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[0]" );
     `SPC5.mmu.mra0.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core5_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[8]" );
     `SPC5.mmu.mra0.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core5_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[16]" );
     `SPC5.mmu.mra0.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core5_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[24]" );
     `SPC5.mmu.mra0.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core5_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[0]" );
     `SPC5.mmu.mra1.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core5_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[8]" );
     `SPC5.mmu.mra1.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core5_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[16]" );
     `SPC5.mmu.mra1.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core5_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[24]" );
     `SPC5.mmu.mra1.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core6_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[0]" );
     `SPC6.mmu.mra0.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core6_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[8]" );
     `SPC6.mmu.mra0.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core6_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[16]" );
     `SPC6.mmu.mra0.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core6_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[24]" );
     `SPC6.mmu.mra0.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core6_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[0]" );
     `SPC6.mmu.mra1.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core6_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[8]" );
     `SPC6.mmu.mra1.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core6_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[16]" );
     `SPC6.mmu.mra1.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core6_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[24]" );
     `SPC6.mmu.mra1.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core7_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[0]" );
     `SPC7.mmu.mra0.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core7_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[8]" );
     `SPC7.mmu.mra0.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core7_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[16]" );
     `SPC7.mmu.mra0.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core7_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[24]" );
     `SPC7.mmu.mra0.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core7_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[0]" );
     `SPC7.mmu.mra1.array.mem[0] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core7_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[8]" );
     `SPC7.mmu.mra1.array.mem[8] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core7_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[16]" );
     `SPC7.mmu.mra1.array.mem[16] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow0_core7_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[24]" );
     `SPC7.mmu.mra1.array.mem[24] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core0_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[1]" );
     `SPC0.mmu.mra0.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core0_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[9]" );
     `SPC0.mmu.mra0.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core0_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[17]" );
     `SPC0.mmu.mra0.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core0_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[25]" );
     `SPC0.mmu.mra0.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core0_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[1]" );
     `SPC0.mmu.mra1.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core0_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[9]" );
     `SPC0.mmu.mra1.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core0_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[17]" );
     `SPC0.mmu.mra1.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core0_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[25]" );
     `SPC0.mmu.mra1.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core1_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[1]" );
     `SPC1.mmu.mra0.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core1_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[9]" );
     `SPC1.mmu.mra0.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core1_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[17]" );
     `SPC1.mmu.mra0.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core1_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[25]" );
     `SPC1.mmu.mra0.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core1_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[1]" );
     `SPC1.mmu.mra1.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core1_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[9]" );
     `SPC1.mmu.mra1.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core1_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[17]" );
     `SPC1.mmu.mra1.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core1_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[25]" );
     `SPC1.mmu.mra1.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core2_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[1]" );
     `SPC2.mmu.mra0.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core2_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[9]" );
     `SPC2.mmu.mra0.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core2_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[17]" );
     `SPC2.mmu.mra0.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core2_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[25]" );
     `SPC2.mmu.mra0.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core2_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[1]" );
     `SPC2.mmu.mra1.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core2_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[9]" );
     `SPC2.mmu.mra1.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core2_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[17]" );
     `SPC2.mmu.mra1.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core2_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[25]" );
     `SPC2.mmu.mra1.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core3_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[1]" );
     `SPC3.mmu.mra0.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core3_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[9]" );
     `SPC3.mmu.mra0.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core3_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[17]" );
     `SPC3.mmu.mra0.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core3_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[25]" );
     `SPC3.mmu.mra0.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core3_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[1]" );
     `SPC3.mmu.mra1.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core3_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[9]" );
     `SPC3.mmu.mra1.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core3_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[17]" );
     `SPC3.mmu.mra1.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core3_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[25]" );
     `SPC3.mmu.mra1.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core4_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[1]" );
     `SPC4.mmu.mra0.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core4_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[9]" );
     `SPC4.mmu.mra0.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core4_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[17]" );
     `SPC4.mmu.mra0.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core4_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[25]" );
     `SPC4.mmu.mra0.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core4_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[1]" );
     `SPC4.mmu.mra1.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core4_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[9]" );
     `SPC4.mmu.mra1.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core4_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[17]" );
     `SPC4.mmu.mra1.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core4_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[25]" );
     `SPC4.mmu.mra1.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core5_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[1]" );
     `SPC5.mmu.mra0.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core5_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[9]" );
     `SPC5.mmu.mra0.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core5_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[17]" );
     `SPC5.mmu.mra0.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core5_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[25]" );
     `SPC5.mmu.mra0.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core5_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[1]" );
     `SPC5.mmu.mra1.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core5_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[9]" );
     `SPC5.mmu.mra1.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core5_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[17]" );
     `SPC5.mmu.mra1.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core5_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[25]" );
     `SPC5.mmu.mra1.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core6_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[1]" );
     `SPC6.mmu.mra0.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core6_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[9]" );
     `SPC6.mmu.mra0.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core6_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[17]" );
     `SPC6.mmu.mra0.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core6_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[25]" );
     `SPC6.mmu.mra0.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core6_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[1]" );
     `SPC6.mmu.mra1.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core6_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[9]" );
     `SPC6.mmu.mra1.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core6_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[17]" );
     `SPC6.mmu.mra1.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core6_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[25]" );
     `SPC6.mmu.mra1.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core7_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[1]" );
     `SPC7.mmu.mra0.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core7_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[9]" );
     `SPC7.mmu.mra0.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core7_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[17]" );
     `SPC7.mmu.mra0.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core7_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[25]" );
     `SPC7.mmu.mra0.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core7_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[1]" );
     `SPC7.mmu.mra1.array.mem[1] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core7_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[9]" );
     `SPC7.mmu.mra1.array.mem[9] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core7_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[17]" );
     `SPC7.mmu.mra1.array.mem[17] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow1_core7_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[25]" );
     `SPC7.mmu.mra1.array.mem[25] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core0_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[2]" );
     `SPC0.mmu.mra0.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core0_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[10]" );
     `SPC0.mmu.mra0.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core0_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[18]" );
     `SPC0.mmu.mra0.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core0_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[26]" );
     `SPC0.mmu.mra0.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core0_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[2]" );
     `SPC0.mmu.mra1.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core0_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[10]" );
     `SPC0.mmu.mra1.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core0_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[18]" );
     `SPC0.mmu.mra1.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core0_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[26]" );
     `SPC0.mmu.mra1.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core1_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[2]" );
     `SPC1.mmu.mra0.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core1_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[10]" );
     `SPC1.mmu.mra0.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core1_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[18]" );
     `SPC1.mmu.mra0.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core1_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[26]" );
     `SPC1.mmu.mra0.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core1_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[2]" );
     `SPC1.mmu.mra1.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core1_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[10]" );
     `SPC1.mmu.mra1.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core1_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[18]" );
     `SPC1.mmu.mra1.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core1_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[26]" );
     `SPC1.mmu.mra1.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core2_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[2]" );
     `SPC2.mmu.mra0.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core2_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[10]" );
     `SPC2.mmu.mra0.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core2_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[18]" );
     `SPC2.mmu.mra0.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core2_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[26]" );
     `SPC2.mmu.mra0.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core2_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[2]" );
     `SPC2.mmu.mra1.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core2_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[10]" );
     `SPC2.mmu.mra1.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core2_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[18]" );
     `SPC2.mmu.mra1.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core2_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[26]" );
     `SPC2.mmu.mra1.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core3_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[2]" );
     `SPC3.mmu.mra0.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core3_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[10]" );
     `SPC3.mmu.mra0.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core3_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[18]" );
     `SPC3.mmu.mra0.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core3_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[26]" );
     `SPC3.mmu.mra0.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core3_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[2]" );
     `SPC3.mmu.mra1.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core3_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[10]" );
     `SPC3.mmu.mra1.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core3_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[18]" );
     `SPC3.mmu.mra1.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core3_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[26]" );
     `SPC3.mmu.mra1.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core4_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[2]" );
     `SPC4.mmu.mra0.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core4_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[10]" );
     `SPC4.mmu.mra0.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core4_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[18]" );
     `SPC4.mmu.mra0.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core4_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[26]" );
     `SPC4.mmu.mra0.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core4_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[2]" );
     `SPC4.mmu.mra1.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core4_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[10]" );
     `SPC4.mmu.mra1.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core4_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[18]" );
     `SPC4.mmu.mra1.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core4_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[26]" );
     `SPC4.mmu.mra1.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core5_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[2]" );
     `SPC5.mmu.mra0.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core5_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[10]" );
     `SPC5.mmu.mra0.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core5_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[18]" );
     `SPC5.mmu.mra0.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core5_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[26]" );
     `SPC5.mmu.mra0.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core5_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[2]" );
     `SPC5.mmu.mra1.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core5_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[10]" );
     `SPC5.mmu.mra1.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core5_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[18]" );
     `SPC5.mmu.mra1.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core5_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[26]" );
     `SPC5.mmu.mra1.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core6_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[2]" );
     `SPC6.mmu.mra0.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core6_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[10]" );
     `SPC6.mmu.mra0.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core6_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[18]" );
     `SPC6.mmu.mra0.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core6_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[26]" );
     `SPC6.mmu.mra0.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core6_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[2]" );
     `SPC6.mmu.mra1.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core6_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[10]" );
     `SPC6.mmu.mra1.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core6_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[18]" );
     `SPC6.mmu.mra1.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core6_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[26]" );
     `SPC6.mmu.mra1.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core7_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[2]" );
     `SPC7.mmu.mra0.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core7_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[10]" );
     `SPC7.mmu.mra0.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core7_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[18]" );
     `SPC7.mmu.mra0.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core7_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[26]" );
     `SPC7.mmu.mra0.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core7_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[2]" );
     `SPC7.mmu.mra1.array.mem[2] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core7_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[10]" );
     `SPC7.mmu.mra1.array.mem[10] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core7_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[18]" );
     `SPC7.mmu.mra1.array.mem[18] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow2_core7_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[26]" );
     `SPC7.mmu.mra1.array.mem[26] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core0_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[3]" );
     `SPC0.mmu.mra0.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core0_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[11]" );
     `SPC0.mmu.mra0.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core0_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[19]" );
     `SPC0.mmu.mra0.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core0_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[27]" );
     `SPC0.mmu.mra0.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core0_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[3]" );
     `SPC0.mmu.mra1.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core0_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[11]" );
     `SPC0.mmu.mra1.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core0_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[19]" );
     `SPC0.mmu.mra1.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core0_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[27]" );
     `SPC0.mmu.mra1.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core1_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[3]" );
     `SPC1.mmu.mra0.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core1_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[11]" );
     `SPC1.mmu.mra0.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core1_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[19]" );
     `SPC1.mmu.mra0.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core1_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[27]" );
     `SPC1.mmu.mra0.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core1_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[3]" );
     `SPC1.mmu.mra1.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core1_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[11]" );
     `SPC1.mmu.mra1.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core1_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[19]" );
     `SPC1.mmu.mra1.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core1_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[27]" );
     `SPC1.mmu.mra1.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core2_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[3]" );
     `SPC2.mmu.mra0.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core2_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[11]" );
     `SPC2.mmu.mra0.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core2_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[19]" );
     `SPC2.mmu.mra0.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core2_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[27]" );
     `SPC2.mmu.mra0.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core2_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[3]" );
     `SPC2.mmu.mra1.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core2_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[11]" );
     `SPC2.mmu.mra1.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core2_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[19]" );
     `SPC2.mmu.mra1.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core2_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[27]" );
     `SPC2.mmu.mra1.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core3_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[3]" );
     `SPC3.mmu.mra0.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core3_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[11]" );
     `SPC3.mmu.mra0.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core3_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[19]" );
     `SPC3.mmu.mra0.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core3_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[27]" );
     `SPC3.mmu.mra0.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core3_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[3]" );
     `SPC3.mmu.mra1.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core3_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[11]" );
     `SPC3.mmu.mra1.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core3_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[19]" );
     `SPC3.mmu.mra1.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core3_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[27]" );
     `SPC3.mmu.mra1.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core4_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[3]" );
     `SPC4.mmu.mra0.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core4_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[11]" );
     `SPC4.mmu.mra0.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core4_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[19]" );
     `SPC4.mmu.mra0.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core4_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[27]" );
     `SPC4.mmu.mra0.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core4_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[3]" );
     `SPC4.mmu.mra1.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core4_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[11]" );
     `SPC4.mmu.mra1.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core4_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[19]" );
     `SPC4.mmu.mra1.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core4_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[27]" );
     `SPC4.mmu.mra1.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core5_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[3]" );
     `SPC5.mmu.mra0.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core5_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[11]" );
     `SPC5.mmu.mra0.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core5_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[19]" );
     `SPC5.mmu.mra0.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core5_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[27]" );
     `SPC5.mmu.mra0.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core5_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[3]" );
     `SPC5.mmu.mra1.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core5_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[11]" );
     `SPC5.mmu.mra1.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core5_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[19]" );
     `SPC5.mmu.mra1.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core5_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[27]" );
     `SPC5.mmu.mra1.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core6_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[3]" );
     `SPC6.mmu.mra0.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core6_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[11]" );
     `SPC6.mmu.mra0.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core6_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[19]" );
     `SPC6.mmu.mra0.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core6_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[27]" );
     `SPC6.mmu.mra0.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core6_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[3]" );
     `SPC6.mmu.mra1.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core6_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[11]" );
     `SPC6.mmu.mra1.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core6_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[19]" );
     `SPC6.mmu.mra1.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core6_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[27]" );
     `SPC6.mmu.mra1.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core7_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[3]" );
     `SPC7.mmu.mra0.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core7_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[11]" );
     `SPC7.mmu.mra0.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core7_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[19]" );
     `SPC7.mmu.mra0.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core7_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[27]" );
     `SPC7.mmu.mra0.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core7_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[3]" );
     `SPC7.mmu.mra1.array.mem[3] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core7_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[11]" );
     `SPC7.mmu.mra1.array.mem[11] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core7_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[19]" );
     `SPC7.mmu.mra1.array.mem[19] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow3_core7_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[27]" );
     `SPC7.mmu.mra1.array.mem[27] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core0_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[4]" );
     `SPC0.mmu.mra0.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core0_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[12]" );
     `SPC0.mmu.mra0.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core0_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[20]" );
     `SPC0.mmu.mra0.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core0_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[28]" );
     `SPC0.mmu.mra0.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core0_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[4]" );
     `SPC0.mmu.mra1.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core0_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[12]" );
     `SPC0.mmu.mra1.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core0_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[20]" );
     `SPC0.mmu.mra1.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core0_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[28]" );
     `SPC0.mmu.mra1.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core1_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[4]" );
     `SPC1.mmu.mra0.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core1_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[12]" );
     `SPC1.mmu.mra0.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core1_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[20]" );
     `SPC1.mmu.mra0.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core1_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[28]" );
     `SPC1.mmu.mra0.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core1_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[4]" );
     `SPC1.mmu.mra1.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core1_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[12]" );
     `SPC1.mmu.mra1.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core1_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[20]" );
     `SPC1.mmu.mra1.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core1_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[28]" );
     `SPC1.mmu.mra1.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core2_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[4]" );
     `SPC2.mmu.mra0.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core2_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[12]" );
     `SPC2.mmu.mra0.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core2_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[20]" );
     `SPC2.mmu.mra0.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core2_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[28]" );
     `SPC2.mmu.mra0.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core2_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[4]" );
     `SPC2.mmu.mra1.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core2_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[12]" );
     `SPC2.mmu.mra1.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core2_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[20]" );
     `SPC2.mmu.mra1.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core2_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[28]" );
     `SPC2.mmu.mra1.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core3_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[4]" );
     `SPC3.mmu.mra0.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core3_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[12]" );
     `SPC3.mmu.mra0.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core3_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[20]" );
     `SPC3.mmu.mra0.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core3_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[28]" );
     `SPC3.mmu.mra0.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core3_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[4]" );
     `SPC3.mmu.mra1.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core3_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[12]" );
     `SPC3.mmu.mra1.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core3_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[20]" );
     `SPC3.mmu.mra1.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core3_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[28]" );
     `SPC3.mmu.mra1.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core4_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[4]" );
     `SPC4.mmu.mra0.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core4_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[12]" );
     `SPC4.mmu.mra0.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core4_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[20]" );
     `SPC4.mmu.mra0.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core4_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[28]" );
     `SPC4.mmu.mra0.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core4_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[4]" );
     `SPC4.mmu.mra1.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core4_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[12]" );
     `SPC4.mmu.mra1.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core4_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[20]" );
     `SPC4.mmu.mra1.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core4_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[28]" );
     `SPC4.mmu.mra1.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core5_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[4]" );
     `SPC5.mmu.mra0.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core5_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[12]" );
     `SPC5.mmu.mra0.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core5_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[20]" );
     `SPC5.mmu.mra0.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core5_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[28]" );
     `SPC5.mmu.mra0.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core5_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[4]" );
     `SPC5.mmu.mra1.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core5_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[12]" );
     `SPC5.mmu.mra1.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core5_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[20]" );
     `SPC5.mmu.mra1.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core5_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[28]" );
     `SPC5.mmu.mra1.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core6_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[4]" );
     `SPC6.mmu.mra0.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core6_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[12]" );
     `SPC6.mmu.mra0.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core6_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[20]" );
     `SPC6.mmu.mra0.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core6_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[28]" );
     `SPC6.mmu.mra0.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core6_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[4]" );
     `SPC6.mmu.mra1.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core6_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[12]" );
     `SPC6.mmu.mra1.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core6_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[20]" );
     `SPC6.mmu.mra1.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core6_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[28]" );
     `SPC6.mmu.mra1.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core7_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[4]" );
     `SPC7.mmu.mra0.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core7_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[12]" );
     `SPC7.mmu.mra0.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core7_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[20]" );
     `SPC7.mmu.mra0.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core7_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[28]" );
     `SPC7.mmu.mra0.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core7_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[4]" );
     `SPC7.mmu.mra1.array.mem[4] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core7_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[12]" );
     `SPC7.mmu.mra1.array.mem[12] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core7_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[20]" );
     `SPC7.mmu.mra1.array.mem[20] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow4_core7_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[28]" );
     `SPC7.mmu.mra1.array.mem[28] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core0_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[5]" );
     `SPC0.mmu.mra0.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core0_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[13]" );
     `SPC0.mmu.mra0.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core0_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[21]" );
     `SPC0.mmu.mra0.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core0_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[29]" );
     `SPC0.mmu.mra0.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core0_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[5]" );
     `SPC0.mmu.mra1.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core0_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[13]" );
     `SPC0.mmu.mra1.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core0_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[21]" );
     `SPC0.mmu.mra1.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core0_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[29]" );
     `SPC0.mmu.mra1.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core1_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[5]" );
     `SPC1.mmu.mra0.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core1_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[13]" );
     `SPC1.mmu.mra0.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core1_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[21]" );
     `SPC1.mmu.mra0.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core1_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[29]" );
     `SPC1.mmu.mra0.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core1_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[5]" );
     `SPC1.mmu.mra1.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core1_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[13]" );
     `SPC1.mmu.mra1.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core1_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[21]" );
     `SPC1.mmu.mra1.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core1_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[29]" );
     `SPC1.mmu.mra1.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core2_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[5]" );
     `SPC2.mmu.mra0.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core2_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[13]" );
     `SPC2.mmu.mra0.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core2_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[21]" );
     `SPC2.mmu.mra0.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core2_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[29]" );
     `SPC2.mmu.mra0.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core2_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[5]" );
     `SPC2.mmu.mra1.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core2_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[13]" );
     `SPC2.mmu.mra1.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core2_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[21]" );
     `SPC2.mmu.mra1.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core2_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[29]" );
     `SPC2.mmu.mra1.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core3_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[5]" );
     `SPC3.mmu.mra0.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core3_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[13]" );
     `SPC3.mmu.mra0.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core3_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[21]" );
     `SPC3.mmu.mra0.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core3_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[29]" );
     `SPC3.mmu.mra0.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core3_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[5]" );
     `SPC3.mmu.mra1.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core3_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[13]" );
     `SPC3.mmu.mra1.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core3_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[21]" );
     `SPC3.mmu.mra1.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core3_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[29]" );
     `SPC3.mmu.mra1.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core4_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[5]" );
     `SPC4.mmu.mra0.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core4_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[13]" );
     `SPC4.mmu.mra0.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core4_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[21]" );
     `SPC4.mmu.mra0.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core4_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[29]" );
     `SPC4.mmu.mra0.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core4_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[5]" );
     `SPC4.mmu.mra1.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core4_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[13]" );
     `SPC4.mmu.mra1.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core4_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[21]" );
     `SPC4.mmu.mra1.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core4_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[29]" );
     `SPC4.mmu.mra1.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core5_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[5]" );
     `SPC5.mmu.mra0.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core5_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[13]" );
     `SPC5.mmu.mra0.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core5_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[21]" );
     `SPC5.mmu.mra0.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core5_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[29]" );
     `SPC5.mmu.mra0.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core5_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[5]" );
     `SPC5.mmu.mra1.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core5_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[13]" );
     `SPC5.mmu.mra1.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core5_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[21]" );
     `SPC5.mmu.mra1.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core5_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[29]" );
     `SPC5.mmu.mra1.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core6_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[5]" );
     `SPC6.mmu.mra0.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core6_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[13]" );
     `SPC6.mmu.mra0.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core6_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[21]" );
     `SPC6.mmu.mra0.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core6_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[29]" );
     `SPC6.mmu.mra0.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core6_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[5]" );
     `SPC6.mmu.mra1.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core6_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[13]" );
     `SPC6.mmu.mra1.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core6_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[21]" );
     `SPC6.mmu.mra1.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core6_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[29]" );
     `SPC6.mmu.mra1.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core7_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[5]" );
     `SPC7.mmu.mra0.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core7_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[13]" );
     `SPC7.mmu.mra0.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core7_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[21]" );
     `SPC7.mmu.mra0.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core7_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[29]" );
     `SPC7.mmu.mra0.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core7_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[5]" );
     `SPC7.mmu.mra1.array.mem[5] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core7_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[13]" );
     `SPC7.mmu.mra1.array.mem[13] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core7_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[21]" );
     `SPC7.mmu.mra1.array.mem[21] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow5_core7_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[29]" );
     `SPC7.mmu.mra1.array.mem[29] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core0_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[6]" );
     `SPC0.mmu.mra0.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core0_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[14]" );
     `SPC0.mmu.mra0.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core0_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[22]" );
     `SPC0.mmu.mra0.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core0_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[30]" );
     `SPC0.mmu.mra0.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core0_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[6]" );
     `SPC0.mmu.mra1.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core0_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[14]" );
     `SPC0.mmu.mra1.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core0_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[22]" );
     `SPC0.mmu.mra1.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core0_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[30]" );
     `SPC0.mmu.mra1.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core1_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[6]" );
     `SPC1.mmu.mra0.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core1_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[14]" );
     `SPC1.mmu.mra0.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core1_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[22]" );
     `SPC1.mmu.mra0.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core1_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[30]" );
     `SPC1.mmu.mra0.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core1_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[6]" );
     `SPC1.mmu.mra1.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core1_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[14]" );
     `SPC1.mmu.mra1.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core1_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[22]" );
     `SPC1.mmu.mra1.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core1_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[30]" );
     `SPC1.mmu.mra1.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core2_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[6]" );
     `SPC2.mmu.mra0.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core2_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[14]" );
     `SPC2.mmu.mra0.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core2_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[22]" );
     `SPC2.mmu.mra0.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core2_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[30]" );
     `SPC2.mmu.mra0.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core2_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[6]" );
     `SPC2.mmu.mra1.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core2_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[14]" );
     `SPC2.mmu.mra1.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core2_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[22]" );
     `SPC2.mmu.mra1.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core2_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[30]" );
     `SPC2.mmu.mra1.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core3_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[6]" );
     `SPC3.mmu.mra0.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core3_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[14]" );
     `SPC3.mmu.mra0.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core3_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[22]" );
     `SPC3.mmu.mra0.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core3_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[30]" );
     `SPC3.mmu.mra0.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core3_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[6]" );
     `SPC3.mmu.mra1.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core3_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[14]" );
     `SPC3.mmu.mra1.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core3_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[22]" );
     `SPC3.mmu.mra1.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core3_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[30]" );
     `SPC3.mmu.mra1.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core4_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[6]" );
     `SPC4.mmu.mra0.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core4_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[14]" );
     `SPC4.mmu.mra0.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core4_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[22]" );
     `SPC4.mmu.mra0.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core4_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[30]" );
     `SPC4.mmu.mra0.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core4_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[6]" );
     `SPC4.mmu.mra1.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core4_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[14]" );
     `SPC4.mmu.mra1.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core4_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[22]" );
     `SPC4.mmu.mra1.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core4_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[30]" );
     `SPC4.mmu.mra1.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core5_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[6]" );
     `SPC5.mmu.mra0.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core5_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[14]" );
     `SPC5.mmu.mra0.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core5_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[22]" );
     `SPC5.mmu.mra0.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core5_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[30]" );
     `SPC5.mmu.mra0.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core5_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[6]" );
     `SPC5.mmu.mra1.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core5_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[14]" );
     `SPC5.mmu.mra1.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core5_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[22]" );
     `SPC5.mmu.mra1.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core5_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[30]" );
     `SPC5.mmu.mra1.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core6_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[6]" );
     `SPC6.mmu.mra0.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core6_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[14]" );
     `SPC6.mmu.mra0.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core6_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[22]" );
     `SPC6.mmu.mra0.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core6_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[30]" );
     `SPC6.mmu.mra0.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core6_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[6]" );
     `SPC6.mmu.mra1.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core6_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[14]" );
     `SPC6.mmu.mra1.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core6_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[22]" );
     `SPC6.mmu.mra1.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core6_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[30]" );
     `SPC6.mmu.mra1.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core7_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[6]" );
     `SPC7.mmu.mra0.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core7_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[14]" );
     `SPC7.mmu.mra0.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core7_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[22]" );
     `SPC7.mmu.mra0.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core7_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[30]" );
     `SPC7.mmu.mra0.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core7_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[6]" );
     `SPC7.mmu.mra1.array.mem[6] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core7_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[14]" );
     `SPC7.mmu.mra1.array.mem[14] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core7_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[22]" );
     `SPC7.mmu.mra1.array.mem[22] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow6_core7_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[30]" );
     `SPC7.mmu.mra1.array.mem[30] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core0_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[7]" );
     `SPC0.mmu.mra0.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core0_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[15]" );
     `SPC0.mmu.mra0.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core0_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[23]" );
     `SPC0.mmu.mra0.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core0_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[31]" );
     `SPC0.mmu.mra0.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core0_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[7]" );
     `SPC0.mmu.mra1.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core0_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[15]" );
     `SPC0.mmu.mra1.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core0_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[23]" );
     `SPC0.mmu.mra1.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core0_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[31]" );
     `SPC0.mmu.mra1.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core1_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[7]" );
     `SPC1.mmu.mra0.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core1_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[15]" );
     `SPC1.mmu.mra0.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core1_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[23]" );
     `SPC1.mmu.mra0.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core1_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[31]" );
     `SPC1.mmu.mra0.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core1_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[7]" );
     `SPC1.mmu.mra1.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core1_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[15]" );
     `SPC1.mmu.mra1.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core1_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[23]" );
     `SPC1.mmu.mra1.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core1_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[31]" );
     `SPC1.mmu.mra1.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core2_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[7]" );
     `SPC2.mmu.mra0.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core2_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[15]" );
     `SPC2.mmu.mra0.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core2_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[23]" );
     `SPC2.mmu.mra0.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core2_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[31]" );
     `SPC2.mmu.mra0.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core2_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[7]" );
     `SPC2.mmu.mra1.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core2_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[15]" );
     `SPC2.mmu.mra1.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core2_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[23]" );
     `SPC2.mmu.mra1.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core2_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[31]" );
     `SPC2.mmu.mra1.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core3_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[7]" );
     `SPC3.mmu.mra0.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core3_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[15]" );
     `SPC3.mmu.mra0.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core3_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[23]" );
     `SPC3.mmu.mra0.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core3_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[31]" );
     `SPC3.mmu.mra0.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core3_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[7]" );
     `SPC3.mmu.mra1.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core3_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[15]" );
     `SPC3.mmu.mra1.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core3_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[23]" );
     `SPC3.mmu.mra1.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core3_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[31]" );
     `SPC3.mmu.mra1.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core4_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[7]" );
     `SPC4.mmu.mra0.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core4_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[15]" );
     `SPC4.mmu.mra0.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core4_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[23]" );
     `SPC4.mmu.mra0.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core4_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[31]" );
     `SPC4.mmu.mra0.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core4_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[7]" );
     `SPC4.mmu.mra1.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core4_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[15]" );
     `SPC4.mmu.mra1.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core4_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[23]" );
     `SPC4.mmu.mra1.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core4_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[31]" );
     `SPC4.mmu.mra1.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core5_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[7]" );
     `SPC5.mmu.mra0.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core5_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[15]" );
     `SPC5.mmu.mra0.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core5_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[23]" );
     `SPC5.mmu.mra0.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core5_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[31]" );
     `SPC5.mmu.mra0.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core5_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[7]" );
     `SPC5.mmu.mra1.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core5_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[15]" );
     `SPC5.mmu.mra1.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core5_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[23]" );
     `SPC5.mmu.mra1.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core5_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[31]" );
     `SPC5.mmu.mra1.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core6_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[7]" );
     `SPC6.mmu.mra0.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core6_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[15]" );
     `SPC6.mmu.mra0.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core6_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[23]" );
     `SPC6.mmu.mra0.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core6_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[31]" );
     `SPC6.mmu.mra0.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core6_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[7]" );
     `SPC6.mmu.mra1.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core6_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[15]" );
     `SPC6.mmu.mra1.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core6_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[23]" );
     `SPC6.mmu.mra1.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core6_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[31]" );
     `SPC6.mmu.mra1.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core7_thread0;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[7]" );
     `SPC7.mmu.mra0.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core7_thread1;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[15]" );
     `SPC7.mmu.mra0.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core7_thread2;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[23]" );
     `SPC7.mmu.mra0.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core7_thread3;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra0.array.mem[31]" );
     `SPC7.mmu.mra0.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core7_thread4;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[7]" );
     `SPC7.mmu.mra1.array.mem[7] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core7_thread5;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[15]" );
     `SPC7.mmu.mra1.array.mem[15] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core7_thread6;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[23]" );
     `SPC7.mmu.mra1.array.mem[23] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_MraRow7_core7_thread7;
    input [127:0] value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
     value[82] = ^value[40:0];
     value[83] = ^value[81:41];
 $display("Writing a value of %0h to MRA  %s\n", value," mmu.mra1.array.mem[31]" );
     `SPC7.mmu.mra1.array.mem[31] <= value;
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig0_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h10, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig1_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h18, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig2_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h20, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_ZeroTsbConfig3_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h28, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig0_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h30, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig1_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h38, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig2_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h40, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  0, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  1, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  2, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  3, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  4, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  5, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  6, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 0, 54, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 1, 54, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 2, 54, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 3, 54, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 4, 54, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 5, 54, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 6, 54, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_NonZeroTsbConfig3_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x54 val=0x%h",  7, 7, 54, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h54, 64'h48, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange0_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h108, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange1_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h110, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange2_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h118, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_RealRange3_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h120, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset0_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h208, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset1_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h210, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset2_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h218, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core0_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core0_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core0_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core0_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core0_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core0_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core0_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  0, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core1_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core1_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core1_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core1_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core1_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core1_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core1_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  1, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core2_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core2_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core2_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core2_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core2_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core2_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core2_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  2, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core3_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core3_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core3_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core3_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core3_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core3_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core3_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  3, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core4_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core4_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core4_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core4_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core4_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core4_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core4_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  4, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core5_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core5_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core5_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core5_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core5_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core5_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core5_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  5, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core6_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core6_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core6_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core6_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core6_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core6_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core6_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  6, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 0, 52, value);
      tid  = 0
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core7_thread1;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 1, 52, value);
      tid  = 1
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core7_thread2;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 2, 52, value);
      tid  = 2
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core7_thread3;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 3, 52, value);
      tid  = 3
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core7_thread4;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 4, 52, value);
      tid  = 4
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core7_thread5;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 5, 52, value);
      tid  = 5
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core7_thread6;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 6, 52, value);
      tid  = 6
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_PhysicalOffset3_core7_thread7;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
    if (`PARGS.nas_check_on) begin
      `PR_INFO("pli_reg_slam", `INFO, "C%0d T%0d PLI_ASI_WRITE ASI=0x%h VA=0x52 val=0x%h",  7, 7, 52, value);
      tid  = 7
;      junk = $sim_send(`PLI_ASI_WRITE, tid, 8'h52, 64'h220, value);
    end
`endif

`endif

`endif

    end
  endtask


  task slam_HwTwEnableConfig_core0_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_0
 @(posedge `SPC0.mmu.asi.l1clk_pm1);
 force `SPC0.mmu.asi.t0_e_nz_in = value[3:0];
 force `SPC0.mmu.asi.t0_e_z_in = value[7:4];
 force `SPC0.mmu.asi.t1_e_nz_in = value[11:8];
 force `SPC0.mmu.asi.t1_e_z_in = value[15:12];
 force `SPC0.mmu.asi.t2_e_nz_in = value[19:16];
 force `SPC0.mmu.asi.t2_e_z_in = value[23:20];
 force `SPC0.mmu.asi.t3_e_nz_in = value[27:24];
 force `SPC0.mmu.asi.t3_e_z_in = value[31:28];
 force `SPC0.mmu.asi.t4_e_nz_in = value[35:32];
 force `SPC0.mmu.asi.t4_e_z_in = value[39:36];
 force `SPC0.mmu.asi.t5_e_nz_in = value[43:40];
 force `SPC0.mmu.asi.t5_e_z_in = value[47:44];
 force `SPC0.mmu.asi.t6_e_nz_in = value[51:48];
 force `SPC0.mmu.asi.t6_e_z_in = value[55:52];
 force `SPC0.mmu.asi.t7_e_nz_in = value[59:56];
 force `SPC0.mmu.asi.t7_e_z_in = value[63:60];
 force `SPC0.mmu.asi.t0_e_nz = value[3:0];
 force `SPC0.mmu.asi.t0_e_z = value[7:4];
 force `SPC0.mmu.asi.t1_e_nz = value[11:8];
 force `SPC0.mmu.asi.t1_e_z = value[15:12];
 force `SPC0.mmu.asi.t2_e_nz = value[19:16];
 force `SPC0.mmu.asi.t2_e_z = value[23:20];
 force `SPC0.mmu.asi.t3_e_nz = value[27:24];
 force `SPC0.mmu.asi.t3_e_z = value[31:28];
 force `SPC0.mmu.asi.t4_e_nz = value[35:32];
 force `SPC0.mmu.asi.t4_e_z = value[39:36];
 force `SPC0.mmu.asi.t5_e_nz = value[43:40];
 force `SPC0.mmu.asi.t5_e_z = value[47:44];
 force `SPC0.mmu.asi.t6_e_nz = value[51:48];
 force `SPC0.mmu.asi.t6_e_z = value[55:52];
 force `SPC0.mmu.asi.t7_e_nz = value[59:56];
 force `SPC0.mmu.asi.t7_e_z = value[63:60];
 @(posedge `SPC0.mmu.asi.l1clk_pm1);
 release `SPC0.mmu.asi.t0_e_nz_in;
 release `SPC0.mmu.asi.t0_e_z_in;
 release `SPC0.mmu.asi.t1_e_nz_in;
 release `SPC0.mmu.asi.t1_e_z_in;
 release `SPC0.mmu.asi.t2_e_nz_in;
 release `SPC0.mmu.asi.t2_e_z_in;
 release `SPC0.mmu.asi.t3_e_nz_in;
 release `SPC0.mmu.asi.t3_e_z_in;
 release `SPC0.mmu.asi.t4_e_nz_in;
 release `SPC0.mmu.asi.t4_e_z_in;
 release `SPC0.mmu.asi.t5_e_nz_in;
 release `SPC0.mmu.asi.t5_e_z_in;
 release `SPC0.mmu.asi.t6_e_nz_in;
 release `SPC0.mmu.asi.t6_e_z_in;
 release `SPC0.mmu.asi.t7_e_nz_in;
 release `SPC0.mmu.asi.t7_e_z_in;
 release `SPC0.mmu.asi.t0_e_nz;
 release `SPC0.mmu.asi.t0_e_z;
 release `SPC0.mmu.asi.t1_e_nz;
 release `SPC0.mmu.asi.t1_e_z;
 release `SPC0.mmu.asi.t2_e_nz;
 release `SPC0.mmu.asi.t2_e_z;
 release `SPC0.mmu.asi.t3_e_nz;
 release `SPC0.mmu.asi.t3_e_z;
 release `SPC0.mmu.asi.t4_e_nz;
 release `SPC0.mmu.asi.t4_e_z;
 release `SPC0.mmu.asi.t5_e_nz;
 release `SPC0.mmu.asi.t5_e_z;
 release `SPC0.mmu.asi.t6_e_nz;
 release `SPC0.mmu.asi.t6_e_z;
 release `SPC0.mmu.asi.t7_e_nz;
 release `SPC0.mmu.asi.t7_e_z;
`endif

`endif

`endif

    end
  endtask


  task slam_HwTwEnableConfig_core1_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_1
 @(posedge `SPC1.mmu.asi.l1clk_pm1);
 force `SPC1.mmu.asi.t0_e_nz_in = value[3:0];
 force `SPC1.mmu.asi.t0_e_z_in = value[7:4];
 force `SPC1.mmu.asi.t1_e_nz_in = value[11:8];
 force `SPC1.mmu.asi.t1_e_z_in = value[15:12];
 force `SPC1.mmu.asi.t2_e_nz_in = value[19:16];
 force `SPC1.mmu.asi.t2_e_z_in = value[23:20];
 force `SPC1.mmu.asi.t3_e_nz_in = value[27:24];
 force `SPC1.mmu.asi.t3_e_z_in = value[31:28];
 force `SPC1.mmu.asi.t4_e_nz_in = value[35:32];
 force `SPC1.mmu.asi.t4_e_z_in = value[39:36];
 force `SPC1.mmu.asi.t5_e_nz_in = value[43:40];
 force `SPC1.mmu.asi.t5_e_z_in = value[47:44];
 force `SPC1.mmu.asi.t6_e_nz_in = value[51:48];
 force `SPC1.mmu.asi.t6_e_z_in = value[55:52];
 force `SPC1.mmu.asi.t7_e_nz_in = value[59:56];
 force `SPC1.mmu.asi.t7_e_z_in = value[63:60];
 force `SPC1.mmu.asi.t0_e_nz = value[3:0];
 force `SPC1.mmu.asi.t0_e_z = value[7:4];
 force `SPC1.mmu.asi.t1_e_nz = value[11:8];
 force `SPC1.mmu.asi.t1_e_z = value[15:12];
 force `SPC1.mmu.asi.t2_e_nz = value[19:16];
 force `SPC1.mmu.asi.t2_e_z = value[23:20];
 force `SPC1.mmu.asi.t3_e_nz = value[27:24];
 force `SPC1.mmu.asi.t3_e_z = value[31:28];
 force `SPC1.mmu.asi.t4_e_nz = value[35:32];
 force `SPC1.mmu.asi.t4_e_z = value[39:36];
 force `SPC1.mmu.asi.t5_e_nz = value[43:40];
 force `SPC1.mmu.asi.t5_e_z = value[47:44];
 force `SPC1.mmu.asi.t6_e_nz = value[51:48];
 force `SPC1.mmu.asi.t6_e_z = value[55:52];
 force `SPC1.mmu.asi.t7_e_nz = value[59:56];
 force `SPC1.mmu.asi.t7_e_z = value[63:60];
 @(posedge `SPC1.mmu.asi.l1clk_pm1);
 release `SPC1.mmu.asi.t0_e_nz_in;
 release `SPC1.mmu.asi.t0_e_z_in;
 release `SPC1.mmu.asi.t1_e_nz_in;
 release `SPC1.mmu.asi.t1_e_z_in;
 release `SPC1.mmu.asi.t2_e_nz_in;
 release `SPC1.mmu.asi.t2_e_z_in;
 release `SPC1.mmu.asi.t3_e_nz_in;
 release `SPC1.mmu.asi.t3_e_z_in;
 release `SPC1.mmu.asi.t4_e_nz_in;
 release `SPC1.mmu.asi.t4_e_z_in;
 release `SPC1.mmu.asi.t5_e_nz_in;
 release `SPC1.mmu.asi.t5_e_z_in;
 release `SPC1.mmu.asi.t6_e_nz_in;
 release `SPC1.mmu.asi.t6_e_z_in;
 release `SPC1.mmu.asi.t7_e_nz_in;
 release `SPC1.mmu.asi.t7_e_z_in;
 release `SPC1.mmu.asi.t0_e_nz;
 release `SPC1.mmu.asi.t0_e_z;
 release `SPC1.mmu.asi.t1_e_nz;
 release `SPC1.mmu.asi.t1_e_z;
 release `SPC1.mmu.asi.t2_e_nz;
 release `SPC1.mmu.asi.t2_e_z;
 release `SPC1.mmu.asi.t3_e_nz;
 release `SPC1.mmu.asi.t3_e_z;
 release `SPC1.mmu.asi.t4_e_nz;
 release `SPC1.mmu.asi.t4_e_z;
 release `SPC1.mmu.asi.t5_e_nz;
 release `SPC1.mmu.asi.t5_e_z;
 release `SPC1.mmu.asi.t6_e_nz;
 release `SPC1.mmu.asi.t6_e_z;
 release `SPC1.mmu.asi.t7_e_nz;
 release `SPC1.mmu.asi.t7_e_z;
`endif

`endif

`endif

    end
  endtask


  task slam_HwTwEnableConfig_core2_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_2
 @(posedge `SPC2.mmu.asi.l1clk_pm1);
 force `SPC2.mmu.asi.t0_e_nz_in = value[3:0];
 force `SPC2.mmu.asi.t0_e_z_in = value[7:4];
 force `SPC2.mmu.asi.t1_e_nz_in = value[11:8];
 force `SPC2.mmu.asi.t1_e_z_in = value[15:12];
 force `SPC2.mmu.asi.t2_e_nz_in = value[19:16];
 force `SPC2.mmu.asi.t2_e_z_in = value[23:20];
 force `SPC2.mmu.asi.t3_e_nz_in = value[27:24];
 force `SPC2.mmu.asi.t3_e_z_in = value[31:28];
 force `SPC2.mmu.asi.t4_e_nz_in = value[35:32];
 force `SPC2.mmu.asi.t4_e_z_in = value[39:36];
 force `SPC2.mmu.asi.t5_e_nz_in = value[43:40];
 force `SPC2.mmu.asi.t5_e_z_in = value[47:44];
 force `SPC2.mmu.asi.t6_e_nz_in = value[51:48];
 force `SPC2.mmu.asi.t6_e_z_in = value[55:52];
 force `SPC2.mmu.asi.t7_e_nz_in = value[59:56];
 force `SPC2.mmu.asi.t7_e_z_in = value[63:60];
 force `SPC2.mmu.asi.t0_e_nz = value[3:0];
 force `SPC2.mmu.asi.t0_e_z = value[7:4];
 force `SPC2.mmu.asi.t1_e_nz = value[11:8];
 force `SPC2.mmu.asi.t1_e_z = value[15:12];
 force `SPC2.mmu.asi.t2_e_nz = value[19:16];
 force `SPC2.mmu.asi.t2_e_z = value[23:20];
 force `SPC2.mmu.asi.t3_e_nz = value[27:24];
 force `SPC2.mmu.asi.t3_e_z = value[31:28];
 force `SPC2.mmu.asi.t4_e_nz = value[35:32];
 force `SPC2.mmu.asi.t4_e_z = value[39:36];
 force `SPC2.mmu.asi.t5_e_nz = value[43:40];
 force `SPC2.mmu.asi.t5_e_z = value[47:44];
 force `SPC2.mmu.asi.t6_e_nz = value[51:48];
 force `SPC2.mmu.asi.t6_e_z = value[55:52];
 force `SPC2.mmu.asi.t7_e_nz = value[59:56];
 force `SPC2.mmu.asi.t7_e_z = value[63:60];
 @(posedge `SPC2.mmu.asi.l1clk_pm1);
 release `SPC2.mmu.asi.t0_e_nz_in;
 release `SPC2.mmu.asi.t0_e_z_in;
 release `SPC2.mmu.asi.t1_e_nz_in;
 release `SPC2.mmu.asi.t1_e_z_in;
 release `SPC2.mmu.asi.t2_e_nz_in;
 release `SPC2.mmu.asi.t2_e_z_in;
 release `SPC2.mmu.asi.t3_e_nz_in;
 release `SPC2.mmu.asi.t3_e_z_in;
 release `SPC2.mmu.asi.t4_e_nz_in;
 release `SPC2.mmu.asi.t4_e_z_in;
 release `SPC2.mmu.asi.t5_e_nz_in;
 release `SPC2.mmu.asi.t5_e_z_in;
 release `SPC2.mmu.asi.t6_e_nz_in;
 release `SPC2.mmu.asi.t6_e_z_in;
 release `SPC2.mmu.asi.t7_e_nz_in;
 release `SPC2.mmu.asi.t7_e_z_in;
 release `SPC2.mmu.asi.t0_e_nz;
 release `SPC2.mmu.asi.t0_e_z;
 release `SPC2.mmu.asi.t1_e_nz;
 release `SPC2.mmu.asi.t1_e_z;
 release `SPC2.mmu.asi.t2_e_nz;
 release `SPC2.mmu.asi.t2_e_z;
 release `SPC2.mmu.asi.t3_e_nz;
 release `SPC2.mmu.asi.t3_e_z;
 release `SPC2.mmu.asi.t4_e_nz;
 release `SPC2.mmu.asi.t4_e_z;
 release `SPC2.mmu.asi.t5_e_nz;
 release `SPC2.mmu.asi.t5_e_z;
 release `SPC2.mmu.asi.t6_e_nz;
 release `SPC2.mmu.asi.t6_e_z;
 release `SPC2.mmu.asi.t7_e_nz;
 release `SPC2.mmu.asi.t7_e_z;
`endif

`endif

`endif

    end
  endtask


  task slam_HwTwEnableConfig_core3_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_3
 @(posedge `SPC3.mmu.asi.l1clk_pm1);
 force `SPC3.mmu.asi.t0_e_nz_in = value[3:0];
 force `SPC3.mmu.asi.t0_e_z_in = value[7:4];
 force `SPC3.mmu.asi.t1_e_nz_in = value[11:8];
 force `SPC3.mmu.asi.t1_e_z_in = value[15:12];
 force `SPC3.mmu.asi.t2_e_nz_in = value[19:16];
 force `SPC3.mmu.asi.t2_e_z_in = value[23:20];
 force `SPC3.mmu.asi.t3_e_nz_in = value[27:24];
 force `SPC3.mmu.asi.t3_e_z_in = value[31:28];
 force `SPC3.mmu.asi.t4_e_nz_in = value[35:32];
 force `SPC3.mmu.asi.t4_e_z_in = value[39:36];
 force `SPC3.mmu.asi.t5_e_nz_in = value[43:40];
 force `SPC3.mmu.asi.t5_e_z_in = value[47:44];
 force `SPC3.mmu.asi.t6_e_nz_in = value[51:48];
 force `SPC3.mmu.asi.t6_e_z_in = value[55:52];
 force `SPC3.mmu.asi.t7_e_nz_in = value[59:56];
 force `SPC3.mmu.asi.t7_e_z_in = value[63:60];
 force `SPC3.mmu.asi.t0_e_nz = value[3:0];
 force `SPC3.mmu.asi.t0_e_z = value[7:4];
 force `SPC3.mmu.asi.t1_e_nz = value[11:8];
 force `SPC3.mmu.asi.t1_e_z = value[15:12];
 force `SPC3.mmu.asi.t2_e_nz = value[19:16];
 force `SPC3.mmu.asi.t2_e_z = value[23:20];
 force `SPC3.mmu.asi.t3_e_nz = value[27:24];
 force `SPC3.mmu.asi.t3_e_z = value[31:28];
 force `SPC3.mmu.asi.t4_e_nz = value[35:32];
 force `SPC3.mmu.asi.t4_e_z = value[39:36];
 force `SPC3.mmu.asi.t5_e_nz = value[43:40];
 force `SPC3.mmu.asi.t5_e_z = value[47:44];
 force `SPC3.mmu.asi.t6_e_nz = value[51:48];
 force `SPC3.mmu.asi.t6_e_z = value[55:52];
 force `SPC3.mmu.asi.t7_e_nz = value[59:56];
 force `SPC3.mmu.asi.t7_e_z = value[63:60];
 @(posedge `SPC3.mmu.asi.l1clk_pm1);
 release `SPC3.mmu.asi.t0_e_nz_in;
 release `SPC3.mmu.asi.t0_e_z_in;
 release `SPC3.mmu.asi.t1_e_nz_in;
 release `SPC3.mmu.asi.t1_e_z_in;
 release `SPC3.mmu.asi.t2_e_nz_in;
 release `SPC3.mmu.asi.t2_e_z_in;
 release `SPC3.mmu.asi.t3_e_nz_in;
 release `SPC3.mmu.asi.t3_e_z_in;
 release `SPC3.mmu.asi.t4_e_nz_in;
 release `SPC3.mmu.asi.t4_e_z_in;
 release `SPC3.mmu.asi.t5_e_nz_in;
 release `SPC3.mmu.asi.t5_e_z_in;
 release `SPC3.mmu.asi.t6_e_nz_in;
 release `SPC3.mmu.asi.t6_e_z_in;
 release `SPC3.mmu.asi.t7_e_nz_in;
 release `SPC3.mmu.asi.t7_e_z_in;
 release `SPC3.mmu.asi.t0_e_nz;
 release `SPC3.mmu.asi.t0_e_z;
 release `SPC3.mmu.asi.t1_e_nz;
 release `SPC3.mmu.asi.t1_e_z;
 release `SPC3.mmu.asi.t2_e_nz;
 release `SPC3.mmu.asi.t2_e_z;
 release `SPC3.mmu.asi.t3_e_nz;
 release `SPC3.mmu.asi.t3_e_z;
 release `SPC3.mmu.asi.t4_e_nz;
 release `SPC3.mmu.asi.t4_e_z;
 release `SPC3.mmu.asi.t5_e_nz;
 release `SPC3.mmu.asi.t5_e_z;
 release `SPC3.mmu.asi.t6_e_nz;
 release `SPC3.mmu.asi.t6_e_z;
 release `SPC3.mmu.asi.t7_e_nz;
 release `SPC3.mmu.asi.t7_e_z;
`endif

`endif

`endif

    end
  endtask


  task slam_HwTwEnableConfig_core4_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_4
 @(posedge `SPC4.mmu.asi.l1clk_pm1);
 force `SPC4.mmu.asi.t0_e_nz_in = value[3:0];
 force `SPC4.mmu.asi.t0_e_z_in = value[7:4];
 force `SPC4.mmu.asi.t1_e_nz_in = value[11:8];
 force `SPC4.mmu.asi.t1_e_z_in = value[15:12];
 force `SPC4.mmu.asi.t2_e_nz_in = value[19:16];
 force `SPC4.mmu.asi.t2_e_z_in = value[23:20];
 force `SPC4.mmu.asi.t3_e_nz_in = value[27:24];
 force `SPC4.mmu.asi.t3_e_z_in = value[31:28];
 force `SPC4.mmu.asi.t4_e_nz_in = value[35:32];
 force `SPC4.mmu.asi.t4_e_z_in = value[39:36];
 force `SPC4.mmu.asi.t5_e_nz_in = value[43:40];
 force `SPC4.mmu.asi.t5_e_z_in = value[47:44];
 force `SPC4.mmu.asi.t6_e_nz_in = value[51:48];
 force `SPC4.mmu.asi.t6_e_z_in = value[55:52];
 force `SPC4.mmu.asi.t7_e_nz_in = value[59:56];
 force `SPC4.mmu.asi.t7_e_z_in = value[63:60];
 force `SPC4.mmu.asi.t0_e_nz = value[3:0];
 force `SPC4.mmu.asi.t0_e_z = value[7:4];
 force `SPC4.mmu.asi.t1_e_nz = value[11:8];
 force `SPC4.mmu.asi.t1_e_z = value[15:12];
 force `SPC4.mmu.asi.t2_e_nz = value[19:16];
 force `SPC4.mmu.asi.t2_e_z = value[23:20];
 force `SPC4.mmu.asi.t3_e_nz = value[27:24];
 force `SPC4.mmu.asi.t3_e_z = value[31:28];
 force `SPC4.mmu.asi.t4_e_nz = value[35:32];
 force `SPC4.mmu.asi.t4_e_z = value[39:36];
 force `SPC4.mmu.asi.t5_e_nz = value[43:40];
 force `SPC4.mmu.asi.t5_e_z = value[47:44];
 force `SPC4.mmu.asi.t6_e_nz = value[51:48];
 force `SPC4.mmu.asi.t6_e_z = value[55:52];
 force `SPC4.mmu.asi.t7_e_nz = value[59:56];
 force `SPC4.mmu.asi.t7_e_z = value[63:60];
 @(posedge `SPC4.mmu.asi.l1clk_pm1);
 release `SPC4.mmu.asi.t0_e_nz_in;
 release `SPC4.mmu.asi.t0_e_z_in;
 release `SPC4.mmu.asi.t1_e_nz_in;
 release `SPC4.mmu.asi.t1_e_z_in;
 release `SPC4.mmu.asi.t2_e_nz_in;
 release `SPC4.mmu.asi.t2_e_z_in;
 release `SPC4.mmu.asi.t3_e_nz_in;
 release `SPC4.mmu.asi.t3_e_z_in;
 release `SPC4.mmu.asi.t4_e_nz_in;
 release `SPC4.mmu.asi.t4_e_z_in;
 release `SPC4.mmu.asi.t5_e_nz_in;
 release `SPC4.mmu.asi.t5_e_z_in;
 release `SPC4.mmu.asi.t6_e_nz_in;
 release `SPC4.mmu.asi.t6_e_z_in;
 release `SPC4.mmu.asi.t7_e_nz_in;
 release `SPC4.mmu.asi.t7_e_z_in;
 release `SPC4.mmu.asi.t0_e_nz;
 release `SPC4.mmu.asi.t0_e_z;
 release `SPC4.mmu.asi.t1_e_nz;
 release `SPC4.mmu.asi.t1_e_z;
 release `SPC4.mmu.asi.t2_e_nz;
 release `SPC4.mmu.asi.t2_e_z;
 release `SPC4.mmu.asi.t3_e_nz;
 release `SPC4.mmu.asi.t3_e_z;
 release `SPC4.mmu.asi.t4_e_nz;
 release `SPC4.mmu.asi.t4_e_z;
 release `SPC4.mmu.asi.t5_e_nz;
 release `SPC4.mmu.asi.t5_e_z;
 release `SPC4.mmu.asi.t6_e_nz;
 release `SPC4.mmu.asi.t6_e_z;
 release `SPC4.mmu.asi.t7_e_nz;
 release `SPC4.mmu.asi.t7_e_z;
`endif

`endif

`endif

    end
  endtask


  task slam_HwTwEnableConfig_core5_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_5
 @(posedge `SPC5.mmu.asi.l1clk_pm1);
 force `SPC5.mmu.asi.t0_e_nz_in = value[3:0];
 force `SPC5.mmu.asi.t0_e_z_in = value[7:4];
 force `SPC5.mmu.asi.t1_e_nz_in = value[11:8];
 force `SPC5.mmu.asi.t1_e_z_in = value[15:12];
 force `SPC5.mmu.asi.t2_e_nz_in = value[19:16];
 force `SPC5.mmu.asi.t2_e_z_in = value[23:20];
 force `SPC5.mmu.asi.t3_e_nz_in = value[27:24];
 force `SPC5.mmu.asi.t3_e_z_in = value[31:28];
 force `SPC5.mmu.asi.t4_e_nz_in = value[35:32];
 force `SPC5.mmu.asi.t4_e_z_in = value[39:36];
 force `SPC5.mmu.asi.t5_e_nz_in = value[43:40];
 force `SPC5.mmu.asi.t5_e_z_in = value[47:44];
 force `SPC5.mmu.asi.t6_e_nz_in = value[51:48];
 force `SPC5.mmu.asi.t6_e_z_in = value[55:52];
 force `SPC5.mmu.asi.t7_e_nz_in = value[59:56];
 force `SPC5.mmu.asi.t7_e_z_in = value[63:60];
 force `SPC5.mmu.asi.t0_e_nz = value[3:0];
 force `SPC5.mmu.asi.t0_e_z = value[7:4];
 force `SPC5.mmu.asi.t1_e_nz = value[11:8];
 force `SPC5.mmu.asi.t1_e_z = value[15:12];
 force `SPC5.mmu.asi.t2_e_nz = value[19:16];
 force `SPC5.mmu.asi.t2_e_z = value[23:20];
 force `SPC5.mmu.asi.t3_e_nz = value[27:24];
 force `SPC5.mmu.asi.t3_e_z = value[31:28];
 force `SPC5.mmu.asi.t4_e_nz = value[35:32];
 force `SPC5.mmu.asi.t4_e_z = value[39:36];
 force `SPC5.mmu.asi.t5_e_nz = value[43:40];
 force `SPC5.mmu.asi.t5_e_z = value[47:44];
 force `SPC5.mmu.asi.t6_e_nz = value[51:48];
 force `SPC5.mmu.asi.t6_e_z = value[55:52];
 force `SPC5.mmu.asi.t7_e_nz = value[59:56];
 force `SPC5.mmu.asi.t7_e_z = value[63:60];
 @(posedge `SPC5.mmu.asi.l1clk_pm1);
 release `SPC5.mmu.asi.t0_e_nz_in;
 release `SPC5.mmu.asi.t0_e_z_in;
 release `SPC5.mmu.asi.t1_e_nz_in;
 release `SPC5.mmu.asi.t1_e_z_in;
 release `SPC5.mmu.asi.t2_e_nz_in;
 release `SPC5.mmu.asi.t2_e_z_in;
 release `SPC5.mmu.asi.t3_e_nz_in;
 release `SPC5.mmu.asi.t3_e_z_in;
 release `SPC5.mmu.asi.t4_e_nz_in;
 release `SPC5.mmu.asi.t4_e_z_in;
 release `SPC5.mmu.asi.t5_e_nz_in;
 release `SPC5.mmu.asi.t5_e_z_in;
 release `SPC5.mmu.asi.t6_e_nz_in;
 release `SPC5.mmu.asi.t6_e_z_in;
 release `SPC5.mmu.asi.t7_e_nz_in;
 release `SPC5.mmu.asi.t7_e_z_in;
 release `SPC5.mmu.asi.t0_e_nz;
 release `SPC5.mmu.asi.t0_e_z;
 release `SPC5.mmu.asi.t1_e_nz;
 release `SPC5.mmu.asi.t1_e_z;
 release `SPC5.mmu.asi.t2_e_nz;
 release `SPC5.mmu.asi.t2_e_z;
 release `SPC5.mmu.asi.t3_e_nz;
 release `SPC5.mmu.asi.t3_e_z;
 release `SPC5.mmu.asi.t4_e_nz;
 release `SPC5.mmu.asi.t4_e_z;
 release `SPC5.mmu.asi.t5_e_nz;
 release `SPC5.mmu.asi.t5_e_z;
 release `SPC5.mmu.asi.t6_e_nz;
 release `SPC5.mmu.asi.t6_e_z;
 release `SPC5.mmu.asi.t7_e_nz;
 release `SPC5.mmu.asi.t7_e_z;
`endif

`endif

`endif

    end
  endtask


  task slam_HwTwEnableConfig_core6_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_6
 @(posedge `SPC6.mmu.asi.l1clk_pm1);
 force `SPC6.mmu.asi.t0_e_nz_in = value[3:0];
 force `SPC6.mmu.asi.t0_e_z_in = value[7:4];
 force `SPC6.mmu.asi.t1_e_nz_in = value[11:8];
 force `SPC6.mmu.asi.t1_e_z_in = value[15:12];
 force `SPC6.mmu.asi.t2_e_nz_in = value[19:16];
 force `SPC6.mmu.asi.t2_e_z_in = value[23:20];
 force `SPC6.mmu.asi.t3_e_nz_in = value[27:24];
 force `SPC6.mmu.asi.t3_e_z_in = value[31:28];
 force `SPC6.mmu.asi.t4_e_nz_in = value[35:32];
 force `SPC6.mmu.asi.t4_e_z_in = value[39:36];
 force `SPC6.mmu.asi.t5_e_nz_in = value[43:40];
 force `SPC6.mmu.asi.t5_e_z_in = value[47:44];
 force `SPC6.mmu.asi.t6_e_nz_in = value[51:48];
 force `SPC6.mmu.asi.t6_e_z_in = value[55:52];
 force `SPC6.mmu.asi.t7_e_nz_in = value[59:56];
 force `SPC6.mmu.asi.t7_e_z_in = value[63:60];
 force `SPC6.mmu.asi.t0_e_nz = value[3:0];
 force `SPC6.mmu.asi.t0_e_z = value[7:4];
 force `SPC6.mmu.asi.t1_e_nz = value[11:8];
 force `SPC6.mmu.asi.t1_e_z = value[15:12];
 force `SPC6.mmu.asi.t2_e_nz = value[19:16];
 force `SPC6.mmu.asi.t2_e_z = value[23:20];
 force `SPC6.mmu.asi.t3_e_nz = value[27:24];
 force `SPC6.mmu.asi.t3_e_z = value[31:28];
 force `SPC6.mmu.asi.t4_e_nz = value[35:32];
 force `SPC6.mmu.asi.t4_e_z = value[39:36];
 force `SPC6.mmu.asi.t5_e_nz = value[43:40];
 force `SPC6.mmu.asi.t5_e_z = value[47:44];
 force `SPC6.mmu.asi.t6_e_nz = value[51:48];
 force `SPC6.mmu.asi.t6_e_z = value[55:52];
 force `SPC6.mmu.asi.t7_e_nz = value[59:56];
 force `SPC6.mmu.asi.t7_e_z = value[63:60];
 @(posedge `SPC6.mmu.asi.l1clk_pm1);
 release `SPC6.mmu.asi.t0_e_nz_in;
 release `SPC6.mmu.asi.t0_e_z_in;
 release `SPC6.mmu.asi.t1_e_nz_in;
 release `SPC6.mmu.asi.t1_e_z_in;
 release `SPC6.mmu.asi.t2_e_nz_in;
 release `SPC6.mmu.asi.t2_e_z_in;
 release `SPC6.mmu.asi.t3_e_nz_in;
 release `SPC6.mmu.asi.t3_e_z_in;
 release `SPC6.mmu.asi.t4_e_nz_in;
 release `SPC6.mmu.asi.t4_e_z_in;
 release `SPC6.mmu.asi.t5_e_nz_in;
 release `SPC6.mmu.asi.t5_e_z_in;
 release `SPC6.mmu.asi.t6_e_nz_in;
 release `SPC6.mmu.asi.t6_e_z_in;
 release `SPC6.mmu.asi.t7_e_nz_in;
 release `SPC6.mmu.asi.t7_e_z_in;
 release `SPC6.mmu.asi.t0_e_nz;
 release `SPC6.mmu.asi.t0_e_z;
 release `SPC6.mmu.asi.t1_e_nz;
 release `SPC6.mmu.asi.t1_e_z;
 release `SPC6.mmu.asi.t2_e_nz;
 release `SPC6.mmu.asi.t2_e_z;
 release `SPC6.mmu.asi.t3_e_nz;
 release `SPC6.mmu.asi.t3_e_z;
 release `SPC6.mmu.asi.t4_e_nz;
 release `SPC6.mmu.asi.t4_e_z;
 release `SPC6.mmu.asi.t5_e_nz;
 release `SPC6.mmu.asi.t5_e_z;
 release `SPC6.mmu.asi.t6_e_nz;
 release `SPC6.mmu.asi.t6_e_z;
 release `SPC6.mmu.asi.t7_e_nz;
 release `SPC6.mmu.asi.t7_e_z;
`endif

`endif

`endif

    end
  endtask


  task slam_HwTwEnableConfig_core7_thread0;
    input [63:0]  value;
    reg [5:0] tid;
    integer junk;

    begin
`ifdef AXIS_EMUL_COSIM
//Do Nothing
`else
`ifdef GATESIM
//Do Nothing
`else
`ifdef CORE_7
 @(posedge `SPC7.mmu.asi.l1clk_pm1);
 force `SPC7.mmu.asi.t0_e_nz_in = value[3:0];
 force `SPC7.mmu.asi.t0_e_z_in = value[7:4];
 force `SPC7.mmu.asi.t1_e_nz_in = value[11:8];
 force `SPC7.mmu.asi.t1_e_z_in = value[15:12];
 force `SPC7.mmu.asi.t2_e_nz_in = value[19:16];
 force `SPC7.mmu.asi.t2_e_z_in = value[23:20];
 force `SPC7.mmu.asi.t3_e_nz_in = value[27:24];
 force `SPC7.mmu.asi.t3_e_z_in = value[31:28];
 force `SPC7.mmu.asi.t4_e_nz_in = value[35:32];
 force `SPC7.mmu.asi.t4_e_z_in = value[39:36];
 force `SPC7.mmu.asi.t5_e_nz_in = value[43:40];
 force `SPC7.mmu.asi.t5_e_z_in = value[47:44];
 force `SPC7.mmu.asi.t6_e_nz_in = value[51:48];
 force `SPC7.mmu.asi.t6_e_z_in = value[55:52];
 force `SPC7.mmu.asi.t7_e_nz_in = value[59:56];
 force `SPC7.mmu.asi.t7_e_z_in = value[63:60];
 force `SPC7.mmu.asi.t0_e_nz = value[3:0];
 force `SPC7.mmu.asi.t0_e_z = value[7:4];
 force `SPC7.mmu.asi.t1_e_nz = value[11:8];
 force `SPC7.mmu.asi.t1_e_z = value[15:12];
 force `SPC7.mmu.asi.t2_e_nz = value[19:16];
 force `SPC7.mmu.asi.t2_e_z = value[23:20];
 force `SPC7.mmu.asi.t3_e_nz = value[27:24];
 force `SPC7.mmu.asi.t3_e_z = value[31:28];
 force `SPC7.mmu.asi.t4_e_nz = value[35:32];
 force `SPC7.mmu.asi.t4_e_z = value[39:36];
 force `SPC7.mmu.asi.t5_e_nz = value[43:40];
 force `SPC7.mmu.asi.t5_e_z = value[47:44];
 force `SPC7.mmu.asi.t6_e_nz = value[51:48];
 force `SPC7.mmu.asi.t6_e_z = value[55:52];
 force `SPC7.mmu.asi.t7_e_nz = value[59:56];
 force `SPC7.mmu.asi.t7_e_z = value[63:60];
 @(posedge `SPC7.mmu.asi.l1clk_pm1);
 release `SPC7.mmu.asi.t0_e_nz_in;
 release `SPC7.mmu.asi.t0_e_z_in;
 release `SPC7.mmu.asi.t1_e_nz_in;
 release `SPC7.mmu.asi.t1_e_z_in;
 release `SPC7.mmu.asi.t2_e_nz_in;
 release `SPC7.mmu.asi.t2_e_z_in;
 release `SPC7.mmu.asi.t3_e_nz_in;
 release `SPC7.mmu.asi.t3_e_z_in;
 release `SPC7.mmu.asi.t4_e_nz_in;
 release `SPC7.mmu.asi.t4_e_z_in;
 release `SPC7.mmu.asi.t5_e_nz_in;
 release `SPC7.mmu.asi.t5_e_z_in;
 release `SPC7.mmu.asi.t6_e_nz_in;
 release `SPC7.mmu.asi.t6_e_z_in;
 release `SPC7.mmu.asi.t7_e_nz_in;
 release `SPC7.mmu.asi.t7_e_z_in;
 release `SPC7.mmu.asi.t0_e_nz;
 release `SPC7.mmu.asi.t0_e_z;
 release `SPC7.mmu.asi.t1_e_nz;
 release `SPC7.mmu.asi.t1_e_z;
 release `SPC7.mmu.asi.t2_e_nz;
 release `SPC7.mmu.asi.t2_e_z;
 release `SPC7.mmu.asi.t3_e_nz;
 release `SPC7.mmu.asi.t3_e_z;
 release `SPC7.mmu.asi.t4_e_nz;
 release `SPC7.mmu.asi.t4_e_z;
 release `SPC7.mmu.asi.t5_e_nz;
 release `SPC7.mmu.asi.t5_e_z;
 release `SPC7.mmu.asi.t6_e_nz;
 release `SPC7.mmu.asi.t6_e_z;
 release `SPC7.mmu.asi.t7_e_nz;
 release `SPC7.mmu.asi.t7_e_z;
`endif

`endif

`endif

    end
  endtask


endmodule
