// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu.v
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
module ncu (
  scan_in, 
  tcu_scan_en, 
  scan_out, 
  tcu_ncu_io_clk_stop, 
  tcu_ncu_clk_stop, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_array_wr_inhibit, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dbr_gateoff, 
  tcu_ncu_mbist_start, 
  ncu_tcu_mbist_done, 
  ncu_tcu_mbist_fail, 
  tcu_ncu_mbist_scan_in, 
  ncu_tcu_mbist_scan_out, 
  tcu_mbist_user_mode, 
  tcu_mbist_bisi_en, 
  ncu_pcx_stall_pq, 
  pcx_ncu_data_px2, 
  pcx_ncu_data_rdy_px1, 
  ncu_cpx_data_ca, 
  ncu_cpx_req_cq, 
  cpx_ncu_grant_cx, 
  ncu_dmu_pio_data, 
  ncu_dmu_pio_hdr_vld, 
  ncu_dmu_mmu_addr_vld, 
  dmu_ncu_wrack_vld, 
  dmu_ncu_wrack_tag, 
  ncu_dmu_mondo_ack, 
  ncu_dmu_mondo_nack, 
  ncu_dmu_mondo_id, 
  ncu_dmu_vld, 
  ncu_dmu_data, 
  dmu_ncu_stall, 
  dmu_ncu_vld, 
  dmu_ncu_data, 
  ncu_dmu_stall, 
  ncu_ccu_vld, 
  ncu_ccu_data, 
  ccu_ncu_data, 
  ccu_ncu_vld, 
  ccu_ncu_stall, 
  ncu_ccu_stall, 
  ncu_mcu0_vld, 
  ncu_mcu0_data, 
  mcu0_ncu_stall, 
  mcu0_ncu_vld, 
  mcu0_ncu_data, 
  ncu_mcu0_stall, 
  ncu_mcu1_vld, 
  ncu_mcu1_data, 
  mcu1_ncu_stall, 
  mcu1_ncu_vld, 
  mcu1_ncu_data, 
  ncu_mcu1_stall, 
  ncu_mcu2_vld, 
  ncu_mcu2_data, 
  mcu2_ncu_stall, 
  mcu2_ncu_vld, 
  mcu2_ncu_data, 
  ncu_mcu2_stall, 
  ncu_mcu3_vld, 
  ncu_mcu3_data, 
  mcu3_ncu_stall, 
  mcu3_ncu_vld, 
  mcu3_ncu_data, 
  ncu_mcu3_stall, 
  ncu_niu_vld, 
  ncu_niu_data, 
  niu_ncu_stall, 
  niu_ncu_vld, 
  niu_ncu_data, 
  ncu_niu_stall, 
  ncu_tcu_vld, 
  ncu_tcu_data, 
  tcu_ncu_stall, 
  tcu_ncu_vld, 
  tcu_ncu_data, 
  ncu_tcu_stall, 
  ncu_mio_ssi_mosi, 
  ncu_mio_ssi_sck, 
  mio_ncu_ssi_miso, 
  mio_ncu_ext_int_l, 
  ncu_rst_vld, 
  ncu_rst_data, 
  rst_ncu_stall, 
  rst_ncu_vld, 
  rst_ncu_data, 
  ncu_rst_stall, 
  efu_ncu_fuse_data, 
  efu_ncu_srlnum0_xfer_en, 
  efu_ncu_srlnum1_xfer_en, 
  efu_ncu_srlnum2_xfer_en, 
  efu_ncu_fusestat_xfer_en, 
  efu_ncu_coreavl_xfer_en, 
  efu_ncu_bankavl_xfer_en, 
  sii_ncu_req, 
  ncu_sii_gnt, 
  sii_ncu_data, 
  rst_ncu_unpark_thread, 
  rst_ncu_xir_, 
  ncu_rst_xir_done, 
  ncu_cmp_tick_enable, 
  ncu_wmr_vec_mask, 
  ncu_spc0_core_available, 
  ncu_spc1_core_available, 
  ncu_spc2_core_available, 
  ncu_spc3_core_available, 
  ncu_spc4_core_available, 
  ncu_spc5_core_available, 
  ncu_spc6_core_available, 
  ncu_spc7_core_available, 
  ncu_spc0_core_enable_status, 
  ncu_spc1_core_enable_status, 
  ncu_spc2_core_enable_status, 
  ncu_spc3_core_enable_status, 
  ncu_spc4_core_enable_status, 
  ncu_spc5_core_enable_status, 
  ncu_spc6_core_enable_status, 
  ncu_spc7_core_enable_status, 
  ncu_spc0_core_running, 
  ncu_spc1_core_running, 
  ncu_spc2_core_running, 
  ncu_spc3_core_running, 
  ncu_spc4_core_running, 
  ncu_spc5_core_running, 
  ncu_spc6_core_running, 
  ncu_spc7_core_running, 
  spc0_ncu_core_running_status, 
  spc1_ncu_core_running_status, 
  spc2_ncu_core_running_status, 
  spc3_ncu_core_running_status, 
  spc4_ncu_core_running_status, 
  spc5_ncu_core_running_status, 
  spc6_ncu_core_running_status, 
  spc7_ncu_core_running_status, 
  ncu_spc_pm, 
  ncu_spc_ba01, 
  ncu_spc_ba23, 
  ncu_spc_ba45, 
  ncu_spc_ba67, 
  ncu_spc_l2_idx_hash_en, 
  ncu_sii_pm, 
  ncu_sii_ba01, 
  ncu_sii_ba23, 
  ncu_sii_ba45, 
  ncu_sii_ba67, 
  ncu_sii_l2_idx_hash_en, 
  ncu_l2t_pm, 
  ncu_l2t_ba01, 
  ncu_l2t_ba23, 
  ncu_l2t_ba45, 
  ncu_l2t_ba67, 
  ncu_mcu_pm, 
  ncu_mcu_ba01, 
  ncu_mcu_ba23, 
  ncu_mcu_ba45, 
  ncu_mcu_ba67, 
  ncu_rst_fatal_error, 
  ncu_tcu_bank_avail, 
  sii_ncu_dparity, 
  sii_ncu_niuctag_ue, 
  ncu_sii_niuctag_uei, 
  sii_ncu_niuctag_ce, 
  ncu_sii_niuctag_cei, 
  sii_ncu_niua_pe, 
  ncu_sii_niua_pei, 
  sii_ncu_niud_pe, 
  ncu_sii_niud_pei, 
  sii_ncu_dmuctag_ue, 
  ncu_sii_dmuctag_uei, 
  sii_ncu_dmuctag_ce, 
  ncu_sii_dmuctag_cei, 
  sii_ncu_dmua_pe, 
  ncu_sii_dmua_pei, 
  sii_ncu_dmud_pe, 
  ncu_sii_dmud_pei, 
  sii_ncu_syn_vld, 
  sii_ncu_syn_data, 
  tcu_sck_bypass, 
  sio_ncu_ctag_ce, 
  ncu_sio_ctag_cei, 
  sio_ncu_ctag_ue, 
  ncu_sio_ctag_uei, 
  ncu_sio_d_pei, 
  niu_ncu_ctag_ue, 
  ncu_niu_ctag_uei, 
  niu_ncu_ctag_ce, 
  ncu_niu_ctag_cei, 
  niu_ncu_d_pe, 
  ncu_niu_d_pei, 
  dmu_ncu_wrack_par, 
  ncu_dmu_mondo_id_par, 
  dmu_ncu_d_pe, 
  ncu_dmu_d_pei, 
  dmu_ncu_siicr_pe, 
  ncu_dmu_siicr_pei, 
  dmu_ncu_ctag_ue, 
  ncu_dmu_ctag_uei, 
  dmu_ncu_ctag_ce, 
  ncu_dmu_ctag_cei, 
  dmu_ncu_ncucr_pe, 
  ncu_dmu_ncucr_pei, 
  dmu_ncu_ie, 
  ncu_dmu_iei, 
  mcu0_ncu_ecc, 
  ncu_mcu0_ecci, 
  mcu0_ncu_fbr, 
  ncu_mcu0_fbri, 
  ncu_mcu0_fbui, 
  mcu1_ncu_ecc, 
  ncu_mcu1_ecci, 
  mcu1_ncu_fbr, 
  ncu_mcu1_fbri, 
  ncu_mcu1_fbui, 
  mcu2_ncu_ecc, 
  ncu_mcu2_ecci, 
  mcu2_ncu_fbr, 
  ncu_mcu2_fbri, 
  ncu_mcu2_fbui, 
  mcu3_ncu_ecc, 
  ncu_mcu3_ecci, 
  mcu3_ncu_fbr, 
  ncu_mcu3_fbri, 
  ncu_mcu3_fbui, 
  rst_wmr_protect, 
  cluster_arst_l, 
  ccu_serdes_dtm, 
  ccu_cmp_io_sync_en, 
  ccu_io_cmp_sync_en, 
  ccu_io_out, 
  gclk, 
  tcu_div_bypass, 
  tcu_atpg_mode, 
  ncu_dbg1_error_event, 
  ncu_dbg1_stall, 
  ncu_dbg1_vld, 
  ncu_dbg1_data, 
  dbg1_ncu_stall, 
  dbg1_ncu_vld, 
  dbg1_ncu_data) ;
