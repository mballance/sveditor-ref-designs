// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_sel_dp.v
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
module mmu_sel_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tlu_cerer_scac, 
  tlu_cerer_scau, 
  asi_sel_en, 
  asi_rd_scp0, 
  sed_syndrome, 
  scp0_ecc, 
  scp1_ecc, 
  sed_cecc_err, 
  sed_uecc_err, 
  scan_out, 
  sel_syndrome, 
  sel_crit_ecc, 
  sel_scac, 
  sel_scau);
wire pce_ov;
wire clk;
wire stop;
wire siclk;
wire soclk;
wire se;
wire en;
wire [7:0] rd_ecc_in;
wire ecc_lat_scanin;
wire ecc_lat_scanout;
wire scac_in;
wire scau_in;
wire [7:0] rd_ecc;
wire scac;
wire scau;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input		tlu_cerer_scac;
input		tlu_cerer_scau;

input		asi_sel_en;
input		asi_rd_scp0;

input	[7:0]	sed_syndrome;

input	[7:0]	scp0_ecc;
input	[7:0]	scp1_ecc;

input		sed_cecc_err;
input		sed_uecc_err;


output		scan_out;

output	[7:0]	sel_syndrome;
output	[7:0]	sel_crit_ecc;

output		sel_scac;
output		sel_scau;



////////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign clk      = l2clk;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;
assign en       = asi_sel_en;



// Data is flopped, but ECC is not...  so mux and flop here

mmu_sel_dp_mux_macro__mux_aope__ports_2__width_8 rd_ecc_in_mux    (
	.din0	(scp0_ecc		[7:0]	),
	.din1	(scp1_ecc		[7:0]	),
	.sel0	(asi_rd_scp0			),
	.dout	(rd_ecc_in		[7:0]	)
);

mmu_sel_dp_msff_macro__width_18 ecc_lat  (
	.scan_in(ecc_lat_scanin),
	.scan_out(ecc_lat_scanout),
	.din	({rd_ecc_in		[7:0],
		  scac_in		       ,
		  scau_in		       ,
		  sed_syndrome		[7:0]}),
	.dout	({rd_ecc		[7:0],
		  scac			       ,
		  scau			       ,
		  sel_syndrome		[7:0]}),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign sel_crit_ecc[7:0] =
       rd_ecc[7:0];



// Qualify error signals

mmu_sel_dp_and_macro__ports_2__width_1 scac_in_and   (
	.din0	(sed_cecc_err			),
	.din1	(tlu_cerer_scac			),
	.dout	(scac_in			)
);

mmu_sel_dp_and_macro__ports_2__width_1 scau_in_and   (
	.din0	(sed_uecc_err			),
	.din1	(tlu_cerer_scau			),
	.dout	(scau_in			)
);

assign sel_scac =
       scac;

assign sel_scau =
       scau;


supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

// fixscan start:
assign ecc_lat_scanin            = scan_in                  ;
assign scan_out                  = ecc_lat_scanout          ;
// fixscan end:
endmodule



// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_sel_dp_mux_macro__mux_aope__ports_2__width_8 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [7:0] din0;
  input [7:0] din1;
  input sel0;
  output [7:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(8)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_sel_dp_msff_macro__width_18 (
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
wire [16:0] so;

  input [17:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [17:0] dout;


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
dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);




















endmodule









//  
//   and macro for ports = 2,3,4
//
//





module mmu_sel_dp_and_macro__ports_2__width_1 (
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




