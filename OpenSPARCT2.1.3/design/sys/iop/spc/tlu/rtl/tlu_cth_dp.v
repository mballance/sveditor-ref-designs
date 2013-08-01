// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_cth_dp.v
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
module tlu_cth_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en_wmr, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  lsu_rngf_cdbus, 
  cxi_wr_int_dis, 
  cxi_int_dis_vec, 
  asi_wr_int_rec, 
  asi_rd_inc_vec_2, 
  asi_int_rec_mux_sel_in, 
  asi_rd_int_rec, 
  asi_rd_inc_vec, 
  asi_wr_any_int_rec, 
  asi_wr_data, 
  asi_rd_stage_1, 
  dfd_asi_data, 
  dfd_asi_desr, 
  scan_out, 
  wmr_scan_out, 
  cth_wr_data, 
  cth_asi_data, 
  cth_irl_cleared);
wire clk;
wire en;
wire stop;
wire test;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire [7:0] irl_en;
wire any_irl_en_0_2;
wire any_irl_en_3_5;
wire any_irl_en_6_7;
wire any_irl_en;
wire interrupt_receive7_lat_wmr_scanin;
wire interrupt_receive7_lat_wmr_scanout;
wire [63:0] int_dis;
wire [63:0] int_rec;
wire [63:0] inc_vec;
wire [63:0] int_rec7;
wire interrupt_receive6_lat_wmr_scanin;
wire interrupt_receive6_lat_wmr_scanout;
wire [63:0] int_rec6;
wire interrupt_receive5_lat_wmr_scanin;
wire interrupt_receive5_lat_wmr_scanout;
wire [63:0] int_rec5;
wire interrupt_receive4_lat_wmr_scanin;
wire interrupt_receive4_lat_wmr_scanout;
wire [63:0] int_rec4;
wire interrupt_receive3_lat_wmr_scanin;
wire interrupt_receive3_lat_wmr_scanout;
wire [63:0] int_rec3;
wire interrupt_receive2_lat_wmr_scanin;
wire interrupt_receive2_lat_wmr_scanout;
wire [63:0] int_rec2;
wire interrupt_receive1_lat_wmr_scanin;
wire interrupt_receive1_lat_wmr_scanout;
wire [63:0] int_rec1;
wire interrupt_receive0_lat_wmr_scanin;
wire interrupt_receive0_lat_wmr_scanout;
wire [63:0] int_rec0;
wire int_rec_mux_sel_lat_scanin;
wire int_rec_mux_sel_lat_scanout;
wire [2:0] int_rec_mux_sel;
wire [63:59] rngf_cdbus_unused;
wire [63:0] int_rec_muxed;
wire [2:0] ivr_63_56;
wire [2:0] ivr_55_48;
wire [2:0] ivr_47_40;
wire [2:0] ivr_39_32;
wire [2:0] ivr_31_24;
wire [2:0] ivr_23_16;
wire [2:0] ivr_15_08;
wire [2:0] ivr_07_00;
wire [31:4] ivl_sel;
wire [7:1] incoming_vector_mux_sel;
wire [5:0] incoming_vector_in;
wire incoming_vector_lat_scanin;
wire incoming_vector_lat_scanout;
wire [5:0] incoming_vector;
wire [7:0] dec_inc_vec_first;
wire [63:0] dec_inc_vec;
wire [63:0] int_rec_muxed_;
wire [63:0] int_rec_dis_muxed;
wire wr_int_rec;
wire rd_inc_vec_2;
wire set_clear_same_thread;
wire s_c_idvw_irw_;
wire s_c_idvw_irw;
wire s_c_idvw_ivr_;
wire s_c_idvw_ivr;
wire neither_match;
wire tcu_muxtest_rep0;
wire [7:0] dec_int_dis_first;
wire tcu_muxtest_rep1;
wire [63:0] dec_int_dis;
wire asi_lat_scanin;
wire asi_lat_scanout;
wire [63:0] asi_data;
wire irl_cleared_lat_scanin;
wire irl_cleared_lat_scanout;


input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;
input		tcu_dectest;
input		tcu_muxtest;

input		tcu_scan_en_wmr;
input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

input	[64:56]	lsu_rngf_cdbus;

input 	[7:0]	cxi_wr_int_dis;		// Interrupt Vector Dispatch packet
input 	[5:0]	cxi_int_dis_vec;	//   from gasket

input	[7:0]	asi_wr_int_rec;		// Write Interrupt Receive Register
input 	[7:0]	asi_rd_inc_vec_2;	// Update Interrupt Vector  Register
input 	[2:0]	asi_int_rec_mux_sel_in;
input 		asi_rd_int_rec;		// Read for any thread
input 		asi_rd_inc_vec;		// Read for any thread
input		asi_wr_any_int_rec;	// Write of any int_rec
input 	[63:0]	asi_wr_data;

input		asi_rd_stage_1;		// Power management

input	[47:0]	dfd_asi_data;		
input	[18:0]	dfd_asi_desr;		


output		scan_out;

output		wmr_scan_out;		// Warm reset (non)scan

output	[61:0]	cth_wr_data;		// Buffered version of asi_wr_data
output	[63:0]	cth_asi_data;
output	[63:0]	cth_irl_cleared;	// Copy of IRR after clearing operations




////////////////////////////////////////////////////////////////////////////////

assign clk      = l2clk;
assign en	= 1'b1;
assign stop	= 1'b0;
assign test	= tcu_dectest;

