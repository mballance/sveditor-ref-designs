// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_dat_fifo_1ke.v
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
/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_ipp_dat_fifo_1ke.v

    Module(s) name  : niu_ipp_dat_fifo_1ke

    Parent modules  : niu_ipp.v

    Child modules   : niu_ipp.h, sram module 

    Author's name   : George chu 

    Date            : Dec. 2003

    Description     : This file contains a 130-bit by 1k-entry regs used as
                      FIFO for receiving data from niu_ipp_hdr_fifo, and sending
                      data to DMC. 

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

`timescale 1ns/10ps

module niu_ipp_dat_fifo_1ke (
`ifdef NEPTUNE
`else                    tcu_aclk,
                         tcu_bclk,
                         tcu_scan_en,
                         tcu_se_scancollar_in,
                         tcu_se_scancollar_out,
                         tcu_array_wr_inhibit,
                         scan_in,
                         scan_out,
                         hdr_sram_rvalue,
                         hdr_sram_rid,
                         hdr_sram_wr_en,
                         hdr_sram_red_clr,
                         sram_hdr_read_data,
                         iol2clk,
                         l2clk_2x,
                         mbi_wdata,
                         mbi_rd_adr,
                         mbi_wr_adr,
                         mbi_wr_en,
                         mbi_rd_en,
                         mbi_run,
                         mbi_rx_data_fifo_data_out,
`endif
                         ipp_dfifo_rden, 
                         ipp_dfifo_rptr, 
                         ipp_dfifo_wptr, 
                         ipp_dfifo_wten, 
                         ipp_dfifo_wten_2nd, 
                         ipp_dfifo_dinp, 
                         ipp_ecc_corrupt_sop,
                         ipp_ecc_corrupt_2nd,
                         ipp_ecc_corrupt_eop,
                         ipp_ecc_corrupt_sing,
                         ipp_ecc_corrupt_doub,
                         ipp_ecc_corrupt_no_uncor,
                         dfifo_ecc_correct_en,
                         ecc_pkt_corrupted_clr,
                         reset, 
                         clk,
                         ipp_dfifo_dout, 
                         ipp_dfifo_dout0_tag,
                         ipp_dmc_dat_err,
                         ipp_dmc_dat_err1,
                         ipp_dfifo_dout1,
                         ipp_dfifo_dout1_ecc,
                         ipp_dfifo_dout1_ecc_syn,
                         ecc_pkt_corrupted
                        );

`ifdef NEPTUNE
`else
parameter DATA_WIDTH_MINUS1 = 145;
parameter ADDR_WIDTH_MINUS1 = 9;

input                          tcu_aclk;
input                          tcu_bclk;
input                          tcu_scan_en;
input                          tcu_se_scancollar_in;
input                          tcu_se_scancollar_out;
input                          tcu_array_wr_inhibit;
input                          scan_in;
output                         scan_out;

input                    [6:0] hdr_sram_rvalue;
input                    [2:0] hdr_sram_rid;
input                          hdr_sram_wr_en;
input                          hdr_sram_red_clr;
output                   [6:0] sram_hdr_read_data;

input                          iol2clk;
input                          l2clk_2x;

