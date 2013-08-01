// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: efu_l2t_ctl.v
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
module efu_l2t_ctl (
  read_data_ff_vld, 
  cmp_mrd_cnt_done, 
  efu_spc1357_fuse_data, 
  efu_spc0246_fuse_data, 
  efu_spc0_fuse_ixfer_en, 
  efu_spc1_fuse_ixfer_en, 
  efu_spc2_fuse_ixfer_en, 
  efu_spc3_fuse_ixfer_en, 
  efu_spc4_fuse_ixfer_en, 
  efu_spc5_fuse_ixfer_en, 
  efu_spc6_fuse_ixfer_en, 
  efu_spc7_fuse_ixfer_en, 
  efu_spc0_fuse_dxfer_en, 
  efu_spc1_fuse_dxfer_en, 
  efu_spc2_fuse_dxfer_en, 
  efu_spc3_fuse_dxfer_en, 
  efu_spc4_fuse_dxfer_en, 
  efu_spc5_fuse_dxfer_en, 
  efu_spc6_fuse_dxfer_en, 
  efu_spc7_fuse_dxfer_en, 
  spc0_efu_fuse_dxfer_en, 
  spc1_efu_fuse_dxfer_en, 
  spc2_efu_fuse_dxfer_en, 
  spc3_efu_fuse_dxfer_en, 
  spc4_efu_fuse_dxfer_en, 
  spc5_efu_fuse_dxfer_en, 
  spc6_efu_fuse_dxfer_en, 
  spc7_efu_fuse_dxfer_en, 
  spc0_efu_fuse_ixfer_en, 
  spc1_efu_fuse_ixfer_en, 
  spc2_efu_fuse_ixfer_en, 
  spc3_efu_fuse_ixfer_en, 
  spc4_efu_fuse_ixfer_en, 
  spc5_efu_fuse_ixfer_en, 
  spc6_efu_fuse_ixfer_en, 
  spc7_efu_fuse_ixfer_en, 
  spc0_efu_fuse_ddata, 
  spc1_efu_fuse_ddata, 
  spc2_efu_fuse_ddata, 
  spc3_efu_fuse_ddata, 
  spc4_efu_fuse_ddata, 
  spc5_efu_fuse_ddata, 
  spc6_efu_fuse_ddata, 
  spc7_efu_fuse_ddata, 
  spc0_efu_fuse_idata, 
  spc1_efu_fuse_idata, 
  spc2_efu_fuse_idata, 
  spc3_efu_fuse_idata, 
  spc4_efu_fuse_idata, 
  spc5_efu_fuse_idata, 
  spc6_efu_fuse_idata, 
  spc7_efu_fuse_idata, 
  efu_l2b0246_fuse_data, 
  efu_l2b1357_fuse_data, 
  efu_l2b0_fuse_xfer_en, 
  efu_l2b1_fuse_xfer_en, 
  efu_l2b2_fuse_xfer_en, 
  efu_l2b3_fuse_xfer_en, 
  efu_l2b4_fuse_xfer_en, 
  efu_l2b5_fuse_xfer_en, 
  efu_l2b6_fuse_xfer_en, 
  efu_l2b7_fuse_xfer_en, 
  l2b0_efu_fuse_xfer_en, 
  l2b1_efu_fuse_xfer_en, 
  l2b2_efu_fuse_xfer_en, 
  l2b3_efu_fuse_xfer_en, 
  l2b4_efu_fuse_xfer_en, 
  l2b5_efu_fuse_xfer_en, 
  l2b6_efu_fuse_xfer_en, 
  l2b7_efu_fuse_xfer_en, 
  l2b0_efu_fuse_data, 
  l2b1_efu_fuse_data, 
  l2b2_efu_fuse_data, 
  l2b3_efu_fuse_data, 
  l2b4_efu_fuse_data, 
  l2b5_efu_fuse_data, 
  l2b6_efu_fuse_data, 
  l2b7_efu_fuse_data, 
  efu_l2t0246_fuse_data, 
  efu_l2t1357_fuse_data, 
  efu_l2t0_fuse_xfer_en, 
  efu_l2t1_fuse_xfer_en, 
  efu_l2t2_fuse_xfer_en, 
  efu_l2t3_fuse_xfer_en, 
  efu_l2t4_fuse_xfer_en, 
  efu_l2t5_fuse_xfer_en, 
  efu_l2t6_fuse_xfer_en, 
  efu_l2t7_fuse_xfer_en, 
  l2t0_efu_fuse_xfer_en, 
  l2t1_efu_fuse_xfer_en, 
  l2t2_efu_fuse_xfer_en, 
  l2t3_efu_fuse_xfer_en, 
  l2t4_efu_fuse_xfer_en, 
  l2t5_efu_fuse_xfer_en, 
  l2t6_efu_fuse_xfer_en, 
  l2t7_efu_fuse_xfer_en, 
  l2t0_efu_fuse_data, 
  l2t1_efu_fuse_data, 
  l2t2_efu_fuse_data, 
  l2t3_efu_fuse_data, 
  l2t4_efu_fuse_data, 
  l2t5_efu_fuse_data, 
  l2t6_efu_fuse_data, 
  l2t7_efu_fuse_data, 
  read_data_ff, 
  shift_data_ff_out, 
  load_l2_read_data, 
  iol2clk, 
  l2clk, 
  cmp_io_sync_en, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  scan_in, 
  scan_out);
