// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_com_cm_64x64_cust.v
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
module n2_com_cm_64x64_cust (
  row_hit, 
  rd_data0, 
  rd_data1, 
  rd_data2, 
  rd_data3, 
  cam_en, 
  force_hit, 
  inv_mask0, 
  inv_mask1, 
  inv_mask2, 
  inv_mask3, 
  scan_in, 
  scan_out, 
  tcu_se_scancollar_in, 
  l2clk, 
  rd_en, 
  rw_addr0, 
  rw_addr1, 
  rw_addr2, 
  rw_addr3, 
  rst_warm_0, 
  rst_warm_1, 
  wr_en, 
  tcu_array_wr_inhibit, 
  wr_data0, 
  wr_data1, 
  wr_data2, 
  wr_data3, 
  tcu_pce_ov, 
  pce, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_array_bypass);
wire se;


output	[63:0]	row_hit;

output  [15:0]  rd_data0;               // From panel0 of dcm_panel.v,  BS and SR 11/18/03 Reverse Directory change
output  [15:0]  rd_data1;               // From panel1 of dcm_panel.v,  BS and SR 11/18/03 Reverse Directory change
output  [15:0]  rd_data2;               // From panel2 of dcm_panel.v,  BS and SR 11/18/03 Reverse Directory change
output  [15:0]  rd_data3;               // From panel3 of dcm_panel.v,  BS and SR 11/18/03 Reverse Directory change
 
input   [3:0]   cam_en;
input   [3:0]   force_hit;

input [7:0]     inv_mask0;              // To panel0 of dcm_panel.v
input [7:0]     inv_mask1;              // To panel1 of dcm_panel.v
input [7:0]     inv_mask2;              // To panel2 of dcm_panel.v
input [7:0]     inv_mask3;              // To panel3 of dcm_panel.v

input		scan_in;
output		scan_out;
input		tcu_se_scancollar_in;   

input           l2clk;                   // To panel0 of dcm_panel.v, ...

input  [3:0]    rd_en ;           // To panel0 of dcm_panel.v

input [5:0]     rw_addr0;      // To panel0 of dcm_panel.v,  BS and SR 11/18/03 Reverse Directory change
input [5:0]     rw_addr1;      // To panel1 of dcm_panel.v,  BS and SR 11/18/03 Reverse Directory change
input [5:0]     rw_addr2;      // To panel2 of dcm_panel.v,  BS and SR 11/18/03 Reverse Directory change
input [5:0]     rw_addr3;      // To panel3 of dcm_panel.v,  BS and SR 11/18/03 Reverse Directory change

input		rst_warm_0;
input		rst_warm_1;

input   [3:0]   wr_en;            // To panel0 of dcm_panel.v
input		tcu_array_wr_inhibit; // used to disable writes during SCAN.

input [15:0]    wr_data0;         // To panel0 of dcm_panel.v, BS and SR 11/18/03 Reverse Directory change
input [15:0]    wr_data1;         // To panel1 of dcm_panel.v, BS and SR 11/18/03 Reverse Directory change
input [15:0]    wr_data2;         // To panel2 of dcm_panel.v, BS and SR 11/18/03 Reverse Directory change
input [15:0]    wr_data3;         // To panel3 of dcm_panel.v, BS and SR 11/18/03 Reverse Directory change

input           tcu_pce_ov;
input           pce;
input           tcu_aclk;
input           tcu_bclk;
input		tcu_scan_en;
input           tcu_array_bypass; // array bypass for DFT

// JDL 05/17/07
// synopsys translate_off


wire	[63:0]	lkup_hit0, lkup_hit1, lkup_hit2, lkup_hit3;
wire	[63:0]	bank1_hit;
wire	[63:0]	bank0_hit;



// scan chain connections ////
wire stop;
wire [2:0] siclk;
wire [2:0] soclk;
//assign siclk[0] = tcu_aclk;
//assign soclk[0] = tcu_bclk;
//assign siclk[1] = tcu_aclk;
//assign soclk[1] = tcu_bclk;
//assign siclk[2] = tcu_aclk;
//assign soclk[2] = tcu_bclk;
wire pce_ov = tcu_pce_ov;
assign stop = 1'b0;
//assign pce_ov = tcu_pce_ov;

  //------------------------------------------------------------------------
  //  instantiate clock headers
  //------------------------------------------------------------------------
wire   [1:0] collar_clk;
wire	     in_clk;
wire aclk   = tcu_aclk;
wire bclk   = tcu_bclk;
assign se = tcu_se_scancollar_in;       // TEMP

//0in fire -message "cam_en and wr_en active at the same time" -active (cam_en[0] & wr_en[0]) -group mbist_mode
//0in fire -message "cam_en and wr_en active at the same time" -active (cam_en[1] & wr_en[1]) -group mbist_mode
//0in fire -message "cam_en and wr_en active at the same time" -active (cam_en[2] & wr_en[2]) -group mbist_mode
//0in fire -message "cam_en and wr_en active at the same time" -active (cam_en[3] & wr_en[3]) -group mbist_mode


//0in fire -message "rd_en and wr_en active at the same time" -active (rd_en[3] & wr_en[3]) -group mbist_mode
//0in fire -message "rd_en and wr_en active at the same time" -active (rd_en[2] & wr_en[2]) -group mbist_mode
//0in fire -message "rd_en and wr_en active at the same time" -active (rd_en[1] & wr_en[1]) -group mbist_mode
//0in fire -message "rd_en and wr_en active at the same time" -active (rd_en[0] & wr_en[0]) -group mbist_mode