input    [DATA_WIDTH_MINUS1:0] mbi_wdata;
input    [ADDR_WIDTH_MINUS1:0] mbi_rd_adr;
input    [ADDR_WIDTH_MINUS1:0] mbi_wr_adr;
input                          mbi_wr_en;
input                          mbi_rd_en;
input                          mbi_run;
output   [DATA_WIDTH_MINUS1:0] mbi_rx_data_fifo_data_out;
`endif

input           ipp_dfifo_rden;      // from ipp_unload_ctl 
input     [9:0] ipp_dfifo_rptr;      // from ipp_unload_ctl 
input     [9:0] ipp_dfifo_wptr;      // from ipp_unload_ctl, addr[ 9:0] of 16k-byte data
input           ipp_dfifo_wten;      // from ipp_unload_ctl 
input           ipp_dfifo_wten_2nd;  // from ipp_unload_ctl 
input   [129:0]	ipp_dfifo_dinp;      // from ipp_hfifo 
input           ipp_ecc_corrupt_sop;
input           ipp_ecc_corrupt_2nd;
input           ipp_ecc_corrupt_eop;
input           ipp_ecc_corrupt_sing;
input           ipp_ecc_corrupt_doub;
input           ipp_ecc_corrupt_no_uncor;
input           dfifo_ecc_correct_en;
input           ecc_pkt_corrupted_clr;

input           reset;
input           clk;          	     // clock

output  [129:0] ipp_dfifo_dout;	     // to dmc 
output    [1:0] ipp_dfifo_dout0_tag; // to dmc 
output          ipp_dmc_dat_err;     // to dmc 
output          ipp_dmc_dat_err1;

output  [129:0] ipp_dfifo_dout1;
output   [31:0] ipp_dfifo_dout1_ecc;
output   [15:0] ipp_dfifo_dout1_ecc_syn;
output          ecc_pkt_corrupted;

wire    [129:0] ipp_dfifo_dout;
wire      [1:0] ipp_dfifo_dout0_tag;
wire            ipp_dmc_dat_err;
wire            ipp_dmc_dat_err1;

wire    [129:0] ipp_dfifo_dout1;
wire     [31:0] ipp_dfifo_dout1_ecc;
wire     [15:0] ipp_dfifo_dout1_ecc_syn;
wire            ecc_pkt_corrupted;

wire    [129:0] ipp_dfifo_dout0;
wire     [15:0] ecc_dfifo_dout0;
wire     [15:0] ecc_dfifo_dout1;

wire      [9:0] ipp_dfifo_rptr0;     // from ipp_unload_ctl 
wire      [9:0] ipp_dfifo_rptr1;     // from ipp_unload_ctl 

wire    [129:0] dinp_ecc_gen_dat;
wire     [15:0] dinp_ecc_gen_chk;
wire            flip_ecc_gen_sop;
wire            flip_ecc_gen_2nd;
wire            flip_ecc_gen_eop;
wire            flip_ecc_gen_s_e   = flip_ecc_gen_sop     || flip_ecc_gen_eop;
wire            corrupt_single_bit = ipp_ecc_corrupt_doub || ipp_ecc_corrupt_sing;
wire            corrupt_double_bit = ipp_ecc_corrupt_doub;
wire            n_ecc_pkt_corrupted;
wire            dinp_ecc_gen_dt98, dinp_ecc_gen_dt97, dinp_ecc_gen_dt1, dinp_ecc_gen_dt0;
wire    [129:0] ipp_dfifo_dout1_ecc_dat_chk;
wire    [129:0] ipp_dfifo_dout1_ecc_dat;
wire    [129:0] ipp_dfifo_dout2_ecc_dat;

wire      [1:0] uncorr_error1_chk;

wire      [1:0] no_error1;
wire      [1:0] error1;
wire      [1:0] corr_error1;
wire      [1:0] uncorr_error1;
wire            uncorr_error1_found;

wire            corr_error1_ori_1;
wire            uncorr_error1_chk_ori_1;
wire            bad_tag1;

wire            uncorr_error2;

`ifdef NEPTUNE
`else
wire                           scan_out;
wire     [DATA_WIDTH_MINUS1:0] mbi_rx_data_fifo_data_out = {ecc_dfifo_dout0[15:0],ipp_dfifo_dout0[129:0]};
wire                     [6:0] sram_hdr_read_data;
`endif

