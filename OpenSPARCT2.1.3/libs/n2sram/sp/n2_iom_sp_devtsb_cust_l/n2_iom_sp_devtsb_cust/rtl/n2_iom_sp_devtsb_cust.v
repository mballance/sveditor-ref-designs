// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_iom_sp_devtsb_cust.v
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
module n2_iom_sp_devtsb_cust  (
   // clocks, scan
   clk,
   scan_in,
   tcu_se_scancollar_in,
   tcu_scan_en,
   tcu_pce_ov,
   pce,
   tcu_aclk,
   tcu_bclk,
   tcu_array_wr_inhibit,
   scan_out,

// efu inputs
   efu_bits,

   // ram control
   dev_rd,
   adr_r,
   tsb_rd,
   lkup_en,
   adr_bs,
   dev_wr,
   adr_w,
   tsb_wr,
   din,
   dout,
   tsb_adr_r

);


   // clocks, scan
   input                clk;                    // io clock
   input                scan_in;                //
   input                tcu_se_scancollar_in;   //
   input                tcu_scan_en;   		//
   input                tcu_pce_ov;             // scan signals
   input                pce;           		//
   input                tcu_aclk;               //
   input                tcu_bclk;               //
   input                tcu_array_wr_inhibit;   //
   output               scan_out;               //
   input  [3:0]         efu_bits;        // efu inputs to adjust access time


   input	 dev_rd;                        // Read enable for DEV RAM read port
   input  [4:0]  adr_r;                         // Address for read port
   input	 tsb_rd;                        // Read enable for TSB RAM read port
   input	 lkup_en;                       // Lookup process enable
   input  [2:0]  adr_bs;
   input	 dev_wr;                        // Write enable for DEV RAM write port
   input  [4:0]  adr_w;                         // Address for write port
   input   	 tsb_wr;                        // Write enable for TSB RAM write port
   input  [63:0] din;
   output [63:0] dout;
   output [4:0] tsb_adr_r;


  //------------------------------------------------------------------------
  //  checker for read/write exclusivity
  //------------------------------------------------------------------------
wire [1:0]	dev_rw,tsb_rw;
assign	dev_rw[1:0]	= {dev_rd,dev_wr};
assign	tsb_rw[1:0]	= {tsb_rd,tsb_wr};
// 0in bits_on -var dev_rw -max 1
// 0in bits_on -var tsb_rw -max 1
  //------------------------------------------------------------------------
  //  scan chain connections
  //------------------------------------------------------------------------
// scan renames
wire    [1:0] siclk,soclk;
wire    se,wr_inhibit,and_clk;
assign  wr_inhibit      =       tcu_array_wr_inhibit;
// end scan
  //------------------------------------------------------------------------
  //  instantiate clock headers
  //------------------------------------------------------------------------
wire [1:0]      collar_clk;
wire pce_ov = tcu_pce_ov;
wire stop   = 1'b0;
wire aclk   = tcu_aclk;
wire bclk   = tcu_bclk;
assign se = tcu_se_scancollar_in;       // TEMP

cl_dp1_l1hdr_8x clk_hdr_cntl (
        .l2clk(clk),
        .pce (pce),
        .l1clk(collar_clk[0]),
        .siclk_out(siclk[0]),
        .soclk_out(soclk[0]),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .aclk(aclk),
  .bclk(bclk)
);

cl_dp1_l1hdr_8x clk_hdr_data1 (
        .l2clk(clk),
        .pce (pce),
        .l1clk(collar_clk[1]),
        .siclk_out(siclk[1]),
        .soclk_out(soclk[1]),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .aclk(aclk),
  .bclk(bclk)
);

cl_dp1_l1hdr_8x scan_en_hdr (
        .l2clk(clk),
        .pce (pce),
        .l1clk(and_clk),
        .siclk_out(),
        .soclk_out(),
  .se(tcu_scan_en),
  .pce_ov(pce_ov),
  .stop(stop),
  .aclk(aclk),
  .bclk(bclk)
);



  //------------------------------------------------------------------------
  //  input flops
  //------------------------------------------------------------------------
wire    [4:0]   r_adr_r,rd_addr_so;
wire    [4:0]   r_adr_w,wr_addr_so;
wire    [2:0]   adr_bs_so;
wire    [2:0]   dev_dout_sel;
wire            r_lkup_en;
wire            lkup_en_so;
wire            r_dev_rd,r_dev_wr;
wire            r_tsb_rd,r_tsb_wr;
wire            dev_rd_so,dev_wr_so;
wire            tsb_rd_so,tsb_wr_so;
wire    [63:0]  r_din;
wire    [63:0]  din_so;
//reg     [63:0]  dout;
wire     [63:0]  dout;

wire	[4:0]	rd_addr_si;
wire	[4:0]	wr_addr_si;
wire	[2:0]	adr_bs_si;
wire		dev_rd_si;
wire		tsb_rd_si;
wire		dev_wr_si;
wire		tsb_wr_si;
wire		lkup_en_si;
wire	[63:0] 	din_si;


cl_mc1_sram_msff_mo_8x  rd_addr_so_4 ( .si(rd_addr_si[4]), .so(rd_addr_so[4]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_r[4]), .mq(r_adr_r[4]), .and_clk(and_clk)    );
cl_mc1_sram_msff_mo_8x  rd_addr_so_3 ( .si(rd_addr_si[3]), .so(rd_addr_so[3]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_r[3]), .mq(r_adr_r[3]), .and_clk(and_clk)    );
cl_mc1_sram_msff_mo_8x  rd_addr_so_2 ( .si(rd_addr_si[2]), .so(rd_addr_so[2]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_r[2]), .mq(r_adr_r[2]), .and_clk(and_clk)    );
cl_mc1_sram_msff_mo_8x  rd_addr_so_1 ( .si(rd_addr_si[1]), .so(rd_addr_so[1]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_r[1]), .mq(r_adr_r[1]), .and_clk(and_clk)    );
cl_mc1_sram_msff_mo_8x  rd_addr_so_0 ( .si(rd_addr_si[0]), .so(rd_addr_so[0]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_r[0]), .mq(r_adr_r[0]), .and_clk(and_clk)    );

cl_mc1_sram_msff_mo_8x  wr_addr_so_4 ( .si(wr_addr_si[4]), .so(wr_addr_so[4]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_w[4]), .mq(r_adr_w[4]), .and_clk(and_clk)    );
cl_mc1_sram_msff_mo_8x  wr_addr_so_3 ( .si(wr_addr_si[3]), .so(wr_addr_so[3]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_w[3]), .mq(r_adr_w[3]), .and_clk(and_clk)    );
cl_mc1_sram_msff_mo_8x  wr_addr_so_2 ( .si(wr_addr_si[2]), .so(wr_addr_so[2]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_w[2]), .mq(r_adr_w[2]), .and_clk(and_clk)    );
cl_mc1_sram_msff_mo_8x  wr_addr_so_1 ( .si(wr_addr_si[1]), .so(wr_addr_so[1]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_w[1]), .mq(r_adr_w[1]), .and_clk(and_clk)    );
cl_mc1_sram_msff_mo_8x  wr_addr_so_0 ( .si(wr_addr_si[0]), .so(wr_addr_so[0]), .l1clk(collar_clk[0]), 
	.siclk(siclk[0]), .soclk(soclk[0]), .d(adr_w[0]), .mq(r_adr_w[0]), .and_clk(and_clk)    );

