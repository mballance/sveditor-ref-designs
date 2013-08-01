// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_cer_dp.v
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
module tlu_cer_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  asi_rd_cerer, 
  asi_rd_ceter, 
  asi_wr_cerer, 
  asi_ceter_tid, 
  asi_wr_ceter, 
  asi_wr_data, 
  cth_asi_data, 
  scan_out, 
  cer_asi_data, 
  tlu_cerer_ittp, 
  tlu_cerer_itdp, 
  tlu_cerer_ittm, 
  tlu_cerer_hwtwmu, 
  tlu_cerer_hwtwl2, 
  tlu_cerer_icl2c, 
  tlu_cerer_icl2u, 
  tlu_cerer_icl2nd, 
  tlu_cerer_irf, 
  tlu_cerer_frf, 
  tlu_cerer_dttp, 
  tlu_cerer_dttm, 
  tlu_cerer_dtdp, 
  tlu_cerer_dcl2c, 
  tlu_cerer_dcl2u, 
  tlu_cerer_dcl2nd, 
  tlu_cerer_sbdlc, 
  tlu_cerer_sbdlu, 
  tlu_cerer_mrau, 
  tlu_cerer_tsac, 
  tlu_cerer_tsau, 
  tlu_cerer_scac, 
  tlu_cerer_scau, 
  tlu_cerer_tccp, 
  tlu_cerer_tcup, 
  tlu_cerer_sbapp, 
  tlu_cerer_l2c_socc, 
  tlu_cerer_l2u_socu, 
  tlu_cerer_l2nd, 
  tlu_cerer_icvp, 
  tlu_cerer_ictp, 
  tlu_cerer_ictm, 
  tlu_cerer_icdp, 
  tlu_cerer_dcvp, 
  tlu_cerer_dctp, 
  tlu_cerer_dctm, 
  tlu_cerer_dcdp, 
  tlu_cerer_sbdpc, 
  tlu_cerer_sbdpu, 
  tlu_cerer_mamu, 
  tlu_cerer_tccd, 
  tlu_cerer_tcud, 
  tlu_cerer_mal2c, 
  tlu_cerer_mal2u, 
  tlu_cerer_mal2nd, 
  tlu_cerer_cwql2c, 
  tlu_cerer_cwql2u, 
  tlu_cerer_cwql2nd, 
  tlu_ceter_pscce, 
  tlu_ceter_de, 
  tlu_ceter_dhcce);
wire clk;
wire stop;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire [57:22] wr_data_unused;
wire cerer_lat_scanin;
wire cerer_lat_scanout;
wire [63:0] cerer;
wire [23:0] ceter;
wire [23:0] ceter_in;
wire ceter_lat_scanin;
wire ceter_lat_scanout;
wire [62:60] ceter_data;
wire [63:0] read_data;
wire [63:0] asi_data;



input 		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;


input		asi_rd_cerer;
input		asi_rd_ceter;
input		asi_wr_cerer;
input	[2:0]	asi_ceter_tid;
input		asi_wr_ceter;
input	[63:0]	asi_wr_data;

input	[63:0]	cth_asi_data;



output		scan_out;

output	[63:0]	cer_asi_data;

