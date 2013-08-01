// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_hm_align_det.v
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
`timescale 1 ns / 1ps

module ccu_hm_align_det (
	ref_clk,
	fast_clk,
	rst_n,
 	aligned
);


input ref_clk;
input fast_clk;
input rst_n;
output aligned; 

wire ref_clk;
wire fast_clk;
wire rst_n;
wire aligned; 


// inferred flops 
/*
reg ref_q1_n;
reg ref_q2_n;
reg ref_q3;
reg ref_q4;
reg ref_q5;
*/

wire ref_q1_n;
wire ref_q2_n;
wire ref_q3;
wire ref_q4;
wire ref_q5;

wire rst;
wire fast_clk_n;
wire ref_q5_in;


// inferred flops 
/*
always @ (negedge fast_clk or negedge rst_n) begin
	if (!rst_n) begin
		ref_q1_n <=  1'b0; 
		ref_q2_n <=  1'b0;
	end else begin
		ref_q1_n <= ref_clk;
		ref_q2_n <= ref_q1_n;
	end 
end
*/

// BEGIN_ECO
// POST TAPEOUT ECO - N2 BUG ....
wire ref_clk_n;
wire rst_n_synced;

assign ref_clk_n = ~ref_clk;
cl_a1_clksyncff_4x bf_arst_sync (
	.l1clk (ref_clk_n), .d (rst_n), .q (rst_n_synced),
	.siclk( 1'b0 ), .soclk( 1'b0 ), .si (1'b0), .so ()
);	
assign rst = ~(rst_n_synced & rst_n);	
// END_ECO

assign fast_clk_n = ~fast_clk; 

my_msff_arst_4x stg1_n (
	.l1clk (fast_clk_n),
	.reset (rst),
	.d (ref_clk),
	.q (ref_q1_n),
	.siclk (1'b0),
	.soclk (1'b0),
	.si (1'b0),
	.so ()
);

my_msff_arst_4x stg2_n (
	.l1clk (fast_clk_n),
	.reset (rst),
	.d (ref_q1_n),
	.q (ref_q2_n),
	.siclk (1'b0),
	.soclk (1'b0),
	.si (1'b0),
	.so ()
);



/*
always @ (posedge fast_clk or negedge rst_n) begin
	if (!rst_n) begin 
		ref_q3 <= 1'b0; 
		ref_q4 <= 1'b0; 
		ref_q5 <= 1'b0; 
	end else begin	// one half-cycle path
		ref_q3 <= ref_q2_n;
		ref_q4 <= ref_q3;
		ref_q5 <= ~ref_q4 & ref_q3; 
	end
end
*/

my_msff_arst_4x stg3 (
	.l1clk (fast_clk),
	.reset (rst),
	.d (ref_q2_n),
	.q (ref_q3),
	.siclk (1'b0),
	.soclk (1'b0),
	.si (1'b0),
	.so ()
);

my_msff_arst_4x stg4 (
	.l1clk (fast_clk),
	.reset (rst),
	.d (ref_q3),
	.q (ref_q4),
	.siclk (1'b0),
	.soclk (1'b0),
	.si (1'b0),
	.so ()
);


assign ref_q5_in = ~ref_q4 & ref_q3;

/* 
my_msff_arst_4x stg5 (
	.l1clk (fast_clk),
	.reset (rst),
	.d (ref_q5_in),
	.q (ref_q5),
	.siclk (1'b0),
	.soclk (1'b0),
	.si (1'b0),
	.so ()
);
*/

assign aligned = ref_q5_in;



endmodule 

