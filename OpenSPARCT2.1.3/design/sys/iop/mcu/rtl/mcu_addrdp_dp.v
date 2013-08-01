// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_addrdp_dp.v
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
module mcu_addrdp_dp (
  l2clk, 
  drl2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  drif_single_channel_mode, 
  l2b0_rd_ras_adr, 
  l2b0_rd_cas_adr, 
  l2b0_rd_rank_adr, 
  l2b0_rd_dimm_adr, 
  l2b0_rd_bank_adr, 
  l2b0_l2rd_req_id, 
  l2b0_wr_ras_adr, 
  l2b0_wr_cas_adr, 
  l2b0_wr_rank_adr, 
  l2b0_wr_dimm_adr, 
  l2b0_wr_bank_adr, 
  l2b1_rd_ras_adr, 
  l2b1_rd_cas_adr, 
  l2b1_rd_rank_adr, 
  l2b1_rd_dimm_adr, 
  l2b1_rd_bank_adr, 
  l2b1_l2rd_req_id, 
  l2b1_wr_ras_adr, 
  l2b1_wr_cas_adr, 
  l2b1_wr_rank_adr, 
  l2b1_wr_dimm_adr, 
  l2b1_wr_bank_adr, 
  l2b0_rd_adr_queue7_en, 
  l2b0_rd_adr_queue6_en, 
  l2b0_rd_adr_queue5_en, 
  l2b0_rd_adr_queue4_en, 
  l2b0_rd_adr_queue3_en, 
  l2b0_rd_adr_queue2_en, 
  l2b0_rd_adr_queue1_en, 
  l2b0_rd_adr_queue0_en, 
  l2b0_rd_adr_queue_sel, 
  l2b0_wr_adr_queue7_en, 
  l2b0_wr_adr_queue6_en, 
  l2b0_wr_adr_queue5_en, 
  l2b0_wr_adr_queue4_en, 
  l2b0_wr_adr_queue3_en, 
  l2b0_wr_adr_queue2_en, 
  l2b0_wr_adr_queue1_en, 
  l2b0_wr_adr_queue0_en, 
  l2b0_req_rdwr_addr_sel, 
  l2b0_rd_wr_adr7_eq, 
  l2b0_rd_wr_adr6_eq, 
  l2b0_rd_wr_adr5_eq, 
  l2b0_rd_wr_adr4_eq, 
  l2b0_rd_wr_adr3_eq, 
  l2b0_rd_wr_adr2_eq, 
  l2b0_rd_wr_adr1_eq, 
  l2b0_rd_wr_adr0_eq, 
  l2b1_rd_adr_queue7_en, 
  l2b1_rd_adr_queue6_en, 
  l2b1_rd_adr_queue5_en, 
  l2b1_rd_adr_queue4_en, 
  l2b1_rd_adr_queue3_en, 
  l2b1_rd_adr_queue2_en, 
  l2b1_rd_adr_queue1_en, 
  l2b1_rd_adr_queue0_en, 
  l2b1_rd_adr_queue_sel, 
  l2b1_wr_adr_queue7_en, 
  l2b1_wr_adr_queue6_en, 
  l2b1_wr_adr_queue5_en, 
  l2b1_wr_adr_queue4_en, 
  l2b1_wr_adr_queue3_en, 
  l2b1_wr_adr_queue2_en, 
  l2b1_wr_adr_queue1_en, 
  l2b1_wr_adr_queue0_en, 
  l2b1_req_rdwr_addr_sel, 
  l2b1_rd_wr_adr7_eq, 
  l2b1_rd_wr_adr6_eq, 
  l2b1_rd_wr_adr5_eq, 
  l2b1_rd_wr_adr4_eq, 
  l2b1_rd_wr_adr3_eq, 
  l2b1_rd_wr_adr2_eq, 
  l2b1_rd_wr_adr1_eq, 
  l2b1_rd_wr_adr0_eq, 
  rascas_adr_sel, 
  rascas_wr1_adr_sel, 
  rascas_wr2_adr_sel, 
  wr_adr_queue_sel, 
  wr1_adr_queue_sel, 
  wr2_adr_queue_sel, 
  ras_adr_queue, 
  cas_adr_queue, 
  rd_req_id_queue, 
  ras_wr1_adr_queue, 
  cas_wr1_adr_queue, 
  ras_wr2_adr_queue, 
  cas_wr2_adr_queue);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire drif_scm;
