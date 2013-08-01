// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcusat_cov_mon.v
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
`include "cross_module.h"

`ifdef MCUSAT
  `include "mcu_dispmonDefines.vh"
`else
  `include "defines.vh"
  `include "dispmonDefines.vh"
`endif

// locally used defines
`define DRAM_L2IF0 `DCTLPATH0.l2if0
`define DRAM_L2IF1 `DCTLPATH0.l2if1
`define DRAM_L2IF2 `DCTLPATH1.l2if0
`define DRAM_L2IF3 `DCTLPATH1.l2if1
`define DRAM_L2IF4 `DCTLPATH2.l2if0
`define DRAM_L2IF5 `DCTLPATH2.l2if1
`define DRAM_L2IF6 `DCTLPATH3.l2if0
`define DRAM_L2IF7 `DCTLPATH3.l2if1

`define MCU_CLK		`TOP_MOD.cpu.mcu0.drl2clk

module mcusat_cov_mon ( clk, rst_l);

//--------------------------------------------------------------------------------------
// Interface (note that most of the stuff is cross-module referencing,
// so the interface is minimal
//--------------------------------------------------------------------------------------
  input clk;		// the cpu clock
  input rst_l;		// reset (active low).

//--------------------------------------------------------------------------------------
// a variable which decides should we print all mcusat_cov_mon messages
//--------------------------------------------------------------------------------------
  reg enabled;
  initial
  begin
    enabled = 1'b1;
    if ($test$plusargs("mcusat_cov_mon_disable"))
      enabled = 1'b0;
  end

// other declarations
//--------------------------------------------------------------------------------------
integer i,j;
// This has to be a define and its value need be updated depending on max time 
// allowed in the que, 1000 for now
wire [20:0] MAX_TIME = 1000000;

wire rst_wmr_protect = `CPU.rst_wmr_protect;

// logic for for 2-state simulation
wire    dram_rst_l_sig;
assign  dram_rst_l_sig = rst_l ;
reg dram_rst_l;
initial dram_rst_l = 0 ;

always @(posedge clk) begin
  while (dram_rst_l_sig !== 0) @(posedge clk) ;
  dram_rst_l = 0 ;
  while (dram_rst_l_sig !== 1) @(posedge clk) ;
  dram_rst_l = 1 ;
end


// address for schooming read and write with same address
// actual address is 0, but this is updated to indicate the autoprecharge condition.
wire [31:0] SCHMOO_RD_WR_ADDR = 32'h10; // identical to que_rd_addr_picked[31:0]
// cacheline not considered in the above case, it it here.
wire [34:0] SCHMOO_SCRB_ADDR  = {SCHMOO_RD_WR_ADDR[31:3], 3'b000, SCHMOO_RD_WR_ADDR[2:0]};

wire    cmp_clk;
wire    cmp_rst_l;
assign	cmp_clk = clk;
assign  cmp_rst_l = rst_l ;

//--------------------------------------------------------------------------------------
// RD and WR fifo 
//--------------------------------------------------------------------------------------
//`define DRAM_PATH0 `DRAM_PATH0.dramctl0.dram_dctl.dram_que
//`define DRAM_PATH1 `DRAM_PATH0.dramctl1.dram_dctl.dram_que
//`define DRAM_PATH2 `DRAM_PATH1.dramctl0.dram_dctl.dram_que
//`define DRAM_PATH3 `DRAM_PATH1.dramctl1.dram_dctl.dram_que
   // read que request 
   wire                   dram_Ch0_l2b0_rd_req    = `MCU0_L2IF0_CTL.l2t_mcu_rd_req;
   wire    [2:0]          dram_Ch0_l2b0_rd_id     = `MCU0_L2IF0_CTL.l2t_mcu_rd_req_id[2:0];
   wire                   dram_Ch0_l2b0_errq_vld   = (!`MCU0_DRIF_CTL.drif_err_fifo_empty) & (`MCU0_DRIF_CTL.rdpctl_err_fifo_data[0] == 0) ;
   wire    [2:0]          dram_Ch0_l2b0_errq_id   = `MCU0_DRIF_CTL.rdpctl_err_fifo_data[4:2];
   // read que
   wire  	dram_ch0_l2b0_rd_q_vld_0  = { ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0])) };

   wire  	dram_ch0_l2b0_rd_q_vld_1  = { ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1])) };

   wire  	dram_ch0_l2b0_rd_q_vld_2  = { ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2])) };

   wire  	dram_ch0_l2b0_rd_q_vld_3  = { ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3])) };

   wire  	dram_ch0_l2b0_rd_q_vld_4  = { ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4])) };

   wire  	dram_ch0_l2b0_rd_q_vld_5  = { ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5])) };

   wire  	dram_ch0_l2b0_rd_q_vld_6  = { ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6])) };

   wire  	dram_ch0_l2b0_rd_q_vld_7  = { ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7])) };

   wire  [7:0]	dram_ch0_l2b0_rd_q_valids = {dram_ch0_l2b0_rd_q_vld_7, dram_ch0_l2b0_rd_q_vld_6, dram_ch0_l2b0_rd_q_vld_5, dram_ch0_l2b0_rd_q_vld_4,
						   dram_ch0_l2b0_rd_q_vld_3, dram_ch0_l2b0_rd_q_vld_2, dram_ch0_l2b0_rd_q_vld_1, dram_ch0_l2b0_rd_q_vld_0};
   
// Read request Q PA-Error
   wire         dram_ch0_l2b0_rd_q_addr_err_0  = 
	{ ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch0_l2b0_rd_q_addr_err_1  = 
	{ ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent6[7]) };

   wire 	dram_ch0_l2b0_rd_q_addr_err_2  = 
	{ ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch0_l2b0_rd_q_addr_err_3  = 
	{ ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch0_l2b0_rd_q_addr_err_4  = 
	{ ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch0_l2b0_rd_q_addr_err_5  = 
	{ ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch0_l2b0_rd_q_addr_err_6  = 
	{ ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch0_l2b0_rd_q_addr_err_7  = 
	{ ((`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU0_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire  [7:0] dram_ch0_l2b0_rd_q_addr_err = {dram_ch0_l2b0_rd_q_addr_err_7, dram_ch0_l2b0_rd_q_addr_err_6, dram_ch0_l2b0_rd_q_addr_err_5, dram_ch0_l2b0_rd_q_addr_err_4,
						    dram_ch0_l2b0_rd_q_addr_err_3, dram_ch0_l2b0_rd_q_addr_err_2, dram_ch0_l2b0_rd_q_addr_err_1, dram_ch0_l2b0_rd_q_addr_err_0};

   wire  [7:0]  dram_ch0_l2b0_drq_rd_queue_valid	= {`MCU0_DRQ0_CTL.drq_rd_queue_valid[7:0]};    
   wire  [3:0]  dram_ch0_l2b0_drq_read_queue_cnt 		= {`MCU0_DRQ0_CTL.drq_read_queue_cnt[3:0]};      

// Read request Q PA-Error

   wire  [39:0]		dram_Ch0_l2b0_rd_q_0 	= {`MCU0_DRQ0_CTL.drq_rdbuf_valids[0],
                                                   `MCU0_L2B0_ADR_Q.rd_req_id_queue0[2:0],
						   `MCU0_L2B0_ADR_Q.rank_rd_adr_queue0[3:0],
						   `MCU0_L2B0_ADR_Q.bank_rd_adr_queue0[2:0],
						   `MCU0_L2B0_ADR_Q.ras_rd_adr_queue0[14:0],
						   `MCU0_L2B0_ADR_Q.cas_rd_adr_queue0[10:0],
						    3'b0 };

   wire  [39:0] 	dram_Ch0_l2b0_rd_q_1 	= {`MCU0_DRQ0_CTL.drq_rdbuf_valids[1],
                                                   `MCU0_L2B0_ADR_Q.rd_req_id_queue1[2:0],
                                                   `MCU0_L2B0_ADR_Q.rank_rd_adr_queue1[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_rd_adr_queue1[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_rd_adr_queue1[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_rd_adr_queue1[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b0_rd_q_2 	= {`MCU0_DRQ0_CTL.drq_rdbuf_valids[2],
                                                   `MCU0_L2B0_ADR_Q.rd_req_id_queue2[2:0],
                                                   `MCU0_L2B0_ADR_Q.rank_rd_adr_queue2[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_rd_adr_queue2[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_rd_adr_queue2[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_rd_adr_queue2[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b0_rd_q_3 	= {`MCU0_DRQ0_CTL.drq_rdbuf_valids[3],
                                                   `MCU0_L2B0_ADR_Q.rd_req_id_queue3[2:0],
                                                   `MCU0_L2B0_ADR_Q.rank_rd_adr_queue3[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_rd_adr_queue3[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_rd_adr_queue3[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_rd_adr_queue3[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b0_rd_q_4 	= {`MCU0_DRQ0_CTL.drq_rdbuf_valids[4],
                                                   `MCU0_L2B0_ADR_Q.rd_req_id_queue4[2:0],
                                                   `MCU0_L2B0_ADR_Q.rank_rd_adr_queue4[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_rd_adr_queue4[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_rd_adr_queue4[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_rd_adr_queue4[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b0_rd_q_5 	= {`MCU0_DRQ0_CTL.drq_rdbuf_valids[5],
                                                   `MCU0_L2B0_ADR_Q.rd_req_id_queue5[2:0],
                                                   `MCU0_L2B0_ADR_Q.rank_rd_adr_queue5[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_rd_adr_queue5[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_rd_adr_queue5[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_rd_adr_queue5[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b0_rd_q_6 	= {`MCU0_DRQ0_CTL.drq_rdbuf_valids[6],
                                                   `MCU0_L2B0_ADR_Q.rd_req_id_queue6[2:0],
                                                   `MCU0_L2B0_ADR_Q.rank_rd_adr_queue6[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_rd_adr_queue6[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_rd_adr_queue6[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_rd_adr_queue6[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b0_rd_q_7 	= {`MCU0_DRQ0_CTL.drq_rdbuf_valids[7],
                                                   `MCU0_L2B0_ADR_Q.rd_req_id_queue7[2:0],
                                                   `MCU0_L2B0_ADR_Q.rank_rd_adr_queue7[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_rd_adr_queue7[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_rd_adr_queue7[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_rd_adr_queue7[10:0], 
                                                    3'b0  };


   reg   [39:0]        	dram_Ch0_l2b0_rd_q[7:0];
   // read que collapsing fifo
   wire  [11:0]   	dram_Ch0_l2b0_rd_colps_q_0 	= {`MCU0_DRQ0_CTL.drq_rd_queue_ent0[11:0]};
   wire  [11:0]   	dram_Ch0_l2b0_rd_colps_q_1 	= {`MCU0_DRQ0_CTL.drq_rd_queue_ent1[11:0]};
   wire  [11:0]   	dram_Ch0_l2b0_rd_colps_q_2 	= {`MCU0_DRQ0_CTL.drq_rd_queue_ent2[11:0]};
   wire  [11:0]   	dram_Ch0_l2b0_rd_colps_q_3 	= {`MCU0_DRQ0_CTL.drq_rd_queue_ent3[11:0]};
   wire  [11:0]   	dram_Ch0_l2b0_rd_colps_q_4 	= {`MCU0_DRQ0_CTL.drq_rd_queue_ent4[11:0]};
   wire  [11:0]   	dram_Ch0_l2b0_rd_colps_q_5 	= {`MCU0_DRQ0_CTL.drq_rd_queue_ent5[11:0]};
   wire  [11:0]   	dram_Ch0_l2b0_rd_colps_q_6 	= {`MCU0_DRQ0_CTL.drq_rd_queue_ent6[11:0]};
   wire  [11:0]   	dram_Ch0_l2b0_rd_colps_q_7 	= {`MCU0_DRQ0_CTL.drq_rd_queue_ent7[11:0]};

   reg   [11:0]   	dram_Ch0_l2b0_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	dram_Ch0_l2b0_rd_que_wr_ptr 	= {`MCU0_DRQ0_CTL.drq_rd_adr_queue7_en,
                                                     	   `MCU0_DRQ0_CTL.drq_rd_adr_queue6_en,
                                                     	   `MCU0_DRQ0_CTL.drq_rd_adr_queue5_en,
                                                     	   `MCU0_DRQ0_CTL.drq_rd_adr_queue4_en,
                                                     	   `MCU0_DRQ0_CTL.drq_rd_adr_queue3_en,
                                                     	   `MCU0_DRQ0_CTL.drq_rd_adr_queue2_en,
                                                     	   `MCU0_DRQ0_CTL.drq_rd_adr_queue1_en,
                                                     	   `MCU0_DRQ0_CTL.drq_rd_adr_queue0_en};
   // read que read pointer 
   wire  [7:0]   	dram_Ch0_l2b0_rd_que_rd_ptr 	= {`MCU0_DRQ0_CTL.rdpctl_drq_clear_ent[7:0]};

   // write que request 
   wire                	dram_Ch0_l2b0_wr_req    = `MCU0_L2IF0_CTL.l2t_mcu_wr_req;
   wire    [2:0]       	dram_Ch0_l2b0_wr_addr   = `MCU0_L2IF0_CTL.l2if_data_wr_addr;

   wire  [7:0]  dram_ch0_l2b0_wr_q_valids		= {`MCU0_DRQ0_CTL.drq_wr_queue_valid[7:0]};	
   wire  [3:0]  dram_ch0_l2b0_drq_write_queue_cnt	= {`MCU0_DRQ0_CTL.drq_write_queue_cnt[3:0]};	

   wire  [40:0] 	dram_Ch0_l2b0_wr_q_0 	= {`MCU0_DRQ0_CTL.drq_wrbuf_valids[0],
                                                   `MCU0_DRQ0_CTL.drq_wrbuf_valids[0],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ0_CTL.drq_wr_queue_ent0[11:9],
                                                   `MCU0_L2B0_ADR_Q.rank_wr_adr_queue0[3:0],
						   `MCU0_L2B0_ADR_Q.bank_wr_adr_queue0[2:0],
						   `MCU0_L2B0_ADR_Q.ras_wr_adr_queue0[14:0],
						   `MCU0_L2B0_ADR_Q.cas_wr_adr_queue0[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b0_wr_q_1      = {`MCU0_DRQ0_CTL.drq_wrbuf_valids[1],
                                                   `MCU0_DRQ0_CTL.drq_wrbuf_valids[1],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ0_CTL.drq_wr_queue_ent1[11:9],
                                                   `MCU0_L2B0_ADR_Q.rank_wr_adr_queue1[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_wr_adr_queue1[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_wr_adr_queue1[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_wr_adr_queue1[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b0_wr_q_2      = {`MCU0_DRQ0_CTL.drq_wrbuf_valids[2],
                                                   `MCU0_DRQ0_CTL.drq_wrbuf_valids[2],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ0_CTL.drq_wr_queue_ent2[11:9],
                                                   `MCU0_L2B0_ADR_Q.rank_wr_adr_queue2[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_wr_adr_queue2[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_wr_adr_queue2[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_wr_adr_queue2[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b0_wr_q_3      = {`MCU0_DRQ0_CTL.drq_wrbuf_valids[3],
                                                   `MCU0_DRQ0_CTL.drq_wrbuf_valids[3],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ0_CTL.drq_wr_queue_ent3[11:9],
                                                   `MCU0_L2B0_ADR_Q.rank_wr_adr_queue3[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_wr_adr_queue3[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_wr_adr_queue3[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_wr_adr_queue3[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b0_wr_q_4      = {`MCU0_DRQ0_CTL.drq_wrbuf_valids[4],
                                                   `MCU0_DRQ0_CTL.drq_wrbuf_valids[4],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ0_CTL.drq_wr_queue_ent4[11:9],
                                                   `MCU0_L2B0_ADR_Q.rank_wr_adr_queue4[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_wr_adr_queue4[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_wr_adr_queue4[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_wr_adr_queue4[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b0_wr_q_5      = {`MCU0_DRQ0_CTL.drq_wrbuf_valids[5],
                                                   `MCU0_DRQ0_CTL.drq_wrbuf_valids[5],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ0_CTL.drq_wr_queue_ent5[11:9],
                                                   `MCU0_L2B0_ADR_Q.rank_wr_adr_queue5[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_wr_adr_queue5[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_wr_adr_queue5[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_wr_adr_queue5[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b0_wr_q_6      = {`MCU0_DRQ0_CTL.drq_wrbuf_valids[6],
                                                   `MCU0_DRQ0_CTL.drq_wrbuf_valids[6],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ0_CTL.drq_wr_queue_ent6[11:9],
                                                   `MCU0_L2B0_ADR_Q.rank_wr_adr_queue6[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_wr_adr_queue6[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_wr_adr_queue6[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_wr_adr_queue6[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b0_wr_q_7      = {`MCU0_DRQ0_CTL.drq_wrbuf_valids[7],
                                                   `MCU0_DRQ0_CTL.drq_wrbuf_valids[7],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ0_CTL.drq_wr_queue_ent7[11:9],
                                                   `MCU0_L2B0_ADR_Q.rank_wr_adr_queue7[3:0],
                                                   `MCU0_L2B0_ADR_Q.bank_wr_adr_queue7[2:0],
                                                   `MCU0_L2B0_ADR_Q.ras_wr_adr_queue7[14:0],
                                                   `MCU0_L2B0_ADR_Q.cas_wr_adr_queue7[10:0],
						    3'b0};

   reg   [40:0]        dram_Ch0_l2b0_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch0_l2b0_pa_err   = `MCU0_L2RDMX_DP.l2b0_wr_addr_err;

   // write que collapsing fifo
   wire  [14:0]		dram_Ch0_l2b0_wr_colps_q_0 	= {`MCU0_DRQ0_CTL.drq_wr_queue_ent0[14:0]};
   wire  [14:0]   	dram_Ch0_l2b0_wr_colps_q_1 	= {`MCU0_DRQ0_CTL.drq_wr_queue_ent1[14:0]};
   wire  [14:0]   	dram_Ch0_l2b0_wr_colps_q_2 	= {`MCU0_DRQ0_CTL.drq_wr_queue_ent2[14:0]};
   wire  [14:0]   	dram_Ch0_l2b0_wr_colps_q_3 	= {`MCU0_DRQ0_CTL.drq_wr_queue_ent3[14:0]};
   wire  [14:0]   	dram_Ch0_l2b0_wr_colps_q_4 	= {`MCU0_DRQ0_CTL.drq_wr_queue_ent4[14:0]};
   wire  [14:0]   	dram_Ch0_l2b0_wr_colps_q_5 	= {`MCU0_DRQ0_CTL.drq_wr_queue_ent5[14:0]};
   wire  [14:0]   	dram_Ch0_l2b0_wr_colps_q_6 	= {`MCU0_DRQ0_CTL.drq_wr_queue_ent6[14:0]};
   wire  [14:0]   	dram_Ch0_l2b0_wr_colps_q_7 	= {`MCU0_DRQ0_CTL.drq_wr_queue_ent7[14:0]};

   reg   [14:0]   	dram_Ch0_l2b0_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	dram_Ch0_l2b0_wr_que_wr_ptr 	= {`MCU0_DRQ0_CTL.drq_wr_adr_queue7_en,
                                                           `MCU0_DRQ0_CTL.drq_wr_adr_queue6_en,
                                                           `MCU0_DRQ0_CTL.drq_wr_adr_queue5_en,
                                                           `MCU0_DRQ0_CTL.drq_wr_adr_queue4_en,
                                                           `MCU0_DRQ0_CTL.drq_wr_adr_queue3_en,
                                                           `MCU0_DRQ0_CTL.drq_wr_adr_queue2_en,
                                                           `MCU0_DRQ0_CTL.drq_wr_adr_queue1_en,
                                                           `MCU0_DRQ0_CTL.drq_wr_adr_queue0_en};

   // write que arb read pointer 

   // write que data read pointer 
   /*wire  [7:0]          dram_Ch0_l2b0_wr_que_rd_ptr   = {`MCU0_DRQ0_CTL.drq_wr_entry7_rank,
                                                           `MCU0_DRQ0_CTL.drq_wr_entry6_rank,
                                                           `MCU0_DRQ0_CTL.drq_wr_entry5_rank,
                                                           `MCU0_DRQ0_CTL.drq_wr_entry4_rank,
                                                           `MCU0_DRQ0_CTL.drq_wr_entry3_rank,
                                                           `MCU0_DRQ0_CTL.drq_wr_entry2_rank,
                                                           `MCU0_DRQ0_CTL.drq_wr_entry1_rank,
                                                           `MCU0_DRQ0_CTL.drq_wr_entry0_rank};*/
   wire  [7:0]          dram_Ch0_l2b0_wr_que_rd_ptr   = `MCU0_DRQ0_CTL.drq_wrq_clear_ent;


// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch0_l2b0_que_b0_index_en   = {`MCU0_L2B0_ADR_Q.rd_adr_queue_sel[7:0]};


// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch0_l2b0_que_b0_wr_index_en= {`MCU0_L2B0_ADR_Q.wr_adr_queue_sel[7:0]};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch0_l2b0_que_b0_rd_in_val  =  `MCU0_DRQ0_CTL.drq_rd_entry0_val[7:0];

   wire                   dram_Ch0_que_b0_rd_picked           =  `MCU0_DRIF_CTL.drif0_rd_picked;
   wire                   dram_Ch0_que_b0_wr_picked           =  `MCU0_DRIF_CTL.drif0_wr_picked;
   // read que request 
   wire                   dram_Ch0_l2b1_rd_req    = `MCU0_L2IF1_CTL.l2t_mcu_rd_req;
   wire    [2:0]          dram_Ch0_l2b1_rd_id     = `MCU0_L2IF1_CTL.l2t_mcu_rd_req_id[2:0];
   wire                   dram_Ch0_l2b1_errq_vld   = (!`MCU0_DRIF_CTL.drif_err_fifo_empty) & (`MCU0_DRIF_CTL.rdpctl_err_fifo_data[0] == 1) ;
   wire    [2:0]          dram_Ch0_l2b1_errq_id   = `MCU0_DRIF_CTL.rdpctl_err_fifo_data[4:2];
   // read que
   wire  	dram_ch0_l2b1_rd_q_vld_0  = { ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0])) };

   wire  	dram_ch0_l2b1_rd_q_vld_1  = { ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1])) };

   wire  	dram_ch0_l2b1_rd_q_vld_2  = { ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2])) };

   wire  	dram_ch0_l2b1_rd_q_vld_3  = { ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3])) };

   wire  	dram_ch0_l2b1_rd_q_vld_4  = { ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4])) };

   wire  	dram_ch0_l2b1_rd_q_vld_5  = { ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5])) };

   wire  	dram_ch0_l2b1_rd_q_vld_6  = { ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6])) };

   wire  	dram_ch0_l2b1_rd_q_vld_7  = { ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7])) };

   wire  [7:0]	dram_ch0_l2b1_rd_q_valids = {dram_ch0_l2b1_rd_q_vld_7, dram_ch0_l2b1_rd_q_vld_6, dram_ch0_l2b1_rd_q_vld_5, dram_ch0_l2b1_rd_q_vld_4,
						   dram_ch0_l2b1_rd_q_vld_3, dram_ch0_l2b1_rd_q_vld_2, dram_ch0_l2b1_rd_q_vld_1, dram_ch0_l2b1_rd_q_vld_0};
   
// Read request Q PA-Error
   wire         dram_ch0_l2b1_rd_q_addr_err_0  = 
	{ ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch0_l2b1_rd_q_addr_err_1  = 
	{ ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent6[7]) };

   wire 	dram_ch0_l2b1_rd_q_addr_err_2  = 
	{ ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch0_l2b1_rd_q_addr_err_3  = 
	{ ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch0_l2b1_rd_q_addr_err_4  = 
	{ ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch0_l2b1_rd_q_addr_err_5  = 
	{ ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch0_l2b1_rd_q_addr_err_6  = 
	{ ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch0_l2b1_rd_q_addr_err_7  = 
	{ ((`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU0_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU0_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU0_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire  [7:0] dram_ch0_l2b1_rd_q_addr_err = {dram_ch0_l2b1_rd_q_addr_err_7, dram_ch0_l2b1_rd_q_addr_err_6, dram_ch0_l2b1_rd_q_addr_err_5, dram_ch0_l2b1_rd_q_addr_err_4,
						    dram_ch0_l2b1_rd_q_addr_err_3, dram_ch0_l2b1_rd_q_addr_err_2, dram_ch0_l2b1_rd_q_addr_err_1, dram_ch0_l2b1_rd_q_addr_err_0};

   wire  [7:0]  dram_ch0_l2b1_drq_rd_queue_valid	= {`MCU0_DRQ1_CTL.drq_rd_queue_valid[7:0]};    
   wire  [3:0]  dram_ch0_l2b1_drq_read_queue_cnt 		= {`MCU0_DRQ1_CTL.drq_read_queue_cnt[3:0]};      

// Read request Q PA-Error

   wire  [39:0]		dram_Ch0_l2b1_rd_q_0 	= {`MCU0_DRQ1_CTL.drq_rdbuf_valids[0],
                                                   `MCU0_L2B1_ADR_Q.rd_req_id_queue0[2:0],
						   `MCU0_L2B1_ADR_Q.rank_rd_adr_queue0[3:0],
						   `MCU0_L2B1_ADR_Q.bank_rd_adr_queue0[2:0],
						   `MCU0_L2B1_ADR_Q.ras_rd_adr_queue0[14:0],
						   `MCU0_L2B1_ADR_Q.cas_rd_adr_queue0[10:0],
						    3'b0 };

   wire  [39:0] 	dram_Ch0_l2b1_rd_q_1 	= {`MCU0_DRQ1_CTL.drq_rdbuf_valids[1],
                                                   `MCU0_L2B1_ADR_Q.rd_req_id_queue1[2:0],
                                                   `MCU0_L2B1_ADR_Q.rank_rd_adr_queue1[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_rd_adr_queue1[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_rd_adr_queue1[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_rd_adr_queue1[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b1_rd_q_2 	= {`MCU0_DRQ1_CTL.drq_rdbuf_valids[2],
                                                   `MCU0_L2B1_ADR_Q.rd_req_id_queue2[2:0],
                                                   `MCU0_L2B1_ADR_Q.rank_rd_adr_queue2[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_rd_adr_queue2[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_rd_adr_queue2[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_rd_adr_queue2[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b1_rd_q_3 	= {`MCU0_DRQ1_CTL.drq_rdbuf_valids[3],
                                                   `MCU0_L2B1_ADR_Q.rd_req_id_queue3[2:0],
                                                   `MCU0_L2B1_ADR_Q.rank_rd_adr_queue3[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_rd_adr_queue3[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_rd_adr_queue3[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_rd_adr_queue3[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b1_rd_q_4 	= {`MCU0_DRQ1_CTL.drq_rdbuf_valids[4],
                                                   `MCU0_L2B1_ADR_Q.rd_req_id_queue4[2:0],
                                                   `MCU0_L2B1_ADR_Q.rank_rd_adr_queue4[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_rd_adr_queue4[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_rd_adr_queue4[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_rd_adr_queue4[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b1_rd_q_5 	= {`MCU0_DRQ1_CTL.drq_rdbuf_valids[5],
                                                   `MCU0_L2B1_ADR_Q.rd_req_id_queue5[2:0],
                                                   `MCU0_L2B1_ADR_Q.rank_rd_adr_queue5[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_rd_adr_queue5[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_rd_adr_queue5[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_rd_adr_queue5[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b1_rd_q_6 	= {`MCU0_DRQ1_CTL.drq_rdbuf_valids[6],
                                                   `MCU0_L2B1_ADR_Q.rd_req_id_queue6[2:0],
                                                   `MCU0_L2B1_ADR_Q.rank_rd_adr_queue6[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_rd_adr_queue6[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_rd_adr_queue6[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_rd_adr_queue6[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch0_l2b1_rd_q_7 	= {`MCU0_DRQ1_CTL.drq_rdbuf_valids[7],
                                                   `MCU0_L2B1_ADR_Q.rd_req_id_queue7[2:0],
                                                   `MCU0_L2B1_ADR_Q.rank_rd_adr_queue7[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_rd_adr_queue7[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_rd_adr_queue7[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_rd_adr_queue7[10:0], 
                                                    3'b0  };


   reg   [39:0]        	dram_Ch0_l2b1_rd_q[7:0];
   // read que collapsing fifo
   wire  [11:0]   	dram_Ch0_l2b1_rd_colps_q_0 	= {`MCU0_DRQ1_CTL.drq_rd_queue_ent0[11:0]};
   wire  [11:0]   	dram_Ch0_l2b1_rd_colps_q_1 	= {`MCU0_DRQ1_CTL.drq_rd_queue_ent1[11:0]};
   wire  [11:0]   	dram_Ch0_l2b1_rd_colps_q_2 	= {`MCU0_DRQ1_CTL.drq_rd_queue_ent2[11:0]};
   wire  [11:0]   	dram_Ch0_l2b1_rd_colps_q_3 	= {`MCU0_DRQ1_CTL.drq_rd_queue_ent3[11:0]};
   wire  [11:0]   	dram_Ch0_l2b1_rd_colps_q_4 	= {`MCU0_DRQ1_CTL.drq_rd_queue_ent4[11:0]};
   wire  [11:0]   	dram_Ch0_l2b1_rd_colps_q_5 	= {`MCU0_DRQ1_CTL.drq_rd_queue_ent5[11:0]};
   wire  [11:0]   	dram_Ch0_l2b1_rd_colps_q_6 	= {`MCU0_DRQ1_CTL.drq_rd_queue_ent6[11:0]};
   wire  [11:0]   	dram_Ch0_l2b1_rd_colps_q_7 	= {`MCU0_DRQ1_CTL.drq_rd_queue_ent7[11:0]};

   reg   [11:0]   	dram_Ch0_l2b1_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	dram_Ch0_l2b1_rd_que_wr_ptr 	= {`MCU0_DRQ1_CTL.drq_rd_adr_queue7_en,
                                                     	   `MCU0_DRQ1_CTL.drq_rd_adr_queue6_en,
                                                     	   `MCU0_DRQ1_CTL.drq_rd_adr_queue5_en,
                                                     	   `MCU0_DRQ1_CTL.drq_rd_adr_queue4_en,
                                                     	   `MCU0_DRQ1_CTL.drq_rd_adr_queue3_en,
                                                     	   `MCU0_DRQ1_CTL.drq_rd_adr_queue2_en,
                                                     	   `MCU0_DRQ1_CTL.drq_rd_adr_queue1_en,
                                                     	   `MCU0_DRQ1_CTL.drq_rd_adr_queue0_en};
   // read que read pointer 
   wire  [7:0]   	dram_Ch0_l2b1_rd_que_rd_ptr 	= {`MCU0_DRQ1_CTL.rdpctl_drq_clear_ent[7:0]};

   // write que request 
   wire                	dram_Ch0_l2b1_wr_req    = `MCU0_L2IF1_CTL.l2t_mcu_wr_req;
   wire    [2:0]       	dram_Ch0_l2b1_wr_addr   = `MCU0_L2IF1_CTL.l2if_data_wr_addr;

   wire  [7:0]  dram_ch0_l2b1_wr_q_valids		= {`MCU0_DRQ1_CTL.drq_wr_queue_valid[7:0]};	
   wire  [3:0]  dram_ch0_l2b1_drq_write_queue_cnt	= {`MCU0_DRQ1_CTL.drq_write_queue_cnt[3:0]};	

   wire  [40:0] 	dram_Ch0_l2b1_wr_q_0 	= {`MCU0_DRQ1_CTL.drq_wrbuf_valids[0],
                                                   `MCU0_DRQ1_CTL.drq_wrbuf_valids[0],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ1_CTL.drq_wr_queue_ent0[11:9],
                                                   `MCU0_L2B1_ADR_Q.rank_wr_adr_queue0[3:0],
						   `MCU0_L2B1_ADR_Q.bank_wr_adr_queue0[2:0],
						   `MCU0_L2B1_ADR_Q.ras_wr_adr_queue0[14:0],
						   `MCU0_L2B1_ADR_Q.cas_wr_adr_queue0[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b1_wr_q_1      = {`MCU0_DRQ1_CTL.drq_wrbuf_valids[1],
                                                   `MCU0_DRQ1_CTL.drq_wrbuf_valids[1],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ1_CTL.drq_wr_queue_ent1[11:9],
                                                   `MCU0_L2B1_ADR_Q.rank_wr_adr_queue1[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_wr_adr_queue1[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_wr_adr_queue1[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_wr_adr_queue1[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b1_wr_q_2      = {`MCU0_DRQ1_CTL.drq_wrbuf_valids[2],
                                                   `MCU0_DRQ1_CTL.drq_wrbuf_valids[2],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ1_CTL.drq_wr_queue_ent2[11:9],
                                                   `MCU0_L2B1_ADR_Q.rank_wr_adr_queue2[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_wr_adr_queue2[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_wr_adr_queue2[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_wr_adr_queue2[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b1_wr_q_3      = {`MCU0_DRQ1_CTL.drq_wrbuf_valids[3],
                                                   `MCU0_DRQ1_CTL.drq_wrbuf_valids[3],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ1_CTL.drq_wr_queue_ent3[11:9],
                                                   `MCU0_L2B1_ADR_Q.rank_wr_adr_queue3[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_wr_adr_queue3[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_wr_adr_queue3[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_wr_adr_queue3[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b1_wr_q_4      = {`MCU0_DRQ1_CTL.drq_wrbuf_valids[4],
                                                   `MCU0_DRQ1_CTL.drq_wrbuf_valids[4],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ1_CTL.drq_wr_queue_ent4[11:9],
                                                   `MCU0_L2B1_ADR_Q.rank_wr_adr_queue4[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_wr_adr_queue4[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_wr_adr_queue4[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_wr_adr_queue4[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b1_wr_q_5      = {`MCU0_DRQ1_CTL.drq_wrbuf_valids[5],
                                                   `MCU0_DRQ1_CTL.drq_wrbuf_valids[5],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ1_CTL.drq_wr_queue_ent5[11:9],
                                                   `MCU0_L2B1_ADR_Q.rank_wr_adr_queue5[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_wr_adr_queue5[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_wr_adr_queue5[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_wr_adr_queue5[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b1_wr_q_6      = {`MCU0_DRQ1_CTL.drq_wrbuf_valids[6],
                                                   `MCU0_DRQ1_CTL.drq_wrbuf_valids[6],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ1_CTL.drq_wr_queue_ent6[11:9],
                                                   `MCU0_L2B1_ADR_Q.rank_wr_adr_queue6[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_wr_adr_queue6[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_wr_adr_queue6[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_wr_adr_queue6[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch0_l2b1_wr_q_7      = {`MCU0_DRQ1_CTL.drq_wrbuf_valids[7],
                                                   `MCU0_DRQ1_CTL.drq_wrbuf_valids[7],	//`DRAM_PATH0.writeqbank0vld0_arb,
                                                   `MCU0_DRQ1_CTL.drq_wr_queue_ent7[11:9],
                                                   `MCU0_L2B1_ADR_Q.rank_wr_adr_queue7[3:0],
                                                   `MCU0_L2B1_ADR_Q.bank_wr_adr_queue7[2:0],
                                                   `MCU0_L2B1_ADR_Q.ras_wr_adr_queue7[14:0],
                                                   `MCU0_L2B1_ADR_Q.cas_wr_adr_queue7[10:0],
						    3'b0};

   reg   [40:0]        dram_Ch0_l2b1_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch0_l2b1_pa_err   = `MCU0_L2RDMX_DP.l2b1_wr_addr_err;

   // write que collapsing fifo
   wire  [14:0]		dram_Ch0_l2b1_wr_colps_q_0 	= {`MCU0_DRQ1_CTL.drq_wr_queue_ent0[14:0]};
   wire  [14:0]   	dram_Ch0_l2b1_wr_colps_q_1 	= {`MCU0_DRQ1_CTL.drq_wr_queue_ent1[14:0]};
   wire  [14:0]   	dram_Ch0_l2b1_wr_colps_q_2 	= {`MCU0_DRQ1_CTL.drq_wr_queue_ent2[14:0]};
   wire  [14:0]   	dram_Ch0_l2b1_wr_colps_q_3 	= {`MCU0_DRQ1_CTL.drq_wr_queue_ent3[14:0]};
   wire  [14:0]   	dram_Ch0_l2b1_wr_colps_q_4 	= {`MCU0_DRQ1_CTL.drq_wr_queue_ent4[14:0]};
   wire  [14:0]   	dram_Ch0_l2b1_wr_colps_q_5 	= {`MCU0_DRQ1_CTL.drq_wr_queue_ent5[14:0]};
   wire  [14:0]   	dram_Ch0_l2b1_wr_colps_q_6 	= {`MCU0_DRQ1_CTL.drq_wr_queue_ent6[14:0]};
   wire  [14:0]   	dram_Ch0_l2b1_wr_colps_q_7 	= {`MCU0_DRQ1_CTL.drq_wr_queue_ent7[14:0]};

   reg   [14:0]   	dram_Ch0_l2b1_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	dram_Ch0_l2b1_wr_que_wr_ptr 	= {`MCU0_DRQ1_CTL.drq_wr_adr_queue7_en,
                                                           `MCU0_DRQ1_CTL.drq_wr_adr_queue6_en,
                                                           `MCU0_DRQ1_CTL.drq_wr_adr_queue5_en,
                                                           `MCU0_DRQ1_CTL.drq_wr_adr_queue4_en,
                                                           `MCU0_DRQ1_CTL.drq_wr_adr_queue3_en,
                                                           `MCU0_DRQ1_CTL.drq_wr_adr_queue2_en,
                                                           `MCU0_DRQ1_CTL.drq_wr_adr_queue1_en,
                                                           `MCU0_DRQ1_CTL.drq_wr_adr_queue0_en};

   // write que arb read pointer 

   // write que data read pointer 
   /*wire  [7:0]          dram_Ch0_l2b1_wr_que_rd_ptr   = {`MCU0_DRQ1_CTL.drq_wr_entry7_rank,
                                                           `MCU0_DRQ1_CTL.drq_wr_entry6_rank,
                                                           `MCU0_DRQ1_CTL.drq_wr_entry5_rank,
                                                           `MCU0_DRQ1_CTL.drq_wr_entry4_rank,
                                                           `MCU0_DRQ1_CTL.drq_wr_entry3_rank,
                                                           `MCU0_DRQ1_CTL.drq_wr_entry2_rank,
                                                           `MCU0_DRQ1_CTL.drq_wr_entry1_rank,
                                                           `MCU0_DRQ1_CTL.drq_wr_entry0_rank};*/
   wire  [7:0]          dram_Ch0_l2b1_wr_que_rd_ptr   = `MCU0_DRQ1_CTL.drq_wrq_clear_ent;


// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch0_l2b1_que_b0_index_en   = {`MCU0_L2B1_ADR_Q.rd_adr_queue_sel[7:0]};


// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch0_l2b1_que_b0_wr_index_en= {`MCU0_L2B1_ADR_Q.wr_adr_queue_sel[7:0]};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch0_l2b1_que_b0_rd_in_val  =  `MCU0_DRQ1_CTL.drq_rd_entry0_val[7:0];

   wire                   dram_Ch0_que_b1_rd_picked           =  `MCU0_DRIF_CTL.drif1_rd_picked;
   wire                   dram_Ch0_que_b1_wr_picked           =  `MCU0_DRIF_CTL.drif1_wr_picked;



// MAQ Not Required   wire  [7:0]            dram_Ch0_que_cas_picked    =  `MCU0_DRIF_CTL.drif_cas_picked_d1[7:0];
// rd hits a wr in the wr Q
   wire                   dram_Ch0_que_rd_wr_hit     =  `MCU0_DRIF_CTL.drif_wr_entry_pend_in;

// MAQ N2 doesn't support		// Signals that will be used to detect oldest entry to the same bank.
// MAQ N2 doesn't support		   // in 2 channel mode this is the real indicator that the request is picked from this channel
// MAQ N2 doesn't support		   wire                   dram_Ch0_que_this_ch_picked     =  (~`DRAM_PATH0.que_channel_disabled) ?
// MAQ N2 doesn't support		                           `DRAM_PATH0.que_ras_bank_picked_en && ~`DRAM_PATH0.que_channel_picked_internal:
// MAQ N2 doesn't support		                           `DRAM_PATH0.que_ras_bank_picked_en &&  `DRAM_PATH0.que_channel_picked_internal;
// MAQ N2 doesn't support		 

   wire  [2:0]            dram_Ch0_que_b0_index_picked        =  `MCU0_DRIF_CTL.drif_rdwr_index_picked[2:0];
   wire                   dram_Ch0_que_b0_cmd_picked          =  `MCU0_DRIF_CTL.drif_rdwr_cmd_picked;
   wire			  dram_ch0_drif_mclk_en		 = `MCU0_DRIF_CTL.drif_mclk_en;


//----------------------------------------------------------------------------------------
// Refresh to go and all CAS request to same CS are done, no new RAS issued.
//----------------------------------------------------------------------------------------
   wire  [4:0]   	  dram_Ch0_que_pos    	       = `MCU0_DRIF_CTL.drif_mcu_state_enc;
   wire          	  dram_Ch0_que_ref_go 	       = `MCU0_DRIF_CTL.drif_ref_go;
   wire          	  dram_Ch0_que_hw_selfrsh 	       = `MCU0_DRIF_CTL.drif_hw_selfrsh;
   wire          	  dram_Ch0_pt_blk_new_openbank_d1   = `MCU0_DRIF_CTL.drif_blk_new_openbank;
   wire  	   	  dram_Ch0_que_cas_valid 	       = ( (|(`MCU0_DRIF_CTL.drif_cas_picked)) &
								     (`MCU0_DRIF_CTL.drif_phy_bank_picked[1:0] == `MCU0_DRIF_CTL.drif_refresh_rank[1:0])
								 );
   wire	[15:0] 		  dram_Ch0_ras_picked               =  `MCU0_DRIF_CTL.drif_ras_picked[15:0];
   wire	 		  dram_Ch0_que_ras_picked           = ( (|(`MCU0_DRIF_CTL.drif_ras_picked[15:0])) &
								  ({`MCU0_DRIF_CTL.drif_rank_adr, `MCU0_DRIF_CTL.drif_stacked_dimm} == `MCU0_DRIF_CTL.drif_refresh_rank[1:0])
								 );
   wire  [1:0]   	  dram_Ch0_b0_phy_bank_bits 	       = `MCU0_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch0_b1_phy_bank_bits 	       = `MCU0_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch0_b2_phy_bank_bits 	       = `MCU0_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch0_b3_phy_bank_bits 	       = `MCU0_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch0_b4_phy_bank_bits 	       = `MCU0_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch0_b5_phy_bank_bits 	       = `MCU0_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch0_b6_phy_bank_bits 	       = `MCU0_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch0_b7_phy_bank_bits 	       = `MCU0_DRIF_CTL.drif_phy_bank_picked[1:0];
   reg   [1:0]   	  dram_Ch0_b_phy_bank_bits[7:0];

   wire  [1:0]   	  dram_Ch0_que_refresh_rank 	       = `MCU0_DRIF_CTL.drif_refresh_rank[1:0];


// ---- Starvation counter causing the wr to have priority ---
   wire     	  	dram_Ch0_que_pick_wr_first 	= (`MCU0_DRIF_CTL.drif0_pick_wr_first |
							`MCU0_DRIF_CTL.drif1_pick_wr_first);

// ------ Scrub Related -------

   // picking the que_split_scrb_addr as _que_scrb_addr_picked_
   wire  [31:0]   	  dram_Ch0_que_scrb_addr_picked 	= `MCU0_DRIF_CTL.drif_scrub_addr;
   wire           	  dram_Ch0_que_scrb_picked 		= `MCU0_DRIF_CTL.drif_scrub_picked;
   //somePersonwire           	  dram_Ch0_que_scrb_rd_picked 	= `MCU0_DRIF_CTL.drif_scrub_picked;	// MAQ
   wire           	  dram_Ch0_que_scrb_rd_picked 	= `MCU0_DRIF_CTL.drif_scrub_read_pending;
   wire           	  dram_Ch0_que_ras_bank_picked_en 	= |(`MCU0_DRIF_CTL.drif_ras_picked[15:0]);
   wire           	  dram_Ch0_que_scrb_write_req 	= `MCU0_DRIF_CTL.drif_scrub_write_req;

// req valid and scrb valid, the scrb should be cleared first
   wire  [15:0]   	  dram_Ch0_que_l2req_valid 	=  `MCU0_DRIF_CTL.drif0_rd_bank_valids | `MCU0_DRIF_CTL.drif1_rd_bank_valids |
							   `MCU0_DRIF_CTL.drif_wr_bank_valids;
   wire  [15:0]   	  dram_Ch0_scrb_indx_val   	=  `MCU0_DRIF_CTL.drif_scrub_entry_val;

// ------- DRAM REGISTERS --------

   wire  [8:0]   	  dram_Ch0_chip_config_reg 	        = {`MCU0_DRIF_CTL.drif_ras_addr_bits[3:0],
								  `MCU0_DRIF_CTL.drif_cas_addr_bits[3:0],
								  `MCU0_DRIF_CTL.drif_stacked_dimm};

   wire  [2:0]   	  dram_Ch0_mode_reg        	        = `MCU0_DRIF_CTL.mode_reg[6:4];
   wire  [3:0]   	  dram_Ch0_rrd_reg        	        = `MCU0_DRIF_CTL.rrd_reg;
   wire  [4:0]   	  dram_Ch0_rc_reg         	        = `MCU0_DRIF_CTL.rc_reg;
   wire  [3:0]   	  dram_Ch0_rcd_reg         	        = `MCU0_DRIF_CTL.rcd_reg;
   wire  [3:0]   	  dram_Ch0_wtr_dly_reg         	= `MCU0_DRIF_CTL.wtr_dly_reg;
   wire  [3:0]   	  dram_Ch0_rtw_dly_reg         	= `MCU0_DRIF_CTL.rtw_dly_reg;
   wire  [3:0]   	  dram_Ch0_rtp_reg         		= `MCU0_DRIF_CTL.rtp_reg;
   wire  [3:0]   	  dram_Ch0_ras_reg         		= `MCU0_DRIF_CTL.ras_reg;
   wire  [3:0]   	  dram_Ch0_rp_reg          		= `MCU0_DRIF_CTL.rp_reg;
   wire  [3:0]   	  dram_Ch0_wr_reg          		= `MCU0_DRIF_CTL.wr_reg;
   wire  [1:0]   	  dram_Ch0_mrd_reg          		= `MCU0_DRIF_CTL.mrd_reg;
   wire  [1:0]   	  dram_Ch0_iwtr_reg          	= `MCU0_DRIF_CTL.iwtr_reg;
   wire  [14:0]   	  dram_Ch0_ext_mode_reg2          	= `MCU0_DRIF_CTL.ext_mode_reg2;
   wire  [14:0]   	  dram_Ch0_ext_mode_reg1          	= `MCU0_DRIF_CTL.ext_mode_reg1;
   wire  [14:0]   	  dram_Ch0_ext_mode_reg3          	= `MCU0_DRIF_CTL.ext_mode_reg3;
   wire          	  dram_Ch0_que_eight_bank_mode       = `MCU0_DRIF_CTL.drif_eight_bank_mode;
   wire          	  dram_Ch0_que_rank1_present         = `MCU0_DRIF_CTL.drif_dimms_present[0];
   wire          	  dram_Ch0_que_channel_disabled      = `MCU0_DRIF_CTL.drif_branch_disabled;
   wire          	  dram_Ch0_que_addr_bank_low_sel     = `MCU0_DRIF_CTL.drif_addr_bank_low_sel;
   wire          	  dram_Ch0_que_init     		= `MCU0_DRIF_CTL.drif_init;
//   wire  [2:0]   	  dram_Ch0_que_data_del_cnt          = `MCU0_DRIF_CTL.drif_data_del_cnt[2:0];
//   wire          	  dram_Ch0_dram_io_pad_clk_inv       = `MCU0_DRIF_CTL.mcu_ddp_pad_clk_inv;
//   wire  [1:0]   	  dram_Ch0_dram_io_ptr_clk_inv       = `MCU0_DRIF_CTL.mcu_ddp_ptr_clk_inv;
   wire          	  dram_Ch0_que_wr_mode_reg_done      = `MCU0_DRIF_CTL.drif_wr_mode_reg_done;
   wire          	  dram_Ch0_que_init_status_reg       = `MCU0_DRIF_CTL.drif_init_status_reg;
   wire  [3:0]   	  dram_Ch0_que_dimms_present         = `MCU0_DRIF_CTL.drif_dimms_present;
   wire          	  dram_Ch0_dram_fail_over_mode       = `MCU0_DRIF_CTL.drif_fail_over_mode;
   wire  [34:0]  	  dram_Ch0_dram_fail_over_mask       = `MCU0_DRIF_CTL.drif_fail_over_mask[34:0];
   wire          	  dram_Ch0_que_dbg_trig_en	        = `MCU0_DRIF_CTL.rdpctl_dbg_trig_enable;
   wire  [22:0]  	  dram_Ch0_que_err_sts_reg	        = `MCU0_DRIF_CTL.rdpctl_err_sts_reg;
   wire  [35:0]  	  dram_Ch0_que_err_addr_reg	        = `MCU0_DRIF_CTL.rdpctl_err_addr_reg;
   wire          	  dram_Ch0_err_inj_reg	        = `MCU0_DRIF_CTL.drif_err_inj_reg;
   wire          	  dram_Ch0_sshot_err_reg	        = `MCU0_DRIF_CTL.drif_sshot_err_reg;
//   wire  [1:0]  	  dram_Ch0_que_err_cnt  	        = `MCU0_DRIF_CTL.rdpctl_err_cnt[17:16];
   wire  [35:0]  	  dram_Ch0_que_err_loc  	        = `MCU0_DRIF_CTL.rdpctl_err_loc;

   // NACK - for non existant register read
   wire          	  dram_Ch0_que_l2if_ack_vld	        = `MCU0_DRIF_CTL.drif_rdata_ack_vld;
   wire          	  dram_Ch0_que_l2if_nack_vld	        = `MCU0_DRIF_CTL.drif_rdata_nack_vld;

   wire          	  dram_Ch0_que_init_dram_done	= `MCU0_DRIF_CTL.drif_init_mcu_done;

// ----- DRAM L2IF INTERFACE -----

   wire  [127:0] 	  dram_Ch0_dram_sctag_data         	= `MCU0.mcu_l2b_data_r3;
   // Error signal for update of error status, error location and error address register.
   //wire          	  dram_Ch0_l2if_scrb_val_d2          = `DRAM_L2IF0.l2if_scrb_val_d3;

   // l2if_scrb_data_val is now qualifying scrb in the rtl
   wire          	  dram_Ch0_l2if_scrb_val_d2          = `MCU0_RDPCTL_CTL.rdpctl_scrub_data_valid;

   wire  [6:0]   	  dram_Ch0_err_sts_reg               = `MCU0_RDPCTL_CTL.rdpctl_err_sts_reg[25:19];

   wire          	  dram_Ch0_l2if_err_sts_reg_en6      = `MCU0_RDPCTL_CTL.rdpctl_meu_error_en;
   wire          	  dram_Ch0_l2if_err_sts_reg_en5      = `MCU0_RDPCTL_CTL.rdpctl_mec_error_en;
   wire          	  dram_Ch0_l2if_err_sts_reg_en4      = `MCU0_RDPCTL_CTL.rdpctl_dac_error_en;
   wire          	  dram_Ch0_l2if_err_sts_reg_en3      = `MCU0_RDPCTL_CTL.rdpctl_dau_error_en;
   wire          	  dram_Ch0_l2if_err_sts_reg_en2      = `MCU0_RDPCTL_CTL.rdpctl_dsc_error_en;
   wire          	  dram_Ch0_l2if_err_sts_reg_en1      = `MCU0_RDPCTL_CTL.rdpctl_dsu_error_en;
   wire          	  dram_Ch0_l2if_err_sts_reg_en0      = `MCU0_RDPCTL_CTL.rdpctl_err_sts_reg_en;
   wire          	  dram_Ch0_l2if_err_sts_reg_en       = `MCU0_RDPCTL_CTL.rdpctl_dbu_error_en;
   wire          	  dram_Ch0_l2if_err_addr_reg_en      = `MCU0_RDPCTL_CTL.rdpctl_err_addr_reg_en;
   wire          	  dram_Ch0_l2if_secc_loc_en          = `MCU0_RDPCTL_CTL.rdpctl_secc_loc_en;


   wire          	  dram_Ch0_l2b0_sctag_dram_rd_req 	= `MCU0_L2IF0_CTL.l2t_mcu_rd_req;
   wire  [2:0]   	  dram_Ch0_l2b0_sctag_dram_rd_req_id 	= `MCU0_L2IF0_CTL.l2t_mcu_rd_req_id;
//   wire  [39:6]   	  dram_Ch0_l2b0_sctag_dram_addr      	= {`MCU0_ADDRDP_DP.l2t0_mcu_addr_39to9, `MCU0_ADDRDP_DP.l2t0_mcu_addr_6to4};
   wire  [39:5]   	  dram_Ch0_l2b0_sctag_dram_addr      	= `MCU0_L2IF0_CTL.l2t_mcu_addr;
   wire          	  dram_Ch0_l2b0_sctag_dram_rd_dummy_req 	= `MCU0_L2IF0_CTL.l2t_mcu_rd_dummy_req;
   wire          	  dram_Ch0_l2b0_dram_sctag_rd_ack       	= `MCU0_L2IF0_CTL.mcu_l2t_rd_ack;
   wire          	  dram_Ch0_l2b0_sctag_dram_wr_req 	= `MCU0_L2IF0_CTL.l2t_mcu_wr_req;
   wire          	  dram_Ch0_l2b0_sctag_dram_data_vld 	= `MCU0_L2IF0_CTL.l2b_mcu_data_vld;
   wire  [63:0]  	  dram_Ch0_l2b0_sctag_dram_wr_data 	= `MCU0_L2RDMX_DP.l2b0_mcu_wr_data_r5;
   wire          	  dram_Ch0_l2b0_dram_sctag_wr_ack       	= `MCU0_L2IF0_CTL.mcu_l2t_wr_ack;
   wire          	  dram_Ch0_l2b0_dram_sctag_data_vld     	= `MCU0_RDATA_CTL.mcu_l2t0_data_vld_r0;
   wire  [2:0]   	  dram_Ch0_l2b0_dram_sctag_rd_req_id    	= `MCU0_RDATA_CTL.mcu_l2t0_rd_req_id_r0;

// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch0_l2if_b0_rd_val          	= `DRAM_L2IF0.l2if_b0_rd_val;
// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch0_l2if_b1_rd_val          	= `DRAM_L2IF0.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch0_l2b0_l2if_b0_wr_val          	= {`MCU0_L2IF0_CTL.l2if_wr_entry3,
									   `MCU0_L2IF0_CTL.l2if_wr_entry2,
									   `MCU0_L2IF0_CTL.l2if_wr_entry1,
									   `MCU0_L2IF0_CTL.l2if_wr_entry0};

   wire  [3:0]   	  dram_Ch0_l2b0_l2if_b1_wr_val          	= {`MCU0_L2IF0_CTL.l2if_wr_entry7, 
									   `MCU0_L2IF0_CTL.l2if_wr_entry6,
									   `MCU0_L2IF0_CTL.l2if_wr_entry5,
									   `MCU0_L2IF0_CTL.l2if_wr_entry4};

// MAQ   wire  [5:0]   	  dram_Ch0_l2b0_l2if_wr_b0_data_addr      = `MCU0_L2IF0_CTL.l2if_wdq_wadr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch0_l2b0_dram_sctag_secc_err       = `MCU0_RDATA_CTL.mcu_l2t0_secc_err_r3;
   wire          	  dram_Ch0_l2b0_dram_sctag_pa_err         = `MCU0_L2RDMX_DP.l2b0_rd_addr_err | `MCU0_L2RDMX_DP.l2b0_wr_addr_err;
   wire          	  dram_Ch0_l2b0_dram_sctag_mecc_err       = `MCU0_RDATA_CTL.mcu_l2t0_mecc_err_r3;
   wire          	  dram_Ch0_l2b0_dram_sctag_scb_secc_err   = `MCU0_RDATA_CTL.mcu_l2t0_scb_secc_err;
   wire          	  dram_Ch0_l2b0_dram_sctag_scb_mecc_err   = `MCU0_RDATA_CTL.mcu_l2t0_scb_mecc_err;

// qualified with vld since they can be on due to residual ( previous error )
/*   wire			dram_Ch0_l2b0_l2if_secc_err             = `MCU0_RDATA_CTL.mcu_l2t0_secc_err_r3 && 
								    (`MCU0_RDATA_CTL.mcu_l2t0_data_vld_r0 || 
								     `MCU0_RDPCTL_CTL.rdpctl_scrub_data_valid);

   wire          	  dram_Ch0_l2b0_l2if_mecc_err_partial     = `MCU0_RDATA_CTL.mcu_l2t0_mecc_err_r3 && 
									 (`MCU0_RDATA_CTL.mcu_l2t0_data_vld_r0 || 
									  `MCU0_RDPCTL_CTL.rdpctl_scrub_data_valid);
*/
   wire dram_Ch0_l2b0_l2if_secc_err = `MCU0_RDATA_CTL.mcu_l2t0_scb_secc_err_in ||
                                      `MCU0_RDATA_CTL.mcu_l2t0_secc_err_r1;
   wire dram_Ch0_l2b0_l2if_mecc_err_partial = `MCU0_RDATA_CTL.mcu_l2t0_scb_mecc_err_in ||
                                      `MCU0_RDATA_CTL.mcu_l2t0_mecc_err_r1;
   wire          	  dram_Ch0_l2b0_l2if_pa_err               = (`MCU0_L2RDMX_DP.l2b0_rd_addr_err || `MCU0_L2RDMX_DP.l2b0_wr_addr_err) && 
									`MCU0_RDATA_CTL.mcu_l2t0_data_vld_r0;

   wire  [1:0]   	  dram_Ch0_l2b0_cpu_wr_en                	= `MCU0_L2IF0_CTL.l2if_wdq_we;
   wire  [4:0]   	  dram_Ch0_l2b0_cpu_wr_addr               = `MCU0_L2IF0_CTL.l2if_wdq_wadr;
   wire  		  dram_Ch0_l2b0_wdq_rd_en			= `MCU0_DRIF_CTL.drif0_wdq_rd;
   wire  [4:0]   	  dram_Ch0_l2b0_wdq_radr			= `MCU0_DRIF_CTL.drif0_wdq_radr;

   wire          	  dram_Ch0_l2b0_clspine_dram_txrd_sync 	= `MCU0_RDATA_CTL.rdata_cmp_ddr_sync_en;
   wire          	  dram_Ch0_l2b0_clspine_dram_txwr_sync 	= `MCU0_RDATA_CTL.rdata_cmp_ddr_sync_en;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch0_l2b0_l2if_wr_entry             = {
                                                                  `MCU0_L2IF0_CTL.l2if_wr_entry7,
                                                                  `MCU0_L2IF0_CTL.l2if_wr_entry6,
                                                                  `MCU0_L2IF0_CTL.l2if_wr_entry5,
                                                                  `MCU0_L2IF0_CTL.l2if_wr_entry4,
                                                                  `MCU0_L2IF0_CTL.l2if_wr_entry3,
                                                                  `MCU0_L2IF0_CTL.l2if_wr_entry2,
                                                                  `MCU0_L2IF0_CTL.l2if_wr_entry1,
                                                                  `MCU0_L2IF0_CTL.l2if_wr_entry0
                                                                  };



/*  wire   [8:0]            dram_Ch0_l2b0_rd_adr_info_hi		 = {
                                                                  `MCU0_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU0_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU0_DRIF_CTL.drif_stack_adr,
                                                                  `MCU0_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU0_L2B0_ADRGEN_DP.bank_adr[2] && `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU0_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0	// `DRAM_L2IF0.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch0_l2b0_wr_adr_info_hi		 = {
                                                                  `MCU0_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU0_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU0_DRIF_CTL.drif_stack_adr,
                                                                  `MCU0_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU0_L2B0_ADRGEN_DP.bank_adr[2] && `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU0_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF0.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch0_l2b0_rd_adr_info_lo		 = {
                                                                  `MCU0_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU0_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU0_DRIF_CTL.drif_stack_adr,
                                                                  `MCU0_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU0_L2B0_ADRGEN_DP.bank_adr[2] && `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU0_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF0.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch0_l2b0_wr_adr_info_lo		 = {
                                                                  `MCU0_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU0_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU0_DRIF_CTL.drif_stack_adr,
                                                                  `MCU0_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU0_L2B0_ADRGEN_DP.bank_adr[2] && `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU0_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF0.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };*/
                                                                 

   wire          	  dram_Ch0_l2b1_sctag_dram_rd_req 	= `MCU0_L2IF1_CTL.l2t_mcu_rd_req;
   wire  [2:0]   	  dram_Ch0_l2b1_sctag_dram_rd_req_id 	= `MCU0_L2IF1_CTL.l2t_mcu_rd_req_id;
//   wire  [39:6]   	  dram_Ch0_l2b1_sctag_dram_addr      	= {`MCU0_ADDRDP_DP.l2t1_mcu_addr_39to9, `MCU0_ADDRDP_DP.l2t1_mcu_addr_6to4};
   wire  [39:5]   	  dram_Ch0_l2b1_sctag_dram_addr      	= `MCU0_L2IF1_CTL.l2t_mcu_addr;
   wire          	  dram_Ch0_l2b1_sctag_dram_rd_dummy_req 	= `MCU0_L2IF1_CTL.l2t_mcu_rd_dummy_req;
   wire          	  dram_Ch0_l2b1_dram_sctag_rd_ack       	= `MCU0_L2IF1_CTL.mcu_l2t_rd_ack;
   wire          	  dram_Ch0_l2b1_sctag_dram_wr_req 	= `MCU0_L2IF1_CTL.l2t_mcu_wr_req;
   wire          	  dram_Ch0_l2b1_sctag_dram_data_vld 	= `MCU0_L2IF1_CTL.l2b_mcu_data_vld;
   wire  [63:0]  	  dram_Ch0_l2b1_sctag_dram_wr_data 	= `MCU0_L2RDMX_DP.l2b1_mcu_wr_data_r5;
   wire          	  dram_Ch0_l2b1_dram_sctag_wr_ack       	= `MCU0_L2IF1_CTL.mcu_l2t_wr_ack;
   wire          	  dram_Ch0_l2b1_dram_sctag_data_vld     	= `MCU0_RDATA_CTL.mcu_l2t1_data_vld_r0;
   wire  [2:0]   	  dram_Ch0_l2b1_dram_sctag_rd_req_id    	= `MCU0_RDATA_CTL.mcu_l2t1_rd_req_id_r0;

// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch0_l2if_b0_rd_val          	= `DRAM_L2IF0.l2if_b0_rd_val;
// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch0_l2if_b1_rd_val          	= `DRAM_L2IF0.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch0_l2b1_l2if_b0_wr_val          	= {`MCU0_L2IF1_CTL.l2if_wr_entry3,
									   `MCU0_L2IF1_CTL.l2if_wr_entry2,
									   `MCU0_L2IF1_CTL.l2if_wr_entry1,
									   `MCU0_L2IF1_CTL.l2if_wr_entry0};

   wire  [3:0]   	  dram_Ch0_l2b1_l2if_b1_wr_val          	= {`MCU0_L2IF1_CTL.l2if_wr_entry7, 
									   `MCU0_L2IF1_CTL.l2if_wr_entry6,
									   `MCU0_L2IF1_CTL.l2if_wr_entry5,
									   `MCU0_L2IF1_CTL.l2if_wr_entry4};

// MAQ   wire  [5:0]   	  dram_Ch0_l2b1_l2if_wr_b0_data_addr      = `MCU0_L2IF1_CTL.l2if_wdq_wadr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch0_l2b1_dram_sctag_secc_err       = `MCU0_RDATA_CTL.mcu_l2t1_secc_err_r3;
   wire          	  dram_Ch0_l2b1_dram_sctag_pa_err         = `MCU0_L2RDMX_DP.l2b1_rd_addr_err | `MCU0_L2RDMX_DP.l2b1_wr_addr_err;
   wire          	  dram_Ch0_l2b1_dram_sctag_mecc_err       = `MCU0_RDATA_CTL.mcu_l2t1_mecc_err_r3;
   wire          	  dram_Ch0_l2b1_dram_sctag_scb_secc_err   = `MCU0_RDATA_CTL.mcu_l2t1_scb_secc_err;
   wire          	  dram_Ch0_l2b1_dram_sctag_scb_mecc_err   = `MCU0_RDATA_CTL.mcu_l2t1_scb_mecc_err;

// qualified with vld since they can be on due to residual ( previous error )
/*   wire			dram_Ch0_l2b1_l2if_secc_err             = `MCU0_RDATA_CTL.mcu_l2t1_secc_err_r3 && 
								    (`MCU0_RDATA_CTL.mcu_l2t1_data_vld_r0 || 
								     `MCU0_RDPCTL_CTL.rdpctl_scrub_data_valid);

   wire          	  dram_Ch0_l2b1_l2if_mecc_err_partial     = `MCU0_RDATA_CTL.mcu_l2t1_mecc_err_r3 && 
									 (`MCU0_RDATA_CTL.mcu_l2t1_data_vld_r0 || 
									  `MCU0_RDPCTL_CTL.rdpctl_scrub_data_valid);
*/
   wire dram_Ch0_l2b1_l2if_secc_err = `MCU0_RDATA_CTL.mcu_l2t1_scb_secc_err_in ||
                                      `MCU0_RDATA_CTL.mcu_l2t1_secc_err_r1;
   wire dram_Ch0_l2b1_l2if_mecc_err_partial = `MCU0_RDATA_CTL.mcu_l2t1_scb_mecc_err_in ||
                                      `MCU0_RDATA_CTL.mcu_l2t1_mecc_err_r1;
   wire          	  dram_Ch0_l2b1_l2if_pa_err               = (`MCU0_L2RDMX_DP.l2b1_rd_addr_err || `MCU0_L2RDMX_DP.l2b1_wr_addr_err) && 
									`MCU0_RDATA_CTL.mcu_l2t1_data_vld_r0;

   wire  [1:0]   	  dram_Ch0_l2b1_cpu_wr_en                	= `MCU0_L2IF1_CTL.l2if_wdq_we;
   wire  [4:0]   	  dram_Ch0_l2b1_cpu_wr_addr               = `MCU0_L2IF1_CTL.l2if_wdq_wadr;
   wire  		  dram_Ch0_l2b1_wdq_rd_en			= `MCU0_DRIF_CTL.drif1_wdq_rd;
   wire  [4:0]   	  dram_Ch0_l2b1_wdq_radr			= `MCU0_DRIF_CTL.drif1_wdq_radr;

   wire          	  dram_Ch0_l2b1_clspine_dram_txrd_sync 	= `MCU0_RDATA_CTL.rdata_cmp_ddr_sync_en;
   wire          	  dram_Ch0_l2b1_clspine_dram_txwr_sync 	= `MCU0_RDATA_CTL.rdata_cmp_ddr_sync_en;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch0_l2b1_l2if_wr_entry             = {
                                                                  `MCU0_L2IF1_CTL.l2if_wr_entry7,
                                                                  `MCU0_L2IF1_CTL.l2if_wr_entry6,
                                                                  `MCU0_L2IF1_CTL.l2if_wr_entry5,
                                                                  `MCU0_L2IF1_CTL.l2if_wr_entry4,
                                                                  `MCU0_L2IF1_CTL.l2if_wr_entry3,
                                                                  `MCU0_L2IF1_CTL.l2if_wr_entry2,
                                                                  `MCU0_L2IF1_CTL.l2if_wr_entry1,
                                                                  `MCU0_L2IF1_CTL.l2if_wr_entry0
                                                                  };



/*  wire   [8:0]            dram_Ch0_l2b1_rd_adr_info_hi		 = {
                                                                  `MCU0_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU0_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU0_DRIF_CTL.drif_stack_adr,
                                                                  `MCU0_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU0_L2B1_ADRGEN_DP.bank_adr[2] && `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU0_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0	// `DRAM_L2IF0.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch0_l2b1_wr_adr_info_hi		 = {
                                                                  `MCU0_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU0_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU0_DRIF_CTL.drif_stack_adr,
                                                                  `MCU0_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU0_L2B1_ADRGEN_DP.bank_adr[2] && `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU0_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF0.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch0_l2b1_rd_adr_info_lo		 = {
                                                                  `MCU0_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU0_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU0_DRIF_CTL.drif_stack_adr,
                                                                  `MCU0_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU0_L2B1_ADRGEN_DP.bank_adr[2] && `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU0_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF0.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch0_l2b1_wr_adr_info_lo		 = {
                                                                  `MCU0_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU0_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU0_DRIF_CTL.drif_stack_adr,
                                                                  `MCU0_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU0_L2B1_ADRGEN_DP.bank_adr[2] && `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU0_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU0_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF0.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };*/
                                                                 

 
// ---- Performance counters ----

   wire  [7:0]            dram_Ch0_perf_cntl          = `MCU0_DRIF_CTL.drif_perf_cntl_reg;
   wire                   dram_Ch0_cnt0_sticky_bit    = `MCU0_DRIF_CTL.drif_perf_cnt0_reg[31];
   wire                   dram_Ch0_cnt1_sticky_bit    = `MCU0_DRIF_CTL.drif_perf_cnt1_reg[31];

   // read que request 
   wire                   dram_Ch1_l2b0_rd_req    = `MCU1_L2IF0_CTL.l2t_mcu_rd_req;
   wire    [2:0]          dram_Ch1_l2b0_rd_id     = `MCU1_L2IF0_CTL.l2t_mcu_rd_req_id[2:0];
   wire                   dram_Ch1_l2b0_errq_vld   = (!`MCU1_DRIF_CTL.drif_err_fifo_empty) & (`MCU1_DRIF_CTL.rdpctl_err_fifo_data[0] == 0) ;
   wire    [2:0]          dram_Ch1_l2b0_errq_id   = `MCU1_DRIF_CTL.rdpctl_err_fifo_data[4:2];
   // read que
   wire  	dram_ch1_l2b0_rd_q_vld_0  = { ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0])) };

   wire  	dram_ch1_l2b0_rd_q_vld_1  = { ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1])) };

   wire  	dram_ch1_l2b0_rd_q_vld_2  = { ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2])) };

   wire  	dram_ch1_l2b0_rd_q_vld_3  = { ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3])) };

   wire  	dram_ch1_l2b0_rd_q_vld_4  = { ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4])) };

   wire  	dram_ch1_l2b0_rd_q_vld_5  = { ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5])) };

   wire  	dram_ch1_l2b0_rd_q_vld_6  = { ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6])) };

   wire  	dram_ch1_l2b0_rd_q_vld_7  = { ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7])) };

   wire  [7:0]	dram_ch1_l2b0_rd_q_valids = {dram_ch1_l2b0_rd_q_vld_7, dram_ch1_l2b0_rd_q_vld_6, dram_ch1_l2b0_rd_q_vld_5, dram_ch1_l2b0_rd_q_vld_4,
						   dram_ch1_l2b0_rd_q_vld_3, dram_ch1_l2b0_rd_q_vld_2, dram_ch1_l2b0_rd_q_vld_1, dram_ch1_l2b0_rd_q_vld_0};
   
// Read request Q PA-Error
   wire         dram_ch1_l2b0_rd_q_addr_err_0  = 
	{ ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch1_l2b0_rd_q_addr_err_1  = 
	{ ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent6[7]) };

   wire 	dram_ch1_l2b0_rd_q_addr_err_2  = 
	{ ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch1_l2b0_rd_q_addr_err_3  = 
	{ ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch1_l2b0_rd_q_addr_err_4  = 
	{ ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch1_l2b0_rd_q_addr_err_5  = 
	{ ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch1_l2b0_rd_q_addr_err_6  = 
	{ ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch1_l2b0_rd_q_addr_err_7  = 
	{ ((`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU1_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire  [7:0] dram_ch1_l2b0_rd_q_addr_err = {dram_ch1_l2b0_rd_q_addr_err_7, dram_ch1_l2b0_rd_q_addr_err_6, dram_ch1_l2b0_rd_q_addr_err_5, dram_ch1_l2b0_rd_q_addr_err_4,
						    dram_ch1_l2b0_rd_q_addr_err_3, dram_ch1_l2b0_rd_q_addr_err_2, dram_ch1_l2b0_rd_q_addr_err_1, dram_ch1_l2b0_rd_q_addr_err_0};

   wire  [7:0]  dram_ch1_l2b0_drq_rd_queue_valid	= {`MCU1_DRQ0_CTL.drq_rd_queue_valid[7:0]};    
   wire  [3:0]  dram_ch1_l2b0_drq_read_queue_cnt 		= {`MCU1_DRQ0_CTL.drq_read_queue_cnt[3:0]};      

// Read request Q PA-Error

   wire  [39:0]		dram_Ch1_l2b0_rd_q_0 	= {`MCU1_DRQ0_CTL.drq_rdbuf_valids[0],
                                                   `MCU1_L2B0_ADR_Q.rd_req_id_queue0[2:0],
						   `MCU1_L2B0_ADR_Q.rank_rd_adr_queue0[3:0],
						   `MCU1_L2B0_ADR_Q.bank_rd_adr_queue0[2:0],
						   `MCU1_L2B0_ADR_Q.ras_rd_adr_queue0[14:0],
						   `MCU1_L2B0_ADR_Q.cas_rd_adr_queue0[10:0],
						    3'b0 };

   wire  [39:0] 	dram_Ch1_l2b0_rd_q_1 	= {`MCU1_DRQ0_CTL.drq_rdbuf_valids[1],
                                                   `MCU1_L2B0_ADR_Q.rd_req_id_queue1[2:0],
                                                   `MCU1_L2B0_ADR_Q.rank_rd_adr_queue1[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_rd_adr_queue1[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_rd_adr_queue1[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_rd_adr_queue1[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b0_rd_q_2 	= {`MCU1_DRQ0_CTL.drq_rdbuf_valids[2],
                                                   `MCU1_L2B0_ADR_Q.rd_req_id_queue2[2:0],
                                                   `MCU1_L2B0_ADR_Q.rank_rd_adr_queue2[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_rd_adr_queue2[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_rd_adr_queue2[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_rd_adr_queue2[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b0_rd_q_3 	= {`MCU1_DRQ0_CTL.drq_rdbuf_valids[3],
                                                   `MCU1_L2B0_ADR_Q.rd_req_id_queue3[2:0],
                                                   `MCU1_L2B0_ADR_Q.rank_rd_adr_queue3[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_rd_adr_queue3[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_rd_adr_queue3[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_rd_adr_queue3[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b0_rd_q_4 	= {`MCU1_DRQ0_CTL.drq_rdbuf_valids[4],
                                                   `MCU1_L2B0_ADR_Q.rd_req_id_queue4[2:0],
                                                   `MCU1_L2B0_ADR_Q.rank_rd_adr_queue4[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_rd_adr_queue4[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_rd_adr_queue4[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_rd_adr_queue4[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b0_rd_q_5 	= {`MCU1_DRQ0_CTL.drq_rdbuf_valids[5],
                                                   `MCU1_L2B0_ADR_Q.rd_req_id_queue5[2:0],
                                                   `MCU1_L2B0_ADR_Q.rank_rd_adr_queue5[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_rd_adr_queue5[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_rd_adr_queue5[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_rd_adr_queue5[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b0_rd_q_6 	= {`MCU1_DRQ0_CTL.drq_rdbuf_valids[6],
                                                   `MCU1_L2B0_ADR_Q.rd_req_id_queue6[2:0],
                                                   `MCU1_L2B0_ADR_Q.rank_rd_adr_queue6[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_rd_adr_queue6[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_rd_adr_queue6[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_rd_adr_queue6[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b0_rd_q_7 	= {`MCU1_DRQ0_CTL.drq_rdbuf_valids[7],
                                                   `MCU1_L2B0_ADR_Q.rd_req_id_queue7[2:0],
                                                   `MCU1_L2B0_ADR_Q.rank_rd_adr_queue7[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_rd_adr_queue7[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_rd_adr_queue7[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_rd_adr_queue7[10:0], 
                                                    3'b0  };


   reg   [39:0]        	dram_Ch1_l2b0_rd_q[7:0];
   // read que collapsing fifo
   wire  [11:0]   	dram_Ch1_l2b0_rd_colps_q_0 	= {`MCU1_DRQ0_CTL.drq_rd_queue_ent0[11:0]};
   wire  [11:0]   	dram_Ch1_l2b0_rd_colps_q_1 	= {`MCU1_DRQ0_CTL.drq_rd_queue_ent1[11:0]};
   wire  [11:0]   	dram_Ch1_l2b0_rd_colps_q_2 	= {`MCU1_DRQ0_CTL.drq_rd_queue_ent2[11:0]};
   wire  [11:0]   	dram_Ch1_l2b0_rd_colps_q_3 	= {`MCU1_DRQ0_CTL.drq_rd_queue_ent3[11:0]};
   wire  [11:0]   	dram_Ch1_l2b0_rd_colps_q_4 	= {`MCU1_DRQ0_CTL.drq_rd_queue_ent4[11:0]};
   wire  [11:0]   	dram_Ch1_l2b0_rd_colps_q_5 	= {`MCU1_DRQ0_CTL.drq_rd_queue_ent5[11:0]};
   wire  [11:0]   	dram_Ch1_l2b0_rd_colps_q_6 	= {`MCU1_DRQ0_CTL.drq_rd_queue_ent6[11:0]};
   wire  [11:0]   	dram_Ch1_l2b0_rd_colps_q_7 	= {`MCU1_DRQ0_CTL.drq_rd_queue_ent7[11:0]};

   reg   [11:0]   	dram_Ch1_l2b0_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	dram_Ch1_l2b0_rd_que_wr_ptr 	= {`MCU1_DRQ0_CTL.drq_rd_adr_queue7_en,
                                                     	   `MCU1_DRQ0_CTL.drq_rd_adr_queue6_en,
                                                     	   `MCU1_DRQ0_CTL.drq_rd_adr_queue5_en,
                                                     	   `MCU1_DRQ0_CTL.drq_rd_adr_queue4_en,
                                                     	   `MCU1_DRQ0_CTL.drq_rd_adr_queue3_en,
                                                     	   `MCU1_DRQ0_CTL.drq_rd_adr_queue2_en,
                                                     	   `MCU1_DRQ0_CTL.drq_rd_adr_queue1_en,
                                                     	   `MCU1_DRQ0_CTL.drq_rd_adr_queue0_en};
   // read que read pointer 
   wire  [7:0]   	dram_Ch1_l2b0_rd_que_rd_ptr 	= {`MCU1_DRQ0_CTL.rdpctl_drq_clear_ent[7:0]};

   // write que request 
   wire                	dram_Ch1_l2b0_wr_req    = `MCU1_L2IF0_CTL.l2t_mcu_wr_req;
   wire    [2:0]       	dram_Ch1_l2b0_wr_addr   = `MCU1_L2IF0_CTL.l2if_data_wr_addr;

   wire  [7:0]  dram_ch1_l2b0_wr_q_valids		= {`MCU1_DRQ0_CTL.drq_wr_queue_valid[7:0]};	
   wire  [3:0]  dram_ch1_l2b0_drq_write_queue_cnt	= {`MCU1_DRQ0_CTL.drq_write_queue_cnt[3:0]};	

   wire  [40:0] 	dram_Ch1_l2b0_wr_q_0 	= {`MCU1_DRQ0_CTL.drq_wrbuf_valids[0],
                                                   `MCU1_DRQ0_CTL.drq_wrbuf_valids[0],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ0_CTL.drq_wr_queue_ent0[11:9],
                                                   `MCU1_L2B0_ADR_Q.rank_wr_adr_queue0[3:0],
						   `MCU1_L2B0_ADR_Q.bank_wr_adr_queue0[2:0],
						   `MCU1_L2B0_ADR_Q.ras_wr_adr_queue0[14:0],
						   `MCU1_L2B0_ADR_Q.cas_wr_adr_queue0[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b0_wr_q_1      = {`MCU1_DRQ0_CTL.drq_wrbuf_valids[1],
                                                   `MCU1_DRQ0_CTL.drq_wrbuf_valids[1],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ0_CTL.drq_wr_queue_ent1[11:9],
                                                   `MCU1_L2B0_ADR_Q.rank_wr_adr_queue1[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_wr_adr_queue1[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_wr_adr_queue1[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_wr_adr_queue1[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b0_wr_q_2      = {`MCU1_DRQ0_CTL.drq_wrbuf_valids[2],
                                                   `MCU1_DRQ0_CTL.drq_wrbuf_valids[2],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ0_CTL.drq_wr_queue_ent2[11:9],
                                                   `MCU1_L2B0_ADR_Q.rank_wr_adr_queue2[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_wr_adr_queue2[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_wr_adr_queue2[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_wr_adr_queue2[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b0_wr_q_3      = {`MCU1_DRQ0_CTL.drq_wrbuf_valids[3],
                                                   `MCU1_DRQ0_CTL.drq_wrbuf_valids[3],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ0_CTL.drq_wr_queue_ent3[11:9],
                                                   `MCU1_L2B0_ADR_Q.rank_wr_adr_queue3[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_wr_adr_queue3[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_wr_adr_queue3[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_wr_adr_queue3[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b0_wr_q_4      = {`MCU1_DRQ0_CTL.drq_wrbuf_valids[4],
                                                   `MCU1_DRQ0_CTL.drq_wrbuf_valids[4],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ0_CTL.drq_wr_queue_ent4[11:9],
                                                   `MCU1_L2B0_ADR_Q.rank_wr_adr_queue4[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_wr_adr_queue4[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_wr_adr_queue4[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_wr_adr_queue4[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b0_wr_q_5      = {`MCU1_DRQ0_CTL.drq_wrbuf_valids[5],
                                                   `MCU1_DRQ0_CTL.drq_wrbuf_valids[5],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ0_CTL.drq_wr_queue_ent5[11:9],
                                                   `MCU1_L2B0_ADR_Q.rank_wr_adr_queue5[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_wr_adr_queue5[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_wr_adr_queue5[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_wr_adr_queue5[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b0_wr_q_6      = {`MCU1_DRQ0_CTL.drq_wrbuf_valids[6],
                                                   `MCU1_DRQ0_CTL.drq_wrbuf_valids[6],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ0_CTL.drq_wr_queue_ent6[11:9],
                                                   `MCU1_L2B0_ADR_Q.rank_wr_adr_queue6[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_wr_adr_queue6[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_wr_adr_queue6[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_wr_adr_queue6[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b0_wr_q_7      = {`MCU1_DRQ0_CTL.drq_wrbuf_valids[7],
                                                   `MCU1_DRQ0_CTL.drq_wrbuf_valids[7],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ0_CTL.drq_wr_queue_ent7[11:9],
                                                   `MCU1_L2B0_ADR_Q.rank_wr_adr_queue7[3:0],
                                                   `MCU1_L2B0_ADR_Q.bank_wr_adr_queue7[2:0],
                                                   `MCU1_L2B0_ADR_Q.ras_wr_adr_queue7[14:0],
                                                   `MCU1_L2B0_ADR_Q.cas_wr_adr_queue7[10:0],
						    3'b0};

   reg   [40:0]        dram_Ch1_l2b0_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch1_l2b0_pa_err   = `MCU1_L2RDMX_DP.l2b0_wr_addr_err;

   // write que collapsing fifo
   wire  [14:0]		dram_Ch1_l2b0_wr_colps_q_0 	= {`MCU1_DRQ0_CTL.drq_wr_queue_ent0[14:0]};
   wire  [14:0]   	dram_Ch1_l2b0_wr_colps_q_1 	= {`MCU1_DRQ0_CTL.drq_wr_queue_ent1[14:0]};
   wire  [14:0]   	dram_Ch1_l2b0_wr_colps_q_2 	= {`MCU1_DRQ0_CTL.drq_wr_queue_ent2[14:0]};
   wire  [14:0]   	dram_Ch1_l2b0_wr_colps_q_3 	= {`MCU1_DRQ0_CTL.drq_wr_queue_ent3[14:0]};
   wire  [14:0]   	dram_Ch1_l2b0_wr_colps_q_4 	= {`MCU1_DRQ0_CTL.drq_wr_queue_ent4[14:0]};
   wire  [14:0]   	dram_Ch1_l2b0_wr_colps_q_5 	= {`MCU1_DRQ0_CTL.drq_wr_queue_ent5[14:0]};
   wire  [14:0]   	dram_Ch1_l2b0_wr_colps_q_6 	= {`MCU1_DRQ0_CTL.drq_wr_queue_ent6[14:0]};
   wire  [14:0]   	dram_Ch1_l2b0_wr_colps_q_7 	= {`MCU1_DRQ0_CTL.drq_wr_queue_ent7[14:0]};

   reg   [14:0]   	dram_Ch1_l2b0_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	dram_Ch1_l2b0_wr_que_wr_ptr 	= {`MCU1_DRQ0_CTL.drq_wr_adr_queue7_en,
                                                           `MCU1_DRQ0_CTL.drq_wr_adr_queue6_en,
                                                           `MCU1_DRQ0_CTL.drq_wr_adr_queue5_en,
                                                           `MCU1_DRQ0_CTL.drq_wr_adr_queue4_en,
                                                           `MCU1_DRQ0_CTL.drq_wr_adr_queue3_en,
                                                           `MCU1_DRQ0_CTL.drq_wr_adr_queue2_en,
                                                           `MCU1_DRQ0_CTL.drq_wr_adr_queue1_en,
                                                           `MCU1_DRQ0_CTL.drq_wr_adr_queue0_en};

   // write que arb read pointer 

   // write que data read pointer 
   /*wire  [7:0]          dram_Ch1_l2b0_wr_que_rd_ptr   = {`MCU1_DRQ0_CTL.drq_wr_entry7_rank,
                                                           `MCU1_DRQ0_CTL.drq_wr_entry6_rank,
                                                           `MCU1_DRQ0_CTL.drq_wr_entry5_rank,
                                                           `MCU1_DRQ0_CTL.drq_wr_entry4_rank,
                                                           `MCU1_DRQ0_CTL.drq_wr_entry3_rank,
                                                           `MCU1_DRQ0_CTL.drq_wr_entry2_rank,
                                                           `MCU1_DRQ0_CTL.drq_wr_entry1_rank,
                                                           `MCU1_DRQ0_CTL.drq_wr_entry0_rank};*/
   wire  [7:0]          dram_Ch1_l2b0_wr_que_rd_ptr   = `MCU1_DRQ0_CTL.drq_wrq_clear_ent;


// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch1_l2b0_que_b0_index_en   = {`MCU1_L2B0_ADR_Q.rd_adr_queue_sel[7:0]};


// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch1_l2b0_que_b0_wr_index_en= {`MCU1_L2B0_ADR_Q.wr_adr_queue_sel[7:0]};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch1_l2b0_que_b0_rd_in_val  =  `MCU1_DRQ0_CTL.drq_rd_entry0_val[7:0];

   wire                   dram_Ch1_que_b0_rd_picked           =  `MCU1_DRIF_CTL.drif0_rd_picked;
   wire                   dram_Ch1_que_b0_wr_picked           =  `MCU1_DRIF_CTL.drif0_wr_picked;
   // read que request 
   wire                   dram_Ch1_l2b1_rd_req    = `MCU1_L2IF1_CTL.l2t_mcu_rd_req;
   wire    [2:0]          dram_Ch1_l2b1_rd_id     = `MCU1_L2IF1_CTL.l2t_mcu_rd_req_id[2:0];
   wire                   dram_Ch1_l2b1_errq_vld   = (!`MCU1_DRIF_CTL.drif_err_fifo_empty) & (`MCU1_DRIF_CTL.rdpctl_err_fifo_data[0] == 1) ;
   wire    [2:0]          dram_Ch1_l2b1_errq_id   = `MCU1_DRIF_CTL.rdpctl_err_fifo_data[4:2];
   // read que
   wire  	dram_ch1_l2b1_rd_q_vld_0  = { ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0])) };

   wire  	dram_ch1_l2b1_rd_q_vld_1  = { ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1])) };

   wire  	dram_ch1_l2b1_rd_q_vld_2  = { ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2])) };

   wire  	dram_ch1_l2b1_rd_q_vld_3  = { ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3])) };

   wire  	dram_ch1_l2b1_rd_q_vld_4  = { ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4])) };

   wire  	dram_ch1_l2b1_rd_q_vld_5  = { ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5])) };

   wire  	dram_ch1_l2b1_rd_q_vld_6  = { ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6])) };

   wire  	dram_ch1_l2b1_rd_q_vld_7  = { ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7])) };

   wire  [7:0]	dram_ch1_l2b1_rd_q_valids = {dram_ch1_l2b1_rd_q_vld_7, dram_ch1_l2b1_rd_q_vld_6, dram_ch1_l2b1_rd_q_vld_5, dram_ch1_l2b1_rd_q_vld_4,
						   dram_ch1_l2b1_rd_q_vld_3, dram_ch1_l2b1_rd_q_vld_2, dram_ch1_l2b1_rd_q_vld_1, dram_ch1_l2b1_rd_q_vld_0};
   
// Read request Q PA-Error
   wire         dram_ch1_l2b1_rd_q_addr_err_0  = 
	{ ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch1_l2b1_rd_q_addr_err_1  = 
	{ ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent6[7]) };

   wire 	dram_ch1_l2b1_rd_q_addr_err_2  = 
	{ ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch1_l2b1_rd_q_addr_err_3  = 
	{ ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch1_l2b1_rd_q_addr_err_4  = 
	{ ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch1_l2b1_rd_q_addr_err_5  = 
	{ ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch1_l2b1_rd_q_addr_err_6  = 
	{ ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch1_l2b1_rd_q_addr_err_7  = 
	{ ((`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU1_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU1_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU1_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire  [7:0] dram_ch1_l2b1_rd_q_addr_err = {dram_ch1_l2b1_rd_q_addr_err_7, dram_ch1_l2b1_rd_q_addr_err_6, dram_ch1_l2b1_rd_q_addr_err_5, dram_ch1_l2b1_rd_q_addr_err_4,
						    dram_ch1_l2b1_rd_q_addr_err_3, dram_ch1_l2b1_rd_q_addr_err_2, dram_ch1_l2b1_rd_q_addr_err_1, dram_ch1_l2b1_rd_q_addr_err_0};

   wire  [7:0]  dram_ch1_l2b1_drq_rd_queue_valid	= {`MCU1_DRQ1_CTL.drq_rd_queue_valid[7:0]};    
   wire  [3:0]  dram_ch1_l2b1_drq_read_queue_cnt 		= {`MCU1_DRQ1_CTL.drq_read_queue_cnt[3:0]};      

// Read request Q PA-Error

   wire  [39:0]		dram_Ch1_l2b1_rd_q_0 	= {`MCU1_DRQ1_CTL.drq_rdbuf_valids[0],
                                                   `MCU1_L2B1_ADR_Q.rd_req_id_queue0[2:0],
						   `MCU1_L2B1_ADR_Q.rank_rd_adr_queue0[3:0],
						   `MCU1_L2B1_ADR_Q.bank_rd_adr_queue0[2:0],
						   `MCU1_L2B1_ADR_Q.ras_rd_adr_queue0[14:0],
						   `MCU1_L2B1_ADR_Q.cas_rd_adr_queue0[10:0],
						    3'b0 };

   wire  [39:0] 	dram_Ch1_l2b1_rd_q_1 	= {`MCU1_DRQ1_CTL.drq_rdbuf_valids[1],
                                                   `MCU1_L2B1_ADR_Q.rd_req_id_queue1[2:0],
                                                   `MCU1_L2B1_ADR_Q.rank_rd_adr_queue1[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_rd_adr_queue1[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_rd_adr_queue1[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_rd_adr_queue1[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b1_rd_q_2 	= {`MCU1_DRQ1_CTL.drq_rdbuf_valids[2],
                                                   `MCU1_L2B1_ADR_Q.rd_req_id_queue2[2:0],
                                                   `MCU1_L2B1_ADR_Q.rank_rd_adr_queue2[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_rd_adr_queue2[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_rd_adr_queue2[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_rd_adr_queue2[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b1_rd_q_3 	= {`MCU1_DRQ1_CTL.drq_rdbuf_valids[3],
                                                   `MCU1_L2B1_ADR_Q.rd_req_id_queue3[2:0],
                                                   `MCU1_L2B1_ADR_Q.rank_rd_adr_queue3[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_rd_adr_queue3[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_rd_adr_queue3[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_rd_adr_queue3[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b1_rd_q_4 	= {`MCU1_DRQ1_CTL.drq_rdbuf_valids[4],
                                                   `MCU1_L2B1_ADR_Q.rd_req_id_queue4[2:0],
                                                   `MCU1_L2B1_ADR_Q.rank_rd_adr_queue4[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_rd_adr_queue4[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_rd_adr_queue4[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_rd_adr_queue4[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b1_rd_q_5 	= {`MCU1_DRQ1_CTL.drq_rdbuf_valids[5],
                                                   `MCU1_L2B1_ADR_Q.rd_req_id_queue5[2:0],
                                                   `MCU1_L2B1_ADR_Q.rank_rd_adr_queue5[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_rd_adr_queue5[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_rd_adr_queue5[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_rd_adr_queue5[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b1_rd_q_6 	= {`MCU1_DRQ1_CTL.drq_rdbuf_valids[6],
                                                   `MCU1_L2B1_ADR_Q.rd_req_id_queue6[2:0],
                                                   `MCU1_L2B1_ADR_Q.rank_rd_adr_queue6[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_rd_adr_queue6[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_rd_adr_queue6[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_rd_adr_queue6[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch1_l2b1_rd_q_7 	= {`MCU1_DRQ1_CTL.drq_rdbuf_valids[7],
                                                   `MCU1_L2B1_ADR_Q.rd_req_id_queue7[2:0],
                                                   `MCU1_L2B1_ADR_Q.rank_rd_adr_queue7[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_rd_adr_queue7[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_rd_adr_queue7[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_rd_adr_queue7[10:0], 
                                                    3'b0  };


   reg   [39:0]        	dram_Ch1_l2b1_rd_q[7:0];
   // read que collapsing fifo
   wire  [11:0]   	dram_Ch1_l2b1_rd_colps_q_0 	= {`MCU1_DRQ1_CTL.drq_rd_queue_ent0[11:0]};
   wire  [11:0]   	dram_Ch1_l2b1_rd_colps_q_1 	= {`MCU1_DRQ1_CTL.drq_rd_queue_ent1[11:0]};
   wire  [11:0]   	dram_Ch1_l2b1_rd_colps_q_2 	= {`MCU1_DRQ1_CTL.drq_rd_queue_ent2[11:0]};
   wire  [11:0]   	dram_Ch1_l2b1_rd_colps_q_3 	= {`MCU1_DRQ1_CTL.drq_rd_queue_ent3[11:0]};
   wire  [11:0]   	dram_Ch1_l2b1_rd_colps_q_4 	= {`MCU1_DRQ1_CTL.drq_rd_queue_ent4[11:0]};
   wire  [11:0]   	dram_Ch1_l2b1_rd_colps_q_5 	= {`MCU1_DRQ1_CTL.drq_rd_queue_ent5[11:0]};
   wire  [11:0]   	dram_Ch1_l2b1_rd_colps_q_6 	= {`MCU1_DRQ1_CTL.drq_rd_queue_ent6[11:0]};
   wire  [11:0]   	dram_Ch1_l2b1_rd_colps_q_7 	= {`MCU1_DRQ1_CTL.drq_rd_queue_ent7[11:0]};

   reg   [11:0]   	dram_Ch1_l2b1_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	dram_Ch1_l2b1_rd_que_wr_ptr 	= {`MCU1_DRQ1_CTL.drq_rd_adr_queue7_en,
                                                     	   `MCU1_DRQ1_CTL.drq_rd_adr_queue6_en,
                                                     	   `MCU1_DRQ1_CTL.drq_rd_adr_queue5_en,
                                                     	   `MCU1_DRQ1_CTL.drq_rd_adr_queue4_en,
                                                     	   `MCU1_DRQ1_CTL.drq_rd_adr_queue3_en,
                                                     	   `MCU1_DRQ1_CTL.drq_rd_adr_queue2_en,
                                                     	   `MCU1_DRQ1_CTL.drq_rd_adr_queue1_en,
                                                     	   `MCU1_DRQ1_CTL.drq_rd_adr_queue0_en};
   // read que read pointer 
   wire  [7:0]   	dram_Ch1_l2b1_rd_que_rd_ptr 	= {`MCU1_DRQ1_CTL.rdpctl_drq_clear_ent[7:0]};

   // write que request 
   wire                	dram_Ch1_l2b1_wr_req    = `MCU1_L2IF1_CTL.l2t_mcu_wr_req;
   wire    [2:0]       	dram_Ch1_l2b1_wr_addr   = `MCU1_L2IF1_CTL.l2if_data_wr_addr;

   wire  [7:0]  dram_ch1_l2b1_wr_q_valids		= {`MCU1_DRQ1_CTL.drq_wr_queue_valid[7:0]};	
   wire  [3:0]  dram_ch1_l2b1_drq_write_queue_cnt	= {`MCU1_DRQ1_CTL.drq_write_queue_cnt[3:0]};	

   wire  [40:0] 	dram_Ch1_l2b1_wr_q_0 	= {`MCU1_DRQ1_CTL.drq_wrbuf_valids[0],
                                                   `MCU1_DRQ1_CTL.drq_wrbuf_valids[0],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ1_CTL.drq_wr_queue_ent0[11:9],
                                                   `MCU1_L2B1_ADR_Q.rank_wr_adr_queue0[3:0],
						   `MCU1_L2B1_ADR_Q.bank_wr_adr_queue0[2:0],
						   `MCU1_L2B1_ADR_Q.ras_wr_adr_queue0[14:0],
						   `MCU1_L2B1_ADR_Q.cas_wr_adr_queue0[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b1_wr_q_1      = {`MCU1_DRQ1_CTL.drq_wrbuf_valids[1],
                                                   `MCU1_DRQ1_CTL.drq_wrbuf_valids[1],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ1_CTL.drq_wr_queue_ent1[11:9],
                                                   `MCU1_L2B1_ADR_Q.rank_wr_adr_queue1[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_wr_adr_queue1[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_wr_adr_queue1[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_wr_adr_queue1[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b1_wr_q_2      = {`MCU1_DRQ1_CTL.drq_wrbuf_valids[2],
                                                   `MCU1_DRQ1_CTL.drq_wrbuf_valids[2],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ1_CTL.drq_wr_queue_ent2[11:9],
                                                   `MCU1_L2B1_ADR_Q.rank_wr_adr_queue2[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_wr_adr_queue2[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_wr_adr_queue2[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_wr_adr_queue2[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b1_wr_q_3      = {`MCU1_DRQ1_CTL.drq_wrbuf_valids[3],
                                                   `MCU1_DRQ1_CTL.drq_wrbuf_valids[3],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ1_CTL.drq_wr_queue_ent3[11:9],
                                                   `MCU1_L2B1_ADR_Q.rank_wr_adr_queue3[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_wr_adr_queue3[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_wr_adr_queue3[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_wr_adr_queue3[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b1_wr_q_4      = {`MCU1_DRQ1_CTL.drq_wrbuf_valids[4],
                                                   `MCU1_DRQ1_CTL.drq_wrbuf_valids[4],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ1_CTL.drq_wr_queue_ent4[11:9],
                                                   `MCU1_L2B1_ADR_Q.rank_wr_adr_queue4[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_wr_adr_queue4[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_wr_adr_queue4[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_wr_adr_queue4[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b1_wr_q_5      = {`MCU1_DRQ1_CTL.drq_wrbuf_valids[5],
                                                   `MCU1_DRQ1_CTL.drq_wrbuf_valids[5],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ1_CTL.drq_wr_queue_ent5[11:9],
                                                   `MCU1_L2B1_ADR_Q.rank_wr_adr_queue5[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_wr_adr_queue5[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_wr_adr_queue5[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_wr_adr_queue5[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b1_wr_q_6      = {`MCU1_DRQ1_CTL.drq_wrbuf_valids[6],
                                                   `MCU1_DRQ1_CTL.drq_wrbuf_valids[6],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ1_CTL.drq_wr_queue_ent6[11:9],
                                                   `MCU1_L2B1_ADR_Q.rank_wr_adr_queue6[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_wr_adr_queue6[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_wr_adr_queue6[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_wr_adr_queue6[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch1_l2b1_wr_q_7      = {`MCU1_DRQ1_CTL.drq_wrbuf_valids[7],
                                                   `MCU1_DRQ1_CTL.drq_wrbuf_valids[7],	//`DRAM_PATH1.writeqbank0vld0_arb,
                                                   `MCU1_DRQ1_CTL.drq_wr_queue_ent7[11:9],
                                                   `MCU1_L2B1_ADR_Q.rank_wr_adr_queue7[3:0],
                                                   `MCU1_L2B1_ADR_Q.bank_wr_adr_queue7[2:0],
                                                   `MCU1_L2B1_ADR_Q.ras_wr_adr_queue7[14:0],
                                                   `MCU1_L2B1_ADR_Q.cas_wr_adr_queue7[10:0],
						    3'b0};

   reg   [40:0]        dram_Ch1_l2b1_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch1_l2b1_pa_err   = `MCU1_L2RDMX_DP.l2b1_wr_addr_err;

   // write que collapsing fifo
   wire  [14:0]		dram_Ch1_l2b1_wr_colps_q_0 	= {`MCU1_DRQ1_CTL.drq_wr_queue_ent0[14:0]};
   wire  [14:0]   	dram_Ch1_l2b1_wr_colps_q_1 	= {`MCU1_DRQ1_CTL.drq_wr_queue_ent1[14:0]};
   wire  [14:0]   	dram_Ch1_l2b1_wr_colps_q_2 	= {`MCU1_DRQ1_CTL.drq_wr_queue_ent2[14:0]};
   wire  [14:0]   	dram_Ch1_l2b1_wr_colps_q_3 	= {`MCU1_DRQ1_CTL.drq_wr_queue_ent3[14:0]};
   wire  [14:0]   	dram_Ch1_l2b1_wr_colps_q_4 	= {`MCU1_DRQ1_CTL.drq_wr_queue_ent4[14:0]};
   wire  [14:0]   	dram_Ch1_l2b1_wr_colps_q_5 	= {`MCU1_DRQ1_CTL.drq_wr_queue_ent5[14:0]};
   wire  [14:0]   	dram_Ch1_l2b1_wr_colps_q_6 	= {`MCU1_DRQ1_CTL.drq_wr_queue_ent6[14:0]};
   wire  [14:0]   	dram_Ch1_l2b1_wr_colps_q_7 	= {`MCU1_DRQ1_CTL.drq_wr_queue_ent7[14:0]};

   reg   [14:0]   	dram_Ch1_l2b1_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	dram_Ch1_l2b1_wr_que_wr_ptr 	= {`MCU1_DRQ1_CTL.drq_wr_adr_queue7_en,
                                                           `MCU1_DRQ1_CTL.drq_wr_adr_queue6_en,
                                                           `MCU1_DRQ1_CTL.drq_wr_adr_queue5_en,
                                                           `MCU1_DRQ1_CTL.drq_wr_adr_queue4_en,
                                                           `MCU1_DRQ1_CTL.drq_wr_adr_queue3_en,
                                                           `MCU1_DRQ1_CTL.drq_wr_adr_queue2_en,
                                                           `MCU1_DRQ1_CTL.drq_wr_adr_queue1_en,
                                                           `MCU1_DRQ1_CTL.drq_wr_adr_queue0_en};

   // write que arb read pointer 

   // write que data read pointer 
   /*wire  [7:0]          dram_Ch1_l2b1_wr_que_rd_ptr   = {`MCU1_DRQ1_CTL.drq_wr_entry7_rank,
                                                           `MCU1_DRQ1_CTL.drq_wr_entry6_rank,
                                                           `MCU1_DRQ1_CTL.drq_wr_entry5_rank,
                                                           `MCU1_DRQ1_CTL.drq_wr_entry4_rank,
                                                           `MCU1_DRQ1_CTL.drq_wr_entry3_rank,
                                                           `MCU1_DRQ1_CTL.drq_wr_entry2_rank,
                                                           `MCU1_DRQ1_CTL.drq_wr_entry1_rank,
                                                           `MCU1_DRQ1_CTL.drq_wr_entry0_rank};*/
   wire  [7:0]          dram_Ch1_l2b1_wr_que_rd_ptr   = `MCU1_DRQ1_CTL.drq_wrq_clear_ent;


// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch1_l2b1_que_b0_index_en   = {`MCU1_L2B1_ADR_Q.rd_adr_queue_sel[7:0]};


// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch1_l2b1_que_b0_wr_index_en= {`MCU1_L2B1_ADR_Q.wr_adr_queue_sel[7:0]};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch1_l2b1_que_b0_rd_in_val  =  `MCU1_DRQ1_CTL.drq_rd_entry0_val[7:0];

   wire                   dram_Ch1_que_b1_rd_picked           =  `MCU1_DRIF_CTL.drif1_rd_picked;
   wire                   dram_Ch1_que_b1_wr_picked           =  `MCU1_DRIF_CTL.drif1_wr_picked;



// MAQ Not Required   wire  [7:0]            dram_Ch1_que_cas_picked    =  `MCU1_DRIF_CTL.drif_cas_picked_d1[7:0];
// rd hits a wr in the wr Q
   wire                   dram_Ch1_que_rd_wr_hit     =  `MCU1_DRIF_CTL.drif_wr_entry_pend_in;

// MAQ N2 doesn't support		// Signals that will be used to detect oldest entry to the same bank.
// MAQ N2 doesn't support		   // in 2 channel mode this is the real indicator that the request is picked from this channel
// MAQ N2 doesn't support		   wire                   dram_Ch1_que_this_ch_picked     =  (~`DRAM_PATH1.que_channel_disabled) ?
// MAQ N2 doesn't support		                           `DRAM_PATH1.que_ras_bank_picked_en && ~`DRAM_PATH1.que_channel_picked_internal:
// MAQ N2 doesn't support		                           `DRAM_PATH1.que_ras_bank_picked_en &&  `DRAM_PATH1.que_channel_picked_internal;
// MAQ N2 doesn't support		 

   wire  [2:0]            dram_Ch1_que_b0_index_picked        =  `MCU1_DRIF_CTL.drif_rdwr_index_picked[2:0];
   wire                   dram_Ch1_que_b0_cmd_picked          =  `MCU1_DRIF_CTL.drif_rdwr_cmd_picked;
   wire			  dram_ch1_drif_mclk_en		 = `MCU1_DRIF_CTL.drif_mclk_en;


//----------------------------------------------------------------------------------------
// Refresh to go and all CAS request to same CS are done, no new RAS issued.
//----------------------------------------------------------------------------------------
   wire  [4:0]   	  dram_Ch1_que_pos    	       = `MCU1_DRIF_CTL.drif_mcu_state_enc;
   wire          	  dram_Ch1_que_ref_go 	       = `MCU1_DRIF_CTL.drif_ref_go;
   wire          	  dram_Ch1_que_hw_selfrsh 	       = `MCU1_DRIF_CTL.drif_hw_selfrsh;
   wire          	  dram_Ch1_pt_blk_new_openbank_d1   = `MCU1_DRIF_CTL.drif_blk_new_openbank;
   wire  	   	  dram_Ch1_que_cas_valid 	       = ( (|(`MCU1_DRIF_CTL.drif_cas_picked)) &
								     (`MCU1_DRIF_CTL.drif_phy_bank_picked[1:0] == `MCU1_DRIF_CTL.drif_refresh_rank[1:0])
								 );
   wire	[15:0] 		  dram_Ch1_ras_picked               =  `MCU1_DRIF_CTL.drif_ras_picked[15:0];
   wire	 		  dram_Ch1_que_ras_picked           = ( (|(`MCU1_DRIF_CTL.drif_ras_picked[15:0])) &
								  ({`MCU1_DRIF_CTL.drif_rank_adr, `MCU1_DRIF_CTL.drif_stacked_dimm} == `MCU1_DRIF_CTL.drif_refresh_rank[1:0])
								 );
   wire  [1:0]   	  dram_Ch1_b0_phy_bank_bits 	       = `MCU1_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch1_b1_phy_bank_bits 	       = `MCU1_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch1_b2_phy_bank_bits 	       = `MCU1_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch1_b3_phy_bank_bits 	       = `MCU1_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch1_b4_phy_bank_bits 	       = `MCU1_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch1_b5_phy_bank_bits 	       = `MCU1_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch1_b6_phy_bank_bits 	       = `MCU1_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch1_b7_phy_bank_bits 	       = `MCU1_DRIF_CTL.drif_phy_bank_picked[1:0];
   reg   [1:0]   	  dram_Ch1_b_phy_bank_bits[7:0];

   wire  [1:0]   	  dram_Ch1_que_refresh_rank 	       = `MCU1_DRIF_CTL.drif_refresh_rank[1:0];


// ---- Starvation counter causing the wr to have priority ---
   wire     	  	dram_Ch1_que_pick_wr_first 	= (`MCU1_DRIF_CTL.drif0_pick_wr_first |
							`MCU1_DRIF_CTL.drif1_pick_wr_first);

// ------ Scrub Related -------

   // picking the que_split_scrb_addr as _que_scrb_addr_picked_
   wire  [31:0]   	  dram_Ch1_que_scrb_addr_picked 	= `MCU1_DRIF_CTL.drif_scrub_addr;
   wire           	  dram_Ch1_que_scrb_picked 		= `MCU1_DRIF_CTL.drif_scrub_picked;
   //somePersonwire           	  dram_Ch1_que_scrb_rd_picked 	= `MCU1_DRIF_CTL.drif_scrub_picked;	// MAQ
   wire           	  dram_Ch1_que_scrb_rd_picked 	= `MCU1_DRIF_CTL.drif_scrub_read_pending;
   wire           	  dram_Ch1_que_ras_bank_picked_en 	= |(`MCU1_DRIF_CTL.drif_ras_picked[15:0]);
   wire           	  dram_Ch1_que_scrb_write_req 	= `MCU1_DRIF_CTL.drif_scrub_write_req;

// req valid and scrb valid, the scrb should be cleared first
   wire  [15:0]   	  dram_Ch1_que_l2req_valid 	=  `MCU1_DRIF_CTL.drif0_rd_bank_valids | `MCU1_DRIF_CTL.drif1_rd_bank_valids |
							   `MCU1_DRIF_CTL.drif_wr_bank_valids;
   wire  [15:0]   	  dram_Ch1_scrb_indx_val   	=  `MCU1_DRIF_CTL.drif_scrub_entry_val;

// ------- DRAM REGISTERS --------

   wire  [8:0]   	  dram_Ch1_chip_config_reg 	        = {`MCU1_DRIF_CTL.drif_ras_addr_bits[3:0],
								  `MCU1_DRIF_CTL.drif_cas_addr_bits[3:0],
								  `MCU1_DRIF_CTL.drif_stacked_dimm};

   wire  [2:0]   	  dram_Ch1_mode_reg        	        = `MCU1_DRIF_CTL.mode_reg[6:4];
   wire  [3:0]   	  dram_Ch1_rrd_reg        	        = `MCU1_DRIF_CTL.rrd_reg;
   wire  [4:0]   	  dram_Ch1_rc_reg         	        = `MCU1_DRIF_CTL.rc_reg;
   wire  [3:0]   	  dram_Ch1_rcd_reg         	        = `MCU1_DRIF_CTL.rcd_reg;
   wire  [3:0]   	  dram_Ch1_wtr_dly_reg         	= `MCU1_DRIF_CTL.wtr_dly_reg;
   wire  [3:0]   	  dram_Ch1_rtw_dly_reg         	= `MCU1_DRIF_CTL.rtw_dly_reg;
   wire  [3:0]   	  dram_Ch1_rtp_reg         		= `MCU1_DRIF_CTL.rtp_reg;
   wire  [3:0]   	  dram_Ch1_ras_reg         		= `MCU1_DRIF_CTL.ras_reg;
   wire  [3:0]   	  dram_Ch1_rp_reg          		= `MCU1_DRIF_CTL.rp_reg;
   wire  [3:0]   	  dram_Ch1_wr_reg          		= `MCU1_DRIF_CTL.wr_reg;
   wire  [1:0]   	  dram_Ch1_mrd_reg          		= `MCU1_DRIF_CTL.mrd_reg;
   wire  [1:0]   	  dram_Ch1_iwtr_reg          	= `MCU1_DRIF_CTL.iwtr_reg;
   wire  [14:0]   	  dram_Ch1_ext_mode_reg2          	= `MCU1_DRIF_CTL.ext_mode_reg2;
   wire  [14:0]   	  dram_Ch1_ext_mode_reg1          	= `MCU1_DRIF_CTL.ext_mode_reg1;
   wire  [14:0]   	  dram_Ch1_ext_mode_reg3          	= `MCU1_DRIF_CTL.ext_mode_reg3;
   wire          	  dram_Ch1_que_eight_bank_mode       = `MCU1_DRIF_CTL.drif_eight_bank_mode;
   wire          	  dram_Ch1_que_rank1_present         = `MCU1_DRIF_CTL.drif_dimms_present[0];
   wire          	  dram_Ch1_que_channel_disabled      = `MCU1_DRIF_CTL.drif_branch_disabled;
   wire          	  dram_Ch1_que_addr_bank_low_sel     = `MCU1_DRIF_CTL.drif_addr_bank_low_sel;
   wire          	  dram_Ch1_que_init     		= `MCU1_DRIF_CTL.drif_init;
//   wire  [2:0]   	  dram_Ch1_que_data_del_cnt          = `MCU1_DRIF_CTL.drif_data_del_cnt[2:0];
//   wire          	  dram_Ch1_dram_io_pad_clk_inv       = `MCU1_DRIF_CTL.mcu_ddp_pad_clk_inv;
//   wire  [1:0]   	  dram_Ch1_dram_io_ptr_clk_inv       = `MCU1_DRIF_CTL.mcu_ddp_ptr_clk_inv;
   wire          	  dram_Ch1_que_wr_mode_reg_done      = `MCU1_DRIF_CTL.drif_wr_mode_reg_done;
   wire          	  dram_Ch1_que_init_status_reg       = `MCU1_DRIF_CTL.drif_init_status_reg;
   wire  [3:0]   	  dram_Ch1_que_dimms_present         = `MCU1_DRIF_CTL.drif_dimms_present;
   wire          	  dram_Ch1_dram_fail_over_mode       = `MCU1_DRIF_CTL.drif_fail_over_mode;
   wire  [34:0]  	  dram_Ch1_dram_fail_over_mask       = `MCU1_DRIF_CTL.drif_fail_over_mask[34:0];
   wire          	  dram_Ch1_que_dbg_trig_en	        = `MCU1_DRIF_CTL.rdpctl_dbg_trig_enable;
   wire  [22:0]  	  dram_Ch1_que_err_sts_reg	        = `MCU1_DRIF_CTL.rdpctl_err_sts_reg;
   wire  [35:0]  	  dram_Ch1_que_err_addr_reg	        = `MCU1_DRIF_CTL.rdpctl_err_addr_reg;
   wire          	  dram_Ch1_err_inj_reg	        = `MCU1_DRIF_CTL.drif_err_inj_reg;
   wire          	  dram_Ch1_sshot_err_reg	        = `MCU1_DRIF_CTL.drif_sshot_err_reg;
//   wire  [1:0]  	  dram_Ch1_que_err_cnt  	        = `MCU1_DRIF_CTL.rdpctl_err_cnt[17:16];
   wire  [35:0]  	  dram_Ch1_que_err_loc  	        = `MCU1_DRIF_CTL.rdpctl_err_loc;

   // NACK - for non existant register read
   wire          	  dram_Ch1_que_l2if_ack_vld	        = `MCU1_DRIF_CTL.drif_rdata_ack_vld;
   wire          	  dram_Ch1_que_l2if_nack_vld	        = `MCU1_DRIF_CTL.drif_rdata_nack_vld;

   wire          	  dram_Ch1_que_init_dram_done	= `MCU1_DRIF_CTL.drif_init_mcu_done;

// ----- DRAM L2IF INTERFACE -----

   wire  [127:0] 	  dram_Ch1_dram_sctag_data         	= `MCU1.mcu_l2b_data_r3;
   // Error signal for update of error status, error location and error address register.
   //wire          	  dram_Ch1_l2if_scrb_val_d2          = `DRAM_L2IF1.l2if_scrb_val_d3;

   // l2if_scrb_data_val is now qualifying scrb in the rtl
   wire          	  dram_Ch1_l2if_scrb_val_d2          = `MCU1_RDPCTL_CTL.rdpctl_scrub_data_valid;

   wire  [6:0]   	  dram_Ch1_err_sts_reg               = `MCU1_RDPCTL_CTL.rdpctl_err_sts_reg[25:19];

   wire          	  dram_Ch1_l2if_err_sts_reg_en6      = `MCU1_RDPCTL_CTL.rdpctl_meu_error_en;
   wire          	  dram_Ch1_l2if_err_sts_reg_en5      = `MCU1_RDPCTL_CTL.rdpctl_mec_error_en;
   wire          	  dram_Ch1_l2if_err_sts_reg_en4      = `MCU1_RDPCTL_CTL.rdpctl_dac_error_en;
   wire          	  dram_Ch1_l2if_err_sts_reg_en3      = `MCU1_RDPCTL_CTL.rdpctl_dau_error_en;
   wire          	  dram_Ch1_l2if_err_sts_reg_en2      = `MCU1_RDPCTL_CTL.rdpctl_dsc_error_en;
   wire          	  dram_Ch1_l2if_err_sts_reg_en1      = `MCU1_RDPCTL_CTL.rdpctl_dsu_error_en;
   wire          	  dram_Ch1_l2if_err_sts_reg_en0      = `MCU1_RDPCTL_CTL.rdpctl_err_sts_reg_en;
   wire          	  dram_Ch1_l2if_err_sts_reg_en       = `MCU1_RDPCTL_CTL.rdpctl_dbu_error_en;
   wire          	  dram_Ch1_l2if_err_addr_reg_en      = `MCU1_RDPCTL_CTL.rdpctl_err_addr_reg_en;
   wire          	  dram_Ch1_l2if_secc_loc_en          = `MCU1_RDPCTL_CTL.rdpctl_secc_loc_en;


   wire          	  dram_Ch1_l2b0_sctag_dram_rd_req 	= `MCU1_L2IF0_CTL.l2t_mcu_rd_req;
   wire  [2:0]   	  dram_Ch1_l2b0_sctag_dram_rd_req_id 	= `MCU1_L2IF0_CTL.l2t_mcu_rd_req_id;
//   wire  [39:6]   	  dram_Ch1_l2b0_sctag_dram_addr      	= {`MCU1_ADDRDP_DP.l2t0_mcu_addr_39to9, `MCU1_ADDRDP_DP.l2t0_mcu_addr_6to4};
   wire  [39:5]   	  dram_Ch1_l2b0_sctag_dram_addr      	= `MCU1_L2IF0_CTL.l2t_mcu_addr;
   wire          	  dram_Ch1_l2b0_sctag_dram_rd_dummy_req 	= `MCU1_L2IF0_CTL.l2t_mcu_rd_dummy_req;
   wire          	  dram_Ch1_l2b0_dram_sctag_rd_ack       	= `MCU1_L2IF0_CTL.mcu_l2t_rd_ack;
   wire          	  dram_Ch1_l2b0_sctag_dram_wr_req 	= `MCU1_L2IF0_CTL.l2t_mcu_wr_req;
   wire          	  dram_Ch1_l2b0_sctag_dram_data_vld 	= `MCU1_L2IF0_CTL.l2b_mcu_data_vld;
   wire  [63:0]  	  dram_Ch1_l2b0_sctag_dram_wr_data 	= `MCU1_L2RDMX_DP.l2b0_mcu_wr_data_r5;
   wire          	  dram_Ch1_l2b0_dram_sctag_wr_ack       	= `MCU1_L2IF0_CTL.mcu_l2t_wr_ack;
   wire          	  dram_Ch1_l2b0_dram_sctag_data_vld     	= `MCU1_RDATA_CTL.mcu_l2t0_data_vld_r0;
   wire  [2:0]   	  dram_Ch1_l2b0_dram_sctag_rd_req_id    	= `MCU1_RDATA_CTL.mcu_l2t0_rd_req_id_r0;

// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch1_l2if_b0_rd_val          	= `DRAM_L2IF1.l2if_b0_rd_val;
// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch1_l2if_b1_rd_val          	= `DRAM_L2IF1.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch1_l2b0_l2if_b0_wr_val          	= {`MCU1_L2IF0_CTL.l2if_wr_entry3,
									   `MCU1_L2IF0_CTL.l2if_wr_entry2,
									   `MCU1_L2IF0_CTL.l2if_wr_entry1,
									   `MCU1_L2IF0_CTL.l2if_wr_entry0};

   wire  [3:0]   	  dram_Ch1_l2b0_l2if_b1_wr_val          	= {`MCU1_L2IF0_CTL.l2if_wr_entry7, 
									   `MCU1_L2IF0_CTL.l2if_wr_entry6,
									   `MCU1_L2IF0_CTL.l2if_wr_entry5,
									   `MCU1_L2IF0_CTL.l2if_wr_entry4};

// MAQ   wire  [5:0]   	  dram_Ch1_l2b0_l2if_wr_b0_data_addr      = `MCU1_L2IF0_CTL.l2if_wdq_wadr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch1_l2b0_dram_sctag_secc_err       = `MCU1_RDATA_CTL.mcu_l2t0_secc_err_r3;
   wire          	  dram_Ch1_l2b0_dram_sctag_pa_err         = `MCU1_L2RDMX_DP.l2b0_rd_addr_err | `MCU1_L2RDMX_DP.l2b0_wr_addr_err;
   wire          	  dram_Ch1_l2b0_dram_sctag_mecc_err       = `MCU1_RDATA_CTL.mcu_l2t0_mecc_err_r3;
   wire          	  dram_Ch1_l2b0_dram_sctag_scb_secc_err   = `MCU1_RDATA_CTL.mcu_l2t0_scb_secc_err;
   wire          	  dram_Ch1_l2b0_dram_sctag_scb_mecc_err   = `MCU1_RDATA_CTL.mcu_l2t0_scb_mecc_err;

// qualified with vld since they can be on due to residual ( previous error )
/*   wire			dram_Ch1_l2b0_l2if_secc_err             = `MCU1_RDATA_CTL.mcu_l2t0_secc_err_r3 && 
								    (`MCU1_RDATA_CTL.mcu_l2t0_data_vld_r0 || 
								     `MCU1_RDPCTL_CTL.rdpctl_scrub_data_valid);

   wire          	  dram_Ch1_l2b0_l2if_mecc_err_partial     = `MCU1_RDATA_CTL.mcu_l2t0_mecc_err_r3 && 
									 (`MCU1_RDATA_CTL.mcu_l2t0_data_vld_r0 || 
									  `MCU1_RDPCTL_CTL.rdpctl_scrub_data_valid);
*/
   wire dram_Ch1_l2b0_l2if_secc_err = `MCU1_RDATA_CTL.mcu_l2t0_scb_secc_err_in ||
                                      `MCU1_RDATA_CTL.mcu_l2t0_secc_err_r1;
   wire dram_Ch1_l2b0_l2if_mecc_err_partial = `MCU1_RDATA_CTL.mcu_l2t0_scb_mecc_err_in ||
                                      `MCU1_RDATA_CTL.mcu_l2t0_mecc_err_r1;
   wire          	  dram_Ch1_l2b0_l2if_pa_err               = (`MCU1_L2RDMX_DP.l2b0_rd_addr_err || `MCU1_L2RDMX_DP.l2b0_wr_addr_err) && 
									`MCU1_RDATA_CTL.mcu_l2t0_data_vld_r0;

   wire  [1:0]   	  dram_Ch1_l2b0_cpu_wr_en                	= `MCU1_L2IF0_CTL.l2if_wdq_we;
   wire  [4:0]   	  dram_Ch1_l2b0_cpu_wr_addr               = `MCU1_L2IF0_CTL.l2if_wdq_wadr;
   wire  		  dram_Ch1_l2b0_wdq_rd_en			= `MCU1_DRIF_CTL.drif0_wdq_rd;
   wire  [4:0]   	  dram_Ch1_l2b0_wdq_radr			= `MCU1_DRIF_CTL.drif0_wdq_radr;

   wire          	  dram_Ch1_l2b0_clspine_dram_txrd_sync 	= `MCU1_RDATA_CTL.rdata_cmp_ddr_sync_en;
   wire          	  dram_Ch1_l2b0_clspine_dram_txwr_sync 	= `MCU1_RDATA_CTL.rdata_cmp_ddr_sync_en;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch1_l2b0_l2if_wr_entry             = {
                                                                  `MCU1_L2IF0_CTL.l2if_wr_entry7,
                                                                  `MCU1_L2IF0_CTL.l2if_wr_entry6,
                                                                  `MCU1_L2IF0_CTL.l2if_wr_entry5,
                                                                  `MCU1_L2IF0_CTL.l2if_wr_entry4,
                                                                  `MCU1_L2IF0_CTL.l2if_wr_entry3,
                                                                  `MCU1_L2IF0_CTL.l2if_wr_entry2,
                                                                  `MCU1_L2IF0_CTL.l2if_wr_entry1,
                                                                  `MCU1_L2IF0_CTL.l2if_wr_entry0
                                                                  };



/*  wire   [8:0]            dram_Ch1_l2b0_rd_adr_info_hi		 = {
                                                                  `MCU1_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU1_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU1_DRIF_CTL.drif_stack_adr,
                                                                  `MCU1_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU1_L2B0_ADRGEN_DP.bank_adr[2] && `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU1_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0	// `DRAM_L2IF1.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch1_l2b0_wr_adr_info_hi		 = {
                                                                  `MCU1_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU1_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU1_DRIF_CTL.drif_stack_adr,
                                                                  `MCU1_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU1_L2B0_ADRGEN_DP.bank_adr[2] && `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU1_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF1.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch1_l2b0_rd_adr_info_lo		 = {
                                                                  `MCU1_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU1_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU1_DRIF_CTL.drif_stack_adr,
                                                                  `MCU1_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU1_L2B0_ADRGEN_DP.bank_adr[2] && `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU1_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF1.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch1_l2b0_wr_adr_info_lo		 = {
                                                                  `MCU1_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU1_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU1_DRIF_CTL.drif_stack_adr,
                                                                  `MCU1_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU1_L2B0_ADRGEN_DP.bank_adr[2] && `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU1_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF1.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };*/
                                                                 

   wire          	  dram_Ch1_l2b1_sctag_dram_rd_req 	= `MCU1_L2IF1_CTL.l2t_mcu_rd_req;
   wire  [2:0]   	  dram_Ch1_l2b1_sctag_dram_rd_req_id 	= `MCU1_L2IF1_CTL.l2t_mcu_rd_req_id;
//   wire  [39:6]   	  dram_Ch1_l2b1_sctag_dram_addr      	= {`MCU1_ADDRDP_DP.l2t1_mcu_addr_39to9, `MCU1_ADDRDP_DP.l2t1_mcu_addr_6to4};
   wire  [39:5]   	  dram_Ch1_l2b1_sctag_dram_addr      	= `MCU1_L2IF1_CTL.l2t_mcu_addr;
   wire          	  dram_Ch1_l2b1_sctag_dram_rd_dummy_req 	= `MCU1_L2IF1_CTL.l2t_mcu_rd_dummy_req;
   wire          	  dram_Ch1_l2b1_dram_sctag_rd_ack       	= `MCU1_L2IF1_CTL.mcu_l2t_rd_ack;
   wire          	  dram_Ch1_l2b1_sctag_dram_wr_req 	= `MCU1_L2IF1_CTL.l2t_mcu_wr_req;
   wire          	  dram_Ch1_l2b1_sctag_dram_data_vld 	= `MCU1_L2IF1_CTL.l2b_mcu_data_vld;
   wire  [63:0]  	  dram_Ch1_l2b1_sctag_dram_wr_data 	= `MCU1_L2RDMX_DP.l2b1_mcu_wr_data_r5;
   wire          	  dram_Ch1_l2b1_dram_sctag_wr_ack       	= `MCU1_L2IF1_CTL.mcu_l2t_wr_ack;
   wire          	  dram_Ch1_l2b1_dram_sctag_data_vld     	= `MCU1_RDATA_CTL.mcu_l2t1_data_vld_r0;
   wire  [2:0]   	  dram_Ch1_l2b1_dram_sctag_rd_req_id    	= `MCU1_RDATA_CTL.mcu_l2t1_rd_req_id_r0;

// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch1_l2if_b0_rd_val          	= `DRAM_L2IF1.l2if_b0_rd_val;
// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch1_l2if_b1_rd_val          	= `DRAM_L2IF1.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch1_l2b1_l2if_b0_wr_val          	= {`MCU1_L2IF1_CTL.l2if_wr_entry3,
									   `MCU1_L2IF1_CTL.l2if_wr_entry2,
									   `MCU1_L2IF1_CTL.l2if_wr_entry1,
									   `MCU1_L2IF1_CTL.l2if_wr_entry0};

   wire  [3:0]   	  dram_Ch1_l2b1_l2if_b1_wr_val          	= {`MCU1_L2IF1_CTL.l2if_wr_entry7, 
									   `MCU1_L2IF1_CTL.l2if_wr_entry6,
									   `MCU1_L2IF1_CTL.l2if_wr_entry5,
									   `MCU1_L2IF1_CTL.l2if_wr_entry4};

// MAQ   wire  [5:0]   	  dram_Ch1_l2b1_l2if_wr_b0_data_addr      = `MCU1_L2IF1_CTL.l2if_wdq_wadr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch1_l2b1_dram_sctag_secc_err       = `MCU1_RDATA_CTL.mcu_l2t1_secc_err_r3;
   wire          	  dram_Ch1_l2b1_dram_sctag_pa_err         = `MCU1_L2RDMX_DP.l2b1_rd_addr_err | `MCU1_L2RDMX_DP.l2b1_wr_addr_err;
   wire          	  dram_Ch1_l2b1_dram_sctag_mecc_err       = `MCU1_RDATA_CTL.mcu_l2t1_mecc_err_r3;
   wire          	  dram_Ch1_l2b1_dram_sctag_scb_secc_err   = `MCU1_RDATA_CTL.mcu_l2t1_scb_secc_err;
   wire          	  dram_Ch1_l2b1_dram_sctag_scb_mecc_err   = `MCU1_RDATA_CTL.mcu_l2t1_scb_mecc_err;

// qualified with vld since they can be on due to residual ( previous error )
/*   wire			dram_Ch1_l2b1_l2if_secc_err             = `MCU1_RDATA_CTL.mcu_l2t1_secc_err_r3 && 
								    (`MCU1_RDATA_CTL.mcu_l2t1_data_vld_r0 || 
								     `MCU1_RDPCTL_CTL.rdpctl_scrub_data_valid);

   wire          	  dram_Ch1_l2b1_l2if_mecc_err_partial     = `MCU1_RDATA_CTL.mcu_l2t1_mecc_err_r3 && 
									 (`MCU1_RDATA_CTL.mcu_l2t1_data_vld_r0 || 
									  `MCU1_RDPCTL_CTL.rdpctl_scrub_data_valid);
*/
   wire dram_Ch1_l2b1_l2if_secc_err = `MCU1_RDATA_CTL.mcu_l2t1_scb_secc_err_in ||
                                      `MCU1_RDATA_CTL.mcu_l2t1_secc_err_r1;
   wire dram_Ch1_l2b1_l2if_mecc_err_partial = `MCU1_RDATA_CTL.mcu_l2t1_scb_mecc_err_in ||
                                      `MCU1_RDATA_CTL.mcu_l2t1_mecc_err_r1;
   wire          	  dram_Ch1_l2b1_l2if_pa_err               = (`MCU1_L2RDMX_DP.l2b1_rd_addr_err || `MCU1_L2RDMX_DP.l2b1_wr_addr_err) && 
									`MCU1_RDATA_CTL.mcu_l2t1_data_vld_r0;

   wire  [1:0]   	  dram_Ch1_l2b1_cpu_wr_en                	= `MCU1_L2IF1_CTL.l2if_wdq_we;
   wire  [4:0]   	  dram_Ch1_l2b1_cpu_wr_addr               = `MCU1_L2IF1_CTL.l2if_wdq_wadr;
   wire  		  dram_Ch1_l2b1_wdq_rd_en			= `MCU1_DRIF_CTL.drif1_wdq_rd;
   wire  [4:0]   	  dram_Ch1_l2b1_wdq_radr			= `MCU1_DRIF_CTL.drif1_wdq_radr;

   wire          	  dram_Ch1_l2b1_clspine_dram_txrd_sync 	= `MCU1_RDATA_CTL.rdata_cmp_ddr_sync_en;
   wire          	  dram_Ch1_l2b1_clspine_dram_txwr_sync 	= `MCU1_RDATA_CTL.rdata_cmp_ddr_sync_en;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch1_l2b1_l2if_wr_entry             = {
                                                                  `MCU1_L2IF1_CTL.l2if_wr_entry7,
                                                                  `MCU1_L2IF1_CTL.l2if_wr_entry6,
                                                                  `MCU1_L2IF1_CTL.l2if_wr_entry5,
                                                                  `MCU1_L2IF1_CTL.l2if_wr_entry4,
                                                                  `MCU1_L2IF1_CTL.l2if_wr_entry3,
                                                                  `MCU1_L2IF1_CTL.l2if_wr_entry2,
                                                                  `MCU1_L2IF1_CTL.l2if_wr_entry1,
                                                                  `MCU1_L2IF1_CTL.l2if_wr_entry0
                                                                  };



/*  wire   [8:0]            dram_Ch1_l2b1_rd_adr_info_hi		 = {
                                                                  `MCU1_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU1_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU1_DRIF_CTL.drif_stack_adr,
                                                                  `MCU1_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU1_L2B1_ADRGEN_DP.bank_adr[2] && `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU1_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0	// `DRAM_L2IF1.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch1_l2b1_wr_adr_info_hi		 = {
                                                                  `MCU1_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU1_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU1_DRIF_CTL.drif_stack_adr,
                                                                  `MCU1_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU1_L2B1_ADRGEN_DP.bank_adr[2] && `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU1_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF1.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch1_l2b1_rd_adr_info_lo		 = {
                                                                  `MCU1_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU1_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU1_DRIF_CTL.drif_stack_adr,
                                                                  `MCU1_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU1_L2B1_ADRGEN_DP.bank_adr[2] && `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU1_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF1.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch1_l2b1_wr_adr_info_lo		 = {
                                                                  `MCU1_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU1_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU1_DRIF_CTL.drif_stack_adr,
                                                                  `MCU1_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU1_L2B1_ADRGEN_DP.bank_adr[2] && `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU1_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU1_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF1.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };*/
                                                                 

 
// ---- Performance counters ----

   wire  [7:0]            dram_Ch1_perf_cntl          = `MCU1_DRIF_CTL.drif_perf_cntl_reg;
   wire                   dram_Ch1_cnt0_sticky_bit    = `MCU1_DRIF_CTL.drif_perf_cnt0_reg[31];
   wire                   dram_Ch1_cnt1_sticky_bit    = `MCU1_DRIF_CTL.drif_perf_cnt1_reg[31];

   // read que request 
   wire                   dram_Ch2_l2b0_rd_req    = `MCU2_L2IF0_CTL.l2t_mcu_rd_req;
   wire    [2:0]          dram_Ch2_l2b0_rd_id     = `MCU2_L2IF0_CTL.l2t_mcu_rd_req_id[2:0];
   wire                   dram_Ch2_l2b0_errq_vld   = (!`MCU2_DRIF_CTL.drif_err_fifo_empty) & (`MCU2_DRIF_CTL.rdpctl_err_fifo_data[0] == 0) ;
   wire    [2:0]          dram_Ch2_l2b0_errq_id   = `MCU2_DRIF_CTL.rdpctl_err_fifo_data[4:2];
   // read que
   wire  	dram_ch2_l2b0_rd_q_vld_0  = { ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0])) };

   wire  	dram_ch2_l2b0_rd_q_vld_1  = { ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1])) };

   wire  	dram_ch2_l2b0_rd_q_vld_2  = { ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2])) };

   wire  	dram_ch2_l2b0_rd_q_vld_3  = { ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3])) };

   wire  	dram_ch2_l2b0_rd_q_vld_4  = { ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4])) };

   wire  	dram_ch2_l2b0_rd_q_vld_5  = { ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5])) };

   wire  	dram_ch2_l2b0_rd_q_vld_6  = { ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6])) };

   wire  	dram_ch2_l2b0_rd_q_vld_7  = { ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7])) };

   wire  [7:0]	dram_ch2_l2b0_rd_q_valids = {dram_ch2_l2b0_rd_q_vld_7, dram_ch2_l2b0_rd_q_vld_6, dram_ch2_l2b0_rd_q_vld_5, dram_ch2_l2b0_rd_q_vld_4,
						   dram_ch2_l2b0_rd_q_vld_3, dram_ch2_l2b0_rd_q_vld_2, dram_ch2_l2b0_rd_q_vld_1, dram_ch2_l2b0_rd_q_vld_0};
   
// Read request Q PA-Error
   wire         dram_ch2_l2b0_rd_q_addr_err_0  = 
	{ ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch2_l2b0_rd_q_addr_err_1  = 
	{ ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent6[7]) };

   wire 	dram_ch2_l2b0_rd_q_addr_err_2  = 
	{ ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch2_l2b0_rd_q_addr_err_3  = 
	{ ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch2_l2b0_rd_q_addr_err_4  = 
	{ ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch2_l2b0_rd_q_addr_err_5  = 
	{ ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch2_l2b0_rd_q_addr_err_6  = 
	{ ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch2_l2b0_rd_q_addr_err_7  = 
	{ ((`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU2_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire  [7:0] dram_ch2_l2b0_rd_q_addr_err = {dram_ch2_l2b0_rd_q_addr_err_7, dram_ch2_l2b0_rd_q_addr_err_6, dram_ch2_l2b0_rd_q_addr_err_5, dram_ch2_l2b0_rd_q_addr_err_4,
						    dram_ch2_l2b0_rd_q_addr_err_3, dram_ch2_l2b0_rd_q_addr_err_2, dram_ch2_l2b0_rd_q_addr_err_1, dram_ch2_l2b0_rd_q_addr_err_0};

   wire  [7:0]  dram_ch2_l2b0_drq_rd_queue_valid	= {`MCU2_DRQ0_CTL.drq_rd_queue_valid[7:0]};    
   wire  [3:0]  dram_ch2_l2b0_drq_read_queue_cnt 		= {`MCU2_DRQ0_CTL.drq_read_queue_cnt[3:0]};      

// Read request Q PA-Error

   wire  [39:0]		dram_Ch2_l2b0_rd_q_0 	= {`MCU2_DRQ0_CTL.drq_rdbuf_valids[0],
                                                   `MCU2_L2B0_ADR_Q.rd_req_id_queue0[2:0],
						   `MCU2_L2B0_ADR_Q.rank_rd_adr_queue0[3:0],
						   `MCU2_L2B0_ADR_Q.bank_rd_adr_queue0[2:0],
						   `MCU2_L2B0_ADR_Q.ras_rd_adr_queue0[14:0],
						   `MCU2_L2B0_ADR_Q.cas_rd_adr_queue0[10:0],
						    3'b0 };

   wire  [39:0] 	dram_Ch2_l2b0_rd_q_1 	= {`MCU2_DRQ0_CTL.drq_rdbuf_valids[1],
                                                   `MCU2_L2B0_ADR_Q.rd_req_id_queue1[2:0],
                                                   `MCU2_L2B0_ADR_Q.rank_rd_adr_queue1[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_rd_adr_queue1[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_rd_adr_queue1[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_rd_adr_queue1[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b0_rd_q_2 	= {`MCU2_DRQ0_CTL.drq_rdbuf_valids[2],
                                                   `MCU2_L2B0_ADR_Q.rd_req_id_queue2[2:0],
                                                   `MCU2_L2B0_ADR_Q.rank_rd_adr_queue2[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_rd_adr_queue2[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_rd_adr_queue2[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_rd_adr_queue2[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b0_rd_q_3 	= {`MCU2_DRQ0_CTL.drq_rdbuf_valids[3],
                                                   `MCU2_L2B0_ADR_Q.rd_req_id_queue3[2:0],
                                                   `MCU2_L2B0_ADR_Q.rank_rd_adr_queue3[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_rd_adr_queue3[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_rd_adr_queue3[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_rd_adr_queue3[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b0_rd_q_4 	= {`MCU2_DRQ0_CTL.drq_rdbuf_valids[4],
                                                   `MCU2_L2B0_ADR_Q.rd_req_id_queue4[2:0],
                                                   `MCU2_L2B0_ADR_Q.rank_rd_adr_queue4[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_rd_adr_queue4[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_rd_adr_queue4[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_rd_adr_queue4[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b0_rd_q_5 	= {`MCU2_DRQ0_CTL.drq_rdbuf_valids[5],
                                                   `MCU2_L2B0_ADR_Q.rd_req_id_queue5[2:0],
                                                   `MCU2_L2B0_ADR_Q.rank_rd_adr_queue5[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_rd_adr_queue5[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_rd_adr_queue5[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_rd_adr_queue5[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b0_rd_q_6 	= {`MCU2_DRQ0_CTL.drq_rdbuf_valids[6],
                                                   `MCU2_L2B0_ADR_Q.rd_req_id_queue6[2:0],
                                                   `MCU2_L2B0_ADR_Q.rank_rd_adr_queue6[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_rd_adr_queue6[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_rd_adr_queue6[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_rd_adr_queue6[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b0_rd_q_7 	= {`MCU2_DRQ0_CTL.drq_rdbuf_valids[7],
                                                   `MCU2_L2B0_ADR_Q.rd_req_id_queue7[2:0],
                                                   `MCU2_L2B0_ADR_Q.rank_rd_adr_queue7[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_rd_adr_queue7[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_rd_adr_queue7[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_rd_adr_queue7[10:0], 
                                                    3'b0  };


   reg   [39:0]        	dram_Ch2_l2b0_rd_q[7:0];
   // read que collapsing fifo
   wire  [11:0]   	dram_Ch2_l2b0_rd_colps_q_0 	= {`MCU2_DRQ0_CTL.drq_rd_queue_ent0[11:0]};
   wire  [11:0]   	dram_Ch2_l2b0_rd_colps_q_1 	= {`MCU2_DRQ0_CTL.drq_rd_queue_ent1[11:0]};
   wire  [11:0]   	dram_Ch2_l2b0_rd_colps_q_2 	= {`MCU2_DRQ0_CTL.drq_rd_queue_ent2[11:0]};
   wire  [11:0]   	dram_Ch2_l2b0_rd_colps_q_3 	= {`MCU2_DRQ0_CTL.drq_rd_queue_ent3[11:0]};
   wire  [11:0]   	dram_Ch2_l2b0_rd_colps_q_4 	= {`MCU2_DRQ0_CTL.drq_rd_queue_ent4[11:0]};
   wire  [11:0]   	dram_Ch2_l2b0_rd_colps_q_5 	= {`MCU2_DRQ0_CTL.drq_rd_queue_ent5[11:0]};
   wire  [11:0]   	dram_Ch2_l2b0_rd_colps_q_6 	= {`MCU2_DRQ0_CTL.drq_rd_queue_ent6[11:0]};
   wire  [11:0]   	dram_Ch2_l2b0_rd_colps_q_7 	= {`MCU2_DRQ0_CTL.drq_rd_queue_ent7[11:0]};

   reg   [11:0]   	dram_Ch2_l2b0_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	dram_Ch2_l2b0_rd_que_wr_ptr 	= {`MCU2_DRQ0_CTL.drq_rd_adr_queue7_en,
                                                     	   `MCU2_DRQ0_CTL.drq_rd_adr_queue6_en,
                                                     	   `MCU2_DRQ0_CTL.drq_rd_adr_queue5_en,
                                                     	   `MCU2_DRQ0_CTL.drq_rd_adr_queue4_en,
                                                     	   `MCU2_DRQ0_CTL.drq_rd_adr_queue3_en,
                                                     	   `MCU2_DRQ0_CTL.drq_rd_adr_queue2_en,
                                                     	   `MCU2_DRQ0_CTL.drq_rd_adr_queue1_en,
                                                     	   `MCU2_DRQ0_CTL.drq_rd_adr_queue0_en};
   // read que read pointer 
   wire  [7:0]   	dram_Ch2_l2b0_rd_que_rd_ptr 	= {`MCU2_DRQ0_CTL.rdpctl_drq_clear_ent[7:0]};

   // write que request 
   wire                	dram_Ch2_l2b0_wr_req    = `MCU2_L2IF0_CTL.l2t_mcu_wr_req;
   wire    [2:0]       	dram_Ch2_l2b0_wr_addr   = `MCU2_L2IF0_CTL.l2if_data_wr_addr;

   wire  [7:0]  dram_ch2_l2b0_wr_q_valids		= {`MCU2_DRQ0_CTL.drq_wr_queue_valid[7:0]};	
   wire  [3:0]  dram_ch2_l2b0_drq_write_queue_cnt	= {`MCU2_DRQ0_CTL.drq_write_queue_cnt[3:0]};	

   wire  [40:0] 	dram_Ch2_l2b0_wr_q_0 	= {`MCU2_DRQ0_CTL.drq_wrbuf_valids[0],
                                                   `MCU2_DRQ0_CTL.drq_wrbuf_valids[0],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ0_CTL.drq_wr_queue_ent0[11:9],
                                                   `MCU2_L2B0_ADR_Q.rank_wr_adr_queue0[3:0],
						   `MCU2_L2B0_ADR_Q.bank_wr_adr_queue0[2:0],
						   `MCU2_L2B0_ADR_Q.ras_wr_adr_queue0[14:0],
						   `MCU2_L2B0_ADR_Q.cas_wr_adr_queue0[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b0_wr_q_1      = {`MCU2_DRQ0_CTL.drq_wrbuf_valids[1],
                                                   `MCU2_DRQ0_CTL.drq_wrbuf_valids[1],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ0_CTL.drq_wr_queue_ent1[11:9],
                                                   `MCU2_L2B0_ADR_Q.rank_wr_adr_queue1[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_wr_adr_queue1[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_wr_adr_queue1[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_wr_adr_queue1[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b0_wr_q_2      = {`MCU2_DRQ0_CTL.drq_wrbuf_valids[2],
                                                   `MCU2_DRQ0_CTL.drq_wrbuf_valids[2],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ0_CTL.drq_wr_queue_ent2[11:9],
                                                   `MCU2_L2B0_ADR_Q.rank_wr_adr_queue2[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_wr_adr_queue2[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_wr_adr_queue2[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_wr_adr_queue2[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b0_wr_q_3      = {`MCU2_DRQ0_CTL.drq_wrbuf_valids[3],
                                                   `MCU2_DRQ0_CTL.drq_wrbuf_valids[3],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ0_CTL.drq_wr_queue_ent3[11:9],
                                                   `MCU2_L2B0_ADR_Q.rank_wr_adr_queue3[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_wr_adr_queue3[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_wr_adr_queue3[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_wr_adr_queue3[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b0_wr_q_4      = {`MCU2_DRQ0_CTL.drq_wrbuf_valids[4],
                                                   `MCU2_DRQ0_CTL.drq_wrbuf_valids[4],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ0_CTL.drq_wr_queue_ent4[11:9],
                                                   `MCU2_L2B0_ADR_Q.rank_wr_adr_queue4[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_wr_adr_queue4[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_wr_adr_queue4[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_wr_adr_queue4[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b0_wr_q_5      = {`MCU2_DRQ0_CTL.drq_wrbuf_valids[5],
                                                   `MCU2_DRQ0_CTL.drq_wrbuf_valids[5],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ0_CTL.drq_wr_queue_ent5[11:9],
                                                   `MCU2_L2B0_ADR_Q.rank_wr_adr_queue5[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_wr_adr_queue5[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_wr_adr_queue5[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_wr_adr_queue5[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b0_wr_q_6      = {`MCU2_DRQ0_CTL.drq_wrbuf_valids[6],
                                                   `MCU2_DRQ0_CTL.drq_wrbuf_valids[6],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ0_CTL.drq_wr_queue_ent6[11:9],
                                                   `MCU2_L2B0_ADR_Q.rank_wr_adr_queue6[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_wr_adr_queue6[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_wr_adr_queue6[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_wr_adr_queue6[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b0_wr_q_7      = {`MCU2_DRQ0_CTL.drq_wrbuf_valids[7],
                                                   `MCU2_DRQ0_CTL.drq_wrbuf_valids[7],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ0_CTL.drq_wr_queue_ent7[11:9],
                                                   `MCU2_L2B0_ADR_Q.rank_wr_adr_queue7[3:0],
                                                   `MCU2_L2B0_ADR_Q.bank_wr_adr_queue7[2:0],
                                                   `MCU2_L2B0_ADR_Q.ras_wr_adr_queue7[14:0],
                                                   `MCU2_L2B0_ADR_Q.cas_wr_adr_queue7[10:0],
						    3'b0};

   reg   [40:0]        dram_Ch2_l2b0_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch2_l2b0_pa_err   = `MCU2_L2RDMX_DP.l2b0_wr_addr_err;

   // write que collapsing fifo
   wire  [14:0]		dram_Ch2_l2b0_wr_colps_q_0 	= {`MCU2_DRQ0_CTL.drq_wr_queue_ent0[14:0]};
   wire  [14:0]   	dram_Ch2_l2b0_wr_colps_q_1 	= {`MCU2_DRQ0_CTL.drq_wr_queue_ent1[14:0]};
   wire  [14:0]   	dram_Ch2_l2b0_wr_colps_q_2 	= {`MCU2_DRQ0_CTL.drq_wr_queue_ent2[14:0]};
   wire  [14:0]   	dram_Ch2_l2b0_wr_colps_q_3 	= {`MCU2_DRQ0_CTL.drq_wr_queue_ent3[14:0]};
   wire  [14:0]   	dram_Ch2_l2b0_wr_colps_q_4 	= {`MCU2_DRQ0_CTL.drq_wr_queue_ent4[14:0]};
   wire  [14:0]   	dram_Ch2_l2b0_wr_colps_q_5 	= {`MCU2_DRQ0_CTL.drq_wr_queue_ent5[14:0]};
   wire  [14:0]   	dram_Ch2_l2b0_wr_colps_q_6 	= {`MCU2_DRQ0_CTL.drq_wr_queue_ent6[14:0]};
   wire  [14:0]   	dram_Ch2_l2b0_wr_colps_q_7 	= {`MCU2_DRQ0_CTL.drq_wr_queue_ent7[14:0]};

   reg   [14:0]   	dram_Ch2_l2b0_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	dram_Ch2_l2b0_wr_que_wr_ptr 	= {`MCU2_DRQ0_CTL.drq_wr_adr_queue7_en,
                                                           `MCU2_DRQ0_CTL.drq_wr_adr_queue6_en,
                                                           `MCU2_DRQ0_CTL.drq_wr_adr_queue5_en,
                                                           `MCU2_DRQ0_CTL.drq_wr_adr_queue4_en,
                                                           `MCU2_DRQ0_CTL.drq_wr_adr_queue3_en,
                                                           `MCU2_DRQ0_CTL.drq_wr_adr_queue2_en,
                                                           `MCU2_DRQ0_CTL.drq_wr_adr_queue1_en,
                                                           `MCU2_DRQ0_CTL.drq_wr_adr_queue0_en};

   // write que arb read pointer 

   // write que data read pointer 
   /*wire  [7:0]          dram_Ch2_l2b0_wr_que_rd_ptr   = {`MCU2_DRQ0_CTL.drq_wr_entry7_rank,
                                                           `MCU2_DRQ0_CTL.drq_wr_entry6_rank,
                                                           `MCU2_DRQ0_CTL.drq_wr_entry5_rank,
                                                           `MCU2_DRQ0_CTL.drq_wr_entry4_rank,
                                                           `MCU2_DRQ0_CTL.drq_wr_entry3_rank,
                                                           `MCU2_DRQ0_CTL.drq_wr_entry2_rank,
                                                           `MCU2_DRQ0_CTL.drq_wr_entry1_rank,
                                                           `MCU2_DRQ0_CTL.drq_wr_entry0_rank};*/
   wire  [7:0]          dram_Ch2_l2b0_wr_que_rd_ptr   = `MCU2_DRQ0_CTL.drq_wrq_clear_ent;


// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch2_l2b0_que_b0_index_en   = {`MCU2_L2B0_ADR_Q.rd_adr_queue_sel[7:0]};


// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch2_l2b0_que_b0_wr_index_en= {`MCU2_L2B0_ADR_Q.wr_adr_queue_sel[7:0]};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch2_l2b0_que_b0_rd_in_val  =  `MCU2_DRQ0_CTL.drq_rd_entry0_val[7:0];

   wire                   dram_Ch2_que_b0_rd_picked           =  `MCU2_DRIF_CTL.drif0_rd_picked;
   wire                   dram_Ch2_que_b0_wr_picked           =  `MCU2_DRIF_CTL.drif0_wr_picked;
   // read que request 
   wire                   dram_Ch2_l2b1_rd_req    = `MCU2_L2IF1_CTL.l2t_mcu_rd_req;
   wire    [2:0]          dram_Ch2_l2b1_rd_id     = `MCU2_L2IF1_CTL.l2t_mcu_rd_req_id[2:0];
   wire                   dram_Ch2_l2b1_errq_vld   = (!`MCU2_DRIF_CTL.drif_err_fifo_empty) & (`MCU2_DRIF_CTL.rdpctl_err_fifo_data[0] == 1) ;
   wire    [2:0]          dram_Ch2_l2b1_errq_id   = `MCU2_DRIF_CTL.rdpctl_err_fifo_data[4:2];
   // read que
   wire  	dram_ch2_l2b1_rd_q_vld_0  = { ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0])) };

   wire  	dram_ch2_l2b1_rd_q_vld_1  = { ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1])) };

   wire  	dram_ch2_l2b1_rd_q_vld_2  = { ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2])) };

   wire  	dram_ch2_l2b1_rd_q_vld_3  = { ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3])) };

   wire  	dram_ch2_l2b1_rd_q_vld_4  = { ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4])) };

   wire  	dram_ch2_l2b1_rd_q_vld_5  = { ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5])) };

   wire  	dram_ch2_l2b1_rd_q_vld_6  = { ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6])) };

   wire  	dram_ch2_l2b1_rd_q_vld_7  = { ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7])) };

   wire  [7:0]	dram_ch2_l2b1_rd_q_valids = {dram_ch2_l2b1_rd_q_vld_7, dram_ch2_l2b1_rd_q_vld_6, dram_ch2_l2b1_rd_q_vld_5, dram_ch2_l2b1_rd_q_vld_4,
						   dram_ch2_l2b1_rd_q_vld_3, dram_ch2_l2b1_rd_q_vld_2, dram_ch2_l2b1_rd_q_vld_1, dram_ch2_l2b1_rd_q_vld_0};
   
// Read request Q PA-Error
   wire         dram_ch2_l2b1_rd_q_addr_err_0  = 
	{ ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch2_l2b1_rd_q_addr_err_1  = 
	{ ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent6[7]) };

   wire 	dram_ch2_l2b1_rd_q_addr_err_2  = 
	{ ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch2_l2b1_rd_q_addr_err_3  = 
	{ ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch2_l2b1_rd_q_addr_err_4  = 
	{ ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch2_l2b1_rd_q_addr_err_5  = 
	{ ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch2_l2b1_rd_q_addr_err_6  = 
	{ ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch2_l2b1_rd_q_addr_err_7  = 
	{ ((`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU2_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU2_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU2_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire  [7:0] dram_ch2_l2b1_rd_q_addr_err = {dram_ch2_l2b1_rd_q_addr_err_7, dram_ch2_l2b1_rd_q_addr_err_6, dram_ch2_l2b1_rd_q_addr_err_5, dram_ch2_l2b1_rd_q_addr_err_4,
						    dram_ch2_l2b1_rd_q_addr_err_3, dram_ch2_l2b1_rd_q_addr_err_2, dram_ch2_l2b1_rd_q_addr_err_1, dram_ch2_l2b1_rd_q_addr_err_0};

   wire  [7:0]  dram_ch2_l2b1_drq_rd_queue_valid	= {`MCU2_DRQ1_CTL.drq_rd_queue_valid[7:0]};    
   wire  [3:0]  dram_ch2_l2b1_drq_read_queue_cnt 		= {`MCU2_DRQ1_CTL.drq_read_queue_cnt[3:0]};      

// Read request Q PA-Error

   wire  [39:0]		dram_Ch2_l2b1_rd_q_0 	= {`MCU2_DRQ1_CTL.drq_rdbuf_valids[0],
                                                   `MCU2_L2B1_ADR_Q.rd_req_id_queue0[2:0],
						   `MCU2_L2B1_ADR_Q.rank_rd_adr_queue0[3:0],
						   `MCU2_L2B1_ADR_Q.bank_rd_adr_queue0[2:0],
						   `MCU2_L2B1_ADR_Q.ras_rd_adr_queue0[14:0],
						   `MCU2_L2B1_ADR_Q.cas_rd_adr_queue0[10:0],
						    3'b0 };

   wire  [39:0] 	dram_Ch2_l2b1_rd_q_1 	= {`MCU2_DRQ1_CTL.drq_rdbuf_valids[1],
                                                   `MCU2_L2B1_ADR_Q.rd_req_id_queue1[2:0],
                                                   `MCU2_L2B1_ADR_Q.rank_rd_adr_queue1[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_rd_adr_queue1[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_rd_adr_queue1[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_rd_adr_queue1[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b1_rd_q_2 	= {`MCU2_DRQ1_CTL.drq_rdbuf_valids[2],
                                                   `MCU2_L2B1_ADR_Q.rd_req_id_queue2[2:0],
                                                   `MCU2_L2B1_ADR_Q.rank_rd_adr_queue2[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_rd_adr_queue2[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_rd_adr_queue2[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_rd_adr_queue2[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b1_rd_q_3 	= {`MCU2_DRQ1_CTL.drq_rdbuf_valids[3],
                                                   `MCU2_L2B1_ADR_Q.rd_req_id_queue3[2:0],
                                                   `MCU2_L2B1_ADR_Q.rank_rd_adr_queue3[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_rd_adr_queue3[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_rd_adr_queue3[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_rd_adr_queue3[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b1_rd_q_4 	= {`MCU2_DRQ1_CTL.drq_rdbuf_valids[4],
                                                   `MCU2_L2B1_ADR_Q.rd_req_id_queue4[2:0],
                                                   `MCU2_L2B1_ADR_Q.rank_rd_adr_queue4[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_rd_adr_queue4[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_rd_adr_queue4[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_rd_adr_queue4[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b1_rd_q_5 	= {`MCU2_DRQ1_CTL.drq_rdbuf_valids[5],
                                                   `MCU2_L2B1_ADR_Q.rd_req_id_queue5[2:0],
                                                   `MCU2_L2B1_ADR_Q.rank_rd_adr_queue5[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_rd_adr_queue5[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_rd_adr_queue5[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_rd_adr_queue5[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b1_rd_q_6 	= {`MCU2_DRQ1_CTL.drq_rdbuf_valids[6],
                                                   `MCU2_L2B1_ADR_Q.rd_req_id_queue6[2:0],
                                                   `MCU2_L2B1_ADR_Q.rank_rd_adr_queue6[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_rd_adr_queue6[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_rd_adr_queue6[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_rd_adr_queue6[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch2_l2b1_rd_q_7 	= {`MCU2_DRQ1_CTL.drq_rdbuf_valids[7],
                                                   `MCU2_L2B1_ADR_Q.rd_req_id_queue7[2:0],
                                                   `MCU2_L2B1_ADR_Q.rank_rd_adr_queue7[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_rd_adr_queue7[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_rd_adr_queue7[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_rd_adr_queue7[10:0], 
                                                    3'b0  };


   reg   [39:0]        	dram_Ch2_l2b1_rd_q[7:0];
   // read que collapsing fifo
   wire  [11:0]   	dram_Ch2_l2b1_rd_colps_q_0 	= {`MCU2_DRQ1_CTL.drq_rd_queue_ent0[11:0]};
   wire  [11:0]   	dram_Ch2_l2b1_rd_colps_q_1 	= {`MCU2_DRQ1_CTL.drq_rd_queue_ent1[11:0]};
   wire  [11:0]   	dram_Ch2_l2b1_rd_colps_q_2 	= {`MCU2_DRQ1_CTL.drq_rd_queue_ent2[11:0]};
   wire  [11:0]   	dram_Ch2_l2b1_rd_colps_q_3 	= {`MCU2_DRQ1_CTL.drq_rd_queue_ent3[11:0]};
   wire  [11:0]   	dram_Ch2_l2b1_rd_colps_q_4 	= {`MCU2_DRQ1_CTL.drq_rd_queue_ent4[11:0]};
   wire  [11:0]   	dram_Ch2_l2b1_rd_colps_q_5 	= {`MCU2_DRQ1_CTL.drq_rd_queue_ent5[11:0]};
   wire  [11:0]   	dram_Ch2_l2b1_rd_colps_q_6 	= {`MCU2_DRQ1_CTL.drq_rd_queue_ent6[11:0]};
   wire  [11:0]   	dram_Ch2_l2b1_rd_colps_q_7 	= {`MCU2_DRQ1_CTL.drq_rd_queue_ent7[11:0]};

   reg   [11:0]   	dram_Ch2_l2b1_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	dram_Ch2_l2b1_rd_que_wr_ptr 	= {`MCU2_DRQ1_CTL.drq_rd_adr_queue7_en,
                                                     	   `MCU2_DRQ1_CTL.drq_rd_adr_queue6_en,
                                                     	   `MCU2_DRQ1_CTL.drq_rd_adr_queue5_en,
                                                     	   `MCU2_DRQ1_CTL.drq_rd_adr_queue4_en,
                                                     	   `MCU2_DRQ1_CTL.drq_rd_adr_queue3_en,
                                                     	   `MCU2_DRQ1_CTL.drq_rd_adr_queue2_en,
                                                     	   `MCU2_DRQ1_CTL.drq_rd_adr_queue1_en,
                                                     	   `MCU2_DRQ1_CTL.drq_rd_adr_queue0_en};
   // read que read pointer 
   wire  [7:0]   	dram_Ch2_l2b1_rd_que_rd_ptr 	= {`MCU2_DRQ1_CTL.rdpctl_drq_clear_ent[7:0]};

   // write que request 
   wire                	dram_Ch2_l2b1_wr_req    = `MCU2_L2IF1_CTL.l2t_mcu_wr_req;
   wire    [2:0]       	dram_Ch2_l2b1_wr_addr   = `MCU2_L2IF1_CTL.l2if_data_wr_addr;

   wire  [7:0]  dram_ch2_l2b1_wr_q_valids		= {`MCU2_DRQ1_CTL.drq_wr_queue_valid[7:0]};	
   wire  [3:0]  dram_ch2_l2b1_drq_write_queue_cnt	= {`MCU2_DRQ1_CTL.drq_write_queue_cnt[3:0]};	

   wire  [40:0] 	dram_Ch2_l2b1_wr_q_0 	= {`MCU2_DRQ1_CTL.drq_wrbuf_valids[0],
                                                   `MCU2_DRQ1_CTL.drq_wrbuf_valids[0],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ1_CTL.drq_wr_queue_ent0[11:9],
                                                   `MCU2_L2B1_ADR_Q.rank_wr_adr_queue0[3:0],
						   `MCU2_L2B1_ADR_Q.bank_wr_adr_queue0[2:0],
						   `MCU2_L2B1_ADR_Q.ras_wr_adr_queue0[14:0],
						   `MCU2_L2B1_ADR_Q.cas_wr_adr_queue0[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b1_wr_q_1      = {`MCU2_DRQ1_CTL.drq_wrbuf_valids[1],
                                                   `MCU2_DRQ1_CTL.drq_wrbuf_valids[1],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ1_CTL.drq_wr_queue_ent1[11:9],
                                                   `MCU2_L2B1_ADR_Q.rank_wr_adr_queue1[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_wr_adr_queue1[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_wr_adr_queue1[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_wr_adr_queue1[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b1_wr_q_2      = {`MCU2_DRQ1_CTL.drq_wrbuf_valids[2],
                                                   `MCU2_DRQ1_CTL.drq_wrbuf_valids[2],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ1_CTL.drq_wr_queue_ent2[11:9],
                                                   `MCU2_L2B1_ADR_Q.rank_wr_adr_queue2[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_wr_adr_queue2[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_wr_adr_queue2[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_wr_adr_queue2[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b1_wr_q_3      = {`MCU2_DRQ1_CTL.drq_wrbuf_valids[3],
                                                   `MCU2_DRQ1_CTL.drq_wrbuf_valids[3],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ1_CTL.drq_wr_queue_ent3[11:9],
                                                   `MCU2_L2B1_ADR_Q.rank_wr_adr_queue3[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_wr_adr_queue3[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_wr_adr_queue3[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_wr_adr_queue3[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b1_wr_q_4      = {`MCU2_DRQ1_CTL.drq_wrbuf_valids[4],
                                                   `MCU2_DRQ1_CTL.drq_wrbuf_valids[4],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ1_CTL.drq_wr_queue_ent4[11:9],
                                                   `MCU2_L2B1_ADR_Q.rank_wr_adr_queue4[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_wr_adr_queue4[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_wr_adr_queue4[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_wr_adr_queue4[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b1_wr_q_5      = {`MCU2_DRQ1_CTL.drq_wrbuf_valids[5],
                                                   `MCU2_DRQ1_CTL.drq_wrbuf_valids[5],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ1_CTL.drq_wr_queue_ent5[11:9],
                                                   `MCU2_L2B1_ADR_Q.rank_wr_adr_queue5[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_wr_adr_queue5[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_wr_adr_queue5[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_wr_adr_queue5[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b1_wr_q_6      = {`MCU2_DRQ1_CTL.drq_wrbuf_valids[6],
                                                   `MCU2_DRQ1_CTL.drq_wrbuf_valids[6],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ1_CTL.drq_wr_queue_ent6[11:9],
                                                   `MCU2_L2B1_ADR_Q.rank_wr_adr_queue6[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_wr_adr_queue6[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_wr_adr_queue6[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_wr_adr_queue6[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch2_l2b1_wr_q_7      = {`MCU2_DRQ1_CTL.drq_wrbuf_valids[7],
                                                   `MCU2_DRQ1_CTL.drq_wrbuf_valids[7],	//`DRAM_PATH2.writeqbank0vld0_arb,
                                                   `MCU2_DRQ1_CTL.drq_wr_queue_ent7[11:9],
                                                   `MCU2_L2B1_ADR_Q.rank_wr_adr_queue7[3:0],
                                                   `MCU2_L2B1_ADR_Q.bank_wr_adr_queue7[2:0],
                                                   `MCU2_L2B1_ADR_Q.ras_wr_adr_queue7[14:0],
                                                   `MCU2_L2B1_ADR_Q.cas_wr_adr_queue7[10:0],
						    3'b0};

   reg   [40:0]        dram_Ch2_l2b1_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch2_l2b1_pa_err   = `MCU2_L2RDMX_DP.l2b1_wr_addr_err;

   // write que collapsing fifo
   wire  [14:0]		dram_Ch2_l2b1_wr_colps_q_0 	= {`MCU2_DRQ1_CTL.drq_wr_queue_ent0[14:0]};
   wire  [14:0]   	dram_Ch2_l2b1_wr_colps_q_1 	= {`MCU2_DRQ1_CTL.drq_wr_queue_ent1[14:0]};
   wire  [14:0]   	dram_Ch2_l2b1_wr_colps_q_2 	= {`MCU2_DRQ1_CTL.drq_wr_queue_ent2[14:0]};
   wire  [14:0]   	dram_Ch2_l2b1_wr_colps_q_3 	= {`MCU2_DRQ1_CTL.drq_wr_queue_ent3[14:0]};
   wire  [14:0]   	dram_Ch2_l2b1_wr_colps_q_4 	= {`MCU2_DRQ1_CTL.drq_wr_queue_ent4[14:0]};
   wire  [14:0]   	dram_Ch2_l2b1_wr_colps_q_5 	= {`MCU2_DRQ1_CTL.drq_wr_queue_ent5[14:0]};
   wire  [14:0]   	dram_Ch2_l2b1_wr_colps_q_6 	= {`MCU2_DRQ1_CTL.drq_wr_queue_ent6[14:0]};
   wire  [14:0]   	dram_Ch2_l2b1_wr_colps_q_7 	= {`MCU2_DRQ1_CTL.drq_wr_queue_ent7[14:0]};

   reg   [14:0]   	dram_Ch2_l2b1_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	dram_Ch2_l2b1_wr_que_wr_ptr 	= {`MCU2_DRQ1_CTL.drq_wr_adr_queue7_en,
                                                           `MCU2_DRQ1_CTL.drq_wr_adr_queue6_en,
                                                           `MCU2_DRQ1_CTL.drq_wr_adr_queue5_en,
                                                           `MCU2_DRQ1_CTL.drq_wr_adr_queue4_en,
                                                           `MCU2_DRQ1_CTL.drq_wr_adr_queue3_en,
                                                           `MCU2_DRQ1_CTL.drq_wr_adr_queue2_en,
                                                           `MCU2_DRQ1_CTL.drq_wr_adr_queue1_en,
                                                           `MCU2_DRQ1_CTL.drq_wr_adr_queue0_en};

   // write que arb read pointer 

   // write que data read pointer 
   /*wire  [7:0]          dram_Ch2_l2b1_wr_que_rd_ptr   = {`MCU2_DRQ1_CTL.drq_wr_entry7_rank,
                                                           `MCU2_DRQ1_CTL.drq_wr_entry6_rank,
                                                           `MCU2_DRQ1_CTL.drq_wr_entry5_rank,
                                                           `MCU2_DRQ1_CTL.drq_wr_entry4_rank,
                                                           `MCU2_DRQ1_CTL.drq_wr_entry3_rank,
                                                           `MCU2_DRQ1_CTL.drq_wr_entry2_rank,
                                                           `MCU2_DRQ1_CTL.drq_wr_entry1_rank,
                                                           `MCU2_DRQ1_CTL.drq_wr_entry0_rank};*/
   wire  [7:0]          dram_Ch2_l2b1_wr_que_rd_ptr   = `MCU2_DRQ1_CTL.drq_wrq_clear_ent;


// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch2_l2b1_que_b0_index_en   = {`MCU2_L2B1_ADR_Q.rd_adr_queue_sel[7:0]};


// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch2_l2b1_que_b0_wr_index_en= {`MCU2_L2B1_ADR_Q.wr_adr_queue_sel[7:0]};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch2_l2b1_que_b0_rd_in_val  =  `MCU2_DRQ1_CTL.drq_rd_entry0_val[7:0];

   wire                   dram_Ch2_que_b1_rd_picked           =  `MCU2_DRIF_CTL.drif1_rd_picked;
   wire                   dram_Ch2_que_b1_wr_picked           =  `MCU2_DRIF_CTL.drif1_wr_picked;



// MAQ Not Required   wire  [7:0]            dram_Ch2_que_cas_picked    =  `MCU2_DRIF_CTL.drif_cas_picked_d1[7:0];
// rd hits a wr in the wr Q
   wire                   dram_Ch2_que_rd_wr_hit     =  `MCU2_DRIF_CTL.drif_wr_entry_pend_in;

// MAQ N2 doesn't support		// Signals that will be used to detect oldest entry to the same bank.
// MAQ N2 doesn't support		   // in 2 channel mode this is the real indicator that the request is picked from this channel
// MAQ N2 doesn't support		   wire                   dram_Ch2_que_this_ch_picked     =  (~`DRAM_PATH2.que_channel_disabled) ?
// MAQ N2 doesn't support		                           `DRAM_PATH2.que_ras_bank_picked_en && ~`DRAM_PATH2.que_channel_picked_internal:
// MAQ N2 doesn't support		                           `DRAM_PATH2.que_ras_bank_picked_en &&  `DRAM_PATH2.que_channel_picked_internal;
// MAQ N2 doesn't support		 

   wire  [2:0]            dram_Ch2_que_b0_index_picked        =  `MCU2_DRIF_CTL.drif_rdwr_index_picked[2:0];
   wire                   dram_Ch2_que_b0_cmd_picked          =  `MCU2_DRIF_CTL.drif_rdwr_cmd_picked;
   wire			  dram_ch2_drif_mclk_en		 = `MCU2_DRIF_CTL.drif_mclk_en;


//----------------------------------------------------------------------------------------
// Refresh to go and all CAS request to same CS are done, no new RAS issued.
//----------------------------------------------------------------------------------------
   wire  [4:0]   	  dram_Ch2_que_pos    	       = `MCU2_DRIF_CTL.drif_mcu_state_enc;
   wire          	  dram_Ch2_que_ref_go 	       = `MCU2_DRIF_CTL.drif_ref_go;
   wire          	  dram_Ch2_que_hw_selfrsh 	       = `MCU2_DRIF_CTL.drif_hw_selfrsh;
   wire          	  dram_Ch2_pt_blk_new_openbank_d1   = `MCU2_DRIF_CTL.drif_blk_new_openbank;
   wire  	   	  dram_Ch2_que_cas_valid 	       = ( (|(`MCU2_DRIF_CTL.drif_cas_picked)) &
								     (`MCU2_DRIF_CTL.drif_phy_bank_picked[1:0] == `MCU2_DRIF_CTL.drif_refresh_rank[1:0])
								 );
   wire	[15:0] 		  dram_Ch2_ras_picked               =  `MCU2_DRIF_CTL.drif_ras_picked[15:0];
   wire	 		  dram_Ch2_que_ras_picked           = ( (|(`MCU2_DRIF_CTL.drif_ras_picked[15:0])) &
								  ({`MCU2_DRIF_CTL.drif_rank_adr, `MCU2_DRIF_CTL.drif_stacked_dimm} == `MCU2_DRIF_CTL.drif_refresh_rank[1:0])
								 );
   wire  [1:0]   	  dram_Ch2_b0_phy_bank_bits 	       = `MCU2_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch2_b1_phy_bank_bits 	       = `MCU2_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch2_b2_phy_bank_bits 	       = `MCU2_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch2_b3_phy_bank_bits 	       = `MCU2_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch2_b4_phy_bank_bits 	       = `MCU2_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch2_b5_phy_bank_bits 	       = `MCU2_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch2_b6_phy_bank_bits 	       = `MCU2_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch2_b7_phy_bank_bits 	       = `MCU2_DRIF_CTL.drif_phy_bank_picked[1:0];
   reg   [1:0]   	  dram_Ch2_b_phy_bank_bits[7:0];

   wire  [1:0]   	  dram_Ch2_que_refresh_rank 	       = `MCU2_DRIF_CTL.drif_refresh_rank[1:0];


// ---- Starvation counter causing the wr to have priority ---
   wire     	  	dram_Ch2_que_pick_wr_first 	= (`MCU2_DRIF_CTL.drif0_pick_wr_first |
							`MCU2_DRIF_CTL.drif1_pick_wr_first);

// ------ Scrub Related -------

   // picking the que_split_scrb_addr as _que_scrb_addr_picked_
   wire  [31:0]   	  dram_Ch2_que_scrb_addr_picked 	= `MCU2_DRIF_CTL.drif_scrub_addr;
   wire           	  dram_Ch2_que_scrb_picked 		= `MCU2_DRIF_CTL.drif_scrub_picked;
   //somePersonwire           	  dram_Ch2_que_scrb_rd_picked 	= `MCU2_DRIF_CTL.drif_scrub_picked;	// MAQ
   wire           	  dram_Ch2_que_scrb_rd_picked 	= `MCU2_DRIF_CTL.drif_scrub_read_pending;
   wire           	  dram_Ch2_que_ras_bank_picked_en 	= |(`MCU2_DRIF_CTL.drif_ras_picked[15:0]);
   wire           	  dram_Ch2_que_scrb_write_req 	= `MCU2_DRIF_CTL.drif_scrub_write_req;

// req valid and scrb valid, the scrb should be cleared first
   wire  [15:0]   	  dram_Ch2_que_l2req_valid 	=  `MCU2_DRIF_CTL.drif0_rd_bank_valids | `MCU2_DRIF_CTL.drif1_rd_bank_valids |
							   `MCU2_DRIF_CTL.drif_wr_bank_valids;
   wire  [15:0]   	  dram_Ch2_scrb_indx_val   	=  `MCU2_DRIF_CTL.drif_scrub_entry_val;

// ------- DRAM REGISTERS --------

   wire  [8:0]   	  dram_Ch2_chip_config_reg 	        = {`MCU2_DRIF_CTL.drif_ras_addr_bits[3:0],
								  `MCU2_DRIF_CTL.drif_cas_addr_bits[3:0],
								  `MCU2_DRIF_CTL.drif_stacked_dimm};

   wire  [2:0]   	  dram_Ch2_mode_reg        	        = `MCU2_DRIF_CTL.mode_reg[6:4];
   wire  [3:0]   	  dram_Ch2_rrd_reg        	        = `MCU2_DRIF_CTL.rrd_reg;
   wire  [4:0]   	  dram_Ch2_rc_reg         	        = `MCU2_DRIF_CTL.rc_reg;
   wire  [3:0]   	  dram_Ch2_rcd_reg         	        = `MCU2_DRIF_CTL.rcd_reg;
   wire  [3:0]   	  dram_Ch2_wtr_dly_reg         	= `MCU2_DRIF_CTL.wtr_dly_reg;
   wire  [3:0]   	  dram_Ch2_rtw_dly_reg         	= `MCU2_DRIF_CTL.rtw_dly_reg;
   wire  [3:0]   	  dram_Ch2_rtp_reg         		= `MCU2_DRIF_CTL.rtp_reg;
   wire  [3:0]   	  dram_Ch2_ras_reg         		= `MCU2_DRIF_CTL.ras_reg;
   wire  [3:0]   	  dram_Ch2_rp_reg          		= `MCU2_DRIF_CTL.rp_reg;
   wire  [3:0]   	  dram_Ch2_wr_reg          		= `MCU2_DRIF_CTL.wr_reg;
   wire  [1:0]   	  dram_Ch2_mrd_reg          		= `MCU2_DRIF_CTL.mrd_reg;
   wire  [1:0]   	  dram_Ch2_iwtr_reg          	= `MCU2_DRIF_CTL.iwtr_reg;
   wire  [14:0]   	  dram_Ch2_ext_mode_reg2          	= `MCU2_DRIF_CTL.ext_mode_reg2;
   wire  [14:0]   	  dram_Ch2_ext_mode_reg1          	= `MCU2_DRIF_CTL.ext_mode_reg1;
   wire  [14:0]   	  dram_Ch2_ext_mode_reg3          	= `MCU2_DRIF_CTL.ext_mode_reg3;
   wire          	  dram_Ch2_que_eight_bank_mode       = `MCU2_DRIF_CTL.drif_eight_bank_mode;
   wire          	  dram_Ch2_que_rank1_present         = `MCU2_DRIF_CTL.drif_dimms_present[0];
   wire          	  dram_Ch2_que_channel_disabled      = `MCU2_DRIF_CTL.drif_branch_disabled;
   wire          	  dram_Ch2_que_addr_bank_low_sel     = `MCU2_DRIF_CTL.drif_addr_bank_low_sel;
   wire          	  dram_Ch2_que_init     		= `MCU2_DRIF_CTL.drif_init;
//   wire  [2:0]   	  dram_Ch2_que_data_del_cnt          = `MCU2_DRIF_CTL.drif_data_del_cnt[2:0];
//   wire          	  dram_Ch2_dram_io_pad_clk_inv       = `MCU2_DRIF_CTL.mcu_ddp_pad_clk_inv;
//   wire  [1:0]   	  dram_Ch2_dram_io_ptr_clk_inv       = `MCU2_DRIF_CTL.mcu_ddp_ptr_clk_inv;
   wire          	  dram_Ch2_que_wr_mode_reg_done      = `MCU2_DRIF_CTL.drif_wr_mode_reg_done;
   wire          	  dram_Ch2_que_init_status_reg       = `MCU2_DRIF_CTL.drif_init_status_reg;
   wire  [3:0]   	  dram_Ch2_que_dimms_present         = `MCU2_DRIF_CTL.drif_dimms_present;
   wire          	  dram_Ch2_dram_fail_over_mode       = `MCU2_DRIF_CTL.drif_fail_over_mode;
   wire  [34:0]  	  dram_Ch2_dram_fail_over_mask       = `MCU2_DRIF_CTL.drif_fail_over_mask[34:0];
   wire          	  dram_Ch2_que_dbg_trig_en	        = `MCU2_DRIF_CTL.rdpctl_dbg_trig_enable;
   wire  [22:0]  	  dram_Ch2_que_err_sts_reg	        = `MCU2_DRIF_CTL.rdpctl_err_sts_reg;
   wire  [35:0]  	  dram_Ch2_que_err_addr_reg	        = `MCU2_DRIF_CTL.rdpctl_err_addr_reg;
   wire          	  dram_Ch2_err_inj_reg	        = `MCU2_DRIF_CTL.drif_err_inj_reg;
   wire          	  dram_Ch2_sshot_err_reg	        = `MCU2_DRIF_CTL.drif_sshot_err_reg;
//   wire  [1:0]  	  dram_Ch2_que_err_cnt  	        = `MCU2_DRIF_CTL.rdpctl_err_cnt[17:16];
   wire  [35:0]  	  dram_Ch2_que_err_loc  	        = `MCU2_DRIF_CTL.rdpctl_err_loc;

   // NACK - for non existant register read
   wire          	  dram_Ch2_que_l2if_ack_vld	        = `MCU2_DRIF_CTL.drif_rdata_ack_vld;
   wire          	  dram_Ch2_que_l2if_nack_vld	        = `MCU2_DRIF_CTL.drif_rdata_nack_vld;

   wire          	  dram_Ch2_que_init_dram_done	= `MCU2_DRIF_CTL.drif_init_mcu_done;

// ----- DRAM L2IF INTERFACE -----

   wire  [127:0] 	  dram_Ch2_dram_sctag_data         	= `MCU2.mcu_l2b_data_r3;
   // Error signal for update of error status, error location and error address register.
   //wire          	  dram_Ch2_l2if_scrb_val_d2          = `DRAM_L2IF2.l2if_scrb_val_d3;

   // l2if_scrb_data_val is now qualifying scrb in the rtl
   wire          	  dram_Ch2_l2if_scrb_val_d2          = `MCU2_RDPCTL_CTL.rdpctl_scrub_data_valid;

   wire  [6:0]   	  dram_Ch2_err_sts_reg               = `MCU2_RDPCTL_CTL.rdpctl_err_sts_reg[25:19];

   wire          	  dram_Ch2_l2if_err_sts_reg_en6      = `MCU2_RDPCTL_CTL.rdpctl_meu_error_en;
   wire          	  dram_Ch2_l2if_err_sts_reg_en5      = `MCU2_RDPCTL_CTL.rdpctl_mec_error_en;
   wire          	  dram_Ch2_l2if_err_sts_reg_en4      = `MCU2_RDPCTL_CTL.rdpctl_dac_error_en;
   wire          	  dram_Ch2_l2if_err_sts_reg_en3      = `MCU2_RDPCTL_CTL.rdpctl_dau_error_en;
   wire          	  dram_Ch2_l2if_err_sts_reg_en2      = `MCU2_RDPCTL_CTL.rdpctl_dsc_error_en;
   wire          	  dram_Ch2_l2if_err_sts_reg_en1      = `MCU2_RDPCTL_CTL.rdpctl_dsu_error_en;
   wire          	  dram_Ch2_l2if_err_sts_reg_en0      = `MCU2_RDPCTL_CTL.rdpctl_err_sts_reg_en;
   wire          	  dram_Ch2_l2if_err_sts_reg_en       = `MCU2_RDPCTL_CTL.rdpctl_dbu_error_en;
   wire          	  dram_Ch2_l2if_err_addr_reg_en      = `MCU2_RDPCTL_CTL.rdpctl_err_addr_reg_en;
   wire          	  dram_Ch2_l2if_secc_loc_en          = `MCU2_RDPCTL_CTL.rdpctl_secc_loc_en;


   wire          	  dram_Ch2_l2b0_sctag_dram_rd_req 	= `MCU2_L2IF0_CTL.l2t_mcu_rd_req;
   wire  [2:0]   	  dram_Ch2_l2b0_sctag_dram_rd_req_id 	= `MCU2_L2IF0_CTL.l2t_mcu_rd_req_id;
//   wire  [39:6]   	  dram_Ch2_l2b0_sctag_dram_addr      	= {`MCU2_ADDRDP_DP.l2t0_mcu_addr_39to9, `MCU2_ADDRDP_DP.l2t0_mcu_addr_6to4};
   wire  [39:5]   	  dram_Ch2_l2b0_sctag_dram_addr      	= `MCU2_L2IF0_CTL.l2t_mcu_addr;
   wire          	  dram_Ch2_l2b0_sctag_dram_rd_dummy_req 	= `MCU2_L2IF0_CTL.l2t_mcu_rd_dummy_req;
   wire          	  dram_Ch2_l2b0_dram_sctag_rd_ack       	= `MCU2_L2IF0_CTL.mcu_l2t_rd_ack;
   wire          	  dram_Ch2_l2b0_sctag_dram_wr_req 	= `MCU2_L2IF0_CTL.l2t_mcu_wr_req;
   wire          	  dram_Ch2_l2b0_sctag_dram_data_vld 	= `MCU2_L2IF0_CTL.l2b_mcu_data_vld;
   wire  [63:0]  	  dram_Ch2_l2b0_sctag_dram_wr_data 	= `MCU2_L2RDMX_DP.l2b0_mcu_wr_data_r5;
   wire          	  dram_Ch2_l2b0_dram_sctag_wr_ack       	= `MCU2_L2IF0_CTL.mcu_l2t_wr_ack;
   wire          	  dram_Ch2_l2b0_dram_sctag_data_vld     	= `MCU2_RDATA_CTL.mcu_l2t0_data_vld_r0;
   wire  [2:0]   	  dram_Ch2_l2b0_dram_sctag_rd_req_id    	= `MCU2_RDATA_CTL.mcu_l2t0_rd_req_id_r0;

// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch2_l2if_b0_rd_val          	= `DRAM_L2IF2.l2if_b0_rd_val;
// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch2_l2if_b1_rd_val          	= `DRAM_L2IF2.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch2_l2b0_l2if_b0_wr_val          	= {`MCU2_L2IF0_CTL.l2if_wr_entry3,
									   `MCU2_L2IF0_CTL.l2if_wr_entry2,
									   `MCU2_L2IF0_CTL.l2if_wr_entry1,
									   `MCU2_L2IF0_CTL.l2if_wr_entry0};

   wire  [3:0]   	  dram_Ch2_l2b0_l2if_b1_wr_val          	= {`MCU2_L2IF0_CTL.l2if_wr_entry7, 
									   `MCU2_L2IF0_CTL.l2if_wr_entry6,
									   `MCU2_L2IF0_CTL.l2if_wr_entry5,
									   `MCU2_L2IF0_CTL.l2if_wr_entry4};

// MAQ   wire  [5:0]   	  dram_Ch2_l2b0_l2if_wr_b0_data_addr      = `MCU2_L2IF0_CTL.l2if_wdq_wadr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch2_l2b0_dram_sctag_secc_err       = `MCU2_RDATA_CTL.mcu_l2t0_secc_err_r3;
   wire          	  dram_Ch2_l2b0_dram_sctag_pa_err         = `MCU2_L2RDMX_DP.l2b0_rd_addr_err | `MCU2_L2RDMX_DP.l2b0_wr_addr_err;
   wire          	  dram_Ch2_l2b0_dram_sctag_mecc_err       = `MCU2_RDATA_CTL.mcu_l2t0_mecc_err_r3;
   wire          	  dram_Ch2_l2b0_dram_sctag_scb_secc_err   = `MCU2_RDATA_CTL.mcu_l2t0_scb_secc_err;
   wire          	  dram_Ch2_l2b0_dram_sctag_scb_mecc_err   = `MCU2_RDATA_CTL.mcu_l2t0_scb_mecc_err;

// qualified with vld since they can be on due to residual ( previous error )
/*   wire			dram_Ch2_l2b0_l2if_secc_err             = `MCU2_RDATA_CTL.mcu_l2t0_secc_err_r3 && 
								    (`MCU2_RDATA_CTL.mcu_l2t0_data_vld_r0 || 
								     `MCU2_RDPCTL_CTL.rdpctl_scrub_data_valid);

   wire          	  dram_Ch2_l2b0_l2if_mecc_err_partial     = `MCU2_RDATA_CTL.mcu_l2t0_mecc_err_r3 && 
									 (`MCU2_RDATA_CTL.mcu_l2t0_data_vld_r0 || 
									  `MCU2_RDPCTL_CTL.rdpctl_scrub_data_valid);
*/
   wire dram_Ch2_l2b0_l2if_secc_err = `MCU2_RDATA_CTL.mcu_l2t0_scb_secc_err_in ||
                                      `MCU2_RDATA_CTL.mcu_l2t0_secc_err_r1;
   wire dram_Ch2_l2b0_l2if_mecc_err_partial = `MCU2_RDATA_CTL.mcu_l2t0_scb_mecc_err_in ||
                                      `MCU2_RDATA_CTL.mcu_l2t0_mecc_err_r1;
   wire          	  dram_Ch2_l2b0_l2if_pa_err               = (`MCU2_L2RDMX_DP.l2b0_rd_addr_err || `MCU2_L2RDMX_DP.l2b0_wr_addr_err) && 
									`MCU2_RDATA_CTL.mcu_l2t0_data_vld_r0;

   wire  [1:0]   	  dram_Ch2_l2b0_cpu_wr_en                	= `MCU2_L2IF0_CTL.l2if_wdq_we;
   wire  [4:0]   	  dram_Ch2_l2b0_cpu_wr_addr               = `MCU2_L2IF0_CTL.l2if_wdq_wadr;
   wire  		  dram_Ch2_l2b0_wdq_rd_en			= `MCU2_DRIF_CTL.drif0_wdq_rd;
   wire  [4:0]   	  dram_Ch2_l2b0_wdq_radr			= `MCU2_DRIF_CTL.drif0_wdq_radr;

   wire          	  dram_Ch2_l2b0_clspine_dram_txrd_sync 	= `MCU2_RDATA_CTL.rdata_cmp_ddr_sync_en;
   wire          	  dram_Ch2_l2b0_clspine_dram_txwr_sync 	= `MCU2_RDATA_CTL.rdata_cmp_ddr_sync_en;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch2_l2b0_l2if_wr_entry             = {
                                                                  `MCU2_L2IF0_CTL.l2if_wr_entry7,
                                                                  `MCU2_L2IF0_CTL.l2if_wr_entry6,
                                                                  `MCU2_L2IF0_CTL.l2if_wr_entry5,
                                                                  `MCU2_L2IF0_CTL.l2if_wr_entry4,
                                                                  `MCU2_L2IF0_CTL.l2if_wr_entry3,
                                                                  `MCU2_L2IF0_CTL.l2if_wr_entry2,
                                                                  `MCU2_L2IF0_CTL.l2if_wr_entry1,
                                                                  `MCU2_L2IF0_CTL.l2if_wr_entry0
                                                                  };



/*  wire   [8:0]            dram_Ch2_l2b0_rd_adr_info_hi		 = {
                                                                  `MCU2_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU2_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU2_DRIF_CTL.drif_stack_adr,
                                                                  `MCU2_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU2_L2B0_ADRGEN_DP.bank_adr[2] && `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU2_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0	// `DRAM_L2IF2.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch2_l2b0_wr_adr_info_hi		 = {
                                                                  `MCU2_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU2_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU2_DRIF_CTL.drif_stack_adr,
                                                                  `MCU2_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU2_L2B0_ADRGEN_DP.bank_adr[2] && `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU2_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF2.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch2_l2b0_rd_adr_info_lo		 = {
                                                                  `MCU2_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU2_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU2_DRIF_CTL.drif_stack_adr,
                                                                  `MCU2_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU2_L2B0_ADRGEN_DP.bank_adr[2] && `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU2_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF2.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch2_l2b0_wr_adr_info_lo		 = {
                                                                  `MCU2_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU2_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU2_DRIF_CTL.drif_stack_adr,
                                                                  `MCU2_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU2_L2B0_ADRGEN_DP.bank_adr[2] && `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU2_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF2.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };*/
                                                                 

   wire          	  dram_Ch2_l2b1_sctag_dram_rd_req 	= `MCU2_L2IF1_CTL.l2t_mcu_rd_req;
   wire  [2:0]   	  dram_Ch2_l2b1_sctag_dram_rd_req_id 	= `MCU2_L2IF1_CTL.l2t_mcu_rd_req_id;
//   wire  [39:6]   	  dram_Ch2_l2b1_sctag_dram_addr      	= {`MCU2_ADDRDP_DP.l2t1_mcu_addr_39to9, `MCU2_ADDRDP_DP.l2t1_mcu_addr_6to4};
   wire  [39:5]   	  dram_Ch2_l2b1_sctag_dram_addr      	= `MCU2_L2IF1_CTL.l2t_mcu_addr;
   wire          	  dram_Ch2_l2b1_sctag_dram_rd_dummy_req 	= `MCU2_L2IF1_CTL.l2t_mcu_rd_dummy_req;
   wire          	  dram_Ch2_l2b1_dram_sctag_rd_ack       	= `MCU2_L2IF1_CTL.mcu_l2t_rd_ack;
   wire          	  dram_Ch2_l2b1_sctag_dram_wr_req 	= `MCU2_L2IF1_CTL.l2t_mcu_wr_req;
   wire          	  dram_Ch2_l2b1_sctag_dram_data_vld 	= `MCU2_L2IF1_CTL.l2b_mcu_data_vld;
   wire  [63:0]  	  dram_Ch2_l2b1_sctag_dram_wr_data 	= `MCU2_L2RDMX_DP.l2b1_mcu_wr_data_r5;
   wire          	  dram_Ch2_l2b1_dram_sctag_wr_ack       	= `MCU2_L2IF1_CTL.mcu_l2t_wr_ack;
   wire          	  dram_Ch2_l2b1_dram_sctag_data_vld     	= `MCU2_RDATA_CTL.mcu_l2t1_data_vld_r0;
   wire  [2:0]   	  dram_Ch2_l2b1_dram_sctag_rd_req_id    	= `MCU2_RDATA_CTL.mcu_l2t1_rd_req_id_r0;

// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch2_l2if_b0_rd_val          	= `DRAM_L2IF2.l2if_b0_rd_val;
// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch2_l2if_b1_rd_val          	= `DRAM_L2IF2.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch2_l2b1_l2if_b0_wr_val          	= {`MCU2_L2IF1_CTL.l2if_wr_entry3,
									   `MCU2_L2IF1_CTL.l2if_wr_entry2,
									   `MCU2_L2IF1_CTL.l2if_wr_entry1,
									   `MCU2_L2IF1_CTL.l2if_wr_entry0};

   wire  [3:0]   	  dram_Ch2_l2b1_l2if_b1_wr_val          	= {`MCU2_L2IF1_CTL.l2if_wr_entry7, 
									   `MCU2_L2IF1_CTL.l2if_wr_entry6,
									   `MCU2_L2IF1_CTL.l2if_wr_entry5,
									   `MCU2_L2IF1_CTL.l2if_wr_entry4};

// MAQ   wire  [5:0]   	  dram_Ch2_l2b1_l2if_wr_b0_data_addr      = `MCU2_L2IF1_CTL.l2if_wdq_wadr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch2_l2b1_dram_sctag_secc_err       = `MCU2_RDATA_CTL.mcu_l2t1_secc_err_r3;
   wire          	  dram_Ch2_l2b1_dram_sctag_pa_err         = `MCU2_L2RDMX_DP.l2b1_rd_addr_err | `MCU2_L2RDMX_DP.l2b1_wr_addr_err;
   wire          	  dram_Ch2_l2b1_dram_sctag_mecc_err       = `MCU2_RDATA_CTL.mcu_l2t1_mecc_err_r3;
   wire          	  dram_Ch2_l2b1_dram_sctag_scb_secc_err   = `MCU2_RDATA_CTL.mcu_l2t1_scb_secc_err;
   wire          	  dram_Ch2_l2b1_dram_sctag_scb_mecc_err   = `MCU2_RDATA_CTL.mcu_l2t1_scb_mecc_err;

// qualified with vld since they can be on due to residual ( previous error )
/*   wire			dram_Ch2_l2b1_l2if_secc_err             = `MCU2_RDATA_CTL.mcu_l2t1_secc_err_r3 && 
								    (`MCU2_RDATA_CTL.mcu_l2t1_data_vld_r0 || 
								     `MCU2_RDPCTL_CTL.rdpctl_scrub_data_valid);

   wire          	  dram_Ch2_l2b1_l2if_mecc_err_partial     = `MCU2_RDATA_CTL.mcu_l2t1_mecc_err_r3 && 
									 (`MCU2_RDATA_CTL.mcu_l2t1_data_vld_r0 || 
									  `MCU2_RDPCTL_CTL.rdpctl_scrub_data_valid);
*/
   wire dram_Ch2_l2b1_l2if_secc_err = `MCU2_RDATA_CTL.mcu_l2t1_scb_secc_err_in ||
                                      `MCU2_RDATA_CTL.mcu_l2t1_secc_err_r1;
   wire dram_Ch2_l2b1_l2if_mecc_err_partial = `MCU2_RDATA_CTL.mcu_l2t1_scb_mecc_err_in ||
                                      `MCU2_RDATA_CTL.mcu_l2t1_mecc_err_r1;
   wire          	  dram_Ch2_l2b1_l2if_pa_err               = (`MCU2_L2RDMX_DP.l2b1_rd_addr_err || `MCU2_L2RDMX_DP.l2b1_wr_addr_err) && 
									`MCU2_RDATA_CTL.mcu_l2t1_data_vld_r0;

   wire  [1:0]   	  dram_Ch2_l2b1_cpu_wr_en                	= `MCU2_L2IF1_CTL.l2if_wdq_we;
   wire  [4:0]   	  dram_Ch2_l2b1_cpu_wr_addr               = `MCU2_L2IF1_CTL.l2if_wdq_wadr;
   wire  		  dram_Ch2_l2b1_wdq_rd_en			= `MCU2_DRIF_CTL.drif1_wdq_rd;
   wire  [4:0]   	  dram_Ch2_l2b1_wdq_radr			= `MCU2_DRIF_CTL.drif1_wdq_radr;

   wire          	  dram_Ch2_l2b1_clspine_dram_txrd_sync 	= `MCU2_RDATA_CTL.rdata_cmp_ddr_sync_en;
   wire          	  dram_Ch2_l2b1_clspine_dram_txwr_sync 	= `MCU2_RDATA_CTL.rdata_cmp_ddr_sync_en;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch2_l2b1_l2if_wr_entry             = {
                                                                  `MCU2_L2IF1_CTL.l2if_wr_entry7,
                                                                  `MCU2_L2IF1_CTL.l2if_wr_entry6,
                                                                  `MCU2_L2IF1_CTL.l2if_wr_entry5,
                                                                  `MCU2_L2IF1_CTL.l2if_wr_entry4,
                                                                  `MCU2_L2IF1_CTL.l2if_wr_entry3,
                                                                  `MCU2_L2IF1_CTL.l2if_wr_entry2,
                                                                  `MCU2_L2IF1_CTL.l2if_wr_entry1,
                                                                  `MCU2_L2IF1_CTL.l2if_wr_entry0
                                                                  };



/*  wire   [8:0]            dram_Ch2_l2b1_rd_adr_info_hi		 = {
                                                                  `MCU2_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU2_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU2_DRIF_CTL.drif_stack_adr,
                                                                  `MCU2_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU2_L2B1_ADRGEN_DP.bank_adr[2] && `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU2_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0	// `DRAM_L2IF2.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch2_l2b1_wr_adr_info_hi		 = {
                                                                  `MCU2_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU2_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU2_DRIF_CTL.drif_stack_adr,
                                                                  `MCU2_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU2_L2B1_ADRGEN_DP.bank_adr[2] && `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU2_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF2.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch2_l2b1_rd_adr_info_lo		 = {
                                                                  `MCU2_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU2_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU2_DRIF_CTL.drif_stack_adr,
                                                                  `MCU2_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU2_L2B1_ADRGEN_DP.bank_adr[2] && `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU2_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF2.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch2_l2b1_wr_adr_info_lo		 = {
                                                                  `MCU2_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU2_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU2_DRIF_CTL.drif_stack_adr,
                                                                  `MCU2_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU2_L2B1_ADRGEN_DP.bank_adr[2] && `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU2_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU2_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF2.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };*/
                                                                 

 
// ---- Performance counters ----

   wire  [7:0]            dram_Ch2_perf_cntl          = `MCU2_DRIF_CTL.drif_perf_cntl_reg;
   wire                   dram_Ch2_cnt0_sticky_bit    = `MCU2_DRIF_CTL.drif_perf_cnt0_reg[31];
   wire                   dram_Ch2_cnt1_sticky_bit    = `MCU2_DRIF_CTL.drif_perf_cnt1_reg[31];

   // read que request 
   wire                   dram_Ch3_l2b0_rd_req    = `MCU3_L2IF0_CTL.l2t_mcu_rd_req;
   wire    [2:0]          dram_Ch3_l2b0_rd_id     = `MCU3_L2IF0_CTL.l2t_mcu_rd_req_id[2:0];
   wire                   dram_Ch3_l2b0_errq_vld   = (!`MCU3_DRIF_CTL.drif_err_fifo_empty) & (`MCU3_DRIF_CTL.rdpctl_err_fifo_data[0] == 0) ;
   wire    [2:0]          dram_Ch3_l2b0_errq_id   = `MCU3_DRIF_CTL.rdpctl_err_fifo_data[4:2];
   // read que
   wire  	dram_ch3_l2b0_rd_q_vld_0  = { ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0])) };

   wire  	dram_ch3_l2b0_rd_q_vld_1  = { ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1])) };

   wire  	dram_ch3_l2b0_rd_q_vld_2  = { ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2])) };

   wire  	dram_ch3_l2b0_rd_q_vld_3  = { ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3])) };

   wire  	dram_ch3_l2b0_rd_q_vld_4  = { ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4])) };

   wire  	dram_ch3_l2b0_rd_q_vld_5  = { ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5])) };

   wire  	dram_ch3_l2b0_rd_q_vld_6  = { ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6])) };

   wire  	dram_ch3_l2b0_rd_q_vld_7  = { ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7])) };

   wire  [7:0]	dram_ch3_l2b0_rd_q_valids = {dram_ch3_l2b0_rd_q_vld_7, dram_ch3_l2b0_rd_q_vld_6, dram_ch3_l2b0_rd_q_vld_5, dram_ch3_l2b0_rd_q_vld_4,
						   dram_ch3_l2b0_rd_q_vld_3, dram_ch3_l2b0_rd_q_vld_2, dram_ch3_l2b0_rd_q_vld_1, dram_ch3_l2b0_rd_q_vld_0};
   
// Read request Q PA-Error
   wire         dram_ch3_l2b0_rd_q_addr_err_0  = 
	{ ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch3_l2b0_rd_q_addr_err_1  = 
	{ ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent6[7]) };

   wire 	dram_ch3_l2b0_rd_q_addr_err_2  = 
	{ ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch3_l2b0_rd_q_addr_err_3  = 
	{ ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch3_l2b0_rd_q_addr_err_4  = 
	{ ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch3_l2b0_rd_q_addr_err_5  = 
	{ ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch3_l2b0_rd_q_addr_err_6  = 
	{ ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch3_l2b0_rd_q_addr_err_7  = 
	{ ((`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU3_DRQ0_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ0_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ0_CTL.drq_rd_queue_ent7[7]) };

   wire  [7:0] dram_ch3_l2b0_rd_q_addr_err = {dram_ch3_l2b0_rd_q_addr_err_7, dram_ch3_l2b0_rd_q_addr_err_6, dram_ch3_l2b0_rd_q_addr_err_5, dram_ch3_l2b0_rd_q_addr_err_4,
						    dram_ch3_l2b0_rd_q_addr_err_3, dram_ch3_l2b0_rd_q_addr_err_2, dram_ch3_l2b0_rd_q_addr_err_1, dram_ch3_l2b0_rd_q_addr_err_0};

   wire  [7:0]  dram_ch3_l2b0_drq_rd_queue_valid	= {`MCU3_DRQ0_CTL.drq_rd_queue_valid[7:0]};    
   wire  [3:0]  dram_ch3_l2b0_drq_read_queue_cnt 		= {`MCU3_DRQ0_CTL.drq_read_queue_cnt[3:0]};      

// Read request Q PA-Error

   wire  [39:0]		dram_Ch3_l2b0_rd_q_0 	= {`MCU3_DRQ0_CTL.drq_rdbuf_valids[0],
                                                   `MCU3_L2B0_ADR_Q.rd_req_id_queue0[2:0],
						   `MCU3_L2B0_ADR_Q.rank_rd_adr_queue0[3:0],
						   `MCU3_L2B0_ADR_Q.bank_rd_adr_queue0[2:0],
						   `MCU3_L2B0_ADR_Q.ras_rd_adr_queue0[14:0],
						   `MCU3_L2B0_ADR_Q.cas_rd_adr_queue0[10:0],
						    3'b0 };

   wire  [39:0] 	dram_Ch3_l2b0_rd_q_1 	= {`MCU3_DRQ0_CTL.drq_rdbuf_valids[1],
                                                   `MCU3_L2B0_ADR_Q.rd_req_id_queue1[2:0],
                                                   `MCU3_L2B0_ADR_Q.rank_rd_adr_queue1[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_rd_adr_queue1[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_rd_adr_queue1[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_rd_adr_queue1[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b0_rd_q_2 	= {`MCU3_DRQ0_CTL.drq_rdbuf_valids[2],
                                                   `MCU3_L2B0_ADR_Q.rd_req_id_queue2[2:0],
                                                   `MCU3_L2B0_ADR_Q.rank_rd_adr_queue2[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_rd_adr_queue2[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_rd_adr_queue2[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_rd_adr_queue2[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b0_rd_q_3 	= {`MCU3_DRQ0_CTL.drq_rdbuf_valids[3],
                                                   `MCU3_L2B0_ADR_Q.rd_req_id_queue3[2:0],
                                                   `MCU3_L2B0_ADR_Q.rank_rd_adr_queue3[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_rd_adr_queue3[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_rd_adr_queue3[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_rd_adr_queue3[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b0_rd_q_4 	= {`MCU3_DRQ0_CTL.drq_rdbuf_valids[4],
                                                   `MCU3_L2B0_ADR_Q.rd_req_id_queue4[2:0],
                                                   `MCU3_L2B0_ADR_Q.rank_rd_adr_queue4[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_rd_adr_queue4[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_rd_adr_queue4[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_rd_adr_queue4[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b0_rd_q_5 	= {`MCU3_DRQ0_CTL.drq_rdbuf_valids[5],
                                                   `MCU3_L2B0_ADR_Q.rd_req_id_queue5[2:0],
                                                   `MCU3_L2B0_ADR_Q.rank_rd_adr_queue5[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_rd_adr_queue5[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_rd_adr_queue5[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_rd_adr_queue5[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b0_rd_q_6 	= {`MCU3_DRQ0_CTL.drq_rdbuf_valids[6],
                                                   `MCU3_L2B0_ADR_Q.rd_req_id_queue6[2:0],
                                                   `MCU3_L2B0_ADR_Q.rank_rd_adr_queue6[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_rd_adr_queue6[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_rd_adr_queue6[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_rd_adr_queue6[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b0_rd_q_7 	= {`MCU3_DRQ0_CTL.drq_rdbuf_valids[7],
                                                   `MCU3_L2B0_ADR_Q.rd_req_id_queue7[2:0],
                                                   `MCU3_L2B0_ADR_Q.rank_rd_adr_queue7[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_rd_adr_queue7[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_rd_adr_queue7[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_rd_adr_queue7[10:0], 
                                                    3'b0  };


   reg   [39:0]        	dram_Ch3_l2b0_rd_q[7:0];
   // read que collapsing fifo
   wire  [11:0]   	dram_Ch3_l2b0_rd_colps_q_0 	= {`MCU3_DRQ0_CTL.drq_rd_queue_ent0[11:0]};
   wire  [11:0]   	dram_Ch3_l2b0_rd_colps_q_1 	= {`MCU3_DRQ0_CTL.drq_rd_queue_ent1[11:0]};
   wire  [11:0]   	dram_Ch3_l2b0_rd_colps_q_2 	= {`MCU3_DRQ0_CTL.drq_rd_queue_ent2[11:0]};
   wire  [11:0]   	dram_Ch3_l2b0_rd_colps_q_3 	= {`MCU3_DRQ0_CTL.drq_rd_queue_ent3[11:0]};
   wire  [11:0]   	dram_Ch3_l2b0_rd_colps_q_4 	= {`MCU3_DRQ0_CTL.drq_rd_queue_ent4[11:0]};
   wire  [11:0]   	dram_Ch3_l2b0_rd_colps_q_5 	= {`MCU3_DRQ0_CTL.drq_rd_queue_ent5[11:0]};
   wire  [11:0]   	dram_Ch3_l2b0_rd_colps_q_6 	= {`MCU3_DRQ0_CTL.drq_rd_queue_ent6[11:0]};
   wire  [11:0]   	dram_Ch3_l2b0_rd_colps_q_7 	= {`MCU3_DRQ0_CTL.drq_rd_queue_ent7[11:0]};

   reg   [11:0]   	dram_Ch3_l2b0_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	dram_Ch3_l2b0_rd_que_wr_ptr 	= {`MCU3_DRQ0_CTL.drq_rd_adr_queue7_en,
                                                     	   `MCU3_DRQ0_CTL.drq_rd_adr_queue6_en,
                                                     	   `MCU3_DRQ0_CTL.drq_rd_adr_queue5_en,
                                                     	   `MCU3_DRQ0_CTL.drq_rd_adr_queue4_en,
                                                     	   `MCU3_DRQ0_CTL.drq_rd_adr_queue3_en,
                                                     	   `MCU3_DRQ0_CTL.drq_rd_adr_queue2_en,
                                                     	   `MCU3_DRQ0_CTL.drq_rd_adr_queue1_en,
                                                     	   `MCU3_DRQ0_CTL.drq_rd_adr_queue0_en};
   // read que read pointer 
   wire  [7:0]   	dram_Ch3_l2b0_rd_que_rd_ptr 	= {`MCU3_DRQ0_CTL.rdpctl_drq_clear_ent[7:0]};

   // write que request 
   wire                	dram_Ch3_l2b0_wr_req    = `MCU3_L2IF0_CTL.l2t_mcu_wr_req;
   wire    [2:0]       	dram_Ch3_l2b0_wr_addr   = `MCU3_L2IF0_CTL.l2if_data_wr_addr;

   wire  [7:0]  dram_ch3_l2b0_wr_q_valids		= {`MCU3_DRQ0_CTL.drq_wr_queue_valid[7:0]};	
   wire  [3:0]  dram_ch3_l2b0_drq_write_queue_cnt	= {`MCU3_DRQ0_CTL.drq_write_queue_cnt[3:0]};	

   wire  [40:0] 	dram_Ch3_l2b0_wr_q_0 	= {`MCU3_DRQ0_CTL.drq_wrbuf_valids[0],
                                                   `MCU3_DRQ0_CTL.drq_wrbuf_valids[0],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ0_CTL.drq_wr_queue_ent0[11:9],
                                                   `MCU3_L2B0_ADR_Q.rank_wr_adr_queue0[3:0],
						   `MCU3_L2B0_ADR_Q.bank_wr_adr_queue0[2:0],
						   `MCU3_L2B0_ADR_Q.ras_wr_adr_queue0[14:0],
						   `MCU3_L2B0_ADR_Q.cas_wr_adr_queue0[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b0_wr_q_1      = {`MCU3_DRQ0_CTL.drq_wrbuf_valids[1],
                                                   `MCU3_DRQ0_CTL.drq_wrbuf_valids[1],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ0_CTL.drq_wr_queue_ent1[11:9],
                                                   `MCU3_L2B0_ADR_Q.rank_wr_adr_queue1[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_wr_adr_queue1[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_wr_adr_queue1[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_wr_adr_queue1[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b0_wr_q_2      = {`MCU3_DRQ0_CTL.drq_wrbuf_valids[2],
                                                   `MCU3_DRQ0_CTL.drq_wrbuf_valids[2],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ0_CTL.drq_wr_queue_ent2[11:9],
                                                   `MCU3_L2B0_ADR_Q.rank_wr_adr_queue2[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_wr_adr_queue2[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_wr_adr_queue2[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_wr_adr_queue2[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b0_wr_q_3      = {`MCU3_DRQ0_CTL.drq_wrbuf_valids[3],
                                                   `MCU3_DRQ0_CTL.drq_wrbuf_valids[3],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ0_CTL.drq_wr_queue_ent3[11:9],
                                                   `MCU3_L2B0_ADR_Q.rank_wr_adr_queue3[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_wr_adr_queue3[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_wr_adr_queue3[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_wr_adr_queue3[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b0_wr_q_4      = {`MCU3_DRQ0_CTL.drq_wrbuf_valids[4],
                                                   `MCU3_DRQ0_CTL.drq_wrbuf_valids[4],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ0_CTL.drq_wr_queue_ent4[11:9],
                                                   `MCU3_L2B0_ADR_Q.rank_wr_adr_queue4[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_wr_adr_queue4[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_wr_adr_queue4[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_wr_adr_queue4[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b0_wr_q_5      = {`MCU3_DRQ0_CTL.drq_wrbuf_valids[5],
                                                   `MCU3_DRQ0_CTL.drq_wrbuf_valids[5],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ0_CTL.drq_wr_queue_ent5[11:9],
                                                   `MCU3_L2B0_ADR_Q.rank_wr_adr_queue5[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_wr_adr_queue5[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_wr_adr_queue5[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_wr_adr_queue5[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b0_wr_q_6      = {`MCU3_DRQ0_CTL.drq_wrbuf_valids[6],
                                                   `MCU3_DRQ0_CTL.drq_wrbuf_valids[6],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ0_CTL.drq_wr_queue_ent6[11:9],
                                                   `MCU3_L2B0_ADR_Q.rank_wr_adr_queue6[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_wr_adr_queue6[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_wr_adr_queue6[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_wr_adr_queue6[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b0_wr_q_7      = {`MCU3_DRQ0_CTL.drq_wrbuf_valids[7],
                                                   `MCU3_DRQ0_CTL.drq_wrbuf_valids[7],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ0_CTL.drq_wr_queue_ent7[11:9],
                                                   `MCU3_L2B0_ADR_Q.rank_wr_adr_queue7[3:0],
                                                   `MCU3_L2B0_ADR_Q.bank_wr_adr_queue7[2:0],
                                                   `MCU3_L2B0_ADR_Q.ras_wr_adr_queue7[14:0],
                                                   `MCU3_L2B0_ADR_Q.cas_wr_adr_queue7[10:0],
						    3'b0};

   reg   [40:0]        dram_Ch3_l2b0_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch3_l2b0_pa_err   = `MCU3_L2RDMX_DP.l2b0_wr_addr_err;

   // write que collapsing fifo
   wire  [14:0]		dram_Ch3_l2b0_wr_colps_q_0 	= {`MCU3_DRQ0_CTL.drq_wr_queue_ent0[14:0]};
   wire  [14:0]   	dram_Ch3_l2b0_wr_colps_q_1 	= {`MCU3_DRQ0_CTL.drq_wr_queue_ent1[14:0]};
   wire  [14:0]   	dram_Ch3_l2b0_wr_colps_q_2 	= {`MCU3_DRQ0_CTL.drq_wr_queue_ent2[14:0]};
   wire  [14:0]   	dram_Ch3_l2b0_wr_colps_q_3 	= {`MCU3_DRQ0_CTL.drq_wr_queue_ent3[14:0]};
   wire  [14:0]   	dram_Ch3_l2b0_wr_colps_q_4 	= {`MCU3_DRQ0_CTL.drq_wr_queue_ent4[14:0]};
   wire  [14:0]   	dram_Ch3_l2b0_wr_colps_q_5 	= {`MCU3_DRQ0_CTL.drq_wr_queue_ent5[14:0]};
   wire  [14:0]   	dram_Ch3_l2b0_wr_colps_q_6 	= {`MCU3_DRQ0_CTL.drq_wr_queue_ent6[14:0]};
   wire  [14:0]   	dram_Ch3_l2b0_wr_colps_q_7 	= {`MCU3_DRQ0_CTL.drq_wr_queue_ent7[14:0]};

   reg   [14:0]   	dram_Ch3_l2b0_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	dram_Ch3_l2b0_wr_que_wr_ptr 	= {`MCU3_DRQ0_CTL.drq_wr_adr_queue7_en,
                                                           `MCU3_DRQ0_CTL.drq_wr_adr_queue6_en,
                                                           `MCU3_DRQ0_CTL.drq_wr_adr_queue5_en,
                                                           `MCU3_DRQ0_CTL.drq_wr_adr_queue4_en,
                                                           `MCU3_DRQ0_CTL.drq_wr_adr_queue3_en,
                                                           `MCU3_DRQ0_CTL.drq_wr_adr_queue2_en,
                                                           `MCU3_DRQ0_CTL.drq_wr_adr_queue1_en,
                                                           `MCU3_DRQ0_CTL.drq_wr_adr_queue0_en};

   // write que arb read pointer 

   // write que data read pointer 
   /*wire  [7:0]          dram_Ch3_l2b0_wr_que_rd_ptr   = {`MCU3_DRQ0_CTL.drq_wr_entry7_rank,
                                                           `MCU3_DRQ0_CTL.drq_wr_entry6_rank,
                                                           `MCU3_DRQ0_CTL.drq_wr_entry5_rank,
                                                           `MCU3_DRQ0_CTL.drq_wr_entry4_rank,
                                                           `MCU3_DRQ0_CTL.drq_wr_entry3_rank,
                                                           `MCU3_DRQ0_CTL.drq_wr_entry2_rank,
                                                           `MCU3_DRQ0_CTL.drq_wr_entry1_rank,
                                                           `MCU3_DRQ0_CTL.drq_wr_entry0_rank};*/
   wire  [7:0]          dram_Ch3_l2b0_wr_que_rd_ptr   = `MCU3_DRQ0_CTL.drq_wrq_clear_ent;


// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch3_l2b0_que_b0_index_en   = {`MCU3_L2B0_ADR_Q.rd_adr_queue_sel[7:0]};


// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch3_l2b0_que_b0_wr_index_en= {`MCU3_L2B0_ADR_Q.wr_adr_queue_sel[7:0]};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch3_l2b0_que_b0_rd_in_val  =  `MCU3_DRQ0_CTL.drq_rd_entry0_val[7:0];

   wire                   dram_Ch3_que_b0_rd_picked           =  `MCU3_DRIF_CTL.drif0_rd_picked;
   wire                   dram_Ch3_que_b0_wr_picked           =  `MCU3_DRIF_CTL.drif0_wr_picked;
   // read que request 
   wire                   dram_Ch3_l2b1_rd_req    = `MCU3_L2IF1_CTL.l2t_mcu_rd_req;
   wire    [2:0]          dram_Ch3_l2b1_rd_id     = `MCU3_L2IF1_CTL.l2t_mcu_rd_req_id[2:0];
   wire                   dram_Ch3_l2b1_errq_vld   = (!`MCU3_DRIF_CTL.drif_err_fifo_empty) & (`MCU3_DRIF_CTL.rdpctl_err_fifo_data[0] == 1) ;
   wire    [2:0]          dram_Ch3_l2b1_errq_id   = `MCU3_DRIF_CTL.rdpctl_err_fifo_data[4:2];
   // read que
   wire  	dram_ch3_l2b1_rd_q_vld_0  = { ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0])) };

   wire  	dram_ch3_l2b1_rd_q_vld_1  = { ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1])) };

   wire  	dram_ch3_l2b1_rd_q_vld_2  = { ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2])) };

   wire  	dram_ch3_l2b1_rd_q_vld_3  = { ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3])) };

   wire  	dram_ch3_l2b1_rd_q_vld_4  = { ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4])) };

   wire  	dram_ch3_l2b1_rd_q_vld_5  = { ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5])) };

   wire  	dram_ch3_l2b1_rd_q_vld_6  = { ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6])) };

   wire  	dram_ch3_l2b1_rd_q_vld_7  = { ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7])) |
   						    ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7])) };

   wire  [7:0]	dram_ch3_l2b1_rd_q_valids = {dram_ch3_l2b1_rd_q_vld_7, dram_ch3_l2b1_rd_q_vld_6, dram_ch3_l2b1_rd_q_vld_5, dram_ch3_l2b1_rd_q_vld_4,
						   dram_ch3_l2b1_rd_q_vld_3, dram_ch3_l2b1_rd_q_vld_2, dram_ch3_l2b1_rd_q_vld_1, dram_ch3_l2b1_rd_q_vld_0};
   
// Read request Q PA-Error
   wire         dram_ch3_l2b1_rd_q_addr_err_0  = 
	{ ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h0) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[0]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch3_l2b1_rd_q_addr_err_1  = 
	{ ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h1) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[1]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent6[7]) };

   wire 	dram_ch3_l2b1_rd_q_addr_err_2  = 
	{ ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h2) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[2]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch3_l2b1_rd_q_addr_err_3  = 
	{ ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h3) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[3]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch3_l2b1_rd_q_addr_err_4  = 
	{ ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h4) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[4]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire         dram_ch3_l2b1_rd_q_addr_err_5  = 
	{ ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h5) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[5]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch3_l2b1_rd_q_addr_err_6  = 
	{ ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h6) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[6]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent7[7]) };
                                                   
   wire         dram_ch3_l2b1_rd_q_addr_err_7  = 
	{ ((`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[0]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent0[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[1]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent1[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[2]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent2[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[3]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent3[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[4]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent4[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[5]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent5[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[6]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent6[7]) |
          ((`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:9] == 3'h7) & (`MCU3_DRQ1_CTL.drq_rd_queue_valid[7]) & (`MCU3_DRQ1_CTL.drq_rdbuf_valids[7]) & `MCU3_DRQ1_CTL.drq_rd_queue_ent7[7]) };

   wire  [7:0] dram_ch3_l2b1_rd_q_addr_err = {dram_ch3_l2b1_rd_q_addr_err_7, dram_ch3_l2b1_rd_q_addr_err_6, dram_ch3_l2b1_rd_q_addr_err_5, dram_ch3_l2b1_rd_q_addr_err_4,
						    dram_ch3_l2b1_rd_q_addr_err_3, dram_ch3_l2b1_rd_q_addr_err_2, dram_ch3_l2b1_rd_q_addr_err_1, dram_ch3_l2b1_rd_q_addr_err_0};

   wire  [7:0]  dram_ch3_l2b1_drq_rd_queue_valid	= {`MCU3_DRQ1_CTL.drq_rd_queue_valid[7:0]};    
   wire  [3:0]  dram_ch3_l2b1_drq_read_queue_cnt 		= {`MCU3_DRQ1_CTL.drq_read_queue_cnt[3:0]};      

// Read request Q PA-Error

   wire  [39:0]		dram_Ch3_l2b1_rd_q_0 	= {`MCU3_DRQ1_CTL.drq_rdbuf_valids[0],
                                                   `MCU3_L2B1_ADR_Q.rd_req_id_queue0[2:0],
						   `MCU3_L2B1_ADR_Q.rank_rd_adr_queue0[3:0],
						   `MCU3_L2B1_ADR_Q.bank_rd_adr_queue0[2:0],
						   `MCU3_L2B1_ADR_Q.ras_rd_adr_queue0[14:0],
						   `MCU3_L2B1_ADR_Q.cas_rd_adr_queue0[10:0],
						    3'b0 };

   wire  [39:0] 	dram_Ch3_l2b1_rd_q_1 	= {`MCU3_DRQ1_CTL.drq_rdbuf_valids[1],
                                                   `MCU3_L2B1_ADR_Q.rd_req_id_queue1[2:0],
                                                   `MCU3_L2B1_ADR_Q.rank_rd_adr_queue1[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_rd_adr_queue1[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_rd_adr_queue1[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_rd_adr_queue1[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b1_rd_q_2 	= {`MCU3_DRQ1_CTL.drq_rdbuf_valids[2],
                                                   `MCU3_L2B1_ADR_Q.rd_req_id_queue2[2:0],
                                                   `MCU3_L2B1_ADR_Q.rank_rd_adr_queue2[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_rd_adr_queue2[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_rd_adr_queue2[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_rd_adr_queue2[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b1_rd_q_3 	= {`MCU3_DRQ1_CTL.drq_rdbuf_valids[3],
                                                   `MCU3_L2B1_ADR_Q.rd_req_id_queue3[2:0],
                                                   `MCU3_L2B1_ADR_Q.rank_rd_adr_queue3[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_rd_adr_queue3[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_rd_adr_queue3[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_rd_adr_queue3[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b1_rd_q_4 	= {`MCU3_DRQ1_CTL.drq_rdbuf_valids[4],
                                                   `MCU3_L2B1_ADR_Q.rd_req_id_queue4[2:0],
                                                   `MCU3_L2B1_ADR_Q.rank_rd_adr_queue4[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_rd_adr_queue4[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_rd_adr_queue4[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_rd_adr_queue4[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b1_rd_q_5 	= {`MCU3_DRQ1_CTL.drq_rdbuf_valids[5],
                                                   `MCU3_L2B1_ADR_Q.rd_req_id_queue5[2:0],
                                                   `MCU3_L2B1_ADR_Q.rank_rd_adr_queue5[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_rd_adr_queue5[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_rd_adr_queue5[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_rd_adr_queue5[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b1_rd_q_6 	= {`MCU3_DRQ1_CTL.drq_rdbuf_valids[6],
                                                   `MCU3_L2B1_ADR_Q.rd_req_id_queue6[2:0],
                                                   `MCU3_L2B1_ADR_Q.rank_rd_adr_queue6[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_rd_adr_queue6[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_rd_adr_queue6[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_rd_adr_queue6[10:0], 
                                                    3'b0  };

   wire  [39:0] 	dram_Ch3_l2b1_rd_q_7 	= {`MCU3_DRQ1_CTL.drq_rdbuf_valids[7],
                                                   `MCU3_L2B1_ADR_Q.rd_req_id_queue7[2:0],
                                                   `MCU3_L2B1_ADR_Q.rank_rd_adr_queue7[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_rd_adr_queue7[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_rd_adr_queue7[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_rd_adr_queue7[10:0], 
                                                    3'b0  };


   reg   [39:0]        	dram_Ch3_l2b1_rd_q[7:0];
   // read que collapsing fifo
   wire  [11:0]   	dram_Ch3_l2b1_rd_colps_q_0 	= {`MCU3_DRQ1_CTL.drq_rd_queue_ent0[11:0]};
   wire  [11:0]   	dram_Ch3_l2b1_rd_colps_q_1 	= {`MCU3_DRQ1_CTL.drq_rd_queue_ent1[11:0]};
   wire  [11:0]   	dram_Ch3_l2b1_rd_colps_q_2 	= {`MCU3_DRQ1_CTL.drq_rd_queue_ent2[11:0]};
   wire  [11:0]   	dram_Ch3_l2b1_rd_colps_q_3 	= {`MCU3_DRQ1_CTL.drq_rd_queue_ent3[11:0]};
   wire  [11:0]   	dram_Ch3_l2b1_rd_colps_q_4 	= {`MCU3_DRQ1_CTL.drq_rd_queue_ent4[11:0]};
   wire  [11:0]   	dram_Ch3_l2b1_rd_colps_q_5 	= {`MCU3_DRQ1_CTL.drq_rd_queue_ent5[11:0]};
   wire  [11:0]   	dram_Ch3_l2b1_rd_colps_q_6 	= {`MCU3_DRQ1_CTL.drq_rd_queue_ent6[11:0]};
   wire  [11:0]   	dram_Ch3_l2b1_rd_colps_q_7 	= {`MCU3_DRQ1_CTL.drq_rd_queue_ent7[11:0]};

   reg   [11:0]   	dram_Ch3_l2b1_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	dram_Ch3_l2b1_rd_que_wr_ptr 	= {`MCU3_DRQ1_CTL.drq_rd_adr_queue7_en,
                                                     	   `MCU3_DRQ1_CTL.drq_rd_adr_queue6_en,
                                                     	   `MCU3_DRQ1_CTL.drq_rd_adr_queue5_en,
                                                     	   `MCU3_DRQ1_CTL.drq_rd_adr_queue4_en,
                                                     	   `MCU3_DRQ1_CTL.drq_rd_adr_queue3_en,
                                                     	   `MCU3_DRQ1_CTL.drq_rd_adr_queue2_en,
                                                     	   `MCU3_DRQ1_CTL.drq_rd_adr_queue1_en,
                                                     	   `MCU3_DRQ1_CTL.drq_rd_adr_queue0_en};
   // read que read pointer 
   wire  [7:0]   	dram_Ch3_l2b1_rd_que_rd_ptr 	= {`MCU3_DRQ1_CTL.rdpctl_drq_clear_ent[7:0]};

   // write que request 
   wire                	dram_Ch3_l2b1_wr_req    = `MCU3_L2IF1_CTL.l2t_mcu_wr_req;
   wire    [2:0]       	dram_Ch3_l2b1_wr_addr   = `MCU3_L2IF1_CTL.l2if_data_wr_addr;

   wire  [7:0]  dram_ch3_l2b1_wr_q_valids		= {`MCU3_DRQ1_CTL.drq_wr_queue_valid[7:0]};	
   wire  [3:0]  dram_ch3_l2b1_drq_write_queue_cnt	= {`MCU3_DRQ1_CTL.drq_write_queue_cnt[3:0]};	

   wire  [40:0] 	dram_Ch3_l2b1_wr_q_0 	= {`MCU3_DRQ1_CTL.drq_wrbuf_valids[0],
                                                   `MCU3_DRQ1_CTL.drq_wrbuf_valids[0],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ1_CTL.drq_wr_queue_ent0[11:9],
                                                   `MCU3_L2B1_ADR_Q.rank_wr_adr_queue0[3:0],
						   `MCU3_L2B1_ADR_Q.bank_wr_adr_queue0[2:0],
						   `MCU3_L2B1_ADR_Q.ras_wr_adr_queue0[14:0],
						   `MCU3_L2B1_ADR_Q.cas_wr_adr_queue0[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b1_wr_q_1      = {`MCU3_DRQ1_CTL.drq_wrbuf_valids[1],
                                                   `MCU3_DRQ1_CTL.drq_wrbuf_valids[1],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ1_CTL.drq_wr_queue_ent1[11:9],
                                                   `MCU3_L2B1_ADR_Q.rank_wr_adr_queue1[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_wr_adr_queue1[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_wr_adr_queue1[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_wr_adr_queue1[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b1_wr_q_2      = {`MCU3_DRQ1_CTL.drq_wrbuf_valids[2],
                                                   `MCU3_DRQ1_CTL.drq_wrbuf_valids[2],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ1_CTL.drq_wr_queue_ent2[11:9],
                                                   `MCU3_L2B1_ADR_Q.rank_wr_adr_queue2[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_wr_adr_queue2[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_wr_adr_queue2[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_wr_adr_queue2[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b1_wr_q_3      = {`MCU3_DRQ1_CTL.drq_wrbuf_valids[3],
                                                   `MCU3_DRQ1_CTL.drq_wrbuf_valids[3],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ1_CTL.drq_wr_queue_ent3[11:9],
                                                   `MCU3_L2B1_ADR_Q.rank_wr_adr_queue3[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_wr_adr_queue3[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_wr_adr_queue3[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_wr_adr_queue3[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b1_wr_q_4      = {`MCU3_DRQ1_CTL.drq_wrbuf_valids[4],
                                                   `MCU3_DRQ1_CTL.drq_wrbuf_valids[4],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ1_CTL.drq_wr_queue_ent4[11:9],
                                                   `MCU3_L2B1_ADR_Q.rank_wr_adr_queue4[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_wr_adr_queue4[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_wr_adr_queue4[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_wr_adr_queue4[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b1_wr_q_5      = {`MCU3_DRQ1_CTL.drq_wrbuf_valids[5],
                                                   `MCU3_DRQ1_CTL.drq_wrbuf_valids[5],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ1_CTL.drq_wr_queue_ent5[11:9],
                                                   `MCU3_L2B1_ADR_Q.rank_wr_adr_queue5[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_wr_adr_queue5[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_wr_adr_queue5[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_wr_adr_queue5[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b1_wr_q_6      = {`MCU3_DRQ1_CTL.drq_wrbuf_valids[6],
                                                   `MCU3_DRQ1_CTL.drq_wrbuf_valids[6],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ1_CTL.drq_wr_queue_ent6[11:9],
                                                   `MCU3_L2B1_ADR_Q.rank_wr_adr_queue6[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_wr_adr_queue6[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_wr_adr_queue6[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_wr_adr_queue6[10:0],
						    3'b0};

   wire  [40:0]         dram_Ch3_l2b1_wr_q_7      = {`MCU3_DRQ1_CTL.drq_wrbuf_valids[7],
                                                   `MCU3_DRQ1_CTL.drq_wrbuf_valids[7],	//`DRAM_PATH3.writeqbank0vld0_arb,
                                                   `MCU3_DRQ1_CTL.drq_wr_queue_ent7[11:9],
                                                   `MCU3_L2B1_ADR_Q.rank_wr_adr_queue7[3:0],
                                                   `MCU3_L2B1_ADR_Q.bank_wr_adr_queue7[2:0],
                                                   `MCU3_L2B1_ADR_Q.ras_wr_adr_queue7[14:0],
                                                   `MCU3_L2B1_ADR_Q.cas_wr_adr_queue7[10:0],
						    3'b0};

   reg   [40:0]        dram_Ch3_l2b1_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch3_l2b1_pa_err   = `MCU3_L2RDMX_DP.l2b1_wr_addr_err;

   // write que collapsing fifo
   wire  [14:0]		dram_Ch3_l2b1_wr_colps_q_0 	= {`MCU3_DRQ1_CTL.drq_wr_queue_ent0[14:0]};
   wire  [14:0]   	dram_Ch3_l2b1_wr_colps_q_1 	= {`MCU3_DRQ1_CTL.drq_wr_queue_ent1[14:0]};
   wire  [14:0]   	dram_Ch3_l2b1_wr_colps_q_2 	= {`MCU3_DRQ1_CTL.drq_wr_queue_ent2[14:0]};
   wire  [14:0]   	dram_Ch3_l2b1_wr_colps_q_3 	= {`MCU3_DRQ1_CTL.drq_wr_queue_ent3[14:0]};
   wire  [14:0]   	dram_Ch3_l2b1_wr_colps_q_4 	= {`MCU3_DRQ1_CTL.drq_wr_queue_ent4[14:0]};
   wire  [14:0]   	dram_Ch3_l2b1_wr_colps_q_5 	= {`MCU3_DRQ1_CTL.drq_wr_queue_ent5[14:0]};
   wire  [14:0]   	dram_Ch3_l2b1_wr_colps_q_6 	= {`MCU3_DRQ1_CTL.drq_wr_queue_ent6[14:0]};
   wire  [14:0]   	dram_Ch3_l2b1_wr_colps_q_7 	= {`MCU3_DRQ1_CTL.drq_wr_queue_ent7[14:0]};

   reg   [14:0]   	dram_Ch3_l2b1_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	dram_Ch3_l2b1_wr_que_wr_ptr 	= {`MCU3_DRQ1_CTL.drq_wr_adr_queue7_en,
                                                           `MCU3_DRQ1_CTL.drq_wr_adr_queue6_en,
                                                           `MCU3_DRQ1_CTL.drq_wr_adr_queue5_en,
                                                           `MCU3_DRQ1_CTL.drq_wr_adr_queue4_en,
                                                           `MCU3_DRQ1_CTL.drq_wr_adr_queue3_en,
                                                           `MCU3_DRQ1_CTL.drq_wr_adr_queue2_en,
                                                           `MCU3_DRQ1_CTL.drq_wr_adr_queue1_en,
                                                           `MCU3_DRQ1_CTL.drq_wr_adr_queue0_en};

   // write que arb read pointer 

   // write que data read pointer 
   /*wire  [7:0]          dram_Ch3_l2b1_wr_que_rd_ptr   = {`MCU3_DRQ1_CTL.drq_wr_entry7_rank,
                                                           `MCU3_DRQ1_CTL.drq_wr_entry6_rank,
                                                           `MCU3_DRQ1_CTL.drq_wr_entry5_rank,
                                                           `MCU3_DRQ1_CTL.drq_wr_entry4_rank,
                                                           `MCU3_DRQ1_CTL.drq_wr_entry3_rank,
                                                           `MCU3_DRQ1_CTL.drq_wr_entry2_rank,
                                                           `MCU3_DRQ1_CTL.drq_wr_entry1_rank,
                                                           `MCU3_DRQ1_CTL.drq_wr_entry0_rank};*/
   wire  [7:0]          dram_Ch3_l2b1_wr_que_rd_ptr   = `MCU3_DRQ1_CTL.drq_wrq_clear_ent;


// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch3_l2b1_que_b0_index_en   = {`MCU3_L2B1_ADR_Q.rd_adr_queue_sel[7:0]};


// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch3_l2b1_que_b0_wr_index_en= {`MCU3_L2B1_ADR_Q.wr_adr_queue_sel[7:0]};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch3_l2b1_que_b0_rd_in_val  =  `MCU3_DRQ1_CTL.drq_rd_entry0_val[7:0];

   wire                   dram_Ch3_que_b1_rd_picked           =  `MCU3_DRIF_CTL.drif1_rd_picked;
   wire                   dram_Ch3_que_b1_wr_picked           =  `MCU3_DRIF_CTL.drif1_wr_picked;



// MAQ Not Required   wire  [7:0]            dram_Ch3_que_cas_picked    =  `MCU3_DRIF_CTL.drif_cas_picked_d1[7:0];
// rd hits a wr in the wr Q
   wire                   dram_Ch3_que_rd_wr_hit     =  `MCU3_DRIF_CTL.drif_wr_entry_pend_in;

// MAQ N2 doesn't support		// Signals that will be used to detect oldest entry to the same bank.
// MAQ N2 doesn't support		   // in 2 channel mode this is the real indicator that the request is picked from this channel
// MAQ N2 doesn't support		   wire                   dram_Ch3_que_this_ch_picked     =  (~`DRAM_PATH3.que_channel_disabled) ?
// MAQ N2 doesn't support		                           `DRAM_PATH3.que_ras_bank_picked_en && ~`DRAM_PATH3.que_channel_picked_internal:
// MAQ N2 doesn't support		                           `DRAM_PATH3.que_ras_bank_picked_en &&  `DRAM_PATH3.que_channel_picked_internal;
// MAQ N2 doesn't support		 

   wire  [2:0]            dram_Ch3_que_b0_index_picked        =  `MCU3_DRIF_CTL.drif_rdwr_index_picked[2:0];
   wire                   dram_Ch3_que_b0_cmd_picked          =  `MCU3_DRIF_CTL.drif_rdwr_cmd_picked;
   wire			  dram_ch3_drif_mclk_en		 = `MCU3_DRIF_CTL.drif_mclk_en;


//----------------------------------------------------------------------------------------
// Refresh to go and all CAS request to same CS are done, no new RAS issued.
//----------------------------------------------------------------------------------------
   wire  [4:0]   	  dram_Ch3_que_pos    	       = `MCU3_DRIF_CTL.drif_mcu_state_enc;
   wire          	  dram_Ch3_que_ref_go 	       = `MCU3_DRIF_CTL.drif_ref_go;
   wire          	  dram_Ch3_que_hw_selfrsh 	       = `MCU3_DRIF_CTL.drif_hw_selfrsh;
   wire          	  dram_Ch3_pt_blk_new_openbank_d1   = `MCU3_DRIF_CTL.drif_blk_new_openbank;
   wire  	   	  dram_Ch3_que_cas_valid 	       = ( (|(`MCU3_DRIF_CTL.drif_cas_picked)) &
								     (`MCU3_DRIF_CTL.drif_phy_bank_picked[1:0] == `MCU3_DRIF_CTL.drif_refresh_rank[1:0])
								 );
   wire	[15:0] 		  dram_Ch3_ras_picked               =  `MCU3_DRIF_CTL.drif_ras_picked[15:0];
   wire	 		  dram_Ch3_que_ras_picked           = ( (|(`MCU3_DRIF_CTL.drif_ras_picked[15:0])) &
								  ({`MCU3_DRIF_CTL.drif_rank_adr, `MCU3_DRIF_CTL.drif_stacked_dimm} == `MCU3_DRIF_CTL.drif_refresh_rank[1:0])
								 );
   wire  [1:0]   	  dram_Ch3_b0_phy_bank_bits 	       = `MCU3_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch3_b1_phy_bank_bits 	       = `MCU3_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch3_b2_phy_bank_bits 	       = `MCU3_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch3_b3_phy_bank_bits 	       = `MCU3_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch3_b4_phy_bank_bits 	       = `MCU3_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch3_b5_phy_bank_bits 	       = `MCU3_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch3_b6_phy_bank_bits 	       = `MCU3_DRIF_CTL.drif_phy_bank_picked[1:0];
   wire  [1:0]   	  dram_Ch3_b7_phy_bank_bits 	       = `MCU3_DRIF_CTL.drif_phy_bank_picked[1:0];
   reg   [1:0]   	  dram_Ch3_b_phy_bank_bits[7:0];

   wire  [1:0]   	  dram_Ch3_que_refresh_rank 	       = `MCU3_DRIF_CTL.drif_refresh_rank[1:0];


// ---- Starvation counter causing the wr to have priority ---
   wire     	  	dram_Ch3_que_pick_wr_first 	= (`MCU3_DRIF_CTL.drif0_pick_wr_first |
							`MCU3_DRIF_CTL.drif1_pick_wr_first);

// ------ Scrub Related -------

   // picking the que_split_scrb_addr as _que_scrb_addr_picked_
   wire  [31:0]   	  dram_Ch3_que_scrb_addr_picked 	= `MCU3_DRIF_CTL.drif_scrub_addr;
   wire           	  dram_Ch3_que_scrb_picked 		= `MCU3_DRIF_CTL.drif_scrub_picked;
   //somePersonwire           	  dram_Ch3_que_scrb_rd_picked 	= `MCU3_DRIF_CTL.drif_scrub_picked;	// MAQ
   wire           	  dram_Ch3_que_scrb_rd_picked 	= `MCU3_DRIF_CTL.drif_scrub_read_pending;
   wire           	  dram_Ch3_que_ras_bank_picked_en 	= |(`MCU3_DRIF_CTL.drif_ras_picked[15:0]);
   wire           	  dram_Ch3_que_scrb_write_req 	= `MCU3_DRIF_CTL.drif_scrub_write_req;

// req valid and scrb valid, the scrb should be cleared first
   wire  [15:0]   	  dram_Ch3_que_l2req_valid 	=  `MCU3_DRIF_CTL.drif0_rd_bank_valids | `MCU3_DRIF_CTL.drif1_rd_bank_valids |
							   `MCU3_DRIF_CTL.drif_wr_bank_valids;
   wire  [15:0]   	  dram_Ch3_scrb_indx_val   	=  `MCU3_DRIF_CTL.drif_scrub_entry_val;

// ------- DRAM REGISTERS --------

   wire  [8:0]   	  dram_Ch3_chip_config_reg 	        = {`MCU3_DRIF_CTL.drif_ras_addr_bits[3:0],
								  `MCU3_DRIF_CTL.drif_cas_addr_bits[3:0],
								  `MCU3_DRIF_CTL.drif_stacked_dimm};

   wire  [2:0]   	  dram_Ch3_mode_reg        	        = `MCU3_DRIF_CTL.mode_reg[6:4];
   wire  [3:0]   	  dram_Ch3_rrd_reg        	        = `MCU3_DRIF_CTL.rrd_reg;
   wire  [4:0]   	  dram_Ch3_rc_reg         	        = `MCU3_DRIF_CTL.rc_reg;
   wire  [3:0]   	  dram_Ch3_rcd_reg         	        = `MCU3_DRIF_CTL.rcd_reg;
   wire  [3:0]   	  dram_Ch3_wtr_dly_reg         	= `MCU3_DRIF_CTL.wtr_dly_reg;
   wire  [3:0]   	  dram_Ch3_rtw_dly_reg         	= `MCU3_DRIF_CTL.rtw_dly_reg;
   wire  [3:0]   	  dram_Ch3_rtp_reg         		= `MCU3_DRIF_CTL.rtp_reg;
   wire  [3:0]   	  dram_Ch3_ras_reg         		= `MCU3_DRIF_CTL.ras_reg;
   wire  [3:0]   	  dram_Ch3_rp_reg          		= `MCU3_DRIF_CTL.rp_reg;
   wire  [3:0]   	  dram_Ch3_wr_reg          		= `MCU3_DRIF_CTL.wr_reg;
   wire  [1:0]   	  dram_Ch3_mrd_reg          		= `MCU3_DRIF_CTL.mrd_reg;
   wire  [1:0]   	  dram_Ch3_iwtr_reg          	= `MCU3_DRIF_CTL.iwtr_reg;
   wire  [14:0]   	  dram_Ch3_ext_mode_reg2          	= `MCU3_DRIF_CTL.ext_mode_reg2;
   wire  [14:0]   	  dram_Ch3_ext_mode_reg1          	= `MCU3_DRIF_CTL.ext_mode_reg1;
   wire  [14:0]   	  dram_Ch3_ext_mode_reg3          	= `MCU3_DRIF_CTL.ext_mode_reg3;
   wire          	  dram_Ch3_que_eight_bank_mode       = `MCU3_DRIF_CTL.drif_eight_bank_mode;
   wire          	  dram_Ch3_que_rank1_present         = `MCU3_DRIF_CTL.drif_dimms_present[0];
   wire          	  dram_Ch3_que_channel_disabled      = `MCU3_DRIF_CTL.drif_branch_disabled;
   wire          	  dram_Ch3_que_addr_bank_low_sel     = `MCU3_DRIF_CTL.drif_addr_bank_low_sel;
   wire          	  dram_Ch3_que_init     		= `MCU3_DRIF_CTL.drif_init;
//   wire  [2:0]   	  dram_Ch3_que_data_del_cnt          = `MCU3_DRIF_CTL.drif_data_del_cnt[2:0];
//   wire          	  dram_Ch3_dram_io_pad_clk_inv       = `MCU3_DRIF_CTL.mcu_ddp_pad_clk_inv;
//   wire  [1:0]   	  dram_Ch3_dram_io_ptr_clk_inv       = `MCU3_DRIF_CTL.mcu_ddp_ptr_clk_inv;
   wire          	  dram_Ch3_que_wr_mode_reg_done      = `MCU3_DRIF_CTL.drif_wr_mode_reg_done;
   wire          	  dram_Ch3_que_init_status_reg       = `MCU3_DRIF_CTL.drif_init_status_reg;
   wire  [3:0]   	  dram_Ch3_que_dimms_present         = `MCU3_DRIF_CTL.drif_dimms_present;
   wire          	  dram_Ch3_dram_fail_over_mode       = `MCU3_DRIF_CTL.drif_fail_over_mode;
   wire  [34:0]  	  dram_Ch3_dram_fail_over_mask       = `MCU3_DRIF_CTL.drif_fail_over_mask[34:0];
   wire          	  dram_Ch3_que_dbg_trig_en	        = `MCU3_DRIF_CTL.rdpctl_dbg_trig_enable;
   wire  [22:0]  	  dram_Ch3_que_err_sts_reg	        = `MCU3_DRIF_CTL.rdpctl_err_sts_reg;
   wire  [35:0]  	  dram_Ch3_que_err_addr_reg	        = `MCU3_DRIF_CTL.rdpctl_err_addr_reg;
   wire          	  dram_Ch3_err_inj_reg	        = `MCU3_DRIF_CTL.drif_err_inj_reg;
   wire          	  dram_Ch3_sshot_err_reg	        = `MCU3_DRIF_CTL.drif_sshot_err_reg;
//   wire  [1:0]  	  dram_Ch3_que_err_cnt  	        = `MCU3_DRIF_CTL.rdpctl_err_cnt[17:16];
   wire  [35:0]  	  dram_Ch3_que_err_loc  	        = `MCU3_DRIF_CTL.rdpctl_err_loc;

   // NACK - for non existant register read
   wire          	  dram_Ch3_que_l2if_ack_vld	        = `MCU3_DRIF_CTL.drif_rdata_ack_vld;
   wire          	  dram_Ch3_que_l2if_nack_vld	        = `MCU3_DRIF_CTL.drif_rdata_nack_vld;

   wire          	  dram_Ch3_que_init_dram_done	= `MCU3_DRIF_CTL.drif_init_mcu_done;

// ----- DRAM L2IF INTERFACE -----

   wire  [127:0] 	  dram_Ch3_dram_sctag_data         	= `MCU3.mcu_l2b_data_r3;
   // Error signal for update of error status, error location and error address register.
   //wire          	  dram_Ch3_l2if_scrb_val_d2          = `DRAM_L2IF3.l2if_scrb_val_d3;

   // l2if_scrb_data_val is now qualifying scrb in the rtl
   wire          	  dram_Ch3_l2if_scrb_val_d2          = `MCU3_RDPCTL_CTL.rdpctl_scrub_data_valid;

   wire  [6:0]   	  dram_Ch3_err_sts_reg               = `MCU3_RDPCTL_CTL.rdpctl_err_sts_reg[25:19];

   wire          	  dram_Ch3_l2if_err_sts_reg_en6      = `MCU3_RDPCTL_CTL.rdpctl_meu_error_en;
   wire          	  dram_Ch3_l2if_err_sts_reg_en5      = `MCU3_RDPCTL_CTL.rdpctl_mec_error_en;
   wire          	  dram_Ch3_l2if_err_sts_reg_en4      = `MCU3_RDPCTL_CTL.rdpctl_dac_error_en;
   wire          	  dram_Ch3_l2if_err_sts_reg_en3      = `MCU3_RDPCTL_CTL.rdpctl_dau_error_en;
   wire          	  dram_Ch3_l2if_err_sts_reg_en2      = `MCU3_RDPCTL_CTL.rdpctl_dsc_error_en;
   wire          	  dram_Ch3_l2if_err_sts_reg_en1      = `MCU3_RDPCTL_CTL.rdpctl_dsu_error_en;
   wire          	  dram_Ch3_l2if_err_sts_reg_en0      = `MCU3_RDPCTL_CTL.rdpctl_err_sts_reg_en;
   wire          	  dram_Ch3_l2if_err_sts_reg_en       = `MCU3_RDPCTL_CTL.rdpctl_dbu_error_en;
   wire          	  dram_Ch3_l2if_err_addr_reg_en      = `MCU3_RDPCTL_CTL.rdpctl_err_addr_reg_en;
   wire          	  dram_Ch3_l2if_secc_loc_en          = `MCU3_RDPCTL_CTL.rdpctl_secc_loc_en;


   wire          	  dram_Ch3_l2b0_sctag_dram_rd_req 	= `MCU3_L2IF0_CTL.l2t_mcu_rd_req;
   wire  [2:0]   	  dram_Ch3_l2b0_sctag_dram_rd_req_id 	= `MCU3_L2IF0_CTL.l2t_mcu_rd_req_id;
//   wire  [39:6]   	  dram_Ch3_l2b0_sctag_dram_addr      	= {`MCU3_ADDRDP_DP.l2t0_mcu_addr_39to9, `MCU3_ADDRDP_DP.l2t0_mcu_addr_6to4};
   wire  [39:5]   	  dram_Ch3_l2b0_sctag_dram_addr      	= `MCU3_L2IF0_CTL.l2t_mcu_addr;
   wire          	  dram_Ch3_l2b0_sctag_dram_rd_dummy_req 	= `MCU3_L2IF0_CTL.l2t_mcu_rd_dummy_req;
   wire          	  dram_Ch3_l2b0_dram_sctag_rd_ack       	= `MCU3_L2IF0_CTL.mcu_l2t_rd_ack;
   wire          	  dram_Ch3_l2b0_sctag_dram_wr_req 	= `MCU3_L2IF0_CTL.l2t_mcu_wr_req;
   wire          	  dram_Ch3_l2b0_sctag_dram_data_vld 	= `MCU3_L2IF0_CTL.l2b_mcu_data_vld;
   wire  [63:0]  	  dram_Ch3_l2b0_sctag_dram_wr_data 	= `MCU3_L2RDMX_DP.l2b0_mcu_wr_data_r5;
   wire          	  dram_Ch3_l2b0_dram_sctag_wr_ack       	= `MCU3_L2IF0_CTL.mcu_l2t_wr_ack;
   wire          	  dram_Ch3_l2b0_dram_sctag_data_vld     	= `MCU3_RDATA_CTL.mcu_l2t0_data_vld_r0;
   wire  [2:0]   	  dram_Ch3_l2b0_dram_sctag_rd_req_id    	= `MCU3_RDATA_CTL.mcu_l2t0_rd_req_id_r0;

// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch3_l2if_b0_rd_val          	= `DRAM_L2IF3.l2if_b0_rd_val;
// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch3_l2if_b1_rd_val          	= `DRAM_L2IF3.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch3_l2b0_l2if_b0_wr_val          	= {`MCU3_L2IF0_CTL.l2if_wr_entry3,
									   `MCU3_L2IF0_CTL.l2if_wr_entry2,
									   `MCU3_L2IF0_CTL.l2if_wr_entry1,
									   `MCU3_L2IF0_CTL.l2if_wr_entry0};

   wire  [3:0]   	  dram_Ch3_l2b0_l2if_b1_wr_val          	= {`MCU3_L2IF0_CTL.l2if_wr_entry7, 
									   `MCU3_L2IF0_CTL.l2if_wr_entry6,
									   `MCU3_L2IF0_CTL.l2if_wr_entry5,
									   `MCU3_L2IF0_CTL.l2if_wr_entry4};

// MAQ   wire  [5:0]   	  dram_Ch3_l2b0_l2if_wr_b0_data_addr      = `MCU3_L2IF0_CTL.l2if_wdq_wadr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch3_l2b0_dram_sctag_secc_err       = `MCU3_RDATA_CTL.mcu_l2t0_secc_err_r3;
   wire          	  dram_Ch3_l2b0_dram_sctag_pa_err         = `MCU3_L2RDMX_DP.l2b0_rd_addr_err | `MCU3_L2RDMX_DP.l2b0_wr_addr_err;
   wire          	  dram_Ch3_l2b0_dram_sctag_mecc_err       = `MCU3_RDATA_CTL.mcu_l2t0_mecc_err_r3;
   wire          	  dram_Ch3_l2b0_dram_sctag_scb_secc_err   = `MCU3_RDATA_CTL.mcu_l2t0_scb_secc_err;
   wire          	  dram_Ch3_l2b0_dram_sctag_scb_mecc_err   = `MCU3_RDATA_CTL.mcu_l2t0_scb_mecc_err;

// qualified with vld since they can be on due to residual ( previous error )
/*   wire			dram_Ch3_l2b0_l2if_secc_err             = `MCU3_RDATA_CTL.mcu_l2t0_secc_err_r3 && 
								    (`MCU3_RDATA_CTL.mcu_l2t0_data_vld_r0 || 
								     `MCU3_RDPCTL_CTL.rdpctl_scrub_data_valid);

   wire          	  dram_Ch3_l2b0_l2if_mecc_err_partial     = `MCU3_RDATA_CTL.mcu_l2t0_mecc_err_r3 && 
									 (`MCU3_RDATA_CTL.mcu_l2t0_data_vld_r0 || 
									  `MCU3_RDPCTL_CTL.rdpctl_scrub_data_valid);
*/
   wire dram_Ch3_l2b0_l2if_secc_err = `MCU3_RDATA_CTL.mcu_l2t0_scb_secc_err_in ||
                                      `MCU3_RDATA_CTL.mcu_l2t0_secc_err_r1;
   wire dram_Ch3_l2b0_l2if_mecc_err_partial = `MCU3_RDATA_CTL.mcu_l2t0_scb_mecc_err_in ||
                                      `MCU3_RDATA_CTL.mcu_l2t0_mecc_err_r1;
   wire          	  dram_Ch3_l2b0_l2if_pa_err               = (`MCU3_L2RDMX_DP.l2b0_rd_addr_err || `MCU3_L2RDMX_DP.l2b0_wr_addr_err) && 
									`MCU3_RDATA_CTL.mcu_l2t0_data_vld_r0;

   wire  [1:0]   	  dram_Ch3_l2b0_cpu_wr_en                	= `MCU3_L2IF0_CTL.l2if_wdq_we;
   wire  [4:0]   	  dram_Ch3_l2b0_cpu_wr_addr               = `MCU3_L2IF0_CTL.l2if_wdq_wadr;
   wire  		  dram_Ch3_l2b0_wdq_rd_en			= `MCU3_DRIF_CTL.drif0_wdq_rd;
   wire  [4:0]   	  dram_Ch3_l2b0_wdq_radr			= `MCU3_DRIF_CTL.drif0_wdq_radr;

   wire          	  dram_Ch3_l2b0_clspine_dram_txrd_sync 	= `MCU3_RDATA_CTL.rdata_cmp_ddr_sync_en;
   wire          	  dram_Ch3_l2b0_clspine_dram_txwr_sync 	= `MCU3_RDATA_CTL.rdata_cmp_ddr_sync_en;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch3_l2b0_l2if_wr_entry             = {
                                                                  `MCU3_L2IF0_CTL.l2if_wr_entry7,
                                                                  `MCU3_L2IF0_CTL.l2if_wr_entry6,
                                                                  `MCU3_L2IF0_CTL.l2if_wr_entry5,
                                                                  `MCU3_L2IF0_CTL.l2if_wr_entry4,
                                                                  `MCU3_L2IF0_CTL.l2if_wr_entry3,
                                                                  `MCU3_L2IF0_CTL.l2if_wr_entry2,
                                                                  `MCU3_L2IF0_CTL.l2if_wr_entry1,
                                                                  `MCU3_L2IF0_CTL.l2if_wr_entry0
                                                                  };



/*  wire   [8:0]            dram_Ch3_l2b0_rd_adr_info_hi		 = {
                                                                  `MCU3_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU3_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU3_DRIF_CTL.drif_stack_adr,
                                                                  `MCU3_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU3_L2B0_ADRGEN_DP.bank_adr[2] && `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU3_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0	// `DRAM_L2IF3.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch3_l2b0_wr_adr_info_hi		 = {
                                                                  `MCU3_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU3_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU3_DRIF_CTL.drif_stack_adr,
                                                                  `MCU3_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU3_L2B0_ADRGEN_DP.bank_adr[2] && `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU3_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF3.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch3_l2b0_rd_adr_info_lo		 = {
                                                                  `MCU3_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU3_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU3_DRIF_CTL.drif_stack_adr,
                                                                  `MCU3_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU3_L2B0_ADRGEN_DP.bank_adr[2] && `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU3_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF3.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch3_l2b0_wr_adr_info_lo		 = {
                                                                  `MCU3_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU3_L2B0_ADRGEN_DP.addr_err,
                                                                  `MCU3_DRIF_CTL.drif_stack_adr,
                                                                  `MCU3_L2B0_ADRGEN_DP.rank_adr,
                                                                  `MCU3_L2B0_ADRGEN_DP.bank_adr[2] && `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU3_L2B0_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF3.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };*/
                                                                 

   wire          	  dram_Ch3_l2b1_sctag_dram_rd_req 	= `MCU3_L2IF1_CTL.l2t_mcu_rd_req;
   wire  [2:0]   	  dram_Ch3_l2b1_sctag_dram_rd_req_id 	= `MCU3_L2IF1_CTL.l2t_mcu_rd_req_id;
//   wire  [39:6]   	  dram_Ch3_l2b1_sctag_dram_addr      	= {`MCU3_ADDRDP_DP.l2t1_mcu_addr_39to9, `MCU3_ADDRDP_DP.l2t1_mcu_addr_6to4};
   wire  [39:5]   	  dram_Ch3_l2b1_sctag_dram_addr      	= `MCU3_L2IF1_CTL.l2t_mcu_addr;
   wire          	  dram_Ch3_l2b1_sctag_dram_rd_dummy_req 	= `MCU3_L2IF1_CTL.l2t_mcu_rd_dummy_req;
   wire          	  dram_Ch3_l2b1_dram_sctag_rd_ack       	= `MCU3_L2IF1_CTL.mcu_l2t_rd_ack;
   wire          	  dram_Ch3_l2b1_sctag_dram_wr_req 	= `MCU3_L2IF1_CTL.l2t_mcu_wr_req;
   wire          	  dram_Ch3_l2b1_sctag_dram_data_vld 	= `MCU3_L2IF1_CTL.l2b_mcu_data_vld;
   wire  [63:0]  	  dram_Ch3_l2b1_sctag_dram_wr_data 	= `MCU3_L2RDMX_DP.l2b1_mcu_wr_data_r5;
   wire          	  dram_Ch3_l2b1_dram_sctag_wr_ack       	= `MCU3_L2IF1_CTL.mcu_l2t_wr_ack;
   wire          	  dram_Ch3_l2b1_dram_sctag_data_vld     	= `MCU3_RDATA_CTL.mcu_l2t1_data_vld_r0;
   wire  [2:0]   	  dram_Ch3_l2b1_dram_sctag_rd_req_id    	= `MCU3_RDATA_CTL.mcu_l2t1_rd_req_id_r0;

// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch3_l2if_b0_rd_val          	= `DRAM_L2IF3.l2if_b0_rd_val;
// MAQ N2 doesn't support	   wire  [3:0]   	  dram_Ch3_l2if_b1_rd_val          	= `DRAM_L2IF3.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch3_l2b1_l2if_b0_wr_val          	= {`MCU3_L2IF1_CTL.l2if_wr_entry3,
									   `MCU3_L2IF1_CTL.l2if_wr_entry2,
									   `MCU3_L2IF1_CTL.l2if_wr_entry1,
									   `MCU3_L2IF1_CTL.l2if_wr_entry0};

   wire  [3:0]   	  dram_Ch3_l2b1_l2if_b1_wr_val          	= {`MCU3_L2IF1_CTL.l2if_wr_entry7, 
									   `MCU3_L2IF1_CTL.l2if_wr_entry6,
									   `MCU3_L2IF1_CTL.l2if_wr_entry5,
									   `MCU3_L2IF1_CTL.l2if_wr_entry4};

// MAQ   wire  [5:0]   	  dram_Ch3_l2b1_l2if_wr_b0_data_addr      = `MCU3_L2IF1_CTL.l2if_wdq_wadr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch3_l2b1_dram_sctag_secc_err       = `MCU3_RDATA_CTL.mcu_l2t1_secc_err_r3;
   wire          	  dram_Ch3_l2b1_dram_sctag_pa_err         = `MCU3_L2RDMX_DP.l2b1_rd_addr_err | `MCU3_L2RDMX_DP.l2b1_wr_addr_err;
   wire          	  dram_Ch3_l2b1_dram_sctag_mecc_err       = `MCU3_RDATA_CTL.mcu_l2t1_mecc_err_r3;
   wire          	  dram_Ch3_l2b1_dram_sctag_scb_secc_err   = `MCU3_RDATA_CTL.mcu_l2t1_scb_secc_err;
   wire          	  dram_Ch3_l2b1_dram_sctag_scb_mecc_err   = `MCU3_RDATA_CTL.mcu_l2t1_scb_mecc_err;

// qualified with vld since they can be on due to residual ( previous error )
/*   wire			dram_Ch3_l2b1_l2if_secc_err             = `MCU3_RDATA_CTL.mcu_l2t1_secc_err_r3 && 
								    (`MCU3_RDATA_CTL.mcu_l2t1_data_vld_r0 || 
								     `MCU3_RDPCTL_CTL.rdpctl_scrub_data_valid);

   wire          	  dram_Ch3_l2b1_l2if_mecc_err_partial     = `MCU3_RDATA_CTL.mcu_l2t1_mecc_err_r3 && 
									 (`MCU3_RDATA_CTL.mcu_l2t1_data_vld_r0 || 
									  `MCU3_RDPCTL_CTL.rdpctl_scrub_data_valid);
*/
   wire dram_Ch3_l2b1_l2if_secc_err = `MCU3_RDATA_CTL.mcu_l2t1_scb_secc_err_in ||
                                      `MCU3_RDATA_CTL.mcu_l2t1_secc_err_r1;
   wire dram_Ch3_l2b1_l2if_mecc_err_partial = `MCU3_RDATA_CTL.mcu_l2t1_scb_mecc_err_in ||
                                      `MCU3_RDATA_CTL.mcu_l2t1_mecc_err_r1;
   wire          	  dram_Ch3_l2b1_l2if_pa_err               = (`MCU3_L2RDMX_DP.l2b1_rd_addr_err || `MCU3_L2RDMX_DP.l2b1_wr_addr_err) && 
									`MCU3_RDATA_CTL.mcu_l2t1_data_vld_r0;

   wire  [1:0]   	  dram_Ch3_l2b1_cpu_wr_en                	= `MCU3_L2IF1_CTL.l2if_wdq_we;
   wire  [4:0]   	  dram_Ch3_l2b1_cpu_wr_addr               = `MCU3_L2IF1_CTL.l2if_wdq_wadr;
   wire  		  dram_Ch3_l2b1_wdq_rd_en			= `MCU3_DRIF_CTL.drif1_wdq_rd;
   wire  [4:0]   	  dram_Ch3_l2b1_wdq_radr			= `MCU3_DRIF_CTL.drif1_wdq_radr;

   wire          	  dram_Ch3_l2b1_clspine_dram_txrd_sync 	= `MCU3_RDATA_CTL.rdata_cmp_ddr_sync_en;
   wire          	  dram_Ch3_l2b1_clspine_dram_txwr_sync 	= `MCU3_RDATA_CTL.rdata_cmp_ddr_sync_en;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch3_l2b1_l2if_wr_entry             = {
                                                                  `MCU3_L2IF1_CTL.l2if_wr_entry7,
                                                                  `MCU3_L2IF1_CTL.l2if_wr_entry6,
                                                                  `MCU3_L2IF1_CTL.l2if_wr_entry5,
                                                                  `MCU3_L2IF1_CTL.l2if_wr_entry4,
                                                                  `MCU3_L2IF1_CTL.l2if_wr_entry3,
                                                                  `MCU3_L2IF1_CTL.l2if_wr_entry2,
                                                                  `MCU3_L2IF1_CTL.l2if_wr_entry1,
                                                                  `MCU3_L2IF1_CTL.l2if_wr_entry0
                                                                  };



/*  wire   [8:0]            dram_Ch3_l2b1_rd_adr_info_hi		 = {
                                                                  `MCU3_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU3_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU3_DRIF_CTL.drif_stack_adr,
                                                                  `MCU3_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU3_L2B1_ADRGEN_DP.bank_adr[2] && `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU3_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0	// `DRAM_L2IF3.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch3_l2b1_wr_adr_info_hi		 = {
                                                                  `MCU3_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU3_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU3_DRIF_CTL.drif_stack_adr,
                                                                  `MCU3_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU3_L2B1_ADRGEN_DP.bank_adr[2] && `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU3_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF3.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch3_l2b1_rd_adr_info_lo		 = {
                                                                  `MCU3_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU3_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU3_DRIF_CTL.drif_stack_adr,
                                                                  `MCU3_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU3_L2B1_ADRGEN_DP.bank_adr[2] && `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU3_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF3.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };

  wire   [8:0]            dram_Ch3_l2b1_wr_adr_info_lo		 = {
                                                                  `MCU3_DRIF_CTL.drif_addr_bank_low_sel,
                                                                  `MCU3_L2B1_ADRGEN_DP.addr_err,
                                                                  `MCU3_DRIF_CTL.drif_stack_adr,
                                                                  `MCU3_L2B1_ADRGEN_DP.rank_adr,
                                                                  `MCU3_L2B1_ADRGEN_DP.bank_adr[2] && `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  `MCU3_L2B1_ADRGEN_DP.bank_adr[1:0],
                                                                  `MCU3_DRIF_CTL.drif_eight_bank_mode,
                                                                  1'b0  // `DRAM_L2IF3.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };*/
                                                                 

 
// ---- Performance counters ----

   wire  [7:0]            dram_Ch3_perf_cntl          = `MCU3_DRIF_CTL.drif_perf_cntl_reg;
   wire                   dram_Ch3_cnt0_sticky_bit    = `MCU3_DRIF_CTL.drif_perf_cnt0_reg[31];
   wire                   dram_Ch3_cnt1_sticky_bit    = `MCU3_DRIF_CTL.drif_perf_cnt1_reg[31];


//  -------- FIFO CONDITIONs ----------


//  ----- RD Q -------

always @(dram_Ch0_l2b0_rd_q_0 or dram_Ch0_l2b0_rd_q_1 or dram_Ch0_l2b0_rd_q_2 or dram_Ch0_l2b0_rd_q_3 or 
         dram_Ch0_l2b0_rd_q_4 or dram_Ch0_l2b0_rd_q_5 or dram_Ch0_l2b0_rd_q_6 or dram_Ch0_l2b0_rd_q_7 or 
	 dram_rst_l)
begin
  if(~dram_rst_l)
  begin
    dram_Ch0_l2b0_rd_q[0] = 0;
    dram_Ch0_l2b0_rd_q[1] = 0;
    dram_Ch0_l2b0_rd_q[2] = 0;
    dram_Ch0_l2b0_rd_q[3] = 0;
    dram_Ch0_l2b0_rd_q[4] = 0;
    dram_Ch0_l2b0_rd_q[5] = 0;
    dram_Ch0_l2b0_rd_q[6] = 0;
    dram_Ch0_l2b0_rd_q[7] = 0;
  end
  else
  begin 
    dram_Ch0_l2b0_rd_q[0] = dram_Ch0_l2b0_rd_q_0;
    dram_Ch0_l2b0_rd_q[1] = dram_Ch0_l2b0_rd_q_1;
    dram_Ch0_l2b0_rd_q[2] = dram_Ch0_l2b0_rd_q_2;
    dram_Ch0_l2b0_rd_q[3] = dram_Ch0_l2b0_rd_q_3;
    dram_Ch0_l2b0_rd_q[4] = dram_Ch0_l2b0_rd_q_4;
    dram_Ch0_l2b0_rd_q[5] = dram_Ch0_l2b0_rd_q_5;
    dram_Ch0_l2b0_rd_q[6] = dram_Ch0_l2b0_rd_q_6;
    dram_Ch0_l2b0_rd_q[7] = dram_Ch0_l2b0_rd_q_7;
  end
end
always @(dram_Ch0_l2b1_rd_q_0 or dram_Ch0_l2b1_rd_q_1 or dram_Ch0_l2b1_rd_q_2 or dram_Ch0_l2b1_rd_q_3 or 
         dram_Ch0_l2b1_rd_q_4 or dram_Ch0_l2b1_rd_q_5 or dram_Ch0_l2b1_rd_q_6 or dram_Ch0_l2b1_rd_q_7 or 
	 dram_rst_l)
begin
  if(~dram_rst_l)
  begin
    dram_Ch0_l2b1_rd_q[0] = 0;
    dram_Ch0_l2b1_rd_q[1] = 0;
    dram_Ch0_l2b1_rd_q[2] = 0;
    dram_Ch0_l2b1_rd_q[3] = 0;
    dram_Ch0_l2b1_rd_q[4] = 0;
    dram_Ch0_l2b1_rd_q[5] = 0;
    dram_Ch0_l2b1_rd_q[6] = 0;
    dram_Ch0_l2b1_rd_q[7] = 0;
  end
  else
  begin 
    dram_Ch0_l2b1_rd_q[0] = dram_Ch0_l2b1_rd_q_0;
    dram_Ch0_l2b1_rd_q[1] = dram_Ch0_l2b1_rd_q_1;
    dram_Ch0_l2b1_rd_q[2] = dram_Ch0_l2b1_rd_q_2;
    dram_Ch0_l2b1_rd_q[3] = dram_Ch0_l2b1_rd_q_3;
    dram_Ch0_l2b1_rd_q[4] = dram_Ch0_l2b1_rd_q_4;
    dram_Ch0_l2b1_rd_q[5] = dram_Ch0_l2b1_rd_q_5;
    dram_Ch0_l2b1_rd_q[6] = dram_Ch0_l2b1_rd_q_6;
    dram_Ch0_l2b1_rd_q[7] = dram_Ch0_l2b1_rd_q_7;
  end
end
always @(dram_Ch1_l2b0_rd_q_0 or dram_Ch1_l2b0_rd_q_1 or dram_Ch1_l2b0_rd_q_2 or dram_Ch1_l2b0_rd_q_3 or 
         dram_Ch1_l2b0_rd_q_4 or dram_Ch1_l2b0_rd_q_5 or dram_Ch1_l2b0_rd_q_6 or dram_Ch1_l2b0_rd_q_7 or 
	 dram_rst_l)
begin
  if(~dram_rst_l)
  begin
    dram_Ch1_l2b0_rd_q[0] = 0;
    dram_Ch1_l2b0_rd_q[1] = 0;
    dram_Ch1_l2b0_rd_q[2] = 0;
    dram_Ch1_l2b0_rd_q[3] = 0;
    dram_Ch1_l2b0_rd_q[4] = 0;
    dram_Ch1_l2b0_rd_q[5] = 0;
    dram_Ch1_l2b0_rd_q[6] = 0;
    dram_Ch1_l2b0_rd_q[7] = 0;
  end
  else
  begin 
    dram_Ch1_l2b0_rd_q[0] = dram_Ch1_l2b0_rd_q_0;
    dram_Ch1_l2b0_rd_q[1] = dram_Ch1_l2b0_rd_q_1;
    dram_Ch1_l2b0_rd_q[2] = dram_Ch1_l2b0_rd_q_2;
    dram_Ch1_l2b0_rd_q[3] = dram_Ch1_l2b0_rd_q_3;
    dram_Ch1_l2b0_rd_q[4] = dram_Ch1_l2b0_rd_q_4;
    dram_Ch1_l2b0_rd_q[5] = dram_Ch1_l2b0_rd_q_5;
    dram_Ch1_l2b0_rd_q[6] = dram_Ch1_l2b0_rd_q_6;
    dram_Ch1_l2b0_rd_q[7] = dram_Ch1_l2b0_rd_q_7;
  end
end
always @(dram_Ch1_l2b1_rd_q_0 or dram_Ch1_l2b1_rd_q_1 or dram_Ch1_l2b1_rd_q_2 or dram_Ch1_l2b1_rd_q_3 or 
         dram_Ch1_l2b1_rd_q_4 or dram_Ch1_l2b1_rd_q_5 or dram_Ch1_l2b1_rd_q_6 or dram_Ch1_l2b1_rd_q_7 or 
	 dram_rst_l)
begin
  if(~dram_rst_l)
  begin
    dram_Ch1_l2b1_rd_q[0] = 0;
    dram_Ch1_l2b1_rd_q[1] = 0;
    dram_Ch1_l2b1_rd_q[2] = 0;
    dram_Ch1_l2b1_rd_q[3] = 0;
    dram_Ch1_l2b1_rd_q[4] = 0;
    dram_Ch1_l2b1_rd_q[5] = 0;
    dram_Ch1_l2b1_rd_q[6] = 0;
    dram_Ch1_l2b1_rd_q[7] = 0;
  end
  else
  begin 
    dram_Ch1_l2b1_rd_q[0] = dram_Ch1_l2b1_rd_q_0;
    dram_Ch1_l2b1_rd_q[1] = dram_Ch1_l2b1_rd_q_1;
    dram_Ch1_l2b1_rd_q[2] = dram_Ch1_l2b1_rd_q_2;
    dram_Ch1_l2b1_rd_q[3] = dram_Ch1_l2b1_rd_q_3;
    dram_Ch1_l2b1_rd_q[4] = dram_Ch1_l2b1_rd_q_4;
    dram_Ch1_l2b1_rd_q[5] = dram_Ch1_l2b1_rd_q_5;
    dram_Ch1_l2b1_rd_q[6] = dram_Ch1_l2b1_rd_q_6;
    dram_Ch1_l2b1_rd_q[7] = dram_Ch1_l2b1_rd_q_7;
  end
end
always @(dram_Ch2_l2b0_rd_q_0 or dram_Ch2_l2b0_rd_q_1 or dram_Ch2_l2b0_rd_q_2 or dram_Ch2_l2b0_rd_q_3 or 
         dram_Ch2_l2b0_rd_q_4 or dram_Ch2_l2b0_rd_q_5 or dram_Ch2_l2b0_rd_q_6 or dram_Ch2_l2b0_rd_q_7 or 
	 dram_rst_l)
begin
  if(~dram_rst_l)
  begin
    dram_Ch2_l2b0_rd_q[0] = 0;
    dram_Ch2_l2b0_rd_q[1] = 0;
    dram_Ch2_l2b0_rd_q[2] = 0;
    dram_Ch2_l2b0_rd_q[3] = 0;
    dram_Ch2_l2b0_rd_q[4] = 0;
    dram_Ch2_l2b0_rd_q[5] = 0;
    dram_Ch2_l2b0_rd_q[6] = 0;
    dram_Ch2_l2b0_rd_q[7] = 0;
  end
  else
  begin 
    dram_Ch2_l2b0_rd_q[0] = dram_Ch2_l2b0_rd_q_0;
    dram_Ch2_l2b0_rd_q[1] = dram_Ch2_l2b0_rd_q_1;
    dram_Ch2_l2b0_rd_q[2] = dram_Ch2_l2b0_rd_q_2;
    dram_Ch2_l2b0_rd_q[3] = dram_Ch2_l2b0_rd_q_3;
    dram_Ch2_l2b0_rd_q[4] = dram_Ch2_l2b0_rd_q_4;
    dram_Ch2_l2b0_rd_q[5] = dram_Ch2_l2b0_rd_q_5;
    dram_Ch2_l2b0_rd_q[6] = dram_Ch2_l2b0_rd_q_6;
    dram_Ch2_l2b0_rd_q[7] = dram_Ch2_l2b0_rd_q_7;
  end
end
always @(dram_Ch2_l2b1_rd_q_0 or dram_Ch2_l2b1_rd_q_1 or dram_Ch2_l2b1_rd_q_2 or dram_Ch2_l2b1_rd_q_3 or 
         dram_Ch2_l2b1_rd_q_4 or dram_Ch2_l2b1_rd_q_5 or dram_Ch2_l2b1_rd_q_6 or dram_Ch2_l2b1_rd_q_7 or 
	 dram_rst_l)
begin
  if(~dram_rst_l)
  begin
    dram_Ch2_l2b1_rd_q[0] = 0;
    dram_Ch2_l2b1_rd_q[1] = 0;
    dram_Ch2_l2b1_rd_q[2] = 0;
    dram_Ch2_l2b1_rd_q[3] = 0;
    dram_Ch2_l2b1_rd_q[4] = 0;
    dram_Ch2_l2b1_rd_q[5] = 0;
    dram_Ch2_l2b1_rd_q[6] = 0;
    dram_Ch2_l2b1_rd_q[7] = 0;
  end
  else
  begin 
    dram_Ch2_l2b1_rd_q[0] = dram_Ch2_l2b1_rd_q_0;
    dram_Ch2_l2b1_rd_q[1] = dram_Ch2_l2b1_rd_q_1;
    dram_Ch2_l2b1_rd_q[2] = dram_Ch2_l2b1_rd_q_2;
    dram_Ch2_l2b1_rd_q[3] = dram_Ch2_l2b1_rd_q_3;
    dram_Ch2_l2b1_rd_q[4] = dram_Ch2_l2b1_rd_q_4;
    dram_Ch2_l2b1_rd_q[5] = dram_Ch2_l2b1_rd_q_5;
    dram_Ch2_l2b1_rd_q[6] = dram_Ch2_l2b1_rd_q_6;
    dram_Ch2_l2b1_rd_q[7] = dram_Ch2_l2b1_rd_q_7;
  end
end
always @(dram_Ch3_l2b0_rd_q_0 or dram_Ch3_l2b0_rd_q_1 or dram_Ch3_l2b0_rd_q_2 or dram_Ch3_l2b0_rd_q_3 or 
         dram_Ch3_l2b0_rd_q_4 or dram_Ch3_l2b0_rd_q_5 or dram_Ch3_l2b0_rd_q_6 or dram_Ch3_l2b0_rd_q_7 or 
	 dram_rst_l)
begin
  if(~dram_rst_l)
  begin
    dram_Ch3_l2b0_rd_q[0] = 0;
    dram_Ch3_l2b0_rd_q[1] = 0;
    dram_Ch3_l2b0_rd_q[2] = 0;
    dram_Ch3_l2b0_rd_q[3] = 0;
    dram_Ch3_l2b0_rd_q[4] = 0;
    dram_Ch3_l2b0_rd_q[5] = 0;
    dram_Ch3_l2b0_rd_q[6] = 0;
    dram_Ch3_l2b0_rd_q[7] = 0;
  end
  else
  begin 
    dram_Ch3_l2b0_rd_q[0] = dram_Ch3_l2b0_rd_q_0;
    dram_Ch3_l2b0_rd_q[1] = dram_Ch3_l2b0_rd_q_1;
    dram_Ch3_l2b0_rd_q[2] = dram_Ch3_l2b0_rd_q_2;
    dram_Ch3_l2b0_rd_q[3] = dram_Ch3_l2b0_rd_q_3;
    dram_Ch3_l2b0_rd_q[4] = dram_Ch3_l2b0_rd_q_4;
    dram_Ch3_l2b0_rd_q[5] = dram_Ch3_l2b0_rd_q_5;
    dram_Ch3_l2b0_rd_q[6] = dram_Ch3_l2b0_rd_q_6;
    dram_Ch3_l2b0_rd_q[7] = dram_Ch3_l2b0_rd_q_7;
  end
end
always @(dram_Ch3_l2b1_rd_q_0 or dram_Ch3_l2b1_rd_q_1 or dram_Ch3_l2b1_rd_q_2 or dram_Ch3_l2b1_rd_q_3 or 
         dram_Ch3_l2b1_rd_q_4 or dram_Ch3_l2b1_rd_q_5 or dram_Ch3_l2b1_rd_q_6 or dram_Ch3_l2b1_rd_q_7 or 
	 dram_rst_l)
begin
  if(~dram_rst_l)
  begin
    dram_Ch3_l2b1_rd_q[0] = 0;
    dram_Ch3_l2b1_rd_q[1] = 0;
    dram_Ch3_l2b1_rd_q[2] = 0;
    dram_Ch3_l2b1_rd_q[3] = 0;
    dram_Ch3_l2b1_rd_q[4] = 0;
    dram_Ch3_l2b1_rd_q[5] = 0;
    dram_Ch3_l2b1_rd_q[6] = 0;
    dram_Ch3_l2b1_rd_q[7] = 0;
  end
  else
  begin 
    dram_Ch3_l2b1_rd_q[0] = dram_Ch3_l2b1_rd_q_0;
    dram_Ch3_l2b1_rd_q[1] = dram_Ch3_l2b1_rd_q_1;
    dram_Ch3_l2b1_rd_q[2] = dram_Ch3_l2b1_rd_q_2;
    dram_Ch3_l2b1_rd_q[3] = dram_Ch3_l2b1_rd_q_3;
    dram_Ch3_l2b1_rd_q[4] = dram_Ch3_l2b1_rd_q_4;
    dram_Ch3_l2b1_rd_q[5] = dram_Ch3_l2b1_rd_q_5;
    dram_Ch3_l2b1_rd_q[6] = dram_Ch3_l2b1_rd_q_6;
    dram_Ch3_l2b1_rd_q[7] = dram_Ch3_l2b1_rd_q_7;
  end
end

// ----  RD COLPS FIFO -----

always @( dram_Ch0_l2b0_rd_colps_q_0 or  dram_Ch0_l2b0_rd_colps_q_1 or dram_Ch0_l2b0_rd_colps_q_2 or
          dram_Ch0_l2b0_rd_colps_q_3 or  dram_Ch0_l2b0_rd_colps_q_4 or dram_Ch0_l2b0_rd_colps_q_5 or 
          dram_Ch0_l2b0_rd_colps_q_6 or  dram_Ch0_l2b0_rd_colps_q_7 or dram_rst_l)
begin 
  if(~dram_rst_l)
  begin
    dram_Ch0_l2b0_rd_colps_q[0] = 0;
    dram_Ch0_l2b0_rd_colps_q[1] = 0;
    dram_Ch0_l2b0_rd_colps_q[2] = 0;
    dram_Ch0_l2b0_rd_colps_q[3] = 0;
    dram_Ch0_l2b0_rd_colps_q[4] = 0;
    dram_Ch0_l2b0_rd_colps_q[5] = 0;
    dram_Ch0_l2b0_rd_colps_q[6] = 0;
    dram_Ch0_l2b0_rd_colps_q[7] = 0;
  end
  else
  begin
    dram_Ch0_l2b0_rd_colps_q[0] = dram_Ch0_l2b0_rd_colps_q_0;
    dram_Ch0_l2b0_rd_colps_q[1] = dram_Ch0_l2b0_rd_colps_q_1;
    dram_Ch0_l2b0_rd_colps_q[2] = dram_Ch0_l2b0_rd_colps_q_2;
    dram_Ch0_l2b0_rd_colps_q[3] = dram_Ch0_l2b0_rd_colps_q_3;
    dram_Ch0_l2b0_rd_colps_q[4] = dram_Ch0_l2b0_rd_colps_q_4;
    dram_Ch0_l2b0_rd_colps_q[5] = dram_Ch0_l2b0_rd_colps_q_5;
    dram_Ch0_l2b0_rd_colps_q[6] = dram_Ch0_l2b0_rd_colps_q_6;
    dram_Ch0_l2b0_rd_colps_q[7] = dram_Ch0_l2b0_rd_colps_q_7;
  end
end
always @( dram_Ch0_l2b1_rd_colps_q_0 or  dram_Ch0_l2b1_rd_colps_q_1 or dram_Ch0_l2b1_rd_colps_q_2 or
          dram_Ch0_l2b1_rd_colps_q_3 or  dram_Ch0_l2b1_rd_colps_q_4 or dram_Ch0_l2b1_rd_colps_q_5 or 
          dram_Ch0_l2b1_rd_colps_q_6 or  dram_Ch0_l2b1_rd_colps_q_7 or dram_rst_l)
begin 
  if(~dram_rst_l)
  begin
    dram_Ch0_l2b1_rd_colps_q[0] = 0;
    dram_Ch0_l2b1_rd_colps_q[1] = 0;
    dram_Ch0_l2b1_rd_colps_q[2] = 0;
    dram_Ch0_l2b1_rd_colps_q[3] = 0;
    dram_Ch0_l2b1_rd_colps_q[4] = 0;
    dram_Ch0_l2b1_rd_colps_q[5] = 0;
    dram_Ch0_l2b1_rd_colps_q[6] = 0;
    dram_Ch0_l2b1_rd_colps_q[7] = 0;
  end
  else
  begin
    dram_Ch0_l2b1_rd_colps_q[0] = dram_Ch0_l2b1_rd_colps_q_0;
    dram_Ch0_l2b1_rd_colps_q[1] = dram_Ch0_l2b1_rd_colps_q_1;
    dram_Ch0_l2b1_rd_colps_q[2] = dram_Ch0_l2b1_rd_colps_q_2;
    dram_Ch0_l2b1_rd_colps_q[3] = dram_Ch0_l2b1_rd_colps_q_3;
    dram_Ch0_l2b1_rd_colps_q[4] = dram_Ch0_l2b1_rd_colps_q_4;
    dram_Ch0_l2b1_rd_colps_q[5] = dram_Ch0_l2b1_rd_colps_q_5;
    dram_Ch0_l2b1_rd_colps_q[6] = dram_Ch0_l2b1_rd_colps_q_6;
    dram_Ch0_l2b1_rd_colps_q[7] = dram_Ch0_l2b1_rd_colps_q_7;
  end
end
always @( dram_Ch1_l2b0_rd_colps_q_0 or  dram_Ch1_l2b0_rd_colps_q_1 or dram_Ch1_l2b0_rd_colps_q_2 or
          dram_Ch1_l2b0_rd_colps_q_3 or  dram_Ch1_l2b0_rd_colps_q_4 or dram_Ch1_l2b0_rd_colps_q_5 or 
          dram_Ch1_l2b0_rd_colps_q_6 or  dram_Ch1_l2b0_rd_colps_q_7 or dram_rst_l)
begin 
  if(~dram_rst_l)
  begin
    dram_Ch1_l2b0_rd_colps_q[0] = 0;
    dram_Ch1_l2b0_rd_colps_q[1] = 0;
    dram_Ch1_l2b0_rd_colps_q[2] = 0;
    dram_Ch1_l2b0_rd_colps_q[3] = 0;
    dram_Ch1_l2b0_rd_colps_q[4] = 0;
    dram_Ch1_l2b0_rd_colps_q[5] = 0;
    dram_Ch1_l2b0_rd_colps_q[6] = 0;
    dram_Ch1_l2b0_rd_colps_q[7] = 0;
  end
  else
  begin
    dram_Ch1_l2b0_rd_colps_q[0] = dram_Ch1_l2b0_rd_colps_q_0;
    dram_Ch1_l2b0_rd_colps_q[1] = dram_Ch1_l2b0_rd_colps_q_1;
    dram_Ch1_l2b0_rd_colps_q[2] = dram_Ch1_l2b0_rd_colps_q_2;
    dram_Ch1_l2b0_rd_colps_q[3] = dram_Ch1_l2b0_rd_colps_q_3;
    dram_Ch1_l2b0_rd_colps_q[4] = dram_Ch1_l2b0_rd_colps_q_4;
    dram_Ch1_l2b0_rd_colps_q[5] = dram_Ch1_l2b0_rd_colps_q_5;
    dram_Ch1_l2b0_rd_colps_q[6] = dram_Ch1_l2b0_rd_colps_q_6;
    dram_Ch1_l2b0_rd_colps_q[7] = dram_Ch1_l2b0_rd_colps_q_7;
  end
end
always @( dram_Ch1_l2b1_rd_colps_q_0 or  dram_Ch1_l2b1_rd_colps_q_1 or dram_Ch1_l2b1_rd_colps_q_2 or
          dram_Ch1_l2b1_rd_colps_q_3 or  dram_Ch1_l2b1_rd_colps_q_4 or dram_Ch1_l2b1_rd_colps_q_5 or 
          dram_Ch1_l2b1_rd_colps_q_6 or  dram_Ch1_l2b1_rd_colps_q_7 or dram_rst_l)
begin 
  if(~dram_rst_l)
  begin
    dram_Ch1_l2b1_rd_colps_q[0] = 0;
    dram_Ch1_l2b1_rd_colps_q[1] = 0;
    dram_Ch1_l2b1_rd_colps_q[2] = 0;
    dram_Ch1_l2b1_rd_colps_q[3] = 0;
    dram_Ch1_l2b1_rd_colps_q[4] = 0;
    dram_Ch1_l2b1_rd_colps_q[5] = 0;
    dram_Ch1_l2b1_rd_colps_q[6] = 0;
    dram_Ch1_l2b1_rd_colps_q[7] = 0;
  end
  else
  begin
    dram_Ch1_l2b1_rd_colps_q[0] = dram_Ch1_l2b1_rd_colps_q_0;
    dram_Ch1_l2b1_rd_colps_q[1] = dram_Ch1_l2b1_rd_colps_q_1;
    dram_Ch1_l2b1_rd_colps_q[2] = dram_Ch1_l2b1_rd_colps_q_2;
    dram_Ch1_l2b1_rd_colps_q[3] = dram_Ch1_l2b1_rd_colps_q_3;
    dram_Ch1_l2b1_rd_colps_q[4] = dram_Ch1_l2b1_rd_colps_q_4;
    dram_Ch1_l2b1_rd_colps_q[5] = dram_Ch1_l2b1_rd_colps_q_5;
    dram_Ch1_l2b1_rd_colps_q[6] = dram_Ch1_l2b1_rd_colps_q_6;
    dram_Ch1_l2b1_rd_colps_q[7] = dram_Ch1_l2b1_rd_colps_q_7;
  end
end
always @( dram_Ch2_l2b0_rd_colps_q_0 or  dram_Ch2_l2b0_rd_colps_q_1 or dram_Ch2_l2b0_rd_colps_q_2 or
          dram_Ch2_l2b0_rd_colps_q_3 or  dram_Ch2_l2b0_rd_colps_q_4 or dram_Ch2_l2b0_rd_colps_q_5 or 
          dram_Ch2_l2b0_rd_colps_q_6 or  dram_Ch2_l2b0_rd_colps_q_7 or dram_rst_l)
begin 
  if(~dram_rst_l)
  begin
    dram_Ch2_l2b0_rd_colps_q[0] = 0;
    dram_Ch2_l2b0_rd_colps_q[1] = 0;
    dram_Ch2_l2b0_rd_colps_q[2] = 0;
    dram_Ch2_l2b0_rd_colps_q[3] = 0;
    dram_Ch2_l2b0_rd_colps_q[4] = 0;
    dram_Ch2_l2b0_rd_colps_q[5] = 0;
    dram_Ch2_l2b0_rd_colps_q[6] = 0;
    dram_Ch2_l2b0_rd_colps_q[7] = 0;
  end
  else
  begin
    dram_Ch2_l2b0_rd_colps_q[0] = dram_Ch2_l2b0_rd_colps_q_0;
    dram_Ch2_l2b0_rd_colps_q[1] = dram_Ch2_l2b0_rd_colps_q_1;
    dram_Ch2_l2b0_rd_colps_q[2] = dram_Ch2_l2b0_rd_colps_q_2;
    dram_Ch2_l2b0_rd_colps_q[3] = dram_Ch2_l2b0_rd_colps_q_3;
    dram_Ch2_l2b0_rd_colps_q[4] = dram_Ch2_l2b0_rd_colps_q_4;
    dram_Ch2_l2b0_rd_colps_q[5] = dram_Ch2_l2b0_rd_colps_q_5;
    dram_Ch2_l2b0_rd_colps_q[6] = dram_Ch2_l2b0_rd_colps_q_6;
    dram_Ch2_l2b0_rd_colps_q[7] = dram_Ch2_l2b0_rd_colps_q_7;
  end
end
always @( dram_Ch2_l2b1_rd_colps_q_0 or  dram_Ch2_l2b1_rd_colps_q_1 or dram_Ch2_l2b1_rd_colps_q_2 or
          dram_Ch2_l2b1_rd_colps_q_3 or  dram_Ch2_l2b1_rd_colps_q_4 or dram_Ch2_l2b1_rd_colps_q_5 or 
          dram_Ch2_l2b1_rd_colps_q_6 or  dram_Ch2_l2b1_rd_colps_q_7 or dram_rst_l)
begin 
  if(~dram_rst_l)
  begin
    dram_Ch2_l2b1_rd_colps_q[0] = 0;
    dram_Ch2_l2b1_rd_colps_q[1] = 0;
    dram_Ch2_l2b1_rd_colps_q[2] = 0;
    dram_Ch2_l2b1_rd_colps_q[3] = 0;
    dram_Ch2_l2b1_rd_colps_q[4] = 0;
    dram_Ch2_l2b1_rd_colps_q[5] = 0;
    dram_Ch2_l2b1_rd_colps_q[6] = 0;
    dram_Ch2_l2b1_rd_colps_q[7] = 0;
  end
  else
  begin
    dram_Ch2_l2b1_rd_colps_q[0] = dram_Ch2_l2b1_rd_colps_q_0;
    dram_Ch2_l2b1_rd_colps_q[1] = dram_Ch2_l2b1_rd_colps_q_1;
    dram_Ch2_l2b1_rd_colps_q[2] = dram_Ch2_l2b1_rd_colps_q_2;
    dram_Ch2_l2b1_rd_colps_q[3] = dram_Ch2_l2b1_rd_colps_q_3;
    dram_Ch2_l2b1_rd_colps_q[4] = dram_Ch2_l2b1_rd_colps_q_4;
    dram_Ch2_l2b1_rd_colps_q[5] = dram_Ch2_l2b1_rd_colps_q_5;
    dram_Ch2_l2b1_rd_colps_q[6] = dram_Ch2_l2b1_rd_colps_q_6;
    dram_Ch2_l2b1_rd_colps_q[7] = dram_Ch2_l2b1_rd_colps_q_7;
  end
end
always @( dram_Ch3_l2b0_rd_colps_q_0 or  dram_Ch3_l2b0_rd_colps_q_1 or dram_Ch3_l2b0_rd_colps_q_2 or
          dram_Ch3_l2b0_rd_colps_q_3 or  dram_Ch3_l2b0_rd_colps_q_4 or dram_Ch3_l2b0_rd_colps_q_5 or 
          dram_Ch3_l2b0_rd_colps_q_6 or  dram_Ch3_l2b0_rd_colps_q_7 or dram_rst_l)
begin 
  if(~dram_rst_l)
  begin
    dram_Ch3_l2b0_rd_colps_q[0] = 0;
    dram_Ch3_l2b0_rd_colps_q[1] = 0;
    dram_Ch3_l2b0_rd_colps_q[2] = 0;
    dram_Ch3_l2b0_rd_colps_q[3] = 0;
    dram_Ch3_l2b0_rd_colps_q[4] = 0;
    dram_Ch3_l2b0_rd_colps_q[5] = 0;
    dram_Ch3_l2b0_rd_colps_q[6] = 0;
    dram_Ch3_l2b0_rd_colps_q[7] = 0;
  end
  else
  begin
    dram_Ch3_l2b0_rd_colps_q[0] = dram_Ch3_l2b0_rd_colps_q_0;
    dram_Ch3_l2b0_rd_colps_q[1] = dram_Ch3_l2b0_rd_colps_q_1;
    dram_Ch3_l2b0_rd_colps_q[2] = dram_Ch3_l2b0_rd_colps_q_2;
    dram_Ch3_l2b0_rd_colps_q[3] = dram_Ch3_l2b0_rd_colps_q_3;
    dram_Ch3_l2b0_rd_colps_q[4] = dram_Ch3_l2b0_rd_colps_q_4;
    dram_Ch3_l2b0_rd_colps_q[5] = dram_Ch3_l2b0_rd_colps_q_5;
    dram_Ch3_l2b0_rd_colps_q[6] = dram_Ch3_l2b0_rd_colps_q_6;
    dram_Ch3_l2b0_rd_colps_q[7] = dram_Ch3_l2b0_rd_colps_q_7;
  end
end
always @( dram_Ch3_l2b1_rd_colps_q_0 or  dram_Ch3_l2b1_rd_colps_q_1 or dram_Ch3_l2b1_rd_colps_q_2 or
          dram_Ch3_l2b1_rd_colps_q_3 or  dram_Ch3_l2b1_rd_colps_q_4 or dram_Ch3_l2b1_rd_colps_q_5 or 
          dram_Ch3_l2b1_rd_colps_q_6 or  dram_Ch3_l2b1_rd_colps_q_7 or dram_rst_l)
begin 
  if(~dram_rst_l)
  begin
    dram_Ch3_l2b1_rd_colps_q[0] = 0;
    dram_Ch3_l2b1_rd_colps_q[1] = 0;
    dram_Ch3_l2b1_rd_colps_q[2] = 0;
    dram_Ch3_l2b1_rd_colps_q[3] = 0;
    dram_Ch3_l2b1_rd_colps_q[4] = 0;
    dram_Ch3_l2b1_rd_colps_q[5] = 0;
    dram_Ch3_l2b1_rd_colps_q[6] = 0;
    dram_Ch3_l2b1_rd_colps_q[7] = 0;
  end
  else
  begin
    dram_Ch3_l2b1_rd_colps_q[0] = dram_Ch3_l2b1_rd_colps_q_0;
    dram_Ch3_l2b1_rd_colps_q[1] = dram_Ch3_l2b1_rd_colps_q_1;
    dram_Ch3_l2b1_rd_colps_q[2] = dram_Ch3_l2b1_rd_colps_q_2;
    dram_Ch3_l2b1_rd_colps_q[3] = dram_Ch3_l2b1_rd_colps_q_3;
    dram_Ch3_l2b1_rd_colps_q[4] = dram_Ch3_l2b1_rd_colps_q_4;
    dram_Ch3_l2b1_rd_colps_q[5] = dram_Ch3_l2b1_rd_colps_q_5;
    dram_Ch3_l2b1_rd_colps_q[6] = dram_Ch3_l2b1_rd_colps_q_6;
    dram_Ch3_l2b1_rd_colps_q[7] = dram_Ch3_l2b1_rd_colps_q_7;
  end
end


// ------ WR Q -------

always @(dram_Ch0_l2b0_wr_q_0 or dram_Ch0_l2b0_wr_q_1 or dram_Ch0_l2b0_wr_q_2 or dram_Ch0_l2b0_wr_q_3 or 
         dram_Ch0_l2b0_wr_q_4 or dram_Ch0_l2b0_wr_q_5 or dram_Ch0_l2b0_wr_q_6 or dram_Ch0_l2b0_wr_q_7 or 
	 dram_rst_l)
begin 
    dram_Ch0_l2b0_wr_q[0] = dram_Ch0_l2b0_wr_q_0;
    dram_Ch0_l2b0_wr_q[1] = dram_Ch0_l2b0_wr_q_1;
    dram_Ch0_l2b0_wr_q[2] = dram_Ch0_l2b0_wr_q_2;
    dram_Ch0_l2b0_wr_q[3] = dram_Ch0_l2b0_wr_q_3;
    dram_Ch0_l2b0_wr_q[4] = dram_Ch0_l2b0_wr_q_4;
    dram_Ch0_l2b0_wr_q[5] = dram_Ch0_l2b0_wr_q_5;
    dram_Ch0_l2b0_wr_q[6] = dram_Ch0_l2b0_wr_q_6;
    dram_Ch0_l2b0_wr_q[7] = dram_Ch0_l2b0_wr_q_7;
end
always @(dram_Ch0_l2b1_wr_q_0 or dram_Ch0_l2b1_wr_q_1 or dram_Ch0_l2b1_wr_q_2 or dram_Ch0_l2b1_wr_q_3 or 
         dram_Ch0_l2b1_wr_q_4 or dram_Ch0_l2b1_wr_q_5 or dram_Ch0_l2b1_wr_q_6 or dram_Ch0_l2b1_wr_q_7 or 
	 dram_rst_l)
begin 
    dram_Ch0_l2b1_wr_q[0] = dram_Ch0_l2b1_wr_q_0;
    dram_Ch0_l2b1_wr_q[1] = dram_Ch0_l2b1_wr_q_1;
    dram_Ch0_l2b1_wr_q[2] = dram_Ch0_l2b1_wr_q_2;
    dram_Ch0_l2b1_wr_q[3] = dram_Ch0_l2b1_wr_q_3;
    dram_Ch0_l2b1_wr_q[4] = dram_Ch0_l2b1_wr_q_4;
    dram_Ch0_l2b1_wr_q[5] = dram_Ch0_l2b1_wr_q_5;
    dram_Ch0_l2b1_wr_q[6] = dram_Ch0_l2b1_wr_q_6;
    dram_Ch0_l2b1_wr_q[7] = dram_Ch0_l2b1_wr_q_7;
end
always @(dram_Ch1_l2b0_wr_q_0 or dram_Ch1_l2b0_wr_q_1 or dram_Ch1_l2b0_wr_q_2 or dram_Ch1_l2b0_wr_q_3 or 
         dram_Ch1_l2b0_wr_q_4 or dram_Ch1_l2b0_wr_q_5 or dram_Ch1_l2b0_wr_q_6 or dram_Ch1_l2b0_wr_q_7 or 
	 dram_rst_l)
begin 
    dram_Ch1_l2b0_wr_q[0] = dram_Ch1_l2b0_wr_q_0;
    dram_Ch1_l2b0_wr_q[1] = dram_Ch1_l2b0_wr_q_1;
    dram_Ch1_l2b0_wr_q[2] = dram_Ch1_l2b0_wr_q_2;
    dram_Ch1_l2b0_wr_q[3] = dram_Ch1_l2b0_wr_q_3;
    dram_Ch1_l2b0_wr_q[4] = dram_Ch1_l2b0_wr_q_4;
    dram_Ch1_l2b0_wr_q[5] = dram_Ch1_l2b0_wr_q_5;
    dram_Ch1_l2b0_wr_q[6] = dram_Ch1_l2b0_wr_q_6;
    dram_Ch1_l2b0_wr_q[7] = dram_Ch1_l2b0_wr_q_7;
end
always @(dram_Ch1_l2b1_wr_q_0 or dram_Ch1_l2b1_wr_q_1 or dram_Ch1_l2b1_wr_q_2 or dram_Ch1_l2b1_wr_q_3 or 
         dram_Ch1_l2b1_wr_q_4 or dram_Ch1_l2b1_wr_q_5 or dram_Ch1_l2b1_wr_q_6 or dram_Ch1_l2b1_wr_q_7 or 
	 dram_rst_l)
begin 
    dram_Ch1_l2b1_wr_q[0] = dram_Ch1_l2b1_wr_q_0;
    dram_Ch1_l2b1_wr_q[1] = dram_Ch1_l2b1_wr_q_1;
    dram_Ch1_l2b1_wr_q[2] = dram_Ch1_l2b1_wr_q_2;
    dram_Ch1_l2b1_wr_q[3] = dram_Ch1_l2b1_wr_q_3;
    dram_Ch1_l2b1_wr_q[4] = dram_Ch1_l2b1_wr_q_4;
    dram_Ch1_l2b1_wr_q[5] = dram_Ch1_l2b1_wr_q_5;
    dram_Ch1_l2b1_wr_q[6] = dram_Ch1_l2b1_wr_q_6;
    dram_Ch1_l2b1_wr_q[7] = dram_Ch1_l2b1_wr_q_7;
end
always @(dram_Ch2_l2b0_wr_q_0 or dram_Ch2_l2b0_wr_q_1 or dram_Ch2_l2b0_wr_q_2 or dram_Ch2_l2b0_wr_q_3 or 
         dram_Ch2_l2b0_wr_q_4 or dram_Ch2_l2b0_wr_q_5 or dram_Ch2_l2b0_wr_q_6 or dram_Ch2_l2b0_wr_q_7 or 
	 dram_rst_l)
begin 
    dram_Ch2_l2b0_wr_q[0] = dram_Ch2_l2b0_wr_q_0;
    dram_Ch2_l2b0_wr_q[1] = dram_Ch2_l2b0_wr_q_1;
    dram_Ch2_l2b0_wr_q[2] = dram_Ch2_l2b0_wr_q_2;
    dram_Ch2_l2b0_wr_q[3] = dram_Ch2_l2b0_wr_q_3;
    dram_Ch2_l2b0_wr_q[4] = dram_Ch2_l2b0_wr_q_4;
    dram_Ch2_l2b0_wr_q[5] = dram_Ch2_l2b0_wr_q_5;
    dram_Ch2_l2b0_wr_q[6] = dram_Ch2_l2b0_wr_q_6;
    dram_Ch2_l2b0_wr_q[7] = dram_Ch2_l2b0_wr_q_7;
end
always @(dram_Ch2_l2b1_wr_q_0 or dram_Ch2_l2b1_wr_q_1 or dram_Ch2_l2b1_wr_q_2 or dram_Ch2_l2b1_wr_q_3 or 
         dram_Ch2_l2b1_wr_q_4 or dram_Ch2_l2b1_wr_q_5 or dram_Ch2_l2b1_wr_q_6 or dram_Ch2_l2b1_wr_q_7 or 
	 dram_rst_l)
begin 
    dram_Ch2_l2b1_wr_q[0] = dram_Ch2_l2b1_wr_q_0;
    dram_Ch2_l2b1_wr_q[1] = dram_Ch2_l2b1_wr_q_1;
    dram_Ch2_l2b1_wr_q[2] = dram_Ch2_l2b1_wr_q_2;
    dram_Ch2_l2b1_wr_q[3] = dram_Ch2_l2b1_wr_q_3;
    dram_Ch2_l2b1_wr_q[4] = dram_Ch2_l2b1_wr_q_4;
    dram_Ch2_l2b1_wr_q[5] = dram_Ch2_l2b1_wr_q_5;
    dram_Ch2_l2b1_wr_q[6] = dram_Ch2_l2b1_wr_q_6;
    dram_Ch2_l2b1_wr_q[7] = dram_Ch2_l2b1_wr_q_7;
end
always @(dram_Ch3_l2b0_wr_q_0 or dram_Ch3_l2b0_wr_q_1 or dram_Ch3_l2b0_wr_q_2 or dram_Ch3_l2b0_wr_q_3 or 
         dram_Ch3_l2b0_wr_q_4 or dram_Ch3_l2b0_wr_q_5 or dram_Ch3_l2b0_wr_q_6 or dram_Ch3_l2b0_wr_q_7 or 
	 dram_rst_l)
begin 
    dram_Ch3_l2b0_wr_q[0] = dram_Ch3_l2b0_wr_q_0;
    dram_Ch3_l2b0_wr_q[1] = dram_Ch3_l2b0_wr_q_1;
    dram_Ch3_l2b0_wr_q[2] = dram_Ch3_l2b0_wr_q_2;
    dram_Ch3_l2b0_wr_q[3] = dram_Ch3_l2b0_wr_q_3;
    dram_Ch3_l2b0_wr_q[4] = dram_Ch3_l2b0_wr_q_4;
    dram_Ch3_l2b0_wr_q[5] = dram_Ch3_l2b0_wr_q_5;
    dram_Ch3_l2b0_wr_q[6] = dram_Ch3_l2b0_wr_q_6;
    dram_Ch3_l2b0_wr_q[7] = dram_Ch3_l2b0_wr_q_7;
end
always @(dram_Ch3_l2b1_wr_q_0 or dram_Ch3_l2b1_wr_q_1 or dram_Ch3_l2b1_wr_q_2 or dram_Ch3_l2b1_wr_q_3 or 
         dram_Ch3_l2b1_wr_q_4 or dram_Ch3_l2b1_wr_q_5 or dram_Ch3_l2b1_wr_q_6 or dram_Ch3_l2b1_wr_q_7 or 
	 dram_rst_l)
begin 
    dram_Ch3_l2b1_wr_q[0] = dram_Ch3_l2b1_wr_q_0;
    dram_Ch3_l2b1_wr_q[1] = dram_Ch3_l2b1_wr_q_1;
    dram_Ch3_l2b1_wr_q[2] = dram_Ch3_l2b1_wr_q_2;
    dram_Ch3_l2b1_wr_q[3] = dram_Ch3_l2b1_wr_q_3;
    dram_Ch3_l2b1_wr_q[4] = dram_Ch3_l2b1_wr_q_4;
    dram_Ch3_l2b1_wr_q[5] = dram_Ch3_l2b1_wr_q_5;
    dram_Ch3_l2b1_wr_q[6] = dram_Ch3_l2b1_wr_q_6;
    dram_Ch3_l2b1_wr_q[7] = dram_Ch3_l2b1_wr_q_7;
end

// ---- WR COLPS FIFO ----

always @( dram_Ch0_l2b0_wr_colps_q_0 or  dram_Ch0_l2b0_wr_colps_q_1 or dram_Ch0_l2b0_wr_colps_q_2 or
          dram_Ch0_l2b0_wr_colps_q_3 or  dram_Ch0_l2b0_wr_colps_q_4 or dram_Ch0_l2b0_wr_colps_q_5 or 
          dram_Ch0_l2b0_wr_colps_q_6 or  dram_Ch0_l2b0_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch0_l2b0_wr_colps_q[0] = dram_Ch0_l2b0_wr_colps_q_0;
    dram_Ch0_l2b0_wr_colps_q[1] = dram_Ch0_l2b0_wr_colps_q_1;
    dram_Ch0_l2b0_wr_colps_q[2] = dram_Ch0_l2b0_wr_colps_q_2;
    dram_Ch0_l2b0_wr_colps_q[3] = dram_Ch0_l2b0_wr_colps_q_3;
    dram_Ch0_l2b0_wr_colps_q[4] = dram_Ch0_l2b0_wr_colps_q_4;
    dram_Ch0_l2b0_wr_colps_q[5] = dram_Ch0_l2b0_wr_colps_q_5;
    dram_Ch0_l2b0_wr_colps_q[6] = dram_Ch0_l2b0_wr_colps_q_6;
    dram_Ch0_l2b0_wr_colps_q[7] = dram_Ch0_l2b0_wr_colps_q_7;
end
always @( dram_Ch0_l2b1_wr_colps_q_0 or  dram_Ch0_l2b1_wr_colps_q_1 or dram_Ch0_l2b1_wr_colps_q_2 or
          dram_Ch0_l2b1_wr_colps_q_3 or  dram_Ch0_l2b1_wr_colps_q_4 or dram_Ch0_l2b1_wr_colps_q_5 or 
          dram_Ch0_l2b1_wr_colps_q_6 or  dram_Ch0_l2b1_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch0_l2b1_wr_colps_q[0] = dram_Ch0_l2b1_wr_colps_q_0;
    dram_Ch0_l2b1_wr_colps_q[1] = dram_Ch0_l2b1_wr_colps_q_1;
    dram_Ch0_l2b1_wr_colps_q[2] = dram_Ch0_l2b1_wr_colps_q_2;
    dram_Ch0_l2b1_wr_colps_q[3] = dram_Ch0_l2b1_wr_colps_q_3;
    dram_Ch0_l2b1_wr_colps_q[4] = dram_Ch0_l2b1_wr_colps_q_4;
    dram_Ch0_l2b1_wr_colps_q[5] = dram_Ch0_l2b1_wr_colps_q_5;
    dram_Ch0_l2b1_wr_colps_q[6] = dram_Ch0_l2b1_wr_colps_q_6;
    dram_Ch0_l2b1_wr_colps_q[7] = dram_Ch0_l2b1_wr_colps_q_7;
end
always @( dram_Ch1_l2b0_wr_colps_q_0 or  dram_Ch1_l2b0_wr_colps_q_1 or dram_Ch1_l2b0_wr_colps_q_2 or
          dram_Ch1_l2b0_wr_colps_q_3 or  dram_Ch1_l2b0_wr_colps_q_4 or dram_Ch1_l2b0_wr_colps_q_5 or 
          dram_Ch1_l2b0_wr_colps_q_6 or  dram_Ch1_l2b0_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch1_l2b0_wr_colps_q[0] = dram_Ch1_l2b0_wr_colps_q_0;
    dram_Ch1_l2b0_wr_colps_q[1] = dram_Ch1_l2b0_wr_colps_q_1;
    dram_Ch1_l2b0_wr_colps_q[2] = dram_Ch1_l2b0_wr_colps_q_2;
    dram_Ch1_l2b0_wr_colps_q[3] = dram_Ch1_l2b0_wr_colps_q_3;
    dram_Ch1_l2b0_wr_colps_q[4] = dram_Ch1_l2b0_wr_colps_q_4;
    dram_Ch1_l2b0_wr_colps_q[5] = dram_Ch1_l2b0_wr_colps_q_5;
    dram_Ch1_l2b0_wr_colps_q[6] = dram_Ch1_l2b0_wr_colps_q_6;
    dram_Ch1_l2b0_wr_colps_q[7] = dram_Ch1_l2b0_wr_colps_q_7;
end
always @( dram_Ch1_l2b1_wr_colps_q_0 or  dram_Ch1_l2b1_wr_colps_q_1 or dram_Ch1_l2b1_wr_colps_q_2 or
          dram_Ch1_l2b1_wr_colps_q_3 or  dram_Ch1_l2b1_wr_colps_q_4 or dram_Ch1_l2b1_wr_colps_q_5 or 
          dram_Ch1_l2b1_wr_colps_q_6 or  dram_Ch1_l2b1_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch1_l2b1_wr_colps_q[0] = dram_Ch1_l2b1_wr_colps_q_0;
    dram_Ch1_l2b1_wr_colps_q[1] = dram_Ch1_l2b1_wr_colps_q_1;
    dram_Ch1_l2b1_wr_colps_q[2] = dram_Ch1_l2b1_wr_colps_q_2;
    dram_Ch1_l2b1_wr_colps_q[3] = dram_Ch1_l2b1_wr_colps_q_3;
    dram_Ch1_l2b1_wr_colps_q[4] = dram_Ch1_l2b1_wr_colps_q_4;
    dram_Ch1_l2b1_wr_colps_q[5] = dram_Ch1_l2b1_wr_colps_q_5;
    dram_Ch1_l2b1_wr_colps_q[6] = dram_Ch1_l2b1_wr_colps_q_6;
    dram_Ch1_l2b1_wr_colps_q[7] = dram_Ch1_l2b1_wr_colps_q_7;
end
always @( dram_Ch2_l2b0_wr_colps_q_0 or  dram_Ch2_l2b0_wr_colps_q_1 or dram_Ch2_l2b0_wr_colps_q_2 or
          dram_Ch2_l2b0_wr_colps_q_3 or  dram_Ch2_l2b0_wr_colps_q_4 or dram_Ch2_l2b0_wr_colps_q_5 or 
          dram_Ch2_l2b0_wr_colps_q_6 or  dram_Ch2_l2b0_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch2_l2b0_wr_colps_q[0] = dram_Ch2_l2b0_wr_colps_q_0;
    dram_Ch2_l2b0_wr_colps_q[1] = dram_Ch2_l2b0_wr_colps_q_1;
    dram_Ch2_l2b0_wr_colps_q[2] = dram_Ch2_l2b0_wr_colps_q_2;
    dram_Ch2_l2b0_wr_colps_q[3] = dram_Ch2_l2b0_wr_colps_q_3;
    dram_Ch2_l2b0_wr_colps_q[4] = dram_Ch2_l2b0_wr_colps_q_4;
    dram_Ch2_l2b0_wr_colps_q[5] = dram_Ch2_l2b0_wr_colps_q_5;
    dram_Ch2_l2b0_wr_colps_q[6] = dram_Ch2_l2b0_wr_colps_q_6;
    dram_Ch2_l2b0_wr_colps_q[7] = dram_Ch2_l2b0_wr_colps_q_7;
end
always @( dram_Ch2_l2b1_wr_colps_q_0 or  dram_Ch2_l2b1_wr_colps_q_1 or dram_Ch2_l2b1_wr_colps_q_2 or
          dram_Ch2_l2b1_wr_colps_q_3 or  dram_Ch2_l2b1_wr_colps_q_4 or dram_Ch2_l2b1_wr_colps_q_5 or 
          dram_Ch2_l2b1_wr_colps_q_6 or  dram_Ch2_l2b1_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch2_l2b1_wr_colps_q[0] = dram_Ch2_l2b1_wr_colps_q_0;
    dram_Ch2_l2b1_wr_colps_q[1] = dram_Ch2_l2b1_wr_colps_q_1;
    dram_Ch2_l2b1_wr_colps_q[2] = dram_Ch2_l2b1_wr_colps_q_2;
    dram_Ch2_l2b1_wr_colps_q[3] = dram_Ch2_l2b1_wr_colps_q_3;
    dram_Ch2_l2b1_wr_colps_q[4] = dram_Ch2_l2b1_wr_colps_q_4;
    dram_Ch2_l2b1_wr_colps_q[5] = dram_Ch2_l2b1_wr_colps_q_5;
    dram_Ch2_l2b1_wr_colps_q[6] = dram_Ch2_l2b1_wr_colps_q_6;
    dram_Ch2_l2b1_wr_colps_q[7] = dram_Ch2_l2b1_wr_colps_q_7;
end
always @( dram_Ch3_l2b0_wr_colps_q_0 or  dram_Ch3_l2b0_wr_colps_q_1 or dram_Ch3_l2b0_wr_colps_q_2 or
          dram_Ch3_l2b0_wr_colps_q_3 or  dram_Ch3_l2b0_wr_colps_q_4 or dram_Ch3_l2b0_wr_colps_q_5 or 
          dram_Ch3_l2b0_wr_colps_q_6 or  dram_Ch3_l2b0_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch3_l2b0_wr_colps_q[0] = dram_Ch3_l2b0_wr_colps_q_0;
    dram_Ch3_l2b0_wr_colps_q[1] = dram_Ch3_l2b0_wr_colps_q_1;
    dram_Ch3_l2b0_wr_colps_q[2] = dram_Ch3_l2b0_wr_colps_q_2;
    dram_Ch3_l2b0_wr_colps_q[3] = dram_Ch3_l2b0_wr_colps_q_3;
    dram_Ch3_l2b0_wr_colps_q[4] = dram_Ch3_l2b0_wr_colps_q_4;
    dram_Ch3_l2b0_wr_colps_q[5] = dram_Ch3_l2b0_wr_colps_q_5;
    dram_Ch3_l2b0_wr_colps_q[6] = dram_Ch3_l2b0_wr_colps_q_6;
    dram_Ch3_l2b0_wr_colps_q[7] = dram_Ch3_l2b0_wr_colps_q_7;
end
always @( dram_Ch3_l2b1_wr_colps_q_0 or  dram_Ch3_l2b1_wr_colps_q_1 or dram_Ch3_l2b1_wr_colps_q_2 or
          dram_Ch3_l2b1_wr_colps_q_3 or  dram_Ch3_l2b1_wr_colps_q_4 or dram_Ch3_l2b1_wr_colps_q_5 or 
          dram_Ch3_l2b1_wr_colps_q_6 or  dram_Ch3_l2b1_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch3_l2b1_wr_colps_q[0] = dram_Ch3_l2b1_wr_colps_q_0;
    dram_Ch3_l2b1_wr_colps_q[1] = dram_Ch3_l2b1_wr_colps_q_1;
    dram_Ch3_l2b1_wr_colps_q[2] = dram_Ch3_l2b1_wr_colps_q_2;
    dram_Ch3_l2b1_wr_colps_q[3] = dram_Ch3_l2b1_wr_colps_q_3;
    dram_Ch3_l2b1_wr_colps_q[4] = dram_Ch3_l2b1_wr_colps_q_4;
    dram_Ch3_l2b1_wr_colps_q[5] = dram_Ch3_l2b1_wr_colps_q_5;
    dram_Ch3_l2b1_wr_colps_q[6] = dram_Ch3_l2b1_wr_colps_q_6;
    dram_Ch3_l2b1_wr_colps_q[7] = dram_Ch3_l2b1_wr_colps_q_7;
end

// ---- WR COLPS FIFO -----

always @( dram_Ch0_b0_phy_bank_bits or  dram_Ch0_b1_phy_bank_bits or  dram_Ch0_b2_phy_bank_bits or
          dram_Ch0_b3_phy_bank_bits or  dram_Ch0_b4_phy_bank_bits or  dram_Ch0_b5_phy_bank_bits or
          dram_Ch0_b6_phy_bank_bits or  dram_Ch0_b7_phy_bank_bits  or dram_rst_l)
begin 
    dram_Ch0_b_phy_bank_bits[0] = dram_Ch0_b0_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[1] = dram_Ch0_b1_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[2] = dram_Ch0_b2_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[3] = dram_Ch0_b3_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[4] = dram_Ch0_b4_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[5] = dram_Ch0_b5_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[6] = dram_Ch0_b6_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[7] = dram_Ch0_b7_phy_bank_bits;
end
always @( dram_Ch1_b0_phy_bank_bits or  dram_Ch1_b1_phy_bank_bits or  dram_Ch1_b2_phy_bank_bits or
          dram_Ch1_b3_phy_bank_bits or  dram_Ch1_b4_phy_bank_bits or  dram_Ch1_b5_phy_bank_bits or
          dram_Ch1_b6_phy_bank_bits or  dram_Ch1_b7_phy_bank_bits  or dram_rst_l)
begin 
    dram_Ch1_b_phy_bank_bits[0] = dram_Ch1_b0_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[1] = dram_Ch1_b1_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[2] = dram_Ch1_b2_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[3] = dram_Ch1_b3_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[4] = dram_Ch1_b4_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[5] = dram_Ch1_b5_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[6] = dram_Ch1_b6_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[7] = dram_Ch1_b7_phy_bank_bits;
end
always @( dram_Ch2_b0_phy_bank_bits or  dram_Ch2_b1_phy_bank_bits or  dram_Ch2_b2_phy_bank_bits or
          dram_Ch2_b3_phy_bank_bits or  dram_Ch2_b4_phy_bank_bits or  dram_Ch2_b5_phy_bank_bits or
          dram_Ch2_b6_phy_bank_bits or  dram_Ch2_b7_phy_bank_bits  or dram_rst_l)
begin 
    dram_Ch2_b_phy_bank_bits[0] = dram_Ch2_b0_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[1] = dram_Ch2_b1_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[2] = dram_Ch2_b2_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[3] = dram_Ch2_b3_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[4] = dram_Ch2_b4_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[5] = dram_Ch2_b5_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[6] = dram_Ch2_b6_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[7] = dram_Ch2_b7_phy_bank_bits;
end
always @( dram_Ch3_b0_phy_bank_bits or  dram_Ch3_b1_phy_bank_bits or  dram_Ch3_b2_phy_bank_bits or
          dram_Ch3_b3_phy_bank_bits or  dram_Ch3_b4_phy_bank_bits or  dram_Ch3_b5_phy_bank_bits or
          dram_Ch3_b6_phy_bank_bits or  dram_Ch3_b7_phy_bank_bits  or dram_rst_l)
begin 
    dram_Ch3_b_phy_bank_bits[0] = dram_Ch3_b0_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[1] = dram_Ch3_b1_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[2] = dram_Ch3_b2_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[3] = dram_Ch3_b3_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[4] = dram_Ch3_b4_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[5] = dram_Ch3_b5_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[6] = dram_Ch3_b6_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[7] = dram_Ch3_b7_phy_bank_bits;
end


// --------- READ Q (MAQ : Address Q) -----------

// detecting rd q full  
reg dram_Ch0_l2b0_rd_q_full;
reg [3:0]  dram_Ch0_l2b0_rd_q_cnt;
reg l2b0_rd_q_full_0;
reg [39:0] l2b0_rd_q_loc_0;
reg [3:0]  l2b0_rd_q_cnt_0;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b0_rd_q_full <= 1'b0;
   dram_Ch0_l2b0_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    l2b0_rd_q_full_0 = 1;
    l2b0_rd_q_cnt_0  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc_0  = dram_Ch0_l2b0_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //l2b0_rd_q_full_0 = (l2b0_rd_q_loc_0[39] && !dram_Ch0_l2b0_rd_que_rd_ptr[i]) && l2b0_rd_q_full_0;
     l2b0_rd_q_full_0 = (l2b0_rd_q_loc_0[39] && l2b0_rd_q_full_0);
     l2b0_rd_q_cnt_0  =  l2b0_rd_q_cnt_0 + (l2b0_rd_q_loc_0[39] && !dram_Ch0_l2b0_rd_que_rd_ptr[i]);
    end
   dram_Ch0_l2b0_rd_q_full <= l2b0_rd_q_full_0;
   dram_Ch0_l2b0_rd_q_cnt  <= l2b0_rd_q_cnt_0;
  end
end
reg dram_Ch0_l2b1_rd_q_full;
reg [3:0]  dram_Ch0_l2b1_rd_q_cnt;
reg l2b1_rd_q_full_0;
reg [39:0] l2b1_rd_q_loc_0;
reg [3:0]  l2b1_rd_q_cnt_0;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b1_rd_q_full <= 1'b0;
   dram_Ch0_l2b1_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    l2b1_rd_q_full_0 = 1;
    l2b1_rd_q_cnt_0  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc_0  = dram_Ch0_l2b1_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //l2b1_rd_q_full_0 = (l2b1_rd_q_loc_0[39] && !dram_Ch0_l2b1_rd_que_rd_ptr[i]) && l2b1_rd_q_full_0;
     l2b1_rd_q_full_0 = (l2b1_rd_q_loc_0[39] && l2b1_rd_q_full_0);
     l2b1_rd_q_cnt_0  =  l2b1_rd_q_cnt_0 + (l2b1_rd_q_loc_0[39] && !dram_Ch0_l2b1_rd_que_rd_ptr[i]);
    end
   dram_Ch0_l2b1_rd_q_full <= l2b1_rd_q_full_0;
   dram_Ch0_l2b1_rd_q_cnt  <= l2b1_rd_q_cnt_0;
  end
end
reg dram_Ch1_l2b0_rd_q_full;
reg [3:0]  dram_Ch1_l2b0_rd_q_cnt;
reg l2b0_rd_q_full_1;
reg [39:0] l2b0_rd_q_loc_1;
reg [3:0]  l2b0_rd_q_cnt_1;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b0_rd_q_full <= 1'b0;
   dram_Ch1_l2b0_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    l2b0_rd_q_full_1 = 1;
    l2b0_rd_q_cnt_1  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc_1  = dram_Ch1_l2b0_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //l2b0_rd_q_full_1 = (l2b0_rd_q_loc_1[39] && !dram_Ch1_l2b0_rd_que_rd_ptr[i]) && l2b0_rd_q_full_1;
     l2b0_rd_q_full_1 = (l2b0_rd_q_loc_1[39] && l2b0_rd_q_full_1);
     l2b0_rd_q_cnt_1  =  l2b0_rd_q_cnt_1 + (l2b0_rd_q_loc_1[39] && !dram_Ch1_l2b0_rd_que_rd_ptr[i]);
    end
   dram_Ch1_l2b0_rd_q_full <= l2b0_rd_q_full_1;
   dram_Ch1_l2b0_rd_q_cnt  <= l2b0_rd_q_cnt_1;
  end
end
reg dram_Ch1_l2b1_rd_q_full;
reg [3:0]  dram_Ch1_l2b1_rd_q_cnt;
reg l2b1_rd_q_full_1;
reg [39:0] l2b1_rd_q_loc_1;
reg [3:0]  l2b1_rd_q_cnt_1;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b1_rd_q_full <= 1'b0;
   dram_Ch1_l2b1_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    l2b1_rd_q_full_1 = 1;
    l2b1_rd_q_cnt_1  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc_1  = dram_Ch1_l2b1_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //l2b1_rd_q_full_1 = (l2b1_rd_q_loc_1[39] && !dram_Ch1_l2b1_rd_que_rd_ptr[i]) && l2b1_rd_q_full_1;
     l2b1_rd_q_full_1 = (l2b1_rd_q_loc_1[39] && l2b1_rd_q_full_1);
     l2b1_rd_q_cnt_1  =  l2b1_rd_q_cnt_1 + (l2b1_rd_q_loc_1[39] && !dram_Ch1_l2b1_rd_que_rd_ptr[i]);
    end
   dram_Ch1_l2b1_rd_q_full <= l2b1_rd_q_full_1;
   dram_Ch1_l2b1_rd_q_cnt  <= l2b1_rd_q_cnt_1;
  end
end
reg dram_Ch2_l2b0_rd_q_full;
reg [3:0]  dram_Ch2_l2b0_rd_q_cnt;
reg l2b0_rd_q_full_2;
reg [39:0] l2b0_rd_q_loc_2;
reg [3:0]  l2b0_rd_q_cnt_2;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b0_rd_q_full <= 1'b0;
   dram_Ch2_l2b0_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    l2b0_rd_q_full_2 = 1;
    l2b0_rd_q_cnt_2  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc_2  = dram_Ch2_l2b0_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //l2b0_rd_q_full_2 = (l2b0_rd_q_loc_2[39] && !dram_Ch2_l2b0_rd_que_rd_ptr[i]) && l2b0_rd_q_full_2;
     l2b0_rd_q_full_2 = (l2b0_rd_q_loc_2[39] && l2b0_rd_q_full_2);
     l2b0_rd_q_cnt_2  =  l2b0_rd_q_cnt_2 + (l2b0_rd_q_loc_2[39] && !dram_Ch2_l2b0_rd_que_rd_ptr[i]);
    end
   dram_Ch2_l2b0_rd_q_full <= l2b0_rd_q_full_2;
   dram_Ch2_l2b0_rd_q_cnt  <= l2b0_rd_q_cnt_2;
  end
end
reg dram_Ch2_l2b1_rd_q_full;
reg [3:0]  dram_Ch2_l2b1_rd_q_cnt;
reg l2b1_rd_q_full_2;
reg [39:0] l2b1_rd_q_loc_2;
reg [3:0]  l2b1_rd_q_cnt_2;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b1_rd_q_full <= 1'b0;
   dram_Ch2_l2b1_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    l2b1_rd_q_full_2 = 1;
    l2b1_rd_q_cnt_2  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc_2  = dram_Ch2_l2b1_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //l2b1_rd_q_full_2 = (l2b1_rd_q_loc_2[39] && !dram_Ch2_l2b1_rd_que_rd_ptr[i]) && l2b1_rd_q_full_2;
     l2b1_rd_q_full_2 = (l2b1_rd_q_loc_2[39] && l2b1_rd_q_full_2);
     l2b1_rd_q_cnt_2  =  l2b1_rd_q_cnt_2 + (l2b1_rd_q_loc_2[39] && !dram_Ch2_l2b1_rd_que_rd_ptr[i]);
    end
   dram_Ch2_l2b1_rd_q_full <= l2b1_rd_q_full_2;
   dram_Ch2_l2b1_rd_q_cnt  <= l2b1_rd_q_cnt_2;
  end
end
reg dram_Ch3_l2b0_rd_q_full;
reg [3:0]  dram_Ch3_l2b0_rd_q_cnt;
reg l2b0_rd_q_full_3;
reg [39:0] l2b0_rd_q_loc_3;
reg [3:0]  l2b0_rd_q_cnt_3;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b0_rd_q_full <= 1'b0;
   dram_Ch3_l2b0_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    l2b0_rd_q_full_3 = 1;
    l2b0_rd_q_cnt_3  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc_3  = dram_Ch3_l2b0_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //l2b0_rd_q_full_3 = (l2b0_rd_q_loc_3[39] && !dram_Ch3_l2b0_rd_que_rd_ptr[i]) && l2b0_rd_q_full_3;
     l2b0_rd_q_full_3 = (l2b0_rd_q_loc_3[39] && l2b0_rd_q_full_3);
     l2b0_rd_q_cnt_3  =  l2b0_rd_q_cnt_3 + (l2b0_rd_q_loc_3[39] && !dram_Ch3_l2b0_rd_que_rd_ptr[i]);
    end
   dram_Ch3_l2b0_rd_q_full <= l2b0_rd_q_full_3;
   dram_Ch3_l2b0_rd_q_cnt  <= l2b0_rd_q_cnt_3;
  end
end
reg dram_Ch3_l2b1_rd_q_full;
reg [3:0]  dram_Ch3_l2b1_rd_q_cnt;
reg l2b1_rd_q_full_3;
reg [39:0] l2b1_rd_q_loc_3;
reg [3:0]  l2b1_rd_q_cnt_3;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b1_rd_q_full <= 1'b0;
   dram_Ch3_l2b1_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    l2b1_rd_q_full_3 = 1;
    l2b1_rd_q_cnt_3  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc_3  = dram_Ch3_l2b1_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //l2b1_rd_q_full_3 = (l2b1_rd_q_loc_3[39] && !dram_Ch3_l2b1_rd_que_rd_ptr[i]) && l2b1_rd_q_full_3;
     l2b1_rd_q_full_3 = (l2b1_rd_q_loc_3[39] && l2b1_rd_q_full_3);
     l2b1_rd_q_cnt_3  =  l2b1_rd_q_cnt_3 + (l2b1_rd_q_loc_3[39] && !dram_Ch3_l2b1_rd_que_rd_ptr[i]);
    end
   dram_Ch3_l2b1_rd_q_full <= l2b1_rd_q_full_3;
   dram_Ch3_l2b1_rd_q_cnt  <= l2b1_rd_q_cnt_3;
  end
end


// ------ RD Q LATENCY COUNTING  --------

reg [31:0]  dram_Ch0_l2b0_rd_q_lat;
always @(posedge (`MCU_CLK && enabled))
begin
  if (dram_Ch0_que_init_dram_done)
   begin
    dram_Ch0_l2b0_rd_q_lat  <= dram_Ch0_l2b0_rd_q_lat + dram_Ch0_l2b0_rd_q_cnt;
   end else begin 
    dram_Ch0_l2b0_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch0_l2b1_rd_q_lat;
always @(posedge (`MCU_CLK && enabled))
begin
  if (dram_Ch0_que_init_dram_done)
   begin
    dram_Ch0_l2b1_rd_q_lat  <= dram_Ch0_l2b1_rd_q_lat + dram_Ch0_l2b1_rd_q_cnt;
   end else begin 
    dram_Ch0_l2b1_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch1_l2b0_rd_q_lat;
always @(posedge (`MCU_CLK && enabled))
begin
  if (dram_Ch1_que_init_dram_done)
   begin
    dram_Ch1_l2b0_rd_q_lat  <= dram_Ch1_l2b0_rd_q_lat + dram_Ch1_l2b0_rd_q_cnt;
   end else begin 
    dram_Ch1_l2b0_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch1_l2b1_rd_q_lat;
always @(posedge (`MCU_CLK && enabled))
begin
  if (dram_Ch1_que_init_dram_done)
   begin
    dram_Ch1_l2b1_rd_q_lat  <= dram_Ch1_l2b1_rd_q_lat + dram_Ch1_l2b1_rd_q_cnt;
   end else begin 
    dram_Ch1_l2b1_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch2_l2b0_rd_q_lat;
always @(posedge (`MCU_CLK && enabled))
begin
  if (dram_Ch2_que_init_dram_done)
   begin
    dram_Ch2_l2b0_rd_q_lat  <= dram_Ch2_l2b0_rd_q_lat + dram_Ch2_l2b0_rd_q_cnt;
   end else begin 
    dram_Ch2_l2b0_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch2_l2b1_rd_q_lat;
always @(posedge (`MCU_CLK && enabled))
begin
  if (dram_Ch2_que_init_dram_done)
   begin
    dram_Ch2_l2b1_rd_q_lat  <= dram_Ch2_l2b1_rd_q_lat + dram_Ch2_l2b1_rd_q_cnt;
   end else begin 
    dram_Ch2_l2b1_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch3_l2b0_rd_q_lat;
always @(posedge (`MCU_CLK && enabled))
begin
  if (dram_Ch3_que_init_dram_done)
   begin
    dram_Ch3_l2b0_rd_q_lat  <= dram_Ch3_l2b0_rd_q_lat + dram_Ch3_l2b0_rd_q_cnt;
   end else begin 
    dram_Ch3_l2b0_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch3_l2b1_rd_q_lat;
always @(posedge (`MCU_CLK && enabled))
begin
  if (dram_Ch3_que_init_dram_done)
   begin
    dram_Ch3_l2b1_rd_q_lat  <= dram_Ch3_l2b1_rd_q_lat + dram_Ch3_l2b1_rd_q_cnt;
   end else begin 
    dram_Ch3_l2b1_rd_q_lat  <= 4'b0;
  end
end


// ---- DETECTING RD COLLAPSING FIFO FULL	(MAQ : Read Request Q)
reg dram_Ch0_l2b0_rd_colps_q_full;
reg colps_l2b0_rd_q_full_0;
reg [11:0] colps_l2b0_rd_q_loc_0;
reg [3:0] dram_Ch0_l2b0_rd_colps_q_cnt;
reg [3:0] colps_l2b0_rd_q_cnt_0;
reg [2:0] colps_l2b0_rd_indx_0;
reg       colps_l2b0_rd_rst_vld_0;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b0_rd_colps_q_full <= 1'b0;
   dram_Ch0_l2b0_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_l2b0_rd_q_full_0 = 1;
    colps_l2b0_rd_q_cnt_0 = 0;
    // extract the index for which the reset occured
    colps_l2b0_rd_rst_vld_0   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch0_l2b0_rd_que_rd_ptr[i]) begin 
        colps_l2b0_rd_indx_0 = i;
        colps_l2b0_rd_rst_vld_0   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_rd_q_loc_0  = dram_Ch0_l2b0_rd_colps_q[i];
     colps_l2b0_rd_q_loc_0[6] = dram_ch0_l2b0_drq_rd_queue_valid[i];	
      if (colps_l2b0_rd_rst_vld_0 == 1) begin 
       if ((colps_l2b0_rd_q_loc_0[11:9] != colps_l2b0_rd_indx_0) || ~colps_l2b0_rd_q_loc_0[6]) begin 
        colps_l2b0_rd_q_full_0 = colps_l2b0_rd_q_loc_0[6]  && colps_l2b0_rd_q_full_0;
        colps_l2b0_rd_q_cnt_0  = colps_l2b0_rd_q_cnt_0 + colps_l2b0_rd_q_loc_0[6];
       end
      end else begin 
        colps_l2b0_rd_q_full_0 = colps_l2b0_rd_q_loc_0[6]  && colps_l2b0_rd_q_full_0;
        colps_l2b0_rd_q_cnt_0  = colps_l2b0_rd_q_cnt_0 + colps_l2b0_rd_q_loc_0[6];
      end
    end
   dram_Ch0_l2b0_rd_colps_q_full <= colps_l2b0_rd_q_full_0;
   dram_Ch0_l2b0_rd_colps_q_cnt  <= colps_l2b0_rd_q_cnt_0;

  end
end
reg dram_Ch0_l2b1_rd_colps_q_full;
reg colps_l2b1_rd_q_full_0;
reg [11:0] colps_l2b1_rd_q_loc_0;
reg [3:0] dram_Ch0_l2b1_rd_colps_q_cnt;
reg [3:0] colps_l2b1_rd_q_cnt_0;
reg [2:0] colps_l2b1_rd_indx_0;
reg       colps_l2b1_rd_rst_vld_0;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b1_rd_colps_q_full <= 1'b0;
   dram_Ch0_l2b1_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_l2b1_rd_q_full_0 = 1;
    colps_l2b1_rd_q_cnt_0 = 0;
    // extract the index for which the reset occured
    colps_l2b1_rd_rst_vld_0   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch0_l2b1_rd_que_rd_ptr[i]) begin 
        colps_l2b1_rd_indx_0 = i;
        colps_l2b1_rd_rst_vld_0   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_rd_q_loc_0  = dram_Ch0_l2b1_rd_colps_q[i];
     colps_l2b1_rd_q_loc_0[6] = dram_ch0_l2b1_drq_rd_queue_valid[i];	
      if (colps_l2b1_rd_rst_vld_0 == 1) begin 
       if ((colps_l2b1_rd_q_loc_0[11:9] != colps_l2b1_rd_indx_0) || ~colps_l2b1_rd_q_loc_0[6]) begin 
        colps_l2b1_rd_q_full_0 = colps_l2b1_rd_q_loc_0[6]  && colps_l2b1_rd_q_full_0;
        colps_l2b1_rd_q_cnt_0  = colps_l2b1_rd_q_cnt_0 + colps_l2b1_rd_q_loc_0[6];
       end
      end else begin 
        colps_l2b1_rd_q_full_0 = colps_l2b1_rd_q_loc_0[6]  && colps_l2b1_rd_q_full_0;
        colps_l2b1_rd_q_cnt_0  = colps_l2b1_rd_q_cnt_0 + colps_l2b1_rd_q_loc_0[6];
      end
    end
   dram_Ch0_l2b1_rd_colps_q_full <= colps_l2b1_rd_q_full_0;
   dram_Ch0_l2b1_rd_colps_q_cnt  <= colps_l2b1_rd_q_cnt_0;

  end
end
reg dram_Ch1_l2b0_rd_colps_q_full;
reg colps_l2b0_rd_q_full_1;
reg [11:0] colps_l2b0_rd_q_loc_1;
reg [3:0] dram_Ch1_l2b0_rd_colps_q_cnt;
reg [3:0] colps_l2b0_rd_q_cnt_1;
reg [2:0] colps_l2b0_rd_indx_1;
reg       colps_l2b0_rd_rst_vld_1;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b0_rd_colps_q_full <= 1'b0;
   dram_Ch1_l2b0_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_l2b0_rd_q_full_1 = 1;
    colps_l2b0_rd_q_cnt_1 = 0;
    // extract the index for which the reset occured
    colps_l2b0_rd_rst_vld_1   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch1_l2b0_rd_que_rd_ptr[i]) begin 
        colps_l2b0_rd_indx_1 = i;
        colps_l2b0_rd_rst_vld_1   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_rd_q_loc_1  = dram_Ch1_l2b0_rd_colps_q[i];
     colps_l2b0_rd_q_loc_1[6] = dram_ch1_l2b0_drq_rd_queue_valid[i];	
      if (colps_l2b0_rd_rst_vld_1 == 1) begin 
       if ((colps_l2b0_rd_q_loc_1[11:9] != colps_l2b0_rd_indx_1) || ~colps_l2b0_rd_q_loc_1[6]) begin 
        colps_l2b0_rd_q_full_1 = colps_l2b0_rd_q_loc_1[6]  && colps_l2b0_rd_q_full_1;
        colps_l2b0_rd_q_cnt_1  = colps_l2b0_rd_q_cnt_1 + colps_l2b0_rd_q_loc_1[6];
       end
      end else begin 
        colps_l2b0_rd_q_full_1 = colps_l2b0_rd_q_loc_1[6]  && colps_l2b0_rd_q_full_1;
        colps_l2b0_rd_q_cnt_1  = colps_l2b0_rd_q_cnt_1 + colps_l2b0_rd_q_loc_1[6];
      end
    end
   dram_Ch1_l2b0_rd_colps_q_full <= colps_l2b0_rd_q_full_1;
   dram_Ch1_l2b0_rd_colps_q_cnt  <= colps_l2b0_rd_q_cnt_1;

  end
end
reg dram_Ch1_l2b1_rd_colps_q_full;
reg colps_l2b1_rd_q_full_1;
reg [11:0] colps_l2b1_rd_q_loc_1;
reg [3:0] dram_Ch1_l2b1_rd_colps_q_cnt;
reg [3:0] colps_l2b1_rd_q_cnt_1;
reg [2:0] colps_l2b1_rd_indx_1;
reg       colps_l2b1_rd_rst_vld_1;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b1_rd_colps_q_full <= 1'b0;
   dram_Ch1_l2b1_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_l2b1_rd_q_full_1 = 1;
    colps_l2b1_rd_q_cnt_1 = 0;
    // extract the index for which the reset occured
    colps_l2b1_rd_rst_vld_1   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch1_l2b1_rd_que_rd_ptr[i]) begin 
        colps_l2b1_rd_indx_1 = i;
        colps_l2b1_rd_rst_vld_1   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_rd_q_loc_1  = dram_Ch1_l2b1_rd_colps_q[i];
     colps_l2b1_rd_q_loc_1[6] = dram_ch1_l2b1_drq_rd_queue_valid[i];	
      if (colps_l2b1_rd_rst_vld_1 == 1) begin 
       if ((colps_l2b1_rd_q_loc_1[11:9] != colps_l2b1_rd_indx_1) || ~colps_l2b1_rd_q_loc_1[6]) begin 
        colps_l2b1_rd_q_full_1 = colps_l2b1_rd_q_loc_1[6]  && colps_l2b1_rd_q_full_1;
        colps_l2b1_rd_q_cnt_1  = colps_l2b1_rd_q_cnt_1 + colps_l2b1_rd_q_loc_1[6];
       end
      end else begin 
        colps_l2b1_rd_q_full_1 = colps_l2b1_rd_q_loc_1[6]  && colps_l2b1_rd_q_full_1;
        colps_l2b1_rd_q_cnt_1  = colps_l2b1_rd_q_cnt_1 + colps_l2b1_rd_q_loc_1[6];
      end
    end
   dram_Ch1_l2b1_rd_colps_q_full <= colps_l2b1_rd_q_full_1;
   dram_Ch1_l2b1_rd_colps_q_cnt  <= colps_l2b1_rd_q_cnt_1;

  end
end
reg dram_Ch2_l2b0_rd_colps_q_full;
reg colps_l2b0_rd_q_full_2;
reg [11:0] colps_l2b0_rd_q_loc_2;
reg [3:0] dram_Ch2_l2b0_rd_colps_q_cnt;
reg [3:0] colps_l2b0_rd_q_cnt_2;
reg [2:0] colps_l2b0_rd_indx_2;
reg       colps_l2b0_rd_rst_vld_2;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b0_rd_colps_q_full <= 1'b0;
   dram_Ch2_l2b0_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_l2b0_rd_q_full_2 = 1;
    colps_l2b0_rd_q_cnt_2 = 0;
    // extract the index for which the reset occured
    colps_l2b0_rd_rst_vld_2   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch2_l2b0_rd_que_rd_ptr[i]) begin 
        colps_l2b0_rd_indx_2 = i;
        colps_l2b0_rd_rst_vld_2   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_rd_q_loc_2  = dram_Ch2_l2b0_rd_colps_q[i];
     colps_l2b0_rd_q_loc_2[6] = dram_ch2_l2b0_drq_rd_queue_valid[i];	
      if (colps_l2b0_rd_rst_vld_2 == 1) begin 
       if ((colps_l2b0_rd_q_loc_2[11:9] != colps_l2b0_rd_indx_2) || ~colps_l2b0_rd_q_loc_2[6]) begin 
        colps_l2b0_rd_q_full_2 = colps_l2b0_rd_q_loc_2[6]  && colps_l2b0_rd_q_full_2;
        colps_l2b0_rd_q_cnt_2  = colps_l2b0_rd_q_cnt_2 + colps_l2b0_rd_q_loc_2[6];
       end
      end else begin 
        colps_l2b0_rd_q_full_2 = colps_l2b0_rd_q_loc_2[6]  && colps_l2b0_rd_q_full_2;
        colps_l2b0_rd_q_cnt_2  = colps_l2b0_rd_q_cnt_2 + colps_l2b0_rd_q_loc_2[6];
      end
    end
   dram_Ch2_l2b0_rd_colps_q_full <= colps_l2b0_rd_q_full_2;
   dram_Ch2_l2b0_rd_colps_q_cnt  <= colps_l2b0_rd_q_cnt_2;

  end
end
reg dram_Ch2_l2b1_rd_colps_q_full;
reg colps_l2b1_rd_q_full_2;
reg [11:0] colps_l2b1_rd_q_loc_2;
reg [3:0] dram_Ch2_l2b1_rd_colps_q_cnt;
reg [3:0] colps_l2b1_rd_q_cnt_2;
reg [2:0] colps_l2b1_rd_indx_2;
reg       colps_l2b1_rd_rst_vld_2;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b1_rd_colps_q_full <= 1'b0;
   dram_Ch2_l2b1_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_l2b1_rd_q_full_2 = 1;
    colps_l2b1_rd_q_cnt_2 = 0;
    // extract the index for which the reset occured
    colps_l2b1_rd_rst_vld_2   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch2_l2b1_rd_que_rd_ptr[i]) begin 
        colps_l2b1_rd_indx_2 = i;
        colps_l2b1_rd_rst_vld_2   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_rd_q_loc_2  = dram_Ch2_l2b1_rd_colps_q[i];
     colps_l2b1_rd_q_loc_2[6] = dram_ch2_l2b1_drq_rd_queue_valid[i];	
      if (colps_l2b1_rd_rst_vld_2 == 1) begin 
       if ((colps_l2b1_rd_q_loc_2[11:9] != colps_l2b1_rd_indx_2) || ~colps_l2b1_rd_q_loc_2[6]) begin 
        colps_l2b1_rd_q_full_2 = colps_l2b1_rd_q_loc_2[6]  && colps_l2b1_rd_q_full_2;
        colps_l2b1_rd_q_cnt_2  = colps_l2b1_rd_q_cnt_2 + colps_l2b1_rd_q_loc_2[6];
       end
      end else begin 
        colps_l2b1_rd_q_full_2 = colps_l2b1_rd_q_loc_2[6]  && colps_l2b1_rd_q_full_2;
        colps_l2b1_rd_q_cnt_2  = colps_l2b1_rd_q_cnt_2 + colps_l2b1_rd_q_loc_2[6];
      end
    end
   dram_Ch2_l2b1_rd_colps_q_full <= colps_l2b1_rd_q_full_2;
   dram_Ch2_l2b1_rd_colps_q_cnt  <= colps_l2b1_rd_q_cnt_2;

  end
end
reg dram_Ch3_l2b0_rd_colps_q_full;
reg colps_l2b0_rd_q_full_3;
reg [11:0] colps_l2b0_rd_q_loc_3;
reg [3:0] dram_Ch3_l2b0_rd_colps_q_cnt;
reg [3:0] colps_l2b0_rd_q_cnt_3;
reg [2:0] colps_l2b0_rd_indx_3;
reg       colps_l2b0_rd_rst_vld_3;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b0_rd_colps_q_full <= 1'b0;
   dram_Ch3_l2b0_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_l2b0_rd_q_full_3 = 1;
    colps_l2b0_rd_q_cnt_3 = 0;
    // extract the index for which the reset occured
    colps_l2b0_rd_rst_vld_3   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch3_l2b0_rd_que_rd_ptr[i]) begin 
        colps_l2b0_rd_indx_3 = i;
        colps_l2b0_rd_rst_vld_3   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_rd_q_loc_3  = dram_Ch3_l2b0_rd_colps_q[i];
     colps_l2b0_rd_q_loc_3[6] = dram_ch3_l2b0_drq_rd_queue_valid[i];	
      if (colps_l2b0_rd_rst_vld_3 == 1) begin 
       if ((colps_l2b0_rd_q_loc_3[11:9] != colps_l2b0_rd_indx_3) || ~colps_l2b0_rd_q_loc_3[6]) begin 
        colps_l2b0_rd_q_full_3 = colps_l2b0_rd_q_loc_3[6]  && colps_l2b0_rd_q_full_3;
        colps_l2b0_rd_q_cnt_3  = colps_l2b0_rd_q_cnt_3 + colps_l2b0_rd_q_loc_3[6];
       end
      end else begin 
        colps_l2b0_rd_q_full_3 = colps_l2b0_rd_q_loc_3[6]  && colps_l2b0_rd_q_full_3;
        colps_l2b0_rd_q_cnt_3  = colps_l2b0_rd_q_cnt_3 + colps_l2b0_rd_q_loc_3[6];
      end
    end
   dram_Ch3_l2b0_rd_colps_q_full <= colps_l2b0_rd_q_full_3;
   dram_Ch3_l2b0_rd_colps_q_cnt  <= colps_l2b0_rd_q_cnt_3;

  end
end
reg dram_Ch3_l2b1_rd_colps_q_full;
reg colps_l2b1_rd_q_full_3;
reg [11:0] colps_l2b1_rd_q_loc_3;
reg [3:0] dram_Ch3_l2b1_rd_colps_q_cnt;
reg [3:0] colps_l2b1_rd_q_cnt_3;
reg [2:0] colps_l2b1_rd_indx_3;
reg       colps_l2b1_rd_rst_vld_3;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b1_rd_colps_q_full <= 1'b0;
   dram_Ch3_l2b1_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_l2b1_rd_q_full_3 = 1;
    colps_l2b1_rd_q_cnt_3 = 0;
    // extract the index for which the reset occured
    colps_l2b1_rd_rst_vld_3   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch3_l2b1_rd_que_rd_ptr[i]) begin 
        colps_l2b1_rd_indx_3 = i;
        colps_l2b1_rd_rst_vld_3   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_rd_q_loc_3  = dram_Ch3_l2b1_rd_colps_q[i];
     colps_l2b1_rd_q_loc_3[6] = dram_ch3_l2b1_drq_rd_queue_valid[i];	
      if (colps_l2b1_rd_rst_vld_3 == 1) begin 
       if ((colps_l2b1_rd_q_loc_3[11:9] != colps_l2b1_rd_indx_3) || ~colps_l2b1_rd_q_loc_3[6]) begin 
        colps_l2b1_rd_q_full_3 = colps_l2b1_rd_q_loc_3[6]  && colps_l2b1_rd_q_full_3;
        colps_l2b1_rd_q_cnt_3  = colps_l2b1_rd_q_cnt_3 + colps_l2b1_rd_q_loc_3[6];
       end
      end else begin 
        colps_l2b1_rd_q_full_3 = colps_l2b1_rd_q_loc_3[6]  && colps_l2b1_rd_q_full_3;
        colps_l2b1_rd_q_cnt_3  = colps_l2b1_rd_q_cnt_3 + colps_l2b1_rd_q_loc_3[6];
      end
    end
   dram_Ch3_l2b1_rd_colps_q_full <= colps_l2b1_rd_q_full_3;
   dram_Ch3_l2b1_rd_colps_q_cnt  <= colps_l2b1_rd_q_cnt_3;

  end
end


// ---- DETECTING RD Q EMPTY	(MAQ : Read Address Q)   ------

reg dram_Ch0_l2b0_rd_q_empty;
reg l2b0_rd_q_empty_0;
reg [39:0] l2b0_rd_q_loc1_0;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b0_rd_q_empty <= 1'b0;
   end
  else
   begin 
    l2b0_rd_q_empty_0 = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc1_0  = dram_Ch0_l2b0_rd_q[i];
     l2b0_rd_q_empty_0 = l2b0_rd_q_loc1_0[39] || l2b0_rd_q_empty_0;
    end
   dram_Ch0_l2b0_rd_q_empty <= ~l2b0_rd_q_empty_0;

   end
end
reg dram_Ch0_l2b1_rd_q_empty;
reg l2b1_rd_q_empty_0;
reg [39:0] l2b1_rd_q_loc1_0;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b1_rd_q_empty <= 1'b0;
   end
  else
   begin 
    l2b1_rd_q_empty_0 = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc1_0  = dram_Ch0_l2b1_rd_q[i];
     l2b1_rd_q_empty_0 = l2b1_rd_q_loc1_0[39] || l2b1_rd_q_empty_0;
    end
   dram_Ch0_l2b1_rd_q_empty <= ~l2b1_rd_q_empty_0;

   end
end
reg dram_Ch1_l2b0_rd_q_empty;
reg l2b0_rd_q_empty_1;
reg [39:0] l2b0_rd_q_loc1_1;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b0_rd_q_empty <= 1'b0;
   end
  else
   begin 
    l2b0_rd_q_empty_1 = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc1_1  = dram_Ch1_l2b0_rd_q[i];
     l2b0_rd_q_empty_1 = l2b0_rd_q_loc1_1[39] || l2b0_rd_q_empty_1;
    end
   dram_Ch1_l2b0_rd_q_empty <= ~l2b0_rd_q_empty_1;

   end
end
reg dram_Ch1_l2b1_rd_q_empty;
reg l2b1_rd_q_empty_1;
reg [39:0] l2b1_rd_q_loc1_1;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b1_rd_q_empty <= 1'b0;
   end
  else
   begin 
    l2b1_rd_q_empty_1 = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc1_1  = dram_Ch1_l2b1_rd_q[i];
     l2b1_rd_q_empty_1 = l2b1_rd_q_loc1_1[39] || l2b1_rd_q_empty_1;
    end
   dram_Ch1_l2b1_rd_q_empty <= ~l2b1_rd_q_empty_1;

   end
end
reg dram_Ch2_l2b0_rd_q_empty;
reg l2b0_rd_q_empty_2;
reg [39:0] l2b0_rd_q_loc1_2;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b0_rd_q_empty <= 1'b0;
   end
  else
   begin 
    l2b0_rd_q_empty_2 = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc1_2  = dram_Ch2_l2b0_rd_q[i];
     l2b0_rd_q_empty_2 = l2b0_rd_q_loc1_2[39] || l2b0_rd_q_empty_2;
    end
   dram_Ch2_l2b0_rd_q_empty <= ~l2b0_rd_q_empty_2;

   end
end
reg dram_Ch2_l2b1_rd_q_empty;
reg l2b1_rd_q_empty_2;
reg [39:0] l2b1_rd_q_loc1_2;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b1_rd_q_empty <= 1'b0;
   end
  else
   begin 
    l2b1_rd_q_empty_2 = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc1_2  = dram_Ch2_l2b1_rd_q[i];
     l2b1_rd_q_empty_2 = l2b1_rd_q_loc1_2[39] || l2b1_rd_q_empty_2;
    end
   dram_Ch2_l2b1_rd_q_empty <= ~l2b1_rd_q_empty_2;

   end
end
reg dram_Ch3_l2b0_rd_q_empty;
reg l2b0_rd_q_empty_3;
reg [39:0] l2b0_rd_q_loc1_3;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b0_rd_q_empty <= 1'b0;
   end
  else
   begin 
    l2b0_rd_q_empty_3 = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc1_3  = dram_Ch3_l2b0_rd_q[i];
     l2b0_rd_q_empty_3 = l2b0_rd_q_loc1_3[39] || l2b0_rd_q_empty_3;
    end
   dram_Ch3_l2b0_rd_q_empty <= ~l2b0_rd_q_empty_3;

   end
end
reg dram_Ch3_l2b1_rd_q_empty;
reg l2b1_rd_q_empty_3;
reg [39:0] l2b1_rd_q_loc1_3;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b1_rd_q_empty <= 1'b0;
   end
  else
   begin 
    l2b1_rd_q_empty_3 = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc1_3  = dram_Ch3_l2b1_rd_q[i];
     l2b1_rd_q_empty_3 = l2b1_rd_q_loc1_3[39] || l2b1_rd_q_empty_3;
    end
   dram_Ch3_l2b1_rd_q_empty <= ~l2b1_rd_q_empty_3;

   end
end

// ---- DETECTING RD COLLAPSING FIFO EMPTY 	(MAQ : Read Request Q) -----
reg dram_Ch0_l2b0_rd_colps_q_empty;
reg colps_l2b0_rd_q_empty_0;
reg [11:0] colps_l2b0_rd_q_loc1_0;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b0_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b0_rd_q_empty_0 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_rd_q_loc1_0  = dram_Ch0_l2b0_rd_colps_q[i];
     colps_l2b0_rd_q_loc1_0[6] = dram_ch0_l2b0_drq_rd_queue_valid[i];	
     colps_l2b0_rd_q_empty_0 = colps_l2b0_rd_q_loc1_0[6] || colps_l2b0_rd_q_empty_0;
    end
   dram_Ch0_l2b0_rd_colps_q_empty <= ~colps_l2b0_rd_q_empty_0;
  end
end
reg dram_Ch0_l2b1_rd_colps_q_empty;
reg colps_l2b1_rd_q_empty_0;
reg [11:0] colps_l2b1_rd_q_loc1_0;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b1_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b1_rd_q_empty_0 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_rd_q_loc1_0  = dram_Ch0_l2b1_rd_colps_q[i];
     colps_l2b1_rd_q_loc1_0[6] = dram_ch0_l2b1_drq_rd_queue_valid[i];	
     colps_l2b1_rd_q_empty_0 = colps_l2b1_rd_q_loc1_0[6] || colps_l2b1_rd_q_empty_0;
    end
   dram_Ch0_l2b1_rd_colps_q_empty <= ~colps_l2b1_rd_q_empty_0;
  end
end
reg dram_Ch1_l2b0_rd_colps_q_empty;
reg colps_l2b0_rd_q_empty_1;
reg [11:0] colps_l2b0_rd_q_loc1_1;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b0_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b0_rd_q_empty_1 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_rd_q_loc1_1  = dram_Ch1_l2b0_rd_colps_q[i];
     colps_l2b0_rd_q_loc1_1[6] = dram_ch1_l2b0_drq_rd_queue_valid[i];	
     colps_l2b0_rd_q_empty_1 = colps_l2b0_rd_q_loc1_1[6] || colps_l2b0_rd_q_empty_1;
    end
   dram_Ch1_l2b0_rd_colps_q_empty <= ~colps_l2b0_rd_q_empty_1;
  end
end
reg dram_Ch1_l2b1_rd_colps_q_empty;
reg colps_l2b1_rd_q_empty_1;
reg [11:0] colps_l2b1_rd_q_loc1_1;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b1_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b1_rd_q_empty_1 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_rd_q_loc1_1  = dram_Ch1_l2b1_rd_colps_q[i];
     colps_l2b1_rd_q_loc1_1[6] = dram_ch1_l2b1_drq_rd_queue_valid[i];	
     colps_l2b1_rd_q_empty_1 = colps_l2b1_rd_q_loc1_1[6] || colps_l2b1_rd_q_empty_1;
    end
   dram_Ch1_l2b1_rd_colps_q_empty <= ~colps_l2b1_rd_q_empty_1;
  end
end
reg dram_Ch2_l2b0_rd_colps_q_empty;
reg colps_l2b0_rd_q_empty_2;
reg [11:0] colps_l2b0_rd_q_loc1_2;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b0_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b0_rd_q_empty_2 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_rd_q_loc1_2  = dram_Ch2_l2b0_rd_colps_q[i];
     colps_l2b0_rd_q_loc1_2[6] = dram_ch2_l2b0_drq_rd_queue_valid[i];	
     colps_l2b0_rd_q_empty_2 = colps_l2b0_rd_q_loc1_2[6] || colps_l2b0_rd_q_empty_2;
    end
   dram_Ch2_l2b0_rd_colps_q_empty <= ~colps_l2b0_rd_q_empty_2;
  end
end
reg dram_Ch2_l2b1_rd_colps_q_empty;
reg colps_l2b1_rd_q_empty_2;
reg [11:0] colps_l2b1_rd_q_loc1_2;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b1_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b1_rd_q_empty_2 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_rd_q_loc1_2  = dram_Ch2_l2b1_rd_colps_q[i];
     colps_l2b1_rd_q_loc1_2[6] = dram_ch2_l2b1_drq_rd_queue_valid[i];	
     colps_l2b1_rd_q_empty_2 = colps_l2b1_rd_q_loc1_2[6] || colps_l2b1_rd_q_empty_2;
    end
   dram_Ch2_l2b1_rd_colps_q_empty <= ~colps_l2b1_rd_q_empty_2;
  end
end
reg dram_Ch3_l2b0_rd_colps_q_empty;
reg colps_l2b0_rd_q_empty_3;
reg [11:0] colps_l2b0_rd_q_loc1_3;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b0_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b0_rd_q_empty_3 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_rd_q_loc1_3  = dram_Ch3_l2b0_rd_colps_q[i];
     colps_l2b0_rd_q_loc1_3[6] = dram_ch3_l2b0_drq_rd_queue_valid[i];	
     colps_l2b0_rd_q_empty_3 = colps_l2b0_rd_q_loc1_3[6] || colps_l2b0_rd_q_empty_3;
    end
   dram_Ch3_l2b0_rd_colps_q_empty <= ~colps_l2b0_rd_q_empty_3;
  end
end
reg dram_Ch3_l2b1_rd_colps_q_empty;
reg colps_l2b1_rd_q_empty_3;
reg [11:0] colps_l2b1_rd_q_loc1_3;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b1_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b1_rd_q_empty_3 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_rd_q_loc1_3  = dram_Ch3_l2b1_rd_colps_q[i];
     colps_l2b1_rd_q_loc1_3[6] = dram_ch3_l2b1_drq_rd_queue_valid[i];	
     colps_l2b1_rd_q_empty_3 = colps_l2b1_rd_q_loc1_3[6] || colps_l2b1_rd_q_empty_3;
    end
   dram_Ch3_l2b1_rd_colps_q_empty <= ~colps_l2b1_rd_q_empty_3;
  end
end

// ------ CROSS BETWEEN RD Q AND RD COLLAPSING FIFO ------

reg [2:0]  l2b0_rd_index_0;
reg [2:0]  l2b0_curr_index_0;
reg [39:0] l2b0_rd_q_0;
reg [11:0] colps_l2b0_rd_q_loc2_0;
always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch0_l2b0_drq_read_queue_cnt != 4'b0000)              
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_rd_q_loc2_0  = dram_Ch0_l2b0_rd_colps_q[i];
       if (dram_ch0_l2b0_drq_rd_queue_valid[i]) begin 	
         l2b0_rd_index_0 = colps_l2b0_rd_q_loc2_0[11:9];
         l2b0_rd_q_0     = dram_Ch0_l2b0_rd_q[l2b0_rd_index_0];
/*mb156858*/          if (l2b0_rd_q_0[39] == 1'b0 ) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 0);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_rd_q_loc2_0  = dram_Ch0_l2b0_rd_colps_q[i];
       if (dram_ch0_l2b0_drq_rd_queue_valid[i]) begin 	
       l2b0_curr_index_0 = colps_l2b0_rd_q_loc2_0[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b0_rd_q_loc2_0  = dram_Ch0_l2b0_rd_colps_q[j];
          
/*mb156858          if (dram_ch0_l2b0_drq_rd_queue_valid[j] && ( colps_l2b0_rd_q_loc2_0[11:9] == l2b0_curr_index_0)) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 0);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b1_rd_index_0;
reg [2:0]  l2b1_curr_index_0;
reg [39:0] l2b1_rd_q_0;
reg [11:0] colps_l2b1_rd_q_loc2_0;
always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch0_l2b1_drq_read_queue_cnt != 4'b0000)              
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_rd_q_loc2_0  = dram_Ch0_l2b1_rd_colps_q[i];
       if (dram_ch0_l2b1_drq_rd_queue_valid[i]) begin 	
         l2b1_rd_index_0 = colps_l2b1_rd_q_loc2_0[11:9];
         l2b1_rd_q_0     = dram_Ch0_l2b1_rd_q[l2b1_rd_index_0];
/*mb156858*/          if (l2b1_rd_q_0[39] == 1'b0 ) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 0);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_rd_q_loc2_0  = dram_Ch0_l2b1_rd_colps_q[i];
       if (dram_ch0_l2b1_drq_rd_queue_valid[i]) begin 	
       l2b1_curr_index_0 = colps_l2b1_rd_q_loc2_0[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b1_rd_q_loc2_0  = dram_Ch0_l2b1_rd_colps_q[j];
          
/*mb156858          if (dram_ch0_l2b1_drq_rd_queue_valid[j] && ( colps_l2b1_rd_q_loc2_0[11:9] == l2b1_curr_index_0)) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 0);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b0_rd_index_1;
reg [2:0]  l2b0_curr_index_1;
reg [39:0] l2b0_rd_q_1;
reg [11:0] colps_l2b0_rd_q_loc2_1;
always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch1_l2b0_drq_read_queue_cnt != 4'b0000)              
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_rd_q_loc2_1  = dram_Ch1_l2b0_rd_colps_q[i];
       if (dram_ch1_l2b0_drq_rd_queue_valid[i]) begin 	
         l2b0_rd_index_1 = colps_l2b0_rd_q_loc2_1[11:9];
         l2b0_rd_q_1     = dram_Ch1_l2b0_rd_q[l2b0_rd_index_1];
/*mb156858*/          if (l2b0_rd_q_1[39] == 1'b0 ) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 1);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_rd_q_loc2_1  = dram_Ch1_l2b0_rd_colps_q[i];
       if (dram_ch1_l2b0_drq_rd_queue_valid[i]) begin 	
       l2b0_curr_index_1 = colps_l2b0_rd_q_loc2_1[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b0_rd_q_loc2_1  = dram_Ch1_l2b0_rd_colps_q[j];
          
/*mb156858          if (dram_ch1_l2b0_drq_rd_queue_valid[j] && ( colps_l2b0_rd_q_loc2_1[11:9] == l2b0_curr_index_1)) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 1);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b1_rd_index_1;
reg [2:0]  l2b1_curr_index_1;
reg [39:0] l2b1_rd_q_1;
reg [11:0] colps_l2b1_rd_q_loc2_1;
always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch1_l2b1_drq_read_queue_cnt != 4'b0000)              
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_rd_q_loc2_1  = dram_Ch1_l2b1_rd_colps_q[i];
       if (dram_ch1_l2b1_drq_rd_queue_valid[i]) begin 	
         l2b1_rd_index_1 = colps_l2b1_rd_q_loc2_1[11:9];
         l2b1_rd_q_1     = dram_Ch1_l2b1_rd_q[l2b1_rd_index_1];
/*mb156858*/          if (l2b1_rd_q_1[39] == 1'b0 ) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 1);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_rd_q_loc2_1  = dram_Ch1_l2b1_rd_colps_q[i];
       if (dram_ch1_l2b1_drq_rd_queue_valid[i]) begin 	
       l2b1_curr_index_1 = colps_l2b1_rd_q_loc2_1[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b1_rd_q_loc2_1  = dram_Ch1_l2b1_rd_colps_q[j];
          
/*mb156858          if (dram_ch1_l2b1_drq_rd_queue_valid[j] && ( colps_l2b1_rd_q_loc2_1[11:9] == l2b1_curr_index_1)) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 1);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b0_rd_index_2;
reg [2:0]  l2b0_curr_index_2;
reg [39:0] l2b0_rd_q_2;
reg [11:0] colps_l2b0_rd_q_loc2_2;
always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch2_l2b0_drq_read_queue_cnt != 4'b0000)              
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_rd_q_loc2_2  = dram_Ch2_l2b0_rd_colps_q[i];
       if (dram_ch2_l2b0_drq_rd_queue_valid[i]) begin 	
         l2b0_rd_index_2 = colps_l2b0_rd_q_loc2_2[11:9];
         l2b0_rd_q_2     = dram_Ch2_l2b0_rd_q[l2b0_rd_index_2];
/*mb156858*/          if (l2b0_rd_q_2[39] == 1'b0 ) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 2);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_rd_q_loc2_2  = dram_Ch2_l2b0_rd_colps_q[i];
       if (dram_ch2_l2b0_drq_rd_queue_valid[i]) begin 	
       l2b0_curr_index_2 = colps_l2b0_rd_q_loc2_2[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b0_rd_q_loc2_2  = dram_Ch2_l2b0_rd_colps_q[j];
          
/*mb156858          if (dram_ch2_l2b0_drq_rd_queue_valid[j] && ( colps_l2b0_rd_q_loc2_2[11:9] == l2b0_curr_index_2)) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 2);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b1_rd_index_2;
reg [2:0]  l2b1_curr_index_2;
reg [39:0] l2b1_rd_q_2;
reg [11:0] colps_l2b1_rd_q_loc2_2;
always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch2_l2b1_drq_read_queue_cnt != 4'b0000)              
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_rd_q_loc2_2  = dram_Ch2_l2b1_rd_colps_q[i];
       if (dram_ch2_l2b1_drq_rd_queue_valid[i]) begin 	
         l2b1_rd_index_2 = colps_l2b1_rd_q_loc2_2[11:9];
         l2b1_rd_q_2     = dram_Ch2_l2b1_rd_q[l2b1_rd_index_2];
/*mb156858*/          if (l2b1_rd_q_2[39] == 1'b0 ) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 2);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_rd_q_loc2_2  = dram_Ch2_l2b1_rd_colps_q[i];
       if (dram_ch2_l2b1_drq_rd_queue_valid[i]) begin 	
       l2b1_curr_index_2 = colps_l2b1_rd_q_loc2_2[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b1_rd_q_loc2_2  = dram_Ch2_l2b1_rd_colps_q[j];
          
/*mb156858          if (dram_ch2_l2b1_drq_rd_queue_valid[j] && ( colps_l2b1_rd_q_loc2_2[11:9] == l2b1_curr_index_2)) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 2);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b0_rd_index_3;
reg [2:0]  l2b0_curr_index_3;
reg [39:0] l2b0_rd_q_3;
reg [11:0] colps_l2b0_rd_q_loc2_3;
always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch3_l2b0_drq_read_queue_cnt != 4'b0000)              
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_rd_q_loc2_3  = dram_Ch3_l2b0_rd_colps_q[i];
       if (dram_ch3_l2b0_drq_rd_queue_valid[i]) begin 	
         l2b0_rd_index_3 = colps_l2b0_rd_q_loc2_3[11:9];
         l2b0_rd_q_3     = dram_Ch3_l2b0_rd_q[l2b0_rd_index_3];
/*mb156858*/          if (l2b0_rd_q_3[39] == 1'b0 ) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 3);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_rd_q_loc2_3  = dram_Ch3_l2b0_rd_colps_q[i];
       if (dram_ch3_l2b0_drq_rd_queue_valid[i]) begin 	
       l2b0_curr_index_3 = colps_l2b0_rd_q_loc2_3[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b0_rd_q_loc2_3  = dram_Ch3_l2b0_rd_colps_q[j];
          
/*mb156858          if (dram_ch3_l2b0_drq_rd_queue_valid[j] && ( colps_l2b0_rd_q_loc2_3[11:9] == l2b0_curr_index_3)) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 3);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b1_rd_index_3;
reg [2:0]  l2b1_curr_index_3;
reg [39:0] l2b1_rd_q_3;
reg [11:0] colps_l2b1_rd_q_loc2_3;
always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch3_l2b1_drq_read_queue_cnt != 4'b0000)              
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_rd_q_loc2_3  = dram_Ch3_l2b1_rd_colps_q[i];
       if (dram_ch3_l2b1_drq_rd_queue_valid[i]) begin 	
         l2b1_rd_index_3 = colps_l2b1_rd_q_loc2_3[11:9];
         l2b1_rd_q_3     = dram_Ch3_l2b1_rd_q[l2b1_rd_index_3];
/*mb156858*/          if (l2b1_rd_q_3[39] == 1'b0 ) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 3);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_rd_q_loc2_3  = dram_Ch3_l2b1_rd_colps_q[i];
       if (dram_ch3_l2b1_drq_rd_queue_valid[i]) begin 	
       l2b1_curr_index_3 = colps_l2b1_rd_q_loc2_3[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b1_rd_q_loc2_3  = dram_Ch3_l2b1_rd_colps_q[j];
          
/*mb156858          if (dram_ch3_l2b1_drq_rd_queue_valid[j] && ( colps_l2b1_rd_q_loc2_3[11:9] == l2b1_curr_index_3)) begin
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 3);
          end */
       end
       end
    end
     
  end
end   

// This can actually happen. The ack should not be given if the fifo is full
// rd fifo full and write to read fifo
//.       for ( 4 = 0; 4 < 4; 4++ ) {
//always @( dram_Ch4_rd_colps_q_full or dram_Ch4_rd_q_full or dram_Ch4_rd_req )
//begin 
//if (dram_rst_l) begin 
// if ((dram_Ch4_rd_colps_q_full || dram_Ch4_rd_q_full) && dram_Ch4_rd_req)
//  begin 
//    `PR_ERROR("mcusat_cov_mon", `ERROR, "In dram channel 4 ");
//    finish_test(" RD Q : Error Read Q full and writing into the Read Q ", 4);
//  end
//end
//end
//.}

// rd reqid in use and read with the same id
 reg [39:0] l2b0_rd_q_loc2_0;
always @( posedge (clk && enabled))
begin 
if (~dram_rst_l) 
  l2b0_rd_q_loc2_0 = 0;
else 
begin 
  if ( dram_Ch0_l2b0_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc2_0  = dram_Ch0_l2b0_rd_q[i];
      // MAQ if ((l2b0_rd_q_loc2_0[38:36] == dram_Ch0_l2b0_rd_id) && l2b0_rd_q_loc2_0[39]) begin 
      if ((l2b0_rd_q_loc2_0[38:36] == dram_Ch0_l2b0_rd_id) && dram_ch0_l2b0_rd_q_valids[i]) begin 
        if (!(dram_Ch0_l2b0_errq_vld & (dram_Ch0_l2b0_errq_id == dram_Ch0_l2b0_rd_id))) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 0);
        end
      end
    end
  end
end
end
 reg [39:0] l2b1_rd_q_loc2_0;
always @( posedge (clk && enabled))
begin 
if (~dram_rst_l) 
  l2b1_rd_q_loc2_0 = 0;
else 
begin 
  if ( dram_Ch0_l2b1_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc2_0  = dram_Ch0_l2b1_rd_q[i];
      // MAQ if ((l2b1_rd_q_loc2_0[38:36] == dram_Ch0_l2b1_rd_id) && l2b1_rd_q_loc2_0[39]) begin 
      if ((l2b1_rd_q_loc2_0[38:36] == dram_Ch0_l2b1_rd_id) && dram_ch0_l2b1_rd_q_valids[i]) begin 
        if (!(dram_Ch0_l2b1_errq_vld & (dram_Ch0_l2b1_errq_id == dram_Ch0_l2b1_rd_id))) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 0);
        end
      end
    end
  end
end
end
 reg [39:0] l2b0_rd_q_loc2_1;
always @( posedge (clk && enabled))
begin 
if (~dram_rst_l) 
  l2b0_rd_q_loc2_1 = 0;
else 
begin 
  if ( dram_Ch1_l2b0_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc2_1  = dram_Ch1_l2b0_rd_q[i];
      // MAQ if ((l2b0_rd_q_loc2_1[38:36] == dram_Ch1_l2b0_rd_id) && l2b0_rd_q_loc2_1[39]) begin 
      if ((l2b0_rd_q_loc2_1[38:36] == dram_Ch1_l2b0_rd_id) && dram_ch1_l2b0_rd_q_valids[i]) begin 
        if (!(dram_Ch1_l2b0_errq_vld & (dram_Ch1_l2b0_errq_id == dram_Ch1_l2b0_rd_id))) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 1);
        end
      end
    end
  end
end
end
 reg [39:0] l2b1_rd_q_loc2_1;
always @( posedge (clk && enabled))
begin 
if (~dram_rst_l) 
  l2b1_rd_q_loc2_1 = 0;
else 
begin 
  if ( dram_Ch1_l2b1_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc2_1  = dram_Ch1_l2b1_rd_q[i];
      // MAQ if ((l2b1_rd_q_loc2_1[38:36] == dram_Ch1_l2b1_rd_id) && l2b1_rd_q_loc2_1[39]) begin 
      if ((l2b1_rd_q_loc2_1[38:36] == dram_Ch1_l2b1_rd_id) && dram_ch1_l2b1_rd_q_valids[i]) begin 
        if (!(dram_Ch1_l2b1_errq_vld & (dram_Ch1_l2b1_errq_id == dram_Ch1_l2b1_rd_id))) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 1);
        end
      end
    end
  end
end
end
 reg [39:0] l2b0_rd_q_loc2_2;
always @( posedge (clk && enabled))
begin 
if (~dram_rst_l) 
  l2b0_rd_q_loc2_2 = 0;
else 
begin 
  if ( dram_Ch2_l2b0_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc2_2  = dram_Ch2_l2b0_rd_q[i];
      // MAQ if ((l2b0_rd_q_loc2_2[38:36] == dram_Ch2_l2b0_rd_id) && l2b0_rd_q_loc2_2[39]) begin 
      if ((l2b0_rd_q_loc2_2[38:36] == dram_Ch2_l2b0_rd_id) && dram_ch2_l2b0_rd_q_valids[i]) begin 
        if (!(dram_Ch2_l2b0_errq_vld & (dram_Ch2_l2b0_errq_id == dram_Ch2_l2b0_rd_id))) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 2);
        end
      end
    end
  end
end
end
 reg [39:0] l2b1_rd_q_loc2_2;
always @( posedge (clk && enabled))
begin 
if (~dram_rst_l) 
  l2b1_rd_q_loc2_2 = 0;
else 
begin 
  if ( dram_Ch2_l2b1_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc2_2  = dram_Ch2_l2b1_rd_q[i];
      // MAQ if ((l2b1_rd_q_loc2_2[38:36] == dram_Ch2_l2b1_rd_id) && l2b1_rd_q_loc2_2[39]) begin 
      if ((l2b1_rd_q_loc2_2[38:36] == dram_Ch2_l2b1_rd_id) && dram_ch2_l2b1_rd_q_valids[i]) begin 
        if (!(dram_Ch2_l2b1_errq_vld & (dram_Ch2_l2b1_errq_id == dram_Ch2_l2b1_rd_id))) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 2);
        end
      end
    end
  end
end
end
 reg [39:0] l2b0_rd_q_loc2_3;
always @( posedge (clk && enabled))
begin 
if (~dram_rst_l) 
  l2b0_rd_q_loc2_3 = 0;
else 
begin 
  if ( dram_Ch3_l2b0_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     l2b0_rd_q_loc2_3  = dram_Ch3_l2b0_rd_q[i];
      // MAQ if ((l2b0_rd_q_loc2_3[38:36] == dram_Ch3_l2b0_rd_id) && l2b0_rd_q_loc2_3[39]) begin 
      if ((l2b0_rd_q_loc2_3[38:36] == dram_Ch3_l2b0_rd_id) && dram_ch3_l2b0_rd_q_valids[i]) begin 
        if (!(dram_Ch3_l2b0_errq_vld & (dram_Ch3_l2b0_errq_id == dram_Ch3_l2b0_rd_id))) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 3);
        end
      end
    end
  end
end
end
 reg [39:0] l2b1_rd_q_loc2_3;
always @( posedge  (clk && enabled))
begin 
if (~dram_rst_l) 
  l2b1_rd_q_loc2_3 = 0;
else 
begin 
  if ( dram_Ch3_l2b1_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     l2b1_rd_q_loc2_3  = dram_Ch3_l2b1_rd_q[i];
      // MAQ if ((l2b1_rd_q_loc2_3[38:36] == dram_Ch3_l2b1_rd_id) && l2b1_rd_q_loc2_3[39]) begin 
      if ((l2b1_rd_q_loc2_3[38:36] == dram_Ch3_l2b1_rd_id) && dram_ch3_l2b1_rd_q_valids[i]) begin 
        if (!(dram_Ch3_l2b1_errq_vld & (dram_Ch3_l2b1_errq_id == dram_Ch3_l2b1_rd_id))) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 3);
        end
      end
    end
  end
end
end


// rd q valid and data written ( overwritting an existing entry ) (MAQ : Read Address Q)
 reg [39:0] l2b0_rd_q_loc3_0;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch0_l2b0_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_rd_q_loc3_0  = dram_Ch0_l2b0_rd_q[i];
    if ((dram_Ch0_l2b0_rd_que_wr_ptr[i] == 1'b1) && (l2b0_rd_q_loc3_0[39] == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 0);
    end  
  end
end
end
 reg [39:0] l2b1_rd_q_loc3_0;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch0_l2b1_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_rd_q_loc3_0  = dram_Ch0_l2b1_rd_q[i];
    if ((dram_Ch0_l2b1_rd_que_wr_ptr[i] == 1'b1) && (l2b1_rd_q_loc3_0[39] == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 0);
    end  
  end
end
end
 reg [39:0] l2b0_rd_q_loc3_1;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch1_l2b0_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_rd_q_loc3_1  = dram_Ch1_l2b0_rd_q[i];
    if ((dram_Ch1_l2b0_rd_que_wr_ptr[i] == 1'b1) && (l2b0_rd_q_loc3_1[39] == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 1);
    end  
  end
end
end
 reg [39:0] l2b1_rd_q_loc3_1;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch1_l2b1_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_rd_q_loc3_1  = dram_Ch1_l2b1_rd_q[i];
    if ((dram_Ch1_l2b1_rd_que_wr_ptr[i] == 1'b1) && (l2b1_rd_q_loc3_1[39] == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 1);
    end  
  end
end
end
 reg [39:0] l2b0_rd_q_loc3_2;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch2_l2b0_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_rd_q_loc3_2  = dram_Ch2_l2b0_rd_q[i];
    if ((dram_Ch2_l2b0_rd_que_wr_ptr[i] == 1'b1) && (l2b0_rd_q_loc3_2[39] == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 2);
    end  
  end
end
end
 reg [39:0] l2b1_rd_q_loc3_2;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch2_l2b1_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_rd_q_loc3_2  = dram_Ch2_l2b1_rd_q[i];
    if ((dram_Ch2_l2b1_rd_que_wr_ptr[i] == 1'b1) && (l2b1_rd_q_loc3_2[39] == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 2);
    end  
  end
end
end
 reg [39:0] l2b0_rd_q_loc3_3;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch3_l2b0_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_rd_q_loc3_3  = dram_Ch3_l2b0_rd_q[i];
    if ((dram_Ch3_l2b0_rd_que_wr_ptr[i] == 1'b1) && (l2b0_rd_q_loc3_3[39] == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 3);
    end  
  end
end
end
 reg [39:0] l2b1_rd_q_loc3_3;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch3_l2b1_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_rd_q_loc3_3  = dram_Ch3_l2b1_rd_q[i];
    if ((dram_Ch3_l2b1_rd_que_wr_ptr[i] == 1'b1) && (l2b1_rd_q_loc3_3[39] == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 3);
    end  
  end
end
end

// ---- RD Q NOT VALID AND DATA READ ( RD_PTR FOR RD QUE ASSERTED )  (MAQ : Read Address Q) -----

 reg [39:0] l2b0_rd_q_loc4_0;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch0_l2b0_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_rd_q_loc4_0  = dram_Ch0_l2b0_rd_q[i];
    if ((dram_Ch0_l2b0_rd_que_rd_ptr[i] == 1'b1) && (l2b0_rd_q_loc4_0[39] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 0);
    end  
  end
end
end
 reg [39:0] l2b1_rd_q_loc4_0;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch0_l2b1_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_rd_q_loc4_0  = dram_Ch0_l2b1_rd_q[i];
    if ((dram_Ch0_l2b1_rd_que_rd_ptr[i] == 1'b1) && (l2b1_rd_q_loc4_0[39] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 0);
    end  
  end
end
end
 reg [39:0] l2b0_rd_q_loc4_1;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch1_l2b0_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_rd_q_loc4_1  = dram_Ch1_l2b0_rd_q[i];
    if ((dram_Ch1_l2b0_rd_que_rd_ptr[i] == 1'b1) && (l2b0_rd_q_loc4_1[39] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 1);
    end  
  end
end
end
 reg [39:0] l2b1_rd_q_loc4_1;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch1_l2b1_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_rd_q_loc4_1  = dram_Ch1_l2b1_rd_q[i];
    if ((dram_Ch1_l2b1_rd_que_rd_ptr[i] == 1'b1) && (l2b1_rd_q_loc4_1[39] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 1);
    end  
  end
end
end
 reg [39:0] l2b0_rd_q_loc4_2;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch2_l2b0_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_rd_q_loc4_2  = dram_Ch2_l2b0_rd_q[i];
    if ((dram_Ch2_l2b0_rd_que_rd_ptr[i] == 1'b1) && (l2b0_rd_q_loc4_2[39] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 2);
    end  
  end
end
end
 reg [39:0] l2b1_rd_q_loc4_2;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch2_l2b1_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_rd_q_loc4_2  = dram_Ch2_l2b1_rd_q[i];
    if ((dram_Ch2_l2b1_rd_que_rd_ptr[i] == 1'b1) && (l2b1_rd_q_loc4_2[39] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 2);
    end  
  end
end
end
 reg [39:0] l2b0_rd_q_loc4_3;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch3_l2b0_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_rd_q_loc4_3  = dram_Ch3_l2b0_rd_q[i];
    if ((dram_Ch3_l2b0_rd_que_rd_ptr[i] == 1'b1) && (l2b0_rd_q_loc4_3[39] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 3);
    end  
  end
end
end
 reg [39:0] l2b1_rd_q_loc4_3;
always @( posedge (`MCU_CLK && enabled))
//always @ (dram_Ch3_l2b1_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_rd_q_loc4_3  = dram_Ch3_l2b1_rd_q[i];
    if ((dram_Ch3_l2b1_rd_que_rd_ptr[i] == 1'b1) && (l2b1_rd_q_loc4_3[39] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 3);
    end  
  end
end
end


// ----- Monitor allocation and deallocation time for each entry in the rd q 	(MAQ : Read Address Q) ------

 reg [39:0] l2b0_rd_q_loc5_0;
reg [10:0]  dram_Ch0_l2b0_rd_q_cntr [7:0];
wire [10:0] dram_Ch0_l2b0_rd_q_cntr_0 = dram_Ch0_l2b0_rd_q_cntr[0];
wire [10:0] dram_Ch0_l2b0_rd_q_cntr_1 = dram_Ch0_l2b0_rd_q_cntr[1];
wire [10:0] dram_Ch0_l2b0_rd_q_cntr_2 = dram_Ch0_l2b0_rd_q_cntr[2];
wire [10:0] dram_Ch0_l2b0_rd_q_cntr_3 = dram_Ch0_l2b0_rd_q_cntr[3];
wire [10:0] dram_Ch0_l2b0_rd_q_cntr_4 = dram_Ch0_l2b0_rd_q_cntr[4];
wire [10:0] dram_Ch0_l2b0_rd_q_cntr_5 = dram_Ch0_l2b0_rd_q_cntr[5];
wire [10:0] dram_Ch0_l2b0_rd_q_cntr_6 = dram_Ch0_l2b0_rd_q_cntr[6];
wire [10:0] dram_Ch0_l2b0_rd_q_cntr_7 = dram_Ch0_l2b0_rd_q_cntr[7];

reg [10:0] dram_Ch0_l2b0_rd_q_cnt_max;
reg [2:0]  dram_Ch0_l2b0_rd_q_cnt_max_entry;

 reg [40:0] l2b0_wr_q_loc7_0;
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
       dram_Ch0_l2b0_rd_q_cnt_max = 0;
       dram_Ch0_l2b0_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_l2b0_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b0_rd_q_loc5_0  = dram_Ch0_l2b0_rd_q[i];
      dram_Ch0_l2b0_rd_q_cntr[i] <= (l2b0_rd_q_loc5_0[39] == 1'b1) ? dram_Ch0_l2b0_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch0_l2b0_rd_q_cntr[i] > dram_Ch0_l2b0_rd_q_cnt_max ) begin 
         dram_Ch0_l2b0_rd_q_cnt_max = dram_Ch0_l2b0_rd_q_cntr[i];
         dram_Ch0_l2b0_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch0_l2b0_rd_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 0);
       end  
     end
    end
   end
end
 reg [39:0] l2b1_rd_q_loc5_0;
reg [10:0]  dram_Ch0_l2b1_rd_q_cntr [7:0];
wire [10:0] dram_Ch0_l2b1_rd_q_cntr_0 = dram_Ch0_l2b1_rd_q_cntr[0];
wire [10:0] dram_Ch0_l2b1_rd_q_cntr_1 = dram_Ch0_l2b1_rd_q_cntr[1];
wire [10:0] dram_Ch0_l2b1_rd_q_cntr_2 = dram_Ch0_l2b1_rd_q_cntr[2];
wire [10:0] dram_Ch0_l2b1_rd_q_cntr_3 = dram_Ch0_l2b1_rd_q_cntr[3];
wire [10:0] dram_Ch0_l2b1_rd_q_cntr_4 = dram_Ch0_l2b1_rd_q_cntr[4];
wire [10:0] dram_Ch0_l2b1_rd_q_cntr_5 = dram_Ch0_l2b1_rd_q_cntr[5];
wire [10:0] dram_Ch0_l2b1_rd_q_cntr_6 = dram_Ch0_l2b1_rd_q_cntr[6];
wire [10:0] dram_Ch0_l2b1_rd_q_cntr_7 = dram_Ch0_l2b1_rd_q_cntr[7];

reg [10:0] dram_Ch0_l2b1_rd_q_cnt_max;
reg [2:0]  dram_Ch0_l2b1_rd_q_cnt_max_entry;

 reg [40:0] l2b1_wr_q_loc7_0;
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
       dram_Ch0_l2b1_rd_q_cnt_max = 0;
       dram_Ch0_l2b1_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_l2b1_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b1_rd_q_loc5_0  = dram_Ch0_l2b1_rd_q[i];
      dram_Ch0_l2b1_rd_q_cntr[i] <= (l2b1_rd_q_loc5_0[39] == 1'b1) ? dram_Ch0_l2b1_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch0_l2b1_rd_q_cntr[i] > dram_Ch0_l2b1_rd_q_cnt_max ) begin 
         dram_Ch0_l2b1_rd_q_cnt_max = dram_Ch0_l2b1_rd_q_cntr[i];
         dram_Ch0_l2b1_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch0_l2b1_rd_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 0);
       end  
     end
    end
   end
end
 reg [39:0] l2b0_rd_q_loc5_1;
reg [10:0]  dram_Ch1_l2b0_rd_q_cntr [7:0];
wire [10:0] dram_Ch1_l2b0_rd_q_cntr_0 = dram_Ch1_l2b0_rd_q_cntr[0];
wire [10:0] dram_Ch1_l2b0_rd_q_cntr_1 = dram_Ch1_l2b0_rd_q_cntr[1];
wire [10:0] dram_Ch1_l2b0_rd_q_cntr_2 = dram_Ch1_l2b0_rd_q_cntr[2];
wire [10:0] dram_Ch1_l2b0_rd_q_cntr_3 = dram_Ch1_l2b0_rd_q_cntr[3];
wire [10:0] dram_Ch1_l2b0_rd_q_cntr_4 = dram_Ch1_l2b0_rd_q_cntr[4];
wire [10:0] dram_Ch1_l2b0_rd_q_cntr_5 = dram_Ch1_l2b0_rd_q_cntr[5];
wire [10:0] dram_Ch1_l2b0_rd_q_cntr_6 = dram_Ch1_l2b0_rd_q_cntr[6];
wire [10:0] dram_Ch1_l2b0_rd_q_cntr_7 = dram_Ch1_l2b0_rd_q_cntr[7];

reg [10:0] dram_Ch1_l2b0_rd_q_cnt_max;
reg [2:0]  dram_Ch1_l2b0_rd_q_cnt_max_entry;

 reg [40:0] l2b0_wr_q_loc7_1;
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
       dram_Ch1_l2b0_rd_q_cnt_max = 0;
       dram_Ch1_l2b0_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_l2b0_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b0_rd_q_loc5_1  = dram_Ch1_l2b0_rd_q[i];
      dram_Ch1_l2b0_rd_q_cntr[i] <= (l2b0_rd_q_loc5_1[39] == 1'b1) ? dram_Ch1_l2b0_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch1_l2b0_rd_q_cntr[i] > dram_Ch1_l2b0_rd_q_cnt_max ) begin 
         dram_Ch1_l2b0_rd_q_cnt_max = dram_Ch1_l2b0_rd_q_cntr[i];
         dram_Ch1_l2b0_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch1_l2b0_rd_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 1);
       end  
     end
    end
   end
end
 reg [39:0] l2b1_rd_q_loc5_1;
reg [10:0]  dram_Ch1_l2b1_rd_q_cntr [7:0];
wire [10:0] dram_Ch1_l2b1_rd_q_cntr_0 = dram_Ch1_l2b1_rd_q_cntr[0];
wire [10:0] dram_Ch1_l2b1_rd_q_cntr_1 = dram_Ch1_l2b1_rd_q_cntr[1];
wire [10:0] dram_Ch1_l2b1_rd_q_cntr_2 = dram_Ch1_l2b1_rd_q_cntr[2];
wire [10:0] dram_Ch1_l2b1_rd_q_cntr_3 = dram_Ch1_l2b1_rd_q_cntr[3];
wire [10:0] dram_Ch1_l2b1_rd_q_cntr_4 = dram_Ch1_l2b1_rd_q_cntr[4];
wire [10:0] dram_Ch1_l2b1_rd_q_cntr_5 = dram_Ch1_l2b1_rd_q_cntr[5];
wire [10:0] dram_Ch1_l2b1_rd_q_cntr_6 = dram_Ch1_l2b1_rd_q_cntr[6];
wire [10:0] dram_Ch1_l2b1_rd_q_cntr_7 = dram_Ch1_l2b1_rd_q_cntr[7];

reg [10:0] dram_Ch1_l2b1_rd_q_cnt_max;
reg [2:0]  dram_Ch1_l2b1_rd_q_cnt_max_entry;

 reg [40:0] l2b1_wr_q_loc7_1;
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
       dram_Ch1_l2b1_rd_q_cnt_max = 0;
       dram_Ch1_l2b1_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_l2b1_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b1_rd_q_loc5_1  = dram_Ch1_l2b1_rd_q[i];
      dram_Ch1_l2b1_rd_q_cntr[i] <= (l2b1_rd_q_loc5_1[39] == 1'b1) ? dram_Ch1_l2b1_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch1_l2b1_rd_q_cntr[i] > dram_Ch1_l2b1_rd_q_cnt_max ) begin 
         dram_Ch1_l2b1_rd_q_cnt_max = dram_Ch1_l2b1_rd_q_cntr[i];
         dram_Ch1_l2b1_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch1_l2b1_rd_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 1);
       end  
     end
    end
   end
end
 reg [39:0] l2b0_rd_q_loc5_2;
reg [10:0]  dram_Ch2_l2b0_rd_q_cntr [7:0];
wire [10:0] dram_Ch2_l2b0_rd_q_cntr_0 = dram_Ch2_l2b0_rd_q_cntr[0];
wire [10:0] dram_Ch2_l2b0_rd_q_cntr_1 = dram_Ch2_l2b0_rd_q_cntr[1];
wire [10:0] dram_Ch2_l2b0_rd_q_cntr_2 = dram_Ch2_l2b0_rd_q_cntr[2];
wire [10:0] dram_Ch2_l2b0_rd_q_cntr_3 = dram_Ch2_l2b0_rd_q_cntr[3];
wire [10:0] dram_Ch2_l2b0_rd_q_cntr_4 = dram_Ch2_l2b0_rd_q_cntr[4];
wire [10:0] dram_Ch2_l2b0_rd_q_cntr_5 = dram_Ch2_l2b0_rd_q_cntr[5];
wire [10:0] dram_Ch2_l2b0_rd_q_cntr_6 = dram_Ch2_l2b0_rd_q_cntr[6];
wire [10:0] dram_Ch2_l2b0_rd_q_cntr_7 = dram_Ch2_l2b0_rd_q_cntr[7];

reg [10:0] dram_Ch2_l2b0_rd_q_cnt_max;
reg [2:0]  dram_Ch2_l2b0_rd_q_cnt_max_entry;

 reg [40:0] l2b0_wr_q_loc7_2;
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
       dram_Ch2_l2b0_rd_q_cnt_max = 0;
       dram_Ch2_l2b0_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_l2b0_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b0_rd_q_loc5_2  = dram_Ch2_l2b0_rd_q[i];
      dram_Ch2_l2b0_rd_q_cntr[i] <= (l2b0_rd_q_loc5_2[39] == 1'b1) ? dram_Ch2_l2b0_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch2_l2b0_rd_q_cntr[i] > dram_Ch2_l2b0_rd_q_cnt_max ) begin 
         dram_Ch2_l2b0_rd_q_cnt_max = dram_Ch2_l2b0_rd_q_cntr[i];
         dram_Ch2_l2b0_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch2_l2b0_rd_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 2);
       end  
     end
    end
   end
end
 reg [39:0] l2b1_rd_q_loc5_2;
reg [10:0]  dram_Ch2_l2b1_rd_q_cntr [7:0];
wire [10:0] dram_Ch2_l2b1_rd_q_cntr_0 = dram_Ch2_l2b1_rd_q_cntr[0];
wire [10:0] dram_Ch2_l2b1_rd_q_cntr_1 = dram_Ch2_l2b1_rd_q_cntr[1];
wire [10:0] dram_Ch2_l2b1_rd_q_cntr_2 = dram_Ch2_l2b1_rd_q_cntr[2];
wire [10:0] dram_Ch2_l2b1_rd_q_cntr_3 = dram_Ch2_l2b1_rd_q_cntr[3];
wire [10:0] dram_Ch2_l2b1_rd_q_cntr_4 = dram_Ch2_l2b1_rd_q_cntr[4];
wire [10:0] dram_Ch2_l2b1_rd_q_cntr_5 = dram_Ch2_l2b1_rd_q_cntr[5];
wire [10:0] dram_Ch2_l2b1_rd_q_cntr_6 = dram_Ch2_l2b1_rd_q_cntr[6];
wire [10:0] dram_Ch2_l2b1_rd_q_cntr_7 = dram_Ch2_l2b1_rd_q_cntr[7];

reg [10:0] dram_Ch2_l2b1_rd_q_cnt_max;
reg [2:0]  dram_Ch2_l2b1_rd_q_cnt_max_entry;

 reg [40:0] l2b1_wr_q_loc7_2;
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
       dram_Ch2_l2b1_rd_q_cnt_max = 0;
       dram_Ch2_l2b1_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_l2b1_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b1_rd_q_loc5_2  = dram_Ch2_l2b1_rd_q[i];
      dram_Ch2_l2b1_rd_q_cntr[i] <= (l2b1_rd_q_loc5_2[39] == 1'b1) ? dram_Ch2_l2b1_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch2_l2b1_rd_q_cntr[i] > dram_Ch2_l2b1_rd_q_cnt_max ) begin 
         dram_Ch2_l2b1_rd_q_cnt_max = dram_Ch2_l2b1_rd_q_cntr[i];
         dram_Ch2_l2b1_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch2_l2b1_rd_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 2);
       end  
     end
    end
   end
end
 reg [39:0] l2b0_rd_q_loc5_3;
reg [10:0]  dram_Ch3_l2b0_rd_q_cntr [7:0];
wire [10:0] dram_Ch3_l2b0_rd_q_cntr_0 = dram_Ch3_l2b0_rd_q_cntr[0];
wire [10:0] dram_Ch3_l2b0_rd_q_cntr_1 = dram_Ch3_l2b0_rd_q_cntr[1];
wire [10:0] dram_Ch3_l2b0_rd_q_cntr_2 = dram_Ch3_l2b0_rd_q_cntr[2];
wire [10:0] dram_Ch3_l2b0_rd_q_cntr_3 = dram_Ch3_l2b0_rd_q_cntr[3];
wire [10:0] dram_Ch3_l2b0_rd_q_cntr_4 = dram_Ch3_l2b0_rd_q_cntr[4];
wire [10:0] dram_Ch3_l2b0_rd_q_cntr_5 = dram_Ch3_l2b0_rd_q_cntr[5];
wire [10:0] dram_Ch3_l2b0_rd_q_cntr_6 = dram_Ch3_l2b0_rd_q_cntr[6];
wire [10:0] dram_Ch3_l2b0_rd_q_cntr_7 = dram_Ch3_l2b0_rd_q_cntr[7];

reg [10:0] dram_Ch3_l2b0_rd_q_cnt_max;
reg [2:0]  dram_Ch3_l2b0_rd_q_cnt_max_entry;

 reg [40:0] l2b0_wr_q_loc7_3;
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
       dram_Ch3_l2b0_rd_q_cnt_max = 0;
       dram_Ch3_l2b0_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_l2b0_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b0_rd_q_loc5_3  = dram_Ch3_l2b0_rd_q[i];
      dram_Ch3_l2b0_rd_q_cntr[i] <= (l2b0_rd_q_loc5_3[39] == 1'b1) ? dram_Ch3_l2b0_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch3_l2b0_rd_q_cntr[i] > dram_Ch3_l2b0_rd_q_cnt_max ) begin 
         dram_Ch3_l2b0_rd_q_cnt_max = dram_Ch3_l2b0_rd_q_cntr[i];
         dram_Ch3_l2b0_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch3_l2b0_rd_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 3);
       end  
     end
    end
   end
end
 reg [39:0] l2b1_rd_q_loc5_3;
reg [10:0]  dram_Ch3_l2b1_rd_q_cntr [7:0];
wire [10:0] dram_Ch3_l2b1_rd_q_cntr_0 = dram_Ch3_l2b1_rd_q_cntr[0];
wire [10:0] dram_Ch3_l2b1_rd_q_cntr_1 = dram_Ch3_l2b1_rd_q_cntr[1];
wire [10:0] dram_Ch3_l2b1_rd_q_cntr_2 = dram_Ch3_l2b1_rd_q_cntr[2];
wire [10:0] dram_Ch3_l2b1_rd_q_cntr_3 = dram_Ch3_l2b1_rd_q_cntr[3];
wire [10:0] dram_Ch3_l2b1_rd_q_cntr_4 = dram_Ch3_l2b1_rd_q_cntr[4];
wire [10:0] dram_Ch3_l2b1_rd_q_cntr_5 = dram_Ch3_l2b1_rd_q_cntr[5];
wire [10:0] dram_Ch3_l2b1_rd_q_cntr_6 = dram_Ch3_l2b1_rd_q_cntr[6];
wire [10:0] dram_Ch3_l2b1_rd_q_cntr_7 = dram_Ch3_l2b1_rd_q_cntr[7];

reg [10:0] dram_Ch3_l2b1_rd_q_cnt_max;
reg [2:0]  dram_Ch3_l2b1_rd_q_cnt_max_entry;

 reg [40:0] l2b1_wr_q_loc7_3;
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
       dram_Ch3_l2b1_rd_q_cnt_max = 0;
       dram_Ch3_l2b1_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_l2b1_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b1_rd_q_loc5_3  = dram_Ch3_l2b1_rd_q[i];
      dram_Ch3_l2b1_rd_q_cntr[i] <= (l2b1_rd_q_loc5_3[39] == 1'b1) ? dram_Ch3_l2b1_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch3_l2b1_rd_q_cntr[i] > dram_Ch3_l2b1_rd_q_cnt_max ) begin 
         dram_Ch3_l2b1_rd_q_cnt_max = dram_Ch3_l2b1_rd_q_cntr[i];
         dram_Ch3_l2b1_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch3_l2b1_rd_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 3);
       end  
     end
    end
   end
end

// -------------- WRITE Q ---------------

// detecting wr q full  
reg dram_Ch0_l2b0_wr_q_full;
reg dram_Ch0_l2b0_wr_q_full_arb;
reg [3:0]  dram_Ch0_l2b0_wr_q_cnt;
// MAQ N2 doesn't support 	reg [3:0]  dram_Ch0_l2b0_wr_q_cnt_arb;
reg l2b0_wr_q_full_0;
reg l2b0_wr_q_full_0_arb;
reg [40:0] l2b0_wr_q_loc_0;
reg [3:0]  l2b0_wr_q_cnt_0;
reg [3:0]  l2b0_wr_q_cnt_0_arb;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch0_l2b0_wr_q_full     <= 1'b0;
    dram_Ch0_l2b0_wr_q_full_arb <= 1'b0;
    dram_Ch0_l2b0_wr_q_cnt      <= 4'b0;
// MAQ N2 doesn't support 	    dram_Ch0_l2b0_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    l2b0_wr_q_full_0 = 1;
    l2b0_wr_q_full_0_arb = 1;
    l2b0_wr_q_cnt_0  = 0;
    l2b0_wr_q_cnt_0_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_wr_q_loc_0  = dram_Ch0_l2b0_wr_q[i];
     l2b0_wr_q_full_0 = l2b0_wr_q_loc_0[40] && l2b0_wr_q_full_0;
     //l2b0_wr_q_full_0_arb = (l2b0_wr_q_loc_0[39] && !dram_Ch0_l2b0_wr_que_rd_ptr_arb[i]) && l2b0_wr_q_full_0_arb;
     l2b0_wr_q_full_0_arb = (l2b0_wr_q_loc_0[39] && l2b0_wr_q_full_0_arb);
     l2b0_wr_q_cnt_0  =  l2b0_wr_q_cnt_0 + l2b0_wr_q_loc_0[40];

// MAQ N2 doesn't support     l2b0_wr_q_cnt_0_arb  =  l2b0_wr_q_cnt_0_arb + (l2b0_wr_q_loc_0[39] && !dram_Ch0_l2b0_wr_que_rd_ptr_arb[i]);

    end
   dram_Ch0_l2b0_wr_q_full     <= l2b0_wr_q_full_0;
   dram_Ch0_l2b0_wr_q_full_arb <= l2b0_wr_q_full_0_arb;
   dram_Ch0_l2b0_wr_q_cnt      <= l2b0_wr_q_cnt_0;
// MAQ N2 doesn't support 	   dram_Ch0_l2b0_wr_q_cnt_arb  <= l2b0_wr_q_cnt_0_arb;
   end
end
reg dram_Ch0_l2b1_wr_q_full;
reg dram_Ch0_l2b1_wr_q_full_arb;
reg [3:0]  dram_Ch0_l2b1_wr_q_cnt;
// MAQ N2 doesn't support 	reg [3:0]  dram_Ch0_l2b1_wr_q_cnt_arb;
reg l2b1_wr_q_full_0;
reg l2b1_wr_q_full_0_arb;
reg [40:0] l2b1_wr_q_loc_0;
reg [3:0]  l2b1_wr_q_cnt_0;
reg [3:0]  l2b1_wr_q_cnt_0_arb;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch0_l2b1_wr_q_full     <= 1'b0;
    dram_Ch0_l2b1_wr_q_full_arb <= 1'b0;
    dram_Ch0_l2b1_wr_q_cnt      <= 4'b0;
// MAQ N2 doesn't support 	    dram_Ch0_l2b1_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    l2b1_wr_q_full_0 = 1;
    l2b1_wr_q_full_0_arb = 1;
    l2b1_wr_q_cnt_0  = 0;
    l2b1_wr_q_cnt_0_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_wr_q_loc_0  = dram_Ch0_l2b1_wr_q[i];
     l2b1_wr_q_full_0 = l2b1_wr_q_loc_0[40] && l2b1_wr_q_full_0;
     //l2b1_wr_q_full_0_arb = (l2b1_wr_q_loc_0[39] && !dram_Ch0_l2b1_wr_que_rd_ptr_arb[i]) && l2b1_wr_q_full_0_arb;
     l2b1_wr_q_full_0_arb = (l2b1_wr_q_loc_0[39] && l2b1_wr_q_full_0_arb);
     l2b1_wr_q_cnt_0  =  l2b1_wr_q_cnt_0 + l2b1_wr_q_loc_0[40];

// MAQ N2 doesn't support     l2b1_wr_q_cnt_0_arb  =  l2b1_wr_q_cnt_0_arb + (l2b1_wr_q_loc_0[39] && !dram_Ch0_l2b1_wr_que_rd_ptr_arb[i]);

    end
   dram_Ch0_l2b1_wr_q_full     <= l2b1_wr_q_full_0;
   dram_Ch0_l2b1_wr_q_full_arb <= l2b1_wr_q_full_0_arb;
   dram_Ch0_l2b1_wr_q_cnt      <= l2b1_wr_q_cnt_0;
// MAQ N2 doesn't support 	   dram_Ch0_l2b1_wr_q_cnt_arb  <= l2b1_wr_q_cnt_0_arb;
   end
end
reg dram_Ch1_l2b0_wr_q_full;
reg dram_Ch1_l2b0_wr_q_full_arb;
reg [3:0]  dram_Ch1_l2b0_wr_q_cnt;
// MAQ N2 doesn't support 	reg [3:0]  dram_Ch1_l2b0_wr_q_cnt_arb;
reg l2b0_wr_q_full_1;
reg l2b0_wr_q_full_1_arb;
reg [40:0] l2b0_wr_q_loc_1;
reg [3:0]  l2b0_wr_q_cnt_1;
reg [3:0]  l2b0_wr_q_cnt_1_arb;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch1_l2b0_wr_q_full     <= 1'b0;
    dram_Ch1_l2b0_wr_q_full_arb <= 1'b0;
    dram_Ch1_l2b0_wr_q_cnt      <= 4'b0;
// MAQ N2 doesn't support 	    dram_Ch1_l2b0_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    l2b0_wr_q_full_1 = 1;
    l2b0_wr_q_full_1_arb = 1;
    l2b0_wr_q_cnt_1  = 0;
    l2b0_wr_q_cnt_1_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_wr_q_loc_1  = dram_Ch1_l2b0_wr_q[i];
     l2b0_wr_q_full_1 = l2b0_wr_q_loc_1[40] && l2b0_wr_q_full_1;
     //l2b0_wr_q_full_1_arb = (l2b0_wr_q_loc_1[39] && !dram_Ch1_l2b0_wr_que_rd_ptr_arb[i]) && l2b0_wr_q_full_1_arb;
     l2b0_wr_q_full_1_arb = (l2b0_wr_q_loc_1[39] && l2b0_wr_q_full_1_arb);
     l2b0_wr_q_cnt_1  =  l2b0_wr_q_cnt_1 + l2b0_wr_q_loc_1[40];

// MAQ N2 doesn't support     l2b0_wr_q_cnt_1_arb  =  l2b0_wr_q_cnt_1_arb + (l2b0_wr_q_loc_1[39] && !dram_Ch1_l2b0_wr_que_rd_ptr_arb[i]);

    end
   dram_Ch1_l2b0_wr_q_full     <= l2b0_wr_q_full_1;
   dram_Ch1_l2b0_wr_q_full_arb <= l2b0_wr_q_full_1_arb;
   dram_Ch1_l2b0_wr_q_cnt      <= l2b0_wr_q_cnt_1;
// MAQ N2 doesn't support 	   dram_Ch1_l2b0_wr_q_cnt_arb  <= l2b0_wr_q_cnt_1_arb;
   end
end
reg dram_Ch1_l2b1_wr_q_full;
reg dram_Ch1_l2b1_wr_q_full_arb;
reg [3:0]  dram_Ch1_l2b1_wr_q_cnt;
// MAQ N2 doesn't support 	reg [3:0]  dram_Ch1_l2b1_wr_q_cnt_arb;
reg l2b1_wr_q_full_1;
reg l2b1_wr_q_full_1_arb;
reg [40:0] l2b1_wr_q_loc_1;
reg [3:0]  l2b1_wr_q_cnt_1;
reg [3:0]  l2b1_wr_q_cnt_1_arb;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch1_l2b1_wr_q_full     <= 1'b0;
    dram_Ch1_l2b1_wr_q_full_arb <= 1'b0;
    dram_Ch1_l2b1_wr_q_cnt      <= 4'b0;
// MAQ N2 doesn't support 	    dram_Ch1_l2b1_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    l2b1_wr_q_full_1 = 1;
    l2b1_wr_q_full_1_arb = 1;
    l2b1_wr_q_cnt_1  = 0;
    l2b1_wr_q_cnt_1_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_wr_q_loc_1  = dram_Ch1_l2b1_wr_q[i];
     l2b1_wr_q_full_1 = l2b1_wr_q_loc_1[40] && l2b1_wr_q_full_1;
     //l2b1_wr_q_full_1_arb = (l2b1_wr_q_loc_1[39] && !dram_Ch1_l2b1_wr_que_rd_ptr_arb[i]) && l2b1_wr_q_full_1_arb;
     l2b1_wr_q_full_1_arb = (l2b1_wr_q_loc_1[39] && l2b1_wr_q_full_1_arb);
     l2b1_wr_q_cnt_1  =  l2b1_wr_q_cnt_1 + l2b1_wr_q_loc_1[40];

// MAQ N2 doesn't support     l2b1_wr_q_cnt_1_arb  =  l2b1_wr_q_cnt_1_arb + (l2b1_wr_q_loc_1[39] && !dram_Ch1_l2b1_wr_que_rd_ptr_arb[i]);

    end
   dram_Ch1_l2b1_wr_q_full     <= l2b1_wr_q_full_1;
   dram_Ch1_l2b1_wr_q_full_arb <= l2b1_wr_q_full_1_arb;
   dram_Ch1_l2b1_wr_q_cnt      <= l2b1_wr_q_cnt_1;
// MAQ N2 doesn't support 	   dram_Ch1_l2b1_wr_q_cnt_arb  <= l2b1_wr_q_cnt_1_arb;
   end
end
reg dram_Ch2_l2b0_wr_q_full;
reg dram_Ch2_l2b0_wr_q_full_arb;
reg [3:0]  dram_Ch2_l2b0_wr_q_cnt;
// MAQ N2 doesn't support 	reg [3:0]  dram_Ch2_l2b0_wr_q_cnt_arb;
reg l2b0_wr_q_full_2;
reg l2b0_wr_q_full_2_arb;
reg [40:0] l2b0_wr_q_loc_2;
reg [3:0]  l2b0_wr_q_cnt_2;
reg [3:0]  l2b0_wr_q_cnt_2_arb;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch2_l2b0_wr_q_full     <= 1'b0;
    dram_Ch2_l2b0_wr_q_full_arb <= 1'b0;
    dram_Ch2_l2b0_wr_q_cnt      <= 4'b0;
// MAQ N2 doesn't support 	    dram_Ch2_l2b0_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    l2b0_wr_q_full_2 = 1;
    l2b0_wr_q_full_2_arb = 1;
    l2b0_wr_q_cnt_2  = 0;
    l2b0_wr_q_cnt_2_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_wr_q_loc_2  = dram_Ch2_l2b0_wr_q[i];
     l2b0_wr_q_full_2 = l2b0_wr_q_loc_2[40] && l2b0_wr_q_full_2;
     //l2b0_wr_q_full_2_arb = (l2b0_wr_q_loc_2[39] && !dram_Ch2_l2b0_wr_que_rd_ptr_arb[i]) && l2b0_wr_q_full_2_arb;
     l2b0_wr_q_full_2_arb = (l2b0_wr_q_loc_2[39] && l2b0_wr_q_full_2_arb);
     l2b0_wr_q_cnt_2  =  l2b0_wr_q_cnt_2 + l2b0_wr_q_loc_2[40];

// MAQ N2 doesn't support     l2b0_wr_q_cnt_2_arb  =  l2b0_wr_q_cnt_2_arb + (l2b0_wr_q_loc_2[39] && !dram_Ch2_l2b0_wr_que_rd_ptr_arb[i]);

    end
   dram_Ch2_l2b0_wr_q_full     <= l2b0_wr_q_full_2;
   dram_Ch2_l2b0_wr_q_full_arb <= l2b0_wr_q_full_2_arb;
   dram_Ch2_l2b0_wr_q_cnt      <= l2b0_wr_q_cnt_2;
// MAQ N2 doesn't support 	   dram_Ch2_l2b0_wr_q_cnt_arb  <= l2b0_wr_q_cnt_2_arb;
   end
end
reg dram_Ch2_l2b1_wr_q_full;
reg dram_Ch2_l2b1_wr_q_full_arb;
reg [3:0]  dram_Ch2_l2b1_wr_q_cnt;
// MAQ N2 doesn't support 	reg [3:0]  dram_Ch2_l2b1_wr_q_cnt_arb;
reg l2b1_wr_q_full_2;
reg l2b1_wr_q_full_2_arb;
reg [40:0] l2b1_wr_q_loc_2;
reg [3:0]  l2b1_wr_q_cnt_2;
reg [3:0]  l2b1_wr_q_cnt_2_arb;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch2_l2b1_wr_q_full     <= 1'b0;
    dram_Ch2_l2b1_wr_q_full_arb <= 1'b0;
    dram_Ch2_l2b1_wr_q_cnt      <= 4'b0;
// MAQ N2 doesn't support 	    dram_Ch2_l2b1_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    l2b1_wr_q_full_2 = 1;
    l2b1_wr_q_full_2_arb = 1;
    l2b1_wr_q_cnt_2  = 0;
    l2b1_wr_q_cnt_2_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_wr_q_loc_2  = dram_Ch2_l2b1_wr_q[i];
     l2b1_wr_q_full_2 = l2b1_wr_q_loc_2[40] && l2b1_wr_q_full_2;
     //l2b1_wr_q_full_2_arb = (l2b1_wr_q_loc_2[39] && !dram_Ch2_l2b1_wr_que_rd_ptr_arb[i]) && l2b1_wr_q_full_2_arb;
     l2b1_wr_q_full_2_arb = (l2b1_wr_q_loc_2[39] && l2b1_wr_q_full_2_arb);
     l2b1_wr_q_cnt_2  =  l2b1_wr_q_cnt_2 + l2b1_wr_q_loc_2[40];

// MAQ N2 doesn't support     l2b1_wr_q_cnt_2_arb  =  l2b1_wr_q_cnt_2_arb + (l2b1_wr_q_loc_2[39] && !dram_Ch2_l2b1_wr_que_rd_ptr_arb[i]);

    end
   dram_Ch2_l2b1_wr_q_full     <= l2b1_wr_q_full_2;
   dram_Ch2_l2b1_wr_q_full_arb <= l2b1_wr_q_full_2_arb;
   dram_Ch2_l2b1_wr_q_cnt      <= l2b1_wr_q_cnt_2;
// MAQ N2 doesn't support 	   dram_Ch2_l2b1_wr_q_cnt_arb  <= l2b1_wr_q_cnt_2_arb;
   end
end
reg dram_Ch3_l2b0_wr_q_full;
reg dram_Ch3_l2b0_wr_q_full_arb;
reg [3:0]  dram_Ch3_l2b0_wr_q_cnt;
// MAQ N2 doesn't support 	reg [3:0]  dram_Ch3_l2b0_wr_q_cnt_arb;
reg l2b0_wr_q_full_3;
reg l2b0_wr_q_full_3_arb;
reg [40:0] l2b0_wr_q_loc_3;
reg [3:0]  l2b0_wr_q_cnt_3;
reg [3:0]  l2b0_wr_q_cnt_3_arb;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch3_l2b0_wr_q_full     <= 1'b0;
    dram_Ch3_l2b0_wr_q_full_arb <= 1'b0;
    dram_Ch3_l2b0_wr_q_cnt      <= 4'b0;
// MAQ N2 doesn't support 	    dram_Ch3_l2b0_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    l2b0_wr_q_full_3 = 1;
    l2b0_wr_q_full_3_arb = 1;
    l2b0_wr_q_cnt_3  = 0;
    l2b0_wr_q_cnt_3_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_wr_q_loc_3  = dram_Ch3_l2b0_wr_q[i];
     l2b0_wr_q_full_3 = l2b0_wr_q_loc_3[40] && l2b0_wr_q_full_3;
     //l2b0_wr_q_full_3_arb = (l2b0_wr_q_loc_3[39] && !dram_Ch3_l2b0_wr_que_rd_ptr_arb[i]) && l2b0_wr_q_full_3_arb;
     l2b0_wr_q_full_3_arb = (l2b0_wr_q_loc_3[39] && l2b0_wr_q_full_3_arb);
     l2b0_wr_q_cnt_3  =  l2b0_wr_q_cnt_3 + l2b0_wr_q_loc_3[40];

// MAQ N2 doesn't support     l2b0_wr_q_cnt_3_arb  =  l2b0_wr_q_cnt_3_arb + (l2b0_wr_q_loc_3[39] && !dram_Ch3_l2b0_wr_que_rd_ptr_arb[i]);

    end
   dram_Ch3_l2b0_wr_q_full     <= l2b0_wr_q_full_3;
   dram_Ch3_l2b0_wr_q_full_arb <= l2b0_wr_q_full_3_arb;
   dram_Ch3_l2b0_wr_q_cnt      <= l2b0_wr_q_cnt_3;
// MAQ N2 doesn't support 	   dram_Ch3_l2b0_wr_q_cnt_arb  <= l2b0_wr_q_cnt_3_arb;
   end
end
reg dram_Ch3_l2b1_wr_q_full;
reg dram_Ch3_l2b1_wr_q_full_arb;
reg [3:0]  dram_Ch3_l2b1_wr_q_cnt;
// MAQ N2 doesn't support 	reg [3:0]  dram_Ch3_l2b1_wr_q_cnt_arb;
reg l2b1_wr_q_full_3;
reg l2b1_wr_q_full_3_arb;
reg [40:0] l2b1_wr_q_loc_3;
reg [3:0]  l2b1_wr_q_cnt_3;
reg [3:0]  l2b1_wr_q_cnt_3_arb;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch3_l2b1_wr_q_full     <= 1'b0;
    dram_Ch3_l2b1_wr_q_full_arb <= 1'b0;
    dram_Ch3_l2b1_wr_q_cnt      <= 4'b0;
// MAQ N2 doesn't support 	    dram_Ch3_l2b1_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    l2b1_wr_q_full_3 = 1;
    l2b1_wr_q_full_3_arb = 1;
    l2b1_wr_q_cnt_3  = 0;
    l2b1_wr_q_cnt_3_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_wr_q_loc_3  = dram_Ch3_l2b1_wr_q[i];
     l2b1_wr_q_full_3 = l2b1_wr_q_loc_3[40] && l2b1_wr_q_full_3;
     //l2b1_wr_q_full_3_arb = (l2b1_wr_q_loc_3[39] && !dram_Ch3_l2b1_wr_que_rd_ptr_arb[i]) && l2b1_wr_q_full_3_arb;
     l2b1_wr_q_full_3_arb = (l2b1_wr_q_loc_3[39] && l2b1_wr_q_full_3_arb);
     l2b1_wr_q_cnt_3  =  l2b1_wr_q_cnt_3 + l2b1_wr_q_loc_3[40];

// MAQ N2 doesn't support     l2b1_wr_q_cnt_3_arb  =  l2b1_wr_q_cnt_3_arb + (l2b1_wr_q_loc_3[39] && !dram_Ch3_l2b1_wr_que_rd_ptr_arb[i]);

    end
   dram_Ch3_l2b1_wr_q_full     <= l2b1_wr_q_full_3;
   dram_Ch3_l2b1_wr_q_full_arb <= l2b1_wr_q_full_3_arb;
   dram_Ch3_l2b1_wr_q_cnt      <= l2b1_wr_q_cnt_3;
// MAQ N2 doesn't support 	   dram_Ch3_l2b1_wr_q_cnt_arb  <= l2b1_wr_q_cnt_3_arb;
   end
end

// ----- DETECTING WR Q EMPTY   -----

reg dram_Ch0_l2b0_wr_q_empty;
reg dram_Ch0_l2b0_wr_q_empty_arb;
reg l2b0_wr_q_empty_0;
reg l2b0_wr_q_empty_0_arb;
reg [40:0] l2b0_wr_q_loc1_0;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b0_wr_q_empty <= 1'b0;
   dram_Ch0_l2b0_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    l2b0_wr_q_empty_0 = 0;
    l2b0_wr_q_empty_0_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_wr_q_loc1_0  = dram_Ch0_l2b0_wr_q[i];
     l2b0_wr_q_empty_0 = l2b0_wr_q_loc1_0[40] || l2b0_wr_q_empty_0;
     l2b0_wr_q_empty_0_arb = l2b0_wr_q_loc1_0[39] || l2b0_wr_q_empty_0_arb;
    end
   dram_Ch0_l2b0_wr_q_empty <= ~l2b0_wr_q_empty_0;
   dram_Ch0_l2b0_wr_q_empty_arb <= ~l2b0_wr_q_empty_0_arb;

  end
end
reg dram_Ch0_l2b1_wr_q_empty;
reg dram_Ch0_l2b1_wr_q_empty_arb;
reg l2b1_wr_q_empty_0;
reg l2b1_wr_q_empty_0_arb;
reg [40:0] l2b1_wr_q_loc1_0;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b1_wr_q_empty <= 1'b0;
   dram_Ch0_l2b1_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    l2b1_wr_q_empty_0 = 0;
    l2b1_wr_q_empty_0_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_wr_q_loc1_0  = dram_Ch0_l2b1_wr_q[i];
     l2b1_wr_q_empty_0 = l2b1_wr_q_loc1_0[40] || l2b1_wr_q_empty_0;
     l2b1_wr_q_empty_0_arb = l2b1_wr_q_loc1_0[39] || l2b1_wr_q_empty_0_arb;
    end
   dram_Ch0_l2b1_wr_q_empty <= ~l2b1_wr_q_empty_0;
   dram_Ch0_l2b1_wr_q_empty_arb <= ~l2b1_wr_q_empty_0_arb;

  end
end
reg dram_Ch1_l2b0_wr_q_empty;
reg dram_Ch1_l2b0_wr_q_empty_arb;
reg l2b0_wr_q_empty_1;
reg l2b0_wr_q_empty_1_arb;
reg [40:0] l2b0_wr_q_loc1_1;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b0_wr_q_empty <= 1'b0;
   dram_Ch1_l2b0_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    l2b0_wr_q_empty_1 = 0;
    l2b0_wr_q_empty_1_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_wr_q_loc1_1  = dram_Ch1_l2b0_wr_q[i];
     l2b0_wr_q_empty_1 = l2b0_wr_q_loc1_1[40] || l2b0_wr_q_empty_1;
     l2b0_wr_q_empty_1_arb = l2b0_wr_q_loc1_1[39] || l2b0_wr_q_empty_1_arb;
    end
   dram_Ch1_l2b0_wr_q_empty <= ~l2b0_wr_q_empty_1;
   dram_Ch1_l2b0_wr_q_empty_arb <= ~l2b0_wr_q_empty_1_arb;

  end
end
reg dram_Ch1_l2b1_wr_q_empty;
reg dram_Ch1_l2b1_wr_q_empty_arb;
reg l2b1_wr_q_empty_1;
reg l2b1_wr_q_empty_1_arb;
reg [40:0] l2b1_wr_q_loc1_1;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b1_wr_q_empty <= 1'b0;
   dram_Ch1_l2b1_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    l2b1_wr_q_empty_1 = 0;
    l2b1_wr_q_empty_1_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_wr_q_loc1_1  = dram_Ch1_l2b1_wr_q[i];
     l2b1_wr_q_empty_1 = l2b1_wr_q_loc1_1[40] || l2b1_wr_q_empty_1;
     l2b1_wr_q_empty_1_arb = l2b1_wr_q_loc1_1[39] || l2b1_wr_q_empty_1_arb;
    end
   dram_Ch1_l2b1_wr_q_empty <= ~l2b1_wr_q_empty_1;
   dram_Ch1_l2b1_wr_q_empty_arb <= ~l2b1_wr_q_empty_1_arb;

  end
end
reg dram_Ch2_l2b0_wr_q_empty;
reg dram_Ch2_l2b0_wr_q_empty_arb;
reg l2b0_wr_q_empty_2;
reg l2b0_wr_q_empty_2_arb;
reg [40:0] l2b0_wr_q_loc1_2;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b0_wr_q_empty <= 1'b0;
   dram_Ch2_l2b0_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    l2b0_wr_q_empty_2 = 0;
    l2b0_wr_q_empty_2_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_wr_q_loc1_2  = dram_Ch2_l2b0_wr_q[i];
     l2b0_wr_q_empty_2 = l2b0_wr_q_loc1_2[40] || l2b0_wr_q_empty_2;
     l2b0_wr_q_empty_2_arb = l2b0_wr_q_loc1_2[39] || l2b0_wr_q_empty_2_arb;
    end
   dram_Ch2_l2b0_wr_q_empty <= ~l2b0_wr_q_empty_2;
   dram_Ch2_l2b0_wr_q_empty_arb <= ~l2b0_wr_q_empty_2_arb;

  end
end
reg dram_Ch2_l2b1_wr_q_empty;
reg dram_Ch2_l2b1_wr_q_empty_arb;
reg l2b1_wr_q_empty_2;
reg l2b1_wr_q_empty_2_arb;
reg [40:0] l2b1_wr_q_loc1_2;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b1_wr_q_empty <= 1'b0;
   dram_Ch2_l2b1_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    l2b1_wr_q_empty_2 = 0;
    l2b1_wr_q_empty_2_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_wr_q_loc1_2  = dram_Ch2_l2b1_wr_q[i];
     l2b1_wr_q_empty_2 = l2b1_wr_q_loc1_2[40] || l2b1_wr_q_empty_2;
     l2b1_wr_q_empty_2_arb = l2b1_wr_q_loc1_2[39] || l2b1_wr_q_empty_2_arb;
    end
   dram_Ch2_l2b1_wr_q_empty <= ~l2b1_wr_q_empty_2;
   dram_Ch2_l2b1_wr_q_empty_arb <= ~l2b1_wr_q_empty_2_arb;

  end
end
reg dram_Ch3_l2b0_wr_q_empty;
reg dram_Ch3_l2b0_wr_q_empty_arb;
reg l2b0_wr_q_empty_3;
reg l2b0_wr_q_empty_3_arb;
reg [40:0] l2b0_wr_q_loc1_3;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b0_wr_q_empty <= 1'b0;
   dram_Ch3_l2b0_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    l2b0_wr_q_empty_3 = 0;
    l2b0_wr_q_empty_3_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b0_wr_q_loc1_3  = dram_Ch3_l2b0_wr_q[i];
     l2b0_wr_q_empty_3 = l2b0_wr_q_loc1_3[40] || l2b0_wr_q_empty_3;
     l2b0_wr_q_empty_3_arb = l2b0_wr_q_loc1_3[39] || l2b0_wr_q_empty_3_arb;
    end
   dram_Ch3_l2b0_wr_q_empty <= ~l2b0_wr_q_empty_3;
   dram_Ch3_l2b0_wr_q_empty_arb <= ~l2b0_wr_q_empty_3_arb;

  end
end
reg dram_Ch3_l2b1_wr_q_empty;
reg dram_Ch3_l2b1_wr_q_empty_arb;
reg l2b1_wr_q_empty_3;
reg l2b1_wr_q_empty_3_arb;
reg [40:0] l2b1_wr_q_loc1_3;
always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b1_wr_q_empty <= 1'b0;
   dram_Ch3_l2b1_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    l2b1_wr_q_empty_3 = 0;
    l2b1_wr_q_empty_3_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     l2b1_wr_q_loc1_3  = dram_Ch3_l2b1_wr_q[i];
     l2b1_wr_q_empty_3 = l2b1_wr_q_loc1_3[40] || l2b1_wr_q_empty_3;
     l2b1_wr_q_empty_3_arb = l2b1_wr_q_loc1_3[39] || l2b1_wr_q_empty_3_arb;
    end
   dram_Ch3_l2b1_wr_q_empty <= ~l2b1_wr_q_empty_3;
   dram_Ch3_l2b1_wr_q_empty_arb <= ~l2b1_wr_q_empty_3_arb;

  end
end

// ----- DETECTING WR COLLAPSING FIFO EMPTY ------

reg dram_Ch0_l2b0_wr_colps_q_empty;
reg colps_l2b0_wr_q_empty_0;
reg [14:0] colps_l2b0_wr_q_loc1_0;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b0_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b0_wr_q_empty_0 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_wr_q_loc1_0  = dram_Ch0_l2b0_wr_colps_q[i];
     colps_l2b0_wr_q_loc1_0[6] = dram_ch0_l2b0_wr_q_valids[i];	
     colps_l2b0_wr_q_empty_0 = colps_l2b0_wr_q_loc1_0[6] || colps_l2b0_wr_q_empty_0;
    end
   dram_Ch0_l2b0_wr_colps_q_empty <= ~colps_l2b0_wr_q_empty_0;
  end
end
reg dram_Ch0_l2b1_wr_colps_q_empty;
reg colps_l2b1_wr_q_empty_0;
reg [14:0] colps_l2b1_wr_q_loc1_0;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_l2b1_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b1_wr_q_empty_0 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_wr_q_loc1_0  = dram_Ch0_l2b1_wr_colps_q[i];
     colps_l2b1_wr_q_loc1_0[6] = dram_ch0_l2b1_wr_q_valids[i];	
     colps_l2b1_wr_q_empty_0 = colps_l2b1_wr_q_loc1_0[6] || colps_l2b1_wr_q_empty_0;
    end
   dram_Ch0_l2b1_wr_colps_q_empty <= ~colps_l2b1_wr_q_empty_0;
  end
end
reg dram_Ch1_l2b0_wr_colps_q_empty;
reg colps_l2b0_wr_q_empty_1;
reg [14:0] colps_l2b0_wr_q_loc1_1;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b0_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b0_wr_q_empty_1 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_wr_q_loc1_1  = dram_Ch1_l2b0_wr_colps_q[i];
     colps_l2b0_wr_q_loc1_1[6] = dram_ch1_l2b0_wr_q_valids[i];	
     colps_l2b0_wr_q_empty_1 = colps_l2b0_wr_q_loc1_1[6] || colps_l2b0_wr_q_empty_1;
    end
   dram_Ch1_l2b0_wr_colps_q_empty <= ~colps_l2b0_wr_q_empty_1;
  end
end
reg dram_Ch1_l2b1_wr_colps_q_empty;
reg colps_l2b1_wr_q_empty_1;
reg [14:0] colps_l2b1_wr_q_loc1_1;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_l2b1_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b1_wr_q_empty_1 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_wr_q_loc1_1  = dram_Ch1_l2b1_wr_colps_q[i];
     colps_l2b1_wr_q_loc1_1[6] = dram_ch1_l2b1_wr_q_valids[i];	
     colps_l2b1_wr_q_empty_1 = colps_l2b1_wr_q_loc1_1[6] || colps_l2b1_wr_q_empty_1;
    end
   dram_Ch1_l2b1_wr_colps_q_empty <= ~colps_l2b1_wr_q_empty_1;
  end
end
reg dram_Ch2_l2b0_wr_colps_q_empty;
reg colps_l2b0_wr_q_empty_2;
reg [14:0] colps_l2b0_wr_q_loc1_2;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b0_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b0_wr_q_empty_2 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_wr_q_loc1_2  = dram_Ch2_l2b0_wr_colps_q[i];
     colps_l2b0_wr_q_loc1_2[6] = dram_ch2_l2b0_wr_q_valids[i];	
     colps_l2b0_wr_q_empty_2 = colps_l2b0_wr_q_loc1_2[6] || colps_l2b0_wr_q_empty_2;
    end
   dram_Ch2_l2b0_wr_colps_q_empty <= ~colps_l2b0_wr_q_empty_2;
  end
end
reg dram_Ch2_l2b1_wr_colps_q_empty;
reg colps_l2b1_wr_q_empty_2;
reg [14:0] colps_l2b1_wr_q_loc1_2;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_l2b1_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b1_wr_q_empty_2 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_wr_q_loc1_2  = dram_Ch2_l2b1_wr_colps_q[i];
     colps_l2b1_wr_q_loc1_2[6] = dram_ch2_l2b1_wr_q_valids[i];	
     colps_l2b1_wr_q_empty_2 = colps_l2b1_wr_q_loc1_2[6] || colps_l2b1_wr_q_empty_2;
    end
   dram_Ch2_l2b1_wr_colps_q_empty <= ~colps_l2b1_wr_q_empty_2;
  end
end
reg dram_Ch3_l2b0_wr_colps_q_empty;
reg colps_l2b0_wr_q_empty_3;
reg [14:0] colps_l2b0_wr_q_loc1_3;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b0_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b0_wr_q_empty_3 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b0_wr_q_loc1_3  = dram_Ch3_l2b0_wr_colps_q[i];
     colps_l2b0_wr_q_loc1_3[6] = dram_ch3_l2b0_wr_q_valids[i];	
     colps_l2b0_wr_q_empty_3 = colps_l2b0_wr_q_loc1_3[6] || colps_l2b0_wr_q_empty_3;
    end
   dram_Ch3_l2b0_wr_colps_q_empty <= ~colps_l2b0_wr_q_empty_3;
  end
end
reg dram_Ch3_l2b1_wr_colps_q_empty;
reg colps_l2b1_wr_q_empty_3;
reg [14:0] colps_l2b1_wr_q_loc1_3;

always @(posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_l2b1_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_l2b1_wr_q_empty_3 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_l2b1_wr_q_loc1_3  = dram_Ch3_l2b1_wr_colps_q[i];
     colps_l2b1_wr_q_loc1_3[6] = dram_ch3_l2b1_wr_q_valids[i];	
     colps_l2b1_wr_q_empty_3 = colps_l2b1_wr_q_loc1_3[6] || colps_l2b1_wr_q_empty_3;
    end
   dram_Ch3_l2b1_wr_colps_q_empty <= ~colps_l2b1_wr_q_empty_3;
  end
end

// ------ CROSS BETWEEN WR Q AND WR COLLAPSING FIFO -------

reg [2:0]  l2b0_wr_index_0;
reg [2:0]  l2b0_wr_curr_index_0;
reg [40:0] l2b0_wr_q_0;
reg [14:0] colps_l2b0_wr_q_loc2_0;

always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch0_l2b0_drq_write_queue_cnt != 4'b0000)		
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_wr_q_loc2_0  = dram_Ch0_l2b0_wr_colps_q[i];
       if (dram_ch0_l2b0_wr_q_valids[i]) begin 	
         l2b0_wr_index_0 = colps_l2b0_wr_q_loc2_0[11:9];
         l2b0_wr_q_0     = dram_Ch0_l2b0_wr_q[l2b0_wr_index_0];
/*mb156858*/          if ((l2b0_wr_q_0[39] == 1'b0) || (l2b0_wr_q_0[40] == 1'b0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 0);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_wr_q_loc2_0  = dram_Ch0_l2b0_wr_colps_q[i];
       if (dram_ch0_l2b0_wr_q_valids[i]) begin 	
       l2b0_wr_curr_index_0 = colps_l2b0_wr_q_loc2_0[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b0_wr_q_loc2_0  = dram_Ch0_l2b0_wr_colps_q[j];

/*mb156858          if (dram_ch0_l2b0_wr_q_valids[j] && ( colps_l2b0_wr_q_loc2_0[11:9] == l2b0_wr_curr_index_0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 0);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b1_wr_index_0;
reg [2:0]  l2b1_wr_curr_index_0;
reg [40:0] l2b1_wr_q_0;
reg [14:0] colps_l2b1_wr_q_loc2_0;

always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch0_l2b1_drq_write_queue_cnt != 4'b0000)		
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_wr_q_loc2_0  = dram_Ch0_l2b1_wr_colps_q[i];
       if (dram_ch0_l2b1_wr_q_valids[i]) begin 	
         l2b1_wr_index_0 = colps_l2b1_wr_q_loc2_0[11:9];
         l2b1_wr_q_0     = dram_Ch0_l2b1_wr_q[l2b1_wr_index_0];
/*mb156858*/          if ((l2b1_wr_q_0[39] == 1'b0) || (l2b1_wr_q_0[40] == 1'b0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 0);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_wr_q_loc2_0  = dram_Ch0_l2b1_wr_colps_q[i];
       if (dram_ch0_l2b1_wr_q_valids[i]) begin 	
       l2b1_wr_curr_index_0 = colps_l2b1_wr_q_loc2_0[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b1_wr_q_loc2_0  = dram_Ch0_l2b1_wr_colps_q[j];

/*mb156858          if (dram_ch0_l2b1_wr_q_valids[j] && ( colps_l2b1_wr_q_loc2_0[11:9] == l2b1_wr_curr_index_0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 0);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b0_wr_index_1;
reg [2:0]  l2b0_wr_curr_index_1;
reg [40:0] l2b0_wr_q_1;
reg [14:0] colps_l2b0_wr_q_loc2_1;

always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch1_l2b0_drq_write_queue_cnt != 4'b0000)		
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_wr_q_loc2_1  = dram_Ch1_l2b0_wr_colps_q[i];
       if (dram_ch1_l2b0_wr_q_valids[i]) begin 	
         l2b0_wr_index_1 = colps_l2b0_wr_q_loc2_1[11:9];
         l2b0_wr_q_1     = dram_Ch1_l2b0_wr_q[l2b0_wr_index_1];
/*mb156858*/          if ((l2b0_wr_q_1[39] == 1'b0) || (l2b0_wr_q_1[40] == 1'b0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 1);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_wr_q_loc2_1  = dram_Ch1_l2b0_wr_colps_q[i];
       if (dram_ch1_l2b0_wr_q_valids[i]) begin 	
       l2b0_wr_curr_index_1 = colps_l2b0_wr_q_loc2_1[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b0_wr_q_loc2_1  = dram_Ch1_l2b0_wr_colps_q[j];

/*mb156858          if (dram_ch1_l2b0_wr_q_valids[j] && ( colps_l2b0_wr_q_loc2_1[11:9] == l2b0_wr_curr_index_1)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 1);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b1_wr_index_1;
reg [2:0]  l2b1_wr_curr_index_1;
reg [40:0] l2b1_wr_q_1;
reg [14:0] colps_l2b1_wr_q_loc2_1;

always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch1_l2b1_drq_write_queue_cnt != 4'b0000)		
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_wr_q_loc2_1  = dram_Ch1_l2b1_wr_colps_q[i];
       if (dram_ch1_l2b1_wr_q_valids[i]) begin 	
         l2b1_wr_index_1 = colps_l2b1_wr_q_loc2_1[11:9];
         l2b1_wr_q_1     = dram_Ch1_l2b1_wr_q[l2b1_wr_index_1];
/*mb156858*/          if ((l2b1_wr_q_1[39] == 1'b0) || (l2b1_wr_q_1[40] == 1'b0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 1);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_wr_q_loc2_1  = dram_Ch1_l2b1_wr_colps_q[i];
       if (dram_ch1_l2b1_wr_q_valids[i]) begin 	
       l2b1_wr_curr_index_1 = colps_l2b1_wr_q_loc2_1[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b1_wr_q_loc2_1  = dram_Ch1_l2b1_wr_colps_q[j];

/*mb156858          if (dram_ch1_l2b1_wr_q_valids[j] && ( colps_l2b1_wr_q_loc2_1[11:9] == l2b1_wr_curr_index_1)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 1);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b0_wr_index_2;
reg [2:0]  l2b0_wr_curr_index_2;
reg [40:0] l2b0_wr_q_2;
reg [14:0] colps_l2b0_wr_q_loc2_2;

always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch2_l2b0_drq_write_queue_cnt != 4'b0000)		
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_wr_q_loc2_2  = dram_Ch2_l2b0_wr_colps_q[i];
       if (dram_ch2_l2b0_wr_q_valids[i]) begin 	
         l2b0_wr_index_2 = colps_l2b0_wr_q_loc2_2[11:9];
         l2b0_wr_q_2     = dram_Ch2_l2b0_wr_q[l2b0_wr_index_2];
/*mb156858*/          if ((l2b0_wr_q_2[39] == 1'b0) || (l2b0_wr_q_2[40] == 1'b0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 2);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_wr_q_loc2_2  = dram_Ch2_l2b0_wr_colps_q[i];
       if (dram_ch2_l2b0_wr_q_valids[i]) begin 	
       l2b0_wr_curr_index_2 = colps_l2b0_wr_q_loc2_2[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b0_wr_q_loc2_2  = dram_Ch2_l2b0_wr_colps_q[j];

/*mb156858          if (dram_ch2_l2b0_wr_q_valids[j] && ( colps_l2b0_wr_q_loc2_2[11:9] == l2b0_wr_curr_index_2)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 2);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b1_wr_index_2;
reg [2:0]  l2b1_wr_curr_index_2;
reg [40:0] l2b1_wr_q_2;
reg [14:0] colps_l2b1_wr_q_loc2_2;

always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch2_l2b1_drq_write_queue_cnt != 4'b0000)		
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_wr_q_loc2_2  = dram_Ch2_l2b1_wr_colps_q[i];
       if (dram_ch2_l2b1_wr_q_valids[i]) begin 	
         l2b1_wr_index_2 = colps_l2b1_wr_q_loc2_2[11:9];
         l2b1_wr_q_2     = dram_Ch2_l2b1_wr_q[l2b1_wr_index_2];
/*mb156858*/          if ((l2b1_wr_q_2[39] == 1'b0) || (l2b1_wr_q_2[40] == 1'b0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 2);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_wr_q_loc2_2  = dram_Ch2_l2b1_wr_colps_q[i];
       if (dram_ch2_l2b1_wr_q_valids[i]) begin 	
       l2b1_wr_curr_index_2 = colps_l2b1_wr_q_loc2_2[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b1_wr_q_loc2_2  = dram_Ch2_l2b1_wr_colps_q[j];

/*mb156858          if (dram_ch2_l2b1_wr_q_valids[j] && ( colps_l2b1_wr_q_loc2_2[11:9] == l2b1_wr_curr_index_2)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 2);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b0_wr_index_3;
reg [2:0]  l2b0_wr_curr_index_3;
reg [40:0] l2b0_wr_q_3;
reg [14:0] colps_l2b0_wr_q_loc2_3;

always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch3_l2b0_drq_write_queue_cnt != 4'b0000)		
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_wr_q_loc2_3  = dram_Ch3_l2b0_wr_colps_q[i];
       if (dram_ch3_l2b0_wr_q_valids[i]) begin 	
         l2b0_wr_index_3 = colps_l2b0_wr_q_loc2_3[11:9];
         l2b0_wr_q_3     = dram_Ch3_l2b0_wr_q[l2b0_wr_index_3];
/*mb156858*/          if ((l2b0_wr_q_3[39] == 1'b0) || (l2b0_wr_q_3[40] == 1'b0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 3);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b0_wr_q_loc2_3  = dram_Ch3_l2b0_wr_colps_q[i];
       if (dram_ch3_l2b0_wr_q_valids[i]) begin 	
       l2b0_wr_curr_index_3 = colps_l2b0_wr_q_loc2_3[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b0_wr_q_loc2_3  = dram_Ch3_l2b0_wr_colps_q[j];

/*mb156858          if (dram_ch3_l2b0_wr_q_valids[j] && ( colps_l2b0_wr_q_loc2_3[11:9] == l2b0_wr_curr_index_3)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 3);
          end */
       end
       end
    end
     
  end
end   
reg [2:0]  l2b1_wr_index_3;
reg [2:0]  l2b1_wr_curr_index_3;
reg [40:0] l2b1_wr_q_3;
reg [14:0] colps_l2b1_wr_q_loc2_3;

always @(posedge (`MCU_CLK && enabled))
begin
  if (~dram_rst_l)
   begin
   end

  else
   if (dram_ch3_l2b1_drq_write_queue_cnt != 4'b0000)		
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_wr_q_loc2_3  = dram_Ch3_l2b1_wr_colps_q[i];
       if (dram_ch3_l2b1_wr_q_valids[i]) begin 	
         l2b1_wr_index_3 = colps_l2b1_wr_q_loc2_3[11:9];
         l2b1_wr_q_3     = dram_Ch3_l2b1_wr_q[l2b1_wr_index_3];
/*mb156858*/          if ((l2b1_wr_q_3[39] == 1'b0) || (l2b1_wr_q_3[40] == 1'b0)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 3);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_l2b1_wr_q_loc2_3  = dram_Ch3_l2b1_wr_colps_q[i];
       if (dram_ch3_l2b1_wr_q_valids[i]) begin 	
       l2b1_wr_curr_index_3 = colps_l2b1_wr_q_loc2_3[11:9];
       for(j=i+1;j<8;j=j+1) begin 
         colps_l2b1_wr_q_loc2_3  = dram_Ch3_l2b1_wr_colps_q[j];

/*mb156858          if (dram_ch3_l2b1_wr_q_valids[j] && ( colps_l2b1_wr_q_loc2_3[11:9] == l2b1_wr_curr_index_3)) begin
            `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 3);
          end */
       end
       end
    end
     
  end
end   

// WR QUE OR ARB REQUEST VALID WITHOUT DATA VALId

 reg [40:0] l2b0_wr_q_loc2_0;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     l2b0_wr_q_loc2_0  = dram_Ch0_l2b0_wr_q[i];
      if (l2b0_wr_q_loc2_0[39] && !l2b0_wr_q_loc2_0[40]) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 0);
      end
    end
end
end
 reg [40:0] l2b1_wr_q_loc2_0;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     l2b1_wr_q_loc2_0  = dram_Ch0_l2b1_wr_q[i];
      if (l2b1_wr_q_loc2_0[39] && !l2b1_wr_q_loc2_0[40]) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 0);
      end
    end
end
end
 reg [40:0] l2b0_wr_q_loc2_1;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     l2b0_wr_q_loc2_1  = dram_Ch1_l2b0_wr_q[i];
      if (l2b0_wr_q_loc2_1[39] && !l2b0_wr_q_loc2_1[40]) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 1);
      end
    end
end
end
 reg [40:0] l2b1_wr_q_loc2_1;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     l2b1_wr_q_loc2_1  = dram_Ch1_l2b1_wr_q[i];
      if (l2b1_wr_q_loc2_1[39] && !l2b1_wr_q_loc2_1[40]) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 1);
      end
    end
end
end
 reg [40:0] l2b0_wr_q_loc2_2;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     l2b0_wr_q_loc2_2  = dram_Ch2_l2b0_wr_q[i];
      if (l2b0_wr_q_loc2_2[39] && !l2b0_wr_q_loc2_2[40]) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 2);
      end
    end
end
end
 reg [40:0] l2b1_wr_q_loc2_2;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     l2b1_wr_q_loc2_2  = dram_Ch2_l2b1_wr_q[i];
      if (l2b1_wr_q_loc2_2[39] && !l2b1_wr_q_loc2_2[40]) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 2);
      end
    end
end
end
 reg [40:0] l2b0_wr_q_loc2_3;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     l2b0_wr_q_loc2_3  = dram_Ch3_l2b0_wr_q[i];
      if (l2b0_wr_q_loc2_3[39] && !l2b0_wr_q_loc2_3[40]) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 3);
      end
    end
end
end
 reg [40:0] l2b1_wr_q_loc2_3;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     l2b1_wr_q_loc2_3  = dram_Ch3_l2b1_wr_q[i];
      if (l2b1_wr_q_loc2_3[39] && !l2b1_wr_q_loc2_3[40]) begin
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 3);
      end
    end
end
end

// actual data valid creation.
reg [7:0] dram_Ch0_l2b0_wr_que_dv_actual;
reg [7:0] dram_Ch0_l2b0_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch0_l2b0_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch0_l2b0_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch0_l2b0_l2if_wr_entry_d1[7:0] <= dram_Ch0_l2b0_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch0_l2b0_wr_que_rd_ptr[i]) begin 
        dram_Ch0_l2b0_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch0_l2b0_l2if_wr_entry[i] == 1) begin 
        dram_Ch0_l2b0_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end
reg [7:0] dram_Ch0_l2b1_wr_que_dv_actual;
reg [7:0] dram_Ch0_l2b1_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch0_l2b1_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch0_l2b1_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch0_l2b1_l2if_wr_entry_d1[7:0] <= dram_Ch0_l2b1_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch0_l2b1_wr_que_rd_ptr[i]) begin 
        dram_Ch0_l2b1_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch0_l2b1_l2if_wr_entry[i] == 1) begin 
        dram_Ch0_l2b1_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end
reg [7:0] dram_Ch1_l2b0_wr_que_dv_actual;
reg [7:0] dram_Ch1_l2b0_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch1_l2b0_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch1_l2b0_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch1_l2b0_l2if_wr_entry_d1[7:0] <= dram_Ch1_l2b0_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch1_l2b0_wr_que_rd_ptr[i]) begin 
        dram_Ch1_l2b0_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch1_l2b0_l2if_wr_entry[i] == 1) begin 
        dram_Ch1_l2b0_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end
reg [7:0] dram_Ch1_l2b1_wr_que_dv_actual;
reg [7:0] dram_Ch1_l2b1_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch1_l2b1_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch1_l2b1_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch1_l2b1_l2if_wr_entry_d1[7:0] <= dram_Ch1_l2b1_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch1_l2b1_wr_que_rd_ptr[i]) begin 
        dram_Ch1_l2b1_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch1_l2b1_l2if_wr_entry[i] == 1) begin 
        dram_Ch1_l2b1_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end
reg [7:0] dram_Ch2_l2b0_wr_que_dv_actual;
reg [7:0] dram_Ch2_l2b0_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch2_l2b0_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch2_l2b0_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch2_l2b0_l2if_wr_entry_d1[7:0] <= dram_Ch2_l2b0_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch2_l2b0_wr_que_rd_ptr[i]) begin 
        dram_Ch2_l2b0_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch2_l2b0_l2if_wr_entry[i] == 1) begin 
        dram_Ch2_l2b0_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end
reg [7:0] dram_Ch2_l2b1_wr_que_dv_actual;
reg [7:0] dram_Ch2_l2b1_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch2_l2b1_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch2_l2b1_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch2_l2b1_l2if_wr_entry_d1[7:0] <= dram_Ch2_l2b1_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch2_l2b1_wr_que_rd_ptr[i]) begin 
        dram_Ch2_l2b1_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch2_l2b1_l2if_wr_entry[i] == 1) begin 
        dram_Ch2_l2b1_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end
reg [7:0] dram_Ch3_l2b0_wr_que_dv_actual;
reg [7:0] dram_Ch3_l2b0_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch3_l2b0_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch3_l2b0_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch3_l2b0_l2if_wr_entry_d1[7:0] <= dram_Ch3_l2b0_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch3_l2b0_wr_que_rd_ptr[i]) begin 
        dram_Ch3_l2b0_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch3_l2b0_l2if_wr_entry[i] == 1) begin 
        dram_Ch3_l2b0_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end
reg [7:0] dram_Ch3_l2b1_wr_que_dv_actual;
reg [7:0] dram_Ch3_l2b1_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch3_l2b1_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch3_l2b1_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch3_l2b1_l2if_wr_entry_d1[7:0] <= dram_Ch3_l2b1_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch3_l2b1_wr_que_rd_ptr[i]) begin 
        dram_Ch3_l2b1_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch3_l2b1_l2if_wr_entry[i] == 1) begin 
        dram_Ch3_l2b1_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end


//  -------- Monitor for making sure that valid data is there in the fifo when write data is read from the DRAM Side. ( Data valid before CAS issued )  ------


wire [63:0] l2b0_dv_0;
reg  [63:0] l2b0_dv_0_reg;

wire [1:0]  wr_en_l2b0_0   = ~dram_Ch0_l2b0_cpu_wr_en;	// MAQ Active High wr_en in N2  wire [3:0]  wr_en_0   = dram_Ch0_cpu_wr_en;
wire [4:0]  l2b0_wr_addr_0 = dram_Ch0_l2b0_cpu_wr_addr;
wire        rd_en_l2b0_0   = ~dram_Ch0_l2b0_wdq_rd_en;
wire [4:0]  rd_addr_l2b0_0 = dram_Ch0_l2b0_wdq_radr[4:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 32 deep	// MAQ 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr

assign l2b0_dv_0[0] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 0) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[0] ) && 
                 ~((rd_addr_l2b0_0 == 0) && !rd_en_l2b0_0);
assign l2b0_dv_0[1] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 0) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[1] ) && 
                 ~((rd_addr_l2b0_0 == 0) && !rd_en_l2b0_0);
assign l2b0_dv_0[2] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 1) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[2] ) && 
                 ~((rd_addr_l2b0_0 == 1) && !rd_en_l2b0_0);
assign l2b0_dv_0[3] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 1) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[3] ) && 
                 ~((rd_addr_l2b0_0 == 1) && !rd_en_l2b0_0);
assign l2b0_dv_0[4] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 2) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[4] ) && 
                 ~((rd_addr_l2b0_0 == 2) && !rd_en_l2b0_0);
assign l2b0_dv_0[5] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 2) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[5] ) && 
                 ~((rd_addr_l2b0_0 == 2) && !rd_en_l2b0_0);
assign l2b0_dv_0[6] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 3) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[6] ) && 
                 ~((rd_addr_l2b0_0 == 3) && !rd_en_l2b0_0);
assign l2b0_dv_0[7] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 3) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[7] ) && 
                 ~((rd_addr_l2b0_0 == 3) && !rd_en_l2b0_0);
assign l2b0_dv_0[8] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 4) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[8] ) && 
                 ~((rd_addr_l2b0_0 == 4) && !rd_en_l2b0_0);
assign l2b0_dv_0[9] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 4) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[9] ) && 
                 ~((rd_addr_l2b0_0 == 4) && !rd_en_l2b0_0);
assign l2b0_dv_0[10] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 5) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[10] ) && 
                 ~((rd_addr_l2b0_0 == 5) && !rd_en_l2b0_0);
assign l2b0_dv_0[11] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 5) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[11] ) && 
                 ~((rd_addr_l2b0_0 == 5) && !rd_en_l2b0_0);
assign l2b0_dv_0[12] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 6) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[12] ) && 
                 ~((rd_addr_l2b0_0 == 6) && !rd_en_l2b0_0);
assign l2b0_dv_0[13] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 6) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[13] ) && 
                 ~((rd_addr_l2b0_0 == 6) && !rd_en_l2b0_0);
assign l2b0_dv_0[14] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 7) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[14] ) && 
                 ~((rd_addr_l2b0_0 == 7) && !rd_en_l2b0_0);
assign l2b0_dv_0[15] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 7) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[15] ) && 
                 ~((rd_addr_l2b0_0 == 7) && !rd_en_l2b0_0);
assign l2b0_dv_0[16] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 8) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[16] ) && 
                 ~((rd_addr_l2b0_0 == 8) && !rd_en_l2b0_0);
assign l2b0_dv_0[17] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 8) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[17] ) && 
                 ~((rd_addr_l2b0_0 == 8) && !rd_en_l2b0_0);
assign l2b0_dv_0[18] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 9) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[18] ) && 
                 ~((rd_addr_l2b0_0 == 9) && !rd_en_l2b0_0);
assign l2b0_dv_0[19] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 9) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[19] ) && 
                 ~((rd_addr_l2b0_0 == 9) && !rd_en_l2b0_0);
assign l2b0_dv_0[20] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 10) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[20] ) && 
                 ~((rd_addr_l2b0_0 == 10) && !rd_en_l2b0_0);
assign l2b0_dv_0[21] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 10) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[21] ) && 
                 ~((rd_addr_l2b0_0 == 10) && !rd_en_l2b0_0);
assign l2b0_dv_0[22] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 11) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[22] ) && 
                 ~((rd_addr_l2b0_0 == 11) && !rd_en_l2b0_0);
assign l2b0_dv_0[23] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 11) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[23] ) && 
                 ~((rd_addr_l2b0_0 == 11) && !rd_en_l2b0_0);
assign l2b0_dv_0[24] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 12) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[24] ) && 
                 ~((rd_addr_l2b0_0 == 12) && !rd_en_l2b0_0);
assign l2b0_dv_0[25] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 12) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[25] ) && 
                 ~((rd_addr_l2b0_0 == 12) && !rd_en_l2b0_0);
assign l2b0_dv_0[26] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 13) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[26] ) && 
                 ~((rd_addr_l2b0_0 == 13) && !rd_en_l2b0_0);
assign l2b0_dv_0[27] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 13) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[27] ) && 
                 ~((rd_addr_l2b0_0 == 13) && !rd_en_l2b0_0);
assign l2b0_dv_0[28] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 14) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[28] ) && 
                 ~((rd_addr_l2b0_0 == 14) && !rd_en_l2b0_0);
assign l2b0_dv_0[29] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 14) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[29] ) && 
                 ~((rd_addr_l2b0_0 == 14) && !rd_en_l2b0_0);
assign l2b0_dv_0[30] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 15) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[30] ) && 
                 ~((rd_addr_l2b0_0 == 15) && !rd_en_l2b0_0);
assign l2b0_dv_0[31] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 15) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[31] ) && 
                 ~((rd_addr_l2b0_0 == 15) && !rd_en_l2b0_0);
assign l2b0_dv_0[32] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 16) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[32] ) && 
                 ~((rd_addr_l2b0_0 == 16) && !rd_en_l2b0_0);
assign l2b0_dv_0[33] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 16) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[33] ) && 
                 ~((rd_addr_l2b0_0 == 16) && !rd_en_l2b0_0);
assign l2b0_dv_0[34] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 17) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[34] ) && 
                 ~((rd_addr_l2b0_0 == 17) && !rd_en_l2b0_0);
assign l2b0_dv_0[35] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 17) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[35] ) && 
                 ~((rd_addr_l2b0_0 == 17) && !rd_en_l2b0_0);
assign l2b0_dv_0[36] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 18) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[36] ) && 
                 ~((rd_addr_l2b0_0 == 18) && !rd_en_l2b0_0);
assign l2b0_dv_0[37] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 18) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[37] ) && 
                 ~((rd_addr_l2b0_0 == 18) && !rd_en_l2b0_0);
assign l2b0_dv_0[38] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 19) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[38] ) && 
                 ~((rd_addr_l2b0_0 == 19) && !rd_en_l2b0_0);
assign l2b0_dv_0[39] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 19) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[39] ) && 
                 ~((rd_addr_l2b0_0 == 19) && !rd_en_l2b0_0);
assign l2b0_dv_0[40] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 20) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[40] ) && 
                 ~((rd_addr_l2b0_0 == 20) && !rd_en_l2b0_0);
assign l2b0_dv_0[41] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 20) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[41] ) && 
                 ~((rd_addr_l2b0_0 == 20) && !rd_en_l2b0_0);
assign l2b0_dv_0[42] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 21) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[42] ) && 
                 ~((rd_addr_l2b0_0 == 21) && !rd_en_l2b0_0);
assign l2b0_dv_0[43] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 21) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[43] ) && 
                 ~((rd_addr_l2b0_0 == 21) && !rd_en_l2b0_0);
assign l2b0_dv_0[44] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 22) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[44] ) && 
                 ~((rd_addr_l2b0_0 == 22) && !rd_en_l2b0_0);
assign l2b0_dv_0[45] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 22) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[45] ) && 
                 ~((rd_addr_l2b0_0 == 22) && !rd_en_l2b0_0);
assign l2b0_dv_0[46] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 23) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[46] ) && 
                 ~((rd_addr_l2b0_0 == 23) && !rd_en_l2b0_0);
assign l2b0_dv_0[47] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 23) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[47] ) && 
                 ~((rd_addr_l2b0_0 == 23) && !rd_en_l2b0_0);
assign l2b0_dv_0[48] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 24) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[48] ) && 
                 ~((rd_addr_l2b0_0 == 24) && !rd_en_l2b0_0);
assign l2b0_dv_0[49] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 24) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[49] ) && 
                 ~((rd_addr_l2b0_0 == 24) && !rd_en_l2b0_0);
assign l2b0_dv_0[50] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 25) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[50] ) && 
                 ~((rd_addr_l2b0_0 == 25) && !rd_en_l2b0_0);
assign l2b0_dv_0[51] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 25) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[51] ) && 
                 ~((rd_addr_l2b0_0 == 25) && !rd_en_l2b0_0);
assign l2b0_dv_0[52] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 26) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[52] ) && 
                 ~((rd_addr_l2b0_0 == 26) && !rd_en_l2b0_0);
assign l2b0_dv_0[53] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 26) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[53] ) && 
                 ~((rd_addr_l2b0_0 == 26) && !rd_en_l2b0_0);
assign l2b0_dv_0[54] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 27) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[54] ) && 
                 ~((rd_addr_l2b0_0 == 27) && !rd_en_l2b0_0);
assign l2b0_dv_0[55] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 27) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[55] ) && 
                 ~((rd_addr_l2b0_0 == 27) && !rd_en_l2b0_0);
assign l2b0_dv_0[56] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 28) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[56] ) && 
                 ~((rd_addr_l2b0_0 == 28) && !rd_en_l2b0_0);
assign l2b0_dv_0[57] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 28) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[57] ) && 
                 ~((rd_addr_l2b0_0 == 28) && !rd_en_l2b0_0);
assign l2b0_dv_0[58] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 29) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[58] ) && 
                 ~((rd_addr_l2b0_0 == 29) && !rd_en_l2b0_0);
assign l2b0_dv_0[59] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 29) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[59] ) && 
                 ~((rd_addr_l2b0_0 == 29) && !rd_en_l2b0_0);
assign l2b0_dv_0[60] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 30) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[60] ) && 
                 ~((rd_addr_l2b0_0 == 30) && !rd_en_l2b0_0);
assign l2b0_dv_0[61] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 30) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[61] ) && 
                 ~((rd_addr_l2b0_0 == 30) && !rd_en_l2b0_0);
assign l2b0_dv_0[62] =  ((!wr_en_l2b0_0[0] && (l2b0_wr_addr_0 == 31) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[62] ) && 
                 ~((rd_addr_l2b0_0 == 31) && !rd_en_l2b0_0);
assign l2b0_dv_0[63] =  ((!wr_en_l2b0_0[1] && (l2b0_wr_addr_0 == 31) && !dram_Ch0_l2b0_pa_err) || l2b0_dv_0_reg[63] ) && 
                 ~((rd_addr_l2b0_0 == 31) && !rd_en_l2b0_0);

always @(posedge (cmp_clk && enabled)) begin 
  if (~cmp_rst_l)
   begin
         l2b0_dv_0_reg <= 64'b0; 
   end
  else begin
         l2b0_dv_0_reg <= l2b0_dv_0;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  dram_rst_l_l2b0_0_1;
reg  [5:0] addr_reg_l2b0_0;
always @ (posedge (cmp_clk && enabled))
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
dram_rst_l_l2b0_0_1 <= #1 dram_rst_l;
addr_reg_l2b0_0     <= #1 {rd_en_l2b0_0, rd_addr_l2b0_0};

if (dram_rst_l_l2b0_0_1 && (~rd_en_l2b0_0) && 
   (addr_reg_l2b0_0 != {rd_en_l2b0_0, rd_addr_l2b0_0}) &&
   (rd_addr_l2b0_0[2:0] == 0) ) begin					// MAQ added condition to check only for 1st rd
/*mb156858 if (!l2b0_dv_0_reg[rd_addr_l2b0_0*2 + 0] || !l2b0_dv_0_reg[rd_addr_l2b0_0*2 + 1] || 
     !l2b0_dv_0_reg[rd_addr_l2b0_0*2 + 2] || !l2b0_dv_0_reg[rd_addr_l2b0_0*2 + 3] ||
     !l2b0_dv_0_reg[rd_addr_l2b0_0*2 + 4] || !l2b0_dv_0_reg[rd_addr_l2b0_0*2 + 5] ||
     !l2b0_dv_0_reg[rd_addr_l2b0_0*2 + 6] || !l2b0_dv_0_reg[rd_addr_l2b0_0*2 + 7]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_l2b0_0, l2b0_dv_0_reg);
     finish_test(" CAS Issued Data not valid ", 0);
  end */ 
end  
end  
end  


// ---- IF WRITE AND THE LOCATIONS DV ALREADY VALID -----

always @ (posedge (cmp_clk && enabled))
begin 
if (cmp_rst_l && (~wr_en_l2b0_0[0])) begin
 if (l2b0_dv_0_reg[l2b0_wr_addr_0*2 + 0]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b0_wr_addr_0,wr_en_l2b0_0, l2b0_dv_0_reg);
     finish_test(" Data Overwritten in write fifo ", 0);
  end  
end  
if (cmp_rst_l && (~wr_en_l2b0_0[1])) begin
 if (l2b0_dv_0_reg[l2b0_wr_addr_0*2 + 1]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b0_wr_addr_0,wr_en_l2b0_0, l2b0_dv_0_reg);
     finish_test(" Data Overwritten in write fifo ", 0);
  end  
end  
end  


wire [63:0] l2b1_dv_0;
reg  [63:0] l2b1_dv_0_reg;

wire [1:0]  wr_en_l2b1_0   = ~dram_Ch0_l2b1_cpu_wr_en;	// MAQ Active High wr_en in N2  wire [3:0]  wr_en_0   = dram_Ch0_cpu_wr_en;
wire [4:0]  l2b1_wr_addr_0 = dram_Ch0_l2b1_cpu_wr_addr;
wire        rd_en_l2b1_0   = ~dram_Ch0_l2b1_wdq_rd_en;
wire [4:0]  rd_addr_l2b1_0 = dram_Ch0_l2b1_wdq_radr[4:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 32 deep	// MAQ 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr

assign l2b1_dv_0[0] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 0) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[0] ) && 
                 ~((rd_addr_l2b1_0 == 0) && !rd_en_l2b1_0);
assign l2b1_dv_0[1] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 0) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[1] ) && 
                 ~((rd_addr_l2b1_0 == 0) && !rd_en_l2b1_0);
assign l2b1_dv_0[2] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 1) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[2] ) && 
                 ~((rd_addr_l2b1_0 == 1) && !rd_en_l2b1_0);
assign l2b1_dv_0[3] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 1) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[3] ) && 
                 ~((rd_addr_l2b1_0 == 1) && !rd_en_l2b1_0);
assign l2b1_dv_0[4] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 2) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[4] ) && 
                 ~((rd_addr_l2b1_0 == 2) && !rd_en_l2b1_0);
assign l2b1_dv_0[5] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 2) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[5] ) && 
                 ~((rd_addr_l2b1_0 == 2) && !rd_en_l2b1_0);
assign l2b1_dv_0[6] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 3) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[6] ) && 
                 ~((rd_addr_l2b1_0 == 3) && !rd_en_l2b1_0);
assign l2b1_dv_0[7] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 3) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[7] ) && 
                 ~((rd_addr_l2b1_0 == 3) && !rd_en_l2b1_0);
assign l2b1_dv_0[8] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 4) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[8] ) && 
                 ~((rd_addr_l2b1_0 == 4) && !rd_en_l2b1_0);
assign l2b1_dv_0[9] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 4) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[9] ) && 
                 ~((rd_addr_l2b1_0 == 4) && !rd_en_l2b1_0);
assign l2b1_dv_0[10] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 5) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[10] ) && 
                 ~((rd_addr_l2b1_0 == 5) && !rd_en_l2b1_0);
assign l2b1_dv_0[11] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 5) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[11] ) && 
                 ~((rd_addr_l2b1_0 == 5) && !rd_en_l2b1_0);
assign l2b1_dv_0[12] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 6) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[12] ) && 
                 ~((rd_addr_l2b1_0 == 6) && !rd_en_l2b1_0);
assign l2b1_dv_0[13] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 6) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[13] ) && 
                 ~((rd_addr_l2b1_0 == 6) && !rd_en_l2b1_0);
assign l2b1_dv_0[14] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 7) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[14] ) && 
                 ~((rd_addr_l2b1_0 == 7) && !rd_en_l2b1_0);
assign l2b1_dv_0[15] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 7) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[15] ) && 
                 ~((rd_addr_l2b1_0 == 7) && !rd_en_l2b1_0);
assign l2b1_dv_0[16] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 8) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[16] ) && 
                 ~((rd_addr_l2b1_0 == 8) && !rd_en_l2b1_0);
assign l2b1_dv_0[17] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 8) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[17] ) && 
                 ~((rd_addr_l2b1_0 == 8) && !rd_en_l2b1_0);
assign l2b1_dv_0[18] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 9) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[18] ) && 
                 ~((rd_addr_l2b1_0 == 9) && !rd_en_l2b1_0);
assign l2b1_dv_0[19] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 9) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[19] ) && 
                 ~((rd_addr_l2b1_0 == 9) && !rd_en_l2b1_0);
assign l2b1_dv_0[20] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 10) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[20] ) && 
                 ~((rd_addr_l2b1_0 == 10) && !rd_en_l2b1_0);
assign l2b1_dv_0[21] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 10) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[21] ) && 
                 ~((rd_addr_l2b1_0 == 10) && !rd_en_l2b1_0);
assign l2b1_dv_0[22] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 11) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[22] ) && 
                 ~((rd_addr_l2b1_0 == 11) && !rd_en_l2b1_0);
assign l2b1_dv_0[23] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 11) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[23] ) && 
                 ~((rd_addr_l2b1_0 == 11) && !rd_en_l2b1_0);
assign l2b1_dv_0[24] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 12) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[24] ) && 
                 ~((rd_addr_l2b1_0 == 12) && !rd_en_l2b1_0);
assign l2b1_dv_0[25] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 12) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[25] ) && 
                 ~((rd_addr_l2b1_0 == 12) && !rd_en_l2b1_0);
assign l2b1_dv_0[26] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 13) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[26] ) && 
                 ~((rd_addr_l2b1_0 == 13) && !rd_en_l2b1_0);
assign l2b1_dv_0[27] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 13) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[27] ) && 
                 ~((rd_addr_l2b1_0 == 13) && !rd_en_l2b1_0);
assign l2b1_dv_0[28] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 14) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[28] ) && 
                 ~((rd_addr_l2b1_0 == 14) && !rd_en_l2b1_0);
assign l2b1_dv_0[29] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 14) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[29] ) && 
                 ~((rd_addr_l2b1_0 == 14) && !rd_en_l2b1_0);
assign l2b1_dv_0[30] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 15) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[30] ) && 
                 ~((rd_addr_l2b1_0 == 15) && !rd_en_l2b1_0);
assign l2b1_dv_0[31] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 15) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[31] ) && 
                 ~((rd_addr_l2b1_0 == 15) && !rd_en_l2b1_0);
assign l2b1_dv_0[32] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 16) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[32] ) && 
                 ~((rd_addr_l2b1_0 == 16) && !rd_en_l2b1_0);
assign l2b1_dv_0[33] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 16) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[33] ) && 
                 ~((rd_addr_l2b1_0 == 16) && !rd_en_l2b1_0);
assign l2b1_dv_0[34] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 17) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[34] ) && 
                 ~((rd_addr_l2b1_0 == 17) && !rd_en_l2b1_0);
assign l2b1_dv_0[35] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 17) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[35] ) && 
                 ~((rd_addr_l2b1_0 == 17) && !rd_en_l2b1_0);
assign l2b1_dv_0[36] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 18) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[36] ) && 
                 ~((rd_addr_l2b1_0 == 18) && !rd_en_l2b1_0);
assign l2b1_dv_0[37] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 18) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[37] ) && 
                 ~((rd_addr_l2b1_0 == 18) && !rd_en_l2b1_0);
assign l2b1_dv_0[38] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 19) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[38] ) && 
                 ~((rd_addr_l2b1_0 == 19) && !rd_en_l2b1_0);
assign l2b1_dv_0[39] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 19) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[39] ) && 
                 ~((rd_addr_l2b1_0 == 19) && !rd_en_l2b1_0);
assign l2b1_dv_0[40] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 20) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[40] ) && 
                 ~((rd_addr_l2b1_0 == 20) && !rd_en_l2b1_0);
assign l2b1_dv_0[41] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 20) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[41] ) && 
                 ~((rd_addr_l2b1_0 == 20) && !rd_en_l2b1_0);
assign l2b1_dv_0[42] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 21) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[42] ) && 
                 ~((rd_addr_l2b1_0 == 21) && !rd_en_l2b1_0);
assign l2b1_dv_0[43] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 21) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[43] ) && 
                 ~((rd_addr_l2b1_0 == 21) && !rd_en_l2b1_0);
assign l2b1_dv_0[44] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 22) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[44] ) && 
                 ~((rd_addr_l2b1_0 == 22) && !rd_en_l2b1_0);
assign l2b1_dv_0[45] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 22) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[45] ) && 
                 ~((rd_addr_l2b1_0 == 22) && !rd_en_l2b1_0);
assign l2b1_dv_0[46] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 23) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[46] ) && 
                 ~((rd_addr_l2b1_0 == 23) && !rd_en_l2b1_0);
assign l2b1_dv_0[47] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 23) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[47] ) && 
                 ~((rd_addr_l2b1_0 == 23) && !rd_en_l2b1_0);
assign l2b1_dv_0[48] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 24) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[48] ) && 
                 ~((rd_addr_l2b1_0 == 24) && !rd_en_l2b1_0);
assign l2b1_dv_0[49] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 24) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[49] ) && 
                 ~((rd_addr_l2b1_0 == 24) && !rd_en_l2b1_0);
assign l2b1_dv_0[50] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 25) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[50] ) && 
                 ~((rd_addr_l2b1_0 == 25) && !rd_en_l2b1_0);
assign l2b1_dv_0[51] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 25) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[51] ) && 
                 ~((rd_addr_l2b1_0 == 25) && !rd_en_l2b1_0);
assign l2b1_dv_0[52] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 26) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[52] ) && 
                 ~((rd_addr_l2b1_0 == 26) && !rd_en_l2b1_0);
assign l2b1_dv_0[53] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 26) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[53] ) && 
                 ~((rd_addr_l2b1_0 == 26) && !rd_en_l2b1_0);
assign l2b1_dv_0[54] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 27) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[54] ) && 
                 ~((rd_addr_l2b1_0 == 27) && !rd_en_l2b1_0);
assign l2b1_dv_0[55] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 27) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[55] ) && 
                 ~((rd_addr_l2b1_0 == 27) && !rd_en_l2b1_0);
assign l2b1_dv_0[56] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 28) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[56] ) && 
                 ~((rd_addr_l2b1_0 == 28) && !rd_en_l2b1_0);
assign l2b1_dv_0[57] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 28) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[57] ) && 
                 ~((rd_addr_l2b1_0 == 28) && !rd_en_l2b1_0);
assign l2b1_dv_0[58] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 29) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[58] ) && 
                 ~((rd_addr_l2b1_0 == 29) && !rd_en_l2b1_0);
assign l2b1_dv_0[59] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 29) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[59] ) && 
                 ~((rd_addr_l2b1_0 == 29) && !rd_en_l2b1_0);
assign l2b1_dv_0[60] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 30) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[60] ) && 
                 ~((rd_addr_l2b1_0 == 30) && !rd_en_l2b1_0);
assign l2b1_dv_0[61] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 30) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[61] ) && 
                 ~((rd_addr_l2b1_0 == 30) && !rd_en_l2b1_0);
assign l2b1_dv_0[62] =  ((!wr_en_l2b1_0[0] && (l2b1_wr_addr_0 == 31) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[62] ) && 
                 ~((rd_addr_l2b1_0 == 31) && !rd_en_l2b1_0);
assign l2b1_dv_0[63] =  ((!wr_en_l2b1_0[1] && (l2b1_wr_addr_0 == 31) && !dram_Ch0_l2b1_pa_err) || l2b1_dv_0_reg[63] ) && 
                 ~((rd_addr_l2b1_0 == 31) && !rd_en_l2b1_0);

always @(posedge (cmp_clk && enabled)) begin 
  if (~cmp_rst_l)
   begin
         l2b1_dv_0_reg <= 64'b0; 
   end
  else begin
         l2b1_dv_0_reg <= l2b1_dv_0;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  dram_rst_l_l2b1_0_1;
reg  [5:0] addr_reg_l2b1_0;
always @ (posedge (cmp_clk && enabled))
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
dram_rst_l_l2b1_0_1 <= #1 dram_rst_l;
addr_reg_l2b1_0     <= #1 {rd_en_l2b1_0, rd_addr_l2b1_0};

if (dram_rst_l_l2b1_0_1 && (~rd_en_l2b1_0) && 
   (addr_reg_l2b1_0 != {rd_en_l2b1_0, rd_addr_l2b1_0}) &&
   (rd_addr_l2b1_0[2:0] == 0) ) begin					// MAQ added condition to check only for 1st rd
/*mb156858 if (!l2b1_dv_0_reg[rd_addr_l2b1_0*2 + 0] || !l2b1_dv_0_reg[rd_addr_l2b1_0*2 + 1] || 
     !l2b1_dv_0_reg[rd_addr_l2b1_0*2 + 2] || !l2b1_dv_0_reg[rd_addr_l2b1_0*2 + 3] ||
     !l2b1_dv_0_reg[rd_addr_l2b1_0*2 + 4] || !l2b1_dv_0_reg[rd_addr_l2b1_0*2 + 5] ||
     !l2b1_dv_0_reg[rd_addr_l2b1_0*2 + 6] || !l2b1_dv_0_reg[rd_addr_l2b1_0*2 + 7]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_l2b1_0, l2b1_dv_0_reg);
     finish_test(" CAS Issued Data not valid ", 0);
  end */ 
end  
end  
end  


// ---- IF WRITE AND THE LOCATIONS DV ALREADY VALID -----

always @ (posedge (cmp_clk && enabled))
begin 
if (cmp_rst_l && (~wr_en_l2b1_0[0])) begin
 if (l2b1_dv_0_reg[l2b1_wr_addr_0*2 + 0]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b1_wr_addr_0,wr_en_l2b1_0, l2b1_dv_0_reg);
     finish_test(" Data Overwritten in write fifo ", 0);
  end  
end  
if (cmp_rst_l && (~wr_en_l2b1_0[1])) begin
 if (l2b1_dv_0_reg[l2b1_wr_addr_0*2 + 1]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b1_wr_addr_0,wr_en_l2b1_0, l2b1_dv_0_reg);
     finish_test(" Data Overwritten in write fifo ", 0);
  end  
end  
end  


wire [63:0] l2b0_dv_1;
reg  [63:0] l2b0_dv_1_reg;

wire [1:0]  wr_en_l2b0_1   = ~dram_Ch1_l2b0_cpu_wr_en;	// MAQ Active High wr_en in N2  wire [3:0]  wr_en_1   = dram_Ch1_cpu_wr_en;
wire [4:0]  l2b0_wr_addr_1 = dram_Ch1_l2b0_cpu_wr_addr;
wire        rd_en_l2b0_1   = ~dram_Ch1_l2b0_wdq_rd_en;
wire [4:0]  rd_addr_l2b0_1 = dram_Ch1_l2b0_wdq_radr[4:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 32 deep	// MAQ 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr

assign l2b0_dv_1[0] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 0) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[0] ) && 
                 ~((rd_addr_l2b0_1 == 0) && !rd_en_l2b0_1);
assign l2b0_dv_1[1] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 0) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[1] ) && 
                 ~((rd_addr_l2b0_1 == 0) && !rd_en_l2b0_1);
assign l2b0_dv_1[2] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 1) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[2] ) && 
                 ~((rd_addr_l2b0_1 == 1) && !rd_en_l2b0_1);
assign l2b0_dv_1[3] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 1) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[3] ) && 
                 ~((rd_addr_l2b0_1 == 1) && !rd_en_l2b0_1);
assign l2b0_dv_1[4] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 2) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[4] ) && 
                 ~((rd_addr_l2b0_1 == 2) && !rd_en_l2b0_1);
assign l2b0_dv_1[5] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 2) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[5] ) && 
                 ~((rd_addr_l2b0_1 == 2) && !rd_en_l2b0_1);
assign l2b0_dv_1[6] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 3) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[6] ) && 
                 ~((rd_addr_l2b0_1 == 3) && !rd_en_l2b0_1);
assign l2b0_dv_1[7] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 3) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[7] ) && 
                 ~((rd_addr_l2b0_1 == 3) && !rd_en_l2b0_1);
assign l2b0_dv_1[8] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 4) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[8] ) && 
                 ~((rd_addr_l2b0_1 == 4) && !rd_en_l2b0_1);
assign l2b0_dv_1[9] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 4) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[9] ) && 
                 ~((rd_addr_l2b0_1 == 4) && !rd_en_l2b0_1);
assign l2b0_dv_1[10] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 5) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[10] ) && 
                 ~((rd_addr_l2b0_1 == 5) && !rd_en_l2b0_1);
assign l2b0_dv_1[11] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 5) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[11] ) && 
                 ~((rd_addr_l2b0_1 == 5) && !rd_en_l2b0_1);
assign l2b0_dv_1[12] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 6) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[12] ) && 
                 ~((rd_addr_l2b0_1 == 6) && !rd_en_l2b0_1);
assign l2b0_dv_1[13] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 6) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[13] ) && 
                 ~((rd_addr_l2b0_1 == 6) && !rd_en_l2b0_1);
assign l2b0_dv_1[14] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 7) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[14] ) && 
                 ~((rd_addr_l2b0_1 == 7) && !rd_en_l2b0_1);
assign l2b0_dv_1[15] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 7) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[15] ) && 
                 ~((rd_addr_l2b0_1 == 7) && !rd_en_l2b0_1);
assign l2b0_dv_1[16] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 8) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[16] ) && 
                 ~((rd_addr_l2b0_1 == 8) && !rd_en_l2b0_1);
assign l2b0_dv_1[17] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 8) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[17] ) && 
                 ~((rd_addr_l2b0_1 == 8) && !rd_en_l2b0_1);
assign l2b0_dv_1[18] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 9) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[18] ) && 
                 ~((rd_addr_l2b0_1 == 9) && !rd_en_l2b0_1);
assign l2b0_dv_1[19] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 9) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[19] ) && 
                 ~((rd_addr_l2b0_1 == 9) && !rd_en_l2b0_1);
assign l2b0_dv_1[20] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 10) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[20] ) && 
                 ~((rd_addr_l2b0_1 == 10) && !rd_en_l2b0_1);
assign l2b0_dv_1[21] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 10) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[21] ) && 
                 ~((rd_addr_l2b0_1 == 10) && !rd_en_l2b0_1);
assign l2b0_dv_1[22] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 11) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[22] ) && 
                 ~((rd_addr_l2b0_1 == 11) && !rd_en_l2b0_1);
assign l2b0_dv_1[23] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 11) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[23] ) && 
                 ~((rd_addr_l2b0_1 == 11) && !rd_en_l2b0_1);
assign l2b0_dv_1[24] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 12) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[24] ) && 
                 ~((rd_addr_l2b0_1 == 12) && !rd_en_l2b0_1);
assign l2b0_dv_1[25] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 12) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[25] ) && 
                 ~((rd_addr_l2b0_1 == 12) && !rd_en_l2b0_1);
assign l2b0_dv_1[26] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 13) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[26] ) && 
                 ~((rd_addr_l2b0_1 == 13) && !rd_en_l2b0_1);
assign l2b0_dv_1[27] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 13) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[27] ) && 
                 ~((rd_addr_l2b0_1 == 13) && !rd_en_l2b0_1);
assign l2b0_dv_1[28] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 14) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[28] ) && 
                 ~((rd_addr_l2b0_1 == 14) && !rd_en_l2b0_1);
assign l2b0_dv_1[29] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 14) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[29] ) && 
                 ~((rd_addr_l2b0_1 == 14) && !rd_en_l2b0_1);
assign l2b0_dv_1[30] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 15) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[30] ) && 
                 ~((rd_addr_l2b0_1 == 15) && !rd_en_l2b0_1);
assign l2b0_dv_1[31] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 15) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[31] ) && 
                 ~((rd_addr_l2b0_1 == 15) && !rd_en_l2b0_1);
assign l2b0_dv_1[32] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 16) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[32] ) && 
                 ~((rd_addr_l2b0_1 == 16) && !rd_en_l2b0_1);
assign l2b0_dv_1[33] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 16) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[33] ) && 
                 ~((rd_addr_l2b0_1 == 16) && !rd_en_l2b0_1);
assign l2b0_dv_1[34] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 17) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[34] ) && 
                 ~((rd_addr_l2b0_1 == 17) && !rd_en_l2b0_1);
assign l2b0_dv_1[35] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 17) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[35] ) && 
                 ~((rd_addr_l2b0_1 == 17) && !rd_en_l2b0_1);
assign l2b0_dv_1[36] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 18) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[36] ) && 
                 ~((rd_addr_l2b0_1 == 18) && !rd_en_l2b0_1);
assign l2b0_dv_1[37] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 18) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[37] ) && 
                 ~((rd_addr_l2b0_1 == 18) && !rd_en_l2b0_1);
assign l2b0_dv_1[38] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 19) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[38] ) && 
                 ~((rd_addr_l2b0_1 == 19) && !rd_en_l2b0_1);
assign l2b0_dv_1[39] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 19) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[39] ) && 
                 ~((rd_addr_l2b0_1 == 19) && !rd_en_l2b0_1);
assign l2b0_dv_1[40] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 20) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[40] ) && 
                 ~((rd_addr_l2b0_1 == 20) && !rd_en_l2b0_1);
assign l2b0_dv_1[41] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 20) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[41] ) && 
                 ~((rd_addr_l2b0_1 == 20) && !rd_en_l2b0_1);
assign l2b0_dv_1[42] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 21) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[42] ) && 
                 ~((rd_addr_l2b0_1 == 21) && !rd_en_l2b0_1);
assign l2b0_dv_1[43] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 21) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[43] ) && 
                 ~((rd_addr_l2b0_1 == 21) && !rd_en_l2b0_1);
assign l2b0_dv_1[44] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 22) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[44] ) && 
                 ~((rd_addr_l2b0_1 == 22) && !rd_en_l2b0_1);
assign l2b0_dv_1[45] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 22) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[45] ) && 
                 ~((rd_addr_l2b0_1 == 22) && !rd_en_l2b0_1);
assign l2b0_dv_1[46] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 23) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[46] ) && 
                 ~((rd_addr_l2b0_1 == 23) && !rd_en_l2b0_1);
assign l2b0_dv_1[47] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 23) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[47] ) && 
                 ~((rd_addr_l2b0_1 == 23) && !rd_en_l2b0_1);
assign l2b0_dv_1[48] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 24) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[48] ) && 
                 ~((rd_addr_l2b0_1 == 24) && !rd_en_l2b0_1);
assign l2b0_dv_1[49] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 24) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[49] ) && 
                 ~((rd_addr_l2b0_1 == 24) && !rd_en_l2b0_1);
assign l2b0_dv_1[50] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 25) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[50] ) && 
                 ~((rd_addr_l2b0_1 == 25) && !rd_en_l2b0_1);
assign l2b0_dv_1[51] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 25) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[51] ) && 
                 ~((rd_addr_l2b0_1 == 25) && !rd_en_l2b0_1);
assign l2b0_dv_1[52] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 26) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[52] ) && 
                 ~((rd_addr_l2b0_1 == 26) && !rd_en_l2b0_1);
assign l2b0_dv_1[53] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 26) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[53] ) && 
                 ~((rd_addr_l2b0_1 == 26) && !rd_en_l2b0_1);
assign l2b0_dv_1[54] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 27) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[54] ) && 
                 ~((rd_addr_l2b0_1 == 27) && !rd_en_l2b0_1);
assign l2b0_dv_1[55] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 27) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[55] ) && 
                 ~((rd_addr_l2b0_1 == 27) && !rd_en_l2b0_1);
assign l2b0_dv_1[56] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 28) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[56] ) && 
                 ~((rd_addr_l2b0_1 == 28) && !rd_en_l2b0_1);
assign l2b0_dv_1[57] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 28) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[57] ) && 
                 ~((rd_addr_l2b0_1 == 28) && !rd_en_l2b0_1);
assign l2b0_dv_1[58] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 29) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[58] ) && 
                 ~((rd_addr_l2b0_1 == 29) && !rd_en_l2b0_1);
assign l2b0_dv_1[59] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 29) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[59] ) && 
                 ~((rd_addr_l2b0_1 == 29) && !rd_en_l2b0_1);
assign l2b0_dv_1[60] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 30) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[60] ) && 
                 ~((rd_addr_l2b0_1 == 30) && !rd_en_l2b0_1);
assign l2b0_dv_1[61] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 30) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[61] ) && 
                 ~((rd_addr_l2b0_1 == 30) && !rd_en_l2b0_1);
assign l2b0_dv_1[62] =  ((!wr_en_l2b0_1[0] && (l2b0_wr_addr_1 == 31) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[62] ) && 
                 ~((rd_addr_l2b0_1 == 31) && !rd_en_l2b0_1);
assign l2b0_dv_1[63] =  ((!wr_en_l2b0_1[1] && (l2b0_wr_addr_1 == 31) && !dram_Ch1_l2b0_pa_err) || l2b0_dv_1_reg[63] ) && 
                 ~((rd_addr_l2b0_1 == 31) && !rd_en_l2b0_1);

always @(posedge (cmp_clk && enabled)) begin 
  if (~cmp_rst_l)
   begin
         l2b0_dv_1_reg <= 64'b0; 
   end
  else begin
         l2b0_dv_1_reg <= l2b0_dv_1;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  dram_rst_l_l2b0_1_1;
reg  [5:0] addr_reg_l2b0_1;
always @ (posedge (cmp_clk && enabled))
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
dram_rst_l_l2b0_1_1 <= #1 dram_rst_l;
addr_reg_l2b0_1     <= #1 {rd_en_l2b0_1, rd_addr_l2b0_1};

if (dram_rst_l_l2b0_1_1 && (~rd_en_l2b0_1) && 
   (addr_reg_l2b0_1 != {rd_en_l2b0_1, rd_addr_l2b0_1}) &&
   (rd_addr_l2b0_1[2:0] == 0) ) begin					// MAQ added condition to check only for 1st rd
/*mb156858 if (!l2b0_dv_1_reg[rd_addr_l2b0_1*2 + 0] || !l2b0_dv_1_reg[rd_addr_l2b0_1*2 + 1] || 
     !l2b0_dv_1_reg[rd_addr_l2b0_1*2 + 2] || !l2b0_dv_1_reg[rd_addr_l2b0_1*2 + 3] ||
     !l2b0_dv_1_reg[rd_addr_l2b0_1*2 + 4] || !l2b0_dv_1_reg[rd_addr_l2b0_1*2 + 5] ||
     !l2b0_dv_1_reg[rd_addr_l2b0_1*2 + 6] || !l2b0_dv_1_reg[rd_addr_l2b0_1*2 + 7]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_l2b0_1, l2b0_dv_1_reg);
     finish_test(" CAS Issued Data not valid ", 1);
  end */ 
end  
end  
end  


// ---- IF WRITE AND THE LOCATIONS DV ALREADY VALID -----

always @ (posedge (cmp_clk && enabled))
begin 
if (cmp_rst_l && (~wr_en_l2b0_1[0])) begin
 if (l2b0_dv_1_reg[l2b0_wr_addr_1*2 + 0]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b0_wr_addr_1,wr_en_l2b0_1, l2b0_dv_1_reg);
     finish_test(" Data Overwritten in write fifo ", 1);
  end  
end  
if (cmp_rst_l && (~wr_en_l2b0_1[1])) begin
 if (l2b0_dv_1_reg[l2b0_wr_addr_1*2 + 1]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b0_wr_addr_1,wr_en_l2b0_1, l2b0_dv_1_reg);
     finish_test(" Data Overwritten in write fifo ", 1);
  end  
end  
end  


wire [63:0] l2b1_dv_1;
reg  [63:0] l2b1_dv_1_reg;

wire [1:0]  wr_en_l2b1_1   = ~dram_Ch1_l2b1_cpu_wr_en;	// MAQ Active High wr_en in N2  wire [3:0]  wr_en_1   = dram_Ch1_cpu_wr_en;
wire [4:0]  l2b1_wr_addr_1 = dram_Ch1_l2b1_cpu_wr_addr;
wire        rd_en_l2b1_1   = ~dram_Ch1_l2b1_wdq_rd_en;
wire [4:0]  rd_addr_l2b1_1 = dram_Ch1_l2b1_wdq_radr[4:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 32 deep	// MAQ 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr

assign l2b1_dv_1[0] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 0) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[0] ) && 
                 ~((rd_addr_l2b1_1 == 0) && !rd_en_l2b1_1);
assign l2b1_dv_1[1] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 0) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[1] ) && 
                 ~((rd_addr_l2b1_1 == 0) && !rd_en_l2b1_1);
assign l2b1_dv_1[2] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 1) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[2] ) && 
                 ~((rd_addr_l2b1_1 == 1) && !rd_en_l2b1_1);
assign l2b1_dv_1[3] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 1) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[3] ) && 
                 ~((rd_addr_l2b1_1 == 1) && !rd_en_l2b1_1);
assign l2b1_dv_1[4] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 2) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[4] ) && 
                 ~((rd_addr_l2b1_1 == 2) && !rd_en_l2b1_1);
assign l2b1_dv_1[5] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 2) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[5] ) && 
                 ~((rd_addr_l2b1_1 == 2) && !rd_en_l2b1_1);
assign l2b1_dv_1[6] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 3) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[6] ) && 
                 ~((rd_addr_l2b1_1 == 3) && !rd_en_l2b1_1);
assign l2b1_dv_1[7] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 3) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[7] ) && 
                 ~((rd_addr_l2b1_1 == 3) && !rd_en_l2b1_1);
assign l2b1_dv_1[8] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 4) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[8] ) && 
                 ~((rd_addr_l2b1_1 == 4) && !rd_en_l2b1_1);
assign l2b1_dv_1[9] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 4) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[9] ) && 
                 ~((rd_addr_l2b1_1 == 4) && !rd_en_l2b1_1);
assign l2b1_dv_1[10] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 5) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[10] ) && 
                 ~((rd_addr_l2b1_1 == 5) && !rd_en_l2b1_1);
assign l2b1_dv_1[11] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 5) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[11] ) && 
                 ~((rd_addr_l2b1_1 == 5) && !rd_en_l2b1_1);
assign l2b1_dv_1[12] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 6) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[12] ) && 
                 ~((rd_addr_l2b1_1 == 6) && !rd_en_l2b1_1);
assign l2b1_dv_1[13] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 6) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[13] ) && 
                 ~((rd_addr_l2b1_1 == 6) && !rd_en_l2b1_1);
assign l2b1_dv_1[14] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 7) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[14] ) && 
                 ~((rd_addr_l2b1_1 == 7) && !rd_en_l2b1_1);
assign l2b1_dv_1[15] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 7) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[15] ) && 
                 ~((rd_addr_l2b1_1 == 7) && !rd_en_l2b1_1);
assign l2b1_dv_1[16] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 8) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[16] ) && 
                 ~((rd_addr_l2b1_1 == 8) && !rd_en_l2b1_1);
assign l2b1_dv_1[17] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 8) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[17] ) && 
                 ~((rd_addr_l2b1_1 == 8) && !rd_en_l2b1_1);
assign l2b1_dv_1[18] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 9) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[18] ) && 
                 ~((rd_addr_l2b1_1 == 9) && !rd_en_l2b1_1);
assign l2b1_dv_1[19] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 9) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[19] ) && 
                 ~((rd_addr_l2b1_1 == 9) && !rd_en_l2b1_1);
assign l2b1_dv_1[20] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 10) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[20] ) && 
                 ~((rd_addr_l2b1_1 == 10) && !rd_en_l2b1_1);
assign l2b1_dv_1[21] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 10) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[21] ) && 
                 ~((rd_addr_l2b1_1 == 10) && !rd_en_l2b1_1);
assign l2b1_dv_1[22] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 11) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[22] ) && 
                 ~((rd_addr_l2b1_1 == 11) && !rd_en_l2b1_1);
assign l2b1_dv_1[23] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 11) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[23] ) && 
                 ~((rd_addr_l2b1_1 == 11) && !rd_en_l2b1_1);
assign l2b1_dv_1[24] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 12) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[24] ) && 
                 ~((rd_addr_l2b1_1 == 12) && !rd_en_l2b1_1);
assign l2b1_dv_1[25] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 12) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[25] ) && 
                 ~((rd_addr_l2b1_1 == 12) && !rd_en_l2b1_1);
assign l2b1_dv_1[26] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 13) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[26] ) && 
                 ~((rd_addr_l2b1_1 == 13) && !rd_en_l2b1_1);
assign l2b1_dv_1[27] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 13) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[27] ) && 
                 ~((rd_addr_l2b1_1 == 13) && !rd_en_l2b1_1);
assign l2b1_dv_1[28] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 14) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[28] ) && 
                 ~((rd_addr_l2b1_1 == 14) && !rd_en_l2b1_1);
assign l2b1_dv_1[29] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 14) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[29] ) && 
                 ~((rd_addr_l2b1_1 == 14) && !rd_en_l2b1_1);
assign l2b1_dv_1[30] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 15) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[30] ) && 
                 ~((rd_addr_l2b1_1 == 15) && !rd_en_l2b1_1);
assign l2b1_dv_1[31] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 15) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[31] ) && 
                 ~((rd_addr_l2b1_1 == 15) && !rd_en_l2b1_1);
assign l2b1_dv_1[32] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 16) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[32] ) && 
                 ~((rd_addr_l2b1_1 == 16) && !rd_en_l2b1_1);
assign l2b1_dv_1[33] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 16) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[33] ) && 
                 ~((rd_addr_l2b1_1 == 16) && !rd_en_l2b1_1);
assign l2b1_dv_1[34] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 17) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[34] ) && 
                 ~((rd_addr_l2b1_1 == 17) && !rd_en_l2b1_1);
assign l2b1_dv_1[35] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 17) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[35] ) && 
                 ~((rd_addr_l2b1_1 == 17) && !rd_en_l2b1_1);
assign l2b1_dv_1[36] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 18) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[36] ) && 
                 ~((rd_addr_l2b1_1 == 18) && !rd_en_l2b1_1);
assign l2b1_dv_1[37] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 18) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[37] ) && 
                 ~((rd_addr_l2b1_1 == 18) && !rd_en_l2b1_1);
assign l2b1_dv_1[38] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 19) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[38] ) && 
                 ~((rd_addr_l2b1_1 == 19) && !rd_en_l2b1_1);
assign l2b1_dv_1[39] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 19) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[39] ) && 
                 ~((rd_addr_l2b1_1 == 19) && !rd_en_l2b1_1);
assign l2b1_dv_1[40] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 20) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[40] ) && 
                 ~((rd_addr_l2b1_1 == 20) && !rd_en_l2b1_1);
assign l2b1_dv_1[41] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 20) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[41] ) && 
                 ~((rd_addr_l2b1_1 == 20) && !rd_en_l2b1_1);
assign l2b1_dv_1[42] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 21) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[42] ) && 
                 ~((rd_addr_l2b1_1 == 21) && !rd_en_l2b1_1);
assign l2b1_dv_1[43] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 21) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[43] ) && 
                 ~((rd_addr_l2b1_1 == 21) && !rd_en_l2b1_1);
assign l2b1_dv_1[44] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 22) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[44] ) && 
                 ~((rd_addr_l2b1_1 == 22) && !rd_en_l2b1_1);
assign l2b1_dv_1[45] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 22) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[45] ) && 
                 ~((rd_addr_l2b1_1 == 22) && !rd_en_l2b1_1);
assign l2b1_dv_1[46] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 23) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[46] ) && 
                 ~((rd_addr_l2b1_1 == 23) && !rd_en_l2b1_1);
assign l2b1_dv_1[47] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 23) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[47] ) && 
                 ~((rd_addr_l2b1_1 == 23) && !rd_en_l2b1_1);
assign l2b1_dv_1[48] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 24) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[48] ) && 
                 ~((rd_addr_l2b1_1 == 24) && !rd_en_l2b1_1);
assign l2b1_dv_1[49] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 24) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[49] ) && 
                 ~((rd_addr_l2b1_1 == 24) && !rd_en_l2b1_1);
assign l2b1_dv_1[50] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 25) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[50] ) && 
                 ~((rd_addr_l2b1_1 == 25) && !rd_en_l2b1_1);
assign l2b1_dv_1[51] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 25) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[51] ) && 
                 ~((rd_addr_l2b1_1 == 25) && !rd_en_l2b1_1);
assign l2b1_dv_1[52] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 26) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[52] ) && 
                 ~((rd_addr_l2b1_1 == 26) && !rd_en_l2b1_1);
assign l2b1_dv_1[53] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 26) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[53] ) && 
                 ~((rd_addr_l2b1_1 == 26) && !rd_en_l2b1_1);
assign l2b1_dv_1[54] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 27) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[54] ) && 
                 ~((rd_addr_l2b1_1 == 27) && !rd_en_l2b1_1);
assign l2b1_dv_1[55] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 27) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[55] ) && 
                 ~((rd_addr_l2b1_1 == 27) && !rd_en_l2b1_1);
assign l2b1_dv_1[56] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 28) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[56] ) && 
                 ~((rd_addr_l2b1_1 == 28) && !rd_en_l2b1_1);
assign l2b1_dv_1[57] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 28) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[57] ) && 
                 ~((rd_addr_l2b1_1 == 28) && !rd_en_l2b1_1);
assign l2b1_dv_1[58] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 29) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[58] ) && 
                 ~((rd_addr_l2b1_1 == 29) && !rd_en_l2b1_1);
assign l2b1_dv_1[59] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 29) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[59] ) && 
                 ~((rd_addr_l2b1_1 == 29) && !rd_en_l2b1_1);
assign l2b1_dv_1[60] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 30) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[60] ) && 
                 ~((rd_addr_l2b1_1 == 30) && !rd_en_l2b1_1);
assign l2b1_dv_1[61] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 30) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[61] ) && 
                 ~((rd_addr_l2b1_1 == 30) && !rd_en_l2b1_1);
assign l2b1_dv_1[62] =  ((!wr_en_l2b1_1[0] && (l2b1_wr_addr_1 == 31) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[62] ) && 
                 ~((rd_addr_l2b1_1 == 31) && !rd_en_l2b1_1);
assign l2b1_dv_1[63] =  ((!wr_en_l2b1_1[1] && (l2b1_wr_addr_1 == 31) && !dram_Ch1_l2b1_pa_err) || l2b1_dv_1_reg[63] ) && 
                 ~((rd_addr_l2b1_1 == 31) && !rd_en_l2b1_1);

always @(posedge (cmp_clk && enabled)) begin 
  if (~cmp_rst_l)
   begin
         l2b1_dv_1_reg <= 64'b0; 
   end
  else begin
         l2b1_dv_1_reg <= l2b1_dv_1;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  dram_rst_l_l2b1_1_1;
reg  [5:0] addr_reg_l2b1_1;
always @ (posedge (cmp_clk && enabled))
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
dram_rst_l_l2b1_1_1 <= #1 dram_rst_l;
addr_reg_l2b1_1     <= #1 {rd_en_l2b1_1, rd_addr_l2b1_1};

if (dram_rst_l_l2b1_1_1 && (~rd_en_l2b1_1) && 
   (addr_reg_l2b1_1 != {rd_en_l2b1_1, rd_addr_l2b1_1}) &&
   (rd_addr_l2b1_1[2:0] == 0) ) begin					// MAQ added condition to check only for 1st rd
/*mb156858 if (!l2b1_dv_1_reg[rd_addr_l2b1_1*2 + 0] || !l2b1_dv_1_reg[rd_addr_l2b1_1*2 + 1] || 
     !l2b1_dv_1_reg[rd_addr_l2b1_1*2 + 2] || !l2b1_dv_1_reg[rd_addr_l2b1_1*2 + 3] ||
     !l2b1_dv_1_reg[rd_addr_l2b1_1*2 + 4] || !l2b1_dv_1_reg[rd_addr_l2b1_1*2 + 5] ||
     !l2b1_dv_1_reg[rd_addr_l2b1_1*2 + 6] || !l2b1_dv_1_reg[rd_addr_l2b1_1*2 + 7]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_l2b1_1, l2b1_dv_1_reg);
     finish_test(" CAS Issued Data not valid ", 1);
  end */ 
end  
end  
end  


// ---- IF WRITE AND THE LOCATIONS DV ALREADY VALID -----

always @ (posedge (cmp_clk && enabled))
begin 
if (cmp_rst_l && (~wr_en_l2b1_1[0])) begin
 if (l2b1_dv_1_reg[l2b1_wr_addr_1*2 + 0]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b1_wr_addr_1,wr_en_l2b1_1, l2b1_dv_1_reg);
     finish_test(" Data Overwritten in write fifo ", 1);
  end  
end  
if (cmp_rst_l && (~wr_en_l2b1_1[1])) begin
 if (l2b1_dv_1_reg[l2b1_wr_addr_1*2 + 1]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b1_wr_addr_1,wr_en_l2b1_1, l2b1_dv_1_reg);
     finish_test(" Data Overwritten in write fifo ", 1);
  end  
end  
end  


wire [63:0] l2b0_dv_2;
reg  [63:0] l2b0_dv_2_reg;

wire [1:0]  wr_en_l2b0_2   = ~dram_Ch2_l2b0_cpu_wr_en;	// MAQ Active High wr_en in N2  wire [3:0]  wr_en_2   = dram_Ch2_cpu_wr_en;
wire [4:0]  l2b0_wr_addr_2 = dram_Ch2_l2b0_cpu_wr_addr;
wire        rd_en_l2b0_2   = ~dram_Ch2_l2b0_wdq_rd_en;
wire [4:0]  rd_addr_l2b0_2 = dram_Ch2_l2b0_wdq_radr[4:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 32 deep	// MAQ 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr

assign l2b0_dv_2[0] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 0) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[0] ) && 
                 ~((rd_addr_l2b0_2 == 0) && !rd_en_l2b0_2);
assign l2b0_dv_2[1] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 0) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[1] ) && 
                 ~((rd_addr_l2b0_2 == 0) && !rd_en_l2b0_2);
assign l2b0_dv_2[2] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 1) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[2] ) && 
                 ~((rd_addr_l2b0_2 == 1) && !rd_en_l2b0_2);
assign l2b0_dv_2[3] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 1) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[3] ) && 
                 ~((rd_addr_l2b0_2 == 1) && !rd_en_l2b0_2);
assign l2b0_dv_2[4] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 2) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[4] ) && 
                 ~((rd_addr_l2b0_2 == 2) && !rd_en_l2b0_2);
assign l2b0_dv_2[5] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 2) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[5] ) && 
                 ~((rd_addr_l2b0_2 == 2) && !rd_en_l2b0_2);
assign l2b0_dv_2[6] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 3) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[6] ) && 
                 ~((rd_addr_l2b0_2 == 3) && !rd_en_l2b0_2);
assign l2b0_dv_2[7] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 3) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[7] ) && 
                 ~((rd_addr_l2b0_2 == 3) && !rd_en_l2b0_2);
assign l2b0_dv_2[8] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 4) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[8] ) && 
                 ~((rd_addr_l2b0_2 == 4) && !rd_en_l2b0_2);
assign l2b0_dv_2[9] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 4) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[9] ) && 
                 ~((rd_addr_l2b0_2 == 4) && !rd_en_l2b0_2);
assign l2b0_dv_2[10] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 5) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[10] ) && 
                 ~((rd_addr_l2b0_2 == 5) && !rd_en_l2b0_2);
assign l2b0_dv_2[11] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 5) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[11] ) && 
                 ~((rd_addr_l2b0_2 == 5) && !rd_en_l2b0_2);
assign l2b0_dv_2[12] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 6) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[12] ) && 
                 ~((rd_addr_l2b0_2 == 6) && !rd_en_l2b0_2);
assign l2b0_dv_2[13] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 6) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[13] ) && 
                 ~((rd_addr_l2b0_2 == 6) && !rd_en_l2b0_2);
assign l2b0_dv_2[14] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 7) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[14] ) && 
                 ~((rd_addr_l2b0_2 == 7) && !rd_en_l2b0_2);
assign l2b0_dv_2[15] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 7) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[15] ) && 
                 ~((rd_addr_l2b0_2 == 7) && !rd_en_l2b0_2);
assign l2b0_dv_2[16] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 8) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[16] ) && 
                 ~((rd_addr_l2b0_2 == 8) && !rd_en_l2b0_2);
assign l2b0_dv_2[17] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 8) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[17] ) && 
                 ~((rd_addr_l2b0_2 == 8) && !rd_en_l2b0_2);
assign l2b0_dv_2[18] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 9) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[18] ) && 
                 ~((rd_addr_l2b0_2 == 9) && !rd_en_l2b0_2);
assign l2b0_dv_2[19] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 9) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[19] ) && 
                 ~((rd_addr_l2b0_2 == 9) && !rd_en_l2b0_2);
assign l2b0_dv_2[20] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 10) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[20] ) && 
                 ~((rd_addr_l2b0_2 == 10) && !rd_en_l2b0_2);
assign l2b0_dv_2[21] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 10) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[21] ) && 
                 ~((rd_addr_l2b0_2 == 10) && !rd_en_l2b0_2);
assign l2b0_dv_2[22] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 11) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[22] ) && 
                 ~((rd_addr_l2b0_2 == 11) && !rd_en_l2b0_2);
assign l2b0_dv_2[23] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 11) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[23] ) && 
                 ~((rd_addr_l2b0_2 == 11) && !rd_en_l2b0_2);
assign l2b0_dv_2[24] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 12) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[24] ) && 
                 ~((rd_addr_l2b0_2 == 12) && !rd_en_l2b0_2);
assign l2b0_dv_2[25] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 12) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[25] ) && 
                 ~((rd_addr_l2b0_2 == 12) && !rd_en_l2b0_2);
assign l2b0_dv_2[26] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 13) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[26] ) && 
                 ~((rd_addr_l2b0_2 == 13) && !rd_en_l2b0_2);
assign l2b0_dv_2[27] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 13) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[27] ) && 
                 ~((rd_addr_l2b0_2 == 13) && !rd_en_l2b0_2);
assign l2b0_dv_2[28] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 14) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[28] ) && 
                 ~((rd_addr_l2b0_2 == 14) && !rd_en_l2b0_2);
assign l2b0_dv_2[29] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 14) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[29] ) && 
                 ~((rd_addr_l2b0_2 == 14) && !rd_en_l2b0_2);
assign l2b0_dv_2[30] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 15) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[30] ) && 
                 ~((rd_addr_l2b0_2 == 15) && !rd_en_l2b0_2);
assign l2b0_dv_2[31] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 15) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[31] ) && 
                 ~((rd_addr_l2b0_2 == 15) && !rd_en_l2b0_2);
assign l2b0_dv_2[32] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 16) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[32] ) && 
                 ~((rd_addr_l2b0_2 == 16) && !rd_en_l2b0_2);
assign l2b0_dv_2[33] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 16) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[33] ) && 
                 ~((rd_addr_l2b0_2 == 16) && !rd_en_l2b0_2);
assign l2b0_dv_2[34] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 17) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[34] ) && 
                 ~((rd_addr_l2b0_2 == 17) && !rd_en_l2b0_2);
assign l2b0_dv_2[35] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 17) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[35] ) && 
                 ~((rd_addr_l2b0_2 == 17) && !rd_en_l2b0_2);
assign l2b0_dv_2[36] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 18) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[36] ) && 
                 ~((rd_addr_l2b0_2 == 18) && !rd_en_l2b0_2);
assign l2b0_dv_2[37] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 18) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[37] ) && 
                 ~((rd_addr_l2b0_2 == 18) && !rd_en_l2b0_2);
assign l2b0_dv_2[38] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 19) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[38] ) && 
                 ~((rd_addr_l2b0_2 == 19) && !rd_en_l2b0_2);
assign l2b0_dv_2[39] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 19) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[39] ) && 
                 ~((rd_addr_l2b0_2 == 19) && !rd_en_l2b0_2);
assign l2b0_dv_2[40] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 20) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[40] ) && 
                 ~((rd_addr_l2b0_2 == 20) && !rd_en_l2b0_2);
assign l2b0_dv_2[41] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 20) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[41] ) && 
                 ~((rd_addr_l2b0_2 == 20) && !rd_en_l2b0_2);
assign l2b0_dv_2[42] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 21) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[42] ) && 
                 ~((rd_addr_l2b0_2 == 21) && !rd_en_l2b0_2);
assign l2b0_dv_2[43] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 21) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[43] ) && 
                 ~((rd_addr_l2b0_2 == 21) && !rd_en_l2b0_2);
assign l2b0_dv_2[44] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 22) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[44] ) && 
                 ~((rd_addr_l2b0_2 == 22) && !rd_en_l2b0_2);
assign l2b0_dv_2[45] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 22) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[45] ) && 
                 ~((rd_addr_l2b0_2 == 22) && !rd_en_l2b0_2);
assign l2b0_dv_2[46] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 23) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[46] ) && 
                 ~((rd_addr_l2b0_2 == 23) && !rd_en_l2b0_2);
assign l2b0_dv_2[47] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 23) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[47] ) && 
                 ~((rd_addr_l2b0_2 == 23) && !rd_en_l2b0_2);
assign l2b0_dv_2[48] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 24) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[48] ) && 
                 ~((rd_addr_l2b0_2 == 24) && !rd_en_l2b0_2);
assign l2b0_dv_2[49] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 24) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[49] ) && 
                 ~((rd_addr_l2b0_2 == 24) && !rd_en_l2b0_2);
assign l2b0_dv_2[50] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 25) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[50] ) && 
                 ~((rd_addr_l2b0_2 == 25) && !rd_en_l2b0_2);
assign l2b0_dv_2[51] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 25) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[51] ) && 
                 ~((rd_addr_l2b0_2 == 25) && !rd_en_l2b0_2);
assign l2b0_dv_2[52] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 26) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[52] ) && 
                 ~((rd_addr_l2b0_2 == 26) && !rd_en_l2b0_2);
assign l2b0_dv_2[53] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 26) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[53] ) && 
                 ~((rd_addr_l2b0_2 == 26) && !rd_en_l2b0_2);
assign l2b0_dv_2[54] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 27) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[54] ) && 
                 ~((rd_addr_l2b0_2 == 27) && !rd_en_l2b0_2);
assign l2b0_dv_2[55] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 27) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[55] ) && 
                 ~((rd_addr_l2b0_2 == 27) && !rd_en_l2b0_2);
assign l2b0_dv_2[56] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 28) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[56] ) && 
                 ~((rd_addr_l2b0_2 == 28) && !rd_en_l2b0_2);
assign l2b0_dv_2[57] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 28) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[57] ) && 
                 ~((rd_addr_l2b0_2 == 28) && !rd_en_l2b0_2);
assign l2b0_dv_2[58] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 29) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[58] ) && 
                 ~((rd_addr_l2b0_2 == 29) && !rd_en_l2b0_2);
assign l2b0_dv_2[59] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 29) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[59] ) && 
                 ~((rd_addr_l2b0_2 == 29) && !rd_en_l2b0_2);
assign l2b0_dv_2[60] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 30) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[60] ) && 
                 ~((rd_addr_l2b0_2 == 30) && !rd_en_l2b0_2);
assign l2b0_dv_2[61] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 30) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[61] ) && 
                 ~((rd_addr_l2b0_2 == 30) && !rd_en_l2b0_2);
assign l2b0_dv_2[62] =  ((!wr_en_l2b0_2[0] && (l2b0_wr_addr_2 == 31) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[62] ) && 
                 ~((rd_addr_l2b0_2 == 31) && !rd_en_l2b0_2);
assign l2b0_dv_2[63] =  ((!wr_en_l2b0_2[1] && (l2b0_wr_addr_2 == 31) && !dram_Ch2_l2b0_pa_err) || l2b0_dv_2_reg[63] ) && 
                 ~((rd_addr_l2b0_2 == 31) && !rd_en_l2b0_2);

always @(posedge (cmp_clk && enabled)) begin 
  if (~cmp_rst_l)
   begin
         l2b0_dv_2_reg <= 64'b0; 
   end
  else begin
         l2b0_dv_2_reg <= l2b0_dv_2;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  dram_rst_l_l2b0_2_1;
reg  [5:0] addr_reg_l2b0_2;
always @ (posedge (cmp_clk && enabled))
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
dram_rst_l_l2b0_2_1 <= #1 dram_rst_l;
addr_reg_l2b0_2     <= #1 {rd_en_l2b0_2, rd_addr_l2b0_2};

if (dram_rst_l_l2b0_2_1 && (~rd_en_l2b0_2) && 
   (addr_reg_l2b0_2 != {rd_en_l2b0_2, rd_addr_l2b0_2}) &&
   (rd_addr_l2b0_2[2:0] == 0) ) begin					// MAQ added condition to check only for 1st rd
/*mb156858 if (!l2b0_dv_2_reg[rd_addr_l2b0_2*2 + 0] || !l2b0_dv_2_reg[rd_addr_l2b0_2*2 + 1] || 
     !l2b0_dv_2_reg[rd_addr_l2b0_2*2 + 2] || !l2b0_dv_2_reg[rd_addr_l2b0_2*2 + 3] ||
     !l2b0_dv_2_reg[rd_addr_l2b0_2*2 + 4] || !l2b0_dv_2_reg[rd_addr_l2b0_2*2 + 5] ||
     !l2b0_dv_2_reg[rd_addr_l2b0_2*2 + 6] || !l2b0_dv_2_reg[rd_addr_l2b0_2*2 + 7]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_l2b0_2, l2b0_dv_2_reg);
     finish_test(" CAS Issued Data not valid ", 2);
  end */ 
end  
end  
end  


// ---- IF WRITE AND THE LOCATIONS DV ALREADY VALID -----

always @ (posedge (cmp_clk && enabled))
begin 
if (cmp_rst_l && (~wr_en_l2b0_2[0])) begin
 if (l2b0_dv_2_reg[l2b0_wr_addr_2*2 + 0]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b0_wr_addr_2,wr_en_l2b0_2, l2b0_dv_2_reg);
     finish_test(" Data Overwritten in write fifo ", 2);
  end  
end  
if (cmp_rst_l && (~wr_en_l2b0_2[1])) begin
 if (l2b0_dv_2_reg[l2b0_wr_addr_2*2 + 1]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b0_wr_addr_2,wr_en_l2b0_2, l2b0_dv_2_reg);
     finish_test(" Data Overwritten in write fifo ", 2);
  end  
end  
end  


wire [63:0] l2b1_dv_2;
reg  [63:0] l2b1_dv_2_reg;

wire [1:0]  wr_en_l2b1_2   = ~dram_Ch2_l2b1_cpu_wr_en;	// MAQ Active High wr_en in N2  wire [3:0]  wr_en_2   = dram_Ch2_cpu_wr_en;
wire [4:0]  l2b1_wr_addr_2 = dram_Ch2_l2b1_cpu_wr_addr;
wire        rd_en_l2b1_2   = ~dram_Ch2_l2b1_wdq_rd_en;
wire [4:0]  rd_addr_l2b1_2 = dram_Ch2_l2b1_wdq_radr[4:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 32 deep	// MAQ 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr

assign l2b1_dv_2[0] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 0) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[0] ) && 
                 ~((rd_addr_l2b1_2 == 0) && !rd_en_l2b1_2);
assign l2b1_dv_2[1] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 0) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[1] ) && 
                 ~((rd_addr_l2b1_2 == 0) && !rd_en_l2b1_2);
assign l2b1_dv_2[2] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 1) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[2] ) && 
                 ~((rd_addr_l2b1_2 == 1) && !rd_en_l2b1_2);
assign l2b1_dv_2[3] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 1) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[3] ) && 
                 ~((rd_addr_l2b1_2 == 1) && !rd_en_l2b1_2);
assign l2b1_dv_2[4] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 2) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[4] ) && 
                 ~((rd_addr_l2b1_2 == 2) && !rd_en_l2b1_2);
assign l2b1_dv_2[5] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 2) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[5] ) && 
                 ~((rd_addr_l2b1_2 == 2) && !rd_en_l2b1_2);
assign l2b1_dv_2[6] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 3) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[6] ) && 
                 ~((rd_addr_l2b1_2 == 3) && !rd_en_l2b1_2);
assign l2b1_dv_2[7] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 3) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[7] ) && 
                 ~((rd_addr_l2b1_2 == 3) && !rd_en_l2b1_2);
assign l2b1_dv_2[8] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 4) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[8] ) && 
                 ~((rd_addr_l2b1_2 == 4) && !rd_en_l2b1_2);
assign l2b1_dv_2[9] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 4) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[9] ) && 
                 ~((rd_addr_l2b1_2 == 4) && !rd_en_l2b1_2);
assign l2b1_dv_2[10] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 5) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[10] ) && 
                 ~((rd_addr_l2b1_2 == 5) && !rd_en_l2b1_2);
assign l2b1_dv_2[11] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 5) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[11] ) && 
                 ~((rd_addr_l2b1_2 == 5) && !rd_en_l2b1_2);
assign l2b1_dv_2[12] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 6) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[12] ) && 
                 ~((rd_addr_l2b1_2 == 6) && !rd_en_l2b1_2);
assign l2b1_dv_2[13] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 6) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[13] ) && 
                 ~((rd_addr_l2b1_2 == 6) && !rd_en_l2b1_2);
assign l2b1_dv_2[14] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 7) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[14] ) && 
                 ~((rd_addr_l2b1_2 == 7) && !rd_en_l2b1_2);
assign l2b1_dv_2[15] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 7) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[15] ) && 
                 ~((rd_addr_l2b1_2 == 7) && !rd_en_l2b1_2);
assign l2b1_dv_2[16] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 8) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[16] ) && 
                 ~((rd_addr_l2b1_2 == 8) && !rd_en_l2b1_2);
assign l2b1_dv_2[17] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 8) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[17] ) && 
                 ~((rd_addr_l2b1_2 == 8) && !rd_en_l2b1_2);
assign l2b1_dv_2[18] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 9) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[18] ) && 
                 ~((rd_addr_l2b1_2 == 9) && !rd_en_l2b1_2);
assign l2b1_dv_2[19] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 9) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[19] ) && 
                 ~((rd_addr_l2b1_2 == 9) && !rd_en_l2b1_2);
assign l2b1_dv_2[20] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 10) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[20] ) && 
                 ~((rd_addr_l2b1_2 == 10) && !rd_en_l2b1_2);
assign l2b1_dv_2[21] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 10) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[21] ) && 
                 ~((rd_addr_l2b1_2 == 10) && !rd_en_l2b1_2);
assign l2b1_dv_2[22] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 11) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[22] ) && 
                 ~((rd_addr_l2b1_2 == 11) && !rd_en_l2b1_2);
assign l2b1_dv_2[23] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 11) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[23] ) && 
                 ~((rd_addr_l2b1_2 == 11) && !rd_en_l2b1_2);
assign l2b1_dv_2[24] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 12) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[24] ) && 
                 ~((rd_addr_l2b1_2 == 12) && !rd_en_l2b1_2);
assign l2b1_dv_2[25] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 12) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[25] ) && 
                 ~((rd_addr_l2b1_2 == 12) && !rd_en_l2b1_2);
assign l2b1_dv_2[26] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 13) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[26] ) && 
                 ~((rd_addr_l2b1_2 == 13) && !rd_en_l2b1_2);
assign l2b1_dv_2[27] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 13) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[27] ) && 
                 ~((rd_addr_l2b1_2 == 13) && !rd_en_l2b1_2);
assign l2b1_dv_2[28] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 14) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[28] ) && 
                 ~((rd_addr_l2b1_2 == 14) && !rd_en_l2b1_2);
assign l2b1_dv_2[29] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 14) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[29] ) && 
                 ~((rd_addr_l2b1_2 == 14) && !rd_en_l2b1_2);
assign l2b1_dv_2[30] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 15) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[30] ) && 
                 ~((rd_addr_l2b1_2 == 15) && !rd_en_l2b1_2);
assign l2b1_dv_2[31] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 15) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[31] ) && 
                 ~((rd_addr_l2b1_2 == 15) && !rd_en_l2b1_2);
assign l2b1_dv_2[32] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 16) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[32] ) && 
                 ~((rd_addr_l2b1_2 == 16) && !rd_en_l2b1_2);
assign l2b1_dv_2[33] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 16) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[33] ) && 
                 ~((rd_addr_l2b1_2 == 16) && !rd_en_l2b1_2);
assign l2b1_dv_2[34] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 17) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[34] ) && 
                 ~((rd_addr_l2b1_2 == 17) && !rd_en_l2b1_2);
assign l2b1_dv_2[35] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 17) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[35] ) && 
                 ~((rd_addr_l2b1_2 == 17) && !rd_en_l2b1_2);
assign l2b1_dv_2[36] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 18) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[36] ) && 
                 ~((rd_addr_l2b1_2 == 18) && !rd_en_l2b1_2);
assign l2b1_dv_2[37] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 18) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[37] ) && 
                 ~((rd_addr_l2b1_2 == 18) && !rd_en_l2b1_2);
assign l2b1_dv_2[38] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 19) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[38] ) && 
                 ~((rd_addr_l2b1_2 == 19) && !rd_en_l2b1_2);
assign l2b1_dv_2[39] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 19) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[39] ) && 
                 ~((rd_addr_l2b1_2 == 19) && !rd_en_l2b1_2);
assign l2b1_dv_2[40] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 20) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[40] ) && 
                 ~((rd_addr_l2b1_2 == 20) && !rd_en_l2b1_2);
assign l2b1_dv_2[41] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 20) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[41] ) && 
                 ~((rd_addr_l2b1_2 == 20) && !rd_en_l2b1_2);
assign l2b1_dv_2[42] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 21) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[42] ) && 
                 ~((rd_addr_l2b1_2 == 21) && !rd_en_l2b1_2);
assign l2b1_dv_2[43] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 21) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[43] ) && 
                 ~((rd_addr_l2b1_2 == 21) && !rd_en_l2b1_2);
assign l2b1_dv_2[44] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 22) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[44] ) && 
                 ~((rd_addr_l2b1_2 == 22) && !rd_en_l2b1_2);
assign l2b1_dv_2[45] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 22) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[45] ) && 
                 ~((rd_addr_l2b1_2 == 22) && !rd_en_l2b1_2);
assign l2b1_dv_2[46] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 23) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[46] ) && 
                 ~((rd_addr_l2b1_2 == 23) && !rd_en_l2b1_2);
assign l2b1_dv_2[47] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 23) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[47] ) && 
                 ~((rd_addr_l2b1_2 == 23) && !rd_en_l2b1_2);
assign l2b1_dv_2[48] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 24) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[48] ) && 
                 ~((rd_addr_l2b1_2 == 24) && !rd_en_l2b1_2);
assign l2b1_dv_2[49] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 24) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[49] ) && 
                 ~((rd_addr_l2b1_2 == 24) && !rd_en_l2b1_2);
assign l2b1_dv_2[50] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 25) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[50] ) && 
                 ~((rd_addr_l2b1_2 == 25) && !rd_en_l2b1_2);
assign l2b1_dv_2[51] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 25) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[51] ) && 
                 ~((rd_addr_l2b1_2 == 25) && !rd_en_l2b1_2);
assign l2b1_dv_2[52] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 26) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[52] ) && 
                 ~((rd_addr_l2b1_2 == 26) && !rd_en_l2b1_2);
assign l2b1_dv_2[53] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 26) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[53] ) && 
                 ~((rd_addr_l2b1_2 == 26) && !rd_en_l2b1_2);
assign l2b1_dv_2[54] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 27) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[54] ) && 
                 ~((rd_addr_l2b1_2 == 27) && !rd_en_l2b1_2);
assign l2b1_dv_2[55] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 27) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[55] ) && 
                 ~((rd_addr_l2b1_2 == 27) && !rd_en_l2b1_2);
assign l2b1_dv_2[56] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 28) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[56] ) && 
                 ~((rd_addr_l2b1_2 == 28) && !rd_en_l2b1_2);
assign l2b1_dv_2[57] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 28) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[57] ) && 
                 ~((rd_addr_l2b1_2 == 28) && !rd_en_l2b1_2);
assign l2b1_dv_2[58] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 29) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[58] ) && 
                 ~((rd_addr_l2b1_2 == 29) && !rd_en_l2b1_2);
assign l2b1_dv_2[59] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 29) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[59] ) && 
                 ~((rd_addr_l2b1_2 == 29) && !rd_en_l2b1_2);
assign l2b1_dv_2[60] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 30) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[60] ) && 
                 ~((rd_addr_l2b1_2 == 30) && !rd_en_l2b1_2);
assign l2b1_dv_2[61] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 30) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[61] ) && 
                 ~((rd_addr_l2b1_2 == 30) && !rd_en_l2b1_2);
assign l2b1_dv_2[62] =  ((!wr_en_l2b1_2[0] && (l2b1_wr_addr_2 == 31) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[62] ) && 
                 ~((rd_addr_l2b1_2 == 31) && !rd_en_l2b1_2);
assign l2b1_dv_2[63] =  ((!wr_en_l2b1_2[1] && (l2b1_wr_addr_2 == 31) && !dram_Ch2_l2b1_pa_err) || l2b1_dv_2_reg[63] ) && 
                 ~((rd_addr_l2b1_2 == 31) && !rd_en_l2b1_2);

always @(posedge (cmp_clk && enabled)) begin 
  if (~cmp_rst_l)
   begin
         l2b1_dv_2_reg <= 64'b0; 
   end
  else begin
         l2b1_dv_2_reg <= l2b1_dv_2;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  dram_rst_l_l2b1_2_1;
reg  [5:0] addr_reg_l2b1_2;
always @ (posedge (cmp_clk && enabled))
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
dram_rst_l_l2b1_2_1 <= #1 dram_rst_l;
addr_reg_l2b1_2     <= #1 {rd_en_l2b1_2, rd_addr_l2b1_2};

if (dram_rst_l_l2b1_2_1 && (~rd_en_l2b1_2) && 
   (addr_reg_l2b1_2 != {rd_en_l2b1_2, rd_addr_l2b1_2}) &&
   (rd_addr_l2b1_2[2:0] == 0) ) begin					// MAQ added condition to check only for 1st rd
/*mb156858 if (!l2b1_dv_2_reg[rd_addr_l2b1_2*2 + 0] || !l2b1_dv_2_reg[rd_addr_l2b1_2*2 + 1] || 
     !l2b1_dv_2_reg[rd_addr_l2b1_2*2 + 2] || !l2b1_dv_2_reg[rd_addr_l2b1_2*2 + 3] ||
     !l2b1_dv_2_reg[rd_addr_l2b1_2*2 + 4] || !l2b1_dv_2_reg[rd_addr_l2b1_2*2 + 5] ||
     !l2b1_dv_2_reg[rd_addr_l2b1_2*2 + 6] || !l2b1_dv_2_reg[rd_addr_l2b1_2*2 + 7]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_l2b1_2, l2b1_dv_2_reg);
     finish_test(" CAS Issued Data not valid ", 2);
  end */ 
end  
end  
end  


// ---- IF WRITE AND THE LOCATIONS DV ALREADY VALID -----

always @ (posedge (cmp_clk && enabled))
begin 
if (cmp_rst_l && (~wr_en_l2b1_2[0])) begin
 if (l2b1_dv_2_reg[l2b1_wr_addr_2*2 + 0]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b1_wr_addr_2,wr_en_l2b1_2, l2b1_dv_2_reg);
     finish_test(" Data Overwritten in write fifo ", 2);
  end  
end  
if (cmp_rst_l && (~wr_en_l2b1_2[1])) begin
 if (l2b1_dv_2_reg[l2b1_wr_addr_2*2 + 1]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b1_wr_addr_2,wr_en_l2b1_2, l2b1_dv_2_reg);
     finish_test(" Data Overwritten in write fifo ", 2);
  end  
end  
end  


wire [63:0] l2b0_dv_3;
reg  [63:0] l2b0_dv_3_reg;

wire [1:0]  wr_en_l2b0_3   = ~dram_Ch3_l2b0_cpu_wr_en;	// MAQ Active High wr_en in N2  wire [3:0]  wr_en_3   = dram_Ch3_cpu_wr_en;
wire [4:0]  l2b0_wr_addr_3 = dram_Ch3_l2b0_cpu_wr_addr;
wire        rd_en_l2b0_3   = ~dram_Ch3_l2b0_wdq_rd_en;
wire [4:0]  rd_addr_l2b0_3 = dram_Ch3_l2b0_wdq_radr[4:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 32 deep	// MAQ 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr

assign l2b0_dv_3[0] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 0) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[0] ) && 
                 ~((rd_addr_l2b0_3 == 0) && !rd_en_l2b0_3);
assign l2b0_dv_3[1] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 0) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[1] ) && 
                 ~((rd_addr_l2b0_3 == 0) && !rd_en_l2b0_3);
assign l2b0_dv_3[2] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 1) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[2] ) && 
                 ~((rd_addr_l2b0_3 == 1) && !rd_en_l2b0_3);
assign l2b0_dv_3[3] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 1) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[3] ) && 
                 ~((rd_addr_l2b0_3 == 1) && !rd_en_l2b0_3);
assign l2b0_dv_3[4] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 2) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[4] ) && 
                 ~((rd_addr_l2b0_3 == 2) && !rd_en_l2b0_3);
assign l2b0_dv_3[5] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 2) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[5] ) && 
                 ~((rd_addr_l2b0_3 == 2) && !rd_en_l2b0_3);
assign l2b0_dv_3[6] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 3) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[6] ) && 
                 ~((rd_addr_l2b0_3 == 3) && !rd_en_l2b0_3);
assign l2b0_dv_3[7] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 3) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[7] ) && 
                 ~((rd_addr_l2b0_3 == 3) && !rd_en_l2b0_3);
assign l2b0_dv_3[8] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 4) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[8] ) && 
                 ~((rd_addr_l2b0_3 == 4) && !rd_en_l2b0_3);
assign l2b0_dv_3[9] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 4) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[9] ) && 
                 ~((rd_addr_l2b0_3 == 4) && !rd_en_l2b0_3);
assign l2b0_dv_3[10] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 5) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[10] ) && 
                 ~((rd_addr_l2b0_3 == 5) && !rd_en_l2b0_3);
assign l2b0_dv_3[11] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 5) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[11] ) && 
                 ~((rd_addr_l2b0_3 == 5) && !rd_en_l2b0_3);
assign l2b0_dv_3[12] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 6) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[12] ) && 
                 ~((rd_addr_l2b0_3 == 6) && !rd_en_l2b0_3);
assign l2b0_dv_3[13] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 6) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[13] ) && 
                 ~((rd_addr_l2b0_3 == 6) && !rd_en_l2b0_3);
assign l2b0_dv_3[14] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 7) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[14] ) && 
                 ~((rd_addr_l2b0_3 == 7) && !rd_en_l2b0_3);
assign l2b0_dv_3[15] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 7) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[15] ) && 
                 ~((rd_addr_l2b0_3 == 7) && !rd_en_l2b0_3);
assign l2b0_dv_3[16] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 8) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[16] ) && 
                 ~((rd_addr_l2b0_3 == 8) && !rd_en_l2b0_3);
assign l2b0_dv_3[17] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 8) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[17] ) && 
                 ~((rd_addr_l2b0_3 == 8) && !rd_en_l2b0_3);
assign l2b0_dv_3[18] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 9) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[18] ) && 
                 ~((rd_addr_l2b0_3 == 9) && !rd_en_l2b0_3);
assign l2b0_dv_3[19] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 9) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[19] ) && 
                 ~((rd_addr_l2b0_3 == 9) && !rd_en_l2b0_3);
assign l2b0_dv_3[20] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 10) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[20] ) && 
                 ~((rd_addr_l2b0_3 == 10) && !rd_en_l2b0_3);
assign l2b0_dv_3[21] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 10) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[21] ) && 
                 ~((rd_addr_l2b0_3 == 10) && !rd_en_l2b0_3);
assign l2b0_dv_3[22] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 11) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[22] ) && 
                 ~((rd_addr_l2b0_3 == 11) && !rd_en_l2b0_3);
assign l2b0_dv_3[23] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 11) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[23] ) && 
                 ~((rd_addr_l2b0_3 == 11) && !rd_en_l2b0_3);
assign l2b0_dv_3[24] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 12) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[24] ) && 
                 ~((rd_addr_l2b0_3 == 12) && !rd_en_l2b0_3);
assign l2b0_dv_3[25] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 12) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[25] ) && 
                 ~((rd_addr_l2b0_3 == 12) && !rd_en_l2b0_3);
assign l2b0_dv_3[26] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 13) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[26] ) && 
                 ~((rd_addr_l2b0_3 == 13) && !rd_en_l2b0_3);
assign l2b0_dv_3[27] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 13) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[27] ) && 
                 ~((rd_addr_l2b0_3 == 13) && !rd_en_l2b0_3);
assign l2b0_dv_3[28] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 14) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[28] ) && 
                 ~((rd_addr_l2b0_3 == 14) && !rd_en_l2b0_3);
assign l2b0_dv_3[29] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 14) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[29] ) && 
                 ~((rd_addr_l2b0_3 == 14) && !rd_en_l2b0_3);
assign l2b0_dv_3[30] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 15) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[30] ) && 
                 ~((rd_addr_l2b0_3 == 15) && !rd_en_l2b0_3);
assign l2b0_dv_3[31] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 15) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[31] ) && 
                 ~((rd_addr_l2b0_3 == 15) && !rd_en_l2b0_3);
assign l2b0_dv_3[32] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 16) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[32] ) && 
                 ~((rd_addr_l2b0_3 == 16) && !rd_en_l2b0_3);
assign l2b0_dv_3[33] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 16) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[33] ) && 
                 ~((rd_addr_l2b0_3 == 16) && !rd_en_l2b0_3);
assign l2b0_dv_3[34] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 17) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[34] ) && 
                 ~((rd_addr_l2b0_3 == 17) && !rd_en_l2b0_3);
assign l2b0_dv_3[35] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 17) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[35] ) && 
                 ~((rd_addr_l2b0_3 == 17) && !rd_en_l2b0_3);
assign l2b0_dv_3[36] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 18) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[36] ) && 
                 ~((rd_addr_l2b0_3 == 18) && !rd_en_l2b0_3);
assign l2b0_dv_3[37] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 18) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[37] ) && 
                 ~((rd_addr_l2b0_3 == 18) && !rd_en_l2b0_3);
assign l2b0_dv_3[38] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 19) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[38] ) && 
                 ~((rd_addr_l2b0_3 == 19) && !rd_en_l2b0_3);
assign l2b0_dv_3[39] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 19) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[39] ) && 
                 ~((rd_addr_l2b0_3 == 19) && !rd_en_l2b0_3);
assign l2b0_dv_3[40] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 20) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[40] ) && 
                 ~((rd_addr_l2b0_3 == 20) && !rd_en_l2b0_3);
assign l2b0_dv_3[41] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 20) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[41] ) && 
                 ~((rd_addr_l2b0_3 == 20) && !rd_en_l2b0_3);
assign l2b0_dv_3[42] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 21) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[42] ) && 
                 ~((rd_addr_l2b0_3 == 21) && !rd_en_l2b0_3);
assign l2b0_dv_3[43] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 21) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[43] ) && 
                 ~((rd_addr_l2b0_3 == 21) && !rd_en_l2b0_3);
assign l2b0_dv_3[44] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 22) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[44] ) && 
                 ~((rd_addr_l2b0_3 == 22) && !rd_en_l2b0_3);
assign l2b0_dv_3[45] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 22) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[45] ) && 
                 ~((rd_addr_l2b0_3 == 22) && !rd_en_l2b0_3);
assign l2b0_dv_3[46] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 23) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[46] ) && 
                 ~((rd_addr_l2b0_3 == 23) && !rd_en_l2b0_3);
assign l2b0_dv_3[47] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 23) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[47] ) && 
                 ~((rd_addr_l2b0_3 == 23) && !rd_en_l2b0_3);
assign l2b0_dv_3[48] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 24) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[48] ) && 
                 ~((rd_addr_l2b0_3 == 24) && !rd_en_l2b0_3);
assign l2b0_dv_3[49] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 24) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[49] ) && 
                 ~((rd_addr_l2b0_3 == 24) && !rd_en_l2b0_3);
assign l2b0_dv_3[50] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 25) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[50] ) && 
                 ~((rd_addr_l2b0_3 == 25) && !rd_en_l2b0_3);
assign l2b0_dv_3[51] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 25) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[51] ) && 
                 ~((rd_addr_l2b0_3 == 25) && !rd_en_l2b0_3);
assign l2b0_dv_3[52] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 26) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[52] ) && 
                 ~((rd_addr_l2b0_3 == 26) && !rd_en_l2b0_3);
assign l2b0_dv_3[53] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 26) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[53] ) && 
                 ~((rd_addr_l2b0_3 == 26) && !rd_en_l2b0_3);
assign l2b0_dv_3[54] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 27) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[54] ) && 
                 ~((rd_addr_l2b0_3 == 27) && !rd_en_l2b0_3);
assign l2b0_dv_3[55] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 27) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[55] ) && 
                 ~((rd_addr_l2b0_3 == 27) && !rd_en_l2b0_3);
assign l2b0_dv_3[56] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 28) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[56] ) && 
                 ~((rd_addr_l2b0_3 == 28) && !rd_en_l2b0_3);
assign l2b0_dv_3[57] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 28) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[57] ) && 
                 ~((rd_addr_l2b0_3 == 28) && !rd_en_l2b0_3);
assign l2b0_dv_3[58] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 29) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[58] ) && 
                 ~((rd_addr_l2b0_3 == 29) && !rd_en_l2b0_3);
assign l2b0_dv_3[59] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 29) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[59] ) && 
                 ~((rd_addr_l2b0_3 == 29) && !rd_en_l2b0_3);
assign l2b0_dv_3[60] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 30) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[60] ) && 
                 ~((rd_addr_l2b0_3 == 30) && !rd_en_l2b0_3);
assign l2b0_dv_3[61] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 30) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[61] ) && 
                 ~((rd_addr_l2b0_3 == 30) && !rd_en_l2b0_3);
assign l2b0_dv_3[62] =  ((!wr_en_l2b0_3[0] && (l2b0_wr_addr_3 == 31) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[62] ) && 
                 ~((rd_addr_l2b0_3 == 31) && !rd_en_l2b0_3);
assign l2b0_dv_3[63] =  ((!wr_en_l2b0_3[1] && (l2b0_wr_addr_3 == 31) && !dram_Ch3_l2b0_pa_err) || l2b0_dv_3_reg[63] ) && 
                 ~((rd_addr_l2b0_3 == 31) && !rd_en_l2b0_3);

always @(posedge (cmp_clk && enabled)) begin 
  if (~cmp_rst_l)
   begin
         l2b0_dv_3_reg <= 64'b0; 
   end
  else begin
         l2b0_dv_3_reg <= l2b0_dv_3;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  dram_rst_l_l2b0_3_1;
reg  [5:0] addr_reg_l2b0_3;
always @ (posedge (cmp_clk && enabled))
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
dram_rst_l_l2b0_3_1 <= #1 dram_rst_l;
addr_reg_l2b0_3     <= #1 {rd_en_l2b0_3, rd_addr_l2b0_3};

if (dram_rst_l_l2b0_3_1 && (~rd_en_l2b0_3) && 
   (addr_reg_l2b0_3 != {rd_en_l2b0_3, rd_addr_l2b0_3}) &&
   (rd_addr_l2b0_3[2:0] == 0) ) begin					// MAQ added condition to check only for 1st rd
/*mb156858 if (!l2b0_dv_3_reg[rd_addr_l2b0_3*2 + 0] || !l2b0_dv_3_reg[rd_addr_l2b0_3*2 + 1] || 
     !l2b0_dv_3_reg[rd_addr_l2b0_3*2 + 2] || !l2b0_dv_3_reg[rd_addr_l2b0_3*2 + 3] ||
     !l2b0_dv_3_reg[rd_addr_l2b0_3*2 + 4] || !l2b0_dv_3_reg[rd_addr_l2b0_3*2 + 5] ||
     !l2b0_dv_3_reg[rd_addr_l2b0_3*2 + 6] || !l2b0_dv_3_reg[rd_addr_l2b0_3*2 + 7]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_l2b0_3, l2b0_dv_3_reg);
     finish_test(" CAS Issued Data not valid ", 3);
  end */ 
end  
end  
end  


// ---- IF WRITE AND THE LOCATIONS DV ALREADY VALID -----

always @ (posedge (cmp_clk && enabled))
begin 
if (cmp_rst_l && (~wr_en_l2b0_3[0])) begin
 if (l2b0_dv_3_reg[l2b0_wr_addr_3*2 + 0]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b0_wr_addr_3,wr_en_l2b0_3, l2b0_dv_3_reg);
     finish_test(" Data Overwritten in write fifo ", 3);
  end  
end  
if (cmp_rst_l && (~wr_en_l2b0_3[1])) begin
 if (l2b0_dv_3_reg[l2b0_wr_addr_3*2 + 1]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b0_wr_addr_3,wr_en_l2b0_3, l2b0_dv_3_reg);
     finish_test(" Data Overwritten in write fifo ", 3);
  end  
end  
end  


wire [63:0] l2b1_dv_3;
reg  [63:0] l2b1_dv_3_reg;

wire [1:0]  wr_en_l2b1_3   = ~dram_Ch3_l2b1_cpu_wr_en;	// MAQ Active High wr_en in N2  wire [3:0]  wr_en_3   = dram_Ch3_cpu_wr_en;
wire [4:0]  l2b1_wr_addr_3 = dram_Ch3_l2b1_cpu_wr_addr;
wire        rd_en_l2b1_3   = ~dram_Ch3_l2b1_wdq_rd_en;
wire [4:0]  rd_addr_l2b1_3 = dram_Ch3_l2b1_wdq_radr[4:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 32 deep	// MAQ 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr

assign l2b1_dv_3[0] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 0) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[0] ) && 
                 ~((rd_addr_l2b1_3 == 0) && !rd_en_l2b1_3);
assign l2b1_dv_3[1] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 0) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[1] ) && 
                 ~((rd_addr_l2b1_3 == 0) && !rd_en_l2b1_3);
assign l2b1_dv_3[2] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 1) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[2] ) && 
                 ~((rd_addr_l2b1_3 == 1) && !rd_en_l2b1_3);
assign l2b1_dv_3[3] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 1) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[3] ) && 
                 ~((rd_addr_l2b1_3 == 1) && !rd_en_l2b1_3);
assign l2b1_dv_3[4] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 2) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[4] ) && 
                 ~((rd_addr_l2b1_3 == 2) && !rd_en_l2b1_3);
assign l2b1_dv_3[5] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 2) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[5] ) && 
                 ~((rd_addr_l2b1_3 == 2) && !rd_en_l2b1_3);
assign l2b1_dv_3[6] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 3) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[6] ) && 
                 ~((rd_addr_l2b1_3 == 3) && !rd_en_l2b1_3);
assign l2b1_dv_3[7] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 3) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[7] ) && 
                 ~((rd_addr_l2b1_3 == 3) && !rd_en_l2b1_3);
assign l2b1_dv_3[8] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 4) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[8] ) && 
                 ~((rd_addr_l2b1_3 == 4) && !rd_en_l2b1_3);
assign l2b1_dv_3[9] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 4) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[9] ) && 
                 ~((rd_addr_l2b1_3 == 4) && !rd_en_l2b1_3);
assign l2b1_dv_3[10] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 5) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[10] ) && 
                 ~((rd_addr_l2b1_3 == 5) && !rd_en_l2b1_3);
assign l2b1_dv_3[11] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 5) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[11] ) && 
                 ~((rd_addr_l2b1_3 == 5) && !rd_en_l2b1_3);
assign l2b1_dv_3[12] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 6) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[12] ) && 
                 ~((rd_addr_l2b1_3 == 6) && !rd_en_l2b1_3);
assign l2b1_dv_3[13] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 6) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[13] ) && 
                 ~((rd_addr_l2b1_3 == 6) && !rd_en_l2b1_3);
assign l2b1_dv_3[14] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 7) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[14] ) && 
                 ~((rd_addr_l2b1_3 == 7) && !rd_en_l2b1_3);
assign l2b1_dv_3[15] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 7) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[15] ) && 
                 ~((rd_addr_l2b1_3 == 7) && !rd_en_l2b1_3);
assign l2b1_dv_3[16] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 8) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[16] ) && 
                 ~((rd_addr_l2b1_3 == 8) && !rd_en_l2b1_3);
assign l2b1_dv_3[17] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 8) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[17] ) && 
                 ~((rd_addr_l2b1_3 == 8) && !rd_en_l2b1_3);
assign l2b1_dv_3[18] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 9) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[18] ) && 
                 ~((rd_addr_l2b1_3 == 9) && !rd_en_l2b1_3);
assign l2b1_dv_3[19] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 9) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[19] ) && 
                 ~((rd_addr_l2b1_3 == 9) && !rd_en_l2b1_3);
assign l2b1_dv_3[20] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 10) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[20] ) && 
                 ~((rd_addr_l2b1_3 == 10) && !rd_en_l2b1_3);
assign l2b1_dv_3[21] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 10) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[21] ) && 
                 ~((rd_addr_l2b1_3 == 10) && !rd_en_l2b1_3);
assign l2b1_dv_3[22] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 11) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[22] ) && 
                 ~((rd_addr_l2b1_3 == 11) && !rd_en_l2b1_3);
assign l2b1_dv_3[23] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 11) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[23] ) && 
                 ~((rd_addr_l2b1_3 == 11) && !rd_en_l2b1_3);
assign l2b1_dv_3[24] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 12) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[24] ) && 
                 ~((rd_addr_l2b1_3 == 12) && !rd_en_l2b1_3);
assign l2b1_dv_3[25] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 12) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[25] ) && 
                 ~((rd_addr_l2b1_3 == 12) && !rd_en_l2b1_3);
assign l2b1_dv_3[26] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 13) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[26] ) && 
                 ~((rd_addr_l2b1_3 == 13) && !rd_en_l2b1_3);
assign l2b1_dv_3[27] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 13) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[27] ) && 
                 ~((rd_addr_l2b1_3 == 13) && !rd_en_l2b1_3);
assign l2b1_dv_3[28] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 14) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[28] ) && 
                 ~((rd_addr_l2b1_3 == 14) && !rd_en_l2b1_3);
assign l2b1_dv_3[29] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 14) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[29] ) && 
                 ~((rd_addr_l2b1_3 == 14) && !rd_en_l2b1_3);
assign l2b1_dv_3[30] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 15) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[30] ) && 
                 ~((rd_addr_l2b1_3 == 15) && !rd_en_l2b1_3);
assign l2b1_dv_3[31] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 15) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[31] ) && 
                 ~((rd_addr_l2b1_3 == 15) && !rd_en_l2b1_3);
assign l2b1_dv_3[32] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 16) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[32] ) && 
                 ~((rd_addr_l2b1_3 == 16) && !rd_en_l2b1_3);
assign l2b1_dv_3[33] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 16) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[33] ) && 
                 ~((rd_addr_l2b1_3 == 16) && !rd_en_l2b1_3);
assign l2b1_dv_3[34] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 17) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[34] ) && 
                 ~((rd_addr_l2b1_3 == 17) && !rd_en_l2b1_3);
assign l2b1_dv_3[35] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 17) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[35] ) && 
                 ~((rd_addr_l2b1_3 == 17) && !rd_en_l2b1_3);
assign l2b1_dv_3[36] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 18) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[36] ) && 
                 ~((rd_addr_l2b1_3 == 18) && !rd_en_l2b1_3);
assign l2b1_dv_3[37] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 18) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[37] ) && 
                 ~((rd_addr_l2b1_3 == 18) && !rd_en_l2b1_3);
assign l2b1_dv_3[38] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 19) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[38] ) && 
                 ~((rd_addr_l2b1_3 == 19) && !rd_en_l2b1_3);
assign l2b1_dv_3[39] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 19) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[39] ) && 
                 ~((rd_addr_l2b1_3 == 19) && !rd_en_l2b1_3);
assign l2b1_dv_3[40] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 20) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[40] ) && 
                 ~((rd_addr_l2b1_3 == 20) && !rd_en_l2b1_3);
assign l2b1_dv_3[41] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 20) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[41] ) && 
                 ~((rd_addr_l2b1_3 == 20) && !rd_en_l2b1_3);
assign l2b1_dv_3[42] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 21) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[42] ) && 
                 ~((rd_addr_l2b1_3 == 21) && !rd_en_l2b1_3);
assign l2b1_dv_3[43] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 21) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[43] ) && 
                 ~((rd_addr_l2b1_3 == 21) && !rd_en_l2b1_3);
assign l2b1_dv_3[44] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 22) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[44] ) && 
                 ~((rd_addr_l2b1_3 == 22) && !rd_en_l2b1_3);
assign l2b1_dv_3[45] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 22) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[45] ) && 
                 ~((rd_addr_l2b1_3 == 22) && !rd_en_l2b1_3);
assign l2b1_dv_3[46] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 23) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[46] ) && 
                 ~((rd_addr_l2b1_3 == 23) && !rd_en_l2b1_3);
assign l2b1_dv_3[47] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 23) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[47] ) && 
                 ~((rd_addr_l2b1_3 == 23) && !rd_en_l2b1_3);
assign l2b1_dv_3[48] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 24) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[48] ) && 
                 ~((rd_addr_l2b1_3 == 24) && !rd_en_l2b1_3);
assign l2b1_dv_3[49] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 24) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[49] ) && 
                 ~((rd_addr_l2b1_3 == 24) && !rd_en_l2b1_3);
assign l2b1_dv_3[50] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 25) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[50] ) && 
                 ~((rd_addr_l2b1_3 == 25) && !rd_en_l2b1_3);
assign l2b1_dv_3[51] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 25) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[51] ) && 
                 ~((rd_addr_l2b1_3 == 25) && !rd_en_l2b1_3);
assign l2b1_dv_3[52] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 26) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[52] ) && 
                 ~((rd_addr_l2b1_3 == 26) && !rd_en_l2b1_3);
assign l2b1_dv_3[53] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 26) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[53] ) && 
                 ~((rd_addr_l2b1_3 == 26) && !rd_en_l2b1_3);
assign l2b1_dv_3[54] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 27) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[54] ) && 
                 ~((rd_addr_l2b1_3 == 27) && !rd_en_l2b1_3);
assign l2b1_dv_3[55] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 27) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[55] ) && 
                 ~((rd_addr_l2b1_3 == 27) && !rd_en_l2b1_3);
assign l2b1_dv_3[56] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 28) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[56] ) && 
                 ~((rd_addr_l2b1_3 == 28) && !rd_en_l2b1_3);
assign l2b1_dv_3[57] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 28) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[57] ) && 
                 ~((rd_addr_l2b1_3 == 28) && !rd_en_l2b1_3);
assign l2b1_dv_3[58] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 29) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[58] ) && 
                 ~((rd_addr_l2b1_3 == 29) && !rd_en_l2b1_3);
assign l2b1_dv_3[59] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 29) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[59] ) && 
                 ~((rd_addr_l2b1_3 == 29) && !rd_en_l2b1_3);
assign l2b1_dv_3[60] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 30) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[60] ) && 
                 ~((rd_addr_l2b1_3 == 30) && !rd_en_l2b1_3);
assign l2b1_dv_3[61] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 30) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[61] ) && 
                 ~((rd_addr_l2b1_3 == 30) && !rd_en_l2b1_3);
assign l2b1_dv_3[62] =  ((!wr_en_l2b1_3[0] && (l2b1_wr_addr_3 == 31) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[62] ) && 
                 ~((rd_addr_l2b1_3 == 31) && !rd_en_l2b1_3);
assign l2b1_dv_3[63] =  ((!wr_en_l2b1_3[1] && (l2b1_wr_addr_3 == 31) && !dram_Ch3_l2b1_pa_err) || l2b1_dv_3_reg[63] ) && 
                 ~((rd_addr_l2b1_3 == 31) && !rd_en_l2b1_3);

always @(posedge (cmp_clk && enabled)) begin 
  if (~cmp_rst_l)
   begin
         l2b1_dv_3_reg <= 64'b0; 
   end
  else begin
         l2b1_dv_3_reg <= l2b1_dv_3;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  dram_rst_l_l2b1_3_1;
reg  [5:0] addr_reg_l2b1_3;
always @ (posedge (cmp_clk && enabled))
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
dram_rst_l_l2b1_3_1 <= #1 dram_rst_l;
addr_reg_l2b1_3     <= #1 {rd_en_l2b1_3, rd_addr_l2b1_3};

if (dram_rst_l_l2b1_3_1 && (~rd_en_l2b1_3) && 
   (addr_reg_l2b1_3 != {rd_en_l2b1_3, rd_addr_l2b1_3}) &&
   (rd_addr_l2b1_3[2:0] == 0) ) begin					// MAQ added condition to check only for 1st rd
/*mb156858 if (!l2b1_dv_3_reg[rd_addr_l2b1_3*2 + 0] || !l2b1_dv_3_reg[rd_addr_l2b1_3*2 + 1] || 
     !l2b1_dv_3_reg[rd_addr_l2b1_3*2 + 2] || !l2b1_dv_3_reg[rd_addr_l2b1_3*2 + 3] ||
     !l2b1_dv_3_reg[rd_addr_l2b1_3*2 + 4] || !l2b1_dv_3_reg[rd_addr_l2b1_3*2 + 5] ||
     !l2b1_dv_3_reg[rd_addr_l2b1_3*2 + 6] || !l2b1_dv_3_reg[rd_addr_l2b1_3*2 + 7]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_l2b1_3, l2b1_dv_3_reg);
     finish_test(" CAS Issued Data not valid ", 3);
  end */ 
end  
end  
end  


// ---- IF WRITE AND THE LOCATIONS DV ALREADY VALID -----

always @ (posedge (cmp_clk && enabled))
begin 
if (cmp_rst_l && (~wr_en_l2b1_3[0])) begin
 if (l2b1_dv_3_reg[l2b1_wr_addr_3*2 + 0]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b1_wr_addr_3,wr_en_l2b1_3, l2b1_dv_3_reg);
     finish_test(" Data Overwritten in write fifo ", 3);
  end  
end  
if (cmp_rst_l && (~wr_en_l2b1_3[1])) begin
 if (l2b1_dv_3_reg[l2b1_wr_addr_3*2 + 1]) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, l2b1_wr_addr_3,wr_en_l2b1_3, l2b1_dv_3_reg);
     finish_test(" Data Overwritten in write fifo ", 3);
  end  
end  
end  



// ----- WR Q VALID AND DATA WRITTEN ( OVERWRITTING AN EXISTING ENTRY ) -----

 reg [40:0] l2b0_wr_q_loc4_0;
always @ (dram_Ch0_l2b0_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_wr_q_loc4_0  = dram_Ch0_l2b0_wr_q[i];
    if ((dram_Ch0_l2b0_wr_que_wr_ptr[i] == 1'b1) && ((l2b0_wr_q_loc4_0[39] || l2b0_wr_q_loc4_0[40]) == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 0);
    end  
  end
end
end
 reg [40:0] l2b1_wr_q_loc4_0;
always @ (dram_Ch0_l2b1_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_wr_q_loc4_0  = dram_Ch0_l2b1_wr_q[i];
    if ((dram_Ch0_l2b1_wr_que_wr_ptr[i] == 1'b1) && ((l2b1_wr_q_loc4_0[39] || l2b1_wr_q_loc4_0[40]) == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 0);
    end  
  end
end
end
 reg [40:0] l2b0_wr_q_loc4_1;
always @ (dram_Ch1_l2b0_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_wr_q_loc4_1  = dram_Ch1_l2b0_wr_q[i];
    if ((dram_Ch1_l2b0_wr_que_wr_ptr[i] == 1'b1) && ((l2b0_wr_q_loc4_1[39] || l2b0_wr_q_loc4_1[40]) == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 1);
    end  
  end
end
end
 reg [40:0] l2b1_wr_q_loc4_1;
always @ (dram_Ch1_l2b1_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_wr_q_loc4_1  = dram_Ch1_l2b1_wr_q[i];
    if ((dram_Ch1_l2b1_wr_que_wr_ptr[i] == 1'b1) && ((l2b1_wr_q_loc4_1[39] || l2b1_wr_q_loc4_1[40]) == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 1);
    end  
  end
end
end
 reg [40:0] l2b0_wr_q_loc4_2;
always @ (dram_Ch2_l2b0_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_wr_q_loc4_2  = dram_Ch2_l2b0_wr_q[i];
    if ((dram_Ch2_l2b0_wr_que_wr_ptr[i] == 1'b1) && ((l2b0_wr_q_loc4_2[39] || l2b0_wr_q_loc4_2[40]) == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 2);
    end  
  end
end
end
 reg [40:0] l2b1_wr_q_loc4_2;
always @ (dram_Ch2_l2b1_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_wr_q_loc4_2  = dram_Ch2_l2b1_wr_q[i];
    if ((dram_Ch2_l2b1_wr_que_wr_ptr[i] == 1'b1) && ((l2b1_wr_q_loc4_2[39] || l2b1_wr_q_loc4_2[40]) == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 2);
    end  
  end
end
end
 reg [40:0] l2b0_wr_q_loc4_3;
always @ (dram_Ch3_l2b0_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_wr_q_loc4_3  = dram_Ch3_l2b0_wr_q[i];
    if ((dram_Ch3_l2b0_wr_que_wr_ptr[i] == 1'b1) && ((l2b0_wr_q_loc4_3[39] || l2b0_wr_q_loc4_3[40]) == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 3);
    end  
  end
end
end
 reg [40:0] l2b1_wr_q_loc4_3;
always @ (dram_Ch3_l2b1_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_wr_q_loc4_3  = dram_Ch3_l2b1_wr_q[i];
    if ((dram_Ch3_l2b1_wr_que_wr_ptr[i] == 1'b1) && ((l2b1_wr_q_loc4_3[39] || l2b1_wr_q_loc4_3[40]) == 1'b1)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 3);
    end  
  end
end
end

// ----- WR Q NOT VALID AND DATA READ ( RD_PTR FOR WR QUE ASSERTED )  -----

 reg [40:0] l2b0_wr_q_loc6_0;
always @ (posedge (`MCU_CLK && enabled))
//always @ (dram_Ch0_l2b0_wr_que_rd_ptr) 
begin 
     //`PR_DEBUG("mcusat_cov_mon", `DEBUG, " at time %0d dram_Ch0_l2b0_wr_que_rd_ptr = %x", $time, dram_Ch0_l2b0_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_wr_q_loc6_0  = dram_Ch0_l2b0_wr_q[i];
    if ((dram_Ch0_l2b0_wr_que_rd_ptr[i] == 1'b1) && (l2b0_wr_q_loc6_0[40] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "dram_Ch0_l2b0_wr_que_rd_ptr = %x", dram_Ch0_l2b0_wr_que_rd_ptr);
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 0);
    end  
  end
end
end
 reg [40:0] l2b1_wr_q_loc6_0;
always @ (posedge (`MCU_CLK && enabled))
//always @ (dram_Ch0_l2b1_wr_que_rd_ptr) 
begin 
     //`PR_DEBUG("mcusat_cov_mon", `DEBUG, " at time %0d dram_Ch0_l2b1_wr_que_rd_ptr = %x", $time, dram_Ch0_l2b1_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_wr_q_loc6_0  = dram_Ch0_l2b1_wr_q[i];
    if ((dram_Ch0_l2b1_wr_que_rd_ptr[i] == 1'b1) && (l2b1_wr_q_loc6_0[40] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "dram_Ch0_l2b1_wr_que_rd_ptr = %x", dram_Ch0_l2b1_wr_que_rd_ptr);
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 0);
    end  
  end
end
end
 reg [40:0] l2b0_wr_q_loc6_1;
always @ (posedge (`MCU_CLK && enabled))
//always @ (dram_Ch1_l2b0_wr_que_rd_ptr) 
begin 
     //`PR_DEBUG("mcusat_cov_mon", `DEBUG, " at time %0d dram_Ch1_l2b0_wr_que_rd_ptr = %x", $time, dram_Ch1_l2b0_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_wr_q_loc6_1  = dram_Ch1_l2b0_wr_q[i];
    if ((dram_Ch1_l2b0_wr_que_rd_ptr[i] == 1'b1) && (l2b0_wr_q_loc6_1[40] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "dram_Ch1_l2b0_wr_que_rd_ptr = %x", dram_Ch1_l2b0_wr_que_rd_ptr);
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 1);
    end  
  end
end
end
 reg [40:0] l2b1_wr_q_loc6_1;
always @ (posedge (`MCU_CLK && enabled))
//always @ (dram_Ch1_l2b1_wr_que_rd_ptr) 
begin 
     //`PR_DEBUG("mcusat_cov_mon", `DEBUG, " at time %0d dram_Ch1_l2b1_wr_que_rd_ptr = %x", $time, dram_Ch1_l2b1_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_wr_q_loc6_1  = dram_Ch1_l2b1_wr_q[i];
    if ((dram_Ch1_l2b1_wr_que_rd_ptr[i] == 1'b1) && (l2b1_wr_q_loc6_1[40] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "dram_Ch1_l2b1_wr_que_rd_ptr = %x", dram_Ch1_l2b1_wr_que_rd_ptr);
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 1);
    end  
  end
end
end
 reg [40:0] l2b0_wr_q_loc6_2;
always @ (posedge (`MCU_CLK && enabled))
//always @ (dram_Ch2_l2b0_wr_que_rd_ptr) 
begin 
     //`PR_DEBUG("mcusat_cov_mon", `DEBUG, " at time %0d dram_Ch2_l2b0_wr_que_rd_ptr = %x", $time, dram_Ch2_l2b0_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_wr_q_loc6_2  = dram_Ch2_l2b0_wr_q[i];
    if ((dram_Ch2_l2b0_wr_que_rd_ptr[i] == 1'b1) && (l2b0_wr_q_loc6_2[40] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "dram_Ch2_l2b0_wr_que_rd_ptr = %x", dram_Ch2_l2b0_wr_que_rd_ptr);
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 2);
    end  
  end
end
end
 reg [40:0] l2b1_wr_q_loc6_2;
always @ (posedge (`MCU_CLK && enabled))
//always @ (dram_Ch2_l2b1_wr_que_rd_ptr) 
begin 
     //`PR_DEBUG("mcusat_cov_mon", `DEBUG, " at time %0d dram_Ch2_l2b1_wr_que_rd_ptr = %x", $time, dram_Ch2_l2b1_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_wr_q_loc6_2  = dram_Ch2_l2b1_wr_q[i];
    if ((dram_Ch2_l2b1_wr_que_rd_ptr[i] == 1'b1) && (l2b1_wr_q_loc6_2[40] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "dram_Ch2_l2b1_wr_que_rd_ptr = %x", dram_Ch2_l2b1_wr_que_rd_ptr);
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 2);
    end  
  end
end
end
 reg [40:0] l2b0_wr_q_loc6_3;
always @ (posedge (`MCU_CLK && enabled))
//always @ (dram_Ch3_l2b0_wr_que_rd_ptr) 
begin 
     //`PR_DEBUG("mcusat_cov_mon", `DEBUG, " at time %0d dram_Ch3_l2b0_wr_que_rd_ptr = %x", $time, dram_Ch3_l2b0_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b0_wr_q_loc6_3  = dram_Ch3_l2b0_wr_q[i];
    if ((dram_Ch3_l2b0_wr_que_rd_ptr[i] == 1'b1) && (l2b0_wr_q_loc6_3[40] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "dram_Ch3_l2b0_wr_que_rd_ptr = %x", dram_Ch3_l2b0_wr_que_rd_ptr);
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 3);
    end  
  end
end
end
 reg [40:0] l2b1_wr_q_loc6_3;
always @ (posedge (`MCU_CLK && enabled))
//always @ (dram_Ch3_l2b1_wr_que_rd_ptr) 
begin 
     //`PR_DEBUG("mcusat_cov_mon", `DEBUG, " at time %0d dram_Ch3_l2b1_wr_que_rd_ptr = %x", $time, dram_Ch3_l2b1_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    l2b1_wr_q_loc6_3  = dram_Ch3_l2b1_wr_q[i];
    if ((dram_Ch3_l2b1_wr_que_rd_ptr[i] == 1'b1) && (l2b1_wr_q_loc6_3[40] == 1'b0)) begin 
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, "dram_Ch3_l2b1_wr_que_rd_ptr = %x", dram_Ch3_l2b1_wr_que_rd_ptr);
     `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 3);
    end  
  end
end
end


// ---- MONITOR ALLOCATION AND DEALLOCATION TIME FOR EACH ENTRY IN THE WR Q ----

reg [10:0]  dram_Ch0_l2b0_wr_q_cntr [7:0];
wire [10:0] dram_Ch0_l2b0_wr_q_cntr_0 = dram_Ch0_l2b0_wr_q_cntr[0];
wire [10:0] dram_Ch0_l2b0_wr_q_cntr_1 = dram_Ch0_l2b0_wr_q_cntr[1];
wire [10:0] dram_Ch0_l2b0_wr_q_cntr_2 = dram_Ch0_l2b0_wr_q_cntr[2];
wire [10:0] dram_Ch0_l2b0_wr_q_cntr_3 = dram_Ch0_l2b0_wr_q_cntr[3];
wire [10:0] dram_Ch0_l2b0_wr_q_cntr_4 = dram_Ch0_l2b0_wr_q_cntr[4];
wire [10:0] dram_Ch0_l2b0_wr_q_cntr_5 = dram_Ch0_l2b0_wr_q_cntr[5];
wire [10:0] dram_Ch0_l2b0_wr_q_cntr_6 = dram_Ch0_l2b0_wr_q_cntr[6];
wire [10:0] dram_Ch0_l2b0_wr_q_cntr_7 = dram_Ch0_l2b0_wr_q_cntr[7];


always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_l2b0_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b0_wr_q_loc7_0  = dram_Ch0_l2b0_wr_q[i];
      dram_Ch0_l2b0_wr_q_cntr[i] <= (l2b0_wr_q_loc7_0[39] == 1'b1) ? dram_Ch0_l2b0_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch0_l2b0_wr_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
         finish_test(" WR Q : Entry in write que for more that MAX_TIME clocks ", 0);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch0_l2b1_wr_q_cntr [7:0];
wire [10:0] dram_Ch0_l2b1_wr_q_cntr_0 = dram_Ch0_l2b1_wr_q_cntr[0];
wire [10:0] dram_Ch0_l2b1_wr_q_cntr_1 = dram_Ch0_l2b1_wr_q_cntr[1];
wire [10:0] dram_Ch0_l2b1_wr_q_cntr_2 = dram_Ch0_l2b1_wr_q_cntr[2];
wire [10:0] dram_Ch0_l2b1_wr_q_cntr_3 = dram_Ch0_l2b1_wr_q_cntr[3];
wire [10:0] dram_Ch0_l2b1_wr_q_cntr_4 = dram_Ch0_l2b1_wr_q_cntr[4];
wire [10:0] dram_Ch0_l2b1_wr_q_cntr_5 = dram_Ch0_l2b1_wr_q_cntr[5];
wire [10:0] dram_Ch0_l2b1_wr_q_cntr_6 = dram_Ch0_l2b1_wr_q_cntr[6];
wire [10:0] dram_Ch0_l2b1_wr_q_cntr_7 = dram_Ch0_l2b1_wr_q_cntr[7];


always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_l2b1_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b1_wr_q_loc7_0  = dram_Ch0_l2b1_wr_q[i];
      dram_Ch0_l2b1_wr_q_cntr[i] <= (l2b1_wr_q_loc7_0[39] == 1'b1) ? dram_Ch0_l2b1_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch0_l2b1_wr_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
         finish_test(" WR Q : Entry in write que for more that MAX_TIME clocks ", 0);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch1_l2b0_wr_q_cntr [7:0];
wire [10:0] dram_Ch1_l2b0_wr_q_cntr_0 = dram_Ch1_l2b0_wr_q_cntr[0];
wire [10:0] dram_Ch1_l2b0_wr_q_cntr_1 = dram_Ch1_l2b0_wr_q_cntr[1];
wire [10:0] dram_Ch1_l2b0_wr_q_cntr_2 = dram_Ch1_l2b0_wr_q_cntr[2];
wire [10:0] dram_Ch1_l2b0_wr_q_cntr_3 = dram_Ch1_l2b0_wr_q_cntr[3];
wire [10:0] dram_Ch1_l2b0_wr_q_cntr_4 = dram_Ch1_l2b0_wr_q_cntr[4];
wire [10:0] dram_Ch1_l2b0_wr_q_cntr_5 = dram_Ch1_l2b0_wr_q_cntr[5];
wire [10:0] dram_Ch1_l2b0_wr_q_cntr_6 = dram_Ch1_l2b0_wr_q_cntr[6];
wire [10:0] dram_Ch1_l2b0_wr_q_cntr_7 = dram_Ch1_l2b0_wr_q_cntr[7];


always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_l2b0_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b0_wr_q_loc7_1  = dram_Ch1_l2b0_wr_q[i];
      dram_Ch1_l2b0_wr_q_cntr[i] <= (l2b0_wr_q_loc7_1[39] == 1'b1) ? dram_Ch1_l2b0_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch1_l2b0_wr_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
         finish_test(" WR Q : Entry in write que for more that MAX_TIME clocks ", 1);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch1_l2b1_wr_q_cntr [7:0];
wire [10:0] dram_Ch1_l2b1_wr_q_cntr_0 = dram_Ch1_l2b1_wr_q_cntr[0];
wire [10:0] dram_Ch1_l2b1_wr_q_cntr_1 = dram_Ch1_l2b1_wr_q_cntr[1];
wire [10:0] dram_Ch1_l2b1_wr_q_cntr_2 = dram_Ch1_l2b1_wr_q_cntr[2];
wire [10:0] dram_Ch1_l2b1_wr_q_cntr_3 = dram_Ch1_l2b1_wr_q_cntr[3];
wire [10:0] dram_Ch1_l2b1_wr_q_cntr_4 = dram_Ch1_l2b1_wr_q_cntr[4];
wire [10:0] dram_Ch1_l2b1_wr_q_cntr_5 = dram_Ch1_l2b1_wr_q_cntr[5];
wire [10:0] dram_Ch1_l2b1_wr_q_cntr_6 = dram_Ch1_l2b1_wr_q_cntr[6];
wire [10:0] dram_Ch1_l2b1_wr_q_cntr_7 = dram_Ch1_l2b1_wr_q_cntr[7];


always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_l2b1_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b1_wr_q_loc7_1  = dram_Ch1_l2b1_wr_q[i];
      dram_Ch1_l2b1_wr_q_cntr[i] <= (l2b1_wr_q_loc7_1[39] == 1'b1) ? dram_Ch1_l2b1_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch1_l2b1_wr_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
         finish_test(" WR Q : Entry in write que for more that MAX_TIME clocks ", 1);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch2_l2b0_wr_q_cntr [7:0];
wire [10:0] dram_Ch2_l2b0_wr_q_cntr_0 = dram_Ch2_l2b0_wr_q_cntr[0];
wire [10:0] dram_Ch2_l2b0_wr_q_cntr_1 = dram_Ch2_l2b0_wr_q_cntr[1];
wire [10:0] dram_Ch2_l2b0_wr_q_cntr_2 = dram_Ch2_l2b0_wr_q_cntr[2];
wire [10:0] dram_Ch2_l2b0_wr_q_cntr_3 = dram_Ch2_l2b0_wr_q_cntr[3];
wire [10:0] dram_Ch2_l2b0_wr_q_cntr_4 = dram_Ch2_l2b0_wr_q_cntr[4];
wire [10:0] dram_Ch2_l2b0_wr_q_cntr_5 = dram_Ch2_l2b0_wr_q_cntr[5];
wire [10:0] dram_Ch2_l2b0_wr_q_cntr_6 = dram_Ch2_l2b0_wr_q_cntr[6];
wire [10:0] dram_Ch2_l2b0_wr_q_cntr_7 = dram_Ch2_l2b0_wr_q_cntr[7];


always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_l2b0_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b0_wr_q_loc7_2  = dram_Ch2_l2b0_wr_q[i];
      dram_Ch2_l2b0_wr_q_cntr[i] <= (l2b0_wr_q_loc7_2[39] == 1'b1) ? dram_Ch2_l2b0_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch2_l2b0_wr_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
         finish_test(" WR Q : Entry in write que for more that MAX_TIME clocks ", 2);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch2_l2b1_wr_q_cntr [7:0];
wire [10:0] dram_Ch2_l2b1_wr_q_cntr_0 = dram_Ch2_l2b1_wr_q_cntr[0];
wire [10:0] dram_Ch2_l2b1_wr_q_cntr_1 = dram_Ch2_l2b1_wr_q_cntr[1];
wire [10:0] dram_Ch2_l2b1_wr_q_cntr_2 = dram_Ch2_l2b1_wr_q_cntr[2];
wire [10:0] dram_Ch2_l2b1_wr_q_cntr_3 = dram_Ch2_l2b1_wr_q_cntr[3];
wire [10:0] dram_Ch2_l2b1_wr_q_cntr_4 = dram_Ch2_l2b1_wr_q_cntr[4];
wire [10:0] dram_Ch2_l2b1_wr_q_cntr_5 = dram_Ch2_l2b1_wr_q_cntr[5];
wire [10:0] dram_Ch2_l2b1_wr_q_cntr_6 = dram_Ch2_l2b1_wr_q_cntr[6];
wire [10:0] dram_Ch2_l2b1_wr_q_cntr_7 = dram_Ch2_l2b1_wr_q_cntr[7];


always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_l2b1_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b1_wr_q_loc7_2  = dram_Ch2_l2b1_wr_q[i];
      dram_Ch2_l2b1_wr_q_cntr[i] <= (l2b1_wr_q_loc7_2[39] == 1'b1) ? dram_Ch2_l2b1_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch2_l2b1_wr_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
         finish_test(" WR Q : Entry in write que for more that MAX_TIME clocks ", 2);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch3_l2b0_wr_q_cntr [7:0];
wire [10:0] dram_Ch3_l2b0_wr_q_cntr_0 = dram_Ch3_l2b0_wr_q_cntr[0];
wire [10:0] dram_Ch3_l2b0_wr_q_cntr_1 = dram_Ch3_l2b0_wr_q_cntr[1];
wire [10:0] dram_Ch3_l2b0_wr_q_cntr_2 = dram_Ch3_l2b0_wr_q_cntr[2];
wire [10:0] dram_Ch3_l2b0_wr_q_cntr_3 = dram_Ch3_l2b0_wr_q_cntr[3];
wire [10:0] dram_Ch3_l2b0_wr_q_cntr_4 = dram_Ch3_l2b0_wr_q_cntr[4];
wire [10:0] dram_Ch3_l2b0_wr_q_cntr_5 = dram_Ch3_l2b0_wr_q_cntr[5];
wire [10:0] dram_Ch3_l2b0_wr_q_cntr_6 = dram_Ch3_l2b0_wr_q_cntr[6];
wire [10:0] dram_Ch3_l2b0_wr_q_cntr_7 = dram_Ch3_l2b0_wr_q_cntr[7];


always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_l2b0_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b0_wr_q_loc7_3  = dram_Ch3_l2b0_wr_q[i];
      dram_Ch3_l2b0_wr_q_cntr[i] <= (l2b0_wr_q_loc7_3[39] == 1'b1) ? dram_Ch3_l2b0_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch3_l2b0_wr_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
         finish_test(" WR Q : Entry in write que for more that MAX_TIME clocks ", 3);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch3_l2b1_wr_q_cntr [7:0];
wire [10:0] dram_Ch3_l2b1_wr_q_cntr_0 = dram_Ch3_l2b1_wr_q_cntr[0];
wire [10:0] dram_Ch3_l2b1_wr_q_cntr_1 = dram_Ch3_l2b1_wr_q_cntr[1];
wire [10:0] dram_Ch3_l2b1_wr_q_cntr_2 = dram_Ch3_l2b1_wr_q_cntr[2];
wire [10:0] dram_Ch3_l2b1_wr_q_cntr_3 = dram_Ch3_l2b1_wr_q_cntr[3];
wire [10:0] dram_Ch3_l2b1_wr_q_cntr_4 = dram_Ch3_l2b1_wr_q_cntr[4];
wire [10:0] dram_Ch3_l2b1_wr_q_cntr_5 = dram_Ch3_l2b1_wr_q_cntr[5];
wire [10:0] dram_Ch3_l2b1_wr_q_cntr_6 = dram_Ch3_l2b1_wr_q_cntr[6];
wire [10:0] dram_Ch3_l2b1_wr_q_cntr_7 = dram_Ch3_l2b1_wr_q_cntr[7];


always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_l2b1_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      l2b1_wr_q_loc7_3  = dram_Ch3_l2b1_wr_q[i];
      dram_Ch3_l2b1_wr_q_cntr[i] <= (l2b1_wr_q_loc7_3[39] == 1'b1) ? dram_Ch3_l2b1_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch3_l2b1_wr_q_cntr[i] > MAX_TIME ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
         finish_test(" WR Q : Entry in write que for more that MAX_TIME clocks ", 3);
       end  
     end
    end
   end
end


// ---- Monitor a case when the wr_req comes when the queue is full. Then q goes from full to not full and that read is taken ----
reg [1:0] dram_l2b0_wr_req_q_full_Ch0_wr_taken_state;
wire      dram_l2b0_wr_q_full_Ch0_l2 = ((&dram_Ch0_l2b0_l2if_b0_wr_val) && (&dram_Ch0_l2b0_l2if_b1_wr_val));
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
    dram_l2b0_wr_req_q_full_Ch0_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_l2b0_wr_req_q_full_Ch0_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch0_l2b0_sctag_dram_wr_req && dram_l2b0_wr_q_full_Ch0_l2)
                 dram_l2b0_wr_req_q_full_Ch0_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch0_l2b0_sctag_dram_wr_req && ~dram_l2b0_wr_q_full_Ch0_l2)
                 dram_l2b0_wr_req_q_full_Ch0_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch0_l2b0_sctag_dram_wr_req)
                 dram_l2b0_wr_req_q_full_Ch0_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_l2b0_wr_req_q_full_Ch0_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_l2b0_wr_req_q_full_Ch0_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_l2b1_wr_req_q_full_Ch0_wr_taken_state;
wire      dram_l2b1_wr_q_full_Ch0_l2 = ((&dram_Ch0_l2b1_l2if_b0_wr_val) && (&dram_Ch0_l2b1_l2if_b1_wr_val));
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
    dram_l2b1_wr_req_q_full_Ch0_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_l2b1_wr_req_q_full_Ch0_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch0_l2b1_sctag_dram_wr_req && dram_l2b1_wr_q_full_Ch0_l2)
                 dram_l2b1_wr_req_q_full_Ch0_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch0_l2b1_sctag_dram_wr_req && ~dram_l2b1_wr_q_full_Ch0_l2)
                 dram_l2b1_wr_req_q_full_Ch0_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch0_l2b1_sctag_dram_wr_req)
                 dram_l2b1_wr_req_q_full_Ch0_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_l2b1_wr_req_q_full_Ch0_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_l2b1_wr_req_q_full_Ch0_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_l2b0_wr_req_q_full_Ch1_wr_taken_state;
wire      dram_l2b0_wr_q_full_Ch1_l2 = ((&dram_Ch1_l2b0_l2if_b0_wr_val) && (&dram_Ch1_l2b0_l2if_b1_wr_val));
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
    dram_l2b0_wr_req_q_full_Ch1_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_l2b0_wr_req_q_full_Ch1_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch1_l2b0_sctag_dram_wr_req && dram_l2b0_wr_q_full_Ch1_l2)
                 dram_l2b0_wr_req_q_full_Ch1_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch1_l2b0_sctag_dram_wr_req && ~dram_l2b0_wr_q_full_Ch1_l2)
                 dram_l2b0_wr_req_q_full_Ch1_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch1_l2b0_sctag_dram_wr_req)
                 dram_l2b0_wr_req_q_full_Ch1_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_l2b0_wr_req_q_full_Ch1_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_l2b0_wr_req_q_full_Ch1_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_l2b1_wr_req_q_full_Ch1_wr_taken_state;
wire      dram_l2b1_wr_q_full_Ch1_l2 = ((&dram_Ch1_l2b1_l2if_b0_wr_val) && (&dram_Ch1_l2b1_l2if_b1_wr_val));
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
    dram_l2b1_wr_req_q_full_Ch1_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_l2b1_wr_req_q_full_Ch1_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch1_l2b1_sctag_dram_wr_req && dram_l2b1_wr_q_full_Ch1_l2)
                 dram_l2b1_wr_req_q_full_Ch1_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch1_l2b1_sctag_dram_wr_req && ~dram_l2b1_wr_q_full_Ch1_l2)
                 dram_l2b1_wr_req_q_full_Ch1_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch1_l2b1_sctag_dram_wr_req)
                 dram_l2b1_wr_req_q_full_Ch1_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_l2b1_wr_req_q_full_Ch1_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_l2b1_wr_req_q_full_Ch1_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_l2b0_wr_req_q_full_Ch2_wr_taken_state;
wire      dram_l2b0_wr_q_full_Ch2_l2 = ((&dram_Ch2_l2b0_l2if_b0_wr_val) && (&dram_Ch2_l2b0_l2if_b1_wr_val));
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
    dram_l2b0_wr_req_q_full_Ch2_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_l2b0_wr_req_q_full_Ch2_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch2_l2b0_sctag_dram_wr_req && dram_l2b0_wr_q_full_Ch2_l2)
                 dram_l2b0_wr_req_q_full_Ch2_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch2_l2b0_sctag_dram_wr_req && ~dram_l2b0_wr_q_full_Ch2_l2)
                 dram_l2b0_wr_req_q_full_Ch2_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch2_l2b0_sctag_dram_wr_req)
                 dram_l2b0_wr_req_q_full_Ch2_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_l2b0_wr_req_q_full_Ch2_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_l2b0_wr_req_q_full_Ch2_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_l2b1_wr_req_q_full_Ch2_wr_taken_state;
wire      dram_l2b1_wr_q_full_Ch2_l2 = ((&dram_Ch2_l2b1_l2if_b0_wr_val) && (&dram_Ch2_l2b1_l2if_b1_wr_val));
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
    dram_l2b1_wr_req_q_full_Ch2_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_l2b1_wr_req_q_full_Ch2_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch2_l2b1_sctag_dram_wr_req && dram_l2b1_wr_q_full_Ch2_l2)
                 dram_l2b1_wr_req_q_full_Ch2_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch2_l2b1_sctag_dram_wr_req && ~dram_l2b1_wr_q_full_Ch2_l2)
                 dram_l2b1_wr_req_q_full_Ch2_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch2_l2b1_sctag_dram_wr_req)
                 dram_l2b1_wr_req_q_full_Ch2_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_l2b1_wr_req_q_full_Ch2_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_l2b1_wr_req_q_full_Ch2_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_l2b0_wr_req_q_full_Ch3_wr_taken_state;
wire      dram_l2b0_wr_q_full_Ch3_l2 = ((&dram_Ch3_l2b0_l2if_b0_wr_val) && (&dram_Ch3_l2b0_l2if_b1_wr_val));
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
    dram_l2b0_wr_req_q_full_Ch3_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_l2b0_wr_req_q_full_Ch3_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch3_l2b0_sctag_dram_wr_req && dram_l2b0_wr_q_full_Ch3_l2)
                 dram_l2b0_wr_req_q_full_Ch3_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch3_l2b0_sctag_dram_wr_req && ~dram_l2b0_wr_q_full_Ch3_l2)
                 dram_l2b0_wr_req_q_full_Ch3_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch3_l2b0_sctag_dram_wr_req)
                 dram_l2b0_wr_req_q_full_Ch3_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_l2b0_wr_req_q_full_Ch3_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_l2b0_wr_req_q_full_Ch3_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_l2b1_wr_req_q_full_Ch3_wr_taken_state;
wire      dram_l2b1_wr_q_full_Ch3_l2 = ((&dram_Ch3_l2b1_l2if_b0_wr_val) && (&dram_Ch3_l2b1_l2if_b1_wr_val));
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
    dram_l2b1_wr_req_q_full_Ch3_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_l2b1_wr_req_q_full_Ch3_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch3_l2b1_sctag_dram_wr_req && dram_l2b1_wr_q_full_Ch3_l2)
                 dram_l2b1_wr_req_q_full_Ch3_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch3_l2b1_sctag_dram_wr_req && ~dram_l2b1_wr_q_full_Ch3_l2)
                 dram_l2b1_wr_req_q_full_Ch3_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch3_l2b1_sctag_dram_wr_req)
                 dram_l2b1_wr_req_q_full_Ch3_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_l2b1_wr_req_q_full_Ch3_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_l2b1_wr_req_q_full_Ch3_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end


//  ---- MONITOR FOR OBSERVING THE OLDEST RD/WR TO THE BANK IS PICKED ----

reg [2:0] st_indx_rd_ch0_b0;
reg [2:0] st_indx_rd_tmp_ch0_b0;
reg [2:0] st_indx_wr_ch0_b0;
reg [2:0] st_indx_wr_tmp_ch0_b0;
reg [9:0] curr_bank_rd_ch0_b0;
reg [12:0] curr_bank_wr_ch0_b0;
reg       flag_l2b0_rd_0;
reg       flag_l2b0_wr_0;
reg [9:0] ltst_bank_l2b0_rd_0, curr_l2b0_rd_ent_0;
reg [12:0] ltst_bank_l2b0_wr_0, curr_l2b0_wr_ent_0;

always @ (posedge (`MCU_CLK && enabled))
begin	// {
  if (~dram_rst_l)
   begin
   end
  else begin	// { 
    //if (dram_Ch0_que_ras_bank_picked_en && dram_Ch0_que_b0_rd_picked && ~dram_Ch0_que_scrb_picked && ~dram_Ch0_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
// MAQ Removed this_ch_picked    if (dram_Ch0_que_this_ch_picked &&  ~dram_Ch0_que_scrb_picked && ~dram_Ch0_que_b0_cmd_picked) begin 
   if (dram_Ch0_que_b0_rd_picked && dram_ch0_drif_mclk_en) begin 	// {
      st_indx_rd_tmp_ch0_b0 = dram_Ch0_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b0_rd_0 = 0;
       for(i= 0;i<8;i=i+1) begin 	// {
        if(~flag_l2b0_rd_0) begin // {
         curr_l2b0_rd_ent_0 = dram_Ch0_l2b0_rd_colps_q[i];
         flag_l2b0_rd_0 = (dram_ch0_l2b0_drq_rd_queue_valid[i] && (curr_l2b0_rd_ent_0[5:3] == st_indx_rd_tmp_ch0_b0));
         curr_bank_rd_ch0_b0 = (flag_l2b0_rd_0) ? curr_l2b0_rd_ent_0 : 0;
         st_indx_rd_ch0_b0   = (flag_l2b0_rd_0) ? i : 7;
        end	// } if
       end // } for

      //curr_bank_rd_ch0_b0 = dram_Ch0_rd_colps_q[st_indx_rd_ch0_b0];
     for(i= st_indx_rd_ch0_b0-1;i>=0;i=i-1) begin	
       ltst_bank_l2b0_rd_0 = dram_Ch0_l2b0_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same

/*mb156858       if (({curr_bank_rd_ch0_b0[7:6], curr_bank_rd_ch0_b0[2:0]} == {ltst_bank_l2b0_rd_0[7:6], ltst_bank_l2b0_rd_0[2:0]}) && dram_ch0_l2b0_drq_rd_queue_valid[i]) begin // {
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x, rd_colps_q = %x", $time, st_indx_rd_ch0_b0, i,dram_Ch0_que_b0_index_picked, ltst_bank_l2b0_rd_0);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch0_l2b0_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 0);
       end */	// } if curr_bank
     end	// } for st_indx
    end	// } if rd_picked

    //if (dram_Ch0_que_ras_bank_picked_en && dram_Ch0_que_b0_wr_picked && ~dram_Ch0_que_scrb_picked && dram_Ch0_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
// MAQ removed this_ch_picked    if (dram_Ch0_que_this_ch_picked && ~dram_Ch0_que_scrb_picked && dram_Ch0_que_b0_cmd_picked) begin 
    if (dram_Ch0_que_b0_wr_picked && dram_ch0_drif_mclk_en) begin 
      st_indx_wr_tmp_ch0_b0 = dram_Ch0_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b0_wr_0 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_l2b0_wr_0) begin 
         curr_l2b0_wr_ent_0 = dram_Ch0_l2b0_wr_colps_q[i];
         flag_l2b0_wr_0 = (dram_ch0_l2b0_wr_q_valids[i] && (curr_l2b0_wr_ent_0[5:3] == st_indx_wr_tmp_ch0_b0));
         curr_bank_wr_ch0_b0 = (flag_l2b0_wr_0) ? curr_l2b0_wr_ent_0 : 0;
         st_indx_wr_ch0_b0   = (flag_l2b0_wr_0) ? i : 7; 
        end
       end

      //curr_bank_wr_ch0_b0 = dram_Ch0_wr_colps_q[st_indx_wr_ch0_b0];
     for(i= st_indx_wr_ch0_b0-1;i>=0;i=i-1) begin 		
       ltst_bank_l2b0_wr_0 = dram_Ch0_l2b0_wr_colps_q[i];

/*mb156858       if (({curr_bank_wr_ch0_b0[7:6], curr_bank_wr_ch0_b0[2:0]} == {ltst_bank_l2b0_wr_0[7:6], ltst_bank_l2b0_wr_0[2:0]}) && dram_ch0_l2b0_wr_q_valids[i] ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_ch0_b0, i,dram_Ch0_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch0_l2b0_wr_colps_q[j]);
          end
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d", $time, st_indx_wr_ch0_b0, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 0);
       end*/
     end
    end

  end	// } else

end	// } always

reg [2:0] st_indx_rd_ch0_b1;
reg [2:0] st_indx_rd_tmp_ch0_b1;
reg [2:0] st_indx_wr_ch0_b1;
reg [2:0] st_indx_wr_tmp_ch0_b1;
reg [9:0] curr_bank_rd_ch0_b1;
reg [12:0] curr_bank_wr_ch0_b1;
reg       flag_l2b1_rd_0;
reg       flag_l2b1_wr_0;
reg [9:0] ltst_bank_l2b1_rd_0, curr_l2b1_rd_ent_0;
reg [12:0] ltst_bank_l2b1_wr_0, curr_l2b1_wr_ent_0;

always @ (posedge (`MCU_CLK && enabled))
begin	// {
  if (~dram_rst_l)
   begin
   end
  else begin	// { 
    //if (dram_Ch0_que_ras_bank_picked_en && dram_Ch0_que_b0_rd_picked && ~dram_Ch0_que_scrb_picked && ~dram_Ch0_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
// MAQ Removed this_ch_picked    if (dram_Ch0_que_this_ch_picked &&  ~dram_Ch0_que_scrb_picked && ~dram_Ch0_que_b0_cmd_picked) begin 
   if (dram_Ch0_que_b1_rd_picked && dram_ch0_drif_mclk_en) begin 	// {
      st_indx_rd_tmp_ch0_b1 = dram_Ch0_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b1_rd_0 = 0;
       for(i= 0;i<8;i=i+1) begin 	// {
        if(~flag_l2b1_rd_0) begin // {
         curr_l2b1_rd_ent_0 = dram_Ch0_l2b1_rd_colps_q[i];
         flag_l2b1_rd_0 = (dram_ch0_l2b1_drq_rd_queue_valid[i] && (curr_l2b1_rd_ent_0[5:3] == st_indx_rd_tmp_ch0_b1));
         curr_bank_rd_ch0_b1 = (flag_l2b1_rd_0) ? curr_l2b1_rd_ent_0 : 0;
         st_indx_rd_ch0_b1   = (flag_l2b1_rd_0) ? i : 7;
        end	// } if
       end // } for

      //curr_bank_rd_ch0_b1 = dram_Ch0_rd_colps_q[st_indx_rd_ch0_b1];
     for(i= st_indx_rd_ch0_b1-1;i>=0;i=i-1) begin	
       ltst_bank_l2b1_rd_0 = dram_Ch0_l2b1_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same

/*mb156858       if (({curr_bank_rd_ch0_b1[7:6], curr_bank_rd_ch0_b1[2:0]} == {ltst_bank_l2b1_rd_0[7:6], ltst_bank_l2b1_rd_0[2:0]}) && dram_ch0_l2b1_drq_rd_queue_valid[i]) begin // {
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x, rd_colps_q = %x", $time, st_indx_rd_ch0_b1, i,dram_Ch0_que_b0_index_picked, ltst_bank_l2b1_rd_0);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch0_l2b1_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 0);
       end */	// } if curr_bank
     end	// } for st_indx
    end	// } if rd_picked

    //if (dram_Ch0_que_ras_bank_picked_en && dram_Ch0_que_b0_wr_picked && ~dram_Ch0_que_scrb_picked && dram_Ch0_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
// MAQ removed this_ch_picked    if (dram_Ch0_que_this_ch_picked && ~dram_Ch0_que_scrb_picked && dram_Ch0_que_b0_cmd_picked) begin 
    if (dram_Ch0_que_b1_wr_picked && dram_ch0_drif_mclk_en) begin 
      st_indx_wr_tmp_ch0_b1 = dram_Ch0_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b1_wr_0 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_l2b1_wr_0) begin 
         curr_l2b1_wr_ent_0 = dram_Ch0_l2b1_wr_colps_q[i];
         flag_l2b1_wr_0 = (dram_ch0_l2b1_wr_q_valids[i] && (curr_l2b1_wr_ent_0[5:3] == st_indx_wr_tmp_ch0_b1));
         curr_bank_wr_ch0_b1 = (flag_l2b1_wr_0) ? curr_l2b1_wr_ent_0 : 0;
         st_indx_wr_ch0_b1   = (flag_l2b1_wr_0) ? i : 7; 
        end
       end

      //curr_bank_wr_ch0_b1 = dram_Ch0_wr_colps_q[st_indx_wr_ch0_b1];
     for(i= st_indx_wr_ch0_b1-1;i>=0;i=i-1) begin 		
       ltst_bank_l2b1_wr_0 = dram_Ch0_l2b1_wr_colps_q[i];

/*mb156858       if (({curr_bank_wr_ch0_b1[7:6], curr_bank_wr_ch0_b1[2:0]} == {ltst_bank_l2b1_wr_0[7:6], ltst_bank_l2b1_wr_0[2:0]}) && dram_ch0_l2b1_wr_q_valids[i] ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_ch0_b1, i,dram_Ch0_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch0_l2b1_wr_colps_q[j]);
          end
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d", $time, st_indx_wr_ch0_b1, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 0);
       end*/
     end
    end

  end	// } else

end	// } always

reg [2:0] st_indx_rd_ch1_b0;
reg [2:0] st_indx_rd_tmp_ch1_b0;
reg [2:0] st_indx_wr_ch1_b0;
reg [2:0] st_indx_wr_tmp_ch1_b0;
reg [9:0] curr_bank_rd_ch1_b0;
reg [12:0] curr_bank_wr_ch1_b0;
reg       flag_l2b0_rd_1;
reg       flag_l2b0_wr_1;
reg [9:0] ltst_bank_l2b0_rd_1, curr_l2b0_rd_ent_1;
reg [12:0] ltst_bank_l2b0_wr_1, curr_l2b0_wr_ent_1;

always @ (posedge (`MCU_CLK && enabled))
begin	// {
  if (~dram_rst_l)
   begin
   end
  else begin	// { 
    //if (dram_Ch1_que_ras_bank_picked_en && dram_Ch1_que_b0_rd_picked && ~dram_Ch1_que_scrb_picked && ~dram_Ch1_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
// MAQ Removed this_ch_picked    if (dram_Ch1_que_this_ch_picked &&  ~dram_Ch1_que_scrb_picked && ~dram_Ch1_que_b0_cmd_picked) begin 
   if (dram_Ch1_que_b0_rd_picked && dram_ch1_drif_mclk_en) begin 	// {
      st_indx_rd_tmp_ch1_b0 = dram_Ch1_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b0_rd_1 = 0;
       for(i= 0;i<8;i=i+1) begin 	// {
        if(~flag_l2b0_rd_1) begin // {
         curr_l2b0_rd_ent_1 = dram_Ch1_l2b0_rd_colps_q[i];
         flag_l2b0_rd_1 = (dram_ch1_l2b0_drq_rd_queue_valid[i] && (curr_l2b0_rd_ent_1[5:3] == st_indx_rd_tmp_ch1_b0));
         curr_bank_rd_ch1_b0 = (flag_l2b0_rd_1) ? curr_l2b0_rd_ent_1 : 0;
         st_indx_rd_ch1_b0   = (flag_l2b0_rd_1) ? i : 7;
        end	// } if
       end // } for

      //curr_bank_rd_ch1_b0 = dram_Ch1_rd_colps_q[st_indx_rd_ch1_b0];
     for(i= st_indx_rd_ch1_b0-1;i>=0;i=i-1) begin	
       ltst_bank_l2b0_rd_1 = dram_Ch1_l2b0_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same

/*mb156858       if (({curr_bank_rd_ch1_b0[7:6], curr_bank_rd_ch1_b0[2:0]} == {ltst_bank_l2b0_rd_1[7:6], ltst_bank_l2b0_rd_1[2:0]}) && dram_ch1_l2b0_drq_rd_queue_valid[i]) begin // {
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x, rd_colps_q = %x", $time, st_indx_rd_ch1_b0, i,dram_Ch1_que_b0_index_picked, ltst_bank_l2b0_rd_1);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch1_l2b0_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 1);
       end */	// } if curr_bank
     end	// } for st_indx
    end	// } if rd_picked

    //if (dram_Ch1_que_ras_bank_picked_en && dram_Ch1_que_b0_wr_picked && ~dram_Ch1_que_scrb_picked && dram_Ch1_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
// MAQ removed this_ch_picked    if (dram_Ch1_que_this_ch_picked && ~dram_Ch1_que_scrb_picked && dram_Ch1_que_b0_cmd_picked) begin 
    if (dram_Ch1_que_b0_wr_picked && dram_ch1_drif_mclk_en) begin 
      st_indx_wr_tmp_ch1_b0 = dram_Ch1_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b0_wr_1 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_l2b0_wr_1) begin 
         curr_l2b0_wr_ent_1 = dram_Ch1_l2b0_wr_colps_q[i];
         flag_l2b0_wr_1 = (dram_ch1_l2b0_wr_q_valids[i] && (curr_l2b0_wr_ent_1[5:3] == st_indx_wr_tmp_ch1_b0));
         curr_bank_wr_ch1_b0 = (flag_l2b0_wr_1) ? curr_l2b0_wr_ent_1 : 0;
         st_indx_wr_ch1_b0   = (flag_l2b0_wr_1) ? i : 7; 
        end
       end

      //curr_bank_wr_ch1_b0 = dram_Ch1_wr_colps_q[st_indx_wr_ch1_b0];
     for(i= st_indx_wr_ch1_b0-1;i>=0;i=i-1) begin 		
       ltst_bank_l2b0_wr_1 = dram_Ch1_l2b0_wr_colps_q[i];

/*mb156858       if (({curr_bank_wr_ch1_b0[7:6], curr_bank_wr_ch1_b0[2:0]} == {ltst_bank_l2b0_wr_1[7:6], ltst_bank_l2b0_wr_1[2:0]}) && dram_ch1_l2b0_wr_q_valids[i] ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_ch1_b0, i,dram_Ch1_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch1_l2b0_wr_colps_q[j]);
          end
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d", $time, st_indx_wr_ch1_b0, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 1);
       end*/
     end
    end

  end	// } else

end	// } always

reg [2:0] st_indx_rd_ch1_b1;
reg [2:0] st_indx_rd_tmp_ch1_b1;
reg [2:0] st_indx_wr_ch1_b1;
reg [2:0] st_indx_wr_tmp_ch1_b1;
reg [9:0] curr_bank_rd_ch1_b1;
reg [12:0] curr_bank_wr_ch1_b1;
reg       flag_l2b1_rd_1;
reg       flag_l2b1_wr_1;
reg [9:0] ltst_bank_l2b1_rd_1, curr_l2b1_rd_ent_1;
reg [12:0] ltst_bank_l2b1_wr_1, curr_l2b1_wr_ent_1;

always @ (posedge (`MCU_CLK && enabled))
begin	// {
  if (~dram_rst_l)
   begin
   end
  else begin	// { 
    //if (dram_Ch1_que_ras_bank_picked_en && dram_Ch1_que_b0_rd_picked && ~dram_Ch1_que_scrb_picked && ~dram_Ch1_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
// MAQ Removed this_ch_picked    if (dram_Ch1_que_this_ch_picked &&  ~dram_Ch1_que_scrb_picked && ~dram_Ch1_que_b0_cmd_picked) begin 
   if (dram_Ch1_que_b1_rd_picked && dram_ch1_drif_mclk_en) begin 	// {
      st_indx_rd_tmp_ch1_b1 = dram_Ch1_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b1_rd_1 = 0;
       for(i= 0;i<8;i=i+1) begin 	// {
        if(~flag_l2b1_rd_1) begin // {
         curr_l2b1_rd_ent_1 = dram_Ch1_l2b1_rd_colps_q[i];
         flag_l2b1_rd_1 = (dram_ch1_l2b1_drq_rd_queue_valid[i] && (curr_l2b1_rd_ent_1[5:3] == st_indx_rd_tmp_ch1_b1));
         curr_bank_rd_ch1_b1 = (flag_l2b1_rd_1) ? curr_l2b1_rd_ent_1 : 0;
         st_indx_rd_ch1_b1   = (flag_l2b1_rd_1) ? i : 7;
        end	// } if
       end // } for

      //curr_bank_rd_ch1_b1 = dram_Ch1_rd_colps_q[st_indx_rd_ch1_b1];
     for(i= st_indx_rd_ch1_b1-1;i>=0;i=i-1) begin	
       ltst_bank_l2b1_rd_1 = dram_Ch1_l2b1_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same

/*mb156858       if (({curr_bank_rd_ch1_b1[7:6], curr_bank_rd_ch1_b1[2:0]} == {ltst_bank_l2b1_rd_1[7:6], ltst_bank_l2b1_rd_1[2:0]}) && dram_ch1_l2b1_drq_rd_queue_valid[i]) begin // {
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x, rd_colps_q = %x", $time, st_indx_rd_ch1_b1, i,dram_Ch1_que_b0_index_picked, ltst_bank_l2b1_rd_1);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch1_l2b1_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 1);
       end */	// } if curr_bank
     end	// } for st_indx
    end	// } if rd_picked

    //if (dram_Ch1_que_ras_bank_picked_en && dram_Ch1_que_b0_wr_picked && ~dram_Ch1_que_scrb_picked && dram_Ch1_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
// MAQ removed this_ch_picked    if (dram_Ch1_que_this_ch_picked && ~dram_Ch1_que_scrb_picked && dram_Ch1_que_b0_cmd_picked) begin 
    if (dram_Ch1_que_b1_wr_picked && dram_ch1_drif_mclk_en) begin 
      st_indx_wr_tmp_ch1_b1 = dram_Ch1_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b1_wr_1 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_l2b1_wr_1) begin 
         curr_l2b1_wr_ent_1 = dram_Ch1_l2b1_wr_colps_q[i];
         flag_l2b1_wr_1 = (dram_ch1_l2b1_wr_q_valids[i] && (curr_l2b1_wr_ent_1[5:3] == st_indx_wr_tmp_ch1_b1));
         curr_bank_wr_ch1_b1 = (flag_l2b1_wr_1) ? curr_l2b1_wr_ent_1 : 0;
         st_indx_wr_ch1_b1   = (flag_l2b1_wr_1) ? i : 7; 
        end
       end

      //curr_bank_wr_ch1_b1 = dram_Ch1_wr_colps_q[st_indx_wr_ch1_b1];
     for(i= st_indx_wr_ch1_b1-1;i>=0;i=i-1) begin 		
       ltst_bank_l2b1_wr_1 = dram_Ch1_l2b1_wr_colps_q[i];

/*mb156858       if (({curr_bank_wr_ch1_b1[7:6], curr_bank_wr_ch1_b1[2:0]} == {ltst_bank_l2b1_wr_1[7:6], ltst_bank_l2b1_wr_1[2:0]}) && dram_ch1_l2b1_wr_q_valids[i] ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_ch1_b1, i,dram_Ch1_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch1_l2b1_wr_colps_q[j]);
          end
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d", $time, st_indx_wr_ch1_b1, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 1);
       end*/
     end
    end

  end	// } else

end	// } always

reg [2:0] st_indx_rd_ch2_b0;
reg [2:0] st_indx_rd_tmp_ch2_b0;
reg [2:0] st_indx_wr_ch2_b0;
reg [2:0] st_indx_wr_tmp_ch2_b0;
reg [9:0] curr_bank_rd_ch2_b0;
reg [12:0] curr_bank_wr_ch2_b0;
reg       flag_l2b0_rd_2;
reg       flag_l2b0_wr_2;
reg [9:0] ltst_bank_l2b0_rd_2, curr_l2b0_rd_ent_2;
reg [12:0] ltst_bank_l2b0_wr_2, curr_l2b0_wr_ent_2;

always @ (posedge (`MCU_CLK && enabled))
begin	// {
  if (~dram_rst_l)
   begin
   end
  else begin	// { 
    //if (dram_Ch2_que_ras_bank_picked_en && dram_Ch2_que_b0_rd_picked && ~dram_Ch2_que_scrb_picked && ~dram_Ch2_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
// MAQ Removed this_ch_picked    if (dram_Ch2_que_this_ch_picked &&  ~dram_Ch2_que_scrb_picked && ~dram_Ch2_que_b0_cmd_picked) begin 
   if (dram_Ch2_que_b0_rd_picked && dram_ch2_drif_mclk_en) begin 	// {
      st_indx_rd_tmp_ch2_b0 = dram_Ch2_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b0_rd_2 = 0;
       for(i= 0;i<8;i=i+1) begin 	// {
        if(~flag_l2b0_rd_2) begin // {
         curr_l2b0_rd_ent_2 = dram_Ch2_l2b0_rd_colps_q[i];
         flag_l2b0_rd_2 = (dram_ch2_l2b0_drq_rd_queue_valid[i] && (curr_l2b0_rd_ent_2[5:3] == st_indx_rd_tmp_ch2_b0));
         curr_bank_rd_ch2_b0 = (flag_l2b0_rd_2) ? curr_l2b0_rd_ent_2 : 0;
         st_indx_rd_ch2_b0   = (flag_l2b0_rd_2) ? i : 7;
        end	// } if
       end // } for

      //curr_bank_rd_ch2_b0 = dram_Ch2_rd_colps_q[st_indx_rd_ch2_b0];
     for(i= st_indx_rd_ch2_b0-1;i>=0;i=i-1) begin	
       ltst_bank_l2b0_rd_2 = dram_Ch2_l2b0_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same

/*mb156858       if (({curr_bank_rd_ch2_b0[7:6], curr_bank_rd_ch2_b0[2:0]} == {ltst_bank_l2b0_rd_2[7:6], ltst_bank_l2b0_rd_2[2:0]}) && dram_ch2_l2b0_drq_rd_queue_valid[i]) begin // {
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x, rd_colps_q = %x", $time, st_indx_rd_ch2_b0, i,dram_Ch2_que_b0_index_picked, ltst_bank_l2b0_rd_2);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch2_l2b0_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 2);
       end */	// } if curr_bank
     end	// } for st_indx
    end	// } if rd_picked

    //if (dram_Ch2_que_ras_bank_picked_en && dram_Ch2_que_b0_wr_picked && ~dram_Ch2_que_scrb_picked && dram_Ch2_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
// MAQ removed this_ch_picked    if (dram_Ch2_que_this_ch_picked && ~dram_Ch2_que_scrb_picked && dram_Ch2_que_b0_cmd_picked) begin 
    if (dram_Ch2_que_b0_wr_picked && dram_ch2_drif_mclk_en) begin 
      st_indx_wr_tmp_ch2_b0 = dram_Ch2_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b0_wr_2 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_l2b0_wr_2) begin 
         curr_l2b0_wr_ent_2 = dram_Ch2_l2b0_wr_colps_q[i];
         flag_l2b0_wr_2 = (dram_ch2_l2b0_wr_q_valids[i] && (curr_l2b0_wr_ent_2[5:3] == st_indx_wr_tmp_ch2_b0));
         curr_bank_wr_ch2_b0 = (flag_l2b0_wr_2) ? curr_l2b0_wr_ent_2 : 0;
         st_indx_wr_ch2_b0   = (flag_l2b0_wr_2) ? i : 7; 
        end
       end

      //curr_bank_wr_ch2_b0 = dram_Ch2_wr_colps_q[st_indx_wr_ch2_b0];
     for(i= st_indx_wr_ch2_b0-1;i>=0;i=i-1) begin 		
       ltst_bank_l2b0_wr_2 = dram_Ch2_l2b0_wr_colps_q[i];

/*mb156858       if (({curr_bank_wr_ch2_b0[7:6], curr_bank_wr_ch2_b0[2:0]} == {ltst_bank_l2b0_wr_2[7:6], ltst_bank_l2b0_wr_2[2:0]}) && dram_ch2_l2b0_wr_q_valids[i] ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_ch2_b0, i,dram_Ch2_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch2_l2b0_wr_colps_q[j]);
          end
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d", $time, st_indx_wr_ch2_b0, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 2);
       end*/
     end
    end

  end	// } else

end	// } always

reg [2:0] st_indx_rd_ch2_b1;
reg [2:0] st_indx_rd_tmp_ch2_b1;
reg [2:0] st_indx_wr_ch2_b1;
reg [2:0] st_indx_wr_tmp_ch2_b1;
reg [9:0] curr_bank_rd_ch2_b1;
reg [12:0] curr_bank_wr_ch2_b1;
reg       flag_l2b1_rd_2;
reg       flag_l2b1_wr_2;
reg [9:0] ltst_bank_l2b1_rd_2, curr_l2b1_rd_ent_2;
reg [12:0] ltst_bank_l2b1_wr_2, curr_l2b1_wr_ent_2;

always @ (posedge (`MCU_CLK && enabled))
begin	// {
  if (~dram_rst_l)
   begin
   end
  else begin	// { 
    //if (dram_Ch2_que_ras_bank_picked_en && dram_Ch2_que_b0_rd_picked && ~dram_Ch2_que_scrb_picked && ~dram_Ch2_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
// MAQ Removed this_ch_picked    if (dram_Ch2_que_this_ch_picked &&  ~dram_Ch2_que_scrb_picked && ~dram_Ch2_que_b0_cmd_picked) begin 
   if (dram_Ch2_que_b1_rd_picked && dram_ch2_drif_mclk_en) begin 	// {
      st_indx_rd_tmp_ch2_b1 = dram_Ch2_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b1_rd_2 = 0;
       for(i= 0;i<8;i=i+1) begin 	// {
        if(~flag_l2b1_rd_2) begin // {
         curr_l2b1_rd_ent_2 = dram_Ch2_l2b1_rd_colps_q[i];
         flag_l2b1_rd_2 = (dram_ch2_l2b1_drq_rd_queue_valid[i] && (curr_l2b1_rd_ent_2[5:3] == st_indx_rd_tmp_ch2_b1));
         curr_bank_rd_ch2_b1 = (flag_l2b1_rd_2) ? curr_l2b1_rd_ent_2 : 0;
         st_indx_rd_ch2_b1   = (flag_l2b1_rd_2) ? i : 7;
        end	// } if
       end // } for

      //curr_bank_rd_ch2_b1 = dram_Ch2_rd_colps_q[st_indx_rd_ch2_b1];
     for(i= st_indx_rd_ch2_b1-1;i>=0;i=i-1) begin	
       ltst_bank_l2b1_rd_2 = dram_Ch2_l2b1_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same

/*mb156858       if (({curr_bank_rd_ch2_b1[7:6], curr_bank_rd_ch2_b1[2:0]} == {ltst_bank_l2b1_rd_2[7:6], ltst_bank_l2b1_rd_2[2:0]}) && dram_ch2_l2b1_drq_rd_queue_valid[i]) begin // {
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x, rd_colps_q = %x", $time, st_indx_rd_ch2_b1, i,dram_Ch2_que_b0_index_picked, ltst_bank_l2b1_rd_2);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch2_l2b1_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 2);
       end */	// } if curr_bank
     end	// } for st_indx
    end	// } if rd_picked

    //if (dram_Ch2_que_ras_bank_picked_en && dram_Ch2_que_b0_wr_picked && ~dram_Ch2_que_scrb_picked && dram_Ch2_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
// MAQ removed this_ch_picked    if (dram_Ch2_que_this_ch_picked && ~dram_Ch2_que_scrb_picked && dram_Ch2_que_b0_cmd_picked) begin 
    if (dram_Ch2_que_b1_wr_picked && dram_ch2_drif_mclk_en) begin 
      st_indx_wr_tmp_ch2_b1 = dram_Ch2_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b1_wr_2 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_l2b1_wr_2) begin 
         curr_l2b1_wr_ent_2 = dram_Ch2_l2b1_wr_colps_q[i];
         flag_l2b1_wr_2 = (dram_ch2_l2b1_wr_q_valids[i] && (curr_l2b1_wr_ent_2[5:3] == st_indx_wr_tmp_ch2_b1));
         curr_bank_wr_ch2_b1 = (flag_l2b1_wr_2) ? curr_l2b1_wr_ent_2 : 0;
         st_indx_wr_ch2_b1   = (flag_l2b1_wr_2) ? i : 7; 
        end
       end

      //curr_bank_wr_ch2_b1 = dram_Ch2_wr_colps_q[st_indx_wr_ch2_b1];
     for(i= st_indx_wr_ch2_b1-1;i>=0;i=i-1) begin 		
       ltst_bank_l2b1_wr_2 = dram_Ch2_l2b1_wr_colps_q[i];

/*mb156858       if (({curr_bank_wr_ch2_b1[7:6], curr_bank_wr_ch2_b1[2:0]} == {ltst_bank_l2b1_wr_2[7:6], ltst_bank_l2b1_wr_2[2:0]}) && dram_ch2_l2b1_wr_q_valids[i] ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_ch2_b1, i,dram_Ch2_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch2_l2b1_wr_colps_q[j]);
          end
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d", $time, st_indx_wr_ch2_b1, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 2);
       end*/
     end
    end

  end	// } else

end	// } always

reg [2:0] st_indx_rd_ch3_b0;
reg [2:0] st_indx_rd_tmp_ch3_b0;
reg [2:0] st_indx_wr_ch3_b0;
reg [2:0] st_indx_wr_tmp_ch3_b0;
reg [9:0] curr_bank_rd_ch3_b0;
reg [12:0] curr_bank_wr_ch3_b0;
reg       flag_l2b0_rd_3;
reg       flag_l2b0_wr_3;
reg [9:0] ltst_bank_l2b0_rd_3, curr_l2b0_rd_ent_3;
reg [12:0] ltst_bank_l2b0_wr_3, curr_l2b0_wr_ent_3;

always @ (posedge (`MCU_CLK && enabled))
begin	// {
  if (~dram_rst_l)
   begin
   end
  else begin	// { 
    //if (dram_Ch3_que_ras_bank_picked_en && dram_Ch3_que_b0_rd_picked && ~dram_Ch3_que_scrb_picked && ~dram_Ch3_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
// MAQ Removed this_ch_picked    if (dram_Ch3_que_this_ch_picked &&  ~dram_Ch3_que_scrb_picked && ~dram_Ch3_que_b0_cmd_picked) begin 
   if (dram_Ch3_que_b0_rd_picked && dram_ch3_drif_mclk_en) begin 	// {
      st_indx_rd_tmp_ch3_b0 = dram_Ch3_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b0_rd_3 = 0;
       for(i= 0;i<8;i=i+1) begin 	// {
        if(~flag_l2b0_rd_3) begin // {
         curr_l2b0_rd_ent_3 = dram_Ch3_l2b0_rd_colps_q[i];
         flag_l2b0_rd_3 = (dram_ch3_l2b0_drq_rd_queue_valid[i] && (curr_l2b0_rd_ent_3[5:3] == st_indx_rd_tmp_ch3_b0));
         curr_bank_rd_ch3_b0 = (flag_l2b0_rd_3) ? curr_l2b0_rd_ent_3 : 0;
         st_indx_rd_ch3_b0   = (flag_l2b0_rd_3) ? i : 7;
        end	// } if
       end // } for

      //curr_bank_rd_ch3_b0 = dram_Ch3_rd_colps_q[st_indx_rd_ch3_b0];
     for(i= st_indx_rd_ch3_b0-1;i>=0;i=i-1) begin	
       ltst_bank_l2b0_rd_3 = dram_Ch3_l2b0_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same

/*mb156858       if (({curr_bank_rd_ch3_b0[7:6], curr_bank_rd_ch3_b0[2:0]} == {ltst_bank_l2b0_rd_3[7:6], ltst_bank_l2b0_rd_3[2:0]}) && dram_ch3_l2b0_drq_rd_queue_valid[i]) begin // {
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x, rd_colps_q = %x", $time, st_indx_rd_ch3_b0, i,dram_Ch3_que_b0_index_picked, ltst_bank_l2b0_rd_3);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch3_l2b0_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 3);
       end */	// } if curr_bank
     end	// } for st_indx
    end	// } if rd_picked

    //if (dram_Ch3_que_ras_bank_picked_en && dram_Ch3_que_b0_wr_picked && ~dram_Ch3_que_scrb_picked && dram_Ch3_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
// MAQ removed this_ch_picked    if (dram_Ch3_que_this_ch_picked && ~dram_Ch3_que_scrb_picked && dram_Ch3_que_b0_cmd_picked) begin 
    if (dram_Ch3_que_b0_wr_picked && dram_ch3_drif_mclk_en) begin 
      st_indx_wr_tmp_ch3_b0 = dram_Ch3_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b0_wr_3 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_l2b0_wr_3) begin 
         curr_l2b0_wr_ent_3 = dram_Ch3_l2b0_wr_colps_q[i];
         flag_l2b0_wr_3 = (dram_ch3_l2b0_wr_q_valids[i] && (curr_l2b0_wr_ent_3[5:3] == st_indx_wr_tmp_ch3_b0));
         curr_bank_wr_ch3_b0 = (flag_l2b0_wr_3) ? curr_l2b0_wr_ent_3 : 0;
         st_indx_wr_ch3_b0   = (flag_l2b0_wr_3) ? i : 7; 
        end
       end

      //curr_bank_wr_ch3_b0 = dram_Ch3_wr_colps_q[st_indx_wr_ch3_b0];
     for(i= st_indx_wr_ch3_b0-1;i>=0;i=i-1) begin 		
       ltst_bank_l2b0_wr_3 = dram_Ch3_l2b0_wr_colps_q[i];

/*mb156858       if (({curr_bank_wr_ch3_b0[7:6], curr_bank_wr_ch3_b0[2:0]} == {ltst_bank_l2b0_wr_3[7:6], ltst_bank_l2b0_wr_3[2:0]}) && dram_ch3_l2b0_wr_q_valids[i] ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_ch3_b0, i,dram_Ch3_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch3_l2b0_wr_colps_q[j]);
          end
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d", $time, st_indx_wr_ch3_b0, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 3);
       end*/
     end
    end

  end	// } else

end	// } always

reg [2:0] st_indx_rd_ch3_b1;
reg [2:0] st_indx_rd_tmp_ch3_b1;
reg [2:0] st_indx_wr_ch3_b1;
reg [2:0] st_indx_wr_tmp_ch3_b1;
reg [9:0] curr_bank_rd_ch3_b1;
reg [12:0] curr_bank_wr_ch3_b1;
reg       flag_l2b1_rd_3;
reg       flag_l2b1_wr_3;
reg [9:0] ltst_bank_l2b1_rd_3, curr_l2b1_rd_ent_3;
reg [12:0] ltst_bank_l2b1_wr_3, curr_l2b1_wr_ent_3;

always @ (posedge (`MCU_CLK && enabled))
begin	// {
  if (~dram_rst_l)
   begin
   end
  else begin	// { 
    //if (dram_Ch3_que_ras_bank_picked_en && dram_Ch3_que_b0_rd_picked && ~dram_Ch3_que_scrb_picked && ~dram_Ch3_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
// MAQ Removed this_ch_picked    if (dram_Ch3_que_this_ch_picked &&  ~dram_Ch3_que_scrb_picked && ~dram_Ch3_que_b0_cmd_picked) begin 
   if (dram_Ch3_que_b1_rd_picked && dram_ch3_drif_mclk_en) begin 	// {
      st_indx_rd_tmp_ch3_b1 = dram_Ch3_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b1_rd_3 = 0;
       for(i= 0;i<8;i=i+1) begin 	// {
        if(~flag_l2b1_rd_3) begin // {
         curr_l2b1_rd_ent_3 = dram_Ch3_l2b1_rd_colps_q[i];
         flag_l2b1_rd_3 = (dram_ch3_l2b1_drq_rd_queue_valid[i] && (curr_l2b1_rd_ent_3[5:3] == st_indx_rd_tmp_ch3_b1));
         curr_bank_rd_ch3_b1 = (flag_l2b1_rd_3) ? curr_l2b1_rd_ent_3 : 0;
         st_indx_rd_ch3_b1   = (flag_l2b1_rd_3) ? i : 7;
        end	// } if
       end // } for

      //curr_bank_rd_ch3_b1 = dram_Ch3_rd_colps_q[st_indx_rd_ch3_b1];
     for(i= st_indx_rd_ch3_b1-1;i>=0;i=i-1) begin	
       ltst_bank_l2b1_rd_3 = dram_Ch3_l2b1_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same

/*mb156858       if (({curr_bank_rd_ch3_b1[7:6], curr_bank_rd_ch3_b1[2:0]} == {ltst_bank_l2b1_rd_3[7:6], ltst_bank_l2b1_rd_3[2:0]}) && dram_ch3_l2b1_drq_rd_queue_valid[i]) begin // {
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x, rd_colps_q = %x", $time, st_indx_rd_ch3_b1, i,dram_Ch3_que_b0_index_picked, ltst_bank_l2b1_rd_3);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch3_l2b1_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 3);
       end */	// } if curr_bank
     end	// } for st_indx
    end	// } if rd_picked

    //if (dram_Ch3_que_ras_bank_picked_en && dram_Ch3_que_b0_wr_picked && ~dram_Ch3_que_scrb_picked && dram_Ch3_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
// MAQ removed this_ch_picked    if (dram_Ch3_que_this_ch_picked && ~dram_Ch3_que_scrb_picked && dram_Ch3_que_b0_cmd_picked) begin 
    if (dram_Ch3_que_b1_wr_picked && dram_ch3_drif_mclk_en) begin 
      st_indx_wr_tmp_ch3_b1 = dram_Ch3_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_l2b1_wr_3 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_l2b1_wr_3) begin 
         curr_l2b1_wr_ent_3 = dram_Ch3_l2b1_wr_colps_q[i];
         flag_l2b1_wr_3 = (dram_ch3_l2b1_wr_q_valids[i] && (curr_l2b1_wr_ent_3[5:3] == st_indx_wr_tmp_ch3_b1));
         curr_bank_wr_ch3_b1 = (flag_l2b1_wr_3) ? curr_l2b1_wr_ent_3 : 0;
         st_indx_wr_ch3_b1   = (flag_l2b1_wr_3) ? i : 7; 
        end
       end

      //curr_bank_wr_ch3_b1 = dram_Ch3_wr_colps_q[st_indx_wr_ch3_b1];
     for(i= st_indx_wr_ch3_b1-1;i>=0;i=i-1) begin 		
       ltst_bank_l2b1_wr_3 = dram_Ch3_l2b1_wr_colps_q[i];

/*mb156858       if (({curr_bank_wr_ch3_b1[7:6], curr_bank_wr_ch3_b1[2:0]} == {ltst_bank_l2b1_wr_3[7:6], ltst_bank_l2b1_wr_3[2:0]}) && dram_ch3_l2b1_wr_q_valids[i] ) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_ch3_b1, i,dram_Ch3_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch3_l2b1_wr_colps_q[j]);
          end
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d select index = %d and index = %d", $time, st_indx_wr_ch3_b1, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 3);
       end*/
     end
    end

  end	// } else

end	// } always



// ---- Monitor Rd sequencing : when wr to same address pending , rd (same address as wr) should not be issued ----


reg [39:0] l2b0_rd_ent0_0;
always @(posedge dram_Ch0_l2b0_wr_q_0[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent0_0 =  dram_Ch0_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b0_wr_q_0[35:0] == l2b0_rd_ent0_0[35:0]) && l2b0_rd_ent0_0[39]) begin 
        if((dram_Ch0_l2b0_wr_q_0[35:0] == l2b0_rd_ent0_0[35:0]) && 
	    l2b0_rd_ent0_0[39] && 
	    dram_ch0_l2b0_rd_q_valids[i] &&
	   ~dram_ch0_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, l2b0_rd_ent0_0[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b0_rd_ent0_1;
always @(posedge dram_Ch0_l2b0_wr_q_1[39])
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent0_1 =  dram_Ch0_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b0_wr_q_1[35:0] == l2b0_rd_ent0_1[35:0]) && l2b0_rd_ent0_1[39]) begin 
        if((dram_Ch0_l2b0_wr_q_1[35:0] == l2b0_rd_ent0_1[35:0]) && 
	    l2b0_rd_ent0_1[39] && 
	    dram_ch0_l2b0_rd_q_valids[i] &&
	   ~dram_ch0_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, l2b0_rd_ent0_1[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b0_rd_ent0_2;
always @(posedge dram_Ch0_l2b0_wr_q_2[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent0_2 =  dram_Ch0_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b0_wr_q_2[35:0] == l2b0_rd_ent0_2[35:0]) && l2b0_rd_ent0_2[39]) begin 
        if((dram_Ch0_l2b0_wr_q_2[35:0] == l2b0_rd_ent0_2[35:0]) && 
	    l2b0_rd_ent0_2[39] && 
	    dram_ch0_l2b0_rd_q_valids[i] &&
	   ~dram_ch0_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, l2b0_rd_ent0_2[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b0_rd_ent0_3;
always @(posedge dram_Ch0_l2b0_wr_q_3[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent0_3 =  dram_Ch0_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b0_wr_q_3[35:0] == l2b0_rd_ent0_3[35:0]) && l2b0_rd_ent0_3[39]) begin 
        if((dram_Ch0_l2b0_wr_q_3[35:0] == l2b0_rd_ent0_3[35:0]) && 
	    l2b0_rd_ent0_3[39] && 
	    dram_ch0_l2b0_rd_q_valids[i] &&
	   ~dram_ch0_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, l2b0_rd_ent0_3[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b0_rd_ent0_4;
always @(posedge dram_Ch0_l2b0_wr_q_4[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent0_4 =  dram_Ch0_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b0_wr_q_4[35:0] == l2b0_rd_ent0_4[35:0]) && l2b0_rd_ent0_4[39]) begin 
        if((dram_Ch0_l2b0_wr_q_4[35:0] == l2b0_rd_ent0_4[35:0]) && 
	    l2b0_rd_ent0_4[39] && 
	    dram_ch0_l2b0_rd_q_valids[i] &&
	   ~dram_ch0_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, l2b0_rd_ent0_4[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b0_rd_ent0_5;
always @(posedge dram_Ch0_l2b0_wr_q_5[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent0_5 =  dram_Ch0_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b0_wr_q_5[35:0] == l2b0_rd_ent0_5[35:0]) && l2b0_rd_ent0_5[39]) begin 
        if((dram_Ch0_l2b0_wr_q_5[35:0] == l2b0_rd_ent0_5[35:0]) && 
	    l2b0_rd_ent0_5[39] && 
	    dram_ch0_l2b0_rd_q_valids[i] &&
	   ~dram_ch0_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, l2b0_rd_ent0_5[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b0_rd_ent0_6;
always @(posedge dram_Ch0_l2b0_wr_q_6[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent0_6 =  dram_Ch0_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b0_wr_q_6[35:0] == l2b0_rd_ent0_6[35:0]) && l2b0_rd_ent0_6[39]) begin 
        if((dram_Ch0_l2b0_wr_q_6[35:0] == l2b0_rd_ent0_6[35:0]) && 
	    l2b0_rd_ent0_6[39] && 
	    dram_ch0_l2b0_rd_q_valids[i] &&
	   ~dram_ch0_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, l2b0_rd_ent0_6[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b0_rd_ent0_7;
always @(posedge dram_Ch0_l2b0_wr_q_7[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent0_7 =  dram_Ch0_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b0_wr_q_7[35:0] == l2b0_rd_ent0_7[35:0]) && l2b0_rd_ent0_7[39]) begin 
        if((dram_Ch0_l2b0_wr_q_7[35:0] == l2b0_rd_ent0_7[35:0]) && 
	    l2b0_rd_ent0_7[39] && 
	    dram_ch0_l2b0_rd_q_valids[i] &&
	   ~dram_ch0_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, l2b0_rd_ent0_7[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b1_rd_ent0_0;
always @(posedge dram_Ch0_l2b1_wr_q_0[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent0_0 =  dram_Ch0_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b1_wr_q_0[35:0] == l2b1_rd_ent0_0[35:0]) && l2b1_rd_ent0_0[39]) begin 
        if((dram_Ch0_l2b1_wr_q_0[35:0] == l2b1_rd_ent0_0[35:0]) && 
	    l2b1_rd_ent0_0[39] && 
	    dram_ch0_l2b1_rd_q_valids[i] &&
	   ~dram_ch0_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, l2b1_rd_ent0_0[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end
reg [39:0] l2b1_rd_ent0_1;
always @(posedge dram_Ch0_l2b1_wr_q_1[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent0_1 =  dram_Ch0_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b1_wr_q_1[35:0] == l2b1_rd_ent0_1[35:0]) && l2b1_rd_ent0_1[39]) begin 
        if((dram_Ch0_l2b1_wr_q_1[35:0] == l2b1_rd_ent0_1[35:0]) && 
	    l2b1_rd_ent0_1[39] && 
	    dram_ch0_l2b1_rd_q_valids[i] &&
	   ~dram_ch0_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, l2b1_rd_ent0_1[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b1_rd_ent0_2;
always @(posedge dram_Ch0_l2b1_wr_q_2[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent0_2 =  dram_Ch0_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b1_wr_q_2[35:0] == l2b1_rd_ent0_2[35:0]) && l2b1_rd_ent0_2[39]) begin 
        if((dram_Ch0_l2b1_wr_q_2[35:0] == l2b1_rd_ent0_2[35:0]) && 
	    l2b1_rd_ent0_2[39] && 
	    dram_ch0_l2b1_rd_q_valids[i] &&
	   ~dram_ch0_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, l2b1_rd_ent0_2[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b1_rd_ent0_3;
always @(posedge dram_Ch0_l2b1_wr_q_3[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent0_3 =  dram_Ch0_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b1_wr_q_3[35:0] == l2b1_rd_ent0_3[35:0]) && l2b1_rd_ent0_3[39]) begin 
        if((dram_Ch0_l2b1_wr_q_3[35:0] == l2b1_rd_ent0_3[35:0]) && 
	    l2b1_rd_ent0_3[39] && 
	    dram_ch0_l2b1_rd_q_valids[i] &&
	   ~dram_ch0_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, l2b1_rd_ent0_3[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b1_rd_ent0_4;
always @(posedge dram_Ch0_l2b1_wr_q_4[39])
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent0_4 =  dram_Ch0_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b1_wr_q_4[35:0] == l2b1_rd_ent0_4[35:0]) && l2b1_rd_ent0_4[39]) begin 
        if((dram_Ch0_l2b1_wr_q_4[35:0] == l2b1_rd_ent0_4[35:0]) && 
	    l2b1_rd_ent0_4[39] && 
	    dram_ch0_l2b1_rd_q_valids[i] &&
	   ~dram_ch0_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, l2b1_rd_ent0_4[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b1_rd_ent0_5;
always @(posedge dram_Ch0_l2b1_wr_q_5[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent0_5 =  dram_Ch0_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b1_wr_q_5[35:0] == l2b1_rd_ent0_5[35:0]) && l2b1_rd_ent0_5[39]) begin 
        if((dram_Ch0_l2b1_wr_q_5[35:0] == l2b1_rd_ent0_5[35:0]) && 
	    l2b1_rd_ent0_5[39] && 
	    dram_ch0_l2b1_rd_q_valids[i] &&
	   ~dram_ch0_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, l2b1_rd_ent0_5[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b1_rd_ent0_6;
always @(posedge dram_Ch0_l2b1_wr_q_6[39])
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent0_6 =  dram_Ch0_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b1_wr_q_6[35:0] == l2b1_rd_ent0_6[35:0]) && l2b1_rd_ent0_6[39]) begin 
        if((dram_Ch0_l2b1_wr_q_6[35:0] == l2b1_rd_ent0_6[35:0]) && 
	    l2b1_rd_ent0_6[39] && 
	    dram_ch0_l2b1_rd_q_valids[i] &&
	   ~dram_ch0_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, l2b1_rd_ent0_6[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b1_rd_ent0_7;
always @(posedge dram_Ch0_l2b1_wr_q_7[39])
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent0_7 =  dram_Ch0_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch0_l2b1_wr_q_7[35:0] == l2b1_rd_ent0_7[35:0]) && l2b1_rd_ent0_7[39]) begin 
        if((dram_Ch0_l2b1_wr_q_7[35:0] == l2b1_rd_ent0_7[35:0]) && 
	    l2b1_rd_ent0_7[39] && 
	    dram_ch0_l2b1_rd_q_valids[i] &&
	   ~dram_ch0_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, l2b1_rd_ent0_7[34:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] l2b0_rd_ent1_0;
always @(posedge dram_Ch1_l2b0_wr_q_0[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent1_0 =  dram_Ch1_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b0_wr_q_0[35:0] == l2b0_rd_ent1_0[35:0]) && l2b0_rd_ent1_0[39]) begin 
        if((dram_Ch1_l2b0_wr_q_0[35:0] == l2b0_rd_ent1_0[35:0]) && 
	    l2b0_rd_ent1_0[39] && 
	    dram_ch1_l2b0_rd_q_valids[i] &&
	   ~dram_ch1_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, l2b0_rd_ent1_0[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end

reg [39:0] l2b0_rd_ent1_1;
always @(posedge dram_Ch1_l2b0_wr_q_1[39])
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent1_1 =  dram_Ch1_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b0_wr_q_1[35:0] == l2b0_rd_ent1_1[35:0]) && l2b0_rd_ent1_1[39]) begin 
        if((dram_Ch1_l2b0_wr_q_1[35:0] == l2b0_rd_ent1_1[35:0]) && 
	    l2b0_rd_ent1_1[39] && 
	    dram_ch1_l2b0_rd_q_valids[i] &&
	   ~dram_ch1_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, l2b0_rd_ent1_1[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b0_rd_ent1_2;
always @(posedge dram_Ch1_l2b0_wr_q_2[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent1_2 =  dram_Ch1_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b0_wr_q_2[35:0] == l2b0_rd_ent1_2[35:0]) && l2b0_rd_ent1_2[39]) begin 
        if((dram_Ch1_l2b0_wr_q_2[35:0] == l2b0_rd_ent1_2[35:0]) && 
	    l2b0_rd_ent1_2[39] && 
	    dram_ch1_l2b0_rd_q_valids[i] &&
	   ~dram_ch1_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, l2b0_rd_ent1_2[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b0_rd_ent1_3;
always @(posedge dram_Ch1_l2b0_wr_q_3[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent1_3 =  dram_Ch1_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b0_wr_q_3[35:0] == l2b0_rd_ent1_3[35:0]) && l2b0_rd_ent1_3[39]) begin 
        if((dram_Ch1_l2b0_wr_q_3[35:0] == l2b0_rd_ent1_3[35:0]) && 
	    l2b0_rd_ent1_3[39] && 
	    dram_ch1_l2b0_rd_q_valids[i] &&
	   ~dram_ch1_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, l2b0_rd_ent1_3[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b0_rd_ent1_4;
always @(posedge dram_Ch1_l2b0_wr_q_4[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent1_4 =  dram_Ch1_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b0_wr_q_4[35:0] == l2b0_rd_ent1_4[35:0]) && l2b0_rd_ent1_4[39]) begin 
        if((dram_Ch1_l2b0_wr_q_4[35:0] == l2b0_rd_ent1_4[35:0]) && 
	    l2b0_rd_ent1_4[39] && 
	    dram_ch1_l2b0_rd_q_valids[i] &&
	   ~dram_ch1_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, l2b0_rd_ent1_4[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b0_rd_ent1_5;
always @(posedge dram_Ch1_l2b0_wr_q_5[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent1_5 =  dram_Ch1_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b0_wr_q_5[35:0] == l2b0_rd_ent1_5[35:0]) && l2b0_rd_ent1_5[39]) begin 
        if((dram_Ch1_l2b0_wr_q_5[35:0] == l2b0_rd_ent1_5[35:0]) && 
	    l2b0_rd_ent1_5[39] && 
	    dram_ch1_l2b0_rd_q_valids[i] &&
	   ~dram_ch1_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, l2b0_rd_ent1_5[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b0_rd_ent1_6;
always @(posedge dram_Ch1_l2b0_wr_q_6[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent1_6 =  dram_Ch1_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b0_wr_q_6[35:0] == l2b0_rd_ent1_6[35:0]) && l2b0_rd_ent1_6[39]) begin 
        if((dram_Ch1_l2b0_wr_q_6[35:0] == l2b0_rd_ent1_6[35:0]) && 
	    l2b0_rd_ent1_6[39] && 
	    dram_ch1_l2b0_rd_q_valids[i] &&
	   ~dram_ch1_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, l2b0_rd_ent1_6[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b0_rd_ent1_7;
always @(posedge dram_Ch1_l2b0_wr_q_7[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent1_7 =  dram_Ch1_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b0_wr_q_7[35:0] == l2b0_rd_ent1_7[35:0]) && l2b0_rd_ent1_7[39]) begin 
        if((dram_Ch1_l2b0_wr_q_7[35:0] == l2b0_rd_ent1_7[35:0]) && 
	    l2b0_rd_ent1_7[39] && 
	    dram_ch1_l2b0_rd_q_valids[i] &&
	   ~dram_ch1_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, l2b0_rd_ent1_7[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b1_rd_ent1_0;
always @(posedge dram_Ch1_l2b1_wr_q_0[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent1_0 =  dram_Ch1_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b1_wr_q_0[35:0] == l2b1_rd_ent1_0[35:0]) && l2b1_rd_ent1_0[39]) begin 
        if((dram_Ch1_l2b1_wr_q_0[35:0] == l2b1_rd_ent1_0[35:0]) && 
	    l2b1_rd_ent1_0[39] && 
	    dram_ch1_l2b1_rd_q_valids[i] &&
	   ~dram_ch1_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, l2b1_rd_ent1_0[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b1_rd_ent1_1;
always @(posedge dram_Ch1_l2b1_wr_q_1[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent1_1 =  dram_Ch1_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b1_wr_q_1[35:0] == l2b1_rd_ent1_1[35:0]) && l2b1_rd_ent1_1[39]) begin 
        if((dram_Ch1_l2b1_wr_q_1[35:0] == l2b1_rd_ent1_1[35:0]) && 
	    l2b1_rd_ent1_1[39] && 
	    dram_ch1_l2b1_rd_q_valids[i] &&
	   ~dram_ch1_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, l2b1_rd_ent1_1[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b1_rd_ent1_2;
always @(posedge dram_Ch1_l2b1_wr_q_2[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent1_2 =  dram_Ch1_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b1_wr_q_2[35:0] == l2b1_rd_ent1_2[35:0]) && l2b1_rd_ent1_2[39]) begin 
        if((dram_Ch1_l2b1_wr_q_2[35:0] == l2b1_rd_ent1_2[35:0]) && 
	    l2b1_rd_ent1_2[39] && 
	    dram_ch1_l2b1_rd_q_valids[i] &&
	   ~dram_ch1_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, l2b1_rd_ent1_2[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b1_rd_ent1_3;
always @(posedge dram_Ch1_l2b1_wr_q_3[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent1_3 =  dram_Ch1_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b1_wr_q_3[35:0] == l2b1_rd_ent1_3[35:0]) && l2b1_rd_ent1_3[39]) begin 
        if((dram_Ch1_l2b1_wr_q_3[35:0] == l2b1_rd_ent1_3[35:0]) && 
	    l2b1_rd_ent1_3[39] && 
	    dram_ch1_l2b1_rd_q_valids[i] &&
	   ~dram_ch1_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, l2b1_rd_ent1_3[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b1_rd_ent1_4;
always @(posedge dram_Ch1_l2b1_wr_q_4[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent1_4 =  dram_Ch1_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b1_wr_q_4[35:0] == l2b1_rd_ent1_4[35:0]) && l2b1_rd_ent1_4[39]) begin 
        if((dram_Ch1_l2b1_wr_q_4[35:0] == l2b1_rd_ent1_4[35:0]) && 
	    l2b1_rd_ent1_4[39] && 
	    dram_ch1_l2b1_rd_q_valids[i] &&
	   ~dram_ch1_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, l2b1_rd_ent1_4[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b1_rd_ent1_5;
always @(posedge dram_Ch1_l2b1_wr_q_5[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent1_5 =  dram_Ch1_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b1_wr_q_5[35:0] == l2b1_rd_ent1_5[35:0]) && l2b1_rd_ent1_5[39]) begin 
        if((dram_Ch1_l2b1_wr_q_5[35:0] == l2b1_rd_ent1_5[35:0]) && 
	    l2b1_rd_ent1_5[39] && 
	    dram_ch1_l2b1_rd_q_valids[i] &&
	   ~dram_ch1_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, l2b1_rd_ent1_5[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b1_rd_ent1_6;
always @(posedge dram_Ch1_l2b1_wr_q_6[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent1_6 =  dram_Ch1_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b1_wr_q_6[35:0] == l2b1_rd_ent1_6[35:0]) && l2b1_rd_ent1_6[39]) begin 
        if((dram_Ch1_l2b1_wr_q_6[35:0] == l2b1_rd_ent1_6[35:0]) && 
	    l2b1_rd_ent1_6[39] && 
	    dram_ch1_l2b1_rd_q_valids[i] &&
	   ~dram_ch1_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, l2b1_rd_ent1_6[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b1_rd_ent1_7;
always @(posedge dram_Ch1_l2b1_wr_q_7[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent1_7 =  dram_Ch1_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch1_l2b1_wr_q_7[35:0] == l2b1_rd_ent1_7[35:0]) && l2b1_rd_ent1_7[39]) begin 
        if((dram_Ch1_l2b1_wr_q_7[35:0] == l2b1_rd_ent1_7[35:0]) && 
	    l2b1_rd_ent1_7[39] && 
	    dram_ch1_l2b1_rd_q_valids[i] &&
	   ~dram_ch1_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, l2b1_rd_ent1_7[34:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end
reg [39:0] l2b0_rd_ent2_0;
always @(posedge dram_Ch2_l2b0_wr_q_0[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent2_0 =  dram_Ch2_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b0_wr_q_0[35:0] == l2b0_rd_ent2_0[35:0]) && l2b0_rd_ent2_0[39]) begin 
        if((dram_Ch2_l2b0_wr_q_0[35:0] == l2b0_rd_ent2_0[35:0]) && 
	    l2b0_rd_ent2_0[39] && 
	    dram_ch2_l2b0_rd_q_valids[i] &&
	   ~dram_ch2_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, l2b0_rd_ent2_0[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b0_rd_ent2_1;
always @(posedge dram_Ch2_l2b0_wr_q_1[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent2_1 =  dram_Ch2_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b0_wr_q_1[35:0] == l2b0_rd_ent2_1[35:0]) && l2b0_rd_ent2_1[39]) begin 
        if((dram_Ch2_l2b0_wr_q_1[35:0] == l2b0_rd_ent2_1[35:0]) && 
	    l2b0_rd_ent2_1[39] && 
	    dram_ch2_l2b0_rd_q_valids[i] &&
	   ~dram_ch2_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, l2b0_rd_ent2_1[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b0_rd_ent2_2;
always @(posedge dram_Ch2_l2b0_wr_q_2[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent2_2 =  dram_Ch2_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b0_wr_q_2[35:0] == l2b0_rd_ent2_2[35:0]) && l2b0_rd_ent2_2[39]) begin 
        if((dram_Ch2_l2b0_wr_q_2[35:0] == l2b0_rd_ent2_2[35:0]) && 
	    l2b0_rd_ent2_2[39] && 
	    dram_ch2_l2b0_rd_q_valids[i] &&
	   ~dram_ch2_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, l2b0_rd_ent2_2[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b0_rd_ent2_3;
always @(posedge dram_Ch2_l2b0_wr_q_3[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent2_3 =  dram_Ch2_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b0_wr_q_3[35:0] == l2b0_rd_ent2_3[35:0]) && l2b0_rd_ent2_3[39]) begin 
        if((dram_Ch2_l2b0_wr_q_3[35:0] == l2b0_rd_ent2_3[35:0]) && 
	    l2b0_rd_ent2_3[39] && 
	    dram_ch2_l2b0_rd_q_valids[i] &&
	   ~dram_ch2_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, l2b0_rd_ent2_3[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b0_rd_ent2_4;
always @(posedge dram_Ch2_l2b0_wr_q_4[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent2_4 =  dram_Ch2_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b0_wr_q_4[35:0] == l2b0_rd_ent2_4[35:0]) && l2b0_rd_ent2_4[39]) begin 
        if((dram_Ch2_l2b0_wr_q_4[35:0] == l2b0_rd_ent2_4[35:0]) && 
	    l2b0_rd_ent2_4[39] && 
	    dram_ch2_l2b0_rd_q_valids[i] &&
	   ~dram_ch2_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, l2b0_rd_ent2_4[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b0_rd_ent2_5;
always @(posedge dram_Ch2_l2b0_wr_q_5[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent2_5 =  dram_Ch2_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b0_wr_q_5[35:0] == l2b0_rd_ent2_5[35:0]) && l2b0_rd_ent2_5[39]) begin 
        if((dram_Ch2_l2b0_wr_q_5[35:0] == l2b0_rd_ent2_5[35:0]) && 
	    l2b0_rd_ent2_5[39] && 
	    dram_ch2_l2b0_rd_q_valids[i] &&
	   ~dram_ch2_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, l2b0_rd_ent2_5[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b0_rd_ent2_6;
always @(posedge dram_Ch2_l2b0_wr_q_6[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent2_6 =  dram_Ch2_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b0_wr_q_6[35:0] == l2b0_rd_ent2_6[35:0]) && l2b0_rd_ent2_6[39]) begin 
        if((dram_Ch2_l2b0_wr_q_6[35:0] == l2b0_rd_ent2_6[35:0]) && 
	    l2b0_rd_ent2_6[39] && 
	    dram_ch2_l2b0_rd_q_valids[i] &&
	   ~dram_ch2_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, l2b0_rd_ent2_6[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b0_rd_ent2_7;
always @(posedge dram_Ch2_l2b0_wr_q_7[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent2_7 =  dram_Ch2_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b0_wr_q_7[35:0] == l2b0_rd_ent2_7[35:0]) && l2b0_rd_ent2_7[39]) begin 
        if((dram_Ch2_l2b0_wr_q_7[35:0] == l2b0_rd_ent2_7[35:0]) && 
	    l2b0_rd_ent2_7[39] && 
	    dram_ch2_l2b0_rd_q_valids[i] &&
	   ~dram_ch2_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, l2b0_rd_ent2_7[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b1_rd_ent2_0;
always @(posedge dram_Ch2_l2b1_wr_q_0[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent2_0 =  dram_Ch2_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b1_wr_q_0[35:0] == l2b1_rd_ent2_0[35:0]) && l2b1_rd_ent2_0[39]) begin 
        if((dram_Ch2_l2b1_wr_q_0[35:0] == l2b1_rd_ent2_0[35:0]) && 
	    l2b1_rd_ent2_0[39] && 
	    dram_ch2_l2b1_rd_q_valids[i] &&
	   ~dram_ch2_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, l2b1_rd_ent2_0[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b1_rd_ent2_1;
always @(posedge dram_Ch2_l2b1_wr_q_1[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent2_1 =  dram_Ch2_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b1_wr_q_1[35:0] == l2b1_rd_ent2_1[35:0]) && l2b1_rd_ent2_1[39]) begin 
        if((dram_Ch2_l2b1_wr_q_1[35:0] == l2b1_rd_ent2_1[35:0]) && 
	    l2b1_rd_ent2_1[39] && 
	    dram_ch2_l2b1_rd_q_valids[i] &&
	   ~dram_ch2_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, l2b1_rd_ent2_1[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b1_rd_ent2_2;
always @(posedge dram_Ch2_l2b1_wr_q_2[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent2_2 =  dram_Ch2_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b1_wr_q_2[35:0] == l2b1_rd_ent2_2[35:0]) && l2b1_rd_ent2_2[39]) begin 
        if((dram_Ch2_l2b1_wr_q_2[35:0] == l2b1_rd_ent2_2[35:0]) && 
	    l2b1_rd_ent2_2[39] && 
	    dram_ch2_l2b1_rd_q_valids[i] &&
	   ~dram_ch2_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, l2b1_rd_ent2_2[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b1_rd_ent2_3;
always @(posedge dram_Ch2_l2b1_wr_q_3[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent2_3 =  dram_Ch2_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b1_wr_q_3[35:0] == l2b1_rd_ent2_3[35:0]) && l2b1_rd_ent2_3[39]) begin 
        if((dram_Ch2_l2b1_wr_q_3[35:0] == l2b1_rd_ent2_3[35:0]) && 
	    l2b1_rd_ent2_3[39] && 
	    dram_ch2_l2b1_rd_q_valids[i] &&
	   ~dram_ch2_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, l2b1_rd_ent2_3[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b1_rd_ent2_4;
always @(posedge dram_Ch2_l2b1_wr_q_4[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent2_4 =  dram_Ch2_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b1_wr_q_4[35:0] == l2b1_rd_ent2_4[35:0]) && l2b1_rd_ent2_4[39]) begin 
        if((dram_Ch2_l2b1_wr_q_4[35:0] == l2b1_rd_ent2_4[35:0]) && 
	    l2b1_rd_ent2_4[39] && 
	    dram_ch2_l2b1_rd_q_valids[i] &&
	   ~dram_ch2_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, l2b1_rd_ent2_4[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b1_rd_ent2_5;
always @(posedge dram_Ch2_l2b1_wr_q_5[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent2_5 =  dram_Ch2_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b1_wr_q_5[35:0] == l2b1_rd_ent2_5[35:0]) && l2b1_rd_ent2_5[39]) begin 
        if((dram_Ch2_l2b1_wr_q_5[35:0] == l2b1_rd_ent2_5[35:0]) && 
	    l2b1_rd_ent2_5[39] && 
	    dram_ch2_l2b1_rd_q_valids[i] &&
	   ~dram_ch2_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, l2b1_rd_ent2_5[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b1_rd_ent2_6;
always @(posedge dram_Ch2_l2b1_wr_q_6[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent2_6 =  dram_Ch2_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b1_wr_q_6[35:0] == l2b1_rd_ent2_6[35:0]) && l2b1_rd_ent2_6[39]) begin 
        if((dram_Ch2_l2b1_wr_q_6[35:0] == l2b1_rd_ent2_6[35:0]) && 
	    l2b1_rd_ent2_6[39] && 
	    dram_ch2_l2b1_rd_q_valids[i] &&
	   ~dram_ch2_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, l2b1_rd_ent2_6[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] l2b1_rd_ent2_7;
always @(posedge dram_Ch2_l2b1_wr_q_7[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent2_7 =  dram_Ch2_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch2_l2b1_wr_q_7[35:0] == l2b1_rd_ent2_7[35:0]) && l2b1_rd_ent2_7[39]) begin 
        if((dram_Ch2_l2b1_wr_q_7[35:0] == l2b1_rd_ent2_7[35:0]) && 
	    l2b1_rd_ent2_7[39] && 
	    dram_ch2_l2b1_rd_q_valids[i] &&
	   ~dram_ch2_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, l2b1_rd_ent2_7[34:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end
reg [39:0] l2b0_rd_ent3_0;
always @(posedge dram_Ch3_l2b0_wr_q_0[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent3_0 =  dram_Ch3_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b0_wr_q_0[35:0] == l2b0_rd_ent3_0[35:0]) && l2b0_rd_ent3_0[39]) begin 
        if((dram_Ch3_l2b0_wr_q_0[35:0] == l2b0_rd_ent3_0[35:0]) && 
	    l2b0_rd_ent3_0[39] && 
	    dram_ch3_l2b0_rd_q_valids[i] &&
	   ~dram_ch3_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, l2b0_rd_ent3_0[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b0_rd_ent3_1;
always @(posedge dram_Ch3_l2b0_wr_q_1[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent3_1 =  dram_Ch3_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b0_wr_q_1[35:0] == l2b0_rd_ent3_1[35:0]) && l2b0_rd_ent3_1[39]) begin 
        if((dram_Ch3_l2b0_wr_q_1[35:0] == l2b0_rd_ent3_1[35:0]) && 
	    l2b0_rd_ent3_1[39] && 
	    dram_ch3_l2b0_rd_q_valids[i] &&
	   ~dram_ch3_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, l2b0_rd_ent3_1[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b0_rd_ent3_2;
always @(posedge dram_Ch3_l2b0_wr_q_2[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent3_2 =  dram_Ch3_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b0_wr_q_2[35:0] == l2b0_rd_ent3_2[35:0]) && l2b0_rd_ent3_2[39]) begin 
        if((dram_Ch3_l2b0_wr_q_2[35:0] == l2b0_rd_ent3_2[35:0]) && 
	    l2b0_rd_ent3_2[39] && 
	    dram_ch3_l2b0_rd_q_valids[i] &&
	   ~dram_ch3_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, l2b0_rd_ent3_2[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b0_rd_ent3_3;
always @(posedge dram_Ch3_l2b0_wr_q_3[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent3_3 =  dram_Ch3_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b0_wr_q_3[35:0] == l2b0_rd_ent3_3[35:0]) && l2b0_rd_ent3_3[39]) begin 
        if((dram_Ch3_l2b0_wr_q_3[35:0] == l2b0_rd_ent3_3[35:0]) && 
	    l2b0_rd_ent3_3[39] && 
	    dram_ch3_l2b0_rd_q_valids[i] &&
	   ~dram_ch3_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, l2b0_rd_ent3_3[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b0_rd_ent3_4;
always @(posedge dram_Ch3_l2b0_wr_q_4[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent3_4 =  dram_Ch3_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b0_wr_q_4[35:0] == l2b0_rd_ent3_4[35:0]) && l2b0_rd_ent3_4[39]) begin 
        if((dram_Ch3_l2b0_wr_q_4[35:0] == l2b0_rd_ent3_4[35:0]) && 
	    l2b0_rd_ent3_4[39] && 
	    dram_ch3_l2b0_rd_q_valids[i] &&
	   ~dram_ch3_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, l2b0_rd_ent3_4[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b0_rd_ent3_5;
always @(posedge dram_Ch3_l2b0_wr_q_5[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent3_5 =  dram_Ch3_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b0_wr_q_5[35:0] == l2b0_rd_ent3_5[35:0]) && l2b0_rd_ent3_5[39]) begin 
        if((dram_Ch3_l2b0_wr_q_5[35:0] == l2b0_rd_ent3_5[35:0]) && 
	    l2b0_rd_ent3_5[39] && 
	    dram_ch3_l2b0_rd_q_valids[i] &&
	   ~dram_ch3_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, l2b0_rd_ent3_5[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b0_rd_ent3_6;
always @(posedge dram_Ch3_l2b0_wr_q_6[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent3_6 =  dram_Ch3_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b0_wr_q_6[35:0] == l2b0_rd_ent3_6[35:0]) && l2b0_rd_ent3_6[39]) begin 
        if((dram_Ch3_l2b0_wr_q_6[35:0] == l2b0_rd_ent3_6[35:0]) && 
	    l2b0_rd_ent3_6[39] && 
	    dram_ch3_l2b0_rd_q_valids[i] &&
	   ~dram_ch3_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, l2b0_rd_ent3_6[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b0_rd_ent3_7;
always @(posedge dram_Ch3_l2b0_wr_q_7[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b0_rd_ent3_7 =  dram_Ch3_l2b0_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b0_wr_q_7[35:0] == l2b0_rd_ent3_7[35:0]) && l2b0_rd_ent3_7[39]) begin 
        if((dram_Ch3_l2b0_wr_q_7[35:0] == l2b0_rd_ent3_7[35:0]) && 
	    l2b0_rd_ent3_7[39] && 
	    dram_ch3_l2b0_rd_q_valids[i] &&
	   ~dram_ch3_l2b0_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, l2b0_rd_ent3_7[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b1_rd_ent3_0;
always @(posedge dram_Ch3_l2b1_wr_q_0[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent3_0 =  dram_Ch3_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b1_wr_q_0[35:0] == l2b1_rd_ent3_0[35:0]) && l2b1_rd_ent3_0[39]) begin 
        if((dram_Ch3_l2b1_wr_q_0[35:0] == l2b1_rd_ent3_0[35:0]) && 
	    l2b1_rd_ent3_0[39] && 
	    dram_ch3_l2b1_rd_q_valids[i] &&
	   ~dram_ch3_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, l2b1_rd_ent3_0[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b1_rd_ent3_1;
always @(posedge dram_Ch3_l2b1_wr_q_1[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent3_1 =  dram_Ch3_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b1_wr_q_1[35:0] == l2b1_rd_ent3_1[35:0]) && l2b1_rd_ent3_1[39]) begin 
        if((dram_Ch3_l2b1_wr_q_1[35:0] == l2b1_rd_ent3_1[35:0]) && 
	    l2b1_rd_ent3_1[39] && 
	    dram_ch3_l2b1_rd_q_valids[i] &&
	   ~dram_ch3_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, l2b1_rd_ent3_1[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b1_rd_ent3_2;
always @(posedge dram_Ch3_l2b1_wr_q_2[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent3_2 =  dram_Ch3_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b1_wr_q_2[35:0] == l2b1_rd_ent3_2[35:0]) && l2b1_rd_ent3_2[39]) begin 
        if((dram_Ch3_l2b1_wr_q_2[35:0] == l2b1_rd_ent3_2[35:0]) && 
	    l2b1_rd_ent3_2[39] && 
	    dram_ch3_l2b1_rd_q_valids[i] &&
	   ~dram_ch3_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, l2b1_rd_ent3_2[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b1_rd_ent3_3;
always @(posedge dram_Ch3_l2b1_wr_q_3[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent3_3 =  dram_Ch3_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b1_wr_q_3[35:0] == l2b1_rd_ent3_3[35:0]) && l2b1_rd_ent3_3[39]) begin 
        if((dram_Ch3_l2b1_wr_q_3[35:0] == l2b1_rd_ent3_3[35:0]) && 
	    l2b1_rd_ent3_3[39] && 
	    dram_ch3_l2b1_rd_q_valids[i] &&
	   ~dram_ch3_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, l2b1_rd_ent3_3[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b1_rd_ent3_4;
always @(posedge dram_Ch3_l2b1_wr_q_4[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent3_4 =  dram_Ch3_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b1_wr_q_4[35:0] == l2b1_rd_ent3_4[35:0]) && l2b1_rd_ent3_4[39]) begin 
        if((dram_Ch3_l2b1_wr_q_4[35:0] == l2b1_rd_ent3_4[35:0]) && 
	    l2b1_rd_ent3_4[39] && 
	    dram_ch3_l2b1_rd_q_valids[i] &&
	   ~dram_ch3_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, l2b1_rd_ent3_4[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b1_rd_ent3_5;
always @(posedge dram_Ch3_l2b1_wr_q_5[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent3_5 =  dram_Ch3_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b1_wr_q_5[35:0] == l2b1_rd_ent3_5[35:0]) && l2b1_rd_ent3_5[39]) begin 
        if((dram_Ch3_l2b1_wr_q_5[35:0] == l2b1_rd_ent3_5[35:0]) && 
	    l2b1_rd_ent3_5[39] && 
	    dram_ch3_l2b1_rd_q_valids[i] &&
	   ~dram_ch3_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, l2b1_rd_ent3_5[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b1_rd_ent3_6;
always @(posedge dram_Ch3_l2b1_wr_q_6[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent3_6 =  dram_Ch3_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b1_wr_q_6[35:0] == l2b1_rd_ent3_6[35:0]) && l2b1_rd_ent3_6[39]) begin 
        if((dram_Ch3_l2b1_wr_q_6[35:0] == l2b1_rd_ent3_6[35:0]) && 
	    l2b1_rd_ent3_6[39] && 
	    dram_ch3_l2b1_rd_q_valids[i] &&
	   ~dram_ch3_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, l2b1_rd_ent3_6[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end
reg [39:0] l2b1_rd_ent3_7;
always @(posedge dram_Ch3_l2b1_wr_q_7[39]) 
if (enabled)
begin 
      for (i=0;i<8;i=i+1) begin
        l2b1_rd_ent3_7 =  dram_Ch3_l2b1_rd_q[i];
// MAQ N2        if((dram_Ch3_l2b1_wr_q_7[35:0] == l2b1_rd_ent3_7[35:0]) && l2b1_rd_ent3_7[39]) begin 
        if((dram_Ch3_l2b1_wr_q_7[35:0] == l2b1_rd_ent3_7[35:0]) && 
	    l2b1_rd_ent3_7[39] && 
	    dram_ch3_l2b1_rd_q_valids[i] &&
	   ~dram_ch3_l2b1_rd_q_addr_err[i]) begin 
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
           `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, l2b1_rd_ent3_7[34:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end


// --- MONITOR THAT NO RD/WR REQUEST COMES BEFORE THE PREVIOUS ONE HAS BEEN ACKED ---

reg    dram_Ch0_l2b0_rd_record;
reg    dram_Ch0_l2b0_wr_record;
reg    dram_Ch0_l2b0_wr_vld_record;
reg [7:0]   dram_Ch0_l2b0_wr_vld_record_pipe;
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
          dram_Ch0_l2b0_rd_record <= 1'b0;
          dram_Ch0_l2b0_wr_record <= 1'b0;
          dram_Ch0_l2b0_wr_vld_record <= 1'b0;
          dram_Ch0_l2b0_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch0_l2b0_sctag_dram_rd_req) dram_Ch0_l2b0_rd_record  <= 1'b1;
     if (dram_Ch0_l2b0_dram_sctag_rd_ack) dram_Ch0_l2b0_rd_record  <= 1'b0;

      if (dram_Ch0_l2b0_rd_record && dram_Ch0_l2b0_sctag_dram_rd_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 0);
      end
      if (~dram_Ch0_l2b0_rd_record && dram_Ch0_l2b0_dram_sctag_rd_ack) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 0);
      end


     /**************************************************************************************** 
     // COVERAGE OF THIS CHECKER THRU MCUL2_INTF_CHECKER.V (0IN) CONTRAINTS 5.1 - 5.5
    
     // Write Req and ack
     if (dram_Ch0_l2b0_sctag_dram_wr_req) dram_Ch0_l2b0_wr_record  <= 1'b1;
     if (dram_Ch0_l2b0_dram_sctag_wr_ack) dram_Ch0_l2b0_wr_record  <= 1'b0;
     if (dram_Ch0_l2b0_sctag_dram_data_vld && dram_Ch0_l2b0_wr_record && !dram_Ch0_l2b0_wr_vld_record) begin 
         dram_Ch0_l2b0_wr_vld_record  <= 1'b1;
         dram_Ch0_l2b0_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch0_l2b0_sctag_dram_data_vld && dram_Ch0_l2b0_wr_vld_record) dram_Ch0_l2b0_wr_vld_record_pipe <= {dram_Ch0_l2b0_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch0_l2b0_wr_vld_record_pipe[6] && dram_Ch0_l2b0_sctag_dram_data_vld) begin 
         dram_Ch0_l2b0_wr_record  <= 1'b0;
         dram_Ch0_l2b0_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch0_l2b0_wr_record || dram_Ch0_l2b0_wr_vld_record) && dram_Ch0_l2b0_sctag_dram_wr_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 0);
      end
      if (~dram_Ch0_l2b0_wr_record && dram_Ch0_l2b0_dram_sctag_wr_ack) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 0);
      end
      if (~dram_Ch0_l2b0_wr_record && dram_Ch0_l2b0_sctag_dram_data_vld) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 0);
      end
      ************************************************************************************************/

   
  end
end

reg    dram_Ch0_l2b1_rd_record;
reg    dram_Ch0_l2b1_wr_record;
reg    dram_Ch0_l2b1_wr_vld_record;
reg [7:0]   dram_Ch0_l2b1_wr_vld_record_pipe;
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
          dram_Ch0_l2b1_rd_record <= 1'b0;
          dram_Ch0_l2b1_wr_record <= 1'b0;
          dram_Ch0_l2b1_wr_vld_record <= 1'b0;
          dram_Ch0_l2b1_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch0_l2b1_sctag_dram_rd_req) dram_Ch0_l2b1_rd_record  <= 1'b1;
     if (dram_Ch0_l2b1_dram_sctag_rd_ack) dram_Ch0_l2b1_rd_record  <= 1'b0;

      if (dram_Ch0_l2b1_rd_record && dram_Ch0_l2b1_sctag_dram_rd_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 0);
      end
      if (~dram_Ch0_l2b1_rd_record && dram_Ch0_l2b1_dram_sctag_rd_ack) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 0);
      end


     /**************************************************************************************** 
     // COVERAGE OF THIS CHECKER THRU MCUL2_INTF_CHECKER.V (0IN) CONTRAINTS 5.1 - 5.5
    
     // Write Req and ack
     if (dram_Ch0_l2b1_sctag_dram_wr_req) dram_Ch0_l2b1_wr_record  <= 1'b1;
     if (dram_Ch0_l2b1_dram_sctag_wr_ack) dram_Ch0_l2b1_wr_record  <= 1'b0;
     if (dram_Ch0_l2b1_sctag_dram_data_vld && dram_Ch0_l2b1_wr_record && !dram_Ch0_l2b1_wr_vld_record) begin 
         dram_Ch0_l2b1_wr_vld_record  <= 1'b1;
         dram_Ch0_l2b1_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch0_l2b1_sctag_dram_data_vld && dram_Ch0_l2b1_wr_vld_record) dram_Ch0_l2b1_wr_vld_record_pipe <= {dram_Ch0_l2b1_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch0_l2b1_wr_vld_record_pipe[6] && dram_Ch0_l2b1_sctag_dram_data_vld) begin 
         dram_Ch0_l2b1_wr_record  <= 1'b0;
         dram_Ch0_l2b1_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch0_l2b1_wr_record || dram_Ch0_l2b1_wr_vld_record) && dram_Ch0_l2b1_sctag_dram_wr_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 0);
      end
      if (~dram_Ch0_l2b1_wr_record && dram_Ch0_l2b1_dram_sctag_wr_ack) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 0);
      end
      if (~dram_Ch0_l2b1_wr_record && dram_Ch0_l2b1_sctag_dram_data_vld) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 0);
      end
      ************************************************************************************************/

   
  end
end

reg    dram_Ch1_l2b0_rd_record;
reg    dram_Ch1_l2b0_wr_record;
reg    dram_Ch1_l2b0_wr_vld_record;
reg [7:0]   dram_Ch1_l2b0_wr_vld_record_pipe;
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
          dram_Ch1_l2b0_rd_record <= 1'b0;
          dram_Ch1_l2b0_wr_record <= 1'b0;
          dram_Ch1_l2b0_wr_vld_record <= 1'b0;
          dram_Ch1_l2b0_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch1_l2b0_sctag_dram_rd_req) dram_Ch1_l2b0_rd_record  <= 1'b1;
     if (dram_Ch1_l2b0_dram_sctag_rd_ack) dram_Ch1_l2b0_rd_record  <= 1'b0;

      if (dram_Ch1_l2b0_rd_record && dram_Ch1_l2b0_sctag_dram_rd_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 1);
      end
      if (~dram_Ch1_l2b0_rd_record && dram_Ch1_l2b0_dram_sctag_rd_ack) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 1);
      end


     /**************************************************************************************** 
     // COVERAGE OF THIS CHECKER THRU MCUL2_INTF_CHECKER.V (0IN) CONTRAINTS 5.1 - 5.5
    
     // Write Req and ack
     if (dram_Ch1_l2b0_sctag_dram_wr_req) dram_Ch1_l2b0_wr_record  <= 1'b1;
     if (dram_Ch1_l2b0_dram_sctag_wr_ack) dram_Ch1_l2b0_wr_record  <= 1'b0;
     if (dram_Ch1_l2b0_sctag_dram_data_vld && dram_Ch1_l2b0_wr_record && !dram_Ch1_l2b0_wr_vld_record) begin 
         dram_Ch1_l2b0_wr_vld_record  <= 1'b1;
         dram_Ch1_l2b0_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch1_l2b0_sctag_dram_data_vld && dram_Ch1_l2b0_wr_vld_record) dram_Ch1_l2b0_wr_vld_record_pipe <= {dram_Ch1_l2b0_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch1_l2b0_wr_vld_record_pipe[6] && dram_Ch1_l2b0_sctag_dram_data_vld) begin 
         dram_Ch1_l2b0_wr_record  <= 1'b0;
         dram_Ch1_l2b0_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch1_l2b0_wr_record || dram_Ch1_l2b0_wr_vld_record) && dram_Ch1_l2b0_sctag_dram_wr_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 1);
      end
      if (~dram_Ch1_l2b0_wr_record && dram_Ch1_l2b0_dram_sctag_wr_ack) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 1);
      end
      if (~dram_Ch1_l2b0_wr_record && dram_Ch1_l2b0_sctag_dram_data_vld) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 1);
      end
      ************************************************************************************************/

   
  end
end

reg    dram_Ch1_l2b1_rd_record;
reg    dram_Ch1_l2b1_wr_record;
reg    dram_Ch1_l2b1_wr_vld_record;
reg [7:0]   dram_Ch1_l2b1_wr_vld_record_pipe;
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
          dram_Ch1_l2b1_rd_record <= 1'b0;
          dram_Ch1_l2b1_wr_record <= 1'b0;
          dram_Ch1_l2b1_wr_vld_record <= 1'b0;
          dram_Ch1_l2b1_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch1_l2b1_sctag_dram_rd_req) dram_Ch1_l2b1_rd_record  <= 1'b1;
     if (dram_Ch1_l2b1_dram_sctag_rd_ack) dram_Ch1_l2b1_rd_record  <= 1'b0;

      if (dram_Ch1_l2b1_rd_record && dram_Ch1_l2b1_sctag_dram_rd_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 1);
      end
      if (~dram_Ch1_l2b1_rd_record && dram_Ch1_l2b1_dram_sctag_rd_ack) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 1);
      end


     /**************************************************************************************** 
     // COVERAGE OF THIS CHECKER THRU MCUL2_INTF_CHECKER.V (0IN) CONTRAINTS 5.1 - 5.5
    
     // Write Req and ack
     if (dram_Ch1_l2b1_sctag_dram_wr_req) dram_Ch1_l2b1_wr_record  <= 1'b1;
     if (dram_Ch1_l2b1_dram_sctag_wr_ack) dram_Ch1_l2b1_wr_record  <= 1'b0;
     if (dram_Ch1_l2b1_sctag_dram_data_vld && dram_Ch1_l2b1_wr_record && !dram_Ch1_l2b1_wr_vld_record) begin 
         dram_Ch1_l2b1_wr_vld_record  <= 1'b1;
         dram_Ch1_l2b1_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch1_l2b1_sctag_dram_data_vld && dram_Ch1_l2b1_wr_vld_record) dram_Ch1_l2b1_wr_vld_record_pipe <= {dram_Ch1_l2b1_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch1_l2b1_wr_vld_record_pipe[6] && dram_Ch1_l2b1_sctag_dram_data_vld) begin 
         dram_Ch1_l2b1_wr_record  <= 1'b0;
         dram_Ch1_l2b1_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch1_l2b1_wr_record || dram_Ch1_l2b1_wr_vld_record) && dram_Ch1_l2b1_sctag_dram_wr_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 1);
      end
      if (~dram_Ch1_l2b1_wr_record && dram_Ch1_l2b1_dram_sctag_wr_ack) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 1);
      end
      if (~dram_Ch1_l2b1_wr_record && dram_Ch1_l2b1_sctag_dram_data_vld) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 1);
      end
      ************************************************************************************************/

   
  end
end

reg    dram_Ch2_l2b0_rd_record;
reg    dram_Ch2_l2b0_wr_record;
reg    dram_Ch2_l2b0_wr_vld_record;
reg [7:0]   dram_Ch2_l2b0_wr_vld_record_pipe;
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
          dram_Ch2_l2b0_rd_record <= 1'b0;
          dram_Ch2_l2b0_wr_record <= 1'b0;
          dram_Ch2_l2b0_wr_vld_record <= 1'b0;
          dram_Ch2_l2b0_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch2_l2b0_sctag_dram_rd_req) dram_Ch2_l2b0_rd_record  <= 1'b1;
     if (dram_Ch2_l2b0_dram_sctag_rd_ack) dram_Ch2_l2b0_rd_record  <= 1'b0;

      if (dram_Ch2_l2b0_rd_record && dram_Ch2_l2b0_sctag_dram_rd_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 2);
      end
      if (~dram_Ch2_l2b0_rd_record && dram_Ch2_l2b0_dram_sctag_rd_ack) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 2);
      end


     /**************************************************************************************** 
     // COVERAGE OF THIS CHECKER THRU MCUL2_INTF_CHECKER.V (0IN) CONTRAINTS 5.1 - 5.5
    
     // Write Req and ack
     if (dram_Ch2_l2b0_sctag_dram_wr_req) dram_Ch2_l2b0_wr_record  <= 1'b1;
     if (dram_Ch2_l2b0_dram_sctag_wr_ack) dram_Ch2_l2b0_wr_record  <= 1'b0;
     if (dram_Ch2_l2b0_sctag_dram_data_vld && dram_Ch2_l2b0_wr_record && !dram_Ch2_l2b0_wr_vld_record) begin 
         dram_Ch2_l2b0_wr_vld_record  <= 1'b1;
         dram_Ch2_l2b0_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch2_l2b0_sctag_dram_data_vld && dram_Ch2_l2b0_wr_vld_record) dram_Ch2_l2b0_wr_vld_record_pipe <= {dram_Ch2_l2b0_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch2_l2b0_wr_vld_record_pipe[6] && dram_Ch2_l2b0_sctag_dram_data_vld) begin 
         dram_Ch2_l2b0_wr_record  <= 1'b0;
         dram_Ch2_l2b0_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch2_l2b0_wr_record || dram_Ch2_l2b0_wr_vld_record) && dram_Ch2_l2b0_sctag_dram_wr_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 2);
      end
      if (~dram_Ch2_l2b0_wr_record && dram_Ch2_l2b0_dram_sctag_wr_ack) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 2);
      end
      if (~dram_Ch2_l2b0_wr_record && dram_Ch2_l2b0_sctag_dram_data_vld) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 2);
      end
      ************************************************************************************************/

   
  end
end

reg    dram_Ch2_l2b1_rd_record;
reg    dram_Ch2_l2b1_wr_record;
reg    dram_Ch2_l2b1_wr_vld_record;
reg [7:0]   dram_Ch2_l2b1_wr_vld_record_pipe;
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
          dram_Ch2_l2b1_rd_record <= 1'b0;
          dram_Ch2_l2b1_wr_record <= 1'b0;
          dram_Ch2_l2b1_wr_vld_record <= 1'b0;
          dram_Ch2_l2b1_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch2_l2b1_sctag_dram_rd_req) dram_Ch2_l2b1_rd_record  <= 1'b1;
     if (dram_Ch2_l2b1_dram_sctag_rd_ack) dram_Ch2_l2b1_rd_record  <= 1'b0;

      if (dram_Ch2_l2b1_rd_record && dram_Ch2_l2b1_sctag_dram_rd_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 2);
      end
      if (~dram_Ch2_l2b1_rd_record && dram_Ch2_l2b1_dram_sctag_rd_ack) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 2);
      end


     /**************************************************************************************** 
     // COVERAGE OF THIS CHECKER THRU MCUL2_INTF_CHECKER.V (0IN) CONTRAINTS 5.1 - 5.5
    
     // Write Req and ack
     if (dram_Ch2_l2b1_sctag_dram_wr_req) dram_Ch2_l2b1_wr_record  <= 1'b1;
     if (dram_Ch2_l2b1_dram_sctag_wr_ack) dram_Ch2_l2b1_wr_record  <= 1'b0;
     if (dram_Ch2_l2b1_sctag_dram_data_vld && dram_Ch2_l2b1_wr_record && !dram_Ch2_l2b1_wr_vld_record) begin 
         dram_Ch2_l2b1_wr_vld_record  <= 1'b1;
         dram_Ch2_l2b1_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch2_l2b1_sctag_dram_data_vld && dram_Ch2_l2b1_wr_vld_record) dram_Ch2_l2b1_wr_vld_record_pipe <= {dram_Ch2_l2b1_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch2_l2b1_wr_vld_record_pipe[6] && dram_Ch2_l2b1_sctag_dram_data_vld) begin 
         dram_Ch2_l2b1_wr_record  <= 1'b0;
         dram_Ch2_l2b1_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch2_l2b1_wr_record || dram_Ch2_l2b1_wr_vld_record) && dram_Ch2_l2b1_sctag_dram_wr_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 2);
      end
      if (~dram_Ch2_l2b1_wr_record && dram_Ch2_l2b1_dram_sctag_wr_ack) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 2);
      end
      if (~dram_Ch2_l2b1_wr_record && dram_Ch2_l2b1_sctag_dram_data_vld) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 2);
      end
      ************************************************************************************************/

   
  end
end

reg    dram_Ch3_l2b0_rd_record;
reg    dram_Ch3_l2b0_wr_record;
reg    dram_Ch3_l2b0_wr_vld_record;
reg [7:0]   dram_Ch3_l2b0_wr_vld_record_pipe;
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
          dram_Ch3_l2b0_rd_record <= 1'b0;
          dram_Ch3_l2b0_wr_record <= 1'b0;
          dram_Ch3_l2b0_wr_vld_record <= 1'b0;
          dram_Ch3_l2b0_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch3_l2b0_sctag_dram_rd_req) dram_Ch3_l2b0_rd_record  <= 1'b1;
     if (dram_Ch3_l2b0_dram_sctag_rd_ack) dram_Ch3_l2b0_rd_record  <= 1'b0;

      if (dram_Ch3_l2b0_rd_record && dram_Ch3_l2b0_sctag_dram_rd_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 3);
      end
      if (~dram_Ch3_l2b0_rd_record && dram_Ch3_l2b0_dram_sctag_rd_ack) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 3);
      end


     /**************************************************************************************** 
     // COVERAGE OF THIS CHECKER THRU MCUL2_INTF_CHECKER.V (0IN) CONTRAINTS 5.1 - 5.5
    
     // Write Req and ack
     if (dram_Ch3_l2b0_sctag_dram_wr_req) dram_Ch3_l2b0_wr_record  <= 1'b1;
     if (dram_Ch3_l2b0_dram_sctag_wr_ack) dram_Ch3_l2b0_wr_record  <= 1'b0;
     if (dram_Ch3_l2b0_sctag_dram_data_vld && dram_Ch3_l2b0_wr_record && !dram_Ch3_l2b0_wr_vld_record) begin 
         dram_Ch3_l2b0_wr_vld_record  <= 1'b1;
         dram_Ch3_l2b0_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch3_l2b0_sctag_dram_data_vld && dram_Ch3_l2b0_wr_vld_record) dram_Ch3_l2b0_wr_vld_record_pipe <= {dram_Ch3_l2b0_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch3_l2b0_wr_vld_record_pipe[6] && dram_Ch3_l2b0_sctag_dram_data_vld) begin 
         dram_Ch3_l2b0_wr_record  <= 1'b0;
         dram_Ch3_l2b0_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch3_l2b0_wr_record || dram_Ch3_l2b0_wr_vld_record) && dram_Ch3_l2b0_sctag_dram_wr_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 3);
      end
      if (~dram_Ch3_l2b0_wr_record && dram_Ch3_l2b0_dram_sctag_wr_ack) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 3);
      end
      if (~dram_Ch3_l2b0_wr_record && dram_Ch3_l2b0_sctag_dram_data_vld) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 3);
      end
      ************************************************************************************************/

   
  end
end

reg    dram_Ch3_l2b1_rd_record;
reg    dram_Ch3_l2b1_wr_record;
reg    dram_Ch3_l2b1_wr_vld_record;
reg [7:0]   dram_Ch3_l2b1_wr_vld_record_pipe;
always @ (posedge (cmp_clk && enabled))
begin
  if (~cmp_rst_l)
   begin
          dram_Ch3_l2b1_rd_record <= 1'b0;
          dram_Ch3_l2b1_wr_record <= 1'b0;
          dram_Ch3_l2b1_wr_vld_record <= 1'b0;
          dram_Ch3_l2b1_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch3_l2b1_sctag_dram_rd_req) dram_Ch3_l2b1_rd_record  <= 1'b1;
     if (dram_Ch3_l2b1_dram_sctag_rd_ack) dram_Ch3_l2b1_rd_record  <= 1'b0;

      if (dram_Ch3_l2b1_rd_record && dram_Ch3_l2b1_sctag_dram_rd_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 3);
      end
      if (~dram_Ch3_l2b1_rd_record && dram_Ch3_l2b1_dram_sctag_rd_ack) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 3);
      end


     /**************************************************************************************** 
     // COVERAGE OF THIS CHECKER THRU MCUL2_INTF_CHECKER.V (0IN) CONTRAINTS 5.1 - 5.5
    
     // Write Req and ack
     if (dram_Ch3_l2b1_sctag_dram_wr_req) dram_Ch3_l2b1_wr_record  <= 1'b1;
     if (dram_Ch3_l2b1_dram_sctag_wr_ack) dram_Ch3_l2b1_wr_record  <= 1'b0;
     if (dram_Ch3_l2b1_sctag_dram_data_vld && dram_Ch3_l2b1_wr_record && !dram_Ch3_l2b1_wr_vld_record) begin 
         dram_Ch3_l2b1_wr_vld_record  <= 1'b1;
         dram_Ch3_l2b1_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch3_l2b1_sctag_dram_data_vld && dram_Ch3_l2b1_wr_vld_record) dram_Ch3_l2b1_wr_vld_record_pipe <= {dram_Ch3_l2b1_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch3_l2b1_wr_vld_record_pipe[6] && dram_Ch3_l2b1_sctag_dram_data_vld) begin 
         dram_Ch3_l2b1_wr_record  <= 1'b0;
         dram_Ch3_l2b1_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch3_l2b1_wr_record || dram_Ch3_l2b1_wr_vld_record) && dram_Ch3_l2b1_sctag_dram_wr_req) begin 
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 3);
      end
      if (~dram_Ch3_l2b1_wr_record && dram_Ch3_l2b1_dram_sctag_wr_ack) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 3);
      end
      if (~dram_Ch3_l2b1_wr_record && dram_Ch3_l2b1_sctag_dram_data_vld) begin
         `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 3);
      end
      ************************************************************************************************/

   
  end
end



// ----- MONITOR RD REQ TO RD DATA VLD ( DATA RETURN) LATENCY -----

reg [13:0]  dram_Ch0_l2b0_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch0_l2b0_rd_req_ack_cntr_0 = dram_Ch0_l2b0_rd_req_ack_cntr[0];
wire [13:0] dram_Ch0_l2b0_rd_req_ack_cntr_1 = dram_Ch0_l2b0_rd_req_ack_cntr[1];
wire [13:0] dram_Ch0_l2b0_rd_req_ack_cntr_2 = dram_Ch0_l2b0_rd_req_ack_cntr[2];
wire [13:0] dram_Ch0_l2b0_rd_req_ack_cntr_3 = dram_Ch0_l2b0_rd_req_ack_cntr[3];
wire [13:0] dram_Ch0_l2b0_rd_req_ack_cntr_4 = dram_Ch0_l2b0_rd_req_ack_cntr[4];
wire [13:0] dram_Ch0_l2b0_rd_req_ack_cntr_5 = dram_Ch0_l2b0_rd_req_ack_cntr[5];
wire [13:0] dram_Ch0_l2b0_rd_req_ack_cntr_6 = dram_Ch0_l2b0_rd_req_ack_cntr[6];
wire [13:0] dram_Ch0_l2b0_rd_req_ack_cntr_7 = dram_Ch0_l2b0_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch0_l2b0_rd_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_l2b0_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch0_l2b0_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch0_l2b0_sctag_dram_rd_req && !dram_Ch0_l2b0_sctag_dram_rd_dummy_req)   dram_Ch0_l2b0_rd_req_pend[dram_Ch0_l2b0_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch0_l2b0_dram_sctag_data_vld) dram_Ch0_l2b0_rd_req_pend[dram_Ch0_l2b0_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch0_l2b0_rd_req_ack_cntr[i] <= (dram_Ch0_l2b0_rd_req_pend[i] == 1'b1) ? dram_Ch0_l2b0_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch0_l2b0_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcu_monitor", `ERROR, "In dram channel 0:l2b0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 0);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch0_l2b0_sctag_dram_rd_req) begin 
      if (dram_Ch0_l2b0_rd_req_pend[dram_Ch0_l2b0_sctag_dram_rd_req_id] == 1'b1 ) begin 
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b0 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 0); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch0_l2b1_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch0_l2b1_rd_req_ack_cntr_0 = dram_Ch0_l2b1_rd_req_ack_cntr[0];
wire [13:0] dram_Ch0_l2b1_rd_req_ack_cntr_1 = dram_Ch0_l2b1_rd_req_ack_cntr[1];
wire [13:0] dram_Ch0_l2b1_rd_req_ack_cntr_2 = dram_Ch0_l2b1_rd_req_ack_cntr[2];
wire [13:0] dram_Ch0_l2b1_rd_req_ack_cntr_3 = dram_Ch0_l2b1_rd_req_ack_cntr[3];
wire [13:0] dram_Ch0_l2b1_rd_req_ack_cntr_4 = dram_Ch0_l2b1_rd_req_ack_cntr[4];
wire [13:0] dram_Ch0_l2b1_rd_req_ack_cntr_5 = dram_Ch0_l2b1_rd_req_ack_cntr[5];
wire [13:0] dram_Ch0_l2b1_rd_req_ack_cntr_6 = dram_Ch0_l2b1_rd_req_ack_cntr[6];
wire [13:0] dram_Ch0_l2b1_rd_req_ack_cntr_7 = dram_Ch0_l2b1_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch0_l2b1_rd_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_l2b1_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch0_l2b1_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch0_l2b1_sctag_dram_rd_req && !dram_Ch0_l2b1_sctag_dram_rd_dummy_req)   dram_Ch0_l2b1_rd_req_pend[dram_Ch0_l2b1_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch0_l2b1_dram_sctag_data_vld) dram_Ch0_l2b1_rd_req_pend[dram_Ch0_l2b1_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch0_l2b1_rd_req_ack_cntr[i] <= (dram_Ch0_l2b1_rd_req_pend[i] == 1'b1) ? dram_Ch0_l2b1_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch0_l2b1_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcu_monitor", `ERROR, "In dram channel 0:l2b1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 0);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch0_l2b1_sctag_dram_rd_req) begin 
      if (dram_Ch0_l2b1_rd_req_pend[dram_Ch0_l2b1_sctag_dram_rd_req_id] == 1'b1 ) begin 
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b1 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 0); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch1_l2b0_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch1_l2b0_rd_req_ack_cntr_0 = dram_Ch1_l2b0_rd_req_ack_cntr[0];
wire [13:0] dram_Ch1_l2b0_rd_req_ack_cntr_1 = dram_Ch1_l2b0_rd_req_ack_cntr[1];
wire [13:0] dram_Ch1_l2b0_rd_req_ack_cntr_2 = dram_Ch1_l2b0_rd_req_ack_cntr[2];
wire [13:0] dram_Ch1_l2b0_rd_req_ack_cntr_3 = dram_Ch1_l2b0_rd_req_ack_cntr[3];
wire [13:0] dram_Ch1_l2b0_rd_req_ack_cntr_4 = dram_Ch1_l2b0_rd_req_ack_cntr[4];
wire [13:0] dram_Ch1_l2b0_rd_req_ack_cntr_5 = dram_Ch1_l2b0_rd_req_ack_cntr[5];
wire [13:0] dram_Ch1_l2b0_rd_req_ack_cntr_6 = dram_Ch1_l2b0_rd_req_ack_cntr[6];
wire [13:0] dram_Ch1_l2b0_rd_req_ack_cntr_7 = dram_Ch1_l2b0_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch1_l2b0_rd_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_l2b0_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch1_l2b0_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch1_l2b0_sctag_dram_rd_req && !dram_Ch1_l2b0_sctag_dram_rd_dummy_req)   dram_Ch1_l2b0_rd_req_pend[dram_Ch1_l2b0_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch1_l2b0_dram_sctag_data_vld) dram_Ch1_l2b0_rd_req_pend[dram_Ch1_l2b0_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch1_l2b0_rd_req_ack_cntr[i] <= (dram_Ch1_l2b0_rd_req_pend[i] == 1'b1) ? dram_Ch1_l2b0_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch1_l2b0_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcu_monitor", `ERROR, "In dram channel 1:l2b0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 1);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch1_l2b0_sctag_dram_rd_req) begin 
      if (dram_Ch1_l2b0_rd_req_pend[dram_Ch1_l2b0_sctag_dram_rd_req_id] == 1'b1 ) begin 
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b0 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 1); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch1_l2b1_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch1_l2b1_rd_req_ack_cntr_0 = dram_Ch1_l2b1_rd_req_ack_cntr[0];
wire [13:0] dram_Ch1_l2b1_rd_req_ack_cntr_1 = dram_Ch1_l2b1_rd_req_ack_cntr[1];
wire [13:0] dram_Ch1_l2b1_rd_req_ack_cntr_2 = dram_Ch1_l2b1_rd_req_ack_cntr[2];
wire [13:0] dram_Ch1_l2b1_rd_req_ack_cntr_3 = dram_Ch1_l2b1_rd_req_ack_cntr[3];
wire [13:0] dram_Ch1_l2b1_rd_req_ack_cntr_4 = dram_Ch1_l2b1_rd_req_ack_cntr[4];
wire [13:0] dram_Ch1_l2b1_rd_req_ack_cntr_5 = dram_Ch1_l2b1_rd_req_ack_cntr[5];
wire [13:0] dram_Ch1_l2b1_rd_req_ack_cntr_6 = dram_Ch1_l2b1_rd_req_ack_cntr[6];
wire [13:0] dram_Ch1_l2b1_rd_req_ack_cntr_7 = dram_Ch1_l2b1_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch1_l2b1_rd_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_l2b1_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch1_l2b1_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch1_l2b1_sctag_dram_rd_req && !dram_Ch1_l2b1_sctag_dram_rd_dummy_req)   dram_Ch1_l2b1_rd_req_pend[dram_Ch1_l2b1_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch1_l2b1_dram_sctag_data_vld) dram_Ch1_l2b1_rd_req_pend[dram_Ch1_l2b1_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch1_l2b1_rd_req_ack_cntr[i] <= (dram_Ch1_l2b1_rd_req_pend[i] == 1'b1) ? dram_Ch1_l2b1_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch1_l2b1_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcu_monitor", `ERROR, "In dram channel 1:l2b1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 1);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch1_l2b1_sctag_dram_rd_req) begin 
      if (dram_Ch1_l2b1_rd_req_pend[dram_Ch1_l2b1_sctag_dram_rd_req_id] == 1'b1 ) begin 
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b1 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 1); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch2_l2b0_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch2_l2b0_rd_req_ack_cntr_0 = dram_Ch2_l2b0_rd_req_ack_cntr[0];
wire [13:0] dram_Ch2_l2b0_rd_req_ack_cntr_1 = dram_Ch2_l2b0_rd_req_ack_cntr[1];
wire [13:0] dram_Ch2_l2b0_rd_req_ack_cntr_2 = dram_Ch2_l2b0_rd_req_ack_cntr[2];
wire [13:0] dram_Ch2_l2b0_rd_req_ack_cntr_3 = dram_Ch2_l2b0_rd_req_ack_cntr[3];
wire [13:0] dram_Ch2_l2b0_rd_req_ack_cntr_4 = dram_Ch2_l2b0_rd_req_ack_cntr[4];
wire [13:0] dram_Ch2_l2b0_rd_req_ack_cntr_5 = dram_Ch2_l2b0_rd_req_ack_cntr[5];
wire [13:0] dram_Ch2_l2b0_rd_req_ack_cntr_6 = dram_Ch2_l2b0_rd_req_ack_cntr[6];
wire [13:0] dram_Ch2_l2b0_rd_req_ack_cntr_7 = dram_Ch2_l2b0_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch2_l2b0_rd_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_l2b0_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch2_l2b0_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch2_l2b0_sctag_dram_rd_req && !dram_Ch2_l2b0_sctag_dram_rd_dummy_req)   dram_Ch2_l2b0_rd_req_pend[dram_Ch2_l2b0_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch2_l2b0_dram_sctag_data_vld) dram_Ch2_l2b0_rd_req_pend[dram_Ch2_l2b0_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch2_l2b0_rd_req_ack_cntr[i] <= (dram_Ch2_l2b0_rd_req_pend[i] == 1'b1) ? dram_Ch2_l2b0_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch2_l2b0_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcu_monitor", `ERROR, "In dram channel 2:l2b0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 2);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch2_l2b0_sctag_dram_rd_req) begin 
      if (dram_Ch2_l2b0_rd_req_pend[dram_Ch2_l2b0_sctag_dram_rd_req_id] == 1'b1 ) begin 
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b0 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 2); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch2_l2b1_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch2_l2b1_rd_req_ack_cntr_0 = dram_Ch2_l2b1_rd_req_ack_cntr[0];
wire [13:0] dram_Ch2_l2b1_rd_req_ack_cntr_1 = dram_Ch2_l2b1_rd_req_ack_cntr[1];
wire [13:0] dram_Ch2_l2b1_rd_req_ack_cntr_2 = dram_Ch2_l2b1_rd_req_ack_cntr[2];
wire [13:0] dram_Ch2_l2b1_rd_req_ack_cntr_3 = dram_Ch2_l2b1_rd_req_ack_cntr[3];
wire [13:0] dram_Ch2_l2b1_rd_req_ack_cntr_4 = dram_Ch2_l2b1_rd_req_ack_cntr[4];
wire [13:0] dram_Ch2_l2b1_rd_req_ack_cntr_5 = dram_Ch2_l2b1_rd_req_ack_cntr[5];
wire [13:0] dram_Ch2_l2b1_rd_req_ack_cntr_6 = dram_Ch2_l2b1_rd_req_ack_cntr[6];
wire [13:0] dram_Ch2_l2b1_rd_req_ack_cntr_7 = dram_Ch2_l2b1_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch2_l2b1_rd_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_l2b1_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch2_l2b1_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch2_l2b1_sctag_dram_rd_req && !dram_Ch2_l2b1_sctag_dram_rd_dummy_req)   dram_Ch2_l2b1_rd_req_pend[dram_Ch2_l2b1_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch2_l2b1_dram_sctag_data_vld) dram_Ch2_l2b1_rd_req_pend[dram_Ch2_l2b1_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch2_l2b1_rd_req_ack_cntr[i] <= (dram_Ch2_l2b1_rd_req_pend[i] == 1'b1) ? dram_Ch2_l2b1_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch2_l2b1_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcu_monitor", `ERROR, "In dram channel 2:l2b1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 2);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch2_l2b1_sctag_dram_rd_req) begin 
      if (dram_Ch2_l2b1_rd_req_pend[dram_Ch2_l2b1_sctag_dram_rd_req_id] == 1'b1 ) begin 
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b1 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 2); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch3_l2b0_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch3_l2b0_rd_req_ack_cntr_0 = dram_Ch3_l2b0_rd_req_ack_cntr[0];
wire [13:0] dram_Ch3_l2b0_rd_req_ack_cntr_1 = dram_Ch3_l2b0_rd_req_ack_cntr[1];
wire [13:0] dram_Ch3_l2b0_rd_req_ack_cntr_2 = dram_Ch3_l2b0_rd_req_ack_cntr[2];
wire [13:0] dram_Ch3_l2b0_rd_req_ack_cntr_3 = dram_Ch3_l2b0_rd_req_ack_cntr[3];
wire [13:0] dram_Ch3_l2b0_rd_req_ack_cntr_4 = dram_Ch3_l2b0_rd_req_ack_cntr[4];
wire [13:0] dram_Ch3_l2b0_rd_req_ack_cntr_5 = dram_Ch3_l2b0_rd_req_ack_cntr[5];
wire [13:0] dram_Ch3_l2b0_rd_req_ack_cntr_6 = dram_Ch3_l2b0_rd_req_ack_cntr[6];
wire [13:0] dram_Ch3_l2b0_rd_req_ack_cntr_7 = dram_Ch3_l2b0_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch3_l2b0_rd_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_l2b0_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch3_l2b0_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch3_l2b0_sctag_dram_rd_req && !dram_Ch3_l2b0_sctag_dram_rd_dummy_req)   dram_Ch3_l2b0_rd_req_pend[dram_Ch3_l2b0_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch3_l2b0_dram_sctag_data_vld) dram_Ch3_l2b0_rd_req_pend[dram_Ch3_l2b0_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch3_l2b0_rd_req_ack_cntr[i] <= (dram_Ch3_l2b0_rd_req_pend[i] == 1'b1) ? dram_Ch3_l2b0_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch3_l2b0_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcu_monitor", `ERROR, "In dram channel 3:l2b0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 3);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch3_l2b0_sctag_dram_rd_req) begin 
      if (dram_Ch3_l2b0_rd_req_pend[dram_Ch3_l2b0_sctag_dram_rd_req_id] == 1'b1 ) begin 
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b0 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 3); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch3_l2b1_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch3_l2b1_rd_req_ack_cntr_0 = dram_Ch3_l2b1_rd_req_ack_cntr[0];
wire [13:0] dram_Ch3_l2b1_rd_req_ack_cntr_1 = dram_Ch3_l2b1_rd_req_ack_cntr[1];
wire [13:0] dram_Ch3_l2b1_rd_req_ack_cntr_2 = dram_Ch3_l2b1_rd_req_ack_cntr[2];
wire [13:0] dram_Ch3_l2b1_rd_req_ack_cntr_3 = dram_Ch3_l2b1_rd_req_ack_cntr[3];
wire [13:0] dram_Ch3_l2b1_rd_req_ack_cntr_4 = dram_Ch3_l2b1_rd_req_ack_cntr[4];
wire [13:0] dram_Ch3_l2b1_rd_req_ack_cntr_5 = dram_Ch3_l2b1_rd_req_ack_cntr[5];
wire [13:0] dram_Ch3_l2b1_rd_req_ack_cntr_6 = dram_Ch3_l2b1_rd_req_ack_cntr[6];
wire [13:0] dram_Ch3_l2b1_rd_req_ack_cntr_7 = dram_Ch3_l2b1_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch3_l2b1_rd_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_l2b1_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch3_l2b1_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch3_l2b1_sctag_dram_rd_req && !dram_Ch3_l2b1_sctag_dram_rd_dummy_req)   dram_Ch3_l2b1_rd_req_pend[dram_Ch3_l2b1_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch3_l2b1_dram_sctag_data_vld) dram_Ch3_l2b1_rd_req_pend[dram_Ch3_l2b1_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch3_l2b1_rd_req_ack_cntr[i] <= (dram_Ch3_l2b1_rd_req_pend[i] == 1'b1) ? dram_Ch3_l2b1_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch3_l2b1_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcu_monitor", `ERROR, "In dram channel 3:l2b1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 3);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch3_l2b1_sctag_dram_rd_req) begin 
      if (dram_Ch3_l2b1_rd_req_pend[dram_Ch3_l2b1_sctag_dram_rd_req_id] == 1'b1 ) begin 
        `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b1 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 3); 
      end
    end  

   end  // end of begin (else)
end // end always



// ---- MONITOR WR REQ TO WR ACK  -----

reg [10:0]  dram_Ch0_l2b0_wr_req_ack_cntr;

reg  dram_Ch0_l2b0_wr_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch0_l2b0_wr_req_ack_cntr = 0;
       dram_Ch0_l2b0_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch0_l2b0_sctag_dram_wr_req) dram_Ch0_l2b0_wr_req_pend  <= 1'b1;
     if (dram_Ch0_l2b0_dram_sctag_wr_ack) dram_Ch0_l2b0_wr_req_pend  <= 1'b0;

    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
      dram_Ch0_l2b0_wr_req_ack_cntr <= (dram_Ch0_l2b0_wr_req_pend == 1'b1) ? dram_Ch0_l2b0_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch0_l2b0_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcusat_cov_mon", `ERROR, "In dram channel 0:l2b0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 0);
       //end  
    end
   end
end
reg [10:0]  dram_Ch0_l2b1_wr_req_ack_cntr;

reg  dram_Ch0_l2b1_wr_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch0_l2b1_wr_req_ack_cntr = 0;
       dram_Ch0_l2b1_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch0_l2b1_sctag_dram_wr_req) dram_Ch0_l2b1_wr_req_pend  <= 1'b1;
     if (dram_Ch0_l2b1_dram_sctag_wr_ack) dram_Ch0_l2b1_wr_req_pend  <= 1'b0;

    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
      dram_Ch0_l2b1_wr_req_ack_cntr <= (dram_Ch0_l2b1_wr_req_pend == 1'b1) ? dram_Ch0_l2b1_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch0_l2b1_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcusat_cov_mon", `ERROR, "In dram channel 0:l2b1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 0);
       //end  
    end
   end
end
reg [10:0]  dram_Ch1_l2b0_wr_req_ack_cntr;

reg  dram_Ch1_l2b0_wr_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch1_l2b0_wr_req_ack_cntr = 0;
       dram_Ch1_l2b0_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch1_l2b0_sctag_dram_wr_req) dram_Ch1_l2b0_wr_req_pend  <= 1'b1;
     if (dram_Ch1_l2b0_dram_sctag_wr_ack) dram_Ch1_l2b0_wr_req_pend  <= 1'b0;

    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
      dram_Ch1_l2b0_wr_req_ack_cntr <= (dram_Ch1_l2b0_wr_req_pend == 1'b1) ? dram_Ch1_l2b0_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch1_l2b0_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcusat_cov_mon", `ERROR, "In dram channel 1:l2b0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 1);
       //end  
    end
   end
end
reg [10:0]  dram_Ch1_l2b1_wr_req_ack_cntr;

reg  dram_Ch1_l2b1_wr_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch1_l2b1_wr_req_ack_cntr = 0;
       dram_Ch1_l2b1_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch1_l2b1_sctag_dram_wr_req) dram_Ch1_l2b1_wr_req_pend  <= 1'b1;
     if (dram_Ch1_l2b1_dram_sctag_wr_ack) dram_Ch1_l2b1_wr_req_pend  <= 1'b0;

    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
      dram_Ch1_l2b1_wr_req_ack_cntr <= (dram_Ch1_l2b1_wr_req_pend == 1'b1) ? dram_Ch1_l2b1_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch1_l2b1_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcusat_cov_mon", `ERROR, "In dram channel 1:l2b1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 1);
       //end  
    end
   end
end
reg [10:0]  dram_Ch2_l2b0_wr_req_ack_cntr;

reg  dram_Ch2_l2b0_wr_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch2_l2b0_wr_req_ack_cntr = 0;
       dram_Ch2_l2b0_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch2_l2b0_sctag_dram_wr_req) dram_Ch2_l2b0_wr_req_pend  <= 1'b1;
     if (dram_Ch2_l2b0_dram_sctag_wr_ack) dram_Ch2_l2b0_wr_req_pend  <= 1'b0;

    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
      dram_Ch2_l2b0_wr_req_ack_cntr <= (dram_Ch2_l2b0_wr_req_pend == 1'b1) ? dram_Ch2_l2b0_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch2_l2b0_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcusat_cov_mon", `ERROR, "In dram channel 2:l2b0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 2);
       //end  
    end
   end
end
reg [10:0]  dram_Ch2_l2b1_wr_req_ack_cntr;

reg  dram_Ch2_l2b1_wr_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch2_l2b1_wr_req_ack_cntr = 0;
       dram_Ch2_l2b1_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch2_l2b1_sctag_dram_wr_req) dram_Ch2_l2b1_wr_req_pend  <= 1'b1;
     if (dram_Ch2_l2b1_dram_sctag_wr_ack) dram_Ch2_l2b1_wr_req_pend  <= 1'b0;

    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
      dram_Ch2_l2b1_wr_req_ack_cntr <= (dram_Ch2_l2b1_wr_req_pend == 1'b1) ? dram_Ch2_l2b1_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch2_l2b1_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcusat_cov_mon", `ERROR, "In dram channel 2:l2b1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 2);
       //end  
    end
   end
end
reg [10:0]  dram_Ch3_l2b0_wr_req_ack_cntr;

reg  dram_Ch3_l2b0_wr_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch3_l2b0_wr_req_ack_cntr = 0;
       dram_Ch3_l2b0_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch3_l2b0_sctag_dram_wr_req) dram_Ch3_l2b0_wr_req_pend  <= 1'b1;
     if (dram_Ch3_l2b0_dram_sctag_wr_ack) dram_Ch3_l2b0_wr_req_pend  <= 1'b0;

    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
      dram_Ch3_l2b0_wr_req_ack_cntr <= (dram_Ch3_l2b0_wr_req_pend == 1'b1) ? dram_Ch3_l2b0_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch3_l2b0_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcusat_cov_mon", `ERROR, "In dram channel 3:l2b0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 3);
       //end  
    end
   end
end
reg [10:0]  dram_Ch3_l2b1_wr_req_ack_cntr;

reg  dram_Ch3_l2b1_wr_req_pend;


always @ (posedge (cmp_clk && enabled))
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch3_l2b1_wr_req_ack_cntr = 0;
       dram_Ch3_l2b1_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch3_l2b1_sctag_dram_wr_req) dram_Ch3_l2b1_wr_req_pend  <= 1'b1;
     if (dram_Ch3_l2b1_dram_sctag_wr_ack) dram_Ch3_l2b1_wr_req_pend  <= 1'b0;

    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
      dram_Ch3_l2b1_wr_req_ack_cntr <= (dram_Ch3_l2b1_wr_req_pend == 1'b1) ? dram_Ch3_l2b1_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch3_l2b1_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  `PR_ERROR("mcusat_cov_mon", `ERROR, "In dram channel 3:l2b1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 3);
       //end  
    end
   end
end

//  ----- Monitor to make sure that after refresh process has been initiatedall the CAS to same CS are cleared and no more RAS issued -----

reg [1:0] dram_Ch0_refresh_all_clr_mon_state;
reg 	  cas_valid_0;
reg       dram_Ch0_que_ref_go_d1;

initial 
 begin 
    dram_Ch0_refresh_all_clr_mon_state = 2'b00;
    dram_Ch0_que_ref_go_d1 = 1'b0;
 end

always @ (posedge (`MCU_CLK && enabled))
begin
if ( ((($test$plusargs("RANK_DIMM")) || ($test$plusargs("STACK_DIMM"))) == 0) ) begin 
  if (~dram_rst_l)
   begin
    dram_Ch0_refresh_all_clr_mon_state <= 2'b00;
    dram_Ch0_que_ref_go_d1 <= 1'b0;
    cas_valid_0 = 0;
   end
  else
   begin
    dram_Ch0_que_ref_go_d1 <= (dram_Ch0_que_ref_go || dram_Ch0_que_hw_selfrsh) && (dram_Ch0_que_pos == 5'h1);

   case(dram_Ch0_refresh_all_clr_mon_state)
    2'b00 : begin 
               if (dram_Ch0_que_ref_go_d1) begin 
                 dram_Ch0_refresh_all_clr_mon_state <= 2'b01;
                 cas_valid_0 <= dram_Ch0_que_cas_valid | dram_Ch0_que_ras_picked;		// MAQ Added Ras valid also.
               end
            end
    2'b01 : begin 
               if (dram_Ch0_que_pos == 5'h3) 
                 dram_Ch0_refresh_all_clr_mon_state <= 2'b10;
               /*else begin 
                // monitor that no new cas valid turns up, indicating RAS issued
                  if (!cas_valid_0 && dram_Ch0_que_cas_valid) begin 
                    `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b2 ");
                    finish_test(" Refresh Monitor : RAS issued after refresh process started ", 0);
                  end
              end*/
            end
    2'b10 : begin 
                 dram_Ch0_refresh_all_clr_mon_state <= 2'b00;
               // check that all the CAS to same CS issued
                  /*if (dram_Ch0_que_cas_valid && (dram_Ch0_b_phy_bank_bits[0] == dram_Ch0_que_refresh_rank)) begin 
                    `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b2 ");
                    finish_test(" Refresh Monitor : CAS to same CS as refresh pending and refresh issued", 0);
                  end*/
            end
    default : begin 
                 dram_Ch0_refresh_all_clr_mon_state <= 2'b00;
              end

   endcase
  end 
 end // testplus
end
reg [1:0] dram_Ch1_refresh_all_clr_mon_state;
reg 	  cas_valid_1;
reg       dram_Ch1_que_ref_go_d1;

initial 
 begin 
    dram_Ch1_refresh_all_clr_mon_state = 2'b00;
    dram_Ch1_que_ref_go_d1 = 1'b0;
 end

always @ (posedge (`MCU_CLK && enabled))
begin
if ( ((($test$plusargs("RANK_DIMM")) || ($test$plusargs("STACK_DIMM"))) == 0) ) begin 
  if (~dram_rst_l)
   begin
    dram_Ch1_refresh_all_clr_mon_state <= 2'b00;
    dram_Ch1_que_ref_go_d1 <= 1'b0;
    cas_valid_1 = 0;
   end
  else
   begin
    dram_Ch1_que_ref_go_d1 <= (dram_Ch1_que_ref_go || dram_Ch1_que_hw_selfrsh) && (dram_Ch1_que_pos == 5'h1);

   case(dram_Ch1_refresh_all_clr_mon_state)
    2'b00 : begin 
               if (dram_Ch1_que_ref_go_d1) begin 
                 dram_Ch1_refresh_all_clr_mon_state <= 2'b01;
                 cas_valid_1 <= dram_Ch1_que_cas_valid | dram_Ch1_que_ras_picked;		// MAQ Added Ras valid also.
               end
            end
    2'b01 : begin 
               if (dram_Ch1_que_pos == 5'h3) 
                 dram_Ch1_refresh_all_clr_mon_state <= 2'b10;
               /*else begin 
                // monitor that no new cas valid turns up, indicating RAS issued
                  if (!cas_valid_1 && dram_Ch1_que_cas_valid) begin 
                    `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b2 ");
                    finish_test(" Refresh Monitor : RAS issued after refresh process started ", 1);
                  end
              end*/
            end
    2'b10 : begin 
                 dram_Ch1_refresh_all_clr_mon_state <= 2'b00;
               // check that all the CAS to same CS issued
                  /*if (dram_Ch1_que_cas_valid && (dram_Ch1_b_phy_bank_bits[0] == dram_Ch1_que_refresh_rank)) begin 
                    `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b2 ");
                    finish_test(" Refresh Monitor : CAS to same CS as refresh pending and refresh issued", 1);
                  end*/
            end
    default : begin 
                 dram_Ch1_refresh_all_clr_mon_state <= 2'b00;
              end

   endcase
  end 
 end // testplus
end
reg [1:0] dram_Ch2_refresh_all_clr_mon_state;
reg 	  cas_valid_2;
reg       dram_Ch2_que_ref_go_d1;

initial 
 begin 
    dram_Ch2_refresh_all_clr_mon_state = 2'b00;
    dram_Ch2_que_ref_go_d1 = 1'b0;
 end

always @ (posedge (`MCU_CLK && enabled))
begin
if ( ((($test$plusargs("RANK_DIMM")) || ($test$plusargs("STACK_DIMM"))) == 0) ) begin 
  if (~dram_rst_l)
   begin
    dram_Ch2_refresh_all_clr_mon_state <= 2'b00;
    dram_Ch2_que_ref_go_d1 <= 1'b0;
    cas_valid_2 = 0;
   end
  else
   begin
    dram_Ch2_que_ref_go_d1 <= (dram_Ch2_que_ref_go || dram_Ch2_que_hw_selfrsh) && (dram_Ch2_que_pos == 5'h1);

   case(dram_Ch2_refresh_all_clr_mon_state)
    2'b00 : begin 
               if (dram_Ch2_que_ref_go_d1) begin 
                 dram_Ch2_refresh_all_clr_mon_state <= 2'b01;
                 cas_valid_2 <= dram_Ch2_que_cas_valid | dram_Ch2_que_ras_picked;		// MAQ Added Ras valid also.
               end
            end
    2'b01 : begin 
               if (dram_Ch2_que_pos == 5'h3) 
                 dram_Ch2_refresh_all_clr_mon_state <= 2'b10;
               /*else begin 
                // monitor that no new cas valid turns up, indicating RAS issued
                  if (!cas_valid_2 && dram_Ch2_que_cas_valid) begin 
                    `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b2 ");
                    finish_test(" Refresh Monitor : RAS issued after refresh process started ", 2);
                  end
              end*/
            end
    2'b10 : begin 
                 dram_Ch2_refresh_all_clr_mon_state <= 2'b00;
               // check that all the CAS to same CS issued
                  /*if (dram_Ch2_que_cas_valid && (dram_Ch2_b_phy_bank_bits[0] == dram_Ch2_que_refresh_rank)) begin 
                    `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b2 ");
                    finish_test(" Refresh Monitor : CAS to same CS as refresh pending and refresh issued", 2);
                  end*/
            end
    default : begin 
                 dram_Ch2_refresh_all_clr_mon_state <= 2'b00;
              end

   endcase
  end 
 end // testplus
end
reg [1:0] dram_Ch3_refresh_all_clr_mon_state;
reg 	  cas_valid_3;
reg       dram_Ch3_que_ref_go_d1;

initial 
 begin 
    dram_Ch3_refresh_all_clr_mon_state = 2'b00;
    dram_Ch3_que_ref_go_d1 = 1'b0;
 end

always @ (posedge (`MCU_CLK && enabled))
begin
if ( ((($test$plusargs("RANK_DIMM")) || ($test$plusargs("STACK_DIMM"))) == 0) ) begin 
  if (~dram_rst_l)
   begin
    dram_Ch3_refresh_all_clr_mon_state <= 2'b00;
    dram_Ch3_que_ref_go_d1 <= 1'b0;
    cas_valid_3 = 0;
   end
  else
   begin
    dram_Ch3_que_ref_go_d1 <= (dram_Ch3_que_ref_go || dram_Ch3_que_hw_selfrsh) && (dram_Ch3_que_pos == 5'h1);

   case(dram_Ch3_refresh_all_clr_mon_state)
    2'b00 : begin 
               if (dram_Ch3_que_ref_go_d1) begin 
                 dram_Ch3_refresh_all_clr_mon_state <= 2'b01;
                 cas_valid_3 <= dram_Ch3_que_cas_valid | dram_Ch3_que_ras_picked;		// MAQ Added Ras valid also.
               end
            end
    2'b01 : begin 
               if (dram_Ch3_que_pos == 5'h3) 
                 dram_Ch3_refresh_all_clr_mon_state <= 2'b10;
               /*else begin 
                // monitor that no new cas valid turns up, indicating RAS issued
                  if (!cas_valid_3 && dram_Ch3_que_cas_valid) begin 
                    `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b2 ");
                    finish_test(" Refresh Monitor : RAS issued after refresh process started ", 3);
                  end
              end*/
            end
    2'b10 : begin 
                 dram_Ch3_refresh_all_clr_mon_state <= 2'b00;
               // check that all the CAS to same CS issued
                  /*if (dram_Ch3_que_cas_valid && (dram_Ch3_b_phy_bank_bits[0] == dram_Ch3_que_refresh_rank)) begin 
                    `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b2 ");
                    finish_test(" Refresh Monitor : CAS to same CS as refresh pending and refresh issued", 3);
                  end*/
            end
    default : begin 
                 dram_Ch3_refresh_all_clr_mon_state <= 2'b00;
              end

   endcase
  end 
 end // testplus
end

// -------- MONITOR FOR READ WRITE WITH SAME ADDRESS, SCHMOO  -------

reg  dram_Ch0_l2b0_rd_req_2a_addr_vld;
reg  l2b0_req_2a_addr_0;
reg [39:0] samp_addr_l2b0_rd_q_loc_0;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch0_l2b0_rd_q_0 or dram_Ch0_l2b0_rd_q_1 or dram_Ch0_l2b0_rd_q_2 or dram_Ch0_l2b0_rd_q_3 or
          dram_Ch0_l2b0_rd_q_4 or dram_Ch0_l2b0_rd_q_5 or dram_Ch0_l2b0_rd_q_6 or dram_Ch0_l2b0_rd_q_7)
begin 
     l2b0_req_2a_addr_0 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b0_rd_q_loc_0  = dram_Ch0_l2b0_rd_q[i];
     l2b0_req_2a_addr_0 = (samp_addr_l2b0_rd_q_loc_0[39] && ({samp_addr_l2b0_rd_q_loc_0[35:32],samp_addr_l2b0_rd_q_loc_0[5],samp_addr_l2b0_rd_q_loc_0[28:14],samp_addr_l2b0_rd_q_loc_0[13:6],samp_addr_l2b0_rd_q_loc_0[31:29],samp_addr_l2b0_rd_q_loc_0[4]} == SCHMOO_RD_WR_ADDR)) || l2b0_req_2a_addr_0;
    end
 
    dram_Ch0_l2b0_rd_req_2a_addr_vld <= l2b0_req_2a_addr_0;
    

end
 
reg  dram_Ch0_l2b0_wr_req_2a_addr_vld;
reg  l2b0_req_2a_addr1_0;
reg [39:0] samp_addr_l2b0_wr_q_loc_0;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch0_l2b0_wr_q_0 or dram_Ch0_l2b0_wr_q_1 or dram_Ch0_l2b0_wr_q_2 or dram_Ch0_l2b0_wr_q_3 or
          dram_Ch0_l2b0_wr_q_4 or dram_Ch0_l2b0_wr_q_5 or dram_Ch0_l2b0_wr_q_6 or dram_Ch0_l2b0_wr_q_7)
begin 
     l2b0_req_2a_addr1_0 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b0_wr_q_loc_0  = dram_Ch0_l2b0_wr_q[i];
     l2b0_req_2a_addr1_0 = (samp_addr_l2b0_wr_q_loc_0[39] && ({samp_addr_l2b0_wr_q_loc_0[35:32],samp_addr_l2b0_wr_q_loc_0[5],samp_addr_l2b0_wr_q_loc_0[28:14],samp_addr_l2b0_wr_q_loc_0[13:6],samp_addr_l2b0_wr_q_loc_0[31:29],samp_addr_l2b0_wr_q_loc_0[4]} == SCHMOO_RD_WR_ADDR)) || l2b0_req_2a_addr1_0;
    end
 
    dram_Ch0_l2b0_wr_req_2a_addr_vld <= l2b0_req_2a_addr1_0;
    

end
reg  dram_Ch0_l2b1_rd_req_2a_addr_vld;
reg  l2b1_req_2a_addr_0;
reg [39:0] samp_addr_l2b1_rd_q_loc_0;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch0_l2b1_rd_q_0 or dram_Ch0_l2b1_rd_q_1 or dram_Ch0_l2b1_rd_q_2 or dram_Ch0_l2b1_rd_q_3 or
          dram_Ch0_l2b1_rd_q_4 or dram_Ch0_l2b1_rd_q_5 or dram_Ch0_l2b1_rd_q_6 or dram_Ch0_l2b1_rd_q_7)
begin 
     l2b1_req_2a_addr_0 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b1_rd_q_loc_0  = dram_Ch0_l2b1_rd_q[i];
     l2b1_req_2a_addr_0 = (samp_addr_l2b1_rd_q_loc_0[39] && ({samp_addr_l2b1_rd_q_loc_0[35:32],samp_addr_l2b1_rd_q_loc_0[5],samp_addr_l2b1_rd_q_loc_0[28:14],samp_addr_l2b1_rd_q_loc_0[13:6],samp_addr_l2b1_rd_q_loc_0[31:29],samp_addr_l2b1_rd_q_loc_0[4]} == SCHMOO_RD_WR_ADDR)) || l2b1_req_2a_addr_0;
    end
 
    dram_Ch0_l2b1_rd_req_2a_addr_vld <= l2b1_req_2a_addr_0;
    

end
 
reg  dram_Ch0_l2b1_wr_req_2a_addr_vld;
reg  l2b1_req_2a_addr1_0;
reg [39:0] samp_addr_l2b1_wr_q_loc_0;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch0_l2b1_wr_q_0 or dram_Ch0_l2b1_wr_q_1 or dram_Ch0_l2b1_wr_q_2 or dram_Ch0_l2b1_wr_q_3 or
          dram_Ch0_l2b1_wr_q_4 or dram_Ch0_l2b1_wr_q_5 or dram_Ch0_l2b1_wr_q_6 or dram_Ch0_l2b1_wr_q_7)
begin 
     l2b1_req_2a_addr1_0 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b1_wr_q_loc_0  = dram_Ch0_l2b1_wr_q[i];
     l2b1_req_2a_addr1_0 = (samp_addr_l2b1_wr_q_loc_0[39] && ({samp_addr_l2b1_wr_q_loc_0[35:32],samp_addr_l2b1_wr_q_loc_0[5],samp_addr_l2b1_wr_q_loc_0[28:14],samp_addr_l2b1_wr_q_loc_0[13:6],samp_addr_l2b1_wr_q_loc_0[31:29],samp_addr_l2b1_wr_q_loc_0[4]} == SCHMOO_RD_WR_ADDR)) || l2b1_req_2a_addr1_0;
    end
 
    dram_Ch0_l2b1_wr_req_2a_addr_vld <= l2b1_req_2a_addr1_0;
    

end
reg  dram_Ch1_l2b0_rd_req_2a_addr_vld;
reg  l2b0_req_2a_addr_1;
reg [39:0] samp_addr_l2b0_rd_q_loc_1;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch1_l2b0_rd_q_0 or dram_Ch1_l2b0_rd_q_1 or dram_Ch1_l2b0_rd_q_2 or dram_Ch1_l2b0_rd_q_3 or
          dram_Ch1_l2b0_rd_q_4 or dram_Ch1_l2b0_rd_q_5 or dram_Ch1_l2b0_rd_q_6 or dram_Ch1_l2b0_rd_q_7)
begin 
     l2b0_req_2a_addr_1 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b0_rd_q_loc_1  = dram_Ch1_l2b0_rd_q[i];
     l2b0_req_2a_addr_1 = (samp_addr_l2b0_rd_q_loc_1[39] && ({samp_addr_l2b0_rd_q_loc_1[35:32],samp_addr_l2b0_rd_q_loc_1[5],samp_addr_l2b0_rd_q_loc_1[28:14],samp_addr_l2b0_rd_q_loc_1[13:6],samp_addr_l2b0_rd_q_loc_1[31:29],samp_addr_l2b0_rd_q_loc_1[4]} == SCHMOO_RD_WR_ADDR)) || l2b0_req_2a_addr_1;
    end
 
    dram_Ch1_l2b0_rd_req_2a_addr_vld <= l2b0_req_2a_addr_1;
    

end
 
reg  dram_Ch1_l2b0_wr_req_2a_addr_vld;
reg  l2b0_req_2a_addr1_1;
reg [39:0] samp_addr_l2b0_wr_q_loc_1;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch1_l2b0_wr_q_0 or dram_Ch1_l2b0_wr_q_1 or dram_Ch1_l2b0_wr_q_2 or dram_Ch1_l2b0_wr_q_3 or
          dram_Ch1_l2b0_wr_q_4 or dram_Ch1_l2b0_wr_q_5 or dram_Ch1_l2b0_wr_q_6 or dram_Ch1_l2b0_wr_q_7)
begin 
     l2b0_req_2a_addr1_1 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b0_wr_q_loc_1  = dram_Ch1_l2b0_wr_q[i];
     l2b0_req_2a_addr1_1 = (samp_addr_l2b0_wr_q_loc_1[39] && ({samp_addr_l2b0_wr_q_loc_1[35:32],samp_addr_l2b0_wr_q_loc_1[5],samp_addr_l2b0_wr_q_loc_1[28:14],samp_addr_l2b0_wr_q_loc_1[13:6],samp_addr_l2b0_wr_q_loc_1[31:29],samp_addr_l2b0_wr_q_loc_1[4]} == SCHMOO_RD_WR_ADDR)) || l2b0_req_2a_addr1_1;
    end
 
    dram_Ch1_l2b0_wr_req_2a_addr_vld <= l2b0_req_2a_addr1_1;
    

end
reg  dram_Ch1_l2b1_rd_req_2a_addr_vld;
reg  l2b1_req_2a_addr_1;
reg [39:0] samp_addr_l2b1_rd_q_loc_1;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch1_l2b1_rd_q_0 or dram_Ch1_l2b1_rd_q_1 or dram_Ch1_l2b1_rd_q_2 or dram_Ch1_l2b1_rd_q_3 or
          dram_Ch1_l2b1_rd_q_4 or dram_Ch1_l2b1_rd_q_5 or dram_Ch1_l2b1_rd_q_6 or dram_Ch1_l2b1_rd_q_7)
begin 
     l2b1_req_2a_addr_1 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b1_rd_q_loc_1  = dram_Ch1_l2b1_rd_q[i];
     l2b1_req_2a_addr_1 = (samp_addr_l2b1_rd_q_loc_1[39] && ({samp_addr_l2b1_rd_q_loc_1[35:32],samp_addr_l2b1_rd_q_loc_1[5],samp_addr_l2b1_rd_q_loc_1[28:14],samp_addr_l2b1_rd_q_loc_1[13:6],samp_addr_l2b1_rd_q_loc_1[31:29],samp_addr_l2b1_rd_q_loc_1[4]} == SCHMOO_RD_WR_ADDR)) || l2b1_req_2a_addr_1;
    end
 
    dram_Ch1_l2b1_rd_req_2a_addr_vld <= l2b1_req_2a_addr_1;
    

end
 
reg  dram_Ch1_l2b1_wr_req_2a_addr_vld;
reg  l2b1_req_2a_addr1_1;
reg [39:0] samp_addr_l2b1_wr_q_loc_1;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch1_l2b1_wr_q_0 or dram_Ch1_l2b1_wr_q_1 or dram_Ch1_l2b1_wr_q_2 or dram_Ch1_l2b1_wr_q_3 or
          dram_Ch1_l2b1_wr_q_4 or dram_Ch1_l2b1_wr_q_5 or dram_Ch1_l2b1_wr_q_6 or dram_Ch1_l2b1_wr_q_7)
begin 
     l2b1_req_2a_addr1_1 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b1_wr_q_loc_1  = dram_Ch1_l2b1_wr_q[i];
     l2b1_req_2a_addr1_1 = (samp_addr_l2b1_wr_q_loc_1[39] && ({samp_addr_l2b1_wr_q_loc_1[35:32],samp_addr_l2b1_wr_q_loc_1[5],samp_addr_l2b1_wr_q_loc_1[28:14],samp_addr_l2b1_wr_q_loc_1[13:6],samp_addr_l2b1_wr_q_loc_1[31:29],samp_addr_l2b1_wr_q_loc_1[4]} == SCHMOO_RD_WR_ADDR)) || l2b1_req_2a_addr1_1;
    end
 
    dram_Ch1_l2b1_wr_req_2a_addr_vld <= l2b1_req_2a_addr1_1;
    

end
reg  dram_Ch2_l2b0_rd_req_2a_addr_vld;
reg  l2b0_req_2a_addr_2;
reg [39:0] samp_addr_l2b0_rd_q_loc_2;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch2_l2b0_rd_q_0 or dram_Ch2_l2b0_rd_q_1 or dram_Ch2_l2b0_rd_q_2 or dram_Ch2_l2b0_rd_q_3 or
          dram_Ch2_l2b0_rd_q_4 or dram_Ch2_l2b0_rd_q_5 or dram_Ch2_l2b0_rd_q_6 or dram_Ch2_l2b0_rd_q_7)
begin 
     l2b0_req_2a_addr_2 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b0_rd_q_loc_2  = dram_Ch2_l2b0_rd_q[i];
     l2b0_req_2a_addr_2 = (samp_addr_l2b0_rd_q_loc_2[39] && ({samp_addr_l2b0_rd_q_loc_2[35:32],samp_addr_l2b0_rd_q_loc_2[5],samp_addr_l2b0_rd_q_loc_2[28:14],samp_addr_l2b0_rd_q_loc_2[13:6],samp_addr_l2b0_rd_q_loc_2[31:29],samp_addr_l2b0_rd_q_loc_2[4]} == SCHMOO_RD_WR_ADDR)) || l2b0_req_2a_addr_2;
    end
 
    dram_Ch2_l2b0_rd_req_2a_addr_vld <= l2b0_req_2a_addr_2;
    

end
 
reg  dram_Ch2_l2b0_wr_req_2a_addr_vld;
reg  l2b0_req_2a_addr1_2;
reg [39:0] samp_addr_l2b0_wr_q_loc_2;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch2_l2b0_wr_q_0 or dram_Ch2_l2b0_wr_q_1 or dram_Ch2_l2b0_wr_q_2 or dram_Ch2_l2b0_wr_q_3 or
          dram_Ch2_l2b0_wr_q_4 or dram_Ch2_l2b0_wr_q_5 or dram_Ch2_l2b0_wr_q_6 or dram_Ch2_l2b0_wr_q_7)
begin 
     l2b0_req_2a_addr1_2 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b0_wr_q_loc_2  = dram_Ch2_l2b0_wr_q[i];
     l2b0_req_2a_addr1_2 = (samp_addr_l2b0_wr_q_loc_2[39] && ({samp_addr_l2b0_wr_q_loc_2[35:32],samp_addr_l2b0_wr_q_loc_2[5],samp_addr_l2b0_wr_q_loc_2[28:14],samp_addr_l2b0_wr_q_loc_2[13:6],samp_addr_l2b0_wr_q_loc_2[31:29],samp_addr_l2b0_wr_q_loc_2[4]} == SCHMOO_RD_WR_ADDR)) || l2b0_req_2a_addr1_2;
    end
 
    dram_Ch2_l2b0_wr_req_2a_addr_vld <= l2b0_req_2a_addr1_2;
    

end
reg  dram_Ch2_l2b1_rd_req_2a_addr_vld;
reg  l2b1_req_2a_addr_2;
reg [39:0] samp_addr_l2b1_rd_q_loc_2;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch2_l2b1_rd_q_0 or dram_Ch2_l2b1_rd_q_1 or dram_Ch2_l2b1_rd_q_2 or dram_Ch2_l2b1_rd_q_3 or
          dram_Ch2_l2b1_rd_q_4 or dram_Ch2_l2b1_rd_q_5 or dram_Ch2_l2b1_rd_q_6 or dram_Ch2_l2b1_rd_q_7)
begin 
     l2b1_req_2a_addr_2 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b1_rd_q_loc_2  = dram_Ch2_l2b1_rd_q[i];
     l2b1_req_2a_addr_2 = (samp_addr_l2b1_rd_q_loc_2[39] && ({samp_addr_l2b1_rd_q_loc_2[35:32],samp_addr_l2b1_rd_q_loc_2[5],samp_addr_l2b1_rd_q_loc_2[28:14],samp_addr_l2b1_rd_q_loc_2[13:6],samp_addr_l2b1_rd_q_loc_2[31:29],samp_addr_l2b1_rd_q_loc_2[4]} == SCHMOO_RD_WR_ADDR)) || l2b1_req_2a_addr_2;
    end
 
    dram_Ch2_l2b1_rd_req_2a_addr_vld <= l2b1_req_2a_addr_2;
    

end
 
reg  dram_Ch2_l2b1_wr_req_2a_addr_vld;
reg  l2b1_req_2a_addr1_2;
reg [39:0] samp_addr_l2b1_wr_q_loc_2;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch2_l2b1_wr_q_0 or dram_Ch2_l2b1_wr_q_1 or dram_Ch2_l2b1_wr_q_2 or dram_Ch2_l2b1_wr_q_3 or
          dram_Ch2_l2b1_wr_q_4 or dram_Ch2_l2b1_wr_q_5 or dram_Ch2_l2b1_wr_q_6 or dram_Ch2_l2b1_wr_q_7)
begin 
     l2b1_req_2a_addr1_2 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b1_wr_q_loc_2  = dram_Ch2_l2b1_wr_q[i];
     l2b1_req_2a_addr1_2 = (samp_addr_l2b1_wr_q_loc_2[39] && ({samp_addr_l2b1_wr_q_loc_2[35:32],samp_addr_l2b1_wr_q_loc_2[5],samp_addr_l2b1_wr_q_loc_2[28:14],samp_addr_l2b1_wr_q_loc_2[13:6],samp_addr_l2b1_wr_q_loc_2[31:29],samp_addr_l2b1_wr_q_loc_2[4]} == SCHMOO_RD_WR_ADDR)) || l2b1_req_2a_addr1_2;
    end
 
    dram_Ch2_l2b1_wr_req_2a_addr_vld <= l2b1_req_2a_addr1_2;
    

end
reg  dram_Ch3_l2b0_rd_req_2a_addr_vld;
reg  l2b0_req_2a_addr_3;
reg [39:0] samp_addr_l2b0_rd_q_loc_3;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch3_l2b0_rd_q_0 or dram_Ch3_l2b0_rd_q_1 or dram_Ch3_l2b0_rd_q_2 or dram_Ch3_l2b0_rd_q_3 or
          dram_Ch3_l2b0_rd_q_4 or dram_Ch3_l2b0_rd_q_5 or dram_Ch3_l2b0_rd_q_6 or dram_Ch3_l2b0_rd_q_7)
begin 
     l2b0_req_2a_addr_3 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b0_rd_q_loc_3  = dram_Ch3_l2b0_rd_q[i];
     l2b0_req_2a_addr_3 = (samp_addr_l2b0_rd_q_loc_3[39] && ({samp_addr_l2b0_rd_q_loc_3[35:32],samp_addr_l2b0_rd_q_loc_3[5],samp_addr_l2b0_rd_q_loc_3[28:14],samp_addr_l2b0_rd_q_loc_3[13:6],samp_addr_l2b0_rd_q_loc_3[31:29],samp_addr_l2b0_rd_q_loc_3[4]} == SCHMOO_RD_WR_ADDR)) || l2b0_req_2a_addr_3;
    end
 
    dram_Ch3_l2b0_rd_req_2a_addr_vld <= l2b0_req_2a_addr_3;
    

end
 
reg  dram_Ch3_l2b0_wr_req_2a_addr_vld;
reg  l2b0_req_2a_addr1_3;
reg [39:0] samp_addr_l2b0_wr_q_loc_3;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch3_l2b0_wr_q_0 or dram_Ch3_l2b0_wr_q_1 or dram_Ch3_l2b0_wr_q_2 or dram_Ch3_l2b0_wr_q_3 or
          dram_Ch3_l2b0_wr_q_4 or dram_Ch3_l2b0_wr_q_5 or dram_Ch3_l2b0_wr_q_6 or dram_Ch3_l2b0_wr_q_7)
begin 
     l2b0_req_2a_addr1_3 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b0_wr_q_loc_3  = dram_Ch3_l2b0_wr_q[i];
     l2b0_req_2a_addr1_3 = (samp_addr_l2b0_wr_q_loc_3[39] && ({samp_addr_l2b0_wr_q_loc_3[35:32],samp_addr_l2b0_wr_q_loc_3[5],samp_addr_l2b0_wr_q_loc_3[28:14],samp_addr_l2b0_wr_q_loc_3[13:6],samp_addr_l2b0_wr_q_loc_3[31:29],samp_addr_l2b0_wr_q_loc_3[4]} == SCHMOO_RD_WR_ADDR)) || l2b0_req_2a_addr1_3;
    end
 
    dram_Ch3_l2b0_wr_req_2a_addr_vld <= l2b0_req_2a_addr1_3;
    

end
reg  dram_Ch3_l2b1_rd_req_2a_addr_vld;
reg  l2b1_req_2a_addr_3;
reg [39:0] samp_addr_l2b1_rd_q_loc_3;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch3_l2b1_rd_q_0 or dram_Ch3_l2b1_rd_q_1 or dram_Ch3_l2b1_rd_q_2 or dram_Ch3_l2b1_rd_q_3 or
          dram_Ch3_l2b1_rd_q_4 or dram_Ch3_l2b1_rd_q_5 or dram_Ch3_l2b1_rd_q_6 or dram_Ch3_l2b1_rd_q_7)
begin 
     l2b1_req_2a_addr_3 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b1_rd_q_loc_3  = dram_Ch3_l2b1_rd_q[i];
     l2b1_req_2a_addr_3 = (samp_addr_l2b1_rd_q_loc_3[39] && ({samp_addr_l2b1_rd_q_loc_3[35:32],samp_addr_l2b1_rd_q_loc_3[5],samp_addr_l2b1_rd_q_loc_3[28:14],samp_addr_l2b1_rd_q_loc_3[13:6],samp_addr_l2b1_rd_q_loc_3[31:29],samp_addr_l2b1_rd_q_loc_3[4]} == SCHMOO_RD_WR_ADDR)) || l2b1_req_2a_addr_3;
    end
 
    dram_Ch3_l2b1_rd_req_2a_addr_vld <= l2b1_req_2a_addr_3;
    

end
 
reg  dram_Ch3_l2b1_wr_req_2a_addr_vld;
reg  l2b1_req_2a_addr1_3;
reg [39:0] samp_addr_l2b1_wr_q_loc_3;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch3_l2b1_wr_q_0 or dram_Ch3_l2b1_wr_q_1 or dram_Ch3_l2b1_wr_q_2 or dram_Ch3_l2b1_wr_q_3 or
          dram_Ch3_l2b1_wr_q_4 or dram_Ch3_l2b1_wr_q_5 or dram_Ch3_l2b1_wr_q_6 or dram_Ch3_l2b1_wr_q_7)
begin 
     l2b1_req_2a_addr1_3 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_l2b1_wr_q_loc_3  = dram_Ch3_l2b1_wr_q[i];
     l2b1_req_2a_addr1_3 = (samp_addr_l2b1_wr_q_loc_3[39] && ({samp_addr_l2b1_wr_q_loc_3[35:32],samp_addr_l2b1_wr_q_loc_3[5],samp_addr_l2b1_wr_q_loc_3[28:14],samp_addr_l2b1_wr_q_loc_3[13:6],samp_addr_l2b1_wr_q_loc_3[31:29],samp_addr_l2b1_wr_q_loc_3[4]} == SCHMOO_RD_WR_ADDR)) || l2b1_req_2a_addr1_3;
    end
 
    dram_Ch3_l2b1_wr_req_2a_addr_vld <= l2b1_req_2a_addr1_3;
    

end

// -------- Monitor scrub to the same address as wr read
//          Scrub address asssumed valid from scrb read to write. 
//          We are xing between the scrub happening and a valid data 
//          to same address in rd/wr q  ---------------

reg  dram_Ch0_scrb_req_vld;
wire dram_Ch0_scrb_req_2a_addr_vld;


always @(posedge (`MCU_CLK && enabled)) 
begin 
  if (~dram_rst_l)
   begin
    dram_Ch0_scrb_req_vld <= 1'b0;
   end
  else begin 
    if (dram_Ch0_que_scrb_picked && dram_Ch0_que_scrb_rd_picked && dram_Ch0_que_ras_bank_picked_en) begin 
      dram_Ch0_scrb_req_vld <= 1'b1;
    end else if (dram_Ch0_que_scrb_write_req) begin 
      dram_Ch0_scrb_req_vld <= 1'b0;
    end
  end
end


// MAQ assign      dram_Ch0_scrb_req_2a_addr_vld = ({dram_Ch0_que_scrb_addr_picked[35], dram_Ch0_que_scrb_addr_picked[33:0]} == SCHMOO_SCRB_ADDR) && dram_Ch0_scrb_req_vld;
assign      dram_Ch0_scrb_req_2a_addr_vld = (dram_Ch0_que_scrb_addr_picked[31:0] == SCHMOO_SCRB_ADDR) && (dram_Ch0_scrb_req_vld === 1'b1);
 
reg  dram_Ch1_scrb_req_vld;
wire dram_Ch1_scrb_req_2a_addr_vld;


always @(posedge (`MCU_CLK && enabled)) 
begin 
  if (~dram_rst_l)
   begin
    dram_Ch1_scrb_req_vld <= 1'b0;
   end
  else begin 
    if (dram_Ch1_que_scrb_picked && dram_Ch1_que_scrb_rd_picked && dram_Ch1_que_ras_bank_picked_en) begin 
      dram_Ch1_scrb_req_vld <= 1'b1;
    end else if (dram_Ch1_que_scrb_write_req) begin 
      dram_Ch1_scrb_req_vld <= 1'b0;
    end
  end
end


// MAQ assign      dram_Ch1_scrb_req_2a_addr_vld = ({dram_Ch1_que_scrb_addr_picked[35], dram_Ch1_que_scrb_addr_picked[33:0]} == SCHMOO_SCRB_ADDR) && dram_Ch1_scrb_req_vld;
assign      dram_Ch1_scrb_req_2a_addr_vld = (dram_Ch1_que_scrb_addr_picked[31:0] == SCHMOO_SCRB_ADDR) && (dram_Ch1_scrb_req_vld === 1'b1);
 
reg  dram_Ch2_scrb_req_vld;
wire dram_Ch2_scrb_req_2a_addr_vld;


always @(posedge (`MCU_CLK && enabled)) 
begin 
  if (~dram_rst_l)
   begin
    dram_Ch2_scrb_req_vld <= 1'b0;
   end
  else begin 
    if (dram_Ch2_que_scrb_picked && dram_Ch2_que_scrb_rd_picked && dram_Ch2_que_ras_bank_picked_en) begin 
      dram_Ch2_scrb_req_vld <= 1'b1;
    end else if (dram_Ch2_que_scrb_write_req) begin 
      dram_Ch2_scrb_req_vld <= 1'b0;
    end
  end
end


// MAQ assign      dram_Ch2_scrb_req_2a_addr_vld = ({dram_Ch2_que_scrb_addr_picked[35], dram_Ch2_que_scrb_addr_picked[33:0]} == SCHMOO_SCRB_ADDR) && dram_Ch2_scrb_req_vld;
assign      dram_Ch2_scrb_req_2a_addr_vld = (dram_Ch2_que_scrb_addr_picked[31:0] == SCHMOO_SCRB_ADDR) && (dram_Ch2_scrb_req_vld === 1'b1);
 
reg  dram_Ch3_scrb_req_vld;
wire dram_Ch3_scrb_req_2a_addr_vld;


always @(posedge (`MCU_CLK && enabled)) 
begin 
  if (~dram_rst_l)
   begin
    dram_Ch3_scrb_req_vld <= 1'b0;
   end
  else begin 
    if (dram_Ch3_que_scrb_picked && dram_Ch3_que_scrb_rd_picked && dram_Ch3_que_ras_bank_picked_en) begin 
      dram_Ch3_scrb_req_vld <= 1'b1;
    end else if (dram_Ch3_que_scrb_write_req) begin 
      dram_Ch3_scrb_req_vld <= 1'b0;
    end
  end
end


// MAQ assign      dram_Ch3_scrb_req_2a_addr_vld = ({dram_Ch3_que_scrb_addr_picked[35], dram_Ch3_que_scrb_addr_picked[33:0]} == SCHMOO_SCRB_ADDR) && dram_Ch3_scrb_req_vld;
assign      dram_Ch3_scrb_req_2a_addr_vld = (dram_Ch3_que_scrb_addr_picked[31:0] == SCHMOO_SCRB_ADDR) && (dram_Ch3_scrb_req_vld === 1'b1);
 

// Monitor Traffic on each CS
reg [10:0]  dram_Ch0_cs0_bank_req_cntr [7:0];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_0 = dram_Ch0_cs0_bank_req_cntr[0];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_1 = dram_Ch0_cs0_bank_req_cntr[1];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_2 = dram_Ch0_cs0_bank_req_cntr[2];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_3 = dram_Ch0_cs0_bank_req_cntr[3];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_4 = dram_Ch0_cs0_bank_req_cntr[4];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_5 = dram_Ch0_cs0_bank_req_cntr[5];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_6 = dram_Ch0_cs0_bank_req_cntr[6];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_7 = dram_Ch0_cs0_bank_req_cntr[7];
reg [10:0]  dram_Ch0_cs1_bank_req_cntr [7:0];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_0 = dram_Ch0_cs1_bank_req_cntr[0];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_1 = dram_Ch0_cs1_bank_req_cntr[1];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_2 = dram_Ch0_cs1_bank_req_cntr[2];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_3 = dram_Ch0_cs1_bank_req_cntr[3];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_4 = dram_Ch0_cs1_bank_req_cntr[4];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_5 = dram_Ch0_cs1_bank_req_cntr[5];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_6 = dram_Ch0_cs1_bank_req_cntr[6];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_7 = dram_Ch0_cs1_bank_req_cntr[7];
reg [10:0]  dram_Ch0_cs2_bank_req_cntr [7:0];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_0 = dram_Ch0_cs2_bank_req_cntr[0];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_1 = dram_Ch0_cs2_bank_req_cntr[1];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_2 = dram_Ch0_cs2_bank_req_cntr[2];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_3 = dram_Ch0_cs2_bank_req_cntr[3];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_4 = dram_Ch0_cs2_bank_req_cntr[4];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_5 = dram_Ch0_cs2_bank_req_cntr[5];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_6 = dram_Ch0_cs2_bank_req_cntr[6];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_7 = dram_Ch0_cs2_bank_req_cntr[7];
reg [10:0]  dram_Ch0_cs3_bank_req_cntr [7:0];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_0 = dram_Ch0_cs3_bank_req_cntr[0];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_1 = dram_Ch0_cs3_bank_req_cntr[1];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_2 = dram_Ch0_cs3_bank_req_cntr[2];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_3 = dram_Ch0_cs3_bank_req_cntr[3];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_4 = dram_Ch0_cs3_bank_req_cntr[4];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_5 = dram_Ch0_cs3_bank_req_cntr[5];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_6 = dram_Ch0_cs3_bank_req_cntr[6];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_7 = dram_Ch0_cs3_bank_req_cntr[7];


/*************************************************************************************************
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_cs0_bank_req_cntr[i] = 0;
       dram_Ch0_cs1_bank_req_cntr[i] = 0;
       dram_Ch0_cs2_bank_req_cntr[i] = 0;
       dram_Ch0_cs3_bank_req_cntr[i] = 0;
     end
   end
  else
   begin
     if ( !dram_Ch0_RAS_L && dram_Ch0_CAS_L && dram_Ch0_WE_L ) begin 
       case (dram_Ch0_CS_L) 
               4'b1110 : dram_Ch0_cs0_bank_req_cntr[dram_Ch0_BA] = dram_Ch0_cs0_bank_req_cntr[dram_Ch0_BA] + 1; 
               4'b1101 : dram_Ch0_cs1_bank_req_cntr[dram_Ch0_BA] = dram_Ch0_cs1_bank_req_cntr[dram_Ch0_BA] + 1; 
               4'b1011 : dram_Ch0_cs2_bank_req_cntr[dram_Ch0_BA] = dram_Ch0_cs2_bank_req_cntr[dram_Ch0_BA] + 1; 
               4'b0111 : dram_Ch0_cs3_bank_req_cntr[dram_Ch0_BA] = dram_Ch0_cs3_bank_req_cntr[dram_Ch0_BA] + 1; 
               default : begin 
                      `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch0:l2b2 ");
		      `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d CS_L = %x ", $time, dram_Ch0_CS_L);
                      finish_test(" Wrong CS  : CS_L should not have more that 1 device selected ", 0);
                    end
           
        endcase
     end
    end
end
***************************************************************************************************/
reg [10:0]  dram_Ch1_cs0_bank_req_cntr [7:0];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_0 = dram_Ch1_cs0_bank_req_cntr[0];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_1 = dram_Ch1_cs0_bank_req_cntr[1];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_2 = dram_Ch1_cs0_bank_req_cntr[2];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_3 = dram_Ch1_cs0_bank_req_cntr[3];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_4 = dram_Ch1_cs0_bank_req_cntr[4];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_5 = dram_Ch1_cs0_bank_req_cntr[5];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_6 = dram_Ch1_cs0_bank_req_cntr[6];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_7 = dram_Ch1_cs0_bank_req_cntr[7];
reg [10:0]  dram_Ch1_cs1_bank_req_cntr [7:0];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_0 = dram_Ch1_cs1_bank_req_cntr[0];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_1 = dram_Ch1_cs1_bank_req_cntr[1];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_2 = dram_Ch1_cs1_bank_req_cntr[2];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_3 = dram_Ch1_cs1_bank_req_cntr[3];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_4 = dram_Ch1_cs1_bank_req_cntr[4];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_5 = dram_Ch1_cs1_bank_req_cntr[5];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_6 = dram_Ch1_cs1_bank_req_cntr[6];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_7 = dram_Ch1_cs1_bank_req_cntr[7];
reg [10:0]  dram_Ch1_cs2_bank_req_cntr [7:0];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_0 = dram_Ch1_cs2_bank_req_cntr[0];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_1 = dram_Ch1_cs2_bank_req_cntr[1];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_2 = dram_Ch1_cs2_bank_req_cntr[2];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_3 = dram_Ch1_cs2_bank_req_cntr[3];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_4 = dram_Ch1_cs2_bank_req_cntr[4];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_5 = dram_Ch1_cs2_bank_req_cntr[5];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_6 = dram_Ch1_cs2_bank_req_cntr[6];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_7 = dram_Ch1_cs2_bank_req_cntr[7];
reg [10:0]  dram_Ch1_cs3_bank_req_cntr [7:0];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_0 = dram_Ch1_cs3_bank_req_cntr[0];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_1 = dram_Ch1_cs3_bank_req_cntr[1];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_2 = dram_Ch1_cs3_bank_req_cntr[2];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_3 = dram_Ch1_cs3_bank_req_cntr[3];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_4 = dram_Ch1_cs3_bank_req_cntr[4];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_5 = dram_Ch1_cs3_bank_req_cntr[5];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_6 = dram_Ch1_cs3_bank_req_cntr[6];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_7 = dram_Ch1_cs3_bank_req_cntr[7];


/*************************************************************************************************
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_cs0_bank_req_cntr[i] = 0;
       dram_Ch1_cs1_bank_req_cntr[i] = 0;
       dram_Ch1_cs2_bank_req_cntr[i] = 0;
       dram_Ch1_cs3_bank_req_cntr[i] = 0;
     end
   end
  else
   begin
     if ( !dram_Ch1_RAS_L && dram_Ch1_CAS_L && dram_Ch1_WE_L ) begin 
       case (dram_Ch1_CS_L) 
               4'b1110 : dram_Ch1_cs0_bank_req_cntr[dram_Ch1_BA] = dram_Ch1_cs0_bank_req_cntr[dram_Ch1_BA] + 1; 
               4'b1101 : dram_Ch1_cs1_bank_req_cntr[dram_Ch1_BA] = dram_Ch1_cs1_bank_req_cntr[dram_Ch1_BA] + 1; 
               4'b1011 : dram_Ch1_cs2_bank_req_cntr[dram_Ch1_BA] = dram_Ch1_cs2_bank_req_cntr[dram_Ch1_BA] + 1; 
               4'b0111 : dram_Ch1_cs3_bank_req_cntr[dram_Ch1_BA] = dram_Ch1_cs3_bank_req_cntr[dram_Ch1_BA] + 1; 
               default : begin 
                      `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch1:l2b2 ");
		      `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d CS_L = %x ", $time, dram_Ch1_CS_L);
                      finish_test(" Wrong CS  : CS_L should not have more that 1 device selected ", 1);
                    end
           
        endcase
     end
    end
end
***************************************************************************************************/
reg [10:0]  dram_Ch2_cs0_bank_req_cntr [7:0];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_0 = dram_Ch2_cs0_bank_req_cntr[0];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_1 = dram_Ch2_cs0_bank_req_cntr[1];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_2 = dram_Ch2_cs0_bank_req_cntr[2];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_3 = dram_Ch2_cs0_bank_req_cntr[3];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_4 = dram_Ch2_cs0_bank_req_cntr[4];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_5 = dram_Ch2_cs0_bank_req_cntr[5];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_6 = dram_Ch2_cs0_bank_req_cntr[6];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_7 = dram_Ch2_cs0_bank_req_cntr[7];
reg [10:0]  dram_Ch2_cs1_bank_req_cntr [7:0];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_0 = dram_Ch2_cs1_bank_req_cntr[0];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_1 = dram_Ch2_cs1_bank_req_cntr[1];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_2 = dram_Ch2_cs1_bank_req_cntr[2];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_3 = dram_Ch2_cs1_bank_req_cntr[3];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_4 = dram_Ch2_cs1_bank_req_cntr[4];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_5 = dram_Ch2_cs1_bank_req_cntr[5];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_6 = dram_Ch2_cs1_bank_req_cntr[6];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_7 = dram_Ch2_cs1_bank_req_cntr[7];
reg [10:0]  dram_Ch2_cs2_bank_req_cntr [7:0];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_0 = dram_Ch2_cs2_bank_req_cntr[0];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_1 = dram_Ch2_cs2_bank_req_cntr[1];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_2 = dram_Ch2_cs2_bank_req_cntr[2];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_3 = dram_Ch2_cs2_bank_req_cntr[3];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_4 = dram_Ch2_cs2_bank_req_cntr[4];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_5 = dram_Ch2_cs2_bank_req_cntr[5];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_6 = dram_Ch2_cs2_bank_req_cntr[6];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_7 = dram_Ch2_cs2_bank_req_cntr[7];
reg [10:0]  dram_Ch2_cs3_bank_req_cntr [7:0];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_0 = dram_Ch2_cs3_bank_req_cntr[0];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_1 = dram_Ch2_cs3_bank_req_cntr[1];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_2 = dram_Ch2_cs3_bank_req_cntr[2];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_3 = dram_Ch2_cs3_bank_req_cntr[3];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_4 = dram_Ch2_cs3_bank_req_cntr[4];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_5 = dram_Ch2_cs3_bank_req_cntr[5];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_6 = dram_Ch2_cs3_bank_req_cntr[6];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_7 = dram_Ch2_cs3_bank_req_cntr[7];


/*************************************************************************************************
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_cs0_bank_req_cntr[i] = 0;
       dram_Ch2_cs1_bank_req_cntr[i] = 0;
       dram_Ch2_cs2_bank_req_cntr[i] = 0;
       dram_Ch2_cs3_bank_req_cntr[i] = 0;
     end
   end
  else
   begin
     if ( !dram_Ch2_RAS_L && dram_Ch2_CAS_L && dram_Ch2_WE_L ) begin 
       case (dram_Ch2_CS_L) 
               4'b1110 : dram_Ch2_cs0_bank_req_cntr[dram_Ch2_BA] = dram_Ch2_cs0_bank_req_cntr[dram_Ch2_BA] + 1; 
               4'b1101 : dram_Ch2_cs1_bank_req_cntr[dram_Ch2_BA] = dram_Ch2_cs1_bank_req_cntr[dram_Ch2_BA] + 1; 
               4'b1011 : dram_Ch2_cs2_bank_req_cntr[dram_Ch2_BA] = dram_Ch2_cs2_bank_req_cntr[dram_Ch2_BA] + 1; 
               4'b0111 : dram_Ch2_cs3_bank_req_cntr[dram_Ch2_BA] = dram_Ch2_cs3_bank_req_cntr[dram_Ch2_BA] + 1; 
               default : begin 
                      `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch2:l2b2 ");
		      `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d CS_L = %x ", $time, dram_Ch2_CS_L);
                      finish_test(" Wrong CS  : CS_L should not have more that 1 device selected ", 2);
                    end
           
        endcase
     end
    end
end
***************************************************************************************************/
reg [10:0]  dram_Ch3_cs0_bank_req_cntr [7:0];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_0 = dram_Ch3_cs0_bank_req_cntr[0];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_1 = dram_Ch3_cs0_bank_req_cntr[1];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_2 = dram_Ch3_cs0_bank_req_cntr[2];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_3 = dram_Ch3_cs0_bank_req_cntr[3];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_4 = dram_Ch3_cs0_bank_req_cntr[4];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_5 = dram_Ch3_cs0_bank_req_cntr[5];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_6 = dram_Ch3_cs0_bank_req_cntr[6];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_7 = dram_Ch3_cs0_bank_req_cntr[7];
reg [10:0]  dram_Ch3_cs1_bank_req_cntr [7:0];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_0 = dram_Ch3_cs1_bank_req_cntr[0];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_1 = dram_Ch3_cs1_bank_req_cntr[1];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_2 = dram_Ch3_cs1_bank_req_cntr[2];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_3 = dram_Ch3_cs1_bank_req_cntr[3];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_4 = dram_Ch3_cs1_bank_req_cntr[4];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_5 = dram_Ch3_cs1_bank_req_cntr[5];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_6 = dram_Ch3_cs1_bank_req_cntr[6];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_7 = dram_Ch3_cs1_bank_req_cntr[7];
reg [10:0]  dram_Ch3_cs2_bank_req_cntr [7:0];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_0 = dram_Ch3_cs2_bank_req_cntr[0];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_1 = dram_Ch3_cs2_bank_req_cntr[1];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_2 = dram_Ch3_cs2_bank_req_cntr[2];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_3 = dram_Ch3_cs2_bank_req_cntr[3];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_4 = dram_Ch3_cs2_bank_req_cntr[4];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_5 = dram_Ch3_cs2_bank_req_cntr[5];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_6 = dram_Ch3_cs2_bank_req_cntr[6];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_7 = dram_Ch3_cs2_bank_req_cntr[7];
reg [10:0]  dram_Ch3_cs3_bank_req_cntr [7:0];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_0 = dram_Ch3_cs3_bank_req_cntr[0];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_1 = dram_Ch3_cs3_bank_req_cntr[1];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_2 = dram_Ch3_cs3_bank_req_cntr[2];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_3 = dram_Ch3_cs3_bank_req_cntr[3];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_4 = dram_Ch3_cs3_bank_req_cntr[4];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_5 = dram_Ch3_cs3_bank_req_cntr[5];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_6 = dram_Ch3_cs3_bank_req_cntr[6];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_7 = dram_Ch3_cs3_bank_req_cntr[7];


/*************************************************************************************************
always @ (posedge (`MCU_CLK && enabled))
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_cs0_bank_req_cntr[i] = 0;
       dram_Ch3_cs1_bank_req_cntr[i] = 0;
       dram_Ch3_cs2_bank_req_cntr[i] = 0;
       dram_Ch3_cs3_bank_req_cntr[i] = 0;
     end
   end
  else
   begin
     if ( !dram_Ch3_RAS_L && dram_Ch3_CAS_L && dram_Ch3_WE_L ) begin 
       case (dram_Ch3_CS_L) 
               4'b1110 : dram_Ch3_cs0_bank_req_cntr[dram_Ch3_BA] = dram_Ch3_cs0_bank_req_cntr[dram_Ch3_BA] + 1; 
               4'b1101 : dram_Ch3_cs1_bank_req_cntr[dram_Ch3_BA] = dram_Ch3_cs1_bank_req_cntr[dram_Ch3_BA] + 1; 
               4'b1011 : dram_Ch3_cs2_bank_req_cntr[dram_Ch3_BA] = dram_Ch3_cs2_bank_req_cntr[dram_Ch3_BA] + 1; 
               4'b0111 : dram_Ch3_cs3_bank_req_cntr[dram_Ch3_BA] = dram_Ch3_cs3_bank_req_cntr[dram_Ch3_BA] + 1; 
               default : begin 
                      `PR_DEBUG("mcusat_cov_mon", `DEBUG, " : In dram channel Ch3:l2b2 ");
		      `PR_DEBUG("mcusat_cov_mon", `DEBUG, "At time %0d CS_L = %x ", $time, dram_Ch3_CS_L);
                      finish_test(" Wrong CS  : CS_L should not have more that 1 device selected ", 3);
                    end
           
        endcase
     end
    end
end
***************************************************************************************************/


// ----- MONITOR TO PRINT OUT L2-DRAM RD/WR AND RD RESPONSE --------



reg [39:0] l2b0_this_addr_0;
reg        l2b0_dvld_dly1_0;
reg        l2b0_dvld_dly2_0;
reg        l2b0_dvld_dly3_0;
reg [2:0]  l2b0_rqid_dly1_0;
reg [2:0]  l2b0_rqid_dly2_0;
reg [2:0]  l2b0_rqid_dly3_0;
// MAQ reg [1:0]  ch_0_l2b0;

reg [2:0]  l2b0_wr_data_cntr_0;
reg [511:0]  l2b0_wr_data_0;
reg [39:0]   l2b0_wr_addr_mon_0;

reg [39:0]  dram_Ch0_l2b0_addr_store [7:0];

initial 
begin 
 l2b0_wr_data_cntr_0 = 0;
 l2b0_wr_data_0 = 0;
 l2b0_wr_addr_mon_0 = 0;
end

always @ (posedge (cmp_clk && enabled))
begin
  if (cmp_rst_l) begin 

   l2b0_dvld_dly1_0 <= dram_Ch0_l2b0_dram_sctag_data_vld;
   l2b0_dvld_dly2_0 <= l2b0_dvld_dly1_0;
   l2b0_dvld_dly3_0 <= l2b0_dvld_dly2_0;
 
   l2b0_rqid_dly1_0 <= dram_Ch0_l2b0_dram_sctag_rd_req_id;
   l2b0_rqid_dly2_0 <= l2b0_rqid_dly1_0;
   l2b0_rqid_dly3_0 <= l2b0_rqid_dly2_0;

   l2b0_this_addr_0 = {dram_Ch0_l2b0_sctag_dram_addr, 5'b0};
     //l2b0_this_addr_0 = 34'd0;


     // Read Req 
     if (dram_Ch0_l2b0_sctag_dram_rd_req && !dram_Ch0_l2b0_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", 0,dram_Ch0_l2b0_sctag_dram_rd_req_id,l2b0_this_addr_0);
        dram_Ch0_l2b0_addr_store[dram_Ch0_l2b0_sctag_dram_rd_req_id] <= l2b0_this_addr_0;
     end

     if (dram_Ch0_l2b0_sctag_dram_rd_req && dram_Ch0_l2b0_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", 0,dram_Ch0_l2b0_sctag_dram_rd_req_id,l2b0_this_addr_0);
        dram_Ch0_l2b0_addr_store[dram_Ch0_l2b0_sctag_dram_rd_req_id] <= l2b0_this_addr_0;
     end

     // Write Req 
     if (dram_Ch0_l2b0_sctag_dram_wr_req ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write      ::            Addr = %x ", 0,l2b0_this_addr_0);
        l2b0_wr_addr_mon_0 = l2b0_this_addr_0;
     end

     if (dram_Ch0_l2b0_sctag_dram_data_vld) begin 
       l2b0_wr_data_0 = {l2b0_wr_data_0,dram_Ch0_l2b0_sctag_dram_wr_data};
      if ( l2b0_wr_data_cntr_0 == 3'b111 ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", 0, l2b0_wr_addr_mon_0, l2b0_wr_data_0);
      end
       l2b0_wr_data_cntr_0 = l2b0_wr_data_cntr_0 + 1;
     end

     // Read Data
     if (l2b0_dvld_dly3_0 == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", 0,l2b0_rqid_dly3_0,dram_Ch0_l2b0_addr_store[l2b0_rqid_dly3_0],dram_Ch0_dram_sctag_data);
     end
   
     // MECC
     if ((l2b0_dvld_dly3_0 == 1'b1) && (dram_Ch0_l2b0_dram_sctag_mecc_err == 1'b1) && (dram_Ch0_l2b0_dram_sctag_pa_err != 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x", 0, l2b0_rqid_dly3_0,dram_Ch0_l2b0_addr_store[l2b0_rqid_dly3_0]);
     end

     // MECC OOB
     if ((l2b0_dvld_dly3_0 == 1'b1) && (dram_Ch0_l2b0_dram_sctag_mecc_err == 1'b1) && (dram_Ch0_l2b0_dram_sctag_pa_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x", 0, l2b0_rqid_dly3_0,dram_Ch0_l2b0_addr_store[l2b0_rqid_dly3_0]);
     end

     // SECC
     if ((l2b0_dvld_dly3_0 == 1'b1) && (dram_Ch0_l2b0_dram_sctag_secc_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", 0,l2b0_rqid_dly3_0,dram_Ch0_l2b0_addr_store[l2b0_rqid_dly3_0]);
     end

     if (dram_Ch0_l2b0_dram_sctag_scb_secc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  SECC err Detected   ", 0);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 0);
	end
     end

     if (dram_Ch0_l2b0_dram_sctag_scb_mecc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  MECC err Detected   ", 0);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 0);
	end
     end

   end

end




reg [39:0] l2b1_this_addr_0;
reg        l2b1_dvld_dly1_0;
reg        l2b1_dvld_dly2_0;
reg        l2b1_dvld_dly3_0;
reg [2:0]  l2b1_rqid_dly1_0;
reg [2:0]  l2b1_rqid_dly2_0;
reg [2:0]  l2b1_rqid_dly3_0;
// MAQ reg [1:0]  ch_0_l2b1;

reg [2:0]  l2b1_wr_data_cntr_0;
reg [511:0]  l2b1_wr_data_0;
reg [39:0]   l2b1_wr_addr_mon_0;

reg [39:0]  dram_Ch0_l2b1_addr_store [7:0];

initial 
begin 
 l2b1_wr_data_cntr_0 = 0;
 l2b1_wr_data_0 = 0;
 l2b1_wr_addr_mon_0 = 0;
end

always @ (posedge (cmp_clk && enabled))
begin
  if (cmp_rst_l) begin 

   l2b1_dvld_dly1_0 <= dram_Ch0_l2b1_dram_sctag_data_vld;
   l2b1_dvld_dly2_0 <= l2b1_dvld_dly1_0;
   l2b1_dvld_dly3_0 <= l2b1_dvld_dly2_0;
 
   l2b1_rqid_dly1_0 <= dram_Ch0_l2b1_dram_sctag_rd_req_id;
   l2b1_rqid_dly2_0 <= l2b1_rqid_dly1_0;
   l2b1_rqid_dly3_0 <= l2b1_rqid_dly2_0;

   l2b1_this_addr_0 = {dram_Ch0_l2b1_sctag_dram_addr, 5'b0};
     //l2b1_this_addr_0 = 34'd0;


     // Read Req 
     if (dram_Ch0_l2b1_sctag_dram_rd_req && !dram_Ch0_l2b1_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", 0,dram_Ch0_l2b1_sctag_dram_rd_req_id,l2b1_this_addr_0);
        dram_Ch0_l2b1_addr_store[dram_Ch0_l2b1_sctag_dram_rd_req_id] <= l2b1_this_addr_0;
     end

     if (dram_Ch0_l2b1_sctag_dram_rd_req && dram_Ch0_l2b1_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", 0,dram_Ch0_l2b1_sctag_dram_rd_req_id,l2b1_this_addr_0);
        dram_Ch0_l2b1_addr_store[dram_Ch0_l2b1_sctag_dram_rd_req_id] <= l2b1_this_addr_0;
     end

     // Write Req 
     if (dram_Ch0_l2b1_sctag_dram_wr_req ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write      ::            Addr = %x ", 0,l2b1_this_addr_0);
        l2b1_wr_addr_mon_0 = l2b1_this_addr_0;
     end

     if (dram_Ch0_l2b1_sctag_dram_data_vld) begin 
       l2b1_wr_data_0 = {l2b1_wr_data_0,dram_Ch0_l2b1_sctag_dram_wr_data};
      if ( l2b1_wr_data_cntr_0 == 3'b111 ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", 0, l2b1_wr_addr_mon_0, l2b1_wr_data_0);
      end
       l2b1_wr_data_cntr_0 = l2b1_wr_data_cntr_0 + 1;
     end

     // Read Data
     if (l2b1_dvld_dly3_0 == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", 0,l2b1_rqid_dly3_0,dram_Ch0_l2b1_addr_store[l2b1_rqid_dly3_0],dram_Ch0_dram_sctag_data);
     end
   
     // MECC
     if ((l2b1_dvld_dly3_0 == 1'b1) && (dram_Ch0_l2b1_dram_sctag_mecc_err == 1'b1) && (dram_Ch0_l2b1_dram_sctag_pa_err != 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x", 0, l2b1_rqid_dly3_0,dram_Ch0_l2b1_addr_store[l2b1_rqid_dly3_0]);
     end

     // MECC OOB
     if ((l2b1_dvld_dly3_0 == 1'b1) && (dram_Ch0_l2b1_dram_sctag_mecc_err == 1'b1) && (dram_Ch0_l2b1_dram_sctag_pa_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x", 0, l2b1_rqid_dly3_0,dram_Ch0_l2b1_addr_store[l2b1_rqid_dly3_0]);
     end

     // SECC
     if ((l2b1_dvld_dly3_0 == 1'b1) && (dram_Ch0_l2b1_dram_sctag_secc_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", 0,l2b1_rqid_dly3_0,dram_Ch0_l2b1_addr_store[l2b1_rqid_dly3_0]);
     end

     if (dram_Ch0_l2b1_dram_sctag_scb_secc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  SECC err Detected   ", 0);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 0);
	end
     end

     if (dram_Ch0_l2b1_dram_sctag_scb_mecc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  MECC err Detected   ", 0);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 0);
	end
     end

   end

end




reg [39:0] l2b0_this_addr_1;
reg        l2b0_dvld_dly1_1;
reg        l2b0_dvld_dly2_1;
reg        l2b0_dvld_dly3_1;
reg [2:0]  l2b0_rqid_dly1_1;
reg [2:0]  l2b0_rqid_dly2_1;
reg [2:0]  l2b0_rqid_dly3_1;
// MAQ reg [1:0]  ch_1_l2b0;

reg [2:0]  l2b0_wr_data_cntr_1;
reg [511:0]  l2b0_wr_data_1;
reg [39:0]   l2b0_wr_addr_mon_1;

reg [39:0]  dram_Ch1_l2b0_addr_store [7:0];

initial 
begin 
 l2b0_wr_data_cntr_1 = 0;
 l2b0_wr_data_1 = 0;
 l2b0_wr_addr_mon_1 = 0;
end

always @ (posedge (cmp_clk && enabled))
begin
  if (cmp_rst_l) begin 

   l2b0_dvld_dly1_1 <= dram_Ch1_l2b0_dram_sctag_data_vld;
   l2b0_dvld_dly2_1 <= l2b0_dvld_dly1_1;
   l2b0_dvld_dly3_1 <= l2b0_dvld_dly2_1;
 
   l2b0_rqid_dly1_1 <= dram_Ch1_l2b0_dram_sctag_rd_req_id;
   l2b0_rqid_dly2_1 <= l2b0_rqid_dly1_1;
   l2b0_rqid_dly3_1 <= l2b0_rqid_dly2_1;

   l2b0_this_addr_1 = {dram_Ch1_l2b0_sctag_dram_addr, 5'b0};
     //l2b0_this_addr_1 = 34'd0;


     // Read Req 
     if (dram_Ch1_l2b0_sctag_dram_rd_req && !dram_Ch1_l2b0_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", 2,dram_Ch1_l2b0_sctag_dram_rd_req_id,l2b0_this_addr_1);
        dram_Ch1_l2b0_addr_store[dram_Ch1_l2b0_sctag_dram_rd_req_id] <= l2b0_this_addr_1;
     end

     if (dram_Ch1_l2b0_sctag_dram_rd_req && dram_Ch1_l2b0_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", 2,dram_Ch1_l2b0_sctag_dram_rd_req_id,l2b0_this_addr_1);
        dram_Ch1_l2b0_addr_store[dram_Ch1_l2b0_sctag_dram_rd_req_id] <= l2b0_this_addr_1;
     end

     // Write Req 
     if (dram_Ch1_l2b0_sctag_dram_wr_req ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write      ::            Addr = %x ", 2,l2b0_this_addr_1);
        l2b0_wr_addr_mon_1 = l2b0_this_addr_1;
     end

     if (dram_Ch1_l2b0_sctag_dram_data_vld) begin 
       l2b0_wr_data_1 = {l2b0_wr_data_1,dram_Ch1_l2b0_sctag_dram_wr_data};
      if ( l2b0_wr_data_cntr_1 == 3'b111 ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", 2, l2b0_wr_addr_mon_1, l2b0_wr_data_1);
      end
       l2b0_wr_data_cntr_1 = l2b0_wr_data_cntr_1 + 1;
     end

     // Read Data
     if (l2b0_dvld_dly3_1 == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", 2,l2b0_rqid_dly3_1,dram_Ch1_l2b0_addr_store[l2b0_rqid_dly3_1],dram_Ch1_dram_sctag_data);
     end
   
     // MECC
     if ((l2b0_dvld_dly3_1 == 1'b1) && (dram_Ch1_l2b0_dram_sctag_mecc_err == 1'b1) && (dram_Ch1_l2b0_dram_sctag_pa_err != 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x", 2, l2b0_rqid_dly3_1,dram_Ch1_l2b0_addr_store[l2b0_rqid_dly3_1]);
     end

     // MECC OOB
     if ((l2b0_dvld_dly3_1 == 1'b1) && (dram_Ch1_l2b0_dram_sctag_mecc_err == 1'b1) && (dram_Ch1_l2b0_dram_sctag_pa_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x", 2, l2b0_rqid_dly3_1,dram_Ch1_l2b0_addr_store[l2b0_rqid_dly3_1]);
     end

     // SECC
     if ((l2b0_dvld_dly3_1 == 1'b1) && (dram_Ch1_l2b0_dram_sctag_secc_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", 2,l2b0_rqid_dly3_1,dram_Ch1_l2b0_addr_store[l2b0_rqid_dly3_1]);
     end

     if (dram_Ch1_l2b0_dram_sctag_scb_secc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  SECC err Detected   ", 2);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 1);
	end
     end

     if (dram_Ch1_l2b0_dram_sctag_scb_mecc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  MECC err Detected   ", 2);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 1);
	end
     end

   end

end




reg [39:0] l2b1_this_addr_1;
reg        l2b1_dvld_dly1_1;
reg        l2b1_dvld_dly2_1;
reg        l2b1_dvld_dly3_1;
reg [2:0]  l2b1_rqid_dly1_1;
reg [2:0]  l2b1_rqid_dly2_1;
reg [2:0]  l2b1_rqid_dly3_1;
// MAQ reg [1:0]  ch_1_l2b1;

reg [2:0]  l2b1_wr_data_cntr_1;
reg [511:0]  l2b1_wr_data_1;
reg [39:0]   l2b1_wr_addr_mon_1;

reg [39:0]  dram_Ch1_l2b1_addr_store [7:0];

initial 
begin 
 l2b1_wr_data_cntr_1 = 0;
 l2b1_wr_data_1 = 0;
 l2b1_wr_addr_mon_1 = 0;
end

always @ (posedge (cmp_clk && enabled))
begin
  if (cmp_rst_l) begin 

   l2b1_dvld_dly1_1 <= dram_Ch1_l2b1_dram_sctag_data_vld;
   l2b1_dvld_dly2_1 <= l2b1_dvld_dly1_1;
   l2b1_dvld_dly3_1 <= l2b1_dvld_dly2_1;
 
   l2b1_rqid_dly1_1 <= dram_Ch1_l2b1_dram_sctag_rd_req_id;
   l2b1_rqid_dly2_1 <= l2b1_rqid_dly1_1;
   l2b1_rqid_dly3_1 <= l2b1_rqid_dly2_1;

   l2b1_this_addr_1 = {dram_Ch1_l2b1_sctag_dram_addr, 5'b0};
     //l2b1_this_addr_1 = 34'd0;


     // Read Req 
     if (dram_Ch1_l2b1_sctag_dram_rd_req && !dram_Ch1_l2b1_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", 2,dram_Ch1_l2b1_sctag_dram_rd_req_id,l2b1_this_addr_1);
        dram_Ch1_l2b1_addr_store[dram_Ch1_l2b1_sctag_dram_rd_req_id] <= l2b1_this_addr_1;
     end

     if (dram_Ch1_l2b1_sctag_dram_rd_req && dram_Ch1_l2b1_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", 2,dram_Ch1_l2b1_sctag_dram_rd_req_id,l2b1_this_addr_1);
        dram_Ch1_l2b1_addr_store[dram_Ch1_l2b1_sctag_dram_rd_req_id] <= l2b1_this_addr_1;
     end

     // Write Req 
     if (dram_Ch1_l2b1_sctag_dram_wr_req ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write      ::            Addr = %x ", 2,l2b1_this_addr_1);
        l2b1_wr_addr_mon_1 = l2b1_this_addr_1;
     end

     if (dram_Ch1_l2b1_sctag_dram_data_vld) begin 
       l2b1_wr_data_1 = {l2b1_wr_data_1,dram_Ch1_l2b1_sctag_dram_wr_data};
      if ( l2b1_wr_data_cntr_1 == 3'b111 ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", 2, l2b1_wr_addr_mon_1, l2b1_wr_data_1);
      end
       l2b1_wr_data_cntr_1 = l2b1_wr_data_cntr_1 + 1;
     end

     // Read Data
     if (l2b1_dvld_dly3_1 == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", 2,l2b1_rqid_dly3_1,dram_Ch1_l2b1_addr_store[l2b1_rqid_dly3_1],dram_Ch1_dram_sctag_data);
     end
   
     // MECC
     if ((l2b1_dvld_dly3_1 == 1'b1) && (dram_Ch1_l2b1_dram_sctag_mecc_err == 1'b1) && (dram_Ch1_l2b1_dram_sctag_pa_err != 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x", 2,l2b1_rqid_dly3_1,dram_Ch1_l2b1_addr_store[l2b1_rqid_dly3_1]);
     end

     // MECC OOB
     if ((l2b1_dvld_dly3_1 == 1'b1) && (dram_Ch1_l2b1_dram_sctag_mecc_err == 1'b1) && (dram_Ch1_l2b1_dram_sctag_pa_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x", 2, l2b1_rqid_dly3_1,dram_Ch1_l2b1_addr_store[l2b1_rqid_dly3_1]);
     end

     // SECC
     if ((l2b1_dvld_dly3_1 == 1'b1) && (dram_Ch1_l2b1_dram_sctag_secc_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", 2,l2b1_rqid_dly3_1,dram_Ch1_l2b1_addr_store[l2b1_rqid_dly3_1]);
     end

     if (dram_Ch1_l2b1_dram_sctag_scb_secc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  SECC err Detected   ", 2);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 1);
	end
     end

     if (dram_Ch1_l2b1_dram_sctag_scb_mecc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  MECC err Detected   ", 2);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 1);
	end
     end

   end

end




reg [39:0] l2b0_this_addr_2;
reg        l2b0_dvld_dly1_2;
reg        l2b0_dvld_dly2_2;
reg        l2b0_dvld_dly3_2;
reg [2:0]  l2b0_rqid_dly1_2;
reg [2:0]  l2b0_rqid_dly2_2;
reg [2:0]  l2b0_rqid_dly3_2;
// MAQ reg [1:0]  ch_2_l2b0;

reg [2:0]  l2b0_wr_data_cntr_2;
reg [511:0]  l2b0_wr_data_2;
reg [39:0]   l2b0_wr_addr_mon_2;

reg [39:0]  dram_Ch2_l2b0_addr_store [7:0];

initial 
begin 
 l2b0_wr_data_cntr_2 = 0;
 l2b0_wr_data_2 = 0;
 l2b0_wr_addr_mon_2 = 0;
end

always @ (posedge (cmp_clk && enabled))
begin
  if (cmp_rst_l) begin 

   l2b0_dvld_dly1_2 <= dram_Ch2_l2b0_dram_sctag_data_vld;
   l2b0_dvld_dly2_2 <= l2b0_dvld_dly1_2;
   l2b0_dvld_dly3_2 <= l2b0_dvld_dly2_2;
 
   l2b0_rqid_dly1_2 <= dram_Ch2_l2b0_dram_sctag_rd_req_id;
   l2b0_rqid_dly2_2 <= l2b0_rqid_dly1_2;
   l2b0_rqid_dly3_2 <= l2b0_rqid_dly2_2;

   l2b0_this_addr_2 = {dram_Ch2_l2b0_sctag_dram_addr, 5'b0};
     //l2b0_this_addr_2 = 34'd0;


     // Read Req 
     if (dram_Ch2_l2b0_sctag_dram_rd_req && !dram_Ch2_l2b0_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", 1,dram_Ch2_l2b0_sctag_dram_rd_req_id,l2b0_this_addr_2);
        dram_Ch2_l2b0_addr_store[dram_Ch2_l2b0_sctag_dram_rd_req_id] <= l2b0_this_addr_2;
     end

     if (dram_Ch2_l2b0_sctag_dram_rd_req && dram_Ch2_l2b0_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", 1,dram_Ch2_l2b0_sctag_dram_rd_req_id,l2b0_this_addr_2);
        dram_Ch2_l2b0_addr_store[dram_Ch2_l2b0_sctag_dram_rd_req_id] <= l2b0_this_addr_2;
     end

     // Write Req 
     if (dram_Ch2_l2b0_sctag_dram_wr_req ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write      ::            Addr = %x ", 1,l2b0_this_addr_2);
        l2b0_wr_addr_mon_2 = l2b0_this_addr_2;
     end

     if (dram_Ch2_l2b0_sctag_dram_data_vld) begin 
       l2b0_wr_data_2 = {l2b0_wr_data_2,dram_Ch2_l2b0_sctag_dram_wr_data};
      if ( l2b0_wr_data_cntr_2 == 3'b111 ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", 1, l2b0_wr_addr_mon_2, l2b0_wr_data_2);
      end
       l2b0_wr_data_cntr_2 = l2b0_wr_data_cntr_2 + 1;
     end

     // Read Data
     if (l2b0_dvld_dly3_2 == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", 1,l2b0_rqid_dly3_2,dram_Ch2_l2b0_addr_store[l2b0_rqid_dly3_2],dram_Ch2_dram_sctag_data);
     end
   
     // MECC
     if ((l2b0_dvld_dly3_2 == 1'b1) && (dram_Ch2_l2b0_dram_sctag_mecc_err == 1'b1) && (dram_Ch2_l2b0_dram_sctag_pa_err != 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x", 1,l2b0_rqid_dly3_2,dram_Ch2_l2b0_addr_store[l2b0_rqid_dly3_2]);
     end

     // MECC OOB
     if ((l2b0_dvld_dly3_2 == 1'b1) && (dram_Ch2_l2b0_dram_sctag_mecc_err == 1'b1) && (dram_Ch2_l2b0_dram_sctag_pa_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x", 1,l2b0_rqid_dly3_2,dram_Ch2_l2b0_addr_store[l2b0_rqid_dly3_2]);
     end

     // SECC
     if ((l2b0_dvld_dly3_2 == 1'b1) && (dram_Ch2_l2b0_dram_sctag_secc_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", 1,l2b0_rqid_dly3_2,dram_Ch2_l2b0_addr_store[l2b0_rqid_dly3_2]);
     end

     if (dram_Ch2_l2b0_dram_sctag_scb_secc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  SECC err Detected   ", 1);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 2);
	end
     end

     if (dram_Ch2_l2b0_dram_sctag_scb_mecc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  MECC err Detected   ", 1);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 2);
	end
     end

   end

end




reg [39:0] l2b1_this_addr_2;
reg        l2b1_dvld_dly1_2;
reg        l2b1_dvld_dly2_2;
reg        l2b1_dvld_dly3_2;
reg [2:0]  l2b1_rqid_dly1_2;
reg [2:0]  l2b1_rqid_dly2_2;
reg [2:0]  l2b1_rqid_dly3_2;
// MAQ reg [1:0]  ch_2_l2b1;

reg [2:0]  l2b1_wr_data_cntr_2;
reg [511:0]  l2b1_wr_data_2;
reg [39:0]   l2b1_wr_addr_mon_2;

reg [39:0]  dram_Ch2_l2b1_addr_store [7:0];

initial 
begin 
 l2b1_wr_data_cntr_2 = 0;
 l2b1_wr_data_2 = 0;
 l2b1_wr_addr_mon_2 = 0;
end

always @ (posedge (cmp_clk && enabled))
begin
  if (cmp_rst_l) begin 

   l2b1_dvld_dly1_2 <= dram_Ch2_l2b1_dram_sctag_data_vld;
   l2b1_dvld_dly2_2 <= l2b1_dvld_dly1_2;
   l2b1_dvld_dly3_2 <= l2b1_dvld_dly2_2;
 
   l2b1_rqid_dly1_2 <= dram_Ch2_l2b1_dram_sctag_rd_req_id;
   l2b1_rqid_dly2_2 <= l2b1_rqid_dly1_2;
   l2b1_rqid_dly3_2 <= l2b1_rqid_dly2_2;

   l2b1_this_addr_2 = {dram_Ch2_l2b1_sctag_dram_addr, 5'b0};
     //l2b1_this_addr_2 = 34'd0;


     // Read Req 
     if (dram_Ch2_l2b1_sctag_dram_rd_req && !dram_Ch2_l2b1_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", 1,dram_Ch2_l2b1_sctag_dram_rd_req_id,l2b1_this_addr_2);
        dram_Ch2_l2b1_addr_store[dram_Ch2_l2b1_sctag_dram_rd_req_id] <= l2b1_this_addr_2;
     end

     if (dram_Ch2_l2b1_sctag_dram_rd_req && dram_Ch2_l2b1_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", 1,dram_Ch2_l2b1_sctag_dram_rd_req_id,l2b1_this_addr_2);
        dram_Ch2_l2b1_addr_store[dram_Ch2_l2b1_sctag_dram_rd_req_id] <= l2b1_this_addr_2;
     end

     // Write Req 
     if (dram_Ch2_l2b1_sctag_dram_wr_req ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write      ::            Addr = %x ", 1,l2b1_this_addr_2);
        l2b1_wr_addr_mon_2 = l2b1_this_addr_2;
     end

     if (dram_Ch2_l2b1_sctag_dram_data_vld) begin 
       l2b1_wr_data_2 = {l2b1_wr_data_2,dram_Ch2_l2b1_sctag_dram_wr_data};
      if ( l2b1_wr_data_cntr_2 == 3'b111 ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", 1, l2b1_wr_addr_mon_2, l2b1_wr_data_2);
      end
       l2b1_wr_data_cntr_2 = l2b1_wr_data_cntr_2 + 1;
     end

     // Read Data
     if (l2b1_dvld_dly3_2 == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", 1,l2b1_rqid_dly3_2,dram_Ch2_l2b1_addr_store[l2b1_rqid_dly3_2],dram_Ch2_dram_sctag_data);
     end
   
     // MECC
     if ((l2b1_dvld_dly3_2 == 1'b1) && (dram_Ch2_l2b1_dram_sctag_mecc_err == 1'b1) && (dram_Ch2_l2b1_dram_sctag_pa_err != 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x", 1,l2b1_rqid_dly3_2,dram_Ch2_l2b1_addr_store[l2b1_rqid_dly3_2]);
     end

     // MECC OOB
     if ((l2b1_dvld_dly3_2 == 1'b1) && (dram_Ch2_l2b1_dram_sctag_mecc_err == 1'b1) && (dram_Ch2_l2b1_dram_sctag_pa_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x", 1,l2b1_rqid_dly3_2,dram_Ch2_l2b1_addr_store[l2b1_rqid_dly3_2]);
     end

     // SECC
     if ((l2b1_dvld_dly3_2 == 1'b1) && (dram_Ch2_l2b1_dram_sctag_secc_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", 1,l2b1_rqid_dly3_2,dram_Ch2_l2b1_addr_store[l2b1_rqid_dly3_2]);
     end

     if (dram_Ch2_l2b1_dram_sctag_scb_secc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  SECC err Detected   ", 1);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 2);
	end
     end

     if (dram_Ch2_l2b1_dram_sctag_scb_mecc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  MECC err Detected   ", 1);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 2);
	end
     end

   end

end




reg [39:0] l2b0_this_addr_3;
reg        l2b0_dvld_dly1_3;
reg        l2b0_dvld_dly2_3;
reg        l2b0_dvld_dly3_3;
reg [2:0]  l2b0_rqid_dly1_3;
reg [2:0]  l2b0_rqid_dly2_3;
reg [2:0]  l2b0_rqid_dly3_3;
// MAQ reg [1:0]  ch_3_l2b0;

reg [2:0]  l2b0_wr_data_cntr_3;
reg [511:0]  l2b0_wr_data_3;
reg [39:0]   l2b0_wr_addr_mon_3;

reg [39:0]  dram_Ch3_l2b0_addr_store [7:0];

initial 
begin 
 l2b0_wr_data_cntr_3 = 0;
 l2b0_wr_data_3 = 0;
 l2b0_wr_addr_mon_3 = 0;
end

always @ (posedge (cmp_clk && enabled))
begin
  if (cmp_rst_l) begin 

   l2b0_dvld_dly1_3 <= dram_Ch3_l2b0_dram_sctag_data_vld;
   l2b0_dvld_dly2_3 <= l2b0_dvld_dly1_3;
   l2b0_dvld_dly3_3 <= l2b0_dvld_dly2_3;
 
   l2b0_rqid_dly1_3 <= dram_Ch3_l2b0_dram_sctag_rd_req_id;
   l2b0_rqid_dly2_3 <= l2b0_rqid_dly1_3;
   l2b0_rqid_dly3_3 <= l2b0_rqid_dly2_3;

   l2b0_this_addr_3 = {dram_Ch3_l2b0_sctag_dram_addr, 5'b0};
     //l2b0_this_addr_3 = 34'd0;


     // Read Req 
     if (dram_Ch3_l2b0_sctag_dram_rd_req && !dram_Ch3_l2b0_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", 3,dram_Ch3_l2b0_sctag_dram_rd_req_id,l2b0_this_addr_3);
        dram_Ch3_l2b0_addr_store[dram_Ch3_l2b0_sctag_dram_rd_req_id] <= l2b0_this_addr_3;
     end

     if (dram_Ch3_l2b0_sctag_dram_rd_req && dram_Ch3_l2b0_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", 3,dram_Ch3_l2b0_sctag_dram_rd_req_id,l2b0_this_addr_3);
        dram_Ch3_l2b0_addr_store[dram_Ch3_l2b0_sctag_dram_rd_req_id] <= l2b0_this_addr_3;
     end

     // Write Req 
     if (dram_Ch3_l2b0_sctag_dram_wr_req ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write      ::            Addr = %x ", 3,l2b0_this_addr_3);
        l2b0_wr_addr_mon_3 = l2b0_this_addr_3;
     end

     if (dram_Ch3_l2b0_sctag_dram_data_vld) begin 
       l2b0_wr_data_3 = {l2b0_wr_data_3,dram_Ch3_l2b0_sctag_dram_wr_data};
      if ( l2b0_wr_data_cntr_3 == 3'b111 ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", 3, l2b0_wr_addr_mon_3, l2b0_wr_data_3);
      end
       l2b0_wr_data_cntr_3 = l2b0_wr_data_cntr_3 + 1;
     end

     // Read Data
     if (l2b0_dvld_dly3_3 == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", 3,l2b0_rqid_dly3_3,dram_Ch3_l2b0_addr_store[l2b0_rqid_dly3_3],dram_Ch3_dram_sctag_data);
     end
   
     // MECC
     if ((l2b0_dvld_dly3_3 == 1'b1) && (dram_Ch3_l2b0_dram_sctag_mecc_err == 1'b1) && (dram_Ch3_l2b0_dram_sctag_pa_err != 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x", 3,l2b0_rqid_dly3_3,dram_Ch3_l2b0_addr_store[l2b0_rqid_dly3_3]);
     end

     // MECC OOB
     if ((l2b0_dvld_dly3_3 == 1'b1) && (dram_Ch3_l2b0_dram_sctag_mecc_err == 1'b1) && (dram_Ch3_l2b0_dram_sctag_pa_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x", 3,l2b0_rqid_dly3_3,dram_Ch3_l2b0_addr_store[l2b0_rqid_dly3_3]);
     end

     // SECC
     if ((l2b0_dvld_dly3_3 == 1'b1) && (dram_Ch3_l2b0_dram_sctag_secc_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", 3,l2b0_rqid_dly3_3,dram_Ch3_l2b0_addr_store[l2b0_rqid_dly3_3]);
     end

     if (dram_Ch3_l2b0_dram_sctag_scb_secc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  SECC err Detected   ", 3);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 3);
	end
     end

     if (dram_Ch3_l2b0_dram_sctag_scb_mecc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  MECC err Detected   ", 3);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 3);
	end
     end

   end

end




reg [39:0] l2b1_this_addr_3;
reg        l2b1_dvld_dly1_3;
reg        l2b1_dvld_dly2_3;
reg        l2b1_dvld_dly3_3;
reg [2:0]  l2b1_rqid_dly1_3;
reg [2:0]  l2b1_rqid_dly2_3;
reg [2:0]  l2b1_rqid_dly3_3;
// MAQ reg [1:0]  ch_3_l2b1;

reg [2:0]  l2b1_wr_data_cntr_3;
reg [511:0]  l2b1_wr_data_3;
reg [39:0]   l2b1_wr_addr_mon_3;

reg [39:0]  dram_Ch3_l2b1_addr_store [7:0];

initial 
begin 
 l2b1_wr_data_cntr_3 = 0;
 l2b1_wr_data_3 = 0;
 l2b1_wr_addr_mon_3 = 0;
end

always @ (posedge (cmp_clk && enabled))
begin
  if (cmp_rst_l) begin 

   l2b1_dvld_dly1_3 <= dram_Ch3_l2b1_dram_sctag_data_vld;
   l2b1_dvld_dly2_3 <= l2b1_dvld_dly1_3;
   l2b1_dvld_dly3_3 <= l2b1_dvld_dly2_3;
 
   l2b1_rqid_dly1_3 <= dram_Ch3_l2b1_dram_sctag_rd_req_id;
   l2b1_rqid_dly2_3 <= l2b1_rqid_dly1_3;
   l2b1_rqid_dly3_3 <= l2b1_rqid_dly2_3;

   l2b1_this_addr_3 = {dram_Ch3_l2b1_sctag_dram_addr, 5'b0};
     //l2b1_this_addr_3 = 34'd0;


     // Read Req 
     if (dram_Ch3_l2b1_sctag_dram_rd_req && !dram_Ch3_l2b1_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", 3,dram_Ch3_l2b1_sctag_dram_rd_req_id,l2b1_this_addr_3);
        dram_Ch3_l2b1_addr_store[dram_Ch3_l2b1_sctag_dram_rd_req_id] <= l2b1_this_addr_3;
     end

     if (dram_Ch3_l2b1_sctag_dram_rd_req && dram_Ch3_l2b1_sctag_dram_rd_dummy_req) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", 3,dram_Ch3_l2b1_sctag_dram_rd_req_id,l2b1_this_addr_3);
        dram_Ch3_l2b1_addr_store[dram_Ch3_l2b1_sctag_dram_rd_req_id] <= l2b1_this_addr_3;
     end

     // Write Req 
     if (dram_Ch3_l2b1_sctag_dram_wr_req ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write      ::            Addr = %x ", 3,l2b1_this_addr_3);
        l2b1_wr_addr_mon_3 = l2b1_this_addr_3;
     end

     if (dram_Ch3_l2b1_sctag_dram_data_vld) begin 
       l2b1_wr_data_3 = {l2b1_wr_data_3,dram_Ch3_l2b1_sctag_dram_wr_data};
      if ( l2b1_wr_data_cntr_3 == 3'b111 ) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", 3, l2b1_wr_addr_mon_3, l2b1_wr_data_3);
      end
       l2b1_wr_data_cntr_3 = l2b1_wr_data_cntr_3 + 1;
     end

     // Read Data
     if (l2b1_dvld_dly3_3 == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", 3,l2b1_rqid_dly3_3,dram_Ch3_l2b1_addr_store[l2b1_rqid_dly3_3],dram_Ch3_dram_sctag_data);
     end
   
     // MECC
     if ((l2b1_dvld_dly3_3 == 1'b1) && (dram_Ch3_l2b1_dram_sctag_mecc_err == 1'b1) && (dram_Ch3_l2b1_dram_sctag_pa_err != 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x", 3,l2b1_rqid_dly3_3,dram_Ch3_l2b1_addr_store[l2b1_rqid_dly3_3]);
     end

     // MECC OOB
     if ((l2b1_dvld_dly3_3 == 1'b1) && (dram_Ch3_l2b1_dram_sctag_mecc_err == 1'b1) && (dram_Ch3_l2b1_dram_sctag_pa_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x", 3,l2b1_rqid_dly3_3,dram_Ch3_l2b1_addr_store[l2b1_rqid_dly3_3]);
     end

     // SECC
     if ((l2b1_dvld_dly3_3 == 1'b1) && (dram_Ch3_l2b1_dram_sctag_secc_err == 1'b1)) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", 3,l2b1_rqid_dly3_3,dram_Ch3_l2b1_addr_store[l2b1_rqid_dly3_3]);
     end

     if (dram_Ch3_l2b1_dram_sctag_scb_secc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  SECC err Detected   ", 3);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 3);
	end
     end

     if (dram_Ch3_l2b1_dram_sctag_scb_mecc_err == 1'b1) begin 
       `PR_DEBUG("mcusat_cov_mon", `DEBUG, "L2_MCU_MON[%0d] -> Scrub  MECC err Detected   ", 3);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 3);
	end
     end

   end

end



// --------- task allows some more clocks and prints the error message with ERROR *string* --------
 
task finish_test;
input [512:0] message;
input [2:0]   id;
integer Failure_time;

begin
   Failure_time =$time;
  `PR_ERROR("mcusat_cov_mon", `ERROR, "DRAM Channel %d %s", id, message);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
end
endtask

//-----------------------------------------
// Disable mcusat_cov_mon during Warm Reset
//-----------------------------------------

always @ (posedge rst_wmr_protect)
begin
  if (!($test$plusargs("mcusat_cov_mon_disable")))
    enabled = 1'b0;
end

always @ (negedge rst_wmr_protect)
begin
  if (!($test$plusargs("mcusat_cov_mon_disable")))
    enabled = 1'b1;
end

endmodule