cl_mc1_sram_msff_mo_8x adr_bs_so_2 ( .si(adr_bs_si[2]),  .so(adr_bs_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), 
	.soclk(soclk[0]), .d(adr_bs[2]),  .mq(dev_dout_sel[2]), .and_clk(and_clk) );
cl_mc1_sram_msff_mo_8x adr_bs_so_1 ( .si(adr_bs_si[1]),  .so(adr_bs_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), 
	.soclk(soclk[0]), .d(adr_bs[1]),  .mq(dev_dout_sel[1]), .and_clk(and_clk) );
cl_mc1_sram_msff_mo_8x adr_bs_so_0 ( .si(adr_bs_si[0]),  .so(adr_bs_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), 
	.soclk(soclk[0]), .d(adr_bs[0]),  .mq(dev_dout_sel[0]), .and_clk(and_clk) );

cl_mc1_sram_msff_mo_8x dev_rd_so_ff ( .si(dev_rd_si), .so(dev_rd_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]),
                              .d(dev_rd),  .mq(r_dev_rd), .and_clk(and_clk) );

cl_mc1_sram_msff_mo_8x tsb_rd_so_ff ( .si(tsb_rd_si), .so(tsb_rd_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]),
                              .d(tsb_rd),  .mq(r_tsb_rd), .and_clk(and_clk) );

cl_mc1_sram_msff_mo_8x dev_wr_so_ff ( .si(dev_wr_si), .so(dev_wr_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]),
                              .d(dev_wr),  .mq(r_dev_wr), .and_clk(and_clk) );

cl_mc1_sram_msff_mo_8x tsb_wr_so_ff ( .si(tsb_wr_si), .so(tsb_wr_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]),
                              .d(tsb_wr),  .mq(r_tsb_wr), .and_clk(and_clk) );

cl_mc1_sram_msff_mo_8x lkup_en_ff   ( .si(lkup_en_si), .so(lkup_en_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]),
                              .d(lkup_en),  .mq(r_lkup_en), .and_clk(and_clk) );


cl_sc1_msff_8x  din_63 ( .si(din_si[63]), .so(din_so[63]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[63]), .q(r_din[63]) );
cl_sc1_msff_8x  din_62 ( .si(din_si[62]), .so(din_so[62]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[62]), .q(r_din[62]) );
cl_sc1_msff_8x  din_61 ( .si(din_si[61]), .so(din_so[61]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[61]), .q(r_din[61]) );
cl_sc1_msff_8x  din_60 ( .si(din_si[60]), .so(din_so[60]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[60]), .q(r_din[60]) );

cl_sc1_msff_8x  din_59 ( .si(din_si[59]), .so(din_so[59]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[59]), .q(r_din[59]) );
cl_sc1_msff_8x  din_58 ( .si(din_si[58]), .so(din_so[58]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[58]), .q(r_din[58]) );
cl_sc1_msff_8x  din_57 ( .si(din_si[57]), .so(din_so[57]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[57]), .q(r_din[57]) );
cl_sc1_msff_8x  din_56 ( .si(din_si[56]), .so(din_so[56]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[56]), .q(r_din[56]) );
cl_sc1_msff_8x  din_55 ( .si(din_si[55]), .so(din_so[55]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[55]), .q(r_din[55]) );
cl_sc1_msff_8x  din_54 ( .si(din_si[54]), .so(din_so[54]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[54]), .q(r_din[54]) );
cl_sc1_msff_8x  din_53 ( .si(din_si[53]), .so(din_so[53]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[53]), .q(r_din[53]) );
cl_sc1_msff_8x  din_52 ( .si(din_si[52]), .so(din_so[52]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[52]), .q(r_din[52]) );
cl_sc1_msff_8x  din_51 ( .si(din_si[51]), .so(din_so[51]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[51]), .q(r_din[51]) );
cl_sc1_msff_8x  din_50 ( .si(din_si[50]), .so(din_so[50]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[50]), .q(r_din[50]) );

cl_sc1_msff_8x  din_49 ( .si(din_si[49]), .so(din_so[49]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[49]), .q(r_din[49]) );
cl_sc1_msff_8x  din_48 ( .si(din_si[48]), .so(din_so[48]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[48]), .q(r_din[48]) );
cl_sc1_msff_8x  din_47 ( .si(din_si[47]), .so(din_so[47]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[47]), .q(r_din[47]) );
cl_sc1_msff_8x  din_46 ( .si(din_si[46]), .so(din_so[46]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[46]), .q(r_din[46]) );
cl_sc1_msff_8x  din_45 ( .si(din_si[45]), .so(din_so[45]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[45]), .q(r_din[45]) );
cl_sc1_msff_8x  din_44 ( .si(din_si[44]), .so(din_so[44]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[44]), .q(r_din[44]) );
cl_sc1_msff_8x  din_43 ( .si(din_si[43]), .so(din_so[43]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[43]), .q(r_din[43]) );
cl_sc1_msff_8x  din_42 ( .si(din_si[42]), .so(din_so[42]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[42]), .q(r_din[42]) );
cl_sc1_msff_8x  din_41 ( .si(din_si[41]), .so(din_so[41]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[41]), .q(r_din[41]) );
cl_sc1_msff_8x  din_40 ( .si(din_si[40]), .so(din_so[40]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[40]), .q(r_din[40]) );

cl_sc1_msff_8x  din_39 ( .si(din_si[39]), .so(din_so[39]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[39]), .q(r_din[39]) );
cl_sc1_msff_8x  din_38 ( .si(din_si[38]), .so(din_so[38]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[38]), .q(r_din[38]) );
cl_sc1_msff_8x  din_37 ( .si(din_si[37]), .so(din_so[37]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[37]), .q(r_din[37]) );
cl_sc1_msff_8x  din_36 ( .si(din_si[36]), .so(din_so[36]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[36]), .q(r_din[36]) );
cl_sc1_msff_8x  din_35 ( .si(din_si[35]), .so(din_so[35]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[35]), .q(r_din[35]) );
cl_sc1_msff_8x  din_34 ( .si(din_si[34]), .so(din_so[34]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[34]), .q(r_din[34]) );
cl_sc1_msff_8x  din_33 ( .si(din_si[33]), .so(din_so[33]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[33]), .q(r_din[33]) );
cl_sc1_msff_8x  din_32 ( .si(din_si[32]), .so(din_so[32]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[32]), .q(r_din[32]) );
cl_sc1_msff_8x  din_31 ( .si(din_si[31]), .so(din_so[31]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[31]), .q(r_din[31]) );
cl_sc1_msff_8x  din_30 ( .si(din_si[30]), .so(din_so[30]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[30]), .q(r_din[30]) );

cl_sc1_msff_8x  din_29 ( .si(din_si[29]), .so(din_so[29]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[29]), .q(r_din[29]) );
cl_sc1_msff_8x  din_28 ( .si(din_si[28]), .so(din_so[28]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[28]), .q(r_din[28]) );
cl_sc1_msff_8x  din_27 ( .si(din_si[27]), .so(din_so[27]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[27]), .q(r_din[27]) );
cl_sc1_msff_8x  din_26 ( .si(din_si[26]), .so(din_so[26]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[26]), .q(r_din[26]) );
cl_sc1_msff_8x  din_25 ( .si(din_si[25]), .so(din_so[25]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[25]), .q(r_din[25]) );
cl_sc1_msff_8x  din_24 ( .si(din_si[24]), .so(din_so[24]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[24]), .q(r_din[24]) );
cl_sc1_msff_8x  din_23 ( .si(din_si[23]), .so(din_so[23]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[23]), .q(r_din[23]) );
cl_sc1_msff_8x  din_22 ( .si(din_si[22]), .so(din_so[22]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[22]), .q(r_din[22]) );
cl_sc1_msff_8x  din_21 ( .si(din_si[21]), .so(din_so[21]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[21]), .q(r_din[21]) );
cl_sc1_msff_8x  din_20 ( .si(din_si[20]), .so(din_so[20]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[20]), .q(r_din[20]) );

