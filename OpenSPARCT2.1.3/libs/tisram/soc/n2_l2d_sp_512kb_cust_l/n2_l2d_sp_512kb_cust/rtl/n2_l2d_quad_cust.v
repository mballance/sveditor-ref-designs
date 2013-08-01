// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2d_quad_cust.v
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



n2_l2d_quad_cust_or_macro__ports_3__width_20  or_ldout0lo_b	
	(
	.dout	(ldout0lo_b[19:0]),
	.din0	(sat_lo0_bc[19:0]),
	.din1	(sab_lo0_bc[19:0]),
	.din2	(ldin0lo_b[19:0])
	);

n2_l2d_quad_cust_or_macro__ports_3__width_20  or_ldout0hi_b       
        (
        .dout   (ldout0hi_b[19:0]),
        .din0   (sat_hi0_bc[19:0]),
        .din1   (sab_hi0_bc[19:0]),
        .din2   (ldin0hi_b[19:0])
        );

n2_l2d_quad_cust_or_macro__ports_3__width_19  or_ldout1lo_b       
        (
        .dout   (ldout1lo_b[18:0]),
        .din0   (sat_lo1_bc[18:0]),
        .din1   (sab_lo1_bc[18:0]),
        .din2   (ldin1lo_b[18:0])
        );


n2_l2d_quad_cust_or_macro__ports_3__width_19  or_ldout1hi_b       
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





module n2_l2d_quad_cust_or_macro__ports_3__width_20 (
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





module n2_l2d_quad_cust_or_macro__ports_3__width_19 (
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