wire l2b0_adr_queue_scanin;
wire l2b0_adr_queue_scanout;
wire [14:0] l2b0_ras_adr_queue;
wire [10:0] l2b0_cas_adr_queue;
wire [2:0] l2b0_rd_req_id_queue;
wire [14:0] l2b0_ras_wr1_adr_queue;
wire [10:0] l2b0_cas_wr1_adr_queue;
wire [14:0] l2b0_ras_wr2_adr_queue;
wire [10:0] l2b0_cas_wr2_adr_queue;
wire l2b1_adr_queue_scanin;
wire l2b1_adr_queue_scanout;
wire [14:0] l2b1_ras_adr_queue;
wire [10:0] l2b1_cas_adr_queue;
wire [2:0] l2b1_rd_req_id_queue;
wire [14:0] l2b1_ras_wr1_adr_queue;
wire [10:0] l2b1_cas_wr1_adr_queue;
wire [14:0] l2b1_ras_wr2_adr_queue;
wire [10:0] l2b1_cas_wr2_adr_queue;


input		l2clk;
input		drl2clk;

input 		scan_in;
output		scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

input		drif_single_channel_mode;

//	 L2bank0
//	 Outputs in module: mcu_adrgen_dp
//
input	[14:0]	l2b0_rd_ras_adr;
input	[10:0]	l2b0_rd_cas_adr;
input		l2b0_rd_rank_adr;		// rank address
input	[2:0]	l2b0_rd_dimm_adr;		// rank address
input	[2:0]	l2b0_rd_bank_adr;		// bank address
input	[2:0]	l2b0_l2rd_req_id;		// request id

input	[14:0]	l2b0_wr_ras_adr;
input	[10:0]	l2b0_wr_cas_adr;
input		l2b0_wr_rank_adr;		// rank address
input	[2:0]	l2b0_wr_dimm_adr;		// rank address
input	[2:0]	l2b0_wr_bank_adr;		// bank address

//	 L2bank1
//	 Outputs in module: mcu_adrgen_dp
//
input	[14:0]	l2b1_rd_ras_adr;
input	[10:0]	l2b1_rd_cas_adr;
input		l2b1_rd_rank_adr;               // rank address
input	[2:0]	l2b1_rd_dimm_adr;		// rank address
input	[2:0]	l2b1_rd_bank_adr;               // bank address
input	[2:0]	l2b1_l2rd_req_id;		// request id

input	[14:0]	l2b1_wr_ras_adr;
input	[10:0]	l2b1_wr_cas_adr;
input		l2b1_wr_rank_adr;		// rank address
input	[2:0]	l2b1_wr_dimm_adr;		// rank address
input	[2:0]	l2b1_wr_bank_adr;		// bank address

//	 L2bank0
//	 Inputs in module: mcu_adrq_dp
//
input		l2b0_rd_adr_queue7_en;		// read address queue entry7 enable
input		l2b0_rd_adr_queue6_en;		// read address queue entry6 enable
input		l2b0_rd_adr_queue5_en;		// read address queue entry5 enable
input		l2b0_rd_adr_queue4_en;		// read address queue entry4 enable
input		l2b0_rd_adr_queue3_en;		// read address queue entry3 enable
input		l2b0_rd_adr_queue2_en;		// read address queue entry2 enable
input		l2b0_rd_adr_queue1_en;		// read address queue entry1 enable
input		l2b0_rd_adr_queue0_en;		// read address queue entry0 enable
input	[7:0]	l2b0_rd_adr_queue_sel;		// read address queue select
input		l2b0_wr_adr_queue7_en;		// write address queue entry7 enable
input		l2b0_wr_adr_queue6_en;          // write address queue entry6 enable
input		l2b0_wr_adr_queue5_en;          // write address queue entry5 enable
input		l2b0_wr_adr_queue4_en;          // write address queue entry4 enable
input		l2b0_wr_adr_queue3_en;          // write address queue entry3 enable
input		l2b0_wr_adr_queue2_en;          // write address queue entry2 enable
input		l2b0_wr_adr_queue1_en;          // write address queue entry1 enable
input		l2b0_wr_adr_queue0_en;          // write address queue entry0 enable
input	[1:0]	l2b0_req_rdwr_addr_sel;		// read or write address queue select