cl_sc1_msff_8x  din_19 ( .si(din_si[19]), .so(din_so[19]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[19]), .q(r_din[19]) );
cl_sc1_msff_8x  din_18 ( .si(din_si[18]), .so(din_so[18]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[18]), .q(r_din[18]) );
cl_sc1_msff_8x  din_17 ( .si(din_si[17]), .so(din_so[17]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[17]), .q(r_din[17]) );
cl_sc1_msff_8x  din_16 ( .si(din_si[16]), .so(din_so[16]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[16]), .q(r_din[16]) );
cl_sc1_msff_8x  din_15 ( .si(din_si[15]), .so(din_so[15]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[15]), .q(r_din[15]) );
cl_sc1_msff_8x  din_14 ( .si(din_si[14]), .so(din_so[14]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[14]), .q(r_din[14]) );
cl_sc1_msff_8x  din_13 ( .si(din_si[13]), .so(din_so[13]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[13]), .q(r_din[13]) );
cl_sc1_msff_8x  din_12 ( .si(din_si[12]), .so(din_so[12]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[12]), .q(r_din[12]) );
cl_sc1_msff_8x  din_11 ( .si(din_si[11]), .so(din_so[11]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[11]), .q(r_din[11]) );
cl_sc1_msff_8x  din_10 ( .si(din_si[10]), .so(din_so[10]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[10]), .q(r_din[10]) );

cl_sc1_msff_8x  din_9 ( .si(din_si[9]), .so(din_so[9]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[9]), .q(r_din[9])  );
cl_sc1_msff_8x  din_8 ( .si(din_si[8]), .so(din_so[8]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[8]), .q(r_din[8])   );
cl_sc1_msff_8x  din_7 ( .si(din_si[7]), .so(din_so[7]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[7]), .q(r_din[7])   );
cl_sc1_msff_8x  din_6 ( .si(din_si[6]), .so(din_so[6]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[6]), .q(r_din[6])   );
cl_sc1_msff_8x  din_5 ( .si(din_si[5]), .so(din_so[5]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[5]), .q(r_din[5])   );
cl_sc1_msff_8x  din_4 ( .si(din_si[4]), .so(din_so[4]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[4]), .q(r_din[4])   );
cl_sc1_msff_8x  din_3 ( .si(din_si[3]), .so(din_so[3]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[3]), .q(r_din[3])   );
cl_sc1_msff_8x  din_2 ( .si(din_si[2]), .so(din_so[2]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[2]), .q(r_din[2])   );
cl_sc1_msff_8x  din_1 ( .si(din_si[1]), .so(din_so[1]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[1]), .q(r_din[1])   );
cl_sc1_msff_8x  din_0 ( .si(din_si[0]), .so(din_so[0]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[0]), .q(r_din[0])    );

// scan chain is being stitched here with assign statement: Uttam 03/29/05
// scan chain is being re-stitched here with assign statement: Uttam 09/07/05
// Left array

assign          din_si[32]=scan_in;
assign          din_si[33]=din_so[32];
assign          din_si[34]=din_so[33];
assign          din_si[35]=din_so[34];
assign          din_si[36]=din_so[35];
assign          din_si[37]=din_so[36];
assign          din_si[38]=din_so[37];
assign          din_si[39]=din_so[38];
assign          din_si[40]=din_so[39];
assign          din_si[41]=din_so[40];
assign          din_si[42]=din_so[41];
assign          din_si[43]=din_so[42];
assign          din_si[44]=din_so[43];
assign          din_si[45]=din_so[44];
assign          din_si[46]=din_so[45];
assign          din_si[47]=din_so[46];
assign          din_si[48]=din_so[47];
assign          din_si[49]=din_so[48];
assign          din_si[50]=din_so[49];
assign          din_si[51]=din_so[50];
assign          din_si[52]=din_so[51];
assign          din_si[53]=din_so[52];
assign          din_si[54]=din_so[53];
assign          din_si[55]=din_so[54];
assign          din_si[56]=din_so[55];
assign          din_si[57]=din_so[56];
assign          din_si[58]=din_so[57];
assign          din_si[59]=din_so[58];
assign          din_si[60]=din_so[59];
assign          din_si[61]=din_so[60];
assign          din_si[62]=din_so[61];
assign          din_si[63]=din_so[62];

// Decoder

assign          tsb_wr_si=din_so[63];
assign          tsb_rd_si=tsb_wr_so;
assign          lkup_en_si=tsb_rd_so;
assign          rd_addr_si[4]=lkup_en_so;
assign          rd_addr_si[3]=rd_addr_so[4];
assign          wr_addr_si[4]=rd_addr_so[3];
assign          wr_addr_si[3]=wr_addr_so[4];
assign          rd_addr_si[2]=wr_addr_so[3];
assign          rd_addr_si[1]=rd_addr_so[2];
assign          wr_addr_si[2]=rd_addr_so[1];
assign          wr_addr_si[1]=wr_addr_so[2];
assign          rd_addr_si[0]=wr_addr_so[1];
assign          dev_wr_si=rd_addr_so[0];
assign          wr_addr_si[0]=dev_wr_so;
assign          dev_rd_si=wr_addr_so[0];
assign          adr_bs_si[2]=dev_rd_so;
assign          adr_bs_si[1]=adr_bs_so[2];
assign          adr_bs_si[0]=adr_bs_so[1];


// Right array

assign          din_si[0]=adr_bs_so[0];
assign          din_si[1]=din_so[0];
assign          din_si[2]=din_so[1];
assign          din_si[3]=din_so[2];
assign          din_si[4]=din_so[3];
assign          din_si[5]=din_so[4];
assign          din_si[6]=din_so[5];
assign          din_si[7]=din_so[6];
assign          din_si[8]=din_so[7];
assign          din_si[9]=din_so[8];
assign          din_si[10]=din_so[9];
assign          din_si[11]=din_so[10];
assign          din_si[12]=din_so[11];
assign          din_si[13]=din_so[12];
assign          din_si[14]=din_so[13];
assign          din_si[15]=din_so[14];
assign          din_si[16]=din_so[15];
assign          din_si[17]=din_so[16];
assign          din_si[18]=din_so[17];
assign          din_si[19]=din_so[18];
assign          din_si[20]=din_so[19];
assign          din_si[21]=din_so[20];
assign          din_si[22]=din_so[21];
assign          din_si[23]=din_so[22];
assign          din_si[24]=din_so[23];
assign          din_si[25]=din_so[24];
assign          din_si[26]=din_so[25];
assign          din_si[27]=din_so[26];
assign          din_si[28]=din_so[27];
assign          din_si[29]=din_so[28];
assign          din_si[30]=din_so[29];
assign          din_si[31]=din_so[30];
assign          scan_out=din_so[31];

// end of scan chain connection    uttam 03/29/05


//wire	r_d_rd,r_d_wr;
//assign	r_d_rd = !wr_inhibit && !r_dev_wr && r_dev_rd;
//assign	r_d_wr = !wr_inhibit && r_dev_wr;

