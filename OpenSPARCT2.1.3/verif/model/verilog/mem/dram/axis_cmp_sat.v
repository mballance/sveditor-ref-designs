// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_cmp_sat.v
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
  module cmp_sat (
   //{{{  
      io_dram3_ecc_in, io_dram3_data_valid,
      io_dram3_data_in, io_dram2_ecc_in, io_dram2_data_valid, 
      io_dram2_data_in, io_dram1_ecc_in, io_dram1_data_valid, 
      io_dram1_data_in, io_dram0_ecc_in, io_dram0_data_valid, 
      io_dram0_data_in,
   dram3_io_write_en_l,
   dram3_io_ras_l,
   dram3_io_data_out, dram3_io_cs_l,
   dram3_io_cas_l,
   dram3_io_bank, dram3_io_addr, dram2_io_write_en_l, dram2_io_ras_l,
   dram2_io_data_out, 
   dram2_io_cs_l,
   dram2_io_cas_l, dram2_io_bank,
   dram2_io_addr, dram1_io_write_en_l, dram1_io_ras_l, 
   dram1_io_data_out, 
   dram1_io_cs_l,
   dram1_io_cas_l, dram1_io_bank,
   dram1_io_addr,
   dram0_io_write_en_l, dram0_io_ras_l,
   dram0_io_data_out, 
   dram0_io_cs_l,
   dram0_io_cas_l, dram0_io_bank,
   dram0_io_addr,

   jbi_io_ssi_mosi, io_jbi_ssi_miso,
   //}}}  
                      dramclk,
                      ssiclk,
                      reset
                 );

   //{{{  
   input [14:0]        dram0_io_addr;          // From dram02 of dram.v
   input [2:0]         dram0_io_bank;          // From dram02 of dram.v
   input               dram0_io_cas_l;         // From dram02 of dram.v
   input [3:0]         dram0_io_cs_l;          // From dram02 of dram.v
   input [287:0]       dram0_io_data_out;      // From dram02 of dram.v
   input               dram0_io_ras_l;         // From dram02 of dram.v
   input               dram0_io_write_en_l;    // From dram02 of dram.v
   input [14:0]        dram1_io_addr;          // From dram13 of dram.v
   input [2:0]         dram1_io_bank;          // From dram13 of dram.v
   input               dram1_io_cas_l;         // From dram13 of dram.v
   input [3:0]         dram1_io_cs_l;          // From dram13 of dram.v
   input [287:0]       dram1_io_data_out;      // From dram13 of dram.v
   input               dram1_io_ras_l;         // From dram13 of dram.v
   input               dram1_io_write_en_l;    // From dram13 of dram.v
   input [14:0]        dram2_io_addr;          // From dram02 of dram.v
   input [2:0]         dram2_io_bank;          // From dram02 of dram.v
   input               dram2_io_cas_l;         // From dram02 of dram.v
   input [3:0]         dram2_io_cs_l;          // From dram02 of dram.v
   input [287:0]       dram2_io_data_out;      // From dram02 of dram.v
   input               dram2_io_ras_l;         // From dram02 of dram.v
   input               dram2_io_write_en_l;    // From dram02 of dram.v
   input [14:0]        dram3_io_addr;          // From dram13 of dram.v
   input [2:0]         dram3_io_bank;          // From dram13 of dram.v
   input               dram3_io_cas_l;         // From dram13 of dram.v
   input [3:0]         dram3_io_cs_l;          // From dram13 of dram.v
   input [287:0]       dram3_io_data_out;      // From dram13 of dram.v
   input               dram3_io_ras_l;         // From dram13 of dram.v
   input               dram3_io_write_en_l;    // From dram13 of dram.v


   input                      jbi_io_ssi_mosi;                  // Master out slave in to pad.
   output                       io_jbi_ssi_miso;                  // Master in slave out from pad.

   //}}}  
   //{{{  

   output [255:0]        io_dram0_data_in;       // To dram02 of dram.v
   output                io_dram0_data_valid;    // To dram02 of dram.v
   output [31:0]         io_dram0_ecc_in;        // To dram02 of dram.v
   output [255:0]        io_dram1_data_in;       // To dram13 of dram.v
   output                io_dram1_data_valid;    // To dram13 of dram.v
   output [31:0]         io_dram1_ecc_in;        // To dram13 of dram.v
   output [255:0]        io_dram2_data_in;       // To dram02 of dram.v
   output                io_dram2_data_valid;    // To dram02 of dram.v
   output [31:0]         io_dram2_ecc_in;        // To dram02 of dram.v
   output [255:0]        io_dram3_data_in;       // To dram13 of dram.v
   output                io_dram3_data_valid;    // To dram13 of dram.v
   output [31:0]         io_dram3_ecc_in;        // To dram13 of dram.v
   //}}}  

   input              dramclk;
   input              ssiclk;
   input              reset;

reg [7:0] TAP_STALL_CNT;
reg [7:0] CLSP_STALL_CNT;
 wire [127:0]                dram_iob_final;

//{{{  directory ram
/**************************************************************************************************************
*    DIRECTORY RAM definitions
**************************************************************************************************************/
wire [26:8] iob_index, dram0_index, dram1_index, dram2_index, dram3_index;

wire [31:0] iob_dir0_do, dram0_dir0_do, dram1_dir0_do, dram2_dir0_do, dram3_dir0_do;
wire [31:0] iob_dir1_do, dram0_dir1_do, dram1_dir1_do, dram2_dir1_do, dram3_dir1_do;
wire [31:0] iob_dir2_do, dram0_dir2_do, dram1_dir2_do, dram2_dir2_do, dram3_dir2_do;
wire [31:0] iob_dir3_do, dram0_dir3_do, dram1_dir3_do, dram2_dir3_do, dram3_dir3_do;
wire [31:0] iob_dir4_do, dram0_dir4_do, dram1_dir4_do, dram2_dir4_do, dram3_dir4_do;
wire [31:0] iob_dir5_do, dram0_dir5_do, dram1_dir5_do, dram2_dir5_do, dram3_dir5_do;
wire [31:0] iob_dir6_do, dram0_dir6_do, dram1_dir6_do, dram2_dir6_do, dram3_dir6_do;
wire [31:0] iob_dir7_do, dram0_dir7_do, dram1_dir7_do, dram2_dir7_do, dram3_dir7_do;
wire [31:0] iob_dir8_do, dram0_dir8_do, dram1_dir8_do, dram2_dir8_do, dram3_dir8_do;
wire [31:0] iob_dir9_do, dram0_dir9_do, dram1_dir9_do, dram2_dir9_do, dram3_dir9_do;
wire [31:0] iob_dira_do, dram0_dira_do, dram1_dira_do, dram2_dira_do, dram3_dira_do;
wire [31:0] iob_dirb_do, dram0_dirb_do, dram1_dirb_do, dram2_dirb_do, dram3_dirb_do;
wire [31:0] iob_dirc_do, dram0_dirc_do, dram1_dirc_do, dram2_dirc_do, dram3_dirc_do;
wire [31:0] iob_dird_do, dram0_dird_do, dram1_dird_do, dram2_dird_do, dram3_dird_do;
wire [31:0] iob_dire_do, dram0_dire_do, dram1_dire_do, dram2_dire_do, dram3_dire_do;
wire [31:0] iob_dirf_do, dram0_dirf_do, dram1_dirf_do, dram2_dirf_do, dram3_dirf_do;
wire [31:0] iob_dir10_do, dram0_dir10_do, dram1_dir10_do, dram2_dir10_do, dram3_dir10_do;
wire [31:0] iob_dir11_do, dram0_dir11_do, dram1_dir11_do, dram2_dir11_do, dram3_dir11_do;
wire [31:0] iob_dir12_do, dram0_dir12_do, dram1_dir12_do, dram2_dir12_do, dram3_dir12_do;
wire [31:0] iob_dir13_do, dram0_dir13_do, dram1_dir13_do, dram2_dir13_do, dram3_dir13_do;
wire [31:0] iob_dir14_do, dram0_dir14_do, dram1_dir14_do, dram2_dir14_do, dram3_dir14_do;
wire [31:0] iob_dir15_do, dram0_dir15_do, dram1_dir15_do, dram2_dir15_do, dram3_dir15_do;
wire [31:0] iob_dir16_do, dram0_dir16_do, dram1_dir16_do, dram2_dir16_do, dram3_dir16_do;
wire [31:0] iob_dir17_do, dram0_dir17_do, dram1_dir17_do, dram2_dir17_do, dram3_dir17_do;
wire [31:0] iob_dir18_do, dram0_dir18_do, dram1_dir18_do, dram2_dir18_do, dram3_dir18_do;
wire [31:0] iob_dir19_do, dram0_dir19_do, dram1_dir19_do, dram2_dir19_do, dram3_dir19_do;
wire [31:0] iob_dir1a_do, dram0_dir1a_do, dram1_dir1a_do, dram2_dir1a_do, dram3_dir1a_do;
wire [31:0] iob_dir1b_do, dram0_dir1b_do, dram1_dir1b_do, dram2_dir1b_do, dram3_dir1b_do;
wire [31:0] iob_dir1c_do, dram0_dir1c_do, dram1_dir1c_do, dram2_dir1c_do, dram3_dir1c_do;
wire [31:0] iob_dir1d_do, dram0_dir1d_do, dram1_dir1d_do, dram2_dir1d_do, dram3_dir1d_do;
wire [31:0] iob_dir1e_do, dram0_dir1e_do, dram1_dir1e_do, dram2_dir1e_do, dram3_dir1e_do;
wire [31:0] iob_dir1f_do, dram0_dir1f_do, dram1_dir1f_do, dram2_dir1f_do, dram3_dir1f_do;
wire [31:0] iob_dir20_do, dram0_dir20_do, dram1_dir20_do, dram2_dir20_do, dram3_dir20_do;
wire [31:0] iob_dir21_do, dram0_dir21_do, dram1_dir21_do, dram2_dir21_do, dram3_dir21_do;
wire [31:0] iob_dir22_do, dram0_dir22_do, dram1_dir22_do, dram2_dir22_do, dram3_dir22_do;
wire [31:0] iob_dir23_do, dram0_dir23_do, dram1_dir23_do, dram2_dir23_do, dram3_dir23_do;
wire [31:0] iob_dir24_do, dram0_dir24_do, dram1_dir24_do, dram2_dir24_do, dram3_dir24_do;
wire [31:0] iob_dir25_do, dram0_dir25_do, dram1_dir25_do, dram2_dir25_do, dram3_dir25_do;
wire [31:0] iob_dir26_do, dram0_dir26_do, dram1_dir26_do, dram2_dir26_do, dram3_dir26_do;
wire [31:0] iob_dir27_do, dram0_dir27_do, dram1_dir27_do, dram2_dir27_do, dram3_dir27_do;
wire [31:0] iob_dir28_do, dram0_dir28_do, dram1_dir28_do, dram2_dir28_do, dram3_dir28_do;
wire [31:0] iob_dir29_do, dram0_dir29_do, dram1_dir29_do, dram2_dir29_do, dram3_dir29_do;
wire [31:0] iob_dir2a_do, dram0_dir2a_do, dram1_dir2a_do, dram2_dir2a_do, dram3_dir2a_do;
wire [31:0] iob_dir2b_do, dram0_dir2b_do, dram1_dir2b_do, dram2_dir2b_do, dram3_dir2b_do;
wire [31:0] iob_dir2c_do, dram0_dir2c_do, dram1_dir2c_do, dram2_dir2c_do, dram3_dir2c_do;
wire [31:0] iob_dir2d_do, dram0_dir2d_do, dram1_dir2d_do, dram2_dir2d_do, dram3_dir2d_do;
wire [31:0] iob_dir2e_do, dram0_dir2e_do, dram1_dir2e_do, dram2_dir2e_do, dram3_dir2e_do;
wire [31:0] iob_dir2f_do, dram0_dir2f_do, dram1_dir2f_do, dram2_dir2f_do, dram3_dir2f_do;
wire [31:0] iob_dir30_do, dram0_dir30_do, dram1_dir30_do, dram2_dir30_do, dram3_dir30_do;
wire [31:0] iob_dir31_do, dram0_dir31_do, dram1_dir31_do, dram2_dir31_do, dram3_dir31_do;
wire [31:0] iob_dir32_do, dram0_dir32_do, dram1_dir32_do, dram2_dir32_do, dram3_dir32_do;
wire [31:0] iob_dir33_do, dram0_dir33_do, dram1_dir33_do, dram2_dir33_do, dram3_dir33_do;
wire [31:0] iob_dir34_do, dram0_dir34_do, dram1_dir34_do, dram2_dir34_do, dram3_dir34_do;
wire [31:0] iob_dir35_do, dram0_dir35_do, dram1_dir35_do, dram2_dir35_do, dram3_dir35_do;
wire [31:0] iob_dir36_do, dram0_dir36_do, dram1_dir36_do, dram2_dir36_do, dram3_dir36_do;
wire [31:0] iob_dir37_do, dram0_dir37_do, dram1_dir37_do, dram2_dir37_do, dram3_dir37_do;
wire [31:0] iob_dir38_do, dram0_dir38_do, dram1_dir38_do, dram2_dir38_do, dram3_dir38_do;
wire [31:0] iob_dir39_do, dram0_dir39_do, dram1_dir39_do, dram2_dir39_do, dram3_dir39_do;
wire [31:0] iob_dir3a_do, dram0_dir3a_do, dram1_dir3a_do, dram2_dir3a_do, dram3_dir3a_do;
wire [31:0] iob_dir3b_do, dram0_dir3b_do, dram1_dir3b_do, dram2_dir3b_do, dram3_dir3b_do;
wire [31:0] iob_dir3c_do, dram0_dir3c_do, dram1_dir3c_do, dram2_dir3c_do, dram3_dir3c_do;
wire [31:0] iob_dir3d_do, dram0_dir3d_do, dram1_dir3d_do, dram2_dir3d_do, dram3_dir3d_do;
wire [31:0] iob_dir3e_do, dram0_dir3e_do, dram1_dir3e_do, dram2_dir3e_do, dram3_dir3e_do;
wire [31:0] iob_dir3f_do, dram0_dir3f_do, dram1_dir3f_do, dram2_dir3f_do, dram3_dir3f_do;

dram_dir dir0 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir0_do), .data1(dram0_dir0_do), .data2(dram1_dir0_do), .data3(dram2_dir0_do), .data4(dram3_dir0_do));
dram_dir dir1 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir1_do), .data1(dram0_dir1_do), .data2(dram1_dir1_do), .data3(dram2_dir1_do), .data4(dram3_dir1_do));
dram_dir dir2 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir2_do), .data1(dram0_dir2_do), .data2(dram1_dir2_do), .data3(dram2_dir2_do), .data4(dram3_dir2_do));
dram_dir dir3 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir3_do), .data1(dram0_dir3_do), .data2(dram1_dir3_do), .data3(dram2_dir3_do), .data4(dram3_dir3_do));
dram_dir dir4 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir4_do), .data1(dram0_dir4_do), .data2(dram1_dir4_do), .data3(dram2_dir4_do), .data4(dram3_dir4_do));
dram_dir dir5 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir5_do), .data1(dram0_dir5_do), .data2(dram1_dir5_do), .data3(dram2_dir5_do), .data4(dram3_dir5_do));
dram_dir dir6 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir6_do), .data1(dram0_dir6_do), .data2(dram1_dir6_do), .data3(dram2_dir6_do), .data4(dram3_dir6_do));
dram_dir dir7 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir7_do), .data1(dram0_dir7_do), .data2(dram1_dir7_do), .data3(dram2_dir7_do), .data4(dram3_dir7_do));
dram_dir dir8 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir8_do), .data1(dram0_dir8_do), .data2(dram1_dir8_do), .data3(dram2_dir8_do), .data4(dram3_dir8_do));
dram_dir dir9 (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir9_do), .data1(dram0_dir9_do), .data2(dram1_dir9_do), .data3(dram2_dir9_do), .data4(dram3_dir9_do));
dram_dir dira (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dira_do), .data1(dram0_dira_do), .data2(dram1_dira_do), .data3(dram2_dira_do), .data4(dram3_dira_do));
dram_dir dirb (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dirb_do), .data1(dram0_dirb_do), .data2(dram1_dirb_do), .data3(dram2_dirb_do), .data4(dram3_dirb_do));
dram_dir dirc (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dirc_do), .data1(dram0_dirc_do), .data2(dram1_dirc_do), .data3(dram2_dirc_do), .data4(dram3_dirc_do));
dram_dir dird (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dird_do), .data1(dram0_dird_do), .data2(dram1_dird_do), .data3(dram2_dird_do), .data4(dram3_dird_do));
dram_dir dire (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dire_do), .data1(dram0_dire_do), .data2(dram1_dire_do), .data3(dram2_dire_do), .data4(dram3_dire_do));
dram_dir dirf (.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dirf_do), .data1(dram0_dirf_do), .data2(dram1_dirf_do), .data3(dram2_dirf_do), .data4(dram3_dirf_do));
dram_dir dir10(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir10_do),.data1(dram0_dir10_do),.data2(dram1_dir10_do),.data3(dram2_dir10_do),.data4(dram3_dir10_do));
dram_dir dir11(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir11_do),.data1(dram0_dir11_do),.data2(dram1_dir11_do),.data3(dram2_dir11_do),.data4(dram3_dir11_do));
dram_dir dir12(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir12_do),.data1(dram0_dir12_do),.data2(dram1_dir12_do),.data3(dram2_dir12_do),.data4(dram3_dir12_do));
dram_dir dir13(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir13_do),.data1(dram0_dir13_do),.data2(dram1_dir13_do),.data3(dram2_dir13_do),.data4(dram3_dir13_do));
dram_dir dir14(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir14_do),.data1(dram0_dir14_do),.data2(dram1_dir14_do),.data3(dram2_dir14_do),.data4(dram3_dir14_do));
dram_dir dir15(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir15_do),.data1(dram0_dir15_do),.data2(dram1_dir15_do),.data3(dram2_dir15_do),.data4(dram3_dir15_do));
dram_dir dir16(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir16_do),.data1(dram0_dir16_do),.data2(dram1_dir16_do),.data3(dram2_dir16_do),.data4(dram3_dir16_do));
dram_dir dir17(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir17_do),.data1(dram0_dir17_do),.data2(dram1_dir17_do),.data3(dram2_dir17_do),.data4(dram3_dir17_do));
dram_dir dir18(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir18_do),.data1(dram0_dir18_do),.data2(dram1_dir18_do),.data3(dram2_dir18_do),.data4(dram3_dir18_do));
dram_dir dir19(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir19_do),.data1(dram0_dir19_do),.data2(dram1_dir19_do),.data3(dram2_dir19_do),.data4(dram3_dir19_do));
dram_dir dir1a(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir1a_do),.data1(dram0_dir1a_do),.data2(dram1_dir1a_do),.data3(dram2_dir1a_do),.data4(dram3_dir1a_do));
dram_dir dir1b(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir1b_do),.data1(dram0_dir1b_do),.data2(dram1_dir1b_do),.data3(dram2_dir1b_do),.data4(dram3_dir1b_do));
dram_dir dir1c(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir1c_do),.data1(dram0_dir1c_do),.data2(dram1_dir1c_do),.data3(dram2_dir1c_do),.data4(dram3_dir1c_do));
dram_dir dir1d(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir1d_do),.data1(dram0_dir1d_do),.data2(dram1_dir1d_do),.data3(dram2_dir1d_do),.data4(dram3_dir1d_do));
dram_dir dir1e(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir1e_do),.data1(dram0_dir1e_do),.data2(dram1_dir1e_do),.data3(dram2_dir1e_do),.data4(dram3_dir1e_do));
dram_dir dir1f(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir1f_do),.data1(dram0_dir1f_do),.data2(dram1_dir1f_do),.data3(dram2_dir1f_do),.data4(dram3_dir1f_do));
dram_dir dir20(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir20_do),.data1(dram0_dir20_do),.data2(dram1_dir20_do),.data3(dram2_dir20_do),.data4(dram3_dir20_do));
dram_dir dir21(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir21_do),.data1(dram0_dir21_do),.data2(dram1_dir21_do),.data3(dram2_dir21_do),.data4(dram3_dir21_do));
dram_dir dir22(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir22_do),.data1(dram0_dir22_do),.data2(dram1_dir22_do),.data3(dram2_dir22_do),.data4(dram3_dir22_do));
dram_dir dir23(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir23_do),.data1(dram0_dir23_do),.data2(dram1_dir23_do),.data3(dram2_dir23_do),.data4(dram3_dir23_do));
dram_dir dir24(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir24_do),.data1(dram0_dir24_do),.data2(dram1_dir24_do),.data3(dram2_dir24_do),.data4(dram3_dir24_do));
dram_dir dir25(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir25_do),.data1(dram0_dir25_do),.data2(dram1_dir25_do),.data3(dram2_dir25_do),.data4(dram3_dir25_do));
dram_dir dir26(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir26_do),.data1(dram0_dir26_do),.data2(dram1_dir26_do),.data3(dram2_dir26_do),.data4(dram3_dir26_do));
dram_dir dir27(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir27_do),.data1(dram0_dir27_do),.data2(dram1_dir27_do),.data3(dram2_dir27_do),.data4(dram3_dir27_do));
dram_dir dir28(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir28_do),.data1(dram0_dir28_do),.data2(dram1_dir28_do),.data3(dram2_dir28_do),.data4(dram3_dir28_do));
dram_dir dir29(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir29_do),.data1(dram0_dir29_do),.data2(dram1_dir29_do),.data3(dram2_dir29_do),.data4(dram3_dir29_do));
dram_dir dir2a(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir2a_do),.data1(dram0_dir2a_do),.data2(dram1_dir2a_do),.data3(dram2_dir2a_do),.data4(dram3_dir2a_do));
dram_dir dir2b(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir2b_do),.data1(dram0_dir2b_do),.data2(dram1_dir2b_do),.data3(dram2_dir2b_do),.data4(dram3_dir2b_do));
dram_dir dir2c(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir2c_do),.data1(dram0_dir2c_do),.data2(dram1_dir2c_do),.data3(dram2_dir2c_do),.data4(dram3_dir2c_do));
dram_dir dir2d(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir2d_do),.data1(dram0_dir2d_do),.data2(dram1_dir2d_do),.data3(dram2_dir2d_do),.data4(dram3_dir2d_do));
dram_dir dir2e(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir2e_do),.data1(dram0_dir2e_do),.data2(dram1_dir2e_do),.data3(dram2_dir2e_do),.data4(dram3_dir2e_do));
dram_dir dir2f(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir2f_do),.data1(dram0_dir2f_do),.data2(dram1_dir2f_do),.data3(dram2_dir2f_do),.data4(dram3_dir2f_do));
dram_dir dir30(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir30_do),.data1(dram0_dir30_do),.data2(dram1_dir30_do),.data3(dram2_dir30_do),.data4(dram3_dir30_do));
dram_dir dir31(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir31_do),.data1(dram0_dir31_do),.data2(dram1_dir31_do),.data3(dram2_dir31_do),.data4(dram3_dir31_do));
dram_dir dir32(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir32_do),.data1(dram0_dir32_do),.data2(dram1_dir32_do),.data3(dram2_dir32_do),.data4(dram3_dir32_do));
dram_dir dir33(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir33_do),.data1(dram0_dir33_do),.data2(dram1_dir33_do),.data3(dram2_dir33_do),.data4(dram3_dir33_do));
dram_dir dir34(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir34_do),.data1(dram0_dir34_do),.data2(dram1_dir34_do),.data3(dram2_dir34_do),.data4(dram3_dir34_do));
dram_dir dir35(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir35_do),.data1(dram0_dir35_do),.data2(dram1_dir35_do),.data3(dram2_dir35_do),.data4(dram3_dir35_do));
dram_dir dir36(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir36_do),.data1(dram0_dir36_do),.data2(dram1_dir36_do),.data3(dram2_dir36_do),.data4(dram3_dir36_do));
dram_dir dir37(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir37_do),.data1(dram0_dir37_do),.data2(dram1_dir37_do),.data3(dram2_dir37_do),.data4(dram3_dir37_do));
dram_dir dir38(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir38_do),.data1(dram0_dir38_do),.data2(dram1_dir38_do),.data3(dram2_dir38_do),.data4(dram3_dir38_do));
dram_dir dir39(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir39_do),.data1(dram0_dir39_do),.data2(dram1_dir39_do),.data3(dram2_dir39_do),.data4(dram3_dir39_do));
dram_dir dir3a(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir3a_do),.data1(dram0_dir3a_do),.data2(dram1_dir3a_do),.data3(dram2_dir3a_do),.data4(dram3_dir3a_do));
dram_dir dir3b(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir3b_do),.data1(dram0_dir3b_do),.data2(dram1_dir3b_do),.data3(dram2_dir3b_do),.data4(dram3_dir3b_do));
dram_dir dir3c(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir3c_do),.data1(dram0_dir3c_do),.data2(dram1_dir3c_do),.data3(dram2_dir3c_do),.data4(dram3_dir3c_do));
dram_dir dir3d(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir3d_do),.data1(dram0_dir3d_do),.data2(dram1_dir3d_do),.data3(dram2_dir3d_do),.data4(dram3_dir3d_do));
dram_dir dir3e(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir3e_do),.data1(dram0_dir3e_do),.data2(dram1_dir3e_do),.data3(dram2_dir3e_do),.data4(dram3_dir3e_do));
dram_dir dir3f(.adr0(iob_index),    .adr1(dram0_index ),   .adr2(dram1_index),    .adr3(dram2_index ),   .adr4(dram3_index),
              .data0(iob_dir3f_do),.data1(dram0_dir3f_do),.data2(dram1_dir3f_do),.data3(dram2_dir3f_do),.data4(dram3_dir3f_do));

