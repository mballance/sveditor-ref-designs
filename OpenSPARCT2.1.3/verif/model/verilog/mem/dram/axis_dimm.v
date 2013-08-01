// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_dimm.v
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
module n2_dimm (
		      CK0, bCK0, bCS0, bRAS0, bCAS0, bWE0,
		      BA0, Addr0, DQ0,DQS0,
		      CK1, bCK1, bCS1, bRAS1, bCAS1, bWE1,
		      BA1, Addr1, DQ1,DQS1,
		      CK2, bCK2, bCS2, bRAS2, bCAS2, bWE2,
		      BA2, Addr2, DQ2,DQS2,
		      CK3, bCK3, bCS3, bRAS3, bCAS3, bWE3,
		      BA3, Addr3, DQ3, DQS3

		      );
/*{{{  */
`ifdef DRAM_SAT 
   parameter addr_bits=15;
`else
   parameter addr_bits=17;
`endif

`ifdef DRAM_BANK_BITS2
   parameter bank_bits=2;
`else
   parameter bank_bits=3;
`endif
   parameter data_bits=144;
/*}}}  */

   input                        CK0,bCK0;                 // Clock Signals
   input [17:0]                 bCS0;                    // Rank/Chip Selects
   input [17:0]                 bRAS0, bCAS0, bWE0;        // Command Inputs
   input [(bank_bits-1):0]      BA0;                     // Address Inputs (Bank sel)
   input [(addr_bits-1):0]      Addr0;                   // Address Inputs
   inout [(data_bits-1):0]      DQ0;                     // Data Bus
   output                       DQS0;                    // strobe


   input                        CK1,bCK1;                 // Clock Signals
   input [17:0]                 bCS1;                    // Rank/Chip Selects
   input [17:0]                 bRAS1, bCAS1, bWE1;        // Command Inputs
   input [(bank_bits-1):0]      BA1;                     // Address Inputs (Bank sel)
   input [(addr_bits-1):0]      Addr1;                   // Address Inputs
   inout [(data_bits-1):0]      DQ1;                     // Data Bus
   output                       DQS1;                    // strobe

   input                        CK2,bCK2;                 // Clock Signals
   input [17:0]                 bCS2;                    // Rank/Chip Selects
   input [17:0]                 bRAS2, bCAS2, bWE2;        // Command Inputs
   input [(bank_bits-1):0]      BA2;                     // Address Inputs (Bank sel)
   input [(addr_bits-1):0]      Addr2;                   // Address Inputs
   inout [(data_bits-1):0]      DQ2;                     // Data Bus
   output                       DQS2;                    // strobe

   input                        CK3,bCK3;                 // Clock Signals
   input [17:0]                 bCS3;                    // Rank/Chip Selects
   input [17:0]                 bRAS3, bCAS3, bWE3;        // Command Inputs
   input [(bank_bits-1):0]      BA3;                     // Address Inputs (Bank sel)
   input [(addr_bits-1):0]      Addr3;                   // Address Inputs
   inout [(data_bits-1):0]      DQ3;                     // Data Bus
   output                       DQS3;                    // strobe





wire    [14:0]  dram0_io_addr;        // From dram02 of dram.v
wire    [2:0]   dram0_io_bank;        // From dram02 of dram.v
wire            dram0_io_cas_l;       // From dram02 of dram.v
wire    [3:0]   dram0_io_cs_l;        // From dram02 of dram.v
wire    [287:0] dram0_io_data_out;    // From dram02 of dram.v
wire            dram0_io_ras_l;       // From dram02 of dram.v
wire            dram0_io_write_en_l;  // From dram02 of dram.v

wire    [14:0]  dram1_io_addr;        // From dram13 of dram.v
wire    [2:0]   dram1_io_bank;        // From dram13 of dram.v
wire            dram1_io_cas_l;       // From dram13 of dram.v
wire    [3:0]   dram1_io_cs_l;        // From dram13 of dram.v
wire    [287:0] dram1_io_data_out;    // From dram13 of dram.v
wire            dram1_io_ras_l;       // From dram13 of dram.v
wire            dram1_io_write_en_l;  // From dram13 of dram.v