//*********************************************************
//***** ipp_dfifo_mem (130+16)-bit x 1k-entry 16K-byte data
//*********************************************************

  niu_ram_1024_146 ram_1024_146_0 (
`ifdef NEPTUNE
                                   .clk                     (clk),
`else
                                   .reset                   (reset),
                                   .tcu_aclk                (tcu_aclk),
                                   .tcu_bclk                (tcu_bclk),
                                   .tcu_scan_en             (tcu_scan_en),
                                   .tcu_se_scancollar_in    (tcu_se_scancollar_in),
                                   .tcu_se_scancollar_out   (tcu_se_scancollar_out),
                                   .tcu_array_wr_inhibit    (tcu_array_wr_inhibit),
                                   .scan_in                 (scan_in),
                                   .scan_out                (scan_out),
                                   .hdr_sram_rvalue         (hdr_sram_rvalue),
                                   .hdr_sram_rid            (hdr_sram_rid),
                                   .hdr_sram_wr_en          (hdr_sram_wr_en),
                                   .hdr_sram_red_clr        (hdr_sram_red_clr),
                                   .sram_hdr_read_data      (sram_hdr_read_data),
                                   .clk                     (iol2clk),
                                   .l2clk_2x                (l2clk_2x),
                                   .mbi_wdata               (mbi_wdata),
                                   .mbi_rd_adr              (mbi_rd_adr),
                                   .mbi_wr_adr              (mbi_wr_adr),
                                   .mbi_wr_en               (mbi_wr_en),
                                   .mbi_rd_en               (mbi_rd_en),
                                   .mbi_run                 (mbi_run),
`endif                             .data_inp                ({dinp_ecc_gen_chk[15:0],dinp_ecc_gen_dat[129:0]}),
                                   .addr_rd                 (ipp_dfifo_rptr[9:0]),
                                   .addr_wt                 (ipp_dfifo_wptr[9:0]),
                                   .wt_enable               (ipp_dfifo_wten),
                                   .cs_rd                   (ipp_dfifo_rden /* geo 1'h */),
                                   .data_out                ({ecc_dfifo_dout0[15:0],ipp_dfifo_dout0[129:0]})
                                  );

//****** ecc generation  & correction ***********************************************
  assign flip_ecc_gen_sop       = ipp_ecc_corrupt_sop && ipp_dfifo_dinp[128];
  assign flip_ecc_gen_2nd       = ipp_ecc_corrupt_2nd && ipp_dfifo_wten_2nd;
  assign flip_ecc_gen_eop       = ipp_ecc_corrupt_eop && ipp_dfifo_dinp[129];

  assign dinp_ecc_gen_dat[0]    = flip_ecc_gen_2nd && corrupt_single_bit ? !dinp_ecc_gen_dt0  : dinp_ecc_gen_dt0;
  assign dinp_ecc_gen_dat[1]    = flip_ecc_gen_2nd && corrupt_double_bit ? !dinp_ecc_gen_dt1  : dinp_ecc_gen_dt1;
  assign dinp_ecc_gen_dat[97]   = flip_ecc_gen_s_e && corrupt_single_bit ? !dinp_ecc_gen_dt97 : dinp_ecc_gen_dt97;
  assign dinp_ecc_gen_dat[98]   = flip_ecc_gen_s_e && corrupt_double_bit ? !dinp_ecc_gen_dt98 : dinp_ecc_gen_dt98;

  assign n_ecc_pkt_corrupted    = ipp_dfifo_wten && (flip_ecc_gen_sop || flip_ecc_gen_2nd || flip_ecc_gen_eop);

  niu_65data_ecc_generate niu_65data_ecc_generate_dfifo_0 (
         .din           (ipp_dfifo_dinp[064:00]),
         .dout          ({dinp_ecc_gen_dat[064:02],dinp_ecc_gen_dt1, dinp_ecc_gen_dt0, dinp_ecc_gen_chk[07:00]})
        );

  niu_65data_ecc_generate niu_65data_ecc_generate_dfifo_1 (
         .din           (ipp_dfifo_dinp[129:65]),
         .dout          ({dinp_ecc_gen_dat[129:99],dinp_ecc_gen_dt98,dinp_ecc_gen_dt97,dinp_ecc_gen_dat[96:65],
                          dinp_ecc_gen_chk[15:08]})
        );

  niu_65data_ecc_check  niu_65data_ecc_check_dfifo_0 (
         .din           ({ipp_dfifo_dout1[064:00],            ecc_dfifo_dout1[07:0]}),
         .dout          ({ipp_dfifo_dout1_ecc_dat_chk[064:00],ipp_dfifo_dout1_ecc_syn[07:0]}),
         .no_error      (no_error1[0]),
         .error         (error1[0]),
         .corr_error    (corr_error1[0]),
         .uncorr_error  (uncorr_error1_chk[0])
        );

  niu_65data_ecc_check  niu_65data_ecc_check_dfifo_1 (
         .din           ({ipp_dfifo_dout1[129:65],            ecc_dfifo_dout1[15:8]}),
         .dout          ({ipp_dfifo_dout1_ecc_dat_chk[129:65],ipp_dfifo_dout1_ecc_syn[15:8]}),
         .no_error      (no_error1[1]),
         .error         (error1[1]),
         .corr_error    (corr_error1_ori_1),
         .uncorr_error  (uncorr_error1_chk_ori_1)
        );

  assign bad_tag1                = (ipp_dfifo_dout1[129] ^ ipp_dfifo_dout1_ecc_dat_chk[129]) ||
                                   (ipp_dfifo_dout1[128] ^ ipp_dfifo_dout1_ecc_dat_chk[128]);
  assign corr_error1[1]          = !bad_tag1 && corr_error1_ori_1;
  assign uncorr_error1_chk[1]    =  bad_tag1 || uncorr_error1_chk_ori_1;

  assign uncorr_error1_found     = |uncorr_error1_chk[1:0];
  assign uncorr_error1           = dfifo_ecc_correct_en ? uncorr_error1_chk[1:0] & {2{!ipp_ecc_corrupt_no_uncor}} :
                                                                 error1[1:0]     & {2{!ipp_ecc_corrupt_no_uncor}};
  assign ipp_dfifo_dout1_ecc_dat = dfifo_ecc_correct_en ? ipp_dfifo_dout1_ecc_dat_chk[129:0] : ipp_dfifo_dout1[129:0];

// geo_1: SOP/eop is before or after ECC?!

//***********************************************************************************
  assign ipp_dfifo_dout      = ipp_dfifo_dout2_ecc_dat[129:0];
  assign ipp_dfifo_dout0_tag = ipp_dfifo_dout0[129:128];
  assign ipp_dmc_dat_err1    = |uncorr_error1[1:0];
  assign ipp_dmc_dat_err     =  uncorr_error2;

  assign ipp_dfifo_dout1_ecc = {13'h0,
                                uncorr_error1_found,
                                1'h0,
                                ipp_dfifo_rptr1[9:0],
                                uncorr_error1[1:0],
                                corr_error1[1:0],
                                error1[1:0],
                                no_error1[1] && no_error1[0]
                               };

  ipp_reg_r_130 reg_r_130_dat1 (.di(ipp_dfifo_dout0[129:0]),         .rs(reset), .ck(clk), .qo(ipp_dfifo_dout1[129:0]));
  ipp_reg_r_16  reg_r_16_ecc1  (.di(ecc_dfifo_dout0[15:0]),          .rs(reset), .ck(clk), .qo(ecc_dfifo_dout1[15:0]));

  ipp_reg_r_130 reg_r_130_dat2 (.di(ipp_dfifo_dout1_ecc_dat[129:0]), .rs(reset), .ck(clk), .qo(ipp_dfifo_dout2_ecc_dat[129:0]));

  ipp_reg_r_10  reg_r_10_rpt0  (.di(ipp_dfifo_rptr[9:0]),            .rs(reset), .ck(clk), .qo(ipp_dfifo_rptr0[9:0]));
  ipp_reg_r_10  reg_r_10_rpt1  (.di(ipp_dfifo_rptr0[9:0]),           .rs(reset), .ck(clk), .qo(ipp_dfifo_rptr1[9:0]));

  ipp_reg_r_1   reg_r_1_err2   (.di(ipp_dmc_dat_err1),               .rs(reset), .ck(clk), .qo(uncorr_error2));

  ipp_reg_r_1   reg_r_1_corr   (.di(n_ecc_pkt_corrupted), .rs(ecc_pkt_corrupted_clr), .ck(clk), .qo(ecc_pkt_corrupted));

endmodule