//}}}  
//{{{  ssi
wire [127:0]  iob_do0, iob_do1, iob_do2, iob_do3, iob_do4, iob_do5, iob_do6, iob_do7;
wire [127:0]  iob_do8, iob_do9, iob_doa, iob_dob, iob_doc, iob_dod, iob_doe, iob_dof;

//{{{  misc ssi signals
reg [40:0]     FAST_CLK_CNT; // CYCLE NUMBER
reg [39:0]     CLK_CNT    ; // CYCLE NUMBER
reg [39:0]     CLK_CNT_RUST;  // CYCLE COUNT OF RUST KERNAL
reg [ 3:0]     IOB_VLD    ; // IOB IFILL RESPONSE SEQUENCE
reg [32:0]     IOB_ADR0   ; // IOB FILL ADDRESS
reg [32:0]     IOB_ADR1   ;
reg [2:0]      REQ_GNT_CNT; // REQUESTS vs. GRANTS
reg [5:0]      POWERON_CNT; // WAKE UP 32 THREADS
reg [1:0]      POWERON_VEC; // POWERON SEQ
reg [7:0]      IO_CPX_REQ_CQ_VEC; // iob_cpx_req_cq register
reg [31:0]     RESTART_COUNT; // Count off to next restart
reg [31:0]     RESUME_COUNT ; // Count off to next resume
reg [31:0]     HALT_COUNT   ; // Count off to next halt
reg [ 4:0]     INT_COUNT;     // INT THREAD POINTER
reg [ 1:0]     INT_TYPE0;     // Interrupt type field
reg [ 1:0]     INT_TYPE1;     // Interrupt type field staged
reg [ 1:0]     INT_VEC;       // valid interrupt staged staged
reg [31:0]     STALL_ON_CNT;  // iob_pcx_stall_pq enable counter
reg [31:0]     STALL_OFF_CNT; // iob_pcx_stall_pq disable counter
reg [10:0]     WDOG_FWD;      // Forward request must complete in < 2K cycles
reg            FWD_ACTIVE;    // Forward request is currently being processed
reg [ 1:0]     FWD_REQ;       // Forward request being issued
reg [11:0]     FWD_ADR;       // Forward page address bits
reg [63:0]     FWD_DATA;      // Forward data
reg [ 4:0]     FWD_SEQ;       // RRWRR sequence
reg [31:0]     FINISHED;      // Which threads have completed
//}}}  

/**************************************************************************************************************
*    BOOT ROM LOGIC
*    This logic operates in a divide by 4 relative to the Jbus clock.
**************************************************************************************************************/
`ifdef CMP_IOBDG
reg  [31:0]  SSI_CMD_SEQ;
reg          SSI_CMD_RW;
reg  [ 1:0]  SSI_CMD_LNGT;
reg  [27:0]  SSI_CMD_ADR;
reg  [65:0]  SSI_RTN_SEQ;
reg  [65:0]  SSI_SND_SEQ;
reg  [ 1:0]  SSI_WR_RSPN;
reg  [63:0]  SSI_RTN_DATA;
reg  [63:0]  SSI_SND_DATA;
reg          SSI_RTN_PAR;
reg  [15:0]  SSI_DELAY;
reg  [13:0]  CONSOLE_RD_TIMER;

wire [15:0]  ssi_fix_delay;


wire [31:0] console_out;

wire [7:0] console_status = console_out[7:0];
wire [7:0] console_data   = console_out[15:8];

//assign   console_status[7:0]   =  (CTL_RAM[12]       & 8'hff);
//assign   console_data  [7:0]   = ((CTL_RAM[12] >> 8) & 8'hff);

wire [31:0]  ssi_cmd_seqP  = ((SSI_CMD_SEQ == 32'h0) & jbi_io_ssi_mosi &
                            ~(|SSI_SND_SEQ) & ~(|SSI_WR_RSPN)) ? 32'h80000000 :
                             ( SSI_CMD_SEQ[1] & ~SSI_CMD_RW)   ? 32'h00000000 :
                                                                 {1'b0, SSI_CMD_SEQ[31:1]};

wire         ssi_cmd_rwP   = SSI_CMD_SEQ[31] ? jbi_io_ssi_mosi : SSI_CMD_RW;

wire [ 1:0]  ssi_cmd_lngtP = (|SSI_CMD_SEQ[30:29]) ? {SSI_CMD_LNGT[0], jbi_io_ssi_mosi} : SSI_CMD_LNGT[1:0];

wire [27:0]  ssi_cmd_adrP  = (|SSI_CMD_SEQ[28:1]) ? {SSI_CMD_ADR[26:0], jbi_io_ssi_mosi} : SSI_CMD_ADR[27:0]; 

wire [39:0]  jbi_rom_adr   = {12'hfff, SSI_CMD_ADR[27:0]}; 

//wire         pcx_iob_fill_ld =                                SSI_CMD_SEQ[0] & SSI_CMD_RW;
  wire         pcx_iob_fill_ld = (ssi_fix_delay == SSI_DELAY) &                  SSI_CMD_RW;

  wire [15:0]  ssi_delayP      = (SSI_CMD_SEQ[0] & SSI_CMD_RW) ? 16'h0001 : 
                                 (ssi_fix_delay == SSI_DELAY)  ? 16'h0000 :
                                 (SSI_DELAY == 16'h0000)       ? 16'h0000 : ((SSI_DELAY + 1) & 16'hffff);

//wire [ 31:0] rom_read_4byte = ~IOB_ADR1[3] ? (~IOB_ADR1[2] ? dram_iob_final[127: 96] : dram_iob_final[95:64]) :
//                                             (~IOB_ADR1[2] ? dram_iob_final[ 63: 32] : dram_iob_final[31: 0]);

wire [ 63:0] rom_read_8byte = ~IOB_ADR1[3] ? dram_iob_final[127:64] : dram_iob_final[63:0];
wire [ 31:0] rom_read_4byte = ~IOB_ADR1[2] ? rom_read_8byte[63:32] : rom_read_8byte[31:0];
wire [ 15:0] rom_read_2byte = ~IOB_ADR1[1] ? rom_read_4byte[31:16] : rom_read_4byte[15:0];
wire [  7:0] rom_read_1byte = ~IOB_ADR1[0] ? rom_read_2byte[15: 8] : rom_read_2byte[ 7:0];

wire [ 63:0] rom_read      = (SSI_CMD_LNGT[1:0] == 2'b11) ? rom_read_8byte :
                             (SSI_CMD_LNGT[1:0] == 2'b10) ? {rom_read_4byte, 32'h0} : 
                             (SSI_CMD_LNGT[1:0] == 2'b01) ? {rom_read_2byte, 48'h0} : {rom_read_1byte, 56'h0};

wire         ssi_rtn_last  = ((SSI_CMD_LNGT[1:0] == 2'b11) & SSI_RTN_SEQ[65]) |
                             ((SSI_CMD_LNGT[1:0] == 2'b10) & SSI_RTN_SEQ[33]) |
                             ((SSI_CMD_LNGT[1:0] == 2'b01) & SSI_RTN_SEQ[17]) |
                             ((SSI_CMD_LNGT[1:0] == 2'b00) & SSI_RTN_SEQ[ 9]);

wire         ssi_snd_last  = ((SSI_CMD_LNGT[1:0] == 2'b11) & SSI_SND_SEQ[64]) |
                             ((SSI_CMD_LNGT[1:0] == 2'b10) & SSI_SND_SEQ[32]) |
                             ((SSI_CMD_LNGT[1:0] == 2'b01) & SSI_SND_SEQ[16]) |
                             ((SSI_CMD_LNGT[1:0] == 2'b00) & SSI_SND_SEQ[ 8]);

wire [65:0]  ssi_rtn_seqP  = IOB_VLD[3]   ? 66'h1 :
                             ssi_rtn_last ? 66'h0 : {SSI_RTN_SEQ[64:0], 1'b0};

wire [65:0]  ssi_snd_seqP  = (SSI_CMD_SEQ[1] & ~SSI_CMD_RW) ? 66'h1 :
                             ssi_snd_last                   ? 66'h0 : {SSI_SND_SEQ[64:0], 1'b0};

wire [1:0]   ssi_wr_rspnP  = ssi_snd_last ? 2'b01 : {SSI_WR_RSPN[0], 1'b0};

wire [63:0]  ssi_rtn_dataP = IOB_VLD[3]  ?
                             ((SSI_CMD_ADR == 28'h0c2c005) ? {console_status, 56'h0} :  
                              (SSI_CMD_ADR == 28'h0c2c000) ? {console_data  , 56'h0} : rom_read[63:0]) : 
                             (|SSI_RTN_SEQ[64:1]) ? {SSI_RTN_DATA[62:0], 1'b0} : SSI_RTN_DATA[63:0];

wire [63:0]  ssi_snd_dataP = ((|SSI_SND_SEQ[63:0]) & ~ssi_snd_last) ? {SSI_SND_DATA[62:0], jbi_io_ssi_mosi} :
                                                                       SSI_SND_DATA[63:0];

wire         ssi_rtn_parP  = SSI_RTN_SEQ[ 0] ? 1 : (io_jbi_ssi_miso ^ SSI_RTN_PAR);

assign     io_jbi_ssi_miso = SSI_RTN_SEQ[ 0]    ? 1'b1 :
                           (|SSI_WR_RSPN[1:0])  ? 1'b1 :
                             ssi_rtn_last       ? SSI_RTN_PAR :
                           (|SSI_RTN_SEQ[64:1]) ? SSI_RTN_DATA[63] : 1'b0; 


wire console_rd_v = (ssi_rtn_last & (SSI_CMD_ADR == 28'h0c2c005)) & (&CONSOLE_RD_TIMER);

`ifdef AXIS
wire [13:0] console_rd_timerP = console_rd_v ? 14'h03 :
                                (&CONSOLE_RD_TIMER)  ? CONSOLE_RD_TIMER :
                                CONSOLE_RD_TIMER + 4;
`else   
wire [13:0] console_rd_timerP = console_rd_v ? 14'h7f :
                                (&CONSOLE_RD_TIMER)  ? CONSOLE_RD_TIMER :
                                CONSOLE_RD_TIMER + 128;
`endif

