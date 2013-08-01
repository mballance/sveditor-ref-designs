// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : niu_pio.v
 * Author Name  : John Lo
 * Description  : It contains niu pio interface, interrupt controller,
 *                UCB for N2. 
 * Parent Module: niu
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/08/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification : 4/19/04 : added reset_
 *                8/25/04 : added pio_peu_32b, pio_peu_afull, pio_ht_32b.
 *                          changed niu_reset_ to niu_reset_l.
 *                          changed reset_ to reset_l.
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/
`include "niu_pio.h"

module niu_pio (
`ifdef NEPTUNE
// peu interface signals
// ------------------------
peu_pio_32b,
pio_peu_32b,
pio_peu_afull,
pio_clients_32b,
int_invld,
// prom pio signals		
pio_prom_sel,
prom_pio_ack,
prom_pio_rdata,
prom_pio_err,
// pim pio signals		
pio_pim_sel,
pim_pio_ack,
pim_pio_rdata,
pim_pio_err,
pim_pio_intr,
// per port mac reset
mac_reset2,
mac_reset3,
mac_pio_intr2,
mac_pio_intr3,
// pio gpio signals
pio_gpio_data_out,
pio_gpio_en_out,
gpio_pio_data_in,
`else
// smx Interface
pio_smx_cfg_data,
smx_pio_intr,
smx_pio_status,
pio_smx_clear_intr,
pio_smx_ctrl,
pio_smx_debug_vector,
// DFT Interface
`endif
// global signals
niu_reset_l,
niu_clk,
reset,
// pio broadcast signals
pio_clients_addr,
pio_clients_rd,
pio_clients_wdata,
// designated pio signals
// mac pio signals
pio_mac_sel,
mac_pio_ack,
mac_pio_rdata,
mac_pio_err,
mac_pio_intr0,
mac_pio_intr1,
mif_pio_intr,
// ipp pio signals
pio_ipp_sel,
ipp_pio_ack,
ipp_pio_rdata,
ipp_pio_err,
ipp_pio_intr,
// fflp pio signals
pio_fflp_sel,
fflp_pio_ack,
fflp_pio_rdata,
fflp_pio_err,
fflp_pio_intr,
// zcp pio signals
pio_zcp_sel,
zcp_pio_ack,
zcp_pio_rdata,
zcp_pio_err,
zcp_pio_intr,
// dmc pio signals
pio_tdmc_sel,
tdmc_pio_ack,
tdmc_pio_rdata,
tdmc_pio_err,
pio_rdmc_sel,
rdmc_pio_ack,
rdmc_pio_rdata,
rdmc_pio_err,
rdmc_pio_port_int,
dmc_pio_intri, // level
dmc_pio_intrj, // level
// txc pio signals
pio_txc_sel,
txc_pio_ack,
txc_pio_rdata,
txc_pio_err,
txc_pio_intr,
// pio ucb signals
// read cycle
rd_req_vld,
addr_in,
thr_id_in,
buf_id_in,
req_accepted,
rack_busy,
rd_ack_vld,
rd_nack_vld,
data_out,
thr_id_out,
buf_id_out,
// write cycle
wr_req_vld,
data_in,
// interrupt intf
int_busy,
int_vld,
dev_id,
// Debug Port
pio_debug_port,
// per port mac reset
mac_reset0,
mac_reset1,
// pio meta arb signals
pio_arb_ctrl,
pio_arb_debug_vector,
arb_pio_all_npwdirty,
arb_pio_all_rddirty,
pio_arb_dirtid_enable,
pio_arb_dirtid_clr,
pio_arb_np_threshold,
pio_arb_rd_threshold,
arb_pio_dirtid_rdstatus,
arb_pio_dirtid_npwstatus
);


`ifdef NEPTUNE
                        // peu interface signals
                        // ------------------------
   input 		peu_pio_32b;
   output 		pio_peu_32b;
   output 		pio_peu_afull;
   output 		pio_clients_32b;
   output 		int_invld;
                        // prom pio signals
   output 		pio_prom_sel;
   input 		prom_pio_ack;
   input [63:0] 	prom_pio_rdata;
   input 		prom_pio_err;
                        // pim pio signals
   output 		pio_pim_sel;
   input 		pim_pio_ack;
   input [63:0] 	pim_pio_rdata;
   input 		pim_pio_err;
   input 		pim_pio_intr;
                        // per port mac reset
   output 		mac_reset2;
   output 		mac_reset3;
                        // pio gpio signals
   output [15:0]        pio_gpio_data_out;
   output [15:0]        pio_gpio_en_out;
   input  [15:0]        gpio_pio_data_in;

   input 		mac_pio_intr2;
   input 		mac_pio_intr3;
`else
   output [31:0]        pio_smx_cfg_data ; 
   input                smx_pio_intr ;
   input  [31:0]        smx_pio_status ;
   output               pio_smx_clear_intr ;
   output [31:0]        pio_smx_ctrl ;
   output [31:0]        pio_smx_debug_vector ;
`endif // ifdef NEPTUNE
       // global signals
   input 		niu_reset_l;
   input 		niu_clk;
   output 		reset;
                        // pio broadcast signals
   output [19:0] 	pio_clients_addr;
   output 		pio_clients_rd;
   output [63:0] 	pio_clients_wdata;
                        // designated pio signals
                        // mac pio signals
   output 		pio_mac_sel;
   input 		mac_pio_ack;
   input [63:0] 	mac_pio_rdata;
   input 		mac_pio_err;
   input 		mac_pio_intr0;
   input 		mac_pio_intr1;
   input 		mif_pio_intr;
                        // ipp pio signals
   output 		pio_ipp_sel;
   input 		ipp_pio_ack;
   input [63:0] 	ipp_pio_rdata;
   input 		ipp_pio_err;
   input 		ipp_pio_intr;
                        // fflp pio signals
   output 		pio_fflp_sel;
   input 		fflp_pio_ack;
   input [63:0] 	fflp_pio_rdata;
   input 		fflp_pio_err;
   input 		fflp_pio_intr;
                        // zcp pio signals
   output 		pio_zcp_sel;
   input 		zcp_pio_ack;
   input [63:0] 	zcp_pio_rdata;
   input 		zcp_pio_err;
   input 		zcp_pio_intr;
                        // tdmc pio signals
   output 		pio_tdmc_sel;
   input 		tdmc_pio_ack;
   input [63:0] 	tdmc_pio_rdata;
   input 		tdmc_pio_err;
                        // rdmc pio signals
   output 		pio_rdmc_sel;
   input 		rdmc_pio_ack;
   input [63:0] 	rdmc_pio_rdata;
   input 		rdmc_pio_err;
   input 		rdmc_pio_port_int;
                        // dmc interrupt signals
   input [63:0]		dmc_pio_intri; // level
   input [63:0]		dmc_pio_intrj; // level
                        // txc pio signals
   output 		pio_txc_sel;
   input 		txc_pio_ack;
   input [63:0] 	txc_pio_rdata;
   input 		txc_pio_err;
   input 		txc_pio_intr;
                        // pio-ucb interface signals
                        // ------------------------
                        // read cycle
   input 		rd_req_vld;
   input [`PIO_ADDR_R] 	addr_in;
   input [5:0] 		thr_id_in;
   input [1:0] 		buf_id_in;
   output 		req_accepted;
   input 		rack_busy;
   output 		rd_ack_vld;
   output 		rd_nack_vld;
   output [63:0] 	data_out;
   output [5:0] 	thr_id_out;
   output [1:0] 	buf_id_out;
                        // write cycle
   input 		wr_req_vld;
   input [63:0] 	data_in;
                        // interrupt intf
   input 		int_busy;
   output 		int_vld;
   output [6:0] 	dev_id;
                        // per port mac reset
   output 		mac_reset0;
   output 		mac_reset1;
   
                        // PIO Debug Port
   output [31:0]        pio_debug_port;
            
                        // Meta Arb Ports
   output               pio_arb_dirtid_enable;
   output               pio_arb_dirtid_clr;
   output [5:0]         pio_arb_np_threshold;
   output [5:0]         pio_arb_rd_threshold;
   input  [5:0]         arb_pio_dirtid_rdstatus;
   input  [5:0]         arb_pio_dirtid_npwstatus;
   input                arb_pio_all_npwdirty;
   input                arb_pio_all_rddirty;
   output [31:0]        pio_arb_ctrl;
   output [31:0]        pio_arb_debug_vector;

