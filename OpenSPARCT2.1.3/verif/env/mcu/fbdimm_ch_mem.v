// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fbdimm_ch_mem.v
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
module fbdimm_ch_mem ( /*AUTOARG*/
   // inputs
   XXPS, XXPS_BAR, 
   //outputs
   XXPN, XXPN_BAR, 
   XXCLK, XXERR_EN
`ifdef AXIS_DDR2_MODEL
   ,dq
`endif
   );

// Parameters
parameter NB_LINK = 14;
parameter SB_LINK = 10;

`ifdef IDT_FBDIMM
`include "idt_parameter.h"
`endif

`ifdef NEC_FBDIMM
`include "nec_parameter.h"
`endif

`ifdef MICRON_FBDIMM
`include "micron_bench_parameter.h"
`endif

// Inputs/Outputs
output  [NB_LINK-1:0] XXPN,XXPN_BAR; // primary northbound
input   [SB_LINK-1:0] XXPS,XXPS_BAR; // primary southbound
input   XXCLK;
input   XXERR_EN;
`ifdef AXIS_DDR2_MODEL
inout   [71:0] dq;
`endif
// internal registers/wires
wire [NB_LINK-1:0] fbdimm0_sn,fbdimm1_sn,fbdimm2_sn,fbdimm3_sn;
wire [NB_LINK-1:0] fbdimm0_sn_,fbdimm1_sn_,fbdimm2_sn_,fbdimm3_sn_;
wire [NB_LINK-1:0] fbdimm4_sn,fbdimm5_sn,fbdimm6_sn,fbdimm7_sn;
wire [NB_LINK-1:0] fbdimm4_sn_,fbdimm5_sn_,fbdimm6_sn_,fbdimm7_sn_;
wire [SB_LINK-1:0] fbdimm0_ss,fbdimm1_ss,fbdimm2_ss,fbdimm3_ss;
wire [SB_LINK-1:0] fbdimm0_ss_,fbdimm1_ss_,fbdimm2_ss_,fbdimm3_ss_;
wire [SB_LINK-1:0] fbdimm4_ss,fbdimm5_ss,fbdimm6_ss,fbdimm7_ss;
wire [SB_LINK-1:0] fbdimm4_ss_,fbdimm5_ss_,fbdimm6_ss_,fbdimm7_ss_;

`ifdef IDT_FBDIMM
wire fbdimm_resetn;
wire idt_clk;
wire idt_clk24x;
wire [3:0]  sa[7:0];
assign fbdimm_resetn = tb_top.mcusat_fbdimm.chmon_rst;
assign sa[0] = 4'h0;
assign sa[1] = 4'h1;
assign sa[2] = 4'h2;
assign sa[3] = 4'h3;
assign sa[4] = 4'h4;
assign sa[5] = 4'h5;
assign sa[6] = 4'h6;
assign sa[7] = 4'h7;
`endif

`ifdef NEC_FBDIMM
wire fbdimm_resetn;
wire nec_clk;
wire nec_clk24x;
wire [3:0]  sa[7:0];
assign fbdimm_resetn = tb_top.mcusat_fbdimm.chmon_rst;
assign sa[0] = 4'h0;
assign sa[1] = 4'h1;
assign sa[2] = 4'h2;
assign sa[3] = 4'h3;
assign sa[4] = 4'h4;
assign sa[5] = 4'h5;
assign sa[6] = 4'h6;
assign sa[7] = 4'h7;
`endif

`ifdef INPHI_FBDIMM
wire fbdimm_resetn;
assign fbdimm_resetn = tb_top.mcusat_fbdimm.chmon_rst;
`endif

`ifdef MICRON_FBDIMM
wire fbdimm_resetn;
wire micron_clk;
wire micron_clk24x;
wire [3:0]  sa[7:0];
assign fbdimm_resetn = tb_top.mcusat_fbdimm.chmon_rst;
assign sa[0] = 4'h0;
assign sa[1] = 4'h1;
assign sa[2] = 4'h2;
assign sa[3] = 4'h3;
assign sa[4] = 4'h4;
assign sa[5] = 4'h5;
assign sa[6] = 4'h6;
assign sa[7] = 4'h7;
`endif

`ifdef MICRON_FBDIMM
CLK_GEN #(
  .PERIOD                       (CLK_PERIOD)     // FBD_LINK_MODEL0
)
CLK_GEN0 (                                       // CLK_GEN0
  .CLK1X                        (micron_clk),    // CLK_GEN0
  .CLK24X                       (micron_clk24x)  // CLK_GEN0
);                                               // CLK_GEN0
`endif

`ifdef IDT_FBDIMM
CLK_GEN #(
  .PERIOD                       (CLK_PERIOD)     // FBD_LINK_MODEL0
)
CLK_GEN0 (                                       // CLK_GEN0
  .CLK1X                        (idt_clk),       // CLK_GEN0
  .CLK24X                       (idt_clk24x)     // CLK_GEN0
);                                               // CLK_GEN0
`endif


`ifdef NEC_FBDIMM
CLK_GEN #(
  .PERIOD                       (CLK_PERIOD)     // FBD_LINK_MODEL0
)
CLK_GEN0 (                                       // CLK_GEN0
  .CLK1X                        (nec_clk),       // CLK_GEN0
  .CLK24X                       (nec_clk24x)     // CLK_GEN0
);                                               // CLK_GEN0
`endif


reg [7:0] XXCLK_MASK; 
initial begin // {

    if ($test$plusargs("1_FBDIMM"))             // Number of DIMMS
      XXCLK_MASK[7:0] = 8'b00000001;
    else if ($test$plusargs("2_FBDIMMS"))
      XXCLK_MASK[7:0] = 8'b00000011;
    else if ($test$plusargs("3_FBDIMMS"))
      XXCLK_MASK[7:0] = 8'b00000111;
    else if ($test$plusargs("4_FBDIMMS"))
      XXCLK_MASK[7:0] = 8'b00001111;
    else if ($test$plusargs("5_FBDIMMS"))
      XXCLK_MASK[7:0] = 8'b00011111;
    else if ($test$plusargs("6_FBDIMMS"))
      XXCLK_MASK[7:0] = 8'b00111111;
    else if ($test$plusargs("7_FBDIMMS"))
      XXCLK_MASK[7:0] = 8'b01111111;
    else if ($test$plusargs("8_FBDIMMS"))
      XXCLK_MASK[7:0] = 8'b11111111;
    else
      XXCLK_MASK[7:0] = 8'b00000001;

end // }

wire [7:0] XXCLK_G; 
assign  XXCLK_G[7:0]  =  {8{XXCLK}}  & XXCLK_MASK[7:0];


//------------- FBDIMM 0 --------------------//
`ifdef MICRON_FBDIMM
micron_fbdimm #(NB_LINK,SB_LINK,0) fbdimm0 ( .ps  	(XXPS),
				      .ps_bar	(XXPS_BAR),
                                      .sn   	(fbdimm0_sn),
                                      .sn_bar   (fbdimm0_sn_),
                                      .pn   	(XXPN),
			       	      .pn_bar	(XXPN_BAR),
                                      .sa   	(sa[0]),
                                      .ss   	(fbdimm0_ss),
                                      .ss_bar   (fbdimm0_ss_),
				      .reset_n	(fbdimm_resetn),
