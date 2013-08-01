// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pmu_pdp_dp.v
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
module pmu_pdp_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  scan_out, 
  in_rngl_cdbus, 
  pct_rd_pic, 
  pct_rd_a_pic, 
  pct_rd_pic_pcr, 
  pct_bypass_asi, 
  pct_pcr_data, 
  pct_exception, 
  pct_pic_clken, 
  pct_pic07_w2_clken, 
  pct_wr_pic_w2, 
  pct_incr_pic_w1, 
  pct_incr_asi_w1, 
  pct_pich07_add_w2, 
  pct_picl07_add_w2, 
  pmu_asi_clken, 
  pmu_rngl_cdbus, 
  pdp_asi_din_to_pctl, 
  pdp_asi_ctlin_to_pctl_15_8, 
  pdp_asi_ctlin_to_pctl_4_0, 
  pdp_pich_cout07, 
  pdp_picl_cout07, 
  pdp_pich_wrap, 
  pdp_picl_wrap);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire asi_din_scanin;
wire asi_din_scanout;
wire [63:0] pdp_asi_din;
wire pic0_scanin;
wire pic0_scanout;
wire [31:0] pich07_incr;
wire [31:0] picl07_incr;
wire [31:0] pich0;
wire [31:0] picl0;
wire [7:0] pdp_pich_wrapa;
wire [7:0] pdp_picl_wrapa;
wire [7:0] pdp_pich_wrapb;
wire [7:0] pdp_picl_wrapb;
wire pic1_scanin;
wire pic1_scanout;
wire [31:0] pich1;
wire [31:0] picl1;
wire pic2_scanin;
wire pic2_scanout;
wire [31:0] pich2;
wire [31:0] picl2;
wire pic3_scanin;
wire pic3_scanout;
wire [31:0] pich3;
wire [31:0] picl3;
wire pic4_scanin;
wire pic4_scanout;
wire [31:0] pich4;
wire [31:0] picl4;
wire pic5_scanin;
wire pic5_scanout;
wire [31:0] pich5;
wire [31:0] picl5;
wire pic6_scanin;
wire pic6_scanout;
wire [31:0] pich6;
wire [31:0] picl6;
wire pic7_scanin;
wire pic7_scanout;
wire [31:0] pich7;
wire [31:0] picl7;
wire [31:0] pich07_w1;
wire [31:0] picl07_w1;
wire pic07_w2_scanin;
wire pic07_w2_scanout;
wire [31:0] pich07_w2;
wire [31:0] picl07_w2;
wire [63:0] pdp_pic_data;
wire [63:0] picpcr_data;
wire asi_dout_scanin;
wire asi_dout_scanout;
wire [63:0] pmu_rngl_cdbus_nobuf;


// *** globals ***
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input 		spc_aclk;    
input 		spc_bclk;    
input		tcu_scan_en;
output		scan_out;

// ASI write data bus
input	[63:0]	in_rngl_cdbus;		// ASI ring data input

// ASI read controls
input   [7:0]	pct_rd_pic;		// ASI read of PIC (bit 7 == read PIC for tid 7)
input		pct_rd_a_pic;		// ASI read of any PIC
input		pct_rd_pic_pcr;         // ASI read of PIC or PCR (select PIC or PCR)
input		pct_bypass_asi;		// Flow this node's ASI data to the output
input	[31:0]	pct_pcr_data;		// PCR data on ASI read
input		pct_exception;		// If a privileged exception on an ASR read or write to PIC or PCR
input	[7:0]	pct_pic_clken;		// Clock enables for PIC
input 		pct_pic07_w2_clken; 	// Clock enable for pic07_w2 flop 
// ASI write controls
input	[7:0]	pct_wr_pic_w2;		// Write corresponding PICH/L from ASI (bit 7 == write PIC7)
input	[6:0]	pct_incr_pic_w1;	// increment PIC (PICL is enabled for counting) W+1 cycle (mux prior to adding)
input		pct_incr_asi_w1;	// Select new ASI value to increment to deal with simultaneous ASI write and increment

// Event inputs
input	[3:0]	pct_pich07_add_w2;	// Add value for pich 
input	[3:0]	pct_picl07_add_w2;	// Add value for picl 