wire pce_ov;
wire siclk;
wire soclk;
wire stop;
wire se;
wire l1clk;
wire l1clk_cmp;
wire ff_cmp_io_sync_en_scanin;
wire ff_cmp_io_sync_en_scanout;
wire cmp_io_sync_en_r1;
wire [7:0] l2b_xfer_en;
wire [7:0] l2t_xfer_en;
wire [7:0] spc_dxfer_en;
wire [7:0] spc_ixfer_en;
wire [7:0] spc_idata;
wire [7:0] spc_ddata;
wire [7:0] l2t_data;
wire [7:0] l2b_data;
wire ff_l2b_xfer_en_scanin;
wire ff_l2b_xfer_en_scanout;
wire [7:0] l2b_xfer_en_q;
wire ff_l2t_xfer_en_scanin;
wire ff_l2t_xfer_en_scanout;
wire [7:0] l2t_xfer_en_q;
wire ff_spc_dxfer_en_scanin;
wire ff_spc_dxfer_en_scanout;
wire [7:0] spc_dxfer_en_q;
wire ff_spc_ixfer_en_scanin;
wire ff_spc_ixfer_en_scanout;
wire [7:0] spc_ixfer_en_q;
wire ff_spc_idata_scanin;
wire ff_spc_idata_scanout;
wire [7:0] spc_idata_q;
wire ff_spc_ddata_scanin;
wire ff_spc_ddata_scanout;
wire [7:0] spc_ddata_q;
wire ff_l2t_data_scanin;
wire ff_l2t_data_scanout;
wire [7:0] l2t_data_q;
wire ff_l2b_data_scanin;
wire ff_l2b_data_scanout;
wire [7:0] l2b_data_q;
wire read_data_in;
wire efu_xfer_out;
wire read_data_in_r1;
wire read_data_in_r2;
wire ff_xfer_out_r2_scanin;
wire ff_xfer_out_r2_scanout;
wire ff_xfer_out_r1_scanin;
wire ff_xfer_out_r1_scanout;
wire ff_read_data_in_scanin;
wire ff_read_data_in_scanout;
wire read_data_in_reg;
wire [31:0] shift_data_ff_in;
wire cmp_read_data_ff_vld_reg;
wire shift_in_reg;
wire ff_cmp_read_data_ff_vld_scanin;
wire ff_cmp_read_data_ff_vld_scanout;
wire cmp_read_data_ff_vld;
wire ff_read_data_ff_sync_scanin;
wire ff_read_data_ff_sync_scanout;
wire ff_shhift_data_ff_sync_scanin;
wire ff_shhift_data_ff_sync_scanout;
wire mrd_cnt_reg_scanin;
wire mrd_cnt_reg_scanout;
wire computed_parity;
wire good_parity;
wire any_cnt_other_than_zero;
wire local_fuse_ashift_nxt;
wire local_fuse_ashift_d1;
wire local_fuse_dshift_nxt;
wire local_fuse_ashift_ff_scanin;
wire local_fuse_ashift_ff_scanout;
wire local_fuse_data_ff;
wire [5:0] block_id;
wire spc0_ifuse_dec;
wire spc0_dfuse_dec;
wire spc1_ifuse_dec;
wire spc1_dfuse_dec;
wire spc2_ifuse_dec;
wire spc2_dfuse_dec;
wire spc3_ifuse_dec;
wire spc3_dfuse_dec;
wire spc4_ifuse_dec;
wire spc4_dfuse_dec;
wire spc5_ifuse_dec;
wire spc5_dfuse_dec;
wire spc6_ifuse_dec;
wire spc6_dfuse_dec;
wire spc7_ifuse_dec;
wire spc7_dfuse_dec;
wire l2t0_fuse_dec;
wire l2t1_fuse_dec;
wire l2t2_fuse_dec;
wire l2t3_fuse_dec;
wire l2t4_fuse_dec;
wire l2t5_fuse_dec;
wire l2t6_fuse_dec;
wire l2t7_fuse_dec;
wire l2d0_fuse_dec;
wire l2d1_fuse_dec;
wire l2d2_fuse_dec;
wire l2d3_fuse_dec;
wire l2d4_fuse_dec;
wire l2d5_fuse_dec;
wire l2d6_fuse_dec;
wire l2d7_fuse_dec;
wire data_vld_datareg_scanin;
wire data_vld_datareg_scanout;
wire shift_in;
wire spc0_ifuse_ashift_reg_scanin;
wire spc0_ifuse_ashift_reg_scanout;
wire efu_spc0_ifuse_ashift;
wire spc0_ifuse_dshift_reg_scanin;
wire spc0_ifuse_dshift_reg_scanout;
wire efu_spc0_ifuse_dshift;
wire spc0_dfuse_ashift_reg_scanin;
wire spc0_dfuse_ashift_reg_scanout;
wire efu_spc0_dfuse_ashift;
wire spc0_dfuse_dshift_reg_scanin;
wire spc0_dfuse_dshift_reg_scanout;
wire efu_spc0_dfuse_dshift;
wire spc1_ifuse_ashift_reg_scanin;
wire spc1_ifuse_ashift_reg_scanout;
wire efu_spc1_ifuse_ashift;
wire spc1_ifuse_dshift_reg_scanin;
wire spc1_ifuse_dshift_reg_scanout;
wire efu_spc1_ifuse_dshift;
wire spc1_dfuse_ashift_reg_scanin;
wire spc1_dfuse_ashift_reg_scanout;
wire efu_spc1_dfuse_ashift;
wire spc1_dfuse_dshift_reg_scanin;
wire spc1_dfuse_dshift_reg_scanout;
wire efu_spc1_dfuse_dshift;
wire spc2_ifuse_ashift_reg_scanin;
wire spc2_ifuse_ashift_reg_scanout;
wire efu_spc2_ifuse_ashift;
wire spc2_ifuse_dshift_reg_scanin;
wire spc2_ifuse_dshift_reg_scanout;
wire efu_spc2_ifuse_dshift;
wire spc2_dfuse_ashift_reg_scanin;
wire spc2_dfuse_ashift_reg_scanout;
wire efu_spc2_dfuse_ashift;
wire spc2_dfuse_dshift_reg_scanin;
wire spc2_dfuse_dshift_reg_scanout;
wire efu_spc2_dfuse_dshift;
wire spc3_ifuse_ashift_reg_scanin;
wire spc3_ifuse_ashift_reg_scanout;
wire efu_spc3_ifuse_ashift;
wire spc3_ifuse_dshift_reg_scanin;
wire spc3_ifuse_dshift_reg_scanout;
wire efu_spc3_ifuse_dshift;
wire spc3_dfuse_ashift_reg_scanin;
wire spc3_dfuse_ashift_reg_scanout;
wire efu_spc3_dfuse_ashift;
wire spc3_dfuse_dshift_reg_scanin;
wire spc3_dfuse_dshift_reg_scanout;
wire efu_spc3_dfuse_dshift;
wire spc4_ifuse_ashift_reg_scanin;
wire spc4_ifuse_ashift_reg_scanout;
wire efu_spc4_ifuse_ashift;
wire spc4_ifuse_dshift_reg_scanin;
wire spc4_ifuse_dshift_reg_scanout;
wire efu_spc4_ifuse_dshift;
wire spc4_dfuse_ashift_reg_scanin;
wire spc4_dfuse_ashift_reg_scanout;
wire efu_spc4_dfuse_ashift;
wire spc4_dfuse_dshift_reg_scanin;
wire spc4_dfuse_dshift_reg_scanout;
wire efu_spc4_dfuse_dshift;
wire spc5_ifuse_ashift_reg_scanin;
wire spc5_ifuse_ashift_reg_scanout;
wire efu_spc5_ifuse_ashift;
wire spc5_ifuse_dshift_reg_scanin;
wire spc5_ifuse_dshift_reg_scanout;
wire efu_spc5_ifuse_dshift;
wire spc5_dfuse_ashift_reg_scanin;
wire spc5_dfuse_ashift_reg_scanout;
wire efu_spc5_dfuse_ashift;
wire spc5_dfuse_dshift_reg_scanin;
wire spc5_dfuse_dshift_reg_scanout;
wire efu_spc5_dfuse_dshift;
wire spc6_ifuse_ashift_reg_scanin;
wire spc6_ifuse_ashift_reg_scanout;
wire efu_spc6_ifuse_ashift;
wire spc6_ifuse_dshift_reg_scanin;
wire spc6_ifuse_dshift_reg_scanout;
wire efu_spc6_ifuse_dshift;
wire spc6_dfuse_ashift_reg_scanin;
wire spc6_dfuse_ashift_reg_scanout;
wire efu_spc6_dfuse_ashift;
wire spc6_dfuse_dshift_reg_scanin;
wire spc6_dfuse_dshift_reg_scanout;
wire efu_spc6_dfuse_dshift;
wire spc7_ifuse_ashift_reg_scanin;
wire spc7_ifuse_ashift_reg_scanout;
wire efu_spc7_ifuse_ashift;
wire spc7_ifuse_dshift_reg_scanin;
wire spc7_ifuse_dshift_reg_scanout;
wire efu_spc7_ifuse_dshift;
wire spc7_dfuse_ashift_reg_scanin;
wire spc7_dfuse_ashift_reg_scanout;
wire efu_spc7_dfuse_ashift;
wire spc7_dfuse_dshift_reg_scanin;
wire spc7_dfuse_dshift_reg_scanout;
wire efu_spc7_dfuse_dshift;
wire l2t0_fuse_ashift_reg_scanin;
wire l2t0_fuse_ashift_reg_scanout;
wire efu_l2t0_fuse_ashift;
wire l2t0_fuse_dshift_reg_scanin;
wire l2t0_fuse_dshift_reg_scanout;
wire efu_l2t0_fuse_dshift;
wire l2t1_fuse_ashift_reg_scanin;
wire l2t1_fuse_ashift_reg_scanout;
wire efu_l2t1_fuse_ashift;
wire l2t1_fuse_dshift_reg_scanin;
wire l2t1_fuse_dshift_reg_scanout;
wire efu_l2t1_fuse_dshift;
wire l2t2_fuse_ashift_reg_scanin;
wire l2t2_fuse_ashift_reg_scanout;
wire efu_l2t2_fuse_ashift;
wire l2t2_fuse_dshift_reg_scanin;
wire l2t2_fuse_dshift_reg_scanout;
wire efu_l2t2_fuse_dshift;
wire l2t3_fuse_ashift_reg_scanin;
wire l2t3_fuse_ashift_reg_scanout;
wire efu_l2t3_fuse_ashift;
wire l2t3_fuse_dshift_reg_scanin;
wire l2t3_fuse_dshift_reg_scanout;
wire efu_l2t3_fuse_dshift;
wire l2t4_fuse_ashift_reg_scanin;
wire l2t4_fuse_ashift_reg_scanout;
wire efu_l2t4_fuse_ashift;
wire l2t4_fuse_dshift_reg_scanin;
wire l2t4_fuse_dshift_reg_scanout;
wire efu_l2t4_fuse_dshift;
wire l2t5_fuse_ashift_reg_scanin;
wire l2t5_fuse_ashift_reg_scanout;
wire efu_l2t5_fuse_ashift;
wire l2t5_fuse_dshift_reg_scanin;
wire l2t5_fuse_dshift_reg_scanout;
wire efu_l2t5_fuse_dshift;
wire l2t6_fuse_ashift_reg_scanin;
wire l2t6_fuse_ashift_reg_scanout;
wire efu_l2t6_fuse_ashift;
wire l2t6_fuse_dshift_reg_scanin;
wire l2t6_fuse_dshift_reg_scanout;
wire efu_l2t6_fuse_dshift;
wire l2t7_fuse_ashift_reg_scanin;
wire l2t7_fuse_ashift_reg_scanout;
wire efu_l2t7_fuse_ashift;
wire l2t7_fuse_dshift_reg_scanin;
wire l2t7_fuse_dshift_reg_scanout;
wire efu_l2t7_fuse_dshift;
wire l2d0_fuse_ashift_reg_scanin;
wire l2d0_fuse_ashift_reg_scanout;
wire efu_l2d0_fuse_ashift;
wire l2d0_fuse_dshift_reg_scanin;
wire l2d0_fuse_dshift_reg_scanout;
wire efu_l2d0_fuse_dshift;
wire l2d1_fuse_ashift_reg_scanin;
wire l2d1_fuse_ashift_reg_scanout;
wire efu_l2d1_fuse_ashift;
wire l2d1_fuse_dshift_reg_scanin;
wire l2d1_fuse_dshift_reg_scanout;
wire efu_l2d1_fuse_dshift;
wire l2d2_fuse_ashift_reg_scanin;
wire l2d2_fuse_ashift_reg_scanout;
wire efu_l2d2_fuse_ashift;
wire l2d2_fuse_dshift_reg_scanin;
wire l2d2_fuse_dshift_reg_scanout;
wire efu_l2d2_fuse_dshift;
wire l2d3_fuse_ashift_reg_scanin;
wire l2d3_fuse_ashift_reg_scanout;
wire efu_l2d3_fuse_ashift;
wire l2d3_fuse_dshift_reg_scanin;
wire l2d3_fuse_dshift_reg_scanout;
wire efu_l2d3_fuse_dshift;
wire l2d4_fuse_ashift_reg_scanin;
wire l2d4_fuse_ashift_reg_scanout;
wire efu_l2d4_fuse_ashift;
wire l2d4_fuse_dshift_reg_scanin;
wire l2d4_fuse_dshift_reg_scanout;
wire efu_l2d4_fuse_dshift;
wire l2d5_fuse_ashift_reg_scanin;
wire l2d5_fuse_ashift_reg_scanout;
wire efu_l2d5_fuse_ashift;
wire l2d5_fuse_dshift_reg_scanin;
wire l2d5_fuse_dshift_reg_scanout;
wire efu_l2d5_fuse_dshift;
wire l2d6_fuse_ashift_reg_scanin;
wire l2d6_fuse_ashift_reg_scanout;
wire efu_l2d6_fuse_ashift;
wire l2d6_fuse_dshift_reg_scanin;
wire l2d6_fuse_dshift_reg_scanout;
wire efu_l2d6_fuse_dshift;
wire l2d7_fuse_ashift_reg_scanin;
wire l2d7_fuse_ashift_reg_scanout;
wire efu_l2d7_fuse_ashift;
wire l2d7_fuse_dshift_reg_scanin;
wire l2d7_fuse_dshift_reg_scanout;
wire efu_l2d7_fuse_dshift;
wire cmp_read_data_ff_vld_0_reg_scanin;
wire cmp_read_data_ff_vld_0_reg_scanout;
wire cmp_read_data_ff_vld_0;
wire cmp_read_data_ff_vld_1_reg_scanin;
wire cmp_read_data_ff_vld_1_reg_scanout;
wire cmp_read_data_ff_vld_1;
wire spares_scanin;
wire spares_scanout;


//input          cmp_read_data_ff_vld;
input           read_data_ff_vld;
output		cmp_mrd_cnt_done;