`ifdef AXIS_DDR2_MODEL
				      .dq       (dq),
`endif
                                      .sclk 	(micron_clk));
`else
`ifdef INPHI_FBDIMM
inphi_fbdimm #(NB_LINK,SB_LINK,0) fbdimm0 ( .ps  	(XXPS),
				      .ps_bar	(XXPS_BAR),
                                      .sn   	(fbdimm0_sn),
                                      .sn_bar   (fbdimm0_sn_),
                                      .pn   	(XXPN),
			       	      .pn_bar	(XXPN_BAR),
                                      .ss   	(fbdimm0_ss),
                                      .ss_bar   (fbdimm0_ss_),
				      .reset_n	(fbdimm_resetn),
				      .err_en   (XXERR_EN),
`ifdef AXIS_DDR2_MODEL
				      .dq       (dq),
`endif
                                      .sclk 	(XXCLK));

`else 
`ifdef IDT_FBDIMM
idt_fbdimm #(NB_LINK,SB_LINK,1) fbdimm0 ( .ps       (XXPS),
                                      .ps_bar   (XXPS_BAR),
                                      .sn       (fbdimm0_sn),
                                      .sn_bar   (fbdimm0_sn_),
                                      .pn       (XXPN),
                                      .pn_bar   (XXPN_BAR),
                                      .sa       (sa[0]),
                                      .ss       (fbdimm0_ss),
                                      .ss_bar   (fbdimm0_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (idt_clk));
