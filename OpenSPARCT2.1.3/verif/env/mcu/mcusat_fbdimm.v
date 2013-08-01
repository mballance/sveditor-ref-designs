// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcusat_fbdimm.v
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
module mcusat_fbdimm(
   fbdimm0_ps, fbdimm0_ps_bar, fbdimm0_pn , fbdimm0_pn_bar, // channel 0 interface
   fbdimm1_ps, fbdimm1_ps_bar, fbdimm1_pn , fbdimm1_pn_bar, // channel 1 interface
   fbdimm2_ps, fbdimm2_ps_bar, fbdimm2_pn , fbdimm2_pn_bar, // channel 2 interface
   fbdimm3_ps, fbdimm3_ps_bar, fbdimm3_pn , fbdimm3_pn_bar, // channel 3 interface
   fbdimm4_ps, fbdimm4_ps_bar, fbdimm4_pn , fbdimm4_pn_bar, // channel 4 interface
   fbdimm5_ps, fbdimm5_ps_bar, fbdimm5_pn , fbdimm5_pn_bar, // channel 5 interface
   fbdimm6_ps, fbdimm6_ps_bar, fbdimm6_pn , fbdimm6_pn_bar, // channel 6 interface
   fbdimm7_ps, fbdimm7_ps_bar, fbdimm7_pn , fbdimm7_pn_bar, // channel 7 interface
   fbdimm_sclk, chmon_rst
   );
   

input [9:0]	fbdimm0_ps;		// to primary fbdimm models
input [9:0]	fbdimm0_ps_bar;		// to primary fbdimm models
output [13:0]	fbdimm0_pn;		// to primary fbdimm models
output [13:0]	fbdimm0_pn_bar;		// to primary fbdimm models

input [9:0]	fbdimm1_ps;		// to primary fbdimm models
input [9:0]	fbdimm1_ps_bar;		// to primary fbdimm models
output [13:0]	fbdimm1_pn;		// to primary fbdimm models
output [13:0]	fbdimm1_pn_bar;		// to primary fbdimm models

input [9:0]	fbdimm2_ps;		// to primary fbdimm models
input [9:0]	fbdimm2_ps_bar;		// to primary fbdimm models
output [13:0]	fbdimm2_pn;		// to primary fbdimm models
output [13:0]	fbdimm2_pn_bar;		// to primary fbdimm models

input [9:0]	fbdimm3_ps;		// to primary fbdimm models
input [9:0]	fbdimm3_ps_bar;		// to primary fbdimm models
output [13:0]	fbdimm3_pn;		// to primary fbdimm models
output [13:0]	fbdimm3_pn_bar;		// to primary fbdimm models

input [9:0]	fbdimm4_ps;		// to primary fbdimm models
input [9:0]	fbdimm4_ps_bar;		// to primary fbdimm models
output [13:0]	fbdimm4_pn;		// to primary fbdimm models
output [13:0]	fbdimm4_pn_bar;		// to primary fbdimm models

input [9:0]	fbdimm5_ps;		// to primary fbdimm models
input [9:0]	fbdimm5_ps_bar;		// to primary fbdimm models
output [13:0]	fbdimm5_pn;		// to primary fbdimm models
output [13:0]	fbdimm5_pn_bar;		// to primary fbdimm models

input [9:0]	fbdimm6_ps;		// to primary fbdimm models
input [9:0]	fbdimm6_ps_bar;		// to primary fbdimm models
output [13:0]	fbdimm6_pn;		// to primary fbdimm models
output [13:0]	fbdimm6_pn_bar;		// to primary fbdimm models

input [9:0]	fbdimm7_ps;		// to primary fbdimm models
input [9:0]	fbdimm7_ps_bar;		// to primary fbdimm models
output [13:0]	fbdimm7_pn;		// to primary fbdimm models
output [13:0]	fbdimm7_pn_bar;		// to primary fbdimm models

input 		fbdimm_sclk;
input 		chmon_rst;

reg [1:0]     ch_err_enable;


