// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: force_random_redundancy_bits.v
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
`include "fc.vh"

module force_random_redundancy_bits;
`ifndef GATESIM
`ifndef ASIC_GATES
// common args. has associated vars in it as well, rather than in top.
`include "plus_args.v"

  integer indx, modulo_4;
  reg [31:0] rand_spc0_d_rv_bits; // SPC0 D$
  reg [31:0] rand_spc1_d_rv_bits; // SPC1 D$
  reg [31:0] rand_spc2_d_rv_bits; // SPC2 D$
  reg [31:0] rand_spc3_d_rv_bits; // SPC3 D$
  reg [31:0] rand_spc4_d_rv_bits; // SPC4 D$
  reg [31:0] rand_spc5_d_rv_bits; // SPC5 D$
  reg [31:0] rand_spc6_d_rv_bits; // SPC6 D$
  reg [31:0] rand_spc7_d_rv_bits; // SPC7 D$

  reg [95:0] rand_spc0_i_rv_bits; // SPC0 I$
  reg [95:0] rand_spc1_i_rv_bits; // SPC1 I$
  reg [95:0] rand_spc2_i_rv_bits; // SPC2 I$
  reg [95:0] rand_spc3_i_rv_bits; // SPC3 I$
  reg [95:0] rand_spc4_i_rv_bits; // SPC4 I$
  reg [95:0] rand_spc5_i_rv_bits; // SPC5 I$
  reg [95:0] rand_spc6_i_rv_bits; // SPC6 I$
  reg [95:0] rand_spc7_i_rv_bits; // SPC7 I$

  reg [5:0] force_bits; // temporary register
  reg [63:0] rand_rdp_rv_bits; // for NIU-RDP
  reg [63:0] rand_rtx_ipp0_rv_bits; // for NIU-RTX
  reg [63:0] rand_rtx_ipp1_rv_bits; // for NIU-RTX
  reg [31:0] rand_rtx_4kram_rv_bits; // for NIU-RTX
  reg [63:0] rand_rtx_zcp_rv_bits; // for NIU-RTX
  reg [63:0] rand_rtx_port0_ro_rv_bits; // for NIU-RTX
  reg [63:0] rand_rtx_port0_sf_rv_bits; // for NIU-RTX
  reg [63:0] rand_rtx_port1_ro_rv_bits; // for NIU-RTX
  reg [63:0] rand_rtx_port1_sf_rv_bits; // for NIU-RTX
  reg [31:0] rand_tds_rv_bits; // for NIU-TDS

  reg [31:0] rand_dmu_rv_bits; // for DMU

  reg [63:0] rand_l2d0_tl_way07_00_rv_bits; // l2d0 top left
  reg [63:0] rand_l2d0_tl_way158_00_rv_bits; // l2d0 top left
  reg [63:0] rand_l2d0_tl_way70_01_rv_bits; // l2d0 top left
  reg [63:0] rand_l2d0_tl_way158_01_rv_bits; // l2d0 top left

  reg [63:0] rand_l2d0_tr_way07_00_rv_bits; // l2d0 top right
  reg [63:0] rand_l2d0_tr_way158_00_rv_bits; // l2d0 top right
  reg [63:0] rand_l2d0_tr_way70_01_rv_bits; // l2d0 top right
  reg [63:0] rand_l2d0_tr_way158_01_rv_bits; // l2d0 top right

  reg [63:0] rand_l2d0_bl_way07_00_rv_bits; // l2d0 bot left
  reg [63:0] rand_l2d0_bl_way158_00_rv_bits; // l2d0 bot left
  reg [63:0] rand_l2d0_bl_way70_01_rv_bits; // l2d0 bot left
  reg [63:0] rand_l2d0_bl_way158_01_rv_bits; // l2d0 bot left

  reg [63:0] rand_l2d0_br_way07_00_rv_bits; // l2d0 bot right
  reg [63:0] rand_l2d0_br_way158_00_rv_bits; // l2d0 bot right
  reg [63:0] rand_l2d0_br_way70_01_rv_bits; // l2d0 bot right
  reg [63:0] rand_l2d0_br_way158_01_rv_bits; // l2d0 bot right

  reg [63:0] rand_l2d1_tl_way07_00_rv_bits; // l2d1 top left
  reg [63:0] rand_l2d1_tl_way158_00_rv_bits; // l2d1 top left
  reg [63:0] rand_l2d1_tl_way70_01_rv_bits; // l2d1 top left
  reg [63:0] rand_l2d1_tl_way158_01_rv_bits; // l2d1 top left

  reg [63:0] rand_l2d1_tr_way07_00_rv_bits; // l2d1 top right
  reg [63:0] rand_l2d1_tr_way158_00_rv_bits; // l2d1 top right
  reg [63:0] rand_l2d1_tr_way70_01_rv_bits; // l2d1 top right
  reg [63:0] rand_l2d1_tr_way158_01_rv_bits; // l2d1 top right

  reg [63:0] rand_l2d1_bl_way07_00_rv_bits; // l2d1 bot left
  reg [63:0] rand_l2d1_bl_way158_00_rv_bits; // l2d1 bot left
  reg [63:0] rand_l2d1_bl_way70_01_rv_bits; // l2d1 bot left
  reg [63:0] rand_l2d1_bl_way158_01_rv_bits; // l2d1 bot left

  reg [63:0] rand_l2d1_br_way07_00_rv_bits; // l2d1 bot right
  reg [63:0] rand_l2d1_br_way158_00_rv_bits; // l2d1 bot right
  reg [63:0] rand_l2d1_br_way70_01_rv_bits; // l2d1 bot right
  reg [63:0] rand_l2d1_br_way158_01_rv_bits; // l2d1 bot right

  reg [63:0] rand_l2d2_tl_way07_00_rv_bits; // l2d2 top left
  reg [63:0] rand_l2d2_tl_way158_00_rv_bits; // l2d2 top left
  reg [63:0] rand_l2d2_tl_way70_01_rv_bits; // l2d2 top left
  reg [63:0] rand_l2d2_tl_way158_01_rv_bits; // l2d2 top left

  reg [63:0] rand_l2d2_tr_way07_00_rv_bits; // l2d2 top right
  reg [63:0] rand_l2d2_tr_way158_00_rv_bits; // l2d2 top right
  reg [63:0] rand_l2d2_tr_way70_01_rv_bits; // l2d2 top right
  reg [63:0] rand_l2d2_tr_way158_01_rv_bits; // l2d2 top right

  reg [63:0] rand_l2d2_bl_way07_00_rv_bits; // l2d2 bot left
  reg [63:0] rand_l2d2_bl_way158_00_rv_bits; // l2d2 bot left
  reg [63:0] rand_l2d2_bl_way70_01_rv_bits; // l2d2 bot left
  reg [63:0] rand_l2d2_bl_way158_01_rv_bits; // l2d2 bot left

  reg [63:0] rand_l2d2_br_way07_00_rv_bits; // l2d2 bot right
  reg [63:0] rand_l2d2_br_way158_00_rv_bits; // l2d2 bot right
  reg [63:0] rand_l2d2_br_way70_01_rv_bits; // l2d2 bot right
  reg [63:0] rand_l2d2_br_way158_01_rv_bits; // l2d2 bot right

  reg [63:0] rand_l2d3_tl_way07_00_rv_bits; // l2d3 top left
  reg [63:0] rand_l2d3_tl_way158_00_rv_bits; // l2d3 top left
  reg [63:0] rand_l2d3_tl_way70_01_rv_bits; // l2d3 top left
  reg [63:0] rand_l2d3_tl_way158_01_rv_bits; // l2d3 top left

  reg [63:0] rand_l2d3_tr_way07_00_rv_bits; // l2d3 top right
  reg [63:0] rand_l2d3_tr_way158_00_rv_bits; // l2d3 top right
  reg [63:0] rand_l2d3_tr_way70_01_rv_bits; // l2d3 top right
  reg [63:0] rand_l2d3_tr_way158_01_rv_bits; // l2d3 top right

  reg [63:0] rand_l2d3_bl_way07_00_rv_bits; // l2d3 bot left
  reg [63:0] rand_l2d3_bl_way158_00_rv_bits; // l2d3 bot left
  reg [63:0] rand_l2d3_bl_way70_01_rv_bits; // l2d3 bot left
  reg [63:0] rand_l2d3_bl_way158_01_rv_bits; // l2d3 bot left

  reg [63:0] rand_l2d3_br_way07_00_rv_bits; // l2d3 bot right
  reg [63:0] rand_l2d3_br_way158_00_rv_bits; // l2d3 bot right
  reg [63:0] rand_l2d3_br_way70_01_rv_bits; // l2d3 bot right
  reg [63:0] rand_l2d3_br_way158_01_rv_bits; // l2d3 bot right

  reg [63:0] rand_l2d4_tl_way07_00_rv_bits; // l2d4 top left
  reg [63:0] rand_l2d4_tl_way158_00_rv_bits; // l2d4 top left
  reg [63:0] rand_l2d4_tl_way70_01_rv_bits; // l2d4 top left
  reg [63:0] rand_l2d4_tl_way158_01_rv_bits; // l2d4 top left

  reg [63:0] rand_l2d4_tr_way07_00_rv_bits; // l2d4 top right
  reg [63:0] rand_l2d4_tr_way158_00_rv_bits; // l2d4 top right
  reg [63:0] rand_l2d4_tr_way70_01_rv_bits; // l2d4 top right
  reg [63:0] rand_l2d4_tr_way158_01_rv_bits; // l2d4 top right

  reg [63:0] rand_l2d4_bl_way07_00_rv_bits; // l2d4 bot left
  reg [63:0] rand_l2d4_bl_way158_00_rv_bits; // l2d4 bot left
  reg [63:0] rand_l2d4_bl_way70_01_rv_bits; // l2d4 bot left
  reg [63:0] rand_l2d4_bl_way158_01_rv_bits; // l2d4 bot left

  reg [63:0] rand_l2d4_br_way07_00_rv_bits; // l2d4 bot right
  reg [63:0] rand_l2d4_br_way158_00_rv_bits; // l2d4 bot right
  reg [63:0] rand_l2d4_br_way70_01_rv_bits; // l2d4 bot right
  reg [63:0] rand_l2d4_br_way158_01_rv_bits; // l2d4 bot right

  reg [63:0] rand_l2d5_tl_way07_00_rv_bits; // l2d5 top left
  reg [63:0] rand_l2d5_tl_way158_00_rv_bits; // l2d5 top left
  reg [63:0] rand_l2d5_tl_way70_01_rv_bits; // l2d5 top left
  reg [63:0] rand_l2d5_tl_way158_01_rv_bits; // l2d5 top left

  reg [63:0] rand_l2d5_tr_way07_00_rv_bits; // l2d5 top right
  reg [63:0] rand_l2d5_tr_way158_00_rv_bits; // l2d5 top right
  reg [63:0] rand_l2d5_tr_way70_01_rv_bits; // l2d5 top right
  reg [63:0] rand_l2d5_tr_way158_01_rv_bits; // l2d5 top right

  reg [63:0] rand_l2d5_bl_way07_00_rv_bits; // l2d5 bot left
  reg [63:0] rand_l2d5_bl_way158_00_rv_bits; // l2d5 bot left
  reg [63:0] rand_l2d5_bl_way70_01_rv_bits; // l2d5 bot left
  reg [63:0] rand_l2d5_bl_way158_01_rv_bits; // l2d5 bot left

  reg [63:0] rand_l2d5_br_way07_00_rv_bits; // l2d5 bot right
  reg [63:0] rand_l2d5_br_way158_00_rv_bits; // l2d5 bot right
  reg [63:0] rand_l2d5_br_way70_01_rv_bits; // l2d5 bot right
  reg [63:0] rand_l2d5_br_way158_01_rv_bits; // l2d5 bot right

  reg [63:0] rand_l2d6_tl_way07_00_rv_bits; // l2d6 top left
  reg [63:0] rand_l2d6_tl_way158_00_rv_bits; // l2d6 top left
  reg [63:0] rand_l2d6_tl_way70_01_rv_bits; // l2d6 top left
  reg [63:0] rand_l2d6_tl_way158_01_rv_bits; // l2d6 top left

  reg [63:0] rand_l2d6_tr_way07_00_rv_bits; // l2d6 top right
  reg [63:0] rand_l2d6_tr_way158_00_rv_bits; // l2d6 top right
  reg [63:0] rand_l2d6_tr_way70_01_rv_bits; // l2d6 top right
  reg [63:0] rand_l2d6_tr_way158_01_rv_bits; // l2d6 top right

  reg [63:0] rand_l2d6_bl_way07_00_rv_bits; // l2d6 bot left
  reg [63:0] rand_l2d6_bl_way158_00_rv_bits; // l2d6 bot left
  reg [63:0] rand_l2d6_bl_way70_01_rv_bits; // l2d6 bot left
  reg [63:0] rand_l2d6_bl_way158_01_rv_bits; // l2d6 bot left

  reg [63:0] rand_l2d6_br_way07_00_rv_bits; // l2d6 bot right
  reg [63:0] rand_l2d6_br_way158_00_rv_bits; // l2d6 bot right
  reg [63:0] rand_l2d6_br_way70_01_rv_bits; // l2d6 bot right
  reg [63:0] rand_l2d6_br_way158_01_rv_bits; // l2d6 bot right

  reg [63:0] rand_l2d7_tl_way07_00_rv_bits; // l2d7 top left
  reg [63:0] rand_l2d7_tl_way158_00_rv_bits; // l2d7 top left
  reg [63:0] rand_l2d7_tl_way70_01_rv_bits; // l2d7 top left
  reg [63:0] rand_l2d7_tl_way158_01_rv_bits; // l2d7 top left

  reg [63:0] rand_l2d7_tr_way07_00_rv_bits; // l2d7 top right
  reg [63:0] rand_l2d7_tr_way158_00_rv_bits; // l2d7 top right
  reg [63:0] rand_l2d7_tr_way70_01_rv_bits; // l2d7 top right
  reg [63:0] rand_l2d7_tr_way158_01_rv_bits; // l2d7 top right

  reg [63:0] rand_l2d7_bl_way07_00_rv_bits; // l2d7 bot left
  reg [63:0] rand_l2d7_bl_way158_00_rv_bits; // l2d7 bot left
  reg [63:0] rand_l2d7_bl_way70_01_rv_bits; // l2d7 bot left
  reg [63:0] rand_l2d7_bl_way158_01_rv_bits; // l2d7 bot left

  reg [63:0] rand_l2d7_br_way07_00_rv_bits; // l2d7 bot right
  reg [63:0] rand_l2d7_br_way158_00_rv_bits; // l2d7 bot right
  reg [63:0] rand_l2d7_br_way70_01_rv_bits; // l2d7 bot right
  reg [63:0] rand_l2d7_br_way158_01_rv_bits; // l2d7 bot right

  reg [31:0] rand_l2t0_q0_rv_bits; // l2t0 quad0
  reg [31:0] rand_l2t0_q1_rv_bits; // l2t0 quad1
  reg [31:0] rand_l2t0_q2_rv_bits; // l2t0 quad2
  reg [31:0] rand_l2t0_q3_rv_bits; // l2t0 quad3

  reg [31:0] rand_l2t1_q0_rv_bits; // l2t1 quad0
  reg [31:0] rand_l2t1_q1_rv_bits; // l2t1 quad1
  reg [31:0] rand_l2t1_q2_rv_bits; // l2t1 quad2
  reg [31:0] rand_l2t1_q3_rv_bits; // l2t1 quad3

  reg [31:0] rand_l2t2_q0_rv_bits; // l2t2 quad0
  reg [31:0] rand_l2t2_q1_rv_bits; // l2t2 quad1
  reg [31:0] rand_l2t2_q2_rv_bits; // l2t2 quad2
  reg [31:0] rand_l2t2_q3_rv_bits; // l2t2 quad3

  reg [31:0] rand_l2t3_q0_rv_bits; // l2t3 quad0
  reg [31:0] rand_l2t3_q1_rv_bits; // l2t3 quad1
  reg [31:0] rand_l2t3_q2_rv_bits; // l2t3 quad2
  reg [31:0] rand_l2t3_q3_rv_bits; // l2t3 quad3

  reg [31:0] rand_l2t4_q0_rv_bits; // l2t4 quad0
  reg [31:0] rand_l2t4_q1_rv_bits; // l2t4 quad1
  reg [31:0] rand_l2t4_q2_rv_bits; // l2t4 quad2
  reg [31:0] rand_l2t4_q3_rv_bits; // l2t4 quad3

  reg [31:0] rand_l2t5_q0_rv_bits; // l2t5 quad0
  reg [31:0] rand_l2t5_q1_rv_bits; // l2t5 quad1
  reg [31:0] rand_l2t5_q2_rv_bits; // l2t5 quad2
  reg [31:0] rand_l2t5_q3_rv_bits; // l2t5 quad3

  reg [31:0] rand_l2t6_q0_rv_bits; // l2t6 quad0
  reg [31:0] rand_l2t6_q1_rv_bits; // l2t6 quad1
  reg [31:0] rand_l2t6_q2_rv_bits; // l2t6 quad2
  reg [31:0] rand_l2t6_q3_rv_bits; // l2t6 quad3

  reg [31:0] rand_l2t7_q0_rv_bits; // l2t7 quad0
  reg [31:0] rand_l2t7_q1_rv_bits; // l2t7 quad1
  reg [31:0] rand_l2t7_q2_rv_bits; // l2t7 quad2
  reg [31:0] rand_l2t7_q3_rv_bits; // l2t7 quad3

 initial
  begin
  if ($test$plusargs("RANDOM_REDUNDANCY_VALUES"))
    begin
  #2 ;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"RANDOM_REDUNDANCY_VALUES plusarg detected");
  rand_spc0_d_rv_bits = {$random(`PARGS.seed)};
  rand_spc1_d_rv_bits = {$random(`PARGS.seed)};
  rand_spc2_d_rv_bits = {$random(`PARGS.seed)};
  rand_spc3_d_rv_bits = {$random(`PARGS.seed)};
  rand_spc4_d_rv_bits = {$random(`PARGS.seed)};
  rand_spc5_d_rv_bits = {$random(`PARGS.seed)};
  rand_spc6_d_rv_bits = {$random(`PARGS.seed)};
  rand_spc7_d_rv_bits = {$random(`PARGS.seed)};

  rand_spc0_i_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_spc1_i_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_spc2_i_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_spc3_i_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_spc4_i_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_spc5_i_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_spc6_i_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_spc7_i_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_rdp_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_rtx_ipp0_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_rtx_ipp1_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_rtx_4kram_rv_bits = $random(`PARGS.seed);
  //modification  02/22/06 -- keeping the rv_bits btwn 0-18
  if(rand_rtx_4kram_rv_bits > 32'b10010) begin
    rand_rtx_4kram_rv_bits = 32'b100001000;
  end
  rand_rtx_zcp_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_rtx_port0_ro_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_rtx_port0_sf_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_rtx_port1_ro_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_rtx_port1_sf_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_tds_rv_bits = $random(`PARGS.seed);

  rand_dmu_rv_bits = {$random(`PARGS.seed)};
  modulo_4 = rand_dmu_rv_bits % 4; // make the dmu_rv bits to be 1-hot
  rand_dmu_rv_bits = 32'b0;
  rand_dmu_rv_bits[modulo_4] = 1'b1;

  rand_l2d0_tl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_tl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_tl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_tl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d0_tr_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_tr_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_tr_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_tr_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d0_bl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_bl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_bl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_bl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d0_br_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_br_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_br_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d0_br_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d1_tl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_tl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_tl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_tl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d1_tr_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_tr_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_tr_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_tr_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d1_bl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_bl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_bl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_bl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d1_br_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_br_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_br_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d1_br_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d2_tl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_tl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_tl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_tl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d2_tr_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_tr_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_tr_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_tr_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d2_bl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_bl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_bl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_bl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d2_br_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_br_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_br_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d2_br_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d3_tl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_tl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_tl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_tl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d3_tr_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_tr_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_tr_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_tr_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d3_bl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_bl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_bl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_bl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d3_br_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_br_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_br_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d3_br_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d4_tl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_tl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_tl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_tl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d4_tr_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_tr_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_tr_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_tr_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d4_bl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_bl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_bl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_bl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d4_br_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_br_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_br_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d4_br_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d5_tl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_tl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_tl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_tl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d5_tr_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_tr_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_tr_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_tr_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d5_bl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_bl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_bl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_bl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d5_br_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_br_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_br_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d5_br_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d6_tl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_tl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_tl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_tl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d6_tr_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_tr_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_tr_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_tr_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d6_bl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_bl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_bl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_bl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d6_br_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_br_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_br_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d6_br_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d7_tl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_tl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_tl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_tl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d7_tr_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_tr_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_tr_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_tr_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d7_bl_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_bl_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_bl_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_bl_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2d7_br_way07_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_br_way158_00_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_br_way70_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};
  rand_l2d7_br_way158_01_rv_bits = {$random(`PARGS.seed),$random(`PARGS.seed)};

  rand_l2t0_q0_rv_bits = {$random(`PARGS.seed)};
  rand_l2t0_q1_rv_bits = {$random(`PARGS.seed)};
  rand_l2t0_q2_rv_bits = {$random(`PARGS.seed)};
  rand_l2t0_q3_rv_bits = {$random(`PARGS.seed)};

  rand_l2t1_q0_rv_bits = {$random(`PARGS.seed)};
  rand_l2t1_q1_rv_bits = {$random(`PARGS.seed)};
  rand_l2t1_q2_rv_bits = {$random(`PARGS.seed)};
  rand_l2t1_q3_rv_bits = {$random(`PARGS.seed)};

  rand_l2t2_q0_rv_bits = {$random(`PARGS.seed)};
  rand_l2t2_q1_rv_bits = {$random(`PARGS.seed)};
  rand_l2t2_q2_rv_bits = {$random(`PARGS.seed)};
  rand_l2t2_q3_rv_bits = {$random(`PARGS.seed)};

  rand_l2t3_q0_rv_bits = {$random(`PARGS.seed)};
  rand_l2t3_q1_rv_bits = {$random(`PARGS.seed)};
  rand_l2t3_q2_rv_bits = {$random(`PARGS.seed)};
  rand_l2t3_q3_rv_bits = {$random(`PARGS.seed)};

  rand_l2t4_q0_rv_bits = {$random(`PARGS.seed)};
  rand_l2t4_q1_rv_bits = {$random(`PARGS.seed)};
  rand_l2t4_q2_rv_bits = {$random(`PARGS.seed)};
  rand_l2t4_q3_rv_bits = {$random(`PARGS.seed)};

  rand_l2t5_q0_rv_bits = {$random(`PARGS.seed)};
  rand_l2t5_q1_rv_bits = {$random(`PARGS.seed)};
  rand_l2t5_q2_rv_bits = {$random(`PARGS.seed)};
  rand_l2t5_q3_rv_bits = {$random(`PARGS.seed)};

  rand_l2t6_q0_rv_bits = {$random(`PARGS.seed)};
  rand_l2t6_q1_rv_bits = {$random(`PARGS.seed)};
  rand_l2t6_q2_rv_bits = {$random(`PARGS.seed)};
  rand_l2t6_q3_rv_bits = {$random(`PARGS.seed)};

  rand_l2t7_q0_rv_bits = {$random(`PARGS.seed)};
  rand_l2t7_q1_rv_bits = {$random(`PARGS.seed)};
  rand_l2t7_q2_rv_bits = {$random(`PARGS.seed)};
  rand_l2t7_q3_rv_bits = {$random(`PARGS.seed)};

`ifdef CORE_7
  // For SPC D$
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC7 D$ REDUNDANCY_VALUE: %b", rand_spc7_d_rv_bits);
 force `CPU.spc7.lsu.dca.array.red_reg_d_bl = rand_spc7_d_rv_bits[5:0];
 force `CPU.spc7.lsu.dca.array.red_reg_d_br = rand_spc7_d_rv_bits[11:6];
 force `CPU.spc7.lsu.dca.array.red_reg_d_tl = rand_spc7_d_rv_bits[17:12];
 force `CPU.spc7.lsu.dca.array.red_reg_d_tr = rand_spc7_d_rv_bits[23:18];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC7 D$ BOTTOM_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_spc7_d_rv_bits[5:0]) ? 2'b11 : 2'b00);
 force `CPU.spc7.lsu.dca.array.red_reg_en_bl = |(rand_spc7_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC7 D$ BOTTOM_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_spc7_d_rv_bits[11:6]) ? 2'b11 : 2'b00);
 force `CPU.spc7.lsu.dca.array.red_reg_en_br = |(rand_spc7_d_rv_bits[11:6]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC7 D$ TOP_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_spc7_d_rv_bits[17:12]) ? 2'b11 : 2'b00);
 force `CPU.spc7.lsu.dca.array.red_reg_en_tl = |(rand_spc7_d_rv_bits[17:12]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC7 D$ TOP ENABLE REDUNDANCY_VALUE: %b", |(rand_spc7_d_rv_bits[23:18]) ? 2'b11 : 2'b00);
 force `CPU.spc7.lsu.dca.array.red_reg_en_tr = |(rand_spc7_d_rv_bits[23:18]) ? 2'b11 : 2'b00;

  // For SPC I$
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC7 I$ REDUNDANCY_VALUE: %b", rand_spc7_i_rv_bits);
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top = rand_spc7_i_rv_bits[4:0];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top = rand_spc7_i_rv_bits[9:5];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top = rand_spc7_i_rv_bits[14:10];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top = rand_spc7_i_rv_bits[19:15];

 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top = rand_spc7_i_rv_bits[24:20];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top = rand_spc7_i_rv_bits[29:25];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top = rand_spc7_i_rv_bits[34:30];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top = rand_spc7_i_rv_bits[39:35];

 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot = rand_spc7_i_rv_bits[44:40];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot = rand_spc7_i_rv_bits[49:45];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot = rand_spc7_i_rv_bits[54:50];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot = rand_spc7_i_rv_bits[59:55];

 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot = rand_spc7_i_rv_bits[64:60];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot = rand_spc7_i_rv_bits[69:65];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot = rand_spc7_i_rv_bits[74:70];
 force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot = rand_spc7_i_rv_bits[79:75];

  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_top = |(rand_spc7_i_rv_bits[4:0]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_top = |(rand_spc7_i_rv_bits[9:5]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_top = |(rand_spc7_i_rv_bits[14:10]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_top = |(rand_spc7_i_rv_bits[19:15]);

  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_top = |(rand_spc7_i_rv_bits[24:20]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_top = |(rand_spc7_i_rv_bits[29:25]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_top = |(rand_spc7_i_rv_bits[34:30]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_top = |(rand_spc7_i_rv_bits[39:35]);

  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_bot = |(rand_spc7_i_rv_bits[44:40]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_bot = |(rand_spc7_i_rv_bits[49:45]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_bot = |(rand_spc7_i_rv_bits[54:50]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_bot = |(rand_spc7_i_rv_bits[59:55]);

  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_bot = |(rand_spc7_i_rv_bits[64:60]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_bot = |(rand_spc7_i_rv_bits[69:65]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_bot = |(rand_spc7_i_rv_bits[74:70]);
  force `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_bot = |(rand_spc7_i_rv_bits[79:75]);
`endif
`ifdef CORE_6
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC6 D$ REDUNDANCY_VALUE: %b", rand_spc6_d_rv_bits);
 force `CPU.spc6.lsu.dca.array.red_reg_d_bl = rand_spc6_d_rv_bits[5:0];
 force `CPU.spc6.lsu.dca.array.red_reg_d_br = rand_spc6_d_rv_bits[11:6];
 force `CPU.spc6.lsu.dca.array.red_reg_d_tl = rand_spc6_d_rv_bits[17:12];
 force `CPU.spc6.lsu.dca.array.red_reg_d_tr = rand_spc6_d_rv_bits[23:18];

 force `CPU.spc6.lsu.dca.array.red_reg_en_bl = |(rand_spc6_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
 force `CPU.spc6.lsu.dca.array.red_reg_en_br = |(rand_spc6_d_rv_bits[11:6]) ? 2'b11 : 2'b00;
 force `CPU.spc6.lsu.dca.array.red_reg_en_tl = |(rand_spc6_d_rv_bits[17:12]) ? 2'b11 : 2'b00;
 force `CPU.spc6.lsu.dca.array.red_reg_en_tr = |(rand_spc6_d_rv_bits[23:18]) ? 2'b11 : 2'b00;

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC6 I$ REDUNDANCY_VALUE: %b", rand_spc6_i_rv_bits);
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top = rand_spc6_i_rv_bits[4:0];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top = rand_spc6_i_rv_bits[9:5];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top = rand_spc6_i_rv_bits[14:10];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top = rand_spc6_i_rv_bits[19:15];

 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top = rand_spc6_i_rv_bits[24:20];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top = rand_spc6_i_rv_bits[29:25];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top = rand_spc6_i_rv_bits[34:30];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top = rand_spc6_i_rv_bits[39:35];

 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot = rand_spc6_i_rv_bits[44:40];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot = rand_spc6_i_rv_bits[49:45];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot = rand_spc6_i_rv_bits[54:50];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot = rand_spc6_i_rv_bits[59:55];

 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot = rand_spc6_i_rv_bits[64:60];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot = rand_spc6_i_rv_bits[69:65];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot = rand_spc6_i_rv_bits[74:70];
 force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot = rand_spc6_i_rv_bits[79:75];

  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_top = |(rand_spc6_i_rv_bits[4:0]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_top = |(rand_spc6_i_rv_bits[9:5]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_top = |(rand_spc6_i_rv_bits[14:10]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_top = |(rand_spc6_i_rv_bits[19:15]);

  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_top = |(rand_spc6_i_rv_bits[24:20]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_top = |(rand_spc6_i_rv_bits[29:25]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_top = |(rand_spc6_i_rv_bits[34:30]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_top = |(rand_spc6_i_rv_bits[39:35]);

  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_bot = |(rand_spc6_i_rv_bits[44:40]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_bot = |(rand_spc6_i_rv_bits[49:45]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_bot = |(rand_spc6_i_rv_bits[54:50]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_bot = |(rand_spc6_i_rv_bits[59:55]);

  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_bot = |(rand_spc6_i_rv_bits[64:60]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_bot = |(rand_spc6_i_rv_bits[69:65]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_bot = |(rand_spc6_i_rv_bits[74:70]);
  force `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_bot = |(rand_spc6_i_rv_bits[79:75]);
`endif
`ifdef CORE_5
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC5 D$ REDUNDANCY_VALUE: %b", rand_spc5_d_rv_bits);
 force `CPU.spc5.lsu.dca.array.red_reg_d_bl = rand_spc5_d_rv_bits[5:0];
 force `CPU.spc5.lsu.dca.array.red_reg_d_br = rand_spc5_d_rv_bits[11:6];
 force `CPU.spc5.lsu.dca.array.red_reg_d_tl = rand_spc5_d_rv_bits[17:12];
 force `CPU.spc5.lsu.dca.array.red_reg_d_tr = rand_spc5_d_rv_bits[23:18];

 force `CPU.spc5.lsu.dca.array.red_reg_en_bl = |(rand_spc5_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
 force `CPU.spc5.lsu.dca.array.red_reg_en_br = |(rand_spc5_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
 force `CPU.spc5.lsu.dca.array.red_reg_en_tl = |(rand_spc5_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
 force `CPU.spc5.lsu.dca.array.red_reg_en_tr = |(rand_spc5_d_rv_bits[5:0]) ? 2'b11 : 2'b00;

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC5 I$ REDUNDANCY_VALUE: %b", rand_spc5_i_rv_bits);
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top = rand_spc5_i_rv_bits[4:0];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top = rand_spc5_i_rv_bits[9:5];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top = rand_spc5_i_rv_bits[14:10];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top = rand_spc5_i_rv_bits[19:15];

 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top = rand_spc5_i_rv_bits[24:20];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top = rand_spc5_i_rv_bits[29:25];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top = rand_spc5_i_rv_bits[34:30];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top = rand_spc5_i_rv_bits[39:35];

 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot = rand_spc5_i_rv_bits[44:40];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot = rand_spc5_i_rv_bits[49:45];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot = rand_spc5_i_rv_bits[54:50];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot = rand_spc5_i_rv_bits[59:55];

 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot = rand_spc5_i_rv_bits[64:60];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot = rand_spc5_i_rv_bits[69:65];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot = rand_spc5_i_rv_bits[74:70];
 force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot = rand_spc5_i_rv_bits[79:75];

  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_top = |(rand_spc5_i_rv_bits[4:0]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_top = |(rand_spc5_i_rv_bits[9:5]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_top = |(rand_spc5_i_rv_bits[14:10]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_top = |(rand_spc5_i_rv_bits[19:15]);

  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_top = |(rand_spc5_i_rv_bits[24:20]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_top = |(rand_spc5_i_rv_bits[29:25]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_top = |(rand_spc5_i_rv_bits[34:30]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_top = |(rand_spc5_i_rv_bits[39:35]);

  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_bot = |(rand_spc5_i_rv_bits[44:40]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_bot = |(rand_spc5_i_rv_bits[49:45]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_bot = |(rand_spc5_i_rv_bits[54:50]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_bot = |(rand_spc5_i_rv_bits[59:55]);

  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_bot = |(rand_spc5_i_rv_bits[64:60]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_bot = |(rand_spc5_i_rv_bits[69:65]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_bot = |(rand_spc5_i_rv_bits[74:70]);
  force `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_bot = |(rand_spc5_i_rv_bits[79:75]);
`endif
`ifdef CORE_4
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC4 D$ REDUNDANCY_VALUE: %b", rand_spc4_d_rv_bits);
 force `CPU.spc4.lsu.dca.array.red_reg_d_bl = rand_spc4_d_rv_bits[5:0];
 force `CPU.spc4.lsu.dca.array.red_reg_d_br = rand_spc4_d_rv_bits[11:6];
 force `CPU.spc4.lsu.dca.array.red_reg_d_tl = rand_spc4_d_rv_bits[17:12];
 force `CPU.spc4.lsu.dca.array.red_reg_d_tr = rand_spc4_d_rv_bits[23:18];

 force `CPU.spc4.lsu.dca.array.red_reg_en_bl = |(rand_spc4_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
 force `CPU.spc4.lsu.dca.array.red_reg_en_br = |(rand_spc4_d_rv_bits[11:6]) ? 2'b11 : 2'b00;
 force `CPU.spc4.lsu.dca.array.red_reg_en_tl = |(rand_spc4_d_rv_bits[17:12]) ? 2'b11 : 2'b00;
 force `CPU.spc4.lsu.dca.array.red_reg_en_tr = |(rand_spc4_d_rv_bits[23:18]) ? 2'b11 : 2'b00;

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC4 I$ REDUNDANCY_VALUE: %b", rand_spc4_i_rv_bits);
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top = rand_spc4_i_rv_bits[4:0];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top = rand_spc4_i_rv_bits[9:5];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top = rand_spc4_i_rv_bits[14:10];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top = rand_spc4_i_rv_bits[19:15];

 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top = rand_spc4_i_rv_bits[24:20];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top = rand_spc4_i_rv_bits[29:25];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top = rand_spc4_i_rv_bits[34:30];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top = rand_spc4_i_rv_bits[39:35];

 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot = rand_spc4_i_rv_bits[44:40];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot = rand_spc4_i_rv_bits[49:45];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot = rand_spc4_i_rv_bits[54:50];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot = rand_spc4_i_rv_bits[59:55];

 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot = rand_spc4_i_rv_bits[64:60];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot = rand_spc4_i_rv_bits[69:65];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot = rand_spc4_i_rv_bits[74:70];
 force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot = rand_spc4_i_rv_bits[79:75];

  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_top = |(rand_spc4_i_rv_bits[4:0]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_top = |(rand_spc4_i_rv_bits[9:5]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_top = |(rand_spc4_i_rv_bits[14:10]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_top = |(rand_spc4_i_rv_bits[19:15]);

  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_top = |(rand_spc4_i_rv_bits[24:20]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_top = |(rand_spc4_i_rv_bits[29:25]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_top = |(rand_spc4_i_rv_bits[34:30]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_top = |(rand_spc4_i_rv_bits[39:35]);

  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_bot = |(rand_spc4_i_rv_bits[44:40]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_bot = |(rand_spc4_i_rv_bits[49:45]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_bot = |(rand_spc4_i_rv_bits[54:50]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_bot = |(rand_spc4_i_rv_bits[59:55]);

  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_bot = |(rand_spc4_i_rv_bits[64:60]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_bot = |(rand_spc4_i_rv_bits[69:65]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_bot = |(rand_spc4_i_rv_bits[74:70]);
  force `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_bot = |(rand_spc4_i_rv_bits[79:75]);
`endif
`ifdef CORE_3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC3 D$ REDUNDANCY_VALUE: %b", rand_spc3_d_rv_bits);
 force `CPU.spc3.lsu.dca.array.red_reg_d_bl = rand_spc3_d_rv_bits[5:0];
 force `CPU.spc3.lsu.dca.array.red_reg_d_br = rand_spc3_d_rv_bits[11:6];
 force `CPU.spc3.lsu.dca.array.red_reg_d_tl = rand_spc3_d_rv_bits[17:12];
 force `CPU.spc3.lsu.dca.array.red_reg_d_tr = rand_spc3_d_rv_bits[23:18];

 force `CPU.spc3.lsu.dca.array.red_reg_en_bl = |(rand_spc3_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
 force `CPU.spc3.lsu.dca.array.red_reg_en_br = |(rand_spc3_d_rv_bits[11:6]) ? 2'b11 : 2'b00;
 force `CPU.spc3.lsu.dca.array.red_reg_en_tl = |(rand_spc3_d_rv_bits[17:12]) ? 2'b11 : 2'b00;
 force `CPU.spc3.lsu.dca.array.red_reg_en_tr = |(rand_spc3_d_rv_bits[23:18]) ? 2'b11 : 2'b00;

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC3 I$ REDUNDANCY_VALUE: %b", rand_spc3_i_rv_bits);
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top = rand_spc3_i_rv_bits[4:0];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top = rand_spc3_i_rv_bits[9:5];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top = rand_spc3_i_rv_bits[14:10];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top = rand_spc3_i_rv_bits[19:15];

 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top = rand_spc3_i_rv_bits[24:20];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top = rand_spc3_i_rv_bits[29:25];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top = rand_spc3_i_rv_bits[34:30];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top = rand_spc3_i_rv_bits[39:35];

 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot = rand_spc3_i_rv_bits[44:40];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot = rand_spc3_i_rv_bits[49:45];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot = rand_spc3_i_rv_bits[54:50];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot = rand_spc3_i_rv_bits[59:55];

 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot = rand_spc3_i_rv_bits[64:60];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot = rand_spc3_i_rv_bits[69:65];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot = rand_spc3_i_rv_bits[74:70];
 force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot = rand_spc3_i_rv_bits[79:75];

  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_top = |(rand_spc3_i_rv_bits[4:0]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_top = |(rand_spc3_i_rv_bits[9:5]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_top = |(rand_spc3_i_rv_bits[14:10]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_top = |(rand_spc3_i_rv_bits[19:15]);

  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_top = |(rand_spc3_i_rv_bits[24:20]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_top = |(rand_spc3_i_rv_bits[29:25]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_top = |(rand_spc3_i_rv_bits[34:30]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_top = |(rand_spc3_i_rv_bits[39:35]);

  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_bot = |(rand_spc3_i_rv_bits[44:40]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_bot = |(rand_spc3_i_rv_bits[49:45]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_bot = |(rand_spc3_i_rv_bits[54:50]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_bot = |(rand_spc3_i_rv_bits[59:55]);

  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_bot = |(rand_spc3_i_rv_bits[64:60]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_bot = |(rand_spc3_i_rv_bits[69:65]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_bot = |(rand_spc3_i_rv_bits[74:70]);
  force `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_bot = |(rand_spc3_i_rv_bits[79:75]);
`endif
`ifdef CORE_2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC2 D$ REDUNDANCY_VALUE: %b", rand_spc2_d_rv_bits);
 force `CPU.spc2.lsu.dca.array.red_reg_d_bl = rand_spc2_d_rv_bits[5:0];
 force `CPU.spc2.lsu.dca.array.red_reg_d_br = rand_spc2_d_rv_bits[11:6];
 force `CPU.spc2.lsu.dca.array.red_reg_d_tl = rand_spc2_d_rv_bits[17:12];
 force `CPU.spc2.lsu.dca.array.red_reg_d_tr = rand_spc2_d_rv_bits[23:18];

 force `CPU.spc2.lsu.dca.array.red_reg_en_bl = |(rand_spc2_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
 force `CPU.spc2.lsu.dca.array.red_reg_en_br = |(rand_spc2_d_rv_bits[11:6]) ? 2'b11 : 2'b00;
 force `CPU.spc2.lsu.dca.array.red_reg_en_tl = |(rand_spc2_d_rv_bits[17:12]) ? 2'b11 : 2'b00;
 force `CPU.spc2.lsu.dca.array.red_reg_en_tr = |(rand_spc2_d_rv_bits[23:18]) ? 2'b11 : 2'b00;

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC2 I$ REDUNDANCY_VALUE: %b", rand_spc2_i_rv_bits);
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top = rand_spc2_i_rv_bits[4:0];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top = rand_spc2_i_rv_bits[9:5];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top = rand_spc2_i_rv_bits[14:10];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top = rand_spc2_i_rv_bits[19:15];

 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top = rand_spc2_i_rv_bits[24:20];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top = rand_spc2_i_rv_bits[29:25];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top = rand_spc2_i_rv_bits[34:30];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top = rand_spc2_i_rv_bits[39:35];

 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot = rand_spc2_i_rv_bits[44:40];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot = rand_spc2_i_rv_bits[49:45];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot = rand_spc2_i_rv_bits[54:50];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot = rand_spc2_i_rv_bits[59:55];

 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot = rand_spc2_i_rv_bits[64:60];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot = rand_spc2_i_rv_bits[69:65];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot = rand_spc2_i_rv_bits[74:70];
 force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot = rand_spc2_i_rv_bits[79:75];

  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_top = |(rand_spc2_i_rv_bits[4:0]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_top = |(rand_spc2_i_rv_bits[9:5]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_top = |(rand_spc2_i_rv_bits[14:10]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_top = |(rand_spc2_i_rv_bits[19:15]);

  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_top = |(rand_spc2_i_rv_bits[24:20]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_top = |(rand_spc2_i_rv_bits[29:25]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_top = |(rand_spc2_i_rv_bits[34:30]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_top = |(rand_spc2_i_rv_bits[39:35]);

  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_bot = |(rand_spc2_i_rv_bits[44:40]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_bot = |(rand_spc2_i_rv_bits[49:45]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_bot = |(rand_spc2_i_rv_bits[54:50]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_bot = |(rand_spc2_i_rv_bits[59:55]);

  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_bot = |(rand_spc2_i_rv_bits[64:60]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_bot = |(rand_spc2_i_rv_bits[69:65]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_bot = |(rand_spc2_i_rv_bits[74:70]);
  force `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_bot = |(rand_spc2_i_rv_bits[79:75]);
`endif
`ifdef CORE_1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC1 D$ REDUNDANCY_VALUE: %b", rand_spc1_d_rv_bits);
 force `CPU.spc1.lsu.dca.array.red_reg_d_bl = rand_spc1_d_rv_bits[5:0];
 force `CPU.spc1.lsu.dca.array.red_reg_d_br = rand_spc1_d_rv_bits[11:6];
 force `CPU.spc1.lsu.dca.array.red_reg_d_tl = rand_spc1_d_rv_bits[17:12];
 force `CPU.spc1.lsu.dca.array.red_reg_d_tr = rand_spc1_d_rv_bits[23:18];

 force `CPU.spc1.lsu.dca.array.red_reg_en_bl = |(rand_spc1_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
 force `CPU.spc1.lsu.dca.array.red_reg_en_br = |(rand_spc1_d_rv_bits[11:6]) ? 2'b11 : 2'b00;
 force `CPU.spc1.lsu.dca.array.red_reg_en_tl = |(rand_spc1_d_rv_bits[17:12]) ? 2'b11 : 2'b00;
 force `CPU.spc1.lsu.dca.array.red_reg_en_tr = |(rand_spc1_d_rv_bits[23:18]) ? 2'b11 : 2'b00;

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC1 I$ REDUNDANCY_VALUE: %b", rand_spc1_i_rv_bits);
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top = rand_spc1_i_rv_bits[4:0];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top = rand_spc1_i_rv_bits[9:5];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top = rand_spc1_i_rv_bits[14:10];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top = rand_spc1_i_rv_bits[19:15];

 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top = rand_spc1_i_rv_bits[24:20];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top = rand_spc1_i_rv_bits[29:25];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top = rand_spc1_i_rv_bits[34:30];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top = rand_spc1_i_rv_bits[39:35];

 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot = rand_spc1_i_rv_bits[44:40];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot = rand_spc1_i_rv_bits[49:45];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot = rand_spc1_i_rv_bits[54:50];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot = rand_spc1_i_rv_bits[59:55];

 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot = rand_spc1_i_rv_bits[64:60];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot = rand_spc1_i_rv_bits[69:65];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot = rand_spc1_i_rv_bits[74:70];
 force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot = rand_spc1_i_rv_bits[79:75];

  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_top = |(rand_spc1_i_rv_bits[4:0]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_top = |(rand_spc1_i_rv_bits[9:5]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_top = |(rand_spc1_i_rv_bits[14:10]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_top = |(rand_spc1_i_rv_bits[19:15]);

  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_top = |(rand_spc1_i_rv_bits[24:20]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_top = |(rand_spc1_i_rv_bits[29:25]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_top = |(rand_spc1_i_rv_bits[34:30]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_top = |(rand_spc1_i_rv_bits[39:35]);

  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_bot = |(rand_spc1_i_rv_bits[44:40]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_bot = |(rand_spc1_i_rv_bits[49:45]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_bot = |(rand_spc1_i_rv_bits[54:50]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_bot = |(rand_spc1_i_rv_bits[59:55]);

  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_bot = |(rand_spc1_i_rv_bits[64:60]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_bot = |(rand_spc1_i_rv_bits[69:65]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_bot = |(rand_spc1_i_rv_bits[74:70]);
  force `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_bot = |(rand_spc1_i_rv_bits[79:75]);
`endif
`ifdef CORE_0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC0 D$ REDUNDANCY_VALUE: %b", rand_spc0_d_rv_bits);
 force `CPU.spc0.lsu.dca.array.red_reg_d_bl = rand_spc0_d_rv_bits[5:0];
 force `CPU.spc0.lsu.dca.array.red_reg_d_br = rand_spc0_d_rv_bits[11:6];
 force `CPU.spc0.lsu.dca.array.red_reg_d_tl = rand_spc0_d_rv_bits[17:12];
 force `CPU.spc0.lsu.dca.array.red_reg_d_tr = rand_spc0_d_rv_bits[23:18];

 force `CPU.spc0.lsu.dca.array.red_reg_en_bl = |(rand_spc0_d_rv_bits[5:0]) ? 2'b11 : 2'b00;
 force `CPU.spc0.lsu.dca.array.red_reg_en_br = |(rand_spc0_d_rv_bits[11:6]) ? 2'b11 : 2'b00;
 force `CPU.spc0.lsu.dca.array.red_reg_en_tl = |(rand_spc0_d_rv_bits[17:12]) ? 2'b11 : 2'b00;
 force `CPU.spc0.lsu.dca.array.red_reg_en_tr = |(rand_spc0_d_rv_bits[23:18]) ? 2'b11 : 2'b00;

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"SPC0 I$ REDUNDANCY_VALUE: %b", rand_spc0_i_rv_bits);
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top = rand_spc0_i_rv_bits[4:0];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top = rand_spc0_i_rv_bits[9:5];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top = rand_spc0_i_rv_bits[14:10];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top = rand_spc0_i_rv_bits[19:15];

 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top = rand_spc0_i_rv_bits[24:20];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top = rand_spc0_i_rv_bits[29:25];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top = rand_spc0_i_rv_bits[34:30];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top = rand_spc0_i_rv_bits[39:35];

 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot = rand_spc0_i_rv_bits[44:40];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot = rand_spc0_i_rv_bits[49:45];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot = rand_spc0_i_rv_bits[54:50];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot = rand_spc0_i_rv_bits[59:55];

 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot = rand_spc0_i_rv_bits[64:60];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot = rand_spc0_i_rv_bits[69:65];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot = rand_spc0_i_rv_bits[74:70];
 force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot = rand_spc0_i_rv_bits[79:75];

  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_top = |(rand_spc0_i_rv_bits[4:0]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_top = |(rand_spc0_i_rv_bits[9:5]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_top = |(rand_spc0_i_rv_bits[14:10]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_top = |(rand_spc0_i_rv_bits[19:15]);

  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_top = |(rand_spc0_i_rv_bits[24:20]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_top = |(rand_spc0_i_rv_bits[29:25]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_top = |(rand_spc0_i_rv_bits[34:30]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_top = |(rand_spc0_i_rv_bits[39:35]);

  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_en_lft_bot = |(rand_spc0_i_rv_bits[44:40]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_en_lft_bot = |(rand_spc0_i_rv_bits[49:45]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_en_lft_bot = |(rand_spc0_i_rv_bits[54:50]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_en_lft_bot = |(rand_spc0_i_rv_bits[59:55]);

  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_en_rgt_bot = |(rand_spc0_i_rv_bits[64:60]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_en_rgt_bot = |(rand_spc0_i_rv_bits[69:65]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_en_rgt_bot = |(rand_spc0_i_rv_bits[74:70]);
  force `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_en_rgt_bot = |(rand_spc0_i_rv_bits[79:75]);
`endif

//  added this
`ifndef FC_NO_NIU_T2
`ifndef NIU_SYSTEMC_T2
  // NIU repair value bits
 force_bits[5:0] = rand_rdp_rv_bits[5:0]%37;
  rand_rdp_rv_bits[5:0] = force_bits[5:0];
 force_bits[5:0] = rand_rdp_rv_bits[11:6]%37;
  rand_rdp_rv_bits[11:6] = force_bits[5:0];
 force_bits[5:0] = rand_rdp_rv_bits[17:12]%37;
  rand_rdp_rv_bits[17:12] = force_bits[5:0];
 force_bits[5:0] = rand_rdp_rv_bits[23:18]%37;
  rand_rdp_rv_bits[23:18] = force_bits[5:0];
 force_bits[5:0] = rand_rdp_rv_bits[29:24]%37;
  rand_rdp_rv_bits[29:24] = force_bits[5:0];
 force_bits[5:0] = rand_rdp_rv_bits[35:30]%37;
  rand_rdp_rv_bits[35:30] = force_bits[5:0];
 force_bits[5:0] = rand_rdp_rv_bits[41:36]%37;
  rand_rdp_rv_bits[41:36] = force_bits[5:0];
 force_bits[5:0] = rand_rdp_rv_bits[47:42]%37;
  rand_rdp_rv_bits[47:42] = force_bits[5:0];

`ifndef GATESIM

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU RDP REDUNDANCY_VALUE: %b", rand_rdp_rv_bits);
 force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_data_reg = rand_rdp_rv_bits[5:0];
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_en_reg = |(rand_rdp_rv_bits[5:0]);
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_en_reg1 = |(rand_rdp_rv_bits[5:0]);
 force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_data_reg = rand_rdp_rv_bits[11:6];
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_en_reg = |(rand_rdp_rv_bits[11:6]);
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_en_reg1 = |(rand_rdp_rv_bits[11:6]);
 force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_data_reg = rand_rdp_rv_bits[17:12];
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_en_reg = |(rand_rdp_rv_bits[17:12]);
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_en_reg1 = |(rand_rdp_rv_bits[17:12]);
 force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_data_reg = rand_rdp_rv_bits[23:18];
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_en_reg = |(rand_rdp_rv_bits[23:18]);
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_en_reg1 = |(rand_rdp_rv_bits[23:18]);
 force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_data_reg = rand_rdp_rv_bits[29:24];
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_en_reg = |(rand_rdp_rv_bits[29:24]);
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_en_reg1 = |(rand_rdp_rv_bits[29:24]);
 force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_data_reg = rand_rdp_rv_bits[35:30];
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_en_reg = |(rand_rdp_rv_bits[35:30]);
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_en_reg1 = |(rand_rdp_rv_bits[35:30]);
 force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_data_reg = rand_rdp_rv_bits[41:36];
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_en_reg = |(rand_rdp_rv_bits[41:36]);
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_en_reg1 = |(rand_rdp_rv_bits[41:36]);
 force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_data_reg = rand_rdp_rv_bits[47:42];
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_en_reg = |(rand_rdp_rv_bits[47:42]);
  force `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_en_reg1 = |(rand_rdp_rv_bits[47:42]);

`endif

 force_bits[5:0] = rand_rtx_ipp0_rv_bits[5:0]%37;
  rand_rtx_ipp0_rv_bits[5:0] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp0_rv_bits[11:6]%37;
  rand_rtx_ipp0_rv_bits[11:6] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp0_rv_bits[17:12]%37;
  rand_rtx_ipp0_rv_bits[17:12] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp0_rv_bits[23:18]%37;
  rand_rtx_ipp0_rv_bits[23:18] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp0_rv_bits[29:24]%37;
  rand_rtx_ipp0_rv_bits[29:24] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp0_rv_bits[35:30]%37;
  rand_rtx_ipp0_rv_bits[35:30] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp0_rv_bits[41:36]%37;
  rand_rtx_ipp0_rv_bits[41:36] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp0_rv_bits[47:42]%37;
  rand_rtx_ipp0_rv_bits[47:42] = force_bits[5:0];

`ifndef GATESIM

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU RTX_IPP0 REDUNDANCY_VALUE: %b", rand_rtx_ipp0_rv_bits);
 force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg = rand_rtx_ipp0_rv_bits[5:0];
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg = |(rand_rtx_ipp0_rv_bits[5:0]);
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg1 = |(rand_rtx_ipp0_rv_bits[5:0]);
 force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg = rand_rtx_ipp0_rv_bits[11:6];
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg = |(rand_rtx_ipp0_rv_bits[11:6]);
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg1 = |(rand_rtx_ipp0_rv_bits[11:6]);
 force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg = rand_rtx_ipp0_rv_bits[17:12];
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg = |(rand_rtx_ipp0_rv_bits[17:12]);
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg1 = |(rand_rtx_ipp0_rv_bits[17:12]);
 force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg = rand_rtx_ipp0_rv_bits[23:18];
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg = |(rand_rtx_ipp0_rv_bits[23:18]);
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg1 = |(rand_rtx_ipp0_rv_bits[23:18]);
 force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg = rand_rtx_ipp0_rv_bits[29:24];
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg = |(rand_rtx_ipp0_rv_bits[29:24]);
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg1 = |(rand_rtx_ipp0_rv_bits[29:24]);
 force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg = rand_rtx_ipp0_rv_bits[35:30];
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg = |(rand_rtx_ipp0_rv_bits[35:30]);
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg1 = |(rand_rtx_ipp0_rv_bits[35:30]);
 force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg = rand_rtx_ipp0_rv_bits[41:36];
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg = |(rand_rtx_ipp0_rv_bits[41:36]);
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg1 = |(rand_rtx_ipp0_rv_bits[41:36]);
 force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg = rand_rtx_ipp0_rv_bits[47:42];
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg = |(rand_rtx_ipp0_rv_bits[47:42]);
  force `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg1 = |(rand_rtx_ipp0_rv_bits[47:42]);
`endif

 force_bits[5:0] = rand_rtx_ipp1_rv_bits[5:0]%37;
  rand_rtx_ipp1_rv_bits[5:0] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp1_rv_bits[11:6]%37;
  rand_rtx_ipp1_rv_bits[11:6] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp1_rv_bits[17:12]%37;
  rand_rtx_ipp1_rv_bits[17:12] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp1_rv_bits[23:18]%37;
  rand_rtx_ipp1_rv_bits[23:18] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp1_rv_bits[29:24]%37;
  rand_rtx_ipp1_rv_bits[29:24] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp1_rv_bits[35:30]%37;
  rand_rtx_ipp1_rv_bits[35:30] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp1_rv_bits[41:36]%37;
  rand_rtx_ipp1_rv_bits[41:36] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_ipp1_rv_bits[47:42]%37;
  rand_rtx_ipp1_rv_bits[47:42] = force_bits[5:0];

`ifndef GATESIM

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU RTX_IPP1 REDUNDANCY_VALUE: %b", rand_rtx_ipp1_rv_bits);
 force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg = rand_rtx_ipp1_rv_bits[5:0];
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg = |(rand_rtx_ipp1_rv_bits[5:0]);
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg1 = |(rand_rtx_ipp1_rv_bits[5:0]);
 force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg = rand_rtx_ipp1_rv_bits[11:6];
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg = |(rand_rtx_ipp1_rv_bits[11:6]);
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg1 = |(rand_rtx_ipp1_rv_bits[11:6]);
 force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg = rand_rtx_ipp1_rv_bits[17:12];
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg = |(rand_rtx_ipp1_rv_bits[17:12]);
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg1 = |(rand_rtx_ipp1_rv_bits[17:12]);
 force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg = rand_rtx_ipp1_rv_bits[23:18];
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg = |(rand_rtx_ipp1_rv_bits[23:18]);
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg1 = |(rand_rtx_ipp1_rv_bits[23:18]);
 force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg = rand_rtx_ipp1_rv_bits[26:24];
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg = |(rand_rtx_ipp1_rv_bits[26:24]);
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg1 = |(rand_rtx_ipp1_rv_bits[26:24]);
 force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg = rand_rtx_ipp1_rv_bits[35:30];
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg = |(rand_rtx_ipp1_rv_bits[35:30]);
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg1 = |(rand_rtx_ipp1_rv_bits[35:30]);
 force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg = rand_rtx_ipp1_rv_bits[41:36];
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg = |(rand_rtx_ipp1_rv_bits[41:36]);
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg1 = |(rand_rtx_ipp1_rv_bits[41:36]);
 force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg = rand_rtx_ipp1_rv_bits[47:42];
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg = |(rand_rtx_ipp1_rv_bits[47:42]);
  force `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg1 = |(rand_rtx_ipp1_rv_bits[47:42]);

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU RTX_4K_RAM REDUNDANCY_VALUE: %b", rand_rtx_4kram_rv_bits);
 force `CPU.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_0.red_data_reg = rand_rtx_4kram_rv_bits[4:0];
  force `CPU.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_0.red_en_reg = |(rand_rtx_4kram_rv_bits[4:0]);
  force `CPU.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_0.red_en_reg1 = |(rand_rtx_4kram_rv_bits[4:0]);
 force `CPU.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_1.red_data_reg = rand_rtx_4kram_rv_bits[9:5];
  force `CPU.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_1.red_en_reg = |(rand_rtx_4kram_rv_bits[9:5]);
  force `CPU.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_1.red_en_reg1 = |(rand_rtx_4kram_rv_bits[9:5]);
`endif

 force_bits[5:0] = rand_rtx_zcp_rv_bits[5:0]%37;
  rand_rtx_zcp_rv_bits[5:0] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_zcp_rv_bits[11:6]%37;
  rand_rtx_zcp_rv_bits[11:6] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_zcp_rv_bits[17:12]%37;
  rand_rtx_zcp_rv_bits[17:12] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_zcp_rv_bits[23:18]%37;
  rand_rtx_zcp_rv_bits[23:18] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_zcp_rv_bits[29:24]%37;
  rand_rtx_zcp_rv_bits[29:24] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_zcp_rv_bits[35:30]%37;
  rand_rtx_zcp_rv_bits[35:30] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_zcp_rv_bits[41:36]%37;
  rand_rtx_zcp_rv_bits[41:36] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_zcp_rv_bits[47:42]%37;
  rand_rtx_zcp_rv_bits[47:42] = force_bits[5:0];

`ifndef GATESIM

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU ZCP REDUNDANCY_VALUE: %b", rand_rtx_zcp_rv_bits);
 force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_data_reg = rand_rtx_zcp_rv_bits[5:0];
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_en_reg = |(rand_rtx_zcp_rv_bits[5:0]);
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_en_reg1 = |(rand_rtx_zcp_rv_bits[5:0]);
 force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_data_reg = rand_rtx_zcp_rv_bits[11:6];
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_en_reg = |(rand_rtx_zcp_rv_bits[11:6]);
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_en_reg1 = |(rand_rtx_zcp_rv_bits[11:6]);
 force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_data_reg = rand_rtx_zcp_rv_bits[17:12];
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_en_reg = |(rand_rtx_zcp_rv_bits[17:12]);
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_en_reg1 = |(rand_rtx_zcp_rv_bits[17:12]);
 force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_data_reg = rand_rtx_zcp_rv_bits[23:18];
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_en_reg = |(rand_rtx_zcp_rv_bits[23:18]);
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_en_reg1 = |(rand_rtx_zcp_rv_bits[23:18]);
 force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_data_reg = rand_rtx_zcp_rv_bits[29:24];
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_en_reg = |(rand_rtx_zcp_rv_bits[29:24]);
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_en_reg1 = |(rand_rtx_zcp_rv_bits[29:24]);
 force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_data_reg = rand_rtx_zcp_rv_bits[35:30];
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_en_reg = |(rand_rtx_zcp_rv_bits[35:30]);
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_en_reg1 = |(rand_rtx_zcp_rv_bits[35:30]);
 force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_data_reg = rand_rtx_zcp_rv_bits[41:36];
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_en_reg = |(rand_rtx_zcp_rv_bits[41:36]);
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_en_reg1 = |(rand_rtx_zcp_rv_bits[41:36]);
 force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_data_reg = rand_rtx_zcp_rv_bits[47:42];
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_en_reg = |(rand_rtx_zcp_rv_bits[47:42]);
  force `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_en_reg1 = |(rand_rtx_zcp_rv_bits[47:42]);
`endif


 force_bits[5:0] = rand_rtx_port0_ro_rv_bits[5:0]%37;
  rand_rtx_port0_ro_rv_bits[5:0] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_ro_rv_bits[11:6]%37;
  rand_rtx_port0_ro_rv_bits[11:6] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_ro_rv_bits[17:12]%37;
  rand_rtx_port0_ro_rv_bits[17:12] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_ro_rv_bits[23:18]%37;
  rand_rtx_port0_ro_rv_bits[23:18] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_ro_rv_bits[29:24]%37;
  rand_rtx_port0_ro_rv_bits[29:24] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_ro_rv_bits[35:30]%37;
  rand_rtx_port0_ro_rv_bits[35:30] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_ro_rv_bits[41:36]%37;
  rand_rtx_port0_ro_rv_bits[41:36] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_ro_rv_bits[47:42]%37;
  rand_rtx_port0_ro_rv_bits[47:42] = force_bits[5:0];

`ifndef GATESIM

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU PORT0_RO REDUNDANCY_VALUE: %b", rand_rtx_port0_ro_rv_bits);
 force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg = rand_rtx_port0_ro_rv_bits[5:0];
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg = |(rand_rtx_port0_ro_rv_bits[5:0]);
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg1 = |(rand_rtx_port0_ro_rv_bits[5:0]);
 force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg = rand_rtx_port0_ro_rv_bits[11:6];
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg = |(rand_rtx_port0_ro_rv_bits[11:6]);
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg1 = |(rand_rtx_port0_ro_rv_bits[11:6]);
 force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg = rand_rtx_port0_ro_rv_bits[17:12];
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg = |(rand_rtx_port0_ro_rv_bits[17:12]);
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg1 = |(rand_rtx_port0_ro_rv_bits[17:12]);
 force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg = rand_rtx_port0_ro_rv_bits[23:18];
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg = |(rand_rtx_port0_ro_rv_bits[23:18]);
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg1 = |(rand_rtx_port0_ro_rv_bits[23:18]);
 force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg = rand_rtx_port0_ro_rv_bits[29:24];
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg = |(rand_rtx_port0_ro_rv_bits[29:24]);
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg1 = |(rand_rtx_port0_ro_rv_bits[29:24]);
 force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg = rand_rtx_port0_ro_rv_bits[35:30];
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg = |(rand_rtx_port0_ro_rv_bits[35:30]);
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg1 = |(rand_rtx_port0_ro_rv_bits[35:30]);
 force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg = rand_rtx_port0_ro_rv_bits[41:36];
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg = |(rand_rtx_port0_ro_rv_bits[41:36]);
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg1 = |(rand_rtx_port0_ro_rv_bits[41:36]);
 force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg = rand_rtx_port0_ro_rv_bits[47:42];
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg = |(rand_rtx_port0_ro_rv_bits[47:42]);
  force `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg1 = |(rand_rtx_port0_ro_rv_bits[47:42]);
`endif


 force_bits[5:0] = rand_rtx_port0_sf_rv_bits[5:0]%37;
  rand_rtx_port0_sf_rv_bits[5:0] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_sf_rv_bits[11:6]%37;
  rand_rtx_port0_sf_rv_bits[11:6] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_sf_rv_bits[17:12]%37;
  rand_rtx_port0_sf_rv_bits[17:12] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_sf_rv_bits[23:18]%37;
  rand_rtx_port0_sf_rv_bits[23:18] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_sf_rv_bits[29:24]%37;
  rand_rtx_port0_sf_rv_bits[29:24] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_sf_rv_bits[35:30]%37;
  rand_rtx_port0_sf_rv_bits[35:30] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_sf_rv_bits[41:36]%37;
  rand_rtx_port0_sf_rv_bits[41:36] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port0_sf_rv_bits[47:42]%37;
  rand_rtx_port0_sf_rv_bits[47:42] = force_bits[5:0];

`ifndef GATESIM

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU PORT0_SF REDUNDANCY_VALUE: %b", rand_rtx_port0_sf_rv_bits);
 force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg = rand_rtx_port0_sf_rv_bits[5:0];
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg = |(rand_rtx_port0_sf_rv_bits[5:0]);
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg1 = |(rand_rtx_port0_sf_rv_bits[5:0]);
 force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg = rand_rtx_port0_sf_rv_bits[11:6];
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg = |(rand_rtx_port0_sf_rv_bits[11:6]);
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg1 = |(rand_rtx_port0_sf_rv_bits[11:6]);
 force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg = rand_rtx_port0_sf_rv_bits[17:12];
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg = |(rand_rtx_port0_sf_rv_bits[17:12]);
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg1 = |(rand_rtx_port0_sf_rv_bits[17:12]);
 force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg = rand_rtx_port0_sf_rv_bits[23:18];
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg = |(rand_rtx_port0_sf_rv_bits[23:18]);
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg1 = |(rand_rtx_port0_sf_rv_bits[23:18]);
 force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg = rand_rtx_port0_sf_rv_bits[29:24];
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg = |(rand_rtx_port0_sf_rv_bits[29:24]);
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg1 = |(rand_rtx_port0_sf_rv_bits[29:24]);
 force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg = rand_rtx_port0_sf_rv_bits[35:30];
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg = |(rand_rtx_port0_sf_rv_bits[35:30]);
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg1 = |(rand_rtx_port0_sf_rv_bits[35:30]);
 force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg = rand_rtx_port0_sf_rv_bits[41:36];
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg = |(rand_rtx_port0_sf_rv_bits[41:36]);
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg1 = |(rand_rtx_port0_sf_rv_bits[41:36]);
 force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg = rand_rtx_port0_sf_rv_bits[47:42];
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg = |(rand_rtx_port0_sf_rv_bits[47:42]);
  force `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg1 = |(rand_rtx_port0_sf_rv_bits[47:42]);
`endif

 force_bits[5:0] = rand_rtx_port1_ro_rv_bits[5:0]%37;
  rand_rtx_port1_ro_rv_bits[5:0] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_ro_rv_bits[11:6]%37;
  rand_rtx_port1_ro_rv_bits[11:6] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_ro_rv_bits[17:12]%37;
  rand_rtx_port1_ro_rv_bits[17:12] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_ro_rv_bits[23:18]%37;
  rand_rtx_port1_ro_rv_bits[23:18] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_ro_rv_bits[29:24]%37;
  rand_rtx_port1_ro_rv_bits[29:24] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_ro_rv_bits[35:30]%37;
  rand_rtx_port1_ro_rv_bits[35:30] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_ro_rv_bits[41:36]%37;
  rand_rtx_port1_ro_rv_bits[41:36] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_ro_rv_bits[47:42]%37;
  rand_rtx_port1_ro_rv_bits[47:42] = force_bits[5:0];

`ifndef GATESIM
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU PORT1_RO REDUNDANCY_VALUE: %b", rand_rtx_port1_ro_rv_bits);
 force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg = rand_rtx_port1_ro_rv_bits[5:0];
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg = |(rand_rtx_port1_ro_rv_bits[5:0]);
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg1 = |(rand_rtx_port1_ro_rv_bits[5:0]);
 force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg = rand_rtx_port1_ro_rv_bits[11:6];
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg = |(rand_rtx_port1_ro_rv_bits[11:6]);
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg1 = |(rand_rtx_port1_ro_rv_bits[11:6]);
 force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg = rand_rtx_port1_ro_rv_bits[17:12];
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg = |(rand_rtx_port1_ro_rv_bits[17:12]);
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg1 = |(rand_rtx_port1_ro_rv_bits[17:12]);
 force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg = rand_rtx_port1_ro_rv_bits[23:18];
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg = |(rand_rtx_port1_ro_rv_bits[23:18]);
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg1 = |(rand_rtx_port1_ro_rv_bits[23:18]);
 force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg = rand_rtx_port1_ro_rv_bits[29:24];
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg = |(rand_rtx_port1_ro_rv_bits[29:24]);
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg1 = |(rand_rtx_port1_ro_rv_bits[29:24]);
 force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg = rand_rtx_port1_ro_rv_bits[35:30];
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg = |(rand_rtx_port1_ro_rv_bits[35:30]);
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg1 = |(rand_rtx_port1_ro_rv_bits[35:30]);
 force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg = rand_rtx_port1_ro_rv_bits[41:36];
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg = |(rand_rtx_port1_ro_rv_bits[41:36]);
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg1 = |(rand_rtx_port1_ro_rv_bits[41:36]);
 force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg = rand_rtx_port1_ro_rv_bits[47:42];
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg = |(rand_rtx_port1_ro_rv_bits[47:42]);
  force `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg1 = |(rand_rtx_port1_ro_rv_bits[47:42]);
`endif

 force_bits[5:0] = rand_rtx_port1_sf_rv_bits[5:0]%37;
  rand_rtx_port1_sf_rv_bits[5:0] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_sf_rv_bits[11:6]%37;
  rand_rtx_port1_sf_rv_bits[11:6] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_sf_rv_bits[17:12]%37;
  rand_rtx_port1_sf_rv_bits[17:12] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_sf_rv_bits[23:18]%37;
  rand_rtx_port1_sf_rv_bits[23:18] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_sf_rv_bits[29:24]%37;
  rand_rtx_port1_sf_rv_bits[29:24] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_sf_rv_bits[35:30]%37;
  rand_rtx_port1_sf_rv_bits[35:30] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_sf_rv_bits[41:36]%37;
  rand_rtx_port1_sf_rv_bits[41:36] = force_bits[5:0];
 force_bits[5:0] = rand_rtx_port1_sf_rv_bits[47:42]%37;
  rand_rtx_port1_sf_rv_bits[47:42] = force_bits[5:0];

`ifndef GATESIM

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU PORT1_SF REDUNDANCY_VALUE: %b", rand_rtx_port1_sf_rv_bits);
 force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg = rand_rtx_port1_sf_rv_bits[5:0];
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg = |(rand_rtx_port1_sf_rv_bits[5:0]);
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_en_reg1 = |(rand_rtx_port1_sf_rv_bits[5:0]);
 force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg = rand_rtx_port1_sf_rv_bits[11:6];
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg = |(rand_rtx_port1_sf_rv_bits[11:6]);
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_en_reg1 = |(rand_rtx_port1_sf_rv_bits[11:6]);
 force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg = rand_rtx_port1_sf_rv_bits[17:12];
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg = |(rand_rtx_port1_sf_rv_bits[17:12]);
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_en_reg1 = |(rand_rtx_port1_sf_rv_bits[17:12]);
 force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg = rand_rtx_port1_sf_rv_bits[23:18];
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg = |(rand_rtx_port1_sf_rv_bits[23:18]);
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_en_reg1 = |(rand_rtx_port1_sf_rv_bits[23:18]);
 force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg = rand_rtx_port1_sf_rv_bits[29:24];
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg = |(rand_rtx_port1_sf_rv_bits[29:24]);
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_en_reg1 = |(rand_rtx_port1_sf_rv_bits[29:24]);
 force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg = rand_rtx_port1_sf_rv_bits[35:30];
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg = |(rand_rtx_port1_sf_rv_bits[35:30]);
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_en_reg1 = |(rand_rtx_port1_sf_rv_bits[35:30]);
 force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg = rand_rtx_port1_sf_rv_bits[41:36];
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg = |(rand_rtx_port1_sf_rv_bits[41:36]);
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_en_reg1 = |(rand_rtx_port1_sf_rv_bits[41:36]);
 force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg = rand_rtx_port1_sf_rv_bits[47:42];
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg = |(rand_rtx_port1_sf_rv_bits[47:42]);
  force `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_en_reg1 = |(rand_rtx_port1_sf_rv_bits[47:42]);
`endif

 force_bits[5:0] = rand_tds_rv_bits[5:0]%37;
  rand_tds_rv_bits[5:0] = force_bits[5:0];
 force_bits[5:0] = rand_tds_rv_bits[11:6]%37;
  rand_tds_rv_bits[11:6] = force_bits[5:0];
 force_bits[5:0] = rand_tds_rv_bits[17:12]%37;
  rand_tds_rv_bits[17:12] = force_bits[5:0];
 force_bits[5:0] = rand_tds_rv_bits[23:18]%37;
  rand_tds_rv_bits[23:18] = force_bits[5:0];

`ifndef GATESIM

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"NIU TDS REDUNDANCY_VALUE: %b", rand_tds_rv_bits);
 force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_data_reg = rand_tds_rv_bits[5:0];
  force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_en_reg = |(rand_tds_rv_bits[5:0]);
  force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_en_reg1 = |(rand_tds_rv_bits[5:0]);
 force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_data_reg = rand_tds_rv_bits[11:6];
  force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_en_reg = |(rand_tds_rv_bits[11:6]);
  force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_en_reg1 = |(rand_tds_rv_bits[11:6]);
 force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_data_reg = rand_tds_rv_bits[17:12];
  force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_en_reg = |(rand_tds_rv_bits[17:12]);
  force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_en_reg1 = |(rand_tds_rv_bits[17:12]);
 force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_data_reg = rand_tds_rv_bits[23:18];
  force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_en_reg = |(rand_tds_rv_bits[23:18]);
  force `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_en_reg1 = |(rand_tds_rv_bits[23:18]);
`endif

`endif //`ifndef NIU_SYSTEMC_T2
`endif //`ifndef FC_NO_NIU_T2

`ifndef GATESIM

  // DMU latency value bits (margin register)
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"DMU REDUNDANCY_VALUE: %b", rand_dmu_rv_bits);
 force `CPU.dmu.dmc.mmu.vaq.fuse = rand_dmu_rv_bits[3:0];
`endif

  // For l2d0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_TOP_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d0_tl_way07_00_rv_bits);
 force `CPU.l2d0.quad_top_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d0_tl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_tl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_top_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d0_tl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_tl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_top_left.way07_00.data_mux.red_even_0 = {|(rand_l2d0_tl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00, rand_l2d0_tl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_top_left.way07_00.data_mux.red_even_1 = {|(rand_l2d0_tl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_tl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_top_left.way07_00.data_mux.red_col_0 = {|(rand_l2d0_tl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_tl_way07_00_rv_bits[45:40]};
 force `CPU.l2d0.quad_top_left.way07_00.data_mux.red_col_1 = {|(rand_l2d0_tl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_tl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_TOP_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d0_tl_way158_00_rv_bits);
 force `CPU.l2d0.quad_top_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d0_tl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_top_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d0_tl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_top_left.way158_00.data_mux.red_even_0 = {|(rand_l2d0_tl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_top_left.way158_00.data_mux.red_even_1 = {|(rand_l2d0_tl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_top_left.way158_00.data_mux.red_col_0 = {|(rand_l2d0_tl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_00_rv_bits[45:40]};
 force `CPU.l2d0.quad_top_left.way158_00.data_mux.red_col_1 = {|(rand_l2d0_tl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_TOP_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d0_tl_way70_01_rv_bits);
 force `CPU.l2d0.quad_top_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d0_tl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_tl_way70_01_rv_bits[7:1],1'b0};
 force `CPU.l2d0.quad_top_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d0_tl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_tl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_top_left.way70_01.data_mux.red_even_0 = {|(rand_l2d0_tl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00, rand_l2d0_tl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_top_left.way70_01.data_mux.red_even_1 = {|(rand_l2d0_tl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_tl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_top_left.way70_01.data_mux.red_col_0 = {|(rand_l2d0_tl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_tl_way70_01_rv_bits[45:40]};
 force `CPU.l2d0.quad_top_left.way70_01.data_mux.red_col_1 = {|(rand_l2d0_tl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_tl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_TOP_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d0_tl_way158_01_rv_bits);
 force `CPU.l2d0.quad_top_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d0_tl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_top_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d0_tl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_top_left.way158_01.data_mux.red_even_0 = {|(rand_l2d0_tl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_top_left.way158_01.data_mux.red_even_1 = {|(rand_l2d0_tl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_top_left.way158_01.data_mux.red_col_0 = {|(rand_l2d0_tl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_01_rv_bits[45:40]};
 force `CPU.l2d0.quad_top_left.way158_01.data_mux.red_col_1 = {|(rand_l2d0_tl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_tl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_TOP_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d0_tr_way07_00_rv_bits);
 force `CPU.l2d0.quad_top_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d0_tr_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_tr_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_top_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d0_tr_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_tr_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_top_right.way07_00.data_mux.red_even_0 = {|(rand_l2d0_tr_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_tr_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_top_right.way07_00.data_mux.red_even_1 = {|(rand_l2d0_tr_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_tr_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_top_right.way07_00.data_mux.red_col_0 = {|(rand_l2d0_tr_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_tr_way07_00_rv_bits[45:40]};
 force `CPU.l2d0.quad_top_right.way07_00.data_mux.red_col_1 = {|(rand_l2d0_tr_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_tr_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d2_tr_way158_00_rv_bits);
 force `CPU.l2d0.quad_top_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d0_tr_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_top_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d0_tr_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_top_right.way158_00.data_mux.red_even_0 = {|(rand_l2d0_tr_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_top_right.way158_00.data_mux.red_even_1 = {|(rand_l2d0_tr_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_top_right.way158_00.data_mux.red_col_0 = {|(rand_l2d0_tr_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_00_rv_bits[45:40]};
 force `CPU.l2d0.quad_top_right.way158_00.data_mux.red_col_1 = {|(rand_l2d0_tr_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d2_tr_way70_01_rv_bits);
 force `CPU.l2d0.quad_top_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d0_tr_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_tr_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_top_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d0_tr_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_tr_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_top_right.way70_01.data_mux.red_even_0 = {|(rand_l2d0_tr_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_tr_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_top_right.way70_01.data_mux.red_even_1 = {|(rand_l2d0_tr_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_tr_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_top_right.way70_01.data_mux.red_col_0 = {|(rand_l2d0_tr_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_tr_way70_01_rv_bits[45:40]};
 force `CPU.l2d0.quad_top_right.way70_01.data_mux.red_col_1 = {|(rand_l2d0_tr_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_tr_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d2_tr_way158_01_rv_bits);
 force `CPU.l2d0.quad_top_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d0_tr_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_top_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d0_tr_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_top_right.way158_01.data_mux.red_even_0 = {|(rand_l2d0_tr_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_top_right.way158_01.data_mux.red_even_1 = {|(rand_l2d0_tr_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_top_right.way158_01.data_mux.red_col_0 = {|(rand_l2d0_tr_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_01_rv_bits[45:40]};
 force `CPU.l2d0.quad_top_right.way158_01.data_mux.red_col_1 = {|(rand_l2d0_tr_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_tr_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_BOTTOM_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d0_bl_way07_00_rv_bits);
 force `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d0_bl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_bl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d0_bl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_bl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_even_0 = {|(rand_l2d0_bl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_bl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_even_1 = {|(rand_l2d0_bl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_bl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_col_0 = {|(rand_l2d0_bl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_bl_way07_00_rv_bits[45:40]};
 force `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_col_1 = {|(rand_l2d0_bl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_bl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_BOTTOM_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d0_bl_way158_00_rv_bits);
 force `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d0_bl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d0_bl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_even_0 = {|(rand_l2d0_bl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_even_1 = {|(rand_l2d0_bl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_col_0 = {|(rand_l2d0_bl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_00_rv_bits[45:40]};
 force `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_col_1 = {|(rand_l2d0_bl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_BOTTOM_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d0_bl_way70_01_rv_bits);
 force `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d0_bl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_bl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d0_bl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_bl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_even_0 = {|(rand_l2d0_bl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_bl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_even_1 = {|(rand_l2d0_bl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_bl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_col_0 = {|(rand_l2d0_bl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_bl_way70_01_rv_bits[45:40]};
 force `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_col_1 = {|(rand_l2d0_bl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_bl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_BOTTOM_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d0_bl_way158_01_rv_bits);
 force `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d0_bl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d0_bl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_even_0 = {|(rand_l2d0_bl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_even_1 = {|(rand_l2d0_bl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_col_0 = {|(rand_l2d0_bl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_01_rv_bits[45:40]};
 force `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_col_1 = {|(rand_l2d0_bl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_bl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_BOTTOM_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d0_br_way07_00_rv_bits);
 force `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d0_br_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_br_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d0_br_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_br_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_even_0 = {|(rand_l2d0_br_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_br_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_even_1 = {|(rand_l2d0_br_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_br_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_col_0 = {|(rand_l2d0_br_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_br_way07_00_rv_bits[45:40]};
 force `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_col_1 = {|(rand_l2d0_br_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_br_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_BOTTOM_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d0_br_way158_00_rv_bits);
 force `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d0_br_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d0_br_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_even_0 = {|(rand_l2d0_br_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_even_1 = {|(rand_l2d0_br_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_col_0 = {|(rand_l2d0_br_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_00_rv_bits[45:40]};
 force `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_col_1 = {|(rand_l2d0_br_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_BOTTOM_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d0_br_way70_01_rv_bits);
 force `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d0_br_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_br_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d0_br_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_br_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_even_0 = {|(rand_l2d0_br_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_br_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_even_1 = {|(rand_l2d0_br_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_br_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_col_0 = {|(rand_l2d0_br_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_br_way70_01_rv_bits[45:40]};
 force `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_col_1 = {|(rand_l2d0_br_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_br_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D0_BOTTOM_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d0_br_way158_01_rv_bits);
 force `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d0_br_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d0_br_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_even_0 = {|(rand_l2d0_br_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_even_1 = {|(rand_l2d0_br_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_col_0 = {|(rand_l2d0_br_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_01_rv_bits[45:40]};
 force `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_col_1 = {|(rand_l2d0_br_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d0_br_way158_01_rv_bits[53:48]};

  // For l2d1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_TOP_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d1_tl_way07_00_rv_bits);
 force `CPU.l2d1.quad_top_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d1_tl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_tl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_top_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d1_tl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_tl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_top_left.way07_00.data_mux.red_even_0 = {|(rand_l2d1_tl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_tl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_top_left.way07_00.data_mux.red_even_1 = {|(rand_l2d1_tl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_tl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_top_left.way07_00.data_mux.red_col_0 = {|(rand_l2d1_tl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_tl_way07_00_rv_bits[45:40]};
 force `CPU.l2d1.quad_top_left.way07_00.data_mux.red_col_1 = {|(rand_l2d1_tl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_tl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_TOP_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d1_tl_way158_00_rv_bits);
 force `CPU.l2d1.quad_top_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d1_tl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_top_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d1_tl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_top_left.way158_00.data_mux.red_even_0 = {|(rand_l2d1_tl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_top_left.way158_00.data_mux.red_even_1 = {|(rand_l2d1_tl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_top_left.way158_00.data_mux.red_col_0 = {|(rand_l2d1_tl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_00_rv_bits[45:40]};
 force `CPU.l2d1.quad_top_left.way158_00.data_mux.red_col_1 = {|(rand_l2d1_tl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_TOP_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d1_tl_way70_01_rv_bits);
 force `CPU.l2d1.quad_top_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d1_tl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_tl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_top_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d1_tl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_tl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_top_left.way70_01.data_mux.red_even_0 = {|(rand_l2d1_tl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_tl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_top_left.way70_01.data_mux.red_even_1 = {|(rand_l2d1_tl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_tl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_top_left.way70_01.data_mux.red_col_0 = {|(rand_l2d1_tl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_tl_way70_01_rv_bits[45:40]};
 force `CPU.l2d1.quad_top_left.way70_01.data_mux.red_col_1 = {|(rand_l2d1_tl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_tl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_TOP_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d1_tl_way158_01_rv_bits);
 force `CPU.l2d1.quad_top_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d1_tl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_top_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d1_tl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_top_left.way158_01.data_mux.red_even_0 = {|(rand_l2d1_tl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_top_left.way158_01.data_mux.red_even_1 = {|(rand_l2d1_tl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_top_left.way158_01.data_mux.red_col_0 = {|(rand_l2d1_tl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_01_rv_bits[45:40]};
 force `CPU.l2d1.quad_top_left.way158_01.data_mux.red_col_1 = {|(rand_l2d1_tl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_tl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_TOP_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d1_tr_way07_00_rv_bits);
 force `CPU.l2d1.quad_top_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d1_tr_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_tr_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_top_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d1_tr_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_tr_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_top_right.way07_00.data_mux.red_even_0 = {|(rand_l2d1_tr_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_tr_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_top_right.way07_00.data_mux.red_even_1 = {|(rand_l2d1_tr_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_tr_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_top_right.way07_00.data_mux.red_col_0 = {|(rand_l2d1_tr_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_tr_way07_00_rv_bits[45:40]};
 force `CPU.l2d1.quad_top_right.way07_00.data_mux.red_col_1 = {|(rand_l2d1_tr_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_tr_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_TOP_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d1_tr_way158_00_rv_bits);
 force `CPU.l2d1.quad_top_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d1_tr_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_top_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d1_tr_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_top_right.way158_00.data_mux.red_even_0 = {|(rand_l2d1_tr_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_top_right.way158_00.data_mux.red_even_1 = {|(rand_l2d1_tr_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_top_right.way158_00.data_mux.red_col_0 = {|(rand_l2d1_tr_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_00_rv_bits[45:40]};
 force `CPU.l2d1.quad_top_right.way158_00.data_mux.red_col_1 = {|(rand_l2d1_tr_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_TOP_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d1_tr_way70_01_rv_bits);
 force `CPU.l2d1.quad_top_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d1_tr_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_tr_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_top_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d1_tr_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_tr_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_top_right.way70_01.data_mux.red_even_0 = {|(rand_l2d1_tr_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_tr_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_top_right.way70_01.data_mux.red_even_1 = {|(rand_l2d1_tr_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_tr_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_top_right.way70_01.data_mux.red_col_0 = {|(rand_l2d1_tr_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_tr_way70_01_rv_bits[45:40]};
 force `CPU.l2d1.quad_top_right.way70_01.data_mux.red_col_1 = {|(rand_l2d1_tr_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_tr_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_TOP_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d1_tr_way158_01_rv_bits);
 force `CPU.l2d1.quad_top_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d1_tr_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_top_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d1_tr_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_top_right.way158_01.data_mux.red_even_0 = {|(rand_l2d1_tr_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_top_right.way158_01.data_mux.red_even_1 = {|(rand_l2d1_tr_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_top_right.way158_01.data_mux.red_col_0 = {|(rand_l2d1_tr_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_01_rv_bits[45:40]};
 force `CPU.l2d1.quad_top_right.way158_01.data_mux.red_col_1 = {|(rand_l2d1_tr_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_tr_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_BOTTOM_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d1_bl_way07_00_rv_bits);
 force `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d1_bl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_bl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d1_bl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_bl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_even_0 = {|(rand_l2d1_bl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_bl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_even_1 = {|(rand_l2d1_bl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_bl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_col_0 = {|(rand_l2d1_bl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_bl_way07_00_rv_bits[45:40]};
 force `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_col_1 = {|(rand_l2d1_bl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_bl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_BOTTOM_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d1_bl_way158_00_rv_bits);
 force `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d1_bl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d1_bl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_even_0 = {|(rand_l2d1_bl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_even_1 = {|(rand_l2d1_bl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_col_0 = {|(rand_l2d1_bl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_00_rv_bits[45:40]};
 force `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_col_1 = {|(rand_l2d1_bl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_BOTTOM_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d1_bl_way70_01_rv_bits);
 force `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d1_bl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_bl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d1_bl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_bl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_even_0 = {|(rand_l2d1_bl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_bl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_even_1 = {|(rand_l2d1_bl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_bl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_col_0 = {|(rand_l2d1_bl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_bl_way70_01_rv_bits[45:40]};
 force `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_col_1 = {|(rand_l2d1_bl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_bl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_BOTTOM_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d1_bl_way158_01_rv_bits);
 force `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d1_bl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d1_bl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_even_0 = {|(rand_l2d1_bl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_even_1 = {|(rand_l2d1_bl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_col_0 = {|(rand_l2d1_bl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_01_rv_bits[45:40]};
 force `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_col_1 = {|(rand_l2d1_bl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_bl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_BOTTOM_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d1_br_way07_00_rv_bits);
 force `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d1_br_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_br_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d1_br_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_br_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_even_0 = {|(rand_l2d1_br_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_br_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_even_1 = {|(rand_l2d1_br_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_br_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_col_0 = {|(rand_l2d1_br_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_br_way07_00_rv_bits[45:40]};
 force `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_col_1 = {|(rand_l2d1_br_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_br_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_BOTTOM_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d1_br_way158_00_rv_bits);
 force `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d1_br_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d1_br_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_even_0 = {|(rand_l2d1_br_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_even_1 = {|(rand_l2d1_br_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_col_0 = {|(rand_l2d1_br_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_00_rv_bits[45:40]};
 force `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_col_1 = {|(rand_l2d1_br_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_BOTTOM_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d1_br_way70_01_rv_bits);
 force `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d1_br_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_br_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d1_br_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_br_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_even_0 = {|(rand_l2d1_br_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_br_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_even_1 = {|(rand_l2d1_br_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_br_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_col_0 = {|(rand_l2d1_br_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_br_way70_01_rv_bits[45:40]};
 force `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_col_1 = {|(rand_l2d1_br_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_br_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D1_BOTTOM_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d1_br_way158_01_rv_bits);
 force `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d1_br_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d1_br_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_even_0 = {|(rand_l2d1_br_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_even_1 = {|(rand_l2d1_br_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_col_0 = {|(rand_l2d1_br_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_01_rv_bits[45:40]};
 force `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_col_1 = {|(rand_l2d1_br_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d1_br_way158_01_rv_bits[53:48]};

  // For l2d2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d2_tl_way07_00_rv_bits);
 force `CPU.l2d2.quad_top_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d2_tl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_tl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_top_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d2_tl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_tl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_top_left.way07_00.data_mux.red_even_0 = {|(rand_l2d2_tl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_tl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_top_left.way07_00.data_mux.red_even_1 = {|(rand_l2d2_tl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_tl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_top_left.way07_00.data_mux.red_col_0 = {|(rand_l2d2_tl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_tl_way07_00_rv_bits[45:40]};
 force `CPU.l2d2.quad_top_left.way07_00.data_mux.red_col_1 = {|(rand_l2d2_tl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_tl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d2_tl_way158_00_rv_bits);
 force `CPU.l2d2.quad_top_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d2_tl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_top_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d2_tl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_top_left.way158_00.data_mux.red_even_0 = {|(rand_l2d2_tl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_top_left.way158_00.data_mux.red_even_1 = {|(rand_l2d2_tl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_top_left.way158_00.data_mux.red_col_0 = {|(rand_l2d2_tl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_00_rv_bits[45:40]};
 force `CPU.l2d2.quad_top_left.way158_00.data_mux.red_col_1 = {|(rand_l2d2_tl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d2_tl_way70_01_rv_bits);
 force `CPU.l2d2.quad_top_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d2_tl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_tl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_top_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d2_tl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_tl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_top_left.way70_01.data_mux.red_even_0 = {|(rand_l2d2_tl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_tl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_top_left.way70_01.data_mux.red_even_1 = {|(rand_l2d2_tl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_tl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_top_left.way70_01.data_mux.red_col_0 = {|(rand_l2d2_tl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_tl_way70_01_rv_bits[45:40]};
 force `CPU.l2d2.quad_top_left.way70_01.data_mux.red_col_1 = {|(rand_l2d2_tl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_tl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d2_tl_way158_01_rv_bits);
 force `CPU.l2d2.quad_top_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d2_tl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_top_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d2_tl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_top_left.way158_01.data_mux.red_even_0 = {|(rand_l2d2_tl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_top_left.way158_01.data_mux.red_even_1 = {|(rand_l2d2_tl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_top_left.way158_01.data_mux.red_col_0 = {|(rand_l2d2_tl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_01_rv_bits[45:40]};
 force `CPU.l2d2.quad_top_left.way158_01.data_mux.red_col_1 = {|(rand_l2d2_tl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_tl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d2_tr_way07_00_rv_bits);
 force `CPU.l2d2.quad_top_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d2_tr_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_tr_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_top_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d2_tr_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_tr_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_top_right.way07_00.data_mux.red_even_0 = {|(rand_l2d2_tr_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_tr_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_top_right.way07_00.data_mux.red_even_1 = {|(rand_l2d2_tr_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_tr_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_top_right.way07_00.data_mux.red_col_0 = {|(rand_l2d2_tr_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_tr_way07_00_rv_bits[45:40]};
 force `CPU.l2d2.quad_top_right.way07_00.data_mux.red_col_1 = {|(rand_l2d2_tr_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_tr_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d2_tr_way158_00_rv_bits);
 force `CPU.l2d2.quad_top_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d2_tr_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_top_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d2_tr_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_top_right.way158_00.data_mux.red_even_0 = {|(rand_l2d2_tr_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_top_right.way158_00.data_mux.red_even_1 = {|(rand_l2d2_tr_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_top_right.way158_00.data_mux.red_col_0 = {|(rand_l2d2_tr_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_00_rv_bits[45:40]};
 force `CPU.l2d2.quad_top_right.way158_00.data_mux.red_col_1 = {|(rand_l2d2_tr_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d2_tr_way70_01_rv_bits);
 force `CPU.l2d2.quad_top_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d2_tr_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_tr_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_top_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d2_tr_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_tr_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_top_right.way70_01.data_mux.red_even_0 = {|(rand_l2d2_tr_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_tr_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_top_right.way70_01.data_mux.red_even_1 = {|(rand_l2d2_tr_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_tr_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_top_right.way70_01.data_mux.red_col_0 = {|(rand_l2d2_tr_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_tr_way70_01_rv_bits[45:40]};
 force `CPU.l2d2.quad_top_right.way70_01.data_mux.red_col_1 = {|(rand_l2d2_tr_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_tr_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_TOP_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d2_tr_way158_01_rv_bits);
 force `CPU.l2d2.quad_top_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d2_tr_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_top_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d2_tr_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_top_right.way158_01.data_mux.red_even_0 = {|(rand_l2d2_tr_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_top_right.way158_01.data_mux.red_even_1 = {|(rand_l2d2_tr_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_top_right.way158_01.data_mux.red_col_0 = {|(rand_l2d2_tr_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_01_rv_bits[45:40]};
 force `CPU.l2d2.quad_top_right.way158_01.data_mux.red_col_1 = {|(rand_l2d2_tr_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_tr_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_BOTTOM_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d2_bl_way07_00_rv_bits);
 force `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d2_bl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_bl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d2_bl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_bl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_even_0 = {|(rand_l2d2_bl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_bl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_even_1 = {|(rand_l2d2_bl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_bl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_col_0 = {|(rand_l2d2_bl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_bl_way07_00_rv_bits[45:40]};
 force `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_col_1 = {|(rand_l2d2_bl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_bl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_BOTTOM_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d2_bl_way158_00_rv_bits);
 force `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d2_bl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d2_bl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_even_0 = {|(rand_l2d2_bl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_even_1 = {|(rand_l2d2_bl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_col_0 = {|(rand_l2d2_bl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_00_rv_bits[45:40]};
 force `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_col_1 = {|(rand_l2d2_bl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_BOTTOM_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d2_bl_way70_01_rv_bits);
 force `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d2_bl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_bl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d2_bl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_bl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_even_0 = {|(rand_l2d2_bl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_bl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_even_1 = {|(rand_l2d2_bl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_bl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_col_0 = {|(rand_l2d2_bl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_bl_way70_01_rv_bits[45:40]};
 force `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_col_1 = {|(rand_l2d2_bl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_bl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_BOTTOM_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d2_bl_way158_01_rv_bits);
 force `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d2_bl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d2_bl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_even_0 = {|(rand_l2d2_bl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_even_1 = {|(rand_l2d2_bl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_col_0 = {|(rand_l2d2_bl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_01_rv_bits[45:40]};
 force `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_col_1 = {|(rand_l2d2_bl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_bl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_BOTTOM_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d2_br_way07_00_rv_bits);
 force `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d2_br_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_br_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d2_br_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_br_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_even_0 = {|(rand_l2d2_br_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_br_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_even_1 = {|(rand_l2d2_br_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_br_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_col_0 = {|(rand_l2d2_br_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_br_way07_00_rv_bits[45:40]};
 force `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_col_1 = {|(rand_l2d2_br_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_br_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_BOTTOM_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d2_br_way158_00_rv_bits);
 force `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d2_br_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d2_br_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_even_0 = {|(rand_l2d2_br_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_even_1 = {|(rand_l2d2_br_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_col_0 = {|(rand_l2d2_br_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_00_rv_bits[45:40]};
 force `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_col_1 = {|(rand_l2d2_br_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_BOTTOM_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d2_br_way70_01_rv_bits);
 force `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d2_br_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_br_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d2_br_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_br_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_even_0 = {|(rand_l2d2_br_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_br_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_even_1 = {|(rand_l2d2_br_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_br_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_col_0 = {|(rand_l2d2_br_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_br_way70_01_rv_bits[45:40]};
 force `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_col_1 = {|(rand_l2d2_br_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_br_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D2_BOTTOM_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d2_br_way158_01_rv_bits);
 force `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d2_br_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d2_br_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_even_0 = {|(rand_l2d2_br_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_even_1 = {|(rand_l2d2_br_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_col_0 = {|(rand_l2d2_br_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_01_rv_bits[45:40]};
 force `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_col_1 = {|(rand_l2d2_br_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d2_br_way158_01_rv_bits[53:48]};

  // For l2d3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_TOP_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d3_tl_way07_00_rv_bits);
 force `CPU.l2d3.quad_top_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d3_tl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_tl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_top_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d3_tl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_tl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_top_left.way07_00.data_mux.red_even_0 = {|(rand_l2d3_tl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_tl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_top_left.way07_00.data_mux.red_even_1 = {|(rand_l2d3_tl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_tl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_top_left.way07_00.data_mux.red_col_0 = {|(rand_l2d3_tl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_tl_way07_00_rv_bits[45:40]};
 force `CPU.l2d3.quad_top_left.way07_00.data_mux.red_col_1 = {|(rand_l2d3_tl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_tl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_TOP_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d3_tl_way158_00_rv_bits);
 force `CPU.l2d3.quad_top_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d3_tl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_top_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d3_tl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_top_left.way158_00.data_mux.red_even_0 = {|(rand_l2d3_tl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_top_left.way158_00.data_mux.red_even_1 = {|(rand_l2d3_tl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_top_left.way158_00.data_mux.red_col_0 = {|(rand_l2d3_tl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_00_rv_bits[45:40]};
 force `CPU.l2d3.quad_top_left.way158_00.data_mux.red_col_1 = {|(rand_l2d3_tl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_TOP_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d3_tl_way70_01_rv_bits);
 force `CPU.l2d3.quad_top_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d3_tl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_tl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_top_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d3_tl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_tl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_top_left.way70_01.data_mux.red_even_0 = {|(rand_l2d3_tl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_tl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_top_left.way70_01.data_mux.red_even_1 = {|(rand_l2d3_tl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_tl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_top_left.way70_01.data_mux.red_col_0 = {|(rand_l2d3_tl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_tl_way70_01_rv_bits[45:40]};
 force `CPU.l2d3.quad_top_left.way70_01.data_mux.red_col_1 = {|(rand_l2d3_tl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_tl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_TOP_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d3_tl_way158_01_rv_bits);
 force `CPU.l2d3.quad_top_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d3_tl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_top_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d3_tl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_top_left.way158_01.data_mux.red_even_0 = {|(rand_l2d3_tl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_top_left.way158_01.data_mux.red_even_1 = {|(rand_l2d3_tl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_top_left.way158_01.data_mux.red_col_0 = {|(rand_l2d3_tl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_01_rv_bits[45:40]};
 force `CPU.l2d3.quad_top_left.way158_01.data_mux.red_col_1 = {|(rand_l2d3_tl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_tl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_TOP_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d3_tr_way07_00_rv_bits);
 force `CPU.l2d3.quad_top_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d3_tr_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_tr_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_top_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d3_tr_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_tr_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_top_right.way07_00.data_mux.red_even_0 = {|(rand_l2d3_tr_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_tr_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_top_right.way07_00.data_mux.red_even_1 = {|(rand_l2d3_tr_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_tr_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_top_right.way07_00.data_mux.red_col_0 = {|(rand_l2d3_tr_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_tr_way07_00_rv_bits[45:40]};
 force `CPU.l2d3.quad_top_right.way07_00.data_mux.red_col_1 = {|(rand_l2d3_tr_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_tr_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_TOP_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d3_tr_way158_00_rv_bits);
 force `CPU.l2d3.quad_top_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d3_tr_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_top_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d3_tr_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_top_right.way158_00.data_mux.red_even_0 = {|(rand_l2d3_tr_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_top_right.way158_00.data_mux.red_even_1 = {|(rand_l2d3_tr_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_top_right.way158_00.data_mux.red_col_0 = {|(rand_l2d3_tr_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_00_rv_bits[45:40]};
 force `CPU.l2d3.quad_top_right.way158_00.data_mux.red_col_1 = {|(rand_l2d3_tr_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_TOP_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d3_tr_way70_01_rv_bits);
 force `CPU.l2d3.quad_top_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d3_tr_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_tr_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_top_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d3_tr_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_tr_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_top_right.way70_01.data_mux.red_even_0 = {|(rand_l2d3_tr_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_tr_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_top_right.way70_01.data_mux.red_even_1 = {|(rand_l2d3_tr_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_tr_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_top_right.way70_01.data_mux.red_col_0 = {|(rand_l2d3_tr_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_tr_way70_01_rv_bits[45:40]};
 force `CPU.l2d3.quad_top_right.way70_01.data_mux.red_col_1 = {|(rand_l2d3_tr_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_tr_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_TOP_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d3_tr_way158_01_rv_bits);
 force `CPU.l2d3.quad_top_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d3_tr_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_top_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d3_tr_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_top_right.way158_01.data_mux.red_even_0 = {|(rand_l2d3_tr_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_top_right.way158_01.data_mux.red_even_1 = {|(rand_l2d3_tr_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_top_right.way158_01.data_mux.red_col_0 = {|(rand_l2d3_tr_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_01_rv_bits[45:40]};
 force `CPU.l2d3.quad_top_right.way158_01.data_mux.red_col_1 = {|(rand_l2d3_tr_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_tr_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_BOTTOM_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d3_bl_way07_00_rv_bits);
 force `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d3_bl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_bl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d3_bl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_bl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_even_0 = {|(rand_l2d3_bl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_bl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_even_1 = {|(rand_l2d3_bl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_bl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_col_0 = {|(rand_l2d3_bl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_bl_way07_00_rv_bits[45:40]};
 force `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_col_1 = {|(rand_l2d3_bl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_bl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_BOTTOM_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d3_bl_way158_00_rv_bits);
 force `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d3_bl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d3_bl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_even_0 = {|(rand_l2d3_bl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_even_1 = {|(rand_l2d3_bl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_col_0 = {|(rand_l2d3_bl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_00_rv_bits[45:40]};
 force `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_col_1 = {|(rand_l2d3_bl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_BOTTOM_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d3_bl_way70_01_rv_bits);
 force `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d3_bl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_bl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d3_bl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_bl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_even_0 = {|(rand_l2d3_bl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_bl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_even_1 = {|(rand_l2d3_bl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_bl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_col_0 = {|(rand_l2d3_bl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_bl_way70_01_rv_bits[45:40]};
 force `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_col_1 = {|(rand_l2d3_bl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_bl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_BOTTOM_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d3_bl_way158_01_rv_bits);
 force `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d3_bl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d3_bl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_even_0 = {|(rand_l2d3_bl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_even_1 = {|(rand_l2d3_bl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_col_0 = {|(rand_l2d3_bl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_01_rv_bits[45:40]};
 force `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_col_1 = {|(rand_l2d3_bl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_bl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_BOTTOM_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d3_br_way07_00_rv_bits);
 force `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d3_br_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_br_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d3_br_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_br_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_even_0 = {|(rand_l2d3_br_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_br_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_even_1 = {|(rand_l2d3_br_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_br_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_col_0 = {|(rand_l2d3_br_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_br_way07_00_rv_bits[45:40]};
 force `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_col_1 = {|(rand_l2d3_br_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_br_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_BOTTOM_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d3_br_way158_00_rv_bits);
 force `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d3_br_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d3_br_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_even_0 = {|(rand_l2d3_br_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_even_1 = {|(rand_l2d3_br_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_col_0 = {|(rand_l2d3_br_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_00_rv_bits[45:40]};
 force `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_col_1 = {|(rand_l2d3_br_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_BOTTOM_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d3_br_way70_01_rv_bits);
 force `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d3_br_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_br_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d3_br_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_br_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_even_0 = {|(rand_l2d3_br_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_br_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_even_1 = {|(rand_l2d3_br_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_br_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_col_0 = {|(rand_l2d3_br_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_br_way70_01_rv_bits[45:40]};
 force `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_col_1 = {|(rand_l2d3_br_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_br_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D3_BOTTOM_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d3_br_way158_01_rv_bits);
 force `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d3_br_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d3_br_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_even_0 = {|(rand_l2d3_br_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_even_1 = {|(rand_l2d3_br_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_col_0 = {|(rand_l2d3_br_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_01_rv_bits[45:40]};
 force `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_col_1 = {|(rand_l2d3_br_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d3_br_way158_01_rv_bits[53:48]};

  // For l2d4
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_TOP_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d4_tl_way07_00_rv_bits);
 force `CPU.l2d4.quad_top_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d4_tl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_tl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_top_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d4_tl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_tl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_top_left.way07_00.data_mux.red_even_0 = {|(rand_l2d4_tl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_tl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_top_left.way07_00.data_mux.red_even_1 = {|(rand_l2d4_tl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_tl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_top_left.way07_00.data_mux.red_col_0 = {|(rand_l2d4_tl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_tl_way07_00_rv_bits[45:40]};
 force `CPU.l2d4.quad_top_left.way07_00.data_mux.red_col_1 = {|(rand_l2d4_tl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_tl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_TOP_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d4_tl_way158_00_rv_bits);
 force `CPU.l2d4.quad_top_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d4_tl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_top_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d4_tl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_top_left.way158_00.data_mux.red_even_0 = {|(rand_l2d4_tl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_top_left.way158_00.data_mux.red_even_1 = {|(rand_l2d4_tl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_top_left.way158_00.data_mux.red_col_0 = {|(rand_l2d4_tl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_00_rv_bits[45:40]};
 force `CPU.l2d4.quad_top_left.way158_00.data_mux.red_col_1 = {|(rand_l2d4_tl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_TOP_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d4_tl_way70_01_rv_bits);
 force `CPU.l2d4.quad_top_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d4_tl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_tl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_top_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d4_tl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_tl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_top_left.way70_01.data_mux.red_even_0 = {|(rand_l2d4_tl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_tl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_top_left.way70_01.data_mux.red_even_1 = {|(rand_l2d4_tl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_tl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_top_left.way70_01.data_mux.red_col_0 = {|(rand_l2d4_tl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_tl_way70_01_rv_bits[45:40]};
 force `CPU.l2d4.quad_top_left.way70_01.data_mux.red_col_1 = {|(rand_l2d4_tl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_tl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_TOP_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d4_tl_way158_01_rv_bits);
 force `CPU.l2d4.quad_top_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d4_tl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_top_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d4_tl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_top_left.way158_01.data_mux.red_even_0 = {|(rand_l2d4_tl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_top_left.way158_01.data_mux.red_even_1 = {|(rand_l2d4_tl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_top_left.way158_01.data_mux.red_col_0 = {|(rand_l2d4_tl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_01_rv_bits[45:40]};
 force `CPU.l2d4.quad_top_left.way158_01.data_mux.red_col_1 = {|(rand_l2d4_tl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_tl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_TOP_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d4_tr_way07_00_rv_bits);
 force `CPU.l2d4.quad_top_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d4_tr_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_tr_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_top_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d4_tr_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_tr_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_top_right.way07_00.data_mux.red_even_0 = {|(rand_l2d4_tr_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_tr_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_top_right.way07_00.data_mux.red_even_1 = {|(rand_l2d4_tr_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_tr_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_top_right.way07_00.data_mux.red_col_0 = {|(rand_l2d4_tr_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_tr_way07_00_rv_bits[45:40]};
 force `CPU.l2d4.quad_top_right.way07_00.data_mux.red_col_1 = {|(rand_l2d4_tr_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_tr_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_TOP_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d4_tr_way158_00_rv_bits);
 force `CPU.l2d4.quad_top_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d4_tr_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_top_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d4_tr_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_top_right.way158_00.data_mux.red_even_0 = {|(rand_l2d4_tr_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_top_right.way158_00.data_mux.red_even_1 = {|(rand_l2d4_tr_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_top_right.way158_00.data_mux.red_col_0 = {|(rand_l2d4_tr_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_00_rv_bits[45:40]};
 force `CPU.l2d4.quad_top_right.way158_00.data_mux.red_col_1 = {|(rand_l2d4_tr_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_TOP_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d4_tr_way70_01_rv_bits);
 force `CPU.l2d4.quad_top_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d4_tr_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_tr_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_top_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d4_tr_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_tr_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_top_right.way70_01.data_mux.red_even_0 = {|(rand_l2d4_tr_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_tr_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_top_right.way70_01.data_mux.red_even_1 = {|(rand_l2d4_tr_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_tr_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_top_right.way70_01.data_mux.red_col_0 = {|(rand_l2d4_tr_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_tr_way70_01_rv_bits[45:40]};
 force `CPU.l2d4.quad_top_right.way70_01.data_mux.red_col_1 = {|(rand_l2d4_tr_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_tr_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_TOP_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d4_tr_way158_01_rv_bits);
 force `CPU.l2d4.quad_top_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d4_tr_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_top_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d4_tr_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_top_right.way158_01.data_mux.red_even_0 = {|(rand_l2d4_tr_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_top_right.way158_01.data_mux.red_even_1 = {|(rand_l2d4_tr_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_top_right.way158_01.data_mux.red_col_0 = {|(rand_l2d4_tr_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_01_rv_bits[45:40]};
 force `CPU.l2d4.quad_top_right.way158_01.data_mux.red_col_1 = {|(rand_l2d4_tr_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_tr_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_BOTTOM_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d4_bl_way07_00_rv_bits);
 force `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d4_bl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_bl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d4_bl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_bl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_even_0 = {|(rand_l2d4_bl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_bl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_even_1 = {|(rand_l2d4_bl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_bl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_col_0 = {|(rand_l2d4_bl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_bl_way07_00_rv_bits[45:40]};
 force `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_col_1 = {|(rand_l2d4_bl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_bl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_BOTTOM_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d4_bl_way158_00_rv_bits);
 force `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d4_bl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d4_bl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_even_0 = {|(rand_l2d4_bl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_even_1 = {|(rand_l2d4_bl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_col_0 = {|(rand_l2d4_bl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_00_rv_bits[45:40]};
 force `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_col_1 = {|(rand_l2d4_bl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_BOTTOM_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d4_bl_way70_01_rv_bits);
 force `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d4_bl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_bl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d4_bl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_bl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_even_0 = {|(rand_l2d4_bl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_bl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_even_1 = {|(rand_l2d4_bl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_bl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_col_0 = {|(rand_l2d4_bl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_bl_way70_01_rv_bits[45:40]};
 force `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_col_1 = {|(rand_l2d4_bl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_bl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_BOTTOM_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d4_bl_way158_01_rv_bits);
 force `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d4_bl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d4_bl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_even_0 = {|(rand_l2d4_bl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_even_1 = {|(rand_l2d4_bl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_col_0 = {|(rand_l2d4_bl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_01_rv_bits[45:40]};
 force `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_col_1 = {|(rand_l2d4_bl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_bl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_BOTTOM_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d4_br_way07_00_rv_bits);
 force `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d4_br_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_br_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d4_br_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_br_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_even_0 = {|(rand_l2d4_br_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_br_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_even_1 = {|(rand_l2d4_br_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_br_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_col_0 = {|(rand_l2d4_br_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_br_way07_00_rv_bits[45:40]};
 force `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_col_1 = {|(rand_l2d4_br_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_br_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_TOP_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d4_tr_way158_00_rv_bits);
 force `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d4_br_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d4_br_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_even_0 = {|(rand_l2d4_br_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_even_1 = {|(rand_l2d4_br_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_col_0 = {|(rand_l2d4_br_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_00_rv_bits[45:40]};
 force `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_col_1 = {|(rand_l2d4_br_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_BOTTOM_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d4_br_way70_01_rv_bits);
 force `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d4_br_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_br_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d4_br_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_br_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_even_0 = {|(rand_l2d4_br_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_br_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_even_1 = {|(rand_l2d4_br_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_br_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_col_0 = {|(rand_l2d4_br_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_br_way70_01_rv_bits[45:40]};
 force `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_col_1 = {|(rand_l2d4_br_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_br_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D4_BOTTOM_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d4_br_way158_01_rv_bits);
 force `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d4_br_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d4_br_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_even_0 = {|(rand_l2d4_br_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_even_1 = {|(rand_l2d4_br_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_col_0 = {|(rand_l2d4_br_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_01_rv_bits[45:40]};
 force `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_col_1 = {|(rand_l2d4_br_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d4_br_way158_01_rv_bits[53:48]};

  // For l2d5
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_TOP_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d5_tl_way07_00_rv_bits);
 force `CPU.l2d5.quad_top_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d5_tl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_tl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_top_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d5_tl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_tl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_top_left.way07_00.data_mux.red_even_0 = {|(rand_l2d5_tl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_tl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_top_left.way07_00.data_mux.red_even_1 = {|(rand_l2d5_tl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_tl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_top_left.way07_00.data_mux.red_col_0 = {|(rand_l2d5_tl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_tl_way07_00_rv_bits[45:40]};
 force `CPU.l2d5.quad_top_left.way07_00.data_mux.red_col_1 = {|(rand_l2d5_tl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_tl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_TOP_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d5_tl_way158_00_rv_bits);
 force `CPU.l2d5.quad_top_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d5_tl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_top_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d5_tl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_top_left.way158_00.data_mux.red_even_0 = {|(rand_l2d5_tl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_top_left.way158_00.data_mux.red_even_1 = {|(rand_l2d5_tl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_top_left.way158_00.data_mux.red_col_0 = {|(rand_l2d5_tl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_00_rv_bits[45:40]};
 force `CPU.l2d5.quad_top_left.way158_00.data_mux.red_col_1 = {|(rand_l2d5_tl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_TOP_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d5_tl_way70_01_rv_bits);
 force `CPU.l2d5.quad_top_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d5_tl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_tl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_top_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d5_tl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_tl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_top_left.way70_01.data_mux.red_even_0 = {|(rand_l2d5_tl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_tl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_top_left.way70_01.data_mux.red_even_1 = {|(rand_l2d5_tl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_tl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_top_left.way70_01.data_mux.red_col_0 = {|(rand_l2d5_tl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_tl_way70_01_rv_bits[45:40]};
 force `CPU.l2d5.quad_top_left.way70_01.data_mux.red_col_1 = {|(rand_l2d5_tl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_tl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_TOP_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d5_tl_way158_01_rv_bits);
 force `CPU.l2d5.quad_top_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d5_tl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_top_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d5_tl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_top_left.way158_01.data_mux.red_even_0 = {|(rand_l2d5_tl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_top_left.way158_01.data_mux.red_even_1 = {|(rand_l2d5_tl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_top_left.way158_01.data_mux.red_col_0 = {|(rand_l2d5_tl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_01_rv_bits[45:40]};
 force `CPU.l2d5.quad_top_left.way158_01.data_mux.red_col_1 = {|(rand_l2d5_tl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_tl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_TOP_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d5_tr_way07_00_rv_bits);
 force `CPU.l2d5.quad_top_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d5_tr_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_tr_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_top_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d5_tr_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_tr_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_top_right.way07_00.data_mux.red_even_0 = {|(rand_l2d5_tr_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_tr_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_top_right.way07_00.data_mux.red_even_1 = {|(rand_l2d5_tr_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_tr_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_top_right.way07_00.data_mux.red_col_0 = {|(rand_l2d5_tr_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_tr_way07_00_rv_bits[45:40]};
 force `CPU.l2d5.quad_top_right.way07_00.data_mux.red_col_1 = {|(rand_l2d5_tr_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_tr_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_TOP_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d5_tr_way158_00_rv_bits);
 force `CPU.l2d5.quad_top_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d5_tr_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_top_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d5_tr_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_top_right.way158_00.data_mux.red_even_0 = {|(rand_l2d5_tr_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_top_right.way158_00.data_mux.red_even_1 = {|(rand_l2d5_tr_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_top_right.way158_00.data_mux.red_col_0 = {|(rand_l2d5_tr_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_00_rv_bits[45:40]};
 force `CPU.l2d5.quad_top_right.way158_00.data_mux.red_col_1 = {|(rand_l2d5_tr_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_TOP_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d5_tr_way70_01_rv_bits);
 force `CPU.l2d5.quad_top_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d5_tr_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_tr_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_top_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d5_tr_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_tr_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_top_right.way70_01.data_mux.red_even_0 = {|(rand_l2d5_tr_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_tr_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_top_right.way70_01.data_mux.red_even_1 = {|(rand_l2d5_tr_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_tr_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_top_right.way70_01.data_mux.red_col_0 = {|(rand_l2d5_tr_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_tr_way70_01_rv_bits[45:40]};
 force `CPU.l2d5.quad_top_right.way70_01.data_mux.red_col_1 = {|(rand_l2d5_tr_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_tr_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_TOP_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d5_tr_way158_01_rv_bits);
 force `CPU.l2d5.quad_top_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d5_tr_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_top_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d5_tr_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_top_right.way158_01.data_mux.red_even_0 = {|(rand_l2d5_tr_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_top_right.way158_01.data_mux.red_even_1 = {|(rand_l2d5_tr_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_top_right.way158_01.data_mux.red_col_0 = {|(rand_l2d5_tr_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_01_rv_bits[45:40]};
 force `CPU.l2d5.quad_top_right.way158_01.data_mux.red_col_1 = {|(rand_l2d5_tr_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_tr_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_BOTTOM_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d5_bl_way07_00_rv_bits);
 force `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d5_bl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_bl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d5_bl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_bl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_even_0 = {|(rand_l2d5_bl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_bl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_even_1 = {|(rand_l2d5_bl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_bl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_col_0 = {|(rand_l2d5_bl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_bl_way07_00_rv_bits[45:40]};
 force `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_col_1 = {|(rand_l2d5_bl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_bl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_BOTTOM_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d5_bl_way158_00_rv_bits);
 force `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d5_bl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d5_bl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_even_0 = {|(rand_l2d5_bl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_even_1 = {|(rand_l2d5_bl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_col_0 = {|(rand_l2d5_bl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_00_rv_bits[45:40]};
 force `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_col_1 = {|(rand_l2d5_bl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_BOTTOM_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d5_bl_way70_01_rv_bits);
 force `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d5_bl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_bl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d5_bl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_bl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_even_0 = {|(rand_l2d5_bl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_bl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_even_1 = {|(rand_l2d5_bl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_bl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_col_0 = {|(rand_l2d5_bl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_bl_way70_01_rv_bits[45:40]};
 force `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_col_1 = {|(rand_l2d5_bl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_bl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_BOTTOM_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d5_bl_way158_01_rv_bits);
 force `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d5_bl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d5_bl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_even_0 = {|(rand_l2d5_bl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_even_1 = {|(rand_l2d5_bl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_col_0 = {|(rand_l2d5_bl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_01_rv_bits[45:40]};
 force `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_col_1 = {|(rand_l2d5_bl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_bl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_BOTTOM_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d5_br_way07_00_rv_bits);
 force `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d5_br_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_br_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d5_br_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_br_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_even_0 = {|(rand_l2d5_br_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_br_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_even_1 = {|(rand_l2d5_br_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_br_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_col_0 = {|(rand_l2d5_br_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_br_way07_00_rv_bits[45:40]};
 force `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_col_1 = {|(rand_l2d5_br_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_br_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_BOTTOM_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d5_br_way158_00_rv_bits);
 force `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d5_br_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d5_br_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_even_0 = {|(rand_l2d5_br_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_even_1 = {|(rand_l2d5_br_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_col_0 = {|(rand_l2d5_br_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_00_rv_bits[45:40]};
 force `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_col_1 = {|(rand_l2d5_br_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_BOTTOM_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d5_br_way70_01_rv_bits);
 force `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d5_br_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_br_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d5_br_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_br_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_even_0 = {|(rand_l2d5_br_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_br_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_even_1 = {|(rand_l2d5_br_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_br_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_col_0 = {|(rand_l2d5_br_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_br_way70_01_rv_bits[45:40]};
 force `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_col_1 = {|(rand_l2d5_br_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_br_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D5_BOTTOM_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d5_br_way158_01_rv_bits);
 force `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d5_br_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d5_br_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_even_0 = {|(rand_l2d5_br_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_even_1 = {|(rand_l2d5_br_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_col_0 = {|(rand_l2d5_br_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_01_rv_bits[45:40]};
 force `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_col_1 = {|(rand_l2d5_br_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d5_br_way158_01_rv_bits[53:48]};

  // For l2d6
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_TOP_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d6_tl_way07_00_rv_bits);
 force `CPU.l2d6.quad_top_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d6_tl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_tl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_top_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d6_tl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_tl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_top_left.way07_00.data_mux.red_even_0 = {|(rand_l2d6_tl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_tl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_top_left.way07_00.data_mux.red_even_1 = {|(rand_l2d6_tl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_tl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_top_left.way07_00.data_mux.red_col_0 = {|(rand_l2d6_tl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_tl_way07_00_rv_bits[45:40]};
 force `CPU.l2d6.quad_top_left.way07_00.data_mux.red_col_1 = {|(rand_l2d6_tl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_tl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_TOP_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d6_tl_way158_00_rv_bits);
 force `CPU.l2d6.quad_top_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d6_tl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_top_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d6_tl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_top_left.way158_00.data_mux.red_even_0 = {|(rand_l2d6_tl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_top_left.way158_00.data_mux.red_even_1 = {|(rand_l2d6_tl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_top_left.way158_00.data_mux.red_col_0 = {|(rand_l2d6_tl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_00_rv_bits[45:40]};
 force `CPU.l2d6.quad_top_left.way158_00.data_mux.red_col_1 = {|(rand_l2d6_tl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_TOP_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d6_tl_way70_01_rv_bits);
 force `CPU.l2d6.quad_top_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d6_tl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_tl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_top_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d6_tl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_tl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_top_left.way70_01.data_mux.red_even_0 = {|(rand_l2d6_tl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_tl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_top_left.way70_01.data_mux.red_even_1 = {|(rand_l2d6_tl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_tl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_top_left.way70_01.data_mux.red_col_0 = {|(rand_l2d6_tl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_tl_way70_01_rv_bits[45:40]};
 force `CPU.l2d6.quad_top_left.way70_01.data_mux.red_col_1 = {|(rand_l2d6_tl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_tl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_TOP_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d6_tl_way158_01_rv_bits);
 force `CPU.l2d6.quad_top_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d6_tl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_top_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d6_tl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_top_left.way158_01.data_mux.red_even_0 = {|(rand_l2d6_tl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_top_left.way158_01.data_mux.red_even_1 = {|(rand_l2d6_tl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_top_left.way158_01.data_mux.red_col_0 = {|(rand_l2d6_tl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_01_rv_bits[45:40]};
 force `CPU.l2d6.quad_top_left.way158_01.data_mux.red_col_1 = {|(rand_l2d6_tl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_tl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_TOP_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d6_tr_way07_00_rv_bits);
 force `CPU.l2d6.quad_top_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d6_tr_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_tr_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_top_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d6_tr_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_tr_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_top_right.way07_00.data_mux.red_even_0 = {|(rand_l2d6_tr_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_tr_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_top_right.way07_00.data_mux.red_even_1 = {|(rand_l2d6_tr_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_tr_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_top_right.way07_00.data_mux.red_col_0 = {|(rand_l2d6_tr_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_tr_way07_00_rv_bits[45:40]};
 force `CPU.l2d6.quad_top_right.way07_00.data_mux.red_col_1 = {|(rand_l2d6_tr_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_tr_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_TOP_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d6_tr_way158_00_rv_bits);
 force `CPU.l2d6.quad_top_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d6_tr_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_top_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d6_tr_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_top_right.way158_00.data_mux.red_even_0 = {|(rand_l2d6_tr_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_top_right.way158_00.data_mux.red_even_1 = {|(rand_l2d6_tr_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_top_right.way158_00.data_mux.red_col_0 = {|(rand_l2d6_tr_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_00_rv_bits[45:40]};
 force `CPU.l2d6.quad_top_right.way158_00.data_mux.red_col_1 = {|(rand_l2d6_tr_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_TOP_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d6_tr_way70_01_rv_bits);
 force `CPU.l2d6.quad_top_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d6_tr_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_tr_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_top_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d6_tr_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_tr_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_top_right.way70_01.data_mux.red_even_0 = {|(rand_l2d6_tr_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_tr_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_top_right.way70_01.data_mux.red_even_1 = {|(rand_l2d6_tr_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_tr_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_top_right.way70_01.data_mux.red_col_0 = {|(rand_l2d6_tr_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_tr_way70_01_rv_bits[45:40]};
 force `CPU.l2d6.quad_top_right.way70_01.data_mux.red_col_1 = {|(rand_l2d6_tr_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_tr_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_TOP_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d6_tr_way158_01_rv_bits);
 force `CPU.l2d6.quad_top_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d6_tr_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_top_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d6_tr_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_top_right.way158_01.data_mux.red_even_0 = {|(rand_l2d6_tr_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_top_right.way158_01.data_mux.red_even_1 = {|(rand_l2d6_tr_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_top_right.way158_01.data_mux.red_col_0 = {|(rand_l2d6_tr_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_01_rv_bits[45:40]};
 force `CPU.l2d6.quad_top_right.way158_01.data_mux.red_col_1 = {|(rand_l2d6_tr_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_tr_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_BOTTOM_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d6_bl_way07_00_rv_bits);
 force `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d6_bl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_bl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d6_bl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_bl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_even_0 = {|(rand_l2d6_bl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_bl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_even_1 = {|(rand_l2d6_bl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_bl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_col_0 = {|(rand_l2d6_bl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_bl_way07_00_rv_bits[45:40]};
 force `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_col_1 = {|(rand_l2d6_bl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_bl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_BOTTOM_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d6_bl_way158_00_rv_bits);
 force `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d6_bl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d6_bl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_even_0 = {|(rand_l2d6_bl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_even_1 = {|(rand_l2d6_bl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_col_0 = {|(rand_l2d6_bl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_00_rv_bits[45:40]};
 force `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_col_1 = {|(rand_l2d6_bl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_BOTTOM_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d6_bl_way70_01_rv_bits);
 force `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d6_bl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_bl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d6_bl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_bl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_even_0 = {|(rand_l2d6_bl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_bl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_even_1 = {|(rand_l2d6_bl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_bl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_col_0 = {|(rand_l2d6_bl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_bl_way70_01_rv_bits[45:40]};
 force `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_col_1 = {|(rand_l2d6_bl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_bl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_BOTTOM_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d6_bl_way158_01_rv_bits);
 force `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d6_bl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d6_bl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_even_0 = {|(rand_l2d6_bl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_even_1 = {|(rand_l2d6_bl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_col_0 = {|(rand_l2d6_bl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_01_rv_bits[45:40]};
 force `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_col_1 = {|(rand_l2d6_bl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_bl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_BOTTOM_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d6_br_way07_00_rv_bits);
 force `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d6_br_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_br_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d6_br_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_br_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_even_0 = {|(rand_l2d6_br_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_br_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_even_1 = {|(rand_l2d6_br_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_br_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_col_0 = {|(rand_l2d6_br_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_br_way07_00_rv_bits[45:40]};
 force `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_col_1 = {|(rand_l2d6_br_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_br_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_BOTTOM_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d6_br_way158_00_rv_bits);
 force `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d6_br_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d6_br_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_even_0 = {|(rand_l2d6_br_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_even_1 = {|(rand_l2d6_br_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_col_0 = {|(rand_l2d6_br_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_00_rv_bits[45:40]};
 force `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_col_1 = {|(rand_l2d6_br_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_BOTTOM_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d6_br_way70_01_rv_bits);
 force `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d6_br_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_br_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d6_br_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_br_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_even_0 = {|(rand_l2d6_br_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_br_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_even_1 = {|(rand_l2d6_br_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_br_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_col_0 = {|(rand_l2d6_br_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_br_way70_01_rv_bits[45:40]};
 force `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_col_1 = {|(rand_l2d6_br_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_br_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D6_BOTTOM_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d6_br_way158_01_rv_bits);
 force `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d6_br_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d6_br_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_even_0 = {|(rand_l2d6_br_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_even_1 = {|(rand_l2d6_br_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_col_0 = {|(rand_l2d6_br_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_01_rv_bits[45:40]};
 force `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_col_1 = {|(rand_l2d6_br_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d6_br_way158_01_rv_bits[53:48]};

  // For l2d7
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_TOP_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d7_tl_way07_00_rv_bits);
 force `CPU.l2d7.quad_top_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d7_tl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_tl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_top_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d7_tl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_tl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_top_left.way07_00.data_mux.red_even_0 = {|(rand_l2d7_tl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_tl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_top_left.way07_00.data_mux.red_even_1 = {|(rand_l2d7_tl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_tl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_top_left.way07_00.data_mux.red_col_0 = {|(rand_l2d7_tl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_tl_way07_00_rv_bits[45:40]};
 force `CPU.l2d7.quad_top_left.way07_00.data_mux.red_col_1 = {|(rand_l2d7_tl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_tl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_TOP_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d7_tl_way158_00_rv_bits);
 force `CPU.l2d7.quad_top_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d7_tl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_top_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d7_tl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_top_left.way158_00.data_mux.red_even_0 = {|(rand_l2d7_tl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_top_left.way158_00.data_mux.red_even_1 = {|(rand_l2d7_tl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_top_left.way158_00.data_mux.red_col_0 = {|(rand_l2d7_tl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_00_rv_bits[45:40]};
 force `CPU.l2d7.quad_top_left.way158_00.data_mux.red_col_1 = {|(rand_l2d7_tl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_TOP_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d7_tl_way70_01_rv_bits);
 force `CPU.l2d7.quad_top_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d7_tl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_tl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_top_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d7_tl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_tl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_top_left.way70_01.data_mux.red_even_0 = {|(rand_l2d7_tl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_tl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_top_left.way70_01.data_mux.red_even_1 = {|(rand_l2d7_tl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_tl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_top_left.way70_01.data_mux.red_col_0 = {|(rand_l2d7_tl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_tl_way70_01_rv_bits[45:40]};
 force `CPU.l2d7.quad_top_left.way70_01.data_mux.red_col_1 = {|(rand_l2d7_tl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_tl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_TOP_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d7_tl_way158_01_rv_bits);
 force `CPU.l2d7.quad_top_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d7_tl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_top_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d7_tl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_top_left.way158_01.data_mux.red_even_0 = {|(rand_l2d7_tl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_top_left.way158_01.data_mux.red_even_1 = {|(rand_l2d7_tl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_top_left.way158_01.data_mux.red_col_0 = {|(rand_l2d7_tl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_01_rv_bits[45:40]};
 force `CPU.l2d7.quad_top_left.way158_01.data_mux.red_col_1 = {|(rand_l2d7_tl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_tl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_TOP_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d7_tr_way07_00_rv_bits);
 force `CPU.l2d7.quad_top_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d7_tr_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_tr_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_top_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d7_tr_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_tr_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_top_right.way07_00.data_mux.red_even_0 = {|(rand_l2d7_tr_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_tr_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_top_right.way07_00.data_mux.red_even_1 = {|(rand_l2d7_tr_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_tr_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_top_right.way07_00.data_mux.red_col_0 = {|(rand_l2d7_tr_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_tr_way07_00_rv_bits[45:40]};
 force `CPU.l2d7.quad_top_right.way07_00.data_mux.red_col_1 = {|(rand_l2d7_tr_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_tr_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_TOP_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d7_tr_way158_00_rv_bits);
 force `CPU.l2d7.quad_top_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d7_tr_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_top_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d7_tr_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_top_right.way158_00.data_mux.red_even_0 = {|(rand_l2d7_tr_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_top_right.way158_00.data_mux.red_even_1 = {|(rand_l2d7_tr_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_top_right.way158_00.data_mux.red_col_0 = {|(rand_l2d7_tr_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_00_rv_bits[45:40]};
 force `CPU.l2d7.quad_top_right.way158_00.data_mux.red_col_1 = {|(rand_l2d7_tr_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_TOP_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d7_tr_way70_01_rv_bits);
 force `CPU.l2d7.quad_top_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d7_tr_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_tr_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_top_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d7_tr_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_tr_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_top_right.way70_01.data_mux.red_even_0 = {|(rand_l2d7_tr_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_tr_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_top_right.way70_01.data_mux.red_even_1 = {|(rand_l2d7_tr_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_tr_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_top_right.way70_01.data_mux.red_col_0 = {|(rand_l2d7_tr_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_tr_way70_01_rv_bits[45:40]};
 force `CPU.l2d7.quad_top_right.way70_01.data_mux.red_col_1 = {|(rand_l2d7_tr_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_tr_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_TOP_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d7_tr_way158_01_rv_bits);
 force `CPU.l2d7.quad_top_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d7_tr_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_top_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d7_tr_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_top_right.way158_01.data_mux.red_even_0 = {|(rand_l2d7_tr_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_top_right.way158_01.data_mux.red_even_1 = {|(rand_l2d7_tr_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_top_right.way158_01.data_mux.red_col_0 = {|(rand_l2d7_tr_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_01_rv_bits[45:40]};
 force `CPU.l2d7.quad_top_right.way158_01.data_mux.red_col_1 = {|(rand_l2d7_tr_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_tr_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_BOTTOM_LEFT_07_00 REDUNDANCY_VALUE: %b", rand_l2d7_bl_way07_00_rv_bits);
 force `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_odd_0 = {|(rand_l2d7_bl_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_bl_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_odd_1 = {|(rand_l2d7_bl_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_bl_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_even_0 = {|(rand_l2d7_bl_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_bl_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_even_1 = {|(rand_l2d7_bl_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_bl_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_col_0 = {|(rand_l2d7_bl_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_bl_way07_00_rv_bits[45:40]};
 force `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_col_1 = {|(rand_l2d7_bl_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_bl_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_BOTTOM_LEFT_158_00 REDUNDANCY_VALUE: %b", rand_l2d7_bl_way158_00_rv_bits);
 force `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_odd_0 = {|(rand_l2d7_bl_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_odd_1 = {|(rand_l2d7_bl_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_even_0 = {|(rand_l2d7_bl_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_even_1 = {|(rand_l2d7_bl_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_col_0 = {|(rand_l2d7_bl_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_00_rv_bits[45:40]};
 force `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_col_1 = {|(rand_l2d7_bl_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_BOTTOM_LEFT_70_01 REDUNDANCY_VALUE: %b", rand_l2d7_bl_way70_01_rv_bits);
 force `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_odd_0 = {|(rand_l2d7_bl_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_bl_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_odd_1 = {|(rand_l2d7_bl_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_bl_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_even_0 = {|(rand_l2d7_bl_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_bl_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_even_1 = {|(rand_l2d7_bl_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_bl_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_col_0 = {|(rand_l2d7_bl_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_bl_way70_01_rv_bits[45:40]};
 force `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_col_1 = {|(rand_l2d7_bl_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_bl_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_BOTTOM_LEFT_158_01 REDUNDANCY_VALUE: %b", rand_l2d7_bl_way158_01_rv_bits);
 force `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_odd_0 = {|(rand_l2d7_bl_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_odd_1 = {|(rand_l2d7_bl_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_even_0 = {|(rand_l2d7_bl_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_even_1 = {|(rand_l2d7_bl_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_col_0 = {|(rand_l2d7_bl_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_01_rv_bits[45:40]};
 force `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_col_1 = {|(rand_l2d7_bl_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_bl_way158_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_BOTTOM_RIGHT_07_00 REDUNDANCY_VALUE: %b", rand_l2d7_br_way07_00_rv_bits);
 force `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_odd_0 = {|(rand_l2d7_br_way07_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_br_way07_00_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_odd_1 = {|(rand_l2d7_br_way07_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_br_way07_00_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_even_0 = {|(rand_l2d7_br_way07_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_br_way07_00_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_even_1 = {|(rand_l2d7_br_way07_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_br_way07_00_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_col_0 = {|(rand_l2d7_br_way07_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_br_way07_00_rv_bits[45:40]};
 force `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_col_1 = {|(rand_l2d7_br_way07_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_br_way07_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_BOTTOM_RIGHT_158_00 REDUNDANCY_VALUE: %b", rand_l2d7_br_way158_00_rv_bits);
 force `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_odd_0 = {|(rand_l2d7_br_way158_00_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_00_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_odd_1 = {|(rand_l2d7_br_way158_00_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_00_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_even_0 = {|(rand_l2d7_br_way158_00_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_00_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_even_1 = {|(rand_l2d7_br_way158_00_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_00_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_col_0 = {|(rand_l2d7_br_way158_00_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_00_rv_bits[45:40]};
 force `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_col_1 = {|(rand_l2d7_br_way158_00_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_00_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_BOTTOM_RIGHT_70_01 REDUNDANCY_VALUE: %b", rand_l2d7_br_way70_01_rv_bits);
 force `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_odd_0 = {|(rand_l2d7_br_way70_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_br_way70_01_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_odd_1 = {|(rand_l2d7_br_way70_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_br_way70_01_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_even_0 = {|(rand_l2d7_br_way70_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_br_way70_01_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_even_1 = {|(rand_l2d7_br_way70_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_br_way70_01_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_col_0 = {|(rand_l2d7_br_way70_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_br_way70_01_rv_bits[45:40]};
 force `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_col_1 = {|(rand_l2d7_br_way70_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_br_way70_01_rv_bits[53:48]};

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2D7_BOTTOM_RIGHT_158_01 REDUNDANCY_VALUE: %b", rand_l2d7_br_way158_01_rv_bits);
 force `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_odd_0 = {|(rand_l2d7_br_way158_01_rv_bits[9:8]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_01_rv_bits[7:1],1'b1};
 force `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_odd_1 = {|(rand_l2d7_br_way158_01_rv_bits[19:18]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_01_rv_bits[17:11],1'b1};
 force `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_even_0 = {|(rand_l2d7_br_way158_01_rv_bits[29:28]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_01_rv_bits[27:21],1'b0};
 force `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_even_1 = {|(rand_l2d7_br_way158_01_rv_bits[39:38]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_01_rv_bits[37:31],1'b0};
 force `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_col_0 = {|(rand_l2d7_br_way158_01_rv_bits[47:46]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_01_rv_bits[45:40]};
 force `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_col_1 = {|(rand_l2d7_br_way158_01_rv_bits[55:54]) ? 2'b11 : 2'b00,rand_l2d7_br_way158_01_rv_bits[53:48]};

  // For l2t0
  // For quad0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD0_BANK0_REDUNDANCY_VALUE: %b", rand_l2t0_q0_rv_bits[9:0]);
 force `CPU.l2t0.tag.quad0.bank0.reg_d_lft = rand_l2t0_q0_rv_bits[4:0];
 force `CPU.l2t0.tag.quad0.bank0.reg_d_rgt = rand_l2t0_q0_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD0_BANK1_REDUNDANCY_VALUE: %b", rand_l2t0_q0_rv_bits[19:10]);
 force `CPU.l2t0.tag.quad0.bank1.reg_d_lft = rand_l2t0_q0_rv_bits[14:10];
 force `CPU.l2t0.tag.quad0.bank1.reg_d_rgt = rand_l2t0_q0_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD0_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q0_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad0.bank0.reg_en_lft = |(rand_l2t0_q0_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD0_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q0_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad0.bank0.reg_en_rgt = |(rand_l2t0_q0_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD0_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q0_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad0.bank1.reg_en_lft = |(rand_l2t0_q0_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD0_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q0_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad0.bank1.reg_en_rgt = |(rand_l2t0_q0_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD1_BANK0_REDUNDANCY_VALUE: %b", rand_l2t0_q1_rv_bits[9:0]);
 force `CPU.l2t0.tag.quad1.bank0.reg_d_lft = rand_l2t0_q1_rv_bits[4:0];
 force `CPU.l2t0.tag.quad1.bank0.reg_d_rgt = rand_l2t0_q1_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD1_BANK1_REDUNDANCY_VALUE: %b", rand_l2t0_q1_rv_bits[19:10]);
 force `CPU.l2t0.tag.quad1.bank1.reg_d_lft = rand_l2t0_q1_rv_bits[14:10];
 force `CPU.l2t0.tag.quad1.bank1.reg_d_rgt = rand_l2t0_q1_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD1_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q1_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad1.bank0.reg_en_lft = |(rand_l2t0_q1_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD1_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q1_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad1.bank0.reg_en_rgt = |(rand_l2t0_q1_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD1_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q1_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad1.bank1.reg_en_lft = |(rand_l2t0_q1_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD1_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q1_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad1.bank1.reg_en_rgt = |(rand_l2t0_q1_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD2_BANK0_REDUNDANCY_VALUE: %b", rand_l2t0_q2_rv_bits[9:0]);
 force `CPU.l2t0.tag.quad2.bank0.reg_d_lft = rand_l2t0_q2_rv_bits[4:0];
 force `CPU.l2t0.tag.quad2.bank0.reg_d_rgt = rand_l2t0_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD2_BANK1_REDUNDANCY_VALUE: %b", rand_l2t0_q2_rv_bits[19:10]);
 force `CPU.l2t0.tag.quad2.bank1.reg_d_lft = rand_l2t0_q2_rv_bits[14:10];
 force `CPU.l2t0.tag.quad2.bank1.reg_d_rgt = rand_l2t0_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD2_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q2_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad2.bank0.reg_en_lft = |(rand_l2t0_q2_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD2_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q2_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad2.bank0.reg_en_rgt = |(rand_l2t0_q2_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD2_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q2_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad2.bank1.reg_en_lft = |(rand_l2t0_q2_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD2_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q2_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad2.bank1.reg_en_rgt = |(rand_l2t0_q2_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD3_BANK0_REDUNDANCY_VALUE: %b", rand_l2t0_q3_rv_bits[9:0]);
 force `CPU.l2t0.tag.quad3.bank0.reg_d_lft = rand_l2t0_q3_rv_bits[4:0];
 force `CPU.l2t0.tag.quad3.bank0.reg_d_rgt = rand_l2t0_q3_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD3_BANK1_REDUNDANCY_VALUE: %b", rand_l2t0_q3_rv_bits[19:10]);
 force `CPU.l2t0.tag.quad3.bank1.reg_d_lft = rand_l2t0_q3_rv_bits[14:10];
 force `CPU.l2t0.tag.quad3.bank1.reg_d_rgt = rand_l2t0_q3_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD3_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q3_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad3.bank0.reg_en_lft = |(rand_l2t0_q3_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD3_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q3_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad3.bank0.reg_en_rgt = |(rand_l2t0_q3_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD3_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q3_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad3.bank1.reg_en_lft = |(rand_l2t0_q3_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T0_QUAD3_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t0_q3_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t0.tag.quad3.bank1.reg_en_rgt = |(rand_l2t0_q3_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For l2t1
  // For quad0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD0_BANK0_REDUNDANCY_VALUE: %b", rand_l2t1_q0_rv_bits[9:0]);
 force `CPU.l2t1.tag.quad0.bank0.reg_d_lft = rand_l2t1_q0_rv_bits[4:0];
 force `CPU.l2t1.tag.quad0.bank0.reg_d_rgt = rand_l2t1_q0_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD0_BANK1_REDUNDANCY_VALUE: %b", rand_l2t1_q0_rv_bits[19:10]);
 force `CPU.l2t1.tag.quad0.bank1.reg_d_lft = rand_l2t1_q0_rv_bits[14:10];
 force `CPU.l2t1.tag.quad0.bank1.reg_d_rgt = rand_l2t1_q0_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD0_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q0_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad0.bank0.reg_en_lft = |(rand_l2t1_q0_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD0_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q0_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad0.bank0.reg_en_rgt = |(rand_l2t1_q0_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD0_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q0_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad0.bank1.reg_en_lft = |(rand_l2t1_q0_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD0_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q0_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad0.bank1.reg_en_rgt = |(rand_l2t1_q0_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD1_BANK0_REDUNDANCY_VALUE: %b", rand_l2t1_q1_rv_bits[9:0]);
 force `CPU.l2t1.tag.quad1.bank0.reg_d_lft = rand_l2t1_q1_rv_bits[4:0];
 force `CPU.l2t1.tag.quad1.bank0.reg_d_rgt = rand_l2t1_q1_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD1_BANK1_REDUNDANCY_VALUE: %b", rand_l2t1_q1_rv_bits[19:10]);
 force `CPU.l2t1.tag.quad1.bank1.reg_d_lft = rand_l2t1_q1_rv_bits[14:10];
 force `CPU.l2t1.tag.quad1.bank1.reg_d_rgt = rand_l2t1_q1_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD1_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q1_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad1.bank0.reg_en_lft = |(rand_l2t1_q1_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD1_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q1_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad1.bank0.reg_en_rgt = |(rand_l2t1_q1_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD1_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q1_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad1.bank1.reg_en_lft = |(rand_l2t1_q1_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD1_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q1_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad1.bank1.reg_en_rgt = |(rand_l2t1_q1_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD2_BANK0_REDUNDANCY_VALUE: %b", rand_l2t1_q2_rv_bits[9:0]);
 force `CPU.l2t1.tag.quad2.bank0.reg_d_lft = rand_l2t1_q2_rv_bits[4:0];
 force `CPU.l2t1.tag.quad2.bank0.reg_d_rgt = rand_l2t1_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD2_BANK1_REDUNDANCY_VALUE: %b", rand_l2t1_q2_rv_bits[19:10]);
 force `CPU.l2t1.tag.quad2.bank1.reg_d_lft = rand_l2t1_q2_rv_bits[14:10];
 force `CPU.l2t1.tag.quad2.bank1.reg_d_rgt = rand_l2t1_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD2_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q2_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad2.bank0.reg_en_lft = |(rand_l2t1_q2_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD2_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q2_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad2.bank0.reg_en_rgt = |(rand_l2t1_q2_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD2_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q2_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad2.bank1.reg_en_lft = |(rand_l2t1_q2_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD2_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q2_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad2.bank1.reg_en_rgt = |(rand_l2t1_q2_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD3_BANK0_REDUNDANCY_VALUE: %b", rand_l2t1_q3_rv_bits[9:0]);
 force `CPU.l2t1.tag.quad3.bank0.reg_d_lft = rand_l2t1_q3_rv_bits[4:0];
 force `CPU.l2t1.tag.quad3.bank0.reg_d_rgt = rand_l2t1_q3_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD3_BANK1_REDUNDANCY_VALUE: %b", rand_l2t1_q3_rv_bits[19:10]);
 force `CPU.l2t1.tag.quad3.bank1.reg_d_lft = rand_l2t1_q3_rv_bits[14:10];
 force `CPU.l2t1.tag.quad3.bank1.reg_d_rgt = rand_l2t1_q3_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD3_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q3_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad3.bank0.reg_en_lft = |(rand_l2t1_q3_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD3_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q3_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad3.bank0.reg_en_rgt = |(rand_l2t1_q3_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD3_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q3_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad3.bank1.reg_en_lft = |(rand_l2t1_q3_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T1_QUAD3_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t1_q3_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t1.tag.quad3.bank1.reg_en_rgt = |(rand_l2t1_q3_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For l2t2
  // For quad0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD0_BANK0_REDUNDANCY_VALUE: %b", rand_l2t2_q0_rv_bits[9:0]);
 force `CPU.l2t2.tag.quad0.bank0.reg_d_lft = rand_l2t2_q0_rv_bits[4:0];
 force `CPU.l2t2.tag.quad0.bank0.reg_d_rgt = rand_l2t2_q0_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD0_BANK1_REDUNDANCY_VALUE: %b", rand_l2t2_q0_rv_bits[19:10]);
 force `CPU.l2t2.tag.quad0.bank1.reg_d_lft = rand_l2t2_q0_rv_bits[14:10];
 force `CPU.l2t2.tag.quad0.bank1.reg_d_rgt = rand_l2t2_q0_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD0_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q0_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad0.bank0.reg_en_lft = |(rand_l2t2_q0_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD0_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q0_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad0.bank0.reg_en_rgt = |(rand_l2t2_q0_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD0_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q0_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad0.bank1.reg_en_lft = |(rand_l2t2_q0_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD0_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q0_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad0.bank1.reg_en_rgt = |(rand_l2t2_q0_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD1_BANK0_REDUNDANCY_VALUE: %b", rand_l2t2_q1_rv_bits[9:0]);
 force `CPU.l2t2.tag.quad1.bank0.reg_d_lft = rand_l2t2_q2_rv_bits[4:0];
 force `CPU.l2t2.tag.quad1.bank0.reg_d_rgt = rand_l2t2_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD1_BANK1_REDUNDANCY_VALUE: %b", rand_l2t2_q1_rv_bits[19:10]);
 force `CPU.l2t2.tag.quad1.bank1.reg_d_lft = rand_l2t2_q2_rv_bits[14:10];
 force `CPU.l2t2.tag.quad1.bank1.reg_d_rgt = rand_l2t2_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD1_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q1_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad1.bank0.reg_en_lft = |(rand_l2t2_q1_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD1_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q1_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad1.bank0.reg_en_rgt = |(rand_l2t2_q1_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD1_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q1_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad1.bank1.reg_en_lft = |(rand_l2t2_q1_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD1_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q1_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad1.bank1.reg_en_rgt = |(rand_l2t2_q1_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD2_BANK0_REDUNDANCY_VALUE: %b", rand_l2t2_q2_rv_bits[9:0]);
 force `CPU.l2t2.tag.quad2.bank0.reg_d_lft = rand_l2t2_q2_rv_bits[4:0];
 force `CPU.l2t2.tag.quad2.bank0.reg_d_rgt = rand_l2t2_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD2_BANK1_REDUNDANCY_VALUE: %b", rand_l2t2_q2_rv_bits[19:10]);
 force `CPU.l2t2.tag.quad2.bank1.reg_d_lft = rand_l2t2_q2_rv_bits[14:10];
 force `CPU.l2t2.tag.quad2.bank1.reg_d_rgt = rand_l2t2_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD2_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q2_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad2.bank0.reg_en_lft = |(rand_l2t2_q2_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD2_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q2_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad2.bank0.reg_en_rgt = |(rand_l2t2_q2_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD2_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q2_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad2.bank1.reg_en_lft = |(rand_l2t2_q2_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD2_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q2_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad2.bank1.reg_en_rgt = |(rand_l2t2_q2_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD3_BANK0_REDUNDANCY_VALUE: %b", rand_l2t2_q3_rv_bits[9:0]);
 force `CPU.l2t2.tag.quad3.bank0.reg_d_lft = rand_l2t2_q3_rv_bits[4:0];
 force `CPU.l2t2.tag.quad3.bank0.reg_d_rgt = rand_l2t2_q3_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD3_BANK1_REDUNDANCY_VALUE: %b", rand_l2t2_q3_rv_bits[19:10]);
 force `CPU.l2t2.tag.quad3.bank1.reg_d_lft = rand_l2t2_q3_rv_bits[14:10];
 force `CPU.l2t2.tag.quad3.bank1.reg_d_rgt = rand_l2t2_q3_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD3_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q3_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad3.bank0.reg_en_lft = |(rand_l2t2_q3_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD3_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q3_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad3.bank0.reg_en_rgt = |(rand_l2t2_q3_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD3_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q3_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad3.bank1.reg_en_lft = |(rand_l2t2_q3_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T2_QUAD3_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t2_q3_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t2.tag.quad3.bank1.reg_en_rgt = |(rand_l2t2_q3_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For l2t3
  // For quad0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD0_BANK0_REDUNDANCY_VALUE: %b", rand_l2t3_q0_rv_bits[9:0]);
 force `CPU.l2t3.tag.quad0.bank0.reg_d_lft = rand_l2t3_q0_rv_bits[4:0];
 force `CPU.l2t3.tag.quad0.bank0.reg_d_rgt = rand_l2t3_q0_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD0_BANK1_REDUNDANCY_VALUE: %b", rand_l2t3_q0_rv_bits[19:10]);
 force `CPU.l2t3.tag.quad0.bank1.reg_d_lft = rand_l2t3_q0_rv_bits[14:10];
 force `CPU.l2t3.tag.quad0.bank1.reg_d_rgt = rand_l2t3_q0_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD0_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q0_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad0.bank0.reg_en_lft = |(rand_l2t3_q0_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD0_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q0_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad0.bank0.reg_en_rgt = |(rand_l2t3_q0_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD0_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q0_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad0.bank1.reg_en_lft = |(rand_l2t3_q0_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD0_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q0_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad0.bank1.reg_en_rgt = |(rand_l2t3_q0_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD1_BANK0_REDUNDANCY_VALUE: %b", rand_l2t3_q1_rv_bits[9:0]);
 force `CPU.l2t3.tag.quad1.bank0.reg_d_lft = rand_l2t3_q2_rv_bits[4:0];
 force `CPU.l2t3.tag.quad1.bank0.reg_d_rgt = rand_l2t3_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD1_BANK1_REDUNDANCY_VALUE: %b", rand_l2t3_q1_rv_bits[19:10]);
 force `CPU.l2t3.tag.quad1.bank1.reg_d_lft = rand_l2t3_q2_rv_bits[14:10];
 force `CPU.l2t3.tag.quad1.bank1.reg_d_rgt = rand_l2t3_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD1_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q1_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad1.bank0.reg_en_lft = |(rand_l2t3_q1_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD1_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q1_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad1.bank0.reg_en_rgt = |(rand_l2t3_q1_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD1_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q1_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad1.bank1.reg_en_lft = |(rand_l2t3_q1_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD1_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q1_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad1.bank1.reg_en_rgt = |(rand_l2t3_q1_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD2_BANK0_REDUNDANCY_VALUE: %b", rand_l2t3_q2_rv_bits[9:0]);
 force `CPU.l2t3.tag.quad2.bank0.reg_d_lft = rand_l2t3_q2_rv_bits[4:0];
 force `CPU.l2t3.tag.quad2.bank0.reg_d_rgt = rand_l2t3_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD2_BANK1_REDUNDANCY_VALUE: %b", rand_l2t3_q2_rv_bits[19:10]);
 force `CPU.l2t3.tag.quad2.bank1.reg_d_lft = rand_l2t3_q2_rv_bits[14:10];
 force `CPU.l2t3.tag.quad2.bank1.reg_d_rgt = rand_l2t3_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD2_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q2_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad2.bank0.reg_en_lft = |(rand_l2t3_q2_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD2_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q2_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad2.bank0.reg_en_rgt = |(rand_l2t3_q2_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD2_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q2_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad2.bank1.reg_en_lft = |(rand_l2t3_q2_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD2_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q2_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad2.bank1.reg_en_rgt = |(rand_l2t3_q2_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD3_BANK0_REDUNDANCY_VALUE: %b", rand_l2t3_q3_rv_bits[9:0]);
 force `CPU.l2t3.tag.quad3.bank0.reg_d_lft = rand_l2t3_q3_rv_bits[4:0];
 force `CPU.l2t3.tag.quad3.bank0.reg_d_rgt = rand_l2t3_q3_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD3_BANK1_REDUNDANCY_VALUE: %b", rand_l2t3_q3_rv_bits[19:10]);
 force `CPU.l2t3.tag.quad3.bank1.reg_d_lft = rand_l2t3_q3_rv_bits[14:10];
 force `CPU.l2t3.tag.quad3.bank1.reg_d_rgt = rand_l2t3_q3_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD3_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q3_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad3.bank0.reg_en_lft = |(rand_l2t3_q3_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD3_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q3_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad3.bank0.reg_en_rgt = |(rand_l2t3_q3_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD3_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q3_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad3.bank1.reg_en_lft = |(rand_l2t3_q3_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T3_QUAD3_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t3_q3_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t3.tag.quad3.bank1.reg_en_rgt = |(rand_l2t3_q3_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For l2t4
  // For quad0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD0_BANK0_REDUNDANCY_VALUE: %b", rand_l2t4_q0_rv_bits[9:0]);
 force `CPU.l2t4.tag.quad0.bank0.reg_d_lft = rand_l2t4_q0_rv_bits[4:0];
 force `CPU.l2t4.tag.quad0.bank0.reg_d_rgt = rand_l2t4_q0_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD0_BANK1_REDUNDANCY_VALUE: %b", rand_l2t4_q0_rv_bits[19:10]);
 force `CPU.l2t4.tag.quad0.bank1.reg_d_lft = rand_l2t4_q0_rv_bits[14:10];
 force `CPU.l2t4.tag.quad0.bank1.reg_d_rgt = rand_l2t4_q0_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD0_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q0_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad0.bank0.reg_en_lft = |(rand_l2t4_q0_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD0_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q0_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad0.bank0.reg_en_rgt = |(rand_l2t4_q0_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD0_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q0_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad0.bank1.reg_en_lft = |(rand_l2t4_q0_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD0_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q0_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad0.bank1.reg_en_rgt = |(rand_l2t4_q0_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD1_BANK0_REDUNDANCY_VALUE: %b", rand_l2t4_q1_rv_bits[9:0]);
 force `CPU.l2t4.tag.quad1.bank0.reg_d_lft = rand_l2t4_q2_rv_bits[4:0];
 force `CPU.l2t4.tag.quad1.bank0.reg_d_rgt = rand_l2t4_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD1_BANK1_REDUNDANCY_VALUE: %b", rand_l2t4_q1_rv_bits[19:10]);
 force `CPU.l2t4.tag.quad1.bank1.reg_d_lft = rand_l2t4_q2_rv_bits[14:10];
 force `CPU.l2t4.tag.quad1.bank1.reg_d_rgt = rand_l2t4_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD1_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q1_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad1.bank0.reg_en_lft = |(rand_l2t4_q1_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD1_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q1_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad1.bank0.reg_en_rgt = |(rand_l2t4_q1_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD1_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q1_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad1.bank1.reg_en_lft = |(rand_l2t4_q1_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD1_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q1_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad1.bank1.reg_en_rgt = |(rand_l2t4_q1_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD2_BANK0_REDUNDANCY_VALUE: %b", rand_l2t4_q2_rv_bits[9:0]);
 force `CPU.l2t4.tag.quad2.bank0.reg_d_lft = rand_l2t4_q2_rv_bits[4:0];
 force `CPU.l2t4.tag.quad2.bank0.reg_d_rgt = rand_l2t4_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD2_BANK1_REDUNDANCY_VALUE: %b", rand_l2t4_q2_rv_bits[19:10]);
 force `CPU.l2t4.tag.quad2.bank1.reg_d_lft = rand_l2t4_q2_rv_bits[14:10];
 force `CPU.l2t4.tag.quad2.bank1.reg_d_rgt = rand_l2t4_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD2_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q2_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad2.bank0.reg_en_lft = |(rand_l2t4_q2_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD2_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q2_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad2.bank0.reg_en_rgt = |(rand_l2t4_q2_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD2_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q2_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad2.bank1.reg_en_lft = |(rand_l2t4_q2_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD2_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q2_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad2.bank1.reg_en_rgt = |(rand_l2t4_q2_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD3_BANK0_REDUNDANCY_VALUE: %b", rand_l2t4_q3_rv_bits[9:0]);
 force `CPU.l2t4.tag.quad3.bank0.reg_d_lft = rand_l2t4_q3_rv_bits[4:0];
 force `CPU.l2t4.tag.quad3.bank0.reg_d_rgt = rand_l2t4_q3_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD3_BANK1_REDUNDANCY_VALUE: %b", rand_l2t4_q3_rv_bits[19:10]);
 force `CPU.l2t4.tag.quad3.bank1.reg_d_lft = rand_l2t4_q3_rv_bits[14:10];
 force `CPU.l2t4.tag.quad3.bank1.reg_d_rgt = rand_l2t4_q3_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD3_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q3_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad3.bank0.reg_en_lft = |(rand_l2t4_q3_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD3_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q3_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad3.bank0.reg_en_rgt = |(rand_l2t4_q3_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD3_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q3_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad3.bank1.reg_en_lft = |(rand_l2t4_q3_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T4_QUAD3_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t4_q3_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t4.tag.quad3.bank1.reg_en_rgt = |(rand_l2t4_q3_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For l2t5
  // For quad0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD0_BANK0_REDUNDANCY_VALUE: %b", rand_l2t5_q0_rv_bits[9:0]);
 force `CPU.l2t5.tag.quad0.bank0.reg_d_lft = rand_l2t5_q0_rv_bits[4:0];
 force `CPU.l2t5.tag.quad0.bank0.reg_d_rgt = rand_l2t5_q0_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD0_BANK1_REDUNDANCY_VALUE: %b", rand_l2t5_q0_rv_bits[19:10]);
 force `CPU.l2t5.tag.quad0.bank1.reg_d_lft = rand_l2t5_q0_rv_bits[14:10];
 force `CPU.l2t5.tag.quad0.bank1.reg_d_rgt = rand_l2t5_q0_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD0_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q0_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad0.bank0.reg_en_lft = |(rand_l2t5_q0_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD0_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q0_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad0.bank0.reg_en_rgt = |(rand_l2t5_q0_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD0_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q0_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad0.bank1.reg_en_lft = |(rand_l2t5_q0_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD0_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q0_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad0.bank1.reg_en_rgt = |(rand_l2t5_q0_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD1_BANK0_REDUNDANCY_VALUE: %b", rand_l2t5_q1_rv_bits[9:0]);
 force `CPU.l2t5.tag.quad1.bank0.reg_d_lft = rand_l2t5_q2_rv_bits[4:0];
 force `CPU.l2t5.tag.quad1.bank0.reg_d_rgt = rand_l2t5_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD1_BANK1_REDUNDANCY_VALUE: %b", rand_l2t5_q1_rv_bits[19:10]);
 force `CPU.l2t5.tag.quad1.bank1.reg_d_lft = rand_l2t5_q2_rv_bits[14:10];
 force `CPU.l2t5.tag.quad1.bank1.reg_d_rgt = rand_l2t5_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD1_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q1_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad1.bank0.reg_en_lft = |(rand_l2t5_q1_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD1_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q1_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad1.bank0.reg_en_rgt = |(rand_l2t5_q1_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD1_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q1_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad1.bank1.reg_en_lft = |(rand_l2t5_q1_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD1_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q1_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad1.bank1.reg_en_rgt = |(rand_l2t5_q1_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD2_BANK0_REDUNDANCY_VALUE: %b", rand_l2t5_q2_rv_bits[9:0]);
 force `CPU.l2t5.tag.quad2.bank0.reg_d_lft = rand_l2t5_q2_rv_bits[4:0];
 force `CPU.l2t5.tag.quad2.bank0.reg_d_rgt = rand_l2t5_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD2_BANK1_REDUNDANCY_VALUE: %b", rand_l2t5_q2_rv_bits[19:10]);
 force `CPU.l2t5.tag.quad2.bank1.reg_d_lft = rand_l2t5_q2_rv_bits[14:10];
 force `CPU.l2t5.tag.quad2.bank1.reg_d_rgt = rand_l2t5_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD2_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q2_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad2.bank0.reg_en_lft = |(rand_l2t5_q2_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD2_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q2_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad2.bank0.reg_en_rgt = |(rand_l2t5_q2_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD2_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q2_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad2.bank1.reg_en_lft = |(rand_l2t5_q2_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD2_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q2_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad2.bank1.reg_en_rgt = |(rand_l2t5_q2_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD3_BANK0_REDUNDANCY_VALUE: %b", rand_l2t5_q3_rv_bits[9:0]);
 force `CPU.l2t5.tag.quad3.bank0.reg_d_lft = rand_l2t5_q3_rv_bits[4:0];
 force `CPU.l2t5.tag.quad3.bank0.reg_d_rgt = rand_l2t5_q3_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD3_BANK1_REDUNDANCY_VALUE: %b", rand_l2t5_q3_rv_bits[19:10]);
 force `CPU.l2t5.tag.quad3.bank1.reg_d_lft = rand_l2t5_q3_rv_bits[14:10];
 force `CPU.l2t5.tag.quad3.bank1.reg_d_rgt = rand_l2t5_q3_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD3_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q3_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad3.bank0.reg_en_lft = |(rand_l2t5_q3_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD3_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q3_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad3.bank0.reg_en_rgt = |(rand_l2t5_q3_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD3_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q3_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad3.bank1.reg_en_lft = |(rand_l2t5_q3_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T5_QUAD3_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t5_q3_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t5.tag.quad3.bank1.reg_en_rgt = |(rand_l2t5_q3_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For l2t6
  // For quad0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD0_BANK0_REDUNDANCY_VALUE: %b", rand_l2t6_q0_rv_bits[9:0]);
 force `CPU.l2t6.tag.quad0.bank0.reg_d_lft = rand_l2t6_q0_rv_bits[4:0];
 force `CPU.l2t6.tag.quad0.bank0.reg_d_rgt = rand_l2t6_q0_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD0_BANK1_REDUNDANCY_VALUE: %b", rand_l2t6_q0_rv_bits[19:10]);
 force `CPU.l2t6.tag.quad0.bank1.reg_d_lft = rand_l2t6_q0_rv_bits[14:10];
 force `CPU.l2t6.tag.quad0.bank1.reg_d_rgt = rand_l2t6_q0_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD0_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q0_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad0.bank0.reg_en_lft = |(rand_l2t6_q0_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD0_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q0_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad0.bank0.reg_en_rgt = |(rand_l2t6_q0_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD0_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q0_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad0.bank1.reg_en_lft = |(rand_l2t6_q0_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD0_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q0_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad0.bank1.reg_en_rgt = |(rand_l2t6_q0_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD1_BANK0_REDUNDANCY_VALUE: %b", rand_l2t6_q1_rv_bits[9:0]);
 force `CPU.l2t6.tag.quad1.bank0.reg_d_lft = rand_l2t6_q2_rv_bits[4:0];
 force `CPU.l2t6.tag.quad1.bank0.reg_d_rgt = rand_l2t6_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD1_BANK1_REDUNDANCY_VALUE: %b", rand_l2t6_q1_rv_bits[19:10]);
 force `CPU.l2t6.tag.quad1.bank1.reg_d_lft = rand_l2t6_q2_rv_bits[14:10];
 force `CPU.l2t6.tag.quad1.bank1.reg_d_rgt = rand_l2t6_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD1_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q1_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad1.bank0.reg_en_lft = |(rand_l2t6_q1_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD1_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q1_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad1.bank0.reg_en_rgt = |(rand_l2t6_q1_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD1_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q1_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad1.bank1.reg_en_lft = |(rand_l2t6_q1_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD1_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q1_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad1.bank1.reg_en_rgt = |(rand_l2t6_q1_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD2_BANK0_REDUNDANCY_VALUE: %b", rand_l2t6_q2_rv_bits[9:0]);
 force `CPU.l2t6.tag.quad2.bank0.reg_d_lft = rand_l2t6_q2_rv_bits[4:0];
 force `CPU.l2t6.tag.quad2.bank0.reg_d_rgt = rand_l2t6_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD2_BANK1_REDUNDANCY_VALUE: %b", rand_l2t6_q2_rv_bits[19:10]);
 force `CPU.l2t6.tag.quad2.bank1.reg_d_lft = rand_l2t6_q2_rv_bits[14:10];
 force `CPU.l2t6.tag.quad2.bank1.reg_d_rgt = rand_l2t6_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD2_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q2_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad2.bank0.reg_en_lft = |(rand_l2t6_q2_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD2_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q2_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad2.bank0.reg_en_rgt = |(rand_l2t6_q2_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD2_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q2_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad2.bank1.reg_en_lft = |(rand_l2t6_q2_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD2_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q2_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad2.bank1.reg_en_rgt = |(rand_l2t6_q2_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD3_BANK0_REDUNDANCY_VALUE: %b", rand_l2t6_q3_rv_bits[9:0]);
 force `CPU.l2t6.tag.quad3.bank0.reg_d_lft = rand_l2t6_q3_rv_bits[4:0];
 force `CPU.l2t6.tag.quad3.bank0.reg_d_rgt = rand_l2t6_q3_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD3_BANK1_REDUNDANCY_VALUE: %b", rand_l2t6_q3_rv_bits[19:10]);
 force `CPU.l2t6.tag.quad3.bank1.reg_d_lft = rand_l2t6_q3_rv_bits[14:10];
 force `CPU.l2t6.tag.quad3.bank1.reg_d_rgt = rand_l2t6_q3_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD3_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q3_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad3.bank0.reg_en_lft = |(rand_l2t6_q3_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("f0rce_random_redundancy_bits",`NORMAL,"L2T6_QUAD3_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q3_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad3.bank0.reg_en_rgt = |(rand_l2t6_q3_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD3_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q3_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad3.bank1.reg_en_lft = |(rand_l2t6_q3_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T6_QUAD3_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t6_q3_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t6.tag.quad3.bank1.reg_en_rgt = |(rand_l2t6_q3_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For l2t7
  // For quad0
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD0_BANK0_REDUNDANCY_VALUE: %b", rand_l2t7_q0_rv_bits[9:0]);
 force `CPU.l2t7.tag.quad0.bank0.reg_d_lft = rand_l2t7_q0_rv_bits[4:0];
 force `CPU.l2t7.tag.quad0.bank0.reg_d_rgt = rand_l2t7_q0_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD0_BANK1_REDUNDANCY_VALUE: %b", rand_l2t7_q0_rv_bits[19:10]);
 force `CPU.l2t7.tag.quad0.bank1.reg_d_lft = rand_l2t7_q0_rv_bits[14:10];
 force `CPU.l2t7.tag.quad0.bank1.reg_d_rgt = rand_l2t7_q0_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD0_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q0_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad0.bank0.reg_en_lft = |(rand_l2t7_q0_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD0_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q0_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad0.bank0.reg_en_rgt = |(rand_l2t7_q0_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD0_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q0_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad0.bank1.reg_en_lft = |(rand_l2t7_q0_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD0_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q0_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad0.bank1.reg_en_rgt = |(rand_l2t7_q0_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad1
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD1_BANK0_REDUNDANCY_VALUE: %b", rand_l2t7_q1_rv_bits[9:0]);
 force `CPU.l2t7.tag.quad1.bank0.reg_d_lft = rand_l2t7_q2_rv_bits[4:0];
 force `CPU.l2t7.tag.quad1.bank0.reg_d_rgt = rand_l2t7_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD1_BANK1_REDUNDANCY_VALUE: %b", rand_l2t7_q1_rv_bits[19:10]);
 force `CPU.l2t7.tag.quad1.bank1.reg_d_lft = rand_l2t7_q2_rv_bits[14:10];
 force `CPU.l2t7.tag.quad1.bank1.reg_d_rgt = rand_l2t7_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD1_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q1_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad1.bank0.reg_en_lft = |(rand_l2t7_q1_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD1_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q1_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad1.bank0.reg_en_rgt = |(rand_l2t7_q1_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD1_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q1_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad1.bank1.reg_en_lft = |(rand_l2t7_q1_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD1_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q1_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad1.bank1.reg_en_rgt = |(rand_l2t7_q1_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad2
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD2_BANK0_REDUNDANCY_VALUE: %b", rand_l2t7_q2_rv_bits[9:0]);
 force `CPU.l2t7.tag.quad2.bank0.reg_d_lft = rand_l2t7_q2_rv_bits[4:0];
 force `CPU.l2t7.tag.quad2.bank0.reg_d_rgt = rand_l2t7_q2_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD2_BANK1_REDUNDANCY_VALUE: %b", rand_l2t7_q2_rv_bits[19:10]);
 force `CPU.l2t7.tag.quad2.bank1.reg_d_lft = rand_l2t7_q2_rv_bits[14:10];
 force `CPU.l2t7.tag.quad2.bank1.reg_d_rgt = rand_l2t7_q2_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD2_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q2_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad2.bank0.reg_en_lft = |(rand_l2t7_q2_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD2_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q2_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad2.bank0.reg_en_rgt = |(rand_l2t7_q2_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD2_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q2_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad2.bank1.reg_en_lft = |(rand_l2t7_q2_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD2_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q2_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad2.bank1.reg_en_rgt = |(rand_l2t7_q2_rv_bits[19:15]) ? 2'b11 : 2'b00;

  // For quad3
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD3_BANK0_REDUNDANCY_VALUE: %b", rand_l2t7_q3_rv_bits[9:0]);
 force `CPU.l2t7.tag.quad3.bank0.reg_d_lft = rand_l2t7_q3_rv_bits[4:0];
 force `CPU.l2t7.tag.quad3.bank0.reg_d_rgt = rand_l2t7_q3_rv_bits[9:5];
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD3_BANK1_REDUNDANCY_VALUE: %b", rand_l2t7_q3_rv_bits[19:10]);
 force `CPU.l2t7.tag.quad3.bank1.reg_d_lft = rand_l2t7_q3_rv_bits[14:10];
 force `CPU.l2t7.tag.quad3.bank1.reg_d_rgt = rand_l2t7_q3_rv_bits[19:15];

  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD3_BANK0_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q3_rv_bits[4:0]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad3.bank0.reg_en_lft = |(rand_l2t7_q3_rv_bits[4:0]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("f0rce_random_redundancy_bits",`NORMAL,"L2T7_QUAD3_BANK0_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q3_rv_bits[9:5]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad3.bank0.reg_en_rgt = |(rand_l2t7_q3_rv_bits[9:5]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD3_BANK1_LEFT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q3_rv_bits[14:10]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad3.bank1.reg_en_lft = |(rand_l2t7_q3_rv_bits[14:10]) ? 2'b11 : 2'b00;
  `PR_NORMAL ("force_random_redundancy_bits",`NORMAL,"L2T7_QUAD3_BANK1_RIGHT ENABLE REDUNDANCY_VALUE: %b", |(rand_l2t7_q3_rv_bits[19:15]) ? 2'b11 : 2'b00);
 force `CPU.l2t7.tag.quad3.bank1.reg_en_rgt = |(rand_l2t7_q3_rv_bits[19:15]) ? 2'b11 : 2'b00;

  end
   end
`endif  //ASIC_GATES
`endif  //GATESIM
endmodule