wire    [14:0]  dram2_io_addr;        // From dram02 of dram.v
wire    [2:0]   dram2_io_bank;        // From dram02 of dram.v
wire            dram2_io_cas_l;       // From dram02 of dram.v
wire    [3:0]   dram2_io_cs_l;        // From dram02 of dram.v
wire    [287:0] dram2_io_data_out;    // From dram02 of dram.v
wire            dram2_io_ras_l;       // From dram02 of dram.v
wire            dram2_io_write_en_l;  // From dram02 of dram.v

wire    [14:0]  dram3_io_addr;        // From dram13 of dram.v
wire    [2:0]   dram3_io_bank;        // From dram13 of dram.v
wire            dram3_io_cas_l;       // From dram13 of dram.v
wire    [3:0]   dram3_io_cs_l;        // From dram13 of dram.v
wire    [287:0] dram3_io_data_out;    // From dram13 of dram.v
wire            dram3_io_ras_l;       // From dram13 of dram.v
wire            dram3_io_write_en_l;  // From dram13 of dram.v
wire            dramclk;

wire            jbi_io_ssi_mosi;      // Master out slave in to pad.
wire            reset;
wire            ssiclk;


assign dram0_io_addr = Addr0;
assign dram1_io_addr = Addr1;
assign dram2_io_addr = Addr2;
assign dram3_io_addr = Addr3;

assign dram0_io_bank = BA0;
assign dram1_io_bank = BA1;
assign dram2_io_bank = BA2;
assign dram3_io_bank = BA3;

assign dram0_io_cas_l = bCAS0;
assign dram1_io_cas_l = bCAS1;
assign dram2_io_cas_l = bCAS2;
assign dram3_io_cas_l = bCAS3;

assign dram0_io_ras_l = bRAS0;
assign dram1_io_ras_l = bRAS1;
assign dram2_io_ras_l = bRAS2;
assign dram3_io_ras_l = bRAS3;

assign dram0_io_cs_l = bCS0;
assign dram2_io_cs_l = bCS1;
assign dram3_io_cs_l = bCS2;
assign dram3_io_cs_l = bCS3;

assign dram0_io_write_en_l = bWE0;
assign dram1_io_write_en_l = bWE1;
assign dram2_io_write_en_l = bWE2;
assign dram3_io_write_en_l = bWE3;


reg      data_delay;
wire    [255:0] io_dram0_data_in;     // To dram02 of dram.v
wire            io_dram0_data_valid;  // To dram02 of dram.v
wire    [31:0]  io_dram0_ecc_in;      // To dram02 of dram.v
wire    [255:0] io_dram1_data_in;     // To dram13 of dram.v
wire            io_dram1_data_valid;  // To dram13 of dram.v
wire    [31:0]  io_dram1_ecc_in;      // To dram13 of dram.v
wire    [255:0] io_dram2_data_in;     // To dram02 of dram.v
wire            io_dram2_data_valid;  // To dram02 of dram.v
wire    [31:0]  io_dram2_ecc_in;      // To dram02 of dram.v
wire    [255:0] io_dram3_data_in;     // To dram13 of dram.v
wire            io_dram3_data_valid;  // To dram13 of dram.v
wire    [31:0]  io_dram3_ecc_in;      // To dram13 of dram.v
wire            io_jbi_ssi_miso;      // Master in slave out from pad.

reg [(data_bits-1):0] ddr_data0;
reg [(data_bits-1):0] ddr_data1;
reg [(data_bits-1):0] ddr_data2;
reg [(data_bits-1):0] ddr_data3;
reg dram0_data_valid_d;
reg dram1_data_valid_d;
reg dram2_data_valid_d;
reg dram3_data_valid_d;
wire dram0_data_valid = dram0_data_valid_d | io_dram0_data_valid;
wire dram1_data_valid = dram1_data_valid_d | io_dram1_data_valid;
wire dram2_data_valid = dram2_data_valid_d | io_dram2_data_valid;
wire dram3_data_valid = dram3_data_valid_d | io_dram3_data_valid;