wire [63:0] core_running;
wire [63:0] core_running_status;
wire [7:0] coreavail;
wire aclk_io;
wire bclk_io;
wire pce_ov;
wire aclk_wmr;
wire wmr_protect;
wire array_wr_inhibit_io;
wire clkgen_io_scanin;
wire wmr_unused_io;
wire por_unused_io;
wire aclk_cmp;
wire bclk_cmp;
wire clkgen_cmp_scanout;
wire pce_ov1;
wire aclk_wmr_unused;
wire cmp_io_sync_en;
wire io_cmp_sync_en;
wire wmr_protect_unused;
wire array_wr_inhibit_cmp;
wire clkgen_cmp_scanin;
wire wmr_unused_cmp;
wire por_unused_cmp;
wire [71:0] mondo_data0_dout;
wire ncu_mondo0_rf_cust_scanout;
wire mondo_data0_wr;
wire mondo_rd_en;
wire [5:0] mondo_data_addr_p1;
wire [5:0] mondo_data_addr_p0;
wire [71:0] mondo_data0_din;
wire [71:0] mondo_data1_dout;
wire ncu_mondo1_rf_cust_scanin;
wire ncu_mondo1_rf_cust_scanout;
wire mondo_data1_wr;
wire [71:0] mondo_data1_din;
wire [143:0] cpubuf_dout;
wire ncu_cpu_buf_rf_cust_scanin;
wire ncu_cpu_buf_rf_cust_scanout;
wire cpubuf_wr;
wire cpubuf_rden;
wire [4:0] cpubuf_tail_ptr;
wire [4:0] cpubuf_head_ptr;
wire [143:0] cpubuf_din;
wire array_wr_inhibit_gate;
wire mb1_run;
wire [175:0] iobuf_dout;
wire ncu_iobuf0_rf_cust_scanin;
wire ncu_iobuf0_rf_cust_scanout;
wire iobuf_wr;
wire iobuf_rden;
wire [4:0] iobuf_tail_ptr;
wire [4:0] iobuf_head_ptr;
wire [175:0] iobuf_din;
wire mb0_run;
wire ncu_iobuf1_rf_cust_scanin;
wire ncu_iobuf1_rf_cust_scanout;
wire [143:0] intbuf_dout;
wire ncu_intbuf_rf_cust_scanin;
wire ncu_intbuf_rf_cust_scanout;
wire intbuf_wr;
wire intbuf_rden;
wire [4:0] intbuf_tail_ptr;
wire [4:0] intbuf_head_ptr;
wire [143:0] intbuf_din;
wire [5:0] cpubuf_tail_f;
wire [5:0] iobuf_head_f;
wire [63:0] mondo_busy_vec_f;
wire tap_mondo_acc_addr_invld_d2_f;
wire tap_mondo_acc_seq_d2_f;
wire [63:0] tap_mondo_dout_d2_f;
wire ncu_fcd_ctl_scanout;
wire [5:0] mb0_addr;
wire [7:0] mb0_wdata;
wire mb0_iobuf_wr_en;
wire iobuf_ue_f;
wire intbuf_ue_f;
wire mondotbl_pe_f;
wire mb0_scanout;
wire [7:0] mb1_wdata;
wire mb1_cpubuf_wr_en;
wire [6:0] mb1_addr;
wire [5:0] cpubuf_head_s;
wire [5:0] iobuf_tail_s;
wire [63:0] io_mondo_data0_din_s;
wire [63:0] io_mondo_data1_din_s;
wire [5:0] io_mondo_data_wr_addr_s;
wire io_mondo_data_wr_s;
wire ncu_fcd_ctl_scanin;
wire [21:0] tap_mondo_acc_addr_s;
wire tap_mondo_acc_seq_s;
wire [63:0] tap_mondo_din_s;
wire tap_mondo_wr_s;
wire [7:0] cpubuf_mb0_data;
wire iobuf_uei;
wire intbuf_uei;
wire mondotbl_pei;
wire [6:0] intman_tbl_raddr;
wire [6:0] intman_tbl_waddr;
wire [15:0] intman_tbl_din;
wire intman_tbl_rden;
wire intman_tbl_wr;
wire [3:0] ncu_ssi_data;
wire ncu_ssi_stall;
wire ncu_ssi_vld;
wire [143:0] dmubuf_din;
wire [4:0] dmubuf_raddr;
wire [4:0] dmubuf_waddr;
wire dmubuf0_wr;
wire dmubuf1_wr;
wire dmubuf_rden;
wire ncu_tcu_soc_error;
wire [1:0] ncu_scksel;
wire [15:0] intman_tbl_dout;
wire ncu_scd_ctl_scanin;
wire ncu_scd_ctl_scanout;
wire [3:0] ssi_ncu_data;
wire ssi_ncu_stall;
wire ssi_ncu_vld;
wire [143:0] dmubuf0_dout;
wire [143:0] dmubuf1_dout;
wire ncu_intman_rf_cust_scanin;
wire ncu_intman_rf_cust_scanout;
wire ncu_dmubuf0_rf_cust_scanin;
wire ncu_dmubuf0_rf_cust_scanout;
wire ncu_dmubuf1_rf_cust_scanin;
wire ncu_dmubuf1_rf_cust_scanout;
wire ncu_ssitop_ctl_scanin;
wire ncu_ssitop_ctl_scanout;
wire cmp_slow_sync_en;
wire slow_cmp_sync_en;
wire [1:0] ncu_dmu_dpar;




input			scan_in;
input			tcu_scan_en;
output			scan_out;
//input			tcu_clk_stop;
input			tcu_ncu_io_clk_stop;
//input			tcu_soc4cmp_clk_stop;
input			tcu_ncu_clk_stop;
input			tcu_se_scancollar_in;
input			tcu_se_scancollar_out;
input			tcu_array_wr_inhibit;
input			tcu_pce_ov;
input			tcu_aclk;
input			tcu_bclk;

input			tcu_dbr_gateoff;
input [1:0]		tcu_ncu_mbist_start ;
output [1:0]		ncu_tcu_mbist_done ;
output [1:0]		ncu_tcu_mbist_fail ;
input			tcu_ncu_mbist_scan_in ;
output			ncu_tcu_mbist_scan_out ;
input			tcu_mbist_user_mode;
input			tcu_mbist_bisi_en;

output			ncu_pcx_stall_pq;	// PINDEF:RIGHT
input [129:0]		pcx_ncu_data_px2;	// PINDEF:RIGHT
input			pcx_ncu_data_rdy_px1;	// PINDEF:RIGHT

output [145:0]		ncu_cpx_data_ca;	// PINDEF:RIGHT
output [7:0]		ncu_cpx_req_cq;		// PINDEF:RIGHT
input [7:0]		cpx_ncu_grant_cx;	// PINDEF:RIGHT


output [63:0]		ncu_dmu_pio_data;	// PINDEF:RIGHT
output			ncu_dmu_pio_hdr_vld;	// PINDEF:RIGHT
output			ncu_dmu_mmu_addr_vld;	// PINDEF:RIGHT

input			dmu_ncu_wrack_vld;	// PINDEF:RIGHT
input [3:0]		dmu_ncu_wrack_tag;	// PINDEF:RIGHT

output			ncu_dmu_mondo_ack;	// PINDEF:RIGHT
output			ncu_dmu_mondo_nack;	// PINDEF:RIGHT
output [5:0]		ncu_dmu_mondo_id;	// PINDEF:RIGHT


output			ncu_dmu_vld;		// PINDEF:RIGHT
output [31:0]		ncu_dmu_data;		// PINDEF:RIGHT
input			dmu_ncu_stall;		// PINDEF:RIGHT
input			dmu_ncu_vld;		// PINDEF:RIGHT
input [31:0]		dmu_ncu_data;		// PINDEF:RIGHT
output			ncu_dmu_stall;		// PINDEF:RIGHT

output			ncu_ccu_vld;		// From c2i of c2i.v
output [3:0]		ncu_ccu_data;		// From c2i of c2i.v
input [3:0]		ccu_ncu_data;		// To i2c of i2c.v
input			ccu_ncu_vld;		// To i2c of i2c.v
input			ccu_ncu_stall;		// To c2i of c2i.v
output			ncu_ccu_stall;		// From i2c of i2c.v

output			ncu_mcu0_vld;		// From c2i of c2i.v
output [3:0]		ncu_mcu0_data;		// From c2i of c2i.v
input			mcu0_ncu_stall;		// To c2i of c2i.v
input			mcu0_ncu_vld;		// To i2c of i2c.v
input [3:0]		mcu0_ncu_data;		// To i2c of i2c.v
output			ncu_mcu0_stall;		// From i2c of i2c.v

output			ncu_mcu1_vld;		// From c2i of c2i.v
output [3:0]		ncu_mcu1_data;		// From c2i of c2i.v
input			mcu1_ncu_stall;		// To c2i of c2i.v
input			mcu1_ncu_vld;		// To i2c of i2c.v
input [3:0]		mcu1_ncu_data;		// To i2c of i2c.v
output			ncu_mcu1_stall;		// From i2c of i2c.v

output			ncu_mcu2_vld;		// From c2i of c2i.v
output [3:0]		ncu_mcu2_data;		// From c2i of c2i.v
input			mcu2_ncu_stall;		// To c2i of c2i.v
input			mcu2_ncu_vld;		// To i2c of i2c.v
input [3:0]		mcu2_ncu_data;		// To i2c of i2c.v
output			ncu_mcu2_stall;		// From i2c of i2c.v

output			ncu_mcu3_vld;		// From c2i of c2i.v
output [3:0]		ncu_mcu3_data;		// From c2i of c2i.v
input			mcu3_ncu_stall;		// To c2i of c2i.v
input			mcu3_ncu_vld;		// To i2c of i2c.v
input [3:0]		mcu3_ncu_data;		// To i2c of i2c.v
output			ncu_mcu3_stall;		// From i2c of i2c.v

output			ncu_niu_vld;		// PINDEF:BOT
output [31:0]		ncu_niu_data;		// PINDEF:BOT
input			niu_ncu_stall;		// PINDEF:BOT
input			niu_ncu_vld;		// PINDEF:BOT
input [31:0]		niu_ncu_data;		// PINDEF:BOT
output			ncu_niu_stall;		// PINDEF:BOT

output			ncu_tcu_vld;		// From i2c of i2c.v
output [7:0]		ncu_tcu_data;		// From i2c of i2c.v
input			tcu_ncu_stall;		// To i2c of i2c.v
input			tcu_ncu_vld;		// To c2i of c2i.v
input [7:0]		tcu_ncu_data;		// To c2i of c2i.v
output			ncu_tcu_stall;		// From c2i of c2i.v

output			ncu_mio_ssi_mosi;
output			ncu_mio_ssi_sck;
input			mio_ncu_ssi_miso;
input			mio_ncu_ext_int_l;

output			ncu_rst_vld;		// From c2i of c2i.v
output [3:0]		ncu_rst_data;		// From c2i of c2i.v
input			rst_ncu_stall;		// To c2i of c2i.v
input			rst_ncu_vld;		// To i2c of i2c.v
input [3:0]		rst_ncu_data;		// To i2c of i2c.v
output			ncu_rst_stall;		// From i2c of i2c.v

//input			efu_ncu_fuse_clk1;
input			efu_ncu_fuse_data;	

//input			efu_ncu_coreavail_dshift;
//input			efu_ncu_bankavail_dshift;
//input			efu_ncu_fusestat_dshift;
//input			efu_ncu_sernum0_dshift;
//input			efu_ncu_sernum1_dshift;
//input			efu_ncu_sernum2_dshift;