//	 L2bank0
//	 Outputs in module: mcu_adrq_dp
//
//	output		l2b0_scan_out;
output		l2b0_rd_wr_adr7_eq;
output		l2b0_rd_wr_adr6_eq;
output		l2b0_rd_wr_adr5_eq;
output		l2b0_rd_wr_adr4_eq;
output		l2b0_rd_wr_adr3_eq;
output		l2b0_rd_wr_adr2_eq;
output		l2b0_rd_wr_adr1_eq;
output		l2b0_rd_wr_adr0_eq;


//	 L2bank1
//	 Inputs in module: mcu_adrq_dp
//
input		l2b1_rd_adr_queue7_en;          // read address queue entry7 enable    
input		l2b1_rd_adr_queue6_en;          // read address queue entry6 enable    
input		l2b1_rd_adr_queue5_en;          // read address queue entry5 enable    
input		l2b1_rd_adr_queue4_en;          // read address queue entry4 enable    
input		l2b1_rd_adr_queue3_en;          // read address queue entry3 enable    
input		l2b1_rd_adr_queue2_en;          // read address queue entry2 enable    
input		l2b1_rd_adr_queue1_en;          // read address queue entry1 enable    
input		l2b1_rd_adr_queue0_en;          // read address queue entry0 enable    
input	[7:0]	l2b1_rd_adr_queue_sel;          // read address queue select           
input		l2b1_wr_adr_queue7_en;          // write address queue entry7 enable   
input		l2b1_wr_adr_queue6_en;          // write address queue entry6 enable   
input		l2b1_wr_adr_queue5_en;          // write address queue entry5 enable   
input		l2b1_wr_adr_queue4_en;          // write address queue entry4 enable   
input		l2b1_wr_adr_queue3_en;          // write address queue entry3 enable   
input		l2b1_wr_adr_queue2_en;          // write address queue entry2 enable   
input		l2b1_wr_adr_queue1_en;          // write address queue entry1 enable   
input		l2b1_wr_adr_queue0_en;          // write address queue entry0 enable   
input	[1:0]	l2b1_req_rdwr_addr_sel;         // read or write address queue select 
                                                                                        
//	 L2 bank1                                                                       
//	 Outputs in module: mcu_adrq_dp                                             
//                                                                                      
output		l2b1_rd_wr_adr7_eq;
output		l2b1_rd_wr_adr6_eq;
output		l2b1_rd_wr_adr5_eq;
output		l2b1_rd_wr_adr4_eq;
output		l2b1_rd_wr_adr3_eq;
output		l2b1_rd_wr_adr2_eq;
output		l2b1_rd_wr_adr1_eq;
output		l2b1_rd_wr_adr0_eq;

input	[1:0]	rascas_adr_sel;			// [0]: L2b0 address queue sel, [1]: L2b1 address queue sel, [2]: scrub address select 
input	[1:0]	rascas_wr1_adr_sel;
input	[1:0]	rascas_wr2_adr_sel;
input	[7:0]	wr_adr_queue_sel;          	// write address queue select          
input	[7:0]	wr1_adr_queue_sel;         	// write address queue select          
input	[7:0]	wr2_adr_queue_sel;         	// write address queue select          

output	[14:0]	ras_adr_queue;             	// RAS address                         
output	[10:0]	cas_adr_queue;             	// CAS address                         
output	[2:0]	rd_req_id_queue;           	// read request ID                          
output	[14:0]	ras_wr1_adr_queue;             	// RAS address                         
output	[10:0]	cas_wr1_adr_queue;             	// CAS address                         
output	[14:0]	ras_wr2_adr_queue;             	// RAS address                         
output	[10:0]	cas_wr2_adr_queue;             	// CAS address                         

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

assign drif_scm = drif_single_channel_mode;