`else
`ifdef NEC_FBDIMM
nec_fbdimm #(NB_LINK,SB_LINK,1) fbdimm0 ( .ps       (XXPS),
                                      .ps_bar   (XXPS_BAR),
                                      .sn       (fbdimm0_sn),
                                      .sn_bar   (fbdimm0_sn_),
                                      .pn       (XXPN),
                                      .pn_bar   (XXPN_BAR),
                                      .sa       (sa[0]),
                                      .ss       (fbdimm0_ss),
                                      .ss_bar   (fbdimm0_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (nec_clk));
`else
fbdimm #(NB_LINK,SB_LINK,0) fbdimm0 ( .ps   	(XXPS),
				      .ps_bar	(XXPS_BAR),
                                      .sn   	(fbdimm0_sn),
                                      .sn_bar   (fbdimm0_sn_),
                                      .pn   	(XXPN),
			       	      .pn_bar	(XXPN_BAR),
                                      .ss   	(fbdimm0_ss),
                                      .ss_bar   (fbdimm0_ss_),
`ifdef AXIS_DDR2_MODEL
				      .dq       (dq),
`endif
				      .err_en   (XXERR_EN),
                                      .sclk 	(XXCLK));
`endif
`endif
`endif
`endif

`ifndef FBDIMM_NUM_1
//------------- FBDIMM 1 --------------------//
`ifdef MICRON_FBDIMM
micron_fbdimm #(NB_LINK,SB_LINK,1) fbdimm1 ( .ps       (fbdimm0_ss),
                                      .ps_bar   (fbdimm0_ss_),
                                      .sn       (fbdimm1_sn),
                                      .sn_bar   (fbdimm1_sn_),
                                      .pn       (fbdimm0_sn),
                                      .pn_bar   (fbdimm0_sn_),
                                      .sa   	(sa[1]),
                                      .ss       (fbdimm1_ss),
                                      .ss_bar   (fbdimm1_ss_),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (micron_clk));
`else
`ifdef INPHI_FBDIMM
inphi_fbdimm #(NB_LINK,SB_LINK,1) fbdimm1 ( .ps       (fbdimm0_ss),
                                      .ps_bar   (fbdimm0_ss_),
                                      .sn       (fbdimm1_sn),
                                      .sn_bar   (fbdimm1_sn_),
                                      .pn       (fbdimm0_sn),
                                      .pn_bar   (fbdimm0_sn_),
                                      .ss       (fbdimm1_ss),
                                      .ss_bar   (fbdimm1_ss_),
				      .err_en   (XXERR_EN),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (XXCLK));

`else 
`ifdef IDT_FBDIMM
idt_fbdimm #(NB_LINK,SB_LINK,1) fbdimm1 ( 
				      .ps       (fbdimm0_ss),
                                      .ps_bar   (fbdimm0_ss_),
                                      .sn       (fbdimm1_sn),
                                      .sn_bar   (fbdimm1_sn_),
                                      .pn       (fbdimm0_sn),
                                      .pn_bar   (fbdimm0_sn_),
                                      .sa       (sa[1]),
                                      .ss       (fbdimm1_ss),
                                      .ss_bar   (fbdimm1_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (idt_clk));
`else
`ifdef NEC_FBDIMM
nec_fbdimm #(NB_LINK,SB_LINK,1) fbdimm1 (
                                      .ps       (fbdimm0_ss),
                                      .ps_bar   (fbdimm0_ss_),
                                      .sn       (fbdimm1_sn),
                                      .sn_bar   (fbdimm1_sn_),
                                      .pn       (fbdimm0_sn),
                                      .pn_bar   (fbdimm0_sn_),
                                      .sa       (sa[1]),
                                      .ss       (fbdimm1_ss),
                                      .ss_bar   (fbdimm1_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (nec_clk));
`else
fbdimm #(NB_LINK,SB_LINK,1) fbdimm1 ( .ps   	(fbdimm0_ss),
                                      .ps_bar 	(fbdimm0_ss_),
                                      .sn   	(fbdimm1_sn),
                                      .sn_bar  	(fbdimm1_sn_),
                                      .pn   	(fbdimm0_sn),
                                      .pn_bar   (fbdimm0_sn_),
                                      .ss   	(fbdimm1_ss),
                                      .ss_bar   (fbdimm1_ss_),
				      .err_en   (XXERR_EN),
                                      .sclk 	(XXCLK_G[1]));
