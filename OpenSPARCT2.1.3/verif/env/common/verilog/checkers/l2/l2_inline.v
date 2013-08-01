// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2_inline.v
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
`ifdef FC_BENCH
 `define TB_TOP tb_top
`else
`ifdef CCM
  `define TB_TOP tb_top
`else
  `define TB_TOP l2sat_top
`endif
`endif

module l2_inline;

//
// Delay for reset and x propogation and RTL to stabilize
// This delay is introduced since reset is multi clock and
// for zero in's to work correctly.
// 

wire	myrst;
//assign myrst  = `TB_TOP.reset;
assign myrst  = `TB_TOP.cpu.rst_l2_wmr_;
reg reset_l_1;
reg reset_l_2;
reg reset_l_3;
reg reset_l_4;
reg reset_l_5;
reg reset_l_6;
reg reset_l_7;
reg reset_l_8;
reg reset_l_9;
reg my_reset_10;

wire myl2clk;

reg[2:0] l2t0_sii_req_count;
reg[2:0] l2t1_sii_req_count;
reg[2:0] l2t2_sii_req_count;
reg[2:0] l2t3_sii_req_count;
reg[2:0] l2t4_sii_req_count;
reg[2:0] l2t5_sii_req_count;
reg[2:0] l2t6_sii_req_count;
reg[2:0] l2t7_sii_req_count;

reg[2:0] l2t0_wri_req_count;
reg[2:0] l2t1_wri_req_count;
reg[2:0] l2t2_wri_req_count;
reg[2:0] l2t3_wri_req_count;
reg[2:0] l2t4_wri_req_count;
reg[2:0] l2t5_wri_req_count;
reg[2:0] l2t6_wri_req_count;
reg[2:0] l2t7_wri_req_count;


initial 
begin
  l2t0_sii_req_count = 1;
  l2t1_sii_req_count = 1;
  l2t2_sii_req_count = 1;
  l2t3_sii_req_count = 1;
  l2t4_sii_req_count = 1;
  l2t5_sii_req_count = 1;
  l2t6_sii_req_count = 1;
  l2t7_sii_req_count = 1;

  l2t0_wri_req_count = 1;
  l2t1_wri_req_count = 1;
  l2t2_wri_req_count = 1;
  l2t3_wri_req_count = 1;
  l2t4_wri_req_count = 1;
  l2t5_wri_req_count = 1;
  l2t6_wri_req_count = 1;
  l2t7_wri_req_count = 1;

end

assign myl2clk = `TB_TOP.cpu.l2clk;

always@(posedge myl2clk)
begin
        reset_l_1       <= #1   myrst;
        reset_l_2       <= #1   reset_l_1;
        reset_l_3       <= #1   reset_l_2;
        reset_l_4       <= #1   reset_l_3;
        reset_l_5       <= #1   reset_l_4;
        reset_l_6       <= #1   reset_l_5;
        reset_l_7       <= #1   reset_l_6;
        reset_l_8       <= #1   reset_l_7;
        reset_l_9       <= #1   reset_l_8;
        my_reset_10      <= #1   reset_l_9;
