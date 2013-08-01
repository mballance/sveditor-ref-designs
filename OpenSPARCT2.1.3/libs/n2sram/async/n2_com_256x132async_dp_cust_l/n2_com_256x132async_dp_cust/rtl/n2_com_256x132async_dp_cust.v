// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_com_256x132async_dp_cust.v
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
module n2_com_256x132async_dp_cust	(
   // clocks, scan
   wr_clk,  
   rd_clk,
   wr_pce,
   rd_pce, 
   scan_in,
   tcu_se_scancollar_in,
   tcu_scan_en,
   tcu_pce_ov,  
   tcu_aclk,
   tcu_bclk,
   tcu_array_wr_inhibit,
   bist_clk_mux_sel ,
   bist_clk , 
   scan_out,   

   // ram control
   rd_addr,
   wr_addr,
   rd, 
   wr_en,
   din, 
   dout    

);

// clocks, scan
input		wr_clk;                 // write clock
input		rd_clk;                 // read clock
input           wr_pce ;                // Write Clk Enable for pwr saving
input           rd_pce ;                // Read Clk Enable for pwr saving
input           scan_in;		//  
input           tcu_se_scancollar_in;	// scan enable for input flops 
input           tcu_scan_en;	// scan enable for output flops
input           tcu_pce_ov;            	// scan signals
input           tcu_aclk;		// 
input           tcu_bclk;		// 
input           tcu_array_wr_inhibit;	// array wr/rd inhibit during scan 
input           bist_clk_mux_sel ;      // Clk Hdr Mux Select for MBIST
input		bist_clk ;		// BIST Clk, connect to pcl2clk
output          scan_out;		// 


input	  [7:0]	wr_addr;		//  wr port address in
input		wr_en;			//  wr port enable
input	[131:0] din;			//  data in

input	  [7:0]	rd_addr;		//  rd port address in
input		rd;			//  rd port enable
output	[131:0] dout;			//  rd port data out


//------------------------------------------------------------------------
//  scan chain connections
//------------------------------------------------------------------------
wire	  [7:0]	rd_addr_so ;
wire	  [7:0]	wr_addr_so ;
wire		rd_so ;
wire		wr_en_so ;
wire	[131:1]	din_so ;

//------------------------------------------------------------------------
//  clock headers
//------------------------------------------------------------------------

wire            wr_l1clk ;
wire            rd_l1clk ;
wire            siclk ;
wire            soclk ;

wire            wr_array_l1clk ;        // Free running write l1clk
wire            rd_and_l1clk ;

wire            rd_lce_0, rd_lce_1 ;
wire            wr_lce_0, wr_lce_1 ;

assign  siclk = tcu_aclk ;
assign  soclk = tcu_bclk ;

cl_mc1_bistl1hdr_8x wr_collar_clk_hdr_mux (
                        .l2clk  (wr_clk) ,
                        .se     (tcu_se_scancollar_in) ,
                        .clksel (bist_clk_mux_sel) ,  
                        .bistclk(bist_clk) ,
                        .lce    (wr_lce_0),
                        .l1clk  (wr_l1clk)
                       );

cl_mc1_bistlatch_4x wr_collar_clk_hdr_latch (
                        .l2clk  (wr_clk) ,
			.pce    (wr_pce) ,
			.pce_ov (tcu_pce_ov) ,
     			.lce    (wr_lce_0)
		       );

// L1 Hdr for Free Running Write L1 clk, which allows writing into the array
// in low phase, when tcu_se_scancollar_in is high, which pulls the wr_l1clk
// high.  Similar to rd_and_l1clk, wr_array_l1clk is free running as long
// as tcu_scan_en is not asserted.
cl_mc1_bistl1hdr_8x wr_array_clk_hdr_mux (
                        .l2clk  (wr_clk) ,
                        .se     (tcu_scan_en) ,
                        .clksel (bist_clk_mux_sel) ,   
                        .bistclk(bist_clk) ,
                        .lce    (wr_lce_1),
                        .l1clk  (wr_array_l1clk)
                       );

cl_mc1_bistlatch_4x wr_array_clk_hdr_latch (
                        .l2clk  (wr_clk) ,
			.pce    (wr_pce) ,
			.pce_ov (tcu_pce_ov) ,
     			.lce    (wr_lce_1)
		       );

cl_mc1_bistl1hdr_8x rd_collar_clk_hdr_mux (
                        .l2clk  (rd_clk) ,
                        .se     (tcu_se_scancollar_in) ,
                        .clksel (bist_clk_mux_sel) ,  
                        .bistclk(bist_clk) ,
                        .lce    (rd_lce_0),
                        .l1clk  (rd_l1clk)
                       );

cl_mc1_bistlatch_4x rd_collar_clk_hdr_latch (
                        .l2clk  (rd_clk) ,
			.pce    (rd_pce) ,
			.pce_ov (tcu_pce_ov) ,
     			.lce    (rd_lce_0)
		       );

cl_mc1_bistl1hdr_8x rd_and_clk_hdr_mux (
                        .l2clk  (rd_clk) ,
                        .se     (tcu_scan_en) ,
                        .clksel (bist_clk_mux_sel) ,  
                        .bistclk(bist_clk) ,
                        .lce    (rd_lce_1),
                        .l1clk  (rd_and_l1clk)
                       );

cl_mc1_bistlatch_4x rd_and_clk_hdr_latch (
                        .l2clk  (rd_clk) ,
			.pce    (rd_pce) ,
			.pce_ov (tcu_pce_ov) ,
     			.lce    (rd_lce_1)
		       );


//------------------------------------------------------------------------
//  input flops
//------------------------------------------------------------------------
wire	  [7:0]	rd_addr_array ;
wire	  [7:0]	wr_addr_array ;
wire		rd_en_d1 ;
wire		wr_en_d1 ;
wire		rd_en_array ;
wire		wr_en_array ;
wire	[131:0]	din_array ;

cl_a1_msff_4x  ff_din_131 ( .si(scan_in), .so(din_so[131]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[131]), .q(din_array[131]) );
cl_a1_msff_4x  ff_din_130 ( .si(din_so[131]), .so(din_so[130]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[130]), .q(din_array[130]) );

cl_a1_msff_4x  ff_din_129 ( .si(din_so[128]), .so(din_so[129]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[129]), .q(din_array[129]) );
cl_a1_msff_4x  ff_din_128 ( .si(din_so[130]), .so(din_so[128]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[128]), .q(din_array[128]) );
cl_a1_msff_4x  ff_din_127 ( .si(din_so[129]), .so(din_so[127]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[127]), .q(din_array[127]) );
cl_a1_msff_4x  ff_din_126 ( .si(din_so[127]), .so(din_so[126]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[126]), .q(din_array[126]) );

cl_a1_msff_4x  ff_din_125 ( .si(din_so[124]), .so(din_so[125]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[125]), .q(din_array[125]) );
cl_a1_msff_4x  ff_din_124 ( .si(din_so[126]), .so(din_so[124]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[124]), .q(din_array[124]) );
cl_a1_msff_4x  ff_din_123 ( .si(din_so[125]), .so(din_so[123]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[123]), .q(din_array[123]) );
cl_a1_msff_4x  ff_din_122 ( .si(din_so[123]), .so(din_so[122]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[122]), .q(din_array[122]) );

cl_a1_msff_4x  ff_din_121 ( .si(din_so[120]), .so(din_so[121]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[121]), .q(din_array[121]) );
cl_a1_msff_4x  ff_din_120 ( .si(din_so[122]), .so(din_so[120]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[120]), .q(din_array[120]) );
cl_a1_msff_4x  ff_din_119 ( .si(din_so[121]), .so(din_so[119]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[119]), .q(din_array[119]) );
cl_a1_msff_4x  ff_din_118 ( .si(din_so[119]), .so(din_so[118]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[118]), .q(din_array[118]) );

cl_a1_msff_4x  ff_din_117 ( .si(din_so[116]), .so(din_so[117]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[117]), .q(din_array[117]) );
cl_a1_msff_4x  ff_din_116 ( .si(din_so[118]), .so(din_so[116]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[116]), .q(din_array[116]) );
cl_a1_msff_4x  ff_din_115 ( .si(din_so[117]), .so(din_so[115]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[115]), .q(din_array[115]) );
cl_a1_msff_4x  ff_din_114 ( .si(din_so[115]), .so(din_so[114]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[114]), .q(din_array[114]) );

cl_a1_msff_4x  ff_din_113 ( .si(din_so[112]), .so(din_so[113]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[113]), .q(din_array[113]) );
cl_a1_msff_4x  ff_din_112 ( .si(din_so[114]), .so(din_so[112]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[112]), .q(din_array[112]) );
cl_a1_msff_4x  ff_din_111 ( .si(din_so[113]), .so(din_so[111]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[111]), .q(din_array[111]) );
cl_a1_msff_4x  ff_din_110 ( .si(din_so[111]), .so(din_so[110]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[110]), .q(din_array[110]) );

cl_a1_msff_4x  ff_din_109 ( .si(din_so[108]), .so(din_so[109]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[109]), .q(din_array[109]) );
cl_a1_msff_4x  ff_din_108 ( .si(din_so[110]), .so(din_so[108]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[108]), .q(din_array[108]) );
cl_a1_msff_4x  ff_din_107 ( .si(din_so[109]), .so(din_so[107]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[107]), .q(din_array[107]) );
cl_a1_msff_4x  ff_din_106 ( .si(din_so[107]), .so(din_so[106]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[106]), .q(din_array[106]) );

cl_a1_msff_4x  ff_din_105 ( .si(din_so[104]), .so(din_so[105]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[105]), .q(din_array[105]) );
cl_a1_msff_4x  ff_din_104 ( .si(din_so[106]), .so(din_so[104]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[104]), .q(din_array[104]) );
cl_a1_msff_4x  ff_din_103 ( .si(din_so[105]), .so(din_so[103]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[103]), .q(din_array[103]) );
cl_a1_msff_4x  ff_din_102 ( .si(din_so[103]), .so(din_so[102]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[102]), .q(din_array[102]) );

cl_a1_msff_4x  ff_din_101 ( .si(din_so[100]), .so(din_so[101]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[101]), .q(din_array[101]) );
cl_a1_msff_4x  ff_din_100 ( .si(din_so[102]), .so(din_so[100]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[100]), .q(din_array[100]) );
cl_a1_msff_4x  ff_din_99 ( .si(din_so[101]), .so(din_so[99]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[99]), .q(din_array[99]) );
cl_a1_msff_4x  ff_din_98 ( .si(din_so[99]), .so(din_so[98]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[98]), .q(din_array[98]) );

cl_a1_msff_4x  ff_din_97 ( .si(din_so[96]), .so(din_so[97]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[97]), .q(din_array[97]) );
cl_a1_msff_4x  ff_din_96 ( .si(din_so[98]), .so(din_so[96]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[96]), .q(din_array[96]) );
cl_a1_msff_4x  ff_din_95 ( .si(din_so[97]), .so(din_so[95]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[95]), .q(din_array[95]) );
cl_a1_msff_4x  ff_din_94 ( .si(din_so[95]), .so(din_so[94]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[94]), .q(din_array[94]) );

cl_a1_msff_4x  ff_din_93 ( .si(din_so[92]), .so(din_so[93]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[93]), .q(din_array[93]) );
cl_a1_msff_4x  ff_din_92 ( .si(din_so[94]), .so(din_so[92]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[92]), .q(din_array[92]) );
cl_a1_msff_4x  ff_din_91 ( .si(din_so[93]), .so(din_so[91]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[91]), .q(din_array[91]) );
cl_a1_msff_4x  ff_din_90 ( .si(din_so[91]), .so(din_so[90]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[90]), .q(din_array[90]) );

cl_a1_msff_4x  ff_din_89 ( .si(din_so[88]), .so(din_so[89]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[89]), .q(din_array[89]) );
cl_a1_msff_4x  ff_din_88 ( .si(din_so[90]), .so(din_so[88]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[88]), .q(din_array[88]) );
cl_a1_msff_4x  ff_din_87 ( .si(din_so[89]), .so(din_so[87]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[87]), .q(din_array[87]) );
cl_a1_msff_4x  ff_din_86 ( .si(din_so[87]), .so(din_so[86]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[86]), .q(din_array[86]) );

cl_a1_msff_4x  ff_din_85 ( .si(din_so[84]), .so(din_so[85]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[85]), .q(din_array[85]) );
cl_a1_msff_4x  ff_din_84 ( .si(din_so[86]), .so(din_so[84]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[84]), .q(din_array[84]) );
cl_a1_msff_4x  ff_din_83 ( .si(din_so[85]), .so(din_so[83]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[83]), .q(din_array[83]) );
cl_a1_msff_4x  ff_din_82 ( .si(din_so[83]), .so(din_so[82]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[82]), .q(din_array[82]) );

