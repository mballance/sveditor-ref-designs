// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_cam_128x200.v
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

    File name       : niu_cam_128x200.v

    Module(s) name  : niu_cam_128x200

    Parent modules  : niu_rxc    

    Child modules   : n2_niu_tc_128x200s_cust

    Author's name   : George Chu

    Date            : April. 2004

    Description     :

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------

************************************************************
***********************************************************/

`timescale 1ns/10ps

module niu_cam_128x200 (
                         tcu_aclk,
                         tcu_bclk,
                         tcu_se_scancollar_in,
                         tcu_se_scancollar_out,
                         tcu_array_wr_inhibit,
                         scan_in,
                         scan_out,
                         clk,
                         mbi_wdata,
                         mbi_rw_adr,
                         mbi_pio_sel,
                         mbi_wr_en,
                         mbi_rd_en,
                         mbi_compare,
                         mbi_run,
                         data_inp,
                         cam_compare,
                         pio_wt,
                         pio_rd,
                         pio_sel,
                         cam_index,
                         reset,
                         cam_valid,
                         cam_hit,
                         cam_haddr,
                         pio_rd_vld,
                         msk_dat_out
                       );

parameter DATA_WIDTH_MINUS1 = 199; 
parameter ADDR_WIDTH_MINUS1 = 6; 

input                          tcu_aclk;
input                          tcu_bclk;
input                          tcu_se_scancollar_in;
input                          tcu_se_scancollar_out;
input                          tcu_array_wr_inhibit;
input                          scan_in;
output                         scan_out;

input                          clk;

input    [DATA_WIDTH_MINUS1:0] mbi_wdata;
input    [ADDR_WIDTH_MINUS1:0] mbi_rw_adr;
input                          mbi_pio_sel;
input                          mbi_wr_en;
input                          mbi_rd_en;
input                          mbi_compare;
input                          mbi_run;

input    [DATA_WIDTH_MINUS1:0] data_inp;
input                          cam_compare;
input                          pio_wt;
input                          pio_rd;
input                          pio_sel;
input    [ADDR_WIDTH_MINUS1:0] cam_index;
input                          reset;
output                         cam_valid;
output                         cam_hit;
output   [ADDR_WIDTH_MINUS1:0] cam_haddr;
output                         pio_rd_vld;
output   [DATA_WIDTH_MINUS1:0] msk_dat_out;

wire                           cam_valid;
wire                           cam_hit;
wire     [ADDR_WIDTH_MINUS1:0] cam_haddr;
wire                           pio_rd_vld;
wire     [DATA_WIDTH_MINUS1:0] msk_dat_out;
wire                           scan_out;

wire                           mux_pio_sel;
wire                           mux_wr_en;
wire     [ADDR_WIDTH_MINUS1:0] mux_rw_adr;
wire                           mux_rd_en;
wire     [DATA_WIDTH_MINUS1:0] mux_wdata;
wire                           mux_compare;

  assign mux_wdata  = mbi_run ? mbi_wdata  : data_inp;
  assign mux_rw_adr = mbi_run ? mbi_rw_adr : cam_index;
  assign mux_pio_sel= mbi_run ? mbi_pio_sel: pio_sel;
  assign mux_wr_en  = mbi_run ? mbi_wr_en  : pio_wt;
  assign mux_rd_en  = mbi_run ? mbi_rd_en  : pio_rd;
  assign mux_compare= mbi_run ? mbi_compare: cam_compare;

  n2_niu_tc_128x200s_cust  cam_128x200_0  (
                                           .data_inp              (mux_wdata),
                                           .cam_compare           (mux_compare),
                                           .pio_wt                (mux_wr_en),
                                           .pio_rd                (mux_rd_en),
                                           .pio_sel               (mux_pio_sel),
                                           .cam_index             (mux_rw_adr[6:0]),
                                           .reset                 (reset),
                                           .clk                   (clk),
                                           .tcu_se_scancollar_in  (tcu_se_scancollar_in),
                                           .tcu_se_scancollar_out (tcu_se_scancollar_out),
                                           .tcu_array_wr_inhibit  (tcu_array_wr_inhibit),
                                           .tcu_aclk              (tcu_aclk),
                                           .tcu_bclk              (tcu_bclk),
                                           .tcu_pce_ov            (1'h1),
                                           .pce                   (1'h1),
                                           .scan_in               (scan_in),
                                           .scan_out              (scan_out),
                                           .cam_valid             (cam_valid),
                                           .cam_hit               (cam_hit),
                                           .cam_haddr             (cam_haddr[6:0]),
                                           .pio_rd_vld            (pio_rd_vld),
                                           .msk_dat_out           (msk_dat_out[199:0])
                                          );

endmodule
