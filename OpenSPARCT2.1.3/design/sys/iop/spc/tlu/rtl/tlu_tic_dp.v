// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_tic_dp.v
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
module tlu_tic_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_dectest, 
  tcu_muxtest, 
  cmp_tick_enable, 
  asi_rd_tick, 
  asi_wr_tick, 
  asi_tca_addr, 
  asi_tca_addr_valid, 
  asi_tca_wr, 
  asi_wr_data, 
  asi_mbist_run, 
  asi_mbist_cmpsel, 
  tca_cmpr_data_in, 
  cel_ecc, 
  exu_address0_e, 
  exu_address1_e, 
  scan_out, 
  tic_cmpr_addr, 
  tic_cmpr_wr_en, 
  tic_cmpr_rd_en, 
  tic_asi_data, 
  tic_cmpr_data, 
  tic_addr, 
  tic_not_valid, 
  tic_match, 
  tic_mbist_data, 
  tic_exu_address0_m, 
  tic_exu_address1_m, 
  tic_exu_address0_b, 
  tic_exu_address1_b);
wire clk;
wire stop;
wire test;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire [62:0] wr_data;
wire tick_enable;
wire tick_en;
wire tick_lat_scanin;
wire tick_lat_scanout;
wire [62:0] tick_in;
wire [62:0] tick;
wire [17:16] unused;
wire [4:0] cmpr_addr_in;
wire cmpr_wr_en_in;
wire cmpr_rd_en_in;
wire cmpr_addr_lat_scanin;
wire cmpr_addr_lat_scanout;
wire [4:0] cmpr_addr;
wire cmpr_wr_en;
wire cmpr_data_lat_scanin;
wire cmpr_data_lat_scanout;
wire [63:0] cmpr_data;
wire [63:0] asi_data;
wire cmpsel_lat_scanin;
wire cmpsel_lat_scanout;
wire [1:0] cmpsel;
wire tcu_muxtest_rep0;
wire [31:0] mbist_data;
wire address0_m_lat_scanin;
wire address0_m_lat_scanout;
wire [1:0] address0_m;
wire address1_m_lat_scanin;
wire address1_m_lat_scanout;
wire [1:0] address1_m;



input 		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;
input		tcu_dectest;
input		tcu_muxtest;

// TICK register enable
input 		cmp_tick_enable;

input		asi_rd_tick;
input		asi_wr_tick;

input	[4:0]	asi_tca_addr;
input		asi_tca_addr_valid;
input 		asi_tca_wr;
input	[62:0]	asi_wr_data;
input		asi_mbist_run;		// MBIST
input	[1:0]	asi_mbist_cmpsel;	// MBIST

input	[63:0]	tca_cmpr_data_in;

input	[7:0]	cel_ecc;		// MBIST

input	[47:0]	exu_address0_e;		// For PCT but here for placement
input	[47:0]	exu_address1_e;		// For PCT but here for placement



output		scan_out;

output	[4:0]	tic_cmpr_addr;
output		tic_cmpr_wr_en;
output		tic_cmpr_rd_en;

output 	[63:0]	tic_asi_data;
output 	[63:0]	tic_cmpr_data;

output	[4:0]	tic_addr;
output		tic_not_valid;
output		tic_match;

output	[31:0]	tic_mbist_data;		// MBIST

output	[47:2]	tic_exu_address0_m;	// For PCT but here for placement
output	[47:2]	tic_exu_address1_m;	// For PCT but here for placement
output	[1:0]	tic_exu_address0_b;	// For DFD
output	[1:0]	tic_exu_address1_b;	// For DFD



// 0in bits_on -var {asi_wr_tick, asi_tca_wr} -max 1 -message "Writing TICK and CMPR at same time"
// 0in constant -var (asi_tca_wr & !asi_tca_addr_valid) -message "CMPR write valid without valid address"




////////////////////////////////////////////////////////////////////////////////

assign clk	= l2clk;
assign stop	= 1'b0;
assign test     = tcu_dectest;

tlu_tic_dp_buff_macro__width_4 clk_control_buf  (
	.din	({tcu_pce_ov		       ,
		  tcu_scan_en		       ,
		  spc_aclk		       ,
		  spc_bclk		       }),
	.dout	({pce_ov		       ,
		  se			       ,
		  siclk			       ,
		  soclk			       })
);


// Since bit 63 of the TICK and CMPR registers is stored negative active,
// need to invert write data and read data in tlu_asi_ctl

assign wr_data[62:0] =
       asi_wr_data[62:0];



///////////////////////////////////////////////////////////////////////////////
// Tick register
// TICK.NPT (bit 63) is stored in tlu_asi_ctl and 
// has POR value of 1