`ifdef ENABLE_FBD_CH_MON
// FBD Channel Monitor
parameter	NB_LINK = 14;
parameter	SB_LINK = 10;
wire		chmon_rst;
wire	        ch_mon_clk;
`endif

`ifdef AXIS_DDR2_MODEL
//axis ddr2 model
wire [71:0] dq0;
wire [71:0] dq1;
wire [71:0] dq2;
wire [71:0] dq3;
wire [71:0] dq4;
wire [71:0] dq5;
wire [71:0] dq6;
wire [71:0] dq7;
wire dqs0;
wire dqs1;
wire dqs2;
wire dqs3;

   n2_dimm axis_dimm (
                      .CK0   (`FBD_CH_PATH0.fbdimm0.dram_clk),
                      .bCK0  (~ `FBD_CH_PATH0.fbdimm0.dram_clk),
                      .bCS0  (`FBD_CH_PATH0.fbdimm0.bcs[1]),
                      .bRAS0 (`FBD_CH_PATH0.fbdimm0.bras[1]),
                      .bCAS0 (`FBD_CH_PATH0.fbdimm0.bcas[1]),
                      .bWE0  (`FBD_CH_PATH0.fbdimm0.bwe[1]),
                      .BA0   (`FBD_CH_PATH0.fbdimm0.ba),
                      .Addr0 (`FBD_CH_PATH0.fbdimm0.addr),
                      .DQ0   ({dq1,dq0}),
                      .DQS0   (dqs0),

                      .CK1   (`FBD_CH_PATH2.fbdimm0.dram_clk),
                      .bCK1  (~ `FBD_CH_PATH2.fbdimm0.dram_clk),
                      .bCS1  (`FBD_CH_PATH2.fbdimm0.bcs[1]),
                      .bRAS1 (`FBD_CH_PATH2.fbdimm0.bras[1]),
                      .bCAS1 (`FBD_CH_PATH2.fbdimm0.bcas[1]),
                      .bWE1  (`FBD_CH_PATH2.fbdimm0.bwe[1]),
                      .BA1   (`FBD_CH_PATH2.fbdimm0.ba),
                      .Addr1 (`FBD_CH_PATH2.fbdimm0.addr),
                      .DQ1   ({dq3,dq2}),
                      .DQS1   (dqs1),

                      .CK2   (`FBD_CH_PATH4.fbdimm0.dram_clk),
                      .bCK2  (~ `FBD_CH_PATH4.fbdimm0.dram_clk),
                      .bCS2  (`FBD_CH_PATH4.fbdimm0.bcs[1]),
                      .bRAS2 (`FBD_CH_PATH4.fbdimm0.bras[1]),
                      .bCAS2 (`FBD_CH_PATH4.fbdimm0.bcas[1]),
                      .bWE2  (`FBD_CH_PATH4.fbdimm0.bwe[1]),
                      .BA2   (`FBD_CH_PATH4.fbdimm0.ba),
                      .Addr2 (`FBD_CH_PATH4.fbdimm0.addr),
                      .DQ2   ({dq5,dq4}),
                      .DQS2   (dqs2),

                      .CK3   (`FBD_CH_PATH6.fbdimm0.dram_clk),
                      .bCK3  (~ `FBD_CH_PATH6.fbdimm0.dram_clk),
                      .bCS3  (`FBD_CH_PATH6.fbdimm0.bcs[1]),
                      .bRAS3 (`FBD_CH_PATH6.fbdimm0.bras[1]),
                      .bCAS3 (`FBD_CH_PATH6.fbdimm0.bcas[1]),
                      .bWE3  (`FBD_CH_PATH6.fbdimm0.bwe[1]),
                      .BA3   (`FBD_CH_PATH6.fbdimm0.ba),
                      .Addr3 (`FBD_CH_PATH6.fbdimm0.addr),
                      .DQ3   ({dq7,dq6}),
                      .DQS3   (dqs3)
                    );

//axis ddr2 model doesn't use these for write cycles, so xmr only works from here into amb code
assign `FBD_CH_PATH0.fbdimm0.dqs={19{dqs0}};
assign `FBD_CH_PATH1.fbdimm0.dqs={19{dqs0}};
assign `FBD_CH_PATH2.fbdimm0.dqs={19{dqs1}};
assign `FBD_CH_PATH3.fbdimm0.dqs={19{dqs1}};
assign `FBD_CH_PATH4.fbdimm0.dqs={19{dqs2}};
assign `FBD_CH_PATH5.fbdimm0.dqs={19{dqs2}};
assign `FBD_CH_PATH6.fbdimm0.dqs={19{dqs3}};
assign `FBD_CH_PATH7.fbdimm0.dqs={19{dqs3}};

`endif

//--------------------------------
// INSTANTIATING FB-DIMM CHANNELS
//--------------------------------

   fbdimm_ch_mem fbdimm_mem0 (
		.XXPS 		(fbdimm0_ps),
		.XXPS_BAR 	(fbdimm0_ps_bar),
		.XXPN 		(fbdimm0_pn),
		.XXPN_BAR 	(fbdimm0_pn_bar),
`ifdef AXIS_DDR2_MODEL
		.dq             (dq0),
`endif
                .XXERR_EN       (ch_err_enable[0]),
                .XXCLK		(fbdimm_sclk));

`ifndef SNG_CHANNEL
   fbdimm_ch_mem fbdimm_mem1 (
		.XXPS 		(fbdimm1_ps),
		.XXPS_BAR 	(fbdimm1_ps_bar),
		.XXPN 		(fbdimm1_pn),
		.XXPN_BAR 	(fbdimm1_pn_bar),
`ifdef AXIS_DDR2_MODEL
		.dq             (dq1),
`endif
                .XXERR_EN       (ch_err_enable[1]),
                .XXCLK		(fbdimm_sclk));
`endif

   fbdimm_ch_mem fbdimm_mem2 (
		.XXPS 		(fbdimm2_ps),
		.XXPS_BAR 	(fbdimm2_ps_bar),
		.XXPN 		(fbdimm2_pn),
		.XXPN_BAR 	(fbdimm2_pn_bar),
`ifdef AXIS_DDR2_MODEL
                .dq             (dq2),
`endif
                .XXERR_EN       (ch_err_enable[0]),
                .XXCLK		(fbdimm_sclk));

`ifndef SNG_CHANNEL
   fbdimm_ch_mem fbdimm_mem3 (
		.XXPS 		(fbdimm3_ps),
		.XXPS_BAR 	(fbdimm3_ps_bar),
		.XXPN 		(fbdimm3_pn),
		.XXPN_BAR 	(fbdimm3_pn_bar),
`ifdef AXIS_DDR2_MODEL
		.dq             (dq3),
`endif
                .XXERR_EN       (ch_err_enable[1]),
                .XXCLK		(fbdimm_sclk));
`endif

   fbdimm_ch_mem fbdimm_mem4 (
		.XXPS 		(fbdimm4_ps),
		.XXPS_BAR 	(fbdimm4_ps_bar),
		.XXPN 		(fbdimm4_pn),
		.XXPN_BAR 	(fbdimm4_pn_bar),
`ifdef AXIS_DDR2_MODEL
		.dq             (dq4),
`endif
                .XXERR_EN       (ch_err_enable[0]),
                .XXCLK		(fbdimm_sclk));

`ifndef SNG_CHANNEL
   fbdimm_ch_mem fbdimm_mem5 (
		.XXPS 		(fbdimm5_ps),
		.XXPS_BAR 	(fbdimm5_ps_bar),
		.XXPN 		(fbdimm5_pn),
		.XXPN_BAR 	(fbdimm5_pn_bar),
`ifdef AXIS_DDR2_MODEL
		.dq             (dq5),
`endif
                .XXERR_EN       (ch_err_enable[1]),
                .XXCLK		(fbdimm_sclk));
`endif

   fbdimm_ch_mem fbdimm_mem6 (
		.XXPS 		(fbdimm6_ps),
		.XXPS_BAR 	(fbdimm6_ps_bar),
		.XXPN 		(fbdimm6_pn),
		.XXPN_BAR 	(fbdimm6_pn_bar),
`ifdef AXIS_DDR2_MODEL
		.dq             (dq6),
`endif
                .XXERR_EN       (ch_err_enable[0]),
                .XXCLK		(fbdimm_sclk));

`ifndef SNG_CHANNEL
   fbdimm_ch_mem fbdimm_mem7 (
		.XXPS 		(fbdimm7_ps),
		.XXPS_BAR 	(fbdimm7_ps_bar),
		.XXPN 		(fbdimm7_pn),
		.XXPN_BAR 	(fbdimm7_pn_bar),
`ifdef AXIS_DDR2_MODEL
		.dq             (dq7),
`endif
                .XXERR_EN       (ch_err_enable[1]),
                .XXCLK		(fbdimm_sclk));
`endif

`ifdef ENABLE_FBD_CH_MON
channel_mon #(SB_LINK,NB_LINK) ch_mon0 ( 
                .ps 		(fbdimm0_ps),
                .ps_bar 	(fbdimm0_ps_bar),
                .pn 		(fbdimm0_pn),
                .rst            (chmon_rst),
                .sclk           (ch_mon_clk));

`ifndef SNG_CHANNEL
channel_mon #(SB_LINK,NB_LINK) ch_mon1 ( 
                .ps 		(fbdimm1_ps),
                .ps_bar 	(fbdimm1_ps_bar),
                .pn 		(fbdimm1_pn),
                .rst            (chmon_rst),
                .sclk           (ch_mon_clk));
