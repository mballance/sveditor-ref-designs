// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_cim.v
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
module dmu_mmu_csr_cim 
  (
   clk,				// clock
   rst_l,			// reset
   cr2mm_dbg_sel_a,		// cru debug select a
   cr2mm_dbg_sel_b,		// cru debug select b
   crb2csr_dbg_a,		// crb debug data a
   crb2csr_dbg_b,		// crb debug data b
   crb2csr_rd,			// crb read data
   ptb2csr_rd,			// ptb read data
   qcb2csr_dbg_a,		// qcb debug bus a
   qcb2csr_dbg_b,		// qcb debug bus b
   qcb2csr_paq,			// csr physical address queue not empty
   qcb2csr_vaq,			// csr virtual address queue not empty
   tcb2csr_dbg_a,		// tcb debug bus a
   tcb2csr_dbg_b,		// tcb debug bus b
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
   csrbus_acc_vio,		// access violation
   ext_addr,			// external address
   ext_wr,			// external write
   ext_wr_data,			// external write data
   ctl_sparec_hw_read,		// spare controls
   ctl_pd_hw_read,		// process disable
   ctl_se_hw_read,		// snoop enable
   ctl_cm_hw_read,		// cache mode
   ctl_be_hw_read,		// bypass enable
   ctl_te_hw_read,		// translation enable
   tsb_tb_hw_read,		// tsb base address
   tsb_ps_hw_read,		// tsb page size
   tsb_ts_hw_read,		// tsb size
   int_en_hw_read,		// event interrupt enable
   log_en_hw_read,		// event log enable
   err_hw_read,			// events
   prfc_sel1_hw_read,		// performance select 1
   prfc_sel0_hw_read,		// performance select 0
   prf0_cnt_hw_read,		// performance count 0
   prf1_cnt_hw_read,		// performance count 1
   inv_ext_select,		// invalidate
   vtb_ext_select,		// vtb select
   ptb_ext_select,		// ptb select
   tdb_ext_select,		// tdb select
   mm2cr_dbg_a,			// cru debug bus a
   mm2cr_dbg_b,			// cru debug bus b
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
   ctl_spares_hw_write,		// spare status
   ctl_paq_hw_write,		// physical address queue not empty
   ctl_vaq_hw_write,		// virtual address queue not empty
   ctl_tpl_hw_write,		// translation pipeline not empty
   ctl_tip_hw_write,		// tablewalk in progress
   ctl_tcm_hw_write,		// tablewalk cache mode
   en_err_err_s_ext_read_data,	// enabled secondary events
   en_err_err_p_ext_read_data,	// enabled primary events
   err_hw_set,			// error set
   flta_va_hw_ld,		// virtual address load
   flta_va_hw_write,		// virtual address
   flts_entry_hw_ld,		// entry load
   flts_entry_hw_write,		// entry
   flts_type_hw_ld,		// type load
   flts_type_hw_write,		// type
   flts_id_hw_ld,		// requester id load
   flts_id_hw_write,		// requester id
   prf0_cnt_hw_write,		// performance count 0
   prf1_cnt_hw_write,		// performance count 1
   vtb_hw_acc_jtag_rd,		// vtb read access violation
   vtb_hw_acc_jtag_wr,		// vtb write access violation
   vtb_hw_acc_pio_slow_rd,	// vtb read access violation
   vtb_hw_acc_pio_slow_wr,	// vtb write access violation
   vtb_hw_acc_pio_med_rd,	// vtb read access violation
   vtb_hw_acc_pio_med_wr,	// vtb write access violation
   vtb_hw_acc_pio_fast_rd,	// vtb read access violation
   vtb_hw_acc_pio_fast_wr,	// vtb write access violation
   vtb_ext_read_data,		// vtb read data
   ptb_hw_acc_jtag_rd,		// ptb read access violation
   ptb_hw_acc_jtag_wr,		// ptb write access violation
   ptb_hw_acc_pio_slow_rd,	// ptb read access violation
   ptb_hw_acc_pio_slow_wr,	// ptb write access violation
   ptb_hw_acc_pio_med_rd,	// ptb read access violation
   ptb_hw_acc_pio_med_wr,	// ptb write access violation
   ptb_hw_acc_pio_fast_rd,	// ptb read access violation
   ptb_hw_acc_pio_fast_wr,	// ptb write access violation
   ptb_ext_read_data,		// ptb read data
   tdb_hw_acc_jtag_rd,		// tdb read access violation
   tdb_hw_acc_jtag_wr,		// tdb write access violation
   tdb_hw_acc_pio_slow_rd,	// tdb read access violation
   tdb_hw_acc_pio_slow_wr,	// tdb write access violation
   tdb_hw_acc_pio_med_rd,	// tdb read access violation
   tdb_hw_acc_pio_med_wr,	// tdb write access violation
   tdb_hw_acc_pio_fast_rd,	// tdb read access violation
   tdb_hw_acc_pio_fast_wr,	// tdb write access violation
   tdb_ext_read_data,		// tdb read data
   dev2iotsb_hw_acc_jtag_rd,          
   dev2iotsb_hw_acc_jtag_wr,          
   dev2iotsb_hw_acc_pio_slow_rd,      
   dev2iotsb_hw_acc_pio_slow_wr,      
   dev2iotsb_hw_acc_pio_med_rd,       
   dev2iotsb_hw_acc_pio_med_wr,       
   dev2iotsb_hw_acc_pio_fast_rd,      
   dev2iotsb_hw_acc_pio_fast_wr,      
   dev2iotsb_ext_select,              
   dev_iotsb_ext_read_data,           
   dev_iotsb2csr_rd,                  
   csr2dev_iotsb_rwa,                  
   csr2dev_iotsb_wd,                  
   csr2dev2iotsb_we,                  
   csr2dev2iotsb_re,                  
   IotsbDesc_hw_acc_jtag_rd,          
   IotsbDesc_hw_acc_jtag_wr,          
   IotsbDesc_hw_acc_pio_slow_rd,      
   IotsbDesc_hw_acc_pio_slow_wr,      
   IotsbDesc_hw_acc_pio_med_rd,       
   IotsbDesc_hw_acc_pio_med_wr,       
   IotsbDesc_hw_acc_pio_fast_rd,      
   IotsbDesc_hw_acc_pio_fast_wr,      
   IotsbDesc_ext_select,              
   csr2IotsbDesc_we,
   csr2IotsbDesc_re

   );

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input  [`FIRE_DLC_DBG_SEL_BITS]	cr2mm_dbg_sel_a;
  input  [`FIRE_DLC_DBG_SEL_BITS]	cr2mm_dbg_sel_b;
  input  [`FIRE_DBG_DATA_BITS]		crb2csr_dbg_a;
  input  [`FIRE_DBG_DATA_BITS]		crb2csr_dbg_b;
  input  [`FIRE_DLC_MMU_VTC_BITS] 	crb2csr_rd;
  input  [`FIRE_CSR_DATA_BITS]		ptb2csr_rd;
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
  input  [`FIRE_DLC_MMU_TDR_BITS]	tdb2csr_rd;
  input  [`FIRE_DLC_MMU_VA_ADDR_BITS]	tlb2csr_addr;
  input  [`FIRE_DLC_MMU_TDB_PTR_BITS]	tlb2csr_dbra;
  input  [`FIRE_DLC_MMU_VA_RQID_BITS]	tlb2csr_rqid;
  input  [`FIRE_DLC_MMU_VA_TYPE_BITS]	tlb2csr_type;
  input 				vtb2csr_prf;
  input  [`FIRE_DLC_MMU_VTR_BITS]	vtb2csr_rd;
  input					csrbus_acc_vio;
  input  [`FIRE_DLC_MMU_TDB_PTR_BITS]	ext_addr;
  input					ext_wr;
  input  [`FIRE_CSR_DATA_BITS] 		ext_wr_data;
  input  [3:0]				ctl_sparec_hw_read;
  input					ctl_pd_hw_read;
  input					ctl_se_hw_read;
  input	 [`FIRE_DLC_MMU_CSR_CM_BITS]	ctl_cm_hw_read;
  input					ctl_be_hw_read;
  input					ctl_te_hw_read;
  input  [`FIRE_DLC_MMU_CSR_TB_BITS]	tsb_tb_hw_read;
  input					tsb_ps_hw_read;
  input  [`FIRE_DLC_MMU_CSR_TS_BITS]	tsb_ts_hw_read;
  input  [`FIRE_CSR_DATA_BITS] 		int_en_hw_read;
  input  [`FIRE_DLC_MMU_CSR_ERR_BITS]	log_en_hw_read;
  input  [`FIRE_CSR_DATA_BITS]  	err_hw_read;
  input  [`FIRE_PRF_ADDR_BITS] 		prfc_sel1_hw_read;
  input  [`FIRE_PRF_ADDR_BITS] 		prfc_sel0_hw_read;
  input  [`FIRE_PRF_DATA_BITS]		prf0_cnt_hw_read;
  input  [`FIRE_PRF_DATA_BITS]		prf1_cnt_hw_read;
  input 				inv_ext_select;
  input 				vtb_ext_select;
  input 				ptb_ext_select;
  input					tdb_ext_select;

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
  output				csr2rcb_se;