//
//	L2Bank0: mcu_adr_queue
//
mcu_adrq_dp l2b0_adr_queue (
		.scan_in(l2b0_adr_queue_scanin),
		.scan_out(l2b0_adr_queue_scanout),
		.l2clk                ( l2clk ),
		.drl2clk              ( drl2clk ),
		.rd_rank_adr          ( {l2b0_rd_rank_adr, l2b0_rd_dimm_adr[2:0]} ),
		.rd_bank_adr          ( l2b0_rd_bank_adr[2:0] ),
		.rd_ras_adr           ( l2b0_rd_ras_adr[14:0] ),
		.rd_cas_adr           ( l2b0_rd_cas_adr[10:0] ),
		.l2rd_req_id          ( l2b0_l2rd_req_id[2:0] ),
		.wr_rank_adr          ( {l2b0_wr_rank_adr, l2b0_wr_dimm_adr[2:0]} ),
		.wr_bank_adr          ( l2b0_wr_bank_adr[2:0] ),
		.wr_ras_adr           ( l2b0_wr_ras_adr[14:0] ),
		.wr_cas_adr           ( l2b0_wr_cas_adr[10:0] ),
		.rd_adr_queue7_en     ( l2b0_rd_adr_queue7_en ),
		.rd_adr_queue6_en     ( l2b0_rd_adr_queue6_en ),
		.rd_adr_queue5_en     ( l2b0_rd_adr_queue5_en ),
		.rd_adr_queue4_en     ( l2b0_rd_adr_queue4_en ),
		.rd_adr_queue3_en     ( l2b0_rd_adr_queue3_en ),
		.rd_adr_queue2_en     ( l2b0_rd_adr_queue2_en ),
		.rd_adr_queue1_en     ( l2b0_rd_adr_queue1_en ),
		.rd_adr_queue0_en     ( l2b0_rd_adr_queue0_en ),
		.rd_adr_queue_sel     ( l2b0_rd_adr_queue_sel[7:0] ),
		.wr_adr_queue7_en     ( l2b0_wr_adr_queue7_en ),
		.wr_adr_queue6_en     ( l2b0_wr_adr_queue6_en ),
		.wr_adr_queue5_en     ( l2b0_wr_adr_queue5_en ),
		.wr_adr_queue4_en     ( l2b0_wr_adr_queue4_en ),
		.wr_adr_queue3_en     ( l2b0_wr_adr_queue3_en ),
		.wr_adr_queue2_en     ( l2b0_wr_adr_queue2_en ),
		.wr_adr_queue1_en     ( l2b0_wr_adr_queue1_en ),
		.wr_adr_queue0_en     ( l2b0_wr_adr_queue0_en ),
		.req_rdwr_addr_sel    ( l2b0_req_rdwr_addr_sel[1:0] ),
		.ras_adr_queue        ( l2b0_ras_adr_queue[14:0] ),
		.cas_adr_queue        ( l2b0_cas_adr_queue[10:0] ),
		.rd_req_id_queue      ( l2b0_rd_req_id_queue[2:0] ),
		.ras_wr1_adr_queue    ( l2b0_ras_wr1_adr_queue[14:0] ),
		.cas_wr1_adr_queue    ( l2b0_cas_wr1_adr_queue[10:0] ),
		.ras_wr2_adr_queue    ( l2b0_ras_wr2_adr_queue[14:0] ),
		.cas_wr2_adr_queue    ( l2b0_cas_wr2_adr_queue[10:0] ),
		.rd_wr_adr7_eq        ( l2b0_rd_wr_adr7_eq ),
		.rd_wr_adr6_eq        ( l2b0_rd_wr_adr6_eq ),
		.rd_wr_adr5_eq        ( l2b0_rd_wr_adr5_eq ),
		.rd_wr_adr4_eq        ( l2b0_rd_wr_adr4_eq ),
		.rd_wr_adr3_eq        ( l2b0_rd_wr_adr3_eq ),
		.rd_wr_adr2_eq        ( l2b0_rd_wr_adr2_eq ),
		.rd_wr_adr1_eq        ( l2b0_rd_wr_adr1_eq ),
		.rd_wr_adr0_eq        ( l2b0_rd_wr_adr0_eq ),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .drif_scm(drif_scm),
  .wr_adr_queue_sel(wr_adr_queue_sel[7:0]),
  .wr1_adr_queue_sel(wr1_adr_queue_sel[7:0]),
  .wr2_adr_queue_sel(wr2_adr_queue_sel[7:0]) 
		);