`endif
`endif
`endif
`endif

`ifndef FBDIMM_NUM_2
//------------- FBDIMM 2 --------------------//
`ifdef MICRON_FBDIMM
micron_fbdimm #(NB_LINK,SB_LINK,2) fbdimm2 ( .ps       (fbdimm1_ss),
                                      .ps_bar   (fbdimm1_ss_),
                                      .sn       (fbdimm2_sn),
                                      .sn_bar   (fbdimm2_sn_),
                                      .pn       (fbdimm1_sn),
                                      .pn_bar   (fbdimm1_sn_),
                                      .sa   	(sa[2]),
                                      .ss       (fbdimm2_ss),
                                      .ss_bar   (fbdimm2_ss_),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (micron_clk));
`else
`ifdef INPHI_FBDIMM
inphi_fbdimm #(NB_LINK,SB_LINK,2) fbdimm2 ( .ps       (fbdimm1_ss),
                                      .ps_bar   (fbdimm1_ss_),
                                      .sn       (fbdimm2_sn),
                                      .sn_bar   (fbdimm2_sn_),
                                      .pn       (fbdimm1_sn),
                                      .pn_bar   (fbdimm1_sn_),
                                      .ss       (fbdimm2_ss),
                                      .ss_bar   (fbdimm2_ss_),
				      .err_en   (XXERR_EN),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (XXCLK));

`else
`ifdef IDT_FBDIMM
idt_fbdimm #(NB_LINK,SB_LINK,2) fbdimm2 ( .ps       (fbdimm1_ss),
                                      .ps_bar   (fbdimm1_ss_),
                                      .sn       (fbdimm2_sn),
                                      .sn_bar   (fbdimm2_sn_),
                                      .pn       (fbdimm1_sn),
                                      .pn_bar   (fbdimm1_sn_),
                                      .sa       (sa[2]),
                                      .ss       (fbdimm2_ss),
                                      .ss_bar   (fbdimm2_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (idt_clk));
`else
`ifdef NEC_FBDIMM
nec_fbdimm #(NB_LINK,SB_LINK,2) fbdimm2 ( .ps       (fbdimm1_ss),
                                      .ps_bar   (fbdimm1_ss_),
                                      .sn       (fbdimm2_sn),
                                      .sn_bar   (fbdimm2_sn_),
                                      .pn       (fbdimm1_sn),
                                      .pn_bar   (fbdimm1_sn_),
                                      .sa       (sa[2]),
                                      .ss       (fbdimm2_ss),
                                      .ss_bar   (fbdimm2_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (nec_clk));
