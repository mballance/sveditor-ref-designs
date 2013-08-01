// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_dmu_dp_512x60s_cust.v
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
module n2_dmu_dp_512x60s_cust	(
   // clocks, scan
   clk,  
   scan_in,
   tcu_scan_en,
   tcu_se_scancollar_in,
   tcu_pce_ov,  
   pce,
   tcu_aclk,
   tcu_bclk,
   tcu_array_wr_inhibit,
   scan_out,   

   // ram control
   rd_addr,
   wr_addr,
   rd_en, 
   wr_en,
   din, 
   dout    

);




   // clocks, scan
   input                clk;                    	// io clock
   input                scan_in;			//  
   input                tcu_scan_en;			// 
   input                tcu_se_scancollar_in;		// 
   input                tcu_pce_ov;             	// scan signals
   input                pce;				// 
   input                tcu_aclk;			// 
   input                tcu_bclk;			// 
   input                tcu_array_wr_inhibit;		// 
   output               scan_out;			// 


   // 
   input [8:0]		rd_addr;		//  a port address in
   input [8:0]		wr_addr;		//  b port address in
   input		rd_en;			//  a port enable
   input		wr_en;			//  a write port enable
   input [59:0] 	din;			//  data in
   output [59:0] 	dout;			//  data out


  //------------------------------------------------------------------------
  //  scan chain connections
  //------------------------------------------------------------------------
// scan renames
wire [1:0]	siclk,soclk;
wire	se,wr_inhibit,and_clk;
assign wr_inhibit = tcu_array_wr_inhibit;
// end scan
  //------------------------------------------------------------------------
  //  instantiate clock headers
  //------------------------------------------------------------------------
wire [1:0]   collar_clk;
wire pce_ov = tcu_pce_ov;
wire stop   = 1'b0;
wire aclk   = tcu_aclk;
wire bclk   = tcu_bclk;
assign se = tcu_se_scancollar_in;       // TEMP

