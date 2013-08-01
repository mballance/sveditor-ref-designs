/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: Bug103049.s
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
#define MAIN_PAGE_HV_ALSO
#define RESET_STAT_CHECK
#define RESET_CHECK_REG
	
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
        inc     %l0;\
        done; nop

#include "hboot.s"
#include "rst_defines.h"

/*
Test case code start
*/
.text
.global main
main:

        ta T_CHANGE_HPRIV
        nop


! ASI_OVERLAP_MODE - access not implemented. See bug 103105
! trying to access it should cause an exception
	
	mov	0, %l0			! interrupt count
	mov	0x10, %g1
	ldxa	[%g1]ASI_LSU_CONTROL, %g1

	cmp	%l0, 0
	be	test_failed		! should have taken an interrupt
	nop

! ASI_WMR_VEC_MASK (asi  0x45)
	
	mov	0x18, %g1
	ldxa	[%g1]ASI_LSU_CONTROL, %g1

! ASI_CMP_CORE (asi 0x41)

	mov	ASI_CMP_CORE_AVAIL, %g1
	ldxa	[%g1]ASI_CMP_CORE, %g1

	mov	ASI_CMP_CORE_ENABLED, %g1
	ldxa	[%g1]ASI_CMP_CORE, %g1

	mov	ASI_CMP_CORE_ENABLE, %g1
	ldxa	[%g1]ASI_CMP_CORE, %g1

	mov	ASI_CMP_XIR_STEERING, %g1
	ldxa	[%g1]ASI_CMP_CORE, %g1

	mov	ASI_CMP_TICK_ENABLE, %g1
	ldxa	[%g1]ASI_CMP_CORE, %g1

	mov	ASI_CMP_CORE_RUNNING_RW, %g1
	ldxa	[%g1]ASI_CMP_CORE, %g1

	mov	ASI_CMP_CORE_RUNNING_STATUS, %g1
	ldxa	[%g1]ASI_CMP_CORE, %g1

	mov	0, %l0			! interrupt count
	mov	ASI_CMP_CORE_RUNNING_W1S, %g1
	ldxa	[%g1]ASI_CMP_CORE, %g1

	cmp	%l0, 0
	be	test_failed		! should have taken an interrupt
	nop

	mov	0, %l0			! interrupt count
	mov	ASI_CMP_CORE_RUNNING_W1C, %g1
	ldxa	[%g1]ASI_CMP_CORE, %g1

	cmp	%l0, 0
	be	test_failed		! should have taken an interrupt
	nop

do_SUBSYSTEM_RESET:
        setx    0x8900000800, %g1, %g5		! RST base addr + 0x800
        mov	RST_SSYS_RESET__DMU_PEU, %g7	! subsystem reset reg data
        stx     %g7, [%g5+0x38]			! Subsystem Reset
	
	mov	255, %l0			! loop timeout count
	
Wait4SsysReset:
	ldx     [%g5+0x38], %l7		!  check if reset bit has cleared
	brz	%l7, read_other_rst_regs
	nop
	dec	%l0
	brnz	%l0, Wait4SsysReset
	nop
	ba	test_failed		! Subsystem reset should have completed
	nop

read_other_rst_regs:
	ldx     [%g5+0x08], %l0	
	ldx     [%g5+0x10], %l1		
	ldx     [%g5+0x18], %l2		
	ldx     [%g5+0x20], %l3		
	ldx     [%g5+0x38], %l4		
!	ldx     [%g5+0x70], %l5		
!	ldx     [%g5+0x80], %l6		
!	ldx     [%g5+0x90], %l7		
	nop
	
test_passed:
	EXIT_GOOD
	
test_failed:
	EXIT_BAD

