// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_cep_dp.v
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
module tlu_cep_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  lsu_rngf_cdbus, 
  asi_stg1_en, 
  scan_out, 
  cep_wr_data);
wire pce_ov;
wire clk;
wire stop;
wire siclk;
wire soclk;
wire se;
wire bit63_;
wire asi_lat_scanin;
wire asi_lat_scanout;



input 		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input	[63:0] lsu_rngf_cdbus;

input		asi_stg1_en;



output		scan_out;

output 	[63:0]	cep_wr_data;


////////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign clk	= l2clk;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;


tlu_cep_dp_inv_macro__left_63__width_1 bit63_inv   (
	.din	(lsu_rngf_cdbus		[63   ]	),
	.dout	(bit63_				)
);

tlu_cep_dp_msff_macro__width_64 asi_lat  (	
	.scan_in(asi_lat_scanin),
	.scan_out(asi_lat_scanout),
	.en	(asi_stg1_en			),
	.din	({bit63_		       ,
		  lsu_rngf_cdbus	[62:0]}),
	.dout	(cep_wr_data		[63:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);



// fixscan start:
assign asi_lat_scanin            = scan_in                  ;
assign scan_out                  = asi_lat_scanout          ;
// fixscan end:
endmodule



//
//   invert macro
//
//





module tlu_cep_dp_inv_macro__left_63__width_1 (
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

module tlu_cep_dp_msff_macro__width_64 (
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








