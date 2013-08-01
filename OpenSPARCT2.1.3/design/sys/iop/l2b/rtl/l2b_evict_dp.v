// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2b_evict_dp.v
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
module l2b_evict_dp (
  l2clk, 
  wmr_l, 
  l2t_l2b_wbrd_en_r0, 
  wb_array_dout, 
  l2t_l2b_evict_en_r0, 
  l2t_l2b_ev_dword_r0, 
  l2t_l2b_rdma_rden_r0, 
  rdma_array_dout, 
  l2t_l2b_wbrd_wl_r0, 
  l2t_l2b_wbwr_wen_c6, 
  l2t_l2b_wbwr_wl_c6, 
  l2t_l2b_rdma_rdwl_r0, 
  l2t_l2b_rdma_wren_s2, 
  l2t_l2b_rdma_wrwl_s2, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_clk_stop, 
  tcu_muxtest, 
  tcu_dectest, 
  scan_in, 
  scan_out, 
  mbist_addr, 
  wb_mbist_data_in, 
  mbist_wb_array_wr_en, 
  mbist_wb_array_rd_en, 
  mbist_rdma_array_wr_en, 
  mbist_rdma_array_rd_en, 
  mbist_sel_wb_arrays, 
  mbist_evict_muxsel, 
  mbist_run, 
  wb_or_rdma_rw_fail, 
  evict_l2b_mcu_wr_data_r5, 
  select_delay_mcu, 
  evict_l2b_mcu_data_vld_r5, 
  evict_l2b_mcu_data_mecc_r5, 
  evict_l2b_l2t_ev_uerr_r5, 
  evict_l2b_l2t_ev_cerr_r5, 
  evict_l2t_l2b_wbrd_en_r1_v1, 
  evict_l2t_l2b_wbrd_en_r1_v2, 
  evict_l2t_l2b_wbrd_en_r1_v3, 
  evict_l2t_l2b_wbrd_en_r1_v4, 
  evict_l2t_l2b_wbrd_wl_r1_v1, 
  evict_l2t_l2b_wbrd_wl_r1_v2, 
  evict_l2t_l2b_wbrd_wl_r1_v3, 
  evict_l2t_l2b_wbrd_wl_r1_v4, 
  evict_l2t_l2b_wbwr_wen_c8_v1, 
  evict_l2t_l2b_wbwr_wen_c8_v2, 
  evict_l2t_l2b_wbwr_wen_c8_v3, 
  evict_l2t_l2b_wbwr_wen_c8_v4, 
  evict_l2t_l2b_wbwr_wl_c8_v1, 
  evict_l2t_l2b_wbwr_wl_c8_v2, 
  evict_l2t_l2b_wbwr_wl_c8_v3, 
  evict_l2t_l2b_wbwr_wl_c8_v4, 
  evict_l2t_l2b_rdma_rden_r1_v1, 
  evict_l2t_l2b_rdma_rden_r1_v2, 
  evict_l2t_l2b_rdma_rden_r1_v3, 
  evict_l2t_l2b_rdma_rden_r1_v4, 
  evict_l2t_l2b_rdma_rdwl_r1_v1, 
  evict_l2t_l2b_rdma_rdwl_r1_v2, 
  evict_l2t_l2b_rdma_rdwl_r1_v3, 
  evict_l2t_l2b_rdma_rdwl_r1_v4, 
  evict_l2t_l2b_rdma_wren_s3, 
  evict_l2t_l2b_rdma_wren_s3_v4, 
  evict_l2t_l2b_rdma_wren_s3_v3, 
  evict_l2t_l2b_rdma_wren_s3_v2, 
  evict_l2t_l2b_rdma_wren_s3_v1, 
  evict_l2t_l2b_rdma_wrwl_s3_v1, 
  evict_l2t_l2b_rdma_wrwl_s3_v2, 
  evict_l2t_l2b_rdma_wrwl_s3_v3, 
  evict_l2t_l2b_rdma_wrwl_s3_v4);
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire stop;
wire muxtst;
wire test;
wire [0:0] sel_evct_mux_r3_1a_unused;
wire [3:0] sel_evct_mux_r3_1a;
wire [0:0] sel_evct_mux_r3_1b_unused;
wire [3:0] sel_evct_mux_r3_1b;
wire [0:0] sel_evct_mux_r3_2a_unused;
wire [3:0] sel_evct_mux_r3_2a;
wire [0:0] sel_evct_mux_r3_2b_unused;
wire [3:0] sel_evct_mux_r3_2b;
wire [1:0] l2t_l2b_ev_dword_r2_unused;
wire [1:0] l2t_l2b_ev_dword_r3_unused;
wire ff_mbist_run_scanin;
wire ff_mbist_run_scanout;
wire mbist_run_reg;
wire [7:0] wb_mbist_data_in_r2;
wire [7:0] wb_mbist_data_in_r1;
wire mbist_wb_array_rd_en_reg;
wire mbist_rdma_array_rd_en_reg;
wire mbist_sel_wb_arrays_reg;
wire [4:0] mbist_evict_muxsel_reg;
wire mbist_run_reg_n;
wire mbist_run_reg_v1_n;
wire mbist_run_reg_v1;
wire mbist_run_reg_v2_n;
wire mbist_run_reg_v2;
wire mbist_run_reg_v3_n;
wire mbist_run_reg_v3;
wire mbist_run_reg_v4_n;
wire mbist_run_reg_v4;
wire ff_mbist_run_v1_scanin;
wire ff_mbist_run_v1_scanout;
wire mbist_wb_array_wr_en_reg_v1;
wire [2:0] mbist_addr_reg_v1;
wire mbist_wb_array_rd_en_reg_v1;
wire mbist_rdma_array_wr_en_reg_v1;
wire mbist_rdma_array_rd_en_reg_v1;
wire ff_mbist_run_v2_scanin;
wire ff_mbist_run_v2_scanout;
wire mbist_wb_array_wr_en_reg_v2;
wire [2:0] mbist_addr_reg_v2;
wire mbist_wb_array_rd_en_reg_v2;
wire mbist_rdma_array_wr_en_reg_v2;
wire mbist_rdma_array_rd_en_reg_v2;
wire ff_mbist_run_v3_scanin;
wire ff_mbist_run_v3_scanout;
wire mbist_wb_array_wr_en_reg_v3;
wire [2:0] mbist_addr_reg_v3;
wire mbist_wb_array_rd_en_reg_v3;
wire mbist_rdma_array_wr_en_reg_v3;
wire mbist_rdma_array_rd_en_reg_v3;
wire ff_mbist_run_v4_scanin;
wire ff_mbist_run_v4_scanout;
wire mbist_wb_array_wr_en_reg_v4;
wire [2:0] mbist_addr_reg_v4;
wire mbist_wb_array_rd_en_reg_v4;
wire mbist_rdma_array_wr_en_reg_v4;
wire mbist_rdma_array_rd_en_reg_v4;
wire mbist_wbarray_write_en_c8_v1;
wire [2:0] writeback_array_wr_en_v1;
wire [1:0] compute_evict_l2t_l2b_rdma_wrwl_s3_v1;
wire l2t_l2b_wbwr_wen_c8_v1;
wire [2:0] l2t_l2b_wbwr_wl_c8_v1;
wire [2:0] l2t_l2b_wbrd_wl_r1_v1;
wire [1:0] l2t_l2b_rdma_rdwl_r1_v1;
wire [1:0] l2t_l2b_rdma_wrwl_s3_v1;
wire l2t_l2b_wbrd_en_r1_v1;
wire l2t_l2b_rdma_rden_r1_v1;
wire fnl_evict_l2t_l2b_rdma_wren_s3_v1;
wire mbist_wbarray_write_en_c8_v2;
wire [2:0] writeback_array_wr_en_v2;
wire [1:0] compute_evict_l2t_l2b_rdma_wrwl_s3_v2;
wire l2t_l2b_wbwr_wen_c8_v2;
wire [2:0] l2t_l2b_wbwr_wl_c8_v2;
wire [2:0] l2t_l2b_wbrd_wl_r1_v2;
wire [1:0] l2t_l2b_rdma_rdwl_r1_v2;
wire [1:0] l2t_l2b_rdma_wrwl_s3_v2;
wire l2t_l2b_wbrd_en_r1_v2;
wire l2t_l2b_rdma_rden_r1_v2;
wire fnl_evict_l2t_l2b_rdma_wren_s3_v2;
wire mbist_wbarray_write_en_c8_v3;
wire [2:0] writeback_array_wr_en_v3;
wire [1:0] compute_evict_l2t_l2b_rdma_wrwl_s3_v3;
wire l2t_l2b_wbwr_wen_c8_v3;
wire [2:0] l2t_l2b_wbwr_wl_c8_v3;
wire [2:0] l2t_l2b_wbrd_wl_r1_v3;
wire [1:0] l2t_l2b_rdma_rdwl_r1_v3;
wire [1:0] l2t_l2b_rdma_wrwl_s3_v3;
wire l2t_l2b_wbrd_en_r1_v3;
wire l2t_l2b_rdma_rden_r1_v3;
wire fnl_evict_l2t_l2b_rdma_wren_s3_v3;
wire mbist_wbarray_write_en_c8_v4;
wire [2:0] writeback_array_wr_en_v4;
wire [1:0] compute_evict_l2t_l2b_rdma_wrwl_s3_v4;
wire l2t_l2b_wbwr_wen_c8_v4;
wire [2:0] l2t_l2b_wbwr_wl_c8_v4;
wire [2:0] l2t_l2b_wbrd_wl_r1_v4;
wire [1:0] l2t_l2b_rdma_rdwl_r1_v4;
wire [1:0] l2t_l2b_rdma_wrwl_s3_v4;
wire l2t_l2b_wbrd_en_r1_v4;
wire l2t_l2b_rdma_rden_r1_v4;
wire fnl_evict_l2t_l2b_rdma_wren_s3_v4;
wire evict_l2t_l2b_rdma_wren_s3_6_or_4;
wire evict_l2t_l2b_rdma_wren_s3_0_or_2;
wire evict_l2t_l2b_rdma_wren_s3_1_or_3;
wire evict_l2t_l2b_rdma_wren_s3_5_or_7;
wire evict_l2t_l2b_rdma_wren_s3_8_or_14;
wire evict_l2t_l2b_rdma_wren_s3_10_or_12;
wire evict_l2t_l2b_rdma_wren_s3_15_or_13;
wire evict_l2t_l2b_rdma_wren_s3_11_or_9;
wire l2t_l2b_wbrd_en_r1_in;
wire l2t_l2b_wbrd_en_r1;
wire error_qual_and_l2t_l2b_evict_en_r3;
wire l2t_l2b_rdma_rden_r3;
wire ff_array_rd_ptr_din;
wire dbb_rst_l;
wire wb_or_rdma_rden_r2_1;
wire wb_or_rdma_rden_r2_sega;
wire wb_or_rdma_rden_r2_segb;
wire l2t_l2b_wbrd_en_r2_n;
wire ff_wb_array_dout_r3_1a_scanin;
wire ff_wb_array_dout_r3_1a_scanout;
wire ff_wb_array_dout_r3_1b_scanin;
wire ff_wb_array_dout_r3_1b_scanout;
wire ff_wb_array_dout_r3_1c_scanin;
wire ff_wb_array_dout_r3_1c_scanout;
wire ff_wb_array_dout_r3_1d_scanin;
wire ff_wb_array_dout_r3_1d_scanout;
wire ff_wb_array_dout_r3_2a_scanin;
wire ff_wb_array_dout_r3_2a_scanout;
wire ff_wb_array_dout_r3_2b_scanin;
wire ff_wb_array_dout_r3_2b_scanout;
wire ff_wb_array_dout_r3_2c_scanin;
wire ff_wb_array_dout_r3_2c_scanout;
wire ff_wb_array_dout_r3_2d_scanin;
wire ff_wb_array_dout_r3_2d_scanout;
wire ff_wb_array_dout_r3_3a_scanin;
wire ff_wb_array_dout_r3_3a_scanout;
wire ff_wb_array_dout_r3_3b_scanin;
wire ff_wb_array_dout_r3_3b_scanout;
wire ff_wb_array_dout_r3_3c_scanin;
wire ff_wb_array_dout_r3_3c_scanout;
wire ff_wb_array_dout_r3_3d_scanin;
wire ff_wb_array_dout_r3_3d_scanout;
wire ff_wb_array_dout_r3_4a_scanin;
wire ff_wb_array_dout_r3_4a_scanout;
wire ff_wb_array_dout_r3_4b_scanin;
wire ff_wb_array_dout_r3_4b_scanout;
wire ff_wb_array_dout_r3_4c_scanin;
wire ff_wb_array_dout_r3_4c_scanout;
wire ff_wb_array_dout_r3_4d_scanin;
wire ff_wb_array_dout_r3_4d_scanout;
wire sel_in0_r1;
wire sel_in1_r1;
wire sel_in2_r1;
wire sel_in3_r1;
wire [3:0] sel_evct_mux_r1;
wire l2t_l2b_ev_dword_r3_2;
wire mbist_pick_top_bot;
wire l2t_l2b_ev_dword_r3_2_n;
wire ff_wb_array_dout_r4a_scanin;
wire ff_wb_array_dout_r4a_scanout;
wire ff_wb_array_dout_r4b_scanin;
wire ff_wb_array_dout_r4b_scanout;
wire [15:0] unused;
wire [623:0] mbist_cmp_data;
wire [155:0] mbist_cmp_data_4t1;
wire [77:0] mbist_cmp_data_8t1;
wire [77:0] mbist_compare_data;
wire ff_mbist_cmp_r4a_scanin;
wire ff_mbist_cmp_r4a_scanout;
wire ff_mbist_cmp_r4b_scanin;
wire ff_mbist_cmp_r4b_scanout;
wire wb_or_rdma_rw_fail1;
wire wb_or_rdma_rw_fail2;
wire read_enable_piped;
wire mbist_wb_array_rd_en_reg2;
wire mbist_rdma_array_rd_en_reg2;
wire wb_or_rdma_rw_fail_unreg;
wire wb_or_rdma_rw_fail_unreg_out;
wire read_enable_piped1;
wire ff_fb_rw_fail_scanin;
wire ff_fb_rw_fail_scanout;
wire mbist_wb_array_rd_en_reg1;
wire mbist_rdma_array_rd_en_reg1;
wire parity0_r4;
wire parity1_r4;
wire check0_r4_3_0_nand;
wire check0_r4_4_5_parity_0_nand;
wire evict_notdata_err_lo_r4;
wire check1_r4_3_0_nand;
wire check1_r4_4_5_parity_1_nand;
wire evict_notdata_err_hi_r4;
wire error_qual_n;
wire evict_en_and_error_qual_;
wire l2t_l2b_evict_en_r4;
wire l2t_l2b_evict_en_r4_n;
wire check0or_n;
wire check1or_n;
wire parity0_nand_parity1;
wire check0_nand_check1;
wire parity0_nand_check1;
wire parity1_nand_check0;
wire evict_uncorr_err_r4_eqn2_;
wire parity_0_or_1_r4_;
wire parity_0_or_1_r4_err_qual_n;
wire notdata_err_loorhi_r4_n;
wire ff_wb_array_dout_r5_31_0_scanin;
wire ff_wb_array_dout_r5_31_0_scanout;
wire ff_wb_array_dout_r5_63_32_scanin;
wire ff_wb_array_dout_r5_63_32_scanout;
wire evict_uncorr_err_r5;
wire evict_corr_err_r5;
wire select_delay_mcu_n;
wire ff_evict_l2b_mcu_wr_data_r5_d1_scanin;
wire ff_evict_l2b_mcu_wr_data_r5_d1_scanout;
wire [63:0] wb_array_dout_r5_d1;
wire evict_mcu_uncorr_err_r5_d1;
wire l2t_l2b_evict_en_r5_d1;
wire evict_mcu_uncorr_err_r5;
wire l2t_l2b_evict_en_r5;
wire ff_evict_control_regs_slice_scanin;
wire ff_evict_control_regs_slice_scanout;
wire evict_uncorr_mcu_err_r5;
wire evict_notdata_err_lo_r5;
wire evict_notdata_err_hi_r5;
wire l2t_l2b_evict_en_r1_fnl;
wire l2t_l2b_evict_en_r2;
wire [3:0] sel_evct_mux_r2;
wire l2t_l2b_evict_en_r1;
wire ff_mux_select0_2b_scanin;
wire ff_mux_select0_2b_scanout;
wire [3:0] sel_evct_fnl_mux_sel;
wire ff_mux_select1_2a_scanin;
wire ff_mux_select1_2a_scanout;
wire ff_mux_select2_1b_scanin;
wire ff_mux_select2_1b_scanout;
wire ff_mux_select3_1a_scanin;
wire ff_mux_select3_1a_scanout;
wire ff_wb_control_regs_slice_scanin;
wire ff_wb_control_regs_slice_scanout;
wire ff_wb_control_regs_slice_v1_scanin;
wire ff_wb_control_regs_slice_v1_scanout;
wire ff_wb_control_regs_slice_v2_scanin;
wire ff_wb_control_regs_slice_v2_scanout;
wire ff_wb_control_regs_slice_v3_scanin;
wire ff_wb_control_regs_slice_v3_scanout;
wire ff_wb_control_regs_slice_v4_scanin;
wire ff_wb_control_regs_slice_v4_scanout;
wire [15:0] l2t_l2b_rdma_fnl_wren_s2;
wire ff_rdma_control_regs_slice_scanin;
wire ff_rdma_control_regs_slice_scanout;
wire ff_rdma_control_regs_slice_v1_scanin;
wire ff_rdma_control_regs_slice_v1_scanout;
wire ff_rdma_control_regs_slice_v2_scanin;
wire ff_rdma_control_regs_slice_v2_scanout;
wire ff_rdma_control_regs_slice_v3_scanin;
wire ff_rdma_control_regs_slice_v3_scanout;
wire ff_rdma_control_regs_slice_v4_scanin;
wire ff_rdma_control_regs_slice_v4_scanout;



input            l2clk;
input            wmr_l;
input            l2t_l2b_wbrd_en_r0;
input   [623:0]  wb_array_dout;
input            l2t_l2b_evict_en_r0;
input   [2:0]    l2t_l2b_ev_dword_r0;
input            l2t_l2b_rdma_rden_r0;
input   [623:0]  rdma_array_dout;

input   [2:0]    l2t_l2b_wbrd_wl_r0;
input            l2t_l2b_wbwr_wen_c6;
input   [2:0]    l2t_l2b_wbwr_wl_c6;
input   [1:0]    l2t_l2b_rdma_rdwl_r0;
input   [15:0]   l2t_l2b_rdma_wren_s2;
input   [1:0]    l2t_l2b_rdma_wrwl_s2;

input 		tcu_aclk;
input 		tcu_bclk;
input 		tcu_pce_ov;
input		tcu_scan_en;
input           tcu_clk_stop;
input	 	tcu_muxtest;	
input	 	tcu_dectest;	

input 		scan_in;
output 		scan_out;

// mbist ports