wire console_mask = (ssi_rtn_last & (SSI_CMD_ADR == 28'h0c2c000)) |
                    (ssi_snd_last & (SSI_CMD_ADR == 28'h0c2c005));

wire [31:0] console_in = console_mask ? (console_out & 32'hffffffee) : CLK_CNT[39:8];

rf2x32   rf2x32 ( .rclk    (ssiclk),
                  .radr    (1'b1), 
                  .wadr    (console_mask), 
                  .ren     (1'b1), 
                  .we      (1'b1), 
                  .wm      (32'hffffffff), 
                  .din     (console_in),
                  .dout    (console_out) );

always @(posedge ssiclk) begin
  if (ssi_snd_last)
    begin // axis tbcall_region
     $display("SSI CONSOLE WRITE %h %h %h", SSI_CMD_ADR, SSI_CMD_LNGT, SSI_SND_DATA);
    end
  if (ssi_rtn_last & (SSI_CMD_ADR == 28'h0c2c000))  // Data Byte rd
    begin // axis tbcall_region
      $display("Writing cmp_mask [dbyte read]  %x", CONSOLE_RD_TIMER);
$writememh("include/CONSOLE_RAM", rf2x32.REGF2X32);
    end
//if (ssi_rtn_last & (SSI_CMD_ADR == 28'h0c2c000))  // Data Byte rd
//  begin // axis tbcall_region
//    CTL_RAM[12] <= (CTL_RAM[12] & 32'hffffffee);
//  end   
  if (ssi_snd_last & (SSI_CMD_ADR == 28'h0c2c005))  // Status Byte wr
    begin // axis tbcall_region
      $display("Writing cmp_mask [sbyte write] %x", CONSOLE_RD_TIMER);
$writememh("include/CONSOLE_RAM", rf2x32.REGF2X32);
    end
//if (ssi_snd_last & (SSI_CMD_ADR == 28'h0c2c005))  // Status Byte wr
//  begin // axis tbcall_region
//    CTL_RAM[12] <= (CTL_RAM[12] & 32'hffffffee);
//  end   
  if (console_rd_v)                                 // Status Byte rd
    begin // axis tbcall_region
      $display("Reading cmp_mask [sbyte read]  %x", CONSOLE_RD_TIMER);
$readmemh("include/CONSOLE_RAM", rf2x32.REGF2X32);
    end

`ifdef AXIS
  CONSOLE_RD_TIMER <= (reset) ? 14'h03 : console_rd_timerP;
`else      
  CONSOLE_RD_TIMER <= (reset) ? 14'hff : console_rd_timerP;
`endif   

  SSI_CMD_SEQ    <= (reset) ? 32'h0 : ssi_cmd_seqP;
  SSI_CMD_RW     <= (reset) ?  1'h0 : ssi_cmd_rwP;
  SSI_CMD_LNGT   <= (reset) ?  2'h0 : ssi_cmd_lngtP;
  SSI_CMD_ADR    <= (reset) ? 28'h0 : ssi_cmd_adrP;
  SSI_RTN_SEQ    <= (reset) ? 66'h0 : ssi_rtn_seqP;
  SSI_SND_SEQ    <= (reset) ? 66'h0 : ssi_snd_seqP;
  SSI_WR_RSPN    <= (reset) ?  2'b0 : ssi_wr_rspnP;
  SSI_RTN_DATA   <= (reset) ? 64'h0 : ssi_rtn_dataP;
  SSI_SND_DATA   <= (reset) ? 64'h0 : ssi_snd_dataP;
  SSI_RTN_PAR    <= (reset) ?  1'h0 : ssi_rtn_parP;
  SSI_DELAY      <= (reset) ? 16'h0 : ssi_delayP;
end
`else 
assign     io_jbi_ssi_miso = 1'b0;
`endif


wire [ 7:0]  iob_line  = jbi_rom_adr[ 7: 0];
// assign       iob_index[26:8] = ({jbi_rom_adr[ 39: 9],jbi_rom_adr[6]} + jbi_rom_adr[ 39:15]) & 19'h7FFFF;
assign       iob_index[26:8] = ({jbi_rom_adr[ 39: 9],jbi_rom_adr[6]}) & 19'h7FFFF;
wire [39:8]  iob_match = jbi_rom_adr[ 39: 8];


//}}}  
//{{{  misc iob/ccx stuff
/**************************************************************************************************************
*    This logic responds to IFILL requests from the cmp.  Whenever a request pcx_iob_data_px2[123:0] is received,
*  iob_cpx_req_cq is asserted the next cycle with a one-hot version of the Cpu_id field of pcx_iob_data_px2.
*  Then, on the next cycle, iob_cpx_data_ca[144:0] is asserted. 
*    This sequence has priority over the poweron interrupts being sent to wake up the threads.  Thus there 
*  needs to be no queuing and grant can be ignored.
**************************************************************************************************************/



wire [ 5:0]  iob_way   = ~pcx_iob_fill_ld                     ? 6'b000000 :
                         (iob_dir0_do           == iob_match) ? 6'b000000 :
                         (iob_dir1_do           == iob_match) ? 6'b000001 :
                         (iob_dir2_do           == iob_match) ? 6'b000010 :
                         (iob_dir3_do           == iob_match) ? 6'b000011 :
                         (iob_dir4_do           == iob_match) ? 6'b000100 :
                         (iob_dir5_do           == iob_match) ? 6'b000101 :
                         (iob_dir6_do           == iob_match) ? 6'b000110 :
                         (iob_dir7_do           == iob_match) ? 6'b000111 :
                         (iob_dir8_do           == iob_match) ? 6'b001000 :
                         (iob_dir9_do           == iob_match) ? 6'b001001 :
                         (iob_dira_do           == iob_match) ? 6'b001010 :
                         (iob_dirb_do           == iob_match) ? 6'b001011 :
                         (iob_dirc_do           == iob_match) ? 6'b001100 :
                         (iob_dird_do           == iob_match) ? 6'b001101 :
                         (iob_dire_do           == iob_match) ? 6'b001110 :
                         (iob_dirf_do           == iob_match) ? 6'b001111 :
                         (iob_dir10_do          == iob_match) ? 6'b010000 :
                         (iob_dir11_do          == iob_match) ? 6'b010001 :
                         (iob_dir12_do          == iob_match) ? 6'b010010 :
                         (iob_dir13_do          == iob_match) ? 6'b010011 :
                         (iob_dir14_do          == iob_match) ? 6'b010100 :
                         (iob_dir15_do          == iob_match) ? 6'b010101 :
                         (iob_dir16_do          == iob_match) ? 6'b010110 :
                         (iob_dir17_do          == iob_match) ? 6'b010111 :
                         (iob_dir18_do          == iob_match) ? 6'b011000 :
                         (iob_dir19_do          == iob_match) ? 6'b011001 :
                         (iob_dir1a_do          == iob_match) ? 6'b011010 :
                         (iob_dir1b_do          == iob_match) ? 6'b011011 :
                         (iob_dir1c_do          == iob_match) ? 6'b011100 :
                         (iob_dir1d_do          == iob_match) ? 6'b011101 :
                         (iob_dir1e_do          == iob_match) ? 6'b011110 :
                         (iob_dir1f_do          == iob_match) ? 6'b011111 :
                         (iob_dir20_do           == iob_match) ? 6'b100000 :
                         (iob_dir21_do           == iob_match) ? 6'b100001 :
                         (iob_dir22_do           == iob_match) ? 6'b100010 :
                         (iob_dir23_do           == iob_match) ? 6'b100011 :
                         (iob_dir24_do           == iob_match) ? 6'b100100 :
                         (iob_dir25_do           == iob_match) ? 6'b100101 :
                         (iob_dir26_do           == iob_match) ? 6'b100110 :
                         (iob_dir27_do           == iob_match) ? 6'b100111 :
                         (iob_dir28_do           == iob_match) ? 6'b101000 :
                         (iob_dir29_do           == iob_match) ? 6'b101001 :
                         (iob_dir2a_do           == iob_match) ? 6'b101010 :
                         (iob_dir2b_do           == iob_match) ? 6'b101011 :
                         (iob_dir2c_do           == iob_match) ? 6'b101100 :
                         (iob_dir2d_do           == iob_match) ? 6'b101101 :
                         (iob_dir2e_do           == iob_match) ? 6'b101110 :
                         (iob_dir2f_do           == iob_match) ? 6'b101111 :
                         (iob_dir30_do          == iob_match) ? 6'b110000 :
                         (iob_dir31_do          == iob_match) ? 6'b110001 :
                         (iob_dir32_do          == iob_match) ? 6'b110010 :
                         (iob_dir33_do          == iob_match) ? 6'b110011 :
                         (iob_dir34_do          == iob_match) ? 6'b110100 :
                         (iob_dir35_do          == iob_match) ? 6'b110101 :
                         (iob_dir36_do          == iob_match) ? 6'b110110 :
                         (iob_dir37_do          == iob_match) ? 6'b110111 :
                         (iob_dir38_do          == iob_match) ? 6'b111000 :
                         (iob_dir39_do          == iob_match) ? 6'b111001 :
                         (iob_dir3a_do          == iob_match) ? 6'b111010 :
                         (iob_dir3b_do          == iob_match) ? 6'b111011 :
                         (iob_dir3c_do          == iob_match) ? 6'b111100 :
                         (iob_dir3d_do          == iob_match) ? 6'b111101 :
                         (iob_dir3e_do          == iob_match) ? 6'b111110 :
                         (iob_dir3f_do          == iob_match) ? 6'b111111 :
                                                                6'b111111;

// wire refresh_max =
//                      (|(cmp.dram02.dramctl0.dram_dctl.dram_que.rfc_cnt)) |
//                      (|(cmp.dram02.dramctl1.dram_dctl.dram_que.rfc_cnt)) |
//                      (|(cmp.dram13.dramctl0.dram_dctl.dram_que.rfc_cnt)) |
//                      (|(cmp.dram13.dramctl1.dram_dctl.dram_que.rfc_cnt));

wire [3:0] boot_data_way = {jbi_rom_adr[8:7],jbi_rom_adr[5:4]};

 assign dram_iob_final[127:0] = (boot_data_way == 4'h0) ? iob_do0 :
                              (boot_data_way == 4'h1) ? iob_do1 :
                              (boot_data_way == 4'h2) ? iob_do2 :
                              (boot_data_way == 4'h3) ? iob_do3 :
                              (boot_data_way == 4'h4) ? iob_do4 :
                              (boot_data_way == 4'h5) ? iob_do5 :
                              (boot_data_way == 4'h6) ? iob_do6 :
                              (boot_data_way == 4'h7) ? iob_do7 :
                              (boot_data_way == 4'h8) ? iob_do8 :
                              (boot_data_way == 4'h9) ? iob_do9 :
                              (boot_data_way == 4'ha) ? iob_doa :
                              (boot_data_way == 4'hb) ? iob_dob :
                              (boot_data_way == 4'hc) ? iob_doc :
                              (boot_data_way == 4'hd) ? iob_dod :
                              (boot_data_way == 4'he) ? iob_doe : iob_dof;

/**************************************************************************************************************
*    Global clock domain registers clocked and initialized
**************************************************************************************************************/
reg [5:0] iob_way_d;
always @(posedge ssiclk) begin
  IOB_VLD     <= (reset) ?  4'b0 : {IOB_VLD[2],IOB_VLD[1], IOB_VLD[0], pcx_iob_fill_ld};
  IOB_ADR0    <= (reset) ? 33'h0 : {             iob_way_d[5:0], iob_index[26:8], iob_line[7:0]};
  IOB_ADR1    <= (reset) ? 33'h0 : IOB_ADR0[32:0];
//  FINISHED      <= (reset) ? 32'h0 : finishedP[31:0];
  iob_way_d <=  (reset) ?  6'b0 :iob_way[5:0];
  if (IOB_VLD[2])
    begin // axis tbcall_region
   $display("SSI PROM READ %h %h %h", jbi_rom_adr, IOB_ADR0, rom_read[63:0]);
    end
end

//}}}  
`define DUMP_DRAM1
`ifdef DUMP_DRAM
//{{{  dram dump
//always @(posedge clk) begin
initial begin
//   if (sim_done[0] & ~sim_done[1] & write_mem)

#4500000 ;
   begin // axis tbcall_region
    $display("DUMPING MEMORY");
$writememh("dram_init/dump0", dram0.DRAM);
$writememh("dram_init/dump1", dram1.DRAM);
$writememh("dram_init/dump2", dram2.DRAM);
$writememh("dram_init/dump3", dram3.DRAM);
$writememh("dram_init/dump4", dram4.DRAM);
$writememh("dram_init/dump5", dram5.DRAM);
$writememh("dram_init/dump6", dram6.DRAM);
$writememh("dram_init/dump7", dram7.DRAM);
$writememh("dram_init/dump8", dram8.DRAM);
$writememh("dram_init/dump9", dram9.DRAM);
$writememh("dram_init/dumpa", drama.DRAM);
$writememh("dram_init/dumpb", dramb.DRAM);
$writememh("dram_init/dumpc", dramc.DRAM);
$writememh("dram_init/dumpd", dramd.DRAM);
$writememh("dram_init/dumpe", drame.DRAM);
$writememh("dram_init/dumpf", dramf.DRAM);
   end
end
//}}}  
`endif
reg [31:0] CTL_RAM [31:0];
`define DRAM_SLAM
//`define DRAM_PLUSARGS

//{{{  dram setup
`ifdef DRAM_SLAM
wire [2:0] que_data_del_cnt     =  (CTL_RAM[15]       & 7);  // Delay for DRAM reads
wire [2:0] que_data_del_cnt0    =  (CTL_RAM[15]       & 7);  // Delay for DRAM reads
wire [2:0] que_data_del_cnt1    =  (CTL_RAM[15]       & 7);  // Delay for DRAM reads
wire [2:0] que_data_del_cnt2    =  (CTL_RAM[15]       & 7);  // Delay for DRAM reads
wire [2:0] que_data_del_cnt3    =  (CTL_RAM[15]       & 7);  // Delay for DRAM reads
wire       que_eight_bank_mode  = ((CTL_RAM[15] >> 4) & 1);  // Eight Bank Mode
wire       que_eight_bank_mode0 = ((CTL_RAM[15] >> 4) & 1);  // Eight Bank Mode
wire       que_eight_bank_mode1 = ((CTL_RAM[15] >> 4) & 1);  // Eight Bank Mode
wire       que_eight_bank_mode2 = ((CTL_RAM[15] >> 4) & 1);  // Eight Bank Mode
wire       que_eight_bank_mode3 = ((CTL_RAM[15] >> 4) & 1);  // Eight Bank Mode
wire [3:0] ras_addr_width       = ((CTL_RAM[15] >> 8) & 15); // RAS address width
wire [3:0] ras_addr_width0      = ((CTL_RAM[15] >> 8) & 15); // RAS address width
wire [3:0] ras_addr_width1      = ((CTL_RAM[15] >> 8) & 15); // RAS address width
wire [3:0] ras_addr_width2      = ((CTL_RAM[15] >> 8) & 15); // RAS address width
wire [3:0] ras_addr_width3      = ((CTL_RAM[15] >> 8) & 15); // RAS address width
wire       stacked_dimm         = ((CTL_RAM[15] >>12) & 1);  // Stacked DIMM DRAM
wire       stacked_dimm0        = ((CTL_RAM[15] >>12) & 1);  // Stacked DIMM DRAM
wire       stacked_dimm1        = ((CTL_RAM[15] >>12) & 1);  // Stacked DIMM DRAM
wire       stacked_dimm2        = ((CTL_RAM[15] >>12) & 1);  // Stacked DIMM DRAM
wire       stacked_dimm3        = ((CTL_RAM[15] >>12) & 1);  // Stacked DIMM DRAM
wire       que_rank1_present    = ((CTL_RAM[15] >>16) & 1);  // DRAM rank1
wire       que_rank1_present0   = ((CTL_RAM[15] >>16) & 1);  // DRAM rank1
wire       que_rank1_present1   = ((CTL_RAM[15] >>16) & 1);  // DRAM rank1
wire       que_rank1_present2   = ((CTL_RAM[15] >>16) & 1);  // DRAM rank1
wire       que_rank1_present3   = ((CTL_RAM[15] >>16) & 1);  // DRAM rank1
wire [2:0] que_tot_ranks        = ((CTL_RAM[15] >>20) & 7);  // DRAM total ranks.  Derivitive


`elsif DRAM_PLUSARGS
reg [2:0] que_data_del_cnt    ;
reg [2:0] que_data_del_cnt0    ;
reg [2:0] que_data_del_cnt1    ;
reg [2:0] que_data_del_cnt2    ;
reg [2:0] que_data_del_cnt3    ;
reg       que_eight_bank_mode ;
reg       que_eight_bank_mode0 ;
reg       que_eight_bank_mode1 ;
reg       que_eight_bank_mode2 ;
reg       que_eight_bank_mode3 ;
reg [3:0] ras_addr_width      ;
reg [3:0] ras_addr_width0      ;
reg [3:0] ras_addr_width1      ;
reg [3:0] ras_addr_width2      ;
reg [3:0] ras_addr_width3      ;
reg       stacked_dimm        ;
reg       stacked_dimm0        ;
reg       stacked_dimm1        ;
reg       stacked_dimm2        ;
reg       stacked_dimm3        ;
reg       que_rank1_present   ;
reg       que_rank1_present0   ;
reg       que_rank1_present1   ;
reg       que_rank1_present2   ;
reg       que_rank1_present3   ;
reg [2:0] que_tot_ranks        ;

`ifdef PALLADIUM
initial
begin
    CTL_RAM[0] <= 'h00000a71;
    CTL_RAM[1] <= 'h00000001;
    CTL_RAM[2] <= 'h00000000;
    CTL_RAM[3] <= 'h00080c1c;
    CTL_RAM[4] <= 'h00000000;
    CTL_RAM[5] <= 'h00000100;
    CTL_RAM[6] <= 'h040E0C02;
    CTL_RAM[7] <= 'h300E0150;
    CTL_RAM[8] <= 'h41410506;
    CTL_RAM[9] <= 'h00000041;
    CTL_RAM[10] <= 'h42420405;
    CTL_RAM[11] <= 'h00000042;
    CTL_RAM[12] <= 'h00000060;
    CTL_RAM[13] <= 'h00000002;
    CTL_RAM[14] <= 'h00000000;
    CTL_RAM[15] <= 'h00411f11;
    CTL_RAM[16] <= 'h00000191;
    CTL_RAM[17] <= 'h00000000;
    CTL_RAM[18] <= 'h00000000;
    CTL_RAM[19] <= 'h00000000;
    CTL_RAM[20] <= 'h00000200;
    CTL_RAM[21] <= 'h00000000;
    CTL_RAM[22] <= 'h00000000;
    CTL_RAM[23] <= 'h00000000;
    CTL_RAM[24] <= 'h00000000;
    CTL_RAM[25] <= 'h00000000;
    CTL_RAM[26] <= 'h00000000;
    CTL_RAM[27] <= 'h00000001;
    CTL_RAM[28] <= 'h00000001;
    CTL_RAM[29] <= 'h00000001;
    CTL_RAM[30] <= 'h00000001;
    CTL_RAM[31] <= 'h10000000;
end // initial begin
`endif //  `ifdef PALLADIUM

initial
begin
    $display("Setting DRAM using cmd line plusargs\n");

    if ( $value$plusargs("que_tot_ranks=%h",que_tot_ranks)) 
    begin
      $display("que_tot_ranks=%b\n",que_tot_ranks);
      que_data_del_cnt0 = que_data_del_cnt;  // Making it non-blocking
      que_data_del_cnt1 = que_data_del_cnt;  // to break the race bw
      que_data_del_cnt2 = que_data_del_cnt;  // assign and initial
      que_data_del_cnt3 = que_data_del_cnt;
    end
    if ( $value$plusargs("que_data_del_cnt=%h",que_data_del_cnt)) 
    begin
      $display("que_data_del_cnt=%b\n",que_data_del_cnt);
      que_eight_bank_mode0 = que_eight_bank_mode;
      que_eight_bank_mode1 = que_eight_bank_mode;
      que_eight_bank_mode2 = que_eight_bank_mode;
      que_eight_bank_mode3 = que_eight_bank_mode;
    end
    else
    begin
      $display("que_data_del_cnt=%b\n",que_data_del_cnt);
      que_eight_bank_mode0 = que_eight_bank_mode;
      que_eight_bank_mode1 = que_eight_bank_mode;
      que_eight_bank_mode2 = que_eight_bank_mode;
      que_eight_bank_mode3 = que_eight_bank_mode;
    end
    if ( $value$plusargs("ras_addr_width=%h",ras_addr_width)) 
    begin
      $display("ras_addr_width=%b\n",ras_addr_width);
    end
    if ( $value$plusargs("stacked_dimm=%h",stacked_dimm)) 
    begin
      $display("stacked_dimm=%b\n",stacked_dimm);
      stacked_dimm0        = stacked_dimm;
      stacked_dimm1        = stacked_dimm;
      stacked_dimm2        = stacked_dimm;
      stacked_dimm3        = stacked_dimm;
    end
    if ( $value$plusargs("que_eight_bank_mode=%h",que_eight_bank_mode)) 
    begin
      $display("que_eight_bank_mode=%b\n",que_eight_bank_mode);
    end
    if ( $value$plusargs("que_rank1_present=%h",que_rank1_present)) 
    begin
      $display("que_rank1_present=%b\n",que_rank1_present);
      que_rank1_present0   = que_rank1_present;
      que_rank1_present1   = que_rank1_present;
      que_rank1_present2   = que_rank1_present;
      que_rank1_present3   = que_rank1_present;
    end

end

`else
wire [2:0] que_data_del_cnt0    = cmp.dram02.dramctl0.dram_dctl.dram_que.que_data_del_cnt;
wire [2:0] que_data_del_cnt1    = cmp.dram13.dramctl0.dram_dctl.dram_que.que_data_del_cnt;
wire [2:0] que_data_del_cnt2    = cmp.dram02.dramctl1.dram_dctl.dram_que.que_data_del_cnt;
wire [2:0] que_data_del_cnt3    = cmp.dram13.dramctl1.dram_dctl.dram_que.que_data_del_cnt;
wire       que_eight_bank_mode0 = cmp.dram02.dramctl0.dram_dctl.dram_que.que_eight_bank_mode;
wire       que_eight_bank_mode1 = cmp.dram13.dramctl0.dram_dctl.dram_que.que_eight_bank_mode;
wire       que_eight_bank_mode2 = cmp.dram02.dramctl1.dram_dctl.dram_que.que_eight_bank_mode;
wire       que_eight_bank_mode3 = cmp.dram13.dramctl1.dram_dctl.dram_que.que_eight_bank_mode;
wire [3:0] ras_addr_width0      = cmp.dram02.dramctl0.dram_dctl.dram_que.chip_config_reg[8:5];
wire [3:0] ras_addr_width1      = cmp.dram13.dramctl0.dram_dctl.dram_que.chip_config_reg[8:5];
wire [3:0] ras_addr_width2      = cmp.dram02.dramctl1.dram_dctl.dram_que.chip_config_reg[8:5];
wire [3:0] ras_addr_width3      = cmp.dram13.dramctl1.dram_dctl.dram_que.chip_config_reg[8:5];
wire       stacked_dimm0        = cmp.dram02.dramctl0.dram_dctl.dram_que.chip_config_reg[0];
wire       stacked_dimm1        = cmp.dram13.dramctl0.dram_dctl.dram_que.chip_config_reg[0];
wire       stacked_dimm2        = cmp.dram02.dramctl1.dram_dctl.dram_que.chip_config_reg[0];
wire       stacked_dimm3        = cmp.dram13.dramctl1.dram_dctl.dram_que.chip_config_reg[0];
wire       que_rank1_present0   = cmp.dram02.dramctl0.dram_dctl.dram_que.que_rank1_present;
wire       que_rank1_present1   = cmp.dram13.dramctl0.dram_dctl.dram_que.que_rank1_present;
wire       que_rank1_present2   = cmp.dram02.dramctl1.dram_dctl.dram_que.que_rank1_present;
wire       que_rank1_present3   = cmp.dram13.dramctl1.dram_dctl.dram_que.que_rank1_present;
`endif
wire dram_dump     = ((CTL_RAM[29] <= CLK_CNT[39:8]) & (|CTL_RAM[29])); // DRAM write and read data
//}}}  
//{{{  dram
/**************************************************************************************************************
*    DRAM clock domain registers
**************************************************************************************************************/
reg [ 6: 0]  DRAM0_WRITV_P ; // WRITE SEQUENCE FROM CAS
reg [ 6: 0]  DRAM0_READV_P ; // READ SEQUENCE FROM CAS
reg [ 5: 0]  DRAM0_CQWF_P  ; // POSITIVE CLOCK DOMAIN CRITICAL QUADWORD FIRST ADDRESS BIT STAGED
reg [ 6: 0]  DRAM0_PARITY_P; // POSITIVE CLOCK DOMAIN ADDRESS PARITY
reg [36: 4]  DRAM0_ADR_HOLD; // PA FROM CAS CYCLE
reg [33: 8]  DRAM0_ADR0_P  ; // POSITIVE CLOCK DOMAIN STAGED ADDRESS (0-5 clocks from CAS)
reg [33: 8]  DRAM0_ADR1_P  ;
reg [33: 8]  DRAM0_ADR2_P  ;
reg [33: 8]  DRAM0_ADR3_P  ;
reg [33: 8]  DRAM0_ADR4_P  ;
reg [33: 8]  DRAM0_ADR5_P  ;
reg [127:0]  DRAM0_DATA_02_6; // STAGED DRAM DATA 02
reg [ 15:0]  DRAM0_ECC_02_6;  // STAGED DRAM ECC 02
reg          DRAM0_READV5_N;  // NEGATIVE CLOCK DOMAIN READ VALID SEQUENCE
reg          DRAM0_CQWF5_N ;  // NEGATIVE CLOCK DOMAIN CRITICAL QUADWORD FIRST ADDRESS BIT STAGED
reg          DRAM0_PARITY5_N; // NEGATIVE CLOCK DOMAIN ADDRESS PARITY
reg          DRAM0_PARITY6_N; // NEGATIVE CLOCK DOMAIN ADDRESS PARITY
reg [33: 8]  DRAM0_ADR5_N  ;  // NEGATIVE CLOCK DOMAIN STAGED ADDRESS (5 clocks from CAS)
reg [127:0]  DRAM0_DATA_13_6; // STAGED DRAM DATA 13
reg [ 15:0]  DRAM0_ECC_13_6; // STAGED DRAM ECC 13

reg [ 6: 0]  DRAM1_WRITV_P ; // WRITE SEQUENCE FROM CAS
reg [ 6: 0]  DRAM1_READV_P ; // READ SEQUENCE FROM CAS
reg [ 5: 0]  DRAM1_CQWF_P  ; // POSITIVE CLOCK DOMAIN CRITICAL QUADWORD FIRST ADDRESS BIT STAGED
reg [ 6: 0]  DRAM1_PARITY_P; // POSITIVE CLOCK DOMAIN ADDRESS PARITY
reg [36: 4]  DRAM1_ADR_HOLD; // PA FROM CAS CYCLE
reg [33: 8]  DRAM1_ADR0_P  ; // POSITIVE CLOCK DOMAIN STAGED ADDRESS (0-5 clocks from CAS)
reg [33: 8]  DRAM1_ADR1_P  ;
reg [33: 8]  DRAM1_ADR2_P  ;
reg [33: 8]  DRAM1_ADR3_P  ;
reg [33: 8]  DRAM1_ADR4_P  ;
reg [33: 8]  DRAM1_ADR5_P  ;
reg [127:0]  DRAM1_DATA_02_6; // STAGED DRAM DATA 02
reg          DRAM1_READV5_N;  // NEGATIVE CLOCK DOMAIN READ VALID SEQUENCE
reg          DRAM1_CQWF5_N ;  // NEGATIVE CLOCK DOMAIN CRITICAL QUADWORD FIRST ADDRESS BIT STAGED
reg          DRAM1_PARITY5_N; // NEGATIVE CLOCK DOMAIN ADDRESS PARITY
reg          DRAM1_PARITY6_N; // NEGATIVE CLOCK DOMAIN ADDRESS PARITY
reg [33: 8]  DRAM1_ADR5_N  ;  // NEGATIVE CLOCK DOMAIN STAGED ADDRESS (5 clocks from CAS)
reg [127:0]  DRAM1_DATA_13_6; // STAGED DRAM DATA 13
reg [ 15:0]  DRAM1_ECC_02_6;  // STAGED DRAM ECC 02
reg [ 15:0]  DRAM1_ECC_13_6; // STAGED DRAM ECC 13

reg [ 6: 0]  DRAM2_WRITV_P ; // WRITE SEQUENCE FROM CAS
reg [ 6: 0]  DRAM2_READV_P ; // READ SEQUENCE FROM CAS
reg [ 5: 0]  DRAM2_CQWF_P  ; // POSITIVE CLOCK DOMAIN CRITICAL QUADWORD FIRST ADDRESS BIT STAGED
reg [ 6: 0]  DRAM2_PARITY_P; // POSITIVE CLOCK DOMAIN ADDRESS PARITY
reg [36: 4]  DRAM2_ADR_HOLD; // PA FROM CAS CYCLE
reg [33: 8]  DRAM2_ADR0_P  ; // POSITIVE CLOCK DOMAIN STAGED ADDRESS (0-5 clocks from CAS)
reg [33: 8]  DRAM2_ADR1_P  ;
reg [33: 8]  DRAM2_ADR2_P  ;
reg [33: 8]  DRAM2_ADR3_P  ;
reg [33: 8]  DRAM2_ADR4_P  ;
reg [33: 8]  DRAM2_ADR5_P  ;
reg [127:0]  DRAM2_DATA_02_6; // STAGED DRAM DATA 02
reg          DRAM2_READV5_N;  // NEGATIVE CLOCK DOMAIN READ VALID SEQUENCE
reg          DRAM2_CQWF5_N ;  // NEGATIVE CLOCK DOMAIN CRITICAL QUADWORD FIRST ADDRESS BIT STAGED
reg          DRAM2_PARITY5_N; // NEGATIVE CLOCK DOMAIN ADDRESS PARITY
reg          DRAM2_PARITY6_N; // NEGATIVE CLOCK DOMAIN ADDRESS PARITY
reg [33: 8]  DRAM2_ADR5_N  ;  // NEGATIVE CLOCK DOMAIN STAGED ADDRESS (5 clocks from CAS)
reg [127:0]  DRAM2_DATA_13_6; // STAGED DRAM DATA 13
reg [ 15:0]  DRAM2_ECC_02_6;  // STAGED DRAM ECC 02
reg [ 15:0]  DRAM2_ECC_13_6; // STAGED DRAM ECC 13

reg [ 6: 0]  DRAM3_WRITV_P ; // WRITE SEQUENCE FROM CAS
reg [ 6: 0]  DRAM3_READV_P ; // READ SEQUENCE FROM CAS
reg [ 5: 0]  DRAM3_CQWF_P  ; // POSITIVE CLOCK DOMAIN CRITICAL QUADWORD FIRST ADDRESS BIT STAGED
reg [ 6: 0]  DRAM3_PARITY_P; // POSITIVE CLOCK DOMAIN ADDRESS PARITY
reg [36: 4]  DRAM3_ADR_HOLD; // PA FROM CAS CYCLE
reg [33: 8]  DRAM3_ADR0_P  ; // POSITIVE CLOCK DOMAIN STAGED ADDRESS (0-5 clocks from CAS)
reg [33: 8]  DRAM3_ADR1_P  ;
reg [33: 8]  DRAM3_ADR2_P  ;
reg [33: 8]  DRAM3_ADR3_P  ;
reg [33: 8]  DRAM3_ADR4_P  ;
reg [33: 8]  DRAM3_ADR5_P  ;
reg [127:0]  DRAM3_DATA_02_6; // STAGED DRAM DATA 02
reg          DRAM3_READV5_N;  // NEGATIVE CLOCK DOMAIN READ VALID SEQUENCE
reg          DRAM3_CQWF5_N ;  // NEGATIVE CLOCK DOMAIN CRITICAL QUADWORD FIRST ADDRESS BIT STAGED
reg          DRAM3_PARITY5_N; // NEGATIVE CLOCK DOMAIN ADDRESS PARITY
reg          DRAM3_PARITY6_N; // NEGATIVE CLOCK DOMAIN ADDRESS PARITY
reg [33: 8]  DRAM3_ADR5_N  ;  // NEGATIVE CLOCK DOMAIN STAGED ADDRESS (5 clocks from CAS)
reg [127:0]  DRAM3_DATA_13_6; // STAGED DRAM DATA 13
reg [ 15:0]  DRAM3_ECC_02_6;  // STAGED DRAM ECC 02
reg [ 15:0]  DRAM3_ECC_13_6; // STAGED DRAM ECC 13
reg          IO_DRAM0_DATA_VALID_NXT;
reg          IO_DRAM1_DATA_VALID_NXT;
reg          IO_DRAM2_DATA_VALID_NXT;
reg          IO_DRAM3_DATA_VALID_NXT;

/**************************************************************************************************************
*    DIRECTORY RAM definitions
**************************************************************************************************************/
wire [127:0]  dram0_data_read0, dram0_data_read1, dram0_data_read2, dram0_data_read3;
wire [127:0]  dram1_data_read0, dram1_data_read1, dram1_data_read2, dram1_data_read3;
wire [127:0]  dram2_data_read0, dram2_data_read1, dram2_data_read2, dram2_data_read3;
wire [127:0]  dram3_data_read0, dram3_data_read1, dram3_data_read2, dram3_data_read3;
wire [ 15:0]  dram0_ecc_read0, dram0_ecc_read1, dram0_ecc_read2, dram0_ecc_read3;
wire [ 15:0]  dram1_ecc_read0, dram1_ecc_read1, dram1_ecc_read2, dram1_ecc_read3;
wire [ 15:0]  dram2_ecc_read0, dram2_ecc_read1, dram2_ecc_read2, dram2_ecc_read3;
wire [ 15:0]  dram3_ecc_read0, dram3_ecc_read1, dram3_ecc_read2, dram3_ecc_read3;

dram_data dram0 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM0_ADR5_P),
                             .dout0  (iob_do0[127:0]), .dout1  (dram0_data_read0), .eout1(dram0_ecc_read0),
                             .wr_adr0(DRAM0_ADR5_P), .we_0(DRAM0_WRITV_P[5]),
                             .din_0(dram0_io_data_out[143:  0]), .dram_dump(dram_dump));
dram_data dram1 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM0_ADR5_N),
                             .dout0  (iob_do1[127:0]), .dout1  (dram0_data_read1), .eout1(dram0_ecc_read1),
                             .wr_adr0(DRAM0_ADR5_P), .we_0(DRAM0_WRITV_P[5]),
                             .din_0(dram0_io_data_out[287:144]), .dram_dump(dram_dump));
dram_data dram2 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM0_ADR5_P),
                             .dout0  (iob_do2[127:0]), .dout1  (dram0_data_read2), .eout1(dram0_ecc_read2),
                             .wr_adr0(DRAM0_ADR5_P), .we_0(DRAM0_WRITV_P[6]),
                             .din_0(dram0_io_data_out[143:  0]), .dram_dump(dram_dump));
dram_data dram3 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM0_ADR5_N),
                             .dout0  (iob_do3[127:0]), .dout1  (dram0_data_read3), .eout1(dram0_ecc_read3),
                             .wr_adr0(DRAM0_ADR5_P), .we_0(DRAM0_WRITV_P[6]),
                             .din_0(dram0_io_data_out[287:144]), .dram_dump(dram_dump));

dram_data dram4 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM1_ADR5_P),
                             .dout0  (iob_do4[127:0]), .dout1  (dram1_data_read0), .eout1(dram1_ecc_read0),
                             .wr_adr0(DRAM1_ADR5_P), .we_0(DRAM1_WRITV_P[5]),
                             .din_0(dram1_io_data_out[143:  0]), .dram_dump(dram_dump));
dram_data dram5 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM1_ADR5_N),
                             .dout0  (iob_do5[127:0]), .dout1  (dram1_data_read1), .eout1(dram1_ecc_read1),
                             .wr_adr0(DRAM1_ADR5_P), .we_0(DRAM1_WRITV_P[5]),
                             .din_0(dram1_io_data_out[287:144]), .dram_dump(dram_dump));
dram_data dram6 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM1_ADR5_P),
                             .dout0  (iob_do6[127:0]), .dout1  (dram1_data_read2),  .eout1(dram1_ecc_read2),
                             .wr_adr0(DRAM1_ADR5_P), .we_0(DRAM1_WRITV_P[6]),
                             .din_0(dram1_io_data_out[143:  0]), .dram_dump(dram_dump));