reg dram0_data_valid_e;
reg dram1_data_valid_e;
reg dram2_data_valid_e;
reg dram3_data_valid_e;
`ifdef AXIS_EMUL_COSIM_old_code
/*{{{  works for targetless*/
always @(negedge dramclk) begin
 dram0_data_valid_e = dimm.DRAM0_READV_P[5] | io_dram0_data_valid;
 dram1_data_valid_e = dimm.DRAM1_READV_P[5] | io_dram1_data_valid;
 dram2_data_valid_e = dimm.DRAM2_READV_P[5] | io_dram2_data_valid;
 dram3_data_valid_e = dimm.DRAM3_READV_P[5] | io_dram3_data_valid;
end
assign DQS0 = dram0_data_valid_e ? ~dramclk : 1'bz;
assign DQS1 = dram1_data_valid_e ? ~dramclk : 1'bz;
assign DQS2 = dram2_data_valid_e ? ~dramclk : 1'bz;
assign DQS3 = dram3_data_valid_e ? ~dramclk : 1'bz;
/*}}}  */
`else
/*{{{  works for software*/
/*
wire DQS0_e = (io_dram0_data_valid | dram0_data_valid_d) ? dramclk : 1'bz;
wire DQS1_e = (io_dram1_data_valid | dram1_data_valid_d) ? dramclk : 1'bz;
wire DQS2_e = (io_dram2_data_valid | dram2_data_valid_d) ? dramclk : 1'bz;
wire DQS3_e = (io_dram3_data_valid | dram3_data_valid_d) ? dramclk : 1'bz;
*/
reg DQS0_d;
reg DQS1_d;
reg DQS2_d;
reg DQS3_d;
reg DQS0_dd;
reg DQS1_dd;
reg DQS2_dd;
reg DQS3_dd;
reg dqs0_vl;
reg dqs1_vl;
reg dqs2_vl;
reg dqs3_vl;
reg dqs0_vl_d;
reg dqs1_vl_d;
reg dqs2_vl_d;
reg dqs3_vl_d;

always @ (posedge tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.dram_2x_clk) begin
  DQS0_dd <= DQS0_d;
  DQS1_dd <= DQS1_d;
  DQS2_dd <= DQS2_d;
  DQS3_dd <= DQS3_d;
  dqs0_vl_d = dqs0_vl|io_dram0_data_valid;
  dqs1_vl_d = dqs1_vl|io_dram1_data_valid;
  dqs2_vl_d = dqs2_vl|io_dram2_data_valid;
  dqs3_vl_d = dqs3_vl|io_dram3_data_valid;
end
always @ (CK0) begin
  dqs0_vl <= (io_dram0_data_valid | dram0_data_valid_d);
  dqs1_vl <= (io_dram1_data_valid | dram1_data_valid_d);
  dqs2_vl <= (io_dram2_data_valid | dram2_data_valid_d);
  dqs3_vl <= (io_dram3_data_valid | dram3_data_valid_d);
  DQS0_d <= ~CK0 & (io_dram0_data_valid | dram0_data_valid_d);
  DQS1_d <= ~CK1 & (io_dram1_data_valid | dram1_data_valid_d);
  DQS2_d <= ~CK2 & (io_dram2_data_valid | dram2_data_valid_d);
  DQS3_d <= ~CK3 & (io_dram3_data_valid | dram3_data_valid_d);
