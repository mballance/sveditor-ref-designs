// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu.v
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
module dmu_mmu 
  (
   l2clk,			// clock for rams
   clk,				// clock
   por_l,			// power-on reset
   rst_l,			// reset
   scan_in,
   tcu_array_bypass,
   tcu_scan_en,
   tcu_se_scancollar_in,
   tcu_array_wr_inhibit,
   tcu_pce_ov,
   tcu_aclk,
   tcu_bclk,
   scan_out,
   j2d_instance_id,		// jbc instance id
   j2d_mmu_addr,		// jbc snoop address
   j2d_mmu_addr_vld,		// jbc snoop address valid
   cl2mm_tcr_ack,		// clu tcr acknowledge
   cm2mm_rcd_full,		// cmu isr queue full
   cr2mm_csrbus_addr,		// cru csr addr
   cr2mm_csrbus_src_bus,	// cru scr source bus
   cr2mm_csrbus_valid,		// cru csr valid
   cr2mm_csrbus_wr,		// cru csr write
   cr2mm_csrbus_wr_data,	// cru csr write data
   cr2mm_dbg_sel_a,		// cru debug select a
   cr2mm_dbg_sel_b,		// cru debug select b
   cl2mm_tdr_rcd,		// clu tdr record
   cl2mm_tdr_vld,		// clu tdr valid
   rm2mm_rcd,			// rmu srm record
   rm2mm_rcd_enq,		// rmu srm record enqueue
//   d2j_tsb_base,		// jbc tsb snoop enable
//   d2j_tsb_enable,		// jbc tsb base address
//   d2j_tsb_size,		// jbc tsb size
   mm2cl_tcr_rcd,		// clu tcr record
   mm2cl_tcr_req,		// clu tcr request
   mm2cm_rcd,			// cmu isr record
   mm2cm_rcd_enq,		// cmu isr record enqueue
   mm2cr_csrbus_acc_vio,	// cru csr access violation
   mm2cr_csrbus_done,		// cru csr done
   mm2cr_csrbus_mapped,		// cru csr mapped
   mm2cr_csrbus_read_data,	// cru csr read data
   mm2cr_dbg_a,			// cru debug port a
   mm2cr_dbg_b,			// cru debug port b
   mm2im_int,			// imu interrupt
   mm2rm_rcd_full,		// rmu srm queue full
   dsn_dmc_iei,			// NCU forces parity error on iotsb and tdb rams for test
   dmu_cb0_run,
   dmu_cb0_addr,
   dmu_cb0_wdata_key,
   dmu_cb0_mmu_ptb_wr_en,
   dmu_cb0_mmu_ptb_rd_en,
   dmu_cb0_mmu_ptb_lkup_en,
   mmu_ptb_hit,
   dmu_cb0_mmu_vtb_wr_en,
   dmu_cb0_mmu_vtb_rd_en,
   dmu_cb0_mmu_vtb_lkup_en,
   dmu_cb0_hld,
   mmu_vtb_hit,
   vtb_dout_4msb,
   ptb2csr_rd2,
   vtb2csr_rd,
   dev_iotsb2csr_rd,
   dmu_mb0_run,
   dmu_mb0_addr,
   dmu_mb0_wdata,
   dmu_mb0_dev_wr_en,
   dmu_mb0_dev_rd_en,
   dmu_mb0_tsb_wr_en,
   dmu_mb0_tsb_rd_en,
   dmu_mb0_tdb_wr_en,
   dmu_mb0_tdb_rd_en,
   tdb_dout_8msb,
   tdb2csr_rd,
// efu wires
   efu_dmu_data,        // input efu to devtsb
   efu_dmu_xfer_en,     // input efu to devtsb
   efu_dmu_clr    ,     // input efu to devtsb
   dmu_efu_data,        // output of devtsb to efu
   dmu_efu_xfer_en,     // output of devtsb to efu
   csr_sun4v_en		// csr bit to enable sun4v mode

   );

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					l2clk;
  input					clk;
  input 				por_l;
  input 				rst_l;

  input                                   scan_in;
  input                                   tcu_array_bypass;
  input                                   tcu_scan_en;
  input                                   tcu_se_scancollar_in;
  input                                   tcu_array_wr_inhibit;
  input                                   tcu_pce_ov;
  input                                   tcu_aclk;
  input                                   tcu_bclk;
  output                                  scan_out;

  input  [`FIRE_J2D_INSTANCE_ID_BITS] 	j2d_instance_id;
  input  [`FIRE_J2D_MMU_ADDR_BITS]	j2d_mmu_addr;
  input 				j2d_mmu_addr_vld;
  input					cl2mm_tcr_ack;
  input					cm2mm_rcd_full;
  input  [`FIRE_CSR_ADDR_BITS]		cr2mm_csrbus_addr;
  input  [`FIRE_CSR_SRCB_BITS]		cr2mm_csrbus_src_bus;
  input 				cr2mm_csrbus_valid;
  input 				cr2mm_csrbus_wr;
  input  [`FIRE_CSR_DATA_BITS]		cr2mm_csrbus_wr_data;
  input  [`FIRE_DLC_DBG_SEL_BITS]	cr2mm_dbg_sel_a;
  input  [`FIRE_DLC_DBG_SEL_BITS]	cr2mm_dbg_sel_b;
  input  [`FIRE_DLC_TDR_BITS]		cl2mm_tdr_rcd;
  input 				cl2mm_tdr_vld;
  input  [`FIRE_DLC_SRM_BITS]		rm2mm_rcd;
  input					rm2mm_rcd_enq;

//  output 				d2j_tsb_enable;
//  output [`FIRE_D2J_TSB_BASE_BITS]	d2j_tsb_base;
//  output [`FIRE_D2J_TSB_SIZE_BITS]	d2j_tsb_size;
  output [`FIRE_DLC_TCR_BITS]		mm2cl_tcr_rcd;
  output 				mm2cl_tcr_req;
  output [`FIRE_DLC_ISR_BITS]		mm2cm_rcd;
  output 				mm2cm_rcd_enq;
  output				mm2cr_csrbus_acc_vio;
  output				mm2cr_csrbus_done;
  output				mm2cr_csrbus_mapped;
  output [`FIRE_CSR_DATA_BITS]		mm2cr_csrbus_read_data;
  output [`FIRE_DBG_DATA_BITS]		mm2cr_dbg_a;
  output [`FIRE_DBG_DATA_BITS]		mm2cr_dbg_b;
  output 				mm2im_int;
  output				mm2rm_rcd_full;
  input					dsn_dmc_iei;

  input         dmu_cb0_run;
  input [5:0]   dmu_cb0_addr;
  input [32:0]  dmu_cb0_wdata_key;
  input         dmu_cb0_mmu_ptb_wr_en;
  input         dmu_cb0_mmu_ptb_rd_en;
  input         dmu_cb0_mmu_ptb_lkup_en;
  output [63:0] mmu_ptb_hit;
  input         dmu_cb0_mmu_vtb_wr_en;
  input         dmu_cb0_mmu_vtb_rd_en;
  input         dmu_cb0_mmu_vtb_lkup_en;
  input         dmu_cb0_hld;
  output [63:0] mmu_vtb_hit;
  output [3:0]  vtb_dout_4msb;
  output [32:0] ptb2csr_rd2;
  output [`FIRE_DLC_MMU_VTR_BITS] 	vtb2csr_rd;

  output [`FIRE_CSR_DATA_BITS]          dev_iotsb2csr_rd;
  input         dmu_mb0_run;
  input [8:0]   dmu_mb0_addr;
  input [7:0]   dmu_mb0_wdata;
  input         dmu_mb0_dev_wr_en;
  input         dmu_mb0_dev_rd_en;
  input         dmu_mb0_tsb_wr_en;
  input         dmu_mb0_tsb_rd_en;
  input         dmu_mb0_tdb_wr_en;
  input         dmu_mb0_tdb_rd_en;
  output [7:0]  tdb_dout_8msb;
  output [`FIRE_DLC_MMU_TDR_BITS]	tdb2csr_rd;
