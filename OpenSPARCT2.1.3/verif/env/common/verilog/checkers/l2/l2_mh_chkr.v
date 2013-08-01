// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2_mh_chkr.v
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
module l2_mh_chkr();

///////////////////////////////////////////////////////////////////////////////
// These signals can be used to disable certain 0-In checkers at runtime,
// so that testcases forcing interface errors don't die with checker firings.
///////////////////////////////////////////////////////////////////////////////

// 0in set_clock  -default   l2clk   -module cpu


/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[35:32], dirvec.ic_cam_hit_c6[7:0]}
      -name multi_hit_chkr_2 
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[3:0], dirvec.ic_cam_hit_c6[7:0]}
      -name multi_hit_chkr_1 
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[7:4], dirvec.ic_cam_hit_c6[15:8]}
      -name multi_hit_chkr_3 
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[39:36], dirvec.ic_cam_hit_c6[15:8]}
      -name multi_hit_chkr_4 
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[11:8], dirvec.ic_cam_hit_c6[23:16]}
      -name multi_hit_chkr_5 
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/

/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[43:40], dirvec.ic_cam_hit_c6[23:16]}
      -name multi_hit_chkr_6 
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[15:12], dirvec.ic_cam_hit_c6[31:24]}
      -name multi_hit_chkr_7 
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[47:44], dirvec.ic_cam_hit_c6[31:24]}
      -name multi_hit_chkr_8 
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[19:16], dirvec.ic_cam_hit_c6[39:32]}
      -name multi_hit_chkr_9
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[51:48], dirvec.ic_cam_hit_c6[39:32]}
      -name multi_hit_chkr_10
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[23:20], dirvec.ic_cam_hit_c6[47:40]}
      -name multi_hit_chkr_11
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[55:52], dirvec.ic_cam_hit_c6[47:40]}
      -name multi_hit_chkr_12
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/

/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[27:24], dirvec.ic_cam_hit_c6[55:48]}
      -name multi_hit_chkr_13
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[59:56], dirvec.ic_cam_hit_c6[55:48]}
      -name multi_hit_chkr_14
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[31:28], dirvec.ic_cam_hit_c6[63:56]}
      -name multi_hit_chkr_15
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[63:60], dirvec.ic_cam_hit_c6[63:56]}
      -name multi_hit_chkr_16
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[67:64], dirvec.ic_cam_hit_c6[71:64]}
      -name multi_hit_chkr_17
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[99:96], dirvec.ic_cam_hit_c6[71:64]}
      -name multi_hit_chkr_18
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[71:68], dirvec.ic_cam_hit_c6[79:72]}
      -name multi_hit_chkr_19
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[103:100], dirvec.ic_cam_hit_c6[79:72]}
      -name multi_hit_chkr_20
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[75:72], dirvec.ic_cam_hit_c6[87:80]}
      -name multi_hit_chkr_21
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[107:104], dirvec.ic_cam_hit_c6[87:80]}
      -name multi_hit_chkr_22
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[79:76], dirvec.ic_cam_hit_c6[95:88]}
      -name multi_hit_chkr_23
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[111:108], dirvec.ic_cam_hit_c6[95:88]}
      -name multi_hit_chkr_24
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[83:80], dirvec.ic_cam_hit_c6[103:96]}
      -name multi_hit_chkr_25
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/

/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[115:112], dirvec.ic_cam_hit_c6[103:96]}
      -name multi_hit_chkr_26
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/

/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[87:84], dirvec.ic_cam_hit_c6[111:104]}
      -name multi_hit_chkr_27
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[119:116], dirvec.ic_cam_hit_c6[111:104]}
      -name multi_hit_chkr_28
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[91:88], dirvec.ic_cam_hit_c6[119:112]}
      -name multi_hit_chkr_29
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[123:120], dirvec.ic_cam_hit_c6[119:112]}
      -name multi_hit_chkr_30
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[95:92], dirvec.ic_cam_hit_c6[127:120]}
      -name multi_hit_chkr_31
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/
/* 0in
      mutex -var {dirvec.dc_cam_hit_c6[127:124], dirvec.ic_cam_hit_c6[127:120]}
      -name multi_hit_chkr_32
      -active $0in_delay((dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -module l2t
*/




/* x0in
      mutex -var {l2sat_top.cpu.l2t0.dirvec.dc_cam_hit_c6[3:0], l2sat_top.cpu.l2t0.dirvec.ic_cam_hit_c6[35:32], l2sat_top.cpu.l2t0.dirvec.ic_cam_hit[3:0]}
      -name multi_hit_chkr_1 
      -active $0in_delay((l2sat_top.cpu.l2t0.dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      l2sat_top.cpu.l2t0.dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      l2sat_top.cpu.l2t0.dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      l2sat_top.cpu.l2t0.dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -clock l2sat_top.cpu.l2clk
*/
/* x0in
      mutex -var {l2sat_top.cpu.l2t0.dirvec.dc_cam_hit_c6[7:4], l2sat_top.cpu.l2t0.dirvec.ic_cam_hit_c6[39:36], l2sat_top.cpu.l2t0.dirvec.ic_cam_hit_c6[7:4]}
      -name multi_hit_chkr_2 
      -active $0in_delay((l2sat_top.cpu.l2t0.dirrep.dirrep_dc_lkup_panel_dec_c4 != 0 && 
      l2sat_top.cpu.l2t0.dirrep.dirrep_dc_lkup_row_dec_c4 != 0 || 
      l2sat_top.cpu.l2t0.dirrep.dirrep_ic_lkup_panel_dec_c4 != 0 && 
      l2sat_top.cpu.l2t0.dirrep.dirrep_ic_lkup_row_dec_c4 != 0), 3)
      -clock l2sat_top.cpu.l2clk
*/

endmodule //l2_mh_chkr