wire    x1_,x2_,x3,r_d_rd, r_d_wr;
not  rd2 (x1_,wr_inhibit);
not  rd3 (x2_,r_dev_wr);
and  rd1 (x3,x2_,x1_);
and  rd4 (r_d_rd,x3,r_dev_rd);

and  wr1 (r_d_wr,x1_,r_dev_wr);

  //------------------------------------------------------------------------
  //  instantiate the clock-less ram
  //------------------------------------------------------------------------
wire  [63:0]  dev_dout;
wire  [63:0]  tsb_dout;

n2_iom_sp_1024b_cust  iommu_dev_ram (
                        .clk            (and_clk),
                        .adr_r          (r_adr_r[3:0]),
                        .adr_w          (r_adr_w[3:0]),
                        .rd             (r_d_rd),
                        .wr             (r_d_wr),
                        .din            (r_din),
                        .dout           (dev_dout)
                        );


// assign bypass_dout[63:0] = r_din[63:0]; 

wire  [4:0] sel_dev_dout;
//always @(dev_dout_sel or dev_dout)
//       begin
//        case(dev_dout_sel)
//        3'b000 : sel_dev_dout = dev_dout[4:0];
//        3'b001 : sel_dev_dout = dev_dout[12:8];
//        3'b010 : sel_dev_dout = dev_dout[20:16];
//        3'b011 : sel_dev_dout = dev_dout[28:24];
//        3'b100 : sel_dev_dout = dev_dout[36:32];
//        3'b101 : sel_dev_dout = dev_dout[44:40];
//        3'b110 : sel_dev_dout = dev_dout[52:48];
//        3'b111 : sel_dev_dout = dev_dout[60:56];
//        default : sel_dev_dout = 5'bxxxx;
//        endcase
//       end
wire	[7:0] sel;
wire	dev_dout_sel_2_,dev_dout_sel_1_,dev_dout_sel_0_;
wire	f_2_f_1,f_2_t_1,t_2_f_1,t_2_t_1;
not  case_sel_0 (dev_dout_sel_2_,dev_dout_sel[2]);
not  case_sel_1 (dev_dout_sel_1_,dev_dout_sel[1]);
not  case_sel_2 (dev_dout_sel_0_,dev_dout_sel[0]);
and  case_sel_3 (f_2_f_1,dev_dout_sel_2_,dev_dout_sel_1_);
and  case_sel_4 (sel[0],f_2_f_1,dev_dout_sel_0_);
and  case_sel_5 (sel[1],f_2_f_1,dev_dout_sel[0]);
and  case_sel_6 (f_2_t_1,dev_dout_sel_2_,dev_dout_sel[1]);
and  case_sel_7 (sel[2],f_2_t_1,dev_dout_sel_0_);
and  case_sel_8 (sel[3],f_2_t_1,dev_dout_sel[0]);
and  case_sel_9 (t_2_f_1,dev_dout_sel[2],dev_dout_sel_1_);
and  case_sel_10 (sel[4],t_2_f_1,dev_dout_sel_0_);
and  case_sel_11 (sel[5],t_2_f_1,dev_dout_sel[0]);
and  case_sel_12 (t_2_t_1,dev_dout_sel[2],dev_dout_sel[1]);
and  case_sel_13 (sel[6],t_2_t_1,dev_dout_sel_0_);
and  case_sel_14 (sel[7],t_2_t_1,dev_dout_sel[0]);
cl_a1_aomux8_4x  sel_dev_dout_mux_0 (  .out(sel_dev_dout[0]) ,
		.sel0(sel[0]), .sel1(sel[1]),  .in0(dev_dout[0]), .in1(dev_dout[8]), 
		.sel2(sel[2]), .sel3(sel[3]),  .in2(dev_dout[16]), .in3(dev_dout[24]), 
		.sel4(sel[4]), .sel5(sel[5]),  .in4(dev_dout[32]), .in5(dev_dout[40]), 
		.sel6(sel[6]), .sel7(sel[7]),  .in6(dev_dout[48]), .in7(dev_dout[56]) );
cl_a1_aomux8_4x  sel_dev_dout_mux_1 (  .out(sel_dev_dout[1]) ,
		.sel0(sel[0]), .sel1(sel[1]),  .in0(dev_dout[1]), .in1(dev_dout[9]), 
		.sel2(sel[2]), .sel3(sel[3]),  .in2(dev_dout[17]), .in3(dev_dout[25]), 
		.sel4(sel[4]), .sel5(sel[5]),  .in4(dev_dout[33]), .in5(dev_dout[41]), 
		.sel6(sel[6]), .sel7(sel[7]),  .in6(dev_dout[49]), .in7(dev_dout[57]) );
cl_a1_aomux8_4x  sel_dev_dout_mux_2 (  .out(sel_dev_dout[2]) ,
		.sel0(sel[0]), .sel1(sel[1]),  .in0(dev_dout[2]), .in1(dev_dout[10]), 
		.sel2(sel[2]), .sel3(sel[3]),  .in2(dev_dout[18]), .in3(dev_dout[26]), 
		.sel4(sel[4]), .sel5(sel[5]),  .in4(dev_dout[34]), .in5(dev_dout[42]), 
		.sel6(sel[6]), .sel7(sel[7]),  .in6(dev_dout[50]), .in7(dev_dout[58]) );
cl_a1_aomux8_4x  sel_dev_dout_mux_3 (  .out(sel_dev_dout[3]) ,
		.sel0(sel[0]), .sel1(sel[1]),  .in0(dev_dout[3]), .in1(dev_dout[11]), 
		.sel2(sel[2]), .sel3(sel[3]),  .in2(dev_dout[19]), .in3(dev_dout[27]), 
		.sel4(sel[4]), .sel5(sel[5]),  .in4(dev_dout[35]), .in5(dev_dout[43]), 
		.sel6(sel[6]), .sel7(sel[7]),  .in6(dev_dout[51]), .in7(dev_dout[59]) );
cl_a1_aomux8_4x  sel_dev_dout_mux_4 (  .out(sel_dev_dout[4]) ,
		.sel0(sel[0]), .sel1(sel[1]),  .in0(dev_dout[4]), .in1(dev_dout[12]), 
		.sel2(sel[2]), .sel3(sel[3]),  .in2(dev_dout[20]), .in3(dev_dout[28]), 
		.sel4(sel[4]), .sel5(sel[5]),  .in4(dev_dout[36]), .in5(dev_dout[44]), 
		.sel6(sel[6]), .sel7(sel[7]),  .in6(dev_dout[52]), .in7(dev_dout[60]) );

// assign sel_dev_dout = ((dev_dout_sel == 3'b000) ? dev_dout[4:0] :
//                        (dev_dout_sel == 3'b001) ? dev_dout[12:8] :
//                        (dev_dout_sel == 3'b010) ? dev_dout[20:16] :
//                        (dev_dout_sel == 3'b011) ? dev_dout[28:24] :
//                        (dev_dout_sel == 3'b100) ? dev_dout[36:32] :
//                        (dev_dout_sel == 3'b101) ? dev_dout[44:40] :
//                        (dev_dout_sel == 3'b110) ? dev_dout[52:48] :
//                        (dev_dout_sel == 3'b111) ? dev_dout[60:56] : 4'bxxxx );

wire	r_t_rd,r_t_wr;
wire  [4:0] rd_and_r_adr,tsb_adr_r,tsb_ram_adr_r,rd_wr_adr;
wire	r_tsb_wr_,wr_inhibit_,y0,r_lkup_en_;