//
//	L2bank1: mcu_adr_queue
//
mcu_adrq_dp l2b1_adr_queue (
		.scan_in(l2b1_adr_queue_scanin),
		.scan_out(l2b1_adr_queue_scanout),
		.l2clk                ( l2clk ),
		.drl2clk              ( drl2clk ),
		.rd_rank_adr          ( {l2b1_rd_rank_adr, l2b1_rd_dimm_adr[2:0]} ),
		.rd_bank_adr          ( l2b1_rd_bank_adr[2:0] ),
		.rd_ras_adr           ( l2b1_rd_ras_adr[14:0] ),
		.rd_cas_adr           ( l2b1_rd_cas_adr[10:0] ),
		.l2rd_req_id          ( l2b1_l2rd_req_id[2:0] ),
		.wr_rank_adr          ( {l2b1_wr_rank_adr, l2b1_wr_dimm_adr[2:0]} ),
		.wr_bank_adr          ( l2b1_wr_bank_adr[2:0] ),
		.wr_ras_adr           ( l2b1_wr_ras_adr[14:0] ),
		.wr_cas_adr           ( l2b1_wr_cas_adr[10:0] ),
		.rd_adr_queue7_en     ( l2b1_rd_adr_queue7_en ),
		.rd_adr_queue6_en     ( l2b1_rd_adr_queue6_en ),
		.rd_adr_queue5_en     ( l2b1_rd_adr_queue5_en ),
		.rd_adr_queue4_en     ( l2b1_rd_adr_queue4_en ),
		.rd_adr_queue3_en     ( l2b1_rd_adr_queue3_en ),
		.rd_adr_queue2_en     ( l2b1_rd_adr_queue2_en ),
		.rd_adr_queue1_en     ( l2b1_rd_adr_queue1_en ),
		.rd_adr_queue0_en     ( l2b1_rd_adr_queue0_en ),
		.rd_adr_queue_sel     ( l2b1_rd_adr_queue_sel[7:0] ),
		.wr_adr_queue7_en     ( l2b1_wr_adr_queue7_en ),
		.wr_adr_queue6_en     ( l2b1_wr_adr_queue6_en ),
		.wr_adr_queue5_en     ( l2b1_wr_adr_queue5_en ),
		.wr_adr_queue4_en     ( l2b1_wr_adr_queue4_en ),
		.wr_adr_queue3_en     ( l2b1_wr_adr_queue3_en ),
		.wr_adr_queue2_en     ( l2b1_wr_adr_queue2_en ),
		.wr_adr_queue1_en     ( l2b1_wr_adr_queue1_en ),
		.wr_adr_queue0_en     ( l2b1_wr_adr_queue0_en ),
		.req_rdwr_addr_sel    ( l2b1_req_rdwr_addr_sel[1:0] ),
		.ras_adr_queue        ( l2b1_ras_adr_queue[14:0] ),
		.cas_adr_queue        ( l2b1_cas_adr_queue[10:0] ),
		.rd_req_id_queue      ( l2b1_rd_req_id_queue[2:0] ),
		.ras_wr1_adr_queue    ( l2b1_ras_wr1_adr_queue[14:0] ),
		.cas_wr1_adr_queue    ( l2b1_cas_wr1_adr_queue[10:0] ),
		.ras_wr2_adr_queue    ( l2b1_ras_wr2_adr_queue[14:0] ),
		.cas_wr2_adr_queue    ( l2b1_cas_wr2_adr_queue[10:0] ),
		.rd_wr_adr7_eq        ( l2b1_rd_wr_adr7_eq ),
		.rd_wr_adr6_eq        ( l2b1_rd_wr_adr6_eq ),
		.rd_wr_adr5_eq        ( l2b1_rd_wr_adr5_eq ),
		.rd_wr_adr4_eq        ( l2b1_rd_wr_adr4_eq ),
		.rd_wr_adr3_eq        ( l2b1_rd_wr_adr3_eq ),
		.rd_wr_adr2_eq        ( l2b1_rd_wr_adr2_eq ),
		.rd_wr_adr1_eq        ( l2b1_rd_wr_adr1_eq ),
		.rd_wr_adr0_eq        ( l2b1_rd_wr_adr0_eq ),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .drif_scm(drif_scm),
  .wr_adr_queue_sel(wr_adr_queue_sel[7:0]),
  .wr1_adr_queue_sel(wr1_adr_queue_sel[7:0]),
  .wr2_adr_queue_sel(wr2_adr_queue_sel[7:0]) 
		);

