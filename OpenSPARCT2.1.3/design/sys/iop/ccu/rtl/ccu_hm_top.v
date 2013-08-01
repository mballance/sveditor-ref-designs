// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_hm_top.v
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
module ccu_hm_top (
	ref_clk,
	cmp_pll_clk_l,
	shift_amt,
	dr_shift_amt,
	rst_n,
	rst_out_n,
	div_msb,
	pulse_out
);

input ref_clk;
input cmp_pll_clk_l;
input [4:0] shift_amt;
input [4:0] dr_shift_amt;
input rst_n;
output rst_out_n;
input div_msb;
output pulse_out;

wire ref_clk;
wire cmp_pll_clk_l;
wire [4:0] shift_amt;
wire [4:0] dr_shift_amt;
wire rst_n;
wire rst_out_n;
wire div_msb;
wire pulse_out;


wire pll_l1clk; 
wire pll_buf_clk;
wire pll_div4_msb;
wire aligned;
wire aligned_tmp;
wire dft_rst_a_l;

assign pll_div4_msb = div_msb;
assign pulse_out = aligned;
assign rst_out_n = dft_rst_a_l;

wire rst = ~rst_n;

// ***********************************************
// ref-clk/cmp clk align detection 
// ***********************************************
ccu_hm_align_det align_det (
	.ref_clk (ref_clk),
	.fast_clk (pll_l1clk),
	.rst_n (rst_n),
 	.aligned (aligned_shft)
);

// ***********************************************
// shift align pulse+3 cycle to rising edges
// ***********************************************
ccu_hm_pulse_shift align_pulse_shift (
	.rst_n (rst_n),
	.clk (pll_l1clk),
	.shift (shift_amt),	
 	.pulse_in (aligned_shft),
	.pulse_out	 (aligned_tmp)
);

my_msff_arst_4x output_stg_eco2 ( 	// eco 2.2
	.l1clk (pll_l1clk),
	.d(aligned_tmp),
	.q(aligned),
	.siclk(1'b0),
	.soclk(1'b0),
	.si(1'b0),
	.reset (rst),
	.so()
);

// ***********************************************
// generate reset to pll for d4 output  (dr_clk)
// ***********************************************
ccu_hm_dr_reset_gen dr_reset_gen (
	.rst_out_n (dft_rst_a_l),
	.clk (pll_l1clk),
	.shift_amt (dr_shift_amt),
	.aligned (aligned),
	.div_msb (pll_div4_msb),
	.rst_n (rst_n)
);

// ***********************************************************
// Inversion & L1 header - pll l1clk 
// ***********************************************************
//
cl_a1_inv_32x pll_clk_inv ( .in (cmp_pll_clk_l),  .out (pll_l1clk) );

endmodule // ccu_hm_top 