//assign tsb_read_addr = r_lkup_en ? sel_dev_dout : r_adr_r ; 
//assign tsb_adr_r = r_tsb_wr ? r_adr_w : tsb_read_addr;
//BP 9-27-06 eco 119647changes below for TO 2.0 to make rtl match schematic because of atpg mismatches
not  r_lkup_en_0 (r_lkup_en_,r_lkup_en);
and	rd_and_addr_4_g (rd_and_r_adr[4], r_adr_r[4],r_tsb_rd);
and	rd_and_addr_3_g (rd_and_r_adr[3], r_adr_r[3],r_tsb_rd);
and	rd_and_addr_2_g (rd_and_r_adr[2], r_adr_r[2],r_tsb_rd);
and	rd_and_addr_1_g (rd_and_r_adr[1], r_adr_r[1],r_tsb_rd);
and	rd_and_addr_0_g (rd_and_r_adr[0], r_adr_r[0],r_tsb_rd);
cl_a1_aomux2_4x  rd_addr_mux_4 ( .sel0(r_lkup_en), .sel1(r_lkup_en_),  .in0(sel_dev_dout[4]), .in1(rd_wr_adr[4]), .out(tsb_ram_adr_r[4]) );
cl_a1_aomux2_4x  rd_addr_mux_3 ( .sel0(r_lkup_en), .sel1(r_lkup_en_),  .in0(sel_dev_dout[3]), .in1(rd_wr_adr[3]), .out(tsb_ram_adr_r[3]) );
cl_a1_aomux2_4x  rd_addr_mux_2 ( .sel0(r_lkup_en), .sel1(r_lkup_en_),  .in0(sel_dev_dout[2]), .in1(rd_wr_adr[2]), .out(tsb_ram_adr_r[2]) );
cl_a1_aomux2_4x  rd_addr_mux_1 ( .sel0(r_lkup_en), .sel1(r_lkup_en_),  .in0(sel_dev_dout[1]), .in1(rd_wr_adr[1]), .out(tsb_ram_adr_r[1]) );
cl_a1_aomux2_4x  rd_addr_mux_0 ( .sel0(r_lkup_en), .sel1(r_lkup_en_),  .in0(sel_dev_dout[0]), .in1(rd_wr_adr[0]), .out(tsb_ram_adr_r[0]) );
cl_a1_aomux2_4x  tsb_adr_r_mux_4 ( .sel0(r_tsb_wr), .sel1(r_tsb_wr_),  .in0(r_adr_w[4]), .in1(rd_and_r_adr[4]), .out(rd_wr_adr[4]) );
cl_a1_aomux2_4x  tsb_adr_r_mux_3 ( .sel0(r_tsb_wr), .sel1(r_tsb_wr_),  .in0(r_adr_w[3]), .in1(rd_and_r_adr[3]), .out(rd_wr_adr[3]) );
cl_a1_aomux2_4x  tsb_adr_r_mux_2 ( .sel0(r_tsb_wr), .sel1(r_tsb_wr_),  .in0(r_adr_w[2]), .in1(rd_and_r_adr[2]), .out(rd_wr_adr[2]) );
cl_a1_aomux2_4x  tsb_adr_r_mux_1 ( .sel0(r_tsb_wr), .sel1(r_tsb_wr_),  .in0(r_adr_w[1]), .in1(rd_and_r_adr[1]), .out(rd_wr_adr[1]) );
cl_a1_aomux2_4x  tsb_adr_r_mux_0 ( .sel0(r_tsb_wr), .sel1(r_tsb_wr_),  .in0(r_adr_w[0]), .in1(rd_and_r_adr[0]), .out(rd_wr_adr[0]) );

//BP 4-12-05 need latch to hold tsb_ram_adr_r because the new mo latch causes latched inputs to go to 0 during ~clk
cl_mc1_tisram_blb_4x  tsb_adr_r_o_4 ( .l1clk(~and_clk), .d_a(tsb_ram_adr_r[4]), .q_b(tsb_adr_r[4]) );
cl_mc1_tisram_blb_4x  tsb_adr_r_o_3 ( .l1clk(~and_clk), .d_a(tsb_ram_adr_r[3]), .q_b(tsb_adr_r[3]) );
cl_mc1_tisram_blb_4x  tsb_adr_r_o_2 ( .l1clk(~and_clk), .d_a(tsb_ram_adr_r[2]), .q_b(tsb_adr_r[2]) );
cl_mc1_tisram_blb_4x  tsb_adr_r_o_1 ( .l1clk(~and_clk), .d_a(tsb_ram_adr_r[1]), .q_b(tsb_adr_r[1]) );
cl_mc1_tisram_blb_4x  tsb_adr_r_o_0 ( .l1clk(~and_clk), .d_a(tsb_ram_adr_r[0]), .q_b(tsb_adr_r[0]) );

//assign	r_t_rd = !wr_inhibit && !r_tsb_wr && r_tsb_rd;
//assign	r_t_wr = !wr_inhibit && r_tsb_wr;

not  tsb_0 (wr_inhibit_,wr_inhibit);
not  tsb_1 (r_tsb_wr_,r_tsb_wr);
and  tsb_2 (y0,wr_inhibit_,r_tsb_wr_);
and  tsb_3 (r_t_rd,y0,r_tsb_rd);
and  tsb_4 (r_t_wr,wr_inhibit_,r_tsb_wr);

n2_iom_sp_2048b_cust  iommu_tsb_ram (
                        .clk            (and_clk),
                        .adr_r          (tsb_ram_adr_r),
                     //   .adr_w          (r_adr_w),
                        .adr_w          (tsb_ram_adr_r),
                        .rd             (r_t_rd),
                        .wr             (r_t_wr),
                        .din            (r_din),
                        .dout           (tsb_dout),
                        .efu_bits       (efu_bits[3:0])
                        );


// wire  [63:0]  dout_array;
//always @(clk or r_t_rd or tsb_dout or dev_dout or r_d_rd or r_tsb_rd ) begin
//
//        if (clk) begin
//        if (r_t_rd & r_tsb_rd) begin
//                dout[63:0] =     tsb_dout;
//                end
//	else if (r_d_rd & ~r_tsb_rd) begin
//                dout[63:0] =     dev_dout;
//                end
//        end
//end
wire	[63:0] mux_dout;
wire	r_tsb_rd_,tsb_sel_,tsb_sel,dev_sel_,dev_sel;

cl_a1_inv_4x   mux_sel_4 ( .out(r_tsb_rd_),  .in(r_tsb_rd)   );
//cl_a1_nand2_4x mux_sel_0 ( .out(tsb_sel_),  .in0(r_t_rd), .in1(r_tsb_rd)   );
cl_a1_nand2_4x mux_sel_0 ( .out(tsb_sel_),  .in0(wr_inhibit_), .in1(r_tsb_rd)   );
cl_a1_inv_4x   mux_sel_1 ( .out(tsb_sel),  .in(tsb_sel_)   );
//cl_a1_nand2_4x mux_sel_2 ( .out(dev_sel_),  .in0(r_d_rd), .in1(r_tsb_rd_)   );
cl_a1_nand2_4x mux_sel_2 ( .out(dev_sel_),  .in0(wr_inhibit_), .in1(r_tsb_rd_)   );
cl_a1_inv_4x   mux_sel_3 ( .out(dev_sel),  .in(dev_sel_)   );

