// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_mel_dp.v
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
module mmu_mel_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tlu_cerer_mrau, 
  tlu_cerer_hwtwmu, 
  mra_parity, 
  med0_parity_err, 
  med1_parity_err, 
  scan_out, 
  mel_crit_parity, 
  mel_parity, 
  mel_parity_err, 
  mel_htc_parity_err);
wire pce_ov;
wire clk;
wire stop;
wire siclk;
wire soclk;
wire se;
wire en;
wire ecc_lat_scanin;
wire ecc_lat_scanout;
wire parity_err_in;
wire parity_err_for_htc_in;
wire [1:0] rd_parity;
wire parity_err;
wire parity_err_for_htc;
wire cerer_mrau_;
wire cerer_hwtwmu_;
wire pparity_err_;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input		tlu_cerer_mrau;
input		tlu_cerer_hwtwmu;

input	[1:0]	mra_parity;

input		med0_parity_err;
input		med1_parity_err;


output		scan_out;

output	[1:0]	mel_crit_parity;
output	[1:0]	mel_parity;

output		mel_parity_err;
output		mel_htc_parity_err;



////////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign clk      = l2clk;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;
assign en       = 1'b1;



// Data is flopped, but parity is not...  so flop here

mmu_mel_dp_msff_macro__width_4 ecc_lat  (
	.scan_in(ecc_lat_scanin),
	.scan_out(ecc_lat_scanout),
	.din	({mra_parity		[1:0],
		  parity_err_in		       ,
		  parity_err_for_htc_in	       }),
	.dout	({rd_parity		[1:0],
		  parity_err		       ,
		  parity_err_for_htc	       }),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign mel_crit_parity[1:0] =
       rd_parity[1:0];

mmu_mel_dp_buff_macro__rep_1__width_2 parity_buf   (
	.din	(rd_parity		[1:0]	),
	.dout	(mel_parity		[1:0]	)
);

// Qualify error signals


mmu_mel_dp_inv_macro__width_1 cerer_mrau_inv  (
	.din	(tlu_cerer_mrau			),
	.dout	(cerer_mrau_			)
);

mmu_mel_dp_inv_macro__width_1 cerer_hwtwmu_inv  (
	.din	(tlu_cerer_hwtwmu		),
	.dout	(cerer_hwtwmu_			)
);

mmu_mel_dp_nor_macro__ports_2__width_1 parity_err_inv_nor   (
	.din0	(med0_parity_err		),
	.din1	(med1_parity_err		),
	.dout	(pparity_err_			)
);

mmu_mel_dp_nor_macro__ports_2__width_1 mrau_in_nor   (
	.din0	(pparity_err_			),
	.din1	(cerer_mrau_			),
	.dout	(parity_err_in			)
);

mmu_mel_dp_nor_macro__ports_2__width_1 parity_err_for_htc_in_nor   (
	.din0	(pparity_err_			),
	.din1	(cerer_hwtwmu_			),
	.dout	(parity_err_for_htc_in		)
);

assign mel_parity_err =
       parity_err;

assign mel_htc_parity_err =
       parity_err_for_htc;



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

// fixscan start:
assign ecc_lat_scanin            = scan_in                  ;
assign scan_out                  = ecc_lat_scanout          ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module mmu_mel_dp_msff_macro__width_4 (
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
wire [2:0] so;

  input [3:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [3:0] dout;


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
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);




















endmodule









//
//   buff macro
//
//





module mmu_mel_dp_buff_macro__rep_1__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   invert macro
//
//





module mmu_mel_dp_inv_macro__width_1 (
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
//   nor macro for ports = 2,3
//
//





module mmu_mel_dp_nor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule




