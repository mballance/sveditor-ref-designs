// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_mmu_cm_64x34s_cust.v
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
module n2_mmu_cm_64x34s_cust	(
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

   // ram control
   rd_addr,
   wr_addr,
   din, 
   wr_en,
   rd_en,
   lkup_en, 
   hld,    
   key,    
   hit,    
   dout    

);




   // clocks, scan
   input                clk;                    // io clock
   input                scan_in;		//  
   input                tcu_se_scancollar_in;	// 
   input                tcu_scan_en;		// 
   input                tcu_pce_ov;            	// scan signals
   input                pce;            	// clock enable
   input                tcu_aclk;		// 
   input                tcu_bclk;		// 
   input                tcu_array_wr_inhibit;	// 
   output               scan_out;		// 


   // 
   input [5:0]		rd_addr;		//  read address in
   input [5:0]		wr_addr;		//  write address in
   input		wr_en;			//  write enable
   input		rd_en;			//  read enable
   input		lkup_en;		//  CAM operation request
   input		hld;			//  output holds its current value
   input [32:0] 	key;			//  look up address for CAM operation
   input [32:0] 	din;			//  data in
   output [32:0] 	dout;			//  data out
   output [63:0] 	hit;			//  results of CAM operation


  //------------------------------------------------------------------------
  //  scan chain connections
  //------------------------------------------------------------------------
// scan renames
wire	[1:0] siclk,soclk;
wire	se,wr_inhibit_array,and_clk;
assign	wr_inhibit_array = tcu_array_wr_inhibit;
// end scan
  //------------------------------------------------------------------------
  //  instantiate clock headers
  //------------------------------------------------------------------------
wire   [1:0] collar_clk;
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
  .pce_ov(tcu_pce_ov),
  .stop(stop),
  .aclk(aclk),
  .bclk(bclk)
);

cl_dp1_l1hdr_8x clk_hdr_data (
        .l2clk(clk),
        .pce (pce),
        .l1clk(collar_clk[1]),
        .siclk_out(siclk[1]),
        .soclk_out(soclk[1]),
  .se(se),
  .pce_ov(tcu_pce_ov),
  .stop(stop),
  .aclk(aclk),
  .bclk(bclk)
);

cl_dp1_l1hdr_8x clk_hdr_array (
        .l2clk(clk),
        .pce (pce),
        .l1clk(and_clk),
        .siclk_out(),
        .soclk_out(),
  .se(tcu_scan_en),
  .pce_ov(tcu_pce_ov),
  .stop(stop),
  .aclk(aclk),
  .bclk(bclk)
);


  //------------------------------------------------------------------------
  //  input flops
  //------------------------------------------------------------------------
wire	[5:0]	rd_addr_array,rd_addr_so;
wire	[5:0]	wr_addr_array,wr_addr_so;
wire		hld_array,wr_en_array,rd_en_array,lkup_en_array;
wire		hld_so,lkup_en_so;
wire		wr_en_so,rd_en_so;
wire	[32:0]	din_array,din_so,key_array;
wire	[32:0]	key_so;
wire	[63:0]	hit_array;


cl_sc1_msff_8x		din_0 ( .si(scan_in), .so(din_so[0]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[0]), .q(din_array[0])	);
cl_sc1_msff_8x		din_1 ( .si(din_so[0]), .so(din_so[1]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[1]), .q(din_array[1])	);
cl_sc1_msff_8x		din_2 ( .si(din_so[1]), .so(din_so[2]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[2]), .q(din_array[2])	);
cl_sc1_msff_8x		din_3 ( .si(din_so[2]), .so(din_so[3]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[3]), .q(din_array[3])	);
cl_sc1_msff_8x		din_4 ( .si(din_so[3]), .so(din_so[4]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[4]), .q(din_array[4])	);
cl_sc1_msff_8x		din_5 ( .si(din_so[4]), .so(din_so[5]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[5]), .q(din_array[5])	);
cl_sc1_msff_8x		din_6 ( .si(din_so[5]), .so(din_so[6]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[6]), .q(din_array[6])	);
cl_sc1_msff_8x		din_7 ( .si(din_so[6]), .so(din_so[7]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[7]), .q(din_array[7])	);
cl_sc1_msff_8x		din_8 ( .si(din_so[7]), .so(din_so[8]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[8]), .q(din_array[8])	);
cl_sc1_msff_8x		din_9 ( .si(din_so[8]), .so(din_so[9]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[9]), .q(din_array[9])	);
cl_sc1_msff_8x		din_10 ( .si(din_so[9]), .so(din_so[10]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[10]), .q(din_array[10]) );
cl_sc1_msff_8x		din_11 ( .si(din_so[10]), .so(din_so[11]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[11]), .q(din_array[11]) );
cl_sc1_msff_8x		din_12 ( .si(din_so[11]), .so(din_so[12]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[12]), .q(din_array[12]) );
cl_sc1_msff_8x		din_13 ( .si(din_so[12]), .so(din_so[13]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[13]), .q(din_array[13]) );
cl_sc1_msff_8x		din_14 ( .si(din_so[13]), .so(din_so[14]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[14]), .q(din_array[14]) );
cl_sc1_msff_8x		din_15 ( .si(din_so[14]), .so(din_so[15]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[15]), .q(din_array[15]) );
cl_sc1_msff_8x		din_16 ( .si(din_so[15]), .so(din_so[16]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[16]), .q(din_array[16]) );
cl_sc1_msff_8x		din_17 ( .si(din_so[16]), .so(din_so[17]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[17]), .q(din_array[17]) );
cl_sc1_msff_8x		din_18 ( .si(din_so[17]), .so(din_so[18]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[18]), .q(din_array[18]) );
cl_sc1_msff_8x		din_19 ( .si(din_so[18]), .so(din_so[19]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[19]), .q(din_array[19]) );
cl_sc1_msff_8x		din_20 ( .si(din_so[19]), .so(din_so[20]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[20]), .q(din_array[20]) );
cl_sc1_msff_8x		din_21 ( .si(din_so[20]), .so(din_so[21]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[21]), .q(din_array[21]) );
cl_sc1_msff_8x		din_22 ( .si(din_so[21]), .so(din_so[22]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[22]), .q(din_array[22]) );
cl_sc1_msff_8x		din_23 ( .si(din_so[22]), .so(din_so[23]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[23]), .q(din_array[23]) );
cl_sc1_msff_8x		din_24 ( .si(din_so[23]), .so(din_so[24]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[24]), .q(din_array[24]) );
cl_sc1_msff_8x		din_25 ( .si(din_so[24]), .so(din_so[25]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[25]), .q(din_array[25]) );
cl_sc1_msff_8x		din_26 ( .si(din_so[25]), .so(din_so[26]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[26]), .q(din_array[26]) );
cl_sc1_msff_8x		din_27 ( .si(din_so[26]), .so(din_so[27]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[27]), .q(din_array[27]) );
cl_sc1_msff_8x		din_28 ( .si(din_so[27]), .so(din_so[28]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[28]), .q(din_array[28]) );
cl_sc1_msff_8x		din_29 ( .si(din_so[28]), .so(din_so[29]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[29]), .q(din_array[29]) );
cl_sc1_msff_8x		din_30 ( .si(din_so[29]), .so(din_so[30]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[30]), .q(din_array[30]) );
cl_sc1_msff_8x		din_31 ( .si(din_so[30]), .so(din_so[31]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[31]), .q(din_array[31]) );
cl_sc1_msff_8x		din_32 ( .si(din_so[31]), .so(din_so[32]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(din[32]), .q(din_array[32]) );

cl_mc1_scm_msff_lat_4x	key_32 ( .si(din_so[32]), .so(key_so[32]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[32]), .latout(key_array[32]) );
cl_mc1_scm_msff_lat_4x	key_31 ( .si(key_so[32]), .so(key_so[31]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[31]), .latout(key_array[31]) );
cl_mc1_scm_msff_lat_4x	key_30 ( .si(key_so[31]), .so(key_so[30]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[30]), .latout(key_array[30]) );
cl_mc1_scm_msff_lat_4x	key_29 ( .si(key_so[30]), .so(key_so[29]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[29]), .latout(key_array[29]) );
cl_mc1_scm_msff_lat_4x	key_28 ( .si(key_so[29]), .so(key_so[28]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[28]), .latout(key_array[28]) );

cl_mc1_scm_msff_lat_4x	ff_lkup_en ( .si(key_so[28]), .so(lkup_en_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(lkup_en), .latout(lkup_en_array) );

cl_mc1_scm_msff_lat_4x	key_27 ( .si(lkup_en_so), .so(key_so[27]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[27]), .latout(key_array[27]) );
cl_mc1_scm_msff_lat_4x	key_26 ( .si(key_so[27]), .so(key_so[26]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[26]), .latout(key_array[26]) );
cl_mc1_scm_msff_lat_4x	key_25 ( .si(key_so[26]), .so(key_so[25]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[25]), .latout(key_array[25]) );
cl_mc1_scm_msff_lat_4x	key_24 ( .si(key_so[25]), .so(key_so[24]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[24]), .latout(key_array[24]) );
cl_mc1_scm_msff_lat_4x	key_23 ( .si(key_so[24]), .so(key_so[23]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[23]), .latout(key_array[23]) );
cl_mc1_scm_msff_lat_4x	key_22 ( .si(key_so[23]), .so(key_so[22]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[22]), .latout(key_array[22]) );
cl_mc1_scm_msff_lat_4x	key_21 ( .si(key_so[22]), .so(key_so[21]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[21]), .latout(key_array[21]) );
cl_mc1_scm_msff_lat_4x	key_20 ( .si(key_so[21]), .so(key_so[20]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[20]), .latout(key_array[20]) );
cl_mc1_scm_msff_lat_4x	key_19 ( .si(key_so[20]), .so(key_so[19]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[19]), .latout(key_array[19]) );
cl_mc1_scm_msff_lat_4x	key_18 ( .si(key_so[19]), .so(key_so[18]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[18]), .latout(key_array[18]) );
cl_mc1_scm_msff_lat_4x	key_17 ( .si(key_so[18]), .so(key_so[17]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[17]), .latout(key_array[17]) );
cl_mc1_scm_msff_lat_4x	key_16 ( .si(key_so[17]), .so(key_so[16]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[16]), .latout(key_array[16]) );
cl_mc1_scm_msff_lat_4x	key_15 ( .si(key_so[16]), .so(key_so[15]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[15]), .latout(key_array[15]) );
cl_mc1_scm_msff_lat_4x	key_14 ( .si(key_so[15]), .so(key_so[14]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[14]), .latout(key_array[14]) );
cl_mc1_scm_msff_lat_4x	key_13 ( .si(key_so[14]), .so(key_so[13]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[13]), .latout(key_array[13]) );
cl_mc1_scm_msff_lat_4x	key_12 ( .si(key_so[13]), .so(key_so[12]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[12]), .latout(key_array[12]) );
cl_mc1_scm_msff_lat_4x	key_11 ( .si(key_so[12]), .so(key_so[11]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[11]), .latout(key_array[11]) );
cl_mc1_scm_msff_lat_4x	key_10 ( .si(key_so[11]), .so(key_so[10]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[10]), .latout(key_array[10]) );
cl_mc1_scm_msff_lat_4x	key_9 ( .si(key_so[10]), .so(key_so[9]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[9]), .latout(key_array[9]) );
cl_mc1_scm_msff_lat_4x	key_8 ( .si(key_so[9]), .so(key_so[8]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[8]), .latout(key_array[8]) );
cl_mc1_scm_msff_lat_4x	key_7 ( .si(key_so[8]), .so(key_so[7]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[7]), .latout(key_array[7]) );
cl_mc1_scm_msff_lat_4x	key_6 ( .si(key_so[7]), .so(key_so[6]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[6]), .latout(key_array[6]) );
cl_mc1_scm_msff_lat_4x	key_5 ( .si(key_so[6]), .so(key_so[5]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[5]), .latout(key_array[5]) );
cl_mc1_scm_msff_lat_4x	key_4 ( .si(key_so[5]), .so(key_so[4]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[4]), .latout(key_array[4]) );
cl_mc1_scm_msff_lat_4x	key_3 ( .si(key_so[4]), .so(key_so[3]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[3]), .latout(key_array[3]) );
cl_mc1_scm_msff_lat_4x	key_2 ( .si(key_so[3]), .so(key_so[2]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[2]), .latout(key_array[2]) );
cl_mc1_scm_msff_lat_4x	key_1 ( .si(key_so[2]), .so(key_so[1]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[1]), .latout(key_array[1]) );
cl_mc1_scm_msff_lat_4x	key_0 ( .si(key_so[1]), .so(key_so[0]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(key[0]), .latout(key_array[0]) );

cl_mc1_scm_msff_lat_4x	ff_rd_en ( .si(key_so[0]), .so(rd_en_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_en), .latout(rd_en_array) );

cl_sc1_msff_8x		ff_wr_en ( .si(rd_en_so), .so(wr_en_so), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_en), .q(wr_en_array) );

cl_mc1_scm_msff_lat_4x	rd_addr_so_0 ( .si(wr_en_so), .so(rd_addr_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_addr[0]), .latout(rd_addr_array[0]) );
cl_sc1_msff_8x		wr_addr_so_0 ( .si(rd_addr_so[0]), .so(wr_addr_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_addr[0]), .q(wr_addr_array[0]) );
cl_sc1_msff_8x		wr_addr_so_1 ( .si(wr_addr_so[0]), .so(wr_addr_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_addr[1]), .q(wr_addr_array[1]) );
cl_mc1_scm_msff_lat_4x	rd_addr_so_1 ( .si(wr_addr_so[1]), .so(rd_addr_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_addr[1]), .latout(rd_addr_array[1]) );
cl_mc1_scm_msff_lat_4x	rd_addr_so_2 ( .si(rd_addr_so[1]), .so(rd_addr_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_addr[2]), .latout(rd_addr_array[2]) );
cl_sc1_msff_8x		wr_addr_so_2 ( .si(rd_addr_so[2]), .so(wr_addr_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_addr[2]), .q(wr_addr_array[2]) );
cl_sc1_msff_8x		wr_addr_so_3 ( .si(wr_addr_so[2]), .so(wr_addr_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_addr[3]), .q(wr_addr_array[3]) );
cl_mc1_scm_msff_lat_4x	rd_addr_so_3 ( .si(wr_addr_so[3]), .so(rd_addr_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_addr[3]), .latout(rd_addr_array[3]) );
cl_mc1_scm_msff_lat_4x	rd_addr_so_4 ( .si(rd_addr_so[3]), .so(rd_addr_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_addr[4]), .latout(rd_addr_array[4]) );
cl_sc1_msff_8x		wr_addr_so_4 ( .si(rd_addr_so[4]), .so(wr_addr_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_addr[4]), .q(wr_addr_array[4]) );
cl_sc1_msff_8x		wr_addr_so_5 ( .si(wr_addr_so[4]), .so(wr_addr_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_addr[5]), .q(wr_addr_array[5]) );
cl_mc1_scm_msff_lat_4x	rd_addr_so_5 ( .si(wr_addr_so[5]), .so(rd_addr_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_addr[5]), .latout(rd_addr_array[5]) );

cl_mc1_scm_msff_lat_4x	ff_hld ( .si(rd_addr_so[5]), .so(scan_out), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(hld), .latout(hld_array) );

wire	x1_,wr_array, rd_array;
//assign	rd_array = !wr_inhibit_array & rd_en_array;
not  rd2 (x1_,wr_inhibit_array);
and  rd1 (rd_array,rd_en_array,x1_);

//assign	wr_array = !wr_inhibit_array & wr_en_array;
and  wr1 (wr_array,wr_en_array,x1_);

wire	lkup_array;
//assign	lkup_array = !(wr_inhibit_array) & lkup_en_array;
and  lkup1 (lkup_array,lkup_en_array,x1_);

wire	inhibit_array;
//assign	inhibit_array = wr_inhibit_array | hld_array;
or  inhibit1 (inhibit_array,wr_inhibit_array,hld_array);


  //------------------------------------------------------------------------
  //  instantiate the clock-less ram
  //------------------------------------------------------------------------
wire	[32:0]	dout_array;	
n2_mmu_cm_64x34s_cust_array	mmu_cam_vtb(
		.clk			(and_clk),
		.l2clk (clk),
		.rd_addr_array		(rd_addr_array[5:0]),
		.wr_addr_array		(wr_addr_array[5:0]),
		.wr_array		(wr_array),
		.rd_array		(rd_array),
		.lkup_en_array		(lkup_array),
		.hld_array		(inhibit_array),
		.din_array		(din_array[32:0]),
		.key_array		(key_array[32:0]),
		.hit_array		(hit_array[63:0]),
		.dout_array		(dout_array[32:0])
		);

assign	dout[32:0] =  dout_array[32:0];
assign	hit = hit_array[63:0] ;



endmodule	//n2_mmu_cm_64x34s_cust



module n2_mmu_cm_64x34s_cust_array	(

   // ram control
   clk,
   l2clk,
   rd_addr_array,
   wr_addr_array,
   wr_array,
   rd_array,
   lkup_en_array,
   hld_array,
   din_array, 
   key_array, 
   hit_array, 
   dout_array    

);




   // 
   input 		clk,l2clk;				// clk 
   input [5:0]		rd_addr_array;			// read port address in
   input [5:0]		wr_addr_array;			// write port address in
   input		wr_array;			// write port enable
   input		rd_array;			// read port enable
   input		lkup_en_array;			// enable CAM operation
   input		hld_array;			// enable CAM operation
   input [32:0] 	din_array;			// data in
   input [32:0] 	key_array;			// value to CAM against
   output [32:0] 	dout_array;			// data out
   output [63:0] 	hit_array;			// results of CAM operation

integer	i;
// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------
// checker to verify on accesses's that no bits are x
/* //BP 0in assert -var (((|rd_addr_array[6:0] ) == 1'bx)
                    || ((|wr_addr_array[6:0] ) == 1'bx)
                    || ((wr_en_array ) == 1'bx))
               -active (rd_array | wr_array)
               -module dmu_ram128x132_array
                -name dmu_ram128x132_array_x
*/
  // 0in kndr -var rd_addr_array
  // 0in kndr -var wr_addr_array
  // 0in kndr -var wr_array
  // 0in kndr -var rd_array
  // 0in kndr -var lkup_en_array
  // 0in kndr -var din_array -active (wr_array )


/* RAM Array: =128 - 1        -> 127    */

reg     [32:0]  tag      [0:63];
reg	[63:0]	hit_array;
reg	[32:0]	dout_array;

// Initialize the arrays
`ifndef NOINITMEM
initial begin
  for (i=0; i<64; i=i+1) begin
    tag[i] = 33'b0;
  end
  hit_array = 64'b0;
end
`endif



// ----------------------------------------------------------------------------
// Read the array
// ----------------------------------------------------------------------------
//assign	dout_array[131:0] =	array_ram[rd_addr_array[6:0]];
reg read_flag;
always @(clk or rd_addr_array or rd_array or wr_array or wr_addr_array or l2clk) begin
read_flag <=0;
	if (clk & l2clk) begin
	if (rd_array) begin
read_flag <=1;
                if (wr_array  & (rd_addr_array == wr_addr_array)) begin
                dout_array[32:0] <= {33{1'bx}}; //0in <fire -severity 1 -message " got x's in dmu cam" -group mbist_mode
                end
        else begin
		dout_array <=     tag[rd_addr_array[5:0]];
		end
	end
	end
end



// ----------------------------------------------------------------------------
// Write the array, note: it is written when the clock is low
// ----------------------------------------------------------------------------
reg write_flag;
  always @ ( clk or lkup_en_array or hld_array or l2clk or
				wr_addr_array or din_array or key_array or wr_array)  begin
write_flag<=0;
	if(~clk & ~l2clk) begin
      if (wr_array ) begin
write_flag<=1;
        tag[wr_addr_array] <= din_array;
      	end
      end

	if(clk & l2clk) begin
    for (i = 0; i < 64; i = i + 1) begin
      if (~hld_array ) begin
       hit_array[i] <= lkup_en_array & (key_array == tag[i]);
      	end
      end
      end
  end



endmodule	// n2_mmu_cm_64x34s_cust_array


