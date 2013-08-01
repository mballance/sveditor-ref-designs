// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_pll_config.v
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
`ifdef MCUSAT
  `include "mcu_dispmonDefines.vh"
`else
  `include "defines.vh"
  `include "dispmonDefines.vh"
`endif

module ccu_pll_config();


reg [5:0] pll_div1;
reg [5:0] pll_div2;
reg [5:0] pll_div3;
reg [6:0] pll_div4;

integer   sysclk;
integer   cmpclk;
integer	  ioclk;
integer   drclk;

reg [8*100:1] cmp_dr_ratio;

//----------SYS-CMP-IO--DR- 
reg n2_clks_133_533_133_266;
reg n2_clks_133_600_150_266;
reg n2_clks_133_666_166_266;
reg n2_clks_133_733_183_266;
reg n2_clks_133_800_200_266;
reg n2_clks_133_866_216_266;
reg n2_clks_133_933_233_266;
reg n2_clks_133_1000_250_266;
reg n2_clks_133_1066_266_266;
reg n2_clks_133_1133_283_266;
reg n2_clks_133_1200_300_266;
reg n2_clks_133_1266_316_266;
reg n2_clks_133_1333_333_266;
reg n2_clks_133_1400_350_266;

reg n2_clks_166_666_166_333; 
reg n2_clks_166_750_187_333; 
reg n2_clks_166_833_208_333; 
reg n2_clks_166_916_229_333; 
reg n2_clks_166_1000_250_333; 
reg n2_clks_166_1083_270_333; 
reg n2_clks_166_1166_291_333; 
reg n2_clks_166_1250_312_333; 
reg n2_clks_166_1333_333_333; 
reg n2_clks_166_1416_354_333; 
reg n2_clks_166_1416_375_333; 