input 			efu_ncu_srlnum0_xfer_en;
input                   efu_ncu_srlnum1_xfer_en;
input                   efu_ncu_srlnum2_xfer_en;
input 			efu_ncu_fusestat_xfer_en;
input			efu_ncu_coreavl_xfer_en;
input			efu_ncu_bankavl_xfer_en;

input			sii_ncu_req;		// PINDEF:RIGHT
output			ncu_sii_gnt;		// PINDEF:RIGHT
input [31:0]		sii_ncu_data;		// PINDEF:RIGHT


//// ASI related input
input			rst_ncu_unpark_thread;
input			rst_ncu_xir_;
output			ncu_rst_xir_done;

output			ncu_cmp_tick_enable;	// goes to SPC
//output			cmp_tick_enable;
//output 			tcu_wmr_vec_mask;	// this signal should have been named as ncu_wmr_vec_mask; goes to SPC
output 			ncu_wmr_vec_mask;

output			ncu_spc0_core_available ;
output			ncu_spc1_core_available ;
output			ncu_spc2_core_available ;
output			ncu_spc3_core_available ;
output			ncu_spc4_core_available ;
output			ncu_spc5_core_available ;
output			ncu_spc6_core_available ;
output			ncu_spc7_core_available ;

output 			ncu_spc0_core_enable_status;
output 			ncu_spc1_core_enable_status;
output 			ncu_spc2_core_enable_status;
output 			ncu_spc3_core_enable_status;
output 			ncu_spc4_core_enable_status;
output 			ncu_spc5_core_enable_status;
output 			ncu_spc6_core_enable_status;
output 			ncu_spc7_core_enable_status;

output [7:0]		ncu_spc0_core_running;
output [7:0]		ncu_spc1_core_running;
output [7:0]		ncu_spc2_core_running;
output [7:0]		ncu_spc3_core_running;
output [7:0]		ncu_spc4_core_running;
output [7:0]		ncu_spc5_core_running;
output [7:0]		ncu_spc6_core_running;
output [7:0]		ncu_spc7_core_running;

input [7:0]		spc0_ncu_core_running_status;
input [7:0]		spc1_ncu_core_running_status;
input [7:0]		spc2_ncu_core_running_status;
input [7:0]		spc3_ncu_core_running_status;
input [7:0]		spc4_ncu_core_running_status;
input [7:0]		spc5_ncu_core_running_status;
input [7:0]		spc6_ncu_core_running_status;
input [7:0]		spc7_ncu_core_running_status;

//// core gasket ////
output			ncu_spc_pm  ;  
output			ncu_spc_ba01;
output			ncu_spc_ba23;
output			ncu_spc_ba45;
output			ncu_spc_ba67;
output			ncu_spc_l2_idx_hash_en;
//// sii ////
output			ncu_sii_pm  ;
output			ncu_sii_ba01;
output			ncu_sii_ba23;
output			ncu_sii_ba45;
output			ncu_sii_ba67;
output			ncu_sii_l2_idx_hash_en;
//// l2t ////
output			ncu_l2t_pm  ;
output			ncu_l2t_ba01;
output			ncu_l2t_ba23;
output			ncu_l2t_ba45;
output			ncu_l2t_ba67;
//// mcu ////
output			ncu_mcu_pm  ;
output			ncu_mcu_ba01;
output			ncu_mcu_ba23;
output			ncu_mcu_ba45;
output			ncu_mcu_ba67;


//// RAS ////
//input [5:0]	vcid;
output		ncu_rst_fatal_error;
//output		ncu_tcu_soc_error;
output [7:0]    ncu_tcu_bank_avail;

input [1:0]	sii_ncu_dparity;

input		sii_ncu_niuctag_ue;
output		ncu_sii_niuctag_uei;
input		sii_ncu_niuctag_ce;
output		ncu_sii_niuctag_cei;
input		sii_ncu_niua_pe;
output		ncu_sii_niua_pei;
input		sii_ncu_niud_pe;
output		ncu_sii_niud_pei;
input		sii_ncu_dmuctag_ue;
output		ncu_sii_dmuctag_uei;
input		sii_ncu_dmuctag_ce;
output		ncu_sii_dmuctag_cei;
input		sii_ncu_dmua_pe;
output		ncu_sii_dmua_pei;
input		sii_ncu_dmud_pe;
output		ncu_sii_dmud_pei;

input		sii_ncu_syn_vld;
input [3:0]	sii_ncu_syn_data; 
input		tcu_sck_bypass;

//// sio ////
input		sio_ncu_ctag_ce;
output		ncu_sio_ctag_cei;
input		sio_ncu_ctag_ue;
output		ncu_sio_ctag_uei;
//input		sio_ncu_d_pe;
output		ncu_sio_d_pei;

//// niu ////
input		niu_ncu_ctag_ue;
output		ncu_niu_ctag_uei;
input		niu_ncu_ctag_ce;
output		ncu_niu_ctag_cei;
input		niu_ncu_d_pe;
output		ncu_niu_d_pei;

//// dmu ////
input		dmu_ncu_wrack_par; //// going nowhere for now ////
output		ncu_dmu_mondo_id_par;

input		dmu_ncu_d_pe;
output		ncu_dmu_d_pei;
input		dmu_ncu_siicr_pe;
output		ncu_dmu_siicr_pei;
input		dmu_ncu_ctag_ue;
output		ncu_dmu_ctag_uei;
input		dmu_ncu_ctag_ce;
output		ncu_dmu_ctag_cei;
input		dmu_ncu_ncucr_pe;
output		ncu_dmu_ncucr_pei;
input		dmu_ncu_ie;
output		ncu_dmu_iei;

//// mcu's ////
input		mcu0_ncu_ecc;
output		ncu_mcu0_ecci;
input		mcu0_ncu_fbr;
output		ncu_mcu0_fbri;
//input		mcu0_ncu_fbu;
output		ncu_mcu0_fbui;

input		mcu1_ncu_ecc;
output		ncu_mcu1_ecci;
input		mcu1_ncu_fbr;
output		ncu_mcu1_fbri;
//input		mcu1_ncu_fbu;
output		ncu_mcu1_fbui;

input		mcu2_ncu_ecc;
output		ncu_mcu2_ecci;
input		mcu2_ncu_fbr;
output		ncu_mcu2_fbri;
//input		mcu2_ncu_fbu;
output		ncu_mcu2_fbui;

input		mcu3_ncu_ecc;
output		ncu_mcu3_ecci;
input		mcu3_ncu_fbr;
output		ncu_mcu3_fbri;
//input		mcu3_ncu_fbu;
output		ncu_mcu3_fbui;

// new cluster header, io2clock begins

input   rst_wmr_protect;
input   cluster_arst_l;
input   ccu_serdes_dtm;
input   ccu_cmp_io_sync_en;
input   ccu_io_cmp_sync_en;
input   ccu_io_out;

input   gclk;                   // global clk - this is either cmp or dr
input   tcu_div_bypass;
input   tcu_atpg_mode;

// end io2clk cluster


output           ncu_dbg1_error_event;    //An Error event occurred in NCU.
output           ncu_dbg1_stall;          //NCU back Pressure control signal to Dbg1
output           ncu_dbg1_vld;            //NCU to Dbg1 UCB data valid
output  [3:0]    ncu_dbg1_data;           //NCU to Dbg1 UCB data bus
input          dbg1_ncu_stall;          //Dbg1 back pressure control signal to NCU
input          dbg1_ncu_vld;            //Dbg1 to NCU UCB data valid
input [3:0]    dbg1_ncu_data;           //Dbg1 to NCU UCB data


wire			iol2clk;
wire			l2clk;


//assign ncu_dbg1_error_event = 0;
//assign ncu_dbg1_stall = 0;
//assign ncu_dbg1_vld = 0;
//assign ncu_dbg1_data = 0;

/////////////////////////////////////
//assign		rng_ncu_data[3:0]=4'b0;
//assign		rng_ncu_vld=1'b0;
//assign		rng_ncu_stall=1'b0;

