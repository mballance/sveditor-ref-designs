// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_com_cm_8x40_cust.v
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
module n2_com_cm_8x40_cust (
  adr_w, 
  din, 
  write_en, 
  tcu_array_wr_inhibit, 
  adr_r, 
  read_en, 
  lookup_en, 
  key, 
  l2clk, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  scan_in, 
  tcu_pce_ov, 
  pce, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  tcu_array_bypass, 
  dout, 
  match, 
  match_idx, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire stop;
wire pce_ov;
wire l1clk_mat;
wire [73:0] xx0_unused;
wire [73:0] xx_unused;
wire [39:0] din_d1;
wire mb_ren_d1;
wire mb_wen_d1;
wire [7:0] adr_r_d1;
wire [7:0] adr_w_d1;
 

input   [7:0]  adr_w ; // set up to +ve edge
input   [39:0] din;    // set up to +ve edge
input          write_en;       // +ve edge clk; write enable
input	       tcu_array_wr_inhibit;
input   [7:0]  adr_r;  // set up to +ve edge
input          read_en;
input          lookup_en;      // set up to -ve edge
input   [39:7] key;    // set up to -ve edge
input          l2clk;
input          tcu_se_scancollar_in;
input          tcu_se_scancollar_out;
input          scan_in;
input          tcu_pce_ov;
input          pce;
input          tcu_aclk;
input          tcu_bclk;
input	       tcu_scan_en;
input	       tcu_clk_stop;
input          tcu_array_bypass; // array bypass for DFT


output  [39:0] dout;
output  [7:0]  match;
output  [7:0]  match_idx;
output         scan_out ;

// JDL 05/17/07
// synopsys translate_off

wire    [7:0]  match_p_array;
wire    [7:0]  match_idx_p_array;
wire    [39:0] dout_array;

// scan chain connections ////
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;

//0in kndr -var adr_w[7:0] -active write_en
//0in kndr -var adr_r[7:0] -active read_en
//0in one_hot -var adr_r[7:0] -active (|adr_r & read_en) -group mbist_mode
//0in one_hot -var adr_w[7:0] -active (|adr_w & write_en) -group mbist_mode

//// Input Flops /////
//
//
//inv_macro tcu_array_bypass_inv (width = 1) 
//	(
//        .dout(tcu_array_bypass_n),
//        .din(tcu_array_bypass)
//        );
//
//
////msff_ctl_macro ff_tcu_array_wr_inhibit (width = 1) 
//	( // not a real flop. ONly used as a trigger
//        .scan_in(ff_tcu_array_wr_inhibit_scanin),
//        .scan_out(ff_tcu_array_wr_inhibit_scanout),
//        .l1clk(l1clk),
//        .din(tcu_array_wr_inhibit),
//        .dout(tcu_array_wr_inhibit_d1)
//        );

wire l1clk_in;
wire l1clk_out;
wire l1clk_en;
wire [73:0] so;

n2_com_cm_8x40_cust_l1clkhdr_ctl_macro      collar_in
         (
         .l2clk  (l2clk  ),
         .l1en   (pce   ),
         .pce_ov (pce_ov ),
         .stop   (stop   ),
         .se     (tcu_se_scancollar_in),
         .l1clk  (l1clk_in  )
         );
n2_com_cm_8x40_cust_l1clkhdr_ctl_macro      collar_out
         (
         .l2clk  (l2clk  ),
         .l1en   (pce   ),
         .pce_ov (pce_ov ),
         .stop   (stop   ),
         .se     (tcu_se_scancollar_out),
         .l1clk  (l1clk_out  )
         );
n2_com_cm_8x40_cust_l1clkhdr_ctl_macro      scan_en
         (
         .l2clk  (l2clk  ),
         .l1en   (pce   ),
         .pce_ov (pce_ov ),
         .stop   (stop   ),
         .se     (se),
         .l1clk  (l1clk_en  )
         );
n2_com_cm_8x40_cust_l1clkhdr_ctl_macro      mat
         (
         .l2clk  (l2clk  ),
         .l1en   (pce   ),
         .pce_ov (pce_ov ),
         .stop   (stop   ),
         .se     (1'b0),
         .l1clk  (l1clk_mat  )
         );

n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx0  (.scan_in(scan_in), .scan_out(so[0]),  .l1clk(l1clk_in), .d(din[0]),  .latout(xx0_unused[0]), .q_l(xx_unused[0]), .q(din_d1[0]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx1  (.scan_in(so[0]),   .scan_out(so[1]),  .l1clk(l1clk_in), .d(din[1]),  .latout(xx0_unused[1]), .q_l(xx_unused[1]), .q(din_d1[1]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx2  (.scan_in(so[1]),   .scan_out(so[2]),  .l1clk(l1clk_in), .d(din[2]),  .latout(xx0_unused[2]), .q_l(xx_unused[2]), .q(din_d1[2]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx3  (.scan_in(so[2]),   .scan_out(so[3]),  .l1clk(l1clk_in), .d(din[3]),  .latout(xx0_unused[3]), .q_l(xx_unused[3]), .q(din_d1[3]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx4  (.scan_in(so[3]),   .scan_out(so[4]),  .l1clk(l1clk_in), .d(din[4]),  .latout(xx0_unused[4]), .q_l(xx_unused[4]), .q(din_d1[4]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx5  (.scan_in(so[4]),   .scan_out(so[5]),  .l1clk(l1clk_in), .d(din[5]),  .latout(xx0_unused[5]), .q_l(xx_unused[5]), .q(din_d1[5]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx6  (.scan_in(so[5]),   .scan_out(so[6]),  .l1clk(l1clk_in), .d(din[6]),  .latout(xx0_unused[6]), .q_l(xx_unused[6]), .q(din_d1[6]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx7  (.scan_in(so[6]),   .scan_out(so[7]),  .l1clk(l1clk_in), .d(din[9]),  .latout(xx0_unused[7]), .q_l(xx_unused[7]), .q(din_d1[9]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx8  (.scan_in(so[7]),   .scan_out(so[8]),  .l1clk(l1clk_in), .d(din[10]), .latout(xx0_unused[8]), .q_l(xx_unused[8]), .q(din_d1[10]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx9  (.scan_in(so[8]),   .scan_out(so[9]),  .l1clk(l1clk_in), .d(din[11]), .latout(xx0_unused[9]), .q_l(xx_unused[9]), .q(din_d1[11]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx10  (.scan_in(so[9]),  .scan_out(so[10]), .l1clk(l1clk_in), .d(din[12]), .latout(xx0_unused[10]), .q_l(xx_unused[10]), .q(din_d1[12]),
  .siclk(siclk),
  .soclk(soclk));

n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx11  (.scan_in(so[10]), .scan_out(so[11]), .l1clk(l1clk_out), .d(match_idx_p_array[4]), .q(match_idx[4]), .q_l(xx_unused[11]), .latout(xx0_unused[11]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx12  (.scan_in(so[11]), .scan_out(so[12]), .l1clk(l1clk_out), .d(match_idx_p_array[5]), .q(match_idx[5]), .q_l(xx_unused[12]), .latout(xx0_unused[12]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx13  (.scan_in(so[12]), .scan_out(so[13]), .l1clk(l1clk_out), .d(match_idx_p_array[6]), .q(match_idx[6]), .q_l(xx_unused[13]), .latout(xx0_unused[13]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx14  (.scan_in(so[13]), .scan_out(so[14]), .l1clk(l1clk_out), .d(match_idx_p_array[7]), .q(match_idx[7]), .q_l(xx_unused[14]), .latout(xx0_unused[14]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx15  (.scan_in(so[14]), .scan_out(so[15]), .l1clk(l1clk_in),  .d(din[13]), .latout(xx0_unused[15]), .q_l(xx_unused[15]), .q(din_d1[13]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx16  (.scan_in(so[15]), .scan_out(so[16]), .l1clk(l1clk_in),  .d(din[14]), .latout(xx0_unused[16]), .q_l(xx_unused[16]), .q(din_d1[14]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx17  (.scan_in(so[16]), .scan_out(so[17]), .l1clk(l1clk_in),  .d(din[15]), .latout(xx0_unused[17]), .q_l(xx_unused[17]), .q(din_d1[15]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx18  (.scan_in(so[17]), .scan_out(so[18]), .l1clk(l1clk_in),  .d(din[16]), .latout(xx0_unused[18]), .q_l(xx_unused[18]), .q(din_d1[16]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx19  (.scan_in(so[18]), .scan_out(so[19]), .l1clk(l1clk_in),  .d(din[17]), .latout(xx0_unused[19]), .q_l(xx_unused[19]), .q(din_d1[17]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx20  (.scan_in(so[19]), .scan_out(so[20]), .l1clk(l1clk_in),  .d(din[7]),  .latout(xx0_unused[20]), .q_l(xx_unused[20]), .q(din_d1[7]),
  .siclk(siclk),
  .soclk(soclk));

n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx21  (.scan_in(so[20]), .scan_out(so[21]), .l1clk(l1clk_in),  .d(din[8]),  .latout(xx0_unused[21]), .q_l(xx_unused[21]), .q(din_d1[8]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx22  (.scan_in(so[21]), .scan_out(so[22]), .l1clk(l1clk_in),  .d(din[18]), .latout(xx0_unused[22]), .q_l(xx_unused[22]), .q(din_d1[18]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx23  (.scan_in(so[22]), .scan_out(so[23]), .l1clk(l1clk_in),  .d(din[19]), .latout(xx0_unused[23]), .q_l(xx_unused[23]), .q(din_d1[19]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx24  (.scan_in(so[23]), .scan_out(so[24]), .l1clk(l1clk_out), .d(match_idx_p_array[0]), .q(match_idx[0]), .q_l(xx_unused[24]), .latout(xx0_unused[24]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx25  (.scan_in(so[24]), .scan_out(so[25]), .l1clk(l1clk_out), .d(match_idx_p_array[1]), .q(match_idx[1]), .q_l(xx_unused[25]), .latout(xx0_unused[25]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx26  (.scan_in(so[25]), .scan_out(so[26]), .l1clk(l1clk_out), .d(match_idx_p_array[2]), .q(match_idx[2]), .q_l(xx_unused[26]), .latout(xx0_unused[26]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx27  (.scan_in(so[26]), .scan_out(so[27]), .l1clk(l1clk_out), .d(match_idx_p_array[3]), .q(match_idx[3]), .q_l(xx_unused[27]), .latout(xx0_unused[27]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx28  (.scan_in(so[27]), .scan_out(so[28]), .l1clk(l1clk_in), .d(din[20]), .latout(xx0_unused[28]), .q_l(xx_unused[28]), .q(din_d1[20]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx29  (.scan_in(so[28]), .scan_out(so[29]), .l1clk(l1clk_in), .d(din[21]), .latout(xx0_unused[29]), .q_l(xx_unused[29]), .q(din_d1[21]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx30  (.scan_in(so[29]), .scan_out(so[30]), .l1clk(l1clk_in), .d(din[22]), .latout(xx0_unused[30]), .q_l(xx_unused[30]), .q(din_d1[22]),
  .siclk(siclk),
  .soclk(soclk));

n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx31  (.scan_in(so[30]), .scan_out(so[31]), .l1clk(l1clk_in), .d(din[23]), .latout(xx0_unused[31]), .q_l(xx_unused[31]), .q(din_d1[23]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx32  (.scan_in(so[31]), .scan_out(so[32]), .l1clk(l1clk_out), .d(match_p_array[4]), .q(match[4]), .q_l(xx_unused[32]), .latout(xx0_unused[32]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx33  (.scan_in(so[32]), .scan_out(so[33]), .l1clk(l1clk_out), .d(match_p_array[5]), .q(match[5]), .q_l(xx_unused[33]), .latout(xx0_unused[33]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx34  (.scan_in(so[33]), .scan_out(so[34]), .l1clk(l1clk_out), .d(match_p_array[6]), .q(match[6]), .q_l(xx_unused[34]), .latout(xx0_unused[34]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx35  (.scan_in(so[34]), .scan_out(so[35]), .l1clk(l1clk_out), .d(match_p_array[7]), .q(match[7]), .q_l(xx_unused[35]), .latout(xx0_unused[35]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx36  (.scan_in(so[35]), .scan_out(so[36]), .l1clk(l1clk_in), .d(din[24]), .latout(xx0_unused[36]), .q_l(xx_unused[36]), .q(din_d1[24]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx37  (.scan_in(so[36]), .scan_out(so[37]), .l1clk(l1clk_in), .d(din[25]), .latout(xx0_unused[37]), .q_l(xx_unused[37]), .q(din_d1[25]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx38  (.scan_in(so[37]), .scan_out(so[38]), .l1clk(l1clk_in), .d(din[26]), .latout(xx0_unused[38]), .q_l(xx_unused[38]), .q(din_d1[26]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx39  (.scan_in(so[38]), .scan_out(so[39]), .l1clk(l1clk_in), .d(din[27]), .latout(xx0_unused[39]), .q_l(xx_unused[39]), .q(din_d1[27]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx40  (.scan_in(so[39]), .scan_out(so[40]), .l1clk(l1clk_out), .d(match_p_array[0]), .q(match[0]), .q_l(xx_unused[40]), .latout(xx0_unused[40]),
  .siclk(siclk),
  .soclk(soclk));

n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx41  (.scan_in(so[40]), .scan_out(so[41]), .l1clk(l1clk_out), .d(match_p_array[1]), .q(match[1]), .q_l(xx_unused[41]), .latout(xx0_unused[41]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx42  (.scan_in(so[41]), .scan_out(so[42]), .l1clk(l1clk_out), .d(match_p_array[2]), .q(match[2]), .q_l(xx_unused[42]), .latout(xx0_unused[42]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx43  (.scan_in(so[42]), .scan_out(so[43]), .l1clk(l1clk_out), .d(match_p_array[3]), .q(match[3]), .q_l(xx_unused[43]), .latout(xx0_unused[43]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx44  (.scan_in(so[43]), .scan_out(so[44]), .l1clk(l1clk_in), .d(din[28]), .latout(xx0_unused[44]), .q_l(xx_unused[44]), .q(din_d1[28]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx45  (.scan_in(so[44]), .scan_out(so[45]), .l1clk(l1clk_in), .d(din[29]), .latout(xx0_unused[45]), .q_l(xx_unused[45]), .q(din_d1[29]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx46  (.scan_in(so[45]), .scan_out(so[46]), .l1clk(l1clk_in), .d(din[30]), .latout(xx0_unused[46]), .q_l(xx_unused[46]), .q(din_d1[30]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx47  (.scan_in(so[46]), .scan_out(so[47]), .l1clk(l1clk_in), .d(din[31]), .latout(xx0_unused[47]), .q_l(xx_unused[47]), .q(din_d1[31]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx48  (.scan_in(so[47]), .scan_out(so[48]), .l1clk(l1clk_in), .d(din[32]), .latout(xx0_unused[48]), .q_l(xx_unused[48]), .q(din_d1[32]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx49  (.scan_in(so[48]), .scan_out(so[49]), .l1clk(l1clk_in), .d(din[33]), .latout(xx0_unused[49]), .q_l(xx_unused[49]), .q(din_d1[33]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx50  (.scan_in(so[49]), .scan_out(so[50]), .l1clk(l1clk_in), .d(din[34]), .latout(xx0_unused[50]), .q_l(xx_unused[50]), .q(din_d1[34]),
  .siclk(siclk),
  .soclk(soclk));

n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx51  (.scan_in(so[50]), .scan_out(so[51]), .l1clk(l1clk_in), .d(din[35]), .latout(xx0_unused[51]), .q_l(xx_unused[51]), .q(din_d1[35]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx52  (.scan_in(so[51]), .scan_out(so[52]), .l1clk(l1clk_in), .d(din[36]), .latout(xx0_unused[52]), .q_l(xx_unused[52]), .q(din_d1[36]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx53  (.scan_in(so[52]), .scan_out(so[53]), .l1clk(l1clk_in), .d(din[37]), .latout(xx0_unused[53]), .q_l(xx_unused[53]), .q(din_d1[37]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx54  (.scan_in(so[53]), .scan_out(so[54]), .l1clk(l1clk_in), .d(din[38]), .latout(xx0_unused[54]), .q_l(xx_unused[54]), .q(din_d1[38]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx55  (.scan_in(so[54]), .scan_out(so[55]), .l1clk(l1clk_in), .d(din[39]), .latout(xx0_unused[55]), .q_l(xx_unused[55]), .q(din_d1[39]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx56  (.scan_in(so[55]), .scan_out(so[56]), .l1clk(l1clk_in), .d(read_en), .latout(mb_ren_d1), .q_l(xx_unused[56]), .q(xx0_unused[56]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx57  (.scan_in(so[56]), .scan_out(so[57]), .l1clk(l1clk_in), .d(write_en), .latout(mb_wen_d1), .q_l(xx_unused[57]), .q(xx0_unused[57]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx58  (.scan_in(so[57]), .scan_out(so[58]), .l1clk(l1clk_in), .d(adr_r[0]), .latout(adr_r_d1[0]), .q_l(xx_unused[58]), .q(xx0_unused[58]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx59  (.scan_in(so[58]), .scan_out(so[59]), .l1clk(l1clk_in), .d(adr_r[1]), .latout(adr_r_d1[1]), .q_l(xx_unused[59]), .q(xx0_unused[59]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx60  (.scan_in(so[59]), .scan_out(so[60]), .l1clk(l1clk_in), .d(adr_r[2]), .latout(adr_r_d1[2]), .q_l(xx_unused[60]), .q(xx0_unused[60]),
  .siclk(siclk),
  .soclk(soclk));

n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx61  (.scan_in(so[60]), .scan_out(so[61]), .l1clk(l1clk_in), .d(adr_r[3]), .latout(adr_r_d1[3]), .q_l(xx_unused[61]), .q(xx0_unused[61]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx62  (.scan_in(so[61]), .scan_out(so[62]), .l1clk(l1clk_in), .d(adr_w[0]), .latout(adr_w_d1[0]), .q_l(xx_unused[62]), .q(xx0_unused[62]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx63  (.scan_in(so[62]), .scan_out(so[63]), .l1clk(l1clk_in), .d(adr_w[1]), .latout(adr_w_d1[1]), .q_l(xx_unused[63]), .q(xx0_unused[63]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx64  (.scan_in(so[63]), .scan_out(so[64]), .l1clk(l1clk_in), .d(adr_w[2]), .latout(adr_w_d1[2]), .q_l(xx_unused[64]), .q(xx0_unused[64]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx65  (.scan_in(so[64]), .scan_out(so[65]), .l1clk(l1clk_in), .d(adr_w[3]), .latout(adr_w_d1[3]), .q_l(xx_unused[65]), .q(xx0_unused[65]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx66  (.scan_in(so[65]), .scan_out(so[66]), .l1clk(l1clk_in), .d(adr_r[4]), .latout(adr_r_d1[4]), .q_l(xx_unused[66]), .q(xx0_unused[66]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx67  (.scan_in(so[66]), .scan_out(so[67]), .l1clk(l1clk_in), .d(adr_r[5]), .latout(adr_r_d1[5]), .q_l(xx_unused[67]), .q(xx0_unused[67]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx68  (.scan_in(so[67]), .scan_out(so[68]), .l1clk(l1clk_in), .d(adr_r[6]), .latout(adr_r_d1[6]), .q_l(xx_unused[68]), .q(xx0_unused[68]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx69  (.scan_in(so[68]), .scan_out(so[69]), .l1clk(l1clk_in), .d(adr_r[7]), .latout(adr_r_d1[7]), .q_l(xx_unused[69]), .q(xx0_unused[69]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx70  (.scan_in(so[69]), .scan_out(so[70]), .l1clk(l1clk_in), .d(adr_w[4]), .latout(adr_w_d1[4]), .q_l(xx_unused[70]), .q(xx0_unused[70]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx71  (.scan_in(so[70]), .scan_out(so[71]), .l1clk(l1clk_in), .d(adr_w[5]), .latout(adr_w_d1[5]), .q_l(xx_unused[71]), .q(xx0_unused[71]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx72  (.scan_in(so[71]), .scan_out(so[72]), .l1clk(l1clk_in), .d(adr_w[6]), .latout(adr_w_d1[6]), .q_l(xx_unused[72]), .q(xx0_unused[72]),
  .siclk(siclk),
  .soclk(soclk));
n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 xx73  (.scan_in(so[72]), .scan_out(so[73]), .l1clk(l1clk_in), .d(adr_w[7]), .latout(adr_w_d1[7]), .q_l(xx_unused[73]), .q(xx0_unused[73]),
  .siclk(siclk),
  .soclk(soclk));


//mux_macro mux_dout (width=40,ports=2,mux=aonpe)
//        (
//	.dout (dout[39:0]),
//        .din0  (din_d1[39:0]),    
//        .din1  (dout_array[39:0]),  
//	.sel0 (tcu_array_bypass),
//	.sel1 (tcu_array_bypass_n)
//        ) ;
assign dout = dout_array;
 /// Memory array ////

n2_com_cm_8x40_cust_array array (
                .l1clk(l1clk_en),
                .l1clk_mat(l1clk_mat),
                .wr_en (mb_wen_d1),
                .rd_en (mb_ren_d1),
                .wr_addr(adr_w_d1[7:0]),
                .rd_addr(adr_r_d1[7:0]),
                .din(din_d1[39:0]),
                .dout(dout_array[39:0]),
		.bypass(tcu_array_bypass),
                .write_disable(tcu_array_wr_inhibit),
                .lookup_en(lookup_en),
                .key(key[39:7]),
                .match_p(match_p_array[7:0]),
                .match_idx_p(match_idx_p_array[7:0]),
		.l2clk(l2clk)
                 );

// fixscan start:
//assign ff_din_scanin             = scan_in                  ;
//assign ff_wr_en_scanin           = ff_din_scanout           ;
//assign ff_wr_adr_scanin          = ff_wr_en_scanout         ;
//assign ff_rd_adr_scanin          = ff_wr_adr_scanout        ;
//assign ff_ren_scanin             = ff_rd_adr_scanout        ;
//assign ff_tcu_array_wr_inhibit_scanin 	 = ff_ren_scanout           ;
//assign ff_match_scanin           = ff_tcu_array_wr_inhibit_scanout        ;
//assign ff_match_idx_scanin       = ff_match_scanout         ;
//assign scan_out                  = ff_match_idx_scanout     ;
assign scan_out                  = so[73]     ;
// fixscan end:

// synopsys translate_on

endmodule


module n2_com_cm_8x40_cust_array (
  l1clk, 
  l2clk, 
  l1clk_mat, 
  wr_en, 
  rd_en, 
  write_disable, 
  key, 
  wr_addr, 
  rd_addr, 
  din, 
  lookup_en, 
  bypass, 
  dout, 
  match_p, 
  match_idx_p);

input l1clk;
input l2clk;
input l1clk_mat;
input wr_en;
input rd_en;
input write_disable;
input [39:7] key;
input [7:0] wr_addr;
input [7:0] rd_addr;
input [39:0] din;
input lookup_en;
input bypass;
output [39:0] dout;
output [7:0] match_p;
output [7:0] match_idx_p;


reg     [39:0]  mb_cam_data[7:0] ; // BS and SR 8 deep change 3/3/04
reg     [39:0]  dout;
reg     [39:7]  key_d1;
reg             lookup_en_d1 ;
reg     [39:0]  tmp_addr ;
reg     [39:0]  tmp_addr0 ;
reg     [39:0]  tmp_addr1 ;
reg     [39:0]  tmp_addr2 ;
reg     [39:0]  tmp_addr3 ;
reg     [39:0]  tmp_addr4 ;
reg     [39:0]  tmp_addr5 ;
reg     [39:0]  tmp_addr6 ;
reg     [39:0]  tmp_addr7 ;
reg     [39:0]  tmp_addr8 ;
reg     [39:0]  tmp_addr9 ;
reg     [39:0]  tmp_addr10 ;
reg     [39:0]  tmp_addr11 ;
reg     [39:0]  tmp_addr12 ;
reg     [39:0]  tmp_addr13 ;
reg     [39:0]  tmp_addr14 ;
reg     [39:0]  tmp_addr15 ;
reg     [7:0]  match_p;
reg     [7:0]  match_idx_p;

wire    [39:0] mb_cam_data_0;
wire    [39:0] mb_cam_data_1;
wire    [39:0] mb_cam_data_2;
wire    [39:0] mb_cam_data_3;
wire    [39:0] mb_cam_data_4;
wire    [39:0] mb_cam_data_5;
wire    [39:0] mb_cam_data_6;
wire    [39:0] mb_cam_data_7;

assign  mb_cam_data_0 = mb_cam_data[0];
assign  mb_cam_data_1 = mb_cam_data[1];
assign  mb_cam_data_2 = mb_cam_data[2];
assign  mb_cam_data_3 = mb_cam_data[3];
assign  mb_cam_data_4 = mb_cam_data[4];
assign  mb_cam_data_5 = mb_cam_data[5];
assign  mb_cam_data_6 = mb_cam_data[6];
assign  mb_cam_data_7 = mb_cam_data[7];
 


`ifndef NOINITMEM
///////////////////////////////////////
// Initialize the cam/arrays.        //
///////////////////////////////////////
integer n;
initial begin
        for (n = 0; n < 8; n = n + 1) begin
                mb_cam_data[n] = {40 {1'b0}};
        end
end
`endif


// CAM OPERATION



always  @(l1clk_mat or l2clk or write_disable or bypass or lookup_en or key) begin

	if (l1clk_mat) begin
        	lookup_en_d1 <= lookup_en ;
        	key_d1 <= key;
		end

        if  (~l1clk_mat & ~l2clk & lookup_en_d1 & ~(write_disable|bypass) ) begin

		tmp_addr0 = mb_cam_data[0];
                match_p[0] =  ( tmp_addr0[39:7] == key_d1[39:7] ) ;
                match_idx_p[0] = ( tmp_addr0[17:9] == key_d1[17:9] ) ;

                tmp_addr1 = mb_cam_data[1];
                match_p[1] =  ( tmp_addr1[39:7] == key_d1[39:7] ) ;
                match_idx_p[1] = ( tmp_addr1[17:9] == key_d1[17:9] ) ;

                tmp_addr2 = mb_cam_data[2];
                match_p[2] =  ( tmp_addr2[39:7] == key_d1[39:7] ) ;
                match_idx_p[2] = ( tmp_addr2[17:9] == key_d1[17:9] ) ;

                tmp_addr3 = mb_cam_data[3];
                match_p[3] =  ( tmp_addr3[39:7] == key_d1[39:7] ) ;
                match_idx_p[3] = ( tmp_addr3[17:9] == key_d1[17:9] ) ;

                tmp_addr4 = mb_cam_data[4];
                match_p[4] =  ( tmp_addr4[39:7] == key_d1[39:7] ) ;
                match_idx_p[4] = ( tmp_addr4[17:9] == key_d1[17:9] ) ;

                tmp_addr5 = mb_cam_data[5];
                match_p[5] =  ( tmp_addr5[39:7] == key_d1[39:7] ) ;
                match_idx_p[5] = ( tmp_addr5[17:9] == key_d1[17:9] ) ;

                tmp_addr6 = mb_cam_data[6];
                match_p[6] =  ( tmp_addr6[39:7] == key_d1[39:7] ) ;
                match_idx_p[6] = ( tmp_addr6[17:9] == key_d1[17:9] ) ;

                 tmp_addr7 = mb_cam_data[7];
                match_p[7] =  ( tmp_addr7[39:7] == key_d1[39:7] ) ;
                match_idx_p[7] = ( tmp_addr7[17:9] == key_d1[17:9] ) ;
	end
        else if (~l1clk_mat & ~l2clk & (~lookup_en_d1 |write_disable|bypass) ) begin
                match_p = 8'b0;
                match_idx_p = 8'b0;
        end
	if (l1clk_mat & l2clk) begin
                match_p = 8'b0;
                match_idx_p = 8'b0;
        end

end

// READ AND WRITE HAPPEN in Phase 1.

// write_disable_d1 & reset_l_d1 are part of the
// list because we want to enter the following
// always block under the following condition:
// - wr_addr , din , wr_en remain the same across the
// rising edge of the clock
// - write_disable or reset_l change across the rising edge of the
// clock from high to low.

always  @(l1clk or rd_en or rd_addr or l2clk or wr_addr or din or wr_en  or write_disable or bypass ) begin
  begin
    if (l1clk & l2clk & wr_en  & ~(write_disable|bypass)) 
	begin
        case(wr_addr )
          8'b0000_0000: ;  // do nothing
          8'b0000_0001: mb_cam_data[0] = din ;
          8'b0000_0010: mb_cam_data[1] = din ;
          8'b0000_0100: mb_cam_data[2] = din ;
          8'b0000_1000: mb_cam_data[3] = din ;
          8'b0001_0000: mb_cam_data[4] = din;
          8'b0010_0000: mb_cam_data[5] = din ;
          8'b0100_0000: mb_cam_data[6] = din ;
          8'b1000_0000: mb_cam_data[7] = din ;
          //8'b1111_1111:
            //    begin
                    //    mb_cam_data[7] = din ;
                    //    mb_cam_data[6] = din ;
                    //    mb_cam_data[5] = din ;
                    //    mb_cam_data[4] = din ;
                    //    mb_cam_data[3] = din ;
                    //    mb_cam_data[2] = din ;
                    //    mb_cam_data[1] = din ;
                    //    mb_cam_data[0] = din ;
               // end
          default: begin
		// 0in <fire -message "FATAL ERROR: incorrect write wordline" -group mbist_mode
		   end
        endcase
	if(rd_en & (rd_addr == wr_addr))
         begin
		// 0in < known_driven -var rd_addr -message "read pointer write pointer conflict" -group mbist_mode
      	 end
      end
  end

end



// reset_l_d1 has purely been added so that we enter the always
// block when the wordline/wr_en does not change across clk cycles
// but the reset_l does.
// Notice reset_l_d1 is not used in any of the "if" statements.
// Notice that the renable is qualified with l1clk to take
// care that we do not read from the array if reset_l goes high
// during the negative phase of l1clk.
//

always  @( /*memory or*/ rd_addr or wr_addr or l1clk or l2clk
          or rd_en or wr_en or write_disable or
          mb_cam_data_0 or mb_cam_data_1 or mb_cam_data_2 or mb_cam_data_3
          or mb_cam_data_4 or mb_cam_data_5 or mb_cam_data_6 or mb_cam_data_7
	  or din or bypass) begin
  if (bypass) begin
     dout <= din;
  end
  else if (rd_en & l1clk & write_disable ) begin
//                dout <= 40'hff_ffff_ffff ;
  end
  else if (rd_en & l1clk & ~write_disable) begin
    if ((wr_en) && (rd_addr == wr_addr) )
      begin
             dout <= 40'bx ;
// 0in < known_driven -var rd_addr -message "read pointer write pointer conflict" -group mbist_mode
      end
    else
      begin
        case(rd_addr)
          // match sense amp ckt behavior when no read wl is selected
          8'b0000_0000: dout <= 40'hff_ffff_ffff ;
          8'b0000_0001: dout <= mb_cam_data_0  ;
          8'b0000_0010: dout <= mb_cam_data_1  ;
          8'b0000_0100: dout <= mb_cam_data_2  ;
          8'b0000_1000: dout <= mb_cam_data_3  ;
          8'b0001_0000: dout <= mb_cam_data_4  ;
          8'b0010_0000: dout <= mb_cam_data_5  ;
          8'b0100_0000: dout <= mb_cam_data_6  ;
          8'b1000_0000: dout <= mb_cam_data_7  ;
          default: begin
		// 0in <fire -message "FATAL ERROR: incorrect read wordline" -group mbist_mode
		end
        endcase
      end

        end // of else if
end
endmodule






// any PARAMS parms go into naming of macro

module n2_com_cm_8x40_cust_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule









//
//   macro for cl_mc1_scm_msff_lat_{4}x flops
//
//





module n2_com_cm_8x40_cust_scm_msff_lat_macro__width_1 (
  d, 
  scan_in, 
  l1clk, 
  siclk, 
  soclk, 
  latout, 
  scan_out, 
  q, 
  q_l);
input [0:0] d;
  input scan_in;
input l1clk;
input siclk;
input soclk;
output [0:0] latout;
  output scan_out;
output [0:0] q;
output [0:0] q_l;






scm_msff_lat #(1)  d0_0 (
.d(d[0:0]),
.si(scan_in),
.so(scan_out),
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.q(q[0:0]),
.q_l(q_l[0:0]),
.latout(latout[0:0])
);










//place::generic_place($width,$stack,$left);

endmodule