end
//sii req counter.   The valid range of values are 1, 2, 3.  Assertion should fire if counter goes over 2 or drop below 1.
always@ (posedge `TB_TOP.cpu.l2clk)
begin
if(`TB_TOP.reset == 1'b1) begin

if(`TB_TOP.cpu.l2t0.rst_wmr_ == 1'b1)
begin
if(`TB_TOP.cpu.l2t0.sii_l2t_req_vld)
   l2t0_sii_req_count = l2t0_sii_req_count + 1;
if (`TB_TOP.cpu.l2t0.l2t_sii_iq_dequeue)
   l2t0_sii_req_count = l2t0_sii_req_count - 1;
end
else
   l2t0_sii_req_count = 3'b1;

if(`TB_TOP.cpu.l2t1.sii_l2t_req_vld)
   l2t1_sii_req_count = l2t1_sii_req_count + 1;
if (`TB_TOP.cpu.l2t1.l2t_sii_iq_dequeue)
   l2t1_sii_req_count = l2t1_sii_req_count - 1;


if(`TB_TOP.cpu.l2t2.sii_l2t_req_vld)
   l2t2_sii_req_count = l2t2_sii_req_count + 1;
if (`TB_TOP.cpu.l2t2.l2t_sii_iq_dequeue)
   l2t2_sii_req_count = l2t2_sii_req_count - 1;


if(`TB_TOP.cpu.l2t3.sii_l2t_req_vld)
   l2t3_sii_req_count = l2t3_sii_req_count + 1;
if (`TB_TOP.cpu.l2t3.l2t_sii_iq_dequeue)
   l2t3_sii_req_count = l2t3_sii_req_count - 1;


if(`TB_TOP.cpu.l2t4.sii_l2t_req_vld)
   l2t4_sii_req_count = l2t4_sii_req_count + 1;
if (`TB_TOP.cpu.l2t4.l2t_sii_iq_dequeue)
   l2t4_sii_req_count = l2t4_sii_req_count - 1;


if(`TB_TOP.cpu.l2t5.sii_l2t_req_vld)
   l2t5_sii_req_count = l2t5_sii_req_count + 1;
if (`TB_TOP.cpu.l2t5.l2t_sii_iq_dequeue)
   l2t5_sii_req_count = l2t5_sii_req_count - 1;

if(`TB_TOP.cpu.l2t6.sii_l2t_req_vld)
   l2t6_sii_req_count = l2t6_sii_req_count + 1;
if (`TB_TOP.cpu.l2t6.l2t_sii_iq_dequeue)
   l2t6_sii_req_count = l2t6_sii_req_count - 1;

if(`TB_TOP.cpu.l2t7.sii_l2t_req_vld)
   l2t7_sii_req_count = l2t7_sii_req_count + 1;
if (`TB_TOP.cpu.l2t7.l2t_sii_iq_dequeue)
   l2t7_sii_req_count = l2t7_sii_req_count - 1;

//wri req counters  The valid range of values are 1, 2, 3, 4, 5.  Assertion should fire if counter goes over 2 or drop below 1.


if(`TB_TOP.cpu.l2t0.rst_wmr_ == 1'b1)
begin
if(`TB_TOP.cpu.l2t0.sii_l2t_req_vld & `TB_TOP.cpu.l2t0.sii_l2t_req[26])
   l2t0_wri_req_count = l2t0_wri_req_count + 1;
if (`TB_TOP.cpu.l2t0.l2t_sii_wib_dequeue)
   l2t0_wri_req_count = l2t0_wri_req_count - 1;
end
else
   l2t0_wri_req_count = 3'b1;


if(`TB_TOP.cpu.l2t1.sii_l2t_req_vld & `TB_TOP.cpu.l2t1.sii_l2t_req[26])
   l2t1_wri_req_count = l2t1_wri_req_count + 1;
if (`TB_TOP.cpu.l2t1.l2t_sii_wib_dequeue)
   l2t1_wri_req_count = l2t1_wri_req_count - 1;


if(`TB_TOP.cpu.l2t2.sii_l2t_req_vld & `TB_TOP.cpu.l2t2.sii_l2t_req[26])
   l2t2_wri_req_count = l2t2_wri_req_count + 1;
if (`TB_TOP.cpu.l2t2.l2t_sii_wib_dequeue)
   l2t2_wri_req_count = l2t2_wri_req_count - 1;


if(`TB_TOP.cpu.l2t3.sii_l2t_req_vld & `TB_TOP.cpu.l2t3.sii_l2t_req[26])
   l2t3_wri_req_count = l2t3_wri_req_count + 1;
if (`TB_TOP.cpu.l2t3.l2t_sii_wib_dequeue)
   l2t3_wri_req_count = l2t3_wri_req_count - 1;


if(`TB_TOP.cpu.l2t4.sii_l2t_req_vld & `TB_TOP.cpu.l2t4.sii_l2t_req[26])
   l2t4_wri_req_count = l2t4_wri_req_count + 1;
if (`TB_TOP.cpu.l2t4.l2t_sii_wib_dequeue)
   l2t4_wri_req_count = l2t4_wri_req_count - 1;


if(`TB_TOP.cpu.l2t5.sii_l2t_req_vld & `TB_TOP.cpu.l2t5.sii_l2t_req[26])
   l2t5_wri_req_count = l2t5_wri_req_count + 1;
if (`TB_TOP.cpu.l2t5.l2t_sii_wib_dequeue)
   l2t5_wri_req_count = l2t5_wri_req_count - 1;

if(`TB_TOP.cpu.l2t6.sii_l2t_req_vld & `TB_TOP.cpu.l2t6.sii_l2t_req[26])
   l2t6_wri_req_count = l2t6_wri_req_count + 1;
if (`TB_TOP.cpu.l2t6.l2t_sii_wib_dequeue)
   l2t6_wri_req_count = l2t6_wri_req_count - 1;

if(`TB_TOP.cpu.l2t7.sii_l2t_req_vld & `TB_TOP.cpu.l2t7.sii_l2t_req[26])
   l2t7_wri_req_count = l2t7_wri_req_count + 1;
if (`TB_TOP.cpu.l2t7.l2t_sii_wib_dequeue)
   l2t7_wri_req_count = l2t7_wri_req_count - 1;

end
end
//
// MBTAG
//

// 0in known_driven -var rd_addr -module n2_com_cm_32x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wr_addr -module n2_com_cm_32x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var rd_en -module n2_com_cm_32x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wr_en -module n2_com_cm_32x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var lookup_en -module n2_com_cm_32x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)

//
// Directories
//


// 0in known_driven -var rd_en -module dc_panel_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var cam_en -module dc_panel_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wr_en -module dc_panel_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)


//
//  wbtag,iowb and rdma
//

// 0in known_driven -var rd_en -module n2_com_cm_8x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wr_en -module n2_com_cm_8x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wr_addr -module n2_com_cm_8x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var rd_addr -module n2_com_cm_8x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var lookup_en -module n2_com_cm_8x40_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)


//
// n2_l2t_dp_32x160_cust RF interface known driven checkers
//

// 0in known_driven -var wr_en -module n2_l2t_dp_32x160_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var rd_en -module n2_l2t_dp_32x160_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var word_wen -module n2_l2t_dp_32x160_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var write_disable -module n2_l2t_dp_32x160_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wr_addr -module n2_l2t_dp_32x160_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var rd_addr -module n2_l2t_dp_32x160_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)


//
// n2_l2t_dp_32x128_cust_array  RF interface known driven checkers  
//

// 0in known_driven -var rd_en -module n2_l2t_dp_32x128_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var rd_addr -module n2_l2t_dp_32x128_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wr_en -module n2_l2t_dp_32x128_cust_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wrptr_d1 -module n2_l2t_dp_32x128_cust_array -active wr_en -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)

//
//  n2_l2t_dp_16x160_cust_array RF interface known driven checkers
//

// 0in known_driven -var  wr_en -module n2_l2t_dp_16x160_cust_array -active my_reset_10 -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var rd_en -module n2_l2t_dp_16x160_cust_array -active my_reset_10 -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var reset_l -module n2_l2t_dp_16x160_cust_array -active my_reset_10 -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var word_wen -module n2_l2t_dp_16x160_cust_array -active my_reset_10 -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wr_addr -module n2_l2t_dp_16x160_cust_array -active my_reset_10 -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var rd_addr -module n2_l2t_dp_16x160_cust_array -active my_reset_10 -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var byte_wen -module n2_l2t_dp_16x160_cust_array -active my_reset_10 -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)


//
//      l2tag_array tag array interface known driven checkers
//

// 0in known_driven -var index -module n2_l2t_quad -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var wr_en_a -module n2_l2t_quad -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var rd_en_a -module n2_l2t_quad -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// 0in known_driven -var way -module n2_l2t_quad -active wr_en_a -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)

// x0in known_driven -var acc_idx -module l2tag_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// x0in known_driven -var acc_wr -module l2tag_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// x0in known_driven -var acc_rd -module l2tag_array -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
// x0in known_driven -var acc_wr_way -module l2tag_array -active acc_wr -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)


// 
// Data Array
//


// 0in assert_follower -follower (~(`TB_TOP.cpu.l2d0.ctr.l2t_l2d_col_offset_c2[0] | `TB_TOP.cpu.l2d0.ctr.l2t_l2d_col_offset_c2[2])) -leader (`TB_TOP.cpu.l2d0.ctr.cache_col_offset_c3[0] | `TB_TOP.cpu.l2d0.ctr.cache_col_offset_c3[2]) -active ((|(`TB_TOP.cpu.l2d0.l2t_l2d_way_sel_c2) & |(`TB_TOP.cpu.l2d0.ctr.l2t_l2d_col_offset_c2)) & (|(`TB_TOP.cpu.l2d0.l2t_l2d_way_sel_c3) & |(`TB_TOP.cpu.l2d0.ctr.cache_col_offset_c3))) -clock `TB_TOP.cpu.l2clk



// 0in assert_follower -follower (~(`TB_TOP.cpu.l2d0.ctr.l2t_l2d_col_offset_c2[1] | `TB_TOP.cpu.l2d0.ctr.l2t_l2d_col_offset_c2[3])) -leader (`TB_TOP.cpu.l2d0.ctr.cache_col_offset_c3[1] | `TB_TOP.cpu.l2d0.ctr.cache_col_offset_c3[3]) -active ((|(`TB_TOP.cpu.l2d0.l2t_l2d_way_sel_c2) & |(`TB_TOP.cpu.l2d0.ctr.l2t_l2d_col_offset_c2)) & (|(`TB_TOP.cpu.l2d0.l2t_l2d_way_sel_c3) & |(`TB_TOP.cpu.l2d0.ctr.cache_col_offset_c3))) -clock `TB_TOP.cpu.l2clk











/////////////////////////


//0in assert -var (snp.snpq_valid[1] | snp.snpq_valid[0]) -active $0in_delay(sii_l2t_req_vld & (sii_l2t_req[25] | sii_l2t_req[24]), 5) -module l2t

/*0in assert -var (snp.snpq_valid[1] | snp.snpq_valid[0]) -active $0in_delay(sii_l2t_req_vld & sii_l2t_req[26], 19)
  -module l2t*/


//0in assert -var (l2t0_sii_req_count < 4) -message "L2 bank0 have more than 2 outstanding sii requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t0_sii_req_count > 0) -message "L2 bank0 received and unmatched l2t_sii_iq_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t1_sii_req_count < 4) -message "L2 bank1 have more than 2 outstanding sii requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t1_sii_req_count > 0) -message "L2 bank1 received and unmatched l2t_sii_iq_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t2_sii_req_count < 4) -message "L2 bank2 have more than 2 outstanding sii requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t2_sii_req_count > 0) -message "L2 bank2 received and unmatched l2t_sii_iq_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t3_sii_req_count < 4) -message "L2 bank3 have more than 2 outstanding sii requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t3_sii_req_count > 0) -message "L2 bank3 received and unmatched l2t_sii_iq_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t4_sii_req_count < 4) -message "L2 bank4 have more than 2 outstanding sii requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t4_sii_req_count > 0) -message "L2 bank4 received and unmatched l2t_sii_iq_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t5_sii_req_count < 4) -message "L2 bank5 have more than 2 outstanding sii requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t5_sii_req_count > 0) -message "L2 bank5 received and unmatched l2t_sii_iq_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t6_sii_req_count < 4) -message "L2 bank6 have more than 2 outstanding sii requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t6_sii_req_count > 0) -message "L2 bank6 received and unmatched l2t_sii_iq_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t7_sii_req_count < 4) -message "L2 bank7 have more than 2 outstanding sii requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t7_sii_req_count > 0) -message "L2 bank7 received and unmatched l2t_sii_iq_dequeue" -clock `TB_TOP.cpu.l2clk


//0in assert -var (l2t0_wri_req_count < 6) -message "L2 bank0 have more than 4 outstanding wri requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t0_wri_req_count > 0) -message "L2 bank0 received and unmatched l2t_sii_wib_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t1_wri_req_count < 6) -message "L2 bank1 have more than 4 outstanding wri requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t1_wri_req_count > 0) -message "L2 bank1 received and unmatched l2t_sii_wib_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t2_wri_req_count < 6) -message "L2 bank2 have more than 4 outstanding wri requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t2_wri_req_count > 0) -message "L2 bank2 received and unmatched l2t_sii_wib_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t3_wri_req_count < 6) -message "L2 bank3 have more than 4 outstanding wri requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t3_wri_req_count > 0) -message "L2 bank3 received and unmatched l2t_sii_wib_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t4_wri_req_count < 6) -message "L2 bank4 have more than 4 outstanding wri requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t4_wri_req_count > 0) -message "L2 bank4 received and unmatched l2t_sii_wib_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t5_wri_req_count < 6) -message "L2 bank5 have more than 4 outstanding wri requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t5_wri_req_count > 0) -message "L2 bank5 received and unmatched l2t_sii_wib_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t6_wri_req_count < 6) -message "L2 bank6 have more than 4 outstanding wri requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t6_wri_req_count > 0) -message "L2 bank6 received and unmatched l2t_sii_wib_dequeue" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t7_wri_req_count < 6) -message "L2 bank7 have more than 4 outstanding wri requests" -clock `TB_TOP.cpu.l2clk
//0in assert -var (l2t7_wri_req_count > 0) -message "L2 bank7 received and unmatched l2t_sii_wib_dequeue" -clock `TB_TOP.cpu.l2clk

/*0in assert_leader -leader $0in_rising_edge(`TB_TOP.cpu.l2b0.evict_l2b_mcu_data_vld_r5) -follower $0in_rising_edge(`TB_TOP.cpu.l2t0.l2t_sii_wib_dequeue)
   -min 8 -max 8  -clock `TB_TOP.cpu.l2clk
*/

/*0in assert_leader -leader $0in_rising_edge(`TB_TOP.cpu.l2b1.evict_l2b_mcu_data_vld_r5) -follower $0in_rising_edge(`TB_TOP.cpu.l2t1.l2t_sii_wib_dequeue)
   -min 7  -max 7  -clock `TB_TOP.cpu.l2clk
*/

/*0in assert_leader -leader $0in_rising_edge(`TB_TOP.cpu.l2b2.evict_l2b_mcu_data_vld_r5) -follower $0in_rising_edge(`TB_TOP.cpu.l2t2.l2t_sii_wib_dequeue)
   -min 8 -max 8  -clock `TB_TOP.cpu.l2clk
*/

/*0in assert_leader -leader $0in_rising_edge(`TB_TOP.cpu.l2b3.evict_l2b_mcu_data_vld_r5) -follower $0in_rising_edge(`TB_TOP.cpu.l2t3.l2t_sii_wib_dequeue)
   -min 7 -max 7  -clock `TB_TOP.cpu.l2clk
*/

/*0in assert_leader -leader $0in_rising_edge(`TB_TOP.cpu.l2b4.evict_l2b_mcu_data_vld_r5) -follower $0in_rising_edge(`TB_TOP.cpu.l2t4.l2t_sii_wib_dequeue)
   -min 8 -max 8  -clock `TB_TOP.cpu.l2clk
*/

/*0in assert_leader -leader $0in_rising_edge(`TB_TOP.cpu.l2b5.evict_l2b_mcu_data_vld_r5) -follower $0in_rising_edge(`TB_TOP.cpu.l2t5.l2t_sii_wib_dequeue)
   -min 7 -max 7 -clock `TB_TOP.cpu.l2clk
*/

/*0in assert_leader -leader $0in_rising_edge(`TB_TOP.cpu.l2b6.evict_l2b_mcu_data_vld_r5) -follower $0in_rising_edge(`TB_TOP.cpu.l2t6.l2t_sii_wib_dequeue)
   -min 8 -max 8 -clock `TB_TOP.cpu.l2clk
*/

/*0in assert_leader -leader $0in_rising_edge(`TB_TOP.cpu.l2b7.evict_l2b_mcu_data_vld_r5) -follower $0in_rising_edge(`TB_TOP.cpu.l2t7.l2t_sii_wib_dequeue)
   -min 7 -max 7 -clock `TB_TOP.cpu.l2clk
*/

/*0in assert -var ~wb_valid[0] -active set_wb_valid[0]
  -module l2t_wbuf_ctl
*/
/*0in assert -var ~wb_valid[1] -active set_wb_valid[1]
  -module l2t_wbuf_ctl
*/
/*0in assert -var ~wb_valid[2] -active set_wb_valid[2]
  -module l2t_wbuf_ctl
*/
/*0in assert -var ~wb_valid[3] -active set_wb_valid[3]
  -module l2t_wbuf_ctl
*/
/*0in assert -var ~wb_valid[4] -active set_wb_valid[4]
  -module l2t_wbuf_ctl
*/
/*0in assert -var ~wb_valid[5] -active set_wb_valid[5]
  -module l2t_wbuf_ctl
*/
/*0in assert -var ~wb_valid[6] -active set_wb_valid[6]
  -module l2t_wbuf_ctl
*/
/*0in assert -var ~wb_valid[7] -active set_wb_valid[7]
  -module l2t_wbuf_ctl
*/


/*0in assert -var wb_valid[0] -active reset_wb_valid[0]
  -module l2t_wbuf_ctl
*/
/*0in assert -var wb_valid[1] -active reset_wb_valid[1]
  -module l2t_wbuf_ctl
*/
/*0in assert -var wb_valid[2] -active reset_wb_valid[2]
  -module l2t_wbuf_ctl
*/
/*0in assert -var wb_valid[3] -active reset_wb_valid[3]
  -module l2t_wbuf_ctl
*/
/*0in assert -var wb_valid[4] -active reset_wb_valid[4]
  -module l2t_wbuf_ctl
*/
/*0in assert -var wb_valid[5] -active reset_wb_valid[5]
  -module l2t_wbuf_ctl
*/
/*0in assert -var wb_valid[6] -active reset_wb_valid[6]
  -module l2t_wbuf_ctl
*/
/*0in assert -var wb_valid[7] -active reset_wb_valid[7]
  -module l2t_wbuf_ctl
*/

/*0in assert -var ~rdma_valid[0] -active (rdma_wr_ptr_s2[0] & snp_rdmatag_wr_en_s2)
  -module l2t_rdmat_ctl
*/
/*0in assert -var ~rdma_valid[1] -active (rdma_wr_ptr_s2[1] & snp_rdmatag_wr_en_s2)
  -module l2t_rdmat_ctl
*/
/*0in assert -var ~rdma_valid[2] -active (rdma_wr_ptr_s2[2] & snp_rdmatag_wr_en_s2)
  -module l2t_rdmat_ctl
*/
/*0in assert -var ~rdma_valid[3] -active (rdma_wr_ptr_s2[3] & snp_rdmatag_wr_en_s2)
  -module l2t_rdmat_ctl
*/

/*0in assert -var (rdma_valid[0]) -active (wbuf_reset_rdmat_vld[0])
  -module l2t_rdmat_ctl
*/
/*0in assert -var (rdma_valid[1]) -active (wbuf_reset_rdmat_vld[1])
  -module l2t_rdmat_ctl
*/
/*0in assert -var (rdma_valid[2]) -active (wbuf_reset_rdmat_vld[2])
  -module l2t_rdmat_ctl
*/
/*0in assert -var (rdma_valid[3]) -active (wbuf_reset_rdmat_vld[3])
  -module l2t_rdmat_ctl
*/

/*0in assert -var (wbuf.wb_valid[0]) -active (wb_read_wl[0] & wb_read_en)
  -module l2t
*/
/*0in assert -var (wbuf.wb_valid[1]) -active (wb_read_wl[1] & wb_read_en)
  -module l2t
*/
/*0in assert -var (wbuf.wb_valid[2]) -active (wb_read_wl[2] & wb_read_en)
  -module l2t
*/
/*0in assert -var (wbuf.wb_valid[3]) -active (wb_read_wl[3] & wb_read_en)
  -module l2t
*/
/*0in assert -var (wbuf.wb_valid[4]) -active (wb_read_wl[4] & wb_read_en)
  -module l2t
*/
/*0in assert -var (wbuf.wb_valid[5]) -active (wb_read_wl[5] & wb_read_en)
  -module l2t
*/
/*0in assert -var (wbuf.wb_valid[6]) -active (wb_read_wl[6] & wb_read_en)
  -module l2t
*/
/*0in assert -var (wbuf.wb_valid[7]) -active (wb_read_wl[7] & wb_read_en)
  -module l2t
*/

/*0in assert -var (rdmat.rdma_valid[0]) -active (rdmat_read_wl[0] & rdmat_read_en)
  -module l2t
*/
/*0in assert -var (rdmat.rdma_valid[1]) -active (rdmat_read_wl[1] & rdmat_read_en)
  -module l2t
*/
/*0in assert -var (rdmat.rdma_valid[2]) -active (rdmat_read_wl[2] & rdmat_read_en)
  -module l2t
*/
/*0in assert -var (rdmat.rdma_valid[3]) -active (rdmat_read_wl[3] & rdmat_read_en)
  -module l2t
*/

/* 0in fifo -enq (iq_array_wr_en & ~(arb_iqsel_px2 & iqu_sel_pcx))  -deq (arb_iqsel_px2 & ~(iq_array_wr_en & iqu_sel_pcx))
   -enq_data {iqu_pcx_l2t_atm_px2_p, pcx_l2t_data_px2_fnl[`PCX_WIDTH-1:104],ique_pcx_l2t_data_103_px2, pcx_l2t_data_px2_fnl[102:0]}
   -deq_data ique.inst[130:0]
   -depth 16
   -module l2t
   -reset ~(rst_wmr_)
*/

/* x0in fifo -enq (oqarray_wr_en & ~(oqarray_rd_en & (oqarray_rd_ptr==4'b0) & (oqarray_wr_ptr==4'b0))) -deq (oqarray_rd_en & ~(oqarray_wr_en & (oqarray_rd_ptr==4'b0) & (oqarray_wr_ptr==4'b0)) & (oqarray_rd_ptr_0 != oqarray_rd_ptr_prev_0))
   -enq_data {14'b0,oq_array_data_in[`CPX_WIDTH-1:0]}
   -deq_data oq_array_data_out[159:0]
   -depth 16 
   -module l2t
   -reset ~(rst_wmr_)
*/

/*0in mutex -var l2t_l2d_way_sel_c2 -module l2t
*/

//debug logic

/*0in assert_together -follower l2t_dbg_pa_match -leader $0in_delay((csr.arb_inst_vld_c6 && ((arbdec.arbdp_inst_c6[25:21] & csr.l2_mask_register[52:48]) == csr.l2_compare_register[52:48]) && ((arbdec.arbdp_inst_c6[18:13] & csr.l2_mask_register[45:40]) == csr.l2_compare_register[45:40]) && ((arbadr.arbdp_addr_c6[33:2] & csr.l2_mask_register[33:2]) == csr.l2_compare_register[33:2])), 2) -module l2t
*/

/*x0in assert -var l2t_dbg_pa_match -active $0in_delay((csr.arb_inst_vld_c6 && ((arbdec.arbdp_inst_c6[25:21] & csr.l2_mask_register[52:48]) == csr.l2_compare_register[52:48]) && ((arbdec.arbdp_inst_c6[18:13] & csr.l2_mask_register[45:40]) == csr.l2_compare_register[45:40]) && ((arbadr.arbdp_addr_c6[33:2] & csr.l2_mask_register[33:2]) == csr.l2_compare_register[33:2])), 1) -module l2t
*/

/*0in assert_follower -follower l2t_dbg_err_event -leader (csr.dbg_trigger && (csr.csr_l2_errstate_reg[36] | csr.csr_l2_errstate_reg[35] | csr.csr_l2_notdata_reg[49] | csr.csr_l2_notdata_reg[48])) -min 1 -max 1 -module l2t
*/

/*x0in assert -var l2t_dbg_err_event -active (csr.dbg_trigger && (csr.csr_l2_errstate_reg[36] | csr.csr_l2_errstate_reg[35] | csr.csr_l2_notdata_reg[49] | csr.csr_l2_notdata_reg[48])) -module l2t
*/

/*0in custom -module l2t -clock shadow_scan.l2clk -name l2t_shadow_scan_erraddr_reg -fire (({shadow_scan.shdw_rd_errstate_reg_unused[3:0],shadow_scan.shdw_rd_errstate_reg_unused[63:32]}) != $0in_delay(csr.csr_l2_erraddr_reg[39:4],1)) -active $0in_delay((~shadow_scan.tcu_l2t_shscan_scan_en & ~shadow_scan.tcu_l2t_shscan_clk_stop_d2),1) -message ("l2t Shadow scan mismatch on erraddr_reg ; Exp=%h, Act=%h%h, l2t_shscan_scan_en: %b, tcu_l2t_shscan_clk_stop_d2: %b",csr.csr_l2_erraddr_reg[39:4], shadow_scan.shdw_rd_errstate_reg_unused[3:0],shadow_scan.shdw_rd_errstate_reg_unused[63:32],shadow_scan.tcu_l2t_shscan_scan_en,shadow_scan.tcu_l2t_shscan_clk_stop_d2) 
*/

/*0in custom -module l2t -clock shadow_scan.l2clk -name l2t_shadow_scan_notdata_reg -fire (({shadow_scan.shdw_rd_notdata_reg_unused[51:32],shadow_scan.shdw_rd_errstate_reg_unused[31:4]}) != $0in_delay(csr.csr_l2_notdata_reg[51:4],1)) -active $0in_delay((~shadow_scan.tcu_l2t_shscan_scan_en & ~shadow_scan.tcu_l2t_shscan_clk_stop_d2),1) -message ("l2t Shadow scan mismatch on notdata_reg; Exp=%h, Act=%h%h, l2t_shscan_scan_en: %b, tcu_l2t_shscan_clk_stop_d2: %b",csr.csr_l2_notdata_reg[51:4], shadow_scan.shdw_rd_notdata_reg_unused[51:32],shadow_scan.shdw_rd_errstate_reg_unused[31:4],shadow_scan.tcu_l2t_shscan_scan_en,shadow_scan.tcu_l2t_shscan_clk_stop_d2) 
*/

/*0in custom -module l2t -clock shadow_scan.l2clk -name l2t_shadow_scan_errstate_reg -fire (({shadow_scan.shdw_csr_l2_erraddr_reg_unused[45:32],shadow_scan.shdw_rd_notdata_reg_unused[31:0],shadow_scan.shdw_rd_notdata_reg_unused[63:52]}) != $0in_delay(({csr.rd_errstate_reg[63:34],csr.rd_errstate_reg[27:0]}),1)) -active $0in_delay((~shadow_scan.tcu_l2t_shscan_scan_en & ~shadow_scan.tcu_l2t_shscan_clk_stop_d2),1) -message ("l2t Shadow scan mismatch on errstate_reg; Exp=%h%h, Act=%h%h%h, l2t_shscan_scan_en: %b, tcu_l2t_shscan_clk_stop_d2: %b",csr.rd_errstate_reg[63:34],csr.rd_errstate_reg[27:0], shadow_scan.shdw_csr_l2_erraddr_reg_unused[45:32],shadow_scan.shdw_rd_notdata_reg_unused[31:0],shadow_scan.shdw_rd_notdata_reg_unused[63:52],shadow_scan.tcu_l2t_shscan_scan_en,shadow_scan.tcu_l2t_shscan_clk_stop_d2) 
*/

endmodule //l2_inline