//efu wires
  input         efu_dmu_data ;        // input efu to devtsb
  input         efu_dmu_xfer_en;      // input efu to devtsb
  input         efu_dmu_clr;          // input efu to devtsb
  output        dmu_efu_data;         // output of devtsb to efu
  output        dmu_efu_xfer_en ;     // output of devtsb to efu
  output        csr_sun4v_en ;        // csr bit to enable sun4v mode



// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
//  wire					d2j_tsb_enable;
//  wire [`FIRE_D2J_TSB_BASE_BITS]	d2j_tsb_base;
//  wire [`FIRE_D2J_TSB_SIZE_BITS]	d2j_tsb_size;
  wire [`FIRE_DLC_TCR_BITS]		mm2cl_tcr_rcd;
  wire					mm2cl_tcr_req;
  wire [`FIRE_DLC_ISR_BITS]		mm2cm_rcd;
  wire					mm2cm_rcd_enq;
  wire					mm2cr_csrbus_acc_vio;
  wire					mm2cr_csrbus_done;
  wire					mm2cr_csrbus_mapped;
  wire [`FIRE_CSR_DATA_BITS]		mm2cr_csrbus_read_data;
  wire [`FIRE_DBG_DATA_BITS]		mm2cr_dbg_a;
  wire [`FIRE_DBG_DATA_BITS]		mm2cr_dbg_b;
  wire					mm2im_int;
  wire					mm2rm_rcd_full;

  wire [`FIRE_DBG_DATA_BITS]		crb2csr_dbg_a;
  wire [`FIRE_DBG_DATA_BITS]		crb2csr_dbg_b;
  wire [`FIRE_DLC_MMU_VTC_BITS]		crb2csr_rd;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	crb2tcb_tag;
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
  wire [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2qcb_ds_a;
  wire [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2qcb_ds_b;
  wire					csr2rcb_se;
//  wire [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2rcb_tb;
//  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2rcb_ts;
  wire					csr2tcb_av;
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
  wire 					csr2tlb_ps;
  wire [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2tlb_tb;
  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2tlb_ts;
  wire					csr2vab_ps;
  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2vab_ts;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2vtb_ra;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2vtb_wa;
  wire [`FIRE_DLC_MMU_VTR_BITS]		csr2vtb_wd;
  wire					csr2vtb_we;
  wire 					irb2qcb_enq;
  wire [`FIRE_DLC_MMU_RDR_BITS]		irb2rdq_rcd;
  wire [`FIRE_DLC_MMU_VAR_BITS]		irb2vaq_rcd;
  wire					orb2qcb_full;
  wire [`FIRE_DLC_MMU_PAR_BITS]		pab2paq_rcd;
  wire [`FIRE_DLC_MMU_PAB_ERR_BITS]	pab2tcb_err;
  wire [`FIRE_DLC_MMU_PAR_BITS]		paq2orb_rcd;
  wire [24:0]				ptb2csr_rd1;
  wire [5:0]	   	                ptb2csr_rd3;
  wire					ptb2tcb_hit;
  wire [`FIRE_DLC_MMU_TAG_BITS]		ptb2vtb_inv;
  wire [`FIRE_DBG_DATA_BITS]		qcb2csr_dbg_a;
  wire [`FIRE_DBG_DATA_BITS]		qcb2csr_dbg_b;
  wire					qcb2csr_paq;
  wire					qcb2csr_vaq;
  wire					qcb2irb_full;
  wire					qcb2orb_enq;
  wire [`FIRE_DLC_MMU_PAQ_DPTH-1:0]	qcb2paq_ld;
  wire [`FIRE_DLC_MMU_PAQ_DPTH-2:0]	qcb2paq_ds;
  wire [`FIRE_DLC_MMU_RDQ_DPTH-1:0]	qcb2rdq_ld;
  wire [`FIRE_DLC_MMU_RDQ_DPTH-2:0]	qcb2rdq_ds;
  wire					qcb2tcb_hld;
  wire					qcb2tcb_vld;
  wire [`FIRE_DLC_MMU_VAQ_DPTH-1:0]	qcb2vaq_ld;
  wire [`FIRE_DLC_MMU_VAQ_DPTH-2:0]	qcb2vaq_ds;
  wire [`FIRE_DLC_MMU_PTD_TAG_BITS]	rcb2ptb_addr;
  wire 					rcb2ptb_vld;
  wire 					rcb2tcb_ack;
  wire [`FIRE_DLC_MMU_RCB_ERR_BITS]	rcb2tcb_err;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	rcb2tcb_tag;
  wire 					rcb2tcb_vld;
  wire [`FIRE_DLC_MMU_TDR_DATA_BITS]	rcb2tlb_dhi;
  wire [`FIRE_DLC_MMU_TDR_DATA_BITS]	rcb2tlb_dlo;
  wire [`FIRE_DLC_MMU_RDR_BITS]		rdq2orb_rcd;
  wire					tcb2crb_req;
  wire [`FIRE_DBG_DATA_BITS]		tcb2csr_dbg_a;
  wire [`FIRE_DBG_DATA_BITS]		tcb2csr_dbg_b;
  wire [`FIRE_DLC_MMU_CSR_ERR_BITS]	tcb2csr_err;
  wire [`FIRE_DLC_MMU_TCB_PRF_BITS]	tcb2csr_prf;
  wire [`FIRE_DLC_MMU_CSR_CM_BITS]	tcb2csr_tcm;
  wire					tcb2csr_tip;
  wire					tcb2csr_tpl;
  wire					tcb2pab_err;
  wire					tcb2pab_sel;
  wire					tcb2ptb_sel;
  wire					tcb2ptb_vld;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2ptb_wa;
  wire					tcb2ptb_we;
  wire					tcb2qcb_hld;
  wire [`FIRE_DLC_MMU_PLS_DPTH:1]	tcb2qcb_vld;
  wire 					tcb2rcb_req;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2rcb_tag;
  wire					tcb2tdb_sel;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	tcb2tdb_wa;
  wire					tcb2tdb_we;
  wire					tcb2tlb_dld;
  wire					tcb2tlb_hld;
  wire [`FILE_DLC_MMU_TTE_CNT_BITS]	tcb2tlb_ra;
  wire					tcb2tlb_ras;
  wire					tcb2tlb_sel;
  wire					tcb2tlb_tld;
  wire					tcb2vab_hld;
  wire					tcb2vtb_hld;
  wire					tcb2vtb_sel;
  wire					tcb2vtb_tmv;
  wire					tcb2vtb_vld;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2vtb_wa;
  wire					tcb2vtb_we;
  wire [`FIRE_DLC_MMU_TDR_BITS]		tdb2csr_rd;
  wire [`FIRE_DLC_MMU_TDD_PAR_BITS]	tdb2pab_par;
  wire [`FIRE_DLC_MMU_TDD_PPN_BITS]	tdb2pab_ppn;
  wire					tdb2pab_vld;
  wire					tdb2pab_wrt;
  wire [`FIRE_DLC_MMU_VA_ADDR_BITS]	tlb2csr_addr;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	tlb2csr_dbra;
  wire [`FIRE_DLC_MMU_VA_RQID_BITS]	tlb2csr_rqid;
  wire [`FIRE_DLC_MMU_VA_TYPE_BITS]	tlb2csr_type;
  wire [`FIRE_DLC_MMU_PA_ADDR_BITS]	tlb2pab_addr;
  wire [`FIRE_DLC_MMU_PA_TYPE_BITS]	tlb2pab_type;
  wire					tlb2pab_vld;
  wire					tlb2pab_wrt;
  wire [`FIRE_DLC_MMU_PTD_TAG_BITS]	tlb2ptb_addr;
  wire [`FIRE_DLC_MMU_PTD_TAG_BITS]	tlb2rcb_addr;
  wire					tlb2tcb_hit;
  wire [`FIRE_DLC_MMU_TDR_MINUS_PAR_BITS]		tlb2tdb_data;
  wire [`FIRE_DLC_MMU_VTD_VPN_BITS]	tlb2vtb_addr;
  wire [`FIRE_DLC_MMU_VAB_ERR_BITS]	vab2tcb_err;
  wire [`FIRE_DLC_MMU_VAB_VLD_BITS]	vab2tcb_vld;
  wire [`FIRE_DLC_MMU_VA_ADDR_BITS]	vab2tlb_addr;
  wire [`FIRE_DLC_MMU_VA_RQID_BITS]	vab2tlb_rqid;
  wire [`FIRE_DLC_MMU_VA_TYPE_BITS]	vab2tlb_type;
  wire [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	vab2tlb_iotsbno;
  wire [`FIRE_DLC_MMU_VTD_VPN_BITS]	vab2vtb_addr;
  wire [`FILE_DLC_MMU_TTE_CNT_BITS]	vab2vtb_dbra;
  wire [`FIRE_DLC_MMU_VAR_BITS]		vaq2vab_rcd;
  wire [`FIRE_DLC_MMU_TAG_BITS]		vtb2crb_hit;
  wire 					vtb2crb_inv;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	vtb2crb_tag;
  wire [`FIRE_DLC_MMU_TAG_BITS]		vtb2crb_vld;
  wire 					vtb2csr_prf;
  wire [`FIRE_DLC_MMU_VTR_BITS] 	vtb2csr_rd;
  wire 					vtb2tcb_hit;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	vtb2tdb_dbra;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	vtb2tlb_dbra;
//N2 wire statements
  wire	[`FIRE_DLC_MMU_VAR_IOTSB_BITS]	vaq2vab_iotsbno;
  wire	[`FIRE_DLC_MMU_IOTSB_BSPA_BITS]	vaq2vab_tsbbpa;
  wire	[`FIRE_DLC_MMU_VAR_IOTSB_BITS]	vab2vtb_iotsbno;
  wire	[`FIRE_DLC_MMU_IOTSB_BSPA_BITS]	vab2tlb_tsbbpa;
  wire	[2:0]				vab2tlb_sun4v_pgsz;
  wire	[`FIRE_DLC_MMU_VAR_IOTSB_BITS]	tlb2vtb_iotsbno;
  wire   [`FIRE_CSR_DATA_BITS]          csr2dev_iotsb_wd;
  wire                                  csr2dev2iotsb_we;
  wire                                  csr2dev2iotsb_re;
  wire                                  csr2IotsbDesc_we;
  wire                                  csr2IotsbDesc_re;
  wire   [4:0]                          csr2dev_iotsb_rwa;
  wire   [`FIRE_CSR_DATA_BITS]          dev_iotsb2csr_rd;
  wire 					csr_busid_sel;
  wire 					csr_sun4v_en;
  wire 					csr_done;
  wire 					vaq2tcb_deq_en;
  wire					tdb2pab_keyvld;
  wire   [`FIRE_DLC_MMU_TDD_FNM_BITS]   tdb2pab_fnm;
  wire   [`FIRE_DLC_MMU_TDD_KEY_BITS]   tdb2pab_key;

  wire   [3:0]   			srq2vab_np;
  wire   [27:0]   			srq2vab_adva;
  wire   	   			vab2tcb_4vor;
  wire   	   			vab2tcb_s4uf;
  wire   [`FIRE_DLC_MMU_VA_RQID_BITS]	tlb2tdb_rqid;
  wire   	   			tdb2tmc_kerr;
  wire   	   			tlb2tmc_kerr;
  wire   	   			srq2tmc_ipe;
  wire   	   			srq2tmc_ivld;
  wire   [2:0]                          srq2vab_sun4v_pgsz;
  wire   [2:0]                          tlb2pab_sun4v_pgsz;
  wire   [27:0]                         vab2tlb_sun4v_pgnmb;
  wire                                  srq2vab_sun4v_byp_ps0,vab2tcb_sun4v_va_oor,srq2tmc_sun4v_pgsz_err;
  wire					vab2tlb_sun4v_byp_ps1,tlb2pab_byp_ps2;
// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------


// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------

  dmu_mmu_crb crb
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .csr2crb_ds_a		(csr2crb_ds_a),
     .csr2crb_ds_b		(csr2crb_ds_b),
     .csr2crb_ra		(csr2crb_ra),
     .csr2crb_wa		(csr2crb_wa),
     .csr2crb_wd		(csr2crb_wd),
     .csr2crb_we		(csr2crb_we),
     .tcb2crb_req		(tcb2crb_req),
     .vtb2crb_hit		(vtb2crb_hit),
     .vtb2crb_inv		(vtb2crb_inv),
     .vtb2crb_tag		(vtb2crb_tag),
     .vtb2crb_vld		(vtb2crb_vld),
     .crb2csr_dbg_a		(crb2csr_dbg_a),
     .crb2csr_dbg_b		(crb2csr_dbg_b),
     .crb2csr_rd		(crb2csr_rd),
     .crb2tcb_tag		(crb2tcb_tag)
     );

  dmu_mmu_csr csr
    (
     .clk			(clk),
     .por_l			(por_l),
     .rst_l			(rst_l),
     .j2d_instance_id		(j2d_instance_id),
     .cr2mm_csrbus_addr		(cr2mm_csrbus_addr),
     .cr2mm_csrbus_src_bus	(cr2mm_csrbus_src_bus),
     .cr2mm_csrbus_valid	(cr2mm_csrbus_valid),
     .cr2mm_csrbus_wr		(cr2mm_csrbus_wr),
     .cr2mm_csrbus_wr_data	(cr2mm_csrbus_wr_data),
     .cr2mm_dbg_sel_a		(cr2mm_dbg_sel_a),
     .cr2mm_dbg_sel_b		(cr2mm_dbg_sel_b),
     .crb2csr_dbg_a		(crb2csr_dbg_a),
     .crb2csr_dbg_b		(crb2csr_dbg_b),
     .crb2csr_rd		(crb2csr_rd),
     .ptb2csr_rd		({ptb2csr_rd1,ptb2csr_rd2,ptb2csr_rd3}),
     .qcb2csr_dbg_a		(qcb2csr_dbg_a),
     .qcb2csr_dbg_b		(qcb2csr_dbg_b),
     .qcb2csr_paq		(qcb2csr_paq),
     .qcb2csr_vaq		(qcb2csr_vaq),
     .tcb2csr_dbg_a		(tcb2csr_dbg_a),
     .tcb2csr_dbg_b		(tcb2csr_dbg_b),
     .tcb2csr_err		(tcb2csr_err),
     .tcb2csr_prf		(tcb2csr_prf),
     .tcb2csr_tcm		(tcb2csr_tcm),
     .tcb2csr_tip		(tcb2csr_tip),
     .tcb2csr_tpl		(tcb2csr_tpl),
     .tdb2csr_rd		(tdb2csr_rd),
     .tlb2csr_addr		(tlb2csr_addr),
     .tlb2csr_dbra		(tlb2csr_dbra),
     .tlb2csr_rqid		(tlb2csr_rqid),
     .tlb2csr_type		(tlb2csr_type),
     .vtb2csr_prf		(vtb2csr_prf),
     .vtb2csr_rd		(vtb2csr_rd),
     .mm2cr_csrbus_acc_vio	(mm2cr_csrbus_acc_vio),
     .mm2cr_csrbus_done		(mm2cr_csrbus_done),
     .mm2cr_csrbus_mapped	(mm2cr_csrbus_mapped),
     .mm2cr_csrbus_read_data	(mm2cr_csrbus_read_data),
     .mm2cr_dbg_a		(mm2cr_dbg_a),
     .mm2cr_dbg_b		(mm2cr_dbg_b),
     .mm2im_int			(mm2im_int),
     .csr2crb_ds_a		(csr2crb_ds_a),
     .csr2crb_ds_b		(csr2crb_ds_b),
     .csr2crb_ra		(csr2crb_ra),
     .csr2crb_wa		(csr2crb_wa),
     .csr2crb_wd		(csr2crb_wd),
     .csr2crb_we		(csr2crb_we),
     .csr2pab_ps		(csr2pab_ps),
     .csr2ptb_inv		(csr2ptb_inv),
     .csr2ptb_ra		(csr2ptb_ra),
     .csr2ptb_wa		(csr2ptb_wa),
     .csr2ptb_wd		(csr2ptb_wd),
     .csr2ptb_we		(csr2ptb_we),
     .csr2qcb_ds_a		(csr2qcb_ds_a),
     .csr2qcb_ds_b		(csr2qcb_ds_b),
     .csr2rcb_se		(csr2rcb_se),
//     .csr2rcb_tb		(csr2rcb_tb),
//     .csr2rcb_ts		(csr2rcb_ts),
     .csr2tcb_av		(csr2tcb_av),
     .csr2tcb_be		(csr2tcb_be),
     .csr2tcb_cm		(csr2tcb_cm),
     .csr2tcb_ds_a		(csr2tcb_ds_a),
     .csr2tcb_ds_b		(csr2tcb_ds_b),
     .csr2tcb_pd		(csr2tcb_pd),
     .csr2tcb_te		(csr2tcb_te),
     .csr2tdb_ra		(csr2tdb_ra),
     .csr2tdb_wa		(csr2tdb_wa),
     .csr2tdb_wd		(csr2tdb_wd),
     .csr2tdb_we		(csr2tdb_we),
     .csr2tlb_ps		(csr2tlb_ps),
     .csr2tlb_tb		(csr2tlb_tb),
     .csr2tlb_ts		(csr2tlb_ts),
     .csr2vab_ps		(csr2vab_ps),
     .csr2vab_ts		(csr2vab_ts),
     .csr2vtb_ra		(csr2vtb_ra),
     .csr2vtb_wa		(csr2vtb_wa),
     .csr2vtb_wd		(csr2vtb_wd),
     .csr2vtb_we		(csr2vtb_we),
     .csr2dev_iotsb_wd          (csr2dev_iotsb_wd),
     .dev_iotsb2csr_rd          (dev_iotsb2csr_rd),
     .csr2dev2iotsb_we          (csr2dev2iotsb_we),
     .csr2dev2iotsb_re          (csr2dev2iotsb_re),
     .csr2IotsbDesc_we          (csr2IotsbDesc_we),
     .csr2IotsbDesc_re          (csr2IotsbDesc_re),
     .csr2dev_iotsb_rwa         (csr2dev_iotsb_rwa),
     .dev_iotsb_ext_done        (csr_done),
     .ctl_busid_sel_hw_read     (csr_busid_sel),
     .ctl_sun4v_en_hw_read      (csr_sun4v_en)
     );

  dmu_mmu_irb irb
    (
     .rm2mm_rcd			(rm2mm_rcd),
     .rm2mm_rcd_enq		(rm2mm_rcd_enq),
     .qcb2irb_full		(qcb2irb_full),
     .mm2rm_rcd_full		(mm2rm_rcd_full),
     .irb2qcb_enq		(irb2qcb_enq),
     .irb2rdq_rcd		(irb2rdq_rcd),
     .irb2vaq_rcd		(irb2vaq_rcd)
     );

  dmu_mmu_orb orb
    (
     .cm2mm_rcd_full		(cm2mm_rcd_full),
     .qcb2orb_enq		(qcb2orb_enq),
     .rdq2orb_rcd		(rdq2orb_rcd),
     .paq2orb_rcd		(paq2orb_rcd),
     .mm2cm_rcd			(mm2cm_rcd),
     .mm2cm_rcd_enq		(mm2cm_rcd_enq),
     .orb2qcb_full		(orb2qcb_full)
     );

  dmu_mmu_pab pab
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .csr2pab_ps		(csr2pab_ps),
     .tcb2pab_err		(tcb2pab_err),
     .tcb2pab_sel		(tcb2pab_sel),
     .tdb2pab_par		(tdb2pab_par),
     .tdb2pab_ppn		(tdb2pab_ppn),
     .tdb2pab_wrt		(tdb2pab_wrt),
     .tdb2pab_vld		(tdb2pab_vld),
     .tdb2pab_keyvld            (tdb2pab_keyvld),
     .tdb2pab_fnm               (tdb2pab_fnm),
     .tdb2pab_key               (tdb2pab_key),
     .tlb2pab_addr		(tlb2pab_addr),
     .tlb2pab_type		(tlb2pab_type),
     .tlb2pab_vld		(tlb2pab_vld),
     .tlb2pab_wrt		(tlb2pab_wrt),
     .pab2paq_rcd		(pab2paq_rcd),
     .pab2tcb_err		(pab2tcb_err),
     .tlb2pab_sun4v_pgsz	(tlb2pab_sun4v_pgsz[2:0]),
     .sun4v_mode		(csr_sun4v_en),
     .tlb2pab_byp_ps2		(tlb2pab_byp_ps2)
     );

  dmu_mmu_ptb ptb
    (
     .l2clk			(l2clk),
     .clk			(clk),
     .rst_l			(rst_l),
     .scan_in                   (scan_in),
     .tcu_array_bypass          (tcu_array_bypass),
     .tcu_se_scancollar_in      (tcu_se_scancollar_in),
     .tcu_scan_en        	(tcu_scan_en),
     .tcu_array_wr_inhibit      (tcu_array_wr_inhibit),
     .tcu_pce_ov                (tcu_pce_ov),
     .tcu_aclk                  (tcu_aclk),
     .tcu_bclk                  (tcu_bclk),
     .scan_out                  (scan_out),

     .csr2ptb_inv		(csr2ptb_inv),
     .csr2ptb_ra		(csr2ptb_ra),
     .csr2ptb_wa		(csr2ptb_wa),
     .csr2ptb_wd		(csr2ptb_wd),
     .csr2ptb_we		(csr2ptb_we),
     .rcb2ptb_addr		(rcb2ptb_addr),
     .rcb2ptb_vld		(rcb2ptb_vld),
     .tcb2ptb_sel		(tcb2ptb_sel),
     .tcb2ptb_vld		(tcb2ptb_vld),
     .tcb2ptb_wa		(tcb2ptb_wa),
     .tcb2ptb_we		(tcb2ptb_we),
     .tlb2ptb_addr		(tlb2ptb_addr),
     .ptb2csr_rd		({ptb2csr_rd1,ptb2csr_rd2,ptb2csr_rd3}),
     .ptb2tcb_hit		(ptb2tcb_hit),
     .ptb2vtb_inv		(ptb2vtb_inv),
     .dmu_cb0_run               (dmu_cb0_run),
     .dmu_cb0_addr              (dmu_cb0_addr),
     .dmu_cb0_wdata_key         (dmu_cb0_wdata_key),
     .dmu_cb0_mmu_ptb_wr_en     (dmu_cb0_mmu_ptb_wr_en),
     .dmu_cb0_mmu_ptb_rd_en     (dmu_cb0_mmu_ptb_rd_en),
     .dmu_cb0_mmu_ptb_lkup_en   (dmu_cb0_mmu_ptb_lkup_en),
     .mmu_ptb_hit               (mmu_ptb_hit)

     );

  dmu_mmu_qcb qcb
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .csr2qcb_ds_a		(csr2qcb_ds_a),
     .csr2qcb_ds_b		(csr2qcb_ds_b),
     .irb2qcb_enq		(irb2qcb_enq),
     .orb2qcb_full		(orb2qcb_full),
     .tcb2qcb_hld		(tcb2qcb_hld),
     .tcb2qcb_vld		(tcb2qcb_vld),
     .qcb2csr_dbg_a		(qcb2csr_dbg_a),
     .qcb2csr_dbg_b		(qcb2csr_dbg_b),
     .qcb2csr_paq		(qcb2csr_paq),
     .qcb2csr_vaq		(qcb2csr_vaq),
     .qcb2irb_full		(qcb2irb_full),
     .qcb2orb_enq		(qcb2orb_enq),
     .qcb2paq_ld		(qcb2paq_ld),
     .qcb2paq_ds		(qcb2paq_ds),
     .qcb2rdq_ld		(qcb2rdq_ld),
     .qcb2rdq_ds		(qcb2rdq_ds),
     .qcb2tcb_hld		(qcb2tcb_hld),
     .qcb2tcb_vld		(qcb2tcb_vld),
     .qcb2vaq_ld		(qcb2vaq_ld),
     .qcb2vaq_ds		(qcb2vaq_ds)
     );

  dmu_mmu_rcb rcb
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .j2d_mmu_addr		(j2d_mmu_addr),
     .j2d_mmu_addr_vld		(j2d_mmu_addr_vld),
     .cl2mm_tcr_ack		(cl2mm_tcr_ack),
     .cl2mm_tdr_rcd		(cl2mm_tdr_rcd),
     .cl2mm_tdr_vld		(cl2mm_tdr_vld),
     .csr2rcb_se		(csr2rcb_se),
//     .csr2rcb_tb		(csr2rcb_tb),
//     .csr2rcb_ts		(csr2rcb_ts),
     .tcb2rcb_tag		(tcb2rcb_tag),
     .tcb2rcb_req		(tcb2rcb_req),
     .tlb2rcb_addr		(tlb2rcb_addr),
//     .d2j_tsb_enable		(d2j_tsb_enable),
//     .d2j_tsb_base		(d2j_tsb_base),
//     .d2j_tsb_size		(d2j_tsb_size),
     .mm2cl_tcr_rcd		(mm2cl_tcr_rcd),
     .mm2cl_tcr_req		(mm2cl_tcr_req),
     .rcb2ptb_addr		(rcb2ptb_addr),
     .rcb2ptb_vld		(rcb2ptb_vld),
     .rcb2tcb_ack		(rcb2tcb_ack),
     .rcb2tcb_err		(rcb2tcb_err),
     .rcb2tcb_tag		(rcb2tcb_tag),
     .rcb2tcb_vld		(rcb2tcb_vld),
     .rcb2tlb_dhi		(rcb2tlb_dhi),
     .rcb2tlb_dlo		(rcb2tlb_dlo)
     );

  dmu_mmu_srq #(`FIRE_DLC_MMU_PAQ_DPTH, `FIRE_DLC_MMU_PAR_WDTH) paq
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .ld			(qcb2paq_ld),
     .ds			(qcb2paq_ds),
     .di			(pab2paq_rcd),
     .do			(paq2orb_rcd)
     );

  dmu_mmu_srq #(`FIRE_DLC_MMU_RDQ_DPTH, `FIRE_DLC_MMU_RDR_WDTH) rdq
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .ld			(qcb2rdq_ld),
     .ds			(qcb2rdq_ds),
     .di			(irb2rdq_rcd),
     .do			(rdq2orb_rcd)
     );

//  dmu_mmu_srq #(`FIRE_DLC_MMU_VAQ_DPTH, `FIRE_DLC_MMU_VAR_WDTH) vaq
  dmu_mmu_srq_iommu #(`FIRE_DLC_MMU_VAQ_DPTH, `FIRE_DLC_MMU_VAR_WDTH) vaq
    (
     .l2clk			(l2clk),
     .clk			(clk),
     .rst_l			(rst_l),
     .por_l			(por_l),
     .scan_in                     (scan_in),
     .tcu_array_bypass            (tcu_array_bypass),
     .tcu_scan_en            	  (tcu_scan_en),
     .tcu_se_scancollar_in        (tcu_se_scancollar_in),
     .tcu_array_wr_inhibit        (tcu_array_wr_inhibit),
     .tcu_pce_ov                  (tcu_pce_ov),
     .tcu_aclk                    (tcu_aclk),
     .tcu_bclk                    (tcu_bclk),
     .scan_out                    (),

     .ld			(qcb2vaq_ld),
     .ds			(qcb2vaq_ds),
     .di			(irb2vaq_rcd),
     .sun4v_mode		(csr_sun4v_en),
     .srq2vab_sun4v_pgsz	(srq2vab_sun4v_pgsz[2:0]),
     .srq2vab_sun4v_byp_ps0	(srq2vab_sun4v_byp_ps0),
     .srq2tmc_sun4v_pgsz_err	(srq2tmc_sun4v_pgsz_err),
     .do			(vaq2vab_rcd),
     .iotsbno			(vaq2vab_iotsbno),
     .iotsb_basepa		(vaq2vab_tsbbpa),
     .srq2vab_np		(srq2vab_np),
     .srq2vab_adva		(srq2vab_adva),
     .srq2tmc_ipe		(srq2tmc_ipe),
     .srq2tmc_ivld		(srq2tmc_ivld),
     .csr2dev_iotsb_wd          (csr2dev_iotsb_wd),
     .dev_iotsb2csr_rd          (dev_iotsb2csr_rd),
     .csr2dev2iotsb_we          (csr2dev2iotsb_we),
     .csr2dev2iotsb_re          (csr2dev2iotsb_re),
     .csr2IotsbDesc_we          (csr2IotsbDesc_we),
     .csr2IotsbDesc_re          (csr2IotsbDesc_re),
     .csr2dev_iotsb_rwa         (csr2dev_iotsb_rwa),
     .busid_sel                 (csr_busid_sel),
     .lkup_deque_en             (vaq2tcb_deq_en),
     .csr_done                  (csr_done),
     .dsn_dmc_iei               (dsn_dmc_iei),
     .dmu_mb0_run 		(dmu_mb0_run),
     .dmu_mb0_addr		(dmu_mb0_addr[4:0]),
     .dmu_mb0_wdata		(dmu_mb0_wdata),
     .dmu_mb0_dev_wr_en		(dmu_mb0_dev_wr_en),
     .dmu_mb0_dev_rd_en		(dmu_mb0_dev_rd_en),
     .dmu_mb0_tsb_wr_en		(dmu_mb0_tsb_wr_en),
     .dmu_mb0_tsb_rd_en		(dmu_mb0_tsb_rd_en),
// efu wires
     .efu_dmu_data              (efu_dmu_data),        // input efu to devtsb
     .efu_dmu_xfer_en           (efu_dmu_xfer_en),     // input efu to devtsb
     .efu_dmu_clr               (efu_dmu_clr),         // input efu to devtsb
     .dmu_efu_data              (dmu_efu_data),        // output of devtsb to efu
     .dmu_efu_xfer_en           (dmu_efu_xfer_en)      // output of devtsb to efu
     );

  dmu_mmu_tcb tcb
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .crb2tcb_tag		(crb2tcb_tag),
     .csr2tcb_av		(csr2tcb_av),
     .csr2tcb_be		(csr2tcb_be),
     .csr2tcb_cm		(csr2tcb_cm),
     .csr2tcb_ds_a		(csr2tcb_ds_a),
     .csr2tcb_ds_b		(csr2tcb_ds_b),
     .csr2tcb_pd		(csr2tcb_pd),
     .csr2tcb_te		(csr2tcb_te),
     .pab2tcb_err		(pab2tcb_err),
     .ptb2tcb_hit		(ptb2tcb_hit),
     .rcb2tcb_ack		(rcb2tcb_ack),
     .rcb2tcb_err		(rcb2tcb_err),
     .rcb2tcb_tag		(rcb2tcb_tag),
     .rcb2tcb_vld		(rcb2tcb_vld),
     .tlb2tcb_hit		(tlb2tcb_hit),
     .vab2tcb_err		(vab2tcb_err),
     .vab2tcb_vld		(vab2tcb_vld),
     .vab2tcb_sun4v_va_oor	(vab2tcb_sun4v_va_oor),
     .vab2tcb_4vor              (vab2tcb_4vor),
     .vab2tcb_s4uf              (vab2tcb_s4uf),
     .qcb2tcb_hld		(qcb2tcb_hld),
     .qcb2tcb_vld		(qcb2tcb_vld),
     .vtb2tcb_hit		(vtb2tcb_hit),
     .tcb2crb_req		(tcb2crb_req),
     .tcb2csr_dbg_a		(tcb2csr_dbg_a),
     .tcb2csr_dbg_b		(tcb2csr_dbg_b),
     .tcb2csr_err		(tcb2csr_err),
     .tcb2csr_prf		(tcb2csr_prf),
     .tcb2csr_tcm		(tcb2csr_tcm),
     .tcb2csr_tip		(tcb2csr_tip),
     .tcb2csr_tpl		(tcb2csr_tpl),
     .tcb2pab_err		(tcb2pab_err),
     .tcb2pab_sel		(tcb2pab_sel),
     .tcb2ptb_sel		(tcb2ptb_sel),
     .tcb2ptb_vld		(tcb2ptb_vld),
     .tcb2ptb_wa		(tcb2ptb_wa),
     .tcb2ptb_we		(tcb2ptb_we),
     .tcb2qcb_hld		(tcb2qcb_hld),
     .tcb2qcb_vld		(tcb2qcb_vld),
     .tcb2rcb_req		(tcb2rcb_req),
     .tcb2rcb_tag		(tcb2rcb_tag),
     .tcb2tdb_sel		(tcb2tdb_sel),
     .tcb2tdb_wa		(tcb2tdb_wa),
     .tcb2tdb_we		(tcb2tdb_we),
     .tcb2tlb_dld		(tcb2tlb_dld),
     .tcb2tlb_hld		(tcb2tlb_hld),
     .tcb2tlb_ra		(tcb2tlb_ra),
     .tcb2tlb_ras		(tcb2tlb_ras),
     .tcb2tlb_sel		(tcb2tlb_sel),
     .tcb2tlb_tld		(tcb2tlb_tld),
     .tcb2vab_hld		(tcb2vab_hld),
     .tcb2vtb_hld		(tcb2vtb_hld),
     .tcb2vtb_sel		(tcb2vtb_sel),
     .tcb2vtb_tmv		(tcb2vtb_tmv),
     .tcb2vtb_vld		(tcb2vtb_vld),
     .tcb2vtb_wa		(tcb2vtb_wa),
     .vaq2tcb_deq_en            (vaq2tcb_deq_en),
     .tcb2vtb_we		(tcb2vtb_we),
     .tdb2tmc_kerr		(tdb2tmc_kerr),
     .tlb2tmc_kerr		(tlb2tmc_kerr),
     .srq2tmc_ipe		(srq2tmc_ipe),
     .srq2tmc_ivld		(srq2tmc_ivld),
     .sun4v_mode		(csr_sun4v_en),
     .srq2tmc_sun4v_pgsz_err	(srq2tmc_sun4v_pgsz_err)
     );

  dmu_mmu_tdb tdb
    (
     .l2clk			(l2clk),
     .clk			(clk),
     .scan_in                     (scan_in),
     .tcu_array_bypass            (tcu_array_bypass),
     .tcu_scan_en        	  (tcu_scan_en),
     .tcu_se_scancollar_in        (tcu_se_scancollar_in),
     .tcu_array_wr_inhibit        (tcu_array_wr_inhibit),
     .tcu_pce_ov                  (tcu_pce_ov),
     .tcu_aclk                    (tcu_aclk),
     .tcu_bclk                    (tcu_bclk),
     .scan_out                    (),

     .csr2tdb_ra		(csr2tdb_ra),
     .csr2tdb_wa		(csr2tdb_wa),
     .csr2tdb_wd		(csr2tdb_wd),
     .csr2tdb_we		(csr2tdb_we),
     .tcb2tdb_sel		(tcb2tdb_sel),
     .tcb2tdb_wa		(tcb2tdb_wa),
     .tcb2tdb_we		(tcb2tdb_we),
     .tlb2tdb_data		(tlb2tdb_data),
     .tlb2tdb_rqid		(tlb2tdb_rqid),
     .vtb2tdb_dbra		(vtb2tdb_dbra),
     .tdb2csr_rd		(tdb2csr_rd),
     .tdb2pab_par		(tdb2pab_par),
     .tdb2pab_ppn		(tdb2pab_ppn),
     .tdb2pab_vld		(tdb2pab_vld),
     .tdb2pab_keyvld		(tdb2pab_keyvld),
     .tdb2pab_fnm		(tdb2pab_fnm),
     .tdb2pab_key		(tdb2pab_key),
     .tdb2pab_wrt		(tdb2pab_wrt),
     .tdb2tmc_kerr		(tdb2tmc_kerr),
     .dsn_dmc_iei		(dsn_dmc_iei),
     .tdb_dout_8msb		(tdb_dout_8msb),
     .dmu_mb0_run		(dmu_mb0_run),
     .dmu_mb0_addr		(dmu_mb0_addr),
     .dmu_mb0_wdata		(dmu_mb0_wdata),
     .dmu_mb0_tdb_wr_en		(dmu_mb0_tdb_wr_en),
     .dmu_mb0_tdb_rd_en		(dmu_mb0_tdb_rd_en)
     );

  dmu_mmu_tlb tlb
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .csr2tlb_ps		(csr2tlb_ps),
     .csr2tlb_tb		(csr2tlb_tb),
     .csr2tlb_ts		(csr2tlb_ts),
     .rcb2tlb_dhi		(rcb2tlb_dhi),
     .rcb2tlb_dlo		(rcb2tlb_dlo),
     .tcb2tlb_dld		(tcb2tlb_dld),
     .tcb2tlb_hld		(tcb2tlb_hld),
     .tcb2tlb_ra		(tcb2tlb_ra),
     .tcb2tlb_ras		(tcb2tlb_ras),
     .tcb2tlb_sel		(tcb2tlb_sel),
     .tcb2tlb_tld		(tcb2tlb_tld),
     .vab2tlb_addr		(vab2tlb_addr),
     .vab2tlb_rqid		(vab2tlb_rqid),
     .tlb2tdb_rqid		(tlb2tdb_rqid),
     .vab2tlb_type		(vab2tlb_type),
     .vab2tlb_iotsbno		(vab2tlb_iotsbno),
     .vab2tlb_tsbbpa		(vab2tlb_tsbbpa),
     .vab2tlb_sun4v_pgnmb	(vab2tlb_sun4v_pgnmb),
     .vab2tlb_sun4v_pgsz	(vab2tlb_sun4v_pgsz),
     .vtb2tlb_dbra		(vtb2tlb_dbra),
     .tlb2csr_addr		(tlb2csr_addr),
     .tlb2csr_dbra		(tlb2csr_dbra),
     .tlb2csr_rqid		(tlb2csr_rqid),
     .tlb2csr_type		(tlb2csr_type),
     .tlb2pab_addr		(tlb2pab_addr),
     .tlb2pab_sun4v_pgsz	(tlb2pab_sun4v_pgsz[2:0]),
     .tlb2pab_type		(tlb2pab_type),
     .tlb2pab_vld		(tlb2pab_vld),
     .tlb2pab_wrt		(tlb2pab_wrt),
     .tlb2ptb_addr		(tlb2ptb_addr),
     .tlb2rcb_addr		(tlb2rcb_addr),
     .tlb2tcb_hit		(tlb2tcb_hit),
     .tlb2tdb_data		(tlb2tdb_data),
     .tlb2vtb_addr		(tlb2vtb_addr),
     .tlb2vtb_iotsbno		(tlb2vtb_iotsbno),
     .sun4v_mode		(csr_sun4v_en),
     .tlb2tmc_kerr		(tlb2tmc_kerr),
     .tlb2pab_byp_ps2		(tlb2pab_byp_ps2),
     .vab2tlb_sun4v_byp_ps1	(vab2tlb_sun4v_byp_ps1)
     );

  dmu_mmu_vab vab
    (
     .clk			(clk),
     .rst_l			(rst_l),
     .csr2vab_ps		(csr2vab_ps),
     .csr2vab_ts		(csr2vab_ts),
     .tcb2vab_hld		(tcb2vab_hld),
     .vaq2vab_rcd		(vaq2vab_rcd),
     .vaq2vab_iotsbno		(vaq2vab_iotsbno),
     .vaq2vab_tsbbpa		(vaq2vab_tsbbpa),
     .srq2vab_np		(srq2vab_np),
     .srq2vab_adva		(srq2vab_adva),
     .srq2vab_sun4v_pgsz	(srq2vab_sun4v_pgsz[2:0]),
     .srq2vab_sun4v_byp_ps0	(srq2vab_sun4v_byp_ps0),
     .vab2tcb_err		(vab2tcb_err),
     .vab2tcb_vld		(vab2tcb_vld),
     .vab2tcb_sun4v_va_oor	(vab2tcb_sun4v_va_oor),
     .vab2tcb_4vor		(vab2tcb_4vor),
     .vab2tcb_s4uf		(vab2tcb_s4uf),
     .vab2tlb_addr		(vab2tlb_addr),
     .vab2tlb_rqid		(vab2tlb_rqid),
     .vab2tlb_type		(vab2tlb_type),
     .vab2tlb_iotsbno		(vab2tlb_iotsbno),
     .vab2tlb_tsbbpa		(vab2tlb_tsbbpa),
     .vab2tlb_sun4v_pgnmb	(vab2tlb_sun4v_pgnmb),
     .vab2tlb_sun4v_pgsz	(vab2tlb_sun4v_pgsz),
     .vab2vtb_addr		(vab2vtb_addr),
     .vab2vtb_dbra		(vab2vtb_dbra),
     .vab2vtb_iotsbno		(vab2vtb_iotsbno),
     .sun4v_mode		(csr_sun4v_en),
     .vab2tlb_sun4v_byp_ps1	(vab2tlb_sun4v_byp_ps1)
     );

  dmu_mmu_vtb vtb
    (
     .l2clk			(l2clk),
     .clk			(clk),
     .rst_l			(rst_l),
     .scan_in                   (scan_in),
     .tcu_array_bypass          (tcu_array_bypass),
     .tcu_se_scancollar_in      (tcu_se_scancollar_in),
     .tcu_scan_en        	(tcu_scan_en),
     .tcu_array_wr_inhibit      (tcu_array_wr_inhibit),
     .tcu_pce_ov                (tcu_pce_ov),
     .tcu_aclk                  (tcu_aclk),
     .tcu_bclk                  (tcu_bclk),
     .scan_out                  (),

     .sun4v_mode		(csr_sun4v_en),
     .csr2vtb_ra		(csr2vtb_ra),
     .csr2vtb_wa		(csr2vtb_wa),
     .csr2vtb_wd		(csr2vtb_wd),
     .csr2vtb_we		(csr2vtb_we),
     .ptb2vtb_inv		(ptb2vtb_inv),
     .tcb2vtb_hld		(tcb2vtb_hld),
     .tcb2vtb_sel		(tcb2vtb_sel),
     .tcb2vtb_tmv		(tcb2vtb_tmv),
     .tcb2vtb_vld		(tcb2vtb_vld),
     .tcb2vtb_wa		(tcb2vtb_wa),
     .tcb2vtb_we		(tcb2vtb_we),
     .tlb2vtb_addr		(tlb2vtb_addr),
     .tlb2vtb_iotsbno		(tlb2vtb_iotsbno),
     .vab2vtb_addr		(vab2vtb_addr),
     .vab2vtb_dbra		(vab2vtb_dbra),
     .vab2vtb_iotsbno		(vab2vtb_iotsbno),
     .vtb2crb_hit		(vtb2crb_hit),
     .vtb2crb_inv		(vtb2crb_inv),
     .vtb2crb_tag		(vtb2crb_tag),
     .vtb2crb_vld		(vtb2crb_vld),
     .vtb2csr_prf		(vtb2csr_prf),
     .vtb2csr_rd		(vtb2csr_rd),
     .vtb2tcb_hit		(vtb2tcb_hit),
     .vtb2tdb_dbra		(vtb2tdb_dbra),
     .vtb2tlb_dbra		(vtb2tlb_dbra),
     .dmu_cb0_run               (dmu_cb0_run),
     .dmu_cb0_addr              (dmu_cb0_addr),
     .dmu_cb0_wdata_key         (dmu_cb0_wdata_key),
     .dmu_cb0_mmu_vtb_wr_en     (dmu_cb0_mmu_vtb_wr_en),
     .dmu_cb0_mmu_vtb_rd_en     (dmu_cb0_mmu_vtb_rd_en),
     .dmu_cb0_mmu_vtb_lkup_en   (dmu_cb0_mmu_vtb_lkup_en),
     .dmu_cb0_hld   		(dmu_cb0_hld),
     .mmu_vtb_hit		(mmu_vtb_hit),
     .vtb_dout_4msb             (vtb_dout_4msb)


     );

endmodule // dmu_mmu
