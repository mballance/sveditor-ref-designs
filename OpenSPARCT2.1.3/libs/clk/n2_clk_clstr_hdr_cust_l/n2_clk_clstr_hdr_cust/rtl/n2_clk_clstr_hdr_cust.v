// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_clk_clstr_hdr_cust.v
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
`timescale 1 ns/1 ns
 
module n2_clk_clstr_hdr_cust (
	gclk,
	l2clk,
	cluster_arst_l,
	ccu_div_ph,
	cluster_div_en,	
	tcu_div_bypass,
	scan_in,
	scan_en,
	tcu_aclk,
	tcu_bclk,
	ccu_cmp_slow_sync_en,
	ccu_slow_cmp_sync_en,
	tcu_pce_ov,
	tcu_clk_stop,
	rst_por_,
	rst_wmr_,
	rst_wmr_protect,
	tcu_wr_inhibit,
	tcu_atpg_mode,
	array_wr_inhibit,
	aclk_wmr,
	aclk,
	bclk,
	cmp_slow_sync_en,
	slow_cmp_sync_en,
	pce_ov,
	por_,
	wmr_,
	wmr_protect,
	scan_out,
	cclk
);

// *******************************
// port declaration
// *******************************
 
input gclk;
input l2clk;
input cluster_arst_l; 
input ccu_div_ph;
input cluster_div_en;	
input tcu_div_bypass;
input scan_in;
input scan_en;
input tcu_aclk;
input tcu_bclk;
input ccu_cmp_slow_sync_en;
input ccu_slow_cmp_sync_en;
input tcu_pce_ov;
input tcu_clk_stop;
input rst_por_;
input rst_wmr_;
input rst_wmr_protect;
input tcu_wr_inhibit;	
input tcu_atpg_mode;			
output array_wr_inhibit;	
output aclk_wmr;
output aclk;
output bclk;
output cmp_slow_sync_en;
output slow_cmp_sync_en;
output pce_ov;
output por_;
output wmr_;
output wmr_protect;
output scan_out;
output cclk;


// *******************************
// wire declaration
// *******************************
 
wire gclk;
wire l2clk;
wire cluster_arst_l; 
wire ccu_div_ph;
wire cluster_div_en;	
wire tcu_div_bypass;
wire scan_in;
wire scan_en;
wire tcu_aclk;
wire tcu_bclk;
wire ccu_cmp_slow_sync_en;
wire ccu_slow_cmp_sync_en;
wire tcu_pce_ov;
wire tcu_clk_stop;
wire rst_por_;
wire rst_wmr_;
wire rst_wmr_protect;
wire tcu_wr_inhibit;	// to be made input
wire tcu_atpg_mode;			// to be made input
wire array_wr_inhibit;	// to be made output
wire aclk_wmr;
wire aclk;
wire bclk;
wire cmp_slow_sync_en;
wire slow_cmp_sync_en;
wire pce_ov;
wire por_;
wire wmr_;
wire wmr_protect;
wire scan_out;
wire cclk;


// additional internal nets 
wire div_r;
// wire div_f; // vlint

wire cluster_div_en_n;
wire tcu_div_bypass_n; 


wire sel0;
wire sel1;
// wire sel2; // vlint

wire div_out;
// wire div_r_n; // vlint
// wire div_f_n; // vlint

// wire gclk_n; // vlint
wire array_wr_inhibit_n;	


wire cclk_n;
wire pre_cclk;
wire div_clk;

wire l1clk;
wire l1gclk;

wire aclk_gated;
wire bclk_gated;
wire scan_en_gated;
wire scan_out_pre_mux;

wire aclk_gated_n;
wire bclk_gated_n;
wire scan_en_gated_n;
wire tcu_atpg_mode_n;

wire scan_ch;

// wire clk_stop_muxed; // vlint
// wire clk_stop_q; // vlint
wire clk_stop_synced;

wire rst_wmr_protect_n;
wire aclk_wmr_n;
wire div_r_sync;
wire sel0_n;
wire sel1_n;
wire div_ph_blatch;
wire div_r_sync_n;
wire div_mux;

// **********************************************************
// buffered & gated stuff 
// **********************************************************

cl_u1_buf_1x aclk_buf ( .in( tcu_aclk ), .out ( aclk ) );
cl_u1_buf_1x bclk_buf ( .in( tcu_bclk ), .out ( bclk ) );
cl_u1_buf_1x pce_ov_buf ( .in( tcu_pce_ov ), .out ( pce_ov ) );
cl_u1_buf_1x wmr_protect_buf ( .in( rst_wmr_protect ), .out ( wmr_protect ) );

// assign aclk_gated = aclk & tcu_atpg_mode;
// assign bclk_gated = bclk & tcu_atpg_mode;
// assign scan_en_gated = scan_en & tcu_atpg_mode;
// implemented right here
cl_u1_nand2_1x aclk_gated_nand ( .in0 (aclk), .in1 (tcu_atpg_mode), .out (aclk_gated_n) );
cl_u1_nand2_1x bclk_gated_nand ( .in0 (bclk), .in1 (tcu_atpg_mode), .out (bclk_gated_n) );
cl_u1_nand2_1x scan_en_gated_nand ( .in0 (scan_en), .in1 (tcu_atpg_mode), .out (scan_en_gated_n) );
cl_u1_inv_1x   aclk_gated_inv  ( .in (aclk_gated_n), .out (aclk_gated) );
cl_u1_inv_1x   bclk_gated_inv  ( .in (bclk_gated_n), .out (bclk_gated) );
cl_u1_inv_1x   scan_en_gated_inv  ( .in (scan_en_gated_n), .out (scan_en_gated) );

// assign scan_out = tcu_atpg_mode ? scan_out_pre_mux : scan_in ;	
// implemented below, and as instance "scan_chain_mux"
cl_u1_inv_1x tcu_atpg_mode_inv ( .in (tcu_atpg_mode) , .out (tcu_atpg_mode_n) );


// assign aclk_wmr = ~rst_wmr_protect & tcu_aclk; 


cl_u1_inv_1x wmr_protect_inv ( .in (rst_wmr_protect) , .out (rst_wmr_protect_n) );

cl_u1_nand2_1x aclk_wmr_gate ( 
	.in0 (aclk), 
	.in1 (rst_wmr_protect_n),
	.out (aclk_wmr_n) 
);

cl_u1_inv_1x aclk_wmr_inv ( .in (aclk_wmr_n) , .out (aclk_wmr) );

// cl_u1_inv_1x gclk_inv ( .in (gclk) , .out (gclk_n) );	// vlint

// **********************************************************
// l1hdr for scan 
// **********************************************************

n2_clk_clstr_hdr_l1hdr gclk_header (
    .l2clk(gclk),
    .l1clk(l1gclk),
    .pce(1'b1),
    .se(scan_en_gated),
    .pce_ov(1'b1),
    .stop(1'b0) // ECO1.2 - not allowed to stop local clocks
);

n2_clk_clstr_hdr_l1hdr l1_header (
    .l2clk(l2clk),
    .l1clk(l1clk),
    .pce(1'b1),
    .se(scan_en_gated),
    .pce_ov(1'b1),
    .stop(1'b0) // ECO1.3 - false info; no action needed
);

// **********************************************************
// make observe flops part of scan chain (observe only)
// **********************************************************

n2_clk_clstr_hdr_obs_flops observe_flops (
	.tcu_clk_stop (tcu_clk_stop),
	.ccu_div_ph (ccu_div_ph),
	.array_wr_inhibit (array_wr_inhibit), 
	.l1clk (l1gclk),
	.aclk (aclk_gated),
	.bclk (bclk_gated),
	.scan_in (scan_in),
	.scan_out (scan_ch)
);

cl_sc1_aomux2_1x scan_chain_mux (
	.sel0 ( tcu_atpg_mode ),
	.sel1 ( tcu_atpg_mode_n ),
	.in0 ( scan_out_pre_mux ),
	.in1 ( scan_in ),
	.out ( scan_out )
);


// **********************************************************
// synchronize the control signals 
// **********************************************************

n2_clk_clstr_hdr_sync control_sig_sync ( 
	.div_r ( div_r_sync ),
	.gclk ( l1gclk ),
	.l1clk ( l1clk ),
	.ccu_slow_cmp_sync_en ( ccu_slow_cmp_sync_en),
	.ccu_cmp_slow_sync_en ( ccu_cmp_slow_sync_en),
	.rst_por_ ( rst_por_),
	.rst_wmr_ ( rst_wmr_),
	.scan_in ( scan_ch ),
	.aclk ( aclk_gated ),
	.bclk ( bclk_gated ),
	.slow_cmp_sync_en ( slow_cmp_sync_en ),
	.cmp_slow_sync_en ( cmp_slow_sync_en ),
	.por_ ( por_ ),
	.wmr_ ( wmr_ ),
	.scan_out ( scan_out_pre_mux )
);


// **********************************************************
// divider & mux model
// **********************************************************

wire ccu_div_ph_ff;
wire ccu_div_ph_flop_unused; 

// first flop ccu_div_ph
cl_sc1_msff_1x ccu_div_ph_flop ( 
	.d ( ccu_div_ph ), 
	.l1clk ( gclk ), 
	.si ( 1'b0 ), 
	.siclk ( 1'b0 ), 
	.soclk ( 1'b0 ), 
	.q ( ccu_div_ph_ff ), 
	.so (ccu_div_ph_flop_unused) 
); 

// div_r = sel1 (ie, ~div_en | tcu_div_bypass ) | div_ph 	
// div_f = sel0 (ie, div_en & ~tcu_div_bypass )
//

// sel0 = ~div_bypass & div_en 		// div_ph select 
// sel1 = div_bypass | ~div_en 		// gclk select

cl_u1_inv_1x  div_bypass_inv ( .in (tcu_div_bypass), .out (tcu_div_bypass_n) );
cl_u1_inv_1x  cluster_div_inv ( .in (cluster_div_en), .out (cluster_div_en_n) );

//
// generate sel0 - div_ph sel 
// 

cl_u1_nand2_1x sel0_n_gen (
	.in0 (tcu_div_bypass_n),
	.in1 (cluster_div_en),
	.out (sel0_n)
);

cl_u1_inv_1x sel0_gen ( .in (sel0_n), .out (sel0) ); 


//
// generate sel1 - gclk sel 
//

cl_u1_nor2_1x sel2_n_gen (
	.in0 (cluster_div_en_n),
	.in1 (tcu_div_bypass),
	.out (sel1_n)
);

cl_u1_inv_1x sel1_gen ( .in (sel1_n), .out (sel1) ); 


// gate off div_r  
//cl_u1_nor2_1x div_r_gate ( 
//	.in0 (sel1),
//	.in1 (div_ph_blatch),
//	.out (div_r_n)
//);
wire blatch_divr_unused;
cl_sc1_blatch_4x blatch_divr (
        .latout(div_ph_blatch), .d(ccu_div_ph_ff), .l1clk (gclk),
        .so (blatch_divr_unused),  .si (1'b0), .siclk(1'b0), .soclk(1'b0) );

//cl_u1_nor2_1x div_r_gate ( 
//	.in0 (sel1),
//	.in1 (div_ph_blatch),
//	.out (div_r_n)
//);

cl_u1_buf_1x div_r_buf ( .in (div_ph_blatch), .out (div_r ) );


//
// divider model  
// 

// creating the div_r_to_syncronizer to mimic generation of
//div_r in schematic.

cl_u1_nor2_1x div_r_sync_gen_nor ( 
	.in0 (sel0_n),
	.in1 (ccu_div_ph_ff),
	.out (div_r_sync_n)
);

cl_u1_inv_1x div_r_sync_gen_inv ( .in (div_r_sync_n), .out (div_r_sync) );

cl_sc1_aomux2_1x alatch_in (
	.sel0 (~sel1 ),
	.sel1 ( sel1 ),
	.in0 ( div_r ),
	.in1 ( div_clk ),
	.out ( div_mux )
);

wire gclk_reset;
wire gclk_reset_n;
cl_u1_nor2_1x  nor_gclk_reset ( .in0 (sel1), .in1 (gclk), .out (gclk_reset_n));
cl_u1_inv_1x  inv_gclk_reset ( .in (gclk_reset_n), .out (gclk_reset));


wire alatch_unused;  
cl_sc1_alatch_4x alatch (
        .q(div_out), .d(div_mux), .l1clk (gclk_reset),
        .so (alatch_unused),  .si (1'b0), .siclk(1'b0), .soclk(1'b0), .se(1'b0) );

// muxed clock out 
cl_sc1_aomux2_1x final_mux (
	.sel0 ( sel0 ),
	.sel1 ( sel1 ),
	.in0 ( div_out ),
	.in1 ( gclk ),
	.out ( div_clk )
);

// **********************************************************
// clkstop for l2clk (via control of cclk) 
// **********************************************************

// 1. sync up clock stop (these are non-scanned)
n2_clk_clstr_hdr_clk_stop_syncff  clk_stop_syncff (
	.din ( tcu_clk_stop ),
	.synced ( clk_stop_synced ), 
	.clkin ( gclk ),
	.sync_clk ( div_clk ),
	.sel ( div_r_sync )

);

wire clk_stop_synced_stg1;
wire clk_stop_synced_stg2;
wire clk_stop_del_stg1_unused;  
wire clk_stop_del_stg2_unused;  
// 2. now delay sync'd up clock stop (these are non-scanned)
cl_sc1_msff_1x clk_stop_del_stg1  (
	.d (clk_stop_synced), .q (clk_stop_synced_stg1), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg1_unused)
);

cl_sc1_msff_1x clk_stop_del_stg2  (
	.d (clk_stop_synced_stg1), .q (clk_stop_synced_stg2), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg2_unused)
);

wire clk_stop_synced_stg2_gated;
wire clk_stop_synced_stg2_n;

cl_u1_inv_1x   clk_stop_stg2_inv ( .in (clk_stop_synced_stg2), .out (clk_stop_synced_stg2_n) );

// ECO1.5 - pushed the gate after the latch in the clk-stop instance "clk_stopper" 
// cl_u1_nor2_1x  clk_stop_stg2_nor ( .in0 (clk_stop_synced_stg2_n), .in1 (tcu_atpg_mode), .out (clk_stop_synced_stg2_gated) );
//
// 3. use blatch & and-gate for controlling clock
n2_clk_clstr_hdr_clkgate clk_stopper (
    .l2clk(div_clk),
    .l1clk(pre_cclk),
    .atpg_mode(tcu_atpg_mode),
    .clken(clk_stop_synced_stg2_n) 
);

// 4. finally gate-off with async reset 
// assign cclk = pre_cclk & cluster_arst_l; 
 
cl_u1_nand2_1x cclk_nand ( .in0 (pre_cclk), .in1 (cluster_arst_l), .out (cclk_n) );
cl_u1_inv_1x   cclk_inv  ( .in (cclk_n), .out (cclk) ); 


// **********************************************************
// array write inhibit operation 
// **********************************************************

wire clk_stop_synced_n; 

wire clk_stop_synced_stg3;
wire clk_stop_synced_stg4;
wire clk_stop_synced_stg5;
 
wire array_wr_inhibit1;
wire array_wr_inhibit2;

wire array_wr_inhibit1_n;
wire array_wr_inhibit2_n;
wire cluster_arst;
wire clk_stop_del_stg3_unused;
wire clk_stop_del_stg4_unused;
wire clk_stop_del_stg5_unused; 

cl_sc1_msff_1x clk_stop_del_stg3  (
	.d (clk_stop_synced_stg2), .q (clk_stop_synced_stg3), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg3_unused)
);

cl_sc1_msff_1x clk_stop_del_stg4  (
	.d (clk_stop_synced_stg3), .q (clk_stop_synced_stg4), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg4_unused)
);

cl_sc1_msff_1x clk_stop_del_stg5  (
	.d (clk_stop_synced_stg4), .q (clk_stop_synced_stg5), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg5_unused)
);


// assign array_wr_inhibit1 = clk_stop_synced & clk_stop_synced_stg5;

cl_u1_nand3_1x clk_stop_and_delayed ( // ECO1.4 - changed cl_u1_nand2_1x 
	.in0 (clk_stop_synced),
	.in1 (clk_stop_synced_stg5),
	.in2 (tcu_atpg_mode_n),
	.out (array_wr_inhibit1_n)
); 

cl_u1_inv_1x array_wr_inhibit1_inv ( .in(array_wr_inhibit1_n), .out(array_wr_inhibit1) );


// assign array_wr_inhibit2 = (~clk_stop_synced) & wr_inhibit_q2;
cl_u1_inv_1x clk_stop_synced_inv ( .in(clk_stop_synced), .out(clk_stop_synced_n) );

// ECO1.1 - removed nand gate from path of tcu_wr_inhibit
//          and replaced with buffer 
// 
// cl_u1_nand2_1x clk_stop_synced_and_wr_inhibit_q2 (
// 	.in0 (clk_stop_synced_n),
// 	.in1 (tcu_wr_inhibit), // (wr_inhibit_q2),
// 	.out (array_wr_inhibit2_n)
// ); 
//
// cl_u1_inv_1x array_wr_inhibit2_inv ( .in(array_wr_inhibit2_n), .out(array_wr_inhibit2) );
cl_u1_buf_1x array_wr_inhibit2_buf ( .in(tcu_wr_inhibit), .out(array_wr_inhibit2) );


// assign array_wr_inhibit  = array_wr_inhibit1 |  array_wr_inhibit2 | (~cluster_arst_l); 

cl_u1_inv_1x cluster_arst_inv (.in (cluster_arst_l), .out (cluster_arst));

cl_u1_nor3_1x array_wr_inhibit_nor (
	.in0 (array_wr_inhibit1),
	.in1 (array_wr_inhibit2),
	.in2 (cluster_arst),
	.out (array_wr_inhibit_n)
); 

cl_u1_inv_1x array_wr_inhibit_inv (.in (array_wr_inhibit_n), .out (array_wr_inhibit));

endmodule // n2_clk_clstr_hdr_cust 




// **********************************************************
// (fictitous) observe flop module for ATPG purposes 
// **********************************************************

module n2_clk_clstr_hdr_obs_flops (
	tcu_clk_stop,
	ccu_div_ph,
	array_wr_inhibit, 
	l1clk, 
	aclk,
	bclk,
	scan_in,
	scan_out
);

input tcu_clk_stop;
input ccu_div_ph;
input array_wr_inhibit; 
input l1clk;
input aclk;
input bclk;
input scan_in;
output scan_out;

wire tcu_clk_stop;
wire ccu_div_ph;
wire array_wr_inhibit; 
wire l1clk; 
wire aclk;
wire bclk;
wire scan_in;
wire scan_out;

wire scan_ch1;
wire scan_ch2;
wire obs_ff1_unused; 
wire obs_ff2_unused; 
wire obs_ff3_unused; 

cl_sc1_msff_1x obs_ff1 ( 
	.d ( tcu_clk_stop ), 
	.l1clk ( l1clk ), 
	.si ( scan_in ), 
	.siclk ( aclk ), 
	.soclk ( bclk ), 
	.q (obs_ff1_unused ), 
	.so ( scan_ch1 )
); 

cl_sc1_msff_1x obs_ff2 ( 
	.d ( ccu_div_ph ), 
	.l1clk ( l1clk ), 
	.si ( scan_ch1 ), 
	.siclk ( aclk ), 
	.soclk ( bclk ), 
	.q (obs_ff2_unused ), 
	.so ( scan_ch2 )
);

cl_sc1_msff_1x obs_ff3 ( 
	.d ( array_wr_inhibit ), 
	.l1clk ( l1clk ), 
	.si ( scan_ch2 ), 
	.siclk ( aclk ), 
	.soclk ( bclk ), 
	.q (obs_ff3_unused ), 
	.so ( scan_out )
);
endmodule // n2_clk_clstr_hdr_obs_flops 


// **********************************************************
// (fictitous) synchronizer module for ATPG purposes 
// **********************************************************

module n2_clk_clstr_hdr_sync ( 
	div_r,
	gclk,
	l1clk,
	ccu_slow_cmp_sync_en ,
	ccu_cmp_slow_sync_en ,
	rst_por_ ,
	rst_wmr_ ,
	scan_in,
	aclk,
	bclk,
	slow_cmp_sync_en,
	cmp_slow_sync_en,
	por_,
	wmr_,
	scan_out
);


input div_r;
input gclk;
input l1clk;
input ccu_slow_cmp_sync_en ;
input ccu_cmp_slow_sync_en ;
input rst_por_ ;
input rst_wmr_ ;
input scan_in;
input aclk;
input bclk;

output slow_cmp_sync_en;
output cmp_slow_sync_en;
output por_;
output wmr_;
output scan_out;

wire div_r;
// wire div_r_n; // vlint
wire gclk;
// wire gclk_n; // vlint
wire l1clk;

wire ccu_slow_cmp_sync_en ;
wire slow_cmp_sync_en;
wire ccu_cmp_slow_sync_en ;
wire cmp_slow_sync_en;
wire rst_por_ ;
wire por_;

wire rst_wmr_ ;
wire wmr_;

wire scan_in;
wire scan_out;
wire aclk;
wire bclk;

wire scan_ch1;
wire scan_ch2;
wire scan_ch3;


// slow_cmp_sync_en 
n2_clk_clstr_hdr_sync_ff  slow_cmp_sync_en_syncff (
	.din ( ccu_slow_cmp_sync_en ),
	.synced ( slow_cmp_sync_en ), 
	.clkin ( gclk ),
	.sync_clk ( l1clk ),
	.sel ( div_r ),
	.siclk ( aclk ),
	.soclk ( bclk ),
	.si ( scan_in ), 
	.so ( scan_ch1 )
);

// cmp_slow_sync_en 
n2_clk_clstr_hdr_sync_ff  cmp_slow_sync_en_syncff (
	.din ( ccu_cmp_slow_sync_en ),
	.synced ( cmp_slow_sync_en ), 
	.clkin ( gclk ),
	.sync_clk ( l1clk ),
	.sel ( div_r ),
	.siclk ( aclk ),
	.soclk ( bclk ),
	.si ( scan_ch1 ), 
	.so ( scan_ch2 )
);

// por_  
n2_clk_clstr_hdr_sync_ff  por_syncff (
	.din ( rst_por_ ),
	.synced ( por_ ), 
	.clkin ( gclk ),
	.sync_clk ( l1clk ),
	.sel ( div_r ),
	.siclk ( aclk ),
	.soclk ( bclk ),
	.si ( scan_ch2 ), 
	.so ( scan_ch3 )
);

// wmr_  
n2_clk_clstr_hdr_sync_ff  wmr_syncff (
	.din ( rst_wmr_ ),
	.synced ( wmr_ ), 
	.clkin ( gclk ),
	.sync_clk ( l1clk ),
	.sel ( div_r ),
	.siclk ( aclk ),
	.soclk ( bclk ),
	.si ( scan_ch3 ), 
	.so ( scan_out )
);

endmodule // n2_clk_clstr_hdr_sync 


// **********************************************************
// (fictitous) 1-bit synchronizer for ATPG purposes 
// **********************************************************

module n2_clk_clstr_hdr_sync_ff ( 
	din,
	synced,
	clkin,
	sync_clk,
	sel,
	siclk,
	soclk,
	si,
	so
);

input din;
output synced;
input clkin;
input sync_clk;
input siclk;
input soclk;
input si;
output so;
input sel;

wire din;
wire synced;
wire clkin;
wire sync_clk;
wire siclk;
wire soclk;
wire si;
wire so;
wire sel;

wire so_tmp;
wire sel_n;
wire din_q1;
wire din_muxed;

cl_u1_inv_1x sel_inv ( .in ( sel ), .out ( sel_n ) );

cl_sc1_aomux2_1x sync_mux1 (
	.sel0 ( sel_n ),
	.sel1 ( sel ),
	.in0 ( din_q1 ), 
	.in1 ( din ),
	.out ( din_muxed ) 
);

cl_sc1_msff_1x din_stg1 ( 
	.d ( din_muxed ), 
	.l1clk ( clkin ), 
	.si ( si ), 
	.siclk ( siclk ), 
	.soclk ( soclk ), 
	.q ( din_q1 ), 
	.so ( so_tmp )
); 
 
cl_sc1_msff_1x din_stg2 ( 
	.d ( din_q1 ), 
	.l1clk ( sync_clk ), 
	.si ( so_tmp ), 
	.siclk ( siclk ), 
	.soclk ( soclk ), 
	.q ( synced ), 
	.so ( so ) 
); 
endmodule // n2_clk_clstr_hdr_sync_ff 


// **********************************************************
// (fictitous)  module for clock stop sync.
// **********************************************************
module n2_clk_clstr_hdr_clk_stop_syncff  (
	din,
	synced,
	clkin,
	sync_clk,
	sel
);

input din;
output synced;
input clkin;
input sync_clk;
input sel;

wire din;
wire synced;
wire clkin;
wire sync_clk;
wire sel;

wire [2:0] so_unused; 

wire sel_n;
wire  din_q1_lat;
wire din_q1;
wire din_muxed;

cl_u1_inv_1x sel_inv ( .in(sel), .out(sel_n) );

cl_sc1_aomux2_1x sync_mux1 (
	.sel0 ( sel_n ), .sel1 ( sel ),
	.in0 ( din_q1 ), .in1 ( din ),
	.out ( din_muxed ) 
);

cl_sc1_msff_1x din_stg1 ( 
	.d ( din_muxed ), .l1clk ( clkin ), .q ( din_q1 ), 
	.si ( 1'b0 ), .siclk ( 1'b0 ), .soclk ( 1'b0 ),
        .so (so_unused[0])); 

cl_sc1_blatch_4x blatch ( 
	.latout(din_q1_lat), .d(din_q1), .l1clk (clkin), 
	.so (so_unused[1]),  .si (1'b0), .siclk(1'b0), .soclk(1'b0) );

cl_sc1_msff_1x din_stg2 ( 
	.d ( din_q1_lat ), .l1clk ( sync_clk ), .q ( synced ), 
	.siclk ( 1'b0 ), .soclk ( 1'b0 ), .si ( 1'b0 ), .so (so_unused[2] ) ); 

endmodule // n2_clk_clstr_hdr_clk_stop_sync_ff  



module  n2_clk_clstr_hdr_clkgate (
	 atpg_mode,
	 clken,
	 l2clk,
	 l1clk
);

input        atpg_mode;
input        clken;          // clken, active high 
input        l2clk;          // level 2 clock, from clock grid
output       l1clk;

wire         atpg_mode, clken, l2clk, l1clk;

wire  clken_gated;
wire  clken_gated_n;
wire  l1clk_n;
wire  clken_lat;
wire  so_unused;

cl_sc1_blatch_4x blatch ( 
	.latout(clken_lat), .d(clken), .l1clk (l2clk), 
	.so (so_unused),  .si (1'b0), .siclk(1'b0), .soclk(1'b0) );

cl_u1_nor2_1x  clken_nor ( .in0(clken_lat), .in1(atpg_mode), .out(clken_gated_n) );
cl_u1_inv_1x   clken_gated_inv ( .in(clken_gated_n), .out(clken_gated) );

cl_u1_nand2_1x clk_nand ( .in0(clken_gated), .in1(l2clk), .out(l1clk_n) );
cl_u1_inv_1x   clk_inv  ( .in(l1clk_n), .out(l1clk) );

endmodule // n2_clk_clstr_hdr_clkgate 

module  n2_clk_clstr_hdr_l1hdr (
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 l1clk
                );

   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   output       l1clk;

 reg l1en;

   always @ (l2clk or stop or pce or pce_ov ) begin  // vlint fix - latch model
		if (!l2clk) 
           l1en = (~stop & ( pce | pce_ov ));	 // vlint fix - replaced w/blocking 
   end

   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule // n2_clk_clstr_hdr_l1hdr 