// Interface with Sparc cores 0 to 7
output          efu_spc1357_fuse_data;
output          efu_spc0246_fuse_data;
output          efu_spc0_fuse_ixfer_en;
output          efu_spc1_fuse_ixfer_en;
output          efu_spc2_fuse_ixfer_en;
output          efu_spc3_fuse_ixfer_en;
output          efu_spc4_fuse_ixfer_en;
output          efu_spc5_fuse_ixfer_en;
output          efu_spc6_fuse_ixfer_en;
output          efu_spc7_fuse_ixfer_en;
output          efu_spc0_fuse_dxfer_en;
output          efu_spc1_fuse_dxfer_en;
output          efu_spc2_fuse_dxfer_en;
output          efu_spc3_fuse_dxfer_en;
output          efu_spc4_fuse_dxfer_en;
output          efu_spc5_fuse_dxfer_en;
output          efu_spc6_fuse_dxfer_en;
output          efu_spc7_fuse_dxfer_en;
input           spc0_efu_fuse_dxfer_en;
input           spc1_efu_fuse_dxfer_en;
input           spc2_efu_fuse_dxfer_en;
input           spc3_efu_fuse_dxfer_en;
input           spc4_efu_fuse_dxfer_en;
input           spc5_efu_fuse_dxfer_en;
input           spc6_efu_fuse_dxfer_en;
input           spc7_efu_fuse_dxfer_en;
input           spc0_efu_fuse_ixfer_en;
input           spc1_efu_fuse_ixfer_en;
input           spc2_efu_fuse_ixfer_en;
input           spc3_efu_fuse_ixfer_en;
input           spc4_efu_fuse_ixfer_en;
input           spc5_efu_fuse_ixfer_en;
input           spc6_efu_fuse_ixfer_en;
input           spc7_efu_fuse_ixfer_en;
input           spc0_efu_fuse_ddata;
input           spc1_efu_fuse_ddata;
input           spc2_efu_fuse_ddata;
input           spc3_efu_fuse_ddata;
input           spc4_efu_fuse_ddata;
input           spc5_efu_fuse_ddata;
input           spc6_efu_fuse_ddata;
input           spc7_efu_fuse_ddata;
input           spc0_efu_fuse_idata;
input           spc1_efu_fuse_idata;
input           spc2_efu_fuse_idata;
input           spc3_efu_fuse_idata;
input           spc4_efu_fuse_idata;
input           spc5_efu_fuse_idata;
input           spc6_efu_fuse_idata;
input           spc7_efu_fuse_idata;
// Interface with l2b for data array repair
output          efu_l2b0246_fuse_data;
output          efu_l2b1357_fuse_data;
output          efu_l2b0_fuse_xfer_en;
output          efu_l2b1_fuse_xfer_en;
output          efu_l2b2_fuse_xfer_en;
output          efu_l2b3_fuse_xfer_en;
output          efu_l2b4_fuse_xfer_en;
output          efu_l2b5_fuse_xfer_en;
output          efu_l2b6_fuse_xfer_en;
output          efu_l2b7_fuse_xfer_en;
input           l2b0_efu_fuse_xfer_en;
input           l2b1_efu_fuse_xfer_en;
input           l2b2_efu_fuse_xfer_en;
input           l2b3_efu_fuse_xfer_en;
input           l2b4_efu_fuse_xfer_en;
input           l2b5_efu_fuse_xfer_en;
input           l2b6_efu_fuse_xfer_en;
input           l2b7_efu_fuse_xfer_en;
input           l2b0_efu_fuse_data;
input           l2b1_efu_fuse_data;
input           l2b2_efu_fuse_data;
input           l2b3_efu_fuse_data;
input           l2b4_efu_fuse_data;
input           l2b5_efu_fuse_data;
input           l2b6_efu_fuse_data;
input           l2b7_efu_fuse_data;
output                efu_l2t0246_fuse_data;
output                efu_l2t1357_fuse_data;
output                efu_l2t0_fuse_xfer_en;
output                efu_l2t1_fuse_xfer_en;
output                efu_l2t2_fuse_xfer_en;
output                efu_l2t3_fuse_xfer_en;
output                efu_l2t4_fuse_xfer_en;
output                efu_l2t5_fuse_xfer_en;
output                efu_l2t6_fuse_xfer_en;
output                efu_l2t7_fuse_xfer_en;
input                 l2t0_efu_fuse_xfer_en;
input                 l2t1_efu_fuse_xfer_en;
input                 l2t2_efu_fuse_xfer_en;
input                 l2t3_efu_fuse_xfer_en;
input                 l2t4_efu_fuse_xfer_en;
input                 l2t5_efu_fuse_xfer_en;
input                 l2t6_efu_fuse_xfer_en;
input                 l2t7_efu_fuse_xfer_en;
input                 l2t0_efu_fuse_data;
input                 l2t1_efu_fuse_data;
input                 l2t2_efu_fuse_data;
input                 l2t3_efu_fuse_data;
input                 l2t4_efu_fuse_data;
input                 l2t5_efu_fuse_data;
input                 l2t6_efu_fuse_data;
input                 l2t7_efu_fuse_data;






input   [31:0]  read_data_ff;
output  [31:0]	shift_data_ff_out;
output		load_l2_read_data;

input           iol2clk;
input           l2clk;

input		cmp_io_sync_en;


input           tcu_pce_ov;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           scan_in;
output          scan_out;

 
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign stop = 1'b0;
assign se = tcu_scan_en;

wire [31:0] read_data_ff_sync;