tlu_cth_dp_buff_macro__width_4 clk_control_buf  (
	.din	({tcu_pce_ov		       ,
		  tcu_scan_en		       ,
		  spc_aclk		       ,
		  spc_bclk		       }),
	.dout	({pce_ov		       ,
		  se			       ,
		  siclk			       ,
		  soclk			       })
);



//////////////////////////////////////////////////////////////////////////////
//
//  Power management
//

tlu_cth_dp_or_macro__ports_3__width_8 irl_en_or   (
	.din0	(cxi_wr_int_dis		[7:0]	),
	.din1	(asi_wr_int_rec		[7:0]	),
	.din2	(asi_rd_inc_vec_2	[7:0]	),
	.dout	(irl_en			[7:0]	)
);

tlu_cth_dp_or_macro__ports_3__width_1 any_irl_0_2_en_or   (
	.din0	(irl_en			[   0]	),
	.din1	(irl_en			[   1]	),
	.din2	(irl_en			[   2]	),
	.dout	(any_irl_en_0_2			)
);

tlu_cth_dp_or_macro__ports_3__width_1 any_irl_3_5_en_or   (
	.din0	(irl_en			[   3]	),
	.din1	(irl_en			[   4]	),
	.din2	(irl_en			[   5]	),
	.dout	(any_irl_en_3_5			)
);

tlu_cth_dp_or_macro__ports_2__width_1 any_irl_6_7_en_or   (
	.din0	(irl_en			[   6]	),
	.din1	(irl_en			[   7]	),
	.dout	(any_irl_en_6_7			)
);

tlu_cth_dp_or_macro__ports_3__width_1 any_irl_en_or   (
	.din0	(any_irl_en_0_2			),
	.din1	(any_irl_en_3_5			),
	.din2	(any_irl_en_6_7			),
	.dout	(any_irl_en			)
);



////////////////////////////////////////////////////////////////////////////////
//
//  Interrupt Receive Registers
//