cl_a1_aomux2_4x  mux_dout_63 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[63]), .in1(dev_dout[63]), .out(mux_dout[63]) );
cl_a1_aomux2_4x  mux_dout_62 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[62]), .in1(dev_dout[62]), .out(mux_dout[62]) );
cl_a1_aomux2_4x  mux_dout_61 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[61]), .in1(dev_dout[61]), .out(mux_dout[61]) );
cl_a1_aomux2_4x  mux_dout_60 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[60]), .in1(dev_dout[60]), .out(mux_dout[60]) );

cl_a1_aomux2_4x  mux_dout_59 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[59]), .in1(dev_dout[59]), .out(mux_dout[59]) );
cl_a1_aomux2_4x  mux_dout_58 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[58]), .in1(dev_dout[58]), .out(mux_dout[58]) );
cl_a1_aomux2_4x  mux_dout_57 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[57]), .in1(dev_dout[57]), .out(mux_dout[57]) );
cl_a1_aomux2_4x  mux_dout_56 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[56]), .in1(dev_dout[56]), .out(mux_dout[56]) );
cl_a1_aomux2_4x  mux_dout_55 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[55]), .in1(dev_dout[55]), .out(mux_dout[55]) );
cl_a1_aomux2_4x  mux_dout_54 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[54]), .in1(dev_dout[54]), .out(mux_dout[54]) );
cl_a1_aomux2_4x  mux_dout_53 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[53]), .in1(dev_dout[53]), .out(mux_dout[53]) );
cl_a1_aomux2_4x  mux_dout_52 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[52]), .in1(dev_dout[52]), .out(mux_dout[52]) );
cl_a1_aomux2_4x  mux_dout_51 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[51]), .in1(dev_dout[51]), .out(mux_dout[51]) );
cl_a1_aomux2_4x  mux_dout_50 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[50]), .in1(dev_dout[50]), .out(mux_dout[50]) );

cl_a1_aomux2_4x  mux_dout_49 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[49]), .in1(dev_dout[49]), .out(mux_dout[49]) );
cl_a1_aomux2_4x  mux_dout_48 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[48]), .in1(dev_dout[48]), .out(mux_dout[48]) );
cl_a1_aomux2_4x  mux_dout_47 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[47]), .in1(dev_dout[47]), .out(mux_dout[47]) );
cl_a1_aomux2_4x  mux_dout_46 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[46]), .in1(dev_dout[46]), .out(mux_dout[46]) );
cl_a1_aomux2_4x  mux_dout_45 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[45]), .in1(dev_dout[45]), .out(mux_dout[45]) );
cl_a1_aomux2_4x  mux_dout_44 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[44]), .in1(dev_dout[44]), .out(mux_dout[44]) );
cl_a1_aomux2_4x  mux_dout_43 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[43]), .in1(dev_dout[43]), .out(mux_dout[43]) );
cl_a1_aomux2_4x  mux_dout_42 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[42]), .in1(dev_dout[42]), .out(mux_dout[42]) );
cl_a1_aomux2_4x  mux_dout_41 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[41]), .in1(dev_dout[41]), .out(mux_dout[41]) );
cl_a1_aomux2_4x  mux_dout_40 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[40]), .in1(dev_dout[40]), .out(mux_dout[40]) );

cl_a1_aomux2_4x  mux_dout_39 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[39]), .in1(dev_dout[39]), .out(mux_dout[39]) );
cl_a1_aomux2_4x  mux_dout_38 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[38]), .in1(dev_dout[38]), .out(mux_dout[38]) );
cl_a1_aomux2_4x  mux_dout_37 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[37]), .in1(dev_dout[37]), .out(mux_dout[37]) );
cl_a1_aomux2_4x  mux_dout_36 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[36]), .in1(dev_dout[36]), .out(mux_dout[36]) );
cl_a1_aomux2_4x  mux_dout_35 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[35]), .in1(dev_dout[35]), .out(mux_dout[35]) );
cl_a1_aomux2_4x  mux_dout_34 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[34]), .in1(dev_dout[34]), .out(mux_dout[34]) );
cl_a1_aomux2_4x  mux_dout_33 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[33]), .in1(dev_dout[33]), .out(mux_dout[33]) );
cl_a1_aomux2_4x  mux_dout_32 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[32]), .in1(dev_dout[32]), .out(mux_dout[32]) );
cl_a1_aomux2_4x  mux_dout_31 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[31]), .in1(dev_dout[31]), .out(mux_dout[31]) );
cl_a1_aomux2_4x  mux_dout_30 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[30]), .in1(dev_dout[30]), .out(mux_dout[30]) );

cl_a1_aomux2_4x  mux_dout_29 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[29]), .in1(dev_dout[29]), .out(mux_dout[29]) );
cl_a1_aomux2_4x  mux_dout_28 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[28]), .in1(dev_dout[28]), .out(mux_dout[28]) );
cl_a1_aomux2_4x  mux_dout_27 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[27]), .in1(dev_dout[27]), .out(mux_dout[27]) );
cl_a1_aomux2_4x  mux_dout_26 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[26]), .in1(dev_dout[26]), .out(mux_dout[26]) );
cl_a1_aomux2_4x  mux_dout_25 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[25]), .in1(dev_dout[25]), .out(mux_dout[25]) );
cl_a1_aomux2_4x  mux_dout_24 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[24]), .in1(dev_dout[24]), .out(mux_dout[24]) );
cl_a1_aomux2_4x  mux_dout_23 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[23]), .in1(dev_dout[23]), .out(mux_dout[23]) );
cl_a1_aomux2_4x  mux_dout_22 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[22]), .in1(dev_dout[22]), .out(mux_dout[22]) );
cl_a1_aomux2_4x  mux_dout_21 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[21]), .in1(dev_dout[21]), .out(mux_dout[21]) );
cl_a1_aomux2_4x  mux_dout_20 ( .sel0(tsb_sel), .sel1(dev_sel),  .in0(tsb_dout[20]), .in1(dev_dout[20]), .out(mux_dout[20]) );

cl_a1_aomux2_4x  mux_dout_19 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[19]), .in1(dev_dout[19]), .out(mux_dout[19]) );
cl_a1_aomux2_4x  mux_dout_18 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[18]), .in1(dev_dout[18]), .out(mux_dout[18]) );
cl_a1_aomux2_4x  mux_dout_17 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[17]), .in1(dev_dout[17]), .out(mux_dout[17]) );
cl_a1_aomux2_4x  mux_dout_16 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[16]), .in1(dev_dout[16]), .out(mux_dout[16]) );
cl_a1_aomux2_4x  mux_dout_15 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[15]), .in1(dev_dout[15]), .out(mux_dout[15]) );
cl_a1_aomux2_4x  mux_dout_14 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[14]), .in1(dev_dout[14]), .out(mux_dout[14]) );
cl_a1_aomux2_4x  mux_dout_13 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[13]), .in1(dev_dout[13]), .out(mux_dout[13]) );
cl_a1_aomux2_4x  mux_dout_12 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[12]), .in1(dev_dout[12]), .out(mux_dout[12]) );
cl_a1_aomux2_4x  mux_dout_11 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[11]), .in1(dev_dout[11]), .out(mux_dout[11]) );
cl_a1_aomux2_4x  mux_dout_10 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[10]), .in1(dev_dout[10]), .out(mux_dout[10]) );