`else
fbdimm #(NB_LINK,SB_LINK,2) fbdimm2 ( .ps   	(fbdimm1_ss),
                                      .ps_bar 	(fbdimm1_ss_),
                                      .sn   	(fbdimm2_sn),
                                      .sn_bar   (fbdimm2_sn_),
                                      .pn   	(fbdimm1_sn),
                                      .pn_bar  	(fbdimm1_sn_),
                                      .ss   	(fbdimm2_ss),
                                      .ss_bar   (fbdimm2_ss_),
				      .err_en   (XXERR_EN),
                                      .sclk 	(XXCLK_G[2]));
`endif
`endif
`endif
`endif

`ifndef FBDIMM_NUM_3
//------------- FBDIMM 3 --------------------//
`ifdef MICRON_FBDIMM
micron_fbdimm #(NB_LINK,SB_LINK,3) fbdimm3 ( .ps       (fbdimm2_ss),
                                      .ps_bar   (fbdimm2_ss_),
                                      .sn       (fbdimm3_sn),
                                      .sn_bar   (fbdimm3_sn_),
                                      .pn       (fbdimm2_sn),
                                      .pn_bar   (fbdimm2_sn_),
                                      .sa   	(sa[3]),
                                      .ss       (fbdimm3_ss),
                                      .ss_bar   (fbdimm3_ss_),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (micron_clk));
`else
`ifdef INPHI_FBDIMM
inphi_fbdimm #(NB_LINK,SB_LINK,3) fbdimm3 ( .ps       (fbdimm2_ss),
                                      .ps_bar   (fbdimm2_ss_),
                                      .sn       (fbdimm3_sn),
                                      .sn_bar   (fbdimm3_sn_),
                                      .pn       (fbdimm2_sn),
                                      .pn_bar   (fbdimm2_sn_),
                                      .ss       (fbdimm3_ss),
                                      .ss_bar   (fbdimm3_ss_),
				      .err_en   (XXERR_EN),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (XXCLK));
`else
`ifdef IDT_FBDIMM
idt_fbdimm #(NB_LINK,SB_LINK,3) fbdimm3 ( .ps       (fbdimm2_ss),
                                      .ps_bar   (fbdimm2_ss_),
                                      .sn       (fbdimm3_sn),
                                      .sn_bar   (fbdimm3_sn_),
                                      .pn       (fbdimm2_sn),
                                      .pn_bar   (fbdimm2_sn_),
                                      .sa       (sa[3]),
                                      .ss       (fbdimm3_ss),
                                      .ss_bar   (fbdimm3_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (idt_clk));
`else
`ifdef NEC_FBDIMM
nec_fbdimm #(NB_LINK,SB_LINK,3) fbdimm3 ( .ps       (fbdimm2_ss),
                                      .ps_bar   (fbdimm2_ss_),
                                      .sn       (fbdimm3_sn),
                                      .sn_bar   (fbdimm3_sn_),
                                      .pn       (fbdimm2_sn),
                                      .pn_bar   (fbdimm2_sn_),
                                      .sa       (sa[3]),
                                      .ss       (fbdimm3_ss),
                                      .ss_bar   (fbdimm3_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (nec_clk));
`else
fbdimm #(NB_LINK,SB_LINK,3) fbdimm3 ( .ps   	(fbdimm2_ss),
                                      .ps_bar 	(fbdimm2_ss_),
                                      .sn   	(fbdimm3_sn),
                                      .sn_bar  	(fbdimm3_sn_),
                                      .pn   	(fbdimm2_sn),
                                      .pn_bar   (fbdimm2_sn_),
                                      .ss   	(fbdimm3_ss),
                                      .ss_bar   (fbdimm3_ss_),
				      .err_en   (XXERR_EN),
                                      .sclk 	(XXCLK_G[3]));
`endif
`endif
`endif
`endif

`ifndef FBDIMM_NUM_4
//------------- FBDIMM 4 --------------------//
`ifdef MICRON_FBDIMM
micron_fbdimm #(NB_LINK,SB_LINK,4) fbdimm4 ( .ps       (fbdimm3_ss),
                                      .ps_bar   (fbdimm3_ss_),
                                      .sn       (fbdimm4_sn),
                                      .sn_bar   (fbdimm4_sn_),
                                      .pn       (fbdimm3_sn),
                                      .pn_bar   (fbdimm3_sn_),
                                      .sa   	(sa[4]),
                                      .ss       (fbdimm4_ss),
                                      .ss_bar   (fbdimm4_ss_),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (micron_clk));
