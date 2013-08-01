// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_l2rdmx_dp.v
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
module	mcu_l2rdmx_dp (
  bank0_l2wr_data, 
  bank1_l2wr_data, 
  l2_secc_err_dly1, 
  l2_mecc_err_dly1, 
  mcu_rddata, 
  mcu_rdecc, 
  mcu_l2t0_qword_id_r0, 
  mcu_l2t0_data_vld_r0, 
  mcu_l2t0_rd_req_id_r0, 
  mcu_l2t1_qword_id_r0, 
  mcu_l2t1_data_vld_r0, 
  mcu_l2t1_rd_req_id_r0, 
  l2b0_rd_rank_adr, 
  l2b0_rd_dimm_adr, 
  l2b0_rd_bank_adr, 
  l2b0_rd_ras_adr, 
  l2b0_rd_cas_adr, 
  l2b0_rd_addr_err, 
  l2b0_rd_addr_par, 
  l2b0_l2rd_req_id, 
  l2b0_wr_rank_adr, 
  l2b0_wr_dimm_adr, 
  l2b0_wr_bank_adr, 
  l2b0_wr_ras_adr, 
  l2b0_wr_cas_adr, 
  l2b0_wr_addr_err, 
  l2b0_wr_addr_par, 
  l2b1_rd_rank_adr, 
  l2b1_rd_dimm_adr, 
  l2b1_rd_bank_adr, 
  l2b1_rd_ras_adr, 
  l2b1_rd_cas_adr, 
  l2b1_rd_addr_err, 
  l2b1_rd_addr_par, 
  l2b1_l2rd_req_id, 
  l2b1_wr_rank_adr, 
  l2b1_wr_dimm_adr, 
  l2b1_wr_bank_adr, 
  l2b1_wr_ras_adr, 
  l2b1_wr_cas_adr, 
  l2b1_wr_addr_err, 
  l2b1_wr_addr_par, 
  mbist_run_d1, 
  mbist_run_d1_l, 
  mbist_wdata, 
  l2b0_mcu_wr_data_r5, 
  l2b1_mcu_wr_data_r5, 
  rddata_sel, 
  pa_err, 
  dr_secc_err, 
  dr_mecc_err, 
  rddata, 
  rdpctl_l2t0_data_valid, 
  rdpctl_l2t1_data_valid, 
  rdpctl_qword_id, 
  rdpctl_rd_req_id, 
  l2if0_rd_rank_adr, 
  l2if0_rd_dimm_adr, 
  l2if0_rd_bank_adr, 
  l2if0_rd_ras_adr, 
  l2if0_rd_cas_adr, 
  l2if0_rd_addr_err, 
  l2if0_rd_addr_parity, 
  l2if0_rd_req_id, 
  l2if0_wr_rank_adr, 
  l2if0_wr_dimm_adr, 
  l2if0_wr_bank_adr, 
  l2if0_wr_ras_adr, 
  l2if0_wr_cas_adr, 
  l2if0_wr_addr_err, 
  l2if0_wr_addr_parity, 
  l2if1_rd_rank_adr, 
  l2if1_rd_dimm_adr, 
  l2if1_rd_bank_adr, 
  l2if1_rd_ras_adr, 
  l2if1_rd_cas_adr, 
  l2if1_rd_addr_err, 
  l2if1_rd_addr_parity, 
  l2if1_rd_req_id, 
  l2if1_wr_rank_adr, 
  l2if1_wr_dimm_adr, 
  l2if1_wr_bank_adr, 
  l2if1_wr_ras_adr, 
  l2if1_wr_cas_adr, 
  l2if1_wr_addr_err, 
  l2if1_wr_addr_parity, 
  l2clk, 
  ddr_cmp_sync_en, 
  cmp_ddr_sync_en, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire u_bank0_l2wr_data_scanin;
wire u_bank0_l2wr_data_scanout;
wire [63:0] l2b0_mcu_wr_data_r6;
wire [7:0] mbist_wdata_d1;
wire u_bank1_l2wr_data_scanin;
wire u_bank1_l2wr_data_scanout;
wire [63:0] l2b1_mcu_wr_data_r6;
wire u_l2_rd_data_255_192_scanin;
wire u_l2_rd_data_255_192_scanout;
wire [255:0] l2_rddata;
wire [1:0] l2_secc_err;
wire u_l2_rd_data_191_128_scanin;
wire u_l2_rd_data_191_128_scanout;
wire [1:0] l2_mecc_err;
wire u_l2_rd_data_127_64_scanin;
wire u_l2_rd_data_127_64_scanout;
wire u_l2_rd_data_64_0_scanin;
wire u_l2_rd_data_64_0_scanout;
wire u_l2_rd_data_127_64_dly1_scanin;
wire u_l2_rd_data_127_64_dly1_scanout;
wire [127:0] l2_rddata_dly1;
wire u_l2_rd_data_64_0_dly1_scanin;
wire u_l2_rd_data_64_0_dly1_scanout;
wire u_l2_rd_data_127_64_dly2_scanin;
wire u_l2_rd_data_127_64_dly2_scanout;
wire [127:0] l2_rddata_dly2;
wire l2_secc_err_dly2;
wire u_l2_rd_data_64_0_dly2_scanin;
wire u_l2_rd_data_64_0_dly2_scanout;
wire l2_mecc_err_dly2;
wire [27:0] l2_ecc;
wire u_rddata_127_64_p3_scanin;
wire u_rddata_127_64_p3_scanout;
wire u_rddata_63_0_p3_scanin;
wire u_rddata_63_0_p3_scanout;
wire u_l2ecc_mbist_wdata_scanin;
wire u_l2ecc_mbist_wdata_scanout;
wire ddr_cmp_sync_en_d1;
wire ddr_cmp_sync_en_d01;
wire [24:0] spare;
wire ddr_cmp_sync_en_d2;
wire ddr_cmp_sync_en_d12;
wire u_l2t_cntl_scanin;
wire u_l2t_cntl_scanout;
wire l2rdmx_l2t0_data_valid;
wire l2rdmx_l2t1_data_valid;
wire l2rdmx_qword_id;
wire [2:0] l2rdmx_rd_req_id;
wire [13:0] spare_nand_unused;
wire u_l2if0_ras_cas_addr_scanin;
wire u_l2if0_ras_cas_addr_scanout;
wire u_l2if1_ras_cas_addr_scanin;
wire u_l2if1_ras_cas_addr_scanout;
wire u_l2if_bank_rank_addr_scanin;
wire u_l2if_bank_rank_addr_scanout;


output	[63:0]	bank0_l2wr_data;		// L2 bank0 write data to write data queue
output	[63:0]	bank1_l2wr_data;		// L2 bank0 write data to write data queue

output		l2_secc_err_dly1;		// single bit error detected in   l2clk domain
output		l2_mecc_err_dly1;		// multi bits error detected in   l2clk domain
output	[127:0]	mcu_rddata;			// memory read data to L2 
output	[27:0]	mcu_rdecc;			// memory read ECC data to L2 

output [1:0]  	mcu_l2t0_qword_id_r0;		// quad word id to l2 cache bank 0
output        	mcu_l2t0_data_vld_r0;		// data valid to l2 cache bank 0
output [2:0]  	mcu_l2t0_rd_req_id_r0;		// read request id to l2 cache bank 0
output [1:0]  	mcu_l2t1_qword_id_r0;		// quad word id to l2 cache bank 1
output        	mcu_l2t1_data_vld_r0;		// data valid to l2 cache bank 1
output [2:0]  	mcu_l2t1_rd_req_id_r0;		// read request id to l2 cache bank 1

output		l2b0_rd_rank_adr;
output 	[2:0]	l2b0_rd_dimm_adr;
output 	[2:0]	l2b0_rd_bank_adr;
output 	[14:0]	l2b0_rd_ras_adr;
output 	[10:0]	l2b0_rd_cas_adr;
output		l2b0_rd_addr_err;
output		l2b0_rd_addr_par;
output 	[2:0]	l2b0_l2rd_req_id;

output		l2b0_wr_rank_adr;
output 	[2:0]	l2b0_wr_dimm_adr;
output 	[2:0]	l2b0_wr_bank_adr;
output 	[14:0]	l2b0_wr_ras_adr;
output 	[10:0]	l2b0_wr_cas_adr;
output		l2b0_wr_addr_err;
output		l2b0_wr_addr_par;

output		l2b1_rd_rank_adr;
output 	[2:0]	l2b1_rd_dimm_adr;
output 	[2:0]	l2b1_rd_bank_adr;
output 	[14:0]	l2b1_rd_ras_adr;
output 	[10:0]	l2b1_rd_cas_adr;
output		l2b1_rd_addr_err;
output		l2b1_rd_addr_par;
output 	[2:0]	l2b1_l2rd_req_id;

output		l2b1_wr_rank_adr;
output 	[2:0]	l2b1_wr_dimm_adr;
output 	[2:0]	l2b1_wr_bank_adr;
output 	[14:0]	l2b1_wr_ras_adr;
output 	[10:0]	l2b1_wr_cas_adr;
output		l2b1_wr_addr_err;
output		l2b1_wr_addr_par;

input		mbist_run_d1;
input		mbist_run_d1_l;
input	[7:0]	mbist_wdata;
input	[63:0]	l2b0_mcu_wr_data_r5;		// L2 bank0 write data
input	[63:0]	l2b1_mcu_wr_data_r5;		// L2 bank1 write data

input	[1:0]	rddata_sel;			// dummy read data select
input		pa_err;				// physical address error

input	[1:0]	dr_secc_err;			// single bit error detected in drl2clk domain
input	[1:0]	dr_mecc_err;			// multi bits error detected in drl2clk domain
input	[255:0]	rddata;				// Read data from drl2clk domain

input		rdpctl_l2t0_data_valid;		// data valid for returning l2t0 read data
input		rdpctl_l2t1_data_valid;		// data valid for returning l2t1 read data
input 		rdpctl_qword_id;		// qword id for returning transaction
input [2:0]	rdpctl_rd_req_id;		// read request id for returning transaction

input		l2if0_rd_rank_adr;
input 	[2:0]	l2if0_rd_dimm_adr;
input 	[2:0]	l2if0_rd_bank_adr;
input 	[14:0]	l2if0_rd_ras_adr;
input 	[10:0]	l2if0_rd_cas_adr;
input		l2if0_rd_addr_err;
input		l2if0_rd_addr_parity;
input 	[2:0]	l2if0_rd_req_id;

input		l2if0_wr_rank_adr;
input 	[2:0]	l2if0_wr_dimm_adr;
input 	[2:0]	l2if0_wr_bank_adr;
input 	[14:0]	l2if0_wr_ras_adr;
input 	[10:0]	l2if0_wr_cas_adr;
input		l2if0_wr_addr_err;
input		l2if0_wr_addr_parity;

input		l2if1_rd_rank_adr;
input 	[2:0]	l2if1_rd_dimm_adr;
input 	[2:0]	l2if1_rd_bank_adr;
input 	[14:0]	l2if1_rd_ras_adr;
input 	[10:0]	l2if1_rd_cas_adr;
input		l2if1_rd_addr_err;
input		l2if1_rd_addr_parity;
input 	[2:0]	l2if1_rd_req_id;

input		l2if1_wr_rank_adr;
input 	[2:0]	l2if1_wr_dimm_adr;
input 	[2:0]	l2if1_wr_bank_adr;
input 	[14:0]	l2if1_wr_ras_adr;
input 	[10:0]	l2if1_wr_cas_adr;
input		l2if1_wr_addr_err;
input		l2if1_wr_addr_parity;

input		l2clk;
input		ddr_cmp_sync_en;
input		cmp_ddr_sync_en;

input 		scan_in;
output		scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// Write data from L2 bank0
mcu_l2rdmx_dp_msff_macro__stack_66c__width_64	u_bank0_l2wr_data        (
 		.scan_in(u_bank0_l2wr_data_scanin),
 		.scan_out(u_bank0_l2wr_data_scanout),
 		.clk 		( l2clk ),
		.en 		( 1'b1 ),
 		.din 		( l2b0_mcu_wr_data_r5[63:0] ),
 		.dout		( l2b0_mcu_wr_data_r6[63:0] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


mcu_l2rdmx_dp_mux_macro__mux_aonpe__ports_2__stack_66c__width_64	u_bank0_mbist_mux               (
 		.din0 		( l2b0_mcu_wr_data_r6[63:0] ),
 		.din1 		( {8{mbist_wdata_d1[7:0]}} ),
		.sel0		( mbist_run_d1_l ),
		.sel1		( mbist_run_d1 ),
 		.dout		( bank0_l2wr_data[63:0] ));


// Write data from L2 bank1
mcu_l2rdmx_dp_msff_macro__stack_66c__width_64	u_bank1_l2wr_data        (
 		.scan_in(u_bank1_l2wr_data_scanin),
 		.scan_out(u_bank1_l2wr_data_scanout),
 		.clk 		( l2clk ),
		.en 		( 1'b1 ),
 		.din 		( l2b1_mcu_wr_data_r5[63:0] ),
 		.dout		( l2b1_mcu_wr_data_r6[63:0] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_mux_macro__mux_aonpe__ports_2__stack_66c__width_64	u_bank1_mbist_mux               (
 		.din0 		( l2b1_mcu_wr_data_r6[63:0] ),
 		.din1 		( {8{mbist_wdata_d1[7:0]}} ),
		.sel0		( mbist_run_d1_l ),
		.sel1		( mbist_run_d1 ),
 		.dout		( bank1_l2wr_data[63:0] ));

////////////////////////////////////////////////////////////////////////////////
//
//		Cross_Clock_Domain: drl2clk -> l2clk
//
////////////////////////////////////////////////////////////////////////////////


mcu_l2rdmx_dp_msff_macro__stack_66c__width_65	u_l2_rd_data_255_192               ( 
		.scan_in(u_l2_rd_data_255_192_scanin),
		.scan_out(u_l2_rd_data_255_192_scanout),
		.clk	  ( l2clk ),
		.en	  ( ddr_cmp_sync_en ),
		.din	  ( {rddata[255:192],    dr_secc_err[1] } ),     
		.dout	  ( {l2_rddata[255:192], l2_secc_err[1]} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_msff_macro__stack_66c__width_65	u_l2_rd_data_191_128               ( 
		.scan_in(u_l2_rd_data_191_128_scanin),
		.scan_out(u_l2_rd_data_191_128_scanout),
		.clk	  ( l2clk ),
		.en	  ( ddr_cmp_sync_en ),
		.din	  ( {rddata[191:128],    dr_mecc_err[1] } ),     
		.dout	  ( {l2_rddata[191:128], l2_mecc_err[1]} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_msff_macro__stack_66c__width_65	u_l2_rd_data_127_64               ( 
		.scan_in(u_l2_rd_data_127_64_scanin),
		.scan_out(u_l2_rd_data_127_64_scanout),
		.clk	  ( l2clk ),
		.en	  ( ddr_cmp_sync_en ),
		.din	  ( {rddata[127:64],    dr_secc_err[0] } ),     
		.dout	  ( {l2_rddata[127:64], l2_secc_err[0]} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_msff_macro__stack_66c__width_65	u_l2_rd_data_64_0                ( 
		.scan_in(u_l2_rd_data_64_0_scanin),
		.scan_out(u_l2_rd_data_64_0_scanout),
		.clk	  ( l2clk ),
		.en	  ( ddr_cmp_sync_en ),
		.din	  ( { rddata[63:0],    	dr_mecc_err[0]} ),     
		.dout	  ( { l2_rddata[63:0],  l2_mecc_err[0]  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

//
//	Multiplex between two incoming data streams and 
//	delay memory read data to L2 for 2 l2clk cycles
//
mcu_l2rdmx_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_65	u_l2_rd_data_127_64_dly1                ( 
		.scan_in(u_l2_rd_data_127_64_dly1_scanin),
		.scan_out(u_l2_rd_data_127_64_dly1_scanout),
		.clk	  ( l2clk ),
		.en	  ( 1'b1 ),
		.din0	  ( { l2_rddata[127:64],     l2_secc_err[1] } ),     
		.din1	  ( { l2_rddata[255:192],    l2_secc_err[0] } ),     
		.sel0	  ( rddata_sel[0] ),
		.sel1	  ( rddata_sel[1] ),
		.dout	  ( { l2_rddata_dly1[127:64], l2_secc_err_dly1 } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_65	u_l2_rd_data_64_0_dly1	               ( 
		.scan_in(u_l2_rd_data_64_0_dly1_scanin),
		.scan_out(u_l2_rd_data_64_0_dly1_scanout),
		.clk	  ( l2clk ),
		.en	  ( 1'b1 ),
		.din0	  ( { l2_rddata[63:0],     l2_mecc_err[1]} ),     
		.din1	  ( { l2_rddata[191:128],  l2_mecc_err[0]} ),     
		.sel0	  ( rddata_sel[0] ),
		.sel1	  ( rddata_sel[1] ),
		.dout	  ( { l2_rddata_dly1[63:0], l2_mecc_err_dly1  } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

//
// Second memory read delay cycle
//
mcu_l2rdmx_dp_msff_macro__stack_66c__width_65	u_l2_rd_data_127_64_dly2	       (
		.scan_in(u_l2_rd_data_127_64_dly2_scanin),
		.scan_out(u_l2_rd_data_127_64_dly2_scanout),
		.clk	  ( l2clk ),
		.en	  ( 1'b1 ),
		.din	  ( { l2_rddata_dly1[127:64], l2_secc_err_dly1 } ),
		.dout	  ( { l2_rddata_dly2[127:64], l2_secc_err_dly2 } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_msff_macro__stack_66c__width_65	u_l2_rd_data_64_0_dly2		       (
		.scan_in(u_l2_rd_data_64_0_dly2_scanin),
		.scan_out(u_l2_rd_data_64_0_dly2_scanout),
		.clk	  ( l2clk ),
		.en	  ( 1'b1 ),
		.din	  ( { l2_rddata_dly1[63:0], l2_mecc_err_dly1 } ),
		.dout	  ( { l2_rddata_dly2[63:0], l2_mecc_err_dly2 } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

//
// Generate L2 parity. Flip 2 low order parity[1:0] incase of mecc_err
//
mcu_l2ecc_dp	u_l2ecc_6_0      	(
		.din	  ( l2_rddata_dly2[31:0] ),
		.mecc_err ( l2_mecc_err_dly2 ),
		.pa_err	  ( pa_err ),
		.parity	  ( l2_ecc[6:0] ));

mcu_l2ecc_dp	u_l2ecc_13_7 	(
		.din	  ( l2_rddata_dly2[63:32] ),
		.mecc_err ( l2_mecc_err_dly2 ),
		.pa_err	  ( pa_err ),
		.parity	  ( l2_ecc[13:7] ));

mcu_l2ecc_dp	u_l2ecc_20_14	(
		.din	  ( l2_rddata_dly2[95:64] ),
		.mecc_err ( l2_mecc_err_dly2 ),
		.pa_err	  ( pa_err ),
		.parity	  ( l2_ecc[20:14] ));

mcu_l2ecc_dp	u_l2ecc_27_21	(
		.din	  ( l2_rddata_dly2[127:96]),
		.mecc_err ( l2_mecc_err_dly2 ),
		.pa_err	  ( pa_err ),
		.parity	  ( l2_ecc[27:21]));

//
//	L2 read data registers
//
mcu_l2rdmx_dp_msff_macro__stack_66c__width_64	u_rddata_127_64_p3		       (
		.scan_in(u_rddata_127_64_p3_scanin),
		.scan_out(u_rddata_127_64_p3_scanout),
		.clk	  ( l2clk ),
		.en	  ( 1'b1 ),
		.din	  ( l2_rddata_dly2[127:64] ),
		.dout	  ( mcu_rddata[127:64] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_msff_macro__stack_66c__width_64	u_rddata_63_0_p3		       (
		.scan_in(u_rddata_63_0_p3_scanin),
		.scan_out(u_rddata_63_0_p3_scanout),
		.clk	  ( l2clk ),
		.en	  ( 1'b1 ),
		.din	  ( l2_rddata_dly2[63:0] ),
		.dout	  ( mcu_rddata[63:0] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_msff_macro__stack_66c__width_64	u_l2ecc_mbist_wdata         	       (
		.scan_in(u_l2ecc_mbist_wdata_scanin),
		.scan_out(u_l2ecc_mbist_wdata_scanout),
		.clk	  ( l2clk ),
		.en	  ( 1'b1 ),
		.din	  ( {25'h0,       l2_ecc[27:0],     mbist_wdata[7:0],    ddr_cmp_sync_en,    ddr_cmp_sync_en_d1, ddr_cmp_sync_en_d01} ),
		.dout	  ( {spare[24:0], mcu_rdecc[27:0],  mbist_wdata_d1[7:0], ddr_cmp_sync_en_d1, ddr_cmp_sync_en_d2, ddr_cmp_sync_en_d12} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

//
// Data valid, req ID and qword ID to l2t
//
mcu_l2rdmx_dp_msff_macro__stack_66c__width_6 u_l2t_cntl			       (
	.scan_in(u_l2t_cntl_scanin),
	.scan_out(u_l2t_cntl_scanout),
	.clk	( l2clk ),
	.en	( ddr_cmp_sync_en ),
	.din	( {rdpctl_l2t0_data_valid, rdpctl_l2t1_data_valid, rdpctl_qword_id, rdpctl_rd_req_id[2:0]} ),
	.dout	( {l2rdmx_l2t0_data_valid, l2rdmx_l2t1_data_valid, l2rdmx_qword_id, l2rdmx_rd_req_id[2:0]} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

//assign mcu_l2t0_rd_req_id_r0[2:0] = l2rdmx_rd_req_id[2:0];
//assign mcu_l2t1_rd_req_id_r0[2:0] = l2rdmx_rd_req_id[2:0];
//assign mcu_l2t0_qword_id_r0[1] = l2rdmx_qword_id;
//assign mcu_l2t1_qword_id_r0[1] = l2rdmx_qword_id;

mcu_l2rdmx_dp_buff_macro__width_6 u_req_id_buf  (
	.din ( {l2rdmx_rd_req_id[2:0],      l2rdmx_rd_req_id[2:0]} ),
	.dout( {mcu_l2t0_rd_req_id_r0[2:0], mcu_l2t1_rd_req_id_r0[2:0]} ));

mcu_l2rdmx_dp_buff_macro__width_2 u_qword_id_buf  (
	.din ( {l2rdmx_qword_id,         l2rdmx_qword_id} ),
	.dout( {mcu_l2t0_qword_id_r0[1], mcu_l2t1_qword_id_r0[1]} ));

mcu_l2rdmx_dp_and_macro__width_4 u_l2t_data_valid     (
	.din0( {l2rdmx_l2t0_data_valid,  l2rdmx_l2t0_data_valid, l2rdmx_l2t1_data_valid,  l2rdmx_l2t1_data_valid} ),
	.din1( {ddr_cmp_sync_en_d2,      ddr_cmp_sync_en_d12,    ddr_cmp_sync_en_d2,      ddr_cmp_sync_en_d12   } ),
	.dout( {mcu_l2t0_qword_id_r0[0], mcu_l2t0_data_vld_r0,   mcu_l2t1_qword_id_r0[0], mcu_l2t1_data_vld_r0  } ));

mcu_l2rdmx_dp_or_macro u_ddr_cmp_sync_en_d01 (
	.din0( ddr_cmp_sync_en     ),
	.din1( ddr_cmp_sync_en_d1  ),
	.dout( ddr_cmp_sync_en_d01 ));

mcu_l2rdmx_dp_nand_macro__width_14 spare_nand  (
	.din0( 14'h0 ),
	.din1( 14'h0 ),
	.dout( spare_nand_unused[13:0] ));

//
// address to addrdp
//
mcu_l2rdmx_dp_msff_macro__stack_66c__width_52 u_l2if0_ras_cas_addr		       (
	.scan_in(u_l2if0_ras_cas_addr_scanin),
	.scan_out(u_l2if0_ras_cas_addr_scanout),
	.clk	( l2clk ),
	.en	( cmp_ddr_sync_en ),
	.din	( {l2if0_rd_ras_adr[14:0], l2if0_rd_cas_adr[10:0], l2if0_wr_ras_adr[14:0], l2if0_wr_cas_adr[10:0]} ),
	.dout	( {l2b0_rd_ras_adr[14:0],  l2b0_rd_cas_adr[10:0],  l2b0_wr_ras_adr[14:0],  l2b0_wr_cas_adr[10:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_msff_macro__stack_66c__width_52 u_l2if1_ras_cas_addr        (
	.scan_in(u_l2if1_ras_cas_addr_scanin),
	.scan_out(u_l2if1_ras_cas_addr_scanout),
	.clk	( l2clk ),
	.en	( cmp_ddr_sync_en ),
	.din	( {l2if1_rd_ras_adr[14:0], l2if1_rd_cas_adr[10:0], l2if1_wr_ras_adr[14:0], l2if1_wr_cas_adr[10:0]} ),
	.dout	( {l2b1_rd_ras_adr[14:0],  l2b1_rd_cas_adr[10:0],  l2b1_wr_ras_adr[14:0],  l2b1_wr_cas_adr[10:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_l2rdmx_dp_msff_macro__stack_66c__width_42 u_l2if_bank_rank_addr        (
	.scan_in(u_l2if_bank_rank_addr_scanin),
	.scan_out(u_l2if_bank_rank_addr_scanout),
	.clk	( l2clk ),
	.en	( cmp_ddr_sync_en ),
	.din	( {l2if0_rd_rank_adr, l2if0_rd_dimm_adr[2:0], l2if0_rd_bank_adr[2:0], l2if0_rd_addr_parity, l2if0_rd_addr_err, l2if0_rd_req_id[2:0], 
		   l2if1_rd_rank_adr, l2if1_rd_dimm_adr[2:0], l2if1_rd_bank_adr[2:0], l2if1_rd_addr_parity, l2if1_rd_addr_err, l2if1_rd_req_id[2:0], 
		   l2if0_wr_rank_adr, l2if0_wr_dimm_adr[2:0], l2if0_wr_bank_adr[2:0], l2if0_wr_addr_parity, l2if0_wr_addr_err,
		   l2if1_wr_rank_adr, l2if1_wr_dimm_adr[2:0], l2if1_wr_bank_adr[2:0], l2if1_wr_addr_parity, l2if1_wr_addr_err} ),
	.dout	( {l2b0_rd_rank_adr,  l2b0_rd_dimm_adr[2:0],  l2b0_rd_bank_adr[2:0],  l2b0_rd_addr_par,     l2b0_rd_addr_err,  l2b0_l2rd_req_id[2:0], 
		   l2b1_rd_rank_adr,  l2b1_rd_dimm_adr[2:0],  l2b1_rd_bank_adr[2:0],  l2b1_rd_addr_par,     l2b1_rd_addr_err,  l2b1_l2rd_req_id[2:0], 
		   l2b0_wr_rank_adr,  l2b0_wr_dimm_adr[2:0],  l2b0_wr_bank_adr[2:0],  l2b0_wr_addr_par,     l2b0_wr_addr_err,
		   l2b1_wr_rank_adr,  l2b1_wr_dimm_adr[2:0],  l2b1_wr_bank_adr[2:0],  l2b1_wr_addr_par,     l2b1_wr_addr_err} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


// fixscan start:
assign u_bank0_l2wr_data_scanin  = scan_in                  ;
assign u_bank1_l2wr_data_scanin  = u_bank0_l2wr_data_scanout;
assign u_l2_rd_data_255_192_scanin = u_bank1_l2wr_data_scanout;
assign u_l2_rd_data_191_128_scanin = u_l2_rd_data_255_192_scanout;
assign u_l2_rd_data_127_64_scanin = u_l2_rd_data_191_128_scanout;
assign u_l2_rd_data_64_0_scanin  = u_l2_rd_data_127_64_scanout;
assign u_l2_rd_data_127_64_dly1_scanin = u_l2_rd_data_64_0_scanout;
assign u_l2_rd_data_64_0_dly1_scanin = u_l2_rd_data_127_64_dly1_scanout;
assign u_l2_rd_data_127_64_dly2_scanin = u_l2_rd_data_64_0_dly1_scanout;
assign u_l2_rd_data_64_0_dly2_scanin = u_l2_rd_data_127_64_dly2_scanout;
assign u_rddata_127_64_p3_scanin = u_l2_rd_data_64_0_dly2_scanout;
assign u_rddata_63_0_p3_scanin   = u_rddata_127_64_p3_scanout;
assign u_l2ecc_mbist_wdata_scanin = u_rddata_63_0_p3_scanout ;
assign u_l2t_cntl_scanin         = u_l2ecc_mbist_wdata_scanout;
assign u_l2if0_ras_cas_addr_scanin = u_l2t_cntl_scanout       ;
assign u_l2if1_ras_cas_addr_scanin = u_l2if0_ras_cas_addr_scanout;
assign u_l2if_bank_rank_addr_scanin = u_l2if1_ras_cas_addr_scanout;
assign scan_out                  = u_l2if_bank_rank_addr_scanout;
// fixscan end:
endmodule	//	mcu_readdp_dp;                                                                            







// any PARAMS parms go into naming of macro

module mcu_l2rdmx_dp_msff_macro__stack_66c__width_64 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_l2rdmx_dp_mux_macro__mux_aonpe__ports_2__stack_66c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  output [63:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mcu_l2rdmx_dp_msff_macro__stack_66c__width_65 (
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
wire [63:0] so;

  input [64:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


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
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mcu_l2rdmx_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_65 (
  din0, 
  sel0, 
  din1, 
  sel1, 
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
wire buffout0;
wire buffout1;
wire [64:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [63:0] so;

  input [64:0] din0;
  input sel0;
  input [64:0] din1;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


  output scan_out;




cl_dp1_muxbuff2_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(65)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
.dout(muxout[64:0])
);
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
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);


endmodule



//  
//   or macro for ports = 2,3
//
//





module mcu_l2rdmx_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_l2rdmx_dp_xor_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_l2rdmx_dp_xor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule









// any PARAMS parms go into naming of macro

module mcu_l2rdmx_dp_msff_macro__stack_66c__width_6 (
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
wire [4:0] so;

  input [5:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [5:0] dout;


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
dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);




















endmodule









//
//   buff macro
//
//





module mcu_l2rdmx_dp_buff_macro__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






buff #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);








endmodule





//
//   buff macro
//
//





module mcu_l2rdmx_dp_buff_macro__width_2 (
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
//   and macro for ports = 2,3,4
//
//





module mcu_l2rdmx_dp_and_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






and2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mcu_l2rdmx_dp_or_macro (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module mcu_l2rdmx_dp_nand_macro__width_14 (
  din0, 
  din1, 
  dout);
  input [13:0] din0;
  input [13:0] din1;
  output [13:0] dout;






nand2 #(14)  d0_0 (
.in0(din0[13:0]),
.in1(din1[13:0]),
.out(dout[13:0])
);









endmodule









// any PARAMS parms go into naming of macro

module mcu_l2rdmx_dp_msff_macro__stack_66c__width_52 (
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
wire [50:0] so;

  input [51:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [51:0] dout;


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
dff #(52)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[51:0]),
.si({scan_in,so[50:0]}),
.so({so[50:0],scan_out}),
.q(dout[51:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mcu_l2rdmx_dp_msff_macro__stack_66c__width_42 (
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
wire [40:0] so;

  input [41:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [41:0] dout;


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
dff #(42)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[41:0]),
.si({scan_in,so[40:0]}),
.so({so[40:0],scan_out}),
.q(dout[41:0])
);




















endmodule








