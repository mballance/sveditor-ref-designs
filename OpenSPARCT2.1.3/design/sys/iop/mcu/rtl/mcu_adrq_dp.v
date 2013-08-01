// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_adrq_dp.v
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
module mcu_adrq_dp (
  l2clk, 
  drl2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  drif_scm, 
  rd_rank_adr, 
  rd_bank_adr, 
  rd_ras_adr, 
  rd_cas_adr, 
  l2rd_req_id, 
  wr_rank_adr, 
  wr_bank_adr, 
  wr_ras_adr, 
  wr_cas_adr, 
  rd_adr_queue7_en, 
  rd_adr_queue6_en, 
  rd_adr_queue5_en, 
  rd_adr_queue4_en, 
  rd_adr_queue3_en, 
  rd_adr_queue2_en, 
  rd_adr_queue1_en, 
  rd_adr_queue0_en, 
  rd_adr_queue_sel, 
  wr_adr_queue7_en, 
  wr_adr_queue6_en, 
  wr_adr_queue5_en, 
  wr_adr_queue4_en, 
  wr_adr_queue3_en, 
  wr_adr_queue2_en, 
  wr_adr_queue1_en, 
  wr_adr_queue0_en, 
  wr_adr_queue_sel, 
  wr1_adr_queue_sel, 
  wr2_adr_queue_sel, 
  req_rdwr_addr_sel, 
  ras_adr_queue, 
  cas_adr_queue, 
  rd_req_id_queue, 
  ras_wr1_adr_queue, 
  cas_wr1_adr_queue, 
  ras_wr2_adr_queue, 
  cas_wr2_adr_queue, 
  rd_wr_adr7_eq, 
  rd_wr_adr6_eq, 
  rd_wr_adr5_eq, 
  rd_wr_adr4_eq, 
  rd_wr_adr3_eq, 
  rd_wr_adr2_eq, 
  rd_wr_adr1_eq, 
  rd_wr_adr0_eq);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire u_mcu_rd_adr_sync_scanin;
wire u_mcu_rd_adr_sync_scanout;
wire [2:0] mcu_rd_req_id;
wire [3:0] mcu_rank_rd_adr;
wire [2:0] mcu_bank_rd_adr;
wire [14:0] mcu_ras_rd_adr;
wire [10:0] mcu_cas_rd_adr;
wire u_mcu_wr_adr_sync_scanin;
wire u_mcu_wr_adr_sync_scanout;
wire adrq_scm;
wire [3:0] mcu_rank_wr_adr;
wire [2:0] mcu_bank_wr_adr;
wire [14:0] mcu_ras_wr_adr;
wire [10:0] mcu_cas_wr_adr;
wire u_rd_adr_queue7_scanin;
wire u_rd_adr_queue7_scanout;
wire [2:0] rd_req_id_queue7;
wire [3:0] rank_rd_adr_queue7;
wire [2:0] bank_rd_adr_queue7;
wire [14:0] ras_rd_adr_queue7;
wire [10:0] cas_rd_adr_queue7;
wire u_rd_adr_queue6_scanin;
wire u_rd_adr_queue6_scanout;
wire [2:0] rd_req_id_queue6;
wire [3:0] rank_rd_adr_queue6;
wire [2:0] bank_rd_adr_queue6;
wire [14:0] ras_rd_adr_queue6;
wire [10:0] cas_rd_adr_queue6;
wire u_rd_adr_queue5_scanin;
wire u_rd_adr_queue5_scanout;
wire [2:0] rd_req_id_queue5;
wire [3:0] rank_rd_adr_queue5;
wire [2:0] bank_rd_adr_queue5;
wire [14:0] ras_rd_adr_queue5;
wire [10:0] cas_rd_adr_queue5;
wire u_rd_adr_queue4_scanin;
wire u_rd_adr_queue4_scanout;
wire [2:0] rd_req_id_queue4;
wire [3:0] rank_rd_adr_queue4;
wire [2:0] bank_rd_adr_queue4;
wire [14:0] ras_rd_adr_queue4;
wire [10:0] cas_rd_adr_queue4;
wire u_rd_adr_queue3_scanin;
wire u_rd_adr_queue3_scanout;
wire [2:0] rd_req_id_queue3;
wire [3:0] rank_rd_adr_queue3;
wire [2:0] bank_rd_adr_queue3;
wire [14:0] ras_rd_adr_queue3;
wire [10:0] cas_rd_adr_queue3;
wire u_rd_adr_queue2_scanin;
wire u_rd_adr_queue2_scanout;
wire [2:0] rd_req_id_queue2;
wire [3:0] rank_rd_adr_queue2;
wire [2:0] bank_rd_adr_queue2;
wire [14:0] ras_rd_adr_queue2;
wire [10:0] cas_rd_adr_queue2;
wire u_rd_adr_queue1_scanin;
wire u_rd_adr_queue1_scanout;
wire [2:0] rd_req_id_queue1;
wire [3:0] rank_rd_adr_queue1;
wire [2:0] bank_rd_adr_queue1;
wire [14:0] ras_rd_adr_queue1;
wire [10:0] cas_rd_adr_queue1;
wire u_rd_adr_queue0_scanin;
wire u_rd_adr_queue0_scanout;
wire [2:0] rd_req_id_queue0;
wire [3:0] rank_rd_adr_queue0;
wire [2:0] bank_rd_adr_queue0;
wire [14:0] ras_rd_adr_queue0;
wire [10:0] cas_rd_adr_queue0;
wire [3:0] rank_rd_adr_queue;
wire [2:0] bank_rd_adr_queue;
wire [14:0] ras_rd_adr_queue;
wire [10:0] cas_rd_adr_queue;
wire adrq_scm_l;
wire cas_rd_adr_cmp_2;
wire u_wr_adr_queue7_scanin;
wire u_wr_adr_queue7_scanout;
wire [3:0] rank_wr_adr_queue7;
wire [2:0] bank_wr_adr_queue7;
wire [14:0] ras_wr_adr_queue7;
wire [10:0] cas_wr_adr_queue7;
wire u_wr_adr_queue6_scanin;
wire u_wr_adr_queue6_scanout;
wire [3:0] rank_wr_adr_queue6;
wire [2:0] bank_wr_adr_queue6;
wire [14:0] ras_wr_adr_queue6;
wire [10:0] cas_wr_adr_queue6;
wire u_wr_adr_queue5_scanin;
wire u_wr_adr_queue5_scanout;
wire [3:0] rank_wr_adr_queue5;
wire [2:0] bank_wr_adr_queue5;
wire [14:0] ras_wr_adr_queue5;
wire [10:0] cas_wr_adr_queue5;
wire u_wr_adr_queue4_scanin;
wire u_wr_adr_queue4_scanout;
wire [3:0] rank_wr_adr_queue4;
wire [2:0] bank_wr_adr_queue4;
wire [14:0] ras_wr_adr_queue4;
wire [10:0] cas_wr_adr_queue4;
wire u_wr_adr_queue3_scanin;
wire u_wr_adr_queue3_scanout;
wire [3:0] rank_wr_adr_queue3;
wire [2:0] bank_wr_adr_queue3;
wire [14:0] ras_wr_adr_queue3;
wire [10:0] cas_wr_adr_queue3;
wire u_wr_adr_queue2_scanin;
wire u_wr_adr_queue2_scanout;
wire [3:0] rank_wr_adr_queue2;
wire [2:0] bank_wr_adr_queue2;
wire [14:0] ras_wr_adr_queue2;
wire [10:0] cas_wr_adr_queue2;
wire u_wr_adr_queue1_scanin;
wire u_wr_adr_queue1_scanout;
wire [3:0] rank_wr_adr_queue1;
wire [2:0] bank_wr_adr_queue1;
wire [14:0] ras_wr_adr_queue1;
wire [10:0] cas_wr_adr_queue1;
wire u_wr_adr_queue0_scanin;
wire u_wr_adr_queue0_scanout;
wire [3:0] rank_wr_adr_queue0;
wire [2:0] bank_wr_adr_queue0;
wire [14:0] ras_wr_adr_queue0;
wire [10:0] cas_wr_adr_queue0;
wire [14:0] ras_wr_adr_queue;
wire [10:0] cas_wr_adr_queue;