end
assign DQS0=dqs0_vl_d ? DQS0_dd:1'bz;
assign DQS1=dqs1_vl_d ? DQS1_dd:1'bz;
assign DQS2=dqs2_vl_d ? DQS2_dd:1'bz;
assign DQS3=dqs3_vl_d ? DQS3_dd:1'bz;
/*}}}  */
`endif
always @(posedge dramclk) begin
  dram0_data_valid_d = io_dram0_data_valid;
  dram1_data_valid_d = io_dram1_data_valid;
  dram2_data_valid_d = io_dram2_data_valid;
  dram3_data_valid_d = io_dram3_data_valid;
end
always @(negedge dramclk) begin
  ddr_data0=DQ0;
  ddr_data1=DQ1;
  ddr_data2=DQ2;
  ddr_data3=DQ3;
end
assign dramclk=CK0;

/*ecc,ecc,data,data,ecc,ecc,data,data*/
/*{{{  */
assign dram0_io_data_out= {
			   DQ0[71:56],
			   DQ0[55:0],
			   DQ0[143:72],

			   ddr_data0[71:56],
			   ddr_data0[55:0],
			   ddr_data0[143:72]
			   };
/*}}}  */
/*{{{  */
assign dram1_io_data_out= {
			   DQ1[71:56],
			   DQ1[55:0],
			   DQ1[143:72],
			   ddr_data1[71:56],
			   ddr_data1[55:0],
			   ddr_data1[143:72]
			   };
/*}}}  */
/*{{{  */
assign dram2_io_data_out= {
			   DQ2[71:56],
			   DQ2[55:0],
			   DQ2[143:72],
			   ddr_data2[71:56],
			   ddr_data2[55:0],
			   ddr_data2[143:72]
			   };
/*}}}  */
/*{{{  */
assign dram3_io_data_out= {
			   DQ3[71:56],
			   DQ3[55:0],
			   DQ3[143:72],
			   ddr_data3[71:56],
			   ddr_data3[55:0],
			   ddr_data3[143:72]
			   };
/*}}}  */

/*{{{  old*/
/*
assign DQ0_t = (dram0_data_valid & bCK0) ? {io_dram0_data_in[63+8:0]   , io_dram0_ecc_in[15:0 ], io_dram0_data_in[127:64+8]   } : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
assign DQ0_t = (dram0_data_valid & CK0)  ? {io_dram0_data_in[191+8:128], io_dram0_ecc_in[31:16], io_dram0_data_in[255:192+8]} : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;

assign DQ1_t = (dram1_data_valid & bCK1) ? {io_dram1_data_in[63+8:0]  , io_dram1_ecc_in[15:0 ], io_dram1_data_in[127:64+8] } : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
assign DQ1_t = (dram1_data_valid & CK1)  ? {io_dram1_data_in[191+8:128], io_dram1_ecc_in[31:16], io_dram1_data_in[255:192+8]} : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;

assign DQ2_t = (dram2_data_valid & bCK2) ? {io_dram2_data_in[63+8:0]  , io_dram2_ecc_in[15:0 ], io_dram2_data_in[127:64+8] } : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
assign DQ2_t = (dram2_data_valid & CK2)  ? {io_dram2_data_in[191+8:128], io_dram2_ecc_in[31:16], io_dram2_data_in[255:192+8]} : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;

assign DQ3_t = (dram3_data_valid & bCK3) ? {io_dram3_data_in[63+8:0] , io_dram3_ecc_in[15:0 ], io_dram3_data_in[127:64+8]   } : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
assign DQ3_t = (dram3_data_valid & CK3) ? { io_dram3_data_in[191+8:128], io_dram3_ecc_in[31:16], io_dram3_data_in[255:192+8] } : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
*/
/*}}}  */
/*{{{  */

wire [(data_bits-1):0] DQ0_th = {io_dram0_data_in[63+8:0]   , io_dram0_ecc_in[15:0 ], io_dram0_data_in[127:64+8]   }   ;
wire [(data_bits-1):0] DQ0_tl = {io_dram0_data_in[191+8:128], io_dram0_ecc_in[31:16], io_dram0_data_in[255:192+8]}     ;

wire [(data_bits-1):0] DQ1_th = {io_dram1_data_in[63+8:0]  , io_dram1_ecc_in[15:0 ], io_dram1_data_in[127:64+8] }      ;
wire [(data_bits-1):0] DQ1_tl = {io_dram1_data_in[191+8:128], io_dram1_ecc_in[31:16], io_dram1_data_in[255:192+8]}     ;

wire [(data_bits-1):0] DQ2_th = {io_dram2_data_in[63+8:0]  , io_dram2_ecc_in[15:0 ], io_dram2_data_in[127:64+8] }      ;
wire [(data_bits-1):0] DQ2_tl = {io_dram2_data_in[191+8:128], io_dram2_ecc_in[31:16], io_dram2_data_in[255:192+8]}     ;

wire [(data_bits-1):0] DQ3_th = {io_dram3_data_in[63+8:0] , io_dram3_ecc_in[15:0 ], io_dram3_data_in[127:64+8]   }     ;
wire [(data_bits-1):0] DQ3_tl = { io_dram3_data_in[191+8:128], io_dram3_ecc_in[31:16], io_dram3_data_in[255:192+8] }   ;
/*}}}  */
/*{{{  */
reg [(data_bits-1):0]      DQ0_r;
reg dq0_vl;
reg dq0_vlr;
assign DQ0=dq0_vlr ? DQ0_r : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
reg [(data_bits-1):0]      DQ1_r;
reg dq1_vl;
reg dq1_vlr;
assign DQ1=dq1_vlr ? DQ1_r : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
reg [(data_bits-1):0]      DQ2_r;
reg dq2_vl;
reg dq2_vlr;
assign DQ2=dq2_vlr ? DQ2_r : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
reg [(data_bits-1):0]      DQ3_r;
reg dq3_vl;
reg dq3_vlr;
assign DQ3=dq3_vlr ? DQ3_r : 144'hzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
always @ (negedge tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.dram_2x_clk) begin
  dq0_vlr=dq0_vl;
  dq0_vl=dram0_data_valid;
  if (CK0) DQ0_r=DQ0_th; else DQ0_r=DQ0_tl;
end
always @ (negedge tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.dram_2x_clk) begin
  dq1_vlr=dq1_vl;
  dq1_vl=dram1_data_valid;
  if (CK1) DQ1_r=DQ1_th; else DQ1_r=DQ1_tl;
end
always @ (negedge tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.dram_2x_clk) begin
  dq2_vlr=dq2_vl;
  dq2_vl=dram2_data_valid;
  if (CK2) DQ2_r=DQ2_th; else DQ2_r=DQ2_tl;
end
always @ (negedge tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.dram_2x_clk) begin
  dq3_vlr=dq3_vl;
  dq3_vl=dram3_data_valid;
  if (CK3) DQ3_r=DQ3_th; else DQ3_r=DQ3_tl;
end



/*}}}  */

cmp_sat dimm (
    .dram0_io_addr       (dram0_io_addr[14:0]),      // wire   (dimm) <= ()
    .dram0_io_bank       (dram0_io_bank[2:0]),       // wire   (dimm) <= ()
    .dram0_io_cas_l      (dram0_io_cas_l),           // wire   (dimm) <= ()
    .dram0_io_cs_l       (dram0_io_cs_l[3:0]),       // wire   (dimm) <= ()
    .dram0_io_data_out   (dram0_io_data_out[287:0]), // wire   (dimm) <= ()
    .dram0_io_ras_l      (dram0_io_ras_l),           // wire   (dimm) <= ()
    .dram0_io_write_en_l (dram0_io_write_en_l),      // wire   (dimm) <= ()
    .dram1_io_addr       (dram1_io_addr[14:0]),      // wire   (dimm) <= ()
    .dram1_io_bank       (dram1_io_bank[2:0]),       // wire   (dimm) <= ()
    .dram1_io_cas_l      (dram1_io_cas_l),           // wire   (dimm) <= ()
    .dram1_io_cs_l       (dram1_io_cs_l[3:0]),       // wire   (dimm) <= ()
    .dram1_io_data_out   (dram1_io_data_out[287:0]), // wire   (dimm) <= ()
    .dram1_io_ras_l      (dram1_io_ras_l),           // wire   (dimm) <= ()
    .dram1_io_write_en_l (dram1_io_write_en_l),      // wire   (dimm) <= ()
    .dram2_io_addr       (dram2_io_addr[14:0]),      // wire   (dimm) <= ()
    .dram2_io_bank       (dram2_io_bank[2:0]),       // wire   (dimm) <= ()
    .dram2_io_cas_l      (dram2_io_cas_l),           // wire   (dimm) <= ()
    .dram2_io_cs_l       (dram2_io_cs_l[3:0]),       // wire   (dimm) <= ()
    .dram2_io_data_out   (dram2_io_data_out[287:0]), // wire   (dimm) <= ()
    .dram2_io_ras_l      (dram2_io_ras_l),           // wire   (dimm) <= ()
    .dram2_io_write_en_l (dram2_io_write_en_l),      // wire   (dimm) <= ()
    .dram3_io_addr       (dram3_io_addr[14:0]),      // wire   (dimm) <= ()
    .dram3_io_bank       (dram3_io_bank[2:0]),       // wire   (dimm) <= ()
    .dram3_io_cas_l      (dram3_io_cas_l),           // wire   (dimm) <= ()
    .dram3_io_cs_l       (dram3_io_cs_l[3:0]),       // wire   (dimm) <= ()
    .dram3_io_data_out   (dram3_io_data_out[287:0]), // wire   (dimm) <= ()
    .dram3_io_ras_l      (dram3_io_ras_l),           // wire   (dimm) <= ()
    .dram3_io_write_en_l (dram3_io_write_en_l),      // wire   (dimm) <= ()
    .jbi_io_ssi_mosi     (jbi_io_ssi_mosi),          // wire   (dimm) <= ()
    .io_jbi_ssi_miso     (io_jbi_ssi_miso),          // output (dimm) => ()
    .io_dram0_data_in    (io_dram0_data_in[255:0]),  // output (dimm) => ()
    .io_dram0_data_valid (io_dram0_data_valid),      // output (dimm) => ()
    .io_dram0_ecc_in     (io_dram0_ecc_in[31:0]),    // output (dimm) => ()
    .io_dram1_data_in    (io_dram1_data_in[255:0]),  // output (dimm) => ()
    .io_dram1_data_valid (io_dram1_data_valid),      // output (dimm) => ()
    .io_dram1_ecc_in     (io_dram1_ecc_in[31:0]),    // output (dimm) => ()
    .io_dram2_data_in    (io_dram2_data_in[255:0]),  // output (dimm) => ()
    .io_dram2_data_valid (io_dram2_data_valid),      // output (dimm) => ()
    .io_dram2_ecc_in     (io_dram2_ecc_in[31:0]),    // output (dimm) => ()
    .io_dram3_data_in    (io_dram3_data_in[255:0]),  // output (dimm) => ()
    .io_dram3_data_valid (io_dram3_data_valid),      // output (dimm) => ()
    .io_dram3_ecc_in     (io_dram3_ecc_in[31:0]),    // output (dimm) => ()
    .dramclk             (dramclk),                  // wire   (dimm) <= ()
    .ssiclk              (ssiclk),                   // wire   (dimm) <= ()
    .reset               (reset)                     // wire   (dimm) <= ()
    );
`ifdef MCUSAT
assign jbi_io_ssi_mosi = 1'b0;
assign ssiclk = dramclk;
`else
assign tb_top.cpu.SSI_MISO = io_jbi_ssi_miso;
assign jbi_io_ssi_mosi = tb_top.cpu.SSI_MOSI;
assign ssiclk = cpu.ncu.ncu_mio_ssi_sck;
`endif
reg reset_reg;
reg reset_reg_d;
reg dram_init_done;
initial reset_reg=1'b1;
initial reset_reg_d=1'b1;
initial dram_init_done=1'b0;
always @ (posedge dramclk)
  dram_init_done = 1'b1;

