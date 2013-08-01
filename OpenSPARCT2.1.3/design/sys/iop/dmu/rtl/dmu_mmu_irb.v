// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_irb.v
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
module dmu_mmu_irb 
  (
   rm2mm_rcd,			// rmu srm record
   rm2mm_rcd_enq,		// rmu srm record enqueue
   qcb2irb_full,		// cmu isr queue full
   mm2rm_rcd_full,		// rmu srm queue full
   irb2qcb_enq,			// qcb enqueue
   irb2rdq_rcd,			// rdq rdr record
   irb2vaq_rcd			// vaq var record
   );
     
// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input  [`FIRE_DLC_SRM_BITS]		rm2mm_rcd;
  input 				rm2mm_rcd_enq;
  input 				qcb2irb_full;

  output				mm2rm_rcd_full;
  output				irb2qcb_enq;
  output [`FIRE_DLC_MMU_RDR_BITS]	irb2rdq_rcd;
  output [`FIRE_DLC_MMU_VAR_BITS]	irb2vaq_rcd;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire					mm2rm_rcd_full;
  wire					irb2qcb_enq;
  wire [`FIRE_DLC_MMU_RDR_BITS] 	irb2rdq_rcd;
  wire [`FIRE_DLC_MMU_VAR_BITS] 	irb2vaq_rcd;

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
  assign mm2rm_rcd_full = qcb2irb_full;
  assign irb2qcb_enq    = rm2mm_rcd_enq;

  assign irb2rdq_rcd[`FIRE_DLC_MMU_RDR_STAG_BITS] = rm2mm_rcd[`FIRE_DLC_SRM_SBDTAG_BITS];
  assign irb2rdq_rcd[`FIRE_DLC_MMU_RDR_DPTR_BITS] = rm2mm_rcd[`FIRE_DLC_SRM_DPTR_BITS];
  assign irb2rdq_rcd[`FIRE_DLC_MMU_RDR_DWBE_BITS] = rm2mm_rcd[`FIRE_DLC_SRM_DWBE_BITS];
  assign irb2rdq_rcd[`FIRE_DLC_MMU_RDR_LGTH_BITS] = rm2mm_rcd[`FIRE_DLC_SRM_LEN_BITS];

  assign irb2vaq_rcd[`FIRE_DLC_MMU_VAR_ADDR_BITS] = rm2mm_rcd[`FIRE_DLC_SRM_ADDR_BITS];
  assign irb2vaq_rcd[`FIRE_DLC_MMU_VAR_RQID_BITS] = rm2mm_rcd[`FIRE_DLC_SRM_REQID_BITS];
  assign irb2vaq_rcd[`FIRE_DLC_MMU_VAR_TYPE_BITS] = rm2mm_rcd[`FIRE_DLC_SRM_TYPE_BITS];

endmodule // dmu_mmu_irb