cl_dp1_l1hdr_8x clk_hdr_ctrl (
        .l2clk(l2clk),
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

cl_dp1_l1hdr_8x clk_hdr_data (
        .l2clk(l2clk),
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

cl_dp1_l1hdr_8x clk_hdr_inputs (
        .l2clk(l2clk),
        .pce (pce),
        .l1clk(in_clk),
        .siclk_out(siclk[2]),
        .soclk_out(soclk[2]),
  .se(tcu_scan_en),
  .pce_ov(pce_ov),
  .stop(stop),
  .aclk(aclk),
  .bclk(bclk)
);

//// Input Flops /////

wire	[15:0]	wr_data0_array,wr_data0_so;
wire	[15:0]	wr_data1_array,wr_data1_so;
wire	[15:0]	wr_data2_array,wr_data2_so;
wire	[15:0]	wr_data3_array,wr_data3_so;
wire		nc;
wire	[3:0]	wr_en_array,rd_en_array,cam_en_array;
wire	[3:0]	cam_en_so,wr_en_so,rd_en_so;
wire	[7:0]	inv_mask0_array,inv_mask0_so;
wire	[7:0]	inv_mask1_array,inv_mask1_so;
wire	[7:0]	inv_mask2_array,inv_mask2_so;
wire	[7:0]	inv_mask3_array,inv_mask3_so;
wire	[1:0]	rst_warm_0_array,rst_warm_0_so;
wire	[1:0]	rst_warm_1_array,rst_warm_1_so;
wire	[5:0]	rw_addr0_array,rw_addr0_so;
wire	[5:0]	rw_addr1_array,rw_addr1_so;
wire	[5:0]	rw_addr2_array,rw_addr2_so;
wire	[5:0]	rw_addr3_array,rw_addr3_so;
wire	[3:0]	force_hit_array,force_hit_so;
wire	[140:1] q, q_l; 

cl_sc1_msff_8x	wr_data0_so_15 ( .si(scan_in), .so(wr_data0_so[15]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[15]), .q(wr_data0_array[15])	);
cl_sc1_msff_8x	wr_data0_so_13 ( .si(wr_data0_so[15]), .so(wr_data0_so[13]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[13]), .q(wr_data0_array[13])	);
cl_sc1_msff_8x	wr_data0_so_0 ( .si(wr_data0_so[13]), .so(wr_data0_so[0]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[0]), .q(wr_data0_array[0])	);
cl_sc1_msff_8x	wr_data0_so_1 ( .si(wr_data0_so[0]), .so(wr_data0_so[1]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[1]), .q(wr_data0_array[1])	);
cl_sc1_msff_8x	wr_data0_so_2 ( .si(wr_data0_so[1]), .so(wr_data0_so[2]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[2]), .q(wr_data0_array[2])	);
cl_sc1_msff_8x	wr_data0_so_3 ( .si(wr_data0_so[2]), .so(wr_data0_so[3]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[3]), .q(wr_data0_array[3])	);
cl_sc1_msff_8x	wr_data0_so_4 ( .si(wr_data0_so[3]), .so(wr_data0_so[4]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[4]), .q(wr_data0_array[4])	);

cl_mc1_scm_msff_lat_4x	ff_cam_en_0 ( .si(wr_data0_so[4]), .so(cam_en_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(cam_en[0]), .latout(cam_en_array[0]), .q(q[1]), .q_l(q_l[1]) );

cl_sc1_msff_8x	wr_data0_so_5 ( .si(cam_en_so[0]), .so(wr_data0_so[5]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[5]), .q(wr_data0_array[5])	);
cl_sc1_msff_8x	wr_data0_so_6 ( .si(wr_data0_so[5]), .so(wr_data0_so[6]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[6]), .q(wr_data0_array[6])	);
cl_sc1_msff_8x	wr_data0_so_7 ( .si(wr_data0_so[6]), .so(wr_data0_so[7]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[7]), .q(wr_data0_array[7])	);
cl_sc1_msff_8x	wr_data0_so_8 ( .si(wr_data0_so[7]), .so(wr_data0_so[8]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[8]), .q(wr_data0_array[8])	);
cl_sc1_msff_8x	wr_data0_so_9 ( .si(wr_data0_so[8]), .so(wr_data0_so[9]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[9]), .q(wr_data0_array[9])	);
cl_sc1_msff_8x	wr_data0_so_10 ( .si(wr_data0_so[9]), .so(wr_data0_so[10]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[10]), .q(wr_data0_array[10])	);
cl_sc1_msff_8x	wr_data0_so_11 ( .si(wr_data0_so[10]), .so(wr_data0_so[11]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[11]), .q(wr_data0_array[11])	);
cl_sc1_msff_8x	wr_data0_so_12 ( .si(wr_data0_so[11]), .so(wr_data0_so[12]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[12]), .q(wr_data0_array[12])	);
cl_sc1_msff_8x	wr_data0_so_14 ( .si(wr_data0_so[12]), .so(wr_data0_so[14]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data0[14]), .q(wr_data0_array[14])	);

cl_mc1_scm_msff_lat_4x	ff_rd_en_0 ( .si(wr_data0_so[14]), .so(rd_en_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_en[0]), .latout(rd_en_array[0]), .q(q[2]), .q_l(q_l[2]) );
cl_mc1_scm_msff_lat_4x	ff_wr_en_0 ( .si(rd_en_so[0]), .so(wr_en_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_en[0]), .latout(wr_en_array[0]), .q(q[3]), .q_l(q_l[3]) );

cl_mc1_scm_msff_lat_4x	inv_mask0_so_0 ( .si(wr_en_so[0]), .so(inv_mask0_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask0[0]), .latout(inv_mask0_array[0]), .q(q[4]), .q_l(q_l[4]) );
cl_mc1_scm_msff_lat_4x	inv_mask0_so_1 ( .si(inv_mask0_so[0]), .so(inv_mask0_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask0[1]), .latout(inv_mask0_array[1]), .q(q[5]), .q_l(q_l[5]) );
cl_mc1_scm_msff_lat_4x	inv_mask0_so_2 ( .si(inv_mask0_so[1]), .so(inv_mask0_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask0[2]), .latout(inv_mask0_array[2]), .q(q[6]), .q_l(q_l[6]) );
cl_mc1_scm_msff_lat_4x	inv_mask0_so_3 ( .si(inv_mask0_so[2]), .so(inv_mask0_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask0[3]), .latout(inv_mask0_array[3]), .q(q[7]), .q_l(q_l[7]) );
cl_mc1_scm_msff_lat_4x	inv_mask0_so_4 ( .si(inv_mask0_so[3]), .so(inv_mask0_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask0[4]), .latout(inv_mask0_array[4]), .q(q[8]), .q_l(q_l[8]) );
cl_mc1_scm_msff_lat_4x	inv_mask0_so_5 ( .si(inv_mask0_so[4]), .so(inv_mask0_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask0[5]), .latout(inv_mask0_array[5]), .q(q[9]), .q_l(q_l[9]) );
cl_mc1_scm_msff_lat_4x	inv_mask0_so_6 ( .si(inv_mask0_so[5]), .so(inv_mask0_so[6]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask0[6]), .latout(inv_mask0_array[6]), .q(q[10]), .q_l(q_l[10]) );
cl_mc1_scm_msff_lat_4x	inv_mask0_so_7 ( .si(inv_mask0_so[6]), .so(inv_mask0_so[7]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask0[7]), .latout(inv_mask0_array[7]), .q(q[11]), .q_l(q_l[11]) );

cl_mc1_scm_msff_lat_4x	rw_addr0_so_0 ( .si(inv_mask0_so[7]), .so(rw_addr0_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr0[0]), .latout(rw_addr0_array[0]), .q(q[12]), .q_l(q_l[12]) );
cl_mc1_scm_msff_lat_4x	rw_addr0_so_1 ( .si(rw_addr0_so[0]), .so(rw_addr0_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr0[1]), .latout(rw_addr0_array[1]), .q(q[13]), .q_l(q_l[13]) );
cl_mc1_scm_msff_lat_4x	rw_addr0_so_2 ( .si(rw_addr0_so[1]), .so(rw_addr0_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr0[2]), .latout(rw_addr0_array[2]), .q(q[14]), .q_l(q_l[14]) );
cl_mc1_scm_msff_lat_4x	rw_addr0_so_3 ( .si(rw_addr0_so[2]), .so(rw_addr0_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr0[3]), .latout(rw_addr0_array[3]), .q(q[15]), .q_l(q_l[15]) );
cl_mc1_scm_msff_lat_4x	rw_addr0_so_4 ( .si(rw_addr0_so[3]), .so(rw_addr0_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr0[4]), .latout(rw_addr0_array[4]), .q(q[16]), .q_l(q_l[16]) );
cl_mc1_scm_msff_lat_4x	rw_addr0_so_5 ( .si(rw_addr0_so[4]), .so(rw_addr0_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr0[5]), .latout(rw_addr0_array[5]), .q(q[17]), .q_l(q_l[17]) );

cl_mc1_scm_msff_lat_4x	rst_warm0_0 ( .si(rw_addr0_so[5]), .so(rst_warm_0_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rst_warm_0), .latout(rst_warm_0_array[0]), .q(q[18]), .q_l(q_l[18]) );
cl_mc1_scm_msff_lat_4x	ff_force_hit_0 ( .si(rst_warm_0_so[0]), .so(force_hit_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(force_hit[0]), .latout(force_hit_array[0]), .q(q[19]), .q_l(q_l[19]) );


cl_sc1_msff_8x	wr_data1_so_15 ( .si(force_hit_so[0]), .so(wr_data1_so[15]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[15]), .q(wr_data1_array[15])	);
cl_sc1_msff_8x	wr_data1_so_13 ( .si(wr_data1_so[15]), .so(wr_data1_so[13]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[13]), .q(wr_data1_array[13])	);
cl_sc1_msff_8x	wr_data1_so_0 ( .si(wr_data1_so[13]), .so(wr_data1_so[0]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[0]), .q(wr_data1_array[0])	);
cl_sc1_msff_8x	wr_data1_so_1 ( .si(wr_data1_so[0]), .so(wr_data1_so[1]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[1]), .q(wr_data1_array[1])	);
cl_sc1_msff_8x	wr_data1_so_2 ( .si(wr_data1_so[1]), .so(wr_data1_so[2]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[2]), .q(wr_data1_array[2])	);
cl_sc1_msff_8x	wr_data1_so_3 ( .si(wr_data1_so[2]), .so(wr_data1_so[3]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[3]), .q(wr_data1_array[3])	);
cl_sc1_msff_8x	wr_data1_so_4 ( .si(wr_data1_so[3]), .so(wr_data1_so[4]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[4]), .q(wr_data1_array[4])	);

cl_mc1_scm_msff_lat_4x	ff_cam_en_1 ( .si(wr_data1_so[4]), .so(cam_en_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(cam_en[1]), .latout(cam_en_array[1]), .q(q[20]), .q_l(q_l[20]) );

cl_sc1_msff_8x	wr_data1_so_5 ( .si(cam_en_so[1]), .so(wr_data1_so[5]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[5]), .q(wr_data1_array[5])	);
cl_sc1_msff_8x	wr_data1_so_6 ( .si(wr_data1_so[5]), .so(wr_data1_so[6]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[6]), .q(wr_data1_array[6])	);
cl_sc1_msff_8x	wr_data1_so_7 ( .si(wr_data1_so[6]), .so(wr_data1_so[7]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[7]), .q(wr_data1_array[7])	);
cl_sc1_msff_8x	wr_data1_so_8 ( .si(wr_data1_so[7]), .so(wr_data1_so[8]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[8]), .q(wr_data1_array[8])	);
cl_sc1_msff_8x	wr_data1_so_9 ( .si(wr_data1_so[8]), .so(wr_data1_so[9]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[9]), .q(wr_data1_array[9])	);
cl_sc1_msff_8x	wr_data1_so_10 ( .si(wr_data1_so[9]), .so(wr_data1_so[10]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[10]), .q(wr_data1_array[10])	);
cl_sc1_msff_8x	wr_data1_so_11 ( .si(wr_data1_so[10]), .so(wr_data1_so[11]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[11]), .q(wr_data1_array[11])	);
cl_sc1_msff_8x	wr_data1_so_12 ( .si(wr_data1_so[11]), .so(wr_data1_so[12]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[12]), .q(wr_data1_array[12])	);
cl_sc1_msff_8x	wr_data1_so_14 ( .si(wr_data1_so[12]), .so(wr_data1_so[14]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data1[14]), .q(wr_data1_array[14])	);

cl_mc1_scm_msff_lat_4x	ff_rd_en_1 ( .si(wr_data1_so[14]), .so(rd_en_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_en[1]), .latout(rd_en_array[1]), .q(q[21]), .q_l(q_l[21]) );
cl_mc1_scm_msff_lat_4x	ff_wr_en_1 ( .si(rd_en_so[1]), .so(wr_en_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_en[1]), .latout(wr_en_array[1]), .q(q[22]), .q_l(q_l[22]) );

cl_mc1_scm_msff_lat_4x	inv_mask1_so_0 ( .si(wr_en_so[1]), .so(inv_mask1_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask1[0]), .latout(inv_mask1_array[0]), .q(q[23]), .q_l(q_l[23]) );
cl_mc1_scm_msff_lat_4x	inv_mask1_so_1 ( .si(inv_mask1_so[0]), .so(inv_mask1_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask1[1]), .latout(inv_mask1_array[1]), .q(q[24]), .q_l(q_l[24]) );
cl_mc1_scm_msff_lat_4x	inv_mask1_so_2 ( .si(inv_mask1_so[1]), .so(inv_mask1_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask1[2]), .latout(inv_mask1_array[2]), .q(q[25]), .q_l(q_l[25]) );
cl_mc1_scm_msff_lat_4x	inv_mask1_so_3 ( .si(inv_mask1_so[2]), .so(inv_mask1_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask1[3]), .latout(inv_mask1_array[3]), .q(q[26]), .q_l(q_l[26]) );
cl_mc1_scm_msff_lat_4x	inv_mask1_so_4 ( .si(inv_mask1_so[3]), .so(inv_mask1_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask1[4]), .latout(inv_mask1_array[4]), .q(q[27]), .q_l(q_l[27]) );
cl_mc1_scm_msff_lat_4x	inv_mask1_so_5 ( .si(inv_mask1_so[4]), .so(inv_mask1_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask1[5]), .latout(inv_mask1_array[5]), .q(q[28]), .q_l(q_l[28]) );
cl_mc1_scm_msff_lat_4x	inv_mask1_so_6 ( .si(inv_mask1_so[5]), .so(inv_mask1_so[6]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask1[6]), .latout(inv_mask1_array[6]), .q(q[29]), .q_l(q_l[29]) );
cl_mc1_scm_msff_lat_4x	inv_mask1_so_7 ( .si(inv_mask1_so[6]), .so(inv_mask1_so[7]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask1[7]), .latout(inv_mask1_array[7]), .q(q[30]), .q_l(q_l[30]) );

cl_mc1_scm_msff_lat_4x	rw_addr1_so_0 ( .si(inv_mask1_so[7]), .so(rw_addr1_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr1[0]), .latout(rw_addr1_array[0]), .q(q[31]), .q_l(q_l[31]) );
cl_mc1_scm_msff_lat_4x	rw_addr1_so_1 ( .si(rw_addr1_so[0]), .so(rw_addr1_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr1[1]), .latout(rw_addr1_array[1]), .q(q[32]), .q_l(q_l[32]) );
cl_mc1_scm_msff_lat_4x	rw_addr1_so_2 ( .si(rw_addr1_so[1]), .so(rw_addr1_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr1[2]), .latout(rw_addr1_array[2]), .q(q[33]), .q_l(q_l[33]) );
cl_mc1_scm_msff_lat_4x	rw_addr1_so_3 ( .si(rw_addr1_so[2]), .so(rw_addr1_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr1[3]), .latout(rw_addr1_array[3]), .q(q[34]), .q_l(q_l[34]) );
cl_mc1_scm_msff_lat_4x	rw_addr1_so_4 ( .si(rw_addr1_so[3]), .so(rw_addr1_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr1[4]), .latout(rw_addr1_array[4]), .q(q[35]), .q_l(q_l[35]) );
cl_mc1_scm_msff_lat_4x	rw_addr1_so_5 ( .si(rw_addr1_so[4]), .so(rw_addr1_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr1[5]), .latout(rw_addr1_array[5]), .q(q[36]), .q_l(q_l[36]) );

cl_mc1_scm_msff_lat_4x	rst_warm0_1 ( .si(rw_addr1_so[5]), .so(rst_warm_0_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rst_warm_0), .latout(rst_warm_0_array[1]), .q(q[37]), .q_l(q_l[37]) );
cl_mc1_scm_msff_lat_4x	ff_force_hit_1 ( .si(rst_warm_0_so[1]), .so(force_hit_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(force_hit[1]), .latout(force_hit_array[1]), .q(q[38]), .q_l(q_l[38]) );


cl_sc1_msff_8x	wr_data2_so_15 ( .si(force_hit_so[1]), .so(wr_data2_so[15]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[15]), .q(wr_data2_array[15])	);
cl_sc1_msff_8x	wr_data2_so_13 ( .si(wr_data2_so[15]), .so(wr_data2_so[13]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[13]), .q(wr_data2_array[13])	);
cl_sc1_msff_8x	wr_data2_so_0 ( .si(wr_data2_so[13]), .so(wr_data2_so[0]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[0]), .q(wr_data2_array[0])	);
cl_sc1_msff_8x	wr_data2_so_1 ( .si(wr_data2_so[0]), .so(wr_data2_so[1]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[1]), .q(wr_data2_array[1])	);
cl_sc1_msff_8x	wr_data2_so_2 ( .si(wr_data2_so[1]), .so(wr_data2_so[2]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[2]), .q(wr_data2_array[2])	);
cl_sc1_msff_8x	wr_data2_so_3 ( .si(wr_data2_so[2]), .so(wr_data2_so[3]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[3]), .q(wr_data2_array[3])	);
cl_sc1_msff_8x	wr_data2_so_4 ( .si(wr_data2_so[3]), .so(wr_data2_so[4]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[4]), .q(wr_data2_array[4])	);

cl_mc1_scm_msff_lat_4x	ff_cam_en_2 ( .si(wr_data2_so[4]), .so(cam_en_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(cam_en[2]), .latout(cam_en_array[2]), .q(q[39]), .q_l(q_l[39]) );

cl_sc1_msff_8x	wr_data2_so_5 ( .si(cam_en_so[2]), .so(wr_data2_so[5]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[5]), .q(wr_data2_array[5])	);
cl_sc1_msff_8x	wr_data2_so_6 ( .si(wr_data2_so[5]), .so(wr_data2_so[6]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[6]), .q(wr_data2_array[6])	);
cl_sc1_msff_8x	wr_data2_so_7 ( .si(wr_data2_so[6]), .so(wr_data2_so[7]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[7]), .q(wr_data2_array[7])	);
cl_sc1_msff_8x	wr_data2_so_8 ( .si(wr_data2_so[7]), .so(wr_data2_so[8]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[8]), .q(wr_data2_array[8])	);
cl_sc1_msff_8x	wr_data2_so_9 ( .si(wr_data2_so[8]), .so(wr_data2_so[9]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[9]), .q(wr_data2_array[9])	);
cl_sc1_msff_8x	wr_data2_so_10 ( .si(wr_data2_so[9]), .so(wr_data2_so[10]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[10]), .q(wr_data2_array[10])	);
cl_sc1_msff_8x	wr_data2_so_11 ( .si(wr_data2_so[10]), .so(wr_data2_so[11]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[11]), .q(wr_data2_array[11])	);
cl_sc1_msff_8x	wr_data2_so_12 ( .si(wr_data2_so[11]), .so(wr_data2_so[12]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[12]), .q(wr_data2_array[12])	);
cl_sc1_msff_8x	wr_data2_so_14 ( .si(wr_data2_so[12]), .so(wr_data2_so[14]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data2[14]), .q(wr_data2_array[14])	);

cl_mc1_scm_msff_lat_4x	ff_rd_en_2 ( .si(wr_data2_so[14]), .so(rd_en_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_en[2]), .latout(rd_en_array[2]), .q(q[40]), .q_l(q_l[40]) );
cl_mc1_scm_msff_lat_4x	ff_wr_en_2 ( .si(rd_en_so[2]), .so(wr_en_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_en[2]), .latout(wr_en_array[2]), .q(q[41]), .q_l(q_l[41]) );

cl_mc1_scm_msff_lat_4x	inv_mask2_so_0 ( .si(wr_en_so[2]), .so(inv_mask2_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask2[0]), .latout(inv_mask2_array[0]), .q(q[42]), .q_l(q_l[42]) );
cl_mc1_scm_msff_lat_4x	inv_mask2_so_1 ( .si(inv_mask2_so[0]), .so(inv_mask2_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask2[1]), .latout(inv_mask2_array[1]), .q(q[43]), .q_l(q_l[43]) );
cl_mc1_scm_msff_lat_4x	inv_mask2_so_2 ( .si(inv_mask2_so[1]), .so(inv_mask2_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask2[2]), .latout(inv_mask2_array[2]), .q(q[44]), .q_l(q_l[44]) );
cl_mc1_scm_msff_lat_4x	inv_mask2_so_3 ( .si(inv_mask2_so[2]), .so(inv_mask2_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask2[3]), .latout(inv_mask2_array[3]), .q(q[45]), .q_l(q_l[45]) );
cl_mc1_scm_msff_lat_4x	inv_mask2_so_4 ( .si(inv_mask2_so[3]), .so(inv_mask2_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask2[4]), .latout(inv_mask2_array[4]), .q(q[46]), .q_l(q_l[46]) );
cl_mc1_scm_msff_lat_4x	inv_mask2_so_5 ( .si(inv_mask2_so[4]), .so(inv_mask2_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask2[5]), .latout(inv_mask2_array[5]), .q(q[47]), .q_l(q_l[47]) );
cl_mc1_scm_msff_lat_4x	inv_mask2_so_6 ( .si(inv_mask2_so[5]), .so(inv_mask2_so[6]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask2[6]), .latout(inv_mask2_array[6]), .q(q[48]), .q_l(q_l[48]) );
cl_mc1_scm_msff_lat_4x	inv_mask2_so_7 ( .si(inv_mask2_so[6]), .so(inv_mask2_so[7]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask2[7]), .latout(inv_mask2_array[7]), .q(q[49]), .q_l(q_l[49]) );

cl_mc1_scm_msff_lat_4x	rw_addr2_so_0 ( .si(inv_mask2_so[7]), .so(rw_addr2_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr2[0]), .latout(rw_addr2_array[0]), .q(q[50]), .q_l(q_l[50]) );
cl_mc1_scm_msff_lat_4x	rw_addr2_so_1 ( .si(rw_addr2_so[0]), .so(rw_addr2_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr2[1]), .latout(rw_addr2_array[1]), .q(q[51]), .q_l(q_l[51]) );
cl_mc1_scm_msff_lat_4x	rw_addr2_so_2 ( .si(rw_addr2_so[1]), .so(rw_addr2_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr2[2]), .latout(rw_addr2_array[2]), .q(q[52]), .q_l(q_l[52]) );
cl_mc1_scm_msff_lat_4x	rw_addr2_so_3 ( .si(rw_addr2_so[2]), .so(rw_addr2_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr2[3]), .latout(rw_addr2_array[3]), .q(q[53]), .q_l(q_l[53]) );
cl_mc1_scm_msff_lat_4x	rw_addr2_so_4 ( .si(rw_addr2_so[3]), .so(rw_addr2_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr2[4]), .latout(rw_addr2_array[4]), .q(q[54]), .q_l(q_l[54]) );
cl_mc1_scm_msff_lat_4x	rw_addr2_so_5 ( .si(rw_addr2_so[4]), .so(rw_addr2_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr2[5]), .latout(rw_addr2_array[5]), .q(q[55]), .q_l(q_l[55]) );

cl_mc1_scm_msff_lat_4x	rst_warm1_0 ( .si(rw_addr2_so[5]), .so(rst_warm_1_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rst_warm_1), .latout(rst_warm_1_array[0]), .q(q[56]), .q_l(q_l[56]) );
cl_mc1_scm_msff_lat_4x	ff_force_hit_2 ( .si(rst_warm_1_so[0]), .so(force_hit_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(force_hit[2]), .latout(force_hit_array[2]), .q(q[57]), .q_l(q_l[57]) );


cl_sc1_msff_8x	wr_data3_so_15 ( .si(force_hit_so[2]), .so(wr_data3_so[15]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[15]), .q(wr_data3_array[15])	);
cl_sc1_msff_8x	wr_data3_so_13 ( .si(wr_data3_so[15]), .so(wr_data3_so[13]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[13]), .q(wr_data3_array[13])	);
cl_sc1_msff_8x	wr_data3_so_0 ( .si(wr_data3_so[13]), .so(wr_data3_so[0]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[0]), .q(wr_data3_array[0])	);
cl_sc1_msff_8x	wr_data3_so_1 ( .si(wr_data3_so[0]), .so(wr_data3_so[1]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[1]), .q(wr_data3_array[1])	);
cl_sc1_msff_8x	wr_data3_so_2 ( .si(wr_data3_so[1]), .so(wr_data3_so[2]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[2]), .q(wr_data3_array[2])	);
cl_sc1_msff_8x	wr_data3_so_3 ( .si(wr_data3_so[2]), .so(wr_data3_so[3]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[3]), .q(wr_data3_array[3])	);
cl_sc1_msff_8x	wr_data3_so_4 ( .si(wr_data3_so[3]), .so(wr_data3_so[4]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[4]), .q(wr_data3_array[4])	);

cl_mc1_scm_msff_lat_4x	ff_cam_en_3 ( .si(wr_data3_so[4]), .so(cam_en_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(cam_en[3]), .latout(cam_en_array[3]), .q(q[58]), .q_l(q_l[58]) );

cl_sc1_msff_8x	wr_data3_so_5 ( .si(cam_en_so[3]), .so(wr_data3_so[5]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[5]), .q(wr_data3_array[5])	);
cl_sc1_msff_8x	wr_data3_so_6 ( .si(wr_data3_so[5]), .so(wr_data3_so[6]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[6]), .q(wr_data3_array[6])	);
cl_sc1_msff_8x	wr_data3_so_7 ( .si(wr_data3_so[6]), .so(wr_data3_so[7]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[7]), .q(wr_data3_array[7])	);
cl_sc1_msff_8x	wr_data3_so_8 ( .si(wr_data3_so[7]), .so(wr_data3_so[8]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[8]), .q(wr_data3_array[8])	);
cl_sc1_msff_8x	wr_data3_so_9 ( .si(wr_data3_so[8]), .so(wr_data3_so[9]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[9]), .q(wr_data3_array[9])	);
cl_sc1_msff_8x	wr_data3_so_10 ( .si(wr_data3_so[9]), .so(wr_data3_so[10]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[10]), .q(wr_data3_array[10])	);
cl_sc1_msff_8x	wr_data3_so_11 ( .si(wr_data3_so[10]), .so(wr_data3_so[11]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[11]), .q(wr_data3_array[11])	);
cl_sc1_msff_8x	wr_data3_so_12 ( .si(wr_data3_so[11]), .so(wr_data3_so[12]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[12]), .q(wr_data3_array[12])	);
cl_sc1_msff_8x	wr_data3_so_14 ( .si(wr_data3_so[12]), .so(wr_data3_so[14]), .l1clk(collar_clk[1]), .siclk(siclk[1]), .soclk(soclk[1]), .d(wr_data3[14]), .q(wr_data3_array[14])	);

cl_mc1_scm_msff_lat_4x	ff_rd_en_3 ( .si(wr_data3_so[14]), .so(rd_en_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rd_en[3]), .latout(rd_en_array[3]), .q(q[59]), .q_l(q_l[59]) );
cl_mc1_scm_msff_lat_4x	ff_wr_en_3 ( .si(rd_en_so[3]), .so(wr_en_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(wr_en[3]), .latout(wr_en_array[3]), .q(q[60]), .q_l(q_l[60]) );

cl_mc1_scm_msff_lat_4x	inv_mask3_so_0 ( .si(wr_en_so[3]), .so(inv_mask3_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask3[0]), .latout(inv_mask3_array[0]), .q(q[61]), .q_l(q_l[61]) );
cl_mc1_scm_msff_lat_4x	inv_mask3_so_1 ( .si(inv_mask3_so[0]), .so(inv_mask3_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask3[1]), .latout(inv_mask3_array[1]), .q(q[62]), .q_l(q_l[62]) );
cl_mc1_scm_msff_lat_4x	inv_mask3_so_2 ( .si(inv_mask3_so[1]), .so(inv_mask3_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask3[2]), .latout(inv_mask3_array[2]), .q(q[63]), .q_l(q_l[63]) );
cl_mc1_scm_msff_lat_4x	inv_mask3_so_3 ( .si(inv_mask3_so[2]), .so(inv_mask3_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask3[3]), .latout(inv_mask3_array[3]), .q(q[64]), .q_l(q_l[64]) );
cl_mc1_scm_msff_lat_4x	inv_mask3_so_4 ( .si(inv_mask3_so[3]), .so(inv_mask3_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask3[4]), .latout(inv_mask3_array[4]), .q(q[65]), .q_l(q_l[65]) );
cl_mc1_scm_msff_lat_4x	inv_mask3_so_5 ( .si(inv_mask3_so[4]), .so(inv_mask3_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask3[5]), .latout(inv_mask3_array[5]), .q(q[66]), .q_l(q_l[66]) );
cl_mc1_scm_msff_lat_4x	inv_mask3_so_6 ( .si(inv_mask3_so[5]), .so(inv_mask3_so[6]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask3[6]), .latout(inv_mask3_array[6]), .q(q[67]), .q_l(q_l[67]) );
cl_mc1_scm_msff_lat_4x	inv_mask3_so_7 ( .si(inv_mask3_so[6]), .so(inv_mask3_so[7]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(inv_mask3[7]), .latout(inv_mask3_array[7]), .q(q[68]), .q_l(q_l[68]) );

cl_mc1_scm_msff_lat_4x	rw_addr3_so_0 ( .si(inv_mask3_so[7]), .so(rw_addr3_so[0]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr3[0]), .latout(rw_addr3_array[0]), .q(q[69]), .q_l(q_l[69]) );
cl_mc1_scm_msff_lat_4x	rw_addr3_so_1 ( .si(rw_addr3_so[0]), .so(rw_addr3_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr3[1]), .latout(rw_addr3_array[1]), .q(q[70]), .q_l(q_l[70]) );
cl_mc1_scm_msff_lat_4x	rw_addr3_so_2 ( .si(rw_addr3_so[1]), .so(rw_addr3_so[2]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr3[2]), .latout(rw_addr3_array[2]), .q(q[71]), .q_l(q_l[71]) );
cl_mc1_scm_msff_lat_4x	rw_addr3_so_3 ( .si(rw_addr3_so[2]), .so(rw_addr3_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr3[3]), .latout(rw_addr3_array[3]), .q(q[72]), .q_l(q_l[72]) );
cl_mc1_scm_msff_lat_4x	rw_addr3_so_4 ( .si(rw_addr3_so[3]), .so(rw_addr3_so[4]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr3[4]), .latout(rw_addr3_array[4]), .q(q[73]), .q_l(q_l[73]) );
cl_mc1_scm_msff_lat_4x	rw_addr3_so_5 ( .si(rw_addr3_so[4]), .so(rw_addr3_so[5]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rw_addr3[5]), .latout(rw_addr3_array[5]), .q(q[74]), .q_l(q_l[74]) );

cl_mc1_scm_msff_lat_4x	rst_warm1_1 ( .si(rw_addr3_so[5]), .so(rst_warm_1_so[1]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(rst_warm_1), .latout(rst_warm_1_array[1]), .q(q[75]), .q_l(q_l[75]) );
cl_mc1_scm_msff_lat_4x	ff_force_hit_3 ( .si(rst_warm_1_so[1]), .so(force_hit_so[3]), .l1clk(collar_clk[0]), .siclk(siclk[0]), .soclk(soclk[0]), .d(force_hit[3]), .latout(force_hit_array[3]), .q(q[76]), .q_l(q_l[76]) );

assign scan_out = force_hit_so[3];

dcm_panel_cust	panel0(
         // Outputs
         .lkup_hit            	(lkup_hit0[63:0]),       
         .rd_data             	(rd_data0[15:0]),  // BS and SR 11/18/03 Reverse Directory change
         // Inputs
         .tcu_aclk        	(1'b0),
         .tcu_bclk        	(1'b0),
         .tcu_pce_ov          	(tcu_pce_ov),
         .pce		      	(pce),
         .tcu_array_bypass    	(tcu_array_bypass),
         .rd_en               	(rd_en_array[0]),              
         .wr_en               	(wr_en_array[0]),             
         .tcu_array_wr_inhibit   		(tcu_array_wr_inhibit),          
         .force_hit   		(force_hit_array[0]),          
         .cam_en              	(cam_en_array[0]),              
         .wr_data             	(wr_data0_array[15:0]),  // BS and SR 11/18/03 Reverse Directory change
         .rw_addr             	(rw_addr0_array[5:0]),   // BS and SR 11/18/03 Reverse Directory change
         .inv_mask            	(inv_mask0_array[7:0]),         
         .l2clk                 (in_clk),
         .rst_warm              (rst_warm_0_array[0]),            
         .tcu_se_scancollar_in  (tcu_se_scancollar_in));

	assign	 bank0_hit 	=    lkup_hit0 | lkup_hit1 ;

dcm_panel_cust	panel1(
         // Outputs
         .lkup_hit            	(lkup_hit1[63:0]),       
         .rd_data             	(rd_data1[15:0]), // BS and SR 11/18/03 Reverse Directory change
         // Inputs
         .tcu_aclk        	(1'b0),
         .tcu_bclk        	(1'b0),
         .tcu_pce_ov          	(tcu_pce_ov),
         .pce		      	(pce),
         .tcu_array_bypass    	(tcu_array_bypass),
         .rd_en               	(rd_en_array[1]),             
         .wr_en               	(wr_en_array[1]),              
         .tcu_array_wr_inhibit   		(tcu_array_wr_inhibit),          
         .force_hit   		(force_hit_array[1]),          
         .cam_en              	(cam_en_array[1]),    
         .wr_data             	(wr_data1_array[15:0]), //  BS and SR 11/18/03 Reverse Directory change
         .rw_addr             	(rw_addr1_array[5:0]),  //  BS and SR 11/18/03 Reverse Directory change
         .inv_mask            	(inv_mask1_array[7:0]),         
         .l2clk                	(in_clk),
         .rst_warm            	(rst_warm_0_array[1]),            
         .tcu_se_scancollar_in  (tcu_se_scancollar_in));


	assign	 row_hit =  bank1_hit | bank0_hit ;


dcm_panel_cust	panel2(
           // Outputs
           .lkup_hit            (lkup_hit2[63:0]),        
           .rd_data             (rd_data2[15:0]), // BS and SR 11/18/03 Reverse Directory change
           // Inputs
           .tcu_aclk        	(1'b0),
           .tcu_bclk        	(1'b0),
           .tcu_pce_ov          (tcu_pce_ov),
           .pce		      	(pce),
           .tcu_array_bypass    (tcu_array_bypass),
           .rd_en               (rd_en_array[2]),               
           .wr_en               (wr_en_array[2]),               
           .tcu_array_wr_inhibit   		(tcu_array_wr_inhibit),           
           .force_hit   	(force_hit_array[2]),          
           .cam_en              (cam_en_array[2]),              
           .wr_data             (wr_data2_array[15:0]), // BS and SR 11/18/03 Reverse Directory change
           .rw_addr             (rw_addr2_array[5:0]),  // BS and SR 11/18/03 Reverse Directory change
           .inv_mask            (inv_mask2_array[7:0]),         
           .l2clk                (in_clk),
           .rst_warm            (rst_warm_1_array[0]),            
           .tcu_se_scancollar_in(tcu_se_scancollar_in));

	assign	 bank1_hit 	=    lkup_hit2 | lkup_hit3 ;

dcm_panel_cust	panel3(
           // Outputs
           .lkup_hit            (lkup_hit3[63:0]),       
           .rd_data             (rd_data3[15:0]), // BS and SR 11/18/03 Reverse Directory change
           // Inputs
           .tcu_aclk        	(1'b0),
           .tcu_bclk        	(1'b0),
           .tcu_pce_ov          (tcu_pce_ov),
           .pce		      	(pce),
           .tcu_array_bypass    (tcu_array_bypass),
           .rd_en               (rd_en_array[3]),              
           .wr_en               (wr_en_array[3]),              
           .tcu_array_wr_inhibit   		(tcu_array_wr_inhibit),          
           .force_hit   	(force_hit_array[3]),          
           .cam_en              (cam_en_array[3]),             
           .wr_data             (wr_data3_array[15:0]), // BS and SR 11/18/03 Reverse Directory change
           .rw_addr             (rw_addr3_array[5:0]),  // BS and SR 11/18/03 Reverse Directory change
           .inv_mask            (inv_mask3_array[7:0]),        
           .l2clk                (in_clk),
           .rst_warm             (rst_warm_1_array[1]),             
           .tcu_se_scancollar_in (tcu_se_scancollar_in));

// synopsys translate_on

endmodule


////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
// A directory panel is 32 bits wide and 64 entries deep.
// The lkup_hit combines the match lines for an even and odd entry pair
// and hence is only 32 bits wide.
////////////////////////////////////////////////////////////////////////

module dcm_panel_cust (
  rd_en, 
  wr_en, 
  tcu_array_wr_inhibit, 
  cam_en, 
  force_hit, 
  wr_data, 
  rw_addr, 
  inv_mask, 
  l2clk, 
  rst_warm, 
  tcu_se_scancollar_in, 
  tcu_pce_ov, 
  pce, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_array_bypass, 
  lkup_hit, 
  rd_data);
wire ff_valid_scanin;
wire tcu_se_scancollar_in_unused;
wire tcu_pce_ov_unused;
wire pce_unused;
wire ff_valid_scanout_unused;



wire tcu_array_bypass_n;
wire [62:0] ff_valid__so;


// Read inputs
input		rd_en;
input		wr_en;
input		tcu_array_wr_inhibit;
input		cam_en;
input		force_hit;

input	[15:0]	wr_data; // { parity, valid, addr<4>,addr<17:9>, L2 way[3:0]} , BS and SR 11/18/03 Reverse Directory change

// shared inputs 
input	[5:0]	rw_addr; // BS and SR 11/18/03 Reverse Directory change
input	[7:0]	inv_mask;

input		l2clk;
input		rst_warm;
input		tcu_se_scancollar_in;
input           tcu_pce_ov;
input		pce;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_array_bypass; // array bypass for DFT

output  [63:0]  lkup_hit;
output  [15:0]  rd_data; // { valid,parity, addr<17:9>, L2 way<3:0> } , BS and SR 11/18/03 Reverse Directory change

wire    [63:0]  inval_mask_d;
wire    [31:0]  inval_mask_d1;
wire    [15:0]  rd_data_array;
wire    [63:0]  lkup_hit_array;
wire    [63:0]  valid_bit;
wire    [63:0]  valid;
wire	[140:1] mq_l, q, q_l; 

assign ff_valid_scanin = 1'b0;

assign tcu_se_scancollar_in_unused = tcu_se_scancollar_in;
assign tcu_pce_ov_unused = tcu_pce_ov;
assign pce_unused = pce;

cl_mc1_scm_msff_lat_4x	ff_valid_0 ( .si(ff_valid_scanin), .so(ff_valid__so[0]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[0]), .latout(valid_bit[0]), .q(q[77]), .q_l(q_l[77]) );
cl_mc1_scm_msff_lat_4x	ff_valid_1 ( .si(ff_valid__so[0]), .so(ff_valid__so[1]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[1]), .latout(valid_bit[1]), .q(q[78]), .q_l(q_l[78]) );
cl_mc1_scm_msff_lat_4x	ff_valid_2 ( .si(ff_valid__so[1]), .so(ff_valid__so[2]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[2]), .latout(valid_bit[2]), .q(q[79]), .q_l(q_l[79]) );
cl_mc1_scm_msff_lat_4x	ff_valid_3 ( .si(ff_valid__so[2]), .so(ff_valid__so[3]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[3]), .latout(valid_bit[3]), .q(q[80]), .q_l(q_l[80]) );
cl_mc1_scm_msff_lat_4x	ff_valid_4 ( .si(ff_valid__so[3]), .so(ff_valid__so[4]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[4]), .latout(valid_bit[4]), .q(q[81]), .q_l(q_l[81]) );
cl_mc1_scm_msff_lat_4x	ff_valid_5 ( .si(ff_valid__so[4]), .so(ff_valid__so[5]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[5]), .latout(valid_bit[5]), .q(q[82]), .q_l(q_l[82]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_6 ( .si(ff_valid__so[5]), .so(ff_valid__so[6]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[6]), .latout(valid_bit[6]), .q(q[83]), .q_l(q_l[83]) );
cl_mc1_scm_msff_lat_4x	ff_valid_7 ( .si(ff_valid__so[6]), .so(ff_valid__so[7]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[7]), .latout(valid_bit[7]), .q(q[84]), .q_l(q_l[84]) );
cl_mc1_scm_msff_lat_4x	ff_valid_8 ( .si(ff_valid__so[7]), .so(ff_valid__so[8]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[8]), .latout(valid_bit[8]), .q(q[85]), .q_l(q_l[85]) );
cl_mc1_scm_msff_lat_4x	ff_valid_9 ( .si(ff_valid__so[8]), .so(ff_valid__so[9]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[9]), .latout(valid_bit[9]), .q(q[86]), .q_l(q_l[86]) );
cl_mc1_scm_msff_lat_4x	ff_valid_10 ( .si(ff_valid__so[9]), .so(ff_valid__so[10]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[10]), .latout(valid_bit[10]), .q(q[87]), .q_l(q_l[87]) );
cl_mc1_scm_msff_lat_4x	ff_valid_11 ( .si(ff_valid__so[10]), .so(ff_valid__so[11]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[11]), .latout(valid_bit[11]), .q(q[88]), .q_l(q_l[88]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_12 ( .si(ff_valid__so[11]), .so(ff_valid__so[12]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[12]), .latout(valid_bit[12]), .q(q[89]), .q_l(q_l[89]) );
cl_mc1_scm_msff_lat_4x	ff_valid_13 ( .si(ff_valid__so[12]), .so(ff_valid__so[13]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[13]), .latout(valid_bit[13]), .q(q[90]), .q_l(q_l[90]) );
cl_mc1_scm_msff_lat_4x	ff_valid_14 ( .si(ff_valid__so[13]), .so(ff_valid__so[14]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[14]), .latout(valid_bit[14]), .q(q[91]), .q_l(q_l[91]) );
cl_mc1_scm_msff_lat_4x	ff_valid_15 ( .si(ff_valid__so[14]), .so(ff_valid__so[15]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[15]), .latout(valid_bit[15]), .q(q[92]), .q_l(q_l[92]) );
cl_mc1_scm_msff_lat_4x	ff_valid_16 ( .si(ff_valid__so[15]), .so(ff_valid__so[16]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[16]), .latout(valid_bit[16]), .q(q[93]), .q_l(q_l[93]) );
cl_mc1_scm_msff_lat_4x	ff_valid_17 ( .si(ff_valid__so[16]), .so(ff_valid__so[17]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[17]), .latout(valid_bit[17]), .q(q[94]), .q_l(q_l[94]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_18 ( .si(ff_valid__so[17]), .so(ff_valid__so[18]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[18]), .latout(valid_bit[18]), .q(q[95]), .q_l(q_l[95]) );
cl_mc1_scm_msff_lat_4x	ff_valid_19 ( .si(ff_valid__so[18]), .so(ff_valid__so[19]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[19]), .latout(valid_bit[19]), .q(q[96]), .q_l(q_l[96]) );
cl_mc1_scm_msff_lat_4x	ff_valid_20 ( .si(ff_valid__so[19]), .so(ff_valid__so[20]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[20]), .latout(valid_bit[20]), .q(q[97]), .q_l(q_l[97]) );
cl_mc1_scm_msff_lat_4x	ff_valid_21 ( .si(ff_valid__so[20]), .so(ff_valid__so[21]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[21]), .latout(valid_bit[21]), .q(q[98]), .q_l(q_l[98]) );
cl_mc1_scm_msff_lat_4x	ff_valid_22 ( .si(ff_valid__so[21]), .so(ff_valid__so[22]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[22]), .latout(valid_bit[22]), .q(q[99]), .q_l(q_l[99]) );
cl_mc1_scm_msff_lat_4x	ff_valid_23 ( .si(ff_valid__so[22]), .so(ff_valid__so[23]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[23]), .latout(valid_bit[23]), .q(q[100]), .q_l(q_l[100]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_24 ( .si(ff_valid__so[23]), .so(ff_valid__so[24]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[24]), .latout(valid_bit[24]), .q(q[101]), .q_l(q_l[101]) );
cl_mc1_scm_msff_lat_4x	ff_valid_25 ( .si(ff_valid__so[24]), .so(ff_valid__so[25]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[25]), .latout(valid_bit[25]), .q(q[102]), .q_l(q_l[102]) );
cl_mc1_scm_msff_lat_4x	ff_valid_26 ( .si(ff_valid__so[25]), .so(ff_valid__so[26]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[26]), .latout(valid_bit[26]), .q(q[103]), .q_l(q_l[103]) );
cl_mc1_scm_msff_lat_4x	ff_valid_27 ( .si(ff_valid__so[26]), .so(ff_valid__so[27]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[27]), .latout(valid_bit[27]), .q(q[104]), .q_l(q_l[104]) );
cl_mc1_scm_msff_lat_4x	ff_valid_28 ( .si(ff_valid__so[27]), .so(ff_valid__so[28]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[28]), .latout(valid_bit[28]), .q(q[105]), .q_l(q_l[105]) );
cl_mc1_scm_msff_lat_4x	ff_valid_29 ( .si(ff_valid__so[28]), .so(ff_valid__so[29]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[29]), .latout(valid_bit[29]), .q(q[106]), .q_l(q_l[106]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_30 ( .si(ff_valid__so[29]), .so(ff_valid__so[30]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[30]), .latout(valid_bit[30]), .q(q[107]), .q_l(q_l[107]) );
cl_mc1_scm_msff_lat_4x	ff_valid_31 ( .si(ff_valid__so[30]), .so(ff_valid__so[31]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[31]), .latout(valid_bit[31]), .q(q[108]), .q_l(q_l[108]) );
cl_mc1_scm_msff_lat_4x	ff_valid_32 ( .si(ff_valid__so[31]), .so(ff_valid__so[32]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[32]), .latout(valid_bit[32]), .q(q[109]), .q_l(q_l[109]) );
cl_mc1_scm_msff_lat_4x	ff_valid_33 ( .si(ff_valid__so[32]), .so(ff_valid__so[33]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[33]), .latout(valid_bit[33]), .q(q[110]), .q_l(q_l[110]) );
cl_mc1_scm_msff_lat_4x	ff_valid_34 ( .si(ff_valid__so[33]), .so(ff_valid__so[34]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[34]), .latout(valid_bit[34]), .q(q[111]), .q_l(q_l[111]) );
cl_mc1_scm_msff_lat_4x	ff_valid_35 ( .si(ff_valid__so[34]), .so(ff_valid__so[35]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[35]), .latout(valid_bit[35]), .q(q[112]), .q_l(q_l[112]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_36 ( .si(ff_valid__so[35]), .so(ff_valid__so[36]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[36]), .latout(valid_bit[36]), .q(q[113]), .q_l(q_l[113]) );
cl_mc1_scm_msff_lat_4x	ff_valid_37 ( .si(ff_valid__so[36]), .so(ff_valid__so[37]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[37]), .latout(valid_bit[37]), .q(q[114]), .q_l(q_l[114]) );
cl_mc1_scm_msff_lat_4x	ff_valid_38 ( .si(ff_valid__so[37]), .so(ff_valid__so[38]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[38]), .latout(valid_bit[38]), .q(q[115]), .q_l(q_l[115]) );
cl_mc1_scm_msff_lat_4x	ff_valid_39 ( .si(ff_valid__so[38]), .so(ff_valid__so[39]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[39]), .latout(valid_bit[39]), .q(q[116]), .q_l(q_l[116]) );
cl_mc1_scm_msff_lat_4x	ff_valid_40 ( .si(ff_valid__so[39]), .so(ff_valid__so[40]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[40]), .latout(valid_bit[40]), .q(q[117]), .q_l(q_l[117]) );
cl_mc1_scm_msff_lat_4x	ff_valid_41 ( .si(ff_valid__so[40]), .so(ff_valid__so[41]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[41]), .latout(valid_bit[41]), .q(q[118]), .q_l(q_l[118]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_42 ( .si(ff_valid__so[41]), .so(ff_valid__so[42]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[42]), .latout(valid_bit[42]), .q(q[119]), .q_l(q_l[119]) );
cl_mc1_scm_msff_lat_4x	ff_valid_43 ( .si(ff_valid__so[42]), .so(ff_valid__so[43]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[43]), .latout(valid_bit[43]), .q(q[120]), .q_l(q_l[120]) );
cl_mc1_scm_msff_lat_4x	ff_valid_44 ( .si(ff_valid__so[43]), .so(ff_valid__so[44]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[44]), .latout(valid_bit[44]), .q(q[121]), .q_l(q_l[121]) );
cl_mc1_scm_msff_lat_4x	ff_valid_45 ( .si(ff_valid__so[44]), .so(ff_valid__so[45]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[45]), .latout(valid_bit[45]), .q(q[122]), .q_l(q_l[122]) );
cl_mc1_scm_msff_lat_4x	ff_valid_46 ( .si(ff_valid__so[45]), .so(ff_valid__so[46]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[46]), .latout(valid_bit[46]), .q(q[123]), .q_l(q_l[123]) );
cl_mc1_scm_msff_lat_4x	ff_valid_47 ( .si(ff_valid__so[46]), .so(ff_valid__so[47]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[47]), .latout(valid_bit[47]), .q(q[124]), .q_l(q_l[124]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_48 ( .si(ff_valid__so[47]), .so(ff_valid__so[48]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[48]), .latout(valid_bit[48]), .q(q[125]), .q_l(q_l[125]) );
cl_mc1_scm_msff_lat_4x	ff_valid_49 ( .si(ff_valid__so[48]), .so(ff_valid__so[49]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[49]), .latout(valid_bit[49]), .q(q[126]), .q_l(q_l[126]) );
cl_mc1_scm_msff_lat_4x	ff_valid_50 ( .si(ff_valid__so[49]), .so(ff_valid__so[50]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[50]), .latout(valid_bit[50]), .q(q[127]), .q_l(q_l[127]) );
cl_mc1_scm_msff_lat_4x	ff_valid_51 ( .si(ff_valid__so[50]), .so(ff_valid__so[51]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[51]), .latout(valid_bit[51]), .q(q[128]), .q_l(q_l[128]) );
cl_mc1_scm_msff_lat_4x	ff_valid_52 ( .si(ff_valid__so[51]), .so(ff_valid__so[52]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[52]), .latout(valid_bit[52]), .q(q[129]), .q_l(q_l[129]) );
cl_mc1_scm_msff_lat_4x	ff_valid_53 ( .si(ff_valid__so[52]), .so(ff_valid__so[53]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[53]), .latout(valid_bit[53]), .q(q[130]), .q_l(q_l[130]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_54 ( .si(ff_valid__so[53]), .so(ff_valid__so[54]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[54]), .latout(valid_bit[54]), .q(q[131]), .q_l(q_l[131]) );
cl_mc1_scm_msff_lat_4x	ff_valid_55 ( .si(ff_valid__so[54]), .so(ff_valid__so[55]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[55]), .latout(valid_bit[55]), .q(q[132]), .q_l(q_l[132]) );
cl_mc1_scm_msff_lat_4x	ff_valid_56 ( .si(ff_valid__so[55]), .so(ff_valid__so[56]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[56]), .latout(valid_bit[56]), .q(q[133]), .q_l(q_l[133]) );
cl_mc1_scm_msff_lat_4x	ff_valid_57 ( .si(ff_valid__so[56]), .so(ff_valid__so[57]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[57]), .latout(valid_bit[57]), .q(q[134]), .q_l(q_l[134]) );
cl_mc1_scm_msff_lat_4x	ff_valid_58 ( .si(ff_valid__so[57]), .so(ff_valid__so[58]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[58]), .latout(valid_bit[58]), .q(q[135]), .q_l(q_l[135]) );
cl_mc1_scm_msff_lat_4x	ff_valid_59 ( .si(ff_valid__so[58]), .so(ff_valid__so[59]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[59]), .latout(valid_bit[59]), .q(q[136]), .q_l(q_l[136]) ); 
cl_mc1_scm_msff_lat_4x	ff_valid_60 ( .si(ff_valid__so[59]), .so(ff_valid__so[60]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[60]), .latout(valid_bit[60]), .q(q[137]), .q_l(q_l[137]) );
cl_mc1_scm_msff_lat_4x	ff_valid_61 ( .si(ff_valid__so[60]), .so(ff_valid__so[61]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[61]), .latout(valid_bit[61]), .q(q[138]), .q_l(q_l[138]) );
cl_mc1_scm_msff_lat_4x	ff_valid_62 ( .si(ff_valid__so[61]), .so(ff_valid__so[62]), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[62]), .latout(valid_bit[62]), .q(q[139]), .q_l(q_l[139]) );
cl_mc1_scm_msff_lat_4x	ff_valid_63 ( .si(ff_valid__so[62]), .so(ff_valid_scanout_unused), .l1clk(l2clk), .siclk(tcu_aclk), .soclk(tcu_bclk), .d(valid[63]), .latout(valid_bit[63]), .q(q[140]), .q_l(q_l[140]) );


// Inval mask is generated on a per cpu basis.

assign  inval_mask_d1[3:0]   = {4{inv_mask[0]}} ; // BS and SR 11/18/03 Reverse Directory change
assign  inval_mask_d1[7:4]   = {4{inv_mask[1]}} ; // BS and SR 11/18/03 Reverse Directory change
assign  inval_mask_d1[11:8]  = {4{inv_mask[2]}} ; // BS and SR 11/18/03 Reverse Directory change
assign  inval_mask_d1[15:12] = {4{inv_mask[3]}} ; // BS and SR 11/18/03 Reverse Directory change
assign  inval_mask_d1[19:16] = {4{inv_mask[4]}} ; // BS and SR 11/18/03 Reverse Directory change
assign  inval_mask_d1[23:20] = {4{inv_mask[5]}} ; // BS and SR 11/18/03 Reverse Directory change
assign  inval_mask_d1[27:24] = {4{inv_mask[6]}} ; // BS and SR 11/18/03 Reverse Directory change
assign  inval_mask_d1[31:28] = {4{inv_mask[7]}} ; // BS and SR 11/18/03 Reverse Directory change

assign inval_mask_d[63:0] = {inval_mask_d1,inval_mask_d1};


// MEM Array //


dc_panel_array array (
                       .l2clk(l2clk),
//                       .rst_l(rst_l),
                       .wr_en(wr_en),
                       .rd_en(rd_en),
                       .cam_en(cam_en),
                       .rw_addr(rw_addr[5:0]),
                       .wr_data(wr_data[15:0]),
                       .rst_warm(rst_warm),
                       .force_hit(force_hit),
                       .write_disable(tcu_array_wr_inhibit),
                       .inval_mask(inval_mask_d[63:0]),
                       .valid_bit(valid_bit[63:0]),
                       .lkup_hit(lkup_hit[63:0]),
                       .rd_data(rd_data[15:0]),
                       .valid(valid[63:0]),
    		       .bypass(tcu_array_bypass)
                      );

endmodule



//
//  ADDRESS BIT 4 as REGISTER ARRAY
///


module dc_panel_array (
  l2clk, 
  wr_en, 
  rd_en, 
  cam_en, 
  rst_warm, 
  write_disable, 
  force_hit, 
  rw_addr, 
  inval_mask, 
  wr_data, 
  valid_bit, 
  bypass, 
  valid, 
  rd_data, 
  lkup_hit);
wire [12:0] addr_array_0;
wire [12:0] addr_array_1;
wire [12:0] addr_array_2;
wire [12:0] addr_array_3;
wire [12:0] addr_array_4;
wire [12:0] addr_array_5;
wire [12:0] addr_array_6;
wire [12:0] addr_array_7;
wire [12:0] addr_array_8;
wire [12:0] addr_array_9;
wire [12:0] addr_array_10;
wire [12:0] addr_array_11;
wire [12:0] addr_array_12;
wire [12:0] addr_array_13;
wire [12:0] addr_array_14;
wire [12:0] addr_array_15;
wire [12:0] addr_array_16;
wire [12:0] addr_array_17;
wire [12:0] addr_array_18;
wire [12:0] addr_array_19;
wire [12:0] addr_array_20;
wire [12:0] addr_array_21;
wire [12:0] addr_array_22;
wire [12:0] addr_array_23;
wire [12:0] addr_array_24;
wire [12:0] addr_array_25;
wire [12:0] addr_array_26;
wire [12:0] addr_array_27;
wire [12:0] addr_array_28;
wire [12:0] addr_array_29;
wire [12:0] addr_array_30;
wire [12:0] addr_array_31;
wire [12:0] addr_array_32;
wire [12:0] addr_array_33;
wire [12:0] addr_array_34;
wire [12:0] addr_array_35;
wire [12:0] addr_array_36;
wire [12:0] addr_array_37;
wire [12:0] addr_array_38;
wire [12:0] addr_array_39;
wire [12:0] addr_array_40;
wire [12:0] addr_array_41;
wire [12:0] addr_array_42;
wire [12:0] addr_array_43;
wire [12:0] addr_array_44;
wire [12:0] addr_array_45;
wire [12:0] addr_array_46;
wire [12:0] addr_array_47;
wire [12:0] addr_array_48;
wire [12:0] addr_array_49;
wire [12:0] addr_array_50;
wire [12:0] addr_array_51;
wire [12:0] addr_array_52;
wire [12:0] addr_array_53;
wire [12:0] addr_array_54;
wire [12:0] addr_array_55;
wire [12:0] addr_array_56;
wire [12:0] addr_array_57;
wire [12:0] addr_array_58;
wire [12:0] addr_array_59;
wire [12:0] addr_array_60;
wire [12:0] addr_array_61;
wire [12:0] addr_array_62;
wire [12:0] addr_array_63;

input          		l2clk;
input          		wr_en;
input          		rd_en;
input          		cam_en;
input          		rst_warm;
input          		write_disable;
input			force_hit;
input   [5:0]  		rw_addr;
input   [63:0] 		inval_mask;
input   [15:0] 		wr_data;
input   [63:0] 		valid_bit;
input			bypass;
output  [63:0] 		valid;
output  [15:0] 		rd_data;
output  [63:0] 		lkup_hit;


// 
// Registers and wires
//

integer		i,j;

reg	[12:0]	addr_array[63:0]	; //  BS and SR 11/18/03 Reverse Directory change
reg	[63:0]	addr_bit4; //  Restructuring directories
reg	[63:0]	valid	;
reg	[63:0]	parity	;
reg	[15:0]	rd_data; // BS and SR 11/18/03 Reverse Directory change
reg	[63:0]	lkup_hit;
reg	[63:0]	cam_hit;
reg	[63:0]	cam_hit0;
reg	[63:0]	cam_hit1;
reg	[63:0]	new_valid;

`ifndef NOINITMEM
///////////////////////////////////////
// Initialize the cam/arrays.        //
///////////////////////////////////////
integer n;
initial begin
        for (n = 0; n < 64; n = n + 1) begin
                addr_array[n] = {13{1'b0}};
                addr_bit4[n]  =      1'b0;
                valid[n]      =      1'b0;
                parity[n]     =      1'b0;
        end
end
`endif

assign addr_array_0 	= addr_array[0];
assign addr_array_1 	= addr_array[1];
assign addr_array_2 	= addr_array[2];
assign addr_array_3 	= addr_array[3];
assign addr_array_4 	= addr_array[4];
assign addr_array_5 	= addr_array[5];
assign addr_array_6 	= addr_array[6];
assign addr_array_7 	= addr_array[7];
assign addr_array_8 	= addr_array[8];
assign addr_array_9 	= addr_array[9];
assign addr_array_10 	= addr_array[10];
assign addr_array_11 	= addr_array[11];
assign addr_array_12 	= addr_array[12];
assign addr_array_13 	= addr_array[13];
assign addr_array_14 	= addr_array[14];
assign addr_array_15 	= addr_array[15];
assign addr_array_16 	= addr_array[16];
assign addr_array_17 	= addr_array[17];
assign addr_array_18 	= addr_array[18];
assign addr_array_19 	= addr_array[19];
assign addr_array_20 	= addr_array[20];
assign addr_array_21 	= addr_array[21];
assign addr_array_22 	= addr_array[22];
assign addr_array_23 	= addr_array[23];
assign addr_array_24 	= addr_array[24];
assign addr_array_25 	= addr_array[25];
assign addr_array_26 	= addr_array[26];
assign addr_array_27 	= addr_array[27];
assign addr_array_28 	= addr_array[28];
assign addr_array_29 	= addr_array[29];
assign addr_array_30 	= addr_array[30];
assign addr_array_31 	= addr_array[31];

assign addr_array_32    = addr_array[32];
assign addr_array_33    = addr_array[33];
assign addr_array_34    = addr_array[34];
assign addr_array_35    = addr_array[35];
assign addr_array_36    = addr_array[36];
assign addr_array_37    = addr_array[37];
assign addr_array_38    = addr_array[38];
assign addr_array_39    = addr_array[39];
assign addr_array_40    = addr_array[40];
assign addr_array_41    = addr_array[41];
assign addr_array_42    = addr_array[42];
assign addr_array_43    = addr_array[43];
assign addr_array_44    = addr_array[44];
assign addr_array_45    = addr_array[45];
assign addr_array_46    = addr_array[46];
assign addr_array_47    = addr_array[47];
assign addr_array_48    = addr_array[48];
assign addr_array_49    = addr_array[49];
assign addr_array_50    = addr_array[50];
assign addr_array_51    = addr_array[51];
assign addr_array_52    = addr_array[52];
assign addr_array_53    = addr_array[53];
assign addr_array_54    = addr_array[54];
assign addr_array_55    = addr_array[55];
assign addr_array_56    = addr_array[56];
assign addr_array_57    = addr_array[57];
assign addr_array_58    = addr_array[58];
assign addr_array_59    = addr_array[59];
assign addr_array_60    = addr_array[60];
assign addr_array_61    = addr_array[61];
assign addr_array_62    = addr_array[62];
assign addr_array_63    = addr_array[63];


// CAM OPERATION
// PH 1 CAM

always	@( cam_en or inval_mask or wr_data or valid_bit or force_hit or addr_bit4 
or l2clk or bypass or write_disable or rst_warm or
addr_array_0 or addr_array_1 or addr_array_2 or addr_array_3 or addr_array_4 or 
addr_array_5 or addr_array_6 or addr_array_7 or addr_array_8 or addr_array_9 or 
addr_array_10 or addr_array_11 or addr_array_12 or addr_array_13 or addr_array_14 or 
addr_array_15 or addr_array_16 or addr_array_17 or addr_array_18 or addr_array_19 or 
addr_array_20 or addr_array_21 or addr_array_22 or addr_array_23 or addr_array_24 or 
addr_array_25 or addr_array_26 or addr_array_27 or addr_array_28 or addr_array_29 or 
addr_array_30 or addr_array_31 or addr_array_32 or addr_array_33 or addr_array_34 or 
addr_array_35 or addr_array_36 or addr_array_37 or addr_array_38 or addr_array_39 or 
addr_array_40 or addr_array_41 or addr_array_42 or addr_array_43 or addr_array_44 or 
addr_array_45 or addr_array_46 or addr_array_47 or addr_array_48 or addr_array_49 or 
addr_array_50 or addr_array_51 or addr_array_52 or addr_array_53 or addr_array_54 or 
addr_array_55 or addr_array_56 or addr_array_57 or addr_array_58 or addr_array_59 or 
addr_array_60 or addr_array_61 or addr_array_62 or addr_array_63 )

 begin
 	// CAM

        if (bypass)        
	begin
                lkup_hit <= 64'b0; // RACE FIX
        end
	else if(l2clk & rst_warm) 
	begin
		lkup_hit <= 64'b0; // RAACE FIX
	end

	else 
	 if(l2clk & cam_en & ~write_disable) 
          begin



		cam_hit0[0]	=	( wr_data[12:0] == addr_array_0[12:0] );
		cam_hit1[0]	=	(( wr_data[13] == addr_bit4[0] ) | force_hit);
		cam_hit[0]	=	(cam_hit0[0] & cam_hit1[0]) & valid_bit[0];
		new_valid[0]	=	valid_bit[0] & ~( cam_hit[0] & inval_mask[0]);


		cam_hit0[1]	=	( wr_data[12:0] == addr_array_1[12:0] );
		cam_hit1[1]	=	(( wr_data[13] == addr_bit4[1] ) | force_hit);
		cam_hit[1]	=	(cam_hit0[1] & cam_hit1[1]) & valid_bit[1];
		new_valid[1]	=	valid_bit[1] & ~( cam_hit[1] & inval_mask[1]);


		cam_hit0[2]	=	( wr_data[12:0] == addr_array_2[12:0] );
		cam_hit1[2]	=	(( wr_data[13] == addr_bit4[2] ) | force_hit);
		cam_hit[2]	=	(cam_hit0[2] & cam_hit1[2]) & valid_bit[2];
		new_valid[2]	=	valid_bit[2] & ~( cam_hit[2] & inval_mask[2]);


		cam_hit0[3]	=	( wr_data[12:0] == addr_array_3[12:0] );
		cam_hit1[3]	=	(( wr_data[13] == addr_bit4[3] ) | force_hit);
		cam_hit[3]	=	(cam_hit0[3] & cam_hit1[3]) & valid_bit[3];
		new_valid[3]	=	valid_bit[3] & ~( cam_hit[3] & inval_mask[3]);


		cam_hit0[4]	=	( wr_data[12:0] == addr_array_4[12:0] );
		cam_hit1[4]	=	(( wr_data[13] == addr_bit4[4] ) | force_hit);
		cam_hit[4]	=	(cam_hit0[4] & cam_hit1[4]) & valid_bit[4];
		new_valid[4]	=	valid_bit[4] & ~( cam_hit[4] & inval_mask[4]);


		cam_hit0[5]	=	( wr_data[12:0] == addr_array_5[12:0] );
		cam_hit1[5]	=	(( wr_data[13] == addr_bit4[5] ) | force_hit);
		cam_hit[5]	=	(cam_hit0[5] & cam_hit1[5]) & valid_bit[5];
		new_valid[5]	=	valid_bit[5] & ~( cam_hit[5] & inval_mask[5]);


		cam_hit0[6]	=	( wr_data[12:0] == addr_array_6[12:0] );
		cam_hit1[6]	=	(( wr_data[13] == addr_bit4[6] ) | force_hit);
		cam_hit[6]	=	(cam_hit0[6] & cam_hit1[6]) & valid_bit[6];
		new_valid[6]	=	valid_bit[6] & ~( cam_hit[6] & inval_mask[6]);


		cam_hit0[7]	=	( wr_data[12:0] == addr_array_7[12:0] );
		cam_hit1[7]	=	(( wr_data[13] == addr_bit4[7] ) | force_hit);
		cam_hit[7]	=	(cam_hit0[7] & cam_hit1[7]) & valid_bit[7];
		new_valid[7]	=	valid_bit[7] & ~( cam_hit[7] & inval_mask[7]);


		cam_hit0[8]	=	( wr_data[12:0] == addr_array_8[12:0] );
		cam_hit1[8]	=	(( wr_data[13] == addr_bit4[8] ) | force_hit);
		cam_hit[8]	=	(cam_hit0[8] & cam_hit1[8]) & valid_bit[8];
		new_valid[8]	=	valid_bit[8] & ~( cam_hit[8] & inval_mask[8]);


		cam_hit0[9]	=	( wr_data[12:0] == addr_array_9[12:0] );
		cam_hit1[9]	=	(( wr_data[13] == addr_bit4[9] ) | force_hit);
		cam_hit[9]	=	(cam_hit0[9] & cam_hit1[9]) & valid_bit[9];
		new_valid[9]	=	valid_bit[9] & ~( cam_hit[9] & inval_mask[9]);


		cam_hit0[10]	=	( wr_data[12:0] == addr_array_10[12:0] );
		cam_hit1[10]	=	(( wr_data[13] == addr_bit4[10] ) | force_hit);
		cam_hit[10]	=	(cam_hit0[10] & cam_hit1[10]) & valid_bit[10];
		new_valid[10]	=	valid_bit[10] & ~( cam_hit[10] & inval_mask[10]);


		cam_hit0[11]	=	( wr_data[12:0] == addr_array_11[12:0] );
		cam_hit1[11]	=	(( wr_data[13] == addr_bit4[11] ) | force_hit);
		cam_hit[11]	=	(cam_hit0[11] & cam_hit1[11]) & valid_bit[11];
		new_valid[11]	=	valid_bit[11] & ~( cam_hit[11] & inval_mask[11]);


		cam_hit0[12]	=	( wr_data[12:0] == addr_array_12[12:0] );
		cam_hit1[12]	=	(( wr_data[13] == addr_bit4[12] ) | force_hit);
		cam_hit[12]	=	(cam_hit0[12] & cam_hit1[12]) & valid_bit[12];
		new_valid[12]	=	valid_bit[12] & ~( cam_hit[12] & inval_mask[12]);


		cam_hit0[13]	=	( wr_data[12:0] == addr_array_13[12:0] );
		cam_hit1[13]	=	(( wr_data[13] == addr_bit4[13] ) | force_hit);
		cam_hit[13]	=	(cam_hit0[13] & cam_hit1[13]) & valid_bit[13];
		new_valid[13]	=	valid_bit[13] & ~( cam_hit[13] & inval_mask[13]);


		cam_hit0[14]	=	( wr_data[12:0] == addr_array_14[12:0] );
		cam_hit1[14]	=	(( wr_data[13] == addr_bit4[14] ) | force_hit);
		cam_hit[14]	=	(cam_hit0[14] & cam_hit1[14]) & valid_bit[14];
		new_valid[14]	=	valid_bit[14] & ~( cam_hit[14] & inval_mask[14]);


		cam_hit0[15]	=	( wr_data[12:0] == addr_array_15[12:0] );
		cam_hit1[15]	=	(( wr_data[13] == addr_bit4[15] ) | force_hit);
		cam_hit[15]	=	(cam_hit0[15] & cam_hit1[15]) & valid_bit[15];
		new_valid[15]	=	valid_bit[15] & ~( cam_hit[15] & inval_mask[15]);


		cam_hit0[16]	=	( wr_data[12:0] == addr_array_16[12:0] );
		cam_hit1[16]	=	(( wr_data[13] == addr_bit4[16] ) | force_hit);
		cam_hit[16]	=	(cam_hit0[16] & cam_hit1[16]) & valid_bit[16];
		new_valid[16]	=	valid_bit[16] & ~( cam_hit[16] & inval_mask[16]);


		cam_hit0[17]	=	( wr_data[12:0] == addr_array_17[12:0] );
		cam_hit1[17]	=	(( wr_data[13] == addr_bit4[17] ) | force_hit);
		cam_hit[17]	=	(cam_hit0[17] & cam_hit1[17]) & valid_bit[17];
		new_valid[17]	=	valid_bit[17] & ~( cam_hit[17] & inval_mask[17]);


		cam_hit0[18]	=	( wr_data[12:0] == addr_array_18[12:0] );
		cam_hit1[18]	=	(( wr_data[13] == addr_bit4[18] ) | force_hit);
		cam_hit[18]	=	(cam_hit0[18] & cam_hit1[18]) & valid_bit[18];
		new_valid[18]	=	valid_bit[18] & ~( cam_hit[18] & inval_mask[18]);


		cam_hit0[19]	=	( wr_data[12:0] == addr_array_19[12:0] );
		cam_hit1[19]	=	(( wr_data[13] == addr_bit4[19] ) | force_hit);
		cam_hit[19]	=	(cam_hit0[19] & cam_hit1[19]) & valid_bit[19];
		new_valid[19]	=	valid_bit[19] & ~( cam_hit[19] & inval_mask[19]);


		cam_hit0[20]	=	( wr_data[12:0] == addr_array_20[12:0] );
		cam_hit1[20]	=	(( wr_data[13] == addr_bit4[20] ) | force_hit);
		cam_hit[20]	=	(cam_hit0[20] & cam_hit1[20]) & valid_bit[20];
		new_valid[20]	=	valid_bit[20] & ~( cam_hit[20] & inval_mask[20]);


		cam_hit0[21]	=	( wr_data[12:0] == addr_array_21[12:0] );
		cam_hit1[21]	=	(( wr_data[13] == addr_bit4[21] ) | force_hit);
		cam_hit[21]	=	(cam_hit0[21] & cam_hit1[21]) & valid_bit[21];
		new_valid[21]	=	valid_bit[21] & ~( cam_hit[21] & inval_mask[21]);


		cam_hit0[22]	=	( wr_data[12:0] == addr_array_22[12:0] );
		cam_hit1[22]	=	(( wr_data[13] == addr_bit4[22] ) | force_hit);
		cam_hit[22]	=	(cam_hit0[22] & cam_hit1[22]) & valid_bit[22];
		new_valid[22]	=	valid_bit[22] & ~( cam_hit[22] & inval_mask[22]);


		cam_hit0[23]	=	( wr_data[12:0] == addr_array_23[12:0] );
		cam_hit1[23]	=	(( wr_data[13] == addr_bit4[23] ) | force_hit);
		cam_hit[23]	=	(cam_hit0[23] & cam_hit1[23]) & valid_bit[23];
		new_valid[23]	=	valid_bit[23] & ~( cam_hit[23] & inval_mask[23]);


		cam_hit0[24]	=	( wr_data[12:0] == addr_array_24[12:0] );
		cam_hit1[24]	=	(( wr_data[13] == addr_bit4[24] ) | force_hit);
		cam_hit[24]	=	(cam_hit0[24] & cam_hit1[24]) & valid_bit[24];
		new_valid[24]	=	valid_bit[24] & ~( cam_hit[24] & inval_mask[24]);


		cam_hit0[25]	=	( wr_data[12:0] == addr_array_25[12:0] );
		cam_hit1[25]	=	(( wr_data[13] == addr_bit4[25] ) | force_hit);
		cam_hit[25]	=	(cam_hit0[25] & cam_hit1[25]) & valid_bit[25];
		new_valid[25]	=	valid_bit[25] & ~( cam_hit[25] & inval_mask[25]);


		cam_hit0[26]	=	( wr_data[12:0] == addr_array_26[12:0] );
		cam_hit1[26]	=	(( wr_data[13] == addr_bit4[26] ) | force_hit);
		cam_hit[26]	=	(cam_hit0[26] & cam_hit1[26]) & valid_bit[26];
		new_valid[26]	=	valid_bit[26] & ~( cam_hit[26] & inval_mask[26]);


		cam_hit0[27]	=	( wr_data[12:0] == addr_array_27[12:0] );
		cam_hit1[27]	=	(( wr_data[13] == addr_bit4[27] ) | force_hit);
		cam_hit[27]	=	(cam_hit0[27] & cam_hit1[27]) & valid_bit[27];
		new_valid[27]	=	valid_bit[27] & ~( cam_hit[27] & inval_mask[27]);


		cam_hit0[28]	=	( wr_data[12:0] == addr_array_28[12:0] );
		cam_hit1[28]	=	(( wr_data[13] == addr_bit4[28] ) | force_hit);
		cam_hit[28]	=	(cam_hit0[28] & cam_hit1[28]) & valid_bit[28];
		new_valid[28]	=	valid_bit[28] & ~( cam_hit[28] & inval_mask[28]);


		cam_hit0[29]	=	( wr_data[12:0] == addr_array_29[12:0] );
		cam_hit1[29]	=	(( wr_data[13] == addr_bit4[29] ) | force_hit);
		cam_hit[29]	=	(cam_hit0[29] & cam_hit1[29]) & valid_bit[29];
		new_valid[29]	=	valid_bit[29] & ~( cam_hit[29] & inval_mask[29]);


		cam_hit0[30]	=	( wr_data[12:0] == addr_array_30[12:0] );
		cam_hit1[30]	=	(( wr_data[13] == addr_bit4[30] ) | force_hit);
		cam_hit[30]	=	(cam_hit0[30] & cam_hit1[30]) & valid_bit[30];
		new_valid[30]	=	valid_bit[30] & ~( cam_hit[30] & inval_mask[30]);


		cam_hit0[31]	=	( wr_data[12:0] == addr_array_31[12:0] );
		cam_hit1[31]	=	(( wr_data[13] == addr_bit4[31] ) | force_hit);
		cam_hit[31]	=	(cam_hit0[31] & cam_hit1[31]) & valid_bit[31];
		new_valid[31]	=	valid_bit[31] & ~( cam_hit[31] & inval_mask[31]);


		cam_hit0[32]	=	( wr_data[12:0] == addr_array_32[12:0] );
		cam_hit1[32]	=	(( wr_data[13] == addr_bit4[32] ) | force_hit);
		cam_hit[32]	=	(cam_hit0[32] & cam_hit1[32]) & valid_bit[32];
		new_valid[32]	=	valid_bit[32] & ~( cam_hit[32] & inval_mask[32]);


		cam_hit0[33]	=	( wr_data[12:0] == addr_array_33[12:0] );
		cam_hit1[33]	=	(( wr_data[13] == addr_bit4[33] ) | force_hit);
		cam_hit[33]	=	(cam_hit0[33] & cam_hit1[33]) & valid_bit[33];
		new_valid[33]	=	valid_bit[33] & ~( cam_hit[33] & inval_mask[33]);


		cam_hit0[34]	=	( wr_data[12:0] == addr_array_34[12:0] );
		cam_hit1[34]	=	(( wr_data[13] == addr_bit4[34] ) | force_hit);
		cam_hit[34]	=	(cam_hit0[34] & cam_hit1[34]) & valid_bit[34];
		new_valid[34]	=	valid_bit[34] & ~( cam_hit[34] & inval_mask[34]);


		cam_hit0[35]	=	( wr_data[12:0] == addr_array_35[12:0] );
		cam_hit1[35]	=	(( wr_data[13] == addr_bit4[35] ) | force_hit);
		cam_hit[35]	=	(cam_hit0[35] & cam_hit1[35]) & valid_bit[35];
		new_valid[35]	=	valid_bit[35] & ~( cam_hit[35] & inval_mask[35]);


		cam_hit0[36]	=	( wr_data[12:0] == addr_array_36[12:0] );
		cam_hit1[36]	=	(( wr_data[13] == addr_bit4[36] ) | force_hit);
		cam_hit[36]	=	(cam_hit0[36] & cam_hit1[36]) & valid_bit[36];
		new_valid[36]	=	valid_bit[36] & ~( cam_hit[36] & inval_mask[36]);


		cam_hit0[37]	=	( wr_data[12:0] == addr_array_37[12:0] );
		cam_hit1[37]	=	(( wr_data[13] == addr_bit4[37] ) | force_hit);
		cam_hit[37]	=	(cam_hit0[37] & cam_hit1[37]) & valid_bit[37];
		new_valid[37]	=	valid_bit[37] & ~( cam_hit[37] & inval_mask[37]);


		cam_hit0[38]	=	( wr_data[12:0] == addr_array_38[12:0] );
		cam_hit1[38]	=	(( wr_data[13] == addr_bit4[38] ) | force_hit);
		cam_hit[38]	=	(cam_hit0[38] & cam_hit1[38]) & valid_bit[38];
		new_valid[38]	=	valid_bit[38] & ~( cam_hit[38] & inval_mask[38]);


		cam_hit0[39]	=	( wr_data[12:0] == addr_array_39[12:0] );
		cam_hit1[39]	=	(( wr_data[13] == addr_bit4[39] ) | force_hit);
		cam_hit[39]	=	(cam_hit0[39] & cam_hit1[39]) & valid_bit[39];
		new_valid[39]	=	valid_bit[39] & ~( cam_hit[39] & inval_mask[39]);


		cam_hit0[40]	=	( wr_data[12:0] == addr_array_40[12:0] );
		cam_hit1[40]	=	(( wr_data[13] == addr_bit4[40] ) | force_hit);
		cam_hit[40]	=	(cam_hit0[40] & cam_hit1[40]) & valid_bit[40];
		new_valid[40]	=	valid_bit[40] & ~( cam_hit[40] & inval_mask[40]);


		cam_hit0[41]	=	( wr_data[12:0] == addr_array_41[12:0] );
		cam_hit1[41]	=	(( wr_data[13] == addr_bit4[41] ) | force_hit);
		cam_hit[41]	=	(cam_hit0[41] & cam_hit1[41]) & valid_bit[41];
		new_valid[41]	=	valid_bit[41] & ~( cam_hit[41] & inval_mask[41]);


		cam_hit0[42]	=	( wr_data[12:0] == addr_array_42[12:0] );
		cam_hit1[42]	=	(( wr_data[13] == addr_bit4[42] ) | force_hit);
		cam_hit[42]	=	(cam_hit0[42] & cam_hit1[42]) & valid_bit[42];
		new_valid[42]	=	valid_bit[42] & ~( cam_hit[42] & inval_mask[42]);


		cam_hit0[43]	=	( wr_data[12:0] == addr_array_43[12:0] );
		cam_hit1[43]	=	(( wr_data[13] == addr_bit4[43] ) | force_hit);
		cam_hit[43]	=	(cam_hit0[43] & cam_hit1[43]) & valid_bit[43];
		new_valid[43]	=	valid_bit[43] & ~( cam_hit[43] & inval_mask[43]);


		cam_hit0[44]	=	( wr_data[12:0] == addr_array_44[12:0] );
		cam_hit1[44]	=	(( wr_data[13] == addr_bit4[44] ) | force_hit);
		cam_hit[44]	=	(cam_hit0[44] & cam_hit1[44]) & valid_bit[44];
		new_valid[44]	=	valid_bit[44] & ~( cam_hit[44] & inval_mask[44]);


		cam_hit0[45]	=	( wr_data[12:0] == addr_array_45[12:0] );
		cam_hit1[45]	=	(( wr_data[13] == addr_bit4[45] ) | force_hit);
		cam_hit[45]	=	(cam_hit0[45] & cam_hit1[45]) & valid_bit[45];
		new_valid[45]	=	valid_bit[45] & ~( cam_hit[45] & inval_mask[45]);


		cam_hit0[46]	=	( wr_data[12:0] == addr_array_46[12:0] );
		cam_hit1[46]	=	(( wr_data[13] == addr_bit4[46] ) | force_hit);
		cam_hit[46]	=	(cam_hit0[46] & cam_hit1[46]) & valid_bit[46];
		new_valid[46]	=	valid_bit[46] & ~( cam_hit[46] & inval_mask[46]);


		cam_hit0[47]	=	( wr_data[12:0] == addr_array_47[12:0] );
		cam_hit1[47]	=	(( wr_data[13] == addr_bit4[47] ) | force_hit);
		cam_hit[47]	=	(cam_hit0[47] & cam_hit1[47]) & valid_bit[47];
		new_valid[47]	=	valid_bit[47] & ~( cam_hit[47] & inval_mask[47]);


		cam_hit0[48]	=	( wr_data[12:0] == addr_array_48[12:0] );
		cam_hit1[48]	=	(( wr_data[13] == addr_bit4[48] ) | force_hit);
		cam_hit[48]	=	(cam_hit0[48] & cam_hit1[48]) & valid_bit[48];
		new_valid[48]	=	valid_bit[48] & ~( cam_hit[48] & inval_mask[48]);


		cam_hit0[49]	=	( wr_data[12:0] == addr_array_49[12:0] );
		cam_hit1[49]	=	(( wr_data[13] == addr_bit4[49] ) | force_hit);
		cam_hit[49]	=	(cam_hit0[49] & cam_hit1[49]) & valid_bit[49];
		new_valid[49]	=	valid_bit[49] & ~( cam_hit[49] & inval_mask[49]);


		cam_hit0[50]	=	( wr_data[12:0] == addr_array_50[12:0] );
		cam_hit1[50]	=	(( wr_data[13] == addr_bit4[50] ) | force_hit);
		cam_hit[50]	=	(cam_hit0[50] & cam_hit1[50]) & valid_bit[50];
		new_valid[50]	=	valid_bit[50] & ~( cam_hit[50] & inval_mask[50]);


		cam_hit0[51]	=	( wr_data[12:0] == addr_array_51[12:0] );
		cam_hit1[51]	=	(( wr_data[13] == addr_bit4[51] ) | force_hit);
		cam_hit[51]	=	(cam_hit0[51] & cam_hit1[51]) & valid_bit[51];
		new_valid[51]	=	valid_bit[51] & ~( cam_hit[51] & inval_mask[51]);


		cam_hit0[52]	=	( wr_data[12:0] == addr_array_52[12:0] );
		cam_hit1[52]	=	(( wr_data[13] == addr_bit4[52] ) | force_hit);
		cam_hit[52]	=	(cam_hit0[52] & cam_hit1[52]) & valid_bit[52];
		new_valid[52]	=	valid_bit[52] & ~( cam_hit[52] & inval_mask[52]);


		cam_hit0[53]	=	( wr_data[12:0] == addr_array_53[12:0] );
		cam_hit1[53]	=	(( wr_data[13] == addr_bit4[53] ) | force_hit);
		cam_hit[53]	=	(cam_hit0[53] & cam_hit1[53]) & valid_bit[53];
		new_valid[53]	=	valid_bit[53] & ~( cam_hit[53] & inval_mask[53]);


		cam_hit0[54]	=	( wr_data[12:0] == addr_array_54[12:0] );
		cam_hit1[54]	=	(( wr_data[13] == addr_bit4[54] ) | force_hit);
		cam_hit[54]	=	(cam_hit0[54] & cam_hit1[54]) & valid_bit[54];
		new_valid[54]	=	valid_bit[54] & ~( cam_hit[54] & inval_mask[54]);


		cam_hit0[55]	=	( wr_data[12:0] == addr_array_55[12:0] );
		cam_hit1[55]	=	(( wr_data[13] == addr_bit4[55] ) | force_hit);
		cam_hit[55]	=	(cam_hit0[55] & cam_hit1[55]) & valid_bit[55];
		new_valid[55]	=	valid_bit[55] & ~( cam_hit[55] & inval_mask[55]);


		cam_hit0[56]	=	( wr_data[12:0] == addr_array_56[12:0] );
		cam_hit1[56]	=	(( wr_data[13] == addr_bit4[56] ) | force_hit);
		cam_hit[56]	=	(cam_hit0[56] & cam_hit1[56]) & valid_bit[56];
		new_valid[56]	=	valid_bit[56] & ~( cam_hit[56] & inval_mask[56]);


		cam_hit0[57]	=	( wr_data[12:0] == addr_array_57[12:0] );
		cam_hit1[57]	=	(( wr_data[13] == addr_bit4[57] ) | force_hit);
		cam_hit[57]	=	(cam_hit0[57] & cam_hit1[57]) & valid_bit[57];
		new_valid[57]	=	valid_bit[57] & ~( cam_hit[57] & inval_mask[57]);


		cam_hit0[58]	=	( wr_data[12:0] == addr_array_58[12:0] );
		cam_hit1[58]	=	(( wr_data[13] == addr_bit4[58] ) | force_hit);
		cam_hit[58]	=	(cam_hit0[58] & cam_hit1[58]) & valid_bit[58];
		new_valid[58]	=	valid_bit[58] & ~( cam_hit[58] & inval_mask[58]);


		cam_hit0[59]	=	( wr_data[12:0] == addr_array_59[12:0] );
		cam_hit1[59]	=	(( wr_data[13] == addr_bit4[59] ) | force_hit);
		cam_hit[59]	=	(cam_hit0[59] & cam_hit1[59]) & valid_bit[59];
		new_valid[59]	=	valid_bit[59] & ~( cam_hit[59] & inval_mask[59]);


		cam_hit0[60]	=	( wr_data[12:0] == addr_array_60[12:0] );
		cam_hit1[60]	=	(( wr_data[13] == addr_bit4[60] ) | force_hit);
		cam_hit[60]	=	(cam_hit0[60] & cam_hit1[60]) & valid_bit[60];
		new_valid[60]	=	valid_bit[60] & ~( cam_hit[60] & inval_mask[60]);


		cam_hit0[61]	=	( wr_data[12:0] == addr_array_61[12:0] );
		cam_hit1[61]	=	(( wr_data[13] == addr_bit4[61] ) | force_hit);
		cam_hit[61]	=	(cam_hit0[61] & cam_hit1[61]) & valid_bit[61];
		new_valid[61]	=	valid_bit[61] & ~( cam_hit[61] & inval_mask[61]);


		cam_hit0[62]	=	( wr_data[12:0] == addr_array_62[12:0] );
		cam_hit1[62]	=	(( wr_data[13] == addr_bit4[62] ) | force_hit);
		cam_hit[62]	=	(cam_hit0[62] & cam_hit1[62]) & valid_bit[62];
		new_valid[62]	=	valid_bit[62] & ~( cam_hit[62] & inval_mask[62]);


		cam_hit0[63]	=	( wr_data[12:0] == addr_array_63[12:0] );
		cam_hit1[63]	=	(( wr_data[13] == addr_bit4[63] ) | force_hit);
		cam_hit[63]	=	(cam_hit0[63] & cam_hit1[63]) & valid_bit[63];
		new_valid[63]	=	valid_bit[63] & ~( cam_hit[63] & inval_mask[63]);



		lkup_hit <= cam_hit; // RACE FIX


	end

	else if(l2clk)
	begin	
			lkup_hit <= 64'b0; // RACE FIX
			new_valid <= valid_bit;
	end

end


////////////////////////////////////////////////////////////
// READ/WRITE  OPERATION
// Phase 1 RD
////////////////////////////////////////////////////////////

//initial 
//begin
//       addr_bit4 = 64'b0;
//end

always @(l2clk or write_disable or rd_en or wr_en or cam_en or bypass or valid or rst_warm or wr_data )
begin
	if (bypass)        
		rd_data[15:0] <= wr_data[15:0];
	else if ((rst_warm & ~write_disable)) 
	begin
		rd_data[15:0] <= 16'b0;
		valid[63:0] <= 64'b0;
	end
	else if ((rst_warm & write_disable)) 
	begin
		rd_data[15:0] <= 16'b0;
	end
	if(l2clk & rd_en & ~write_disable & ~bypass & ~rst_warm) // RD
	begin
		if(wr_en) 
		begin
			rd_data <= 16'bx;
// should put in <fire -active wr_en -message "L2_DIR_ERR: read and write conflict"
		end
		else
		begin
			rd_data <= { valid[rw_addr], parity[rw_addr], addr_bit4[rw_addr], addr_array[rw_addr] };
		end	
	end // of if rd_en

	if(l2clk & wr_en & ~write_disable & ~bypass & ~rst_warm & ~cam_en) // WR 
	begin
		if(rd_en) // RESET
		begin
			rd_data <= 16'bx; 
			addr_array[rw_addr] <=  13'bx;
			addr_bit4[rw_addr]  <=  1'bx;
			parity[rw_addr]  <=  1'bx;
        		valid[rw_addr]  <=  1'bx;
		end
		else
		begin
	        	addr_array[rw_addr] <=  wr_data[12:0] ; // BS and SR 11/18/03 Reverse Directory change
	        	addr_bit4[rw_addr]  <=  wr_data[13] ; // BS and SR 11/18/03 Reverse Directory change
	        	parity[rw_addr]  <=  wr_data[14] ; // BS and SR 11/18/03 Reverse Directory change
	        	valid[rw_addr]  <=  wr_data[15] ; // BS and SR 11/18/03 Reverse Directory change
// should put in <fire -active cam_en -message "L2_DIR_ERR : cam/wr conflict"
		end
	end
//        if(~l2clk & cam_en & ~write_disable) // CAM 
        if(~l2clk & ~write_disable) // CAM 
	begin
		if (lkup_hit[0])  valid[0]  <= new_valid[0];
		if (lkup_hit[1])  valid[1]  <= new_valid[1];
		if (lkup_hit[2])  valid[2]  <= new_valid[2];
		if (lkup_hit[3])  valid[3]  <= new_valid[3];
		if (lkup_hit[4])  valid[4]  <= new_valid[4];
		if (lkup_hit[5])  valid[5]  <= new_valid[5];
		if (lkup_hit[6])  valid[6]  <= new_valid[6];
		if (lkup_hit[7])  valid[7]  <= new_valid[7];
		if (lkup_hit[8])  valid[8]  <= new_valid[8];
		if (lkup_hit[9])  valid[9]  <= new_valid[9];
		if (lkup_hit[10]) valid[10] <= new_valid[10];
		if (lkup_hit[11]) valid[11] <= new_valid[11];
		if (lkup_hit[12]) valid[12] <= new_valid[12];
		if (lkup_hit[13]) valid[13] <= new_valid[13];
		if (lkup_hit[14]) valid[14] <= new_valid[14];
		if (lkup_hit[15]) valid[15] <= new_valid[15];
		if (lkup_hit[16]) valid[16] <= new_valid[16];
		if (lkup_hit[17]) valid[17] <= new_valid[17];
		if (lkup_hit[18]) valid[18] <= new_valid[18];
		if (lkup_hit[19]) valid[19] <= new_valid[19];
		if (lkup_hit[20]) valid[20] <= new_valid[20];
		if (lkup_hit[21]) valid[21] <= new_valid[21];
		if (lkup_hit[22]) valid[22] <= new_valid[22];
		if (lkup_hit[23]) valid[23] <= new_valid[23];
		if (lkup_hit[24]) valid[24] <= new_valid[24];
		if (lkup_hit[25]) valid[25] <= new_valid[25];
		if (lkup_hit[26]) valid[26] <= new_valid[26];
		if (lkup_hit[27]) valid[27] <= new_valid[27];
		if (lkup_hit[28]) valid[28] <= new_valid[28];
		if (lkup_hit[29]) valid[29] <= new_valid[29];
		if (lkup_hit[30]) valid[30] <= new_valid[30];
		if (lkup_hit[31]) valid[31] <= new_valid[31];
		if (lkup_hit[32]) valid[32] <= new_valid[32];
		if (lkup_hit[33]) valid[33] <= new_valid[33];
		if (lkup_hit[34]) valid[34] <= new_valid[34];
		if (lkup_hit[35]) valid[35] <= new_valid[35];
		if (lkup_hit[36]) valid[36] <= new_valid[36];
		if (lkup_hit[37]) valid[37] <= new_valid[37];
		if (lkup_hit[38]) valid[38] <= new_valid[38];
		if (lkup_hit[39]) valid[39] <= new_valid[39];
		if (lkup_hit[40]) valid[40] <= new_valid[40];
		if (lkup_hit[41]) valid[41] <= new_valid[41];
		if (lkup_hit[42]) valid[42] <= new_valid[42];
		if (lkup_hit[43]) valid[43] <= new_valid[43];
		if (lkup_hit[44]) valid[44] <= new_valid[44];
		if (lkup_hit[45]) valid[45] <= new_valid[45];
		if (lkup_hit[46]) valid[46] <= new_valid[46];
		if (lkup_hit[47]) valid[47] <= new_valid[47];
		if (lkup_hit[48]) valid[48] <= new_valid[48];
		if (lkup_hit[49]) valid[49] <= new_valid[49];
		if (lkup_hit[50]) valid[50] <= new_valid[50];
		if (lkup_hit[51]) valid[51] <= new_valid[51];
		if (lkup_hit[52]) valid[52] <= new_valid[52];
		if (lkup_hit[53]) valid[53] <= new_valid[53];
		if (lkup_hit[54]) valid[54] <= new_valid[54];
		if (lkup_hit[55]) valid[55] <= new_valid[55];
		if (lkup_hit[56]) valid[56] <= new_valid[56];
		if (lkup_hit[57]) valid[57] <= new_valid[57];
		if (lkup_hit[58]) valid[58] <= new_valid[58];
		if (lkup_hit[59]) valid[59] <= new_valid[59];
		if (lkup_hit[60]) valid[60] <= new_valid[60];
		if (lkup_hit[61]) valid[61] <= new_valid[61];
		if (lkup_hit[62]) valid[62] <= new_valid[62];
		if (lkup_hit[63]) valid[63] <= new_valid[63];
	end
end

endmodule