output		tlu_cerer_ittp 		;
output		tlu_cerer_itdp 		;
output		tlu_cerer_ittm 		;
output		tlu_cerer_hwtwmu	;
output		tlu_cerer_hwtwl2 	;
output		tlu_cerer_icl2c 	;
output		tlu_cerer_icl2u 	;
output		tlu_cerer_icl2nd 	;
output		tlu_cerer_irf 		;
output		tlu_cerer_frf 		;
output		tlu_cerer_dttp 		;
output		tlu_cerer_dttm 		;
output		tlu_cerer_dtdp 		;
output		tlu_cerer_dcl2c 	;
output		tlu_cerer_dcl2u 	;
output		tlu_cerer_dcl2nd 	;
output		tlu_cerer_sbdlc 	;
output		tlu_cerer_sbdlu 	;
output		tlu_cerer_mrau 		;
output		tlu_cerer_tsac 		;
output		tlu_cerer_tsau 		;
output		tlu_cerer_scac 		;
output		tlu_cerer_scau 		;
output		tlu_cerer_tccp 		;
output		tlu_cerer_tcup 		;
output		tlu_cerer_sbapp 	;
output		tlu_cerer_l2c_socc 	;
output		tlu_cerer_l2u_socu 	;
output		tlu_cerer_l2nd	 	;
output		tlu_cerer_icvp 		;
output		tlu_cerer_ictp 		;
output		tlu_cerer_ictm 		;
output		tlu_cerer_icdp 		;
output		tlu_cerer_dcvp 		;
output		tlu_cerer_dctp 		;
output		tlu_cerer_dctm 		;
output		tlu_cerer_dcdp 		;
output		tlu_cerer_sbdpc 	;
output		tlu_cerer_sbdpu 	;
output		tlu_cerer_mamu 		;
output		tlu_cerer_tccd 		;
output		tlu_cerer_tcud 		;
output		tlu_cerer_mal2c 	;
output		tlu_cerer_mal2u 	;
output		tlu_cerer_mal2nd 	;
output		tlu_cerer_cwql2c 	;
output		tlu_cerer_cwql2u 	;
output		tlu_cerer_cwql2nd 	;

output	[7:0]	tlu_ceter_pscce;
output	[7:0]	tlu_ceter_de;
output	[7:0]	tlu_ceter_dhcce;





////////////////////////////////////////////////////////////////////////////////

assign clk	= l2clk;
assign stop	= 1'b0;

tlu_cer_dp_buff_macro__width_4 clk_control_buf  (
	.din	({tcu_pce_ov		       ,
		  tcu_scan_en		       ,
		  spc_aclk		       ,
		  spc_bclk		       }),
	.dout	({pce_ov		       ,
		  se			       ,
		  siclk			       ,
		  soclk			       })
);

assign wr_data_unused[57:56] =
	  asi_wr_data[57:56];
assign wr_data_unused[51   ] =
	  asi_wr_data[51   ];
assign wr_data_unused[49   ] =
	  asi_wr_data[49   ];
assign wr_data_unused[45:41] =
	  asi_wr_data[45:41];
assign wr_data_unused[35:34] =
	  asi_wr_data[35:34];
assign wr_data_unused[26:24] =
	  asi_wr_data[26:24];
assign wr_data_unused[22   ] =
	  asi_wr_data[22   ];


///////////////////////////////////////////////////////////////////////////////
// CERER
// One per core