// Register and Wire Declaration
// -----------------------------

   reg 			pio_ack;
   reg [63:0] 		pio_rdata;
   reg 			pio_err;

   wire                 meta_intr1;
   wire                 meta_intr2;
   wire                 smx_meta_intr_hld;

   wire [31:0]          pio_debug_port;

   wire 		reset;
   wire [19:0] 		pio_clients_addr;
   wire [63:0] 		pio_clients_wdata;
   wire [1:0] 		pio_clients_buf_id;
   wire   		pio_clients_rd;
   wire [19:0]	        clients_addr;
   wire [`PIO_ADDR_R]	addr;
   wire [63:0] 		wdata;
   wire [1:0] 		buf_id;
   wire [5:0] 		thr_id;
   wire 		rd;
   wire 		mac_pio_ack;
   wire [63:0] 		mac_pio_rdata;
   wire 		mac_pio_err;
   wire 		ipp_pio_ack;
   wire [63:0] 		ipp_pio_rdata;
   wire 		ipp_pio_err;
   wire 		fflp_pio_ack;
   wire [63:0] 		fflp_pio_rdata;
   wire 		fflp_pio_err;
   wire 		zcp_pio_ack;
   wire [63:0] 		zcp_pio_rdata;
   wire 		zcp_pio_err;
   wire 		dmc_pio_ack;
   wire [63:0] 		dmc_pio_rdata;
   wire 		dmc_pio_err;
   wire 		txc_pio_ack;
   wire [63:0] 		txc_pio_rdata;
   wire 		txc_pio_err;
   wire 		mac_pio_ack_reg;
   wire [63:0] 		mac_pio_rdata_reg;
   wire 		mac_pio_err_reg;
   wire 		ipp_pio_ack_reg;
   wire [63:0] 		ipp_pio_rdata_reg;
   wire 		ipp_pio_err_reg;
   wire 		fflp_pio_ack_reg;
   wire [63:0] 		fflp_pio_rdata_reg;
   wire 		fflp_pio_err_reg;
   wire 		zcp_pio_ack_reg;
   wire [63:0] 		zcp_pio_rdata_reg;
   wire 		zcp_pio_err_reg;
   wire 		dmc_pio_ack_reg;
   wire [63:0] 		dmc_pio_rdata_reg;
   wire 		dmc_pio_err_reg;
   wire 		txc_pio_ack_reg;
   wire [63:0] 		txc_pio_rdata_reg;
   wire 		txc_pio_err_reg;

   wire 		prom_pio_ack_reg;
   wire [63:0] 		prom_pio_rdata_reg;
   wire 		prom_pio_err_reg;

   wire 		pim_pio_ack_reg;
   wire [63:0] 		pim_pio_rdata_reg;
   wire 		pim_pio_err_reg;

   wire 		ucb_ack;
   wire 		ucb_nack;
   wire 		ucb_rack;
   wire [2:0] 		pio_rw_state;
   wire 		ucb_rd_req;
   wire [`PIO_ADDR_R]   ucb_addr;
   wire [5:0] 		ucb_thr_id;
   wire [1:0] 		ucb_buf_id;
   wire 		ucb_rack_busy;
   wire 		ucb_wr_req;
   wire [63:0] 		ucb_wdata;
   wire 		full;
   wire [4:0] 		wr_ptr;
   wire [4:0] 		rd_ptr;
   wire 		mode32b;
   wire [`PIO_FIFO_W_R]	fifo_din;
   wire [`PIO_FIFO_W_R]	fifo_dout;
   wire [`PIO_FIFO_W_R]	fifo_dout_reg;
   wire 		accepted;
   wire 		fc0;
   wire 		fc1;
   wire 		fc2;
   wire 		fc3;
   wire 		fc;
   wire [68:0] 		ldfi;
   wire [68:0] 		ldfj;
   wire 		sel1;
   wire                 pio_32b ;
   wire                 pio_peu_afull ;
   wire                 pio_clients_32b ;
`ifdef NEPTUNE
`endif
   wire                 ibusy ;
   wire                 fifo_wr_en ;
   wire                 empty ;
   wire                 slv_sel_reg ;
   wire                 fzc_slv_sel_reg ;
   wire                 ldsv_sel_reg ;
   wire                 ldgim_sel_reg ;
   wire                 imask0_sel_reg ;
   wire                 imask1_sel_reg ;
   wire                 ipp_intr ;
   wire                 fflp_intr ;
   wire                 zcp_intr ;
   wire                 txc_intr ;
   wire                 rdmc_intr ;
   wire                 mif_intr ;
   wire                 mac_reset2 ;
   wire                 mac_reset3 ;
   
   wire      intr_reg_sel;

   reg 			slv_sel      ;  // 0
   reg 			fzc_slv_sel  ;  // 1
   reg 			fzc_mac_sel  ;  // 2
   reg 			fzc_ipp_sel  ;  // 3
   reg 			fflp_sel     ;  // 4
   reg 			fzc_fflp_sel ;  // 5
   reg 			zcp_sel      ;  // 6
   reg 			fzc_zcp_sel  ;  // 8
   reg 			dmc_sel      ;  // 9
   reg 			fzc_dmc_sel  ;  // a
   reg 			txc_sel      ;  // b
   reg 			fzc_txc_sel  ;  // c
   reg                  ldsv_sel     ;  // d
// reg                  ldgim_sel    ;  // e
   reg 			imask0_sel   ;  // f
   reg 			imask1_sel   ;  //10 
   reg 			fzc_prom_sel ;  //11
   reg 			fzc_pim_sel ;   

// Split the PIO - DMC signals going out to RDMC and TDMC 
wire                  pio_dmc_sel ;
assign pio_rdmc_sel = pio_dmc_sel & ~pio_clients_addr[18];
assign pio_tdmc_sel = pio_dmc_sel & pio_clients_addr[18];
  
assign dmc_pio_ack   = (tdmc_pio_ack | rdmc_pio_ack);
assign dmc_pio_err   = pio_rdmc_sel? rdmc_pio_err   : tdmc_pio_err;
assign dmc_pio_rdata = pio_rdmc_sel? rdmc_pio_rdata : tdmc_pio_rdata;
 
// End of modification. 

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [1:0]		accepted_state;		// From niu_pio_accepted_sm of niu_pio_accepted_sm.v
wire			ack_TO_en;		// From niu_pio_regs of niu_pio_regs.v
wire [9:0]		ack_TO_value;		// From niu_pio_regs of niu_pio_regs.v
wire			arm0;			// From niu_pio_regs of niu_pio_regs.v
wire			arm1;			// From niu_pio_regs of niu_pio_regs.v
wire			arm10;			// From niu_pio_regs of niu_pio_regs.v
wire			arm11;			// From niu_pio_regs of niu_pio_regs.v
wire			arm12;			// From niu_pio_regs of niu_pio_regs.v
wire			arm13;			// From niu_pio_regs of niu_pio_regs.v
wire			arm14;			// From niu_pio_regs of niu_pio_regs.v
wire			arm15;			// From niu_pio_regs of niu_pio_regs.v
wire			arm16;			// From niu_pio_regs of niu_pio_regs.v
wire			arm17;			// From niu_pio_regs of niu_pio_regs.v
wire			arm18;			// From niu_pio_regs of niu_pio_regs.v
wire			arm19;			// From niu_pio_regs of niu_pio_regs.v
wire			arm2;			// From niu_pio_regs of niu_pio_regs.v
wire			arm20;			// From niu_pio_regs of niu_pio_regs.v
wire			arm21;			// From niu_pio_regs of niu_pio_regs.v
wire			arm22;			// From niu_pio_regs of niu_pio_regs.v
wire			arm23;			// From niu_pio_regs of niu_pio_regs.v
wire			arm24;			// From niu_pio_regs of niu_pio_regs.v
wire			arm25;			// From niu_pio_regs of niu_pio_regs.v
wire			arm26;			// From niu_pio_regs of niu_pio_regs.v
wire			arm27;			// From niu_pio_regs of niu_pio_regs.v
wire			arm28;			// From niu_pio_regs of niu_pio_regs.v
wire			arm29;			// From niu_pio_regs of niu_pio_regs.v
wire			arm3;			// From niu_pio_regs of niu_pio_regs.v
wire			arm30;			// From niu_pio_regs of niu_pio_regs.v
wire			arm31;			// From niu_pio_regs of niu_pio_regs.v
wire			arm32;			// From niu_pio_regs of niu_pio_regs.v
wire			arm33;			// From niu_pio_regs of niu_pio_regs.v
wire			arm34;			// From niu_pio_regs of niu_pio_regs.v
wire			arm35;			// From niu_pio_regs of niu_pio_regs.v
wire			arm36;			// From niu_pio_regs of niu_pio_regs.v
wire			arm37;			// From niu_pio_regs of niu_pio_regs.v
wire			arm38;			// From niu_pio_regs of niu_pio_regs.v
wire			arm39;			// From niu_pio_regs of niu_pio_regs.v
wire			arm4;			// From niu_pio_regs of niu_pio_regs.v
wire			arm40;			// From niu_pio_regs of niu_pio_regs.v
wire			arm41;			// From niu_pio_regs of niu_pio_regs.v
wire			arm42;			// From niu_pio_regs of niu_pio_regs.v
wire			arm43;			// From niu_pio_regs of niu_pio_regs.v
wire			arm44;			// From niu_pio_regs of niu_pio_regs.v
wire			arm45;			// From niu_pio_regs of niu_pio_regs.v
wire			arm46;			// From niu_pio_regs of niu_pio_regs.v
wire			arm47;			// From niu_pio_regs of niu_pio_regs.v
wire			arm48;			// From niu_pio_regs of niu_pio_regs.v
wire			arm49;			// From niu_pio_regs of niu_pio_regs.v
wire			arm5;			// From niu_pio_regs of niu_pio_regs.v
wire			arm50;			// From niu_pio_regs of niu_pio_regs.v
wire			arm51;			// From niu_pio_regs of niu_pio_regs.v
wire			arm52;			// From niu_pio_regs of niu_pio_regs.v
wire			arm53;			// From niu_pio_regs of niu_pio_regs.v
wire			arm54;			// From niu_pio_regs of niu_pio_regs.v
wire			arm55;			// From niu_pio_regs of niu_pio_regs.v
wire			arm56;			// From niu_pio_regs of niu_pio_regs.v
wire			arm57;			// From niu_pio_regs of niu_pio_regs.v
wire			arm58;			// From niu_pio_regs of niu_pio_regs.v
wire			arm59;			// From niu_pio_regs of niu_pio_regs.v
wire			arm6;			// From niu_pio_regs of niu_pio_regs.v
wire			arm60;			// From niu_pio_regs of niu_pio_regs.v
wire			arm61;			// From niu_pio_regs of niu_pio_regs.v
wire			arm62;			// From niu_pio_regs of niu_pio_regs.v
wire			arm63;			// From niu_pio_regs of niu_pio_regs.v
wire			arm7;			// From niu_pio_regs of niu_pio_regs.v
wire			arm8;			// From niu_pio_regs of niu_pio_regs.v
wire			arm9;			// From niu_pio_regs of niu_pio_regs.v
wire			fifo_rd_en;		// From niu_pio_rw_sm of niu_pio_rw_sm.v
wire			fzc_slv_ack;		// From niu_pio_regs of niu_pio_regs.v
wire			fzc_slv_err;		// From niu_pio_regs of niu_pio_regs.v
wire [63:0]		fzc_slv_rdata;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		group;			// From niu_pio_ic of niu_pio_ic.v
wire			imask0_ack;		// From niu_pio_regs of niu_pio_regs.v
wire			imask0_err;		// From niu_pio_regs of niu_pio_regs.v
wire [63:0]		imask0_rdata;		// From niu_pio_regs of niu_pio_regs.v
wire			imask1_ack;		// From niu_pio_regs of niu_pio_regs.v
wire			imask1_err;		// From niu_pio_regs of niu_pio_regs.v
wire [63:0]		imask1_rdata;		// From niu_pio_regs of niu_pio_regs.v
wire			intr_valid;		// From niu_pio_ic of niu_pio_ic.v
wire [1:0]		ldf_mask0;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask1;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask10;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask11;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask12;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask13;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask14;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask15;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask16;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask17;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask18;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask19;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask2;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask20;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask21;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask22;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask23;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask24;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask25;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask26;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask27;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask28;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask29;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask3;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask30;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask31;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask32;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask33;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask34;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask35;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask36;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask37;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask38;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask39;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask4;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask40;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask41;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask42;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask43;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask44;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask45;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask46;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask47;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask48;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask49;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask5;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask50;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask51;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask52;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask53;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask54;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask55;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask56;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask57;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask58;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask59;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask6;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask60;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask61;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask62;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask63;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask64;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask65;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask66;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask67;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask68;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask7;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask8;		// From niu_pio_regs of niu_pio_regs.v
wire [1:0]		ldf_mask9;		// From niu_pio_regs of niu_pio_regs.v
wire			ldgim_ack;		// From niu_pio_regs of niu_pio_regs.v
wire			ldgim_err;		// From niu_pio_regs of niu_pio_regs.v
wire [63:0]		ldgim_rdata;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn0;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn1;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn10;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn11;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn12;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn13;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn14;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn15;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn16;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn17;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn18;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn19;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn2;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn20;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn21;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn22;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn23;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn24;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn25;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn26;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn27;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn28;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn29;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn3;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn30;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn31;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn32;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn33;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn34;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn35;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn36;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn37;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn38;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn39;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn4;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn40;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn41;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn42;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn43;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn44;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn45;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn46;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn47;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn48;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn49;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn5;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn50;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn51;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn52;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn53;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn54;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn55;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn56;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn57;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn58;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn59;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn6;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn60;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn61;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn62;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn63;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn64;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn65;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn66;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn67;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn68;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn7;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn8;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		ldgn9;			// From niu_pio_regs of niu_pio_regs.v
wire			ldsv_ack;		// From niu_pio_regs of niu_pio_regs.v
wire			ldsv_err;		// From niu_pio_regs of niu_pio_regs.v
wire [63:0]		ldsv_rdata;		// From niu_pio_regs of niu_pio_regs.v
wire [68:0]		memship_group0;		// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group1;		// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group10;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group11;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group12;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group13;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group14;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group15;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group16;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group17;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group18;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group19;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group2;		// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group20;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group21;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group22;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group23;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group24;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group25;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group26;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group27;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group28;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group29;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group3;		// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group30;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group31;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group32;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group33;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group34;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group35;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group36;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group37;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group38;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group39;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group4;		// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group40;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group41;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group42;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group43;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group44;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group45;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group46;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group47;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group48;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group49;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group5;		// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group50;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group51;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group52;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group53;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group54;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group55;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group56;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group57;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group58;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group59;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group6;		// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group60;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group61;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group62;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group63;	// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group7;		// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group8;		// From niu_pio_ic of niu_pio_ic.v
wire [68:0]		memship_group9;		// From niu_pio_ic of niu_pio_ic.v
wire			mpc;			// From niu_pio_regs of niu_pio_regs.v
wire [6:0]		msi_data;		// From niu_pio_regs of niu_pio_regs.v
wire			pio_sel_state;		// From niu_pio_rw_sm of niu_pio_rw_sm.v
wire			rst_at;			// From niu_pio_ic of niu_pio_ic.v
wire			slv_ack;		// From niu_pio_regs of niu_pio_regs.v
wire			slv_err;		// From niu_pio_regs of niu_pio_regs.v
wire [63:0]		slv_rdata;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer0;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer1;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer10;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer11;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer12;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer13;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer14;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer15;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer16;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer17;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer18;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer19;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer2;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer20;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer21;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer22;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer23;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer24;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer25;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer26;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer27;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer28;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer29;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer3;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer30;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer31;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer32;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer33;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer34;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer35;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer36;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer37;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer38;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer39;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer4;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer40;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer41;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer42;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer43;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer44;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer45;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer46;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer47;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer48;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer49;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer5;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer50;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer51;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer52;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer53;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer54;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer55;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer56;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer57;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer58;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer59;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer6;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer60;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer61;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer62;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer63;		// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer7;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer8;			// From niu_pio_regs of niu_pio_regs.v
wire [5:0]		timer9;			// From niu_pio_regs of niu_pio_regs.v
wire [19:0]		vdmc_addr;		// From niu_pio_regs of niu_pio_regs.v
wire			vdmc_sel_ok;		// From niu_pio_regs of niu_pio_regs.v
wire [2:0]              ig_state;

wire [5:0]              debug_select ;
wire                    arb_dirtid_en ;
wire                    arb_dirtid_clr;
wire [5:0]              arb_np_threshold;
wire [5:0]              arb_rd_threshold;
wire [5:0]              arb_rdstat;
wire [5:0]              arb_wrstat;

wire [31:0]             TrainingVector;

// End of automatics

`ifdef NEPTUNE // --------------------------------------------
   wire                 NEPTUNE_signature = 1;
   wire                 peu_pio_32b;
                        // prom
   wire 		pio_prom_sel;        // O
   wire 		prom_pio_ack;        // I
   wire   [63:0] 	prom_pio_rdata;      // I
   wire 		prom_pio_err;        // I

                        // pim
   wire 		pio_pim_sel;        // O
   wire 		pim_pio_ack;        // I
   wire   [63:0] 	pim_pio_rdata;      // I
   wire 		pim_pio_err;        // I
   wire 		pim_pio_intr;       // I

`else // N2 mode ---------------------------------------------

   wire                 NEPTUNE_signature = 0;
   wire 		peu_pio_32b       = 0;
                        // prom
   wire 		pio_prom_sel;          // O
   wire 		prom_pio_ack      = 0; // I
   wire  [63:0] 	prom_pio_rdata    = 0; // I
   wire 		prom_pio_err      = 0; // I

                        // prom
   wire 		pio_pim_sel;          // O
   wire 		pim_pio_ack      = 0; // I
   wire  [63:0] 	pim_pio_rdata    = 0; // I
   wire 		pim_pio_err      = 0; // I
// wire 		pim_pio_intr     = 0; // I

`endif // ifdef NEPTUNE

/* --------------------- common rtl -------------------------- */
   wire 		niu_reset = ~niu_reset_l;
   wire   [10:0]        sys_err_mask ;
   
df1 # (1)  reset_df1   (.clk(niu_clk),.d(niu_reset),  .q(reset));

// register inputs from ucb/pci
// ---------------------------------

df1 # (1)  pio_32b_df1      (.clk(niu_clk),.d(peu_pio_32b),         .q(pio_32b));
df1 # (1)  ucb_rd_req_df1   (.clk(niu_clk),.d(rd_req_vld),          .q(ucb_rd_req));
df1 # (27) ucb_addr_df1     (.clk(niu_clk),.d(addr_in[`PIO_ADDR_R]),.q(ucb_addr[`PIO_ADDR_R]));
df1 # (6)  ucb_thr_id_df1   (.clk(niu_clk),.d(thr_id_in[5:0]),      .q(ucb_thr_id[5:0]));
df1 # (2)  ucb_buf_id_df1   (.clk(niu_clk),.d(buf_id_in[1:0]),      .q(ucb_buf_id[1:0]));
df1 # (1)  ucb_rack_busy_df1(.clk(niu_clk),.d(rack_busy),           .q(ucb_rack_busy));
df1 # (1)  ucb_wr_req_df1   (.clk(niu_clk),.d(wr_req_vld),          .q(ucb_wr_req));
df1 # (64) ucb_wdata_df1    (.clk(niu_clk),.d(data_in[63:0]),       .q(ucb_wdata[63:0]));
df1 # (1)  ibusy_df1        (.clk(niu_clk),.d(int_busy),            .q(ibusy));
// register outputs to ucb/pci
assign  ucb_rack = ucb_ack | ucb_nack;
df1   # (1)  req_accepted_df1(.clk(niu_clk),                            .d(accepted),   .q(req_accepted));
dffr  # (1)  rd_ack_vld_dffr (.clk(niu_clk),.reset(reset),              .d(ucb_ack),    .q(rd_ack_vld));
dffr  # (1)  rd_nack_vld_dffr(.clk(niu_clk),.reset(reset),              .d(ucb_nack),   .q(rd_nack_vld));
`ifdef NEPTUNE
dffre # (64) data_out_dffre  (.clk(niu_clk),.reset(reset),.en(pio_ack |(ucb_ack & insert_db)),.d(pio_rdata),  .q(data_out[63:0]));
`else 
dffre # (64) data_out_dffre  (.clk(niu_clk),.reset(reset),.en(pio_ack),.d(pio_rdata),  .q(data_out[63:0]));
`endif
dffre # (6)  thr_id_out_dffre(.clk(niu_clk),.reset(reset),.en(ucb_rack),.d(thr_id[5:0]),.q(thr_id_out[5:0]));
dffre # (2)  buf_id_out_dffre(.clk(niu_clk),.reset(reset),.en(ucb_rack),.d(buf_id[1:0]),.q(buf_id_out[1:0]));
df1   # (1)  int_vld_df1     (.clk(niu_clk),.d(intr_valid),                             .q(int_vld));
df1   # (7)  dev_id_df1      (.clk(niu_clk),.d(msi_data),                               .q(dev_id));

// Registering Meta Arb Signals
dffr # (1)  arb_dirtid_en_dffr  (.clk(niu_clk),.reset(reset),.d(arb_dirtid_en),.q(pio_arb_dirtid_enable));
dffr # (1)  arb_dirtid_clr_dffr (.clk(niu_clk),.reset(reset),.d(arb_dirtid_clr),.q(pio_arb_dirtid_clr));
dffr # (6)  arb_dirtid_np_dffr  (.clk(niu_clk),.reset(reset),.d(arb_np_threshold[5:0]),.q(pio_arb_np_threshold[5:0]));
dffr # (6)  arb_dirtid_rd_dffr  (.clk(niu_clk),.reset(reset),.d(arb_rd_threshold[5:0]),.q(pio_arb_rd_threshold[5:0]));
df1  # (6)  arb_dtid_rdstat_df1   (.clk(niu_clk),.d(arb_pio_dirtid_rdstatus[5:0]),.q(arb_rdstat[5:0]));
df1  # (6)  arb_dtid_npwrstat_df1 (.clk(niu_clk),.d(arb_pio_dirtid_npwstatus[5:0]),.q(arb_wrstat[5:0]));
// --------------------------------------------------------------------------------------------
 reg  [31:0] pio_arb_ctrl ;
 reg  [31:0] pio_arb_debug_vector ;

 wire [31:0] arb_ctrl ;
 wire [31:0] arb_debug_vector ;

 always@(posedge niu_clk)
  begin
   pio_arb_ctrl[31:0]         <= arb_ctrl[31:0];
   pio_arb_debug_vector[31:0] <= arb_debug_vector[31:0];
  end
// --------------------------------------------------------------------------------------------
 wire        pio_peu_32b_int  ;
 wire        intr_invalid  ;

`ifdef NEPTUNE

 reg        pio_peu_32b  ;
 reg        int_invld  ;
 reg [15:0] pio_gpio_data_out ;
 reg [15:0] pio_gpio_en_out ;
 reg [15:0] gpio_din ;

 wire [15:0] gpio_dout ;
 wire [15:0] gpio_en ;

 always@(posedge niu_clk)
  begin
   pio_peu_32b             <= pio_peu_32b_int ;
   int_invld               <= intr_invalid  ;
   pio_gpio_data_out[15:0] <= gpio_dout[15:0]  ;
   pio_gpio_en_out[15:0]   <= gpio_en[15:0]  ;
   gpio_din[15:0]          <= gpio_pio_data_in[15:0]  ;
  end

`endif

// signals to smx Interface 
// ------------------------

`ifdef NEPTUNE
 wire        smx_pio_intr = 0 ;       // I
 wire [31:0] smx_pio_status = 32'b0 ; // I

 reg        pim_intr  ;

 always@(posedge niu_clk)
  begin
   pim_intr                   <= pim_pio_intr ;
  end

`else

 wire [15:0] gpio_pio_data_in = 16'b0 ;
 wire mac_pio_intr2 = 1'b0 ;
 wire mac_pio_intr3 = 1'b0 ;

 reg [31:0] pio_smx_cfg_data ;
 reg        pio_smx_clear_intr  ;
 reg [31:0] pio_smx_ctrl ;
 reg [31:0] pio_smx_debug_vector ;
 reg [31:0] smx_status ;
 reg        smx_intr  ;

 wire [31:0] smx_config_data ;
 wire        clear_intr4smx ;
 wire [31:0] smx_ctrl ;
 wire [31:0] smx_debug_vector ;

 always@(posedge niu_clk)
  begin
   pio_smx_cfg_data[31:0]     <= smx_config_data[31:0];
   pio_smx_clear_intr         <= clear_intr4smx ;
   pio_smx_ctrl[31:0]         <= smx_ctrl[31:0] ;
   pio_smx_debug_vector[31:0] <= smx_debug_vector[31:0] ;
   smx_status[31:0]           <= smx_pio_status[31:0] ;
   smx_intr                   <= smx_pio_intr ;
  end
`endif

// write to fifo
niu_pio_accepted_sm niu_pio_accepted_sm
(/*AUTOINST*/
 // Outputs
 .accepted				(accepted),
 .accepted_state			(accepted_state[1:0]),
 // Inputs
 .clk					(niu_clk),
 .reset					(reset),
 .full					(full),
 .ucb_rd_req				(ucb_rd_req),
 .ucb_wr_req				(ucb_wr_req));
   
df1 # (1)  fifo_wr_en_df1(.d(accepted), .clk(niu_clk), .q(fifo_wr_en));

   assign 	fifo_din[`PIO_ADDR_R]    = ucb_addr[`PIO_ADDR_R]; // 27b
   assign 	fifo_din[90:27]          = ucb_wdata[63:0];       // 64b
   assign 	fifo_din[92:91]          = ucb_buf_id[1:0];       //  2b
   assign 	fifo_din[98:93]          = ucb_thr_id[5:0];       //  6b
   assign 	fifo_din[99]             = ucb_rd_req;            //  1b
   assign 	fifo_din[100]            = pio_32b;              //  1b
                                                                  //101b -> 100:0 
// ------------ start fifo instantiation --------------
niu_pio_fifo16d niu_pio_fifo16d(
.clk(niu_clk),
.reset(reset),
.rd(fifo_rd_en),
.wr(fifo_wr_en),
.din(fifo_din[`PIO_FIFO_W_R]),
.dout(fifo_dout[`PIO_FIFO_W_R]),
.pio_peu_afull(pio_peu_afull),
.full(full),
.empty(empty),
.rd_ptr(rd_ptr[4:0]),
.wr_ptr(wr_ptr[4:0])
);

// ------------ end of fifo instantiation --------------

// output of fifo	      
dffre #(101) dffre(.d(fifo_dout[`PIO_FIFO_W_R]),
		   .reset(reset),
		   .en(fifo_rd_en),
		   .clk(niu_clk),
		   .q(fifo_dout_reg[`PIO_FIFO_W_R]));

   assign addr   = fifo_dout_reg[`PIO_ADDR_R];
   assign wdata  = fifo_dout_reg[90:27];
   assign buf_id = fifo_dout_reg[92:91];
   assign thr_id = fifo_dout_reg[98:93];
   assign rd     = fifo_dout_reg[99];
   assign mode32b= fifo_dout_reg[100];
   
   wire [26:0]      addr_2 ;
   wire  vdmc_sel ;

    wire             pio_virt_sel_ok ;
    wire             fflp_virt_sel_ok ;
    wire             dma_virt_sel_ok ;
    wire [26:0]      virt_addr ;

   assign clients_addr[19:0] = vdmc_sel ? vdmc_addr[19:0] : addr_2[19:0];
   assign  vdmc_sel          = (dma_virt_sel_ok & vdmc_sel_ok) ? 1'b1 : 1'b0;
   
   df1 # (20) pio_clients_addr_df1   (.clk(niu_clk),.d(clients_addr[19:0]), .q(pio_clients_addr[19:0]));
   df1 # (64) pio_clients_wdata_df1  (.clk(niu_clk),.d(wdata[63:0]),.q(pio_clients_wdata[63:0]));
   df1 # (2)  pio_clients_buf_id_df1 (.clk(niu_clk),.d(buf_id[1:0]),.q(pio_clients_buf_id[1:0]));
// df1 # (2)  pio_clients_thr_id_df1 (.clk(niu_clk),.d(thr_id[1:0]),.q(pio_clients_thr_id[1:0]));
   df1 # (1)  pio_clients_rd_df1     (.clk(niu_clk),.d(rd),         .q(pio_clients_rd));
   df1 # (1)  pio_clients_32b_df1    (.clk(niu_clk),.d(mode32b),    .q(pio_clients_32b));

// ------------  Logic for 32b PIO Access  ----------------------
 reg          pio_32b_rd ;
 reg          pio_32b_wr ;

 always@(posedge niu_clk)
  begin
   if (pio_clients_32b)
    begin
     if (pio_clients_addr[2:0] == 3'b100) 
       if (pio_clients_rd)
        begin
         pio_32b_rd <= 1'b1 ;
         pio_32b_wr <= 1'b0 ;
        end
       else
        begin
         pio_32b_rd <= 1'b0 ;
         pio_32b_wr <= 1'b1 ;
        end
     else 
       begin
         pio_32b_rd <= 1'b0 ;
         pio_32b_wr <= 1'b0 ;
       end
    end
   else
    begin
     pio_32b_rd <= 1'b0 ;
     pio_32b_wr <= 1'b0 ;
    end
  end
// --------------------------------------------------------------

// ------------ start rw_sm instantiation --------------
// fifo read write state machine
niu_pio_rw_sm niu_pio_rw_sm
(/*AUTOINST*/
 // Outputs
 .ucb_ack				(ucb_ack),
 .ucb_nack				(ucb_nack),
 .fifo_rd_en				(fifo_rd_en),
 .pio_sel_state				(pio_sel_state),
 .pio_rw_state				(pio_rw_state[2:0]),
 .pio_peu_32b_int    			(pio_peu_32b_int),
`ifdef NEPTUNE
 .insert_db    			        (insert_db),
`else
`endif 
 // Inputs
 .clk					(niu_clk),
 .reset					(reset),
 .empty					(empty),
 .pio_ack				(pio_ack),
 .pio_err				(pio_err),
 .rd					(rd),
 .ack_TO_en				(ack_TO_en),
 .ack_TO_value				(ack_TO_value[9:0]),
 .sel1					(sel1),
 .ucb_rack_busy				(ucb_rack_busy),
 .pio_clients_32b			(pio_clients_32b));
// ------------ End of rw_sm instantiation ----------------------

// address decoder and selection generation
// if (mpc == 1) only function 0 has write access.
// if (mpc == 0) all functions have write access.

// ------------ Original Code (Two Functions)  -------------------
// `ifdef   NEPTUNE
//    assign  fc0   = (addr[25:24] == 2'b00);
//    assign  fc1   = (addr[25:24] != 2'b00) & (~mpc | (mpc & rd));
// `else
//    assign  fc0   = ~addr[24];
//    assign  fc1   =  addr[24]              & (~mpc | (mpc & rd));
// `endif
// 
//    assign  fc = fc0 | fc1;
// ------------ End of Original Code (Two Functions)  --------------
   
    assign  fc0   = (addr[26:24] == 3'b000);
    assign  fc1   = (addr[26:24] == 3'b010) & (~mpc | (mpc & rd));
    assign  fc2   = (addr[26:24] == 3'b100) & (~mpc | (mpc & rd));
    assign  fc3   = (addr[26:24] == 3'b110) & (~mpc | (mpc & rd));
    assign  fc    = (fc0 | fc1 | fc2 | fc3 );

    wire             fc0_v   ;
    wire             fc1_v   ;
    wire             fc2_v   ;
    wire             fc3_v   ;

    assign  fc0_v   = (addr[26:24] == 3'b001 );
    assign  fc1_v   = (addr[26:24] == 3'b011);
    assign  fc2_v   = (addr[26:24] == 3'b101);
    assign  fc3_v   = (addr[26:24] == 3'b111);

// -----------------------------------------------------------------

always @ (/*AUTOSENSE*/addr or fc)
    begin
                     slv_sel    = 0; 
	         fzc_slv_sel    = 0; 
		 fzc_mac_sel    = 0; 
		 fzc_ipp_sel    = 0; 
	             fflp_sel   = 0; 
	         fzc_fflp_sel   = 0; 
//                 vdmc_sel     = 0; 
		     zcp_sel    = 0; 
		 fzc_zcp_sel    = 0; 
		     dmc_sel    = 0; 
		 fzc_dmc_sel    = 0; 
	             txc_sel    = 0; 
		 fzc_txc_sel    = 0; 
	             ldsv_sel   = 0; 
//                   ldgim_sel  = 0; 
                     imask0_sel = 0; 
	             imask1_sel = 0; 
                 fzc_prom_sel   = 0;
                 fzc_pim_sel    = 0;
    casex({addr[23:20],addr[19]})    // block number
      5'b0000_0:     slv_sel    = 1; // 0 
      5'b0011_0:    fflp_sel    = 1; // 3 
//    5'b0100_0:    vdmc_sel    = vdmc_sel_ok; // 4  // vdmc_sel_ok decodes addr[15:9] plus enable bit (binding bit). 
//                                                   // vdmc_sel_ok decodes addr[26:25],addr[14],addr[12:10]
      5'b0101_0:     zcp_sel    = 1; // 5 
      5'b0110_0:     dmc_sel    = 1; // 6 
      5'b0111_0:     txc_sel    = 1; // 7
      5'b1000_0:    ldsv_sel    = 1; // 8
//    5'b1001_0:   ldgim_sel    = 1; // 9
      5'b1010_0:  imask0_sel    = 1; // A
      5'b1011_0:  imask1_sel    = 1; // B
                 // fzc 			 
      5'b0000_1: fzc_slv_sel    = fc;// 0 
      5'b0001_1: fzc_mac_sel    = fc;// 1 
      5'b0010_1: fzc_ipp_sel    = fc;// 2 
      5'b0011_1: fzc_fflp_sel   = fc;// 3 
      5'b0101_1: fzc_zcp_sel    = fc;// 5 
      5'b0110_1: fzc_dmc_sel    = fc;// 6
      5'b0111_1: fzc_txc_sel    = fc;// 7
      5'b1100_1: fzc_prom_sel   = fc;// C
      5'b1101_1: fzc_pim_sel    = fc;// C
    endcase
    end // always @ (...

    assign addr_2[26:0] = (pio_virt_sel_ok || fflp_virt_sel_ok) ? virt_addr[26:0] : addr[26:0];

// total 12 sets of pio acks.
df1 # (1) slv_sel_reg_df1    (.clk(niu_clk),
                              .d((slv_sel & !dma_virt_sel_ok & !fflp_virt_sel_ok & !pio_virt_sel_ok ) & pio_sel_state),
                              .q(slv_sel_reg));
df1 # (1) fzc_slv_sel_reg_df1(.clk(niu_clk),.d(fzc_slv_sel                       & pio_sel_state),.q(fzc_slv_sel_reg));
df1 # (1) pio_mac_sel_df1    (.clk(niu_clk),.d(fzc_mac_sel                       & pio_sel_state),.q(pio_mac_sel));
df1 # (1) pio_ipp_sel_df1    (.clk(niu_clk),.d(fzc_ipp_sel                       & pio_sel_state),.q(pio_ipp_sel));
df1 # (1) pio_fflp_sel_df1   (.clk(niu_clk),.d((fzc_fflp_sel|fflp_sel|fflp_virt_sel_ok) & pio_sel_state),.q(pio_fflp_sel));
df1 # (1) pio_zcp_sel_df1    (.clk(niu_clk),.d((fzc_zcp_sel |zcp_sel)            & pio_sel_state),.q(pio_zcp_sel));
df1 # (1) pio_txc_sel_df1    (.clk(niu_clk),.d((fzc_txc_sel |txc_sel)            & pio_sel_state),.q(pio_txc_sel));
df1 # (1) ldsv_sel_reg_df1   (.clk(niu_clk),.d((ldsv_sel    |pio_virt_sel_ok)    & pio_sel_state),.q(ldsv_sel_reg));
df1 # (1) ldgin_sel_reg_df1   (.clk(niu_clk),.d(ldsv_sel                         & pio_sel_state),.q(ldgim_sel_reg));
df1 # (1) imask0_sel_reg_df1 (.clk(niu_clk),.d(imask0_sel                        & pio_sel_state),.q(imask0_sel_reg));
df1 # (1) imask1_sel_reg_df1 (.clk(niu_clk),.d(imask1_sel                        & pio_sel_state),.q(imask1_sel_reg));
df1 # (1) pio_dmc_sel_df1    (.clk(niu_clk),.d((fzc_dmc_sel |( dmc_sel & !pio_virt_sel_ok )| vdmc_sel) & pio_sel_state),.q(pio_dmc_sel));
// df1 # (1) pio_dmc_sel_df1    (.clk(niu_clk),.d((fzc_dmc_sel |dmc_sel | vdmc_sel) & pio_sel_state),.q(pio_dmc_sel));
`ifdef NEPTUNE
df1 # (1) pio_prom_sel_reg_df1  (.clk(niu_clk),.d((fzc_prom_sel)                 & pio_sel_state),.q(pio_prom_sel));
df1 # (1) pio_pim_sel_reg_df1   (.clk(niu_clk),.d((fzc_pim_sel)                  & pio_sel_state),.q(pio_pim_sel));
`else
    assign pio_prom_sel = ((fzc_pim_sel) & pio_sel_state);
    assign pio_pim_sel  = ((fzc_pim_sel) & pio_sel_state);
`endif

 // 16 clients
     assign sel1 =  (slv_sel & !dma_virt_sel_ok & !fflp_virt_sel_ok & !pio_virt_sel_ok ) |
                   fzc_slv_sel    |     
                   fzc_mac_sel    |     
                   fzc_ipp_sel    |     
                       fflp_sel   |     
                   fzc_fflp_sel   |     
         	       zcp_sel    |     
                   fzc_zcp_sel    |     
 ( dmc_sel &!pio_virt_sel_ok )    |     
            	      vdmc_sel    |     
                   fzc_dmc_sel    |     
                       txc_sel    |     
                   fzc_txc_sel    |     
                       ldsv_sel   |     
                       imask0_sel |     
                       imask1_sel |
                   fzc_pim_sel    | 
                   fzc_prom_sel   |    
                 fflp_virt_sel_ok |
                  pio_virt_sel_ok ;

always @ (/*AUTOSENSE*/dmc_pio_ack_reg or dmc_pio_err_reg
	  or dmc_pio_rdata_reg or fflp_pio_ack_reg or fflp_pio_err_reg
	  or fflp_pio_rdata_reg or fzc_slv_ack or fzc_slv_err
	  or fzc_slv_rdata or fzc_slv_sel or imask0_ack or imask0_err
	  or imask0_rdata or imask0_sel_reg or imask1_ack
	  or imask1_err or imask1_rdata or imask1_sel_reg
	  or ipp_pio_ack_reg or ipp_pio_err_reg or ipp_pio_rdata_reg
	  or ldgim_ack or ldgim_err or ldgim_rdata
	  or ldsv_ack or ldsv_err or ldsv_rdata or ldsv_sel_reg
	  or mac_pio_ack_reg or mac_pio_err_reg or mac_pio_rdata_reg
	  or pio_dmc_sel or pio_fflp_sel or pio_ipp_sel or pio_mac_sel
	  or pio_prom_sel or pio_pim_sel or pio_txc_sel or pio_zcp_sel
	  or prom_pio_ack_reg or prom_pio_err_reg
	  or prom_pio_rdata_reg or slv_ack or slv_err or slv_rdata
	  or slv_sel_reg or txc_pio_ack_reg or txc_pio_err_reg
	  or txc_pio_rdata_reg or zcp_pio_ack_reg or zcp_pio_err_reg
	  or zcp_pio_rdata_reg or intr_reg_sel
          or pim_pio_err_reg or pim_pio_ack_reg or pim_pio_rdata_reg
          or pio_32b_rd)
begin
	                pio_ack           =  1'b0;
                        pio_rdata         =  64'hdead_beef_dead_beef;
                        pio_err           =  1'b0;

  case ({pio_prom_sel,imask1_sel_reg,imask0_sel_reg,pio_pim_sel,ldsv_sel_reg,pio_txc_sel,pio_dmc_sel,pio_zcp_sel,pio_fflp_sel,pio_ipp_sel,pio_mac_sel,fzc_slv_sel,slv_sel_reg})
    13'b0_0000_0000_0001:begin		                        
                        pio_ack         = slv_ack;                        // already registered in decoder logic.
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = slv_err;                        // already registered in decoder logic.
`endif
                     if(pio_32b_rd)
                        pio_rdata       = ({32'b0,slv_rdata[63:32]});     // already registered in decoder logic.
                     else
                        pio_rdata       = slv_rdata;                      // already registered in decoder logic.
                     end                                     
    13'b0_0000_0000_0010:begin		                        
                        pio_ack         = fzc_slv_ack;                    // already registered in decoder logic.
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = fzc_slv_err;                    // already registered in decoder logic.
`endif
                     if(pio_32b_rd)
                        pio_rdata       = ({32'b0,fzc_slv_rdata[63:32]}); // already registered in decoder logic.
                     else
                        pio_rdata       = fzc_slv_rdata;                  // already registered in decoder logic.
                     end                                    
    13'b0_0000_0000_0100:begin                                        
                        pio_ack         = mac_pio_ack_reg;        
                        pio_rdata       = mac_pio_rdata_reg;      
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = mac_pio_err_reg;        
`endif
                     end                                          
    13'b0_0000_0000_1000:begin                                        
                        pio_ack         = ipp_pio_ack_reg;         
                        pio_rdata       = ipp_pio_rdata_reg;      
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = ipp_pio_err_reg;        
`endif
                     end                                          
    13'b0_0000_0001_0000:begin                                         
                        pio_ack         = fflp_pio_ack_reg;           
                        pio_rdata       = fflp_pio_rdata_reg;     
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = fflp_pio_err_reg;       
`endif
                     end                                           
    13'b0_0000_0010_0000:begin                                         
                        pio_ack         = zcp_pio_ack_reg;           
                        pio_rdata       = zcp_pio_rdata_reg;     
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = zcp_pio_err_reg;       
`endif
                     end                                          
    13'b0_0000_0100_0000:begin                                                           
                        pio_ack         = dmc_pio_ack_reg;           
                        pio_rdata       = dmc_pio_rdata_reg;      
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = dmc_pio_err_reg;        
`endif
                     end                                           
    13'b0_0000_1000_0000:begin                                         
                        pio_ack         = txc_pio_ack_reg;           
                        pio_rdata       = txc_pio_rdata_reg;      
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = txc_pio_err_reg;        
`endif
                     end                         
    13'b0_0001_0000_0000:
                  begin
                   if (!intr_reg_sel)
                     begin                                   
                        pio_ack         = ldsv_ack;                     // already registered in decoder logic.
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = ldsv_err;                     // already registered in decoder logic.
`endif
                     if(pio_32b_rd)
                        pio_rdata       = ({32'b0,ldsv_rdata[63:32]});  // already registered in decoder logic.
                     else
                        pio_rdata       = ldsv_rdata;                   // already registered in decoder logic.
                     end                        
                   else 
                     begin                                         
                        pio_ack         = ldgim_ack;                    // already registered in decoder logic.
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = ldgim_err;                    // already registered in decoder logic.
`endif
                     if(pio_32b_rd)
                        pio_rdata       = ({32'b0,ldgim_rdata[63:32]}); // already registered in decoder logic.
                     else
                        pio_rdata       = ldgim_rdata;                  // already registered in decoder logic.
                     end                        
                  end
    13'b0_0010_0000_0000:
                     begin                                         
                        pio_ack         = pim_pio_ack_reg;        
                        pio_rdata       = pim_pio_rdata_reg;        
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = pim_pio_err_reg;        
`endif
                     end                         
    13'b0_0100_0000_0000:begin                                         
                        pio_ack         = imask0_ack;                   // already registered in decoder logic.
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = imask0_err;                   // already registered in decoder logic.
`endif
                     if(pio_32b_rd)
                        pio_rdata       = ({32'b0,imask0_rdata[63:32]});// already registered in decoder logic.
                     else
                        pio_rdata       = imask0_rdata;                 // already registered in decoder logic.
                     end                         
    13'b0_1000_0000_0000:begin                                         
                        pio_ack         = imask1_ack;                   // already registered in decoder logic.
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = imask1_err;                   // already registered in decoder logic.
`endif
                     if(pio_32b_rd)
                        pio_rdata       = ({32'b0,imask1_rdata[63:32]});// already registered in decoder logic.
                     else
                        pio_rdata       = imask1_rdata;                 // already registered in decoder logic.
                     end                         
    13'b1_0000_0000_0000:begin                                         
                        pio_ack         = prom_pio_ack_reg;           
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = prom_pio_err_reg;       
`endif
                        pio_rdata       = prom_pio_rdata_reg;     
                     end                        
         default:    begin
                        pio_ack         = 1'b0;
                        pio_rdata       = 64'hdead_beef_dead_beef;
`ifdef NEPTUNE
                        pio_err         = 1'b0;                           // already registered in decoder logic.
`else
                        pio_err         = 1'b0;
`endif
                     end 
       endcase
end // always @ (...

// register external clients input signals			      

df1   # (1)  mac_pio_ack_reg_df1     (.d(mac_pio_ack),                                   .clk(niu_clk),.q(mac_pio_ack_reg));
dffre # (64) mac_pio_rdata_reg_dffre (.d(mac_pio_rdata), .reset(reset),.en(mac_pio_ack), .clk(niu_clk),.q(mac_pio_rdata_reg));

df1   # (1)  ipp_pio_ack_reg_df1     (.d(ipp_pio_ack),                                   .clk(niu_clk),.q(ipp_pio_ack_reg));
dffre # (64) ipp_pio_rdata_reg_dffre (.d(ipp_pio_rdata), .reset(reset),.en(ipp_pio_ack), .clk(niu_clk),.q(ipp_pio_rdata_reg));

df1   # (1)  fflp_pio_ack_reg_df1    (.d(fflp_pio_ack),                                  .clk(niu_clk),.q(fflp_pio_ack_reg));
dffre # (64) fflp_pio_rdata_reg_dffre(.d(fflp_pio_rdata),.reset(reset),.en(fflp_pio_ack),.clk(niu_clk),.q(fflp_pio_rdata_reg));

df1   # (1)  zcp_pio_ack_reg_df1     (.d(zcp_pio_ack),                                   .clk(niu_clk),.q(zcp_pio_ack_reg));
dffre # (64) zcp_pio_rdata_reg_dffre (.d(zcp_pio_rdata), .reset(reset),.en(zcp_pio_ack), .clk(niu_clk),.q(zcp_pio_rdata_reg));

df1   # (1)  dmc_pio_ack_reg_df1     (.d(dmc_pio_ack),                                   .clk(niu_clk),.q(dmc_pio_ack_reg));
dffre # (64) dmc_pio_rdata_reg_dffre (.d(dmc_pio_rdata), .reset(reset),.en(dmc_pio_ack), .clk(niu_clk),.q(dmc_pio_rdata_reg));

df1   # (1)  txc_pio_ack_reg_df1     (.d(txc_pio_ack),                                   .clk(niu_clk),.q(txc_pio_ack_reg));
dffre # (64) txc_pio_rdata_reg_dffre (.d(txc_pio_rdata), .reset(reset),.en(txc_pio_ack), .clk(niu_clk),.q(txc_pio_rdata_reg));

`ifdef NEPTUNE

df1   # (1)  prom_pio_ack_reg_df1    (.d(prom_pio_ack),                                  .clk(niu_clk),.q(prom_pio_ack_reg));
dffre # (64) prom_pio_rdata_reg_dffre(.d(prom_pio_rdata),.reset(reset),.en(prom_pio_ack),.clk(niu_clk),.q(prom_pio_rdata_reg));
dffre # (1)  prom_pio_err_reg_dffre  (.d(prom_pio_err),  .reset(reset),.en(prom_pio_ack),.clk(niu_clk),.q(prom_pio_err_reg));

df1   # (1)  pim_pio_ack_reg_df1    (.d(pim_pio_ack),                                  .clk(niu_clk),.q(pim_pio_ack_reg));
dffre # (64) pim_pio_rdata_reg_dffre(.d(pim_pio_rdata),.reset(reset),.en(pim_pio_ack),.clk(niu_clk),.q(pim_pio_rdata_reg));
dffre # (1)  pim_pio_err_reg_dffre  (.d(pim_pio_err),  .reset(reset),.en(pim_pio_ack),.clk(niu_clk),.q(pim_pio_err_reg));

   assign    mac_pio_err_reg         = mac_pio_err ;
   assign    ipp_pio_err_reg         = ipp_pio_err ;
   assign    fflp_pio_err_reg        = fflp_pio_err ;
   assign    zcp_pio_err_reg         = zcp_pio_err ;
   assign    dmc_pio_err_reg         = dmc_pio_err ;
   assign    txc_pio_err_reg         = txc_pio_err ;

`else
dffre # (1)  mac_pio_err_reg_dffre   (.d(mac_pio_err),   .reset(reset),.en(mac_pio_ack), .clk(niu_clk),.q(mac_pio_err_reg));
dffre # (1)  ipp_pio_err_reg_dffre   (.d(ipp_pio_err),   .reset(reset),.en(ipp_pio_ack), .clk(niu_clk),.q(ipp_pio_err_reg));
dffre # (1)  fflp_pio_err_reg_dffre  (.d(fflp_pio_err),  .reset(reset),.en(fflp_pio_ack),.clk(niu_clk),.q(fflp_pio_err_reg));
dffre # (1)  zcp_pio_err_reg_dffre   (.d(zcp_pio_err),   .reset(reset),.en(zcp_pio_ack), .clk(niu_clk),.q(zcp_pio_err_reg));
dffre # (1)  dmc_pio_err_reg_dffre   (.d(dmc_pio_err),   .reset(reset),.en(dmc_pio_ack), .clk(niu_clk),.q(dmc_pio_err_reg));
dffre # (1)  txc_pio_err_reg_dffre   (.d(txc_pio_err),   .reset(reset),.en(txc_pio_ack), .clk(niu_clk),.q(txc_pio_err_reg));

   assign    prom_pio_ack_reg         = prom_pio_ack ;
   assign    prom_pio_rdata_reg[63:0] = prom_pio_rdata[63:0] ;
   assign    prom_pio_err_reg         = prom_pio_err ;

   assign    pim_pio_ack_reg          = pim_pio_ack ;
   assign    pim_pio_rdata_reg[63:0]  = pim_pio_rdata[63:0] ;
   assign    pim_pio_err_reg          = pim_pio_err ;
`endif

// register client interrupts
// df1   # (64)  dmc_intri_df1 (.d(dmc_pio_intri[63:0]),.clk(niu_clk),.q(ldfi[63:0]));
// df1   # (64)  dmc_intrj_df1 (.d(dmc_pio_intrj[63:0]),.clk(niu_clk),.q(ldfj[63:0]));

`ifdef NEPTUNE
wire [31:0] del_pio_clients_wdata ;
df1 # (32) del_pio_clients_wdata_df1 (.d(pio_clients_wdata[31:0]),.clk(niu_clk),.q(del_pio_clients_wdata[31:0]));
`else
`endif

`ifdef NEPTUNE

   df1   # (16)  dmc_intri_df1_0_15 (.d(dmc_pio_intri[15:0]),.clk(niu_clk),.q(ldfj[15:0]));
   df1   # (16)  dmc_intrj_df1_0_15 (.d(dmc_pio_intrj[15:0]),.clk(niu_clk),.q(ldfi[15:0]));

   assign 	 ldfi[31:16] = 16'b0 ;
   assign 	 ldfj[31:16] = 16'b0 ;

   df1   # (24)  dmc_intri_df1_55_32 (.d(dmc_pio_intri[55:32]),.clk(niu_clk),.q(ldfj[55:32]));
   df1   # (24)  dmc_intrj_df1_55_32 (.d(dmc_pio_intrj[55:32]),.clk(niu_clk),.q(ldfi[55:32]));

   assign 	 ldfi[62:56] = 7'b0 ;
   assign 	 ldfj[63:56] = 8'b0 ;

`else
   df1   # (16)  dmc_intri_df1_0_15 (.d(dmc_pio_intri[15:0]),.clk(niu_clk),.q(ldfj[15:0]));
   df1   # (16)  dmc_intrj_df1_0_15 (.d(dmc_pio_intrj[15:0]),.clk(niu_clk),.q(ldfi[15:0]));

   assign 	 ldfi[31:16] = 16'b0 ;
   assign 	 ldfj[31:16] = 16'b0 ;

   df1   # (16)  dmc_intri_df1_47_32 (.d(dmc_pio_intri[47:32]),.clk(niu_clk),.q(ldfj[47:32]));
   df1   # (16)  dmc_intrj_df1_47_32 (.d(dmc_pio_intrj[47:32]),.clk(niu_clk),.q(ldfi[47:32]));

   assign 	 ldfi[62:48] = 15'b0 ;
   assign 	 ldfj[63:48] = 16'b0 ;

`endif

// mac
df1   # (1)   mif_pio_intr_df1  (.d(mif_pio_intr), .clk(niu_clk),.q(ldfi[63]));
df1   # (1)   mac_intr0_df1     (.d(mac_pio_intr0),.clk(niu_clk),.q(ldfi[64]));
df1   # (1)   mac_intr1_df1     (.d(mac_pio_intr1),      .clk(niu_clk),.q(ldfi[65]));

`ifdef NEPTUNE
df1   # (1)   mac_intr2_df1     (.d(mac_pio_intr2), .clk(niu_clk),.q(ldfi[66]));
df1   # (1)   mac_intr3_df1     (.d(mac_pio_intr3), .clk(niu_clk),.q(ldfi[67]));
`else
   assign 	  ldfi[66] = 1'b0 ;
   assign 	  ldfi[67] = 1'b0 ;
`endif

   assign 	  ldfj[65] = 1'b0 ;
   assign 	  ldfj[64] = 1'b0 ;
   assign 	  ldfj[66] = 1'b0 ;
   assign 	  ldfj[67] = 1'b0 ;
   assign 	  ldfj[68] = 1'b0 ;

// system error
df1   # (1)   ipp_intr_df1 (.d(ipp_pio_intr),        .clk(niu_clk),.q(ipp_intr));
df1   # (1)   fflp_intr_df1 (.d(fflp_pio_intr),      .clk(niu_clk),.q(fflp_intr));
df1   # (1)   zcp_intr_df1 (.d(zcp_pio_intr),        .clk(niu_clk),.q(zcp_intr));
df1   # (1)   txc_intr_df1 (.d(txc_pio_intr),        .clk(niu_clk),.q(txc_intr));
df1   # (1)   mif_intr_df1 (.d(mif_pio_intr),        .clk(niu_clk),.q(mif_intr));
df1   # (1)   rdmc_intr_df1 (.d(rdmc_pio_port_int),  .clk(niu_clk),.q(rdmc_intr));

df1   # (1)   meta_intr_df1 (.d(arb_pio_all_npwdirty), .clk(niu_clk),.q(meta_intr1));
df1   # (1)   meta_intr_df2 (.d(arb_pio_all_rddirty),  .clk(niu_clk),.q(meta_intr2));

`ifdef NEPTUNE
   wire   other_intr = ((ipp_intr   & !sys_err_mask[2]) |
                        (fflp_intr  & !sys_err_mask[3]) |
                        (zcp_intr   & !sys_err_mask[4]) |
                        (txc_intr   & !sys_err_mask[7]) |
                        (rdmc_intr  & !sys_err_mask[6]) |
                        (mif_intr   & !sys_err_mask[1]) |
    (smx_meta_intr_hld | meta_intr1 & !sys_err_mask[9]) |
    (smx_meta_intr_hld | meta_intr2 & !sys_err_mask[10])|
                        (pim_intr   & !sys_err_mask[8])  );
`else
   wire   other_intr = ((ipp_intr   & !sys_err_mask[2]) |
                        (fflp_intr  & !sys_err_mask[3]) |
                        (zcp_intr   & !sys_err_mask[4]) |
                        (txc_intr   & !sys_err_mask[7]) |
                        (rdmc_intr  & !sys_err_mask[6]) |
                        (mif_intr   & !sys_err_mask[1]) |
    (smx_meta_intr_hld | meta_intr1 & !sys_err_mask[9]) |
    (smx_meta_intr_hld | meta_intr2 & !sys_err_mask[10])|
    (smx_meta_intr_hld | smx_intr   & !sys_err_mask[0])  );
`endif

df1   # (1)   other_intr_df1 (.d(other_intr),       .clk(niu_clk),.q(ldfi[68])); 
   
niu_pio_regs niu_pio_regs
(/*AUTOINST*/
 // Outputs
 .slv_ack				(slv_ack),
 .slv_rdata				(slv_rdata[63:0]),
 .slv_err				(slv_err),
 .fzc_slv_ack				(fzc_slv_ack),
 .fzc_slv_rdata				(fzc_slv_rdata[63:0]),
 .fzc_slv_err				(fzc_slv_err),
 .vdmc_addr				(vdmc_addr[19:0]),
 .vdmc_sel_ok				(vdmc_sel_ok),
 .ldsv_ack				(ldsv_ack),
 .ldsv_rdata				(ldsv_rdata[63:0]),
 .ldsv_err				(ldsv_err),
 .ldgim_ack				(ldgim_ack),
 .ldgim_rdata				(ldgim_rdata[63:0]),
 .ldgim_err				(ldgim_err),
 .intr_reg_sel				(intr_reg_sel),
 .imask0_ack				(imask0_ack),
 .imask0_rdata				(imask0_rdata[63:0]),
 .imask0_err				(imask0_err),
 .imask1_ack				(imask1_ack),
 .imask1_rdata				(imask1_rdata[63:0]),
 .imask1_err				(imask1_err),
 .mpc					(mpc),
 .ack_TO_en				(ack_TO_en),
 .ack_TO_value				(ack_TO_value[9:0]),
 .mac_reset0				(mac_reset0),
 .mac_reset1				(mac_reset1),
 .mac_reset2				(mac_reset2),
 .mac_reset3				(mac_reset3),
 .msi_data				(msi_data[6:0]),
 .ldgn0					(ldgn0[5:0]),
 .ldgn1					(ldgn1[5:0]),
 .ldgn2					(ldgn2[5:0]),
 .ldgn3					(ldgn3[5:0]),
 .ldgn4					(ldgn4[5:0]),
 .ldgn5					(ldgn5[5:0]),
 .ldgn6					(ldgn6[5:0]),
 .ldgn7					(ldgn7[5:0]),
 .ldgn8					(ldgn8[5:0]),
 .ldgn9					(ldgn9[5:0]),
 .ldgn10				(ldgn10[5:0]),
 .ldgn11				(ldgn11[5:0]),
 .ldgn12				(ldgn12[5:0]),
 .ldgn13				(ldgn13[5:0]),
 .ldgn14				(ldgn14[5:0]),
 .ldgn15				(ldgn15[5:0]),
 .ldgn16				(ldgn16[5:0]),
 .ldgn17				(ldgn17[5:0]),
 .ldgn18				(ldgn18[5:0]),
 .ldgn19				(ldgn19[5:0]),
 .ldgn20				(ldgn20[5:0]),
 .ldgn21				(ldgn21[5:0]),
 .ldgn22				(ldgn22[5:0]),
 .ldgn23				(ldgn23[5:0]),
 .ldgn24				(ldgn24[5:0]),
 .ldgn25				(ldgn25[5:0]),
 .ldgn26				(ldgn26[5:0]),
 .ldgn27				(ldgn27[5:0]),
 .ldgn28				(ldgn28[5:0]),
 .ldgn29				(ldgn29[5:0]),
 .ldgn30				(ldgn30[5:0]),
 .ldgn31				(ldgn31[5:0]),
 .ldgn32				(ldgn32[5:0]),
 .ldgn33				(ldgn33[5:0]),
 .ldgn34				(ldgn34[5:0]),
 .ldgn35				(ldgn35[5:0]),
 .ldgn36				(ldgn36[5:0]),
 .ldgn37				(ldgn37[5:0]),
 .ldgn38				(ldgn38[5:0]),
 .ldgn39				(ldgn39[5:0]),
 .ldgn40				(ldgn40[5:0]),
 .ldgn41				(ldgn41[5:0]),
 .ldgn42				(ldgn42[5:0]),
 .ldgn43				(ldgn43[5:0]),
 .ldgn44				(ldgn44[5:0]),
 .ldgn45				(ldgn45[5:0]),
 .ldgn46				(ldgn46[5:0]),
 .ldgn47				(ldgn47[5:0]),
 .ldgn48				(ldgn48[5:0]),
 .ldgn49				(ldgn49[5:0]),
 .ldgn50				(ldgn50[5:0]),
 .ldgn51				(ldgn51[5:0]),
 .ldgn52				(ldgn52[5:0]),
 .ldgn53				(ldgn53[5:0]),
 .ldgn54				(ldgn54[5:0]),
 .ldgn55				(ldgn55[5:0]),
 .ldgn56				(ldgn56[5:0]),
 .ldgn57				(ldgn57[5:0]),
 .ldgn58				(ldgn58[5:0]),
 .ldgn59				(ldgn59[5:0]),
 .ldgn60				(ldgn60[5:0]),
 .ldgn61				(ldgn61[5:0]),
 .ldgn62				(ldgn62[5:0]),
 .ldgn63				(ldgn63[5:0]),
 .ldgn64				(ldgn64[5:0]),
 .ldgn65				(ldgn65[5:0]),
 .ldgn66				(ldgn66[5:0]),
 .ldgn67				(ldgn67[5:0]),
 .ldgn68				(ldgn68[5:0]),
 .arm0					(arm0),
 .arm1					(arm1),
 .arm2					(arm2),
 .arm3					(arm3),
 .arm4					(arm4),
 .arm5					(arm5),
 .arm6					(arm6),
 .arm7					(arm7),
 .arm8					(arm8),
 .arm9					(arm9),
 .arm10					(arm10),
 .arm11					(arm11),
 .arm12					(arm12),
 .arm13					(arm13),
 .arm14					(arm14),
 .arm15					(arm15),
 .arm16					(arm16),
 .arm17					(arm17),
 .arm18					(arm18),
 .arm19					(arm19),
 .arm20					(arm20),
 .arm21					(arm21),
 .arm22					(arm22),
 .arm23					(arm23),
 .arm24					(arm24),
 .arm25					(arm25),
 .arm26					(arm26),
 .arm27					(arm27),
 .arm28					(arm28),
 .arm29					(arm29),
 .arm30					(arm30),
 .arm31					(arm31),
 .arm32					(arm32),
 .arm33					(arm33),
 .arm34					(arm34),
 .arm35					(arm35),
 .arm36					(arm36),
 .arm37					(arm37),
 .arm38					(arm38),
 .arm39					(arm39),
 .arm40					(arm40),
 .arm41					(arm41),
 .arm42					(arm42),
 .arm43					(arm43),
 .arm44					(arm44),
 .arm45					(arm45),
 .arm46					(arm46),
 .arm47					(arm47),
 .arm48					(arm48),
 .arm49					(arm49),
 .arm50					(arm50),
 .arm51					(arm51),
 .arm52					(arm52),
 .arm53					(arm53),
 .arm54					(arm54),
 .arm55					(arm55),
 .arm56					(arm56),
 .arm57					(arm57),
 .arm58					(arm58),
 .arm59					(arm59),
 .arm60					(arm60),
 .arm61					(arm61),
 .arm62					(arm62),
 .arm63					(arm63),
 .ldf_mask0				(ldf_mask0[1:0]),
 .ldf_mask1				(ldf_mask1[1:0]),
 .ldf_mask2				(ldf_mask2[1:0]),
 .ldf_mask3				(ldf_mask3[1:0]),
 .ldf_mask4				(ldf_mask4[1:0]),
 .ldf_mask5				(ldf_mask5[1:0]),
 .ldf_mask6				(ldf_mask6[1:0]),
 .ldf_mask7				(ldf_mask7[1:0]),
 .ldf_mask8				(ldf_mask8[1:0]),
 .ldf_mask9				(ldf_mask9[1:0]),
 .ldf_mask10				(ldf_mask10[1:0]),
 .ldf_mask11				(ldf_mask11[1:0]),
 .ldf_mask12				(ldf_mask12[1:0]),
 .ldf_mask13				(ldf_mask13[1:0]),
 .ldf_mask14				(ldf_mask14[1:0]),
 .ldf_mask15				(ldf_mask15[1:0]),
 .ldf_mask16				(ldf_mask16[1:0]),
 .ldf_mask17				(ldf_mask17[1:0]),
 .ldf_mask18				(ldf_mask18[1:0]),
 .ldf_mask19				(ldf_mask19[1:0]),
 .ldf_mask20				(ldf_mask20[1:0]),
 .ldf_mask21				(ldf_mask21[1:0]),
 .ldf_mask22				(ldf_mask22[1:0]),
 .ldf_mask23				(ldf_mask23[1:0]),
 .ldf_mask24				(ldf_mask24[1:0]),
 .ldf_mask25				(ldf_mask25[1:0]),
 .ldf_mask26				(ldf_mask26[1:0]),
 .ldf_mask27				(ldf_mask27[1:0]),
 .ldf_mask28				(ldf_mask28[1:0]),
 .ldf_mask29				(ldf_mask29[1:0]),
 .ldf_mask30				(ldf_mask30[1:0]),
 .ldf_mask31				(ldf_mask31[1:0]),
 .ldf_mask32				(ldf_mask32[1:0]),
 .ldf_mask33				(ldf_mask33[1:0]),
 .ldf_mask34				(ldf_mask34[1:0]),
 .ldf_mask35				(ldf_mask35[1:0]),
 .ldf_mask36				(ldf_mask36[1:0]),
 .ldf_mask37				(ldf_mask37[1:0]),
 .ldf_mask38				(ldf_mask38[1:0]),
 .ldf_mask39				(ldf_mask39[1:0]),
 .ldf_mask40				(ldf_mask40[1:0]),
 .ldf_mask41				(ldf_mask41[1:0]),
 .ldf_mask42				(ldf_mask42[1:0]),
 .ldf_mask43				(ldf_mask43[1:0]),
 .ldf_mask44				(ldf_mask44[1:0]),
 .ldf_mask45				(ldf_mask45[1:0]),
 .ldf_mask46				(ldf_mask46[1:0]),
 .ldf_mask47				(ldf_mask47[1:0]),
 .ldf_mask48				(ldf_mask48[1:0]),
 .ldf_mask49				(ldf_mask49[1:0]),
 .ldf_mask50				(ldf_mask50[1:0]),
 .ldf_mask51				(ldf_mask51[1:0]),
 .ldf_mask52				(ldf_mask52[1:0]),
 .ldf_mask53				(ldf_mask53[1:0]),
 .ldf_mask54				(ldf_mask54[1:0]),
 .ldf_mask55				(ldf_mask55[1:0]),
 .ldf_mask56				(ldf_mask56[1:0]),
 .ldf_mask57				(ldf_mask57[1:0]),
 .ldf_mask58				(ldf_mask58[1:0]),
 .ldf_mask59				(ldf_mask59[1:0]),
 .ldf_mask60				(ldf_mask60[1:0]),
 .ldf_mask61				(ldf_mask61[1:0]),
 .ldf_mask62				(ldf_mask62[1:0]),
 .ldf_mask63				(ldf_mask63[1:0]),
 .ldf_mask64				(ldf_mask64[1:0]),
 .ldf_mask65				(ldf_mask65[1:0]),
 .ldf_mask66				(ldf_mask66[1:0]),
 .ldf_mask67				(ldf_mask67[1:0]),
 .ldf_mask68				(ldf_mask68[1:0]),
 .timer0				(timer0[5:0]),
 .timer1				(timer1[5:0]),
 .timer2				(timer2[5:0]),
 .timer3				(timer3[5:0]),
 .timer4				(timer4[5:0]),
 .timer5				(timer5[5:0]),
 .timer6				(timer6[5:0]),
 .timer7				(timer7[5:0]),
 .timer8				(timer8[5:0]),
 .timer9				(timer9[5:0]),
 .timer10				(timer10[5:0]),
 .timer11				(timer11[5:0]),
 .timer12				(timer12[5:0]),
 .timer13				(timer13[5:0]),
 .timer14				(timer14[5:0]),
 .timer15				(timer15[5:0]),
 .timer16				(timer16[5:0]),
 .timer17				(timer17[5:0]),
 .timer18				(timer18[5:0]),
 .timer19				(timer19[5:0]),
 .timer20				(timer20[5:0]),
 .timer21				(timer21[5:0]),
 .timer22				(timer22[5:0]),
 .timer23				(timer23[5:0]),
 .timer24				(timer24[5:0]),
 .timer25				(timer25[5:0]),
 .timer26				(timer26[5:0]),
 .timer27				(timer27[5:0]),
 .timer28				(timer28[5:0]),
 .timer29				(timer29[5:0]),
 .timer30				(timer30[5:0]),
 .timer31				(timer31[5:0]),
 .timer32				(timer32[5:0]),
 .timer33				(timer33[5:0]),
 .timer34				(timer34[5:0]),
 .timer35				(timer35[5:0]),
 .timer36				(timer36[5:0]),
 .timer37				(timer37[5:0]),
 .timer38				(timer38[5:0]),
 .timer39				(timer39[5:0]),
 .timer40				(timer40[5:0]),
 .timer41				(timer41[5:0]),
 .timer42				(timer42[5:0]),
 .timer43				(timer43[5:0]),
 .timer44				(timer44[5:0]),
 .timer45				(timer45[5:0]),
 .timer46				(timer46[5:0]),
 .timer47				(timer47[5:0]),
 .timer48				(timer48[5:0]),
 .timer49				(timer49[5:0]),
 .timer50				(timer50[5:0]),
 .timer51				(timer51[5:0]),
 .timer52				(timer52[5:0]),
 .timer53				(timer53[5:0]),
 .timer54				(timer54[5:0]),
 .timer55				(timer55[5:0]),
 .timer56				(timer56[5:0]),
 .timer57				(timer57[5:0]),
 .timer58				(timer58[5:0]),
 .timer59				(timer59[5:0]),
 .timer60				(timer60[5:0]),
 .timer61				(timer61[5:0]),
 .timer62				(timer62[5:0]),
 .timer63				(timer63[5:0]),
 .sys_err_mask				(sys_err_mask[10:0]),
 .smx_meta_intr_hld			(smx_meta_intr_hld),
 // Inputs
 .clk					(niu_clk),
 .reset					(reset),
 .niu_reset				(niu_reset),
 .addr					(addr_2[26:0]),
 .rd					(rd),
 .slv_sel_reg				(slv_sel_reg),
 .fzc_slv_sel_reg			(fzc_slv_sel_reg),
 .ldsv_sel_reg				(ldsv_sel_reg),
 .ldgim_sel_reg				(ldgim_sel_reg),
 .imask0_sel_reg			(imask0_sel_reg),
 .imask1_sel_reg			(imask1_sel_reg),
 .group					(group[5:0]),
`ifdef NEPTUNE
 .wr_data				(del_pio_clients_wdata[31:0]),
`else
 .wr_data				(pio_clients_wdata[31:0]),
`endif
 .pio_32b_wr                            (pio_32b_wr),
 .memship_group0			(memship_group0[68:0]),
 .memship_group1			(memship_group1[68:0]),
 .memship_group2			(memship_group2[68:0]),
 .memship_group3			(memship_group3[68:0]),
 .memship_group4			(memship_group4[68:0]),
 .memship_group5			(memship_group5[68:0]),
 .memship_group6			(memship_group6[68:0]),
 .memship_group7			(memship_group7[68:0]),
 .memship_group8			(memship_group8[68:0]),
 .memship_group9			(memship_group9[68:0]),
 .memship_group10			(memship_group10[68:0]),
 .memship_group11			(memship_group11[68:0]),
 .memship_group12			(memship_group12[68:0]),
 .memship_group13			(memship_group13[68:0]),
 .memship_group14			(memship_group14[68:0]),
 .memship_group15			(memship_group15[68:0]),
 .memship_group16			(memship_group16[68:0]),
 .memship_group17			(memship_group17[68:0]),
 .memship_group18			(memship_group18[68:0]),
 .memship_group19			(memship_group19[68:0]),
 .memship_group20			(memship_group20[68:0]),
 .memship_group21			(memship_group21[68:0]),
 .memship_group22			(memship_group22[68:0]),
 .memship_group23			(memship_group23[68:0]),
 .memship_group24			(memship_group24[68:0]),
 .memship_group25			(memship_group25[68:0]),
 .memship_group26			(memship_group26[68:0]),
 .memship_group27			(memship_group27[68:0]),
 .memship_group28			(memship_group28[68:0]),
 .memship_group29			(memship_group29[68:0]),
 .memship_group30			(memship_group30[68:0]),
 .memship_group31			(memship_group31[68:0]),
 .memship_group32			(memship_group32[68:0]),
 .memship_group33			(memship_group33[68:0]),
 .memship_group34			(memship_group34[68:0]),
 .memship_group35			(memship_group35[68:0]),
 .memship_group36			(memship_group36[68:0]),
 .memship_group37			(memship_group37[68:0]),
 .memship_group38			(memship_group38[68:0]),
 .memship_group39			(memship_group39[68:0]),
 .memship_group40			(memship_group40[68:0]),
 .memship_group41			(memship_group41[68:0]),
 .memship_group42			(memship_group42[68:0]),
 .memship_group43			(memship_group43[68:0]),
 .memship_group44			(memship_group44[68:0]),
 .memship_group45			(memship_group45[68:0]),
 .memship_group46			(memship_group46[68:0]),
 .memship_group47			(memship_group47[68:0]),
 .memship_group48			(memship_group48[68:0]),
 .memship_group49			(memship_group49[68:0]),
 .memship_group50			(memship_group50[68:0]),
 .memship_group51			(memship_group51[68:0]),
 .memship_group52			(memship_group52[68:0]),
 .memship_group53			(memship_group53[68:0]),
 .memship_group54			(memship_group54[68:0]),
 .memship_group55			(memship_group55[68:0]),
 .memship_group56			(memship_group56[68:0]),
 .memship_group57			(memship_group57[68:0]),
 .memship_group58			(memship_group58[68:0]),
 .memship_group59			(memship_group59[68:0]),
 .memship_group60			(memship_group60[68:0]),
 .memship_group61			(memship_group61[68:0]),
 .memship_group62			(memship_group62[68:0]),
 .memship_group63			(memship_group63[68:0]),
 .rst_at				(rst_at),
 .ldfi					(ldfi[68:0]),
 .ldfj					(ldfj[68:0]), 
 .arb_dirtid_en				(arb_dirtid_en), 
 .arb_dirtid_clr			(arb_dirtid_clr), 
 .arb_np_threshold			(arb_np_threshold[5:0]), 
 .arb_rd_threshold			(arb_rd_threshold[5:0]), 
 .arb_rdstat		        	(arb_rdstat[5:0]), 
 .arb_wrstat		        	(arb_wrstat[5:0]), 
 .TrainingVector		        (TrainingVector[31:0]),
 .arb_ctrl                              (arb_ctrl[31:0]),
 .arb_debug_vector                      (arb_debug_vector[31:0]),
 .mif_intr                              (mif_intr),
 .ipp_intr                              (ipp_intr),
 .fflp_intr                             (fflp_intr),
 .zcp_intr                              (zcp_intr),
 .txc_intr                              (txc_intr),
 .rdmc_intr                             (rdmc_intr),
 .meta_intr1                            (meta_intr1),
 .meta_intr2                            (meta_intr2),
`ifdef NEPTUNE
 .pim_intr                              (pim_intr),
 .gpio_dout			        (gpio_dout[15:0]),
 .gpio_din			        (gpio_din[15:0]),
 .gpio_en			        (gpio_en[15:0]),
 .debug_select			        (debug_select[5:0]));
`else
 .debug_select			        (debug_select[5:0]),
 .smx_intr                              (smx_intr),
 .smx_ctrl                              (smx_ctrl[31:0]),
 .smx_debug_vector                      (smx_debug_vector[31:0]),
 .smx_config_data			(smx_config_data[31:0]),
 .smx_status			        (smx_status[31:0]),
 .smx_intr_clr		                (clear_intr4smx));
`endif
   
niu_pio_ic niu_pio_ic 
(/*AUTOINST*/
 // Outputs
 .intr_valid				(intr_valid),
 .intr_invalid				(intr_invalid),
 .rst_at				(rst_at),
 .group					(group[5:0]),
 .memship_group0			(memship_group0[68:0]),
 .memship_group1			(memship_group1[68:0]),
 .memship_group2			(memship_group2[68:0]),
 .memship_group3			(memship_group3[68:0]),
 .memship_group4			(memship_group4[68:0]),
 .memship_group5			(memship_group5[68:0]),
 .memship_group6			(memship_group6[68:0]),
 .memship_group7			(memship_group7[68:0]),
 .memship_group8			(memship_group8[68:0]),
 .memship_group9			(memship_group9[68:0]),
 .memship_group10			(memship_group10[68:0]),
 .memship_group11			(memship_group11[68:0]),
 .memship_group12			(memship_group12[68:0]),
 .memship_group13			(memship_group13[68:0]),
 .memship_group14			(memship_group14[68:0]),
 .memship_group15			(memship_group15[68:0]),
 .memship_group16			(memship_group16[68:0]),
 .memship_group17			(memship_group17[68:0]),
 .memship_group18			(memship_group18[68:0]),
 .memship_group19			(memship_group19[68:0]),
 .memship_group20			(memship_group20[68:0]),
 .memship_group21			(memship_group21[68:0]),
 .memship_group22			(memship_group22[68:0]),
 .memship_group23			(memship_group23[68:0]),
 .memship_group24			(memship_group24[68:0]),
 .memship_group25			(memship_group25[68:0]),
 .memship_group26			(memship_group26[68:0]),
 .memship_group27			(memship_group27[68:0]),
 .memship_group28			(memship_group28[68:0]),
 .memship_group29			(memship_group29[68:0]),
 .memship_group30			(memship_group30[68:0]),
 .memship_group31			(memship_group31[68:0]),
 .memship_group32			(memship_group32[68:0]),
 .memship_group33			(memship_group33[68:0]),
 .memship_group34			(memship_group34[68:0]),
 .memship_group35			(memship_group35[68:0]),
 .memship_group36			(memship_group36[68:0]),
 .memship_group37			(memship_group37[68:0]),
 .memship_group38			(memship_group38[68:0]),
 .memship_group39			(memship_group39[68:0]),
 .memship_group40			(memship_group40[68:0]),
 .memship_group41			(memship_group41[68:0]),
 .memship_group42			(memship_group42[68:0]),
 .memship_group43			(memship_group43[68:0]),
 .memship_group44			(memship_group44[68:0]),
 .memship_group45			(memship_group45[68:0]),
 .memship_group46			(memship_group46[68:0]),
 .memship_group47			(memship_group47[68:0]),
 .memship_group48			(memship_group48[68:0]),
 .memship_group49			(memship_group49[68:0]),
 .memship_group50			(memship_group50[68:0]),
 .memship_group51			(memship_group51[68:0]),
 .memship_group52			(memship_group52[68:0]),
 .memship_group53			(memship_group53[68:0]),
 .memship_group54			(memship_group54[68:0]),
 .memship_group55			(memship_group55[68:0]),
 .memship_group56			(memship_group56[68:0]),
 .memship_group57			(memship_group57[68:0]),
 .memship_group58			(memship_group58[68:0]),
 .memship_group59			(memship_group59[68:0]),
 .memship_group60			(memship_group60[68:0]),
 .memship_group61			(memship_group61[68:0]),
 .memship_group62			(memship_group62[68:0]),
 .memship_group63			(memship_group63[68:0]),
 .ig_state		        	(ig_state[2:0]),
 // Inputs
 .clk					(niu_clk),
 .reset					(reset),
 .ldgn0					(ldgn0[5:0]),
 .ldgn1					(ldgn1[5:0]),
 .ldgn2					(ldgn2[5:0]),
 .ldgn3					(ldgn3[5:0]),
 .ldgn4					(ldgn4[5:0]),
 .ldgn5					(ldgn5[5:0]),
 .ldgn6					(ldgn6[5:0]),
 .ldgn7					(ldgn7[5:0]),
 .ldgn8					(ldgn8[5:0]),
 .ldgn9					(ldgn9[5:0]),
 .ldgn10				(ldgn10[5:0]),
 .ldgn11				(ldgn11[5:0]),
 .ldgn12				(ldgn12[5:0]),
 .ldgn13				(ldgn13[5:0]),
 .ldgn14				(ldgn14[5:0]),
 .ldgn15				(ldgn15[5:0]),
 .ldgn16				(ldgn16[5:0]),
 .ldgn17				(ldgn17[5:0]),
 .ldgn18				(ldgn18[5:0]),
 .ldgn19				(ldgn19[5:0]),
 .ldgn20				(ldgn20[5:0]),
 .ldgn21				(ldgn21[5:0]),
 .ldgn22				(ldgn22[5:0]),
 .ldgn23				(ldgn23[5:0]),
 .ldgn24				(ldgn24[5:0]),
 .ldgn25				(ldgn25[5:0]),
 .ldgn26				(ldgn26[5:0]),
 .ldgn27				(ldgn27[5:0]),
 .ldgn28				(ldgn28[5:0]),
 .ldgn29				(ldgn29[5:0]),
 .ldgn30				(ldgn30[5:0]),
 .ldgn31				(ldgn31[5:0]),
 .ldgn32				(ldgn32[5:0]),
 .ldgn33				(ldgn33[5:0]),
 .ldgn34				(ldgn34[5:0]),
 .ldgn35				(ldgn35[5:0]),
 .ldgn36				(ldgn36[5:0]),
 .ldgn37				(ldgn37[5:0]),
 .ldgn38				(ldgn38[5:0]),
 .ldgn39				(ldgn39[5:0]),
 .ldgn40				(ldgn40[5:0]),
 .ldgn41				(ldgn41[5:0]),
 .ldgn42				(ldgn42[5:0]),
 .ldgn43				(ldgn43[5:0]),
 .ldgn44				(ldgn44[5:0]),
 .ldgn45				(ldgn45[5:0]),
 .ldgn46				(ldgn46[5:0]),
 .ldgn47				(ldgn47[5:0]),
 .ldgn48				(ldgn48[5:0]),
 .ldgn49				(ldgn49[5:0]),
 .ldgn50				(ldgn50[5:0]),
 .ldgn51				(ldgn51[5:0]),
 .ldgn52				(ldgn52[5:0]),
 .ldgn53				(ldgn53[5:0]),
 .ldgn54				(ldgn54[5:0]),
 .ldgn55				(ldgn55[5:0]),
 .ldgn56				(ldgn56[5:0]),
 .ldgn57				(ldgn57[5:0]),
 .ldgn58				(ldgn58[5:0]),
 .ldgn59				(ldgn59[5:0]),
 .ldgn60				(ldgn60[5:0]),
 .ldgn61				(ldgn61[5:0]),
 .ldgn62				(ldgn62[5:0]),
 .ldgn63				(ldgn63[5:0]),
 .ldgn64				(ldgn64[5:0]),
 .ldgn65				(ldgn65[5:0]),
 .ldgn66				(ldgn66[5:0]),
 .ldgn67				(ldgn67[5:0]),
 .ldgn68				(ldgn68[5:0]),
 .ldf_mask0				(ldf_mask0[1:0]),
 .ldf_mask1				(ldf_mask1[1:0]),
 .ldf_mask2				(ldf_mask2[1:0]),
 .ldf_mask3				(ldf_mask3[1:0]),
 .ldf_mask4				(ldf_mask4[1:0]),
 .ldf_mask5				(ldf_mask5[1:0]),
 .ldf_mask6				(ldf_mask6[1:0]),
 .ldf_mask7				(ldf_mask7[1:0]),
 .ldf_mask8				(ldf_mask8[1:0]),
 .ldf_mask9				(ldf_mask9[1:0]),
 .ldf_mask10				(ldf_mask10[1:0]),
 .ldf_mask11				(ldf_mask11[1:0]),
 .ldf_mask12				(ldf_mask12[1:0]),
 .ldf_mask13				(ldf_mask13[1:0]),
 .ldf_mask14				(ldf_mask14[1:0]),
 .ldf_mask15				(ldf_mask15[1:0]),
 .ldf_mask16				(ldf_mask16[1:0]),
 .ldf_mask17				(ldf_mask17[1:0]),
 .ldf_mask18				(ldf_mask18[1:0]),
 .ldf_mask19				(ldf_mask19[1:0]),
 .ldf_mask20				(ldf_mask20[1:0]),
 .ldf_mask21				(ldf_mask21[1:0]),
 .ldf_mask22				(ldf_mask22[1:0]),
 .ldf_mask23				(ldf_mask23[1:0]),
 .ldf_mask24				(ldf_mask24[1:0]),
 .ldf_mask25				(ldf_mask25[1:0]),
 .ldf_mask26				(ldf_mask26[1:0]),
 .ldf_mask27				(ldf_mask27[1:0]),
 .ldf_mask28				(ldf_mask28[1:0]),
 .ldf_mask29				(ldf_mask29[1:0]),
 .ldf_mask30				(ldf_mask30[1:0]),
 .ldf_mask31				(ldf_mask31[1:0]),
 .ldf_mask32				(ldf_mask32[1:0]),
 .ldf_mask33				(ldf_mask33[1:0]),
 .ldf_mask34				(ldf_mask34[1:0]),
 .ldf_mask35				(ldf_mask35[1:0]),
 .ldf_mask36				(ldf_mask36[1:0]),
 .ldf_mask37				(ldf_mask37[1:0]),
 .ldf_mask38				(ldf_mask38[1:0]),
 .ldf_mask39				(ldf_mask39[1:0]),
 .ldf_mask40				(ldf_mask40[1:0]),
 .ldf_mask41				(ldf_mask41[1:0]),
 .ldf_mask42				(ldf_mask42[1:0]),
 .ldf_mask43				(ldf_mask43[1:0]),
 .ldf_mask44				(ldf_mask44[1:0]),
 .ldf_mask45				(ldf_mask45[1:0]),
 .ldf_mask46				(ldf_mask46[1:0]),
 .ldf_mask47				(ldf_mask47[1:0]),
 .ldf_mask48				(ldf_mask48[1:0]),
 .ldf_mask49				(ldf_mask49[1:0]),
 .ldf_mask50				(ldf_mask50[1:0]),
 .ldf_mask51				(ldf_mask51[1:0]),
 .ldf_mask52				(ldf_mask52[1:0]),
 .ldf_mask53				(ldf_mask53[1:0]),
 .ldf_mask54				(ldf_mask54[1:0]),
 .ldf_mask55				(ldf_mask55[1:0]),
 .ldf_mask56				(ldf_mask56[1:0]),
 .ldf_mask57				(ldf_mask57[1:0]),
 .ldf_mask58				(ldf_mask58[1:0]),
 .ldf_mask59				(ldf_mask59[1:0]),
 .ldf_mask60				(ldf_mask60[1:0]),
 .ldf_mask61				(ldf_mask61[1:0]),
 .ldf_mask62				(ldf_mask62[1:0]),
 .ldf_mask63				(ldf_mask63[1:0]),
 .ldf_mask64				(ldf_mask64[1:0]),
 .ldf_mask65				(ldf_mask65[1:0]),
 .ldf_mask66				(ldf_mask66[1:0]),
 .ldf_mask67				(ldf_mask67[1:0]),
 .ldf_mask68				(ldf_mask68[1:0]),
 .ldfi					(ldfi[68:0]),
 .ldfj					(ldfj[68:0]),
 .arm0					(arm0),
 .arm1					(arm1),
 .arm2					(arm2),
 .arm3					(arm3),
 .arm4					(arm4),
 .arm5					(arm5),
 .arm6					(arm6),
 .arm7					(arm7),
 .arm8					(arm8),
 .arm9					(arm9),
 .arm10					(arm10),
 .arm11					(arm11),
 .arm12					(arm12),
 .arm13					(arm13),
 .arm14					(arm14),
 .arm15					(arm15),
 .arm16					(arm16),
 .arm17					(arm17),
 .arm18					(arm18),
 .arm19					(arm19),
 .arm20					(arm20),
 .arm21					(arm21),
 .arm22					(arm22),
 .arm23					(arm23),
 .arm24					(arm24),
 .arm25					(arm25),
 .arm26					(arm26),
 .arm27					(arm27),
 .arm28					(arm28),
 .arm29					(arm29),
 .arm30					(arm30),
 .arm31					(arm31),
 .arm32					(arm32),
 .arm33					(arm33),
 .arm34					(arm34),
 .arm35					(arm35),
 .arm36					(arm36),
 .arm37					(arm37),
 .arm38					(arm38),
 .arm39					(arm39),
 .arm40					(arm40),
 .arm41					(arm41),
 .arm42					(arm42),
 .arm43					(arm43),
 .arm44					(arm44),
 .arm45					(arm45),
 .arm46					(arm46),
 .arm47					(arm47),
 .arm48					(arm48),
 .arm49					(arm49),
 .arm50					(arm50),
 .arm51					(arm51),
 .arm52					(arm52),
 .arm53					(arm53),
 .arm54					(arm54),
 .arm55					(arm55),
 .arm56					(arm56),
 .arm57					(arm57),
 .arm58					(arm58),
 .arm59					(arm59),
 .arm60					(arm60),
 .arm61					(arm61),
 .arm62					(arm62),
 .arm63					(arm63),
 .timer0				(timer0[5:0]),
 .timer1				(timer1[5:0]),
 .timer2				(timer2[5:0]),
 .timer3				(timer3[5:0]),
 .timer4				(timer4[5:0]),
 .timer5				(timer5[5:0]),
 .timer6				(timer6[5:0]),
 .timer7				(timer7[5:0]),
 .timer8				(timer8[5:0]),
 .timer9				(timer9[5:0]),
 .timer10				(timer10[5:0]),
 .timer11				(timer11[5:0]),
 .timer12				(timer12[5:0]),
 .timer13				(timer13[5:0]),
 .timer14				(timer14[5:0]),
 .timer15				(timer15[5:0]),
 .timer16				(timer16[5:0]),
 .timer17				(timer17[5:0]),
 .timer18				(timer18[5:0]),
 .timer19				(timer19[5:0]),
 .timer20				(timer20[5:0]),
 .timer21				(timer21[5:0]),
 .timer22				(timer22[5:0]),
 .timer23				(timer23[5:0]),
 .timer24				(timer24[5:0]),
 .timer25				(timer25[5:0]),
 .timer26				(timer26[5:0]),
 .timer27				(timer27[5:0]),
 .timer28				(timer28[5:0]),
 .timer29				(timer29[5:0]),
 .timer30				(timer30[5:0]),
 .timer31				(timer31[5:0]),
 .timer32				(timer32[5:0]),
 .timer33				(timer33[5:0]),
 .timer34				(timer34[5:0]),
 .timer35				(timer35[5:0]),
 .timer36				(timer36[5:0]),
 .timer37				(timer37[5:0]),
 .timer38				(timer38[5:0]),
 .timer39				(timer39[5:0]),
 .timer40				(timer40[5:0]),
 .timer41				(timer41[5:0]),
 .timer42				(timer42[5:0]),
 .timer43				(timer43[5:0]),
 .timer44				(timer44[5:0]),
 .timer45				(timer45[5:0]),
 .timer46				(timer46[5:0]),
 .timer47				(timer47[5:0]),
 .timer48				(timer48[5:0]),
 .timer49				(timer49[5:0]),
 .timer50				(timer50[5:0]),
 .timer51				(timer51[5:0]),
 .timer52				(timer52[5:0]),
 .timer53				(timer53[5:0]),
 .timer54				(timer54[5:0]),
 .timer55				(timer55[5:0]),
 .timer56				(timer56[5:0]),
 .timer57				(timer57[5:0]),
 .timer58				(timer58[5:0]),
 .timer59				(timer59[5:0]),
 .timer60				(timer60[5:0]),
 .timer61				(timer61[5:0]),
 .timer62				(timer62[5:0]),
 .timer63				(timer63[5:0]),
 .ibusy					(ibusy));


niu_pio_debug niu_pio_debug ( // Outputs
                                  .pio_debug_port(pio_debug_port[31:0]),
                                  // Inputs
                                  .SysClk(niu_clk),
                                  .Reset_L(niu_reset_l),
                                  .TrainingVector(TrainingVector[31:0]),
                                  .rd_ptr(rd_ptr[4:0]),
                                  .wr_ptr(wr_ptr[4:0]),
                                  .pio_rw_state(pio_rw_state[2:0]),
                                  .accepted_state(accepted_state[1:0]),
                                  .ig_state(ig_state[2:0]),
                                  .debug_select(debug_select[5:0]));

niu_pio_virt_decode niu_pio_virt_decode (
                                  .virt_addr(virt_addr[26:0]), 
                                  .pio_virt_sel_ok(pio_virt_sel_ok), 
                                  .fflp_virt_sel_ok(fflp_virt_sel_ok),
                                  .dma_virt_sel_ok(dma_virt_sel_ok),
                                  .addr(addr[26:0]), 
                                  .fc0_v(fc0_v), 
                                  .fc1_v(fc1_v), 
                                  .fc2_v(fc2_v), 
                                  .fc3_v(fc3_v)); 
`ifdef NEPTUNE

// instantiate spare here
wire	  [3:0] do_nad_0;
wire	  [3:0] do_nor_0;
wire	  [3:0] do_inv_0;
wire	  [3:0] do_mux_0;
wire	  [3:0] do_q_0;
wire		so_0;
wire	  [3:0] do_nad_1;
wire	  [3:0] do_nor_1;
wire	  [3:0] do_inv_1;
wire	  [3:0] do_mux_1;
wire	  [3:0] do_q_1;
wire		so_1;
wire	  [3:0] do_nad_2;
wire	  [3:0] do_nor_2;
wire	  [3:0] do_inv_2;
wire	  [3:0] do_mux_2;
wire	  [3:0] do_q_2;
wire		so_2;
wire	  [3:0] do_nad_3;
wire	  [3:0] do_nor_3;
wire	  [3:0] do_inv_3;
wire	  [3:0] do_mux_3;
wire	  [3:0] do_q_3;
wire		so_3;

niu_pio_spare niu_pio_spare_0 (
		.di_nd3	 ({1'h1, 1'h1, do_q_0[3]}),
		.di_nd2	 ({1'h1, 1'h1, do_q_0[2]}),
		.di_nd1	 ({1'h1, 1'h1, do_q_0[1]}),
		.di_nd0	 ({1'h1, 1'h1, do_q_0[0]}),
		.di_nr3	 ({1'h0, 1'h0}),
		.di_nr2	 ({1'h0, 1'h0}),
		.di_nr1	 ({1'h0, 1'h0}),
		.di_nr0	 ({1'h0, 1'h0}),
		.di_inv	 (do_nad_0[3:0]),
		.di_mx3	 ({1'h0, 1'h0}),
		.di_mx2	 ({1'h0, 1'h0}),
		.di_mx1	 ({1'h0, 1'h0}),
		.di_mx0	 ({1'h0, 1'h0}),
		.mx_sel	 (do_nor_0[3:0]),
		.di_reg	 (do_inv_0[3:0]),
		.wt_ena	 (do_mux_0[3:0]),
		.rst	 ({niu_reset_l,niu_reset_l,niu_reset_l,niu_reset_l}),
		.si	 (1'h0),
		.se	 (1'h0),
		.clk	 (niu_clk),
		.do_nad	 (do_nad_0[3:0]),
		.do_nor	 (do_nor_0[3:0]),
		.do_inv	 (do_inv_0[3:0]),
		.do_mux	 (do_mux_0[3:0]),
		.do_q	 (do_q_0[3:0]),
		.so	 (so_0)
		);

niu_pio_spare niu_pio_spare_1 (
		.di_nd3	 ({1'h1, 1'h1, do_q_1[3]}),
		.di_nd2	 ({1'h1, 1'h1, do_q_1[2]}),
		.di_nd1	 ({1'h1, 1'h1, do_q_1[1]}),
		.di_nd0	 ({1'h1, 1'h1, do_q_1[0]}),
		.di_nr3	 ({1'h0, 1'h0}),
		.di_nr2	 ({1'h0, 1'h0}),
		.di_nr1	 ({1'h0, 1'h0}),
		.di_nr0	 ({1'h0, 1'h0}),
		.di_inv	 (do_nad_1[3:0]),
		.di_mx3	 ({1'h0, 1'h0}),
		.di_mx2	 ({1'h0, 1'h0}),
		.di_mx1	 ({1'h0, 1'h0}),
		.di_mx0	 ({1'h0, 1'h0}),
		.mx_sel	 (do_nor_1[3:0]),
		.di_reg	 (do_inv_1[3:0]),
		.wt_ena	 (do_mux_1[3:0]),
		.rst	 ({niu_reset_l,niu_reset_l,niu_reset_l,niu_reset_l}),
		.si	 (1'h0),
		.se	 (1'h0),
		.clk	 (niu_clk),
		.do_nad	 (do_nad_1[3:0]),
		.do_nor	 (do_nor_1[3:0]),
		.do_inv	 (do_inv_1[3:0]),
		.do_mux	 (do_mux_1[3:0]),
		.do_q	 (do_q_1[3:0]),
		.so	 (so_1)
		);

niu_pio_spare niu_pio_spare_2 (
		.di_nd3	 ({1'h1, 1'h1, do_q_2[3]}),
		.di_nd2	 ({1'h1, 1'h1, do_q_2[2]}),
		.di_nd1	 ({1'h1, 1'h1, do_q_2[1]}),
		.di_nd0	 ({1'h1, 1'h1, do_q_2[0]}),
		.di_nr3	 ({1'h0, 1'h0}),
		.di_nr2	 ({1'h0, 1'h0}),
		.di_nr1	 ({1'h0, 1'h0}),
		.di_nr0	 ({1'h0, 1'h0}),
		.di_inv	 (do_nad_2[3:0]),
		.di_mx3	 ({1'h0, 1'h0}),
		.di_mx2	 ({1'h0, 1'h0}),
		.di_mx1	 ({1'h0, 1'h0}),
		.di_mx0	 ({1'h0, 1'h0}),
		.mx_sel	 (do_nor_2[3:0]),
		.di_reg	 (do_inv_2[3:0]),
		.wt_ena	 (do_mux_2[3:0]),
		.rst	 ({niu_reset_l,niu_reset_l,niu_reset_l,niu_reset_l}),
		.si	 (1'h0),
		.se	 (1'h0),
		.clk	 (niu_clk),
		.do_nad	 (do_nad_2[3:0]),
		.do_nor	 (do_nor_2[3:0]),
		.do_inv	 (do_inv_2[3:0]),
		.do_mux	 (do_mux_2[3:0]),
		.do_q	 (do_q_2[3:0]),
		.so	 (so_2)
		);

niu_pio_spare niu_pio_spare_3 (
		.di_nd3	 ({1'h1, 1'h1, do_q_3[3]}),
		.di_nd2	 ({1'h1, 1'h1, do_q_3[2]}),
		.di_nd1	 ({1'h1, 1'h1, do_q_3[1]}),
		.di_nd0	 ({1'h1, 1'h1, do_q_3[0]}),
		.di_nr3	 ({1'h0, 1'h0}),
		.di_nr2	 ({1'h0, 1'h0}),
		.di_nr1	 ({1'h0, 1'h0}),
		.di_nr0	 ({1'h0, 1'h0}),
		.di_inv	 (do_nad_3[3:0]),
		.di_mx3	 ({1'h0, 1'h0}),
		.di_mx2	 ({1'h0, 1'h0}),
		.di_mx1	 ({1'h0, 1'h0}),
		.di_mx0	 ({1'h0, 1'h0}),
		.mx_sel	 (do_nor_3[3:0]),
		.di_reg	 (do_inv_3[3:0]),
		.wt_ena	 (do_mux_3[3:0]),
		.rst	 ({niu_reset_l,niu_reset_l,niu_reset_l,niu_reset_l}),
		.si	 (1'h0),
		.se	 (1'h0),
		.clk	 (niu_clk),
		.do_nad	 (do_nad_3[3:0]),
		.do_nor	 (do_nor_3[3:0]),
		.do_inv	 (do_inv_3[3:0]),
		.do_mux	 (do_mux_3[3:0]),
		.do_q	 (do_q_3[3:0]),
		.so	 (so_3)
		);


`else
`endif
endmodule // niu_pio