tlu_tic_dp_or_macro__ports_2__width_1 tick_en_or   (
	.din0	(asi_wr_tick			),
	.din1	(tick_enable			),
	.dout	(tick_en			)
);

tlu_tic_dp_msff_macro__mux_aope__ports_2__width_63 tick_lat    (	
	.scan_in(tick_lat_scanin),
	.scan_out(tick_lat_scanout),
	.en	(tick_en			),
	.din0	(wr_data		[62:0]	),
	.din1	(tick_in		[62:0]	),
	.sel0	(asi_wr_tick			),
	.dout	(tick			[62:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tic_dp_increment_macro__width_64 tick_inc  (
	.cin	(1'b1				),
	.din	({1'b0			       ,
		  tick			[62:0]}),
	.cout	(unused			[17   ]	),
	.dout	({unused		[16   ],
		  tick_in		[62:0]})
);

tlu_tic_dp_mux_macro__mux_pgpe__ports_2__width_6 cmpr_addr_mux    (
	.din0	({asi_tca_addr		[4:0],	
		  asi_tca_wr		       }),
	.din1	({tick			[6:2],
		  1'b0			       }),
	.sel0	(asi_tca_addr_valid		),
	.dout	({cmpr_addr_in		[4:0],
		  cmpr_wr_en_in		       })
);

tlu_tic_dp_inv_macro__width_1 cmpr_rd_en_in_inv  (
	.din	(cmpr_wr_en_in			),
	.dout	(cmpr_rd_en_in			)
);

assign tic_cmpr_addr[4:0] = 
       cmpr_addr_in[4:0];

assign tic_cmpr_wr_en =
       cmpr_wr_en_in;

assign tic_cmpr_rd_en =
       cmpr_rd_en_in;

tlu_tic_dp_msff_macro__width_13 cmpr_addr_lat  (
	.scan_in(cmpr_addr_lat_scanin),
	.scan_out(cmpr_addr_lat_scanout),
	.en	(1'b1				),
	.din	({cmp_tick_enable	       ,
		  cmpr_addr_in		[4:0],	
		  cmpr_wr_en_in		       ,
		  cmpr_addr		[4:0],
		  cmpr_wr_en		       }),
	.dout	({tick_enable		       ,
		  cmpr_addr		[4:0],
		  cmpr_wr_en		       ,
		  tic_addr		[4:0],
		  tic_not_valid		       }),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tic_dp_msff_macro__minbuff_1__width_64 cmpr_data_lat  (
	.scan_in(cmpr_data_lat_scanin),
	.scan_out(cmpr_data_lat_scanout),
	.en	(1'b1				),
	.din	(tca_cmpr_data_in	[63:0]	),
	.dout	(cmpr_data		[63:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

assign tic_cmpr_data[63:0] =
       cmpr_data[63:0];



///////////////////////////////////////////////////////////////////////////////
// Comparison
// Have to ignore 7 bits because
// - 5 bits for 8 threads x 3 cmpr regs per thread (round to 4)
// - 1 bit for ASI reads or writes
// - 1 more bit because ASI reads and writes are in different ASI pipe stages

tlu_tic_dp_cmp_macro__width_64 tick_cmp  (
	.din0	({cmpr_data		[63:7],
		  {7 {1'b0}}		       }),
 // INTDIS is stored negative active (effectively an interrupt enable), 
 // so compare when INTDIS is 1
	.din1	({1'b1			       ,
		  tick			[62:7],
		  {7 {1'b0}}		       }),
	.dout	(tic_match			)
);



///////////////////////////////////////////////////////////////////////////////
// ASI reads
// Note that bit 63 is inverted!

tlu_tic_dp_mux_macro__dmux_8x__mux_aope__ports_2__width_64 asi_lat     (
	.din0	({1'b0			       ,
		  tick			[62:0]}),
	.din1	(cmpr_data		[63:0]	),
	.sel0	(asi_rd_tick			),
	.dout	(asi_data		[63:0]	)
);

assign tic_asi_data[63:0] =
       asi_data[63:0];



///////////////////////////////////////////////////////////////////////////////
// MBIST muxing

tlu_tic_dp_msff_macro__width_2 cmpsel_lat  (
	.scan_in(cmpsel_lat_scanin),
	.scan_out(cmpsel_lat_scanout),
	.en	(asi_mbist_run			),
	.din	(asi_mbist_cmpsel	[1:0]	),
	.dout	(cmpsel			[1:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tic_dp_buff_macro__dbuff_32x__width_1 tst_mux_rep0   (
	.din	(tcu_muxtest			),
	.dout	(tcu_muxtest_rep0		)
);

tlu_tic_dp_mux_macro__mux_pgpe__ports_3__width_32 mbist_mux    (
	.din0	(cmpr_data		[31:0]	),
	.din1	(cmpr_data		[63:32]	),
	.din2	({4 {cel_ecc		[7:0]}}),
	.sel0	(cmpsel			[0   ]	),
	.sel1	(cmpsel			[1   ]	),
	.muxtst	(tcu_muxtest_rep0		),
	.dout	(mbist_data		[31:0]	),
  .test(test)
);

assign tic_mbist_data[31:0] =
       mbist_data[31:0];



///////////////////////////////////////////////////////////////////////////////
// Flop EXU address for PCT

tlu_tic_dp_msff_macro__width_50 address0_m_lat  (
	.scan_in(address0_m_lat_scanin),
	.scan_out(address0_m_lat_scanout),
	.en	(1'b1				),
	.din	({exu_address0_e	[47:0],
		  address0_m		[1:0]}),
	.dout	({tic_exu_address0_m	[47:2],
		  address0_m		[1:0],
		  tic_exu_address0_b	[1:0]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tic_dp_msff_macro__width_50 address1_m_lat  (
	.scan_in(address1_m_lat_scanin),
	.scan_out(address1_m_lat_scanout),
	.en	(1'b1				),
	.din	({exu_address1_e	[47:0],
		  address1_m		[1:0]}),
	.dout	({tic_exu_address1_m	[47:2],
		  address1_m		[1:0],
		  tic_exu_address1_b	[1:0]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);





// fixscan start:
assign tick_lat_scanin           = scan_in                  ;
assign cmpr_addr_lat_scanin      = tick_lat_scanout         ;
assign cmpr_data_lat_scanin      = cmpr_addr_lat_scanout    ;
assign cmpsel_lat_scanin         = cmpr_data_lat_scanout    ;
assign address0_m_lat_scanin     = cmpsel_lat_scanout       ;
assign address1_m_lat_scanin     = address0_m_lat_scanout   ;
assign scan_out                  = address1_m_lat_scanout   ;
// fixscan end:
endmodule



//
//   buff macro
//
//





module tlu_tic_dp_buff_macro__width_4 (
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





module tlu_tic_dp_or_macro__ports_2__width_1 (
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

module tlu_tic_dp_msff_macro__mux_aope__ports_2__width_63 (
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
wire [62:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [61:0] so;

  input [62:0] din0;
  input [62:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [62:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(63)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[62:0]),
  .in1(din1[62:0]),
.dout(muxout[62:0])
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
dff #(63)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[62:0]),
.si({scan_in,so[61:0]}),
.so({so[61:0],scan_out}),
.q(dout[62:0])
);




















endmodule









//
//   increment macro 
//
//





module tlu_tic_dp_increment_macro__width_64 (
  din, 
  cin, 
  dout, 
  cout);
  input [63:0] din;
  input cin;
  output [63:0] dout;
  output cout;






incr #(64)  m0_0 (
.cin(cin),
.in(din[63:0]),
.out(dout[63:0]),
.cout(cout)
);











endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tic_dp_mux_macro__mux_pgpe__ports_2__width_6 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [5:0] din0;
  input [5:0] din1;
  input sel0;
  output [5:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(6)  d0_0 (
  .sel(psel1),
  .in0(din0[5:0]),
  .in1(din1[5:0]),
.dout(dout[5:0])
);









  



endmodule


//
//   invert macro
//
//





module tlu_tic_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module tlu_tic_dp_msff_macro__width_13 (
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
wire [11:0] so;

  input [12:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [12:0] dout;


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
dff #(13)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[12:0]),
.si({scan_in,so[11:0]}),
.so({so[11:0],scan_out}),
.q(dout[12:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module tlu_tic_dp_msff_macro__minbuff_1__width_64 (
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









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module tlu_tic_dp_cmp_macro__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output dout;






cmp #(64)  m0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tic_dp_mux_macro__dmux_8x__mux_aope__ports_2__width_64 (
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

module tlu_tic_dp_msff_macro__width_2 (
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
wire [0:0] so;

  input [1:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [1:0] dout;


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
dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);




















endmodule









//
//   buff macro
//
//





module tlu_tic_dp_buff_macro__dbuff_32x__width_1 (
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

module tlu_tic_dp_mux_macro__mux_pgpe__ports_3__width_32 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input sel0;
  input sel1;
  input muxtst;
  input test;
  output [31:0] dout;





cl_dp1_penc3_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
  .test(test)
);

mux3 #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module tlu_tic_dp_msff_macro__width_50 (
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
wire [48:0] so;

  input [49:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [49:0] dout;


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
dff #(50)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[49:0]),
.si({scan_in,so[48:0]}),
.so({so[48:0],scan_out}),
.q(dout[49:0])
);




















endmodule