initial 
begin

  //Initilize PLL DIVs

  pll_div1 = 6'h0;
  pll_div2 = 6'h0;
  pll_div3 = 6'h0;
  pll_div4 = 7'h0;

  //Initilize clk setting regs

  n2_clks_133_533_133_266 = 1'b0;
  n2_clks_133_600_150_266 = 1'b0;
  n2_clks_133_666_166_266 = 1'b0;
  n2_clks_133_733_183_266 = 1'b0;
  n2_clks_133_800_200_266 = 1'b0;
  n2_clks_133_866_216_266 = 1'b0;
  n2_clks_133_933_233_266 = 1'b0;
  n2_clks_133_1000_250_266 = 1'b0;
  n2_clks_133_1066_266_266 = 1'b0;
  n2_clks_133_1133_283_266 = 1'b0;
  n2_clks_133_1200_300_266 = 1'b0;
  n2_clks_133_1266_316_266 = 1'b0;
  n2_clks_133_1333_333_266 = 1'b0;
  n2_clks_133_1400_350_266 = 1'b0;

  n2_clks_166_666_166_333 = 1'b0;
  n2_clks_166_750_187_333 = 1'b0; 
  n2_clks_166_833_208_333 = 1'b0; 
  n2_clks_166_916_229_333 = 1'b0; 
  n2_clks_166_1000_250_333 = 1'b0;
  n2_clks_166_1083_270_333 = 1'b0; 
  n2_clks_166_1166_291_333 = 1'b0; 
  n2_clks_166_1250_312_333 = 1'b0; 
  n2_clks_166_1333_333_333 = 1'b0;
  n2_clks_166_1416_354_333 = 1'b0; 
  n2_clks_166_1416_375_333 = 1'b0; 

  // --- SYS_CLK 133 ----

  if (($test$plusargs("N2_CLKS_133_533_133_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_2.00")))))
       n2_clks_133_533_133_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_600_150_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_2.25")))))
       n2_clks_133_600_150_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_666_166_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_2.50")))))
       n2_clks_133_666_166_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_733_183_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_2.75")))))
       n2_clks_133_733_183_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_800_200_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_3.00")))))
       n2_clks_133_800_200_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_866_216_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_3.25")))))
       n2_clks_133_866_216_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_933_233_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_3.50")))))
       n2_clks_133_933_233_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_1000_250_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_3.75")))))
       n2_clks_133_1000_250_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_1066_266_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_4.00")))))
       n2_clks_133_1066_266_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_1133_283_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_4.25")))))
       n2_clks_133_1133_283_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_1200_300_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_4.50")))))
       n2_clks_133_1200_300_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_1266_316_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_4.75")))))
       n2_clks_133_1266_316_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_1333_333_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_5.00")))))
       n2_clks_133_1333_333_266 = 1'b1;
  else if (($test$plusargs("N2_CLKS_133_1400_350_266")) || (($test$plusargs("SYSCLK_133")) && (($test$plusargs("CMPDR_RATIO_5.25")))))
       n2_clks_133_1400_350_266 = 1'b1;

  // --- SYS_CLK 166 ----

  else if (($test$plusargs("N2_CLKS_166_666_166_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_2.00")))))
       n2_clks_166_666_166_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_750_187_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_2.25"))))) 
       n2_clks_166_750_187_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_833_208_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_2.50"))))) 
       n2_clks_166_833_208_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_916_229_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_2.75"))))) 
       n2_clks_166_916_229_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_1000_250_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_3.00"))))) 
       n2_clks_166_1000_250_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_1083_270_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_3.25"))))) 
       n2_clks_166_1083_270_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_1166_291_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_3.50"))))) 
       n2_clks_166_1166_291_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_1250_312_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_3.75"))))) 
       n2_clks_166_1250_312_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_1333_333_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_4.00"))))) 
       n2_clks_166_1333_333_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_1416_354_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_4.25"))))) 
       n2_clks_166_1416_354_333 = 1'b1;
  else if (($test$plusargs("N2_CLKS_166_1416_375_333")) || (($test$plusargs("SYSCLK_166")) && (($test$plusargs("CMPDR_RATIO_4.50"))))) 
       n2_clks_166_1416_375_333 = 1'b1;
  else begin
    `ifdef DDR2_533
       n2_clks_133_1333_333_266 = 1'b1;
    `else  // DDR2_667
       n2_clks_166_1333_333_333 = 1'b1;    // Default
     `endif
   end

  // --- SYS_CLK 133 ----

  if (n2_clks_133_533_133_266) begin
    pll_div1 	 = 6'h1;
    pll_div2 	 = 6'h7;
    pll_div3 	 = 6'h1;
    pll_div4 	 = 7'h8;
    sysclk   	 = 133;
    cmpclk   	 = 533;
    ioclk    	 = 133;
    drclk    	 = 266;
    cmp_dr_ratio = "2.00";
  end

  if (n2_clks_133_600_150_266) begin
    pll_div1 	 = 6'h1;
    pll_div2 	 = 6'h8;
    pll_div3 	 = 6'h1;
    pll_div4 	 = 7'h9;
    sysclk   	 = 133;
    cmpclk   	 = 600;
    ioclk    	 = 150;
    drclk    	 = 266;
    cmp_dr_ratio = "2.25";
  end

  if (n2_clks_133_666_166_266) begin
    pll_div1 	 = 6'h1;
    pll_div2 	 = 6'h9;
    pll_div3 	 = 6'h1;
    pll_div4 	 = 7'ha;
    sysclk   	 = 133;
    cmpclk   	 = 666;
    ioclk    	 = 166;
    drclk    	 = 266;
    cmp_dr_ratio = "2.50";
  end

  if (n2_clks_133_733_183_266) begin
    pll_div1 	 = 6'h1;
    pll_div2 	 = 6'ha;
    pll_div3 	 = 6'h1;
    pll_div4 	 = 7'hb;
    sysclk   	 = 133;
    cmpclk   	 = 733;
    ioclk    	 = 183;
    drclk    	 = 266;
    cmp_dr_ratio = "2.75";
  end

  if (n2_clks_133_800_200_266) begin
    pll_div1 	 = 6'h1;
    pll_div2     = 6'hb;
    pll_div3     = 6'h1;
    pll_div4     = 7'hc;
    sysclk       = 133;
    cmpclk       = 800;
    ioclk        = 200;
    drclk        = 266;
    cmp_dr_ratio = "3.00";
  end

  if (n2_clks_133_866_216_266) begin
    pll_div1 	 = 6'h1;
    pll_div2     = 6'hc;
    pll_div3     = 6'h1;
    pll_div4     = 7'hd;
    sysclk       = 133;
    cmpclk       = 866;
    ioclk        = 216;
    drclk        = 266;
    cmp_dr_ratio = "3.25";
  end

  if (n2_clks_133_933_233_266) begin
    pll_div1 	 = 6'h1;
    pll_div2     = 6'hd;
    pll_div3     = 6'h1;
    pll_div4     = 7'he;
    sysclk       = 133;
    cmpclk       = 933;
    ioclk        = 233;
    drclk        = 266;
    cmp_dr_ratio = "3.50";
  end

  if (n2_clks_133_1000_250_266) begin
    pll_div1 	 = 6'h1;
    pll_div2     = 6'he;
    pll_div3     = 6'h1;
    pll_div4     = 7'hf;
    sysclk       = 133;
    cmpclk       = 1000;
    ioclk        = 250;
    drclk        = 266;
    cmp_dr_ratio = "3.75";
  end

  if (n2_clks_133_1066_266_266) begin
    pll_div1     = 6'h1;
    pll_div2     = 6'hf;
    pll_div3     = 6'h1;
    pll_div4     = 7'h10;
    sysclk       = 133;
    cmpclk       = 1066;
    ioclk        = 266;
    drclk        = 266;
    cmp_dr_ratio = "4.00";
  end

  if (n2_clks_133_1133_283_266) begin
    pll_div1     = 6'h1;
    pll_div2     = 6'h10;
    pll_div3     = 6'h1;
    pll_div4     = 7'h11;
    sysclk       = 133;
    cmpclk       = 1133;
    ioclk        = 283;
    drclk        = 266;
    cmp_dr_ratio = "4.25";
  end

  if (n2_clks_133_1200_300_266) begin
    pll_div1     = 6'h1;
    pll_div2     = 6'h11;
    pll_div3     = 6'h1;
    pll_div4     = 7'h12;
    sysclk       = 133;
    cmpclk       = 1200;
    ioclk        = 300;
    drclk        = 266;
    cmp_dr_ratio = "4.50";
  end

  if (n2_clks_133_1266_316_266) begin
    pll_div1     = 6'h1;
    pll_div2     = 6'h12;
    pll_div3     = 6'h1;
    pll_div4     = 7'h13;
    sysclk       = 133;
    cmpclk       = 1266;
    ioclk        = 316;
    drclk        = 266;
    cmp_dr_ratio = "4.75";
  end

  if (n2_clks_133_1333_333_266) begin
    pll_div1     = 6'h1;
    pll_div2     = 6'h13;
    pll_div3     = 6'h1;
    pll_div4     = 7'h14;
    sysclk       = 133;
    cmpclk       = 1333;
    ioclk        = 333;
    drclk        = 266;
    cmp_dr_ratio = "5.00";
  end

  if (n2_clks_133_1400_350_266) begin
    pll_div1     = 6'h1;
    pll_div2     = 6'h14;
    pll_div3     = 6'h1;
    pll_div4     = 7'h15;
    sysclk       = 133;
    cmpclk       = 1400;
    ioclk        = 350;
    drclk        = 266;
    cmp_dr_ratio = "5.25";
  end

  // --- SYS_CLK 166 ----

  if (n2_clks_166_666_166_333) begin
    pll_div1 	 = 6'h1;
    pll_div2 	 = 6'h7;
    pll_div3 	 = 6'h1;
    pll_div4 	 = 7'h8;
    sysclk   	 = 166;
    cmpclk   	 = 666;
    ioclk    	 = 166;
    drclk    	 = 333;
    cmp_dr_ratio = "2.00";
  end

  if (n2_clks_166_750_187_333) begin
    pll_div1 	 = 6'h1;
    pll_div2 	 = 6'h8;
    pll_div3 	 = 6'h1;
    pll_div4 	 = 7'h9;
    sysclk   	 = 166;
    cmpclk   	 = 750;
    ioclk    	 = 187;
    drclk    	 = 333;
    cmp_dr_ratio = "2.25";
  end

  if (n2_clks_166_833_208_333) begin
    pll_div1 	 = 6'h1;
    pll_div2 	 = 6'h9;
    pll_div3 	 = 6'h1;
    pll_div4 	 = 7'ha;
    sysclk   	 = 166;
    cmpclk   	 = 833;
    ioclk    	 = 208;
    drclk    	 = 333;
    cmp_dr_ratio = "2.50";
  end

  if (n2_clks_166_916_229_333) begin
    pll_div1 	 = 6'h1;
    pll_div2 	 = 6'ha;
    pll_div3 	 = 6'h1;
    pll_div4 	 = 7'hb;
    sysclk   	 = 166;
    cmpclk   	 = 916;
    ioclk    	 = 229;
    drclk    	 = 333;
    cmp_dr_ratio = "2.75";
  end

  if (n2_clks_166_1000_250_333) begin
    pll_div1 	 = 6'h1;
    pll_div2     = 6'hb;
    pll_div3     = 6'h1;
    pll_div4     = 7'hc;
    sysclk       = 166;
    cmpclk       = 1000;
    ioclk        = 250;
    drclk        = 333;
    cmp_dr_ratio = "3.00";
  end

  if (n2_clks_166_1083_270_333) begin
    pll_div1 	 = 6'h1;
    pll_div2     = 6'hc;
    pll_div3     = 6'h1;
    pll_div4     = 7'hd;
    sysclk       = 166;
    cmpclk       = 1083;
    ioclk        = 270;
    drclk        = 333;
    cmp_dr_ratio = "3.25";
  end

  if (n2_clks_166_1166_291_333) begin
    pll_div1 	 = 6'h1;
    pll_div2     = 6'hd;
    pll_div3     = 6'h1;
    pll_div4     = 7'he;
    sysclk       = 166;
    cmpclk       = 1166;
    ioclk        = 291;
    drclk        = 333;
    cmp_dr_ratio = "3.50";
  end

  if (n2_clks_166_1250_312_333) begin
    pll_div1 	 = 6'h1;
    pll_div2     = 6'he;
    pll_div3     = 6'h1;
    pll_div4     = 7'hf;
    sysclk       = 166;
    cmpclk       = 1250;
    ioclk        = 312;
    drclk        = 333;
    cmp_dr_ratio = "3.75";
  end

  if (n2_clks_166_1333_333_333) begin
    pll_div1     = 6'h1;
    pll_div2     = 6'hf;
    pll_div3     = 6'h1;
    pll_div4     = 7'h10;
    sysclk       = 166;
    cmpclk       = 1333;
    ioclk        = 333;
    drclk        = 333;
    cmp_dr_ratio = "4.00";
  end

  if (n2_clks_166_1416_354_333) begin
    pll_div1     = 6'h1;
    pll_div2     = 6'h10;
    pll_div3     = 6'h1;
    pll_div4     = 7'h11;
    sysclk       = 166;
    cmpclk       = 1416;
    ioclk        = 354;
    drclk        = 333;
    cmp_dr_ratio = "4.25";
  end

  if (n2_clks_166_1416_375_333) begin
    pll_div1     = 6'h1;
    pll_div2     = 6'h11;
    pll_div3     = 6'h1;
    pll_div4     = 7'h12;
    sysclk       = 166;
    cmpclk       = 1416;
    ioclk        = 375;
    drclk        = 333;
    cmp_dr_ratio = "4.50";
  end

#1;

if ($test$plusargs("NO_CCU_CSR_SLAM")) begin
 $display("CCU not forced\n");
end
else begin

`ifdef CCU_GATE
  force `CCU.pll_div1 = pll_div1;
  force `CCU.pll_div2 = pll_div2;
  force `CCU.pll_div3 = pll_div3;
  force `CCU.pll_div4 = pll_div4;