input		l2clk;
input		drl2clk;


input 		scan_in;
output		scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

input		drif_scm;

input	[3:0]	rd_rank_adr;
input	[2:0]	rd_bank_adr;
input	[14:0]	rd_ras_adr;
input	[10:0]	rd_cas_adr;
input	[2:0]	l2rd_req_id;

input	[3:0]	wr_rank_adr;
input	[2:0]	wr_bank_adr;
input	[14:0]	wr_ras_adr;
input	[10:0]	wr_cas_adr;

input		rd_adr_queue7_en;
input		rd_adr_queue6_en;
input		rd_adr_queue5_en;
input		rd_adr_queue4_en;
input		rd_adr_queue3_en;
input		rd_adr_queue2_en;
input		rd_adr_queue1_en;
input		rd_adr_queue0_en;
input	[7:0]	rd_adr_queue_sel;

input		wr_adr_queue7_en;
input		wr_adr_queue6_en;
input		wr_adr_queue5_en;
input		wr_adr_queue4_en;
input		wr_adr_queue3_en;
input		wr_adr_queue2_en;
input		wr_adr_queue1_en;
input		wr_adr_queue0_en;
input	[7:0]	wr_adr_queue_sel;
input	[7:0]	wr1_adr_queue_sel;
input	[7:0]	wr2_adr_queue_sel;

input	[1:0]	req_rdwr_addr_sel;

output	[14:0]	ras_adr_queue;			// RAS address 
output	[10:0]	cas_adr_queue;			// CAS address 
output	[2:0]	rd_req_id_queue;		// read request ID

output	[14:0]	ras_wr1_adr_queue;		// RAS for write in B Command slot
output	[10:0]	cas_wr1_adr_queue;		// CAS for write in B Command slot
output	[14:0]	ras_wr2_adr_queue;		// RAS for write in C Command slot
output	[10:0]	cas_wr2_adr_queue;		// CAS for write in C Command slot