dram_data dram7 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM1_ADR5_N),
                             .dout0  (iob_do7[127:0]), .dout1  (dram1_data_read3), .eout1(dram1_ecc_read3),
                             .wr_adr0(DRAM1_ADR5_P), .we_0(DRAM1_WRITV_P[6]),
                             .din_0(dram1_io_data_out[287:144]), .dram_dump(dram_dump));

dram_data dram8 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM2_ADR5_P),
                             .dout0  (iob_do8[127:0]), .dout1  (dram2_data_read0), .eout1(dram2_ecc_read0),
                             .wr_adr0(DRAM2_ADR5_P), .we_0(DRAM2_WRITV_P[5]),
                             .din_0(dram2_io_data_out[143:  0]), .dram_dump(dram_dump));
dram_data dram9 (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM2_ADR5_N),
                             .dout0  (iob_do9[127:0]), .dout1  (dram2_data_read1),  .eout1(dram2_ecc_read1),
                             .wr_adr0(DRAM2_ADR5_P), .we_0(DRAM2_WRITV_P[5]),
                             .din_0(dram2_io_data_out[287:144]), .dram_dump(dram_dump));
dram_data drama (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM2_ADR5_P),
                             .dout0  (iob_doa[127:0]), .dout1  (dram2_data_read2),  .eout1(dram2_ecc_read2),
                             .wr_adr0(DRAM2_ADR5_P), .we_0(DRAM2_WRITV_P[6]),
                             .din_0(dram2_io_data_out[143:  0]), .dram_dump(dram_dump));
dram_data dramb (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM2_ADR5_N),
                             .dout0  (iob_dob[127:0]), .dout1  (dram2_data_read3), .eout1(dram2_ecc_read3),
                             .wr_adr0(DRAM2_ADR5_P), .we_0(DRAM2_WRITV_P[6]),
                             .din_0(dram2_io_data_out[287:144]), .dram_dump(dram_dump));

dram_data dramc (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM3_ADR5_P),
                             .dout0  (iob_doc[127:0]), .dout1  (dram3_data_read0), .eout1(dram3_ecc_read0),
                             .wr_adr0(DRAM3_ADR5_P), .we_0(DRAM3_WRITV_P[5]),
                             .din_0(dram3_io_data_out[143:  0]), .dram_dump(dram_dump));
dram_data dramd (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM3_ADR5_N),
                             .dout0  (iob_dod[127:0]), .dout1  (dram3_data_read1), .eout1(dram3_ecc_read1),
                             .wr_adr0(DRAM3_ADR5_P), .we_0(DRAM3_WRITV_P[5]),
                             .din_0(dram3_io_data_out[287:144]), .dram_dump(dram_dump));
dram_data drame (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM3_ADR5_P),
                             .dout0  (iob_doe[127:0]), .dout1  (dram3_data_read2), .eout1(dram3_ecc_read2),
                             .wr_adr0(DRAM3_ADR5_P), .we_0(DRAM3_WRITV_P[6]),
                             .din_0(dram3_io_data_out[143:  0]), .dram_dump(dram_dump));
dram_data dramf (.clk(dramclk), .rd_adr0(IOB_ADR1[32:8]), .rd_adr1(DRAM3_ADR5_N),
                             .dout0  (iob_dof[127:0]), .dout1  (dram3_data_read3), .eout1(dram3_ecc_read3),
                             .wr_adr0(DRAM3_ADR5_P), .we_0(DRAM3_WRITV_P[6]),
                             .din_0(dram3_io_data_out[287:144]), .dram_dump(dram_dump));


reg    [34:20] RAS         [127:0];

