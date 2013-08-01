// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_adrgen_ctl.v
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
module mcu_adrgen_ctl (
  adrgen_rank, 
  adrgen_dimm, 
  adrgen_bank, 
  adrgen_row_addr, 
  adrgen_col_addr, 
  adrgen_addr_err, 
  adrgen_addr_parity, 
  addr_39to9, 
  addr_6to5, 
  stacked_dimm, 
  addr_bank_low_sel, 
  mem_type, 
  sngl_chnl_mode, 
  num_dimms, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire [39:10] addr_39to9_shft;
wire [6:5] addr_6to5_shft;
wire adrgen_mem_type3;
wire adrgen_mem_type0;
wire [10:0] adrgen_lo_col;
wire [10:0] adrgen_hi_col;
wire adrgen_eight_banks;
wire adrgen_lo_rank;
wire adrgen_hi_rank;
wire [2:0] adrgen_lo_dimm;
wire [2:0] adrgen_hi_dimm;
wire adrgen_mem_type0_in;
wire adrgen_mem_type1_in;
wire adrgen_mem_type2_in;
wire adrgen_mem_type3_in;
wire ff_mem_type_scanin;
wire ff_mem_type_scanout;
wire adrgen_mem_type2;
wire adrgen_mem_type1;
wire adrgen_num_dimms_eq_8_in;
wire adrgen_num_dimms_eq_7_in;
wire adrgen_num_dimms_eq_6_in;
wire adrgen_num_dimms_eq_5_in;
wire adrgen_num_dimms_eq_4_in;
wire adrgen_num_dimms_eq_3_in;
wire adrgen_num_dimms_eq_2_in;
wire adrgen_num_dimms_eq_1_in;
wire ff_num_dimms_scanin;
wire ff_num_dimms_scanout;
wire adrgen_num_dimms_eq_8;
wire adrgen_num_dimms_eq_7;
wire adrgen_num_dimms_eq_6;
wire adrgen_num_dimms_eq_5;
wire adrgen_num_dimms_eq_4;
wire adrgen_num_dimms_eq_3;
wire adrgen_num_dimms_eq_2;
wire adrgen_num_dimms_eq_1;
wire [8:0] upper_rank_mask;
wire [8:0] lower_rank_mask;
wire [2:0] num_lo_addr_bits;
wire [8:0] lower_rank_mask_in;
wire ff_rank_mask_scanin;
wire ff_rank_mask_scanout;
wire [7:0] error_mask;
wire ff_error_mask_scanin;
wire ff_error_mask_scanout;
wire [6:0] error_mask_in;
wire [2:0] error_bits;
wire [2:0] error_address;
wire [2:0] error_rank;
wire [2:0] error_dimm;


output        	adrgen_rank;
output [2:0]  	adrgen_dimm;
output [2:0]  	adrgen_bank;
output [14:0] 	adrgen_row_addr;
output [10:0] 	adrgen_col_addr;
output 		adrgen_addr_err;
output		adrgen_addr_parity;
   
input [39:9]  	addr_39to9;
input [6:5]	addr_6to5;

input 	 	stacked_dimm;
input 	 	addr_bank_low_sel; 	 
input [1:0] 	mem_type;
input		sngl_chnl_mode;
input [2:0] 	num_dimms;

input		l1clk;
input 		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

// Scan reassigns
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

assign addr_39to9_shft[39:10] = sngl_chnl_mode ? {addr_39to9[38:10],addr_6to5[5]} : addr_39to9[39:10];
assign addr_6to5_shft[6:5] = sngl_chnl_mode ? 2'h0 : addr_6to5[6:5];

assign adrgen_addr_parity = (^addr_39to9[39:9]) ^ addr_6to5[6];
assign adrgen_row_addr[14:0] = {adrgen_mem_type3 & addr_39to9_shft[33],
				~adrgen_mem_type0 & addr_39to9_shft[32], 
				addr_39to9_shft[31:19]};
assign adrgen_col_addr[10:0] = addr_bank_low_sel ? adrgen_lo_col[10:0] : adrgen_hi_col[10:0];
assign adrgen_bank[2:0] = {adrgen_eight_banks & addr_39to9[10], addr_39to9[9], addr_6to5[6]};
assign adrgen_rank = addr_bank_low_sel ? adrgen_lo_rank : adrgen_hi_rank;
assign adrgen_dimm[2:0] = addr_bank_low_sel ? adrgen_lo_dimm[2:0] : adrgen_hi_dimm[2:0];

// mem_type0 - 4 banks, 13 address bits
// mem_type1 - 4 banks, 14 address bits
// mem_type2 - 8 banks, 14 address bits
// mem_type3 - 8 banks, 15 address bits
assign adrgen_eight_banks = mem_type[1];

assign adrgen_mem_type0_in = ~mem_type[1] & ~mem_type[0];
assign adrgen_mem_type1_in = ~mem_type[1] &  mem_type[0];
assign adrgen_mem_type2_in =  mem_type[1] & ~mem_type[0];
assign adrgen_mem_type3_in =  mem_type[1] &  mem_type[0];

mcu_adrgen_ctl_msff_ctl_macro__width_4 ff_mem_type  (
	.scan_in(ff_mem_type_scanin),
	.scan_out(ff_mem_type_scanout),
	.din({adrgen_mem_type3_in,adrgen_mem_type2_in,adrgen_mem_type1_in,adrgen_mem_type0_in}),
	.dout({adrgen_mem_type3,adrgen_mem_type2,adrgen_mem_type1,adrgen_mem_type0}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign adrgen_num_dimms_eq_8_in = num_dimms[2:0] == 3'h0;
assign adrgen_num_dimms_eq_7_in = num_dimms[2:0] == 3'h7;
assign adrgen_num_dimms_eq_6_in = num_dimms[2:0] == 3'h6;
assign adrgen_num_dimms_eq_5_in = num_dimms[2:0] == 3'h5;
assign adrgen_num_dimms_eq_4_in = num_dimms[2:0] == 3'h4;
assign adrgen_num_dimms_eq_3_in = num_dimms[2:0] == 3'h3;
assign adrgen_num_dimms_eq_2_in = num_dimms[2:0] == 3'h2;
assign adrgen_num_dimms_eq_1_in = num_dimms[2:0] == 3'h1;

mcu_adrgen_ctl_msff_ctl_macro__width_8 ff_num_dimms  (
	.scan_in(ff_num_dimms_scanin),
	.scan_out(ff_num_dimms_scanout),
	.din ({adrgen_num_dimms_eq_8_in,adrgen_num_dimms_eq_7_in,adrgen_num_dimms_eq_6_in,adrgen_num_dimms_eq_5_in,
	       adrgen_num_dimms_eq_4_in,adrgen_num_dimms_eq_3_in,adrgen_num_dimms_eq_2_in,adrgen_num_dimms_eq_1_in}),
	.dout({adrgen_num_dimms_eq_8,   adrgen_num_dimms_eq_7,   adrgen_num_dimms_eq_6,   adrgen_num_dimms_eq_5,
	       adrgen_num_dimms_eq_4,   adrgen_num_dimms_eq_3,   adrgen_num_dimms_eq_2,   adrgen_num_dimms_eq_1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// HIGH ADDR SEL
// COL
assign adrgen_hi_col[0] = 1'b0;
assign adrgen_hi_col[1] = addr_6to5_shft[5];
assign adrgen_hi_col[2] = adrgen_mem_type2 & ~sngl_chnl_mode ? addr_39to9_shft[33] : 
			  adrgen_mem_type3 & ~sngl_chnl_mode ? addr_39to9_shft[34] : addr_39to9_shft[10];
assign adrgen_hi_col[3] = sngl_chnl_mode & adrgen_mem_type2 ? addr_39to9_shft[33] : 
			  sngl_chnl_mode & adrgen_mem_type3 ? addr_39to9_shft[34] : addr_39to9_shft[11];
assign adrgen_hi_col[10:4] = addr_39to9_shft[18:12];

// DIMM
assign adrgen_hi_dimm[2] = adrgen_num_dimms_eq_8 | adrgen_num_dimms_eq_7 | adrgen_num_dimms_eq_6 | adrgen_num_dimms_eq_5 ?  
				(adrgen_mem_type0 ? addr_39to9_shft[34] : 
	 			 adrgen_mem_type1 ? addr_39to9_shft[35] :
				 adrgen_mem_type2 ? addr_39to9_shft[36] : addr_39to9_shft[37]) : 1'b0;

assign adrgen_hi_dimm[1] = ~adrgen_num_dimms_eq_1 & ~adrgen_num_dimms_eq_2 & adrgen_mem_type0 ? addr_39to9_shft[33] :
	  ~adrgen_num_dimms_eq_1 & ~adrgen_num_dimms_eq_2 & adrgen_mem_type1 ? addr_39to9_shft[34] :
	  ~adrgen_num_dimms_eq_1 & ~adrgen_num_dimms_eq_2 & adrgen_mem_type2 ? addr_39to9_shft[35] :
	  ~adrgen_num_dimms_eq_1 & ~adrgen_num_dimms_eq_2 & adrgen_mem_type3 ? addr_39to9_shft[36] : 1'b0;

assign adrgen_hi_dimm[0] = ~adrgen_num_dimms_eq_1 & adrgen_mem_type0 ? addr_39to9_shft[32] :
	  ~adrgen_num_dimms_eq_1 & adrgen_mem_type1 ? addr_39to9_shft[33] :
	  ~adrgen_num_dimms_eq_1 & adrgen_mem_type2 ? addr_39to9_shft[34] :
	  ~adrgen_num_dimms_eq_1 & adrgen_mem_type3 ? addr_39to9_shft[35] : 1'b0;
// RANK
assign adrgen_hi_rank = stacked_dimm & adrgen_num_dimms_eq_1 & adrgen_mem_type0 ? addr_39to9_shft[32] :	  
	  stacked_dimm & adrgen_num_dimms_eq_1 & adrgen_mem_type1 |
	  stacked_dimm & (adrgen_num_dimms_eq_2 | adrgen_num_dimms_eq_3) & adrgen_mem_type0 ? addr_39to9_shft[33] :	  
	  stacked_dimm & adrgen_num_dimms_eq_1 & adrgen_mem_type2 |
	  stacked_dimm & (adrgen_num_dimms_eq_2 | adrgen_num_dimms_eq_3) & adrgen_mem_type1 |
	  stacked_dimm & num_dimms[2] & adrgen_mem_type0 ? addr_39to9_shft[34] :	  
	  stacked_dimm & adrgen_num_dimms_eq_1 & adrgen_mem_type3 |
	  stacked_dimm & (adrgen_num_dimms_eq_2 | adrgen_num_dimms_eq_3) & adrgen_mem_type2 |
	  stacked_dimm & num_dimms[2] & adrgen_mem_type1 |
	  stacked_dimm & adrgen_num_dimms_eq_8 & adrgen_mem_type0 ? addr_39to9_shft[35] :	  
	  stacked_dimm & (adrgen_num_dimms_eq_2 | adrgen_num_dimms_eq_3) & adrgen_mem_type3 |
	  stacked_dimm & num_dimms[2] & adrgen_mem_type2 |
	  stacked_dimm & adrgen_num_dimms_eq_8 & adrgen_mem_type1 ? addr_39to9_shft[36] :	  
	  stacked_dimm & num_dimms[2] & adrgen_mem_type3 |
	  stacked_dimm & adrgen_num_dimms_eq_8 & adrgen_mem_type2 ? addr_39to9_shft[37] :	  
	  stacked_dimm & adrgen_num_dimms_eq_8 & adrgen_mem_type3 ? addr_39to9_shft[38] : 1'b0;

// LOW ADDR SEL
// COL
assign adrgen_lo_col[0] = 1'b0;
assign adrgen_lo_col[1] = addr_6to5_shft[5];
assign adrgen_lo_col[10:2] = sngl_chnl_mode ? 
				{addr_39to9_shft[18:11] & upper_rank_mask[8:1] | lower_rank_mask[8:1] & 
					({8{adrgen_mem_type0}} & addr_39to9_shft[39:32] |
				 	{8{adrgen_mem_type1 | adrgen_mem_type2}} & {1'b0,addr_39to9_shft[39:33]} |
				 	{8{adrgen_mem_type3}} & {2'b0,addr_39to9_shft[39:34]}), addr_39to9_shft[10]} :
				addr_39to9_shft[18:10] & upper_rank_mask[8:0] | lower_rank_mask[8:0] & 
					({9{adrgen_mem_type0}} & {1'b0,addr_39to9_shft[39:32]} |
				 	{9{adrgen_mem_type1 | adrgen_mem_type2}} & {2'b0,addr_39to9_shft[39:33]} |
				 	{9{adrgen_mem_type3}} & {3'b0,addr_39to9_shft[39:34]});

assign upper_rank_mask[8:0] = ~lower_rank_mask[8:0];

assign num_lo_addr_bits[2:0] = 
	{1'b0, adrgen_num_dimms_eq_8 | adrgen_num_dimms_eq_4, adrgen_num_dimms_eq_8 | adrgen_num_dimms_eq_2} + 
	{2'h0,stacked_dimm} + {2'h0,adrgen_eight_banks} + {2'h0,sngl_chnl_mode};

assign lower_rank_mask_in[8:0] = {9{num_lo_addr_bits[2:0] == 3'h6}} & 9'h03f |
				 {9{num_lo_addr_bits[2:0] == 3'h5}} & 9'h01f |
				 {9{num_lo_addr_bits[2:0] == 3'h4}} & 9'h00f |
				 {9{num_lo_addr_bits[2:0] == 3'h3}} & 9'h007 |
				 {9{num_lo_addr_bits[2:0] == 3'h2}} & 9'h003 |
				 {9{num_lo_addr_bits[2:0] == 3'h1}} & 9'h001;

mcu_adrgen_ctl_msff_ctl_macro__width_9 ff_rank_mask  (
	.scan_in(ff_rank_mask_scanin),
	.scan_out(ff_rank_mask_scanout),
	.din(lower_rank_mask_in[8:0]),
	.dout(lower_rank_mask[8:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// DIMM
assign adrgen_lo_dimm[2] = adrgen_num_dimms_eq_8 ? 
				(~adrgen_eight_banks & addr_39to9[12] | adrgen_eight_banks & addr_39to9[13]) : 
	  adrgen_num_dimms_eq_6 & ~stacked_dimm & adrgen_mem_type0 ? addr_39to9[34] :
	  adrgen_num_dimms_eq_6 &  stacked_dimm & adrgen_mem_type0 |
	  adrgen_num_dimms_eq_6 & ~stacked_dimm & adrgen_mem_type1 ? addr_39to9[35] :
	  adrgen_num_dimms_eq_6 &  stacked_dimm & adrgen_mem_type1 |
	  adrgen_num_dimms_eq_6 & ~stacked_dimm & adrgen_mem_type2 ? addr_39to9[36] :
	  adrgen_num_dimms_eq_6 &  stacked_dimm & adrgen_mem_type2 |
	  adrgen_num_dimms_eq_6 & ~stacked_dimm & adrgen_mem_type3 ? addr_39to9[37] :
	  adrgen_num_dimms_eq_6 &  stacked_dimm & adrgen_mem_type3 ? addr_39to9[38] : 1'b0;

assign adrgen_lo_dimm[1] = adrgen_num_dimms_eq_4 | adrgen_num_dimms_eq_8 ? 
				(~adrgen_eight_banks & addr_39to9[11] | adrgen_eight_banks & addr_39to9[12]) : 
	  adrgen_num_dimms_eq_6 & ~stacked_dimm & adrgen_mem_type0 ? addr_39to9[33] :
	  adrgen_num_dimms_eq_6 &  stacked_dimm & adrgen_mem_type0 |
	  adrgen_num_dimms_eq_6 & ~stacked_dimm & adrgen_mem_type1 ? addr_39to9[34] :
	  adrgen_num_dimms_eq_6 &  stacked_dimm & adrgen_mem_type1 |
	  adrgen_num_dimms_eq_6 & ~stacked_dimm & adrgen_mem_type2 ? addr_39to9[35] :
	  adrgen_num_dimms_eq_6 &  stacked_dimm & adrgen_mem_type2 |
	  adrgen_num_dimms_eq_6 & ~stacked_dimm & adrgen_mem_type3 ? addr_39to9[36] :
	  adrgen_num_dimms_eq_6 &  stacked_dimm & adrgen_mem_type3 ? addr_39to9[37] : 1'b0;

assign adrgen_lo_dimm[0] = ~adrgen_num_dimms_eq_1 & (~adrgen_eight_banks & addr_39to9[10] | 
							adrgen_eight_banks & addr_39to9[11]);

// RANK
assign adrgen_lo_rank = stacked_dimm &
       (adrgen_num_dimms_eq_1 & (~adrgen_eight_banks & addr_39to9[10] |	adrgen_eight_banks & addr_39to9[11]) |
	adrgen_num_dimms_eq_2 & (~adrgen_eight_banks & addr_39to9[11] |	adrgen_eight_banks & addr_39to9[12]) |
	adrgen_num_dimms_eq_4 & (~adrgen_eight_banks & addr_39to9[12] |	adrgen_eight_banks & addr_39to9[13]) |
	adrgen_num_dimms_eq_6 & (~adrgen_eight_banks & addr_39to9[11] |	adrgen_eight_banks & addr_39to9[12]) |
	adrgen_num_dimms_eq_8 & (~adrgen_eight_banks & addr_39to9[13] |	adrgen_eight_banks & addr_39to9[14]));

assign adrgen_addr_err = |(addr_39to9_shft[39:32] & error_mask[7:0]);

mcu_adrgen_ctl_msff_ctl_macro__width_7 ff_error_mask  (
	.scan_in(ff_error_mask_scanin),
	.scan_out(ff_error_mask_scanout),
	.din(error_mask_in[6:0]),
	.dout(error_mask[6:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign error_mask[7] = 1'b1;
assign error_mask_in[6:0] = {7{error_bits[2:0] == 3'h7}} |
			    {7{error_bits[2:0] == 3'h6}} & 7'h7e |
			    {7{error_bits[2:0] == 3'h5}} & 7'h7c |
			    {7{error_bits[2:0] == 3'h4}} & 7'h78 |
			    {7{error_bits[2:0] == 3'h3}} & 7'h70 |
			    {7{error_bits[2:0] == 3'h2}} & 7'h60 |
			    {7{error_bits[2:0] == 3'h1}} & 7'h40;
assign error_bits[2:0] = error_address[2:0] - error_rank[2:0] - error_dimm[2:0];
assign error_address[2:0] = adrgen_mem_type0 ? 3'h7 : adrgen_mem_type1 ? 3'h6 : adrgen_mem_type2 ? 3'h5 : 3'h4;
assign error_rank[2:0] = stacked_dimm ? 3'h1 : 3'h0;
assign error_dimm[2:0] = adrgen_num_dimms_eq_1 ? 3'h0 :
			 adrgen_num_dimms_eq_2 ? 3'h1 :
			 adrgen_num_dimms_eq_3 | adrgen_num_dimms_eq_4 ? 3'h2 : 3'h3;

// fixscan start:
assign ff_mem_type_scanin        = scan_in                  ;
assign ff_num_dimms_scanin       = ff_mem_type_scanout      ;
assign ff_rank_mask_scanin       = ff_num_dimms_scanout     ;
assign ff_error_mask_scanin      = ff_rank_mask_scanout     ;
assign scan_out                  = ff_error_mask_scanout    ;
// fixscan end:
endmodule // addr_decode






// any PARAMS parms go into naming of macro

module mcu_adrgen_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_adrgen_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_adrgen_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_adrgen_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule








