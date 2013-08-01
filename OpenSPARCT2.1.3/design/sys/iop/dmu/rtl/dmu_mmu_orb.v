// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_orb.v
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
module dmu_mmu_orb 
  (
   cm2mm_rcd_full,		// cmu isr queue full
   qcb2orb_enq,			// qcb enqueue
   rdq2orb_rcd,			// rdq rcr record
   paq2orb_rcd,			// paq par record
   mm2cm_rcd,			// cmu isr record
   mm2cm_rcd_enq,		// cmu isr record enqueue
   orb2qcb_full			// qcb queue full
   );
     
// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input 				cm2mm_rcd_full;
  input 				qcb2orb_enq;
  input  [`FIRE_DLC_MMU_RDR_BITS]	rdq2orb_rcd;
  input  [`FIRE_DLC_MMU_PAR_BITS]	paq2orb_rcd;

  output [`FIRE_DLC_ISR_BITS]		mm2cm_rcd;
  output				mm2cm_rcd_enq;
  output				orb2qcb_full;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire 					mm2cm_rcd_enq;
  wire 					orb2qcb_full;
  wire [`FIRE_DLC_ISR_BITS]		mm2cm_rcd;

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
  assign mm2cm_rcd_enq = qcb2orb_enq;
  assign orb2qcb_full  = cm2mm_rcd_full;

  assign mm2cm_rcd[`FIRE_DLC_ISR_SBDTAG_BITS]  = rdq2orb_rcd[`FIRE_DLC_MMU_RDR_STAG_BITS];
  assign mm2cm_rcd[`FIRE_DLC_ISR_DPTR_BITS]    = rdq2orb_rcd[`FIRE_DLC_MMU_RDR_DPTR_BITS];
  assign mm2cm_rcd[`FIRE_DLC_ISR_ADDRERR_BITS] = paq2orb_rcd[`FIRE_DLC_MMU_PAR_AERR_BITS];
  assign mm2cm_rcd[`FIRE_DLC_ISR_ADDR_BITS]    = paq2orb_rcd[`FIRE_DLC_MMU_PAR_ADDR_BITS];
  assign mm2cm_rcd[`FIRE_DLC_ISR_DWBE_BITS]    = rdq2orb_rcd[`FIRE_DLC_MMU_RDR_DWBE_BITS];
  assign mm2cm_rcd[`FIRE_DLC_ISR_LEN_BITS]     = rdq2orb_rcd[`FIRE_DLC_MMU_RDR_LGTH_BITS];
  assign mm2cm_rcd[`FIRE_DLC_ISR_TYP_BITS]     = paq2orb_rcd[`FIRE_DLC_MMU_PAR_TYPE_BITS];

endmodule // dmu_mmu_orb