`else
`ifdef INPHI_FBDIMM
inphi_fbdimm #(NB_LINK,SB_LINK,4) fbdimm4 ( .ps       (fbdimm3_ss),
                                      .ps_bar   (fbdimm3_ss_),
                                      .sn       (fbdimm4_sn),
                                      .sn_bar   (fbdimm4_sn_),
                                      .pn       (fbdimm3_sn),
                                      .pn_bar   (fbdimm3_sn_),
                                      .ss       (fbdimm4_ss),
                                      .ss_bar   (fbdimm4_ss_),
				      .err_en   (XXERR_EN),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (XXCLK));

`else
`ifdef IDT_FBDIMM
idt_fbdimm #(NB_LINK,SB_LINK,4) fbdimm4 ( .ps       (fbdimm3_ss),
                                      .ps_bar   (fbdimm3_ss_),
                                      .sn       (fbdimm4_sn),
                                      .sn_bar   (fbdimm4_sn_),
                                      .pn       (fbdimm3_sn),
                                      .pn_bar   (fbdimm3_sn_),
                                      .sa       (sa[4]),
                                      .ss       (fbdimm4_ss),
                                      .ss_bar   (fbdimm4_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (idt_clk));
`else
`ifdef NEC_FBDIMM
nec_fbdimm #(NB_LINK,SB_LINK,4) fbdimm4 ( .ps       (fbdimm3_ss),
                                      .ps_bar   (fbdimm3_ss_),
                                      .sn       (fbdimm4_sn),
                                      .sn_bar   (fbdimm4_sn_),
                                      .pn       (fbdimm3_sn),
                                      .pn_bar   (fbdimm3_sn_),
                                      .sa       (sa[4]),
                                      .ss       (fbdimm4_ss),
                                      .ss_bar   (fbdimm4_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (nec_clk));
`else
fbdimm #(NB_LINK,SB_LINK,4) fbdimm4 ( .ps   	(fbdimm3_ss),
                                      .ps_bar   (fbdimm3_ss_),
                                      .sn   	(fbdimm4_sn),
                                      .sn_bar  	(fbdimm4_sn_),
                                      .pn   	(fbdimm3_sn),
                                      .pn_bar   (fbdimm3_sn_),
                                      .ss   	(fbdimm4_ss),
                                      .ss_bar   (fbdimm4_ss_),
				      .err_en   (XXERR_EN),
                                      .sclk 	(XXCLK_G[4]));
`endif
`endif
`endif
`endif

`ifndef FBDIMM_NUM_5
//------------- FBDIMM 5 --------------------//
`ifdef MICRON_FBDIMM
micron_fbdimm #(NB_LINK,SB_LINK,5) fbdimm5 ( .ps       (fbdimm4_ss),
                                      .ps_bar   (fbdimm4_ss_),
                                      .sn       (fbdimm5_sn),
                                      .sn_bar   (fbdimm5_sn_),
                                      .pn       (fbdimm4_sn),
                                      .pn_bar   (fbdimm4_sn_),
                                      .sa   	(sa[5]),
                                      .ss       (fbdimm5_ss),
                                      .ss_bar   (fbdimm5_ss_),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (micron_clk));
`else
`ifdef INPHI_FBDIMM
inphi_fbdimm #(NB_LINK,SB_LINK,5) fbdimm5 ( .ps       (fbdimm4_ss),
                                      .ps_bar   (fbdimm4_ss_),
                                      .sn       (fbdimm5_sn),
                                      .sn_bar   (fbdimm5_sn_),
                                      .pn       (fbdimm4_sn),
                                      .pn_bar   (fbdimm4_sn_),
                                      .ss       (fbdimm5_ss),
                                      .ss_bar   (fbdimm5_ss_),
				      .err_en   (XXERR_EN),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (XXCLK));
`else
`ifdef IDT_FBDIMM
idt_fbdimm #(NB_LINK,SB_LINK,5) fbdimm5 ( .ps       (fbdimm4_ss),
                                      .ps_bar   (fbdimm4_ss_),
                                      .sn       (fbdimm5_sn),
                                      .sn_bar   (fbdimm5_sn_),
                                      .pn       (fbdimm4_sn),
                                      .pn_bar   (fbdimm4_sn_),
                                      .sa       (sa[5]),
                                      .ss       (fbdimm5_ss),
                                      .ss_bar   (fbdimm5_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (idt_clk));
`else
`ifdef NEC_FBDIMM
nec_fbdimm #(NB_LINK,SB_LINK,5) fbdimm5 ( .ps       (fbdimm4_ss),
                                      .ps_bar   (fbdimm4_ss_),
                                      .sn       (fbdimm5_sn),
                                      .sn_bar   (fbdimm5_sn_),
                                      .pn       (fbdimm4_sn),
                                      .pn_bar   (fbdimm4_sn_),
                                      .sa       (sa[5]),
                                      .ss       (fbdimm5_ss),
                                      .ss_bar   (fbdimm5_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (nec_clk));
`else
fbdimm #(NB_LINK,SB_LINK,5) fbdimm5 ( .ps   	(fbdimm4_ss),
                                      .ps_bar 	(fbdimm4_ss_),
                                      .sn   	(fbdimm5_sn),
                                      .sn_bar   (fbdimm5_sn_),
                                      .pn   	(fbdimm4_sn),
                                      .pn_bar  	(fbdimm4_sn_),
                                      .ss   	(fbdimm5_ss),
                                      .ss_bar   (fbdimm5_ss_),
				      .err_en   (XXERR_EN),
                                      .sclk 	(XXCLK_G[5]));
