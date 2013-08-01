// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nb_bitlane_deskew.v
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
`timescale 1fs/1fs

module  nb_bitlane_deskew(
  fbdimm0a_rx_p_top, fbdimm0a_rx_n_top, fbdimm0b_rx_p_top, fbdimm0b_rx_n_top,
  fbdimm1a_rx_p_top, fbdimm1a_rx_n_top, fbdimm1b_rx_p_top, fbdimm1b_rx_n_top,
  fbdimm2a_rx_p_top, fbdimm2a_rx_n_top, fbdimm2b_rx_p_top, fbdimm2b_rx_n_top,
  fbdimm3a_rx_p_top, fbdimm3a_rx_n_top, fbdimm3b_rx_p_top, fbdimm3b_rx_n_top,
  FBDIMM0A_RX_P_TOP, FBDIMM0A_RX_N_TOP, FBDIMM0B_RX_P_TOP, FBDIMM0B_RX_N_TOP,
  FBDIMM1A_RX_P_TOP, FBDIMM1A_RX_N_TOP, FBDIMM1B_RX_P_TOP, FBDIMM1B_RX_N_TOP,
  FBDIMM2A_RX_P_TOP, FBDIMM2A_RX_N_TOP, FBDIMM2B_RX_P_TOP, FBDIMM2B_RX_N_TOP,
  FBDIMM3A_RX_P_TOP, FBDIMM3A_RX_N_TOP, FBDIMM3B_RX_P_TOP, FBDIMM3B_RX_N_TOP,
  sysclk
);

input  [13:0]		fbdimm0a_rx_p_top;
input  [13:0]		fbdimm0a_rx_n_top;
input  [13:0]		fbdimm0b_rx_p_top;
input  [13:0]		fbdimm0b_rx_n_top;
input  [13:0]		fbdimm1a_rx_p_top;
input  [13:0]		fbdimm1a_rx_n_top;
input  [13:0]		fbdimm1b_rx_p_top;
input  [13:0]		fbdimm1b_rx_n_top;
input  [13:0]		fbdimm2a_rx_p_top;
input  [13:0]		fbdimm2a_rx_n_top;
input  [13:0]		fbdimm2b_rx_p_top;
input  [13:0]		fbdimm2b_rx_n_top;
input  [13:0]		fbdimm3a_rx_p_top;
input  [13:0]		fbdimm3a_rx_n_top;
input  [13:0]		fbdimm3b_rx_p_top;
input  [13:0]		fbdimm3b_rx_n_top;

output  [13:0]		FBDIMM0A_RX_P_TOP;
output  [13:0]		FBDIMM0A_RX_N_TOP;
output  [13:0]		FBDIMM0B_RX_P_TOP;
output  [13:0]		FBDIMM0B_RX_N_TOP;
output  [13:0]		FBDIMM1A_RX_P_TOP;
output  [13:0]		FBDIMM1A_RX_N_TOP;
output  [13:0]		FBDIMM1B_RX_P_TOP;
output  [13:0]		FBDIMM1B_RX_N_TOP;
output  [13:0]		FBDIMM2A_RX_P_TOP;
output  [13:0]		FBDIMM2A_RX_N_TOP;
output  [13:0]		FBDIMM2B_RX_P_TOP;
output  [13:0]		FBDIMM2B_RX_N_TOP;
output  [13:0]		FBDIMM3A_RX_P_TOP;
output  [13:0]		FBDIMM3A_RX_N_TOP;
output  [13:0]		FBDIMM3B_RX_P_TOP;
output  [13:0]		FBDIMM3B_RX_N_TOP;

input			sysclk;

`ifdef MCU_GATE
wire			init_done_0 = (`MCU0.fbdic__n15588) ;
wire			init_done_1 = (`MCU1.fbdic__n15588) ;
wire			init_done_2 = (`MCU2.fbdic__n15588) ;
wire			init_done_3 = (`MCU3.fbdic__n15588) ;
`else
wire			init_done_0 = (`MCU0.fbdic.fbdic_l0_state) ;
wire			init_done_1 = (`MCU1.fbdic.fbdic_l0_state) ;
wire			init_done_2 = (`MCU2.fbdic.fbdic_l0_state) ;
wire			init_done_3 = (`MCU3.fbdic.fbdic_l0_state) ;
`endif // mcu_gate

wire			skew_enable_0;
wire			skew_enable_1;
wire			skew_enable_2;
wire			skew_enable_3;

reg				dtm_enabled;

reg             ref_dram_12x_clk_reg;
wire            dram_12x_clk;
integer         ref_dram_12x_clk_period;
integer         time1_r, time2_r;

assign skew_enable_0 = dtm_enabled ? init_done_0 : 1'b1;
assign skew_enable_1 = dtm_enabled ? init_done_1 : 1'b1;
assign skew_enable_2 = dtm_enabled ? init_done_2 : 1'b1;
assign skew_enable_3 = dtm_enabled ? init_done_3 : 1'b1;

// ---- Clock Generator for FBD Channel clock ; dr_clk X 12 (linkclk) -----

initial
begin
  #1;

  if ($test$plusargs("DTM_ENABLED"))
    dtm_enabled = 1;
  else
    dtm_enabled = 0;

  ref_dram_12x_clk_reg=0;
  @ (posedge `CCU.ccu_rst_sync_stable);
  @ (posedge sysclk);
  time1_r=$realtime;
  @ (posedge sysclk);
  time2_r=$realtime;
  if (dtm_enabled)
    ref_dram_12x_clk_period=(time2_r-time1_r)/(12);
  else
    ref_dram_12x_clk_period=(time2_r-time1_r)/(12*2);
  forever begin #(ref_dram_12x_clk_period/2) ref_dram_12x_clk_reg = ~ref_dram_12x_clk_reg; end
end

  assign dram_12x_clk = ref_dram_12x_clk_reg ;

//-----------------------------------
// NB Bit Lane Deskew Modules 
//-----------------------------------

nb_bit_lane_deskew nb_bitdskw0a_p (
  .pn_in		(fbdimm0a_rx_p_top[13:0]),
  .pn_out		(FBDIMM0A_RX_P_TOP[13:0]),
  .init			(skew_enable_0),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw0a_n (
  .pn_in		(fbdimm0a_rx_n_top[13:0]),
  .pn_out		(FBDIMM0A_RX_N_TOP[13:0]),
  .init			(skew_enable_0),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw0b_p (
  .pn_in		(fbdimm0b_rx_p_top[13:0]),
  .pn_out		(FBDIMM0B_RX_P_TOP[13:0]),
  .init			(skew_enable_0),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw0b_n (
  .pn_in		(fbdimm0b_rx_n_top[13:0]),
  .pn_out		(FBDIMM0B_RX_N_TOP[13:0]),
  .init			(skew_enable_0),
  .sclk         (dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw1a_p (
  .pn_in		(fbdimm1a_rx_p_top[13:0]),
  .pn_out		(FBDIMM1A_RX_P_TOP[13:0]),
  .init			(skew_enable_1),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw1a_n (
  .pn_in		(fbdimm1a_rx_n_top[13:0]),
  .pn_out		(FBDIMM1A_RX_N_TOP[13:0]),
  .init			(skew_enable_1),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw1b_p (
  .pn_in		(fbdimm1b_rx_p_top[13:0]),
  .pn_out		(FBDIMM1B_RX_P_TOP[13:0]),
  .init			(skew_enable_1),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw1b_n (
  .pn_in		(fbdimm1b_rx_n_top[13:0]),
  .pn_out		(FBDIMM1B_RX_N_TOP[13:0]),
  .init			(skew_enable_1),
  .sclk         (dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw2a_p (
  .pn_in		(fbdimm2a_rx_p_top[13:0]),
  .pn_out		(FBDIMM2A_RX_P_TOP[13:0]),
  .init			(skew_enable_2),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw2a_n (
  .pn_in		(fbdimm2a_rx_n_top[13:0]),
  .pn_out		(FBDIMM2A_RX_N_TOP[13:0]),
  .init			(skew_enable_2),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw2b_p (
  .pn_in		(fbdimm2b_rx_p_top[13:0]),
  .pn_out		(FBDIMM2B_RX_P_TOP[13:0]),
  .init			(skew_enable_2),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw2b_n (
  .pn_in		(fbdimm2b_rx_n_top[13:0]),
  .pn_out		(FBDIMM2B_RX_N_TOP[13:0]),
  .init			(skew_enable_2),
  .sclk         (dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw3a_p (
  .pn_in		(fbdimm3a_rx_p_top[13:0]),
  .pn_out		(FBDIMM3A_RX_P_TOP[13:0]),
  .init			(skew_enable_3),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw3a_n (
  .pn_in		(fbdimm3a_rx_n_top[13:0]),
  .pn_out		(FBDIMM3A_RX_N_TOP[13:0]),
  .init			(skew_enable_3),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw3b_p (
  .pn_in		(fbdimm3b_rx_p_top[13:0]),
  .pn_out		(FBDIMM3B_RX_P_TOP[13:0]),
  .init			(skew_enable_3),
  .sclk			(dram_12x_clk)
);

nb_bit_lane_deskew nb_bitdskw3b_n (
  .pn_in		(fbdimm3b_rx_n_top[13:0]),
  .pn_out		(FBDIMM3B_RX_N_TOP[13:0]),
  .init			(skew_enable_3),
  .sclk         (dram_12x_clk)
);

endmodule