cl_a1_aomux2_4x  mux_dout_9 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[9]), .in1(dev_dout[9]), .out(mux_dout[9])   );
cl_a1_aomux2_4x  mux_dout_8 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[8]), .in1(dev_dout[8]), .out(mux_dout[8])   );
cl_a1_aomux2_4x  mux_dout_7 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[7]), .in1(dev_dout[7]), .out(mux_dout[7])   );
cl_a1_aomux2_4x  mux_dout_6 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[6]), .in1(dev_dout[6]), .out(mux_dout[6])   );
cl_a1_aomux2_4x  mux_dout_5 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[5]), .in1(dev_dout[5]), .out(mux_dout[5])   );
cl_a1_aomux2_4x  mux_dout_4 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[4]), .in1(dev_dout[4]), .out(mux_dout[4])   );
cl_a1_aomux2_4x  mux_dout_3 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[3]), .in1(dev_dout[3]), .out(mux_dout[3])   );
cl_a1_aomux2_4x  mux_dout_2 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[2]), .in1(dev_dout[2]), .out(mux_dout[2])   );
cl_a1_aomux2_4x  mux_dout_1 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[1]), .in1(dev_dout[1]), .out(mux_dout[1])   );
cl_a1_aomux2_4x  mux_dout_0 ( .sel0(tsb_sel), .sel1(dev_sel),   .in0(tsb_dout[0]), .in1(dev_dout[0]), .out(mux_dout[0])   );

wire	latch_clk;
//assign	latch_clk = ~(clk & ( r_t_rd | r_d_rd));
wire		rd_;
cl_a1_nor2_4x  latch_0 ( .out(rd_),  .in0(r_tsb_rd), .in1(r_dev_rd)   );
cl_a1_inv_4x   latch_1 ( .out(rd),  .in(rd_)   );
//BP eco119647 latch_2 ( .out(latch_clk),  .in0(rd), .in1(and_clk)   );
cl_a1_nand3_4x latch_2 ( .out(latch_clk),  .in0(rd), .in1(and_clk), .in2(wr_inhibit_)   );

cl_mc1_tisram_blb_4x  dout_63 ( .l1clk(latch_clk), .d_a(mux_dout[63]), .q_b(dout[63]) );
cl_mc1_tisram_blb_4x  dout_62 ( .l1clk(latch_clk), .d_a(mux_dout[62]), .q_b(dout[62]) );
cl_mc1_tisram_blb_4x  dout_61 ( .l1clk(latch_clk), .d_a(mux_dout[61]), .q_b(dout[61]) );
cl_mc1_tisram_blb_4x  dout_60 ( .l1clk(latch_clk), .d_a(mux_dout[60]), .q_b(dout[60]) );

cl_mc1_tisram_blb_4x  dout_59 ( .l1clk(latch_clk), .d_a(mux_dout[59]), .q_b(dout[59]) );
cl_mc1_tisram_blb_4x  dout_58 ( .l1clk(latch_clk), .d_a(mux_dout[58]), .q_b(dout[58]) );
cl_mc1_tisram_blb_4x  dout_57 ( .l1clk(latch_clk), .d_a(mux_dout[57]), .q_b(dout[57]) );
cl_mc1_tisram_blb_4x  dout_56 ( .l1clk(latch_clk), .d_a(mux_dout[56]), .q_b(dout[56]) );
cl_mc1_tisram_blb_4x  dout_55 ( .l1clk(latch_clk), .d_a(mux_dout[55]), .q_b(dout[55]) );
cl_mc1_tisram_blb_4x  dout_54 ( .l1clk(latch_clk), .d_a(mux_dout[54]), .q_b(dout[54]) );
cl_mc1_tisram_blb_4x  dout_53 ( .l1clk(latch_clk), .d_a(mux_dout[53]), .q_b(dout[53]) );
cl_mc1_tisram_blb_4x  dout_52 ( .l1clk(latch_clk), .d_a(mux_dout[52]), .q_b(dout[52]) );
cl_mc1_tisram_blb_4x  dout_51 ( .l1clk(latch_clk), .d_a(mux_dout[51]), .q_b(dout[51]) );
cl_mc1_tisram_blb_4x  dout_50 ( .l1clk(latch_clk), .d_a(mux_dout[50]), .q_b(dout[50]) );

cl_mc1_tisram_blb_4x  dout_49 ( .l1clk(latch_clk), .d_a(mux_dout[49]), .q_b(dout[49]) );
cl_mc1_tisram_blb_4x  dout_48 ( .l1clk(latch_clk), .d_a(mux_dout[48]), .q_b(dout[48]) );
cl_mc1_tisram_blb_4x  dout_47 ( .l1clk(latch_clk), .d_a(mux_dout[47]), .q_b(dout[47]) );
cl_mc1_tisram_blb_4x  dout_46 ( .l1clk(latch_clk), .d_a(mux_dout[46]), .q_b(dout[46]) );
cl_mc1_tisram_blb_4x  dout_45 ( .l1clk(latch_clk), .d_a(mux_dout[45]), .q_b(dout[45]) );
cl_mc1_tisram_blb_4x  dout_44 ( .l1clk(latch_clk), .d_a(mux_dout[44]), .q_b(dout[44]) );
cl_mc1_tisram_blb_4x  dout_43 ( .l1clk(latch_clk), .d_a(mux_dout[43]), .q_b(dout[43]) );
cl_mc1_tisram_blb_4x  dout_42 ( .l1clk(latch_clk), .d_a(mux_dout[42]), .q_b(dout[42]) );
cl_mc1_tisram_blb_4x  dout_41 ( .l1clk(latch_clk), .d_a(mux_dout[41]), .q_b(dout[41]) );
cl_mc1_tisram_blb_4x  dout_40 ( .l1clk(latch_clk), .d_a(mux_dout[40]), .q_b(dout[40]) );

cl_mc1_tisram_blb_4x  dout_39 ( .l1clk(latch_clk), .d_a(mux_dout[39]), .q_b(dout[39]) );
cl_mc1_tisram_blb_4x  dout_38 ( .l1clk(latch_clk), .d_a(mux_dout[38]), .q_b(dout[38]) );
cl_mc1_tisram_blb_4x  dout_37 ( .l1clk(latch_clk), .d_a(mux_dout[37]), .q_b(dout[37]) );
cl_mc1_tisram_blb_4x  dout_36 ( .l1clk(latch_clk), .d_a(mux_dout[36]), .q_b(dout[36]) );
cl_mc1_tisram_blb_4x  dout_35 ( .l1clk(latch_clk), .d_a(mux_dout[35]), .q_b(dout[35]) );
cl_mc1_tisram_blb_4x  dout_34 ( .l1clk(latch_clk), .d_a(mux_dout[34]), .q_b(dout[34]) );
cl_mc1_tisram_blb_4x  dout_33 ( .l1clk(latch_clk), .d_a(mux_dout[33]), .q_b(dout[33]) );
cl_mc1_tisram_blb_4x  dout_32 ( .l1clk(latch_clk), .d_a(mux_dout[32]), .q_b(dout[32]) );
cl_mc1_tisram_blb_4x  dout_31 ( .l1clk(latch_clk), .d_a(mux_dout[31]), .q_b(dout[31]) );
cl_mc1_tisram_blb_4x  dout_30 ( .l1clk(latch_clk), .d_a(mux_dout[30]), .q_b(dout[30]) );

