// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pll_bypass.vh
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
integer sys_clk_per;  // clk period of PLL_CMP_CLK_P pkg pin (aka sys clk).
integer ext_cmp_clk_half_per, ext_dr_clk_half_per; // half clk period of ext_cmp_clk and ext_dr_clk
// reg ext_dr_clk_reg, ext_cmp_clk_reg;  // clock generators for ext_cmp_clk and ext_dr_clk

//---- generate external cmp and dr clocks and drive them onto pkg pins ---
//---- NOTE: cmp-to-sys clk ratio is 4:1 and dr-sys-clk clk ratio is 2:1 ----
initial begin
  if ($test$plusargs("pll_bypass")) begin
    //ext_cmp_clk_reg = 1'b0;
    //ext_dr_clk_reg  = 1'b0;
    dbg_dq_reg[138] = 1'b0;
    dbg_dq_reg[139] = 1'b0;

    //--- get sys clk period from pkg pin. Compute clk periods for ext cmp/dr clks. Sync cmp/dr clks edges to sys clk---
    @(posedge `CPU.PLL_CMP_CLK_P);
    sys_clk_per = $time;
    @(posedge `CPU.PLL_CMP_CLK_P);
    sys_clk_per = $time - sys_clk_per;
    ext_cmp_clk_half_per = sys_clk_per / 8;  // cmp-to-sys clk ratio is 4:1
    ext_dr_clk_half_per  = sys_clk_per / 4;  // dr-to-sys clk ratio is 2:1
    `PR_ALWAYS("tb_top", `ALWAYS, "pll bypass mode: sys clk per=%0d, ext_dr_clk per=%0d, ext_cmp_clk per=%0d", sys_clk_per, ext_dr_clk_half_per * 2, ext_cmp_clk_half_per * 2);

    //--- generate clocks for ext_cmp_clk and ext_dr_clk ---
    fork begin
      @(posedge `CPU.PWRON_RST_L);     // not toggle ext_cmp_clk until PWRON_RST_L deasserted.
      @(posedge `CPU.PLL_CMP_CLK_P);   // sync ext_cmp_clk with sys clk rising edge
      //ext_cmp_clk_reg = 1'b1;          // sync rising edge of ext_cmp_clk to sys clk
      //forever #ext_cmp_clk_half_per ext_cmp_clk_reg = ~ext_cmp_clk_reg;
      dbg_dq_reg[138] = 1'b1;       // sync rising edge of ext_cmp_clk to sys clk
`ifndef AXIS_TL
      forever #ext_cmp_clk_half_per dbg_dq_reg[138] = ~dbg_dq_reg[138];
`endif
    end
    begin
      @(posedge `CPU.PWRON_RST_L);    // not toggle ext_dr_clk until PWRON_RST_L deasserted
      @(posedge `CPU.PLL_CMP_CLK_P);  // sync ext_dr_clk with sys clk rising edge
      //ext_dr_clk_reg  = 1'b1;         // sync rising edge of ext_dr_clk to sys clk
      //forever #ext_dr_clk_half_per  ext_dr_clk_reg  = ~ext_dr_clk_reg;
      dbg_dq_reg[139] = 1'b1;       // sync rising edge of ext_dr_clk to sys clk
`ifndef AXIS_TL
      forever #ext_dr_clk_half_per  dbg_dq_reg[139] = ~dbg_dq_reg[139];
`endif
    end
    join
  end // if ($test$plusargs 
end   // initial

//---- setup for PLL bypass mode ------
initial begin
  if ($test$plusargs("pll_bypass")) begin
    `PR_ALWAYS("tb_top", `ALWAYS, "+pll_bypass is used. Config for PLL BYPASS: PLL_TESTMODE=1, PLL_CMP_BYPASS=1. Drive ext_dr/cmp_clk from pkg pins");
    pll_testmode_reg = 1'b1;
    pll_cmp_bypass_reg = 1'b1;
    dbg_dq_reg[150] = 1'b0;               // aka PLL_TRST_L. Reset PLL (see MIO MAS for name mapping)
    dbg_dq_reg[149] = 1'b0;               // aka PLL_CLAMP_FLTR (see MIO MAS for name mapping)
    //dbg_dq_reg[139] = ext_dr_clk_reg;     // aka EXT_DR_CLK (see MIO MAS for name mapping)
    //dbg_dq_reg[138] = ext_cmp_clk_reg;    // aka EXT_CMP_CLK (see MIO MAS for name mapping)
    dbg_dq_reg[156:151] = 6'h7;           // aka PLL_DIV2[5:0]. 7 means divided by 8
    dbg_dq_reg[146:140] = 7'h8;           // aka PLL_DIV4[6:0]. 8 means divided by 4.0 (ie. fractional divider)
`ifndef GATESIM
`ifndef FAST_AXIS
    force `CPU.ccu.ccu_pll.vco_out = 1'b0; // WARNING: force PLL output to 0, so we know pll bypass works
`endif
`endif
    //--- when PLL_TESTMODE is 1, reset PLL with pkg pin PLL_TRST_L ---
    @(posedge `CPU.PWRON_RST_L);
    repeat (3)  @(posedge `CPU.PLL_CMP_CLK_P);
    dbg_dq_reg[150] = 1'b1;     // aka PLL_TRST_L
  end
end

