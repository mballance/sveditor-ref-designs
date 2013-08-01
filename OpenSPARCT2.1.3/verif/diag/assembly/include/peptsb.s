/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: peptsb.s
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
SECTION eng_blk BSS_VA=0x03330000
attr_bss {
      Name = eng_blk,
	VA=0x03330000,
        RA=0x03330000,	
        PA=0x03330000,
        tsbonly,
        TTE_G=0,
        TTE_Context=PCONTEXT, 
        TTE_V=1,
	TTE_Size=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=1,
	TTE_P=0,
	TTE_W=1,
	TTE_EP=0,	
        part_0_ctx_nonzero_tsb_config_1
}
.section .bss
.global eng_blk
eng_blk:
.lcomm _empty_blk_start, 0x1000
.lcomm _empty_blk_end, 0
.end

// Use a 256MB page for the DMA Data area.

SECTION dma_data BSS_VA=0x1d0000000
attr_bss {
      Name = dma_data,
	VA=0x1d0000000,
        RA=0x1d0000000,
        PA=0x1d0000000,
        tsbonly,
        TTE_G=0,
        TTE_Context=PCONTEXT,
        TTE_V=1,
	TTE_Size=5,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=1,
	TTE_P=0,
	TTE_W=1,
	TTE_EP=0,
        part_0_ctx_nonzero_tsb_config_3
}
.section .bss
.global dma_data
dma_data:   
.lcomm _empty_blk_start, 256*1024*1024
.lcomm _empty_blk_end, 0
.end

SECTION eng_cfg_base BSS_VA=0x00600000
attr_bss {
        Name = eng_cfg_base,
	VA=0x00600000,
        RA=BOBO_PA,
        PA=BOBO_PA,
        tsbonly,
        TTE_G=0,
        TTE_Context=PCONTEXT, 
        TTE_V=1,
	TTE_Size=1,
	TTE_NFO=0,
	TTE_IE=1,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=0,
	TTE_CV=0,
	TTE_E=1,
	TTE_P=0,
	TTE_W=1,
	TTE_EP=0,	
        part_0_ctx_nonzero_tsb_config_2
}
.section .bss
.global eng_cfg_base
eng_cfg_base:   
.lcomm start, DMAEPT_MEM_SIZE
.lcomm end, 0
.end