`endif
`endif
`endif
`endif

`ifndef FBDIMM_NUM_6
//------------- FBDIMM 6 --------------------//
`ifdef MICRON_FBDIMM
micron_fbdimm #(NB_LINK,SB_LINK,6) fbdimm6 ( .ps   	(fbdimm5_ss),
                                      .ps_bar 	(fbdimm5_ss_),
                                      .sn   	(fbdimm6_sn),
                                      .sn_bar   (fbdimm6_sn_),
                                      .pn   	(fbdimm5_sn),
                                      .pn_bar  	(fbdimm5_sn_),
                                      .sa   	(sa[6]),
                                      .ss   	(fbdimm6_ss),
                                      .ss_bar   (fbdimm6_ss_),
				      .reset_n	(fbdimm_resetn),
                                      .sclk 	(micron_clk));
`else
`ifdef INPHI_FBDIMM
inphi_fbdimm #(NB_LINK,SB_LINK,6) fbdimm6 ( .ps   	(fbdimm5_ss),
                                      .ps_bar 	(fbdimm5_ss_),
                                      .sn   	(fbdimm6_sn),
                                      .sn_bar   (fbdimm6_sn_),
                                      .pn   	(fbdimm5_sn),
                                      .pn_bar  	(fbdimm5_sn_),
                                      .ss   	(fbdimm6_ss),
                                      .ss_bar   (fbdimm6_ss_),
				      .err_en   (XXERR_EN),
				      .reset_n	(fbdimm_resetn),
                                      .sclk 	(XXCLK));
`else
`ifdef IDT_FBDIMM
idt_fbdimm #(NB_LINK,SB_LINK,6) fbdimm6 ( .ps        (fbdimm5_ss),
                                      .ps_bar   (fbdimm5_ss_),
                                      .sn       (fbdimm6_sn),
                                      .sn_bar   (fbdimm6_sn_),
                                      .pn       (fbdimm5_sn),
                                      .pn_bar   (fbdimm5_sn_),
                                      .sa       (sa[6]),
                                      .ss       (fbdimm6_ss),
                                      .ss_bar   (fbdimm6_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (idt_clk));
`else
`ifdef NEC_FBDIMM
nec_fbdimm #(NB_LINK,SB_LINK,6) fbdimm6 ( .ps        (fbdimm5_ss),
                                      .ps_bar   (fbdimm5_ss_),
                                      .sn       (fbdimm6_sn),
                                      .sn_bar   (fbdimm6_sn_),
                                      .pn       (fbdimm5_sn),
                                      .pn_bar   (fbdimm5_sn_),
                                      .sa       (sa[6]),
                                      .ss       (fbdimm6_ss),
                                      .ss_bar   (fbdimm6_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (nec_clk));