//assign	ncu_tcu_mbist_done[1:0]=2'b0 ;
//assign	ncu_tcu_mbist_fail[1:0]=2'b0 ;
//assign	ncu_tcu_mbist_scan_out=1'b0;
/////////////////////////////////////
/*autowire*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics


//========== ASI port reassignment ==============//
//assign  cmp_tick_enable = 1'b1;
//assign  tcu_wmr_vec_mask = 1'b0;

//assign	ncu_spc0_core_enable_status = core_enable_status[0] ;
//assign	ncu_spc1_core_enable_status = core_enable_status[1] ;
//assign	ncu_spc2_core_enable_status = core_enable_status[2] ;
//assign	ncu_spc3_core_enable_status = core_enable_status[3] ;
//assign	ncu_spc4_core_enable_status = core_enable_status[4] ;
//assign	ncu_spc5_core_enable_status = core_enable_status[5] ;
//assign	ncu_spc6_core_enable_status = core_enable_status[6] ;
//assign	ncu_spc7_core_enable_status = core_enable_status[7] ;

assign	ncu_spc0_core_running[7:0] = core_running[7:0]   ;
assign	ncu_spc1_core_running[7:0] = core_running[15:8]  ;
assign	ncu_spc2_core_running[7:0] = core_running[23:16] ;
assign	ncu_spc3_core_running[7:0] = core_running[31:24] ;
assign	ncu_spc4_core_running[7:0] = core_running[39:32] ;
assign	ncu_spc5_core_running[7:0] = core_running[47:40] ;
assign	ncu_spc6_core_running[7:0] = core_running[55:48] ;
assign	ncu_spc7_core_running[7:0] = core_running[63:56] ;

assign	core_running_status[63:0] = { 	spc7_ncu_core_running_status[7:0],
					spc6_ncu_core_running_status[7:0],
					spc5_ncu_core_running_status[7:0],
					spc4_ncu_core_running_status[7:0],
					spc3_ncu_core_running_status[7:0],
					spc2_ncu_core_running_status[7:0],
					spc1_ncu_core_running_status[7:0],
					spc0_ncu_core_running_status[7:0] } ;

assign	{ ncu_spc7_core_available,
	  ncu_spc6_core_available,
	  ncu_spc5_core_available,
	  ncu_spc4_core_available,
	  ncu_spc3_core_available,
	  ncu_spc2_core_available,
	  ncu_spc1_core_available,
	  ncu_spc0_core_available } = coreavail[7:0] ;

//// gasket ////
//assign	ncu_spc_pm    = l2pm[4];
//assign	ncu_spc_ba67  = l2pm[3];
//assign	ncu_spc_ba45  = l2pm[2];
//assign	ncu_spc_ba23  = l2pm[1];
//assign	ncu_spc_ba01  = l2pm[0];
//assign	ncu_spc_l2_idx_hash_en = l2idxhs_en_status;
//// sii ////
//assign	ncu_sii_pm    = l2pm[4];
//assign	ncu_sii_ba67  = l2pm[3];
//assign	ncu_sii_ba45  = l2pm[2];
//assign	ncu_sii_ba23  = l2pm[1];
//assign	ncu_sii_ba01  = l2pm[0];
//assign	ncu_sii_l2_idx_hash_en = l2idxhs_en_status;
//// l2t ////
//assign	ncu_l2t_pm    = l2pm[4];
//assign	ncu_l2t_ba67  = l2pm[3];
//assign	ncu_l2t_ba45  = l2pm[2];
//assign	ncu_l2t_ba23  = l2pm[1];
//assign	ncu_l2t_ba01  = l2pm[0];
//// mcu ////
//assign	ncu_mcu_pm    = l2pm[4];
//assign	ncu_mcu_ba67  = l2pm[3];
//assign	ncu_mcu_ba45  = l2pm[2];
//assign	ncu_mcu_ba23  = l2pm[1];
//assign	ncu_mcu_ba01  = l2pm[0];




clkgen_ncu_io clkgen_ncu_io (
  // outputs
        .l2clk(iol2clk),
        .aclk(aclk_io),
        .bclk(bclk_io),
        .scan_out(scan_out),
        .pce_ov(pce_ov),
	.aclk_wmr(aclk_wmr),
        .wmr_protect(wmr_protect),
	.array_wr_inhibit(array_wr_inhibit_io),
  // inputs
  	.tcu_wr_inhibit(tcu_array_wr_inhibit),
  	.tcu_atpg_mode(tcu_atpg_mode),
        .tcu_clk_stop(tcu_ncu_io_clk_stop),
        .tcu_pce_ov(tcu_pce_ov),
        .rst_wmr_protect(rst_wmr_protect),
        .rst_wmr_(1'b0),
        .rst_por_(1'b0),
        .ccu_cmp_slow_sync_en(1'b0),
        .ccu_slow_cmp_sync_en(1'b0),
        .tcu_div_bypass(tcu_div_bypass),
        .ccu_div_ph(ccu_io_out),
        .cluster_div_en(1'b1),
        .gclk(gclk),
	.cluster_arst_l(cluster_arst_l),
        .clk_ext(1'b0),
	.ccu_serdes_dtm(ccu_serdes_dtm),
        .tcu_aclk(tcu_aclk),
        .tcu_bclk(tcu_bclk),
        .scan_en(tcu_scan_en),
        .scan_in(clkgen_io_scanin),
	.wmr_(wmr_unused_io),
	.por_(por_unused_io),
  .cmp_slow_sync_en(cmp_slow_sync_en),
  .slow_cmp_sync_en(slow_cmp_sync_en)
);

clkgen_ncu_cmp clkgen_ncu_cmp (
  // output
        .l2clk(l2clk),
        .aclk(aclk_cmp),
        .bclk(bclk_cmp),
        .scan_out(clkgen_cmp_scanout),
        .pce_ov(pce_ov1),
        .aclk_wmr(aclk_wmr_unused),
        .cmp_slow_sync_en(cmp_io_sync_en),
        .slow_cmp_sync_en(io_cmp_sync_en),
	.wmr_protect(wmr_protect_unused),
        .array_wr_inhibit(array_wr_inhibit_cmp),
  // inputs
        .tcu_wr_inhibit(tcu_array_wr_inhibit),
        .tcu_atpg_mode(tcu_atpg_mode),
        .tcu_clk_stop(tcu_ncu_clk_stop),
        .tcu_pce_ov(tcu_pce_ov),
        .rst_wmr_protect(rst_wmr_protect),
        .rst_wmr_(1'b0),
        .rst_por_(1'b0),
	.ccu_cmp_slow_sync_en(ccu_cmp_io_sync_en),
        .ccu_slow_cmp_sync_en(ccu_io_cmp_sync_en),
        .tcu_div_bypass(tcu_div_bypass),
        .ccu_div_ph(1'b1),
        .cluster_div_en(1'b0),
        .gclk(gclk),
	.cluster_arst_l(cluster_arst_l),
        .clk_ext(1'b0),
	.ccu_serdes_dtm(ccu_serdes_dtm),
        .tcu_aclk(tcu_aclk),
        .tcu_bclk(tcu_bclk),
        .scan_en(tcu_scan_en),
        .scan_in(clkgen_cmp_scanin),
	.wmr_(wmr_unused_cmp),
	.por_(por_unused_cmp)
);



/*** mondo data0 mem ***/
///* ncu_rf_cust auto_template (
//		.scan_out( ),
//	       .wr_adr	(mondo_data_addr_p1[5:0]),
//	       .din	(mondo_data0_din[71:0]),
//	       .wr_en	(mondo_data0_wr),
//	       .wrclk	(l2clk),
//	       .rdclk	(l2clk),
//	       .rd_en	(1'b1),
//       	       .rd_adr      (mondo_data_addr_p0[5:0]),
//	       .dout	(mondo_data0_dout[71:0]) ); */
n2_com_dp_64x72_cust ncu_mondo0_rf_cust  ( /*autoinst*/
					    // Outputs
					    .dout(mondo_data0_dout[71:0]), // Templated
					    // Inputs
					    //.scan_in(ncu_mondo0_rf_cust_scanin),
					    .scan_in(scan_in),
					    .scan_out(ncu_mondo0_rf_cust_scanout),
					    .wrclk(l2clk),	 // Templated
					    .rdclk(l2clk),	 // Templated
					    .wr_en(mondo_data0_wr), // Templated
					    .rd_en(mondo_rd_en),	 // Templated
					    .wr_adr(mondo_data_addr_p1[5:0]), // Templated
					    .rd_adr(mondo_data_addr_p0[5:0]), // Templated
					    .din(mondo_data0_din[71:0]), // Templated
					    .tcu_se_scancollar_in(tcu_se_scancollar_in),
					    .tcu_se_scancollar_out(tcu_se_scancollar_out),
					    .tcu_array_wr_inhibit(array_wr_inhibit_cmp),
					    //.tcu_aclk(tcu_aclk),
					    //.tcu_bclk(tcu_bclk),
					    .tcu_aclk(aclk_cmp),
					    .tcu_bclk(bclk_cmp),
					    .tcu_pce_ov(pce_ov1),
					    //.tcu_wrclk_stop(1'b0),
					    //.tcu_rdclk_stop(1'b0));
					     .bist_clk_mux_sel(1'b0),
					     .rd_pce(1'b1),
					     .wr_pce(1'b1));



/*** mondo data1 mem ***/
///* ncu_rf_cust auto_template (
//		.scan_out( ),
//	       .din	(mondo_data1_din[71:0]),
//	       .wr_en	(mondo_data1_wr),
//	       .wrclk	(ol2clk),
//	       .rdclk	(l2clk),
//	       .rd_en	(1'b1),
//       	       .rd_adr      (mondo_data_addr_p0[5:0]),
//	       .dout	(mondo_data1_dout[71:0]) ); */
n2_com_dp_64x72_cust ncu_mondo1_rf_cust  ( /*autoinst*/
					    // Outputs
					    .dout(mondo_data1_dout[71:0]), // Templated
					    // Inputs
					    .scan_in(ncu_mondo1_rf_cust_scanin),
					    .scan_out(ncu_mondo1_rf_cust_scanout),
					    .wrclk(l2clk),	 // Templated
					    .rdclk(l2clk),	 // Templated
					    .wr_en(mondo_data1_wr), // Templated
					    .rd_en(mondo_rd_en),	 // Templated
					    .wr_adr(mondo_data_addr_p1[5:0]), // Templated
					    .rd_adr(mondo_data_addr_p0[5:0]), // Templated
					    .din(mondo_data1_din[71:0]), // Templated
					    .tcu_se_scancollar_in(tcu_se_scancollar_in),
					    .tcu_se_scancollar_out(tcu_se_scancollar_out),
					    .tcu_array_wr_inhibit(array_wr_inhibit_cmp),
					 //   .tcu_aclk(tcu_aclk),
					 //   .tcu_bclk(tcu_bclk),
					    .tcu_aclk(aclk_cmp),
					    .tcu_bclk(bclk_cmp),
					    .tcu_pce_ov(pce_ov1),
					    //.tcu_wrclk_stop(1'b0),
					    //.tcu_rdclk_stop(1'b0));
					     .bist_clk_mux_sel(1'b0),
					     .rd_pce(1'b1),
					     .wr_pce(1'b1));
				    	    //.tcu_wrclk_stop(cmp_clk_stop),
					    //.tcu_rdclk_stop(cmp_clk_stop));



/*** cpu_buf mem ***/
/* 
//  ncu_rf_cust auto_template (
//		.scan_out( ),
//	       .wr_adr	(cpubuf_tail_ptr[4:0]),
//	       .din	(cpubuf_din[143:0]),
//	       .wr_en	(cpubuf_wr),
//	       .wrclk	(l2clk),
//	       .rdclk	(iol2clk),
//	       .rd_en	(cpubuf_rden),
//	       .dout	(cpubuf_dout[143:0]), 
//       	       .rd_adr  (cpubuf_head_ptr[4:0]) );
       */
n2_com_dp_32x144s_cust ncu_cpu_buf_rf_cust  ( /*autoinst*/
					      // Outputs
					      .dout(cpubuf_dout[143:0]), // Templated
					      // Inputs
					      .scan_in(ncu_cpu_buf_rf_cust_scanin),
					      .scan_out(ncu_cpu_buf_rf_cust_scanout),
					      .wrclk(l2clk),	 // Templated
					      .rdclk(iol2clk),	 // Templated
					      .wr_en(cpubuf_wr), // Templated
					      .rd_en(cpubuf_rden), // Templated
					      .wr_adr(cpubuf_tail_ptr[4:0]), // Templated
					      .rd_adr(cpubuf_head_ptr[4:0]), // Templated
					      .din(cpubuf_din[143:0]), // Templated
					      .tcu_se_scancollar_in(tcu_se_scancollar_in),
					      .tcu_se_scancollar_out(tcu_se_scancollar_out),
					      .tcu_array_wr_inhibit(array_wr_inhibit_gate),
					      .tcu_aclk(aclk_io),
					      .tcu_bclk(bclk_io),
					      .tcu_pce_ov(pce_ov),
					     .bist_clk_mux_sel(mb1_run),
					     .rd_pce(1'b1),
					     .wr_pce(1'b1));




/*** io_buf mem ***/
///* ncu_rf_cust auto_template (
//		.scan_out( ),
//	       .wr_adr	(iobuf_tail_ptr[4:0]),
//	       .din	(iobuf_din[143:0]),
//	       .wr_en	(iobuf_wr),
//	       .wrclk	(iol2clk),
//	       .rdclk	(l2clk),
//	       .rd_en	(iobuf_rden),
//       	       .rd_adr      (iobuf_head_ptr[4:0]),
//	       .dout	(iobuf_dout[143:0]) ); */
n2_com_dp_32x144_cust ncu_iobuf0_rf_cust  ( /*autoinst*/
					     // Outputs
					     .dout(iobuf_dout[143:0]), // Templated
					     // Inputs
					     .scan_in(ncu_iobuf0_rf_cust_scanin),
					     .scan_out(ncu_iobuf0_rf_cust_scanout),
					     .wrclk(iol2clk),	 // Templated
					     .rdclk(l2clk),	 // Templated
					     .wr_en(iobuf_wr),	 // Templated
					     .rd_en(iobuf_rden), // Templated
					     .wr_adr(iobuf_tail_ptr[4:0]), // Templated
					     .rd_adr(iobuf_head_ptr[4:0]), // Templated
					     .din(iobuf_din[143:0]), // Templated
					     .tcu_se_scancollar_in(tcu_se_scancollar_in),
					     .tcu_se_scancollar_out(tcu_se_scancollar_out),
					     .tcu_array_wr_inhibit(array_wr_inhibit_gate),
					     .tcu_aclk(aclk_cmp),
					     .tcu_bclk(bclk_cmp),
					     .tcu_pce_ov(pce_ov1),
					     .bist_clk_mux_sel(mb0_run),
					     .rd_pce(1'b1),
					     .wr_pce(1'b1));
					     //.tcu_wrclk_stop(io_clk_stop),
					     //.tcu_rdclk_stop(cmp_clk_stop));
 					     //.tcu_wrclk_stop(1'b0),
					     //.tcu_rdclk_stop(1'b0));
				      

/*** io_buf1 mem ***/
///* ncu_rf_cust auto_template (
//		.scan_out( ),
//	       .wr_adr	(iobuf_tail_ptr[4:0]),
//	       .din	(iobuf_din[175:144]),
//	       .wr_en	(iobuf_wr),
//	       .wrclk	(iol2clk),
//	       .rdclk	(l2clk),
//	       .rd_en	(iobuf_rden),
//       	       .rd_adr      (iobuf_head_ptr[4:0]),
//	       .dout	(iobuf_dout[175:144]) ); */
n2_com_dp_32x32_cust ncu_iobuf1_rf_cust  ( /*autoinst*/
					    // Outputs
					    .dout(iobuf_dout[175:144]), // Templated
					    // Inputs
					    .scan_in(ncu_iobuf1_rf_cust_scanin),
					    .scan_out(ncu_iobuf1_rf_cust_scanout),
					    .wrclk(iol2clk),	 // Templated
					    .rdclk(l2clk),	 // Templated
					    .wr_en(iobuf_wr),	 // Templated
					    .rd_en(iobuf_rden),	 // Templated
					    .wr_adr(iobuf_tail_ptr[4:0]), // Templated
					    .rd_adr(iobuf_head_ptr[4:0]), // Templated
					    .din(iobuf_din[175:144]), // Templated
					    .tcu_se_scancollar_in(tcu_se_scancollar_in),
					    .tcu_se_scancollar_out(tcu_se_scancollar_out),
					    .tcu_array_wr_inhibit(array_wr_inhibit_gate),
					    .tcu_aclk(aclk_cmp),
					    .tcu_bclk(bclk_cmp),
					    .tcu_pce_ov(pce_ov1),
					     .bist_clk_mux_sel(mb0_run),
					     .rd_pce(1'b1),
					     .wr_pce(1'b1));
					    //.tcu_wrclk_stop(1'b0),
					    //.tcu_rdclk_stop(1'b0));
				    	    //.tcu_wrclk_stop(io_clk_stop),
					    //.tcu_rdclk_stop(cmp_clk_stop));





/*** intbuf mem ***/
///* ncu_rf_cust auto_template (
//		.scan_out( ),
//	       .wr_adr	(intbuf_tail_ptr[4:0]),
//	       .din	(intbuf_din[143:0]),
//	       .wr_en	(intbuf_wr),
//	       .wrclk	(l2clk),
//	       .rdclk	(l2clk),
//	       .rd_en	(intbuf_rden),
//       	       .rd_adr  (intbuf_head_ptr[4:0]),
//	       .dout	(intbuf_dout[143:0]) ); */
n2_com_dp_32x144_cust ncu_intbuf_rf_cust  ( /*autoinst*/
					     // Outputs
					     .dout(intbuf_dout[143:0]), // Templated
					     // Inputs
					     .scan_in(ncu_intbuf_rf_cust_scanin),
					     .scan_out(ncu_intbuf_rf_cust_scanout),
					     .wrclk(l2clk),	 // Templated
					     .rdclk(l2clk),	 // Templated
					     .wr_en(intbuf_wr),	 // Templated
					     .rd_en(intbuf_rden), // Templated
					     .wr_adr(intbuf_tail_ptr[4:0]), // Templated
					     .rd_adr(intbuf_head_ptr[4:0]), // Templated
					     .din(intbuf_din[143:0]), // Templated
					     .tcu_se_scancollar_in(tcu_se_scancollar_in),
					     .tcu_se_scancollar_out(tcu_se_scancollar_out),
					     .tcu_array_wr_inhibit(array_wr_inhibit_cmp),
					     .tcu_aclk(aclk_cmp),
					     .tcu_bclk(bclk_cmp),
					     .tcu_pce_ov(pce_ov1),
					     .bist_clk_mux_sel(1'b0),
					     .rd_pce(1'b1),
					     .wr_pce(1'b1));
					     // .tcu_wrclk_stop(1'b0),
					     // .tcu_rdclk_stop(1'b0));
				      	     // .tcu_wrclk_stop(cmp_clk_stop),
					     // .tcu_rdclk_stop(cmp_clk_stop));




///* ncu_fcd_ctl auto_template ( 
//				.scan_out( ) ); */
ncu_fcd_ctl ncu_fcd_ctl ( /*AUTOINST*/
			 // Outputs
			 .cpubuf_din	(cpubuf_din[143:0]),
			 .cpubuf_tail_f	(cpubuf_tail_f[5:0]),
			 .cpubuf_tail_ptr(cpubuf_tail_ptr[4:0]),
			 .cpubuf_wr	(cpubuf_wr),
			 .intbuf_din	(intbuf_din[143:0]),
			 .intbuf_head_ptr(intbuf_head_ptr[4:0]),
			 .intbuf_tail_ptr(intbuf_tail_ptr[4:0]),
			 .intbuf_wr	(intbuf_wr),
			 .intbuf_rden	(intbuf_rden),
			 .iobuf_head_f	(iobuf_head_f[5:0]),
			 .iobuf_head_ptr(iobuf_head_ptr[4:0]),
			 .iobuf_rden	(iobuf_rden),
			 .mondo_busy_vec_f(mondo_busy_vec_f[63:0]),
			 .mondo_data0_din(mondo_data0_din[71:0]),
			 .mondo_data0_wr(mondo_data0_wr),
			 .mondo_data1_din(mondo_data1_din[71:0]),
			 .mondo_data1_wr(mondo_data1_wr),
			 .mondo_data_addr_p0(mondo_data_addr_p0[5:0]),
			 .mondo_data_addr_p1(mondo_data_addr_p1[5:0]),
			 .mondo_rd_en(mondo_rd_en),
			 .ncu_cpx_data_ca(ncu_cpx_data_ca[145:0]),
			 .ncu_cpx_req_cq(ncu_cpx_req_cq[7:0]),
			 .ncu_pcx_stall_pq(ncu_pcx_stall_pq),
			 .tap_mondo_acc_addr_invld_d2_f(tap_mondo_acc_addr_invld_d2_f),
			 .tap_mondo_acc_seq_d2_f(tap_mondo_acc_seq_d2_f),
			 .tap_mondo_dout_d2_f(tap_mondo_dout_d2_f[63:0]),
			 .scan_out(ncu_fcd_ctl_scanout),
			 .mb0_addr(mb0_addr[5:0]),
			 .mb0_run(mb0_run),
			 .mb0_wdata(mb0_wdata[7:0]),
			 .mb0_iobuf_wr_en(mb0_iobuf_wr_en),
			 .iobuf_ue_f	(iobuf_ue_f),
			 .intbuf_ue_f	(intbuf_ue_f),
			 .mondotbl_pe_f	(mondotbl_pe_f),
			 .mb0_scanout(mb0_scanout),
			 .mb0_done(ncu_tcu_mbist_done[0]),
			 .mb0_fail(ncu_tcu_mbist_fail[0]),
			 .array_wr_inhibit_gate(array_wr_inhibit_gate),
			 // Inputs
			 .array_wr_inhibit_io(array_wr_inhibit_io),
			 .array_wr_inhibit_cmp(array_wr_inhibit_cmp),
			 .mb1_run(mb1_run),
			 .mb1_wdata(mb1_wdata[7:0]),
			 .mb1_cpubuf_wr_en(mb1_cpubuf_wr_en),
			 .mb1_addr(mb1_addr[5:0]),
			 .mb0_scanin(tcu_ncu_mbist_scan_in),
			 .mb0_start(tcu_ncu_mbist_start[0]),
			 .tcu_mbist_user_mode(tcu_mbist_user_mode),
			 .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
			 .cmp_io_sync_en(cmp_io_sync_en),
			 .cpubuf_head_s	(cpubuf_head_s[5:0]),
			 .cpx_ncu_grant_cx(cpx_ncu_grant_cx[7:0]),
			 .intbuf_dout	(intbuf_dout[143:0]),
			 .iobuf_dout	(iobuf_dout[175:0]),
			 .iobuf_tail_s	(iobuf_tail_s[5:0]),
			 .io_cmp_sync_en(io_cmp_sync_en),
			 .io_mondo_data0_din_s(io_mondo_data0_din_s[63:0]),
			 .io_mondo_data1_din_s(io_mondo_data1_din_s[63:0]),
			 .io_mondo_data_wr_addr_s(io_mondo_data_wr_addr_s[5:0]),
			 .io_mondo_data_wr_s(io_mondo_data_wr_s),
                         .l2clk         (l2clk),
			 .mondo_data0_dout(mondo_data0_dout[71:0]),
			 .mondo_data1_dout(mondo_data1_dout[71:0]),
			 .pcx_ncu_data_px2(pcx_ncu_data_px2[129:0]),
			 .pcx_ncu_data_rdy_px1(pcx_ncu_data_rdy_px1),
                         .scan_in(ncu_fcd_ctl_scanin),
			 .tap_mondo_acc_addr_s(tap_mondo_acc_addr_s[21:0]),
			 .tap_mondo_acc_seq_s(tap_mondo_acc_seq_s),
			 .tap_mondo_din_s(tap_mondo_din_s[63:0]),
			 .tap_mondo_wr_s(tap_mondo_wr_s),
			 .tcu_aclk	(aclk_cmp),
			 .tcu_bclk	(bclk_cmp),
			 .tcu_clk_stop	(1'b0),
			 //.tcu_clk_stop	(cmp_clk_stop),
			 .tcu_pce_ov	(pce_ov1),
			 .tcu_scan_en	(tcu_scan_en),
			 .cpubuf_mb0_data(cpubuf_mb0_data[7:0]),
			 .iobuf_uei	(iobuf_uei),
			 .intbuf_uei	(intbuf_uei),
			 .mondotbl_pei	(mondotbl_pei));






///* ncu_scd_ctl auto_template ( 
//	 		   .scan_out( ),
//			 .rcu_ncu_data	(rst_ncu_data[3:0]),
//			 .rcu_ncu_stall	(rst_ncu_stall),
//			 .rcu_ncu_vld	(rst_ncu_vld),
//			 .ncu_rcu_data	(ncu_rst_data[3:0]),
//			 .ncu_rcu_stall	(ncu_rst_stall),
//			 .ncu_rcu_vld	(ncu_rst_vld) ); */
ncu_scd_ctl ncu_scd_ctl ( /*AUTOINST*/
			 // Outputs
			 .cpubuf_mb0_data(cpubuf_mb0_data[7:0]),
			 //.core_enable_status(core_enable_status[7:0]),
			 .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
                         .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
                         .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
                         .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
                         .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
                         .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
                         .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
                         .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
			 .core_running	(core_running[63:0]),
			 .coreavail	(coreavail[7:0]),
			 .cpubuf_head_ptr(cpubuf_head_ptr[4:0]),
			 .cpubuf_head_s	(cpubuf_head_s[5:0]),
			 .cpubuf_rden	(cpubuf_rden),
			 .intman_tbl_raddr(intman_tbl_raddr[6:0]),
			 .intman_tbl_waddr(intman_tbl_waddr[6:0]),
			 .intman_tbl_din(intman_tbl_din[15:0]),
			 .intman_tbl_rden(intman_tbl_rden),
			 .intman_tbl_wr	(intman_tbl_wr),
			 .iobuf_din	(iobuf_din[175:0]),
			 .iobuf_tail_ptr(iobuf_tail_ptr[4:0]),
			 .iobuf_tail_s	(iobuf_tail_s[5:0]),
			 .iobuf_wr	(iobuf_wr),
			 .io_mondo_data0_din_s(io_mondo_data0_din_s[63:0]),
			 .io_mondo_data1_din_s(io_mondo_data1_din_s[63:0]),
			 .io_mondo_data_wr_addr_s(io_mondo_data_wr_addr_s[5:0]),
			 .io_mondo_data_wr_s(io_mondo_data_wr_s),
			 //.l2pm		(l2pm[4:0]),
			 .ncu_spc_pm(ncu_spc_pm)  ,
			 .ncu_spc_ba67(ncu_spc_ba67),
			 .ncu_spc_ba45(ncu_spc_ba45),
			 .ncu_spc_ba23(ncu_spc_ba23),
			 .ncu_spc_ba01(ncu_spc_ba01),
			 .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en),
			 .ncu_sii_pm(ncu_sii_pm),
			 .ncu_sii_ba67(ncu_sii_ba67),
			 .ncu_sii_ba45(ncu_sii_ba45),
			 .ncu_sii_ba23(ncu_sii_ba23),
			 .ncu_sii_ba01(ncu_sii_ba01),
			 .ncu_sii_l2_idx_hash_en(ncu_sii_l2_idx_hash_en),
			 .ncu_l2t_pm(ncu_l2t_pm),
			 .ncu_l2t_ba67(ncu_l2t_ba67),
			 .ncu_l2t_ba45(ncu_l2t_ba45),
			 .ncu_l2t_ba23(ncu_l2t_ba23),
			 .ncu_l2t_ba01(ncu_l2t_ba01),
			 .ncu_mcu_pm (ncu_mcu_pm),
			 .ncu_mcu_ba67(ncu_mcu_ba67),
			 .ncu_mcu_ba45(ncu_mcu_ba45),
			 .ncu_mcu_ba23(ncu_mcu_ba23),
			 .ncu_mcu_ba01(ncu_mcu_ba01),
			 //.l2idxhs_en_status(l2idxhs_en_status),
			 .ncu_ccu_data	(ncu_ccu_data[3:0]),
			 .ncu_ccu_stall	(ncu_ccu_stall),
			 .ncu_ccu_vld	(ncu_ccu_vld),
			 .ncu_dmu_data	(ncu_dmu_data[31:0]),
			 .ncu_dmu_mmu_addr_vld(ncu_dmu_mmu_addr_vld),
			 .ncu_dmu_mondo_ack(ncu_dmu_mondo_ack),
			 .ncu_dmu_mondo_id(ncu_dmu_mondo_id[5:0]),
			 .ncu_dmu_mondo_id_par(ncu_dmu_mondo_id_par),
			 .ncu_dmu_mondo_nack(ncu_dmu_mondo_nack),
			 .ncu_dmu_pio_data(ncu_dmu_pio_data[63:0]),
			 .ncu_dmu_pio_hdr_vld(ncu_dmu_pio_hdr_vld),
			 .ncu_dmu_stall	(ncu_dmu_stall),
			 .ncu_dmu_vld	(ncu_dmu_vld),
			 .ncu_mcu0_data	(ncu_mcu0_data[3:0]),
			 .ncu_mcu0_stall(ncu_mcu0_stall),
			 .ncu_mcu0_vld	(ncu_mcu0_vld),
			 .ncu_mcu1_data	(ncu_mcu1_data[3:0]),
			 .ncu_mcu1_stall(ncu_mcu1_stall),
			 .ncu_mcu1_vld	(ncu_mcu1_vld),
			 .ncu_mcu2_data	(ncu_mcu2_data[3:0]),
			 .ncu_mcu2_stall(ncu_mcu2_stall),
			 .ncu_mcu2_vld	(ncu_mcu2_vld),
			 .ncu_mcu3_data	(ncu_mcu3_data[3:0]),
			 .ncu_mcu3_stall(ncu_mcu3_stall),
			 .ncu_mcu3_vld	(ncu_mcu3_vld),
			 .ncu_niu_data	(ncu_niu_data[31:0]),
			 .ncu_niu_stall	(ncu_niu_stall),
			 .ncu_niu_vld	(ncu_niu_vld),
			 .ncu_rcu_data	(ncu_rst_data[3:0]),	 // Templated
			 .ncu_rcu_stall	(ncu_rst_stall),	 // Templated
			 .ncu_rcu_vld	(ncu_rst_vld),		 // Templated
			 .ncu_dbg1_data	(ncu_dbg1_data[3:0]),
			 .ncu_dbg1_stall	(ncu_dbg1_stall),
			 .ncu_dbg1_vld	(ncu_dbg1_vld),
			 .ncu_rst_xir_done(ncu_rst_xir_done),
			 .ncu_sii_gnt	(ncu_sii_gnt),
			 .ncu_ssi_data	(ncu_ssi_data[3:0]),
			 .ncu_ssi_stall	(ncu_ssi_stall),
			 .ncu_ssi_vld	(ncu_ssi_vld),
			 .ncu_tcu_data	(ncu_tcu_data[7:0]),
			 .ncu_tcu_stall	(ncu_tcu_stall),
			 .ncu_tcu_vld	(ncu_tcu_vld),
			 .tap_mondo_acc_addr_s(tap_mondo_acc_addr_s[21:0]),
			 .tap_mondo_acc_seq_s(tap_mondo_acc_seq_s),
			 .tap_mondo_din_s(tap_mondo_din_s[63:0]),
			 .tap_mondo_wr_s(tap_mondo_wr_s),
			 .dmubuf_din	(dmubuf_din[143:0]),
			 .dmubuf_raddr	(dmubuf_raddr[4:0]),
			 .dmubuf_waddr	(dmubuf_waddr[4:0]),
			 .dmubuf0_wr	(dmubuf0_wr),
			 .dmubuf1_wr	(dmubuf1_wr),
			 .dmubuf_rden	(dmubuf_rden),
			 .ncu_dmu_d_pei	(ncu_dmu_d_pei),
			 .ncu_dmu_siicr_pei(ncu_dmu_siicr_pei),
			 .ncu_dmu_ctag_uei(ncu_dmu_ctag_uei),
			 .ncu_dmu_ctag_cei(ncu_dmu_ctag_cei),
			 .ncu_dmu_ncucr_pei(ncu_dmu_ncucr_pei),
			 .ncu_dmu_iei	(ncu_dmu_iei),
			 .ncu_niu_d_pei	(ncu_niu_d_pei),
			 .ncu_niu_ctag_uei(ncu_niu_ctag_uei),
			 .ncu_niu_ctag_cei(ncu_niu_ctag_cei),
			 .ncu_sio_ctag_cei(ncu_sio_ctag_cei),
			 .ncu_sio_ctag_uei(ncu_sio_ctag_uei),
			 .ncu_sio_d_pei	(ncu_sio_d_pei),
			 .ncu_mcu0_ecci	(ncu_mcu0_ecci),
			 .ncu_mcu0_fbri	(ncu_mcu0_fbri),
			 .ncu_mcu0_fbui	(ncu_mcu0_fbui),
			 .ncu_mcu1_ecci	(ncu_mcu1_ecci),
			 .ncu_mcu1_fbri	(ncu_mcu1_fbri),
			 .ncu_mcu1_fbui	(ncu_mcu1_fbui),
			 .ncu_mcu2_ecci	(ncu_mcu2_ecci),
			 .ncu_mcu2_fbri	(ncu_mcu2_fbri),
			 .ncu_mcu2_fbui	(ncu_mcu2_fbui),
			 .ncu_mcu3_ecci	(ncu_mcu3_ecci),
			 .ncu_mcu3_fbri	(ncu_mcu3_fbri),
			 .ncu_mcu3_fbui	(ncu_mcu3_fbui),
			 .ncu_sii_dmuctag_cei(ncu_sii_dmuctag_cei),
			 .ncu_sii_dmuctag_uei(ncu_sii_dmuctag_uei),
			 .ncu_sii_dmua_pei(ncu_sii_dmua_pei),
			 .ncu_sii_dmud_pei(ncu_sii_dmud_pei),
			 .ncu_sii_niuctag_cei(ncu_sii_niuctag_cei),
			 .ncu_sii_niuctag_uei(ncu_sii_niuctag_uei),
			 .ncu_sii_niua_pei(ncu_sii_niua_pei),
			 .ncu_sii_niud_pei(ncu_sii_niud_pei),
			 .ncu_rst_fatal_error(ncu_rst_fatal_error),
			 .ncu_tcu_soc_error(ncu_tcu_soc_error),
 			 .ncu_tcu_bank_avail(ncu_tcu_bank_avail[7:0]),
			 .iobuf_uei	(iobuf_uei),
			 .intbuf_uei	(intbuf_uei),
			 .mondotbl_pei	(mondotbl_pei),
			 .mb1_scanout(ncu_tcu_mbist_scan_out),
			 .mb1_done(ncu_tcu_mbist_done[1]),
			 .mb1_fail(ncu_tcu_mbist_fail[1]),
			 .mb1_run(mb1_run),
			 .mb1_wdata(mb1_wdata[7:0]),
			 .mb1_cpubuf_wr_en(mb1_cpubuf_wr_en),
			 .mb1_addr(mb1_addr[6:0]),
			 .ncu_scksel(ncu_scksel[1:0]),
			 // Inputs
			 .tcu_dbr_gateoff(tcu_dbr_gateoff),
			 .aclk_wmr(aclk_wmr),
			 .wmr_protect(wmr_protect),
			 .mb0_run(mb0_run),
			 .mb0_wdata(mb0_wdata[7:0]),
			 .mb0_addr(mb0_addr[5:0]),
			 .mb0_iobuf_wr_en(mb0_iobuf_wr_en),
			 .mb1_scanin(mb0_scanout),
			 .mb1_start(tcu_ncu_mbist_start[1]),
			 .tcu_mbist_user_mode(tcu_mbist_user_mode),
			 .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
			 .ccu_ncu_data	(ccu_ncu_data[3:0]),
			 .ccu_ncu_stall	(ccu_ncu_stall),
			 .ccu_ncu_vld	(ccu_ncu_vld),
			 .core_running_status(core_running_status[63:0]),
			 .cpubuf_dout	(cpubuf_dout[143:0]),
			 .cpubuf_tail_f	(cpubuf_tail_f[5:0]),
			 .dmu_ncu_data	(dmu_ncu_data[31:0]),
			 .dmu_ncu_stall	(dmu_ncu_stall),
			 .dmu_ncu_vld	(dmu_ncu_vld),
			 .dmu_ncu_wrack_tag(dmu_ncu_wrack_tag[3:0]),
			 .dmu_ncu_wrack_vld(dmu_ncu_wrack_vld),
			 .dmu_ncu_wrack_par(dmu_ncu_wrack_par),
                         .efu_ncu_bankavail_dshift(efu_ncu_bankavl_xfer_en),
                         .efu_ncu_coreavail_dshift(efu_ncu_coreavl_xfer_en),
			 .efu_ncu_fuse_data(efu_ncu_fuse_data),
			 .efu_ncu_fusestat_dshift(efu_ncu_fusestat_xfer_en),
			 .efu_ncu_sernum0_dshift(efu_ncu_srlnum0_xfer_en),
			 .efu_ncu_sernum1_dshift(efu_ncu_srlnum1_xfer_en),
			 .efu_ncu_sernum2_dshift(efu_ncu_srlnum2_xfer_en),
			 .intman_tbl_dout(intman_tbl_dout[15:0]),
			 .iobuf_head_f	(iobuf_head_f[5:0]),
			 .scan_in(ncu_scd_ctl_scanin),
			 .scan_out(ncu_scd_ctl_scanout),
			 .iol2clk	(iol2clk),
			 .mcu0_ncu_data	(mcu0_ncu_data[3:0]),
			 .mcu0_ncu_stall(mcu0_ncu_stall),
			 .mcu0_ncu_vld	(mcu0_ncu_vld),
			 .mcu1_ncu_data	(mcu1_ncu_data[3:0]),
			 .mcu1_ncu_stall(mcu1_ncu_stall),
			 .mcu1_ncu_vld	(mcu1_ncu_vld),
			 .mcu2_ncu_data	(mcu2_ncu_data[3:0]),
			 .mcu2_ncu_stall(mcu2_ncu_stall),
			 .mcu2_ncu_vld	(mcu2_ncu_vld),
			 .mcu3_ncu_data	(mcu3_ncu_data[3:0]),
			 .mcu3_ncu_stall(mcu3_ncu_stall),
			 .mcu3_ncu_vld	(mcu3_ncu_vld),
			 .mondo_busy_vec_f(mondo_busy_vec_f[63:0]),
			 .niu_ncu_data	(niu_ncu_data[31:0]),
			 .niu_ncu_stall	(niu_ncu_stall),
			 .niu_ncu_vld	(niu_ncu_vld),
			 .rcu_ncu_data	(rst_ncu_data[3:0]),	 // Templated
			 .rcu_ncu_stall	(rst_ncu_stall),	 // Templated
			 .rcu_ncu_vld	(rst_ncu_vld),		 // Templated
			 .dbg1_ncu_data	(dbg1_ncu_data[3:0]),
			 .dbg1_ncu_stall	(dbg1_ncu_stall),
			 .dbg1_ncu_vld	(dbg1_ncu_vld),
			 .rst_ncu_unpark_thread(rst_ncu_unpark_thread),
			 .rst_ncu_xir_	(rst_ncu_xir_),
			 .sii_ncu_data	(sii_ncu_data[31:0]),
			 .sii_ncu_req	(sii_ncu_req),
			 .sii_ncu_dparity(sii_ncu_dparity[1:0]),
			 .ssi_ncu_data	(ssi_ncu_data[3:0]),
			 .ssi_ncu_stall	(ssi_ncu_stall),
			 .ssi_ncu_vld	(ssi_ncu_vld),
			 .tap_mondo_acc_addr_invld_d2_f(tap_mondo_acc_addr_invld_d2_f),
			 .tap_mondo_acc_seq_d2_f(tap_mondo_acc_seq_d2_f),
			 .tap_mondo_dout_d2_f(tap_mondo_dout_d2_f[63:0]),
			 .tcu_clk_stop	(1'b0),
			 //.tcu_clk_stop	(io_clk_stop),
			 .tcu_ncu_data	(tcu_ncu_data[7:0]),
			 .tcu_ncu_stall	(tcu_ncu_stall),
			 .tcu_ncu_vld	(tcu_ncu_vld),
			 .tcu_pce_ov	(pce_ov),
			 .tcu_scan_en	(tcu_scan_en),
			 .tcu_aclk	(aclk_io),
			 .tcu_bclk	(bclk_io),
			 .dmubuf0_dout	(dmubuf0_dout[143:0]),
			 .dmubuf1_dout	(dmubuf1_dout[143:0]),
			 .dmu_ncu_d_pe	(dmu_ncu_d_pe),
			 .dmu_ncu_siicr_pe(dmu_ncu_siicr_pe),
			 .dmu_ncu_ctag_ue(dmu_ncu_ctag_ue),
			 .dmu_ncu_ctag_ce(dmu_ncu_ctag_ce),
			 .dmu_ncu_ncucr_pe(dmu_ncu_ncucr_pe),
			 .dmu_ncu_ie	(dmu_ncu_ie),
			 .niu_ncu_d_pe	(niu_ncu_d_pe),
			 .niu_ncu_ctag_ue(niu_ncu_ctag_ue),
			 .niu_ncu_ctag_ce(niu_ncu_ctag_ce),
			 .sio_ncu_ctag_ce(sio_ncu_ctag_ce),
			 .sio_ncu_ctag_ue(sio_ncu_ctag_ue),
			 //.sio_ncu_d_pe	(sio_ncu_d_pe),
			 .mcu0_ncu_ecc	(mcu0_ncu_ecc),
			 .mcu0_ncu_fbr	(mcu0_ncu_fbr),
			 //.mcu0_ncu_fbu	(mcu0_ncu_fbu),
			 .mcu0_ncu_fbu	(1'b0),
			 .mcu1_ncu_ecc	(mcu1_ncu_ecc),
			 .mcu1_ncu_fbr	(mcu1_ncu_fbr),
			 //.mcu1_ncu_fbu	(mcu1_ncu_fbu),
			 .mcu1_ncu_fbu	(1'b0),
			 .mcu2_ncu_ecc	(mcu2_ncu_ecc),
			 .mcu2_ncu_fbr	(mcu2_ncu_fbr),
			 //.mcu2_ncu_fbu	(mcu2_ncu_fbu),
			 .mcu2_ncu_fbu	(1'b0),
			 .mcu3_ncu_ecc	(mcu3_ncu_ecc),
			 .mcu3_ncu_fbr	(mcu3_ncu_fbr),
			 //.mcu3_ncu_fbu	(mcu3_ncu_fbu),
			 .mcu3_ncu_fbu	(1'b0),
			 .sii_ncu_syn_data(sii_ncu_syn_data[3:0]),
			 .sii_ncu_syn_vld(sii_ncu_syn_vld),
			 .sii_ncu_dmuctag_ce(sii_ncu_dmuctag_ce),
			 .sii_ncu_dmuctag_ue(sii_ncu_dmuctag_ue),
			 .sii_ncu_dmua_pe(sii_ncu_dmua_pe),
			 .sii_ncu_dmud_pe(sii_ncu_dmud_pe),
			 .sii_ncu_niuctag_ce(sii_ncu_niuctag_ce),
			 .sii_ncu_niuctag_ue(sii_ncu_niuctag_ue),
			 .sii_ncu_niua_pe(sii_ncu_niua_pe),
			 .sii_ncu_niud_pe(sii_ncu_niud_pe),
			 .iobuf_ue_f	(iobuf_ue_f),
			 .intbuf_ue_f	(intbuf_ue_f),
			 .mondotbl_pe_f	(mondotbl_pe_f),
			 // outputs
			 .cmp_tick_enable(ncu_cmp_tick_enable),
			 .tcu_wmr_vec_mask(ncu_wmr_vec_mask),
			 .ncu_dbg1_error_event(ncu_dbg1_error_event),
  .ncu_dmu_dpar(ncu_dmu_dpar[1:0]));




/*** int management table mem ***/
///* ncu_rf_cust auto_template (
//		.scan_out( ),
//	       .wr_adr	(intman_tbl_waddr[6:0]),
//	       .din	(intman_tbl_din[15:0]),
//	       .wr_en	(intman_tbl_wr),
//	       .wrclk	(iol2clk),
//	       .rdclk	(iol2clk),
//	       .rd_en	(intman_tbl_rden),
//       	       .rd_adr (intman_tbl_raddr[6:0]),
//	       .dout	(intman_tbl_dout[15:0]) ) ; */
n2_com_dp_128x16s_cust ncu_intman_rf_cust ( /*autoinst*/
					    // Outputs
					    .dout(intman_tbl_dout[15:0]), // Templated
					    // Inputs
					    .scan_in(ncu_intman_rf_cust_scanin),
					    .scan_out(ncu_intman_rf_cust_scanout),
					    .wrclk(iol2clk),	 // Templated
					    .rdclk(iol2clk),	 // Templated
					    .wr_en(intman_tbl_wr), // Templated
					    .rd_en(intman_tbl_rden), // Templated
					    .wr_adr(intman_tbl_waddr[6:0]), // Templated
					    .rd_adr(intman_tbl_raddr[6:0]), // Templated
					    .din(intman_tbl_din[15:0]), // Templated
					    .tcu_se_scancollar_in(tcu_se_scancollar_in),
					    .tcu_se_scancollar_out(tcu_se_scancollar_out),
					    .tcu_array_wr_inhibit(array_wr_inhibit_io),
					    .tcu_aclk(aclk_io),
					    .tcu_bclk(bclk_io),
					    .tcu_pce_ov(pce_ov),
					     // .tcu_wrclk_stop(1'b0),
					     // .tcu_rdclk_stop(1'b0));
					     .bist_clk_mux_sel(1'b0),
					     .rd_pce(1'b1),
					     .wr_pce(1'b1));
				      	      //.tcu_wrclk_stop(io_clk_stop),
					      //.tcu_rdclk_stop(io_clk_stop));


/*** dmubuf0 mem ***/
///* ncu_rf_cust auto_template (
//		.scan_out( ),
//	      .wr_en	(dmubuf0_wr),
//	      .wrclk	(iol2clk),
//	      .rdclk	(iol2clk),
//	      .rd_en	(dmubuf_rden),
//	      .wr_adr(dmubuf_waddr[4:0]),
//	      .rd_adr(dmubuf_raddr[4:0]),
//	      .din(dmubuf_din[143:0]),	
//	      .dout	(dmubuf0_dout[143:0]) ); */
n2_com_dp_32x144s_cust ncu_dmubuf0_rf_cust  ( /*autoinst*/
					      // Outputs
					      .dout(dmubuf0_dout[143:0]), // Templated
					      // Inputs
					      .scan_in(ncu_dmubuf0_rf_cust_scanin),
					      .scan_out(ncu_dmubuf0_rf_cust_scanout),
					      .wrclk(iol2clk),	 // Templated
					      .rdclk(iol2clk),	 // Templated
					      .wr_en(dmubuf0_wr), // Templated
					      .rd_en(dmubuf_rden), // Templated
					      .wr_adr(dmubuf_waddr[4:0]), // Templated
					      .rd_adr(dmubuf_raddr[4:0]), // Templated
					      .din(dmubuf_din[143:0]), // Templated
					      .tcu_se_scancollar_in(tcu_se_scancollar_in),
					      .tcu_se_scancollar_out(tcu_se_scancollar_out),
					      .tcu_array_wr_inhibit(array_wr_inhibit_io),
					      .tcu_aclk(aclk_io),
					      .tcu_bclk(bclk_io),
					      .tcu_pce_ov(pce_ov),
					     .bist_clk_mux_sel(1'b0),
					     .rd_pce(1'b1),
					     .wr_pce(1'b1));
					      //.tcu_wrclk_stop(1'b0),
					      //.tcu_rdclk_stop(1'b0));
					      //.tcu_wrclk_stop(io_clk_stop),
					      //.tcu_rdclk_stop(io_clk_stop));

/*** dmubuf1 mem ***/
///* ncu_rf_cust auto_template (
//		.scan_out( ),
//	       .wr_en	(dmubuf1_wr),
//	       .wrclk	(iol2clk),
//	       .rdclk	(iol2clk),
//	       .rd_en	(dmubuf_rden),
//	      .wr_adr(dmubuf_waddr[4:0]),
//	      .rd_adr(dmubuf_raddr[4:0]),
//	      .din(dmubuf_din[143:0]),	
//	      .dout(dmubuf1_dout[143:0]) ); */
n2_com_dp_32x144s_cust ncu_dmubuf1_rf_cust  ( /*autoinst*/
					      // Outputs
					      .dout(dmubuf1_dout[143:0]), // Templated
					      // Inputs
					      .scan_in(ncu_dmubuf1_rf_cust_scanin),
					      .scan_out(ncu_dmubuf1_rf_cust_scanout),
					      .wrclk(iol2clk),	 // Templated
					      .rdclk(iol2clk),	 // Templated
					      .wr_en(dmubuf1_wr), // Templated
					      .rd_en(dmubuf_rden), // Templated
					      .wr_adr(dmubuf_waddr[4:0]), // Templated
					      .rd_adr(dmubuf_raddr[4:0]), // Templated
					      .din(dmubuf_din[143:0]), // Templated
					      .tcu_se_scancollar_in(tcu_se_scancollar_in),
					      .tcu_se_scancollar_out(tcu_se_scancollar_out),
					      .tcu_array_wr_inhibit(array_wr_inhibit_io),
					      .tcu_aclk(aclk_io),
					      .tcu_bclk(bclk_io),
					      .tcu_pce_ov(pce_ov),
					     .bist_clk_mux_sel(1'b0),
					     .rd_pce(1'b1),
					     .wr_pce(1'b1));


/* ncu_ssitop_ctl auto_template( 
			       .jbi_io_ssi_mosi(ncu_io_ssi_mosi),
			       .jbi_io_ssi_sck(ncu_io_ssi_sck),
			       .jbi_iob_spi_vld(ssi_ncu_vld),
			       .jbi_iob_spi_data(ssi_ncu_data[3:0]),
			       .jbi_iob_spi_stall(ssi_ncu_stall),
			       .scan_out(),
			       // Inputs
			       .scan_in()
			       .io_jbi_ssi_miso(io_ncu_ssi_miso),
			       .io_jbi_ext_int_l(io_ncu_ssi_ext_int_l),
			       .iob_jbi_spi_vld(ncu_ssi_vld),
			       .iob_jbi_spi_data(ncu_ssi_data[3:0]),
			       .iob_jbi_spi_stall(ncu_ssi_stall)); */

ncu_ssitop_ctl ncu_ssitop_ctl ( /*autoinst*/
			       // Outputs
			       .jbi_io_ssi_mosi(ncu_mio_ssi_mosi), // Templated
			       .jbi_io_ssi_sck(ncu_mio_ssi_sck),	 // Templated
			       .jbi_iob_spi_vld(ssi_ncu_vld),	 // Templated
			       .jbi_iob_spi_data(ssi_ncu_data[3:0]), // Templated
			       .jbi_iob_spi_stall(ssi_ncu_stall), // Templated
			       // Inputs
			       .scan_in(ncu_ssitop_ctl_scanin),
			       .scan_out(ncu_ssitop_ctl_scanout),
			       //.scan_out(scan_out),
			       .iol2clk	(iol2clk),
			       .ncu_scksel(ncu_scksel[1:0]),
			       .tcu_pce_ov(pce_ov),
			       .tcu_clk_stop(1'b0),
			       .tcu_sck_bypass(tcu_sck_bypass),
			       .tcu_scan_en(tcu_scan_en),
			       .tcu_aclk(aclk_io),
			       .tcu_bclk(bclk_io),
			       .io_jbi_ssi_miso(mio_ncu_ssi_miso), // Templated
			       .io_jbi_ext_int_l(mio_ncu_ext_int_l), // Templated
			       .iob_jbi_spi_vld(ncu_ssi_vld),	 // Templated
			       .iob_jbi_spi_data(ncu_ssi_data[3:0]), // Templated
			       .iob_jbi_spi_stall(ncu_ssi_stall)); // Templated


// fixscan start:
//assign ncu_mondo0_rf_cust_scanin = scan_in                  ;
assign ncu_mondo1_rf_cust_scanin = ncu_mondo0_rf_cust_scanout;
assign ncu_cpu_buf_rf_cust_scanin = ncu_mondo1_rf_cust_scanout;
assign ncu_iobuf0_rf_cust_scanin = ncu_cpu_buf_rf_cust_scanout;
assign ncu_iobuf1_rf_cust_scanin = ncu_iobuf0_rf_cust_scanout;
assign ncu_intbuf_rf_cust_scanin = ncu_iobuf1_rf_cust_scanout;
assign ncu_fcd_ctl_scanin        = ncu_intbuf_rf_cust_scanout;
assign ncu_scd_ctl_scanin        = ncu_fcd_ctl_scanout      ;
assign ncu_intman_rf_cust_scanin = ncu_scd_ctl_scanout      ;
assign ncu_dmubuf0_rf_cust_scanin = ncu_intman_rf_cust_scanout;
assign ncu_dmubuf1_rf_cust_scanin = ncu_dmubuf0_rf_cust_scanout;
assign ncu_ssitop_ctl_scanin     = ncu_dmubuf1_rf_cust_scanout;
assign clkgen_cmp_scanin 	= ncu_ssitop_ctl_scanout;
assign clkgen_io_scanin 	= clkgen_cmp_scanout;
//assign scan_out                  = ncu_ssitop_ctl_scanout   ;
// fixscan end:
endmodule 