cl_a1_msff_4x  ff_din_81 ( .si(din_so[80]), .so(din_so[81]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[81]), .q(din_array[81]) );
cl_a1_msff_4x  ff_din_80 ( .si(din_so[82]), .so(din_so[80]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[80]), .q(din_array[80]) );
cl_a1_msff_4x  ff_din_79 ( .si(din_so[81]), .so(din_so[79]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[79]), .q(din_array[79]) );
cl_a1_msff_4x  ff_din_78 ( .si(din_so[79]), .so(din_so[78]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[78]), .q(din_array[78]) );

cl_a1_msff_4x  ff_din_77 ( .si(din_so[76]), .so(din_so[77]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[77]), .q(din_array[77]) );
cl_a1_msff_4x  ff_din_76 ( .si(din_so[78]), .so(din_so[76]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[76]), .q(din_array[76]) );
cl_a1_msff_4x  ff_din_75 ( .si(din_so[77]), .so(din_so[75]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[75]), .q(din_array[75]) );
cl_a1_msff_4x  ff_din_74 ( .si(din_so[75]), .so(din_so[74]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[74]), .q(din_array[74]) );

cl_a1_msff_4x  ff_din_73 ( .si(din_so[72]), .so(din_so[73]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[73]), .q(din_array[73]) );
cl_a1_msff_4x  ff_din_72 ( .si(din_so[74]), .so(din_so[72]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[72]), .q(din_array[72]) );
cl_a1_msff_4x  ff_din_71 ( .si(din_so[73]), .so(din_so[71]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[71]), .q(din_array[71]) );
cl_a1_msff_4x  ff_din_70 ( .si(din_so[71]), .so(din_so[70]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[70]), .q(din_array[70]) );

cl_a1_msff_4x  ff_din_69 ( .si(din_so[68]), .so(din_so[69]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[69]), .q(din_array[69]) );
cl_a1_msff_4x  ff_din_68 ( .si(din_so[70]), .so(din_so[68]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[68]), .q(din_array[68]) );
cl_a1_msff_4x  ff_din_67 ( .si(din_so[69]), .so(din_so[67]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[67]), .q(din_array[67]) );
cl_a1_msff_4x  ff_din_66 ( .si(din_so[67]), .so(din_so[66]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[66]), .q(din_array[66]) );