// ASI pwr mgmt
input		pmu_asi_clken;		// Gate ASI ring flops

// ASI outputs
output	[63:0]  pmu_rngl_cdbus;		// ASI ring data out 
output	[31:0]	pdp_asi_din_to_pctl;	// for PCR writes
output	[7:0]	pdp_asi_ctlin_to_pctl_15_8;  // Bits 63:56 of registered data from PDP (save 8 flop bits)
output	[4:0] 	pdp_asi_ctlin_to_pctl_4_0;  // Bits 63:48 of registered data from PDP (save 5 flop bits)

// Carry-out bits for PCR of each counter
output		pdp_pich_cout07;	// carry-outs of incrementors, to set OV bits in PCR's
output		pdp_picl_cout07;		

// Wrap indicators for trap generation
output	[7:0]	pdp_pich_wrap;		// If counter within -16..-1
output	[7:0]	pdp_picl_wrap;		// If counter within -16..-1

// scan renames
//assign pce_ov = tcu_pce_ov;
//assign stop = tcu_clk_stop;
assign stop = 1'b0;
//assign siclk = spc_aclk;    
//assign soclk = spc_bclk;
//assign se = tcu_scan_en;
// end scan

pmu_pdp_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);

// First put in the ASI staging reg, bit 64 is flopped in ctl
pmu_pdp_dp_msff_macro__stack_64c__width_64 asi_din  (
 .scan_in(asi_din_scanin),
 .scan_out(asi_din_scanout),
 .clk ( l2clk                    ),
 .en  ( pmu_asi_clken            ),  // powerdown pin
 .din( in_rngl_cdbus[63:0]), 
 .dout( pdp_asi_din[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign pdp_asi_din_to_pctl[31:0] = pdp_asi_din[31:0]; 	// bus to pctl for PCR writes
assign pdp_asi_ctlin_to_pctl_15_8[7:0] = pdp_asi_din[63:56];// Bits 63:56 of registered data from PDP (save 8 flop bits)
assign pdp_asi_ctlin_to_pctl_4_0[4:0] = pdp_asi_din[52:48];// Bits 52:48 of registered data from PDP (save 5 flop bits)

// PICs
// There are 8, 1 for each thread

// split the 64 bit 3-input mux to two 32 bit ones
// and use AND to zero out the counter values

// PIC0

pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 pic0     (
 .scan_in(pic0_scanin),
 .scan_out(pic0_scanout),
 .clk ( l2clk                    ),
 .en  ( pct_pic_clken[0]         ),  // powerdown pin
 .din0( pdp_asi_din[63:0] ), 
 .din1( {pich07_incr[31:0],picl07_incr[31:0]} ),
 .sel0( pct_wr_pic_w2[0] ),
 .dout( {pich0[31:0],picl0[31:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

pmu_pdp_dp_cmp_macro__width_16 pic0hca  (
 .din0(pich0[31:16]),
 .din1(16'hffff),
 .dout(pdp_pich_wrapa[0]));
pmu_pdp_dp_cmp_macro__width_16 pic0lca  (
 .din0(picl0[31:16]),
 .din1(16'hffff),
 .dout(pdp_picl_wrapa[0]));

pmu_pdp_dp_cmp_macro__width_12 pic0hcb  (
 .din0(pich0[15:4]),
 .din1(12'hfff),
 .dout(pdp_pich_wrapb[0]));
pmu_pdp_dp_cmp_macro__width_12 pic0lcb  (
 .din0(picl0[15:4]),
 .din1(12'hfff),
 .dout(pdp_picl_wrapb[0]));

// the ANDing is done for all 8 threads after PIC7
//and_macro pich0wrap (width=2, ports=2) (
// .din0   ({pdp_pich_wrapa[0],pdp_picl_wrapa[0]}),
// .din1   ({pdp_pich_wrapb[0],pdp_picl_wrapb[0]}),
// .dout   ({pdp_pich_wrap[0], pdp_picl_wrap[0]});

// PIC1
pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 pic1     (
 .scan_in(pic1_scanin),
 .scan_out(pic1_scanout),
 .clk ( l2clk                    ),
 .en  ( pct_pic_clken[1]         ),  // powerdown pin
 .din0( pdp_asi_din[63:0] ), 
 .din1( {pich07_incr[31:0],picl07_incr[31:0]} ),
 .sel0( pct_wr_pic_w2[1] ),
 .dout( {pich1[31:0],picl1[31:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

pmu_pdp_dp_cmp_macro__width_16 pic1hca  (
 .din0(pich1[31:16]),
 .din1(16'hffff),
 .dout(pdp_pich_wrapa[1]));
pmu_pdp_dp_cmp_macro__width_16 pic1lca  (
 .din0(picl1[31:16]),
 .din1(16'hffff),
 .dout(pdp_picl_wrapa[1]));

pmu_pdp_dp_cmp_macro__width_12 pic1hcb  (
 .din0(pich1[15:4]),
 .din1(12'hfff),
 .dout(pdp_pich_wrapb[1]));
pmu_pdp_dp_cmp_macro__width_12 pic1lcb  (
 .din0(picl1[15:4]),
 .din1(12'hfff),
 .dout(pdp_picl_wrapb[1]));

// PIC2
pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 pic2     (
 .scan_in(pic2_scanin),
 .scan_out(pic2_scanout),
 .clk ( l2clk                    ),
 .en  ( pct_pic_clken[2]         ),  // powerdown pin
 .din0( pdp_asi_din[63:0] ), 
 .din1( {pich07_incr[31:0],picl07_incr[31:0]} ),
 .sel0( pct_wr_pic_w2[2] ),
 .dout( {pich2[31:0],picl2[31:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

pmu_pdp_dp_cmp_macro__width_16 pic2hca  (
 .din0(pich2[31:16]),
 .din1(16'hffff),
 .dout(pdp_pich_wrapa[2]));
pmu_pdp_dp_cmp_macro__width_16 pic2lca  (
 .din0(picl2[31:16]),
 .din1(16'hffff),
 .dout(pdp_picl_wrapa[2]));

pmu_pdp_dp_cmp_macro__width_12 pic2hcb  (
 .din0(pich2[15:4]),
 .din1(12'hfff),
 .dout(pdp_pich_wrapb[2]));
pmu_pdp_dp_cmp_macro__width_12 pic2lcb  (
 .din0(picl2[15:4]),
 .din1(12'hfff),
 .dout(pdp_picl_wrapb[2]));

// PIC3
pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 pic3     (
 .scan_in(pic3_scanin),
 .scan_out(pic3_scanout),
 .clk ( l2clk                    ),
 .en  ( pct_pic_clken[3]         ),  // powerdown pin
 .din0( pdp_asi_din[63:0] ), 
 .din1( {pich07_incr[31:0],picl07_incr[31:0]} ),
 .sel0( pct_wr_pic_w2[3] ),
 .dout( {pich3[31:0],picl3[31:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

pmu_pdp_dp_cmp_macro__width_16 pic3hca  (
 .din0(pich3[31:16]),
 .din1(16'hffff),
 .dout(pdp_pich_wrapa[3]));
pmu_pdp_dp_cmp_macro__width_16 pic3lca  (
 .din0(picl3[31:16]),
 .din1(16'hffff),
 .dout(pdp_picl_wrapa[3]));

pmu_pdp_dp_cmp_macro__width_12 pic3hcb  (
 .din0(pich3[15:4]),
 .din1(12'hfff),
 .dout(pdp_pich_wrapb[3]));
pmu_pdp_dp_cmp_macro__width_12 pic3lcb  (
 .din0(picl3[15:4]),
 .din1(12'hfff),
 .dout(pdp_picl_wrapb[3]));

// PIC4
pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 pic4     (
 .scan_in(pic4_scanin),
 .scan_out(pic4_scanout),
 .clk ( l2clk                    ),
 .en  ( pct_pic_clken[4]         ),  // powerdown pin
 .din0( pdp_asi_din[63:0] ), 
 .din1( {pich07_incr[31:0],picl07_incr[31:0]} ),
 .sel0( pct_wr_pic_w2[4] ),
 .dout( {pich4[31:0],picl4[31:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

pmu_pdp_dp_cmp_macro__width_16 pic4hca  (
 .din0(pich4[31:16]),
 .din1(16'hffff),
 .dout(pdp_pich_wrapa[4]));
pmu_pdp_dp_cmp_macro__width_16 pic4lca  (
 .din0(picl4[31:16]),
 .din1(16'hffff),
 .dout(pdp_picl_wrapa[4]));

pmu_pdp_dp_cmp_macro__width_12 pic4hcb  (
 .din0(pich4[15:4]),
 .din1(12'hfff),
 .dout(pdp_pich_wrapb[4]));
pmu_pdp_dp_cmp_macro__width_12 pic4lcb  (
 .din0(picl4[15:4]),
 .din1(12'hfff),
 .dout(pdp_picl_wrapb[4]));

// PIC5
pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 pic5     (
 .scan_in(pic5_scanin),
 .scan_out(pic5_scanout),
 .clk ( l2clk                    ),
 .en  ( pct_pic_clken[5]         ),  // powerdown pin
 .din0( pdp_asi_din[63:0] ), 
 .din1( {pich07_incr[31:0],picl07_incr[31:0]} ),
 .sel0( pct_wr_pic_w2[5] ),
 .dout( {pich5[31:0],picl5[31:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

pmu_pdp_dp_cmp_macro__width_16 pic5hca  (
 .din0(pich5[31:16]),
 .din1(16'hffff),
 .dout(pdp_pich_wrapa[5]));
pmu_pdp_dp_cmp_macro__width_16 pic5lca  (
 .din0(picl5[31:16]),
 .din1(16'hffff),
 .dout(pdp_picl_wrapa[5]));

pmu_pdp_dp_cmp_macro__width_12 pic5hcb  (
 .din0(pich5[15:4]),
 .din1(12'hfff),
 .dout(pdp_pich_wrapb[5]));
pmu_pdp_dp_cmp_macro__width_12 pic5lcb  (
 .din0(picl5[15:4]),
 .din1(12'hfff),
 .dout(pdp_picl_wrapb[5]));

// PIC6
pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 pic6     (
 .scan_in(pic6_scanin),
 .scan_out(pic6_scanout),
 .clk ( l2clk                    ),
 .en  ( pct_pic_clken[6]         ),  // powerdown pin
 .din0( pdp_asi_din[63:0] ), 
 .din1( {pich07_incr[31:0],picl07_incr[31:0]} ),
 .sel0( pct_wr_pic_w2[6] ),
 .dout( {pich6[31:0],picl6[31:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

pmu_pdp_dp_cmp_macro__width_16 pic6hca  (
 .din0(pich6[31:16]),
 .din1(16'hffff),
 .dout(pdp_pich_wrapa[6]));
pmu_pdp_dp_cmp_macro__width_16 pic6lca  (
 .din0(picl6[31:16]),
 .din1(16'hffff),
 .dout(pdp_picl_wrapa[6]));

pmu_pdp_dp_cmp_macro__width_12 pic6hcb  (
 .din0(pich6[15:4]),
 .din1(12'hfff),
 .dout(pdp_pich_wrapb[6]));
pmu_pdp_dp_cmp_macro__width_12 pic6lcb  (
 .din0(picl6[15:4]),
 .din1(12'hfff),
 .dout(pdp_picl_wrapb[6]));

// PIC7
pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 pic7     (
 .scan_in(pic7_scanin),
 .scan_out(pic7_scanout),
 .clk ( l2clk                    ),
 .en  ( pct_pic_clken[7]         ),  // powerdown pin
 .din0( pdp_asi_din[63:0] ), 
 .din1( {pich07_incr[31:0],picl07_incr[31:0]} ),
 .sel0( pct_wr_pic_w2[7] ),
 .dout( {pich7[31:0],picl7[31:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

pmu_pdp_dp_cmp_macro__width_16 pic7hca  (
 .din0(pich7[31:16]),
 .din1(16'hffff),
 .dout(pdp_pich_wrapa[7]));
pmu_pdp_dp_cmp_macro__width_16 pic7lca  (
 .din0(picl7[31:16]),
 .din1(16'hffff),
 .dout(pdp_picl_wrapa[7]));

pmu_pdp_dp_cmp_macro__width_12 pic7hcb  (
 .din0(pich7[15:4]),
 .din1(12'hfff),
 .dout(pdp_pich_wrapb[7]));
pmu_pdp_dp_cmp_macro__width_12 pic7lcb  (
 .din0(picl7[15:4]),
 .din1(12'hfff),
 .dout(pdp_picl_wrapb[7]));

pmu_pdp_dp_and_macro__ports_2__width_16 pich0wrap   (
 .din0   ({pdp_pich_wrapa[7:0],pdp_picl_wrapa[7:0]}),
 .din1   ({pdp_pich_wrapb[7:0],pdp_picl_wrapb[7:0]}),
 .dout   ({pdp_pich_wrap[7:0], pdp_picl_wrap[7:0]}));

// Mux PIC's 0-7 together to share one incrementor & adder
// Mux in W1 cycle, increment in W2
pmu_pdp_dp_mux_macro__mux_aope__ports_8__width_64 pic07_mux  (
 .din0({pich0[31:0], picl0[31:0]}),
 .din1({pich1[31:0], picl1[31:0]}),
 .din2({pich2[31:0], picl2[31:0]}),
 .din3({pich3[31:0], picl3[31:0]}),
 .din4({pich4[31:0], picl4[31:0]}),
 .din5({pich5[31:0], picl5[31:0]}),
 .din6({pich6[31:0], picl6[31:0]}),
 .din7({pich7[31:0], picl7[31:0]}),
 .sel0(pct_incr_pic_w1[0]),
 .sel1(pct_incr_pic_w1[1]),
 .sel2(pct_incr_pic_w1[2]),
 .sel3(pct_incr_pic_w1[3]),
 .sel4(pct_incr_pic_w1[4]),
 .sel5(pct_incr_pic_w1[5]),
 .sel6(pct_incr_pic_w1[6]),
// .sel7(pct_incr_pic_w1[7]), // pct_incr_pic_w1 is guaranteed to be one-hot
 .dout({pich07_w1[31:0], picl07_w1[31:0]}));

// all 8 threads sharing two comparators
// not practical, as wrap must be matched with tid in the ctl logic
//cmp_macro pic07hc (width=28) (
// .din0(pich07_w1[31:4]),
// .din1(28'hfffffff),
// .dout(pdp_pich_wrap));

//cmp_macro pic07lc (width=28) (
// .din0(pich07_w1[31:4]),
// .din1(28'hfffffff),
// .dout(pdp_picl_wrap));

// send these two wrap signals to the ctl logic and qualify with pct_incr_pic_w1

pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 pic07_w2  (
 .scan_in(pic07_w2_scanin),
 .scan_out(pic07_w2_scanout),
 .clk ( l2clk                    ),
 .en  ( pct_pic07_w2_clken       ),  // powerdown pin
 .din0( pdp_asi_din[63:0]), 
 .din1( {pich07_w1[31:0], picl07_w1[31:0]} ),
 .sel0( pct_incr_asi_w1 ),
 .dout( {pich07_w2[31:0], picl07_w2[31:0]} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// PICH incrementor for PIC's 0-7
pmu_pdp_dp_cla_macro__width_32 pich07_cla  (
  .din0({28'b0, pct_pich07_add_w2[3:0]}),
  .din1(pich07_w2[31:0]),
  .cin(1'b0),
  .dout(pich07_incr[31:0]),
  .cout(pdp_pich_cout07)
);
 
pmu_pdp_dp_cla_macro__width_32 picl07_cla  (
  .din0({28'b0, pct_picl07_add_w2[3:0]}),
  .din1(picl07_w2[31:0]),
  .cin(1'b0),
  .dout(picl07_incr[31:0]),
  .cout(pdp_picl_cout07)
);
 
// 8:1 mux for ASR reads to mux between PICs

pmu_pdp_dp_mux_macro__mux_aonpe__ports_8__width_64 pic_mux  (
 .din0({pich0[31:0],picl0[31:0]}),
 .din1({pich1[31:0],picl1[31:0]}),
 .din2({pich2[31:0],picl2[31:0]}),
 .din3({pich3[31:0],picl3[31:0]}),
 .din4({pich4[31:0],picl4[31:0]}),
 .din5({pich5[31:0],picl5[31:0]}),
 .din6({pich6[31:0],picl6[31:0]}),
 .din7({pich7[31:0],picl7[31:0]}),
 .sel0(pct_rd_pic[0]),
 .sel1(pct_rd_pic[1]),
 .sel2(pct_rd_pic[2]),
 .sel3(pct_rd_pic[3]),
 .sel4(pct_rd_pic[4]),
 .sel5(pct_rd_pic[5]),
 .sel6(pct_rd_pic[6]),
 .sel7(pct_rd_pic[7]),
 .dout(pdp_pic_data[63:0]));

pmu_pdp_dp_mux_macro__mux_aope__ports_2__width_64 picpcr_mux  (
 .din0(pdp_pic_data[63:0]),
 .din1({32'b0, pct_pcr_data[31:0]}),
 .sel0(pct_rd_a_pic),
 .dout(picpcr_data[63:0]));

// ASI output registers
pmu_pdp_dp_msff_macro__mux_aope__ports_3__stack_64c__width_64 asi_dout  (
 .scan_in(asi_dout_scanin),
 .scan_out(asi_dout_scanout),
 .clk ( l2clk),
 .en  ( pmu_asi_clken            ),  // powerdown pin
 .din0( pdp_asi_din[63:0]), 
 .din1( picpcr_data[63:0]), 
 .din2({pdp_asi_din[63],1'b1,pdp_asi_din[61:56],6'b0,pct_exception,1'b0,pdp_asi_din[47:0]}),
 .sel0( pct_bypass_asi),
 .sel1( pct_rd_pic_pcr),
 .dout( pmu_rngl_cdbus_nobuf[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// Add buffer to drive FGU since aope muxes can't drive big loads well...
pmu_pdp_dp_buff_macro__dbuff_32x__rep_1__stack_64c__width_64 rngl_out_buf     (
 .din (pmu_rngl_cdbus_nobuf[63:0]),
 .dout(pmu_rngl_cdbus[63:0]));


// fixscan start:
assign asi_din_scanin            = scan_in                  ;
assign pic0_scanin               = asi_din_scanout          ;
assign pic1_scanin               = pic0_scanout             ;
assign pic2_scanin               = pic1_scanout             ;
assign pic3_scanin               = pic2_scanout             ;
assign pic4_scanin               = pic3_scanout             ;
assign pic5_scanin               = pic4_scanout             ;
assign pic6_scanin               = pic5_scanout             ;
assign pic7_scanin               = pic6_scanout             ;
assign pic07_w2_scanin           = pic7_scanout             ;
assign asi_dout_scanin           = pic07_w2_scanout         ;
assign scan_out                  = asi_dout_scanout         ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module pmu_pdp_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module pmu_pdp_dp_msff_macro__stack_64c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module pmu_pdp_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 (
  din0, 
  din1, 
  sel0, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module pmu_pdp_dp_cmp_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module pmu_pdp_dp_cmp_macro__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output dout;






cmp #(12)  m0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout)
);










endmodule





//  
//   and macro for ports = 2,3,4
//
//





module pmu_pdp_dp_and_macro__ports_2__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






and2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module pmu_pdp_dp_mux_macro__mux_aope__ports_8__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  sel5, 
  sel6, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input [63:0] din6;
  input [63:0] din7;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;
  output [63:0] dout;





cl_dp1_penc8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .sel5(sel5),
 .sel6(sel6),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
  .in7(din7[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   cla macro
//
//





module pmu_pdp_dp_cla_macro__width_32 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;
  output cout;







cla #(32)  m0_0 (
.cin(cin),
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0]),
.cout(cout)
);












endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module pmu_pdp_dp_mux_macro__mux_aonpe__ports_8__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  input [63:0] din4;
  input sel4;
  input [63:0] din5;
  input sel5;
  input [63:0] din6;
  input sel6;
  input [63:0] din7;
  input sel7;
  output [63:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
  .in7(din7[63:0]),
.dout(dout[63:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module pmu_pdp_dp_mux_macro__mux_aope__ports_2__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module pmu_pdp_dp_msff_macro__mux_aope__ports_3__stack_64c__width_64 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input sel0;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc3_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//
//   buff macro
//
//





module pmu_pdp_dp_buff_macro__dbuff_32x__rep_1__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule




