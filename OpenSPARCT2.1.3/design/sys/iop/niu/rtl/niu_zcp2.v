// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp2.v
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
 * File Name    : niu_zcp2.v
 * Author Name  : John Lo
 * Description  : For N2 only.  
 * Parent Module:  
 * Child  Module: 
 * Interface Mod:
 * Date Created : 3/25/2004
 *
 * Design Notes : 
 * 
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "./niu_zcp.h"

module niu_zcp2 (
// pio broadcast signals
pio_clients_addr,
pio_clients_rd,
pio_clients_wdata,
pio_zcp_sel,
zcp_pio_ack,
zcp_pio_rdata,
zcp_pio_err,
zcp_pio_intr,
// rdmc stuff
page_handle,  // 20 bit per handle
// fflp intf
fflp_zcp_wr,
fflp_zcp_data,// 27 bytes = 216 bits
// port0
dmc_zcp_req0,
zcp_dmc_ack0,
zcp_dmc_dat0,
zcp_dmc_dat_err0,
zcp_dmc_emp0,
zcp_dmc_ful_pkt0,
// port1
dmc_zcp_req1,
zcp_dmc_ack1,
zcp_dmc_dat1,
zcp_dmc_dat_err1,
zcp_dmc_emp1,
zcp_dmc_ful_pkt1,
reset_l,
clk,
zcp_debug_port,
tcu_aclk,
tcu_bclk,
tcu_se_scancollar_in,
tcu_se_scancollar_out,
tcu_clk_stop,
tcu_array_wr_inhibit,
niu_mb7_cntrl_fifo_zcp_scan_in,
niu_mb7_cntrl_fifo_zcp_scan_out,
l2clk_2x,
// mbist controller related
niu_tcu_mbist_fail_7,
niu_tcu_mbist_done_7,
mb7_scan_in,
mb7_scan_out,
tcu_pce_ov,
tcu_niu_mbist_start_7,
tcu_mbist_bisi_en,
tcu_scan_en,
// specific to mb8
niu_mb8_cntrl_fifo_zcp_scan_in,
niu_mb8_cntrl_fifo_zcp_scan_out,
niu_tcu_mbist_fail_8,
niu_tcu_mbist_done_8,
mb8_scan_in,
mb8_scan_out,
tcu_niu_mbist_start_8
   );
                              // pio broadcast signals
   input  [19:0] 	      pio_clients_addr;
   input 		      pio_clients_rd;
   input  [63:0] 	      pio_clients_wdata;
   input 		      pio_zcp_sel;
   output 		      zcp_pio_ack;
   output [63:0] 	      zcp_pio_rdata;
   output 		      zcp_pio_err;
   output 		      zcp_pio_intr;
                              // rdmc stuff
   input  [`PMS31:0] 	      page_handle;  // 20 bit per handle
                              // fflp intf
   input 		      fflp_zcp_wr;
   input  [`IFIFO_W_R]	      fflp_zcp_data;// 27 bytes = 216 bits
                              // port0
   input 		      dmc_zcp_req0;
   output 		      zcp_dmc_ack0;
   output [`CFIFO_W_R]        zcp_dmc_dat0;
   output 		      zcp_dmc_dat_err0;
   output 		      zcp_dmc_emp0;
   output 		      zcp_dmc_ful_pkt0;
                              // port1
   input 		      dmc_zcp_req1;
   output 		      zcp_dmc_ack1;
   output [`CFIFO_W_R]        zcp_dmc_dat1;
   output 		      zcp_dmc_dat_err1;
   output 		      zcp_dmc_emp1;
   output 		      zcp_dmc_ful_pkt1;
   input 	              reset_l;
   input 	              clk;
   output [31:0] 	      zcp_debug_port;
   // DFT signals
                              // memory related
   input 		      tcu_aclk;
   input 		      tcu_bclk;
   input 		      tcu_se_scancollar_in;
   input 		      tcu_se_scancollar_out;
   input 		      tcu_clk_stop;
   input 		      tcu_array_wr_inhibit;
   input 		      niu_mb7_cntrl_fifo_zcp_scan_in;
   output 		      niu_mb7_cntrl_fifo_zcp_scan_out;
   input 		      l2clk_2x;
                              // mbist controller related
   output 		      niu_tcu_mbist_fail_7;
   output 		      niu_tcu_mbist_done_7;
   input 		      mb7_scan_in;
   output 		      mb7_scan_out;
   input 		      tcu_pce_ov;
   input 		      tcu_niu_mbist_start_7;
   input 		      tcu_mbist_bisi_en;
   input 		      tcu_scan_en;
                              // specific to mb8
   input 		      niu_mb8_cntrl_fifo_zcp_scan_in;
   output 		      niu_mb8_cntrl_fifo_zcp_scan_out;
   output 		      niu_tcu_mbist_fail_8;
   output 		      niu_tcu_mbist_done_8;
   input 		      mb8_scan_in;
   output 		      mb8_scan_out;
   input 		      tcu_niu_mbist_start_8;



/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			cfifo_ren0;		// From niu_zcp_slv of niu_zcp_slv.v
wire			cfifo_ren1;		// From niu_zcp_slv of niu_zcp_slv.v
wire			cfifo_ren2;		// From niu_zcp_slv of niu_zcp_slv.v
wire			cfifo_ren3;		// From niu_zcp_slv of niu_zcp_slv.v
wire			cfifo_wen0;		// From niu_zcp_slv of niu_zcp_slv.v
wire			cfifo_wen1;		// From niu_zcp_slv of niu_zcp_slv.v
wire			cfifo_wen2;		// From niu_zcp_slv of niu_zcp_slv.v
wire			cfifo_wen3;		// From niu_zcp_slv of niu_zcp_slv.v
wire [4:0]		default_rdc;		// From niu_zcp_slv of niu_zcp_slv.v
wire [10:0]		dmaw_threshold;		// From niu_zcp_slv of niu_zcp_slv.v
wire			dn_ram_ren;		// From niu_zcp_slv of niu_zcp_slv.v
wire			dn_ram_wen;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		ds_offset0;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		ds_offset1;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		ds_offset2;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		ds_offset3;		// From niu_zcp_slv of niu_zcp_slv.v
wire [19:0]		handle;			// From niu_zcp_slv of niu_zcp_slv.v
wire			latch_ram_dout;		// From niu_zcp_slv of niu_zcp_slv.v
wire			ld_ram_rdata;		// From niu_zcp_slv of niu_zcp_slv.v
wire			ram_ren;		// From niu_zcp_slv of niu_zcp_slv.v
wire [4:0]		ram_sel;		// From niu_zcp_slv of niu_zcp_slv.v
wire			ram_wen;		// From niu_zcp_slv of niu_zcp_slv.v
wire			req_dis;		// From niu_zcp_slv of niu_zcp_slv.v
wire			rsp_dis;		// From niu_zcp_slv of niu_zcp_slv.v
wire			sel_cfifo0;		// From niu_zcp_slv of niu_zcp_slv.v
wire			sel_cfifo1;		// From niu_zcp_slv of niu_zcp_slv.v
wire			sel_cfifo2;		// From niu_zcp_slv of niu_zcp_slv.v
wire			sel_cfifo3;		// From niu_zcp_slv of niu_zcp_slv.v
wire			sel_dn_ram;		// From niu_zcp_slv of niu_zcp_slv.v
wire			sel_st_ram;		// From niu_zcp_slv of niu_zcp_slv.v
wire [11:0]		slv_ram_addr;		// From niu_zcp_slv of niu_zcp_slv.v
wire [131:0]		slv_ram_be;		// From niu_zcp_slv of niu_zcp_slv.v
wire [131:0]		slv_ram_wdata;		// From niu_zcp_slv of niu_zcp_slv.v
wire			slv_request;		// From niu_zcp_slv of niu_zcp_slv.v
wire [11:0]		slv_tt_index;		// From niu_zcp_slv of niu_zcp_slv.v
wire			st_ram_ren;		// From niu_zcp_slv of niu_zcp_slv.v
wire			st_ram_wen;		// From niu_zcp_slv of niu_zcp_slv.v
wire [4:0]		table_rdc;		// From niu_zcp_slv of niu_zcp_slv.v
wire			tt_en;			// From niu_zcp_slv of niu_zcp_slv.v
wire			tt_index_chk0;		// From niu_zcp_slv of niu_zcp_slv.v
wire			tt_index_chk1;		// From niu_zcp_slv of niu_zcp_slv.v
wire			tt_index_chk2;		// From niu_zcp_slv of niu_zcp_slv.v
wire			tt_index_chk3;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_index_end0;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_index_end1;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_index_end2;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_index_end3;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_index_start0;	// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_index_start1;	// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_index_start2;	// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_index_start3;	// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_offset0;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_offset1;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_offset2;		// From niu_zcp_slv of niu_zcp_slv.v
wire [9:0]		tt_offset3;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_ren0;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_ren1;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_ren2;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_ren3;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_ren4;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_ren5;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_ren6;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_ren7;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_wen0;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_wen1;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_wen2;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_wen3;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_wen4;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_wen5;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_wen6;		// From niu_zcp_slv of niu_zcp_slv.v
wire			va_ram_wen7;		// From niu_zcp_slv of niu_zcp_slv.v
wire [4:0]		zc_rdc;			// From niu_zcp_slv of niu_zcp_slv.v
// End of automatics

   wire [`CFIFO_W_R]          zcp_dmc_dat0;
   wire [`CFIFO_W_R]          zcp_dmc_dat1;

   wire [7:0] 		      fflp_rdc;
   wire [7:0] 		      tt_rdc_reg;
   
   wire 		      slv_accepted   = 1'b1;
   wire [127:0] 	      vram_slv_rdata = 128'b0;
   wire [127:0] 	      sram_slv_rdata = 128'b0;
   wire [127:0] 	      dram_slv_rdata = 128'b0;
   wire [9:0] 		      addr;
   wire 		      zcp_dmc_dat_err0;
   wire 		      zcp_dmc_dat_err1;
                              // non exist ports
   wire 		      zcp_dmc_dat_err2 = 1'b0;
   wire 		      zcp_dmc_dat_err3 = 1'b0;
   wire [`CFIFO_W_R] 	      zcp_dmc_dat2     = `CFIFO_W'b0;// 130 bits: [129:0] 
   wire [`CFIFO_W_R] 	      zcp_dmc_dat3     = `CFIFO_W'b0;// 130 bits: [129:0] 
   
   wire 		      wr_en0;
   wire 		      wr_en1;
   wire 		      wr_en2;
   wire 		      wr_en3;
   wire [`CFIFO_W_R] 	      wr_data;  // 130 bits: [129:0] 
   wire [215:0] 	      fflp_data;
   wire 		      neptune_signature;
   wire [`VAFIFO_A_PTR]       rsp_rp;
   wire [11:0] 		      tt_index;
   
   wire 		      reset;
   wire 		      reset_temp;
   wire 		      FUNC_MODE = 1'b1;
   
   
/* --------------- reset logic -------------------------- */  

   assign 		      reset_temp = ~reset_l;

zcp_RegDff #(1) reset_RegDff (.din(reset_temp),.clk(clk),.qout(reset));
   
   
/* --------------- tt instantiation -------------------------- */  
niu_zcp_tt  niu_zcp_tt (
`ifdef NEPTUNE
// tt intf
.va_dout0(va_dout0),
.va_dout1(va_dout1),
.va_dout2(va_dout2),
.va_dout3(va_dout3),
.va_dout4(va_dout4),
.va_dout5(va_dout5),
.va_dout6(va_dout6),
.va_dout7(va_dout7),
.va_dout8(va_dout8),
.va_dout9(va_dout9),
.va_dout10(va_dout10),
.va_dout11(va_dout11),
.va_dout12(va_dout12),
.va_dout13(va_dout13),
.va_dout14(va_dout14),
.va_dout15(va_dout15),
.st_dout0(st_dout0),
.st_dout1(st_dout1),
.dn_dout0(dn_dout0),
.dn_dout1(dn_dout1),
// req ptr intf
.credit_ok(credit_ok),
.tt_index(tt_index),
.buf_req(buf_req),
.HoQ_reg(HoQ_reg),
.wb_HoQ_reg(wb_HoQ_reg),
.win_HoQ_reg(win_HoQ_reg),
.cross_q_end_reg(cross_q_end_reg),
.tt_index_reg(tt_index_reg),
.ring_size_reg(ring_size_reg),
.ring_base_addr_reg(ring_base_addr_reg),
.reach_buf_end_reg(reach_buf_end_reg),
.num_buf_requested_reg(num_buf_requested_reg),
// wb
.wb_dn_reg(wb_dn_reg),
.wb_tt(wb_tt),
//
.tt_rd_en(tt_rd_en),
.tt_active(tt_active),
`else // !ifdef NEPTUNE
`endif
.clk(clk),
.reset(reset),
// zcp_slv intf
.tt_en(tt_en),
.dmaw_threshold(dmaw_threshold[10:0]),
.tt_index_err(1'b0),
.slv_ram_wdata(slv_ram_wdata[`CFIFO_W_R]),
.cfifo_wen0(cfifo_wen0),
.cfifo_wen1(cfifo_wen1),
.cfifo_wen2(cfifo_wen2),
.cfifo_wen3(cfifo_wen3),
.handle(handle[19:0]),
// fflp wr intf
.fflp_zcp_wr(fflp_zcp_wr),
.fflp_zcp_data(fflp_zcp_data[`IFIFO_W_R]),
// rx dmc stuff
.decode_default_rdc(decode_default_rdc),
.decode_table_rdc(decode_table_rdc),
.decode_zc_rdc(decode_zc_rdc),
.tt_rdc_reg(tt_rdc_reg[7:0]),
.fflp_rdc(fflp_rdc[7:0]),
.default_rdc(default_rdc[4:0]),
.table_rdc(table_rdc[4:0]),
.zc_rdc(zc_rdc[4:0]),
.wr_data(wr_data[`CFIFO_W_R]),
.wr_en0(wr_en0),
.wr_en1(wr_en1),
.wr_en2(wr_en2),
.wr_en3(wr_en3)
);
   
/* --------------- pio interface ----------------------------- */  
niu_zcp_slv  niu_zcp_slv 
  (/*AUTOINST*/
   // Outputs
   .zcp_pio_ack				(zcp_pio_ack),
   .zcp_pio_rdata			(zcp_pio_rdata[63:0]),
   .zcp_pio_err				(zcp_pio_err),
   .zcp_pio_intr			(zcp_pio_intr),
   .handle				(handle[19:0]),
   .default_rdc				(default_rdc[4:0]),
   .table_rdc				(table_rdc[4:0]),
   .zc_rdc				(zc_rdc[4:0]),
   .tt_en				(tt_en),
   .req_dis				(req_dis),
   .rsp_dis				(rsp_dis),
   .dmaw_threshold			(dmaw_threshold[10:0]),
   .slv_request				(slv_request),
   .slv_tt_index			(slv_tt_index[11:0]),
   .ram_sel				(ram_sel[4:0]),
   .slv_ram_addr			(slv_ram_addr[11:0]),
   .slv_ram_wdata			(slv_ram_wdata[131:0]),
   .slv_ram_be				(slv_ram_be[131:0]),
   .latch_ram_dout			(latch_ram_dout),
   .ld_ram_rdata			(ld_ram_rdata),
   .ram_ren				(ram_ren),
   .ram_wen				(ram_wen),
   .sel_st_ram				(sel_st_ram),
   .sel_dn_ram				(sel_dn_ram),
   .sel_cfifo0				(sel_cfifo0),
   .sel_cfifo1				(sel_cfifo1),
   .sel_cfifo2				(sel_cfifo2),
   .sel_cfifo3				(sel_cfifo3),
   .va_ram_ren0				(va_ram_ren0),
   .va_ram_wen0				(va_ram_wen0),
   .va_ram_ren1				(va_ram_ren1),
   .va_ram_wen1				(va_ram_wen1),
   .va_ram_ren2				(va_ram_ren2),
   .va_ram_wen2				(va_ram_wen2),
   .va_ram_ren3				(va_ram_ren3),
   .va_ram_wen3				(va_ram_wen3),
   .va_ram_ren4				(va_ram_ren4),
   .va_ram_wen4				(va_ram_wen4),
   .va_ram_ren5				(va_ram_ren5),
   .va_ram_wen5				(va_ram_wen5),
   .va_ram_ren6				(va_ram_ren6),
   .va_ram_wen6				(va_ram_wen6),
   .va_ram_ren7				(va_ram_ren7),
   .va_ram_wen7				(va_ram_wen7),
   .st_ram_ren				(st_ram_ren),
   .st_ram_wen				(st_ram_wen),
   .dn_ram_ren				(dn_ram_ren),
   .dn_ram_wen				(dn_ram_wen),
   .cfifo_ren0				(cfifo_ren0),
   .cfifo_wen0				(cfifo_wen0),
   .cfifo_ren1				(cfifo_ren1),
   .cfifo_wen1				(cfifo_wen1),
   .cfifo_ren2				(cfifo_ren2),
   .cfifo_wen2				(cfifo_wen2),
   .cfifo_ren3				(cfifo_ren3),
   .cfifo_wen3				(cfifo_wen3),
   .tt_offset0				(tt_offset0[9:0]),
   .tt_index_start0			(tt_index_start0[9:0]),
   .tt_index_end0			(tt_index_end0[9:0]),
   .tt_index_chk0			(tt_index_chk0),
   .tt_offset1				(tt_offset1[9:0]),
   .tt_index_start1			(tt_index_start1[9:0]),
   .tt_index_end1			(tt_index_end1[9:0]),
   .tt_index_chk1			(tt_index_chk1),
   .tt_offset2				(tt_offset2[9:0]),
   .tt_index_start2			(tt_index_start2[9:0]),
   .tt_index_end2			(tt_index_end2[9:0]),
   .tt_index_chk2			(tt_index_chk2),
   .tt_offset3				(tt_offset3[9:0]),
   .tt_index_start3			(tt_index_start3[9:0]),
   .tt_index_end3			(tt_index_end3[9:0]),
   .tt_index_chk3			(tt_index_chk3),
   .ds_offset0				(ds_offset0[9:0]),
   .ds_offset1				(ds_offset1[9:0]),
   .ds_offset2				(ds_offset2[9:0]),
   .ds_offset3				(ds_offset3[9:0]),
   .zcp_debug_port			(zcp_debug_port[31:0]),
   // Inputs
   .clk					(clk),
   .reset				(reset),
   .pio_clients_addr			(pio_clients_addr[19:0]),
   .pio_clients_rd			(pio_clients_rd),
   .pio_clients_wdata			(pio_clients_wdata[63:0]),
   .pio_zcp_sel				(pio_zcp_sel),
   .zcp_dmc_dat_err0			(zcp_dmc_dat_err0),
   .zcp_dmc_dat_err1			(zcp_dmc_dat_err1),
   .zcp_dmc_dat_err2			(zcp_dmc_dat_err2),
   .zcp_dmc_dat_err3			(zcp_dmc_dat_err3),
   .decode_default_rdc			(decode_default_rdc),
   .decode_table_rdc			(decode_table_rdc),
   .decode_zc_rdc			(decode_zc_rdc),
   .tt_rdc_reg				(tt_rdc_reg[7:0]),
   .fflp_rdc				(fflp_rdc[7:0]),
   .page_handle				(page_handle[`PMS31:0]),
   .slv_accepted			(slv_accepted),
   .vram_slv_rdata			(vram_slv_rdata[127:0]),
   .sram_slv_rdata			(sram_slv_rdata[127:0]),
   .dram_slv_rdata			(dram_slv_rdata[127:0]),
   .zcp_dmc_dat0			(zcp_dmc_dat0[`CFIFO_W_R]),
   .zcp_dmc_dat1			(zcp_dmc_dat1[`CFIFO_W_R]),
   .zcp_dmc_dat2			(zcp_dmc_dat2[`CFIFO_W_R]),
   .zcp_dmc_dat3			(zcp_dmc_dat3[`CFIFO_W_R]));

   
// cfifo0
niu_zcp_cfifo8KB niu_zcp_cfifo8KB_port0(
.clk(clk),
.reset(reset),
.wr_en(wr_en0),
.wr_data(wr_data[`CFIFO_W_R]),
.dmc_zcp_req(dmc_zcp_req0),
.zcp_dmc_ack(zcp_dmc_ack0),
.zcp_dmc_dat(zcp_dmc_dat0[`CFIFO_W_R]),
.zcp_dmc_dat_err(zcp_dmc_dat_err0),
.zcp_dmc_emp(zcp_dmc_emp0),
.zcp_dmc_ful_pkt(zcp_dmc_ful_pkt0),
.sel_cfifo(sel_cfifo0),
.slv_ram_addr(slv_ram_addr[11:0]),
// DFT signals
 // memory related
 .tcu_aclk(tcu_aclk),
 .tcu_bclk(tcu_bclk),
 .tcu_se_scancollar_in(tcu_se_scancollar_in),
 .tcu_se_scancollar_out(tcu_se_scancollar_out),
 .tcu_clk_stop(tcu_clk_stop),
 .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
 .scan_in(niu_mb7_cntrl_fifo_zcp_scan_in),   
 .scan_out(niu_mb7_cntrl_fifo_zcp_scan_out), 
 .l2clk_2x(l2clk_2x),
 // mbist controller related
 .niu_tcu_mbist_fail(niu_tcu_mbist_fail_7),
 .niu_tcu_mbist_done(niu_tcu_mbist_done_7),
 .mb_scan_in(mb7_scan_in),
 .mb_scan_out(mb7_scan_out),
 .tcu_pce_ov(tcu_pce_ov),
 .tcu_niu_mbist_start(tcu_niu_mbist_start_7), // exception
 .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
 .tcu_scan_en(tcu_scan_en)
);
   
// cfifo1
niu_zcp_cfifo8KB niu_zcp_cfifo8KB_port1(
.clk(clk),
.reset(reset),
.wr_en(wr_en1),
.wr_data(wr_data[`CFIFO_W_R]),
.dmc_zcp_req(dmc_zcp_req1),
.zcp_dmc_ack(zcp_dmc_ack1),
.zcp_dmc_dat(zcp_dmc_dat1[`CFIFO_W_R]),
.zcp_dmc_dat_err(zcp_dmc_dat_err1),
.zcp_dmc_emp(zcp_dmc_emp1),
.zcp_dmc_ful_pkt(zcp_dmc_ful_pkt1),
.sel_cfifo(sel_cfifo1),
.slv_ram_addr(slv_ram_addr[11:0]),
// DFT signals					
 // memory related
 .tcu_aclk(tcu_aclk),
 .tcu_bclk(tcu_bclk),
 .tcu_se_scancollar_in(tcu_se_scancollar_in),
 .tcu_se_scancollar_out(tcu_se_scancollar_out),
 .tcu_clk_stop(tcu_clk_stop),
 .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
 .scan_in(niu_mb8_cntrl_fifo_zcp_scan_in),   
 .scan_out(niu_mb8_cntrl_fifo_zcp_scan_out), 
 .l2clk_2x(l2clk_2x),
 // mbist controller related
 .niu_tcu_mbist_fail(niu_tcu_mbist_fail_8),
 .niu_tcu_mbist_done(niu_tcu_mbist_done_8),
 .mb_scan_in(mb8_scan_in),
 .mb_scan_out(mb8_scan_out),
 .tcu_pce_ov(tcu_pce_ov),
 .tcu_niu_mbist_start(tcu_niu_mbist_start_8), // exception
 .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
 .tcu_scan_en(tcu_scan_en)
);

   
endmodule // niu_zcp2 


 
