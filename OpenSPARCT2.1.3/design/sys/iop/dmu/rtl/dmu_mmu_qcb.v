// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_qcb.v
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
module dmu_mmu_qcb 
  (
   clk,				// clock
   rst_l,			// reset
   csr2qcb_ds_a,		// csr debug select a
   csr2qcb_ds_b,		// csr debug select b
   irb2qcb_enq,			// irb srm enqueue
   orb2qcb_full,		// orb isr queue full
   tcb2qcb_hld,			// tcb hold
   tcb2qcb_vld,			// tcb valid bits
   qcb2csr_dbg_a,		// csr debug bus a
   qcb2csr_dbg_b,		// csr debug bus b
   qcb2csr_paq,			// csr physical address queue not empty
   qcb2csr_vaq,			// csr virtual address queue not empty
   qcb2irb_full,		// irb queue full
   qcb2orb_enq,			// orb srm enqueue
   qcb2paq_ld,			// paq load
   qcb2paq_ds,			// paq data select
   qcb2rdq_ld,			// rdq load
   qcb2rdq_ds,			// rdq data select
   qcb2tcb_hld,			// tcb hold
   qcb2tcb_vld,			// tcb valid
   qcb2vaq_ld,			// vaq load
   qcb2vaq_ds			// vaq data select
   );

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input  [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2qcb_ds_a;
  input  [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2qcb_ds_b;
  input 				irb2qcb_enq;
  input 				orb2qcb_full;
  input 				tcb2qcb_hld;
  input  [`FIRE_DLC_MMU_PLS_DPTH:1] 	tcb2qcb_vld;

  output [`FIRE_DBG_DATA_BITS]		qcb2csr_dbg_a;
  output [`FIRE_DBG_DATA_BITS]		qcb2csr_dbg_b;
  output				qcb2csr_paq;
  output				qcb2csr_vaq;
  output				qcb2irb_full;
  output				qcb2orb_enq;
  output [`FIRE_DLC_MMU_PAQ_DPTH-1:0] 	qcb2paq_ld;
  output [`FIRE_DLC_MMU_PAQ_DPTH-2:0] 	qcb2paq_ds;
  output [`FIRE_DLC_MMU_RDQ_DPTH-1:0] 	qcb2rdq_ld;
  output [`FIRE_DLC_MMU_RDQ_DPTH-2:0] 	qcb2rdq_ds;
  output				qcb2tcb_hld;
  output				qcb2tcb_vld;
  output [`FIRE_DLC_MMU_VAQ_DPTH-1:0] 	qcb2vaq_ld;
  output [`FIRE_DLC_MMU_VAQ_DPTH-2:0] 	qcb2vaq_ds;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DBG_DATA_BITS]		qcb2csr_dbg_a;
  wire [`FIRE_DBG_DATA_BITS]		qcb2csr_dbg_b;
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

  wire [`FIRE_DLC_MMU_PAQ_DPTH-1:0]	qpc2qmc_vld;
  wire [`FIRE_DLC_MMU_RDQ_DPTH-1:0]	qrc2qmc_vld;
  wire					qmc2qpc_enq;
  wire					qmc2qpc_deq;
  wire					qmc2qrc_enq;
  wire					qmc2qrc_deq;
  wire					qmc2qvc_enq;
  wire					qmc2qvc_deq;
  wire [`FIRE_DLC_MMU_VAQ_DPTH-1:0]	qvc2qmc_vld;

// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------
  dmu_mmu_qcb_qmc qmc
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .csr2qcb_ds_a	(csr2qcb_ds_a),
     .csr2qcb_ds_b	(csr2qcb_ds_b),
     .irb2qcb_enq	(irb2qcb_enq),
     .orb2qcb_full	(orb2qcb_full),
     .tcb2qcb_hld	(tcb2qcb_hld),
     .tcb2qcb_vld	(tcb2qcb_vld),
     .qpc2qmc_vld	(qpc2qmc_vld),
     .qrc2qmc_vld	(qrc2qmc_vld),
     .qvc2qmc_vld	(qvc2qmc_vld),
     .qcb2csr_dbg_a	(qcb2csr_dbg_a),
     .qcb2csr_dbg_b	(qcb2csr_dbg_b),
     .qcb2csr_paq	(qcb2csr_paq),
     .qcb2csr_vaq	(qcb2csr_vaq),
     .qcb2irb_full	(qcb2irb_full),
     .qcb2orb_enq	(qcb2orb_enq),
     .qcb2tcb_hld	(qcb2tcb_hld),
     .qcb2tcb_vld	(qcb2tcb_vld),
     .qmc2qpc_enq	(qmc2qpc_enq),
     .qmc2qpc_deq	(qmc2qpc_deq),
     .qmc2qrc_enq	(qmc2qrc_enq),
     .qmc2qrc_deq	(qmc2qrc_deq),
     .qmc2qvc_enq	(qmc2qvc_enq),
     .qmc2qvc_deq	(qmc2qvc_deq)
     );

  dmu_mmu_qcb_qgc #(`FIRE_DLC_MMU_PAQ_DPTH) qpc
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .enq		(qmc2qpc_enq),
     .deq		(qmc2qpc_deq),
     .ld		(qcb2paq_ld),
     .ds		(qcb2paq_ds),
     .vld		(qpc2qmc_vld)
     );

  dmu_mmu_qcb_qgc #(`FIRE_DLC_MMU_RDQ_DPTH) qrc
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .enq		(qmc2qrc_enq),
     .deq		(qmc2qrc_deq),
     .ld		(qcb2rdq_ld),
     .ds		(qcb2rdq_ds),
     .vld		(qrc2qmc_vld)
     );

  dmu_mmu_qcb_qgc #(`FIRE_DLC_MMU_VAQ_DPTH) qvc
    (
     .clk		(clk),
     .rst_l		(rst_l),
     .enq		(qmc2qvc_enq),
     .deq		(qmc2qvc_deq),
     .ld		(qcb2vaq_ld),
     .ds		(qcb2vaq_ds),
     .vld		(qvc2qmc_vld)
     );

endmodule // dmu_mmu_qcb
