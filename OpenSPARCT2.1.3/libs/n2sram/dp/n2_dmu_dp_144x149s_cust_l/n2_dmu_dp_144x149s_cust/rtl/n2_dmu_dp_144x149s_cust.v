// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_dmu_dp_144x149s_cust.v
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
module n2_dmu_dp_144x149s_cust	(
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
   input [7:0]		rd_addr;		//  a port address in
   input [7:0]		wr_addr;		//  b port address in
   input		rd_en;			//  a port enable
   input		wr_en;			//  a port enable
   input [148:0] 	din;			//  data in
   output [148:0] 	dout;			//  data out


  //------------------------------------------------------------------------
  //  scan chain connections
  //------------------------------------------------------------------------
// scan renames
wire	[3:0] siclk,soclk;
wire	se,wr_inhibit_array,and_clk;
assign	wr_inhibit_array	=	tcu_array_wr_inhibit;
// end scan

  //------------------------------------------------------------------------
  //  instantiate clock headers
  //------------------------------------------------------------------------
wire    [3:0] collar_clk;
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

cl_dp1_l1hdr_8x clk_hdr_data2 (
        .l2clk(clk),
        .pce (pce),
        .l1clk(collar_clk[2]),
        .siclk_out(siclk[2]),
        .soclk_out(soclk[2]),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .aclk(aclk),
  .bclk(bclk)
);

cl_dp1_l1hdr_8x clk_hdr_data3 (
        .l2clk(clk),
        .pce (pce),
        .l1clk(collar_clk[3]),
        .siclk_out(siclk[3]),
        .soclk_out(soclk[3]),
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
wire	[7:0]	rd_addr_array,rd_addr_so;
wire	[7:0]	wr_addr_array,wr_addr_so;
wire		rd_en_array,wr_en_array;
wire		rd_en_so,wr_en_so;
wire	[148:0]	din_array,din_so;

cl_mc1_sram_msff_mo_8x	rd_addr_so_7 ( .si(scan_in), .so(rd_addr_so[7]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
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

cl_sc1_msff_8x	wr_addr_so_7 ( .si(rd_addr_so[0]), .so(wr_addr_so[7]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[7]), .q(wr_addr_array[7])	);
cl_sc1_msff_8x	wr_addr_so_6 ( .si(wr_addr_so[7]), .so(wr_addr_so[6]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[6]), .q(wr_addr_array[6])	);
cl_sc1_msff_8x	wr_addr_so_5 ( .si(wr_addr_so[6]), .so(wr_addr_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[5]), .q(wr_addr_array[5])	);
cl_sc1_msff_8x	wr_addr_so_4 ( .si(wr_addr_so[5]), .so(wr_addr_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[4]), .q(wr_addr_array[4])	);
cl_sc1_msff_8x	wr_addr_so_3 ( .si(wr_addr_so[4]), .so(wr_addr_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[3]), .q(wr_addr_array[3])	);
cl_sc1_msff_8x	wr_addr_so_2 ( .si(wr_addr_so[3]), .so(wr_addr_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[2]), .q(wr_addr_array[2])	);
cl_sc1_msff_8x	wr_addr_so_1 ( .si(wr_addr_so[2]), .so(wr_addr_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[1]), .q(wr_addr_array[1])	);
cl_sc1_msff_8x	wr_addr_so_0 ( .si(wr_addr_so[1]), .so(wr_addr_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_addr[0]), .q(wr_addr_array[0])	);

cl_mc1_sram_msff_mo_8x	ff_rd_en ( .si(wr_addr_so[0]), .so(rd_en_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(rd_en), .mq(rd_en_array), .and_clk(and_clk)	);

cl_sc1_msff_8x	ff_wr_en ( .si(rd_en_so), .so(wr_en_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), 
		.d(wr_en), .q(wr_en_array)	);


cl_sc1_msff_8x	din_148 ( .si(wr_en_so), .so(din_so[148]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[148]), .q(din_array[148]) );
cl_sc1_msff_8x	din_147 ( .si(din_so[148]), .so(din_so[147]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[147]), .q(din_array[147]) );
cl_sc1_msff_8x	din_146 ( .si(din_so[147]), .so(din_so[146]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[146]), .q(din_array[146]) );
cl_sc1_msff_8x	din_145 ( .si(din_so[146]), .so(din_so[145]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[145]), .q(din_array[145]) );
cl_sc1_msff_8x	din_144 ( .si(din_so[145]), .so(din_so[144]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[144]), .q(din_array[144]) );
cl_sc1_msff_8x	din_143 ( .si(din_so[144]), .so(din_so[143]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[143]), .q(din_array[143]) );
cl_sc1_msff_8x	din_142 ( .si(din_so[143]), .so(din_so[142]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[142]), .q(din_array[142]) );
cl_sc1_msff_8x	din_141 ( .si(din_so[142]), .so(din_so[141]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[141]), .q(din_array[141]) );
cl_sc1_msff_8x	din_140 ( .si(din_so[141]), .so(din_so[140]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[140]), .q(din_array[140]) );

cl_sc1_msff_8x	din_139 ( .si(din_so[140]), .so(din_so[139]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[139]), .q(din_array[139]) );
cl_sc1_msff_8x	din_138 ( .si(din_so[139]), .so(din_so[138]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[138]), .q(din_array[138]) );
cl_sc1_msff_8x	din_137 ( .si(din_so[138]), .so(din_so[137]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[137]), .q(din_array[137]) );
cl_sc1_msff_8x	din_136 ( .si(din_so[137]), .so(din_so[136]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[136]), .q(din_array[136]) );
cl_sc1_msff_8x	din_135 ( .si(din_so[136]), .so(din_so[135]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[135]), .q(din_array[135]) );
cl_sc1_msff_8x	din_134 ( .si(din_so[135]), .so(din_so[134]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[134]), .q(din_array[134]) );
cl_sc1_msff_8x	din_133 ( .si(din_so[134]), .so(din_so[133]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[133]), .q(din_array[133]) );
cl_sc1_msff_8x	din_132 ( .si(din_so[133]), .so(din_so[132]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[132]), .q(din_array[132]) );
cl_sc1_msff_8x	din_131 ( .si(din_so[132]), .so(din_so[131]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[131]), .q(din_array[131]) );
cl_sc1_msff_8x	din_130 ( .si(din_so[131]), .so(din_so[130]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[130]), .q(din_array[130]) );

cl_sc1_msff_8x	din_129 ( .si(din_so[130]), .so(din_so[129]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[129]), .q(din_array[129]) );
cl_sc1_msff_8x	din_128 ( .si(din_so[129]), .so(din_so[128]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[128]), .q(din_array[128]) );
cl_sc1_msff_8x	din_127 ( .si(din_so[128]), .so(din_so[127]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[127]), .q(din_array[127]) );
cl_sc1_msff_8x	din_126 ( .si(din_so[127]), .so(din_so[126]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[126]), .q(din_array[126]) );
cl_sc1_msff_8x	din_125 ( .si(din_so[126]), .so(din_so[125]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[125]), .q(din_array[125]) );
cl_sc1_msff_8x	din_124 ( .si(din_so[125]), .so(din_so[124]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[124]), .q(din_array[124]) );
cl_sc1_msff_8x	din_123 ( .si(din_so[124]), .so(din_so[123]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[123]), .q(din_array[123]) );
cl_sc1_msff_8x	din_122 ( .si(din_so[123]), .so(din_so[122]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[122]), .q(din_array[122]) );
cl_sc1_msff_8x	din_121 ( .si(din_so[122]), .so(din_so[121]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[121]), .q(din_array[121]) );
cl_sc1_msff_8x	din_120 ( .si(din_so[121]), .so(din_so[120]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[120]), .q(din_array[120]) );

cl_sc1_msff_8x	din_119 ( .si(din_so[120]), .so(din_so[119]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[119]), .q(din_array[119]) );
cl_sc1_msff_8x	din_118 ( .si(din_so[119]), .so(din_so[118]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[118]), .q(din_array[118]) );
cl_sc1_msff_8x	din_117 ( .si(din_so[118]), .so(din_so[117]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[117]), .q(din_array[117]) );
cl_sc1_msff_8x	din_116 ( .si(din_so[117]), .so(din_so[116]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[116]), .q(din_array[116]) );
cl_sc1_msff_8x	din_115 ( .si(din_so[116]), .so(din_so[115]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[115]), .q(din_array[115]) );
cl_sc1_msff_8x	din_114 ( .si(din_so[115]), .so(din_so[114]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[114]), .q(din_array[114]) );
cl_sc1_msff_8x	din_113 ( .si(din_so[114]), .so(din_so[113]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[113]), .q(din_array[113]) );
cl_sc1_msff_8x	din_112 ( .si(din_so[113]), .so(din_so[112]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[112]), .q(din_array[112]) );
cl_sc1_msff_8x	din_111 ( .si(din_so[112]), .so(din_so[111]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[111]), .q(din_array[111]) );
cl_sc1_msff_8x	din_110 ( .si(din_so[111]), .so(din_so[110]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[110]), .q(din_array[110]) );

cl_sc1_msff_8x	din_109 ( .si(din_so[110]), .so(din_so[109]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[109]), .q(din_array[109]) );
cl_sc1_msff_8x	din_108 ( .si(din_so[109]), .so(din_so[108]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[108]), .q(din_array[108]) );
cl_sc1_msff_8x	din_107 ( .si(din_so[108]), .so(din_so[107]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[107]), .q(din_array[107]) );
cl_sc1_msff_8x	din_106 ( .si(din_so[107]), .so(din_so[106]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[106]), .q(din_array[106]) );
cl_sc1_msff_8x	din_105 ( .si(din_so[106]), .so(din_so[105]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[105]), .q(din_array[105]) );
cl_sc1_msff_8x	din_104 ( .si(din_so[105]), .so(din_so[104]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[104]), .q(din_array[104]) );
cl_sc1_msff_8x	din_103 ( .si(din_so[104]), .so(din_so[103]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[103]), .q(din_array[103]) );
cl_sc1_msff_8x	din_102 ( .si(din_so[103]), .so(din_so[102]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[102]), .q(din_array[102]) );
cl_sc1_msff_8x	din_101 ( .si(din_so[102]), .so(din_so[101]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[101]), .q(din_array[101]) );
cl_sc1_msff_8x	din_100 ( .si(din_so[101]), .so(din_so[100]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[100]), .q(din_array[100]) );

cl_sc1_msff_8x	din_99 ( .si(din_so[100]), .so(din_so[99]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[99]), .q(din_array[99]) );
cl_sc1_msff_8x	din_98 ( .si(din_so[99]), .so(din_so[98]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[98]), .q(din_array[98]) );
cl_sc1_msff_8x	din_97 ( .si(din_so[98]), .so(din_so[97]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[97]), .q(din_array[97]) );
cl_sc1_msff_8x	din_96 ( .si(din_so[97]), .so(din_so[96]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[96]), .q(din_array[96]) );
cl_sc1_msff_8x	din_95 ( .si(din_so[96]), .so(din_so[95]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[95]), .q(din_array[95]) );
cl_sc1_msff_8x	din_94 ( .si(din_so[95]), .so(din_so[94]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[94]), .q(din_array[94]) );
cl_sc1_msff_8x	din_93 ( .si(din_so[94]), .so(din_so[93]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[93]), .q(din_array[93]) );
cl_sc1_msff_8x	din_92 ( .si(din_so[93]), .so(din_so[92]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[92]), .q(din_array[92]) );
cl_sc1_msff_8x	din_91 ( .si(din_so[92]), .so(din_so[91]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[91]), .q(din_array[91]) );
cl_sc1_msff_8x	din_90 ( .si(din_so[91]), .so(din_so[90]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[90]), .q(din_array[90]) );

cl_sc1_msff_8x	din_89 ( .si(din_so[90]), .so(din_so[89]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[89]), .q(din_array[89]) );
cl_sc1_msff_8x	din_88 ( .si(din_so[89]), .so(din_so[88]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[88]), .q(din_array[88]) );
cl_sc1_msff_8x	din_87 ( .si(din_so[88]), .so(din_so[87]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[87]), .q(din_array[87]) );
cl_sc1_msff_8x	din_86 ( .si(din_so[87]), .so(din_so[86]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[86]), .q(din_array[86]) );
cl_sc1_msff_8x	din_85 ( .si(din_so[86]), .so(din_so[85]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[85]), .q(din_array[85]) );
cl_sc1_msff_8x	din_84 ( .si(din_so[85]), .so(din_so[84]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[84]), .q(din_array[84]) );
cl_sc1_msff_8x	din_83 ( .si(din_so[84]), .so(din_so[83]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[83]), .q(din_array[83]) );
cl_sc1_msff_8x	din_82 ( .si(din_so[83]), .so(din_so[82]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[82]), .q(din_array[82]) );
cl_sc1_msff_8x	din_81 ( .si(din_so[82]), .so(din_so[81]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[81]), .q(din_array[81]) );
cl_sc1_msff_8x	din_80 ( .si(din_so[81]), .so(din_so[80]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[80]), .q(din_array[80]) );

cl_sc1_msff_8x	din_79 ( .si(din_so[80]), .so(din_so[79]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[79]), .q(din_array[79]) );
cl_sc1_msff_8x	din_78 ( .si(din_so[79]), .so(din_so[78]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[78]), .q(din_array[78]) );
cl_sc1_msff_8x	din_77 ( .si(din_so[78]), .so(din_so[77]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[77]), .q(din_array[77]) );
cl_sc1_msff_8x	din_76 ( .si(din_so[77]), .so(din_so[76]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[76]), .q(din_array[76]) );
cl_sc1_msff_8x	din_75 ( .si(din_so[76]), .so(din_so[75]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[75]), .q(din_array[75]) );
cl_sc1_msff_8x	din_74 ( .si(din_so[75]), .so(din_so[74]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[74]), .q(din_array[74]) );
cl_sc1_msff_8x	din_73 ( .si(din_so[74]), .so(din_so[73]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[73]), .q(din_array[73]) );
cl_sc1_msff_8x	din_72 ( .si(din_so[73]), .so(din_so[72]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[72]), .q(din_array[72]) );
cl_sc1_msff_8x	din_71 ( .si(din_so[72]), .so(din_so[71]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[71]), .q(din_array[71]) );
cl_sc1_msff_8x	din_70 ( .si(din_so[71]), .so(din_so[70]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[70]), .q(din_array[70]) );

cl_sc1_msff_8x	din_69 ( .si(din_so[70]), .so(din_so[69]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[69]), .q(din_array[69]) );
cl_sc1_msff_8x	din_68 ( .si(din_so[69]), .so(din_so[68]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[68]), .q(din_array[68]) );
cl_sc1_msff_8x	din_67 ( .si(din_so[68]), .so(din_so[67]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[67]), .q(din_array[67]) );
cl_sc1_msff_8x	din_66 ( .si(din_so[67]), .so(din_so[66]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[66]), .q(din_array[66]) );
cl_sc1_msff_8x	din_65 ( .si(din_so[66]), .so(din_so[65]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[65]), .q(din_array[65]) );
cl_sc1_msff_8x	din_64 ( .si(din_so[65]), .so(din_so[64]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[64]), .q(din_array[64]) );
cl_sc1_msff_8x	din_63 ( .si(din_so[64]), .so(din_so[63]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[63]), .q(din_array[63]) );
cl_sc1_msff_8x	din_62 ( .si(din_so[63]), .so(din_so[62]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[62]), .q(din_array[62]) );
cl_sc1_msff_8x	din_61 ( .si(din_so[62]), .so(din_so[61]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[61]), .q(din_array[61]) );
cl_sc1_msff_8x	din_60 ( .si(din_so[61]), .so(din_so[60]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[60]), .q(din_array[60]) );

cl_sc1_msff_8x	din_59 ( .si(din_so[60]), .so(din_so[59]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[59]), .q(din_array[59]) );
cl_sc1_msff_8x	din_58 ( .si(din_so[59]), .so(din_so[58]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[58]), .q(din_array[58]) );
cl_sc1_msff_8x	din_57 ( .si(din_so[58]), .so(din_so[57]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[57]), .q(din_array[57]) );
cl_sc1_msff_8x	din_56 ( .si(din_so[57]), .so(din_so[56]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[56]), .q(din_array[56]) );
cl_sc1_msff_8x	din_55 ( .si(din_so[56]), .so(din_so[55]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[55]), .q(din_array[55]) );
cl_sc1_msff_8x	din_54 ( .si(din_so[55]), .so(din_so[54]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[54]), .q(din_array[54]) );
cl_sc1_msff_8x	din_53 ( .si(din_so[54]), .so(din_so[53]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[53]), .q(din_array[53]) );
cl_sc1_msff_8x	din_52 ( .si(din_so[53]), .so(din_so[52]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[52]), .q(din_array[52]) );
cl_sc1_msff_8x	din_51 ( .si(din_so[52]), .so(din_so[51]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[51]), .q(din_array[51]) );
cl_sc1_msff_8x	din_50 ( .si(din_so[51]), .so(din_so[50]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[50]), .q(din_array[50]) );

cl_sc1_msff_8x	din_49 ( .si(din_so[50]), .so(din_so[49]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[49]), .q(din_array[49]) );
cl_sc1_msff_8x	din_48 ( .si(din_so[49]), .so(din_so[48]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[48]), .q(din_array[48]) );
cl_sc1_msff_8x	din_47 ( .si(din_so[48]), .so(din_so[47]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[47]), .q(din_array[47]) );
cl_sc1_msff_8x	din_46 ( .si(din_so[47]), .so(din_so[46]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[46]), .q(din_array[46]) );
cl_sc1_msff_8x	din_45 ( .si(din_so[46]), .so(din_so[45]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[45]), .q(din_array[45]) );
cl_sc1_msff_8x	din_44 ( .si(din_so[45]), .so(din_so[44]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[44]), .q(din_array[44]) );
cl_sc1_msff_8x	din_43 ( .si(din_so[44]), .so(din_so[43]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[43]), .q(din_array[43]) );
cl_sc1_msff_8x	din_42 ( .si(din_so[43]), .so(din_so[42]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[42]), .q(din_array[42]) );
cl_sc1_msff_8x	din_41 ( .si(din_so[42]), .so(din_so[41]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[41]), .q(din_array[41]) );
cl_sc1_msff_8x	din_40 ( .si(din_so[41]), .so(din_so[40]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[40]), .q(din_array[40]) );

cl_sc1_msff_8x	din_39 ( .si(din_so[40]), .so(din_so[39]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[39]), .q(din_array[39]) );
cl_sc1_msff_8x	din_38 ( .si(din_so[39]), .so(din_so[38]), .l1clk(collar_clk[2]), .siclk(siclk[2]), .soclk(soclk[2]), .d(din[38]), .q(din_array[38]) );
cl_sc1_msff_8x	din_37 ( .si(din_so[38]), .so(din_so[37]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[37]), .q(din_array[37]) );
cl_sc1_msff_8x	din_36 ( .si(din_so[37]), .so(din_so[36]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[36]), .q(din_array[36]) );
cl_sc1_msff_8x	din_35 ( .si(din_so[36]), .so(din_so[35]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[35]), .q(din_array[35]) );
cl_sc1_msff_8x	din_34 ( .si(din_so[35]), .so(din_so[34]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[34]), .q(din_array[34]) );
cl_sc1_msff_8x	din_33 ( .si(din_so[34]), .so(din_so[33]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[33]), .q(din_array[33]) );
cl_sc1_msff_8x	din_32 ( .si(din_so[33]), .so(din_so[32]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[32]), .q(din_array[32]) );
cl_sc1_msff_8x	din_31 ( .si(din_so[32]), .so(din_so[31]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[31]), .q(din_array[31]) );
cl_sc1_msff_8x	din_30 ( .si(din_so[31]), .so(din_so[30]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[30]), .q(din_array[30]) );

cl_sc1_msff_8x	din_29 ( .si(din_so[30]), .so(din_so[29]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[29]), .q(din_array[29]) );
cl_sc1_msff_8x	din_28 ( .si(din_so[29]), .so(din_so[28]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[28]), .q(din_array[28]) );
cl_sc1_msff_8x	din_27 ( .si(din_so[28]), .so(din_so[27]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[27]), .q(din_array[27]) );
cl_sc1_msff_8x	din_26 ( .si(din_so[27]), .so(din_so[26]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[26]), .q(din_array[26]) );
cl_sc1_msff_8x	din_25 ( .si(din_so[26]), .so(din_so[25]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[25]), .q(din_array[25]) );
cl_sc1_msff_8x	din_24 ( .si(din_so[25]), .so(din_so[24]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[24]), .q(din_array[24]) );
cl_sc1_msff_8x	din_23 ( .si(din_so[24]), .so(din_so[23]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[23]), .q(din_array[23]) );
cl_sc1_msff_8x	din_22 ( .si(din_so[23]), .so(din_so[22]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[22]), .q(din_array[22]) );
cl_sc1_msff_8x	din_21 ( .si(din_so[22]), .so(din_so[21]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[21]), .q(din_array[21]) );
cl_sc1_msff_8x	din_20 ( .si(din_so[21]), .so(din_so[20]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[20]), .q(din_array[20]) );

cl_sc1_msff_8x	din_19 ( .si(din_so[20]), .so(din_so[19]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[19]), .q(din_array[19]) );
cl_sc1_msff_8x	din_18 ( .si(din_so[19]), .so(din_so[18]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[18]), .q(din_array[18]) );
cl_sc1_msff_8x	din_17 ( .si(din_so[18]), .so(din_so[17]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[17]), .q(din_array[17]) );
cl_sc1_msff_8x	din_16 ( .si(din_so[17]), .so(din_so[16]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[16]), .q(din_array[16]) );
cl_sc1_msff_8x	din_15 ( .si(din_so[16]), .so(din_so[15]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[15]), .q(din_array[15]) );
cl_sc1_msff_8x	din_14 ( .si(din_so[15]), .so(din_so[14]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[14]), .q(din_array[14]) );
cl_sc1_msff_8x	din_13 ( .si(din_so[14]), .so(din_so[13]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[13]), .q(din_array[13]) );
cl_sc1_msff_8x	din_12 ( .si(din_so[13]), .so(din_so[12]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[12]), .q(din_array[12]) );
cl_sc1_msff_8x	din_11 ( .si(din_so[12]), .so(din_so[11]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[11]), .q(din_array[11]) );
cl_sc1_msff_8x	din_10 ( .si(din_so[11]), .so(din_so[10]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[10]), .q(din_array[10]) );

cl_sc1_msff_8x	din_9 ( .si(din_so[10]), .so(din_so[9]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[9]), .q(din_array[9])	);
cl_sc1_msff_8x	din_8 ( .si(din_so[9]), .so(din_so[8]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[8]), .q(din_array[8])	);
cl_sc1_msff_8x	din_7 ( .si(din_so[8]), .so(din_so[7]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[7]), .q(din_array[7])	);
cl_sc1_msff_8x	din_6 ( .si(din_so[7]), .so(din_so[6]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[6]), .q(din_array[6])	);
cl_sc1_msff_8x	din_5 ( .si(din_so[6]), .so(din_so[5]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[5]), .q(din_array[5])	);
cl_sc1_msff_8x	din_4 ( .si(din_so[5]), .so(din_so[4]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[4]), .q(din_array[4])	);
cl_sc1_msff_8x	din_3 ( .si(din_so[4]), .so(din_so[3]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[3]), .q(din_array[3])	);
cl_sc1_msff_8x	din_2 ( .si(din_so[3]), .so(din_so[2]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[2]), .q(din_array[2])	);
cl_sc1_msff_8x	din_1 ( .si(din_so[2]), .so(din_so[1]), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[1]), .q(din_array[1])	);
cl_sc1_msff_8x	din_0 ( .si(din_so[1]), .so(scan_out), .l1clk(collar_clk[3]), .siclk(siclk[3]), .soclk(soclk[3]), .d(din[0]), .q(din_array[0])	);

//assign	rd_array = !wr_inhibit_array && rd_en_array;
//assign	wr_array = !wr_inhibit_array && wr_en_array;

wire    x1_,wr_array, rd_array;
not  rd2 (x1_,wr_inhibit_array);
and  rd1 (rd_array,rd_en_array,x1_);

and  wr1 (wr_array,wr_en_array,x1_);


  //------------------------------------------------------------------------
  //  instantiate the clock-less ram
  //------------------------------------------------------------------------
wire	[148:0]	dout_array;	
n2_dmu_dp_144x149s_cust_array	dmu_diu_ram(
		.clk			(and_clk),
		.rd_addr_array		(rd_addr_array[7:0]),
		.wr_addr_array		(wr_addr_array[7:0]),
		.rd_array		(rd_array),
		.wr_array		(wr_array),
		.din_array		(din_array[148:0]),
		.dout_array		(dout_array[148:0])
		);

assign	dout[148:0] =  dout_array[148:0];



endmodule	//n2_dmu_dp_144x149s_cust



module n2_dmu_dp_144x149s_cust_array	(

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
   input [7:0]		rd_addr_array;			// read port address in
   input [7:0]		wr_addr_array;			// write port address in
   input		rd_array;			// read port enable
   input		wr_array;			// write port enable
   input [148:0] 	din_array;			// data in
   output [148:0] 	dout_array;			// data out


// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------
// checker to verify on accesses's that no bits are x
/* //BP0in assert -var (((|rd_addr_array[7:0] ) == 1'bx)
                    || ((|wr_addr_array[7:0] ) == 1'bx)
                    || ((rd_en_array ) == 1'bx)
                    || ((wr_en_array ) == 1'bx)
               -active (rd_en_array )
               -module dmu_ram144x149_array
                -name dmu_ram144x149_array_x
*/
  // 0in kndr -var rd_addr_array
  // 0in kndr -var wr_addr_array
  // 0in kndr -var rd_array
  // 0in kndr -var wr_array
  // 0in kndr -var din_array -active (wr_array )




/* RAM Array: =144 - 1        -> 143    */

reg     [148:0]  array_ram      [0:143];
//reg     [148:0]  array_ram      [0:191];
reg	[148:0]	dout_array;

// Initialize the array
`ifndef NOINITMEM
integer i;

initial begin
  for (i=0; i<144; i=i+1) begin
    array_ram[i] = 149'b0;
  end
end
`endif

// ----------------------------------------------------------------------------
// Read the array
// ----------------------------------------------------------------------------
//assign	dout_array[148:0] =	array_ram[rd_addr_array[7:0]];
always @(clk or rd_array or  rd_addr_array or wr_array or wr_addr_array ) begin
        if (clk) begin
        if (rd_array) begin
		if ( (wr_array  & (rd_addr_array == wr_addr_array)) ||
			(rd_addr_array >= 144) ) begin
		dout_array[148:0] <= {149{1'bx}}; //0in <fire -severity 1 -message " got x's in dmu/dou" -group mbist_mode
		end
        	else begin
		dout_array[148:0] <=     array_ram[rd_addr_array[7:0]];
        	end
        end
	else begin
		dout_array[148:0] <=     {149{1'b1}};
	end
        end
end




// ----------------------------------------------------------------------------
// Write the array, note: it is written when the clock is low
// ----------------------------------------------------------------------------
always @(wr_array or  wr_addr_array or clk or din_array  ) begin
	if(~clk) begin
	if(wr_array ) begin
	array_ram[wr_addr_array[7:0]] <= din_array[148:0];
	end
	end
end



endmodule	// n2_dmu_dp_144x149s_cust_array