output		rd_wr_adr7_eq;
output		rd_wr_adr6_eq;
output		rd_wr_adr5_eq;
output		rd_wr_adr4_eq;
output		rd_wr_adr3_eq;
output		rd_wr_adr2_eq;
output		rd_wr_adr1_eq;
output		rd_wr_adr0_eq;

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// read request address flops

mcu_adrq_dp_msff_macro__stack_38r__width_36	u_mcu_rd_adr_sync		       (
  		.scan_in(u_mcu_rd_adr_sync_scanin),
  		.scan_out(u_mcu_rd_adr_sync_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( 1'b1 ),
  		.din 	( { l2rd_req_id[2:0],   rd_rank_adr[3:0], 	 rd_bank_adr[2:0], 	  rd_ras_adr[14:0],        rd_cas_adr[10:0] 	  } ),
  		.dout	( { mcu_rd_req_id[2:0], mcu_rank_rd_adr[3:0],    mcu_bank_rd_adr[2:0],    mcu_ras_rd_adr[14:0],    mcu_cas_rd_adr[10:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );


// write request address flops

mcu_adrq_dp_msff_macro__stack_38r__width_34	u_mcu_wr_adr_sync		       (
  		.scan_in(u_mcu_wr_adr_sync_scanin),
  		.scan_out(u_mcu_wr_adr_sync_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( 1'b1 ),
  		.din 	( { drif_scm, wr_rank_adr[3:0],     wr_bank_adr[2:0],     wr_ras_adr[14:0],       wr_cas_adr[10:2], 2'b0 } ),
  		.dout	( { adrq_scm, mcu_rank_wr_adr[3:0], mcu_bank_wr_adr[2:0], mcu_ras_wr_adr[14:0], 	mcu_cas_wr_adr[10:0] }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );



// 8-entry read address request queue 

mcu_adrq_dp_msff_macro__stack_38r__width_36	u_rd_adr_queue7		       (
  		.scan_in(u_rd_adr_queue7_scanin),
  		.scan_out(u_rd_adr_queue7_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( rd_adr_queue7_en ),
  		.din 	( { mcu_rd_req_id[2:0],     mcu_rank_rd_adr[3:0],    mcu_bank_rd_adr[2:0],    mcu_ras_rd_adr[14:0],    mcu_cas_rd_adr[10:0]     } ),
  		.dout	( { rd_req_id_queue7[2:0],  rank_rd_adr_queue7[3:0], bank_rd_adr_queue7[2:0], ras_rd_adr_queue7[14:0], cas_rd_adr_queue7[10:0]  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_msff_macro__stack_38r__width_36	u_rd_adr_queue6		       (
  		.scan_in(u_rd_adr_queue6_scanin),
  		.scan_out(u_rd_adr_queue6_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( rd_adr_queue6_en ),
  		.din 	( { mcu_rd_req_id[2:0],     mcu_rank_rd_adr[3:0],    mcu_bank_rd_adr[2:0],    mcu_ras_rd_adr[14:0],    mcu_cas_rd_adr[10:0]     } ),
  		.dout	( { rd_req_id_queue6[2:0],  rank_rd_adr_queue6[3:0], bank_rd_adr_queue6[2:0], ras_rd_adr_queue6[14:0], cas_rd_adr_queue6[10:0]  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_msff_macro__stack_38r__width_36	u_rd_adr_queue5		       (
  		.scan_in(u_rd_adr_queue5_scanin),
  		.scan_out(u_rd_adr_queue5_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( rd_adr_queue5_en ),
  		.din 	( { mcu_rd_req_id[2:0],     mcu_rank_rd_adr[3:0],    mcu_bank_rd_adr[2:0],    mcu_ras_rd_adr[14:0],    mcu_cas_rd_adr[10:0]     } ),
  		.dout	( { rd_req_id_queue5[2:0],  rank_rd_adr_queue5[3:0], bank_rd_adr_queue5[2:0], ras_rd_adr_queue5[14:0], cas_rd_adr_queue5[10:0]  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_msff_macro__stack_38r__width_36	u_rd_adr_queue4		       (
  		.scan_in(u_rd_adr_queue4_scanin),
  		.scan_out(u_rd_adr_queue4_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( rd_adr_queue4_en ),
  		.din 	( { mcu_rd_req_id[2:0],     mcu_rank_rd_adr[3:0],    mcu_bank_rd_adr[2:0],    mcu_ras_rd_adr[14:0],    mcu_cas_rd_adr[10:0]     } ),
  		.dout	( { rd_req_id_queue4[2:0],  rank_rd_adr_queue4[3:0], bank_rd_adr_queue4[2:0], ras_rd_adr_queue4[14:0], cas_rd_adr_queue4[10:0]  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_msff_macro__stack_38r__width_36	u_rd_adr_queue3		       (
  		.scan_in(u_rd_adr_queue3_scanin),
  		.scan_out(u_rd_adr_queue3_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( rd_adr_queue3_en ),
  		.din 	( { mcu_rd_req_id[2:0],     mcu_rank_rd_adr[3:0],    mcu_bank_rd_adr[2:0],    mcu_ras_rd_adr[14:0],    mcu_cas_rd_adr[10:0]     } ),
  		.dout	( { rd_req_id_queue3[2:0],  rank_rd_adr_queue3[3:0], bank_rd_adr_queue3[2:0], ras_rd_adr_queue3[14:0], cas_rd_adr_queue3[10:0]  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_msff_macro__stack_38r__width_36	u_rd_adr_queue2		       (
  		.scan_in(u_rd_adr_queue2_scanin),
  		.scan_out(u_rd_adr_queue2_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( rd_adr_queue2_en ),
  		.din 	( { mcu_rd_req_id[2:0],     mcu_rank_rd_adr[3:0],    mcu_bank_rd_adr[2:0],    mcu_ras_rd_adr[14:0],    mcu_cas_rd_adr[10:0]     } ),
  		.dout	( { rd_req_id_queue2[2:0],  rank_rd_adr_queue2[3:0], bank_rd_adr_queue2[2:0], ras_rd_adr_queue2[14:0], cas_rd_adr_queue2[10:0]  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_msff_macro__stack_38r__width_36	u_rd_adr_queue1		       (
  		.scan_in(u_rd_adr_queue1_scanin),
  		.scan_out(u_rd_adr_queue1_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( rd_adr_queue1_en ),
  		.din 	( { mcu_rd_req_id[2:0],     mcu_rank_rd_adr[3:0],    mcu_bank_rd_adr[2:0],    mcu_ras_rd_adr[14:0],    mcu_cas_rd_adr[10:0]     } ),
  		.dout	( { rd_req_id_queue1[2:0],  rank_rd_adr_queue1[3:0], bank_rd_adr_queue1[2:0], ras_rd_adr_queue1[14:0], cas_rd_adr_queue1[10:0]  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_msff_macro__stack_38r__width_36	u_rd_adr_queue0		       (
  		.scan_in(u_rd_adr_queue0_scanin),
  		.scan_out(u_rd_adr_queue0_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( rd_adr_queue0_en ),
  		.din 	( { mcu_rd_req_id[2:0],     mcu_rank_rd_adr[3:0],    mcu_bank_rd_adr[2:0],    mcu_ras_rd_adr[14:0],    mcu_cas_rd_adr[10:0]     } ),
  		.dout	( { rd_req_id_queue0[2:0],  rank_rd_adr_queue0[3:0], bank_rd_adr_queue0[2:0], ras_rd_adr_queue0[14:0], cas_rd_adr_queue0[10:0]  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_mux_macro__mux_aonpe__ports_8__stack_38r__width_36	u_rd_adr_queue        	              (
  		.din0	( { rd_req_id_queue0[2:0], rank_rd_adr_queue0[3:0], bank_rd_adr_queue0[2:0], ras_rd_adr_queue0[14:0], cas_rd_adr_queue0[10:0] } ),	// default
  		.din1	( { rd_req_id_queue1[2:0], rank_rd_adr_queue1[3:0], bank_rd_adr_queue1[2:0], ras_rd_adr_queue1[14:0], cas_rd_adr_queue1[10:0] } ),
  		.din2	( { rd_req_id_queue2[2:0], rank_rd_adr_queue2[3:0], bank_rd_adr_queue2[2:0], ras_rd_adr_queue2[14:0], cas_rd_adr_queue2[10:0] } ),
  		.din3	( { rd_req_id_queue3[2:0], rank_rd_adr_queue3[3:0], bank_rd_adr_queue3[2:0], ras_rd_adr_queue3[14:0], cas_rd_adr_queue3[10:0] } ),
  		.din4	( { rd_req_id_queue4[2:0], rank_rd_adr_queue4[3:0], bank_rd_adr_queue4[2:0], ras_rd_adr_queue4[14:0], cas_rd_adr_queue4[10:0] } ),
  		.din5	( { rd_req_id_queue5[2:0], rank_rd_adr_queue5[3:0], bank_rd_adr_queue5[2:0], ras_rd_adr_queue5[14:0], cas_rd_adr_queue5[10:0] } ),
  		.din6	( { rd_req_id_queue6[2:0], rank_rd_adr_queue6[3:0], bank_rd_adr_queue6[2:0], ras_rd_adr_queue6[14:0], cas_rd_adr_queue6[10:0] } ),
  		.din7	( { rd_req_id_queue7[2:0], rank_rd_adr_queue7[3:0], bank_rd_adr_queue7[2:0], ras_rd_adr_queue7[14:0], cas_rd_adr_queue7[10:0] } ),
  		.sel0	( rd_adr_queue_sel[0] ),
  		.sel1	( rd_adr_queue_sel[1] ),
  		.sel2	( rd_adr_queue_sel[2] ),
  		.sel3	( rd_adr_queue_sel[3] ),
  		.sel4	( rd_adr_queue_sel[4] ),
  		.sel5	( rd_adr_queue_sel[5] ),
  		.sel6	( rd_adr_queue_sel[6] ),
  		.sel7	( rd_adr_queue_sel[7] ),
  		.dout	( { rd_req_id_queue[2:0], rank_rd_adr_queue[3:0], bank_rd_adr_queue[2:0], ras_rd_adr_queue[14:0], cas_rd_adr_queue[10:0] } ) );

// Mask off bit 2 in single channel mode for RAW hazard compare
mcu_adrq_dp_inv_macro	u_inv_scm ( .din(adrq_scm), .dout(adrq_scm_l));
mcu_adrq_dp_and_macro	u_rd_adr_2 ( .din0(adrq_scm_l), .din1(cas_rd_adr_queue[2]), .dout(cas_rd_adr_cmp_2));

// 8-entry write address request queue 

mcu_adrq_dp_msff_macro__stack_38r__width_33	u_wr_adr_queue7		       (
  		.scan_in(u_wr_adr_queue7_scanin),
  		.scan_out(u_wr_adr_queue7_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( wr_adr_queue7_en ),
  		.din 	( { mcu_rank_wr_adr[3:0],    mcu_bank_wr_adr[2:0],    mcu_ras_wr_adr[14:0],    mcu_cas_wr_adr[10:0] } ),
  		.dout	( { rank_wr_adr_queue7[3:0], bank_wr_adr_queue7[2:0], ras_wr_adr_queue7[14:0], cas_wr_adr_queue7[10:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_cmp_macro__width_32	u_cmp_adr_queue7	    (
		.din0	( { 1'b0, rank_rd_adr_queue[3:0],  bank_rd_adr_queue[2:0],  ras_rd_adr_queue[14:0],  cas_rd_adr_queue[10:3], cas_rd_adr_cmp_2 } ),
		.din1	( { 1'b0, rank_wr_adr_queue7[3:0], bank_wr_adr_queue7[2:0], ras_wr_adr_queue7[14:0], cas_wr_adr_queue7[10:2] } ),
		.dout	( rd_wr_adr7_eq ));

mcu_adrq_dp_msff_macro__stack_38r__width_33	u_wr_adr_queue6		       (
  		.scan_in(u_wr_adr_queue6_scanin),
  		.scan_out(u_wr_adr_queue6_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( wr_adr_queue6_en ),
  		.din 	( { mcu_rank_wr_adr[3:0],    mcu_bank_wr_adr[2:0],    mcu_ras_wr_adr[14:0],    mcu_cas_wr_adr[10:0] } ),
  		.dout	( { rank_wr_adr_queue6[3:0], bank_wr_adr_queue6[2:0], ras_wr_adr_queue6[14:0], cas_wr_adr_queue6[10:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_cmp_macro__width_32	u_cmp_adr_queue6	    (
		.din0	( { 1'b0, rank_rd_adr_queue[3:0],  bank_rd_adr_queue[2:0],  ras_rd_adr_queue[14:0],  cas_rd_adr_queue[10:3], cas_rd_adr_cmp_2 } ),
		.din1	( { 1'b0, rank_wr_adr_queue6[3:0], bank_wr_adr_queue6[2:0], ras_wr_adr_queue6[14:0], cas_wr_adr_queue6[10:2] } ),
		.dout	( rd_wr_adr6_eq ));

mcu_adrq_dp_msff_macro__stack_38r__width_33	u_wr_adr_queue5		       (
  		.scan_in(u_wr_adr_queue5_scanin),
  		.scan_out(u_wr_adr_queue5_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( wr_adr_queue5_en ),
  		.din 	( { mcu_rank_wr_adr[3:0],    mcu_bank_wr_adr[2:0],    mcu_ras_wr_adr[14:0],    mcu_cas_wr_adr[10:0] } ),
  		.dout	( { rank_wr_adr_queue5[3:0], bank_wr_adr_queue5[2:0], ras_wr_adr_queue5[14:0], cas_wr_adr_queue5[10:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_cmp_macro__width_32	u_cmp_adr_queue5	    (
		.din0	( { 1'b0, rank_rd_adr_queue[3:0],  bank_rd_adr_queue[2:0],  ras_rd_adr_queue[14:0],  cas_rd_adr_queue[10:3], cas_rd_adr_cmp_2 } ),
		.din1	( { 1'b0, rank_wr_adr_queue5[3:0], bank_wr_adr_queue5[2:0], ras_wr_adr_queue5[14:0], cas_wr_adr_queue5[10:2] } ),
		.dout	( rd_wr_adr5_eq ));

mcu_adrq_dp_msff_macro__stack_38r__width_33	u_wr_adr_queue4		       (
  		.scan_in(u_wr_adr_queue4_scanin),
  		.scan_out(u_wr_adr_queue4_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( wr_adr_queue4_en ),
  		.din 	( { mcu_rank_wr_adr[3:0],    mcu_bank_wr_adr[2:0],    mcu_ras_wr_adr[14:0],    mcu_cas_wr_adr[10:0] } ),
  		.dout	( { rank_wr_adr_queue4[3:0], bank_wr_adr_queue4[2:0], ras_wr_adr_queue4[14:0], cas_wr_adr_queue4[10:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_cmp_macro__width_32	u_cmp_adr_queue4	    (
		.din0	( { 1'b0, rank_rd_adr_queue[3:0],  bank_rd_adr_queue[2:0],  ras_rd_adr_queue[14:0],  cas_rd_adr_queue[10:3], cas_rd_adr_cmp_2 } ),
		.din1	( { 1'b0, rank_wr_adr_queue4[3:0], bank_wr_adr_queue4[2:0], ras_wr_adr_queue4[14:0], cas_wr_adr_queue4[10:2] } ),
		.dout	( rd_wr_adr4_eq ));

mcu_adrq_dp_msff_macro__stack_38r__width_33	u_wr_adr_queue3		       (
  		.scan_in(u_wr_adr_queue3_scanin),
  		.scan_out(u_wr_adr_queue3_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( wr_adr_queue3_en ),
  		.din 	( { mcu_rank_wr_adr[3:0],    mcu_bank_wr_adr[2:0],    mcu_ras_wr_adr[14:0],    mcu_cas_wr_adr[10:0] } ),
  		.dout	( { rank_wr_adr_queue3[3:0], bank_wr_adr_queue3[2:0], ras_wr_adr_queue3[14:0], cas_wr_adr_queue3[10:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_cmp_macro__width_32	u_cmp_adr_queue3	    (
		.din0	( { 1'b0, rank_rd_adr_queue[3:0],  bank_rd_adr_queue[2:0],  ras_rd_adr_queue[14:0],  cas_rd_adr_queue[10:3], cas_rd_adr_cmp_2 } ),
		.din1	( { 1'b0, rank_wr_adr_queue3[3:0], bank_wr_adr_queue3[2:0], ras_wr_adr_queue3[14:0], cas_wr_adr_queue3[10:2] } ),
		.dout	( rd_wr_adr3_eq ));

mcu_adrq_dp_msff_macro__stack_38r__width_33	u_wr_adr_queue2		       (
  		.scan_in(u_wr_adr_queue2_scanin),
  		.scan_out(u_wr_adr_queue2_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( wr_adr_queue2_en ),
  		.din 	( { mcu_rank_wr_adr[3:0],    mcu_bank_wr_adr[2:0],    mcu_ras_wr_adr[14:0],    mcu_cas_wr_adr[10:0] } ),
  		.dout	( { rank_wr_adr_queue2[3:0], bank_wr_adr_queue2[2:0], ras_wr_adr_queue2[14:0], cas_wr_adr_queue2[10:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_cmp_macro__width_32	u_cmp_adr_queue2	    (
		.din0	( { 1'b0, rank_rd_adr_queue[3:0],  bank_rd_adr_queue[2:0],  ras_rd_adr_queue[14:0],  cas_rd_adr_queue[10:3], cas_rd_adr_cmp_2 } ),
		.din1	( { 1'b0, rank_wr_adr_queue2[3:0], bank_wr_adr_queue2[2:0], ras_wr_adr_queue2[14:0], cas_wr_adr_queue2[10:2] } ),
		.dout	( rd_wr_adr2_eq ));

mcu_adrq_dp_msff_macro__stack_38r__width_33	u_wr_adr_queue1		       (
  		.scan_in(u_wr_adr_queue1_scanin),
  		.scan_out(u_wr_adr_queue1_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( wr_adr_queue1_en ),
  		.din 	( { mcu_rank_wr_adr[3:0],    mcu_bank_wr_adr[2:0],    mcu_ras_wr_adr[14:0],    mcu_cas_wr_adr[10:0] } ),
  		.dout	( { rank_wr_adr_queue1[3:0], bank_wr_adr_queue1[2:0], ras_wr_adr_queue1[14:0], cas_wr_adr_queue1[10:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_cmp_macro__width_32	u_cmp_adr_queue1	    (
		.din0	( { 1'b0, rank_rd_adr_queue[3:0],  bank_rd_adr_queue[2:0],  ras_rd_adr_queue[14:0],  cas_rd_adr_queue[10:3], cas_rd_adr_cmp_2 } ),
		.din1	( { 1'b0, rank_wr_adr_queue1[3:0], bank_wr_adr_queue1[2:0], ras_wr_adr_queue1[14:0], cas_wr_adr_queue1[10:2] } ),
		.dout	( rd_wr_adr1_eq ));

mcu_adrq_dp_msff_macro__stack_38r__width_33	u_wr_adr_queue0		       (
  		.scan_in(u_wr_adr_queue0_scanin),
  		.scan_out(u_wr_adr_queue0_scanout),
  		.clk 	( drl2clk ),	
  		.en  	( wr_adr_queue0_en ),
  		.din 	( { mcu_rank_wr_adr[3:0],    mcu_bank_wr_adr[2:0],    mcu_ras_wr_adr[14:0],    mcu_cas_wr_adr[10:0] } ),
  		.dout	( { rank_wr_adr_queue0[3:0], bank_wr_adr_queue0[2:0], ras_wr_adr_queue0[14:0], cas_wr_adr_queue0[10:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) );

mcu_adrq_dp_cmp_macro__width_32	u_cmp_adr_queue0	    (
		.din0	( { 1'b0, rank_rd_adr_queue[3:0],  bank_rd_adr_queue[2:0],  ras_rd_adr_queue[14:0],  cas_rd_adr_queue[10:3], cas_rd_adr_cmp_2 } ),
		.din1	( { 1'b0, rank_wr_adr_queue0[3:0], bank_wr_adr_queue0[2:0], ras_wr_adr_queue0[14:0], cas_wr_adr_queue0[10:2] } ),
		.dout	( rd_wr_adr0_eq ));

mcu_adrq_dp_mux_macro__mux_aonpe__ports_8__stack_38r__width_26	u_wr0_adr_queue        	              (
  		.din0	( { ras_wr_adr_queue0[14:0], cas_wr_adr_queue0[10:0] } ),	// default
  		.din1	( { ras_wr_adr_queue1[14:0], cas_wr_adr_queue1[10:0] } ),
  		.din2	( { ras_wr_adr_queue2[14:0], cas_wr_adr_queue2[10:0] } ),
  		.din3	( { ras_wr_adr_queue3[14:0], cas_wr_adr_queue3[10:0] } ),
  		.din4	( { ras_wr_adr_queue4[14:0], cas_wr_adr_queue4[10:0] } ),
  		.din5	( { ras_wr_adr_queue5[14:0], cas_wr_adr_queue5[10:0] } ),
  		.din6	( { ras_wr_adr_queue6[14:0], cas_wr_adr_queue6[10:0] } ),
  		.din7	( { ras_wr_adr_queue7[14:0], cas_wr_adr_queue7[10:0] } ),
  		.sel0	( wr_adr_queue_sel[0] ),
  		.sel1	( wr_adr_queue_sel[1] ),
  		.sel2	( wr_adr_queue_sel[2] ),
  		.sel3	( wr_adr_queue_sel[3] ),
  		.sel4	( wr_adr_queue_sel[4] ),
  		.sel5	( wr_adr_queue_sel[5] ),
  		.sel6	( wr_adr_queue_sel[6] ),
  		.sel7	( wr_adr_queue_sel[7] ),
  		.dout	( { ras_wr_adr_queue[14:0], cas_wr_adr_queue[10:0] } ) );

// request read/write address mux 
mcu_adrq_dp_mux_macro__mux_aonpe__ports_2__stack_38r__width_26	u_rdwr_adr_queue		              (
  		.din0	( { ras_wr_adr_queue[14:0], cas_wr_adr_queue[10:0] } ),
  		.din1	( { ras_rd_adr_queue[14:0], cas_rd_adr_queue[10:0] } ),		// default
  		.sel0	( req_rdwr_addr_sel[0] ),
  		.sel1	( req_rdwr_addr_sel[1] ),
  		.dout	( { ras_adr_queue[14:0],    cas_adr_queue[10:0] } ) );

mcu_adrq_dp_mux_macro__mux_aonpe__ports_8__stack_38r__width_26	u_wr1_adr_queue        	              (
  		.din0	( { ras_wr_adr_queue0[14:0], cas_wr_adr_queue0[10:0] } ),	// default
  		.din1	( { ras_wr_adr_queue1[14:0], cas_wr_adr_queue1[10:0] } ),
  		.din2	( { ras_wr_adr_queue2[14:0], cas_wr_adr_queue2[10:0] } ),
  		.din3	( { ras_wr_adr_queue3[14:0], cas_wr_adr_queue3[10:0] } ),
  		.din4	( { ras_wr_adr_queue4[14:0], cas_wr_adr_queue4[10:0] } ),
  		.din5	( { ras_wr_adr_queue5[14:0], cas_wr_adr_queue5[10:0] } ),
  		.din6	( { ras_wr_adr_queue6[14:0], cas_wr_adr_queue6[10:0] } ),
  		.din7	( { ras_wr_adr_queue7[14:0], cas_wr_adr_queue7[10:0] } ),
  		.sel0	( wr1_adr_queue_sel[0] ),
  		.sel1	( wr1_adr_queue_sel[1] ),
  		.sel2	( wr1_adr_queue_sel[2] ),
  		.sel3	( wr1_adr_queue_sel[3] ),
  		.sel4	( wr1_adr_queue_sel[4] ),
  		.sel5	( wr1_adr_queue_sel[5] ),
  		.sel6	( wr1_adr_queue_sel[6] ),
  		.sel7	( wr1_adr_queue_sel[7] ),
  		.dout	( { ras_wr1_adr_queue[14:0], cas_wr1_adr_queue[10:0] } ) );

mcu_adrq_dp_mux_macro__mux_aonpe__ports_8__stack_38r__width_26	u_wr2_adr_queue        	              (
  		.din0	( { ras_wr_adr_queue0[14:0], cas_wr_adr_queue0[10:0] } ),	// default
  		.din1	( { ras_wr_adr_queue1[14:0], cas_wr_adr_queue1[10:0] } ),
  		.din2	( { ras_wr_adr_queue2[14:0], cas_wr_adr_queue2[10:0] } ),
  		.din3	( { ras_wr_adr_queue3[14:0], cas_wr_adr_queue3[10:0] } ),
  		.din4	( { ras_wr_adr_queue4[14:0], cas_wr_adr_queue4[10:0] } ),
  		.din5	( { ras_wr_adr_queue5[14:0], cas_wr_adr_queue5[10:0] } ),
  		.din6	( { ras_wr_adr_queue6[14:0], cas_wr_adr_queue6[10:0] } ),
  		.din7	( { ras_wr_adr_queue7[14:0], cas_wr_adr_queue7[10:0] } ),
  		.sel0	( wr2_adr_queue_sel[0] ),
  		.sel1	( wr2_adr_queue_sel[1] ),
  		.sel2	( wr2_adr_queue_sel[2] ),
  		.sel3	( wr2_adr_queue_sel[3] ),
  		.sel4	( wr2_adr_queue_sel[4] ),
  		.sel5	( wr2_adr_queue_sel[5] ),
  		.sel6	( wr2_adr_queue_sel[6] ),
  		.sel7	( wr2_adr_queue_sel[7] ),
  		.dout	( { ras_wr2_adr_queue[14:0], cas_wr2_adr_queue[10:0] } ) );

// fixscan start:
assign u_mcu_rd_adr_sync_scanin  = scan_in                  ;
assign u_mcu_wr_adr_sync_scanin  = u_mcu_rd_adr_sync_scanout;
assign u_rd_adr_queue7_scanin    = u_mcu_wr_adr_sync_scanout;
assign u_rd_adr_queue6_scanin    = u_rd_adr_queue7_scanout  ;
assign u_rd_adr_queue5_scanin    = u_rd_adr_queue6_scanout  ;
assign u_rd_adr_queue4_scanin    = u_rd_adr_queue5_scanout  ;
assign u_rd_adr_queue3_scanin    = u_rd_adr_queue4_scanout  ;
assign u_rd_adr_queue2_scanin    = u_rd_adr_queue3_scanout  ;
assign u_rd_adr_queue1_scanin    = u_rd_adr_queue2_scanout  ;
assign u_rd_adr_queue0_scanin    = u_rd_adr_queue1_scanout  ;
assign u_wr_adr_queue7_scanin    = u_rd_adr_queue0_scanout  ;
assign u_wr_adr_queue6_scanin    = u_wr_adr_queue7_scanout  ;
assign u_wr_adr_queue5_scanin    = u_wr_adr_queue6_scanout  ;
assign u_wr_adr_queue4_scanin    = u_wr_adr_queue5_scanout  ;
assign u_wr_adr_queue3_scanin    = u_wr_adr_queue4_scanout  ;
assign u_wr_adr_queue2_scanin    = u_wr_adr_queue3_scanout  ;
assign u_wr_adr_queue1_scanin    = u_wr_adr_queue2_scanout  ;
assign u_wr_adr_queue0_scanin    = u_wr_adr_queue1_scanout  ;
assign scan_out                  = u_wr_adr_queue0_scanout  ;
// fixscan end:
endmodule	// mcu_adrq_dp






// any PARAMS parms go into naming of macro

module mcu_adrq_dp_msff_macro__stack_38r__width_36 (
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
wire [34:0] so;

  input [35:0] din;


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
.d(din[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mcu_adrq_dp_msff_macro__stack_38r__width_34 (
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
wire [32:0] so;

  input [33:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [33:0] dout;


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
dff #(34)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[33:0]),
.si({scan_in,so[32:0]}),
.so({so[32:0],scan_out}),
.q(dout[33:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_adrq_dp_mux_macro__mux_aonpe__ports_8__stack_38r__width_36 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [35:0] din0;
  input sel0;
  input [35:0] din1;
  input sel1;
  input [35:0] din2;
  input sel2;
  input [35:0] din3;
  input sel3;
  input [35:0] din4;
  input sel4;
  input [35:0] din5;
  input sel5;
  input [35:0] din6;
  input sel6;
  input [35:0] din7;
  input sel7;
  output [35:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(36)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
  .in2(din2[35:0]),
  .in3(din3[35:0]),
  .in4(din4[35:0]),
  .in5(din5[35:0]),
  .in6(din6[35:0]),
  .in7(din7[35:0]),
.dout(dout[35:0])
);









  



endmodule


//
//   invert macro
//
//





module mcu_adrq_dp_inv_macro (
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
//   and macro for ports = 2,3,4
//
//





module mcu_adrq_dp_and_macro (
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









// any PARAMS parms go into naming of macro

module mcu_adrq_dp_msff_macro__stack_38r__width_33 (
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
wire [31:0] so;

  input [32:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [32:0] dout;


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
dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mcu_adrq_dp_cmp_macro__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_adrq_dp_mux_macro__mux_aonpe__ports_8__stack_38r__width_26 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [25:0] din0;
  input sel0;
  input [25:0] din1;
  input sel1;
  input [25:0] din2;
  input sel2;
  input [25:0] din3;
  input sel3;
  input [25:0] din4;
  input sel4;
  input [25:0] din5;
  input sel5;
  input [25:0] din6;
  input sel6;
  input [25:0] din7;
  input sel7;
  output [25:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(26)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[25:0]),
  .in1(din1[25:0]),
  .in2(din2[25:0]),
  .in3(din3[25:0]),
  .in4(din4[25:0]),
  .in5(din5[25:0]),
  .in6(din6[25:0]),
  .in7(din7[25:0]),
.dout(dout[25:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_adrq_dp_mux_macro__mux_aonpe__ports_2__stack_38r__width_26 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [25:0] din0;
  input sel0;
  input [25:0] din1;
  input sel1;
  output [25:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(26)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[25:0]),
  .in1(din1[25:0]),
.dout(dout[25:0])
);









  



endmodule