`endif

channel_mon #(SB_LINK,NB_LINK) ch_mon2 ( 
                .ps 		(fbdimm2_ps),
                .ps_bar 	(fbdimm2_ps_bar),
                .pn 		(fbdimm2_pn),
                .rst            (chmon_rst),
                .sclk           (ch_mon_clk));

`ifndef SNG_CHANNEL
channel_mon #(SB_LINK,NB_LINK) ch_mon3 ( 
                .ps 		(fbdimm3_ps),
                .ps_bar 	(fbdimm3_ps_bar),
                .pn 		(fbdimm3_pn),
                .rst            (chmon_rst),
                .sclk           (ch_mon_clk));
`endif

channel_mon #(SB_LINK,NB_LINK) ch_mon4 ( 
                .ps 		(fbdimm4_ps),
                .ps_bar 	(fbdimm4_ps_bar),
                .pn 		(fbdimm4_pn),
                .rst            (chmon_rst),
                .sclk           (ch_mon_clk));

`ifndef SNG_CHANNEL
channel_mon #(SB_LINK,NB_LINK) ch_mon5 ( 
                .ps 		(fbdimm5_ps),
                .ps_bar 	(fbdimm5_ps_bar),
                .pn 		(fbdimm5_pn),
                .rst            (chmon_rst),
                .sclk           (ch_mon_clk));
`endif

channel_mon #(SB_LINK,NB_LINK) ch_mon6 ( 
                .ps 		(fbdimm6_ps),
                .ps_bar 	(fbdimm6_ps_bar),
                .pn 		(fbdimm6_pn),
                .rst            (chmon_rst),
                .sclk           (ch_mon_clk));

`ifndef SNG_CHANNEL
channel_mon #(SB_LINK,NB_LINK) ch_mon7 ( 
                .ps 		(fbdimm7_ps),
                .ps_bar 	(fbdimm7_ps_bar),
                .pn 		(fbdimm7_pn),
                .rst            (chmon_rst),
                .sclk           (ch_mon_clk));
`endif

assign 	ch_mon_clk  = tb_top.dram_12x_clk;

`endif

initial
begin
     if ($test$plusargs("CHNL0_ERR_ENABLE"))    
        ch_err_enable[0] = 1'b1;
     else
        ch_err_enable[0] = 1'b0;

     if ($test$plusargs("CHNL1_ERR_ENABLE"))    
        ch_err_enable[1] = 1'b1;
     else
        ch_err_enable[1] = 1'b0;
end

endmodule