cl_mc1_tisram_blb_4x  dout_29 ( .l1clk(latch_clk), .d_a(mux_dout[29]), .q_b(dout[29]) );
cl_mc1_tisram_blb_4x  dout_28 ( .l1clk(latch_clk), .d_a(mux_dout[28]), .q_b(dout[28]) );
cl_mc1_tisram_blb_4x  dout_27 ( .l1clk(latch_clk), .d_a(mux_dout[27]), .q_b(dout[27]) );
cl_mc1_tisram_blb_4x  dout_26 ( .l1clk(latch_clk), .d_a(mux_dout[26]), .q_b(dout[26]) );
cl_mc1_tisram_blb_4x  dout_25 ( .l1clk(latch_clk), .d_a(mux_dout[25]), .q_b(dout[25]) );
cl_mc1_tisram_blb_4x  dout_24 ( .l1clk(latch_clk), .d_a(mux_dout[24]), .q_b(dout[24]) );
cl_mc1_tisram_blb_4x  dout_23 ( .l1clk(latch_clk), .d_a(mux_dout[23]), .q_b(dout[23]) );
cl_mc1_tisram_blb_4x  dout_22 ( .l1clk(latch_clk), .d_a(mux_dout[22]), .q_b(dout[22]) );
cl_mc1_tisram_blb_4x  dout_21 ( .l1clk(latch_clk), .d_a(mux_dout[21]), .q_b(dout[21]) );
cl_mc1_tisram_blb_4x  dout_20 ( .l1clk(latch_clk), .d_a(mux_dout[20]), .q_b(dout[20]) );

cl_mc1_tisram_blb_4x  dout_19 ( .l1clk(latch_clk),  .d_a(mux_dout[19]), .q_b(dout[19]) );
cl_mc1_tisram_blb_4x  dout_18 ( .l1clk(latch_clk),  .d_a(mux_dout[18]), .q_b(dout[18]) );
cl_mc1_tisram_blb_4x  dout_17 ( .l1clk(latch_clk),  .d_a(mux_dout[17]), .q_b(dout[17]) );
cl_mc1_tisram_blb_4x  dout_16 ( .l1clk(latch_clk),  .d_a(mux_dout[16]), .q_b(dout[16]) );
cl_mc1_tisram_blb_4x  dout_15 ( .l1clk(latch_clk),  .d_a(mux_dout[15]), .q_b(dout[15]) );
cl_mc1_tisram_blb_4x  dout_14 ( .l1clk(latch_clk),  .d_a(mux_dout[14]), .q_b(dout[14]) );
cl_mc1_tisram_blb_4x  dout_13 ( .l1clk(latch_clk),  .d_a(mux_dout[13]), .q_b(dout[13]) );
cl_mc1_tisram_blb_4x  dout_12 ( .l1clk(latch_clk),  .d_a(mux_dout[12]), .q_b(dout[12]) );
cl_mc1_tisram_blb_4x  dout_11 ( .l1clk(latch_clk),  .d_a(mux_dout[11]), .q_b(dout[11]) );
cl_mc1_tisram_blb_4x  dout_10 ( .l1clk(latch_clk),  .d_a(mux_dout[10]), .q_b(dout[10]) );

cl_mc1_tisram_blb_4x  dout_9 ( .l1clk(latch_clk),  .d_a(mux_dout[9]), .q_b(dout[9])  );
cl_mc1_tisram_blb_4x  dout_8 ( .l1clk(latch_clk),  .d_a(mux_dout[8]), .q_b(dout[8])   );
cl_mc1_tisram_blb_4x  dout_7 ( .l1clk(latch_clk),  .d_a(mux_dout[7]), .q_b(dout[7])   );
cl_mc1_tisram_blb_4x  dout_6 ( .l1clk(latch_clk),  .d_a(mux_dout[6]), .q_b(dout[6])   );
cl_mc1_tisram_blb_4x  dout_5 ( .l1clk(latch_clk),  .d_a(mux_dout[5]), .q_b(dout[5])   );
cl_mc1_tisram_blb_4x  dout_4 ( .l1clk(latch_clk),  .d_a(mux_dout[4]), .q_b(dout[4])   );
cl_mc1_tisram_blb_4x  dout_3 ( .l1clk(latch_clk),  .d_a(mux_dout[3]), .q_b(dout[3])   );
cl_mc1_tisram_blb_4x  dout_2 ( .l1clk(latch_clk),  .d_a(mux_dout[2]), .q_b(dout[2])   );
cl_mc1_tisram_blb_4x  dout_1 ( .l1clk(latch_clk),  .d_a(mux_dout[1]), .q_b(dout[1])   );
cl_mc1_tisram_blb_4x  dout_0 ( .l1clk(latch_clk),  .d_a(mux_dout[0]), .q_b(dout[0])    );










//assign dout = r_tsb_rd ? tsb_dout : dev_dout ;	// behavioural before output latch added above



endmodule  // n2_iom_sp_devtsb_cust


module n2_iom_sp_1024b_cust (

  clk,
  adr_r,
  adr_w,
  rd,
  wr,
  din,
  dout

);


  input		 clk;
  input	[3:0]	 adr_r;
  input	[3:0]	 adr_w;
  input          rd;
  input	 	 wr;
  input  [63:0]  din;
  output [63:0]  dout;


/* RAM Array: =16 - 1        -> 15    */

reg     [63:0]  array_ram      [0:15];
reg     [63:0]  dout;

`ifndef NOINITMEM
integer i;

initial begin
  for (i=0; i<16; i=i+1) begin
    array_ram[i] = 64'b0;
  end
dout[63:0] = 64'b0;
end
`endif


// ----------------------------------------------------------------------------
// Read/write the array, single port
// ----------------------------------------------------------------------------
always @(clk or rd or adr_r or wr or adr_w or din  ) begin
        if (clk) begin
        if (rd ) begin
        dout[63:0] <=     array_ram[adr_r[3:0]];
        end
	else begin
        dout[63:0] <=     {64{1'b0}};
	if (wr )
        array_ram[adr_w[3:0]] <= din[63:0];
	end
        end
end


endmodule       // n2_iom_sp_1024b_cust



module n2_iom_sp_2048b_cust (

  clk,
  adr_r,
  adr_w,
  rd,
  wr,
  din,
  dout,
  efu_bits

);


  input		 clk;
  input	[4:0]	 adr_r;
  input	[4:0]	 adr_w;
  input          rd;
  input	 	 wr;
  input  [63:0]  din;
  input  [3:0]   efu_bits;
  output [63:0]  dout;


/* RAM Array: =32 - 1        -> 31    */

reg     [63:0]  array_ram      [0:31];
reg     [63:0]  dout;

`ifndef NOINITMEM
integer i;

initial begin
  for (i=0; i<32; i=i+1) begin
    array_ram[i] = 64'b0;
  end
dout[63:0] = 64'b0;
end
`endif

// 0in one_hot -var efu_bits
// ----------------------------------------------------------------------------
// Read/write the array , single port
// ----------------------------------------------------------------------------
always @(clk or rd or adr_r or wr or adr_w or din or efu_bits) begin

        if (clk) begin
        if (rd) begin
                if (efu_bits[0]) begin
              dout[63:0] <=     array_ram[adr_r[4:0]];
                end
                else if (efu_bits[1]) begin
              dout[63:0] <=      array_ram[adr_r[4:0]];
                end
                else if (efu_bits[2]) begin
              dout[63:0] <=      array_ram[adr_r[4:0]];
                end
                else if (efu_bits[3]) begin
              dout[63:0] <=      array_ram[adr_r[4:0]];
                end
            end
	else begin
	dout[63:0] <= {64{1'b0}};
        if(wr ) 
        array_ram[adr_w[4:0]] <= din[63:0];
	end
        end
end


endmodule       // n2_iom_sp_2048b_cust


