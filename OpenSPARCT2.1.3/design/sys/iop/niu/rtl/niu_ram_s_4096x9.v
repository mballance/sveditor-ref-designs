// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ram_s_4096x9.v
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

    File name       : niu_ram_s_4096x9.v

    Module(s) name  : niu_ram_s_4096x9

    Parent modules  :            

    Child modules   :           

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

module niu_ram_s_4096x9 (
                         reset,
                         tcu_aclk,
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
                         mbi_wdata,
                         mbi_rw_adr,
                         mbi_wr_en,
                         mbi_rd_en,
                         mbi_run,
                         data_inp,
                         addr_rw,
                         wt_enable,
                         cs_rd,
                         clk,
                         data_out
                       );

parameter DATA_WIDTH_MINUS1 = 8; 
parameter ADDR_WIDTH_MINUS1 = 11; 

input                          reset;    // if 1, reset the logic
input                          tcu_aclk;
input                          tcu_bclk;
input                          tcu_scan_en;
input                          tcu_se_scancollar_in;
input                          tcu_se_scancollar_out;
input                          tcu_array_wr_inhibit;
input                          scan_in;
output                         scan_out;

input                    [5:0] hdr_sram_rvalue;
input                          hdr_sram_rid;
input                          hdr_sram_wr_en;
input                          hdr_sram_red_clr;
output                   [5:0] sram_hdr_read_data;

input    [DATA_WIDTH_MINUS1:0] mbi_wdata;
input    [ADDR_WIDTH_MINUS1:0] mbi_rw_adr;
input                          mbi_wr_en;
input                          mbi_rd_en;
input                          mbi_run;

input    [DATA_WIDTH_MINUS1:0] data_inp;      // data_input,
input    [ADDR_WIDTH_MINUS1:0] addr_rw;       // read/write_address,
input                          wt_enable;     // write_enable,             via port_B
input                          cs_rd;         // chip_selet_rd_port
input                          clk;
output   [DATA_WIDTH_MINUS1:0] data_out;      // data read out, via port_A

wire     [DATA_WIDTH_MINUS1:0] data_out;
wire                           scan_out;

wire                     [5:0] sram_hdr_read_data;

wire     [ADDR_WIDTH_MINUS1:0] mux_rw_adr;
wire                           mux_wr_en;
wire                           mux_rd_en;
wire     [DATA_WIDTH_MINUS1:0] mux_wdata;

  assign mux_wdata  = mbi_run ? mbi_wdata  : data_inp;
  assign mux_rw_adr = mbi_run ? mbi_rw_adr : addr_rw;
  assign mux_wr_en  = mbi_run ? mbi_wr_en  : wt_enable;
  assign mux_rd_en  = mbi_run ? mbi_rd_en  : cs_rd;

  n2_niu_sp_4096x9s_cust   ram_4096x9_0   (
                                           .reset                 (reset),
                                           .tcu_aclk              (tcu_aclk),
                                           .tcu_bclk              (tcu_bclk),
                                           .tcu_scan_en           (tcu_scan_en),
                                           .tcu_se_scancollar_in  (tcu_se_scancollar_in),
                                           .tcu_se_scancollar_out (tcu_se_scancollar_out),
                                           .tcu_pce_ov            (1'h1),
                                           .pce                   (1'h1),
                                           .tcu_array_wr_inhibit  (tcu_array_wr_inhibit),
                                           .scan_in               (scan_in),
                                           .scan_out              (scan_out),
                                           .hdr_sram_rvalue       (hdr_sram_rvalue[5:0]),
                                           .hdr_sram_rid          (hdr_sram_rid),
                                           .hdr_sram_wr_en        (hdr_sram_wr_en),
                                           .hdr_sram_red_clr      (hdr_sram_red_clr),
                                           .sram_hdr_read_data    (sram_hdr_read_data[5:0]),
                                           .rw_adr                (mux_rw_adr[11:0]),
                                           .wr_en                 (mux_wr_en),
                                           .rd_en                 (mux_rd_en),
                                           .din                   (mux_wdata[8:0]),
                                           .dout                  (data_out[8:0]),
                                           .l2clk                 (clk)
                                          );

endmodule