input	 [2:0]   mbist_addr;
input	 [7:0]   wb_mbist_data_in;
input	         mbist_wb_array_wr_en;
input	         mbist_wb_array_rd_en;
input	         mbist_rdma_array_wr_en;
input	         mbist_rdma_array_rd_en;
input	         mbist_sel_wb_arrays;
input	 [4:0]   mbist_evict_muxsel;	
input		 mbist_run;
//input	[2:0]	 mbist_compare_read_sel;
output		 wb_or_rdma_rw_fail;

assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign stop = tcu_clk_stop;
assign muxtst = tcu_muxtest;
assign test = tcu_dectest;

// Outputs
output  [63:0]   evict_l2b_mcu_wr_data_r5;
input			select_delay_mcu;

output           evict_l2b_mcu_data_vld_r5;
output           evict_l2b_mcu_data_mecc_r5;
output           evict_l2b_l2t_ev_uerr_r5;
output           evict_l2b_l2t_ev_cerr_r5;

output           evict_l2t_l2b_wbrd_en_r1_v1;
output           evict_l2t_l2b_wbrd_en_r1_v2;
output           evict_l2t_l2b_wbrd_en_r1_v3;
output           evict_l2t_l2b_wbrd_en_r1_v4;

output  [2:0]    evict_l2t_l2b_wbrd_wl_r1_v1;
output  [2:0]    evict_l2t_l2b_wbrd_wl_r1_v2;
output  [2:0]    evict_l2t_l2b_wbrd_wl_r1_v3;
output  [2:0]    evict_l2t_l2b_wbrd_wl_r1_v4;

output           evict_l2t_l2b_wbwr_wen_c8_v1;
output           evict_l2t_l2b_wbwr_wen_c8_v2;
output           evict_l2t_l2b_wbwr_wen_c8_v3;
output           evict_l2t_l2b_wbwr_wen_c8_v4;

output  [2:0]    evict_l2t_l2b_wbwr_wl_c8_v1;
output  [2:0]    evict_l2t_l2b_wbwr_wl_c8_v2;
output  [2:0]    evict_l2t_l2b_wbwr_wl_c8_v3;
output  [2:0]    evict_l2t_l2b_wbwr_wl_c8_v4;

output           evict_l2t_l2b_rdma_rden_r1_v1;
output           evict_l2t_l2b_rdma_rden_r1_v2;
output           evict_l2t_l2b_rdma_rden_r1_v3;
output           evict_l2t_l2b_rdma_rden_r1_v4;

output  [1:0]    evict_l2t_l2b_rdma_rdwl_r1_v1;
output  [1:0]    evict_l2t_l2b_rdma_rdwl_r1_v2;
output  [1:0]    evict_l2t_l2b_rdma_rdwl_r1_v3;
output  [1:0]    evict_l2t_l2b_rdma_rdwl_r1_v4;

output  [15:0]   evict_l2t_l2b_rdma_wren_s3;

output           evict_l2t_l2b_rdma_wren_s3_v4 ;
output           evict_l2t_l2b_rdma_wren_s3_v3 ;
output           evict_l2t_l2b_rdma_wren_s3_v2 ;
output           evict_l2t_l2b_rdma_wren_s3_v1 ;

output  [1:0]    evict_l2t_l2b_rdma_wrwl_s3_v1;
output  [1:0]    evict_l2t_l2b_rdma_wrwl_s3_v2;
output  [1:0]    evict_l2t_l2b_rdma_wrwl_s3_v3;
output  [1:0]    evict_l2t_l2b_rdma_wrwl_s3_v4;



//////////////////////////////////////////////////////////////////////////////////

wire             l2t_l2b_wbrd_en_r2;
wire             l2t_l2b_rdma_rden_r1;
wire             l2t_l2b_rdma_rden_r2;
wire             wb_or_rdma_rden_r2;
wire    [623:0]  wb_rdma_mux_out;
wire    [623:0]  wb_array_dout_r3;
wire    [ 77:0]  wb_array_dout_r4;
wire    [ 63:0]  wb_array_dout_r5;

wire    [  2:0]  l2t_l2b_ev_dword_r1;
wire    [  2:0]  l2t_l2b_ev_dword_r2;
wire    [  2:0]  l2t_l2b_ev_dword_r3;
wire    [155:0]  wb_array_dout_r3_4t1;
wire    [ 77:0]  wb_array_dout_r3_8t1;

wire    [ 63:0]  wb_array_dout_ecc_r4;
wire    [  5:0]  check0_r4;
wire    [  5:0]  check1_r4;
wire             evict_uncorr_err_r4;
wire             evict_uncorr_mcu_err_r4;
wire             evict_corr_err_r4;

wire             l2t_l2b_wbwr_wen_c7;
wire    [  2:0]  l2t_l2b_wbwr_wl_c7;

wire             l2t_l2b_wbwr_wen_c8;
//wire    [1:0]    l2t_l2b_rdma_rdwl_r1;
//wire    [1:0]    l2t_l2b_rdma_wrwl_s3;

wire             l2t_l2b_evict_en_r3;
wire             error_qual_in;
wire             error_qual;

// make vlint happy
assign sel_evct_mux_r3_1a_unused[0] = sel_evct_mux_r3_1a[0];
assign sel_evct_mux_r3_1b_unused[0] = sel_evct_mux_r3_1b[0];
assign sel_evct_mux_r3_2a_unused[0] = sel_evct_mux_r3_2a[0];
assign sel_evct_mux_r3_2b_unused[0] = sel_evct_mux_r3_2b[0];
assign l2t_l2b_ev_dword_r2_unused[1:0] = 2'b0;
assign l2t_l2b_ev_dword_r3_unused[1:0] = 2'b0;


//////////////////////////////////////////////////////////////////////////////////