cl_dp1_l1hdr_8x clk_hdr_ctrl (
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

cl_dp1_l1hdr_8x clk_hdr_din (
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

wire	[8:0]	rd_addr_array,rd_addr_so;
wire	[8:0]	wr_addr_array,wr_addr_so;
wire		rd_en_array,wr_en_array;
wire		rd_en_so,wr_en_so;
wire	[59:0]	din_array;
wire	[59:1]	din_so;

cl_sc1_msff_4x	din_59 ( .si(scan_in), .so(din_so[59]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[59]), .q(din_array[59])	);
cl_sc1_msff_4x	din_58 ( .si(din_so[59]), .so(din_so[58]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[58]), .q(din_array[58])	);
cl_sc1_msff_4x	din_57 ( .si(din_so[58]), .so(din_so[57]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[57]), .q(din_array[57])	);
cl_sc1_msff_4x	din_56 ( .si(din_so[57]), .so(din_so[56]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[56]), .q(din_array[56])	);
cl_sc1_msff_4x	din_55 ( .si(din_so[56]), .so(din_so[55]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[55]), .q(din_array[55])	);
cl_sc1_msff_4x	din_54 ( .si(din_so[55]), .so(din_so[54]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[54]), .q(din_array[54])	);
cl_sc1_msff_4x	din_53 ( .si(din_so[54]), .so(din_so[53]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[53]), .q(din_array[53])	);
cl_sc1_msff_4x	din_52 ( .si(din_so[53]), .so(din_so[52]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[52]), .q(din_array[52])	);
cl_sc1_msff_4x	din_51 ( .si(din_so[52]), .so(din_so[51]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[51]), .q(din_array[51])	);
cl_sc1_msff_4x	din_50 ( .si(din_so[51]), .so(din_so[50]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[50]), .q(din_array[50])	);

cl_sc1_msff_4x	din_49 ( .si(din_so[50]), .so(din_so[49]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[49]), .q(din_array[49])	);
cl_sc1_msff_4x	din_48 ( .si(din_so[49]), .so(din_so[48]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[48]), .q(din_array[48])	);
cl_sc1_msff_4x	din_47 ( .si(din_so[48]), .so(din_so[47]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[47]), .q(din_array[47])	);
cl_sc1_msff_4x	din_46 ( .si(din_so[47]), .so(din_so[46]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[46]), .q(din_array[46])	);
cl_sc1_msff_4x	din_45 ( .si(din_so[46]), .so(din_so[45]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[45]), .q(din_array[45])	);
cl_sc1_msff_4x	din_44 ( .si(din_so[45]), .so(din_so[44]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[44]), .q(din_array[44])	);
cl_sc1_msff_4x	din_43 ( .si(din_so[44]), .so(din_so[43]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[43]), .q(din_array[43])	);
cl_sc1_msff_4x	din_42 ( .si(din_so[43]), .so(din_so[42]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[42]), .q(din_array[42])	);
cl_sc1_msff_4x	din_41 ( .si(din_so[42]), .so(din_so[41]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[41]), .q(din_array[41])	);
cl_sc1_msff_4x	din_40 ( .si(din_so[41]), .so(din_so[40]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[40]), .q(din_array[40])	);

cl_sc1_msff_4x	din_39 ( .si(din_so[40]), .so(din_so[39]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[39]), .q(din_array[39])	);
cl_sc1_msff_4x	din_38 ( .si(din_so[39]), .so(din_so[38]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[38]), .q(din_array[38])	);
cl_sc1_msff_4x	din_37 ( .si(din_so[38]), .so(din_so[37]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[37]), .q(din_array[37])	);
cl_sc1_msff_4x	din_36 ( .si(din_so[37]), .so(din_so[36]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[36]), .q(din_array[36])	);
cl_sc1_msff_4x	din_35 ( .si(din_so[36]), .so(din_so[35]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[35]), .q(din_array[35])	);
cl_sc1_msff_4x	din_34 ( .si(din_so[35]), .so(din_so[34]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[34]), .q(din_array[34])	);
cl_sc1_msff_4x	din_33 ( .si(din_so[34]), .so(din_so[33]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[33]), .q(din_array[33])	);
cl_sc1_msff_4x	din_32 ( .si(din_so[33]), .so(din_so[32]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[32]), .q(din_array[32])	);
cl_sc1_msff_4x	din_31 ( .si(din_so[32]), .so(din_so[31]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[31]), .q(din_array[31])	);
cl_sc1_msff_4x	din_30 ( .si(din_so[31]), .so(din_so[30]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[30]), .q(din_array[30])	);


cl_mc1_sram_msff_mo_8x	ff_rd_en ( .si(din_so[30]), .so(rd_en_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_en), .mq(rd_en_array), .and_clk(and_clk)	);




cl_mc1_sram_msff_mo_8x	rd_addr_so_8 ( .si(rd_en_so), .so(rd_addr_so[8]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_addr[8]), .mq(rd_addr_array[8]), .and_clk(and_clk)	);
cl_mc1_sram_msff_mo_8x	rd_addr_so_7 ( .si(rd_addr_so[8]), .so(rd_addr_so[7]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_addr[7]), .mq(rd_addr_array[7]), .and_clk(and_clk)	);
cl_mc1_sram_msff_mo_8x	rd_addr_so_6 ( .si(rd_addr_so[7]), .so(rd_addr_so[6]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_addr[6]), .mq(rd_addr_array[6]), .and_clk(and_clk)	);
cl_mc1_sram_msff_mo_8x	rd_addr_so_5 ( .si(rd_addr_so[6]), .so(rd_addr_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_addr[5]), .mq(rd_addr_array[5]), .and_clk(and_clk)	);
cl_mc1_sram_msff_mo_8x	rd_addr_so_4 ( .si(rd_addr_so[5]), .so(rd_addr_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_addr[4]), .mq(rd_addr_array[4]), .and_clk(and_clk)	);
cl_mc1_sram_msff_mo_8x	rd_addr_so_3 ( .si(rd_addr_so[4]), .so(rd_addr_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_addr[3]), .mq(rd_addr_array[3]), .and_clk(and_clk)	);
cl_mc1_sram_msff_mo_8x	rd_addr_so_2 ( .si(rd_addr_so[3]), .so(rd_addr_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_addr[2]), .mq(rd_addr_array[2]), .and_clk(and_clk)	);
cl_mc1_sram_msff_mo_8x	rd_addr_so_1 ( .si(rd_addr_so[2]), .so(rd_addr_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_addr[1]), .mq(rd_addr_array[1]), .and_clk(and_clk)	);
cl_mc1_sram_msff_mo_8x	rd_addr_so_0 ( .si(rd_addr_so[1]), .so(rd_addr_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_addr[0]), .mq(rd_addr_array[0]), .and_clk(and_clk)	);


cl_sc1_msff_8x	ff_wr_en ( .si(rd_addr_so[0]), .so(wr_en_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_en), .q(wr_en_array)	);



cl_sc1_msff_4x	wr_addr_so_8 ( .si(wr_en_so), .so(wr_addr_so[8]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[8]), .q(wr_addr_array[8])	);
cl_sc1_msff_4x	wr_addr_so_7 ( .si(wr_addr_so[8]), .so(wr_addr_so[7]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[7]), .q(wr_addr_array[7])	);
cl_sc1_msff_4x	wr_addr_so_6 ( .si(wr_addr_so[7]), .so(wr_addr_so[6]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[6]), .q(wr_addr_array[6])	);
cl_sc1_msff_4x	wr_addr_so_5 ( .si(wr_addr_so[6]), .so(wr_addr_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[5]), .q(wr_addr_array[5])	);
cl_sc1_msff_4x	wr_addr_so_4 ( .si(wr_addr_so[5]), .so(wr_addr_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[4]), .q(wr_addr_array[4])	);
cl_sc1_msff_4x	wr_addr_so_3 ( .si(wr_addr_so[4]), .so(wr_addr_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[3]), .q(wr_addr_array[3])	);
cl_sc1_msff_4x	wr_addr_so_2 ( .si(wr_addr_so[3]), .so(wr_addr_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[2]), .q(wr_addr_array[2])	);
cl_sc1_msff_4x	wr_addr_so_1 ( .si(wr_addr_so[2]), .so(wr_addr_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[1]), .q(wr_addr_array[1])	);
cl_sc1_msff_4x	wr_addr_so_0 ( .si(wr_addr_so[1]), .so(wr_addr_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[0]), .q(wr_addr_array[0])	);





cl_sc1_msff_4x	din_29 ( .si(wr_addr_so[0]), .so(din_so[29]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[29]), .q(din_array[29])	);
cl_sc1_msff_4x	din_28 ( .si(din_so[29]), .so(din_so[28]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[28]), .q(din_array[28])	);
cl_sc1_msff_4x	din_27 ( .si(din_so[28]), .so(din_so[27]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[27]), .q(din_array[27])	);
cl_sc1_msff_4x	din_26 ( .si(din_so[27]), .so(din_so[26]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[26]), .q(din_array[26])	);
cl_sc1_msff_4x	din_25 ( .si(din_so[26]), .so(din_so[25]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[25]), .q(din_array[25])	);
cl_sc1_msff_4x	din_24 ( .si(din_so[25]), .so(din_so[24]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[24]), .q(din_array[24])	);
cl_sc1_msff_4x	din_23 ( .si(din_so[24]), .so(din_so[23]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[23]), .q(din_array[23])	);
cl_sc1_msff_4x	din_22 ( .si(din_so[23]), .so(din_so[22]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[22]), .q(din_array[22])	);
cl_sc1_msff_4x	din_21 ( .si(din_so[22]), .so(din_so[21]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[21]), .q(din_array[21])	);
cl_sc1_msff_4x	din_20 ( .si(din_so[21]), .so(din_so[20]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[20]), .q(din_array[20])	);

cl_sc1_msff_4x	din_19 ( .si(din_so[20]), .so(din_so[19]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[19]), .q(din_array[19])	);
cl_sc1_msff_4x	din_18 ( .si(din_so[19]), .so(din_so[18]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[18]), .q(din_array[18])	);
cl_sc1_msff_4x	din_17 ( .si(din_so[18]), .so(din_so[17]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[17]), .q(din_array[17])	);
cl_sc1_msff_4x	din_16 ( .si(din_so[17]), .so(din_so[16]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[16]), .q(din_array[16])	);
cl_sc1_msff_4x	din_15 ( .si(din_so[16]), .so(din_so[15]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[15]), .q(din_array[15])	);
cl_sc1_msff_4x	din_14 ( .si(din_so[15]), .so(din_so[14]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[14]), .q(din_array[14])	);
cl_sc1_msff_4x	din_13 ( .si(din_so[14]), .so(din_so[13]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[13]), .q(din_array[13])	);
cl_sc1_msff_4x	din_12 ( .si(din_so[13]), .so(din_so[12]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[12]), .q(din_array[12])	);
cl_sc1_msff_4x	din_11 ( .si(din_so[12]), .so(din_so[11]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[11]), .q(din_array[11])	);
cl_sc1_msff_4x	din_10 ( .si(din_so[11]), .so(din_so[10]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[10]), .q(din_array[10])	);

cl_sc1_msff_4x	din_9 ( .si(din_so[10]), .so(din_so[9]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[9]), .q(din_array[9])	);
cl_sc1_msff_4x	din_8 ( .si(din_so[9]), .so(din_so[8]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[8]), .q(din_array[8])	);
cl_sc1_msff_4x	din_7 ( .si(din_so[8]), .so(din_so[7]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[7]), .q(din_array[7])	);
cl_sc1_msff_4x	din_6 ( .si(din_so[7]), .so(din_so[6]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[6]), .q(din_array[6])	);
cl_sc1_msff_4x	din_5 ( .si(din_so[6]), .so(din_so[5]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[5]), .q(din_array[5])	);
cl_sc1_msff_4x	din_4 ( .si(din_so[5]), .so(din_so[4]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[4]), .q(din_array[4])	);
cl_sc1_msff_4x	din_3 ( .si(din_so[4]), .so(din_so[3]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[3]), .q(din_array[3])	);
cl_sc1_msff_4x	din_2 ( .si(din_so[3]), .so(din_so[2]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[2]), .q(din_array[2])	);
cl_sc1_msff_4x	din_1 ( .si(din_so[2]), .so(din_so[1]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[1]), .q(din_array[1])	);
cl_sc1_msff_4x	din_0 ( .si(din_so[1]), .so(scan_out), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), 
		.d(din[0]), .q(din_array[0])	);




//assign        rd_array = !wr_inhibit && rd_en_array;
//assign        wr_array = !wr_inhibit && wr_en_array;

wire    x1_,wr_array, rd_array;
not  rd2 (x1_,wr_inhibit);
and  rd1 (rd_array,rd_en_array,x1_);

and  wr1 (wr_array,wr_en_array,x1_);


  //------------------------------------------------------------------------
  //  instantiate the clock-less ram
  //------------------------------------------------------------------------
wire	[59:0]	dout_array;	
n2_dmu_dp_512x60s_cust_array	dmu_tdb_ram(
		.clk			(and_clk),
		.rd_addr_array		(rd_addr_array[8:0]),
		.wr_addr_array		(wr_addr_array[8:0]),
		.rd_array		(rd_array),
		.wr_array		(wr_array),
		.din_array		(din_array[59:0]),
		.dout_array		(dout_array[59:0])
		);

assign	dout[59:0] =  dout_array[59:0];



endmodule	//n2_dmu_dp_512x60s_cust



module n2_dmu_dp_512x60s_cust_array	(

   // ram control
   clk,
   rd_addr_array,
   wr_addr_array,
   rd_array, 
   wr_array,
   din_array, 
   dout_array    

);




   // 
   input 		clk;				// clk 
   input [8:0]		rd_addr_array;			// read port address in
   input [8:0]		wr_addr_array;			// write port address in
   input		rd_array;			// read port enable
   input		wr_array;			// write port enable
   input [59:0] 	din_array;			// data in
   output [59:0] 	dout_array;			// data out


// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------
// checker to verify on accesses's that no bits are x
/* //BP 0in assert -var (((|rd_addr_array[8:0] ) == 1'bx)
                    || ((|wr_addr_array[8:0] ) == 1'bx)
                    || ((rd_en_array ) == 1'bx)
                    || ((wr_en_array ) == 1'bx)
               -active (rd_en_array )
               -module dmu_ram512x36_array
                -name dmu_ram512x36_array_x
*/
  // 0in kndr -var rd_addr_array
  // 0in kndr -var wr_addr_array
  // 0in kndr -var rd_array
  // 0in kndr -var wr_array
  // 0in kndr -var din_array -active (wr_array )


/* RAM Array: =512 - 1        -> 511    */

reg     [59:0]  array_ram      [0:511];
reg	[59:0]	dout_array;

`ifndef NOINITMEM
integer	i;

initial begin
  for (i=0; i<512; i=i+1) begin
    array_ram[i] = 60'b0;
  end
  dout_array = 60'b0;
end
`endif


// ----------------------------------------------------------------------------
// Read the array
// ----------------------------------------------------------------------------
//assign	dout_array[35:0] =	array_ram[rd_addr_array[8:0]];
always @(clk or rd_array or  rd_addr_array or wr_addr_array or wr_array ) begin
	if (clk) begin
        if (rd_array) begin
		if (wr_array  & (rd_addr_array == wr_addr_array)) begin
                dout_array[59:0] <= {60{1'bx}}; //0in < fire -severity 1 -message " got x's in dmu/tdb" -group mbist_mode
                end
        	else begin
		dout_array[59:0] <=     array_ram[rd_addr_array[8:0]];
        	end
	end
	else begin
		dout_array[59:0] <=    {60{1'b0}};
	end
        end
end





// ----------------------------------------------------------------------------
// Write the array, note: it is written when the clock is low
// ----------------------------------------------------------------------------
always @(wr_array or wr_addr_array or clk or din_array  ) begin
	if(~clk) begin
	if(wr_array ) begin
	array_ram[wr_addr_array[8:0]] <= din_array[59:0];
	end
	end
end



endmodule	// n2_dmu_dp_512x60s_cust_array