/**************************************************************************************************************
*    This logic cobbles together the physical address from the ras/cas and dram control signals.
*  The code below is from Sunil V @ /home/svemul/addr.enc
*
if(8bank_mode){
        if(ras_addr_width == 14){
                if(rank & stack) {
                        assign dram2_adr_cas[35:34] = {((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hb)),
                               ((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hd))};
                }else if(rank | stack) {
                        assign dram2_adr_cas[34] = {(dram2_io_cs_l == 4'hb) | (dram2_io_cs_l == 4'hd)};
                }
                assign dram2_adr_cas[33:20] = RAS[dram2_io_addr[13:0]];
        }
        if(ras_addr_width == 15){
                if(rank & stack) {
                        assign dram2_adr_cas[36:35] = {((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hb)),
                               ((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hd))};
                }else if(rank | stack){
                        assign dram2_adr_cas[35] = {(dram2_io_cs_l == 4'hb) | (dram2_io_cs_l == 4'hd)};
                }
                assign dram2_adr_cas[34:20] = RAS[dram2_io_addr[14:0]];
        }
else{
        if(ras_addr_width == 13){
                if(rank & stack){
                        assign dram2_adr_cas[33:32] = {((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hb)),
                               ((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hd))};
                }else if(rank | stack) {
                        assign dram2_adr_cas[32] = {(dram2_io_cs_l == 4'hb) | (dram2_io_cs_l == 4'hd)};

                }
                assign dram2_adr_cas[31:19] = RAS[dram2_io_addr[12:0]];
        }
        if(ras_addr_width == 14){
                if(rank & stack){
                        assign dram2_adr_cas[34:33] = {((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hb)),
                               ((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hd))};
                }else if(rank | stack) {
                        assign dram2_adr_cas[33] = {(dram2_io_cs_l == 4'hb) | (dram2_io_cs_l == 4'hd)};
                }
                assign dram2_adr_cas[32:19] = RAS[dram2_io_addr[13:0]];
        }
}

if(8bank_mode){
        assign dram2_adr_cas[   19] = dram2_io_addr[11];
        assign dram2_adr_cas[18:11] = dram2_io_addr[9:2];
        assign dram2_adr_cas[10: 8] = dram2_io_bank[2:0] ^ dram2_adr_cas[20:18] ^ dram2_adr_cas[30:28];
}else{
        assign dram2_adr_cas[   18] = dram2_io_addr[11];
        assign dram2_adr_cas[17:10] = dram2_io_addr[9:2];
        assign dram2_adr_cas[9: 8] = dram2_io_bank[1:0] ^ dram2_adr_cas[19:18] ^ dram2_adr_cas[29:28];
}

assign dram2_adr_cas[ 7: 6] = 2'b10;
assign dram2_adr_cas[ 5: 4] = dram2_io_addr[1:0]
******************************** ******************************************************************************/
`ifdef N1_addr_decode
//{{{  addr decode stuff n1 setup
wire [36:4] dram0_adr_cas;
wire [36:4] dram1_adr_cas;
wire [36:4] dram2_adr_cas;
wire [36:4] dram3_adr_cas;

// BANK0
wire rank_and_stack0 = stacked_dimm0 & que_rank1_present0;
wire rank_xor_stack0 = stacked_dimm0 ^ que_rank1_present0;

wire [2:0] dram0_cs_adr = {((dram0_io_cs_l == 4'hb) | (dram0_io_cs_l == 4'hd)),
                           ((dram0_io_cs_l == 4'h7) | (dram0_io_cs_l == 4'hb)),
                           ((dram0_io_cs_l == 4'h7) | (dram0_io_cs_l == 4'hd))};

assign dram0_adr_cas[36] = que_eight_bank_mode0 & 
                         ((ras_addr_width0 == 15) & rank_and_stack0 & dram0_cs_adr[1]);
assign dram0_adr_cas[35] = que_eight_bank_mode0 & 
                        (((ras_addr_width0 == 14) & rank_and_stack0 & dram0_cs_adr[1]) |
                         ((ras_addr_width0 == 15) & rank_and_stack0 & dram0_cs_adr[0]) |
                         ((ras_addr_width0 == 15) & rank_xor_stack0 & dram0_cs_adr[2])); 

wire [ 6:0] dram0_ras_adr = que_eight_bank_mode0 ? {2'b00, dram0_adr_cas[36:35], dram0_io_bank[2:0]} :
                                                   {2'b00,          2'b00, 1'b0, dram0_io_bank[1:0]};
wire [14:0] dram0_ras_data = RAS[dram0_ras_adr];

assign dram0_adr_cas[34   ] =    que_eight_bank_mode0 ?  
                        (((ras_addr_width0 == 14) & rank_and_stack0 & dram0_cs_adr[0]) |
                         ((ras_addr_width0 == 14) & rank_xor_stack0 & dram0_cs_adr[2]) |
                         ((ras_addr_width0 == 15) &                   dram0_ras_data[14])) :
                         ((ras_addr_width0 == 14) & rank_and_stack0 & dram0_cs_adr[1]); 
assign dram0_adr_cas[33   ] =    que_eight_bank_mode0 ? dram0_ras_data[13] : 
                        (((ras_addr_width0 == 13) & rank_and_stack0 & dram0_cs_adr[1]) |                   
                         ((ras_addr_width0 == 14) & rank_and_stack0 & dram0_cs_adr[0]) |
                         ((ras_addr_width0 == 14) & rank_xor_stack0 & dram0_cs_adr[2])); 
assign dram0_adr_cas[32   ] =    que_eight_bank_mode0 ? dram0_ras_data[12] : 
                        (((ras_addr_width0 == 13) & rank_and_stack0 & dram0_cs_adr[0]) |                   
                         ((ras_addr_width0 == 13) & rank_xor_stack0 & dram0_cs_adr[2]) |                   
                         ((ras_addr_width0 == 14) &                   dram0_ras_data[13]));                   
assign dram0_adr_cas[31:20] = que_eight_bank_mode0 ? dram0_ras_data[11:0] : dram0_ras_data[12:1]; 
assign dram0_adr_cas[   19] = que_eight_bank_mode0 ? dram0_io_addr[11]    : dram0_ras_data[0];
assign dram0_adr_cas[   18] = que_eight_bank_mode0 ? dram0_io_addr[9]     : dram0_io_addr[11];
assign dram0_adr_cas[17:11] = que_eight_bank_mode0 ? dram0_io_addr[8:2]   : dram0_io_addr[9:3];
assign dram0_adr_cas[10   ] = que_eight_bank_mode0 ? (dram0_io_bank[2] ^ dram0_adr_cas[20] ^ dram0_adr_cas[30]) :
                                                     dram0_io_addr[2]; 
assign dram0_adr_cas[ 9: 8] = (dram0_io_bank[1:0] ^ dram0_adr_cas[19:18] ^ dram0_adr_cas[29:28]);
assign dram0_adr_cas[ 7: 6] = 2'b00;
assign dram0_adr_cas[ 5: 4] = dram0_io_addr[1:0];

// BANK1
wire rank_and_stack1 = stacked_dimm1 & que_rank1_present1;
wire rank_xor_stack1 = stacked_dimm1 ^ que_rank1_present1;

wire [2:0] dram1_cs_adr = {((dram1_io_cs_l == 4'hb) | (dram1_io_cs_l == 4'hd)),
                           ((dram1_io_cs_l == 4'h7) | (dram1_io_cs_l == 4'hb)),
                           ((dram1_io_cs_l == 4'h7) | (dram1_io_cs_l == 4'hd))};

assign dram1_adr_cas[36] = que_eight_bank_mode1 & 
                         ((ras_addr_width1 == 15) & rank_and_stack1 & dram1_cs_adr[1]);
assign dram1_adr_cas[35] = que_eight_bank_mode1 &
                        (((ras_addr_width1 == 14) & rank_and_stack1 & dram1_cs_adr[1]) |
                         ((ras_addr_width1 == 15) & rank_and_stack1 & dram1_cs_adr[0]) |
                         ((ras_addr_width1 == 15) & rank_xor_stack1 & dram1_cs_adr[2]));

wire [ 6:0] dram1_ras_adr = que_eight_bank_mode1 ? {2'b01, dram1_adr_cas[36:35], dram1_io_bank[2:0]} :
                                                   {2'b01,          2'b00, 1'b0, dram1_io_bank[1:0]};
wire [14:0] dram1_ras_data = RAS[dram1_ras_adr];

assign dram1_adr_cas[34   ] =    que_eight_bank_mode1 ?
                        (((ras_addr_width1 == 14) & rank_and_stack1 & dram1_cs_adr[0]) |
                         ((ras_addr_width1 == 14) & rank_xor_stack1 & dram1_cs_adr[2]) |
                         ((ras_addr_width1 == 15) &                   dram1_ras_data[14])) :
                         ((ras_addr_width1 == 14) & rank_and_stack1 & dram1_cs_adr[1]);
assign dram1_adr_cas[33   ] =    que_eight_bank_mode1 ? dram1_ras_data[13] :
                        (((ras_addr_width1 == 13) & rank_and_stack1 & dram1_cs_adr[1]) |
                         ((ras_addr_width1 == 14) & rank_and_stack1 & dram1_cs_adr[0]) |
                         ((ras_addr_width1 == 14) & rank_xor_stack1 & dram1_cs_adr[2]));
assign dram1_adr_cas[32   ] =    que_eight_bank_mode1 ? dram1_ras_data[12] :
                        (((ras_addr_width1 == 13) & rank_and_stack1 & dram1_cs_adr[0]) |
                         ((ras_addr_width1 == 13) & rank_xor_stack1 & dram1_cs_adr[2]) |
                         ((ras_addr_width1 == 14) &                   dram1_ras_data[13]));
assign dram1_adr_cas[31:20] = que_eight_bank_mode1 ? dram1_ras_data[11:0] : dram1_ras_data[12:1]; 
assign dram1_adr_cas[   19] = que_eight_bank_mode1 ? dram1_io_addr[11] : dram1_ras_data[0];
assign dram1_adr_cas[   18] = que_eight_bank_mode1 ? dram1_io_addr[ 9] : dram1_io_addr[11];
assign dram1_adr_cas[17:11] = que_eight_bank_mode1 ?  dram1_io_addr[8:2] : dram1_io_addr[9:3];
assign dram1_adr_cas[10   ] = que_eight_bank_mode1 ? (dram1_io_bank[2] ^ dram1_adr_cas[20] ^ dram1_adr_cas[30]) :
                                                      dram1_io_addr[2];
assign dram1_adr_cas[ 9: 8] = (dram1_io_bank[1:0] ^ dram1_adr_cas[19:18] ^ dram1_adr_cas[29:28]);
assign dram1_adr_cas[ 7: 6] = 2'b01;
assign dram1_adr_cas[ 5: 4] = dram1_io_addr[1:0];

// BANK2
wire rank_and_stack2 = stacked_dimm2 & que_rank1_present2;
wire rank_xor_stack2 = stacked_dimm2 ^ que_rank1_present2;

wire [2:0] dram2_cs_adr = {((dram2_io_cs_l == 4'hb) | (dram2_io_cs_l == 4'hd)),
                           ((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hb)),
                           ((dram2_io_cs_l == 4'h7) | (dram2_io_cs_l == 4'hd))};

assign dram2_adr_cas[36] = que_eight_bank_mode2 & 
                         ((ras_addr_width2 == 15) & rank_and_stack2 & dram2_cs_adr[1]);
assign dram2_adr_cas[35] = que_eight_bank_mode2 &
                        (((ras_addr_width2 == 14) & rank_and_stack2 & dram2_cs_adr[1]) |
                         ((ras_addr_width2 == 15) & rank_and_stack2 & dram2_cs_adr[0]) |
                         ((ras_addr_width2 == 15) & rank_xor_stack2 & dram2_cs_adr[2]));

wire [ 6:0] dram2_ras_adr = que_eight_bank_mode2 ? {2'b10, dram2_adr_cas[36:35], dram2_io_bank[2:0]} :
                                                   {2'b10,          2'b00, 1'b0, dram2_io_bank[1:0]};
wire [14:0] dram2_ras_data = RAS[dram2_ras_adr];

assign dram2_adr_cas[34   ] =    que_eight_bank_mode2 ?
                        (((ras_addr_width2 == 14) & rank_and_stack2 & dram2_cs_adr[0]) |
                         ((ras_addr_width2 == 14) & rank_xor_stack2 & dram2_cs_adr[2]) |
                         ((ras_addr_width2 == 15) &                   dram2_ras_data[14])) :
                         ((ras_addr_width2 == 14) & rank_and_stack2 & dram2_cs_adr[1]);
assign dram2_adr_cas[33   ] =    que_eight_bank_mode2 ? dram2_ras_data[13] :
                        (((ras_addr_width2 == 13) & rank_and_stack2 & dram2_cs_adr[1]) |
                         ((ras_addr_width2 == 14) & rank_and_stack2 & dram2_cs_adr[0]) |
                         ((ras_addr_width2 == 14) & rank_xor_stack2 & dram2_cs_adr[2]));
assign dram2_adr_cas[32   ] =    que_eight_bank_mode2 ? dram2_ras_data[12] :
                        (((ras_addr_width2 == 13) & rank_and_stack2 & dram2_cs_adr[0]) |
                         ((ras_addr_width2 == 13) & rank_xor_stack2 & dram2_cs_adr[2]) |
                         ((ras_addr_width2 == 14) &                   dram2_ras_data[13]));
assign dram2_adr_cas[31:20] = que_eight_bank_mode2 ? dram2_ras_data[11:0] : dram2_ras_data[12:1]; 
assign dram2_adr_cas[   19] = que_eight_bank_mode2 ? dram2_io_addr[11] : dram2_ras_data[0];
assign dram2_adr_cas[   18] = que_eight_bank_mode2 ? dram2_io_addr[ 9] : dram2_io_addr[11];
assign dram2_adr_cas[17:11] = que_eight_bank_mode2 ?  dram2_io_addr[8:2] : dram2_io_addr[9:3];
assign dram2_adr_cas[10   ] = que_eight_bank_mode2 ? (dram2_io_bank[2] ^ dram2_adr_cas[20] ^ dram2_adr_cas[30]) :
                                                     dram2_io_addr[2];
assign dram2_adr_cas[ 9: 8] = (dram2_io_bank[1:0] ^ dram2_adr_cas[19:18] ^ dram2_adr_cas[29:28]);
assign dram2_adr_cas[ 7: 6] = 2'b10;
assign dram2_adr_cas[ 5: 4] = dram2_io_addr[1:0];

// BANK3
wire rank_and_stack3 = stacked_dimm3 & que_rank1_present3;
wire rank_xor_stack3 = stacked_dimm3 ^ que_rank1_present3;

wire [2:0] dram3_cs_adr = {((dram3_io_cs_l == 4'hb) | (dram3_io_cs_l == 4'hd)),
                           ((dram3_io_cs_l == 4'h7) | (dram3_io_cs_l == 4'hb)),
                           ((dram3_io_cs_l == 4'h7) | (dram3_io_cs_l == 4'hd))};

assign dram3_adr_cas[36] = que_eight_bank_mode3 & 
                         ((ras_addr_width3 == 15) & rank_and_stack3 & dram3_cs_adr[1]);
assign dram3_adr_cas[35] = que_eight_bank_mode3 &
                        (((ras_addr_width3 == 14) & rank_and_stack3 & dram3_cs_adr[1]) |
                         ((ras_addr_width3 == 15) & rank_and_stack3 & dram3_cs_adr[0]) |
                         ((ras_addr_width3 == 15) & rank_xor_stack3 & dram3_cs_adr[2]));

wire [ 6:0] dram3_ras_adr = que_eight_bank_mode3 ? {2'b11, dram3_adr_cas[36:35], dram3_io_bank[2:0]} :
                                                   {2'b11,          2'b00, 1'b0, dram3_io_bank[1:0]};
wire [14:0] dram3_ras_data = RAS[dram3_ras_adr];

assign dram3_adr_cas[34   ] =    que_eight_bank_mode3 ?
                        (((ras_addr_width3 == 14) & rank_and_stack3 & dram3_cs_adr[0]) |
                         ((ras_addr_width3 == 14) & rank_xor_stack3 & dram3_cs_adr[2]) |
                         ((ras_addr_width3 == 15) &                   dram3_ras_data[14])) :
                         ((ras_addr_width3 == 14) & rank_and_stack3 & dram3_cs_adr[1]);
assign dram3_adr_cas[33   ] =    que_eight_bank_mode3 ? dram3_ras_data[13] :
                        (((ras_addr_width3 == 13) & rank_and_stack3 & dram3_cs_adr[1]) |
                         ((ras_addr_width3 == 14) & rank_and_stack3 & dram3_cs_adr[0]) |
                         ((ras_addr_width3 == 14) & rank_xor_stack3 & dram3_cs_adr[2]));
assign dram3_adr_cas[32   ] =    que_eight_bank_mode3 ? dram3_ras_data[12] :
                        (((ras_addr_width3 == 13) & rank_and_stack3 & dram3_cs_adr[0]) |
                         ((ras_addr_width3 == 13) & rank_xor_stack3 & dram3_cs_adr[2]) |
                         ((ras_addr_width3 == 14) &                   dram3_ras_data[13]));
assign dram3_adr_cas[31:20] = que_eight_bank_mode3 ? dram3_ras_data[11:0] : dram3_ras_data[12:1]; 
assign dram3_adr_cas[   19] = que_eight_bank_mode3 ? dram3_io_addr[11] : dram3_ras_data[0];
assign dram3_adr_cas[   18] = que_eight_bank_mode3 ? dram3_io_addr[ 9] : dram3_io_addr[11];
assign dram3_adr_cas[17:11] = que_eight_bank_mode3 ?  dram3_io_addr[8:2] : dram3_io_addr[9:3];
assign dram3_adr_cas[10   ] = que_eight_bank_mode3 ? (dram3_io_bank[2] ^ dram3_adr_cas[20] ^ dram3_adr_cas[30]) :
                                                     dram3_io_addr[2];
assign dram3_adr_cas[ 9: 8] = (dram3_io_bank[1:0] ^ dram3_adr_cas[19:18] ^ dram3_adr_cas[29:28]);
assign dram3_adr_cas[ 7: 6] = 2'b11;
assign dram3_adr_cas[ 5: 4] = dram3_io_addr[1:0];
//}}}  
`endif

//{{{  addr decode stuff
//{{{  bank0 addr
wire [36:4] dram0_adr_cas;