mcu_addrdp_dp_mux_macro__mux_aonpe__ports_2__stack_38r__width_29	u_l2b0b1_addr_id	               (
		.din0	( { l2b0_rd_req_id_queue[2:0], l2b0_ras_adr_queue[14:0], l2b0_cas_adr_queue[10:0] } ),
		.din1	( { l2b1_rd_req_id_queue[2:0], l2b1_ras_adr_queue[14:0], l2b1_cas_adr_queue[10:0] } ),
		.sel0 	( rascas_adr_sel[0] ),
		.sel1 	( rascas_adr_sel[1] ),
		.dout	( { rd_req_id_queue[2:0], ras_adr_queue[14:0], cas_adr_queue[10:0] } ));

mcu_addrdp_dp_mux_macro__mux_aonpe__ports_2__stack_38r__width_26	u_l2b0b1_wr1_addr 	               (
		.din0	( { l2b0_ras_wr1_adr_queue[14:0], l2b0_cas_wr1_adr_queue[10:0] } ),
		.din1	( { l2b1_ras_wr1_adr_queue[14:0], l2b1_cas_wr1_adr_queue[10:0] } ),
		.sel0 	( rascas_wr1_adr_sel[0] ),
		.sel1 	( rascas_wr1_adr_sel[1] ),
		.dout	( { ras_wr1_adr_queue[14:0], cas_wr1_adr_queue[10:0] } ));

mcu_addrdp_dp_mux_macro__mux_aonpe__ports_2__stack_38r__width_26	u_l2b0b1_wr2_addr 	               (
		.din0	( { l2b0_ras_wr2_adr_queue[14:0], l2b0_cas_wr2_adr_queue[10:0] } ),
		.din1	( { l2b1_ras_wr2_adr_queue[14:0], l2b1_cas_wr2_adr_queue[10:0] } ),
		.sel0 	( rascas_wr2_adr_sel[0] ),
		.sel1 	( rascas_wr2_adr_sel[1] ),
		.dout	( { ras_wr2_adr_queue[14:0], cas_wr2_adr_queue[10:0] } ));

// fixscan start:
assign l2b0_adr_queue_scanin     = scan_in                  ;
assign l2b1_adr_queue_scanin     = l2b0_adr_queue_scanout   ;
assign scan_out                  = l2b1_adr_queue_scanout   ;
// fixscan end:
endmodule	



// any PARAMS parms go into naming of macro

module mcu_addrdp_dp_msff_macro__stack_38r__width_36 (
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

module mcu_addrdp_dp_msff_macro__stack_38r__width_34 (
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

module mcu_addrdp_dp_mux_macro__mux_aonpe__ports_8__stack_38r__width_36 (
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





module mcu_addrdp_dp_inv_macro (
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





module mcu_addrdp_dp_and_macro (
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

module mcu_addrdp_dp_msff_macro__stack_38r__width_33 (
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





module mcu_addrdp_dp_cmp_macro__width_32 (
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

module mcu_addrdp_dp_mux_macro__mux_aonpe__ports_8__stack_38r__width_26 (
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

module mcu_addrdp_dp_mux_macro__mux_aonpe__ports_2__stack_38r__width_26 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_addrdp_dp_mux_macro__mux_aonpe__ports_2__stack_38r__width_29 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [28:0] din0;
  input sel0;
  input [28:0] din1;
  input sel1;
  output [28:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(29)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[28:0]),
  .in1(din1[28:0]),
.dout(dout[28:0])
);









  



endmodule

