// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_dcp_dp.v
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
module lsu_dcp_dp (
  lmd_fill_data_e, 
  dcc_parity_invert, 
  mbi_run, 
  mbi_wdata, 
  dcp_fill_data_e, 
  dcp_parity);
wire [15:0] parity;
wire [15:0] parity_e;


input	[127:0]	lmd_fill_data_e;
input	[7:0]	dcc_parity_invert;

input		mbi_run;
input	[7:0]	mbi_wdata;

output	[127:0]	dcp_fill_data_e;
output	[15:0]	dcp_parity;

// Mux in BIST data

lsu_dcp_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__width_64 bist_dmux0     (
	.din0	({8{mbi_wdata[7:0]}}),
	.din1	(lmd_fill_data_e[127:64]),
	.sel0	(mbi_run),
	.dout	(dcp_fill_data_e[127:64])
);

lsu_dcp_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__width_64 bist_dmux1     (
	.din0	({8{mbi_wdata[7:0]}}),
	.din1	(lmd_fill_data_e[63:0]),
	.sel0	(mbi_run),
	.dout	(dcp_fill_data_e[63:0])
);

////////////////////////////////////////////////////////////////////////////////
// Parity generation
////////////////////////////////////////////////////////////////////////////////

lsu_dcp_dp_prty_macro__width_8 prty_b00  (
	.din	(lmd_fill_data_e[7:0]),
	.dout	(parity[0])
);
lsu_dcp_dp_prty_macro__width_8 prty_b01  (
	.din	(lmd_fill_data_e[15:8]),
	.dout	(parity[1])
);
lsu_dcp_dp_prty_macro__width_8 prty_b02  (
	.din	(lmd_fill_data_e[23:16]),
	.dout	(parity[2])
);
lsu_dcp_dp_prty_macro__width_8 prty_b03  (
	.din	(lmd_fill_data_e[31:24]),
	.dout	(parity[3])
);
lsu_dcp_dp_prty_macro__width_8 prty_b04  (
	.din	(lmd_fill_data_e[39:32]),
	.dout	(parity[4])
);
lsu_dcp_dp_prty_macro__width_8 prty_b05  (
	.din	(lmd_fill_data_e[47:40]),
	.dout	(parity[5])
);
lsu_dcp_dp_prty_macro__width_8 prty_b06  (
	.din	(lmd_fill_data_e[55:48]),
	.dout	(parity[6])
);
lsu_dcp_dp_prty_macro__width_8 prty_b07  (
	.din	(lmd_fill_data_e[63:56]),
	.dout	(parity[7])
);
lsu_dcp_dp_prty_macro__width_8 prty_b08  (
	.din	(lmd_fill_data_e[71:64]),
	.dout	(parity[8])
);
lsu_dcp_dp_prty_macro__width_8 prty_b09  (
	.din	(lmd_fill_data_e[79:72]),
	.dout	(parity[9])
);
lsu_dcp_dp_prty_macro__width_8 prty_b10  (
	.din	(lmd_fill_data_e[87:80]),
	.dout	(parity[10])
);
lsu_dcp_dp_prty_macro__width_8 prty_b11  (
	.din	(lmd_fill_data_e[95:88]),
	.dout	(parity[11])
);
lsu_dcp_dp_prty_macro__width_8 prty_b12  (
	.din	(lmd_fill_data_e[103:96]),
	.dout	(parity[12])
);
lsu_dcp_dp_prty_macro__width_8 prty_b13  (
	.din	(lmd_fill_data_e[111:104]),
	.dout	(parity[13])
);
lsu_dcp_dp_prty_macro__width_8 prty_b14  (
	.din	(lmd_fill_data_e[119:112]),
	.dout	(parity[14])
);
lsu_dcp_dp_prty_macro__width_8 prty_b15  (
	.din	(lmd_fill_data_e[127:120]),
	.dout	(parity[15])
);

////////////////////////////////////////////////////////////////////////////////
// Error injection
////////////////////////////////////////////////////////////////////////////////

lsu_dcp_dp_xor_macro__stack_16l__width_16 error_inj   (
	.din0	(parity[15:0]),
	.din1	({dcc_parity_invert[7:0],dcc_parity_invert[7:0]}),
	.dout	(parity_e[15:0])
);

////////////////////////////////////////////////////////////////////////////////
// Mux in BIST data
// NOTE: If timing is too tight, this mux could be removed.  It would mean that
// the bist engine doesn't have direct control over the parity bits.
////////////////////////////////////////////////////////////////////////////////

lsu_dcp_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_16l__width_16 bist_pmux      (
	.din0	({2{mbi_wdata[7:0]}}),
	.din1	(parity_e[15:0]),
	.sel0	(mbi_run),
	.dout	(dcp_parity[15:0])
);

endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcp_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(64)  d0_0 (
  .sel(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   parity macro (even parity)
//
//





module lsu_dcp_dp_prty_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output dout;







prty #(8)  m0_0 (
.in(din[7:0]),
.out(dout)
);










endmodule





//
//   xor macro for ports = 2,3
//
//





module lsu_dcp_dp_xor_macro__stack_16l__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;





xor2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcp_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_16l__width_16 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [15:0] din0;
  input [15:0] din1;
  input sel0;
  output [15:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(16)  d0_0 (
  .sel(psel1),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
.dout(dout[15:0])
);









  



endmodule

