// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: red_reg_chkr.v
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
module red_reg_chkr();

  `ifdef FC8_BENCH
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_dxfer_en || `CPU.efu_spc7_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc7.lsu.dca.array.red_reg_d_bl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.lsu.dca.array.red_reg_d_bl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_dxfer_en || `CPU.efu_spc7_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc7.lsu.dca.array.red_reg_d_br[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.lsu.dca.array.red_reg_d_br
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_dxfer_en || `CPU.efu_spc7_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc7.lsu.dca.array.red_reg_d_tl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.lsu.dca.array.red_reg_d_tl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_dxfer_en || `CPU.efu_spc7_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc7.lsu.dca.array.red_reg_d_tr[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.lsu.dca.array.red_reg_d_tr
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc7_fuse_ixfer_en || `CPU.efu_spc7_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc7.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_dxfer_en || `CPU.efu_spc6_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc6.lsu.dca.array.red_reg_d_bl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.lsu.dca.array.red_reg_d_bl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_dxfer_en || `CPU.efu_spc6_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc6.lsu.dca.array.red_reg_d_br[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.lsu.dca.array.red_reg_d_br
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_dxfer_en || `CPU.efu_spc6_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc6.lsu.dca.array.red_reg_d_tl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.lsu.dca.array.red_reg_d_tl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_dxfer_en || `CPU.efu_spc6_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc6.lsu.dca.array.red_reg_d_tr[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.lsu.dca.array.red_reg_d_tr
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc6_fuse_ixfer_en || `CPU.efu_spc6_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc6.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_dxfer_en || `CPU.efu_spc5_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc5.lsu.dca.array.red_reg_d_bl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.lsu.dca.array.red_reg_d_bl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_dxfer_en || `CPU.efu_spc5_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc5.lsu.dca.array.red_reg_d_br[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.lsu.dca.array.red_reg_d_br
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_dxfer_en || `CPU.efu_spc5_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc5.lsu.dca.array.red_reg_d_tl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.lsu.dca.array.red_reg_d_tl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_dxfer_en || `CPU.efu_spc5_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc5.lsu.dca.array.red_reg_d_tr[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.lsu.dca.array.red_reg_d_tr
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc5_fuse_ixfer_en || `CPU.efu_spc5_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc5.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_dxfer_en || `CPU.efu_spc4_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc4.lsu.dca.array.red_reg_d_bl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.lsu.dca.array.red_reg_d_bl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_dxfer_en || `CPU.efu_spc4_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc4.lsu.dca.array.red_reg_d_br[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.lsu.dca.array.red_reg_d_br
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_dxfer_en || `CPU.efu_spc4_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc4.lsu.dca.array.red_reg_d_tl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.lsu.dca.array.red_reg_d_tl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_dxfer_en || `CPU.efu_spc4_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc4.lsu.dca.array.red_reg_d_tr[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.lsu.dca.array.red_reg_d_tr
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc4_fuse_ixfer_en || `CPU.efu_spc4_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc4.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_dxfer_en || `CPU.efu_spc3_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc3.lsu.dca.array.red_reg_d_bl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.lsu.dca.array.red_reg_d_bl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_dxfer_en || `CPU.efu_spc3_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc3.lsu.dca.array.red_reg_d_br[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.lsu.dca.array.red_reg_d_br
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_dxfer_en || `CPU.efu_spc3_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc3.lsu.dca.array.red_reg_d_tl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.lsu.dca.array.red_reg_d_tl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_dxfer_en || `CPU.efu_spc3_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc3.lsu.dca.array.red_reg_d_tr[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.lsu.dca.array.red_reg_d_tr
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc3_fuse_ixfer_en || `CPU.efu_spc3_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc3.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_dxfer_en || `CPU.efu_spc2_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc2.lsu.dca.array.red_reg_d_bl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.lsu.dca.array.red_reg_d_bl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_dxfer_en || `CPU.efu_spc2_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc2.lsu.dca.array.red_reg_d_br[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.lsu.dca.array.red_reg_d_br
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_dxfer_en || `CPU.efu_spc2_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc2.lsu.dca.array.red_reg_d_tl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.lsu.dca.array.red_reg_d_tl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_dxfer_en || `CPU.efu_spc2_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc2.lsu.dca.array.red_reg_d_tr[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.lsu.dca.array.red_reg_d_tr
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc2_fuse_ixfer_en || `CPU.efu_spc2_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc2.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_dxfer_en || `CPU.efu_spc1_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc1.lsu.dca.array.red_reg_d_bl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.lsu.dca.array.red_reg_d_bl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_dxfer_en || `CPU.efu_spc1_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc1.lsu.dca.array.red_reg_d_br[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.lsu.dca.array.red_reg_d_br
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_dxfer_en || `CPU.efu_spc1_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc1.lsu.dca.array.red_reg_d_tl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.lsu.dca.array.red_reg_d_tl
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_dxfer_en || `CPU.efu_spc1_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc1.lsu.dca.array.red_reg_d_tr[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.lsu.dca.array.red_reg_d_tr
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot
    */
    /* 0in change_window
      -start       (`CPU.efu_spc1_fuse_ixfer_en || `CPU.efu_spc1_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc1.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot
    */ 
  `endif

   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_dxfer_en || `CPU.efu_spc0_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc0.lsu.dca.array.red_reg_d_bl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.lsu.dca.array.red_reg_d_bl
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_dxfer_en || `CPU.efu_spc0_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc0.lsu.dca.array.red_reg_d_br[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.lsu.dca.array.red_reg_d_br
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_dxfer_en || `CPU.efu_spc0_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc0.lsu.dca.array.red_reg_d_tl[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.lsu.dca.array.red_reg_d_tl
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_dxfer_en || `CPU.efu_spc0_fuse_dclr)
      -stop_count  100
      -not_out     `CPU.spc0.lsu.dca.array.red_reg_d_tr[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.lsu.dca.array.red_reg_d_tr
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_top
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_top
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_top
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_top
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_top
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_top
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_top
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_top
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_lft_bot
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_lft_bot
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_lft_bot
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_lft_bot
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_0.reg_d_rgt_bot
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_1.reg_d_rgt_bot
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_2.reg_d_rgt_bot
   */
   /* 0in change_window
      -start       (`CPU.efu_spc0_fuse_ixfer_en || `CPU.efu_spc0_fuse_iclr)
      -stop_count  100
      -not_out     `CPU.spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        spc0.ifu_ftu.ftu_icd_cust.quad_3.reg_d_rgt_bot
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_ro_xfer_en || `CPU.efu_niu_mac0_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_ro_xfer_en || `CPU.efu_niu_mac0_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_ro_xfer_en || `CPU.efu_niu_mac0_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_ro_xfer_en || `CPU.efu_niu_mac0_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_ro_xfer_en || `CPU.efu_niu_mac0_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_ro_xfer_en || `CPU.efu_niu_mac0_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_ro_xfer_en || `CPU.efu_niu_mac0_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_ro_xfer_en || `CPU.efu_niu_mac0_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_sf_xfer_en || `CPU.efu_niu_mac0_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_sf_xfer_en || `CPU.efu_niu_mac0_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_sf_xfer_en || `CPU.efu_niu_mac0_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_sf_xfer_en || `CPU.efu_niu_mac0_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_sf_xfer_en || `CPU.efu_niu_mac0_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_sf_xfer_en || `CPU.efu_niu_mac0_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_sf_xfer_en || `CPU.efu_niu_mac0_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac0_sf_xfer_en || `CPU.efu_niu_mac0_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port0_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_ro_xfer_en || `CPU.efu_niu_mac1_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_ro_xfer_en || `CPU.efu_niu_mac1_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_ro_xfer_en || `CPU.efu_niu_mac1_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_ro_xfer_en || `CPU.efu_niu_mac1_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_ro_xfer_en || `CPU.efu_niu_mac1_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_ro_xfer_en || `CPU.efu_niu_mac1_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_ro_xfer_en || `CPU.efu_niu_mac1_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_ro_xfer_en || `CPU.efu_niu_mac1_ro_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_RO_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_sf_xfer_en || `CPU.efu_niu_mac1_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_sf_xfer_en || `CPU.efu_niu_mac1_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_sf_xfer_en || `CPU.efu_niu_mac1_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_sf_xfer_en || `CPU.efu_niu_mac1_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_sf_xfer_en || `CPU.efu_niu_mac1_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_sf_xfer_en || `CPU.efu_niu_mac1_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_sf_xfer_en || `CPU.efu_niu_mac1_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_mac1_sf_xfer_en || `CPU.efu_niu_mac1_sf_clr)
      -stop_count  100
      -not_out     `CPU.rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.txc.port1_SF_RAM.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp0_xfer_en || `CPU.efu_niu_ipp0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp0_xfer_en || `CPU.efu_niu_ipp0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp0_xfer_en || `CPU.efu_niu_ipp0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp0_xfer_en || `CPU.efu_niu_ipp0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp0_xfer_en || `CPU.efu_niu_ipp0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp0_xfer_en || `CPU.efu_niu_ipp0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp0_xfer_en || `CPU.efu_niu_ipp0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp0_xfer_en || `CPU.efu_niu_ipp0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp0.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp1_xfer_en || `CPU.efu_niu_ipp1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp1_xfer_en || `CPU.efu_niu_ipp1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_bml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp1_xfer_en || `CPU.efu_niu_ipp1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brm.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp1_xfer_en || `CPU.efu_niu_ipp1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_brr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp1_xfer_en || `CPU.efu_niu_ipp1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tll.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp1_xfer_en || `CPU.efu_niu_ipp1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tml.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp1_xfer_en || `CPU.efu_niu_ipp1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_tmr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ipp1_xfer_en || `CPU.efu_niu_ipp1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.ipp_top_0.ipp1.ipp_dat_fifo_1ke_0.ram_1024_146_0.ram_1024x152_0.ram_1024x152_0.niu_dp_1024x152s_repair_0.redreg_trr.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram0_xfer_en || `CPU.efu_niu_ram0_clr)
      -stop_count  100
      -not_out     `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram0_xfer_en || `CPU.efu_niu_ram0_clr)
      -stop_count  100
      -not_out     `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram0_xfer_en || `CPU.efu_niu_ram0_clr)
      -stop_count  100
      -not_out     `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram0_xfer_en || `CPU.efu_niu_ram0_clr)
      -stop_count  100
      -not_out     `CPU.rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rdp.niu_rdmc.niu_ram_256_148_inst0.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram1_xfer_en || `CPU.efu_niu_ram1_clr)
      -stop_count  100
      -not_out     `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram1_xfer_en || `CPU.efu_niu_ram1_clr)
      -stop_count  100
      -not_out     `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram1_xfer_en || `CPU.efu_niu_ram1_clr)
      -stop_count  100
      -not_out     `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram1_xfer_en || `CPU.efu_niu_ram1_clr)
      -stop_count  100
      -not_out     `CPU.rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rdp.niu_rdmc.niu_ram_256_148_inst1.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_cfifo0_xfer_en || `CPU.efu_niu_cfifo0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_cfifo0_xfer_en || `CPU.efu_niu_cfifo0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_cfifo0_xfer_en || `CPU.efu_niu_cfifo0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_cfifo0_xfer_en || `CPU.efu_niu_cfifo0_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port0.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_cfifo1_xfer_en || `CPU.efu_niu_cfifo1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_0.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_cfifo1_xfer_en || `CPU.efu_niu_cfifo1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_1.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_cfifo1_xfer_en || `CPU.efu_niu_cfifo1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_2.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_cfifo1_xfer_en || `CPU.efu_niu_cfifo1_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_zcp_0.niu_zcp_cfifo8KB_port1.cfifo8KB.ram_512_152_0.niu_dp_512x152s_repair_0.redreg_3.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_4k_xfer_en || `CPU.efu_niu_4k_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_0.red_data_reg[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_0.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_4k_xfer_en || `CPU.efu_niu_4k_clr)
      -stop_count  100
      -not_out     `CPU.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_1.red_data_reg[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.repair.redreg_1.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram_xfer_en || `CPU.efu_niu_ram_clr)
      -stop_count  100
      -not_out     `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_0.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram_xfer_en || `CPU.efu_niu_ram_clr)
      -stop_count  100
      -not_out     `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_1.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram_xfer_en || `CPU.efu_niu_ram_clr)
      -stop_count  100
      -not_out     `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_2.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_niu_ram_xfer_en || `CPU.efu_niu_ram_clr)
      -stop_count  100
      -not_out     `CPU.tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_data_reg[5:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        tds.niu_tdmc.niu_dmc_cache_dataFetch.niu_dmc_txcache.niu_ram_256_148.ram_256x148_0.ram_256x152_0.niu_dp_256x152s_repair_0.redreg_3.red_data_reg
   */
   /* 0in change_window
      -start       (`CPU.efu_dmu_xfer_en || `CPU.efu_dmu_clr)
      -stop_count  100
      -not_out     `CPU.dmu.dmc.mmu.vaq.fuse[3:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        dmu.dmc.mmu.vaq.fuse
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_top_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_top_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b0_fuse_xfer_en || `CPU.efu_l2b0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d0.quad_bot_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d0.quad_bot_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_top_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_top_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b1_fuse_xfer_en || `CPU.efu_l2b1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d1.quad_bot_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d1.quad_bot_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_top_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_top_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b2_fuse_xfer_en || `CPU.efu_l2b2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d2.quad_bot_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d2.quad_bot_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_top_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_top_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b3_fuse_xfer_en || `CPU.efu_l2b3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d3.quad_bot_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d3.quad_bot_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_top_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_top_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b4_fuse_xfer_en || `CPU.efu_l2b4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d4.quad_bot_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d4.quad_bot_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_top_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_top_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b5_fuse_xfer_en || `CPU.efu_l2b5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d5.quad_bot_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d5.quad_bot_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_top_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_top_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b6_fuse_xfer_en || `CPU.efu_l2b6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d6.quad_bot_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d6.quad_bot_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_top_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_top_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_left.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_left.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way07_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way07_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way07_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way07_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way07_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way07_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way07_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_00.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_00.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_00.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_00.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_00.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_00.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_00.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way70_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way70_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way70_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way70_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way70_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way70_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way70_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_odd_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_01.data_mux.red_odd_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_odd_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_01.data_mux.red_odd_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_even_0[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_01.data_mux.red_even_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_even_1[9:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_01.data_mux.red_even_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_col_0[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_01.data_mux.red_col_0
   */
   /* 0in change_window
      -start       (`CPU.efu_l2b7_fuse_xfer_en || `CPU.efu_l2b7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2d7.quad_bot_right.way158_01.data_mux.red_col_1[7:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2d7.quad_bot_right.way158_01.data_mux.red_col_1
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad0.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad0.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad0.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad0.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad0.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad0.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad0.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad0.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad1.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad1.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad1.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad1.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad1.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad1.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad1.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad1.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad2.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad2.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad2.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad2.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad2.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad2.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad2.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad2.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad3.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad3.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad3.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad3.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad3.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad3.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t0_fuse_xfer_en || `CPU.efu_l2t0_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t0.tag.quad3.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t0.tag.quad3.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad0.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad0.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad0.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad0.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad0.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad0.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad0.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad0.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad1.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad1.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad1.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad1.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad1.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad1.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad1.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad1.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad2.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad2.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad2.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad2.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad2.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad2.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad2.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad2.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad3.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad3.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad3.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad3.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad3.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad3.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t1_fuse_xfer_en || `CPU.efu_l2t1_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t1.tag.quad3.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t1.tag.quad3.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad0.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad0.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad0.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad0.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad0.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad0.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad0.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad0.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad1.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad1.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad1.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad1.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad1.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad1.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad1.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad1.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad2.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad2.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad2.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad2.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad2.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad2.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad2.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad2.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad3.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad3.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad3.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad3.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad3.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad3.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t2_fuse_xfer_en || `CPU.efu_l2t2_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t2.tag.quad3.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t2.tag.quad3.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad0.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad0.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad0.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad0.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad0.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad0.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad0.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad0.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad1.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad1.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad1.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad1.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad1.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad1.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad1.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad1.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad2.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad2.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad2.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad2.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad2.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad2.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad2.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad2.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad3.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad3.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad3.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad3.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad3.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad3.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t3_fuse_xfer_en || `CPU.efu_l2t3_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t3.tag.quad3.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t3.tag.quad3.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad0.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad0.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad0.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad0.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad0.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad0.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad0.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad0.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad1.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad1.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad1.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad1.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad1.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad1.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad1.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad1.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad2.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad2.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad2.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad2.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad2.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad2.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad2.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad2.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad3.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad3.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad3.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad3.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad3.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad3.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t4_fuse_xfer_en || `CPU.efu_l2t4_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t4.tag.quad3.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t4.tag.quad3.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad0.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad0.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad0.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad0.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad0.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad0.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad0.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad0.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad1.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad1.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad1.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad1.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad1.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad1.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad1.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad1.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad2.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad2.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad2.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad2.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad2.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad2.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad2.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad2.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad3.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad3.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad3.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad3.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad3.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad3.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t5_fuse_xfer_en || `CPU.efu_l2t5_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t5.tag.quad3.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t5.tag.quad3.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad0.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad0.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad0.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad0.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad0.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad0.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad0.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad0.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad1.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad1.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad1.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad1.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad1.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad1.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad1.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad1.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad2.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad2.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad2.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad2.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad2.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad2.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad2.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad2.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad3.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad3.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad3.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad3.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad3.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad3.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t6_fuse_xfer_en || `CPU.efu_l2t6_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t6.tag.quad3.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t6.tag.quad3.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad0.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad0.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad0.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad0.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad0.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad0.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad0.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad0.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad1.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad1.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad1.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad1.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad1.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad1.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad1.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad1.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad2.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad2.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad2.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad2.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad2.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad2.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad2.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad2.bank1.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad3.bank0.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad3.bank0.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad3.bank0.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad3.bank0.reg_d_rgt
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad3.bank1.reg_d_lft[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad3.bank1.reg_d_lft
   */
   /* 0in change_window
      -start       (`CPU.efu_l2t7_fuse_xfer_en || `CPU.efu_l2t7_fuse_clr)
      -stop_count  100
      -not_out     `CPU.l2t7.tag.quad3.bank1.reg_d_rgt[4:0]
      -active      `CPU.tcu_rst_efu_done
      -clock       `CPU.l2clk
      -group       red_reg_chkr
      -name        l2t7.tag.quad3.bank1.reg_d_rgt
   */

endmodule //red_reg_chkr