wire [ 6:0] dram0_ras_adr = que_eight_bank_mode0 ? {2'b00, dram0_adr_cas[36:35], dram0_io_bank[2:0]} :
                                                   {2'b00,          2'b00, 1'b0, dram0_io_bank[1:0]};
wire [14:0] dram0_ras_data = RAS[dram0_ras_adr];

assign dram0_adr_cas[36:34] = 3'b0;
assign dram0_adr_cas[33] = dram0_io_addr[12];
assign dram0_adr_cas[32:19] = dram0_ras_data[14:0];
assign dram0_adr_cas[18:11] = {dram0_io_addr[11],dram0_io_addr[9:3]};
assign dram0_adr_cas[10:9] = dram0_io_bank[2:1];
assign dram0_adr_cas[8:7] = 2'b00;
assign dram0_adr_cas[6] = dram0_io_bank[0];
assign dram0_adr_cas[5:4] = dram0_io_addr[1:0];


//}}}  
//{{{  bank1 addr
wire [36:4] dram1_adr_cas;

wire [ 6:0] dram1_ras_adr = que_eight_bank_mode1 ? {2'b01, dram1_adr_cas[36:35], dram1_io_bank[2:0]} :
                                                   {2'b01,          2'b00, 1'b0, dram1_io_bank[1:0]};
wire [14:0] dram1_ras_data = RAS[dram1_ras_adr];

assign dram1_adr_cas[36:34] = 3'b0;
assign dram1_adr_cas[33] = dram1_io_addr[12];
assign dram1_adr_cas[32:19] = dram1_ras_data[14:0];
assign dram1_adr_cas[18:11] = {dram1_io_addr[11],dram1_io_addr[9:3]};
assign dram1_adr_cas[10:9] = dram1_io_bank[2:1];
assign dram1_adr_cas[8:7] = 2'b01;
assign dram1_adr_cas[6] = dram1_io_bank[0];
assign dram1_adr_cas[5:4] = dram1_io_addr[1:0];


//}}}  
//{{{  bank2 addr
wire [36:4] dram2_adr_cas;

wire [ 6:0] dram2_ras_adr = que_eight_bank_mode2 ? {2'b10, dram2_adr_cas[36:35], dram2_io_bank[2:0]} :
                                                   {2'b10,          2'b00, 1'b0, dram2_io_bank[1:0]};
wire [14:0] dram2_ras_data = RAS[dram2_ras_adr];

assign dram2_adr_cas[36:34] = 3'b0;
assign dram2_adr_cas[33] = dram2_io_addr[12];
assign dram2_adr_cas[32:19] = dram2_ras_data[14:0];
assign dram2_adr_cas[18:11] = {dram2_io_addr[11],dram2_io_addr[9:3]};
assign dram2_adr_cas[10:9] = dram2_io_bank[2:1];
assign dram2_adr_cas[8:7] = 2'b10;
assign dram2_adr_cas[6] = dram2_io_bank[0];
assign dram2_adr_cas[5:4] = dram2_io_addr[1:0];


//}}}  
//{{{  bank3 addr
wire [36:4] dram3_adr_cas;

wire [ 6:0] dram3_ras_adr = que_eight_bank_mode3 ? {2'b11, dram3_adr_cas[36:35], dram3_io_bank[2:0]} :
                                                   {2'b11,          2'b00, 1'b0, dram3_io_bank[1:0]};
wire [14:0] dram3_ras_data = RAS[dram3_ras_adr];

assign dram3_adr_cas[36:34] = 3'b0;
assign dram3_adr_cas[33] = dram3_io_addr[12];
assign dram3_adr_cas[32:19] = dram3_ras_data[14:0];
assign dram3_adr_cas[18:11] = {dram3_io_addr[11],dram3_io_addr[9:3]};
assign dram3_adr_cas[10:9] = dram3_io_bank[2:1];
assign dram3_adr_cas[8:7] = 2'b11;
assign dram3_adr_cas[6] = dram3_io_bank[0];
assign dram3_adr_cas[5:4] = dram3_io_addr[1:0];


//}}}  
//}}}  

//assign dram3_adr_cas[36:35] = {((dram3_io_cs_l == 4'h7) | (dram3_io_cs_l == 4'hb)), 
//                               ((dram3_io_cs_l == 4'h7) | (dram3_io_cs_l == 4'hd))};
//assign dram3_adr_cas[34:20] = RAS[{2'b11, dram3_adr_cas[36:35], dram3_io_bank[2:0]}];
//assign dram3_adr_cas[   19] = dram3_io_addr[11];
//assign dram3_adr_cas[18:11] = dram3_io_addr[9:2];
//assign dram3_adr_cas[10: 8] = dram3_io_bank[2:0] ^ dram3_adr_cas[20:18] ^ dram3_adr_cas[30:28];
//assign dram3_adr_cas[ 7: 6] = 2'b11;
//assign dram3_adr_cas[ 5: 4] = dram3_io_addr[1:0];

wire dram0_ras_cy = ~dram0_io_ras_l &  dram0_io_cas_l;
wire dram0_cas_cy =  dram0_io_ras_l & ~dram0_io_cas_l;
wire dram0_rd_cas =  dram0_io_ras_l & ~dram0_io_cas_l &  dram0_io_write_en_l;
wire dram0_wr_cas =  dram0_io_ras_l & ~dram0_io_cas_l & ~dram0_io_write_en_l;

wire dram1_ras_cy = ~dram1_io_ras_l &  dram1_io_cas_l;
wire dram1_cas_cy =  dram1_io_ras_l & ~dram1_io_cas_l;
wire dram1_rd_cas =  dram1_io_ras_l & ~dram1_io_cas_l &  dram1_io_write_en_l;
wire dram1_wr_cas =  dram1_io_ras_l & ~dram1_io_cas_l & ~dram1_io_write_en_l;

wire dram2_ras_cy = ~dram2_io_ras_l &  dram2_io_cas_l;
wire dram2_cas_cy =  dram2_io_ras_l & ~dram2_io_cas_l;
wire dram2_rd_cas =  dram2_io_ras_l & ~dram2_io_cas_l &  dram2_io_write_en_l;
wire dram2_wr_cas =  dram2_io_ras_l & ~dram2_io_cas_l & ~dram2_io_write_en_l;

wire dram3_ras_cy = ~dram3_io_ras_l &  dram3_io_cas_l;
wire dram3_cas_cy =  dram3_io_ras_l & ~dram3_io_cas_l;
wire dram3_rd_cas =  dram3_io_ras_l & ~dram3_io_cas_l &  dram3_io_write_en_l;
wire dram3_wr_cas =  dram3_io_ras_l & ~dram3_io_cas_l & ~dram3_io_write_en_l;

wire [36:4] dram0_adr = dram0_cas_cy ? dram0_adr_cas : DRAM0_ADR_HOLD; 
wire [36:4] dram1_adr = dram1_cas_cy ? dram1_adr_cas : DRAM1_ADR_HOLD; 
wire [36:4] dram2_adr = dram2_cas_cy ? dram2_adr_cas : DRAM2_ADR_HOLD; 
wire [36:4] dram3_adr = dram3_cas_cy ? dram3_adr_cas : DRAM3_ADR_HOLD; 

wire dram0_adr_parity = ^({dram0_adr[36:9],dram0_adr[6]});
wire dram1_adr_parity = ^({dram1_adr[36:9],dram1_adr[6]});
wire dram2_adr_parity = ^({dram2_adr[36:9],dram2_adr[6]});
wire dram3_adr_parity = ^({dram3_adr[36:9],dram3_adr[6]});

/**************************************************************************************************************
*    The DRAM is modeled as a multi set associative cache.  Here the way is calculated.  It is assumed
*  that the mem.image initializes all memory used by the program.  Thus no provision need be made here
*  for cache misses and the resulting problems with X's.
**************************************************************************************************************/
wire [ 7:4]  dram0_line  = dram0_adr[7:4];
assign       dram0_index[26:8] = ({dram0_adr[36:9],dram0_adr[6]}/* + dram0_adr[36:15]*/ ) & 19'h7FFFF;
wire [39: 8] dram0_match = {3'b0, dram0_adr[36: 9],dram0_adr[6]}; 
wire [ 7:4]  dram1_line  = dram1_adr[7:4];
assign       dram1_index[26:8] = ({dram1_adr[36:9],dram1_adr[6]}/* + dram1_adr[36:15] */) & 19'h7FFFF;
wire [39: 8] dram1_match = {3'b0, dram1_adr[36: 9],dram1_adr[6]}; 
wire [ 7:4]  dram2_line  = dram2_adr[7:4];
assign       dram2_index[26:8] = ({dram2_adr[36:9],dram2_adr[6]}/*  + dram2_adr[36:15] */) & 19'h7FFFF;
wire [39: 8] dram2_match = {3'b0, dram2_adr[36: 9],dram2_adr[6]}; 
wire [ 7:4]  dram3_line  = dram3_adr[7:4];
assign       dram3_index[26:8] = ({dram3_adr[36:9],dram3_adr[6]}/*  + dram3_adr[36:15] */) & 19'h7FFFF;
wire [39: 8] dram3_match = {3'b0, dram3_adr[36: 9],dram3_adr[6]}; 
wire [ 5:0]  dram0_way = (dram0_dir0_do           == dram0_match) ? 6'b000000 :
                         (dram0_dir1_do           == dram0_match) ? 6'b000001 :
                         (dram0_dir2_do           == dram0_match) ? 6'b000010 :
                         (dram0_dir3_do           == dram0_match) ? 6'b000011 :
                         (dram0_dir4_do           == dram0_match) ? 6'b000100 :
                         (dram0_dir5_do           == dram0_match) ? 6'b000101 :
                         (dram0_dir6_do           == dram0_match) ? 6'b000110 :
                         (dram0_dir7_do           == dram0_match) ? 6'b000111 :
                         (dram0_dir8_do           == dram0_match) ? 6'b001000 :
                         (dram0_dir9_do           == dram0_match) ? 6'b001001 :
                         (dram0_dira_do           == dram0_match) ? 6'b001010 :
                         (dram0_dirb_do           == dram0_match) ? 6'b001011 :
                         (dram0_dirc_do           == dram0_match) ? 6'b001100 :
                         (dram0_dird_do           == dram0_match) ? 6'b001101 :
                         (dram0_dire_do           == dram0_match) ? 6'b001110 :
                         (dram0_dirf_do           == dram0_match) ? 6'b001111 :
                         (dram0_dir10_do          == dram0_match) ? 6'b010000 :
                         (dram0_dir11_do          == dram0_match) ? 6'b010001 :
                         (dram0_dir12_do          == dram0_match) ? 6'b010010 :
                         (dram0_dir13_do          == dram0_match) ? 6'b010011 :
                         (dram0_dir14_do          == dram0_match) ? 6'b010100 :
                         (dram0_dir15_do          == dram0_match) ? 6'b010101 :
                         (dram0_dir16_do          == dram0_match) ? 6'b010110 :
                         (dram0_dir17_do          == dram0_match) ? 6'b010111 :
                         (dram0_dir18_do          == dram0_match) ? 6'b011000 :
                         (dram0_dir19_do          == dram0_match) ? 6'b011001 :
                         (dram0_dir1a_do          == dram0_match) ? 6'b011010 :
                         (dram0_dir1b_do          == dram0_match) ? 6'b011011 :
                         (dram0_dir1c_do          == dram0_match) ? 6'b011100 :
                         (dram0_dir1d_do          == dram0_match) ? 6'b011101 :
                         (dram0_dir1e_do          == dram0_match) ? 6'b011110 :
                         (dram0_dir1f_do          == dram0_match) ? 6'b011111 :
                         (dram0_dir20_do          == dram0_match) ? 6'b100000 :
                         (dram0_dir21_do          == dram0_match) ? 6'b100001 :
                         (dram0_dir22_do          == dram0_match) ? 6'b100010 :
                         (dram0_dir23_do          == dram0_match) ? 6'b100011 :
                         (dram0_dir24_do          == dram0_match) ? 6'b100100 :
                         (dram0_dir25_do          == dram0_match) ? 6'b100101 :
                         (dram0_dir26_do          == dram0_match) ? 6'b100110 :
                         (dram0_dir27_do          == dram0_match) ? 6'b100111 :
                         (dram0_dir28_do          == dram0_match) ? 6'b101000 :
                         (dram0_dir29_do          == dram0_match) ? 6'b101001 :
                         (dram0_dir2a_do          == dram0_match) ? 6'b101010 :
                         (dram0_dir2b_do          == dram0_match) ? 6'b101011 :
                         (dram0_dir2c_do          == dram0_match) ? 6'b101100 :
                         (dram0_dir2d_do          == dram0_match) ? 6'b101101 :
                         (dram0_dir2e_do          == dram0_match) ? 6'b101110 :
                         (dram0_dir2f_do          == dram0_match) ? 6'b101111 :
                         (dram0_dir30_do          == dram0_match) ? 6'b110000 :
                         (dram0_dir31_do          == dram0_match) ? 6'b110001 :
                         (dram0_dir32_do          == dram0_match) ? 6'b110010 :
                         (dram0_dir33_do          == dram0_match) ? 6'b110011 :
                         (dram0_dir34_do          == dram0_match) ? 6'b110100 :
                         (dram0_dir35_do          == dram0_match) ? 6'b110101 :
                         (dram0_dir36_do          == dram0_match) ? 6'b110110 :
                         (dram0_dir37_do          == dram0_match) ? 6'b110111 :
                         (dram0_dir38_do          == dram0_match) ? 6'b111000 :
                         (dram0_dir39_do          == dram0_match) ? 6'b111001 :
                         (dram0_dir3a_do          == dram0_match) ? 6'b111010 :
                         (dram0_dir3b_do          == dram0_match) ? 6'b111011 :
                         (dram0_dir3c_do          == dram0_match) ? 6'b111100 :
                         (dram0_dir3d_do          == dram0_match) ? 6'b111101 :
                         (dram0_dir3e_do          == dram0_match) ? 6'b111110 :
                         (dram0_dir3f_do          == dram0_match) ? 6'b111111 :
                                                                    6'b111111;
wire [ 5:0]  dram1_way = (dram1_dir0_do           == dram1_match) ? 6'b000000 :
                         (dram1_dir1_do           == dram1_match) ? 6'b000001 :
                         (dram1_dir2_do           == dram1_match) ? 6'b000010 :
                         (dram1_dir3_do           == dram1_match) ? 6'b000011 :
                         (dram1_dir4_do           == dram1_match) ? 6'b000100 :
                         (dram1_dir5_do           == dram1_match) ? 6'b000101 :
                         (dram1_dir6_do           == dram1_match) ? 6'b000110 :
                         (dram1_dir7_do           == dram1_match) ? 6'b000111 :
                         (dram1_dir8_do           == dram1_match) ? 6'b001000 :
                         (dram1_dir9_do           == dram1_match) ? 6'b001001 :
                         (dram1_dira_do           == dram1_match) ? 6'b001010 :
                         (dram1_dirb_do           == dram1_match) ? 6'b001011 :
                         (dram1_dirc_do           == dram1_match) ? 6'b001100 :
                         (dram1_dird_do           == dram1_match) ? 6'b001101 :
                         (dram1_dire_do           == dram1_match) ? 6'b001110 :
                         (dram1_dirf_do           == dram1_match) ? 6'b001111 :
                         (dram1_dir10_do          == dram1_match) ? 6'b010000 :
                         (dram1_dir11_do          == dram1_match) ? 6'b010001 :
                         (dram1_dir12_do          == dram1_match) ? 6'b010010 :
                         (dram1_dir13_do          == dram1_match) ? 6'b010011 :
                         (dram1_dir14_do          == dram1_match) ? 6'b010100 :
                         (dram1_dir15_do          == dram1_match) ? 6'b010101 :
                         (dram1_dir16_do          == dram1_match) ? 6'b010110 :
                         (dram1_dir17_do          == dram1_match) ? 6'b010111 :
                         (dram1_dir18_do          == dram1_match) ? 6'b011000 :
                         (dram1_dir19_do          == dram1_match) ? 6'b011001 :
                         (dram1_dir1a_do          == dram1_match) ? 6'b011010 :
                         (dram1_dir1b_do          == dram1_match) ? 6'b011011 :
                         (dram1_dir1c_do          == dram1_match) ? 6'b011100 :
                         (dram1_dir1d_do          == dram1_match) ? 6'b011101 :
                         (dram1_dir1e_do          == dram1_match) ? 6'b011110 :
                         (dram1_dir1f_do          == dram1_match) ? 6'b011111 :
                         (dram1_dir20_do          == dram1_match) ? 6'b100000 :
                         (dram1_dir21_do          == dram1_match) ? 6'b100001 :
                         (dram1_dir22_do          == dram1_match) ? 6'b100010 :
                         (dram1_dir23_do          == dram1_match) ? 6'b100011 :
                         (dram1_dir24_do          == dram1_match) ? 6'b100100 :
                         (dram1_dir25_do          == dram1_match) ? 6'b100101 :
                         (dram1_dir26_do          == dram1_match) ? 6'b100110 :
                         (dram1_dir27_do          == dram1_match) ? 6'b100111 :
                         (dram1_dir28_do          == dram1_match) ? 6'b101000 :
                         (dram1_dir29_do          == dram1_match) ? 6'b101001 :
                         (dram1_dir2a_do          == dram1_match) ? 6'b101010 :
                         (dram1_dir2b_do          == dram1_match) ? 6'b101011 :
                         (dram1_dir2c_do          == dram1_match) ? 6'b101100 :
                         (dram1_dir2d_do          == dram1_match) ? 6'b101101 :
                         (dram1_dir2e_do          == dram1_match) ? 6'b101110 :
                         (dram1_dir2f_do          == dram1_match) ? 6'b101111 :
                         (dram1_dir30_do          == dram1_match) ? 6'b110000 :
                         (dram1_dir31_do          == dram1_match) ? 6'b110001 :
                         (dram1_dir32_do          == dram1_match) ? 6'b110010 :
                         (dram1_dir33_do          == dram1_match) ? 6'b110011 :
                         (dram1_dir34_do          == dram1_match) ? 6'b110100 :
                         (dram1_dir35_do          == dram1_match) ? 6'b110101 :
                         (dram1_dir36_do          == dram1_match) ? 6'b110110 :
                         (dram1_dir37_do          == dram1_match) ? 6'b110111 :
                         (dram1_dir38_do          == dram1_match) ? 6'b111000 :
                         (dram1_dir39_do          == dram1_match) ? 6'b111001 :
                         (dram1_dir3a_do          == dram1_match) ? 6'b111010 :
                         (dram1_dir3b_do          == dram1_match) ? 6'b111011 :
                         (dram1_dir3c_do          == dram1_match) ? 6'b111100 :
                         (dram1_dir3d_do          == dram1_match) ? 6'b111101 :
                         (dram1_dir3e_do          == dram1_match) ? 6'b111110 :
                         (dram1_dir3f_do          == dram1_match) ? 6'b111111 :
                                                                    6'b111111;

wire [ 5:0]  dram2_way = (dram2_dir0_do           == dram2_match) ? 6'b000000 :
                         (dram2_dir1_do           == dram2_match) ? 6'b000001 :
                         (dram2_dir2_do           == dram2_match) ? 6'b000010 :
                         (dram2_dir3_do           == dram2_match) ? 6'b000011 :
                         (dram2_dir4_do           == dram2_match) ? 6'b000100 :
                         (dram2_dir5_do           == dram2_match) ? 6'b000101 :
                         (dram2_dir6_do           == dram2_match) ? 6'b000110 :
                         (dram2_dir7_do           == dram2_match) ? 6'b000111 :
                         (dram2_dir8_do           == dram2_match) ? 6'b001000 :
                         (dram2_dir9_do           == dram2_match) ? 6'b001001 :
                         (dram2_dira_do           == dram2_match) ? 6'b001010 :
                         (dram2_dirb_do           == dram2_match) ? 6'b001011 :
                         (dram2_dirc_do           == dram2_match) ? 6'b001100 :
                         (dram2_dird_do           == dram2_match) ? 6'b001101 :
                         (dram2_dire_do           == dram2_match) ? 6'b001110 :
                         (dram2_dirf_do           == dram2_match) ? 6'b001111 :
                         (dram2_dir10_do          == dram2_match) ? 6'b010000 :
                         (dram2_dir11_do          == dram2_match) ? 6'b010001 :
                         (dram2_dir12_do          == dram2_match) ? 6'b010010 :
                         (dram2_dir13_do          == dram2_match) ? 6'b010011 :
                         (dram2_dir14_do          == dram2_match) ? 6'b010100 :
                         (dram2_dir15_do          == dram2_match) ? 6'b010101 :
                         (dram2_dir16_do          == dram2_match) ? 6'b010110 :
                         (dram2_dir17_do          == dram2_match) ? 6'b010111 :
                         (dram2_dir18_do          == dram2_match) ? 6'b011000 :
                         (dram2_dir19_do          == dram2_match) ? 6'b011001 :
                         (dram2_dir1a_do          == dram2_match) ? 6'b011010 :
                         (dram2_dir1b_do          == dram2_match) ? 6'b011011 :
                         (dram2_dir1c_do          == dram2_match) ? 6'b011100 :
                         (dram2_dir1d_do          == dram2_match) ? 6'b011101 :
                         (dram2_dir1e_do          == dram2_match) ? 6'b011110 :
                         (dram2_dir1f_do          == dram2_match) ? 6'b011111 :
                         (dram2_dir20_do          == dram2_match) ? 6'b100000 :
                         (dram2_dir21_do          == dram2_match) ? 6'b100001 :
                         (dram2_dir22_do          == dram2_match) ? 6'b100010 :
                         (dram2_dir23_do          == dram2_match) ? 6'b100011 :
                         (dram2_dir24_do          == dram2_match) ? 6'b100100 :
                         (dram2_dir25_do          == dram2_match) ? 6'b100101 :
                         (dram2_dir26_do          == dram2_match) ? 6'b100110 :
                         (dram2_dir27_do          == dram2_match) ? 6'b100111 :
                         (dram2_dir28_do          == dram2_match) ? 6'b101000 :
                         (dram2_dir29_do          == dram2_match) ? 6'b101001 :
                         (dram2_dir2a_do          == dram2_match) ? 6'b101010 :
                         (dram2_dir2b_do          == dram2_match) ? 6'b101011 :
                         (dram2_dir2c_do          == dram2_match) ? 6'b101100 :
                         (dram2_dir2d_do          == dram2_match) ? 6'b101101 :
                         (dram2_dir2e_do          == dram2_match) ? 6'b101110 :
                         (dram2_dir2f_do          == dram2_match) ? 6'b101111 :
                         (dram2_dir30_do          == dram2_match) ? 6'b110000 :
                         (dram2_dir31_do          == dram2_match) ? 6'b110001 :
                         (dram2_dir32_do          == dram2_match) ? 6'b110010 :
                         (dram2_dir33_do          == dram2_match) ? 6'b110011 :
                         (dram2_dir34_do          == dram2_match) ? 6'b110100 :
                         (dram2_dir35_do          == dram2_match) ? 6'b110101 :
                         (dram2_dir36_do          == dram2_match) ? 6'b110110 :
                         (dram2_dir37_do          == dram2_match) ? 6'b110111 :
                         (dram2_dir38_do          == dram2_match) ? 6'b111000 :
                         (dram2_dir39_do          == dram2_match) ? 6'b111001 :
                         (dram2_dir3a_do          == dram2_match) ? 6'b111010 :
                         (dram2_dir3b_do          == dram2_match) ? 6'b111011 :
                         (dram2_dir3c_do          == dram2_match) ? 6'b111100 :
                         (dram2_dir3d_do          == dram2_match) ? 6'b111101 :
                         (dram2_dir3e_do          == dram2_match) ? 6'b111110 :
                         (dram2_dir3f_do          == dram2_match) ? 6'b111111 :
                                                                    6'b111111;
wire [ 5:0]  dram3_way = (dram3_dir0_do           == dram3_match) ? 6'b000000 :
                         (dram3_dir1_do           == dram3_match) ? 6'b000001 :
                         (dram3_dir2_do           == dram3_match) ? 6'b000010 :
                         (dram3_dir3_do           == dram3_match) ? 6'b000011 :
                         (dram3_dir4_do           == dram3_match) ? 6'b000100 :
                         (dram3_dir5_do           == dram3_match) ? 6'b000101 :
                         (dram3_dir6_do           == dram3_match) ? 6'b000110 :
                         (dram3_dir7_do           == dram3_match) ? 6'b000111 :
                         (dram3_dir8_do           == dram3_match) ? 6'b001000 :
                         (dram3_dir9_do           == dram3_match) ? 6'b001001 :
                         (dram3_dira_do           == dram3_match) ? 6'b001010 :
                         (dram3_dirb_do           == dram3_match) ? 6'b001011 :
                         (dram3_dirc_do           == dram3_match) ? 6'b001100 :
                         (dram3_dird_do           == dram3_match) ? 6'b001101 :
                         (dram3_dire_do           == dram3_match) ? 6'b001110 :
                         (dram3_dirf_do           == dram3_match) ? 6'b001111 :
                         (dram3_dir10_do          == dram3_match) ? 6'b010000 :
                         (dram3_dir11_do          == dram3_match) ? 6'b010001 :
                         (dram3_dir12_do          == dram3_match) ? 6'b010010 :
                         (dram3_dir13_do          == dram3_match) ? 6'b010011 :
                         (dram3_dir14_do          == dram3_match) ? 6'b010100 :
                         (dram3_dir15_do          == dram3_match) ? 6'b010101 :
                         (dram3_dir16_do          == dram3_match) ? 6'b010110 :
                         (dram3_dir17_do          == dram3_match) ? 6'b010111 :
                         (dram3_dir18_do          == dram3_match) ? 6'b011000 :
                         (dram3_dir19_do          == dram3_match) ? 6'b011001 :
                         (dram3_dir1a_do          == dram3_match) ? 6'b011010 :
                         (dram3_dir1b_do          == dram3_match) ? 6'b011011 :
                         (dram3_dir1c_do          == dram3_match) ? 6'b011100 :
                         (dram3_dir1d_do          == dram3_match) ? 6'b011101 :
                         (dram3_dir1e_do          == dram3_match) ? 6'b011110 :
                         (dram3_dir1f_do          == dram3_match) ? 6'b011111 :
                         (dram3_dir20_do          == dram3_match) ? 6'b100000 :
                         (dram3_dir21_do          == dram3_match) ? 6'b100001 :
                         (dram3_dir22_do          == dram3_match) ? 6'b100010 :
                         (dram3_dir23_do          == dram3_match) ? 6'b100011 :
                         (dram3_dir24_do          == dram3_match) ? 6'b100100 :
                         (dram3_dir25_do          == dram3_match) ? 6'b100101 :
                         (dram3_dir26_do          == dram3_match) ? 6'b100110 :
                         (dram3_dir27_do          == dram3_match) ? 6'b100111 :
                         (dram3_dir28_do          == dram3_match) ? 6'b101000 :
                         (dram3_dir29_do          == dram3_match) ? 6'b101001 :
                         (dram3_dir2a_do          == dram3_match) ? 6'b101010 :
                         (dram3_dir2b_do          == dram3_match) ? 6'b101011 :
                         (dram3_dir2c_do          == dram3_match) ? 6'b101100 :
                         (dram3_dir2d_do          == dram3_match) ? 6'b101101 :
                         (dram3_dir2e_do          == dram3_match) ? 6'b101110 :
                         (dram3_dir2f_do          == dram3_match) ? 6'b101111 :
                         (dram3_dir30_do          == dram3_match) ? 6'b110000 :
                         (dram3_dir31_do          == dram3_match) ? 6'b110001 :
                         (dram3_dir32_do          == dram3_match) ? 6'b110010 :
                         (dram3_dir33_do          == dram3_match) ? 6'b110011 :
                         (dram3_dir34_do          == dram3_match) ? 6'b110100 :
                         (dram3_dir35_do          == dram3_match) ? 6'b110101 :
                         (dram3_dir36_do          == dram3_match) ? 6'b110110 :
                         (dram3_dir37_do          == dram3_match) ? 6'b110111 :
                         (dram3_dir38_do          == dram3_match) ? 6'b111000 :
                         (dram3_dir39_do          == dram3_match) ? 6'b111001 :
                         (dram3_dir3a_do          == dram3_match) ? 6'b111010 :
                         (dram3_dir3b_do          == dram3_match) ? 6'b111011 :
                         (dram3_dir3c_do          == dram3_match) ? 6'b111100 :
                         (dram3_dir3d_do          == dram3_match) ? 6'b111101 :
                         (dram3_dir3e_do          == dram3_match) ? 6'b111110 :
                         (dram3_dir3f_do          == dram3_match) ? 6'b111111 :
                                                                    6'b111111;

/**************************************************************************************************************
*    MEMORY ACCESS NOT DEFINED IN MEM.IMAGE FILE
**************************************************************************************************************/
reg         way_err_enable;
reg         way_warn_enable;
initial begin
  if ($value$plusargs("ddr2_way_err_enable=%d", way_err_enable)) begin
  end else begin
  way_err_enable=1;
  end
  if ($value$plusargs("ddr2_way_warn_enable=%d", way_warn_enable)) begin
  end else begin
  way_warn_enable=0;
  end
end
wire         iob_way_err   = 1'b0; // ~(iob_dir3f_do   == iob_match  ) & (&iob_way);
wire         dram0_way_err = ~(dram0_dir3f_do == dram0_match) & (&dram0_way) & dram0_cas_cy & way_err_enable;
wire         dram1_way_err = ~(dram1_dir3f_do == dram1_match) & (&dram1_way) & dram1_cas_cy & way_err_enable;
wire         dram2_way_err = ~(dram2_dir3f_do == dram2_match) & (&dram2_way) & dram2_cas_cy & way_err_enable;
wire         dram3_way_err = ~(dram3_dir3f_do == dram3_match) & (&dram3_way) & dram3_cas_cy & way_err_enable;

wire         dram0_way_warn = ~(dram0_dir3f_do == dram0_match) & (&dram0_way) & dram0_cas_cy & way_warn_enable;
wire         dram1_way_warn = ~(dram1_dir3f_do == dram1_match) & (&dram1_way) & dram1_cas_cy & way_warn_enable;
wire         dram2_way_warn = ~(dram2_dir3f_do == dram2_match) & (&dram2_way) & dram2_cas_cy & way_warn_enable;
wire         dram3_way_warn = ~(dram3_dir3f_do == dram3_match) & (&dram3_way) & dram3_cas_cy & way_warn_enable;

`ifdef EMUL
always @(posedge ssiclk) begin
       if (iob_way_err)
       begin // axis tbcall_region
        $display(" ERROR: IOB ADR BOUNDS. CY = %d. ADR= %h",CLK_CNT, jbi_rom_adr);
       end
end
reg [36:4] dram0_adr_r;
reg [36:4] dram1_adr_r;
reg [36:4] dram2_adr_r;
reg [36:4] dram3_adr_r;
reg dram_addr_dump;
initial dram_addr_dump=1'b1;
always @(posedge dramclk) begin
       dram0_adr_r <= dram0_adr;
       dram1_adr_r <= dram1_adr;
       dram2_adr_r <= dram2_adr;
       dram3_adr_r <= dram3_adr;

       if (dram0_way_err)
       begin // axis tbcall_region
        $display(" ERROR: DRAM ADR BOUNDS. CY = %d. ADR= %h",CLK_CNT, {DRAM0_ADR_HOLD, 4'h0});
       end
       if (dram1_way_err)
       begin // axis tbcall_region
        $display(" ERROR: DRAM1 ADR BOUNDS. CY = %d. ADR= %h",CLK_CNT, {DRAM1_ADR_HOLD, 4'h0});
       end
       if (dram2_way_err)
       begin // axis tbcall_region
        $display(" ERROR: DRAM2 ADR BOUNDS. CY = %d. ADR= %h",CLK_CNT, {DRAM2_ADR_HOLD, 4'h0});
       end
       if (dram3_way_err)
       begin // axis tbcall_region
        $display(" ERROR: DRAM3 ADR BOUNDS. CY = %d. ADR= %h",CLK_CNT, {DRAM3_ADR_HOLD, 4'h0});
       end

       if (dram0_way_warn)
       begin // axis tbcall_region
        $display(" DRAM ADR BOUNDS. CY = %d. ADR= %h",CLK_CNT, {DRAM0_ADR_HOLD, 4'h0});
       end
       if (dram1_way_warn)
       begin // axis tbcall_region
        $display(" DRAM1 ADR BOUNDS. CY = %d. ADR= %h",CLK_CNT, {DRAM1_ADR_HOLD, 4'h0});
       end
       if (dram2_way_warn)
       begin // axis tbcall_region
        $display(" DRAM2 ADR BOUNDS. CY = %d. ADR= %h",CLK_CNT, {DRAM2_ADR_HOLD, 4'h0});
       end
       if (dram3_way_warn)
       begin // axis tbcall_region
        $display(" DRAM3 ADR BOUNDS. CY = %d. ADR= %h",CLK_CNT, {DRAM3_ADR_HOLD, 4'h0});
       end
  if (dram0_rd_cas & dram_addr_dump)
       begin // axis tbcall_region
    $display(" DRAM0  %d  RD=%h0", CLK_CNT, dram0_adr_r);
       end
  if (dram1_rd_cas & dram_addr_dump)
       begin // axis tbcall_region
    $display(" DRAM1  %d  RD=%h0", CLK_CNT, dram1_adr_r);
       end
  if (dram2_rd_cas & dram_addr_dump)
       begin // axis tbcall_region
    $display(" DRAM2  %d  RD=%h0", CLK_CNT, dram2_adr_r);
       end
  if (dram3_rd_cas& dram_addr_dump)
       begin // axis tbcall_region
    $display(" DRAM3  %d  RD=%h0", CLK_CNT, dram3_adr_r);
       end
  if (dram0_wr_cas& dram_addr_dump)
       begin // axis tbcall_region
    $display(" DRAM0  %d  WR=%h0", CLK_CNT, dram0_adr_r);
       end
  if (dram1_wr_cas & dram_addr_dump)
       begin // axis tbcall_region
    $display(" DRAM1  %d  WR=%h0", CLK_CNT, dram1_adr_r);
       end
  if (dram2_wr_cas & dram_addr_dump)
       begin // axis tbcall_region
    $display(" DRAM2  %d  WR=%h0", CLK_CNT, dram2_adr_r);
       end
  if (dram3_wr_cas  & dram_addr_dump)
       begin // axis tbcall_region
    $display(" DRAM3  %d  WR=%h0", CLK_CNT, dram3_adr_r);
       end
end
`else
always @(posedge ssiclk) begin
       if (iob_way_err)                    
        $display(" ERROR: IOB ADDRESS OUT OF BOUNDS ON CYCLE = %d. ADR= %h",CLK_CNT, jbi_rom_adr);
end
always @(posedge dramclk) begin
       if (dram0_way_err)                    
        $display(" ERROR: DRAM0 ADDRESS OUT OF BOUNDS ON CYCLE = %d. ADR= %h",CLK_CNT, {dram0_adr, 4'h0});
       if (dram1_way_err)                    
        $display(" ERROR: DRAM1 ADDRESS OUT OF BOUNDS ON CYCLE = %d. ADR= %h",CLK_CNT, {dram1_adr, 4'h0});
       if (dram2_way_err)                    
        $display(" ERROR: DRAM2 ADDRESS OUT OF BOUNDS ON CYCLE = %d. ADR= %h",CLK_CNT, {dram2_adr, 4'h0});
       if (dram3_way_err)                    
        $display(" ERROR: DRAM3 ADDRESS OUT OF BOUNDS ON CYCLE = %d. ADR= %h",CLK_CNT, {dram3_adr, 4'h0});
  if (dram0_rd_cas) $display(" DRAM0  %d  RD=%h0", CLK_CNT, dram0_adr);
  if (dram1_rd_cas) $display(" DRAM1  %d  RD=%h0", CLK_CNT, dram1_adr);
  if (dram2_rd_cas) $display(" DRAM2  %d  RD=%h0", CLK_CNT, dram2_adr);
  if (dram3_rd_cas) $display(" DRAM3  %d  RD=%h0", CLK_CNT, dram3_adr);
  if (dram0_wr_cas) $display(" DRAM0  %d  WR=%h0", CLK_CNT, dram0_adr);
  if (dram1_wr_cas) $display(" DRAM1  %d  WR=%h0", CLK_CNT, dram1_adr);
  if (dram2_wr_cas) $display(" DRAM2  %d  WR=%h0", CLK_CNT, dram2_adr);
  if (dram3_wr_cas) $display(" DRAM3  %d  WR=%h0", CLK_CNT, dram3_adr);
end
`endif

/**************************************************************************************************************
*   If we read the following line out of the mem.image file
* it should be placed in the the address order 0, 1, 2, 3 as shown below:
* 
* 8f902001050060d0 8190800083908000 050000058410a200 8590800081f00000
*      0                 1               2                3
*
*   When the data is returned from the DRAM it is received in the
* following order assuming the critical QW is 0.  The C's represent the 
* dram cycle io_dram2_data_valid is asserted (DRAM2_READV[5]).  Thus 0 and 2 are written
* on the positive edge of the dram clock, and 1 and 3 on the negative.  
*
*       0   0   2   2          io_dram2_data_in[255:128]
*           1   1   3  3       io_dram2_data_in[127:  0]
*       CCCCCCCC               io_dram2_data_valid
*
*    The ECC is generated when the data is read from the DRAM.  The XOR of the address bits [36:8] is
*  XORed with the final ECC for address protection.
**************************************************************************************************************/
wire [127:0] io_dram0_data_02_5   = DRAM0_CQWF_P[5] ? dram0_data_read2[127:0] : dram0_data_read0[127:0]; // Posedge
wire [127:0] io_dram0_data_02_6p  = DRAM0_CQWF_P[5] ? dram0_data_read0[127:0] : dram0_data_read2[127:0]; // Posedge
wire [127:0] io_dram0_data_13_5   = DRAM0_CQWF5_N   ? dram0_data_read3[127:0] : dram0_data_read1[127:0]; // Negedge
wire [127:0] io_dram0_data_13_6p  = DRAM0_CQWF5_N   ? dram0_data_read1[127:0] : dram0_data_read3[127:0]; // Negedge
wire [ 15:0] io_dram0_ecc_02_5   = DRAM0_CQWF_P[5] ? dram0_ecc_read2[ 15:0] : dram0_ecc_read0[ 15:0]; // Posedge
wire [ 15:0] io_dram0_ecc_02_6p  = DRAM0_CQWF_P[5] ? dram0_ecc_read0[ 15:0] : dram0_ecc_read2[ 15:0]; // Posedge
wire [ 15:0] io_dram0_ecc_13_5   = DRAM0_CQWF5_N   ? dram0_ecc_read3[ 15:0] : dram0_ecc_read1[ 15:0]; // Negedge
wire [ 15:0] io_dram0_ecc_13_6p  = DRAM0_CQWF5_N   ? dram0_ecc_read1[ 15:0] : dram0_ecc_read3[ 15:0]; // Negedge

wire [127:0] io_dram1_data_02_5   = DRAM1_CQWF_P[5] ? dram1_data_read2[127:0] : dram1_data_read0[127:0]; // Posedge
wire [127:0] io_dram1_data_02_6p  = DRAM1_CQWF_P[5] ? dram1_data_read0[127:0] : dram1_data_read2[127:0]; // Posedge
wire [127:0] io_dram1_data_13_5   = DRAM1_CQWF5_N   ? dram1_data_read3[127:0] : dram1_data_read1[127:0]; // Negedge
wire [127:0] io_dram1_data_13_6p  = DRAM1_CQWF5_N   ? dram1_data_read1[127:0] : dram1_data_read3[127:0]; // Negedge
wire [ 15:0] io_dram1_ecc_02_5   = DRAM1_CQWF_P[5] ? dram1_ecc_read2[ 15:0] : dram1_ecc_read0[ 15:0]; // Posedge
wire [ 15:0] io_dram1_ecc_02_6p  = DRAM1_CQWF_P[5] ? dram1_ecc_read0[ 15:0] : dram1_ecc_read2[ 15:0]; // Posedge
wire [ 15:0] io_dram1_ecc_13_5   = DRAM1_CQWF5_N   ? dram1_ecc_read3[ 15:0] : dram1_ecc_read1[ 15:0]; // Negedge
wire [ 15:0] io_dram1_ecc_13_6p  = DRAM1_CQWF5_N   ? dram1_ecc_read1[ 15:0] : dram1_ecc_read3[ 15:0]; // Negedge

wire [127:0] io_dram2_data_02_5   = DRAM2_CQWF_P[5] ? dram2_data_read2[127:0] : dram2_data_read0[127:0]; // Posedge
wire [127:0] io_dram2_data_02_6p  = DRAM2_CQWF_P[5] ? dram2_data_read0[127:0] : dram2_data_read2[127:0]; // Posedge
wire [127:0] io_dram2_data_13_5   = DRAM2_CQWF5_N   ? dram2_data_read3[127:0] : dram2_data_read1[127:0]; // Negedge
wire [127:0] io_dram2_data_13_6p  = DRAM2_CQWF5_N   ? dram2_data_read1[127:0] : dram2_data_read3[127:0]; // Negedge
wire [ 15:0] io_dram2_ecc_02_5   = DRAM2_CQWF_P[5] ? dram2_ecc_read2[ 15:0] : dram2_ecc_read0[ 15:0]; // Posedge
wire [ 15:0] io_dram2_ecc_02_6p  = DRAM2_CQWF_P[5] ? dram2_ecc_read0[ 15:0] : dram2_ecc_read2[ 15:0]; // Posedge
wire [ 15:0] io_dram2_ecc_13_5   = DRAM2_CQWF5_N   ? dram2_ecc_read3[ 15:0] : dram2_ecc_read1[ 15:0]; // Negedge
wire [ 15:0] io_dram2_ecc_13_6p  = DRAM2_CQWF5_N   ? dram2_ecc_read1[ 15:0] : dram2_ecc_read3[ 15:0]; // Negedge

wire [127:0] io_dram3_data_02_5   = DRAM3_CQWF_P[5] ? dram3_data_read2[127:0] : dram3_data_read0[127:0]; // Posedge
wire [127:0] io_dram3_data_02_6p  = DRAM3_CQWF_P[5] ? dram3_data_read0[127:0] : dram3_data_read2[127:0]; // Posedge
wire [127:0] io_dram3_data_13_5   = DRAM3_CQWF5_N   ? dram3_data_read3[127:0] : dram3_data_read1[127:0]; // Negedge
wire [127:0] io_dram3_data_13_6p  = DRAM3_CQWF5_N   ? dram3_data_read1[127:0] : dram3_data_read3[127:0]; // Negedge
wire [ 15:0] io_dram3_ecc_02_5   = DRAM3_CQWF_P[5] ? dram3_ecc_read2[ 15:0] : dram3_ecc_read0[ 15:0]; // Posedge
wire [ 15:0] io_dram3_ecc_02_6p  = DRAM3_CQWF_P[5] ? dram3_ecc_read0[ 15:0] : dram3_ecc_read2[ 15:0]; // Posedge
wire [ 15:0] io_dram3_ecc_13_5   = DRAM3_CQWF5_N   ? dram3_ecc_read3[ 15:0] : dram3_ecc_read1[ 15:0]; // Negedge
wire [ 15:0] io_dram3_ecc_13_6p  = DRAM3_CQWF5_N   ? dram3_ecc_read1[ 15:0] : dram3_ecc_read3[ 15:0]; // Negedge

/****
assign io_dram0_data_in[255:128] = DRAM0_READV_P[5] ? io_dram0_data_02_5 : DRAM0_DATA_02_6;
assign io_dram0_data_in[127:  0] = DRAM0_READV5_N   ? io_dram0_data_13_5 : DRAM0_DATA_13_6;
assign io_dram1_data_in[255:128] = DRAM1_READV_P[5] ? io_dram1_data_02_5 : DRAM1_DATA_02_6;
assign io_dram1_data_in[127:  0] = DRAM1_READV5_N   ? io_dram1_data_13_5 : DRAM1_DATA_13_6;
assign io_dram2_data_in[255:128] = DRAM2_READV_P[5] ? io_dram2_data_02_5 : DRAM2_DATA_02_6;
assign io_dram2_data_in[127:  0] = DRAM2_READV5_N   ? io_dram2_data_13_5 : DRAM2_DATA_13_6;
assign io_dram3_data_in[255:128] = DRAM3_READV_P[5] ? io_dram3_data_02_5 : DRAM3_DATA_02_6;
assign io_dram3_data_in[127:  0] = DRAM3_READV5_N   ? io_dram3_data_13_5 : DRAM3_DATA_13_6;
****/
reg    [255:128] io_dram0_data_inPR;
reg    [255:128] io_dram1_data_inPR;
reg    [255:128] io_dram2_data_inPR;
reg    [255:128] io_dram3_data_inPR;
reg    [127:  0] io_dram0_data_inNR;
reg    [127:  0] io_dram1_data_inNR;
reg    [127:  0] io_dram2_data_inNR;
reg    [127:  0] io_dram3_data_inNR;
reg    [ 31: 16] io_dram0_ecc_inPR;
reg    [ 31: 16] io_dram1_ecc_inPR;
reg    [ 31: 16] io_dram2_ecc_inPR;
reg    [ 31: 16] io_dram3_ecc_inPR;
reg    [ 15:  0] io_dram0_ecc_inNR;
reg    [ 15:  0] io_dram1_ecc_inNR;
reg    [ 15:  0] io_dram2_ecc_inNR;
reg    [ 15:  0] io_dram3_ecc_inNR;

wire   [255:128] io_dram0_data_inP = DRAM0_READV_P[5] ? io_dram0_data_02_5 : DRAM0_DATA_02_6;
wire   [127:  0] io_dram0_data_inN = DRAM0_READV5_N   ? io_dram0_data_13_5 : DRAM0_DATA_13_6;
wire   [255:128] io_dram1_data_inP = DRAM1_READV_P[5] ? io_dram1_data_02_5 : DRAM1_DATA_02_6;
wire   [127:  0] io_dram1_data_inN = DRAM1_READV5_N   ? io_dram1_data_13_5 : DRAM1_DATA_13_6;
wire   [255:128] io_dram2_data_inP = DRAM2_READV_P[5] ? io_dram2_data_02_5 : DRAM2_DATA_02_6;
wire   [127:  0] io_dram2_data_inN = DRAM2_READV5_N   ? io_dram2_data_13_5 : DRAM2_DATA_13_6;
wire   [255:128] io_dram3_data_inP = DRAM3_READV_P[5] ? io_dram3_data_02_5 : DRAM3_DATA_02_6;
wire   [127:  0] io_dram3_data_inN = DRAM3_READV5_N   ? io_dram3_data_13_5 : DRAM3_DATA_13_6;
wire   [ 31: 16] io_dram0_ecc_inP = DRAM0_READV_P[5] ? io_dram0_ecc_02_5 : DRAM0_ECC_02_6;
wire   [ 15:  0] io_dram0_ecc_inN = DRAM0_READV5_N   ? io_dram0_ecc_13_5 : DRAM0_ECC_13_6;
wire   [ 31: 16] io_dram1_ecc_inP = DRAM1_READV_P[5] ? io_dram1_ecc_02_5 : DRAM1_ECC_02_6;
wire   [ 15:  0] io_dram1_ecc_inN = DRAM1_READV5_N   ? io_dram1_ecc_13_5 : DRAM1_ECC_13_6;
wire   [ 31: 16] io_dram2_ecc_inP = DRAM2_READV_P[5] ? io_dram2_ecc_02_5 : DRAM2_ECC_02_6;
wire   [ 15:  0] io_dram2_ecc_inN = DRAM2_READV5_N   ? io_dram2_ecc_13_5 : DRAM2_ECC_13_6;
wire   [ 31: 16] io_dram3_ecc_inP = DRAM3_READV_P[5] ? io_dram3_ecc_02_5 : DRAM3_ECC_02_6;
wire   [ 15:  0] io_dram3_ecc_inN = DRAM3_READV5_N   ? io_dram3_ecc_13_5 : DRAM3_ECC_13_6;

assign io_dram0_data_in[255:128] = (que_data_del_cnt0 == 3'b001) ? io_dram0_data_inP : io_dram0_data_inPR;
assign io_dram1_data_in[255:128] = (que_data_del_cnt1 == 3'b001) ? io_dram1_data_inP : io_dram1_data_inPR;
assign io_dram2_data_in[255:128] = (que_data_del_cnt2 == 3'b001) ? io_dram2_data_inP : io_dram2_data_inPR;
assign io_dram3_data_in[255:128] = (que_data_del_cnt3 == 3'b001) ? io_dram3_data_inP : io_dram3_data_inPR;
assign io_dram0_data_in[127:  0] = (que_data_del_cnt0 == 3'b001) ? io_dram0_data_inN : io_dram0_data_inNR;
assign io_dram1_data_in[127:  0] = (que_data_del_cnt1 == 3'b001) ? io_dram1_data_inN : io_dram1_data_inNR;
assign io_dram2_data_in[127:  0] = (que_data_del_cnt2 == 3'b001) ? io_dram2_data_inN : io_dram2_data_inNR;
assign io_dram3_data_in[127:  0] = (que_data_del_cnt3 == 3'b001) ? io_dram3_data_inN : io_dram3_data_inNR;
assign io_dram0_ecc_in[ 31: 16] = (que_data_del_cnt0 == 3'b001) ? io_dram0_ecc_inP : io_dram0_ecc_inPR;
assign io_dram1_ecc_in[ 31: 16] = (que_data_del_cnt1 == 3'b001) ? io_dram1_ecc_inP : io_dram1_ecc_inPR;
assign io_dram2_ecc_in[ 31: 16] = (que_data_del_cnt2 == 3'b001) ? io_dram2_ecc_inP : io_dram2_ecc_inPR;
assign io_dram3_ecc_in[ 31: 16] = (que_data_del_cnt3 == 3'b001) ? io_dram3_ecc_inP : io_dram3_ecc_inPR;
assign io_dram0_ecc_in[ 15:  0] = (que_data_del_cnt0 == 3'b001) ? io_dram0_ecc_inN : io_dram0_ecc_inNR;
assign io_dram1_ecc_in[ 15:  0] = (que_data_del_cnt1 == 3'b001) ? io_dram1_ecc_inN : io_dram1_ecc_inNR;
assign io_dram2_ecc_in[ 15:  0] = (que_data_del_cnt2 == 3'b001) ? io_dram2_ecc_inN : io_dram2_ecc_inNR;
assign io_dram3_ecc_in[ 15:  0] = (que_data_del_cnt3 == 3'b001) ? io_dram3_ecc_inN : io_dram3_ecc_inNR;
/****

wire [15:0] dram0_ecc_read02, dram0_ecc_read13;
wire [15:0] dram1_ecc_read02, dram1_ecc_read13;
wire [15:0] dram2_ecc_read02, dram2_ecc_read13;
wire [15:0] dram3_ecc_read02, dram3_ecc_read13;

dram_ecc_gen   ecc0_02 ( .data(io_dram0_data_in[255:128]), .ecc(dram0_ecc_read02[15:0]) );
dram_ecc_gen   ecc0_13 ( .data(io_dram0_data_in[127:  0]), .ecc(dram0_ecc_read13[15:0]) );
dram_ecc_gen   ecc1_02 ( .data(io_dram1_data_in[255:128]), .ecc(dram1_ecc_read02[15:0]) );
dram_ecc_gen   ecc1_13 ( .data(io_dram1_data_in[127:  0]), .ecc(dram1_ecc_read13[15:0]) );
dram_ecc_gen   ecc2_02 ( .data(io_dram2_data_in[255:128]), .ecc(dram2_ecc_read02[15:0]) );
dram_ecc_gen   ecc2_13 ( .data(io_dram2_data_in[127:  0]), .ecc(dram2_ecc_read13[15:0]) );
dram_ecc_gen   ecc3_02 ( .data(io_dram3_data_in[255:128]), .ecc(dram3_ecc_read02[15:0]) );
dram_ecc_gen   ecc3_13 ( .data(io_dram3_data_in[127:  0]), .ecc(dram3_ecc_read13[15:0]) );

assign io_dram0_ecc_in[31:0]   = (que_data_del_cnt0 == 3'b001) ?
                                 {(dram0_ecc_read02[15 :0] ^ {16{DRAM0_PARITY_P[5]}}), 
                                  (dram0_ecc_read13[15 :0] ^ {16{DRAM0_PARITY5_N  }})} :
                                 {(dram0_ecc_read02[15 :0] ^ {16{DRAM0_PARITY_P[6]}}), 
                                  (dram0_ecc_read13[15 :0] ^ {16{DRAM0_PARITY6_N  }})}; 
assign io_dram1_ecc_in[31:0]   = (que_data_del_cnt1 == 3'b001) ?
                                 {(dram1_ecc_read02[15 :0] ^ {16{DRAM1_PARITY_P[5]}}),
                                  (dram1_ecc_read13[15 :0] ^ {16{DRAM1_PARITY5_N  }})} :
                                 {(dram1_ecc_read02[15 :0] ^ {16{DRAM1_PARITY_P[6]}}),
                                  (dram1_ecc_read13[15 :0] ^ {16{DRAM1_PARITY6_N  }})}; 
assign io_dram2_ecc_in[31:0]   = (que_data_del_cnt2 == 3'b001) ?
                                 {(dram2_ecc_read02[15 :0] ^ {16{DRAM2_PARITY_P[5]}}),
                                  (dram2_ecc_read13[15 :0] ^ {16{DRAM2_PARITY5_N  }})} :
                                 {(dram2_ecc_read02[15 :0] ^ {16{DRAM2_PARITY_P[6]}}),
                                  (dram2_ecc_read13[15 :0] ^ {16{DRAM2_PARITY6_N  }})};
assign io_dram3_ecc_in[31:0]   = (que_data_del_cnt3 == 3'b001) ?
                                 {(dram3_ecc_read02[15 :0] ^ {16{DRAM3_PARITY_P[5]}}),
                                  (dram3_ecc_read13[15 :0] ^ {16{DRAM3_PARITY5_N  }})} :
                                 {(dram3_ecc_read02[15 :0] ^ {16{DRAM3_PARITY_P[6]}}),
                                  (dram3_ecc_read13[15 :0] ^ {16{DRAM3_PARITY6_N  }})}; 
***/
assign io_dram0_data_valid = (que_data_del_cnt0 == 3'b001) ? DRAM0_READV_P[5] : DRAM0_READV_P[6];
assign io_dram1_data_valid = (que_data_del_cnt1 == 3'b001) ? DRAM1_READV_P[5] : DRAM1_READV_P[6];
assign io_dram2_data_valid = (que_data_del_cnt2 == 3'b001) ? DRAM2_READV_P[5] : DRAM2_READV_P[6];
assign io_dram3_data_valid = (que_data_del_cnt3 == 3'b001) ? DRAM3_READV_P[5] : DRAM3_READV_P[6];

/**************************************************************************************************************
*    DRAM clock domain registers and RAM are clocked and initialized
**************************************************************************************************************/
`ifdef EMUL
reg [255:0] io_dram0_data_in_r, io_dram1_data_in_r, io_dram2_data_in_r, io_dram3_data_in_r;

always @(posedge dramclk) begin
  io_dram0_data_in_r <= io_dram0_data_in;
  io_dram1_data_in_r <= io_dram1_data_in;
  io_dram2_data_in_r <= io_dram2_data_in;
  io_dram3_data_in_r <= io_dram3_data_in;

  if ((io_dram0_data_valid | IO_DRAM0_DATA_VALID_NXT) & dram_dump)
    begin // axis tbcall_region
     $display ("DRAM0 RD= %h", io_dram0_data_in_r);
    end
  if ((io_dram1_data_valid | IO_DRAM1_DATA_VALID_NXT) & dram_dump)
    begin // axis tbcall_region
     $display ("DRAM1 RD= %h", io_dram1_data_in_r);
    end
  if ((io_dram2_data_valid | IO_DRAM2_DATA_VALID_NXT) & dram_dump)
    begin // axis tbcall_region
     $display ("DRAM2 RD= %h", io_dram2_data_in_r);
    end
  if ((io_dram3_data_valid | IO_DRAM3_DATA_VALID_NXT) & dram_dump)
    begin // axis tbcall_region
     $display ("DRAM3 RD= %h", io_dram3_data_in_r);
    end
end
`else
always @(posedge dramclk) begin
  if ((io_dram0_data_valid | IO_DRAM0_DATA_VALID_NXT) & dram_dump) $display ("DRAM0 RD= %h", io_dram0_data_in);
  if ((io_dram1_data_valid | IO_DRAM1_DATA_VALID_NXT) & dram_dump) $display ("DRAM1 RD= %h", io_dram1_data_in);
  if ((io_dram2_data_valid | IO_DRAM2_DATA_VALID_NXT) & dram_dump) $display ("DRAM2 RD= %h", io_dram2_data_in);
  if ((io_dram3_data_valid | IO_DRAM3_DATA_VALID_NXT) & dram_dump) $display ("DRAM3 RD= %h", io_dram3_data_in);
end
`endif

initial begin
  CLK_CNT      <= 40'h0;
end
always @(posedge dramclk) begin
  CLK_CNT          <= CLK_CNT + 40'b1;
  io_dram0_data_inPR <= io_dram0_data_inP;
  io_dram1_data_inPR <= io_dram1_data_inP;
  io_dram2_data_inPR <= io_dram2_data_inP;
  io_dram3_data_inPR <= io_dram3_data_inP;
  io_dram0_ecc_inPR <= io_dram0_ecc_inP;
  io_dram1_ecc_inPR <= io_dram1_ecc_inP;
  io_dram2_ecc_inPR <= io_dram2_ecc_inP;
  io_dram3_ecc_inPR <= io_dram3_ecc_inP;

  IO_DRAM0_DATA_VALID_NXT <= io_dram0_data_valid;
  IO_DRAM1_DATA_VALID_NXT <= io_dram1_data_valid;
  IO_DRAM2_DATA_VALID_NXT <= io_dram2_data_valid;
  IO_DRAM3_DATA_VALID_NXT <= io_dram3_data_valid;

  if (dram0_ras_cy) RAS[dram0_ras_adr] <= dram0_io_addr[14:0];
  if (dram1_ras_cy) RAS[dram1_ras_adr] <= dram1_io_addr[14:0];
  if (dram2_ras_cy) RAS[dram2_ras_adr] <= dram2_io_addr[14:0];
  if (dram3_ras_cy) RAS[dram3_ras_adr] <= dram3_io_addr[14:0];

  DRAM0_WRITV_P <= {DRAM0_WRITV_P[5:0], dram0_wr_cas};
  DRAM0_READV_P <= {DRAM0_READV_P[5:0], dram0_rd_cas};
  DRAM0_CQWF_P  <= {DRAM0_CQWF_P[4:0], dram0_line[5]};
  DRAM0_PARITY_P<= {DRAM0_PARITY_P[5:0], dram0_adr_parity};
  DRAM0_ADR_HOLD<= dram0_adr;
//DRAM0_ADR0_P  <= (|dram0_blk_hit[4:3]) ? {dram0_blk_hit[4:0],                 dram0_adr  [29:8]} :
//                                         {dram0_blk_hit[4:0], dram0_way[5:0], dram0_index[23:8]};
//  DRAM0_ADR0_P  <=                         {                    dram0_way[5:0], dram0_index[26:8]};
  DRAM0_ADR0_P  <= {(^{dram0_adr[36:9],dram0_adr[6]}), dram0_way[5:0], dram0_index[26:8]};
  DRAM0_ADR1_P  <= DRAM0_ADR0_P[33:8];
  DRAM0_ADR2_P  <= DRAM0_ADR1_P[33:8];
  DRAM0_ADR3_P  <= DRAM0_ADR2_P[33:8];
  DRAM0_ADR4_P  <= DRAM0_ADR3_P[33:8];
  DRAM0_ADR5_P  <= DRAM0_ADR4_P[33:8];
  DRAM0_DATA_02_6 <= io_dram0_data_02_6p[127:0];
  DRAM0_ECC_02_6 <= io_dram0_ecc_02_6p[15:0];
  DRAM1_WRITV_P <= {DRAM1_WRITV_P[5:0], dram1_wr_cas};

  DRAM1_READV_P <= {DRAM1_READV_P[5:0], dram1_rd_cas};
  DRAM1_CQWF_P  <= {DRAM1_CQWF_P[4:0], dram1_line[5]};
  DRAM1_PARITY_P<= {DRAM1_PARITY_P[5:0], dram1_adr_parity};
  DRAM1_ADR_HOLD<= dram1_adr;
//DRAM1_ADR0_P  <= (|dram1_blk_hit[4:3]) ? {dram1_blk_hit[4:0],                 dram1_adr  [29:8]} :
//                                         {dram1_blk_hit[4:0], dram1_way[5:0], dram1_index[23:8]};
//  DRAM1_ADR0_P  <=                         {                    dram1_way[5:0], dram1_index[26:8]};
  DRAM1_ADR0_P  <= {(^{dram1_adr[36:9],dram1_adr[6]}), dram1_way[5:0], dram1_index[26:8]};
  DRAM1_ADR1_P  <= DRAM1_ADR0_P[33:8];
  DRAM1_ADR2_P  <= DRAM1_ADR1_P[33:8];
  DRAM1_ADR3_P  <= DRAM1_ADR2_P[33:8];
  DRAM1_ADR4_P  <= DRAM1_ADR3_P[33:8];
  DRAM1_ADR5_P  <= DRAM1_ADR4_P[33:8];
  DRAM1_DATA_02_6 <= io_dram1_data_02_6p[127:0];
  DRAM1_ECC_02_6 <= io_dram1_ecc_02_6p[15:0];
  DRAM2_WRITV_P <= {DRAM2_WRITV_P[5:0], dram2_wr_cas};
  DRAM2_READV_P <= {DRAM2_READV_P[5:0], dram2_rd_cas};
  DRAM2_CQWF_P  <= {DRAM2_CQWF_P[4:0], dram2_line[5]};
  DRAM2_PARITY_P<= {DRAM2_PARITY_P[5:0], dram2_adr_parity};
  DRAM2_ADR_HOLD<= dram2_adr;
//DRAM2_ADR0_P  <= (|dram2_blk_hit[4:3]) ? {dram2_blk_hit[4:0],                 dram2_adr  [29:8]} :
//                                         {dram2_blk_hit[4:0], dram2_way[5:0], dram2_index[23:8]};
//  DRAM2_ADR0_P  <=                         {                    dram2_way[5:0], dram2_index[26:8]};
  DRAM2_ADR0_P  <= {(^{dram2_adr[36:9],dram2_adr[6]}), dram2_way[5:0], dram2_index[26:8]};
  DRAM2_ADR1_P  <= DRAM2_ADR0_P[33:8];
  DRAM2_ADR2_P  <= DRAM2_ADR1_P[33:8];
  DRAM2_ADR3_P  <= DRAM2_ADR2_P[33:8];
  DRAM2_ADR4_P  <= DRAM2_ADR3_P[33:8];
  DRAM2_ADR5_P  <= DRAM2_ADR4_P[33:8];
  DRAM2_DATA_02_6 <= io_dram2_data_02_6p[127:0];
  DRAM2_ECC_02_6 <= io_dram2_ecc_02_6p[15:0];
  DRAM3_WRITV_P <= {DRAM3_WRITV_P[5:0], dram3_wr_cas};
  DRAM3_READV_P <= {DRAM3_READV_P[5:0], dram3_rd_cas};
  DRAM3_CQWF_P  <= {DRAM3_CQWF_P[4:0], dram3_line[5]};
  DRAM3_PARITY_P<= {DRAM3_PARITY_P[5:0], dram3_adr_parity};
  DRAM3_ADR_HOLD<= dram3_adr;
//DRAM3_ADR0_P  <= (|dram3_blk_hit[4:3]) ? {dram3_blk_hit[4:0],                 dram3_adr  [29:8]} :
//                                         {dram3_blk_hit[4:0], dram3_way[5:0], dram3_index[23:8]};
//  DRAM3_ADR0_P  <=                         {                    dram3_way[5:0], dram3_index[26:8]};
  DRAM3_ADR0_P  <= {(^{dram3_adr[36:9],dram3_adr[6]}), dram3_way[5:0], dram3_index[26:8]};
  DRAM3_ADR1_P  <= DRAM3_ADR0_P[33:8];
  DRAM3_ADR2_P  <= DRAM3_ADR1_P[33:8];
  DRAM3_ADR3_P  <= DRAM3_ADR2_P[33:8];
  DRAM3_ADR4_P  <= DRAM3_ADR3_P[33:8];
  DRAM3_ADR5_P  <= DRAM3_ADR4_P[33:8];
  DRAM3_DATA_02_6 <= io_dram3_data_02_6p[127:0];
  DRAM3_ECC_02_6 <= io_dram3_ecc_02_6p[15:0];
end

always @(negedge dramclk) begin
  io_dram0_data_inNR <= io_dram0_data_inN;
  io_dram1_data_inNR <= io_dram1_data_inN;
  io_dram2_data_inNR <= io_dram2_data_inN;
  io_dram3_data_inNR <= io_dram3_data_inN;
  io_dram0_ecc_inNR <= io_dram0_ecc_inN;
  io_dram1_ecc_inNR <= io_dram1_ecc_inN;
  io_dram2_ecc_inNR <= io_dram2_ecc_inN;
  io_dram3_ecc_inNR <= io_dram3_ecc_inN;

  DRAM0_READV5_N  <= DRAM0_READV_P[5];
  DRAM0_CQWF5_N   <= DRAM0_CQWF_P[5];
  DRAM0_PARITY5_N <= DRAM0_PARITY_P[5];
  DRAM0_PARITY6_N <= DRAM0_PARITY_P[6];
  DRAM0_ADR5_N    <= {(DRAM0_ADR5_P[33]),DRAM0_ADR5_P[32:8]};
  DRAM0_DATA_13_6 <= io_dram0_data_13_6p[127:0];
  DRAM0_ECC_13_6 <= io_dram0_ecc_13_6p[ 15:0];
  DRAM1_READV5_N  <= DRAM1_READV_P[5];
  DRAM1_CQWF5_N   <= DRAM1_CQWF_P[5];
  DRAM1_PARITY5_N <= DRAM1_PARITY_P[5];
  DRAM1_PARITY6_N <= DRAM1_PARITY_P[6];
  DRAM1_ADR5_N    <= {(DRAM1_ADR5_P[33]),DRAM1_ADR5_P[32:8]};
  DRAM1_DATA_13_6 <= io_dram1_data_13_6p[127:0];
  DRAM1_ECC_13_6 <= io_dram1_ecc_13_6p[ 15:0];
  DRAM2_READV5_N  <= DRAM2_READV_P[5];
  DRAM2_CQWF5_N   <= DRAM2_CQWF_P[5];
  DRAM2_PARITY5_N <= DRAM2_PARITY_P[5];
  DRAM2_PARITY6_N <= DRAM2_PARITY_P[6];
  DRAM2_ADR5_N    <= {(DRAM2_ADR5_P[33]),DRAM2_ADR5_P[32:8]};
  DRAM2_DATA_13_6 <= io_dram2_data_13_6p[127:0];
  DRAM2_ECC_13_6 <= io_dram2_ecc_13_6p[ 15:0];
  DRAM3_READV5_N  <= DRAM3_READV_P[5];
  DRAM3_CQWF5_N   <= DRAM3_CQWF_P[5];
  DRAM3_PARITY5_N <= DRAM3_PARITY_P[5];
  DRAM3_PARITY6_N <= DRAM3_PARITY_P[6];
  DRAM3_ADR5_N    <= {(DRAM3_ADR5_P[33]),DRAM3_ADR5_P[32:8]};
  DRAM3_DATA_13_6 <= io_dram3_data_13_6p[127:0];
  DRAM3_ECC_13_6 <= io_dram3_ecc_13_6p[ 15:0];
end

initial begin
  DRAM0_WRITV_P <= 7'h0;
  DRAM0_READV_P <= 6'h0;
  DRAM0_CQWF_P  <= 6'h0;
  DRAM0_PARITY_P<= 6'h0;
  DRAM0_PARITY_P<= 7'h0;
  DRAM0_ADR_HOLD<= 33'h0;
  DRAM0_ADR0_P  <= 25'h0;
  DRAM0_ADR1_P  <= 25'h0;
  DRAM0_ADR2_P  <= 25'h0;
  DRAM0_ADR3_P  <= 25'h0;
  DRAM0_ADR4_P  <= 25'h0;
  DRAM0_ADR5_P  <= 25'h0;
  DRAM0_DATA_02_6 <= 128'h0;
  DRAM0_READV5_N  <= 1'b0;
  DRAM0_CQWF5_N   <= 1'b0;
  DRAM0_PARITY5_N <= 1'b0;
  DRAM0_PARITY6_N <= 1'b0;
  DRAM0_ADR5_N    <= 26'h0;
  DRAM0_DATA_13_6 <= 128'h0;
  DRAM0_ECC_13_6 <= 16'h0;
  DRAM1_WRITV_P <= 7'h0;
  DRAM1_READV_P <= 6'h0;
  DRAM1_CQWF_P  <= 6'h0;
  DRAM1_PARITY_P<= 6'h0;
  DRAM1_ADR_HOLD<= 33'h0;
  DRAM1_ADR0_P  <= 26'h0;
  DRAM1_ADR1_P  <= 26'h0;
  DRAM1_ADR2_P  <= 26'h0;
  DRAM1_ADR3_P  <= 26'h0;
  DRAM1_ADR4_P  <= 26'h0;
  DRAM1_ADR5_P  <= 26'h0;
  DRAM1_DATA_02_6 <= 128'h0;
  DRAM1_READV5_N  <= 1'b0;
  DRAM1_CQWF5_N   <= 1'b0;
  DRAM1_PARITY5_N <= 1'b0;
  DRAM1_PARITY6_N <= 1'b0;
  DRAM1_ADR5_N    <= 26'h0;
  DRAM1_DATA_13_6 <= 128'h0;
  DRAM1_ECC_13_6 <= 16'h0;
  DRAM2_WRITV_P <= 7'h0;
  DRAM2_READV_P <= 6'h0;
  DRAM2_CQWF_P  <= 6'h0;
  DRAM2_PARITY_P<= 6'h0;
  DRAM2_ADR_HOLD<= 33'h0;
  DRAM2_ADR0_P  <= 26'h0;
  DRAM2_ADR1_P  <= 26'h0;
  DRAM2_ADR2_P  <= 26'h0;
  DRAM2_ADR3_P  <= 26'h0;
  DRAM2_ADR4_P  <= 26'h0;
  DRAM2_ADR5_P  <= 26'h0;
  DRAM2_DATA_02_6 <= 128'h0;
  DRAM2_READV5_N  <= 1'b0;
  DRAM2_CQWF5_N   <= 1'b0;
  DRAM2_PARITY5_N <= 1'b0;
  DRAM2_PARITY6_N <= 1'b0;
  DRAM2_ADR5_N    <= 26'h0;
  DRAM2_DATA_13_6 <= 128'h0;
  DRAM2_ECC_13_6 <= 16'h0;
  DRAM3_WRITV_P <= 7'h0;
  DRAM3_READV_P <= 6'h0;
  DRAM3_CQWF_P  <= 6'h0;
  DRAM3_PARITY_P<= 6'h0;
  DRAM3_ADR_HOLD<= 33'h0;
  DRAM3_ADR0_P  <= 26'h0;
  DRAM3_ADR1_P  <= 26'h0;
  DRAM3_ADR2_P  <= 26'h0;
  DRAM3_ADR3_P  <= 26'h0;
  DRAM3_ADR4_P  <= 26'h0;
  DRAM3_ADR5_P  <= 26'h0;
  DRAM3_DATA_02_6 <= 128'h0;
  DRAM3_READV5_N  <= 1'b0;
  DRAM3_CQWF5_N   <= 1'b0;
  DRAM3_PARITY5_N <= 1'b0;
  DRAM3_PARITY6_N <= 1'b0;
  DRAM3_ADR5_N    <= 26'h0;
  DRAM3_DATA_13_6 <= 128'h0;
  DRAM3_ECC_13_6 <= 16'h0;
  IO_DRAM0_DATA_VALID_NXT <= 1'b0;
  IO_DRAM1_DATA_VALID_NXT <= 1'b0;
  IO_DRAM2_DATA_VALID_NXT <= 1'b0;
  IO_DRAM3_DATA_VALID_NXT <= 1'b0;
end
//}}}  
assign   ssi_fix_delay[15:0] = (CTL_RAM[13] & 16'hffff); // Data Return delay on SSI bus


  endmodule 


