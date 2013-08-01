// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmo_dp.v
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
module dmo_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  ic_dmo_rd_data, 
  lsu_dc_data, 
  dmo_din, 
  dmo_coresel, 
  dmo_icmuxctl, 
  tcu_se_scancollar_out, 
  dmo_dout, 
  scan_out, 
  dmo_coresel_buff);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire dmo_icmuxctl_buff;
wire [35:0] dmo_din_buff;
wire dmo_flop_scanin;
wire dmo_flop_scanout;
wire [35:0] dmo_flop_dout;


input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;

input 	[32:0] 	ic_dmo_rd_data;
input 	[35:0] 	lsu_dc_data;

input 	[35:0]	dmo_din;		
input		dmo_coresel;
input		dmo_icmuxctl;

input		tcu_se_scancollar_out;

output 	[35:0]	dmo_dout;
output		scan_out;
output		dmo_coresel_buff; // for LSU

// scan renames
assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
//assign se	= tcu_se_scancollar_out;
//assign muxtst	= tcu_muxtest;
//assign test	= tcu_dectest;
// end scan

dmo_dpbuff_macro__rep_1__width_38 dmo_din_buf  (
  .din ({dmo_coresel, dmo_icmuxctl, dmo_din[35:0]}),
  .dout({dmo_coresel_buff, dmo_icmuxctl_buff, dmo_din_buff[35:0]})
  );

// Flop data from other core and this core
dmo_dpmsff_macro__mux_aope__ports_3__stack_64c__width_36	dmo_flop  (
  .scan_in(dmo_flop_scanin),
  .scan_out(dmo_flop_scanout),
  .clk ( l2clk					),
  .en  ( 1'b1					),
  .se  (tcu_se_scancollar_out			),
  .din0 ( dmo_din_buff[35:0]			),	// other core data
//  .din0 ( dmo_din[35:0]				),	// other core data
  .din1 ( {3'b0, ic_dmo_rd_data[32:0]}		),	// I$ data
  .din2 ( lsu_dc_data[35:0]			),	// D$ data
  .sel0 ( dmo_coresel_buff                    	),
  .sel1 ( dmo_icmuxctl_buff			),
  .dout( dmo_flop_dout[35:0]	),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

dmo_dpbuff_macro__dbuff_48x__rep_1__stack_none__width_36 dmo_dout_buf  (
  .din (dmo_flop_dout[35:0]),
  .dout(dmo_dout[35:0])
  );



// fixscan start:
assign dmo_flop_scanin           = scan_in                  ;
assign scan_out                  = dmo_flop_scanout         ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module dmo_dpbuff_macro__rep_1__width_38 (
  din, 
  dout);
  input [37:0] din;
  output [37:0] dout;






buff #(38)  d0_0 (
.in(din[37:0]),
.out(dout[37:0])
);








endmodule









// any PARAMS parms go into naming of macro

module dmo_dpmsff_macro__mux_aope__ports_3__stack_64c__width_36 (
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
wire [35:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [34:0] so;

  input [35:0] din0;
  input [35:0] din1;
  input [35:0] din2;
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



  output [35:0] dout;


  output scan_out;




cl_dp1_penc3_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(36)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
  .in2(din2[35:0]),
.dout(muxout[35:0])
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
dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);




















endmodule









//
//   buff macro
//
//





module dmo_dpbuff_macro__dbuff_48x__rep_1__stack_none__width_36 (
  din, 
  dout);
  input [35:0] din;
  output [35:0] dout;






buff #(36)  d0_0 (
.in(din[35:0]),
.out(dout[35:0])
);








endmodule