tlu_cth_dp_msff_macro__mux_aope__ports_3__width_64 interrupt_receive7_lat    ( // FS:wmr_protect
	.scan_in(interrupt_receive7_lat_wmr_scanin),
	.scan_out(interrupt_receive7_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.din0	(int_dis		[63:0]	),
	.din1	(int_rec		[63:0]	),
	.din2	(inc_vec		[63:0]	),
	.sel0	(cxi_wr_int_dis		[7   ]	),
	.sel1	(asi_wr_int_rec		[7   ]	),
	.en	(irl_en			[7   ]	),
	.dout	(int_rec7		[63:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_cth_dp_msff_macro__mux_aope__ports_3__width_64 interrupt_receive6_lat    ( // FS:wmr_protect
	.scan_in(interrupt_receive6_lat_wmr_scanin),
	.scan_out(interrupt_receive6_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.din0	(int_dis		[63:0]	),
	.din1	(int_rec		[63:0]	),
	.din2	(inc_vec		[63:0]	),
	.sel0	(cxi_wr_int_dis		[6   ]	),
	.sel1	(asi_wr_int_rec		[6   ]	),
	.en	(irl_en			[6   ]	),
	.dout	(int_rec6		[63:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_cth_dp_msff_macro__mux_aope__ports_3__width_64 interrupt_receive5_lat    ( // FS:wmr_protect
	.scan_in(interrupt_receive5_lat_wmr_scanin),
	.scan_out(interrupt_receive5_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.din0	(int_dis		[63:0]	),
	.din1	(int_rec		[63:0]	),
	.din2	(inc_vec		[63:0]	),
	.sel0	(cxi_wr_int_dis		[5   ]	),
	.sel1	(asi_wr_int_rec		[5   ]	),
	.en	(irl_en			[5   ]	),
	.dout	(int_rec5		[63:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_cth_dp_msff_macro__mux_aope__ports_3__width_64 interrupt_receive4_lat    ( // FS:wmr_protect
	.scan_in(interrupt_receive4_lat_wmr_scanin),
	.scan_out(interrupt_receive4_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.din0	(int_dis		[63:0]	),
	.din1	(int_rec		[63:0]	),
	.din2	(inc_vec		[63:0]	),
	.sel0	(cxi_wr_int_dis		[4   ]	),
	.sel1	(asi_wr_int_rec		[4   ]	),
	.en	(irl_en			[4   ]	),
	.dout	(int_rec4		[63:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_cth_dp_msff_macro__mux_aope__ports_3__width_64 interrupt_receive3_lat    ( // FS:wmr_protect
	.scan_in(interrupt_receive3_lat_wmr_scanin),
	.scan_out(interrupt_receive3_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.din0	(int_dis		[63:0]	),
	.din1	(int_rec		[63:0]	),
	.din2	(inc_vec		[63:0]	),
	.sel0	(cxi_wr_int_dis		[3   ]	),
	.sel1	(asi_wr_int_rec		[3   ]	),
	.en	(irl_en			[3   ]	),
	.dout	(int_rec3		[63:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_cth_dp_msff_macro__mux_aope__ports_3__width_64 interrupt_receive2_lat    ( // FS:wmr_protect
	.scan_in(interrupt_receive2_lat_wmr_scanin),
	.scan_out(interrupt_receive2_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.din0	(int_dis		[63:0]	),
	.din1	(int_rec		[63:0]	),
	.din2	(inc_vec		[63:0]	),
	.sel0	(cxi_wr_int_dis		[2   ]	),
	.sel1	(asi_wr_int_rec		[2   ]	),
	.en	(irl_en			[2   ]	),
	.dout	(int_rec2		[63:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_cth_dp_msff_macro__mux_aope__ports_3__width_64 interrupt_receive1_lat    ( // FS:wmr_protect
	.scan_in(interrupt_receive1_lat_wmr_scanin),
	.scan_out(interrupt_receive1_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.din0	(int_dis		[63:0]	),
	.din1	(int_rec		[63:0]	),
	.din2	(inc_vec		[63:0]	),
	.sel0	(cxi_wr_int_dis		[1   ]	),
	.sel1	(asi_wr_int_rec		[1   ]	),
	.en	(irl_en			[1   ]	),
	.dout	(int_rec1		[63:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_cth_dp_msff_macro__mux_aope__ports_3__width_64 interrupt_receive0_lat    ( // FS:wmr_protect
	.scan_in(interrupt_receive0_lat_wmr_scanin),
	.scan_out(interrupt_receive0_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.din0	(int_dis		[63:0]	),
	.din1	(int_rec		[63:0]	),
	.din2	(inc_vec		[63:0]	),
	.sel0	(cxi_wr_int_dis		[0   ]	),
	.sel1	(asi_wr_int_rec		[0   ]	),
	.en	(irl_en			[0   ]	),
	.dout	(int_rec0		[63:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);



////////////////////////////////////////////////////////////////////////////////
//
//  Mux the Interrupt Receive Registers to either 
//  write (clear bits that are set in write data) or
//  read (encode and clear the MSB)
//

tlu_cth_dp_msff_macro__dmux_8x__left_29__mux_aope__ports_2__width_3 int_rec_mux_sel_lat      (
	.scan_in(int_rec_mux_sel_lat_scanin),
	.scan_out(int_rec_mux_sel_lat_scanout),
	.din0	(lsu_rngf_cdbus		[58:56]	),
	.din1	(asi_int_rec_mux_sel_in	[2:0]	),
	.sel0	(lsu_rngf_cdbus		[64   ]	),
	.en	(1'b1				),
	.dout	(int_rec_mux_sel	[2:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign rngf_cdbus_unused[63:59] =
	lsu_rngf_cdbus[63:59];

tlu_cth_dp_mux_macro__dmux_8x__mux_aodec__ports_8__width_64 int_rec_mux     (
	.din0	(int_rec0		[63:0]	),
	.din1	(int_rec1		[63:0]	),
	.din2	(int_rec2		[63:0]	),
	.din3	(int_rec3		[63:0]	),
	.din4	(int_rec4		[63:0]	),
	.din5	(int_rec5		[63:0]	),
	.din6	(int_rec6		[63:0]	),
	.din7	(int_rec7		[63:0]	),
	.sel	(int_rec_mux_sel	[2:0]	),
	.dout	(int_rec_muxed		[63:0]	)
);



////////////////////////////////////////////////////////////////////////////////
//
//  Clear bits that are set in write data on write to Interrupt Receive Reg
//

tlu_cth_dp_buff_macro__width_62 wr_data_buf  (
	.din	(asi_wr_data		[61:0]	),
	.dout	(cth_wr_data		[61:0]	)
);

tlu_cth_dp_and_macro__ports_2__width_64 int_rec_and   (
	.din0	(int_rec_muxed		[63:0]	),
	.din1	({asi_wr_data		[63:62],
                  cth_wr_data		[61:0]}),
	.dout	(int_rec		[63:0]	)
);



////////////////////////////////////////////////////////////////////////////////
//
//  Encode and clear the MSB on reads from Incoming Vector Register
//

tlu_cth_dp_mux_macro__mux_aope__ports_8__width_3 ivr_63_56_mux    (
	.din0	(3'b111				),
	.din1	(3'b110				),
	.din2	(3'b101				),
	.din3	(3'b100				),
	.din4	(3'b011				),
	.din5	(3'b010				),
	.din6	(3'b001				),
	.din7	(3'b000		       		),
	.sel0	(int_rec_muxed		[63   ]	),
	.sel1	(int_rec_muxed		[62   ]	),
	.sel2	(int_rec_muxed		[61   ]	),
	.sel3	(int_rec_muxed		[60   ]	),
	.sel4	(int_rec_muxed		[59   ]	),
	.sel5	(int_rec_muxed		[58   ]	),
	.sel6	(int_rec_muxed		[57   ]	),
	.dout	(ivr_63_56		[2:0]	)
);

tlu_cth_dp_mux_macro__mux_aope__ports_8__width_3 ivr_55_48_mux    (
	.din0	(3'b111				),
	.din1	(3'b110				),
	.din2	(3'b101				),
	.din3	(3'b100				),
	.din4	(3'b011				),
	.din5	(3'b010				),
	.din6	(3'b001				),
	.din7	(3'b000		       		),
	.sel0	(int_rec_muxed		[55   ]	),
	.sel1	(int_rec_muxed		[54   ]	),
	.sel2	(int_rec_muxed		[53   ]	),
	.sel3	(int_rec_muxed		[52   ]	),
	.sel4	(int_rec_muxed		[51   ]	),
	.sel5	(int_rec_muxed		[50   ]	),
	.sel6	(int_rec_muxed		[49   ]	),
	.dout	(ivr_55_48		[2:0]	)
);

tlu_cth_dp_mux_macro__mux_aope__ports_8__width_3 ivr_47_40_mux    (
	.din0	(3'b111				),
	.din1	(3'b110				),
	.din2	(3'b101				),
	.din3	(3'b100				),
	.din4	(3'b011				),
	.din5	(3'b010				),
	.din6	(3'b001				),
	.din7	(3'b000		       		),
	.sel0	(int_rec_muxed		[47   ]	),
	.sel1	(int_rec_muxed		[46   ]	),
	.sel2	(int_rec_muxed		[45   ]	),
	.sel3	(int_rec_muxed		[44   ]	),
	.sel4	(int_rec_muxed		[43   ]	),
	.sel5	(int_rec_muxed		[42   ]	),
	.sel6	(int_rec_muxed		[41   ]	),
	.dout	(ivr_47_40		[2:0]	)
);

tlu_cth_dp_mux_macro__mux_aope__ports_8__width_3 ivr_39_32_mux    (
	.din0	(3'b111				),
	.din1	(3'b110				),
	.din2	(3'b101				),
	.din3	(3'b100				),
	.din4	(3'b011				),
	.din5	(3'b010				),
	.din6	(3'b001				),
	.din7	(3'b000		       		),
	.sel0	(int_rec_muxed		[39   ]	),
	.sel1	(int_rec_muxed		[38   ]	),
	.sel2	(int_rec_muxed		[37   ]	),
	.sel3	(int_rec_muxed		[36   ]	),
	.sel4	(int_rec_muxed		[35   ]	),
	.sel5	(int_rec_muxed		[34   ]	),
	.sel6	(int_rec_muxed		[33   ]	),
	.dout	(ivr_39_32		[2:0]	)
);

tlu_cth_dp_mux_macro__mux_aope__ports_8__width_3 ivr_31_24_mux    (
	.din0	(3'b111				),
	.din1	(3'b110				),
	.din2	(3'b101				),
	.din3	(3'b100				),
	.din4	(3'b011				),
	.din5	(3'b010				),
	.din6	(3'b001				),
	.din7	(3'b000		       		),
	.sel0	(int_rec_muxed		[31   ]	),
	.sel1	(int_rec_muxed		[30   ]	),
	.sel2	(int_rec_muxed		[29   ]	),
	.sel3	(int_rec_muxed		[28   ]	),
	.sel4	(int_rec_muxed		[27   ]	),
	.sel5	(int_rec_muxed		[26   ]	),
	.sel6	(int_rec_muxed		[25   ]	),
	.dout	(ivr_31_24		[2:0]	)
);

tlu_cth_dp_mux_macro__mux_aope__ports_8__width_3 ivr_23_16_mux    (
	.din0	(3'b111				),
	.din1	(3'b110				),
	.din2	(3'b101				),
	.din3	(3'b100				),
	.din4	(3'b011				),
	.din5	(3'b010				),
	.din6	(3'b001				),
	.din7	(3'b000		       		),
	.sel0	(int_rec_muxed		[23   ]	),
	.sel1	(int_rec_muxed		[22   ]	),
	.sel2	(int_rec_muxed		[21   ]	),
	.sel3	(int_rec_muxed		[20   ]	),
	.sel4	(int_rec_muxed		[19   ]	),
	.sel5	(int_rec_muxed		[18   ]	),
	.sel6	(int_rec_muxed		[17   ]	),
	.dout	(ivr_23_16		[2:0]	)
);

tlu_cth_dp_mux_macro__mux_aope__ports_8__width_3 ivr_15_08_mux    (
	.din0	(3'b111				),
	.din1	(3'b110				),
	.din2	(3'b101				),
	.din3	(3'b100				),
	.din4	(3'b011				),
	.din5	(3'b010				),
	.din6	(3'b001				),
	.din7	(3'b000		       		),
	.sel0	(int_rec_muxed		[15   ]	),
	.sel1	(int_rec_muxed		[14   ]	),
	.sel2	(int_rec_muxed		[13   ]	),
	.sel3	(int_rec_muxed		[12   ]	),
	.sel4	(int_rec_muxed		[11   ]	),
	.sel5	(int_rec_muxed		[10   ]	),
	.sel6	(int_rec_muxed		[9   ]	),
	.dout	(ivr_15_08		[2:0]	)
);

tlu_cth_dp_mux_macro__mux_aope__ports_8__width_3 ivr_07_00_mux    (
	.din0	(3'b111				),
	.din1	(3'b110				),
	.din2	(3'b101				),
	.din3	(3'b100				),
	.din4	(3'b011				),
	.din5	(3'b010				),
	.din6	(3'b001				),
	.din7	(3'b000		       		),
	.sel0	(int_rec_muxed		[7   ]	),
	.sel1	(int_rec_muxed		[6   ]	),
	.sel2	(int_rec_muxed		[5   ]	),
	.sel3	(int_rec_muxed		[4   ]	),
	.sel4	(int_rec_muxed		[3   ]	),
	.sel5	(int_rec_muxed		[2   ]	),
	.sel6	(int_rec_muxed		[1   ]	),
	.dout	(ivr_07_00		[2:0]	)
);

tlu_cth_dp_nor_macro__ports_2__width_28 ivr_nor  
(	.din0	({int_rec_muxed		[63:60],
		  int_rec_muxed		[55:52],
		  int_rec_muxed		[47:44],
		  int_rec_muxed		[39:36],
		  int_rec_muxed		[31:28],
		  int_rec_muxed		[23:20],
		  int_rec_muxed		[15:12]}),
	.din1	({int_rec_muxed		[59:56],
		  int_rec_muxed		[51:48],
		  int_rec_muxed		[43:40],
		  int_rec_muxed		[35:32],
		  int_rec_muxed		[27:24],
		  int_rec_muxed		[19:16],
		  int_rec_muxed		[11:8]}),
	.dout	(ivl_sel		[31:4]	)
);

tlu_cth_dp_nand_macro__ports_4__width_7 ivr_nand   (
	.din0	({ivl_sel		[31   ],
		  ivl_sel		[27   ],
		  ivl_sel		[23   ],
		  ivl_sel		[19   ],
		  ivl_sel		[15   ],
		  ivl_sel		[11   ],
		  ivl_sel		[7   ]}),
	.din1	({ivl_sel		[30   ],
		  ivl_sel		[26   ],
		  ivl_sel		[22   ],
		  ivl_sel		[18   ],
		  ivl_sel		[14   ],
		  ivl_sel		[10   ],
		  ivl_sel		[6   ]}),
	.din2	({ivl_sel		[29   ],
		  ivl_sel		[25   ],
		  ivl_sel		[21   ],
		  ivl_sel		[17   ],
		  ivl_sel		[13   ],
		  ivl_sel		[9   ],
		  ivl_sel		[5   ]}),
	.din3	({ivl_sel		[28   ],
		  ivl_sel		[24   ],
		  ivl_sel		[20   ],
		  ivl_sel		[16   ],
		  ivl_sel		[12   ],
		  ivl_sel		[8   ],
		  ivl_sel		[4   ]}),
	.dout	(incoming_vector_mux_sel[7:1]	)
);

tlu_cth_dp_mux_macro__dmux_6x__mux_aope__ports_8__width_6 incoming_vector_mux     (
	.din0	({3'b111		       ,
		  ivr_63_56		[2:0]}),
	.din1	({3'b110		       ,
		  ivr_55_48		[2:0]}),
	.din2	({3'b101		       ,
		  ivr_47_40		[2:0]}),
	.din3	({3'b100		       ,
		  ivr_39_32		[2:0]}),
	.din4	({3'b011		       ,
		  ivr_31_24		[2:0]}),
	.din5	({3'b010		       ,
		  ivr_23_16		[2:0]}),
	.din6	({3'b001		       ,
		  ivr_15_08		[2:0]}),
	.din7	({3'b000		       ,
		  ivr_07_00		[2:0]}),
	.sel0	(incoming_vector_mux_sel[7   ]	),
	.sel1	(incoming_vector_mux_sel[6   ]	),
	.sel2	(incoming_vector_mux_sel[5   ]	),
	.sel3	(incoming_vector_mux_sel[4   ]	),
	.sel4	(incoming_vector_mux_sel[3   ]	),
	.sel5	(incoming_vector_mux_sel[2   ]	),
	.sel6	(incoming_vector_mux_sel[1   ]	),
	.dout	(incoming_vector_in	[5:0]	)
);

tlu_cth_dp_msff_macro__width_6 incoming_vector_lat  (
	.scan_in(incoming_vector_lat_scanin),
	.scan_out(incoming_vector_lat_scanout),
	.din	(incoming_vector_in	[5:0]	),
	.dout	(incoming_vector	[5:0]	),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// Now decode

tlu_cth_dp_mux_macro__mux_aodec__ports_8__width_8 enc_inc_vec_first_mux    (
	.din0	(8'h01				),
	.din1	(8'h02				),
	.din2	(8'h04				),
	.din3	(8'h08				),
	.din4	(8'h10				),
	.din5	(8'h20				),
	.din6	(8'h40				),
	.din7	(8'h80				),
	.sel	(incoming_vector	[2:0]	),
	.dout	(dec_inc_vec_first	[7:0]	)
);

tlu_cth_dp_mux_macro__mux_aodec__ports_8__width_64 dec_inc_vec_mux    (
	.din0	({56'h00000000000000	       ,
		  dec_inc_vec_first	[7:0]}),
	.din1	({48'h000000000000	       ,
		  dec_inc_vec_first	[7:0],
		  8'h00			       }),
	.din2	({40'h0000000000	       ,
		  dec_inc_vec_first	[7:0],
		  16'h0000		       }),
	.din3	({32'h00000000		       ,
		  dec_inc_vec_first	[7:0],
		  24'h000000		       }),
	.din4	({24'h000000		       ,
		  dec_inc_vec_first	[7:0],
		  32'h00000000		       }),
	.din5	({16'h0000		       ,
		  dec_inc_vec_first	[7:0],
		  40'h0000000000	       }),
	.din6	({8'h00			       ,
		  dec_inc_vec_first	[7:0],
		  48'h000000000000	       }),
	.din7	({dec_inc_vec_first	[7:0],
		  56'h00000000000000	       }),
	.sel	(incoming_vector	[5:3]	),
	.dout	(dec_inc_vec		[63:0]	)
);

// Now mask
tlu_cth_dp_inv_macro__width_64 int_rec_muxed_inv  (
	.din	(int_rec_muxed		[63:0]	),
	.dout	(int_rec_muxed_		[63:0]	)
);

tlu_cth_dp_nor_macro__ports_2__width_64 inc_vec_nor   (
	.din0	(dec_inc_vec		[63:0]	),
	.din1	(int_rec_muxed_		[63:0]	),
	.dout	(inc_vec		[63:0]	)
);



////////////////////////////////////////////////////////////////////////////////
//
//  Decode the Interrupt Dispatch Vector register for write
//    and OR into existing register
//

tlu_cth_dp_mux_macro__mux_aonpe__ports_8__width_64 int_rec_dis_mux    (
	.din0	(int_rec0		[63:0]	),
	.din1	(int_rec1		[63:0]	),
	.din2	(int_rec2		[63:0]	),
	.din3	(int_rec3		[63:0]	),
	.din4	(int_rec4		[63:0]	),
	.din5	(int_rec5		[63:0]	),
	.din6	(int_rec6		[63:0]	),
	.din7	(int_rec7		[63:0]	),
	.sel0	(cxi_wr_int_dis   	[0   ]	),
	.sel1	(cxi_wr_int_dis   	[1   ]	),
	.sel2	(cxi_wr_int_dis   	[2   ]	),
	.sel3	(cxi_wr_int_dis   	[3   ]	),
	.sel4	(cxi_wr_int_dis   	[4   ]	),
	.sel5	(cxi_wr_int_dis   	[5   ]	),
	.sel6	(cxi_wr_int_dis   	[6   ]	),
	.sel7	(cxi_wr_int_dis   	[7   ]	),
	.dout	(int_rec_dis_muxed	[63:0]	)
);

// BUT, still have to clear the bits due to Interrupt Receive write or
// Incoming Vector dispatch
// 

// First figure out if the same thread is involved

tlu_cth_dp_mux_macro__mux_aodec__ports_8__width_3 set_clear_same_thread_mux    (
	.din0	({asi_wr_int_rec	[0   ],
		  asi_rd_inc_vec_2	[0   ],
		  cxi_wr_int_dis   	[0   ]}),
	.din1	({asi_wr_int_rec	[1   ],
		  asi_rd_inc_vec_2	[1   ],
		  cxi_wr_int_dis   	[1   ]}),
	.din2	({asi_wr_int_rec	[2   ],
		  asi_rd_inc_vec_2	[2   ],
		  cxi_wr_int_dis   	[2   ]}),
	.din3	({asi_wr_int_rec	[3   ],
		  asi_rd_inc_vec_2	[3   ],
		  cxi_wr_int_dis   	[3   ]}),
	.din4	({asi_wr_int_rec	[4   ],
		  asi_rd_inc_vec_2	[4   ],
		  cxi_wr_int_dis   	[4   ]}),
	.din5	({asi_wr_int_rec	[5   ],
		  asi_rd_inc_vec_2	[5   ],
		  cxi_wr_int_dis   	[5   ]}),
	.din6	({asi_wr_int_rec	[6   ],
		  asi_rd_inc_vec_2	[6   ],
		  cxi_wr_int_dis   	[6   ]}),
	.din7	({asi_wr_int_rec	[7   ],
		  asi_rd_inc_vec_2	[7   ],
		  cxi_wr_int_dis   	[7   ]}),
	.sel	(int_rec_mux_sel	[2:0]	),
	.dout	({wr_int_rec		       ,
		  rd_inc_vec_2		       ,
		  set_clear_same_thread	       })
);

// Generate a select for Interrupt Receive write

tlu_cth_dp_nand_macro__ports_2__width_1 s_c_idvw_irw_b_nand   (
	.din0	(wr_int_rec			),
	.din1	(set_clear_same_thread		),
	.dout	(s_c_idvw_irw_			)
);

tlu_cth_dp_inv_macro__width_1 s_c_idvw_irw_inv  (
	.din	(s_c_idvw_irw_			),
	.dout	(s_c_idvw_irw			)
);

// Generate a select for Incoming Vector read

tlu_cth_dp_nand_macro__ports_2__width_1 s_c_idvw_ivr_b_nand   (
	.din0	(rd_inc_vec_2			),
	.din1	(set_clear_same_thread		),
	.dout	(s_c_idvw_ivr_			)
);

tlu_cth_dp_inv_macro__width_1 s_c_idvw_ivr_inv  (
	.din	(s_c_idvw_ivr_			),
	.dout	(s_c_idvw_ivr			)
);

// Generate a select for neither matching or for neither write occurring

tlu_cth_dp_and_macro__ports_2__width_1 neither_match_and   (
	.din0	(s_c_idvw_irw_			),
	.din1	(s_c_idvw_ivr_			),
	.dout	(neither_match			)
);


tlu_cth_dp_buff_macro__dbuff_32x__width_1 tst_mux_rep0   (
	.din	(tcu_muxtest			),
	.dout	(tcu_muxtest_rep0		)
);

tlu_cth_dp_mux_macro__mux_pgdec__ports_8__width_8 enc_int_dis_first_mux    (
	.din0	(8'h01				),
	.din1	(8'h02				),
	.din2	(8'h04				),
	.din3	(8'h08				),
	.din4	(8'h10				),
	.din5	(8'h20				),
	.din6	(8'h40				),
	.din7	(8'h80				),
	.sel	(cxi_int_dis_vec	[2:0]	),
	.muxtst	(tcu_muxtest_rep0		),
	.dout	(dec_int_dis_first	[7:0]	),
  .test(test)
);

tlu_cth_dp_buff_macro__dbuff_48x__width_1 tst_mux_rep1   (
	.din	(tcu_muxtest			),
	.dout	(tcu_muxtest_rep1		)
);

tlu_cth_dp_mux_macro__mux_pgdec__ports_8__width_64 dec_int_dis_mux    (
	.din0	({56'h00000000000000	       ,
		  dec_int_dis_first	[7:0]}),
	.din1	({48'h000000000000	       ,
		  dec_int_dis_first	[7:0],
		  8'h00			       }),
	.din2	({40'h0000000000	       ,
		  dec_int_dis_first	[7:0],
		  16'h0000		       }),
	.din3	({32'h00000000		       ,
		  dec_int_dis_first	[7:0],
		  24'h000000		       }),
	.din4	({24'h000000		       ,
		  dec_int_dis_first	[7:0],
		  32'h00000000		       }),
	.din5	({16'h0000		       ,
		  dec_int_dis_first	[7:0],
		  40'h0000000000	       }),
	.din6	({8'h00			       ,
		  dec_int_dis_first	[7:0],
		  48'h000000000000	       }),
	.din7	({dec_int_dis_first	[7:0],
		  56'h00000000000000	       }),
	.sel	(cxi_int_dis_vec	[5:3]	),
	.muxtst	(tcu_muxtest_rep1		),
	.dout	(dec_int_dis		[63:0]	),
  .test(test)
);

// Mux the cleared registers with the base register and
//  OR the new vector in (saves gate levels...)

tlu_cth_dp_mux_macro__mux_aonpe__ports_4__width_64 int_rec_dis_muxed_mux    (
	.din0	(dec_int_dis		[63:0]	),
	.din1	(int_rec		[63:0]	),
	.din2	(inc_vec		[63:0]	),
	.din3	(int_rec_dis_muxed	[63:0]	),
	.sel0	(1'b1				),
	.sel1	(s_c_idvw_irw			),
	.sel2	(s_c_idvw_ivr			),
	.sel3	(neither_match			),
	.dout	(int_dis		[63:0]	)
);




////////////////////////////////////////////////////////////////////////////////
//
//  ASI muxing
//

tlu_cth_dp_msff_macro__mux_aonpe__ports_2__width_64 asi_lat    (
	.scan_in(asi_lat_scanin),
	.scan_out(asi_lat_scanout),
	.din0	(int_rec_muxed		[63:0]	),
	.din1	({58'h000000000000000	       ,
		  incoming_vector_in	[5:0]}),
	.sel0	(asi_rd_int_rec			),
	.sel1	(asi_rd_inc_vec			),
	.en	(asi_rd_stage_1			),
	.dout	(asi_data		[63:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_cth_dp_or_macro__ports_3__width_64 asi_data_or   (
	.din0	({{16 {1'b0}}		       ,
		 dfd_asi_data		[47:0]}),
	.din1	({{45 {1'b0}}		       ,
		 dfd_asi_desr		[18:0]}),
	.din2	(asi_data		[63:0]	),
	.dout	(cth_asi_data		[63:0]	)
);



////////////////////////////////////////////////////////////////////////////////
//
//  Check if the register has any bits set after clear operations
//
						
tlu_cth_dp_msff_macro__mux_aope__ports_2__width_64 irl_cleared_lat    (
	.scan_in(irl_cleared_lat_scanin),
	.scan_out(irl_cleared_lat_scanout),
	.din0	(int_rec		[63:0]	),
	.din1	(inc_vec		[63:0]	),
	.sel0	(asi_wr_any_int_rec		),
	.en	(any_irl_en			),
	.dout	(cth_irl_cleared	[63:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);




// fixscan start:
assign int_rec_mux_sel_lat_scanin = scan_in                  ;
assign incoming_vector_lat_scanin = int_rec_mux_sel_lat_scanout;
assign asi_lat_scanin            = incoming_vector_lat_scanout;
assign irl_cleared_lat_scanin    = asi_lat_scanout          ;
assign scan_out                  = irl_cleared_lat_scanout  ;

assign interrupt_receive7_lat_wmr_scanin = wmr_scan_in              ;
assign interrupt_receive6_lat_wmr_scanin = interrupt_receive7_lat_wmr_scanout;
assign interrupt_receive5_lat_wmr_scanin = interrupt_receive6_lat_wmr_scanout;
assign interrupt_receive4_lat_wmr_scanin = interrupt_receive5_lat_wmr_scanout;
assign interrupt_receive3_lat_wmr_scanin = interrupt_receive4_lat_wmr_scanout;
assign interrupt_receive2_lat_wmr_scanin = interrupt_receive3_lat_wmr_scanout;
assign interrupt_receive1_lat_wmr_scanin = interrupt_receive2_lat_wmr_scanout;
assign interrupt_receive0_lat_wmr_scanin = interrupt_receive1_lat_wmr_scanout;
assign wmr_scan_out              = interrupt_receive0_lat_wmr_scanout;
// fixscan end:
endmodule


//
//   buff macro
//
//





module tlu_cth_dp_buff_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





//  
//   or macro for ports = 2,3
//
//





module tlu_cth_dp_or_macro__ports_3__width_8 (
  din0, 
  din1, 
  din2, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  output [7:0] dout;






or3 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.in2(din2[7:0]),
.out(dout[7:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module tlu_cth_dp_or_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






or3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module tlu_cth_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module tlu_cth_dp_msff_macro__mux_aope__ports_3__width_64 (
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













// any PARAMS parms go into naming of macro

module tlu_cth_dp_msff_macro__dmux_8x__left_29__mux_aope__ports_2__width_3 (
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
wire [2:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [1:0] so;

  input [2:0] din0;
  input [2:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [2:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(3)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
.dout(muxout[2:0])
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
dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cth_dp_mux_macro__dmux_8x__mux_aodec__ports_8__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
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
  input [2:0] sel;
  output [63:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
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
//   buff macro
//
//





module tlu_cth_dp_buff_macro__width_62 (
  din, 
  dout);
  input [61:0] din;
  output [61:0] dout;






buff #(62)  d0_0 (
.in(din[61:0]),
.out(dout[61:0])
);








endmodule





//  
//   and macro for ports = 2,3,4
//
//





module tlu_cth_dp_and_macro__ports_2__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;






and2 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cth_dp_mux_macro__mux_aope__ports_8__width_3 (
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

  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  input [2:0] din3;
  input [2:0] din4;
  input [2:0] din5;
  input [2:0] din6;
  input [2:0] din7;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;
  output [2:0] dout;





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

mux8s #(3)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
  .in2(din2[2:0]),
  .in3(din3[2:0]),
  .in4(din4[2:0]),
  .in5(din5[2:0]),
  .in6(din6[2:0]),
  .in7(din7[2:0]),
.dout(dout[2:0])
);









  



endmodule


//
//   nor macro for ports = 2,3
//
//





module tlu_cth_dp_nor_macro__ports_2__width_28 (
  din0, 
  din1, 
  dout);
  input [27:0] din0;
  input [27:0] din1;
  output [27:0] dout;






nor2 #(28)  d0_0 (
.in0(din0[27:0]),
.in1(din1[27:0]),
.out(dout[27:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module tlu_cth_dp_nand_macro__ports_4__width_7 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [6:0] din0;
  input [6:0] din1;
  input [6:0] din2;
  input [6:0] din3;
  output [6:0] dout;






nand4 #(7)  d0_0 (
.in0(din0[6:0]),
.in1(din1[6:0]),
.in2(din2[6:0]),
.in3(din3[6:0]),
.out(dout[6:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cth_dp_mux_macro__dmux_6x__mux_aope__ports_8__width_6 (
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

  input [5:0] din0;
  input [5:0] din1;
  input [5:0] din2;
  input [5:0] din3;
  input [5:0] din4;
  input [5:0] din5;
  input [5:0] din6;
  input [5:0] din7;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;
  output [5:0] dout;





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

mux8s #(6)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[5:0]),
  .in1(din1[5:0]),
  .in2(din2[5:0]),
  .in3(din3[5:0]),
  .in4(din4[5:0]),
  .in5(din5[5:0]),
  .in6(din6[5:0]),
  .in7(din7[5:0]),
.dout(dout[5:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module tlu_cth_dp_msff_macro__width_6 (
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
wire [4:0] so;

  input [5:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [5:0] dout;


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
dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cth_dp_mux_macro__mux_aodec__ports_8__width_8 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  input [7:0] din3;
  input [7:0] din4;
  input [7:0] din5;
  input [7:0] din6;
  input [7:0] din7;
  input [2:0] sel;
  output [7:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(8)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
  .in2(din2[7:0]),
  .in3(din3[7:0]),
  .in4(din4[7:0]),
  .in5(din5[7:0]),
  .in6(din6[7:0]),
  .in7(din7[7:0]),
.dout(dout[7:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cth_dp_mux_macro__mux_aodec__ports_8__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
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
  input [2:0] sel;
  output [63:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
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
//   invert macro
//
//





module tlu_cth_dp_inv_macro__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






inv #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module tlu_cth_dp_nor_macro__ports_2__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;






nor2 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cth_dp_mux_macro__mux_aonpe__ports_8__width_64 (
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

module tlu_cth_dp_mux_macro__mux_aodec__ports_8__width_3 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  input [2:0] din3;
  input [2:0] din4;
  input [2:0] din5;
  input [2:0] din6;
  input [2:0] din7;
  input [2:0] sel;
  output [2:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(3)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
  .in2(din2[2:0]),
  .in3(din3[2:0]),
  .in4(din4[2:0]),
  .in5(din5[2:0]),
  .in6(din6[2:0]),
  .in7(din7[2:0]),
.dout(dout[2:0])
);









  



endmodule


//
//   nand macro for ports = 2,3,4
//
//





module tlu_cth_dp_nand_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module tlu_cth_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module tlu_cth_dp_and_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   buff macro
//
//





module tlu_cth_dp_buff_macro__dbuff_32x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cth_dp_mux_macro__mux_pgdec__ports_8__width_8 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  input [7:0] din3;
  input [7:0] din4;
  input [7:0] din5;
  input [7:0] din6;
  input [7:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [7:0] dout;





cl_dp1_pdec8_8x  c0_0 (
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7),
  .test(test)
);

mux8 #(8)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
  .in2(din2[7:0]),
  .in3(din3[7:0]),
  .in4(din4[7:0]),
  .in5(din5[7:0]),
  .in6(din6[7:0]),
  .in7(din7[7:0]),
.dout(dout[7:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   buff macro
//
//





module tlu_cth_dp_buff_macro__dbuff_48x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cth_dp_mux_macro__mux_pgdec__ports_8__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  muxtst, 
  test, 
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
  input [2:0] sel;
  input muxtst;
  input test;
  output [63:0] dout;





cl_dp1_pdec8_8x  c0_0 (
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7),
  .test(test)
);

mux8 #(64)  d0_0 (
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
.dout(dout[63:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cth_dp_mux_macro__mux_aonpe__ports_4__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  output [63:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module tlu_cth_dp_msff_macro__mux_aonpe__ports_2__width_64 (
  din0, 
  sel0, 
  din1, 
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
wire buffout0;
wire buffout1;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
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




cl_dp1_muxbuff2_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(64)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
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
//   or macro for ports = 2,3
//
//





module tlu_cth_dp_or_macro__ports_3__width_64 (
  din0, 
  din1, 
  din2, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  output [63:0] dout;






or3 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.in2(din2[63:0]),
.out(dout[63:0])
);









endmodule









// any PARAMS parms go into naming of macro

module tlu_cth_dp_msff_macro__mux_aope__ports_2__width_64 (
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