`else
fbdimm #(NB_LINK,SB_LINK,6) fbdimm6 ( .ps   	(fbdimm5_ss),
                                      .ps_bar 	(fbdimm5_ss_),
                                      .sn   	(fbdimm6_sn),
                                      .sn_bar   (fbdimm6_sn_),
                                      .pn   	(fbdimm5_sn),
                                      .pn_bar  	(fbdimm5_sn_),
                                      .ss   	(fbdimm6_ss),
                                      .ss_bar   (fbdimm6_ss_),
				      .err_en   (XXERR_EN),
                                      .sclk 	(XXCLK_G[6]));
`endif
`endif
`endif
`endif

`ifndef FBDIMM_NUM_7
//------------- FBDIMM 7 --------------------//
`ifdef MICRON_FBDIMM
micron_fbdimm #(NB_LINK,SB_LINK,7) fbdimm7 ( .ps       (fbdimm6_ss),
                                      .ps_bar   (fbdimm6_ss_),
                                      .sn       (fbdimm7_sn),
                                      .sn_bar   (fbdimm7_sn_),
                                      .pn       (fbdimm6_sn),
                                      .pn_bar   (fbdimm6_sn_),
                                      .sa   	(sa[7]),
                                      .ss       (fbdimm7_ss),
                                      .ss_bar   (fbdimm7_ss_),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (micron_clk));
`else
`ifdef INPHI_FBDIMM
inphi_fbdimm #(NB_LINK,SB_LINK,7) fbdimm7 ( .ps       (fbdimm6_ss),
                                      .ps_bar   (fbdimm6_ss_),
                                      .sn       (fbdimm7_sn),
                                      .sn_bar   (fbdimm7_sn_),
                                      .pn       (fbdimm6_sn),
                                      .pn_bar   (fbdimm6_sn_),
                                      .ss       (fbdimm7_ss),
                                      .ss_bar   (fbdimm7_ss_),
				      .err_en   (XXERR_EN),
				      .reset_n	(fbdimm_resetn),
                                      .sclk     (XXCLK));
`else
`ifdef IDT_FBDIMM
idt_fbdimm #(NB_LINK,SB_LINK,7) fbdimm7 ( .ps       (fbdimm6_ss),
                                      .ps_bar   (fbdimm6_ss_),
                                      .sn       (fbdimm7_sn),
                                      .sn_bar   (fbdimm7_sn_),
                                      .pn       (fbdimm6_sn),
                                      .pn_bar   (fbdimm6_sn_),
                                      .sa       (sa[7]),
                                      .ss       (fbdimm7_ss),
                                      .ss_bar   (fbdimm7_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (idt_clk));
`else
`ifdef NEC_FBDIMM
nec_fbdimm #(NB_LINK,SB_LINK,7) fbdimm7 ( .ps       (fbdimm6_ss),
                                      .ps_bar   (fbdimm6_ss_),
                                      .sn       (fbdimm7_sn),
                                      .sn_bar   (fbdimm7_sn_),
                                      .pn       (fbdimm6_sn),
                                      .pn_bar   (fbdimm6_sn_),
                                      .sa       (sa[7]),
                                      .ss       (fbdimm7_ss),
                                      .ss_bar   (fbdimm7_ss_),
                                      .reset_n  (fbdimm_resetn),
                                      .err_en   (XXERR_EN),
                                      .sclk     (nec_clk));
`else
fbdimm #(NB_LINK,SB_LINK,7) fbdimm7 ( .ps   	(fbdimm6_ss),
                                      .ps_bar 	(fbdimm6_ss_),
                                      .sn   	(fbdimm7_sn),
                                      .sn_bar  	(fbdimm7_sn_),
                                      .pn   	(fbdimm6_sn),
                                      .pn_bar   (fbdimm6_sn_),
                                      .ss   	(fbdimm7_ss),
                                      .ss_bar   (fbdimm7_ss_),
				      .err_en   (XXERR_EN),
                                      .sclk 	(XXCLK_G[7]));
`endif
`endif
`endif
`endif

`endif
`endif
`endif
`endif
`endif
`endif
`endif

endmodule //fbdimm_ch_mem
