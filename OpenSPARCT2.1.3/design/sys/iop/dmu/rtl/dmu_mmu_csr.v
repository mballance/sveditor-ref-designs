// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr.v
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
module dmu_mmu_csr 
  (
   clk,				// clock
   por_l,			// power-on reset
   rst_l,			// reset
   j2d_instance_id,		// jbc instance id
   cr2mm_csrbus_addr,		// cru csr addr
   cr2mm_csrbus_src_bus,	// cru scr source bus
   cr2mm_csrbus_valid,		// cru csr valid
   cr2mm_csrbus_wr,		// cru csr write
   cr2mm_csrbus_wr_data,	// cru csr write data
   cr2mm_dbg_sel_a,		// cru debug select a
   cr2mm_dbg_sel_b,		// cru debug select b
   crb2csr_dbg_a,		// crb debug data a
   crb2csr_dbg_b,		// crb debug data b
   crb2csr_rd,			// crb read data
   ptb2csr_rd,			// ptb read data
   qcb2csr_dbg_a,		// qcb debug data a
   qcb2csr_dbg_b,		// qcb debug data b
   qcb2csr_paq,			// csr physical address queue not empty
   qcb2csr_vaq,			// csr virtual address queue not empty
   tcb2csr_dbg_a,		// tcb debug data a
   tcb2csr_dbg_b,		// tcb debug data b
   tcb2csr_err,			// tcb error
   tcb2csr_prf,			// tcb performance events
   tcb2csr_tcm,			// csr tablewalk cache mode
   tcb2csr_tip,			// csr tablewalk in progress
   tcb2csr_tpl,			// csr translation pipeline not empty
   tdb2csr_rd,			// tdb read data
   tlb2csr_addr,		// tlb address
   tlb2csr_dbra,		// tlb data buffer read address
   tlb2csr_rqid,		// tlb requester ID
   tlb2csr_type,		// tlb type
   vtb2csr_prf,			// vtb performance event
   vtb2csr_rd,			// vtb read data
   mm2cr_csrbus_acc_vio,	// cru csr access violation
   mm2cr_csrbus_done,		// cru csr done
   mm2cr_csrbus_mapped,		// cru csr mapped
   mm2cr_csrbus_read_data,	// cru csr read data
   mm2cr_dbg_a,			// cru debug data a
   mm2cr_dbg_b,			// cru debug data b
   mm2im_int,			// imu interrupt
   csr2crb_ds_a,		// crb debug select a
   csr2crb_ds_b,		// crb debug select b
   csr2crb_ra,			// crb read address
   csr2crb_wa,			// crb write address
   csr2crb_wd,			// crb write data
   csr2crb_we,			// crb write enable
   csr2pab_ps,			// pab page size
   csr2ptb_inv,			// crb tag invalidate
   csr2ptb_ra,			// ptb read address
   csr2ptb_wa,			// ptb write address
   csr2ptb_wd,			// ptb write data
   csr2ptb_we,			// ptb write enable
   csr2qcb_ds_a,		// qcb debug select a
   csr2qcb_ds_b,		// qcb debug select b
   csr2rcb_se,			// rcb snoop enable
//   csr2rcb_tb,			// rcb tsb base address
//   csr2rcb_ts,			// rcb tsb size
   csr2tcb_av,			// tcb access violation
   csr2tcb_be,			// tcb bypass enable
   csr2tcb_cm,			// tcb cache mode
   csr2tcb_ds_a,		// tcb debug select a
   csr2tcb_ds_b,		// tcb debug select b
   csr2tcb_pd,			// tcb processing disable
   csr2tcb_te,			// tcb translation enable
   csr2tdb_ra,			// tdb read address
   csr2tdb_wa,			// tdb write address
   csr2tdb_wd,			// tdb write data
   csr2tdb_we,			// tdb write enable
   csr2tlb_ps,			// tlb page size
   csr2tlb_tb,			// tlb table base address
   csr2tlb_ts,			// tlb table size
   csr2vab_ps,			// vab page size
   csr2vab_ts,			// vab table size
   csr2vtb_ra,			// vtb read address
   csr2vtb_wa,			// vtb write address
   csr2vtb_wd,			// vtb write data
   csr2vtb_we,			// vtb write enable
   csr2dev_iotsb_wd,
   dev_iotsb2csr_rd,
   csr2dev2iotsb_we,
   csr2dev2iotsb_re,
   csr2IotsbDesc_we,
   csr2IotsbDesc_re,
   csr2dev_iotsb_rwa,
   dev_iotsb_ext_done,
   ctl_busid_sel_hw_read,
   ctl_sun4v_en_hw_read
   );

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				por_l;
  input 				rst_l;

  input  [`FIRE_J2D_INSTANCE_ID_BITS] 	j2d_instance_id;
  input  [`FIRE_CSR_ADDR_BITS]		cr2mm_csrbus_addr;
  input  [`FIRE_CSR_SRCB_BITS] 		cr2mm_csrbus_src_bus;
  input 	  			cr2mm_csrbus_valid;
  input 	  			cr2mm_csrbus_wr;
  input  [`FIRE_CSR_DATA_BITS] 		cr2mm_csrbus_wr_data;
  input  [`FIRE_DLC_DBG_SEL_BITS]	cr2mm_dbg_sel_a;
  input  [`FIRE_DLC_DBG_SEL_BITS]	cr2mm_dbg_sel_b;
  input  [`FIRE_DBG_DATA_BITS]		crb2csr_dbg_a;
  input  [`FIRE_DBG_DATA_BITS]		crb2csr_dbg_b;
  input  [`FIRE_DLC_MMU_VTC_BITS] 	crb2csr_rd;
  input  [`FIRE_CSR_DATA_BITS] 	 	ptb2csr_rd;
  input  [`FIRE_DBG_DATA_BITS]		qcb2csr_dbg_a;
  input  [`FIRE_DBG_DATA_BITS]		qcb2csr_dbg_b;
  input 				qcb2csr_paq;
  input 				qcb2csr_vaq;
  input  [`FIRE_DBG_DATA_BITS]		tcb2csr_dbg_a;
  input  [`FIRE_DBG_DATA_BITS]		tcb2csr_dbg_b;
  input  [`FIRE_DLC_MMU_CSR_ERR_BITS]	tcb2csr_err;
  input  [`FIRE_DLC_MMU_TCB_PRF_BITS]	tcb2csr_prf;
  input  [`FIRE_DLC_MMU_CSR_CM_BITS]	tcb2csr_tcm;
  input					tcb2csr_tip;
  input					tcb2csr_tpl;
  input  [`FIRE_DLC_MMU_TDR_BITS] 	tdb2csr_rd;
  input  [`FIRE_DLC_MMU_VA_ADDR_BITS]	tlb2csr_addr;
  input  [`FIRE_DLC_MMU_TDB_PTR_BITS]	tlb2csr_dbra;
  input  [`FIRE_DLC_MMU_VA_RQID_BITS]	tlb2csr_rqid;
  input  [`FIRE_DLC_MMU_VA_TYPE_BITS]	tlb2csr_type;
  input 				vtb2csr_prf;
  input  [`FIRE_DLC_MMU_VTR_BITS] 	vtb2csr_rd;
  input  [`FIRE_CSR_DATA_BITS]          dev_iotsb2csr_rd;
  input 				dev_iotsb_ext_done;


  output				mm2cr_csrbus_acc_vio;
  output				mm2cr_csrbus_done;
  output				mm2cr_csrbus_mapped;
  output [`FIRE_CSR_DATA_BITS] 		mm2cr_csrbus_read_data;
  output [`FIRE_DBG_DATA_BITS]		mm2cr_dbg_a;
  output [`FIRE_DBG_DATA_BITS]		mm2cr_dbg_b;
  output 				mm2im_int;
  output [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2crb_ds_a;
  output [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2crb_ds_b;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2crb_ra;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2crb_wa;
  output [`FIRE_DLC_MMU_VTC_BITS]	csr2crb_wd;
  output				csr2crb_we;
  output				csr2pab_ps;
  output				csr2ptb_inv;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2ptb_ra;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2ptb_wa;
  output [`FIRE_CSR_DATA_BITS] 		csr2ptb_wd;
  output				csr2ptb_we;
  output [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2qcb_ds_a;
  output [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2qcb_ds_b;
  output	  			csr2rcb_se;
//  output [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2rcb_tb;
//  output [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2rcb_ts;
  output				csr2tcb_av;
  output	  			csr2tcb_be;
  output [`FIRE_DLC_MMU_CSR_CM_BITS]	csr2tcb_cm;
  output [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2tcb_ds_a;
  output [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2tcb_ds_b;
  output				csr2tcb_pd;
  output				csr2tcb_te;
  output [`FIRE_DLC_MMU_TDB_PTR_BITS]	csr2tdb_ra;
  output [`FIRE_DLC_MMU_TDB_PTR_BITS]	csr2tdb_wa;
  output [`FIRE_DLC_MMU_TDR_BITS]	csr2tdb_wd;
  output				csr2tdb_we;
  output 				csr2tlb_ps;
  output [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2tlb_tb;
  output [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2tlb_ts;
  output				csr2vab_ps;
  output [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2vab_ts;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2vtb_ra;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2vtb_wa;
  output [`FIRE_DLC_MMU_VTR_BITS]	csr2vtb_wd;
  output				csr2vtb_we;
  output [`FIRE_CSR_DATA_BITS]          csr2dev_iotsb_wd;
  output 				csr2dev2iotsb_we;
  output				csr2dev2iotsb_re;
  output				csr2IotsbDesc_we;
  output				csr2IotsbDesc_re;
  output [4:0]                          csr2dev_iotsb_rwa;
  output			        ctl_busid_sel_hw_read;
  output			        ctl_sun4v_en_hw_read;



// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire					mm2cr_csrbus_acc_vio;
  wire					mm2cr_csrbus_done;
  wire					mm2cr_csrbus_mapped;
  wire [`FIRE_CSR_DATA_BITS] 		mm2cr_csrbus_read_data;
  wire [`FIRE_DBG_DATA_BITS]		mm2cr_dbg_a;
  wire [`FIRE_DBG_DATA_BITS]		mm2cr_dbg_b;
  wire					mm2im_int;
  wire [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2crb_ds_a;
  wire [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2crb_ds_b;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2crb_ra;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2crb_wa;
  wire [`FIRE_DLC_MMU_VTC_BITS]		csr2crb_wd;
  wire					csr2crb_we;
  wire					csr2pab_ps;
  wire					csr2ptb_inv;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2ptb_ra;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2ptb_wa;
  wire [`FIRE_CSR_DATA_BITS]		csr2ptb_wd;
  wire					csr2ptb_we;
  wire					csr2rcb_se;
//  wire [`FIRE_DLC_MMU_CSR_TB_BITS] 	csr2rcb_tb;
//  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2rcb_ts;
  wire					csr2tcb_be;
  wire [`FIRE_DLC_MMU_CSR_CM_BITS]	csr2tcb_cm;
  wire [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2tcb_ds_a;
  wire [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2tcb_ds_b;
  wire					csr2tcb_pd;
  wire					csr2tcb_te;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	csr2tdb_ra;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	csr2tdb_wa;
  wire [`FIRE_DLC_MMU_TDR_BITS]		csr2tdb_wd;
  wire					csr2tdb_we;
  wire					csr2tlb_ps;
  wire [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2tlb_tb;
  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2tlb_ts;
  wire					csr2vab_ps;
  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2vab_ts;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2vtb_ra;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2vtb_wa;
  wire [`FIRE_DLC_MMU_VTR_BITS]		csr2vtb_wd;
  wire					csr2vtb_we;

  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	ext_addr;
  wire					ext_wr;
  wire [`FIRE_CSR_DATA_BITS] 		ext_wr_data;
  wire [3:0] 				ctl_spares_hw_write;
  wire 					ctl_paq_hw_write;
  wire 					ctl_vaq_hw_write;
  wire					ctl_tpl_hw_write;
  wire 					ctl_tip_hw_write;
  wire [`FIRE_DLC_MMU_CSR_CM_BITS]	ctl_tcm_hw_write;
  wire [3:0] 				ctl_sparec_hw_read;
  wire					ctl_pd_hw_read;
  wire					ctl_se_hw_read;
  wire [`FIRE_DLC_MMU_CSR_CM_BITS]	ctl_cm_hw_read;
  wire					ctl_be_hw_read;
  wire					ctl_te_hw_read;
  wire [`FIRE_DLC_MMU_CSR_TB_BITS] 	tsb_tb_hw_read;
  wire					tsb_ps_hw_read;
  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	tsb_ts_hw_read;
  wire					inv_ext_select;
  wire [`FIRE_DLC_MMU_CSR_ERR_BITS]	log_en_hw_read;
  wire [`FIRE_CSR_DATA_BITS]		int_en_hw_read;
  wire [`FIRE_CSR_DATA_BITS]		err_hw_read;
  wire [`FIRE_PRF_ADDR_BITS]		prfc_sel1_hw_read, prfc_sel0_hw_read;
  wire [`FIRE_PRF_DATA_BITS]		prf0_cnt_hw_read, prf1_cnt_hw_read;
  wire					vtb_ext_select;
  wire					ptb_ext_select;
  wire					tdb_ext_select;
  wire					vtb_hw_acc_jtag_rd;
  wire					vtb_hw_acc_jtag_wr;
  wire					vtb_hw_acc_pio_slow_rd;
  wire					vtb_hw_acc_pio_slow_wr;
  wire					vtb_hw_acc_pio_med_rd;
  wire					vtb_hw_acc_pio_med_wr;
  wire					vtb_hw_acc_pio_fast_rd;
  wire					vtb_hw_acc_pio_fast_wr;
  wire					ptb_hw_acc_jtag_rd;
  wire					ptb_hw_acc_jtag_wr;
  wire					ptb_hw_acc_pio_slow_rd;
  wire					ptb_hw_acc_pio_slow_wr;
  wire					ptb_hw_acc_pio_med_rd;
  wire					ptb_hw_acc_pio_med_wr;
  wire					ptb_hw_acc_pio_fast_rd;
  wire					ptb_hw_acc_pio_fast_wr;
  wire					tdb_hw_acc_jtag_rd;
  wire					tdb_hw_acc_jtag_wr;
  wire					tdb_hw_acc_pio_slow_rd;
  wire					tdb_hw_acc_pio_slow_wr;
  wire					tdb_hw_acc_pio_med_rd;
  wire					tdb_hw_acc_pio_med_wr;
  wire					tdb_hw_acc_pio_fast_rd;
  wire					tdb_hw_acc_pio_fast_wr;
  wire [`FIRE_DLC_MMU_CSR_ERR_BITS]	en_err_err_s_ext_read_data;
  wire [`FIRE_DLC_MMU_CSR_ERR_BITS]	en_err_err_p_ext_read_data;
  wire [`FIRE_CSR_DATA_BITS]		err_hw_set;
  wire					flta_va_hw_ld;
  wire [`FIRE_DLC_MMU_VA_ADDR_BITS]	flta_va_hw_write;
  wire					flts_entry_hw_ld;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	flts_entry_hw_write;
  wire					flts_type_hw_ld;
  wire [`FIRE_DLC_MMU_VA_TYPE_BITS]	flts_type_hw_write;
  wire					flts_id_hw_ld;
  wire [`FIRE_DLC_MMU_VA_RQID_BITS]	flts_id_hw_write;
  wire [`FIRE_PRF_DATA_BITS]		prf0_cnt_hw_write, prf1_cnt_hw_write;
  wire [`FIRE_CSR_DATA_BITS]		vtb_ext_read_data;
  wire [`FIRE_CSR_DATA_BITS]		ptb_ext_read_data;
  wire [`FIRE_CSR_DATA_BITS]		tdb_ext_read_data;
  wire ctl_busid_sel_hw_read,ctl_sun4v_en_hw_read;
  wire [`FIRE_CSR_DATA_BITS]            dev_iotsb_ext_read_data;
  wire					IotsbDesc_ext_select;
  wire					IotsbDesc_hw_acc_jtag_rd;
  wire					IotsbDesc_hw_acc_jtag_wr;
  wire					IotsbDesc_hw_acc_pio_slow_rd;
  wire					IotsbDesc_hw_acc_pio_slow_wr;
  wire					IotsbDesc_hw_acc_pio_med_rd;
  wire					IotsbDesc_hw_acc_pio_med_wr;
  wire					IotsbDesc_hw_acc_pio_fast_rd;
  wire					IotsbDesc_hw_acc_pio_fast_wr;
  wire					dev2iotsb_hw_acc_jtag_rd;
  wire					dev2iotsb_hw_acc_jtag_wr;
  wire					dev2iotsb_hw_acc_pio_slow_rd;
  wire					dev2iotsb_hw_acc_pio_slow_wr;
  wire					dev2iotsb_hw_acc_pio_med_rd;
  wire					dev2iotsb_hw_acc_pio_med_wr;
  wire					dev2iotsb_hw_acc_pio_fast_rd;
  wire					dev2iotsb_hw_acc_pio_fast_wr;
  wire					dev2iotsb_ext_select;

// ----------------------------------------------------------------------------
// Instantiaions
// ----------------------------------------------------------------------------

  dmu_mmu_csr_csr csr
    (
     .clk				(clk),
     .csrbus_valid			(cr2mm_csrbus_valid),
     .csrbus_done			(mm2cr_csrbus_done),
     .csrbus_mapped			(mm2cr_csrbus_mapped),
     .csrbus_wr_data			(cr2mm_csrbus_wr_data),
     .csrbus_wr				(cr2mm_csrbus_wr),
     .csrbus_read_data			(mm2cr_csrbus_read_data),
     .csrbus_addr			(cr2mm_csrbus_addr),
     .rst_l				(rst_l),
     .por_l				(por_l),
     .csrbus_src_bus			(cr2mm_csrbus_src_bus),
     .csrbus_acc_vio			(mm2cr_csrbus_acc_vio),
     .instance_id			(j2d_instance_id),
     .ext_addr				(ext_addr),
     .ext_wr				(ext_wr),
     .ext_wr_data			(ext_wr_data),
     .ctl_spares_hw_write		(ctl_spares_hw_write),
     .ctl_paq_hw_write			(ctl_paq_hw_write),
     .ctl_vaq_hw_write			(ctl_vaq_hw_write),
     .ctl_tpl_hw_write			(ctl_tpl_hw_write),
     .ctl_tip_hw_write			(ctl_tip_hw_write),
     .ctl_tcm_hw_write			(ctl_tcm_hw_write),
     .ctl_sparec_hw_read		(ctl_sparec_hw_read),
     .ctl_pd_hw_read			(ctl_pd_hw_read),
     .ctl_se_hw_read			(ctl_se_hw_read),
     .ctl_cm_hw_read			(ctl_cm_hw_read),
     .ctl_busid_sel_hw_read             (ctl_busid_sel_hw_read),
     .ctl_sun4v_en_hw_read		(ctl_sun4v_en_hw_read),
     .ctl_be_hw_read			(ctl_be_hw_read),
     .ctl_te_hw_read			(ctl_te_hw_read),
     .tsb_tb_hw_read			(tsb_tb_hw_read),
     .tsb_ps_hw_read			(tsb_ps_hw_read),
     .tsb_ts_hw_read			(tsb_ts_hw_read),
     .inv_ext_select			(inv_ext_select),
     .log_en_hw_read			(log_en_hw_read),
     .int_en_hw_read			(int_en_hw_read),
     .en_err_err_s_ext_read_data	(en_err_err_s_ext_read_data),
     .en_err_err_p_ext_read_data	(en_err_err_p_ext_read_data),
     .err_hw_set			(err_hw_set),
     .err_hw_read			(err_hw_read),
     .flta_va_hw_ld			(flta_va_hw_ld),
     .flta_va_hw_write			(flta_va_hw_write),
     .flts_entry_hw_ld			(flts_entry_hw_ld),
     .flts_entry_hw_write		(flts_entry_hw_write),
     .flts_type_hw_ld			(flts_type_hw_ld),
     .flts_type_hw_write		(flts_type_hw_write),
     .flts_id_hw_ld			(flts_id_hw_ld),
     .flts_id_hw_write			(flts_id_hw_write),
     .prfc_sel1_hw_read			(prfc_sel1_hw_read),
     .prfc_sel0_hw_read			(prfc_sel0_hw_read),
     .prf0_cnt_hw_write			(prf0_cnt_hw_write),
     .prf0_cnt_hw_read			(prf0_cnt_hw_read),
     .prf1_cnt_hw_write			(prf1_cnt_hw_write),
     .prf1_cnt_hw_read			(prf1_cnt_hw_read),
     .vtb_hw_acc_jtag_rd		(vtb_hw_acc_jtag_rd),
     .vtb_hw_acc_jtag_wr		(vtb_hw_acc_jtag_wr),
     .vtb_hw_acc_pio_slow_rd		(vtb_hw_acc_pio_slow_rd),
     .vtb_hw_acc_pio_slow_wr		(vtb_hw_acc_pio_slow_wr),
     .vtb_hw_acc_pio_med_rd		(vtb_hw_acc_pio_med_rd),
     .vtb_hw_acc_pio_med_wr		(vtb_hw_acc_pio_med_wr),
     .vtb_hw_acc_pio_fast_rd		(vtb_hw_acc_pio_fast_rd),
     .vtb_hw_acc_pio_fast_wr		(vtb_hw_acc_pio_fast_wr),
     .vtb_ext_select			(vtb_ext_select),
     .vtb_ext_read_data			(vtb_ext_read_data),
     .ptb_hw_acc_jtag_rd		(ptb_hw_acc_jtag_rd),
     .ptb_hw_acc_jtag_wr		(ptb_hw_acc_jtag_wr),
     .ptb_hw_acc_pio_slow_rd		(ptb_hw_acc_pio_slow_rd),
     .ptb_hw_acc_pio_slow_wr		(ptb_hw_acc_pio_slow_wr),
     .ptb_hw_acc_pio_med_rd		(ptb_hw_acc_pio_med_rd),
     .ptb_hw_acc_pio_med_wr		(ptb_hw_acc_pio_med_wr),
     .ptb_hw_acc_pio_fast_rd		(ptb_hw_acc_pio_fast_rd),
     .ptb_hw_acc_pio_fast_wr		(ptb_hw_acc_pio_fast_wr),
     .ptb_ext_select			(ptb_ext_select),
     .ptb_ext_read_data			(ptb_ext_read_data),
     .tdb_hw_acc_jtag_rd		(tdb_hw_acc_jtag_rd),
     .tdb_hw_acc_jtag_wr		(tdb_hw_acc_jtag_wr),
     .tdb_hw_acc_pio_slow_rd		(tdb_hw_acc_pio_slow_rd),
     .tdb_hw_acc_pio_slow_wr		(tdb_hw_acc_pio_slow_wr),
     .tdb_hw_acc_pio_med_rd		(tdb_hw_acc_pio_med_rd),
     .tdb_hw_acc_pio_med_wr		(tdb_hw_acc_pio_med_wr),
     .tdb_hw_acc_pio_fast_rd		(tdb_hw_acc_pio_fast_rd),
     .tdb_hw_acc_pio_fast_wr		(tdb_hw_acc_pio_fast_wr),
     .tdb_ext_select			(tdb_ext_select),
     .tdb_ext_read_data			(tdb_ext_read_data),
     .dev2iotsb_hw_acc_jtag_rd		(dev2iotsb_hw_acc_jtag_rd),
     .dev2iotsb_hw_acc_jtag_wr		(dev2iotsb_hw_acc_jtag_wr),
     .dev2iotsb_hw_acc_pio_slow_rd	(dev2iotsb_hw_acc_pio_slow_rd),
     .dev2iotsb_hw_acc_pio_slow_wr	(dev2iotsb_hw_acc_pio_slow_wr),
     .dev2iotsb_hw_acc_pio_med_rd	(dev2iotsb_hw_acc_pio_med_rd),
     .dev2iotsb_hw_acc_pio_med_wr	(dev2iotsb_hw_acc_pio_med_wr),
     .dev2iotsb_hw_acc_pio_fast_rd	(dev2iotsb_hw_acc_pio_fast_rd),
     .dev2iotsb_hw_acc_pio_fast_wr	(dev2iotsb_hw_acc_pio_fast_wr),
     .dev2iotsb_ext_select		(dev2iotsb_ext_select),
     .dev2iotsb_ext_read_data		(dev_iotsb_ext_read_data),
     .dev2iotsb_ext_done		(dev_iotsb_ext_done),
     .IotsbDesc_hw_acc_jtag_rd		(IotsbDesc_hw_acc_jtag_rd),
     .IotsbDesc_hw_acc_jtag_wr		(IotsbDesc_hw_acc_jtag_wr),
     .IotsbDesc_hw_acc_pio_slow_rd	(IotsbDesc_hw_acc_pio_slow_rd),
     .IotsbDesc_hw_acc_pio_slow_wr	(IotsbDesc_hw_acc_pio_slow_wr),
     .IotsbDesc_hw_acc_pio_med_rd	(IotsbDesc_hw_acc_pio_med_rd),
     .IotsbDesc_hw_acc_pio_med_wr	(IotsbDesc_hw_acc_pio_med_wr),
     .IotsbDesc_hw_acc_pio_fast_rd	(IotsbDesc_hw_acc_pio_fast_rd),
     .IotsbDesc_hw_acc_pio_fast_wr	(IotsbDesc_hw_acc_pio_fast_wr),
     .IotsbDesc_ext_select		(IotsbDesc_ext_select),
     .IotsbDesc_ext_read_data		(dev_iotsb_ext_read_data),
     .IotsbDesc_ext_done		(dev_iotsb_ext_done)
     );

  dmu_mmu_csr_cim cim
    (
     .clk				(clk),
     .rst_l				(rst_l),
     .cr2mm_dbg_sel_a			(cr2mm_dbg_sel_a),
     .cr2mm_dbg_sel_b			(cr2mm_dbg_sel_b),
     .crb2csr_dbg_a			(crb2csr_dbg_a),
     .crb2csr_dbg_b			(crb2csr_dbg_b),
     .crb2csr_rd			(crb2csr_rd),
     .ptb2csr_rd			(ptb2csr_rd),
     .qcb2csr_dbg_a			(qcb2csr_dbg_a),
     .qcb2csr_dbg_b			(qcb2csr_dbg_b),
     .qcb2csr_paq			(qcb2csr_paq),
     .qcb2csr_vaq			(qcb2csr_vaq),
     .tcb2csr_dbg_a			(tcb2csr_dbg_a),
     .tcb2csr_dbg_b			(tcb2csr_dbg_b),
     .tcb2csr_err			(tcb2csr_err),
     .tcb2csr_prf			(tcb2csr_prf),
     .tcb2csr_tcm			(tcb2csr_tcm),
     .tcb2csr_tip			(tcb2csr_tip),
     .tcb2csr_tpl			(tcb2csr_tpl),
     .tdb2csr_rd			(tdb2csr_rd),
     .tlb2csr_addr			(tlb2csr_addr),
     .tlb2csr_dbra			(tlb2csr_dbra),
     .tlb2csr_rqid			(tlb2csr_rqid),
     .tlb2csr_type			(tlb2csr_type),
     .vtb2csr_prf			(vtb2csr_prf),
     .vtb2csr_rd			(vtb2csr_rd),
     .csrbus_acc_vio			(mm2cr_csrbus_acc_vio),
     .ext_addr				(ext_addr),
     .ext_wr				(ext_wr),
     .ext_wr_data			(ext_wr_data),
     .ctl_sparec_hw_read		(ctl_sparec_hw_read),
     .ctl_pd_hw_read			(ctl_pd_hw_read),
     .ctl_se_hw_read			(ctl_se_hw_read),
     .ctl_cm_hw_read			(ctl_cm_hw_read),
     .ctl_be_hw_read			(ctl_be_hw_read),
     .ctl_te_hw_read			(ctl_te_hw_read),
     .tsb_tb_hw_read			(tsb_tb_hw_read),
     .tsb_ps_hw_read			(tsb_ps_hw_read),
     .tsb_ts_hw_read			(tsb_ts_hw_read),
     .int_en_hw_read			(int_en_hw_read),
     .log_en_hw_read			(log_en_hw_read),
     .err_hw_read			(err_hw_read),
     .prfc_sel1_hw_read			(prfc_sel1_hw_read),
     .prfc_sel0_hw_read			(prfc_sel0_hw_read),
     .prf0_cnt_hw_read			(prf0_cnt_hw_read),
     .prf1_cnt_hw_read			(prf1_cnt_hw_read),
     .inv_ext_select			(inv_ext_select),
     .vtb_ext_select			(vtb_ext_select),
     .ptb_ext_select			(ptb_ext_select),
     .tdb_ext_select			(tdb_ext_select),
     .mm2cr_dbg_a			(mm2cr_dbg_a),
     .mm2cr_dbg_b			(mm2cr_dbg_b),
     .mm2im_int				(mm2im_int),
     .csr2crb_ds_a			(csr2crb_ds_a),
     .csr2crb_ds_b			(csr2crb_ds_b),
     .csr2crb_ra			(csr2crb_ra),
     .csr2crb_wa			(csr2crb_wa),
     .csr2crb_wd			(csr2crb_wd),
     .csr2crb_we			(csr2crb_we),
     .csr2pab_ps			(csr2pab_ps),
     .csr2ptb_inv			(csr2ptb_inv),
     .csr2ptb_ra			(csr2ptb_ra),
     .csr2ptb_wa			(csr2ptb_wa),
     .csr2ptb_wd			(csr2ptb_wd),
     .csr2ptb_we			(csr2ptb_we),
     .csr2qcb_ds_a			(csr2qcb_ds_a),
     .csr2qcb_ds_b			(csr2qcb_ds_b),
     .csr2rcb_se			(csr2rcb_se),
//     .csr2rcb_tb			(csr2rcb_tb),
//     .csr2rcb_ts			(csr2rcb_ts),
     .csr2tcb_av			(csr2tcb_av),
     .csr2tcb_be			(csr2tcb_be),
     .csr2tcb_cm			(csr2tcb_cm),
     .csr2tcb_ds_a			(csr2tcb_ds_a),
     .csr2tcb_ds_b			(csr2tcb_ds_b),
     .csr2tcb_pd			(csr2tcb_pd),
     .csr2tcb_te			(csr2tcb_te),
     .csr2tdb_ra			(csr2tdb_ra),
     .csr2tdb_wa			(csr2tdb_wa),
     .csr2tdb_wd			(csr2tdb_wd),
     .csr2tdb_we			(csr2tdb_we),
     .csr2tlb_ps			(csr2tlb_ps),
     .csr2tlb_tb			(csr2tlb_tb),
     .csr2tlb_ts			(csr2tlb_ts),
     .csr2vab_ps			(csr2vab_ps),
     .csr2vab_ts			(csr2vab_ts),
     .csr2vtb_ra			(csr2vtb_ra),
     .csr2vtb_wa			(csr2vtb_wa),
     .csr2vtb_wd			(csr2vtb_wd),
     .csr2vtb_we			(csr2vtb_we),
     .ctl_spares_hw_write		(ctl_spares_hw_write),
     .ctl_paq_hw_write			(ctl_paq_hw_write),
     .ctl_vaq_hw_write			(ctl_vaq_hw_write),
     .ctl_tpl_hw_write			(ctl_tpl_hw_write),
     .ctl_tip_hw_write			(ctl_tip_hw_write),
     .ctl_tcm_hw_write			(ctl_tcm_hw_write),
     .en_err_err_s_ext_read_data	(en_err_err_s_ext_read_data),
     .en_err_err_p_ext_read_data	(en_err_err_p_ext_read_data),
     .err_hw_set			(err_hw_set),
     .flta_va_hw_ld			(flta_va_hw_ld),
     .flta_va_hw_write			(flta_va_hw_write),
     .flts_entry_hw_ld			(flts_entry_hw_ld),
     .flts_entry_hw_write		(flts_entry_hw_write),
     .flts_type_hw_ld			(flts_type_hw_ld),
     .flts_type_hw_write		(flts_type_hw_write),
     .flts_id_hw_ld			(flts_id_hw_ld),
     .flts_id_hw_write			(flts_id_hw_write),
     .prf0_cnt_hw_write			(prf0_cnt_hw_write),
     .prf1_cnt_hw_write			(prf1_cnt_hw_write),
     .vtb_hw_acc_jtag_rd		(vtb_hw_acc_jtag_rd),
     .vtb_hw_acc_jtag_wr		(vtb_hw_acc_jtag_wr),
     .vtb_hw_acc_pio_slow_rd		(vtb_hw_acc_pio_slow_rd),
     .vtb_hw_acc_pio_slow_wr		(vtb_hw_acc_pio_slow_wr),
     .vtb_hw_acc_pio_med_rd		(vtb_hw_acc_pio_med_rd),
     .vtb_hw_acc_pio_med_wr		(vtb_hw_acc_pio_med_wr),
     .vtb_hw_acc_pio_fast_rd		(vtb_hw_acc_pio_fast_rd),
     .vtb_hw_acc_pio_fast_wr		(vtb_hw_acc_pio_fast_wr),
     .vtb_ext_read_data			(vtb_ext_read_data),
     .ptb_hw_acc_jtag_rd		(ptb_hw_acc_jtag_rd),
     .ptb_hw_acc_jtag_wr		(ptb_hw_acc_jtag_wr),
     .ptb_hw_acc_pio_slow_rd		(ptb_hw_acc_pio_slow_rd),
     .ptb_hw_acc_pio_slow_wr		(ptb_hw_acc_pio_slow_wr),
     .ptb_hw_acc_pio_med_rd		(ptb_hw_acc_pio_med_rd),
     .ptb_hw_acc_pio_med_wr		(ptb_hw_acc_pio_med_wr),
     .ptb_hw_acc_pio_fast_rd		(ptb_hw_acc_pio_fast_rd),
     .ptb_hw_acc_pio_fast_wr		(ptb_hw_acc_pio_fast_wr),
     .ptb_ext_read_data			(ptb_ext_read_data),
     .tdb_hw_acc_jtag_rd		(tdb_hw_acc_jtag_rd),
     .tdb_hw_acc_jtag_wr		(tdb_hw_acc_jtag_wr),
     .tdb_hw_acc_pio_slow_rd		(tdb_hw_acc_pio_slow_rd),
     .tdb_hw_acc_pio_slow_wr		(tdb_hw_acc_pio_slow_wr),
     .tdb_hw_acc_pio_med_rd		(tdb_hw_acc_pio_med_rd),
     .tdb_hw_acc_pio_med_wr		(tdb_hw_acc_pio_med_wr),
     .tdb_hw_acc_pio_fast_rd		(tdb_hw_acc_pio_fast_rd),
     .tdb_hw_acc_pio_fast_wr		(tdb_hw_acc_pio_fast_wr),
     .tdb_ext_read_data			(tdb_ext_read_data),
     .dev2iotsb_hw_acc_jtag_rd		(dev2iotsb_hw_acc_jtag_rd),
     .dev2iotsb_hw_acc_jtag_wr		(dev2iotsb_hw_acc_jtag_wr),
     .dev2iotsb_hw_acc_pio_slow_rd	(dev2iotsb_hw_acc_pio_slow_rd),
     .dev2iotsb_hw_acc_pio_slow_wr	(dev2iotsb_hw_acc_pio_slow_wr),
     .dev2iotsb_hw_acc_pio_med_rd	(dev2iotsb_hw_acc_pio_med_rd),
     .dev2iotsb_hw_acc_pio_med_wr	(dev2iotsb_hw_acc_pio_med_wr),
     .dev2iotsb_hw_acc_pio_fast_rd	(dev2iotsb_hw_acc_pio_fast_rd),
     .dev2iotsb_hw_acc_pio_fast_wr	(dev2iotsb_hw_acc_pio_fast_wr),
     .dev2iotsb_ext_select		(dev2iotsb_ext_select),
     .dev_iotsb_ext_read_data		(dev_iotsb_ext_read_data),
     .dev_iotsb2csr_rd			(dev_iotsb2csr_rd),                // read data from DEV RAM
     .csr2dev_iotsb_rwa                 (csr2dev_iotsb_rwa),
     .csr2dev_iotsb_wd                  (csr2dev_iotsb_wd),
     .csr2dev2iotsb_we                  (csr2dev2iotsb_we),
     .csr2dev2iotsb_re                  (csr2dev2iotsb_re),
     .IotsbDesc_hw_acc_jtag_rd		(IotsbDesc_hw_acc_jtag_rd),
     .IotsbDesc_hw_acc_jtag_wr		(IotsbDesc_hw_acc_jtag_wr),
     .IotsbDesc_hw_acc_pio_slow_rd	(IotsbDesc_hw_acc_pio_slow_rd),
     .IotsbDesc_hw_acc_pio_slow_wr	(IotsbDesc_hw_acc_pio_slow_wr),
     .IotsbDesc_hw_acc_pio_med_rd	(IotsbDesc_hw_acc_pio_med_rd),
     .IotsbDesc_hw_acc_pio_med_wr	(IotsbDesc_hw_acc_pio_med_wr),
     .IotsbDesc_hw_acc_pio_fast_rd	(IotsbDesc_hw_acc_pio_fast_rd),
     .IotsbDesc_hw_acc_pio_fast_wr	(IotsbDesc_hw_acc_pio_fast_wr),
     .IotsbDesc_ext_select		(IotsbDesc_ext_select),
     .csr2IotsbDesc_we                  (csr2IotsbDesc_we),
     .csr2IotsbDesc_re                  (csr2IotsbDesc_re)
     );

endmodule // dmu_mmu_csr