l2b_evict_dp_msff_macro__stack_26c__width_25 ff_mbist_run 
        (
        .scan_in(ff_mbist_run_scanin),
        .scan_out(ff_mbist_run_scanout),
        .dout   ({mbist_run_reg, wb_mbist_data_in_r2[7:0],wb_mbist_data_in_r1[7:0],
		  mbist_wb_array_rd_en_reg,mbist_rdma_array_rd_en_reg,
                  mbist_sel_wb_arrays_reg,mbist_evict_muxsel_reg[4:0]}),
        .din    ({mbist_run, wb_mbist_data_in_r1[7:0],wb_mbist_data_in[7:0],
		  mbist_wb_array_rd_en,mbist_rdma_array_rd_en,
		  mbist_sel_wb_arrays,mbist_evict_muxsel[4:0]}),
        .en    (1'b1),
        .clk    (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2b_evict_dp_inv_macro__width_1   inv_mbist_run_reg 
	(
	.dout	(mbist_run_reg_n),
	.din	(mbist_run_reg)
	);

l2b_evict_dp_inv_macro__width_1   inv_mbist_run_v1_reg 
	(
	.dout	(mbist_run_reg_v1_n),
	.din	(mbist_run_reg_v1)
	);

l2b_evict_dp_inv_macro__width_1   inv_mbist_run_v2_reg 
	(
	.dout	(mbist_run_reg_v2_n),
	.din	(mbist_run_reg_v2)
	);

l2b_evict_dp_inv_macro__width_1   inv_mbist_run_v3_reg 
	(
	.dout	(mbist_run_reg_v3_n),
	.din	(mbist_run_reg_v3)
	);

l2b_evict_dp_inv_macro__width_1   inv_mbist_run_v4_reg 
	(
	.dout	(mbist_run_reg_v4_n),
	.din	(mbist_run_reg_v4)
	);

l2b_evict_dp_msff_macro__stack_8c__width_8 ff_mbist_run_v1 
        (
        .scan_in(ff_mbist_run_v1_scanin),
        .scan_out(ff_mbist_run_v1_scanout),
        .dout   ({mbist_run_reg_v1,mbist_wb_array_wr_en_reg_v1,mbist_addr_reg_v1[2:0],mbist_wb_array_rd_en_reg_v1,mbist_rdma_array_wr_en_reg_v1,
                  mbist_rdma_array_rd_en_reg_v1}),
        .din    ({mbist_run       ,mbist_wb_array_wr_en       ,mbist_addr[2:0],       mbist_wb_array_rd_en,       mbist_rdma_array_wr_en,
                  mbist_rdma_array_rd_en}),
        .clk    (l2clk),
        .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
        );



l2b_evict_dp_msff_macro__stack_8c__width_8 ff_mbist_run_v2 
        (
        .scan_in(ff_mbist_run_v2_scanin),
        .scan_out(ff_mbist_run_v2_scanout),
        .dout   ({mbist_run_reg_v2,mbist_wb_array_wr_en_reg_v2,mbist_addr_reg_v2[2:0],mbist_wb_array_rd_en_reg_v2,mbist_rdma_array_wr_en_reg_v2,
                  mbist_rdma_array_rd_en_reg_v2}),
        .din    ({mbist_run       ,mbist_wb_array_wr_en       ,mbist_addr[2:0],       mbist_wb_array_rd_en,       mbist_rdma_array_wr_en,
                  mbist_rdma_array_rd_en}),
        .clk    (l2clk),
        .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
        );


l2b_evict_dp_msff_macro__stack_8c__width_8 ff_mbist_run_v3 
        (
        .scan_in(ff_mbist_run_v3_scanin),
        .scan_out(ff_mbist_run_v3_scanout),
        .dout   ({mbist_run_reg_v3,mbist_wb_array_wr_en_reg_v3,mbist_addr_reg_v3[2:0],mbist_wb_array_rd_en_reg_v3,mbist_rdma_array_wr_en_reg_v3,
                  mbist_rdma_array_rd_en_reg_v3}),
        .din    ({mbist_run       ,mbist_wb_array_wr_en       ,mbist_addr[2:0],       mbist_wb_array_rd_en,       mbist_rdma_array_wr_en,
                  mbist_rdma_array_rd_en}),
        .clk    (l2clk),
        .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
        );


l2b_evict_dp_msff_macro__stack_8c__width_8 ff_mbist_run_v4 
        (
        .scan_in(ff_mbist_run_v4_scanin),
        .scan_out(ff_mbist_run_v4_scanout),
        .dout   ({mbist_run_reg_v4,mbist_wb_array_wr_en_reg_v4,mbist_addr_reg_v4[2:0],mbist_wb_array_rd_en_reg_v4,mbist_rdma_array_wr_en_reg_v4,
                  mbist_rdma_array_rd_en_reg_v4}),
        .din    ({mbist_run       ,mbist_wb_array_wr_en       ,mbist_addr[2:0],       mbist_wb_array_rd_en,       mbist_rdma_array_wr_en,
                  mbist_rdma_array_rd_en}),
        .clk    (l2clk),
        .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
        );



// mux_macro    mux_rdma_fnl_wren_v1   (width=1,mux=aonpe,ports=2,stack=2r,dmux=8x)
//         (
//         .dout   (mbist_wbarray_write_en_c8_v1),
//         .din0   (l2t_l2b_wbwr_wen_c8_v1),
//         .din1   (mbist_wb_array_wr_en_reg_v1),
//         .sel0   (mbist_run_reg_v1_n),
//         .sel1   (mbist_run_reg_v1)
//         );
//
//
//mux_macro    mux_rdma_fnl_wren_v2   (width=1,mux=aonpe,ports=2,stack=2r,dmux=8x)
//        (
//        .dout   (mbist_wbarray_write_en_c8_v2),
//        .din0   (l2t_l2b_wbwr_wen_c8_v2),
//        .din1   (mbist_wb_array_wr_en_reg_v2),
//        .sel0   (mbist_run_reg_v2_n),
//        .sel1   (mbist_run_reg_v2)
//        );
//
//
//mux_macro    mux_rdma_fnl_wren_v3   (width=1,mux=aonpe,ports=2,stack=2r,dmux=8x)
//        (
//        .dout   (mbist_wbarray_write_en_c8_v3),
//        .din0   (l2t_l2b_wbwr_wen_c8_v3),
//        .din1   (mbist_wb_array_wr_en_reg_v3),
//        .sel0   (mbist_run_reg_v3_n),
//        .sel1   (mbist_run_reg_v3)
//        );
//
// mux_macro    mux_rdma_fnl_wren_v4   (width=1,mux=aonpe,ports=2,stack=2r,dmux=8x)
//         (
//         .dout   (mbist_wbarray_write_en_c8_v4),
//         .din0   (l2t_l2b_wbwr_wen_c8_v4),
//         .din1   (mbist_wb_array_wr_en_reg_v4),
//         .sel0   (mbist_run_reg_v4_n),
//         .sel1   (mbist_run_reg_v4)
//         );

//      .dout   (evict_l2t_l2b_wbrd_wl_r1_v1[2:0]),
//      .din0   (l2t_l2b_wbrd_wl_r1_v1[2:0]),
//      .din1   (mbist_addr_reg_v1[2:0]),

//         .dout   (evict_l2t_l2b_rdma_rdwl_r1_v1[1:0]),
//         .din0   (l2t_l2b_rdma_rdwl_r1_v1[1:0]),
//         .din1   (mbist_addr_reg_v1[1:0]),

//       .dout   (compute_evict_l2t_l2b_rdma_wrwl_s3_v1[1:0]),
//       .din0   (l2t_l2b_rdma_wrwl_s3_v1[1:0]),
//       .din1   (mbist_addr_reg_v1[1:0]),

//         .dout   ({evict_l2t_l2b_wbrd_en_r1_v1,evict_l2t_l2b_rdma_rden_r1_v1}),
//         .din0   ({l2t_l2b_wbrd_en_r1_v1,l2t_l2b_rdma_rden_r1_v1}),
//         .din1   ({mbist_wb_array_rd_en_reg_v1,mbist_rdma_array_rd_en_reg_v1}),


l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_14r__width_14    mux_mbist_v1    (
        .dout   ({mbist_wbarray_write_en_c8_v1, writeback_array_wr_en_v1[2:0],evict_l2t_l2b_wbrd_wl_r1_v1[2:0], 
                  evict_l2t_l2b_rdma_rdwl_r1_v1[1:0], compute_evict_l2t_l2b_rdma_wrwl_s3_v1[1:0]  ,
                  evict_l2t_l2b_wbrd_en_r1_v1,evict_l2t_l2b_rdma_rden_r1_v1,evict_l2t_l2b_rdma_wren_s3_v1}        ),
        .din0   ({l2t_l2b_wbwr_wen_c8_v1, l2t_l2b_wbwr_wl_c8_v1[2:0], l2t_l2b_wbrd_wl_r1_v1[2:0],
                  l2t_l2b_rdma_rdwl_r1_v1[1:0], l2t_l2b_rdma_wrwl_s3_v1[1:0] ,
                  l2t_l2b_wbrd_en_r1_v1,l2t_l2b_rdma_rden_r1_v1,fnl_evict_l2t_l2b_rdma_wren_s3_v1}         ),
        .din1   ({mbist_wb_array_wr_en_reg_v1, mbist_addr_reg_v1[2:0], mbist_addr_reg_v1[2:0], 
                  mbist_addr_reg_v1[1:0], mbist_addr_reg_v1[1:0], 
                  mbist_wb_array_rd_en_reg_v1,mbist_rdma_array_rd_en_reg_v1,mbist_rdma_array_wr_en_reg_v1}          ),
        .sel0   (mbist_run_reg_v1_n),
        .sel1   (mbist_run_reg_v1)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_14r__width_14    mux_mbist_v2    (
        .dout   ({mbist_wbarray_write_en_c8_v2, writeback_array_wr_en_v2[2:0],evict_l2t_l2b_wbrd_wl_r1_v2[2:0], 
                  evict_l2t_l2b_rdma_rdwl_r1_v2[1:0], compute_evict_l2t_l2b_rdma_wrwl_s3_v2[1:0]  ,
                  evict_l2t_l2b_wbrd_en_r1_v2,evict_l2t_l2b_rdma_rden_r1_v2,evict_l2t_l2b_rdma_wren_s3_v2}        ),
        .din0   ({l2t_l2b_wbwr_wen_c8_v2, l2t_l2b_wbwr_wl_c8_v2[2:0], l2t_l2b_wbrd_wl_r1_v2[2:0],
                  l2t_l2b_rdma_rdwl_r1_v2[1:0], l2t_l2b_rdma_wrwl_s3_v2[1:0] ,
                  l2t_l2b_wbrd_en_r1_v2,l2t_l2b_rdma_rden_r1_v2,fnl_evict_l2t_l2b_rdma_wren_s3_v2}         ),
        .din1   ({mbist_wb_array_wr_en_reg_v2, mbist_addr_reg_v2[2:0], mbist_addr_reg_v2[2:0], 
                  mbist_addr_reg_v2[1:0], mbist_addr_reg_v2[1:0], 
                  mbist_wb_array_rd_en_reg_v2,mbist_rdma_array_rd_en_reg_v2,mbist_rdma_array_wr_en_reg_v2}          ),
        .sel0   (mbist_run_reg_v2_n),
        .sel1   (mbist_run_reg_v2)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_14r__width_14    mux_mbist_v3    (
        .dout   ({mbist_wbarray_write_en_c8_v3, writeback_array_wr_en_v3[2:0],evict_l2t_l2b_wbrd_wl_r1_v3[2:0], 
                  evict_l2t_l2b_rdma_rdwl_r1_v3[1:0], compute_evict_l2t_l2b_rdma_wrwl_s3_v3[1:0]  ,
                  evict_l2t_l2b_wbrd_en_r1_v3,evict_l2t_l2b_rdma_rden_r1_v3,evict_l2t_l2b_rdma_wren_s3_v3}        ),
        .din0   ({l2t_l2b_wbwr_wen_c8_v3, l2t_l2b_wbwr_wl_c8_v3[2:0], l2t_l2b_wbrd_wl_r1_v3[2:0],
                  l2t_l2b_rdma_rdwl_r1_v3[1:0], l2t_l2b_rdma_wrwl_s3_v3[1:0] ,
                  l2t_l2b_wbrd_en_r1_v3,l2t_l2b_rdma_rden_r1_v3,fnl_evict_l2t_l2b_rdma_wren_s3_v3}         ),
        .din1   ({mbist_wb_array_wr_en_reg_v3, mbist_addr_reg_v3[2:0], mbist_addr_reg_v3[2:0], 
                  mbist_addr_reg_v3[1:0], mbist_addr_reg_v3[1:0], 
                  mbist_wb_array_rd_en_reg_v3,mbist_rdma_array_rd_en_reg_v3,mbist_rdma_array_wr_en_reg_v3}          ),
        .sel0   (mbist_run_reg_v3_n),
        .sel1   (mbist_run_reg_v3)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_14r__width_14    mux_mbist_v4    (
        .dout   ({mbist_wbarray_write_en_c8_v4, writeback_array_wr_en_v4[2:0],evict_l2t_l2b_wbrd_wl_r1_v4[2:0], 
                  evict_l2t_l2b_rdma_rdwl_r1_v4[1:0], compute_evict_l2t_l2b_rdma_wrwl_s3_v4[1:0]  ,
                  evict_l2t_l2b_wbrd_en_r1_v4,evict_l2t_l2b_rdma_rden_r1_v4,evict_l2t_l2b_rdma_wren_s3_v4}        ),
        .din0   ({l2t_l2b_wbwr_wen_c8_v4, l2t_l2b_wbwr_wl_c8_v4[2:0], l2t_l2b_wbrd_wl_r1_v4[2:0],
                  l2t_l2b_rdma_rdwl_r1_v4[1:0], l2t_l2b_rdma_wrwl_s3_v4[1:0] ,
                  l2t_l2b_wbrd_en_r1_v4,l2t_l2b_rdma_rden_r1_v4,fnl_evict_l2t_l2b_rdma_wren_s3_v4}         ),
        .din1   ({mbist_wb_array_wr_en_reg_v4, mbist_addr_reg_v4[2:0], mbist_addr_reg_v4[2:0], 
                  mbist_addr_reg_v4[1:0], mbist_addr_reg_v4[1:0], 
                  mbist_wb_array_rd_en_reg_v4,mbist_rdma_array_rd_en_reg_v4,mbist_rdma_array_wr_en_reg_v4}          ),
        .sel0   (mbist_run_reg_v4_n),
        .sel1   (mbist_run_reg_v4)
        );

l2b_evict_dp_buff_macro__width_1     l2t_l2b_wbwr_wen_c8_v1_slice   
	(
  	.din ( mbist_wbarray_write_en_c8_v1 ),
  	.dout( evict_l2t_l2b_wbwr_wen_c8_v1)
	);

l2b_evict_dp_buff_macro__width_1     l2t_l2b_wbwr_wen_c8_v2_slice   
	(
  	.din ( mbist_wbarray_write_en_c8_v2 ),
  	.dout( evict_l2t_l2b_wbwr_wen_c8_v2)
	);

l2b_evict_dp_buff_macro__width_1     l2t_l2b_wbwr_wen_c8_v3_slice   
	(
  	.din ( mbist_wbarray_write_en_c8_v3 ),
  	.dout( evict_l2t_l2b_wbwr_wen_c8_v3)
	);

l2b_evict_dp_buff_macro__width_1     l2t_l2b_wbwr_wen_c8_v4_slice   
	(
  	.din ( mbist_wbarray_write_en_c8_v4 ),
  	.dout( evict_l2t_l2b_wbwr_wen_c8_v4)
	);

// mux_macro	mux_writeback_array_wr_en_v1 (width=3,mux=aonpe,ports=2,dmux=8x,stack=4c)
// 	(
// 	.dout	(writeback_array_wr_en_v1[2:0]),
// 	.din0	(mbist_addr_reg_v1[2:0]),
// 	.din1	(l2t_l2b_wbwr_wl_c8_v1[2:0]),
// 	.sel0	(mbist_run_reg_v1),
// 	.sel1	(mbist_run_reg_v1_n)
// 	);
//	
//
//mux_macro	mux_writeback_array_wr_en_v2 (width=3,mux=aonpe,ports=2,dmux=8x,stack=4c)
//	(
//	.dout	(writeback_array_wr_en_v2[2:0]),
//	.din0	(mbist_addr_reg_v2[2:0]),
//	.din1	(l2t_l2b_wbwr_wl_c8_v2[2:0]),
//	.sel0	(mbist_run_reg_v2),
//	.sel1	(mbist_run_reg_v2_n)
//	);
//	
//
//mux_macro	mux_writeback_array_wr_en_v3 (width=3,mux=aonpe,ports=2,dmux=8x,stack=4c)
//	(
//	.dout	(writeback_array_wr_en_v3[2:0]),
//	.din0	(mbist_addr_reg_v3[2:0]),
//	.din1	(l2t_l2b_wbwr_wl_c8_v3[2:0]),
//	.sel0	(mbist_run_reg_v3),
//	.sel1	(mbist_run_reg_v3_n)
//	);
//	
//
// mux_macro	mux_writeback_array_wr_en_v4 (width=3,mux=aonpe,ports=2,dmux=8x,stack=4c)
// 	(
// 	.dout	(writeback_array_wr_en_v4[2:0]),
// 	.din0	(mbist_addr_reg_v4[2:0]),
// 	.din1	(l2t_l2b_wbwr_wl_c8_v4[2:0]),
// 	.sel0	(mbist_run_reg_v4),
// 	.sel1	(mbist_run_reg_v4_n)
// 	);
	

l2b_evict_dp_buff_macro__width_3     evict_l2t_l2b_wbwr_wl_c8_v1_slice 
		(
		.din	(writeback_array_wr_en_v1[2:0]),
		.dout 	(evict_l2t_l2b_wbwr_wl_c8_v1[2:0])
		);

l2b_evict_dp_buff_macro__width_3     evict_l2t_l2b_wbwr_wl_c8_v2_slice 
                (
		.din	(writeback_array_wr_en_v2[2:0]),
                .dout   (evict_l2t_l2b_wbwr_wl_c8_v2[2:0])
                );


l2b_evict_dp_buff_macro__width_3     evict_l2t_l2b_wbwr_wl_c8_v3_slice 
                (
		.din	(writeback_array_wr_en_v3[2:0]),
                .dout   (evict_l2t_l2b_wbwr_wl_c8_v3[2:0])
                );


l2b_evict_dp_buff_macro__width_3     evict_l2t_l2b_wbwr_wl_c8_v4_slice 
                (
		.din	(writeback_array_wr_en_v4[2:0]),
                .dout   (evict_l2t_l2b_wbwr_wl_c8_v4[2:0])
                );

//msff_macro    ff_l2t_l2b_wbrd_wl_r1	(width=3)
//              (.dout   (l2t_l2b_wbrd_wl_r1[2:0]),
//               .din (l2t_l2b_wbrd_wl_r0[2:0]),
//               .clk (l2clk),
//               .en  (1'b1), .scan_in  (), .scan_out  ()
//              ) ;


//or_macro   or_evict_l2t_l2b_wbrd_wl_r1_v1 (width=3)
//	(
//	.dout	(evict_l2t_l2b_wbrd_wl_r1_v1[2:0]),
//	.din0	(l2t_l2b_wbrd_wl_r1[2:0]),
//	.din1	(mbist_addr_reg[2:0])
//	);
//
//or_macro   or_evict_l2t_l2b_wbrd_wl_r1_v2 (width=3)
//        (
//        .dout   (evict_l2t_l2b_wbrd_wl_r1_v2[2:0]),
//        .din0   (l2t_l2b_wbrd_wl_r1[2:0]),
//        .din1   (mbist_addr_reg[2:0])
//        );
//or_macro   or_evict_l2t_l2b_wbrd_wl_r1_v3 (width=3)
//        (
//        .dout   (evict_l2t_l2b_wbrd_wl_r1_v3[2:0]),
//        .din0   (l2t_l2b_wbrd_wl_r1[2:0]),
//        .din1   (mbist_addr_reg[2:0])
//        );
//or_macro   or_evict_l2t_l2b_wbrd_wl_r1_v4 (width=3)
//        (
//        .dout   (evict_l2t_l2b_wbrd_wl_r1_v4[2:0]),
//        .din0   (l2t_l2b_wbrd_wl_r1[2:0]),
//        .din1   (mbist_addr_reg[2:0])
//        );
//
//or_macro   or_evict_l2t_l2b_rdma_rdwl_r1_v1 (width=2)
//        (
//        .dout   (evict_l2t_l2b_rdma_rdwl_r1_v1[1:0]),
//        .din0   (l2t_l2b_rdma_rdwl_r1[1:0]),
//        .din1   (mbist_addr_reg[1:0])
//        );
//
//or_macro   or_evict_l2t_l2b_rdma_rdwl_r1_v2 (width=2)
//        (
//        .dout   (evict_l2t_l2b_rdma_rdwl_r1_v2[1:0]),
//        .din0   (l2t_l2b_rdma_rdwl_r1[1:0]),
//        .din1   (mbist_addr_reg[1:0])
//        );
//or_macro   or_evict_l2t_l2b_rdma_rdwl_r1_v3 (width=2)
//        (
//        .dout   (evict_l2t_l2b_rdma_rdwl_r1_v3[1:0]),
//        .din0   (l2t_l2b_rdma_rdwl_r1[1:0]),
//        .din1   (mbist_addr_reg[1:0])
//        );
//or_macro   or_evict_l2t_l2b_rdma_rdwl_r1_v4 (width=2)
//        (
//        .dout   (evict_l2t_l2b_rdma_rdwl_r1_v4[1:0]),
//        .din0   (l2t_l2b_rdma_rdwl_r1[1:0]),
//        .din1   (mbist_addr_reg[1:0])
//        );


// mux_macro   mux_evict_l2t_l2b_wbrd_wl_r1_v1 (width=3,mux=aonpe,ports=2,dmux=8x,stack=4c)
// 	(
// 	.dout	(evict_l2t_l2b_wbrd_wl_r1_v1[2:0]),
// 	.din0	(l2t_l2b_wbrd_wl_r1_v1[2:0]),
// 	.din1	(mbist_addr_reg_v1[2:0]),
// 	.sel0	(mbist_run_reg_v1_n),
// 	.sel1	(mbist_run_reg_v1)
// 	);

//mux_macro   mux_evict_l2t_l2b_wbrd_wl_r1_v2 (width=3,mux=aonpe,ports=2,dmux=8x,stack=4c)
//        (
//        .dout   (evict_l2t_l2b_wbrd_wl_r1_v2[2:0]),
//        .din0   (l2t_l2b_wbrd_wl_r1_v2[2:0]),
//        .din1   (mbist_addr_reg_v2[2:0]),
//	.sel0	(mbist_run_reg_v2_n),
//	.sel1	(mbist_run_reg_v2)
//        );
//mux_macro   mux_evict_l2t_l2b_wbrd_wl_r1_v3 (width=3,mux=aonpe,ports=2,dmux=8x,stack=4c)
//        (
//        .dout   (evict_l2t_l2b_wbrd_wl_r1_v3[2:0]),
//        .din0   (l2t_l2b_wbrd_wl_r1_v3[2:0]),
//        .din1   (mbist_addr_reg_v3[2:0]),
//        .sel0   (mbist_run_reg_v3_n),
//        .sel1   (mbist_run_reg_v3)
//        );
// mux_macro   mux_evict_l2t_l2b_wbrd_wl_r1_v4 (width=3,mux=aonpe,ports=2,dmux=8x,stack=4c)
//        (
//        .dout   (evict_l2t_l2b_wbrd_wl_r1_v4[2:0]),
//        .din0   (l2t_l2b_wbrd_wl_r1_v4[2:0]),
//        .din1   (mbist_addr_reg_v4[2:0]),
//        .sel0   (mbist_run_reg_v4_n),
//        .sel1   (mbist_run_reg_v4)
//        );
//
// mux_macro   mux_evict_l2t_l2b_rdma_rdwl_r1_v1 (width=2,mux=aonpe,ports=2,dmux=8x,stack=2c)
//         (
//         .dout   (evict_l2t_l2b_rdma_rdwl_r1_v1[1:0]),
//         .din0   (l2t_l2b_rdma_rdwl_r1_v1[1:0]),
//         .din1   (mbist_addr_reg_v1[1:0]),
//         .sel0   (mbist_run_reg_v1_n),
//         .sel1   (mbist_run_reg_v1)
//         );
//
//mux_macro   mux_evict_l2t_l2b_rdma_rdwl_r1_v2 (width=2,mux=aonpe,ports=2,dmux=8x,stack=2c)
//        (
//        .dout   (evict_l2t_l2b_rdma_rdwl_r1_v2[1:0]),
//        .din0   (l2t_l2b_rdma_rdwl_r1_v2[1:0]),
//        .din1   (mbist_addr_reg_v2[1:0]),
//        .sel0   (mbist_run_reg_v2_n),
//        .sel1   (mbist_run_reg_v2)
//        );
//mux_macro   mux_evict_l2t_l2b_rdma_rdwl_r1_v3 (width=2,mux=aonpe,ports=2,dmux=8x,stack=2c)
//        (
//        .dout   (evict_l2t_l2b_rdma_rdwl_r1_v3[1:0]),
//        .din0   (l2t_l2b_rdma_rdwl_r1_v3[1:0]),
//        .din1   (mbist_addr_reg_v3[1:0]),
//        .sel0   (mbist_run_reg_v3_n),
//        .sel1   (mbist_run_reg_v3)
//        );
//mux_macro   mux_evict_l2t_l2b_rdma_rdwl_r1_v4 (width=2,mux=aonpe,ports=2,dmux=8x,stack=2c)
//        (
//        .dout   (evict_l2t_l2b_rdma_rdwl_r1_v4[1:0]),
//        .din0   (l2t_l2b_rdma_rdwl_r1_v4[1:0]),
//        .din1   (mbist_addr_reg_v4[1:0]),
//        .sel0   (mbist_run_reg_v4_n),
//        .sel1   (mbist_run_reg_v4)
//        );
//


l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_6_or_4_slice  
	( 
	.dout 	(evict_l2t_l2b_rdma_wren_s3_6_or_4), 
	.din0	(evict_l2t_l2b_rdma_wren_s3[6]), 
	.din1	(evict_l2t_l2b_rdma_wren_s3[4]) 
	); 

l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_0_or_2_slice  
        (
        .dout   (evict_l2t_l2b_rdma_wren_s3_0_or_2),
        .din0   (evict_l2t_l2b_rdma_wren_s3[2]),
        .din1   (evict_l2t_l2b_rdma_wren_s3[0])
        );

l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_v4_slice 
        (
        .dout   (fnl_evict_l2t_l2b_rdma_wren_s3_v4),
        .din0   (evict_l2t_l2b_rdma_wren_s3_6_or_4),
        .din1   (evict_l2t_l2b_rdma_wren_s3_0_or_2)
        );


//// Have not changed it yet.
// mux_macro  mux_evict_l2t_l2b_rdma_wren_s3_v1_v2_v3_v4 (width=4,mux=aonpe,ports=2,dmux=8x, stack=4c)
//       (
//       .dout   ({evict_l2t_l2b_rdma_wren_s3_v4,evict_l2t_l2b_rdma_wren_s3_v3,
// 			evict_l2t_l2b_rdma_wren_s3_v2,evict_l2t_l2b_rdma_wren_s3_v1}),
//       .din0   ({fnl_evict_l2t_l2b_rdma_wren_s3_v4,fnl_evict_l2t_l2b_rdma_wren_s3_v3,
// 			fnl_evict_l2t_l2b_rdma_wren_s3_v2,fnl_evict_l2t_l2b_rdma_wren_s3_v1}),
//       .din1   ({4{mbist_rdma_array_wr_en_reg}}),
//       .sel0   (mbist_run_reg_n),
//       .sel1   (mbist_run_reg)
//       );


l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_1_or_3_slice  
        (
        .dout   (evict_l2t_l2b_rdma_wren_s3_1_or_3),
        .din0   (evict_l2t_l2b_rdma_wren_s3[1]),
        .din1   (evict_l2t_l2b_rdma_wren_s3[3])
        );
l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_5_or_7_slice 
        (
        .dout   (evict_l2t_l2b_rdma_wren_s3_5_or_7),
        .din0   (evict_l2t_l2b_rdma_wren_s3[5]),
        .din1   (evict_l2t_l2b_rdma_wren_s3[7])
        );

l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_v3_slice 
        (
        .dout   (fnl_evict_l2t_l2b_rdma_wren_s3_v3),
        .din0   (evict_l2t_l2b_rdma_wren_s3_5_or_7),
        .din1   (evict_l2t_l2b_rdma_wren_s3_1_or_3)
        );

l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_8_or_14_slice  
        (
        .dout   (evict_l2t_l2b_rdma_wren_s3_8_or_14),
        .din0   (evict_l2t_l2b_rdma_wren_s3[8]),
        .din1   (evict_l2t_l2b_rdma_wren_s3[14])
        );
l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_10_or_12_slice 
        (
        .dout   (evict_l2t_l2b_rdma_wren_s3_10_or_12),
        .din0   (evict_l2t_l2b_rdma_wren_s3[12]),
        .din1   (evict_l2t_l2b_rdma_wren_s3[10])
        );

l2b_evict_dp_or_macro__ports_2__width_1 evict_l2t_l2b_rdma_wren_s2_v4_slice 
        (
        .dout   (fnl_evict_l2t_l2b_rdma_wren_s3_v2),
        .din0   (evict_l2t_l2b_rdma_wren_s3_10_or_12),
        .din1   (evict_l2t_l2b_rdma_wren_s3_8_or_14)
        );

l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_15_or_13_slice 
        (
        .dout   (evict_l2t_l2b_rdma_wren_s3_15_or_13),
        .din0   (evict_l2t_l2b_rdma_wren_s3[15]),
        .din1   (evict_l2t_l2b_rdma_wren_s3[13])
        );
l2b_evict_dp_or_macro__width_1 evict_l2t_l2b_rdma_wren_s3_11_or_9_slice 
        (
        .dout   (evict_l2t_l2b_rdma_wren_s3_11_or_9),
        .din0   (evict_l2t_l2b_rdma_wren_s3[9]),
        .din1   (evict_l2t_l2b_rdma_wren_s3[11])
        );

l2b_evict_dp_or_macro__ports_2__width_1 evict_l2t_l2b_rdma_wren_s3_v1_slice 
        (
        .dout   (fnl_evict_l2t_l2b_rdma_wren_s3_v1),
        .din0   (evict_l2t_l2b_rdma_wren_s3_11_or_9),
        .din1   (evict_l2t_l2b_rdma_wren_s3_15_or_13)
        );

//or_macro  or_evict_l2t_l2b_rdma_wrwl_s3_v1 (width=2)
//	(
//	.dout	(evict_l2t_l2b_rdma_wrwl_s3_v1[1:0]),
//	.din0	(l2t_l2b_rdma_wrwl_s3[1:0]),
//	.din1	(mbist_addr_reg[1:0])
//	);
//or_macro  or_evict_l2t_l2b_rdma_wrwl_s3_v2 (width=2)
//        (
//        .dout   (evict_l2t_l2b_rdma_wrwl_s3_v2[1:0]),
//        .din0   (l2t_l2b_rdma_wrwl_s3[1:0]),
//        .din1   (mbist_addr_reg[1:0])
//        );
//or_macro  or_evict_l2t_l2b_rdma_wrwl_s3_v3 (width=2)
//        (
//        .dout   (evict_l2t_l2b_rdma_wrwl_s3_v3[1:0]),
//        .din0   (l2t_l2b_rdma_wrwl_s3[1:0]),
//        .din1   (mbist_addr_reg[1:0])
//        );
////or_macro  or_evict_l2t_l2b_rdma_wrwl_s3_v4 (width=2)
//        (
//        .dout   (evict_l2t_l2b_rdma_wrwl_s3_v4[1:0]),
//        .din0   (l2t_l2b_rdma_wrwl_s3[1:0]),
//        .din1   (mbist_addr_reg[1:0])
//        );
/// CHANGE 

//mux_macro  mux_evict_l2t_l2b_rdma_wrwl_s3_v1 (width=2,mux=aonpe,ports=2,dmux=8x)
//      (
//      .dout   (evict_l2t_l2b_rdma_wrwl_s3_v1[1:0]),
//      .din0   (l2t_l2b_rdma_wrwl_s3[1:0]),
//      .din1   (mbist_addr_reg[1:0]),
//      .sel0   (mbist_run_reg_n),
//      .sel1   (mbist_run_reg)
//      );
//mux_macro  mux_evict_l2t_l2b_rdma_wrwl_s3_v2 (width=2,mux=aonpe,ports=2,dmux=8x)
//        (
//        .dout   (evict_l2t_l2b_rdma_wrwl_s3_v2[1:0]),
//        .din0   (l2t_l2b_rdma_wrwl_s3[1:0]),
//        .din1   (mbist_addr_reg[1:0]),
//	.sel0	(mbist_run_reg_n),
//	.sel1	(mbist_run_reg)
//        );
//mux_macro  mux_evict_l2t_l2b_rdma_wrwl_s3_v3 (width=2,mux=aonpe,ports=2,dmux=8x)
//        (
//        .dout   (evict_l2t_l2b_rdma_wrwl_s3_v3[1:0]),
//        .din0   (l2t_l2b_rdma_wrwl_s3[1:0]),
//        .din1   (mbist_addr_reg[1:0]),
//	.sel0	(mbist_run_reg_n),
//	.sel1	(mbist_run_reg)
//        );
//mux_macro  mux_evict_l2t_l2b_rdma_wrwl_s3_v4 (width=2,mux=aonpe,ports=2,dmux=8x)
//        (
//        .dout   (evict_l2t_l2b_rdma_wrwl_s3_v4[1:0]),
//        .din0   (l2t_l2b_rdma_wrwl_s3[1:0]),
//        .din1   (mbist_addr_reg[1:0]),
//	.sel0	(mbist_run_reg_n),
//	.sel1	(mbist_run_reg)
//        );

// mux_macro  mux_evict_l2t_l2b_rdma_wrwl_s3_v1 (width=2,mux=aonpe,ports=2,dmux=8x, stack=2c)
//       (
//       .dout   (compute_evict_l2t_l2b_rdma_wrwl_s3_v1[1:0]),
//       .din0   (l2t_l2b_rdma_wrwl_s3_v1[1:0]),
//       .din1   (mbist_addr_reg_v1[1:0]),
//       .sel0   (mbist_run_reg_v1_n),
//       .sel1   (mbist_run_reg_v1)
//       );
//
//
//mux_macro  mux_evict_l2t_l2b_rdma_wrwl_s3_v2 (width=2,mux=aonpe,ports=2,dmux=8x, stack=2c)
//      (
//      .dout   (compute_evict_l2t_l2b_rdma_wrwl_s3_v2[1:0]),
//      .din0   (l2t_l2b_rdma_wrwl_s3_v2[1:0]),
//      .din1   (mbist_addr_reg_v2[1:0]),
//      .sel0   (mbist_run_reg_v2_n),
//      .sel1   (mbist_run_reg_v2)
//      );
//
//
//mux_macro  mux_evict_l2t_l2b_rdma_wrwl_s3_v3 (width=2,mux=aonpe,ports=2,dmux=8x, stack=2c)
//      (
//      .dout   (compute_evict_l2t_l2b_rdma_wrwl_s3_v3[1:0]),
//      .din0   (l2t_l2b_rdma_wrwl_s3_v3[1:0]),
//      .din1   (mbist_addr_reg_v3[1:0]),
//      .sel0   (mbist_run_reg_v3_n),
//      .sel1   (mbist_run_reg_v3)
//      );
//
//
//mux_macro  mux_evict_l2t_l2b_rdma_wrwl_s3_v4 (width=2,mux=aonpe,ports=2,dmux=8x, stack=2c)
//      (
//      .dout   (compute_evict_l2t_l2b_rdma_wrwl_s3_v4[1:0]),
//      .din0   (l2t_l2b_rdma_wrwl_s3_v4[1:0]),
//      .din1   (mbist_addr_reg_v4[1:0]),
//      .sel0   (mbist_run_reg_v4_n),
//      .sel1   (mbist_run_reg_v4)
//      );
//
//
assign evict_l2t_l2b_rdma_wrwl_s3_v1[1:0] = compute_evict_l2t_l2b_rdma_wrwl_s3_v1[1:0];
assign evict_l2t_l2b_rdma_wrwl_s3_v2[1:0] = compute_evict_l2t_l2b_rdma_wrwl_s3_v2[1:0];
assign evict_l2t_l2b_rdma_wrwl_s3_v3[1:0] = compute_evict_l2t_l2b_rdma_wrwl_s3_v3[1:0];
assign evict_l2t_l2b_rdma_wrwl_s3_v4[1:0] = compute_evict_l2t_l2b_rdma_wrwl_s3_v4[1:0];



/// CHANGE 
////////////////////////////////////////////////////////////////////////////////


//or_macro  or_evict_wb_and_rdma_rd_en_r1v1 (width=2)
//	(
//	.dout	({evict_l2t_l2b_wbrd_en_r1_v1,evict_l2t_l2b_rdma_rden_r1_v1}),
//	.din0	({l2t_l2b_wbrd_en_r1,l2t_l2b_rdma_rden_r1}),
//	.din1	({mbist_wb_array_rd_en_reg,mbist_rdma_array_rd_en_reg})
//	);
//
//or_macro  or_evict_wb_and_rdma_rd_en_r1v2 (width=2)
//        (
//        .dout   ({evict_l2t_l2b_wbrd_en_r1_v2,evict_l2t_l2b_rdma_rden_r1_v2}),
//        .din0   ({l2t_l2b_wbrd_en_r1,l2t_l2b_rdma_rden_r1}),
//        .din1   ({mbist_wb_array_rd_en_reg,mbist_rdma_array_rd_en_reg})
//        );
//or_macro  or_evict_wb_and_rdma_rd_en_r1v3 (width=2)
//        (
//        .dout   ({evict_l2t_l2b_wbrd_en_r1_v3,evict_l2t_l2b_rdma_rden_r1_v3}),
//        .din0   ({l2t_l2b_wbrd_en_r1,l2t_l2b_rdma_rden_r1}),
//        .din1   ({mbist_wb_array_rd_en_reg,mbist_rdma_array_rd_en_reg})
//        );
//or_macro  or_evict_wb_and_rdma_rd_en_r1v4 (width=2)
//        (
//        .dout   ({evict_l2t_l2b_wbrd_en_r1_v4,evict_l2t_l2b_rdma_rden_r1_v4}),
//        .din0   ({l2t_l2b_wbrd_en_r1,l2t_l2b_rdma_rden_r1}),
//        .din1   ({mbist_wb_array_rd_en_reg,mbist_rdma_array_rd_en_reg})
//        );
//

// mux_macro  mux_evict_wb_and_rdma_rd_en_r1v1 (width=2,mux=aonpe,ports=2,dmux=8x,stack=2c)
  //       (
//         .dout   ({evict_l2t_l2b_wbrd_en_r1_v1,evict_l2t_l2b_rdma_rden_r1_v1}),
//         .din0   ({l2t_l2b_wbrd_en_r1_v1,l2t_l2b_rdma_rden_r1_v1}),
//         .din1   ({mbist_wb_array_rd_en_reg_v1,mbist_rdma_array_rd_en_reg_v1}),
// 	.sel0	(mbist_run_reg_v1_n),
// 	.sel1	(mbist_run_reg_v1)
  //       );
//
//mux_macro  mux_evict_wb_and_rdma_rd_en_r1v2 (width=2,mux=aonpe,ports=2,dmux=8x,stack=2c)
//        (
//        .dout   ({evict_l2t_l2b_wbrd_en_r1_v2,evict_l2t_l2b_rdma_rden_r1_v2}),
//        .din0   ({l2t_l2b_wbrd_en_r1_v2,l2t_l2b_rdma_rden_r1_v2}),
//        .din1   ({mbist_wb_array_rd_en_reg_v2,mbist_rdma_array_rd_en_reg_v2}),
//	.sel0	(mbist_run_reg_v2_n),
//	.sel1	(mbist_run_reg_v2)
//        );
//mux_macro  mux_evict_wb_and_rdma_rd_en_r1v3 (width=2,mux=aonpe,ports=2,dmux=8x,stack=2c)
//        (
//        .dout   ({evict_l2t_l2b_wbrd_en_r1_v3,evict_l2t_l2b_rdma_rden_r1_v3}),
//        .din0   ({l2t_l2b_wbrd_en_r1_v3,l2t_l2b_rdma_rden_r1_v3}),
//        .din1   ({mbist_wb_array_rd_en_reg_v3,mbist_rdma_array_rd_en_reg_v3}),
//	.sel0	(mbist_run_reg_v3_n),
//	.sel1	(mbist_run_reg_v3)
//        );
//mux_macro  mux_evict_wb_and_rdma_rd_en_r1v4 (width=2,mux=aonpe,ports=2,dmux=8x,stack=2c)
//        (
//        .dout   ({evict_l2t_l2b_wbrd_en_r1_v4,evict_l2t_l2b_rdma_rden_r1_v4}),
//        .din0   ({l2t_l2b_wbrd_en_r1_v4,l2t_l2b_rdma_rden_r1_v4}),
//        .din1   ({mbist_wb_array_rd_en_reg_v4,mbist_rdma_array_rd_en_reg_v4}),
//	.sel0	(mbist_run_reg_v4_n),
//	.sel1	(mbist_run_reg_v4)
//        );
//
//
l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2c__width_1 mux_wbrd_en_r1_in  // int 5.0 changes
	(
	.dout	(l2t_l2b_wbrd_en_r1_in),
	.din0	(l2t_l2b_wbrd_en_r1),
//	.din1	(l2t_l2b_wbrd_en_r2),
	.din1	(mbist_sel_wb_arrays_reg),
	.sel0	(mbist_run_reg_n),
	.sel1	(mbist_run_reg)
	);


l2b_evict_dp_and_macro__width_1 error_qual_and_l2t_l2b_evict_en_r3_slice  
	( 
	.dout 	(error_qual_and_l2t_l2b_evict_en_r3), 
	.din0	(error_qual), 
	.din1	(l2t_l2b_evict_en_r3) 
	); 

l2b_evict_dp_or_macro__width_1 error_qual_in_sloce  
	( 
	.dout 	(error_qual_in), 
	.din0	(l2t_l2b_rdma_rden_r3), 
	.din1	(error_qual_and_l2t_l2b_evict_en_r3) 
	); 

l2b_evict_dp_and_macro__width_1 ff_array_rd_ptr_and_slice 
        (
        .dout   (ff_array_rd_ptr_din),
        .din0   (dbb_rst_l),
        .din1   (error_qual_in)
        );


///////////////////////////////////////////////////////////////////////////////
// assign  wb_or_rdma_rden_r2 = l2t_l2b_wbrd_en_r2 | l2t_l2b_rdma_rden_r2 ;

l2b_evict_dp_or_macro__width_1 wb_or_rdma_rden_r2_slice1  // int 5.0 changes
	( 
	.dout 	(wb_or_rdma_rden_r2_1), 
	.din0	(l2t_l2b_rdma_rden_r2), 
	.din1	(l2t_l2b_wbrd_en_r2)
	); 

//
//and_macro wb_or_rdma_rden_r2_slice (width=1) // int 5.0 changes
//	(
//	.din0	(wb_or_rdma_rden_r2_1),
//	.din1	(sehold_n),
//	.dout   (wb_or_rdma_rden_r2)
//	);
//

l2b_evict_dp_nand_macro__dnand_32x__ports_2__width_3 nand_mux_wb_or_rdma_rden_r2_slice 
	(
	.dout	({wb_or_rdma_rden_r2_sega,wb_or_rdma_rden_r2_segb,wb_or_rdma_rden_r2}),
	.din0	({wb_or_rdma_rden_r2_1,1'b1,wb_or_rdma_rden_r2_sega}),
	.din1	({mbist_run_reg_n,mbist_run_reg,wb_or_rdma_rden_r2_segb})
	);


//mux_macro mux_wb_or_rdma_rden_r2_slice (width=1,ports=2,mux=pgnpe,stack=2c,dmux=32x)
//	(
//	.dout	(wb_or_rdma_rden_r2),
//	.din0	(wb_or_rdma_rden_r2_1),
//	.din1	(1'b1),
//	.sel0	(mbist_run_reg_n),
//	.sel1	(mbist_run_reg)
//	);

l2b_evict_dp_inv_macro__width_1 l2t_l2b_wbrd_en_r2_inv_slice 
        ( 
        .dout   (l2t_l2b_wbrd_en_r2_n ),
        .din    (l2t_l2b_wbrd_en_r2 ) 
        );


l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39      mux_wb_rdma_mux_out1a 
        (
        .dout (wb_rdma_mux_out[38:0]),
        .din0  (wb_array_dout[38:0]),
        .din1  (rdma_array_dout[38:0]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );
        
l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out1b 
        (
        .dout (wb_rdma_mux_out[77:39]),
        .din0  (wb_array_dout[77:39]),
        .din1  (rdma_array_dout[77:39]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );
        
l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out1c 
        (
        .dout (wb_rdma_mux_out[116:78]),
        .din0  (wb_array_dout[116:78]),
        .din1  (rdma_array_dout[116:78]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out1d 
        (
        .dout (wb_rdma_mux_out[155:117]),
        .din0  (wb_array_dout[155:117]),
        .din1  (rdma_array_dout[155:117]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out2a 
        (
        .dout (wb_rdma_mux_out[194:156]),
        .din0  (wb_array_dout[194:156]),
        .din1  (rdma_array_dout[194:156]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );
l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out2b 
        (
        .dout (wb_rdma_mux_out[233:195]),
        .din0  (wb_array_dout[233:195]),
        .din1  (rdma_array_dout[233:195]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out2c 
        (
        .dout (wb_rdma_mux_out[272:234]),
        .din0  (wb_array_dout[272:234]),
        .din1  (rdma_array_dout[272:234]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out2d 
        (
        .dout (wb_rdma_mux_out[311:273]),
        .din0  (wb_array_dout[311:273]),
        .din1  (rdma_array_dout[311:273]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out3a 
        (
        .dout (wb_rdma_mux_out[350:312]),
        .din0  (wb_array_dout[350:312]),
        .din1  (rdma_array_dout[350:312]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );
l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out3b 
        (
        .dout (wb_rdma_mux_out[389:351]),
        .din0  (wb_array_dout[389:351]),
        .din1  (rdma_array_dout[389:351]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out3c   
        (
        .dout (wb_rdma_mux_out[428:390]),
        .din0  (wb_array_dout[428:390]),
        .din1  (rdma_array_dout[428:390]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );


l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out3d   
        (
        .dout (wb_rdma_mux_out[467:429]),
        .din0  (wb_array_dout[467:429]),
        .din1  (rdma_array_dout[467:429]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out4a   
        (
        .dout (wb_rdma_mux_out[506:468]),
        .din0  (wb_array_dout[506:468]),
        .din1  (rdma_array_dout[506:468]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out4b   
        (
        .dout (wb_rdma_mux_out[545:507]),
        .din0  (wb_array_dout[545:507]),
        .din1  (rdma_array_dout[545:507]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out4c   
        (
        .dout (wb_rdma_mux_out[584:546]),
        .din0  (wb_array_dout[584:546]),
        .din1  (rdma_array_dout[584:546]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39       mux_wb_rdma_mux_out4d   
        (
        .dout (wb_rdma_mux_out[623:585]),
        .din0  (wb_array_dout[623:585]),
        .din1  (rdma_array_dout[623:585]),
        .sel0 (l2t_l2b_wbrd_en_r2),
        .sel1 (l2t_l2b_wbrd_en_r2_n)
        );


///////////////////////////////////////////////
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_1a        
              (.dout   (wb_array_dout_r3[38:0]),
               .scan_in(ff_wb_array_dout_r3_1a_scanin),
               .scan_out(ff_wb_array_dout_r3_1a_scanout),
               .din (wb_rdma_mux_out[38:0]),
               .clk (l2clk),
               .en  (wb_or_rdma_rden_r2),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;

l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_1b        
              (.dout   (wb_array_dout_r3[77:39]),
               .scan_in(ff_wb_array_dout_r3_1b_scanin),
               .scan_out(ff_wb_array_dout_r3_1b_scanout),
               .din (wb_rdma_mux_out[77:39]),
               .clk (l2clk),
               .en  (wb_or_rdma_rden_r2),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_1c        
              (.dout   (wb_array_dout_r3[116:78]),
               .scan_in(ff_wb_array_dout_r3_1c_scanin),
               .scan_out(ff_wb_array_dout_r3_1c_scanout),
               .din (wb_rdma_mux_out[116:78]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_1d        
              (.dout   (wb_array_dout_r3[155:117]),
               .scan_in(ff_wb_array_dout_r3_1d_scanin),
               .scan_out(ff_wb_array_dout_r3_1d_scanout),
               .din (wb_rdma_mux_out[155:117]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

///////////////////////////////////////////////
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_2a        
              (.dout   (wb_array_dout_r3[194:156]),
               .scan_in(ff_wb_array_dout_r3_2a_scanin),
               .scan_out(ff_wb_array_dout_r3_2a_scanout),
               .din (wb_rdma_mux_out[194:156]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_2b        
              (.dout   (wb_array_dout_r3[233:195]),
               .scan_in(ff_wb_array_dout_r3_2b_scanin),
               .scan_out(ff_wb_array_dout_r3_2b_scanout),
               .din (wb_rdma_mux_out[233:195]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_2c        
              (.dout   (wb_array_dout_r3[272:234]),
               .scan_in(ff_wb_array_dout_r3_2c_scanin),
               .scan_out(ff_wb_array_dout_r3_2c_scanout),
               .din (wb_rdma_mux_out[272:234]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_2d        
              (.dout   (wb_array_dout_r3[311:273]),
               .scan_in(ff_wb_array_dout_r3_2d_scanin),
               .scan_out(ff_wb_array_dout_r3_2d_scanout),
               .din (wb_rdma_mux_out[311:273]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


///////////////////////////////////////////////
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_3a        
              (.dout   (wb_array_dout_r3[350:312]),
               .scan_in(ff_wb_array_dout_r3_3a_scanin),
               .scan_out(ff_wb_array_dout_r3_3a_scanout),
               .din (wb_rdma_mux_out[350:312]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_3b        
              (.dout   (wb_array_dout_r3[389:351]),
               .scan_in(ff_wb_array_dout_r3_3b_scanin),
               .scan_out(ff_wb_array_dout_r3_3b_scanout),
               .din (wb_rdma_mux_out[389:351]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_3c        
              (.dout   (wb_array_dout_r3[428:390]),
               .scan_in(ff_wb_array_dout_r3_3c_scanin),
               .scan_out(ff_wb_array_dout_r3_3c_scanout),
               .din (wb_rdma_mux_out[428:390]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_3d        
              (.dout   (wb_array_dout_r3[467:429]),
               .scan_in(ff_wb_array_dout_r3_3d_scanin),
               .scan_out(ff_wb_array_dout_r3_3d_scanout),
               .din (wb_rdma_mux_out[467:429]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

///////////////////////////////////////////////
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_4a        
              (.dout   (wb_array_dout_r3[506:468]),
               .scan_in(ff_wb_array_dout_r3_4a_scanin),
               .scan_out(ff_wb_array_dout_r3_4a_scanout),
               .din (wb_rdma_mux_out[506:468]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_4b        
              (.dout   (wb_array_dout_r3[545:507]),
               .scan_in(ff_wb_array_dout_r3_4b_scanin),
               .scan_out(ff_wb_array_dout_r3_4b_scanout),
               .din (wb_rdma_mux_out[545:507]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_4c        
              (.dout   (wb_array_dout_r3[584:546]),
               .scan_in(ff_wb_array_dout_r3_4c_scanin),
               .scan_out(ff_wb_array_dout_r3_4c_scanout),
               .din (wb_rdma_mux_out[584:546]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;
l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r3_4d        
              (.dout   (wb_array_dout_r3[623:585]),
               .scan_in(ff_wb_array_dout_r3_4d_scanin),
               .scan_out(ff_wb_array_dout_r3_4d_scanout),
               .din (wb_rdma_mux_out[623:585]),
               .en (wb_or_rdma_rden_r2),
               .clk  (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


////////////////////////////////////////////////////////////////////////////////
//assign  sel_in0 =  (l2t_l2b_ev_dword_r3[1:0] == 2'b00) ;
//assign  sel_in1 =  (l2t_l2b_ev_dword_r3[1:0] == 2'b01) ;
//assign  sel_in2 =  (l2t_l2b_ev_dword_r3[1:0] == 2'b10) ;
//assign  sel_in3 = ~(sel_in0 | sel_in1 | sel_in2) ;
////////////////////////////////////////////////////////////////////////////////
//
//
//	MUX select generation
//
//
////////////////////////////////////////////////////////////////////////////////
l2b_evict_dp_cmp_macro__width_4 sel_in0_slice  
	( 
	.din0	({2'b0,l2t_l2b_ev_dword_r1[1:0]}), 
	.din1	({2'b0,2'b0}), 
	.dout	(sel_in0_r1) 
	);
l2b_evict_dp_cmp_macro__width_4 sel_in1_slice  
	( 
	.din0	({2'b0,l2t_l2b_ev_dword_r1[1:0]}), 
	.din1	({2'b0,2'b01}), 
	.dout	(sel_in1_r1) 
	);
l2b_evict_dp_cmp_macro__width_4 sel_in2_slice  
	( 
	.din0	({2'b0,l2t_l2b_ev_dword_r1[1:0]}), 
	.din1	({2'b0,2'b10}), 
	.dout	(sel_in2_r1) 
	);

l2b_evict_dp_nor_macro__ports_3__width_1 or_sel3_slice		
	(
	.dout	(sel_in3_r1),
	.din0	(sel_in0_r1),
	.din1	(sel_in1_r1),
	.din2	(sel_in2_r1)
	);

assign sel_evct_mux_r1[3:0] = {sel_in3_r1, sel_in2_r1, sel_in1_r1, sel_in0_r1};


/////////////////////////////////////////////////////////////////////////

l2b_evict_dp_mux_macro__mux_pgpe__ports_4__stack_40r__width_39 mux_wb_array_dout_1a	
              (.dout (wb_array_dout_r3_4t1[38:0]),
               .din0  (wb_array_dout_r3[38:0]),  
               .din1  (wb_array_dout_r3[116:78]),  
               .din2  (wb_array_dout_r3[194:156]),  
               .din3  (wb_array_dout_r3[272:234]),  
	        .sel0 (sel_evct_mux_r3_1a[3]),
	        .sel1 (sel_evct_mux_r3_1a[2]),
	        .sel2 (sel_evct_mux_r3_1a[1]),
  .muxtst(muxtst),
  .test(test)
//	        .sel3 (sel_evct_mux_r3_1a[0])
              ) ;


l2b_evict_dp_mux_macro__mux_pgpe__ports_4__stack_40r__width_39 mux_wb_array_dout_1b   
              (.dout (wb_array_dout_r3_4t1[77:39]),
               .din0  (wb_array_dout_r3[77:39]),
               .din1  (wb_array_dout_r3[155:117]),
               .din2  (wb_array_dout_r3[233:195]),
               .din3  (wb_array_dout_r3[311:273]),
                .sel0 (sel_evct_mux_r3_1b[3]),
                .sel1 (sel_evct_mux_r3_1b[2]),
                .sel2 (sel_evct_mux_r3_1b[1]),
  .muxtst(muxtst),
  .test(test)
//                .sel3 (sel_evct_mux_r3_1b[0])
              ) ;


l2b_evict_dp_mux_macro__mux_pgpe__ports_4__stack_40r__width_39 mux_wb_array_dout_2a	
              (.dout (wb_array_dout_r3_4t1[116:78]),
               .din0  (wb_array_dout_r3[350:312]),  
               .din1  (wb_array_dout_r3[428:390]),  
               .din2  (wb_array_dout_r3[506:468]),  
               .din3  (wb_array_dout_r3[584:546]),  
	       .sel0 (sel_evct_mux_r3_2a[3]),
	       .sel1 (sel_evct_mux_r3_2a[2]),
	       .sel2 (sel_evct_mux_r3_2a[1]),
  .muxtst(muxtst),
  .test(test)
//	       .sel3 (sel_evct_mux_r3_2a[0])
              ) ;

l2b_evict_dp_mux_macro__mux_pgpe__ports_4__stack_40r__width_39 mux_wb_array_dout_2b 
              (.dout (wb_array_dout_r3_4t1[155:117]),
               .din0  (wb_array_dout_r3[389:351]),
               .din1  (wb_array_dout_r3[467:429]),
               .din2  (wb_array_dout_r3[545:507]),
               .din3  (wb_array_dout_r3[623:585]),
               .sel0 (sel_evct_mux_r3_2b[3]),
               .sel1 (sel_evct_mux_r3_2b[2]),
               .sel2 (sel_evct_mux_r3_2b[1]),
  .muxtst(muxtst),
  .test(test)
//               .sel3 (sel_evct_mux_r3_2b[0])
              ) ;

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2c mux_l2t_l2b_ev_dword_r3_bit2 
	(
	.dout	(l2t_l2b_ev_dword_r3_2),
	.din0	(mbist_pick_top_bot),
	.din1	(l2t_l2b_ev_dword_r3[2]),
        .sel0   (mbist_run_reg),
        .sel1   (mbist_run_reg_n)
	);

l2b_evict_dp_inv_macro__width_1 l2t_l2b_ev_dword_r3_2_inv_slice 
        ( 
        .dout   (l2t_l2b_ev_dword_r3_2_n ),
        .din    (l2t_l2b_ev_dword_r3_2 ) 
        );



l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39  mux_wb_array_dout_8t1a  
              (.dout (wb_array_dout_r3_8t1[38:0]),
               .din0  (wb_array_dout_r3_4t1[38:0]), 
               .din1  (wb_array_dout_r3_4t1[116:78]), 
	       .sel0 (l2t_l2b_ev_dword_r3_2),
	       .sel1 (l2t_l2b_ev_dword_r3_2_n)              
	      ) ;


l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39  mux_wb_array_dout_8t1b  
              (.dout (wb_array_dout_r3_8t1[77:39]),
               .din0  (wb_array_dout_r3_4t1[77:39]),
               .din1  (wb_array_dout_r3_4t1[155:117]),
//	       .sel0 (l2t_l2b_ev_dword_r3[2]),
               .sel0 (l2t_l2b_ev_dword_r3_2),
               .sel1 (l2t_l2b_ev_dword_r3_2_n)
            ) ;



l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r4a	
              (.dout   (wb_array_dout_r4[38:0]),
               .scan_in(ff_wb_array_dout_r4a_scanin),
               .scan_out(ff_wb_array_dout_r4a_scanout),
               .din (wb_array_dout_r3_8t1[38:0]),
               .clk (l2clk),
               .en  (l2t_l2b_evict_en_r3),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;


l2b_evict_dp_msff_macro__stack_40r__width_39   ff_wb_array_dout_r4b        
              (.dout   (wb_array_dout_r4[77:39]),
               .scan_in(ff_wb_array_dout_r4b_scanin),
               .scan_out(ff_wb_array_dout_r4b_scanout),
               .din (wb_array_dout_r3_8t1[77:39]),
               .clk (l2clk),
               .en  (l2t_l2b_evict_en_r3),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;


///////////////////////////////  MBIST /////////////////////////////////////


assign            {unused[3:0],mbist_cmp_data[0], mbist_cmp_data[78], mbist_cmp_data[156], mbist_cmp_data[234],
             mbist_cmp_data[1], mbist_cmp_data[79], mbist_cmp_data[157], mbist_cmp_data[235],
             mbist_cmp_data[2], mbist_cmp_data[80], mbist_cmp_data[158], mbist_cmp_data[236],
             mbist_cmp_data[3], mbist_cmp_data[81], mbist_cmp_data[159], mbist_cmp_data[237],
             mbist_cmp_data[4], mbist_cmp_data[82], mbist_cmp_data[160], mbist_cmp_data[238],
             mbist_cmp_data[5], mbist_cmp_data[83], mbist_cmp_data[161], mbist_cmp_data[239],
             mbist_cmp_data[6], mbist_cmp_data[84], mbist_cmp_data[162], mbist_cmp_data[240],
             mbist_cmp_data[7], mbist_cmp_data[85], mbist_cmp_data[163], mbist_cmp_data[241],
             mbist_cmp_data[8], mbist_cmp_data[86], mbist_cmp_data[164], mbist_cmp_data[242],
             mbist_cmp_data[9], mbist_cmp_data[87], mbist_cmp_data[165], mbist_cmp_data[243],
             mbist_cmp_data[10], mbist_cmp_data[88], mbist_cmp_data[166], mbist_cmp_data[244],
             mbist_cmp_data[11], mbist_cmp_data[89], mbist_cmp_data[167], mbist_cmp_data[245],
             mbist_cmp_data[12], mbist_cmp_data[90], mbist_cmp_data[168], mbist_cmp_data[246],
             mbist_cmp_data[13], mbist_cmp_data[91], mbist_cmp_data[169], mbist_cmp_data[247],
             mbist_cmp_data[14], mbist_cmp_data[92], mbist_cmp_data[170], mbist_cmp_data[248],
             mbist_cmp_data[15], mbist_cmp_data[93], mbist_cmp_data[171], mbist_cmp_data[249],
             mbist_cmp_data[16], mbist_cmp_data[94], mbist_cmp_data[172], mbist_cmp_data[250],
             mbist_cmp_data[17], mbist_cmp_data[95], mbist_cmp_data[173], mbist_cmp_data[251],
             mbist_cmp_data[18], mbist_cmp_data[96], mbist_cmp_data[174], mbist_cmp_data[252],
             mbist_cmp_data[19], mbist_cmp_data[97], mbist_cmp_data[175], mbist_cmp_data[253],
             mbist_cmp_data[20], mbist_cmp_data[98], mbist_cmp_data[176], mbist_cmp_data[254],
             mbist_cmp_data[21], mbist_cmp_data[99], mbist_cmp_data[177], mbist_cmp_data[255],
             mbist_cmp_data[22], mbist_cmp_data[100], mbist_cmp_data[178], mbist_cmp_data[256],
             mbist_cmp_data[23], mbist_cmp_data[101], mbist_cmp_data[179], mbist_cmp_data[257],
             mbist_cmp_data[24], mbist_cmp_data[102], mbist_cmp_data[180], mbist_cmp_data[258],
             mbist_cmp_data[25], mbist_cmp_data[103], mbist_cmp_data[181], mbist_cmp_data[259],
             mbist_cmp_data[26], mbist_cmp_data[104], mbist_cmp_data[182], mbist_cmp_data[260],
             mbist_cmp_data[27], mbist_cmp_data[105], mbist_cmp_data[183], mbist_cmp_data[261],
             mbist_cmp_data[28], mbist_cmp_data[106], mbist_cmp_data[184], mbist_cmp_data[262],
             mbist_cmp_data[29], mbist_cmp_data[107], mbist_cmp_data[185], mbist_cmp_data[263],
             mbist_cmp_data[30], mbist_cmp_data[108], mbist_cmp_data[186], mbist_cmp_data[264],
             mbist_cmp_data[31], mbist_cmp_data[109], mbist_cmp_data[187], mbist_cmp_data[265],
             mbist_cmp_data[32], mbist_cmp_data[110], mbist_cmp_data[188], mbist_cmp_data[266],
             mbist_cmp_data[33], mbist_cmp_data[111], mbist_cmp_data[189], mbist_cmp_data[267],
             mbist_cmp_data[34], mbist_cmp_data[112], mbist_cmp_data[190], mbist_cmp_data[268],
             mbist_cmp_data[35], mbist_cmp_data[113], mbist_cmp_data[191], mbist_cmp_data[269],
             mbist_cmp_data[36], mbist_cmp_data[114], mbist_cmp_data[192], mbist_cmp_data[270],
             mbist_cmp_data[37], mbist_cmp_data[115], mbist_cmp_data[193], mbist_cmp_data[271],
             mbist_cmp_data[38], mbist_cmp_data[116], mbist_cmp_data[194], mbist_cmp_data[272]} 
		=  {20{wb_mbist_data_in_r2[7:0]}};

assign             {unused[7:4],mbist_cmp_data[39], mbist_cmp_data[117], mbist_cmp_data[195], mbist_cmp_data[273],
             mbist_cmp_data[40], mbist_cmp_data[118], mbist_cmp_data[196], mbist_cmp_data[274],
             mbist_cmp_data[41], mbist_cmp_data[119], mbist_cmp_data[197], mbist_cmp_data[275],
             mbist_cmp_data[42], mbist_cmp_data[120], mbist_cmp_data[198], mbist_cmp_data[276],
             mbist_cmp_data[43], mbist_cmp_data[121], mbist_cmp_data[199], mbist_cmp_data[277],
             mbist_cmp_data[44], mbist_cmp_data[122], mbist_cmp_data[200], mbist_cmp_data[278],
             mbist_cmp_data[45], mbist_cmp_data[123], mbist_cmp_data[201], mbist_cmp_data[279],
             mbist_cmp_data[46], mbist_cmp_data[124], mbist_cmp_data[202], mbist_cmp_data[280],
             mbist_cmp_data[47], mbist_cmp_data[125], mbist_cmp_data[203], mbist_cmp_data[281],
             mbist_cmp_data[48], mbist_cmp_data[126], mbist_cmp_data[204], mbist_cmp_data[282],
             mbist_cmp_data[49], mbist_cmp_data[127], mbist_cmp_data[205], mbist_cmp_data[283],
             mbist_cmp_data[50], mbist_cmp_data[128], mbist_cmp_data[206], mbist_cmp_data[284],
             mbist_cmp_data[51], mbist_cmp_data[129], mbist_cmp_data[207], mbist_cmp_data[285],
             mbist_cmp_data[52], mbist_cmp_data[130], mbist_cmp_data[208], mbist_cmp_data[286],
             mbist_cmp_data[53], mbist_cmp_data[131], mbist_cmp_data[209], mbist_cmp_data[287],
             mbist_cmp_data[54], mbist_cmp_data[132], mbist_cmp_data[210], mbist_cmp_data[288],
             mbist_cmp_data[55], mbist_cmp_data[133], mbist_cmp_data[211], mbist_cmp_data[289],
             mbist_cmp_data[56], mbist_cmp_data[134], mbist_cmp_data[212], mbist_cmp_data[290],
             mbist_cmp_data[57], mbist_cmp_data[135], mbist_cmp_data[213], mbist_cmp_data[291],
             mbist_cmp_data[58], mbist_cmp_data[136], mbist_cmp_data[214], mbist_cmp_data[292],
             mbist_cmp_data[59], mbist_cmp_data[137], mbist_cmp_data[215], mbist_cmp_data[293],
             mbist_cmp_data[60], mbist_cmp_data[138], mbist_cmp_data[216], mbist_cmp_data[294],
             mbist_cmp_data[61], mbist_cmp_data[139], mbist_cmp_data[217], mbist_cmp_data[295],
             mbist_cmp_data[62], mbist_cmp_data[140], mbist_cmp_data[218], mbist_cmp_data[296],
             mbist_cmp_data[63], mbist_cmp_data[141], mbist_cmp_data[219], mbist_cmp_data[297],
             mbist_cmp_data[64], mbist_cmp_data[142], mbist_cmp_data[220], mbist_cmp_data[298],
             mbist_cmp_data[65], mbist_cmp_data[143], mbist_cmp_data[221], mbist_cmp_data[299],
             mbist_cmp_data[66], mbist_cmp_data[144], mbist_cmp_data[222], mbist_cmp_data[300],
             mbist_cmp_data[67], mbist_cmp_data[145], mbist_cmp_data[223], mbist_cmp_data[301],
             mbist_cmp_data[68], mbist_cmp_data[146], mbist_cmp_data[224], mbist_cmp_data[302],
             mbist_cmp_data[69], mbist_cmp_data[147], mbist_cmp_data[225], mbist_cmp_data[303],
             mbist_cmp_data[70], mbist_cmp_data[148], mbist_cmp_data[226], mbist_cmp_data[304],
             mbist_cmp_data[71], mbist_cmp_data[149], mbist_cmp_data[227], mbist_cmp_data[305],
             mbist_cmp_data[72], mbist_cmp_data[150], mbist_cmp_data[228], mbist_cmp_data[306],
             mbist_cmp_data[73], mbist_cmp_data[151], mbist_cmp_data[229], mbist_cmp_data[307],
             mbist_cmp_data[74], mbist_cmp_data[152], mbist_cmp_data[230], mbist_cmp_data[308],
             mbist_cmp_data[75], mbist_cmp_data[153], mbist_cmp_data[231], mbist_cmp_data[309],
             mbist_cmp_data[76], mbist_cmp_data[154], mbist_cmp_data[232], mbist_cmp_data[310],
             mbist_cmp_data[77], mbist_cmp_data[155], mbist_cmp_data[233], mbist_cmp_data[311]}
		=  {20{wb_mbist_data_in_r2[7:0]}};

assign             {unused[11:8],mbist_cmp_data[312], mbist_cmp_data[390], mbist_cmp_data[468], mbist_cmp_data[546],
             mbist_cmp_data[313], mbist_cmp_data[391], mbist_cmp_data[469], mbist_cmp_data[547],
             mbist_cmp_data[314], mbist_cmp_data[392], mbist_cmp_data[470], mbist_cmp_data[548],
             mbist_cmp_data[315], mbist_cmp_data[393], mbist_cmp_data[471], mbist_cmp_data[549],
             mbist_cmp_data[316], mbist_cmp_data[394], mbist_cmp_data[472], mbist_cmp_data[550],
             mbist_cmp_data[317], mbist_cmp_data[395], mbist_cmp_data[473], mbist_cmp_data[551],
             mbist_cmp_data[318], mbist_cmp_data[396], mbist_cmp_data[474], mbist_cmp_data[552],
             mbist_cmp_data[319], mbist_cmp_data[397], mbist_cmp_data[475], mbist_cmp_data[553],
             mbist_cmp_data[320], mbist_cmp_data[398], mbist_cmp_data[476], mbist_cmp_data[554],
             mbist_cmp_data[321], mbist_cmp_data[399], mbist_cmp_data[477], mbist_cmp_data[555],
             mbist_cmp_data[322], mbist_cmp_data[400], mbist_cmp_data[478], mbist_cmp_data[556],
             mbist_cmp_data[323], mbist_cmp_data[401], mbist_cmp_data[479], mbist_cmp_data[557],
             mbist_cmp_data[324], mbist_cmp_data[402], mbist_cmp_data[480], mbist_cmp_data[558],
             mbist_cmp_data[325], mbist_cmp_data[403], mbist_cmp_data[481], mbist_cmp_data[559],
             mbist_cmp_data[326], mbist_cmp_data[404], mbist_cmp_data[482], mbist_cmp_data[560],
             mbist_cmp_data[327], mbist_cmp_data[405], mbist_cmp_data[483], mbist_cmp_data[561],
             mbist_cmp_data[328], mbist_cmp_data[406], mbist_cmp_data[484], mbist_cmp_data[562],
             mbist_cmp_data[329], mbist_cmp_data[407], mbist_cmp_data[485], mbist_cmp_data[563],
             mbist_cmp_data[330], mbist_cmp_data[408], mbist_cmp_data[486], mbist_cmp_data[564],
             mbist_cmp_data[331], mbist_cmp_data[409], mbist_cmp_data[487], mbist_cmp_data[565],
             mbist_cmp_data[332], mbist_cmp_data[410], mbist_cmp_data[488], mbist_cmp_data[566],
             mbist_cmp_data[333], mbist_cmp_data[411], mbist_cmp_data[489], mbist_cmp_data[567],
             mbist_cmp_data[334], mbist_cmp_data[412], mbist_cmp_data[490], mbist_cmp_data[568],
             mbist_cmp_data[335], mbist_cmp_data[413], mbist_cmp_data[491], mbist_cmp_data[569],
             mbist_cmp_data[336], mbist_cmp_data[414], mbist_cmp_data[492], mbist_cmp_data[570],
             mbist_cmp_data[337], mbist_cmp_data[415], mbist_cmp_data[493], mbist_cmp_data[571],
             mbist_cmp_data[338], mbist_cmp_data[416], mbist_cmp_data[494], mbist_cmp_data[572],
             mbist_cmp_data[339], mbist_cmp_data[417], mbist_cmp_data[495], mbist_cmp_data[573],
             mbist_cmp_data[340], mbist_cmp_data[418], mbist_cmp_data[496], mbist_cmp_data[574],
             mbist_cmp_data[341], mbist_cmp_data[419], mbist_cmp_data[497], mbist_cmp_data[575],
             mbist_cmp_data[342], mbist_cmp_data[420], mbist_cmp_data[498], mbist_cmp_data[576],
             mbist_cmp_data[343], mbist_cmp_data[421], mbist_cmp_data[499], mbist_cmp_data[577],
             mbist_cmp_data[344], mbist_cmp_data[422], mbist_cmp_data[500], mbist_cmp_data[578],
             mbist_cmp_data[345], mbist_cmp_data[423], mbist_cmp_data[501], mbist_cmp_data[579],
             mbist_cmp_data[346], mbist_cmp_data[424], mbist_cmp_data[502], mbist_cmp_data[580],
             mbist_cmp_data[347], mbist_cmp_data[425], mbist_cmp_data[503], mbist_cmp_data[581],
             mbist_cmp_data[348], mbist_cmp_data[426], mbist_cmp_data[504], mbist_cmp_data[582],
             mbist_cmp_data[349], mbist_cmp_data[427], mbist_cmp_data[505], mbist_cmp_data[583],
             mbist_cmp_data[350], mbist_cmp_data[428], mbist_cmp_data[506], mbist_cmp_data[584]} 
		= {20{wb_mbist_data_in_r2[7:0]}};



assign      {unused[15:12],mbist_cmp_data[351], mbist_cmp_data[429], mbist_cmp_data[507], mbist_cmp_data[585],
             mbist_cmp_data[352], mbist_cmp_data[430], mbist_cmp_data[508], mbist_cmp_data[586],
             mbist_cmp_data[353], mbist_cmp_data[431], mbist_cmp_data[509], mbist_cmp_data[587],
             mbist_cmp_data[354], mbist_cmp_data[432], mbist_cmp_data[510], mbist_cmp_data[588],
             mbist_cmp_data[355], mbist_cmp_data[433], mbist_cmp_data[511], mbist_cmp_data[589],
             mbist_cmp_data[356], mbist_cmp_data[434], mbist_cmp_data[512], mbist_cmp_data[590],
             mbist_cmp_data[357], mbist_cmp_data[435], mbist_cmp_data[513], mbist_cmp_data[591],
             mbist_cmp_data[358], mbist_cmp_data[436], mbist_cmp_data[514], mbist_cmp_data[592],
             mbist_cmp_data[359], mbist_cmp_data[437], mbist_cmp_data[515], mbist_cmp_data[593],
             mbist_cmp_data[360], mbist_cmp_data[438], mbist_cmp_data[516], mbist_cmp_data[594],
             mbist_cmp_data[361], mbist_cmp_data[439], mbist_cmp_data[517], mbist_cmp_data[595],
             mbist_cmp_data[362], mbist_cmp_data[440], mbist_cmp_data[518], mbist_cmp_data[596],
             mbist_cmp_data[363], mbist_cmp_data[441], mbist_cmp_data[519], mbist_cmp_data[597],
             mbist_cmp_data[364], mbist_cmp_data[442], mbist_cmp_data[520], mbist_cmp_data[598],
             mbist_cmp_data[365], mbist_cmp_data[443], mbist_cmp_data[521], mbist_cmp_data[599],
             mbist_cmp_data[366], mbist_cmp_data[444], mbist_cmp_data[522], mbist_cmp_data[600],
             mbist_cmp_data[367], mbist_cmp_data[445], mbist_cmp_data[523], mbist_cmp_data[601],
             mbist_cmp_data[368], mbist_cmp_data[446], mbist_cmp_data[524], mbist_cmp_data[602],
             mbist_cmp_data[369], mbist_cmp_data[447], mbist_cmp_data[525], mbist_cmp_data[603],
             mbist_cmp_data[370], mbist_cmp_data[448], mbist_cmp_data[526], mbist_cmp_data[604],
             mbist_cmp_data[371], mbist_cmp_data[449], mbist_cmp_data[527], mbist_cmp_data[605],
             mbist_cmp_data[372], mbist_cmp_data[450], mbist_cmp_data[528], mbist_cmp_data[606],
             mbist_cmp_data[373], mbist_cmp_data[451], mbist_cmp_data[529], mbist_cmp_data[607],
             mbist_cmp_data[374], mbist_cmp_data[452], mbist_cmp_data[530], mbist_cmp_data[608],
             mbist_cmp_data[375], mbist_cmp_data[453], mbist_cmp_data[531], mbist_cmp_data[609],
             mbist_cmp_data[376], mbist_cmp_data[454], mbist_cmp_data[532], mbist_cmp_data[610],
             mbist_cmp_data[377], mbist_cmp_data[455], mbist_cmp_data[533], mbist_cmp_data[611],
             mbist_cmp_data[378], mbist_cmp_data[456], mbist_cmp_data[534], mbist_cmp_data[612],
             mbist_cmp_data[379], mbist_cmp_data[457], mbist_cmp_data[535], mbist_cmp_data[613],
             mbist_cmp_data[380], mbist_cmp_data[458], mbist_cmp_data[536], mbist_cmp_data[614],
             mbist_cmp_data[381], mbist_cmp_data[459], mbist_cmp_data[537], mbist_cmp_data[615],
             mbist_cmp_data[382], mbist_cmp_data[460], mbist_cmp_data[538], mbist_cmp_data[616],
             mbist_cmp_data[383], mbist_cmp_data[461], mbist_cmp_data[539], mbist_cmp_data[617],
             mbist_cmp_data[384], mbist_cmp_data[462], mbist_cmp_data[540], mbist_cmp_data[618],
             mbist_cmp_data[385], mbist_cmp_data[463], mbist_cmp_data[541], mbist_cmp_data[619],
             mbist_cmp_data[386], mbist_cmp_data[464], mbist_cmp_data[542], mbist_cmp_data[620],
             mbist_cmp_data[387], mbist_cmp_data[465], mbist_cmp_data[543], mbist_cmp_data[621],
             mbist_cmp_data[388], mbist_cmp_data[466], mbist_cmp_data[544], mbist_cmp_data[622],
             mbist_cmp_data[389], mbist_cmp_data[467], mbist_cmp_data[545], mbist_cmp_data[623]} 
		=  {20{wb_mbist_data_in_r2[7:0]}};

//mux_macro mux_mbist_cmp_data1 (width=39,ports=8,mux=aodec)
//	(
//	.dout	(mbist_compare_data[38:0]),
//	.din0	(mbist_cmp_data[38:0]),
//	.din1	(mbist_cmp_data[116:78]),
//	.din2	(mbist_cmp_data[194:156]),
//	.din3	(mbist_cmp_data[272:234]),
//	.din4	(mbist_cmp_data[350:312]),
//	.din5	(mbist_cmp_data[428:390]),
//	.din6	(mbist_cmp_data[506:468]),
//	.din7	(mbist_cmp_data[584:546]),
//	.sel 	(mbist_compare_read_sel[2:0])
//	);
//
//mux_macro mux_mbist_cmp_data0 (width=39,ports=8,mux=aodec)
//        (
//        .dout   (mbist_compare_data[77:39]),
//        .din0   (mbist_cmp_data[77:39]),
//        .din1   (mbist_cmp_data[155:117]),
//        .din2   (mbist_cmp_data[233:195]),
//        .din3   (mbist_cmp_data[311:273]),
//        .din4   (mbist_cmp_data[389:351]),
//        .din5   (mbist_cmp_data[467:429]),
//        .din6   (mbist_cmp_data[545:507]),
//        .din7   (mbist_cmp_data[623:585]),
//        .sel    (mbist_compare_read_sel[2:0])
//        );
//
//
//msff_macro ff_mbist_compare_data10 (width=39)
//	(
//	.scan_in(ff_mbist_compare_data10_scanin),
//	.scan_out(ff_mbist_compare_data10_scanout),
//	.dout	(mbist_compare_data_r1[38:0]),
//	.din	(mbist_compare_data[38:0]),
//	.clk	(l2clk),
//	.en	(1'b1),
//	);
//msff_macro ff_mbist_compare_data11 (width=39)
//	(
//	.scan_in(ff_mbist_compare_data11_scanin),
//	.scan_out(ff_mbist_compare_data11_scanout),
//	.dout	(mbist_compare_data_r2[38:0]),
//	.din	(mbist_compare_data_r1[38:0]),
//	.clk	(l2clk),
//	.en	(1'b1),
//	);
//
//msff_macro ff_mbist_compare_data12 (width=39)
//	(
//	.scan_in(ff_mbist_compare_data12_scanin),
//	.scan_out(ff_mbist_compare_data12_scanout),
//	.dout	(mbist_compare_data_r3[38:0]),
//	.din	(mbist_compare_data_r2[38:0]),
//	.clk	(l2clk),
//	.en	(1'b1),
//	);
//
//
//msff_macro ff_mbist_compare_data0 (width=39)
//        (
//        .scan_in(ff_mbist_compare_data0_scanin),
//        .scan_out(ff_mbist_compare_data0_scanout),
//        .dout   (mbist_compare_data_r1[77:39]),
//        .din    (mbist_compare_data[77:39]),
//        .clk    (l2clk),
//        .en     (1'b1),
//        );
//
//msff_macro ff_mbist_compare_data1 (width=39)
//        (
//        .scan_in(ff_mbist_compare_data1_scanin),
//        .scan_out(ff_mbist_compare_data1_scanout),
//        .dout   (mbist_compare_data_r2[77:39]),
//        .din    (mbist_compare_data_r1[77:39]),
//        .clk    (l2clk),
//        .en     (1'b1),
//        );
//
//msff_macro ff_mbist_compare_data2 (width=39)
//        (
//        .scan_in(ff_mbist_compare_data2_scanin),
//        .scan_out(ff_mbist_compare_data2_scanout),
//        .dout   (mbist_compare_data_r3[77:39]),
//        .din    (mbist_compare_data_r2[77:39]),
//        .clk    (l2clk),
//        .en     (1'b1),
//        );
//
//


l2b_evict_dp_mux_macro__mux_pgpe__ports_4__stack_40r__width_39 mux_mbist_comp_mux1a  
              (.dout  (mbist_cmp_data_4t1[38:0]),
               .din0  (mbist_cmp_data[38:0]),  
               .din1  (mbist_cmp_data[116:78]),  
               .din2  (mbist_cmp_data[194:156]),  
               .din3  (mbist_cmp_data[272:234]),  
                .sel0 (sel_evct_mux_r3_1a[3]),
                .sel1 (sel_evct_mux_r3_1a[2]),
                .sel2 (sel_evct_mux_r3_1a[1]),
  .muxtst(muxtst),
  .test(test)
              ) ;


l2b_evict_dp_mux_macro__mux_pgpe__ports_4__stack_40r__width_39 mux_mbist_comp_mux1b   
              (.dout (mbist_cmp_data_4t1[77:39]),
               .din0  (mbist_cmp_data[77:39]),
               .din1  (mbist_cmp_data[155:117]),
               .din2  (mbist_cmp_data[233:195]),
               .din3  (mbist_cmp_data[311:273]),
                .sel0 (sel_evct_mux_r3_1b[3]),
                .sel1 (sel_evct_mux_r3_1b[2]),
                .sel2 (sel_evct_mux_r3_1b[1]),
  .muxtst(muxtst),
  .test(test)
              ) ;


l2b_evict_dp_mux_macro__mux_pgpe__ports_4__stack_40r__width_39 mux_mbist_comp_mux2a  
              (.dout (mbist_cmp_data_4t1[116:78]),
               .din0  (mbist_cmp_data[350:312]),  
               .din1  (mbist_cmp_data[428:390]),  
               .din2  (mbist_cmp_data[506:468]),  
               .din3  (mbist_cmp_data[584:546]),  
               .sel0 (sel_evct_mux_r3_2a[3]),
               .sel1 (sel_evct_mux_r3_2a[2]),
               .sel2 (sel_evct_mux_r3_2a[1]),
  .muxtst(muxtst),
  .test(test)
              ) ;

l2b_evict_dp_mux_macro__mux_pgpe__ports_4__stack_40r__width_39 mux_mbist_comp_mux2b 
              (.dout (mbist_cmp_data_4t1[155:117]),
               .din0  (mbist_cmp_data[389:351]),
               .din1  (mbist_cmp_data[467:429]),
               .din2  (mbist_cmp_data[545:507]),
               .din3  (mbist_cmp_data[623:585]),
               .sel0 (sel_evct_mux_r3_2b[3]),
               .sel1 (sel_evct_mux_r3_2b[2]),
               .sel2 (sel_evct_mux_r3_2b[1]),
  .muxtst(muxtst),
  .test(test)
              ) ;


l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39  mux_mbist_cmp_data_8t1a  
              (.dout (mbist_cmp_data_8t1[38:0]),
               .din0  (mbist_cmp_data_4t1[38:0]), 
               .din1  (mbist_cmp_data_4t1[116:78]), 
               .sel0 (l2t_l2b_ev_dword_r3_2),
               .sel1 (l2t_l2b_ev_dword_r3_2_n)              
              ) ;


l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39  mux_mbist_cmp_data_8t1b  
              (.dout (mbist_cmp_data_8t1[77:39]),
               .din0  (mbist_cmp_data_4t1[77:39]),
               .din1  (mbist_cmp_data_4t1[155:117]),
               .sel0 (l2t_l2b_ev_dword_r3_2),
               .sel1 (l2t_l2b_ev_dword_r3_2_n)
            ) ;



l2b_evict_dp_msff_macro__stack_40r__width_39   ff_mbist_cmp_r4a       
              (.dout   (mbist_compare_data[38:0]),
               .scan_in(ff_mbist_cmp_r4a_scanin),
               .scan_out(ff_mbist_cmp_r4a_scanout),
               .din (mbist_cmp_data_8t1[38:0]),
               .clk (l2clk),
               .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;


l2b_evict_dp_msff_macro__stack_40r__width_39   ff_mbist_cmp_r4b        
              (.dout   (mbist_compare_data[77:39]),
               .scan_in(ff_mbist_cmp_r4b_scanin),
               .scan_out(ff_mbist_cmp_r4b_scanout),
               .din (mbist_cmp_data_8t1[77:39]),
               .clk (l2clk),
               .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;

l2b_evict_dp_cmp_macro__width_64 ff_mbist_compare0  
	(
	.dout	(wb_or_rdma_rw_fail1),
	.din0	(wb_array_dout_r4[63:0]),
	.din1	(mbist_compare_data[63:0])
	);


l2b_evict_dp_cmp_macro__width_16 ff_mbist_compare1  
        (
        .dout   (wb_or_rdma_rw_fail2),
        .din0   ({2'b0,wb_array_dout_r4[77:64]}),
        .din1   ({2'b0,mbist_compare_data[77:64]})
        );

l2b_evict_dp_or_macro__width_1 or_wb_or_rdma_rw_fai_unregl 
	(
	.dout	(read_enable_piped),
	.din0	(mbist_wb_array_rd_en_reg2),
	.din1	(mbist_rdma_array_rd_en_reg2)
	);

l2b_evict_dp_nand_macro__width_1 and_wb_or_rdma_rw_fail_unreg 
	(
	.dout	(wb_or_rdma_rw_fail_unreg),
	.din0	(wb_or_rdma_rw_fail1),
	.din1	(wb_or_rdma_rw_fail2)
	);

l2b_evict_dp_nand_macro__width_1 nand_wb_or_rdma_rw_fail_qual 
	(
	.dout	(wb_or_rdma_rw_fail_unreg_out),
	.din0	(wb_or_rdma_rw_fail_unreg),
	.din1	(read_enable_piped1)
	);

l2b_evict_dp_msff_macro__stack_8c__width_6 ff_fb_rw_fail 
        (
        .scan_in(ff_fb_rw_fail_scanin),
        .scan_out(ff_fb_rw_fail_scanout),
        .dout   ({read_enable_piped1,
		  mbist_wb_array_rd_en_reg2,mbist_wb_array_rd_en_reg1,
		  mbist_rdma_array_rd_en_reg2,mbist_rdma_array_rd_en_reg1,
		wb_or_rdma_rw_fail}),
        .din    ({read_enable_piped,
		  mbist_wb_array_rd_en_reg1,mbist_wb_array_rd_en_reg,
		 mbist_rdma_array_rd_en_reg1,mbist_rdma_array_rd_en_reg,
		wb_or_rdma_rw_fail_unreg_out}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

// mux_macro mux_wb_or_rdma_rw_fail_unreg (width=1,mux=aonpe,ports=2,stack=2c)
// 	(
// 	.dout	(wb_or_rdma_rw_fail_unreg_out),
// 	.din0	(wb_or_rdma_rw_fail_unreg),
// 	.din1	(1'b1),
// 	.sel0	(read_enable_piped1),
// 	.sel1	(read_enable_piped1_n)
// 	);

// inv_macro inv_read_enable_piped1 (width=1)
// 	(
// 	.dout	(read_enable_piped1_n),
// 	.din	(read_enable_piped1)
// 	);

////////////////////////////////////////////////////////////////////////////////

l2b_ecc39_dp u_ecctree_39b_1
  (.dout   (wb_array_dout_ecc_r4[31:0]),
   .cflag  (check0_r4[5:0]),
   .pflag  (parity0_r4),
   .parity (wb_array_dout_r4[6:0]),
   .din    (wb_array_dout_r4[38:7])
  ) ;

l2b_ecc39_dp u_ecctree_39b_2
  (.dout   (wb_array_dout_ecc_r4[63:32]),
   .cflag  (check1_r4[5:0]),
   .pflag  (parity1_r4),
   .parity (wb_array_dout_r4[45:39]),
   .din    (wb_array_dout_r4[77:46])
  ) ;


//assign evict_uncorr_err_r4 = (l2t_l2b_evict_en_r4 & !error_qual) &
//                             (((|check0_r4[5:0]) & ~parity0_r4) |
//                              ((|check1_r4[5:0]) & ~parity1_r4)) ;
//
//assign evict_corr_err_r4   = (l2t_l2b_evict_en_r4 & !error_qual) &
//                             (parity0_r4 | parity1_r4) ;

// BS 06/13/04 added Notdata logic
// in case notdata is detected on either 32 bit datum , we have to flag UE to
// MCU so that MCU stores the data in DRAM by polluting the ECC to indicate
// multi-bit data error

// assign evict_notdata_err_lo_r4 = ({parity0_r4,check0_r4[5:0]} == 7'b1111111);
// assign evict_notdata_err_hi_r4 = ({parity1_r4,check1_r4[5:0]} == 7'b1111111);

//Replace the comparator with and's because we always comparing
//against all 1's.
// cmp_macro cmp_evict_notdata_err_low (width=8)
//         (
//         .din0   ({1'b0,7'b1111111}),
//         .din1   ({1'b0,parity0_r4,check0_r4[5:0]}),
//         .dout   (evict_notdata_err_lo_r4)
//         );

l2b_evict_dp_nand_macro__ports_4__width_1 cmp_nand_err_low_1 
        (
        .dout   (check0_r4_3_0_nand),
        .din0   (check0_r4[0]),
        .din1   (check0_r4[1]),
        .din2   (check0_r4[2]),
        .din3   (check0_r4[3])
        );

l2b_evict_dp_nand_macro__ports_3__width_1 cmp_nand_err_low_2 
        (
        .dout   (check0_r4_4_5_parity_0_nand),
        .din0   (check0_r4[4]),
        .din1   (check0_r4[5]),
        .din2   (parity0_r4)
        );

l2b_evict_dp_nor_macro__width_1 cmp_nor_low  
        (
        .dout   (evict_notdata_err_lo_r4),
        .din0   (check0_r4_3_0_nand),
        .din1   (check0_r4_4_5_parity_0_nand)
        );

//Replace the comparator with and's because we always comparing
//against all 1's.
// cmp_macro cmp_evict_notdata_err_hi (width=8)
//         (
//         .din0   ({1'b0,7'b1111111}),
//         .din1   ({1'b0,parity1_r4,check1_r4[5:0]}),
//         .dout   (evict_notdata_err_hi_r4)
//         );


l2b_evict_dp_nand_macro__ports_4__width_1 cmp_nand_err_hi_1 
        (
        .dout   (check1_r4_3_0_nand),
        .din0   (check1_r4[0]),
        .din1   (check1_r4[1]),
        .din2   (check1_r4[2]),
        .din3   (check1_r4[3])
        );

l2b_evict_dp_nand_macro__ports_3__width_1 cmp_nand_err_hi_2 
        (
        .dout   (check1_r4_4_5_parity_1_nand),
        .din0   (check1_r4[4]),
        .din1   (check1_r4[5]),
        .din2   (parity1_r4)
        );

l2b_evict_dp_nor_macro__width_1 cmp_nor_hi  
        (
        .dout   (evict_notdata_err_hi_r4),
        .din0   (check1_r4_3_0_nand),
        .din1   (check1_r4_4_5_parity_1_nand)
        );


l2b_evict_dp_inv_macro__width_1 error_qual_inv_slice  
	( 
	.dout	(error_qual_n ), 
	.din	(error_qual ) 
	);	

l2b_evict_dp_nand_macro__width_1 evict_en_and_error_qual_slice  
	( 
	.dout 	(evict_en_and_error_qual_), 
	.din0	(l2t_l2b_evict_en_r4), 
	.din1	(error_qual_n) 
	); 

l2b_evict_dp_inv_macro__dinv_16x__width_1 l2t_l2b_evict_en_r4_inv 
        (
        .dout   (l2t_l2b_evict_en_r4_n),
        .din    (l2t_l2b_evict_en_r4)
        );


l2b_evict_dp_cmp_macro__width_8 cmp_check0_r4	
	(
	.dout	(check0or_n),
	.din0	({2'b0,check0_r4[5:0]}),
	.din1	(8'b0)
	);
	
//inv_macro inv_check0or_n (width=1)
//	(
//	.dout	(check0or),
//	.din	(check0or_n)
//	);
//
//inv_macro parity0_r4_inv_slice (width=1) 
//	( 
//	.dout	(parity0_r4_n ), 
//	.din	(parity0_r4 ) 
//	);	
//
///

l2b_evict_dp_cmp_macro__width_8 cmp_check1_r4 
        (
        .dout   (check1or_n),
        .din0   ({2'b0,check1_r4[5:0]}),
        .din1   (8'b0)
        );

//inv_macro inv_check1or_n (width=1)
//        (
//        .dout   (check1or),
//        .din    (check1or_n)
//        );
//
//inv_macro parity1_r4_inv_slice (width=1)
//        (
//        .dout   (parity1_r4_n ),
//        .din    (parity1_r4 )
//        );
//
l2b_evict_dp_nand_macro__width_1 parity0_nand_parity1_slice  
	( 
	.dout 	(parity0_nand_parity1), 
	.din0	(parity1_r4), 
	.din1	(parity0_r4) 
	); 
l2b_evict_dp_nand_macro__width_1 parity1_nand_check1_slice 
        (
        .dout   (check0_nand_check1),
        .din0   (check0or_n),
        .din1   (check1or_n)
        );

l2b_evict_dp_nand_macro__width_1 parity0_nand_check1_slice  
	( 
	.dout 	(parity0_nand_check1), 
	.din0	(check1or_n), 
	.din1	(parity0_r4) 
	); 
l2b_evict_dp_nand_macro__width_1 parity1_nand_check0_slice 
        (
        .dout   (parity1_nand_check0),
        .din0   (check0or_n),
        .din1   (parity1_r4)
        );

// or_macro evict_uncorr_err_r4_eqn2_slice (width=1)
//         (
//         .dout   (evict_uncorr_err_r4_eqn2),
//         .din0   (parity0_n_and_check0),
//         .din1   (parity1_n_and_check1)
//         );

l2b_evict_dp_nand_macro__ports_4__width_1 evict_uncorr_err_r4_eqn2_slice 
        (
        .dout   (evict_uncorr_err_r4_eqn2_),
        .din0   (parity0_nand_parity1),
        .din1   (check0_nand_check1),
        .din2   (parity0_nand_check1),
        .din3   (parity1_nand_check0)
        );

l2b_evict_dp_nor_macro__width_1 evict_uncorr_err_r4_slice  
        (
        .dout   (evict_uncorr_err_r4),
        .din0   (evict_en_and_error_qual_),
        .din1   (evict_uncorr_err_r4_eqn2_)
        );

l2b_evict_dp_nor_macro__dnor_16x__width_1 evict_uncorr_mcu_err_r4_slice 
        (
        .dout   (evict_uncorr_mcu_err_r4),
        .din0   (l2t_l2b_evict_en_r4_n),
        .din1   (evict_uncorr_err_r4_eqn2_)
        );


l2b_evict_dp_nor_macro__width_1 parity_0_or_1_r4_slice 
        (
        .dout   (parity_0_or_1_r4_),
        .din0   (parity0_r4),
        .din1   (parity1_r4)
        );


//assign not_data_error_n = ~( evict_notdata_err_lo_r4 | evict_notdata_err_hi_r4);

l2b_evict_dp_nor_macro__dnor_16x__width_1 not_not_data_error_n 
         (
         .dout   (parity_0_or_1_r4_err_qual_n),
         .din0   (evict_en_and_error_qual_),
         .din1   (parity_0_or_1_r4_)
         );


//nor_macro evict_corr_err_r4_and_slice (width=1,ports=3)
//        (
//        .dout   (evict_corr_err_r4),
//        .din0   (evict_notdata_err_lo_r4),
//        .din1   (evict_notdata_err_hi_r4),
//	  .din2	  (parity_0_or_1_r4_err_qual)
//        );

l2b_evict_dp_nor_macro__dnor_16x__ports_2__width_1 nor_notdata_err_loorhi_r4 
	(
	.dout	(notdata_err_loorhi_r4_n),
	.din0	(evict_notdata_err_lo_r4),
	.din1	(evict_notdata_err_hi_r4)
	);

//assign evict_corr_err_r4 = (notdata_err_loorhi_r4_n & parity_0_or_1_r4_err_qual_n);

l2b_evict_dp_and_macro__dinv_48x__dnand_16x__ports_2__width_1 and_evict_corr_err_r4 
	(
	.dout	(evict_corr_err_r4),
	.din0	(notdata_err_loorhi_r4_n),
	.din1	(parity_0_or_1_r4_err_qual_n)
	);

l2b_evict_dp_msff_macro__stack_32r__width_32    ff_wb_array_dout_r5_31_0	
              (.dout   (wb_array_dout_r5[31:0]),
               .scan_in(ff_wb_array_dout_r5_31_0_scanin),
               .scan_out(ff_wb_array_dout_r5_31_0_scanout),
               .din (wb_array_dout_ecc_r4[31:0]),
               .clk (l2clk),
               .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ;

l2b_evict_dp_msff_macro__stack_32r__width_32    ff_wb_array_dout_r5_63_32       
              (.dout   (wb_array_dout_r5[63:32]),
               .scan_in(ff_wb_array_dout_r5_63_32_scanin),
               .scan_out(ff_wb_array_dout_r5_63_32_scanout),
               .din (wb_array_dout_ecc_r4[63:32]),
               .clk (l2clk),
               .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


////////////////////////////////////////////////////////////////////////////////
//assign  evict_l2b_mcu_wr_data_r5   = wb_array_dout_r5[63:0] ;
//assign  evict_l2b_mcu_data_vld_r5  = l2t_l2b_evict_en_r5 ;
//assign  evict_l2b_mcu_data_mecc_r5 = evict_mcu_uncorr_err_r5 ;
assign  evict_l2b_l2t_ev_uerr_r5  = evict_uncorr_err_r5 ;
assign  evict_l2b_l2t_ev_cerr_r5  = evict_corr_err_r5 ;

////////////////////////////////////////////////////////////////////////////////

l2b_evict_dp_inv_macro__width_1 inv_select_delay_mcu 
        (
        .dout   (select_delay_mcu_n),
        .din    (select_delay_mcu)
        );



l2b_evict_dp_msff_macro__dmsff_32x__stack_64c__width_64 ff_evict_l2b_mcu_wr_data_r5_d1 
	(
	.scan_in(ff_evict_l2b_mcu_wr_data_r5_d1_scanin),
	.scan_out(ff_evict_l2b_mcu_wr_data_r5_d1_scanout),
	.dout	(wb_array_dout_r5_d1[63:0]),
	.din	(wb_array_dout_r5[63:0]),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__stack_66c__width_66  mux_mcu_data0 	
	(
	.dout	({evict_l2b_mcu_wr_data_r5[63:0],evict_l2b_mcu_data_mecc_r5,evict_l2b_mcu_data_vld_r5}),
	.din0	({wb_array_dout_r5_d1[63:0],evict_mcu_uncorr_err_r5_d1,l2t_l2b_evict_en_r5_d1}),
	.din1	({wb_array_dout_r5[63:0],evict_mcu_uncorr_err_r5,l2t_l2b_evict_en_r5}),
	.sel0	(select_delay_mcu),
	.sel1	(select_delay_mcu_n)
	);


l2b_evict_dp_msff_macro__stack_21r__width_21 ff_evict_control_regs_slice  
        (
        .scan_in(ff_evict_control_regs_slice_scanin),
        .scan_out(ff_evict_control_regs_slice_scanout),
        .dout   ({evict_mcu_uncorr_err_r5_d1, l2t_l2b_evict_en_r5_d1,
		  evict_uncorr_mcu_err_r5,evict_uncorr_err_r5,evict_corr_err_r5,evict_notdata_err_lo_r5,
                  evict_notdata_err_hi_r5,
                  l2t_l2b_evict_en_r1_fnl, l2t_l2b_evict_en_r2,
                  l2t_l2b_evict_en_r3, l2t_l2b_evict_en_r4,l2t_l2b_evict_en_r5,
                  l2t_l2b_ev_dword_r1[2:0],l2t_l2b_ev_dword_r2[2],l2t_l2b_ev_dword_r3[2],
                  sel_evct_mux_r2[3:0]}),
        .din    ({evict_mcu_uncorr_err_r5,l2t_l2b_evict_en_r5,evict_uncorr_mcu_err_r4,
		  evict_uncorr_err_r4,evict_corr_err_r4,evict_notdata_err_lo_r4,
                  evict_notdata_err_hi_r4,
                  l2t_l2b_evict_en_r0,l2t_l2b_evict_en_r1,
                  l2t_l2b_evict_en_r2,l2t_l2b_evict_en_r3,l2t_l2b_evict_en_r4,
                  l2t_l2b_ev_dword_r0[2:0], l2t_l2b_ev_dword_r1[2],l2t_l2b_ev_dword_r2[2],
		  sel_evct_mux_r1[3:0]}),// sel_evct_fnl_mux_sel[3:0]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );




l2b_evict_dp_msff_macro__stack_4r__width_4 ff_mux_select0_2b  
	(
	.scan_in(ff_mux_select0_2b_scanin),
	.scan_out(ff_mux_select0_2b_scanout),
	.dout	(sel_evct_mux_r3_2b[3:0]),
	.din	(sel_evct_fnl_mux_sel[3:0]),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2b_evict_dp_msff_macro__stack_4r__width_4 ff_mux_select1_2a  
        (
        .scan_in(ff_mux_select1_2a_scanin),
        .scan_out(ff_mux_select1_2a_scanout),
        .dout   (sel_evct_mux_r3_2a[3:0]),
        .din    (sel_evct_fnl_mux_sel[3:0]),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_evict_dp_msff_macro__stack_4r__width_4 ff_mux_select2_1b  
        (
        .scan_in(ff_mux_select2_1b_scanin),
        .scan_out(ff_mux_select2_1b_scanout),
        .dout   (sel_evct_mux_r3_1b[3:0]),
        .din    (sel_evct_fnl_mux_sel[3:0]),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_evict_dp_msff_macro__stack_4r__width_4 ff_mux_select3_1a  
        (
        .scan_in(ff_mux_select3_1a_scanin),
        .scan_out(ff_mux_select3_1a_scanout),
        .dout   (sel_evct_mux_r3_1a[3:0]),
        .din    (sel_evct_fnl_mux_sel[3:0]),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_6r__width_6 mux_gen_dword	
	(
	.dout	({l2t_l2b_evict_en_r1,mbist_pick_top_bot,sel_evct_fnl_mux_sel[3:0]}),
	.din0	({l2t_l2b_evict_en_r1_fnl,1'b0,sel_evct_mux_r2[3:0]}),
//	.din1	({1'b1,mbist_evict_muxsel_reg[4:0]}),
	.din1	({1'b1,mbist_evict_muxsel_reg[4],mbist_evict_muxsel_reg[0],mbist_evict_muxsel_reg[1],
			mbist_evict_muxsel_reg[2],mbist_evict_muxsel_reg[3]}),
	.sel0	(mbist_run_reg_n),
	.sel1	(mbist_run_reg)
	);

// BS 06/13/04 added Notdata logic
// in case notdata is detected on either 32 bit datum , we have to flag UE to
// MCU so that MCU stores the data in DRAM by polluting the ECC to indicate
// multi-bit data error

l2b_evict_dp_or_macro__dinv_16x__dnor_4x__ports_3__width_1 evict_mcu_uncorr_err_r5_slice 
        (
        .dout   (evict_mcu_uncorr_err_r5),
        .din0   (evict_notdata_err_lo_r5),
        .din1   (evict_notdata_err_hi_r5),
        .din2   (evict_uncorr_mcu_err_r5)
        );


l2b_evict_dp_msff_macro__stack_6r__width_6 ff_wb_control_regs_slice     
        (
        .scan_in(ff_wb_control_regs_slice_scanin),
        .scan_out(ff_wb_control_regs_slice_scanout),
        .dout   ({l2t_l2b_wbwr_wen_c7,l2t_l2b_wbrd_en_r1,l2t_l2b_wbrd_en_r2,
                  l2t_l2b_wbwr_wl_c7[2:0]}),
        .din    ({l2t_l2b_wbwr_wen_c6,l2t_l2b_wbrd_en_r0,l2t_l2b_wbrd_en_r1_in,
                  l2t_l2b_wbwr_wl_c6[2:0]}),
        .clk    (l2clk),
        //.en     (mbist_run_reg_n),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_evict_dp_msff_macro__stack_8r__width_8 ff_wb_control_regs_slice_v1     
        (
        .scan_in(ff_wb_control_regs_slice_v1_scanin),
        .scan_out(ff_wb_control_regs_slice_v1_scanout),
        .dout   ({l2t_l2b_wbrd_en_r1_v1,l2t_l2b_wbrd_wl_r1_v1[2:0],l2t_l2b_wbwr_wl_c8_v1[2:0],l2t_l2b_wbwr_wen_c8_v1}),
        .din    ({l2t_l2b_wbrd_en_r0   ,l2t_l2b_wbrd_wl_r0[2:0]   ,l2t_l2b_wbwr_wl_c7[2:0],l2t_l2b_wbwr_wen_c7})   ,
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_evict_dp_msff_macro__stack_8r__width_8 ff_wb_control_regs_slice_v2     
        (
        .scan_in(ff_wb_control_regs_slice_v2_scanin),
        .scan_out(ff_wb_control_regs_slice_v2_scanout),
        .dout   ({l2t_l2b_wbrd_en_r1_v2,l2t_l2b_wbrd_wl_r1_v2[2:0],l2t_l2b_wbwr_wl_c8_v2[2:0],l2t_l2b_wbwr_wen_c8_v2}),
        .din    ({l2t_l2b_wbrd_en_r0   ,l2t_l2b_wbrd_wl_r0[2:0]   ,l2t_l2b_wbwr_wl_c7[2:0],l2t_l2b_wbwr_wen_c7})   ,
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_evict_dp_msff_macro__stack_8r__width_8 ff_wb_control_regs_slice_v3     
        (
        .scan_in(ff_wb_control_regs_slice_v3_scanin),
        .scan_out(ff_wb_control_regs_slice_v3_scanout),
        .dout   ({l2t_l2b_wbrd_en_r1_v3,l2t_l2b_wbrd_wl_r1_v3[2:0],l2t_l2b_wbwr_wl_c8_v3[2:0],l2t_l2b_wbwr_wen_c8_v3}),
        .din    ({l2t_l2b_wbrd_en_r0   ,l2t_l2b_wbrd_wl_r0[2:0]   ,l2t_l2b_wbwr_wl_c7[2:0],l2t_l2b_wbwr_wen_c7})   ,
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_evict_dp_msff_macro__stack_8r__width_8 ff_wb_control_regs_slice_v4     
        (
        .scan_in(ff_wb_control_regs_slice_v4_scanin),
        .scan_out(ff_wb_control_regs_slice_v4_scanout),
        .dout   ({l2t_l2b_wbrd_en_r1_v4,l2t_l2b_wbrd_wl_r1_v4[2:0],l2t_l2b_wbwr_wl_c8_v4[2:0],l2t_l2b_wbwr_wen_c8_v4}),
        .din    ({l2t_l2b_wbrd_en_r0   ,l2t_l2b_wbrd_wl_r0[2:0]   ,l2t_l2b_wbwr_wl_c7[2:0],l2t_l2b_wbwr_wen_c7})   ,
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_4    mux_rdma_word_wen_v1   
 	(
 	.dout	({l2t_l2b_rdma_fnl_wren_s2[15],l2t_l2b_rdma_fnl_wren_s2[13],l2t_l2b_rdma_fnl_wren_s2[11],l2t_l2b_rdma_fnl_wren_s2[9]}),
 	.din0	({l2t_l2b_rdma_wren_s2[15],l2t_l2b_rdma_wren_s2[13],l2t_l2b_rdma_wren_s2[11],l2t_l2b_rdma_wren_s2[9]}),
 	.din1	(4'hF),
 	.sel0	(mbist_run_reg_v1_n),
 	.sel1	(mbist_run_reg_v1)
 	);

l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_4    mux_rdma_word_wen_v2   
	(
	.dout	({l2t_l2b_rdma_fnl_wren_s2[14],l2t_l2b_rdma_fnl_wren_s2[12],l2t_l2b_rdma_fnl_wren_s2[10],l2t_l2b_rdma_fnl_wren_s2[8]}),
	.din0	({l2t_l2b_rdma_wren_s2[14],l2t_l2b_rdma_wren_s2[12],l2t_l2b_rdma_wren_s2[10],l2t_l2b_rdma_wren_s2[8]}),
	.din1	(4'hF),
	.sel0	(mbist_run_reg_v2_n),
	.sel1	(mbist_run_reg_v2)
	);

l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_4    mux_rdma_word_wen_v3   
	(
	.dout	({l2t_l2b_rdma_fnl_wren_s2[7],l2t_l2b_rdma_fnl_wren_s2[5],l2t_l2b_rdma_fnl_wren_s2[3],l2t_l2b_rdma_fnl_wren_s2[1]}),
	.din0	({l2t_l2b_rdma_wren_s2[7],l2t_l2b_rdma_wren_s2[5],l2t_l2b_rdma_wren_s2[3],l2t_l2b_rdma_wren_s2[1]}),
	.din1	(4'hF),
	.sel0	(mbist_run_reg_v3_n),
	.sel1	(mbist_run_reg_v3)
	);

l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_4    mux_rdma_word_wen_v4   
	(
	.dout	({l2t_l2b_rdma_fnl_wren_s2[6],l2t_l2b_rdma_fnl_wren_s2[4],l2t_l2b_rdma_fnl_wren_s2[2],l2t_l2b_rdma_fnl_wren_s2[0]}),
	.din0	({l2t_l2b_rdma_wren_s2[6],l2t_l2b_rdma_wren_s2[4],l2t_l2b_rdma_wren_s2[2],l2t_l2b_rdma_wren_s2[0]}),
	.din1	(4'hF),
	.sel0	(mbist_run_reg_v4_n),
	.sel1	(mbist_run_reg_v4)
	);

l2b_evict_dp_msff_macro__stack_6r__width_5 ff_rdma_control_regs_slice   
        (
        .scan_in(ff_rdma_control_regs_slice_scanin),
        .scan_out(ff_rdma_control_regs_slice_scanout),
        .dout   ({error_qual,l2t_l2b_rdma_rden_r1,
		  l2t_l2b_rdma_rden_r2, l2t_l2b_rdma_rden_r3,
                  dbb_rst_l}),
        .din    ({ff_array_rd_ptr_din,l2t_l2b_rdma_rden_r0,
		  l2t_l2b_rdma_rden_r1, l2t_l2b_rdma_rden_r2,
		  wmr_l}),
        .clk    (l2clk),
//        .en     (mbist_run_reg_n),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2b_evict_dp_msff_macro__stack_10r__width_9 ff_rdma_control_regs_slice_v1   
        (
        .scan_in(ff_rdma_control_regs_slice_v1_scanin),
        .scan_out(ff_rdma_control_regs_slice_v1_scanout),
        .dout   ({l2t_l2b_rdma_rden_r1_v1,l2t_l2b_rdma_rdwl_r1_v1[1:0], evict_l2t_l2b_rdma_wren_s3[15], evict_l2t_l2b_rdma_wren_s3[13],
                  evict_l2t_l2b_rdma_wren_s3[11], evict_l2t_l2b_rdma_wren_s3[9],l2t_l2b_rdma_wrwl_s3_v1[1:0]}),
        .din    ({l2t_l2b_rdma_rden_r0   ,l2t_l2b_rdma_rdwl_r0[1:0],    l2t_l2b_rdma_fnl_wren_s2[15], l2t_l2b_rdma_fnl_wren_s2[13],
                  l2t_l2b_rdma_fnl_wren_s2[11], l2t_l2b_rdma_fnl_wren_s2[9],l2t_l2b_rdma_wrwl_s2[1:0]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2b_evict_dp_msff_macro__stack_10r__width_9 ff_rdma_control_regs_slice_v2   
        (
        .scan_in(ff_rdma_control_regs_slice_v2_scanin),
        .scan_out(ff_rdma_control_regs_slice_v2_scanout),
        .dout   ({l2t_l2b_rdma_rden_r1_v2,l2t_l2b_rdma_rdwl_r1_v2[1:0], evict_l2t_l2b_rdma_wren_s3[14], evict_l2t_l2b_rdma_wren_s3[12],
                  evict_l2t_l2b_rdma_wren_s3[10], evict_l2t_l2b_rdma_wren_s3[8],l2t_l2b_rdma_wrwl_s3_v2[1:0]}),
        .din    ({l2t_l2b_rdma_rden_r0   ,l2t_l2b_rdma_rdwl_r0[1:0],    l2t_l2b_rdma_fnl_wren_s2[14], l2t_l2b_rdma_fnl_wren_s2[12],
                  l2t_l2b_rdma_fnl_wren_s2[10], l2t_l2b_rdma_fnl_wren_s2[8],l2t_l2b_rdma_wrwl_s2[1:0]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );



l2b_evict_dp_msff_macro__stack_10r__width_9 ff_rdma_control_regs_slice_v3   
        (
        .scan_in(ff_rdma_control_regs_slice_v3_scanin),
        .scan_out(ff_rdma_control_regs_slice_v3_scanout),
        .dout   ({l2t_l2b_rdma_rden_r1_v3,l2t_l2b_rdma_rdwl_r1_v3[1:0], evict_l2t_l2b_rdma_wren_s3[7], evict_l2t_l2b_rdma_wren_s3[5],
                  evict_l2t_l2b_rdma_wren_s3[3], evict_l2t_l2b_rdma_wren_s3[1],l2t_l2b_rdma_wrwl_s3_v3[1:0]}),
        .din    ({l2t_l2b_rdma_rden_r0   ,l2t_l2b_rdma_rdwl_r0[1:0],    l2t_l2b_rdma_fnl_wren_s2[7], l2t_l2b_rdma_fnl_wren_s2[5],
                  l2t_l2b_rdma_fnl_wren_s2[3], l2t_l2b_rdma_fnl_wren_s2[1],l2t_l2b_rdma_wrwl_s2[1:0]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2b_evict_dp_msff_macro__stack_10r__width_9 ff_rdma_control_regs_slice_v4   
        (
        .scan_in(ff_rdma_control_regs_slice_v4_scanin),
        .scan_out(ff_rdma_control_regs_slice_v4_scanout),
        .dout   ({l2t_l2b_rdma_rden_r1_v4,l2t_l2b_rdma_rdwl_r1_v4[1:0], evict_l2t_l2b_rdma_wren_s3[6], evict_l2t_l2b_rdma_wren_s3[4],
                  evict_l2t_l2b_rdma_wren_s3[2], evict_l2t_l2b_rdma_wren_s3[0],l2t_l2b_rdma_wrwl_s3_v4[1:0]}),
        .din    ({l2t_l2b_rdma_rden_r0   ,l2t_l2b_rdma_rdwl_r0[1:0],    l2t_l2b_rdma_fnl_wren_s2[6], l2t_l2b_rdma_fnl_wren_s2[4],
                  l2t_l2b_rdma_fnl_wren_s2[2], l2t_l2b_rdma_fnl_wren_s2[0],l2t_l2b_rdma_wrwl_s2[1:0]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );




// fixscan start:
assign ff_mbist_run_scanin       = scan_in                  ;
assign ff_mbist_run_v1_scanin    = ff_mbist_run_scanout     ;
assign ff_mbist_run_v2_scanin    = ff_mbist_run_v1_scanout  ;
assign ff_mbist_run_v3_scanin    = ff_mbist_run_v2_scanout  ;
assign ff_mbist_run_v4_scanin    = ff_mbist_run_v3_scanout  ;
assign ff_wb_array_dout_r3_1a_scanin = ff_mbist_run_v4_scanout  ;
assign ff_wb_array_dout_r3_1b_scanin = ff_wb_array_dout_r3_1a_scanout;
assign ff_wb_array_dout_r3_1c_scanin = ff_wb_array_dout_r3_1b_scanout;
assign ff_wb_array_dout_r3_1d_scanin = ff_wb_array_dout_r3_1c_scanout;
assign ff_wb_array_dout_r3_2a_scanin = ff_wb_array_dout_r3_1d_scanout;
assign ff_wb_array_dout_r3_2b_scanin = ff_wb_array_dout_r3_2a_scanout;
assign ff_wb_array_dout_r3_2c_scanin = ff_wb_array_dout_r3_2b_scanout;
assign ff_wb_array_dout_r3_2d_scanin = ff_wb_array_dout_r3_2c_scanout;
assign ff_wb_array_dout_r3_3a_scanin = ff_wb_array_dout_r3_2d_scanout;
assign ff_wb_array_dout_r3_3b_scanin = ff_wb_array_dout_r3_3a_scanout;
assign ff_wb_array_dout_r3_3c_scanin = ff_wb_array_dout_r3_3b_scanout;
assign ff_wb_array_dout_r3_3d_scanin = ff_wb_array_dout_r3_3c_scanout;
assign ff_wb_array_dout_r3_4a_scanin = ff_wb_array_dout_r3_3d_scanout;
assign ff_wb_array_dout_r3_4b_scanin = ff_wb_array_dout_r3_4a_scanout;
assign ff_wb_array_dout_r3_4c_scanin = ff_wb_array_dout_r3_4b_scanout;
assign ff_wb_array_dout_r3_4d_scanin = ff_wb_array_dout_r3_4c_scanout;
assign ff_wb_array_dout_r4a_scanin = ff_wb_array_dout_r3_4d_scanout;
assign ff_wb_array_dout_r4b_scanin = ff_wb_array_dout_r4a_scanout;
assign ff_mbist_cmp_r4a_scanin   = ff_wb_array_dout_r4b_scanout;
assign ff_mbist_cmp_r4b_scanin   = ff_mbist_cmp_r4a_scanout ;
assign ff_fb_rw_fail_scanin      = ff_mbist_cmp_r4b_scanout ;
assign ff_wb_array_dout_r5_31_0_scanin = ff_fb_rw_fail_scanout    ;
assign ff_wb_array_dout_r5_63_32_scanin = ff_wb_array_dout_r5_31_0_scanout;
assign ff_evict_l2b_mcu_wr_data_r5_d1_scanin = ff_wb_array_dout_r5_63_32_scanout;
assign ff_evict_control_regs_slice_scanin = ff_evict_l2b_mcu_wr_data_r5_d1_scanout;
assign ff_mux_select0_2b_scanin  = ff_evict_control_regs_slice_scanout;
assign ff_mux_select1_2a_scanin  = ff_mux_select0_2b_scanout;
assign ff_mux_select2_1b_scanin  = ff_mux_select1_2a_scanout;
assign ff_mux_select3_1a_scanin  = ff_mux_select2_1b_scanout;
assign ff_wb_control_regs_slice_scanin = ff_mux_select3_1a_scanout;
assign ff_wb_control_regs_slice_v1_scanin = ff_wb_control_regs_slice_scanout;
assign ff_wb_control_regs_slice_v2_scanin = ff_wb_control_regs_slice_v1_scanout;
assign ff_wb_control_regs_slice_v3_scanin = ff_wb_control_regs_slice_v2_scanout;
assign ff_wb_control_regs_slice_v4_scanin = ff_wb_control_regs_slice_v3_scanout;
assign ff_rdma_control_regs_slice_scanin = ff_wb_control_regs_slice_v4_scanout;
assign ff_rdma_control_regs_slice_v1_scanin = ff_rdma_control_regs_slice_scanout;
assign ff_rdma_control_regs_slice_v2_scanin = ff_rdma_control_regs_slice_v1_scanout;
assign ff_rdma_control_regs_slice_v3_scanin = ff_rdma_control_regs_slice_v2_scanout;
assign ff_rdma_control_regs_slice_v4_scanin = ff_rdma_control_regs_slice_v3_scanout;
assign scan_out                  = ff_rdma_control_regs_slice_v4_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_26c__width_25 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [23:0] so;

  input [24:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [24:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(25)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[24:0]),
.si({scan_in,so[23:0]}),
.so({so[23:0],scan_out}),
.q(dout[24:0])
);




















endmodule









//
//   invert macro
//
//





module l2b_evict_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_8c__width_8 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_14r__width_14 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [13:0] din0;
  input sel0;
  input [13:0] din1;
  input sel1;
  output [13:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(14)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
.dout(dout[13:0])
);









  



endmodule


//
//   buff macro
//
//





module l2b_evict_dp_buff_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   buff macro
//
//





module l2b_evict_dp_buff_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






buff #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);








endmodule





//  
//   or macro for ports = 2,3
//
//





module l2b_evict_dp_or_macro__width_1 (
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





//  
//   or macro for ports = 2,3
//
//





module l2b_evict_dp_or_macro__ports_2__width_1 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2c__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(1)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module l2b_evict_dp_and_macro__width_1 (
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





//
//   nand macro for ports = 2,3,4
//
//





module l2b_evict_dp_nand_macro__dnand_32x__ports_2__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






nand2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_40r__width_39 (
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






// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_40r__width_39 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [37:0] so;

  input [38:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [38:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2b_evict_dp_cmp_macro__width_4 (
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





module l2b_evict_dp_nor_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_evict_dp_mux_macro__mux_pgpe__ports_4__stack_40r__width_39 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [38:0] din0;
  input [38:0] din1;
  input [38:0] din2;
  input [38:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [38:0] dout;





cl_dp1_penc4_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(39)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
  .in2(din2[38:0]),
  .in3(din3[38:0]),
.dout(dout[38:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2c (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(1)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_40r__width_39 (
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
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2b_evict_dp_cmp_macro__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output dout;






cmp #(64)  m0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2b_evict_dp_cmp_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2b_evict_dp_nand_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_8c__width_6 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [4:0] so;

  input [5:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [5:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);




endmodule




//
//   xor macro for ports = 2,3
//
//





module l2b_evict_dp_xor_macro__dxor_8x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module l2b_evict_dp_xor_macro__dxor_16x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module l2b_evict_dp_xor_macro__dxor_16x__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   invert macro
//
//





module l2b_evict_dp_inv_macro__dinv_32x__stack_1r__width_1 (
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
//   nand macro for ports = 2,3,4
//
//





module l2b_evict_dp_nand_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nand3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2b_evict_dp_nor_macro__ports_2__width_1 (
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





//
//   xor macro for ports = 2,3
//
//





module l2b_evict_dp_xor_macro__stack_32r__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;





xor2 #(32)  d0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2b_evict_dp_nand_macro__ports_4__width_1 (
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






nand4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2b_evict_dp_nor_macro__width_1 (
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





//
//   invert macro
//
//





module l2b_evict_dp_inv_macro__dinv_16x__width_1 (
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
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2b_evict_dp_cmp_macro__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output dout;






cmp #(8)  m0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout)
);










endmodule





//
//   nor macro for ports = 2,3
//
//





module l2b_evict_dp_nor_macro__dnor_16x__width_1 (
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





//
//   nor macro for ports = 2,3
//
//





module l2b_evict_dp_nor_macro__dnor_16x__ports_2__width_1 (
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





//  
//   and macro for ports = 2,3,4
//
//





module l2b_evict_dp_and_macro__dinv_48x__dnand_16x__ports_2__width_1 (
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









// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_32r__width_32 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__dmsff_32x__stack_64c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;
  output [65:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(66)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
.dout(dout[65:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_21r__width_21 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [19:0] so;

  input [20:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [20:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(21)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[20:0]),
.si({scan_in,so[19:0]}),
.so({so[19:0],scan_out}),
.q(dout[20:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_4r__width_4 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [2:0] so;

  input [3:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [3:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_evict_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_6r__width_6 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [5:0] din0;
  input sel0;
  input [5:0] din1;
  input sel1;
  output [5:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(6)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[5:0]),
  .in1(din1[5:0]),
.dout(dout[5:0])
);









  



endmodule


//  
//   or macro for ports = 2,3
//
//





module l2b_evict_dp_or_macro__dinv_16x__dnor_4x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






or3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_6r__width_6 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [4:0] so;

  input [5:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [5:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_8r__width_8 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2b_evict_dp_mux_macro__mux_aonpe__ports_2__stack_4r__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  output [3:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(4)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[3:0]),
  .in1(din1[3:0]),
.dout(dout[3:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_6r__width_5 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [3:0] so;

  input [4:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [4:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2b_evict_dp_msff_macro__stack_10r__width_9 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [7:0] so;

  input [8:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [8:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);




















endmodule








