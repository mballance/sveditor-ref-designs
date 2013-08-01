// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_tcb.v
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
module dmu_mmu_tcb 
  (
   clk,				// clock
   rst_l,			// reset
   crb2tcb_tag,			// crb replacement tag
   csr2tcb_av,			// csr access violation
   csr2tcb_be,			// csr bypass enable
   csr2tcb_cm,			// csr cache mode
   csr2tcb_ds_a,		// csr debug select a
   csr2tcb_ds_b,		// csr debug select b
   csr2tcb_pd,			// csr processing disable
   csr2tcb_te,			// csr translation enable
   pab2tcb_err,			// pab errors
   ptb2tcb_hit,			// ptb physical tag hit
   rcb2tcb_ack, 		// rcb acknowledge
   rcb2tcb_err, 		// rcb error
   rcb2tcb_tag,			// rcb tag
   rcb2tcb_vld, 		// rcb valid
   tlb2tcb_hit,			// tlb virtual tag hit
   vab2tcb_err,			// vab errors
   vab2tcb_vld,			// vab valids
   vab2tcb_sun4v_va_oor,	// sun4v va out of range
   vab2tcb_4vor,		// sun4v out of range error
   vab2tcb_s4uf,		// sun4v underflow error
   qcb2tcb_hld,			// qcb hold
   qcb2tcb_vld,			// qcb valid
   vtb2tcb_hit,			// vtb hit
   tcb2crb_req,			// crb request
   tcb2csr_dbg_a,		// csr debug bus a
   tcb2csr_dbg_b,		// csr debug bus b
   tcb2csr_err, 		// csr errors
   tcb2csr_prf, 		// csr performance events
   tcb2csr_tcm,			// csr tablewalk cache mode
   tcb2csr_tip,			// csr tablewalk in progress
   tcb2csr_tpl,			// csr translation pipeline not empty
   tcb2pab_err,			// pab error
   tcb2pab_sel,			// pab select
   tcb2ptb_sel,			// ptb select
   tcb2ptb_vld,			// ptb valid
   tcb2ptb_wa,			// ptb write address
   tcb2ptb_we,			// ptb write enable
   tcb2qcb_hld,			// qcb hold
   tcb2qcb_vld,			// qcb valids
   tcb2rcb_req, 		// rcb request
   tcb2rcb_tag,			// rcb tag
   tcb2tdb_sel,			// tdb select
   tcb2tdb_wa,			// tdb write address
   tcb2tdb_we,			// tdb write enable
   tcb2tlb_dld,			// tlb data load
   tcb2tlb_hld,			// tlb holds
   tcb2tlb_ra,			// tlb read address
   tcb2tlb_ras,			// tlb read address select
   tcb2tlb_sel,			// tlb select
   tcb2tlb_tld,			// tlb tag load
   tcb2vab_hld,			// vab hold
   tcb2vtb_hld,			// vtb holds
   tcb2vtb_sel,			// vtb select
   tcb2vtb_tmv,			// vtb translation mode valid
   tcb2vtb_vld,			// vtb valid
   tcb2vtb_wa,			// vtb write address
   vaq2tcb_deq_en,
   tcb2vtb_we,			// vtb write enable
   tdb2tmc_kerr,		// tdb key error on ppn readout from tdb ram readout
   tlb2tmc_kerr,		// tdb key error on ppn readout from single entry tlb
   srq2tmc_ipe,			// iotsb parity error
   srq2tmc_ivld,		// iotsb valid bit and'ed with sun4v_mode
   sun4v_mode,			// 1= sun4v_mode
   srq2tmc_sun4v_pgsz_err	// 1 = sun4v_mode illegal page size
   );

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input 		 		clk;
  input 		 		rst_l;

  input [`FIRE_DLC_MMU_TAG_PTR_BITS]	crb2tcb_tag;
  input 				csr2tcb_av;
  input 				csr2tcb_be;
  input [`FIRE_DLC_MMU_CSR_CM_BITS]	csr2tcb_cm;
  input [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2tcb_ds_a;
  input [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2tcb_ds_b;
  input 				csr2tcb_pd;
  input 				csr2tcb_te;
  input [`FIRE_DLC_MMU_PAB_ERR_BITS]	pab2tcb_err;
  input 				ptb2tcb_hit;
  input 				rcb2tcb_ack;
  input [`FIRE_DLC_MMU_RCB_ERR_BITS]	rcb2tcb_err;
  input [`FIRE_DLC_MMU_TAG_PTR_BITS]	rcb2tcb_tag;
  input 				rcb2tcb_vld;
  input 				tlb2tcb_hit;
  input [`FIRE_DLC_MMU_VAB_ERR_BITS]	vab2tcb_err;
  input [`FIRE_DLC_MMU_VAB_VLD_BITS]	vab2tcb_vld;
  input 				vab2tcb_sun4v_va_oor;
  input 				vab2tcb_4vor;
  input 				vab2tcb_s4uf;
  input 				qcb2tcb_hld;
  input 				qcb2tcb_vld;
  input 				vtb2tcb_hit;
  input 				vaq2tcb_deq_en;
  input 				tdb2tmc_kerr;
  input 				tlb2tmc_kerr;
  input 				srq2tmc_ipe;
  input 				srq2tmc_ivld;
  input 				sun4v_mode;
  input 				srq2tmc_sun4v_pgsz_err;

  output				tcb2crb_req;
  output [`FIRE_DBG_DATA_BITS]		tcb2csr_dbg_a;
  output [`FIRE_DBG_DATA_BITS]		tcb2csr_dbg_b;
  output [`FIRE_DLC_MMU_CSR_ERR_BITS]	tcb2csr_err;
  output [`FIRE_DLC_MMU_TCB_PRF_BITS]	tcb2csr_prf;
  output [`FIRE_DLC_MMU_CSR_CM_BITS]	tcb2csr_tcm;
  output				tcb2csr_tip;
  output				tcb2csr_tpl;
  output				tcb2pab_err;
  output				tcb2pab_sel;
  output				tcb2ptb_sel;
  output				tcb2ptb_vld;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2ptb_wa;
  output				tcb2ptb_we;
  output				tcb2qcb_hld;
  output [`FIRE_DLC_MMU_PLS_DPTH:1]	tcb2qcb_vld;
  output				tcb2rcb_req;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2rcb_tag;
  output				tcb2tdb_sel;
  output [`FIRE_DLC_MMU_TDB_PTR_BITS]	tcb2tdb_wa;
  output				tcb2tdb_we;
  output				tcb2tlb_dld;
  output				tcb2tlb_hld;
  output [`FILE_DLC_MMU_TTE_CNT_BITS]	tcb2tlb_ra;
  output				tcb2tlb_ras;
  output				tcb2tlb_sel;
  output				tcb2tlb_tld;
  output				tcb2vab_hld;
  output				tcb2vtb_hld;
  output				tcb2vtb_sel;
  output				tcb2vtb_tmv;
  output				tcb2vtb_vld;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2vtb_wa;
  output				tcb2vtb_we;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
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
  wire					tcb2rcb_req;
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
  wire					tcc2tdc_cld;
  wire					tcc2tdc_req;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcc2tdc_tag;
  wire					tcc2tmc_ack;
  wire [`FIRE_DBG_DATA_BITS]		tcc2tmc_dbg;
  wire					tcc2tmc_vld;
  wire					tdc2tcc_ack;
  wire					tdc2tcc_err;
  wire [`FIRE_DBG_DATA_BITS]		tdc2tmc_dbg;
  wire [`FIRE_DLC_MMU_TDC_ERR_BITS]	tdc2tmc_err;
  wire					tmc2tcc_req;
  wire					srq2tmc_ivld;
  wire					sun4v_mode;

// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------
  dmu_mmu_tcb_tcc tcc
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .crb2tcb_tag	(crb2tcb_tag),
     .csr2tcb_cm	(csr2tcb_cm),
     .ptb2tcb_hit	(ptb2tcb_hit),
     .rcb2tcb_ack	(rcb2tcb_ack),
     .tdc2tcc_ack	(tdc2tcc_ack),
     .tdc2tcc_err	(tdc2tcc_err),
     .tmc2tcc_req	(tmc2tcc_req),
     .tcb2crb_req	(tcb2crb_req),
     .tcb2csr_tcm	(tcb2csr_tcm),
     .tcb2csr_tip	(tcb2csr_tip),
     .tcb2ptb_sel	(tcb2ptb_sel),
     .tcb2ptb_vld	(tcb2ptb_vld),
     .tcb2ptb_wa	(tcb2ptb_wa),
     .tcb2ptb_we	(tcb2ptb_we),
     .tcb2rcb_req	(tcb2rcb_req),
     .tcb2rcb_tag	(tcb2rcb_tag),
     .tcb2tdb_sel	(tcb2tdb_sel),
     .tcb2tlb_tld	(tcb2tlb_tld),
     .tcb2vtb_sel	(tcb2vtb_sel),
     .tcb2vtb_vld	(tcb2vtb_vld),
     .tcb2vtb_wa	(tcb2vtb_wa),
     .tcb2vtb_we	(tcb2vtb_we),
     .tcc2tdc_cld	(tcc2tdc_cld),
     .tcc2tdc_req	(tcc2tdc_req),
     .tcc2tdc_tag	(tcc2tdc_tag),
     .tcc2tmc_ack	(tcc2tmc_ack),
     .tcc2tmc_dbg	(tcc2tmc_dbg),
     .tcc2tmc_vld	(tcc2tmc_vld)
     );

  dmu_mmu_tcb_tdc tdc
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .rcb2tcb_err	(rcb2tcb_err),
     .rcb2tcb_tag	(rcb2tcb_tag),
     .rcb2tcb_vld	(rcb2tcb_vld),
     .tcc2tdc_cld	(tcc2tdc_cld),
     .tcc2tdc_req	(tcc2tdc_req),
     .tcc2tdc_tag	(tcc2tdc_tag),
     .tcb2tdb_wa	(tcb2tdb_wa),
     .tcb2tdb_we	(tcb2tdb_we),
     .tcb2tlb_dld	(tcb2tlb_dld),
     .tcb2tlb_ra	(tcb2tlb_ra),
     .tcb2tlb_ras	(tcb2tlb_ras),
     .tdc2tcc_ack	(tdc2tcc_ack),
     .tdc2tcc_err	(tdc2tcc_err),
     .tdc2tmc_dbg	(tdc2tmc_dbg),
     .tdc2tmc_err	(tdc2tmc_err)
     );

  dmu_mmu_tcb_tmc tmc
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .csr2tcb_av	(csr2tcb_av),
     .csr2tcb_be	(csr2tcb_be),
     .csr2tcb_cm	(csr2tcb_cm),
     .csr2tcb_ds_a	(csr2tcb_ds_a),
     .csr2tcb_ds_b	(csr2tcb_ds_b),
     .csr2tcb_pd	(csr2tcb_pd),
     .csr2tcb_te	(csr2tcb_te),
     .pab2tcb_err	(pab2tcb_err),
     .tlb2tcb_hit	(tlb2tcb_hit),
     .vab2tcb_err	(vab2tcb_err),
     .vab2tcb_vld	(vab2tcb_vld),
     .vab2tcb_sun4v_va_oor (vab2tcb_sun4v_va_oor),
     .vab2tcb_4vor	(vab2tcb_4vor),
     .vab2tcb_s4uf	(vab2tcb_s4uf),
     .qcb2tcb_hld	(qcb2tcb_hld),
     .qcb2tcb_vld	(qcb2tcb_vld),
     .vtb2tcb_hit	(vtb2tcb_hit),
     .tcc2tmc_ack	(tcc2tmc_ack),
     .tcc2tmc_dbg	(tcc2tmc_dbg),
     .tcc2tmc_vld	(tcc2tmc_vld),
     .tdc2tmc_dbg	(tdc2tmc_dbg),
     .tdc2tmc_err	(tdc2tmc_err),
     .tcb2csr_dbg_a	(tcb2csr_dbg_a),
     .tcb2csr_dbg_b	(tcb2csr_dbg_b),
     .tcb2csr_err	(tcb2csr_err),
     .tcb2csr_prf	(tcb2csr_prf),
     .tcb2csr_tpl	(tcb2csr_tpl),
     .tcb2pab_err	(tcb2pab_err),
     .tcb2pab_sel	(tcb2pab_sel),
     .tcb2qcb_hld	(tcb2qcb_hld),
     .tcb2qcb_vld	(tcb2qcb_vld),
     .tcb2tlb_hld	(tcb2tlb_hld),
     .tcb2tlb_sel	(tcb2tlb_sel),
     .tcb2vab_hld	(tcb2vab_hld),
     .tcb2vtb_hld	(tcb2vtb_hld),
     .tcb2vtb_tmv	(tcb2vtb_tmv),
     .vaq2tcb_deq_en    (vaq2tcb_deq_en),
     .tmc2tcc_req	(tmc2tcc_req),
     .tdb2tmc_kerr	(tdb2tmc_kerr),
     .tlb2tmc_kerr	(tlb2tmc_kerr),
     .srq2tmc_ipe	(srq2tmc_ipe),
     .srq2tmc_ivld	(srq2tmc_ivld),
     .sun4v_mode	(sun4v_mode),
     .srq2tmc_sun4v_pgsz_err	(srq2tmc_sun4v_pgsz_err)
     );

endmodule // dmu_mmu_tcb
