/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: immu_miss_handler.s
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
#ifdef EX_TRAPCHECK
	! extended trapcheck returns traptype
	mov	0x64,	%o0
#endif
	mov	ASI_IMMU_TAG_ACCESS_VAL, %g7
	ldxa	[%g7] ASI_IMMU_TAG_REG, %g6		! get va/context from tag-access

    ! N2 N2 N2 N2 ptr register not implemented.
	!ldxa	[%g0] 0x51, %g1		! immu ps0 ptr

    ! N2 N2 N2 N2 ptr register not implemented.
    ! SW Implementation of PTR register calQlations

iconfig_0:
    ! Load ZERO CTX TSB_CONFIG address in %g7
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %g7

immu_tsbptr_calc:
#include <mmu_ptr_calc.s>

#ifdef MIMIC_SOLARIS
	srlx	%g0, %g0, %g0
	brnz	%g0, HT0_Fast_Instr_Access_MMU_Miss_0x64
	sll	%g0, %g0, %g0
	xor	%g0, %g0, %g0
#endif
    ba iload_entry
    nop
    nop
    nop
    nop