`else
  force `CCU.csr_blk.pll_div1 = pll_div1;
  force `CCU.csr_blk.pll_div2 = pll_div2;
  force `CCU.csr_blk.pll_div3 = pll_div3;
  force `CCU.csr_blk.pll_div4 = pll_div4;
`endif // CCU_GATE

  // --- DTM Mode ----

   if ($test$plusargs("SLAM_VECTORS")) begin
       pll_div1          = 6'h1;
       pll_div2          = 6'h7;
       pll_div3          = 6'h1;
       pll_div4          = 6'h8;
     wait (`CCU.cluster_arst_l == 1'b1);
     if ($test$plusargs("CMPDR_RATIO_15")) begin
       pll_div1 	 = 6'h0;
       pll_div2 	 = 6'he;
       pll_div3 	 = 6'h1;
       pll_div4          = 6'h0; 
       sysclk   	 = 104;
       cmpclk   	 = 1560;
       ioclk    	 = 104;
       drclk    	 = 104;
       cmp_dr_ratio = "15.00";
     end
     else if ($test$plusargs("CMPDR_RATIO_11")) begin
       pll_div1 	 = 6'h0;
       pll_div2 	 = 6'ha;
       pll_div3 	 = 6'h1;
       pll_div4          = 6'h0; 
       sysclk   	 = 104;
       cmpclk   	 = 1144;
       ioclk    	 = 104;
       drclk    	 = 104;
       cmp_dr_ratio = "11.00";
     end
     else begin // if ($test$plusargs("CMPDR_RATIO_8"))
       pll_div1 	 = 6'h0;
       pll_div2 	 = 6'h7;
       pll_div3 	 = 6'h1;
       pll_div4          = 6'h0; 
       sysclk   	 = 104;
       cmpclk   	 = 832;
       ioclk    	 = 104;
       drclk    	 = 104;
       cmp_dr_ratio = "8.00";
     end

`ifdef CCU_GATE
     force `CCU.pll_div1 = pll_div1;
     force `CCU.pll_div2 = pll_div2;
     force `CCU.pll_div3 = pll_div3;
     force `CCU.pll_div4 = pll_div4;
`else
     force `CCU.csr_blk.pll_div1 = pll_div1;
     force `CCU.csr_blk.pll_div2 = pll_div2;
     force `CCU.csr_blk.pll_div3 = pll_div3;
     force `CCU.csr_blk.pll_div4 = pll_div4;
`endif // CCU_GATE

   end

end

  `PR_ALWAYS("ccu_pll_config", `ALWAYS, "----------- CCU PLL CONFIGURATION -----------"); 
  `PR_ALWAYS("ccu_pll_config", `ALWAYS, "PLL_DIV1 = %x  PLL_DIV2 = %x  PLL_DIV3 = %x  PLL_DIV4 = %x", pll_div1, pll_div2, pll_div3, pll_div4); 
  `PR_ALWAYS("ccu_pll_config", `ALWAYS, "SYS_CLK = %0d MHz  CMP_CLK = %0d MHz  IO_CLK = %0d MHz  DR_CLK = %0d MHz", sysclk, cmpclk, ioclk, drclk); 
  `PR_ALWAYS("ccu_pll_config", `ALWAYS, "CMP:DR RATIO = %s:1", cmp_dr_ratio); 
  `PR_ALWAYS("ccu_pll_config", `ALWAYS, "---------------------------------------------"); 

end


endmodule