tlu_cer_dp_msff_macro__minbuff_1__width_48 cerer_lat  (	
	.scan_in(cerer_lat_scanin),
	.scan_out(cerer_lat_scanout),
	.en	(asi_wr_cerer			),
	.din	({asi_wr_data		[63:61],
		  asi_wr_data		[59:58],
		  asi_wr_data		[55:52],
		  asi_wr_data		[50   ],
		  asi_wr_data		[48:46],
		  asi_wr_data		[40:36],
		  asi_wr_data		[33:27],
		  asi_wr_data		[23   ],
		  asi_wr_data		[21:0]}),
	.dout	({cerer			[63:61],
		  cerer			[59:58],
		  cerer			[55:52],
		  cerer			[50   ],
		  cerer			[48:46],
		  cerer			[40:36],
		  cerer			[33:27],
		  cerer			[23   ],
		  cerer			[21:0]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign tlu_cerer_ittp 		= cerer[63];
assign tlu_cerer_itdp 		= cerer[62];
assign tlu_cerer_ittm 		= cerer[61];
assign tlu_cerer_hwtwmu		= cerer[59];
assign tlu_cerer_hwtwl2		= cerer[58];
assign tlu_cerer_icl2c 		= cerer[55];
assign tlu_cerer_icl2u 		= cerer[54];
assign tlu_cerer_icl2nd 	= cerer[53];
assign tlu_cerer_irf 		= cerer[52];
assign tlu_cerer_frf 		= cerer[50];
assign tlu_cerer_dttp 		= cerer[48];
assign tlu_cerer_dttm 		= cerer[47];
assign tlu_cerer_dtdp 		= cerer[46];
assign tlu_cerer_dcl2c 		= cerer[40];
assign tlu_cerer_dcl2u 		= cerer[39];
assign tlu_cerer_dcl2nd 	= cerer[38];
assign tlu_cerer_sbdlc 		= cerer[37];
assign tlu_cerer_sbdlu 		= cerer[36];
assign tlu_cerer_mrau 		= cerer[33];
assign tlu_cerer_tsac 		= cerer[32];
assign tlu_cerer_tsau 		= cerer[31];
assign tlu_cerer_scac 		= cerer[30];
assign tlu_cerer_scau 		= cerer[29];
assign tlu_cerer_tccp 		= cerer[28];
assign tlu_cerer_tcup 		= cerer[27];
assign tlu_cerer_sbapp 		= cerer[23];
assign tlu_cerer_l2c_socc	= cerer[21];
assign tlu_cerer_l2u_socu	= cerer[20];
assign tlu_cerer_l2nd		= cerer[19];
assign tlu_cerer_icvp 		= cerer[18];
assign tlu_cerer_ictp 		= cerer[17];
assign tlu_cerer_ictm 		= cerer[16];
assign tlu_cerer_icdp 		= cerer[15];
assign tlu_cerer_dcvp 		= cerer[14];
assign tlu_cerer_dctp 		= cerer[13];
assign tlu_cerer_dctm 		= cerer[12];
assign tlu_cerer_dcdp 		= cerer[11];
assign tlu_cerer_sbdpc 		= cerer[10];
assign tlu_cerer_sbdpu 		= cerer[9];
assign tlu_cerer_mamu 		= cerer[8];
assign tlu_cerer_tccd 		= cerer[7];
assign tlu_cerer_tcud 		= cerer[6];
assign tlu_cerer_mal2c 		= cerer[5];
assign tlu_cerer_mal2u 		= cerer[4];
assign tlu_cerer_mal2nd 	= cerer[3];
assign tlu_cerer_cwql2c 	= cerer[2];
assign tlu_cerer_cwql2u 	= cerer[1];
assign tlu_cerer_cwql2nd 	= cerer[0];


//////////////////////////////////////////////////////////////////////////////
// CETER
// 4 bits per CETER, 1 per thread

tlu_cer_dp_mux_macro__mux_aodec__ports_8__width_24 ceter_mux    (	
	.din0	({ceter			[23:3],
		  asi_wr_data		[62:60]}),
	.din1	({ceter			[23:6],
		  asi_wr_data		[62:60],
		  ceter			[2:0]}),
	.din2	({ceter			[23:9],
		  asi_wr_data		[62:60],
		  ceter			[5:0]}),
	.din3	({ceter			[23:12],
		  asi_wr_data		[62:60],
		  ceter			[8:0]}),
	.din4	({ceter			[23:15],
		  asi_wr_data		[62:60],
		  ceter			[11:0]}),
	.din5	({ceter			[23:18],
		  asi_wr_data		[62:60],
		  ceter			[14:0]}),
	.din6	({ceter			[23:21],
		  asi_wr_data		[62:60],
		  ceter			[17:0]}),
	.din7	({asi_wr_data		[62:60],
		  ceter			[20:0]}),
	.sel	(asi_ceter_tid		[2:0]	),
	.dout	(ceter_in		[23:0]	)
);

tlu_cer_dp_msff_macro__width_24 ceter_lat  (	
	.scan_in(ceter_lat_scanin),
	.scan_out(ceter_lat_scanout),
	.en	(asi_wr_ceter			),
	.din	(ceter_in		[23:0]	),
	.dout	(ceter			[23:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);




assign tlu_ceter_pscce[7:0] =
       {ceter[23], ceter[20], ceter[17], ceter[14],
	ceter[11], ceter[8], ceter[5], ceter[2]};

assign tlu_ceter_de[7:0] =
       {ceter[22], ceter[19], ceter[16], ceter[13],
	ceter[10], ceter[7], ceter[4], ceter[1]};

assign tlu_ceter_dhcce[7:0] =
       {ceter[21], ceter[18], ceter[15], ceter[12],
	ceter[9], ceter[6], ceter[3], ceter[0]};




//////////////////////////////////////////////////////////////////////////////
tlu_cer_dp_mux_macro__mux_aodec__ports_8__width_3 ceter_data_mux    (
	.din0	(ceter			[2:0]	),
	.din1	(ceter			[5:3]	),
	.din2	(ceter			[8:6]	),
	.din3	(ceter			[11:9]	),
	.din4	(ceter			[14:12]	),
	.din5	(ceter			[17:15]	),
	.din6	(ceter			[20:18]	),
	.din7	(ceter			[23:21]	),
	.sel	(asi_ceter_tid		[2:0]	),
	.dout	(ceter_data		[62:60]	)
);

tlu_cer_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_49 read_data_mux     (
	.din0	({cerer			[63:61],
		  1'b0			       ,
		  cerer			[59:58],
		  cerer			[55:52],
		  cerer			[50   ],
		  cerer			[48:46],
		  cerer			[40:36],
		  cerer			[33:27],
		  cerer			[23   ],
		  cerer			[21:0]}),
	.din1	({1'b0			       ,
		  ceter_data		[62:60],
		  {45 {1'b0}}		       }),
	.sel0	(asi_rd_cerer			),
	.sel1	(asi_rd_ceter			),
	.dout	({read_data		 [63:60],
		  read_data		 [59:58],
		  read_data		 [55:52],
		  read_data		 [50   ],
		  read_data		 [48:46],
		  read_data		 [40:36],
		  read_data		 [33:27],
		  read_data		 [23   ],
		  read_data		 [21:0]})
);

assign asi_data[63:0] =
       {read_data[63:60],
	read_data[59:58],
	{2 {1'b0}},
	read_data[55:52],
	{1 {1'b0}},
	read_data[50   ],
	{1 {1'b0}},
	read_data[48:46],
	{5 {1'b0}},
	read_data[40:36],
	{2 {1'b0}},
	read_data[33:27],
	{3 {1'b0}},
	read_data[23   ],
	{1 {1'b0}},
	read_data[21:0]};
       

tlu_cer_dp_or_macro__ports_2__width_64 asi_data_or   (
	.din0	(cth_asi_data		[63:0]	),
	.din1	(asi_data		[63:0]	),
	.dout	(cer_asi_data		[63:0]	)
);





// fixscan start:
assign cerer_lat_scanin          = scan_in                  ;
assign ceter_lat_scanin          = cerer_lat_scanout        ;
assign scan_out                  = ceter_lat_scanout        ;
// fixscan end:
endmodule



//
//   buff macro
//
//





module tlu_cer_dp_buff_macro__width_4 (
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

module tlu_cer_dp_msff_macro__minbuff_1__width_48 (
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
wire [46:0] so;

  input [47:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [47:0] dout;


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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cer_dp_mux_macro__mux_aodec__ports_8__width_24 (
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

  input [23:0] din0;
  input [23:0] din1;
  input [23:0] din2;
  input [23:0] din3;
  input [23:0] din4;
  input [23:0] din5;
  input [23:0] din6;
  input [23:0] din7;
  input [2:0] sel;
  output [23:0] dout;





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

mux8s #(24)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[23:0]),
  .in1(din1[23:0]),
  .in2(din2[23:0]),
  .in3(din3[23:0]),
  .in4(din4[23:0]),
  .in5(din5[23:0]),
  .in6(din6[23:0]),
  .in7(din7[23:0]),
.dout(dout[23:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module tlu_cer_dp_msff_macro__width_24 (
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
wire [22:0] so;

  input [23:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [23:0] dout;


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
dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cer_dp_mux_macro__mux_aodec__ports_8__width_3 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_cer_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_49 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [48:0] din0;
  input sel0;
  input [48:0] din1;
  input sel1;
  output [48:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(49)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[48:0]),
  .in1(din1[48:0]),
.dout(dout[48:0])
);









  



endmodule


//  
//   or macro for ports = 2,3
//
//





module tlu_cer_dp_or_macro__ports_2__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;






or2 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0])
);









endmodule




