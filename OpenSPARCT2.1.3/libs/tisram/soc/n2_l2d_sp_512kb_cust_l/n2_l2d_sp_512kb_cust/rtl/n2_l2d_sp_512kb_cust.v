// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2d_sp_512kb_cust.v
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
module n2_l2d_sp_512kb_cust (
  l2t_l2d_way_sel_c2, 
  l2t_l2d_col_offset_c2, 
  l2t_l2d_fb_hit_c3, 
  l2t_l2d_fbrd_c3, 
  l2t_l2d_rd_wr_c2, 
  l2t_l2d_set_c2, 
  l2t_l2d_word_en_c2, 
  l2t_l2d_stdecc_c2, 
  l2b_l2d_fbdecc_c4, 
  rst_wmr_protect, 
  rst_wmr_, 
  rst_por_, 
  vnw_ary0, 
  vnw_ary1, 
  l2d_l2b_decc_out_c7, 
  l2d_l2t_decc_c6, 
  gclk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_ce, 
  tcu_clk_stop, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_array_wr_inhibit, 
  tcu_atpg_mode, 
  scan_in, 
  scan_out, 
  l2d_l2b_efc_fuse_data, 
  l2b_l2d_fuse_l2d_data_in, 
  l2b_l2d_fuse_rid, 
  l2b_l2d_fuse_reset, 
  l2b_l2d_fuse_l2d_wren, 
  l2b_l2d_en_fill_clk_v0, 
  l2b_l2d_en_fill_clk_v1, 
  l2t_l2d_en_fill_clk_ov, 
  l2t_l2d_pwrsav_ov) ;
wire [155:0] l2d_l2t_decc_c52_mux;
wire [623:0] l2d_decc_out_c6;
wire l2clk;
wire siclk_peri;
wire soclk_peri;
wire pce_ov_peri;
wire pce_peri;
wire clk_stop_peri;
wire l2t_l2d_pwrsav_ov_stg;
wire cache_col_offset_all_c7;
wire wr_inhibit_peri;
wire perif_io_scanin;
wire perif_io_scanout;
wire scan_collarin_peri;
wire scan_collarout_peri;
wire [9:0] l2b_l2d_fuse_l2d_data_in_d;
wire [6:0] l2b_l2d_fuse_rid_d;
wire l2b_l2d_fuse_reset_d_l;
wire l2b_l2d_fuse_l2d_wren_d;
wire [623:0] l2b_l2d_fbdecc_c5;
wire [15:0] l2t_l2d_way_sel_c3;
wire wayerr_c3;
wire l2t_l2d_rd_wr_c3;
wire [15:0] cache_way_sel_c3_30;
wire cache_wayerr_c3_30;
wire [8:0] cache_set_c3_30;
wire cache_col_offset_c3_30;
wire cache_col_offset_c4_l_30;
wire [1:0] cache_col_offset_c5_30;
wire cache_rd_wr_c3_30;
wire cache_readen_c5_30;
wire [3:0] cache_word_en_c3_30;
wire tcu_pce_ov_30;
wire tcu_pce_30;
wire tcu_clk_stop_30;
wire se_30;
wire wee_l_q30;
wire [623:0] cache_decc_in_c3b_l;
wire [623:0] cache_decc_out_c5b;
wire [9:0] fuse_l2d_data_in_030;
wire [4:0] fuse_l2d_rid_030;
wire fuse_l2d_wren_030;
wire fuse_l2d_reset_030_l;
wire [9:0] fdout_030;
wire [9:0] fuse_l2d_data_in_130;
wire [4:0] fuse_l2d_rid_130;
wire fuse_l2d_wren_130;
wire fuse_l2d_reset_130_l;
wire [9:0] fdout_130;
wire [9:0] fuse_l2d_data_in_031;
wire [4:0] fuse_l2d_rid_031;
wire fuse_l2d_wren_031;
wire fuse_l2d_reset_031_l;
wire [9:0] fdout_031;
wire [9:0] fuse_l2d_data_in_131;
wire [4:0] fuse_l2d_rid_131;
wire fuse_l2d_wren_131;
wire fuse_l2d_reset_131_l;
wire [9:0] fdout_131;
wire [15:0] cache_way_sel_c3_31;
wire cache_wayerr_c3_31;
wire [8:0] cache_set_c3_31;
wire cache_col_offset_c3_31;
wire cache_col_offset_c4_l_31;
wire [1:0] cache_col_offset_c5_31;
wire cache_rd_wr_c3_31;
wire cache_readen_c5_31;
wire [3:0] cache_word_en_c3_31;
wire tcu_pce_ov_31;
wire tcu_pce_31;
wire tcu_clk_stop_31;
wire se_31;
wire wee_l_q31;
wire tstmodclk_30_l;
wire tstmodclk_31_l;
wire [15:0] cache_way_sel_c3_10;
wire cache_wayerr_c3_10;
wire [8:0] cache_set_c3_10;
wire cache_col_offset_c3_10;
wire cache_col_offset_c4_l_10;
wire [1:0] cache_col_offset_c5_10;
wire cache_rd_wr_c3_10;
wire cache_readen_c5_10;
wire [3:0] cache_word_en_c3_10;
wire tcu_pce_ov_10;
wire tcu_pce_10;
wire tcu_clk_stop_10;
wire se_10;
wire wee_l_q10;
wire [9:0] fuse_l2d_data_in_010;
wire [4:0] fuse_l2d_rid_010;
wire fuse_l2d_wren_010;
wire fuse_l2d_reset_010_l;
wire [9:0] fdout_010;
wire [9:0] fuse_l2d_data_in_110;
wire [4:0] fuse_l2d_rid_110;
wire fuse_l2d_wren_110;
wire fuse_l2d_reset_110_l;
wire [9:0] fdout_110;
wire [9:0] fuse_l2d_data_in_011;
wire [4:0] fuse_l2d_rid_011;
wire fuse_l2d_wren_011;
wire fuse_l2d_reset_011_l;
wire [9:0] fdout_011;
wire [9:0] fuse_l2d_data_in_111;
wire [4:0] fuse_l2d_rid_111;
wire fuse_l2d_wren_111;
wire fuse_l2d_reset_111_l;
wire [9:0] fdout_111;
wire [15:0] cache_way_sel_c3_11;
wire cache_wayerr_c3_11;
wire [8:0] cache_set_c3_11;
wire cache_col_offset_c3_11;
wire cache_col_offset_c4_l_11;
wire [1:0] cache_col_offset_c5_11;
wire cache_rd_wr_c3_11;
wire cache_readen_c5_11;
wire [3:0] cache_word_en_c3_11;
wire tcu_pce_ov_11;
wire tcu_pce_11;
wire tcu_clk_stop_11;
wire se_11;
wire wee_l_q11;
wire tstmodclk_10_l;
wire tstmodclk_11_l;
wire [15:0] cache_way_sel_c3_20;
wire cache_wayerr_c3_20;
wire [8:0] cache_set_c3_20;
wire cache_col_offset_c3_20;
wire cache_col_offset_c4_l_20;
wire [1:0] cache_col_offset_c5_20;
wire cache_rd_wr_c3_20;
wire cache_readen_c5_20;
wire [3:0] cache_word_en_c3_20;
wire tcu_pce_ov_20;
wire tcu_pce_20;
wire tcu_clk_stop_20;
wire se_20;
wire wee_l_q20;
wire [9:0] fuse_l2d_data_in_020;
wire [4:0] fuse_l2d_rid_020;
wire fuse_l2d_wren_020;
wire fuse_l2d_reset_020_l;
wire [9:0] fdout_020;
wire [9:0] fuse_l2d_data_in_120;
wire [4:0] fuse_l2d_rid_120;
wire fuse_l2d_wren_120;
wire fuse_l2d_reset_120_l;
wire [9:0] fdout_120;
wire [9:0] fuse_l2d_data_in_021;
wire [4:0] fuse_l2d_rid_021;
wire fuse_l2d_wren_021;
wire fuse_l2d_reset_021_l;
wire [9:0] fdout_021;
wire [9:0] fuse_l2d_data_in_121;
wire [4:0] fuse_l2d_rid_121;
wire fuse_l2d_wren_121;
wire fuse_l2d_reset_121_l;
wire [9:0] fdout_121;
wire [15:0] cache_way_sel_c3_21;
wire cache_wayerr_c3_21;
wire [8:0] cache_set_c3_21;
wire cache_col_offset_c3_21;
wire cache_col_offset_c4_l_21;
wire [1:0] cache_col_offset_c5_21;
wire cache_rd_wr_c3_21;
wire cache_readen_c5_21;
wire [3:0] cache_word_en_c3_21;
wire tcu_pce_ov_21;
wire tcu_pce_21;
wire tcu_clk_stop_21;
wire se_21;
wire wee_l_q21;
wire tstmodclk_20_l;
wire tstmodclk_21_l;
wire [15:0] cache_way_sel_c3_00;
wire cache_wayerr_c3_00;
wire [8:0] cache_set_c3_00;
wire cache_col_offset_c3_00;
wire cache_col_offset_c4_l_00;
wire [1:0] cache_col_offset_c5_00;
wire cache_rd_wr_c3_00;
wire cache_readen_c5_00;
wire [3:0] cache_word_en_c3_00;
wire tcu_pce_ov_00;
wire tcu_pce_00;
wire tcu_clk_stop_00;
wire se_00;
wire wee_l_q00;
wire [9:0] fuse_l2d_data_in_000;
wire [4:0] fuse_l2d_rid_000;
wire fuse_l2d_wren_000;
wire fuse_l2d_reset_000_l;
wire [9:0] fdout_000;
wire [9:0] fuse_l2d_data_in_100;
wire [4:0] fuse_l2d_rid_100;
wire fuse_l2d_wren_100;
wire fuse_l2d_reset_100_l;
wire [9:0] fdout_100;
wire [9:0] fuse_l2d_data_in_001;
wire [4:0] fuse_l2d_rid_001;
wire fuse_l2d_wren_001;
wire fuse_l2d_reset_001_l;
wire [9:0] fdout_001;
wire [9:0] fuse_l2d_data_in_101;
wire [4:0] fuse_l2d_rid_101;
wire fuse_l2d_wren_101;
wire fuse_l2d_reset_101_l;
wire [9:0] fdout_101;
wire [15:0] cache_way_sel_c3_01;
wire cache_wayerr_c3_01;
wire [8:0] cache_set_c3_01;
wire cache_col_offset_c3_01;
wire cache_col_offset_c4_l_01;
wire [1:0] cache_col_offset_c5_01;
wire cache_rd_wr_c3_01;
wire cache_readen_c5_01;
wire [3:0] cache_word_en_c3_01;
wire tcu_pce_ov_01;
wire tcu_pce_01;
wire tcu_clk_stop_01;
wire se_01;
wire wee_l_q01;
wire tstmodclk_00_l;
wire tstmodclk_01_l;
wire ctrlio_cust_scanin;
wire ctrlio_cust_scanout;
wire array_wr_inhibit;
wire [9:0] efc_fuse_data;
wire aclk_clsrhdr;
wire bclk_clsrhdr;
wire scan_en_clsrhdr;
wire rst_wmr_protect_unused;
wire rst_wmr_unused;
wire rst_por_unused;
wire [8:0] l2d_clk_header_unused;
wire clstr_hdr_scanout;
wire clstr_hdr_scanin;
wire cclk;


input [15:0]  	l2t_l2d_way_sel_c2;
input [3:0]     l2t_l2d_col_offset_c2;  
input           l2t_l2d_fb_hit_c3;      
input           l2t_l2d_fbrd_c3;        
input           l2t_l2d_rd_wr_c2;       
input [8:0]     l2t_l2d_set_c2;         
input [15:0]    l2t_l2d_word_en_c2;     
input [77:0]    l2t_l2d_stdecc_c2;      
input [623:0] 	l2b_l2d_fbdecc_c4;
input           rst_wmr_protect;
input           rst_wmr_;
input           rst_por_;
//input           l2clk;
input           vnw_ary0;
input           vnw_ary1;




output [623:0]  l2d_l2b_decc_out_c7;	
output [155:0]  l2d_l2t_decc_c6;   

input           gclk;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input           tcu_ce;
input           tcu_clk_stop;
input   	tcu_se_scancollar_in;
input   	tcu_se_scancollar_out;
input   	tcu_array_wr_inhibit;
input   	tcu_atpg_mode;
input           scan_in;
output          scan_out;

output  [9:0]   l2d_l2b_efc_fuse_data;    
input   [9:0]   l2b_l2d_fuse_l2d_data_in;      
input   [6:0]   l2b_l2d_fuse_rid;      
input           l2b_l2d_fuse_reset;      
input           l2b_l2d_fuse_l2d_wren;    


// power save signals

input		l2b_l2d_en_fill_clk_v0;
input		l2b_l2d_en_fill_clk_v1;
input		l2t_l2d_en_fill_clk_ov;
input		l2t_l2d_pwrsav_ov; 


n2_l2d_perf_io_cust     perif_io
(
.l2d_l2t_decc_c52_mux        (l2d_l2t_decc_c52_mux[155:0]),
.l2d_l2t_decc_c6             (l2d_l2t_decc_c6[155:0]),
.l2d_decc_out_c6             (l2d_decc_out_c6[623:0]),
.l2b_l2d_fbdecc_c4           (l2b_l2d_fbdecc_c4[623:0]),
.l2t_l2d_way_sel_c2          (l2t_l2d_way_sel_c2[15:0]),
.l2clk                       (l2clk),
.tcu_aclk                    (siclk_peri),
.tcu_bclk                    (soclk_peri),
.tcu_pce_ov                  (pce_ov_peri),
.tcu_ce                      (pce_peri),
.tcu_clk_stop                (clk_stop_peri),
.l2b_l2d_en_fill_clk_v0      (l2b_l2d_en_fill_clk_v0),
.l2b_l2d_en_fill_clk_v1      (l2b_l2d_en_fill_clk_v1),
.l2t_l2d_en_fill_clk_ov      (l2t_l2d_en_fill_clk_ov),
.l2t_l2d_pwrsav_ov           (l2t_l2d_pwrsav_ov),
.l2t_l2d_pwrsav_ov_stg       (l2t_l2d_pwrsav_ov_stg),
.cache_col_offset_all_c7     (cache_col_offset_all_c7),
.wr_inhibit                  (wr_inhibit_peri),
.scan_in                     (perif_io_scanin),
.scan_out                    (perif_io_scanout),
.tcu_se_scancollar_in        (scan_collarin_peri),
.tcu_se_scancollar_out       (scan_collarout_peri),
.l2b_l2d_fuse_l2d_data_in    (l2b_l2d_fuse_l2d_data_in[9:0]),
.l2b_l2d_fuse_rid            (l2b_l2d_fuse_rid[6:0]),
.l2b_l2d_fuse_reset          (l2b_l2d_fuse_reset),
.l2b_l2d_fuse_l2d_wren       (l2b_l2d_fuse_l2d_wren),
.l2d_l2b_efc_fuse_data       (l2d_l2b_efc_fuse_data[9:0]),
.l2b_l2d_fuse_l2d_data_in_d  (l2b_l2d_fuse_l2d_data_in_d[9:0]),
.l2b_l2d_fuse_rid_d          (l2b_l2d_fuse_rid_d[6:0]),
.l2b_l2d_fuse_reset_d_l      (l2b_l2d_fuse_reset_d_l),
.l2b_l2d_fuse_l2d_wren_d     (l2b_l2d_fuse_l2d_wren_d),
.l2d_l2b_decc_out_c7         (l2d_l2b_decc_out_c7[623:0]),
.l2b_l2d_fbdecc_c5           (l2b_l2d_fbdecc_c5[623:0]),
.l2t_l2d_way_sel_c3          (l2t_l2d_way_sel_c3[15:0]),
.wayerr_c3                   (wayerr_c3),
.l2t_l2d_rd_wr_c2            (l2t_l2d_rd_wr_c2),
.l2t_l2d_rd_wr_c3            (l2t_l2d_rd_wr_c3),
  .efc_fuse_data(efc_fuse_data[9:0])
);


n2_l2d_quad_cust	quad_top_left // 31 to left and 30 to right
(
.waysel_c3_0		(cache_way_sel_c3_30[15:0]),
.wayerr_c3_0        (cache_wayerr_c3_30),
.set_c3_0               (cache_set_c3_30[8:0]),
.coloff_c3_0            (cache_col_offset_c3_30),
.coloff_c4_l_0          (cache_col_offset_c4_l_30),
.coloff_c5_0            (cache_col_offset_c5_30[1:0]),
.rd_wr_c3_0             (cache_rd_wr_c3_30),
.readen_c5_0            (cache_readen_c5_30),
.worden_c3_0            (cache_word_en_c3_30[3:0]),
.l2clk                  (l2clk),
.tcu_pce_ov_0           (tcu_pce_ov_30),
.pce_0                  (tcu_pce_30),
.tcu_clk_stop_0         (tcu_clk_stop_30),
.se_0			(se_30),
.wee_l_0                (wee_l_q30),	//NEW
.wrdlo0_b_l		(cache_decc_in_c3b_l[233:195]), // write
.wrdhi0_b_l		(cache_decc_in_c3b_l[311:273]),
.wrdlo1_b_l		(cache_decc_in_c3b_l[545:507]),
.wrdhi1_b_l		(cache_decc_in_c3b_l[623:585]),
.ldoutlo0_b		(cache_decc_out_c5b[233:195]), // read
.ldouthi0_b		(cache_decc_out_c5b[311:273]),
.ldoutlo1_b		(cache_decc_out_c5b[545:507]),
.ldouthi1_b		(cache_decc_out_c5b[623:585]),
/////////
.fuse_l2d_data_in_00    (fuse_l2d_data_in_030[9:0]       ),
.fuse_l2d_rid_00        (fuse_l2d_rid_030[4:0]   ),
.fuse_l2d_wren_00       (fuse_l2d_wren_030       ),
.fuse_l2d_reset_00_l    (fuse_l2d_reset_030_l     ),
.fdout_00               (fdout_030[9:0]  ),
.fuse_l2d_data_in_01    (fuse_l2d_data_in_130[9:0]       ),
.fuse_l2d_rid_01        (fuse_l2d_rid_130[4:0]   ),
.fuse_l2d_wren_01       (fuse_l2d_wren_130       ),
.fuse_l2d_reset_01_l    (fuse_l2d_reset_130_l     ),
.fdout_01               (fdout_130[9:0]  ),
.fuse_l2d_data_in_10    (fuse_l2d_data_in_031[9:0]       ),
.fuse_l2d_rid_10        (fuse_l2d_rid_031[4:0]   ),
.fuse_l2d_wren_10       (fuse_l2d_wren_031       ),
.fuse_l2d_reset_10_l    (fuse_l2d_reset_031_l     ),
.fdout_10               (fdout_031[9:0]  ),
.fuse_l2d_data_in_11    (fuse_l2d_data_in_131[9:0]       ),
.fuse_l2d_rid_11        (fuse_l2d_rid_131[4:0]   ),
.fuse_l2d_wren_11       (fuse_l2d_wren_131       ),
.fuse_l2d_reset_11_l    (fuse_l2d_reset_131_l     ),
.fdout_11               (fdout_131[9:0]  ),
/////////
.waysel_c3_1            (cache_way_sel_c3_31[15:0]),
.wayerr_c3_1        (cache_wayerr_c3_31),
.set_c3_1               (cache_set_c3_31[8:0]),        
.coloff_c3_1            (cache_col_offset_c3_31),
.coloff_c4_l_1          (cache_col_offset_c4_l_31),
.coloff_c5_1            (cache_col_offset_c5_31[1:0]),
.rd_wr_c3_1             (cache_rd_wr_c3_31),
.readen_c5_1            (cache_readen_c5_31),
.worden_c3_1            (cache_word_en_c3_31[3:0]),
.tcu_pce_ov_1           (tcu_pce_ov_31),
.pce_1                  (tcu_pce_31),
.tcu_clk_stop_1         (tcu_clk_stop_31),
.se_1			(se_31),
.wee_l_1                (wee_l_q31),	//NEW
.tstmodclk_l_0		(tstmodclk_30_l),
.tstmodclk_l_1		(tstmodclk_31_l),
.vnw_ary                (vnw_ary1)
);



n2_l2d_quad_cust        quad_top_right 
	(
.waysel_c3_0            (cache_way_sel_c3_10[15:0]),
.wayerr_c3_0        (cache_wayerr_c3_10),
.set_c3_0               (cache_set_c3_10[8:0]),
.coloff_c3_0            (cache_col_offset_c3_10),
.coloff_c4_l_0          (cache_col_offset_c4_l_10),
.coloff_c5_0            (cache_col_offset_c5_10[1:0]),
.rd_wr_c3_0             (cache_rd_wr_c3_10),
.readen_c5_0            (cache_readen_c5_10),
.worden_c3_0            (cache_word_en_c3_10[3:0]),
.l2clk                  (l2clk),
.tcu_pce_ov_0           (tcu_pce_ov_10),
.pce_0                  (tcu_pce_10),
.tcu_clk_stop_0         (tcu_clk_stop_10),
.se_0			(se_10),
.wee_l_0                (wee_l_q10),	//NEW
.wrdlo0_b_l		(cache_decc_in_c3b_l[194:156]),
.wrdhi0_b_l		(cache_decc_in_c3b_l[272:234]),
.wrdlo1_b_l		(cache_decc_in_c3b_l[506:468]),
.wrdhi1_b_l		(cache_decc_in_c3b_l[584:546]),
.ldoutlo0_b		(cache_decc_out_c5b[194:156]),
.ldouthi0_b		(cache_decc_out_c5b[272:234]),
.ldoutlo1_b		(cache_decc_out_c5b[506:468]),
.ldouthi1_b		(cache_decc_out_c5b[584:546]),
////////////
.fuse_l2d_data_in_00    (fuse_l2d_data_in_010[9:0]       ),
.fuse_l2d_rid_00        (fuse_l2d_rid_010[4:0]   ),
.fuse_l2d_wren_00       (fuse_l2d_wren_010       ),
.fuse_l2d_reset_00_l    (fuse_l2d_reset_010_l     ),
.fdout_00               (fdout_010[9:0]  ),
.fuse_l2d_data_in_01    (fuse_l2d_data_in_110[9:0]       ),
.fuse_l2d_rid_01        (fuse_l2d_rid_110[4:0]   ),
.fuse_l2d_wren_01       (fuse_l2d_wren_110       ),
.fuse_l2d_reset_01_l    (fuse_l2d_reset_110_l     ),
.fdout_01               (fdout_110[9:0]  ),
.fuse_l2d_data_in_10    (fuse_l2d_data_in_011[9:0]       ),
.fuse_l2d_rid_10        (fuse_l2d_rid_011[4:0]   ),
.fuse_l2d_wren_10       (fuse_l2d_wren_011       ),
.fuse_l2d_reset_10_l    (fuse_l2d_reset_011_l     ),
.fdout_10               (fdout_011[9:0]  ),
.fuse_l2d_data_in_11    (fuse_l2d_data_in_111[9:0]       ),
.fuse_l2d_rid_11        (fuse_l2d_rid_111[4:0]   ),
.fuse_l2d_wren_11       (fuse_l2d_wren_111       ),
.fuse_l2d_reset_11_l    (fuse_l2d_reset_111_l     ),
.fdout_11               (fdout_111[9:0]  ),
////////////
.waysel_c3_1            (cache_way_sel_c3_11[15:0]),
.wayerr_c3_1            (cache_wayerr_c3_11),
.set_c3_1               (cache_set_c3_11[8:0]),
.coloff_c3_1            (cache_col_offset_c3_11),
.coloff_c4_l_1          (cache_col_offset_c4_l_11),
.coloff_c5_1            (cache_col_offset_c5_11[1:0]),
.rd_wr_c3_1             (cache_rd_wr_c3_11),
.readen_c5_1            (cache_readen_c5_11),
.worden_c3_1            (cache_word_en_c3_11[3:0]),
.tcu_pce_ov_1           (tcu_pce_ov_11),
.pce_1                  (tcu_pce_11),
.tcu_clk_stop_1         (tcu_clk_stop_11),
.se_1			(se_11),
.wee_l_1                (wee_l_q11),	//NEW
.tstmodclk_l_0		(tstmodclk_10_l),
.tstmodclk_l_1		(tstmodclk_11_l),
.vnw_ary                (vnw_ary1)
);



n2_l2d_quad_cust	quad_bot_left 
	(
.waysel_c3_0		(cache_way_sel_c3_20[15:0]),
.wayerr_c3_0            (cache_wayerr_c3_20),
.set_c3_0               (cache_set_c3_20[8:0]),
.coloff_c3_0            (cache_col_offset_c3_20),
.coloff_c4_l_0          (cache_col_offset_c4_l_20),
.coloff_c5_0            (cache_col_offset_c5_20[1:0]),
.rd_wr_c3_0             (cache_rd_wr_c3_20),
.readen_c5_0            (cache_readen_c5_20),
.worden_c3_0            (cache_word_en_c3_20[3:0]),
.l2clk                  (l2clk),
.tcu_pce_ov_0           (tcu_pce_ov_20),
.pce_0                  (tcu_pce_20),
.tcu_clk_stop_0         (tcu_clk_stop_20),
.se_0			(se_20),
.wee_l_0                (wee_l_q20),	//NEW
.wrdlo0_b_l		(cache_decc_in_c3b_l[77 :39 ]),
.wrdhi0_b_l		(cache_decc_in_c3b_l[155:117]),
.wrdlo1_b_l		(cache_decc_in_c3b_l[389:351]),
.wrdhi1_b_l		(cache_decc_in_c3b_l[467:429]),
.ldoutlo0_b		(cache_decc_out_c5b[77 :39 ]),
.ldouthi0_b		(cache_decc_out_c5b[155:117]),
.ldoutlo1_b		(cache_decc_out_c5b[389:351]),
.ldouthi1_b		(cache_decc_out_c5b[467:429]),
////////////
.fuse_l2d_data_in_00    (fuse_l2d_data_in_020[9:0]       ),
.fuse_l2d_rid_00        (fuse_l2d_rid_020[4:0]   ),
.fuse_l2d_wren_00       (fuse_l2d_wren_020       ),
.fuse_l2d_reset_00_l    (fuse_l2d_reset_020_l     ),
.fdout_00               (fdout_020[9:0]  ),
.fuse_l2d_data_in_01    (fuse_l2d_data_in_120[9:0]       ),
.fuse_l2d_rid_01        (fuse_l2d_rid_120[4:0]   ),
.fuse_l2d_wren_01       (fuse_l2d_wren_120       ),
.fuse_l2d_reset_01_l    (fuse_l2d_reset_120_l     ),
.fdout_01               (fdout_120[9:0]  ),
.fuse_l2d_data_in_10    (fuse_l2d_data_in_021[9:0]       ),
.fuse_l2d_rid_10        (fuse_l2d_rid_021[4:0]   ),
.fuse_l2d_wren_10       (fuse_l2d_wren_021       ),
.fuse_l2d_reset_10_l    (fuse_l2d_reset_021_l     ),
.fdout_10               (fdout_021[9:0]  ),
.fuse_l2d_data_in_11    (fuse_l2d_data_in_121[9:0]       ),
.fuse_l2d_rid_11        (fuse_l2d_rid_121[4:0]   ),
.fuse_l2d_wren_11       (fuse_l2d_wren_121       ),
.fuse_l2d_reset_11_l    (fuse_l2d_reset_121_l     ),
.fdout_11               (fdout_121[9:0]  ),
////////////

.waysel_c3_1            (cache_way_sel_c3_21[15:0]),
.wayerr_c3_1            (cache_wayerr_c3_21),
.set_c3_1               (cache_set_c3_21[8:0]),
.coloff_c3_1            (cache_col_offset_c3_21),
.coloff_c4_l_1          (cache_col_offset_c4_l_21),
.coloff_c5_1            (cache_col_offset_c5_21[1:0]),
.rd_wr_c3_1             (cache_rd_wr_c3_21),
.readen_c5_1            (cache_readen_c5_21),
.worden_c3_1            (cache_word_en_c3_21[3:0]),
.tcu_pce_ov_1           (tcu_pce_ov_21),
.pce_1                  (tcu_pce_21),
.tcu_clk_stop_1         (tcu_clk_stop_21),
.se_1			(se_21),
.wee_l_1                (wee_l_q21),	//NEW
.tstmodclk_l_0		(tstmodclk_20_l),
.tstmodclk_l_1		(tstmodclk_21_l),
.vnw_ary                (vnw_ary0)
);



n2_l2d_quad_cust        quad_bot_right 
	(
.waysel_c3_0            (cache_way_sel_c3_00[15:0]),
.wayerr_c3_0            (cache_wayerr_c3_00),
.set_c3_0               (cache_set_c3_00[8:0]),
.coloff_c3_0            (cache_col_offset_c3_00),
.coloff_c4_l_0          (cache_col_offset_c4_l_00),
.coloff_c5_0            (cache_col_offset_c5_00[1:0]),
.rd_wr_c3_0             (cache_rd_wr_c3_00),
.readen_c5_0            (cache_readen_c5_00),
.worden_c3_0            (cache_word_en_c3_00[3:0]),
.l2clk                  (l2clk),
.tcu_pce_ov_0           (tcu_pce_ov_00),
.pce_0                  (tcu_pce_00),
.tcu_clk_stop_0         (tcu_clk_stop_00),
.se_0			(se_00),
.wee_l_0                (wee_l_q00),	//NEW
.wrdlo0_b_l		(cache_decc_in_c3b_l[38 : 0 ]),
.wrdhi0_b_l		(cache_decc_in_c3b_l[116: 78]),
.wrdlo1_b_l		(cache_decc_in_c3b_l[350:312]),
.wrdhi1_b_l		(cache_decc_in_c3b_l[428:390]),
.ldoutlo0_b		(cache_decc_out_c5b[38 : 0 ]),
.ldouthi0_b		(cache_decc_out_c5b[116: 78]),
.ldoutlo1_b		(cache_decc_out_c5b[350:312]),
.ldouthi1_b		(cache_decc_out_c5b[428:390]),
////////////
.fuse_l2d_data_in_00    (fuse_l2d_data_in_000[9:0]       ),
.fuse_l2d_rid_00        (fuse_l2d_rid_000[4:0]   ),
.fuse_l2d_wren_00       (fuse_l2d_wren_000       ),
.fuse_l2d_reset_00_l    (fuse_l2d_reset_000_l     ),
.fdout_00               (fdout_000[9:0]  ),
.fuse_l2d_data_in_01    (fuse_l2d_data_in_100[9:0]       ),
.fuse_l2d_rid_01        (fuse_l2d_rid_100[4:0]   ),
.fuse_l2d_wren_01       (fuse_l2d_wren_100       ),
.fuse_l2d_reset_01_l    (fuse_l2d_reset_100_l     ),
.fdout_01               (fdout_100[9:0]  ),
.fuse_l2d_data_in_10    (fuse_l2d_data_in_001[9:0]       ),
.fuse_l2d_rid_10        (fuse_l2d_rid_001[4:0]   ),
.fuse_l2d_wren_10       (fuse_l2d_wren_001       ),
.fuse_l2d_reset_10_l    (fuse_l2d_reset_001_l     ),
.fdout_10               (fdout_001[9:0]  ),
.fuse_l2d_data_in_11    (fuse_l2d_data_in_101[9:0]       ),
.fuse_l2d_rid_11        (fuse_l2d_rid_101[4:0]   ),
.fuse_l2d_wren_11       (fuse_l2d_wren_101       ),
.fuse_l2d_reset_11_l    (fuse_l2d_reset_101_l     ),
.fdout_11               (fdout_101[9:0]  ),
////////////
.waysel_c3_1            (cache_way_sel_c3_01[15:0]),
.wayerr_c3_1            (cache_wayerr_c3_01),
.set_c3_1               (cache_set_c3_01[8:0]),
.coloff_c3_1            (cache_col_offset_c3_01),
.coloff_c4_l_1          (cache_col_offset_c4_l_01),
.coloff_c5_1            (cache_col_offset_c5_01[1:0]),
.rd_wr_c3_1             (cache_rd_wr_c3_01),
.readen_c5_1            (cache_readen_c5_01),
.worden_c3_1            (cache_word_en_c3_01[3:0]),
.tcu_pce_ov_1           (tcu_pce_ov_01),
.pce_1                  (tcu_pce_01),
.tcu_clk_stop_1         (tcu_clk_stop_01),
.se_1			(se_01),
.wee_l_1                (wee_l_q01),	//NEW
.tstmodclk_l_0		(tstmodclk_00_l),
.tstmodclk_l_1		(tstmodclk_01_l),
.vnw_ary                (vnw_ary0)
);


n2_l2d_ctrlio_cust	ctr
	(
	.l2t_l2d_word_en_c2			(l2t_l2d_word_en_c2[15:0]),
	.l2b_l2d_fbdecc_c5               	(l2b_l2d_fbdecc_c5[623:0]),
	.l2t_l2d_fbrd_c3                 	(l2t_l2d_fbrd_c3),
	.l2t_l2d_col_offset_c2           	(l2t_l2d_col_offset_c2[3:0]),
	.l2t_l2d_set_c2                  	(l2t_l2d_set_c2[8:0]),
	.l2t_l2d_rd_wr_c3                	(l2t_l2d_rd_wr_c3),
	.l2t_l2d_way_sel_c3              	(l2t_l2d_way_sel_c3[15:0]),
	.l2t_l2d_fb_hit_c3               	(l2t_l2d_fb_hit_c3),
	.scan_in(ctrlio_cust_scanin),
	.scan_out(ctrlio_cust_scanout),
	.l2clk                           	(l2clk),
	.tcu_aclk                        	(tcu_aclk),
	.tcu_bclk                        	(tcu_bclk),
	.tcu_scan_en                     	(tcu_scan_en),
	.tcu_pce_ov                      	(tcu_pce_ov),
	.tcu_ce                      	 	(tcu_ce),
	.tcu_clk_stop                    	(1'b0),
	.tcu_se_scancollar_in			(tcu_se_scancollar_in),
	.tcu_se_scancollar_out			(tcu_se_scancollar_out),
	.l2t_l2d_stdecc_c2			(l2t_l2d_stdecc_c2[77:0]),
	.l2d_decc_out_c6	         	(l2d_decc_out_c6[623:0]),
	.cache_decc_in_c3b_l	        	(cache_decc_in_c3b_l[623:0]),
	.cache_decc_out_c5b	 		(cache_decc_out_c5b[623:0]),
	.l2d_l2t_decc_c52_mux                 	(l2d_l2t_decc_c52_mux[155:0]),
	.cache_way_sel_c3_00             	(cache_way_sel_c3_00[15:0]),
	.cache_way_sel_c3_01             	(cache_way_sel_c3_01[15:0]),
	.cache_way_sel_c3_10             	(cache_way_sel_c3_10[15:0]),
	.cache_way_sel_c3_11             	(cache_way_sel_c3_11[15:0]),
	.cache_way_sel_c3_20             	(cache_way_sel_c3_20[15:0]),
	.cache_way_sel_c3_21             	(cache_way_sel_c3_21[15:0]),
	.cache_way_sel_c3_30             	(cache_way_sel_c3_30[15:0]),
	.cache_way_sel_c3_31             	(cache_way_sel_c3_31[15:0]),
        .cache_wayerr_c3_00		        (cache_wayerr_c3_00),
        .cache_wayerr_c3_01		        (cache_wayerr_c3_01),
        .cache_wayerr_c3_10		        (cache_wayerr_c3_10),
        .cache_wayerr_c3_11		        (cache_wayerr_c3_11),
        .cache_wayerr_c3_20		        (cache_wayerr_c3_20),
        .cache_wayerr_c3_21		        (cache_wayerr_c3_21),
        .cache_wayerr_c3_30		        (cache_wayerr_c3_30),
        .cache_wayerr_c3_31		        (cache_wayerr_c3_31),
	.cache_set_c3_00	         	(cache_set_c3_00[8:0]),
	.cache_set_c3_01	         	(cache_set_c3_01[8:0]),
	.cache_set_c3_10	         	(cache_set_c3_10[8:0]),
	.cache_set_c3_11	         	(cache_set_c3_11[8:0]),
	.cache_set_c3_20	         	(cache_set_c3_20[8:0]),
	.cache_set_c3_21	         	(cache_set_c3_21[8:0]),
	.cache_set_c3_30	         	(cache_set_c3_30[8:0]),
	.cache_set_c3_31	         	(cache_set_c3_31[8:0]),
	.cache_col_offset_c3_00          	(cache_col_offset_c3_00),
	.cache_col_offset_c3_01          	(cache_col_offset_c3_01),
	.cache_col_offset_c3_10          	(cache_col_offset_c3_10),
	.cache_col_offset_c3_11          	(cache_col_offset_c3_11),
	.cache_col_offset_c3_20          	(cache_col_offset_c3_20),
	.cache_col_offset_c3_21          	(cache_col_offset_c3_21),
	.cache_col_offset_c3_30          	(cache_col_offset_c3_30),
	.cache_col_offset_c3_31          	(cache_col_offset_c3_31),
	.cache_col_offset_c4_l_00        	(cache_col_offset_c4_l_00),
	.cache_col_offset_c4_l_01        	(cache_col_offset_c4_l_01),
	.cache_col_offset_c4_l_10        	(cache_col_offset_c4_l_10),
	.cache_col_offset_c4_l_11        	(cache_col_offset_c4_l_11),
	.cache_col_offset_c4_l_20        	(cache_col_offset_c4_l_20),
	.cache_col_offset_c4_l_21        	(cache_col_offset_c4_l_21),
	.cache_col_offset_c4_l_30        	(cache_col_offset_c4_l_30),
	.cache_col_offset_c4_l_31        	(cache_col_offset_c4_l_31),
	.cache_col_offset_c5_00          	(cache_col_offset_c5_00[1:0]),
	.cache_col_offset_c5_01          	(cache_col_offset_c5_01[1:0]),
	.cache_col_offset_c5_10          	(cache_col_offset_c5_10[1:0]),
	.cache_col_offset_c5_11          	(cache_col_offset_c5_11[1:0]),
	.cache_col_offset_c5_20          	(cache_col_offset_c5_20[1:0]),
	.cache_col_offset_c5_21          	(cache_col_offset_c5_21[1:0]),
	.cache_col_offset_c5_30          	(cache_col_offset_c5_30[1:0]),
	.cache_col_offset_c5_31          	(cache_col_offset_c5_31[1:0]),
	.cache_rd_wr_c3_00               	(cache_rd_wr_c3_00),
	.cache_rd_wr_c3_01               	(cache_rd_wr_c3_01),
	.cache_rd_wr_c3_10               	(cache_rd_wr_c3_10),
	.cache_rd_wr_c3_11               	(cache_rd_wr_c3_11),
	.cache_rd_wr_c3_20               	(cache_rd_wr_c3_20),
	.cache_rd_wr_c3_21               	(cache_rd_wr_c3_21),
	.cache_rd_wr_c3_30               	(cache_rd_wr_c3_30),
	.cache_rd_wr_c3_31               	(cache_rd_wr_c3_31),
	.cache_readen_c5_00              	(cache_readen_c5_00),
	.cache_readen_c5_01              	(cache_readen_c5_01),
	.cache_readen_c5_10              	(cache_readen_c5_10),
	.cache_readen_c5_11              	(cache_readen_c5_11),
	.cache_readen_c5_20              	(cache_readen_c5_20),
	.cache_readen_c5_21              	(cache_readen_c5_21),
	.cache_readen_c5_30              	(cache_readen_c5_30),
	.cache_readen_c5_31              	(cache_readen_c5_31),
	.cache_word_en_c3_00             	(cache_word_en_c3_00[3:0]),
	.cache_word_en_c3_01             	(cache_word_en_c3_01[3:0]),
	.cache_word_en_c3_10             	(cache_word_en_c3_10[3:0]),
	.cache_word_en_c3_11             	(cache_word_en_c3_11[3:0]),
	.cache_word_en_c3_20             	(cache_word_en_c3_20[3:0]),
	.cache_word_en_c3_21             	(cache_word_en_c3_21[3:0]),
	.cache_word_en_c3_30             	(cache_word_en_c3_30[3:0]),
	.cache_word_en_c3_31             	(cache_word_en_c3_31[3:0]),
	.tcu_pce_ov_00          		(tcu_pce_ov_00),
	.tcu_pce_ov_01          		(tcu_pce_ov_01),
	.tcu_pce_ov_10          		(tcu_pce_ov_10),
	.tcu_pce_ov_11          		(tcu_pce_ov_11),
	.tcu_pce_ov_20          		(tcu_pce_ov_20),
	.tcu_pce_ov_21          		(tcu_pce_ov_21),
	.tcu_pce_ov_30          		(tcu_pce_ov_30),
	.tcu_pce_ov_31          		(tcu_pce_ov_31),
	.tcu_pce_00             		(tcu_pce_00),
	.tcu_pce_01             		(tcu_pce_01),
	.tcu_pce_10             		(tcu_pce_10),
	.tcu_pce_11             		(tcu_pce_11),
	.tcu_pce_20             		(tcu_pce_20),
	.tcu_pce_21             		(tcu_pce_21),
	.tcu_pce_30             		(tcu_pce_30),
	.tcu_pce_31             		(tcu_pce_31),
	.se_00          		(se_00),
	.se_01          		(se_01),
	.se_10          		(se_10),
	.se_11          		(se_11),
	.se_20          		(se_20),
	.se_21          		(se_21),
	.se_30          		(se_30),
	.se_31          		(se_31),
	.tcu_clk_stop_00        		(tcu_clk_stop_00),
	.tcu_clk_stop_01        		(tcu_clk_stop_01),
	.tcu_clk_stop_10        		(tcu_clk_stop_10),
	.tcu_clk_stop_11        		(tcu_clk_stop_11),
	.tcu_clk_stop_20        		(tcu_clk_stop_20),
	.tcu_clk_stop_21        		(tcu_clk_stop_21),
	.tcu_clk_stop_30        		(tcu_clk_stop_30),
	.tcu_clk_stop_31         		(tcu_clk_stop_31),
        .array_wr_inhibit			 (array_wr_inhibit),
	.wayerr_c3				 (wayerr_c3),
	.siclk_peri				 (siclk_peri),
        .soclk_peri				 (soclk_peri),
        .pce_ov_peri				 (pce_ov_peri),
        .pce_peri				 (pce_peri),
        .scan_collarin_peri			 (scan_collarin_peri),
        .scan_collarout_peri			 (scan_collarout_peri),
        .wr_inhibit_peri			 (wr_inhibit_peri),
        .clk_stop_peri				 (clk_stop_peri),
        .wee_l_q00				 (wee_l_q00),
        .wee_l_q01				 (wee_l_q01),
        .wee_l_q10				 (wee_l_q10),
        .wee_l_q11				 (wee_l_q11),
        .wee_l_q20				 (wee_l_q20),
        .wee_l_q21				 (wee_l_q21),
        .wee_l_q30				 (wee_l_q30),
        .wee_l_q31				 (wee_l_q31),
	// Redudancy
	.l2b_l2d_fuse_l2d_data_in_d		 (l2b_l2d_fuse_l2d_data_in_d[9:0]),
	.l2b_l2d_fuse_rid_d                      (l2b_l2d_fuse_rid_d[6:0]),
	.l2b_l2d_fuse_reset_l                    (l2b_l2d_fuse_reset_d_l),
	.l2b_l2d_fuse_l2d_wren_d                 (l2b_l2d_fuse_l2d_wren_d),
	.efc_fuse_data                           (efc_fuse_data[9:0]),
	.fuse_l2d_data_in_131                    (fuse_l2d_data_in_131[9:0]),
	.fuse_l2d_rid_131                        (fuse_l2d_rid_131[4:0]),
	.fuse_l2d_wren_131                       (fuse_l2d_wren_131),
	.fuse_l2d_reset_131_l                    (fuse_l2d_reset_131_l),
	.fdout_131                               (fdout_131[9:0]),
	.fuse_l2d_data_in_031                    (fuse_l2d_data_in_031[9:0]	),
	.fuse_l2d_rid_031                        (fuse_l2d_rid_031[4:0]	),
	.fuse_l2d_wren_031                       (fuse_l2d_wren_031         	),
	.fuse_l2d_reset_031_l                    (fuse_l2d_reset_031_l        	),
	.fdout_031                               (fdout_031                 [9:0]	),
	.fuse_l2d_data_in_130                    (fuse_l2d_data_in_130      [9:0]	),
	.fuse_l2d_rid_130                        (fuse_l2d_rid_130          [4:0]	),
	.fuse_l2d_wren_130                       (fuse_l2d_wren_130         	),
	.fuse_l2d_reset_130_l                    (fuse_l2d_reset_130_l        	),
	.fdout_130                               (fdout_130                 [9:0]	),
	.fuse_l2d_data_in_030                    (fuse_l2d_data_in_030      [9:0]	),
	.fuse_l2d_rid_030                        (fuse_l2d_rid_030          [4:0]	),
	.fuse_l2d_wren_030                       (fuse_l2d_wren_030         	),
	.fuse_l2d_reset_030_l                    (fuse_l2d_reset_030_l        	),
	.fdout_030                               (fdout_030                 [9:0]	),
	.fuse_l2d_data_in_111                    (fuse_l2d_data_in_111      [9:0]	),
	.fuse_l2d_rid_111                        (fuse_l2d_rid_111          [4:0]	),
	.fuse_l2d_wren_111                       (fuse_l2d_wren_111         	),
	.fuse_l2d_reset_111_l                    (fuse_l2d_reset_111_l        	),
	.fdout_111                               (fdout_111                 [9:0]	),
	.fuse_l2d_data_in_011                    (fuse_l2d_data_in_011      [9:0]   ),
	.fuse_l2d_rid_011                        (fuse_l2d_rid_011          [4:0]   ),
	.fuse_l2d_wren_011                       (fuse_l2d_wren_011                 ),
	.fuse_l2d_reset_011_l                    (fuse_l2d_reset_011_l                ),
	.fdout_011                               (fdout_011                 [9:0]   ),
	.fuse_l2d_data_in_110                    (fuse_l2d_data_in_110      [9:0]	),
	.fuse_l2d_rid_110                        (fuse_l2d_rid_110          [4:0]	),
	.fuse_l2d_wren_110                       (fuse_l2d_wren_110         	),
	.fuse_l2d_reset_110_l                    (fuse_l2d_reset_110_l        	),
	.fdout_110                               (fdout_110                 [9:0]	),
	.fuse_l2d_data_in_010                    (fuse_l2d_data_in_010      [9:0]	),
	.fuse_l2d_rid_010                        (fuse_l2d_rid_010          [4:0]	),
	.fuse_l2d_wren_010                       (fuse_l2d_wren_010         	),
	.fuse_l2d_reset_010_l                    (fuse_l2d_reset_010_l        	),
	.fdout_010                               (fdout_010                 [9:0]	),
	.fuse_l2d_data_in_121                    (fuse_l2d_data_in_121      [9:0]	),
	.fuse_l2d_rid_121                        (fuse_l2d_rid_121          [4:0]	),
	.fuse_l2d_wren_121                       (fuse_l2d_wren_121         	),
	.fuse_l2d_reset_121_l                    (fuse_l2d_reset_121_l        	),
	.fdout_121                               (fdout_121                 [9:0]	),
	.fuse_l2d_data_in_021                    (fuse_l2d_data_in_021      [9:0]	),
	.fuse_l2d_rid_021                        (fuse_l2d_rid_021          [4:0]	),
	.fuse_l2d_wren_021                       (fuse_l2d_wren_021         	),
	.fuse_l2d_reset_021_l                    (fuse_l2d_reset_021_l        	),
	.fdout_021                               (fdout_021                 [9:0]	),
	.fuse_l2d_data_in_120                    (fuse_l2d_data_in_120      [9:0]	),
	.fuse_l2d_rid_120                        (fuse_l2d_rid_120          [4:0]	),
	.fuse_l2d_wren_120                       (fuse_l2d_wren_120         	),
	.fuse_l2d_reset_120_l                    (fuse_l2d_reset_120_l        	),
	.fdout_120                               (fdout_120                 [9:0]	),
	.fuse_l2d_data_in_020                    (fuse_l2d_data_in_020      [9:0]	),
	.fuse_l2d_rid_020                        (fuse_l2d_rid_020          [4:0]	),
	.fuse_l2d_wren_020                       (fuse_l2d_wren_020         	),
	.fuse_l2d_reset_020_l                    (fuse_l2d_reset_020_l        	),
	.fdout_020                               (fdout_020                 [9:0]	),
	.fuse_l2d_data_in_101                    (fuse_l2d_data_in_101      [9:0]	),
	.fuse_l2d_rid_101                        (fuse_l2d_rid_101          [4:0]	),
	.fuse_l2d_wren_101                       (fuse_l2d_wren_101         	),
	.fuse_l2d_reset_101_l                    (fuse_l2d_reset_101_l        	),
	.fdout_101                               (fdout_101                 [9:0]	),
	.fuse_l2d_data_in_001                    (fuse_l2d_data_in_001      [9:0]	),
	.fuse_l2d_rid_001                        (fuse_l2d_rid_001          [4:0]	),
	.fuse_l2d_wren_001                       (fuse_l2d_wren_001         	),
	.fuse_l2d_reset_001_l                    (fuse_l2d_reset_001_l        	),
	.fdout_001                               (fdout_001                 [9:0]	),
	.fuse_l2d_data_in_100                    (fuse_l2d_data_in_100      [9:0]	),
	.fuse_l2d_rid_100                        (fuse_l2d_rid_100          [4:0]	),
	.fuse_l2d_wren_100                       (fuse_l2d_wren_100         	),
	.fuse_l2d_reset_100_l                    (fuse_l2d_reset_100_l        	),
	.fdout_100                               (fdout_100                 [9:0]	),
	.fuse_l2d_data_in_000                    (fuse_l2d_data_in_000      [9:0]	),
	.fuse_l2d_rid_000                        (fuse_l2d_rid_000          [4:0]	),
	.fuse_l2d_wren_000                       (fuse_l2d_wren_000         	),
        .fuse_l2d_reset_000_l                    (fuse_l2d_reset_000_l        	),
        .fdout_000                               (fdout_000                 [9:0]	),
	.l2t_l2d_pwrsav_ov_stg                   (l2t_l2d_pwrsav_ov_stg),	//NEW
        .cache_col_offset_all_c7                 (cache_col_offset_all_c7),	//NEW
        .delout00	(tstmodclk_00_l),
        .delout01	(tstmodclk_01_l),
        .delout10	(tstmodclk_10_l),
        .delout11	(tstmodclk_11_l),
        .delout20	(tstmodclk_20_l),
        .delout21	(tstmodclk_21_l),
        .delout30	(tstmodclk_30_l),
        .delout31	(tstmodclk_31_l),
        .aclk		(aclk_clsrhdr),
	.bclk		(bclk_clsrhdr),
	.scan_en_clsrhdr (scan_en_clsrhdr)
	);

// For vlint
assign rst_wmr_protect_unused 	= rst_wmr_protect;
assign rst_wmr_unused	      	= rst_wmr_;
assign rst_por_unused		= rst_por_;
	
n2_clk_clstr_hdr_cust l2d_clk_header 
        ( 
	.tcu_wr_inhibit		(tcu_array_wr_inhibit	),
	.array_wr_inhibit	(array_wr_inhibit),
	.tcu_atpg_mode		(tcu_atpg_mode		),
        .l2clk                  (l2clk                  ),
        .aclk                   (l2d_clk_header_unused[0]),
        .bclk                   (l2d_clk_header_unused[1]),
        .scan_out               (clstr_hdr_scanout     ),
        .pce_ov                 (l2d_clk_header_unused[2]),
        .wmr_protect            (l2d_clk_header_unused[3]),
        .wmr_                   (l2d_clk_header_unused[4]),
        .por_                   (l2d_clk_header_unused[5]),
        .cmp_slow_sync_en       (l2d_clk_header_unused[6]),
        .slow_cmp_sync_en       (l2d_clk_header_unused[7]),
        .tcu_clk_stop           (tcu_clk_stop           ),
        .tcu_pce_ov             (1'b0                   ),
	.cluster_arst_l		(1'b1                   ),
	.aclk_wmr		(l2d_clk_header_unused[8]),
        .rst_wmr_protect        (1'b0                   ),
        .rst_wmr_               (1'b0                   ),
        .rst_por_               (1'b0                   ),
        .ccu_cmp_slow_sync_en   (1'b0                   ),
        .ccu_slow_cmp_sync_en   (1'b0                   ),
        .tcu_div_bypass         (1'b0                   ),
        .ccu_div_ph             (1'b1                   ),
        .cluster_div_en         (1'b0                   ),
        .gclk                   (gclk                   ),
        .tcu_aclk               (aclk_clsrhdr           ),
        .tcu_bclk               (bclk_clsrhdr           ),
        .scan_en                (scan_en_clsrhdr        ),
        .scan_in                (clstr_hdr_scanin       ),
  .cclk(cclk)
        );

n2_clk_l2d_cmp_cust l2d_pregrid_drv_top
        (
        .cclk 	(cclk),
        .l2clk  (l2clk)
        );
n2_clk_l2d_cmp_cust l2d_pregrid_drv_bot
        (
        .cclk   (cclk),
        .l2clk  (l2clk)
        );

// fixscan start:
assign perif_io_scanin           = scan_in                  ;
assign clstr_hdr_scanin          = perif_io_scanout         ;
assign ctrlio_cust_scanin        = clstr_hdr_scanout        ;
assign scan_out                  = ctrlio_cust_scanout      ;
// fixscan end:
endmodule




module n2_l2d_perf_io_cust (
  l2d_decc_out_c6, 
  l2b_l2d_fbdecc_c4, 
  l2t_l2d_way_sel_c2, 
  l2clk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_ce, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  scan_in, 
  wr_inhibit, 
  l2d_l2t_decc_c52_mux, 
  l2b_l2d_en_fill_clk_v0, 
  l2b_l2d_en_fill_clk_v1, 
  l2t_l2d_en_fill_clk_ov, 
  cache_col_offset_all_c7, 
  l2t_l2d_pwrsav_ov, 
  l2t_l2d_rd_wr_c2, 
  l2t_l2d_pwrsav_ov_stg, 
  scan_out, 
  l2t_l2d_rd_wr_c3, 
  l2b_l2d_fuse_l2d_data_in, 
  l2b_l2d_fuse_rid, 
  l2b_l2d_fuse_reset, 
  l2b_l2d_fuse_l2d_wren, 
  l2d_l2b_efc_fuse_data, 
  l2b_l2d_fuse_l2d_data_in_d, 
  l2b_l2d_fuse_rid_d, 
  l2b_l2d_fuse_reset_d_l, 
  l2b_l2d_fuse_l2d_wren_d, 
  efc_fuse_data, 
  l2d_l2b_decc_out_c7, 
  l2b_l2d_fbdecc_c5, 
  l2t_l2d_way_sel_c3, 
  l2d_l2t_decc_c6, 
  wayerr_c3);
wire stop;
wire l1clk_in;
wire l1clk_out;
wire fill_pce0;
wire l1clk_fill0;
wire fill_pce1;
wire l1clk_fill1;
wire cache_col_offset_all_c7_or_l2t_l2d_pwrsav_ov_stg;
wire l1clk_decc_c7;
wire [0:0] ff_l2t_l2d_rd_wr_c3_scanin;
wire [0:0] ff_l2t_l2d_rd_wr_c3_scanout;
wire [0:0] ff_fill_clk_en_ov_stg_scanin;
wire [0:0] ff_fill_clk_en_ov_stg_scanout;
wire fill_clk_en_ov_stg;
wire [0:0] ff_pwrsav_ov_stg_scanin;
wire [0:0] ff_pwrsav_ov_stg_scanout;
wire [155:0] ff_l2d_l2t_decc_c6_scanin;
wire [155:0] ff_l2d_l2t_decc_c6_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_1_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_1_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_2_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_2_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_3_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_3_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_4_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_4_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_5_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_5_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_6_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_6_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_7_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_7_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_8_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_8_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_9_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_9_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_10_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_10_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_11_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_11_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_12_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_12_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_13_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_13_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_14_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_14_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_15_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_15_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c5_16_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c5_16_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_1_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_1_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_2_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_2_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_3_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_3_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_4_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_4_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_5_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_5_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_6_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_6_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_7_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_7_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_8_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_8_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_9_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_9_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_10_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_10_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_11_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_11_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_12_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_12_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_13_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_13_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_14_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_14_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_15_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_15_scanout;
wire [38:0] ff_l2d_l2b_decc_out_c7_16_scanin;
wire [38:0] ff_l2d_l2b_decc_out_c7_16_scanout;
wire [15:0] ff_l2t_l2d_way_sel_c3_scanin;
wire [15:0] ff_l2t_l2d_way_sel_c3_scanout;
wire [9:0] ff_l2b_l2d_fuse_l2d_data_in_scanin;
wire [9:0] ff_l2b_l2d_fuse_l2d_data_in_scanout;
wire [9:0] ff_l2d_l2b_efc_fuse_data_scanin;
wire [9:0] ff_l2d_l2b_efc_fuse_data_scanout;
wire [6:0] ff_l2b_l2d_fuse_rid_d_scanin;
wire [6:0] ff_l2b_l2d_fuse_rid_d_scanout;
wire [0:0] ff_l2b_l2d_fuse_wren_d_scanin;
wire [0:0] ff_l2b_l2d_fuse_wren_d_scanout;
wire l2b_l2d_fuse_l2d_wren_stg;
wire l2b_l2d_fuse_reset_stg_n;
wire wr_inhibit_n;
wire l2b_l2d_fuse_reset_stg;
wire [0:0] ff_l2b_l2d_fuse_reset_d_scanin;
wire [0:0] ff_l2b_l2d_fuse_reset_d_scanout;


input 	[623:0] l2d_decc_out_c6;
input 	[623:0] l2b_l2d_fbdecc_c4;
input	[15:0]	l2t_l2d_way_sel_c2;
input 	  	l2clk;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_ce;
input           tcu_se_scancollar_in;
input           tcu_se_scancollar_out;
input           scan_in;
input		wr_inhibit;
input 	[155:0] l2d_l2t_decc_c52_mux;
input		l2b_l2d_en_fill_clk_v0;
input		l2b_l2d_en_fill_clk_v1;
input		l2t_l2d_en_fill_clk_ov;
input		cache_col_offset_all_c7;
input		l2t_l2d_pwrsav_ov;
input		l2t_l2d_rd_wr_c2;
output		l2t_l2d_pwrsav_ov_stg;
output          scan_out;
output		l2t_l2d_rd_wr_c3;
// From outside world
input   [9:0]   l2b_l2d_fuse_l2d_data_in;
input   [6:0]   l2b_l2d_fuse_rid;
input           l2b_l2d_fuse_reset;
input           l2b_l2d_fuse_l2d_wren;
output  [9:0]   l2d_l2b_efc_fuse_data;

// to outside world
output  [9:0]   l2b_l2d_fuse_l2d_data_in_d;
output  [6:0]   l2b_l2d_fuse_rid_d;
output          l2b_l2d_fuse_reset_d_l;
output          l2b_l2d_fuse_l2d_wren_d;
input	[9:0]	efc_fuse_data;
   
// Regular outputs
output [623:0] l2d_l2b_decc_out_c7;
output [623:0] l2b_l2d_fbdecc_c5;
output [15:0]  l2t_l2d_way_sel_c3;
output [155:0] l2d_l2t_decc_c6;
output         wayerr_c3;
//////////////////////////////////////////////////////////////////////////////

wire pce_ov;
wire siclk;
wire soclk;
wire scan_out;

assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign pce_ov = tcu_pce_ov;

//////////////////////////////////////////////////////////////////////////////
//   wire [623:0]   l2d_decc_out_c6;



n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro l1_clk_in_hdr (
        .l2clk  (l2clk),
        .se     (tcu_se_scancollar_in),
        .l1en   (tcu_ce),
        .pce_ov (pce_ov),
        .stop   (stop),
        .l1clk  (l1clk_in)
        );
	
n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro l1_clk_out_hdr (
        .l2clk  (l2clk),
        .se     (tcu_se_scancollar_out),
        .l1en   (tcu_ce),
        .pce_ov (pce_ov),
        .stop   (stop),
        .l1clk  (l1clk_out)
        );
	
n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro l1_clk_fill0_hdr (
        .l2clk  (l2clk),
        .se     (tcu_se_scancollar_in),
        .l1en   (fill_pce0),
        .pce_ov (pce_ov),
        .stop   (stop),
        .l1clk  (l1clk_fill0)
        );

n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro l1_clk_fill1_hdr (
        .l2clk  (l2clk),
        .se     (tcu_se_scancollar_in),
        .l1en   (fill_pce1),
        .pce_ov (pce_ov),
        .stop   (stop),
        .l1clk  (l1clk_fill1)
        );

n2_l2d_sp_512kb_cust_or_macro__width_1 or_slice_col_offset_all_pwrsv 
	(
	.dout	(cache_col_offset_all_c7_or_l2t_l2d_pwrsav_ov_stg),
	.din0	(l2t_l2d_pwrsav_ov_stg),
	.din1	(cache_col_offset_all_c7)
	);	

	
n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro l1_clk_decc_c7_hdr (
        .l2clk  (l2clk),
        .se     (tcu_se_scancollar_out),
//        .l1en   (cache_col_offset_all_c7 | l2t_l2d_pwrsav_ov_stg),
	.l1en	(cache_col_offset_all_c7_or_l2t_l2d_pwrsav_ov_stg),
        .pce_ov (pce_ov),
        .stop   (stop),
        .l1clk  (l1clk_decc_c7)
        );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1      ff_l2t_l2d_rd_wr_c3  
     (
     .scan_in(ff_l2t_l2d_rd_wr_c3_scanin[0:0]),
     .scan_out(ff_l2t_l2d_rd_wr_c3_scanout[0:0]),
	.dout		(l2t_l2d_rd_wr_c3),
	.din		(l2t_l2d_rd_wr_c2),
	.l1clk  	(l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
	);
	
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1      ff_fill_clk_en_ov_stg  
     (
     .scan_in(ff_fill_clk_en_ov_stg_scanin[0:0]),
     .scan_out(ff_fill_clk_en_ov_stg_scanout[0:0]),
	.dout		(fill_clk_en_ov_stg),
	.din		(l2t_l2d_en_fill_clk_ov),
	.l1clk  	(l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
	);
	
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1      ff_pwrsav_ov_stg  
     (
     .scan_in(ff_pwrsav_ov_stg_scanin[0:0]),
     .scan_out(ff_pwrsav_ov_stg_scanout[0:0]),
	.dout		(l2t_l2d_pwrsav_ov_stg),
	.din		(l2t_l2d_pwrsav_ov),
	.l1clk  	(l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
	);
//assign 	fill_pce0 = l2b_l2d_en_fill_clk_v0 | fill_clk_en_ov_stg;
//assign 	fill_pce1 = l2b_l2d_en_fill_clk_v1 | fill_clk_en_ov_stg;

n2_l2d_sp_512kb_cust_or_macro__width_2  or_fill_pce0  
        (
        .dout	({fill_pce0,fill_pce1}),
        .din0	({l2b_l2d_en_fill_clk_v0,l2b_l2d_en_fill_clk_v1}),
        .din1	({fill_clk_en_ov_stg,fill_clk_en_ov_stg})
        );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_156      ff_l2d_l2t_decc_c6  
     (
     .scan_in(ff_l2d_l2t_decc_c6_scanin[155:0]),
     .scan_out(ff_l2d_l2t_decc_c6_scanout[155:0]),
	.dout		(l2d_l2t_decc_c6[155:0]),
	.din		(l2d_l2t_decc_c52_mux[155:0]),
	.l1clk  	(l1clk_out),
  .siclk(siclk),
  .soclk(soclk)
	);


n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_1  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_1_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_1_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[38:0]),
	.din		(l2b_l2d_fbdecc_c4[38:0]),
	.l1clk		(l1clk_fill1),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_2  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_2_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_2_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[77:39]),
	.din		(l2b_l2d_fbdecc_c4[77:39]),
	.l1clk		(l1clk_fill0),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_3  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_3_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_3_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[116:78]),
	.din		(l2b_l2d_fbdecc_c4[116:78]),
	.l1clk		(l1clk_fill1),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_4  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_4_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_4_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[155:117]),
	.din		(l2b_l2d_fbdecc_c4[155:117]),
	.l1clk		(l1clk_fill0),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_5  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_5_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_5_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[194:156]),
	.din		(l2b_l2d_fbdecc_c4[194:156]),
	.l1clk		(l1clk_fill1),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_6  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_6_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_6_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[233:195]),
	.din		(l2b_l2d_fbdecc_c4[233:195]),
	.l1clk		(l1clk_fill0),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_7  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_7_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_7_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[272:234]),
	.din		(l2b_l2d_fbdecc_c4[272:234]),
	.l1clk		(l1clk_fill1),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_8  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_8_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_8_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[311:273]),
	.din		(l2b_l2d_fbdecc_c4[311:273]),
	.l1clk		(l1clk_fill0),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_9  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_9_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_9_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[350:312]),
	.din		(l2b_l2d_fbdecc_c4[350:312]),
	.l1clk		(l1clk_fill1),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_10  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_10_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_10_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[389:351]),
	.din		(l2b_l2d_fbdecc_c4[389:351]),
	.l1clk		(l1clk_fill0),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_11  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_11_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_11_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[428:390]),
	.din		(l2b_l2d_fbdecc_c4[428:390]),
	.l1clk		(l1clk_fill1),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_12  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_12_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_12_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[467:429]),
	.din		(l2b_l2d_fbdecc_c4[467:429]),
	.l1clk		(l1clk_fill0),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_13  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_13_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_13_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[506:468]),
	.din		(l2b_l2d_fbdecc_c4[506:468]),
	.l1clk		(l1clk_fill1),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_14  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_14_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_14_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[545:507]),
	.din		(l2b_l2d_fbdecc_c4[545:507]),
	.l1clk		(l1clk_fill0),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_15  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_15_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_15_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[584:546]),
	.din		(l2b_l2d_fbdecc_c4[584:546]),
	.l1clk		(l1clk_fill1),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2b_l2d_fbdecc_c5_16  
     (
     .scan_in(ff_l2b_l2d_fbdecc_c5_16_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c5_16_scanout[38:0]),
	.dout		(l2b_l2d_fbdecc_c5[623:585]),
	.din		(l2b_l2d_fbdecc_c4[623:585]),
	.l1clk		(l1clk_fill0),
  .siclk(siclk),
  .soclk(soclk)
	);



n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_1  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_1_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_1_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[38:0]),
	.din		(l2d_decc_out_c6[38:0]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_2  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_2_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_2_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[77:39]),
	.din		(l2d_decc_out_c6[77:39]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_3  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_3_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_3_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[116:78]),
	.din		(l2d_decc_out_c6[116:78]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_4  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_4_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_4_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[155:117]),
	.din		(l2d_decc_out_c6[155:117]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_5  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_5_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_5_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[194:156]),
	.din		(l2d_decc_out_c6[194:156]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_6  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_6_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_6_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[233:195]),
	.din		(l2d_decc_out_c6[233:195]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_7  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_7_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_7_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[272:234]),
	.din		(l2d_decc_out_c6[272:234]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_8  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_8_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_8_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[311:273]),
	.din		(l2d_decc_out_c6[311:273]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_9  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_9_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_9_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[350:312]),
	.din		(l2d_decc_out_c6[350:312]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_10  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_10_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_10_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[389:351]),
	.din		(l2d_decc_out_c6[389:351]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_11  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_11_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_11_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[428:390]),
	.din		(l2d_decc_out_c6[428:390]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_12  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_12_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_12_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[467:429]),
	.din		(l2d_decc_out_c6[467:429]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_13  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_13_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_13_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[506:468]),
	.din		(l2d_decc_out_c6[506:468]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_14  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_14_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_14_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[545:507]),
	.din		(l2d_decc_out_c6[545:507]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_15  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_15_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_15_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[584:546]),
	.din		(l2d_decc_out_c6[584:546]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39	ff_l2d_l2b_decc_out_c7_16  
     (
     .scan_in(ff_l2d_l2b_decc_out_c7_16_scanin[38:0]),
     .scan_out(ff_l2d_l2b_decc_out_c7_16_scanout[38:0]),
	.dout		(l2d_l2b_decc_out_c7[623:585]),
	.din		(l2d_decc_out_c6[623:585]),
	.l1clk		(l1clk_decc_c7),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_16      ff_l2t_l2d_way_sel_c3  
     (
     .scan_in(ff_l2t_l2d_way_sel_c3_scanin[15:0]),
     .scan_out(ff_l2t_l2d_way_sel_c3_scanout[15:0]),
        .dout           (l2t_l2d_way_sel_c3[15:0]),
        .din            (l2t_l2d_way_sel_c2[15:0]),
        .l1clk            (l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_10	ff_l2b_l2d_fuse_l2d_data_in 
     (
     .scan_in(ff_l2b_l2d_fuse_l2d_data_in_scanin[9:0]),
     .scan_out(ff_l2b_l2d_fuse_l2d_data_in_scanout[9:0]),
	.dout		(l2b_l2d_fuse_l2d_data_in_d),
	.din		(l2b_l2d_fuse_l2d_data_in),
	.l1clk		(l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_10  ff_l2d_l2b_efc_fuse_data 
     (
     .scan_in(ff_l2d_l2b_efc_fuse_data_scanin[9:0]),
     .scan_out(ff_l2d_l2b_efc_fuse_data_scanout[9:0]),
        .dout           (l2d_l2b_efc_fuse_data),
        .din            (efc_fuse_data),
        .l1clk            (l1clk_out),
  .siclk(siclk),
  .soclk(soclk)
        );


n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_7  ff_l2b_l2d_fuse_rid_d 
     (
     .scan_in(ff_l2b_l2d_fuse_rid_d_scanin[6:0]),
     .scan_out(ff_l2b_l2d_fuse_rid_d_scanout[6:0]),
        .din            (l2b_l2d_fuse_rid),
        .dout           (l2b_l2d_fuse_rid_d),
        .l1clk            (l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1  ff_l2b_l2d_fuse_wren_d 
     (
     .scan_in(ff_l2b_l2d_fuse_wren_d_scanin[0:0]),
     .scan_out(ff_l2b_l2d_fuse_wren_d_scanout[0:0]),
        .din            (l2b_l2d_fuse_l2d_wren),
        .dout           (l2b_l2d_fuse_l2d_wren_stg),
        .l1clk            (l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
        );
//assign l2b_l2d_fuse_l2d_wren_d = (l2b_l2d_fuse_l2d_wren_stg) & (~wr_inhibit);

n2_l2d_sp_512kb_cust_inv_macro__width_2 inv_wr_inhibit 
	(
	.dout	({l2b_l2d_fuse_reset_stg_n,wr_inhibit_n}),
	.din	({l2b_l2d_fuse_reset_stg,wr_inhibit})
	);
n2_l2d_sp_512kb_cust_and_macro__width_1 and_l2b_l2d_fuse_l2d_wren_d 
	(
	.dout	(l2b_l2d_fuse_l2d_wren_d),
	.din0	(wr_inhibit_n),
	.din1	(l2b_l2d_fuse_l2d_wren_stg)
	);
	
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1  ff_l2b_l2d_fuse_reset_d 
     (
     .scan_in(ff_l2b_l2d_fuse_reset_d_scanin[0:0]),
     .scan_out(ff_l2b_l2d_fuse_reset_d_scanout[0:0]),
        .din            (l2b_l2d_fuse_reset),
        .dout           (l2b_l2d_fuse_reset_stg),
        .l1clk            (l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
        );
//assign l2b_l2d_fuse_reset_d_l =  ~l2b_l2d_fuse_reset_stg | wr_inhibit;

n2_l2d_sp_512kb_cust_or_macro__width_1 and_l2b_l2d_fuse_reset_d_l 
        (
        .dout   (l2b_l2d_fuse_reset_d_l),
        .din0   (wr_inhibit),
        .din1   (l2b_l2d_fuse_reset_stg_n)
        );

//always@(l2t_l2d_way_sel_c3)
//begin
//case(l2t_l2d_way_sel_c3)
//16'b0000_0000_0000_0000   :       wayerr_c3 = 1;
//16'b0000_0000_0000_0001   :       wayerr_c3 = 0;
//16'b0000_0000_0000_0010   :       wayerr_c3 = 0;
//16'b0000_0000_0000_0100   :       wayerr_c3 = 0;
//16'b0000_0000_0000_1000   :       wayerr_c3 = 0;
//16'b0000_0000_0001_0000   :	  wayerr_c3 = 0;
//16'b0000_0000_0010_0000   :	  wayerr_c3 = 0;
//16'b0000_0000_0100_0000   :	  wayerr_c3 = 0;
//16'b0000_0000_1000_0000   :	  wayerr_c3 = 0;
//16'b0000_0001_0000_0000   :	  wayerr_c3 = 0;
//16'b0000_0010_0000_0000   :	  wayerr_c3 = 0;
//16'b0000_0100_0000_0000   :	  wayerr_c3 = 0;
//16'b0000_1000_0000_0000   :	  wayerr_c3 = 0;
//16'b0001_0000_0000_0000   :	  wayerr_c3 = 0;
//16'b0010_0000_0000_0000   :	  wayerr_c3 = 0;
//16'b0100_0000_0000_0000   :	  wayerr_c3 = 0;
//16'b1000_0000_0000_0000   :	  wayerr_c3 = 0;
//default                   :       wayerr_c3 = 1;
//endcase
//end

l2t_wayerr_ctl  way_err_computed
        (
        .wayerr_c3      (wayerr_c3),
        .l2t_l2d_way_sel_c3(l2t_l2d_way_sel_c3[15:0])
        );


// scanorder start
//  ff_l2t_l2d_rd_wr_c3_scanin
//  ff_l2t_l2d_way_sel_c3_scanin[0:15]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_1_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_5_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_3_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_7_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_9_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_13_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_11_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_15_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[0]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[1]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[2]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[3]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[4]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[5]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[6]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[7]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[8]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[9]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[10]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[11]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[12]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[13]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[14]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[15]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[16]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[17]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[18]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[19]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[20]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[21]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[22]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[23]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[24]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[25]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[26]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[27]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[28]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[29]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[30]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[31]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[32]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[33]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[34]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[35]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[36]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[37]
//  ff_l2b_l2d_fbdecc_c5_2_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_6_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_4_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_8_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_10_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_14_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_12_scanin[38]
//  ff_l2b_l2d_fbdecc_c5_16_scanin[38]

//  ff_l2d_l2b_decc_out_c7_1_scanin[0]
//  ff_l2d_l2b_decc_out_c7_5_scanin[0]
//  ff_l2d_l2b_decc_out_c7_3_scanin[0]
//  ff_l2d_l2b_decc_out_c7_7_scanin[0]
//  ff_l2d_l2b_decc_out_c7_9_scanin[0]
//  ff_l2d_l2b_decc_out_c7_13_scanin[0]
//  ff_l2d_l2b_decc_out_c7_11_scanin[0]
//  ff_l2d_l2b_decc_out_c7_15_scanin[0]
//  ff_l2d_l2b_decc_out_c7_1_scanin[1]
//  ff_l2d_l2b_decc_out_c7_5_scanin[1]
//  ff_l2d_l2b_decc_out_c7_3_scanin[1]
//  ff_l2d_l2b_decc_out_c7_7_scanin[1]
//  ff_l2d_l2b_decc_out_c7_9_scanin[1]
//  ff_l2d_l2b_decc_out_c7_13_scanin[1]
//  ff_l2d_l2b_decc_out_c7_11_scanin[1]
//  ff_l2d_l2b_decc_out_c7_15_scanin[1]
//  ff_l2d_l2b_decc_out_c7_1_scanin[2]
//  ff_l2d_l2b_decc_out_c7_5_scanin[2]
//  ff_l2d_l2b_decc_out_c7_3_scanin[2]
//  ff_l2d_l2b_decc_out_c7_7_scanin[2]
//  ff_l2d_l2b_decc_out_c7_9_scanin[2]
//  ff_l2d_l2b_decc_out_c7_13_scanin[2]
//  ff_l2d_l2b_decc_out_c7_11_scanin[2]
//  ff_l2d_l2b_decc_out_c7_15_scanin[2]
//  ff_l2d_l2b_decc_out_c7_1_scanin[3]
//  ff_l2d_l2b_decc_out_c7_5_scanin[3]
//  ff_l2d_l2b_decc_out_c7_3_scanin[3]
//  ff_l2d_l2b_decc_out_c7_7_scanin[3]
//  ff_l2d_l2b_decc_out_c7_9_scanin[3]
//  ff_l2d_l2b_decc_out_c7_13_scanin[3]
//  ff_l2d_l2b_decc_out_c7_11_scanin[3]
//  ff_l2d_l2b_decc_out_c7_15_scanin[3]
//  ff_l2d_l2b_decc_out_c7_1_scanin[4]
//  ff_l2d_l2b_decc_out_c7_5_scanin[4]
//  ff_l2d_l2b_decc_out_c7_3_scanin[4]
//  ff_l2d_l2b_decc_out_c7_7_scanin[4]
//  ff_l2d_l2b_decc_out_c7_9_scanin[4]
//  ff_l2d_l2b_decc_out_c7_13_scanin[4]
//  ff_l2d_l2b_decc_out_c7_11_scanin[4]
//  ff_l2d_l2b_decc_out_c7_15_scanin[4]
//  ff_l2d_l2b_decc_out_c7_1_scanin[5]
//  ff_l2d_l2b_decc_out_c7_5_scanin[5]
//  ff_l2d_l2b_decc_out_c7_3_scanin[5]
//  ff_l2d_l2b_decc_out_c7_7_scanin[5]
//  ff_l2d_l2b_decc_out_c7_9_scanin[5]
//  ff_l2d_l2b_decc_out_c7_13_scanin[5]
//  ff_l2d_l2b_decc_out_c7_11_scanin[5]
//  ff_l2d_l2b_decc_out_c7_15_scanin[5]
//  ff_l2d_l2b_decc_out_c7_1_scanin[6]
//  ff_l2d_l2b_decc_out_c7_5_scanin[6]
//  ff_l2d_l2b_decc_out_c7_3_scanin[6]
//  ff_l2d_l2b_decc_out_c7_7_scanin[6]
//  ff_l2d_l2b_decc_out_c7_9_scanin[6]
//  ff_l2d_l2b_decc_out_c7_13_scanin[6]
//  ff_l2d_l2b_decc_out_c7_11_scanin[6]
//  ff_l2d_l2b_decc_out_c7_15_scanin[6]
//  ff_l2d_l2b_decc_out_c7_1_scanin[7]
//  ff_l2d_l2b_decc_out_c7_5_scanin[7]
//  ff_l2d_l2b_decc_out_c7_3_scanin[7]
//  ff_l2d_l2b_decc_out_c7_7_scanin[7]
//  ff_l2d_l2b_decc_out_c7_9_scanin[7]
//  ff_l2d_l2b_decc_out_c7_13_scanin[7]
//  ff_l2d_l2b_decc_out_c7_11_scanin[7]
//  ff_l2d_l2b_decc_out_c7_15_scanin[7]
//  ff_l2d_l2b_decc_out_c7_1_scanin[8]
//  ff_l2d_l2b_decc_out_c7_5_scanin[8]
//  ff_l2d_l2b_decc_out_c7_3_scanin[8]
//  ff_l2d_l2b_decc_out_c7_7_scanin[8]
//  ff_l2d_l2b_decc_out_c7_9_scanin[8]
//  ff_l2d_l2b_decc_out_c7_13_scanin[8]
//  ff_l2d_l2b_decc_out_c7_11_scanin[8]
//  ff_l2d_l2b_decc_out_c7_15_scanin[8]
//  ff_l2d_l2b_decc_out_c7_1_scanin[9]
//  ff_l2d_l2b_decc_out_c7_5_scanin[9]
//  ff_l2d_l2b_decc_out_c7_3_scanin[9]
//  ff_l2d_l2b_decc_out_c7_7_scanin[9]
//  ff_l2d_l2b_decc_out_c7_9_scanin[9]
//  ff_l2d_l2b_decc_out_c7_13_scanin[9]
//  ff_l2d_l2b_decc_out_c7_11_scanin[9]
//  ff_l2d_l2b_decc_out_c7_15_scanin[9]
//  ff_l2d_l2b_decc_out_c7_1_scanin[10]
//  ff_l2d_l2b_decc_out_c7_5_scanin[10]
//  ff_l2d_l2b_decc_out_c7_3_scanin[10]
//  ff_l2d_l2b_decc_out_c7_7_scanin[10]
//  ff_l2d_l2b_decc_out_c7_9_scanin[10]
//  ff_l2d_l2b_decc_out_c7_13_scanin[10]
//  ff_l2d_l2b_decc_out_c7_11_scanin[10]
//  ff_l2d_l2b_decc_out_c7_15_scanin[10]
//  ff_l2d_l2b_decc_out_c7_1_scanin[11]
//  ff_l2d_l2b_decc_out_c7_5_scanin[11]
//  ff_l2d_l2b_decc_out_c7_3_scanin[11]
//  ff_l2d_l2b_decc_out_c7_7_scanin[11]
//  ff_l2d_l2b_decc_out_c7_9_scanin[11]
//  ff_l2d_l2b_decc_out_c7_13_scanin[11]
//  ff_l2d_l2b_decc_out_c7_11_scanin[11]
//  ff_l2d_l2b_decc_out_c7_15_scanin[11]
//  ff_l2d_l2b_decc_out_c7_1_scanin[12]
//  ff_l2d_l2b_decc_out_c7_5_scanin[12]
//  ff_l2d_l2b_decc_out_c7_3_scanin[12]
//  ff_l2d_l2b_decc_out_c7_7_scanin[12]
//  ff_l2d_l2b_decc_out_c7_9_scanin[12]
//  ff_l2d_l2b_decc_out_c7_13_scanin[12]
//  ff_l2d_l2b_decc_out_c7_11_scanin[12]
//  ff_l2d_l2b_decc_out_c7_15_scanin[12]
//  ff_l2d_l2b_decc_out_c7_1_scanin[13]
//  ff_l2d_l2b_decc_out_c7_5_scanin[13]
//  ff_l2d_l2b_decc_out_c7_3_scanin[13]
//  ff_l2d_l2b_decc_out_c7_7_scanin[13]
//  ff_l2d_l2b_decc_out_c7_9_scanin[13]
//  ff_l2d_l2b_decc_out_c7_13_scanin[13]
//  ff_l2d_l2b_decc_out_c7_11_scanin[13]
//  ff_l2d_l2b_decc_out_c7_15_scanin[13]
//  ff_l2d_l2b_decc_out_c7_1_scanin[14]
//  ff_l2d_l2b_decc_out_c7_5_scanin[14]
//  ff_l2d_l2b_decc_out_c7_3_scanin[14]
//  ff_l2d_l2b_decc_out_c7_7_scanin[14]
//  ff_l2d_l2b_decc_out_c7_9_scanin[14]
//  ff_l2d_l2b_decc_out_c7_13_scanin[14]
//  ff_l2d_l2b_decc_out_c7_11_scanin[14]
//  ff_l2d_l2b_decc_out_c7_15_scanin[14]
//  ff_l2d_l2b_decc_out_c7_1_scanin[15]
//  ff_l2d_l2b_decc_out_c7_5_scanin[15]
//  ff_l2d_l2b_decc_out_c7_3_scanin[15]
//  ff_l2d_l2b_decc_out_c7_7_scanin[15]
//  ff_l2d_l2b_decc_out_c7_9_scanin[15]
//  ff_l2d_l2b_decc_out_c7_13_scanin[15]
//  ff_l2d_l2b_decc_out_c7_11_scanin[15]
//  ff_l2d_l2b_decc_out_c7_15_scanin[15]
//  ff_l2d_l2b_decc_out_c7_1_scanin[16]
//  ff_l2d_l2b_decc_out_c7_5_scanin[16]
//  ff_l2d_l2b_decc_out_c7_3_scanin[16]
//  ff_l2d_l2b_decc_out_c7_7_scanin[16]
//  ff_l2d_l2b_decc_out_c7_9_scanin[16]
//  ff_l2d_l2b_decc_out_c7_13_scanin[16]
//  ff_l2d_l2b_decc_out_c7_11_scanin[16]
//  ff_l2d_l2b_decc_out_c7_15_scanin[16]
//  ff_l2d_l2b_decc_out_c7_1_scanin[17]
//  ff_l2d_l2b_decc_out_c7_5_scanin[17]
//  ff_l2d_l2b_decc_out_c7_3_scanin[17]
//  ff_l2d_l2b_decc_out_c7_7_scanin[17]
//  ff_l2d_l2b_decc_out_c7_9_scanin[17]
//  ff_l2d_l2b_decc_out_c7_13_scanin[17]
//  ff_l2d_l2b_decc_out_c7_11_scanin[17]
//  ff_l2d_l2b_decc_out_c7_15_scanin[17]
//  ff_l2d_l2b_decc_out_c7_1_scanin[18]
//  ff_l2d_l2b_decc_out_c7_5_scanin[18]
//  ff_l2d_l2b_decc_out_c7_3_scanin[18]
//  ff_l2d_l2b_decc_out_c7_7_scanin[18]
//  ff_l2d_l2b_decc_out_c7_9_scanin[18]
//  ff_l2d_l2b_decc_out_c7_13_scanin[18]
//  ff_l2d_l2b_decc_out_c7_11_scanin[18]
//  ff_l2d_l2b_decc_out_c7_15_scanin[18]
//  ff_l2d_l2b_decc_out_c7_1_scanin[19]
//  ff_l2d_l2b_decc_out_c7_5_scanin[19]
//  ff_l2d_l2b_decc_out_c7_3_scanin[19]
//  ff_l2d_l2b_decc_out_c7_7_scanin[19]
//  ff_l2d_l2b_decc_out_c7_9_scanin[19]
//  ff_l2d_l2b_decc_out_c7_13_scanin[19]
//  ff_l2d_l2b_decc_out_c7_11_scanin[19]
//  ff_l2d_l2b_decc_out_c7_15_scanin[19]
//  ff_l2d_l2b_decc_out_c7_1_scanin[20]
//  ff_l2d_l2b_decc_out_c7_5_scanin[20]
//  ff_l2d_l2b_decc_out_c7_3_scanin[20]
//  ff_l2d_l2b_decc_out_c7_7_scanin[20]
//  ff_l2d_l2b_decc_out_c7_9_scanin[20]
//  ff_l2d_l2b_decc_out_c7_13_scanin[20]
//  ff_l2d_l2b_decc_out_c7_11_scanin[20]
//  ff_l2d_l2b_decc_out_c7_15_scanin[20]
//  ff_l2d_l2b_decc_out_c7_1_scanin[21]
//  ff_l2d_l2b_decc_out_c7_5_scanin[21]
//  ff_l2d_l2b_decc_out_c7_3_scanin[21]
//  ff_l2d_l2b_decc_out_c7_7_scanin[21]
//  ff_l2d_l2b_decc_out_c7_9_scanin[21]
//  ff_l2d_l2b_decc_out_c7_13_scanin[21]
//  ff_l2d_l2b_decc_out_c7_11_scanin[21]
//  ff_l2d_l2b_decc_out_c7_15_scanin[21]
//  ff_l2d_l2b_decc_out_c7_1_scanin[22]
//  ff_l2d_l2b_decc_out_c7_5_scanin[22]
//  ff_l2d_l2b_decc_out_c7_3_scanin[22]
//  ff_l2d_l2b_decc_out_c7_7_scanin[22]
//  ff_l2d_l2b_decc_out_c7_9_scanin[22]
//  ff_l2d_l2b_decc_out_c7_13_scanin[22]
//  ff_l2d_l2b_decc_out_c7_11_scanin[22]
//  ff_l2d_l2b_decc_out_c7_15_scanin[22]
//  ff_l2d_l2b_decc_out_c7_1_scanin[23]
//  ff_l2d_l2b_decc_out_c7_5_scanin[23]
//  ff_l2d_l2b_decc_out_c7_3_scanin[23]
//  ff_l2d_l2b_decc_out_c7_7_scanin[23]
//  ff_l2d_l2b_decc_out_c7_9_scanin[23]
//  ff_l2d_l2b_decc_out_c7_13_scanin[23]
//  ff_l2d_l2b_decc_out_c7_11_scanin[23]
//  ff_l2d_l2b_decc_out_c7_15_scanin[23]
//  ff_l2d_l2b_decc_out_c7_1_scanin[24]
//  ff_l2d_l2b_decc_out_c7_5_scanin[24]
//  ff_l2d_l2b_decc_out_c7_3_scanin[24]
//  ff_l2d_l2b_decc_out_c7_7_scanin[24]
//  ff_l2d_l2b_decc_out_c7_9_scanin[24]
//  ff_l2d_l2b_decc_out_c7_13_scanin[24]
//  ff_l2d_l2b_decc_out_c7_11_scanin[24]
//  ff_l2d_l2b_decc_out_c7_15_scanin[24]
//  ff_l2d_l2b_decc_out_c7_1_scanin[25]
//  ff_l2d_l2b_decc_out_c7_5_scanin[25]
//  ff_l2d_l2b_decc_out_c7_3_scanin[25]
//  ff_l2d_l2b_decc_out_c7_7_scanin[25]
//  ff_l2d_l2b_decc_out_c7_9_scanin[25]
//  ff_l2d_l2b_decc_out_c7_13_scanin[25]
//  ff_l2d_l2b_decc_out_c7_11_scanin[25]
//  ff_l2d_l2b_decc_out_c7_15_scanin[25]
//  ff_l2d_l2b_decc_out_c7_1_scanin[26]
//  ff_l2d_l2b_decc_out_c7_5_scanin[26]
//  ff_l2d_l2b_decc_out_c7_3_scanin[26]
//  ff_l2d_l2b_decc_out_c7_7_scanin[26]
//  ff_l2d_l2b_decc_out_c7_9_scanin[26]
//  ff_l2d_l2b_decc_out_c7_13_scanin[26]
//  ff_l2d_l2b_decc_out_c7_11_scanin[26]
//  ff_l2d_l2b_decc_out_c7_15_scanin[26]
//  ff_l2d_l2b_decc_out_c7_1_scanin[27]
//  ff_l2d_l2b_decc_out_c7_5_scanin[27]
//  ff_l2d_l2b_decc_out_c7_3_scanin[27]
//  ff_l2d_l2b_decc_out_c7_7_scanin[27]
//  ff_l2d_l2b_decc_out_c7_9_scanin[27]
//  ff_l2d_l2b_decc_out_c7_13_scanin[27]
//  ff_l2d_l2b_decc_out_c7_11_scanin[27]
//  ff_l2d_l2b_decc_out_c7_15_scanin[27]
//  ff_l2d_l2b_decc_out_c7_1_scanin[28]
//  ff_l2d_l2b_decc_out_c7_5_scanin[28]
//  ff_l2d_l2b_decc_out_c7_3_scanin[28]
//  ff_l2d_l2b_decc_out_c7_7_scanin[28]
//  ff_l2d_l2b_decc_out_c7_9_scanin[28]
//  ff_l2d_l2b_decc_out_c7_13_scanin[28]
//  ff_l2d_l2b_decc_out_c7_11_scanin[28]
//  ff_l2d_l2b_decc_out_c7_15_scanin[28]
//  ff_l2d_l2b_decc_out_c7_1_scanin[29]
//  ff_l2d_l2b_decc_out_c7_5_scanin[29]
//  ff_l2d_l2b_decc_out_c7_3_scanin[29]
//  ff_l2d_l2b_decc_out_c7_7_scanin[29]
//  ff_l2d_l2b_decc_out_c7_9_scanin[29]
//  ff_l2d_l2b_decc_out_c7_13_scanin[29]
//  ff_l2d_l2b_decc_out_c7_11_scanin[29]
//  ff_l2d_l2b_decc_out_c7_15_scanin[29]
//  ff_l2d_l2b_decc_out_c7_1_scanin[30]
//  ff_l2d_l2b_decc_out_c7_5_scanin[30]
//  ff_l2d_l2b_decc_out_c7_3_scanin[30]
//  ff_l2d_l2b_decc_out_c7_7_scanin[30]
//  ff_l2d_l2b_decc_out_c7_9_scanin[30]
//  ff_l2d_l2b_decc_out_c7_13_scanin[30]
//  ff_l2d_l2b_decc_out_c7_11_scanin[30]
//  ff_l2d_l2b_decc_out_c7_15_scanin[30]
//  ff_l2d_l2b_decc_out_c7_1_scanin[31]
//  ff_l2d_l2b_decc_out_c7_5_scanin[31]
//  ff_l2d_l2b_decc_out_c7_3_scanin[31]
//  ff_l2d_l2b_decc_out_c7_7_scanin[31]
//  ff_l2d_l2b_decc_out_c7_9_scanin[31]
//  ff_l2d_l2b_decc_out_c7_13_scanin[31]
//  ff_l2d_l2b_decc_out_c7_11_scanin[31]
//  ff_l2d_l2b_decc_out_c7_15_scanin[31]
//  ff_l2d_l2b_decc_out_c7_1_scanin[32]
//  ff_l2d_l2b_decc_out_c7_5_scanin[32]
//  ff_l2d_l2b_decc_out_c7_3_scanin[32]
//  ff_l2d_l2b_decc_out_c7_7_scanin[32]
//  ff_l2d_l2b_decc_out_c7_9_scanin[32]
//  ff_l2d_l2b_decc_out_c7_13_scanin[32]
//  ff_l2d_l2b_decc_out_c7_11_scanin[32]
//  ff_l2d_l2b_decc_out_c7_15_scanin[32]
//  ff_l2d_l2b_decc_out_c7_1_scanin[33]
//  ff_l2d_l2b_decc_out_c7_5_scanin[33]
//  ff_l2d_l2b_decc_out_c7_3_scanin[33]
//  ff_l2d_l2b_decc_out_c7_7_scanin[33]
//  ff_l2d_l2b_decc_out_c7_9_scanin[33]
//  ff_l2d_l2b_decc_out_c7_13_scanin[33]
//  ff_l2d_l2b_decc_out_c7_11_scanin[33]
//  ff_l2d_l2b_decc_out_c7_15_scanin[33]
//  ff_l2d_l2b_decc_out_c7_1_scanin[34]
//  ff_l2d_l2b_decc_out_c7_5_scanin[34]
//  ff_l2d_l2b_decc_out_c7_3_scanin[34]
//  ff_l2d_l2b_decc_out_c7_7_scanin[34]
//  ff_l2d_l2b_decc_out_c7_9_scanin[34]
//  ff_l2d_l2b_decc_out_c7_13_scanin[34]
//  ff_l2d_l2b_decc_out_c7_11_scanin[34]
//  ff_l2d_l2b_decc_out_c7_15_scanin[34]
//  ff_l2d_l2b_decc_out_c7_1_scanin[35]
//  ff_l2d_l2b_decc_out_c7_5_scanin[35]
//  ff_l2d_l2b_decc_out_c7_3_scanin[35]
//  ff_l2d_l2b_decc_out_c7_7_scanin[35]
//  ff_l2d_l2b_decc_out_c7_9_scanin[35]
//  ff_l2d_l2b_decc_out_c7_13_scanin[35]
//  ff_l2d_l2b_decc_out_c7_11_scanin[35]
//  ff_l2d_l2b_decc_out_c7_15_scanin[35]
//  ff_l2d_l2b_decc_out_c7_1_scanin[36]
//  ff_l2d_l2b_decc_out_c7_5_scanin[36]
//  ff_l2d_l2b_decc_out_c7_3_scanin[36]
//  ff_l2d_l2b_decc_out_c7_7_scanin[36]
//  ff_l2d_l2b_decc_out_c7_9_scanin[36]
//  ff_l2d_l2b_decc_out_c7_13_scanin[36]
//  ff_l2d_l2b_decc_out_c7_11_scanin[36]
//  ff_l2d_l2b_decc_out_c7_15_scanin[36]
//  ff_l2d_l2b_decc_out_c7_1_scanin[37]
//  ff_l2d_l2b_decc_out_c7_5_scanin[37]
//  ff_l2d_l2b_decc_out_c7_3_scanin[37]
//  ff_l2d_l2b_decc_out_c7_7_scanin[37]
//  ff_l2d_l2b_decc_out_c7_9_scanin[37]
//  ff_l2d_l2b_decc_out_c7_13_scanin[37]
//  ff_l2d_l2b_decc_out_c7_11_scanin[37]
//  ff_l2d_l2b_decc_out_c7_15_scanin[37]
//  ff_l2d_l2b_decc_out_c7_1_scanin[38]
//  ff_l2d_l2b_decc_out_c7_5_scanin[38]
//  ff_l2d_l2b_decc_out_c7_3_scanin[38]
//  ff_l2d_l2b_decc_out_c7_7_scanin[38]
//  ff_l2d_l2b_decc_out_c7_9_scanin[38]
//  ff_l2d_l2b_decc_out_c7_13_scanin[38]
//  ff_l2d_l2b_decc_out_c7_11_scanin[38]
//  ff_l2d_l2b_decc_out_c7_15_scanin[38]
//  ff_l2d_l2b_decc_out_c7_2_scanin[0]
//  ff_l2d_l2b_decc_out_c7_6_scanin[0]
//  ff_l2d_l2b_decc_out_c7_4_scanin[0]
//  ff_l2d_l2b_decc_out_c7_8_scanin[0]
//  ff_l2d_l2b_decc_out_c7_10_scanin[0]
//  ff_l2d_l2b_decc_out_c7_14_scanin[0]
//  ff_l2d_l2b_decc_out_c7_12_scanin[0]
//  ff_l2d_l2b_decc_out_c7_16_scanin[0]
//  ff_l2d_l2b_decc_out_c7_2_scanin[1]
//  ff_l2d_l2b_decc_out_c7_6_scanin[1]
//  ff_l2d_l2b_decc_out_c7_4_scanin[1]
//  ff_l2d_l2b_decc_out_c7_8_scanin[1]
//  ff_l2d_l2b_decc_out_c7_10_scanin[1]
//  ff_l2d_l2b_decc_out_c7_14_scanin[1]
//  ff_l2d_l2b_decc_out_c7_12_scanin[1]
//  ff_l2d_l2b_decc_out_c7_16_scanin[1]
//  ff_l2d_l2b_decc_out_c7_2_scanin[2]
//  ff_l2d_l2b_decc_out_c7_6_scanin[2]
//  ff_l2d_l2b_decc_out_c7_4_scanin[2]
//  ff_l2d_l2b_decc_out_c7_8_scanin[2]
//  ff_l2d_l2b_decc_out_c7_10_scanin[2]
//  ff_l2d_l2b_decc_out_c7_14_scanin[2]
//  ff_l2d_l2b_decc_out_c7_12_scanin[2]
//  ff_l2d_l2b_decc_out_c7_16_scanin[2]
//  ff_l2d_l2b_decc_out_c7_2_scanin[3]
//  ff_l2d_l2b_decc_out_c7_6_scanin[3]
//  ff_l2d_l2b_decc_out_c7_4_scanin[3]
//  ff_l2d_l2b_decc_out_c7_8_scanin[3]
//  ff_l2d_l2b_decc_out_c7_10_scanin[3]
//  ff_l2d_l2b_decc_out_c7_14_scanin[3]
//  ff_l2d_l2b_decc_out_c7_12_scanin[3]
//  ff_l2d_l2b_decc_out_c7_16_scanin[3]
//  ff_l2d_l2b_decc_out_c7_2_scanin[4]
//  ff_l2d_l2b_decc_out_c7_6_scanin[4]
//  ff_l2d_l2b_decc_out_c7_4_scanin[4]
//  ff_l2d_l2b_decc_out_c7_8_scanin[4]
//  ff_l2d_l2b_decc_out_c7_10_scanin[4]
//  ff_l2d_l2b_decc_out_c7_14_scanin[4]
//  ff_l2d_l2b_decc_out_c7_12_scanin[4]
//  ff_l2d_l2b_decc_out_c7_16_scanin[4]
//  ff_l2d_l2b_decc_out_c7_2_scanin[5]
//  ff_l2d_l2b_decc_out_c7_6_scanin[5]
//  ff_l2d_l2b_decc_out_c7_4_scanin[5]
//  ff_l2d_l2b_decc_out_c7_8_scanin[5]
//  ff_l2d_l2b_decc_out_c7_10_scanin[5]
//  ff_l2d_l2b_decc_out_c7_14_scanin[5]
//  ff_l2d_l2b_decc_out_c7_12_scanin[5]
//  ff_l2d_l2b_decc_out_c7_16_scanin[5]
//  ff_l2d_l2b_decc_out_c7_2_scanin[6]
//  ff_l2d_l2b_decc_out_c7_6_scanin[6]
//  ff_l2d_l2b_decc_out_c7_4_scanin[6]
//  ff_l2d_l2b_decc_out_c7_8_scanin[6]
//  ff_l2d_l2b_decc_out_c7_10_scanin[6]
//  ff_l2d_l2b_decc_out_c7_14_scanin[6]
//  ff_l2d_l2b_decc_out_c7_12_scanin[6]
//  ff_l2d_l2b_decc_out_c7_16_scanin[6]
//  ff_l2d_l2b_decc_out_c7_2_scanin[7]
//  ff_l2d_l2b_decc_out_c7_6_scanin[7]
//  ff_l2d_l2b_decc_out_c7_4_scanin[7]
//  ff_l2d_l2b_decc_out_c7_8_scanin[7]
//  ff_l2d_l2b_decc_out_c7_10_scanin[7]
//  ff_l2d_l2b_decc_out_c7_14_scanin[7]
//  ff_l2d_l2b_decc_out_c7_12_scanin[7]
//  ff_l2d_l2b_decc_out_c7_16_scanin[7]
//  ff_l2d_l2b_decc_out_c7_2_scanin[8]
//  ff_l2d_l2b_decc_out_c7_6_scanin[8]
//  ff_l2d_l2b_decc_out_c7_4_scanin[8]
//  ff_l2d_l2b_decc_out_c7_8_scanin[8]
//  ff_l2d_l2b_decc_out_c7_10_scanin[8]
//  ff_l2d_l2b_decc_out_c7_14_scanin[8]
//  ff_l2d_l2b_decc_out_c7_12_scanin[8]
//  ff_l2d_l2b_decc_out_c7_16_scanin[8]
//  ff_l2d_l2b_decc_out_c7_2_scanin[9]
//  ff_l2d_l2b_decc_out_c7_6_scanin[9]
//  ff_l2d_l2b_decc_out_c7_4_scanin[9]
//  ff_l2d_l2b_decc_out_c7_8_scanin[9]
//  ff_l2d_l2b_decc_out_c7_10_scanin[9]
//  ff_l2d_l2b_decc_out_c7_14_scanin[9]
//  ff_l2d_l2b_decc_out_c7_12_scanin[9]
//  ff_l2d_l2b_decc_out_c7_16_scanin[9]
//  ff_l2d_l2b_decc_out_c7_2_scanin[10]
//  ff_l2d_l2b_decc_out_c7_6_scanin[10]
//  ff_l2d_l2b_decc_out_c7_4_scanin[10]
//  ff_l2d_l2b_decc_out_c7_8_scanin[10]
//  ff_l2d_l2b_decc_out_c7_10_scanin[10]
//  ff_l2d_l2b_decc_out_c7_14_scanin[10]
//  ff_l2d_l2b_decc_out_c7_12_scanin[10]
//  ff_l2d_l2b_decc_out_c7_16_scanin[10]
//  ff_l2d_l2b_decc_out_c7_2_scanin[11]
//  ff_l2d_l2b_decc_out_c7_6_scanin[11]
//  ff_l2d_l2b_decc_out_c7_4_scanin[11]
//  ff_l2d_l2b_decc_out_c7_8_scanin[11]
//  ff_l2d_l2b_decc_out_c7_10_scanin[11]
//  ff_l2d_l2b_decc_out_c7_14_scanin[11]
//  ff_l2d_l2b_decc_out_c7_12_scanin[11]
//  ff_l2d_l2b_decc_out_c7_16_scanin[11]
//  ff_l2d_l2b_decc_out_c7_2_scanin[12]
//  ff_l2d_l2b_decc_out_c7_6_scanin[12]
//  ff_l2d_l2b_decc_out_c7_4_scanin[12]
//  ff_l2d_l2b_decc_out_c7_8_scanin[12]
//  ff_l2d_l2b_decc_out_c7_10_scanin[12]
//  ff_l2d_l2b_decc_out_c7_14_scanin[12]
//  ff_l2d_l2b_decc_out_c7_12_scanin[12]
//  ff_l2d_l2b_decc_out_c7_16_scanin[12]
//  ff_l2d_l2b_decc_out_c7_2_scanin[13]
//  ff_l2d_l2b_decc_out_c7_6_scanin[13]
//  ff_l2d_l2b_decc_out_c7_4_scanin[13]
//  ff_l2d_l2b_decc_out_c7_8_scanin[13]
//  ff_l2d_l2b_decc_out_c7_10_scanin[13]
//  ff_l2d_l2b_decc_out_c7_14_scanin[13]
//  ff_l2d_l2b_decc_out_c7_12_scanin[13]
//  ff_l2d_l2b_decc_out_c7_16_scanin[13]
//  ff_l2d_l2b_decc_out_c7_2_scanin[14]
//  ff_l2d_l2b_decc_out_c7_6_scanin[14]
//  ff_l2d_l2b_decc_out_c7_4_scanin[14]
//  ff_l2d_l2b_decc_out_c7_8_scanin[14]
//  ff_l2d_l2b_decc_out_c7_10_scanin[14]
//  ff_l2d_l2b_decc_out_c7_14_scanin[14]
//  ff_l2d_l2b_decc_out_c7_12_scanin[14]
//  ff_l2d_l2b_decc_out_c7_16_scanin[14]
//  ff_l2d_l2b_decc_out_c7_2_scanin[15]
//  ff_l2d_l2b_decc_out_c7_6_scanin[15]
//  ff_l2d_l2b_decc_out_c7_4_scanin[15]
//  ff_l2d_l2b_decc_out_c7_8_scanin[15]
//  ff_l2d_l2b_decc_out_c7_10_scanin[15]
//  ff_l2d_l2b_decc_out_c7_14_scanin[15]
//  ff_l2d_l2b_decc_out_c7_12_scanin[15]
//  ff_l2d_l2b_decc_out_c7_16_scanin[15]
//  ff_l2d_l2b_decc_out_c7_2_scanin[16]
//  ff_l2d_l2b_decc_out_c7_6_scanin[16]
//  ff_l2d_l2b_decc_out_c7_4_scanin[16]
//  ff_l2d_l2b_decc_out_c7_8_scanin[16]
//  ff_l2d_l2b_decc_out_c7_10_scanin[16]
//  ff_l2d_l2b_decc_out_c7_14_scanin[16]
//  ff_l2d_l2b_decc_out_c7_12_scanin[16]
//  ff_l2d_l2b_decc_out_c7_16_scanin[16]
//  ff_l2d_l2b_decc_out_c7_2_scanin[17]
//  ff_l2d_l2b_decc_out_c7_6_scanin[17]
//  ff_l2d_l2b_decc_out_c7_4_scanin[17]
//  ff_l2d_l2b_decc_out_c7_8_scanin[17]
//  ff_l2d_l2b_decc_out_c7_10_scanin[17]
//  ff_l2d_l2b_decc_out_c7_14_scanin[17]
//  ff_l2d_l2b_decc_out_c7_12_scanin[17]
//  ff_l2d_l2b_decc_out_c7_16_scanin[17]
//  ff_l2d_l2b_decc_out_c7_2_scanin[18]
//  ff_l2d_l2b_decc_out_c7_6_scanin[18]
//  ff_l2d_l2b_decc_out_c7_4_scanin[18]
//  ff_l2d_l2b_decc_out_c7_8_scanin[18]
//  ff_l2d_l2b_decc_out_c7_10_scanin[18]
//  ff_l2d_l2b_decc_out_c7_14_scanin[18]
//  ff_l2d_l2b_decc_out_c7_12_scanin[18]
//  ff_l2d_l2b_decc_out_c7_16_scanin[18]
//  ff_l2d_l2b_decc_out_c7_2_scanin[19]
//  ff_l2d_l2b_decc_out_c7_6_scanin[19]
//  ff_l2d_l2b_decc_out_c7_4_scanin[19]
//  ff_l2d_l2b_decc_out_c7_8_scanin[19]
//  ff_l2d_l2b_decc_out_c7_10_scanin[19]
//  ff_l2d_l2b_decc_out_c7_14_scanin[19]
//  ff_l2d_l2b_decc_out_c7_12_scanin[19]
//  ff_l2d_l2b_decc_out_c7_16_scanin[19]
//  ff_l2d_l2b_decc_out_c7_2_scanin[20]
//  ff_l2d_l2b_decc_out_c7_6_scanin[20]
//  ff_l2d_l2b_decc_out_c7_4_scanin[20]
//  ff_l2d_l2b_decc_out_c7_8_scanin[20]
//  ff_l2d_l2b_decc_out_c7_10_scanin[20]
//  ff_l2d_l2b_decc_out_c7_14_scanin[20]
//  ff_l2d_l2b_decc_out_c7_12_scanin[20]
//  ff_l2d_l2b_decc_out_c7_16_scanin[20]
//  ff_l2d_l2b_decc_out_c7_2_scanin[21]
//  ff_l2d_l2b_decc_out_c7_6_scanin[21]
//  ff_l2d_l2b_decc_out_c7_4_scanin[21]
//  ff_l2d_l2b_decc_out_c7_8_scanin[21]
//  ff_l2d_l2b_decc_out_c7_10_scanin[21]
//  ff_l2d_l2b_decc_out_c7_14_scanin[21]
//  ff_l2d_l2b_decc_out_c7_12_scanin[21]
//  ff_l2d_l2b_decc_out_c7_16_scanin[21]
//  ff_l2d_l2b_decc_out_c7_2_scanin[22]
//  ff_l2d_l2b_decc_out_c7_6_scanin[22]
//  ff_l2d_l2b_decc_out_c7_4_scanin[22]
//  ff_l2d_l2b_decc_out_c7_8_scanin[22]
//  ff_l2d_l2b_decc_out_c7_10_scanin[22]
//  ff_l2d_l2b_decc_out_c7_14_scanin[22]
//  ff_l2d_l2b_decc_out_c7_12_scanin[22]
//  ff_l2d_l2b_decc_out_c7_16_scanin[22]
//  ff_l2d_l2b_decc_out_c7_2_scanin[23]
//  ff_l2d_l2b_decc_out_c7_6_scanin[23]
//  ff_l2d_l2b_decc_out_c7_4_scanin[23]
//  ff_l2d_l2b_decc_out_c7_8_scanin[23]
//  ff_l2d_l2b_decc_out_c7_10_scanin[23]
//  ff_l2d_l2b_decc_out_c7_14_scanin[23]
//  ff_l2d_l2b_decc_out_c7_12_scanin[23]
//  ff_l2d_l2b_decc_out_c7_16_scanin[23]
//  ff_l2d_l2b_decc_out_c7_2_scanin[24]
//  ff_l2d_l2b_decc_out_c7_6_scanin[24]
//  ff_l2d_l2b_decc_out_c7_4_scanin[24]
//  ff_l2d_l2b_decc_out_c7_8_scanin[24]
//  ff_l2d_l2b_decc_out_c7_10_scanin[24]
//  ff_l2d_l2b_decc_out_c7_14_scanin[24]
//  ff_l2d_l2b_decc_out_c7_12_scanin[24]
//  ff_l2d_l2b_decc_out_c7_16_scanin[24]
//  ff_l2d_l2b_decc_out_c7_2_scanin[25]
//  ff_l2d_l2b_decc_out_c7_6_scanin[25]
//  ff_l2d_l2b_decc_out_c7_4_scanin[25]
//  ff_l2d_l2b_decc_out_c7_8_scanin[25]
//  ff_l2d_l2b_decc_out_c7_10_scanin[25]
//  ff_l2d_l2b_decc_out_c7_14_scanin[25]
//  ff_l2d_l2b_decc_out_c7_12_scanin[25]
//  ff_l2d_l2b_decc_out_c7_16_scanin[25]
//  ff_l2d_l2b_decc_out_c7_2_scanin[26]
//  ff_l2d_l2b_decc_out_c7_6_scanin[26]
//  ff_l2d_l2b_decc_out_c7_4_scanin[26]
//  ff_l2d_l2b_decc_out_c7_8_scanin[26]
//  ff_l2d_l2b_decc_out_c7_10_scanin[26]
//  ff_l2d_l2b_decc_out_c7_14_scanin[26]
//  ff_l2d_l2b_decc_out_c7_12_scanin[26]
//  ff_l2d_l2b_decc_out_c7_16_scanin[26]
//  ff_l2d_l2b_decc_out_c7_2_scanin[27]
//  ff_l2d_l2b_decc_out_c7_6_scanin[27]
//  ff_l2d_l2b_decc_out_c7_4_scanin[27]
//  ff_l2d_l2b_decc_out_c7_8_scanin[27]
//  ff_l2d_l2b_decc_out_c7_10_scanin[27]
//  ff_l2d_l2b_decc_out_c7_14_scanin[27]
//  ff_l2d_l2b_decc_out_c7_12_scanin[27]
//  ff_l2d_l2b_decc_out_c7_16_scanin[27]
//  ff_l2d_l2b_decc_out_c7_2_scanin[28]
//  ff_l2d_l2b_decc_out_c7_6_scanin[28]
//  ff_l2d_l2b_decc_out_c7_4_scanin[28]
//  ff_l2d_l2b_decc_out_c7_8_scanin[28]
//  ff_l2d_l2b_decc_out_c7_10_scanin[28]
//  ff_l2d_l2b_decc_out_c7_14_scanin[28]
//  ff_l2d_l2b_decc_out_c7_12_scanin[28]
//  ff_l2d_l2b_decc_out_c7_16_scanin[28]
//  ff_l2d_l2b_decc_out_c7_2_scanin[29]
//  ff_l2d_l2b_decc_out_c7_6_scanin[29]
//  ff_l2d_l2b_decc_out_c7_4_scanin[29]
//  ff_l2d_l2b_decc_out_c7_8_scanin[29]
//  ff_l2d_l2b_decc_out_c7_10_scanin[29]
//  ff_l2d_l2b_decc_out_c7_14_scanin[29]
//  ff_l2d_l2b_decc_out_c7_12_scanin[29]
//  ff_l2d_l2b_decc_out_c7_16_scanin[29]
//  ff_l2d_l2b_decc_out_c7_2_scanin[30]
//  ff_l2d_l2b_decc_out_c7_6_scanin[30]
//  ff_l2d_l2b_decc_out_c7_4_scanin[30]
//  ff_l2d_l2b_decc_out_c7_8_scanin[30]
//  ff_l2d_l2b_decc_out_c7_10_scanin[30]
//  ff_l2d_l2b_decc_out_c7_14_scanin[30]
//  ff_l2d_l2b_decc_out_c7_12_scanin[30]
//  ff_l2d_l2b_decc_out_c7_16_scanin[30]
//  ff_l2d_l2b_decc_out_c7_2_scanin[31]
//  ff_l2d_l2b_decc_out_c7_6_scanin[31]
//  ff_l2d_l2b_decc_out_c7_4_scanin[31]
//  ff_l2d_l2b_decc_out_c7_8_scanin[31]
//  ff_l2d_l2b_decc_out_c7_10_scanin[31]
//  ff_l2d_l2b_decc_out_c7_14_scanin[31]
//  ff_l2d_l2b_decc_out_c7_12_scanin[31]
//  ff_l2d_l2b_decc_out_c7_16_scanin[31]
//  ff_l2d_l2b_decc_out_c7_2_scanin[32]
//  ff_l2d_l2b_decc_out_c7_6_scanin[32]
//  ff_l2d_l2b_decc_out_c7_4_scanin[32]
//  ff_l2d_l2b_decc_out_c7_8_scanin[32]
//  ff_l2d_l2b_decc_out_c7_10_scanin[32]
//  ff_l2d_l2b_decc_out_c7_14_scanin[32]
//  ff_l2d_l2b_decc_out_c7_12_scanin[32]
//  ff_l2d_l2b_decc_out_c7_16_scanin[32]
//  ff_l2d_l2b_decc_out_c7_2_scanin[33]
//  ff_l2d_l2b_decc_out_c7_6_scanin[33]
//  ff_l2d_l2b_decc_out_c7_4_scanin[33]
//  ff_l2d_l2b_decc_out_c7_8_scanin[33]
//  ff_l2d_l2b_decc_out_c7_10_scanin[33]
//  ff_l2d_l2b_decc_out_c7_14_scanin[33]
//  ff_l2d_l2b_decc_out_c7_12_scanin[33]
//  ff_l2d_l2b_decc_out_c7_16_scanin[33]
//  ff_l2d_l2b_decc_out_c7_2_scanin[34]
//  ff_l2d_l2b_decc_out_c7_6_scanin[34]
//  ff_l2d_l2b_decc_out_c7_4_scanin[34]
//  ff_l2d_l2b_decc_out_c7_8_scanin[34]
//  ff_l2d_l2b_decc_out_c7_10_scanin[34]
//  ff_l2d_l2b_decc_out_c7_14_scanin[34]
//  ff_l2d_l2b_decc_out_c7_12_scanin[34]
//  ff_l2d_l2b_decc_out_c7_16_scanin[34]
//  ff_l2d_l2b_decc_out_c7_2_scanin[35]
//  ff_l2d_l2b_decc_out_c7_6_scanin[35]
//  ff_l2d_l2b_decc_out_c7_4_scanin[35]
//  ff_l2d_l2b_decc_out_c7_8_scanin[35]
//  ff_l2d_l2b_decc_out_c7_10_scanin[35]
//  ff_l2d_l2b_decc_out_c7_14_scanin[35]
//  ff_l2d_l2b_decc_out_c7_12_scanin[35]
//  ff_l2d_l2b_decc_out_c7_16_scanin[35]
//  ff_l2d_l2b_decc_out_c7_2_scanin[36]
//  ff_l2d_l2b_decc_out_c7_6_scanin[36]
//  ff_l2d_l2b_decc_out_c7_4_scanin[36]
//  ff_l2d_l2b_decc_out_c7_8_scanin[36]
//  ff_l2d_l2b_decc_out_c7_10_scanin[36]
//  ff_l2d_l2b_decc_out_c7_14_scanin[36]
//  ff_l2d_l2b_decc_out_c7_12_scanin[36]
//  ff_l2d_l2b_decc_out_c7_16_scanin[36]
//  ff_l2d_l2b_decc_out_c7_2_scanin[37]
//  ff_l2d_l2b_decc_out_c7_6_scanin[37]
//  ff_l2d_l2b_decc_out_c7_4_scanin[37]
//  ff_l2d_l2b_decc_out_c7_8_scanin[37]
//  ff_l2d_l2b_decc_out_c7_10_scanin[37]
//  ff_l2d_l2b_decc_out_c7_14_scanin[37]
//  ff_l2d_l2b_decc_out_c7_12_scanin[37]
//  ff_l2d_l2b_decc_out_c7_16_scanin[37]
//  ff_l2d_l2b_decc_out_c7_2_scanin[38]
//  ff_l2d_l2b_decc_out_c7_6_scanin[38]
//  ff_l2d_l2b_decc_out_c7_4_scanin[38]
//  ff_l2d_l2b_decc_out_c7_8_scanin[38]
//  ff_l2d_l2b_decc_out_c7_10_scanin[38]
//  ff_l2d_l2b_decc_out_c7_14_scanin[38]
//  ff_l2d_l2b_decc_out_c7_12_scanin[38]
//  ff_l2d_l2b_decc_out_c7_16_scanin[38]


//  ff_l2d_l2t_decc_c6_scanin[0]
//  ff_l2d_l2t_decc_c6_scanin[78]
//  ff_l2d_l2t_decc_c6_scanin[1]
//  ff_l2d_l2t_decc_c6_scanin[79]
//  ff_l2d_l2t_decc_c6_scanin[2]
//  ff_l2d_l2t_decc_c6_scanin[80]
//  ff_l2d_l2t_decc_c6_scanin[3]
//  ff_l2d_l2t_decc_c6_scanin[81]
//  ff_l2d_l2t_decc_c6_scanin[4]
//  ff_l2d_l2t_decc_c6_scanin[82]
//  ff_l2d_l2t_decc_c6_scanin[5]
//  ff_l2d_l2t_decc_c6_scanin[83]
//  ff_l2d_l2t_decc_c6_scanin[6]
//  ff_l2d_l2t_decc_c6_scanin[84]
//  ff_l2d_l2t_decc_c6_scanin[7]
//  ff_l2d_l2t_decc_c6_scanin[85]
//  ff_l2d_l2t_decc_c6_scanin[8]
//  ff_l2d_l2t_decc_c6_scanin[86]
//  ff_l2d_l2t_decc_c6_scanin[9]
//  ff_l2d_l2t_decc_c6_scanin[87]
//  ff_l2d_l2t_decc_c6_scanin[10]
//  ff_l2d_l2t_decc_c6_scanin[88]
//  ff_l2d_l2t_decc_c6_scanin[11]
//  ff_l2d_l2t_decc_c6_scanin[89]
//  ff_l2d_l2t_decc_c6_scanin[12]
//  ff_l2d_l2t_decc_c6_scanin[90]
//  ff_l2d_l2t_decc_c6_scanin[13]
//  ff_l2d_l2t_decc_c6_scanin[91]
//  ff_l2d_l2t_decc_c6_scanin[14]
//  ff_l2d_l2t_decc_c6_scanin[92]
//  ff_l2d_l2t_decc_c6_scanin[15]
//  ff_l2d_l2t_decc_c6_scanin[93]
//  ff_l2d_l2t_decc_c6_scanin[16]
//  ff_l2d_l2t_decc_c6_scanin[94]
//  ff_l2d_l2t_decc_c6_scanin[17]
//  ff_l2d_l2t_decc_c6_scanin[95]
//  ff_l2d_l2t_decc_c6_scanin[18]
//  ff_l2d_l2t_decc_c6_scanin[96]
//  ff_l2d_l2t_decc_c6_scanin[19]
//  ff_l2d_l2t_decc_c6_scanin[97]
//  ff_l2d_l2t_decc_c6_scanin[20]
//  ff_l2d_l2t_decc_c6_scanin[98]
//  ff_l2d_l2t_decc_c6_scanin[21]
//  ff_l2d_l2t_decc_c6_scanin[99]
//  ff_l2d_l2t_decc_c6_scanin[22]
//  ff_l2d_l2t_decc_c6_scanin[100]
//  ff_l2d_l2t_decc_c6_scanin[23]
//  ff_l2d_l2t_decc_c6_scanin[101]
//  ff_l2d_l2t_decc_c6_scanin[24]
//  ff_l2d_l2t_decc_c6_scanin[102]
//  ff_l2d_l2t_decc_c6_scanin[25]
//  ff_l2d_l2t_decc_c6_scanin[103]
//  ff_l2d_l2t_decc_c6_scanin[26]
//  ff_l2d_l2t_decc_c6_scanin[104]
//  ff_l2d_l2t_decc_c6_scanin[27]
//  ff_l2d_l2t_decc_c6_scanin[105]
//  ff_l2d_l2t_decc_c6_scanin[28]
//  ff_l2d_l2t_decc_c6_scanin[106]
//  ff_l2d_l2t_decc_c6_scanin[29]
//  ff_l2d_l2t_decc_c6_scanin[107]
//  ff_l2d_l2t_decc_c6_scanin[30]
//  ff_l2d_l2t_decc_c6_scanin[108]
//  ff_l2d_l2t_decc_c6_scanin[31]
//  ff_l2d_l2t_decc_c6_scanin[109]
//  ff_l2d_l2t_decc_c6_scanin[32]
//  ff_l2d_l2t_decc_c6_scanin[110]
//  ff_l2d_l2t_decc_c6_scanin[33]
//  ff_l2d_l2t_decc_c6_scanin[111]
//  ff_l2d_l2t_decc_c6_scanin[34]
//  ff_l2d_l2t_decc_c6_scanin[112]
//  ff_l2d_l2t_decc_c6_scanin[35]
//  ff_l2d_l2t_decc_c6_scanin[113]
//  ff_l2d_l2t_decc_c6_scanin[36]
//  ff_l2d_l2t_decc_c6_scanin[114]
//  ff_l2d_l2t_decc_c6_scanin[37]
//  ff_l2d_l2t_decc_c6_scanin[115]
//  ff_l2d_l2t_decc_c6_scanin[38]
//  ff_l2d_l2t_decc_c6_scanin[116]
//  ff_l2d_l2t_decc_c6_scanin[39]
//  ff_l2d_l2t_decc_c6_scanin[117]
//  ff_l2d_l2t_decc_c6_scanin[40]
//  ff_l2d_l2t_decc_c6_scanin[118]
//  ff_l2d_l2t_decc_c6_scanin[41]
//  ff_l2d_l2t_decc_c6_scanin[119]
//  ff_l2d_l2t_decc_c6_scanin[42]
//  ff_l2d_l2t_decc_c6_scanin[120]
//  ff_l2d_l2t_decc_c6_scanin[43]
//  ff_l2d_l2t_decc_c6_scanin[121]
//  ff_l2d_l2t_decc_c6_scanin[44]
//  ff_l2d_l2t_decc_c6_scanin[122]
//  ff_l2d_l2t_decc_c6_scanin[45]
//  ff_l2d_l2t_decc_c6_scanin[123]
//  ff_l2d_l2t_decc_c6_scanin[46]
//  ff_l2d_l2t_decc_c6_scanin[124]
//  ff_l2d_l2t_decc_c6_scanin[47]
//  ff_l2d_l2t_decc_c6_scanin[125]
//  ff_l2d_l2t_decc_c6_scanin[48]
//  ff_l2d_l2t_decc_c6_scanin[126]
//  ff_l2d_l2t_decc_c6_scanin[49]
//  ff_l2d_l2t_decc_c6_scanin[127]
//  ff_l2d_l2t_decc_c6_scanin[50]
//  ff_l2d_l2t_decc_c6_scanin[128]
//  ff_l2d_l2t_decc_c6_scanin[51]
//  ff_l2d_l2t_decc_c6_scanin[129]
//  ff_l2d_l2t_decc_c6_scanin[52]
//  ff_l2d_l2t_decc_c6_scanin[130]
//  ff_l2d_l2t_decc_c6_scanin[53]
//  ff_l2d_l2t_decc_c6_scanin[131]
//  ff_l2d_l2t_decc_c6_scanin[54]
//  ff_l2d_l2t_decc_c6_scanin[132]
//  ff_l2d_l2t_decc_c6_scanin[55]
//  ff_l2d_l2t_decc_c6_scanin[133]
//  ff_l2d_l2t_decc_c6_scanin[56]
//  ff_l2d_l2t_decc_c6_scanin[134]
//  ff_l2d_l2t_decc_c6_scanin[57]
//  ff_l2d_l2t_decc_c6_scanin[135]
//  ff_l2d_l2t_decc_c6_scanin[58]
//  ff_l2d_l2t_decc_c6_scanin[136]
//  ff_l2d_l2t_decc_c6_scanin[59]
//  ff_l2d_l2t_decc_c6_scanin[137]
//  ff_l2d_l2t_decc_c6_scanin[60]
//  ff_l2d_l2t_decc_c6_scanin[138]
//  ff_l2d_l2t_decc_c6_scanin[61]
//  ff_l2d_l2t_decc_c6_scanin[139]
//  ff_l2d_l2t_decc_c6_scanin[62]
//  ff_l2d_l2t_decc_c6_scanin[140]
//  ff_l2d_l2t_decc_c6_scanin[63]
//  ff_l2d_l2t_decc_c6_scanin[141]
//  ff_l2d_l2t_decc_c6_scanin[64]
//  ff_l2d_l2t_decc_c6_scanin[142]
//  ff_l2d_l2t_decc_c6_scanin[65]
//  ff_l2d_l2t_decc_c6_scanin[143]
//  ff_l2d_l2t_decc_c6_scanin[66]
//  ff_l2d_l2t_decc_c6_scanin[144]
//  ff_l2d_l2t_decc_c6_scanin[67]
//  ff_l2d_l2t_decc_c6_scanin[145]
//  ff_l2d_l2t_decc_c6_scanin[68]
//  ff_l2d_l2t_decc_c6_scanin[146]
//  ff_l2d_l2t_decc_c6_scanin[69]
//  ff_l2d_l2t_decc_c6_scanin[147]
//  ff_l2d_l2t_decc_c6_scanin[70]
//  ff_l2d_l2t_decc_c6_scanin[148]
//  ff_l2d_l2t_decc_c6_scanin[71]
//  ff_l2d_l2t_decc_c6_scanin[149]
//  ff_l2d_l2t_decc_c6_scanin[72]
//  ff_l2d_l2t_decc_c6_scanin[150]
//  ff_l2d_l2t_decc_c6_scanin[73]
//  ff_l2d_l2t_decc_c6_scanin[151]
//  ff_l2d_l2t_decc_c6_scanin[74]
//  ff_l2d_l2t_decc_c6_scanin[152]
//  ff_l2d_l2t_decc_c6_scanin[75]
//  ff_l2d_l2t_decc_c6_scanin[153]
//  ff_l2d_l2t_decc_c6_scanin[76]
//  ff_l2d_l2t_decc_c6_scanin[154]
//  ff_l2d_l2t_decc_c6_scanin[77]
//  ff_l2d_l2t_decc_c6_scanin[155]
//  ff_l2d_l2b_efc_fuse_data_scanin[0:9]
//  ff_l2b_l2d_fuse_reset_d_scanin
//  ff_l2b_l2d_fuse_wren_d_scanin
//  ff_l2b_l2d_fuse_rid_d_scanin[0:6]	
//  ff_l2b_l2d_fuse_l2d_data_in_scanin[0:9]
//  ff_fill_clk_en_ov_stg_scanin
//  ff_pwrsav_ov_stg_scanin
//  scanorder end
// fixscan start
assign ff_l2t_l2d_rd_wr_c3_scanin=scan_in;
assign ff_l2t_l2d_way_sel_c3_scanin[0]=ff_l2t_l2d_rd_wr_c3_scanout;
assign ff_l2t_l2d_way_sel_c3_scanin[1]=ff_l2t_l2d_way_sel_c3_scanout[0];
assign ff_l2t_l2d_way_sel_c3_scanin[2]=ff_l2t_l2d_way_sel_c3_scanout[1];
assign ff_l2t_l2d_way_sel_c3_scanin[3]=ff_l2t_l2d_way_sel_c3_scanout[2];
assign ff_l2t_l2d_way_sel_c3_scanin[4]=ff_l2t_l2d_way_sel_c3_scanout[3];
assign ff_l2t_l2d_way_sel_c3_scanin[5]=ff_l2t_l2d_way_sel_c3_scanout[4];
assign ff_l2t_l2d_way_sel_c3_scanin[6]=ff_l2t_l2d_way_sel_c3_scanout[5];
assign ff_l2t_l2d_way_sel_c3_scanin[7]=ff_l2t_l2d_way_sel_c3_scanout[6];
assign ff_l2t_l2d_way_sel_c3_scanin[8]=ff_l2t_l2d_way_sel_c3_scanout[7];
assign ff_l2t_l2d_way_sel_c3_scanin[9]=ff_l2t_l2d_way_sel_c3_scanout[8];
assign ff_l2t_l2d_way_sel_c3_scanin[10]=ff_l2t_l2d_way_sel_c3_scanout[9];
assign ff_l2t_l2d_way_sel_c3_scanin[11]=ff_l2t_l2d_way_sel_c3_scanout[10];
assign ff_l2t_l2d_way_sel_c3_scanin[12]=ff_l2t_l2d_way_sel_c3_scanout[11];
assign ff_l2t_l2d_way_sel_c3_scanin[13]=ff_l2t_l2d_way_sel_c3_scanout[12];
assign ff_l2t_l2d_way_sel_c3_scanin[14]=ff_l2t_l2d_way_sel_c3_scanout[13];
assign ff_l2t_l2d_way_sel_c3_scanin[15]=ff_l2t_l2d_way_sel_c3_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[0]=ff_l2t_l2d_way_sel_c3_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[0]=ff_l2b_l2d_fbdecc_c5_1_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[0]=ff_l2b_l2d_fbdecc_c5_5_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[0]=ff_l2b_l2d_fbdecc_c5_3_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[0]=ff_l2b_l2d_fbdecc_c5_7_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[0]=ff_l2b_l2d_fbdecc_c5_9_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[0]=ff_l2b_l2d_fbdecc_c5_13_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[0]=ff_l2b_l2d_fbdecc_c5_11_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[1]=ff_l2b_l2d_fbdecc_c5_15_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[1]=ff_l2b_l2d_fbdecc_c5_1_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[1]=ff_l2b_l2d_fbdecc_c5_5_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[1]=ff_l2b_l2d_fbdecc_c5_3_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[1]=ff_l2b_l2d_fbdecc_c5_7_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[1]=ff_l2b_l2d_fbdecc_c5_9_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[1]=ff_l2b_l2d_fbdecc_c5_13_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[1]=ff_l2b_l2d_fbdecc_c5_11_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[2]=ff_l2b_l2d_fbdecc_c5_15_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[2]=ff_l2b_l2d_fbdecc_c5_1_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[2]=ff_l2b_l2d_fbdecc_c5_5_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[2]=ff_l2b_l2d_fbdecc_c5_3_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[2]=ff_l2b_l2d_fbdecc_c5_7_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[2]=ff_l2b_l2d_fbdecc_c5_9_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[2]=ff_l2b_l2d_fbdecc_c5_13_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[2]=ff_l2b_l2d_fbdecc_c5_11_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[3]=ff_l2b_l2d_fbdecc_c5_15_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[3]=ff_l2b_l2d_fbdecc_c5_1_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[3]=ff_l2b_l2d_fbdecc_c5_5_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[3]=ff_l2b_l2d_fbdecc_c5_3_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[3]=ff_l2b_l2d_fbdecc_c5_7_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[3]=ff_l2b_l2d_fbdecc_c5_9_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[3]=ff_l2b_l2d_fbdecc_c5_13_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[3]=ff_l2b_l2d_fbdecc_c5_11_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[4]=ff_l2b_l2d_fbdecc_c5_15_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[4]=ff_l2b_l2d_fbdecc_c5_1_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[4]=ff_l2b_l2d_fbdecc_c5_5_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[4]=ff_l2b_l2d_fbdecc_c5_3_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[4]=ff_l2b_l2d_fbdecc_c5_7_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[4]=ff_l2b_l2d_fbdecc_c5_9_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[4]=ff_l2b_l2d_fbdecc_c5_13_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[4]=ff_l2b_l2d_fbdecc_c5_11_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[5]=ff_l2b_l2d_fbdecc_c5_15_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[5]=ff_l2b_l2d_fbdecc_c5_1_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[5]=ff_l2b_l2d_fbdecc_c5_5_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[5]=ff_l2b_l2d_fbdecc_c5_3_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[5]=ff_l2b_l2d_fbdecc_c5_7_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[5]=ff_l2b_l2d_fbdecc_c5_9_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[5]=ff_l2b_l2d_fbdecc_c5_13_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[5]=ff_l2b_l2d_fbdecc_c5_11_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[6]=ff_l2b_l2d_fbdecc_c5_15_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[6]=ff_l2b_l2d_fbdecc_c5_1_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[6]=ff_l2b_l2d_fbdecc_c5_5_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[6]=ff_l2b_l2d_fbdecc_c5_3_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[6]=ff_l2b_l2d_fbdecc_c5_7_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[6]=ff_l2b_l2d_fbdecc_c5_9_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[6]=ff_l2b_l2d_fbdecc_c5_13_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[6]=ff_l2b_l2d_fbdecc_c5_11_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[7]=ff_l2b_l2d_fbdecc_c5_15_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[7]=ff_l2b_l2d_fbdecc_c5_1_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[7]=ff_l2b_l2d_fbdecc_c5_5_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[7]=ff_l2b_l2d_fbdecc_c5_3_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[7]=ff_l2b_l2d_fbdecc_c5_7_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[7]=ff_l2b_l2d_fbdecc_c5_9_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[7]=ff_l2b_l2d_fbdecc_c5_13_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[7]=ff_l2b_l2d_fbdecc_c5_11_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[8]=ff_l2b_l2d_fbdecc_c5_15_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[8]=ff_l2b_l2d_fbdecc_c5_1_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[8]=ff_l2b_l2d_fbdecc_c5_5_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[8]=ff_l2b_l2d_fbdecc_c5_3_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[8]=ff_l2b_l2d_fbdecc_c5_7_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[8]=ff_l2b_l2d_fbdecc_c5_9_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[8]=ff_l2b_l2d_fbdecc_c5_13_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[8]=ff_l2b_l2d_fbdecc_c5_11_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[9]=ff_l2b_l2d_fbdecc_c5_15_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[9]=ff_l2b_l2d_fbdecc_c5_1_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[9]=ff_l2b_l2d_fbdecc_c5_5_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[9]=ff_l2b_l2d_fbdecc_c5_3_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[9]=ff_l2b_l2d_fbdecc_c5_7_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[9]=ff_l2b_l2d_fbdecc_c5_9_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[9]=ff_l2b_l2d_fbdecc_c5_13_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[9]=ff_l2b_l2d_fbdecc_c5_11_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[10]=ff_l2b_l2d_fbdecc_c5_15_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[10]=ff_l2b_l2d_fbdecc_c5_1_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[10]=ff_l2b_l2d_fbdecc_c5_5_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[10]=ff_l2b_l2d_fbdecc_c5_3_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[10]=ff_l2b_l2d_fbdecc_c5_7_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[10]=ff_l2b_l2d_fbdecc_c5_9_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[10]=ff_l2b_l2d_fbdecc_c5_13_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[10]=ff_l2b_l2d_fbdecc_c5_11_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[11]=ff_l2b_l2d_fbdecc_c5_15_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[11]=ff_l2b_l2d_fbdecc_c5_1_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[11]=ff_l2b_l2d_fbdecc_c5_5_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[11]=ff_l2b_l2d_fbdecc_c5_3_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[11]=ff_l2b_l2d_fbdecc_c5_7_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[11]=ff_l2b_l2d_fbdecc_c5_9_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[11]=ff_l2b_l2d_fbdecc_c5_13_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[11]=ff_l2b_l2d_fbdecc_c5_11_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[12]=ff_l2b_l2d_fbdecc_c5_15_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[12]=ff_l2b_l2d_fbdecc_c5_1_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[12]=ff_l2b_l2d_fbdecc_c5_5_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[12]=ff_l2b_l2d_fbdecc_c5_3_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[12]=ff_l2b_l2d_fbdecc_c5_7_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[12]=ff_l2b_l2d_fbdecc_c5_9_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[12]=ff_l2b_l2d_fbdecc_c5_13_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[12]=ff_l2b_l2d_fbdecc_c5_11_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[13]=ff_l2b_l2d_fbdecc_c5_15_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[13]=ff_l2b_l2d_fbdecc_c5_1_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[13]=ff_l2b_l2d_fbdecc_c5_5_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[13]=ff_l2b_l2d_fbdecc_c5_3_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[13]=ff_l2b_l2d_fbdecc_c5_7_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[13]=ff_l2b_l2d_fbdecc_c5_9_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[13]=ff_l2b_l2d_fbdecc_c5_13_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[13]=ff_l2b_l2d_fbdecc_c5_11_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[14]=ff_l2b_l2d_fbdecc_c5_15_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[14]=ff_l2b_l2d_fbdecc_c5_1_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[14]=ff_l2b_l2d_fbdecc_c5_5_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[14]=ff_l2b_l2d_fbdecc_c5_3_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[14]=ff_l2b_l2d_fbdecc_c5_7_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[14]=ff_l2b_l2d_fbdecc_c5_9_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[14]=ff_l2b_l2d_fbdecc_c5_13_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[14]=ff_l2b_l2d_fbdecc_c5_11_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[15]=ff_l2b_l2d_fbdecc_c5_15_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[15]=ff_l2b_l2d_fbdecc_c5_1_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[15]=ff_l2b_l2d_fbdecc_c5_5_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[15]=ff_l2b_l2d_fbdecc_c5_3_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[15]=ff_l2b_l2d_fbdecc_c5_7_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[15]=ff_l2b_l2d_fbdecc_c5_9_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[15]=ff_l2b_l2d_fbdecc_c5_13_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[15]=ff_l2b_l2d_fbdecc_c5_11_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[16]=ff_l2b_l2d_fbdecc_c5_15_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[16]=ff_l2b_l2d_fbdecc_c5_1_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[16]=ff_l2b_l2d_fbdecc_c5_5_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[16]=ff_l2b_l2d_fbdecc_c5_3_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[16]=ff_l2b_l2d_fbdecc_c5_7_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[16]=ff_l2b_l2d_fbdecc_c5_9_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[16]=ff_l2b_l2d_fbdecc_c5_13_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[16]=ff_l2b_l2d_fbdecc_c5_11_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[17]=ff_l2b_l2d_fbdecc_c5_15_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[17]=ff_l2b_l2d_fbdecc_c5_1_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[17]=ff_l2b_l2d_fbdecc_c5_5_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[17]=ff_l2b_l2d_fbdecc_c5_3_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[17]=ff_l2b_l2d_fbdecc_c5_7_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[17]=ff_l2b_l2d_fbdecc_c5_9_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[17]=ff_l2b_l2d_fbdecc_c5_13_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[17]=ff_l2b_l2d_fbdecc_c5_11_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[18]=ff_l2b_l2d_fbdecc_c5_15_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[18]=ff_l2b_l2d_fbdecc_c5_1_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[18]=ff_l2b_l2d_fbdecc_c5_5_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[18]=ff_l2b_l2d_fbdecc_c5_3_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[18]=ff_l2b_l2d_fbdecc_c5_7_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[18]=ff_l2b_l2d_fbdecc_c5_9_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[18]=ff_l2b_l2d_fbdecc_c5_13_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[18]=ff_l2b_l2d_fbdecc_c5_11_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[19]=ff_l2b_l2d_fbdecc_c5_15_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[19]=ff_l2b_l2d_fbdecc_c5_1_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[19]=ff_l2b_l2d_fbdecc_c5_5_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[19]=ff_l2b_l2d_fbdecc_c5_3_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[19]=ff_l2b_l2d_fbdecc_c5_7_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[19]=ff_l2b_l2d_fbdecc_c5_9_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[19]=ff_l2b_l2d_fbdecc_c5_13_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[19]=ff_l2b_l2d_fbdecc_c5_11_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[20]=ff_l2b_l2d_fbdecc_c5_15_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[20]=ff_l2b_l2d_fbdecc_c5_1_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[20]=ff_l2b_l2d_fbdecc_c5_5_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[20]=ff_l2b_l2d_fbdecc_c5_3_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[20]=ff_l2b_l2d_fbdecc_c5_7_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[20]=ff_l2b_l2d_fbdecc_c5_9_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[20]=ff_l2b_l2d_fbdecc_c5_13_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[20]=ff_l2b_l2d_fbdecc_c5_11_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[21]=ff_l2b_l2d_fbdecc_c5_15_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[21]=ff_l2b_l2d_fbdecc_c5_1_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[21]=ff_l2b_l2d_fbdecc_c5_5_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[21]=ff_l2b_l2d_fbdecc_c5_3_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[21]=ff_l2b_l2d_fbdecc_c5_7_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[21]=ff_l2b_l2d_fbdecc_c5_9_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[21]=ff_l2b_l2d_fbdecc_c5_13_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[21]=ff_l2b_l2d_fbdecc_c5_11_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[22]=ff_l2b_l2d_fbdecc_c5_15_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[22]=ff_l2b_l2d_fbdecc_c5_1_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[22]=ff_l2b_l2d_fbdecc_c5_5_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[22]=ff_l2b_l2d_fbdecc_c5_3_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[22]=ff_l2b_l2d_fbdecc_c5_7_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[22]=ff_l2b_l2d_fbdecc_c5_9_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[22]=ff_l2b_l2d_fbdecc_c5_13_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[22]=ff_l2b_l2d_fbdecc_c5_11_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[23]=ff_l2b_l2d_fbdecc_c5_15_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[23]=ff_l2b_l2d_fbdecc_c5_1_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[23]=ff_l2b_l2d_fbdecc_c5_5_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[23]=ff_l2b_l2d_fbdecc_c5_3_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[23]=ff_l2b_l2d_fbdecc_c5_7_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[23]=ff_l2b_l2d_fbdecc_c5_9_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[23]=ff_l2b_l2d_fbdecc_c5_13_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[23]=ff_l2b_l2d_fbdecc_c5_11_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[24]=ff_l2b_l2d_fbdecc_c5_15_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[24]=ff_l2b_l2d_fbdecc_c5_1_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[24]=ff_l2b_l2d_fbdecc_c5_5_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[24]=ff_l2b_l2d_fbdecc_c5_3_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[24]=ff_l2b_l2d_fbdecc_c5_7_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[24]=ff_l2b_l2d_fbdecc_c5_9_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[24]=ff_l2b_l2d_fbdecc_c5_13_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[24]=ff_l2b_l2d_fbdecc_c5_11_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[25]=ff_l2b_l2d_fbdecc_c5_15_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[25]=ff_l2b_l2d_fbdecc_c5_1_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[25]=ff_l2b_l2d_fbdecc_c5_5_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[25]=ff_l2b_l2d_fbdecc_c5_3_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[25]=ff_l2b_l2d_fbdecc_c5_7_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[25]=ff_l2b_l2d_fbdecc_c5_9_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[25]=ff_l2b_l2d_fbdecc_c5_13_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[25]=ff_l2b_l2d_fbdecc_c5_11_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[26]=ff_l2b_l2d_fbdecc_c5_15_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[26]=ff_l2b_l2d_fbdecc_c5_1_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[26]=ff_l2b_l2d_fbdecc_c5_5_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[26]=ff_l2b_l2d_fbdecc_c5_3_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[26]=ff_l2b_l2d_fbdecc_c5_7_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[26]=ff_l2b_l2d_fbdecc_c5_9_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[26]=ff_l2b_l2d_fbdecc_c5_13_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[26]=ff_l2b_l2d_fbdecc_c5_11_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[27]=ff_l2b_l2d_fbdecc_c5_15_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[27]=ff_l2b_l2d_fbdecc_c5_1_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[27]=ff_l2b_l2d_fbdecc_c5_5_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[27]=ff_l2b_l2d_fbdecc_c5_3_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[27]=ff_l2b_l2d_fbdecc_c5_7_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[27]=ff_l2b_l2d_fbdecc_c5_9_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[27]=ff_l2b_l2d_fbdecc_c5_13_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[27]=ff_l2b_l2d_fbdecc_c5_11_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[28]=ff_l2b_l2d_fbdecc_c5_15_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[28]=ff_l2b_l2d_fbdecc_c5_1_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[28]=ff_l2b_l2d_fbdecc_c5_5_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[28]=ff_l2b_l2d_fbdecc_c5_3_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[28]=ff_l2b_l2d_fbdecc_c5_7_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[28]=ff_l2b_l2d_fbdecc_c5_9_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[28]=ff_l2b_l2d_fbdecc_c5_13_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[28]=ff_l2b_l2d_fbdecc_c5_11_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[29]=ff_l2b_l2d_fbdecc_c5_15_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[29]=ff_l2b_l2d_fbdecc_c5_1_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[29]=ff_l2b_l2d_fbdecc_c5_5_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[29]=ff_l2b_l2d_fbdecc_c5_3_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[29]=ff_l2b_l2d_fbdecc_c5_7_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[29]=ff_l2b_l2d_fbdecc_c5_9_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[29]=ff_l2b_l2d_fbdecc_c5_13_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[29]=ff_l2b_l2d_fbdecc_c5_11_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[30]=ff_l2b_l2d_fbdecc_c5_15_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[30]=ff_l2b_l2d_fbdecc_c5_1_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[30]=ff_l2b_l2d_fbdecc_c5_5_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[30]=ff_l2b_l2d_fbdecc_c5_3_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[30]=ff_l2b_l2d_fbdecc_c5_7_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[30]=ff_l2b_l2d_fbdecc_c5_9_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[30]=ff_l2b_l2d_fbdecc_c5_13_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[30]=ff_l2b_l2d_fbdecc_c5_11_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[31]=ff_l2b_l2d_fbdecc_c5_15_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[31]=ff_l2b_l2d_fbdecc_c5_1_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[31]=ff_l2b_l2d_fbdecc_c5_5_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[31]=ff_l2b_l2d_fbdecc_c5_3_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[31]=ff_l2b_l2d_fbdecc_c5_7_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[31]=ff_l2b_l2d_fbdecc_c5_9_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[31]=ff_l2b_l2d_fbdecc_c5_13_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[31]=ff_l2b_l2d_fbdecc_c5_11_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[32]=ff_l2b_l2d_fbdecc_c5_15_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[32]=ff_l2b_l2d_fbdecc_c5_1_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[32]=ff_l2b_l2d_fbdecc_c5_5_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[32]=ff_l2b_l2d_fbdecc_c5_3_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[32]=ff_l2b_l2d_fbdecc_c5_7_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[32]=ff_l2b_l2d_fbdecc_c5_9_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[32]=ff_l2b_l2d_fbdecc_c5_13_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[32]=ff_l2b_l2d_fbdecc_c5_11_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[33]=ff_l2b_l2d_fbdecc_c5_15_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[33]=ff_l2b_l2d_fbdecc_c5_1_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[33]=ff_l2b_l2d_fbdecc_c5_5_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[33]=ff_l2b_l2d_fbdecc_c5_3_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[33]=ff_l2b_l2d_fbdecc_c5_7_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[33]=ff_l2b_l2d_fbdecc_c5_9_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[33]=ff_l2b_l2d_fbdecc_c5_13_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[33]=ff_l2b_l2d_fbdecc_c5_11_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[34]=ff_l2b_l2d_fbdecc_c5_15_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[34]=ff_l2b_l2d_fbdecc_c5_1_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[34]=ff_l2b_l2d_fbdecc_c5_5_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[34]=ff_l2b_l2d_fbdecc_c5_3_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[34]=ff_l2b_l2d_fbdecc_c5_7_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[34]=ff_l2b_l2d_fbdecc_c5_9_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[34]=ff_l2b_l2d_fbdecc_c5_13_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[34]=ff_l2b_l2d_fbdecc_c5_11_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[35]=ff_l2b_l2d_fbdecc_c5_15_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[35]=ff_l2b_l2d_fbdecc_c5_1_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[35]=ff_l2b_l2d_fbdecc_c5_5_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[35]=ff_l2b_l2d_fbdecc_c5_3_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[35]=ff_l2b_l2d_fbdecc_c5_7_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[35]=ff_l2b_l2d_fbdecc_c5_9_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[35]=ff_l2b_l2d_fbdecc_c5_13_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[35]=ff_l2b_l2d_fbdecc_c5_11_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[36]=ff_l2b_l2d_fbdecc_c5_15_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[36]=ff_l2b_l2d_fbdecc_c5_1_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[36]=ff_l2b_l2d_fbdecc_c5_5_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[36]=ff_l2b_l2d_fbdecc_c5_3_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[36]=ff_l2b_l2d_fbdecc_c5_7_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[36]=ff_l2b_l2d_fbdecc_c5_9_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[36]=ff_l2b_l2d_fbdecc_c5_13_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[36]=ff_l2b_l2d_fbdecc_c5_11_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[37]=ff_l2b_l2d_fbdecc_c5_15_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[37]=ff_l2b_l2d_fbdecc_c5_1_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[37]=ff_l2b_l2d_fbdecc_c5_5_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[37]=ff_l2b_l2d_fbdecc_c5_3_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[37]=ff_l2b_l2d_fbdecc_c5_7_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[37]=ff_l2b_l2d_fbdecc_c5_9_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[37]=ff_l2b_l2d_fbdecc_c5_13_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[37]=ff_l2b_l2d_fbdecc_c5_11_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_1_scanin[38]=ff_l2b_l2d_fbdecc_c5_15_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_5_scanin[38]=ff_l2b_l2d_fbdecc_c5_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_3_scanin[38]=ff_l2b_l2d_fbdecc_c5_5_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_7_scanin[38]=ff_l2b_l2d_fbdecc_c5_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_9_scanin[38]=ff_l2b_l2d_fbdecc_c5_7_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_13_scanin[38]=ff_l2b_l2d_fbdecc_c5_9_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_11_scanin[38]=ff_l2b_l2d_fbdecc_c5_13_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_15_scanin[38]=ff_l2b_l2d_fbdecc_c5_11_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[0]=ff_l2b_l2d_fbdecc_c5_15_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[0]=ff_l2b_l2d_fbdecc_c5_2_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[0]=ff_l2b_l2d_fbdecc_c5_6_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[0]=ff_l2b_l2d_fbdecc_c5_4_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[0]=ff_l2b_l2d_fbdecc_c5_8_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[0]=ff_l2b_l2d_fbdecc_c5_10_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[0]=ff_l2b_l2d_fbdecc_c5_14_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[0]=ff_l2b_l2d_fbdecc_c5_12_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[1]=ff_l2b_l2d_fbdecc_c5_16_scanout[0];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[1]=ff_l2b_l2d_fbdecc_c5_2_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[1]=ff_l2b_l2d_fbdecc_c5_6_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[1]=ff_l2b_l2d_fbdecc_c5_4_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[1]=ff_l2b_l2d_fbdecc_c5_8_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[1]=ff_l2b_l2d_fbdecc_c5_10_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[1]=ff_l2b_l2d_fbdecc_c5_14_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[1]=ff_l2b_l2d_fbdecc_c5_12_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[2]=ff_l2b_l2d_fbdecc_c5_16_scanout[1];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[2]=ff_l2b_l2d_fbdecc_c5_2_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[2]=ff_l2b_l2d_fbdecc_c5_6_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[2]=ff_l2b_l2d_fbdecc_c5_4_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[2]=ff_l2b_l2d_fbdecc_c5_8_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[2]=ff_l2b_l2d_fbdecc_c5_10_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[2]=ff_l2b_l2d_fbdecc_c5_14_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[2]=ff_l2b_l2d_fbdecc_c5_12_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[3]=ff_l2b_l2d_fbdecc_c5_16_scanout[2];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[3]=ff_l2b_l2d_fbdecc_c5_2_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[3]=ff_l2b_l2d_fbdecc_c5_6_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[3]=ff_l2b_l2d_fbdecc_c5_4_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[3]=ff_l2b_l2d_fbdecc_c5_8_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[3]=ff_l2b_l2d_fbdecc_c5_10_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[3]=ff_l2b_l2d_fbdecc_c5_14_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[3]=ff_l2b_l2d_fbdecc_c5_12_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[4]=ff_l2b_l2d_fbdecc_c5_16_scanout[3];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[4]=ff_l2b_l2d_fbdecc_c5_2_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[4]=ff_l2b_l2d_fbdecc_c5_6_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[4]=ff_l2b_l2d_fbdecc_c5_4_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[4]=ff_l2b_l2d_fbdecc_c5_8_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[4]=ff_l2b_l2d_fbdecc_c5_10_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[4]=ff_l2b_l2d_fbdecc_c5_14_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[4]=ff_l2b_l2d_fbdecc_c5_12_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[5]=ff_l2b_l2d_fbdecc_c5_16_scanout[4];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[5]=ff_l2b_l2d_fbdecc_c5_2_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[5]=ff_l2b_l2d_fbdecc_c5_6_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[5]=ff_l2b_l2d_fbdecc_c5_4_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[5]=ff_l2b_l2d_fbdecc_c5_8_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[5]=ff_l2b_l2d_fbdecc_c5_10_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[5]=ff_l2b_l2d_fbdecc_c5_14_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[5]=ff_l2b_l2d_fbdecc_c5_12_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[6]=ff_l2b_l2d_fbdecc_c5_16_scanout[5];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[6]=ff_l2b_l2d_fbdecc_c5_2_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[6]=ff_l2b_l2d_fbdecc_c5_6_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[6]=ff_l2b_l2d_fbdecc_c5_4_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[6]=ff_l2b_l2d_fbdecc_c5_8_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[6]=ff_l2b_l2d_fbdecc_c5_10_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[6]=ff_l2b_l2d_fbdecc_c5_14_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[6]=ff_l2b_l2d_fbdecc_c5_12_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[7]=ff_l2b_l2d_fbdecc_c5_16_scanout[6];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[7]=ff_l2b_l2d_fbdecc_c5_2_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[7]=ff_l2b_l2d_fbdecc_c5_6_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[7]=ff_l2b_l2d_fbdecc_c5_4_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[7]=ff_l2b_l2d_fbdecc_c5_8_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[7]=ff_l2b_l2d_fbdecc_c5_10_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[7]=ff_l2b_l2d_fbdecc_c5_14_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[7]=ff_l2b_l2d_fbdecc_c5_12_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[8]=ff_l2b_l2d_fbdecc_c5_16_scanout[7];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[8]=ff_l2b_l2d_fbdecc_c5_2_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[8]=ff_l2b_l2d_fbdecc_c5_6_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[8]=ff_l2b_l2d_fbdecc_c5_4_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[8]=ff_l2b_l2d_fbdecc_c5_8_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[8]=ff_l2b_l2d_fbdecc_c5_10_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[8]=ff_l2b_l2d_fbdecc_c5_14_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[8]=ff_l2b_l2d_fbdecc_c5_12_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[9]=ff_l2b_l2d_fbdecc_c5_16_scanout[8];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[9]=ff_l2b_l2d_fbdecc_c5_2_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[9]=ff_l2b_l2d_fbdecc_c5_6_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[9]=ff_l2b_l2d_fbdecc_c5_4_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[9]=ff_l2b_l2d_fbdecc_c5_8_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[9]=ff_l2b_l2d_fbdecc_c5_10_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[9]=ff_l2b_l2d_fbdecc_c5_14_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[9]=ff_l2b_l2d_fbdecc_c5_12_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[10]=ff_l2b_l2d_fbdecc_c5_16_scanout[9];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[10]=ff_l2b_l2d_fbdecc_c5_2_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[10]=ff_l2b_l2d_fbdecc_c5_6_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[10]=ff_l2b_l2d_fbdecc_c5_4_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[10]=ff_l2b_l2d_fbdecc_c5_8_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[10]=ff_l2b_l2d_fbdecc_c5_10_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[10]=ff_l2b_l2d_fbdecc_c5_14_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[10]=ff_l2b_l2d_fbdecc_c5_12_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[11]=ff_l2b_l2d_fbdecc_c5_16_scanout[10];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[11]=ff_l2b_l2d_fbdecc_c5_2_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[11]=ff_l2b_l2d_fbdecc_c5_6_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[11]=ff_l2b_l2d_fbdecc_c5_4_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[11]=ff_l2b_l2d_fbdecc_c5_8_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[11]=ff_l2b_l2d_fbdecc_c5_10_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[11]=ff_l2b_l2d_fbdecc_c5_14_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[11]=ff_l2b_l2d_fbdecc_c5_12_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[12]=ff_l2b_l2d_fbdecc_c5_16_scanout[11];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[12]=ff_l2b_l2d_fbdecc_c5_2_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[12]=ff_l2b_l2d_fbdecc_c5_6_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[12]=ff_l2b_l2d_fbdecc_c5_4_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[12]=ff_l2b_l2d_fbdecc_c5_8_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[12]=ff_l2b_l2d_fbdecc_c5_10_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[12]=ff_l2b_l2d_fbdecc_c5_14_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[12]=ff_l2b_l2d_fbdecc_c5_12_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[13]=ff_l2b_l2d_fbdecc_c5_16_scanout[12];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[13]=ff_l2b_l2d_fbdecc_c5_2_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[13]=ff_l2b_l2d_fbdecc_c5_6_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[13]=ff_l2b_l2d_fbdecc_c5_4_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[13]=ff_l2b_l2d_fbdecc_c5_8_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[13]=ff_l2b_l2d_fbdecc_c5_10_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[13]=ff_l2b_l2d_fbdecc_c5_14_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[13]=ff_l2b_l2d_fbdecc_c5_12_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[14]=ff_l2b_l2d_fbdecc_c5_16_scanout[13];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[14]=ff_l2b_l2d_fbdecc_c5_2_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[14]=ff_l2b_l2d_fbdecc_c5_6_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[14]=ff_l2b_l2d_fbdecc_c5_4_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[14]=ff_l2b_l2d_fbdecc_c5_8_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[14]=ff_l2b_l2d_fbdecc_c5_10_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[14]=ff_l2b_l2d_fbdecc_c5_14_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[14]=ff_l2b_l2d_fbdecc_c5_12_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[15]=ff_l2b_l2d_fbdecc_c5_16_scanout[14];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[15]=ff_l2b_l2d_fbdecc_c5_2_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[15]=ff_l2b_l2d_fbdecc_c5_6_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[15]=ff_l2b_l2d_fbdecc_c5_4_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[15]=ff_l2b_l2d_fbdecc_c5_8_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[15]=ff_l2b_l2d_fbdecc_c5_10_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[15]=ff_l2b_l2d_fbdecc_c5_14_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[15]=ff_l2b_l2d_fbdecc_c5_12_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[16]=ff_l2b_l2d_fbdecc_c5_16_scanout[15];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[16]=ff_l2b_l2d_fbdecc_c5_2_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[16]=ff_l2b_l2d_fbdecc_c5_6_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[16]=ff_l2b_l2d_fbdecc_c5_4_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[16]=ff_l2b_l2d_fbdecc_c5_8_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[16]=ff_l2b_l2d_fbdecc_c5_10_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[16]=ff_l2b_l2d_fbdecc_c5_14_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[16]=ff_l2b_l2d_fbdecc_c5_12_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[17]=ff_l2b_l2d_fbdecc_c5_16_scanout[16];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[17]=ff_l2b_l2d_fbdecc_c5_2_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[17]=ff_l2b_l2d_fbdecc_c5_6_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[17]=ff_l2b_l2d_fbdecc_c5_4_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[17]=ff_l2b_l2d_fbdecc_c5_8_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[17]=ff_l2b_l2d_fbdecc_c5_10_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[17]=ff_l2b_l2d_fbdecc_c5_14_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[17]=ff_l2b_l2d_fbdecc_c5_12_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[18]=ff_l2b_l2d_fbdecc_c5_16_scanout[17];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[18]=ff_l2b_l2d_fbdecc_c5_2_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[18]=ff_l2b_l2d_fbdecc_c5_6_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[18]=ff_l2b_l2d_fbdecc_c5_4_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[18]=ff_l2b_l2d_fbdecc_c5_8_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[18]=ff_l2b_l2d_fbdecc_c5_10_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[18]=ff_l2b_l2d_fbdecc_c5_14_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[18]=ff_l2b_l2d_fbdecc_c5_12_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[19]=ff_l2b_l2d_fbdecc_c5_16_scanout[18];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[19]=ff_l2b_l2d_fbdecc_c5_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[19]=ff_l2b_l2d_fbdecc_c5_6_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[19]=ff_l2b_l2d_fbdecc_c5_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[19]=ff_l2b_l2d_fbdecc_c5_8_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[19]=ff_l2b_l2d_fbdecc_c5_10_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[19]=ff_l2b_l2d_fbdecc_c5_14_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[19]=ff_l2b_l2d_fbdecc_c5_12_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[20]=ff_l2b_l2d_fbdecc_c5_16_scanout[19];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[20]=ff_l2b_l2d_fbdecc_c5_2_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[20]=ff_l2b_l2d_fbdecc_c5_6_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[20]=ff_l2b_l2d_fbdecc_c5_4_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[20]=ff_l2b_l2d_fbdecc_c5_8_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[20]=ff_l2b_l2d_fbdecc_c5_10_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[20]=ff_l2b_l2d_fbdecc_c5_14_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[20]=ff_l2b_l2d_fbdecc_c5_12_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[21]=ff_l2b_l2d_fbdecc_c5_16_scanout[20];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[21]=ff_l2b_l2d_fbdecc_c5_2_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[21]=ff_l2b_l2d_fbdecc_c5_6_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[21]=ff_l2b_l2d_fbdecc_c5_4_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[21]=ff_l2b_l2d_fbdecc_c5_8_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[21]=ff_l2b_l2d_fbdecc_c5_10_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[21]=ff_l2b_l2d_fbdecc_c5_14_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[21]=ff_l2b_l2d_fbdecc_c5_12_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[22]=ff_l2b_l2d_fbdecc_c5_16_scanout[21];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[22]=ff_l2b_l2d_fbdecc_c5_2_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[22]=ff_l2b_l2d_fbdecc_c5_6_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[22]=ff_l2b_l2d_fbdecc_c5_4_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[22]=ff_l2b_l2d_fbdecc_c5_8_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[22]=ff_l2b_l2d_fbdecc_c5_10_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[22]=ff_l2b_l2d_fbdecc_c5_14_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[22]=ff_l2b_l2d_fbdecc_c5_12_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[23]=ff_l2b_l2d_fbdecc_c5_16_scanout[22];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[23]=ff_l2b_l2d_fbdecc_c5_2_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[23]=ff_l2b_l2d_fbdecc_c5_6_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[23]=ff_l2b_l2d_fbdecc_c5_4_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[23]=ff_l2b_l2d_fbdecc_c5_8_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[23]=ff_l2b_l2d_fbdecc_c5_10_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[23]=ff_l2b_l2d_fbdecc_c5_14_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[23]=ff_l2b_l2d_fbdecc_c5_12_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[24]=ff_l2b_l2d_fbdecc_c5_16_scanout[23];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[24]=ff_l2b_l2d_fbdecc_c5_2_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[24]=ff_l2b_l2d_fbdecc_c5_6_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[24]=ff_l2b_l2d_fbdecc_c5_4_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[24]=ff_l2b_l2d_fbdecc_c5_8_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[24]=ff_l2b_l2d_fbdecc_c5_10_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[24]=ff_l2b_l2d_fbdecc_c5_14_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[24]=ff_l2b_l2d_fbdecc_c5_12_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[25]=ff_l2b_l2d_fbdecc_c5_16_scanout[24];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[25]=ff_l2b_l2d_fbdecc_c5_2_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[25]=ff_l2b_l2d_fbdecc_c5_6_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[25]=ff_l2b_l2d_fbdecc_c5_4_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[25]=ff_l2b_l2d_fbdecc_c5_8_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[25]=ff_l2b_l2d_fbdecc_c5_10_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[25]=ff_l2b_l2d_fbdecc_c5_14_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[25]=ff_l2b_l2d_fbdecc_c5_12_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[26]=ff_l2b_l2d_fbdecc_c5_16_scanout[25];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[26]=ff_l2b_l2d_fbdecc_c5_2_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[26]=ff_l2b_l2d_fbdecc_c5_6_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[26]=ff_l2b_l2d_fbdecc_c5_4_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[26]=ff_l2b_l2d_fbdecc_c5_8_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[26]=ff_l2b_l2d_fbdecc_c5_10_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[26]=ff_l2b_l2d_fbdecc_c5_14_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[26]=ff_l2b_l2d_fbdecc_c5_12_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[27]=ff_l2b_l2d_fbdecc_c5_16_scanout[26];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[27]=ff_l2b_l2d_fbdecc_c5_2_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[27]=ff_l2b_l2d_fbdecc_c5_6_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[27]=ff_l2b_l2d_fbdecc_c5_4_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[27]=ff_l2b_l2d_fbdecc_c5_8_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[27]=ff_l2b_l2d_fbdecc_c5_10_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[27]=ff_l2b_l2d_fbdecc_c5_14_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[27]=ff_l2b_l2d_fbdecc_c5_12_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[28]=ff_l2b_l2d_fbdecc_c5_16_scanout[27];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[28]=ff_l2b_l2d_fbdecc_c5_2_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[28]=ff_l2b_l2d_fbdecc_c5_6_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[28]=ff_l2b_l2d_fbdecc_c5_4_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[28]=ff_l2b_l2d_fbdecc_c5_8_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[28]=ff_l2b_l2d_fbdecc_c5_10_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[28]=ff_l2b_l2d_fbdecc_c5_14_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[28]=ff_l2b_l2d_fbdecc_c5_12_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[29]=ff_l2b_l2d_fbdecc_c5_16_scanout[28];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[29]=ff_l2b_l2d_fbdecc_c5_2_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[29]=ff_l2b_l2d_fbdecc_c5_6_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[29]=ff_l2b_l2d_fbdecc_c5_4_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[29]=ff_l2b_l2d_fbdecc_c5_8_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[29]=ff_l2b_l2d_fbdecc_c5_10_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[29]=ff_l2b_l2d_fbdecc_c5_14_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[29]=ff_l2b_l2d_fbdecc_c5_12_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[30]=ff_l2b_l2d_fbdecc_c5_16_scanout[29];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[30]=ff_l2b_l2d_fbdecc_c5_2_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[30]=ff_l2b_l2d_fbdecc_c5_6_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[30]=ff_l2b_l2d_fbdecc_c5_4_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[30]=ff_l2b_l2d_fbdecc_c5_8_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[30]=ff_l2b_l2d_fbdecc_c5_10_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[30]=ff_l2b_l2d_fbdecc_c5_14_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[30]=ff_l2b_l2d_fbdecc_c5_12_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[31]=ff_l2b_l2d_fbdecc_c5_16_scanout[30];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[31]=ff_l2b_l2d_fbdecc_c5_2_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[31]=ff_l2b_l2d_fbdecc_c5_6_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[31]=ff_l2b_l2d_fbdecc_c5_4_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[31]=ff_l2b_l2d_fbdecc_c5_8_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[31]=ff_l2b_l2d_fbdecc_c5_10_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[31]=ff_l2b_l2d_fbdecc_c5_14_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[31]=ff_l2b_l2d_fbdecc_c5_12_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[32]=ff_l2b_l2d_fbdecc_c5_16_scanout[31];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[32]=ff_l2b_l2d_fbdecc_c5_2_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[32]=ff_l2b_l2d_fbdecc_c5_6_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[32]=ff_l2b_l2d_fbdecc_c5_4_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[32]=ff_l2b_l2d_fbdecc_c5_8_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[32]=ff_l2b_l2d_fbdecc_c5_10_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[32]=ff_l2b_l2d_fbdecc_c5_14_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[32]=ff_l2b_l2d_fbdecc_c5_12_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[33]=ff_l2b_l2d_fbdecc_c5_16_scanout[32];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[33]=ff_l2b_l2d_fbdecc_c5_2_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[33]=ff_l2b_l2d_fbdecc_c5_6_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[33]=ff_l2b_l2d_fbdecc_c5_4_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[33]=ff_l2b_l2d_fbdecc_c5_8_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[33]=ff_l2b_l2d_fbdecc_c5_10_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[33]=ff_l2b_l2d_fbdecc_c5_14_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[33]=ff_l2b_l2d_fbdecc_c5_12_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[34]=ff_l2b_l2d_fbdecc_c5_16_scanout[33];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[34]=ff_l2b_l2d_fbdecc_c5_2_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[34]=ff_l2b_l2d_fbdecc_c5_6_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[34]=ff_l2b_l2d_fbdecc_c5_4_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[34]=ff_l2b_l2d_fbdecc_c5_8_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[34]=ff_l2b_l2d_fbdecc_c5_10_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[34]=ff_l2b_l2d_fbdecc_c5_14_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[34]=ff_l2b_l2d_fbdecc_c5_12_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[35]=ff_l2b_l2d_fbdecc_c5_16_scanout[34];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[35]=ff_l2b_l2d_fbdecc_c5_2_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[35]=ff_l2b_l2d_fbdecc_c5_6_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[35]=ff_l2b_l2d_fbdecc_c5_4_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[35]=ff_l2b_l2d_fbdecc_c5_8_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[35]=ff_l2b_l2d_fbdecc_c5_10_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[35]=ff_l2b_l2d_fbdecc_c5_14_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[35]=ff_l2b_l2d_fbdecc_c5_12_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[36]=ff_l2b_l2d_fbdecc_c5_16_scanout[35];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[36]=ff_l2b_l2d_fbdecc_c5_2_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[36]=ff_l2b_l2d_fbdecc_c5_6_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[36]=ff_l2b_l2d_fbdecc_c5_4_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[36]=ff_l2b_l2d_fbdecc_c5_8_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[36]=ff_l2b_l2d_fbdecc_c5_10_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[36]=ff_l2b_l2d_fbdecc_c5_14_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[36]=ff_l2b_l2d_fbdecc_c5_12_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[37]=ff_l2b_l2d_fbdecc_c5_16_scanout[36];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[37]=ff_l2b_l2d_fbdecc_c5_2_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[37]=ff_l2b_l2d_fbdecc_c5_6_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[37]=ff_l2b_l2d_fbdecc_c5_4_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[37]=ff_l2b_l2d_fbdecc_c5_8_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[37]=ff_l2b_l2d_fbdecc_c5_10_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[37]=ff_l2b_l2d_fbdecc_c5_14_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[37]=ff_l2b_l2d_fbdecc_c5_12_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_2_scanin[38]=ff_l2b_l2d_fbdecc_c5_16_scanout[37];
assign ff_l2b_l2d_fbdecc_c5_6_scanin[38]=ff_l2b_l2d_fbdecc_c5_2_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_4_scanin[38]=ff_l2b_l2d_fbdecc_c5_6_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_8_scanin[38]=ff_l2b_l2d_fbdecc_c5_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_10_scanin[38]=ff_l2b_l2d_fbdecc_c5_8_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_14_scanin[38]=ff_l2b_l2d_fbdecc_c5_10_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_12_scanin[38]=ff_l2b_l2d_fbdecc_c5_14_scanout[38];
assign ff_l2b_l2d_fbdecc_c5_16_scanin[38]=ff_l2b_l2d_fbdecc_c5_12_scanout[38];
assign ff_l2d_l2b_decc_out_c7_1_scanin[0]=ff_l2b_l2d_fbdecc_c5_16_scanout[38];
assign ff_l2d_l2b_decc_out_c7_5_scanin[0]=ff_l2d_l2b_decc_out_c7_1_scanout[0];
assign ff_l2d_l2b_decc_out_c7_3_scanin[0]=ff_l2d_l2b_decc_out_c7_5_scanout[0];
assign ff_l2d_l2b_decc_out_c7_7_scanin[0]=ff_l2d_l2b_decc_out_c7_3_scanout[0];
assign ff_l2d_l2b_decc_out_c7_9_scanin[0]=ff_l2d_l2b_decc_out_c7_7_scanout[0];
assign ff_l2d_l2b_decc_out_c7_13_scanin[0]=ff_l2d_l2b_decc_out_c7_9_scanout[0];
assign ff_l2d_l2b_decc_out_c7_11_scanin[0]=ff_l2d_l2b_decc_out_c7_13_scanout[0];
assign ff_l2d_l2b_decc_out_c7_15_scanin[0]=ff_l2d_l2b_decc_out_c7_11_scanout[0];
assign ff_l2d_l2b_decc_out_c7_1_scanin[1]=ff_l2d_l2b_decc_out_c7_15_scanout[0];
assign ff_l2d_l2b_decc_out_c7_5_scanin[1]=ff_l2d_l2b_decc_out_c7_1_scanout[1];
assign ff_l2d_l2b_decc_out_c7_3_scanin[1]=ff_l2d_l2b_decc_out_c7_5_scanout[1];
assign ff_l2d_l2b_decc_out_c7_7_scanin[1]=ff_l2d_l2b_decc_out_c7_3_scanout[1];
assign ff_l2d_l2b_decc_out_c7_9_scanin[1]=ff_l2d_l2b_decc_out_c7_7_scanout[1];
assign ff_l2d_l2b_decc_out_c7_13_scanin[1]=ff_l2d_l2b_decc_out_c7_9_scanout[1];
assign ff_l2d_l2b_decc_out_c7_11_scanin[1]=ff_l2d_l2b_decc_out_c7_13_scanout[1];
assign ff_l2d_l2b_decc_out_c7_15_scanin[1]=ff_l2d_l2b_decc_out_c7_11_scanout[1];
assign ff_l2d_l2b_decc_out_c7_1_scanin[2]=ff_l2d_l2b_decc_out_c7_15_scanout[1];
assign ff_l2d_l2b_decc_out_c7_5_scanin[2]=ff_l2d_l2b_decc_out_c7_1_scanout[2];
assign ff_l2d_l2b_decc_out_c7_3_scanin[2]=ff_l2d_l2b_decc_out_c7_5_scanout[2];
assign ff_l2d_l2b_decc_out_c7_7_scanin[2]=ff_l2d_l2b_decc_out_c7_3_scanout[2];
assign ff_l2d_l2b_decc_out_c7_9_scanin[2]=ff_l2d_l2b_decc_out_c7_7_scanout[2];
assign ff_l2d_l2b_decc_out_c7_13_scanin[2]=ff_l2d_l2b_decc_out_c7_9_scanout[2];
assign ff_l2d_l2b_decc_out_c7_11_scanin[2]=ff_l2d_l2b_decc_out_c7_13_scanout[2];
assign ff_l2d_l2b_decc_out_c7_15_scanin[2]=ff_l2d_l2b_decc_out_c7_11_scanout[2];
assign ff_l2d_l2b_decc_out_c7_1_scanin[3]=ff_l2d_l2b_decc_out_c7_15_scanout[2];
assign ff_l2d_l2b_decc_out_c7_5_scanin[3]=ff_l2d_l2b_decc_out_c7_1_scanout[3];
assign ff_l2d_l2b_decc_out_c7_3_scanin[3]=ff_l2d_l2b_decc_out_c7_5_scanout[3];
assign ff_l2d_l2b_decc_out_c7_7_scanin[3]=ff_l2d_l2b_decc_out_c7_3_scanout[3];
assign ff_l2d_l2b_decc_out_c7_9_scanin[3]=ff_l2d_l2b_decc_out_c7_7_scanout[3];
assign ff_l2d_l2b_decc_out_c7_13_scanin[3]=ff_l2d_l2b_decc_out_c7_9_scanout[3];
assign ff_l2d_l2b_decc_out_c7_11_scanin[3]=ff_l2d_l2b_decc_out_c7_13_scanout[3];
assign ff_l2d_l2b_decc_out_c7_15_scanin[3]=ff_l2d_l2b_decc_out_c7_11_scanout[3];
assign ff_l2d_l2b_decc_out_c7_1_scanin[4]=ff_l2d_l2b_decc_out_c7_15_scanout[3];
assign ff_l2d_l2b_decc_out_c7_5_scanin[4]=ff_l2d_l2b_decc_out_c7_1_scanout[4];
assign ff_l2d_l2b_decc_out_c7_3_scanin[4]=ff_l2d_l2b_decc_out_c7_5_scanout[4];
assign ff_l2d_l2b_decc_out_c7_7_scanin[4]=ff_l2d_l2b_decc_out_c7_3_scanout[4];
assign ff_l2d_l2b_decc_out_c7_9_scanin[4]=ff_l2d_l2b_decc_out_c7_7_scanout[4];
assign ff_l2d_l2b_decc_out_c7_13_scanin[4]=ff_l2d_l2b_decc_out_c7_9_scanout[4];
assign ff_l2d_l2b_decc_out_c7_11_scanin[4]=ff_l2d_l2b_decc_out_c7_13_scanout[4];
assign ff_l2d_l2b_decc_out_c7_15_scanin[4]=ff_l2d_l2b_decc_out_c7_11_scanout[4];
assign ff_l2d_l2b_decc_out_c7_1_scanin[5]=ff_l2d_l2b_decc_out_c7_15_scanout[4];
assign ff_l2d_l2b_decc_out_c7_5_scanin[5]=ff_l2d_l2b_decc_out_c7_1_scanout[5];
assign ff_l2d_l2b_decc_out_c7_3_scanin[5]=ff_l2d_l2b_decc_out_c7_5_scanout[5];
assign ff_l2d_l2b_decc_out_c7_7_scanin[5]=ff_l2d_l2b_decc_out_c7_3_scanout[5];
assign ff_l2d_l2b_decc_out_c7_9_scanin[5]=ff_l2d_l2b_decc_out_c7_7_scanout[5];
assign ff_l2d_l2b_decc_out_c7_13_scanin[5]=ff_l2d_l2b_decc_out_c7_9_scanout[5];
assign ff_l2d_l2b_decc_out_c7_11_scanin[5]=ff_l2d_l2b_decc_out_c7_13_scanout[5];
assign ff_l2d_l2b_decc_out_c7_15_scanin[5]=ff_l2d_l2b_decc_out_c7_11_scanout[5];
assign ff_l2d_l2b_decc_out_c7_1_scanin[6]=ff_l2d_l2b_decc_out_c7_15_scanout[5];
assign ff_l2d_l2b_decc_out_c7_5_scanin[6]=ff_l2d_l2b_decc_out_c7_1_scanout[6];
assign ff_l2d_l2b_decc_out_c7_3_scanin[6]=ff_l2d_l2b_decc_out_c7_5_scanout[6];
assign ff_l2d_l2b_decc_out_c7_7_scanin[6]=ff_l2d_l2b_decc_out_c7_3_scanout[6];
assign ff_l2d_l2b_decc_out_c7_9_scanin[6]=ff_l2d_l2b_decc_out_c7_7_scanout[6];
assign ff_l2d_l2b_decc_out_c7_13_scanin[6]=ff_l2d_l2b_decc_out_c7_9_scanout[6];
assign ff_l2d_l2b_decc_out_c7_11_scanin[6]=ff_l2d_l2b_decc_out_c7_13_scanout[6];
assign ff_l2d_l2b_decc_out_c7_15_scanin[6]=ff_l2d_l2b_decc_out_c7_11_scanout[6];
assign ff_l2d_l2b_decc_out_c7_1_scanin[7]=ff_l2d_l2b_decc_out_c7_15_scanout[6];
assign ff_l2d_l2b_decc_out_c7_5_scanin[7]=ff_l2d_l2b_decc_out_c7_1_scanout[7];
assign ff_l2d_l2b_decc_out_c7_3_scanin[7]=ff_l2d_l2b_decc_out_c7_5_scanout[7];
assign ff_l2d_l2b_decc_out_c7_7_scanin[7]=ff_l2d_l2b_decc_out_c7_3_scanout[7];
assign ff_l2d_l2b_decc_out_c7_9_scanin[7]=ff_l2d_l2b_decc_out_c7_7_scanout[7];
assign ff_l2d_l2b_decc_out_c7_13_scanin[7]=ff_l2d_l2b_decc_out_c7_9_scanout[7];
assign ff_l2d_l2b_decc_out_c7_11_scanin[7]=ff_l2d_l2b_decc_out_c7_13_scanout[7];
assign ff_l2d_l2b_decc_out_c7_15_scanin[7]=ff_l2d_l2b_decc_out_c7_11_scanout[7];
assign ff_l2d_l2b_decc_out_c7_1_scanin[8]=ff_l2d_l2b_decc_out_c7_15_scanout[7];
assign ff_l2d_l2b_decc_out_c7_5_scanin[8]=ff_l2d_l2b_decc_out_c7_1_scanout[8];
assign ff_l2d_l2b_decc_out_c7_3_scanin[8]=ff_l2d_l2b_decc_out_c7_5_scanout[8];
assign ff_l2d_l2b_decc_out_c7_7_scanin[8]=ff_l2d_l2b_decc_out_c7_3_scanout[8];
assign ff_l2d_l2b_decc_out_c7_9_scanin[8]=ff_l2d_l2b_decc_out_c7_7_scanout[8];
assign ff_l2d_l2b_decc_out_c7_13_scanin[8]=ff_l2d_l2b_decc_out_c7_9_scanout[8];
assign ff_l2d_l2b_decc_out_c7_11_scanin[8]=ff_l2d_l2b_decc_out_c7_13_scanout[8];
assign ff_l2d_l2b_decc_out_c7_15_scanin[8]=ff_l2d_l2b_decc_out_c7_11_scanout[8];
assign ff_l2d_l2b_decc_out_c7_1_scanin[9]=ff_l2d_l2b_decc_out_c7_15_scanout[8];
assign ff_l2d_l2b_decc_out_c7_5_scanin[9]=ff_l2d_l2b_decc_out_c7_1_scanout[9];
assign ff_l2d_l2b_decc_out_c7_3_scanin[9]=ff_l2d_l2b_decc_out_c7_5_scanout[9];
assign ff_l2d_l2b_decc_out_c7_7_scanin[9]=ff_l2d_l2b_decc_out_c7_3_scanout[9];
assign ff_l2d_l2b_decc_out_c7_9_scanin[9]=ff_l2d_l2b_decc_out_c7_7_scanout[9];
assign ff_l2d_l2b_decc_out_c7_13_scanin[9]=ff_l2d_l2b_decc_out_c7_9_scanout[9];
assign ff_l2d_l2b_decc_out_c7_11_scanin[9]=ff_l2d_l2b_decc_out_c7_13_scanout[9];
assign ff_l2d_l2b_decc_out_c7_15_scanin[9]=ff_l2d_l2b_decc_out_c7_11_scanout[9];
assign ff_l2d_l2b_decc_out_c7_1_scanin[10]=ff_l2d_l2b_decc_out_c7_15_scanout[9];
assign ff_l2d_l2b_decc_out_c7_5_scanin[10]=ff_l2d_l2b_decc_out_c7_1_scanout[10];
assign ff_l2d_l2b_decc_out_c7_3_scanin[10]=ff_l2d_l2b_decc_out_c7_5_scanout[10];
assign ff_l2d_l2b_decc_out_c7_7_scanin[10]=ff_l2d_l2b_decc_out_c7_3_scanout[10];
assign ff_l2d_l2b_decc_out_c7_9_scanin[10]=ff_l2d_l2b_decc_out_c7_7_scanout[10];
assign ff_l2d_l2b_decc_out_c7_13_scanin[10]=ff_l2d_l2b_decc_out_c7_9_scanout[10];
assign ff_l2d_l2b_decc_out_c7_11_scanin[10]=ff_l2d_l2b_decc_out_c7_13_scanout[10];
assign ff_l2d_l2b_decc_out_c7_15_scanin[10]=ff_l2d_l2b_decc_out_c7_11_scanout[10];
assign ff_l2d_l2b_decc_out_c7_1_scanin[11]=ff_l2d_l2b_decc_out_c7_15_scanout[10];
assign ff_l2d_l2b_decc_out_c7_5_scanin[11]=ff_l2d_l2b_decc_out_c7_1_scanout[11];
assign ff_l2d_l2b_decc_out_c7_3_scanin[11]=ff_l2d_l2b_decc_out_c7_5_scanout[11];
assign ff_l2d_l2b_decc_out_c7_7_scanin[11]=ff_l2d_l2b_decc_out_c7_3_scanout[11];
assign ff_l2d_l2b_decc_out_c7_9_scanin[11]=ff_l2d_l2b_decc_out_c7_7_scanout[11];
assign ff_l2d_l2b_decc_out_c7_13_scanin[11]=ff_l2d_l2b_decc_out_c7_9_scanout[11];
assign ff_l2d_l2b_decc_out_c7_11_scanin[11]=ff_l2d_l2b_decc_out_c7_13_scanout[11];
assign ff_l2d_l2b_decc_out_c7_15_scanin[11]=ff_l2d_l2b_decc_out_c7_11_scanout[11];
assign ff_l2d_l2b_decc_out_c7_1_scanin[12]=ff_l2d_l2b_decc_out_c7_15_scanout[11];
assign ff_l2d_l2b_decc_out_c7_5_scanin[12]=ff_l2d_l2b_decc_out_c7_1_scanout[12];
assign ff_l2d_l2b_decc_out_c7_3_scanin[12]=ff_l2d_l2b_decc_out_c7_5_scanout[12];
assign ff_l2d_l2b_decc_out_c7_7_scanin[12]=ff_l2d_l2b_decc_out_c7_3_scanout[12];
assign ff_l2d_l2b_decc_out_c7_9_scanin[12]=ff_l2d_l2b_decc_out_c7_7_scanout[12];
assign ff_l2d_l2b_decc_out_c7_13_scanin[12]=ff_l2d_l2b_decc_out_c7_9_scanout[12];
assign ff_l2d_l2b_decc_out_c7_11_scanin[12]=ff_l2d_l2b_decc_out_c7_13_scanout[12];
assign ff_l2d_l2b_decc_out_c7_15_scanin[12]=ff_l2d_l2b_decc_out_c7_11_scanout[12];
assign ff_l2d_l2b_decc_out_c7_1_scanin[13]=ff_l2d_l2b_decc_out_c7_15_scanout[12];
assign ff_l2d_l2b_decc_out_c7_5_scanin[13]=ff_l2d_l2b_decc_out_c7_1_scanout[13];
assign ff_l2d_l2b_decc_out_c7_3_scanin[13]=ff_l2d_l2b_decc_out_c7_5_scanout[13];
assign ff_l2d_l2b_decc_out_c7_7_scanin[13]=ff_l2d_l2b_decc_out_c7_3_scanout[13];
assign ff_l2d_l2b_decc_out_c7_9_scanin[13]=ff_l2d_l2b_decc_out_c7_7_scanout[13];
assign ff_l2d_l2b_decc_out_c7_13_scanin[13]=ff_l2d_l2b_decc_out_c7_9_scanout[13];
assign ff_l2d_l2b_decc_out_c7_11_scanin[13]=ff_l2d_l2b_decc_out_c7_13_scanout[13];
assign ff_l2d_l2b_decc_out_c7_15_scanin[13]=ff_l2d_l2b_decc_out_c7_11_scanout[13];
assign ff_l2d_l2b_decc_out_c7_1_scanin[14]=ff_l2d_l2b_decc_out_c7_15_scanout[13];
assign ff_l2d_l2b_decc_out_c7_5_scanin[14]=ff_l2d_l2b_decc_out_c7_1_scanout[14];
assign ff_l2d_l2b_decc_out_c7_3_scanin[14]=ff_l2d_l2b_decc_out_c7_5_scanout[14];
assign ff_l2d_l2b_decc_out_c7_7_scanin[14]=ff_l2d_l2b_decc_out_c7_3_scanout[14];
assign ff_l2d_l2b_decc_out_c7_9_scanin[14]=ff_l2d_l2b_decc_out_c7_7_scanout[14];
assign ff_l2d_l2b_decc_out_c7_13_scanin[14]=ff_l2d_l2b_decc_out_c7_9_scanout[14];
assign ff_l2d_l2b_decc_out_c7_11_scanin[14]=ff_l2d_l2b_decc_out_c7_13_scanout[14];
assign ff_l2d_l2b_decc_out_c7_15_scanin[14]=ff_l2d_l2b_decc_out_c7_11_scanout[14];
assign ff_l2d_l2b_decc_out_c7_1_scanin[15]=ff_l2d_l2b_decc_out_c7_15_scanout[14];
assign ff_l2d_l2b_decc_out_c7_5_scanin[15]=ff_l2d_l2b_decc_out_c7_1_scanout[15];
assign ff_l2d_l2b_decc_out_c7_3_scanin[15]=ff_l2d_l2b_decc_out_c7_5_scanout[15];
assign ff_l2d_l2b_decc_out_c7_7_scanin[15]=ff_l2d_l2b_decc_out_c7_3_scanout[15];
assign ff_l2d_l2b_decc_out_c7_9_scanin[15]=ff_l2d_l2b_decc_out_c7_7_scanout[15];
assign ff_l2d_l2b_decc_out_c7_13_scanin[15]=ff_l2d_l2b_decc_out_c7_9_scanout[15];
assign ff_l2d_l2b_decc_out_c7_11_scanin[15]=ff_l2d_l2b_decc_out_c7_13_scanout[15];
assign ff_l2d_l2b_decc_out_c7_15_scanin[15]=ff_l2d_l2b_decc_out_c7_11_scanout[15];
assign ff_l2d_l2b_decc_out_c7_1_scanin[16]=ff_l2d_l2b_decc_out_c7_15_scanout[15];
assign ff_l2d_l2b_decc_out_c7_5_scanin[16]=ff_l2d_l2b_decc_out_c7_1_scanout[16];
assign ff_l2d_l2b_decc_out_c7_3_scanin[16]=ff_l2d_l2b_decc_out_c7_5_scanout[16];
assign ff_l2d_l2b_decc_out_c7_7_scanin[16]=ff_l2d_l2b_decc_out_c7_3_scanout[16];
assign ff_l2d_l2b_decc_out_c7_9_scanin[16]=ff_l2d_l2b_decc_out_c7_7_scanout[16];
assign ff_l2d_l2b_decc_out_c7_13_scanin[16]=ff_l2d_l2b_decc_out_c7_9_scanout[16];
assign ff_l2d_l2b_decc_out_c7_11_scanin[16]=ff_l2d_l2b_decc_out_c7_13_scanout[16];
assign ff_l2d_l2b_decc_out_c7_15_scanin[16]=ff_l2d_l2b_decc_out_c7_11_scanout[16];
assign ff_l2d_l2b_decc_out_c7_1_scanin[17]=ff_l2d_l2b_decc_out_c7_15_scanout[16];
assign ff_l2d_l2b_decc_out_c7_5_scanin[17]=ff_l2d_l2b_decc_out_c7_1_scanout[17];
assign ff_l2d_l2b_decc_out_c7_3_scanin[17]=ff_l2d_l2b_decc_out_c7_5_scanout[17];
assign ff_l2d_l2b_decc_out_c7_7_scanin[17]=ff_l2d_l2b_decc_out_c7_3_scanout[17];
assign ff_l2d_l2b_decc_out_c7_9_scanin[17]=ff_l2d_l2b_decc_out_c7_7_scanout[17];
assign ff_l2d_l2b_decc_out_c7_13_scanin[17]=ff_l2d_l2b_decc_out_c7_9_scanout[17];
assign ff_l2d_l2b_decc_out_c7_11_scanin[17]=ff_l2d_l2b_decc_out_c7_13_scanout[17];
assign ff_l2d_l2b_decc_out_c7_15_scanin[17]=ff_l2d_l2b_decc_out_c7_11_scanout[17];
assign ff_l2d_l2b_decc_out_c7_1_scanin[18]=ff_l2d_l2b_decc_out_c7_15_scanout[17];
assign ff_l2d_l2b_decc_out_c7_5_scanin[18]=ff_l2d_l2b_decc_out_c7_1_scanout[18];
assign ff_l2d_l2b_decc_out_c7_3_scanin[18]=ff_l2d_l2b_decc_out_c7_5_scanout[18];
assign ff_l2d_l2b_decc_out_c7_7_scanin[18]=ff_l2d_l2b_decc_out_c7_3_scanout[18];
assign ff_l2d_l2b_decc_out_c7_9_scanin[18]=ff_l2d_l2b_decc_out_c7_7_scanout[18];
assign ff_l2d_l2b_decc_out_c7_13_scanin[18]=ff_l2d_l2b_decc_out_c7_9_scanout[18];
assign ff_l2d_l2b_decc_out_c7_11_scanin[18]=ff_l2d_l2b_decc_out_c7_13_scanout[18];
assign ff_l2d_l2b_decc_out_c7_15_scanin[18]=ff_l2d_l2b_decc_out_c7_11_scanout[18];
assign ff_l2d_l2b_decc_out_c7_1_scanin[19]=ff_l2d_l2b_decc_out_c7_15_scanout[18];
assign ff_l2d_l2b_decc_out_c7_5_scanin[19]=ff_l2d_l2b_decc_out_c7_1_scanout[19];
assign ff_l2d_l2b_decc_out_c7_3_scanin[19]=ff_l2d_l2b_decc_out_c7_5_scanout[19];
assign ff_l2d_l2b_decc_out_c7_7_scanin[19]=ff_l2d_l2b_decc_out_c7_3_scanout[19];
assign ff_l2d_l2b_decc_out_c7_9_scanin[19]=ff_l2d_l2b_decc_out_c7_7_scanout[19];
assign ff_l2d_l2b_decc_out_c7_13_scanin[19]=ff_l2d_l2b_decc_out_c7_9_scanout[19];
assign ff_l2d_l2b_decc_out_c7_11_scanin[19]=ff_l2d_l2b_decc_out_c7_13_scanout[19];
assign ff_l2d_l2b_decc_out_c7_15_scanin[19]=ff_l2d_l2b_decc_out_c7_11_scanout[19];
assign ff_l2d_l2b_decc_out_c7_1_scanin[20]=ff_l2d_l2b_decc_out_c7_15_scanout[19];
assign ff_l2d_l2b_decc_out_c7_5_scanin[20]=ff_l2d_l2b_decc_out_c7_1_scanout[20];
assign ff_l2d_l2b_decc_out_c7_3_scanin[20]=ff_l2d_l2b_decc_out_c7_5_scanout[20];
assign ff_l2d_l2b_decc_out_c7_7_scanin[20]=ff_l2d_l2b_decc_out_c7_3_scanout[20];
assign ff_l2d_l2b_decc_out_c7_9_scanin[20]=ff_l2d_l2b_decc_out_c7_7_scanout[20];
assign ff_l2d_l2b_decc_out_c7_13_scanin[20]=ff_l2d_l2b_decc_out_c7_9_scanout[20];
assign ff_l2d_l2b_decc_out_c7_11_scanin[20]=ff_l2d_l2b_decc_out_c7_13_scanout[20];
assign ff_l2d_l2b_decc_out_c7_15_scanin[20]=ff_l2d_l2b_decc_out_c7_11_scanout[20];
assign ff_l2d_l2b_decc_out_c7_1_scanin[21]=ff_l2d_l2b_decc_out_c7_15_scanout[20];
assign ff_l2d_l2b_decc_out_c7_5_scanin[21]=ff_l2d_l2b_decc_out_c7_1_scanout[21];
assign ff_l2d_l2b_decc_out_c7_3_scanin[21]=ff_l2d_l2b_decc_out_c7_5_scanout[21];
assign ff_l2d_l2b_decc_out_c7_7_scanin[21]=ff_l2d_l2b_decc_out_c7_3_scanout[21];
assign ff_l2d_l2b_decc_out_c7_9_scanin[21]=ff_l2d_l2b_decc_out_c7_7_scanout[21];
assign ff_l2d_l2b_decc_out_c7_13_scanin[21]=ff_l2d_l2b_decc_out_c7_9_scanout[21];
assign ff_l2d_l2b_decc_out_c7_11_scanin[21]=ff_l2d_l2b_decc_out_c7_13_scanout[21];
assign ff_l2d_l2b_decc_out_c7_15_scanin[21]=ff_l2d_l2b_decc_out_c7_11_scanout[21];
assign ff_l2d_l2b_decc_out_c7_1_scanin[22]=ff_l2d_l2b_decc_out_c7_15_scanout[21];
assign ff_l2d_l2b_decc_out_c7_5_scanin[22]=ff_l2d_l2b_decc_out_c7_1_scanout[22];
assign ff_l2d_l2b_decc_out_c7_3_scanin[22]=ff_l2d_l2b_decc_out_c7_5_scanout[22];
assign ff_l2d_l2b_decc_out_c7_7_scanin[22]=ff_l2d_l2b_decc_out_c7_3_scanout[22];
assign ff_l2d_l2b_decc_out_c7_9_scanin[22]=ff_l2d_l2b_decc_out_c7_7_scanout[22];
assign ff_l2d_l2b_decc_out_c7_13_scanin[22]=ff_l2d_l2b_decc_out_c7_9_scanout[22];
assign ff_l2d_l2b_decc_out_c7_11_scanin[22]=ff_l2d_l2b_decc_out_c7_13_scanout[22];
assign ff_l2d_l2b_decc_out_c7_15_scanin[22]=ff_l2d_l2b_decc_out_c7_11_scanout[22];
assign ff_l2d_l2b_decc_out_c7_1_scanin[23]=ff_l2d_l2b_decc_out_c7_15_scanout[22];
assign ff_l2d_l2b_decc_out_c7_5_scanin[23]=ff_l2d_l2b_decc_out_c7_1_scanout[23];
assign ff_l2d_l2b_decc_out_c7_3_scanin[23]=ff_l2d_l2b_decc_out_c7_5_scanout[23];
assign ff_l2d_l2b_decc_out_c7_7_scanin[23]=ff_l2d_l2b_decc_out_c7_3_scanout[23];
assign ff_l2d_l2b_decc_out_c7_9_scanin[23]=ff_l2d_l2b_decc_out_c7_7_scanout[23];
assign ff_l2d_l2b_decc_out_c7_13_scanin[23]=ff_l2d_l2b_decc_out_c7_9_scanout[23];
assign ff_l2d_l2b_decc_out_c7_11_scanin[23]=ff_l2d_l2b_decc_out_c7_13_scanout[23];
assign ff_l2d_l2b_decc_out_c7_15_scanin[23]=ff_l2d_l2b_decc_out_c7_11_scanout[23];
assign ff_l2d_l2b_decc_out_c7_1_scanin[24]=ff_l2d_l2b_decc_out_c7_15_scanout[23];
assign ff_l2d_l2b_decc_out_c7_5_scanin[24]=ff_l2d_l2b_decc_out_c7_1_scanout[24];
assign ff_l2d_l2b_decc_out_c7_3_scanin[24]=ff_l2d_l2b_decc_out_c7_5_scanout[24];
assign ff_l2d_l2b_decc_out_c7_7_scanin[24]=ff_l2d_l2b_decc_out_c7_3_scanout[24];
assign ff_l2d_l2b_decc_out_c7_9_scanin[24]=ff_l2d_l2b_decc_out_c7_7_scanout[24];
assign ff_l2d_l2b_decc_out_c7_13_scanin[24]=ff_l2d_l2b_decc_out_c7_9_scanout[24];
assign ff_l2d_l2b_decc_out_c7_11_scanin[24]=ff_l2d_l2b_decc_out_c7_13_scanout[24];
assign ff_l2d_l2b_decc_out_c7_15_scanin[24]=ff_l2d_l2b_decc_out_c7_11_scanout[24];
assign ff_l2d_l2b_decc_out_c7_1_scanin[25]=ff_l2d_l2b_decc_out_c7_15_scanout[24];
assign ff_l2d_l2b_decc_out_c7_5_scanin[25]=ff_l2d_l2b_decc_out_c7_1_scanout[25];
assign ff_l2d_l2b_decc_out_c7_3_scanin[25]=ff_l2d_l2b_decc_out_c7_5_scanout[25];
assign ff_l2d_l2b_decc_out_c7_7_scanin[25]=ff_l2d_l2b_decc_out_c7_3_scanout[25];
assign ff_l2d_l2b_decc_out_c7_9_scanin[25]=ff_l2d_l2b_decc_out_c7_7_scanout[25];
assign ff_l2d_l2b_decc_out_c7_13_scanin[25]=ff_l2d_l2b_decc_out_c7_9_scanout[25];
assign ff_l2d_l2b_decc_out_c7_11_scanin[25]=ff_l2d_l2b_decc_out_c7_13_scanout[25];
assign ff_l2d_l2b_decc_out_c7_15_scanin[25]=ff_l2d_l2b_decc_out_c7_11_scanout[25];
assign ff_l2d_l2b_decc_out_c7_1_scanin[26]=ff_l2d_l2b_decc_out_c7_15_scanout[25];
assign ff_l2d_l2b_decc_out_c7_5_scanin[26]=ff_l2d_l2b_decc_out_c7_1_scanout[26];
assign ff_l2d_l2b_decc_out_c7_3_scanin[26]=ff_l2d_l2b_decc_out_c7_5_scanout[26];
assign ff_l2d_l2b_decc_out_c7_7_scanin[26]=ff_l2d_l2b_decc_out_c7_3_scanout[26];
assign ff_l2d_l2b_decc_out_c7_9_scanin[26]=ff_l2d_l2b_decc_out_c7_7_scanout[26];
assign ff_l2d_l2b_decc_out_c7_13_scanin[26]=ff_l2d_l2b_decc_out_c7_9_scanout[26];
assign ff_l2d_l2b_decc_out_c7_11_scanin[26]=ff_l2d_l2b_decc_out_c7_13_scanout[26];
assign ff_l2d_l2b_decc_out_c7_15_scanin[26]=ff_l2d_l2b_decc_out_c7_11_scanout[26];
assign ff_l2d_l2b_decc_out_c7_1_scanin[27]=ff_l2d_l2b_decc_out_c7_15_scanout[26];
assign ff_l2d_l2b_decc_out_c7_5_scanin[27]=ff_l2d_l2b_decc_out_c7_1_scanout[27];
assign ff_l2d_l2b_decc_out_c7_3_scanin[27]=ff_l2d_l2b_decc_out_c7_5_scanout[27];
assign ff_l2d_l2b_decc_out_c7_7_scanin[27]=ff_l2d_l2b_decc_out_c7_3_scanout[27];
assign ff_l2d_l2b_decc_out_c7_9_scanin[27]=ff_l2d_l2b_decc_out_c7_7_scanout[27];
assign ff_l2d_l2b_decc_out_c7_13_scanin[27]=ff_l2d_l2b_decc_out_c7_9_scanout[27];
assign ff_l2d_l2b_decc_out_c7_11_scanin[27]=ff_l2d_l2b_decc_out_c7_13_scanout[27];
assign ff_l2d_l2b_decc_out_c7_15_scanin[27]=ff_l2d_l2b_decc_out_c7_11_scanout[27];
assign ff_l2d_l2b_decc_out_c7_1_scanin[28]=ff_l2d_l2b_decc_out_c7_15_scanout[27];
assign ff_l2d_l2b_decc_out_c7_5_scanin[28]=ff_l2d_l2b_decc_out_c7_1_scanout[28];
assign ff_l2d_l2b_decc_out_c7_3_scanin[28]=ff_l2d_l2b_decc_out_c7_5_scanout[28];
assign ff_l2d_l2b_decc_out_c7_7_scanin[28]=ff_l2d_l2b_decc_out_c7_3_scanout[28];
assign ff_l2d_l2b_decc_out_c7_9_scanin[28]=ff_l2d_l2b_decc_out_c7_7_scanout[28];
assign ff_l2d_l2b_decc_out_c7_13_scanin[28]=ff_l2d_l2b_decc_out_c7_9_scanout[28];
assign ff_l2d_l2b_decc_out_c7_11_scanin[28]=ff_l2d_l2b_decc_out_c7_13_scanout[28];
assign ff_l2d_l2b_decc_out_c7_15_scanin[28]=ff_l2d_l2b_decc_out_c7_11_scanout[28];
assign ff_l2d_l2b_decc_out_c7_1_scanin[29]=ff_l2d_l2b_decc_out_c7_15_scanout[28];
assign ff_l2d_l2b_decc_out_c7_5_scanin[29]=ff_l2d_l2b_decc_out_c7_1_scanout[29];
assign ff_l2d_l2b_decc_out_c7_3_scanin[29]=ff_l2d_l2b_decc_out_c7_5_scanout[29];
assign ff_l2d_l2b_decc_out_c7_7_scanin[29]=ff_l2d_l2b_decc_out_c7_3_scanout[29];
assign ff_l2d_l2b_decc_out_c7_9_scanin[29]=ff_l2d_l2b_decc_out_c7_7_scanout[29];
assign ff_l2d_l2b_decc_out_c7_13_scanin[29]=ff_l2d_l2b_decc_out_c7_9_scanout[29];
assign ff_l2d_l2b_decc_out_c7_11_scanin[29]=ff_l2d_l2b_decc_out_c7_13_scanout[29];
assign ff_l2d_l2b_decc_out_c7_15_scanin[29]=ff_l2d_l2b_decc_out_c7_11_scanout[29];
assign ff_l2d_l2b_decc_out_c7_1_scanin[30]=ff_l2d_l2b_decc_out_c7_15_scanout[29];
assign ff_l2d_l2b_decc_out_c7_5_scanin[30]=ff_l2d_l2b_decc_out_c7_1_scanout[30];
assign ff_l2d_l2b_decc_out_c7_3_scanin[30]=ff_l2d_l2b_decc_out_c7_5_scanout[30];
assign ff_l2d_l2b_decc_out_c7_7_scanin[30]=ff_l2d_l2b_decc_out_c7_3_scanout[30];
assign ff_l2d_l2b_decc_out_c7_9_scanin[30]=ff_l2d_l2b_decc_out_c7_7_scanout[30];
assign ff_l2d_l2b_decc_out_c7_13_scanin[30]=ff_l2d_l2b_decc_out_c7_9_scanout[30];
assign ff_l2d_l2b_decc_out_c7_11_scanin[30]=ff_l2d_l2b_decc_out_c7_13_scanout[30];
assign ff_l2d_l2b_decc_out_c7_15_scanin[30]=ff_l2d_l2b_decc_out_c7_11_scanout[30];
assign ff_l2d_l2b_decc_out_c7_1_scanin[31]=ff_l2d_l2b_decc_out_c7_15_scanout[30];
assign ff_l2d_l2b_decc_out_c7_5_scanin[31]=ff_l2d_l2b_decc_out_c7_1_scanout[31];
assign ff_l2d_l2b_decc_out_c7_3_scanin[31]=ff_l2d_l2b_decc_out_c7_5_scanout[31];
assign ff_l2d_l2b_decc_out_c7_7_scanin[31]=ff_l2d_l2b_decc_out_c7_3_scanout[31];
assign ff_l2d_l2b_decc_out_c7_9_scanin[31]=ff_l2d_l2b_decc_out_c7_7_scanout[31];
assign ff_l2d_l2b_decc_out_c7_13_scanin[31]=ff_l2d_l2b_decc_out_c7_9_scanout[31];
assign ff_l2d_l2b_decc_out_c7_11_scanin[31]=ff_l2d_l2b_decc_out_c7_13_scanout[31];
assign ff_l2d_l2b_decc_out_c7_15_scanin[31]=ff_l2d_l2b_decc_out_c7_11_scanout[31];
assign ff_l2d_l2b_decc_out_c7_1_scanin[32]=ff_l2d_l2b_decc_out_c7_15_scanout[31];
assign ff_l2d_l2b_decc_out_c7_5_scanin[32]=ff_l2d_l2b_decc_out_c7_1_scanout[32];
assign ff_l2d_l2b_decc_out_c7_3_scanin[32]=ff_l2d_l2b_decc_out_c7_5_scanout[32];
assign ff_l2d_l2b_decc_out_c7_7_scanin[32]=ff_l2d_l2b_decc_out_c7_3_scanout[32];
assign ff_l2d_l2b_decc_out_c7_9_scanin[32]=ff_l2d_l2b_decc_out_c7_7_scanout[32];
assign ff_l2d_l2b_decc_out_c7_13_scanin[32]=ff_l2d_l2b_decc_out_c7_9_scanout[32];
assign ff_l2d_l2b_decc_out_c7_11_scanin[32]=ff_l2d_l2b_decc_out_c7_13_scanout[32];
assign ff_l2d_l2b_decc_out_c7_15_scanin[32]=ff_l2d_l2b_decc_out_c7_11_scanout[32];
assign ff_l2d_l2b_decc_out_c7_1_scanin[33]=ff_l2d_l2b_decc_out_c7_15_scanout[32];
assign ff_l2d_l2b_decc_out_c7_5_scanin[33]=ff_l2d_l2b_decc_out_c7_1_scanout[33];
assign ff_l2d_l2b_decc_out_c7_3_scanin[33]=ff_l2d_l2b_decc_out_c7_5_scanout[33];
assign ff_l2d_l2b_decc_out_c7_7_scanin[33]=ff_l2d_l2b_decc_out_c7_3_scanout[33];
assign ff_l2d_l2b_decc_out_c7_9_scanin[33]=ff_l2d_l2b_decc_out_c7_7_scanout[33];
assign ff_l2d_l2b_decc_out_c7_13_scanin[33]=ff_l2d_l2b_decc_out_c7_9_scanout[33];
assign ff_l2d_l2b_decc_out_c7_11_scanin[33]=ff_l2d_l2b_decc_out_c7_13_scanout[33];
assign ff_l2d_l2b_decc_out_c7_15_scanin[33]=ff_l2d_l2b_decc_out_c7_11_scanout[33];
assign ff_l2d_l2b_decc_out_c7_1_scanin[34]=ff_l2d_l2b_decc_out_c7_15_scanout[33];
assign ff_l2d_l2b_decc_out_c7_5_scanin[34]=ff_l2d_l2b_decc_out_c7_1_scanout[34];
assign ff_l2d_l2b_decc_out_c7_3_scanin[34]=ff_l2d_l2b_decc_out_c7_5_scanout[34];
assign ff_l2d_l2b_decc_out_c7_7_scanin[34]=ff_l2d_l2b_decc_out_c7_3_scanout[34];
assign ff_l2d_l2b_decc_out_c7_9_scanin[34]=ff_l2d_l2b_decc_out_c7_7_scanout[34];
assign ff_l2d_l2b_decc_out_c7_13_scanin[34]=ff_l2d_l2b_decc_out_c7_9_scanout[34];
assign ff_l2d_l2b_decc_out_c7_11_scanin[34]=ff_l2d_l2b_decc_out_c7_13_scanout[34];
assign ff_l2d_l2b_decc_out_c7_15_scanin[34]=ff_l2d_l2b_decc_out_c7_11_scanout[34];
assign ff_l2d_l2b_decc_out_c7_1_scanin[35]=ff_l2d_l2b_decc_out_c7_15_scanout[34];
assign ff_l2d_l2b_decc_out_c7_5_scanin[35]=ff_l2d_l2b_decc_out_c7_1_scanout[35];
assign ff_l2d_l2b_decc_out_c7_3_scanin[35]=ff_l2d_l2b_decc_out_c7_5_scanout[35];
assign ff_l2d_l2b_decc_out_c7_7_scanin[35]=ff_l2d_l2b_decc_out_c7_3_scanout[35];
assign ff_l2d_l2b_decc_out_c7_9_scanin[35]=ff_l2d_l2b_decc_out_c7_7_scanout[35];
assign ff_l2d_l2b_decc_out_c7_13_scanin[35]=ff_l2d_l2b_decc_out_c7_9_scanout[35];
assign ff_l2d_l2b_decc_out_c7_11_scanin[35]=ff_l2d_l2b_decc_out_c7_13_scanout[35];
assign ff_l2d_l2b_decc_out_c7_15_scanin[35]=ff_l2d_l2b_decc_out_c7_11_scanout[35];
assign ff_l2d_l2b_decc_out_c7_1_scanin[36]=ff_l2d_l2b_decc_out_c7_15_scanout[35];
assign ff_l2d_l2b_decc_out_c7_5_scanin[36]=ff_l2d_l2b_decc_out_c7_1_scanout[36];
assign ff_l2d_l2b_decc_out_c7_3_scanin[36]=ff_l2d_l2b_decc_out_c7_5_scanout[36];
assign ff_l2d_l2b_decc_out_c7_7_scanin[36]=ff_l2d_l2b_decc_out_c7_3_scanout[36];
assign ff_l2d_l2b_decc_out_c7_9_scanin[36]=ff_l2d_l2b_decc_out_c7_7_scanout[36];
assign ff_l2d_l2b_decc_out_c7_13_scanin[36]=ff_l2d_l2b_decc_out_c7_9_scanout[36];
assign ff_l2d_l2b_decc_out_c7_11_scanin[36]=ff_l2d_l2b_decc_out_c7_13_scanout[36];
assign ff_l2d_l2b_decc_out_c7_15_scanin[36]=ff_l2d_l2b_decc_out_c7_11_scanout[36];
assign ff_l2d_l2b_decc_out_c7_1_scanin[37]=ff_l2d_l2b_decc_out_c7_15_scanout[36];
assign ff_l2d_l2b_decc_out_c7_5_scanin[37]=ff_l2d_l2b_decc_out_c7_1_scanout[37];
assign ff_l2d_l2b_decc_out_c7_3_scanin[37]=ff_l2d_l2b_decc_out_c7_5_scanout[37];
assign ff_l2d_l2b_decc_out_c7_7_scanin[37]=ff_l2d_l2b_decc_out_c7_3_scanout[37];
assign ff_l2d_l2b_decc_out_c7_9_scanin[37]=ff_l2d_l2b_decc_out_c7_7_scanout[37];
assign ff_l2d_l2b_decc_out_c7_13_scanin[37]=ff_l2d_l2b_decc_out_c7_9_scanout[37];
assign ff_l2d_l2b_decc_out_c7_11_scanin[37]=ff_l2d_l2b_decc_out_c7_13_scanout[37];
assign ff_l2d_l2b_decc_out_c7_15_scanin[37]=ff_l2d_l2b_decc_out_c7_11_scanout[37];
assign ff_l2d_l2b_decc_out_c7_1_scanin[38]=ff_l2d_l2b_decc_out_c7_15_scanout[37];
assign ff_l2d_l2b_decc_out_c7_5_scanin[38]=ff_l2d_l2b_decc_out_c7_1_scanout[38];
assign ff_l2d_l2b_decc_out_c7_3_scanin[38]=ff_l2d_l2b_decc_out_c7_5_scanout[38];
assign ff_l2d_l2b_decc_out_c7_7_scanin[38]=ff_l2d_l2b_decc_out_c7_3_scanout[38];
assign ff_l2d_l2b_decc_out_c7_9_scanin[38]=ff_l2d_l2b_decc_out_c7_7_scanout[38];
assign ff_l2d_l2b_decc_out_c7_13_scanin[38]=ff_l2d_l2b_decc_out_c7_9_scanout[38];
assign ff_l2d_l2b_decc_out_c7_11_scanin[38]=ff_l2d_l2b_decc_out_c7_13_scanout[38];
assign ff_l2d_l2b_decc_out_c7_15_scanin[38]=ff_l2d_l2b_decc_out_c7_11_scanout[38];
assign ff_l2d_l2b_decc_out_c7_2_scanin[0]=ff_l2d_l2b_decc_out_c7_15_scanout[38];
assign ff_l2d_l2b_decc_out_c7_6_scanin[0]=ff_l2d_l2b_decc_out_c7_2_scanout[0];
assign ff_l2d_l2b_decc_out_c7_4_scanin[0]=ff_l2d_l2b_decc_out_c7_6_scanout[0];
assign ff_l2d_l2b_decc_out_c7_8_scanin[0]=ff_l2d_l2b_decc_out_c7_4_scanout[0];
assign ff_l2d_l2b_decc_out_c7_10_scanin[0]=ff_l2d_l2b_decc_out_c7_8_scanout[0];
assign ff_l2d_l2b_decc_out_c7_14_scanin[0]=ff_l2d_l2b_decc_out_c7_10_scanout[0];
assign ff_l2d_l2b_decc_out_c7_12_scanin[0]=ff_l2d_l2b_decc_out_c7_14_scanout[0];
assign ff_l2d_l2b_decc_out_c7_16_scanin[0]=ff_l2d_l2b_decc_out_c7_12_scanout[0];
assign ff_l2d_l2b_decc_out_c7_2_scanin[1]=ff_l2d_l2b_decc_out_c7_16_scanout[0];
assign ff_l2d_l2b_decc_out_c7_6_scanin[1]=ff_l2d_l2b_decc_out_c7_2_scanout[1];
assign ff_l2d_l2b_decc_out_c7_4_scanin[1]=ff_l2d_l2b_decc_out_c7_6_scanout[1];
assign ff_l2d_l2b_decc_out_c7_8_scanin[1]=ff_l2d_l2b_decc_out_c7_4_scanout[1];
assign ff_l2d_l2b_decc_out_c7_10_scanin[1]=ff_l2d_l2b_decc_out_c7_8_scanout[1];
assign ff_l2d_l2b_decc_out_c7_14_scanin[1]=ff_l2d_l2b_decc_out_c7_10_scanout[1];
assign ff_l2d_l2b_decc_out_c7_12_scanin[1]=ff_l2d_l2b_decc_out_c7_14_scanout[1];
assign ff_l2d_l2b_decc_out_c7_16_scanin[1]=ff_l2d_l2b_decc_out_c7_12_scanout[1];
assign ff_l2d_l2b_decc_out_c7_2_scanin[2]=ff_l2d_l2b_decc_out_c7_16_scanout[1];
assign ff_l2d_l2b_decc_out_c7_6_scanin[2]=ff_l2d_l2b_decc_out_c7_2_scanout[2];
assign ff_l2d_l2b_decc_out_c7_4_scanin[2]=ff_l2d_l2b_decc_out_c7_6_scanout[2];
assign ff_l2d_l2b_decc_out_c7_8_scanin[2]=ff_l2d_l2b_decc_out_c7_4_scanout[2];
assign ff_l2d_l2b_decc_out_c7_10_scanin[2]=ff_l2d_l2b_decc_out_c7_8_scanout[2];
assign ff_l2d_l2b_decc_out_c7_14_scanin[2]=ff_l2d_l2b_decc_out_c7_10_scanout[2];
assign ff_l2d_l2b_decc_out_c7_12_scanin[2]=ff_l2d_l2b_decc_out_c7_14_scanout[2];
assign ff_l2d_l2b_decc_out_c7_16_scanin[2]=ff_l2d_l2b_decc_out_c7_12_scanout[2];
assign ff_l2d_l2b_decc_out_c7_2_scanin[3]=ff_l2d_l2b_decc_out_c7_16_scanout[2];
assign ff_l2d_l2b_decc_out_c7_6_scanin[3]=ff_l2d_l2b_decc_out_c7_2_scanout[3];
assign ff_l2d_l2b_decc_out_c7_4_scanin[3]=ff_l2d_l2b_decc_out_c7_6_scanout[3];
assign ff_l2d_l2b_decc_out_c7_8_scanin[3]=ff_l2d_l2b_decc_out_c7_4_scanout[3];
assign ff_l2d_l2b_decc_out_c7_10_scanin[3]=ff_l2d_l2b_decc_out_c7_8_scanout[3];
assign ff_l2d_l2b_decc_out_c7_14_scanin[3]=ff_l2d_l2b_decc_out_c7_10_scanout[3];
assign ff_l2d_l2b_decc_out_c7_12_scanin[3]=ff_l2d_l2b_decc_out_c7_14_scanout[3];
assign ff_l2d_l2b_decc_out_c7_16_scanin[3]=ff_l2d_l2b_decc_out_c7_12_scanout[3];
assign ff_l2d_l2b_decc_out_c7_2_scanin[4]=ff_l2d_l2b_decc_out_c7_16_scanout[3];
assign ff_l2d_l2b_decc_out_c7_6_scanin[4]=ff_l2d_l2b_decc_out_c7_2_scanout[4];
assign ff_l2d_l2b_decc_out_c7_4_scanin[4]=ff_l2d_l2b_decc_out_c7_6_scanout[4];
assign ff_l2d_l2b_decc_out_c7_8_scanin[4]=ff_l2d_l2b_decc_out_c7_4_scanout[4];
assign ff_l2d_l2b_decc_out_c7_10_scanin[4]=ff_l2d_l2b_decc_out_c7_8_scanout[4];
assign ff_l2d_l2b_decc_out_c7_14_scanin[4]=ff_l2d_l2b_decc_out_c7_10_scanout[4];
assign ff_l2d_l2b_decc_out_c7_12_scanin[4]=ff_l2d_l2b_decc_out_c7_14_scanout[4];
assign ff_l2d_l2b_decc_out_c7_16_scanin[4]=ff_l2d_l2b_decc_out_c7_12_scanout[4];
assign ff_l2d_l2b_decc_out_c7_2_scanin[5]=ff_l2d_l2b_decc_out_c7_16_scanout[4];
assign ff_l2d_l2b_decc_out_c7_6_scanin[5]=ff_l2d_l2b_decc_out_c7_2_scanout[5];
assign ff_l2d_l2b_decc_out_c7_4_scanin[5]=ff_l2d_l2b_decc_out_c7_6_scanout[5];
assign ff_l2d_l2b_decc_out_c7_8_scanin[5]=ff_l2d_l2b_decc_out_c7_4_scanout[5];
assign ff_l2d_l2b_decc_out_c7_10_scanin[5]=ff_l2d_l2b_decc_out_c7_8_scanout[5];
assign ff_l2d_l2b_decc_out_c7_14_scanin[5]=ff_l2d_l2b_decc_out_c7_10_scanout[5];
assign ff_l2d_l2b_decc_out_c7_12_scanin[5]=ff_l2d_l2b_decc_out_c7_14_scanout[5];
assign ff_l2d_l2b_decc_out_c7_16_scanin[5]=ff_l2d_l2b_decc_out_c7_12_scanout[5];
assign ff_l2d_l2b_decc_out_c7_2_scanin[6]=ff_l2d_l2b_decc_out_c7_16_scanout[5];
assign ff_l2d_l2b_decc_out_c7_6_scanin[6]=ff_l2d_l2b_decc_out_c7_2_scanout[6];
assign ff_l2d_l2b_decc_out_c7_4_scanin[6]=ff_l2d_l2b_decc_out_c7_6_scanout[6];
assign ff_l2d_l2b_decc_out_c7_8_scanin[6]=ff_l2d_l2b_decc_out_c7_4_scanout[6];
assign ff_l2d_l2b_decc_out_c7_10_scanin[6]=ff_l2d_l2b_decc_out_c7_8_scanout[6];
assign ff_l2d_l2b_decc_out_c7_14_scanin[6]=ff_l2d_l2b_decc_out_c7_10_scanout[6];
assign ff_l2d_l2b_decc_out_c7_12_scanin[6]=ff_l2d_l2b_decc_out_c7_14_scanout[6];
assign ff_l2d_l2b_decc_out_c7_16_scanin[6]=ff_l2d_l2b_decc_out_c7_12_scanout[6];
assign ff_l2d_l2b_decc_out_c7_2_scanin[7]=ff_l2d_l2b_decc_out_c7_16_scanout[6];
assign ff_l2d_l2b_decc_out_c7_6_scanin[7]=ff_l2d_l2b_decc_out_c7_2_scanout[7];
assign ff_l2d_l2b_decc_out_c7_4_scanin[7]=ff_l2d_l2b_decc_out_c7_6_scanout[7];
assign ff_l2d_l2b_decc_out_c7_8_scanin[7]=ff_l2d_l2b_decc_out_c7_4_scanout[7];
assign ff_l2d_l2b_decc_out_c7_10_scanin[7]=ff_l2d_l2b_decc_out_c7_8_scanout[7];
assign ff_l2d_l2b_decc_out_c7_14_scanin[7]=ff_l2d_l2b_decc_out_c7_10_scanout[7];
assign ff_l2d_l2b_decc_out_c7_12_scanin[7]=ff_l2d_l2b_decc_out_c7_14_scanout[7];
assign ff_l2d_l2b_decc_out_c7_16_scanin[7]=ff_l2d_l2b_decc_out_c7_12_scanout[7];
assign ff_l2d_l2b_decc_out_c7_2_scanin[8]=ff_l2d_l2b_decc_out_c7_16_scanout[7];
assign ff_l2d_l2b_decc_out_c7_6_scanin[8]=ff_l2d_l2b_decc_out_c7_2_scanout[8];
assign ff_l2d_l2b_decc_out_c7_4_scanin[8]=ff_l2d_l2b_decc_out_c7_6_scanout[8];
assign ff_l2d_l2b_decc_out_c7_8_scanin[8]=ff_l2d_l2b_decc_out_c7_4_scanout[8];
assign ff_l2d_l2b_decc_out_c7_10_scanin[8]=ff_l2d_l2b_decc_out_c7_8_scanout[8];
assign ff_l2d_l2b_decc_out_c7_14_scanin[8]=ff_l2d_l2b_decc_out_c7_10_scanout[8];
assign ff_l2d_l2b_decc_out_c7_12_scanin[8]=ff_l2d_l2b_decc_out_c7_14_scanout[8];
assign ff_l2d_l2b_decc_out_c7_16_scanin[8]=ff_l2d_l2b_decc_out_c7_12_scanout[8];
assign ff_l2d_l2b_decc_out_c7_2_scanin[9]=ff_l2d_l2b_decc_out_c7_16_scanout[8];
assign ff_l2d_l2b_decc_out_c7_6_scanin[9]=ff_l2d_l2b_decc_out_c7_2_scanout[9];
assign ff_l2d_l2b_decc_out_c7_4_scanin[9]=ff_l2d_l2b_decc_out_c7_6_scanout[9];
assign ff_l2d_l2b_decc_out_c7_8_scanin[9]=ff_l2d_l2b_decc_out_c7_4_scanout[9];
assign ff_l2d_l2b_decc_out_c7_10_scanin[9]=ff_l2d_l2b_decc_out_c7_8_scanout[9];
assign ff_l2d_l2b_decc_out_c7_14_scanin[9]=ff_l2d_l2b_decc_out_c7_10_scanout[9];
assign ff_l2d_l2b_decc_out_c7_12_scanin[9]=ff_l2d_l2b_decc_out_c7_14_scanout[9];
assign ff_l2d_l2b_decc_out_c7_16_scanin[9]=ff_l2d_l2b_decc_out_c7_12_scanout[9];
assign ff_l2d_l2b_decc_out_c7_2_scanin[10]=ff_l2d_l2b_decc_out_c7_16_scanout[9];
assign ff_l2d_l2b_decc_out_c7_6_scanin[10]=ff_l2d_l2b_decc_out_c7_2_scanout[10];
assign ff_l2d_l2b_decc_out_c7_4_scanin[10]=ff_l2d_l2b_decc_out_c7_6_scanout[10];
assign ff_l2d_l2b_decc_out_c7_8_scanin[10]=ff_l2d_l2b_decc_out_c7_4_scanout[10];
assign ff_l2d_l2b_decc_out_c7_10_scanin[10]=ff_l2d_l2b_decc_out_c7_8_scanout[10];
assign ff_l2d_l2b_decc_out_c7_14_scanin[10]=ff_l2d_l2b_decc_out_c7_10_scanout[10];
assign ff_l2d_l2b_decc_out_c7_12_scanin[10]=ff_l2d_l2b_decc_out_c7_14_scanout[10];
assign ff_l2d_l2b_decc_out_c7_16_scanin[10]=ff_l2d_l2b_decc_out_c7_12_scanout[10];
assign ff_l2d_l2b_decc_out_c7_2_scanin[11]=ff_l2d_l2b_decc_out_c7_16_scanout[10];
assign ff_l2d_l2b_decc_out_c7_6_scanin[11]=ff_l2d_l2b_decc_out_c7_2_scanout[11];
assign ff_l2d_l2b_decc_out_c7_4_scanin[11]=ff_l2d_l2b_decc_out_c7_6_scanout[11];
assign ff_l2d_l2b_decc_out_c7_8_scanin[11]=ff_l2d_l2b_decc_out_c7_4_scanout[11];
assign ff_l2d_l2b_decc_out_c7_10_scanin[11]=ff_l2d_l2b_decc_out_c7_8_scanout[11];
assign ff_l2d_l2b_decc_out_c7_14_scanin[11]=ff_l2d_l2b_decc_out_c7_10_scanout[11];
assign ff_l2d_l2b_decc_out_c7_12_scanin[11]=ff_l2d_l2b_decc_out_c7_14_scanout[11];
assign ff_l2d_l2b_decc_out_c7_16_scanin[11]=ff_l2d_l2b_decc_out_c7_12_scanout[11];
assign ff_l2d_l2b_decc_out_c7_2_scanin[12]=ff_l2d_l2b_decc_out_c7_16_scanout[11];
assign ff_l2d_l2b_decc_out_c7_6_scanin[12]=ff_l2d_l2b_decc_out_c7_2_scanout[12];
assign ff_l2d_l2b_decc_out_c7_4_scanin[12]=ff_l2d_l2b_decc_out_c7_6_scanout[12];
assign ff_l2d_l2b_decc_out_c7_8_scanin[12]=ff_l2d_l2b_decc_out_c7_4_scanout[12];
assign ff_l2d_l2b_decc_out_c7_10_scanin[12]=ff_l2d_l2b_decc_out_c7_8_scanout[12];
assign ff_l2d_l2b_decc_out_c7_14_scanin[12]=ff_l2d_l2b_decc_out_c7_10_scanout[12];
assign ff_l2d_l2b_decc_out_c7_12_scanin[12]=ff_l2d_l2b_decc_out_c7_14_scanout[12];
assign ff_l2d_l2b_decc_out_c7_16_scanin[12]=ff_l2d_l2b_decc_out_c7_12_scanout[12];
assign ff_l2d_l2b_decc_out_c7_2_scanin[13]=ff_l2d_l2b_decc_out_c7_16_scanout[12];
assign ff_l2d_l2b_decc_out_c7_6_scanin[13]=ff_l2d_l2b_decc_out_c7_2_scanout[13];
assign ff_l2d_l2b_decc_out_c7_4_scanin[13]=ff_l2d_l2b_decc_out_c7_6_scanout[13];
assign ff_l2d_l2b_decc_out_c7_8_scanin[13]=ff_l2d_l2b_decc_out_c7_4_scanout[13];
assign ff_l2d_l2b_decc_out_c7_10_scanin[13]=ff_l2d_l2b_decc_out_c7_8_scanout[13];
assign ff_l2d_l2b_decc_out_c7_14_scanin[13]=ff_l2d_l2b_decc_out_c7_10_scanout[13];
assign ff_l2d_l2b_decc_out_c7_12_scanin[13]=ff_l2d_l2b_decc_out_c7_14_scanout[13];
assign ff_l2d_l2b_decc_out_c7_16_scanin[13]=ff_l2d_l2b_decc_out_c7_12_scanout[13];
assign ff_l2d_l2b_decc_out_c7_2_scanin[14]=ff_l2d_l2b_decc_out_c7_16_scanout[13];
assign ff_l2d_l2b_decc_out_c7_6_scanin[14]=ff_l2d_l2b_decc_out_c7_2_scanout[14];
assign ff_l2d_l2b_decc_out_c7_4_scanin[14]=ff_l2d_l2b_decc_out_c7_6_scanout[14];
assign ff_l2d_l2b_decc_out_c7_8_scanin[14]=ff_l2d_l2b_decc_out_c7_4_scanout[14];
assign ff_l2d_l2b_decc_out_c7_10_scanin[14]=ff_l2d_l2b_decc_out_c7_8_scanout[14];
assign ff_l2d_l2b_decc_out_c7_14_scanin[14]=ff_l2d_l2b_decc_out_c7_10_scanout[14];
assign ff_l2d_l2b_decc_out_c7_12_scanin[14]=ff_l2d_l2b_decc_out_c7_14_scanout[14];
assign ff_l2d_l2b_decc_out_c7_16_scanin[14]=ff_l2d_l2b_decc_out_c7_12_scanout[14];
assign ff_l2d_l2b_decc_out_c7_2_scanin[15]=ff_l2d_l2b_decc_out_c7_16_scanout[14];
assign ff_l2d_l2b_decc_out_c7_6_scanin[15]=ff_l2d_l2b_decc_out_c7_2_scanout[15];
assign ff_l2d_l2b_decc_out_c7_4_scanin[15]=ff_l2d_l2b_decc_out_c7_6_scanout[15];
assign ff_l2d_l2b_decc_out_c7_8_scanin[15]=ff_l2d_l2b_decc_out_c7_4_scanout[15];
assign ff_l2d_l2b_decc_out_c7_10_scanin[15]=ff_l2d_l2b_decc_out_c7_8_scanout[15];
assign ff_l2d_l2b_decc_out_c7_14_scanin[15]=ff_l2d_l2b_decc_out_c7_10_scanout[15];
assign ff_l2d_l2b_decc_out_c7_12_scanin[15]=ff_l2d_l2b_decc_out_c7_14_scanout[15];
assign ff_l2d_l2b_decc_out_c7_16_scanin[15]=ff_l2d_l2b_decc_out_c7_12_scanout[15];
assign ff_l2d_l2b_decc_out_c7_2_scanin[16]=ff_l2d_l2b_decc_out_c7_16_scanout[15];
assign ff_l2d_l2b_decc_out_c7_6_scanin[16]=ff_l2d_l2b_decc_out_c7_2_scanout[16];
assign ff_l2d_l2b_decc_out_c7_4_scanin[16]=ff_l2d_l2b_decc_out_c7_6_scanout[16];
assign ff_l2d_l2b_decc_out_c7_8_scanin[16]=ff_l2d_l2b_decc_out_c7_4_scanout[16];
assign ff_l2d_l2b_decc_out_c7_10_scanin[16]=ff_l2d_l2b_decc_out_c7_8_scanout[16];
assign ff_l2d_l2b_decc_out_c7_14_scanin[16]=ff_l2d_l2b_decc_out_c7_10_scanout[16];
assign ff_l2d_l2b_decc_out_c7_12_scanin[16]=ff_l2d_l2b_decc_out_c7_14_scanout[16];
assign ff_l2d_l2b_decc_out_c7_16_scanin[16]=ff_l2d_l2b_decc_out_c7_12_scanout[16];
assign ff_l2d_l2b_decc_out_c7_2_scanin[17]=ff_l2d_l2b_decc_out_c7_16_scanout[16];
assign ff_l2d_l2b_decc_out_c7_6_scanin[17]=ff_l2d_l2b_decc_out_c7_2_scanout[17];
assign ff_l2d_l2b_decc_out_c7_4_scanin[17]=ff_l2d_l2b_decc_out_c7_6_scanout[17];
assign ff_l2d_l2b_decc_out_c7_8_scanin[17]=ff_l2d_l2b_decc_out_c7_4_scanout[17];
assign ff_l2d_l2b_decc_out_c7_10_scanin[17]=ff_l2d_l2b_decc_out_c7_8_scanout[17];
assign ff_l2d_l2b_decc_out_c7_14_scanin[17]=ff_l2d_l2b_decc_out_c7_10_scanout[17];
assign ff_l2d_l2b_decc_out_c7_12_scanin[17]=ff_l2d_l2b_decc_out_c7_14_scanout[17];
assign ff_l2d_l2b_decc_out_c7_16_scanin[17]=ff_l2d_l2b_decc_out_c7_12_scanout[17];
assign ff_l2d_l2b_decc_out_c7_2_scanin[18]=ff_l2d_l2b_decc_out_c7_16_scanout[17];
assign ff_l2d_l2b_decc_out_c7_6_scanin[18]=ff_l2d_l2b_decc_out_c7_2_scanout[18];
assign ff_l2d_l2b_decc_out_c7_4_scanin[18]=ff_l2d_l2b_decc_out_c7_6_scanout[18];
assign ff_l2d_l2b_decc_out_c7_8_scanin[18]=ff_l2d_l2b_decc_out_c7_4_scanout[18];
assign ff_l2d_l2b_decc_out_c7_10_scanin[18]=ff_l2d_l2b_decc_out_c7_8_scanout[18];
assign ff_l2d_l2b_decc_out_c7_14_scanin[18]=ff_l2d_l2b_decc_out_c7_10_scanout[18];
assign ff_l2d_l2b_decc_out_c7_12_scanin[18]=ff_l2d_l2b_decc_out_c7_14_scanout[18];
assign ff_l2d_l2b_decc_out_c7_16_scanin[18]=ff_l2d_l2b_decc_out_c7_12_scanout[18];
assign ff_l2d_l2b_decc_out_c7_2_scanin[19]=ff_l2d_l2b_decc_out_c7_16_scanout[18];
assign ff_l2d_l2b_decc_out_c7_6_scanin[19]=ff_l2d_l2b_decc_out_c7_2_scanout[19];
assign ff_l2d_l2b_decc_out_c7_4_scanin[19]=ff_l2d_l2b_decc_out_c7_6_scanout[19];
assign ff_l2d_l2b_decc_out_c7_8_scanin[19]=ff_l2d_l2b_decc_out_c7_4_scanout[19];
assign ff_l2d_l2b_decc_out_c7_10_scanin[19]=ff_l2d_l2b_decc_out_c7_8_scanout[19];
assign ff_l2d_l2b_decc_out_c7_14_scanin[19]=ff_l2d_l2b_decc_out_c7_10_scanout[19];
assign ff_l2d_l2b_decc_out_c7_12_scanin[19]=ff_l2d_l2b_decc_out_c7_14_scanout[19];
assign ff_l2d_l2b_decc_out_c7_16_scanin[19]=ff_l2d_l2b_decc_out_c7_12_scanout[19];
assign ff_l2d_l2b_decc_out_c7_2_scanin[20]=ff_l2d_l2b_decc_out_c7_16_scanout[19];
assign ff_l2d_l2b_decc_out_c7_6_scanin[20]=ff_l2d_l2b_decc_out_c7_2_scanout[20];
assign ff_l2d_l2b_decc_out_c7_4_scanin[20]=ff_l2d_l2b_decc_out_c7_6_scanout[20];
assign ff_l2d_l2b_decc_out_c7_8_scanin[20]=ff_l2d_l2b_decc_out_c7_4_scanout[20];
assign ff_l2d_l2b_decc_out_c7_10_scanin[20]=ff_l2d_l2b_decc_out_c7_8_scanout[20];
assign ff_l2d_l2b_decc_out_c7_14_scanin[20]=ff_l2d_l2b_decc_out_c7_10_scanout[20];
assign ff_l2d_l2b_decc_out_c7_12_scanin[20]=ff_l2d_l2b_decc_out_c7_14_scanout[20];
assign ff_l2d_l2b_decc_out_c7_16_scanin[20]=ff_l2d_l2b_decc_out_c7_12_scanout[20];
assign ff_l2d_l2b_decc_out_c7_2_scanin[21]=ff_l2d_l2b_decc_out_c7_16_scanout[20];
assign ff_l2d_l2b_decc_out_c7_6_scanin[21]=ff_l2d_l2b_decc_out_c7_2_scanout[21];
assign ff_l2d_l2b_decc_out_c7_4_scanin[21]=ff_l2d_l2b_decc_out_c7_6_scanout[21];
assign ff_l2d_l2b_decc_out_c7_8_scanin[21]=ff_l2d_l2b_decc_out_c7_4_scanout[21];
assign ff_l2d_l2b_decc_out_c7_10_scanin[21]=ff_l2d_l2b_decc_out_c7_8_scanout[21];
assign ff_l2d_l2b_decc_out_c7_14_scanin[21]=ff_l2d_l2b_decc_out_c7_10_scanout[21];
assign ff_l2d_l2b_decc_out_c7_12_scanin[21]=ff_l2d_l2b_decc_out_c7_14_scanout[21];
assign ff_l2d_l2b_decc_out_c7_16_scanin[21]=ff_l2d_l2b_decc_out_c7_12_scanout[21];
assign ff_l2d_l2b_decc_out_c7_2_scanin[22]=ff_l2d_l2b_decc_out_c7_16_scanout[21];
assign ff_l2d_l2b_decc_out_c7_6_scanin[22]=ff_l2d_l2b_decc_out_c7_2_scanout[22];
assign ff_l2d_l2b_decc_out_c7_4_scanin[22]=ff_l2d_l2b_decc_out_c7_6_scanout[22];
assign ff_l2d_l2b_decc_out_c7_8_scanin[22]=ff_l2d_l2b_decc_out_c7_4_scanout[22];
assign ff_l2d_l2b_decc_out_c7_10_scanin[22]=ff_l2d_l2b_decc_out_c7_8_scanout[22];
assign ff_l2d_l2b_decc_out_c7_14_scanin[22]=ff_l2d_l2b_decc_out_c7_10_scanout[22];
assign ff_l2d_l2b_decc_out_c7_12_scanin[22]=ff_l2d_l2b_decc_out_c7_14_scanout[22];
assign ff_l2d_l2b_decc_out_c7_16_scanin[22]=ff_l2d_l2b_decc_out_c7_12_scanout[22];
assign ff_l2d_l2b_decc_out_c7_2_scanin[23]=ff_l2d_l2b_decc_out_c7_16_scanout[22];
assign ff_l2d_l2b_decc_out_c7_6_scanin[23]=ff_l2d_l2b_decc_out_c7_2_scanout[23];
assign ff_l2d_l2b_decc_out_c7_4_scanin[23]=ff_l2d_l2b_decc_out_c7_6_scanout[23];
assign ff_l2d_l2b_decc_out_c7_8_scanin[23]=ff_l2d_l2b_decc_out_c7_4_scanout[23];
assign ff_l2d_l2b_decc_out_c7_10_scanin[23]=ff_l2d_l2b_decc_out_c7_8_scanout[23];
assign ff_l2d_l2b_decc_out_c7_14_scanin[23]=ff_l2d_l2b_decc_out_c7_10_scanout[23];
assign ff_l2d_l2b_decc_out_c7_12_scanin[23]=ff_l2d_l2b_decc_out_c7_14_scanout[23];
assign ff_l2d_l2b_decc_out_c7_16_scanin[23]=ff_l2d_l2b_decc_out_c7_12_scanout[23];
assign ff_l2d_l2b_decc_out_c7_2_scanin[24]=ff_l2d_l2b_decc_out_c7_16_scanout[23];
assign ff_l2d_l2b_decc_out_c7_6_scanin[24]=ff_l2d_l2b_decc_out_c7_2_scanout[24];
assign ff_l2d_l2b_decc_out_c7_4_scanin[24]=ff_l2d_l2b_decc_out_c7_6_scanout[24];
assign ff_l2d_l2b_decc_out_c7_8_scanin[24]=ff_l2d_l2b_decc_out_c7_4_scanout[24];
assign ff_l2d_l2b_decc_out_c7_10_scanin[24]=ff_l2d_l2b_decc_out_c7_8_scanout[24];
assign ff_l2d_l2b_decc_out_c7_14_scanin[24]=ff_l2d_l2b_decc_out_c7_10_scanout[24];
assign ff_l2d_l2b_decc_out_c7_12_scanin[24]=ff_l2d_l2b_decc_out_c7_14_scanout[24];
assign ff_l2d_l2b_decc_out_c7_16_scanin[24]=ff_l2d_l2b_decc_out_c7_12_scanout[24];
assign ff_l2d_l2b_decc_out_c7_2_scanin[25]=ff_l2d_l2b_decc_out_c7_16_scanout[24];
assign ff_l2d_l2b_decc_out_c7_6_scanin[25]=ff_l2d_l2b_decc_out_c7_2_scanout[25];
assign ff_l2d_l2b_decc_out_c7_4_scanin[25]=ff_l2d_l2b_decc_out_c7_6_scanout[25];
assign ff_l2d_l2b_decc_out_c7_8_scanin[25]=ff_l2d_l2b_decc_out_c7_4_scanout[25];
assign ff_l2d_l2b_decc_out_c7_10_scanin[25]=ff_l2d_l2b_decc_out_c7_8_scanout[25];
assign ff_l2d_l2b_decc_out_c7_14_scanin[25]=ff_l2d_l2b_decc_out_c7_10_scanout[25];
assign ff_l2d_l2b_decc_out_c7_12_scanin[25]=ff_l2d_l2b_decc_out_c7_14_scanout[25];
assign ff_l2d_l2b_decc_out_c7_16_scanin[25]=ff_l2d_l2b_decc_out_c7_12_scanout[25];
assign ff_l2d_l2b_decc_out_c7_2_scanin[26]=ff_l2d_l2b_decc_out_c7_16_scanout[25];
assign ff_l2d_l2b_decc_out_c7_6_scanin[26]=ff_l2d_l2b_decc_out_c7_2_scanout[26];
assign ff_l2d_l2b_decc_out_c7_4_scanin[26]=ff_l2d_l2b_decc_out_c7_6_scanout[26];
assign ff_l2d_l2b_decc_out_c7_8_scanin[26]=ff_l2d_l2b_decc_out_c7_4_scanout[26];
assign ff_l2d_l2b_decc_out_c7_10_scanin[26]=ff_l2d_l2b_decc_out_c7_8_scanout[26];
assign ff_l2d_l2b_decc_out_c7_14_scanin[26]=ff_l2d_l2b_decc_out_c7_10_scanout[26];
assign ff_l2d_l2b_decc_out_c7_12_scanin[26]=ff_l2d_l2b_decc_out_c7_14_scanout[26];
assign ff_l2d_l2b_decc_out_c7_16_scanin[26]=ff_l2d_l2b_decc_out_c7_12_scanout[26];
assign ff_l2d_l2b_decc_out_c7_2_scanin[27]=ff_l2d_l2b_decc_out_c7_16_scanout[26];
assign ff_l2d_l2b_decc_out_c7_6_scanin[27]=ff_l2d_l2b_decc_out_c7_2_scanout[27];
assign ff_l2d_l2b_decc_out_c7_4_scanin[27]=ff_l2d_l2b_decc_out_c7_6_scanout[27];
assign ff_l2d_l2b_decc_out_c7_8_scanin[27]=ff_l2d_l2b_decc_out_c7_4_scanout[27];
assign ff_l2d_l2b_decc_out_c7_10_scanin[27]=ff_l2d_l2b_decc_out_c7_8_scanout[27];
assign ff_l2d_l2b_decc_out_c7_14_scanin[27]=ff_l2d_l2b_decc_out_c7_10_scanout[27];
assign ff_l2d_l2b_decc_out_c7_12_scanin[27]=ff_l2d_l2b_decc_out_c7_14_scanout[27];
assign ff_l2d_l2b_decc_out_c7_16_scanin[27]=ff_l2d_l2b_decc_out_c7_12_scanout[27];
assign ff_l2d_l2b_decc_out_c7_2_scanin[28]=ff_l2d_l2b_decc_out_c7_16_scanout[27];
assign ff_l2d_l2b_decc_out_c7_6_scanin[28]=ff_l2d_l2b_decc_out_c7_2_scanout[28];
assign ff_l2d_l2b_decc_out_c7_4_scanin[28]=ff_l2d_l2b_decc_out_c7_6_scanout[28];
assign ff_l2d_l2b_decc_out_c7_8_scanin[28]=ff_l2d_l2b_decc_out_c7_4_scanout[28];
assign ff_l2d_l2b_decc_out_c7_10_scanin[28]=ff_l2d_l2b_decc_out_c7_8_scanout[28];
assign ff_l2d_l2b_decc_out_c7_14_scanin[28]=ff_l2d_l2b_decc_out_c7_10_scanout[28];
assign ff_l2d_l2b_decc_out_c7_12_scanin[28]=ff_l2d_l2b_decc_out_c7_14_scanout[28];
assign ff_l2d_l2b_decc_out_c7_16_scanin[28]=ff_l2d_l2b_decc_out_c7_12_scanout[28];
assign ff_l2d_l2b_decc_out_c7_2_scanin[29]=ff_l2d_l2b_decc_out_c7_16_scanout[28];
assign ff_l2d_l2b_decc_out_c7_6_scanin[29]=ff_l2d_l2b_decc_out_c7_2_scanout[29];
assign ff_l2d_l2b_decc_out_c7_4_scanin[29]=ff_l2d_l2b_decc_out_c7_6_scanout[29];
assign ff_l2d_l2b_decc_out_c7_8_scanin[29]=ff_l2d_l2b_decc_out_c7_4_scanout[29];
assign ff_l2d_l2b_decc_out_c7_10_scanin[29]=ff_l2d_l2b_decc_out_c7_8_scanout[29];
assign ff_l2d_l2b_decc_out_c7_14_scanin[29]=ff_l2d_l2b_decc_out_c7_10_scanout[29];
assign ff_l2d_l2b_decc_out_c7_12_scanin[29]=ff_l2d_l2b_decc_out_c7_14_scanout[29];
assign ff_l2d_l2b_decc_out_c7_16_scanin[29]=ff_l2d_l2b_decc_out_c7_12_scanout[29];
assign ff_l2d_l2b_decc_out_c7_2_scanin[30]=ff_l2d_l2b_decc_out_c7_16_scanout[29];
assign ff_l2d_l2b_decc_out_c7_6_scanin[30]=ff_l2d_l2b_decc_out_c7_2_scanout[30];
assign ff_l2d_l2b_decc_out_c7_4_scanin[30]=ff_l2d_l2b_decc_out_c7_6_scanout[30];
assign ff_l2d_l2b_decc_out_c7_8_scanin[30]=ff_l2d_l2b_decc_out_c7_4_scanout[30];
assign ff_l2d_l2b_decc_out_c7_10_scanin[30]=ff_l2d_l2b_decc_out_c7_8_scanout[30];
assign ff_l2d_l2b_decc_out_c7_14_scanin[30]=ff_l2d_l2b_decc_out_c7_10_scanout[30];
assign ff_l2d_l2b_decc_out_c7_12_scanin[30]=ff_l2d_l2b_decc_out_c7_14_scanout[30];
assign ff_l2d_l2b_decc_out_c7_16_scanin[30]=ff_l2d_l2b_decc_out_c7_12_scanout[30];
assign ff_l2d_l2b_decc_out_c7_2_scanin[31]=ff_l2d_l2b_decc_out_c7_16_scanout[30];
assign ff_l2d_l2b_decc_out_c7_6_scanin[31]=ff_l2d_l2b_decc_out_c7_2_scanout[31];
assign ff_l2d_l2b_decc_out_c7_4_scanin[31]=ff_l2d_l2b_decc_out_c7_6_scanout[31];
assign ff_l2d_l2b_decc_out_c7_8_scanin[31]=ff_l2d_l2b_decc_out_c7_4_scanout[31];
assign ff_l2d_l2b_decc_out_c7_10_scanin[31]=ff_l2d_l2b_decc_out_c7_8_scanout[31];
assign ff_l2d_l2b_decc_out_c7_14_scanin[31]=ff_l2d_l2b_decc_out_c7_10_scanout[31];
assign ff_l2d_l2b_decc_out_c7_12_scanin[31]=ff_l2d_l2b_decc_out_c7_14_scanout[31];
assign ff_l2d_l2b_decc_out_c7_16_scanin[31]=ff_l2d_l2b_decc_out_c7_12_scanout[31];
assign ff_l2d_l2b_decc_out_c7_2_scanin[32]=ff_l2d_l2b_decc_out_c7_16_scanout[31];
assign ff_l2d_l2b_decc_out_c7_6_scanin[32]=ff_l2d_l2b_decc_out_c7_2_scanout[32];
assign ff_l2d_l2b_decc_out_c7_4_scanin[32]=ff_l2d_l2b_decc_out_c7_6_scanout[32];
assign ff_l2d_l2b_decc_out_c7_8_scanin[32]=ff_l2d_l2b_decc_out_c7_4_scanout[32];
assign ff_l2d_l2b_decc_out_c7_10_scanin[32]=ff_l2d_l2b_decc_out_c7_8_scanout[32];
assign ff_l2d_l2b_decc_out_c7_14_scanin[32]=ff_l2d_l2b_decc_out_c7_10_scanout[32];
assign ff_l2d_l2b_decc_out_c7_12_scanin[32]=ff_l2d_l2b_decc_out_c7_14_scanout[32];
assign ff_l2d_l2b_decc_out_c7_16_scanin[32]=ff_l2d_l2b_decc_out_c7_12_scanout[32];
assign ff_l2d_l2b_decc_out_c7_2_scanin[33]=ff_l2d_l2b_decc_out_c7_16_scanout[32];
assign ff_l2d_l2b_decc_out_c7_6_scanin[33]=ff_l2d_l2b_decc_out_c7_2_scanout[33];
assign ff_l2d_l2b_decc_out_c7_4_scanin[33]=ff_l2d_l2b_decc_out_c7_6_scanout[33];
assign ff_l2d_l2b_decc_out_c7_8_scanin[33]=ff_l2d_l2b_decc_out_c7_4_scanout[33];
assign ff_l2d_l2b_decc_out_c7_10_scanin[33]=ff_l2d_l2b_decc_out_c7_8_scanout[33];
assign ff_l2d_l2b_decc_out_c7_14_scanin[33]=ff_l2d_l2b_decc_out_c7_10_scanout[33];
assign ff_l2d_l2b_decc_out_c7_12_scanin[33]=ff_l2d_l2b_decc_out_c7_14_scanout[33];
assign ff_l2d_l2b_decc_out_c7_16_scanin[33]=ff_l2d_l2b_decc_out_c7_12_scanout[33];
assign ff_l2d_l2b_decc_out_c7_2_scanin[34]=ff_l2d_l2b_decc_out_c7_16_scanout[33];
assign ff_l2d_l2b_decc_out_c7_6_scanin[34]=ff_l2d_l2b_decc_out_c7_2_scanout[34];
assign ff_l2d_l2b_decc_out_c7_4_scanin[34]=ff_l2d_l2b_decc_out_c7_6_scanout[34];
assign ff_l2d_l2b_decc_out_c7_8_scanin[34]=ff_l2d_l2b_decc_out_c7_4_scanout[34];
assign ff_l2d_l2b_decc_out_c7_10_scanin[34]=ff_l2d_l2b_decc_out_c7_8_scanout[34];
assign ff_l2d_l2b_decc_out_c7_14_scanin[34]=ff_l2d_l2b_decc_out_c7_10_scanout[34];
assign ff_l2d_l2b_decc_out_c7_12_scanin[34]=ff_l2d_l2b_decc_out_c7_14_scanout[34];
assign ff_l2d_l2b_decc_out_c7_16_scanin[34]=ff_l2d_l2b_decc_out_c7_12_scanout[34];
assign ff_l2d_l2b_decc_out_c7_2_scanin[35]=ff_l2d_l2b_decc_out_c7_16_scanout[34];
assign ff_l2d_l2b_decc_out_c7_6_scanin[35]=ff_l2d_l2b_decc_out_c7_2_scanout[35];
assign ff_l2d_l2b_decc_out_c7_4_scanin[35]=ff_l2d_l2b_decc_out_c7_6_scanout[35];
assign ff_l2d_l2b_decc_out_c7_8_scanin[35]=ff_l2d_l2b_decc_out_c7_4_scanout[35];
assign ff_l2d_l2b_decc_out_c7_10_scanin[35]=ff_l2d_l2b_decc_out_c7_8_scanout[35];
assign ff_l2d_l2b_decc_out_c7_14_scanin[35]=ff_l2d_l2b_decc_out_c7_10_scanout[35];
assign ff_l2d_l2b_decc_out_c7_12_scanin[35]=ff_l2d_l2b_decc_out_c7_14_scanout[35];
assign ff_l2d_l2b_decc_out_c7_16_scanin[35]=ff_l2d_l2b_decc_out_c7_12_scanout[35];
assign ff_l2d_l2b_decc_out_c7_2_scanin[36]=ff_l2d_l2b_decc_out_c7_16_scanout[35];
assign ff_l2d_l2b_decc_out_c7_6_scanin[36]=ff_l2d_l2b_decc_out_c7_2_scanout[36];
assign ff_l2d_l2b_decc_out_c7_4_scanin[36]=ff_l2d_l2b_decc_out_c7_6_scanout[36];
assign ff_l2d_l2b_decc_out_c7_8_scanin[36]=ff_l2d_l2b_decc_out_c7_4_scanout[36];
assign ff_l2d_l2b_decc_out_c7_10_scanin[36]=ff_l2d_l2b_decc_out_c7_8_scanout[36];
assign ff_l2d_l2b_decc_out_c7_14_scanin[36]=ff_l2d_l2b_decc_out_c7_10_scanout[36];
assign ff_l2d_l2b_decc_out_c7_12_scanin[36]=ff_l2d_l2b_decc_out_c7_14_scanout[36];
assign ff_l2d_l2b_decc_out_c7_16_scanin[36]=ff_l2d_l2b_decc_out_c7_12_scanout[36];
assign ff_l2d_l2b_decc_out_c7_2_scanin[37]=ff_l2d_l2b_decc_out_c7_16_scanout[36];
assign ff_l2d_l2b_decc_out_c7_6_scanin[37]=ff_l2d_l2b_decc_out_c7_2_scanout[37];
assign ff_l2d_l2b_decc_out_c7_4_scanin[37]=ff_l2d_l2b_decc_out_c7_6_scanout[37];
assign ff_l2d_l2b_decc_out_c7_8_scanin[37]=ff_l2d_l2b_decc_out_c7_4_scanout[37];
assign ff_l2d_l2b_decc_out_c7_10_scanin[37]=ff_l2d_l2b_decc_out_c7_8_scanout[37];
assign ff_l2d_l2b_decc_out_c7_14_scanin[37]=ff_l2d_l2b_decc_out_c7_10_scanout[37];
assign ff_l2d_l2b_decc_out_c7_12_scanin[37]=ff_l2d_l2b_decc_out_c7_14_scanout[37];
assign ff_l2d_l2b_decc_out_c7_16_scanin[37]=ff_l2d_l2b_decc_out_c7_12_scanout[37];
assign ff_l2d_l2b_decc_out_c7_2_scanin[38]=ff_l2d_l2b_decc_out_c7_16_scanout[37];
assign ff_l2d_l2b_decc_out_c7_6_scanin[38]=ff_l2d_l2b_decc_out_c7_2_scanout[38];
assign ff_l2d_l2b_decc_out_c7_4_scanin[38]=ff_l2d_l2b_decc_out_c7_6_scanout[38];
assign ff_l2d_l2b_decc_out_c7_8_scanin[38]=ff_l2d_l2b_decc_out_c7_4_scanout[38];
assign ff_l2d_l2b_decc_out_c7_10_scanin[38]=ff_l2d_l2b_decc_out_c7_8_scanout[38];
assign ff_l2d_l2b_decc_out_c7_14_scanin[38]=ff_l2d_l2b_decc_out_c7_10_scanout[38];
assign ff_l2d_l2b_decc_out_c7_12_scanin[38]=ff_l2d_l2b_decc_out_c7_14_scanout[38];
assign ff_l2d_l2b_decc_out_c7_16_scanin[38]=ff_l2d_l2b_decc_out_c7_12_scanout[38];
assign ff_l2d_l2t_decc_c6_scanin[0]=ff_l2d_l2b_decc_out_c7_16_scanout[38];
assign ff_l2d_l2t_decc_c6_scanin[78]=ff_l2d_l2t_decc_c6_scanout[0];
assign ff_l2d_l2t_decc_c6_scanin[1]=ff_l2d_l2t_decc_c6_scanout[78];
assign ff_l2d_l2t_decc_c6_scanin[79]=ff_l2d_l2t_decc_c6_scanout[1];
assign ff_l2d_l2t_decc_c6_scanin[2]=ff_l2d_l2t_decc_c6_scanout[79];
assign ff_l2d_l2t_decc_c6_scanin[80]=ff_l2d_l2t_decc_c6_scanout[2];
assign ff_l2d_l2t_decc_c6_scanin[3]=ff_l2d_l2t_decc_c6_scanout[80];
assign ff_l2d_l2t_decc_c6_scanin[81]=ff_l2d_l2t_decc_c6_scanout[3];
assign ff_l2d_l2t_decc_c6_scanin[4]=ff_l2d_l2t_decc_c6_scanout[81];
assign ff_l2d_l2t_decc_c6_scanin[82]=ff_l2d_l2t_decc_c6_scanout[4];
assign ff_l2d_l2t_decc_c6_scanin[5]=ff_l2d_l2t_decc_c6_scanout[82];
assign ff_l2d_l2t_decc_c6_scanin[83]=ff_l2d_l2t_decc_c6_scanout[5];
assign ff_l2d_l2t_decc_c6_scanin[6]=ff_l2d_l2t_decc_c6_scanout[83];
assign ff_l2d_l2t_decc_c6_scanin[84]=ff_l2d_l2t_decc_c6_scanout[6];
assign ff_l2d_l2t_decc_c6_scanin[7]=ff_l2d_l2t_decc_c6_scanout[84];
assign ff_l2d_l2t_decc_c6_scanin[85]=ff_l2d_l2t_decc_c6_scanout[7];
assign ff_l2d_l2t_decc_c6_scanin[8]=ff_l2d_l2t_decc_c6_scanout[85];
assign ff_l2d_l2t_decc_c6_scanin[86]=ff_l2d_l2t_decc_c6_scanout[8];
assign ff_l2d_l2t_decc_c6_scanin[9]=ff_l2d_l2t_decc_c6_scanout[86];
assign ff_l2d_l2t_decc_c6_scanin[87]=ff_l2d_l2t_decc_c6_scanout[9];
assign ff_l2d_l2t_decc_c6_scanin[10]=ff_l2d_l2t_decc_c6_scanout[87];
assign ff_l2d_l2t_decc_c6_scanin[88]=ff_l2d_l2t_decc_c6_scanout[10];
assign ff_l2d_l2t_decc_c6_scanin[11]=ff_l2d_l2t_decc_c6_scanout[88];
assign ff_l2d_l2t_decc_c6_scanin[89]=ff_l2d_l2t_decc_c6_scanout[11];
assign ff_l2d_l2t_decc_c6_scanin[12]=ff_l2d_l2t_decc_c6_scanout[89];
assign ff_l2d_l2t_decc_c6_scanin[90]=ff_l2d_l2t_decc_c6_scanout[12];
assign ff_l2d_l2t_decc_c6_scanin[13]=ff_l2d_l2t_decc_c6_scanout[90];
assign ff_l2d_l2t_decc_c6_scanin[91]=ff_l2d_l2t_decc_c6_scanout[13];
assign ff_l2d_l2t_decc_c6_scanin[14]=ff_l2d_l2t_decc_c6_scanout[91];
assign ff_l2d_l2t_decc_c6_scanin[92]=ff_l2d_l2t_decc_c6_scanout[14];
assign ff_l2d_l2t_decc_c6_scanin[15]=ff_l2d_l2t_decc_c6_scanout[92];
assign ff_l2d_l2t_decc_c6_scanin[93]=ff_l2d_l2t_decc_c6_scanout[15];
assign ff_l2d_l2t_decc_c6_scanin[16]=ff_l2d_l2t_decc_c6_scanout[93];
assign ff_l2d_l2t_decc_c6_scanin[94]=ff_l2d_l2t_decc_c6_scanout[16];
assign ff_l2d_l2t_decc_c6_scanin[17]=ff_l2d_l2t_decc_c6_scanout[94];
assign ff_l2d_l2t_decc_c6_scanin[95]=ff_l2d_l2t_decc_c6_scanout[17];
assign ff_l2d_l2t_decc_c6_scanin[18]=ff_l2d_l2t_decc_c6_scanout[95];
assign ff_l2d_l2t_decc_c6_scanin[96]=ff_l2d_l2t_decc_c6_scanout[18];
assign ff_l2d_l2t_decc_c6_scanin[19]=ff_l2d_l2t_decc_c6_scanout[96];
assign ff_l2d_l2t_decc_c6_scanin[97]=ff_l2d_l2t_decc_c6_scanout[19];
assign ff_l2d_l2t_decc_c6_scanin[20]=ff_l2d_l2t_decc_c6_scanout[97];
assign ff_l2d_l2t_decc_c6_scanin[98]=ff_l2d_l2t_decc_c6_scanout[20];
assign ff_l2d_l2t_decc_c6_scanin[21]=ff_l2d_l2t_decc_c6_scanout[98];
assign ff_l2d_l2t_decc_c6_scanin[99]=ff_l2d_l2t_decc_c6_scanout[21];
assign ff_l2d_l2t_decc_c6_scanin[22]=ff_l2d_l2t_decc_c6_scanout[99];
assign ff_l2d_l2t_decc_c6_scanin[100]=ff_l2d_l2t_decc_c6_scanout[22];
assign ff_l2d_l2t_decc_c6_scanin[23]=ff_l2d_l2t_decc_c6_scanout[100];
assign ff_l2d_l2t_decc_c6_scanin[101]=ff_l2d_l2t_decc_c6_scanout[23];
assign ff_l2d_l2t_decc_c6_scanin[24]=ff_l2d_l2t_decc_c6_scanout[101];
assign ff_l2d_l2t_decc_c6_scanin[102]=ff_l2d_l2t_decc_c6_scanout[24];
assign ff_l2d_l2t_decc_c6_scanin[25]=ff_l2d_l2t_decc_c6_scanout[102];
assign ff_l2d_l2t_decc_c6_scanin[103]=ff_l2d_l2t_decc_c6_scanout[25];
assign ff_l2d_l2t_decc_c6_scanin[26]=ff_l2d_l2t_decc_c6_scanout[103];
assign ff_l2d_l2t_decc_c6_scanin[104]=ff_l2d_l2t_decc_c6_scanout[26];
assign ff_l2d_l2t_decc_c6_scanin[27]=ff_l2d_l2t_decc_c6_scanout[104];
assign ff_l2d_l2t_decc_c6_scanin[105]=ff_l2d_l2t_decc_c6_scanout[27];
assign ff_l2d_l2t_decc_c6_scanin[28]=ff_l2d_l2t_decc_c6_scanout[105];
assign ff_l2d_l2t_decc_c6_scanin[106]=ff_l2d_l2t_decc_c6_scanout[28];
assign ff_l2d_l2t_decc_c6_scanin[29]=ff_l2d_l2t_decc_c6_scanout[106];
assign ff_l2d_l2t_decc_c6_scanin[107]=ff_l2d_l2t_decc_c6_scanout[29];
assign ff_l2d_l2t_decc_c6_scanin[30]=ff_l2d_l2t_decc_c6_scanout[107];
assign ff_l2d_l2t_decc_c6_scanin[108]=ff_l2d_l2t_decc_c6_scanout[30];
assign ff_l2d_l2t_decc_c6_scanin[31]=ff_l2d_l2t_decc_c6_scanout[108];
assign ff_l2d_l2t_decc_c6_scanin[109]=ff_l2d_l2t_decc_c6_scanout[31];
assign ff_l2d_l2t_decc_c6_scanin[32]=ff_l2d_l2t_decc_c6_scanout[109];
assign ff_l2d_l2t_decc_c6_scanin[110]=ff_l2d_l2t_decc_c6_scanout[32];
assign ff_l2d_l2t_decc_c6_scanin[33]=ff_l2d_l2t_decc_c6_scanout[110];
assign ff_l2d_l2t_decc_c6_scanin[111]=ff_l2d_l2t_decc_c6_scanout[33];
assign ff_l2d_l2t_decc_c6_scanin[34]=ff_l2d_l2t_decc_c6_scanout[111];
assign ff_l2d_l2t_decc_c6_scanin[112]=ff_l2d_l2t_decc_c6_scanout[34];
assign ff_l2d_l2t_decc_c6_scanin[35]=ff_l2d_l2t_decc_c6_scanout[112];
assign ff_l2d_l2t_decc_c6_scanin[113]=ff_l2d_l2t_decc_c6_scanout[35];
assign ff_l2d_l2t_decc_c6_scanin[36]=ff_l2d_l2t_decc_c6_scanout[113];
assign ff_l2d_l2t_decc_c6_scanin[114]=ff_l2d_l2t_decc_c6_scanout[36];
assign ff_l2d_l2t_decc_c6_scanin[37]=ff_l2d_l2t_decc_c6_scanout[114];
assign ff_l2d_l2t_decc_c6_scanin[115]=ff_l2d_l2t_decc_c6_scanout[37];
assign ff_l2d_l2t_decc_c6_scanin[38]=ff_l2d_l2t_decc_c6_scanout[115];
assign ff_l2d_l2t_decc_c6_scanin[116]=ff_l2d_l2t_decc_c6_scanout[38];
assign ff_l2d_l2t_decc_c6_scanin[39]=ff_l2d_l2t_decc_c6_scanout[116];
assign ff_l2d_l2t_decc_c6_scanin[117]=ff_l2d_l2t_decc_c6_scanout[39];
assign ff_l2d_l2t_decc_c6_scanin[40]=ff_l2d_l2t_decc_c6_scanout[117];
assign ff_l2d_l2t_decc_c6_scanin[118]=ff_l2d_l2t_decc_c6_scanout[40];
assign ff_l2d_l2t_decc_c6_scanin[41]=ff_l2d_l2t_decc_c6_scanout[118];
assign ff_l2d_l2t_decc_c6_scanin[119]=ff_l2d_l2t_decc_c6_scanout[41];
assign ff_l2d_l2t_decc_c6_scanin[42]=ff_l2d_l2t_decc_c6_scanout[119];
assign ff_l2d_l2t_decc_c6_scanin[120]=ff_l2d_l2t_decc_c6_scanout[42];
assign ff_l2d_l2t_decc_c6_scanin[43]=ff_l2d_l2t_decc_c6_scanout[120];
assign ff_l2d_l2t_decc_c6_scanin[121]=ff_l2d_l2t_decc_c6_scanout[43];
assign ff_l2d_l2t_decc_c6_scanin[44]=ff_l2d_l2t_decc_c6_scanout[121];
assign ff_l2d_l2t_decc_c6_scanin[122]=ff_l2d_l2t_decc_c6_scanout[44];
assign ff_l2d_l2t_decc_c6_scanin[45]=ff_l2d_l2t_decc_c6_scanout[122];
assign ff_l2d_l2t_decc_c6_scanin[123]=ff_l2d_l2t_decc_c6_scanout[45];
assign ff_l2d_l2t_decc_c6_scanin[46]=ff_l2d_l2t_decc_c6_scanout[123];
assign ff_l2d_l2t_decc_c6_scanin[124]=ff_l2d_l2t_decc_c6_scanout[46];
assign ff_l2d_l2t_decc_c6_scanin[47]=ff_l2d_l2t_decc_c6_scanout[124];
assign ff_l2d_l2t_decc_c6_scanin[125]=ff_l2d_l2t_decc_c6_scanout[47];
assign ff_l2d_l2t_decc_c6_scanin[48]=ff_l2d_l2t_decc_c6_scanout[125];
assign ff_l2d_l2t_decc_c6_scanin[126]=ff_l2d_l2t_decc_c6_scanout[48];
assign ff_l2d_l2t_decc_c6_scanin[49]=ff_l2d_l2t_decc_c6_scanout[126];
assign ff_l2d_l2t_decc_c6_scanin[127]=ff_l2d_l2t_decc_c6_scanout[49];
assign ff_l2d_l2t_decc_c6_scanin[50]=ff_l2d_l2t_decc_c6_scanout[127];
assign ff_l2d_l2t_decc_c6_scanin[128]=ff_l2d_l2t_decc_c6_scanout[50];
assign ff_l2d_l2t_decc_c6_scanin[51]=ff_l2d_l2t_decc_c6_scanout[128];
assign ff_l2d_l2t_decc_c6_scanin[129]=ff_l2d_l2t_decc_c6_scanout[51];
assign ff_l2d_l2t_decc_c6_scanin[52]=ff_l2d_l2t_decc_c6_scanout[129];
assign ff_l2d_l2t_decc_c6_scanin[130]=ff_l2d_l2t_decc_c6_scanout[52];
assign ff_l2d_l2t_decc_c6_scanin[53]=ff_l2d_l2t_decc_c6_scanout[130];
assign ff_l2d_l2t_decc_c6_scanin[131]=ff_l2d_l2t_decc_c6_scanout[53];
assign ff_l2d_l2t_decc_c6_scanin[54]=ff_l2d_l2t_decc_c6_scanout[131];
assign ff_l2d_l2t_decc_c6_scanin[132]=ff_l2d_l2t_decc_c6_scanout[54];
assign ff_l2d_l2t_decc_c6_scanin[55]=ff_l2d_l2t_decc_c6_scanout[132];
assign ff_l2d_l2t_decc_c6_scanin[133]=ff_l2d_l2t_decc_c6_scanout[55];
assign ff_l2d_l2t_decc_c6_scanin[56]=ff_l2d_l2t_decc_c6_scanout[133];
assign ff_l2d_l2t_decc_c6_scanin[134]=ff_l2d_l2t_decc_c6_scanout[56];
assign ff_l2d_l2t_decc_c6_scanin[57]=ff_l2d_l2t_decc_c6_scanout[134];
assign ff_l2d_l2t_decc_c6_scanin[135]=ff_l2d_l2t_decc_c6_scanout[57];
assign ff_l2d_l2t_decc_c6_scanin[58]=ff_l2d_l2t_decc_c6_scanout[135];
assign ff_l2d_l2t_decc_c6_scanin[136]=ff_l2d_l2t_decc_c6_scanout[58];
assign ff_l2d_l2t_decc_c6_scanin[59]=ff_l2d_l2t_decc_c6_scanout[136];
assign ff_l2d_l2t_decc_c6_scanin[137]=ff_l2d_l2t_decc_c6_scanout[59];
assign ff_l2d_l2t_decc_c6_scanin[60]=ff_l2d_l2t_decc_c6_scanout[137];
assign ff_l2d_l2t_decc_c6_scanin[138]=ff_l2d_l2t_decc_c6_scanout[60];
assign ff_l2d_l2t_decc_c6_scanin[61]=ff_l2d_l2t_decc_c6_scanout[138];
assign ff_l2d_l2t_decc_c6_scanin[139]=ff_l2d_l2t_decc_c6_scanout[61];
assign ff_l2d_l2t_decc_c6_scanin[62]=ff_l2d_l2t_decc_c6_scanout[139];
assign ff_l2d_l2t_decc_c6_scanin[140]=ff_l2d_l2t_decc_c6_scanout[62];
assign ff_l2d_l2t_decc_c6_scanin[63]=ff_l2d_l2t_decc_c6_scanout[140];
assign ff_l2d_l2t_decc_c6_scanin[141]=ff_l2d_l2t_decc_c6_scanout[63];
assign ff_l2d_l2t_decc_c6_scanin[64]=ff_l2d_l2t_decc_c6_scanout[141];
assign ff_l2d_l2t_decc_c6_scanin[142]=ff_l2d_l2t_decc_c6_scanout[64];
assign ff_l2d_l2t_decc_c6_scanin[65]=ff_l2d_l2t_decc_c6_scanout[142];
assign ff_l2d_l2t_decc_c6_scanin[143]=ff_l2d_l2t_decc_c6_scanout[65];
assign ff_l2d_l2t_decc_c6_scanin[66]=ff_l2d_l2t_decc_c6_scanout[143];
assign ff_l2d_l2t_decc_c6_scanin[144]=ff_l2d_l2t_decc_c6_scanout[66];
assign ff_l2d_l2t_decc_c6_scanin[67]=ff_l2d_l2t_decc_c6_scanout[144];
assign ff_l2d_l2t_decc_c6_scanin[145]=ff_l2d_l2t_decc_c6_scanout[67];
assign ff_l2d_l2t_decc_c6_scanin[68]=ff_l2d_l2t_decc_c6_scanout[145];
assign ff_l2d_l2t_decc_c6_scanin[146]=ff_l2d_l2t_decc_c6_scanout[68];
assign ff_l2d_l2t_decc_c6_scanin[69]=ff_l2d_l2t_decc_c6_scanout[146];
assign ff_l2d_l2t_decc_c6_scanin[147]=ff_l2d_l2t_decc_c6_scanout[69];
assign ff_l2d_l2t_decc_c6_scanin[70]=ff_l2d_l2t_decc_c6_scanout[147];
assign ff_l2d_l2t_decc_c6_scanin[148]=ff_l2d_l2t_decc_c6_scanout[70];
assign ff_l2d_l2t_decc_c6_scanin[71]=ff_l2d_l2t_decc_c6_scanout[148];
assign ff_l2d_l2t_decc_c6_scanin[149]=ff_l2d_l2t_decc_c6_scanout[71];
assign ff_l2d_l2t_decc_c6_scanin[72]=ff_l2d_l2t_decc_c6_scanout[149];
assign ff_l2d_l2t_decc_c6_scanin[150]=ff_l2d_l2t_decc_c6_scanout[72];
assign ff_l2d_l2t_decc_c6_scanin[73]=ff_l2d_l2t_decc_c6_scanout[150];
assign ff_l2d_l2t_decc_c6_scanin[151]=ff_l2d_l2t_decc_c6_scanout[73];
assign ff_l2d_l2t_decc_c6_scanin[74]=ff_l2d_l2t_decc_c6_scanout[151];
assign ff_l2d_l2t_decc_c6_scanin[152]=ff_l2d_l2t_decc_c6_scanout[74];
assign ff_l2d_l2t_decc_c6_scanin[75]=ff_l2d_l2t_decc_c6_scanout[152];
assign ff_l2d_l2t_decc_c6_scanin[153]=ff_l2d_l2t_decc_c6_scanout[75];
assign ff_l2d_l2t_decc_c6_scanin[76]=ff_l2d_l2t_decc_c6_scanout[153];
assign ff_l2d_l2t_decc_c6_scanin[154]=ff_l2d_l2t_decc_c6_scanout[76];
assign ff_l2d_l2t_decc_c6_scanin[77]=ff_l2d_l2t_decc_c6_scanout[154];
assign ff_l2d_l2t_decc_c6_scanin[155]=ff_l2d_l2t_decc_c6_scanout[77];
assign ff_l2d_l2b_efc_fuse_data_scanin[0]=ff_l2d_l2t_decc_c6_scanout[155];
assign ff_l2d_l2b_efc_fuse_data_scanin[1]=ff_l2d_l2b_efc_fuse_data_scanout[0];
assign ff_l2d_l2b_efc_fuse_data_scanin[2]=ff_l2d_l2b_efc_fuse_data_scanout[1];
assign ff_l2d_l2b_efc_fuse_data_scanin[3]=ff_l2d_l2b_efc_fuse_data_scanout[2];
assign ff_l2d_l2b_efc_fuse_data_scanin[4]=ff_l2d_l2b_efc_fuse_data_scanout[3];
assign ff_l2d_l2b_efc_fuse_data_scanin[5]=ff_l2d_l2b_efc_fuse_data_scanout[4];
assign ff_l2d_l2b_efc_fuse_data_scanin[6]=ff_l2d_l2b_efc_fuse_data_scanout[5];
assign ff_l2d_l2b_efc_fuse_data_scanin[7]=ff_l2d_l2b_efc_fuse_data_scanout[6];
assign ff_l2d_l2b_efc_fuse_data_scanin[8]=ff_l2d_l2b_efc_fuse_data_scanout[7];
assign ff_l2d_l2b_efc_fuse_data_scanin[9]=ff_l2d_l2b_efc_fuse_data_scanout[8];
assign ff_l2b_l2d_fuse_reset_d_scanin=ff_l2d_l2b_efc_fuse_data_scanout[9];
assign ff_l2b_l2d_fuse_wren_d_scanin=ff_l2b_l2d_fuse_reset_d_scanout;
assign ff_l2b_l2d_fuse_rid_d_scanin[0]=ff_l2b_l2d_fuse_wren_d_scanout;
assign ff_l2b_l2d_fuse_rid_d_scanin[1]=ff_l2b_l2d_fuse_rid_d_scanout[0];
assign ff_l2b_l2d_fuse_rid_d_scanin[2]=ff_l2b_l2d_fuse_rid_d_scanout[1];
assign ff_l2b_l2d_fuse_rid_d_scanin[3]=ff_l2b_l2d_fuse_rid_d_scanout[2];
assign ff_l2b_l2d_fuse_rid_d_scanin[4]=ff_l2b_l2d_fuse_rid_d_scanout[3];
assign ff_l2b_l2d_fuse_rid_d_scanin[5]=ff_l2b_l2d_fuse_rid_d_scanout[4];
assign ff_l2b_l2d_fuse_rid_d_scanin[6]=ff_l2b_l2d_fuse_rid_d_scanout[5];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[0]=ff_l2b_l2d_fuse_rid_d_scanout[6];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[1]=ff_l2b_l2d_fuse_l2d_data_in_scanout[0];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[2]=ff_l2b_l2d_fuse_l2d_data_in_scanout[1];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[3]=ff_l2b_l2d_fuse_l2d_data_in_scanout[2];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[4]=ff_l2b_l2d_fuse_l2d_data_in_scanout[3];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[5]=ff_l2b_l2d_fuse_l2d_data_in_scanout[4];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[6]=ff_l2b_l2d_fuse_l2d_data_in_scanout[5];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[7]=ff_l2b_l2d_fuse_l2d_data_in_scanout[6];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[8]=ff_l2b_l2d_fuse_l2d_data_in_scanout[7];
assign ff_l2b_l2d_fuse_l2d_data_in_scanin[9]=ff_l2b_l2d_fuse_l2d_data_in_scanout[8];
assign ff_fill_clk_en_ov_stg_scanin=ff_l2b_l2d_fuse_l2d_data_in_scanout[9];
assign ff_pwrsav_ov_stg_scanin=ff_fill_clk_en_ov_stg_scanout;
assign scan_out=ff_pwrsav_ov_stg_scanout;
// fixscan end
endmodule // l2d_periph_io

module l2t_wayerr_ctl (
  l2t_l2d_way_sel_c3, 
  wayerr_c3) ;
  input [15:0] l2t_l2d_way_sel_c3;
  output wayerr_c3;
  wire   n_cell_265_net292, net10948, net10949, net10971, net12595, net12602,
         net12610, net12614, net12628, net12629, net12631, net12633, net12635,
         net12636, net12637, net12639, net1877, net1878, net1894, net1902,
         net1903, net1917, net508, net545, net566, net9955, n_cell_265_net315,
         n_cell_265_net321, net1749, net1887, net1891, net1893, net533, net534,
         net560, net586, net9949, net9959, net2033, net2035, net2041, net555,
         n_cell_265_net312, net1876, net1912, net2006, net2036, net2063,
         net2068, net1892, net11658, net11667, net2040, net544, net576, net585,
         net9930, net12609, n_cell_265_net340, n_cell_265_net341, net557,
         net558, net501, n3, net11684, n_cell_265_net310, n_cell_265_net311,
         net2052, net551, net552, net553, net554, net575, net2062, net587, n4,
         net588, n_cell_265_net308, net4464, n5, n6, n7, n8, n10, n13, n15,
         n16, n18, n20, n22, n23, n24, n27, n28, n30, n31, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45;

  cl_u1_nand2_20x U88 ( .in0(n24), .in1(net11684), .out(n3) );
  cl_u1_inv_20x U90 ( .in(n_cell_265_net308), .out(net11684) );
  cl_u1_nand3_16x U40 ( .in0(n_cell_265_net292), .in1(net575), .in2(net9949), 
        .out(net545) );
  cl_u1_aoi21_16x net522 ( .in00(net545), .in10(net544), .in11(n37), .out(
        wayerr_c3) );
  cl_u1_nand2_2x U53 ( .in0(l2t_l2d_way_sel_c3[12]), .in1(
        l2t_l2d_way_sel_c3[11]), .out(net12595) );
  cl_u1_buf_32x U44 ( .in(l2t_l2d_way_sel_c3[1]), .out(net508) );
  cl_u1_inv_12x U30 ( .in(l2t_l2d_way_sel_c3[1]), .out(net1903) );
  cl_u1_nand2_6x U37 ( .in0(net1903), .in1(net12602), .out(net1902) );
  cl_u1_nand2_6x U36 ( .in0(net12602), .in1(net12635), .out(net12631) );
  cl_u1_inv_28x U11 ( .in(l2t_l2d_way_sel_c3[0]), .out(net12635) );
  cl_u1_inv_12x U54 ( .in(net12635), .out(net10971) );
  cl_u1_nor2_6x U55 ( .in0(l2t_l2d_way_sel_c3[14]), .in1(l2t_l2d_way_sel_c3[5]), .out(net10949) );
  cl_u1_nor2_12x U25 ( .in0(l2t_l2d_way_sel_c3[6]), .in1(net554), .out(net553)
         );
  cl_u1_inv_32x U75 ( .in(net2068), .out(net501) );
  cl_u1_nor2_8x U8 ( .in0(net501), .in1(net552), .out(net551) );
  cl_u1_nand2_16x U71 ( .in0(net2035), .in1(net2036), .out(net588) );
  cl_u1_inv_24x U19 ( .in(net552), .out(net2052) );
  cl_u1_nand2_20x U102 ( .in0(n34), .in1(n43), .out(net9949) );
  cl_u1_nor2_16x syn441 ( .in0(net560), .in1(net9930), .out(net533) );
  cl_u1_oai21_16x U42 ( .in00(net12629), .in10(net12628), .in11(net1917), 
        .out(net1877) );
  cl_u1_inv_24x U31 ( .in(net1902), .out(net1917) );
  cl_u1_nand2_20x U43 ( .in0(net12628), .in1(net1917), .out(net12629) );
  cl_u1_inv_16x U12 ( .in(net9955), .out(net1912) );
  cl_u1_nor2_16x U47 ( .in0(net1894), .in1(net1893), .out(net1878) );
  cl_u1_oai21_4x U108 ( .in00(l2t_l2d_way_sel_c3[2]), .in10(n23), .in11(
        l2t_l2d_way_sel_c3[4]), .out(n_cell_265_net311) );
  cl_u1_nor2_16x U56 ( .in0(net1892), .in1(net1891), .out(net1876) );
  cl_u1_nand2_6x U26 ( .in0(net552), .in1(net2063), .out(net2062) );
  cl_u1_inv_24x U93 ( .in(l2t_l2d_way_sel_c3[10]), .out(net12637) );
  cl_u1_inv_24x U74 ( .in(net2068), .out(net2006) );
  cl_u1_nand2_6x U17 ( .in0(net586), .in1(net576), .out(n10) );
  cl_u1_inv_12x U34 ( .in(net10971), .out(net10948) );
  cl_u1_inv_12x U35 ( .in(net11658), .out(n13) );
  cl_u1_inv_16x syn341 ( .in(n_cell_265_net340), .out(net12609) );
  cl_u1_nand3_12x U104 ( .in0(net1887), .in1(net1912), .in2(net552), .out(
        net1891) );
  cl_u1_inv_28x U50 ( .in(l2t_l2d_way_sel_c3[11]), .out(net12639) );
  cl_u1_nand3_24x net4453 ( .in0(n41), .in1(n42), .in2(n22), .out(net2033) );
  cl_u1_nand2_8x U52 ( .in0(n15), .in1(n16), .out(net11667) );
  cl_u1_nand2_16x U22 ( .in0(net1749), .in1(n27), .out(net560) );
  cl_u1_nor2_16x U66 ( .in0(n18), .in1(net2062), .out(net2041) );
  cl_u1_nand2_6x U106 ( .in0(n23), .in1(net4464), .out(n5) );
  cl_u1_buf_32x U67 ( .in(l2t_l2d_way_sel_c3[7]), .out(n20) );
  cl_u1_nor2_4x U61 ( .in0(n20), .in1(l2t_l2d_way_sel_c3[6]), .out(
        n_cell_265_net315) );
  cl_u1_inv_8x syn445 ( .in(l2t_l2d_way_sel_c3[7]), .out(net1749) );
  cl_u1_nor2_8x U13 ( .in0(net2006), .in1(net2052), .out(net2036) );
  cl_u1_inv_4x U32 ( .in(net2006), .out(net2063) );
  cl_u1_nor2_6x U70 ( .in0(n28), .in1(net2006), .out(n_cell_265_net312) );
  cl_u1_nand2_16x U48 ( .in0(n8), .in1(net12614), .out(net558) );
  cl_u1_nand3_8x U49 ( .in0(n8), .in1(net12609), .in2(net12610), .out(net9959)
         );
  cl_u1_nand2_4x U112 ( .in0(l2t_l2d_way_sel_c3[4]), .in1(n22), .out(n6) );
  cl_u1_inv_12x U82 ( .in(l2t_l2d_way_sel_c3[5]), .out(n27) );
  cl_u1_nand3_8x U21 ( .in0(net533), .in1(net534), .in2(net552), .out(
        n_cell_265_net321) );
  cl_u1_nand3_16x U28 ( .in0(n38), .in1(n13), .in2(n35), .out(net1892) );
  cl_u1_oai22_8x U59 ( .in00(n28), .in01(net1749), .in10(n20), .in11(n27), 
        .out(net586) );
  cl_u1_buf_32x U83 ( .in(l2t_l2d_way_sel_c3[5]), .out(n28) );
  cl_u1_inv_16x U9 ( .in(net12636), .out(n8) );
  cl_u1_inv_28x U94 ( .in(l2t_l2d_way_sel_c3[12]), .out(n31) );
  cl_u1_nand2_20x U78 ( .in0(net585), .in1(n3), .out(net544) );
  cl_u1_inv_12x U86 ( .in(n_cell_265_net341), .out(n_cell_265_net340) );
  cl_u1_nor2_6x U45 ( .in0(net508), .in1(net501), .out(n_cell_265_net341) );
  cl_u1_nand3_6x U98 ( .in0(net12602), .in1(net12635), .in2(net566), .out(
        net12633) );
  cl_u1_nor2_6x U33 ( .in0(net1903), .in1(net12602), .out(net9955) );
  cl_u1_nor2_8x U27 ( .in0(net566), .in1(net12631), .out(net12610) );
  cl_u1_inv_24x U29 ( .in(l2t_l2d_way_sel_c3[15]), .out(net12602) );
  cl_u1_inv_16x U10 ( .in(l2t_l2d_way_sel_c3[14]), .out(net566) );
  cl_u1_inv_12x U76 ( .in(net501), .out(net554) );
  cl_u1_inv_28x syn450 ( .in(l2t_l2d_way_sel_c3[6]), .out(net552) );
  cl_u1_inv_20x U24 ( .in(l2t_l2d_way_sel_c3[13]), .out(net2068) );
  cl_u1_nand2_6x U62 ( .in0(n_cell_265_net315), .in1(net576), .out(
        n_cell_265_net308) );
  cl_u1_inv_20x U103 ( .in(net534), .out(net1893) );
  cl_u1_nand2_6x U81 ( .in0(n36), .in1(n40), .out(net11658) );
  cl_u1_inv_24x U38 ( .in(net9930), .out(net576) );
  cl_u1_nand2_12x U80 ( .in0(n36), .in1(n40), .out(net9930) );
  cl_u1_inv_12x U72 ( .in(n22), .out(n23) );
  cl_u1_inv_24x U69 ( .in(l2t_l2d_way_sel_c3[3]), .out(n22) );
  cl_u1_inv_20x U96 ( .in(net9959), .out(n34) );
  cl_u1_nor2_16x U97 ( .in0(net558), .in1(net560), .out(net557) );
  cl_u1_oai21_12x U100 ( .in00(net555), .in10(net551), .in11(net553), .out(
        net587) );
  cl_u1_nand2_16x U109 ( .in0(net2040), .in1(net2041), .out(net585) );
  cl_u1_inv_6x U20 ( .in(n10), .out(net2040) );
  cl_u1_nor2_16x U16 ( .in0(n20), .in1(net2006), .out(net1887) );
  cl_u1_buf_16x U110 ( .in(net12595), .out(n35) );
  cl_u1_nand2_16x U99 ( .in0(net588), .in1(net587), .out(n4) );
  cl_u1_nor2_16x U101 ( .in0(net2033), .in1(net11667), .out(net2035) );
  cl_u1_inv_16x U111 ( .in(l2t_l2d_way_sel_c3[8]), .out(n40) );
  cl_u1_nand2_28x U113 ( .in0(n45), .in1(net12635), .out(net12628) );
  cl_u1_buf_16x U114 ( .in(n39), .out(n37) );
  cl_u1_nand2_2x U115 ( .in0(l2t_l2d_way_sel_c3[9]), .in1(
        l2t_l2d_way_sel_c3[8]), .out(n15) );
  cl_u1_nand2_8x U51 ( .in0(n36), .in1(n40), .out(n16) );
  cl_u1_inv_20x U116 ( .in(l2t_l2d_way_sel_c3[9]), .out(n36) );
  cl_u1_oai12_12x U23 ( .in00(n30), .in01(net10948), .in10(net10949), .out(
        net1894) );
  cl_u1_inv_20x U117 ( .in(n7), .out(n38) );
  cl_u1_inv_4x U118 ( .in(net558), .out(n39) );
  cl_u1_nor2_12x syn281 ( .in0(net508), .in1(net12633), .out(net12614) );
  cl_u1_nand2_20x U18 ( .in0(n4), .in1(net557), .out(net575) );
  cl_u1_inv_32x U119 ( .in(net12636), .out(n45) );
  cl_u1_inv_20x U120 ( .in(l2t_l2d_way_sel_c3[4]), .out(n41) );
  cl_u1_inv_4x U105 ( .in(l2t_l2d_way_sel_c3[4]), .out(net4464) );
  cl_u1_inv_20x U121 ( .in(l2t_l2d_way_sel_c3[2]), .out(n42) );
  cl_u1_nand3_4x U107 ( .in0(n5), .in1(n6), .in2(n42), .out(n_cell_265_net310)
         );
  cl_u1_inv_20x U122 ( .in(n_cell_265_net321), .out(n43) );
  cl_u1_nand3_16x U123 ( .in0(net1877), .in1(net1876), .in2(net1878), .out(
        n_cell_265_net292) );
  cl_u1_nand3_6x U124 ( .in0(n_cell_265_net310), .in1(n_cell_265_net311), 
        .in2(n_cell_265_net312), .out(n44) );
  cl_u1_inv_20x U125 ( .in(n44), .out(n24) );
  cl_u1_inv_28x U57 ( .in(net2033), .out(net534) );
  cl_u1_buf_20x U39 ( .in(net2033), .out(n18) );
  cl_u1_nor2_16x U126 ( .in0(net2033), .in1(net9930), .out(net555) );
  cl_u1_inv_28x U91 ( .in(net12636), .out(n30) );
  cl_u1_nand3_20x U92 ( .in0(net12639), .in1(n31), .in2(net12637), .out(
        net12636) );
  cl_u1_aoi21_8x U6 ( .in00(net12637), .in10(net12639), .in11(n31), .out(n7)
         );
endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro (
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
//   or macro for ports = 2,3
//
//





module n2_l2d_sp_512kb_cust_or_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input [0:0] scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output [0:0] scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in[0:0]),
.so(scan_out[0:0]),
.q(dout[0:0])
);












endmodule









//  
//   or macro for ports = 2,3
//
//





module n2_l2d_sp_512kb_cust_or_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






or2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_156 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [155:0] fdin;

  input [155:0] din;
  input l1clk;
  input [155:0] scan_in;


  input siclk;
  input soclk;

  output [155:0] dout;
  output [155:0] scan_out;
assign fdin[155:0] = din[155:0];






dff #(156)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[155:0]),
.si(scan_in[155:0]),
.so(scan_out[155:0]),
.q(dout[155:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [38:0] fdin;

  input [38:0] din;
  input l1clk;
  input [38:0] scan_in;


  input siclk;
  input soclk;

  output [38:0] dout;
  output [38:0] scan_out;
assign fdin[38:0] = din[38:0];






dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[38:0]),
.si(scan_in[38:0]),
.so(scan_out[38:0]),
.q(dout[38:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;

  input [15:0] din;
  input l1clk;
  input [15:0] scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output [15:0] scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si(scan_in[15:0]),
.so(scan_out[15:0]),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;

  input [9:0] din;
  input l1clk;
  input [9:0] scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output [9:0] scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si(scan_in[9:0]),
.so(scan_out[9:0]),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;

  input [6:0] din;
  input l1clk;
  input [6:0] scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output [6:0] scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si(scan_in[6:0]),
.so(scan_out[6:0]),
.q(dout[6:0])
);












endmodule









//
//   invert macro
//
//





module n2_l2d_sp_512kb_cust_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_sp_512kb_cust_and_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





module n2_l2d_quad_cust (
  waysel_c3_0, 
  wayerr_c3_0, 
  set_c3_0, 
  coloff_c3_0, 
  coloff_c4_l_0, 
  coloff_c5_0, 
  rd_wr_c3_0, 
  readen_c5_0, 
  worden_c3_0, 
  l2clk, 
  tcu_pce_ov_0, 
  pce_0, 
  se_0, 
  tcu_clk_stop_0, 
  wrdlo0_b_l, 
  wrdhi0_b_l, 
  wrdlo1_b_l, 
  wrdhi1_b_l, 
  ldoutlo0_b, 
  ldouthi0_b, 
  ldoutlo1_b, 
  ldouthi1_b, 
  fuse_l2d_data_in_00, 
  fuse_l2d_rid_00, 
  fuse_l2d_wren_00, 
  fuse_l2d_reset_00_l, 
  fdout_00, 
  fuse_l2d_data_in_01, 
  fuse_l2d_rid_01, 
  fuse_l2d_wren_01, 
  fuse_l2d_reset_01_l, 
  fdout_01, 
  fuse_l2d_data_in_10, 
  fuse_l2d_rid_10, 
  fuse_l2d_wren_10, 
  fuse_l2d_reset_10_l, 
  fdout_10, 
  fuse_l2d_data_in_11, 
  fuse_l2d_rid_11, 
  fuse_l2d_wren_11, 
  fuse_l2d_reset_11_l, 
  fdout_11, 
  waysel_c3_1, 
  wayerr_c3_1, 
  set_c3_1, 
  coloff_c3_1, 
  coloff_c4_l_1, 
  coloff_c5_1, 
  rd_wr_c3_1, 
  readen_c5_1, 
  worden_c3_1, 
  tcu_pce_ov_1, 
  pce_1, 
  se_1, 
  tcu_clk_stop_1, 
  wee_l_0, 
  wee_l_1, 
  tstmodclk_l_0, 
  tstmodclk_l_1, 
  vnw_ary);
wire [9:0] left_red_top_d_00;
wire [9:0] left_red_top_d_01;
wire [38:0] ldoutlo0_b_top;
wire [38:0] ldouthi0_b_top;
wire [38:0] ldoutlo1_b_top;
wire [38:0] ldouthi1_b_top;
wire [9:0] right_red_top_d_00;
wire [9:0] right_red_top_d_01;

		
input	[15:0]	 	waysel_c3_0;			//	way_sel
input			wayerr_c3_0;		// 	way_sel error
input	[8:0] 	 	set_c3_0;		  	//	set
input	 	 	coloff_c3_0;		  	//	col_offset
input	 	 	coloff_c4_l_0;		  	//	NEW(one stage+inv)
input	[1:0] 	 	coloff_c5_0;		  	//	NEW(two stage)
input	     	 	rd_wr_c3_0;		  	//	wr_en
input	     	 	readen_c5_0;		  	//	NEW(two stage)
input	[3:0] 	 	worden_c3_0;		  	//	word_en
input	      	 	l2clk;			  	//	l2clk
input	     	 	tcu_pce_ov_0;		  	//	tcu_pce_ov
input	     	 	pce_0;			  	//	NEW
input			se_0;
input	     	 	tcu_clk_stop_0;	  	//	NEW
input	[38:0]	 	wrdlo0_b_l;		     //      decc_in(c3-bphase)
input	[38:0]	 	wrdhi0_b_l;		     //      decc_in(c3-bphase)
input	[38:0]	 	wrdlo1_b_l;		     //      decc_in(c3-bphase)
input	[38:0]	 	wrdhi1_b_l;		     //      decc_in(c3-bphase)
output	[38:0]		ldoutlo0_b;		     //      decc_c52-b
output	[38:0]		ldouthi0_b;		     //      decc_c52-b
output	[38:0]		ldoutlo1_b;		     //      decc_c52-b
output	[38:0]		ldouthi1_b;		     //      decc_c52-b

input   [9:0]   fuse_l2d_data_in_00;
input   [4:0]   fuse_l2d_rid_00;
input           fuse_l2d_wren_00;
input           fuse_l2d_reset_00_l;
output  [9:0]   fdout_00;
input   [9:0]   fuse_l2d_data_in_01;
input   [4:0]   fuse_l2d_rid_01;
input           fuse_l2d_wren_01;
input           fuse_l2d_reset_01_l;
output  [9:0]   fdout_01;
input   [9:0]   fuse_l2d_data_in_10;
input   [4:0]   fuse_l2d_rid_10;
input           fuse_l2d_wren_10;
input           fuse_l2d_reset_10_l;
output  [9:0]   fdout_10;
input   [9:0]   fuse_l2d_data_in_11;
input   [4:0]   fuse_l2d_rid_11;
input           fuse_l2d_wren_11;
input           fuse_l2d_reset_11_l;
output  [9:0]   fdout_11;

input	[15:0]		 waysel_c3_1;		//	way_sel
input			 wayerr_c3_1;		// 	way_sel error
input	[8:0]		 set_c3_1;		//	set
input		 	coloff_c3_1;		//	col_offset
input		 	coloff_c4_l_1;		//	NEW(one stage+inv)
input	[1:0]		 coloff_c5_1;		//	NEW(two stage)
input			 rd_wr_c3_1;		//	wr_en
input			 readen_c5_1;		//	NEW(two stage)
input	[3:0]		 worden_c3_1;		//	word_en
input			 tcu_pce_ov_1;		//	tcu_pce_ov
input	       	 	 pce_1;			//	NEW
input			 se_1;
input			 tcu_clk_stop_1;	//	NEW
input                    wee_l_0;               //	NEW
input                    wee_l_1;               //	NEW
input			 tstmodclk_l_0;
input			 tstmodclk_l_1;
input                    vnw_ary;               //      NEW


n2_l2d_32kb_cust	way07_00	
	(
	.waysel_c3           	(waysel_c3_0[7:0]),
	.waysel_err_c3         (wayerr_c3_0),
	.set_c3              	(set_c3_0[8:0]),
	.coloff_c3           	(coloff_c3_0),
	.coloff_c4_l         	(coloff_c4_l_0),
	.coloff_c5           	(coloff_c5_0[1:0]),
	.rd_wr_c3            	(rd_wr_c3_0),
	.readen_c5           	(readen_c5_0),
	.l2clk               	(l2clk),
	.fuse_l2d_data_in_00    (fuse_l2d_data_in_00[9:0]),
	.fuse_l2d_rid_00        (fuse_l2d_rid_00[2:0]),
	.fuse_l2d_wren_00       (fuse_l2d_wren_00),
	.fuse_l2d_reset_00_l     (fuse_l2d_reset_00_l),
	.sel_quad_00            (fuse_l2d_rid_00[4]),
	.fuse_l2d_data_in_01    (fuse_l2d_data_in_01[9:0]),
	.fuse_l2d_rid_01        (fuse_l2d_rid_01[2:0]),
	.fuse_l2d_wren_01       (fuse_l2d_wren_01),
	.fuse_l2d_reset_01_l     (fuse_l2d_reset_01_l),
	.sel_quad_01            (fuse_l2d_rid_01[4]),
	.red_d_out_00		(left_red_top_d_00[9:0]),
	.red_d_out_01		(left_red_top_d_01[9:0]),
	.red_top_d_00		(10'b0),
	.red_top_d_01		(10'b0),
	.tcu_pce_ov          	(tcu_pce_ov_0),
	.tcu_pce                (pce_0),
	.se                     (se_0),
	.tcu_clk_stop        	(tcu_clk_stop_0),
	.wrd0lo_b_l          	(wrdlo0_b_l[19:0]),
	.wrd0hi_b_l          	(wrdhi0_b_l[19:0]),
	.wrd1lo_b_l          	(wrdlo1_b_l[18:0]),
	.wrd1hi_b_l          	(wrdhi1_b_l[18:0]),
	.ldin0lo_b           	(20'b0),
	.ldin0hi_b           	(20'b0),
	.ldin1lo_b           	(19'b0),
	.ldin1hi_b           	(19'b0),
	.worden_c3           	(worden_c3_0[3:0]),
        .tstmodclk_l            (tstmodclk_l_0),
	.wee_l                  (wee_l_0),
	.ldout0lo_b00		(ldoutlo0_b_top[19:0]),
	.ldout0hi_b00		(ldouthi0_b_top[19:0]),
	.ldout1lo_b00		(ldoutlo1_b_top[18:0]),
	.ldout1hi_b00		(ldouthi1_b_top[18:0]),
        .vnw_ary                (vnw_ary)
	);

n2_l2d_32kb_cust        way158_00
        (
        .waysel_c3              (waysel_c3_0[15:8]),
	.waysel_err_c3         (wayerr_c3_0),
        .set_c3                 (set_c3_0[8:0]),
        .coloff_c3              (coloff_c3_0),
        .coloff_c4_l            (coloff_c4_l_0),
        .coloff_c5              (coloff_c5_0[1:0]),
        .rd_wr_c3               (rd_wr_c3_0),
        .readen_c5              (readen_c5_0),
        .l2clk                  (l2clk),
	.fuse_l2d_data_in_00    (fuse_l2d_data_in_00[9:0]),
	.fuse_l2d_rid_00        (fuse_l2d_rid_00[2:0]),
	.fuse_l2d_wren_00       (fuse_l2d_wren_00),
	.fuse_l2d_reset_00_l     (fuse_l2d_reset_00_l),
	.sel_quad_00            (fuse_l2d_rid_00[3]),
	.fuse_l2d_data_in_01    (fuse_l2d_data_in_01[9:0]),
	.fuse_l2d_rid_01        (fuse_l2d_rid_01[2:0]),
	.fuse_l2d_wren_01       (fuse_l2d_wren_01),
	.fuse_l2d_reset_01_l     (fuse_l2d_reset_01_l),
	.sel_quad_01            (fuse_l2d_rid_01[3]),
	.red_d_out_00		(fdout_00[9:0]),
	.red_d_out_01		(fdout_01[9:0]),
	.red_top_d_00		(left_red_top_d_00[9:0]),
	.red_top_d_01		(left_red_top_d_01[9:0]),
        .tcu_pce_ov             (tcu_pce_ov_0),
        .tcu_pce                (pce_0),
        .se                     (se_0),
        .tcu_clk_stop           (tcu_clk_stop_0),
        .worden_c3              (worden_c3_0[3:0]),
        .tstmodclk_l            (tstmodclk_l_0),
	.wee_l                  (wee_l_0),	
        .wrd0lo_b_l             (wrdlo0_b_l[19:0]),
        .wrd0hi_b_l             (wrdhi0_b_l[19:0]),
        .wrd1lo_b_l             (wrdlo1_b_l[18:0]),
        .wrd1hi_b_l             (wrdhi1_b_l[18:0]),
        .ldin0lo_b              (ldoutlo0_b_top[19:0]),
        .ldin0hi_b              (ldouthi0_b_top[19:0]),
        .ldin1lo_b              (ldoutlo1_b_top[18:0]),
        .ldin1hi_b              (ldouthi1_b_top[18:0]),
        .ldout0lo_b00		(ldoutlo0_b[19:0]),
        .ldout0hi_b00		(ldouthi0_b[19:0]),
        .ldout1lo_b00		(ldoutlo1_b[18:0]),
        .ldout1hi_b00		(ldouthi1_b[18:0]),
        .vnw_ary                (vnw_ary)
        );


n2_l2d_32kb_cust	way70_01	
	(
	.waysel_c3           	(waysel_c3_1[7:0]),
	.waysel_err_c3         (wayerr_c3_1),
	.set_c3              	(set_c3_1[8:0]),
	.coloff_c3           	(coloff_c3_1),
	.coloff_c4_l         	(coloff_c4_l_1),
	.coloff_c5           	({coloff_c5_1[0],coloff_c5_1[1]}),
	.rd_wr_c3            	(rd_wr_c3_1),
	.readen_c5           	(readen_c5_1),
	.l2clk               	(l2clk),
	.fuse_l2d_data_in_00    (fuse_l2d_data_in_10[9:0]),
	.fuse_l2d_rid_00        (fuse_l2d_rid_10[2:0]),
	.fuse_l2d_wren_00       (fuse_l2d_wren_10),
	.fuse_l2d_reset_00_l     (fuse_l2d_reset_10_l),
	.sel_quad_00            (fuse_l2d_rid_10[4]),
	.fuse_l2d_data_in_01    (fuse_l2d_data_in_11[9:0]),
	.fuse_l2d_rid_01        (fuse_l2d_rid_11[2:0]),
	.fuse_l2d_wren_01       (fuse_l2d_wren_11),
	.fuse_l2d_reset_01_l     (fuse_l2d_reset_11_l),
	.sel_quad_01            (fuse_l2d_rid_11[4]),
	.red_d_out_00		(right_red_top_d_00[9:0]),
	.red_d_out_01		(right_red_top_d_01[9:0]),
	.red_top_d_00		(10'b0),
	.red_top_d_01		(10'b0),
	.tcu_pce_ov          	(tcu_pce_ov_1),
	.tcu_pce                (pce_1),
        .se                     (se_1),
	.tcu_clk_stop        	(tcu_clk_stop_1),
	.wrd0lo_b_l          	(wrdlo1_b_l[38:19]),
	.wrd0hi_b_l          	(wrdhi1_b_l[38:19]),
	.wrd1lo_b_l          	(wrdlo0_b_l[38:20]),
	.wrd1hi_b_l          	(wrdhi0_b_l[38:20]),
	.ldin0lo_b           	(20'b0),
	.ldin0hi_b           	(20'b0),
	.ldin1lo_b           	(19'b0),
	.ldin1hi_b           	(19'b0),
	.worden_c3           	(worden_c3_1[3:0]),
        .tstmodclk_l            (tstmodclk_l_1),
	.wee_l                  (wee_l_1),
	.ldout0lo_b00		(ldoutlo1_b_top[38:19]),
	.ldout0hi_b00		(ldouthi1_b_top[38:19]),
	.ldout1lo_b00		(ldoutlo0_b_top[38:20]),
	.ldout1hi_b00		(ldouthi0_b_top[38:20]),
        .vnw_ary                (vnw_ary)
	);

n2_l2d_32kb_cust        way158_01
        (
        .waysel_c3              (waysel_c3_1[15:8]),
	.waysel_err_c3         (wayerr_c3_1),
        .set_c3                 (set_c3_1[8:0]),
        .coloff_c3              (coloff_c3_1),
        .coloff_c4_l            (coloff_c4_l_1),
        .coloff_c5              ({coloff_c5_1[0],coloff_c5_1[1]}),
        .rd_wr_c3               (rd_wr_c3_1),
        .readen_c5              (readen_c5_1),
        .l2clk                  (l2clk),
	.fuse_l2d_data_in_00    (fuse_l2d_data_in_10[9:0]),
	.fuse_l2d_rid_00        (fuse_l2d_rid_10[2:0]),
	.fuse_l2d_wren_00       (fuse_l2d_wren_10),
	.fuse_l2d_reset_00_l     (fuse_l2d_reset_10_l),
	.sel_quad_00            (fuse_l2d_rid_10[3]),
	.fuse_l2d_data_in_01    (fuse_l2d_data_in_11[9:0]),
	.fuse_l2d_rid_01        (fuse_l2d_rid_11[2:0]),
	.fuse_l2d_wren_01       (fuse_l2d_wren_11),
	.fuse_l2d_reset_01_l     (fuse_l2d_reset_11_l),
	.sel_quad_01            (fuse_l2d_rid_11[3]),
	.red_d_out_00		(fdout_10[9:0]),
	.red_d_out_01		(fdout_11[9:0]),
	.red_top_d_00		(right_red_top_d_00[9:0]),
	.red_top_d_01		(right_red_top_d_01[9:0]),
        .tcu_pce_ov             (tcu_pce_ov_1),
	.tcu_pce                (pce_1),
        .se                     (se_1),
        .tcu_clk_stop           (tcu_clk_stop_1),
        .wrd0lo_b_l             (wrdlo1_b_l[38:19]),
        .wrd0hi_b_l             (wrdhi1_b_l[38:19]),
        .wrd1lo_b_l             (wrdlo0_b_l[38:20]),
        .wrd1hi_b_l             (wrdhi0_b_l[38:20]),
        .ldin0lo_b              (ldoutlo1_b_top[38:19]),
        .ldin0hi_b              (ldouthi1_b_top[38:19]),
        .ldin1lo_b              (ldoutlo0_b_top[38:20]),
        .ldin1hi_b              (ldouthi0_b_top[38:20]),
        .worden_c3              (worden_c3_1[3:0]),
        .tstmodclk_l            (tstmodclk_l_1),
	.wee_l                  (wee_l_1),
        .ldout0lo_b00		(ldoutlo1_b[38:19]),
        .ldout0hi_b00		(ldouthi1_b[38:19]),
        .ldout1lo_b00		(ldoutlo0_b[38:20]),
        .ldout1hi_b00		(ldouthi0_b[38:20]),
        .vnw_ary                (vnw_ary)
        );


endmodule


module n2_l2d_32kb_cust (
  waysel_c3, 
  waysel_err_c3, 
  set_c3, 
  coloff_c3, 
  coloff_c4_l, 
  coloff_c5, 
  rd_wr_c3, 
  readen_c5, 
  l2clk, 
  fuse_l2d_data_in_00, 
  fuse_l2d_rid_00, 
  fuse_l2d_wren_00, 
  fuse_l2d_reset_00_l, 
  sel_quad_00, 
  red_d_out_00, 
  fuse_l2d_data_in_01, 
  fuse_l2d_rid_01, 
  fuse_l2d_wren_01, 
  fuse_l2d_reset_01_l, 
  sel_quad_01, 
  red_d_out_01, 
  red_top_d_00, 
  red_top_d_01, 
  tcu_pce_ov, 
  tcu_pce, 
  se, 
  tcu_clk_stop, 
  wrd0lo_b_l, 
  wrd0hi_b_l, 
  wrd1lo_b_l, 
  wrd1hi_b_l, 
  ldin0lo_b, 
  ldin0hi_b, 
  ldin1lo_b, 
  ldin1hi_b, 
  worden_c3, 
  tstmodclk_l, 
  wee_l, 
  vnw_ary, 
  ldout0lo_b00, 
  ldout0hi_b00, 
  ldout1lo_b00, 
  ldout1hi_b00);
wire [7:0] waysel_top_c4;
wire [8:0] set_top_c3b;
wire coloff_top_c3b_l;
wire writeen_top_c3b;
wire [3:0] worden_top_c3b;
wire l1clk;
wire [9:0] red_addr_top_01;
wire [77:0] cred;
wire [19:0] sat_lo0_bc_l;
wire [19:0] sat_hi0_bc_l;
wire [18:0] sat_lo1_bc_l;
wire [18:0] sat_hi1_bc_l;
wire [7:0] waysel_bot_c4;
wire [8:0] set_bot_c3b;
wire coloff_bot_c3b_l;
wire writeen_bot_c3b;
wire [3:0] worden_bot_c3b;
wire [9:0] red_addr_bot_00;
wire [19:0] sab_lo0_bc_l;
wire [19:0] sab_hi0_bc_l;
wire [18:0] sab_lo1_bc_l;
wire [18:0] sab_hi1_bc_l;


	
input	[7:0]	waysel_c3;
input	     	waysel_err_c3;
input	[8:0]	set_c3;
input		coloff_c3;
input		coloff_c4_l;	// check if 1 bit
input	[1:0]	coloff_c5;	// check if 1 bit
input		rd_wr_c3;
input		readen_c5;
input		l2clk;


input	[9:0]	fuse_l2d_data_in_00;
input	[2:0]	fuse_l2d_rid_00;
input		fuse_l2d_wren_00;
input		fuse_l2d_reset_00_l;
input		sel_quad_00;
output	[9:0]	red_d_out_00;

input	[9:0]	fuse_l2d_data_in_01;
input	[2:0]	fuse_l2d_rid_01;
input		fuse_l2d_wren_01;
input		fuse_l2d_reset_01_l;
input		sel_quad_01;
output	[9:0]	red_d_out_01;

input	[9:0]	red_top_d_00;
input	[9:0]	red_top_d_01;

input		tcu_pce_ov;
input		tcu_pce;
input		se;
input		tcu_clk_stop;
input	[19:0]	wrd0lo_b_l;
input	[19:0]	wrd0hi_b_l;
input	[18:0]	wrd1lo_b_l;
input	[18:0]	wrd1hi_b_l;
input	[19:0]	ldin0lo_b;
input	[19:0]	ldin0hi_b;
input	[18:0]	ldin1lo_b;
input	[18:0]	ldin1hi_b;
input	[3:0]	worden_c3;
input           tstmodclk_l;
input           wee_l;
input           vnw_ary;        //NEW

output	[19:0]	ldout0lo_b00;
output	[19:0]	ldout0hi_b00;
output	[18:0]	ldout1lo_b00;
output	[18:0]	ldout1hi_b00;


n2_l2d_16kb_cust	set_top
	(
	.waysel_c4		(waysel_top_c4[7:0]),
	.waysel_err_c3		(waysel_err_c3),
	.set_c3b		(set_top_c3b[8:0]),
	.coloff_c3b_l		(coloff_top_c3b_l),
	.coloff_c4_l		(coloff_c4_l),
	.coloff_c5		(coloff_c5[1:0]),
	.wen_c3b		(writeen_top_c3b),
	.readen_c5		(readen_c5),
	.worden_c3b		(worden_top_c3b[3:0]),
	.l1clk			(l1clk),
	.wrd_lo0_b_l		(wrd0lo_b_l[19:0]),
	.wrd_hi0_b_l		(wrd0hi_b_l[19:0]),
	.wrd_lo1_b_l		(wrd1lo_b_l[18:0]),
	.wrd_hi1_b_l		(wrd1hi_b_l[18:0]),
//	.bnken_lat		(bnken_lat),
	.red_adr		(red_addr_top_01[9:0]),
	.cred			(cred[77:0]),
//        .fuse_l2d_reset  	(fuse_l2d_reset_00_l_buf),
	.saout_lo0_bc_l		(sat_lo0_bc_l[19:0]),
	.saout_hi0_bc_l		(sat_hi0_bc_l[19:0]),
	.saout_lo1_bc_l		(sat_lo1_bc_l[18:0]),
	.saout_hi1_bc_l		(sat_hi1_bc_l[18:0]),
	.tstmodclk_l		(tstmodclk_l),		//NEW
	.wee_l			(wee_l),		//NEW
	.vnw_ary                (vnw_ary)               //NEW
	);

n2_l2d_16kb_cust     set_bot
        (
        .waysel_c4        	(waysel_bot_c4[7:0]),
	.waysel_err_c3		(waysel_err_c3),
        .set_c3b           	(set_bot_c3b[8:0]),
        .coloff_c3b_l      	(coloff_bot_c3b_l),
        .coloff_c4_l       	(coloff_c4_l),
        .coloff_c5         	(coloff_c5[1:0]),
        .wen_c3b               	(writeen_bot_c3b),
        .readen_c5             	(readen_c5),
        .worden_c3b        	(worden_bot_c3b[3:0]),
        .l1clk                 	(l1clk),
	.wrd_lo0_b_l		(wrd0lo_b_l[19:0]),
	.wrd_hi0_b_l		(wrd0hi_b_l[19:0]),
	.wrd_lo1_b_l		(wrd1lo_b_l[18:0]),
	.wrd_hi1_b_l		(wrd1hi_b_l[18:0]),
	.red_adr		(red_addr_bot_00[9:0]),
//        .bnken_lat             	(),
	.cred			(cred[77:0]),
//        .fuse_l2d_reset  	(fuse_l2d_reset_01_l_buf),
        .saout_lo0_bc_l   	(sab_lo0_bc_l[19:0]),
        .saout_hi0_bc_l   	(sab_hi0_bc_l[19:0]),
        .saout_lo1_bc_l   	(sab_lo1_bc_l[18:0]),
        .saout_hi1_bc_l   	(sab_hi1_bc_l[18:0]),
	.tstmodclk_l		(tstmodclk_l),		//NEW
	.wee_l			(wee_l),		//NEW
        .vnw_ary                (vnw_ary)               //NEW
        );


n2_l2d_dmux78_cust	data_mux
	(
	.waysel_c3		(waysel_c3[7:0]),		// should be 15:0
	.set_c3			(set_c3[8:0]),
	.coloff_c3		(coloff_c3),
//	.coloff_c4_l		(coloff_c4_l),
//	.coloff_c5		(coloff_c5[1:0]),
	.rd_wr_c3        	(rd_wr_c3),
//	.readen_c5       	(readen_c5),
	.worden_c3       	(worden_c3[3:0]),
	.l2clk           	(l2clk),
	.tcu_pce_ov      	(tcu_pce_ov),
	.tcu_pce             	(tcu_pce),
	.se             	(se),
	.tcu_clk_stop    	(tcu_clk_stop),
	.waysel_top_c4		(waysel_top_c4[7:0]),
	.waysel_bot_c4		(waysel_bot_c4[7:0]),
	.set_top_c3b		(set_top_c3b[8:0]),
	.set_bot_c3b		(set_bot_c3b[8:0]),
//	.coloff_top_c3b_l	(coloff_top_c3b_l),
//	.coloff_bot_c3b_l	(coloff_bot_c3b_l),
//	.coloff_top_c4_l 	(coloff_top_c4_l),
//	.coloff_bot_c4_l 	(coloff_bot_c4_l),
//	.coloff_top_c5   	(coloff_top_c5),
//	.coloff_bot_c5   	(coloff_bot_c5),
	.writeen_top_c3b 	(writeen_top_c3b),
	.writeen_bot_c3b 	(writeen_bot_c3b),
//	.readen_top_c5   	(readen_top_c5),
//	.readen_bot_c5   	(readen_bot_c5),
	.l1clk           	(l1clk),
	.worden_top_c3b		(worden_top_c3b[3:0]),
	.worden_bot_c3b		(worden_bot_c3b[3:0]),
	.sat_lo0_bc_l		(sat_lo0_bc_l[19:0]),
	.sat_hi0_bc_l		(sat_hi0_bc_l[19:0]),
	.sat_lo1_bc_l		(sat_lo1_bc_l[18:0]),
	.sat_hi1_bc_l		(sat_hi1_bc_l[18:0]),
	.sab_lo0_bc_l		(sab_lo0_bc_l[19:0]),
	.sab_hi0_bc_l		(sab_hi0_bc_l[19:0]),
	.sab_lo1_bc_l		(sab_lo1_bc_l[18:0]),
	.sab_hi1_bc_l		(sab_hi1_bc_l[18:0]),
	.ldin0lo_b		(ldin0lo_b[19:0]),
	.ldin0hi_b		(ldin0hi_b[19:0]),
	.ldin1lo_b		(ldin1lo_b[18:0]),
	.ldin1hi_b		(ldin1hi_b[18:0]),
//	.bnken_lat       	(bnken_lat),
	.ldout0lo_b		(ldout0lo_b00[19:0]),
	.ldout1lo_b		(ldout1lo_b00[18:0]),
	.ldout0hi_b		(ldout0hi_b00[19:0]),
	.ldout1hi_b		(ldout1hi_b00[18:0]),
	.red_d_out_00		(red_d_out_00[9:0]),
	.red_d_in_00    	(fuse_l2d_data_in_00[9:0]),
	.fuse_l2d_rid_00        (fuse_l2d_rid_00[2:0]),
	.fuse_l2d_wren_00       (fuse_l2d_wren_00),
	.fuse_l2d_reset_00_l    (fuse_l2d_reset_00_l),
	.sel_quad_00            (sel_quad_00),
	.red_d_out_01		(red_d_out_01[9:0]),
	.red_top_d_00		(red_top_d_00[9:0]),
	.red_top_d_01		(red_top_d_01[9:0]),
	.red_d_in_01    	(fuse_l2d_data_in_01[9:0]),
	.fuse_l2d_rid_01        (fuse_l2d_rid_01[2:0]),
	.fuse_l2d_wren_01       (fuse_l2d_wren_01),
	.fuse_l2d_reset_01_l    (fuse_l2d_reset_01_l),
	.sel_quad_01            (sel_quad_01),
	.cred			(cred[77:0]),
//        .fuse_l2d_reset_00_l_buf  (fuse_l2d_reset_00_l_buf),
//        .fuse_l2d_reset_01_l_buf  (fuse_l2d_reset_01_l_buf),
	.red_addr_top		(red_addr_top_01),
	.red_addr_bot		(red_addr_bot_00),
  .coloff_c4_l(coloff_c4_l),
  .coloff_top_c3b_l(coloff_top_c3b_l),
  .coloff_bot_c3b_l(coloff_bot_c3b_l)
	);

endmodule




module n2_l2d_16kb_cust (
  waysel_c4, 
  waysel_err_c3, 
  set_c3b, 
  coloff_c3b_l, 
  coloff_c4_l, 
  coloff_c5, 
  wen_c3b, 
  readen_c5, 
  worden_c3b, 
  l1clk, 
  wrd_lo0_b_l, 
  wrd_lo1_b_l, 
  wrd_hi0_b_l, 
  wrd_hi1_b_l, 
  red_adr, 
  cred, 
  tstmodclk_l, 
  wee_l, 
  vnw_ary, 
  saout_lo0_bc_l, 
  saout_lo1_bc_l, 
  saout_hi0_bc_l, 
  saout_hi1_bc_l);
wire coloff_c3b_l_unused;
wire bank_select;
wire coloff_c4;
wire [7:0] set_c4;
wire [1:0] spare_word_enable;
wire select_red_odd;
wire select_red_even;

	
		
input [7:0] 	waysel_c4;		
input		waysel_err_c3;		// 	Active when multiple way sel is on
input [8:0]   	set_c3b;		//	After b-latch
input    	coloff_c3b_l;		//	After b-latch+inv
input    	coloff_c4_l;		//	stage+inv
input [1:0]   	coloff_c5;		//	2-stage
input         	wen_c3b;	 	//	Write-enable, after b-latch
input         	readen_c5;	 	//	
input [3:0]   	worden_c3b;		//	After b-latch
input         	l1clk;	 		//	After l1clk hdr
input [19:0]  	wrd_lo0_b_l;		//	
input [18:0]  	wrd_lo1_b_l;		//	
input [19:0]  	wrd_hi0_b_l;		//	
input [18:0]  	wrd_hi1_b_l;		//	
input [9:0]	red_adr;		// Redudancy address
input [77:0]	cred;			// Redudancy address
input		tstmodclk_l;		//NEW
input		wee_l;			//NEW
input           vnw_ary;                //NEW

//output		bnken_lat;	//	Address latch enable (1.5cycle)
output [19:0]  	saout_lo0_bc_l;		//	C5bc output from senseamp
output [18:0]  	saout_lo1_bc_l;		//	C5bc output from senseamp
output [19:0]  	saout_hi0_bc_l;		//	C5bc output from senseamp
output [18:0]  	saout_hi1_bc_l;		//	C5bc output from senseamp

//reg		rd_data_out_sel_c5b;
//reg select_read_data_c5b;
reg select_read_data_c5b_hi_rgt;
reg select_read_data_c5b_hi_lft;
reg select_read_data_c5b_lo_rgt;
reg select_read_data_c5b_lo_lft;
reg select_read_data_all_c5b;
reg select_read_red_all_c5b;

//reg select_read_red_c5b;
reg select_read_red_c5b_hi_rgt;
reg select_read_red_c5b_hi_lft;
reg select_read_red_c5b_lo_rgt;
reg select_read_red_c5b_lo_lft;

//reg    	bnken_lat;

reg [19:0]    saout_lo0_bc_l;         //      C5bc output from senseamp
reg [18:0]    saout_lo1_bc_l;         //      C5bc output from senseamp
reg [19:0]    saout_hi0_bc_l;         //      C5bc output from senseamp
reg [18:0]    saout_hi1_bc_l;         //      C5bc output from senseamp

reg [79:0]    read_data;
wire [79:0]    rd_data;
wire [79:0]    wr_data;
reg	rd_spare_0,rd_spare_1;
wire    wr_spare_0,wr_spare_1;

wire [19:0] saout_hi0_b_out_l, saout_lo0_b_out_l;
wire [18:0] saout_hi1_b_out_l, saout_lo1_b_out_l;
wire [19:0]     red_lo0_b_out_l;
wire [18:0]     red_lo1_b_out_l;
wire [19:0]     red_hi0_b_out_l;
wire [18:0]     red_hi1_b_out_l;

wire [1:0] coloff_c5_rgt;
wire [1:0] coloff_c5_lft;
wire	   red_sel_rgt;
wire	   red_sel_lft;




reg  [19:0] mem_lo0_way0 [255:0];
reg  [18:0] mem_lo1_way0 [255:0];
reg  [19:0] mem_hi0_way0 [255:0];
reg  [18:0] mem_hi1_way0 [255:0];
reg  [255:0] mem_way0_spare_0;
reg  [255:0] mem_way0_spare_1;

reg  [19:0] mem_lo0_way1 [255:0];
reg  [18:0] mem_lo1_way1 [255:0];
reg  [19:0] mem_hi0_way1 [255:0];
reg  [18:0] mem_hi1_way1 [255:0];
reg  [255:0] mem_way1_spare_0;
reg  [255:0] mem_way1_spare_1;

reg  [19:0] mem_lo0_way2 [255:0];
reg  [18:0] mem_lo1_way2 [255:0];
reg  [19:0] mem_hi0_way2 [255:0];
reg  [18:0] mem_hi1_way2 [255:0];
reg  [255:0] mem_way2_spare_0;
reg  [255:0] mem_way2_spare_1;


reg  [19:0] mem_lo0_way3 [255:0];
reg  [18:0] mem_lo1_way3 [255:0];
reg  [19:0] mem_hi0_way3 [255:0];
reg  [18:0] mem_hi1_way3 [255:0];
reg  [255:0] mem_way3_spare_0;
reg  [255:0] mem_way3_spare_1;


reg  [19:0] mem_lo0_way4 [255:0];
reg  [18:0] mem_lo1_way4 [255:0];
reg  [19:0] mem_hi0_way4 [255:0];
reg  [18:0] mem_hi1_way4 [255:0];
reg  [255:0] mem_way4_spare_0;
reg  [255:0] mem_way4_spare_1;


reg  [19:0] mem_lo0_way5 [255:0];
reg  [18:0] mem_lo1_way5 [255:0];
reg  [19:0] mem_hi0_way5 [255:0];
reg  [18:0] mem_hi1_way5 [255:0];
reg  [255:0] mem_way5_spare_0;
reg  [255:0] mem_way5_spare_1;


reg  [19:0] mem_lo0_way6 [255:0];
reg  [18:0] mem_lo1_way6 [255:0];
reg  [19:0] mem_hi0_way6 [255:0];
reg  [18:0] mem_hi1_way6 [255:0];
reg  [255:0] mem_way6_spare_0;
reg  [255:0] mem_way6_spare_1;


reg  [19:0] mem_lo0_way7 [255:0];
reg  [18:0] mem_lo1_way7 [255:0];
reg  [19:0] mem_hi0_way7 [255:0];
reg  [18:0] mem_hi1_way7 [255:0];
reg  [255:0] mem_way7_spare_0;
reg  [255:0] mem_way7_spare_1;

//reg    	bnken_lat_c52;
reg [19:0]    saout_lo0_bc;         //      C5bc output from senseamp
reg [18:0]    saout_lo1_bc;         //      C5bc output from senseamp
reg [19:0]    saout_hi0_bc;         //      C5bc output from senseamp
reg [18:0]    saout_hi1_bc;         //      C5bc output from senseamp


//reg [19:0]    saout_lo0_bc_d;         //      C5bc output from senseamp
//reg [18:0]    saout_lo1_bc_d;         //      C5bc output from senseamp
//reg [19:0]    saout_hi0_bc_d;         //      C5bc output from senseamp
//reg [18:0]    saout_hi1_bc_d;         //      C5bc output from senseamp

//reg	set_banken_lat, reset_banken_lat;

reg [19:0]       saout_lo0_bc_c5b_l;
reg [18:0]       saout_lo1_bc_c5b_l;
reg [19:0]       saout_hi0_bc_c5b_l;
reg [18:0]       saout_hi1_bc_c5b_l;

reg [19:0]       saout_lo0_bc_d_l;
reg [18:0]       saout_lo1_bc_d_l;
reg [19:0]       saout_hi0_bc_d_l;
reg [18:0]       saout_hi1_bc_d_l;


assign coloff_c3b_l_unused = coloff_c3b_l;


//always@(posedge l1clk)
//begin
//        if(~coloff_c3b_l)
//                set_banken_lat <= 1'b1;
//        else    set_banken_lat <= 1'b0;
//end
//
//always@(negedge l1clk)
//begin
//        if(coloff_c4_l)
//                reset_banken_lat  <= 1'b1;
//        else    reset_banken_lat  <= 1'b0;
//end
//
//always@(set_banken_lat or reset_banken_lat)
//begin
//        if(set_banken_lat )
//                bnken_lat       <=      1'b1;
//        else if(reset_banken_lat )
//                bnken_lat       <=      1'b0;
//end


reg	[7:0] waysel_c5;
reg	[8:0]	index_c4;
reg	[8:0]	set_c5;
reg	wen_c4; 
reg	[3:0]	worden_c4;



reg	bank_select_c5;
reg     waysel_err_c3b, waysel_err_c4,waysel_err_c5;

always@(l1clk or coloff_c4_l)
begin
        if(~l1clk & coloff_c4_l)
	waysel_err_c3b	<=	waysel_err_c3;
end





always@(posedge l1clk)
begin
	waysel_err_c4	<=	waysel_err_c3b;
	waysel_err_c5	<=	waysel_err_c4;
	waysel_c5[7:0]	<=	waysel_c4[7:0];
	index_c4[8:0]	<=	set_c3b[8:0];
	set_c5[8:0]	<=	index_c4[8:0];
	worden_c4[3:0]	<=	worden_c3b[3:0];
	wen_c4		<=	wen_c3b;
	bank_select_c5  <= 	bank_select;
end


assign coloff_c4 = ~coloff_c4_l;
assign bank_select = index_c4[8];

//reg	[19:0]	saout_lo0_bc_c5b;
//reg	[18:0]	saout_lo1_bc_c5b;
//reg	[19:0]	saout_hi0_bc_c5b;
//reg	[18:0]	saout_hi1_bc_c5b;






assign set_c4[7:0] = index_c4[7:0];
wire	[19:0] wrd_lo0_a;
wire	[19:0] wrd_hi0_a;
wire	[18:0] wrd_lo1_a;
wire	[18:0] wrd_hi1_a;

reg	[19:0] wrd_lo0_a_reg;
reg	[19:0] wrd_hi0_a_reg;
reg	[18:0] wrd_lo1_a_reg;
reg	[18:0] wrd_hi1_a_reg;


always@(posedge l1clk)
begin
wrd_lo0_a_reg[19:0] <= ~wrd_lo0_b_l[19:0];
wrd_hi0_a_reg[19:0] <= ~wrd_hi0_b_l[19:0];
wrd_lo1_a_reg[18:0] <= ~wrd_lo1_b_l[18:0];
wrd_hi1_a_reg[18:0] <= ~wrd_hi1_b_l[18:0];
end



// COL redudancy

//reg [255:0] red_reg1;
//reg [255:0] red_reg2;

wire [79:0] cred_mod;


assign cred_mod[79:0] = {cred[77:59],1'b0,cred[58:19],1'b0,cred[18:0]};


//assign spare_word_enable[1] = cred_mod[19] ? worden_c4[3] : worden_c4[2]; 
//assign spare_word_enable[0] = cred_mod[59] ? worden_c4[3] : worden_c4[2];


assign wr_data[19:0] = 
{wr_spare_0,	  wrd_lo1_a_reg[4], wrd_hi0_a_reg[4],wrd_lo0_a_reg[4],
wrd_hi1_a_reg[3], wrd_lo1_a_reg[3], wrd_hi0_a_reg[3],wrd_lo0_a_reg[3],
wrd_hi1_a_reg[2], wrd_lo1_a_reg[2], wrd_hi0_a_reg[2],wrd_lo0_a_reg[2],
wrd_hi1_a_reg[1], wrd_lo1_a_reg[1], wrd_hi0_a_reg[1],wrd_lo0_a_reg[1],
wrd_hi1_a_reg[0], wrd_lo1_a_reg[0], wrd_hi0_a_reg[0],wrd_lo0_a_reg[0]};

assign wr_data[39:20] = {
		  wrd_lo1_a_reg[9], wrd_hi0_a_reg[9],wrd_lo0_a_reg[9],
wrd_hi1_a_reg[8], wrd_lo1_a_reg[8], wrd_hi0_a_reg[8],wrd_lo0_a_reg[8],
wrd_hi1_a_reg[7], wrd_lo1_a_reg[7], wrd_hi0_a_reg[7],wrd_lo0_a_reg[7],
wrd_hi1_a_reg[6], wrd_lo1_a_reg[6], wrd_hi0_a_reg[6],wrd_lo0_a_reg[6],
wrd_hi1_a_reg[5], wrd_lo1_a_reg[5], wrd_hi0_a_reg[5],wrd_lo0_a_reg[5], wrd_hi1_a_reg[4]};


assign wr_data[59:40] = {
wrd_lo1_a_reg[14], wrd_hi0_a_reg[14],wrd_lo0_a_reg[14],
wrd_hi1_a_reg[13], wrd_lo1_a_reg[13], wrd_hi0_a_reg[13],wrd_lo0_a_reg[13],
wrd_hi1_a_reg[12], wrd_lo1_a_reg[12], wrd_hi0_a_reg[12],wrd_lo0_a_reg[12],
wrd_hi1_a_reg[11], wrd_lo1_a_reg[11], wrd_hi0_a_reg[11],wrd_lo0_a_reg[11],
wrd_hi1_a_reg[10], wrd_lo1_a_reg[10], wrd_hi0_a_reg[10],wrd_lo0_a_reg[10], wrd_hi1_a_reg[9]};

assign wr_data[79:60] = {
wrd_hi0_a_reg[19], wrd_lo0_a_reg[19],
wrd_hi1_a_reg[18], wrd_lo1_a_reg[18], wrd_hi0_a_reg[18],wrd_lo0_a_reg[18],
wrd_hi1_a_reg[17], wrd_lo1_a_reg[17], wrd_hi0_a_reg[17],wrd_lo0_a_reg[17],
wrd_hi1_a_reg[16], wrd_lo1_a_reg[16], wrd_hi0_a_reg[16],wrd_lo0_a_reg[16],
wrd_hi1_a_reg[15], wrd_lo1_a_reg[15], wrd_hi0_a_reg[15],wrd_lo0_a_reg[15], wrd_hi1_a_reg[14],wr_spare_1};


integer i; 
reg	[80:0] data;

always@(cred_mod or wr_data)
begin
if (~cred_mod[0]) begin
 data[0] = wr_data[0];
end

for(i=0; i<18; i=i+1)
begin
  data[i+1] = cred_mod[i] ? wr_data[i] : wr_data[i+1];
end

data[19] = cred_mod[18] ? wr_data[18] : cred_mod[20] ? wr_data[20] : 1'b0;

for(i=21;i<40;i=i+1)
begin 
 data[i-1] = cred_mod[i] ? wr_data[i] : wr_data[i-1];
end


if (~cred_mod[39]) begin
 data[39] = wr_data[39];
end

if (~cred_mod[40]) begin
 data[40] = wr_data[40];
end

for(i=40;i<59;i=i+1)
begin
  data[i+1] = cred_mod[i] ? wr_data[i] : wr_data[i+1];
end

data[60] = cred_mod[59] ? wr_data[59] : cred_mod[61] ? wr_data[61] : 1'b0;

for(i=62;i<80;i=i+1)
begin
  data[i-1] = cred_mod[i] ? wr_data[i] : wr_data[i-1];
end

if (~cred_mod[79]) begin
 data[79] = wr_data[79];
end 
 
end

 
assign { wrd_hi0_a[19], wrd_lo0_a[19],
wrd_hi1_a[18], wrd_lo1_a[18], wrd_hi0_a[18],wrd_lo0_a[18],
wrd_hi1_a[17], wrd_lo1_a[17], wrd_hi0_a[17],wrd_lo0_a[17],
wrd_hi1_a[16], wrd_lo1_a[16], wrd_hi0_a[16],wrd_lo0_a[16],
wrd_hi1_a[15], wrd_lo1_a[15], wrd_hi0_a[15],wrd_lo0_a[15], 
wrd_hi1_a[14],wr_spare_1} = data[79:60];

assign {
wrd_lo1_a[14], wrd_hi0_a[14],wrd_lo0_a[14],
wrd_hi1_a[13], wrd_lo1_a[13], wrd_hi0_a[13],wrd_lo0_a[13],
wrd_hi1_a[12], wrd_lo1_a[12], wrd_hi0_a[12],wrd_lo0_a[12],
wrd_hi1_a[11], wrd_lo1_a[11], wrd_hi0_a[11],wrd_lo0_a[11],
wrd_hi1_a[10], wrd_lo1_a[10], wrd_hi0_a[10],wrd_lo0_a[10],wrd_hi1_a[9]} = data[59:40];

assign {
wrd_lo1_a[9], wrd_hi0_a[9],wrd_lo0_a[9],
wrd_hi1_a[8], wrd_lo1_a[8], wrd_hi0_a[8],wrd_lo0_a[8],
wrd_hi1_a[7], wrd_lo1_a[7], wrd_hi0_a[7],wrd_lo0_a[7],
wrd_hi1_a[6], wrd_lo1_a[6], wrd_hi0_a[6],wrd_lo0_a[6],
wrd_hi1_a[5], wrd_lo1_a[5], wrd_hi0_a[5],wrd_lo0_a[5], wrd_hi1_a[4]} = data[39:20];

assign {
wr_spare_0,   wrd_lo1_a[4], wrd_hi0_a[4],wrd_lo0_a[4],
wrd_hi1_a[3], wrd_lo1_a[3], wrd_hi0_a[3],wrd_lo0_a[3],
wrd_hi1_a[2], wrd_lo1_a[2], wrd_hi0_a[2],wrd_lo0_a[2],
wrd_hi1_a[1], wrd_lo1_a[1], wrd_hi0_a[1],wrd_lo0_a[1],
wrd_hi1_a[0], wrd_lo1_a[0], wrd_hi0_a[0],wrd_lo0_a[0]} = data[19:0];



wire [79:0] worden_data;
wire [19:0] worden_lo0;
wire [19:0] worden_hi0;
wire [18:0] worden_lo1;
wire [18:0] worden_hi1;


assign worden_data[19:0] = 
{spare_word_enable[0],  worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0]};

assign worden_data[39:20] = {
	      worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0], worden_c4[3]};


assign worden_data[59:40] = {
              worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0], worden_c4[3]};

assign worden_data[79:60] = {
                            worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0], worden_c4[3],spare_word_enable[1]};

reg	[79:0] worden_shift;



always@(cred_mod or worden_data or wen_c4 or coloff_c4)
begin
if (wen_c4 & coloff_c4)
begin
if (~cred_mod[0]) begin
 worden_shift[0] = worden_data[0];
end

for(i=0; i<18; i=i+1)
begin
  worden_shift[i+1] = cred_mod[i] ? worden_data[i] : ~cred_mod[i+1] ? worden_data[i+1] : 1'b0;
end

worden_shift[19] = cred_mod[18] ? worden_data[18] : cred_mod[20] ? worden_data[20] : 1'b0;

for(i=21;i<40;i=i+1)
begin 
 worden_shift[i-1]  = cred_mod[i] ? worden_data[i] : ~cred_mod[i-1] ? worden_data[i-1] : 1'b0;
end


if (~cred_mod[39]) begin
 worden_shift[39] = worden_data[39];
end

if (~cred_mod[40]) begin
 worden_shift[40] = worden_data[40];
end

for(i=40;i<59;i=i+1)
begin
  worden_shift[i+1] = cred_mod[i] ? worden_data[i] : ~cred_mod[i+1] ? worden_data[i+1] : 1'b0;
end

worden_shift[60] = cred_mod[59] ? worden_data[59] : cred_mod[61] ? worden_data[61] : 1'b0;

for(i=62;i<80;i=i+1)
begin
  worden_shift[i-1]  = cred_mod[i] ? worden_data[i] : ~cred_mod[i-1] ? worden_data[i-1] : 1'b0;
end

if (~cred_mod[79]) begin
 worden_shift[79] = worden_data[79];
end 

end
else worden_shift[79:0] = 80'b0;

end
 
 
assign { worden_hi0[19], worden_lo0[19],
worden_hi1[18], worden_lo1[18], worden_hi0[18],worden_lo0[18],
worden_hi1[17], worden_lo1[17], worden_hi0[17],worden_lo0[17],
worden_hi1[16], worden_lo1[16], worden_hi0[16],worden_lo0[16],
worden_hi1[15], worden_lo1[15], worden_hi0[15],worden_lo0[15], 
worden_hi1[14],spare_word_enable[1]} = worden_shift[79:60];

assign {
worden_lo1[14], worden_hi0[14],worden_lo0[14],
worden_hi1[13], worden_lo1[13], worden_hi0[13],worden_lo0[13],
worden_hi1[12], worden_lo1[12], worden_hi0[12],worden_lo0[12],
worden_hi1[11], worden_lo1[11], worden_hi0[11],worden_lo0[11],
worden_hi1[10], worden_lo1[10], worden_hi0[10],worden_lo0[10],worden_hi1[9]} = worden_shift[59:40];

assign {
worden_lo1[9], worden_hi0[9],worden_lo0[9],
worden_hi1[8], worden_lo1[8], worden_hi0[8],worden_lo0[8],
worden_hi1[7], worden_lo1[7], worden_hi0[7],worden_lo0[7],
worden_hi1[6], worden_lo1[6], worden_hi0[6],worden_lo0[6],
worden_hi1[5], worden_lo1[5], worden_hi0[5],worden_lo0[5], worden_hi1[4]} = worden_shift[39:20];

assign {
spare_word_enable[0],   worden_lo1[4], worden_hi0[4],worden_lo0[4],
worden_hi1[3], worden_lo1[3], worden_hi0[3],worden_lo0[3],
worden_hi1[2], worden_lo1[2], worden_hi0[2],worden_lo0[2],
worden_hi1[1], worden_lo1[1], worden_hi0[1],worden_lo0[1],
worden_hi1[0], worden_lo1[0], worden_hi0[0],worden_lo0[0]} = worden_shift[19:0];


















always@(l1clk or wen_c4 or set_c4 or waysel_c4 or  waysel_err_c4 or worden_c4 or wrd_lo0_a or 
	wrd_hi0_a or wrd_lo1_a or wrd_hi1_a or coloff_c4 or bank_select  or wr_spare_0 or 
	wr_spare_1 or wee_l or worden_hi0 or worden_lo0 or worden_lo1 or worden_hi1 or spare_word_enable
        or vnw_ary)
begin

////////////////////////////////////////////////////////////////
// Read all entries for a given set 
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
//  Write data computation
////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////
// Write to memory
//////////////////////////////////////////////////////////////



    #0


//if(wen_c4  & ~waysel_err_c4 & bank_select & coloff_c4 & (|worden_c4))
if(~l1clk & wee_l & wen_c4  & ~waysel_err_c4 & bank_select & coloff_c4 & (|worden_c4) & vnw_ary)
begin
	if(waysel_c4[0])
	begin
	mem_lo0_way0[set_c4]   = (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way0[set_c4]);
	mem_hi0_way0[set_c4]   = (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way0[set_c4]);
	mem_lo1_way0[set_c4]   = (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way0[set_c4]);
	mem_hi1_way0[set_c4]   = (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way0[set_c4]);
	mem_way0_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way0_spare_0[set_c4]);
	mem_way0_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way0_spare_1[set_c4]);
	end
	else if(waysel_c4[1])
	begin
	mem_lo0_way1[set_c4]   =  (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way1[set_c4]);
	mem_hi0_way1[set_c4]   =  (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way1[set_c4]);
	mem_lo1_way1[set_c4]   =  (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way1[set_c4]);
	mem_hi1_way1[set_c4]   =  (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way1[set_c4]);
	mem_way1_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way1_spare_0[set_c4]);
	mem_way1_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way1_spare_1[set_c4]);
	end
	else if(waysel_c4[2])
	begin
	mem_lo0_way2[set_c4]   =  (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way2[set_c4]);
	mem_lo1_way2[set_c4]   =  (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way2[set_c4]);
	mem_hi0_way2[set_c4]   =  (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way2[set_c4]);
	mem_hi1_way2[set_c4]   =  (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way2[set_c4]);
	mem_way2_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way2_spare_0[set_c4]);
	mem_way2_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way2_spare_1[set_c4]);
	end
	else if(waysel_c4[3])
	begin
	mem_lo0_way3[set_c4]   = (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way3[set_c4]);
	mem_lo1_way3[set_c4]   = (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way3[set_c4]);
	mem_hi0_way3[set_c4]   = (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way3[set_c4]);
	mem_hi1_way3[set_c4]   = (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way3[set_c4]);
	mem_way3_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way3_spare_0[set_c4]);
	mem_way3_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way3_spare_1[set_c4]);
	end
	else if(waysel_c4[4])
	begin
	mem_lo0_way4[set_c4]   = (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way4[set_c4]);
	mem_lo1_way4[set_c4]   = (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way4[set_c4]);
	mem_hi0_way4[set_c4]   = (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way4[set_c4]);
	mem_hi1_way4[set_c4]   = (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way4[set_c4]);
	mem_way4_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way4_spare_0[set_c4]);
	mem_way4_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way4_spare_1[set_c4]);
	end
	else if(waysel_c4[5])
	begin
	mem_lo0_way5[set_c4]   =(worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way5[set_c4]);
	mem_lo1_way5[set_c4]   =(worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way5[set_c4]);
	mem_hi0_way5[set_c4]   =(worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way5[set_c4]);
	mem_hi1_way5[set_c4]   =(worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way5[set_c4]);
	mem_way5_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way5_spare_0[set_c4]);
	mem_way5_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way5_spare_1[set_c4]);
	end
	else if(waysel_c4[6])
	begin
	mem_lo0_way6[set_c4]   =(worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way6[set_c4]);
	mem_lo1_way6[set_c4]   =(worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way6[set_c4]);
	mem_hi0_way6[set_c4]   =(worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way6[set_c4]);
	mem_hi1_way6[set_c4]   =(worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way6[set_c4]);
	mem_way6_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way6_spare_0[set_c4]);
	mem_way6_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way6_spare_1[set_c4]);
	end
	else if(waysel_c4[7])
	begin
	mem_lo0_way7[set_c4]   =(worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way7[set_c4]);
	mem_lo1_way7[set_c4]   =(worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way7[set_c4]);
	mem_hi0_way7[set_c4]   =(worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way7[set_c4]);
	mem_hi1_way7[set_c4]   =(worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way7[set_c4]);
	mem_way7_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way7_spare_0[set_c4]);
	mem_way7_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way7_spare_1[set_c4]);
	end
  end
end

//always@(waysel_c4 or set_c4 or bnken_lat )
always@(waysel_c4 or set_c4 or coloff_c4_l or vnw_ary)

begin


    #0

if(~coloff_c4_l & vnw_ary)
begin
	if(waysel_c4[0])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way0[set_c4];
		saout_lo1_bc[18:0]	<=	mem_lo1_way0[set_c4];
		saout_hi0_bc[19:0]	<=	mem_hi0_way0[set_c4];
		saout_hi1_bc[18:0]	<=	mem_hi1_way0[set_c4];
 		rd_spare_0		<=	mem_way0_spare_0[set_c4];
 		rd_spare_1		<=	mem_way0_spare_1[set_c4];
		end
	else if(waysel_c4[1])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way1[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way1[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way1[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way1[set_c4];	
 		rd_spare_0		<=	mem_way1_spare_0[set_c4];
 		rd_spare_1		<=	mem_way1_spare_1[set_c4];
		end
	else if(waysel_c4[2])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way2[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way2[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way2[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way2[set_c4];	
 		rd_spare_0		<=	mem_way2_spare_0[set_c4];
 		rd_spare_1		<=	mem_way2_spare_1[set_c4];
		end
	else if(waysel_c4[3])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way3[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way3[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way3[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way3[set_c4];	
 		rd_spare_0		<=	mem_way3_spare_0[set_c4];
 		rd_spare_1		<=	mem_way3_spare_1[set_c4];
		end
	else if(waysel_c4[4])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way4[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way4[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way4[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way4[set_c4];	
 		rd_spare_0		<=	mem_way4_spare_0[set_c4];
 		rd_spare_1		<=	mem_way4_spare_1[set_c4];
		end
	else if(waysel_c4[5])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way5[set_c4];
		saout_lo1_bc[18:0]	<=	mem_lo1_way5[set_c4];
		saout_hi0_bc[19:0]	<=	mem_hi0_way5[set_c4];
		saout_hi1_bc[18:0]	<=	mem_hi1_way5[set_c4];
 		rd_spare_0		<=	mem_way5_spare_0[set_c4];
 		rd_spare_1		<=	mem_way5_spare_1[set_c4];
		end
	else if(waysel_c4[6])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way6[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way6[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way6[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way6[set_c4];	
 		rd_spare_0		<=	mem_way6_spare_0[set_c4];
 		rd_spare_1		<=	mem_way6_spare_1[set_c4];
		end
	else if(waysel_c4[7])
		begin
	        saout_lo0_bc[19:0]    	<=	mem_lo0_way7[set_c4];      
	        saout_lo1_bc[18:0]    	<=	mem_lo1_way7[set_c4];      
	        saout_hi0_bc[19:0]    	<=	mem_hi0_way7[set_c4];      
	        saout_hi1_bc[18:0]    	<=	mem_hi1_way7[set_c4];      
 		rd_spare_0		<=	mem_way7_spare_0[set_c4];
 		rd_spare_1		<=	mem_way7_spare_1[set_c4];
		end
end
end


// READ
// Data is read out of the above array in c4 and gets registered and latched
// to become a c5b signal which gets muxed and goes to dmux


reg rd_spare_0_d_l,rd_spare_1_d_l;
reg rdd_spare_0,rdd_spare_1;
reg tstmodclk_c3b_l;
always@(posedge l1clk)
begin
	saout_lo0_bc_d_l[19:0] <= ~saout_lo0_bc[19:0];
	saout_lo1_bc_d_l[18:0] <= ~saout_lo1_bc[18:0];
	saout_hi0_bc_d_l[19:0] <= ~saout_hi0_bc[19:0];
	saout_hi1_bc_d_l[18:0] <= ~saout_hi1_bc[18:0];
	rd_spare_0_d_l         <= ~rd_spare_0;
	rd_spare_1_d_l         <= ~rd_spare_1;
end

always@(negedge l1clk)
begin
        saout_lo0_bc_c5b_l[19:0] <= saout_lo0_bc_d_l[19:0];
        saout_lo1_bc_c5b_l[18:0] <= saout_lo1_bc_d_l[18:0];
        saout_hi0_bc_c5b_l[19:0] <= saout_hi0_bc_d_l[19:0];
        saout_hi1_bc_c5b_l[18:0] <= saout_hi1_bc_d_l[18:0];
	rdd_spare_0		 <= rd_spare_0_d_l;
	rdd_spare_1		 <= rd_spare_1_d_l;
	tstmodclk_c3b_l		 <= tstmodclk_l;
end


assign rd_data[19:0] =
	{rdd_spare_0,      saout_lo1_bc_c5b_l[4], saout_hi0_bc_c5b_l[4],saout_lo0_bc_c5b_l[4],
	saout_hi1_bc_c5b_l[3], saout_lo1_bc_c5b_l[3], saout_hi0_bc_c5b_l[3],saout_lo0_bc_c5b_l[3],
	saout_hi1_bc_c5b_l[2], saout_lo1_bc_c5b_l[2], saout_hi0_bc_c5b_l[2],saout_lo0_bc_c5b_l[2],
	saout_hi1_bc_c5b_l[1], saout_lo1_bc_c5b_l[1], saout_hi0_bc_c5b_l[1],saout_lo0_bc_c5b_l[1],
	saout_hi1_bc_c5b_l[0], saout_lo1_bc_c5b_l[0], saout_hi0_bc_c5b_l[0],saout_lo0_bc_c5b_l[0]};

	assign rd_data[39:20] = {
			  saout_lo1_bc_c5b_l[9], saout_hi0_bc_c5b_l[9],saout_lo0_bc_c5b_l[9],
	saout_hi1_bc_c5b_l[8], saout_lo1_bc_c5b_l[8], saout_hi0_bc_c5b_l[8],saout_lo0_bc_c5b_l[8],
	saout_hi1_bc_c5b_l[7], saout_lo1_bc_c5b_l[7], saout_hi0_bc_c5b_l[7],saout_lo0_bc_c5b_l[7],
	saout_hi1_bc_c5b_l[6], saout_lo1_bc_c5b_l[6], saout_hi0_bc_c5b_l[6],saout_lo0_bc_c5b_l[6],
	saout_hi1_bc_c5b_l[5], saout_lo1_bc_c5b_l[5], saout_hi0_bc_c5b_l[5],saout_lo0_bc_c5b_l[5], saout_hi1_bc_c5b_l[4]};


	assign rd_data[59:40] = {
	saout_lo1_bc_c5b_l[14], saout_hi0_bc_c5b_l[14],saout_lo0_bc_c5b_l[14],
	saout_hi1_bc_c5b_l[13], saout_lo1_bc_c5b_l[13], saout_hi0_bc_c5b_l[13],saout_lo0_bc_c5b_l[13],
	saout_hi1_bc_c5b_l[12], saout_lo1_bc_c5b_l[12], saout_hi0_bc_c5b_l[12],saout_lo0_bc_c5b_l[12],
	saout_hi1_bc_c5b_l[11], saout_lo1_bc_c5b_l[11], saout_hi0_bc_c5b_l[11],saout_lo0_bc_c5b_l[11],
	saout_hi1_bc_c5b_l[10], saout_lo1_bc_c5b_l[10], saout_hi0_bc_c5b_l[10],saout_lo0_bc_c5b_l[10], saout_hi1_bc_c5b_l[9]};

	assign rd_data[79:60] = {
	saout_hi0_bc_c5b_l[19], saout_lo0_bc_c5b_l[19],
	saout_hi1_bc_c5b_l[18], saout_lo1_bc_c5b_l[18], saout_hi0_bc_c5b_l[18],saout_lo0_bc_c5b_l[18],
	saout_hi1_bc_c5b_l[17], saout_lo1_bc_c5b_l[17], saout_hi0_bc_c5b_l[17],saout_lo0_bc_c5b_l[17],
	saout_hi1_bc_c5b_l[16], saout_lo1_bc_c5b_l[16], saout_hi0_bc_c5b_l[16],saout_lo0_bc_c5b_l[16],
	saout_hi1_bc_c5b_l[15], saout_lo1_bc_c5b_l[15], saout_hi0_bc_c5b_l[15],saout_lo0_bc_c5b_l[15], saout_hi1_bc_c5b_l[14],rdd_spare_1};


	always@(cred_mod or rd_data)
	begin
	
	for(i=0;i<19;i=i+1)
	begin
	read_data[i] = cred_mod[i] ? rd_data[i+1] : rd_data[i];
        end
	
	for(i=20;i<40;i=i+1)
        begin
	read_data[i] = cred_mod[i] ? rd_data[i-1] : rd_data[i];
        end
	

	for(i=40;i<60;i=i+1)
	 begin
	 read_data[i] = cred_mod[i] ? rd_data[i+1] : rd_data[i];
         end
	 
	for(i=61;i<80;i=i+1)
         begin
	 read_data[i] = cred_mod[i] ? rd_data[i-1] : rd_data[i];
         end
	
	end 



	assign { saout_hi0_b_out_l[19], saout_lo0_b_out_l[19],
        saout_hi1_b_out_l[18], saout_lo1_b_out_l[18], saout_hi0_b_out_l[18],saout_lo0_b_out_l[18],
        saout_hi1_b_out_l[17], saout_lo1_b_out_l[17], saout_hi0_b_out_l[17],saout_lo0_b_out_l[17],
        saout_hi1_b_out_l[16], saout_lo1_b_out_l[16], saout_hi0_b_out_l[16],saout_lo0_b_out_l[16],
        saout_hi1_b_out_l[15], saout_lo1_b_out_l[15], saout_hi0_b_out_l[15],saout_lo0_b_out_l[15], 
	saout_hi1_b_out_l[14]} = read_data[79:61];
         
        assign {saout_lo1_b_out_l[14], saout_hi0_b_out_l[14],saout_lo0_b_out_l[14],
        saout_hi1_b_out_l[13], saout_lo1_b_out_l[13], saout_hi0_b_out_l[13],saout_lo0_b_out_l[13],
        saout_hi1_b_out_l[12], saout_lo1_b_out_l[12], saout_hi0_b_out_l[12],saout_lo0_b_out_l[12],
        saout_hi1_b_out_l[11], saout_lo1_b_out_l[11], saout_hi0_b_out_l[11],saout_lo0_b_out_l[11],
        saout_hi1_b_out_l[10], saout_lo1_b_out_l[10], saout_hi0_b_out_l[10],saout_lo0_b_out_l[10], 
	saout_hi1_b_out_l[9]} = read_data[59:40];

        assign { saout_lo1_b_out_l[9], saout_hi0_b_out_l[9],saout_lo0_b_out_l[9],
        saout_hi1_b_out_l[8], saout_lo1_b_out_l[8], saout_hi0_b_out_l[8],saout_lo0_b_out_l[8],
        saout_hi1_b_out_l[7], saout_lo1_b_out_l[7], saout_hi0_b_out_l[7],saout_lo0_b_out_l[7],
        saout_hi1_b_out_l[6], saout_lo1_b_out_l[6], saout_hi0_b_out_l[6],saout_lo0_b_out_l[6],
        saout_hi1_b_out_l[5], saout_lo1_b_out_l[5], saout_hi0_b_out_l[5],saout_lo0_b_out_l[5], 
	saout_hi1_b_out_l[4]} = read_data[39:20];

        assign {saout_lo1_b_out_l[4], saout_hi0_b_out_l[4],saout_lo0_b_out_l[4],
        saout_hi1_b_out_l[3], saout_lo1_b_out_l[3], saout_hi0_b_out_l[3],saout_lo0_b_out_l[3],
        saout_hi1_b_out_l[2], saout_lo1_b_out_l[2], saout_hi0_b_out_l[2],saout_lo0_b_out_l[2],
        saout_hi1_b_out_l[1], saout_lo1_b_out_l[1], saout_hi0_b_out_l[1],saout_lo0_b_out_l[1],
        saout_hi1_b_out_l[0], saout_lo1_b_out_l[0], saout_hi0_b_out_l[0],saout_lo0_b_out_l[0]} = read_data[18:0];

assign red_sel_rgt = |cred[19:18];
assign red_sel_lft = |cred[59:58];

assign coloff_c5_rgt[1] = coloff_c5[1] | red_sel_rgt & coloff_c5[0];
assign coloff_c5_rgt[0] = coloff_c5[0] | red_sel_rgt & coloff_c5[1];
assign coloff_c5_lft[1] = coloff_c5[1] | red_sel_lft & coloff_c5[0];
assign coloff_c5_lft[0] = coloff_c5[0] | red_sel_lft & coloff_c5[1];







 



always@(negedge l1clk)
begin
select_read_data_all_c5b <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5) & (|coloff_c5) & readen_c5 & wee_l & ~waysel_err_c4);
select_read_red_all_c5b  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5) & (|coloff_c5) & readen_c5 & wee_l & ~waysel_err_c4);
 
select_read_data_c5b_hi_rgt <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_rgt[1] & ~waysel_err_c5);
select_read_data_c5b_hi_lft <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_lft[1] & ~waysel_err_c5);
select_read_data_c5b_lo_rgt <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_rgt[0] & ~waysel_err_c5);
select_read_data_c5b_lo_lft <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_lft[0] & ~waysel_err_c5);
select_read_red_c5b_hi_rgt  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_rgt[1] & ~waysel_err_c5);
select_read_red_c5b_hi_lft  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_lft[1] & ~waysel_err_c5);
select_read_red_c5b_lo_rgt  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_rgt[0] & ~waysel_err_c5);
select_read_red_c5b_lo_lft  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_lft[0] & ~waysel_err_c5);
end


//assign saout_lo0_bc_l[19:0] = select_read_data_c5b ? saout_lo0_bc_c5b_l[19:0] : 
//			      select_read_red_c5b ? red_lo0_out[19:0] : 20'hFFFFF;
//assign saout_lo1_bc_l[18:0] = select_read_data_c5b ? saout_lo1_bc_c5b_l[18:0] : 
//			      select_read_red_c5b ? red_lo1_out[18:0] : 19'h7FFFF;
//assign saout_hi0_bc_l[19:0] = select_read_data_c5b ? saout_hi0_bc_c5b_l[19:0] : 
//			      select_read_red_c5b ? red_hi0_out[19:0] : 20'hFFFFF;
//assign saout_hi1_bc_l[18:0] = select_read_data_c5b ? saout_hi1_bc_c5b_l[18:0] : 
//			      select_read_red_c5b ? red_hi1_out[18:0] : 19'h7FFFF;
//
always@(select_read_red_c5b_lo_rgt or select_read_red_c5b_lo_lft or select_read_red_c5b_hi_rgt or select_read_red_c5b_hi_lft or
	select_read_data_c5b_lo_rgt or select_read_data_c5b_lo_lft or select_read_data_c5b_hi_rgt or select_read_data_c5b_hi_lft
      or red_lo0_b_out_l or red_hi0_b_out_l or red_lo1_b_out_l or saout_hi1_b_out_l 
      or saout_lo0_b_out_l or red_hi0_b_out_l or saout_lo1_b_out_l or saout_hi1_b_out_l or tstmodclk_c3b_l or l1clk)
begin

if(tstmodclk_c3b_l)
begin
saout_lo0_bc_l[9:0]   = select_read_red_c5b_lo_rgt  ? red_lo0_b_out_l[9:0]     : 
		      select_read_data_c5b_lo_rgt ? saout_lo0_b_out_l[9:0]   : 10'h3FF;
saout_lo0_bc_l[19:10] = select_read_red_c5b_lo_lft  ? red_lo0_b_out_l[19:10]   : 
		      select_read_data_c5b_lo_lft ? saout_lo0_b_out_l[19:10] : 10'h3FF;
saout_hi0_bc_l[9:0]   = select_read_red_c5b_lo_rgt  ? red_hi0_b_out_l[9:0]     : 
		      select_read_data_c5b_lo_rgt ? saout_hi0_b_out_l[9:0]   : 10'h3FF;
saout_hi0_bc_l[19:10] = select_read_red_c5b_lo_lft  ? red_hi0_b_out_l[19:10]   : 
		      select_read_data_c5b_lo_lft ? saout_hi0_b_out_l[19:10] : 10'h3FF;
saout_lo1_bc_l[9:0]   = select_read_red_c5b_hi_rgt  ? red_lo1_b_out_l[9:0]     : 
		      select_read_data_c5b_hi_rgt ? saout_lo1_b_out_l[9:0]   : 10'h3FF;
saout_lo1_bc_l[18:10] = select_read_red_c5b_hi_lft  ? red_lo1_b_out_l[18:10]   : 
		      select_read_data_c5b_hi_lft ? saout_lo1_b_out_l[18:10] : 9'h1FF;
saout_hi1_bc_l[8:0]   = select_read_red_c5b_hi_rgt  ? red_hi1_b_out_l[8:0]     : 
		      select_read_data_c5b_hi_rgt ? saout_hi1_b_out_l[8:0]   : 9'h1FF;
saout_hi1_bc_l[18:9]  = select_read_red_c5b_hi_lft  ? red_hi1_b_out_l[18:9]    : 
		      select_read_data_c5b_hi_lft ? saout_hi1_b_out_l[18:9]  : 10'h3FF;
end
else
begin
saout_lo0_bc_l[19:0] = select_read_red_all_c5b  ? red_lo0_b_out_l[19:0]   : 
 		       select_read_data_all_c5b ? saout_lo0_b_out_l[19:0] : 20'bx;
saout_hi0_bc_l[19:0] = select_read_red_all_c5b  ? red_hi0_b_out_l[19:0]   : 
 		       select_read_data_all_c5b ? saout_hi0_b_out_l[19:0] : 20'bx;
saout_lo1_bc_l[18:0] = select_read_red_all_c5b  ? red_lo1_b_out_l[18:0]   : 
 		       select_read_data_all_c5b ? saout_lo1_b_out_l[18:0] : 19'bx;
saout_hi1_bc_l[18:0] = select_read_red_all_c5b  ? red_hi1_b_out_l[18:0]   : 
		       select_read_data_all_c5b ? saout_hi1_b_out_l[18:0] : 19'bx;
		       
//saout_lo0_bc_l[19:0] = select_read_data_all_c5b ? saout_lo0_bc_c5b_l[19:0] : 20'hFFFFF;
//saout_lo1_bc_l[18:0] = select_read_data_all_c5b ? saout_lo1_bc_c5b_l[18:0] : 19'hFFFFF;
//saout_hi0_bc_l[19:0] = select_read_data_all_c5b ? saout_hi0_bc_c5b_l[19:0] : 20'hFFFFF;
//saout_hi1_bc_l[18:0] = select_read_data_all_c5b ? saout_hi1_bc_c5b_l[18:0] : 19'hFFFFF;
end
end


//assign repair_saout_lo0_bc_l[9:0]   = 
//select_read_red_c5b_lo_rgt  ? red_lo0_b_out_l[9:0]     : select_read_data_c5b_lo_rgt ? saout_lo0_b_out_l[9:0]   : 10'h3FF ;
//assign repair_saout_lo0_bc_l[19:10] = 
//select_read_red_c5b_lo_lft  ? red_lo0_b_out_l[19:10]   : select_read_data_c5b_lo_lft ? saout_lo0_b_out_l[19:10] : 10'h3FF ;
//assign repair_saout_hi0_bc_l[9:0]   = 
//select_read_red_c5b_lo_rgt  ? red_hi0_b_out_l[9:0]     : select_read_data_c5b_lo_rgt ? saout_hi0_b_out_l[9:0]   : 10'h3FF ;
//assign repair_saout_hi0_bc_l[19:10] = 
//select_read_red_c5b_lo_lft  ? red_hi0_b_out_l[19:10]   : select_read_data_c5b_lo_lft ? saout_hi0_b_out_l[19:10] : 10'h3FF ;
//assign repair_saout_lo1_bc_l[9:0]   = 
//select_read_red_c5b_hi_rgt  ? red_lo1_b_out_l[9:0]     : select_read_data_c5b_hi_rgt ? saout_lo1_b_out_l[9:0]   : 10'h3FF ;
//assign repair_saout_lo1_bc_l[18:10] = 
//select_read_red_c5b_hi_lft  ? red_lo1_b_out_l[18:10]   : select_read_data_c5b_hi_lft ? saout_lo1_b_out_l[18:10] : 9'h1FF ;
//assign repair_saout_hi1_bc_l[8:0]   = 
//select_read_red_c5b_hi_rgt  ? red_hi1_b_out_l[8:0]     : select_read_data_c5b_hi_rgt ? saout_hi1_b_out_l[8:0]   : 9'h1FF ;
//assign repair_saout_hi1_bc_l[18:9]  = 
//select_read_red_c5b_hi_lft  ? red_hi1_b_out_l[18:9]    : select_read_data_c5b_hi_lft ? saout_hi1_b_out_l[18:9]  : 10'h3FF ;
//
//
//assign norepair_saout_lo0_bc_l[19:0] = select_read_data_all_c5b ? saout_lo0_bc_c5b_l[19:0] : 20'hFFFFF;
//assign norepair_saout_lo1_bc_l[18:0] = select_read_data_all_c5b ? saout_lo1_bc_c5b_l[18:0] : 19'hFFFFF;
//assign norepair_saout_hi0_bc_l[19:0] = select_read_data_all_c5b ? saout_hi0_bc_c5b_l[19:0] : 20'hFFFFF;
//assign norepair_saout_hi1_bc_l[18:0] = select_read_data_all_c5b ? saout_hi1_bc_c5b_l[18:0] : 19'hFFFFF;
//
//`endif
//
//`ifdef AXIS_SMEM
//
//	always@(negedge l1clk)  
//	begin
//        axis_saout_lo0_bc[19:0]  = saout_lo0_bc[19:0];
//        axis_saout_lo1_bc[18:0]  = saout_lo1_bc[18:0];
//        axis_saout_hi0_bc[19:0]  = saout_hi0_bc[19:0];
//        axis_saout_hi1_bc[18:0]  = saout_hi1_bc[18:0];
//	end
//	assign saout_lo0_bc_l[19:0] = axis_select_read_data_c5b ? axis_saout_lo0_bc[19:0] : 20'hFFFFF;
//	assign saout_lo1_bc_l[18:0] = axis_select_read_data_c5b ? axis_saout_lo1_bc[18:0] : 19'h7FFFF;
//	assign saout_hi0_bc_l[19:0] = axis_select_read_data_c5b ? axis_saout_hi0_bc[19:0] : 20'hFFFFF;
//	assign saout_hi1_bc_l[18:0] = axis_select_read_data_c5b ? axis_saout_hi1_bc[18:0] : 19'h7FFFF;
//
//`else
//assign saout_lo0_bc_l[19:0] = ~tstmodclk_c3b_l ? repair_saout_lo0_bc_l[19:0] : norepair_saout_lo0_bc_l[19:0];
//assign saout_lo1_bc_l[18:0] = ~tstmodclk_c3b_l ? repair_saout_lo1_bc_l[18:0] : norepair_saout_lo1_bc_l[18:0];
//assign saout_hi0_bc_l[19:0] = ~tstmodclk_c3b_l ? repair_saout_hi0_bc_l[19:0] : norepair_saout_hi0_bc_l[19:0];
//assign saout_hi1_bc_l[18:0] = ~tstmodclk_c3b_l ? repair_saout_hi1_bc_l[18:0] : norepair_saout_hi1_bc_l[18:0];

///////////////////////////////////////////////////////////////////////////////////////////////

// REDUDANCY

reg [19:0]    red_lo0_odd_0;         
reg [18:0]    red_lo1_odd_0;         
reg [19:0]    red_hi0_odd_0;         
reg [18:0]    red_hi1_odd_0;         
reg [19:0]    red_lo0_even_0;
reg [18:0]    red_lo1_even_0;
reg [19:0]    red_hi0_even_0;
reg [18:0]    red_hi1_even_0;
reg	      redrow_way0_spare_odd_0;
reg	      redrow_way0_spare_even_0;
reg	      redrow_way0_spare_odd_1;
reg	      redrow_way0_spare_even_1;

reg [19:0]    red_lo0_odd_1;
reg [18:0]    red_lo1_odd_1;
reg [19:0]    red_hi0_odd_1;
reg [18:0]    red_hi1_odd_1;
reg [19:0]    red_lo0_even_1;
reg [18:0]    red_lo1_even_1;
reg [19:0]    red_hi0_even_1;
reg [18:0]    red_hi1_even_1;
reg	      redrow_way1_spare_odd_0;
reg	      redrow_way1_spare_even_0;
reg	      redrow_way1_spare_odd_1;
reg	      redrow_way1_spare_even_1;

reg [19:0]    red_lo0_odd_2;
reg [18:0]    red_lo1_odd_2;
reg [19:0]    red_hi0_odd_2;
reg [18:0]    red_hi1_odd_2;
reg [19:0]    red_lo0_even_2;
reg [18:0]    red_lo1_even_2;
reg [19:0]    red_hi0_even_2;
reg [18:0]    red_hi1_even_2;
reg	      redrow_way2_spare_odd_0;
reg	      redrow_way2_spare_even_0;
reg	      redrow_way2_spare_odd_1;
reg	      redrow_way2_spare_even_1;

reg [19:0]    red_lo0_odd_3;
reg [18:0]    red_lo1_odd_3;
reg [19:0]    red_hi0_odd_3;
reg [18:0]    red_hi1_odd_3;
reg [19:0]    red_lo0_even_3;
reg [18:0]    red_lo1_even_3;
reg [19:0]    red_hi0_even_3;
reg [18:0]    red_hi1_even_3;
reg	      redrow_way3_spare_odd_0;
reg	      redrow_way3_spare_even_0;
reg	      redrow_way3_spare_odd_1;
reg	      redrow_way3_spare_even_1;

reg [19:0]    red_lo0_odd_4;
reg [18:0]    red_lo1_odd_4;
reg [19:0]    red_hi0_odd_4;
reg [18:0]    red_hi1_odd_4;
reg [19:0]    red_lo0_even_4;
reg [18:0]    red_lo1_even_4;
reg [19:0]    red_hi0_even_4;
reg [18:0]    red_hi1_even_4;
reg	      redrow_way4_spare_odd_0;
reg	      redrow_way4_spare_even_0;
reg	      redrow_way4_spare_odd_1;
reg	      redrow_way4_spare_even_1;

reg [19:0]    red_lo0_odd_5;
reg [18:0]    red_lo1_odd_5;
reg [19:0]    red_hi0_odd_5;
reg [18:0]    red_hi1_odd_5;
reg [19:0]    red_lo0_even_5;
reg [18:0]    red_lo1_even_5;
reg [19:0]    red_hi0_even_5;
reg [18:0]    red_hi1_even_5;
reg	      redrow_way5_spare_odd_0;
reg	      redrow_way5_spare_even_0;
reg	      redrow_way5_spare_odd_1;
reg	      redrow_way5_spare_even_1;

reg [19:0]    red_lo0_odd_6;
reg [18:0]    red_lo1_odd_6;
reg [19:0]    red_hi0_odd_6;
reg [18:0]    red_hi1_odd_6;
reg [19:0]    red_lo0_even_6;
reg [18:0]    red_lo1_even_6;
reg [19:0]    red_hi0_even_6;
reg [18:0]    red_hi1_even_6;
reg	      redrow_way6_spare_odd_0;
reg	      redrow_way6_spare_even_0;
reg	      redrow_way6_spare_odd_1;
reg	      redrow_way6_spare_even_1;

reg [19:0]    red_lo0_odd_7;
reg [18:0]    red_lo1_odd_7;
reg [19:0]    red_hi0_odd_7;
reg [18:0]    red_hi1_odd_7;
reg [19:0]    red_lo0_even_7;
reg [18:0]    red_lo1_even_7;
reg [19:0]    red_hi0_even_7;
reg [18:0]    red_hi1_even_7;
reg	      redrow_way7_spare_odd_0;
reg	      redrow_way7_spare_even_0;
reg	      redrow_way7_spare_odd_1;
reg	      redrow_way7_spare_even_1;



reg [19:0]     red_lo0_out_bc;
reg [18:0]     red_lo1_out_bc;
reg [19:0]     red_hi0_out_bc;
reg [18:0]     red_hi1_out_bc;
reg            redrow_rd_spare_0;
reg            redrow_rd_spare_1;

reg [19:0]     red_lo0_out_bc_d_l;
reg [18:0]     red_lo1_out_bc_d_l;
reg [19:0]     red_hi0_out_bc_d_l;
reg [18:0]     red_hi1_out_bc_d_l;
reg	       redrow_rd_spare_0_d_l;
reg	       redrow_rd_spare_1_d_l;

reg [19:0]     red_lo0_bc_c5b_l;
reg [19:0]     red_hi0_bc_c5b_l;
reg [18:0]     red_lo1_bc_c5b_l;
reg [18:0]     red_hi1_bc_c5b_l;
reg	       redrow_rdd_spare_0;
reg	       redrow_rdd_spare_1;

wire [79:0]    red_rd_data;
reg [79:0]    red_read_data;

// Folloing 2 assigns detects a red index to hit with incoming index
// and assert.  While writing and reading the way info is looked at

assign select_red_odd = (red_adr[9:8] == 2'b11) & (red_adr[7:1] == set_c3b[7:1]) 
				& set_c3b[0]  & red_adr[0];
assign select_red_even = (red_adr[9:8] == 2'b11) & (red_adr[7:1] == set_c3b[7:1]) 
				& ~set_c3b[0] & ~red_adr[0];


always@(wee_l or l1clk or wen_c4 or set_c4 or waysel_c4 or waysel_err_c4 or bank_select or coloff_c4 or worden_c4 or
        select_red_odd or select_red_even or worden_lo0 or worden_hi0 or worden_lo1 or worden_hi1 or wrd_lo0_a
	or wrd_hi0_a or wrd_lo1_a or wrd_hi1_a or wr_spare_0 or wr_spare_1 or spare_word_enable or vnw_ary)
begin
// Odd row to be written
if(~l1clk & wee_l & wen_c4 & select_red_odd & ~waysel_err_c4 & bank_select & coloff_c4 & (|worden_c4) & vnw_ary)
 begin
  if(waysel_c4[0])
  begin  
    red_lo0_odd_0   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_0);
    red_hi0_odd_0   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_0);
    red_lo1_odd_0   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_0);
    red_hi1_odd_0   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_0);
    redrow_way0_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way0_spare_odd_0);
    redrow_way0_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way0_spare_odd_1);
   end
  else if(waysel_c4[1])
  begin
    red_lo0_odd_1   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_1);
    red_hi0_odd_1   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_1);
    red_lo1_odd_1   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_1);
    red_hi1_odd_1   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_1);
    redrow_way1_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way1_spare_odd_0);
    redrow_way1_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way1_spare_odd_1);
  end
  else if(waysel_c4[2])
  begin
    red_lo0_odd_2   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_2);
    red_hi0_odd_2   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_2);
    red_lo1_odd_2   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_2);
    red_hi1_odd_2   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_2);
    redrow_way2_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way2_spare_odd_0);
    redrow_way2_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way2_spare_odd_1);
  end
  else if(waysel_c4[3])
  begin
    red_lo0_odd_3   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_3);
    red_hi0_odd_3   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_3);
    red_lo1_odd_3   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_3);
    red_hi1_odd_3   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_3);
    redrow_way3_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way3_spare_odd_0);
    redrow_way3_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way3_spare_odd_1);
  end
  else if(waysel_c4[4])
  begin
    red_lo0_odd_4   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_4);
    red_hi0_odd_4   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_4);
    red_lo1_odd_4   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_4);
    red_hi1_odd_4   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_4);
    redrow_way4_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way4_spare_odd_0);
    redrow_way4_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way4_spare_odd_1);
  end
  else if(waysel_c4[5])
  begin
    red_lo0_odd_5   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_5);
    red_hi0_odd_5   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_5);
    red_lo1_odd_5   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_5);
    red_hi1_odd_5   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_5);
    redrow_way5_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way5_spare_odd_0);
    redrow_way5_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way5_spare_odd_1);
  end
  else if(waysel_c4[6])
  begin
    red_lo0_odd_6   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_6);
    red_hi0_odd_6   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_6);
    red_lo1_odd_6   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_6);
    red_hi1_odd_6   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_6);
    redrow_way6_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way6_spare_odd_0);
    redrow_way6_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way6_spare_odd_1);
  end
  else if(waysel_c4[7])
  begin
    red_lo0_odd_7   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_7);
    red_hi0_odd_7   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_7);
    red_lo1_odd_7   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_7);
    red_hi1_odd_7   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_7);
    redrow_way7_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way7_spare_odd_0);
    redrow_way7_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way7_spare_odd_1);
   end
  end
 

// Even rows to be written
if(~l1clk & wee_l & wen_c4 & select_red_even & ~waysel_err_c4 & bank_select & coloff_c4 & (|worden_c4) & vnw_ary)
 begin
  if(waysel_c4[0])
  begin
    red_lo0_even_0   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_0);
    red_hi0_even_0   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_0);
    red_lo1_even_0   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_0);
    red_hi1_even_0   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_0);
    redrow_way0_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way0_spare_even_0);
    redrow_way0_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way0_spare_even_1);
   end
  else if(waysel_c4[1])
  begin
    red_lo0_even_1   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_1);
    red_hi0_even_1   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_1);
    red_lo1_even_1   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_1);
    red_hi1_even_1   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_1);
    redrow_way1_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way1_spare_even_0);
    redrow_way1_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way1_spare_even_1);
  end
  else if(waysel_c4[2])
  begin
    red_lo0_even_2   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_2);
    red_hi0_even_2   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_2);
    red_lo1_even_2   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_2);
    red_hi1_even_2   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_2);
    redrow_way2_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way2_spare_even_0);
    redrow_way2_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way2_spare_even_1);
  end
  else if(waysel_c4[3])
  begin
    red_lo0_even_3   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_3);
    red_hi0_even_3   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_3);
    red_lo1_even_3   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_3);
    red_hi1_even_3   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_3);
    redrow_way3_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way3_spare_even_0);
    redrow_way3_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way3_spare_even_1);
  end
  else if(waysel_c4[4])
  begin
    red_lo0_even_4   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_4);
    red_hi0_even_4   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_4);
    red_lo1_even_4   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_4);
    red_hi1_even_4   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_4);
    redrow_way4_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way4_spare_even_0);
    redrow_way4_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way4_spare_even_1);
  end
  else if(waysel_c4[5])
  begin
    red_lo0_even_5   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_5);
    red_hi0_even_5   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_5);
    red_lo1_even_5   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_5);
    red_hi1_even_5   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_5);
    redrow_way5_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way5_spare_even_0);
    redrow_way5_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way5_spare_even_1);
  end
  else if(waysel_c4[6])
  begin
    red_lo0_even_6   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_6);
    red_hi0_even_6   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_6);
    red_lo1_even_6   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_6);
    red_hi1_even_6   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_6);
    redrow_way6_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way6_spare_even_0);
    redrow_way6_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way6_spare_even_1);
  end
  else if(waysel_c4[7])
  begin
    red_lo0_even_7   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_7);
    red_hi0_even_7   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_7);
    red_lo1_even_7   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_7);
    red_hi1_even_7   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_7);
    redrow_way7_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way7_spare_even_0);
    redrow_way7_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way7_spare_even_1);
  end
end
end

// read out
always@(waysel_c4 or coloff_c4_l or set_c4 or vnw_ary)
begin
if(~coloff_c4_l & vnw_ary)
 begin
 if(waysel_c4[0])
     begin
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_0 : red_lo0_even_0;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_0 : red_lo1_even_0;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_0 : red_hi0_even_0;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_0 : red_hi1_even_0;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way0_spare_odd_0 : redrow_way0_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way0_spare_odd_1 : redrow_way0_spare_even_1;	     
     end
 else if(waysel_c4[1])
     begin
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_1 : red_lo0_even_1;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_1 : red_lo1_even_1;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_1 : red_hi0_even_1;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_1 : red_hi1_even_1;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way1_spare_odd_0 : redrow_way1_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way1_spare_odd_1 : redrow_way1_spare_even_1;	     
     end
 else if(waysel_c4[2])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_2 : red_lo0_even_2;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_2 : red_lo1_even_2;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_2 : red_hi0_even_2;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_2 : red_hi1_even_2;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way2_spare_odd_0 : redrow_way2_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way2_spare_odd_1 : redrow_way2_spare_even_1;	     
     end
 else if(waysel_c4[3])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_3 : red_lo0_even_3;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_3 : red_lo1_even_3;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_3 : red_hi0_even_3;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_3 : red_hi1_even_3;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way3_spare_odd_0 : redrow_way3_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way3_spare_odd_1 : redrow_way3_spare_even_1;	     
     end
 else if(waysel_c4[4])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_4 : red_lo0_even_4;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_4 : red_lo1_even_4;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_4 : red_hi0_even_4;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_4 : red_hi1_even_4;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way4_spare_odd_0 : redrow_way4_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way4_spare_odd_1 : redrow_way4_spare_even_1;	     
     end
 else if(waysel_c4[5])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_5 : red_lo0_even_5;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_5 : red_lo1_even_5;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_5 : red_hi0_even_5;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_5 : red_hi1_even_5;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way5_spare_odd_0 : redrow_way5_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way5_spare_odd_1 : redrow_way5_spare_even_1;	     
     end
 else if(waysel_c4[6])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_6 : red_lo0_even_6;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_6 : red_lo1_even_6;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_6 : red_hi0_even_6;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_6 : red_hi1_even_6;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way6_spare_odd_0 : redrow_way6_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way6_spare_odd_1 : redrow_way6_spare_even_1;	     
     end
 else if(waysel_c4[7])
     begin           							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_7 : red_lo0_even_7;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_7 : red_lo1_even_7;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_7 : red_hi0_even_7;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_7 : red_hi1_even_7;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way7_spare_odd_0 : redrow_way7_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way7_spare_odd_1 : redrow_way7_spare_even_1;	
     end
end
end

always@(negedge l1clk)
begin
    red_lo0_out_bc_d_l <= ~red_lo0_out_bc;
    red_hi0_out_bc_d_l <= ~red_hi0_out_bc;
    red_lo1_out_bc_d_l <= ~red_lo1_out_bc;
    red_hi1_out_bc_d_l <= ~red_hi1_out_bc;
    redrow_rd_spare_0_d_l	     <= ~redrow_rd_spare_0;
    redrow_rd_spare_1_d_l	     <= ~redrow_rd_spare_1;	
end

always@(posedge l1clk)
begin
    red_lo0_bc_c5b_l <= red_lo0_out_bc_d_l;
    red_hi0_bc_c5b_l <= red_hi0_out_bc_d_l;
    red_lo1_bc_c5b_l <= red_lo1_out_bc_d_l;
    red_hi1_bc_c5b_l <= red_hi1_out_bc_d_l;
    redrow_rdd_spare_0	 <= redrow_rd_spare_0_d_l;
    redrow_rdd_spare_1	 <= redrow_rd_spare_1_d_l;
end

assign red_rd_data[19:0] =
	{redrow_rdd_spare_0,      red_lo1_bc_c5b_l[4], red_hi0_bc_c5b_l[4],red_lo0_bc_c5b_l[4],
	red_hi1_bc_c5b_l[3], red_lo1_bc_c5b_l[3], red_hi0_bc_c5b_l[3],red_lo0_bc_c5b_l[3],
	red_hi1_bc_c5b_l[2], red_lo1_bc_c5b_l[2], red_hi0_bc_c5b_l[2],red_lo0_bc_c5b_l[2],
	red_hi1_bc_c5b_l[1], red_lo1_bc_c5b_l[1], red_hi0_bc_c5b_l[1],red_lo0_bc_c5b_l[1],
	red_hi1_bc_c5b_l[0], red_lo1_bc_c5b_l[0], red_hi0_bc_c5b_l[0],red_lo0_bc_c5b_l[0]};

	assign red_rd_data[39:20] = {
			  red_lo1_bc_c5b_l[9], red_hi0_bc_c5b_l[9],red_lo0_bc_c5b_l[9],
	red_hi1_bc_c5b_l[8], red_lo1_bc_c5b_l[8], red_hi0_bc_c5b_l[8],red_lo0_bc_c5b_l[8],
	red_hi1_bc_c5b_l[7], red_lo1_bc_c5b_l[7], red_hi0_bc_c5b_l[7],red_lo0_bc_c5b_l[7],
	red_hi1_bc_c5b_l[6], red_lo1_bc_c5b_l[6], red_hi0_bc_c5b_l[6],red_lo0_bc_c5b_l[6],
	red_hi1_bc_c5b_l[5], red_lo1_bc_c5b_l[5], red_hi0_bc_c5b_l[5],red_lo0_bc_c5b_l[5], red_hi1_bc_c5b_l[4]};


	assign red_rd_data[59:40] = {
	red_lo1_bc_c5b_l[14], red_hi0_bc_c5b_l[14],red_lo0_bc_c5b_l[14],
	red_hi1_bc_c5b_l[13], red_lo1_bc_c5b_l[13], red_hi0_bc_c5b_l[13],red_lo0_bc_c5b_l[13],
	red_hi1_bc_c5b_l[12], red_lo1_bc_c5b_l[12], red_hi0_bc_c5b_l[12],red_lo0_bc_c5b_l[12],
	red_hi1_bc_c5b_l[11], red_lo1_bc_c5b_l[11], red_hi0_bc_c5b_l[11],red_lo0_bc_c5b_l[11],
	red_hi1_bc_c5b_l[10], red_lo1_bc_c5b_l[10], red_hi0_bc_c5b_l[10],red_lo0_bc_c5b_l[10], red_hi1_bc_c5b_l[9]};

	assign red_rd_data[79:60] = {
	red_hi0_bc_c5b_l[19], red_lo0_bc_c5b_l[19],
	red_hi1_bc_c5b_l[18], red_lo1_bc_c5b_l[18], red_hi0_bc_c5b_l[18],red_lo0_bc_c5b_l[18],
	red_hi1_bc_c5b_l[17], red_lo1_bc_c5b_l[17], red_hi0_bc_c5b_l[17],red_lo0_bc_c5b_l[17],
	red_hi1_bc_c5b_l[16], red_lo1_bc_c5b_l[16], red_hi0_bc_c5b_l[16],red_lo0_bc_c5b_l[16],
	red_hi1_bc_c5b_l[15], red_lo1_bc_c5b_l[15], red_hi0_bc_c5b_l[15],red_lo0_bc_c5b_l[15], red_hi1_bc_c5b_l[14],redrow_rdd_spare_1};


	always@(cred_mod or red_rd_data)
	begin
	
	for(i=0;i<19;i=i+1)
	begin
	 red_read_data[i] = cred_mod[i] ? red_rd_data[i+1] : red_rd_data[i];
        end
	
	for(i=20;i<40;i=i+1)
        begin
	 red_read_data[i] = cred_mod[i] ? red_rd_data[i-1] : red_rd_data[i];
        end
	

	for(i=40;i<60;i=i+1)
	begin
	 red_read_data[i] = cred_mod[i] ? red_rd_data[i+1] : red_rd_data[i];
        end
	
	for(i=61;i<80;i=i+1)
        begin
	 red_read_data[i] = cred_mod[i] ? red_rd_data[i-1] : red_rd_data[i];
        end
	
	end 



	assign { red_hi0_b_out_l[19], red_lo0_b_out_l[19],
        red_hi1_b_out_l[18], red_lo1_b_out_l[18], red_hi0_b_out_l[18],red_lo0_b_out_l[18],
        red_hi1_b_out_l[17], red_lo1_b_out_l[17], red_hi0_b_out_l[17],red_lo0_b_out_l[17],
        red_hi1_b_out_l[16], red_lo1_b_out_l[16], red_hi0_b_out_l[16],red_lo0_b_out_l[16],
        red_hi1_b_out_l[15], red_lo1_b_out_l[15], red_hi0_b_out_l[15],red_lo0_b_out_l[15], 
	red_hi1_b_out_l[14]} = red_read_data[79:61];
         
        assign {red_lo1_b_out_l[14], red_hi0_b_out_l[14],red_lo0_b_out_l[14],
        red_hi1_b_out_l[13], red_lo1_b_out_l[13], red_hi0_b_out_l[13],red_lo0_b_out_l[13],
        red_hi1_b_out_l[12], red_lo1_b_out_l[12], red_hi0_b_out_l[12],red_lo0_b_out_l[12],
        red_hi1_b_out_l[11], red_lo1_b_out_l[11], red_hi0_b_out_l[11],red_lo0_b_out_l[11],
        red_hi1_b_out_l[10], red_lo1_b_out_l[10], red_hi0_b_out_l[10],red_lo0_b_out_l[10], 
	red_hi1_b_out_l[9]} = red_read_data[59:40];

        assign { red_lo1_b_out_l[9], red_hi0_b_out_l[9],red_lo0_b_out_l[9],
        red_hi1_b_out_l[8], red_lo1_b_out_l[8], red_hi0_b_out_l[8],red_lo0_b_out_l[8],
        red_hi1_b_out_l[7], red_lo1_b_out_l[7], red_hi0_b_out_l[7],red_lo0_b_out_l[7],
        red_hi1_b_out_l[6], red_lo1_b_out_l[6], red_hi0_b_out_l[6],red_lo0_b_out_l[6],
        red_hi1_b_out_l[5], red_lo1_b_out_l[5], red_hi0_b_out_l[5],red_lo0_b_out_l[5], 
	red_hi1_b_out_l[4]} = red_read_data[39:20];

        assign {red_lo1_b_out_l[4], red_hi0_b_out_l[4],red_lo0_b_out_l[4],
        red_hi1_b_out_l[3], red_lo1_b_out_l[3], red_hi0_b_out_l[3],red_lo0_b_out_l[3],
        red_hi1_b_out_l[2], red_lo1_b_out_l[2], red_hi0_b_out_l[2],red_lo0_b_out_l[2],
        red_hi1_b_out_l[1], red_lo1_b_out_l[1], red_hi0_b_out_l[1],red_lo0_b_out_l[1],
        red_hi1_b_out_l[0], red_lo1_b_out_l[0], red_hi0_b_out_l[0],red_lo0_b_out_l[0]} = red_read_data[18:0];


//////////////////////////////////////////////////////////////////////////////
// col redudancy
// hi1, lo1, hi0, lo0

//assign cred_mod_lo0[18:0]  = cred_mod[18:0];
//assign cred_mod_hi0[38:19] = cred_mod[38:19];
//assign cred_mod_lo1[58:39] = cred_mod[58:39];
//assign cred_mod_hi1[77:59] = cred_mod[77:59];

// mux 0+1
// mux 19 spare
// mux 18 and spare
// mux 38 and 37 
// mux 77  




endmodule


module n2_l2d_dmux78_cust (
  waysel_c3, 
  set_c3, 
  coloff_c3, 
  coloff_c4_l, 
  rd_wr_c3, 
  worden_c3, 
  l2clk, 
  tcu_pce_ov, 
  tcu_pce, 
  se, 
  tcu_clk_stop, 
  waysel_top_c4, 
  waysel_bot_c4, 
  set_top_c3b, 
  set_bot_c3b, 
  coloff_top_c3b_l, 
  coloff_bot_c3b_l, 
  writeen_top_c3b, 
  writeen_bot_c3b, 
  l1clk, 
  worden_top_c3b, 
  worden_bot_c3b, 
  sat_lo0_bc_l, 
  sat_hi0_bc_l, 
  sat_lo1_bc_l, 
  sat_hi1_bc_l, 
  sab_lo0_bc_l, 
  sab_hi0_bc_l, 
  sab_lo1_bc_l, 
  sab_hi1_bc_l, 
  ldin0lo_b, 
  ldin0hi_b, 
  ldin1lo_b, 
  ldin1hi_b, 
  ldout0lo_b, 
  ldout0hi_b, 
  ldout1lo_b, 
  ldout1hi_b, 
  red_d_in_00, 
  red_d_out_00, 
  fuse_l2d_rid_00, 
  fuse_l2d_wren_00, 
  fuse_l2d_reset_00_l, 
  sel_quad_00, 
  red_d_in_01, 
  red_d_out_01, 
  fuse_l2d_rid_01, 
  fuse_l2d_wren_01, 
  fuse_l2d_reset_01_l, 
  sel_quad_01, 
  red_addr_top, 
  red_addr_bot, 
  red_top_d_00, 
  red_top_d_01, 
  cred);

input	[7:0]	waysel_c3;
input	[8:0]   set_c3;
input	   	coloff_c3;
input	   	coloff_c4_l;
//input	[1:0]   coloff_c5;
input	       	rd_wr_c3;
//input	       	readen_c5;
input	[3:0]   worden_c3;
input	       	l2clk;
input	       	tcu_pce_ov;
input	       	tcu_pce;
input	       	se;
input	       	tcu_clk_stop;
		
output	[7:0]	waysel_top_c4;			
output	[7:0]	waysel_bot_c4;			
output	[8:0]	set_top_c3b;		//	Set 8 will be inverted for top/bot
output	[8:0]	set_bot_c3b;		//	Set 8 will be inverted for top/bot
output		coloff_top_c3b_l;		
output		coloff_bot_c3b_l;		
//output		coloff_top_c4_l	;		
//output		coloff_bot_c4_l;			
//output	[1:0]	coloff_top_c5;			
//output	[1:0]	coloff_bot_c5;			
output		writeen_top_c3b;			
output		writeen_bot_c3b;			
//output		readen_top_c5;			
//output		readen_bot_c5;			
output		l1clk;				
output	[3:0]	worden_top_c3b;			
output	[3:0]	worden_bot_c3b;			


input	[19:0]	sat_lo0_bc_l;		//	Senseamp out from top-16kb
input	[19:0]	sat_hi0_bc_l;		//	Senseamp out from top-16kb
input	[18:0]	sat_lo1_bc_l;		//	Senseamp out from top-16kb
input	[18:0]	sat_hi1_bc_l;		//	Senseamp out from top-16kb
input	[19:0]	sab_lo0_bc_l;		//	Senseamp out from bot-16kb
input	[19:0]	sab_hi0_bc_l;		//	Senseamp out from bot-16kb
input	[18:0]	sab_lo1_bc_l;		//	Senseamp out from bot-16kb
input	[18:0]	sab_hi1_bc_l;		//	Senseamp out from bot-16kb
input	[19:0]	ldin0lo_b;	
input	[19:0]	ldin0hi_b;	
input	[18:0]	ldin1lo_b;	
input	[18:0]	ldin1hi_b;	
//input		bnken_lat;		//	Address latch enable (1.5cycle)
output	[19:0]	ldout0lo_b;	
output	[19:0]	ldout0hi_b;
output	[18:0]	ldout1lo_b;	
output	[18:0]	ldout1hi_b;	
		

input	[9:0]	red_d_in_00;
output	[9:0]	red_d_out_00;
input	[2:0]	fuse_l2d_rid_00;
input		fuse_l2d_wren_00;
input		fuse_l2d_reset_00_l;
input		sel_quad_00;

input	[9:0]	red_d_in_01;
output	[9:0]	red_d_out_01;
input	[2:0]	fuse_l2d_rid_01;
input		fuse_l2d_wren_01;
input		fuse_l2d_reset_01_l;
input		sel_quad_01;

output	[9:0]	red_addr_top;
output	[9:0]	red_addr_bot;
// forwarded
input	[9:0]	red_top_d_00;
input	[9:0]	red_top_d_01;

output	[77:0]	cred;
//output		fuse_l2d_reset_00_l_buf;
//output		fuse_l2d_reset_01_l_buf;

reg	[7:0]	waysel_top_c4;
reg	[7:0]	waysel_bot_c4;
reg	[8:0]	set_top_c3b;
reg	[8:0]	set_bot_c3b;
reg		writeen_top_c3b;
reg		writeen_bot_c3b;
reg	[3:0]	worden_top_c3b;
reg	[3:0]	worden_bot_c3b;
reg		coloff_top_c3b_l;
reg		coloff_bot_c3b_l;
reg     [7:0]   waysel_top_c3b;
reg     [7:0]   waysel_bot_c3b;
//always@(posedge l2clk)
always@(negedge l2clk)
begin
        coloff_top_c3b_l                <= ~coloff_c3;
        coloff_bot_c3b_l                <= ~coloff_c3;
	worden_top_c3b[3:0]		<=  worden_c3[3:0];
	worden_bot_c3b[3:0]		<=  worden_c3[3:0];
	writeen_top_c3b			<=  ~rd_wr_c3;
	writeen_bot_c3b			<=  ~rd_wr_c3;	
end

//always@(negedge l2clk)
//always@(l2clk or bnken_lat)
always@(l2clk or coloff_c4_l)
begin
//	if(~bnken_lat)
        if(~l2clk & coloff_c4_l)
	begin
		waysel_top_c3b[7:0]		<=  waysel_c3[7:0];	
		waysel_bot_c3b[7:0]		<=  waysel_c3[7:0];	
		set_bot_c3b[8:0]		<=  set_c3[8:0];
		set_top_c3b[8:0]		<=  {~set_c3[8],set_c3[7:0]};

	end
end

always@(posedge l2clk )
begin
waysel_top_c4[7:0]		<=  waysel_top_c3b[7:0];
waysel_bot_c4[7:0]		<=  waysel_bot_c3b[7:0];
end
//assign 	readen_top_c5	= readen_c5;
//assign 	readen_bot_c5	= readen_c5;
//assign 	coloff_top_c5	= coloff_c5[1:0];
//assign 	coloff_bot_c5	= coloff_c5[1:0];
//assign 	coloff_top_c4_l	= coloff_c4_l;
//assign 	coloff_bot_c4_l	= coloff_c4_l;


wire	[19:0]	sat_lo0_bc;
wire	[19:0]	sab_lo0_bc;
wire	[19:0]	sat_hi0_bc;
wire	[19:0]	sab_hi0_bc;
                       
wire	[18:0]	sat_lo1_bc;
wire	[18:0]	sab_lo1_bc;
wire	[18:0]	sat_hi1_bc;
wire	[18:0]	sab_hi1_bc;


//always@(posedge l1clk)
//begin
assign  sat_lo0_bc[19:0] = ~sat_lo0_bc_l[19:0];
assign  sab_lo0_bc[19:0] = ~sab_lo0_bc_l[19:0];
assign  sat_hi0_bc[19:0] = ~sat_hi0_bc_l[19:0];
assign  sab_hi0_bc[19:0] = ~sab_hi0_bc_l[19:0];

assign  sat_lo1_bc[18:0] = ~sat_lo1_bc_l[18:0];
assign  sab_lo1_bc[18:0] = ~sab_lo1_bc_l[18:0];
assign  sat_hi1_bc[18:0] = ~sat_hi1_bc_l[18:0];
assign  sab_hi1_bc[18:0] = ~sab_hi1_bc_l[18:0];
//end



n2_l2d_sp_512kb_cust_or_macro__ports_3__width_20  or_ldout0lo_b	
	(
	.dout	(ldout0lo_b[19:0]),
	.din0	(sat_lo0_bc[19:0]),
	.din1	(sab_lo0_bc[19:0]),
	.din2	(ldin0lo_b[19:0])
	);

n2_l2d_sp_512kb_cust_or_macro__ports_3__width_20  or_ldout0hi_b       
        (
        .dout   (ldout0hi_b[19:0]),
        .din0   (sat_hi0_bc[19:0]),
        .din1   (sab_hi0_bc[19:0]),
        .din2   (ldin0hi_b[19:0])
        );

n2_l2d_sp_512kb_cust_or_macro__ports_3__width_19  or_ldout1lo_b       
        (
        .dout   (ldout1lo_b[18:0]),
        .din0   (sat_lo1_bc[18:0]),
        .din1   (sab_lo1_bc[18:0]),
        .din2   (ldin1lo_b[18:0])
        );


n2_l2d_sp_512kb_cust_or_macro__ports_3__width_19  or_ldout1hi_b       
        (
        .dout   (ldout1hi_b[18:0]),
        .din0   (sat_hi1_bc[18:0]),
        .din1   (sab_hi1_bc[18:0]),
        .din2   (ldin1hi_b[18:0])
        );


cl_sc1_l1hdr_12x clk_hdr (
	.l2clk	(l2clk),
	.se	(se),
	.pce	(tcu_pce),
	.pce_ov	(tcu_pce_ov),
	.stop  	(tcu_clk_stop),
	.l1clk	(l1clk)
	);


// Redudant row modelling



reg	[9:0]	red_odd_0;
reg	[9:0]	red_odd_1;
reg	[9:0]	red_even_0;
reg	[9:0]	red_even_1;
reg	[7:0]	red_col_0;
reg	[7:0]	red_col_1;
//reg	[9:0]	red_d_out_00;
//reg	[9:0]	red_d_out_01;

wire  red_reg_clk_even_0;
wire  red_reg_clk_even_1;
wire  red_reg_clk_odd_0;
wire  red_reg_clk_odd_1;
wire  red_reg_clk_col_0;
wire  red_reg_clk_col_1;
wire [9:0] red_data_00;
wire [9:0] red_data_01;

// Initialize the register.
initial begin
   
   red_odd_0[9:0] = 10'b0;
   red_odd_1[9:0] = 10'b0;
   red_even_0[9:0]= 10'b0;
   red_even_1[9:0]= 10'b0;
   red_col_0[7:0] = 8'b0;
   red_col_1[7:0] = 8'b0;
end

assign  red_reg_clk_even_0 =~((~l1clk & fuse_l2d_wren_00 & (fuse_l2d_rid_00[2:0]==3'b000) & sel_quad_00) | ~fuse_l2d_reset_00_l);
assign  red_reg_clk_even_1 =~((~l1clk & fuse_l2d_wren_00 & (fuse_l2d_rid_00[2:0]==3'b010) & sel_quad_00) | ~fuse_l2d_reset_00_l);
assign  red_reg_clk_col_0  =~((~l1clk & fuse_l2d_wren_00 & (fuse_l2d_rid_00[2:0]==3'b100) & sel_quad_00) | ~fuse_l2d_reset_00_l);

assign  red_reg_clk_odd_0  =~((~l1clk &fuse_l2d_wren_01& (fuse_l2d_rid_01[2:0]==3'b001) & sel_quad_01) | ~fuse_l2d_reset_01_l);
assign  red_reg_clk_odd_1  =~((~l1clk &fuse_l2d_wren_01& (fuse_l2d_rid_01[2:0]==3'b011) & sel_quad_01) | ~fuse_l2d_reset_01_l);
assign  red_reg_clk_col_1  =~((~l1clk &fuse_l2d_wren_01& (fuse_l2d_rid_01[2:0]==3'b101) & sel_quad_01) | ~fuse_l2d_reset_01_l);

assign  red_data_00[9:0] = red_d_in_00[9:0] & {10{fuse_l2d_reset_00_l}};
assign  red_data_01[9:0] = red_d_in_01[9:0] & {10{fuse_l2d_reset_01_l}};

always @(red_reg_clk_even_0 or red_reg_clk_even_1 or red_reg_clk_col_0 or red_reg_clk_odd_0 or red_reg_clk_odd_1 or red_reg_clk_col_1 or red_d_in_00 or red_d_in_01) begin
  if (~red_reg_clk_even_0) begin
    red_even_0[9:0] <= red_data_00[9:0];
  end

  if (~red_reg_clk_even_1) begin
    red_even_1[9:0] <= red_data_00[9:0];
  end  
  
  if (~red_reg_clk_col_0) begin
    red_col_0[7:0] <= {red_data_00[9:8],red_data_00[5:0]};
  end
  
  if (~red_reg_clk_odd_0) begin
    red_odd_0[9:0] <= red_data_01[9:0];
  end

  if (~red_reg_clk_odd_1) begin
    red_odd_1[9:0] <= red_data_01[9:0];
  end  
  
  if (~red_reg_clk_col_1) begin
    red_col_1[7:0] <= {red_data_01[9:8],red_data_01[5:0]};
  end  
end
  
  
// 00 = bot and 01 = top

//always@(fuse_l2d_wren_00 or fuse_l2d_wren_01 or fuse_l2d_rid_01 or fuse_l2d_rid_00 
//	or red_d_in_00 or red_d_in_01 or sel_quad_00 or sel_quad_01)
//begin
//	if(fuse_l2d_wren_00 & ~fuse_l2d_rid_00[0] & set_bot_c3b[8] & (fuse_l2d_rid_00[2:1]==2'b00) & sel_quad_00)
//		red_even_0	<= red_d_in_00;
//	else if(fuse_l2d_wren_00 & ~fuse_l2d_rid_00[0] & set_top_c3b[8] & (fuse_l2d_rid_01[2:1]==2'b01) & sel_quad_00)
//		red_even_1	<= red_d_in_00;
//	else if(fuse_l2d_wren_00 & ~fuse_l2d_rid_00[0] & (fuse_l2d_rid_01[2:1]==2'b10) & sel_quad_00)
//		red_col_0	<= red_d_in_00[7:0];
//	
//	if(fuse_l2d_wren_01 & fuse_l2d_rid_01[0] & set_top_c3b[8] & (fuse_l2d_rid_01[2:1]==2'b00) & sel_quad_01)
//                red_odd_0 	<= red_d_in_01;
//	else if(fuse_l2d_wren_01 & fuse_l2d_rid_01[0] & set_bot_c3b[8] & (fuse_l2d_rid_01[2:1]==2'b01) & sel_quad_01)
//                red_odd_1       <= red_d_in_01;
//	else if(fuse_l2d_wren_01 & fuse_l2d_rid_01[0] & (fuse_l2d_rid_01[2:1]==2'b10) & sel_quad_01)
//                red_col_1        <= red_d_in_01[7:0];
//end
//			

//assign red_addr_top = set_top_c3b[0] ? red_odd_0 : red_even_0;
//assign red_addr_bot = set_top_c3b[0] ? red_odd_1 : red_even_1;
assign red_addr_top = set_top_c3b[0] ? red_odd_1 : red_even_1;
assign red_addr_bot = set_top_c3b[0] ? red_odd_0 : red_even_0;

assign red_d_out_00[7:0] = (red_even_0[7:0] & {8{fuse_l2d_rid_00[2:0]==3'b000}}) | 
                           (red_even_1[7:0] & {8{fuse_l2d_rid_00[2:0]==3'b010}}) |
			   ({2'b0,(red_col_0[5:0] & {6{fuse_l2d_rid_00[2:0]==3'b100}})})  | 
			   (red_top_d_00[7:0] & {8{~sel_quad_00}});
			   
assign red_d_out_00[9:8] = (red_even_0[9:8] & {2{fuse_l2d_rid_00[2:0]==3'b000}}) | 
                           (red_even_1[9:8] & {2{fuse_l2d_rid_00[2:0]==3'b010}}) | 
			   (red_col_0[7:6] & {2{fuse_l2d_rid_00[2:0]==3'b100}}) | 
			   (red_top_d_00[9:8] & {2{~sel_quad_00}});			   
			   
			   
			   
			   
assign red_d_out_01[7:0] = (red_odd_0[7:0] & {8{fuse_l2d_rid_01[2:0]==3'b001}}) | 
                           (red_odd_1[7:0] & {8{fuse_l2d_rid_01[2:0]==3'b011}}) |
			   ({2'b0,(red_col_1[5:0] & {6{fuse_l2d_rid_01[2:0]==3'b101}})}) | 
			   (red_top_d_01[7:0] & {8{~sel_quad_01}});			   
			   
assign red_d_out_01[9:8] = (red_odd_0[9:8] & {2{fuse_l2d_rid_01[2:0]==3'b001}}) | 
                           (red_odd_1[9:8] & {2{fuse_l2d_rid_01[2:0]==3'b011}}) |
			   (red_col_1[7:6] & {2{fuse_l2d_rid_01[2:0]==3'b101}}) | 
			   (red_top_d_01[9:8] & {2{~sel_quad_01}});			   
			   			   
			   
						   
//always@(fuse_l2d_rid_00)
//begin
//case(fuse_l2d_rid_00)
//3'b000	: begin 
//		red_d_out_00  = red_even_0; 
//		red_d_out_01  = 10'b0; 
//		end
//3'b010	: begin 
//		red_d_out_00  = red_even_1; 
//		red_d_out_01  = 10'b0; 
//		end
//3'b100	: begin 
//		red_d_out_00  = {2'b0,red_col_0};  
//		red_d_out_01  = 10'b0; 
//		end
//
//3'b001	: begin 
//		red_d_out_01  = red_odd_0;  
//		red_d_out_00  = 10'b0; 
//		end
//3'b011	: begin 
//		red_d_out_01  = red_odd_1;  
//		red_d_out_00  = 10'b0; 
//		end
//3'b101	: begin 
//		red_d_out_01  = {2'b0,red_col_1};  
//		red_d_out_00  = 10'b0; 
//		end
//
//default : begin 
//		red_d_out_00  = red_top_d_00;       
//		red_d_out_01  = red_top_d_01;
//		end
//endcase
//end

// Col redudancy

//reg     [7:0]   red_col_0;
//reg     [7:0]   red_col_1;

reg	[38:0] cred0;
reg	[38:0] cred1;

// Initialize cred0, cred1
initial begin
  cred0[38:0] = 39'b0;
  cred1[38:0] = 39'b0;
end

always@(red_col_0)
if(red_col_0[7] & red_col_0[6] & ~red_col_0[5])
case(red_col_0)
8'b11_0_00000	: 	cred0[18:0]	= 19'b111_1111_1111_1111_1111; //0
8'b11_0_00001	: 	cred0[18:0]	= 19'b111_1111_1111_1111_1110; //1
8'b11_0_00010	: 	cred0[18:0]	= 19'b111_1111_1111_1111_1100; //2
8'b11_0_00011	: 	cred0[18:0]	= 19'b111_1111_1111_1111_1000; //3
8'b11_0_00100	: 	cred0[18:0]	= 19'b111_1111_1111_1111_0000; //4
8'b11_0_00101	: 	cred0[18:0]	= 19'b111_1111_1111_1110_0000; //5
8'b11_0_00110	: 	cred0[18:0]	= 19'b111_1111_1111_1100_0000; //6
8'b11_0_00111	: 	cred0[18:0]	= 19'b111_1111_1111_1000_0000; //7
8'b11_0_01000	: 	cred0[18:0]	= 19'b111_1111_1111_0000_0000; //8
8'b11_0_01001	: 	cred0[18:0]	= 19'b111_1111_1110_0000_0000; //9
8'b11_0_01010	: 	cred0[18:0]	= 19'b111_1111_1100_0000_0000; //10
8'b11_0_01011	: 	cred0[18:0]	= 19'b111_1111_1000_0000_0000; //11
8'b11_0_01100	: 	cred0[18:0]	= 19'b111_1111_0000_0000_0000; //12
8'b11_0_01101	: 	cred0[18:0]	= 19'b111_1110_0000_0000_0000; //13
8'b11_0_01110	: 	cred0[18:0]	= 19'b111_1100_0000_0000_0000; //14
8'b11_0_01111	: 	cred0[18:0]	= 19'b111_1000_0000_0000_0000; //15
8'b11_0_10000	: 	cred0[18:0]	= 19'b111_0000_0000_0000_0000; //16
8'b11_0_10001	: 	cred0[18:0]	= 19'b110_0000_0000_0000_0000; //17
8'b11_0_10010	: 	cred0[18:0]	= 19'b100_0000_0000_0000_0000; //18
default		:       cred0[18:0]	= 19'b0;
endcase 
else cred0[18:0] = 19'b0;

always@(red_col_0)
if(red_col_0[7] & red_col_0[6] & red_col_0[5])
case(red_col_0)
8'b11_1_00000	: 	cred0[38:19]	= 20'b1111_1111_1111_1111_1111;//0
8'b11_1_00001	: 	cred0[38:19]	= 20'b0111_1111_1111_1111_1111;//1
8'b11_1_00010	: 	cred0[38:19]	= 20'b0011_1111_1111_1111_1111;//2
8'b11_1_00011	: 	cred0[38:19]	= 20'b0001_1111_1111_1111_1111;//3
8'b11_1_00100	: 	cred0[38:19]	= 20'b0000_1111_1111_1111_1111;//4
8'b11_1_00101	: 	cred0[38:19]	= 20'b0000_0111_1111_1111_1111;//5
8'b11_1_00110	: 	cred0[38:19]	= 20'b0000_0011_1111_1111_1111;//6
8'b11_1_00111	: 	cred0[38:19]	= 20'b0000_0001_1111_1111_1111;//7
8'b11_1_01000	: 	cred0[38:19]	= 20'b0000_0000_1111_1111_1111;//8
8'b11_1_01001	: 	cred0[38:19]	= 20'b0000_0000_0111_1111_1111;//9
8'b11_1_01010	: 	cred0[38:19]	= 20'b0000_0000_0011_1111_1111;//10
8'b11_1_01011	: 	cred0[38:19]	= 20'b0000_0000_0001_1111_1111;//11
8'b11_1_01100	: 	cred0[38:19]	= 20'b0000_0000_0000_1111_1111;//12
8'b11_1_01101	: 	cred0[38:19]	= 20'b0000_0000_0000_0111_1111;//13
8'b11_1_01110	: 	cred0[38:19]	= 20'b0000_0000_0000_0011_1111;//14
8'b11_1_01111	: 	cred0[38:19]	= 20'b0000_0000_0000_0001_1111;//15
8'b11_1_10000	: 	cred0[38:19]	= 20'b0000_0000_0000_0000_1111;//16
8'b11_1_10001	: 	cred0[38:19]	= 20'b0000_0000_0000_0000_0111;//17
8'b11_1_10010	: 	cred0[38:19]	= 20'b0000_0000_0000_0000_0011;//18
8'b11_1_10011	: 	cred0[38:19]	= 20'b0000_0000_0000_0000_0001;//19
default		:  	cred0[38:19]	= 20'b0;
endcase 				     
else cred0[38:19] = 20'b0;

always@(red_col_1)
if(red_col_1[7] & red_col_1[6] & red_col_1[5])
case(red_col_1)
8'b11_1_00000   :       cred1[19:0]	= 20'b1111_1111_1111_1111_1111; //0
8'b11_1_00001   :       cred1[19:0]	= 20'b1111_1111_1111_1111_1110; //1
8'b11_1_00010   :       cred1[19:0]	= 20'b1111_1111_1111_1111_1100; //2
8'b11_1_00011   :       cred1[19:0]	= 20'b1111_1111_1111_1111_1000; //3
8'b11_1_00100   :       cred1[19:0]	= 20'b1111_1111_1111_1111_0000; //4
8'b11_1_00101   :       cred1[19:0]	= 20'b1111_1111_1111_1110_0000; //5
8'b11_1_00110   :       cred1[19:0]	= 20'b1111_1111_1111_1100_0000; //6
8'b11_1_00111   :       cred1[19:0]	= 20'b1111_1111_1111_1000_0000; //7
8'b11_1_01000   :       cred1[19:0]	= 20'b1111_1111_1111_0000_0000; //8
8'b11_1_01001   :       cred1[19:0]	= 20'b1111_1111_1110_0000_0000; //9
8'b11_1_01010   :       cred1[19:0]	= 20'b1111_1111_1100_0000_0000; //10
8'b11_1_01011   :       cred1[19:0]	= 20'b1111_1111_1000_0000_0000; //11
8'b11_1_01100   :       cred1[19:0]	= 20'b1111_1111_0000_0000_0000; //12
8'b11_1_01101   :       cred1[19:0]	= 20'b1111_1110_0000_0000_0000; //13
8'b11_1_01110   :       cred1[19:0]	= 20'b1111_1100_0000_0000_0000; //14
8'b11_1_01111   :       cred1[19:0]	= 20'b1111_1000_0000_0000_0000; //15
8'b11_1_10000   :       cred1[19:0]	= 20'b1111_0000_0000_0000_0000; //16
8'b11_1_10001   :       cred1[19:0]	= 20'b1110_0000_0000_0000_0000; //17
8'b11_1_10010   :       cred1[19:0]	= 20'b1100_0000_0000_0000_0000; //18
8'b11_1_10011   :       cred1[19:0]	= 20'b1000_0000_0000_0000_0000; //19
default		:       cred1[19:0]	= 20'b0;
endcase
else cred1[19:0] = 20'b0;

always@(red_col_1)
if(red_col_1[7] & red_col_1[6] & ~red_col_1[5])
case(red_col_1)
8'b11_0_00000   :       cred1[38:20]	= 19'b111_1111_1111_1111_1111;//0
8'b11_0_00001   :       cred1[38:20]	= 19'b011_1111_1111_1111_1111;//1
8'b11_0_00010   :       cred1[38:20]	= 19'b001_1111_1111_1111_1111;//2
8'b11_0_00011   :       cred1[38:20]	= 19'b000_1111_1111_1111_1111;//3
8'b11_0_00100   :       cred1[38:20]	= 19'b000_0111_1111_1111_1111;//4
8'b11_0_00101   :       cred1[38:20]	= 19'b000_0011_1111_1111_1111;//5
8'b11_0_00110   :       cred1[38:20]	= 19'b000_0001_1111_1111_1111;//6
8'b11_0_00111   :       cred1[38:20]	= 19'b000_0000_1111_1111_1111;//7
8'b11_0_01000   :       cred1[38:20]	= 19'b000_0000_0111_1111_1111;//8
8'b11_0_01001   :       cred1[38:20]	= 19'b000_0000_0011_1111_1111;//9
8'b11_0_01010   :       cred1[38:20]	= 19'b000_0000_0001_1111_1111;//10
8'b11_0_01011   :       cred1[38:20]	= 19'b000_0000_0000_1111_1111;//11
8'b11_0_01100   :       cred1[38:20]	= 19'b000_0000_0000_0111_1111;//12
8'b11_0_01101   :       cred1[38:20]	= 19'b000_0000_0000_0011_1111;//13
8'b11_0_01110   :       cred1[38:20]	= 19'b000_0000_0000_0001_1111;//14
8'b11_0_01111   :       cred1[38:20]	= 19'b000_0000_0000_0000_1111;//15
8'b11_0_10000   :       cred1[38:20]	= 19'b000_0000_0000_0000_0111;//16
8'b11_0_10001   :       cred1[38:20]	= 19'b000_0000_0000_0000_0011;//17
8'b11_0_10010   :       cred1[38:20]	= 19'b000_0000_0000_0000_0001;//18
default		:       cred1[38:20]	= 19'b0;
endcase
else cred1[38:20] = 19'b0;

assign cred[77:0] = {cred1[38:0], cred0[38:0]};
//assign cred[77:0] = 78'b0;


//assign fuse_l2d_reset_00_buf = fuse_l2d_reset_00;
//assign fuse_l2d_reset_01_buf = fuse_l2d_reset_01;




endmodule


//  
//   or macro for ports = 2,3
//
//





module n2_l2d_sp_512kb_cust_or_macro__ports_3__width_20 (
  din0, 
  din1, 
  din2, 
  dout);
  input [19:0] din0;
  input [19:0] din1;
  input [19:0] din2;
  output [19:0] dout;






or3 #(20)  d0_0 (
.in0(din0[19:0]),
.in1(din1[19:0]),
.in2(din2[19:0]),
.out(dout[19:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module n2_l2d_sp_512kb_cust_or_macro__ports_3__width_19 (
  din0, 
  din1, 
  din2, 
  dout);
  input [18:0] din0;
  input [18:0] din1;
  input [18:0] din2;
  output [18:0] dout;






or3 #(19)  d0_0 (
.in0(din0[18:0]),
.in1(din1[18:0]),
.in2(din2[18:0]),
.out(dout[18:0])
);









endmodule





module n2_l2d_ctrlio_cust (
  l2t_l2d_word_en_c2, 
  l2t_l2d_fbrd_c3, 
  l2t_l2d_col_offset_c2, 
  l2t_l2d_set_c2, 
  l2t_l2d_rd_wr_c3, 
  l2t_l2d_way_sel_c3, 
  l2t_l2d_fb_hit_c3, 
  l2clk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_ce, 
  tcu_clk_stop, 
  array_wr_inhibit, 
  scan_in, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  wayerr_c3, 
  l2t_l2d_pwrsav_ov_stg, 
  scan_out, 
  cache_col_offset_all_c7, 
  aclk, 
  bclk, 
  scan_en_clsrhdr, 
  l2b_l2d_fbdecc_c5, 
  l2t_l2d_stdecc_c2, 
  cache_decc_out_c5b, 
  l2d_decc_out_c6, 
  cache_decc_in_c3b_l, 
  l2d_l2t_decc_c52_mux, 
  cache_way_sel_c3_00, 
  cache_way_sel_c3_01, 
  cache_way_sel_c3_10, 
  cache_way_sel_c3_11, 
  cache_way_sel_c3_20, 
  cache_way_sel_c3_21, 
  cache_way_sel_c3_30, 
  cache_way_sel_c3_31, 
  cache_wayerr_c3_00, 
  cache_wayerr_c3_01, 
  cache_wayerr_c3_10, 
  cache_wayerr_c3_11, 
  cache_wayerr_c3_20, 
  cache_wayerr_c3_21, 
  cache_wayerr_c3_30, 
  cache_wayerr_c3_31, 
  cache_set_c3_00, 
  cache_set_c3_01, 
  cache_set_c3_10, 
  cache_set_c3_11, 
  cache_set_c3_20, 
  cache_set_c3_21, 
  cache_set_c3_30, 
  cache_set_c3_31, 
  cache_col_offset_c3_00, 
  cache_col_offset_c3_01, 
  cache_col_offset_c3_10, 
  cache_col_offset_c3_11, 
  cache_col_offset_c3_20, 
  cache_col_offset_c3_21, 
  cache_col_offset_c3_30, 
  cache_col_offset_c3_31, 
  cache_col_offset_c4_l_00, 
  cache_col_offset_c4_l_01, 
  cache_col_offset_c4_l_10, 
  cache_col_offset_c4_l_11, 
  cache_col_offset_c4_l_20, 
  cache_col_offset_c4_l_21, 
  cache_col_offset_c4_l_30, 
  cache_col_offset_c4_l_31, 
  cache_col_offset_c5_00, 
  cache_col_offset_c5_01, 
  cache_col_offset_c5_10, 
  cache_col_offset_c5_11, 
  cache_col_offset_c5_20, 
  cache_col_offset_c5_21, 
  cache_col_offset_c5_30, 
  cache_col_offset_c5_31, 
  cache_rd_wr_c3_00, 
  cache_rd_wr_c3_01, 
  cache_rd_wr_c3_10, 
  cache_rd_wr_c3_11, 
  cache_rd_wr_c3_20, 
  cache_rd_wr_c3_21, 
  cache_rd_wr_c3_30, 
  cache_rd_wr_c3_31, 
  cache_readen_c5_00, 
  cache_readen_c5_01, 
  cache_readen_c5_10, 
  cache_readen_c5_11, 
  cache_readen_c5_20, 
  cache_readen_c5_21, 
  cache_readen_c5_30, 
  cache_readen_c5_31, 
  cache_word_en_c3_00, 
  cache_word_en_c3_01, 
  cache_word_en_c3_10, 
  cache_word_en_c3_11, 
  cache_word_en_c3_20, 
  cache_word_en_c3_21, 
  cache_word_en_c3_30, 
  cache_word_en_c3_31, 
  tcu_pce_ov_00, 
  tcu_pce_ov_01, 
  tcu_pce_ov_10, 
  tcu_pce_ov_11, 
  tcu_pce_ov_20, 
  tcu_pce_ov_21, 
  tcu_pce_ov_30, 
  tcu_pce_ov_31, 
  tcu_pce_00, 
  tcu_pce_01, 
  tcu_pce_10, 
  tcu_pce_11, 
  tcu_pce_20, 
  tcu_pce_21, 
  tcu_pce_30, 
  tcu_pce_31, 
  tcu_clk_stop_00, 
  tcu_clk_stop_01, 
  tcu_clk_stop_10, 
  tcu_clk_stop_11, 
  tcu_clk_stop_20, 
  tcu_clk_stop_21, 
  tcu_clk_stop_30, 
  tcu_clk_stop_31, 
  se_00, 
  se_01, 
  se_10, 
  se_11, 
  se_20, 
  se_21, 
  se_30, 
  se_31, 
  l2b_l2d_fuse_l2d_data_in_d, 
  l2b_l2d_fuse_rid_d, 
  l2b_l2d_fuse_reset_l, 
  l2b_l2d_fuse_l2d_wren_d, 
  efc_fuse_data, 
  fuse_l2d_data_in_131, 
  fuse_l2d_rid_131, 
  fuse_l2d_wren_131, 
  fuse_l2d_reset_131_l, 
  fdout_131, 
  fuse_l2d_data_in_031, 
  fuse_l2d_rid_031, 
  fuse_l2d_wren_031, 
  fuse_l2d_reset_031_l, 
  fdout_031, 
  fuse_l2d_data_in_130, 
  fuse_l2d_rid_130, 
  fuse_l2d_wren_130, 
  fuse_l2d_reset_130_l, 
  fdout_130, 
  fuse_l2d_data_in_030, 
  fuse_l2d_rid_030, 
  fuse_l2d_wren_030, 
  fuse_l2d_reset_030_l, 
  fdout_030, 
  fuse_l2d_data_in_111, 
  fuse_l2d_rid_111, 
  fuse_l2d_wren_111, 
  fuse_l2d_reset_111_l, 
  fdout_111, 
  fuse_l2d_data_in_011, 
  fuse_l2d_rid_011, 
  fuse_l2d_wren_011, 
  fuse_l2d_reset_011_l, 
  fdout_011, 
  fuse_l2d_data_in_110, 
  fuse_l2d_rid_110, 
  fuse_l2d_wren_110, 
  fuse_l2d_reset_110_l, 
  fdout_110, 
  fuse_l2d_data_in_010, 
  fuse_l2d_rid_010, 
  fuse_l2d_wren_010, 
  fuse_l2d_reset_010_l, 
  fdout_010, 
  fuse_l2d_data_in_121, 
  fuse_l2d_rid_121, 
  fuse_l2d_wren_121, 
  fuse_l2d_reset_121_l, 
  fdout_121, 
  fuse_l2d_data_in_021, 
  fuse_l2d_rid_021, 
  fuse_l2d_wren_021, 
  fuse_l2d_reset_021_l, 
  fdout_021, 
  fuse_l2d_data_in_120, 
  fuse_l2d_rid_120, 
  fuse_l2d_wren_120, 
  fuse_l2d_reset_120_l, 
  fdout_120, 
  fuse_l2d_data_in_020, 
  fuse_l2d_rid_020, 
  fuse_l2d_wren_020, 
  fuse_l2d_reset_020_l, 
  fdout_020, 
  fuse_l2d_data_in_101, 
  fuse_l2d_rid_101, 
  fuse_l2d_wren_101, 
  fuse_l2d_reset_101_l, 
  fdout_101, 
  fuse_l2d_data_in_001, 
  fuse_l2d_rid_001, 
  fuse_l2d_wren_001, 
  fuse_l2d_reset_001_l, 
  fdout_001, 
  fuse_l2d_data_in_100, 
  fuse_l2d_rid_100, 
  fuse_l2d_wren_100, 
  fuse_l2d_reset_100_l, 
  fdout_100, 
  fuse_l2d_data_in_000, 
  fuse_l2d_rid_000, 
  fuse_l2d_wren_000, 
  fuse_l2d_reset_000_l, 
  fdout_000, 
  siclk_peri, 
  soclk_peri, 
  pce_ov_peri, 
  pce_peri, 
  scan_collarin_peri, 
  scan_collarout_peri, 
  wr_inhibit_peri, 
  clk_stop_peri, 
  wee_l_q00, 
  wee_l_q01, 
  wee_l_q10, 
  wee_l_q11, 
  wee_l_q20, 
  wee_l_q21, 
  wee_l_q30, 
  wee_l_q31, 
  delout00, 
  delout01, 
  delout10, 
  delout11, 
  delout20, 
  delout21, 
  delout30, 
  delout31);
wire tcu_array_wr_inhibit;
wire l1clk_in;
wire l1clk_intnl;
wire evit_pce_c6;
wire l1clk_evict_c6;
wire [8:0] ff_cache_set_c3_scanin;
wire [8:0] ff_cache_set_c3_scanout;
wire [8:0] cache_set_c3;
wire [3:0] ff_cache_col_offset_c3_scanin;
wire [3:0] ff_cache_col_offset_c3_scanout;
wire [3:0] cache_col_offset_c3;
wire [3:0] ff_cache_col_offset_c4_scanin;
wire [3:0] ff_cache_col_offset_c4_scanout;
wire [3:0] cache_col_offset_c4_muxsel;
wire [3:0] ff_cache_col_offset_c5_muxsel_scanin;
wire [3:0] ff_cache_col_offset_c5_muxsel_scanout;
wire [3:0] cache_col_offset_c5_muxsel;
wire [1:0] ff_cache_col_offset_c52_scanin;
wire [1:0] ff_cache_col_offset_c52_scanout;
wire [3:2] cache_col_offset_c52;
wire cache_col_offset_c5_muxsel_3_or_1;
wire [0:0] ff_cache_col_offset_c52_topsel_scanin;
wire [0:0] ff_cache_col_offset_c52_topsel_scanout;
wire cache_col_offset_c52_topsel;
wire cache_col_offset_all_c3;
wire [0:0] ff_cache_col_offset_all_c4_scanin;
wire [0:0] ff_cache_col_offset_all_c4_scanout;
wire cache_col_offset_all_c4;
wire [0:0] ff_cache_col_offset_all_c5_scanin;
wire [0:0] ff_cache_col_offset_all_c5_scanout;
wire cache_col_offset_all_c5;
wire [0:0] ff_cache_col_offset_all_c6_scanin;
wire [0:0] ff_cache_col_offset_all_c6_scanout;
wire cache_col_offset_all_c6;
wire [0:0] ff_cache_col_offset_all_c7_scanin;
wire [0:0] ff_cache_col_offset_all_c7_scanout;
wire tcu_array_wr_inhibit_n;
wire cache_col_offset_c3_2_tcu_array_wr_inhibit_n;
wire cache_col_offset_c3_0_tcu_array_wr_inhibit_n;
wire cache_col_offset_c3_3_tcu_array_wr_inhibit_n;
wire cache_col_offset_c3_1_tcu_array_wr_inhibit_n;
wire cache_col_offset_c4_tog_001_0_n;
wire cache_col_offset_c4_tog_101_0_n;
wire cache_col_offset_c4_tog_001_1_n;
wire cache_col_offset_c4_tog_101_1_n;
wire cache_col_offset_c4_tog_023_0_n;
wire cache_col_offset_c4_tog_123_0_n;
wire cache_col_offset_c4_tog_023_1_n;
wire cache_col_offset_c4_tog_123_1_n;
wire [1:0] cache_col_offset_c4_tog_001;
wire [1:0] cache_col_offset_c4_tog_101;
wire [1:0] cache_col_offset_c4_tog_023;
wire [1:0] cache_col_offset_c4_tog_123;
wire [3:0] cache_col_offset_c3_n;
wire [3:0] wr_inhibit_cache_col_offset_c3_l;
wire [3:0] wr_inhibit_cache_col_offset_c3;
wire [1:0] cache_col_offset_c4_tog_001_n;
wire wayerr_c3_n;
wire [1:0] wayerr_cache_col_offset_c4_l_tog_001;
wire [1:0] cache_col_offset_c4_tog_101_n;
wire [1:0] wayerr_cache_col_offset_c4_l_tog_101;
wire [1:0] cache_col_offset_c4_tog_023_n;
wire [1:0] wayerr_cache_col_offset_c4_l_tog_023;
wire [1:0] cache_col_offset_c4_tog_123_n;
wire [1:0] wayerr_cache_col_offset_c4_l_tog_123;
wire cache_col_offset_c3_top;
wire cache_col_offset_c3_bot;
wire [1:0] cache_col_offset_c4_tog_in_001;
wire [1:0] cache_col_offset_c4_tog_in_101;
wire [1:0] cache_col_offset_c4_tog_in_023;
wire [1:0] cache_col_offset_c4_tog_in_123;
wire [1:0] ff_cache_col_offset_c4_tog_001_scanin;
wire [1:0] ff_cache_col_offset_c4_tog_001_scanout;
wire [1:0] ff_cache_col_offset_c4_tog_101_scanin;
wire [1:0] ff_cache_col_offset_c4_tog_101_scanout;
wire [1:0] ff_cache_col_offset_c4_tog_023_scanin;
wire [1:0] ff_cache_col_offset_c4_tog_023_scanout;
wire [1:0] ff_cache_col_offset_c4_tog_123_scanin;
wire [1:0] ff_cache_col_offset_c4_tog_123_scanout;
wire [3:0] ff_cache_col_offset_c4_001_scanin;
wire [3:0] ff_cache_col_offset_c4_001_scanout;
wire [3:0] cache_col_offset_c4_001;
wire [3:0] ff_cache_col_offset_c4_101_scanin;
wire [3:0] ff_cache_col_offset_c4_101_scanout;
wire [3:0] cache_col_offset_c4_101;
wire [3:0] ff_cache_col_offset_c4_023_scanin;
wire [3:0] ff_cache_col_offset_c4_023_scanout;
wire [3:0] cache_col_offset_c4_023;
wire [3:0] ff_cache_col_offset_c4_123_scanin;
wire [3:0] ff_cache_col_offset_c4_123_scanout;
wire [3:0] cache_col_offset_c4_123;
wire [3:0] cache_col_offset_c5_001_in;
wire [3:0] cache_col_offset_c5_101_in;
wire [3:0] cache_col_offset_c5_023_in;
wire [3:0] cache_col_offset_c5_123_in;
wire [3:0] ff_cache_col_offset_c5_001_scanin;
wire [3:0] ff_cache_col_offset_c5_001_scanout;
wire [3:0] cache_col_offset_c5_001;
wire [3:0] ff_cache_col_offset_c5_101_scanin;
wire [3:0] ff_cache_col_offset_c5_101_scanout;
wire [3:0] cache_col_offset_c5_101;
wire [3:0] ff_cache_col_offset_c5_023_scanin;
wire [3:0] ff_cache_col_offset_c5_023_scanout;
wire [3:0] cache_col_offset_c5_023;
wire [3:0] ff_cache_col_offset_c5_123_scanin;
wire [3:0] ff_cache_col_offset_c5_123_scanout;
wire [3:0] cache_col_offset_c5_123;
wire cache_rd_wr_c3_generic;
wire cache_rd_wr_c3_next_stage;
wire [0:0] ff_cache_cache_rd_wr_c4_scanin;
wire [0:0] ff_cache_cache_rd_wr_c4_scanout;
wire cache_rd_wr_c4;
wire [0:0] ff_cache_cache_rd_wr_c5_00_scanin;
wire [0:0] ff_cache_cache_rd_wr_c5_00_scanout;
wire cache_rd_wr_c5_00;
wire [0:0] ff_cache_cache_rd_wr_c5_01_scanin;
wire [0:0] ff_cache_cache_rd_wr_c5_01_scanout;
wire cache_rd_wr_c5_01;
wire [0:0] ff_cache_cache_rd_wr_c5_20_scanin;
wire [0:0] ff_cache_cache_rd_wr_c5_20_scanout;
wire cache_rd_wr_c5_20;
wire [0:0] ff_cache_cache_rd_wr_c5_21_scanin;
wire [0:0] ff_cache_cache_rd_wr_c5_21_scanout;
wire cache_rd_wr_c5_21;
wire [15:0] ff_cache_word_en_c3_scanin;
wire [15:0] ff_cache_word_en_c3_scanout;
wire [15:0] cache_word_en_c3;
wire [0:0] ff_cache_sel_fbdecc_c4_scanin;
wire [0:0] ff_cache_sel_fbdecc_c4_scanout;
wire cache_sel_fbdecc_c4;
wire [0:0] ff_cache_sel_fbdecc_c5_scanin;
wire [0:0] ff_cache_sel_fbdecc_c5_scanout;
wire cache_sel_fbdecc_c5;
wire cache_sel_fbdecc_c5_n;
wire [77:0] ff_l2t_l2d_stdecc_c3_scanin;
wire [77:0] ff_l2t_l2d_stdecc_c3_scanout;
wire [77:0] l2t_l2d_stdecc_c3;
wire [0:0] ff_cache_fb_hit_c4_scanin;
wire [0:0] ff_cache_fb_hit_c4_scanout;
wire cache_fb_hit_c4;
wire [0:0] ff_cache_fb_hit_c5_scanin;
wire [0:0] ff_cache_fb_hit_c5_scanout;
wire cache_fb_hit_c5;
wire [0:0] ff_cache_fb_hit_c52_scanin;
wire [0:0] ff_cache_fb_hit_c52_scanout;
wire cache_fb_hit_c52;
wire cache_fb_hit_c52_n;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_1_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_1_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_2_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_2_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_1_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_1_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_2_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_2_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_3_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_3_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_4_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_4_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_3_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_3_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_4_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_4_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_1_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_1_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_2_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_2_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_1_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_1_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_2_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_2_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_3_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_3_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_4_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_4_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_3_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_3_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_4_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_4_scanout;
wire [38:0] ff_l2d_decc_out_c6_lo0_1_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo0_1_scanout;
wire [155:0] l2d_l2t_decc_c52_0;
wire [38:0] ff_l2d_decc_out_c6_lo0_2_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo0_2_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi0_1_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi0_1_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi0_2_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi0_2_scanout;
wire [38:0] ff_l2d_decc_out_c6_lo0_3_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo0_3_scanout;
wire [155:0] l2d_l2t_decc_c52_1;
wire [38:0] ff_l2d_decc_out_c6_lo0_4_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo0_4_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi0_3_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi0_3_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi0_4_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi0_4_scanout;
wire [38:0] ff_l2d_decc_out_c6_lo1_1_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo1_1_scanout;
wire [155:0] l2d_l2t_decc_c52_2;
wire [38:0] ff_l2d_decc_out_c6_lo1_2_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo1_2_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi1_1_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi1_1_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi1_2_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi1_2_scanout;
wire [38:0] ff_l2d_decc_out_c6_lo1_3_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo1_3_scanout;
wire [155:0] l2d_l2t_decc_c52_3;
wire [38:0] ff_l2d_decc_out_c6_lo1_4_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo1_4_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi1_3_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi1_3_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi1_4_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi1_4_scanout;
wire [155:0] cache_decc_out_0_c52;
wire [155:0] cache_decc_out_1_c52;
wire [155:0] cache_decc_out_2_c52;
wire [155:0] cache_decc_out_3_c52;
wire [623:0] cache_decc_out_c52;
wire cache_rd_wr_c3;
wire [155:0] l2d_l2t_decc_c52_20;
wire [155:0] l2d_l2t_decc_c52_31;
wire itis0000;
wire itis0001;
wire itis0010;
wire itis0011;
wire itis0100;
wire itis0101;
wire itis0110;
wire itis0111;
wire itis1000;
wire itis1001;
wire itis1010;
wire itis1011;
wire itis1100;
wire itis1101;
wire itis1110;
wire itis1111;
wire l2b_l2d_fuse_rid_d_0n;
wire or_fuse_l2d_rid_131;
wire stage1_mux_sel0;
wire or_fuse_l2d_rid_121;
wire stage1_mux_sel1;
wire stage1_mux_sel2;
wire [9:0] fdout_stage1;
wire or_fuse_l2d_rid_031;
wire stage2_mux_sel0;
wire or_fuse_l2d_rid_021;
wire stage2_mux_sel1;
wire stage2_mux_sel2;
wire [9:0] fdout_stage2;
wire or_fuse_l2d_rid_130;
wire stage3_mux_sel0;
wire or_fuse_l2d_rid_120;
wire stage3_mux_sel1;
wire stage3_mux_sel2;
wire [9:0] fdout_stage3;
wire or_fuse_l2d_rid_030;
wire stage4_mux_sel0;
wire or_fuse_l2d_rid_020;
wire stage4_mux_sel1;
wire stage4_mux_sel2;
wire [9:0] fdout_stage4;
wire or_fuse_l2d_rid_010;
wire stage10_mux_sel0;
wire or_fuse_l2d_rid_000;
wire stage10_mux_sel1;
wire stage10_mux_sel2;
wire [9:0] fdout_stage10;
wire or_fuse_l2d_rid_110;
wire stage20_mux_sel0;
wire or_fuse_l2d_rid_100;
wire stage20_mux_sel1;
wire stage20_mux_sel2;
wire [9:0] fdout_stage20;
wire or_fuse_l2d_rid_011;
wire stage30_mux_sel0;
wire or_fuse_l2d_rid_001;
wire stage30_mux_sel1;
wire stage30_mux_sel2;
wire [9:0] fdout_stage30;
wire or_fuse_l2d_rid_111;
wire stage40_mux_sel0;
wire or_fuse_l2d_rid_101;
wire stage40_mux_sel1;
wire stage40_mux_sel2;
wire [9:0] fdout_stage40;
wire l2b_l2d_fuse_rid_d_6n;
wire delout20_rgt;
wire delout31_rgt;
wire delout20_lft;
wire delout31_lft;
wire so_q23;
wire so_tstmod;



input	[15:0]	l2t_l2d_word_en_c2;
input	        l2t_l2d_fbrd_c3;
input	[3:0]   l2t_l2d_col_offset_c2;
input	[8:0]   l2t_l2d_set_c2;
input	        l2t_l2d_rd_wr_c3;
input	[15:0]  l2t_l2d_way_sel_c3;
input	        l2t_l2d_fb_hit_c3;
input	        l2clk;
input	        tcu_aclk;
input	        tcu_bclk;
input	        tcu_scan_en;
input	        tcu_pce_ov;
input	        tcu_ce;
input	        tcu_clk_stop;
input	        array_wr_inhibit;
input	        scan_in;
input		tcu_se_scancollar_in;
input		tcu_se_scancollar_out;
input		wayerr_c3;
input		l2t_l2d_pwrsav_ov_stg;
output	        scan_out;
output		cache_col_offset_all_c7;
output		aclk;
output		bclk;
output		scan_en_clsrhdr;

// I/O from Quads

input	[623:0] l2b_l2d_fbdecc_c5;	// filbuf data 
input	[77:0]  l2t_l2d_stdecc_c2;	// store data input
// CHANGE 2
//input	[623:0] cache_decc_out_c52b_l;	// quad 0 read data
input	[623:0] cache_decc_out_c5b;	// quad 0 read data

output	[623:0] l2d_decc_out_c6; 	// evict data
output	[623:0]	cache_decc_in_c3b_l; 	// store data | fbdecc data getting piped to quad
//output	[155:0]	l2d_l2t_decc_c6;	// read data rtn to load 16B
output	[155:0]	l2d_l2t_decc_c52_mux;	// read data rtn to load 16B

output	[15:0]  cache_way_sel_c3_00;
output	[15:0]  cache_way_sel_c3_01;
output	[15:0]  cache_way_sel_c3_10;
output	[15:0]  cache_way_sel_c3_11;
output	[15:0]  cache_way_sel_c3_20;
output	[15:0]  cache_way_sel_c3_21;
output	[15:0]  cache_way_sel_c3_30;
output	[15:0]  cache_way_sel_c3_31;

output    	cache_wayerr_c3_00;
output    	cache_wayerr_c3_01;
output    	cache_wayerr_c3_10;
output    	cache_wayerr_c3_11;
output    	cache_wayerr_c3_20;
output    	cache_wayerr_c3_21;
output    	cache_wayerr_c3_30;
output    	cache_wayerr_c3_31;


output	[8:0]   cache_set_c3_00;	 
output	[8:0]   cache_set_c3_01;	 
output	[8:0]   cache_set_c3_10;	 
output	[8:0]   cache_set_c3_11;	 
output	[8:0]   cache_set_c3_20;	 
output	[8:0]   cache_set_c3_21;	 
output	[8:0]   cache_set_c3_30;	 
output	[8:0]   cache_set_c3_31;	 

output	   cache_col_offset_c3_00;
output	   cache_col_offset_c3_01;
output	   cache_col_offset_c3_10;
output	   cache_col_offset_c3_11;
output	   cache_col_offset_c3_20;
output	   cache_col_offset_c3_21;
output	   cache_col_offset_c3_30;
output	   cache_col_offset_c3_31;

output     cache_col_offset_c4_l_00;
output     cache_col_offset_c4_l_01;
output     cache_col_offset_c4_l_10;
output     cache_col_offset_c4_l_11;
output     cache_col_offset_c4_l_20;
output     cache_col_offset_c4_l_21;
output     cache_col_offset_c4_l_30;
output     cache_col_offset_c4_l_31;

output  [1:0]   cache_col_offset_c5_00;
output  [1:0]   cache_col_offset_c5_01;
output  [1:0]   cache_col_offset_c5_10;
output  [1:0]   cache_col_offset_c5_11;
output  [1:0]   cache_col_offset_c5_20;
output  [1:0]   cache_col_offset_c5_21;
output  [1:0]   cache_col_offset_c5_30;
output  [1:0]   cache_col_offset_c5_31;

output		cache_rd_wr_c3_00;
output		cache_rd_wr_c3_01;
output		cache_rd_wr_c3_10;
output		cache_rd_wr_c3_11;
output		cache_rd_wr_c3_20;
output		cache_rd_wr_c3_21;
output		cache_rd_wr_c3_30;
output		cache_rd_wr_c3_31;


output		cache_readen_c5_00;
output		cache_readen_c5_01;
output		cache_readen_c5_10;
output		cache_readen_c5_11;
output		cache_readen_c5_20;
output		cache_readen_c5_21;
output		cache_readen_c5_30;
output		cache_readen_c5_31;

output	[3:0]   cache_word_en_c3_00;    
output	[3:0]   cache_word_en_c3_01;    
output	[3:0]   cache_word_en_c3_10;    
output	[3:0]   cache_word_en_c3_11;    
output	[3:0]   cache_word_en_c3_20;    
output	[3:0]   cache_word_en_c3_21;    
output	[3:0]   cache_word_en_c3_30;    
output	[3:0]   cache_word_en_c3_31;    

output		tcu_pce_ov_00;
output		tcu_pce_ov_01;
output		tcu_pce_ov_10;
output		tcu_pce_ov_11;
output		tcu_pce_ov_20;
output		tcu_pce_ov_21;
output		tcu_pce_ov_30;
output		tcu_pce_ov_31;
output		tcu_pce_00;
output		tcu_pce_01;
output		tcu_pce_10;
output		tcu_pce_11;
output		tcu_pce_20;
output		tcu_pce_21;
output		tcu_pce_30;
output		tcu_pce_31;
output		tcu_clk_stop_00;
output		tcu_clk_stop_01;
output		tcu_clk_stop_10;
output		tcu_clk_stop_11;
output		tcu_clk_stop_20;
output		tcu_clk_stop_21;
output		tcu_clk_stop_30;
output		tcu_clk_stop_31;

output		se_00;
output		se_01;
output		se_10;
output		se_11;
output		se_20;
output		se_21;
output		se_30;
output		se_31;
// Redudancy

input   [9:0]   l2b_l2d_fuse_l2d_data_in_d;
input   [6:0]   l2b_l2d_fuse_rid_d;
input           l2b_l2d_fuse_reset_l;
input           l2b_l2d_fuse_l2d_wren_d;
output  [9:0]   efc_fuse_data;

// io to the ram
output	[9:0]	fuse_l2d_data_in_131;
output	[4:0]	fuse_l2d_rid_131;
output		fuse_l2d_wren_131;
output		fuse_l2d_reset_131_l;
input	[9:0]	fdout_131;

output	[9:0]	fuse_l2d_data_in_031;
output	[4:0]	fuse_l2d_rid_031;
output		fuse_l2d_wren_031;
output		fuse_l2d_reset_031_l;
input	[9:0]	fdout_031;

output	[9:0]	fuse_l2d_data_in_130;
output	[4:0]	fuse_l2d_rid_130;
output		fuse_l2d_wren_130;
output		fuse_l2d_reset_130_l;
input	[9:0]	fdout_130;

output	[9:0]	fuse_l2d_data_in_030;
output	[4:0]	fuse_l2d_rid_030;
output		fuse_l2d_wren_030;
output		fuse_l2d_reset_030_l;
input	[9:0]	fdout_030;

output	[9:0]	fuse_l2d_data_in_111;
output	[4:0]	fuse_l2d_rid_111;
output		fuse_l2d_wren_111;
output		fuse_l2d_reset_111_l;
input	[9:0]	fdout_111;



output  [9:0]   fuse_l2d_data_in_011;
output  [4:0]   fuse_l2d_rid_011;
output          fuse_l2d_wren_011;
output          fuse_l2d_reset_011_l;
input  [9:0]   fdout_011;


output	[9:0]	fuse_l2d_data_in_110;
output	[4:0]	fuse_l2d_rid_110;
output		fuse_l2d_wren_110;
output		fuse_l2d_reset_110_l;
input	[9:0]	fdout_110;


output	[9:0]	fuse_l2d_data_in_010;
output	[4:0]	fuse_l2d_rid_010;
output		fuse_l2d_wren_010;
output		fuse_l2d_reset_010_l;
input	[9:0]	fdout_010;

output	[9:0]	fuse_l2d_data_in_121;
output	[4:0]	fuse_l2d_rid_121;
output		fuse_l2d_wren_121;
output		fuse_l2d_reset_121_l;
input	[9:0]	fdout_121;


output	[9:0]	fuse_l2d_data_in_021;
output	[4:0]	fuse_l2d_rid_021;
output		fuse_l2d_wren_021;
output		fuse_l2d_reset_021_l;
input	[9:0]	fdout_021;

output	[9:0]	fuse_l2d_data_in_120;
output	[4:0]	fuse_l2d_rid_120;
output		fuse_l2d_wren_120;
output		fuse_l2d_reset_120_l;
input	[9:0]	fdout_120;

output	[9:0]	fuse_l2d_data_in_020;
output	[4:0]	fuse_l2d_rid_020;
output		fuse_l2d_wren_020;
output		fuse_l2d_reset_020_l;
input	[9:0]	fdout_020;

output	[9:0]	fuse_l2d_data_in_101;
output	[4:0]	fuse_l2d_rid_101;
output		fuse_l2d_wren_101;
output		fuse_l2d_reset_101_l;
input	[9:0]	fdout_101;

output	[9:0]	fuse_l2d_data_in_001;
output	[4:0]	fuse_l2d_rid_001;
output		fuse_l2d_wren_001;
output		fuse_l2d_reset_001_l;
input	[9:0]	fdout_001;

output	[9:0]	fuse_l2d_data_in_100;
output	[4:0]	fuse_l2d_rid_100;
output		fuse_l2d_wren_100;
output		fuse_l2d_reset_100_l;
input	[9:0]	fdout_100;

output	[9:0]	fuse_l2d_data_in_000;
output	[4:0]	fuse_l2d_rid_000;
output		fuse_l2d_wren_000;
output		fuse_l2d_reset_000_l;
input	[9:0]	fdout_000;

output		siclk_peri;
output		soclk_peri;
output		pce_ov_peri;
output		pce_peri;
output		scan_collarin_peri;
output		scan_collarout_peri;
output		wr_inhibit_peri;
output		clk_stop_peri;

output		wee_l_q00;
output		wee_l_q01;
output		wee_l_q10;
output		wee_l_q11;
output		wee_l_q20;
output		wee_l_q21;
output		wee_l_q30;
output		wee_l_q31;

output 		delout00;
output 		delout01;
output 		delout10;
output 		delout11;
output 		delout20;
output 		delout21;
output 		delout30;
output 		delout31;

//////////////////////////////////////////////////////////////////////////////
assign tcu_array_wr_inhibit = array_wr_inhibit;
wire pce_ov;
wire siclk;
wire soclk;
//wire scan_out;

//assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
//assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign aclk = tcu_aclk;
assign bclk = tcu_bclk;
assign scan_en_clsrhdr = tcu_scan_en;

assign siclk_peri = siclk;
assign soclk_peri = soclk;
assign pce_ov_peri = pce_ov;
assign pce_peri = tcu_ce;
assign scan_collarin_peri = tcu_se_scancollar_in;
assign scan_collarout_peri = tcu_se_scancollar_out;
assign wr_inhibit_peri = tcu_array_wr_inhibit;
assign clk_stop_peri = tcu_clk_stop;

assign wee_l_q00 = ~tcu_array_wr_inhibit;
assign wee_l_q01 = ~tcu_array_wr_inhibit;
assign wee_l_q10 = ~tcu_array_wr_inhibit;
assign wee_l_q11 = ~tcu_array_wr_inhibit;
assign wee_l_q20 = ~tcu_array_wr_inhibit;
assign wee_l_q21 = ~tcu_array_wr_inhibit;
assign wee_l_q30 = ~tcu_array_wr_inhibit;
assign wee_l_q31 = ~tcu_array_wr_inhibit;

//////////////////////////////////////////////////////////////////////////////

wire	[623:0] cache_decc_in_c3b_l;

wire	[623:0]	cache_decc_in_c3;
//wire	[623:0]	cache_decc_out_c52;
wire	[623:0]	concat_st_decc_out_c3;
wire	[623:0]	l2d_decc_out_c52;
wire	[155:0]	l2d_l2t_decc_c52;
wire	[155:0]	l2d_l2t_decc_c6;		// read data rtn to load 16B
wire	[623:0] l2b_l2d_fbdecc_c52; 
wire	[623:0] l2b_l2d_fbdecc_c5; 


n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro l1_clk_in_hdr (
        .l2clk  (l2clk),
        .se     (tcu_se_scancollar_in),
        .l1en   (tcu_ce),
        .pce_ov (tcu_pce_ov),
        .stop   (tcu_clk_stop),
        .l1clk  (l1clk_in)
        );

n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro l1_clk_intnl_hdr (
        .l2clk  (l2clk),
        .se     (tcu_scan_en),
        .l1en   (tcu_ce),
        .pce_ov (tcu_pce_ov),
        .stop   (tcu_clk_stop),
        .l1clk  (l1clk_intnl)
        );

n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro l1_clk_evict_c6_hdr (
        .l2clk  (l2clk),
        .se     (tcu_scan_en),
        .l1en   (evit_pce_c6),
        .pce_ov (tcu_pce_ov),
        .stop   (tcu_clk_stop),
        .l1clk  (l1clk_evict_c6)
        );

assign cache_way_sel_c3_00[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_01[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_10[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_11[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_20[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_21[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_30[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_31[15:0] = l2t_l2d_way_sel_c3[15:0];


//
// Way select when more than one is turned on
//


assign cache_wayerr_c3_00 = wayerr_c3;
assign cache_wayerr_c3_01 = wayerr_c3;
assign cache_wayerr_c3_10 = wayerr_c3;
assign cache_wayerr_c3_11 = wayerr_c3;
assign cache_wayerr_c3_20 = wayerr_c3;
assign cache_wayerr_c3_21 = wayerr_c3;
assign cache_wayerr_c3_30 = wayerr_c3;
assign cache_wayerr_c3_31 = wayerr_c3;

// set

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_9   ff_cache_set_c3   
     (
     .scan_in(ff_cache_set_c3_scanin[8:0]),
     .scan_out(ff_cache_set_c3_scanout[8:0]),
     .din	     (l2t_l2d_set_c2[8:0]),
     .l1clk	       (l1clk_in),
     .dout	     (cache_set_c3[8:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

assign cache_set_c3_00[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_01[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_10[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_11[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_20[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_21[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_30[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_31[8:0] = cache_set_c3[8:0];         

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c3   
     (
     .scan_in(ff_cache_col_offset_c3_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c3_scanout[3:0]),
     .din	     (l2t_l2d_col_offset_c2[3:0]),
     .l1clk	       (l1clk_in),
     .dout	     (cache_col_offset_c3[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4   
                (
                .scan_in(ff_cache_col_offset_c4_scanin[3:0]),
                .scan_out(ff_cache_col_offset_c4_scanout[3:0]),
                .din            (cache_col_offset_c3[3:0]),
                .l1clk            (l1clk_intnl),
                .dout           (cache_col_offset_c4_muxsel[3:0]),
  .siclk(siclk),
  .soclk(soclk)
                );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_muxsel   
                (
                .scan_in(ff_cache_col_offset_c5_muxsel_scanin[3:0]),
                .scan_out(ff_cache_col_offset_c5_muxsel_scanout[3:0]),
                .din            (cache_col_offset_c4_muxsel[3:0]),
                .l1clk            (l1clk_intnl),
                .dout           (cache_col_offset_c5_muxsel[3:0]),
  .siclk(siclk),
  .soclk(soclk)
                );



n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c52   
                (
                .scan_in(ff_cache_col_offset_c52_scanin[1:0]),
                .scan_out(ff_cache_col_offset_c52_scanout[1:0]),
                .din            (cache_col_offset_c5_muxsel[3:2]),
                .l1clk            (l1clk_intnl),
                .dout           (cache_col_offset_c52[3:2]),
  .siclk(siclk),
  .soclk(soclk)
                );

n2_l2d_sp_512kb_cust_or_macro__width_1 slice_or_col_offset_c5_3_1 
	(
	.dout	(cache_col_offset_c5_muxsel_3_or_1),
	.din0	(cache_col_offset_c5_muxsel[3]),
	.din1	(cache_col_offset_c5_muxsel[1])
	);


n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_c52_topsel   
     (
     .scan_in(ff_cache_col_offset_c52_topsel_scanin[0:0]),
     .scan_out(ff_cache_col_offset_c52_topsel_scanout[0:0]),
//     .din	     (cache_col_offset_c5_muxsel[3] | cache_col_offset_c5_muxsel[1]),
	.din	(cache_col_offset_c5_muxsel_3_or_1),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_c52_topsel),
  .siclk(siclk),
  .soclk(soclk)
     );


//assign cache_col_offset_all_c3 = cache_col_offset_c3[3] & 
//		cache_col_offset_c3[2] & cache_col_offset_c3[1] & cache_col_offset_c3[0];

n2_l2d_sp_512kb_cust_and_macro__ports_4__width_1 slice_and_cache_col_offset_all_c3 
	(
	.dout	(cache_col_offset_all_c3),
	.din3	(cache_col_offset_c3[3]),
	.din2	(cache_col_offset_c3[2]),
	.din1	(cache_col_offset_c3[1]),
	.din0	(cache_col_offset_c3[0])
	);


n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_all_c4   
     (
     .scan_in(ff_cache_col_offset_all_c4_scanin[0:0]),
     .scan_out(ff_cache_col_offset_all_c4_scanout[0:0]),
     .din	     (cache_col_offset_all_c3),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_all_c4),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_all_c5  
     (
     .scan_in(ff_cache_col_offset_all_c5_scanin[0:0]),
     .scan_out(ff_cache_col_offset_all_c5_scanout[0:0]),
     .din	     (cache_col_offset_all_c4),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_all_c5),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_all_c6   
     (
     .scan_in(ff_cache_col_offset_all_c6_scanin[0:0]),
     .scan_out(ff_cache_col_offset_all_c6_scanout[0:0]),
     .din	     (cache_col_offset_all_c5),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_all_c6),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_all_c7   
     (
     .scan_in(ff_cache_col_offset_all_c7_scanin[0:0]),
     .scan_out(ff_cache_col_offset_all_c7_scanout[0:0]),
     .din	     (cache_col_offset_all_c6),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_all_c7),
  .siclk(siclk),
  .soclk(soclk)
     ); 	     
	

//assign evit_pce_c6 = cache_col_offset_all_c6 | l2t_l2d_pwrsav_ov_stg;

n2_l2d_sp_512kb_cust_or_macro__width_1 or_slice_evit_pce_c6 
	(
	.dout	(evit_pce_c6),
	.din0	(cache_col_offset_all_c6),
	.din1	(l2t_l2d_pwrsav_ov_stg)
	);




//assign    cache_col_offset_c3_00 = |{cache_col_offset_c3[2],cache_col_offset_c3[0]};
//assign    cache_col_offset_c3_01 = |{cache_col_offset_c3[2],cache_col_offset_c3[0]};
//assign    cache_col_offset_c3_10 = |{cache_col_offset_c3[3],cache_col_offset_c3[1]};
//assign    cache_col_offset_c3_11 = |{cache_col_offset_c3[3],cache_col_offset_c3[1]};
//assign    cache_col_offset_c3_20 = |{cache_col_offset_c3[2],cache_col_offset_c3[0]};
//assign    cache_col_offset_c3_21 = |{cache_col_offset_c3[2],cache_col_offset_c3[0]};
//assign    cache_col_offset_c3_30 = |{cache_col_offset_c3[3],cache_col_offset_c3[1]};
//assign    cache_col_offset_c3_31 = |{cache_col_offset_c3[3],cache_col_offset_c3[1]};


n2_l2d_sp_512kb_cust_inv_macro__width_1 inv_tcu_array_wr_inhibit 
	(
	.dout	(tcu_array_wr_inhibit_n),
	.din	(tcu_array_wr_inhibit)
	);

n2_l2d_sp_512kb_cust_and_macro__width_1 and_slice_cache_col_offset_c3_00_0 
	(
	.dout	(cache_col_offset_c3_2_tcu_array_wr_inhibit_n),
	.din0	(tcu_array_wr_inhibit_n),
	.din1	(cache_col_offset_c3[2])
	);

n2_l2d_sp_512kb_cust_and_macro__width_1 and_slice_cache_col_offset_c3_00_1 
        (
        .dout   (cache_col_offset_c3_0_tcu_array_wr_inhibit_n),
        .din0   (tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3[0])
        );

n2_l2d_sp_512kb_cust_and_macro__width_1 and_slice_cache_col_offset_c3_10_0 
        (
        .dout   (cache_col_offset_c3_3_tcu_array_wr_inhibit_n),
        .din0    (tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3[3])
        );

n2_l2d_sp_512kb_cust_and_macro__width_1 and_slice_cache_col_offset_c3_10_1 
        (
        .dout   (cache_col_offset_c3_1_tcu_array_wr_inhibit_n),
        .din0    (tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3[1])
        );


n2_l2d_sp_512kb_cust_or_macro__width_1 or_cache_col_offset_c3_00 
        (
        .dout   (cache_col_offset_c3_00),
        .din0   (cache_col_offset_c3_2_tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3_0_tcu_array_wr_inhibit_n)
        );
n2_l2d_sp_512kb_cust_or_macro__width_1 or_cache_col_offset_c3_10 
        (
        .dout   (cache_col_offset_c3_10),
//        .din0   (~tcu_array_wr_inhibit & cache_col_offset_c3[3]),
//        .din1   (~tcu_array_wr_inhibit & cache_col_offset_c3[1])
	.din0	(cache_col_offset_c3_3_tcu_array_wr_inhibit_n),
	.din1	(cache_col_offset_c3_1_tcu_array_wr_inhibit_n)
        );

n2_l2d_sp_512kb_cust_or_macro__width_1 or_cache_col_offset_c3_20 
        (
        .dout   (cache_col_offset_c3_20),
//        .din0   (~tcu_array_wr_inhibit & cache_col_offset_c3[2]),
//        .din1   (~tcu_array_wr_inhibit & cache_col_offset_c3[0])
	.din0	(cache_col_offset_c3_2_tcu_array_wr_inhibit_n),
	.din1	(cache_col_offset_c3_0_tcu_array_wr_inhibit_n)
        );

n2_l2d_sp_512kb_cust_or_macro__width_1 or_cache_col_offset_c3_30 
        (
        .dout   (cache_col_offset_c3_30),
//        .din0   (~tcu_array_wr_inhibit & cache_col_offset_c3[3]),
//        .din1   (~tcu_array_wr_inhibit & cache_col_offset_c3[1])
	.din0	(cache_col_offset_c3_3_tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3_1_tcu_array_wr_inhibit_n)
        );

assign cache_col_offset_c3_01 = cache_col_offset_c3_00;
assign cache_col_offset_c3_11 = cache_col_offset_c3_10;
assign cache_col_offset_c3_21 = cache_col_offset_c3_20;
assign cache_col_offset_c3_31 = cache_col_offset_c3_30;

//inv_macro    inv_cache_col_offset_c3	(width=4)
//	(
//	.dout	(cache_col_offset_c3_1[3:0]),
//	.din	(cache_col_offset_c3[3:0])
//	);

//msff_ctl_macro   ff_cache_col_offset_c4   (fs=1,width=4)
//     (
//     .scan_in(ff_cache_col_offset_c4_scanin[3:0]),
//     .scan_out(ff_cache_col_offset_c4_scanout[3:0]),
//     .din  (cache_col_offset_c4_l[3:0] & (cache_col_offset_c3[3:0] & {4{~tcu_array_wr_inhibit}})),
//     .l1clk	       (l1clk_intnl),
//     .dout	     (cache_col_offset_c4[3:0]),
//     );
//
//assign    cache_col_offset_c4_l_00 = (&{cache_col_offset_c4_l[2],cache_col_offset_c4_l[0]});
//assign    cache_col_offset_c4_l_01 = (&{cache_col_offset_c4_l[2],cache_col_offset_c4_l[0]});
//assign    cache_col_offset_c4_l_10 = (&{cache_col_offset_c4_l[3],cache_col_offset_c4_l[1]});
//assign    cache_col_offset_c4_l_11 = (&{cache_col_offset_c4_l[3],cache_col_offset_c4_l[1]});
//assign    cache_col_offset_c4_l_20 = (&{cache_col_offset_c4_l[2],cache_col_offset_c4_l[0]});
//assign    cache_col_offset_c4_l_21 = (&{cache_col_offset_c4_l[2],cache_col_offset_c4_l[0]});
//assign    cache_col_offset_c4_l_30 = (&{cache_col_offset_c4_l[3],cache_col_offset_c4_l[1]});
//assign    cache_col_offset_c4_l_31 = (&{cache_col_offset_c4_l[3],cache_col_offset_c4_l[1]});


n2_l2d_sp_512kb_cust_inv_macro__width_8 inv_cache_col_offset_c4_tog_all 
	(
	.dout	( { cache_col_offset_c4_tog_001_0_n, cache_col_offset_c4_tog_101_0_n,
                    cache_col_offset_c4_tog_001_1_n, cache_col_offset_c4_tog_101_1_n,
                    cache_col_offset_c4_tog_023_0_n, cache_col_offset_c4_tog_123_0_n,
                    cache_col_offset_c4_tog_023_1_n, cache_col_offset_c4_tog_123_1_n } ),
	.din	( { cache_col_offset_c4_tog_001[0],  cache_col_offset_c4_tog_101[0],
                    cache_col_offset_c4_tog_001[1],  cache_col_offset_c4_tog_101[1],
                    cache_col_offset_c4_tog_023[0],  cache_col_offset_c4_tog_123[0],
                    cache_col_offset_c4_tog_023[1],  cache_col_offset_c4_tog_123[1] })
	);

//assign    cache_col_offset_c4_l_00 =  ~cache_col_offset_c4_tog_001[0] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_01 =  ~cache_col_offset_c4_tog_101[0] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_10 =  ~cache_col_offset_c4_tog_001[1] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_11 =  ~cache_col_offset_c4_tog_101[1] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_20 =  ~cache_col_offset_c4_tog_023[0] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_21 =  ~cache_col_offset_c4_tog_123[0] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_30 =  ~cache_col_offset_c4_tog_023[1] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_31 =  ~cache_col_offset_c4_tog_123[1] |tcu_array_wr_inhibit;


n2_l2d_sp_512kb_cust_or_macro__width_8 slice_or_cache_col_offset_c4_l_00_to31 
	(
	.dout	( {
		  cache_col_offset_c4_l_00,
                  cache_col_offset_c4_l_01,
                  cache_col_offset_c4_l_10,
                  cache_col_offset_c4_l_11,
                  cache_col_offset_c4_l_20,
                  cache_col_offset_c4_l_21,
                  cache_col_offset_c4_l_30,
                  cache_col_offset_c4_l_31
		 } ),
	.din0	( {
		cache_col_offset_c4_tog_001_0_n,
                cache_col_offset_c4_tog_101_0_n,
                cache_col_offset_c4_tog_001_1_n,
                cache_col_offset_c4_tog_101_1_n,
                cache_col_offset_c4_tog_023_0_n,
                cache_col_offset_c4_tog_123_0_n,
                cache_col_offset_c4_tog_023_1_n,
                cache_col_offset_c4_tog_123_1_n
		}),
	.din1	({8{tcu_array_wr_inhibit}})
	);



n2_l2d_sp_512kb_cust_inv_macro__width_4 inv_slice_cache_col_offset_c3_x 
	(
	.dout	(cache_col_offset_c3_n[3:0]),
	.din	(cache_col_offset_c3[3:0])
	);


n2_l2d_sp_512kb_cust_or_macro__width_4 or_wr_inhibit_cache_col_offset_c3 
        (
        .dout   (wr_inhibit_cache_col_offset_c3_l[3:0]),
//        .din0   (~cache_col_offset_c3[3:0]),
        .din0   (cache_col_offset_c3_n[3:0]),
        .din1   ({4{tcu_array_wr_inhibit}})
        );


n2_l2d_sp_512kb_cust_inv_macro__width_4    inv_wr_inhibit_cache_col_offset_c3    
	(
	.dout	(wr_inhibit_cache_col_offset_c3[3:0]),
	.din	(wr_inhibit_cache_col_offset_c3_l[3:0])
	);

n2_l2d_sp_512kb_cust_inv_macro__width_2 inv_slice_cache_col_offset_c4_tog_001_x 
        (
        .dout   (cache_col_offset_c4_tog_001_n[1:0]),
        .din    (cache_col_offset_c4_tog_001[1:0])
        );

n2_l2d_sp_512kb_cust_inv_macro__width_1 inv_wayerr_c3 
	(
	.dout	(wayerr_c3_n),
	.din	(wayerr_c3)
	);

n2_l2d_sp_512kb_cust_and_macro__width_2 and_wayerr_col_offset_c4_l_001 
        (
        .dout   (wayerr_cache_col_offset_c4_l_tog_001[1:0]),
        .din0   (cache_col_offset_c4_tog_001_n[1:0]),
        .din1   ({2{wayerr_c3_n}})
        );

n2_l2d_sp_512kb_cust_inv_macro__width_2 inv_slice_cache_col_offset_c4_tog_101_x 
        (
        .dout   (cache_col_offset_c4_tog_101_n[1:0]),
        .din    (cache_col_offset_c4_tog_101[1:0])
        );

n2_l2d_sp_512kb_cust_and_macro__width_2 and_wayerr_col_offset_c4_l_101 
        (
        .dout   (wayerr_cache_col_offset_c4_l_tog_101[1:0]),
//        .din0   (~cache_col_offset_c4_tog_101[1:0]),
        .din0   (cache_col_offset_c4_tog_101_n[1:0]),
        .din1   ({2{wayerr_c3_n}})
        );

n2_l2d_sp_512kb_cust_inv_macro__width_2 inv_slice_cache_col_offset_c4_tog_023_x 
        (
        .dout   (cache_col_offset_c4_tog_023_n[1:0]),
        .din    (cache_col_offset_c4_tog_023[1:0])
        );


n2_l2d_sp_512kb_cust_and_macro__width_2 and_wayerr_col_offset_c4_l_023 
        (
        .dout   (wayerr_cache_col_offset_c4_l_tog_023[1:0]),
        .din0   (cache_col_offset_c4_tog_023_n[1:0]),
        .din1   ({2{wayerr_c3_n}})
        );

n2_l2d_sp_512kb_cust_inv_macro__width_2 inv_slice_cache_col_offset_c4_tog_123_x 
        (
        .dout   (cache_col_offset_c4_tog_123_n[1:0]),
        .din    (cache_col_offset_c4_tog_123[1:0])
        );

n2_l2d_sp_512kb_cust_and_macro__width_2 and_wayerr_col_offset_c4_l_123 
        (
        .dout   (wayerr_cache_col_offset_c4_l_tog_123[1:0]),
//        .din0   (~cache_col_offset_c4_tog_123[1:0]),
        .din0   (cache_col_offset_c4_tog_123_n[1:0]),
        .din1   ({2{wayerr_c3_n}})
        );

n2_l2d_sp_512kb_cust_or_macro__width_1 or_col_offset_c3_top 
        (
        .dout   (cache_col_offset_c3_top),
        .din0   (wr_inhibit_cache_col_offset_c3[3]),
        .din1   (wr_inhibit_cache_col_offset_c3[1])
        );

n2_l2d_sp_512kb_cust_or_macro__width_1 or_col_offset_c3_bot 
        (
        .dout   (cache_col_offset_c3_bot),
        .din0   (wr_inhibit_cache_col_offset_c3[2]),
        .din1   (wr_inhibit_cache_col_offset_c3[0])
        );

n2_l2d_sp_512kb_cust_and_macro__width_2 and_cache_col_offset_c4_tog_in_001 
        (
        .dout   (cache_col_offset_c4_tog_in_001[1:0]),
        .din0   (wayerr_cache_col_offset_c4_l_tog_001[1:0]),
        .din1   ({cache_col_offset_c3_top,cache_col_offset_c3_bot})
        );

n2_l2d_sp_512kb_cust_and_macro__width_2 slice_cache_col_offset_c4_tog_in_101 
        (
        .dout   (cache_col_offset_c4_tog_in_101[1:0]),
        .din0   (wayerr_cache_col_offset_c4_l_tog_101[1:0]),
        .din1   ({cache_col_offset_c3_top,cache_col_offset_c3_bot})
        );
n2_l2d_sp_512kb_cust_and_macro__width_2 slice_cache_col_offset_c4_tog_in_023 
        (
        .dout   (cache_col_offset_c4_tog_in_023[1:0]),
        .din0   (wayerr_cache_col_offset_c4_l_tog_023[1:0]),
        .din1   ({cache_col_offset_c3_top,cache_col_offset_c3_bot})
        );
n2_l2d_sp_512kb_cust_and_macro__width_2 slice_cache_col_offset_c4_tog_in_123 
        (
        .dout   (cache_col_offset_c4_tog_in_123[1:0]),
        .din0   (wayerr_cache_col_offset_c4_l_tog_123[1:0]),
        .din1   ({cache_col_offset_c3_top,cache_col_offset_c3_bot})
        );		
	
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c4_tog_001   
     (
     .scan_in(ff_cache_col_offset_c4_tog_001_scanin[1:0]),
     .scan_out(ff_cache_col_offset_c4_tog_001_scanout[1:0]),
     .din     (cache_col_offset_c4_tog_in_001[1:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_tog_001[1:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c4_tog_101   
     (
     .scan_in(ff_cache_col_offset_c4_tog_101_scanin[1:0]),
     .scan_out(ff_cache_col_offset_c4_tog_101_scanout[1:0]),
     .din     (cache_col_offset_c4_tog_in_101[1:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_tog_101[1:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c4_tog_023   
     (
     .scan_in(ff_cache_col_offset_c4_tog_023_scanin[1:0]),
     .scan_out(ff_cache_col_offset_c4_tog_023_scanout[1:0]),
      .din     (cache_col_offset_c4_tog_in_023[1:0]),
      .l1clk   (l1clk_intnl),
      .dout    (cache_col_offset_c4_tog_023[1:0]),
  .siclk(siclk),
  .soclk(soclk)
      );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c4_tog_123   
     (
     .scan_in(ff_cache_col_offset_c4_tog_123_scanin[1:0]),
     .scan_out(ff_cache_col_offset_c4_tog_123_scanout[1:0]),
     .din     (cache_col_offset_c4_tog_in_123[1:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_tog_123[1:0]),
  .siclk(siclk),
  .soclk(soclk)
     );


n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4_001   
     (
     .scan_in(ff_cache_col_offset_c4_001_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c4_001_scanout[3:0]),
     .din     (wr_inhibit_cache_col_offset_c3[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_001[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4_101   
     (
     .scan_in(ff_cache_col_offset_c4_101_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c4_101_scanout[3:0]),
     .din     (wr_inhibit_cache_col_offset_c3[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_101[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4_023   
     (
     .scan_in(ff_cache_col_offset_c4_023_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c4_023_scanout[3:0]),
      .din     (wr_inhibit_cache_col_offset_c3[3:0]),
      .l1clk   (l1clk_intnl),
      .dout    (cache_col_offset_c4_023[3:0]),
  .siclk(siclk),
  .soclk(soclk)
      );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4_123   
     (
     .scan_in(ff_cache_col_offset_c4_123_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c4_123_scanout[3:0]),
     .din     (wr_inhibit_cache_col_offset_c3[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_123[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_and_macro__width_4  and_cache_col_offset_c5_001_in 
        (
        .dout   (cache_col_offset_c5_001_in[3:0]),
        .din0   ({cache_col_offset_c4_tog_001[1:0],cache_col_offset_c4_tog_001[1:0]}),
        .din1   (cache_col_offset_c4_001[3:0])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_4  and_cache_col_offset_c5_101_in 
        (
        .dout   (cache_col_offset_c5_101_in[3:0]),
        .din0   ({cache_col_offset_c4_tog_101[1:0],cache_col_offset_c4_tog_101[1:0]}),
        .din1   (cache_col_offset_c4_101[3:0])
        );

n2_l2d_sp_512kb_cust_and_macro__width_4  and_cache_col_offset_c5_023_in 
        (
        .dout   (cache_col_offset_c5_023_in[3:0]),
        .din0   ({cache_col_offset_c4_tog_023[1:0],cache_col_offset_c4_tog_023[1:0]}),
        .din1   (cache_col_offset_c4_023[3:0])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_4  and_cache_col_offset_c5_123_in 
        (
        .dout   (cache_col_offset_c5_123_in[3:0]),
        .din0   ({cache_col_offset_c4_tog_123[1:0],cache_col_offset_c4_tog_123[1:0]}),
        .din1   (cache_col_offset_c4_123[3:0])
        );		

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_001   
     (
     .scan_in(ff_cache_col_offset_c5_001_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c5_001_scanout[3:0]),
     .din     (cache_col_offset_c5_001_in[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c5_001[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_101   
     (
     .scan_in(ff_cache_col_offset_c5_101_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c5_101_scanout[3:0]),
     .din     (cache_col_offset_c5_101_in[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c5_101[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_023   
     (
     .scan_in(ff_cache_col_offset_c5_023_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c5_023_scanout[3:0]),
      .din     (cache_col_offset_c5_023_in[3:0]),
      .l1clk   (l1clk_intnl),
      .dout    (cache_col_offset_c5_023[3:0]),
  .siclk(siclk),
  .soclk(soclk)
      );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_123   
     (
     .scan_in(ff_cache_col_offset_c5_123_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c5_123_scanout[3:0]),
     .din     (cache_col_offset_c5_123_in[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c5_123[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

//assign    cache_col_offset_c4_l_00 = ~(|{cache_col_offset_c4[2],cache_col_offset_c4[0]});
//assign    cache_col_offset_c4_l_01 = ~(|{cache_col_offset_c4[2],cache_col_offset_c4[0]});
//assign    cache_col_offset_c4_l_10 = ~(|{cache_col_offset_c4[3],cache_col_offset_c4[1]});
//assign    cache_col_offset_c4_l_11 = ~(|{cache_col_offset_c4[3],cache_col_offset_c4[1]});
//assign    cache_col_offset_c4_l_20 = ~(|{cache_col_offset_c4[2],cache_col_offset_c4[0]});
//assign    cache_col_offset_c4_l_21 = ~(|{cache_col_offset_c4[2],cache_col_offset_c4[0]});
//assign    cache_col_offset_c4_l_30 = ~(|{cache_col_offset_c4[3],cache_col_offset_c4[1]});
//assign    cache_col_offset_c4_l_31 = ~(|{cache_col_offset_c4[3],cache_col_offset_c4[1]});

assign    cache_col_offset_c5_00[1:0] 	= {cache_col_offset_c5_001[2],cache_col_offset_c5_001[0]};
assign    cache_col_offset_c5_01[1:0] 	= {cache_col_offset_c5_101[2],cache_col_offset_c5_101[0]};
assign    cache_col_offset_c5_10[1:0] 	= {cache_col_offset_c5_001[3],cache_col_offset_c5_001[1]};
assign    cache_col_offset_c5_11[1:0] 	= {cache_col_offset_c5_101[3],cache_col_offset_c5_101[1]};
assign    cache_col_offset_c5_20[1:0] 	= {cache_col_offset_c5_023[2],cache_col_offset_c5_023[0]};
assign    cache_col_offset_c5_21[1:0] 	= {cache_col_offset_c5_123[2],cache_col_offset_c5_123[0]};
assign    cache_col_offset_c5_30[1:0] 	= {cache_col_offset_c5_023[3],cache_col_offset_c5_023[1]};
assign    cache_col_offset_c5_31[1:0] 	= {cache_col_offset_c5_123[3],cache_col_offset_c5_123[1]};


// read writes signals




//assign  cache_rd_wr_c3_00 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_01 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_10 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_11 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_20 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_21 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_30 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_31 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_next_stage = cache_rd_wr_c3 | tcu_array_wr_inhibit;

n2_l2d_sp_512kb_cust_or_macro__width_1 or_x111 
	(
	.dout	(cache_rd_wr_c3_generic),
	.din0	(l2t_l2d_rd_wr_c3),
	.din1	(1'b0)
	);

n2_l2d_sp_512kb_cust_or_macro__width_1 or_x112 
        (
        .dout   (cache_rd_wr_c3_next_stage),
        .din0   (l2t_l2d_rd_wr_c3),
        .din1   (1'b0)
        );


assign cache_rd_wr_c3_00 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_01 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_10 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_11 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_20 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_21 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_30 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_31 = cache_rd_wr_c3_generic;

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c4   
     (
     .scan_in(ff_cache_cache_rd_wr_c4_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c4_scanout[0:0]),
     .din	     (cache_rd_wr_c3_next_stage),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c4),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c5_00   
     (
     .scan_in(ff_cache_cache_rd_wr_c5_00_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c5_00_scanout[0:0]),
     .din	     (cache_rd_wr_c4),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c5_00),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c5_01   
     (
     .scan_in(ff_cache_cache_rd_wr_c5_01_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c5_01_scanout[0:0]),
     .din	     (cache_rd_wr_c4),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c5_01),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c5_20   
     (
     .scan_in(ff_cache_cache_rd_wr_c5_20_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c5_20_scanout[0:0]),
     .din	     (cache_rd_wr_c4),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c5_20),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c5_21   
     (
     .scan_in(ff_cache_cache_rd_wr_c5_21_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c5_21_scanout[0:0]),
     .din	     (cache_rd_wr_c4),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c5_21),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_and_macro__width_8 and_slice_cache_rd_wr_c5_x 
	(
	.dout	({cache_readen_c5_00,
                  cache_readen_c5_01,
                  cache_readen_c5_10,
                  cache_readen_c5_11,
                  cache_readen_c5_20,
                  cache_readen_c5_21,
                  cache_readen_c5_30,
                  cache_readen_c5_31
		}),
	.din0	({cache_rd_wr_c5_00,
                  cache_rd_wr_c5_01,
                  cache_rd_wr_c5_00,
                  cache_rd_wr_c5_01,
                  cache_rd_wr_c5_20,
                  cache_rd_wr_c5_21,
                  cache_rd_wr_c5_20,
                  cache_rd_wr_c5_21
		}),
	.din1	({8{tcu_array_wr_inhibit_n}})
	);


//assign cache_readen_c5_00 = cache_rd_wr_c5_00 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_01 = cache_rd_wr_c5_01 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_10 = cache_rd_wr_c5_00 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_11 = cache_rd_wr_c5_01 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_20 = cache_rd_wr_c5_20 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_21 = cache_rd_wr_c5_21 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_30 = cache_rd_wr_c5_20 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_31 = cache_rd_wr_c5_21 & ~tcu_array_wr_inhibit;


// word enables for writes
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_16   ff_cache_word_en_c3   
     (
     .scan_in(ff_cache_word_en_c3_scanin[15:0]),
     .scan_out(ff_cache_word_en_c3_scanout[15:0]),
     .din	     (l2t_l2d_word_en_c2[15:0]),
     .l1clk	       (l1clk_in),
     .dout	     (cache_word_en_c3[15:0]),
  .siclk(siclk),
  .soclk(soclk)
     );



//assign cache_word_en_c3_11[3:0]   = {cache_word_en_c3[4],cache_word_en_c3[6], cache_word_en_c3[12],cache_word_en_c3[14]};
//assign cache_word_en_c3_10[3:0]   = {cache_word_en_c3[14],cache_word_en_c3[12], cache_word_en_c3[6],cache_word_en_c3[4]};
//assign cache_word_en_c3_01[3:0]   = {cache_word_en_c3[0],cache_word_en_c3[2], cache_word_en_c3[8],cache_word_en_c3[10]};
//assign cache_word_en_c3_00[3:0]   = {cache_word_en_c3[10],cache_word_en_c3[8], cache_word_en_c3[2],cache_word_en_c3[0]};
//assign cache_word_en_c3_21[3:0]   = {cache_word_en_c3[1],cache_word_en_c3[3], cache_word_en_c3[9],cache_word_en_c3[11]};
//assign cache_word_en_c3_20[3:0]   = {cache_word_en_c3[11],cache_word_en_c3[9], cache_word_en_c3[3],cache_word_en_c3[1]};
//assign cache_word_en_c3_31[3:0]   = {cache_word_en_c3[5],cache_word_en_c3[7], cache_word_en_c3[13],cache_word_en_c3[15]};
//assign cache_word_en_c3_30[3:0]   = {cache_word_en_c3[15],cache_word_en_c3[13], cache_word_en_c3[7],cache_word_en_c3[5]};


assign cache_word_en_c3_01[3:0]   = {cache_word_en_c3[2], cache_word_en_c3[0],cache_word_en_c3[10],cache_word_en_c3[8]};
assign cache_word_en_c3_11[3:0]   = {cache_word_en_c3[6], cache_word_en_c3[4],cache_word_en_c3[14],cache_word_en_c3[12]};
assign cache_word_en_c3_21[3:0]   = {cache_word_en_c3[3], cache_word_en_c3[1],cache_word_en_c3[11],cache_word_en_c3[9] };
assign cache_word_en_c3_31[3:0]   = {cache_word_en_c3[7], cache_word_en_c3[5],cache_word_en_c3[15],cache_word_en_c3[13]};

assign cache_word_en_c3_00[3:0]   = {cache_word_en_c3[10],cache_word_en_c3[8], cache_word_en_c3[2],cache_word_en_c3[0]};
assign cache_word_en_c3_10[3:0]   = {cache_word_en_c3[14],cache_word_en_c3[12], cache_word_en_c3[6],cache_word_en_c3[4]};
assign cache_word_en_c3_20[3:0]   = {cache_word_en_c3[11],cache_word_en_c3[9], cache_word_en_c3[3],cache_word_en_c3[1]};
assign cache_word_en_c3_30[3:0]   = {cache_word_en_c3[15],cache_word_en_c3[13], cache_word_en_c3[7],cache_word_en_c3[5]};










// data going out
// sel fill data instead of store data.

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_sel_fbdecc_c4   
     (
     .scan_in(ff_cache_sel_fbdecc_c4_scanin[0:0]),
     .scan_out(ff_cache_sel_fbdecc_c4_scanout[0:0]),
     .din	     (l2t_l2d_fbrd_c3),
     .l1clk	       (l1clk_in),
     .dout	     (cache_sel_fbdecc_c4),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_sel_fbdecc_c5   
     (
     .scan_in(ff_cache_sel_fbdecc_c5_scanin[0:0]),
     .scan_out(ff_cache_sel_fbdecc_c5_scanout[0:0]),
     .din	     (cache_sel_fbdecc_c4),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_sel_fbdecc_c5),
  .siclk(siclk),
  .soclk(soclk)
     );


///
//	This portion will concat and prepare store data 
//	it will then mux fill dat awith store data and drive it to memory
//


n2_l2d_sp_512kb_cust_inv_macro__width_1 cache_sel_fbdecc_c5_inv_slice   (
        .dout   (cache_sel_fbdecc_c5_n),
        .din    (cache_sel_fbdecc_c5)
        );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_78   ff_l2t_l2d_stdecc_c3   
     (
     .scan_in(ff_l2t_l2d_stdecc_c3_scanin[77:0]),
     .scan_out(ff_l2t_l2d_stdecc_c3_scanout[77:0]),
     .din	     (l2t_l2d_stdecc_c2[77:0]),
     .l1clk	       (l1clk_in),
     .dout	     (l2t_l2d_stdecc_c3[77:0]),
  .siclk(siclk),
  .soclk(soclk)
     );



assign concat_st_decc_out_c3[623:0] = {l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0], 
	l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0], 
	l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0]};

n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_1  
	(
	.dout	(cache_decc_in_c3[38:0]),
	.din0	(concat_st_decc_out_c3[38:0]),
	.din1	(l2b_l2d_fbdecc_c5[38:0]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_2  
	(
	.dout	(cache_decc_in_c3[77:39]),
	.din0	(concat_st_decc_out_c3[77:39]),
	.din1	(l2b_l2d_fbdecc_c5[77:39]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_3  
	(
	.dout	(cache_decc_in_c3[116:78]),
	.din0	(concat_st_decc_out_c3[116:78]),
	.din1	(l2b_l2d_fbdecc_c5[116:78]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_4  
	(
	.dout	(cache_decc_in_c3[155:117]),
	.din0	(concat_st_decc_out_c3[155:117]),
	.din1	(l2b_l2d_fbdecc_c5[155:117]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_5  
	(
	.dout	(cache_decc_in_c3[194:156]),
	.din0	(concat_st_decc_out_c3[194:156]),
	.din1	(l2b_l2d_fbdecc_c5[194:156]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_6  
	(
	.dout	(cache_decc_in_c3[233:195]),
	.din0	(concat_st_decc_out_c3[233:195]),
	.din1	(l2b_l2d_fbdecc_c5[233:195]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_7  
	(
	.dout	(cache_decc_in_c3[272:234]),
	.din0	(concat_st_decc_out_c3[272:234]),
	.din1	(l2b_l2d_fbdecc_c5[272:234]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_8  
	(
	.dout	(cache_decc_in_c3[311:273]),
	.din0	(concat_st_decc_out_c3[311:273]),
	.din1	(l2b_l2d_fbdecc_c5[311:273]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_9  
	(
	.dout	(cache_decc_in_c3[350:312]),
	.din0	(concat_st_decc_out_c3[350:312]),
	.din1	(l2b_l2d_fbdecc_c5[350:312]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_10  
	(
	.dout	(cache_decc_in_c3[389:351]),
	.din0	(concat_st_decc_out_c3[389:351]),
	.din1	(l2b_l2d_fbdecc_c5[389:351]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_11  
	(
	.dout	(cache_decc_in_c3[428:390]),
	.din0	(concat_st_decc_out_c3[428:390]),
	.din1	(l2b_l2d_fbdecc_c5[428:390]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_12  
	(
	.dout	(cache_decc_in_c3[467:429]),
	.din0	(concat_st_decc_out_c3[467:429]),
	.din1	(l2b_l2d_fbdecc_c5[467:429]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_13  
	(
	.dout	(cache_decc_in_c3[506:468]),
	.din0	(concat_st_decc_out_c3[506:468]),
	.din1	(l2b_l2d_fbdecc_c5[506:468]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_14  
	(
	.dout	(cache_decc_in_c3[545:507]),
	.din0	(concat_st_decc_out_c3[545:507]),
	.din1	(l2b_l2d_fbdecc_c5[545:507]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_15  
	(
	.dout	(cache_decc_in_c3[584:546]),
	.din0	(concat_st_decc_out_c3[584:546]),
	.din1	(l2b_l2d_fbdecc_c5[584:546]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_16  
	(
	.dout	(cache_decc_in_c3[623:585]),
	.din0	(concat_st_decc_out_c3[623:585]),
	.din1	(l2b_l2d_fbdecc_c5[623:585]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);


// CHANGE 1
//always@(negedge l1clk)
//begin
//	cache_decc_in_c3b_l[623:0] <= ~cache_decc_in_c3[623:0];
//end
//

n2_l2d_sp_512kb_cust_tisram_blbi_macro__width_624	j3		 
  (
  .l1clk ( l1clk_intnl),
  .d_a   (cache_decc_in_c3[623:0]),
  .q_b_l (cache_decc_in_c3b_l[623:0])
  );


//assign cache_decc_in_c3b_l[623:0] = ~cache_decc_in_c3b[623:0];

//
// This portion will bypass filldata 
// and send out read data from meory or filldata

// sel fill buffer data over l2$ data.

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_fb_hit_c4   
     (
     .scan_in(ff_cache_fb_hit_c4_scanin[0:0]),
     .scan_out(ff_cache_fb_hit_c4_scanout[0:0]),
     .din	     (l2t_l2d_fb_hit_c3),
     .l1clk	       (l1clk_in),
     .dout	     (cache_fb_hit_c4),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_fb_hit_c5   
     (
     .scan_in(ff_cache_fb_hit_c5_scanin[0:0]),
     .scan_out(ff_cache_fb_hit_c5_scanout[0:0]),
     .din	     (cache_fb_hit_c4),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_fb_hit_c5),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1   ff_cache_fb_hit_c52   
     (
     .scan_in(ff_cache_fb_hit_c52_scanin[0:0]),
     .scan_out(ff_cache_fb_hit_c52_scanout[0:0]),
     .din	     (cache_fb_hit_c5),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_fb_hit_c52),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_sp_512kb_cust_inv_macro__width_1 cache_fb_hit_c52_inv_slice   (
        .dout   (cache_fb_hit_c52_n),
        .din    (cache_fb_hit_c52)
        );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo0_1 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[38:0]),
     .din            (l2b_l2d_fbdecc_c5[38:0]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo0_2 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[77:39]),
     .din            (l2b_l2d_fbdecc_c5[77:39]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi0_1 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[116:78]),
     .din            (l2b_l2d_fbdecc_c5[116:78]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi0_2 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[155:117]),
     .din            (l2b_l2d_fbdecc_c5[155:117]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo0_3 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[194:156]),
     .din            (l2b_l2d_fbdecc_c5[194:156]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo0_4 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[233:195]),
     .din            (l2b_l2d_fbdecc_c5[233:195]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi0_3 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[272:234]),
     .din            (l2b_l2d_fbdecc_c5[272:234]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi0_4 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[311:273]),
     .din            (l2b_l2d_fbdecc_c5[311:273]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
	
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo1_1 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[350:312]),
     .din            (l2b_l2d_fbdecc_c5[350:312]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo1_2 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[389:351]),
     .din            (l2b_l2d_fbdecc_c5[389:351]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi1_1 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[428:390]),
     .din            (l2b_l2d_fbdecc_c5[428:390]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi1_2 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[467:429]),
     .din            (l2b_l2d_fbdecc_c5[467:429]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo1_3 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[506:468]),
     .din            (l2b_l2d_fbdecc_c5[506:468]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo1_4 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[545:507]),
     .din            (l2b_l2d_fbdecc_c5[545:507]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi1_3 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[584:546]),
     .din            (l2b_l2d_fbdecc_c5[584:546]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi1_4 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[623:585]),
     .din            (l2b_l2d_fbdecc_c5[623:585]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
		
	
// CHECK 

//assign cache_decc_out_c52= {cache_decc_out_3_c52[155:0], cache_decc_out_2_c52[155:0],
//			cache_decc_out_1_c52[155:0],cache_decc_out_0_c52[155:0]};

//mux_macro	mux_rd_decc_out_c52_1  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[38:0]),
//	.din0	(cache_decc_out_c52[38:0]),
//	.din1	(l2b_l2d_fbdecc_c52[38:0]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_2  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[77:39]),
//	.din0	(cache_decc_out_c52[77:39]),
//	.din1	(l2b_l2d_fbdecc_c52[77:39]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_3  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[116:78]),
//	.din0	(cache_decc_out_c52[116:78]),
//	.din1	(l2b_l2d_fbdecc_c52[116:78]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_4  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[155:117]),
//	.din0	(cache_decc_out_c52[155:117]),
//	.din1	(l2b_l2d_fbdecc_c52[155:117]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_5  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[194:156]),
//	.din0	(cache_decc_out_c52[194:156]),
//	.din1	(l2b_l2d_fbdecc_c52[194:156]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_6  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[233:195]),
//	.din0	(cache_decc_out_c52[233:195]),
//	.din1	(l2b_l2d_fbdecc_c52[233:195]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_7  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[272:234]),
//	.din0	(cache_decc_out_c52[272:234]),
//	.din1	(l2b_l2d_fbdecc_c52[272:234]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_8  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[311:273]),
//	.din0	(cache_decc_out_c52[311:273]),
//	.din1	(l2b_l2d_fbdecc_c52[311:273]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_9  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[350:312]),
//	.din0	(cache_decc_out_c52[350:312]),
//	.din1	(l2b_l2d_fbdecc_c52[350:312]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_10  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[389:351]),
//	.din0	(cache_decc_out_c52[389:351]),
//	.din1	(l2b_l2d_fbdecc_c52[389:351]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_11  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[428:390]),
//	.din0	(cache_decc_out_c52[428:390]),
//	.din1	(l2b_l2d_fbdecc_c52[428:390]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_12  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[467:429]),
//	.din0	(cache_decc_out_c52[467:429]),
//	.din1	(l2b_l2d_fbdecc_c52[467:429]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_13  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[506:468]),
//	.din0	(cache_decc_out_c52[506:468]),
//	.din1	(l2b_l2d_fbdecc_c52[506:468]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_14  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[545:507]),
//	.din0	(cache_decc_out_c52[545:507]),
//	.din1	(l2b_l2d_fbdecc_c52[545:507]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_15  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[584:546]),
//	.din0	(cache_decc_out_c52[584:546]),
//	.din1	(l2b_l2d_fbdecc_c52[584:546]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_16  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[623:585]),
//	.din0	(cache_decc_out_c52[623:585]),
//	.din1	(l2b_l2d_fbdecc_c52[623:585]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);

//assign 	   l2d_decc_out_c52[623:0] = rd_decc_out_c52[623:0];

//split following bus into 39 chunk because of the scan connection
//msff_ctl_macro      ff_l2d_decc_out_c6_0  (width=156)
//        (
//        .scan_in(ff_l2d_decc_out_c6_0_scanin),
//        .scan_out(ff_l2d_decc_out_c6_0_scanout),
//        .dout           (l2d_decc_out_c6[155:0]),
//        .din            (l2d_l2t_decc_c52_0[155:0]),
//        .l1clk            (l1clk_evict_c6),
//        );
//
//msff_ctl_macro      ff_l2d_decc_out_c6_1  (width=156)
//        (
//        .scan_in(ff_l2d_decc_out_c6_1_scanin),
//        .scan_out(ff_l2d_decc_out_c6_1_scanout),
//        .dout           (l2d_decc_out_c6[311:156]),
//        .din            (l2d_l2t_decc_c52_1[155:0]),
//        .l1clk            (l1clk_evict_c6),
//        );
//
//msff_ctl_macro      ff_l2d_decc_out_c6_2  (width=156)
//        (
//        .scan_in(ff_l2d_decc_out_c6_2_scanin),
//        .scan_out(ff_l2d_decc_out_c6_2_scanout),
//        .dout           (l2d_decc_out_c6[467:312]),
//        .din            (l2d_l2t_decc_c52_2[155:0]),
//        .l1clk            (l1clk_evict_c6),
//        );
//
//msff_ctl_macro      ff_l2d_decc_out_c6_3  (width=156)
//        (
//        .scan_in(ff_l2d_decc_out_c6_3_scanin),
//        .scan_out(ff_l2d_decc_out_c6_3_scanout),
//        .dout           (l2d_decc_out_c6[623:468]),
//        .din            (l2d_l2t_decc_c52_3[155:0]),
//        .l1clk            (l1clk_evict_c6),
//        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo0_1 
     (
     .scan_in(ff_l2d_decc_out_c6_lo0_1_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo0_1_scanout[38:0]),
     .dout           (l2d_decc_out_c6[38:0]),
     .din            (l2d_l2t_decc_c52_0[38:0]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo0_2 
     (
     .scan_in(ff_l2d_decc_out_c6_lo0_2_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo0_2_scanout[38:0]),
     .dout           (l2d_decc_out_c6[77:39]),
     .din            (l2d_l2t_decc_c52_0[77:39]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi0_1 
     (
     .scan_in(ff_l2d_decc_out_c6_hi0_1_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi0_1_scanout[38:0]),
     .dout           (l2d_decc_out_c6[116:78]),
     .din            (l2d_l2t_decc_c52_0[116:78]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi0_2 
     (
     .scan_in(ff_l2d_decc_out_c6_hi0_2_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi0_2_scanout[38:0]),
     .dout           (l2d_decc_out_c6[155:117]),
     .din            (l2d_l2t_decc_c52_0[155:117]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo0_3 
     (
     .scan_in(ff_l2d_decc_out_c6_lo0_3_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo0_3_scanout[38:0]),
     .dout           (l2d_decc_out_c6[194:156]),
     .din            (l2d_l2t_decc_c52_1[38:0]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo0_4 
     (
     .scan_in(ff_l2d_decc_out_c6_lo0_4_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo0_4_scanout[38:0]),
     .dout           (l2d_decc_out_c6[233:195]),
     .din            (l2d_l2t_decc_c52_1[77:39]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi0_3 
     (
     .scan_in(ff_l2d_decc_out_c6_hi0_3_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi0_3_scanout[38:0]),
     .dout           (l2d_decc_out_c6[272:234]),
     .din            (l2d_l2t_decc_c52_1[116:78]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi0_4 
     (
     .scan_in(ff_l2d_decc_out_c6_hi0_4_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi0_4_scanout[38:0]),
     .dout           (l2d_decc_out_c6[311:273]),
     .din            (l2d_l2t_decc_c52_1[155:117]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
	
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo1_1 
     (
     .scan_in(ff_l2d_decc_out_c6_lo1_1_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo1_1_scanout[38:0]),
     .dout           (l2d_decc_out_c6[350:312]),
     .din            (l2d_l2t_decc_c52_2[38:0]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo1_2 
     (
     .scan_in(ff_l2d_decc_out_c6_lo1_2_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo1_2_scanout[38:0]),
     .dout           (l2d_decc_out_c6[389:351]),
     .din            (l2d_l2t_decc_c52_2[77:39]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi1_1 
     (
     .scan_in(ff_l2d_decc_out_c6_hi1_1_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi1_1_scanout[38:0]),
     .dout           (l2d_decc_out_c6[428:390]),
     .din            (l2d_l2t_decc_c52_2[116:78]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi1_2 
     (
     .scan_in(ff_l2d_decc_out_c6_hi1_2_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi1_2_scanout[38:0]),
     .dout           (l2d_decc_out_c6[467:429]),
     .din            (l2d_l2t_decc_c52_2[155:117]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo1_3 
     (
     .scan_in(ff_l2d_decc_out_c6_lo1_3_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo1_3_scanout[38:0]),
     .dout           (l2d_decc_out_c6[506:468]),
     .din            (l2d_l2t_decc_c52_3[38:0]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo1_4 
     (
     .scan_in(ff_l2d_decc_out_c6_lo1_4_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo1_4_scanout[38:0]),
     .dout           (l2d_decc_out_c6[545:507]),
     .din            (l2d_l2t_decc_c52_3[77:39]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi1_3 
     (
     .scan_in(ff_l2d_decc_out_c6_hi1_3_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi1_3_scanout[38:0]),
     .dout           (l2d_decc_out_c6[584:546]),
     .din            (l2d_l2t_decc_c52_3[116:78]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi1_4 
     (
     .scan_in(ff_l2d_decc_out_c6_hi1_4_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi1_4_scanout[38:0]),
     .dout           (l2d_decc_out_c6[623:585]),
     .din            (l2d_l2t_decc_c52_3[155:117]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
		

////////////////////////////////////////////////////////////////////////
// The 64B-16B mux will be performed in the full custom data array.
// if the col offsets are non one hot, l2t will cause the hold signal
// to be high causing the output mux to hold its old value.
////////////////////////////////////////////////////////////////////////
//assign sel_top = cache_col_offset_c52[0] | cache_col_offset_c52[2];
//assign sel_bot = cache_col_offset_c52[1] | cache_col_offset_c52[3];
//
//assign l2d_l2t_decc_c52[155:0] = sel_top ? cache_decc_out_top_c52b[155:0] : 
//				cache_decc_out_bot_c52b[155:0];

//reg	[155:0] cache_decc_out_0_c52;
//reg	[155:0] cache_decc_out_1_c52;
//reg	[155:0] cache_decc_out_2_c52;
//reg	[155:0] cache_decc_out_3_c52;

//CHANGE 2
//always@(posedge l1clk)
//begin
//
//	cache_decc_out_0_c52_d[155:0] <= cache_decc_out_c52b_l[155:0];
//	cache_decc_out_1_c52_d[155:0] <= cache_decc_out_c52b_l[311:156];
//	cache_decc_out_2_c52_d[155:0] <= cache_decc_out_c52b_l[467:312];
//	cache_decc_out_3_c52_d[155:0] <= cache_decc_out_c52b_l[623:468];
//end

n2_l2d_sp_512kb_cust_tisram_bla_macro__width_156	ff_cache_decc_out_0_c52_d 
	(
	.q_a		(cache_decc_out_0_c52[155:0]),
	.d_b		(cache_decc_out_c5b[155:0]),
	.l1clk		(l1clk_intnl)
	);

n2_l2d_sp_512kb_cust_tisram_bla_macro__width_156      ff_cache_decc_out_1_c52_d 
        (
        .q_a           (cache_decc_out_1_c52[155:0]),
        .d_b            (cache_decc_out_c5b[311:156]),
        .l1clk            (l1clk_intnl)
        );


n2_l2d_sp_512kb_cust_tisram_bla_macro__width_156      ff_cache_decc_out_2_c52_d 
        (
        .q_a           (cache_decc_out_2_c52[155:0]),
        .d_b            (cache_decc_out_c5b[467:312]),
        .l1clk            (l1clk_intnl)
        );

n2_l2d_sp_512kb_cust_tisram_bla_macro__width_156      ff_cache_decc_out_3_c52_d 
        (
        .q_a           (cache_decc_out_3_c52[155:0]),
        .d_b            (cache_decc_out_c5b[623:468]),
        .l1clk            (l1clk_intnl)
        );


// The following portion of the code is used for verification
// synopsys translate_off
assign cache_decc_out_c52[623:0] = {cache_decc_out_3_c52[155:0],cache_decc_out_2_c52[155:0],
				    cache_decc_out_1_c52[155:0],cache_decc_out_0_c52[155:0]};

assign cache_rd_wr_c3 = l2t_l2d_rd_wr_c3;
// synopsys translate_on


// CHANGE 10
//always@(negedge l1clk)
//begin
//        cache_decc_out_0_c52b[155:0] <= cache_decc_out_0_c52[155:0];
//        cache_decc_out_1_c52b[155:0] <= cache_decc_out_1_c52[155:0];
//        cache_decc_out_2_c52b[155:0] <= cache_decc_out_2_c52[155:0];
//        cache_decc_out_3_c52b[155:0] <= cache_decc_out_3_c52[155:0];
//end
//


//always@(negedge l1clk)
//begin
//	//l2b_l2d_fbdecc_c52b[623:0] 	<= l2b_l2d_fbdecc_c52[623:0];
//	//cache_fb_hit_c52b 		<= cache_fb_hit_c52;
//	//cache_col_offset_c52b[3:0]	<= cache_col_offset_c52[3:0];
//end

//mux_macro       mux_cache_data_out_c52  (width=156,ports=4,mux=aonpe,stack=156c)
//        (
//        .dout   (cache_data_out_c52[155:0]),
//        .din0   (cache_decc_out_0_c52[155:0]),
//        .din1   (cache_decc_out_1_c52[155:0]),
//        .din2   (cache_decc_out_2_c52[155:0]),
//        .din3   (cache_decc_out_3_c52[155:0]),
//        .sel0   (cache_col_offset_c52[0]),
//        .sel1   (cache_col_offset_c52[1]),
//        .sel2   (cache_col_offset_c52[2]),
//        .sel3   (cache_col_offset_c52[3])
//        );

//always@(cache_decc_out_0_c52 or cache_decc_out_1_c52 or cache_decc_out_2_c52
//	or cache_decc_out_3_c52 or cache_col_offset_c52 or l2b_l2d_fbdecc_c52 or cache_fb_hit_c52)
//begin
//case(cache_col_offset_c52)
//4'b0001	:	begin
//		fill_bypass_data_c52[155:0] = l2b_l2d_fbdecc_c52[155:0];
//		end
//4'b0010	:	begin
//		fill_bypass_data_c52[155:0] = l2b_l2d_fbdecc_c52[311:156];
//		end
//4'b0100	:	begin
//		fill_bypass_data_c52[155:0] = l2b_l2d_fbdecc_c52[467:312];
//		end
//4'b1000	:	begin
//		fill_bypass_data_c52[155:0] = l2b_l2d_fbdecc_c52[623:468];
//		end
//default	:	begin
//		fill_bypass_data_c52[155:0] = 156'b0;
//		end
//endcase
//end

//mux_macro       mux_fill_bypass_data_c52  (width=156,ports=4,mux=aonpe,stack=156c)
//        (
//        .dout   (fill_bypass_data_c52[155:0]),
//        .din0   (l2b_l2d_fbdecc_c52[155:0]),
//        .din1   (l2b_l2d_fbdecc_c52[311:156]),
//        .din2   (l2b_l2d_fbdecc_c52[467:312]),
//        .din3   (l2b_l2d_fbdecc_c52[623:468]),
//        .sel0   (cache_col_offset_c52[0]),
//        .sel1   (cache_col_offset_c52[1]),
//        .sel2   (cache_col_offset_c52[2]),
//        .sel3   (cache_col_offset_c52[3])
//        );

//assign l2d_l2t_decc_c52[155:0] = cache_fb_hit_c52 ? 
//		fill_bypass_data_c52[155:0] : cache_data_out_c52[155:0] ;

//inv_macro inv_cache_fb_hit_c52 (width=1)
//	(
//	.dout 	(cache_fb_hit_c52_n),
//	.din	(cache_fb_hit_c52)
//	);

n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_0  
        (
        .dout   (l2d_l2t_decc_c52_0[155:0]),
        .din0   (l2b_l2d_fbdecc_c52[155:0]),
        .din1   (cache_decc_out_0_c52[155:0]),
        .sel0   (cache_fb_hit_c52),
        .sel1   (cache_fb_hit_c52_n)
        );

n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_1  
        (
        .dout   (l2d_l2t_decc_c52_1[155:0]),
        .din0   (l2b_l2d_fbdecc_c52[311:156]),
        .din1   (cache_decc_out_1_c52[155:0]),
        .sel0   (cache_fb_hit_c52),
        .sel1   (cache_fb_hit_c52_n)
        );


n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_2  
        (
        .dout   (l2d_l2t_decc_c52_2[155:0]),
        .din0   (l2b_l2d_fbdecc_c52[467:312]),
        .din1   (cache_decc_out_2_c52[155:0]),
        .sel0   (cache_fb_hit_c52),
        .sel1   (cache_fb_hit_c52_n)
        );

n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_3  
        (
        .dout   (l2d_l2t_decc_c52_3[155:0]),
        .din0   (l2b_l2d_fbdecc_c52[623:468]),
        .din1   (cache_decc_out_3_c52[155:0]),
        .sel0   (cache_fb_hit_c52),
        .sel1   (cache_fb_hit_c52_n)
        );

n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_20  
        (
        .dout   (l2d_l2t_decc_c52_20[155:0]),
        .din0   (l2d_l2t_decc_c52_2[155:0]),
        .din1   (l2d_l2t_decc_c52_0[155:0]),
        .sel0   (cache_col_offset_c52[2]),
        .sel1   (~cache_col_offset_c52[2])
        );

n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_31  
        (
        .dout   (l2d_l2t_decc_c52_31[155:0]),
        .din0   (l2d_l2t_decc_c52_3[155:0]),
        .din1   (l2d_l2t_decc_c52_1[155:0]),
        .sel0   (cache_col_offset_c52[3]),
        .sel1   (~cache_col_offset_c52[3])
        );

n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_topsel  
        (
        .dout   (l2d_l2t_decc_c52_mux[155:0]),
        .din0   (l2d_l2t_decc_c52_31[155:0]),
        .din1   (l2d_l2t_decc_c52_20[155:0]),
        .sel0   (cache_col_offset_c52_topsel),
        .sel1   (~cache_col_offset_c52_topsel)
        );

//msff_ctl_macro      ff_l2d_l2t_decc_c6  (width=156)
//        (
//        .scan_in(ff_l2d_l2t_decc_c6_scanin),
//        .scan_out(ff_l2d_l2t_decc_c6_scanout),
//        .dout           (l2d_l2t_decc_c6[155:0]),
//        .din            (l2d_l2t_decc_c52_topsel[155:0]),
//        .l1clk            (l1clk_intnl),
//        );





// tcu signals

assign          tcu_pce_ov_00 = tcu_pce_ov;
assign          tcu_pce_ov_01 = tcu_pce_ov;
assign          tcu_pce_ov_10 = tcu_pce_ov;
assign          tcu_pce_ov_11 = tcu_pce_ov;
assign          tcu_pce_ov_20 = tcu_pce_ov;
assign          tcu_pce_ov_21 = tcu_pce_ov;
assign          tcu_pce_ov_30 = tcu_pce_ov;
assign          tcu_pce_ov_31 = tcu_pce_ov;
assign          tcu_pce_00 = tcu_ce;
assign          tcu_pce_01 = tcu_ce;
assign          tcu_pce_10 = tcu_ce;
assign          tcu_pce_11 = tcu_ce;
assign          tcu_pce_20 = tcu_ce;
assign          tcu_pce_21 = tcu_ce;
assign          tcu_pce_30 = tcu_ce;
assign          tcu_pce_31 = tcu_ce;
assign          tcu_clk_stop_00 = tcu_clk_stop;
assign          tcu_clk_stop_01 = tcu_clk_stop;
assign          tcu_clk_stop_10 = tcu_clk_stop;
assign          tcu_clk_stop_11 = tcu_clk_stop;
assign          tcu_clk_stop_20 = tcu_clk_stop;
assign          tcu_clk_stop_21 = tcu_clk_stop;
assign          tcu_clk_stop_30 = tcu_clk_stop;
assign          tcu_clk_stop_31 = tcu_clk_stop;


assign		se_00 = tcu_scan_en;
assign		se_01 = tcu_scan_en;
assign		se_10 = tcu_scan_en;
assign		se_11 = tcu_scan_en;
assign		se_20 = tcu_scan_en;
assign		se_21 = tcu_scan_en;
assign		se_30 = tcu_scan_en;
assign		se_31 = tcu_scan_en;

// Redudancy

wire  [4:0]      fuse_l2d_rid_100;
wire  [4:0]      fuse_l2d_rid_110;
wire  [4:0]      fuse_l2d_rid_101;
wire  [4:0]      fuse_l2d_rid_111;
wire  [4:0]      fuse_l2d_rid_120;
wire  [4:0]      fuse_l2d_rid_121;
wire  [4:0]      fuse_l2d_rid_130;
wire  [4:0]      fuse_l2d_rid_131;
wire  [4:0]      fuse_l2d_rid_000;
wire  [4:0]      fuse_l2d_rid_001;
wire  [4:0]      fuse_l2d_rid_010;
wire  [4:0]      fuse_l2d_rid_011;
wire  [4:0]      fuse_l2d_rid_020;
wire  [4:0]      fuse_l2d_rid_021;
wire  [4:0]      fuse_l2d_rid_030;
wire  [4:0]      fuse_l2d_rid_031;

//assign fuse_l2d_rid_111[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0000),(l2b_l2d_fuse_rid_d[6:3] == 4'b0001),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_011[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0000),(l2b_l2d_fuse_rid_d[6:3] == 4'b0001),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_101[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0010),(l2b_l2d_fuse_rid_d[6:3] == 4'b0011),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_001[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0010),(l2b_l2d_fuse_rid_d[6:3] == 4'b0011),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_110[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0100),(l2b_l2d_fuse_rid_d[6:3] == 4'b0101),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_010[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0100),(l2b_l2d_fuse_rid_d[6:3] == 4'b0101),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_100[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0110),(l2b_l2d_fuse_rid_d[6:3] == 4'b0111),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_000[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0110),(l2b_l2d_fuse_rid_d[6:3] == 4'b0111),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_131[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1000),(l2b_l2d_fuse_rid_d[6:3] == 4'b1001),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_031[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1000),(l2b_l2d_fuse_rid_d[6:3] == 4'b1001),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_121[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1010),(l2b_l2d_fuse_rid_d[6:3] == 4'b1011),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_021[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1010),(l2b_l2d_fuse_rid_d[6:3] == 4'b1011),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_130[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1100),(l2b_l2d_fuse_rid_d[6:3] == 4'b1101),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_030[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1100),(l2b_l2d_fuse_rid_d[6:3] == 4'b1101),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_120[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1110),(l2b_l2d_fuse_rid_d[6:3] == 4'b1111),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_020[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1110),(l2b_l2d_fuse_rid_d[6:3] == 4'b1111),l2b_l2d_fuse_rid_d[2:0]};



n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_0 
	(
	.dout	(itis0000),
	.din0	(4'b0000),
	.din1	(l2b_l2d_fuse_rid_d[6:3])
	);

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_1 
        (
        .dout   (itis0001),
        .din0   (4'b0001),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_2 
        (
        .dout   (itis0010),
        .din0   (4'b0010),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_3 
        (
        .dout   (itis0011),
        .din0   (4'b0011),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_4 
        (
        .dout   (itis0100),
        .din0   (4'b0100),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_5 
        (
        .dout   (itis0101),
        .din0   (4'b0101),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_6 
        (
        .dout   (itis0110),
        .din0   (4'b0110),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );
n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_7 
        (
        .dout   (itis0111),
        .din0   (4'b0111),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_8 
        (
        .dout   (itis1000),
        .din0   (4'b1000),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_9 
        (
        .dout   (itis1001),
        .din0   (4'b1001),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_02 
        (
        .dout   (itis1010),
        .din0   (4'b1010),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_03 
        (
        .dout   (itis1011),
        .din0   (4'b1011),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_04 
        (
        .dout   (itis1100),
        .din0   (4'b1100),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_05 
        (
        .dout   (itis1101),
        .din0   (4'b1101),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_06 
        (
        .dout   (itis1110),
        .din0   (4'b1110),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );
n2_l2d_sp_512kb_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_07 
        (
        .dout   (itis1111),
        .din0   (4'b1111),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );


assign fuse_l2d_rid_111[4:0] = {itis0000,itis0001,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_011[4:0] = {itis0000,itis0001,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_101[4:0] = {itis0010,itis0011,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_001[4:0] = {itis0010,itis0011,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_110[4:0] = {itis0100,itis0101,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_010[4:0] = {itis0100,itis0101,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_100[4:0] = {itis0110,itis0111,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_000[4:0] = {itis0110,itis0111,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_131[4:0] = {itis1000,itis1001,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_031[4:0] = {itis1000,itis1001,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_121[4:0] = {itis1010,itis1011,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_021[4:0] = {itis1010,itis1011,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_130[4:0] = {itis1100,itis1101,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_030[4:0] = {itis1100,itis1101,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_120[4:0] = {itis1110,itis1111,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_020[4:0] = {itis1110,itis1111,l2b_l2d_fuse_rid_d[2:0]};


assign fuse_l2d_data_in_100[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_110[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_101[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_111[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_120[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_121[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_130[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_131[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_000[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_001[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_010[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_011[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_020[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_021[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_030[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_031[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];

assign fuse_l2d_wren_100 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_110 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_101 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_111 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_120 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_121 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_130 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_131 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_000 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_001 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_010 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_011 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_020 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_021 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_030 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_031 = l2b_l2d_fuse_l2d_wren_d;

assign fuse_l2d_reset_000_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_001_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_010_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_011_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_020_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_021_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_030_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_031_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_100_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_101_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_110_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_111_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_120_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_121_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_130_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_131_l = l2b_l2d_fuse_reset_l;
       

//assign stage1_mux_sel0 = |(fuse_l2d_rid_131[4:3]); 
//assign stage1_mux_sel1 = |(fuse_l2d_rid_121[4:3]); 
//assign stage1_mux_sel2 = ~(stage1_mux_sel0 | stage1_mux_sel1);

n2_l2d_sp_512kb_cust_inv_macro__width_1 inv_l2b_l2d_fuse_rid_d_0n 
	(
	.dout	(l2b_l2d_fuse_rid_d_0n),
	.din	(l2b_l2d_fuse_rid_d[0])
	);

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_131 
	(
	.dout	(or_fuse_l2d_rid_131),
	.din0	(fuse_l2d_rid_131[4]),
	.din1	(fuse_l2d_rid_131[3])
	);
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_131 
	(
	.dout	(stage1_mux_sel0),
	.din0	(or_fuse_l2d_rid_131),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);	

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_121 
        (
        .dout   (or_fuse_l2d_rid_121),
        .din0   (fuse_l2d_rid_121[4]),
        .din1   (fuse_l2d_rid_121[3])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_121 
	(
	.dout	(stage1_mux_sel1),
	.din0	(or_fuse_l2d_rid_121),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);
		
n2_l2d_sp_512kb_cust_nor_macro__width_1 or_stage1_mux_sel2 
        (
        .dout   (stage1_mux_sel2),
        .din0   (stage1_mux_sel0),
        .din1   (stage1_mux_sel1)
        );



n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage1  
        (
        .dout   (fdout_stage1[9:0]),
        .din0   (fdout_131[9:0]),
        .din1   (fdout_121[9:0]),
        .din2   (10'b0),
        .sel0   (stage1_mux_sel0),
        .sel1   (stage1_mux_sel1),
        .sel2   (stage1_mux_sel2)
        );

//assign stage2_mux_sel0 = |(fuse_l2d_rid_031[4:3]);
//assign stage2_mux_sel1 = |(fuse_l2d_rid_021[4:3]);
//assign stage2_mux_sel2 = ~(stage2_mux_sel0 | stage2_mux_sel1);


n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_031 
	(
	.dout	(or_fuse_l2d_rid_031),
	.din0	(fuse_l2d_rid_031[4]),
	.din1	(fuse_l2d_rid_031[3])
	);
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_031 
	(
	.dout	(stage2_mux_sel0),
	.din0	(or_fuse_l2d_rid_031),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_021 
        (
        .dout   (or_fuse_l2d_rid_021),
        .din0   (fuse_l2d_rid_021[4]),
        .din1   (fuse_l2d_rid_021[3])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_021 
	(
	.dout	(stage2_mux_sel1),
	.din0	(or_fuse_l2d_rid_021),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	
	

n2_l2d_sp_512kb_cust_nor_macro__width_1 or_stage2_mux_sel2 
        (
        .dout   (stage2_mux_sel2),
        .din0   (stage2_mux_sel0),
        .din1   (stage2_mux_sel1)
        );


n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage2  
        (
        .dout   (fdout_stage2[9:0]),
        .din0   (fdout_031[9:0]),
        .din1   (fdout_021[9:0]),
        .din2   (fdout_stage1[9:0]),
        .sel0   (stage2_mux_sel0),
        .sel1   (stage2_mux_sel1),
        .sel2   (stage2_mux_sel2)
        );

//assign stage3_mux_sel0 = |(fuse_l2d_rid_130[4:3]);
//assign stage3_mux_sel1 = |(fuse_l2d_rid_120[4:3]);
//assign stage3_mux_sel2 = ~(stage3_mux_sel0 | stage3_mux_sel1);

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_130 
	(
	.dout	(or_fuse_l2d_rid_130),
	.din0	(fuse_l2d_rid_130[4]),
	.din1	(fuse_l2d_rid_130[3])
	);
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_130 
	(
	.dout	(stage3_mux_sel0),
	.din0	(or_fuse_l2d_rid_130),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);	

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_120 
        (
        .dout   (or_fuse_l2d_rid_120),
        .din0   (fuse_l2d_rid_120[4]),
        .din1   (fuse_l2d_rid_120[3])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_120 
	(
	.dout	(stage3_mux_sel1),
	.din0	(or_fuse_l2d_rid_120),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);
	
n2_l2d_sp_512kb_cust_nor_macro__width_1 or_stage3_mux_sel2 
        (
        .dout   (stage3_mux_sel2),
        .din0   (stage3_mux_sel0),
        .din1   (stage3_mux_sel1)
        );


n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage3  
        (
        .dout   (fdout_stage3[9:0]),
        .din0   (fdout_130[9:0]),
        .din1   (fdout_120[9:0]),
        .din2   (fdout_stage2[9:0]),
        .sel0   (stage3_mux_sel0),
        .sel1   (stage3_mux_sel1),
        .sel2   (stage3_mux_sel2)
        );

//assign stage4_mux_sel0 = |(fuse_l2d_rid_030[4:3]);
//assign stage4_mux_sel1 = |(fuse_l2d_rid_020[4:3]);
//assign stage4_mux_sel2 = ~(stage4_mux_sel0 | stage4_mux_sel1);

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_030 
	(
	.dout	(or_fuse_l2d_rid_030),
	.din0	(fuse_l2d_rid_030[4]),
	.din1	(fuse_l2d_rid_030[3])
	);
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_030 
	(
	.dout	(stage4_mux_sel0),
	.din0	(or_fuse_l2d_rid_030),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_020 
        (
        .dout   (or_fuse_l2d_rid_020),
        .din0   (fuse_l2d_rid_020[4]),
        .din1   (fuse_l2d_rid_020[3])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_020 
	(
	.dout	(stage4_mux_sel1),
	.din0	(or_fuse_l2d_rid_020),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);
	
n2_l2d_sp_512kb_cust_nor_macro__width_1 or_stage4_mux_sel2 
        (
        .dout   (stage4_mux_sel2),
        .din0   (stage4_mux_sel0),
        .din1   (stage4_mux_sel1)
        );


n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage4  
        (
        .dout   (fdout_stage4[9:0]),
        .din0   (fdout_030[9:0]),
        .din1   (fdout_020[9:0]),
        .din2   (fdout_stage3[9:0]),
        .sel0   (stage4_mux_sel0),
        .sel1   (stage4_mux_sel1),
        .sel2   (stage4_mux_sel2)
        );

// Right to left

//assign stage10_mux_sel0 = |(fuse_l2d_rid_010[4:3]);
//assign stage10_mux_sel1 = |(fuse_l2d_rid_000[4:3]);
//assign stage10_mux_sel2 = ~(stage10_mux_sel0 | stage10_mux_sel1);

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_010 
	(
	.dout	(or_fuse_l2d_rid_010),
	.din0	(fuse_l2d_rid_010[4]),
	.din1	(fuse_l2d_rid_010[3])
	);
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_010 
	(
	.dout	(stage10_mux_sel0),
	.din0	(or_fuse_l2d_rid_010),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_000 
        (
        .dout   (or_fuse_l2d_rid_000),
        .din0   (fuse_l2d_rid_000[4]),
        .din1   (fuse_l2d_rid_000[3])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_000 
	(
	.dout	(stage10_mux_sel1),
	.din0	(or_fuse_l2d_rid_000),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);
	
n2_l2d_sp_512kb_cust_nor_macro__width_1 or_stage10_mux_sel2 
        (
        .dout   (stage10_mux_sel2),
        .din0   (stage10_mux_sel0),
        .din1   (stage10_mux_sel1)
        );




n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage10  
        (
        .dout   (fdout_stage10[9:0]),
        .din0   (fdout_010[9:0]),
        .din1   (fdout_000[9:0]),
        .din2   (10'b0),
        .sel0   (stage10_mux_sel0),
        .sel1   (stage10_mux_sel1),
        .sel2   (stage10_mux_sel2)
        );

//assign stage20_mux_sel0 = |(fuse_l2d_rid_110[4:3]);
//assign stage20_mux_sel1 = |(fuse_l2d_rid_100[4:3]);
//assign stage20_mux_sel2 = ~(stage20_mux_sel0 | stage20_mux_sel1);

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_110 
	(
	.dout	(or_fuse_l2d_rid_110),
	.din0	(fuse_l2d_rid_110[4]),
	.din1	(fuse_l2d_rid_110[3])
	);
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_110 
	(
	.dout	(stage20_mux_sel0),
	.din0	(or_fuse_l2d_rid_110),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);	

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_100 
        (
        .dout   (or_fuse_l2d_rid_100),
        .din0   (fuse_l2d_rid_100[4]),
        .din1   (fuse_l2d_rid_100[3])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_100 
	(
	.dout	(stage20_mux_sel1),
	.din0	(or_fuse_l2d_rid_100),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);
	
n2_l2d_sp_512kb_cust_nor_macro__width_1 or_stage20_mux_sel2 
        (
        .dout   (stage20_mux_sel2),
        .din0   (stage20_mux_sel0),
        .din1   (stage20_mux_sel1)
        );



n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage20  
        (
        .dout   (fdout_stage20[9:0]),
        .din0   (fdout_110[9:0]),
        .din1   (fdout_100[9:0]),
        .din2   (fdout_stage10[9:0]),
        .sel0   (stage20_mux_sel0),
        .sel1   (stage20_mux_sel1),
        .sel2   (stage20_mux_sel2)
        );

//assign stage30_mux_sel0 = |(fuse_l2d_rid_011[4:3]);
//assign stage30_mux_sel1 = |(fuse_l2d_rid_001[4:3]);
//assign stage30_mux_sel2 = ~(stage30_mux_sel0 | stage30_mux_sel1);

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_011 
	(
	.dout	(or_fuse_l2d_rid_011),
	.din0	(fuse_l2d_rid_011[4]),
	.din1	(fuse_l2d_rid_011[3])
	);
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_011 
	(
	.dout	(stage30_mux_sel0),
	.din0	(or_fuse_l2d_rid_011),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_001 
        (
        .dout   (or_fuse_l2d_rid_001),
        .din0   (fuse_l2d_rid_001[4]),
        .din1   (fuse_l2d_rid_001[3])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_001 
	(
	.dout	(stage30_mux_sel1),
	.din0	(or_fuse_l2d_rid_001),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);
	
n2_l2d_sp_512kb_cust_nor_macro__width_1 or_1stage20_mux_sel2 
        (
        .dout   (stage30_mux_sel2),
        .din0   (stage30_mux_sel0),
        .din1   (stage30_mux_sel1)
        );


n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage30  
        (
        .dout   (fdout_stage30[9:0]),
        .din0   (fdout_011[9:0]),
        .din1   (fdout_001[9:0]),
        .din2   (fdout_stage20[9:0]),
        .sel0   (stage30_mux_sel0),
        .sel1   (stage30_mux_sel1),
        .sel2   (stage30_mux_sel2)
        );

//assign stage40_mux_sel0 = |(fuse_l2d_rid_111[4:3]);
//assign stage40_mux_sel1 = |(fuse_l2d_rid_101[4:3]);
//assign stage40_mux_sel2 = ~(stage40_mux_sel0 | stage40_mux_sel1);

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_111 
	(
	.dout	(or_fuse_l2d_rid_111),
	.din0	(fuse_l2d_rid_111[4]),
	.din1	(fuse_l2d_rid_111[3])
	);
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_111 
	(
	.dout	(stage40_mux_sel0),
	.din0	(or_fuse_l2d_rid_111),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);	

n2_l2d_sp_512kb_cust_or_macro__width_1 or_rid_101 
        (
        .dout   (or_fuse_l2d_rid_101),
        .din0   (fuse_l2d_rid_101[4]),
        .din1   (fuse_l2d_rid_101[3])
        );
	
n2_l2d_sp_512kb_cust_and_macro__width_1 and_rid_101 
	(
	.dout	(stage40_mux_sel1),
	.din0	(or_fuse_l2d_rid_101),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);
	
n2_l2d_sp_512kb_cust_nor_macro__width_1 or_1stage40_mux_sel2 
        (
        .dout   (stage40_mux_sel2),
        .din0   (stage40_mux_sel0),
        .din1   (stage40_mux_sel1)
        );



n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage40  
        (
        .dout   (fdout_stage40[9:0]),
        .din0   (fdout_111[9:0]),
        .din1   (fdout_101[9:0]),
        .din2   (fdout_stage30[9:0]),
        .sel0   (stage40_mux_sel0),
        .sel1   (stage40_mux_sel1),
        .sel2   (stage40_mux_sel2)
        );

n2_l2d_sp_512kb_cust_inv_macro__width_1 inv_l2b_l2d_fuse_rid_d_6n 
	(
	.dout	(l2b_l2d_fuse_rid_d_6n),
	.din	(l2b_l2d_fuse_rid_d[6])
	);

n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_10       mux_fdout_fnl  
        (
        .dout   (efc_fuse_data[9:0]),
        .din0   (fdout_stage40[9:0]),
        .din1   (fdout_stage4[9:0]),
        .sel0   (l2b_l2d_fuse_rid_d_6n),
        .sel1   (l2b_l2d_fuse_rid_d[6])
        );

 
assign 		delout00 = delout20_rgt;
assign 		delout01 = delout20_rgt;
assign 		delout10 = delout31_rgt;
assign 		delout11 = delout31_rgt;
assign 		delout20 = delout20_lft;
assign 		delout21 = delout20_lft;
assign 		delout30 = delout31_lft;
assign 		delout31 = delout31_lft;

n2_l2d_tstmod_cust tstmod
      (
      .rd_wr_c3 	(l2t_l2d_rd_wr_c3),
      .wayerr_c3 	(wayerr_c3 ),
      .wr_inhibit 	(tcu_array_wr_inhibit ),
      .coloff_c3 	(cache_col_offset_c3[3:0]),
      .l2clk 		(l2clk),
      .scanen 		(tcu_scan_en),
      .si 		(so_q23 ),
      .siclk 		(tcu_aclk),
      .soclk 		(tcu_bclk),
      .so 		(so_tstmod ),
      .delout20_rgt 	(delout20_rgt ),
      .delout31_lft 	(delout31_lft ),
      .delout31_rgt 	(delout31_rgt ),
      .delout20_lft	(delout20_lft)
      ) ;

// scanorder start
//  ff_cache_cache_rd_wr_c4_scanin
//  ff_cache_set_c3_scanin[8]
//  ff_cache_set_c3_scanin[7]
//  ff_cache_set_c3_scanin[6]
//  ff_cache_set_c3_scanin[5]
//  ff_cache_set_c3_scanin[4]
//  ff_cache_set_c3_scanin[3]
//  ff_cache_set_c3_scanin[2]
//  ff_cache_set_c3_scanin[1]
//  ff_cache_set_c3_scanin[0]
//  ff_cache_word_en_c3_scanin[1]
//  ff_cache_word_en_c3_scanin[3]
//  ff_cache_word_en_c3_scanin[5]
//  ff_cache_word_en_c3_scanin[7]
//  ff_cache_word_en_c3_scanin[9]
//  ff_cache_word_en_c3_scanin[11]
//  ff_cache_word_en_c3_scanin[13]
//  ff_cache_word_en_c3_scanin[15]
//  ff_cache_col_offset_c3_scanin[0]
//  ff_cache_col_offset_c4_scanin[0]
//  ff_cache_col_offset_c5_muxsel_scanin[0]
//  ff_cache_col_offset_c5_muxsel_scanin[1]
//  ff_cache_col_offset_c4_scanin[1]
//  ff_cache_col_offset_c3_scanin[1]
//  ff_cache_col_offset_c3_scanin[2]
//  ff_cache_col_offset_c4_scanin[2]
//  ff_cache_col_offset_c5_muxsel_scanin[2]
//  ff_cache_col_offset_c5_muxsel_scanin[3]
//  ff_cache_col_offset_c4_scanin[3]
//  ff_cache_col_offset_c3_scanin[3]
//  ff_cache_col_offset_all_c4_scanin
//  ff_cache_col_offset_all_c5_scanin
//  ff_cache_col_offset_all_c6_scanin
//  ff_cache_col_offset_all_c7_scanin
//  ff_cache_word_en_c3_scanin[0]
//  ff_cache_word_en_c3_scanin[2]
//  ff_cache_word_en_c3_scanin[4]
//  ff_cache_word_en_c3_scanin[6]
//  ff_cache_word_en_c3_scanin[8]
//  ff_cache_word_en_c3_scanin[10]
//  ff_cache_word_en_c3_scanin[12]
//  ff_cache_word_en_c3_scanin[14]
//  ff_cache_col_offset_c52_scanin[1]	
//  ff_cache_col_offset_c52_scanin[0]	

//  ff_cache_col_offset_c52_topsel_scanin
//  ff_cache_fb_hit_c4_scanin
//  ff_cache_fb_hit_c5_scanin
//  ff_cache_fb_hit_c52_scanin
//  ff_cache_sel_fbdecc_c4_scanin
//  ff_cache_sel_fbdecc_c5_scanin

//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[4]

//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[4]

//  ff_l2t_l2d_stdecc_c3_scanin[77:39] 	
//  ff_cache_col_offset_c5_023_scanin[0]
//  ff_cache_col_offset_c5_023_scanin[2]
//  ff_cache_col_offset_c4_023_scanin[0]
//  ff_cache_col_offset_c4_023_scanin[2]
//  ff_cache_col_offset_c4_tog_023_scanin[0]
//  ff_cache_cache_rd_wr_c5_20_scanin
//  ff_cache_col_offset_c5_023_scanin[1]
//  ff_cache_col_offset_c5_023_scanin[3]
//  ff_cache_col_offset_c4_023_scanin[1]
//  ff_cache_col_offset_c4_023_scanin[3]
//  ff_cache_col_offset_c4_tog_023_scanin[1]

//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[14]


//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[4]


//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[4]


//  ff_l2d_decc_out_c6_lo0_2_scanin[0]
//  ff_l2d_decc_out_c6_lo0_4_scanin[0]
//  ff_l2d_decc_out_c6_hi0_2_scanin[0]
//  ff_l2d_decc_out_c6_hi0_4_scanin[0]
//  ff_l2d_decc_out_c6_lo1_2_scanin[0]
//  ff_l2d_decc_out_c6_lo1_4_scanin[0]
//  ff_l2d_decc_out_c6_hi1_2_scanin[0]
//  ff_l2d_decc_out_c6_hi1_4_scanin[0]
//  ff_l2d_decc_out_c6_lo0_2_scanin[1]
//  ff_l2d_decc_out_c6_lo0_4_scanin[1]
//  ff_l2d_decc_out_c6_hi0_2_scanin[1]
//  ff_l2d_decc_out_c6_hi0_4_scanin[1]
//  ff_l2d_decc_out_c6_lo1_2_scanin[1]
//  ff_l2d_decc_out_c6_lo1_4_scanin[1]
//  ff_l2d_decc_out_c6_hi1_2_scanin[1]
//  ff_l2d_decc_out_c6_hi1_4_scanin[1]
//  ff_l2d_decc_out_c6_lo0_2_scanin[2]
//  ff_l2d_decc_out_c6_lo0_4_scanin[2]
//  ff_l2d_decc_out_c6_hi0_2_scanin[2]
//  ff_l2d_decc_out_c6_hi0_4_scanin[2]
//  ff_l2d_decc_out_c6_lo1_2_scanin[2]
//  ff_l2d_decc_out_c6_lo1_4_scanin[2]
//  ff_l2d_decc_out_c6_hi1_2_scanin[2]
//  ff_l2d_decc_out_c6_hi1_4_scanin[2]
//  ff_l2d_decc_out_c6_lo0_2_scanin[3]
//  ff_l2d_decc_out_c6_lo0_4_scanin[3]
//  ff_l2d_decc_out_c6_hi0_2_scanin[3]
//  ff_l2d_decc_out_c6_hi0_4_scanin[3]
//  ff_l2d_decc_out_c6_lo1_2_scanin[3]
//  ff_l2d_decc_out_c6_lo1_4_scanin[3]
//  ff_l2d_decc_out_c6_hi1_2_scanin[3]
//  ff_l2d_decc_out_c6_hi1_4_scanin[3]
//  ff_l2d_decc_out_c6_lo0_2_scanin[4]
//  ff_l2d_decc_out_c6_lo0_4_scanin[4]
//  ff_l2d_decc_out_c6_hi0_2_scanin[4]
//  ff_l2d_decc_out_c6_hi0_4_scanin[4]
//  ff_l2d_decc_out_c6_lo1_2_scanin[4]
//  ff_l2d_decc_out_c6_lo1_4_scanin[4]
//  ff_l2d_decc_out_c6_hi1_2_scanin[4]
//  ff_l2d_decc_out_c6_hi1_4_scanin[4]
//  ff_l2d_decc_out_c6_lo0_2_scanin[5]
//  ff_l2d_decc_out_c6_lo0_4_scanin[5]
//  ff_l2d_decc_out_c6_hi0_2_scanin[5]
//  ff_l2d_decc_out_c6_hi0_4_scanin[5]
//  ff_l2d_decc_out_c6_lo1_2_scanin[5]
//  ff_l2d_decc_out_c6_lo1_4_scanin[5]
//  ff_l2d_decc_out_c6_hi1_2_scanin[5]
//  ff_l2d_decc_out_c6_hi1_4_scanin[5]
//  ff_l2d_decc_out_c6_lo0_2_scanin[6]
//  ff_l2d_decc_out_c6_lo0_4_scanin[6]
//  ff_l2d_decc_out_c6_hi0_2_scanin[6]
//  ff_l2d_decc_out_c6_hi0_4_scanin[6]
//  ff_l2d_decc_out_c6_lo1_2_scanin[6]
//  ff_l2d_decc_out_c6_lo1_4_scanin[6]
//  ff_l2d_decc_out_c6_hi1_2_scanin[6]
//  ff_l2d_decc_out_c6_hi1_4_scanin[6]
//  ff_l2d_decc_out_c6_lo0_2_scanin[7]
//  ff_l2d_decc_out_c6_lo0_4_scanin[7]
//  ff_l2d_decc_out_c6_hi0_2_scanin[7]
//  ff_l2d_decc_out_c6_hi0_4_scanin[7]
//  ff_l2d_decc_out_c6_lo1_2_scanin[7]
//  ff_l2d_decc_out_c6_lo1_4_scanin[7]
//  ff_l2d_decc_out_c6_hi1_2_scanin[7]
//  ff_l2d_decc_out_c6_hi1_4_scanin[7]
//  ff_l2d_decc_out_c6_lo0_2_scanin[8]
//  ff_l2d_decc_out_c6_lo0_4_scanin[8]
//  ff_l2d_decc_out_c6_hi0_2_scanin[8]
//  ff_l2d_decc_out_c6_hi0_4_scanin[8]
//  ff_l2d_decc_out_c6_lo1_2_scanin[8]
//  ff_l2d_decc_out_c6_lo1_4_scanin[8]
//  ff_l2d_decc_out_c6_hi1_2_scanin[8]
//  ff_l2d_decc_out_c6_hi1_4_scanin[8]
//  ff_l2d_decc_out_c6_lo0_2_scanin[9]
//  ff_l2d_decc_out_c6_lo0_4_scanin[9]
//  ff_l2d_decc_out_c6_hi0_2_scanin[9]
//  ff_l2d_decc_out_c6_hi0_4_scanin[9]
//  ff_l2d_decc_out_c6_lo1_2_scanin[9]
//  ff_l2d_decc_out_c6_lo1_4_scanin[9]
//  ff_l2d_decc_out_c6_hi1_2_scanin[9]
//  ff_l2d_decc_out_c6_hi1_4_scanin[9]

//  ff_l2d_decc_out_c6_lo0_2_scanin[10]
//  ff_l2d_decc_out_c6_lo0_4_scanin[10]
//  ff_l2d_decc_out_c6_hi0_2_scanin[10]
//  ff_l2d_decc_out_c6_hi0_4_scanin[10]
//  ff_l2d_decc_out_c6_lo1_2_scanin[10]
//  ff_l2d_decc_out_c6_lo1_4_scanin[10]
//  ff_l2d_decc_out_c6_hi1_2_scanin[10]
//  ff_l2d_decc_out_c6_hi1_4_scanin[10]
//  ff_l2d_decc_out_c6_lo0_2_scanin[11]
//  ff_l2d_decc_out_c6_lo0_4_scanin[11]
//  ff_l2d_decc_out_c6_hi0_2_scanin[11]
//  ff_l2d_decc_out_c6_hi0_4_scanin[11]
//  ff_l2d_decc_out_c6_lo1_2_scanin[11]
//  ff_l2d_decc_out_c6_lo1_4_scanin[11]
//  ff_l2d_decc_out_c6_hi1_2_scanin[11]
//  ff_l2d_decc_out_c6_hi1_4_scanin[11]
//  ff_l2d_decc_out_c6_lo0_2_scanin[12]
//  ff_l2d_decc_out_c6_lo0_4_scanin[12]
//  ff_l2d_decc_out_c6_hi0_2_scanin[12]
//  ff_l2d_decc_out_c6_hi0_4_scanin[12]
//  ff_l2d_decc_out_c6_lo1_2_scanin[12]
//  ff_l2d_decc_out_c6_lo1_4_scanin[12]
//  ff_l2d_decc_out_c6_hi1_2_scanin[12]
//  ff_l2d_decc_out_c6_hi1_4_scanin[12]
//  ff_l2d_decc_out_c6_lo0_2_scanin[13]
//  ff_l2d_decc_out_c6_lo0_4_scanin[13]
//  ff_l2d_decc_out_c6_hi0_2_scanin[13]
//  ff_l2d_decc_out_c6_hi0_4_scanin[13]
//  ff_l2d_decc_out_c6_lo1_2_scanin[13]
//  ff_l2d_decc_out_c6_lo1_4_scanin[13]
//  ff_l2d_decc_out_c6_hi1_2_scanin[13]
//  ff_l2d_decc_out_c6_hi1_4_scanin[13]
//  ff_l2d_decc_out_c6_lo0_2_scanin[14]
//  ff_l2d_decc_out_c6_lo0_4_scanin[14]
//  ff_l2d_decc_out_c6_hi0_2_scanin[14]
//  ff_l2d_decc_out_c6_hi0_4_scanin[14]
//  ff_l2d_decc_out_c6_lo1_2_scanin[14]
//  ff_l2d_decc_out_c6_lo1_4_scanin[14]
//  ff_l2d_decc_out_c6_hi1_2_scanin[14]
//  ff_l2d_decc_out_c6_hi1_4_scanin[14]
//  ff_l2d_decc_out_c6_lo0_2_scanin[15]
//  ff_l2d_decc_out_c6_lo0_4_scanin[15]
//  ff_l2d_decc_out_c6_hi0_2_scanin[15]
//  ff_l2d_decc_out_c6_hi0_4_scanin[15]
//  ff_l2d_decc_out_c6_lo1_2_scanin[15]
//  ff_l2d_decc_out_c6_lo1_4_scanin[15]
//  ff_l2d_decc_out_c6_hi1_2_scanin[15]
//  ff_l2d_decc_out_c6_hi1_4_scanin[15]
//  ff_l2d_decc_out_c6_lo0_2_scanin[16]
//  ff_l2d_decc_out_c6_lo0_4_scanin[16]
//  ff_l2d_decc_out_c6_hi0_2_scanin[16]
//  ff_l2d_decc_out_c6_hi0_4_scanin[16]
//  ff_l2d_decc_out_c6_lo1_2_scanin[16]
//  ff_l2d_decc_out_c6_lo1_4_scanin[16]
//  ff_l2d_decc_out_c6_hi1_2_scanin[16]
//  ff_l2d_decc_out_c6_hi1_4_scanin[16]
//  ff_l2d_decc_out_c6_lo0_2_scanin[17]
//  ff_l2d_decc_out_c6_lo0_4_scanin[17]
//  ff_l2d_decc_out_c6_hi0_2_scanin[17]
//  ff_l2d_decc_out_c6_hi0_4_scanin[17]
//  ff_l2d_decc_out_c6_lo1_2_scanin[17]
//  ff_l2d_decc_out_c6_lo1_4_scanin[17]
//  ff_l2d_decc_out_c6_hi1_2_scanin[17]
//  ff_l2d_decc_out_c6_hi1_4_scanin[17]
//  ff_l2d_decc_out_c6_lo0_2_scanin[18]
//  ff_l2d_decc_out_c6_lo0_4_scanin[18]
//  ff_l2d_decc_out_c6_hi0_2_scanin[18]
//  ff_l2d_decc_out_c6_hi0_4_scanin[18]
//  ff_l2d_decc_out_c6_lo1_2_scanin[18]
//  ff_l2d_decc_out_c6_lo1_4_scanin[18]
//  ff_l2d_decc_out_c6_hi1_2_scanin[18]
//  ff_l2d_decc_out_c6_hi1_4_scanin[18]
//  ff_l2d_decc_out_c6_lo0_2_scanin[19]
//  ff_l2d_decc_out_c6_lo0_4_scanin[19]
//  ff_l2d_decc_out_c6_hi0_2_scanin[19]
//  ff_l2d_decc_out_c6_hi0_4_scanin[19]

//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[24]


//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[24]

//  ff_cache_col_offset_c5_123_scanin[0]
//  ff_cache_col_offset_c5_123_scanin[2]
//  ff_cache_col_offset_c4_123_scanin[0]
//  ff_cache_col_offset_c4_123_scanin[2]
//  ff_cache_col_offset_c4_tog_123_scanin[0]
//  ff_cache_cache_rd_wr_c5_21_scanin
//  ff_cache_col_offset_c5_123_scanin[1]
//  ff_cache_col_offset_c5_123_scanin[3]
//  ff_cache_col_offset_c4_123_scanin[1]
//  ff_cache_col_offset_c4_123_scanin[3]
//  ff_cache_col_offset_c4_tog_123_scanin[1]

//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[24]


//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[24]

//  ff_l2d_decc_out_c6_lo1_2_scanin[19]
//  ff_l2d_decc_out_c6_lo1_4_scanin[19]
//  ff_l2d_decc_out_c6_hi1_2_scanin[19]
//  ff_l2d_decc_out_c6_hi1_4_scanin[19]
//  ff_l2d_decc_out_c6_lo0_2_scanin[20]
//  ff_l2d_decc_out_c6_lo0_4_scanin[20]
//  ff_l2d_decc_out_c6_hi0_2_scanin[20]
//  ff_l2d_decc_out_c6_hi0_4_scanin[20]
//  ff_l2d_decc_out_c6_lo1_2_scanin[20]
//  ff_l2d_decc_out_c6_lo1_4_scanin[20]
//  ff_l2d_decc_out_c6_hi1_2_scanin[20]
//  ff_l2d_decc_out_c6_hi1_4_scanin[20]
//  ff_l2d_decc_out_c6_lo0_2_scanin[21]
//  ff_l2d_decc_out_c6_lo0_4_scanin[21]
//  ff_l2d_decc_out_c6_hi0_2_scanin[21]
//  ff_l2d_decc_out_c6_hi0_4_scanin[21]
//  ff_l2d_decc_out_c6_lo1_2_scanin[21]
//  ff_l2d_decc_out_c6_lo1_4_scanin[21]
//  ff_l2d_decc_out_c6_hi1_2_scanin[21]
//  ff_l2d_decc_out_c6_hi1_4_scanin[21]
//  ff_l2d_decc_out_c6_lo0_2_scanin[22]
//  ff_l2d_decc_out_c6_lo0_4_scanin[22]
//  ff_l2d_decc_out_c6_hi0_2_scanin[22]
//  ff_l2d_decc_out_c6_hi0_4_scanin[22]
//  ff_l2d_decc_out_c6_lo1_2_scanin[22]
//  ff_l2d_decc_out_c6_lo1_4_scanin[22]
//  ff_l2d_decc_out_c6_hi1_2_scanin[22]
//  ff_l2d_decc_out_c6_hi1_4_scanin[22]
//  ff_l2d_decc_out_c6_lo0_2_scanin[23]
//  ff_l2d_decc_out_c6_lo0_4_scanin[23]
//  ff_l2d_decc_out_c6_hi0_2_scanin[23]
//  ff_l2d_decc_out_c6_hi0_4_scanin[23]
//  ff_l2d_decc_out_c6_lo1_2_scanin[23]
//  ff_l2d_decc_out_c6_lo1_4_scanin[23]
//  ff_l2d_decc_out_c6_hi1_2_scanin[23]
//  ff_l2d_decc_out_c6_hi1_4_scanin[23]
//  ff_l2d_decc_out_c6_lo0_2_scanin[24]
//  ff_l2d_decc_out_c6_lo0_4_scanin[24]
//  ff_l2d_decc_out_c6_hi0_2_scanin[24]
//  ff_l2d_decc_out_c6_hi0_4_scanin[24]
//  ff_l2d_decc_out_c6_lo1_2_scanin[24]
//  ff_l2d_decc_out_c6_lo1_4_scanin[24]
//  ff_l2d_decc_out_c6_hi1_2_scanin[24]
//  ff_l2d_decc_out_c6_hi1_4_scanin[24]
//  ff_l2d_decc_out_c6_lo0_2_scanin[25]
//  ff_l2d_decc_out_c6_lo0_4_scanin[25]
//  ff_l2d_decc_out_c6_hi0_2_scanin[25]
//  ff_l2d_decc_out_c6_hi0_4_scanin[25]
//  ff_l2d_decc_out_c6_lo1_2_scanin[25]
//  ff_l2d_decc_out_c6_lo1_4_scanin[25]
//  ff_l2d_decc_out_c6_hi1_2_scanin[25]
//  ff_l2d_decc_out_c6_hi1_4_scanin[25]
//  ff_l2d_decc_out_c6_lo0_2_scanin[26]
//  ff_l2d_decc_out_c6_lo0_4_scanin[26]
//  ff_l2d_decc_out_c6_hi0_2_scanin[26]
//  ff_l2d_decc_out_c6_hi0_4_scanin[26]
//  ff_l2d_decc_out_c6_lo1_2_scanin[26]
//  ff_l2d_decc_out_c6_lo1_4_scanin[26]
//  ff_l2d_decc_out_c6_hi1_2_scanin[26]
//  ff_l2d_decc_out_c6_hi1_4_scanin[26]
//  ff_l2d_decc_out_c6_lo0_2_scanin[27]
//  ff_l2d_decc_out_c6_lo0_4_scanin[27]
//  ff_l2d_decc_out_c6_hi0_2_scanin[27]
//  ff_l2d_decc_out_c6_hi0_4_scanin[27]
//  ff_l2d_decc_out_c6_lo1_2_scanin[27]
//  ff_l2d_decc_out_c6_lo1_4_scanin[27]
//  ff_l2d_decc_out_c6_hi1_2_scanin[27]
//  ff_l2d_decc_out_c6_hi1_4_scanin[27]
//  ff_l2d_decc_out_c6_lo0_2_scanin[28]
//  ff_l2d_decc_out_c6_lo0_4_scanin[28]
//  ff_l2d_decc_out_c6_hi0_2_scanin[28]
//  ff_l2d_decc_out_c6_hi0_4_scanin[28]
//  ff_l2d_decc_out_c6_lo1_2_scanin[28]
//  ff_l2d_decc_out_c6_lo1_4_scanin[28]
//  ff_l2d_decc_out_c6_hi1_2_scanin[28]
//  ff_l2d_decc_out_c6_hi1_4_scanin[28]
//  ff_l2d_decc_out_c6_lo0_2_scanin[29]
//  ff_l2d_decc_out_c6_lo0_4_scanin[29]

//  ff_l2d_decc_out_c6_hi0_2_scanin[29]
//  ff_l2d_decc_out_c6_hi0_4_scanin[29]
//  ff_l2d_decc_out_c6_lo1_2_scanin[29]
//  ff_l2d_decc_out_c6_lo1_4_scanin[29]
//  ff_l2d_decc_out_c6_hi1_2_scanin[29]
//  ff_l2d_decc_out_c6_hi1_4_scanin[29]
//  ff_l2d_decc_out_c6_lo0_2_scanin[30]
//  ff_l2d_decc_out_c6_lo0_4_scanin[30]
//  ff_l2d_decc_out_c6_hi0_2_scanin[30]
//  ff_l2d_decc_out_c6_hi0_4_scanin[30]
//  ff_l2d_decc_out_c6_lo1_2_scanin[30]
//  ff_l2d_decc_out_c6_lo1_4_scanin[30]
//  ff_l2d_decc_out_c6_hi1_2_scanin[30]
//  ff_l2d_decc_out_c6_hi1_4_scanin[30]
//  ff_l2d_decc_out_c6_lo0_2_scanin[31]
//  ff_l2d_decc_out_c6_lo0_4_scanin[31]
//  ff_l2d_decc_out_c6_hi0_2_scanin[31]
//  ff_l2d_decc_out_c6_hi0_4_scanin[31]
//  ff_l2d_decc_out_c6_lo1_2_scanin[31]
//  ff_l2d_decc_out_c6_lo1_4_scanin[31]
//  ff_l2d_decc_out_c6_hi1_2_scanin[31]
//  ff_l2d_decc_out_c6_hi1_4_scanin[31]
//  ff_l2d_decc_out_c6_lo0_2_scanin[32]
//  ff_l2d_decc_out_c6_lo0_4_scanin[32]
//  ff_l2d_decc_out_c6_hi0_2_scanin[32]
//  ff_l2d_decc_out_c6_hi0_4_scanin[32]
//  ff_l2d_decc_out_c6_lo1_2_scanin[32]
//  ff_l2d_decc_out_c6_lo1_4_scanin[32]
//  ff_l2d_decc_out_c6_hi1_2_scanin[32]
//  ff_l2d_decc_out_c6_hi1_4_scanin[32]
//  ff_l2d_decc_out_c6_lo0_2_scanin[33]
//  ff_l2d_decc_out_c6_lo0_4_scanin[33]
//  ff_l2d_decc_out_c6_hi0_2_scanin[33]
//  ff_l2d_decc_out_c6_hi0_4_scanin[33]
//  ff_l2d_decc_out_c6_lo1_2_scanin[33]
//  ff_l2d_decc_out_c6_lo1_4_scanin[33]
//  ff_l2d_decc_out_c6_hi1_2_scanin[33]
//  ff_l2d_decc_out_c6_hi1_4_scanin[33]
//  ff_l2d_decc_out_c6_lo0_2_scanin[34]
//  ff_l2d_decc_out_c6_lo0_4_scanin[34]
//  ff_l2d_decc_out_c6_hi0_2_scanin[34]
//  ff_l2d_decc_out_c6_hi0_4_scanin[34]
//  ff_l2d_decc_out_c6_lo1_2_scanin[34]
//  ff_l2d_decc_out_c6_lo1_4_scanin[34]
//  ff_l2d_decc_out_c6_hi1_2_scanin[34]
//  ff_l2d_decc_out_c6_hi1_4_scanin[34]
//  ff_l2d_decc_out_c6_lo0_2_scanin[35]
//  ff_l2d_decc_out_c6_lo0_4_scanin[35]
//  ff_l2d_decc_out_c6_hi0_2_scanin[35]
//  ff_l2d_decc_out_c6_hi0_4_scanin[35]
//  ff_l2d_decc_out_c6_lo1_2_scanin[35]
//  ff_l2d_decc_out_c6_lo1_4_scanin[35]
//  ff_l2d_decc_out_c6_hi1_2_scanin[35]
//  ff_l2d_decc_out_c6_hi1_4_scanin[35]
//  ff_l2d_decc_out_c6_lo0_2_scanin[36]
//  ff_l2d_decc_out_c6_lo0_4_scanin[36]
//  ff_l2d_decc_out_c6_hi0_2_scanin[36]
//  ff_l2d_decc_out_c6_hi0_4_scanin[36]
//  ff_l2d_decc_out_c6_lo1_2_scanin[36]
//  ff_l2d_decc_out_c6_lo1_4_scanin[36]
//  ff_l2d_decc_out_c6_hi1_2_scanin[36]
//  ff_l2d_decc_out_c6_hi1_4_scanin[36]
//  ff_l2d_decc_out_c6_lo0_2_scanin[37]
//  ff_l2d_decc_out_c6_lo0_4_scanin[37]
//  ff_l2d_decc_out_c6_hi0_2_scanin[37]
//  ff_l2d_decc_out_c6_hi0_4_scanin[37]
//  ff_l2d_decc_out_c6_lo1_2_scanin[37]
//  ff_l2d_decc_out_c6_lo1_4_scanin[37]
//  ff_l2d_decc_out_c6_hi1_2_scanin[37]
//  ff_l2d_decc_out_c6_hi1_4_scanin[37]
//  ff_l2d_decc_out_c6_lo0_2_scanin[38]
//  ff_l2d_decc_out_c6_lo0_4_scanin[38]
//  ff_l2d_decc_out_c6_hi0_2_scanin[38]
//  ff_l2d_decc_out_c6_hi0_4_scanin[38]
//  ff_l2d_decc_out_c6_lo1_2_scanin[38]
//  ff_l2d_decc_out_c6_lo1_4_scanin[38]
//  ff_l2d_decc_out_c6_hi1_2_scanin[38]
//  ff_l2d_decc_out_c6_hi1_4_scanin[38]
//  so_tstmod
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[24]


//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[24]

//  ff_cache_col_offset_c5_101_scanin[0]
//  ff_cache_col_offset_c5_101_scanin[2]
//  ff_cache_col_offset_c4_101_scanin[0]
//  ff_cache_col_offset_c4_101_scanin[2]
//  ff_cache_col_offset_c4_tog_101_scanin[0]
//  ff_cache_cache_rd_wr_c5_01_scanin
//  ff_cache_col_offset_c5_101_scanin[1]
//  ff_cache_col_offset_c5_101_scanin[3]
//  ff_cache_col_offset_c4_101_scanin[1]
//  ff_cache_col_offset_c4_101_scanin[3]
//  ff_cache_col_offset_c4_tog_101_scanin[1]

//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[34]

//  ff_l2t_l2d_stdecc_c3_scanin[0:38]

//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[24]


//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[24]

//  ff_l2d_decc_out_c6_lo1_1_scanin[19]
//  ff_l2d_decc_out_c6_lo1_3_scanin[19]
//  ff_l2d_decc_out_c6_hi1_1_scanin[19]
//  ff_l2d_decc_out_c6_hi1_3_scanin[19]
//  ff_l2d_decc_out_c6_lo0_1_scanin[20]
//  ff_l2d_decc_out_c6_lo0_3_scanin[20]
//  ff_l2d_decc_out_c6_hi0_1_scanin[20]
//  ff_l2d_decc_out_c6_hi0_3_scanin[20]
//  ff_l2d_decc_out_c6_lo1_1_scanin[20]
//  ff_l2d_decc_out_c6_lo1_3_scanin[20]
//  ff_l2d_decc_out_c6_hi1_1_scanin[20]
//  ff_l2d_decc_out_c6_hi1_3_scanin[20]
//  ff_l2d_decc_out_c6_lo0_1_scanin[21]
//  ff_l2d_decc_out_c6_lo0_3_scanin[21]
//  ff_l2d_decc_out_c6_hi0_1_scanin[21]
//  ff_l2d_decc_out_c6_hi0_3_scanin[21]
//  ff_l2d_decc_out_c6_lo1_1_scanin[21]
//  ff_l2d_decc_out_c6_lo1_3_scanin[21]
//  ff_l2d_decc_out_c6_hi1_1_scanin[21]
//  ff_l2d_decc_out_c6_hi1_3_scanin[21]
//  ff_l2d_decc_out_c6_lo0_1_scanin[22]
//  ff_l2d_decc_out_c6_lo0_3_scanin[22]
//  ff_l2d_decc_out_c6_hi0_1_scanin[22]
//  ff_l2d_decc_out_c6_hi0_3_scanin[22]
//  ff_l2d_decc_out_c6_lo1_1_scanin[22]
//  ff_l2d_decc_out_c6_lo1_3_scanin[22]
//  ff_l2d_decc_out_c6_hi1_1_scanin[22]
//  ff_l2d_decc_out_c6_hi1_3_scanin[22]
//  ff_l2d_decc_out_c6_lo0_1_scanin[23]
//  ff_l2d_decc_out_c6_lo0_3_scanin[23]
//  ff_l2d_decc_out_c6_hi0_1_scanin[23]
//  ff_l2d_decc_out_c6_hi0_3_scanin[23]
//  ff_l2d_decc_out_c6_lo1_1_scanin[23]
//  ff_l2d_decc_out_c6_lo1_3_scanin[23]
//  ff_l2d_decc_out_c6_hi1_1_scanin[23]
//  ff_l2d_decc_out_c6_hi1_3_scanin[23]
//  ff_l2d_decc_out_c6_lo0_1_scanin[24]
//  ff_l2d_decc_out_c6_lo0_3_scanin[24]
//  ff_l2d_decc_out_c6_hi0_1_scanin[24]
//  ff_l2d_decc_out_c6_hi0_3_scanin[24]
//  ff_l2d_decc_out_c6_lo1_1_scanin[24]
//  ff_l2d_decc_out_c6_lo1_3_scanin[24]
//  ff_l2d_decc_out_c6_hi1_1_scanin[24]
//  ff_l2d_decc_out_c6_hi1_3_scanin[24]
//  ff_l2d_decc_out_c6_lo0_1_scanin[25]
//  ff_l2d_decc_out_c6_lo0_3_scanin[25]
//  ff_l2d_decc_out_c6_hi0_1_scanin[25]
//  ff_l2d_decc_out_c6_hi0_3_scanin[25]
//  ff_l2d_decc_out_c6_lo1_1_scanin[25]
//  ff_l2d_decc_out_c6_lo1_3_scanin[25]
//  ff_l2d_decc_out_c6_hi1_1_scanin[25]
//  ff_l2d_decc_out_c6_hi1_3_scanin[25]
//  ff_l2d_decc_out_c6_lo0_1_scanin[26]
//  ff_l2d_decc_out_c6_lo0_3_scanin[26]
//  ff_l2d_decc_out_c6_hi0_1_scanin[26]
//  ff_l2d_decc_out_c6_hi0_3_scanin[26]
//  ff_l2d_decc_out_c6_lo1_1_scanin[26]
//  ff_l2d_decc_out_c6_lo1_3_scanin[26]
//  ff_l2d_decc_out_c6_hi1_1_scanin[26]
//  ff_l2d_decc_out_c6_hi1_3_scanin[26]
//  ff_l2d_decc_out_c6_lo0_1_scanin[27]
//  ff_l2d_decc_out_c6_lo0_3_scanin[27]
//  ff_l2d_decc_out_c6_hi0_1_scanin[27]
//  ff_l2d_decc_out_c6_hi0_3_scanin[27]
//  ff_l2d_decc_out_c6_lo1_1_scanin[27]
//  ff_l2d_decc_out_c6_lo1_3_scanin[27]
//  ff_l2d_decc_out_c6_hi1_1_scanin[27]
//  ff_l2d_decc_out_c6_hi1_3_scanin[27]
//  ff_l2d_decc_out_c6_lo0_1_scanin[28]
//  ff_l2d_decc_out_c6_lo0_3_scanin[28]
//  ff_l2d_decc_out_c6_hi0_1_scanin[28]
//  ff_l2d_decc_out_c6_hi0_3_scanin[28]
//  ff_l2d_decc_out_c6_lo1_1_scanin[28]
//  ff_l2d_decc_out_c6_lo1_3_scanin[28]
//  ff_l2d_decc_out_c6_hi1_1_scanin[28]
//  ff_l2d_decc_out_c6_hi1_3_scanin[28]
//  ff_l2d_decc_out_c6_lo0_1_scanin[29]
//  ff_l2d_decc_out_c6_lo0_3_scanin[29]

//  ff_l2d_decc_out_c6_hi0_1_scanin[29]
//  ff_l2d_decc_out_c6_hi0_3_scanin[29]
//  ff_l2d_decc_out_c6_lo1_1_scanin[29]
//  ff_l2d_decc_out_c6_lo1_3_scanin[29]
//  ff_l2d_decc_out_c6_hi1_1_scanin[29]
//  ff_l2d_decc_out_c6_hi1_3_scanin[29]
//  ff_l2d_decc_out_c6_lo0_1_scanin[30]
//  ff_l2d_decc_out_c6_lo0_3_scanin[30]
//  ff_l2d_decc_out_c6_hi0_1_scanin[30]
//  ff_l2d_decc_out_c6_hi0_3_scanin[30]
//  ff_l2d_decc_out_c6_lo1_1_scanin[30]
//  ff_l2d_decc_out_c6_lo1_3_scanin[30]
//  ff_l2d_decc_out_c6_hi1_1_scanin[30]
//  ff_l2d_decc_out_c6_hi1_3_scanin[30]
//  ff_l2d_decc_out_c6_lo0_1_scanin[31]
//  ff_l2d_decc_out_c6_lo0_3_scanin[31]
//  ff_l2d_decc_out_c6_hi0_1_scanin[31]
//  ff_l2d_decc_out_c6_hi0_3_scanin[31]
//  ff_l2d_decc_out_c6_lo1_1_scanin[31]
//  ff_l2d_decc_out_c6_lo1_3_scanin[31]
//  ff_l2d_decc_out_c6_hi1_1_scanin[31]
//  ff_l2d_decc_out_c6_hi1_3_scanin[31]
//  ff_l2d_decc_out_c6_lo0_1_scanin[32]
//  ff_l2d_decc_out_c6_lo0_3_scanin[32]
//  ff_l2d_decc_out_c6_hi0_1_scanin[32]
//  ff_l2d_decc_out_c6_hi0_3_scanin[32]
//  ff_l2d_decc_out_c6_lo1_1_scanin[32]
//  ff_l2d_decc_out_c6_lo1_3_scanin[32]
//  ff_l2d_decc_out_c6_hi1_1_scanin[32]
//  ff_l2d_decc_out_c6_hi1_3_scanin[32]
//  ff_l2d_decc_out_c6_lo0_1_scanin[33]
//  ff_l2d_decc_out_c6_lo0_3_scanin[33]
//  ff_l2d_decc_out_c6_hi0_1_scanin[33]
//  ff_l2d_decc_out_c6_hi0_3_scanin[33]
//  ff_l2d_decc_out_c6_lo1_1_scanin[33]
//  ff_l2d_decc_out_c6_lo1_3_scanin[33]
//  ff_l2d_decc_out_c6_hi1_1_scanin[33]
//  ff_l2d_decc_out_c6_hi1_3_scanin[33]
//  ff_l2d_decc_out_c6_lo0_1_scanin[34]
//  ff_l2d_decc_out_c6_lo0_3_scanin[34]
//  ff_l2d_decc_out_c6_hi0_1_scanin[34]
//  ff_l2d_decc_out_c6_hi0_3_scanin[34]
//  ff_l2d_decc_out_c6_lo1_1_scanin[34]
//  ff_l2d_decc_out_c6_lo1_3_scanin[34]
//  ff_l2d_decc_out_c6_hi1_1_scanin[34]
//  ff_l2d_decc_out_c6_hi1_3_scanin[34]
//  ff_l2d_decc_out_c6_lo0_1_scanin[35]
//  ff_l2d_decc_out_c6_lo0_3_scanin[35]
//  ff_l2d_decc_out_c6_hi0_1_scanin[35]
//  ff_l2d_decc_out_c6_hi0_3_scanin[35]
//  ff_l2d_decc_out_c6_lo1_1_scanin[35]
//  ff_l2d_decc_out_c6_lo1_3_scanin[35]
//  ff_l2d_decc_out_c6_hi1_1_scanin[35]
//  ff_l2d_decc_out_c6_hi1_3_scanin[35]
//  ff_l2d_decc_out_c6_lo0_1_scanin[36]
//  ff_l2d_decc_out_c6_lo0_3_scanin[36]
//  ff_l2d_decc_out_c6_hi0_1_scanin[36]
//  ff_l2d_decc_out_c6_hi0_3_scanin[36]
//  ff_l2d_decc_out_c6_lo1_1_scanin[36]
//  ff_l2d_decc_out_c6_lo1_3_scanin[36]
//  ff_l2d_decc_out_c6_hi1_1_scanin[36]
//  ff_l2d_decc_out_c6_hi1_3_scanin[36]
//  ff_l2d_decc_out_c6_lo0_1_scanin[37]
//  ff_l2d_decc_out_c6_lo0_3_scanin[37]
//  ff_l2d_decc_out_c6_hi0_1_scanin[37]
//  ff_l2d_decc_out_c6_hi0_3_scanin[37]
//  ff_l2d_decc_out_c6_lo1_1_scanin[37]
//  ff_l2d_decc_out_c6_lo1_3_scanin[37]
//  ff_l2d_decc_out_c6_hi1_1_scanin[37]
//  ff_l2d_decc_out_c6_hi1_3_scanin[37]
//  ff_l2d_decc_out_c6_lo0_1_scanin[38]
//  ff_l2d_decc_out_c6_lo0_3_scanin[38]
//  ff_l2d_decc_out_c6_hi0_1_scanin[38]
//  ff_l2d_decc_out_c6_hi0_3_scanin[38]
//  ff_l2d_decc_out_c6_lo1_1_scanin[38]
//  ff_l2d_decc_out_c6_lo1_3_scanin[38]
//  ff_l2d_decc_out_c6_hi1_1_scanin[38]
//  ff_l2d_decc_out_c6_hi1_3_scanin[38]

//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[4]

//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[4]

//  ff_cache_col_offset_c5_001_scanin[0]
//  ff_cache_col_offset_c5_001_scanin[2]
//  ff_cache_col_offset_c4_001_scanin[0]
//  ff_cache_col_offset_c4_001_scanin[2]
//  ff_cache_col_offset_c4_tog_001_scanin[0]
//  ff_cache_cache_rd_wr_c5_00_scanin
//  ff_cache_col_offset_c5_001_scanin[1]
//  ff_cache_col_offset_c5_001_scanin[3]
//  ff_cache_col_offset_c4_001_scanin[1]
//  ff_cache_col_offset_c4_001_scanin[3]
//  ff_cache_col_offset_c4_tog_001_scanin[1]

//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[14]


//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[4]



//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[4]


//  ff_l2d_decc_out_c6_lo0_1_scanin[0]
//  ff_l2d_decc_out_c6_lo0_3_scanin[0]
//  ff_l2d_decc_out_c6_hi0_1_scanin[0]
//  ff_l2d_decc_out_c6_hi0_3_scanin[0]
//  ff_l2d_decc_out_c6_lo1_1_scanin[0]
//  ff_l2d_decc_out_c6_lo1_3_scanin[0]
//  ff_l2d_decc_out_c6_hi1_1_scanin[0]
//  ff_l2d_decc_out_c6_hi1_3_scanin[0]
//  ff_l2d_decc_out_c6_lo0_1_scanin[1]
//  ff_l2d_decc_out_c6_lo0_3_scanin[1]
//  ff_l2d_decc_out_c6_hi0_1_scanin[1]
//  ff_l2d_decc_out_c6_hi0_3_scanin[1]
//  ff_l2d_decc_out_c6_lo1_1_scanin[1]
//  ff_l2d_decc_out_c6_lo1_3_scanin[1]
//  ff_l2d_decc_out_c6_hi1_1_scanin[1]
//  ff_l2d_decc_out_c6_hi1_3_scanin[1]
//  ff_l2d_decc_out_c6_lo0_1_scanin[2]
//  ff_l2d_decc_out_c6_lo0_3_scanin[2]
//  ff_l2d_decc_out_c6_hi0_1_scanin[2]
//  ff_l2d_decc_out_c6_hi0_3_scanin[2]
//  ff_l2d_decc_out_c6_lo1_1_scanin[2]
//  ff_l2d_decc_out_c6_lo1_3_scanin[2]
//  ff_l2d_decc_out_c6_hi1_1_scanin[2]
//  ff_l2d_decc_out_c6_hi1_3_scanin[2]
//  ff_l2d_decc_out_c6_lo0_1_scanin[3]
//  ff_l2d_decc_out_c6_lo0_3_scanin[3]
//  ff_l2d_decc_out_c6_hi0_1_scanin[3]
//  ff_l2d_decc_out_c6_hi0_3_scanin[3]
//  ff_l2d_decc_out_c6_lo1_1_scanin[3]
//  ff_l2d_decc_out_c6_lo1_3_scanin[3]
//  ff_l2d_decc_out_c6_hi1_1_scanin[3]
//  ff_l2d_decc_out_c6_hi1_3_scanin[3]
//  ff_l2d_decc_out_c6_lo0_1_scanin[4]
//  ff_l2d_decc_out_c6_lo0_3_scanin[4]
//  ff_l2d_decc_out_c6_hi0_1_scanin[4]
//  ff_l2d_decc_out_c6_hi0_3_scanin[4]
//  ff_l2d_decc_out_c6_lo1_1_scanin[4]
//  ff_l2d_decc_out_c6_lo1_3_scanin[4]
//  ff_l2d_decc_out_c6_hi1_1_scanin[4]
//  ff_l2d_decc_out_c6_hi1_3_scanin[4]
//  ff_l2d_decc_out_c6_lo0_1_scanin[5]
//  ff_l2d_decc_out_c6_lo0_3_scanin[5]
//  ff_l2d_decc_out_c6_hi0_1_scanin[5]
//  ff_l2d_decc_out_c6_hi0_3_scanin[5]
//  ff_l2d_decc_out_c6_lo1_1_scanin[5]
//  ff_l2d_decc_out_c6_lo1_3_scanin[5]
//  ff_l2d_decc_out_c6_hi1_1_scanin[5]
//  ff_l2d_decc_out_c6_hi1_3_scanin[5]
//  ff_l2d_decc_out_c6_lo0_1_scanin[6]
//  ff_l2d_decc_out_c6_lo0_3_scanin[6]
//  ff_l2d_decc_out_c6_hi0_1_scanin[6]
//  ff_l2d_decc_out_c6_hi0_3_scanin[6]
//  ff_l2d_decc_out_c6_lo1_1_scanin[6]
//  ff_l2d_decc_out_c6_lo1_3_scanin[6]
//  ff_l2d_decc_out_c6_hi1_1_scanin[6]
//  ff_l2d_decc_out_c6_hi1_3_scanin[6]
//  ff_l2d_decc_out_c6_lo0_1_scanin[7]
//  ff_l2d_decc_out_c6_lo0_3_scanin[7]
//  ff_l2d_decc_out_c6_hi0_1_scanin[7]
//  ff_l2d_decc_out_c6_hi0_3_scanin[7]
//  ff_l2d_decc_out_c6_lo1_1_scanin[7]
//  ff_l2d_decc_out_c6_lo1_3_scanin[7]
//  ff_l2d_decc_out_c6_hi1_1_scanin[7]
//  ff_l2d_decc_out_c6_hi1_3_scanin[7]
//  ff_l2d_decc_out_c6_lo0_1_scanin[8]
//  ff_l2d_decc_out_c6_lo0_3_scanin[8]
//  ff_l2d_decc_out_c6_hi0_1_scanin[8]
//  ff_l2d_decc_out_c6_hi0_3_scanin[8]
//  ff_l2d_decc_out_c6_lo1_1_scanin[8]
//  ff_l2d_decc_out_c6_lo1_3_scanin[8]
//  ff_l2d_decc_out_c6_hi1_1_scanin[8]
//  ff_l2d_decc_out_c6_hi1_3_scanin[8]
//  ff_l2d_decc_out_c6_lo0_1_scanin[9]
//  ff_l2d_decc_out_c6_lo0_3_scanin[9]
//  ff_l2d_decc_out_c6_hi0_1_scanin[9]
//  ff_l2d_decc_out_c6_hi0_3_scanin[9]
//  ff_l2d_decc_out_c6_lo1_1_scanin[9]
//  ff_l2d_decc_out_c6_lo1_3_scanin[9]
//  ff_l2d_decc_out_c6_hi1_1_scanin[9]
//  ff_l2d_decc_out_c6_hi1_3_scanin[9]

//  ff_l2d_decc_out_c6_lo0_1_scanin[10]
//  ff_l2d_decc_out_c6_lo0_3_scanin[10]
//  ff_l2d_decc_out_c6_hi0_1_scanin[10]
//  ff_l2d_decc_out_c6_hi0_3_scanin[10]
//  ff_l2d_decc_out_c6_lo1_1_scanin[10]
//  ff_l2d_decc_out_c6_lo1_3_scanin[10]
//  ff_l2d_decc_out_c6_hi1_1_scanin[10]
//  ff_l2d_decc_out_c6_hi1_3_scanin[10]
//  ff_l2d_decc_out_c6_lo0_1_scanin[11]
//  ff_l2d_decc_out_c6_lo0_3_scanin[11]
//  ff_l2d_decc_out_c6_hi0_1_scanin[11]
//  ff_l2d_decc_out_c6_hi0_3_scanin[11]
//  ff_l2d_decc_out_c6_lo1_1_scanin[11]
//  ff_l2d_decc_out_c6_lo1_3_scanin[11]
//  ff_l2d_decc_out_c6_hi1_1_scanin[11]
//  ff_l2d_decc_out_c6_hi1_3_scanin[11]
//  ff_l2d_decc_out_c6_lo0_1_scanin[12]
//  ff_l2d_decc_out_c6_lo0_3_scanin[12]
//  ff_l2d_decc_out_c6_hi0_1_scanin[12]
//  ff_l2d_decc_out_c6_hi0_3_scanin[12]
//  ff_l2d_decc_out_c6_lo1_1_scanin[12]
//  ff_l2d_decc_out_c6_lo1_3_scanin[12]
//  ff_l2d_decc_out_c6_hi1_1_scanin[12]
//  ff_l2d_decc_out_c6_hi1_3_scanin[12]
//  ff_l2d_decc_out_c6_lo0_1_scanin[13]
//  ff_l2d_decc_out_c6_lo0_3_scanin[13]
//  ff_l2d_decc_out_c6_hi0_1_scanin[13]
//  ff_l2d_decc_out_c6_hi0_3_scanin[13]
//  ff_l2d_decc_out_c6_lo1_1_scanin[13]
//  ff_l2d_decc_out_c6_lo1_3_scanin[13]
//  ff_l2d_decc_out_c6_hi1_1_scanin[13]
//  ff_l2d_decc_out_c6_hi1_3_scanin[13]
//  ff_l2d_decc_out_c6_lo0_1_scanin[14]
//  ff_l2d_decc_out_c6_lo0_3_scanin[14]
//  ff_l2d_decc_out_c6_hi0_1_scanin[14]
//  ff_l2d_decc_out_c6_hi0_3_scanin[14]
//  ff_l2d_decc_out_c6_lo1_1_scanin[14]
//  ff_l2d_decc_out_c6_lo1_3_scanin[14]
//  ff_l2d_decc_out_c6_hi1_1_scanin[14]
//  ff_l2d_decc_out_c6_hi1_3_scanin[14]
//  ff_l2d_decc_out_c6_lo0_1_scanin[15]
//  ff_l2d_decc_out_c6_lo0_3_scanin[15]
//  ff_l2d_decc_out_c6_hi0_1_scanin[15]
//  ff_l2d_decc_out_c6_hi0_3_scanin[15]
//  ff_l2d_decc_out_c6_lo1_1_scanin[15]
//  ff_l2d_decc_out_c6_lo1_3_scanin[15]
//  ff_l2d_decc_out_c6_hi1_1_scanin[15]
//  ff_l2d_decc_out_c6_hi1_3_scanin[15]
//  ff_l2d_decc_out_c6_lo0_1_scanin[16]
//  ff_l2d_decc_out_c6_lo0_3_scanin[16]
//  ff_l2d_decc_out_c6_hi0_1_scanin[16]
//  ff_l2d_decc_out_c6_hi0_3_scanin[16]
//  ff_l2d_decc_out_c6_lo1_1_scanin[16]
//  ff_l2d_decc_out_c6_lo1_3_scanin[16]
//  ff_l2d_decc_out_c6_hi1_1_scanin[16]
//  ff_l2d_decc_out_c6_hi1_3_scanin[16]
//  ff_l2d_decc_out_c6_lo0_1_scanin[17]
//  ff_l2d_decc_out_c6_lo0_3_scanin[17]
//  ff_l2d_decc_out_c6_hi0_1_scanin[17]
//  ff_l2d_decc_out_c6_hi0_3_scanin[17]
//  ff_l2d_decc_out_c6_lo1_1_scanin[17]
//  ff_l2d_decc_out_c6_lo1_3_scanin[17]
//  ff_l2d_decc_out_c6_hi1_1_scanin[17]
//  ff_l2d_decc_out_c6_hi1_3_scanin[17]
//  ff_l2d_decc_out_c6_lo0_1_scanin[18]
//  ff_l2d_decc_out_c6_lo0_3_scanin[18]
//  ff_l2d_decc_out_c6_hi0_1_scanin[18]
//  ff_l2d_decc_out_c6_hi0_3_scanin[18]
//  ff_l2d_decc_out_c6_lo1_1_scanin[18]
//  ff_l2d_decc_out_c6_lo1_3_scanin[18]
//  ff_l2d_decc_out_c6_hi1_1_scanin[18]
//  ff_l2d_decc_out_c6_hi1_3_scanin[18]
//  ff_l2d_decc_out_c6_lo0_1_scanin[19]
//  ff_l2d_decc_out_c6_lo0_3_scanin[19]
//  ff_l2d_decc_out_c6_hi0_1_scanin[19]
//  ff_l2d_decc_out_c6_hi0_3_scanin[19]
// scanorder end
// fixscan start
assign ff_cache_cache_rd_wr_c4_scanin=scan_in;
assign ff_cache_set_c3_scanin[8]=ff_cache_cache_rd_wr_c4_scanout;
assign ff_cache_set_c3_scanin[7]=ff_cache_set_c3_scanout[8];
assign ff_cache_set_c3_scanin[6]=ff_cache_set_c3_scanout[7];
assign ff_cache_set_c3_scanin[5]=ff_cache_set_c3_scanout[6];
assign ff_cache_set_c3_scanin[4]=ff_cache_set_c3_scanout[5];
assign ff_cache_set_c3_scanin[3]=ff_cache_set_c3_scanout[4];
assign ff_cache_set_c3_scanin[2]=ff_cache_set_c3_scanout[3];
assign ff_cache_set_c3_scanin[1]=ff_cache_set_c3_scanout[2];
assign ff_cache_set_c3_scanin[0]=ff_cache_set_c3_scanout[1];
assign ff_cache_word_en_c3_scanin[1]=ff_cache_set_c3_scanout[0];
assign ff_cache_word_en_c3_scanin[3]=ff_cache_word_en_c3_scanout[1];
assign ff_cache_word_en_c3_scanin[5]=ff_cache_word_en_c3_scanout[3];
assign ff_cache_word_en_c3_scanin[7]=ff_cache_word_en_c3_scanout[5];
assign ff_cache_word_en_c3_scanin[9]=ff_cache_word_en_c3_scanout[7];
assign ff_cache_word_en_c3_scanin[11]=ff_cache_word_en_c3_scanout[9];
assign ff_cache_word_en_c3_scanin[13]=ff_cache_word_en_c3_scanout[11];
assign ff_cache_word_en_c3_scanin[15]=ff_cache_word_en_c3_scanout[13];
assign ff_cache_col_offset_c3_scanin[0]=ff_cache_word_en_c3_scanout[15];
assign ff_cache_col_offset_c4_scanin[0]=ff_cache_col_offset_c3_scanout[0];
assign ff_cache_col_offset_c5_muxsel_scanin[0]=ff_cache_col_offset_c4_scanout[0];
assign ff_cache_col_offset_c5_muxsel_scanin[1]=ff_cache_col_offset_c5_muxsel_scanout[0];
assign ff_cache_col_offset_c4_scanin[1]=ff_cache_col_offset_c5_muxsel_scanout[1];
assign ff_cache_col_offset_c3_scanin[1]=ff_cache_col_offset_c4_scanout[1];
assign ff_cache_col_offset_c3_scanin[2]=ff_cache_col_offset_c3_scanout[1];
assign ff_cache_col_offset_c4_scanin[2]=ff_cache_col_offset_c3_scanout[2];
assign ff_cache_col_offset_c5_muxsel_scanin[2]=ff_cache_col_offset_c4_scanout[2];
assign ff_cache_col_offset_c5_muxsel_scanin[3]=ff_cache_col_offset_c5_muxsel_scanout[2];
assign ff_cache_col_offset_c4_scanin[3]=ff_cache_col_offset_c5_muxsel_scanout[3];
assign ff_cache_col_offset_c3_scanin[3]=ff_cache_col_offset_c4_scanout[3];
assign ff_cache_col_offset_all_c4_scanin=ff_cache_col_offset_c3_scanout[3];
assign ff_cache_col_offset_all_c5_scanin=ff_cache_col_offset_all_c4_scanout;
assign ff_cache_col_offset_all_c6_scanin=ff_cache_col_offset_all_c5_scanout;
assign ff_cache_col_offset_all_c7_scanin=ff_cache_col_offset_all_c6_scanout;
assign ff_cache_word_en_c3_scanin[0]=ff_cache_col_offset_all_c7_scanout;
assign ff_cache_word_en_c3_scanin[2]=ff_cache_word_en_c3_scanout[0];
assign ff_cache_word_en_c3_scanin[4]=ff_cache_word_en_c3_scanout[2];
assign ff_cache_word_en_c3_scanin[6]=ff_cache_word_en_c3_scanout[4];
assign ff_cache_word_en_c3_scanin[8]=ff_cache_word_en_c3_scanout[6];
assign ff_cache_word_en_c3_scanin[10]=ff_cache_word_en_c3_scanout[8];
assign ff_cache_word_en_c3_scanin[12]=ff_cache_word_en_c3_scanout[10];
assign ff_cache_word_en_c3_scanin[14]=ff_cache_word_en_c3_scanout[12];
assign ff_cache_col_offset_c52_scanin[1]=ff_cache_word_en_c3_scanout[14];
assign ff_cache_col_offset_c52_scanin[0]=ff_cache_col_offset_c52_scanout[1];
assign ff_cache_col_offset_c52_topsel_scanin=ff_cache_col_offset_c52_scanout[0];
assign ff_cache_fb_hit_c4_scanin=ff_cache_col_offset_c52_topsel_scanout;
assign ff_cache_fb_hit_c5_scanin=ff_cache_fb_hit_c4_scanout;
assign ff_cache_fb_hit_c52_scanin=ff_cache_fb_hit_c5_scanout;
assign ff_cache_sel_fbdecc_c4_scanin=ff_cache_fb_hit_c52_scanout;
assign ff_cache_sel_fbdecc_c5_scanin=ff_cache_sel_fbdecc_c4_scanout;
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[0]=ff_cache_sel_fbdecc_c5_scanout;
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[5];
assign ff_l2t_l2d_stdecc_c3_scanin[77]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[4];
assign ff_l2t_l2d_stdecc_c3_scanin[76]=ff_l2t_l2d_stdecc_c3_scanout[77];
assign ff_l2t_l2d_stdecc_c3_scanin[75]=ff_l2t_l2d_stdecc_c3_scanout[76];
assign ff_l2t_l2d_stdecc_c3_scanin[74]=ff_l2t_l2d_stdecc_c3_scanout[75];
assign ff_l2t_l2d_stdecc_c3_scanin[73]=ff_l2t_l2d_stdecc_c3_scanout[74];
assign ff_l2t_l2d_stdecc_c3_scanin[72]=ff_l2t_l2d_stdecc_c3_scanout[73];
assign ff_l2t_l2d_stdecc_c3_scanin[71]=ff_l2t_l2d_stdecc_c3_scanout[72];
assign ff_l2t_l2d_stdecc_c3_scanin[70]=ff_l2t_l2d_stdecc_c3_scanout[71];
assign ff_l2t_l2d_stdecc_c3_scanin[69]=ff_l2t_l2d_stdecc_c3_scanout[70];
assign ff_l2t_l2d_stdecc_c3_scanin[68]=ff_l2t_l2d_stdecc_c3_scanout[69];
assign ff_l2t_l2d_stdecc_c3_scanin[67]=ff_l2t_l2d_stdecc_c3_scanout[68];
assign ff_l2t_l2d_stdecc_c3_scanin[66]=ff_l2t_l2d_stdecc_c3_scanout[67];
assign ff_l2t_l2d_stdecc_c3_scanin[65]=ff_l2t_l2d_stdecc_c3_scanout[66];
assign ff_l2t_l2d_stdecc_c3_scanin[64]=ff_l2t_l2d_stdecc_c3_scanout[65];
assign ff_l2t_l2d_stdecc_c3_scanin[63]=ff_l2t_l2d_stdecc_c3_scanout[64];
assign ff_l2t_l2d_stdecc_c3_scanin[62]=ff_l2t_l2d_stdecc_c3_scanout[63];
assign ff_l2t_l2d_stdecc_c3_scanin[61]=ff_l2t_l2d_stdecc_c3_scanout[62];
assign ff_l2t_l2d_stdecc_c3_scanin[60]=ff_l2t_l2d_stdecc_c3_scanout[61];
assign ff_l2t_l2d_stdecc_c3_scanin[59]=ff_l2t_l2d_stdecc_c3_scanout[60];
assign ff_l2t_l2d_stdecc_c3_scanin[58]=ff_l2t_l2d_stdecc_c3_scanout[59];
assign ff_l2t_l2d_stdecc_c3_scanin[57]=ff_l2t_l2d_stdecc_c3_scanout[58];
assign ff_l2t_l2d_stdecc_c3_scanin[56]=ff_l2t_l2d_stdecc_c3_scanout[57];
assign ff_l2t_l2d_stdecc_c3_scanin[55]=ff_l2t_l2d_stdecc_c3_scanout[56];
assign ff_l2t_l2d_stdecc_c3_scanin[54]=ff_l2t_l2d_stdecc_c3_scanout[55];
assign ff_l2t_l2d_stdecc_c3_scanin[53]=ff_l2t_l2d_stdecc_c3_scanout[54];
assign ff_l2t_l2d_stdecc_c3_scanin[52]=ff_l2t_l2d_stdecc_c3_scanout[53];
assign ff_l2t_l2d_stdecc_c3_scanin[51]=ff_l2t_l2d_stdecc_c3_scanout[52];
assign ff_l2t_l2d_stdecc_c3_scanin[50]=ff_l2t_l2d_stdecc_c3_scanout[51];
assign ff_l2t_l2d_stdecc_c3_scanin[49]=ff_l2t_l2d_stdecc_c3_scanout[50];
assign ff_l2t_l2d_stdecc_c3_scanin[48]=ff_l2t_l2d_stdecc_c3_scanout[49];
assign ff_l2t_l2d_stdecc_c3_scanin[47]=ff_l2t_l2d_stdecc_c3_scanout[48];
assign ff_l2t_l2d_stdecc_c3_scanin[46]=ff_l2t_l2d_stdecc_c3_scanout[47];
assign ff_l2t_l2d_stdecc_c3_scanin[45]=ff_l2t_l2d_stdecc_c3_scanout[46];
assign ff_l2t_l2d_stdecc_c3_scanin[44]=ff_l2t_l2d_stdecc_c3_scanout[45];
assign ff_l2t_l2d_stdecc_c3_scanin[43]=ff_l2t_l2d_stdecc_c3_scanout[44];
assign ff_l2t_l2d_stdecc_c3_scanin[42]=ff_l2t_l2d_stdecc_c3_scanout[43];
assign ff_l2t_l2d_stdecc_c3_scanin[41]=ff_l2t_l2d_stdecc_c3_scanout[42];
assign ff_l2t_l2d_stdecc_c3_scanin[40]=ff_l2t_l2d_stdecc_c3_scanout[41];
assign ff_l2t_l2d_stdecc_c3_scanin[39]=ff_l2t_l2d_stdecc_c3_scanout[40];
assign ff_cache_col_offset_c5_023_scanin[0]=ff_l2t_l2d_stdecc_c3_scanout[39];
assign ff_cache_col_offset_c5_023_scanin[2]=ff_cache_col_offset_c5_023_scanout[0];
assign ff_cache_col_offset_c4_023_scanin[0]=ff_cache_col_offset_c5_023_scanout[2];
assign ff_cache_col_offset_c4_023_scanin[2]=ff_cache_col_offset_c4_023_scanout[0];
assign ff_cache_col_offset_c4_tog_023_scanin[0]=ff_cache_col_offset_c4_023_scanout[2];
assign ff_cache_cache_rd_wr_c5_20_scanin=ff_cache_col_offset_c4_tog_023_scanout[0];
assign ff_cache_col_offset_c5_023_scanin[1]=ff_cache_cache_rd_wr_c5_20_scanout;
assign ff_cache_col_offset_c5_023_scanin[3]=ff_cache_col_offset_c5_023_scanout[1];
assign ff_cache_col_offset_c4_023_scanin[1]=ff_cache_col_offset_c5_023_scanout[3];
assign ff_cache_col_offset_c4_023_scanin[3]=ff_cache_col_offset_c4_023_scanout[1];
assign ff_cache_col_offset_c4_tog_023_scanin[1]=ff_cache_col_offset_c4_023_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[19]=ff_cache_col_offset_c4_tog_023_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[5];
assign ff_l2d_decc_out_c6_lo0_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[4];
assign ff_l2d_decc_out_c6_lo0_4_scanin[0]=ff_l2d_decc_out_c6_lo0_2_scanout[0];
assign ff_l2d_decc_out_c6_hi0_2_scanin[0]=ff_l2d_decc_out_c6_lo0_4_scanout[0];
assign ff_l2d_decc_out_c6_hi0_4_scanin[0]=ff_l2d_decc_out_c6_hi0_2_scanout[0];
assign ff_l2d_decc_out_c6_lo1_2_scanin[0]=ff_l2d_decc_out_c6_hi0_4_scanout[0];
assign ff_l2d_decc_out_c6_lo1_4_scanin[0]=ff_l2d_decc_out_c6_lo1_2_scanout[0];
assign ff_l2d_decc_out_c6_hi1_2_scanin[0]=ff_l2d_decc_out_c6_lo1_4_scanout[0];
assign ff_l2d_decc_out_c6_hi1_4_scanin[0]=ff_l2d_decc_out_c6_hi1_2_scanout[0];
assign ff_l2d_decc_out_c6_lo0_2_scanin[1]=ff_l2d_decc_out_c6_hi1_4_scanout[0];
assign ff_l2d_decc_out_c6_lo0_4_scanin[1]=ff_l2d_decc_out_c6_lo0_2_scanout[1];
assign ff_l2d_decc_out_c6_hi0_2_scanin[1]=ff_l2d_decc_out_c6_lo0_4_scanout[1];
assign ff_l2d_decc_out_c6_hi0_4_scanin[1]=ff_l2d_decc_out_c6_hi0_2_scanout[1];
assign ff_l2d_decc_out_c6_lo1_2_scanin[1]=ff_l2d_decc_out_c6_hi0_4_scanout[1];
assign ff_l2d_decc_out_c6_lo1_4_scanin[1]=ff_l2d_decc_out_c6_lo1_2_scanout[1];
assign ff_l2d_decc_out_c6_hi1_2_scanin[1]=ff_l2d_decc_out_c6_lo1_4_scanout[1];
assign ff_l2d_decc_out_c6_hi1_4_scanin[1]=ff_l2d_decc_out_c6_hi1_2_scanout[1];
assign ff_l2d_decc_out_c6_lo0_2_scanin[2]=ff_l2d_decc_out_c6_hi1_4_scanout[1];
assign ff_l2d_decc_out_c6_lo0_4_scanin[2]=ff_l2d_decc_out_c6_lo0_2_scanout[2];
assign ff_l2d_decc_out_c6_hi0_2_scanin[2]=ff_l2d_decc_out_c6_lo0_4_scanout[2];
assign ff_l2d_decc_out_c6_hi0_4_scanin[2]=ff_l2d_decc_out_c6_hi0_2_scanout[2];
assign ff_l2d_decc_out_c6_lo1_2_scanin[2]=ff_l2d_decc_out_c6_hi0_4_scanout[2];
assign ff_l2d_decc_out_c6_lo1_4_scanin[2]=ff_l2d_decc_out_c6_lo1_2_scanout[2];
assign ff_l2d_decc_out_c6_hi1_2_scanin[2]=ff_l2d_decc_out_c6_lo1_4_scanout[2];
assign ff_l2d_decc_out_c6_hi1_4_scanin[2]=ff_l2d_decc_out_c6_hi1_2_scanout[2];
assign ff_l2d_decc_out_c6_lo0_2_scanin[3]=ff_l2d_decc_out_c6_hi1_4_scanout[2];
assign ff_l2d_decc_out_c6_lo0_4_scanin[3]=ff_l2d_decc_out_c6_lo0_2_scanout[3];
assign ff_l2d_decc_out_c6_hi0_2_scanin[3]=ff_l2d_decc_out_c6_lo0_4_scanout[3];
assign ff_l2d_decc_out_c6_hi0_4_scanin[3]=ff_l2d_decc_out_c6_hi0_2_scanout[3];
assign ff_l2d_decc_out_c6_lo1_2_scanin[3]=ff_l2d_decc_out_c6_hi0_4_scanout[3];
assign ff_l2d_decc_out_c6_lo1_4_scanin[3]=ff_l2d_decc_out_c6_lo1_2_scanout[3];
assign ff_l2d_decc_out_c6_hi1_2_scanin[3]=ff_l2d_decc_out_c6_lo1_4_scanout[3];
assign ff_l2d_decc_out_c6_hi1_4_scanin[3]=ff_l2d_decc_out_c6_hi1_2_scanout[3];
assign ff_l2d_decc_out_c6_lo0_2_scanin[4]=ff_l2d_decc_out_c6_hi1_4_scanout[3];
assign ff_l2d_decc_out_c6_lo0_4_scanin[4]=ff_l2d_decc_out_c6_lo0_2_scanout[4];
assign ff_l2d_decc_out_c6_hi0_2_scanin[4]=ff_l2d_decc_out_c6_lo0_4_scanout[4];
assign ff_l2d_decc_out_c6_hi0_4_scanin[4]=ff_l2d_decc_out_c6_hi0_2_scanout[4];
assign ff_l2d_decc_out_c6_lo1_2_scanin[4]=ff_l2d_decc_out_c6_hi0_4_scanout[4];
assign ff_l2d_decc_out_c6_lo1_4_scanin[4]=ff_l2d_decc_out_c6_lo1_2_scanout[4];
assign ff_l2d_decc_out_c6_hi1_2_scanin[4]=ff_l2d_decc_out_c6_lo1_4_scanout[4];
assign ff_l2d_decc_out_c6_hi1_4_scanin[4]=ff_l2d_decc_out_c6_hi1_2_scanout[4];
assign ff_l2d_decc_out_c6_lo0_2_scanin[5]=ff_l2d_decc_out_c6_hi1_4_scanout[4];
assign ff_l2d_decc_out_c6_lo0_4_scanin[5]=ff_l2d_decc_out_c6_lo0_2_scanout[5];
assign ff_l2d_decc_out_c6_hi0_2_scanin[5]=ff_l2d_decc_out_c6_lo0_4_scanout[5];
assign ff_l2d_decc_out_c6_hi0_4_scanin[5]=ff_l2d_decc_out_c6_hi0_2_scanout[5];
assign ff_l2d_decc_out_c6_lo1_2_scanin[5]=ff_l2d_decc_out_c6_hi0_4_scanout[5];
assign ff_l2d_decc_out_c6_lo1_4_scanin[5]=ff_l2d_decc_out_c6_lo1_2_scanout[5];
assign ff_l2d_decc_out_c6_hi1_2_scanin[5]=ff_l2d_decc_out_c6_lo1_4_scanout[5];
assign ff_l2d_decc_out_c6_hi1_4_scanin[5]=ff_l2d_decc_out_c6_hi1_2_scanout[5];
assign ff_l2d_decc_out_c6_lo0_2_scanin[6]=ff_l2d_decc_out_c6_hi1_4_scanout[5];
assign ff_l2d_decc_out_c6_lo0_4_scanin[6]=ff_l2d_decc_out_c6_lo0_2_scanout[6];
assign ff_l2d_decc_out_c6_hi0_2_scanin[6]=ff_l2d_decc_out_c6_lo0_4_scanout[6];
assign ff_l2d_decc_out_c6_hi0_4_scanin[6]=ff_l2d_decc_out_c6_hi0_2_scanout[6];
assign ff_l2d_decc_out_c6_lo1_2_scanin[6]=ff_l2d_decc_out_c6_hi0_4_scanout[6];
assign ff_l2d_decc_out_c6_lo1_4_scanin[6]=ff_l2d_decc_out_c6_lo1_2_scanout[6];
assign ff_l2d_decc_out_c6_hi1_2_scanin[6]=ff_l2d_decc_out_c6_lo1_4_scanout[6];
assign ff_l2d_decc_out_c6_hi1_4_scanin[6]=ff_l2d_decc_out_c6_hi1_2_scanout[6];
assign ff_l2d_decc_out_c6_lo0_2_scanin[7]=ff_l2d_decc_out_c6_hi1_4_scanout[6];
assign ff_l2d_decc_out_c6_lo0_4_scanin[7]=ff_l2d_decc_out_c6_lo0_2_scanout[7];
assign ff_l2d_decc_out_c6_hi0_2_scanin[7]=ff_l2d_decc_out_c6_lo0_4_scanout[7];
assign ff_l2d_decc_out_c6_hi0_4_scanin[7]=ff_l2d_decc_out_c6_hi0_2_scanout[7];
assign ff_l2d_decc_out_c6_lo1_2_scanin[7]=ff_l2d_decc_out_c6_hi0_4_scanout[7];
assign ff_l2d_decc_out_c6_lo1_4_scanin[7]=ff_l2d_decc_out_c6_lo1_2_scanout[7];
assign ff_l2d_decc_out_c6_hi1_2_scanin[7]=ff_l2d_decc_out_c6_lo1_4_scanout[7];
assign ff_l2d_decc_out_c6_hi1_4_scanin[7]=ff_l2d_decc_out_c6_hi1_2_scanout[7];
assign ff_l2d_decc_out_c6_lo0_2_scanin[8]=ff_l2d_decc_out_c6_hi1_4_scanout[7];
assign ff_l2d_decc_out_c6_lo0_4_scanin[8]=ff_l2d_decc_out_c6_lo0_2_scanout[8];
assign ff_l2d_decc_out_c6_hi0_2_scanin[8]=ff_l2d_decc_out_c6_lo0_4_scanout[8];
assign ff_l2d_decc_out_c6_hi0_4_scanin[8]=ff_l2d_decc_out_c6_hi0_2_scanout[8];
assign ff_l2d_decc_out_c6_lo1_2_scanin[8]=ff_l2d_decc_out_c6_hi0_4_scanout[8];
assign ff_l2d_decc_out_c6_lo1_4_scanin[8]=ff_l2d_decc_out_c6_lo1_2_scanout[8];
assign ff_l2d_decc_out_c6_hi1_2_scanin[8]=ff_l2d_decc_out_c6_lo1_4_scanout[8];
assign ff_l2d_decc_out_c6_hi1_4_scanin[8]=ff_l2d_decc_out_c6_hi1_2_scanout[8];
assign ff_l2d_decc_out_c6_lo0_2_scanin[9]=ff_l2d_decc_out_c6_hi1_4_scanout[8];
assign ff_l2d_decc_out_c6_lo0_4_scanin[9]=ff_l2d_decc_out_c6_lo0_2_scanout[9];
assign ff_l2d_decc_out_c6_hi0_2_scanin[9]=ff_l2d_decc_out_c6_lo0_4_scanout[9];
assign ff_l2d_decc_out_c6_hi0_4_scanin[9]=ff_l2d_decc_out_c6_hi0_2_scanout[9];
assign ff_l2d_decc_out_c6_lo1_2_scanin[9]=ff_l2d_decc_out_c6_hi0_4_scanout[9];
assign ff_l2d_decc_out_c6_lo1_4_scanin[9]=ff_l2d_decc_out_c6_lo1_2_scanout[9];
assign ff_l2d_decc_out_c6_hi1_2_scanin[9]=ff_l2d_decc_out_c6_lo1_4_scanout[9];
assign ff_l2d_decc_out_c6_hi1_4_scanin[9]=ff_l2d_decc_out_c6_hi1_2_scanout[9];
assign ff_l2d_decc_out_c6_lo0_2_scanin[10]=ff_l2d_decc_out_c6_hi1_4_scanout[9];
assign ff_l2d_decc_out_c6_lo0_4_scanin[10]=ff_l2d_decc_out_c6_lo0_2_scanout[10];
assign ff_l2d_decc_out_c6_hi0_2_scanin[10]=ff_l2d_decc_out_c6_lo0_4_scanout[10];
assign ff_l2d_decc_out_c6_hi0_4_scanin[10]=ff_l2d_decc_out_c6_hi0_2_scanout[10];
assign ff_l2d_decc_out_c6_lo1_2_scanin[10]=ff_l2d_decc_out_c6_hi0_4_scanout[10];
assign ff_l2d_decc_out_c6_lo1_4_scanin[10]=ff_l2d_decc_out_c6_lo1_2_scanout[10];
assign ff_l2d_decc_out_c6_hi1_2_scanin[10]=ff_l2d_decc_out_c6_lo1_4_scanout[10];
assign ff_l2d_decc_out_c6_hi1_4_scanin[10]=ff_l2d_decc_out_c6_hi1_2_scanout[10];
assign ff_l2d_decc_out_c6_lo0_2_scanin[11]=ff_l2d_decc_out_c6_hi1_4_scanout[10];
assign ff_l2d_decc_out_c6_lo0_4_scanin[11]=ff_l2d_decc_out_c6_lo0_2_scanout[11];
assign ff_l2d_decc_out_c6_hi0_2_scanin[11]=ff_l2d_decc_out_c6_lo0_4_scanout[11];
assign ff_l2d_decc_out_c6_hi0_4_scanin[11]=ff_l2d_decc_out_c6_hi0_2_scanout[11];
assign ff_l2d_decc_out_c6_lo1_2_scanin[11]=ff_l2d_decc_out_c6_hi0_4_scanout[11];
assign ff_l2d_decc_out_c6_lo1_4_scanin[11]=ff_l2d_decc_out_c6_lo1_2_scanout[11];
assign ff_l2d_decc_out_c6_hi1_2_scanin[11]=ff_l2d_decc_out_c6_lo1_4_scanout[11];
assign ff_l2d_decc_out_c6_hi1_4_scanin[11]=ff_l2d_decc_out_c6_hi1_2_scanout[11];
assign ff_l2d_decc_out_c6_lo0_2_scanin[12]=ff_l2d_decc_out_c6_hi1_4_scanout[11];
assign ff_l2d_decc_out_c6_lo0_4_scanin[12]=ff_l2d_decc_out_c6_lo0_2_scanout[12];
assign ff_l2d_decc_out_c6_hi0_2_scanin[12]=ff_l2d_decc_out_c6_lo0_4_scanout[12];
assign ff_l2d_decc_out_c6_hi0_4_scanin[12]=ff_l2d_decc_out_c6_hi0_2_scanout[12];
assign ff_l2d_decc_out_c6_lo1_2_scanin[12]=ff_l2d_decc_out_c6_hi0_4_scanout[12];
assign ff_l2d_decc_out_c6_lo1_4_scanin[12]=ff_l2d_decc_out_c6_lo1_2_scanout[12];
assign ff_l2d_decc_out_c6_hi1_2_scanin[12]=ff_l2d_decc_out_c6_lo1_4_scanout[12];
assign ff_l2d_decc_out_c6_hi1_4_scanin[12]=ff_l2d_decc_out_c6_hi1_2_scanout[12];
assign ff_l2d_decc_out_c6_lo0_2_scanin[13]=ff_l2d_decc_out_c6_hi1_4_scanout[12];
assign ff_l2d_decc_out_c6_lo0_4_scanin[13]=ff_l2d_decc_out_c6_lo0_2_scanout[13];
assign ff_l2d_decc_out_c6_hi0_2_scanin[13]=ff_l2d_decc_out_c6_lo0_4_scanout[13];
assign ff_l2d_decc_out_c6_hi0_4_scanin[13]=ff_l2d_decc_out_c6_hi0_2_scanout[13];
assign ff_l2d_decc_out_c6_lo1_2_scanin[13]=ff_l2d_decc_out_c6_hi0_4_scanout[13];
assign ff_l2d_decc_out_c6_lo1_4_scanin[13]=ff_l2d_decc_out_c6_lo1_2_scanout[13];
assign ff_l2d_decc_out_c6_hi1_2_scanin[13]=ff_l2d_decc_out_c6_lo1_4_scanout[13];
assign ff_l2d_decc_out_c6_hi1_4_scanin[13]=ff_l2d_decc_out_c6_hi1_2_scanout[13];
assign ff_l2d_decc_out_c6_lo0_2_scanin[14]=ff_l2d_decc_out_c6_hi1_4_scanout[13];
assign ff_l2d_decc_out_c6_lo0_4_scanin[14]=ff_l2d_decc_out_c6_lo0_2_scanout[14];
assign ff_l2d_decc_out_c6_hi0_2_scanin[14]=ff_l2d_decc_out_c6_lo0_4_scanout[14];
assign ff_l2d_decc_out_c6_hi0_4_scanin[14]=ff_l2d_decc_out_c6_hi0_2_scanout[14];
assign ff_l2d_decc_out_c6_lo1_2_scanin[14]=ff_l2d_decc_out_c6_hi0_4_scanout[14];
assign ff_l2d_decc_out_c6_lo1_4_scanin[14]=ff_l2d_decc_out_c6_lo1_2_scanout[14];
assign ff_l2d_decc_out_c6_hi1_2_scanin[14]=ff_l2d_decc_out_c6_lo1_4_scanout[14];
assign ff_l2d_decc_out_c6_hi1_4_scanin[14]=ff_l2d_decc_out_c6_hi1_2_scanout[14];
assign ff_l2d_decc_out_c6_lo0_2_scanin[15]=ff_l2d_decc_out_c6_hi1_4_scanout[14];
assign ff_l2d_decc_out_c6_lo0_4_scanin[15]=ff_l2d_decc_out_c6_lo0_2_scanout[15];
assign ff_l2d_decc_out_c6_hi0_2_scanin[15]=ff_l2d_decc_out_c6_lo0_4_scanout[15];
assign ff_l2d_decc_out_c6_hi0_4_scanin[15]=ff_l2d_decc_out_c6_hi0_2_scanout[15];
assign ff_l2d_decc_out_c6_lo1_2_scanin[15]=ff_l2d_decc_out_c6_hi0_4_scanout[15];
assign ff_l2d_decc_out_c6_lo1_4_scanin[15]=ff_l2d_decc_out_c6_lo1_2_scanout[15];
assign ff_l2d_decc_out_c6_hi1_2_scanin[15]=ff_l2d_decc_out_c6_lo1_4_scanout[15];
assign ff_l2d_decc_out_c6_hi1_4_scanin[15]=ff_l2d_decc_out_c6_hi1_2_scanout[15];
assign ff_l2d_decc_out_c6_lo0_2_scanin[16]=ff_l2d_decc_out_c6_hi1_4_scanout[15];
assign ff_l2d_decc_out_c6_lo0_4_scanin[16]=ff_l2d_decc_out_c6_lo0_2_scanout[16];
assign ff_l2d_decc_out_c6_hi0_2_scanin[16]=ff_l2d_decc_out_c6_lo0_4_scanout[16];
assign ff_l2d_decc_out_c6_hi0_4_scanin[16]=ff_l2d_decc_out_c6_hi0_2_scanout[16];
assign ff_l2d_decc_out_c6_lo1_2_scanin[16]=ff_l2d_decc_out_c6_hi0_4_scanout[16];
assign ff_l2d_decc_out_c6_lo1_4_scanin[16]=ff_l2d_decc_out_c6_lo1_2_scanout[16];
assign ff_l2d_decc_out_c6_hi1_2_scanin[16]=ff_l2d_decc_out_c6_lo1_4_scanout[16];
assign ff_l2d_decc_out_c6_hi1_4_scanin[16]=ff_l2d_decc_out_c6_hi1_2_scanout[16];
assign ff_l2d_decc_out_c6_lo0_2_scanin[17]=ff_l2d_decc_out_c6_hi1_4_scanout[16];
assign ff_l2d_decc_out_c6_lo0_4_scanin[17]=ff_l2d_decc_out_c6_lo0_2_scanout[17];
assign ff_l2d_decc_out_c6_hi0_2_scanin[17]=ff_l2d_decc_out_c6_lo0_4_scanout[17];
assign ff_l2d_decc_out_c6_hi0_4_scanin[17]=ff_l2d_decc_out_c6_hi0_2_scanout[17];
assign ff_l2d_decc_out_c6_lo1_2_scanin[17]=ff_l2d_decc_out_c6_hi0_4_scanout[17];
assign ff_l2d_decc_out_c6_lo1_4_scanin[17]=ff_l2d_decc_out_c6_lo1_2_scanout[17];
assign ff_l2d_decc_out_c6_hi1_2_scanin[17]=ff_l2d_decc_out_c6_lo1_4_scanout[17];
assign ff_l2d_decc_out_c6_hi1_4_scanin[17]=ff_l2d_decc_out_c6_hi1_2_scanout[17];
assign ff_l2d_decc_out_c6_lo0_2_scanin[18]=ff_l2d_decc_out_c6_hi1_4_scanout[17];
assign ff_l2d_decc_out_c6_lo0_4_scanin[18]=ff_l2d_decc_out_c6_lo0_2_scanout[18];
assign ff_l2d_decc_out_c6_hi0_2_scanin[18]=ff_l2d_decc_out_c6_lo0_4_scanout[18];
assign ff_l2d_decc_out_c6_hi0_4_scanin[18]=ff_l2d_decc_out_c6_hi0_2_scanout[18];
assign ff_l2d_decc_out_c6_lo1_2_scanin[18]=ff_l2d_decc_out_c6_hi0_4_scanout[18];
assign ff_l2d_decc_out_c6_lo1_4_scanin[18]=ff_l2d_decc_out_c6_lo1_2_scanout[18];
assign ff_l2d_decc_out_c6_hi1_2_scanin[18]=ff_l2d_decc_out_c6_lo1_4_scanout[18];
assign ff_l2d_decc_out_c6_hi1_4_scanin[18]=ff_l2d_decc_out_c6_hi1_2_scanout[18];
assign ff_l2d_decc_out_c6_lo0_2_scanin[19]=ff_l2d_decc_out_c6_hi1_4_scanout[18];
assign ff_l2d_decc_out_c6_lo0_4_scanin[19]=ff_l2d_decc_out_c6_lo0_2_scanout[19];
assign ff_l2d_decc_out_c6_hi0_2_scanin[19]=ff_l2d_decc_out_c6_lo0_4_scanout[19];
assign ff_l2d_decc_out_c6_hi0_4_scanin[19]=ff_l2d_decc_out_c6_hi0_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[19]=ff_l2d_decc_out_c6_hi0_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[24];
assign ff_cache_col_offset_c5_123_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[24];
assign ff_cache_col_offset_c5_123_scanin[2]=ff_cache_col_offset_c5_123_scanout[0];
assign ff_cache_col_offset_c4_123_scanin[0]=ff_cache_col_offset_c5_123_scanout[2];
assign ff_cache_col_offset_c4_123_scanin[2]=ff_cache_col_offset_c4_123_scanout[0];
assign ff_cache_col_offset_c4_tog_123_scanin[0]=ff_cache_col_offset_c4_123_scanout[2];
assign ff_cache_cache_rd_wr_c5_21_scanin=ff_cache_col_offset_c4_tog_123_scanout[0];
assign ff_cache_col_offset_c5_123_scanin[1]=ff_cache_cache_rd_wr_c5_21_scanout;
assign ff_cache_col_offset_c5_123_scanin[3]=ff_cache_col_offset_c5_123_scanout[1];
assign ff_cache_col_offset_c4_123_scanin[1]=ff_cache_col_offset_c5_123_scanout[3];
assign ff_cache_col_offset_c4_123_scanin[3]=ff_cache_col_offset_c4_123_scanout[1];
assign ff_cache_col_offset_c4_tog_123_scanin[1]=ff_cache_col_offset_c4_123_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[38]=ff_cache_col_offset_c4_tog_123_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[24];
assign ff_l2d_decc_out_c6_lo1_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[24];
assign ff_l2d_decc_out_c6_lo1_4_scanin[19]=ff_l2d_decc_out_c6_lo1_2_scanout[19];
assign ff_l2d_decc_out_c6_hi1_2_scanin[19]=ff_l2d_decc_out_c6_lo1_4_scanout[19];
assign ff_l2d_decc_out_c6_hi1_4_scanin[19]=ff_l2d_decc_out_c6_hi1_2_scanout[19];
assign ff_l2d_decc_out_c6_lo0_2_scanin[20]=ff_l2d_decc_out_c6_hi1_4_scanout[19];
assign ff_l2d_decc_out_c6_lo0_4_scanin[20]=ff_l2d_decc_out_c6_lo0_2_scanout[20];
assign ff_l2d_decc_out_c6_hi0_2_scanin[20]=ff_l2d_decc_out_c6_lo0_4_scanout[20];
assign ff_l2d_decc_out_c6_hi0_4_scanin[20]=ff_l2d_decc_out_c6_hi0_2_scanout[20];
assign ff_l2d_decc_out_c6_lo1_2_scanin[20]=ff_l2d_decc_out_c6_hi0_4_scanout[20];
assign ff_l2d_decc_out_c6_lo1_4_scanin[20]=ff_l2d_decc_out_c6_lo1_2_scanout[20];
assign ff_l2d_decc_out_c6_hi1_2_scanin[20]=ff_l2d_decc_out_c6_lo1_4_scanout[20];
assign ff_l2d_decc_out_c6_hi1_4_scanin[20]=ff_l2d_decc_out_c6_hi1_2_scanout[20];
assign ff_l2d_decc_out_c6_lo0_2_scanin[21]=ff_l2d_decc_out_c6_hi1_4_scanout[20];
assign ff_l2d_decc_out_c6_lo0_4_scanin[21]=ff_l2d_decc_out_c6_lo0_2_scanout[21];
assign ff_l2d_decc_out_c6_hi0_2_scanin[21]=ff_l2d_decc_out_c6_lo0_4_scanout[21];
assign ff_l2d_decc_out_c6_hi0_4_scanin[21]=ff_l2d_decc_out_c6_hi0_2_scanout[21];
assign ff_l2d_decc_out_c6_lo1_2_scanin[21]=ff_l2d_decc_out_c6_hi0_4_scanout[21];
assign ff_l2d_decc_out_c6_lo1_4_scanin[21]=ff_l2d_decc_out_c6_lo1_2_scanout[21];
assign ff_l2d_decc_out_c6_hi1_2_scanin[21]=ff_l2d_decc_out_c6_lo1_4_scanout[21];
assign ff_l2d_decc_out_c6_hi1_4_scanin[21]=ff_l2d_decc_out_c6_hi1_2_scanout[21];
assign ff_l2d_decc_out_c6_lo0_2_scanin[22]=ff_l2d_decc_out_c6_hi1_4_scanout[21];
assign ff_l2d_decc_out_c6_lo0_4_scanin[22]=ff_l2d_decc_out_c6_lo0_2_scanout[22];
assign ff_l2d_decc_out_c6_hi0_2_scanin[22]=ff_l2d_decc_out_c6_lo0_4_scanout[22];
assign ff_l2d_decc_out_c6_hi0_4_scanin[22]=ff_l2d_decc_out_c6_hi0_2_scanout[22];
assign ff_l2d_decc_out_c6_lo1_2_scanin[22]=ff_l2d_decc_out_c6_hi0_4_scanout[22];
assign ff_l2d_decc_out_c6_lo1_4_scanin[22]=ff_l2d_decc_out_c6_lo1_2_scanout[22];
assign ff_l2d_decc_out_c6_hi1_2_scanin[22]=ff_l2d_decc_out_c6_lo1_4_scanout[22];
assign ff_l2d_decc_out_c6_hi1_4_scanin[22]=ff_l2d_decc_out_c6_hi1_2_scanout[22];
assign ff_l2d_decc_out_c6_lo0_2_scanin[23]=ff_l2d_decc_out_c6_hi1_4_scanout[22];
assign ff_l2d_decc_out_c6_lo0_4_scanin[23]=ff_l2d_decc_out_c6_lo0_2_scanout[23];
assign ff_l2d_decc_out_c6_hi0_2_scanin[23]=ff_l2d_decc_out_c6_lo0_4_scanout[23];
assign ff_l2d_decc_out_c6_hi0_4_scanin[23]=ff_l2d_decc_out_c6_hi0_2_scanout[23];
assign ff_l2d_decc_out_c6_lo1_2_scanin[23]=ff_l2d_decc_out_c6_hi0_4_scanout[23];
assign ff_l2d_decc_out_c6_lo1_4_scanin[23]=ff_l2d_decc_out_c6_lo1_2_scanout[23];
assign ff_l2d_decc_out_c6_hi1_2_scanin[23]=ff_l2d_decc_out_c6_lo1_4_scanout[23];
assign ff_l2d_decc_out_c6_hi1_4_scanin[23]=ff_l2d_decc_out_c6_hi1_2_scanout[23];
assign ff_l2d_decc_out_c6_lo0_2_scanin[24]=ff_l2d_decc_out_c6_hi1_4_scanout[23];
assign ff_l2d_decc_out_c6_lo0_4_scanin[24]=ff_l2d_decc_out_c6_lo0_2_scanout[24];
assign ff_l2d_decc_out_c6_hi0_2_scanin[24]=ff_l2d_decc_out_c6_lo0_4_scanout[24];
assign ff_l2d_decc_out_c6_hi0_4_scanin[24]=ff_l2d_decc_out_c6_hi0_2_scanout[24];
assign ff_l2d_decc_out_c6_lo1_2_scanin[24]=ff_l2d_decc_out_c6_hi0_4_scanout[24];
assign ff_l2d_decc_out_c6_lo1_4_scanin[24]=ff_l2d_decc_out_c6_lo1_2_scanout[24];
assign ff_l2d_decc_out_c6_hi1_2_scanin[24]=ff_l2d_decc_out_c6_lo1_4_scanout[24];
assign ff_l2d_decc_out_c6_hi1_4_scanin[24]=ff_l2d_decc_out_c6_hi1_2_scanout[24];
assign ff_l2d_decc_out_c6_lo0_2_scanin[25]=ff_l2d_decc_out_c6_hi1_4_scanout[24];
assign ff_l2d_decc_out_c6_lo0_4_scanin[25]=ff_l2d_decc_out_c6_lo0_2_scanout[25];
assign ff_l2d_decc_out_c6_hi0_2_scanin[25]=ff_l2d_decc_out_c6_lo0_4_scanout[25];
assign ff_l2d_decc_out_c6_hi0_4_scanin[25]=ff_l2d_decc_out_c6_hi0_2_scanout[25];
assign ff_l2d_decc_out_c6_lo1_2_scanin[25]=ff_l2d_decc_out_c6_hi0_4_scanout[25];
assign ff_l2d_decc_out_c6_lo1_4_scanin[25]=ff_l2d_decc_out_c6_lo1_2_scanout[25];
assign ff_l2d_decc_out_c6_hi1_2_scanin[25]=ff_l2d_decc_out_c6_lo1_4_scanout[25];
assign ff_l2d_decc_out_c6_hi1_4_scanin[25]=ff_l2d_decc_out_c6_hi1_2_scanout[25];
assign ff_l2d_decc_out_c6_lo0_2_scanin[26]=ff_l2d_decc_out_c6_hi1_4_scanout[25];
assign ff_l2d_decc_out_c6_lo0_4_scanin[26]=ff_l2d_decc_out_c6_lo0_2_scanout[26];
assign ff_l2d_decc_out_c6_hi0_2_scanin[26]=ff_l2d_decc_out_c6_lo0_4_scanout[26];
assign ff_l2d_decc_out_c6_hi0_4_scanin[26]=ff_l2d_decc_out_c6_hi0_2_scanout[26];
assign ff_l2d_decc_out_c6_lo1_2_scanin[26]=ff_l2d_decc_out_c6_hi0_4_scanout[26];
assign ff_l2d_decc_out_c6_lo1_4_scanin[26]=ff_l2d_decc_out_c6_lo1_2_scanout[26];
assign ff_l2d_decc_out_c6_hi1_2_scanin[26]=ff_l2d_decc_out_c6_lo1_4_scanout[26];
assign ff_l2d_decc_out_c6_hi1_4_scanin[26]=ff_l2d_decc_out_c6_hi1_2_scanout[26];
assign ff_l2d_decc_out_c6_lo0_2_scanin[27]=ff_l2d_decc_out_c6_hi1_4_scanout[26];
assign ff_l2d_decc_out_c6_lo0_4_scanin[27]=ff_l2d_decc_out_c6_lo0_2_scanout[27];
assign ff_l2d_decc_out_c6_hi0_2_scanin[27]=ff_l2d_decc_out_c6_lo0_4_scanout[27];
assign ff_l2d_decc_out_c6_hi0_4_scanin[27]=ff_l2d_decc_out_c6_hi0_2_scanout[27];
assign ff_l2d_decc_out_c6_lo1_2_scanin[27]=ff_l2d_decc_out_c6_hi0_4_scanout[27];
assign ff_l2d_decc_out_c6_lo1_4_scanin[27]=ff_l2d_decc_out_c6_lo1_2_scanout[27];
assign ff_l2d_decc_out_c6_hi1_2_scanin[27]=ff_l2d_decc_out_c6_lo1_4_scanout[27];
assign ff_l2d_decc_out_c6_hi1_4_scanin[27]=ff_l2d_decc_out_c6_hi1_2_scanout[27];
assign ff_l2d_decc_out_c6_lo0_2_scanin[28]=ff_l2d_decc_out_c6_hi1_4_scanout[27];
assign ff_l2d_decc_out_c6_lo0_4_scanin[28]=ff_l2d_decc_out_c6_lo0_2_scanout[28];
assign ff_l2d_decc_out_c6_hi0_2_scanin[28]=ff_l2d_decc_out_c6_lo0_4_scanout[28];
assign ff_l2d_decc_out_c6_hi0_4_scanin[28]=ff_l2d_decc_out_c6_hi0_2_scanout[28];
assign ff_l2d_decc_out_c6_lo1_2_scanin[28]=ff_l2d_decc_out_c6_hi0_4_scanout[28];
assign ff_l2d_decc_out_c6_lo1_4_scanin[28]=ff_l2d_decc_out_c6_lo1_2_scanout[28];
assign ff_l2d_decc_out_c6_hi1_2_scanin[28]=ff_l2d_decc_out_c6_lo1_4_scanout[28];
assign ff_l2d_decc_out_c6_hi1_4_scanin[28]=ff_l2d_decc_out_c6_hi1_2_scanout[28];
assign ff_l2d_decc_out_c6_lo0_2_scanin[29]=ff_l2d_decc_out_c6_hi1_4_scanout[28];
assign ff_l2d_decc_out_c6_lo0_4_scanin[29]=ff_l2d_decc_out_c6_lo0_2_scanout[29];
assign ff_l2d_decc_out_c6_hi0_2_scanin[29]=ff_l2d_decc_out_c6_lo0_4_scanout[29];
assign ff_l2d_decc_out_c6_hi0_4_scanin[29]=ff_l2d_decc_out_c6_hi0_2_scanout[29];
assign ff_l2d_decc_out_c6_lo1_2_scanin[29]=ff_l2d_decc_out_c6_hi0_4_scanout[29];
assign ff_l2d_decc_out_c6_lo1_4_scanin[29]=ff_l2d_decc_out_c6_lo1_2_scanout[29];
assign ff_l2d_decc_out_c6_hi1_2_scanin[29]=ff_l2d_decc_out_c6_lo1_4_scanout[29];
assign ff_l2d_decc_out_c6_hi1_4_scanin[29]=ff_l2d_decc_out_c6_hi1_2_scanout[29];
assign ff_l2d_decc_out_c6_lo0_2_scanin[30]=ff_l2d_decc_out_c6_hi1_4_scanout[29];
assign ff_l2d_decc_out_c6_lo0_4_scanin[30]=ff_l2d_decc_out_c6_lo0_2_scanout[30];
assign ff_l2d_decc_out_c6_hi0_2_scanin[30]=ff_l2d_decc_out_c6_lo0_4_scanout[30];
assign ff_l2d_decc_out_c6_hi0_4_scanin[30]=ff_l2d_decc_out_c6_hi0_2_scanout[30];
assign ff_l2d_decc_out_c6_lo1_2_scanin[30]=ff_l2d_decc_out_c6_hi0_4_scanout[30];
assign ff_l2d_decc_out_c6_lo1_4_scanin[30]=ff_l2d_decc_out_c6_lo1_2_scanout[30];
assign ff_l2d_decc_out_c6_hi1_2_scanin[30]=ff_l2d_decc_out_c6_lo1_4_scanout[30];
assign ff_l2d_decc_out_c6_hi1_4_scanin[30]=ff_l2d_decc_out_c6_hi1_2_scanout[30];
assign ff_l2d_decc_out_c6_lo0_2_scanin[31]=ff_l2d_decc_out_c6_hi1_4_scanout[30];
assign ff_l2d_decc_out_c6_lo0_4_scanin[31]=ff_l2d_decc_out_c6_lo0_2_scanout[31];
assign ff_l2d_decc_out_c6_hi0_2_scanin[31]=ff_l2d_decc_out_c6_lo0_4_scanout[31];
assign ff_l2d_decc_out_c6_hi0_4_scanin[31]=ff_l2d_decc_out_c6_hi0_2_scanout[31];
assign ff_l2d_decc_out_c6_lo1_2_scanin[31]=ff_l2d_decc_out_c6_hi0_4_scanout[31];
assign ff_l2d_decc_out_c6_lo1_4_scanin[31]=ff_l2d_decc_out_c6_lo1_2_scanout[31];
assign ff_l2d_decc_out_c6_hi1_2_scanin[31]=ff_l2d_decc_out_c6_lo1_4_scanout[31];
assign ff_l2d_decc_out_c6_hi1_4_scanin[31]=ff_l2d_decc_out_c6_hi1_2_scanout[31];
assign ff_l2d_decc_out_c6_lo0_2_scanin[32]=ff_l2d_decc_out_c6_hi1_4_scanout[31];
assign ff_l2d_decc_out_c6_lo0_4_scanin[32]=ff_l2d_decc_out_c6_lo0_2_scanout[32];
assign ff_l2d_decc_out_c6_hi0_2_scanin[32]=ff_l2d_decc_out_c6_lo0_4_scanout[32];
assign ff_l2d_decc_out_c6_hi0_4_scanin[32]=ff_l2d_decc_out_c6_hi0_2_scanout[32];
assign ff_l2d_decc_out_c6_lo1_2_scanin[32]=ff_l2d_decc_out_c6_hi0_4_scanout[32];
assign ff_l2d_decc_out_c6_lo1_4_scanin[32]=ff_l2d_decc_out_c6_lo1_2_scanout[32];
assign ff_l2d_decc_out_c6_hi1_2_scanin[32]=ff_l2d_decc_out_c6_lo1_4_scanout[32];
assign ff_l2d_decc_out_c6_hi1_4_scanin[32]=ff_l2d_decc_out_c6_hi1_2_scanout[32];
assign ff_l2d_decc_out_c6_lo0_2_scanin[33]=ff_l2d_decc_out_c6_hi1_4_scanout[32];
assign ff_l2d_decc_out_c6_lo0_4_scanin[33]=ff_l2d_decc_out_c6_lo0_2_scanout[33];
assign ff_l2d_decc_out_c6_hi0_2_scanin[33]=ff_l2d_decc_out_c6_lo0_4_scanout[33];
assign ff_l2d_decc_out_c6_hi0_4_scanin[33]=ff_l2d_decc_out_c6_hi0_2_scanout[33];
assign ff_l2d_decc_out_c6_lo1_2_scanin[33]=ff_l2d_decc_out_c6_hi0_4_scanout[33];
assign ff_l2d_decc_out_c6_lo1_4_scanin[33]=ff_l2d_decc_out_c6_lo1_2_scanout[33];
assign ff_l2d_decc_out_c6_hi1_2_scanin[33]=ff_l2d_decc_out_c6_lo1_4_scanout[33];
assign ff_l2d_decc_out_c6_hi1_4_scanin[33]=ff_l2d_decc_out_c6_hi1_2_scanout[33];
assign ff_l2d_decc_out_c6_lo0_2_scanin[34]=ff_l2d_decc_out_c6_hi1_4_scanout[33];
assign ff_l2d_decc_out_c6_lo0_4_scanin[34]=ff_l2d_decc_out_c6_lo0_2_scanout[34];
assign ff_l2d_decc_out_c6_hi0_2_scanin[34]=ff_l2d_decc_out_c6_lo0_4_scanout[34];
assign ff_l2d_decc_out_c6_hi0_4_scanin[34]=ff_l2d_decc_out_c6_hi0_2_scanout[34];
assign ff_l2d_decc_out_c6_lo1_2_scanin[34]=ff_l2d_decc_out_c6_hi0_4_scanout[34];
assign ff_l2d_decc_out_c6_lo1_4_scanin[34]=ff_l2d_decc_out_c6_lo1_2_scanout[34];
assign ff_l2d_decc_out_c6_hi1_2_scanin[34]=ff_l2d_decc_out_c6_lo1_4_scanout[34];
assign ff_l2d_decc_out_c6_hi1_4_scanin[34]=ff_l2d_decc_out_c6_hi1_2_scanout[34];
assign ff_l2d_decc_out_c6_lo0_2_scanin[35]=ff_l2d_decc_out_c6_hi1_4_scanout[34];
assign ff_l2d_decc_out_c6_lo0_4_scanin[35]=ff_l2d_decc_out_c6_lo0_2_scanout[35];
assign ff_l2d_decc_out_c6_hi0_2_scanin[35]=ff_l2d_decc_out_c6_lo0_4_scanout[35];
assign ff_l2d_decc_out_c6_hi0_4_scanin[35]=ff_l2d_decc_out_c6_hi0_2_scanout[35];
assign ff_l2d_decc_out_c6_lo1_2_scanin[35]=ff_l2d_decc_out_c6_hi0_4_scanout[35];
assign ff_l2d_decc_out_c6_lo1_4_scanin[35]=ff_l2d_decc_out_c6_lo1_2_scanout[35];
assign ff_l2d_decc_out_c6_hi1_2_scanin[35]=ff_l2d_decc_out_c6_lo1_4_scanout[35];
assign ff_l2d_decc_out_c6_hi1_4_scanin[35]=ff_l2d_decc_out_c6_hi1_2_scanout[35];
assign ff_l2d_decc_out_c6_lo0_2_scanin[36]=ff_l2d_decc_out_c6_hi1_4_scanout[35];
assign ff_l2d_decc_out_c6_lo0_4_scanin[36]=ff_l2d_decc_out_c6_lo0_2_scanout[36];
assign ff_l2d_decc_out_c6_hi0_2_scanin[36]=ff_l2d_decc_out_c6_lo0_4_scanout[36];
assign ff_l2d_decc_out_c6_hi0_4_scanin[36]=ff_l2d_decc_out_c6_hi0_2_scanout[36];
assign ff_l2d_decc_out_c6_lo1_2_scanin[36]=ff_l2d_decc_out_c6_hi0_4_scanout[36];
assign ff_l2d_decc_out_c6_lo1_4_scanin[36]=ff_l2d_decc_out_c6_lo1_2_scanout[36];
assign ff_l2d_decc_out_c6_hi1_2_scanin[36]=ff_l2d_decc_out_c6_lo1_4_scanout[36];
assign ff_l2d_decc_out_c6_hi1_4_scanin[36]=ff_l2d_decc_out_c6_hi1_2_scanout[36];
assign ff_l2d_decc_out_c6_lo0_2_scanin[37]=ff_l2d_decc_out_c6_hi1_4_scanout[36];
assign ff_l2d_decc_out_c6_lo0_4_scanin[37]=ff_l2d_decc_out_c6_lo0_2_scanout[37];
assign ff_l2d_decc_out_c6_hi0_2_scanin[37]=ff_l2d_decc_out_c6_lo0_4_scanout[37];
assign ff_l2d_decc_out_c6_hi0_4_scanin[37]=ff_l2d_decc_out_c6_hi0_2_scanout[37];
assign ff_l2d_decc_out_c6_lo1_2_scanin[37]=ff_l2d_decc_out_c6_hi0_4_scanout[37];
assign ff_l2d_decc_out_c6_lo1_4_scanin[37]=ff_l2d_decc_out_c6_lo1_2_scanout[37];
assign ff_l2d_decc_out_c6_hi1_2_scanin[37]=ff_l2d_decc_out_c6_lo1_4_scanout[37];
assign ff_l2d_decc_out_c6_hi1_4_scanin[37]=ff_l2d_decc_out_c6_hi1_2_scanout[37];
assign ff_l2d_decc_out_c6_lo0_2_scanin[38]=ff_l2d_decc_out_c6_hi1_4_scanout[37];
assign ff_l2d_decc_out_c6_lo0_4_scanin[38]=ff_l2d_decc_out_c6_lo0_2_scanout[38];
assign ff_l2d_decc_out_c6_hi0_2_scanin[38]=ff_l2d_decc_out_c6_lo0_4_scanout[38];
assign ff_l2d_decc_out_c6_hi0_4_scanin[38]=ff_l2d_decc_out_c6_hi0_2_scanout[38];
assign ff_l2d_decc_out_c6_lo1_2_scanin[38]=ff_l2d_decc_out_c6_hi0_4_scanout[38];
assign ff_l2d_decc_out_c6_lo1_4_scanin[38]=ff_l2d_decc_out_c6_lo1_2_scanout[38];
assign ff_l2d_decc_out_c6_hi1_2_scanin[38]=ff_l2d_decc_out_c6_lo1_4_scanout[38];
assign ff_l2d_decc_out_c6_hi1_4_scanin[38]=ff_l2d_decc_out_c6_hi1_2_scanout[38];
assign  so_q23=ff_l2d_decc_out_c6_hi1_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[19]=so_tstmod;
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[24];
assign ff_cache_col_offset_c5_101_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[24];
assign ff_cache_col_offset_c5_101_scanin[2]=ff_cache_col_offset_c5_101_scanout[0];
assign ff_cache_col_offset_c4_101_scanin[0]=ff_cache_col_offset_c5_101_scanout[2];
assign ff_cache_col_offset_c4_101_scanin[2]=ff_cache_col_offset_c4_101_scanout[0];
assign ff_cache_col_offset_c4_tog_101_scanin[0]=ff_cache_col_offset_c4_101_scanout[2];
assign ff_cache_cache_rd_wr_c5_01_scanin=ff_cache_col_offset_c4_tog_101_scanout[0];
assign ff_cache_col_offset_c5_101_scanin[1]=ff_cache_cache_rd_wr_c5_01_scanout;
assign ff_cache_col_offset_c5_101_scanin[3]=ff_cache_col_offset_c5_101_scanout[1];
assign ff_cache_col_offset_c4_101_scanin[1]=ff_cache_col_offset_c5_101_scanout[3];
assign ff_cache_col_offset_c4_101_scanin[3]=ff_cache_col_offset_c4_101_scanout[1];
assign ff_cache_col_offset_c4_tog_101_scanin[1]=ff_cache_col_offset_c4_101_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[38]=ff_cache_col_offset_c4_tog_101_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[33];
assign ff_l2t_l2d_stdecc_c3_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[34];
assign ff_l2t_l2d_stdecc_c3_scanin[1]=ff_l2t_l2d_stdecc_c3_scanout[0];
assign ff_l2t_l2d_stdecc_c3_scanin[2]=ff_l2t_l2d_stdecc_c3_scanout[1];
assign ff_l2t_l2d_stdecc_c3_scanin[3]=ff_l2t_l2d_stdecc_c3_scanout[2];
assign ff_l2t_l2d_stdecc_c3_scanin[4]=ff_l2t_l2d_stdecc_c3_scanout[3];
assign ff_l2t_l2d_stdecc_c3_scanin[5]=ff_l2t_l2d_stdecc_c3_scanout[4];
assign ff_l2t_l2d_stdecc_c3_scanin[6]=ff_l2t_l2d_stdecc_c3_scanout[5];
assign ff_l2t_l2d_stdecc_c3_scanin[7]=ff_l2t_l2d_stdecc_c3_scanout[6];
assign ff_l2t_l2d_stdecc_c3_scanin[8]=ff_l2t_l2d_stdecc_c3_scanout[7];
assign ff_l2t_l2d_stdecc_c3_scanin[9]=ff_l2t_l2d_stdecc_c3_scanout[8];
assign ff_l2t_l2d_stdecc_c3_scanin[10]=ff_l2t_l2d_stdecc_c3_scanout[9];
assign ff_l2t_l2d_stdecc_c3_scanin[11]=ff_l2t_l2d_stdecc_c3_scanout[10];
assign ff_l2t_l2d_stdecc_c3_scanin[12]=ff_l2t_l2d_stdecc_c3_scanout[11];
assign ff_l2t_l2d_stdecc_c3_scanin[13]=ff_l2t_l2d_stdecc_c3_scanout[12];
assign ff_l2t_l2d_stdecc_c3_scanin[14]=ff_l2t_l2d_stdecc_c3_scanout[13];
assign ff_l2t_l2d_stdecc_c3_scanin[15]=ff_l2t_l2d_stdecc_c3_scanout[14];
assign ff_l2t_l2d_stdecc_c3_scanin[16]=ff_l2t_l2d_stdecc_c3_scanout[15];
assign ff_l2t_l2d_stdecc_c3_scanin[17]=ff_l2t_l2d_stdecc_c3_scanout[16];
assign ff_l2t_l2d_stdecc_c3_scanin[18]=ff_l2t_l2d_stdecc_c3_scanout[17];
assign ff_l2t_l2d_stdecc_c3_scanin[19]=ff_l2t_l2d_stdecc_c3_scanout[18];
assign ff_l2t_l2d_stdecc_c3_scanin[20]=ff_l2t_l2d_stdecc_c3_scanout[19];
assign ff_l2t_l2d_stdecc_c3_scanin[21]=ff_l2t_l2d_stdecc_c3_scanout[20];
assign ff_l2t_l2d_stdecc_c3_scanin[22]=ff_l2t_l2d_stdecc_c3_scanout[21];
assign ff_l2t_l2d_stdecc_c3_scanin[23]=ff_l2t_l2d_stdecc_c3_scanout[22];
assign ff_l2t_l2d_stdecc_c3_scanin[24]=ff_l2t_l2d_stdecc_c3_scanout[23];
assign ff_l2t_l2d_stdecc_c3_scanin[25]=ff_l2t_l2d_stdecc_c3_scanout[24];
assign ff_l2t_l2d_stdecc_c3_scanin[26]=ff_l2t_l2d_stdecc_c3_scanout[25];
assign ff_l2t_l2d_stdecc_c3_scanin[27]=ff_l2t_l2d_stdecc_c3_scanout[26];
assign ff_l2t_l2d_stdecc_c3_scanin[28]=ff_l2t_l2d_stdecc_c3_scanout[27];
assign ff_l2t_l2d_stdecc_c3_scanin[29]=ff_l2t_l2d_stdecc_c3_scanout[28];
assign ff_l2t_l2d_stdecc_c3_scanin[30]=ff_l2t_l2d_stdecc_c3_scanout[29];
assign ff_l2t_l2d_stdecc_c3_scanin[31]=ff_l2t_l2d_stdecc_c3_scanout[30];
assign ff_l2t_l2d_stdecc_c3_scanin[32]=ff_l2t_l2d_stdecc_c3_scanout[31];
assign ff_l2t_l2d_stdecc_c3_scanin[33]=ff_l2t_l2d_stdecc_c3_scanout[32];
assign ff_l2t_l2d_stdecc_c3_scanin[34]=ff_l2t_l2d_stdecc_c3_scanout[33];
assign ff_l2t_l2d_stdecc_c3_scanin[35]=ff_l2t_l2d_stdecc_c3_scanout[34];
assign ff_l2t_l2d_stdecc_c3_scanin[36]=ff_l2t_l2d_stdecc_c3_scanout[35];
assign ff_l2t_l2d_stdecc_c3_scanin[37]=ff_l2t_l2d_stdecc_c3_scanout[36];
assign ff_l2t_l2d_stdecc_c3_scanin[38]=ff_l2t_l2d_stdecc_c3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[38]=ff_l2t_l2d_stdecc_c3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[24];
assign ff_l2d_decc_out_c6_lo1_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[24];
assign ff_l2d_decc_out_c6_lo1_3_scanin[19]=ff_l2d_decc_out_c6_lo1_1_scanout[19];
assign ff_l2d_decc_out_c6_hi1_1_scanin[19]=ff_l2d_decc_out_c6_lo1_3_scanout[19];
assign ff_l2d_decc_out_c6_hi1_3_scanin[19]=ff_l2d_decc_out_c6_hi1_1_scanout[19];
assign ff_l2d_decc_out_c6_lo0_1_scanin[20]=ff_l2d_decc_out_c6_hi1_3_scanout[19];
assign ff_l2d_decc_out_c6_lo0_3_scanin[20]=ff_l2d_decc_out_c6_lo0_1_scanout[20];
assign ff_l2d_decc_out_c6_hi0_1_scanin[20]=ff_l2d_decc_out_c6_lo0_3_scanout[20];
assign ff_l2d_decc_out_c6_hi0_3_scanin[20]=ff_l2d_decc_out_c6_hi0_1_scanout[20];
assign ff_l2d_decc_out_c6_lo1_1_scanin[20]=ff_l2d_decc_out_c6_hi0_3_scanout[20];
assign ff_l2d_decc_out_c6_lo1_3_scanin[20]=ff_l2d_decc_out_c6_lo1_1_scanout[20];
assign ff_l2d_decc_out_c6_hi1_1_scanin[20]=ff_l2d_decc_out_c6_lo1_3_scanout[20];
assign ff_l2d_decc_out_c6_hi1_3_scanin[20]=ff_l2d_decc_out_c6_hi1_1_scanout[20];
assign ff_l2d_decc_out_c6_lo0_1_scanin[21]=ff_l2d_decc_out_c6_hi1_3_scanout[20];
assign ff_l2d_decc_out_c6_lo0_3_scanin[21]=ff_l2d_decc_out_c6_lo0_1_scanout[21];
assign ff_l2d_decc_out_c6_hi0_1_scanin[21]=ff_l2d_decc_out_c6_lo0_3_scanout[21];
assign ff_l2d_decc_out_c6_hi0_3_scanin[21]=ff_l2d_decc_out_c6_hi0_1_scanout[21];
assign ff_l2d_decc_out_c6_lo1_1_scanin[21]=ff_l2d_decc_out_c6_hi0_3_scanout[21];
assign ff_l2d_decc_out_c6_lo1_3_scanin[21]=ff_l2d_decc_out_c6_lo1_1_scanout[21];
assign ff_l2d_decc_out_c6_hi1_1_scanin[21]=ff_l2d_decc_out_c6_lo1_3_scanout[21];
assign ff_l2d_decc_out_c6_hi1_3_scanin[21]=ff_l2d_decc_out_c6_hi1_1_scanout[21];
assign ff_l2d_decc_out_c6_lo0_1_scanin[22]=ff_l2d_decc_out_c6_hi1_3_scanout[21];
assign ff_l2d_decc_out_c6_lo0_3_scanin[22]=ff_l2d_decc_out_c6_lo0_1_scanout[22];
assign ff_l2d_decc_out_c6_hi0_1_scanin[22]=ff_l2d_decc_out_c6_lo0_3_scanout[22];
assign ff_l2d_decc_out_c6_hi0_3_scanin[22]=ff_l2d_decc_out_c6_hi0_1_scanout[22];
assign ff_l2d_decc_out_c6_lo1_1_scanin[22]=ff_l2d_decc_out_c6_hi0_3_scanout[22];
assign ff_l2d_decc_out_c6_lo1_3_scanin[22]=ff_l2d_decc_out_c6_lo1_1_scanout[22];
assign ff_l2d_decc_out_c6_hi1_1_scanin[22]=ff_l2d_decc_out_c6_lo1_3_scanout[22];
assign ff_l2d_decc_out_c6_hi1_3_scanin[22]=ff_l2d_decc_out_c6_hi1_1_scanout[22];
assign ff_l2d_decc_out_c6_lo0_1_scanin[23]=ff_l2d_decc_out_c6_hi1_3_scanout[22];
assign ff_l2d_decc_out_c6_lo0_3_scanin[23]=ff_l2d_decc_out_c6_lo0_1_scanout[23];
assign ff_l2d_decc_out_c6_hi0_1_scanin[23]=ff_l2d_decc_out_c6_lo0_3_scanout[23];
assign ff_l2d_decc_out_c6_hi0_3_scanin[23]=ff_l2d_decc_out_c6_hi0_1_scanout[23];
assign ff_l2d_decc_out_c6_lo1_1_scanin[23]=ff_l2d_decc_out_c6_hi0_3_scanout[23];
assign ff_l2d_decc_out_c6_lo1_3_scanin[23]=ff_l2d_decc_out_c6_lo1_1_scanout[23];
assign ff_l2d_decc_out_c6_hi1_1_scanin[23]=ff_l2d_decc_out_c6_lo1_3_scanout[23];
assign ff_l2d_decc_out_c6_hi1_3_scanin[23]=ff_l2d_decc_out_c6_hi1_1_scanout[23];
assign ff_l2d_decc_out_c6_lo0_1_scanin[24]=ff_l2d_decc_out_c6_hi1_3_scanout[23];
assign ff_l2d_decc_out_c6_lo0_3_scanin[24]=ff_l2d_decc_out_c6_lo0_1_scanout[24];
assign ff_l2d_decc_out_c6_hi0_1_scanin[24]=ff_l2d_decc_out_c6_lo0_3_scanout[24];
assign ff_l2d_decc_out_c6_hi0_3_scanin[24]=ff_l2d_decc_out_c6_hi0_1_scanout[24];
assign ff_l2d_decc_out_c6_lo1_1_scanin[24]=ff_l2d_decc_out_c6_hi0_3_scanout[24];
assign ff_l2d_decc_out_c6_lo1_3_scanin[24]=ff_l2d_decc_out_c6_lo1_1_scanout[24];
assign ff_l2d_decc_out_c6_hi1_1_scanin[24]=ff_l2d_decc_out_c6_lo1_3_scanout[24];
assign ff_l2d_decc_out_c6_hi1_3_scanin[24]=ff_l2d_decc_out_c6_hi1_1_scanout[24];
assign ff_l2d_decc_out_c6_lo0_1_scanin[25]=ff_l2d_decc_out_c6_hi1_3_scanout[24];
assign ff_l2d_decc_out_c6_lo0_3_scanin[25]=ff_l2d_decc_out_c6_lo0_1_scanout[25];
assign ff_l2d_decc_out_c6_hi0_1_scanin[25]=ff_l2d_decc_out_c6_lo0_3_scanout[25];
assign ff_l2d_decc_out_c6_hi0_3_scanin[25]=ff_l2d_decc_out_c6_hi0_1_scanout[25];
assign ff_l2d_decc_out_c6_lo1_1_scanin[25]=ff_l2d_decc_out_c6_hi0_3_scanout[25];
assign ff_l2d_decc_out_c6_lo1_3_scanin[25]=ff_l2d_decc_out_c6_lo1_1_scanout[25];
assign ff_l2d_decc_out_c6_hi1_1_scanin[25]=ff_l2d_decc_out_c6_lo1_3_scanout[25];
assign ff_l2d_decc_out_c6_hi1_3_scanin[25]=ff_l2d_decc_out_c6_hi1_1_scanout[25];
assign ff_l2d_decc_out_c6_lo0_1_scanin[26]=ff_l2d_decc_out_c6_hi1_3_scanout[25];
assign ff_l2d_decc_out_c6_lo0_3_scanin[26]=ff_l2d_decc_out_c6_lo0_1_scanout[26];
assign ff_l2d_decc_out_c6_hi0_1_scanin[26]=ff_l2d_decc_out_c6_lo0_3_scanout[26];
assign ff_l2d_decc_out_c6_hi0_3_scanin[26]=ff_l2d_decc_out_c6_hi0_1_scanout[26];
assign ff_l2d_decc_out_c6_lo1_1_scanin[26]=ff_l2d_decc_out_c6_hi0_3_scanout[26];
assign ff_l2d_decc_out_c6_lo1_3_scanin[26]=ff_l2d_decc_out_c6_lo1_1_scanout[26];
assign ff_l2d_decc_out_c6_hi1_1_scanin[26]=ff_l2d_decc_out_c6_lo1_3_scanout[26];
assign ff_l2d_decc_out_c6_hi1_3_scanin[26]=ff_l2d_decc_out_c6_hi1_1_scanout[26];
assign ff_l2d_decc_out_c6_lo0_1_scanin[27]=ff_l2d_decc_out_c6_hi1_3_scanout[26];
assign ff_l2d_decc_out_c6_lo0_3_scanin[27]=ff_l2d_decc_out_c6_lo0_1_scanout[27];
assign ff_l2d_decc_out_c6_hi0_1_scanin[27]=ff_l2d_decc_out_c6_lo0_3_scanout[27];
assign ff_l2d_decc_out_c6_hi0_3_scanin[27]=ff_l2d_decc_out_c6_hi0_1_scanout[27];
assign ff_l2d_decc_out_c6_lo1_1_scanin[27]=ff_l2d_decc_out_c6_hi0_3_scanout[27];
assign ff_l2d_decc_out_c6_lo1_3_scanin[27]=ff_l2d_decc_out_c6_lo1_1_scanout[27];
assign ff_l2d_decc_out_c6_hi1_1_scanin[27]=ff_l2d_decc_out_c6_lo1_3_scanout[27];
assign ff_l2d_decc_out_c6_hi1_3_scanin[27]=ff_l2d_decc_out_c6_hi1_1_scanout[27];
assign ff_l2d_decc_out_c6_lo0_1_scanin[28]=ff_l2d_decc_out_c6_hi1_3_scanout[27];
assign ff_l2d_decc_out_c6_lo0_3_scanin[28]=ff_l2d_decc_out_c6_lo0_1_scanout[28];
assign ff_l2d_decc_out_c6_hi0_1_scanin[28]=ff_l2d_decc_out_c6_lo0_3_scanout[28];
assign ff_l2d_decc_out_c6_hi0_3_scanin[28]=ff_l2d_decc_out_c6_hi0_1_scanout[28];
assign ff_l2d_decc_out_c6_lo1_1_scanin[28]=ff_l2d_decc_out_c6_hi0_3_scanout[28];
assign ff_l2d_decc_out_c6_lo1_3_scanin[28]=ff_l2d_decc_out_c6_lo1_1_scanout[28];
assign ff_l2d_decc_out_c6_hi1_1_scanin[28]=ff_l2d_decc_out_c6_lo1_3_scanout[28];
assign ff_l2d_decc_out_c6_hi1_3_scanin[28]=ff_l2d_decc_out_c6_hi1_1_scanout[28];
assign ff_l2d_decc_out_c6_lo0_1_scanin[29]=ff_l2d_decc_out_c6_hi1_3_scanout[28];
assign ff_l2d_decc_out_c6_lo0_3_scanin[29]=ff_l2d_decc_out_c6_lo0_1_scanout[29];
assign ff_l2d_decc_out_c6_hi0_1_scanin[29]=ff_l2d_decc_out_c6_lo0_3_scanout[29];
assign ff_l2d_decc_out_c6_hi0_3_scanin[29]=ff_l2d_decc_out_c6_hi0_1_scanout[29];
assign ff_l2d_decc_out_c6_lo1_1_scanin[29]=ff_l2d_decc_out_c6_hi0_3_scanout[29];
assign ff_l2d_decc_out_c6_lo1_3_scanin[29]=ff_l2d_decc_out_c6_lo1_1_scanout[29];
assign ff_l2d_decc_out_c6_hi1_1_scanin[29]=ff_l2d_decc_out_c6_lo1_3_scanout[29];
assign ff_l2d_decc_out_c6_hi1_3_scanin[29]=ff_l2d_decc_out_c6_hi1_1_scanout[29];
assign ff_l2d_decc_out_c6_lo0_1_scanin[30]=ff_l2d_decc_out_c6_hi1_3_scanout[29];
assign ff_l2d_decc_out_c6_lo0_3_scanin[30]=ff_l2d_decc_out_c6_lo0_1_scanout[30];
assign ff_l2d_decc_out_c6_hi0_1_scanin[30]=ff_l2d_decc_out_c6_lo0_3_scanout[30];
assign ff_l2d_decc_out_c6_hi0_3_scanin[30]=ff_l2d_decc_out_c6_hi0_1_scanout[30];
assign ff_l2d_decc_out_c6_lo1_1_scanin[30]=ff_l2d_decc_out_c6_hi0_3_scanout[30];
assign ff_l2d_decc_out_c6_lo1_3_scanin[30]=ff_l2d_decc_out_c6_lo1_1_scanout[30];
assign ff_l2d_decc_out_c6_hi1_1_scanin[30]=ff_l2d_decc_out_c6_lo1_3_scanout[30];
assign ff_l2d_decc_out_c6_hi1_3_scanin[30]=ff_l2d_decc_out_c6_hi1_1_scanout[30];
assign ff_l2d_decc_out_c6_lo0_1_scanin[31]=ff_l2d_decc_out_c6_hi1_3_scanout[30];
assign ff_l2d_decc_out_c6_lo0_3_scanin[31]=ff_l2d_decc_out_c6_lo0_1_scanout[31];
assign ff_l2d_decc_out_c6_hi0_1_scanin[31]=ff_l2d_decc_out_c6_lo0_3_scanout[31];
assign ff_l2d_decc_out_c6_hi0_3_scanin[31]=ff_l2d_decc_out_c6_hi0_1_scanout[31];
assign ff_l2d_decc_out_c6_lo1_1_scanin[31]=ff_l2d_decc_out_c6_hi0_3_scanout[31];
assign ff_l2d_decc_out_c6_lo1_3_scanin[31]=ff_l2d_decc_out_c6_lo1_1_scanout[31];
assign ff_l2d_decc_out_c6_hi1_1_scanin[31]=ff_l2d_decc_out_c6_lo1_3_scanout[31];
assign ff_l2d_decc_out_c6_hi1_3_scanin[31]=ff_l2d_decc_out_c6_hi1_1_scanout[31];
assign ff_l2d_decc_out_c6_lo0_1_scanin[32]=ff_l2d_decc_out_c6_hi1_3_scanout[31];
assign ff_l2d_decc_out_c6_lo0_3_scanin[32]=ff_l2d_decc_out_c6_lo0_1_scanout[32];
assign ff_l2d_decc_out_c6_hi0_1_scanin[32]=ff_l2d_decc_out_c6_lo0_3_scanout[32];
assign ff_l2d_decc_out_c6_hi0_3_scanin[32]=ff_l2d_decc_out_c6_hi0_1_scanout[32];
assign ff_l2d_decc_out_c6_lo1_1_scanin[32]=ff_l2d_decc_out_c6_hi0_3_scanout[32];
assign ff_l2d_decc_out_c6_lo1_3_scanin[32]=ff_l2d_decc_out_c6_lo1_1_scanout[32];
assign ff_l2d_decc_out_c6_hi1_1_scanin[32]=ff_l2d_decc_out_c6_lo1_3_scanout[32];
assign ff_l2d_decc_out_c6_hi1_3_scanin[32]=ff_l2d_decc_out_c6_hi1_1_scanout[32];
assign ff_l2d_decc_out_c6_lo0_1_scanin[33]=ff_l2d_decc_out_c6_hi1_3_scanout[32];
assign ff_l2d_decc_out_c6_lo0_3_scanin[33]=ff_l2d_decc_out_c6_lo0_1_scanout[33];
assign ff_l2d_decc_out_c6_hi0_1_scanin[33]=ff_l2d_decc_out_c6_lo0_3_scanout[33];
assign ff_l2d_decc_out_c6_hi0_3_scanin[33]=ff_l2d_decc_out_c6_hi0_1_scanout[33];
assign ff_l2d_decc_out_c6_lo1_1_scanin[33]=ff_l2d_decc_out_c6_hi0_3_scanout[33];
assign ff_l2d_decc_out_c6_lo1_3_scanin[33]=ff_l2d_decc_out_c6_lo1_1_scanout[33];
assign ff_l2d_decc_out_c6_hi1_1_scanin[33]=ff_l2d_decc_out_c6_lo1_3_scanout[33];
assign ff_l2d_decc_out_c6_hi1_3_scanin[33]=ff_l2d_decc_out_c6_hi1_1_scanout[33];
assign ff_l2d_decc_out_c6_lo0_1_scanin[34]=ff_l2d_decc_out_c6_hi1_3_scanout[33];
assign ff_l2d_decc_out_c6_lo0_3_scanin[34]=ff_l2d_decc_out_c6_lo0_1_scanout[34];
assign ff_l2d_decc_out_c6_hi0_1_scanin[34]=ff_l2d_decc_out_c6_lo0_3_scanout[34];
assign ff_l2d_decc_out_c6_hi0_3_scanin[34]=ff_l2d_decc_out_c6_hi0_1_scanout[34];
assign ff_l2d_decc_out_c6_lo1_1_scanin[34]=ff_l2d_decc_out_c6_hi0_3_scanout[34];
assign ff_l2d_decc_out_c6_lo1_3_scanin[34]=ff_l2d_decc_out_c6_lo1_1_scanout[34];
assign ff_l2d_decc_out_c6_hi1_1_scanin[34]=ff_l2d_decc_out_c6_lo1_3_scanout[34];
assign ff_l2d_decc_out_c6_hi1_3_scanin[34]=ff_l2d_decc_out_c6_hi1_1_scanout[34];
assign ff_l2d_decc_out_c6_lo0_1_scanin[35]=ff_l2d_decc_out_c6_hi1_3_scanout[34];
assign ff_l2d_decc_out_c6_lo0_3_scanin[35]=ff_l2d_decc_out_c6_lo0_1_scanout[35];
assign ff_l2d_decc_out_c6_hi0_1_scanin[35]=ff_l2d_decc_out_c6_lo0_3_scanout[35];
assign ff_l2d_decc_out_c6_hi0_3_scanin[35]=ff_l2d_decc_out_c6_hi0_1_scanout[35];
assign ff_l2d_decc_out_c6_lo1_1_scanin[35]=ff_l2d_decc_out_c6_hi0_3_scanout[35];
assign ff_l2d_decc_out_c6_lo1_3_scanin[35]=ff_l2d_decc_out_c6_lo1_1_scanout[35];
assign ff_l2d_decc_out_c6_hi1_1_scanin[35]=ff_l2d_decc_out_c6_lo1_3_scanout[35];
assign ff_l2d_decc_out_c6_hi1_3_scanin[35]=ff_l2d_decc_out_c6_hi1_1_scanout[35];
assign ff_l2d_decc_out_c6_lo0_1_scanin[36]=ff_l2d_decc_out_c6_hi1_3_scanout[35];
assign ff_l2d_decc_out_c6_lo0_3_scanin[36]=ff_l2d_decc_out_c6_lo0_1_scanout[36];
assign ff_l2d_decc_out_c6_hi0_1_scanin[36]=ff_l2d_decc_out_c6_lo0_3_scanout[36];
assign ff_l2d_decc_out_c6_hi0_3_scanin[36]=ff_l2d_decc_out_c6_hi0_1_scanout[36];
assign ff_l2d_decc_out_c6_lo1_1_scanin[36]=ff_l2d_decc_out_c6_hi0_3_scanout[36];
assign ff_l2d_decc_out_c6_lo1_3_scanin[36]=ff_l2d_decc_out_c6_lo1_1_scanout[36];
assign ff_l2d_decc_out_c6_hi1_1_scanin[36]=ff_l2d_decc_out_c6_lo1_3_scanout[36];
assign ff_l2d_decc_out_c6_hi1_3_scanin[36]=ff_l2d_decc_out_c6_hi1_1_scanout[36];
assign ff_l2d_decc_out_c6_lo0_1_scanin[37]=ff_l2d_decc_out_c6_hi1_3_scanout[36];
assign ff_l2d_decc_out_c6_lo0_3_scanin[37]=ff_l2d_decc_out_c6_lo0_1_scanout[37];
assign ff_l2d_decc_out_c6_hi0_1_scanin[37]=ff_l2d_decc_out_c6_lo0_3_scanout[37];
assign ff_l2d_decc_out_c6_hi0_3_scanin[37]=ff_l2d_decc_out_c6_hi0_1_scanout[37];
assign ff_l2d_decc_out_c6_lo1_1_scanin[37]=ff_l2d_decc_out_c6_hi0_3_scanout[37];
assign ff_l2d_decc_out_c6_lo1_3_scanin[37]=ff_l2d_decc_out_c6_lo1_1_scanout[37];
assign ff_l2d_decc_out_c6_hi1_1_scanin[37]=ff_l2d_decc_out_c6_lo1_3_scanout[37];
assign ff_l2d_decc_out_c6_hi1_3_scanin[37]=ff_l2d_decc_out_c6_hi1_1_scanout[37];
assign ff_l2d_decc_out_c6_lo0_1_scanin[38]=ff_l2d_decc_out_c6_hi1_3_scanout[37];
assign ff_l2d_decc_out_c6_lo0_3_scanin[38]=ff_l2d_decc_out_c6_lo0_1_scanout[38];
assign ff_l2d_decc_out_c6_hi0_1_scanin[38]=ff_l2d_decc_out_c6_lo0_3_scanout[38];
assign ff_l2d_decc_out_c6_hi0_3_scanin[38]=ff_l2d_decc_out_c6_hi0_1_scanout[38];
assign ff_l2d_decc_out_c6_lo1_1_scanin[38]=ff_l2d_decc_out_c6_hi0_3_scanout[38];
assign ff_l2d_decc_out_c6_lo1_3_scanin[38]=ff_l2d_decc_out_c6_lo1_1_scanout[38];
assign ff_l2d_decc_out_c6_hi1_1_scanin[38]=ff_l2d_decc_out_c6_lo1_3_scanout[38];
assign ff_l2d_decc_out_c6_hi1_3_scanin[38]=ff_l2d_decc_out_c6_hi1_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[0]=ff_l2d_decc_out_c6_hi1_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[5];
assign ff_cache_col_offset_c5_001_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[4];
assign ff_cache_col_offset_c5_001_scanin[2]=ff_cache_col_offset_c5_001_scanout[0];
assign ff_cache_col_offset_c4_001_scanin[0]=ff_cache_col_offset_c5_001_scanout[2];
assign ff_cache_col_offset_c4_001_scanin[2]=ff_cache_col_offset_c4_001_scanout[0];
assign ff_cache_col_offset_c4_tog_001_scanin[0]=ff_cache_col_offset_c4_001_scanout[2];
assign ff_cache_cache_rd_wr_c5_00_scanin=ff_cache_col_offset_c4_tog_001_scanout[0];
assign ff_cache_col_offset_c5_001_scanin[1]=ff_cache_cache_rd_wr_c5_00_scanout;
assign ff_cache_col_offset_c5_001_scanin[3]=ff_cache_col_offset_c5_001_scanout[1];
assign ff_cache_col_offset_c4_001_scanin[1]=ff_cache_col_offset_c5_001_scanout[3];
assign ff_cache_col_offset_c4_001_scanin[3]=ff_cache_col_offset_c4_001_scanout[1];
assign ff_cache_col_offset_c4_tog_001_scanin[1]=ff_cache_col_offset_c4_001_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[19]=ff_cache_col_offset_c4_tog_001_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[5];
assign ff_l2d_decc_out_c6_lo0_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[4];
assign ff_l2d_decc_out_c6_lo0_3_scanin[0]=ff_l2d_decc_out_c6_lo0_1_scanout[0];
assign ff_l2d_decc_out_c6_hi0_1_scanin[0]=ff_l2d_decc_out_c6_lo0_3_scanout[0];
assign ff_l2d_decc_out_c6_hi0_3_scanin[0]=ff_l2d_decc_out_c6_hi0_1_scanout[0];
assign ff_l2d_decc_out_c6_lo1_1_scanin[0]=ff_l2d_decc_out_c6_hi0_3_scanout[0];
assign ff_l2d_decc_out_c6_lo1_3_scanin[0]=ff_l2d_decc_out_c6_lo1_1_scanout[0];
assign ff_l2d_decc_out_c6_hi1_1_scanin[0]=ff_l2d_decc_out_c6_lo1_3_scanout[0];
assign ff_l2d_decc_out_c6_hi1_3_scanin[0]=ff_l2d_decc_out_c6_hi1_1_scanout[0];
assign ff_l2d_decc_out_c6_lo0_1_scanin[1]=ff_l2d_decc_out_c6_hi1_3_scanout[0];
assign ff_l2d_decc_out_c6_lo0_3_scanin[1]=ff_l2d_decc_out_c6_lo0_1_scanout[1];
assign ff_l2d_decc_out_c6_hi0_1_scanin[1]=ff_l2d_decc_out_c6_lo0_3_scanout[1];
assign ff_l2d_decc_out_c6_hi0_3_scanin[1]=ff_l2d_decc_out_c6_hi0_1_scanout[1];
assign ff_l2d_decc_out_c6_lo1_1_scanin[1]=ff_l2d_decc_out_c6_hi0_3_scanout[1];
assign ff_l2d_decc_out_c6_lo1_3_scanin[1]=ff_l2d_decc_out_c6_lo1_1_scanout[1];
assign ff_l2d_decc_out_c6_hi1_1_scanin[1]=ff_l2d_decc_out_c6_lo1_3_scanout[1];
assign ff_l2d_decc_out_c6_hi1_3_scanin[1]=ff_l2d_decc_out_c6_hi1_1_scanout[1];
assign ff_l2d_decc_out_c6_lo0_1_scanin[2]=ff_l2d_decc_out_c6_hi1_3_scanout[1];
assign ff_l2d_decc_out_c6_lo0_3_scanin[2]=ff_l2d_decc_out_c6_lo0_1_scanout[2];
assign ff_l2d_decc_out_c6_hi0_1_scanin[2]=ff_l2d_decc_out_c6_lo0_3_scanout[2];
assign ff_l2d_decc_out_c6_hi0_3_scanin[2]=ff_l2d_decc_out_c6_hi0_1_scanout[2];
assign ff_l2d_decc_out_c6_lo1_1_scanin[2]=ff_l2d_decc_out_c6_hi0_3_scanout[2];
assign ff_l2d_decc_out_c6_lo1_3_scanin[2]=ff_l2d_decc_out_c6_lo1_1_scanout[2];
assign ff_l2d_decc_out_c6_hi1_1_scanin[2]=ff_l2d_decc_out_c6_lo1_3_scanout[2];
assign ff_l2d_decc_out_c6_hi1_3_scanin[2]=ff_l2d_decc_out_c6_hi1_1_scanout[2];
assign ff_l2d_decc_out_c6_lo0_1_scanin[3]=ff_l2d_decc_out_c6_hi1_3_scanout[2];
assign ff_l2d_decc_out_c6_lo0_3_scanin[3]=ff_l2d_decc_out_c6_lo0_1_scanout[3];
assign ff_l2d_decc_out_c6_hi0_1_scanin[3]=ff_l2d_decc_out_c6_lo0_3_scanout[3];
assign ff_l2d_decc_out_c6_hi0_3_scanin[3]=ff_l2d_decc_out_c6_hi0_1_scanout[3];
assign ff_l2d_decc_out_c6_lo1_1_scanin[3]=ff_l2d_decc_out_c6_hi0_3_scanout[3];
assign ff_l2d_decc_out_c6_lo1_3_scanin[3]=ff_l2d_decc_out_c6_lo1_1_scanout[3];
assign ff_l2d_decc_out_c6_hi1_1_scanin[3]=ff_l2d_decc_out_c6_lo1_3_scanout[3];
assign ff_l2d_decc_out_c6_hi1_3_scanin[3]=ff_l2d_decc_out_c6_hi1_1_scanout[3];
assign ff_l2d_decc_out_c6_lo0_1_scanin[4]=ff_l2d_decc_out_c6_hi1_3_scanout[3];
assign ff_l2d_decc_out_c6_lo0_3_scanin[4]=ff_l2d_decc_out_c6_lo0_1_scanout[4];
assign ff_l2d_decc_out_c6_hi0_1_scanin[4]=ff_l2d_decc_out_c6_lo0_3_scanout[4];
assign ff_l2d_decc_out_c6_hi0_3_scanin[4]=ff_l2d_decc_out_c6_hi0_1_scanout[4];
assign ff_l2d_decc_out_c6_lo1_1_scanin[4]=ff_l2d_decc_out_c6_hi0_3_scanout[4];
assign ff_l2d_decc_out_c6_lo1_3_scanin[4]=ff_l2d_decc_out_c6_lo1_1_scanout[4];
assign ff_l2d_decc_out_c6_hi1_1_scanin[4]=ff_l2d_decc_out_c6_lo1_3_scanout[4];
assign ff_l2d_decc_out_c6_hi1_3_scanin[4]=ff_l2d_decc_out_c6_hi1_1_scanout[4];
assign ff_l2d_decc_out_c6_lo0_1_scanin[5]=ff_l2d_decc_out_c6_hi1_3_scanout[4];
assign ff_l2d_decc_out_c6_lo0_3_scanin[5]=ff_l2d_decc_out_c6_lo0_1_scanout[5];
assign ff_l2d_decc_out_c6_hi0_1_scanin[5]=ff_l2d_decc_out_c6_lo0_3_scanout[5];
assign ff_l2d_decc_out_c6_hi0_3_scanin[5]=ff_l2d_decc_out_c6_hi0_1_scanout[5];
assign ff_l2d_decc_out_c6_lo1_1_scanin[5]=ff_l2d_decc_out_c6_hi0_3_scanout[5];
assign ff_l2d_decc_out_c6_lo1_3_scanin[5]=ff_l2d_decc_out_c6_lo1_1_scanout[5];
assign ff_l2d_decc_out_c6_hi1_1_scanin[5]=ff_l2d_decc_out_c6_lo1_3_scanout[5];
assign ff_l2d_decc_out_c6_hi1_3_scanin[5]=ff_l2d_decc_out_c6_hi1_1_scanout[5];
assign ff_l2d_decc_out_c6_lo0_1_scanin[6]=ff_l2d_decc_out_c6_hi1_3_scanout[5];
assign ff_l2d_decc_out_c6_lo0_3_scanin[6]=ff_l2d_decc_out_c6_lo0_1_scanout[6];
assign ff_l2d_decc_out_c6_hi0_1_scanin[6]=ff_l2d_decc_out_c6_lo0_3_scanout[6];
assign ff_l2d_decc_out_c6_hi0_3_scanin[6]=ff_l2d_decc_out_c6_hi0_1_scanout[6];
assign ff_l2d_decc_out_c6_lo1_1_scanin[6]=ff_l2d_decc_out_c6_hi0_3_scanout[6];
assign ff_l2d_decc_out_c6_lo1_3_scanin[6]=ff_l2d_decc_out_c6_lo1_1_scanout[6];
assign ff_l2d_decc_out_c6_hi1_1_scanin[6]=ff_l2d_decc_out_c6_lo1_3_scanout[6];
assign ff_l2d_decc_out_c6_hi1_3_scanin[6]=ff_l2d_decc_out_c6_hi1_1_scanout[6];
assign ff_l2d_decc_out_c6_lo0_1_scanin[7]=ff_l2d_decc_out_c6_hi1_3_scanout[6];
assign ff_l2d_decc_out_c6_lo0_3_scanin[7]=ff_l2d_decc_out_c6_lo0_1_scanout[7];
assign ff_l2d_decc_out_c6_hi0_1_scanin[7]=ff_l2d_decc_out_c6_lo0_3_scanout[7];
assign ff_l2d_decc_out_c6_hi0_3_scanin[7]=ff_l2d_decc_out_c6_hi0_1_scanout[7];
assign ff_l2d_decc_out_c6_lo1_1_scanin[7]=ff_l2d_decc_out_c6_hi0_3_scanout[7];
assign ff_l2d_decc_out_c6_lo1_3_scanin[7]=ff_l2d_decc_out_c6_lo1_1_scanout[7];
assign ff_l2d_decc_out_c6_hi1_1_scanin[7]=ff_l2d_decc_out_c6_lo1_3_scanout[7];
assign ff_l2d_decc_out_c6_hi1_3_scanin[7]=ff_l2d_decc_out_c6_hi1_1_scanout[7];
assign ff_l2d_decc_out_c6_lo0_1_scanin[8]=ff_l2d_decc_out_c6_hi1_3_scanout[7];
assign ff_l2d_decc_out_c6_lo0_3_scanin[8]=ff_l2d_decc_out_c6_lo0_1_scanout[8];
assign ff_l2d_decc_out_c6_hi0_1_scanin[8]=ff_l2d_decc_out_c6_lo0_3_scanout[8];
assign ff_l2d_decc_out_c6_hi0_3_scanin[8]=ff_l2d_decc_out_c6_hi0_1_scanout[8];
assign ff_l2d_decc_out_c6_lo1_1_scanin[8]=ff_l2d_decc_out_c6_hi0_3_scanout[8];
assign ff_l2d_decc_out_c6_lo1_3_scanin[8]=ff_l2d_decc_out_c6_lo1_1_scanout[8];
assign ff_l2d_decc_out_c6_hi1_1_scanin[8]=ff_l2d_decc_out_c6_lo1_3_scanout[8];
assign ff_l2d_decc_out_c6_hi1_3_scanin[8]=ff_l2d_decc_out_c6_hi1_1_scanout[8];
assign ff_l2d_decc_out_c6_lo0_1_scanin[9]=ff_l2d_decc_out_c6_hi1_3_scanout[8];
assign ff_l2d_decc_out_c6_lo0_3_scanin[9]=ff_l2d_decc_out_c6_lo0_1_scanout[9];
assign ff_l2d_decc_out_c6_hi0_1_scanin[9]=ff_l2d_decc_out_c6_lo0_3_scanout[9];
assign ff_l2d_decc_out_c6_hi0_3_scanin[9]=ff_l2d_decc_out_c6_hi0_1_scanout[9];
assign ff_l2d_decc_out_c6_lo1_1_scanin[9]=ff_l2d_decc_out_c6_hi0_3_scanout[9];
assign ff_l2d_decc_out_c6_lo1_3_scanin[9]=ff_l2d_decc_out_c6_lo1_1_scanout[9];
assign ff_l2d_decc_out_c6_hi1_1_scanin[9]=ff_l2d_decc_out_c6_lo1_3_scanout[9];
assign ff_l2d_decc_out_c6_hi1_3_scanin[9]=ff_l2d_decc_out_c6_hi1_1_scanout[9];
assign ff_l2d_decc_out_c6_lo0_1_scanin[10]=ff_l2d_decc_out_c6_hi1_3_scanout[9];
assign ff_l2d_decc_out_c6_lo0_3_scanin[10]=ff_l2d_decc_out_c6_lo0_1_scanout[10];
assign ff_l2d_decc_out_c6_hi0_1_scanin[10]=ff_l2d_decc_out_c6_lo0_3_scanout[10];
assign ff_l2d_decc_out_c6_hi0_3_scanin[10]=ff_l2d_decc_out_c6_hi0_1_scanout[10];
assign ff_l2d_decc_out_c6_lo1_1_scanin[10]=ff_l2d_decc_out_c6_hi0_3_scanout[10];
assign ff_l2d_decc_out_c6_lo1_3_scanin[10]=ff_l2d_decc_out_c6_lo1_1_scanout[10];
assign ff_l2d_decc_out_c6_hi1_1_scanin[10]=ff_l2d_decc_out_c6_lo1_3_scanout[10];
assign ff_l2d_decc_out_c6_hi1_3_scanin[10]=ff_l2d_decc_out_c6_hi1_1_scanout[10];
assign ff_l2d_decc_out_c6_lo0_1_scanin[11]=ff_l2d_decc_out_c6_hi1_3_scanout[10];
assign ff_l2d_decc_out_c6_lo0_3_scanin[11]=ff_l2d_decc_out_c6_lo0_1_scanout[11];
assign ff_l2d_decc_out_c6_hi0_1_scanin[11]=ff_l2d_decc_out_c6_lo0_3_scanout[11];
assign ff_l2d_decc_out_c6_hi0_3_scanin[11]=ff_l2d_decc_out_c6_hi0_1_scanout[11];
assign ff_l2d_decc_out_c6_lo1_1_scanin[11]=ff_l2d_decc_out_c6_hi0_3_scanout[11];
assign ff_l2d_decc_out_c6_lo1_3_scanin[11]=ff_l2d_decc_out_c6_lo1_1_scanout[11];
assign ff_l2d_decc_out_c6_hi1_1_scanin[11]=ff_l2d_decc_out_c6_lo1_3_scanout[11];
assign ff_l2d_decc_out_c6_hi1_3_scanin[11]=ff_l2d_decc_out_c6_hi1_1_scanout[11];
assign ff_l2d_decc_out_c6_lo0_1_scanin[12]=ff_l2d_decc_out_c6_hi1_3_scanout[11];
assign ff_l2d_decc_out_c6_lo0_3_scanin[12]=ff_l2d_decc_out_c6_lo0_1_scanout[12];
assign ff_l2d_decc_out_c6_hi0_1_scanin[12]=ff_l2d_decc_out_c6_lo0_3_scanout[12];
assign ff_l2d_decc_out_c6_hi0_3_scanin[12]=ff_l2d_decc_out_c6_hi0_1_scanout[12];
assign ff_l2d_decc_out_c6_lo1_1_scanin[12]=ff_l2d_decc_out_c6_hi0_3_scanout[12];
assign ff_l2d_decc_out_c6_lo1_3_scanin[12]=ff_l2d_decc_out_c6_lo1_1_scanout[12];
assign ff_l2d_decc_out_c6_hi1_1_scanin[12]=ff_l2d_decc_out_c6_lo1_3_scanout[12];
assign ff_l2d_decc_out_c6_hi1_3_scanin[12]=ff_l2d_decc_out_c6_hi1_1_scanout[12];
assign ff_l2d_decc_out_c6_lo0_1_scanin[13]=ff_l2d_decc_out_c6_hi1_3_scanout[12];
assign ff_l2d_decc_out_c6_lo0_3_scanin[13]=ff_l2d_decc_out_c6_lo0_1_scanout[13];
assign ff_l2d_decc_out_c6_hi0_1_scanin[13]=ff_l2d_decc_out_c6_lo0_3_scanout[13];
assign ff_l2d_decc_out_c6_hi0_3_scanin[13]=ff_l2d_decc_out_c6_hi0_1_scanout[13];
assign ff_l2d_decc_out_c6_lo1_1_scanin[13]=ff_l2d_decc_out_c6_hi0_3_scanout[13];
assign ff_l2d_decc_out_c6_lo1_3_scanin[13]=ff_l2d_decc_out_c6_lo1_1_scanout[13];
assign ff_l2d_decc_out_c6_hi1_1_scanin[13]=ff_l2d_decc_out_c6_lo1_3_scanout[13];
assign ff_l2d_decc_out_c6_hi1_3_scanin[13]=ff_l2d_decc_out_c6_hi1_1_scanout[13];
assign ff_l2d_decc_out_c6_lo0_1_scanin[14]=ff_l2d_decc_out_c6_hi1_3_scanout[13];
assign ff_l2d_decc_out_c6_lo0_3_scanin[14]=ff_l2d_decc_out_c6_lo0_1_scanout[14];
assign ff_l2d_decc_out_c6_hi0_1_scanin[14]=ff_l2d_decc_out_c6_lo0_3_scanout[14];
assign ff_l2d_decc_out_c6_hi0_3_scanin[14]=ff_l2d_decc_out_c6_hi0_1_scanout[14];
assign ff_l2d_decc_out_c6_lo1_1_scanin[14]=ff_l2d_decc_out_c6_hi0_3_scanout[14];
assign ff_l2d_decc_out_c6_lo1_3_scanin[14]=ff_l2d_decc_out_c6_lo1_1_scanout[14];
assign ff_l2d_decc_out_c6_hi1_1_scanin[14]=ff_l2d_decc_out_c6_lo1_3_scanout[14];
assign ff_l2d_decc_out_c6_hi1_3_scanin[14]=ff_l2d_decc_out_c6_hi1_1_scanout[14];
assign ff_l2d_decc_out_c6_lo0_1_scanin[15]=ff_l2d_decc_out_c6_hi1_3_scanout[14];
assign ff_l2d_decc_out_c6_lo0_3_scanin[15]=ff_l2d_decc_out_c6_lo0_1_scanout[15];
assign ff_l2d_decc_out_c6_hi0_1_scanin[15]=ff_l2d_decc_out_c6_lo0_3_scanout[15];
assign ff_l2d_decc_out_c6_hi0_3_scanin[15]=ff_l2d_decc_out_c6_hi0_1_scanout[15];
assign ff_l2d_decc_out_c6_lo1_1_scanin[15]=ff_l2d_decc_out_c6_hi0_3_scanout[15];
assign ff_l2d_decc_out_c6_lo1_3_scanin[15]=ff_l2d_decc_out_c6_lo1_1_scanout[15];
assign ff_l2d_decc_out_c6_hi1_1_scanin[15]=ff_l2d_decc_out_c6_lo1_3_scanout[15];
assign ff_l2d_decc_out_c6_hi1_3_scanin[15]=ff_l2d_decc_out_c6_hi1_1_scanout[15];
assign ff_l2d_decc_out_c6_lo0_1_scanin[16]=ff_l2d_decc_out_c6_hi1_3_scanout[15];
assign ff_l2d_decc_out_c6_lo0_3_scanin[16]=ff_l2d_decc_out_c6_lo0_1_scanout[16];
assign ff_l2d_decc_out_c6_hi0_1_scanin[16]=ff_l2d_decc_out_c6_lo0_3_scanout[16];
assign ff_l2d_decc_out_c6_hi0_3_scanin[16]=ff_l2d_decc_out_c6_hi0_1_scanout[16];
assign ff_l2d_decc_out_c6_lo1_1_scanin[16]=ff_l2d_decc_out_c6_hi0_3_scanout[16];
assign ff_l2d_decc_out_c6_lo1_3_scanin[16]=ff_l2d_decc_out_c6_lo1_1_scanout[16];
assign ff_l2d_decc_out_c6_hi1_1_scanin[16]=ff_l2d_decc_out_c6_lo1_3_scanout[16];
assign ff_l2d_decc_out_c6_hi1_3_scanin[16]=ff_l2d_decc_out_c6_hi1_1_scanout[16];
assign ff_l2d_decc_out_c6_lo0_1_scanin[17]=ff_l2d_decc_out_c6_hi1_3_scanout[16];
assign ff_l2d_decc_out_c6_lo0_3_scanin[17]=ff_l2d_decc_out_c6_lo0_1_scanout[17];
assign ff_l2d_decc_out_c6_hi0_1_scanin[17]=ff_l2d_decc_out_c6_lo0_3_scanout[17];
assign ff_l2d_decc_out_c6_hi0_3_scanin[17]=ff_l2d_decc_out_c6_hi0_1_scanout[17];
assign ff_l2d_decc_out_c6_lo1_1_scanin[17]=ff_l2d_decc_out_c6_hi0_3_scanout[17];
assign ff_l2d_decc_out_c6_lo1_3_scanin[17]=ff_l2d_decc_out_c6_lo1_1_scanout[17];
assign ff_l2d_decc_out_c6_hi1_1_scanin[17]=ff_l2d_decc_out_c6_lo1_3_scanout[17];
assign ff_l2d_decc_out_c6_hi1_3_scanin[17]=ff_l2d_decc_out_c6_hi1_1_scanout[17];
assign ff_l2d_decc_out_c6_lo0_1_scanin[18]=ff_l2d_decc_out_c6_hi1_3_scanout[17];
assign ff_l2d_decc_out_c6_lo0_3_scanin[18]=ff_l2d_decc_out_c6_lo0_1_scanout[18];
assign ff_l2d_decc_out_c6_hi0_1_scanin[18]=ff_l2d_decc_out_c6_lo0_3_scanout[18];
assign ff_l2d_decc_out_c6_hi0_3_scanin[18]=ff_l2d_decc_out_c6_hi0_1_scanout[18];
assign ff_l2d_decc_out_c6_lo1_1_scanin[18]=ff_l2d_decc_out_c6_hi0_3_scanout[18];
assign ff_l2d_decc_out_c6_lo1_3_scanin[18]=ff_l2d_decc_out_c6_lo1_1_scanout[18];
assign ff_l2d_decc_out_c6_hi1_1_scanin[18]=ff_l2d_decc_out_c6_lo1_3_scanout[18];
assign ff_l2d_decc_out_c6_hi1_3_scanin[18]=ff_l2d_decc_out_c6_hi1_1_scanout[18];
assign ff_l2d_decc_out_c6_lo0_1_scanin[19]=ff_l2d_decc_out_c6_hi1_3_scanout[18];
assign ff_l2d_decc_out_c6_lo0_3_scanin[19]=ff_l2d_decc_out_c6_lo0_1_scanout[19];
assign ff_l2d_decc_out_c6_hi0_1_scanin[19]=ff_l2d_decc_out_c6_lo0_3_scanout[19];
assign ff_l2d_decc_out_c6_hi0_3_scanin[19]=ff_l2d_decc_out_c6_hi0_1_scanout[19];
assign scan_out=ff_l2d_decc_out_c6_hi0_3_scanout[19];
// fixscan end
endmodule






// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;

  input [8:0] din;
  input l1clk;
  input [8:0] scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output [8:0] scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si(scan_in[8:0]),
.so(scan_out[8:0]),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;

  input [3:0] din;
  input l1clk;
  input [3:0] scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output [3:0] scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si(scan_in[3:0]),
.so(scan_out[3:0]),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;

  input [1:0] din;
  input l1clk;
  input [1:0] scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output [1:0] scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si(scan_in[1:0]),
.so(scan_out[1:0]),
.q(dout[1:0])
);












endmodule









//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_sp_512kb_cust_and_macro__ports_4__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  output [0:0] dout;






and4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module n2_l2d_sp_512kb_cust_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module n2_l2d_sp_512kb_cust_inv_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






inv #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module n2_l2d_sp_512kb_cust_or_macro__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






or2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule





//
//   invert macro
//
//





module n2_l2d_sp_512kb_cust_inv_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module n2_l2d_sp_512kb_cust_or_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






or2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_sp_512kb_cust_and_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_sp_512kb_cust_and_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






and2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_sp_512kb_cust_and_macro__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






and2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_78 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [77:0] fdin;

  input [77:0] din;
  input l1clk;
  input [77:0] scan_in;


  input siclk;
  input soclk;

  output [77:0] dout;
  output [77:0] scan_out;
assign fdin[77:0] = din[77:0];






dff #(78)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[77:0]),
.si(scan_in[77:0]),
.so(scan_out[77:0]),
.q(dout[77:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_39 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [38:0] din0;
  input sel0;
  input [38:0] din1;
  input sel1;
  output [38:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(39)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
.dout(dout[38:0])
);









  



endmodule


//
//   macro for cl_mc1_tisram_blbi_8x flop
//
//





module n2_l2d_sp_512kb_cust_tisram_blbi_macro__width_624 (
  d_a, 
  l1clk, 
  q_b_l);
input [623:0] d_a;
input l1clk;
output [623:0] q_b_l;






tisram_blb_inv #(624)  d0_0 (
.d(d_a[623:0]),
.l1clk(l1clk),
.latout_l(q_b_l[623:0])
);










//place::generic_place($width,$stack,$left);

endmodule





//
//   macro for cl_mc1_tisram_bla_{4}x flops
//
//





module n2_l2d_sp_512kb_cust_tisram_bla_macro__width_156 (
  d_b, 
  l1clk, 
  q_a);
input [155:0] d_b;
input l1clk;
output [155:0] q_a;






tisram_bla #(156)  d0_0 (
.d_b(d_b[155:0]),
.l1clk(l1clk),
.q_a(q_a[155:0])
);










//place::generic_place($width,$stack,$left);

endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [155:0] din0;
  input sel0;
  input [155:0] din1;
  input sel1;
  output [155:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(156)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[155:0]),
  .in1(din1[155:0]),
.dout(dout[155:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module n2_l2d_sp_512kb_cust_cmp_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output dout;






cmp #(4)  m0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout)
);










endmodule





//
//   nor macro for ports = 2,3
//
//





module n2_l2d_sp_512kb_cust_nor_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_3__width_10 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [9:0] din0;
  input sel0;
  input [9:0] din1;
  input sel1;
  input [9:0] din2;
  input sel2;
  output [9:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(10)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
  .in2(din2[9:0]),
.dout(dout[9:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_mux_macro__mux_aonpe__ports_2__width_10 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [9:0] din0;
  input sel0;
  input [9:0] din1;
  input sel1;
  output [9:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(10)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
.dout(dout[9:0])
);









  



endmodule



module n2_l2d_tstmod_cust (
  rd_wr_c3, 
  wayerr_c3, 
  wr_inhibit, 
  coloff_c3, 
  l2clk, 
  scanen, 
  si, 
  siclk, 
  soclk, 
  so, 
  delout20_rgt, 
  delout31_lft, 
  delout31_rgt, 
  delout20_lft) ;
wire not_wayerr_c3;
wire coloff_c3_1_3;
wire coloff_c3_2_0;
wire [1:0] msff_read_c4_scanin;
wire [1:0] msff_read_c4_scanout;
wire msff_buf_out_top_scanin;
wire msff_buf_out_top_scanout;
wire msff_buf_out_bot_scanin;
wire msff_buf_out_bot_scanout;
wire [2:0] msff_buf_out_corse_scanin;
wire [2:0] msff_buf_out_corse_scanout;
wire [2:0] msff_buf_out_fine_scanin;
wire [2:0] msff_buf_out_fine_scanout;
wire wr_inhibit_n;
wire [2:0] ff_buf_out_corse_n;
wire [2:0] ff_buf_out_fine_n;

//-----------------------------------------------------------
//  I/O declarations
//-----------------------------------------------------------
input		rd_wr_c3;	// 
input		wayerr_c3;	// added 9/21/2005
input		wr_inhibit;	// 
//  coloff_c3<3:0>,           
input	[3:0]	coloff_c3;	// 
input		l2clk;		// 
input		scanen;		// 
input		si;		// 
input		siclk;		// 
input		soclk;		// 

output 		so;		// 
output		delout20_rgt;	// 
output 		delout31_lft;	// 
output 		delout31_rgt;	// 
output  	delout20_lft;	// 


//-----------------------------------------------------------------------------
//  Wire/reg declarations
//-----------------------------------------------------------------------------

// connecting between n2_l2d_tstmod_logic  &  n2_l2d_tstmod_delay_cust
wire		l1clk;
wire		tst_bnken31_setb;
wire		tst_bnken02_setb;
wire		tst_bnken31_rstb;
wire		tst_bnken02_rstb;
wire		tst_bnken31_rstb_n;
wire		tst_bnken02_rstb_n;
//wire		so_internal;
wire		tstmod_rst_l;
wire	[5:0]	corse_sel;
wire	[7:0]	fine_sel;


wire	[1:0]	tst_read_c3a;
//wire	[1:0]	tst_read_c3b;
//wire	[3:0]	tst_read_c4;
//wire	[3:0]	tst_so;
wire	[1:0]	tst_so;
wire	[2:0]	tst_so_corse;
wire	[2:0]	tst_so_fine;
wire		tst_so_en0;

wire		ff_buf_out_top;
wire	[2:0]	ff_buf_out_corse;
wire	[2:0]	ff_buf_out_fine;
wire		ff_buf_out_bot;


// start n2_l2d_tstmod_logic


n2_l2d_sp_512kb_cust_l1clkhdr_ctl_macro l1_clk_hdr (
        .l2clk  (l2clk),
        .se     (scanen),
        .l1en   (1'b1),
        .pce_ov (1'b1),
        .stop   (1'b0),
        .l1clk  (l1clk)
        );



//assign tst_read_c3a[1] = (~wayerr_c3  &  rd_wr_c3  &  (coloff_c3[3] | coloff_c3[1]));
//assign tst_read_c3a[0] = (~wayerr_c3  &  rd_wr_c3  &  (coloff_c3[2] | coloff_c3[0]));


n2_l2d_sp_512kb_cust_inv_macro__width_1 inv_wayerr_c3 
	(
	.dout	(not_wayerr_c3),
	.din	(wayerr_c3)
	);

n2_l2d_sp_512kb_cust_or_macro__width_1 or_coloff_c3_1_3 
	(
	.din0	(coloff_c3[1]),
	.din1	(coloff_c3[3]),
	.dout	(coloff_c3_1_3)
	);


n2_l2d_sp_512kb_cust_or_macro__width_1 or_coloff_c3_2_3 
        (
        .din0   (coloff_c3[2]),
        .din1   (coloff_c3[0]),
        .dout   (coloff_c3_2_0)
        );

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_tst_read_c3a_1 
	(
	.dout	(tst_read_c3a[1]),
	.din0	(not_wayerr_c3),
	.din1	(coloff_c3_1_3),
	.din2	(rd_wr_c3)
	);

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_tst_read_c3a_0 
        (
        .dout   (tst_read_c3a[0]),
        .din0   (not_wayerr_c3),
        .din1   (coloff_c3_2_0),
        .din2   (rd_wr_c3)
        );

n2_l2d_sp_512kb_cust_tisram_blb_macro__dmsff_4x__width_1 blb_read_c3_1  
        (
        .l1clk  (l1clk),
        .d_a    (tst_read_c3a[1]),
        .q_b	(tst_bnken31_setb)
        );
n2_l2d_sp_512kb_cust_tisram_blb_macro__dmsff_4x__width_1 blb_read_c3_0  
        (
        .l1clk  (l1clk),
        .d_a    (tst_read_c3a[0]),
        .q_b	(tst_bnken02_setb)
        );

//initialize
//assign tst_read_c4[3:0] = 4'b0;

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_2  msff_read_c4  
        ( 
        .scan_in    (msff_read_c4_scanin[1:0]),
	.scan_out   (msff_read_c4_scanout[1:0]), 
        .din   ( tst_read_c3a[1:0]  &  {~tst_bnken31_rstb_n,~tst_bnken02_rstb_n} ),
        .l1clk ( l1clk ),
        .dout   ( {tst_bnken31_rstb_n,tst_bnken02_rstb_n} ),
  .siclk(siclk),
  .soclk(soclk)
); 


//assign tst_bnken31_rstb = ~tst_bnken31_rstb_n;
//assign tst_bnken02_rstb = ~tst_bnken02_rstb_n;

n2_l2d_sp_512kb_cust_inv_macro__width_1 inv_tst_bnken31_rstb 
	(
	.dout	(tst_bnken31_rstb),
	.din	(tst_bnken31_rstb_n)
	);

n2_l2d_sp_512kb_cust_inv_macro__width_1 inv_tst_bnken02_rstb 
        (
        .dout   (tst_bnken02_rstb),
        .din    (tst_bnken02_rstb_n)
        );

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1  msff_buf_out_top  
        ( 
        .scan_in    (msff_buf_out_top_scanin),
	.scan_out   (msff_buf_out_top_scanout), 
        .din     ( ff_buf_out_top ), 
        .l1clk   ( l1clk ), 
        .dout    ( ff_buf_out_top ),
  .siclk(siclk),
  .soclk(soclk) 
); 

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_1  msff_buf_out_bot  
        ( 
        .scan_in    (msff_buf_out_bot_scanin),
	.scan_out   (msff_buf_out_bot_scanout),  
        .din    ( ff_buf_out_bot ),
        .l1clk  ( l1clk ),
        .dout   ( ff_buf_out_bot ),
  .siclk(siclk),
  .soclk(soclk)
); 


n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_3  msff_buf_out_corse  
        ( 
        .scan_in    (msff_buf_out_corse_scanin[2:0]),
	.scan_out   (msff_buf_out_corse_scanout[2:0]),  
        .din   ( ff_buf_out_corse[2:0] ),
        .l1clk ( l1clk ),
        .dout  ( ff_buf_out_corse[2:0] ),
  .siclk(siclk),
  .soclk(soclk)
); 

n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_3  msff_buf_out_fine  
        ( 
        .scan_in    (msff_buf_out_fine_scanin[2:0]),
	.scan_out   (msff_buf_out_fine_scanout[2:0]),  
        .din   ( ff_buf_out_fine[2:0] ),
        .l1clk ( l1clk ),
        .dout  ( ff_buf_out_fine[2:0] ),
  .siclk(siclk),
  .soclk(soclk)
); 

//assign tstmod_rst_l = ff_buf_out_top  &  ff_buf_out_bot  &  ~wr_inhibit;


n2_l2d_sp_512kb_cust_inv_macro__width_1 inv_wr_inhibit 
	(
	.dout	(wr_inhibit_n),
	.din	(wr_inhibit)
	);

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_tstmod_rst_l 
	(
	.dout	(tstmod_rst_l),
	.din0	(ff_buf_out_top),
	.din1	(ff_buf_out_bot),
	.din2	(wr_inhibit_n)
	);


n2_l2d_sp_512kb_cust_inv_macro__width_3 inv_ff_buf_out_corse_012 
	(
	.dout	(ff_buf_out_corse_n[2:0]),
	.din	(ff_buf_out_corse[2:0])
	);





//decoding: 3-to-8. 2/3, 1/0 swapped
//assign corse_sel[5] = ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ~ff_buf_out_corse[0];

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_corse_sel_5 
        (
        .dout   (corse_sel[5]),
        .din0   (ff_buf_out_corse[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse_n[0])
        );

//assign corse_sel[4] = ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ff_buf_out_corse[0];

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_corse_sel_4 
        (
        .dout   (corse_sel[4]),
        .din0   (ff_buf_out_corse[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse[0])
        );

//assign corse_sel[3] = ~ff_buf_out_corse[2]  &  ff_buf_out_corse[1]  &  ~ff_buf_out_corse[0];

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_corse_sel_3 
        (
        .dout   (corse_sel[3]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse[1]),
        .din2   (ff_buf_out_corse_n[0])
        );

//assign corse_sel[2] = ~ff_buf_out_corse[2]  &  ff_buf_out_corse[1]  &  ff_buf_out_corse[0];

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_corse_sel_2 
        (
        .dout   (corse_sel[2]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse[1]),
        .din2   (ff_buf_out_corse[0])
        );

//assign corse_sel[1] = ~ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ~ff_buf_out_corse[0];

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_corse_sel_1 
        (
        .dout   (corse_sel[1]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse_n[0])
        );

//assign corse_sel[0] = ~ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ff_buf_out_corse[0];

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_corse_sel_0 
        (
        .dout   (corse_sel[0]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse[0])
        );

n2_l2d_sp_512kb_cust_inv_macro__width_3 inv_ff_buf_out_fine_n 
	(
	.dout	(ff_buf_out_fine_n[2:0]),
	.din	(ff_buf_out_fine[2:0])
	);


//assign fine_sel[7] = ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];

n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_fine_sel_7 
        (
        .dout   (fine_sel[7]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[6] = ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_fine_sel_6 
        (
        .dout   (fine_sel[6]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine[0])
        );

//assign fine_sel[5] = ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];


n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_fine_sel_5 
        (
        .dout   (fine_sel[5]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[4] = ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_fine_sel_4 
        (
        .dout   (fine_sel[4]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine[0])
        );

//assign fine_sel[3] = ~ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];


n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_fine_sel_3 
        (
        .dout   (fine_sel[3]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[2] = ~ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_fine_sel_2 
        (
        .dout   (fine_sel[2]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine[0])
        );

//assign fine_sel[1] = ~ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];


n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_fine_sel_1 
        (
        .dout   (fine_sel[1]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[0] = ~ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 and_fine_sel_0 
        (
        .dout   (fine_sel[0]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine[0])
        );


//end of n2_l2d_tstmod_logic

n2_l2d_tstmod_delay_cust  tstmod_delay	// NOT ATPGABLE
       (
       .l1clk           (l1clk),
       .tstmod_rst_l    (tstmod_rst_l),
       .tst_bnken31_setb(tst_bnken31_setb),
       .tst_bnken02_setb(tst_bnken02_setb),
       .tst_bnken31_rstb(tst_bnken31_rstb),
       .tst_bnken02_rstb(tst_bnken02_rstb),
       .corse_sel       (corse_sel[5:0]),
       .fine_sel        (fine_sel[7:0]),
       .delout31_lft    (delout31_lft),
       .delout31_rgt    (delout31_rgt),
       .delout20_lft    (delout20_lft),
       .delout20_rgt    (delout20_rgt)
       );
       
       
       
// scanorder start
//msff_read_c4_scanin[1:0]
//msff_buf_out_top_scanin
//msff_buf_out_corse_scanin[0]
//msff_buf_out_corse_scanin[1]
//msff_buf_out_corse_scanin[2]
//msff_buf_out_fine_scanin[0]
//msff_buf_out_fine_scanin[1]
//msff_buf_out_fine_scanin[2]
//msff_buf_out_bot_scanin
// scanorder end281     // fixscan start
assign msff_read_c4_scanin[1]=si;
assign msff_read_c4_scanin[0]=msff_read_c4_scanout[1];
assign msff_buf_out_top_scanin=msff_read_c4_scanout[0];
assign msff_buf_out_corse_scanin[0]=msff_buf_out_top_scanout;
assign msff_buf_out_corse_scanin[1]=msff_buf_out_corse_scanout[0];
assign msff_buf_out_corse_scanin[2]=msff_buf_out_corse_scanout[1];
assign msff_buf_out_fine_scanin[0]=msff_buf_out_corse_scanout[2];
assign msff_buf_out_fine_scanin[1]=msff_buf_out_fine_scanout[0];
assign msff_buf_out_fine_scanin[2]=msff_buf_out_fine_scanout[1];
assign msff_buf_out_bot_scanin=msff_buf_out_fine_scanout[2];
assign so=msff_buf_out_bot_scanout;
// fixscan end
endmodule // main program

//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
// THE FOLLOWING MODULE IS BLACKBOX TO ATPG
//////////////////////////////////////////////

module n2_l2d_tstmod_delay_cust (
  l1clk, 
  tstmod_rst_l, 
  tst_bnken31_setb, 
  tst_bnken02_setb, 
  tst_bnken31_rstb, 
  tst_bnken02_rstb, 
  corse_sel, 
  fine_sel, 
  delout31_lft, 
  delout31_rgt, 
  delout20_lft, 
  delout20_rgt) ;

input   l1clk;   
input   tstmod_rst_l;   
input   tst_bnken31_setb;   
input   tst_bnken02_setb;   
input   tst_bnken31_rstb;   
input   tst_bnken02_rstb;   
input   [5:0] corse_sel;   
input   [7:0] fine_sel;   

output   delout31_lft;   
output   delout31_rgt;   
output   delout20_lft;   
output   delout20_rgt;   

wire    [5:0]   corse_sel_muxout;
wire    [7:1]   fine_sel_muxout;

wire 		delayline_en_31;
wire 		delayline_en_02;
wire 		fine_dout_31;
wire 		fine_dout_02;

assign corse_sel_muxout[5:0] = ( {1'b0,corse_sel_muxout[5:1]}  &  {~({5{tstmod_rst_l}} & corse_sel[5:1]),(tstmod_rst_l & ~corse_sel[0])}) | 
                               ({6{l1clk}}  &  {{{5{tstmod_rst_l}} & corse_sel[5:1]},(~(tstmod_rst_l & ~corse_sel[0])) & tstmod_rst_l});

//  
//assign fine_sel_muxout[7:1] = ( ({corse_sel_muxout[0],fine_sel_muxout[7:2]})  &  (~fine_sel[7:1]) )
// | ({&{corse_sel_muxout[0]}}  &  fine_sel[7:1]);


assign fine_sel_muxout[7:1] = ( ({corse_sel_muxout[0],fine_sel_muxout[7:2]})  &  (~fine_sel[7:1]) ) |
({7{corse_sel_muxout[0]}}  &  fine_sel[7:1]);


srlatch1	latch1_31
	(
	.setl (~(l1clk & tstmod_rst_l  &  tst_bnken31_setb)),
	.rstl1 (tstmod_rst_l),
	.rstl2 (l1clk|~tst_bnken31_rstb),
	.out (delayline_en_31)
	);

srlatch1	latch1_02
	(
	.setl (~(l1clk & tstmod_rst_l  &  tst_bnken02_setb)),
	.rstl1 (tstmod_rst_l),
	.rstl2 (l1clk|~tst_bnken02_rstb),
	.out (delayline_en_02)
	);

srlatch2	latch2_31
	(
	.setl1 (~(fine_sel_muxout[1] & delayline_en_31 & ~fine_sel[0])),
	.setl2 (~(corse_sel_muxout[0] & delayline_en_31 & fine_sel[0])),
	.rstl (delayline_en_31),
	.out (fine_dout_31)
	);

srlatch2	latch2_02
	(
	.setl1 (~(fine_sel_muxout[1] & delayline_en_02 & ~fine_sel[0])),
	.setl2 (~(corse_sel_muxout[0] & delayline_en_02 & fine_sel[0])),
	.rstl (delayline_en_02),
	.out (fine_dout_02)
	);

assign delout31_lft = ~fine_dout_31;
assign delout31_rgt = ~fine_dout_31;
assign delout20_lft = ~fine_dout_02;
assign delout20_rgt = ~fine_dout_02;
endmodule  //n2_l2d_tstmod_delay_cust


module srlatch1 (
  setl, 
  rstl1, 
  rstl2, 
  out) ;

  input setl;
  input rstl1;
  input rstl2;
  output out;

reg out;

        always @(setl or rstl1 or rstl2) 
        begin
           if(~setl)  out   =  1'b1;
           else if( ~(rstl1 & rstl2) )  out   =  1'b0;
        end
endmodule // srlatch1


module srlatch2 (
  setl1, 
  setl2, 
  rstl, 
  out) ;

  input setl1;
  input setl2;
  input rstl;
  output out;

reg out;

        always @(setl1 or setl2 or rstl) begin
          if( (setl1==0) || (setl2==0))  out   =  1'b1;
          else if(~rstl)  out   =  1'b0;
        end
endmodule // srlatch2


//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_sp_512kb_cust_and_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






and3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//
//   macro for cl_mc1_tisram_blb_{8,4}x flops
//
//





module n2_l2d_sp_512kb_cust_tisram_blb_macro__dmsff_4x__width_1 (
  d_a, 
  l1clk, 
  q_b);
input [0:0] d_a;
input l1clk;
output [0:0] q_b;






tisram_blb #(1)  d0_0 (
.d(d_a[0:0]),
.l1clk(l1clk),
.latout_l(q_b[0:0])
);










//place::generic_place($width,$stack,$left);

endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_sp_512kb_cust_msff_ctl_macro__fs_1__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;

  input [2:0] din;
  input l1clk;
  input [2:0] scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output [2:0] scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si(scan_in[2:0]),
.so(scan_out[2:0]),
.q(dout[2:0])
);












endmodule









//
//   invert macro
//
//





module n2_l2d_sp_512kb_cust_inv_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule







/* ******************************************** 

TRUTH TABLE FOR CLK OUTPUT

div_en	div_bypass 	div_r	div_f 	cclk	
=========================================
0       0           1        0      gclk	
1       0           div_ph   1      div_ph	
x       1           1        0      gclk

******************************************** */




 
module n2_clk_clstr_hdr_cust (
	gclk,
	l2clk,
	cluster_arst_l,
	ccu_div_ph,
	cluster_div_en,	
	tcu_div_bypass,
	scan_in,
	scan_en,
	tcu_aclk,
	tcu_bclk,
	ccu_cmp_slow_sync_en,
	ccu_slow_cmp_sync_en,
	tcu_pce_ov,
	tcu_clk_stop,
	rst_por_,
	rst_wmr_,
	rst_wmr_protect,
	tcu_wr_inhibit,
	tcu_atpg_mode,
	array_wr_inhibit,
	aclk_wmr,
	aclk,
	bclk,
	cmp_slow_sync_en,
	slow_cmp_sync_en,
	pce_ov,
	por_,
	wmr_,
	wmr_protect,
	scan_out,
	cclk
);

// *******************************
// port declaration
// *******************************
 
input gclk;
input l2clk;
input cluster_arst_l; 
input ccu_div_ph;
input cluster_div_en;	
input tcu_div_bypass;
input scan_in;
input scan_en;
input tcu_aclk;
input tcu_bclk;
input ccu_cmp_slow_sync_en;
input ccu_slow_cmp_sync_en;
input tcu_pce_ov;
input tcu_clk_stop;
input rst_por_;
input rst_wmr_;
input rst_wmr_protect;
input tcu_wr_inhibit;	
input tcu_atpg_mode;			
output array_wr_inhibit;	
output aclk_wmr;
output aclk;
output bclk;
output cmp_slow_sync_en;
output slow_cmp_sync_en;
output pce_ov;
output por_;
output wmr_;
output wmr_protect;
output scan_out;
output cclk;


// *******************************
// wire declaration
// *******************************
 
wire gclk;
wire l2clk;
wire cluster_arst_l; 
wire ccu_div_ph;
wire cluster_div_en;	
wire tcu_div_bypass;
wire scan_in;
wire scan_en;
wire tcu_aclk;
wire tcu_bclk;
wire ccu_cmp_slow_sync_en;
wire ccu_slow_cmp_sync_en;
wire tcu_pce_ov;
wire tcu_clk_stop;
wire rst_por_;
wire rst_wmr_;
wire rst_wmr_protect;
wire tcu_wr_inhibit;	// to be made input
wire tcu_atpg_mode;			// to be made input
wire array_wr_inhibit;	// to be made output
wire aclk_wmr;
wire aclk;
wire bclk;
wire cmp_slow_sync_en;
wire slow_cmp_sync_en;
wire pce_ov;
wire por_;
wire wmr_;
wire wmr_protect;
wire scan_out;
wire cclk;


// additional internal nets 
wire div_r;
// wire div_f; // vlint

wire cluster_div_en_n;
wire tcu_div_bypass_n; 


wire sel0;
wire sel1;
// wire sel2; // vlint

wire div_out;
// wire div_r_n; // vlint
// wire div_f_n; // vlint

// wire gclk_n; // vlint
wire array_wr_inhibit_n;	


wire cclk_n;
wire pre_cclk;
wire div_clk;

wire l1clk;
wire l1gclk;

wire aclk_gated;
wire bclk_gated;
wire scan_en_gated;
wire scan_out_pre_mux;

wire aclk_gated_n;
wire bclk_gated_n;
wire scan_en_gated_n;
wire tcu_atpg_mode_n;

wire scan_ch;

// wire clk_stop_muxed; // vlint
// wire clk_stop_q; // vlint
wire clk_stop_synced;

wire rst_wmr_protect_n;
wire aclk_wmr_n;
wire div_r_sync;
wire sel0_n;
wire sel1_n;
wire div_ph_blatch;
wire div_r_sync_n;
wire div_mux;

// **********************************************************
// buffered & gated stuff 
// **********************************************************

cl_u1_buf_1x aclk_buf ( .in( tcu_aclk ), .out ( aclk ) );
cl_u1_buf_1x bclk_buf ( .in( tcu_bclk ), .out ( bclk ) );
cl_u1_buf_1x pce_ov_buf ( .in( tcu_pce_ov ), .out ( pce_ov ) );
cl_u1_buf_1x wmr_protect_buf ( .in( rst_wmr_protect ), .out ( wmr_protect ) );

// assign aclk_gated = aclk & tcu_atpg_mode;
// assign bclk_gated = bclk & tcu_atpg_mode;
// assign scan_en_gated = scan_en & tcu_atpg_mode;
// implemented right here
cl_u1_nand2_1x aclk_gated_nand ( .in0 (aclk), .in1 (tcu_atpg_mode), .out (aclk_gated_n) );
cl_u1_nand2_1x bclk_gated_nand ( .in0 (bclk), .in1 (tcu_atpg_mode), .out (bclk_gated_n) );
cl_u1_nand2_1x scan_en_gated_nand ( .in0 (scan_en), .in1 (tcu_atpg_mode), .out (scan_en_gated_n) );
cl_u1_inv_1x   aclk_gated_inv  ( .in (aclk_gated_n), .out (aclk_gated) );
cl_u1_inv_1x   bclk_gated_inv  ( .in (bclk_gated_n), .out (bclk_gated) );
cl_u1_inv_1x   scan_en_gated_inv  ( .in (scan_en_gated_n), .out (scan_en_gated) );

// assign scan_out = tcu_atpg_mode ? scan_out_pre_mux : scan_in ;	
// implemented below, and as instance "scan_chain_mux"
cl_u1_inv_1x tcu_atpg_mode_inv ( .in (tcu_atpg_mode) , .out (tcu_atpg_mode_n) );


// assign aclk_wmr = ~rst_wmr_protect & tcu_aclk; 


cl_u1_inv_1x wmr_protect_inv ( .in (rst_wmr_protect) , .out (rst_wmr_protect_n) );

cl_u1_nand2_1x aclk_wmr_gate ( 
	.in0 (aclk), 
	.in1 (rst_wmr_protect_n),
	.out (aclk_wmr_n) 
);

cl_u1_inv_1x aclk_wmr_inv ( .in (aclk_wmr_n) , .out (aclk_wmr) );

// cl_u1_inv_1x gclk_inv ( .in (gclk) , .out (gclk_n) );	// vlint

// **********************************************************
// l1hdr for scan 
// **********************************************************

n2_clk_clstr_hdr_l1hdr gclk_header (
    .l2clk(gclk),
    .l1clk(l1gclk),
    .pce(1'b1),
    .se(scan_en_gated),
    .pce_ov(1'b1),
    .stop(1'b0) // ECO1.2 - not allowed to stop local clocks
);

n2_clk_clstr_hdr_l1hdr l1_header (
    .l2clk(l2clk),
    .l1clk(l1clk),
    .pce(1'b1),
    .se(scan_en_gated),
    .pce_ov(1'b1),
    .stop(1'b0) // ECO1.3 - false info; no action needed
);

// **********************************************************
// make observe flops part of scan chain (observe only)
// **********************************************************

n2_clk_clstr_hdr_obs_flops observe_flops (
	.tcu_clk_stop (tcu_clk_stop),
	.ccu_div_ph (ccu_div_ph),
	.array_wr_inhibit (array_wr_inhibit), 
	.l1clk (l1gclk),
	.aclk (aclk_gated),
	.bclk (bclk_gated),
	.scan_in (scan_in),
	.scan_out (scan_ch)
);

cl_sc1_aomux2_1x scan_chain_mux (
	.sel0 ( tcu_atpg_mode ),
	.sel1 ( tcu_atpg_mode_n ),
	.in0 ( scan_out_pre_mux ),
	.in1 ( scan_in ),
	.out ( scan_out )
);


// **********************************************************
// synchronize the control signals 
// **********************************************************

n2_clk_clstr_hdr_sync control_sig_sync ( 
	.div_r ( div_r_sync ),
	.gclk ( l1gclk ),
	.l1clk ( l1clk ),
	.ccu_slow_cmp_sync_en ( ccu_slow_cmp_sync_en),
	.ccu_cmp_slow_sync_en ( ccu_cmp_slow_sync_en),
	.rst_por_ ( rst_por_),
	.rst_wmr_ ( rst_wmr_),
	.scan_in ( scan_ch ),
	.aclk ( aclk_gated ),
	.bclk ( bclk_gated ),
	.slow_cmp_sync_en ( slow_cmp_sync_en ),
	.cmp_slow_sync_en ( cmp_slow_sync_en ),
	.por_ ( por_ ),
	.wmr_ ( wmr_ ),
	.scan_out ( scan_out_pre_mux )
);


// **********************************************************
// divider & mux model
// **********************************************************

wire ccu_div_ph_ff;
wire ccu_div_ph_flop_unused; 

// first flop ccu_div_ph
cl_sc1_msff_1x ccu_div_ph_flop ( 
	.d ( ccu_div_ph ), 
	.l1clk ( gclk ), 
	.si ( 1'b0 ), 
	.siclk ( 1'b0 ), 
	.soclk ( 1'b0 ), 
	.q ( ccu_div_ph_ff ), 
	.so (ccu_div_ph_flop_unused) 
); 

// div_r = sel1 (ie, ~div_en | tcu_div_bypass ) | div_ph 	
// div_f = sel0 (ie, div_en & ~tcu_div_bypass )
//

// sel0 = ~div_bypass & div_en 		// div_ph select 
// sel1 = div_bypass | ~div_en 		// gclk select

cl_u1_inv_1x  div_bypass_inv ( .in (tcu_div_bypass), .out (tcu_div_bypass_n) );
cl_u1_inv_1x  cluster_div_inv ( .in (cluster_div_en), .out (cluster_div_en_n) );

//
// generate sel0 - div_ph sel 
// 

cl_u1_nand2_1x sel0_n_gen (
	.in0 (tcu_div_bypass_n),
	.in1 (cluster_div_en),
	.out (sel0_n)
);

cl_u1_inv_1x sel0_gen ( .in (sel0_n), .out (sel0) ); 


//
// generate sel1 - gclk sel 
//

cl_u1_nor2_1x sel2_n_gen (
	.in0 (cluster_div_en_n),
	.in1 (tcu_div_bypass),
	.out (sel1_n)
);

cl_u1_inv_1x sel1_gen ( .in (sel1_n), .out (sel1) ); 


// gate off div_r  
//cl_u1_nor2_1x div_r_gate ( 
//	.in0 (sel1),
//	.in1 (div_ph_blatch),
//	.out (div_r_n)
//);
wire blatch_divr_unused;
cl_sc1_blatch_4x blatch_divr (
        .latout(div_ph_blatch), .d(ccu_div_ph_ff), .l1clk (gclk),
        .so (blatch_divr_unused),  .si (1'b0), .siclk(1'b0), .soclk(1'b0) );

//cl_u1_nor2_1x div_r_gate ( 
//	.in0 (sel1),
//	.in1 (div_ph_blatch),
//	.out (div_r_n)
//);

cl_u1_buf_1x div_r_buf ( .in (div_ph_blatch), .out (div_r ) );


//
// divider model  
// 

// creating the div_r_to_syncronizer to mimic generation of
//div_r in schematic.

cl_u1_nor2_1x div_r_sync_gen_nor ( 
	.in0 (sel0_n),
	.in1 (ccu_div_ph_ff),
	.out (div_r_sync_n)
);

cl_u1_inv_1x div_r_sync_gen_inv ( .in (div_r_sync_n), .out (div_r_sync) );

cl_sc1_aomux2_1x alatch_in (
	.sel0 (~sel1 ),
	.sel1 ( sel1 ),
	.in0 ( div_r ),
	.in1 ( div_clk ),
	.out ( div_mux )
);

wire gclk_reset;
wire gclk_reset_n;
cl_u1_nor2_1x  nor_gclk_reset ( .in0 (sel1), .in1 (gclk), .out (gclk_reset_n));
cl_u1_inv_1x  inv_gclk_reset ( .in (gclk_reset_n), .out (gclk_reset));


wire alatch_unused;  
cl_sc1_alatch_4x alatch (
        .q(div_out), .d(div_mux), .l1clk (gclk_reset),
        .so (alatch_unused),  .si (1'b0), .siclk(1'b0), .soclk(1'b0), .se(1'b0) );

// muxed clock out 
cl_sc1_aomux2_1x final_mux (
	.sel0 ( sel0 ),
	.sel1 ( sel1 ),
	.in0 ( div_out ),
	.in1 ( gclk ),
	.out ( div_clk )
);

// **********************************************************
// clkstop for l2clk (via control of cclk) 
// **********************************************************

// 1. sync up clock stop (these are non-scanned)
n2_clk_clstr_hdr_clk_stop_syncff  clk_stop_syncff (
	.din ( tcu_clk_stop ),
	.synced ( clk_stop_synced ), 
	.clkin ( gclk ),
	.sync_clk ( div_clk ),
	.sel ( div_r_sync )

);

wire clk_stop_synced_stg1;
wire clk_stop_synced_stg2;
wire clk_stop_del_stg1_unused;  
wire clk_stop_del_stg2_unused;  
// 2. now delay sync'd up clock stop (these are non-scanned)
cl_sc1_msff_1x clk_stop_del_stg1  (
	.d (clk_stop_synced), .q (clk_stop_synced_stg1), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg1_unused)
);

cl_sc1_msff_1x clk_stop_del_stg2  (
	.d (clk_stop_synced_stg1), .q (clk_stop_synced_stg2), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg2_unused)
);

wire clk_stop_synced_stg2_gated;
wire clk_stop_synced_stg2_n;

cl_u1_inv_1x   clk_stop_stg2_inv ( .in (clk_stop_synced_stg2), .out (clk_stop_synced_stg2_n) );

// ECO1.5 - pushed the gate after the latch in the clk-stop instance "clk_stopper" 
// cl_u1_nor2_1x  clk_stop_stg2_nor ( .in0 (clk_stop_synced_stg2_n), .in1 (tcu_atpg_mode), .out (clk_stop_synced_stg2_gated) );
//
// 3. use blatch & and-gate for controlling clock
n2_clk_clstr_hdr_clkgate clk_stopper (
    .l2clk(div_clk),
    .l1clk(pre_cclk),
    .atpg_mode(tcu_atpg_mode),
    .clken(clk_stop_synced_stg2_n) 
);

// 4. finally gate-off with async reset 
// assign cclk = pre_cclk & cluster_arst_l; 
 
cl_u1_nand2_1x cclk_nand ( .in0 (pre_cclk), .in1 (cluster_arst_l), .out (cclk_n) );
cl_u1_inv_1x   cclk_inv  ( .in (cclk_n), .out (cclk) ); 


// **********************************************************
// array write inhibit operation 
// **********************************************************

wire clk_stop_synced_n; 

wire clk_stop_synced_stg3;
wire clk_stop_synced_stg4;
wire clk_stop_synced_stg5;
 
wire array_wr_inhibit1;
wire array_wr_inhibit2;

wire array_wr_inhibit1_n;
wire array_wr_inhibit2_n;
wire cluster_arst;
wire clk_stop_del_stg3_unused;
wire clk_stop_del_stg4_unused;
wire clk_stop_del_stg5_unused; 

cl_sc1_msff_1x clk_stop_del_stg3  (
	.d (clk_stop_synced_stg2), .q (clk_stop_synced_stg3), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg3_unused)
);

cl_sc1_msff_1x clk_stop_del_stg4  (
	.d (clk_stop_synced_stg3), .q (clk_stop_synced_stg4), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg4_unused)
);

cl_sc1_msff_1x clk_stop_del_stg5  (
	.d (clk_stop_synced_stg4), .q (clk_stop_synced_stg5), .l1clk (div_clk),
	.siclk (1'b0), .soclk (1'b0), .si (1'b0), .so (clk_stop_del_stg5_unused)
);


// assign array_wr_inhibit1 = clk_stop_synced & clk_stop_synced_stg5;

cl_u1_nand3_1x clk_stop_and_delayed ( // ECO1.4 - changed cl_u1_nand2_1x 
	.in0 (clk_stop_synced),
	.in1 (clk_stop_synced_stg5),
	.in2 (tcu_atpg_mode_n),
	.out (array_wr_inhibit1_n)
); 

cl_u1_inv_1x array_wr_inhibit1_inv ( .in(array_wr_inhibit1_n), .out(array_wr_inhibit1) );


// assign array_wr_inhibit2 = (~clk_stop_synced) & wr_inhibit_q2;
cl_u1_inv_1x clk_stop_synced_inv ( .in(clk_stop_synced), .out(clk_stop_synced_n) );

// ECO1.1 - removed nand gate from path of tcu_wr_inhibit
//          and replaced with buffer 
// 
// cl_u1_nand2_1x clk_stop_synced_and_wr_inhibit_q2 (
// 	.in0 (clk_stop_synced_n),
// 	.in1 (tcu_wr_inhibit), // (wr_inhibit_q2),
// 	.out (array_wr_inhibit2_n)
// ); 
//
// cl_u1_inv_1x array_wr_inhibit2_inv ( .in(array_wr_inhibit2_n), .out(array_wr_inhibit2) );
cl_u1_buf_1x array_wr_inhibit2_buf ( .in(tcu_wr_inhibit), .out(array_wr_inhibit2) );


// assign array_wr_inhibit  = array_wr_inhibit1 |  array_wr_inhibit2 | (~cluster_arst_l); 

cl_u1_inv_1x cluster_arst_inv (.in (cluster_arst_l), .out (cluster_arst));

cl_u1_nor3_1x array_wr_inhibit_nor (
	.in0 (array_wr_inhibit1),
	.in1 (array_wr_inhibit2),
	.in2 (cluster_arst),
	.out (array_wr_inhibit_n)
); 

cl_u1_inv_1x array_wr_inhibit_inv (.in (array_wr_inhibit_n), .out (array_wr_inhibit));

endmodule // n2_clk_clstr_hdr_cust 




// **********************************************************
// (fictitous) observe flop module for ATPG purposes 
// **********************************************************

module n2_clk_clstr_hdr_obs_flops (
	tcu_clk_stop,
	ccu_div_ph,
	array_wr_inhibit, 
	l1clk, 
	aclk,
	bclk,
	scan_in,
	scan_out
);

input tcu_clk_stop;
input ccu_div_ph;
input array_wr_inhibit; 
input l1clk;
input aclk;
input bclk;
input scan_in;
output scan_out;

wire tcu_clk_stop;
wire ccu_div_ph;
wire array_wr_inhibit; 
wire l1clk; 
wire aclk;
wire bclk;
wire scan_in;
wire scan_out;

wire scan_ch1;
wire scan_ch2;
wire obs_ff1_unused; 
wire obs_ff2_unused; 
wire obs_ff3_unused; 

cl_sc1_msff_1x obs_ff1 ( 
	.d ( tcu_clk_stop ), 
	.l1clk ( l1clk ), 
	.si ( scan_in ), 
	.siclk ( aclk ), 
	.soclk ( bclk ), 
	.q (obs_ff1_unused ), 
	.so ( scan_ch1 )
); 

cl_sc1_msff_1x obs_ff2 ( 
	.d ( ccu_div_ph ), 
	.l1clk ( l1clk ), 
	.si ( scan_ch1 ), 
	.siclk ( aclk ), 
	.soclk ( bclk ), 
	.q (obs_ff2_unused ), 
	.so ( scan_ch2 )
);

cl_sc1_msff_1x obs_ff3 ( 
	.d ( array_wr_inhibit ), 
	.l1clk ( l1clk ), 
	.si ( scan_ch2 ), 
	.siclk ( aclk ), 
	.soclk ( bclk ), 
	.q (obs_ff3_unused ), 
	.so ( scan_out )
);
endmodule // n2_clk_clstr_hdr_obs_flops 


// **********************************************************
// (fictitous) synchronizer module for ATPG purposes 
// **********************************************************

module n2_clk_clstr_hdr_sync ( 
	div_r,
	gclk,
	l1clk,
	ccu_slow_cmp_sync_en ,
	ccu_cmp_slow_sync_en ,
	rst_por_ ,
	rst_wmr_ ,
	scan_in,
	aclk,
	bclk,
	slow_cmp_sync_en,
	cmp_slow_sync_en,
	por_,
	wmr_,
	scan_out
);


input div_r;
input gclk;
input l1clk;
input ccu_slow_cmp_sync_en ;
input ccu_cmp_slow_sync_en ;
input rst_por_ ;
input rst_wmr_ ;
input scan_in;
input aclk;
input bclk;

output slow_cmp_sync_en;
output cmp_slow_sync_en;
output por_;
output wmr_;
output scan_out;

wire div_r;
// wire div_r_n; // vlint
wire gclk;
// wire gclk_n; // vlint
wire l1clk;

wire ccu_slow_cmp_sync_en ;
wire slow_cmp_sync_en;
wire ccu_cmp_slow_sync_en ;
wire cmp_slow_sync_en;
wire rst_por_ ;
wire por_;

wire rst_wmr_ ;
wire wmr_;

wire scan_in;
wire scan_out;
wire aclk;
wire bclk;

wire scan_ch1;
wire scan_ch2;
wire scan_ch3;


// slow_cmp_sync_en 
n2_clk_clstr_hdr_sync_ff  slow_cmp_sync_en_syncff (
	.din ( ccu_slow_cmp_sync_en ),
	.synced ( slow_cmp_sync_en ), 
	.clkin ( gclk ),
	.sync_clk ( l1clk ),
	.sel ( div_r ),
	.siclk ( aclk ),
	.soclk ( bclk ),
	.si ( scan_in ), 
	.so ( scan_ch1 )
);

// cmp_slow_sync_en 
n2_clk_clstr_hdr_sync_ff  cmp_slow_sync_en_syncff (
	.din ( ccu_cmp_slow_sync_en ),
	.synced ( cmp_slow_sync_en ), 
	.clkin ( gclk ),
	.sync_clk ( l1clk ),
	.sel ( div_r ),
	.siclk ( aclk ),
	.soclk ( bclk ),
	.si ( scan_ch1 ), 
	.so ( scan_ch2 )
);

// por_  
n2_clk_clstr_hdr_sync_ff  por_syncff (
	.din ( rst_por_ ),
	.synced ( por_ ), 
	.clkin ( gclk ),
	.sync_clk ( l1clk ),
	.sel ( div_r ),
	.siclk ( aclk ),
	.soclk ( bclk ),
	.si ( scan_ch2 ), 
	.so ( scan_ch3 )
);

// wmr_  
n2_clk_clstr_hdr_sync_ff  wmr_syncff (
	.din ( rst_wmr_ ),
	.synced ( wmr_ ), 
	.clkin ( gclk ),
	.sync_clk ( l1clk ),
	.sel ( div_r ),
	.siclk ( aclk ),
	.soclk ( bclk ),
	.si ( scan_ch3 ), 
	.so ( scan_out )
);

endmodule // n2_clk_clstr_hdr_sync 


// **********************************************************
// (fictitous) 1-bit synchronizer for ATPG purposes 
// **********************************************************

module n2_clk_clstr_hdr_sync_ff ( 
	din,
	synced,
	clkin,
	sync_clk,
	sel,
	siclk,
	soclk,
	si,
	so
);

input din;
output synced;
input clkin;
input sync_clk;
input siclk;
input soclk;
input si;
output so;
input sel;

wire din;
wire synced;
wire clkin;
wire sync_clk;
wire siclk;
wire soclk;
wire si;
wire so;
wire sel;

wire so_tmp;
wire sel_n;
wire din_q1;
wire din_muxed;

cl_u1_inv_1x sel_inv ( .in ( sel ), .out ( sel_n ) );

cl_sc1_aomux2_1x sync_mux1 (
	.sel0 ( sel_n ),
	.sel1 ( sel ),
	.in0 ( din_q1 ), 
	.in1 ( din ),
	.out ( din_muxed ) 
);

cl_sc1_msff_1x din_stg1 ( 
	.d ( din_muxed ), 
	.l1clk ( clkin ), 
	.si ( si ), 
	.siclk ( siclk ), 
	.soclk ( soclk ), 
	.q ( din_q1 ), 
	.so ( so_tmp )
); 
 
cl_sc1_msff_1x din_stg2 ( 
	.d ( din_q1 ), 
	.l1clk ( sync_clk ), 
	.si ( so_tmp ), 
	.siclk ( siclk ), 
	.soclk ( soclk ), 
	.q ( synced ), 
	.so ( so ) 
); 
endmodule // n2_clk_clstr_hdr_sync_ff 


// **********************************************************
// (fictitous)  module for clock stop sync.
// **********************************************************
module n2_clk_clstr_hdr_clk_stop_syncff  (
	din,
	synced,
	clkin,
	sync_clk,
	sel
);

input din;
output synced;
input clkin;
input sync_clk;
input sel;

wire din;
wire synced;
wire clkin;
wire sync_clk;
wire sel;

wire [2:0] so_unused; 

wire sel_n;
wire  din_q1_lat;
wire din_q1;
wire din_muxed;

cl_u1_inv_1x sel_inv ( .in(sel), .out(sel_n) );

cl_sc1_aomux2_1x sync_mux1 (
	.sel0 ( sel_n ), .sel1 ( sel ),
	.in0 ( din_q1 ), .in1 ( din ),
	.out ( din_muxed ) 
);

cl_sc1_msff_1x din_stg1 ( 
	.d ( din_muxed ), .l1clk ( clkin ), .q ( din_q1 ), 
	.si ( 1'b0 ), .siclk ( 1'b0 ), .soclk ( 1'b0 ),
        .so (so_unused[0])); 

cl_sc1_blatch_4x blatch ( 
	.latout(din_q1_lat), .d(din_q1), .l1clk (clkin), 
	.so (so_unused[1]),  .si (1'b0), .siclk(1'b0), .soclk(1'b0) );

cl_sc1_msff_1x din_stg2 ( 
	.d ( din_q1_lat ), .l1clk ( sync_clk ), .q ( synced ), 
	.siclk ( 1'b0 ), .soclk ( 1'b0 ), .si ( 1'b0 ), .so (so_unused[2] ) ); 

endmodule // n2_clk_clstr_hdr_clk_stop_sync_ff  



module  n2_clk_clstr_hdr_clkgate (
	 atpg_mode,
	 clken,
	 l2clk,
	 l1clk
);

input        atpg_mode;
input        clken;          // clken, active high 
input        l2clk;          // level 2 clock, from clock grid
output       l1clk;

wire         atpg_mode, clken, l2clk, l1clk;

wire  clken_gated;
wire  clken_gated_n;
wire  l1clk_n;
wire  clken_lat;
wire  so_unused;

cl_sc1_blatch_4x blatch ( 
	.latout(clken_lat), .d(clken), .l1clk (l2clk), 
	.so (so_unused),  .si (1'b0), .siclk(1'b0), .soclk(1'b0) );

cl_u1_nor2_1x  clken_nor ( .in0(clken_lat), .in1(atpg_mode), .out(clken_gated_n) );
cl_u1_inv_1x   clken_gated_inv ( .in(clken_gated_n), .out(clken_gated) );

cl_u1_nand2_1x clk_nand ( .in0(clken_gated), .in1(l2clk), .out(l1clk_n) );
cl_u1_inv_1x   clk_inv  ( .in(l1clk_n), .out(l1clk) );

endmodule // n2_clk_clstr_hdr_clkgate 

module  n2_clk_clstr_hdr_l1hdr (
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 l1clk
                );

   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   output       l1clk;

 reg l1en;

   always @ (l2clk or stop or pce or pce_ov ) begin  // vlint fix - latch model
		if (!l2clk) 
           l1en = (~stop & ( pce | pce_ov ));	 // vlint fix - replaced w/blocking 
   end

   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule // n2_clk_clstr_hdr_l1hdr 





 


module n2_clk_l2d_cmp_cust (
	cclk,
	l2clk
);

input 	cclk;
output 	l2clk;

wire	cclk;
wire	l2clk;

assign #1 l2clk = cclk; 
				
endmodule