//  output [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2rcb_tb;
//  output [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2rcb_ts;
  output				csr2tcb_av;
  output				csr2tcb_be;
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
  output [3:0]				ctl_spares_hw_write;
  output				ctl_paq_hw_write;
  output				ctl_vaq_hw_write;
  output				ctl_tpl_hw_write;
  output				ctl_tip_hw_write;
  output [`FIRE_DLC_MMU_CSR_CM_BITS] 	ctl_tcm_hw_write;
  output [`FIRE_DLC_MMU_CSR_ERR_BITS]	en_err_err_s_ext_read_data;
  output [`FIRE_DLC_MMU_CSR_ERR_BITS]	en_err_err_p_ext_read_data;
  output [`FIRE_CSR_DATA_BITS]		err_hw_set;
  output				flta_va_hw_ld;
  output [`FIRE_DLC_MMU_VA_ADDR_BITS]	flta_va_hw_write;
  output				flts_entry_hw_ld;
  output [`FIRE_DLC_MMU_TDB_PTR_BITS]	flts_entry_hw_write;
  output				flts_type_hw_ld;
  output [`FIRE_DLC_MMU_VA_TYPE_BITS]	flts_type_hw_write;
  output				flts_id_hw_ld;
  output [`FIRE_DLC_MMU_VA_RQID_BITS]	flts_id_hw_write;
  output [`FIRE_PRF_DATA_BITS]		prf0_cnt_hw_write;
  output [`FIRE_PRF_DATA_BITS]		prf1_cnt_hw_write;
  output				vtb_hw_acc_jtag_rd;
  output				vtb_hw_acc_jtag_wr;
  output				vtb_hw_acc_pio_slow_rd;
  output				vtb_hw_acc_pio_slow_wr;
  output				vtb_hw_acc_pio_med_rd;
  output				vtb_hw_acc_pio_med_wr;
  output				vtb_hw_acc_pio_fast_rd;
  output				vtb_hw_acc_pio_fast_wr;
  output [`FIRE_CSR_DATA_BITS]		vtb_ext_read_data;
  output				ptb_hw_acc_jtag_rd;
  output				ptb_hw_acc_jtag_wr;
  output				ptb_hw_acc_pio_slow_rd;
  output				ptb_hw_acc_pio_slow_wr;
  output				ptb_hw_acc_pio_med_rd;
  output				ptb_hw_acc_pio_med_wr;
  output				ptb_hw_acc_pio_fast_rd;
  output				ptb_hw_acc_pio_fast_wr;
  output [`FIRE_CSR_DATA_BITS]		ptb_ext_read_data;
  output				tdb_hw_acc_jtag_rd;
  output				tdb_hw_acc_jtag_wr;
  output				tdb_hw_acc_pio_slow_rd;
  output				tdb_hw_acc_pio_slow_wr;
  output				tdb_hw_acc_pio_med_rd;
  output				tdb_hw_acc_pio_med_wr;
  output				tdb_hw_acc_pio_fast_rd;
  output				tdb_hw_acc_pio_fast_wr;
  output [`FIRE_CSR_DATA_BITS]		tdb_ext_read_data;
  output                                dev2iotsb_hw_acc_jtag_rd;          
  output                                dev2iotsb_hw_acc_jtag_wr;          
  output                                dev2iotsb_hw_acc_pio_slow_rd;      
  output                                dev2iotsb_hw_acc_pio_slow_wr;      
  output                                dev2iotsb_hw_acc_pio_med_rd;       
  output                                dev2iotsb_hw_acc_pio_med_wr;       
  output                                dev2iotsb_hw_acc_pio_fast_rd;      
  output                                dev2iotsb_hw_acc_pio_fast_wr;      
  input  			        dev2iotsb_ext_select;              
  output    [`FIRE_CSR_DATA_BITS]       dev_iotsb_ext_read_data;           
  input     [`FIRE_CSR_DATA_BITS]       dev_iotsb2csr_rd;                  
  output    [4:0]	     	        csr2dev_iotsb_rwa;                  
  output [`FIRE_CSR_DATA_BITS]	        csr2dev_iotsb_wd;                  
  output  			        csr2dev2iotsb_we;                  
  output  			        csr2dev2iotsb_re;                  
  output                                IotsbDesc_hw_acc_jtag_rd;          
  output                                IotsbDesc_hw_acc_jtag_wr;          
  output                                IotsbDesc_hw_acc_pio_slow_rd;      
  output                                IotsbDesc_hw_acc_pio_slow_wr;      
  output                                IotsbDesc_hw_acc_pio_med_rd;       
  output                                IotsbDesc_hw_acc_pio_med_wr;       
  output                                IotsbDesc_hw_acc_pio_fast_rd;      
  output                                IotsbDesc_hw_acc_pio_fast_wr;      
  input  			        IotsbDesc_ext_select;              
  output  			        csr2IotsbDesc_we;
  output  			        csr2IotsbDesc_re;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2crb_ds_a, csr2crb_ds_b;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2crb_ra, csr2crb_wa;
  wire [`FIRE_DLC_MMU_VTC_BITS]		csr2crb_wd;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2ptb_ra, csr2ptb_wa;
  wire [`FIRE_CSR_DATA_BITS]		csr2ptb_wd;
  wire [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2qcb_ds_a, csr2qcb_ds_b;
//  wire [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2rcb_tb, csr2tlb_tb;
  wire [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2tlb_tb;
//  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2rcb_ts, csr2tlb_ts, csr2vab_ts;
  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2tlb_ts, csr2vab_ts;
  wire [`FIRE_DLC_MMU_CSR_CM_BITS]	csr2tcb_cm;
  wire [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2tcb_ds_a, csr2tcb_ds_b;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	csr2tdb_ra, csr2tdb_wa;
  wire [`FIRE_DLC_MMU_TDR_BITS]		csr2tdb_wd;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2vtb_ra, csr2vtb_wa;
  wire [`FIRE_DLC_MMU_VTR_BITS]		csr2vtb_wd;
  wire [3:0] 				ctl_spares_hw_write;
  wire [`FIRE_DLC_MMU_CSR_CM_BITS] 	ctl_tcm_hw_write;
  wire [`FIRE_DLC_MMU_CSR_ERR_BITS]	en_err_err_s_ext_read_data;
  wire [`FIRE_DLC_MMU_CSR_ERR_BITS]	en_err_err_p_ext_read_data;
  wire [`FIRE_CSR_DATA_BITS]		err_hw_set, en_err;
  wire [`FIRE_DLC_MMU_VA_ADDR_BITS]	flta_va_hw_write;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	flts_entry_hw_write;
  wire [`FIRE_DLC_MMU_VA_TYPE_BITS]	flts_type_hw_write;
  wire [`FIRE_DLC_MMU_VA_RQID_BITS]	flts_id_hw_write;
  wire [`FIRE_PRF_DATA_BITS] 		prf0_cnt_hw_write, prf1_cnt_hw_write;
  wire [`FIRE_CSR_DATA_BITS]		ptb_ext_read_data;
  wire [`FIRE_CSR_DATA_BITS]		tdb_ext_read_data;
  wire [`FIRE_CSR_DATA_BITS]		vtb_ext_read_data;
  wire [`FIRE_DLC_MMU_CSR_ERR_BITS]	err, err_p, err_s;
  wire [`FIRE_PRF_DATA_BITS]		inc_cnt0, inc_cnt1;
  wire [`FIRE_DBG_DATA_BITS]		mm2cr_dbg_a, mm2cr_dbg_b;
  wire [`FIRE_CSR_DATA_BITS]            dev_iotsb_ext_read_data;

  reg  [`FIRE_CSR_DATA_BITS]            dev_iotsb_rd;
  reg					mm2im_int;
  reg  [`FIRE_DLC_MMU_TDB_PTR_BITS]	ext_wa;
  reg  [`FIRE_CSR_DATA_BITS]		ext_wd;
  reg					crb_we, ptb_we, tdb_we, vtb_we;
  reg					ptb_inv;
  reg  [`FIRE_DLC_MMU_VTC_BITS]		crb_rd;
  reg  [`FIRE_CSR_DATA_BITS]		ptb_rd;
  reg  [`FIRE_DLC_MMU_TDR_BITS]		tdb_rd;
  reg  [`FIRE_DLC_MMU_VTR_BITS]		vtb_rd;
  reg  [3:0] 				spares;

  reg  [`FIRE_PRF_ADDR_BITS]		prf_sel [0:1];
  reg  [1:0] 	  			prf_inc;

  reg  [`FIRE_DBG_DATA_BITS]		dbg [0:1];
  reg  [`FIRE_DBG_DATA_BITS]		nxt_dbg [0:1];
  reg 					dev2iotsb_we;
  reg 					dev2iotsb_re;
  reg 					IotsbDesc_we;
  reg 					IotsbDesc_re;

  integer	  			i;

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
// crb read address, write address, write data, and write enable
  assign csr2crb_ra = ext_addr[`FIRE_DLC_MMU_TAG_PTR_BITS];
  assign csr2crb_wa = ext_wa[`FIRE_DLC_MMU_TAG_PTR_BITS];
  assign csr2crb_wd = ext_wd[`FIRE_DLC_MMU_VTD_CNT_BITS];
  wire	 csr2crb_we = crb_we;

// pab page size
  wire	 csr2pab_ps = tsb_ps_hw_read;

// dev & iotsb read/write address, write data and write enables
   assign csr2dev_iotsb_rwa = ext_addr[4:0];
   assign csr2dev_iotsb_wd = ext_wd;
   wire   csr2dev2iotsb_we = dev2iotsb_we;
   wire   csr2IotsbDesc_we = IotsbDesc_we;
   wire   csr2dev2iotsb_re = dev2iotsb_re;
   wire   csr2IotsbDesc_re = IotsbDesc_re;
// ptb invalidate
  wire	 csr2ptb_inv = ptb_inv;

// ptb read address, write address, write data, and write enable
  assign csr2ptb_ra = ext_addr[`FIRE_DLC_MMU_TAG_PTR_BITS];
  assign csr2ptb_wa = ext_wa[`FIRE_DLC_MMU_TAG_PTR_BITS];
  assign csr2ptb_wd = ext_wd;
  wire	 csr2ptb_we = ptb_we;

// rcb snoop enable, tsb base address, and tsb size
  wire	 csr2rcb_se = ctl_se_hw_read;
//  assign csr2rcb_tb = tsb_tb_hw_read;
//  assign csr2rcb_ts = tsb_ts_hw_read;

// tcb bypass enable, cache mode, process disable, and translation enable
  wire	 csr2tcb_be = ctl_be_hw_read;
  assign csr2tcb_cm = ctl_cm_hw_read;
  wire	 csr2tcb_pd = ctl_pd_hw_read;
  wire	 csr2tcb_te = ctl_te_hw_read;

// tcb access violation
  wire	 csr2tcb_av = csrbus_acc_vio;

// tdb read address, write address, write data, and write enable
  assign csr2tdb_ra = ext_addr;
  assign csr2tdb_wa = ext_wa;
  wire	 csr2tdb_we = tdb_we;

  assign csr2tdb_wd[`FIRE_DLC_MMU_TDR_PAR_BITS] = ext_wd[`FIRE_DLC_MMU_TDD_PAR_BITS];
  assign csr2tdb_wd[`FIRE_DLC_MMU_TDR_PPN_BITS] = ext_wd[`FIRE_DLC_MMU_TDD_PPN_BITS];
  assign csr2tdb_wd[`FIRE_DLC_MMU_TDR_WRT_BITS] = ext_wd[`FIRE_DLC_MMU_TDD_WRT_BITS];
  assign csr2tdb_wd[`FIRE_DLC_MMU_TDR_VLD_BITS] = ext_wd[`FIRE_DLC_MMU_TDD_VLD_BITS];
  assign csr2tdb_wd[`FIRE_DLC_MMU_TDR_KEYVLD_BITS] = ext_wd[`FIRE_DLC_MMU_TDD_KEYVLD_BITS];
  assign csr2tdb_wd[`FIRE_DLC_MMU_TDR_FNM_BITS] = ext_wd[`FIRE_DLC_MMU_TDD_FNM_BITS];
  assign csr2tdb_wd[`FIRE_DLC_MMU_TDR_KEY_BITS] = ext_wd[`FIRE_DLC_MMU_TDD_KEY_BITS];

// tlb page size, tsb base address, and tsb size
  wire	 csr2tlb_ps = tsb_ps_hw_read;
  assign csr2tlb_tb = tsb_tb_hw_read;
  assign csr2tlb_ts = tsb_ts_hw_read;

// vab page size and tsb size
  wire	 csr2vab_ps = tsb_ps_hw_read;
  assign csr2vab_ts = tsb_ts_hw_read;

// vtb read address, write address, write data, and write enable
  assign csr2vtb_ra = ext_addr[`FIRE_DLC_MMU_TAG_PTR_BITS];
  assign csr2vtb_wa = ext_wa[`FIRE_DLC_MMU_TAG_PTR_BITS];
  wire	 csr2vtb_we = vtb_we;

  assign csr2vtb_wd[`FIRE_DLC_MMU_VTR_VPN_BITS] = ext_wd[`FIRE_DLC_MMU_VTD_VPN_BITS];
  assign csr2vtb_wd[`FIRE_DLC_MMU_VTR_VLD_BITS] = ext_wd[`FIRE_DLC_MMU_VTD_VLD_BITS];
  assign csr2vtb_wd[`FIRE_DLC_MMU_VTR_IOTSBNO_BITS] = ext_wd[`FIRE_DLC_MMU_VTD_IOTSBNO_BITS];

// spare status
  assign ctl_spares_hw_write = spares;

// status
  wire   ctl_paq_hw_write = qcb2csr_paq;
  wire   ctl_vaq_hw_write = qcb2csr_vaq;
  wire   ctl_tpl_hw_write = tcb2csr_tpl;
  wire   ctl_tip_hw_write = tcb2csr_tip;
  assign ctl_tcm_hw_write = tcb2csr_tcm;

// external read data
  assign ptb_ext_read_data = ptb_rd;
  assign dev_iotsb_ext_read_data = dev_iotsb_rd;

  assign tdb_ext_read_data[`FIRE_DLC_MMU_TDD_PAR_BITS] = tdb_rd[`FIRE_DLC_MMU_TDR_PAR_BITS];
  assign tdb_ext_read_data[`FIRE_DLC_MMU_TDD_PPN_BITS] = tdb_rd[`FIRE_DLC_MMU_TDR_PPN_BITS];
  assign tdb_ext_read_data[`FIRE_DLC_MMU_TDD_WRT_BITS] = tdb_rd[`FIRE_DLC_MMU_TDR_WRT_BITS];
  assign tdb_ext_read_data[`FIRE_DLC_MMU_TDD_VLD_BITS] = tdb_rd[`FIRE_DLC_MMU_TDR_VLD_BITS];
  assign tdb_ext_read_data[`FIRE_DLC_MMU_TDD_KEY_BITS] = tdb_rd[`FIRE_DLC_MMU_TDR_KEY_BITS];
  assign tdb_ext_read_data[`FIRE_DLC_MMU_TDD_FNM_BITS] = tdb_rd[`FIRE_DLC_MMU_TDR_FNM_BITS];
  assign tdb_ext_read_data[`FIRE_DLC_MMU_TDD_KEYVLD_BITS] = tdb_rd[`FIRE_DLC_MMU_TDR_KEYVLD_BITS];
  assign tdb_ext_read_data[`FIRE_DLC_MMU_TDD_RZ1_BITS] = 0;
  assign tdb_ext_read_data[`FIRE_DLC_MMU_TDD_RZ0_BITS] = 0;
  
  assign vtb_ext_read_data[`FIRE_DLC_MMU_VTD_CNT_BITS] = crb_rd;
  assign vtb_ext_read_data[`FIRE_DLC_MMU_VTD_VPN_BITS] = vtb_rd[`FIRE_DLC_MMU_VTR_VPN_BITS];
  assign vtb_ext_read_data[`FIRE_DLC_MMU_VTD_VLD_BITS] = vtb_rd[`FIRE_DLC_MMU_VTR_VLD_BITS];
  assign vtb_ext_read_data[`FIRE_DLC_MMU_VTD_IOTSBNO_BITS] = vtb_rd[`FIRE_DLC_MMU_VTR_IOTSBNO_BITS];
  assign vtb_ext_read_data[`FIRE_DLC_MMU_VTD_RZ1_BITS] = 0;
  assign vtb_ext_read_data[`FIRE_DLC_MMU_VTD_RZ0_BITS] = 0;

// ----------------------------------------------------------------------------
// Access
// ----------------------------------------------------------------------------
  wire	 hw_acc = ~|ctl_cm_hw_read;

  wire	 vtb_hw_acc_jtag_rd     = hw_acc;
  wire	 vtb_hw_acc_jtag_wr     = hw_acc;
  wire	 vtb_hw_acc_pio_slow_rd = hw_acc;
  wire	 vtb_hw_acc_pio_slow_wr = hw_acc;
  wire	 vtb_hw_acc_pio_med_rd  = hw_acc;
  wire	 vtb_hw_acc_pio_med_wr  = hw_acc;
  wire	 vtb_hw_acc_pio_fast_rd = hw_acc;
  wire	 vtb_hw_acc_pio_fast_wr = hw_acc;
  wire	 ptb_hw_acc_jtag_rd     = hw_acc;
  wire	 ptb_hw_acc_jtag_wr     = hw_acc;
  wire	 ptb_hw_acc_pio_slow_rd = hw_acc;
  wire	 ptb_hw_acc_pio_slow_wr = hw_acc;
  wire	 ptb_hw_acc_pio_med_rd  = hw_acc;
  wire	 ptb_hw_acc_pio_med_wr  = hw_acc;
  wire	 ptb_hw_acc_pio_fast_rd = hw_acc;
  wire	 ptb_hw_acc_pio_fast_wr = hw_acc;
  wire	 tdb_hw_acc_jtag_rd     = hw_acc;
  wire	 tdb_hw_acc_jtag_wr     = hw_acc;
  wire	 tdb_hw_acc_pio_slow_rd = hw_acc;
  wire	 tdb_hw_acc_pio_slow_wr = hw_acc;
  wire	 tdb_hw_acc_pio_med_rd  = hw_acc;
  wire	 tdb_hw_acc_pio_med_wr  = hw_acc;
  wire	 tdb_hw_acc_pio_fast_rd = hw_acc;
  wire	 tdb_hw_acc_pio_fast_wr = hw_acc;
  wire   dev2iotsb_hw_acc_jtag_rd = 1'b1;
  wire   dev2iotsb_hw_acc_jtag_wr = 1'b1;
  wire   dev2iotsb_hw_acc_pio_slow_rd = 1'b1;
  wire   dev2iotsb_hw_acc_pio_slow_wr = 1'b1;
  wire   dev2iotsb_hw_acc_pio_med_rd = 1'b1;
  wire   dev2iotsb_hw_acc_pio_med_wr = 1'b1;
  wire   dev2iotsb_hw_acc_pio_fast_rd = 1'b1;
  wire   dev2iotsb_hw_acc_pio_fast_wr = 1'b1;
  wire   IotsbDesc_hw_acc_jtag_rd = 1'b1;
  wire   IotsbDesc_hw_acc_jtag_wr = 1'b1;
  wire   IotsbDesc_hw_acc_pio_slow_rd = 1'b1;
  wire   IotsbDesc_hw_acc_pio_slow_wr = 1'b1;
  wire   IotsbDesc_hw_acc_pio_med_rd = 1'b1;
  wire   IotsbDesc_hw_acc_pio_med_wr = 1'b1;
  wire   IotsbDesc_hw_acc_pio_fast_rd = 1'b1;
  wire   IotsbDesc_hw_acc_pio_fast_wr = 1'b1;


// ----------------------------------------------------------------------------
// Errors
// ----------------------------------------------------------------------------
  wire	 flt_ld = ~|err_hw_read[`FIRE_DLC_MMU_CSR_ERR_BITS];

  wire	 flta_va_hw_ld    = flt_ld;
  wire	 flts_entry_hw_ld = flt_ld;
  wire	 flts_type_hw_ld  = flt_ld;
  wire	 flts_id_hw_ld    = flt_ld;

  assign flta_va_hw_write    = tlb2csr_addr;
  assign flts_entry_hw_write = tlb2csr_dbra;
  assign flts_type_hw_write  = tlb2csr_type;
  assign flts_id_hw_write    = tlb2csr_rqid;
	
  assign err = tcb2csr_err & log_en_hw_read;

  assign err_p = flt_ld ? err : 0;
  assign err_s = flt_ld ? 0 : err;

  assign err_hw_set[`FIRE_DLC_MMU_SCN_RSV_BITS] = 0;
  assign err_hw_set[`FIRE_DLC_MMU_SCN_ERR_BITS] = err_s;
  assign err_hw_set[`FIRE_DLC_MMU_PRM_RSV_BITS] = 0;
  assign err_hw_set[`FIRE_DLC_MMU_PRM_ERR_BITS] = err_p;

  assign en_err = err_hw_read & int_en_hw_read;

  assign en_err_err_s_ext_read_data = en_err[`FIRE_DLC_MMU_SCN_ERR_BITS];
  assign en_err_err_p_ext_read_data = en_err[`FIRE_DLC_MMU_PRM_ERR_BITS];

  wire	 nxt_int = |en_err;

// ----------------------------------------------------------------------------
// Performance Counters
// ----------------------------------------------------------------------------
  assign inc_cnt0 = prf0_cnt_hw_read + 1;
  assign inc_cnt1 = prf1_cnt_hw_read + 1;

  always @ (prfc_sel0_hw_read or prfc_sel1_hw_read) begin
    prf_sel[0] = prfc_sel0_hw_read;
    prf_sel[1] = prfc_sel1_hw_read;
  end

  always @ (prf_sel[0] or prf_sel[1] or tcb2csr_prf or vtb2csr_prf) begin
    for (i = 0; i < 2; i = i + 1) begin
      case (prf_sel[i]) // synopsys infer_mux
	8'h00 : prf_inc[i] = 1'b0;
	8'h01 : prf_inc[i] = 1'b1;
	8'h02 : prf_inc[i] = tcb2csr_prf[0];
	8'h03 : prf_inc[i] = tcb2csr_prf[1];
	8'h04 : prf_inc[i] = tcb2csr_prf[2];
	8'h05 : prf_inc[i] = tcb2csr_prf[3];
	8'h06 : prf_inc[i] = tcb2csr_prf[4];
	8'h07 : prf_inc[i] = tcb2csr_prf[5];
	8'h08 : prf_inc[i] = tcb2csr_prf[6];
	8'h09 : prf_inc[i] = vtb2csr_prf;
	default : prf_inc[i] = 1'b0;
      endcase
    end
  end

  assign prf0_cnt_hw_write = prf_inc[0] ? inc_cnt0 : prf0_cnt_hw_read;
  assign prf1_cnt_hw_write = prf_inc[1] ? inc_cnt1 : prf1_cnt_hw_read;

// ----------------------------------------------------------------------------
// Debug Ports
// ----------------------------------------------------------------------------
  assign csr2crb_ds_a = cr2mm_dbg_sel_a[`FIRE_DLC_MMU_CSR_DS_BITS];
  assign csr2crb_ds_b = cr2mm_dbg_sel_b[`FIRE_DLC_MMU_CSR_DS_BITS];
  assign csr2qcb_ds_a = cr2mm_dbg_sel_a[`FIRE_DLC_MMU_CSR_DS_BITS];
  assign csr2qcb_ds_b = cr2mm_dbg_sel_b[`FIRE_DLC_MMU_CSR_DS_BITS];
  assign csr2tcb_ds_a = cr2mm_dbg_sel_a[`FIRE_DLC_MMU_CSR_DS_BITS];
  assign csr2tcb_ds_b = cr2mm_dbg_sel_b[`FIRE_DLC_MMU_CSR_DS_BITS];

  always @ (cr2mm_dbg_sel_a or
	    crb2csr_dbg_a or qcb2csr_dbg_a or tcb2csr_dbg_a ) begin
    case (cr2mm_dbg_sel_a[5:3]) // synopsys infer_mux
      3'b000: nxt_dbg[0] = qcb2csr_dbg_a;
      3'b001: nxt_dbg[0] = tcb2csr_dbg_a;
      3'b010: nxt_dbg[0] = crb2csr_dbg_a;
      3'b011: nxt_dbg[0] = 8'h00;
      3'b100: nxt_dbg[0] = 8'h00;
      3'b101: nxt_dbg[0] = 8'h00;
      3'b110: nxt_dbg[0] = 8'h00;
      3'b111: nxt_dbg[0] = 8'h00;
    endcase
  end

  always @ (cr2mm_dbg_sel_b or
	    crb2csr_dbg_b or qcb2csr_dbg_b or tcb2csr_dbg_b ) begin
    case (cr2mm_dbg_sel_b[5:3]) // synopsys infer_mux
      3'b000: nxt_dbg[1] = qcb2csr_dbg_b;
      3'b001: nxt_dbg[1] = tcb2csr_dbg_b;
      3'b010: nxt_dbg[1] = crb2csr_dbg_b;
      3'b011: nxt_dbg[1] = 8'h00;
      3'b100: nxt_dbg[1] = 8'h00;
      3'b101: nxt_dbg[1] = 8'h00;
      3'b110: nxt_dbg[1] = 8'h00;
      3'b111: nxt_dbg[1] = 8'h00;
    endcase
  end

  assign mm2cr_dbg_a = dbg[0];
  assign mm2cr_dbg_b = dbg[1];

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin
    ext_wa  <= {`FIRE_DLC_MMU_TDB_PTR_SIZE{1'b0}};
    ext_wd  <= 64'b0;
    crb_we  <= 1'b0;
    ptb_we  <= 1'b0;
    tdb_we  <= 1'b0;
    vtb_we  <= 1'b0;
    ptb_inv <= 1'b0;
    dev2iotsb_we <= 1'b0;
    IotsbDesc_we <= 1'b0;
    dev2iotsb_re <= 1'b0;
    IotsbDesc_re <= 1'b0;
    end
    else begin
    ext_wa  <= ext_addr;
    ext_wd  <= ext_wr_data;
    crb_we  <= ext_wr & vtb_ext_select;
    ptb_we  <= ext_wr & ptb_ext_select;
    tdb_we  <= ext_wr & tdb_ext_select;
    vtb_we  <= ext_wr & vtb_ext_select;
    ptb_inv <= ext_wr & inv_ext_select;
    dev2iotsb_we <= ext_wr & dev2iotsb_ext_select;
    IotsbDesc_we <= ext_wr & IotsbDesc_ext_select;
    dev2iotsb_re <= ~ext_wr & dev2iotsb_ext_select;
    IotsbDesc_re <= ~ext_wr & IotsbDesc_ext_select;
  end
end

  always @ (posedge clk) begin
    if (!rst_l) begin
    crb_rd <= {`FIRE_DLC_MMU_VTC_WDTH{1'b0}};
    ptb_rd <= 64'b0;
    tdb_rd <= {`FIRE_DLC_MMU_TDR_WDTH{1'b0}};
    vtb_rd <= {`FIRE_DLC_MMU_VTR_WDTH{1'b0}};
    spares <= 4'b0;
    dev_iotsb_rd <= 64'b0;
	end
	else begin
    crb_rd <= crb2csr_rd;
    ptb_rd <= ptb2csr_rd;
    tdb_rd <= tdb2csr_rd;
    vtb_rd <= vtb2csr_rd;
    spares <= ctl_sparec_hw_read;
    dev_iotsb_rd <= dev_iotsb2csr_rd;
  end
end

  always @ (posedge clk) begin
    if (!rst_l) begin
      mm2im_int <= 0;
    end
    else begin
      mm2im_int <= nxt_int;
    end
  end

  always @ (posedge clk) begin
    if (!rst_l) begin
    for (i = 0; i < 2; i = i + 1) begin
	dbg[i] <= 8'b0;
	end
	end
	else begin
    for (i = 0; i < 2; i = i + 1) begin
      dbg[i] <= nxt_dbg[i];
    end
    end
  end

endmodule // dmu_mmu_csr_cim