`ifdef MCUSAT
always @ (posedge cpu.mcu.gclk) begin
  reset_reg_d <= reset_reg;
  reset_reg <= cpu.mcu.tcu_aclk;
`else
always @ (posedge ssiclk) begin
  reset_reg_d <= reset_reg;
  reset_reg <= ~ tb_top.flush_reset_complete;
`endif
end
assign reset = reset_reg_d;
reg  loaded;
initial  loaded=1'b0;
initial begin
  data_delay=1'b0;
`ifdef PALLADIUM
`else
  #3 ;
`endif

  $readmemh("include/cmp_mask", dimm.CTL_RAM);
//end
//always@ (posedge tb_top.SYSCLK) begin
//  if (tb_top.PWRON_RST_L == 1'b0)
//    loaded<=1'b0;
//  else if (tb_top.PWRON_RST_L == 1'b1 && !loaded) begin
//    loaded <=1'b1;
//    begin // axis tbcall_region //
      /*{{{  load dir*/
      $readmemh("dram_init/dir0", dimm.dir0.DRAM_DIR);
      $readmemh("dram_init/dir1", dimm.dir1.DRAM_DIR);
      $readmemh("dram_init/dir2", dimm.dir2.DRAM_DIR);
      $readmemh("dram_init/dir3", dimm.dir3.DRAM_DIR);
      $readmemh("dram_init/dir4", dimm.dir4.DRAM_DIR);
      $readmemh("dram_init/dir5", dimm.dir5.DRAM_DIR);
      $readmemh("dram_init/dir6", dimm.dir6.DRAM_DIR);
      $readmemh("dram_init/dir7", dimm.dir7.DRAM_DIR);
      $readmemh("dram_init/dir8", dimm.dir8.DRAM_DIR);
      $readmemh("dram_init/dir9", dimm.dir9.DRAM_DIR);
      $readmemh("dram_init/dira", dimm.dira.DRAM_DIR);
      $readmemh("dram_init/dirb", dimm.dirb.DRAM_DIR);
      $readmemh("dram_init/dirc", dimm.dirc.DRAM_DIR);
      $readmemh("dram_init/dird", dimm.dird.DRAM_DIR);
      $readmemh("dram_init/dire", dimm.dire.DRAM_DIR);
      $readmemh("dram_init/dirf", dimm.dirf.DRAM_DIR);
      $readmemh("dram_init/dir10", dimm.dir10.DRAM_DIR);
      $readmemh("dram_init/dir11", dimm.dir11.DRAM_DIR);
      $readmemh("dram_init/dir12", dimm.dir12.DRAM_DIR);
      $readmemh("dram_init/dir13", dimm.dir13.DRAM_DIR);
      $readmemh("dram_init/dir14", dimm.dir14.DRAM_DIR);
      $readmemh("dram_init/dir15", dimm.dir15.DRAM_DIR);
      $readmemh("dram_init/dir16", dimm.dir16.DRAM_DIR);
      $readmemh("dram_init/dir17", dimm.dir17.DRAM_DIR);
      $readmemh("dram_init/dir18", dimm.dir18.DRAM_DIR);
      $readmemh("dram_init/dir19", dimm.dir19.DRAM_DIR);
      $readmemh("dram_init/dir1a", dimm.dir1a.DRAM_DIR);
      $readmemh("dram_init/dir1b", dimm.dir1b.DRAM_DIR);
      $readmemh("dram_init/dir1c", dimm.dir1c.DRAM_DIR);
      $readmemh("dram_init/dir1d", dimm.dir1d.DRAM_DIR);
      $readmemh("dram_init/dir1e", dimm.dir1e.DRAM_DIR);
      $readmemh("dram_init/dir1f", dimm.dir1f.DRAM_DIR);
      $readmemh("dram_init/dir20", dimm.dir20.DRAM_DIR);
      $readmemh("dram_init/dir21", dimm.dir21.DRAM_DIR);
      $readmemh("dram_init/dir22", dimm.dir22.DRAM_DIR);
      $readmemh("dram_init/dir23", dimm.dir23.DRAM_DIR);
      $readmemh("dram_init/dir24", dimm.dir24.DRAM_DIR);
      $readmemh("dram_init/dir25", dimm.dir25.DRAM_DIR);
      $readmemh("dram_init/dir26", dimm.dir26.DRAM_DIR);
      $readmemh("dram_init/dir27", dimm.dir27.DRAM_DIR);
      $readmemh("dram_init/dir28", dimm.dir28.DRAM_DIR);
      $readmemh("dram_init/dir29", dimm.dir29.DRAM_DIR);
      $readmemh("dram_init/dir2a", dimm.dir2a.DRAM_DIR);
      $readmemh("dram_init/dir2b", dimm.dir2b.DRAM_DIR);
      $readmemh("dram_init/dir2c", dimm.dir2c.DRAM_DIR);
      $readmemh("dram_init/dir2d", dimm.dir2d.DRAM_DIR);
      $readmemh("dram_init/dir2e", dimm.dir2e.DRAM_DIR);
      $readmemh("dram_init/dir2f", dimm.dir2f.DRAM_DIR);
      $readmemh("dram_init/dir30", dimm.dir30.DRAM_DIR);
      $readmemh("dram_init/dir31", dimm.dir31.DRAM_DIR);
      $readmemh("dram_init/dir32", dimm.dir32.DRAM_DIR);
      $readmemh("dram_init/dir33", dimm.dir33.DRAM_DIR);
      $readmemh("dram_init/dir34", dimm.dir34.DRAM_DIR);
      $readmemh("dram_init/dir35", dimm.dir35.DRAM_DIR);
      $readmemh("dram_init/dir36", dimm.dir36.DRAM_DIR);
      $readmemh("dram_init/dir37", dimm.dir37.DRAM_DIR);
      $readmemh("dram_init/dir38", dimm.dir38.DRAM_DIR);
      $readmemh("dram_init/dir39", dimm.dir39.DRAM_DIR);
      $readmemh("dram_init/dir3a", dimm.dir3a.DRAM_DIR);
      $readmemh("dram_init/dir3b", dimm.dir3b.DRAM_DIR);
      $readmemh("dram_init/dir3c", dimm.dir3c.DRAM_DIR);
      $readmemh("dram_init/dir3d", dimm.dir3d.DRAM_DIR);
      $readmemh("dram_init/dir3e", dimm.dir3e.DRAM_DIR);
      $readmemh("dram_init/dir3f", dimm.dir3f.DRAM_DIR);
      /*}}}  */
      /*{{{  load data*/
      // $readmemh("include/CONSOLE_RAM", dimm.rf2x32.REGF2X32);
       $display("loading axis memories now"); $fflush(1);
      `ifdef BLK_4GIG
      /*{{{  load drams*/
	$readmemh("dram_init/dram0_1",dimm.dram0.DRAM);
	$readmemh("dram_init/dram1_1",dimm.dram1.DRAM);
	$readmemh("dram_init/dram2_1",dimm.dram2.DRAM);
	$readmemh("dram_init/dram3_1",dimm.dram3.DRAM);
	$readmemh("dram_init/dram4_1",dimm.dram4.DRAM);
	$readmemh("dram_init/dram5_1",dimm.dram5.DRAM);
	$readmemh("dram_init/dram6_1",dimm.dram6.DRAM);
	$readmemh("dram_init/dram7_1",dimm.dram7.DRAM);
	$readmemh("dram_init/dram8_1",dimm.dram8.DRAM);
	$readmemh("dram_init/dram9_1",dimm.dram9.DRAM);
	$readmemh("dram_init/drama_1",dimm.drama.DRAM);
	$readmemh("dram_init/dramb_1",dimm.dramb.DRAM);
	$readmemh("dram_init/dramc_1",dimm.dramc.DRAM);
	$readmemh("dram_init/dramd_1",dimm.dramd.DRAM);
	$readmemh("dram_init/drame_1",dimm.drame.DRAM);
	$readmemh("dram_init/dramf_1",dimm.dramf.DRAM);
      /*}}}  */
      /*{{{  load drams*/
	$readmemh("dram_init/dram0",dimm.dram0.DRAM1);
	$readmemh("dram_init/dram1",dimm.dram1.DRAM1);
	$readmemh("dram_init/dram2",dimm.dram2.DRAM1);
	$readmemh("dram_init/dram3",dimm.dram3.DRAM1);
	$readmemh("dram_init/dram4",dimm.dram4.DRAM1);
	$readmemh("dram_init/dram5",dimm.dram5.DRAM1);
	$readmemh("dram_init/dram6",dimm.dram6.DRAM1);
	$readmemh("dram_init/dram7",dimm.dram7.DRAM1);
	$readmemh("dram_init/dram8",dimm.dram8.DRAM1);
	$readmemh("dram_init/dram9",dimm.dram9.DRAM1);
	$readmemh("dram_init/drama",dimm.drama.DRAM1);
	$readmemh("dram_init/dramb",dimm.dramb.DRAM1);
	$readmemh("dram_init/dramc",dimm.dramc.DRAM1);
	$readmemh("dram_init/dramd",dimm.dramd.DRAM1);
	$readmemh("dram_init/drame",dimm.drame.DRAM1);
	$readmemh("dram_init/dramf",dimm.dramf.DRAM1);
      /*}}}  */
      `else
       $readmemh("dram_init/dram0", dimm.dram0.DRAM);
       $readmemh("dram_init/dram1", dimm.dram1.DRAM);
       $readmemh("dram_init/dram2", dimm.dram2.DRAM);
       $readmemh("dram_init/dram3", dimm.dram3.DRAM);
       $readmemh("dram_init/dram4", dimm.dram4.DRAM);
       $readmemh("dram_init/dram5", dimm.dram5.DRAM);
       $readmemh("dram_init/dram6", dimm.dram6.DRAM);
       $readmemh("dram_init/dram7", dimm.dram7.DRAM);
       $readmemh("dram_init/dram8", dimm.dram8.DRAM);
       $readmemh("dram_init/dram9", dimm.dram9.DRAM);
       $readmemh("dram_init/drama", dimm.drama.DRAM);
       $readmemh("dram_init/dramb", dimm.dramb.DRAM);
       $readmemh("dram_init/dramc", dimm.dramc.DRAM);
       $readmemh("dram_init/dramd", dimm.dramd.DRAM);
       $readmemh("dram_init/drame", dimm.drame.DRAM);
       $readmemh("dram_init/dramf", dimm.dramf.DRAM);
      `endif
       $display("done loading axis memories"); $fflush(1);
      /*}}}  */
//    end
//  end
end
endmodule
// VPERL: GENERATED_END