cl_mc1_sram_msff_mo_8x	ff_rd ( .si(din_so[66]), .so(rd_so), .l1clk(rd_l1clk), .and_clk(rd_and_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(rd), .mq(rd_en_d1)	);

cl_mc1_sram_msff_mo_8x	ff_rd_addr_7 ( .si(rd_so), .so(rd_addr_so[7]), .l1clk(rd_l1clk), .and_clk(rd_and_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(rd_addr[7]), .mq(rd_addr_array[7])	);
cl_mc1_sram_msff_mo_8x	ff_rd_addr_6 ( .si(rd_addr_so[7]), .so(rd_addr_so[6]), .l1clk(rd_l1clk), .and_clk(rd_and_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(rd_addr[6]), .mq(rd_addr_array[6])	);
cl_mc1_sram_msff_mo_8x	ff_rd_addr_5 ( .si(rd_addr_so[6]), .so(rd_addr_so[5]), .l1clk(rd_l1clk), .and_clk(rd_and_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(rd_addr[5]), .mq(rd_addr_array[5])	);
cl_mc1_sram_msff_mo_8x	ff_rd_addr_4 ( .si(rd_addr_so[5]), .so(rd_addr_so[4]), .l1clk(rd_l1clk), .and_clk(rd_and_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(rd_addr[4]), .mq(rd_addr_array[4])	);
cl_mc1_sram_msff_mo_8x	ff_rd_addr_3 ( .si(rd_addr_so[4]), .so(rd_addr_so[3]), .l1clk(rd_l1clk), .and_clk(rd_and_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(rd_addr[3]), .mq(rd_addr_array[3])	);
cl_mc1_sram_msff_mo_8x	ff_rd_addr_2 ( .si(rd_addr_so[3]), .so(rd_addr_so[2]), .l1clk(rd_l1clk), .and_clk(rd_and_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(rd_addr[2]), .mq(rd_addr_array[2])	);
cl_mc1_sram_msff_mo_8x	ff_rd_addr_1 ( .si(rd_addr_so[2]), .so(rd_addr_so[1]), .l1clk(rd_l1clk), .and_clk(rd_and_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(rd_addr[1]), .mq(rd_addr_array[1])	);
cl_mc1_sram_msff_mo_8x	ff_rd_addr_0 ( .si(rd_addr_so[1]), .so(rd_addr_so[0]), .l1clk(rd_l1clk), .and_clk(rd_and_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(rd_addr[0]), .mq(rd_addr_array[0])	);


cl_a1_msff_4x	ff_wr_en ( .si(rd_addr_so[0]), .so(wr_en_so), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(wr_en), .q(wr_en_d1)	);

cl_a1_msff_4x	ff_wr_addr_7 ( .si(wr_en_so), .so(wr_addr_so[7]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(wr_addr[7]), .q(wr_addr_array[7])	);
cl_a1_msff_4x	ff_wr_addr_6 ( .si(wr_addr_so[7]), .so(wr_addr_so[6]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(wr_addr[6]), .q(wr_addr_array[6])	);
cl_a1_msff_4x	ff_wr_addr_5 ( .si(wr_addr_so[6]), .so(wr_addr_so[5]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(wr_addr[5]), .q(wr_addr_array[5])	);
cl_a1_msff_4x	ff_wr_addr_4 ( .si(wr_addr_so[5]), .so(wr_addr_so[4]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(wr_addr[4]), .q(wr_addr_array[4])	);
cl_a1_msff_4x	ff_wr_addr_3 ( .si(wr_addr_so[4]), .so(wr_addr_so[3]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(wr_addr[3]), .q(wr_addr_array[3])	);
cl_a1_msff_4x	ff_wr_addr_2 ( .si(wr_addr_so[3]), .so(wr_addr_so[2]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(wr_addr[2]), .q(wr_addr_array[2])	);
cl_a1_msff_4x	ff_wr_addr_1 ( .si(wr_addr_so[2]), .so(wr_addr_so[1]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(wr_addr[1]), .q(wr_addr_array[1])	);
cl_a1_msff_4x	ff_wr_addr_0 ( .si(wr_addr_so[1]), .so(wr_addr_so[0]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), 
		.d(wr_addr[0]), .q(wr_addr_array[0])	);

cl_a1_msff_4x  ff_din_65 ( .si(wr_addr_so[0]), .so(din_so[65]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[65]), .q(din_array[65]) );
cl_a1_msff_4x  ff_din_64 ( .si(din_so[65]), .so(din_so[64]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[64]), .q(din_array[64]) );

cl_a1_msff_4x  ff_din_63 ( .si(din_so[62]), .so(din_so[63]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[63]), .q(din_array[63]) );
cl_a1_msff_4x  ff_din_62 ( .si(din_so[64]), .so(din_so[62]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[62]), .q(din_array[62]) );
cl_a1_msff_4x  ff_din_61 ( .si(din_so[63]), .so(din_so[61]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[61]), .q(din_array[61]) );
cl_a1_msff_4x  ff_din_60 ( .si(din_so[61]), .so(din_so[60]), .l1clk(wr_l1clk),  .siclk(siclk), .soclk(soclk), .d(din[60]), .q(din_array[60]) );

cl_a1_msff_4x  ff_din_59 ( .si(din_so[58]), .so(din_so[59]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[59]), .q(din_array[59]) );
cl_a1_msff_4x  ff_din_58 ( .si(din_so[60]), .so(din_so[58]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[58]), .q(din_array[58]) );
cl_a1_msff_4x  ff_din_57 ( .si(din_so[59]), .so(din_so[57]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[57]), .q(din_array[57]) );
cl_a1_msff_4x  ff_din_56 ( .si(din_so[57]), .so(din_so[56]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[56]), .q(din_array[56]) );

cl_a1_msff_4x  ff_din_55 ( .si(din_so[54]), .so(din_so[55]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[55]), .q(din_array[55]) );
cl_a1_msff_4x  ff_din_54 ( .si(din_so[56]), .so(din_so[54]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[54]), .q(din_array[54]) );
cl_a1_msff_4x  ff_din_53 ( .si(din_so[55]), .so(din_so[53]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[53]), .q(din_array[53]) );
cl_a1_msff_4x  ff_din_52 ( .si(din_so[53]), .so(din_so[52]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[52]), .q(din_array[52]) );

cl_a1_msff_4x  ff_din_51 ( .si(din_so[50]), .so(din_so[51]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[51]), .q(din_array[51]) );
cl_a1_msff_4x  ff_din_50 ( .si(din_so[52]), .so(din_so[50]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[50]), .q(din_array[50]) );
cl_a1_msff_4x  ff_din_49 ( .si(din_so[51]), .so(din_so[49]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[49]), .q(din_array[49]) );
cl_a1_msff_4x  ff_din_48 ( .si(din_so[49]), .so(din_so[48]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[48]), .q(din_array[48]) );

cl_a1_msff_4x  ff_din_47 ( .si(din_so[46]), .so(din_so[47]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[47]), .q(din_array[47]) );
cl_a1_msff_4x  ff_din_46 ( .si(din_so[48]), .so(din_so[46]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[46]), .q(din_array[46]) );
cl_a1_msff_4x  ff_din_45 ( .si(din_so[47]), .so(din_so[45]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[45]), .q(din_array[45]) );
cl_a1_msff_4x  ff_din_44 ( .si(din_so[45]), .so(din_so[44]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[44]), .q(din_array[44]) );
                                
cl_a1_msff_4x  ff_din_43 ( .si(din_so[42]), .so(din_so[43]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[43]), .q(din_array[43]) );
cl_a1_msff_4x  ff_din_42 ( .si(din_so[44]), .so(din_so[42]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[42]), .q(din_array[42]) );
cl_a1_msff_4x  ff_din_41 ( .si(din_so[43]), .so(din_so[41]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[41]), .q(din_array[41]) );
cl_a1_msff_4x  ff_din_40 ( .si(din_so[41]), .so(din_so[40]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[40]), .q(din_array[40]) );
                                
cl_a1_msff_4x  ff_din_39 ( .si(din_so[38]), .so(din_so[39]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[39]), .q(din_array[39]) );
cl_a1_msff_4x  ff_din_38 ( .si(din_so[40]), .so(din_so[38]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[38]), .q(din_array[38]) );
cl_a1_msff_4x  ff_din_37 ( .si(din_so[39]), .so(din_so[37]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[37]), .q(din_array[37]) );
cl_a1_msff_4x  ff_din_36 ( .si(din_so[37]), .so(din_so[36]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[36]), .q(din_array[36]) );
                                
cl_a1_msff_4x  ff_din_35 ( .si(din_so[34]), .so(din_so[35]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[35]), .q(din_array[35]) );
cl_a1_msff_4x  ff_din_34 ( .si(din_so[36]), .so(din_so[34]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[34]), .q(din_array[34]) );
cl_a1_msff_4x  ff_din_33 ( .si(din_so[35]), .so(din_so[33]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[33]), .q(din_array[33]) );
cl_a1_msff_4x  ff_din_32 ( .si(din_so[33]), .so(din_so[32]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[32]), .q(din_array[32]) );

cl_a1_msff_4x  ff_din_31 ( .si(din_so[30]), .so(din_so[31]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[31]), .q(din_array[31]) );
cl_a1_msff_4x  ff_din_30 ( .si(din_so[32]), .so(din_so[30]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[30]), .q(din_array[30]) );
cl_a1_msff_4x  ff_din_29 ( .si(din_so[31]), .so(din_so[29]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[29]), .q(din_array[29]) );
cl_a1_msff_4x  ff_din_28 ( .si(din_so[29]), .so(din_so[28]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[28]), .q(din_array[28]) );

cl_a1_msff_4x  ff_din_27 ( .si(din_so[26]), .so(din_so[27]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[27]), .q(din_array[27]) );
cl_a1_msff_4x  ff_din_26 ( .si(din_so[28]), .so(din_so[26]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[26]), .q(din_array[26]) );
cl_a1_msff_4x  ff_din_25 ( .si(din_so[27]), .so(din_so[25]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[25]), .q(din_array[25]) );
cl_a1_msff_4x  ff_din_24 ( .si(din_so[25]), .so(din_so[24]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[24]), .q(din_array[24]) );
                
cl_a1_msff_4x  ff_din_23 ( .si(din_so[22]), .so(din_so[23]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[23]), .q(din_array[23]) );
cl_a1_msff_4x  ff_din_22 ( .si(din_so[24]), .so(din_so[22]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[22]), .q(din_array[22]) );
cl_a1_msff_4x  ff_din_21 ( .si(din_so[23]), .so(din_so[21]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[21]), .q(din_array[21]) );
cl_a1_msff_4x  ff_din_20 ( .si(din_so[21]), .so(din_so[20]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[20]), .q(din_array[20]) );

cl_a1_msff_4x  ff_din_19 ( .si(din_so[18]), .so(din_so[19]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[19]), .q(din_array[19]) );
cl_a1_msff_4x  ff_din_18 ( .si(din_so[20]), .so(din_so[18]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[18]), .q(din_array[18]) );
cl_a1_msff_4x  ff_din_17 ( .si(din_so[19]), .so(din_so[17]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[17]), .q(din_array[17]) );
cl_a1_msff_4x  ff_din_16 ( .si(din_so[17]), .so(din_so[16]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[16]), .q(din_array[16]) );

cl_a1_msff_4x  ff_din_15 ( .si(din_so[14]), .so(din_so[15]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[15]), .q(din_array[15]) );
cl_a1_msff_4x  ff_din_14 ( .si(din_so[16]), .so(din_so[14]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[14]), .q(din_array[14]) );
cl_a1_msff_4x  ff_din_13 ( .si(din_so[15]), .so(din_so[13]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[13]), .q(din_array[13]) );
cl_a1_msff_4x  ff_din_12 ( .si(din_so[13]), .so(din_so[12]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[12]), .q(din_array[12]) );

cl_a1_msff_4x  ff_din_11 ( .si(din_so[10]), .so(din_so[11]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[11]), .q(din_array[11]) );
cl_a1_msff_4x  ff_din_10 ( .si(din_so[12]), .so(din_so[10]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[10]), .q(din_array[10]) );
cl_a1_msff_4x  ff_din_9 ( .si(din_so[11]), .so(din_so[9]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[9]), .q(din_array[9])    );
cl_a1_msff_4x  ff_din_8 ( .si(din_so[9]), .so(din_so[8]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[8]), .q(din_array[8])     );

cl_a1_msff_4x  ff_din_7 ( .si(din_so[6]), .so(din_so[7]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[7]), .q(din_array[7])     );
cl_a1_msff_4x  ff_din_6 ( .si(din_so[8]), .so(din_so[6]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[6]), .q(din_array[6])     );
cl_a1_msff_4x  ff_din_5 ( .si(din_so[7]), .so(din_so[5]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[5]), .q(din_array[5])     );
cl_a1_msff_4x  ff_din_4 ( .si(din_so[5]), .so(din_so[4]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[4]), .q(din_array[4])     );

cl_a1_msff_4x  ff_din_3 ( .si(din_so[2]), .so(din_so[3]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[3]), .q(din_array[3])     );
cl_a1_msff_4x  ff_din_2 ( .si(din_so[4]), .so(din_so[2]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[2]), .q(din_array[2])     );
cl_a1_msff_4x  ff_din_1 ( .si(din_so[3]), .so(din_so[1]), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[1]), .q(din_array[1])     );
cl_a1_msff_4x  ff_din_0 ( .si(din_so[1]), .so(scan_out), .l1clk(wr_l1clk), .siclk(siclk), .soclk(soclk), .d(din[0]), .q(din_array[0])      );


//------------------------------------------------------------------------
//  instantiate the ram array
//------------------------------------------------------------------------

n2_com_256x132async_dp_cust_array	ptl_db_async_ram(
		.wr_clk			(wr_array_l1clk),
		.wr_addr_array		(wr_addr_array[7:0]),
		.wr_en_array		(wr_en_array),
		.rd_clk			(rd_and_l1clk),
		.rd_addr_array		(rd_addr_array[7:0]),
		.rd_en_array		(rd_en_array),
		.din_array		(din_array[131:0]), 
		.dout_array		(dout[131:0])
		);

assign	wr_en_array = wr_en_d1 & ! tcu_array_wr_inhibit ;
assign	rd_en_array = rd_en_d1 & ! tcu_array_wr_inhibit ;


endmodule	//n2_com_256x132async_dp_cust