efu_l2t_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(iol2clk),
        .l1en (1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

efu_l2t_ctl_l1clkhdr_ctl_macro clkgen_cmp (
        .l2clk(l2clk),
        .l1en (1'b1 ),
        .l1clk(l1clk_cmp),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

efu_l2t_ctl_msff_ctl_macro__width_1	ff_cmp_io_sync_en 
	(
        .scan_in(ff_cmp_io_sync_en_scanin),
	.scan_out(ff_cmp_io_sync_en_scanout),
	.din	 (cmp_io_sync_en),
	.dout	 (cmp_io_sync_en_r1),
	.l1clk	 (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

assign l2b_xfer_en[7:0] = {l2b7_efu_fuse_xfer_en , l2b6_efu_fuse_xfer_en , 
                            l2b5_efu_fuse_xfer_en , l2b4_efu_fuse_xfer_en , 
                            l2b3_efu_fuse_xfer_en , l2b2_efu_fuse_xfer_en , 
                            l2b1_efu_fuse_xfer_en , l2b0_efu_fuse_xfer_en};
assign l2t_xfer_en[7:0] = {l2t7_efu_fuse_xfer_en, l2t6_efu_fuse_xfer_en , 
                            l2t5_efu_fuse_xfer_en , l2t4_efu_fuse_xfer_en , 
                            l2t3_efu_fuse_xfer_en , l2t2_efu_fuse_xfer_en , 
                            l2t1_efu_fuse_xfer_en , l2t0_efu_fuse_xfer_en};
assign spc_dxfer_en[7:0] = {spc7_efu_fuse_dxfer_en, spc6_efu_fuse_dxfer_en , 
                             spc5_efu_fuse_dxfer_en , spc4_efu_fuse_dxfer_en , 
                             spc3_efu_fuse_dxfer_en , spc2_efu_fuse_dxfer_en , 
                             spc1_efu_fuse_dxfer_en , spc0_efu_fuse_dxfer_en}; 
assign spc_ixfer_en[7:0] = {spc7_efu_fuse_ixfer_en, spc6_efu_fuse_ixfer_en ,
                             spc5_efu_fuse_ixfer_en , spc4_efu_fuse_ixfer_en , 
                             spc3_efu_fuse_ixfer_en , spc2_efu_fuse_ixfer_en , 
	                     spc1_efu_fuse_ixfer_en , spc0_efu_fuse_ixfer_en};

assign spc_idata[7:0] = {spc7_efu_fuse_idata, spc6_efu_fuse_idata,
                          spc5_efu_fuse_idata, spc4_efu_fuse_idata, 
                          spc3_efu_fuse_idata, spc2_efu_fuse_idata, 
                          spc1_efu_fuse_idata, spc0_efu_fuse_idata};

assign spc_ddata[7:0] = {spc7_efu_fuse_ddata, spc6_efu_fuse_ddata,
                          spc5_efu_fuse_ddata, spc4_efu_fuse_ddata, 
                          spc3_efu_fuse_ddata, spc2_efu_fuse_ddata, 
                          spc1_efu_fuse_ddata, spc0_efu_fuse_ddata};
assign l2t_data[7:0] = {l2t7_efu_fuse_data, l2t6_efu_fuse_data,
                         l2t5_efu_fuse_data, l2t4_efu_fuse_data,
                         l2t3_efu_fuse_data, l2t2_efu_fuse_data,
                         l2t1_efu_fuse_data, l2t0_efu_fuse_data};
assign l2b_data[7:0] = {l2b7_efu_fuse_data, l2b6_efu_fuse_data,
                         l2b5_efu_fuse_data, l2b4_efu_fuse_data,
                         l2b3_efu_fuse_data, l2b2_efu_fuse_data,
                         l2b1_efu_fuse_data, l2b0_efu_fuse_data};

efu_l2t_ctl_msff_ctl_macro__en_1__width_8	ff_l2b_xfer_en    
	(
        .scan_in(ff_l2b_xfer_en_scanin),
	.scan_out(ff_l2b_xfer_en_scanout),
	.dout	(l2b_xfer_en_q[7:0]),
	.din	(l2b_xfer_en[7:0]),
	.en	(cmp_io_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_l2t_ctl_msff_ctl_macro__en_1__width_8	ff_l2t_xfer_en    
	(
        .scan_in(ff_l2t_xfer_en_scanin),
	.scan_out(ff_l2t_xfer_en_scanout),
	.dout	(l2t_xfer_en_q[7:0]),
	.din	(l2t_xfer_en[7:0]),
	.en	(cmp_io_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_l2t_ctl_msff_ctl_macro__en_1__width_8	ff_spc_dxfer_en    
	(
        .scan_in(ff_spc_dxfer_en_scanin),
	.scan_out(ff_spc_dxfer_en_scanout),
	.dout	(spc_dxfer_en_q[7:0]),
	.din	(spc_dxfer_en[7:0]),
	.en	(cmp_io_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_l2t_ctl_msff_ctl_macro__en_1__width_8	ff_spc_ixfer_en    
	(
        .scan_in(ff_spc_ixfer_en_scanin),
	.scan_out(ff_spc_ixfer_en_scanout),
	.dout	(spc_ixfer_en_q[7:0]),
	.din	(spc_ixfer_en[7:0]),
	.en	(cmp_io_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_l2t_ctl_msff_ctl_macro__en_1__width_8	ff_spc_idata    
	(
        .scan_in(ff_spc_idata_scanin),
	.scan_out(ff_spc_idata_scanout),
	.dout	(spc_idata_q[7:0]),
	.din	(spc_idata[7:0]),
	.en	(cmp_io_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_l2t_ctl_msff_ctl_macro__en_1__width_8	ff_spc_ddata    
	(
        .scan_in(ff_spc_ddata_scanin),
	.scan_out(ff_spc_ddata_scanout),
	.dout	(spc_ddata_q[7:0]),
	.din	(spc_ddata[7:0]),
	.en	(cmp_io_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_l2t_ctl_msff_ctl_macro__en_1__width_8	ff_l2t_data    
	(
        .scan_in(ff_l2t_data_scanin),
	.scan_out(ff_l2t_data_scanout),
	.dout	(l2t_data_q[7:0]),
	.din	(l2t_data[7:0]),
	.en	(cmp_io_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_l2t_ctl_msff_ctl_macro__en_1__width_8	ff_l2b_data    
	(
        .scan_in(ff_l2b_data_scanin),
	.scan_out(ff_l2b_data_scanout),
	.dout	(l2b_data_q[7:0]),
	.din	(l2b_data[7:0]),
	.en	(cmp_io_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);


assign read_data_in = l2b_xfer_en_q[0] | l2b_xfer_en_q[1] |
	l2b_xfer_en_q[2]  | l2b_xfer_en_q[3]  | l2b_xfer_en_q[4]  |
	l2b_xfer_en_q[5]  | l2b_xfer_en_q[6]  | l2b_xfer_en_q[7]  | 
	l2t_xfer_en_q[0]  | l2t_xfer_en_q[1]  | l2t_xfer_en_q[2]  |
	l2t_xfer_en_q[3]  | l2t_xfer_en_q[4]  | l2t_xfer_en_q[5]  |
	l2t_xfer_en_q[6]  | l2t_xfer_en_q[7]  |
	spc_dxfer_en_q[0] | spc_dxfer_en_q[1] | spc_dxfer_en_q[2] |
	spc_dxfer_en_q[3] | spc_dxfer_en_q[4] | spc_dxfer_en_q[5] |
	spc_dxfer_en_q[6] | spc_dxfer_en_q[7] | spc_ixfer_en_q[0] |
	spc_ixfer_en_q[1] | spc_ixfer_en_q[2] | spc_ixfer_en_q[3] |
	spc_ixfer_en_q[4] | spc_ixfer_en_q[5] | spc_ixfer_en_q[6] |
	spc_ixfer_en_q[7] | 1'b0;

assign efu_xfer_out = efu_l2b0_fuse_xfer_en | efu_l2b1_fuse_xfer_en |
	efu_l2b2_fuse_xfer_en | efu_l2b3_fuse_xfer_en | efu_l2b4_fuse_xfer_en |
	efu_l2b5_fuse_xfer_en | efu_l2b6_fuse_xfer_en | efu_l2b7_fuse_xfer_en | 
	efu_l2t0_fuse_xfer_en | efu_l2t1_fuse_xfer_en | efu_l2t2_fuse_xfer_en |
	efu_l2t3_fuse_xfer_en | efu_l2t4_fuse_xfer_en | efu_l2t5_fuse_xfer_en |
	efu_l2t6_fuse_xfer_en | efu_l2t7_fuse_xfer_en |
	efu_spc0_fuse_dxfer_en | efu_spc1_fuse_dxfer_en | efu_spc2_fuse_dxfer_en |
	efu_spc3_fuse_dxfer_en | efu_spc4_fuse_dxfer_en | efu_spc5_fuse_dxfer_en |
	efu_spc6_fuse_dxfer_en | efu_spc7_fuse_dxfer_en | efu_spc0_fuse_ixfer_en |
	efu_spc1_fuse_ixfer_en | efu_spc2_fuse_ixfer_en | efu_spc3_fuse_ixfer_en |
	efu_spc4_fuse_ixfer_en | efu_spc5_fuse_ixfer_en | efu_spc6_fuse_ixfer_en |
	efu_spc7_fuse_ixfer_en | 1'b0;

//assign read_data_in = 1'b0;

assign load_l2_read_data = ~read_data_in_r1 & read_data_in_r2 ;

efu_l2t_ctl_msff_ctl_macro__width_1  ff_efu_xfer_out_r2     
        (
        .scan_in(ff_xfer_out_r2_scanin),
        .scan_out(ff_xfer_out_r2_scanout),
        .dout   (read_data_in_r2),
        .din    (read_data_in_r1),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_l2t_ctl_msff_ctl_macro__width_1  ff_read_data_in_r1     
        (
        .scan_in(ff_xfer_out_r1_scanin),
        .scan_out(ff_xfer_out_r1_scanout),
        .dout   (read_data_in_r1),
        .din    (read_data_in),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_l2t_ctl_msff_ctl_macro__width_1  ff_read_data_in     
        (
        .scan_in(ff_read_data_in_scanin),
        .scan_out(ff_read_data_in_scanout),
        .dout   (read_data_in_reg),
        .din    (read_data_in),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


//assign shift_data_ff_in[31:0] = //cmp_read_data_ff_vld ? read_data_ff[31:0] 
//                               read_data_in_reg 
//                              ? {read_data_ff_sync[31:22],read_data_ff_sync[21:1],shift_in_reg} 
//                              : {read_data_ff_sync[31:22],read_data_ff_sync[20:0],1'b0};

assign shift_data_ff_in[31:0] = cmp_read_data_ff_vld_reg ? read_data_ff_sync[31:0] 
                              : efu_xfer_out ? {shift_data_ff_out[31:22],shift_data_ff_out[20:0],1'b0}
                              : read_data_in_reg ? {shift_data_ff_out[31:22],shift_data_ff_out[20:0],shift_in_reg}
		              : shift_data_ff_out[31:0];


efu_l2t_ctl_msff_ctl_macro__width_1	ff_cmp_read_data_ff_vld	    
	(
	.scan_in(ff_cmp_read_data_ff_vld_scanin),
	.scan_out(ff_cmp_read_data_ff_vld_scanout),
	.dout	(cmp_read_data_ff_vld_reg),
	.din	(cmp_read_data_ff_vld),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_l2t_ctl_msff_ctl_macro__en_1__width_32  ff_read_data_ff_sync   
        (
        .scan_in(ff_read_data_ff_sync_scanin),
        .scan_out(ff_read_data_ff_sync_scanout),
        .din    (read_data_ff[31:0]),
        .dout   (read_data_ff_sync[31:0]),
	.en	(cmp_read_data_ff_vld),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_l2t_ctl_msff_ctl_macro__width_32	ff_shhift_data_ff_sync   
	 (
	 .scan_in(ff_shhift_data_ff_sync_scanin),
	 .scan_out(ff_shhift_data_ff_sync_scanout),
	 .din	(shift_data_ff_in),
	 .dout	(shift_data_ff_out),
	 .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	 );



// ### CPS
wire [8:0] mrd_cnt_ff;
wire [8:0] mrd_cnt_nxt;
wire [8:0] mrd_cnt_dec;
wire       decode_enable_vld;

assign cmp_mrd_cnt_done = ~|mrd_cnt_ff;

//assign mrd_cnt_nxt[8:0] = cmp_read_data_ff_vld ? 9'd22 : 9'd0;
assign mrd_cnt_dec[8:0] = mrd_cnt_ff[8:0] - 9'd1 ;
assign mrd_cnt_nxt[8:0] = cmp_read_data_ff_vld_reg & decode_enable_vld ? 9'd22 : cmp_mrd_cnt_done ? 9'd0 : mrd_cnt_dec[8:0] ;

efu_l2t_ctl_msff_ctl_macro__width_9  mrd_cnt_reg     
        (
        .scan_in(mrd_cnt_reg_scanin),
        .scan_out(mrd_cnt_reg_scanout),
        .dout   (mrd_cnt_ff[8:0]),
        .din    (mrd_cnt_nxt[8:0]),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

wire [2:0] valid_bits;

assign valid_bits[2:0] = read_data_ff_sync[31:29];
reg	valid, val_err;

always @(valid_bits)
  case (valid_bits) //synopsys parallel_case full_case
    3'b000: {valid, val_err} = 2'b00;
    3'b001: {valid, val_err} = 2'b01;
    3'b010: {valid, val_err} = 2'b01;
    3'b100: {valid, val_err} = 2'b01;
    3'b011: {valid, val_err} = 2'b10;
    3'b101: {valid, val_err} = 2'b10;
    3'b110: {valid, val_err} = 2'b10;
    3'b111: {valid, val_err} = 2'b10;
  endcase

assign computed_parity = ^read_data_ff_sync[28:0];
assign good_parity = ~computed_parity;

assign decode_enable_vld = valid & ~val_err & good_parity ;

//### CPS
assign any_cnt_other_than_zero = (|mrd_cnt_nxt[8:0]); 
// change to fix a glitch on ixfer_en
//assign local_fuse_ashift_nxt = any_cnt_other_than_zero | local_fuse_ashift_d1 ;
assign local_fuse_ashift_nxt = local_fuse_ashift_d1 ;
assign local_fuse_dshift_nxt = local_fuse_ashift_nxt;

efu_l2t_ctl_msff_ctl_macro__width_1  local_fuse_ashift_ff     
        (
        .scan_in(local_fuse_ashift_ff_scanin),
        .scan_out(local_fuse_ashift_ff_scanout),
        .dout   (local_fuse_ashift_d1),
        .din    (any_cnt_other_than_zero),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


//assign local_fuse_dshift_nxt = (|mrd_cnt_nxt[8:0]);
//assign local_fuse_ashift_nxt = mrd_cnt_nxt[8:0] == 9'd22 |
//                               mrd_cnt_nxt[8:0] == 9'd21 |
//                               mrd_cnt_nxt[8:0] == 9'd20 |
//                               mrd_cnt_nxt[8:0] == 9'd19 |
//                               mrd_cnt_nxt[8:0] == 9'd18 |
//                               mrd_cnt_nxt[8:0] == 9'd17 |
//                               mrd_cnt_nxt[8:0] == 9'd16 |
//                               mrd_cnt_nxt[8:0] == 9'd15 |
//                               mrd_cnt_nxt[8:0] == 9'd14 |
//                               mrd_cnt_nxt[8:0] == 9'd13 |
//                               mrd_cnt_nxt[8:0] == 9'd12 |
//                               mrd_cnt_nxt[8:0] == 9'd11 |
//                               mrd_cnt_nxt[8:0] == 9'd10 |
//                               mrd_cnt_nxt[8:0] == 9'd9 |
//                               mrd_cnt_nxt[8:0] == 9'd8 |
//                               mrd_cnt_nxt[8:0] == 9'd7 |
//                               mrd_cnt_nxt[8:0] == 9'd6 |
//                               mrd_cnt_nxt[8:0] == 9'd5 |
//                               mrd_cnt_nxt[8:0] == 9'd4 |
//                               mrd_cnt_nxt[8:0] == 9'd3 |
//                               mrd_cnt_nxt[8:0] == 9'd2 |
//                               mrd_cnt_nxt[8:0] == 9'd1 |
//                               mrd_cnt_nxt[8:0] == 9'd0;

// ### CPS
assign local_fuse_data_ff = shift_data_ff_out[21];

assign block_id[5:0] = read_data_ff_sync[27:22];

assign spc0_ifuse_dec   = (block_id[5:0] == 6'b000000) & decode_enable_vld;
assign spc0_dfuse_dec   = (block_id[5:0] == 6'b000001) & decode_enable_vld;
assign spc1_ifuse_dec   = (block_id[5:0] == 6'b000010) & decode_enable_vld;
assign spc1_dfuse_dec   = (block_id[5:0] == 6'b000011) & decode_enable_vld;
assign spc2_ifuse_dec   = (block_id[5:0] == 6'b000100) & decode_enable_vld;
assign spc2_dfuse_dec   = (block_id[5:0] == 6'b000101) & decode_enable_vld;
assign spc3_ifuse_dec   = (block_id[5:0] == 6'b000110) & decode_enable_vld;
assign spc3_dfuse_dec   = (block_id[5:0] == 6'b000111) & decode_enable_vld;
assign spc4_ifuse_dec   = (block_id[5:0] == 6'b001000) & decode_enable_vld;
assign spc4_dfuse_dec   = (block_id[5:0] == 6'b001001) & decode_enable_vld;
assign spc5_ifuse_dec   = (block_id[5:0] == 6'b001010) & decode_enable_vld;
assign spc5_dfuse_dec   = (block_id[5:0] == 6'b001011) & decode_enable_vld;
assign spc6_ifuse_dec   = (block_id[5:0] == 6'b001100) & decode_enable_vld;
assign spc6_dfuse_dec   = (block_id[5:0] == 6'b001101) & decode_enable_vld;
assign spc7_ifuse_dec   = (block_id[5:0] == 6'b001110) & decode_enable_vld;
assign spc7_dfuse_dec   = (block_id[5:0] == 6'b001111) & decode_enable_vld;
assign l2t0_fuse_dec    = (block_id[5:0] == 6'b010000) & decode_enable_vld;
assign l2t1_fuse_dec    = (block_id[5:0] == 6'b010001) & decode_enable_vld;
assign l2t2_fuse_dec    = (block_id[5:0] == 6'b010010) & decode_enable_vld;
assign l2t3_fuse_dec    = (block_id[5:0] == 6'b010011) & decode_enable_vld;
assign l2t4_fuse_dec    = (block_id[5:0] == 6'b010100) & decode_enable_vld;
assign l2t5_fuse_dec    = (block_id[5:0] == 6'b010101) & decode_enable_vld;
assign l2t6_fuse_dec    = (block_id[5:0] == 6'b010110) & decode_enable_vld;
assign l2t7_fuse_dec    = (block_id[5:0] == 6'b010111) & decode_enable_vld;
assign l2d0_fuse_dec    = (block_id[5:0] == 6'b011000) & decode_enable_vld;
assign l2d1_fuse_dec    = (block_id[5:0] == 6'b011001) & decode_enable_vld;
assign l2d2_fuse_dec    = (block_id[5:0] == 6'b011010) & decode_enable_vld;
assign l2d3_fuse_dec    = (block_id[5:0] == 6'b011011) & decode_enable_vld;
assign l2d4_fuse_dec    = (block_id[5:0] == 6'b011100) & decode_enable_vld;
assign l2d5_fuse_dec    = (block_id[5:0] == 6'b011101) & decode_enable_vld;
assign l2d6_fuse_dec    = (block_id[5:0] == 6'b011110) & decode_enable_vld;
assign l2d7_fuse_dec    = (block_id[5:0] == 6'b011111) & decode_enable_vld;

efu_l2t_ctl_msff_ctl_macro__width_1  data_vld_datareg   
        (
        .scan_in(data_vld_datareg_scanin),
        .scan_out(data_vld_datareg_scanout),
        .din    (shift_in),
        .dout   (shift_in_reg),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


assign  shift_in = 1'b0
                | spc7_ifuse_dec & spc_idata_q[7] //&& spc7_efu_fuse_ixfer_en
                | spc7_dfuse_dec & spc_ddata_q[7] //&& spc7_efu_fuse_dxfer_en
                | spc6_ifuse_dec & spc_idata_q[6] //&& spc6_efu_fuse_ixfer_en
                | spc6_dfuse_dec & spc_ddata_q[6] //&& spc6_efu_fuse_dxfer_en
                | spc5_ifuse_dec & spc_idata_q[5] //&& spc5_efu_fuse_ixfer_en
                | spc5_dfuse_dec & spc_ddata_q[5] //&& spc5_efu_fuse_dxfer_en
                | spc4_ifuse_dec & spc_idata_q[4] //&& spc4_efu_fuse_ixfer_en
                | spc4_dfuse_dec & spc_ddata_q[4] //&& spc4_efu_fuse_dxfer_en
                | spc3_ifuse_dec & spc_idata_q[3] //&& spc3_efu_fuse_ixfer_en
                | spc3_dfuse_dec & spc_ddata_q[3] //&& spc3_efu_fuse_dxfer_en
                | spc2_ifuse_dec & spc_idata_q[2] //&& spc2_efu_fuse_ixfer_en
                | spc2_dfuse_dec & spc_ddata_q[2] //&& spc2_efu_fuse_dxfer_en
                | spc1_ifuse_dec & spc_idata_q[1] //&& spc1_efu_fuse_ixfer_en
                | spc1_dfuse_dec & spc_ddata_q[1] //&& spc1_efu_fuse_dxfer_en
                | spc0_ifuse_dec & spc_idata_q[0] //&& spc0_efu_fuse_ixfer_en
                | spc0_dfuse_dec & spc_ddata_q[0] //&& spc0_efu_fuse_dxfer_en
                | l2t0_fuse_dec  & l2t_data_q[0]  //&& l2t0_efu_fuse_xfer_en
                | l2t1_fuse_dec  & l2t_data_q[1]  //&& l2t1_efu_fuse_xfer_en
                | l2t2_fuse_dec  & l2t_data_q[2]  //&& l2t2_efu_fuse_xfer_en
                | l2t3_fuse_dec  & l2t_data_q[3]  //&& l2t3_efu_fuse_xfer_en
                | l2t4_fuse_dec  & l2t_data_q[4]  //&& l2t4_efu_fuse_xfer_en
                | l2t5_fuse_dec  & l2t_data_q[5]  //&& l2t5_efu_fuse_xfer_en
                | l2t6_fuse_dec  & l2t_data_q[6]  //&& l2t6_efu_fuse_xfer_en
                | l2t7_fuse_dec  & l2t_data_q[7]  //&& l2t7_efu_fuse_xfer_en
                | l2d0_fuse_dec  & l2b_data_q[0]  //&& l2b0_efu_fuse_xfer_en
                | l2d1_fuse_dec  & l2b_data_q[1]  //&& l2b1_efu_fuse_xfer_en
                | l2d2_fuse_dec  & l2b_data_q[2]  //&& l2b2_efu_fuse_xfer_en
                | l2d3_fuse_dec  & l2b_data_q[3]  //&& l2b3_efu_fuse_xfer_en
                | l2d4_fuse_dec  & l2b_data_q[4]  //&& l2b4_efu_fuse_xfer_en
                | l2d5_fuse_dec  & l2b_data_q[5]  //&& l2b5_efu_fuse_xfer_en
                | l2d6_fuse_dec  & l2b_data_q[6]  //&& l2b6_efu_fuse_xfer_en
                | l2d7_fuse_dec  & l2b_data_q[7] ;//&& l2b7_efu_fuse_xfer_en;
                                                         
assign efu_spc0246_fuse_data    = local_fuse_data_ff;    
assign efu_spc1357_fuse_data    = local_fuse_data_ff;    
assign efu_l2t0246_fuse_data    = local_fuse_data_ff;    //
assign efu_l2t1357_fuse_data    = local_fuse_data_ff;
assign efu_l2b0246_fuse_data    = local_fuse_data_ff;
assign efu_l2b1357_fuse_data    = local_fuse_data_ff;


efu_l2t_ctl_msff_ctl_macro__width_1	spc0_ifuse_ashift_reg	
	(
	.scan_in(spc0_ifuse_ashift_reg_scanin),
	.scan_out(spc0_ifuse_ashift_reg_scanout),
	.din	(spc0_ifuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc0_ifuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc0_ifuse_dshift_reg	
	(
	.scan_in(spc0_ifuse_dshift_reg_scanin),
	.scan_out(spc0_ifuse_dshift_reg_scanout),
	.din	(spc0_ifuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc0_ifuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

 assign efu_spc0_fuse_ixfer_en = efu_spc0_ifuse_ashift | efu_spc0_ifuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc0_dfuse_ashift_reg	
	(
	.scan_in(spc0_dfuse_ashift_reg_scanin),
	.scan_out(spc0_dfuse_ashift_reg_scanout),
	.din	(spc0_dfuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc0_dfuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc0_dfuse_dshift_reg	
	(
	.scan_in(spc0_dfuse_dshift_reg_scanin),
	.scan_out(spc0_dfuse_dshift_reg_scanout),
	.din	(spc0_dfuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc0_dfuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

 assign efu_spc0_fuse_dxfer_en = efu_spc0_dfuse_ashift | efu_spc0_dfuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc1_ifuse_ashift_reg	
	(
	.scan_in(spc1_ifuse_ashift_reg_scanin),
	.scan_out(spc1_ifuse_ashift_reg_scanout),
	.din	(spc1_ifuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc1_ifuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc1_ifuse_dshift_reg	
	(
	.scan_in(spc1_ifuse_dshift_reg_scanin),
	.scan_out(spc1_ifuse_dshift_reg_scanout),
	.din	(spc1_ifuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc1_ifuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_spc1_fuse_ixfer_en = efu_spc1_ifuse_dshift | efu_spc1_ifuse_ashift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc1_dfuse_ashift_reg	
	(
	.scan_in(spc1_dfuse_ashift_reg_scanin),
	.scan_out(spc1_dfuse_ashift_reg_scanout),
	.din	(spc1_dfuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc1_dfuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc1_dfuse_dshift_reg	
	(
	.scan_in(spc1_dfuse_dshift_reg_scanin),
	.scan_out(spc1_dfuse_dshift_reg_scanout),
	.din	(spc1_dfuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc1_dfuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_spc1_fuse_dxfer_en = efu_spc1_dfuse_ashift | efu_spc1_dfuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc2_ifuse_ashift_reg	
	(
	.scan_in(spc2_ifuse_ashift_reg_scanin),
	.scan_out(spc2_ifuse_ashift_reg_scanout),
	.din	(spc2_ifuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc2_ifuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc2_ifuse_dshift_reg	
	(
	.scan_in(spc2_ifuse_dshift_reg_scanin),
	.scan_out(spc2_ifuse_dshift_reg_scanout),
	.din	(spc2_ifuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc2_ifuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


assign efu_spc2_fuse_ixfer_en = efu_spc2_ifuse_ashift | efu_spc2_ifuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc2_dfuse_ashift_reg	
	(
	.scan_in(spc2_dfuse_ashift_reg_scanin),
	.scan_out(spc2_dfuse_ashift_reg_scanout),
	.din	(spc2_dfuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc2_dfuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc2_dfuse_dshift_reg	
	(
	.scan_in(spc2_dfuse_dshift_reg_scanin),
	.scan_out(spc2_dfuse_dshift_reg_scanout),
	.din	(spc2_dfuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc2_dfuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_spc2_fuse_dxfer_en = efu_spc2_dfuse_ashift | efu_spc2_dfuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc3_ifuse_ashift_reg	
	(
	.scan_in(spc3_ifuse_ashift_reg_scanin),
	.scan_out(spc3_ifuse_ashift_reg_scanout),
	.din	(spc3_ifuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc3_ifuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc3_ifuse_dshift_reg	
	(
	.scan_in(spc3_ifuse_dshift_reg_scanin),
	.scan_out(spc3_ifuse_dshift_reg_scanout),
	.din	(spc3_ifuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc3_ifuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_spc3_fuse_ixfer_en = efu_spc3_ifuse_ashift | efu_spc3_ifuse_dshift;


efu_l2t_ctl_msff_ctl_macro__width_1	spc3_dfuse_ashift_reg	
	(
	.scan_in(spc3_dfuse_ashift_reg_scanin),
	.scan_out(spc3_dfuse_ashift_reg_scanout),
	.din	(spc3_dfuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc3_dfuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc3_dfuse_dshift_reg	
	(
	.scan_in(spc3_dfuse_dshift_reg_scanin),
	.scan_out(spc3_dfuse_dshift_reg_scanout),
	.din	(spc3_dfuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc3_dfuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_spc3_fuse_dxfer_en = efu_spc3_dfuse_ashift | efu_spc3_dfuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc4_ifuse_ashift_reg	
	(
	.scan_in(spc4_ifuse_ashift_reg_scanin),
	.scan_out(spc4_ifuse_ashift_reg_scanout),
	.din	(spc4_ifuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc4_ifuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc4_ifuse_dshift_reg	
	(
	.scan_in(spc4_ifuse_dshift_reg_scanin),
	.scan_out(spc4_ifuse_dshift_reg_scanout),
	.din	(spc4_ifuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc4_ifuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


assign efu_spc4_fuse_ixfer_en = efu_spc4_ifuse_ashift | efu_spc4_ifuse_dshift;


efu_l2t_ctl_msff_ctl_macro__width_1	spc4_dfuse_ashift_reg	
	(
	.scan_in(spc4_dfuse_ashift_reg_scanin),
	.scan_out(spc4_dfuse_ashift_reg_scanout),
	.din	(spc4_dfuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc4_dfuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc4_dfuse_dshift_reg	
	(
	.scan_in(spc4_dfuse_dshift_reg_scanin),
	.scan_out(spc4_dfuse_dshift_reg_scanout),
	.din	(spc4_dfuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc4_dfuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


assign efu_spc4_fuse_dxfer_en = efu_spc4_dfuse_ashift | efu_spc4_dfuse_dshift;


efu_l2t_ctl_msff_ctl_macro__width_1	spc5_ifuse_ashift_reg	
	(
	.scan_in(spc5_ifuse_ashift_reg_scanin),
	.scan_out(spc5_ifuse_ashift_reg_scanout),
	.din	(spc5_ifuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc5_ifuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc5_ifuse_dshift_reg	
	(
	.scan_in(spc5_ifuse_dshift_reg_scanin),
	.scan_out(spc5_ifuse_dshift_reg_scanout),
	.din	(spc5_ifuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc5_ifuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_spc5_fuse_ixfer_en = efu_spc5_ifuse_ashift | efu_spc5_ifuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc5_dfuse_ashift_reg	
	(
	.scan_in(spc5_dfuse_ashift_reg_scanin),
	.scan_out(spc5_dfuse_ashift_reg_scanout),
	.din	(spc5_dfuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc5_dfuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc5_dfuse_dshift_reg	
	(
	.scan_in(spc5_dfuse_dshift_reg_scanin),
	.scan_out(spc5_dfuse_dshift_reg_scanout),
	.din	(spc5_dfuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc5_dfuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


assign efu_spc5_fuse_dxfer_en = efu_spc5_dfuse_ashift | efu_spc5_dfuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc6_ifuse_ashift_reg	
	(
	.scan_in(spc6_ifuse_ashift_reg_scanin),
	.scan_out(spc6_ifuse_ashift_reg_scanout),
	.din	(spc6_ifuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc6_ifuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc6_ifuse_dshift_reg	
	(
	.scan_in(spc6_ifuse_dshift_reg_scanin),
	.scan_out(spc6_ifuse_dshift_reg_scanout),
	.din	(spc6_ifuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc6_ifuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


assign efu_spc6_fuse_ixfer_en = efu_spc6_ifuse_ashift | efu_spc6_ifuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc6_dfuse_ashift_reg	
	(
	.scan_in(spc6_dfuse_ashift_reg_scanin),
	.scan_out(spc6_dfuse_ashift_reg_scanout),
	.din	(spc6_dfuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc6_dfuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc6_dfuse_dshift_reg	
	(
	.scan_in(spc6_dfuse_dshift_reg_scanin),
	.scan_out(spc6_dfuse_dshift_reg_scanout),
	.din	(spc6_dfuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc6_dfuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_spc6_fuse_dxfer_en = efu_spc6_dfuse_ashift | efu_spc6_dfuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc7_ifuse_ashift_reg	
	(
	.scan_in(spc7_ifuse_ashift_reg_scanin),
	.scan_out(spc7_ifuse_ashift_reg_scanout),
	.din	(spc7_ifuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc7_ifuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc7_ifuse_dshift_reg	
	(
	.scan_in(spc7_ifuse_dshift_reg_scanin),
	.scan_out(spc7_ifuse_dshift_reg_scanout),
	.din	(spc7_ifuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc7_ifuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_spc7_fuse_ixfer_en = efu_spc7_ifuse_ashift | efu_spc7_ifuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	spc7_dfuse_ashift_reg	
	(
	.scan_in(spc7_dfuse_ashift_reg_scanin),
	.scan_out(spc7_dfuse_ashift_reg_scanout),
	.din	(spc7_dfuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_spc7_dfuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	spc7_dfuse_dshift_reg	
	(
	.scan_in(spc7_dfuse_dshift_reg_scanin),
	.scan_out(spc7_dfuse_dshift_reg_scanout),
	.din	(spc7_dfuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_spc7_dfuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_spc7_fuse_dxfer_en = efu_spc7_dfuse_ashift | efu_spc7_dfuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	l2t0_fuse_ashift_reg	
	(
	.scan_in(l2t0_fuse_ashift_reg_scanin),
	.scan_out(l2t0_fuse_ashift_reg_scanout),
	.din	(l2t0_fuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_l2t0_fuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	l2t0_fuse_dshift_reg	
	(
	.scan_in(l2t0_fuse_dshift_reg_scanin),
	.scan_out(l2t0_fuse_dshift_reg_scanout),
	.din	(l2t0_fuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_l2t0_fuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_l2t0_fuse_xfer_en = efu_l2t0_fuse_ashift | efu_l2t0_fuse_dshift;


efu_l2t_ctl_msff_ctl_macro__width_1	l2t1_fuse_ashift_reg	
	(
	.scan_in(l2t1_fuse_ashift_reg_scanin),
	.scan_out(l2t1_fuse_ashift_reg_scanout),
	.din	(l2t1_fuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_l2t1_fuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	l2t1_fuse_dshift_reg	
	(
	.scan_in(l2t1_fuse_dshift_reg_scanin),
	.scan_out(l2t1_fuse_dshift_reg_scanout),
	.din	(l2t1_fuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_l2t1_fuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_l2t1_fuse_xfer_en = efu_l2t1_fuse_ashift | efu_l2t1_fuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	l2t2_fuse_ashift_reg	
	(
	.scan_in(l2t2_fuse_ashift_reg_scanin),
	.scan_out(l2t2_fuse_ashift_reg_scanout),
	.din	(l2t2_fuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_l2t2_fuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	l2t2_fuse_dshift_reg	
	(
	.scan_in(l2t2_fuse_dshift_reg_scanin),
	.scan_out(l2t2_fuse_dshift_reg_scanout),
	.din	(l2t2_fuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_l2t2_fuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_l2t2_fuse_xfer_en = efu_l2t2_fuse_ashift | efu_l2t2_fuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1	l2t3_fuse_ashift_reg	
	(
	.scan_in(l2t3_fuse_ashift_reg_scanin),
	.scan_out(l2t3_fuse_ashift_reg_scanout),
	.din	(l2t3_fuse_dec && local_fuse_ashift_nxt),
	.dout	(efu_l2t3_fuse_ashift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


efu_l2t_ctl_msff_ctl_macro__width_1	l2t3_fuse_dshift_reg	
	(
	.scan_in(l2t3_fuse_dshift_reg_scanin),
	.scan_out(l2t3_fuse_dshift_reg_scanout),
	.din	(l2t3_fuse_dec && local_fuse_dshift_nxt),
	.dout	(efu_l2t3_fuse_dshift),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign efu_l2t3_fuse_xfer_en = efu_l2t3_fuse_ashift | efu_l2t3_fuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1  l2t4_fuse_ashift_reg    
        (
        .scan_in(l2t4_fuse_ashift_reg_scanin),
        .scan_out(l2t4_fuse_ashift_reg_scanout),
        .din    (l2t4_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2t4_fuse_ashift),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


efu_l2t_ctl_msff_ctl_macro__width_1  l2t4_fuse_dshift_reg    
        (
        .scan_in(l2t4_fuse_dshift_reg_scanin),
        .scan_out(l2t4_fuse_dshift_reg_scanout),
        .din    (l2t4_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2t4_fuse_dshift),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2t4_fuse_xfer_en = efu_l2t4_fuse_ashift | efu_l2t4_fuse_dshift;


efu_l2t_ctl_msff_ctl_macro__width_1  l2t5_fuse_ashift_reg    
        (
        .scan_in(l2t5_fuse_ashift_reg_scanin),
        .scan_out(l2t5_fuse_ashift_reg_scanout),
        .din    (l2t5_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2t5_fuse_ashift),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


efu_l2t_ctl_msff_ctl_macro__width_1  l2t5_fuse_dshift_reg    
        (
        .scan_in(l2t5_fuse_dshift_reg_scanin),
        .scan_out(l2t5_fuse_dshift_reg_scanout),
        .din    (l2t5_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2t5_fuse_dshift),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2t5_fuse_xfer_en = efu_l2t5_fuse_ashift | efu_l2t5_fuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1  l2t6_fuse_ashift_reg    
        (
        .scan_in(l2t6_fuse_ashift_reg_scanin),
        .scan_out(l2t6_fuse_ashift_reg_scanout),
        .din    (l2t6_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2t6_fuse_ashift),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


efu_l2t_ctl_msff_ctl_macro__width_1  l2t6_fuse_dshift_reg    
        (
        .scan_in(l2t6_fuse_dshift_reg_scanin),
        .scan_out(l2t6_fuse_dshift_reg_scanout),
        .din    (l2t6_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2t6_fuse_dshift),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2t6_fuse_xfer_en = efu_l2t6_fuse_ashift | efu_l2t6_fuse_dshift;


efu_l2t_ctl_msff_ctl_macro__width_1  l2t7_fuse_ashift_reg    
        (
        .scan_in(l2t7_fuse_ashift_reg_scanin),
        .scan_out(l2t7_fuse_ashift_reg_scanout),
        .din    (l2t7_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2t7_fuse_ashift),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


efu_l2t_ctl_msff_ctl_macro__width_1  l2t7_fuse_dshift_reg    
        (
        .scan_in(l2t7_fuse_dshift_reg_scanin),
        .scan_out(l2t7_fuse_dshift_reg_scanout),
        .din    (l2t7_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2t7_fuse_dshift),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2t7_fuse_xfer_en = efu_l2t7_fuse_ashift | efu_l2t7_fuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1  l2d0_fuse_ashift_reg  
        (
        .scan_in(l2d0_fuse_ashift_reg_scanin),
        .scan_out(l2d0_fuse_ashift_reg_scanout),
        .din    (l2d0_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2d0_fuse_ashift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_l2t_ctl_msff_ctl_macro__width_1  l2d0_fuse_dshift_reg  
        (
        .scan_in(l2d0_fuse_dshift_reg_scanin),
        .scan_out(l2d0_fuse_dshift_reg_scanout),
        .din    (l2d0_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2d0_fuse_dshift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2b0_fuse_xfer_en = efu_l2d0_fuse_dshift | efu_l2d0_fuse_ashift;


efu_l2t_ctl_msff_ctl_macro__width_1  l2d1_fuse_ashift_reg  
        (
        .scan_in(l2d1_fuse_ashift_reg_scanin),
        .scan_out(l2d1_fuse_ashift_reg_scanout),
        .din    (l2d1_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2d1_fuse_ashift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_l2t_ctl_msff_ctl_macro__width_1  l2d1_fuse_dshift_reg  
        (
        .scan_in(l2d1_fuse_dshift_reg_scanin),
        .scan_out(l2d1_fuse_dshift_reg_scanout),
        .din    (l2d1_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2d1_fuse_dshift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2b1_fuse_xfer_en = efu_l2d1_fuse_ashift | efu_l2d1_fuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1  l2d2_fuse_ashift_reg  
        (
        .scan_in(l2d2_fuse_ashift_reg_scanin),
        .scan_out(l2d2_fuse_ashift_reg_scanout),
        .din    (l2d2_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2d2_fuse_ashift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


efu_l2t_ctl_msff_ctl_macro__width_1  l2d2_fuse_dshift_reg  
        (
        .scan_in(l2d2_fuse_dshift_reg_scanin),
        .scan_out(l2d2_fuse_dshift_reg_scanout),
        .din    (l2d2_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2d2_fuse_dshift), 
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2b2_fuse_xfer_en = efu_l2d2_fuse_ashift | efu_l2d2_fuse_dshift;

efu_l2t_ctl_msff_ctl_macro__width_1  l2d3_fuse_ashift_reg  
        (
        .scan_in(l2d3_fuse_ashift_reg_scanin),
        .scan_out(l2d3_fuse_ashift_reg_scanout),
        .din    (l2d3_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2d3_fuse_ashift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
efu_l2t_ctl_msff_ctl_macro__width_1  l2d3_fuse_dshift_reg  
        (
        .scan_in(l2d3_fuse_dshift_reg_scanin),
        .scan_out(l2d3_fuse_dshift_reg_scanout),
        .din    (l2d3_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2d3_fuse_dshift), 
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2b3_fuse_xfer_en = efu_l2d3_fuse_dshift | efu_l2d3_fuse_ashift;


efu_l2t_ctl_msff_ctl_macro__width_1  l2d4_fuse_ashift_reg  
        (
        .scan_in(l2d4_fuse_ashift_reg_scanin),
        .scan_out(l2d4_fuse_ashift_reg_scanout),
        .din    (l2d4_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2d4_fuse_ashift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
efu_l2t_ctl_msff_ctl_macro__width_1  l2d4_fuse_dshift_reg  
        (
        .scan_in(l2d4_fuse_dshift_reg_scanin),
        .scan_out(l2d4_fuse_dshift_reg_scanout),
        .din    (l2d4_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2d4_fuse_dshift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2b4_fuse_xfer_en = efu_l2d4_fuse_dshift | efu_l2d4_fuse_ashift;

efu_l2t_ctl_msff_ctl_macro__width_1  l2d5_fuse_ashift_reg  
        (
        .scan_in(l2d5_fuse_ashift_reg_scanin),
        .scan_out(l2d5_fuse_ashift_reg_scanout),
        .din    (l2d5_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2d5_fuse_ashift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_l2t_ctl_msff_ctl_macro__width_1  l2d5_fuse_dshift_reg  
        (
        .scan_in(l2d5_fuse_dshift_reg_scanin),
        .scan_out(l2d5_fuse_dshift_reg_scanout),
        .din    (l2d5_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2d5_fuse_dshift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2b5_fuse_xfer_en = efu_l2d5_fuse_dshift | efu_l2d5_fuse_ashift;


efu_l2t_ctl_msff_ctl_macro__width_1  l2d6_fuse_ashift_reg  
        (
        .scan_in(l2d6_fuse_ashift_reg_scanin),
        .scan_out(l2d6_fuse_ashift_reg_scanout),
        .din    (l2d6_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2d6_fuse_ashift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
efu_l2t_ctl_msff_ctl_macro__width_1  l2d6_fuse_dshift_reg  
        (
        .scan_in(l2d6_fuse_dshift_reg_scanin),
        .scan_out(l2d6_fuse_dshift_reg_scanout),
        .din    (l2d6_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2d6_fuse_dshift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2b6_fuse_xfer_en = efu_l2d6_fuse_dshift | efu_l2d6_fuse_ashift;

efu_l2t_ctl_msff_ctl_macro__width_1  l2d7_fuse_ashift_reg  
        (
        .scan_in(l2d7_fuse_ashift_reg_scanin),
        .scan_out(l2d7_fuse_ashift_reg_scanout),
        .din    (l2d7_fuse_dec && local_fuse_ashift_nxt),
        .dout   (efu_l2d7_fuse_ashift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
efu_l2t_ctl_msff_ctl_macro__width_1  l2d7_fuse_dshift_reg  
        (
        .scan_in(l2d7_fuse_dshift_reg_scanin),
        .scan_out(l2d7_fuse_dshift_reg_scanout),
        .din    (l2d7_fuse_dec && local_fuse_dshift_nxt),
        .dout   (efu_l2d7_fuse_dshift),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign efu_l2b7_fuse_xfer_en = efu_l2d7_fuse_dshift | efu_l2d7_fuse_ashift;

//###
efu_l2t_ctl_msff_ctl_macro__width_1  cmp_read_data_ff_vld_0_reg  
        (
        .scan_in(cmp_read_data_ff_vld_0_reg_scanin),
        .scan_out(cmp_read_data_ff_vld_0_reg_scanout),
        .din    (read_data_ff_vld),
        .dout   (cmp_read_data_ff_vld_0),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
//###
efu_l2t_ctl_msff_ctl_macro__width_1  cmp_read_data_ff_vld_1_reg  
        (
        .scan_in(cmp_read_data_ff_vld_1_reg_scanin),
        .scan_out(cmp_read_data_ff_vld_1_reg_scanout),
        .din    (cmp_read_data_ff_vld_0),
        .dout   (cmp_read_data_ff_vld_1),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
assign cmp_read_data_ff_vld = cmp_read_data_ff_vld_0 & ~cmp_read_data_ff_vld_1 ;

efu_l2t_ctl_spare_ctl_macro__num_2 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
        .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//msff_ctl_macro  read_data_ff_vld_reg  (width=1)
//        (
//        .scan_in(read_data_ff_vld_scanin),
//        .scan_out(read_data_ff_vld_scanout),
//        .din    (read_data_ff_vld),
//        .dout   (cmp_read_data_ff_vld1),
//        .l1clk    (l1clk),
//        );

//msff_ctl_macro  cmp_read_data_ff_vld_reg  (width=1)
//        (
//        .scan_in(cmp_read_data_ff_vld_scanin),
//        .scan_out(cmp_read_data_ff_vld_scanout),
//        .din    (cmp_read_data_ff_vld1),
//        .dout   (cmp_read_data_ff_vld),
//        .l1clk    (l1clk),
//        );
// fixscan start:
assign ff_read_data_in_scanin    = scan_in                  ;
assign ff_xfer_out_r2_scanin     = ff_read_data_in_scanout ;
assign ff_xfer_out_r1_scanin     = ff_xfer_out_r2_scanout ;
assign ff_cmp_read_data_ff_vld_scanin = ff_xfer_out_r1_scanout  ;
assign ff_read_data_ff_sync_scanin = ff_cmp_read_data_ff_vld_scanout;
assign ff_shhift_data_ff_sync_scanin = ff_read_data_ff_sync_scanout;
assign mrd_cnt_reg_scanin        = ff_shhift_data_ff_sync_scanout;
assign local_fuse_ashift_ff_scanin = mrd_cnt_reg_scanout      ;
assign data_vld_datareg_scanin   = local_fuse_ashift_ff_scanout;
assign ff_cmp_io_sync_en_scanin = data_vld_datareg_scanout;
assign ff_l2b_xfer_en_scanin = ff_cmp_io_sync_en_scanout;
assign ff_l2t_xfer_en_scanin = ff_l2b_xfer_en_scanout;
assign ff_spc_dxfer_en_scanin = ff_l2t_xfer_en_scanout;
assign ff_spc_ixfer_en_scanin = ff_spc_dxfer_en_scanout;
assign ff_spc_idata_scanin = ff_spc_ixfer_en_scanout;
assign ff_spc_ddata_scanin = ff_spc_idata_scanout;
assign ff_l2t_data_scanin = ff_spc_ddata_scanout;
assign ff_l2b_data_scanin = ff_l2t_data_scanout;
assign spc0_ifuse_ashift_reg_scanin = ff_l2b_data_scanout ;
assign spc0_ifuse_dshift_reg_scanin = spc0_ifuse_ashift_reg_scanout;
assign spc0_dfuse_ashift_reg_scanin = spc0_ifuse_dshift_reg_scanout;
assign spc0_dfuse_dshift_reg_scanin = spc0_dfuse_ashift_reg_scanout;
assign spc1_ifuse_ashift_reg_scanin = spc0_dfuse_dshift_reg_scanout;
assign spc1_ifuse_dshift_reg_scanin = spc1_ifuse_ashift_reg_scanout;
assign spc1_dfuse_ashift_reg_scanin = spc1_ifuse_dshift_reg_scanout;
assign spc1_dfuse_dshift_reg_scanin = spc1_dfuse_ashift_reg_scanout;
assign spc2_ifuse_ashift_reg_scanin = spc1_dfuse_dshift_reg_scanout;
assign spc2_ifuse_dshift_reg_scanin = spc2_ifuse_ashift_reg_scanout;
assign spc2_dfuse_ashift_reg_scanin = spc2_ifuse_dshift_reg_scanout;
assign spc2_dfuse_dshift_reg_scanin = spc2_dfuse_ashift_reg_scanout;
assign spc3_ifuse_ashift_reg_scanin = spc2_dfuse_dshift_reg_scanout;
assign spc3_ifuse_dshift_reg_scanin = spc3_ifuse_ashift_reg_scanout;
assign spc3_dfuse_ashift_reg_scanin = spc3_ifuse_dshift_reg_scanout;
assign spc3_dfuse_dshift_reg_scanin = spc3_dfuse_ashift_reg_scanout;
assign spc4_ifuse_ashift_reg_scanin = spc3_dfuse_dshift_reg_scanout;
assign spc4_ifuse_dshift_reg_scanin = spc4_ifuse_ashift_reg_scanout;
assign spc4_dfuse_ashift_reg_scanin = spc4_ifuse_dshift_reg_scanout;
assign spc4_dfuse_dshift_reg_scanin = spc4_dfuse_ashift_reg_scanout;
assign spc5_ifuse_ashift_reg_scanin = spc4_dfuse_dshift_reg_scanout;
assign spc5_ifuse_dshift_reg_scanin = spc5_ifuse_ashift_reg_scanout;
assign spc5_dfuse_ashift_reg_scanin = spc5_ifuse_dshift_reg_scanout;
assign spc5_dfuse_dshift_reg_scanin = spc5_dfuse_ashift_reg_scanout;
assign spc6_ifuse_ashift_reg_scanin = spc5_dfuse_dshift_reg_scanout;
assign spc6_ifuse_dshift_reg_scanin = spc6_ifuse_ashift_reg_scanout;
assign spc6_dfuse_ashift_reg_scanin = spc6_ifuse_dshift_reg_scanout;
assign spc6_dfuse_dshift_reg_scanin = spc6_dfuse_ashift_reg_scanout;
assign spc7_ifuse_ashift_reg_scanin = spc6_dfuse_dshift_reg_scanout;
assign spc7_ifuse_dshift_reg_scanin = spc7_ifuse_ashift_reg_scanout;
assign spc7_dfuse_ashift_reg_scanin = spc7_ifuse_dshift_reg_scanout;
assign spc7_dfuse_dshift_reg_scanin = spc7_dfuse_ashift_reg_scanout;
assign l2t0_fuse_ashift_reg_scanin = spc7_dfuse_dshift_reg_scanout;
assign l2t0_fuse_dshift_reg_scanin = l2t0_fuse_ashift_reg_scanout;
assign l2t1_fuse_ashift_reg_scanin = l2t0_fuse_dshift_reg_scanout;
assign l2t1_fuse_dshift_reg_scanin = l2t1_fuse_ashift_reg_scanout;
assign l2t2_fuse_ashift_reg_scanin = l2t1_fuse_dshift_reg_scanout;
assign l2t2_fuse_dshift_reg_scanin = l2t2_fuse_ashift_reg_scanout;
assign l2t3_fuse_ashift_reg_scanin = l2t2_fuse_dshift_reg_scanout;
assign l2t3_fuse_dshift_reg_scanin = l2t3_fuse_ashift_reg_scanout;
assign l2t4_fuse_ashift_reg_scanin = l2t3_fuse_dshift_reg_scanout;
assign l2t4_fuse_dshift_reg_scanin = l2t4_fuse_ashift_reg_scanout;
assign l2t5_fuse_ashift_reg_scanin = l2t4_fuse_dshift_reg_scanout;
assign l2t5_fuse_dshift_reg_scanin = l2t5_fuse_ashift_reg_scanout;
assign l2t6_fuse_ashift_reg_scanin = l2t5_fuse_dshift_reg_scanout;
assign l2t6_fuse_dshift_reg_scanin = l2t6_fuse_ashift_reg_scanout;
assign l2t7_fuse_ashift_reg_scanin = l2t6_fuse_dshift_reg_scanout;
assign l2t7_fuse_dshift_reg_scanin = l2t7_fuse_ashift_reg_scanout;
assign l2d0_fuse_ashift_reg_scanin = l2t7_fuse_dshift_reg_scanout;
assign l2d0_fuse_dshift_reg_scanin = l2d0_fuse_ashift_reg_scanout;
assign l2d1_fuse_ashift_reg_scanin = l2d0_fuse_dshift_reg_scanout;
assign l2d1_fuse_dshift_reg_scanin = l2d1_fuse_ashift_reg_scanout;
assign l2d2_fuse_ashift_reg_scanin = l2d1_fuse_dshift_reg_scanout;
assign l2d2_fuse_dshift_reg_scanin = l2d2_fuse_ashift_reg_scanout;
assign l2d3_fuse_ashift_reg_scanin = l2d2_fuse_dshift_reg_scanout;
assign l2d3_fuse_dshift_reg_scanin = l2d3_fuse_ashift_reg_scanout;
assign l2d4_fuse_ashift_reg_scanin = l2d3_fuse_dshift_reg_scanout;
assign l2d4_fuse_dshift_reg_scanin = l2d4_fuse_ashift_reg_scanout;
assign l2d5_fuse_ashift_reg_scanin = l2d4_fuse_dshift_reg_scanout;
assign l2d5_fuse_dshift_reg_scanin = l2d5_fuse_ashift_reg_scanout;
assign l2d6_fuse_ashift_reg_scanin = l2d5_fuse_dshift_reg_scanout;
assign l2d6_fuse_dshift_reg_scanin = l2d6_fuse_ashift_reg_scanout;
assign l2d7_fuse_ashift_reg_scanin = l2d6_fuse_dshift_reg_scanout;
assign l2d7_fuse_dshift_reg_scanin = l2d7_fuse_ashift_reg_scanout;
assign cmp_read_data_ff_vld_0_reg_scanin = l2d7_fuse_dshift_reg_scanout;
assign cmp_read_data_ff_vld_1_reg_scanin = cmp_read_data_ff_vld_0_reg_scanout;
assign spares_scanin = cmp_read_data_ff_vld_1_reg_scanout;
assign scan_out                  = spares_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module efu_l2t_ctl_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module efu_l2t_ctl_msff_ctl_macro__width_1 (
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
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_l2t_ctl_msff_ctl_macro__en_1__width_8 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_l2t_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_l2t_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_l2t_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module efu_l2t_ctl_spare_ctl_macro__num_2 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));
assign scan_out = so_1;



endmodule

